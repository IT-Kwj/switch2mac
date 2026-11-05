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
    float4 m_78 [[user(locn1)]];
    float4 m_76 [[user(locn2)]];
    float4 m_90 [[user(locn3)]];
    float4 m_98 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_80 [[user(locn6)]];
    float4 m_84 [[user(locn7)]];
    float4 m_86 [[user(locn8)]];
    float4 m_88 [[user(locn9)]];
    float4 m_82 [[user(locn10)]];
    float4 m_96 [[user(locn11)]];
    float4 m_92 [[user(locn12)]];
    float4 m_94 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
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
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4145 = false;
    bool _2838 = false;
    bool _953 = false;
    bool _781 = false;
    bool _563 = false;
    bool _387 = false;
    bool _239 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_58.w;
    float _114 = trunc(_112);
    int _117 = int(_114);
    bool _121 = _117 >= 1;
    float _123 = 0.0;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    float _127 = _125;
    if (!_121)
    {
        out.m_61.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _125 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4430 = as_type<float>(_133);
        out.gl_Position.z = _4430;
    }
    if (!_121)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = in.m_63.w;
    bool _139 = _137 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_137);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = -_137;
    float _151 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_147)
    {
        float _153 = float(_117);
        _127 = _153;
    }
    float _155 = _127;
    bool _157 = _151 >= _155;
    bool _159 = !_147;
    bool _161 = _157 || _159;
    float _163 = _155;
    if (_161)
    {
        _163 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _163;
    if (_161)
    {
        out.m_61.x = 0.0;
    }
    if (_161)
    {
        float _167 = _165 * 5.0;
        _135 = as_type<int>(_167);
    }
    int _169 = _135;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4499 = as_type<float>(_169);
        out.gl_Position.z = _4499;
    }
    if (_161)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _171 = as_type<float>(int(gl_VertexIndex));
    float _173 = in.m_68.x;
    float _175 = in.m_68.y;
    float _177 = in.m_68.z;
    int _179 = as_type<int>(_171) & 1;
    bool _181 = _179 != 0;
    int _183 = as_type<int>(_171) & 2;
    bool _185 = _183 != 0;
    bool _187 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _189 = _175 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _191 = _175 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _193 = _175 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _195 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[4].x, _189);
    float _197 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[5].x, _191);
    float _199 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[6].x, _193);
    float _201 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[4].z, _195);
    float _203 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[5].z, _197);
    float _205 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[6].z, _199);
    bool _207 = !_181;
    float _209 = _207 ? (-0.5) : 0.5;
    bool _211 = !_185;
    float _213 = _211 ? (-0.5) : 0.5;
    bool _215 = !_187;
    float _217 = _213;
    int _219 = as_type<int>(_203);
    float _237;
    if (!_215)
    {
        float _221 = in.m_70.x;
        float _223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _225 = _221 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _227 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[12].x, _151);
        float _229 = _227 * _223;
        float _231 = floor(_229);
        float _233 = -_231;
        float _235 = _229 + _233;
        _237 = _235;
        _239 = true;
    }
    else
    {
        float _241 = float(_117);
        float _243 = 1.0 / _241;
        float _245 = _151 * _243;
        _237 = _245;
    }
    _239 = false;
    float _247 = _237;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _251 = _247 + _249;
    bool _253 = _247 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _255 = isnan(_247);
    bool _257 = _253 || _255;
    bool _259 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _261 = _257 || _259;
    float _263 = float(_261);
    bool _265 = _247 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _267 = isnan(_247);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _283 = _281 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _285 = -_263;
    float _287 = _285 + 1.0;
    float _289 = 1.0 / _279;
    bool _291 = _247 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _293 = isnan(_247);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = _275 * _287;
    float _305 = -_275;
    float _307 = _305 + 1.0;
    bool _309 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _311 = _301 * _307;
    float _313 = 1.0 / _283;
    float _315 = -_301;
    float _317 = _315 + 1.0;
    float _319 = _251 * _289;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _323 = _247 + _321;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _325;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _329;
    float _333 = fma(_327, _319, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _335 = fma(_331, _319, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _337 = _323 * _313;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _343 = _333 * _311;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _349 = _335 * _311;
    float _351 = fma(_341, _337, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _353 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[143].x, _343);
    float _355 = fma(_347, _337, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _357 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[143].y, _349);
    float _359 = fma(_351, _303, _353);
    float _361 = fma(_355, _303, _357);
    float _363 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[145].x, _359);
    float _365 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[145].y, _361);
    bool _367 = !_309;
    float _385;
    if (!_367)
    {
        float _369 = in.m_70.x;
        float _371 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _373 = _369 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _375 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[11].x, _151);
        float _377 = _375 * _371;
        float _379 = floor(_377);
        float _381 = -_379;
        float _383 = _377 + _381;
        _385 = _383;
        _387 = true;
    }
    else
    {
        float _389 = float(_117);
        float _391 = 1.0 / _389;
        float _393 = _151 * _391;
        _385 = _393;
    }
    _387 = false;
    float _395 = _385;
    float _397 = in.m_72.x;
    float _399 = in.m_72.y;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _403 = _395 + _401;
    bool _405 = _395 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _407 = isnan(_395);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _417;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _425 = _395 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _427 = isnan(_395);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    float _437 = 1.0 / _423;
    bool _439 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _441 = 1.0 / _419;
    float _443 = _365 * _399;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _447 = _395 + _445;
    bool _449 = _395 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _451 = isnan(_395);
    bool _453 = _449 || _451;
    bool _455 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _457 = _453 || _455;
    float _459 = float(_457);
    float _461 = _363 * _397;
    float _463 = _447 * _437;
    float _465 = -_459;
    float _467 = _465 + 1.0;
    float _469 = _403 * _441;
    float _471 = -_415;
    float _473 = _471 + 1.0;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _475;
    float _479 = _435 * _467;
    float _481 = -_435;
    float _483 = _481 + 1.0;
    float _485 = _459 * _473;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _487;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _491;
    float _495 = fma(_477, _469, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _497 = fma(_489, _469, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _499 = fma(_493, _469, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _501 = _495 * _479;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _505 = _503 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _507 = _497 * _479;
    float _509 = _499 * _479;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _519 = fma(_505, _463, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _521 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[107].x, _507);
    float _523 = fma(_513, _463, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _525 = fma(_517, _463, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _527 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[107].y, _501);
    float _529 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[107].z, _509);
    float _531 = fma(_523, _485, _521);
    float _533 = fma(_519, _485, _527);
    float _535 = fma(_525, _485, _529);
    float _537 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[109].x, _531);
    float _539 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[109].y, _533);
    float _541 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[109].z, _535);
    bool _543 = !_439;
    float _561;
    if (!_543)
    {
        float _545 = in.m_70.x;
        float _547 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _549 = _545 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _551 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[11].y, _151);
        float _553 = _551 * _547;
        float _555 = floor(_553);
        float _557 = -_555;
        float _559 = _553 + _557;
        _561 = _559;
        _563 = true;
    }
    else
    {
        float _565 = float(_117);
        float _567 = 1.0 / _565;
        float _569 = _151 * _567;
        _561 = _569;
    }
    _563 = false;
    float _571 = _561;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _575 = _571 + _573;
    float _577 = _537 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _581 = _579 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _583;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _589 = _587 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _591 = _571 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _593 = isnan(_571);
    bool _595 = _591 || _593;
    bool _597 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _599 = _595 || _597;
    float _601 = float(_599);
    float _603 = 1.0 / _581;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _609 = _571 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _611 = isnan(_571);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = _539 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _623 = _541 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _625 = _577 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _627 = _621 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _629 = 1.0 / _589;
    float _631 = _623 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _633 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _635 = _585 * _603;
    bool _637 = _571 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _639 = isnan(_571);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _645 = _641 || _643;
    float _647 = float(_645);
    float _649 = 1.0 / _607;
    float _651 = -_601;
    float _653 = _651 + 1.0;
    float _655 = fma(_635, _575, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _661 = _571 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _663 = isnan(_571);
    bool _665 = _661 || _663;
    bool _667 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _669 = _665 || _667;
    float _671 = float(_669);
    float _673 = -_647;
    float _675 = _673 + 1.0;
    float _677 = _647 * _653;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _681 = _679 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _683 = 1.0 / _659;
    float _685 = -_671;
    float _687 = _685 + 1.0;
    float _689 = _619 * _675;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _691;
    float _695 = _681 * _629;
    float _697 = _601 * _687;
    float _699 = _655 * _689;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _703 = _571 + _701;
    float _705 = -_619;
    float _707 = _705 + 1.0;
    bool _709 = _571 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _711 = isnan(_571);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = _693 * _649;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _725 = _723 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _729 = _571 + _727;
    float _731 = fma(_695, _703, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _733 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[115].x, _699);
    float _735 = -_719;
    float _737 = _735 + 1.0;
    float _739 = _725 * _683;
    float _741 = fma(_721, _729, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _745 = _571 + _743;
    float _747 = fma(_731, _677, _733);
    float _749 = _671 * _737;
    float _751 = fma(_739, _745, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _753 = fma(_741, _697, _747);
    float _755 = fma(_751, _749, _753);
    float _757 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[119].x, _755);
    float _759 = _757 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_74.x = _625;
    out.m_74.y = _627;
    out.m_74.z = _631;
    out.m_74.w = _759;
    bool _761 = !_633;
    float _779;
    if (!_761)
    {
        float _763 = in.m_70.x;
        float _765 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _767 = _763 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _769 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[11].z, _151);
        float _771 = _769 * _765;
        float _773 = floor(_771);
        float _775 = -_773;
        float _777 = _771 + _775;
        _779 = _777;
        _781 = true;
    }
    else
    {
        float _783 = float(_117);
        float _785 = 1.0 / _783;
        float _787 = _151 * _785;
        _779 = _787;
    }
    _781 = false;
    float _789 = _779;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _793 = _789 + _791;
    bool _795 = _789 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _797 = isnan(_789);
    bool _799 = _795 || _797;
    bool _801 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _803 = _799 || _801;
    float _805 = float(_803);
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _809 = _789 + _807;
    bool _811 = _789 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _813 = isnan(_789);
    bool _815 = _811 || _813;
    bool _817 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _819 = _815 || _817;
    float _821 = float(_819);
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _823;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _829 = _827 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _831 = _789 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _833 = isnan(_789);
    bool _835 = _831 || _833;
    bool _837 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _839 = _835 || _837;
    float _841 = float(_839);
    float _843 = -_805;
    float _845 = _843 + 1.0;
    float _847 = 1.0 / _829;
    float _849 = _841 * _845;
    float _851 = -_841;
    float _853 = _851 + 1.0;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _855;
    bool _859 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _861 = 1.0 / _825;
    float _863 = _821 * _853;
    float _865 = -_821;
    float _867 = _865 + 1.0;
    float _869 = _793 * _861;
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _871;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _875;
    float _879 = fma(_857, _869, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _881 = fma(_873, _869, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _883 = fma(_877, _869, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _885 = _809 * _847;
    float _887 = _879 * _863;
    float _889 = _881 * _863;
    float _891 = _883 * _863;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _895 = _893 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _899 = _897 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _901 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _903 = _901 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _905 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[123].x, _887);
    float _907 = fma(_895, _885, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _909 = fma(_899, _885, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _911 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[123].y, _889);
    float _913 = fma(_903, _885, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _915 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[123].z, _891);
    float _917 = fma(_907, _849, _905);
    float _919 = fma(_909, _849, _911);
    float _921 = fma(_913, _849, _915);
    float _923 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[125].x, _917);
    float _925 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[125].y, _919);
    float _927 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[125].z, _921);
    bool _929 = !_859;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _933 = _923;
    float _951;
    if (!_929)
    {
        float _935 = in.m_70.x;
        float _937 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _939 = _935 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _941 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[11].w, _151);
        float _943 = _941 * _937;
        float _945 = floor(_943);
        float _947 = -_945;
        float _949 = _943 + _947;
        _951 = _949;
        _953 = true;
    }
    else
    {
        float _955 = float(_117);
        float _957 = 1.0 / _955;
        float _959 = _151 * _957;
        _951 = _959;
    }
    _953 = false;
    float _961 = _951;
    float _963 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _965 = int(_963);
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _969 = _961 + _967;
    float _971 = float(_117);
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _975 = _973 != 0;
    float _977 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _979 = int(_977);
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _983 = _981 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _987 = _985 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _989 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _991 = int(_989);
    float _993 = float(_965);
    if (_975)
    {
        float _995 = in.m_70.x;
        _931 = _995;
    }
    float _997 = _931;
    float _999 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1003 = _997;
    if (!_975)
    {
        float _1005 = in.m_70.y;
        _1003 = _1005;
    }
    float _1007 = _1003;
    float _1009 = 1.0 / _993;
    float _1011 = float(uint(_979));
    int _1013 = ~_979;
    int _1015 = _1013 + 1;
    bool _1017 = _979 == 0;
    float _1019 = 1.0 / _1011;
    float _1021 = float(uint(_991));
    float _1023 = _151 * _1009;
    float _1025 = 1.0 / _1021;
    int _1027 = as_type<int>(_1019) + (-2);
    float _1029 = trunc(_1023);
    int _1031 = int(_1029);
    int _1033 = ~_979;
    int _1035 = _1033 + 1;
    float _1037 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1039 = int(_1037);
    int _1041 = as_type<int>(_1025) + (-2);
    float _1043 = float(uint(_1031));
    float _1045 = 1.0 / _971;
    float _1047 = as_type<float>(_1027) * _1043;
    float _1049 = float(_1039);
    float _1051 = trunc(_1047);
    float _1053 = precise::max(_1051, 0.0);
    uint _1056 = uint(_1053);
    float _1058 = 1.0 / _1049;
    int _1060 = _1035 * int(_1056);
    int _1062 = _1060 + _1031;
    float _1064 = float(_979);
    float _1066 = 1.0 / _983;
    float _1068 = float(uint(_1062));
    float _1070 = in.m_70.x;
    float _1072 = in.m_70.y;
    float _1074 = in.m_70.z;
    float _1076 = in.m_70.w;
    float _1078 = _151 * _1058;
    float _1080 = float(_1031);
    float _1082 = as_type<float>(_1027) * _1068;
    float _1084 = _1068;
    if (_975)
    {
        _1084 = 1.0;
    }
    float _1086 = _1084;
    float _1088 = 1.0 / _987;
    float _1090 = _1086;
    if (!_975)
    {
        _1090 = 7.345489978790283203125;
    }
    float _1092 = _1090;
    bool _1094 = _1080 >= _1064;
    bool _1096 = isnan(_1080);
    bool _1098 = _1094 || _1096;
    bool _1100 = isnan(_1064);
    bool _1102 = _1098 || _1100;
    float _1104 = float(_1102);
    float _1106 = trunc(_1082);
    float _1108 = precise::max(_1106, 0.0);
    uint _1110 = uint(_1108);
    float _1112 = trunc(_1078);
    int _1114 = int(_1112);
    int _1116 = int(_1056) + int(_1110);
    float _1118 = _1092 * _1070;
    float _1120 = _1092;
    float _1122 = _1070;
    float _1124 = _1074;
    if (_975)
    {
        _1120 = 1.0;
    }
    float _1126 = _1120;
    float _1128 = _1126;
    if (!_975)
    {
        _1128 = 1.2345600128173828125;
    }
    float _1130 = _1128;
    int _1132 = _1015 * _1116;
    int _1134 = _1132 + _1031;
    float _1136 = floor(_1118);
    float _1138 = float(uint(_1114));
    bool _1140 = uint(_1134) >= uint(_979);
    float _1142 = _1007 * _1130;
    int _1144 = _979 + (-1);
    float _1146 = trunc(_1104);
    int _1148 = int(_1146);
    bool _1150 = !_1140;
    int _1152 = _1150 ? 0 : (-1);
    int _1154 = ~_1116;
    int _1156 = _1154 + _1152;
    int _1158 = _1156 + 1;
    float _1160 = floor(_1142);
    float _1162 = as_type<float>(_1041) * _1138;
    int _1164 = _979 * _1158;
    int _1166 = _1164 + _1031;
    float _1168 = -_1136;
    float _1170 = _1118 + _1168;
    bool _1172 = !_1017;
    int _1174 = _1172 ? _1166 : (-1);
    float _1176 = trunc(_1162);
    float _1178 = precise::max(_1176, 0.0);
    uint _1180 = uint(_1178);
    int _1182 = ~_1148;
    int _1184 = _1182 + 1;
    int _1186 = _1184 + 1;
    float _1188 = _1170 * _1064;
    int _1190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1192 = _1190 != 0;
    int _1194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1196 = _1194 != 0;
    int _1198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1200 = _1198 != 0;
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1204 = _1202 != 0;
    int _1206 = _1174 * _1186;
    float _1208 = -_1160;
    float _1210 = _1142 + _1208;
    int _1212 = ~_991;
    int _1214 = _1212 + 1;
    int _1216 = _1148 * _1144;
    int _1218 = _1216 + _1206;
    float _1220 = _151 * _1045;
    float _1222 = trunc(_1188);
    int _1224 = int(_1222);
    bool _1226 = !_1196;
    int _1228 = _1226 ? 0 : 1;
    float _1230 = _1220 * _1064;
    int _1232 = _1214 * int(_1180);
    int _1234 = _1232 + _1114;
    int _1236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1238 = _1236 != 0;
    bool _1240 = !_1192;
    int _1242 = _1240 ? 0 : 1;
    float _1244 = float(uint(_1234));
    float _1246 = trunc(_1230);
    int _1248 = int(_1246);
    bool _1250 = !_1238;
    int _1252 = _1250 ? 0 : 1;
    int _1254 = abs(_1228);
    float _1256 = as_type<float>(_1041) * _1244;
    int _1258 = abs(_1242);
    int _1260 = abs(_1252);
    int _1262 = _1218 * _1254;
    bool _1264 = !_1200;
    int _1266 = _1264 ? 0 : 1;
    float _1268 = trunc(_1256);
    float _1270 = precise::max(_1268, 0.0);
    uint _1272 = uint(_1270);
    bool _1274 = !_1204;
    int _1276 = _1274 ? 0 : 1;
    int _1278 = _1224 * _1260;
    int _1280 = _1278 + _1031;
    int _1282 = abs(_1266);
    int _1284 = ~_991;
    int _1286 = _1284 + 1;
    int _1288 = _1248 * _1258;
    int _1290 = _1288 + _1262;
    int _1292 = abs(_1276);
    float _1294 = float(_991);
    int _1296 = _1280 * _1282;
    int _1298 = _1296 + _1290;
    float _1300 = float(_1114);
    int _1302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1304 = _1302 != 0;
    int _1306 = _1224 * _1292;
    int _1308 = _1306 + _1298;
    bool _1310 = _1300 >= _1294;
    bool _1312 = isnan(_1300);
    bool _1314 = _1310 || _1312;
    bool _1316 = isnan(_1294);
    bool _1318 = _1314 || _1316;
    float _1320 = float(_1318);
    int _1322 = int(_1180) + int(_1272);
    float _1324 = _1210 * _1294;
    float _1326 = _1220 * _1294;
    float _1328 = float(uint(_1308));
    float _1330 = trunc(_1320);
    int _1332 = int(_1330);
    int _1334 = _1286 * _1322;
    int _1336 = _1334 + _1114;
    float _1338 = as_type<float>(_1027) * _1328;
    bool _1340 = !_1304;
    int _1342 = _1340 ? 0 : 1;
    bool _1344 = uint(_1336) >= uint(_991);
    float _1346 = trunc(_1324);
    int _1348 = int(_1346);
    int _1350 = abs(_1342);
    bool _1352 = !_1344;
    int _1354 = _1352 ? 0 : (-1);
    int _1356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1358 = _1356 != 0;
    int _1360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1362 = _1360 != 0;
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1366 = _1364 != 0;
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1370 = _1368 != 0;
    int _1372 = ~_1322;
    int _1374 = _1372 + _1354;
    int _1376 = _1374 + 1;
    float _1378 = trunc(_1338);
    float _1380 = precise::max(_1378, 0.0);
    uint _1382 = uint(_1380);
    int _1384 = ~_979;
    int _1386 = _1384 + 1;
    bool _1388 = _991 == 0;
    int _1390 = _991 * _1376;
    int _1392 = _1390 + _1114;
    int _1394 = ~_1332;
    int _1396 = _1394 + 1;
    int _1398 = _1396 + 1;
    int _1400 = _1348 * _1350;
    int _1402 = _1400 + _1114;
    bool _1404 = !_1388;
    int _1406 = _1404 ? _1392 : (-1);
    float _1408 = trunc(_1326);
    int _1410 = int(_1408);
    int _1412 = _991 + (-1);
    bool _1414 = _979 == 0;
    int _1416 = _1406 * _1398;
    bool _1418 = !_1362;
    int _1420 = _1418 ? 0 : 1;
    int _1422 = _1386 * int(_1382);
    int _1424 = _1422 + _1308;
    int _1426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1428 = _1426 != 0;
    int _1430 = _1332 * _1412;
    int _1432 = _1430 + _1416;
    int _1434 = abs(_1420);
    float _1436 = float(uint(_1424));
    bool _1438 = !_1358;
    int _1440 = _1438 ? 0 : 1;
    int _1442 = _1432 * _1434;
    bool _1444 = !_1366;
    int _1446 = _1444 ? 0 : 1;
    float _1448 = as_type<float>(_1027) * _1436;
    int _1450 = abs(_1440);
    int _1452 = abs(_1446);
    bool _1454 = !_1370;
    int _1456 = _1454 ? 0 : 1;
    float _1458 = trunc(_1448);
    float _1460 = precise::max(_1458, 0.0);
    uint _1462 = uint(_1460);
    float _1464 = float(uint(_1280));
    int _1466 = _1410 * _1450;
    int _1468 = _1466 + _1442;
    int _1470 = abs(_1456);
    float _1472 = as_type<float>(_1027) * _1464;
    float _1474 = float(uint(_1402));
    int _1476 = _1402 * _1452;
    int _1478 = _1476 + _1468;
    int _1480 = 0;
    if (_1428)
    {
        _1480 = 0;
    }
    int _1482 = _1480;
    float _1484 = trunc(_1472);
    float _1486 = precise::max(_1484, 0.0);
    uint _1488 = uint(_1486);
    int _1490 = _1482;
    if (!_1428)
    {
        _1490 = 1;
    }
    int _1492 = _1490;
    int _1494 = _1348 * _1470;
    int _1496 = _1494 + _1478;
    int _1498 = ~_979;
    int _1500 = _1498 + 1;
    float _1502 = as_type<float>(_1041) * _1474;
    int _1504 = ~_979;
    int _1506 = _1504 + 1;
    int _1508 = int(_1382) + int(_1462);
    float _1510 = float(uint(_1496));
    float _1512 = trunc(_1502);
    float _1514 = precise::max(_1512, 0.0);
    uint _1516 = uint(_1514);
    int _1518 = ~_991;
    int _1520 = _1518 + 1;
    int _1522 = _1500 * _1508;
    int _1524 = _1522 + _1308;
    float _1526 = as_type<float>(_1041) * _1510;
    int _1528 = _1506 * int(_1488);
    int _1530 = _1528 + _1280;
    bool _1532 = uint(_1524) >= uint(_979);
    int _1534 = ~_991;
    int _1536 = _1534 + 1;
    float _1538 = trunc(_1526);
    float _1540 = precise::max(_1538, 0.0);
    uint _1542 = uint(_1540);
    bool _1544 = !_1532;
    int _1546 = _1544 ? 0 : (-1);
    float _1548 = float(uint(_1530));
    int _1550 = ~_1508;
    int _1552 = _1550 + _1546;
    int _1554 = _1552 + 1;
    int _1556 = _1520 * int(_1516);
    int _1558 = _1556 + _1402;
    float _1560 = as_type<float>(_1027) * _1548;
    int _1562 = _979 * _1554;
    int _1564 = _1562 + _1308;
    float _1566 = float(uint(_1558));
    float _1568 = trunc(_1560);
    float _1570 = precise::max(_1568, 0.0);
    uint _1572 = uint(_1570);
    bool _1574 = !_1414;
    int _1576 = _1574 ? _1564 : (-1);
    int _1578 = _1536 * int(_1542);
    int _1580 = _1578 + _1496;
    float _1582 = as_type<float>(_1041) * _1566;
    int _1584 = _1576 & 3;
    bool _1586 = _1584 != 0;
    float _1588 = float(uint(_1580));
    float _1590 = trunc(_1582);
    float _1592 = precise::max(_1590, 0.0);
    uint _1594 = uint(_1592);
    bool _1596 = uint(_1584) > 1u;
    int _1598 = _1576 & 3;
    bool _1600 = _1598 != 0;
    float _1602 = as_type<float>(_1041) * _1588;
    bool _1604 = _1584 != 3;
    int _1606 = _1600 ? 0 : 1;
    float _1608 = trunc(_1602);
    float _1610 = precise::max(_1608, 0.0);
    uint _1612 = uint(_1610);
    bool _1614 = uint(_1584) >= 2u;
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1618 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1616;
    int _1620 = int(_1488) + int(_1572);
    float _1622 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1624 = _1622 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _1626 = ~_1606;
    int _1628 = _1626 + 1;
    int _1630 = _1628 + 1;
    float _1632 = _1618 * _1066;
    int _1634 = _1630;
    if (!_1596)
    {
        int _1636 = ~_1606;
        int _1638 = _1636 + 1;
        _1634 = _1638;
    }
    int _1640 = _1634;
    int _1642 = _1614 ? 0 : 1;
    int _1644 = ~_979;
    int _1646 = _1644 + 1;
    int _1648 = ~_991;
    int _1650 = _1648 + 1;
    int _1652 = ~_1642;
    int _1654 = _1652 + 1;
    int _1656 = _1654 + 1;
    int _1658 = _1646 * _1620;
    int _1660 = _1658 + _1280;
    int _1662 = _1656;
    if (_1604)
    {
        int _1664 = ~_1642;
        int _1666 = _1664 + 1;
        _1662 = _1666;
    }
    int _1668 = _1662;
    int _1670 = int(_1516) + int(_1594);
    bool _1672 = _1076 > 0.5;
    bool _1674 = uint(_1660) >= uint(_979);
    int _1676 = _1650 * _1670;
    int _1678 = _1676 + _1402;
    int _1680 = int(_1542) + int(_1612);
    float _1682 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1684 = ~_991;
    int _1686 = _1684 + 1;
    float _1688 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1690 = -_999;
    float _1692 = fma(_1682, 2.0, _1690);
    int _1694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1696 = _1694 != 0;
    int _1698 = _1686 * _1680;
    int _1700 = _1698 + _1496;
    bool _1702 = !_1674;
    int _1704 = _1702 ? 0 : (-1);
    float _1706 = fma(_1688, -2.0, _1001);
    bool _1708 = !_1696;
    int _1710 = _1708 ? 0 : 1;
    float _1712 = -_151;
    float _1714 = fma(_1712, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1692);
    int _1716 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1718 = _1716 != 0;
    float _1720 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1706);
    bool _1722 = uint(_1678) >= uint(_991);
    float _1724 = in.m_58.x;
    float _1726 = in.m_58.y;
    float _1728 = in.m_58.z;
    bool _1730 = uint(_1700) >= uint(_991);
    bool _1732 = !_1722;
    int _1734 = _1732 ? 0 : (-1);
    bool _1736 = _1070 > 0.5;
    float _1738 = -_209;
    int _1740 = _1736 ? as_type<int>(_1738) : as_type<int>(_209);
    bool _1742 = !_1730;
    int _1744 = _1742 ? 0 : (-1);
    float _1746 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1748 = _1746 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1750 = _1072 > 0.5;
    bool _1752 = !_1718;
    float _1754 = _1752 ? _209 : as_type<float>(_1740);
    int _1756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1758 = _1756 != 0;
    float _1760 = 1.0 / _1748;
    float _1762 = -_213;
    int _1764 = _1750 ? as_type<int>(_1762) : as_type<int>(_213);
    int _1766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1768 = _1766 != 0;
    bool _1770 = !_1758;
    float _1772 = _1770 ? _213 : as_type<float>(_1764);
    float _1774 = _1726 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _1776 = _1074 > 0.5;
    float _1778 = _1726 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1780 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1782 = _1780 != 0;
    float _1784 = fma(_1724, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1774);
    float _1786 = -_209;
    int _1788 = _1776 ? as_type<int>(_1786) : as_type<int>(_209);
    float _1790 = fma(_1724, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1778);
    int _1792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1794 = _1792 != 0;
    float _1796 = _1726 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1798 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1800 = isnan(_961);
    bool _1802 = _1798 || _1800;
    bool _1804 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1806 = _1802 || _1804;
    float _1808 = float(_1806);
    float _1810 = _1624 * _1760;
    bool _1812 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1814 = isnan(_961);
    bool _1816 = _1812 || _1814;
    bool _1818 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1820 = _1816 || _1818;
    float _1822 = float(_1820);
    float _1824 = fma(_1724, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1796);
    float _1826 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1828 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1826;
    float _1830 = -_1808;
    float _1832 = _1830 + 1.0;
    bool _1834 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1836 = isnan(_961);
    bool _1838 = _1834 || _1836;
    bool _1840 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1842 = _1838 || _1840;
    float _1844 = float(_1842);
    float _1846 = fma(_1728, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1790);
    float _1848 = _1828 * _1088;
    float _1850 = _1822 * _1832;
    bool _1852 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1854 = isnan(_961);
    bool _1856 = _1852 || _1854;
    bool _1858 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1860 = _1856 || _1858;
    float _1862 = float(_1860);
    float _1864 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1866 = _961 + _1864;
    float _1868 = -_1844;
    float _1870 = _1868 + 1.0;
    float _1872 = -_1822;
    float _1874 = _1872 + 1.0;
    bool _1876 = !_1794;
    float _1878 = _1876 ? _209 : as_type<float>(_1788);
    float _1880 = fma(_1632, _1866, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1882 = _1862 * _1870;
    float _1884 = _1844 * _1874;
    float _1886 = fma(_1728, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1784);
    bool _1888 = _1492 != 1;
    float _1890 = fma(_1728, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1824);
    float _1892 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1894 = _961 + _1892;
    float _1896 = _1880 * _1882;
    float _1898 = _1754 + 0.5;
    float _1900 = -_1862;
    float _1902 = _1900 + 1.0;
    float _1904 = fma(_1848, _1894, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1906 = fma(_1810, _969, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1908 = fma(_1898, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1714);
    float _1910 = fma(_1902, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1896);
    float _1912 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1914 = _1772 + (-0.5);
    int _1916 = ~_1680;
    int _1918 = _1916 + _1744;
    int _1920 = _1918 + 1;
    float _1922 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1912);
    float _1924 = -_1914;
    float _1926 = -_1720;
    float _1928 = fma(_1924, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1926);
    float _1930 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1932 = _1720;
    float _1934 = _1714;
    if (!_1888)
    {
        _1932 = _1072;
    }
    float _1936 = _1932;
    int _1938 = _991 * _1920;
    int _1940 = _1938 + _1496;
    float _1942 = _1936;
    if (!_1888)
    {
        _1934 = _1072;
    }
    float _1944 = _1934;
    float _1946 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1930);
    float _1948 = _1944;
    if (_1888)
    {
        _1942 = _1070;
    }
    float _1950 = _1942;
    float _1952 = fma(_1906, _1884, _1910);
    if (_1888)
    {
        _1948 = _1070;
    }
    float _1954 = _1948;
    float _1956 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1922);
    if (!_1888)
    {
        _1122 = _1074;
    }
    float _1958 = _1122;
    float _1960 = fma(_1904, _1850, _1952);
    float _1962 = _1958;
    if (_1888)
    {
        _1124 = _1072;
    }
    float _1964 = _1124;
    float _1966 = _1846 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (_1888)
    {
        _1962 = _1072;
    }
    float _1968 = _1962;
    float _1970 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1972 = _1886 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1974 = _1576 >> 31;
    float _1976 = fma(_1954, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1970);
    bool _1978 = !_1388;
    int _1980 = _1978 ? _1940 : (-1);
    float _1982 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1984 = _1974 & 3;
    float _1986 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1946);
    int _1988 = _1980 >> 31;
    float _1990 = fma(_1968, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1982);
    int _1992 = _1576 + _1984;
    float _1994 = _1950 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1996 = _1988 & 3;
    float _1998 = _1964 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2000 = _1992 >> 2;
    float _2002 = _1890 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2004 = _1980 + _1996;
    float _2006 = fma(_1808, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1960);
    int _2008 = _2000 << 4;
    int _2010 = _2008 + 368;
    float _2012 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2014 = _2002 + _2012;
    int _2016 = _2004 >> 2;
    float _2018 = _1878 + 0.5;
    bool _2020 = !_1586;
    int _2022 = _2020 ? 0 : 1;
    int _2024 = _2010 + 8;
    uint _2026 = uint(int(uint(_2024) >> uint(2)));
    uint _2028 = uint(int(uint(int(_2026)) >> uint(2)));
    int _2030 = int(_2026) & 3;
    float _2032 = (*spvDescriptorSet0.vp_c9)._m0[int(_2028)][_2030];
    int _2034 = int(_2026) + 1;
    uint _2036 = uint(int(uint(_2034) >> uint(2)));
    int _2038 = _2034 & 3;
    float _2040 = (*spvDescriptorSet0.vp_c9)._m0[int(_2036)][_2038];
    int _2042 = _1980 & 3;
    bool _2044 = _2042 != 0;
    float _2046 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1976);
    int _2048 = _1980 & 3;
    bool _2050 = _2048 != 0;
    float _2052 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1990);
    int _2054 = _2016 << 4;
    int _2056 = _2054 + 512;
    float _2058 = -_1956;
    float _2060 = _2058 + 1.0;
    int _2062 = _2044 ? 0 : 1;
    uint _2064 = uint(int(uint(_2010) >> uint(2)));
    uint _2066 = uint(int(uint(int(_2064)) >> uint(2)));
    int _2068 = int(_2064) & 3;
    float _2070 = (*spvDescriptorSet0.vp_c9)._m0[int(_2066)][_2068];
    int _2072 = int(_2064) + 1;
    uint _2074 = uint(int(uint(_2072) >> uint(2)));
    int _2076 = _2072 & 3;
    float _2078 = (*spvDescriptorSet0.vp_c9)._m0[int(_2074)][_2076];
    bool _2080 = uint(_2048) > 1u;
    float _2082 = -_2052;
    float _2084 = _2082 + 1.0;
    bool _2086 = !_2050;
    int _2088 = _2086 ? 0 : 1;
    uint _2090 = uint(int(uint(_2056) >> uint(2)));
    uint _2092 = uint(int(uint(int(_2090)) >> uint(2)));
    int _2094 = int(_2090) & 3;
    float _2096 = (*spvDescriptorSet0.vp_c9)._m0[int(_2092)][_2094];
    int _2098 = int(_2090) + 1;
    uint _2100 = uint(int(uint(_2098) >> uint(2)));
    int _2102 = _2098 & 3;
    float _2104 = (*spvDescriptorSet0.vp_c9)._m0[int(_2100)][_2102];
    float _2106 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2108 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _2110 = _1584 != 3;
    float _2112 = fma(_1998, -2.0, _2106);
    int _2114 = ~_2062;
    int _2116 = _2114 + 1;
    int _2118 = _2116 + 1;
    float _2120 = -_2108;
    float _2122 = fma(_1994, 2.0, _2120);
    int _2124 = _2118;
    int _2126 = as_type<int>(_1972);
    if (!_2080)
    {
        int _2128 = ~_2062;
        int _2130 = _2128 + 1;
        _2124 = _2130;
    }
    int _2132 = _2124;
    float _2134 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2136 = _1966 + _2134;
    int _2138 = _2056 + 8;
    uint _2140 = uint(int(uint(_2138) >> uint(2)));
    uint _2142 = uint(int(uint(int(_2140)) >> uint(2)));
    int _2144 = int(_2140) & 3;
    float _2146 = (*spvDescriptorSet0.vp_c9)._m0[int(_2142)][_2144];
    int _2148 = int(_2140) + 1;
    uint _2150 = uint(int(uint(_2148) >> uint(2)));
    int _2152 = _2148 & 3;
    float _2154 = (*spvDescriptorSet0.vp_c9)._m0[int(_2150)][_2152];
    float _2156 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2158 = _1972 + _2156;
    int _2160 = ~_1620;
    int _2162 = _2160 + _1704;
    int _2164 = _2162 + 1;
    float _2166 = _2136 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2168 = abs(_1640);
    float _2170 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2112);
    int _2172 = abs(_2132);
    float _2174 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2166);
    bool _2176 = uint(_2048) >= 2u;
    int _2178 = _979 * _2164;
    int _2180 = _2178 + _1280;
    int _2182 = ~_2168;
    int _2184 = _2182 + 1;
    int _2186 = _2184 + 1;
    float _2188 = fma(_2014, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2174);
    bool _2190 = !_2110;
    int _2192 = _2190 ? 0 : (-1);
    float _2194 = -_151;
    float _2196 = fma(_2194, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2122);
    bool _2198 = _2048 != 3;
    float _2200 = fma(_2018, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2196);
    int _2202 = _2176 ? 0 : 1;
    int _2204 = abs(_2022);
    int _2206 = ~_2172;
    int _2208 = _2206 + 1;
    int _2210 = _2208 + 1;
    int _2212 = ~_2202;
    int _2214 = _2212 + 1;
    int _2216 = _2214 + 1;
    int _2218 = abs(_2088);
    int _2220 = _2216;
    if (_2198)
    {
        int _2222 = ~_2202;
        int _2224 = _2222 + 1;
        _2220 = _2224;
    }
    int _2226 = _2220;
    int _2228 = _2186 * as_type<int>(_2078);
    int _2230 = abs(_1668);
    int _2232 = ~_2204;
    int _2234 = _2232 + 1;
    int _2236 = _2234 + 1;
    int _2238 = abs(_2226);
    int _2240 = _2210 * as_type<int>(_2104);
    int _2242 = _2236 * as_type<int>(_2070);
    int _2244 = _2242 + _2228;
    int _2246 = abs(_2192);
    int _2248 = ~_2218;
    int _2250 = _2248 + 1;
    int _2252 = _2250 + 1;
    int _2254 = ~_2230;
    int _2256 = _2254 + 1;
    int _2258 = _2256 + 1;
    bool _2260 = _2048 != 3;
    int _2262 = _2252 * as_type<int>(_2096);
    int _2264 = _2262 + _2240;
    int _2266 = _2258 * as_type<int>(_2032);
    int _2268 = _2266 + _2244;
    bool _2270 = !_2260;
    int _2272 = _2270 ? 0 : (-1);
    int _2274 = ~_2246;
    int _2276 = _2274 + 1;
    int _2278 = _2276 + 1;
    int _2280 = ~_2238;
    int _2282 = _2280 + 1;
    int _2284 = _2282 + 1;
    int _2286 = abs(_2272);
    int _2288 = _2278 * as_type<int>(_2040);
    int _2290 = _2288 + _2268;
    bool _2292 = !_1782;
    int _2294 = _2292 ? 0 : 1;
    int _2296 = _2284 * as_type<int>(_2146);
    int _2298 = _2296 + _2264;
    int _2300 = ~_1670;
    int _2302 = _2300 + _1734;
    int _2304 = _2302 + 1;
    float _2306 = -_213;
    int _2308 = _1672 ? as_type<int>(_2306) : as_type<int>(_213);
    int _2310 = abs(_2294);
    int _2312 = ~_2286;
    int _2314 = _2312 + 1;
    int _2316 = _2314 + 1;
    bool _2318 = !_1768;
    float _2320 = _2318 ? _213 : as_type<float>(_2308);
    int _2322 = _991 * _2304;
    int _2324 = _2322 + _1402;
    int _2326 = ~_2310;
    int _2328 = _2326 + 1;
    int _2330 = _2328 + 1;
    int _2332 = _2316 * as_type<int>(_2154);
    int _2334 = _2332 + _2298;
    int _2336 = abs(_1710);
    float _2338 = _927 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _2340 = !_1388;
    int _2342 = _2340 ? _2324 : (-1);
    int _2344 = _2334 * _2330;
    float _2346 = _2136 * _2136;
    bool _2348 = _2188 >= 0.0;
    float _2350 = _2338 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2352 = _2342 * _2310;
    int _2354 = _2352 + _2344;
    float _2356 = fma(_2158, _2158, _2346);
    int _2358 = ~_2336;
    int _2360 = _2358 + 1;
    int _2362 = _2360 + 1;
    float _2364 = _923 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _2366 = !_1414;
    int _2368 = _2366 ? _2180 : (-1);
    float _2370 = fma(_2014, _2014, _2356);
    float _2372 = _925 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2374 = _2290 * _2362;
    float _2376 = _2320 + (-0.5);
    float _2378 = -_2060;
    float _2380 = fma(_1754, _2378, _1908);
    float _2382 = rsqrt(_2370);
    float _2384 = -_2376;
    float _2386 = -_2170;
    float _2388 = fma(_2384, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2386);
    int _2390 = _2368 * _2336;
    int _2392 = _2390 + _2374;
    if (_2348)
    {
        _933 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2394 = _933;
    float _2396 = -_1986;
    float _2398 = _2396 + 1.0;
    float _2400 = -_2046;
    float _2402 = _2400 + 1.0;
    float _2404 = fma(_2320, _2084, _2388);
    float _2406 = _2364 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2408 = fma(_1772, _2398, _1928);
    float _2410 = -_2402;
    float _2412 = fma(_1878, _2410, _2200);
    float _2414 = _2372 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2416 = _2006 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2418 = as_type<int>(_2394);
    float _2420 = _2412;
    if (_2348)
    {
        float _2422 = _2394 * 5.0;
        _2418 = as_type<int>(_2422);
    }
    int _2424 = _2418;
    float _2426 = float(_2392);
    out.m_76.x = _2380;
    out.m_76.y = _2408;
    out.m_76.z = _2412;
    out.m_76.w = _2404;
    float _2428 = float(_2354);
    float _2430 = _2136 * _2382;
    float _2432 = _2158 * _2382;
    out.m_78.x = _2406;
    out.m_78.y = _2414;
    out.m_78.z = _2350;
    out.m_78.w = _2416;
    if (_2348)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7900 = as_type<float>(_2424);
        out.gl_Position.z = _7900;
    }
    out.m_80.x = _2426;
    out.m_80.y = _2428;
    if (_2348)
    {
        out.m_61.x = 0.0;
    }
    if (_2348)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2434 = -_2430;
    float _2436 = fma(_2434, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1966);
    float _2438 = _2014 * _2382;
    float _2440 = -_2432;
    float _2442 = fma(_2440, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1972);
    float _2444 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2446 = _2436 + _2444;
    float _2448 = -_2438;
    float _2450 = fma(_2448, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2002);
    float _2452 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2454 = _2442 + _2452;
    float _2456 = _2446 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2458 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2460 = _2450 + _2458;
    float _2462 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2456);
    float _2464 = fma(_2460, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2462);
    bool _2466 = _2464 >= 0.0;
    float _2468 = _2454;
    float _2470 = _2446;
    if (_2466)
    {
        _2420 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2472 = _2420;
    int _2474 = as_type<int>(_2472);
    if (_2466)
    {
        out.m_61.x = 0.0;
    }
    if (_2466)
    {
        float _2476 = _2472 * 5.0;
        _2474 = as_type<int>(_2476);
    }
    int _2478 = _2474;
    if (_2466)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8000 = as_type<float>(_2478);
        out.gl_Position.z = _8000;
    }
    if (_2466)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2480 = -_1966;
    float _2482 = _2480 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2484 = -_1972;
    float _2486 = _2484 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2488 = -_2002;
    float _2490 = _2488 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2492 = -_2430;
    float _2494 = fma(_2492, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2136);
    float _2496 = _2482 * _2482;
    float _2498 = -_2432;
    float _2500 = fma(_2498, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2158);
    float _2502 = -_2438;
    float _2504 = fma(_2502, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2014);
    float _2506 = _2494 * _2494;
    float _2508 = fma(_2486, _2486, _2496);
    float _2510 = _443 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2512 = _461 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2514 = fma(_2500, _2500, _2506);
    float _2516 = fma(_2490, _2490, _2508);
    float _2518 = fma(_2504, _2504, _2514);
    float _2520 = rsqrt(_2516);
    float _2522 = _2486 * _2520;
    float _2524 = _2490 * _2520;
    float _2526 = _2482 * _2520;
    float _2528 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2530 = _2522 * _2528;
    float _2532 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2534 = _2524 * _2532;
    float _2536 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2538 = _2526 * _2536;
    float _2540 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2542 = -_2530;
    float _2544 = fma(_2524, _2540, _2542);
    float _2546 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2548 = -_2534;
    float _2550 = fma(_2526, _2546, _2548);
    float _2552 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2554 = -_2538;
    float _2556 = fma(_2522, _2552, _2554);
    float _2558 = sqrt(_2518);
    float _2560 = _2544 * _2544;
    float _2562 = fma(_2550, _2550, _2560);
    float _2564 = fma(_2556, _2556, _2562);
    float _2566 = rsqrt(_2564);
    float _2568 = _2382 * _2558;
    float _2570 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _213);
    float _2572 = _2568 * _2510;
    float _2574 = _2568 * _2512;
    float _2576 = _2568 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2578 = _2576 * 0.5;
    float _2580 = _2570 * _2572;
    float _2582 = _2544 * _2566;
    float _2584 = _2550 * _2566;
    float _2586 = _2556 * _2566;
    float _2588 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _209);
    float _2590 = _2524 * _2582;
    float _2592 = _2526 * _2584;
    float _2594 = -_2590;
    float _2596 = fma(_2526, _2586, _2594);
    float _2598 = -_2592;
    float _2600 = fma(_2522, _2582, _2598);
    float _2602 = _2588 * _2574;
    float _2604 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2606 = _2580 * _2596;
    float _2608 = _2580 * _2600;
    float _2610 = fma(_2604, _2604, 1.0);
    float _2612 = fma(_2602, _2584, _2606);
    float _2614 = fma(_2602, _2586, _2608);
    float _2616 = fma(_2578, _2522, _2612);
    float _2618 = fma(_2578, _2524, _2614);
    float _2620 = _1972 + _2616;
    float _2622 = _2002 + _2618;
    float _2624 = _2522 * _2586;
    float _2626 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2628 = _2620 + _2626;
    float _2630 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2632 = _2622 + _2630;
    float _2634 = -_2624;
    float _2636 = fma(_2524, _2584, _2634);
    float _2638 = _2628 * _2628;
    float _2640 = _2632 * _2632;
    float _2642 = _2580 * _2636;
    float _2644 = _2638 + _2640;
    float _2646 = fma(_2602, _2582, _2642);
    float _2648 = rsqrt(_2610);
    float _2650 = fma(_2578, _2526, _2646);
    float _2652 = _1966 + _2650;
    float _2654 = sqrt(_2644);
    bool _2656 = _2654 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2658 = _2650;
    float _2660 = _2580;
    float _2662 = _2620;
    float _2664 = _2638;
    float _2666 = _2640;
    if (!_2656)
    {
        _2658 = _2620;
    }
    float _2668 = _2658;
    float _2670 = _2668;
    if (!_2656)
    {
        _2660 = _2640;
    }
    float _2672 = _2660;
    float _2674 = _2672;
    if (!_2656)
    {
        _217 = _2622;
    }
    float _2676 = _217;
    float _2678 = _2676;
    if (!_2656)
    {
        _2662 = _2652;
    }
    float _2680 = _2662;
    bool _2682 = !_2656;
    float _2684 = _2680;
    if (!_2682)
    {
        float _2686 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2688 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2690 = _2654 + _2688;
        float _2692 = rsqrt(_2644);
        float _2694 = _2690 * _2686;
        float _2696 = _2652 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2698 = _2694 * 0.15915493667125701904296875;
        float _2700 = _2698 * 6.283185482025146484375;
        float _2702 = sin(_2700);
        float _2704 = _2698 * 6.283185482025146484375;
        float _2706 = cos(_2704);
        float _2708 = fma(_2702, _2696, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2710 = _2692 * _2708;
        float _2712 = _2706 + (-1.0);
        float _2714 = fma(_2628, _2710, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2716 = fma(_2632, _2710, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2718 = _2712 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2720 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2722 = _2714 + _2720;
        float _2724 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2726 = _2716 + _2724;
        float _2728 = fma(_2652, _2706, _2718);
        float _2730 = _2722 * _2722;
        float _2732 = _2726 * _2726;
        _2684 = _2728;
        _2664 = _2730;
        _2674 = _2732;
        _2670 = _2714;
        _2678 = _2716;
    }
    float _2734 = _2684;
    float _2736 = _2664;
    float _2738 = _2674;
    float _2740 = _2670;
    float _2742 = _2678;
    float _2744 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2746 = _2734 + _2744;
    float _2748 = _2604 * _2648;
    float _2750 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2752 = _2604 * _2596;
    float _2754 = fma(_2746, _2746, _2736);
    float _2756 = -_2522;
    float _2758 = _2748 * _2756;
    float _2760 = -_2526;
    float _2762 = _2748 * _2760;
    float _2764 = -_2524;
    float _2766 = _2748 * _2764;
    float _2768 = _2754 + _2738;
    float _2770 = _2604 * _2636;
    float _2772 = _2604 * _2600;
    float _2774 = fma(_2750, _2584, _2752);
    float _2776 = fma(_2648, _2596, _2758);
    float _2778 = fma(_2750, _2582, _2770);
    float _2780 = sqrt(_2768);
    float _2782 = fma(_2750, _2586, _2772);
    float _2784 = fma(_2648, _2636, _2762);
    float _2786 = fma(_2648, _2600, _2766);
    float _2788 = _2522 + _2774;
    float _2790 = _2526 + _2778;
    float _2792 = _2524 + _2782;
    out.m_82.x = _2584;
    out.m_82.y = _2582;
    out.m_82.z = _2586;
    out.m_84.x = _2776;
    out.m_84.y = _2784;
    out.m_84.z = _2786;
    out.m_86.x = _2788;
    out.m_86.y = _2790;
    out.m_86.z = _2792;
    bool _2794 = _2780 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2796 = isnan(_2780);
    bool _2798 = _2794 || _2796;
    bool _2800 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2802 = _2798 || _2800;
    if (!_2802)
    {
        _2666 = 1.0;
    }
    float _2804 = _2666;
    bool _2806 = !_2802;
    float _2808 = _2804;
    if (!_2806)
    {
        bool _2810 = _2780 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2812 = isnan(_2780);
        bool _2814 = _2810 || _2812;
        bool _2816 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2818 = _2814 || _2816;
        if (!_2818)
        {
            float _2820 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2822 = _2780 + _2820;
            float _2824 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2826 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2824;
            float _2828 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2830 = _2828 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2832 = 1.0 / _2826;
            float _2834 = _2822 * _2832;
            float _2836 = fma(_2834, _2830, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2808 = _2836;
            _2838 = true;
        }
        else
        {
            bool _2840 = _2780 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2842 = isnan(_2780);
            bool _2844 = _2840 || _2842;
            bool _2846 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2848 = _2844 || _2846;
            if (!_2848)
            {
                float _2850 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2852 = _2780 + _2850;
                float _2854 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2856 = _2854 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2858 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2860 = _2858 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2862 = 1.0 / _2856;
                float _2864 = _2852 * _2862;
                float _2866 = fma(_2864, _2860, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2808 = _2866;
                _2838 = true;
            }
            else
            {
                _2808 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2838 = false;
    float _2868 = _2808;
    float _2870 = fma(_2442, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2872 = fma(_2450, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2874 = floor(_2870);
    float _2876 = floor(_2872);
    float _2878 = -_2874;
    float _2880 = _2870 + _2878;
    float _2882 = -_2876;
    float _2884 = _2872 + _2882;
    float2 _8675 = float2(_2880, _2884);
    float _2886 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8675, float2(0.0), isnan(_8675)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8675, float2(0.0), isnan(_8675)), level(0.0)).x;
    float _2888 = _2436 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2890 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2892 = _2740 + _2890;
    float _2894 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2896 = _2734 + _2894;
    float _2898 = fma(_2442, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2888);
    float _2900 = fma(_2892, _2868, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2902 = fma(_2896, _2868, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2904 = fma(_2450, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2898);
    float _2906 = _2436 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2908 = -_1966;
    float _2910 = _2908 + _2902;
    float _2912 = _2904 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2914 = fma(_2442, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2906);
    float _2916 = -_1972;
    float _2918 = _2916 + _2900;
    float _2920 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2922 = 1.0 / _2912;
    float _2924 = fma(_2450, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2914);
    float _2926 = _2910 * _2910;
    float _2928 = _2436 + _2920;
    float _2930 = _2924 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2932 = fma(_2918, _2918, _2926);
    bool _2934 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2936 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2938 = _2934 || _2936;
    bool _2940 = isnan(0.5);
    bool _2942 = _2938 || _2940;
    float _2944 = _2930 + _2912;
    float _2946 = _2944 * _2922;
    float _2948 = _2946 * 0.5;
    float _2950 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2952 = fma(_2948, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2950);
    float _2954 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2956 = _2742 + _2954;
    float _2958 = fma(_2956, _2868, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2960 = 1.0 / _2952;
    float _2962 = _2928 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2964 = -_2002;
    float _2966 = _2964 + _2958;
    float _2968 = fma(_2442, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2962);
    float _2970 = fma(_2966, _2966, _2932);
    float _2972 = fma(_2450, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2968);
    float _2974 = sqrt(_2970);
    float _2976 = _2972 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2978 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2980 = _2960 * _2978;
    float _2982 = _2928 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2984 = trunc(_2976);
    int _2986 = int(_2984);
    bool _2988 = _2980 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2990 = fma(_2442, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2982);
    bool _2992 = _2980 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _2994 = !_2988;
    int _2996 = _2994 ? 0 : 1;
    float _2998 = fma(_2450, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2990);
    float _3000 = _2998 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    int _3002 = 2;
    float _3004 = _2958;
    float _3006 = _2902;
    float _3008 = _2976;
    if (!_2988)
    {
        _3002 = 1;
    }
    int _3010 = _3002;
    float _3012 = trunc(_3000);
    int _3014 = int(_3012);
    int _3016 = _3010;
    if (!_2992)
    {
        _3016 = _2996;
    }
    int _3018 = _3016;
    bool _3020 = _2974 > 0.0;
    int _3022 = _3018 << 6;
    int _3024 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3026 = _2986 + _3024;
    int _3028 = _3026 + 1;
    int _3030 = _3022 + 48;
    uint _3032 = uint(int(uint(_3030) >> uint(2)));
    uint _3034 = uint(int(uint(int(_3032)) >> uint(2)));
    int _3036 = int(_3032) & 3;
    float _3038 = (*spvDescriptorSet0.vp_c15)._m0[int(_3034)][_3036];
    int _3040 = int(_3032) + 1;
    uint _3042 = uint(int(uint(_3040) >> uint(2)));
    int _3044 = _3040 & 3;
    float _3046 = (*spvDescriptorSet0.vp_c15)._m0[int(_3042)][_3044];
    int _3048 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _3050 = _3014 + _3048;
    int _3052 = _3050 + 1;
    int _3054 = _3022 + 56;
    uint _3056 = uint(int(uint(_3054) >> uint(2)));
    uint _3058 = uint(int(uint(int(_3056)) >> uint(2)));
    int _3060 = int(_3056) & 3;
    float _3062 = (*spvDescriptorSet0.vp_c15)._m0[int(_3058)][_3060];
    int _3064 = int(_3056) + 1;
    uint _3066 = uint(int(uint(_3064) >> uint(2)));
    int _3068 = _3064 & 3;
    float _3070 = (*spvDescriptorSet0.vp_c15)._m0[int(_3066)][_3068];
    bool _3072 = _3052 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _3074 = _3052 | _3028;
    int _3076 = _3022 + 64;
    uint _3078 = uint(int(uint(_3076) >> uint(2)));
    uint _3080 = uint(int(uint(int(_3078)) >> uint(2)));
    int _3082 = int(_3078) & 3;
    float _3084 = (*spvDescriptorSet0.vp_c15)._m0[int(_3080)][_3082];
    int _3086 = int(_3078) + 1;
    uint _3088 = uint(int(uint(_3086) >> uint(2)));
    int _3090 = _3086 & 3;
    float _3092 = (*spvDescriptorSet0.vp_c15)._m0[int(_3088)][_3090];
    bool _3094 = _3074 < 0;
    bool _3096 = _3094 || _3072;
    float _3098 = as_type<float>(_3074);
    if (!_3020)
    {
        _3098 = _2900;
    }
    float _3100 = _3098;
    bool _3102 = _3028 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3104 = _3102 || _3096;
    int _3106 = _3022 + 72;
    uint _3108 = uint(int(uint(_3106) >> uint(2)));
    uint _3110 = uint(int(uint(int(_3108)) >> uint(2)));
    int _3112 = int(_3108) & 3;
    float _3114 = (*spvDescriptorSet0.vp_c15)._m0[int(_3110)][_3112];
    int _3116 = int(_3108) + 1;
    uint _3118 = uint(int(uint(_3116) >> uint(2)));
    int _3120 = _3116 & 3;
    float _3122 = (*spvDescriptorSet0.vp_c15)._m0[int(_3118)][_3120];
    int _3124 = _3022 + 96;
    uint _3126 = uint(int(uint(_3124) >> uint(2)));
    uint _3128 = uint(int(uint(int(_3126)) >> uint(2)));
    int _3130 = int(_3126) & 3;
    float _3132 = (*spvDescriptorSet0.vp_c15)._m0[int(_3128)][_3130];
    int _3134 = int(_3126) + 1;
    uint _3136 = uint(int(uint(_3134) >> uint(2)));
    int _3138 = _3134 & 3;
    float _3140 = (*spvDescriptorSet0.vp_c15)._m0[int(_3136)][_3138];
    int _3142 = _3022 + 104;
    uint _3144 = uint(int(uint(_3142) >> uint(2)));
    uint _3146 = uint(int(uint(int(_3144)) >> uint(2)));
    int _3148 = int(_3144) & 3;
    float _3150 = (*spvDescriptorSet0.vp_c15)._m0[int(_3146)][_3148];
    int _3152 = int(_3144) + 1;
    uint _3154 = uint(int(uint(_3152) >> uint(2)));
    int _3156 = _3152 & 3;
    float _3158 = (*spvDescriptorSet0.vp_c15)._m0[int(_3154)][_3156];
    bool _3160 = !_3020;
    float _3162 = _3100;
    float _3164 = _3132;
    float _3166 = _3092;
    if (!_3160)
    {
        float _3168 = _203 * _203;
        float _3170 = fma(_201, _201, _3168);
        float _3172 = rsqrt(_2970);
        float _3174 = fma(_205, _205, _3170);
        float _3176 = sqrt(_3174);
        float _3178 = _2918 * _3172;
        float _3180 = _2910 * _3172;
        bool _3182 = _3176 > 0.0;
        float _3184 = _2966 * _3172;
        float _3186 = _3172;
        if (!_3182)
        {
            _3186 = _2900;
        }
        float _3188 = _3186;
        bool _3190 = !_3182;
        _3162 = _3188;
        if (!_3190)
        {
            float _3192 = rsqrt(_3174);
            float _3194 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3196 = _203 * _3192;
            float _3198 = _201 * _3192;
            float _3200 = _205 * _3192;
            float _3202 = _3180 * _3196;
            float _3204 = fma(_3178, _3198, _3202);
            float _3206 = _3194 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3208 = fma(_3184, _3200, _3204);
            float _3210 = _3208 * _3206;
            float _3212 = fma(_201, _3210, _2900);
            float _3214 = fma(_203, _3210, _2902);
            float _3216 = fma(_205, _3210, _2958);
            _3162 = _3212;
            _3004 = _3216;
            _3006 = _3214;
        }
    }
    float _3218 = _3162;
    float _3220 = _3004;
    float _3222 = _3006;
    float _3224 = -_2432;
    float _3226 = fma(_3224, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3218);
    float _3228 = _2928 * _3140;
    float _3230 = -_2438;
    float _3232 = fma(_3230, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3220);
    float _3234 = -_2430;
    float _3236 = fma(_3234, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3222);
    float _3238 = _3228;
    float _3240 = _3236;
    if (!_3104)
    {
        int _3242 = _3028 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3244 = _3242 + _3052;
        _219 = _3244;
    }
    int _3246 = _219;
    float _3248 = fma(_2442, _3132, _3228);
    if (_2942)
    {
        _3164 = _3226;
    }
    float _3250 = _3164;
    float _3252 = _2928 * _3046;
    float _3254 = _3250;
    if (_2942)
    {
        _3238 = _3232;
    }
    float _3256 = _3238;
    float _3258 = _3256;
    if (!_2942)
    {
        float _3260 = _2446 * _2446;
        float _3262 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3264 = -_1966;
        float _3266 = _3264 + _3222;
        float _3268 = -_2002;
        float _3270 = _3268 + _3220;
        float _3272 = fma(_2454, _2454, _3260);
        float _3274 = fma(_2460, _2460, _3272);
        float _3276 = 1.0 / _2568;
        float _3278 = sqrt(_3274);
        float _3280 = precise::min(_3278, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3282 = _3280 * _3262;
        float _3284 = _3282 * _3276;
        float _3286 = -_1972;
        float _3288 = _3286 + _3218;
        float _3290 = fma(_3266, _3284, _2436);
        float _3292 = fma(_3288, _3284, _2442);
        float _3294 = fma(_3270, _3284, _2450);
        _3240 = _3290;
        _3254 = _3292;
        _3258 = _3294;
        _2468 = _3278;
        _2470 = _3260;
    }
    float _3296 = _3240;
    float _3298 = _3254;
    float _3300 = _3258;
    float _3302 = _2468;
    float _3304 = _2470;
    float _3306 = _2928 * _3092;
    float _3308 = fma(_2442, _3038, _3252);
    float _3310 = fma(_2450, _3150, _3248);
    int _3312 = as_type<int>(_3306);
    float _3314 = _3302;
    if (!_3104)
    {
        int _3316 = _3246 << 2;
        _2126 = _3316;
    }
    int _3318 = _2126;
    float _3320 = fma(_2442, _3084, _3306);
    float _3322 = fma(_2450, _3062, _3308);
    float _3324 = _3310 + _3158;
    int _3326 = _3022 + 80;
    uint _3328 = uint(int(uint(_3326) >> uint(2)));
    uint _3330 = uint(int(uint(int(_3328)) >> uint(2)));
    int _3332 = int(_3328) & 3;
    float _3334 = (*spvDescriptorSet0.vp_c15)._m0[int(_3330)][_3332];
    int _3336 = int(_3328) + 1;
    uint _3338 = uint(int(uint(_3336) >> uint(2)));
    int _3340 = _3336 & 3;
    float _3342 = (*spvDescriptorSet0.vp_c15)._m0[int(_3338)][_3340];
    int _3344 = _3318;
    if (!_3104)
    {
        uint _3346 = uint(int(uint(_3246) >> uint(2)));
        _3312 = int(_3346);
    }
    int _3348 = _3312;
    float _3350 = fma(_2450, _3114, _3320);
    if (!_3104)
    {
        int _3352 = 12 & _3318;
        _3344 = _3352;
    }
    int _3354 = _3344;
    float _3356 = _3322 + _3070;
    float _3358 = 1.0 / _3324;
    float _3360 = _3296 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (!_3104)
    {
        int _3362 = _3348 << 4;
        int _3364 = _3362 + _3354;
        _3314 = as_type<float>(_3364);
    }
    float _3366 = _3314;
    float _3368 = _3350 + _3122;
    int _3370 = _3022 + 88;
    uint _3372 = uint(int(uint(_3370) >> uint(2)));
    uint _3374 = uint(int(uint(int(_3372)) >> uint(2)));
    int _3376 = int(_3372) & 3;
    float _3378 = (*spvDescriptorSet0.vp_c15)._m0[int(_3374)][_3376];
    int _3380 = int(_3372) + 1;
    uint _3382 = uint(int(uint(_3380) >> uint(2)));
    int _3384 = _3380 & 3;
    float _3386 = (*spvDescriptorSet0.vp_c15)._m0[int(_3382)][_3384];
    float _3388 = _3296 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3390 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3360);
    float _3392 = _3296 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3394 = _3296 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3396 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3388);
    float _3398 = fma(_3300, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3390);
    float _3400 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3392);
    float _3402 = _3366;
    if (!_3104)
    {
        int _3404 = as_type<int>(_3366) + 400;
        uint _3406 = uint(int(uint(_3404) >> uint(2)));
        uint _3408 = uint(int(uint(int(_3406)) >> uint(2)));
        int _3410 = int(_3406) & 3;
        float _3412 = (*spvDescriptorSet0.vp_c15)._m0[int(_3408)][_3410];
        _3402 = _3412;
    }
    float _3414 = _3402;
    float _3416 = fma(_3300, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3396);
    float _3418 = fma(_3300, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3400);
    float _3420 = _3356 * _3358;
    float _3422 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3394);
    float _3424 = _3368 * _3358;
    float _3426 = _3398 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3428 = _3416 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _3430 = _3420 >= 0.0;
    float _3432 = _3418 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3434 = _3426 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3436 = fma(_3300, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3422);
    bool _3438 = _3420 <= 1.0;
    bool _3440 = _3438 && _3430;
    float _3442 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3444 = fma(_3428, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3434);
    float _3446 = _3432 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _3448 = _3424 >= 0.0;
    bool _3450 = _3448 && _3440;
    float _3452 = _3436 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3454 = fma(_3432, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3444);
    float _3456 = -_3446;
    float _3458 = fma(_3456, _3442, 1.0);
    bool _3460 = _3424 <= 1.0;
    bool _3462 = _3460 && _3450;
    float _3464 = _3426 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3466 = fma(_3452, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3454);
    float _3468 = _3426 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3470 = _3464;
    float _3472 = _3420;
    float _3474 = 1.0;
    float _3476 = _3466;
    if (!_3104)
    {
        float _3478 = floor(_3000);
        _3166 = _3478;
    }
    float _3480 = _3166;
    float _3482 = fma(_3428, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3468);
    float _3484 = _2928 * _3342;
    float _3486 = fma(_3428, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3464);
    float _3488 = log2(_3458);
    if (_3462)
    {
        float _3490 = float(_3018);
        _3470 = _3490;
    }
    float _3492 = _3470;
    float _3494 = fma(_2442, _3334, _3484);
    float _3496 = fma(_3432, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3486);
    float _3498 = fma(_3432, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3482);
    float _3500 = fma(_2450, _3378, _3494);
    float _3502 = 1.0 / _3466;
    float _3504 = fma(_3452, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3496);
    float _3506 = fma(_3452, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3498);
    float _3508 = _3500 + _3386;
    float _3510 = _3508 * _3358;
    float _3512 = _3304;
    if (!_3104)
    {
        float _3514 = floor(_2976);
        _3512 = _3514;
    }
    float _3516 = _3512;
    float _3518 = _3488 * 0.693147182464599609375;
    float _3520 = _3518 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3522 = _3492;
    if (_3462)
    {
        float _3524 = rint(_3492);
        float _3526 = precise::max(_3524, 0.0);
        uint _3528 = uint(_3526);
        uint _3530 = clamp(_3528, 0u, 65535u);
        _3522 = as_type<float>(_3530);
    }
    float _3532 = _3522;
    float _3534 = _3504 * _3502;
    float _3536 = _3506 * _3502;
    float _3538 = _3502;
    float _3540 = _3536;
    if (!_3104)
    {
        float _3542 = -_3480;
        float _3544 = _3000 + _3542;
        _3538 = _3544;
    }
    float _3546 = _3538;
    float _3548 = fma(_3534, 0.5, 0.5);
    float _3550 = fma(_3536, -0.5, 0.5);
    float _3552 = _3468;
    if (!_3104)
    {
        float _3554 = rint(_3414);
        float _3556 = precise::max(_3554, 0.0);
        uint _3558 = uint(_3556);
        uint _3560 = clamp(_3558, 0u, 65535u);
        _3552 = as_type<float>(_3560);
    }
    float _3562 = _3552;
    if (!_3104)
    {
        float _3564 = -_3516;
        float _3566 = _2976 + _3564;
        _3008 = _3566;
    }
    float _3568 = _3008;
    float _3570 = _3424;
    if (_3462)
    {
        float3 _9825 = float3(_3420, _3424, float(as_type<int>(_3532)));
        float3 _9829 = select(_9825, float3(0.0), isnan(_9825));
        float _3572 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9829.xy, uint(rint(_9829.z)), _3510, level(0.0));
        _3570 = _3572;
    }
    float _3574 = _3570;
    float3 _9839 = float3(_3548, _3550, _3520);
    float _3576 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9839, float3(0.0), isnan(_9839)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9839, float3(0.0), isnan(_9839)), level(0.0)).x;
    float3 _9848 = float3(_3548, _3550, _3520);
    float4 _3579 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9848, float3(0.0), isnan(_9848)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9848, float3(0.0), isnan(_9848)), level(0.0)).xyzw;
    float _3581 = _3579.x;
    float _3583 = _3579.y;
    float _3585 = _3579.z;
    float _3587 = _3579.w;
    float _3589 = _3546;
    float _3591 = _3562;
    if (!_3104)
    {
        float3 _9872 = float3(_3546, _3568, float(as_type<int>(_3562)));
        float3 _9874 = select(_9872, float3(0.0), isnan(_9872));
        float _3593 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9874.xy, uint(rint(_9874.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9874.xy, uint(rint(_9874.z)), level(0.0)).x;
        _3589 = _3593;
    }
    float _3595 = _3589;
    if (_3104)
    {
        _3540 = 1.0;
    }
    float _3597 = _3540;
    float _3599 = _3597;
    if (!_3104)
    {
        int _3601 = _3246 << 4;
        int _3603 = _3601 + 2048;
        uint _3605 = uint(int(uint(_3603) >> uint(2)));
        uint _3607 = uint(int(uint(int(_3605)) >> uint(2)));
        int _3609 = int(_3605) & 3;
        float _3611 = (*spvDescriptorSet0.vp_c15)._m0[int(_3607)][_3609];
        int _3613 = int(_3605) + 1;
        uint _3615 = uint(int(uint(_3613) >> uint(2)));
        int _3617 = _3613 & 3;
        float _3619 = (*spvDescriptorSet0.vp_c15)._m0[int(_3615)][_3617];
        int _3621 = _3603 + 8;
        uint _3623 = uint(int(uint(_3621) >> uint(2)));
        uint _3625 = uint(int(uint(int(_3623)) >> uint(2)));
        int _3627 = int(_3623) & 3;
        float _3629 = (*spvDescriptorSet0.vp_c15)._m0[int(_3625)][_3627];
        int _3631 = int(_3623) + 1;
        uint _3633 = uint(int(uint(_3631) >> uint(2)));
        int _3635 = _3631 & 3;
        float _3637 = (*spvDescriptorSet0.vp_c15)._m0[int(_3633)][_3635];
        float _3639 = _2928 * _3619;
        float _3641 = fma(_2442, _3611, _3639);
        float _3643 = fma(_2450, _3629, _3641);
        float _3645 = _3643 + _3637;
        float _3647 = precise::clamp(_3645, 0.0, 1.0);
        float _3649 = -_3647;
        float _3651 = _3649 + _3595;
        float _3653 = fma(_3651, 500.0, 1.5);
        float _3655 = exp2(_3653);
        float _3657 = 0.0 + _3655;
        float _3659 = precise::clamp(_3657, 0.0, 1.0);
        _3472 = _3619;
        _3599 = _3659;
    }
    float _3661 = _3472;
    float _3663 = _3599;
    float _3665 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3667 = _3296 + _3665;
    float _3669 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3671 = _3298 + _3669;
    float _3673 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3675 = _3300 + _3673;
    float _3677 = _3667 * _3667;
    float _3679 = fma(_3671, _3671, _3677);
    float _3681 = fma(_3675, _3675, _3679);
    float _3683 = rsqrt(_3681);
    float _3685 = _3683 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3687 = _3671 * _3685;
    float _3689 = _3675 * _3685;
    float _3691 = _3687 * _3687;
    float _3693 = _3689 * _3689;
    float _3695 = _3691 + _3693;
    float _3697 = sqrt(_3695);
    bool _3699 = _3697 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3701 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3703 = _3697 + _3701;
    float _3705 = _3675;
    float _3707 = _3677;
    float _3709 = _3703;
    float _3711 = _3685;
    if (_3699)
    {
        float _3713 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3705 = _3713;
    }
    float _3715 = _3705;
    if (_3699)
    {
        float _3717 = rsqrt(_3695);
        _3707 = _3717;
    }
    float _3719 = _3707;
    float _3721 = _3719;
    if (_3699)
    {
        float _3723 = _3703 * _3715;
        _3709 = _3723;
    }
    float _3725 = _3709;
    if (_3699)
    {
        float _3727 = _3725 * 0.15915493667125701904296875;
        _3591 = _3727;
    }
    float _3729 = _3591;
    float _3731 = _3683;
    float _3733 = _3729;
    if (_3699)
    {
        float _3735 = _3729 * 6.283185482025146484375;
        float _3737 = sin(_3735);
        _3731 = _3737;
    }
    float _3739 = _3731;
    float _3741 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3743 = precise::max(0.0, _3741);
    float _3745 = _3661;
    float _3747 = _3743;
    float _3749 = _3741;
    if (_3699)
    {
        float _3751 = _3729 * 6.283185482025146484375;
        float _3753 = cos(_3751);
        _3745 = _3753;
    }
    float _3755 = _3745;
    float _3757 = -_3685;
    float _3759 = -_3743;
    float _3761 = fma(_3667, _3757, _3759);
    float _3763 = _3761;
    if (_3699)
    {
        float _3765 = _3761 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3747 = _3765;
    }
    float _3767 = _3747;
    float _3769 = _3739;
    float _3771 = _3767;
    if (_3699)
    {
        float _3773 = fma(_3739, _3767, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3769 = _3773;
    }
    float _3775 = _3769;
    float _3777 = _3775;
    if (!_3699)
    {
        _3771 = _3689;
    }
    float _3779 = _3771;
    float _3781 = _3779;
    float _3783 = _3755;
    if (_3699)
    {
        float _3785 = _3755 + (-1.0);
        _3749 = _3785;
    }
    float _3787 = _3749;
    if (_3699)
    {
        float _3789 = _3719 * _3775;
        _3711 = _3789;
    }
    float _3791 = _3711;
    if (!_3699)
    {
        _3777 = _3687;
    }
    float _3793 = _3777;
    float _3795 = _3793;
    if (_3699)
    {
        float _3797 = _3787 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3733 = _3797;
    }
    float _3799 = _3733;
    if (_3699)
    {
        float _3801 = _3687 * _3791;
        _3795 = _3801;
    }
    float _3803 = _3795;
    if (!_3699)
    {
        _3721 = _3691;
    }
    float _3805 = _3721;
    float _3807 = _3805;
    if (_3699)
    {
        float _3809 = _3689 * _3791;
        _3781 = _3809;
    }
    float _3811 = _3781;
    if (_3699)
    {
        float _3813 = fma(_3761, _3755, _3799);
        _3763 = _3813;
    }
    float _3815 = _3763;
    if (_3699)
    {
        float _3817 = _3803 * _3803;
        _3807 = _3817;
    }
    float _3819 = _3807;
    if (!_3699)
    {
        _3783 = _3693;
    }
    float _3821 = _3783;
    float _3823 = _3821;
    if (_3699)
    {
        float _3825 = _3811 * _3811;
        _3823 = _3825;
    }
    float _3827 = _3823;
    float _3829 = sqrt(_3681);
    float _3831 = fma(_3815, _3815, _3819);
    float _3833 = _3831 + _3827;
    float _3835 = rsqrt(_3833);
    float _3837 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3839 = fma(_3829, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3837);
    float _3841 = precise::clamp(_3839, 0.0, 1.0);
    float _3843 = -_3841;
    float _3845 = _3843 + 1.0;
    float _3847 = _3835 * _3815;
    float _3849 = _3835 * _3803;
    float _3851 = abs(_3845);
    float _3853 = log2(_3851);
    float _3855 = _3835 * _3811;
    float _3857 = _3849 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3859 = -_3857;
    float _3861 = fma(_3847, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3859);
    float _3863 = -_3855;
    float _3865 = fma(_3863, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3861);
    float _3867 = fma(_3865, -0.5, 0.5);
    float _3869 = _3853 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3871 = fma(_3865, 0.5, 0.5);
    float _3873 = sqrt(_3867);
    float _3875 = fma(_3871, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3877 = fma(_3871, _3875, -0.212114393711090087890625);
    float _3879 = _3847 + 1.0;
    float _3881 = exp2(_3869);
    float _3883 = fma(_3871, _3877, 1.570728778839111328125);
    float _3885 = _3873 * 0.636619746685028076171875;
    float _3887 = -_3883;
    float _3889 = fma(_3885, _3887, 1.0);
    float _3891 = -_3847;
    float _3893 = fma(_3881, _3879, _3891);
    float _3895 = fma(_3893, 0.5, 0.5);
    float2 _10341 = float2(_3889, _3895);
    float3 _3899 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10341, float2(0.0), isnan(_10341)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10341, float2(0.0), isnan(_10341)), level(0.0)).xyz;
    float _3901 = _3899.x;
    float _3903 = _3899.y;
    float _3905 = _3899.z;
    float _3907 = abs(_2980);
    float _3909 = log2(_3907);
    float _3911 = -_2886;
    float _3913 = _3911 + 1.0;
    out.m_88.x = _3298;
    out.m_88.y = _3296;
    out.m_88.z = _3300;
    bool _3915 = _3829 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3917 = isnan(_3829);
    bool _3919 = _3915 || _3917;
    bool _3921 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3923 = _3919 || _3921;
    bool _3925 = _2980 <= 8000.0;
    bool _3927 = isnan(_2980);
    bool _3929 = _3925 || _3927;
    bool _3931 = isnan(8000.0);
    bool _3933 = _3929 || _3931;
    float _3935 = float(_3933);
    float _3937 = _3909 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3939 = _3426 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3941 = fma(_3428, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3939);
    float _3943 = exp2(_3937);
    float _3945 = fma(_3432, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3941);
    float _3947 = fma(_3943, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3949 = precise::clamp(_3947, 0.0, 1.0);
    float _3951 = _3853 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3953 = fma(_3949, -2.0, 3.0);
    float _3955 = _3949 * _3949;
    float _3957 = exp2(_3951);
    float _3959 = _3955 * _3953;
    float _3961 = fma(_3452, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3945);
    float _3963 = -_3959;
    float _3965 = _3963 + 1.0;
    float _3967 = _3961 + _3466;
    out.gl_Position.x = _3504;
    out.gl_Position.y = _3506;
    out.gl_Position.z = _3961;
    out.gl_Position.w = _3466;
    float _3969 = fma(_3965, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3959);
    float _3971 = _3967 * 0.5;
    float _3973 = _3935 * _3969;
    float _3975 = _3935;
    float _3977 = _3961;
    if (!_3462)
    {
        _3975 = 1.0;
    }
    float _3979 = _3975;
    float _3981 = -_3957;
    float _3983 = _3981 + 1.0;
    float _3985 = _3979;
    if (_3462)
    {
        bool _3987 = _3574 >= _3510;
        bool _3989 = isnan(_3574);
        bool _3991 = _3987 || _3989;
        bool _3993 = isnan(_3510);
        bool _3995 = _3991 || _3993;
        float _3997 = float(_3995);
        _3985 = _3997;
    }
    float _3999 = _3985;
    float _4001 = _3973 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_90.z = _3971;
    out.m_90.w = _3466;
    float _4003 = _3983 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4005 = _3913 * _4001;
    float _4007 = precise::clamp(_4005, 0.0, 1.0);
    float _4009 = _3999 * _3663;
    float _4011 = _4003 * _3576;
    float _4013 = -_4003;
    float _4015 = _4013 + 1.0;
    float _4017 = -_4007;
    float _4019 = fma(_4017, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4021 = _4015;
    float _4023 = _4003;
    if (!_3923)
    {
        _3474 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4025 = _3474;
    float _4027 = _3587 * _4011;
    float _4029 = _3587 * _4015;
    float _4031 = -_4009;
    float _4033 = fma(_4031, _4019, 1.0);
    float _4035 = precise::clamp(_4033, 0.0, 1.0);
    float _4037 = _4027;
    float _4039 = _4025;
    float _4041 = _4025;
    if (!_3923)
    {
        _3476 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4043 = _3476;
    float _4045 = _4043;
    float _4047 = _4043;
    if (!_3923)
    {
        _3977 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4049 = _3977;
    float _4051 = _4035 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4053 = _4049;
    float _4055 = _4049;
    if (!_3923)
    {
        _4021 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4057 = _4021;
    float _4059 = _4057;
    float _4061 = _4057;
    if (!_3923)
    {
        _4023 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4063 = _4023;
    out.m_92.x = _4051;
    float _4065 = _3905 * _4011;
    float _4067 = fma(_3901, _4027, _3581);
    float _4069 = fma(_3903, _4027, _3583);
    float _4071 = _4063;
    float _4073 = _4063;
    if (!_3923)
    {
        _4037 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4075 = _4037;
    float _4077 = fma(_3587, _4065, _3585);
    out.m_94.x = _4067;
    out.m_94.y = _4069;
    out.m_94.z = _4077;
    out.m_94.w = _4029;
    bool _4079 = !_3923;
    float _4081 = _4075;
    float _4083 = _4075;
    if (!_4079)
    {
        bool _4085 = _3829 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4087 = isnan(_3829);
        bool _4089 = _4085 || _4087;
        bool _4091 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4093 = _4089 || _4091;
        if (!_4093)
        {
            float _4095 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4097 = _3829 + _4095;
            float _4099 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4101 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4099;
            float _4103 = 1.0 / _4101;
            float _4105 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4107 = _4105 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4109 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4111 = _4109 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4113 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4115 = _4113 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4117 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4119 = _4117 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4121 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4123 = _4121 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4125 = _4097 * _4103;
            float _4127 = precise::clamp(_4125, 0.0, 1.0);
            float _4129 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4131 = _4129 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4133 = fma(_4127, _4107, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4135 = fma(_4127, _4131, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4137 = fma(_4127, _4111, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4139 = fma(_4127, _4115, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4141 = fma(_4127, _4119, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4143 = fma(_4127, _4123, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4047 = _4135;
            _4061 = _4141;
            _4041 = _4133;
            _4083 = _4139;
            _4055 = _4137;
            _4073 = _4143;
            _4145 = true;
        }
        else
        {
            bool _4147 = _3829 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4149 = isnan(_3829);
            bool _4151 = _4147 || _4149;
            bool _4153 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4155 = _4151 || _4153;
            if (!_4155)
            {
                _4039 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4157 = _4039;
            _4041 = _4157;
            if (!_4155)
            {
                _4045 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4159 = _4045;
            _4047 = _4159;
            if (!_4155)
            {
                _4053 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4161 = _4053;
            _4055 = _4161;
            if (!_4155)
            {
                _4081 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4163 = _4081;
            _4083 = _4163;
            if (!_4155)
            {
                _4059 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4165 = _4059;
            _4061 = _4165;
            if (!_4155)
            {
                _4071 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4167 = _4071;
            bool _4169 = !_4155;
            _4073 = _4167;
            if (!_4169)
            {
                bool _4171 = _3829 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4173 = isnan(_3829);
                bool _4175 = _4171 || _4173;
                bool _4177 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4179 = _4175 || _4177;
                if (!_4179)
                {
                    float _4181 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4183 = _3829 + _4181;
                    float _4185 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4187 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4185;
                    float _4189 = 1.0 / _4187;
                    float _4191 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4193 = _4191 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4195 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4197 = _4195 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4199 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4201 = _4199 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4203 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4205 = _4203 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4207 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4209 = _4207 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4211 = _4183 * _4189;
                    float _4213 = precise::clamp(_4211, 0.0, 1.0);
                    float _4215 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4217 = _4215 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4219 = fma(_4213, _4193, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4221 = fma(_4213, _4217, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4223 = fma(_4213, _4197, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4225 = fma(_4213, _4201, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4227 = fma(_4213, _4205, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4229 = fma(_4213, _4209, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4047 = _4221;
                    _4061 = _4227;
                    _4041 = _4219;
                    _4083 = _4225;
                    _4055 = _4223;
                    _4073 = _4229;
                    _4145 = true;
                }
                else
                {
                    _4047 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4061 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4041 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4083 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4055 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4073 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4145 = false;
    float _4231 = _4047;
    float _4233 = _4061;
    float _4235 = _4041;
    float _4237 = _4083;
    float _4239 = _4055;
    float _4241 = _4073;
    float _4243 = fma(_2790, -0.5, 0.5);
    float _4245 = precise::clamp(_4243, 0.0, 1.0);
    float _4247 = -_4231;
    float _4249 = _4247 + _4233;
    float _4251 = -_4235;
    float _4253 = _4251 + _4237;
    float _4255 = -_4239;
    float _4257 = _4255 + _4241;
    bool _4259 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4261 = fma(_4245, _4249, _4231);
    float _4263 = fma(_4245, _4253, _4235);
    float _4265 = fma(_4245, _4257, _4239);
    float _4267 = _4261 * 0.586610972881317138671875;
    out.m_96.x = 0.0;
    float _4269 = fma(_4263, 0.298911988735198974609375, _4267);
    float _4271 = fma(_4265, 0.114477999508380889892578125, _4269);
    float _4273 = -_4271;
    float _4275 = _4263 + _4273;
    float _4277 = -_4271;
    float _4279 = _4261 + _4277;
    float _4281 = -_4271;
    float _4283 = _4265 + _4281;
    float _4285 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4287 = fma(_4275, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4271);
    float _4289 = fma(_4279, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4271);
    float _4291 = fma(_4283, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4271);
    out.m_61.x = _4285;
    out.m_98.x = _4287;
    out.m_98.y = _4289;
    out.m_98.z = _4291;
    if (!_4259)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4293 = -_3296;
    float _4295 = _4293 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4297 = -_3298;
    float _4299 = _4297 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4301 = -_3300;
    float _4303 = _4301 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4305 = _4295 * _4295;
    float _4307 = fma(_4299, _4299, _4305);
    float _4309 = fma(_4303, _4303, _4307);
    float _4311 = sqrt(_4309);
    float _4313 = rsqrt(_4309);
    float _4315 = -_4311;
    float _4317 = _4315 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4319 = _4317 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4321 = precise::clamp(_4319, 0.0, 1.0);
    float _4323 = _4299 * _4313;
    float _4325 = _4295 * _4313;
    float _4327 = abs(_4321);
    float _4329 = log2(_4327);
    float _4331 = _4303 * _4313;
    float _4333 = _4323 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4335 = _2790 * _4325;
    float _4337 = -_4325;
    float _4339 = -_4333;
    float _4341 = fma(_4337, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4339);
    float _4343 = fma(_2788, _4323, _4335);
    float _4345 = -_4331;
    float _4347 = fma(_4345, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4341);
    float _4349 = fma(_2792, _4331, _4343);
    float _4351 = precise::clamp(_4349, 0.0, 1.0);
    float _4353 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4355 = _4347 + _4353;
    float _4357 = _4329 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4359 = _4355 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4361 = precise::clamp(_4359, 0.0, 1.0);
    float _4363 = exp2(_4357);
    float _4365 = _4363 * _4361;
    float _4367 = _4351 * _4365;
    float _4369 = _4367 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4371 = _4367 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4373 = _4367 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_96.x = _4369;
    out.m_96.y = _4371;
    out.m_96.z = _4373;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4145 = false;
    bool _2838 = false;
    bool _953 = false;
    bool _781 = false;
    bool _563 = false;
    bool _387 = false;
    bool _239 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_58.w;
    float _114 = trunc(_112);
    int _117 = int(_114);
    bool _121 = _117 >= 1;
    float _123 = 0.0;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    float _127 = _125;
    if (!_121)
    {
        out.m_61.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _125 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4430 = as_type<float>(_133);
        out.gl_Position.z = _4430;
    }
    if (!_121)
    {
        return out;
    }
    float _137 = in.m_63.w;
    bool _139 = _137 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_137);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = -_137;
    float _151 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_147)
    {
        float _153 = float(_117);
        _127 = _153;
    }
    float _155 = _127;
    bool _157 = _151 >= _155;
    bool _159 = !_147;
    bool _161 = _157 || _159;
    float _163 = _155;
    if (_161)
    {
        _163 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _163;
    if (_161)
    {
        out.m_61.x = 0.0;
    }
    if (_161)
    {
        float _167 = _165 * 5.0;
        _135 = as_type<int>(_167);
    }
    int _169 = _135;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4499 = as_type<float>(_169);
        out.gl_Position.z = _4499;
    }
    if (_161)
    {
        return out;
    }
    float _171 = as_type<float>(int(gl_VertexIndex));
    float _173 = in.m_68.x;
    float _175 = in.m_68.y;
    float _177 = in.m_68.z;
    int _179 = as_type<int>(_171) & 1;
    bool _181 = _179 != 0;
    int _183 = as_type<int>(_171) & 2;
    bool _185 = _183 != 0;
    bool _187 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _189 = _175 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _191 = _175 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _193 = _175 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _195 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[4].x, _189);
    float _197 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[5].x, _191);
    float _199 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[6].x, _193);
    float _201 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[4].z, _195);
    float _203 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[5].z, _197);
    float _205 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[6].z, _199);
    bool _207 = !_181;
    float _209 = _207 ? (-0.5) : 0.5;
    bool _211 = !_185;
    float _213 = _211 ? (-0.5) : 0.5;
    bool _215 = !_187;
    float _217 = _213;
    int _219 = as_type<int>(_203);
    float _237;
    if (!_215)
    {
        float _221 = in.m_70.x;
        float _223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _225 = _221 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _227 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[12].x, _151);
        float _229 = _227 * _223;
        float _231 = floor(_229);
        float _233 = -_231;
        float _235 = _229 + _233;
        _237 = _235;
        _239 = true;
    }
    else
    {
        float _241 = float(_117);
        float _243 = 1.0 / _241;
        float _245 = _151 * _243;
        _237 = _245;
    }
    _239 = false;
    float _247 = _237;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _251 = _247 + _249;
    bool _253 = _247 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _255 = isnan(_247);
    bool _257 = _253 || _255;
    bool _259 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _261 = _257 || _259;
    float _263 = float(_261);
    bool _265 = _247 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _267 = isnan(_247);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _283 = _281 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _285 = -_263;
    float _287 = _285 + 1.0;
    float _289 = 1.0 / _279;
    bool _291 = _247 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _293 = isnan(_247);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = _275 * _287;
    float _305 = -_275;
    float _307 = _305 + 1.0;
    bool _309 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _311 = _301 * _307;
    float _313 = 1.0 / _283;
    float _315 = -_301;
    float _317 = _315 + 1.0;
    float _319 = _251 * _289;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _323 = _247 + _321;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _325;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _329;
    float _333 = fma(_327, _319, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _335 = fma(_331, _319, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _337 = _323 * _313;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _343 = _333 * _311;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _349 = _335 * _311;
    float _351 = fma(_341, _337, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _353 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[143].x, _343);
    float _355 = fma(_347, _337, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _357 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[143].y, _349);
    float _359 = fma(_351, _303, _353);
    float _361 = fma(_355, _303, _357);
    float _363 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[145].x, _359);
    float _365 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[145].y, _361);
    bool _367 = !_309;
    float _385;
    if (!_367)
    {
        float _369 = in.m_70.x;
        float _371 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _373 = _369 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _375 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[11].x, _151);
        float _377 = _375 * _371;
        float _379 = floor(_377);
        float _381 = -_379;
        float _383 = _377 + _381;
        _385 = _383;
        _387 = true;
    }
    else
    {
        float _389 = float(_117);
        float _391 = 1.0 / _389;
        float _393 = _151 * _391;
        _385 = _393;
    }
    _387 = false;
    float _395 = _385;
    float _397 = in.m_72.x;
    float _399 = in.m_72.y;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _403 = _395 + _401;
    bool _405 = _395 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _407 = isnan(_395);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _417;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _425 = _395 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _427 = isnan(_395);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    float _437 = 1.0 / _423;
    bool _439 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _441 = 1.0 / _419;
    float _443 = _365 * _399;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _447 = _395 + _445;
    bool _449 = _395 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _451 = isnan(_395);
    bool _453 = _449 || _451;
    bool _455 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _457 = _453 || _455;
    float _459 = float(_457);
    float _461 = _363 * _397;
    float _463 = _447 * _437;
    float _465 = -_459;
    float _467 = _465 + 1.0;
    float _469 = _403 * _441;
    float _471 = -_415;
    float _473 = _471 + 1.0;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _475;
    float _479 = _435 * _467;
    float _481 = -_435;
    float _483 = _481 + 1.0;
    float _485 = _459 * _473;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _487;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _491;
    float _495 = fma(_477, _469, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _497 = fma(_489, _469, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _499 = fma(_493, _469, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _501 = _495 * _479;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _505 = _503 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _507 = _497 * _479;
    float _509 = _499 * _479;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _519 = fma(_505, _463, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _521 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[107].x, _507);
    float _523 = fma(_513, _463, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _525 = fma(_517, _463, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _527 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[107].y, _501);
    float _529 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[107].z, _509);
    float _531 = fma(_523, _485, _521);
    float _533 = fma(_519, _485, _527);
    float _535 = fma(_525, _485, _529);
    float _537 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[109].x, _531);
    float _539 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[109].y, _533);
    float _541 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[109].z, _535);
    bool _543 = !_439;
    float _561;
    if (!_543)
    {
        float _545 = in.m_70.x;
        float _547 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _549 = _545 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _551 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[11].y, _151);
        float _553 = _551 * _547;
        float _555 = floor(_553);
        float _557 = -_555;
        float _559 = _553 + _557;
        _561 = _559;
        _563 = true;
    }
    else
    {
        float _565 = float(_117);
        float _567 = 1.0 / _565;
        float _569 = _151 * _567;
        _561 = _569;
    }
    _563 = false;
    float _571 = _561;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _575 = _571 + _573;
    float _577 = _537 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _581 = _579 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _583;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _589 = _587 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _591 = _571 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _593 = isnan(_571);
    bool _595 = _591 || _593;
    bool _597 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _599 = _595 || _597;
    float _601 = float(_599);
    float _603 = 1.0 / _581;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _609 = _571 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _611 = isnan(_571);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = _539 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _623 = _541 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _625 = _577 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _627 = _621 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _629 = 1.0 / _589;
    float _631 = _623 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _633 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _635 = _585 * _603;
    bool _637 = _571 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _639 = isnan(_571);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _645 = _641 || _643;
    float _647 = float(_645);
    float _649 = 1.0 / _607;
    float _651 = -_601;
    float _653 = _651 + 1.0;
    float _655 = fma(_635, _575, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _661 = _571 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _663 = isnan(_571);
    bool _665 = _661 || _663;
    bool _667 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _669 = _665 || _667;
    float _671 = float(_669);
    float _673 = -_647;
    float _675 = _673 + 1.0;
    float _677 = _647 * _653;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _681 = _679 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _683 = 1.0 / _659;
    float _685 = -_671;
    float _687 = _685 + 1.0;
    float _689 = _619 * _675;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _691;
    float _695 = _681 * _629;
    float _697 = _601 * _687;
    float _699 = _655 * _689;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _703 = _571 + _701;
    float _705 = -_619;
    float _707 = _705 + 1.0;
    bool _709 = _571 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _711 = isnan(_571);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = _693 * _649;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _725 = _723 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _729 = _571 + _727;
    float _731 = fma(_695, _703, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _733 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[115].x, _699);
    float _735 = -_719;
    float _737 = _735 + 1.0;
    float _739 = _725 * _683;
    float _741 = fma(_721, _729, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _745 = _571 + _743;
    float _747 = fma(_731, _677, _733);
    float _749 = _671 * _737;
    float _751 = fma(_739, _745, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _753 = fma(_741, _697, _747);
    float _755 = fma(_751, _749, _753);
    float _757 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[119].x, _755);
    float _759 = _757 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_74.x = _625;
    out.m_74.y = _627;
    out.m_74.z = _631;
    out.m_74.w = _759;
    bool _761 = !_633;
    float _779;
    if (!_761)
    {
        float _763 = in.m_70.x;
        float _765 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _767 = _763 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _769 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[11].z, _151);
        float _771 = _769 * _765;
        float _773 = floor(_771);
        float _775 = -_773;
        float _777 = _771 + _775;
        _779 = _777;
        _781 = true;
    }
    else
    {
        float _783 = float(_117);
        float _785 = 1.0 / _783;
        float _787 = _151 * _785;
        _779 = _787;
    }
    _781 = false;
    float _789 = _779;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _793 = _789 + _791;
    bool _795 = _789 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _797 = isnan(_789);
    bool _799 = _795 || _797;
    bool _801 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _803 = _799 || _801;
    float _805 = float(_803);
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _809 = _789 + _807;
    bool _811 = _789 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _813 = isnan(_789);
    bool _815 = _811 || _813;
    bool _817 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _819 = _815 || _817;
    float _821 = float(_819);
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _823;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _829 = _827 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _831 = _789 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _833 = isnan(_789);
    bool _835 = _831 || _833;
    bool _837 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _839 = _835 || _837;
    float _841 = float(_839);
    float _843 = -_805;
    float _845 = _843 + 1.0;
    float _847 = 1.0 / _829;
    float _849 = _841 * _845;
    float _851 = -_841;
    float _853 = _851 + 1.0;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _855;
    bool _859 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _861 = 1.0 / _825;
    float _863 = _821 * _853;
    float _865 = -_821;
    float _867 = _865 + 1.0;
    float _869 = _793 * _861;
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _871;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _875;
    float _879 = fma(_857, _869, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _881 = fma(_873, _869, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _883 = fma(_877, _869, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _885 = _809 * _847;
    float _887 = _879 * _863;
    float _889 = _881 * _863;
    float _891 = _883 * _863;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _895 = _893 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _899 = _897 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _901 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _903 = _901 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _905 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[123].x, _887);
    float _907 = fma(_895, _885, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _909 = fma(_899, _885, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _911 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[123].y, _889);
    float _913 = fma(_903, _885, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _915 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[123].z, _891);
    float _917 = fma(_907, _849, _905);
    float _919 = fma(_909, _849, _911);
    float _921 = fma(_913, _849, _915);
    float _923 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[125].x, _917);
    float _925 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[125].y, _919);
    float _927 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[125].z, _921);
    bool _929 = !_859;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _933 = _923;
    float _951;
    if (!_929)
    {
        float _935 = in.m_70.x;
        float _937 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _939 = _935 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _941 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[11].w, _151);
        float _943 = _941 * _937;
        float _945 = floor(_943);
        float _947 = -_945;
        float _949 = _943 + _947;
        _951 = _949;
        _953 = true;
    }
    else
    {
        float _955 = float(_117);
        float _957 = 1.0 / _955;
        float _959 = _151 * _957;
        _951 = _959;
    }
    _953 = false;
    float _961 = _951;
    float _963 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _965 = int(_963);
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _969 = _961 + _967;
    float _971 = float(_117);
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _975 = _973 != 0;
    float _977 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _979 = int(_977);
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _983 = _981 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _987 = _985 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _989 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _991 = int(_989);
    float _993 = float(_965);
    if (_975)
    {
        float _995 = in.m_70.x;
        _931 = _995;
    }
    float _997 = _931;
    float _999 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1003 = _997;
    if (!_975)
    {
        float _1005 = in.m_70.y;
        _1003 = _1005;
    }
    float _1007 = _1003;
    float _1009 = 1.0 / _993;
    float _1011 = float(uint(_979));
    int _1013 = ~_979;
    int _1015 = _1013 + 1;
    bool _1017 = _979 == 0;
    float _1019 = 1.0 / _1011;
    float _1021 = float(uint(_991));
    float _1023 = _151 * _1009;
    float _1025 = 1.0 / _1021;
    int _1027 = as_type<int>(_1019) + (-2);
    float _1029 = trunc(_1023);
    int _1031 = int(_1029);
    int _1033 = ~_979;
    int _1035 = _1033 + 1;
    float _1037 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1039 = int(_1037);
    int _1041 = as_type<int>(_1025) + (-2);
    float _1043 = float(uint(_1031));
    float _1045 = 1.0 / _971;
    float _1047 = as_type<float>(_1027) * _1043;
    float _1049 = float(_1039);
    float _1051 = trunc(_1047);
    float _1053 = precise::max(_1051, 0.0);
    uint _1056 = uint(_1053);
    float _1058 = 1.0 / _1049;
    int _1060 = _1035 * int(_1056);
    int _1062 = _1060 + _1031;
    float _1064 = float(_979);
    float _1066 = 1.0 / _983;
    float _1068 = float(uint(_1062));
    float _1070 = in.m_70.x;
    float _1072 = in.m_70.y;
    float _1074 = in.m_70.z;
    float _1076 = in.m_70.w;
    float _1078 = _151 * _1058;
    float _1080 = float(_1031);
    float _1082 = as_type<float>(_1027) * _1068;
    float _1084 = _1068;
    if (_975)
    {
        _1084 = 1.0;
    }
    float _1086 = _1084;
    float _1088 = 1.0 / _987;
    float _1090 = _1086;
    if (!_975)
    {
        _1090 = 7.345489978790283203125;
    }
    float _1092 = _1090;
    bool _1094 = _1080 >= _1064;
    bool _1096 = isnan(_1080);
    bool _1098 = _1094 || _1096;
    bool _1100 = isnan(_1064);
    bool _1102 = _1098 || _1100;
    float _1104 = float(_1102);
    float _1106 = trunc(_1082);
    float _1108 = precise::max(_1106, 0.0);
    uint _1110 = uint(_1108);
    float _1112 = trunc(_1078);
    int _1114 = int(_1112);
    int _1116 = int(_1056) + int(_1110);
    float _1118 = _1092 * _1070;
    float _1120 = _1092;
    float _1122 = _1070;
    float _1124 = _1074;
    if (_975)
    {
        _1120 = 1.0;
    }
    float _1126 = _1120;
    float _1128 = _1126;
    if (!_975)
    {
        _1128 = 1.2345600128173828125;
    }
    float _1130 = _1128;
    int _1132 = _1015 * _1116;
    int _1134 = _1132 + _1031;
    float _1136 = floor(_1118);
    float _1138 = float(uint(_1114));
    bool _1140 = uint(_1134) >= uint(_979);
    float _1142 = _1007 * _1130;
    int _1144 = _979 + (-1);
    float _1146 = trunc(_1104);
    int _1148 = int(_1146);
    bool _1150 = !_1140;
    int _1152 = _1150 ? 0 : (-1);
    int _1154 = ~_1116;
    int _1156 = _1154 + _1152;
    int _1158 = _1156 + 1;
    float _1160 = floor(_1142);
    float _1162 = as_type<float>(_1041) * _1138;
    int _1164 = _979 * _1158;
    int _1166 = _1164 + _1031;
    float _1168 = -_1136;
    float _1170 = _1118 + _1168;
    bool _1172 = !_1017;
    int _1174 = _1172 ? _1166 : (-1);
    float _1176 = trunc(_1162);
    float _1178 = precise::max(_1176, 0.0);
    uint _1180 = uint(_1178);
    int _1182 = ~_1148;
    int _1184 = _1182 + 1;
    int _1186 = _1184 + 1;
    float _1188 = _1170 * _1064;
    int _1190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1192 = _1190 != 0;
    int _1194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1196 = _1194 != 0;
    int _1198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1200 = _1198 != 0;
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1204 = _1202 != 0;
    int _1206 = _1174 * _1186;
    float _1208 = -_1160;
    float _1210 = _1142 + _1208;
    int _1212 = ~_991;
    int _1214 = _1212 + 1;
    int _1216 = _1148 * _1144;
    int _1218 = _1216 + _1206;
    float _1220 = _151 * _1045;
    float _1222 = trunc(_1188);
    int _1224 = int(_1222);
    bool _1226 = !_1196;
    int _1228 = _1226 ? 0 : 1;
    float _1230 = _1220 * _1064;
    int _1232 = _1214 * int(_1180);
    int _1234 = _1232 + _1114;
    int _1236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1238 = _1236 != 0;
    bool _1240 = !_1192;
    int _1242 = _1240 ? 0 : 1;
    float _1244 = float(uint(_1234));
    float _1246 = trunc(_1230);
    int _1248 = int(_1246);
    bool _1250 = !_1238;
    int _1252 = _1250 ? 0 : 1;
    int _1254 = abs(_1228);
    float _1256 = as_type<float>(_1041) * _1244;
    int _1258 = abs(_1242);
    int _1260 = abs(_1252);
    int _1262 = _1218 * _1254;
    bool _1264 = !_1200;
    int _1266 = _1264 ? 0 : 1;
    float _1268 = trunc(_1256);
    float _1270 = precise::max(_1268, 0.0);
    uint _1272 = uint(_1270);
    bool _1274 = !_1204;
    int _1276 = _1274 ? 0 : 1;
    int _1278 = _1224 * _1260;
    int _1280 = _1278 + _1031;
    int _1282 = abs(_1266);
    int _1284 = ~_991;
    int _1286 = _1284 + 1;
    int _1288 = _1248 * _1258;
    int _1290 = _1288 + _1262;
    int _1292 = abs(_1276);
    float _1294 = float(_991);
    int _1296 = _1280 * _1282;
    int _1298 = _1296 + _1290;
    float _1300 = float(_1114);
    int _1302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1304 = _1302 != 0;
    int _1306 = _1224 * _1292;
    int _1308 = _1306 + _1298;
    bool _1310 = _1300 >= _1294;
    bool _1312 = isnan(_1300);
    bool _1314 = _1310 || _1312;
    bool _1316 = isnan(_1294);
    bool _1318 = _1314 || _1316;
    float _1320 = float(_1318);
    int _1322 = int(_1180) + int(_1272);
    float _1324 = _1210 * _1294;
    float _1326 = _1220 * _1294;
    float _1328 = float(uint(_1308));
    float _1330 = trunc(_1320);
    int _1332 = int(_1330);
    int _1334 = _1286 * _1322;
    int _1336 = _1334 + _1114;
    float _1338 = as_type<float>(_1027) * _1328;
    bool _1340 = !_1304;
    int _1342 = _1340 ? 0 : 1;
    bool _1344 = uint(_1336) >= uint(_991);
    float _1346 = trunc(_1324);
    int _1348 = int(_1346);
    int _1350 = abs(_1342);
    bool _1352 = !_1344;
    int _1354 = _1352 ? 0 : (-1);
    int _1356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1358 = _1356 != 0;
    int _1360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1362 = _1360 != 0;
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1366 = _1364 != 0;
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1370 = _1368 != 0;
    int _1372 = ~_1322;
    int _1374 = _1372 + _1354;
    int _1376 = _1374 + 1;
    float _1378 = trunc(_1338);
    float _1380 = precise::max(_1378, 0.0);
    uint _1382 = uint(_1380);
    int _1384 = ~_979;
    int _1386 = _1384 + 1;
    bool _1388 = _991 == 0;
    int _1390 = _991 * _1376;
    int _1392 = _1390 + _1114;
    int _1394 = ~_1332;
    int _1396 = _1394 + 1;
    int _1398 = _1396 + 1;
    int _1400 = _1348 * _1350;
    int _1402 = _1400 + _1114;
    bool _1404 = !_1388;
    int _1406 = _1404 ? _1392 : (-1);
    float _1408 = trunc(_1326);
    int _1410 = int(_1408);
    int _1412 = _991 + (-1);
    bool _1414 = _979 == 0;
    int _1416 = _1406 * _1398;
    bool _1418 = !_1362;
    int _1420 = _1418 ? 0 : 1;
    int _1422 = _1386 * int(_1382);
    int _1424 = _1422 + _1308;
    int _1426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1428 = _1426 != 0;
    int _1430 = _1332 * _1412;
    int _1432 = _1430 + _1416;
    int _1434 = abs(_1420);
    float _1436 = float(uint(_1424));
    bool _1438 = !_1358;
    int _1440 = _1438 ? 0 : 1;
    int _1442 = _1432 * _1434;
    bool _1444 = !_1366;
    int _1446 = _1444 ? 0 : 1;
    float _1448 = as_type<float>(_1027) * _1436;
    int _1450 = abs(_1440);
    int _1452 = abs(_1446);
    bool _1454 = !_1370;
    int _1456 = _1454 ? 0 : 1;
    float _1458 = trunc(_1448);
    float _1460 = precise::max(_1458, 0.0);
    uint _1462 = uint(_1460);
    float _1464 = float(uint(_1280));
    int _1466 = _1410 * _1450;
    int _1468 = _1466 + _1442;
    int _1470 = abs(_1456);
    float _1472 = as_type<float>(_1027) * _1464;
    float _1474 = float(uint(_1402));
    int _1476 = _1402 * _1452;
    int _1478 = _1476 + _1468;
    int _1480 = 0;
    if (_1428)
    {
        _1480 = 0;
    }
    int _1482 = _1480;
    float _1484 = trunc(_1472);
    float _1486 = precise::max(_1484, 0.0);
    uint _1488 = uint(_1486);
    int _1490 = _1482;
    if (!_1428)
    {
        _1490 = 1;
    }
    int _1492 = _1490;
    int _1494 = _1348 * _1470;
    int _1496 = _1494 + _1478;
    int _1498 = ~_979;
    int _1500 = _1498 + 1;
    float _1502 = as_type<float>(_1041) * _1474;
    int _1504 = ~_979;
    int _1506 = _1504 + 1;
    int _1508 = int(_1382) + int(_1462);
    float _1510 = float(uint(_1496));
    float _1512 = trunc(_1502);
    float _1514 = precise::max(_1512, 0.0);
    uint _1516 = uint(_1514);
    int _1518 = ~_991;
    int _1520 = _1518 + 1;
    int _1522 = _1500 * _1508;
    int _1524 = _1522 + _1308;
    float _1526 = as_type<float>(_1041) * _1510;
    int _1528 = _1506 * int(_1488);
    int _1530 = _1528 + _1280;
    bool _1532 = uint(_1524) >= uint(_979);
    int _1534 = ~_991;
    int _1536 = _1534 + 1;
    float _1538 = trunc(_1526);
    float _1540 = precise::max(_1538, 0.0);
    uint _1542 = uint(_1540);
    bool _1544 = !_1532;
    int _1546 = _1544 ? 0 : (-1);
    float _1548 = float(uint(_1530));
    int _1550 = ~_1508;
    int _1552 = _1550 + _1546;
    int _1554 = _1552 + 1;
    int _1556 = _1520 * int(_1516);
    int _1558 = _1556 + _1402;
    float _1560 = as_type<float>(_1027) * _1548;
    int _1562 = _979 * _1554;
    int _1564 = _1562 + _1308;
    float _1566 = float(uint(_1558));
    float _1568 = trunc(_1560);
    float _1570 = precise::max(_1568, 0.0);
    uint _1572 = uint(_1570);
    bool _1574 = !_1414;
    int _1576 = _1574 ? _1564 : (-1);
    int _1578 = _1536 * int(_1542);
    int _1580 = _1578 + _1496;
    float _1582 = as_type<float>(_1041) * _1566;
    int _1584 = _1576 & 3;
    bool _1586 = _1584 != 0;
    float _1588 = float(uint(_1580));
    float _1590 = trunc(_1582);
    float _1592 = precise::max(_1590, 0.0);
    uint _1594 = uint(_1592);
    bool _1596 = uint(_1584) > 1u;
    int _1598 = _1576 & 3;
    bool _1600 = _1598 != 0;
    float _1602 = as_type<float>(_1041) * _1588;
    bool _1604 = _1584 != 3;
    int _1606 = _1600 ? 0 : 1;
    float _1608 = trunc(_1602);
    float _1610 = precise::max(_1608, 0.0);
    uint _1612 = uint(_1610);
    bool _1614 = uint(_1584) >= 2u;
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1618 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1616;
    int _1620 = int(_1488) + int(_1572);
    float _1622 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1624 = _1622 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _1626 = ~_1606;
    int _1628 = _1626 + 1;
    int _1630 = _1628 + 1;
    float _1632 = _1618 * _1066;
    int _1634 = _1630;
    if (!_1596)
    {
        int _1636 = ~_1606;
        int _1638 = _1636 + 1;
        _1634 = _1638;
    }
    int _1640 = _1634;
    int _1642 = _1614 ? 0 : 1;
    int _1644 = ~_979;
    int _1646 = _1644 + 1;
    int _1648 = ~_991;
    int _1650 = _1648 + 1;
    int _1652 = ~_1642;
    int _1654 = _1652 + 1;
    int _1656 = _1654 + 1;
    int _1658 = _1646 * _1620;
    int _1660 = _1658 + _1280;
    int _1662 = _1656;
    if (_1604)
    {
        int _1664 = ~_1642;
        int _1666 = _1664 + 1;
        _1662 = _1666;
    }
    int _1668 = _1662;
    int _1670 = int(_1516) + int(_1594);
    bool _1672 = _1076 > 0.5;
    bool _1674 = uint(_1660) >= uint(_979);
    int _1676 = _1650 * _1670;
    int _1678 = _1676 + _1402;
    int _1680 = int(_1542) + int(_1612);
    float _1682 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1684 = ~_991;
    int _1686 = _1684 + 1;
    float _1688 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1690 = -_999;
    float _1692 = fma(_1682, 2.0, _1690);
    int _1694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1696 = _1694 != 0;
    int _1698 = _1686 * _1680;
    int _1700 = _1698 + _1496;
    bool _1702 = !_1674;
    int _1704 = _1702 ? 0 : (-1);
    float _1706 = fma(_1688, -2.0, _1001);
    bool _1708 = !_1696;
    int _1710 = _1708 ? 0 : 1;
    float _1712 = -_151;
    float _1714 = fma(_1712, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1692);
    int _1716 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1718 = _1716 != 0;
    float _1720 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1706);
    bool _1722 = uint(_1678) >= uint(_991);
    float _1724 = in.m_58.x;
    float _1726 = in.m_58.y;
    float _1728 = in.m_58.z;
    bool _1730 = uint(_1700) >= uint(_991);
    bool _1732 = !_1722;
    int _1734 = _1732 ? 0 : (-1);
    bool _1736 = _1070 > 0.5;
    float _1738 = -_209;
    int _1740 = _1736 ? as_type<int>(_1738) : as_type<int>(_209);
    bool _1742 = !_1730;
    int _1744 = _1742 ? 0 : (-1);
    float _1746 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1748 = _1746 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1750 = _1072 > 0.5;
    bool _1752 = !_1718;
    float _1754 = _1752 ? _209 : as_type<float>(_1740);
    int _1756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1758 = _1756 != 0;
    float _1760 = 1.0 / _1748;
    float _1762 = -_213;
    int _1764 = _1750 ? as_type<int>(_1762) : as_type<int>(_213);
    int _1766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1768 = _1766 != 0;
    bool _1770 = !_1758;
    float _1772 = _1770 ? _213 : as_type<float>(_1764);
    float _1774 = _1726 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _1776 = _1074 > 0.5;
    float _1778 = _1726 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1780 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1782 = _1780 != 0;
    float _1784 = fma(_1724, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1774);
    float _1786 = -_209;
    int _1788 = _1776 ? as_type<int>(_1786) : as_type<int>(_209);
    float _1790 = fma(_1724, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1778);
    int _1792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1794 = _1792 != 0;
    float _1796 = _1726 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1798 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1800 = isnan(_961);
    bool _1802 = _1798 || _1800;
    bool _1804 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1806 = _1802 || _1804;
    float _1808 = float(_1806);
    float _1810 = _1624 * _1760;
    bool _1812 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1814 = isnan(_961);
    bool _1816 = _1812 || _1814;
    bool _1818 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1820 = _1816 || _1818;
    float _1822 = float(_1820);
    float _1824 = fma(_1724, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1796);
    float _1826 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1828 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1826;
    float _1830 = -_1808;
    float _1832 = _1830 + 1.0;
    bool _1834 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1836 = isnan(_961);
    bool _1838 = _1834 || _1836;
    bool _1840 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1842 = _1838 || _1840;
    float _1844 = float(_1842);
    float _1846 = fma(_1728, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1790);
    float _1848 = _1828 * _1088;
    float _1850 = _1822 * _1832;
    bool _1852 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1854 = isnan(_961);
    bool _1856 = _1852 || _1854;
    bool _1858 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1860 = _1856 || _1858;
    float _1862 = float(_1860);
    float _1864 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1866 = _961 + _1864;
    float _1868 = -_1844;
    float _1870 = _1868 + 1.0;
    float _1872 = -_1822;
    float _1874 = _1872 + 1.0;
    bool _1876 = !_1794;
    float _1878 = _1876 ? _209 : as_type<float>(_1788);
    float _1880 = fma(_1632, _1866, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1882 = _1862 * _1870;
    float _1884 = _1844 * _1874;
    float _1886 = fma(_1728, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1784);
    bool _1888 = _1492 != 1;
    float _1890 = fma(_1728, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1824);
    float _1892 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1894 = _961 + _1892;
    float _1896 = _1880 * _1882;
    float _1898 = _1754 + 0.5;
    float _1900 = -_1862;
    float _1902 = _1900 + 1.0;
    float _1904 = fma(_1848, _1894, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1906 = fma(_1810, _969, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1908 = fma(_1898, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1714);
    float _1910 = fma(_1902, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1896);
    float _1912 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1914 = _1772 + (-0.5);
    int _1916 = ~_1680;
    int _1918 = _1916 + _1744;
    int _1920 = _1918 + 1;
    float _1922 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1912);
    float _1924 = -_1914;
    float _1926 = -_1720;
    float _1928 = fma(_1924, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1926);
    float _1930 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1932 = _1720;
    float _1934 = _1714;
    if (!_1888)
    {
        _1932 = _1072;
    }
    float _1936 = _1932;
    int _1938 = _991 * _1920;
    int _1940 = _1938 + _1496;
    float _1942 = _1936;
    if (!_1888)
    {
        _1934 = _1072;
    }
    float _1944 = _1934;
    float _1946 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1930);
    float _1948 = _1944;
    if (_1888)
    {
        _1942 = _1070;
    }
    float _1950 = _1942;
    float _1952 = fma(_1906, _1884, _1910);
    if (_1888)
    {
        _1948 = _1070;
    }
    float _1954 = _1948;
    float _1956 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1922);
    if (!_1888)
    {
        _1122 = _1074;
    }
    float _1958 = _1122;
    float _1960 = fma(_1904, _1850, _1952);
    float _1962 = _1958;
    if (_1888)
    {
        _1124 = _1072;
    }
    float _1964 = _1124;
    float _1966 = _1846 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (_1888)
    {
        _1962 = _1072;
    }
    float _1968 = _1962;
    float _1970 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1972 = _1886 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1974 = _1576 >> 31;
    float _1976 = fma(_1954, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1970);
    bool _1978 = !_1388;
    int _1980 = _1978 ? _1940 : (-1);
    float _1982 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1984 = _1974 & 3;
    float _1986 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1946);
    int _1988 = _1980 >> 31;
    float _1990 = fma(_1968, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1982);
    int _1992 = _1576 + _1984;
    float _1994 = _1950 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1996 = _1988 & 3;
    float _1998 = _1964 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2000 = _1992 >> 2;
    float _2002 = _1890 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2004 = _1980 + _1996;
    float _2006 = fma(_1808, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1960);
    int _2008 = _2000 << 4;
    int _2010 = _2008 + 368;
    float _2012 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2014 = _2002 + _2012;
    int _2016 = _2004 >> 2;
    float _2018 = _1878 + 0.5;
    bool _2020 = !_1586;
    int _2022 = _2020 ? 0 : 1;
    int _2024 = _2010 + 8;
    uint _2026 = uint(int(uint(_2024) >> uint(2)));
    uint _2028 = uint(int(uint(int(_2026)) >> uint(2)));
    int _2030 = int(_2026) & 3;
    float _2032 = (*spvDescriptorSet0.vp_c9)._m0[int(_2028)][_2030];
    int _2034 = int(_2026) + 1;
    uint _2036 = uint(int(uint(_2034) >> uint(2)));
    int _2038 = _2034 & 3;
    float _2040 = (*spvDescriptorSet0.vp_c9)._m0[int(_2036)][_2038];
    int _2042 = _1980 & 3;
    bool _2044 = _2042 != 0;
    float _2046 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1976);
    int _2048 = _1980 & 3;
    bool _2050 = _2048 != 0;
    float _2052 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1990);
    int _2054 = _2016 << 4;
    int _2056 = _2054 + 512;
    float _2058 = -_1956;
    float _2060 = _2058 + 1.0;
    int _2062 = _2044 ? 0 : 1;
    uint _2064 = uint(int(uint(_2010) >> uint(2)));
    uint _2066 = uint(int(uint(int(_2064)) >> uint(2)));
    int _2068 = int(_2064) & 3;
    float _2070 = (*spvDescriptorSet0.vp_c9)._m0[int(_2066)][_2068];
    int _2072 = int(_2064) + 1;
    uint _2074 = uint(int(uint(_2072) >> uint(2)));
    int _2076 = _2072 & 3;
    float _2078 = (*spvDescriptorSet0.vp_c9)._m0[int(_2074)][_2076];
    bool _2080 = uint(_2048) > 1u;
    float _2082 = -_2052;
    float _2084 = _2082 + 1.0;
    bool _2086 = !_2050;
    int _2088 = _2086 ? 0 : 1;
    uint _2090 = uint(int(uint(_2056) >> uint(2)));
    uint _2092 = uint(int(uint(int(_2090)) >> uint(2)));
    int _2094 = int(_2090) & 3;
    float _2096 = (*spvDescriptorSet0.vp_c9)._m0[int(_2092)][_2094];
    int _2098 = int(_2090) + 1;
    uint _2100 = uint(int(uint(_2098) >> uint(2)));
    int _2102 = _2098 & 3;
    float _2104 = (*spvDescriptorSet0.vp_c9)._m0[int(_2100)][_2102];
    float _2106 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2108 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _2110 = _1584 != 3;
    float _2112 = fma(_1998, -2.0, _2106);
    int _2114 = ~_2062;
    int _2116 = _2114 + 1;
    int _2118 = _2116 + 1;
    float _2120 = -_2108;
    float _2122 = fma(_1994, 2.0, _2120);
    int _2124 = _2118;
    int _2126 = as_type<int>(_1972);
    if (!_2080)
    {
        int _2128 = ~_2062;
        int _2130 = _2128 + 1;
        _2124 = _2130;
    }
    int _2132 = _2124;
    float _2134 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2136 = _1966 + _2134;
    int _2138 = _2056 + 8;
    uint _2140 = uint(int(uint(_2138) >> uint(2)));
    uint _2142 = uint(int(uint(int(_2140)) >> uint(2)));
    int _2144 = int(_2140) & 3;
    float _2146 = (*spvDescriptorSet0.vp_c9)._m0[int(_2142)][_2144];
    int _2148 = int(_2140) + 1;
    uint _2150 = uint(int(uint(_2148) >> uint(2)));
    int _2152 = _2148 & 3;
    float _2154 = (*spvDescriptorSet0.vp_c9)._m0[int(_2150)][_2152];
    float _2156 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2158 = _1972 + _2156;
    int _2160 = ~_1620;
    int _2162 = _2160 + _1704;
    int _2164 = _2162 + 1;
    float _2166 = _2136 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2168 = abs(_1640);
    float _2170 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2112);
    int _2172 = abs(_2132);
    float _2174 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2166);
    bool _2176 = uint(_2048) >= 2u;
    int _2178 = _979 * _2164;
    int _2180 = _2178 + _1280;
    int _2182 = ~_2168;
    int _2184 = _2182 + 1;
    int _2186 = _2184 + 1;
    float _2188 = fma(_2014, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2174);
    bool _2190 = !_2110;
    int _2192 = _2190 ? 0 : (-1);
    float _2194 = -_151;
    float _2196 = fma(_2194, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2122);
    bool _2198 = _2048 != 3;
    float _2200 = fma(_2018, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2196);
    int _2202 = _2176 ? 0 : 1;
    int _2204 = abs(_2022);
    int _2206 = ~_2172;
    int _2208 = _2206 + 1;
    int _2210 = _2208 + 1;
    int _2212 = ~_2202;
    int _2214 = _2212 + 1;
    int _2216 = _2214 + 1;
    int _2218 = abs(_2088);
    int _2220 = _2216;
    if (_2198)
    {
        int _2222 = ~_2202;
        int _2224 = _2222 + 1;
        _2220 = _2224;
    }
    int _2226 = _2220;
    int _2228 = _2186 * as_type<int>(_2078);
    int _2230 = abs(_1668);
    int _2232 = ~_2204;
    int _2234 = _2232 + 1;
    int _2236 = _2234 + 1;
    int _2238 = abs(_2226);
    int _2240 = _2210 * as_type<int>(_2104);
    int _2242 = _2236 * as_type<int>(_2070);
    int _2244 = _2242 + _2228;
    int _2246 = abs(_2192);
    int _2248 = ~_2218;
    int _2250 = _2248 + 1;
    int _2252 = _2250 + 1;
    int _2254 = ~_2230;
    int _2256 = _2254 + 1;
    int _2258 = _2256 + 1;
    bool _2260 = _2048 != 3;
    int _2262 = _2252 * as_type<int>(_2096);
    int _2264 = _2262 + _2240;
    int _2266 = _2258 * as_type<int>(_2032);
    int _2268 = _2266 + _2244;
    bool _2270 = !_2260;
    int _2272 = _2270 ? 0 : (-1);
    int _2274 = ~_2246;
    int _2276 = _2274 + 1;
    int _2278 = _2276 + 1;
    int _2280 = ~_2238;
    int _2282 = _2280 + 1;
    int _2284 = _2282 + 1;
    int _2286 = abs(_2272);
    int _2288 = _2278 * as_type<int>(_2040);
    int _2290 = _2288 + _2268;
    bool _2292 = !_1782;
    int _2294 = _2292 ? 0 : 1;
    int _2296 = _2284 * as_type<int>(_2146);
    int _2298 = _2296 + _2264;
    int _2300 = ~_1670;
    int _2302 = _2300 + _1734;
    int _2304 = _2302 + 1;
    float _2306 = -_213;
    int _2308 = _1672 ? as_type<int>(_2306) : as_type<int>(_213);
    int _2310 = abs(_2294);
    int _2312 = ~_2286;
    int _2314 = _2312 + 1;
    int _2316 = _2314 + 1;
    bool _2318 = !_1768;
    float _2320 = _2318 ? _213 : as_type<float>(_2308);
    int _2322 = _991 * _2304;
    int _2324 = _2322 + _1402;
    int _2326 = ~_2310;
    int _2328 = _2326 + 1;
    int _2330 = _2328 + 1;
    int _2332 = _2316 * as_type<int>(_2154);
    int _2334 = _2332 + _2298;
    int _2336 = abs(_1710);
    float _2338 = _927 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _2340 = !_1388;
    int _2342 = _2340 ? _2324 : (-1);
    int _2344 = _2334 * _2330;
    float _2346 = _2136 * _2136;
    bool _2348 = _2188 >= 0.0;
    float _2350 = _2338 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2352 = _2342 * _2310;
    int _2354 = _2352 + _2344;
    float _2356 = fma(_2158, _2158, _2346);
    int _2358 = ~_2336;
    int _2360 = _2358 + 1;
    int _2362 = _2360 + 1;
    float _2364 = _923 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _2366 = !_1414;
    int _2368 = _2366 ? _2180 : (-1);
    float _2370 = fma(_2014, _2014, _2356);
    float _2372 = _925 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2374 = _2290 * _2362;
    float _2376 = _2320 + (-0.5);
    float _2378 = -_2060;
    float _2380 = fma(_1754, _2378, _1908);
    float _2382 = rsqrt(_2370);
    float _2384 = -_2376;
    float _2386 = -_2170;
    float _2388 = fma(_2384, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2386);
    int _2390 = _2368 * _2336;
    int _2392 = _2390 + _2374;
    if (_2348)
    {
        _933 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2394 = _933;
    float _2396 = -_1986;
    float _2398 = _2396 + 1.0;
    float _2400 = -_2046;
    float _2402 = _2400 + 1.0;
    float _2404 = fma(_2320, _2084, _2388);
    float _2406 = _2364 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2408 = fma(_1772, _2398, _1928);
    float _2410 = -_2402;
    float _2412 = fma(_1878, _2410, _2200);
    float _2414 = _2372 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2416 = _2006 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2418 = as_type<int>(_2394);
    float _2420 = _2412;
    if (_2348)
    {
        float _2422 = _2394 * 5.0;
        _2418 = as_type<int>(_2422);
    }
    int _2424 = _2418;
    float _2426 = float(_2392);
    out.m_76.x = _2380;
    out.m_76.y = _2408;
    out.m_76.z = _2412;
    out.m_76.w = _2404;
    float _2428 = float(_2354);
    float _2430 = _2136 * _2382;
    float _2432 = _2158 * _2382;
    out.m_78.x = _2406;
    out.m_78.y = _2414;
    out.m_78.z = _2350;
    out.m_78.w = _2416;
    if (_2348)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7900 = as_type<float>(_2424);
        out.gl_Position.z = _7900;
    }
    out.m_80.x = _2426;
    out.m_80.y = _2428;
    if (_2348)
    {
        out.m_61.x = 0.0;
    }
    if (_2348)
    {
        return out;
    }
    float _2434 = -_2430;
    float _2436 = fma(_2434, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1966);
    float _2438 = _2014 * _2382;
    float _2440 = -_2432;
    float _2442 = fma(_2440, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1972);
    float _2444 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2446 = _2436 + _2444;
    float _2448 = -_2438;
    float _2450 = fma(_2448, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2002);
    float _2452 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2454 = _2442 + _2452;
    float _2456 = _2446 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2458 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2460 = _2450 + _2458;
    float _2462 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2456);
    float _2464 = fma(_2460, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2462);
    bool _2466 = _2464 >= 0.0;
    float _2468 = _2454;
    float _2470 = _2446;
    if (_2466)
    {
        _2420 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2472 = _2420;
    int _2474 = as_type<int>(_2472);
    if (_2466)
    {
        out.m_61.x = 0.0;
    }
    if (_2466)
    {
        float _2476 = _2472 * 5.0;
        _2474 = as_type<int>(_2476);
    }
    int _2478 = _2474;
    if (_2466)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8000 = as_type<float>(_2478);
        out.gl_Position.z = _8000;
    }
    if (_2466)
    {
        return out;
    }
    float _2480 = -_1966;
    float _2482 = _2480 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2484 = -_1972;
    float _2486 = _2484 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2488 = -_2002;
    float _2490 = _2488 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2492 = -_2430;
    float _2494 = fma(_2492, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2136);
    float _2496 = _2482 * _2482;
    float _2498 = -_2432;
    float _2500 = fma(_2498, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2158);
    float _2502 = -_2438;
    float _2504 = fma(_2502, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2014);
    float _2506 = _2494 * _2494;
    float _2508 = fma(_2486, _2486, _2496);
    float _2510 = _443 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2512 = _461 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2514 = fma(_2500, _2500, _2506);
    float _2516 = fma(_2490, _2490, _2508);
    float _2518 = fma(_2504, _2504, _2514);
    float _2520 = rsqrt(_2516);
    float _2522 = _2486 * _2520;
    float _2524 = _2490 * _2520;
    float _2526 = _2482 * _2520;
    float _2528 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2530 = _2522 * _2528;
    float _2532 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2534 = _2524 * _2532;
    float _2536 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2538 = _2526 * _2536;
    float _2540 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2542 = -_2530;
    float _2544 = fma(_2524, _2540, _2542);
    float _2546 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2548 = -_2534;
    float _2550 = fma(_2526, _2546, _2548);
    float _2552 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2554 = -_2538;
    float _2556 = fma(_2522, _2552, _2554);
    float _2558 = sqrt(_2518);
    float _2560 = _2544 * _2544;
    float _2562 = fma(_2550, _2550, _2560);
    float _2564 = fma(_2556, _2556, _2562);
    float _2566 = rsqrt(_2564);
    float _2568 = _2382 * _2558;
    float _2570 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _213);
    float _2572 = _2568 * _2510;
    float _2574 = _2568 * _2512;
    float _2576 = _2568 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2578 = _2576 * 0.5;
    float _2580 = _2570 * _2572;
    float _2582 = _2544 * _2566;
    float _2584 = _2550 * _2566;
    float _2586 = _2556 * _2566;
    float _2588 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _209);
    float _2590 = _2524 * _2582;
    float _2592 = _2526 * _2584;
    float _2594 = -_2590;
    float _2596 = fma(_2526, _2586, _2594);
    float _2598 = -_2592;
    float _2600 = fma(_2522, _2582, _2598);
    float _2602 = _2588 * _2574;
    float _2604 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2606 = _2580 * _2596;
    float _2608 = _2580 * _2600;
    float _2610 = fma(_2604, _2604, 1.0);
    float _2612 = fma(_2602, _2584, _2606);
    float _2614 = fma(_2602, _2586, _2608);
    float _2616 = fma(_2578, _2522, _2612);
    float _2618 = fma(_2578, _2524, _2614);
    float _2620 = _1972 + _2616;
    float _2622 = _2002 + _2618;
    float _2624 = _2522 * _2586;
    float _2626 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2628 = _2620 + _2626;
    float _2630 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2632 = _2622 + _2630;
    float _2634 = -_2624;
    float _2636 = fma(_2524, _2584, _2634);
    float _2638 = _2628 * _2628;
    float _2640 = _2632 * _2632;
    float _2642 = _2580 * _2636;
    float _2644 = _2638 + _2640;
    float _2646 = fma(_2602, _2582, _2642);
    float _2648 = rsqrt(_2610);
    float _2650 = fma(_2578, _2526, _2646);
    float _2652 = _1966 + _2650;
    float _2654 = sqrt(_2644);
    bool _2656 = _2654 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2658 = _2650;
    float _2660 = _2580;
    float _2662 = _2620;
    float _2664 = _2638;
    float _2666 = _2640;
    if (!_2656)
    {
        _2658 = _2620;
    }
    float _2668 = _2658;
    float _2670 = _2668;
    if (!_2656)
    {
        _2660 = _2640;
    }
    float _2672 = _2660;
    float _2674 = _2672;
    if (!_2656)
    {
        _217 = _2622;
    }
    float _2676 = _217;
    float _2678 = _2676;
    if (!_2656)
    {
        _2662 = _2652;
    }
    float _2680 = _2662;
    bool _2682 = !_2656;
    float _2684 = _2680;
    if (!_2682)
    {
        float _2686 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2688 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2690 = _2654 + _2688;
        float _2692 = rsqrt(_2644);
        float _2694 = _2690 * _2686;
        float _2696 = _2652 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2698 = _2694 * 0.15915493667125701904296875;
        float _2700 = _2698 * 6.283185482025146484375;
        float _2702 = sin(_2700);
        float _2704 = _2698 * 6.283185482025146484375;
        float _2706 = cos(_2704);
        float _2708 = fma(_2702, _2696, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2710 = _2692 * _2708;
        float _2712 = _2706 + (-1.0);
        float _2714 = fma(_2628, _2710, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2716 = fma(_2632, _2710, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2718 = _2712 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2720 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2722 = _2714 + _2720;
        float _2724 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2726 = _2716 + _2724;
        float _2728 = fma(_2652, _2706, _2718);
        float _2730 = _2722 * _2722;
        float _2732 = _2726 * _2726;
        _2684 = _2728;
        _2664 = _2730;
        _2674 = _2732;
        _2670 = _2714;
        _2678 = _2716;
    }
    float _2734 = _2684;
    float _2736 = _2664;
    float _2738 = _2674;
    float _2740 = _2670;
    float _2742 = _2678;
    float _2744 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2746 = _2734 + _2744;
    float _2748 = _2604 * _2648;
    float _2750 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2752 = _2604 * _2596;
    float _2754 = fma(_2746, _2746, _2736);
    float _2756 = -_2522;
    float _2758 = _2748 * _2756;
    float _2760 = -_2526;
    float _2762 = _2748 * _2760;
    float _2764 = -_2524;
    float _2766 = _2748 * _2764;
    float _2768 = _2754 + _2738;
    float _2770 = _2604 * _2636;
    float _2772 = _2604 * _2600;
    float _2774 = fma(_2750, _2584, _2752);
    float _2776 = fma(_2648, _2596, _2758);
    float _2778 = fma(_2750, _2582, _2770);
    float _2780 = sqrt(_2768);
    float _2782 = fma(_2750, _2586, _2772);
    float _2784 = fma(_2648, _2636, _2762);
    float _2786 = fma(_2648, _2600, _2766);
    float _2788 = _2522 + _2774;
    float _2790 = _2526 + _2778;
    float _2792 = _2524 + _2782;
    out.m_82.x = _2584;
    out.m_82.y = _2582;
    out.m_82.z = _2586;
    out.m_84.x = _2776;
    out.m_84.y = _2784;
    out.m_84.z = _2786;
    out.m_86.x = _2788;
    out.m_86.y = _2790;
    out.m_86.z = _2792;
    bool _2794 = _2780 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2796 = isnan(_2780);
    bool _2798 = _2794 || _2796;
    bool _2800 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2802 = _2798 || _2800;
    if (!_2802)
    {
        _2666 = 1.0;
    }
    float _2804 = _2666;
    bool _2806 = !_2802;
    float _2808 = _2804;
    if (!_2806)
    {
        bool _2810 = _2780 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2812 = isnan(_2780);
        bool _2814 = _2810 || _2812;
        bool _2816 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2818 = _2814 || _2816;
        if (!_2818)
        {
            float _2820 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2822 = _2780 + _2820;
            float _2824 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2826 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2824;
            float _2828 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2830 = _2828 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2832 = 1.0 / _2826;
            float _2834 = _2822 * _2832;
            float _2836 = fma(_2834, _2830, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2808 = _2836;
            _2838 = true;
        }
        else
        {
            bool _2840 = _2780 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2842 = isnan(_2780);
            bool _2844 = _2840 || _2842;
            bool _2846 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2848 = _2844 || _2846;
            if (!_2848)
            {
                float _2850 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2852 = _2780 + _2850;
                float _2854 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2856 = _2854 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2858 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2860 = _2858 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2862 = 1.0 / _2856;
                float _2864 = _2852 * _2862;
                float _2866 = fma(_2864, _2860, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2808 = _2866;
                _2838 = true;
            }
            else
            {
                _2808 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2838 = false;
    float _2868 = _2808;
    float _2870 = fma(_2442, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2872 = fma(_2450, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2874 = floor(_2870);
    float _2876 = floor(_2872);
    float _2878 = -_2874;
    float _2880 = _2870 + _2878;
    float _2882 = -_2876;
    float _2884 = _2872 + _2882;
    float2 _8675 = float2(_2880, _2884);
    float _2886 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8675, float2(0.0), isnan(_8675)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8675, float2(0.0), isnan(_8675)), level(0.0)).x;
    float _2888 = _2436 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2890 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2892 = _2740 + _2890;
    float _2894 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2896 = _2734 + _2894;
    float _2898 = fma(_2442, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2888);
    float _2900 = fma(_2892, _2868, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2902 = fma(_2896, _2868, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2904 = fma(_2450, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2898);
    float _2906 = _2436 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2908 = -_1966;
    float _2910 = _2908 + _2902;
    float _2912 = _2904 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2914 = fma(_2442, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2906);
    float _2916 = -_1972;
    float _2918 = _2916 + _2900;
    float _2920 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2922 = 1.0 / _2912;
    float _2924 = fma(_2450, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2914);
    float _2926 = _2910 * _2910;
    float _2928 = _2436 + _2920;
    float _2930 = _2924 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2932 = fma(_2918, _2918, _2926);
    bool _2934 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2936 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2938 = _2934 || _2936;
    bool _2940 = isnan(0.5);
    bool _2942 = _2938 || _2940;
    float _2944 = _2930 + _2912;
    float _2946 = _2944 * _2922;
    float _2948 = _2946 * 0.5;
    float _2950 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2952 = fma(_2948, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2950);
    float _2954 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2956 = _2742 + _2954;
    float _2958 = fma(_2956, _2868, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2960 = 1.0 / _2952;
    float _2962 = _2928 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2964 = -_2002;
    float _2966 = _2964 + _2958;
    float _2968 = fma(_2442, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2962);
    float _2970 = fma(_2966, _2966, _2932);
    float _2972 = fma(_2450, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2968);
    float _2974 = sqrt(_2970);
    float _2976 = _2972 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2978 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2980 = _2960 * _2978;
    float _2982 = _2928 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2984 = trunc(_2976);
    int _2986 = int(_2984);
    bool _2988 = _2980 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2990 = fma(_2442, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2982);
    bool _2992 = _2980 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _2994 = !_2988;
    int _2996 = _2994 ? 0 : 1;
    float _2998 = fma(_2450, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2990);
    float _3000 = _2998 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    int _3002 = 2;
    float _3004 = _2958;
    float _3006 = _2902;
    float _3008 = _2976;
    if (!_2988)
    {
        _3002 = 1;
    }
    int _3010 = _3002;
    float _3012 = trunc(_3000);
    int _3014 = int(_3012);
    int _3016 = _3010;
    if (!_2992)
    {
        _3016 = _2996;
    }
    int _3018 = _3016;
    bool _3020 = _2974 > 0.0;
    int _3022 = _3018 << 6;
    int _3024 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3026 = _2986 + _3024;
    int _3028 = _3026 + 1;
    int _3030 = _3022 + 48;
    uint _3032 = uint(int(uint(_3030) >> uint(2)));
    uint _3034 = uint(int(uint(int(_3032)) >> uint(2)));
    int _3036 = int(_3032) & 3;
    float _3038 = (*spvDescriptorSet0.vp_c15)._m0[int(_3034)][_3036];
    int _3040 = int(_3032) + 1;
    uint _3042 = uint(int(uint(_3040) >> uint(2)));
    int _3044 = _3040 & 3;
    float _3046 = (*spvDescriptorSet0.vp_c15)._m0[int(_3042)][_3044];
    int _3048 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _3050 = _3014 + _3048;
    int _3052 = _3050 + 1;
    int _3054 = _3022 + 56;
    uint _3056 = uint(int(uint(_3054) >> uint(2)));
    uint _3058 = uint(int(uint(int(_3056)) >> uint(2)));
    int _3060 = int(_3056) & 3;
    float _3062 = (*spvDescriptorSet0.vp_c15)._m0[int(_3058)][_3060];
    int _3064 = int(_3056) + 1;
    uint _3066 = uint(int(uint(_3064) >> uint(2)));
    int _3068 = _3064 & 3;
    float _3070 = (*spvDescriptorSet0.vp_c15)._m0[int(_3066)][_3068];
    bool _3072 = _3052 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _3074 = _3052 | _3028;
    int _3076 = _3022 + 64;
    uint _3078 = uint(int(uint(_3076) >> uint(2)));
    uint _3080 = uint(int(uint(int(_3078)) >> uint(2)));
    int _3082 = int(_3078) & 3;
    float _3084 = (*spvDescriptorSet0.vp_c15)._m0[int(_3080)][_3082];
    int _3086 = int(_3078) + 1;
    uint _3088 = uint(int(uint(_3086) >> uint(2)));
    int _3090 = _3086 & 3;
    float _3092 = (*spvDescriptorSet0.vp_c15)._m0[int(_3088)][_3090];
    bool _3094 = _3074 < 0;
    bool _3096 = _3094 || _3072;
    float _3098 = as_type<float>(_3074);
    if (!_3020)
    {
        _3098 = _2900;
    }
    float _3100 = _3098;
    bool _3102 = _3028 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3104 = _3102 || _3096;
    int _3106 = _3022 + 72;
    uint _3108 = uint(int(uint(_3106) >> uint(2)));
    uint _3110 = uint(int(uint(int(_3108)) >> uint(2)));
    int _3112 = int(_3108) & 3;
    float _3114 = (*spvDescriptorSet0.vp_c15)._m0[int(_3110)][_3112];
    int _3116 = int(_3108) + 1;
    uint _3118 = uint(int(uint(_3116) >> uint(2)));
    int _3120 = _3116 & 3;
    float _3122 = (*spvDescriptorSet0.vp_c15)._m0[int(_3118)][_3120];
    int _3124 = _3022 + 96;
    uint _3126 = uint(int(uint(_3124) >> uint(2)));
    uint _3128 = uint(int(uint(int(_3126)) >> uint(2)));
    int _3130 = int(_3126) & 3;
    float _3132 = (*spvDescriptorSet0.vp_c15)._m0[int(_3128)][_3130];
    int _3134 = int(_3126) + 1;
    uint _3136 = uint(int(uint(_3134) >> uint(2)));
    int _3138 = _3134 & 3;
    float _3140 = (*spvDescriptorSet0.vp_c15)._m0[int(_3136)][_3138];
    int _3142 = _3022 + 104;
    uint _3144 = uint(int(uint(_3142) >> uint(2)));
    uint _3146 = uint(int(uint(int(_3144)) >> uint(2)));
    int _3148 = int(_3144) & 3;
    float _3150 = (*spvDescriptorSet0.vp_c15)._m0[int(_3146)][_3148];
    int _3152 = int(_3144) + 1;
    uint _3154 = uint(int(uint(_3152) >> uint(2)));
    int _3156 = _3152 & 3;
    float _3158 = (*spvDescriptorSet0.vp_c15)._m0[int(_3154)][_3156];
    bool _3160 = !_3020;
    float _3162 = _3100;
    float _3164 = _3132;
    float _3166 = _3092;
    if (!_3160)
    {
        float _3168 = _203 * _203;
        float _3170 = fma(_201, _201, _3168);
        float _3172 = rsqrt(_2970);
        float _3174 = fma(_205, _205, _3170);
        float _3176 = sqrt(_3174);
        float _3178 = _2918 * _3172;
        float _3180 = _2910 * _3172;
        bool _3182 = _3176 > 0.0;
        float _3184 = _2966 * _3172;
        float _3186 = _3172;
        if (!_3182)
        {
            _3186 = _2900;
        }
        float _3188 = _3186;
        bool _3190 = !_3182;
        _3162 = _3188;
        if (!_3190)
        {
            float _3192 = rsqrt(_3174);
            float _3194 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3196 = _203 * _3192;
            float _3198 = _201 * _3192;
            float _3200 = _205 * _3192;
            float _3202 = _3180 * _3196;
            float _3204 = fma(_3178, _3198, _3202);
            float _3206 = _3194 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3208 = fma(_3184, _3200, _3204);
            float _3210 = _3208 * _3206;
            float _3212 = fma(_201, _3210, _2900);
            float _3214 = fma(_203, _3210, _2902);
            float _3216 = fma(_205, _3210, _2958);
            _3162 = _3212;
            _3004 = _3216;
            _3006 = _3214;
        }
    }
    float _3218 = _3162;
    float _3220 = _3004;
    float _3222 = _3006;
    float _3224 = -_2432;
    float _3226 = fma(_3224, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3218);
    float _3228 = _2928 * _3140;
    float _3230 = -_2438;
    float _3232 = fma(_3230, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3220);
    float _3234 = -_2430;
    float _3236 = fma(_3234, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3222);
    float _3238 = _3228;
    float _3240 = _3236;
    if (!_3104)
    {
        int _3242 = _3028 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3244 = _3242 + _3052;
        _219 = _3244;
    }
    int _3246 = _219;
    float _3248 = fma(_2442, _3132, _3228);
    if (_2942)
    {
        _3164 = _3226;
    }
    float _3250 = _3164;
    float _3252 = _2928 * _3046;
    float _3254 = _3250;
    if (_2942)
    {
        _3238 = _3232;
    }
    float _3256 = _3238;
    float _3258 = _3256;
    if (!_2942)
    {
        float _3260 = _2446 * _2446;
        float _3262 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3264 = -_1966;
        float _3266 = _3264 + _3222;
        float _3268 = -_2002;
        float _3270 = _3268 + _3220;
        float _3272 = fma(_2454, _2454, _3260);
        float _3274 = fma(_2460, _2460, _3272);
        float _3276 = 1.0 / _2568;
        float _3278 = sqrt(_3274);
        float _3280 = precise::min(_3278, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3282 = _3280 * _3262;
        float _3284 = _3282 * _3276;
        float _3286 = -_1972;
        float _3288 = _3286 + _3218;
        float _3290 = fma(_3266, _3284, _2436);
        float _3292 = fma(_3288, _3284, _2442);
        float _3294 = fma(_3270, _3284, _2450);
        _3240 = _3290;
        _3254 = _3292;
        _3258 = _3294;
        _2468 = _3278;
        _2470 = _3260;
    }
    float _3296 = _3240;
    float _3298 = _3254;
    float _3300 = _3258;
    float _3302 = _2468;
    float _3304 = _2470;
    float _3306 = _2928 * _3092;
    float _3308 = fma(_2442, _3038, _3252);
    float _3310 = fma(_2450, _3150, _3248);
    int _3312 = as_type<int>(_3306);
    float _3314 = _3302;
    if (!_3104)
    {
        int _3316 = _3246 << 2;
        _2126 = _3316;
    }
    int _3318 = _2126;
    float _3320 = fma(_2442, _3084, _3306);
    float _3322 = fma(_2450, _3062, _3308);
    float _3324 = _3310 + _3158;
    int _3326 = _3022 + 80;
    uint _3328 = uint(int(uint(_3326) >> uint(2)));
    uint _3330 = uint(int(uint(int(_3328)) >> uint(2)));
    int _3332 = int(_3328) & 3;
    float _3334 = (*spvDescriptorSet0.vp_c15)._m0[int(_3330)][_3332];
    int _3336 = int(_3328) + 1;
    uint _3338 = uint(int(uint(_3336) >> uint(2)));
    int _3340 = _3336 & 3;
    float _3342 = (*spvDescriptorSet0.vp_c15)._m0[int(_3338)][_3340];
    int _3344 = _3318;
    if (!_3104)
    {
        uint _3346 = uint(int(uint(_3246) >> uint(2)));
        _3312 = int(_3346);
    }
    int _3348 = _3312;
    float _3350 = fma(_2450, _3114, _3320);
    if (!_3104)
    {
        int _3352 = 12 & _3318;
        _3344 = _3352;
    }
    int _3354 = _3344;
    float _3356 = _3322 + _3070;
    float _3358 = 1.0 / _3324;
    float _3360 = _3296 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (!_3104)
    {
        int _3362 = _3348 << 4;
        int _3364 = _3362 + _3354;
        _3314 = as_type<float>(_3364);
    }
    float _3366 = _3314;
    float _3368 = _3350 + _3122;
    int _3370 = _3022 + 88;
    uint _3372 = uint(int(uint(_3370) >> uint(2)));
    uint _3374 = uint(int(uint(int(_3372)) >> uint(2)));
    int _3376 = int(_3372) & 3;
    float _3378 = (*spvDescriptorSet0.vp_c15)._m0[int(_3374)][_3376];
    int _3380 = int(_3372) + 1;
    uint _3382 = uint(int(uint(_3380) >> uint(2)));
    int _3384 = _3380 & 3;
    float _3386 = (*spvDescriptorSet0.vp_c15)._m0[int(_3382)][_3384];
    float _3388 = _3296 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3390 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3360);
    float _3392 = _3296 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3394 = _3296 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3396 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3388);
    float _3398 = fma(_3300, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3390);
    float _3400 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3392);
    float _3402 = _3366;
    if (!_3104)
    {
        int _3404 = as_type<int>(_3366) + 400;
        uint _3406 = uint(int(uint(_3404) >> uint(2)));
        uint _3408 = uint(int(uint(int(_3406)) >> uint(2)));
        int _3410 = int(_3406) & 3;
        float _3412 = (*spvDescriptorSet0.vp_c15)._m0[int(_3408)][_3410];
        _3402 = _3412;
    }
    float _3414 = _3402;
    float _3416 = fma(_3300, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3396);
    float _3418 = fma(_3300, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3400);
    float _3420 = _3356 * _3358;
    float _3422 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3394);
    float _3424 = _3368 * _3358;
    float _3426 = _3398 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3428 = _3416 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _3430 = _3420 >= 0.0;
    float _3432 = _3418 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3434 = _3426 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3436 = fma(_3300, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3422);
    bool _3438 = _3420 <= 1.0;
    bool _3440 = _3438 && _3430;
    float _3442 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3444 = fma(_3428, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3434);
    float _3446 = _3432 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _3448 = _3424 >= 0.0;
    bool _3450 = _3448 && _3440;
    float _3452 = _3436 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3454 = fma(_3432, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3444);
    float _3456 = -_3446;
    float _3458 = fma(_3456, _3442, 1.0);
    bool _3460 = _3424 <= 1.0;
    bool _3462 = _3460 && _3450;
    float _3464 = _3426 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3466 = fma(_3452, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3454);
    float _3468 = _3426 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3470 = _3464;
    float _3472 = _3420;
    float _3474 = 1.0;
    float _3476 = _3466;
    if (!_3104)
    {
        float _3478 = floor(_3000);
        _3166 = _3478;
    }
    float _3480 = _3166;
    float _3482 = fma(_3428, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3468);
    float _3484 = _2928 * _3342;
    float _3486 = fma(_3428, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3464);
    float _3488 = log2(_3458);
    if (_3462)
    {
        float _3490 = float(_3018);
        _3470 = _3490;
    }
    float _3492 = _3470;
    float _3494 = fma(_2442, _3334, _3484);
    float _3496 = fma(_3432, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3486);
    float _3498 = fma(_3432, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3482);
    float _3500 = fma(_2450, _3378, _3494);
    float _3502 = 1.0 / _3466;
    float _3504 = fma(_3452, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3496);
    float _3506 = fma(_3452, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3498);
    float _3508 = _3500 + _3386;
    float _3510 = _3508 * _3358;
    float _3512 = _3304;
    if (!_3104)
    {
        float _3514 = floor(_2976);
        _3512 = _3514;
    }
    float _3516 = _3512;
    float _3518 = _3488 * 0.693147182464599609375;
    float _3520 = _3518 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3522 = _3492;
    if (_3462)
    {
        float _3524 = rint(_3492);
        float _3526 = precise::max(_3524, 0.0);
        uint _3528 = uint(_3526);
        uint _3530 = clamp(_3528, 0u, 65535u);
        _3522 = as_type<float>(_3530);
    }
    float _3532 = _3522;
    float _3534 = _3504 * _3502;
    float _3536 = _3506 * _3502;
    float _3538 = _3502;
    float _3540 = _3536;
    if (!_3104)
    {
        float _3542 = -_3480;
        float _3544 = _3000 + _3542;
        _3538 = _3544;
    }
    float _3546 = _3538;
    float _3548 = fma(_3534, 0.5, 0.5);
    float _3550 = fma(_3536, -0.5, 0.5);
    float _3552 = _3468;
    if (!_3104)
    {
        float _3554 = rint(_3414);
        float _3556 = precise::max(_3554, 0.0);
        uint _3558 = uint(_3556);
        uint _3560 = clamp(_3558, 0u, 65535u);
        _3552 = as_type<float>(_3560);
    }
    float _3562 = _3552;
    if (!_3104)
    {
        float _3564 = -_3516;
        float _3566 = _2976 + _3564;
        _3008 = _3566;
    }
    float _3568 = _3008;
    float _3570 = _3424;
    if (_3462)
    {
        float3 _9825 = float3(_3420, _3424, float(as_type<int>(_3532)));
        float3 _9829 = select(_9825, float3(0.0), isnan(_9825));
        float _3572 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9829.xy, uint(rint(_9829.z)), _3510, level(0.0));
        _3570 = _3572;
    }
    float _3574 = _3570;
    float3 _9839 = float3(_3548, _3550, _3520);
    float _3576 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9839, float3(0.0), isnan(_9839)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9839, float3(0.0), isnan(_9839)), level(0.0)).x;
    float3 _9848 = float3(_3548, _3550, _3520);
    float4 _3579 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9848, float3(0.0), isnan(_9848)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9848, float3(0.0), isnan(_9848)), level(0.0)).xyzw;
    float _3581 = _3579.x;
    float _3583 = _3579.y;
    float _3585 = _3579.z;
    float _3587 = _3579.w;
    float _3589 = _3546;
    float _3591 = _3562;
    if (!_3104)
    {
        float3 _9872 = float3(_3546, _3568, float(as_type<int>(_3562)));
        float3 _9874 = select(_9872, float3(0.0), isnan(_9872));
        float _3593 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9874.xy, uint(rint(_9874.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9874.xy, uint(rint(_9874.z)), level(0.0)).x;
        _3589 = _3593;
    }
    float _3595 = _3589;
    if (_3104)
    {
        _3540 = 1.0;
    }
    float _3597 = _3540;
    float _3599 = _3597;
    if (!_3104)
    {
        int _3601 = _3246 << 4;
        int _3603 = _3601 + 2048;
        uint _3605 = uint(int(uint(_3603) >> uint(2)));
        uint _3607 = uint(int(uint(int(_3605)) >> uint(2)));
        int _3609 = int(_3605) & 3;
        float _3611 = (*spvDescriptorSet0.vp_c15)._m0[int(_3607)][_3609];
        int _3613 = int(_3605) + 1;
        uint _3615 = uint(int(uint(_3613) >> uint(2)));
        int _3617 = _3613 & 3;
        float _3619 = (*spvDescriptorSet0.vp_c15)._m0[int(_3615)][_3617];
        int _3621 = _3603 + 8;
        uint _3623 = uint(int(uint(_3621) >> uint(2)));
        uint _3625 = uint(int(uint(int(_3623)) >> uint(2)));
        int _3627 = int(_3623) & 3;
        float _3629 = (*spvDescriptorSet0.vp_c15)._m0[int(_3625)][_3627];
        int _3631 = int(_3623) + 1;
        uint _3633 = uint(int(uint(_3631) >> uint(2)));
        int _3635 = _3631 & 3;
        float _3637 = (*spvDescriptorSet0.vp_c15)._m0[int(_3633)][_3635];
        float _3639 = _2928 * _3619;
        float _3641 = fma(_2442, _3611, _3639);
        float _3643 = fma(_2450, _3629, _3641);
        float _3645 = _3643 + _3637;
        float _3647 = precise::clamp(_3645, 0.0, 1.0);
        float _3649 = -_3647;
        float _3651 = _3649 + _3595;
        float _3653 = fma(_3651, 500.0, 1.5);
        float _3655 = exp2(_3653);
        float _3657 = 0.0 + _3655;
        float _3659 = precise::clamp(_3657, 0.0, 1.0);
        _3472 = _3619;
        _3599 = _3659;
    }
    float _3661 = _3472;
    float _3663 = _3599;
    float _3665 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3667 = _3296 + _3665;
    float _3669 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3671 = _3298 + _3669;
    float _3673 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3675 = _3300 + _3673;
    float _3677 = _3667 * _3667;
    float _3679 = fma(_3671, _3671, _3677);
    float _3681 = fma(_3675, _3675, _3679);
    float _3683 = rsqrt(_3681);
    float _3685 = _3683 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3687 = _3671 * _3685;
    float _3689 = _3675 * _3685;
    float _3691 = _3687 * _3687;
    float _3693 = _3689 * _3689;
    float _3695 = _3691 + _3693;
    float _3697 = sqrt(_3695);
    bool _3699 = _3697 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3701 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3703 = _3697 + _3701;
    float _3705 = _3675;
    float _3707 = _3677;
    float _3709 = _3703;
    float _3711 = _3685;
    if (_3699)
    {
        float _3713 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3705 = _3713;
    }
    float _3715 = _3705;
    if (_3699)
    {
        float _3717 = rsqrt(_3695);
        _3707 = _3717;
    }
    float _3719 = _3707;
    float _3721 = _3719;
    if (_3699)
    {
        float _3723 = _3703 * _3715;
        _3709 = _3723;
    }
    float _3725 = _3709;
    if (_3699)
    {
        float _3727 = _3725 * 0.15915493667125701904296875;
        _3591 = _3727;
    }
    float _3729 = _3591;
    float _3731 = _3683;
    float _3733 = _3729;
    if (_3699)
    {
        float _3735 = _3729 * 6.283185482025146484375;
        float _3737 = sin(_3735);
        _3731 = _3737;
    }
    float _3739 = _3731;
    float _3741 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3743 = precise::max(0.0, _3741);
    float _3745 = _3661;
    float _3747 = _3743;
    float _3749 = _3741;
    if (_3699)
    {
        float _3751 = _3729 * 6.283185482025146484375;
        float _3753 = cos(_3751);
        _3745 = _3753;
    }
    float _3755 = _3745;
    float _3757 = -_3685;
    float _3759 = -_3743;
    float _3761 = fma(_3667, _3757, _3759);
    float _3763 = _3761;
    if (_3699)
    {
        float _3765 = _3761 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3747 = _3765;
    }
    float _3767 = _3747;
    float _3769 = _3739;
    float _3771 = _3767;
    if (_3699)
    {
        float _3773 = fma(_3739, _3767, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3769 = _3773;
    }
    float _3775 = _3769;
    float _3777 = _3775;
    if (!_3699)
    {
        _3771 = _3689;
    }
    float _3779 = _3771;
    float _3781 = _3779;
    float _3783 = _3755;
    if (_3699)
    {
        float _3785 = _3755 + (-1.0);
        _3749 = _3785;
    }
    float _3787 = _3749;
    if (_3699)
    {
        float _3789 = _3719 * _3775;
        _3711 = _3789;
    }
    float _3791 = _3711;
    if (!_3699)
    {
        _3777 = _3687;
    }
    float _3793 = _3777;
    float _3795 = _3793;
    if (_3699)
    {
        float _3797 = _3787 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3733 = _3797;
    }
    float _3799 = _3733;
    if (_3699)
    {
        float _3801 = _3687 * _3791;
        _3795 = _3801;
    }
    float _3803 = _3795;
    if (!_3699)
    {
        _3721 = _3691;
    }
    float _3805 = _3721;
    float _3807 = _3805;
    if (_3699)
    {
        float _3809 = _3689 * _3791;
        _3781 = _3809;
    }
    float _3811 = _3781;
    if (_3699)
    {
        float _3813 = fma(_3761, _3755, _3799);
        _3763 = _3813;
    }
    float _3815 = _3763;
    if (_3699)
    {
        float _3817 = _3803 * _3803;
        _3807 = _3817;
    }
    float _3819 = _3807;
    if (!_3699)
    {
        _3783 = _3693;
    }
    float _3821 = _3783;
    float _3823 = _3821;
    if (_3699)
    {
        float _3825 = _3811 * _3811;
        _3823 = _3825;
    }
    float _3827 = _3823;
    float _3829 = sqrt(_3681);
    float _3831 = fma(_3815, _3815, _3819);
    float _3833 = _3831 + _3827;
    float _3835 = rsqrt(_3833);
    float _3837 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3839 = fma(_3829, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3837);
    float _3841 = precise::clamp(_3839, 0.0, 1.0);
    float _3843 = -_3841;
    float _3845 = _3843 + 1.0;
    float _3847 = _3835 * _3815;
    float _3849 = _3835 * _3803;
    float _3851 = abs(_3845);
    float _3853 = log2(_3851);
    float _3855 = _3835 * _3811;
    float _3857 = _3849 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3859 = -_3857;
    float _3861 = fma(_3847, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3859);
    float _3863 = -_3855;
    float _3865 = fma(_3863, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3861);
    float _3867 = fma(_3865, -0.5, 0.5);
    float _3869 = _3853 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3871 = fma(_3865, 0.5, 0.5);
    float _3873 = sqrt(_3867);
    float _3875 = fma(_3871, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3877 = fma(_3871, _3875, -0.212114393711090087890625);
    float _3879 = _3847 + 1.0;
    float _3881 = exp2(_3869);
    float _3883 = fma(_3871, _3877, 1.570728778839111328125);
    float _3885 = _3873 * 0.636619746685028076171875;
    float _3887 = -_3883;
    float _3889 = fma(_3885, _3887, 1.0);
    float _3891 = -_3847;
    float _3893 = fma(_3881, _3879, _3891);
    float _3895 = fma(_3893, 0.5, 0.5);
    float2 _10341 = float2(_3889, _3895);
    float3 _3899 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10341, float2(0.0), isnan(_10341)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10341, float2(0.0), isnan(_10341)), level(0.0)).xyz;
    float _3901 = _3899.x;
    float _3903 = _3899.y;
    float _3905 = _3899.z;
    float _3907 = abs(_2980);
    float _3909 = log2(_3907);
    float _3911 = -_2886;
    float _3913 = _3911 + 1.0;
    out.m_88.x = _3298;
    out.m_88.y = _3296;
    out.m_88.z = _3300;
    bool _3915 = _3829 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3917 = isnan(_3829);
    bool _3919 = _3915 || _3917;
    bool _3921 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3923 = _3919 || _3921;
    bool _3925 = _2980 <= 8000.0;
    bool _3927 = isnan(_2980);
    bool _3929 = _3925 || _3927;
    bool _3931 = isnan(8000.0);
    bool _3933 = _3929 || _3931;
    float _3935 = float(_3933);
    float _3937 = _3909 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3939 = _3426 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3941 = fma(_3428, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3939);
    float _3943 = exp2(_3937);
    float _3945 = fma(_3432, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3941);
    float _3947 = fma(_3943, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3949 = precise::clamp(_3947, 0.0, 1.0);
    float _3951 = _3853 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3953 = fma(_3949, -2.0, 3.0);
    float _3955 = _3949 * _3949;
    float _3957 = exp2(_3951);
    float _3959 = _3955 * _3953;
    float _3961 = fma(_3452, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3945);
    float _3963 = -_3959;
    float _3965 = _3963 + 1.0;
    float _3967 = _3961 + _3466;
    out.gl_Position.x = _3504;
    out.gl_Position.y = _3506;
    out.gl_Position.z = _3961;
    out.gl_Position.w = _3466;
    float _3969 = fma(_3965, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3959);
    float _3971 = _3967 * 0.5;
    float _3973 = _3935 * _3969;
    float _3975 = _3935;
    float _3977 = _3961;
    if (!_3462)
    {
        _3975 = 1.0;
    }
    float _3979 = _3975;
    float _3981 = -_3957;
    float _3983 = _3981 + 1.0;
    float _3985 = _3979;
    if (_3462)
    {
        bool _3987 = _3574 >= _3510;
        bool _3989 = isnan(_3574);
        bool _3991 = _3987 || _3989;
        bool _3993 = isnan(_3510);
        bool _3995 = _3991 || _3993;
        float _3997 = float(_3995);
        _3985 = _3997;
    }
    float _3999 = _3985;
    float _4001 = _3973 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_90.z = _3971;
    out.m_90.w = _3466;
    float _4003 = _3983 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4005 = _3913 * _4001;
    float _4007 = precise::clamp(_4005, 0.0, 1.0);
    float _4009 = _3999 * _3663;
    float _4011 = _4003 * _3576;
    float _4013 = -_4003;
    float _4015 = _4013 + 1.0;
    float _4017 = -_4007;
    float _4019 = fma(_4017, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4021 = _4015;
    float _4023 = _4003;
    if (!_3923)
    {
        _3474 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4025 = _3474;
    float _4027 = _3587 * _4011;
    float _4029 = _3587 * _4015;
    float _4031 = -_4009;
    float _4033 = fma(_4031, _4019, 1.0);
    float _4035 = precise::clamp(_4033, 0.0, 1.0);
    float _4037 = _4027;
    float _4039 = _4025;
    float _4041 = _4025;
    if (!_3923)
    {
        _3476 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4043 = _3476;
    float _4045 = _4043;
    float _4047 = _4043;
    if (!_3923)
    {
        _3977 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4049 = _3977;
    float _4051 = _4035 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4053 = _4049;
    float _4055 = _4049;
    if (!_3923)
    {
        _4021 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4057 = _4021;
    float _4059 = _4057;
    float _4061 = _4057;
    if (!_3923)
    {
        _4023 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4063 = _4023;
    out.m_92.x = _4051;
    float _4065 = _3905 * _4011;
    float _4067 = fma(_3901, _4027, _3581);
    float _4069 = fma(_3903, _4027, _3583);
    float _4071 = _4063;
    float _4073 = _4063;
    if (!_3923)
    {
        _4037 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4075 = _4037;
    float _4077 = fma(_3587, _4065, _3585);
    out.m_94.x = _4067;
    out.m_94.y = _4069;
    out.m_94.z = _4077;
    out.m_94.w = _4029;
    bool _4079 = !_3923;
    float _4081 = _4075;
    float _4083 = _4075;
    if (!_4079)
    {
        bool _4085 = _3829 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4087 = isnan(_3829);
        bool _4089 = _4085 || _4087;
        bool _4091 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4093 = _4089 || _4091;
        if (!_4093)
        {
            float _4095 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4097 = _3829 + _4095;
            float _4099 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4101 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4099;
            float _4103 = 1.0 / _4101;
            float _4105 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4107 = _4105 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4109 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4111 = _4109 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4113 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4115 = _4113 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4117 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4119 = _4117 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4121 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4123 = _4121 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4125 = _4097 * _4103;
            float _4127 = precise::clamp(_4125, 0.0, 1.0);
            float _4129 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4131 = _4129 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4133 = fma(_4127, _4107, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4135 = fma(_4127, _4131, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4137 = fma(_4127, _4111, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4139 = fma(_4127, _4115, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4141 = fma(_4127, _4119, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4143 = fma(_4127, _4123, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4047 = _4135;
            _4061 = _4141;
            _4041 = _4133;
            _4083 = _4139;
            _4055 = _4137;
            _4073 = _4143;
            _4145 = true;
        }
        else
        {
            bool _4147 = _3829 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4149 = isnan(_3829);
            bool _4151 = _4147 || _4149;
            bool _4153 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4155 = _4151 || _4153;
            if (!_4155)
            {
                _4039 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4157 = _4039;
            _4041 = _4157;
            if (!_4155)
            {
                _4045 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4159 = _4045;
            _4047 = _4159;
            if (!_4155)
            {
                _4053 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4161 = _4053;
            _4055 = _4161;
            if (!_4155)
            {
                _4081 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4163 = _4081;
            _4083 = _4163;
            if (!_4155)
            {
                _4059 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4165 = _4059;
            _4061 = _4165;
            if (!_4155)
            {
                _4071 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4167 = _4071;
            bool _4169 = !_4155;
            _4073 = _4167;
            if (!_4169)
            {
                bool _4171 = _3829 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4173 = isnan(_3829);
                bool _4175 = _4171 || _4173;
                bool _4177 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4179 = _4175 || _4177;
                if (!_4179)
                {
                    float _4181 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4183 = _3829 + _4181;
                    float _4185 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4187 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4185;
                    float _4189 = 1.0 / _4187;
                    float _4191 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4193 = _4191 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4195 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4197 = _4195 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4199 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4201 = _4199 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4203 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4205 = _4203 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4207 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4209 = _4207 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4211 = _4183 * _4189;
                    float _4213 = precise::clamp(_4211, 0.0, 1.0);
                    float _4215 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4217 = _4215 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4219 = fma(_4213, _4193, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4221 = fma(_4213, _4217, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4223 = fma(_4213, _4197, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4225 = fma(_4213, _4201, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4227 = fma(_4213, _4205, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4229 = fma(_4213, _4209, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4047 = _4221;
                    _4061 = _4227;
                    _4041 = _4219;
                    _4083 = _4225;
                    _4055 = _4223;
                    _4073 = _4229;
                    _4145 = true;
                }
                else
                {
                    _4047 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4061 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4041 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4083 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4055 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4073 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4145 = false;
    float _4231 = _4047;
    float _4233 = _4061;
    float _4235 = _4041;
    float _4237 = _4083;
    float _4239 = _4055;
    float _4241 = _4073;
    float _4243 = fma(_2790, -0.5, 0.5);
    float _4245 = precise::clamp(_4243, 0.0, 1.0);
    float _4247 = -_4231;
    float _4249 = _4247 + _4233;
    float _4251 = -_4235;
    float _4253 = _4251 + _4237;
    float _4255 = -_4239;
    float _4257 = _4255 + _4241;
    bool _4259 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4261 = fma(_4245, _4249, _4231);
    float _4263 = fma(_4245, _4253, _4235);
    float _4265 = fma(_4245, _4257, _4239);
    float _4267 = _4261 * 0.586610972881317138671875;
    out.m_96.x = 0.0;
    float _4269 = fma(_4263, 0.298911988735198974609375, _4267);
    float _4271 = fma(_4265, 0.114477999508380889892578125, _4269);
    float _4273 = -_4271;
    float _4275 = _4263 + _4273;
    float _4277 = -_4271;
    float _4279 = _4261 + _4277;
    float _4281 = -_4271;
    float _4283 = _4265 + _4281;
    float _4285 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4287 = fma(_4275, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4271);
    float _4289 = fma(_4279, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4271);
    float _4291 = fma(_4283, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4271);
    out.m_61.x = _4285;
    out.m_98.x = _4287;
    out.m_98.y = _4289;
    out.m_98.z = _4291;
    if (!_4259)
    {
        return out;
    }
    float _4293 = -_3296;
    float _4295 = _4293 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4297 = -_3298;
    float _4299 = _4297 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4301 = -_3300;
    float _4303 = _4301 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4305 = _4295 * _4295;
    float _4307 = fma(_4299, _4299, _4305);
    float _4309 = fma(_4303, _4303, _4307);
    float _4311 = sqrt(_4309);
    float _4313 = rsqrt(_4309);
    float _4315 = -_4311;
    float _4317 = _4315 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4319 = _4317 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4321 = precise::clamp(_4319, 0.0, 1.0);
    float _4323 = _4299 * _4313;
    float _4325 = _4295 * _4313;
    float _4327 = abs(_4321);
    float _4329 = log2(_4327);
    float _4331 = _4303 * _4313;
    float _4333 = _4323 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4335 = _2790 * _4325;
    float _4337 = -_4325;
    float _4339 = -_4333;
    float _4341 = fma(_4337, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4339);
    float _4343 = fma(_2788, _4323, _4335);
    float _4345 = -_4331;
    float _4347 = fma(_4345, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4341);
    float _4349 = fma(_2792, _4331, _4343);
    float _4351 = precise::clamp(_4349, 0.0, 1.0);
    float _4353 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4355 = _4347 + _4353;
    float _4357 = _4329 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4359 = _4355 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4361 = precise::clamp(_4359, 0.0, 1.0);
    float _4363 = exp2(_4357);
    float _4365 = _4363 * _4361;
    float _4367 = _4351 * _4365;
    float _4369 = _4367 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4371 = _4367 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4373 = _4367 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_96.x = _4369;
    out.m_96.y = _4371;
    out.m_96.z = _4373;
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
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4145 = false;
    bool _2838 = false;
    bool _953 = false;
    bool _781 = false;
    bool _563 = false;
    bool _387 = false;
    bool _239 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_58.w;
    float _114 = trunc(_112);
    int _117 = int(_114);
    bool _121 = _117 >= 1;
    float _123 = 0.0;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    float _127 = _125;
    if (!_121)
    {
        out.m_61.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _125 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4430 = as_type<float>(_133);
        out.gl_Position.z = _4430;
    }
    if (!_121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = in.m_63.w;
    bool _139 = _137 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_137);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = -_137;
    float _151 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_147)
    {
        float _153 = float(_117);
        _127 = _153;
    }
    float _155 = _127;
    bool _157 = _151 >= _155;
    bool _159 = !_147;
    bool _161 = _157 || _159;
    float _163 = _155;
    if (_161)
    {
        _163 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _163;
    if (_161)
    {
        out.m_61.x = 0.0;
    }
    if (_161)
    {
        float _167 = _165 * 5.0;
        _135 = as_type<int>(_167);
    }
    int _169 = _135;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4499 = as_type<float>(_169);
        out.gl_Position.z = _4499;
    }
    if (_161)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _171 = as_type<float>(int(gl_VertexIndex));
    float _173 = in.m_68.x;
    float _175 = in.m_68.y;
    float _177 = in.m_68.z;
    int _179 = as_type<int>(_171) & 1;
    bool _181 = _179 != 0;
    int _183 = as_type<int>(_171) & 2;
    bool _185 = _183 != 0;
    bool _187 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _189 = _175 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _191 = _175 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _193 = _175 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _195 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[4].x, _189);
    float _197 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[5].x, _191);
    float _199 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[6].x, _193);
    float _201 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[4].z, _195);
    float _203 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[5].z, _197);
    float _205 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[6].z, _199);
    bool _207 = !_181;
    float _209 = _207 ? (-0.5) : 0.5;
    bool _211 = !_185;
    float _213 = _211 ? (-0.5) : 0.5;
    bool _215 = !_187;
    float _217 = _213;
    int _219 = as_type<int>(_203);
    float _237;
    if (!_215)
    {
        float _221 = in.m_70.x;
        float _223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _225 = _221 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _227 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[12].x, _151);
        float _229 = _227 * _223;
        float _231 = floor(_229);
        float _233 = -_231;
        float _235 = _229 + _233;
        _237 = _235;
        _239 = true;
    }
    else
    {
        float _241 = float(_117);
        float _243 = 1.0 / _241;
        float _245 = _151 * _243;
        _237 = _245;
    }
    _239 = false;
    float _247 = _237;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _251 = _247 + _249;
    bool _253 = _247 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _255 = isnan(_247);
    bool _257 = _253 || _255;
    bool _259 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _261 = _257 || _259;
    float _263 = float(_261);
    bool _265 = _247 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _267 = isnan(_247);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _283 = _281 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _285 = -_263;
    float _287 = _285 + 1.0;
    float _289 = 1.0 / _279;
    bool _291 = _247 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _293 = isnan(_247);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = _275 * _287;
    float _305 = -_275;
    float _307 = _305 + 1.0;
    bool _309 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _311 = _301 * _307;
    float _313 = 1.0 / _283;
    float _315 = -_301;
    float _317 = _315 + 1.0;
    float _319 = _251 * _289;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _323 = _247 + _321;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _325;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _329;
    float _333 = fma(_327, _319, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _335 = fma(_331, _319, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _337 = _323 * _313;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _343 = _333 * _311;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _349 = _335 * _311;
    float _351 = fma(_341, _337, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _353 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[143].x, _343);
    float _355 = fma(_347, _337, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _357 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[143].y, _349);
    float _359 = fma(_351, _303, _353);
    float _361 = fma(_355, _303, _357);
    float _363 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[145].x, _359);
    float _365 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[145].y, _361);
    bool _367 = !_309;
    float _385;
    if (!_367)
    {
        float _369 = in.m_70.x;
        float _371 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _373 = _369 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _375 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[11].x, _151);
        float _377 = _375 * _371;
        float _379 = floor(_377);
        float _381 = -_379;
        float _383 = _377 + _381;
        _385 = _383;
        _387 = true;
    }
    else
    {
        float _389 = float(_117);
        float _391 = 1.0 / _389;
        float _393 = _151 * _391;
        _385 = _393;
    }
    _387 = false;
    float _395 = _385;
    float _397 = in.m_72.x;
    float _399 = in.m_72.y;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _403 = _395 + _401;
    bool _405 = _395 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _407 = isnan(_395);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _417;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _425 = _395 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _427 = isnan(_395);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    float _437 = 1.0 / _423;
    bool _439 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _441 = 1.0 / _419;
    float _443 = _365 * _399;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _447 = _395 + _445;
    bool _449 = _395 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _451 = isnan(_395);
    bool _453 = _449 || _451;
    bool _455 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _457 = _453 || _455;
    float _459 = float(_457);
    float _461 = _363 * _397;
    float _463 = _447 * _437;
    float _465 = -_459;
    float _467 = _465 + 1.0;
    float _469 = _403 * _441;
    float _471 = -_415;
    float _473 = _471 + 1.0;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _475;
    float _479 = _435 * _467;
    float _481 = -_435;
    float _483 = _481 + 1.0;
    float _485 = _459 * _473;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _487;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _491;
    float _495 = fma(_477, _469, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _497 = fma(_489, _469, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _499 = fma(_493, _469, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _501 = _495 * _479;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _505 = _503 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _507 = _497 * _479;
    float _509 = _499 * _479;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _519 = fma(_505, _463, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _521 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[107].x, _507);
    float _523 = fma(_513, _463, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _525 = fma(_517, _463, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _527 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[107].y, _501);
    float _529 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[107].z, _509);
    float _531 = fma(_523, _485, _521);
    float _533 = fma(_519, _485, _527);
    float _535 = fma(_525, _485, _529);
    float _537 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[109].x, _531);
    float _539 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[109].y, _533);
    float _541 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[109].z, _535);
    bool _543 = !_439;
    float _561;
    if (!_543)
    {
        float _545 = in.m_70.x;
        float _547 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _549 = _545 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _551 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[11].y, _151);
        float _553 = _551 * _547;
        float _555 = floor(_553);
        float _557 = -_555;
        float _559 = _553 + _557;
        _561 = _559;
        _563 = true;
    }
    else
    {
        float _565 = float(_117);
        float _567 = 1.0 / _565;
        float _569 = _151 * _567;
        _561 = _569;
    }
    _563 = false;
    float _571 = _561;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _575 = _571 + _573;
    float _577 = _537 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _581 = _579 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _583;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _589 = _587 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _591 = _571 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _593 = isnan(_571);
    bool _595 = _591 || _593;
    bool _597 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _599 = _595 || _597;
    float _601 = float(_599);
    float _603 = 1.0 / _581;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _609 = _571 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _611 = isnan(_571);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = _539 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _623 = _541 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _625 = _577 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _627 = _621 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _629 = 1.0 / _589;
    float _631 = _623 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _633 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _635 = _585 * _603;
    bool _637 = _571 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _639 = isnan(_571);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _645 = _641 || _643;
    float _647 = float(_645);
    float _649 = 1.0 / _607;
    float _651 = -_601;
    float _653 = _651 + 1.0;
    float _655 = fma(_635, _575, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _661 = _571 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _663 = isnan(_571);
    bool _665 = _661 || _663;
    bool _667 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _669 = _665 || _667;
    float _671 = float(_669);
    float _673 = -_647;
    float _675 = _673 + 1.0;
    float _677 = _647 * _653;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _681 = _679 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _683 = 1.0 / _659;
    float _685 = -_671;
    float _687 = _685 + 1.0;
    float _689 = _619 * _675;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _691;
    float _695 = _681 * _629;
    float _697 = _601 * _687;
    float _699 = _655 * _689;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _703 = _571 + _701;
    float _705 = -_619;
    float _707 = _705 + 1.0;
    bool _709 = _571 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _711 = isnan(_571);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = _693 * _649;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _725 = _723 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _729 = _571 + _727;
    float _731 = fma(_695, _703, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _733 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[115].x, _699);
    float _735 = -_719;
    float _737 = _735 + 1.0;
    float _739 = _725 * _683;
    float _741 = fma(_721, _729, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _745 = _571 + _743;
    float _747 = fma(_731, _677, _733);
    float _749 = _671 * _737;
    float _751 = fma(_739, _745, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _753 = fma(_741, _697, _747);
    float _755 = fma(_751, _749, _753);
    float _757 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[119].x, _755);
    float _759 = _757 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_74.x = _625;
    out.m_74.y = _627;
    out.m_74.z = _631;
    out.m_74.w = _759;
    bool _761 = !_633;
    float _779;
    if (!_761)
    {
        float _763 = in.m_70.x;
        float _765 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _767 = _763 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _769 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[11].z, _151);
        float _771 = _769 * _765;
        float _773 = floor(_771);
        float _775 = -_773;
        float _777 = _771 + _775;
        _779 = _777;
        _781 = true;
    }
    else
    {
        float _783 = float(_117);
        float _785 = 1.0 / _783;
        float _787 = _151 * _785;
        _779 = _787;
    }
    _781 = false;
    float _789 = _779;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _793 = _789 + _791;
    bool _795 = _789 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _797 = isnan(_789);
    bool _799 = _795 || _797;
    bool _801 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _803 = _799 || _801;
    float _805 = float(_803);
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _809 = _789 + _807;
    bool _811 = _789 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _813 = isnan(_789);
    bool _815 = _811 || _813;
    bool _817 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _819 = _815 || _817;
    float _821 = float(_819);
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _823;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _829 = _827 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _831 = _789 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _833 = isnan(_789);
    bool _835 = _831 || _833;
    bool _837 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _839 = _835 || _837;
    float _841 = float(_839);
    float _843 = -_805;
    float _845 = _843 + 1.0;
    float _847 = 1.0 / _829;
    float _849 = _841 * _845;
    float _851 = -_841;
    float _853 = _851 + 1.0;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _855;
    bool _859 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _861 = 1.0 / _825;
    float _863 = _821 * _853;
    float _865 = -_821;
    float _867 = _865 + 1.0;
    float _869 = _793 * _861;
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _871;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _875;
    float _879 = fma(_857, _869, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _881 = fma(_873, _869, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _883 = fma(_877, _869, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _885 = _809 * _847;
    float _887 = _879 * _863;
    float _889 = _881 * _863;
    float _891 = _883 * _863;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _895 = _893 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _899 = _897 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _901 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _903 = _901 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _905 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[123].x, _887);
    float _907 = fma(_895, _885, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _909 = fma(_899, _885, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _911 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[123].y, _889);
    float _913 = fma(_903, _885, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _915 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[123].z, _891);
    float _917 = fma(_907, _849, _905);
    float _919 = fma(_909, _849, _911);
    float _921 = fma(_913, _849, _915);
    float _923 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[125].x, _917);
    float _925 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[125].y, _919);
    float _927 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[125].z, _921);
    bool _929 = !_859;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _933 = _923;
    float _951;
    if (!_929)
    {
        float _935 = in.m_70.x;
        float _937 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _939 = _935 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _941 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[11].w, _151);
        float _943 = _941 * _937;
        float _945 = floor(_943);
        float _947 = -_945;
        float _949 = _943 + _947;
        _951 = _949;
        _953 = true;
    }
    else
    {
        float _955 = float(_117);
        float _957 = 1.0 / _955;
        float _959 = _151 * _957;
        _951 = _959;
    }
    _953 = false;
    float _961 = _951;
    float _963 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _965 = int(_963);
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _969 = _961 + _967;
    float _971 = float(_117);
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _975 = _973 != 0;
    float _977 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _979 = int(_977);
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _983 = _981 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _987 = _985 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _989 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _991 = int(_989);
    float _993 = float(_965);
    if (_975)
    {
        float _995 = in.m_70.x;
        _931 = _995;
    }
    float _997 = _931;
    float _999 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1003 = _997;
    if (!_975)
    {
        float _1005 = in.m_70.y;
        _1003 = _1005;
    }
    float _1007 = _1003;
    float _1009 = 1.0 / _993;
    float _1011 = float(uint(_979));
    int _1013 = ~_979;
    int _1015 = _1013 + 1;
    bool _1017 = _979 == 0;
    float _1019 = 1.0 / _1011;
    float _1021 = float(uint(_991));
    float _1023 = _151 * _1009;
    float _1025 = 1.0 / _1021;
    int _1027 = as_type<int>(_1019) + (-2);
    float _1029 = trunc(_1023);
    int _1031 = int(_1029);
    int _1033 = ~_979;
    int _1035 = _1033 + 1;
    float _1037 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1039 = int(_1037);
    int _1041 = as_type<int>(_1025) + (-2);
    float _1043 = float(uint(_1031));
    float _1045 = 1.0 / _971;
    float _1047 = as_type<float>(_1027) * _1043;
    float _1049 = float(_1039);
    float _1051 = trunc(_1047);
    float _1053 = precise::max(_1051, 0.0);
    uint _1056 = uint(_1053);
    float _1058 = 1.0 / _1049;
    int _1060 = _1035 * int(_1056);
    int _1062 = _1060 + _1031;
    float _1064 = float(_979);
    float _1066 = 1.0 / _983;
    float _1068 = float(uint(_1062));
    float _1070 = in.m_70.x;
    float _1072 = in.m_70.y;
    float _1074 = in.m_70.z;
    float _1076 = in.m_70.w;
    float _1078 = _151 * _1058;
    float _1080 = float(_1031);
    float _1082 = as_type<float>(_1027) * _1068;
    float _1084 = _1068;
    if (_975)
    {
        _1084 = 1.0;
    }
    float _1086 = _1084;
    float _1088 = 1.0 / _987;
    float _1090 = _1086;
    if (!_975)
    {
        _1090 = 7.345489978790283203125;
    }
    float _1092 = _1090;
    bool _1094 = _1080 >= _1064;
    bool _1096 = isnan(_1080);
    bool _1098 = _1094 || _1096;
    bool _1100 = isnan(_1064);
    bool _1102 = _1098 || _1100;
    float _1104 = float(_1102);
    float _1106 = trunc(_1082);
    float _1108 = precise::max(_1106, 0.0);
    uint _1110 = uint(_1108);
    float _1112 = trunc(_1078);
    int _1114 = int(_1112);
    int _1116 = int(_1056) + int(_1110);
    float _1118 = _1092 * _1070;
    float _1120 = _1092;
    float _1122 = _1070;
    float _1124 = _1074;
    if (_975)
    {
        _1120 = 1.0;
    }
    float _1126 = _1120;
    float _1128 = _1126;
    if (!_975)
    {
        _1128 = 1.2345600128173828125;
    }
    float _1130 = _1128;
    int _1132 = _1015 * _1116;
    int _1134 = _1132 + _1031;
    float _1136 = floor(_1118);
    float _1138 = float(uint(_1114));
    bool _1140 = uint(_1134) >= uint(_979);
    float _1142 = _1007 * _1130;
    int _1144 = _979 + (-1);
    float _1146 = trunc(_1104);
    int _1148 = int(_1146);
    bool _1150 = !_1140;
    int _1152 = _1150 ? 0 : (-1);
    int _1154 = ~_1116;
    int _1156 = _1154 + _1152;
    int _1158 = _1156 + 1;
    float _1160 = floor(_1142);
    float _1162 = as_type<float>(_1041) * _1138;
    int _1164 = _979 * _1158;
    int _1166 = _1164 + _1031;
    float _1168 = -_1136;
    float _1170 = _1118 + _1168;
    bool _1172 = !_1017;
    int _1174 = _1172 ? _1166 : (-1);
    float _1176 = trunc(_1162);
    float _1178 = precise::max(_1176, 0.0);
    uint _1180 = uint(_1178);
    int _1182 = ~_1148;
    int _1184 = _1182 + 1;
    int _1186 = _1184 + 1;
    float _1188 = _1170 * _1064;
    int _1190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1192 = _1190 != 0;
    int _1194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1196 = _1194 != 0;
    int _1198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1200 = _1198 != 0;
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1204 = _1202 != 0;
    int _1206 = _1174 * _1186;
    float _1208 = -_1160;
    float _1210 = _1142 + _1208;
    int _1212 = ~_991;
    int _1214 = _1212 + 1;
    int _1216 = _1148 * _1144;
    int _1218 = _1216 + _1206;
    float _1220 = _151 * _1045;
    float _1222 = trunc(_1188);
    int _1224 = int(_1222);
    bool _1226 = !_1196;
    int _1228 = _1226 ? 0 : 1;
    float _1230 = _1220 * _1064;
    int _1232 = _1214 * int(_1180);
    int _1234 = _1232 + _1114;
    int _1236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1238 = _1236 != 0;
    bool _1240 = !_1192;
    int _1242 = _1240 ? 0 : 1;
    float _1244 = float(uint(_1234));
    float _1246 = trunc(_1230);
    int _1248 = int(_1246);
    bool _1250 = !_1238;
    int _1252 = _1250 ? 0 : 1;
    int _1254 = abs(_1228);
    float _1256 = as_type<float>(_1041) * _1244;
    int _1258 = abs(_1242);
    int _1260 = abs(_1252);
    int _1262 = _1218 * _1254;
    bool _1264 = !_1200;
    int _1266 = _1264 ? 0 : 1;
    float _1268 = trunc(_1256);
    float _1270 = precise::max(_1268, 0.0);
    uint _1272 = uint(_1270);
    bool _1274 = !_1204;
    int _1276 = _1274 ? 0 : 1;
    int _1278 = _1224 * _1260;
    int _1280 = _1278 + _1031;
    int _1282 = abs(_1266);
    int _1284 = ~_991;
    int _1286 = _1284 + 1;
    int _1288 = _1248 * _1258;
    int _1290 = _1288 + _1262;
    int _1292 = abs(_1276);
    float _1294 = float(_991);
    int _1296 = _1280 * _1282;
    int _1298 = _1296 + _1290;
    float _1300 = float(_1114);
    int _1302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1304 = _1302 != 0;
    int _1306 = _1224 * _1292;
    int _1308 = _1306 + _1298;
    bool _1310 = _1300 >= _1294;
    bool _1312 = isnan(_1300);
    bool _1314 = _1310 || _1312;
    bool _1316 = isnan(_1294);
    bool _1318 = _1314 || _1316;
    float _1320 = float(_1318);
    int _1322 = int(_1180) + int(_1272);
    float _1324 = _1210 * _1294;
    float _1326 = _1220 * _1294;
    float _1328 = float(uint(_1308));
    float _1330 = trunc(_1320);
    int _1332 = int(_1330);
    int _1334 = _1286 * _1322;
    int _1336 = _1334 + _1114;
    float _1338 = as_type<float>(_1027) * _1328;
    bool _1340 = !_1304;
    int _1342 = _1340 ? 0 : 1;
    bool _1344 = uint(_1336) >= uint(_991);
    float _1346 = trunc(_1324);
    int _1348 = int(_1346);
    int _1350 = abs(_1342);
    bool _1352 = !_1344;
    int _1354 = _1352 ? 0 : (-1);
    int _1356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1358 = _1356 != 0;
    int _1360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1362 = _1360 != 0;
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1366 = _1364 != 0;
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1370 = _1368 != 0;
    int _1372 = ~_1322;
    int _1374 = _1372 + _1354;
    int _1376 = _1374 + 1;
    float _1378 = trunc(_1338);
    float _1380 = precise::max(_1378, 0.0);
    uint _1382 = uint(_1380);
    int _1384 = ~_979;
    int _1386 = _1384 + 1;
    bool _1388 = _991 == 0;
    int _1390 = _991 * _1376;
    int _1392 = _1390 + _1114;
    int _1394 = ~_1332;
    int _1396 = _1394 + 1;
    int _1398 = _1396 + 1;
    int _1400 = _1348 * _1350;
    int _1402 = _1400 + _1114;
    bool _1404 = !_1388;
    int _1406 = _1404 ? _1392 : (-1);
    float _1408 = trunc(_1326);
    int _1410 = int(_1408);
    int _1412 = _991 + (-1);
    bool _1414 = _979 == 0;
    int _1416 = _1406 * _1398;
    bool _1418 = !_1362;
    int _1420 = _1418 ? 0 : 1;
    int _1422 = _1386 * int(_1382);
    int _1424 = _1422 + _1308;
    int _1426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1428 = _1426 != 0;
    int _1430 = _1332 * _1412;
    int _1432 = _1430 + _1416;
    int _1434 = abs(_1420);
    float _1436 = float(uint(_1424));
    bool _1438 = !_1358;
    int _1440 = _1438 ? 0 : 1;
    int _1442 = _1432 * _1434;
    bool _1444 = !_1366;
    int _1446 = _1444 ? 0 : 1;
    float _1448 = as_type<float>(_1027) * _1436;
    int _1450 = abs(_1440);
    int _1452 = abs(_1446);
    bool _1454 = !_1370;
    int _1456 = _1454 ? 0 : 1;
    float _1458 = trunc(_1448);
    float _1460 = precise::max(_1458, 0.0);
    uint _1462 = uint(_1460);
    float _1464 = float(uint(_1280));
    int _1466 = _1410 * _1450;
    int _1468 = _1466 + _1442;
    int _1470 = abs(_1456);
    float _1472 = as_type<float>(_1027) * _1464;
    float _1474 = float(uint(_1402));
    int _1476 = _1402 * _1452;
    int _1478 = _1476 + _1468;
    int _1480 = 0;
    if (_1428)
    {
        _1480 = 0;
    }
    int _1482 = _1480;
    float _1484 = trunc(_1472);
    float _1486 = precise::max(_1484, 0.0);
    uint _1488 = uint(_1486);
    int _1490 = _1482;
    if (!_1428)
    {
        _1490 = 1;
    }
    int _1492 = _1490;
    int _1494 = _1348 * _1470;
    int _1496 = _1494 + _1478;
    int _1498 = ~_979;
    int _1500 = _1498 + 1;
    float _1502 = as_type<float>(_1041) * _1474;
    int _1504 = ~_979;
    int _1506 = _1504 + 1;
    int _1508 = int(_1382) + int(_1462);
    float _1510 = float(uint(_1496));
    float _1512 = trunc(_1502);
    float _1514 = precise::max(_1512, 0.0);
    uint _1516 = uint(_1514);
    int _1518 = ~_991;
    int _1520 = _1518 + 1;
    int _1522 = _1500 * _1508;
    int _1524 = _1522 + _1308;
    float _1526 = as_type<float>(_1041) * _1510;
    int _1528 = _1506 * int(_1488);
    int _1530 = _1528 + _1280;
    bool _1532 = uint(_1524) >= uint(_979);
    int _1534 = ~_991;
    int _1536 = _1534 + 1;
    float _1538 = trunc(_1526);
    float _1540 = precise::max(_1538, 0.0);
    uint _1542 = uint(_1540);
    bool _1544 = !_1532;
    int _1546 = _1544 ? 0 : (-1);
    float _1548 = float(uint(_1530));
    int _1550 = ~_1508;
    int _1552 = _1550 + _1546;
    int _1554 = _1552 + 1;
    int _1556 = _1520 * int(_1516);
    int _1558 = _1556 + _1402;
    float _1560 = as_type<float>(_1027) * _1548;
    int _1562 = _979 * _1554;
    int _1564 = _1562 + _1308;
    float _1566 = float(uint(_1558));
    float _1568 = trunc(_1560);
    float _1570 = precise::max(_1568, 0.0);
    uint _1572 = uint(_1570);
    bool _1574 = !_1414;
    int _1576 = _1574 ? _1564 : (-1);
    int _1578 = _1536 * int(_1542);
    int _1580 = _1578 + _1496;
    float _1582 = as_type<float>(_1041) * _1566;
    int _1584 = _1576 & 3;
    bool _1586 = _1584 != 0;
    float _1588 = float(uint(_1580));
    float _1590 = trunc(_1582);
    float _1592 = precise::max(_1590, 0.0);
    uint _1594 = uint(_1592);
    bool _1596 = uint(_1584) > 1u;
    int _1598 = _1576 & 3;
    bool _1600 = _1598 != 0;
    float _1602 = as_type<float>(_1041) * _1588;
    bool _1604 = _1584 != 3;
    int _1606 = _1600 ? 0 : 1;
    float _1608 = trunc(_1602);
    float _1610 = precise::max(_1608, 0.0);
    uint _1612 = uint(_1610);
    bool _1614 = uint(_1584) >= 2u;
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1618 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1616;
    int _1620 = int(_1488) + int(_1572);
    float _1622 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1624 = _1622 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _1626 = ~_1606;
    int _1628 = _1626 + 1;
    int _1630 = _1628 + 1;
    float _1632 = _1618 * _1066;
    int _1634 = _1630;
    if (!_1596)
    {
        int _1636 = ~_1606;
        int _1638 = _1636 + 1;
        _1634 = _1638;
    }
    int _1640 = _1634;
    int _1642 = _1614 ? 0 : 1;
    int _1644 = ~_979;
    int _1646 = _1644 + 1;
    int _1648 = ~_991;
    int _1650 = _1648 + 1;
    int _1652 = ~_1642;
    int _1654 = _1652 + 1;
    int _1656 = _1654 + 1;
    int _1658 = _1646 * _1620;
    int _1660 = _1658 + _1280;
    int _1662 = _1656;
    if (_1604)
    {
        int _1664 = ~_1642;
        int _1666 = _1664 + 1;
        _1662 = _1666;
    }
    int _1668 = _1662;
    int _1670 = int(_1516) + int(_1594);
    bool _1672 = _1076 > 0.5;
    bool _1674 = uint(_1660) >= uint(_979);
    int _1676 = _1650 * _1670;
    int _1678 = _1676 + _1402;
    int _1680 = int(_1542) + int(_1612);
    float _1682 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1684 = ~_991;
    int _1686 = _1684 + 1;
    float _1688 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1690 = -_999;
    float _1692 = fma(_1682, 2.0, _1690);
    int _1694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1696 = _1694 != 0;
    int _1698 = _1686 * _1680;
    int _1700 = _1698 + _1496;
    bool _1702 = !_1674;
    int _1704 = _1702 ? 0 : (-1);
    float _1706 = fma(_1688, -2.0, _1001);
    bool _1708 = !_1696;
    int _1710 = _1708 ? 0 : 1;
    float _1712 = -_151;
    float _1714 = fma(_1712, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1692);
    int _1716 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1718 = _1716 != 0;
    float _1720 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1706);
    bool _1722 = uint(_1678) >= uint(_991);
    float _1724 = in.m_58.x;
    float _1726 = in.m_58.y;
    float _1728 = in.m_58.z;
    bool _1730 = uint(_1700) >= uint(_991);
    bool _1732 = !_1722;
    int _1734 = _1732 ? 0 : (-1);
    bool _1736 = _1070 > 0.5;
    float _1738 = -_209;
    int _1740 = _1736 ? as_type<int>(_1738) : as_type<int>(_209);
    bool _1742 = !_1730;
    int _1744 = _1742 ? 0 : (-1);
    float _1746 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1748 = _1746 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1750 = _1072 > 0.5;
    bool _1752 = !_1718;
    float _1754 = _1752 ? _209 : as_type<float>(_1740);
    int _1756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1758 = _1756 != 0;
    float _1760 = 1.0 / _1748;
    float _1762 = -_213;
    int _1764 = _1750 ? as_type<int>(_1762) : as_type<int>(_213);
    int _1766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1768 = _1766 != 0;
    bool _1770 = !_1758;
    float _1772 = _1770 ? _213 : as_type<float>(_1764);
    float _1774 = _1726 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _1776 = _1074 > 0.5;
    float _1778 = _1726 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1780 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1782 = _1780 != 0;
    float _1784 = fma(_1724, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1774);
    float _1786 = -_209;
    int _1788 = _1776 ? as_type<int>(_1786) : as_type<int>(_209);
    float _1790 = fma(_1724, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1778);
    int _1792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1794 = _1792 != 0;
    float _1796 = _1726 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1798 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1800 = isnan(_961);
    bool _1802 = _1798 || _1800;
    bool _1804 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1806 = _1802 || _1804;
    float _1808 = float(_1806);
    float _1810 = _1624 * _1760;
    bool _1812 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1814 = isnan(_961);
    bool _1816 = _1812 || _1814;
    bool _1818 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1820 = _1816 || _1818;
    float _1822 = float(_1820);
    float _1824 = fma(_1724, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1796);
    float _1826 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1828 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1826;
    float _1830 = -_1808;
    float _1832 = _1830 + 1.0;
    bool _1834 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1836 = isnan(_961);
    bool _1838 = _1834 || _1836;
    bool _1840 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1842 = _1838 || _1840;
    float _1844 = float(_1842);
    float _1846 = fma(_1728, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1790);
    float _1848 = _1828 * _1088;
    float _1850 = _1822 * _1832;
    bool _1852 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1854 = isnan(_961);
    bool _1856 = _1852 || _1854;
    bool _1858 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1860 = _1856 || _1858;
    float _1862 = float(_1860);
    float _1864 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1866 = _961 + _1864;
    float _1868 = -_1844;
    float _1870 = _1868 + 1.0;
    float _1872 = -_1822;
    float _1874 = _1872 + 1.0;
    bool _1876 = !_1794;
    float _1878 = _1876 ? _209 : as_type<float>(_1788);
    float _1880 = fma(_1632, _1866, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1882 = _1862 * _1870;
    float _1884 = _1844 * _1874;
    float _1886 = fma(_1728, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1784);
    bool _1888 = _1492 != 1;
    float _1890 = fma(_1728, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1824);
    float _1892 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1894 = _961 + _1892;
    float _1896 = _1880 * _1882;
    float _1898 = _1754 + 0.5;
    float _1900 = -_1862;
    float _1902 = _1900 + 1.0;
    float _1904 = fma(_1848, _1894, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1906 = fma(_1810, _969, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1908 = fma(_1898, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1714);
    float _1910 = fma(_1902, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1896);
    float _1912 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1914 = _1772 + (-0.5);
    int _1916 = ~_1680;
    int _1918 = _1916 + _1744;
    int _1920 = _1918 + 1;
    float _1922 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1912);
    float _1924 = -_1914;
    float _1926 = -_1720;
    float _1928 = fma(_1924, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1926);
    float _1930 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1932 = _1720;
    float _1934 = _1714;
    if (!_1888)
    {
        _1932 = _1072;
    }
    float _1936 = _1932;
    int _1938 = _991 * _1920;
    int _1940 = _1938 + _1496;
    float _1942 = _1936;
    if (!_1888)
    {
        _1934 = _1072;
    }
    float _1944 = _1934;
    float _1946 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1930);
    float _1948 = _1944;
    if (_1888)
    {
        _1942 = _1070;
    }
    float _1950 = _1942;
    float _1952 = fma(_1906, _1884, _1910);
    if (_1888)
    {
        _1948 = _1070;
    }
    float _1954 = _1948;
    float _1956 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1922);
    if (!_1888)
    {
        _1122 = _1074;
    }
    float _1958 = _1122;
    float _1960 = fma(_1904, _1850, _1952);
    float _1962 = _1958;
    if (_1888)
    {
        _1124 = _1072;
    }
    float _1964 = _1124;
    float _1966 = _1846 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (_1888)
    {
        _1962 = _1072;
    }
    float _1968 = _1962;
    float _1970 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1972 = _1886 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1974 = _1576 >> 31;
    float _1976 = fma(_1954, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1970);
    bool _1978 = !_1388;
    int _1980 = _1978 ? _1940 : (-1);
    float _1982 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1984 = _1974 & 3;
    float _1986 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1946);
    int _1988 = _1980 >> 31;
    float _1990 = fma(_1968, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1982);
    int _1992 = _1576 + _1984;
    float _1994 = _1950 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1996 = _1988 & 3;
    float _1998 = _1964 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2000 = _1992 >> 2;
    float _2002 = _1890 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2004 = _1980 + _1996;
    float _2006 = fma(_1808, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1960);
    int _2008 = _2000 << 4;
    int _2010 = _2008 + 368;
    float _2012 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2014 = _2002 + _2012;
    int _2016 = _2004 >> 2;
    float _2018 = _1878 + 0.5;
    bool _2020 = !_1586;
    int _2022 = _2020 ? 0 : 1;
    int _2024 = _2010 + 8;
    uint _2026 = uint(int(uint(_2024) >> uint(2)));
    uint _2028 = uint(int(uint(int(_2026)) >> uint(2)));
    int _2030 = int(_2026) & 3;
    float _2032 = (*spvDescriptorSet0.vp_c9)._m0[int(_2028)][_2030];
    int _2034 = int(_2026) + 1;
    uint _2036 = uint(int(uint(_2034) >> uint(2)));
    int _2038 = _2034 & 3;
    float _2040 = (*spvDescriptorSet0.vp_c9)._m0[int(_2036)][_2038];
    int _2042 = _1980 & 3;
    bool _2044 = _2042 != 0;
    float _2046 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1976);
    int _2048 = _1980 & 3;
    bool _2050 = _2048 != 0;
    float _2052 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1990);
    int _2054 = _2016 << 4;
    int _2056 = _2054 + 512;
    float _2058 = -_1956;
    float _2060 = _2058 + 1.0;
    int _2062 = _2044 ? 0 : 1;
    uint _2064 = uint(int(uint(_2010) >> uint(2)));
    uint _2066 = uint(int(uint(int(_2064)) >> uint(2)));
    int _2068 = int(_2064) & 3;
    float _2070 = (*spvDescriptorSet0.vp_c9)._m0[int(_2066)][_2068];
    int _2072 = int(_2064) + 1;
    uint _2074 = uint(int(uint(_2072) >> uint(2)));
    int _2076 = _2072 & 3;
    float _2078 = (*spvDescriptorSet0.vp_c9)._m0[int(_2074)][_2076];
    bool _2080 = uint(_2048) > 1u;
    float _2082 = -_2052;
    float _2084 = _2082 + 1.0;
    bool _2086 = !_2050;
    int _2088 = _2086 ? 0 : 1;
    uint _2090 = uint(int(uint(_2056) >> uint(2)));
    uint _2092 = uint(int(uint(int(_2090)) >> uint(2)));
    int _2094 = int(_2090) & 3;
    float _2096 = (*spvDescriptorSet0.vp_c9)._m0[int(_2092)][_2094];
    int _2098 = int(_2090) + 1;
    uint _2100 = uint(int(uint(_2098) >> uint(2)));
    int _2102 = _2098 & 3;
    float _2104 = (*spvDescriptorSet0.vp_c9)._m0[int(_2100)][_2102];
    float _2106 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2108 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _2110 = _1584 != 3;
    float _2112 = fma(_1998, -2.0, _2106);
    int _2114 = ~_2062;
    int _2116 = _2114 + 1;
    int _2118 = _2116 + 1;
    float _2120 = -_2108;
    float _2122 = fma(_1994, 2.0, _2120);
    int _2124 = _2118;
    int _2126 = as_type<int>(_1972);
    if (!_2080)
    {
        int _2128 = ~_2062;
        int _2130 = _2128 + 1;
        _2124 = _2130;
    }
    int _2132 = _2124;
    float _2134 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2136 = _1966 + _2134;
    int _2138 = _2056 + 8;
    uint _2140 = uint(int(uint(_2138) >> uint(2)));
    uint _2142 = uint(int(uint(int(_2140)) >> uint(2)));
    int _2144 = int(_2140) & 3;
    float _2146 = (*spvDescriptorSet0.vp_c9)._m0[int(_2142)][_2144];
    int _2148 = int(_2140) + 1;
    uint _2150 = uint(int(uint(_2148) >> uint(2)));
    int _2152 = _2148 & 3;
    float _2154 = (*spvDescriptorSet0.vp_c9)._m0[int(_2150)][_2152];
    float _2156 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2158 = _1972 + _2156;
    int _2160 = ~_1620;
    int _2162 = _2160 + _1704;
    int _2164 = _2162 + 1;
    float _2166 = _2136 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2168 = abs(_1640);
    float _2170 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2112);
    int _2172 = abs(_2132);
    float _2174 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2166);
    bool _2176 = uint(_2048) >= 2u;
    int _2178 = _979 * _2164;
    int _2180 = _2178 + _1280;
    int _2182 = ~_2168;
    int _2184 = _2182 + 1;
    int _2186 = _2184 + 1;
    float _2188 = fma(_2014, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2174);
    bool _2190 = !_2110;
    int _2192 = _2190 ? 0 : (-1);
    float _2194 = -_151;
    float _2196 = fma(_2194, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2122);
    bool _2198 = _2048 != 3;
    float _2200 = fma(_2018, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2196);
    int _2202 = _2176 ? 0 : 1;
    int _2204 = abs(_2022);
    int _2206 = ~_2172;
    int _2208 = _2206 + 1;
    int _2210 = _2208 + 1;
    int _2212 = ~_2202;
    int _2214 = _2212 + 1;
    int _2216 = _2214 + 1;
    int _2218 = abs(_2088);
    int _2220 = _2216;
    if (_2198)
    {
        int _2222 = ~_2202;
        int _2224 = _2222 + 1;
        _2220 = _2224;
    }
    int _2226 = _2220;
    int _2228 = _2186 * as_type<int>(_2078);
    int _2230 = abs(_1668);
    int _2232 = ~_2204;
    int _2234 = _2232 + 1;
    int _2236 = _2234 + 1;
    int _2238 = abs(_2226);
    int _2240 = _2210 * as_type<int>(_2104);
    int _2242 = _2236 * as_type<int>(_2070);
    int _2244 = _2242 + _2228;
    int _2246 = abs(_2192);
    int _2248 = ~_2218;
    int _2250 = _2248 + 1;
    int _2252 = _2250 + 1;
    int _2254 = ~_2230;
    int _2256 = _2254 + 1;
    int _2258 = _2256 + 1;
    bool _2260 = _2048 != 3;
    int _2262 = _2252 * as_type<int>(_2096);
    int _2264 = _2262 + _2240;
    int _2266 = _2258 * as_type<int>(_2032);
    int _2268 = _2266 + _2244;
    bool _2270 = !_2260;
    int _2272 = _2270 ? 0 : (-1);
    int _2274 = ~_2246;
    int _2276 = _2274 + 1;
    int _2278 = _2276 + 1;
    int _2280 = ~_2238;
    int _2282 = _2280 + 1;
    int _2284 = _2282 + 1;
    int _2286 = abs(_2272);
    int _2288 = _2278 * as_type<int>(_2040);
    int _2290 = _2288 + _2268;
    bool _2292 = !_1782;
    int _2294 = _2292 ? 0 : 1;
    int _2296 = _2284 * as_type<int>(_2146);
    int _2298 = _2296 + _2264;
    int _2300 = ~_1670;
    int _2302 = _2300 + _1734;
    int _2304 = _2302 + 1;
    float _2306 = -_213;
    int _2308 = _1672 ? as_type<int>(_2306) : as_type<int>(_213);
    int _2310 = abs(_2294);
    int _2312 = ~_2286;
    int _2314 = _2312 + 1;
    int _2316 = _2314 + 1;
    bool _2318 = !_1768;
    float _2320 = _2318 ? _213 : as_type<float>(_2308);
    int _2322 = _991 * _2304;
    int _2324 = _2322 + _1402;
    int _2326 = ~_2310;
    int _2328 = _2326 + 1;
    int _2330 = _2328 + 1;
    int _2332 = _2316 * as_type<int>(_2154);
    int _2334 = _2332 + _2298;
    int _2336 = abs(_1710);
    float _2338 = _927 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _2340 = !_1388;
    int _2342 = _2340 ? _2324 : (-1);
    int _2344 = _2334 * _2330;
    float _2346 = _2136 * _2136;
    bool _2348 = _2188 >= 0.0;
    float _2350 = _2338 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2352 = _2342 * _2310;
    int _2354 = _2352 + _2344;
    float _2356 = fma(_2158, _2158, _2346);
    int _2358 = ~_2336;
    int _2360 = _2358 + 1;
    int _2362 = _2360 + 1;
    float _2364 = _923 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _2366 = !_1414;
    int _2368 = _2366 ? _2180 : (-1);
    float _2370 = fma(_2014, _2014, _2356);
    float _2372 = _925 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2374 = _2290 * _2362;
    float _2376 = _2320 + (-0.5);
    float _2378 = -_2060;
    float _2380 = fma(_1754, _2378, _1908);
    float _2382 = rsqrt(_2370);
    float _2384 = -_2376;
    float _2386 = -_2170;
    float _2388 = fma(_2384, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2386);
    int _2390 = _2368 * _2336;
    int _2392 = _2390 + _2374;
    if (_2348)
    {
        _933 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2394 = _933;
    float _2396 = -_1986;
    float _2398 = _2396 + 1.0;
    float _2400 = -_2046;
    float _2402 = _2400 + 1.0;
    float _2404 = fma(_2320, _2084, _2388);
    float _2406 = _2364 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2408 = fma(_1772, _2398, _1928);
    float _2410 = -_2402;
    float _2412 = fma(_1878, _2410, _2200);
    float _2414 = _2372 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2416 = _2006 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2418 = as_type<int>(_2394);
    float _2420 = _2412;
    if (_2348)
    {
        float _2422 = _2394 * 5.0;
        _2418 = as_type<int>(_2422);
    }
    int _2424 = _2418;
    float _2426 = float(_2392);
    out.m_76.x = _2380;
    out.m_76.y = _2408;
    out.m_76.z = _2412;
    out.m_76.w = _2404;
    float _2428 = float(_2354);
    float _2430 = _2136 * _2382;
    float _2432 = _2158 * _2382;
    out.m_78.x = _2406;
    out.m_78.y = _2414;
    out.m_78.z = _2350;
    out.m_78.w = _2416;
    if (_2348)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7900 = as_type<float>(_2424);
        out.gl_Position.z = _7900;
    }
    out.m_80.x = _2426;
    out.m_80.y = _2428;
    if (_2348)
    {
        out.m_61.x = 0.0;
    }
    if (_2348)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2434 = -_2430;
    float _2436 = fma(_2434, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1966);
    float _2438 = _2014 * _2382;
    float _2440 = -_2432;
    float _2442 = fma(_2440, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1972);
    float _2444 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2446 = _2436 + _2444;
    float _2448 = -_2438;
    float _2450 = fma(_2448, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2002);
    float _2452 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2454 = _2442 + _2452;
    float _2456 = _2446 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2458 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2460 = _2450 + _2458;
    float _2462 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2456);
    float _2464 = fma(_2460, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2462);
    bool _2466 = _2464 >= 0.0;
    float _2468 = _2454;
    float _2470 = _2446;
    if (_2466)
    {
        _2420 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2472 = _2420;
    int _2474 = as_type<int>(_2472);
    if (_2466)
    {
        out.m_61.x = 0.0;
    }
    if (_2466)
    {
        float _2476 = _2472 * 5.0;
        _2474 = as_type<int>(_2476);
    }
    int _2478 = _2474;
    if (_2466)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8000 = as_type<float>(_2478);
        out.gl_Position.z = _8000;
    }
    if (_2466)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2480 = -_1966;
    float _2482 = _2480 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2484 = -_1972;
    float _2486 = _2484 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2488 = -_2002;
    float _2490 = _2488 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2492 = -_2430;
    float _2494 = fma(_2492, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2136);
    float _2496 = _2482 * _2482;
    float _2498 = -_2432;
    float _2500 = fma(_2498, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2158);
    float _2502 = -_2438;
    float _2504 = fma(_2502, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2014);
    float _2506 = _2494 * _2494;
    float _2508 = fma(_2486, _2486, _2496);
    float _2510 = _443 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2512 = _461 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2514 = fma(_2500, _2500, _2506);
    float _2516 = fma(_2490, _2490, _2508);
    float _2518 = fma(_2504, _2504, _2514);
    float _2520 = rsqrt(_2516);
    float _2522 = _2486 * _2520;
    float _2524 = _2490 * _2520;
    float _2526 = _2482 * _2520;
    float _2528 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2530 = _2522 * _2528;
    float _2532 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2534 = _2524 * _2532;
    float _2536 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2538 = _2526 * _2536;
    float _2540 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2542 = -_2530;
    float _2544 = fma(_2524, _2540, _2542);
    float _2546 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2548 = -_2534;
    float _2550 = fma(_2526, _2546, _2548);
    float _2552 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2554 = -_2538;
    float _2556 = fma(_2522, _2552, _2554);
    float _2558 = sqrt(_2518);
    float _2560 = _2544 * _2544;
    float _2562 = fma(_2550, _2550, _2560);
    float _2564 = fma(_2556, _2556, _2562);
    float _2566 = rsqrt(_2564);
    float _2568 = _2382 * _2558;
    float _2570 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _213);
    float _2572 = _2568 * _2510;
    float _2574 = _2568 * _2512;
    float _2576 = _2568 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2578 = _2576 * 0.5;
    float _2580 = _2570 * _2572;
    float _2582 = _2544 * _2566;
    float _2584 = _2550 * _2566;
    float _2586 = _2556 * _2566;
    float _2588 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _209);
    float _2590 = _2524 * _2582;
    float _2592 = _2526 * _2584;
    float _2594 = -_2590;
    float _2596 = fma(_2526, _2586, _2594);
    float _2598 = -_2592;
    float _2600 = fma(_2522, _2582, _2598);
    float _2602 = _2588 * _2574;
    float _2604 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2606 = _2580 * _2596;
    float _2608 = _2580 * _2600;
    float _2610 = fma(_2604, _2604, 1.0);
    float _2612 = fma(_2602, _2584, _2606);
    float _2614 = fma(_2602, _2586, _2608);
    float _2616 = fma(_2578, _2522, _2612);
    float _2618 = fma(_2578, _2524, _2614);
    float _2620 = _1972 + _2616;
    float _2622 = _2002 + _2618;
    float _2624 = _2522 * _2586;
    float _2626 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2628 = _2620 + _2626;
    float _2630 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2632 = _2622 + _2630;
    float _2634 = -_2624;
    float _2636 = fma(_2524, _2584, _2634);
    float _2638 = _2628 * _2628;
    float _2640 = _2632 * _2632;
    float _2642 = _2580 * _2636;
    float _2644 = _2638 + _2640;
    float _2646 = fma(_2602, _2582, _2642);
    float _2648 = rsqrt(_2610);
    float _2650 = fma(_2578, _2526, _2646);
    float _2652 = _1966 + _2650;
    float _2654 = sqrt(_2644);
    bool _2656 = _2654 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2658 = _2650;
    float _2660 = _2580;
    float _2662 = _2620;
    float _2664 = _2638;
    float _2666 = _2640;
    if (!_2656)
    {
        _2658 = _2620;
    }
    float _2668 = _2658;
    float _2670 = _2668;
    if (!_2656)
    {
        _2660 = _2640;
    }
    float _2672 = _2660;
    float _2674 = _2672;
    if (!_2656)
    {
        _217 = _2622;
    }
    float _2676 = _217;
    float _2678 = _2676;
    if (!_2656)
    {
        _2662 = _2652;
    }
    float _2680 = _2662;
    bool _2682 = !_2656;
    float _2684 = _2680;
    if (!_2682)
    {
        float _2686 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2688 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2690 = _2654 + _2688;
        float _2692 = rsqrt(_2644);
        float _2694 = _2690 * _2686;
        float _2696 = _2652 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2698 = _2694 * 0.15915493667125701904296875;
        float _2700 = _2698 * 6.283185482025146484375;
        float _2702 = sin(_2700);
        float _2704 = _2698 * 6.283185482025146484375;
        float _2706 = cos(_2704);
        float _2708 = fma(_2702, _2696, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2710 = _2692 * _2708;
        float _2712 = _2706 + (-1.0);
        float _2714 = fma(_2628, _2710, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2716 = fma(_2632, _2710, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2718 = _2712 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2720 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2722 = _2714 + _2720;
        float _2724 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2726 = _2716 + _2724;
        float _2728 = fma(_2652, _2706, _2718);
        float _2730 = _2722 * _2722;
        float _2732 = _2726 * _2726;
        _2684 = _2728;
        _2664 = _2730;
        _2674 = _2732;
        _2670 = _2714;
        _2678 = _2716;
    }
    float _2734 = _2684;
    float _2736 = _2664;
    float _2738 = _2674;
    float _2740 = _2670;
    float _2742 = _2678;
    float _2744 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2746 = _2734 + _2744;
    float _2748 = _2604 * _2648;
    float _2750 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2752 = _2604 * _2596;
    float _2754 = fma(_2746, _2746, _2736);
    float _2756 = -_2522;
    float _2758 = _2748 * _2756;
    float _2760 = -_2526;
    float _2762 = _2748 * _2760;
    float _2764 = -_2524;
    float _2766 = _2748 * _2764;
    float _2768 = _2754 + _2738;
    float _2770 = _2604 * _2636;
    float _2772 = _2604 * _2600;
    float _2774 = fma(_2750, _2584, _2752);
    float _2776 = fma(_2648, _2596, _2758);
    float _2778 = fma(_2750, _2582, _2770);
    float _2780 = sqrt(_2768);
    float _2782 = fma(_2750, _2586, _2772);
    float _2784 = fma(_2648, _2636, _2762);
    float _2786 = fma(_2648, _2600, _2766);
    float _2788 = _2522 + _2774;
    float _2790 = _2526 + _2778;
    float _2792 = _2524 + _2782;
    out.m_82.x = _2584;
    out.m_82.y = _2582;
    out.m_82.z = _2586;
    out.m_84.x = _2776;
    out.m_84.y = _2784;
    out.m_84.z = _2786;
    out.m_86.x = _2788;
    out.m_86.y = _2790;
    out.m_86.z = _2792;
    bool _2794 = _2780 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2796 = isnan(_2780);
    bool _2798 = _2794 || _2796;
    bool _2800 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2802 = _2798 || _2800;
    if (!_2802)
    {
        _2666 = 1.0;
    }
    float _2804 = _2666;
    bool _2806 = !_2802;
    float _2808 = _2804;
    if (!_2806)
    {
        bool _2810 = _2780 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2812 = isnan(_2780);
        bool _2814 = _2810 || _2812;
        bool _2816 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2818 = _2814 || _2816;
        if (!_2818)
        {
            float _2820 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2822 = _2780 + _2820;
            float _2824 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2826 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2824;
            float _2828 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2830 = _2828 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2832 = 1.0 / _2826;
            float _2834 = _2822 * _2832;
            float _2836 = fma(_2834, _2830, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2808 = _2836;
            _2838 = true;
        }
        else
        {
            bool _2840 = _2780 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2842 = isnan(_2780);
            bool _2844 = _2840 || _2842;
            bool _2846 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2848 = _2844 || _2846;
            if (!_2848)
            {
                float _2850 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2852 = _2780 + _2850;
                float _2854 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2856 = _2854 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2858 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2860 = _2858 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2862 = 1.0 / _2856;
                float _2864 = _2852 * _2862;
                float _2866 = fma(_2864, _2860, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2808 = _2866;
                _2838 = true;
            }
            else
            {
                _2808 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2838 = false;
    float _2868 = _2808;
    float _2870 = fma(_2442, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2872 = fma(_2450, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2874 = floor(_2870);
    float _2876 = floor(_2872);
    float _2878 = -_2874;
    float _2880 = _2870 + _2878;
    float _2882 = -_2876;
    float _2884 = _2872 + _2882;
    float2 _8675 = float2(_2880, _2884);
    float _2886 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8675, float2(0.0), isnan(_8675)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8675, float2(0.0), isnan(_8675)), level(0.0)).x;
    float _2888 = _2436 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2890 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2892 = _2740 + _2890;
    float _2894 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2896 = _2734 + _2894;
    float _2898 = fma(_2442, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2888);
    float _2900 = fma(_2892, _2868, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2902 = fma(_2896, _2868, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2904 = fma(_2450, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2898);
    float _2906 = _2436 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2908 = -_1966;
    float _2910 = _2908 + _2902;
    float _2912 = _2904 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2914 = fma(_2442, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2906);
    float _2916 = -_1972;
    float _2918 = _2916 + _2900;
    float _2920 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2922 = 1.0 / _2912;
    float _2924 = fma(_2450, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2914);
    float _2926 = _2910 * _2910;
    float _2928 = _2436 + _2920;
    float _2930 = _2924 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2932 = fma(_2918, _2918, _2926);
    bool _2934 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2936 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2938 = _2934 || _2936;
    bool _2940 = isnan(0.5);
    bool _2942 = _2938 || _2940;
    float _2944 = _2930 + _2912;
    float _2946 = _2944 * _2922;
    float _2948 = _2946 * 0.5;
    float _2950 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2952 = fma(_2948, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2950);
    float _2954 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2956 = _2742 + _2954;
    float _2958 = fma(_2956, _2868, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2960 = 1.0 / _2952;
    float _2962 = _2928 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2964 = -_2002;
    float _2966 = _2964 + _2958;
    float _2968 = fma(_2442, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2962);
    float _2970 = fma(_2966, _2966, _2932);
    float _2972 = fma(_2450, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2968);
    float _2974 = sqrt(_2970);
    float _2976 = _2972 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2978 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2980 = _2960 * _2978;
    float _2982 = _2928 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2984 = trunc(_2976);
    int _2986 = int(_2984);
    bool _2988 = _2980 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2990 = fma(_2442, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2982);
    bool _2992 = _2980 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _2994 = !_2988;
    int _2996 = _2994 ? 0 : 1;
    float _2998 = fma(_2450, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2990);
    float _3000 = _2998 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    int _3002 = 2;
    float _3004 = _2958;
    float _3006 = _2902;
    float _3008 = _2976;
    if (!_2988)
    {
        _3002 = 1;
    }
    int _3010 = _3002;
    float _3012 = trunc(_3000);
    int _3014 = int(_3012);
    int _3016 = _3010;
    if (!_2992)
    {
        _3016 = _2996;
    }
    int _3018 = _3016;
    bool _3020 = _2974 > 0.0;
    int _3022 = _3018 << 6;
    int _3024 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3026 = _2986 + _3024;
    int _3028 = _3026 + 1;
    int _3030 = _3022 + 48;
    uint _3032 = uint(int(uint(_3030) >> uint(2)));
    uint _3034 = uint(int(uint(int(_3032)) >> uint(2)));
    int _3036 = int(_3032) & 3;
    float _3038 = (*spvDescriptorSet0.vp_c15)._m0[int(_3034)][_3036];
    int _3040 = int(_3032) + 1;
    uint _3042 = uint(int(uint(_3040) >> uint(2)));
    int _3044 = _3040 & 3;
    float _3046 = (*spvDescriptorSet0.vp_c15)._m0[int(_3042)][_3044];
    int _3048 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _3050 = _3014 + _3048;
    int _3052 = _3050 + 1;
    int _3054 = _3022 + 56;
    uint _3056 = uint(int(uint(_3054) >> uint(2)));
    uint _3058 = uint(int(uint(int(_3056)) >> uint(2)));
    int _3060 = int(_3056) & 3;
    float _3062 = (*spvDescriptorSet0.vp_c15)._m0[int(_3058)][_3060];
    int _3064 = int(_3056) + 1;
    uint _3066 = uint(int(uint(_3064) >> uint(2)));
    int _3068 = _3064 & 3;
    float _3070 = (*spvDescriptorSet0.vp_c15)._m0[int(_3066)][_3068];
    bool _3072 = _3052 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _3074 = _3052 | _3028;
    int _3076 = _3022 + 64;
    uint _3078 = uint(int(uint(_3076) >> uint(2)));
    uint _3080 = uint(int(uint(int(_3078)) >> uint(2)));
    int _3082 = int(_3078) & 3;
    float _3084 = (*spvDescriptorSet0.vp_c15)._m0[int(_3080)][_3082];
    int _3086 = int(_3078) + 1;
    uint _3088 = uint(int(uint(_3086) >> uint(2)));
    int _3090 = _3086 & 3;
    float _3092 = (*spvDescriptorSet0.vp_c15)._m0[int(_3088)][_3090];
    bool _3094 = _3074 < 0;
    bool _3096 = _3094 || _3072;
    float _3098 = as_type<float>(_3074);
    if (!_3020)
    {
        _3098 = _2900;
    }
    float _3100 = _3098;
    bool _3102 = _3028 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3104 = _3102 || _3096;
    int _3106 = _3022 + 72;
    uint _3108 = uint(int(uint(_3106) >> uint(2)));
    uint _3110 = uint(int(uint(int(_3108)) >> uint(2)));
    int _3112 = int(_3108) & 3;
    float _3114 = (*spvDescriptorSet0.vp_c15)._m0[int(_3110)][_3112];
    int _3116 = int(_3108) + 1;
    uint _3118 = uint(int(uint(_3116) >> uint(2)));
    int _3120 = _3116 & 3;
    float _3122 = (*spvDescriptorSet0.vp_c15)._m0[int(_3118)][_3120];
    int _3124 = _3022 + 96;
    uint _3126 = uint(int(uint(_3124) >> uint(2)));
    uint _3128 = uint(int(uint(int(_3126)) >> uint(2)));
    int _3130 = int(_3126) & 3;
    float _3132 = (*spvDescriptorSet0.vp_c15)._m0[int(_3128)][_3130];
    int _3134 = int(_3126) + 1;
    uint _3136 = uint(int(uint(_3134) >> uint(2)));
    int _3138 = _3134 & 3;
    float _3140 = (*spvDescriptorSet0.vp_c15)._m0[int(_3136)][_3138];
    int _3142 = _3022 + 104;
    uint _3144 = uint(int(uint(_3142) >> uint(2)));
    uint _3146 = uint(int(uint(int(_3144)) >> uint(2)));
    int _3148 = int(_3144) & 3;
    float _3150 = (*spvDescriptorSet0.vp_c15)._m0[int(_3146)][_3148];
    int _3152 = int(_3144) + 1;
    uint _3154 = uint(int(uint(_3152) >> uint(2)));
    int _3156 = _3152 & 3;
    float _3158 = (*spvDescriptorSet0.vp_c15)._m0[int(_3154)][_3156];
    bool _3160 = !_3020;
    float _3162 = _3100;
    float _3164 = _3132;
    float _3166 = _3092;
    if (!_3160)
    {
        float _3168 = _203 * _203;
        float _3170 = fma(_201, _201, _3168);
        float _3172 = rsqrt(_2970);
        float _3174 = fma(_205, _205, _3170);
        float _3176 = sqrt(_3174);
        float _3178 = _2918 * _3172;
        float _3180 = _2910 * _3172;
        bool _3182 = _3176 > 0.0;
        float _3184 = _2966 * _3172;
        float _3186 = _3172;
        if (!_3182)
        {
            _3186 = _2900;
        }
        float _3188 = _3186;
        bool _3190 = !_3182;
        _3162 = _3188;
        if (!_3190)
        {
            float _3192 = rsqrt(_3174);
            float _3194 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3196 = _203 * _3192;
            float _3198 = _201 * _3192;
            float _3200 = _205 * _3192;
            float _3202 = _3180 * _3196;
            float _3204 = fma(_3178, _3198, _3202);
            float _3206 = _3194 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3208 = fma(_3184, _3200, _3204);
            float _3210 = _3208 * _3206;
            float _3212 = fma(_201, _3210, _2900);
            float _3214 = fma(_203, _3210, _2902);
            float _3216 = fma(_205, _3210, _2958);
            _3162 = _3212;
            _3004 = _3216;
            _3006 = _3214;
        }
    }
    float _3218 = _3162;
    float _3220 = _3004;
    float _3222 = _3006;
    float _3224 = -_2432;
    float _3226 = fma(_3224, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3218);
    float _3228 = _2928 * _3140;
    float _3230 = -_2438;
    float _3232 = fma(_3230, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3220);
    float _3234 = -_2430;
    float _3236 = fma(_3234, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3222);
    float _3238 = _3228;
    float _3240 = _3236;
    if (!_3104)
    {
        int _3242 = _3028 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3244 = _3242 + _3052;
        _219 = _3244;
    }
    int _3246 = _219;
    float _3248 = fma(_2442, _3132, _3228);
    if (_2942)
    {
        _3164 = _3226;
    }
    float _3250 = _3164;
    float _3252 = _2928 * _3046;
    float _3254 = _3250;
    if (_2942)
    {
        _3238 = _3232;
    }
    float _3256 = _3238;
    float _3258 = _3256;
    if (!_2942)
    {
        float _3260 = _2446 * _2446;
        float _3262 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3264 = -_1966;
        float _3266 = _3264 + _3222;
        float _3268 = -_2002;
        float _3270 = _3268 + _3220;
        float _3272 = fma(_2454, _2454, _3260);
        float _3274 = fma(_2460, _2460, _3272);
        float _3276 = 1.0 / _2568;
        float _3278 = sqrt(_3274);
        float _3280 = precise::min(_3278, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3282 = _3280 * _3262;
        float _3284 = _3282 * _3276;
        float _3286 = -_1972;
        float _3288 = _3286 + _3218;
        float _3290 = fma(_3266, _3284, _2436);
        float _3292 = fma(_3288, _3284, _2442);
        float _3294 = fma(_3270, _3284, _2450);
        _3240 = _3290;
        _3254 = _3292;
        _3258 = _3294;
        _2468 = _3278;
        _2470 = _3260;
    }
    float _3296 = _3240;
    float _3298 = _3254;
    float _3300 = _3258;
    float _3302 = _2468;
    float _3304 = _2470;
    float _3306 = _2928 * _3092;
    float _3308 = fma(_2442, _3038, _3252);
    float _3310 = fma(_2450, _3150, _3248);
    int _3312 = as_type<int>(_3306);
    float _3314 = _3302;
    if (!_3104)
    {
        int _3316 = _3246 << 2;
        _2126 = _3316;
    }
    int _3318 = _2126;
    float _3320 = fma(_2442, _3084, _3306);
    float _3322 = fma(_2450, _3062, _3308);
    float _3324 = _3310 + _3158;
    int _3326 = _3022 + 80;
    uint _3328 = uint(int(uint(_3326) >> uint(2)));
    uint _3330 = uint(int(uint(int(_3328)) >> uint(2)));
    int _3332 = int(_3328) & 3;
    float _3334 = (*spvDescriptorSet0.vp_c15)._m0[int(_3330)][_3332];
    int _3336 = int(_3328) + 1;
    uint _3338 = uint(int(uint(_3336) >> uint(2)));
    int _3340 = _3336 & 3;
    float _3342 = (*spvDescriptorSet0.vp_c15)._m0[int(_3338)][_3340];
    int _3344 = _3318;
    if (!_3104)
    {
        uint _3346 = uint(int(uint(_3246) >> uint(2)));
        _3312 = int(_3346);
    }
    int _3348 = _3312;
    float _3350 = fma(_2450, _3114, _3320);
    if (!_3104)
    {
        int _3352 = 12 & _3318;
        _3344 = _3352;
    }
    int _3354 = _3344;
    float _3356 = _3322 + _3070;
    float _3358 = 1.0 / _3324;
    float _3360 = _3296 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (!_3104)
    {
        int _3362 = _3348 << 4;
        int _3364 = _3362 + _3354;
        _3314 = as_type<float>(_3364);
    }
    float _3366 = _3314;
    float _3368 = _3350 + _3122;
    int _3370 = _3022 + 88;
    uint _3372 = uint(int(uint(_3370) >> uint(2)));
    uint _3374 = uint(int(uint(int(_3372)) >> uint(2)));
    int _3376 = int(_3372) & 3;
    float _3378 = (*spvDescriptorSet0.vp_c15)._m0[int(_3374)][_3376];
    int _3380 = int(_3372) + 1;
    uint _3382 = uint(int(uint(_3380) >> uint(2)));
    int _3384 = _3380 & 3;
    float _3386 = (*spvDescriptorSet0.vp_c15)._m0[int(_3382)][_3384];
    float _3388 = _3296 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3390 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3360);
    float _3392 = _3296 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3394 = _3296 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3396 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3388);
    float _3398 = fma(_3300, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3390);
    float _3400 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3392);
    float _3402 = _3366;
    if (!_3104)
    {
        int _3404 = as_type<int>(_3366) + 400;
        uint _3406 = uint(int(uint(_3404) >> uint(2)));
        uint _3408 = uint(int(uint(int(_3406)) >> uint(2)));
        int _3410 = int(_3406) & 3;
        float _3412 = (*spvDescriptorSet0.vp_c15)._m0[int(_3408)][_3410];
        _3402 = _3412;
    }
    float _3414 = _3402;
    float _3416 = fma(_3300, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3396);
    float _3418 = fma(_3300, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3400);
    float _3420 = _3356 * _3358;
    float _3422 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3394);
    float _3424 = _3368 * _3358;
    float _3426 = _3398 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3428 = _3416 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _3430 = _3420 >= 0.0;
    float _3432 = _3418 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3434 = _3426 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3436 = fma(_3300, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3422);
    bool _3438 = _3420 <= 1.0;
    bool _3440 = _3438 && _3430;
    float _3442 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3444 = fma(_3428, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3434);
    float _3446 = _3432 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _3448 = _3424 >= 0.0;
    bool _3450 = _3448 && _3440;
    float _3452 = _3436 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3454 = fma(_3432, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3444);
    float _3456 = -_3446;
    float _3458 = fma(_3456, _3442, 1.0);
    bool _3460 = _3424 <= 1.0;
    bool _3462 = _3460 && _3450;
    float _3464 = _3426 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3466 = fma(_3452, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3454);
    float _3468 = _3426 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3470 = _3464;
    float _3472 = _3420;
    float _3474 = 1.0;
    float _3476 = _3466;
    if (!_3104)
    {
        float _3478 = floor(_3000);
        _3166 = _3478;
    }
    float _3480 = _3166;
    float _3482 = fma(_3428, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3468);
    float _3484 = _2928 * _3342;
    float _3486 = fma(_3428, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3464);
    float _3488 = log2(_3458);
    if (_3462)
    {
        float _3490 = float(_3018);
        _3470 = _3490;
    }
    float _3492 = _3470;
    float _3494 = fma(_2442, _3334, _3484);
    float _3496 = fma(_3432, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3486);
    float _3498 = fma(_3432, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3482);
    float _3500 = fma(_2450, _3378, _3494);
    float _3502 = 1.0 / _3466;
    float _3504 = fma(_3452, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3496);
    float _3506 = fma(_3452, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3498);
    float _3508 = _3500 + _3386;
    float _3510 = _3508 * _3358;
    float _3512 = _3304;
    if (!_3104)
    {
        float _3514 = floor(_2976);
        _3512 = _3514;
    }
    float _3516 = _3512;
    float _3518 = _3488 * 0.693147182464599609375;
    float _3520 = _3518 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3522 = _3492;
    if (_3462)
    {
        float _3524 = rint(_3492);
        float _3526 = precise::max(_3524, 0.0);
        uint _3528 = uint(_3526);
        uint _3530 = clamp(_3528, 0u, 65535u);
        _3522 = as_type<float>(_3530);
    }
    float _3532 = _3522;
    float _3534 = _3504 * _3502;
    float _3536 = _3506 * _3502;
    float _3538 = _3502;
    float _3540 = _3536;
    if (!_3104)
    {
        float _3542 = -_3480;
        float _3544 = _3000 + _3542;
        _3538 = _3544;
    }
    float _3546 = _3538;
    float _3548 = fma(_3534, 0.5, 0.5);
    float _3550 = fma(_3536, -0.5, 0.5);
    float _3552 = _3468;
    if (!_3104)
    {
        float _3554 = rint(_3414);
        float _3556 = precise::max(_3554, 0.0);
        uint _3558 = uint(_3556);
        uint _3560 = clamp(_3558, 0u, 65535u);
        _3552 = as_type<float>(_3560);
    }
    float _3562 = _3552;
    if (!_3104)
    {
        float _3564 = -_3516;
        float _3566 = _2976 + _3564;
        _3008 = _3566;
    }
    float _3568 = _3008;
    float _3570 = _3424;
    if (_3462)
    {
        float3 _9825 = float3(_3420, _3424, float(as_type<int>(_3532)));
        float3 _9829 = select(_9825, float3(0.0), isnan(_9825));
        float _3572 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9829.xy, uint(rint(_9829.z)), _3510, level(0.0));
        _3570 = _3572;
    }
    float _3574 = _3570;
    float3 _9839 = float3(_3548, _3550, _3520);
    float _3576 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9839, float3(0.0), isnan(_9839)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9839, float3(0.0), isnan(_9839)), level(0.0)).x;
    float3 _9848 = float3(_3548, _3550, _3520);
    float4 _3579 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9848, float3(0.0), isnan(_9848)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9848, float3(0.0), isnan(_9848)), level(0.0)).xyzw;
    float _3581 = _3579.x;
    float _3583 = _3579.y;
    float _3585 = _3579.z;
    float _3587 = _3579.w;
    float _3589 = _3546;
    float _3591 = _3562;
    if (!_3104)
    {
        float3 _9872 = float3(_3546, _3568, float(as_type<int>(_3562)));
        float3 _9874 = select(_9872, float3(0.0), isnan(_9872));
        float _3593 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9874.xy, uint(rint(_9874.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9874.xy, uint(rint(_9874.z)), level(0.0)).x;
        _3589 = _3593;
    }
    float _3595 = _3589;
    if (_3104)
    {
        _3540 = 1.0;
    }
    float _3597 = _3540;
    float _3599 = _3597;
    if (!_3104)
    {
        int _3601 = _3246 << 4;
        int _3603 = _3601 + 2048;
        uint _3605 = uint(int(uint(_3603) >> uint(2)));
        uint _3607 = uint(int(uint(int(_3605)) >> uint(2)));
        int _3609 = int(_3605) & 3;
        float _3611 = (*spvDescriptorSet0.vp_c15)._m0[int(_3607)][_3609];
        int _3613 = int(_3605) + 1;
        uint _3615 = uint(int(uint(_3613) >> uint(2)));
        int _3617 = _3613 & 3;
        float _3619 = (*spvDescriptorSet0.vp_c15)._m0[int(_3615)][_3617];
        int _3621 = _3603 + 8;
        uint _3623 = uint(int(uint(_3621) >> uint(2)));
        uint _3625 = uint(int(uint(int(_3623)) >> uint(2)));
        int _3627 = int(_3623) & 3;
        float _3629 = (*spvDescriptorSet0.vp_c15)._m0[int(_3625)][_3627];
        int _3631 = int(_3623) + 1;
        uint _3633 = uint(int(uint(_3631) >> uint(2)));
        int _3635 = _3631 & 3;
        float _3637 = (*spvDescriptorSet0.vp_c15)._m0[int(_3633)][_3635];
        float _3639 = _2928 * _3619;
        float _3641 = fma(_2442, _3611, _3639);
        float _3643 = fma(_2450, _3629, _3641);
        float _3645 = _3643 + _3637;
        float _3647 = precise::clamp(_3645, 0.0, 1.0);
        float _3649 = -_3647;
        float _3651 = _3649 + _3595;
        float _3653 = fma(_3651, 500.0, 1.5);
        float _3655 = exp2(_3653);
        float _3657 = 0.0 + _3655;
        float _3659 = precise::clamp(_3657, 0.0, 1.0);
        _3472 = _3619;
        _3599 = _3659;
    }
    float _3661 = _3472;
    float _3663 = _3599;
    float _3665 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3667 = _3296 + _3665;
    float _3669 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3671 = _3298 + _3669;
    float _3673 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3675 = _3300 + _3673;
    float _3677 = _3667 * _3667;
    float _3679 = fma(_3671, _3671, _3677);
    float _3681 = fma(_3675, _3675, _3679);
    float _3683 = rsqrt(_3681);
    float _3685 = _3683 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3687 = _3671 * _3685;
    float _3689 = _3675 * _3685;
    float _3691 = _3687 * _3687;
    float _3693 = _3689 * _3689;
    float _3695 = _3691 + _3693;
    float _3697 = sqrt(_3695);
    bool _3699 = _3697 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3701 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3703 = _3697 + _3701;
    float _3705 = _3675;
    float _3707 = _3677;
    float _3709 = _3703;
    float _3711 = _3685;
    if (_3699)
    {
        float _3713 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3705 = _3713;
    }
    float _3715 = _3705;
    if (_3699)
    {
        float _3717 = rsqrt(_3695);
        _3707 = _3717;
    }
    float _3719 = _3707;
    float _3721 = _3719;
    if (_3699)
    {
        float _3723 = _3703 * _3715;
        _3709 = _3723;
    }
    float _3725 = _3709;
    if (_3699)
    {
        float _3727 = _3725 * 0.15915493667125701904296875;
        _3591 = _3727;
    }
    float _3729 = _3591;
    float _3731 = _3683;
    float _3733 = _3729;
    if (_3699)
    {
        float _3735 = _3729 * 6.283185482025146484375;
        float _3737 = sin(_3735);
        _3731 = _3737;
    }
    float _3739 = _3731;
    float _3741 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3743 = precise::max(0.0, _3741);
    float _3745 = _3661;
    float _3747 = _3743;
    float _3749 = _3741;
    if (_3699)
    {
        float _3751 = _3729 * 6.283185482025146484375;
        float _3753 = cos(_3751);
        _3745 = _3753;
    }
    float _3755 = _3745;
    float _3757 = -_3685;
    float _3759 = -_3743;
    float _3761 = fma(_3667, _3757, _3759);
    float _3763 = _3761;
    if (_3699)
    {
        float _3765 = _3761 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3747 = _3765;
    }
    float _3767 = _3747;
    float _3769 = _3739;
    float _3771 = _3767;
    if (_3699)
    {
        float _3773 = fma(_3739, _3767, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3769 = _3773;
    }
    float _3775 = _3769;
    float _3777 = _3775;
    if (!_3699)
    {
        _3771 = _3689;
    }
    float _3779 = _3771;
    float _3781 = _3779;
    float _3783 = _3755;
    if (_3699)
    {
        float _3785 = _3755 + (-1.0);
        _3749 = _3785;
    }
    float _3787 = _3749;
    if (_3699)
    {
        float _3789 = _3719 * _3775;
        _3711 = _3789;
    }
    float _3791 = _3711;
    if (!_3699)
    {
        _3777 = _3687;
    }
    float _3793 = _3777;
    float _3795 = _3793;
    if (_3699)
    {
        float _3797 = _3787 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3733 = _3797;
    }
    float _3799 = _3733;
    if (_3699)
    {
        float _3801 = _3687 * _3791;
        _3795 = _3801;
    }
    float _3803 = _3795;
    if (!_3699)
    {
        _3721 = _3691;
    }
    float _3805 = _3721;
    float _3807 = _3805;
    if (_3699)
    {
        float _3809 = _3689 * _3791;
        _3781 = _3809;
    }
    float _3811 = _3781;
    if (_3699)
    {
        float _3813 = fma(_3761, _3755, _3799);
        _3763 = _3813;
    }
    float _3815 = _3763;
    if (_3699)
    {
        float _3817 = _3803 * _3803;
        _3807 = _3817;
    }
    float _3819 = _3807;
    if (!_3699)
    {
        _3783 = _3693;
    }
    float _3821 = _3783;
    float _3823 = _3821;
    if (_3699)
    {
        float _3825 = _3811 * _3811;
        _3823 = _3825;
    }
    float _3827 = _3823;
    float _3829 = sqrt(_3681);
    float _3831 = fma(_3815, _3815, _3819);
    float _3833 = _3831 + _3827;
    float _3835 = rsqrt(_3833);
    float _3837 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3839 = fma(_3829, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3837);
    float _3841 = precise::clamp(_3839, 0.0, 1.0);
    float _3843 = -_3841;
    float _3845 = _3843 + 1.0;
    float _3847 = _3835 * _3815;
    float _3849 = _3835 * _3803;
    float _3851 = abs(_3845);
    float _3853 = log2(_3851);
    float _3855 = _3835 * _3811;
    float _3857 = _3849 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3859 = -_3857;
    float _3861 = fma(_3847, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3859);
    float _3863 = -_3855;
    float _3865 = fma(_3863, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3861);
    float _3867 = fma(_3865, -0.5, 0.5);
    float _3869 = _3853 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3871 = fma(_3865, 0.5, 0.5);
    float _3873 = sqrt(_3867);
    float _3875 = fma(_3871, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3877 = fma(_3871, _3875, -0.212114393711090087890625);
    float _3879 = _3847 + 1.0;
    float _3881 = exp2(_3869);
    float _3883 = fma(_3871, _3877, 1.570728778839111328125);
    float _3885 = _3873 * 0.636619746685028076171875;
    float _3887 = -_3883;
    float _3889 = fma(_3885, _3887, 1.0);
    float _3891 = -_3847;
    float _3893 = fma(_3881, _3879, _3891);
    float _3895 = fma(_3893, 0.5, 0.5);
    float2 _10341 = float2(_3889, _3895);
    float3 _3899 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10341, float2(0.0), isnan(_10341)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10341, float2(0.0), isnan(_10341)), level(0.0)).xyz;
    float _3901 = _3899.x;
    float _3903 = _3899.y;
    float _3905 = _3899.z;
    float _3907 = abs(_2980);
    float _3909 = log2(_3907);
    float _3911 = -_2886;
    float _3913 = _3911 + 1.0;
    out.m_88.x = _3298;
    out.m_88.y = _3296;
    out.m_88.z = _3300;
    bool _3915 = _3829 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3917 = isnan(_3829);
    bool _3919 = _3915 || _3917;
    bool _3921 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3923 = _3919 || _3921;
    bool _3925 = _2980 <= 8000.0;
    bool _3927 = isnan(_2980);
    bool _3929 = _3925 || _3927;
    bool _3931 = isnan(8000.0);
    bool _3933 = _3929 || _3931;
    float _3935 = float(_3933);
    float _3937 = _3909 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3939 = _3426 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3941 = fma(_3428, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3939);
    float _3943 = exp2(_3937);
    float _3945 = fma(_3432, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3941);
    float _3947 = fma(_3943, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3949 = precise::clamp(_3947, 0.0, 1.0);
    float _3951 = _3853 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3953 = fma(_3949, -2.0, 3.0);
    float _3955 = _3949 * _3949;
    float _3957 = exp2(_3951);
    float _3959 = _3955 * _3953;
    float _3961 = fma(_3452, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3945);
    float _3963 = -_3959;
    float _3965 = _3963 + 1.0;
    float _3967 = _3961 + _3466;
    out.gl_Position.x = _3504;
    out.gl_Position.y = _3506;
    out.gl_Position.z = _3961;
    out.gl_Position.w = _3466;
    float _3969 = fma(_3965, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3959);
    float _3971 = _3967 * 0.5;
    float _3973 = _3935 * _3969;
    float _3975 = _3935;
    float _3977 = _3961;
    if (!_3462)
    {
        _3975 = 1.0;
    }
    float _3979 = _3975;
    float _3981 = -_3957;
    float _3983 = _3981 + 1.0;
    float _3985 = _3979;
    if (_3462)
    {
        bool _3987 = _3574 >= _3510;
        bool _3989 = isnan(_3574);
        bool _3991 = _3987 || _3989;
        bool _3993 = isnan(_3510);
        bool _3995 = _3991 || _3993;
        float _3997 = float(_3995);
        _3985 = _3997;
    }
    float _3999 = _3985;
    float _4001 = _3973 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_90.z = _3971;
    out.m_90.w = _3466;
    float _4003 = _3983 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4005 = _3913 * _4001;
    float _4007 = precise::clamp(_4005, 0.0, 1.0);
    float _4009 = _3999 * _3663;
    float _4011 = _4003 * _3576;
    float _4013 = -_4003;
    float _4015 = _4013 + 1.0;
    float _4017 = -_4007;
    float _4019 = fma(_4017, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4021 = _4015;
    float _4023 = _4003;
    if (!_3923)
    {
        _3474 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4025 = _3474;
    float _4027 = _3587 * _4011;
    float _4029 = _3587 * _4015;
    float _4031 = -_4009;
    float _4033 = fma(_4031, _4019, 1.0);
    float _4035 = precise::clamp(_4033, 0.0, 1.0);
    float _4037 = _4027;
    float _4039 = _4025;
    float _4041 = _4025;
    if (!_3923)
    {
        _3476 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4043 = _3476;
    float _4045 = _4043;
    float _4047 = _4043;
    if (!_3923)
    {
        _3977 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4049 = _3977;
    float _4051 = _4035 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4053 = _4049;
    float _4055 = _4049;
    if (!_3923)
    {
        _4021 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4057 = _4021;
    float _4059 = _4057;
    float _4061 = _4057;
    if (!_3923)
    {
        _4023 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4063 = _4023;
    out.m_92.x = _4051;
    float _4065 = _3905 * _4011;
    float _4067 = fma(_3901, _4027, _3581);
    float _4069 = fma(_3903, _4027, _3583);
    float _4071 = _4063;
    float _4073 = _4063;
    if (!_3923)
    {
        _4037 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4075 = _4037;
    float _4077 = fma(_3587, _4065, _3585);
    out.m_94.x = _4067;
    out.m_94.y = _4069;
    out.m_94.z = _4077;
    out.m_94.w = _4029;
    bool _4079 = !_3923;
    float _4081 = _4075;
    float _4083 = _4075;
    if (!_4079)
    {
        bool _4085 = _3829 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4087 = isnan(_3829);
        bool _4089 = _4085 || _4087;
        bool _4091 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4093 = _4089 || _4091;
        if (!_4093)
        {
            float _4095 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4097 = _3829 + _4095;
            float _4099 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4101 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4099;
            float _4103 = 1.0 / _4101;
            float _4105 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4107 = _4105 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4109 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4111 = _4109 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4113 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4115 = _4113 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4117 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4119 = _4117 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4121 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4123 = _4121 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4125 = _4097 * _4103;
            float _4127 = precise::clamp(_4125, 0.0, 1.0);
            float _4129 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4131 = _4129 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4133 = fma(_4127, _4107, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4135 = fma(_4127, _4131, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4137 = fma(_4127, _4111, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4139 = fma(_4127, _4115, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4141 = fma(_4127, _4119, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4143 = fma(_4127, _4123, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4047 = _4135;
            _4061 = _4141;
            _4041 = _4133;
            _4083 = _4139;
            _4055 = _4137;
            _4073 = _4143;
            _4145 = true;
        }
        else
        {
            bool _4147 = _3829 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4149 = isnan(_3829);
            bool _4151 = _4147 || _4149;
            bool _4153 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4155 = _4151 || _4153;
            if (!_4155)
            {
                _4039 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4157 = _4039;
            _4041 = _4157;
            if (!_4155)
            {
                _4045 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4159 = _4045;
            _4047 = _4159;
            if (!_4155)
            {
                _4053 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4161 = _4053;
            _4055 = _4161;
            if (!_4155)
            {
                _4081 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4163 = _4081;
            _4083 = _4163;
            if (!_4155)
            {
                _4059 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4165 = _4059;
            _4061 = _4165;
            if (!_4155)
            {
                _4071 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4167 = _4071;
            bool _4169 = !_4155;
            _4073 = _4167;
            if (!_4169)
            {
                bool _4171 = _3829 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4173 = isnan(_3829);
                bool _4175 = _4171 || _4173;
                bool _4177 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4179 = _4175 || _4177;
                if (!_4179)
                {
                    float _4181 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4183 = _3829 + _4181;
                    float _4185 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4187 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4185;
                    float _4189 = 1.0 / _4187;
                    float _4191 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4193 = _4191 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4195 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4197 = _4195 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4199 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4201 = _4199 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4203 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4205 = _4203 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4207 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4209 = _4207 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4211 = _4183 * _4189;
                    float _4213 = precise::clamp(_4211, 0.0, 1.0);
                    float _4215 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4217 = _4215 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4219 = fma(_4213, _4193, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4221 = fma(_4213, _4217, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4223 = fma(_4213, _4197, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4225 = fma(_4213, _4201, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4227 = fma(_4213, _4205, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4229 = fma(_4213, _4209, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4047 = _4221;
                    _4061 = _4227;
                    _4041 = _4219;
                    _4083 = _4225;
                    _4055 = _4223;
                    _4073 = _4229;
                    _4145 = true;
                }
                else
                {
                    _4047 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4061 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4041 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4083 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4055 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4073 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4145 = false;
    float _4231 = _4047;
    float _4233 = _4061;
    float _4235 = _4041;
    float _4237 = _4083;
    float _4239 = _4055;
    float _4241 = _4073;
    float _4243 = fma(_2790, -0.5, 0.5);
    float _4245 = precise::clamp(_4243, 0.0, 1.0);
    float _4247 = -_4231;
    float _4249 = _4247 + _4233;
    float _4251 = -_4235;
    float _4253 = _4251 + _4237;
    float _4255 = -_4239;
    float _4257 = _4255 + _4241;
    bool _4259 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4261 = fma(_4245, _4249, _4231);
    float _4263 = fma(_4245, _4253, _4235);
    float _4265 = fma(_4245, _4257, _4239);
    float _4267 = _4261 * 0.586610972881317138671875;
    out.m_96.x = 0.0;
    float _4269 = fma(_4263, 0.298911988735198974609375, _4267);
    float _4271 = fma(_4265, 0.114477999508380889892578125, _4269);
    float _4273 = -_4271;
    float _4275 = _4263 + _4273;
    float _4277 = -_4271;
    float _4279 = _4261 + _4277;
    float _4281 = -_4271;
    float _4283 = _4265 + _4281;
    float _4285 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4287 = fma(_4275, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4271);
    float _4289 = fma(_4279, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4271);
    float _4291 = fma(_4283, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4271);
    out.m_61.x = _4285;
    out.m_98.x = _4287;
    out.m_98.y = _4289;
    out.m_98.z = _4291;
    if (!_4259)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4293 = -_3296;
    float _4295 = _4293 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4297 = -_3298;
    float _4299 = _4297 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4301 = -_3300;
    float _4303 = _4301 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4305 = _4295 * _4295;
    float _4307 = fma(_4299, _4299, _4305);
    float _4309 = fma(_4303, _4303, _4307);
    float _4311 = sqrt(_4309);
    float _4313 = rsqrt(_4309);
    float _4315 = -_4311;
    float _4317 = _4315 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4319 = _4317 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4321 = precise::clamp(_4319, 0.0, 1.0);
    float _4323 = _4299 * _4313;
    float _4325 = _4295 * _4313;
    float _4327 = abs(_4321);
    float _4329 = log2(_4327);
    float _4331 = _4303 * _4313;
    float _4333 = _4323 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4335 = _2790 * _4325;
    float _4337 = -_4325;
    float _4339 = -_4333;
    float _4341 = fma(_4337, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4339);
    float _4343 = fma(_2788, _4323, _4335);
    float _4345 = -_4331;
    float _4347 = fma(_4345, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4341);
    float _4349 = fma(_2792, _4331, _4343);
    float _4351 = precise::clamp(_4349, 0.0, 1.0);
    float _4353 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4355 = _4347 + _4353;
    float _4357 = _4329 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4359 = _4355 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4361 = precise::clamp(_4359, 0.0, 1.0);
    float _4363 = exp2(_4357);
    float _4365 = _4363 * _4361;
    float _4367 = _4351 * _4365;
    float _4369 = _4367 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4371 = _4367 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4373 = _4367 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_96.x = _4369;
    out.m_96.y = _4371;
    out.m_96.z = _4373;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

