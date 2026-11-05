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
    float4 m_78 [[user(locn0)]];
    float4 m_92 [[user(locn1)]];
    float4 m_88 [[user(locn2)]];
    float4 m_84 [[user(locn3)]];
    float4 m_106 [[user(locn4)]];
    float4 m_102 [[user(locn5)]];
    float4 m_104 [[user(locn6)]];
    float4 m_82 [[user(locn7)]];
    float4 m_90 [[user(locn8)]];
    float4 m_86 [[user(locn9)]];
    float4 m_96 [[user(locn10)]];
    float4 m_98 [[user(locn11)]];
    float4 m_59 [[user(locn12)]];
    float4 m_80 [[user(locn13)]];
    float4 m_94 [[user(locn14)]];
    float4 m_100 [[user(locn15)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_68 [[attribute(1)]];
    float4 m_70 [[attribute(2)]];
    float4 m_72 [[attribute(3)]];
    float4 m_66 [[attribute(5)]];
    float4 m_56 [[attribute(6)]];
    float4 m_61 [[attribute(7)]];
    float4 m_74 [[attribute(8)]];
    float4 m_76 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4219 = false;
    bool _973 = false;
    bool _805 = false;
    bool _587 = false;
    bool _419 = false;
    bool _263 = false;
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
        float _4524 = as_type<float>(_141);
        out.gl_Position.z = _4524;
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
    float _161 = 0.0;
    if (_155)
    {
        float _163 = float(_125);
        _161 = _163;
    }
    float _165 = _161;
    bool _167 = _159 >= _165;
    bool _169 = !_155;
    bool _171 = _167 || _169;
    if (_171)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _173 = _135;
    if (_171)
    {
        out.m_59.x = 0.0;
    }
    if (_171)
    {
        float _175 = _173 * 5.0;
        _143 = as_type<int>(_175);
    }
    int _177 = _143;
    if (_171)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4592 = as_type<float>(_177);
        out.gl_Position.z = _4592;
    }
    if (_171)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _179 = as_type<float>(int(gl_VertexIndex));
    float _181 = in.m_66.x;
    float _183 = in.m_66.y;
    float _185 = in.m_66.z;
    float _187 = in.m_68.x;
    float _189 = in.m_68.y;
    float _191 = in.m_68.z;
    float _193 = in.m_70.x;
    float _195 = in.m_70.y;
    float _197 = in.m_70.z;
    float _199 = in.m_72.x;
    float _201 = in.m_72.y;
    float _203 = in.m_72.z;
    int _205 = as_type<int>(_179) & 1;
    bool _207 = _205 != 0;
    int _209 = as_type<int>(_179) & 2;
    bool _211 = _209 != 0;
    bool _213 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _215 = !_207;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = !_211;
    float _221 = _219 ? (-0.5) : 0.5;
    float _223 = _183 * _189;
    float _225 = _183 * _195;
    float _227 = fma(_181, _187, _223);
    float _229 = _183 * _201;
    float _231 = fma(_181, _193, _225);
    float _233 = fma(_185, _191, _227);
    float _235 = fma(_181, _199, _229);
    float _237 = fma(_185, _197, _231);
    float _239 = fma(_185, _203, _235);
    bool _241 = !_213;
    float _243 = _239;
    float _261;
    if (!_241)
    {
        float _245 = in.m_74.x;
        float _247 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _249 = _245 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _251 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[12].x, _159);
        float _253 = _251 * _247;
        float _255 = floor(_253);
        float _257 = -_255;
        float _259 = _253 + _257;
        _261 = _259;
        _263 = true;
    }
    else
    {
        float _265 = float(_125);
        float _267 = 1.0 / _265;
        float _269 = _159 * _267;
        _261 = _269;
    }
    _263 = false;
    float _271 = _261;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = _271 + _273;
    bool _277 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _279 = isnan(_271);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _291 = _271 + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _299 = _297 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _301 = -_287;
    float _303 = _301 + 1.0;
    float _305 = in.m_76.x;
    float _307 = in.m_76.y;
    float _309 = 1.0 / _299;
    bool _311 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _313 = isnan(_271);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    bool _323 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _325 = 1.0 / _295;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _331 = _291 * _309;
    float _333 = fma(_329, _331, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _335 = _275 * _325;
    bool _337 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _339 = isnan(_271);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _345 = _341 || _343;
    float _347 = float(_345);
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _353;
    float _357 = _347 * _303;
    float _359 = -_347;
    float _361 = _359 + 1.0;
    float _363 = fma(_351, _335, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _365 = fma(_355, _335, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _367 = _321 * _361;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _371 = _369 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _373 = -_321;
    float _375 = _373 + 1.0;
    float _377 = _363 * _367;
    float _379 = _365 * _367;
    float _381 = fma(_371, _331, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _383 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[143].x, _377);
    float _385 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[143].y, _379);
    float _387 = fma(_381, _357, _383);
    float _389 = fma(_333, _357, _385);
    float _391 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[145].x, _387);
    float _393 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[145].y, _389);
    float _395 = _391 * _305;
    float _397 = _393 * _307;
    bool _399 = !_323;
    float _417;
    if (!_399)
    {
        float _401 = in.m_74.x;
        float _403 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _405 = _401 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _407 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[11].x, _159);
        float _409 = _407 * _403;
        float _411 = floor(_409);
        float _413 = -_411;
        float _415 = _409 + _413;
        _417 = _415;
        _419 = true;
    }
    else
    {
        float _421 = float(_125);
        float _423 = 1.0 / _421;
        float _425 = _159 * _423;
        _417 = _425;
    }
    _419 = false;
    float _427 = _417;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _431 = _427 + _429;
    bool _433 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _435 = isnan(_427);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _441 = _437 || _439;
    float _443 = float(_441);
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _447 = _427 + _445;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _449;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _457 = -_443;
    float _459 = _457 + 1.0;
    float _461 = 1.0 / _451;
    bool _463 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _465 = 1.0 / _455;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _467;
    float _471 = _431 * _461;
    bool _473 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _475 = isnan(_427);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _485;
    bool _489 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _491 = isnan(_427);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = fma(_469, _471, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _503 = fma(_487, _471, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _505 = _499 * _459;
    float _507 = -_499;
    float _509 = _507 + 1.0;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _511;
    float _515 = _447 * _465;
    float _517 = _483 * _509;
    float _519 = fma(_513, _471, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _521 = -_483;
    float _523 = _521 + 1.0;
    float _525 = _501 * _517;
    float _527 = _519 * _517;
    float _529 = _503 * _517;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _543 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[107].x, _527);
    float _545 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[107].y, _525);
    float _547 = fma(_533, _515, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _549 = fma(_537, _515, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _551 = fma(_541, _515, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _553 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[107].z, _529);
    float _555 = fma(_547, _505, _543);
    float _557 = fma(_549, _505, _545);
    float _559 = fma(_551, _505, _553);
    float _561 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[109].x, _555);
    float _563 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[109].y, _557);
    float _565 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[109].z, _559);
    bool _567 = !_463;
    float _585;
    if (!_567)
    {
        float _569 = in.m_74.x;
        float _571 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _573 = _569 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _575 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[11].y, _159);
        float _577 = _575 * _571;
        float _579 = floor(_577);
        float _581 = -_579;
        float _583 = _577 + _581;
        _585 = _583;
        _587 = true;
    }
    else
    {
        float _589 = float(_125);
        float _591 = 1.0 / _589;
        float _593 = _159 * _591;
        _585 = _593;
    }
    _587 = false;
    float _595 = _585;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _603 = _601 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _605 = 1.0 / _599;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _609 = _607 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _611;
    bool _615 = _595 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _617 = isnan(_595);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _631 = _595 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _633 = isnan(_595);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _639 = _635 || _637;
    float _641 = float(_639);
    float _643 = 1.0 / _603;
    bool _645 = _595 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _647 = isnan(_595);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = -_641;
    float _659 = _657 + 1.0;
    bool _661 = _595 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _663 = isnan(_595);
    bool _665 = _661 || _663;
    bool _667 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _669 = _665 || _667;
    float _671 = float(_669);
    bool _673 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _675 = _625 * _659;
    float _677 = 1.0 / _609;
    float _679 = _613 * _605;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _683 = _595 + _681;
    float _685 = fma(_679, _683, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _687 = -_625;
    float _689 = _687 + 1.0;
    float _691 = 1.0 / _629;
    float _693 = -_655;
    float _695 = _693 + 1.0;
    float _697 = _655 * _689;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _699;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _705 = _703 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _707 = _671 * _695;
    float _709 = -_671;
    float _711 = _709 + 1.0;
    float _713 = _701 * _643;
    float _715 = _705 * _677;
    float _717 = _685 * _707;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _721 = _595 + _719;
    bool _723 = _595 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _725 = isnan(_595);
    bool _727 = _723 || _725;
    bool _729 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _731 = _727 || _729;
    float _733 = float(_731);
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _737 = _735 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _741 = _595 + _739;
    float _743 = fma(_715, _721, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _745 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[115].x, _717);
    float _747 = _737 * _691;
    float _749 = fma(_713, _741, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _751 = -_733;
    float _753 = _751 + 1.0;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _757 = _595 + _755;
    float _759 = fma(_743, _697, _745);
    float _761 = _561 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _763 = _641 * _753;
    float _765 = fma(_747, _757, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _767 = fma(_749, _675, _759);
    float _769 = _565 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _771 = _761 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _773 = fma(_765, _763, _767);
    float _775 = _563 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _777 = _769 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _779 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[119].x, _773);
    float _781 = _775 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _783 = _779 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_78.x = _771;
    out.m_78.y = _781;
    out.m_78.z = _777;
    out.m_78.w = _783;
    bool _785 = !_673;
    float _803;
    if (!_785)
    {
        float _787 = in.m_74.x;
        float _789 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _791 = _787 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _793 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[11].z, _159);
        float _795 = _793 * _789;
        float _797 = floor(_795);
        float _799 = -_797;
        float _801 = _795 + _799;
        _803 = _801;
        _805 = true;
    }
    else
    {
        float _807 = float(_125);
        float _809 = 1.0 / _807;
        float _811 = _159 * _809;
        _803 = _811;
    }
    _805 = false;
    float _813 = _803;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _817 = _813 + _815;
    bool _819 = _813 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _821 = isnan(_813);
    bool _823 = _819 || _821;
    bool _825 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _827 = _823 || _825;
    float _829 = float(_827);
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _833 = _813 + _831;
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _835;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _841 = _839 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _843 = -_829;
    float _845 = _843 + 1.0;
    float _847 = 1.0 / _837;
    bool _849 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _851 = 1.0 / _841;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _853;
    float _857 = _817 * _847;
    bool _859 = _813 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _861 = isnan(_813);
    bool _863 = _859 || _861;
    bool _865 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _867 = _863 || _865;
    float _869 = float(_867);
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _871;
    bool _875 = _813 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _877 = isnan(_813);
    bool _879 = _875 || _877;
    bool _881 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _883 = _879 || _881;
    float _885 = float(_883);
    float _887 = fma(_855, _857, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _889 = fma(_873, _857, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _891 = _885 * _845;
    float _893 = -_885;
    float _895 = _893 + 1.0;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _897;
    float _901 = _833 * _851;
    float _903 = _869 * _895;
    float _905 = fma(_899, _857, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _907 = -_869;
    float _909 = _907 + 1.0;
    float _911 = _887 * _903;
    float _913 = _905 * _903;
    float _915 = _889 * _903;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _919 = _917 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _923 = _921 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _927 = _925 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _929 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[123].x, _913);
    float _931 = fma(_919, _901, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _933 = fma(_923, _901, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _935 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[123].y, _911);
    float _937 = fma(_927, _901, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _939 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[123].z, _915);
    float _941 = fma(_931, _891, _929);
    float _943 = fma(_933, _891, _935);
    float _945 = fma(_937, _891, _939);
    float _947 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[125].x, _941);
    float _949 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[125].y, _943);
    float _951 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[125].z, _945);
    bool _953 = !_849;
    float _971;
    if (!_953)
    {
        float _955 = in.m_74.x;
        float _957 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _959 = _955 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _961 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[11].w, _159);
        float _963 = _961 * _957;
        float _965 = floor(_963);
        float _967 = -_965;
        float _969 = _963 + _967;
        _971 = _969;
        _973 = true;
    }
    else
    {
        float _975 = float(_125);
        float _977 = 1.0 / _975;
        float _979 = _159 * _977;
        _971 = _979;
    }
    _973 = false;
    float _981 = _971;
    float _983 = in.m_56.x;
    float _985 = in.m_56.y;
    float _987 = in.m_56.z;
    float _989 = _395 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _991 = in.m_70.w;
    float _993 = _989 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _995 = in.m_68.w;
    float _997 = in.m_72.w;
    float _999 = _195 * _985;
    float _1001 = _189 * _985;
    float _1003 = _201 * _985;
    float _1005 = fma(_193, _983, _999);
    float _1007 = fma(_187, _983, _1001);
    float _1009 = fma(_199, _983, _1003);
    float _1011 = fma(_197, _987, _1005);
    float _1013 = fma(_191, _987, _1007);
    float _1015 = fma(_203, _987, _1009);
    float _1017 = _1011 + _991;
    float _1019 = _1013 + _995;
    float _1021 = _1015 + _997;
    float _1023 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1025 = _1017 + _1023;
    float _1027 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1029 = _1019 + _1027;
    float _1031 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1033 = _1021 + _1031;
    float _1035 = _1025 * _1025;
    float _1037 = fma(_1029, _1029, _1035);
    float _1039 = fma(_1033, _1033, _1037);
    float _1041 = sqrt(_1039);
    float _1043 = rsqrt(_1039);
    float _1045 = _1041 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1047 = precise::min(_993, _1045);
    float _1049 = _1043 * _1047;
    float _1051 = _1029 * _1049;
    float _1053 = _1033 * _1049;
    float _1055 = -_1051;
    float _1057 = _1019 + _1055;
    float _1059 = -_1053;
    float _1061 = _1021 + _1059;
    float _1063 = fma(_1057, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1065 = fma(_1061, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1067 = floor(_1063);
    float _1069 = floor(_1065);
    float _1071 = -_1067;
    float _1073 = _1063 + _1071;
    float _1075 = -_1069;
    float _1077 = _1065 + _1075;
    float2 _6020 = float2(_1073, _1077);
    float _1079 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6020, float2(0.0), isnan(_6020)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6020, float2(0.0), isnan(_6020)), level(0.0)).x;
    float _1081 = -_1017;
    float _1083 = _1081 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1085 = -_1019;
    float _1087 = _1085 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1089 = _1083 * _1083;
    float _1091 = _1025 * _1049;
    float _1093 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1095 = -_1021;
    float _1097 = _1095 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1099 = fma(_1087, _1087, _1089);
    float _1101 = -_1091;
    float _1103 = _1025 + _1101;
    float _1105 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1093);
    float _1107 = fma(_1097, _1097, _1099);
    float _1109 = _1103 * _1103;
    float _1111 = -_1091;
    float _1113 = _1017 + _1111;
    float _1115 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1105);
    float _1117 = rsqrt(_1107);
    float _1119 = _1113 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1121 = -_1051;
    float _1123 = _1029 + _1121;
    float _1125 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1127 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1119);
    float _1129 = -_1053;
    float _1131 = _1033 + _1129;
    float _1133 = fma(_1123, _1123, _1109);
    float _1135 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1125);
    float _1137 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1127);
    float _1139 = rsqrt(_1115);
    float _1141 = fma(_1131, _1131, _1133);
    float _1143 = _397 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1145 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1135);
    float _1147 = _1137 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1149 = _1113 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1151 = _1087 * _1117;
    float _1153 = _1097 * _1117;
    float _1155 = 1.0 / _1147;
    float _1157 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1149);
    float _1159 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1161 = _1151 * _1159;
    float _1163 = _1083 * _1117;
    float _1165 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1167 = _1153 * _1165;
    float _1169 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1157);
    float _1171 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1173 = -_1161;
    float _1175 = fma(_1153, _1171, _1173);
    float _1177 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1179 = _1163 * _1177;
    float _1181 = sqrt(_1141);
    float _1183 = _1169 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1185 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1187 = -_1167;
    float _1189 = fma(_1163, _1185, _1187);
    float _1191 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1193 = -_1179;
    float _1195 = fma(_1151, _1191, _1193);
    float _1197 = _1183 + _1147;
    float _1199 = _221 * _1139;
    float _1201 = rsqrt(_1145);
    float _1203 = _1175 * _1175;
    float _1205 = _1197 * _1155;
    float _1207 = _1205 * 0.5;
    float _1209 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1211 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1199);
    float _1213 = fma(_1189, _1189, _1203);
    float _1215 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1217 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1215);
    float _1219 = _1113 + _1209;
    float _1221 = _1043 * _1181;
    float _1223 = fma(_1195, _1195, _1213);
    float _1225 = _1219 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1227 = 1.0 / _1217;
    float _1229 = _1219 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1231 = _1143 * _1221;
    float _1233 = fma(_1057, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1225);
    float _1235 = _217 * _1201;
    float _1237 = fma(_1057, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1229);
    float _1239 = _1231 * _1211;
    float _1241 = fma(_1061, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1233);
    float _1243 = rsqrt(_1223);
    float _1245 = fma(_1061, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1237);
    float _1247 = _989 * _1221;
    float _1249 = _1241 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1251 = _1221 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1253 = _1251 * 0.5;
    float _1255 = _1245 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1257 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1259 = _1227 * _1257;
    float _1261 = trunc(_1249);
    int _1263 = int(_1261);
    bool _1265 = _1259 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1267 = _1259 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1269 = _1189 * _1243;
    float _1271 = _1175 * _1243;
    float _1273 = _1195 * _1243;
    float _1275 = trunc(_1255);
    int _1277 = int(_1275);
    float _1279 = _1163 * _1269;
    float _1281 = _1153 * _1271;
    float _1283 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1235);
    bool _1285 = !_1265;
    int _1287 = _1285 ? 0 : 1;
    float _1289 = -_1279;
    float _1291 = fma(_1151, _1271, _1289);
    float _1293 = -_1281;
    float _1295 = fma(_1163, _1273, _1293);
    float _1297 = _1247 * _1283;
    int _1299 = 2;
    float _1301 = _1219;
    if (!_1265)
    {
        _1299 = 1;
    }
    int _1303 = _1299;
    float _1305 = _1239 * _1291;
    float _1307 = _1239 * _1295;
    int _1309 = _1303;
    if (!_1267)
    {
        _1309 = _1287;
    }
    int _1311 = _1309;
    float _1313 = fma(_1297, _1273, _1305);
    float _1315 = fma(_1297, _1269, _1307);
    int _1317 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1319 = _1263 + _1317;
    int _1321 = _1319 + 1;
    float _1323 = fma(_1253, _1153, _1313);
    int _1325 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1327 = _1277 + _1325;
    int _1329 = _1327 + 1;
    float _1331 = fma(_1253, _1151, _1315);
    int _1333 = _1311 << 6;
    float _1335 = _1021 + _1323;
    bool _1337 = _1321 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1339 = _1019 + _1331;
    int _1341 = _1321 | _1329;
    float _1343 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1345 = _1335 + _1343;
    int _1347 = _1333 + 48;
    uint _1350 = uint(int(uint(_1347) >> uint(2)));
    uint _1352 = uint(int(uint(int(_1350)) >> uint(2)));
    int _1354 = int(_1350) & 3;
    float _1356 = (*spvDescriptorSet0.vp_c15)._m0[int(_1352)][_1354];
    int _1358 = int(_1350) + 1;
    uint _1360 = uint(int(uint(_1358) >> uint(2)));
    int _1362 = _1358 & 3;
    float _1364 = (*spvDescriptorSet0.vp_c15)._m0[int(_1360)][_1362];
    bool _1366 = _1341 < 0;
    bool _1368 = _1366 || _1337;
    float _1370 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1372 = _1339 + _1370;
    float _1374 = _1345 * _1345;
    bool _1376 = _1329 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1378 = _1376 || _1368;
    int _1380 = _1333 + 56;
    uint _1382 = uint(int(uint(_1380) >> uint(2)));
    uint _1384 = uint(int(uint(int(_1382)) >> uint(2)));
    int _1386 = int(_1382) & 3;
    float _1388 = (*spvDescriptorSet0.vp_c15)._m0[int(_1384)][_1386];
    int _1390 = int(_1382) + 1;
    uint _1392 = uint(int(uint(_1390) >> uint(2)));
    int _1394 = _1390 & 3;
    float _1396 = (*spvDescriptorSet0.vp_c15)._m0[int(_1392)][_1394];
    float _1398 = fma(_1372, _1372, _1374);
    float _1400 = _1151 * _1273;
    int _1402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1404 = _1402 != 0;
    int _1406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1408 = _1406 != 0;
    int _1410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1412 = _1410 != 0;
    float _1414 = sqrt(_1398);
    float _1416 = -_1400;
    float _1418 = fma(_1153, _1269, _1416);
    int _1420 = int(_1368);
    int _1422 = _1265 ? 2 : 0;
    int _1424 = _1420 | _1422;
    int _1426 = _1378 ? 4 : 0;
    int _1428 = _1424 | _1426;
    int _1430 = false ? 8 : 0;
    int _1432 = _1428 | _1430;
    int _1434 = _1404 ? 16 : 0;
    int _1436 = _1432 | _1434;
    int _1438 = _1408 ? 32 : 0;
    int _1440 = _1436 | _1438;
    int _1442 = _1412 ? 64 : 0;
    int _1444 = _1440 | _1442;
    int _1446 = _1444 & 4;
    int _1448 = _1333 + 64;
    uint _1450 = uint(int(uint(_1448) >> uint(2)));
    uint _1452 = uint(int(uint(int(_1450)) >> uint(2)));
    int _1454 = int(_1450) & 3;
    float _1456 = (*spvDescriptorSet0.vp_c15)._m0[int(_1452)][_1454];
    int _1458 = int(_1450) + 1;
    uint _1460 = uint(int(uint(_1458) >> uint(2)));
    int _1462 = _1458 & 3;
    float _1464 = (*spvDescriptorSet0.vp_c15)._m0[int(_1460)][_1462];
    float _1466 = _1239 * _1418;
    int _1468 = _1321;
    int _1470 = _1329;
    int _1472 = _1446;
    float _1474 = _1339;
    float _1476 = _1335;
    float _1478 = as_type<float>(_1311);
    float _1480 = as_type<float>(_1333);
    if (!_1378)
    {
        int _1482 = _1329 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1484 = _1482 + _1321;
        _1468 = _1484;
    }
    int _1486 = _1468;
    float _1488 = fma(_1297, _1271, _1466);
    bool _1490 = !_1408;
    int _1492 = _1490 ? 0 : 1;
    int _1494 = _1333 + 72;
    uint _1496 = uint(int(uint(_1494) >> uint(2)));
    uint _1498 = uint(int(uint(int(_1496)) >> uint(2)));
    int _1500 = int(_1496) & 3;
    float _1502 = (*spvDescriptorSet0.vp_c15)._m0[int(_1498)][_1500];
    int _1504 = int(_1496) + 1;
    uint _1506 = uint(int(uint(_1504) >> uint(2)));
    int _1508 = _1504 & 3;
    float _1510 = (*spvDescriptorSet0.vp_c15)._m0[int(_1506)][_1508];
    bool _1512 = _1446 != 0;
    float _1514 = fma(_1253, _1163, _1488);
    bool _1516 = !_1404;
    int _1518 = _1516 ? 0 : 1;
    bool _1520 = _1414 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1522 = _1017 + _1514;
    int _1524 = _1333 + 96;
    uint _1526 = uint(int(uint(_1524) >> uint(2)));
    uint _1528 = uint(int(uint(int(_1526)) >> uint(2)));
    int _1530 = int(_1526) & 3;
    float _1532 = (*spvDescriptorSet0.vp_c15)._m0[int(_1528)][_1530];
    int _1534 = int(_1526) + 1;
    uint _1536 = uint(int(uint(_1534) >> uint(2)));
    int _1538 = _1534 & 3;
    float _1540 = (*spvDescriptorSet0.vp_c15)._m0[int(_1536)][_1538];
    int _1542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1544 = _1542 != 0;
    int _1546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1548 = _1546 != 0;
    int _1550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1552 = _1550 != 0;
    int _1554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1556 = _1554 != 0;
    if (!_1512)
    {
        int _1558 = _1486 << 2;
        _1470 = _1558;
    }
    int _1560 = _1470;
    int _1562 = _1333 + 104;
    uint _1564 = uint(int(uint(_1562) >> uint(2)));
    uint _1566 = uint(int(uint(int(_1564)) >> uint(2)));
    int _1568 = int(_1564) & 3;
    float _1570 = (*spvDescriptorSet0.vp_c15)._m0[int(_1566)][_1568];
    int _1572 = int(_1564) + 1;
    uint _1574 = uint(int(uint(_1572) >> uint(2)));
    int _1576 = _1572 & 3;
    float _1578 = (*spvDescriptorSet0.vp_c15)._m0[int(_1574)][_1576];
    int _1580 = _1560;
    if (!_1512)
    {
        uint _1582 = uint(int(uint(_1486) >> uint(2)));
        _1472 = int(_1582);
    }
    int _1584 = _1472;
    if (!_1512)
    {
        int _1586 = 12 & _1560;
        _1580 = _1586;
    }
    int _1588 = _1580;
    bool _1590 = !_1548;
    int _1592 = _1590 ? 0 : 1;
    int _1594 = 0;
    if (!_1512)
    {
        int _1596 = _1584 << 4;
        int _1598 = _1596 + _1588;
        _1594 = _1598;
    }
    int _1600 = _1594;
    bool _1602 = !_1412;
    int _1604 = _1602 ? 0 : 1;
    bool _1606 = !_1544;
    int _1608 = _1606 ? 0 : 1;
    bool _1610 = !_1552;
    int _1612 = _1610 ? 0 : 1;
    bool _1614 = !_1556;
    int _1616 = _1614 ? 0 : 1;
    float _1618 = 0.0;
    if (!_1520)
    {
        _1618 = _1522;
    }
    float _1620 = _1618;
    bool _1622 = !_1520;
    float _1624 = _1620;
    float _1626 = _1356;
    float _1628 = _1456;
    if (!_1622)
    {
        float _1630 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1632 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1634 = _1414 + _1632;
        float _1636 = rsqrt(_1398);
        float _1638 = _1634 * _1630;
        float _1640 = _1522 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1642 = _1638 * 0.15915493667125701904296875;
        float _1644 = _1642 * 6.283185482025146484375;
        float _1646 = cos(_1644);
        float _1648 = _1642 * 6.283185482025146484375;
        float _1650 = sin(_1648);
        float _1652 = _1646 + (-1.0);
        float _1654 = fma(_1650, _1640, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1656 = _1652 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1658 = _1636 * _1654;
        float _1660 = fma(_1522, _1646, _1656);
        float _1662 = fma(_1372, _1658, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1664 = fma(_1345, _1658, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1624 = _1660;
        _1474 = _1662;
        _1476 = _1664;
    }
    float _1666 = _1624;
    float _1668 = _1474;
    float _1670 = _1476;
    float _1672 = -_1017;
    float _1674 = _1672 + _1666;
    float _1676 = -_1019;
    float _1678 = _1676 + _1668;
    int _1680 = _1333 + 80;
    uint _1682 = uint(int(uint(_1680) >> uint(2)));
    uint _1684 = uint(int(uint(int(_1682)) >> uint(2)));
    int _1686 = int(_1682) & 3;
    float _1688 = (*spvDescriptorSet0.vp_c15)._m0[int(_1684)][_1686];
    int _1690 = int(_1682) + 1;
    uint _1692 = uint(int(uint(_1690) >> uint(2)));
    int _1694 = _1690 & 3;
    float _1696 = (*spvDescriptorSet0.vp_c15)._m0[int(_1692)][_1694];
    float _1698 = -_1021;
    float _1700 = _1698 + _1670;
    float _1702 = _1674 * _1674;
    float _1704 = _1219 * _1540;
    float _1706 = _1219 * _1364;
    float _1708 = _1219 * _1464;
    float _1710 = fma(_1678, _1678, _1702);
    float _1712 = fma(_1057, _1532, _1704);
    int _1714 = _1333 + 88;
    uint _1716 = uint(int(uint(_1714) >> uint(2)));
    uint _1718 = uint(int(uint(int(_1716)) >> uint(2)));
    int _1720 = int(_1716) & 3;
    float _1722 = (*spvDescriptorSet0.vp_c15)._m0[int(_1718)][_1720];
    int _1724 = int(_1716) + 1;
    uint _1726 = uint(int(uint(_1724) >> uint(2)));
    int _1728 = _1724 & 3;
    float _1730 = (*spvDescriptorSet0.vp_c15)._m0[int(_1726)][_1728];
    float _1732 = _1702;
    if (!_1512)
    {
        float _1734 = floor(_1249);
        _1732 = _1734;
    }
    float _1736 = _1732;
    float _1738 = fma(_1700, _1700, _1710);
    float _1740 = fma(_1061, _1570, _1712);
    float _1742 = fma(_1057, _1356, _1706);
    float _1744 = fma(_1057, _1456, _1708);
    float _1746 = -_1051;
    float _1748 = _1746 + _1668;
    float _1750 = _1740 + _1578;
    float _1752 = _1019;
    float _1754 = _1742;
    float _1756 = _1744;
    if (!_1512)
    {
        int _1758 = _1600 + 400;
        uint _1760 = uint(int(uint(_1758) >> uint(2)));
        uint _1762 = uint(int(uint(int(_1760)) >> uint(2)));
        int _1764 = int(_1760) & 3;
        float _1766 = (*spvDescriptorSet0.vp_c15)._m0[int(_1762)][_1764];
        _1752 = _1766;
    }
    float _1768 = _1752;
    float _1770 = sqrt(_1738);
    float _1772 = -_1091;
    float _1774 = _1772 + _1666;
    float _1776 = -_1053;
    float _1778 = _1776 + _1670;
    float _1780 = fma(_1061, _1388, _1742);
    float _1782 = fma(_1061, _1502, _1744);
    bool _1784 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1786 = isnan(0.5);
    bool _1788 = _1784 || _1786;
    bool _1790 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1792 = _1788 || _1790;
    float _1794 = _1780 + _1396;
    float _1796 = _1712;
    if (!_1512)
    {
        float _1798 = floor(_1255);
        _1796 = _1798;
    }
    float _1800 = _1796;
    float _1802 = _1782 + _1510;
    bool _1804 = _1770 > 0.0;
    float _1806 = 1.0 / _1750;
    if (!_1804)
    {
        _1626 = _1748;
    }
    float _1808 = _1626;
    float _1810 = _1808;
    if (!_1804)
    {
        _1754 = _1774;
    }
    float _1812 = _1754;
    float _1814 = _1812;
    if (!_1804)
    {
        _1756 = _1778;
    }
    float _1816 = _1756;
    bool _1818 = !_1804;
    float _1820 = _1816;
    float _1822 = _1816;
    if (!_1818)
    {
        float _1824 = _237 * _237;
        float _1826 = fma(_233, _233, _1824);
        float _1828 = fma(_239, _239, _1826);
        float _1830 = rsqrt(_1738);
        float _1832 = sqrt(_1828);
        float _1834 = _1678 * _1830;
        float _1836 = _1674 * _1830;
        float _1838 = _1700 * _1830;
        bool _1840 = _1832 > 0.0;
        float _1842 = _1832;
        float _1844 = _1830;
        if (!_1840)
        {
            _1842 = _1748;
        }
        float _1846 = _1842;
        _1810 = _1846;
        if (!_1840)
        {
            _1844 = _1774;
        }
        float _1848 = _1844;
        _1814 = _1848;
        if (!_1840)
        {
            _1820 = _1778;
        }
        float _1850 = _1820;
        bool _1852 = !_1840;
        _1822 = _1850;
        if (!_1852)
        {
            float _1854 = rsqrt(_1828);
            float _1856 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1858 = _237 * _1854;
            float _1860 = _233 * _1854;
            float _1862 = _1836 * _1858;
            float _1864 = _239 * _1854;
            float _1866 = fma(_1834, _1860, _1862);
            float _1868 = _1856 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1870 = fma(_1838, _1864, _1866);
            float _1872 = _1870 * _1868;
            float _1874 = fma(_233, _1872, _1748);
            float _1876 = fma(_237, _1872, _1774);
            float _1878 = fma(_239, _1872, _1778);
            _1822 = _1878;
            _1810 = _1874;
            _1814 = _1876;
            _1628 = _1856;
        }
    }
    float _1880 = _1822;
    float _1882 = _1810;
    float _1884 = _1814;
    float _1886 = _1628;
    float _1888 = _1884;
    float _1890 = _1882;
    float _1892 = _1886;
    if (_1792)
    {
        _243 = _1880;
    }
    float _1894 = _243;
    float _1896 = _1894;
    if (!_1792)
    {
        float _1898 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1900 = _1113 + _1898;
        float _1902 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1904 = _1057 + _1902;
        float _1906 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1908 = -_1061;
        float _1910 = _1908 + _1880;
        float _1912 = _1900 * _1900;
        float _1914 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1916 = _1061 + _1914;
        float _1918 = fma(_1904, _1904, _1912);
        float _1920 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1922 = fma(_1916, _1916, _1918);
        float _1924 = sqrt(_1922);
        float _1926 = _1906 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1928 = precise::min(_1924, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1930 = _1928 * _1920;
        float _1932 = -_1057;
        float _1934 = _1932 + _1882;
        float _1936 = _1926 * _1930;
        float _1938 = -_1113;
        float _1940 = _1938 + _1884;
        float _1942 = fma(_1934, _1936, _1057);
        float _1944 = fma(_1940, _1936, _1113);
        float _1946 = fma(_1910, _1936, _1061);
        _1888 = _1944;
        _1890 = _1942;
        _1896 = _1946;
        _1892 = _1920;
    }
    float _1948 = _1888;
    float _1950 = _1890;
    float _1952 = _1896;
    float _1954 = _1892;
    float _1956 = _1948 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1958 = _1802 * _1806;
    float _1960 = _1794 * _1806;
    float _1962 = _1948 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1964 = _1948 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1966 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1956);
    float _1968 = _1954;
    if (!_1512)
    {
        float _1970 = rint(_1768);
        float _1972 = precise::max(_1970, 0.0);
        uint _1974 = uint(_1972);
        uint _1976 = clamp(_1974, 0u, 65535u);
        _1968 = as_type<float>(_1976);
    }
    float _1978 = _1968;
    float _1980 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1962);
    float _1982 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1964);
    bool _1984 = _1960 >= 0.0;
    float _1986 = fma(_1952, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1966);
    float _1988 = fma(_1952, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1980);
    float _1990 = fma(_1952, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1982);
    bool _1992 = _1960 <= 1.0;
    bool _1994 = _1992 && _1984;
    float _1996 = _1948 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1998 = _1986 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2000 = _1988 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2002 = _1990 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2004 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1996);
    float _2006 = _1998 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2008 = _1958 >= 0.0;
    bool _2010 = _2008 && _1994;
    float _2012 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2014 = _2000 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2016 = fma(_1952, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2004);
    float _2018 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2006);
    bool _2020 = _1958 <= 1.0;
    bool _2022 = _2020 && _2010;
    float _2024 = -_2014;
    float _2026 = fma(_2024, _2012, 1.0);
    float _2028 = _2016 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2030 = fma(_2000, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2018);
    float _2032 = _1219 * _1696;
    float _2034 = log2(_2026);
    float _2036 = _1998 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2038 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2030);
    float _2040 = _1998 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2042 = fma(_1057, _1688, _2032);
    float _2044 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2036);
    float _2046 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2040);
    float _2048 = 1.0 / _2038;
    float _2050 = _2030;
    float _2052 = _2026;
    float _2054 = _2046;
    if (_2022)
    {
        float _2056 = float(_1311);
        _2050 = _2056;
    }
    float _2058 = _2050;
    float _2060 = fma(_1061, _1722, _2042);
    float _2062 = fma(_2000, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2044);
    float _2064 = fma(_2000, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2046);
    if (!_1512)
    {
        float _2066 = -_1800;
        float _2068 = _1255 + _2066;
        _2052 = _2068;
    }
    float _2070 = _2052;
    float _2072 = _2060 + _1730;
    float _2074 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2062);
    float _2076 = _2058;
    float _2078 = _2074;
    if (_2022)
    {
        float _2080 = rint(_2058);
        float _2082 = precise::max(_2080, 0.0);
        uint _2084 = uint(_2082);
        uint _2086 = clamp(_2084, 0u, 65535u);
        _2076 = as_type<float>(_2086);
    }
    float _2088 = _2076;
    float _2090 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2064);
    float _2092 = _2034 * 0.693147182464599609375;
    if (!_1512)
    {
        float _2094 = -_1736;
        float _2096 = _1249 + _2094;
        _2054 = _2096;
    }
    float _2098 = _2054;
    float _2100 = _2072 * _1806;
    float _2102 = _2092 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2104 = _2074 * _2048;
    float _2106 = _2090 * _2048;
    float _2108 = _2070;
    float _2110 = _2048;
    if (!_1512)
    {
        float3 _7691 = float3(_2098, _2070, float(as_type<int>(_1978)));
        float3 _7695 = select(_7691, float3(0.0), isnan(_7691));
        float _2112 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7695.xy, uint(rint(_7695.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7695.xy, uint(rint(_7695.z)), level(0.0)).x;
        _2108 = _2112;
    }
    float _2114 = _2108;
    float _2116 = fma(_2104, 0.5, 0.5);
    float _2118 = fma(_2106, -0.5, 0.5);
    float _2120 = _1958;
    float _2122 = _2118;
    float _2124 = _2116;
    if (_2022)
    {
        float3 _7716 = float3(_1960, _1958, float(as_type<int>(_2088)));
        float3 _7718 = select(_7716, float3(0.0), isnan(_7716));
        float _2126 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7718.xy, uint(rint(_7718.z)), _2100, level(0.0));
        _2120 = _2126;
    }
    float _2128 = _2120;
    float3 _7728 = float3(_2116, _2118, _2102);
    float _2130 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7728, float3(0.0), isnan(_7728)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7728, float3(0.0), isnan(_7728)), level(0.0)).x;
    float3 _7737 = float3(_2116, _2118, _2102);
    float4 _2133 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7737, float3(0.0), isnan(_7737)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7737, float3(0.0), isnan(_7737)), level(0.0)).xyzw;
    float _2135 = _2133.x;
    float _2137 = _2133.y;
    float _2139 = _2133.z;
    float _2141 = _2133.w;
    bool _2143 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2145 = isnan(0.5);
    bool _2147 = _2143 || _2145;
    bool _2149 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2151 = _2147 || _2149;
    float _2153 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_1512)
    {
        _2110 = 1.0;
    }
    float _2155 = _2110;
    int _2157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2159 = _2157 != 0;
    float _2161 = _2155;
    if (_2151)
    {
        _2153 = 1.0;
    }
    float _2163 = _2153;
    float _2165 = _2163;
    if (_2151)
    {
        _1478 = 1.0;
    }
    float _2167 = _1478;
    float _2169 = _2167;
    if (!_2151)
    {
        float _2171 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2173 = _2171 * 0.15915493667125701904296875;
        float _2175 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2177 = _2173 * 6.283185482025146484375;
        float _2179 = cos(_2177);
        float _2181 = _2175 * 0.15915493667125701904296875;
        float _2183 = _2173 * 6.283185482025146484375;
        float _2185 = sin(_2183);
        float _2187 = 1.0 / _2179;
        float _2189 = _2181 * 6.283185482025146484375;
        float _2191 = cos(_2189);
        float _2193 = _2185 * _2187;
        float _2195 = _2181 * 6.283185482025146484375;
        float _2197 = sin(_2195);
        float _2199 = _2191 * _2193;
        float _2201 = 1.0 / _2199;
        float _2203 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2205 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2203;
        float _2207 = 1.0 / _2205;
        float _2209 = _2197 * _2201;
        float _2211 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2213 = fma(_1259, _2209, _2211);
        float _2215 = _2213 * _2207;
        float _2217 = precise::clamp(_2215, 0.0, 1.0);
        _2122 = _2173;
        _2124 = _2181;
        _2169 = _2217;
    }
    float _2219 = _2122;
    float _2221 = _2124;
    float _2223 = _2169;
    float _2225 = _2221;
    float _2227 = _2219;
    if (!_2151)
    {
        float _2229 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2231 = _2229 * 0.15915493667125701904296875;
        float _2233 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2235 = _2231 * 6.283185482025146484375;
        float _2237 = cos(_2235);
        float _2239 = _2233 * 0.15915493667125701904296875;
        float _2241 = _2231 * 6.283185482025146484375;
        float _2243 = sin(_2241);
        float _2245 = 1.0 / _2237;
        float _2247 = _2239 * 6.283185482025146484375;
        float _2249 = cos(_2247);
        float _2251 = _2243 * _2245;
        float _2253 = _2239 * 6.283185482025146484375;
        float _2255 = sin(_2253);
        float _2257 = _2249 * _2251;
        float _2259 = 1.0 / _2257;
        float _2261 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2263 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2261;
        float _2265 = 1.0 / _2263;
        float _2267 = _2255 * _2259;
        float _2269 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2271 = fma(_1259, _2267, _2269);
        float _2273 = _2271 * _2265;
        float _2275 = precise::clamp(_2273, 0.0, 1.0);
        float _2277 = -_2275;
        float _2279 = _2277 + 1.0;
        _2225 = _2257;
        _2227 = _2245;
        _2165 = _2279;
    }
    float _2281 = _2225;
    float _2283 = _2227;
    float _2285 = _2165;
    float _2287 = _2283;
    if (!_1512)
    {
        int _2289 = _1486 << 4;
        int _2291 = _2289 + 2048;
        uint _2293 = uint(int(uint(_2291) >> uint(2)));
        uint _2295 = uint(int(uint(int(_2293)) >> uint(2)));
        int _2297 = int(_2293) & 3;
        float _2299 = (*spvDescriptorSet0.vp_c15)._m0[int(_2295)][_2297];
        int _2301 = int(_2293) + 1;
        uint _2303 = uint(int(uint(_2301) >> uint(2)));
        int _2305 = _2301 & 3;
        float _2307 = (*spvDescriptorSet0.vp_c15)._m0[int(_2303)][_2305];
        int _2309 = _2291 + 8;
        uint _2311 = uint(int(uint(_2309) >> uint(2)));
        uint _2313 = uint(int(uint(int(_2311)) >> uint(2)));
        int _2315 = int(_2311) & 3;
        float _2317 = (*spvDescriptorSet0.vp_c15)._m0[int(_2313)][_2315];
        int _2319 = int(_2311) + 1;
        uint _2321 = uint(int(uint(_2319) >> uint(2)));
        int _2323 = _2319 & 3;
        float _2325 = (*spvDescriptorSet0.vp_c15)._m0[int(_2321)][_2323];
        float _2327 = _1219 * _2307;
        float _2329 = fma(_1057, _2299, _2327);
        float _2331 = fma(_1061, _2317, _2329);
        float _2333 = _2331 + _2325;
        float _2335 = precise::clamp(_2333, 0.0, 1.0);
        float _2337 = -_2335;
        float _2339 = _2337 + _2114;
        float _2341 = fma(_2339, 500.0, 1.5);
        float _2343 = exp2(_2341);
        float _2345 = 0.0 + _2343;
        float _2347 = precise::clamp(_2345, 0.0, 1.0);
        _2161 = _2347;
    }
    float _2349 = _2161;
    float _2351 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2353 = _1948 + _2351;
    float _2355 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2357 = _1950 + _2355;
    float _2359 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2361 = _1952 + _2359;
    float _2363 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _2365 = int(_2363);
    float _2367 = _2353 * _2353;
    float _2369 = fma(_2357, _2357, _2367);
    float _2371 = fma(_2361, _2361, _2369);
    float _2373 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2375 = _2373 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2377 = rsqrt(_2371);
    float _2379 = sqrt(_2371);
    float _2381 = _2377 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2383 = 1.0 / _2375;
    float _2385 = _2357 * _2381;
    float _2387 = _2361 * _2381;
    float _2389 = _2385 * _2385;
    float _2391 = _2387 * _2387;
    float _2393 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _2395 = int(_2393);
    float _2397 = _2389 + _2391;
    float _2399 = sqrt(_2397);
    float _2401 = float(_2395);
    float _2403 = 1.0 / _2401;
    bool _2405 = _2399 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2407 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2409 = _2399 + _2407;
    float _2411 = _159 * _2403;
    float _2413 = _2377;
    float _2415 = _2409;
    float _2417 = _2353;
    float _2419 = _2397;
    float _2421 = _2389;
    if (_2405)
    {
        float _2423 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2413 = _2423;
    }
    float _2425 = _2413;
    if (_2405)
    {
        float _2427 = rsqrt(_2397);
        _2287 = _2427;
    }
    float _2429 = _2287;
    if (_2405)
    {
        float _2431 = _2409 * _2425;
        _2415 = _2431;
    }
    float _2433 = _2415;
    float _2435 = trunc(_2411);
    int _2437 = int(_2435);
    if (_2405)
    {
        float _2439 = _2433 * 0.15915493667125701904296875;
        _1301 = _2439;
    }
    float _2441 = _1301;
    float _2443 = _2425;
    if (_2405)
    {
        float _2445 = _2441 * 6.283185482025146484375;
        float _2447 = sin(_2445);
        _2443 = _2447;
    }
    float _2449 = _2443;
    float _2451 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2453 = precise::max(0.0, _2451);
    float _2455 = _2281;
    float _2457 = _2453;
    if (_2405)
    {
        float _2459 = _2441 * 6.283185482025146484375;
        float _2461 = cos(_2459);
        _2455 = _2461;
    }
    float _2463 = _2455;
    float _2465 = -_2381;
    float _2467 = -_2453;
    float _2469 = fma(_2353, _2465, _2467);
    if (_2405)
    {
        float _2471 = _2469 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2457 = _2471;
    }
    float _2473 = _2457;
    float _2475 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2477 = int(_2475);
    float _2479 = _2473;
    float _2481 = _2449;
    if (_2405)
    {
        float _2483 = fma(_2449, _2473, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2479 = _2483;
    }
    float _2485 = _2479;
    float _2487 = _2485;
    if (!_2405)
    {
        _2481 = _2385;
    }
    float _2489 = _2481;
    float _2491 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2493 = fma(_2379, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2491);
    float _2495 = precise::clamp(_2493, 0.0, 1.0);
    float _2497 = _2489;
    if (_2405)
    {
        float _2499 = _2429 * _2485;
        _1480 = _2499;
    }
    float _2501 = _1480;
    float _2503 = _2463;
    if (_2405)
    {
        float _2505 = _2463 + (-1.0);
        _2417 = _2505;
    }
    float _2507 = _2417;
    float _2509 = _2507;
    if (!_2405)
    {
        _2487 = _2469;
    }
    float _2511 = _2487;
    float _2513 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _2515 = int(_2513);
    float _2517 = _2511;
    if (_2405)
    {
        float _2519 = _2385 * _2501;
        _2497 = _2519;
    }
    float _2521 = _2497;
    if (_2405)
    {
        float _2523 = _2507 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2419 = _2523;
    }
    float _2525 = _2419;
    if (!_2405)
    {
        _2509 = _2387;
    }
    float _2527 = _2509;
    float _2529 = _2527;
    if (_2405)
    {
        float _2531 = _2387 * _2501;
        _2529 = _2531;
    }
    float _2533 = _2529;
    if (_2405)
    {
        float _2535 = _2521 * _2521;
        _2421 = _2535;
    }
    float _2537 = _2421;
    if (_2405)
    {
        float _2539 = fma(_2469, _2463, _2525);
        _2517 = _2539;
    }
    float _2541 = _2517;
    if (!_2405)
    {
        _2503 = _2391;
    }
    float _2543 = _2503;
    float _2545 = _2543;
    if (_2405)
    {
        float _2547 = _2533 * _2533;
        _2545 = _2547;
    }
    float _2549 = _2545;
    float _2551 = -_2495;
    float _2553 = _2551 + 1.0;
    float _2555 = fma(_2541, _2541, _2537);
    float _2557 = float(uint(_2365));
    float _2559 = _2555 + _2549;
    float _2561 = abs(_2553);
    float _2563 = log2(_2561);
    float _2565 = float(_2515);
    float _2567 = rsqrt(_2559);
    float _2569 = _2563 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2571 = 1.0 / _2565;
    float _2573 = _2567 * _2521;
    float _2575 = _2567 * _2541;
    float _2577 = _2567 * _2533;
    float _2579 = exp2(_2569);
    float _2581 = _2573 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2583 = -_2581;
    float _2585 = fma(_2575, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2583);
    float _2587 = 1.0 / _2557;
    float _2589 = -_2577;
    float _2591 = fma(_2589, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2585);
    float _2593 = in.m_74.x;
    float _2595 = in.m_74.y;
    float _2597 = in.m_74.z;
    float _2599 = in.m_74.w;
    float _2601 = fma(_2591, -0.5, 0.5);
    float _2603 = fma(_2591, 0.5, 0.5);
    float _2605 = fma(_2603, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2607 = sqrt(_2601);
    float _2609 = fma(_2603, _2605, -0.212114393711090087890625);
    float _2611 = _2575 + 1.0;
    float _2613 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2615 = _2613 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2617 = fma(_2603, _2609, 1.570728778839111328125);
    float _2619 = -_2575;
    float _2621 = fma(_2579, _2611, _2619);
    float _2623 = float(uint(_2477));
    float _2625 = 1.0 / _2615;
    float _2627 = fma(_2621, 0.5, 0.5);
    float _2629 = _2607 * 0.636619746685028076171875;
    float _2631 = -_2617;
    float _2633 = fma(_2629, _2631, 1.0);
    float2 _8460 = float2(_2633, _2627);
    float3 _2637 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8460, float2(0.0), isnan(_8460)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8460, float2(0.0), isnan(_8460)), level(0.0)).xyz;
    float _2639 = _2637.x;
    float _2641 = _2637.y;
    float _2643 = _2637.z;
    float _2645 = _159 * _2571;
    bool _2647 = _2599 > 0.5;
    float _2649 = 0.0;
    float _2651 = _2597;
    if (_2159)
    {
        float _2653 = in.m_74.x;
        _2649 = _2653;
    }
    float _2655 = _2649;
    float _2657 = 1.0 / _2623;
    int _2659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2661 = _2659 != 0;
    float _2663 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2665 = _981 + _2663;
    int _2667 = as_type<int>(_2587) + (-2);
    float _2669 = _2655;
    if (!_2159)
    {
        float _2671 = in.m_74.y;
        _2669 = _2671;
    }
    float _2673 = _2669;
    float _2675 = float(uint(_2437));
    float _2677 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2679 = _981 + _2677;
    float _2681 = trunc(_2645);
    int _2683 = int(_2681);
    float _2685 = as_type<float>(_2667) * _2675;
    int _2687 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2689 = _2687 != 0;
    float _2691 = _2593 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2693 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2695 = trunc(_2685);
    float _2697 = precise::max(_2695, 0.0);
    uint _2699 = uint(_2697);
    float _2701 = -_2693;
    float _2703 = fma(_2691, 2.0, _2701);
    float _2705 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2707 = _2595 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2709 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2711 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2709;
    float _2713 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2715 = _2713 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2717 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2719 = _2717 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2721 = fma(_2707, -2.0, _2705);
    float _2723 = _2711 * _2383;
    int _2725 = as_type<int>(_2657) + (-2);
    float _2727 = _2715 * _2625;
    float _2729 = float(uint(_2683));
    float _2731 = 1.0 / _2719;
    int _2733 = ~_2365;
    int _2735 = _2733 + 1;
    float _2737 = fma(_2723, _2665, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2739 = as_type<float>(_2725) * _2729;
    float _2741 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2743 = _981 + _2741;
    float _2745 = _2657;
    if (_2159)
    {
        _2745 = 1.0;
    }
    float _2747 = _2745;
    float _2749 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2751 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2749;
    float _2753 = _2747;
    if (!_2159)
    {
        _2753 = 7.345489978790283203125;
    }
    float _2755 = _2753;
    int _2757 = _2735 * int(_2699);
    int _2759 = _2757 + _2437;
    float _2761 = trunc(_2739);
    float _2763 = precise::max(_2761, 0.0);
    uint _2765 = uint(_2763);
    float _2767 = _951 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2769 = _2755 * _2593;
    float _2771 = float(uint(_2759));
    float _2773 = _2751 * _2731;
    int _2775 = ~_2477;
    int _2777 = _2775 + 1;
    float _2779 = _2767 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2781 = _2755;
    int _2783 = int(_2699);
    if (_2159)
    {
        _2781 = 1.0;
    }
    float _2785 = _2781;
    float _2787 = as_type<float>(_2667) * _2771;
    float _2789 = _2785;
    if (!_2159)
    {
        _2789 = 1.2345600128173828125;
    }
    float _2791 = _2789;
    float _2793 = floor(_2769);
    int _2795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2797 = _2795 != 0;
    out.m_80.x = _1057;
    out.m_80.y = _1113;
    out.m_80.z = _1061;
    bool _2799 = _2595 > 0.5;
    float _2801 = _2673 * _2791;
    float _2803 = -_221;
    int _2805 = _2647 ? as_type<int>(_2803) : as_type<int>(_221);
    int _2807 = _2777 * int(_2765);
    int _2809 = _2807 + _2683;
    int _2811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2813 = _2811 != 0;
    float _2815 = trunc(_2787);
    float _2817 = precise::max(_2815, 0.0);
    uint _2819 = uint(_2817);
    float _2821 = -_221;
    int _2823 = _2799 ? as_type<int>(_2821) : as_type<int>(_221);
    out.m_82.w = _1047;
    bool _2825 = !_2797;
    float _2827 = _2825 ? _221 : as_type<float>(_2805);
    float _2829 = _1998 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2831 = _2593 > 0.5;
    out.m_84.x = _1269;
    out.m_84.y = _1271;
    out.m_84.z = _1273;
    float _2833 = float(uint(_2809));
    float _2835 = floor(_2801);
    bool _2837 = !_2813;
    float _2839 = _2837 ? _221 : as_type<float>(_2823);
    float _2841 = -_2793;
    float _2843 = _2769 + _2841;
    float _2845 = -_217;
    int _2847 = _2831 ? as_type<int>(_2845) : as_type<int>(_217);
    float _2849 = as_type<float>(_2725) * _2833;
    bool _2851 = _2597 > 0.5;
    float _2853 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2829);
    bool _2855 = !_2689;
    float _2857 = _2855 ? _217 : as_type<float>(_2847);
    float _2859 = _2563 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2861 = int(_2699) + int(_2819);
    float _2863 = trunc(_2849);
    float _2865 = precise::max(_2863, 0.0);
    uint _2867 = uint(_2865);
    float _2869 = float(_125);
    float _2871 = fma(_2727, _2743, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _2873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2875 = _2873 != 0;
    float _2877 = fma(_2773, _2679, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2879 = -_217;
    int _2881 = _2851 ? as_type<int>(_2879) : as_type<int>(_217);
    float _2883 = -_2835;
    float _2885 = _2801 + _2883;
    if (_2159)
    {
        _2783 = 0;
    }
    int _2887 = _2783;
    float _2889 = 1.0 / _2869;
    int _2891 = ~_2365;
    int _2893 = _2891 + 1;
    float _2895 = -_1079;
    float _2897 = _2895 + 1.0;
    int _2899 = _2887;
    if (!_2159)
    {
        _2899 = 1;
    }
    int _2901 = _2899;
    out.m_86.x = _1247;
    bool _2903 = !_2875;
    float _2905 = _2903 ? _217 : as_type<float>(_2881);
    int _2907 = _2893 * _2861;
    int _2909 = _2907 + _2437;
    bool _2911 = _2901 != 1;
    float _2913 = exp2(_2859);
    float _2915 = float(_2365);
    out.m_88.x = _1950;
    out.m_88.y = _1948;
    out.m_88.z = _1952;
    float _2917 = float(_2477);
    float _2919 = float(_2437);
    float _2921 = _2843 * _2915;
    int _2923 = int(_2765) + int(_2867);
    float _2925 = _159 * _2889;
    int _2927 = ~_2477;
    int _2929 = _2927 + 1;
    float _2931 = _2885 * _2917;
    float _2933 = float(_2683);
    float _2935 = _2925 * _2915;
    bool _2937 = _2919 >= _2915;
    bool _2939 = isnan(_2919);
    bool _2941 = _2937 || _2939;
    bool _2943 = isnan(_2915);
    bool _2945 = _2941 || _2943;
    float _2947 = float(_2945);
    float _2949 = _2925 * _2917;
    bool _2951 = uint(_2909) >= uint(_2365);
    float _2953 = trunc(_2921);
    int _2955 = int(_2953);
    bool _2957 = _2933 >= _2917;
    bool _2959 = isnan(_2933);
    bool _2961 = _2957 || _2959;
    bool _2963 = isnan(_2917);
    bool _2965 = _2961 || _2963;
    float _2967 = float(_2965);
    int _2969 = _2929 * _2923;
    int _2971 = _2969 + _2683;
    bool _2973 = !_2951;
    int _2975 = _2973 ? 0 : (-1);
    int _2977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2979 = _2977 != 0;
    bool _2981 = uint(_2971) >= uint(_2477);
    float _2983 = trunc(_2947);
    int _2985 = int(_2983);
    int _2987 = ~_2861;
    int _2989 = _2987 + _2975;
    int _2991 = _2989 + 1;
    int _2993 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2995 = _2993 != 0;
    bool _2997 = !_2979;
    int _2999 = _2997 ? 0 : 1;
    int _3001 = _2365 * _2991;
    int _3003 = _3001 + _2437;
    bool _3005 = !_2995;
    int _3007 = _3005 ? 0 : 1;
    float _3009 = trunc(_2931);
    int _3011 = int(_3009);
    int _3013 = abs(_2999);
    bool _3015 = !_2981;
    int _3017 = _3015 ? 0 : (-1);
    bool _3019 = _2365 == 0;
    int _3021 = ~_2923;
    int _3023 = _3021 + _3017;
    int _3025 = _3023 + 1;
    float _3027 = trunc(_2967);
    int _3029 = int(_3027);
    int _3031 = abs(_3007);
    int _3033 = _2477 * _3025;
    int _3035 = _3033 + _2683;
    int _3037 = ~_2985;
    int _3039 = _3037 + 1;
    int _3041 = _3039 + 1;
    int _3043 = _2955 * _3013;
    int _3045 = _3043 + _2437;
    bool _3047 = !_3019;
    int _3049 = _3047 ? _3003 : (-1);
    int _3051 = _3011 * _3031;
    int _3053 = _3051 + _2683;
    bool _3055 = _2477 == 0;
    float _3057 = trunc(_2935);
    int _3059 = int(_3057);
    int _3061 = _2365 + (-1);
    int _3063 = _3049 * _3041;
    bool _3065 = !_3055;
    int _3067 = _3065 ? _3035 : (-1);
    int _3069 = ~_3029;
    int _3071 = _3069 + 1;
    int _3073 = _3071 + 1;
    int _3075 = _2985 * _3061;
    int _3077 = _3075 + _3063;
    int _3079 = abs(_1492);
    float _3081 = trunc(_2949);
    int _3083 = int(_3081);
    int _3085 = _2477 + (-1);
    int _3087 = _3067 * _3073;
    int _3089 = abs(_1592);
    int _3091 = _3029 * _3085;
    int _3093 = _3091 + _3087;
    bool _3095 = _981 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _3097 = isnan(_981);
    bool _3099 = _3095 || _3097;
    bool _3101 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _3103 = _3099 || _3101;
    float _3105 = float(_3103);
    int _3107 = abs(_1518);
    int _3109 = _3077 * _3079;
    bool _3111 = _981 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _3113 = isnan(_981);
    bool _3115 = _3111 || _3113;
    bool _3117 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _3119 = _3115 || _3117;
    float _3121 = float(_3119);
    float _3123 = -_3105;
    float _3125 = _3123 + 1.0;
    int _3127 = abs(_1608);
    int _3129 = _3093 * _3089;
    bool _3131 = _981 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _3133 = isnan(_981);
    bool _3135 = _3131 || _3133;
    bool _3137 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _3139 = _3135 || _3137;
    float _3141 = float(_3139);
    float _3143 = _3121 * _3125;
    float _3145 = -_3121;
    float _3147 = _3145 + 1.0;
    bool _3149 = _981 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _3151 = isnan(_981);
    bool _3153 = _3149 || _3151;
    bool _3155 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _3157 = _3153 || _3155;
    float _3159 = float(_3157);
    int _3161 = _3059 * _3107;
    int _3163 = _3161 + _3109;
    float _3165 = -_3141;
    float _3167 = _3165 + 1.0;
    float _3169 = _3141 * _3147;
    bool _3171 = !_2661;
    int _3173 = _3171 ? 0 : 1;
    int _3175 = _3083 * _3127;
    int _3177 = _3175 + _3129;
    int _3179 = abs(_1604);
    float _3181 = _3159 * _3167;
    int _3183 = abs(_1612);
    int _3185 = abs(_3173);
    int _3187 = _3045 * _3179;
    int _3189 = _3187 + _3163;
    float _3191 = _2737 * _3181;
    int _3193 = abs(_1616);
    int _3195 = _3053 * _3183;
    int _3197 = _3195 + _3177;
    float _3199 = -_3159;
    float _3201 = _3199 + 1.0;
    int _3203 = _2955 * _3185;
    int _3205 = _3203 + _3189;
    float _3207 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2721);
    float _3209 = -_159;
    float _3211 = fma(_3209, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2703);
    float _3213 = _2857 + 0.5;
    float _3215 = float(uint(_3205));
    int _3217 = _3011 * _3193;
    int _3219 = _3217 + _3197;
    float _3221 = _2839 + (-0.5);
    float _3223 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3225 = fma(_3213, (*spvDescriptorSet0.vp_c9)._m0[80].x, _3211);
    float _3227 = as_type<float>(_2667) * _3215;
    float _3229 = fma(_3201, (*spvDescriptorSet0.vp_c9)._m0[131].x, _3191);
    float _3231 = _3213;
    float _3233 = _3191;
    if (!_2911)
    {
        _3231 = _2595;
    }
    float _3235 = _3231;
    float _3237 = fma(_2593, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3223);
    float _3239 = trunc(_3227);
    float _3241 = precise::max(_3239, 0.0);
    uint _3243 = uint(_3241);
    float _3245 = _3235;
    if (!_2911)
    {
        _3233 = _2595;
    }
    float _3247 = _3233;
    float _3249 = -_3221;
    float _3251 = -_3207;
    float _3253 = fma(_3249, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3251);
    float _3255 = _3247;
    if (_2911)
    {
        _3245 = _2593;
    }
    float _3257 = _3245;
    float _3259 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3237);
    if (_2911)
    {
        _3255 = _2593;
    }
    float _3261 = _3255;
    float _3263 = _3257 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _3265 = float(uint(_3219));
    int _3267 = ~_2365;
    int _3269 = _3267 + 1;
    float _3271 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3273 = as_type<float>(_2725) * _3265;
    float _3275 = fma(_2595, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3271);
    int _3277 = _3269 * int(_3243);
    int _3279 = _3277 + _3205;
    float _3281 = _3271;
    if (!_2911)
    {
        _3281 = _2597;
    }
    float _3283 = _3281;
    float _3285 = _3283;
    if (_2911)
    {
        _2651 = _2595;
    }
    float _3287 = _2651;
    float _3289 = trunc(_3273);
    float _3291 = precise::max(_3289, 0.0);
    uint _3293 = uint(_3291);
    if (_2911)
    {
        _3285 = _2595;
    }
    float _3295 = _3285;
    float _3297 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3299 = fma(_2871, _3169, _3229);
    float _3301 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3303 = float(uint(_3279));
    float _3305 = fma(_3261, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3297);
    int _3307 = ~_2477;
    int _3309 = _3307 + 1;
    float _3311 = fma(_3295, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3301);
    float _3313 = as_type<float>(_2667) * _3303;
    float _3315 = float(uint(_3045));
    float _3317 = fma(_2877, _3143, _3299);
    float _3319 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3321 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3275);
    float _3323 = trunc(_3313);
    float _3325 = precise::max(_3323, 0.0);
    uint _3327 = uint(_3325);
    int _3329 = _3309 * int(_3293);
    int _3331 = _3329 + _3219;
    float _3333 = as_type<float>(_2667) * _3315;
    float _3335 = _3287 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _3337 = -_3319;
    float _3339 = fma(_3263, 2.0, _3337);
    float _3341 = fma(_3105, (*spvDescriptorSet0.vp_c9)._m0[134].x, _3317);
    float _3343 = float(uint(_3331));
    float _3345 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3347 = trunc(_3333);
    float _3349 = precise::max(_3347, 0.0);
    uint _3351 = uint(_3349);
    int _3353 = ~_2365;
    int _3355 = _3353 + 1;
    float _3357 = -_159;
    float _3359 = fma(_3357, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3339);
    float _3361 = as_type<float>(_2725) * _3343;
    float _3363 = fma(_3335, -2.0, _3345);
    int _3365 = ~_2365;
    int _3367 = _3365 + 1;
    float _3369 = _2905 + 0.5;
    float _3371 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3305);
    int _3373 = int(_3243) + int(_3327);
    float _3375 = trunc(_3361);
    float _3377 = precise::max(_3375, 0.0);
    uint _3379 = uint(_3377);
    float _3381 = fma(_3369, (*spvDescriptorSet0.vp_c9)._m0[85].x, _3359);
    float _3383 = float(uint(_3053));
    float _3385 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3311);
    int _3387 = _3355 * _3373;
    int _3389 = _3387 + _3205;
    float _3391 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3363);
    float _3393 = _2827 + (-0.5);
    int _3395 = _3367 * int(_3351);
    int _3397 = _3395 + _3045;
    int _3399 = ~_2477;
    int _3401 = _3399 + 1;
    float _3403 = as_type<float>(_2725) * _3383;
    bool _3405 = uint(_3389) >= uint(_2365);
    float _3407 = -_3321;
    float _3409 = _3407 + 1.0;
    float _3411 = float(uint(_3397));
    bool _3413 = !_3405;
    int _3415 = _3413 ? 0 : (-1);
    int _3417 = int(_3293) + int(_3379);
    float _3419 = -_3393;
    float _3421 = -_3391;
    float _3423 = fma(_3419, (*spvDescriptorSet0.vp_c9)._m0[85].y, _3421);
    int _3425 = ~_3373;
    int _3427 = _3425 + _3415;
    int _3429 = _3427 + 1;
    float _3431 = -_3259;
    float _3433 = _3431 + 1.0;
    int _3435 = _3401 * _3417;
    int _3437 = _3435 + _3219;
    float _3439 = as_type<float>(_2667) * _3411;
    int _3441 = _2365 * _3429;
    int _3443 = _3441 + _3205;
    float _3445 = -_3385;
    float _3447 = _3445 + 1.0;
    float _3449 = trunc(_3403);
    float _3451 = precise::max(_3449, 0.0);
    uint _3453 = uint(_3451);
    float _3455 = -_3433;
    float _3457 = fma(_2857, _3455, _3225);
    int _3459 = ~_2477;
    int _3461 = _3459 + 1;
    float _3463 = fma(_2827, _3447, _3423);
    float _3465 = _947 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3467 = fma(_2839, _3409, _3253);
    float _3469 = _949 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _3471 = !_3019;
    int _3473 = _3471 ? _3443 : (-1);
    float _3475 = _3341 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _3477 = uint(_3437) >= uint(_2477);
    float _3479 = -_3371;
    float _3481 = _3479 + 1.0;
    int _3483 = _3473 & 3;
    bool _3485 = _3483 != 0;
    float _3487 = _3465 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3489 = _3473 & 3;
    bool _3491 = _3489 != 0;
    float _3493 = -_3481;
    float _3495 = fma(_2905, _3493, _3381);
    bool _3497 = uint(_3483) > 1u;
    int _3499 = _3461 * int(_3453);
    int _3501 = _3499 + _3053;
    bool _3503 = !_3477;
    int _3505 = _3503 ? 0 : (-1);
    float _3507 = _3469 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3509 = _3491 ? 0 : 1;
    float _3511 = trunc(_3439);
    float _3513 = precise::max(_3511, 0.0);
    uint _3515 = uint(_3513);
    float _3517 = float(uint(_3501));
    out.m_90.x = _3457;
    out.m_90.y = _3467;
    out.m_90.z = _3495;
    out.m_90.w = _3463;
    int _3519 = ~_3417;
    int _3521 = _3519 + _3505;
    int _3523 = _3521 + 1;
    int _3525 = ~_3509;
    int _3527 = _3525 + 1;
    int _3529 = _3527 + 1;
    float _3531 = as_type<float>(_2725) * _3517;
    float _3533 = _1199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3535 = _3529;
    if (!_3497)
    {
        int _3537 = ~_3509;
        int _3539 = _3537 + 1;
        _3535 = _3539;
    }
    int _3541 = _3535;
    int _3543 = _2477 * _3523;
    int _3545 = _3543 + _3219;
    bool _3547 = uint(_3483) >= 2u;
    out.m_92.x = _3487;
    out.m_92.y = _3507;
    out.m_92.z = _2779;
    out.m_92.w = _3475;
    float _3549 = trunc(_3531);
    float _3551 = precise::max(_3549, 0.0);
    uint _3553 = uint(_3551);
    int _3555 = _3473 >> 31;
    float _3557 = _3533 * _1291;
    bool _3559 = !_3485;
    int _3561 = _3559 ? 0 : 1;
    int _3563 = _3547 ? 0 : 1;
    bool _3565 = _3483 != 3;
    int _3567 = _3555 & 3;
    int _3569 = int(_3351) + int(_3515);
    float _3571 = fma(_3533, _3533, 1.0);
    bool _3573 = !_3055;
    int _3575 = _3573 ? _3545 : (-1);
    int _3577 = _3473 + _3567;
    int _3579 = _3575 >> 31;
    float _3581 = rsqrt(_3571);
    int _3583 = ~_2365;
    int _3585 = _3583 + 1;
    int _3587 = _3579 & 3;
    int _3589 = ~_2477;
    int _3591 = _3589 + 1;
    int _3593 = ~_3563;
    int _3595 = _3593 + 1;
    int _3597 = _3595 + 1;
    int _3599 = _3577 >> 2;
    int _3601 = _3597;
    if (_3565)
    {
        int _3603 = ~_3563;
        int _3605 = _3603 + 1;
        _3601 = _3605;
    }
    int _3607 = _3601;
    int _3609 = _3575 + _3587;
    int _3611 = _3585 * _3569;
    int _3613 = _3611 + _3045;
    int _3615 = int(_3453) + int(_3553);
    float _3617 = _3533 * _3581;
    int _3619 = _3599 << 4;
    int _3621 = _3619 + 368;
    int _3623 = _3609 >> 2;
    int _3625 = _3591 * _3615;
    int _3627 = _3625 + _3053;
    bool _3629 = uint(_3613) >= uint(_2365);
    float _3631 = -_1153;
    float _3633 = _3617 * _3631;
    uint _3635 = uint(int(uint(_3621) >> uint(2)));
    uint _3637 = uint(int(uint(int(_3635)) >> uint(2)));
    int _3639 = int(_3635) & 3;
    float _3641 = (*spvDescriptorSet0.vp_c9)._m0[int(_3637)][_3639];
    int _3643 = int(_3635) + 1;
    uint _3645 = uint(int(uint(_3643) >> uint(2)));
    int _3647 = _3643 & 3;
    float _3649 = (*spvDescriptorSet0.vp_c9)._m0[int(_3645)][_3647];
    int _3651 = _3623 << 4;
    int _3653 = _3651 + 512;
    float _3655 = -_1151;
    float _3657 = _3617 * _3655;
    float _3659 = -_1163;
    float _3661 = _3617 * _3659;
    bool _3663 = !_3629;
    int _3665 = _3663 ? 0 : (-1);
    float _3667 = fma(_3581, _1291, _3633);
    bool _3669 = uint(_3627) >= uint(_2477);
    float _3671 = fma(_3581, _1295, _3657);
    float _3673 = fma(_3581, _1418, _3661);
    uint _3675 = uint(int(uint(_3653) >> uint(2)));
    uint _3677 = uint(int(uint(int(_3675)) >> uint(2)));
    int _3679 = int(_3675) & 3;
    float _3681 = (*spvDescriptorSet0.vp_c9)._m0[int(_3677)][_3679];
    int _3683 = int(_3675) + 1;
    uint _3685 = uint(int(uint(_3683) >> uint(2)));
    int _3687 = _3683 & 3;
    float _3689 = (*spvDescriptorSet0.vp_c9)._m0[int(_3685)][_3687];
    bool _3691 = !_3669;
    int _3693 = _3691 ? 0 : (-1);
    float _3695 = _3533 * _1295;
    int _3697 = _3575 & 3;
    bool _3699 = _3697 != 0;
    out.m_94.x = _3671;
    out.m_94.y = _3673;
    out.m_94.z = _3667;
    int _3701 = _3575 & 3;
    bool _3703 = _3701 != 0;
    float _3705 = _3533 * _1418;
    int _3707 = _3699 ? 0 : 1;
    int _3709 = _3621 + 8;
    uint _3711 = uint(int(uint(_3709) >> uint(2)));
    uint _3713 = uint(int(uint(int(_3711)) >> uint(2)));
    int _3715 = int(_3711) & 3;
    float _3717 = (*spvDescriptorSet0.vp_c9)._m0[int(_3713)][_3715];
    int _3719 = int(_3711) + 1;
    uint _3721 = uint(int(uint(_3719) >> uint(2)));
    int _3723 = _3719 & 3;
    float _3725 = (*spvDescriptorSet0.vp_c9)._m0[int(_3721)][_3723];
    bool _3727 = uint(_3701) > 1u;
    float _3729 = _1235 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3731 = ~_3707;
    int _3733 = _3731 + 1;
    int _3735 = _3733 + 1;
    int _3737 = ~_3615;
    int _3739 = _3737 + _3693;
    int _3741 = _3739 + 1;
    float _3743 = fma(_3729, _1269, _3695);
    float _3745 = fma(_3729, _1271, _3705);
    int _3747 = abs(_3541);
    int _3749 = _3653 + 8;
    uint _3751 = uint(int(uint(_3749) >> uint(2)));
    uint _3753 = uint(int(uint(int(_3751)) >> uint(2)));
    int _3755 = int(_3751) & 3;
    float _3757 = (*spvDescriptorSet0.vp_c9)._m0[int(_3753)][_3755];
    int _3759 = int(_3751) + 1;
    uint _3761 = uint(int(uint(_3759) >> uint(2)));
    int _3763 = _3759 & 3;
    float _3765 = (*spvDescriptorSet0.vp_c9)._m0[int(_3761)][_3763];
    int _3767 = abs(_3561);
    float _3769 = fma(_3729, _1273, _3557);
    int _3771 = ~_3747;
    int _3773 = _3771 + 1;
    int _3775 = _3773 + 1;
    int _3777 = _2477 * _3741;
    int _3779 = _3777 + _3053;
    int _3781 = _3735;
    if (!_3727)
    {
        int _3783 = ~_3707;
        int _3785 = _3783 + 1;
        _3781 = _3785;
    }
    int _3787 = _3781;
    bool _3789 = uint(_3701) >= 2u;
    bool _3791 = !_3703;
    int _3793 = _3791 ? 0 : 1;
    int _3795 = _3789 ? 0 : 1;
    bool _3797 = _3701 != 3;
    int _3799 = ~_3767;
    int _3801 = _3799 + 1;
    int _3803 = _3801 + 1;
    int _3805 = abs(_3793);
    int _3807 = abs(_3787);
    int _3809 = abs(_3607);
    int _3811 = _3775 * as_type<int>(_3649);
    int _3813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3815 = _3813 != 0;
    int _3817 = ~_3807;
    int _3819 = _3817 + 1;
    int _3821 = _3819 + 1;
    int _3823 = _3803 * as_type<int>(_3641);
    int _3825 = _3823 + _3811;
    int _3827 = ~_3809;
    int _3829 = _3827 + 1;
    int _3831 = _3829 + 1;
    bool _3833 = _3483 != 3;
    float _3835 = abs(_1259);
    float _3837 = log2(_3835);
    bool _3839 = !_3815;
    int _3841 = _3839 ? 0 : 1;
    int _3843 = _3821 * as_type<int>(_3689);
    bool _3845 = _3701 != 3;
    int _3847 = ~_3795;
    int _3849 = _3847 + 1;
    int _3851 = _3849 + 1;
    int _3853 = ~_3805;
    int _3855 = _3853 + 1;
    int _3857 = _3855 + 1;
    int _3859 = _3831 * as_type<int>(_3717);
    int _3861 = _3859 + _3825;
    bool _3863 = !_3833;
    int _3865 = _3863 ? 0 : (-1);
    int _3867 = _3851;
    if (_3797)
    {
        int _3869 = ~_3795;
        int _3871 = _3869 + 1;
        _3867 = _3871;
    }
    int _3873 = _3867;
    int _3875 = _3857 * as_type<int>(_3681);
    int _3877 = _3875 + _3843;
    int _3879 = abs(_3841);
    bool _3881 = !_3845;
    int _3883 = _3881 ? 0 : (-1);
    int _3885 = abs(_3865);
    int _3887 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3889 = _3887 != 0;
    int _3891 = abs(_3873);
    int _3893 = abs(_3883);
    bool _3895 = !_3889;
    int _3897 = _3895 ? 0 : 1;
    int _3899 = ~_3885;
    int _3901 = _3899 + 1;
    int _3903 = _3901 + 1;
    int _3905 = abs(_3897);
    int _3907 = ~_3891;
    int _3909 = _3907 + 1;
    int _3911 = _3909 + 1;
    int _3913 = _3903 * as_type<int>(_3725);
    int _3915 = _3913 + _3861;
    float _3917 = _3837 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _3919 = ~_3879;
    int _3921 = _3919 + 1;
    int _3923 = _3921 + 1;
    int _3925 = _3911 * as_type<int>(_3757);
    int _3927 = _3925 + _3877;
    int _3929 = ~_3893;
    int _3931 = _3929 + 1;
    int _3933 = _3931 + 1;
    float _3935 = fma(_2000, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2853);
    bool _3937 = !_3055;
    int _3939 = _3937 ? _3779 : (-1);
    int _3941 = _3915 * _3923;
    float _3943 = exp2(_3917);
    int _3945 = ~_3905;
    int _3947 = _3945 + 1;
    int _3949 = _3947 + 1;
    int _3951 = _3933 * as_type<int>(_3765);
    int _3953 = _3951 + _3927;
    int _3955 = ~_3569;
    int _3957 = _3955 + _3665;
    int _3959 = _3957 + 1;
    float _3961 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3935);
    int _3963 = _3953 * _3949;
    bool _3965 = _1259 <= 8000.0;
    bool _3967 = isnan(_1259);
    bool _3969 = _3965 || _3967;
    bool _3971 = isnan(8000.0);
    bool _3973 = _3969 || _3971;
    float _3975 = float(_3973);
    int _3977 = _2365 * _3959;
    int _3979 = _3977 + _3045;
    out.gl_Position.x = _2074;
    out.gl_Position.y = _2090;
    out.gl_Position.z = _3961;
    out.gl_Position.w = _2038;
    int _3981 = _3939 * _3905;
    int _3983 = _3981 + _3963;
    float _3985 = _3961 + _2038;
    bool _3987 = !_3019;
    int _3989 = _3987 ? _3979 : (-1);
    float _3991 = _2074 + _2038;
    float _3993 = float(_3983);
    float _3995 = fma(_3943, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3997 = precise::clamp(_3995, 0.0, 1.0);
    int _3999 = _3989 * _3879;
    int _4001 = _3999 + _3941;
    float _4003 = _2038 * 0.5;
    float _4005 = fma(_3997, -2.0, 3.0);
    float _4007 = _3997 * _3997;
    float _4009 = _3985 * 0.5;
    float _4011 = fma(_2090, -0.5, _4003);
    float _4013 = float(_4001);
    float _4015 = _4007 * _4005;
    float _4017 = _3991 * 0.5;
    float _4019 = _1151 + _3743;
    float _4021 = _1163 + _3745;
    float _4023 = -_4015;
    float _4025 = _4023 + 1.0;
    out.m_96.x = _4013;
    out.m_96.y = _3993;
    float _4027 = _1153 + _3769;
    float _4029 = _4025;
    if (!_2022)
    {
        _2078 = 1.0;
    }
    float _4031 = _2078;
    float _4033 = fma(_4025, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4015);
    out.m_98.x = _4017;
    out.m_98.y = _4011;
    out.m_98.z = _4009;
    out.m_98.w = _2038;
    float _4035 = _4031;
    if (_2022)
    {
        bool _4037 = _2128 >= _2100;
        bool _4039 = isnan(_2128);
        bool _4041 = _4037 || _4039;
        bool _4043 = isnan(_2100);
        bool _4045 = _4041 || _4043;
        float _4047 = float(_4045);
        _4035 = _4047;
    }
    float _4049 = _4035;
    float _4051 = _3975 * _4033;
    out.m_100.x = _4019;
    out.m_100.y = _4021;
    out.m_100.z = _4027;
    bool _4053 = _2379 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4055 = isnan(_2379);
    bool _4057 = _4053 || _4055;
    bool _4059 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4061 = _4057 || _4059;
    float _4063 = _4049 * _2349;
    float _4065 = _4051 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4067 = -_2913;
    float _4069 = _4067 + 1.0;
    float _4071 = _2897 * _4065;
    float _4073 = precise::clamp(_4071, 0.0, 1.0);
    float _4075 = _4069 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4077 = -_4073;
    float _4079 = fma(_4077, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4081 = _4075 * _2130;
    float _4083 = -_4075;
    float _4085 = _4083 + 1.0;
    float _4087 = _4085;
    float _4089 = _4073;
    float _4091 = _4063;
    if (!_4061)
    {
        _4029 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4093 = _4029;
    float _4095 = -_4063;
    float _4097 = fma(_4095, _4079, 1.0);
    float _4099 = precise::clamp(_4097, 0.0, 1.0);
    float _4101 = _2141 * _4081;
    float _4103 = _2643 * _4081;
    float _4105 = _2141 * _4085;
    float _4107 = _4099 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4109 = fma(_2639, _4101, _2135);
    float _4111 = fma(_2641, _4101, _2137);
    float _4113 = fma(_2141, _4103, _2139);
    float _4115 = _2223 * _2285;
    out.m_102.x = _4107;
    float _4117 = _4107;
    float _4119 = _4115;
    float _4121 = _4093;
    float _4123 = _4093;
    if (!_4061)
    {
        _4087 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4125 = _4087;
    float _4127 = _4115 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_104.x = _4109;
    out.m_104.y = _4111;
    out.m_104.z = _4113;
    out.m_104.w = _4105;
    float _4129 = _4125;
    float _4131 = _4125;
    if (!_4061)
    {
        _4089 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4133 = _4089;
    float _4135 = _4133;
    float _4137 = _4133;
    if (!_4061)
    {
        _4091 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4139 = _4091;
    float _4141 = _4139;
    float _4143 = _4139;
    if (!_4061)
    {
        _4117 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4145 = _4117;
    float _4147 = _4145;
    float _4149 = _4145;
    if (!_4061)
    {
        _4119 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4151 = _4119;
    bool _4153 = !_4061;
    float _4155 = _4151;
    float _4157 = _4151;
    if (!_4153)
    {
        bool _4159 = _2379 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4161 = isnan(_2379);
        bool _4163 = _4159 || _4161;
        bool _4165 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4167 = _4163 || _4165;
        if (!_4167)
        {
            float _4169 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4171 = _2379 + _4169;
            float _4173 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4175 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4173;
            float _4177 = 1.0 / _4175;
            float _4179 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4181 = _4179 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4183 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4185 = _4183 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4187 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4189 = _4187 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4191 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4193 = _4191 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4195 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4197 = _4195 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4199 = _4171 * _4177;
            float _4201 = precise::clamp(_4199, 0.0, 1.0);
            float _4203 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4205 = _4203 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4207 = fma(_4201, _4181, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4209 = fma(_4201, _4205, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4211 = fma(_4201, _4185, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4213 = fma(_4201, _4189, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4215 = fma(_4201, _4193, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4217 = fma(_4201, _4197, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4131 = _4207;
            _4149 = _4215;
            _4123 = _4209;
            _4143 = _4213;
            _4137 = _4211;
            _4157 = _4217;
            _4219 = true;
        }
        else
        {
            bool _4221 = _2379 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4223 = isnan(_2379);
            bool _4225 = _4221 || _4223;
            bool _4227 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4229 = _4225 || _4227;
            if (!_4229)
            {
                _4121 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4231 = _4121;
            _4123 = _4231;
            if (!_4229)
            {
                _4129 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4233 = _4129;
            _4131 = _4233;
            if (!_4229)
            {
                _4135 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4235 = _4135;
            _4137 = _4235;
            if (!_4229)
            {
                _4141 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4237 = _4141;
            _4143 = _4237;
            if (!_4229)
            {
                _4147 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4239 = _4147;
            _4149 = _4239;
            if (!_4229)
            {
                _4155 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4241 = _4155;
            bool _4243 = !_4229;
            _4157 = _4241;
            if (!_4243)
            {
                bool _4245 = _2379 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4247 = isnan(_2379);
                bool _4249 = _4245 || _4247;
                bool _4251 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4253 = _4249 || _4251;
                if (!_4253)
                {
                    float _4255 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4257 = _2379 + _4255;
                    float _4259 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4261 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4259;
                    float _4263 = 1.0 / _4261;
                    float _4265 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4267 = _4265 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4269 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4271 = _4269 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4273 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4275 = _4273 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4277 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4279 = _4277 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4281 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4283 = _4281 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4285 = _4257 * _4263;
                    float _4287 = precise::clamp(_4285, 0.0, 1.0);
                    float _4289 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4291 = _4289 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4293 = fma(_4287, _4267, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4295 = fma(_4287, _4291, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4297 = fma(_4287, _4271, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4299 = fma(_4287, _4275, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4301 = fma(_4287, _4279, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4303 = fma(_4287, _4283, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4131 = _4293;
                    _4149 = _4301;
                    _4123 = _4295;
                    _4143 = _4299;
                    _4137 = _4297;
                    _4157 = _4303;
                    _4219 = true;
                }
                else
                {
                    _4131 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4149 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4123 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4143 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4137 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4157 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4219 = false;
    float _4305 = _4131;
    float _4307 = _4149;
    float _4309 = _4123;
    float _4311 = _4143;
    float _4313 = _4137;
    float _4315 = _4157;
    float _4317 = fma(_4021, -0.5, 0.5);
    float _4319 = precise::clamp(_4317, 0.0, 1.0);
    float _4321 = -_4305;
    float _4323 = _4321 + _4307;
    float _4325 = _4127 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4327 = -_4309;
    float _4329 = _4327 + _4311;
    out.m_106.x = 0.0;
    float _4331 = fma(_4319, _4323, _4305);
    float _4333 = fma(_4319, _4329, _4309);
    out.m_59.x = _4325;
    float _4335 = -_4313;
    float _4337 = _4335 + _4315;
    float _4339 = _4331 * 0.586610972881317138671875;
    bool _4341 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4343 = fma(_4319, _4337, _4313);
    float _4345 = fma(_4333, 0.298911988735198974609375, _4339);
    bool _4347 = _2223 > 0.0;
    bool _4349 = isnan(_2223);
    bool _4351 = _4347 || _4349;
    bool _4353 = isnan(0.0);
    bool _4355 = _4351 || _4353;
    float _4357 = fma(_4343, 0.114477999508380889892578125, _4345);
    bool _4359 = _2285 <= 0.0;
    bool _4361 = !_4355;
    bool _4363 = _4359 || _4361;
    float _4365 = -_4357;
    float _4367 = _4333 + _4365;
    float _4369 = -_4357;
    float _4371 = _4331 + _4369;
    float _4373 = -_4357;
    float _4375 = _4343 + _4373;
    float _4377 = fma(_4367, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4357);
    float _4379 = fma(_4371, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4357);
    float _4381 = fma(_4375, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4357);
    bool _4383 = !_4341;
    if (!_4383)
    {
        float _4385 = -_1948;
        float _4387 = _4385 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4389 = -_1950;
        float _4391 = _4389 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4393 = -_1952;
        float _4395 = _4393 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4397 = _4387 * _4387;
        float _4399 = fma(_4391, _4391, _4397);
        float _4401 = fma(_4395, _4395, _4399);
        float _4403 = sqrt(_4401);
        float _4405 = rsqrt(_4401);
        float _4407 = -_4403;
        float _4409 = _4407 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4411 = _4409 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4413 = precise::clamp(_4411, 0.0, 1.0);
        float _4415 = _4391 * _4405;
        float _4417 = _4387 * _4405;
        float _4419 = abs(_4413);
        float _4421 = log2(_4419);
        float _4423 = _4395 * _4405;
        float _4425 = _4415 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4427 = _4021 * _4417;
        float _4429 = -_4417;
        float _4431 = -_4425;
        float _4433 = fma(_4429, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4431);
        float _4435 = fma(_4019, _4415, _4427);
        float _4437 = -_4423;
        float _4439 = fma(_4437, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4433);
        float _4441 = fma(_4027, _4423, _4435);
        float _4443 = precise::clamp(_4441, 0.0, 1.0);
        float _4445 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4447 = _4439 + _4445;
        float _4449 = _4421 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4451 = _4447 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4453 = precise::clamp(_4451, 0.0, 1.0);
        float _4455 = exp2(_4449);
        float _4457 = _4455 * _4453;
        float _4459 = _4443 * _4457;
        float _4461 = _4459 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4463 = _4459 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4465 = _4459 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_106.x = _4461;
        out.m_106.y = _4463;
        out.m_106.z = _4465;
    }
    out.m_82.x = _4377;
    out.m_82.y = _4379;
    out.m_82.z = _4381;
    if (!_4363)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_59.x = 0.0;
    float _4467 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4467;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4219 = false;
    bool _973 = false;
    bool _805 = false;
    bool _587 = false;
    bool _419 = false;
    bool _263 = false;
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
        float _4524 = as_type<float>(_141);
        out.gl_Position.z = _4524;
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
    float _161 = 0.0;
    if (_155)
    {
        float _163 = float(_125);
        _161 = _163;
    }
    float _165 = _161;
    bool _167 = _159 >= _165;
    bool _169 = !_155;
    bool _171 = _167 || _169;
    if (_171)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _173 = _135;
    if (_171)
    {
        out.m_59.x = 0.0;
    }
    if (_171)
    {
        float _175 = _173 * 5.0;
        _143 = as_type<int>(_175);
    }
    int _177 = _143;
    if (_171)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4592 = as_type<float>(_177);
        out.gl_Position.z = _4592;
    }
    if (_171)
    {
        return out;
    }
    float _179 = as_type<float>(int(gl_VertexIndex));
    float _181 = in.m_66.x;
    float _183 = in.m_66.y;
    float _185 = in.m_66.z;
    float _187 = in.m_68.x;
    float _189 = in.m_68.y;
    float _191 = in.m_68.z;
    float _193 = in.m_70.x;
    float _195 = in.m_70.y;
    float _197 = in.m_70.z;
    float _199 = in.m_72.x;
    float _201 = in.m_72.y;
    float _203 = in.m_72.z;
    int _205 = as_type<int>(_179) & 1;
    bool _207 = _205 != 0;
    int _209 = as_type<int>(_179) & 2;
    bool _211 = _209 != 0;
    bool _213 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _215 = !_207;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = !_211;
    float _221 = _219 ? (-0.5) : 0.5;
    float _223 = _183 * _189;
    float _225 = _183 * _195;
    float _227 = fma(_181, _187, _223);
    float _229 = _183 * _201;
    float _231 = fma(_181, _193, _225);
    float _233 = fma(_185, _191, _227);
    float _235 = fma(_181, _199, _229);
    float _237 = fma(_185, _197, _231);
    float _239 = fma(_185, _203, _235);
    bool _241 = !_213;
    float _243 = _239;
    float _261;
    if (!_241)
    {
        float _245 = in.m_74.x;
        float _247 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _249 = _245 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _251 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[12].x, _159);
        float _253 = _251 * _247;
        float _255 = floor(_253);
        float _257 = -_255;
        float _259 = _253 + _257;
        _261 = _259;
        _263 = true;
    }
    else
    {
        float _265 = float(_125);
        float _267 = 1.0 / _265;
        float _269 = _159 * _267;
        _261 = _269;
    }
    _263 = false;
    float _271 = _261;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = _271 + _273;
    bool _277 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _279 = isnan(_271);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _291 = _271 + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _299 = _297 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _301 = -_287;
    float _303 = _301 + 1.0;
    float _305 = in.m_76.x;
    float _307 = in.m_76.y;
    float _309 = 1.0 / _299;
    bool _311 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _313 = isnan(_271);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    bool _323 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _325 = 1.0 / _295;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _331 = _291 * _309;
    float _333 = fma(_329, _331, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _335 = _275 * _325;
    bool _337 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _339 = isnan(_271);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _345 = _341 || _343;
    float _347 = float(_345);
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _353;
    float _357 = _347 * _303;
    float _359 = -_347;
    float _361 = _359 + 1.0;
    float _363 = fma(_351, _335, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _365 = fma(_355, _335, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _367 = _321 * _361;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _371 = _369 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _373 = -_321;
    float _375 = _373 + 1.0;
    float _377 = _363 * _367;
    float _379 = _365 * _367;
    float _381 = fma(_371, _331, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _383 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[143].x, _377);
    float _385 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[143].y, _379);
    float _387 = fma(_381, _357, _383);
    float _389 = fma(_333, _357, _385);
    float _391 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[145].x, _387);
    float _393 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[145].y, _389);
    float _395 = _391 * _305;
    float _397 = _393 * _307;
    bool _399 = !_323;
    float _417;
    if (!_399)
    {
        float _401 = in.m_74.x;
        float _403 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _405 = _401 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _407 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[11].x, _159);
        float _409 = _407 * _403;
        float _411 = floor(_409);
        float _413 = -_411;
        float _415 = _409 + _413;
        _417 = _415;
        _419 = true;
    }
    else
    {
        float _421 = float(_125);
        float _423 = 1.0 / _421;
        float _425 = _159 * _423;
        _417 = _425;
    }
    _419 = false;
    float _427 = _417;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _431 = _427 + _429;
    bool _433 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _435 = isnan(_427);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _441 = _437 || _439;
    float _443 = float(_441);
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _447 = _427 + _445;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _449;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _457 = -_443;
    float _459 = _457 + 1.0;
    float _461 = 1.0 / _451;
    bool _463 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _465 = 1.0 / _455;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _467;
    float _471 = _431 * _461;
    bool _473 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _475 = isnan(_427);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _485;
    bool _489 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _491 = isnan(_427);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = fma(_469, _471, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _503 = fma(_487, _471, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _505 = _499 * _459;
    float _507 = -_499;
    float _509 = _507 + 1.0;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _511;
    float _515 = _447 * _465;
    float _517 = _483 * _509;
    float _519 = fma(_513, _471, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _521 = -_483;
    float _523 = _521 + 1.0;
    float _525 = _501 * _517;
    float _527 = _519 * _517;
    float _529 = _503 * _517;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _543 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[107].x, _527);
    float _545 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[107].y, _525);
    float _547 = fma(_533, _515, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _549 = fma(_537, _515, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _551 = fma(_541, _515, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _553 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[107].z, _529);
    float _555 = fma(_547, _505, _543);
    float _557 = fma(_549, _505, _545);
    float _559 = fma(_551, _505, _553);
    float _561 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[109].x, _555);
    float _563 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[109].y, _557);
    float _565 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[109].z, _559);
    bool _567 = !_463;
    float _585;
    if (!_567)
    {
        float _569 = in.m_74.x;
        float _571 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _573 = _569 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _575 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[11].y, _159);
        float _577 = _575 * _571;
        float _579 = floor(_577);
        float _581 = -_579;
        float _583 = _577 + _581;
        _585 = _583;
        _587 = true;
    }
    else
    {
        float _589 = float(_125);
        float _591 = 1.0 / _589;
        float _593 = _159 * _591;
        _585 = _593;
    }
    _587 = false;
    float _595 = _585;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _603 = _601 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _605 = 1.0 / _599;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _609 = _607 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _611;
    bool _615 = _595 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _617 = isnan(_595);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _631 = _595 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _633 = isnan(_595);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _639 = _635 || _637;
    float _641 = float(_639);
    float _643 = 1.0 / _603;
    bool _645 = _595 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _647 = isnan(_595);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = -_641;
    float _659 = _657 + 1.0;
    bool _661 = _595 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _663 = isnan(_595);
    bool _665 = _661 || _663;
    bool _667 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _669 = _665 || _667;
    float _671 = float(_669);
    bool _673 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _675 = _625 * _659;
    float _677 = 1.0 / _609;
    float _679 = _613 * _605;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _683 = _595 + _681;
    float _685 = fma(_679, _683, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _687 = -_625;
    float _689 = _687 + 1.0;
    float _691 = 1.0 / _629;
    float _693 = -_655;
    float _695 = _693 + 1.0;
    float _697 = _655 * _689;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _699;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _705 = _703 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _707 = _671 * _695;
    float _709 = -_671;
    float _711 = _709 + 1.0;
    float _713 = _701 * _643;
    float _715 = _705 * _677;
    float _717 = _685 * _707;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _721 = _595 + _719;
    bool _723 = _595 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _725 = isnan(_595);
    bool _727 = _723 || _725;
    bool _729 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _731 = _727 || _729;
    float _733 = float(_731);
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _737 = _735 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _741 = _595 + _739;
    float _743 = fma(_715, _721, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _745 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[115].x, _717);
    float _747 = _737 * _691;
    float _749 = fma(_713, _741, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _751 = -_733;
    float _753 = _751 + 1.0;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _757 = _595 + _755;
    float _759 = fma(_743, _697, _745);
    float _761 = _561 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _763 = _641 * _753;
    float _765 = fma(_747, _757, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _767 = fma(_749, _675, _759);
    float _769 = _565 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _771 = _761 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _773 = fma(_765, _763, _767);
    float _775 = _563 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _777 = _769 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _779 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[119].x, _773);
    float _781 = _775 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _783 = _779 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_78.x = _771;
    out.m_78.y = _781;
    out.m_78.z = _777;
    out.m_78.w = _783;
    bool _785 = !_673;
    float _803;
    if (!_785)
    {
        float _787 = in.m_74.x;
        float _789 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _791 = _787 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _793 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[11].z, _159);
        float _795 = _793 * _789;
        float _797 = floor(_795);
        float _799 = -_797;
        float _801 = _795 + _799;
        _803 = _801;
        _805 = true;
    }
    else
    {
        float _807 = float(_125);
        float _809 = 1.0 / _807;
        float _811 = _159 * _809;
        _803 = _811;
    }
    _805 = false;
    float _813 = _803;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _817 = _813 + _815;
    bool _819 = _813 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _821 = isnan(_813);
    bool _823 = _819 || _821;
    bool _825 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _827 = _823 || _825;
    float _829 = float(_827);
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _833 = _813 + _831;
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _835;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _841 = _839 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _843 = -_829;
    float _845 = _843 + 1.0;
    float _847 = 1.0 / _837;
    bool _849 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _851 = 1.0 / _841;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _853;
    float _857 = _817 * _847;
    bool _859 = _813 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _861 = isnan(_813);
    bool _863 = _859 || _861;
    bool _865 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _867 = _863 || _865;
    float _869 = float(_867);
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _871;
    bool _875 = _813 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _877 = isnan(_813);
    bool _879 = _875 || _877;
    bool _881 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _883 = _879 || _881;
    float _885 = float(_883);
    float _887 = fma(_855, _857, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _889 = fma(_873, _857, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _891 = _885 * _845;
    float _893 = -_885;
    float _895 = _893 + 1.0;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _897;
    float _901 = _833 * _851;
    float _903 = _869 * _895;
    float _905 = fma(_899, _857, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _907 = -_869;
    float _909 = _907 + 1.0;
    float _911 = _887 * _903;
    float _913 = _905 * _903;
    float _915 = _889 * _903;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _919 = _917 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _923 = _921 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _927 = _925 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _929 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[123].x, _913);
    float _931 = fma(_919, _901, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _933 = fma(_923, _901, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _935 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[123].y, _911);
    float _937 = fma(_927, _901, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _939 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[123].z, _915);
    float _941 = fma(_931, _891, _929);
    float _943 = fma(_933, _891, _935);
    float _945 = fma(_937, _891, _939);
    float _947 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[125].x, _941);
    float _949 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[125].y, _943);
    float _951 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[125].z, _945);
    bool _953 = !_849;
    float _971;
    if (!_953)
    {
        float _955 = in.m_74.x;
        float _957 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _959 = _955 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _961 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[11].w, _159);
        float _963 = _961 * _957;
        float _965 = floor(_963);
        float _967 = -_965;
        float _969 = _963 + _967;
        _971 = _969;
        _973 = true;
    }
    else
    {
        float _975 = float(_125);
        float _977 = 1.0 / _975;
        float _979 = _159 * _977;
        _971 = _979;
    }
    _973 = false;
    float _981 = _971;
    float _983 = in.m_56.x;
    float _985 = in.m_56.y;
    float _987 = in.m_56.z;
    float _989 = _395 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _991 = in.m_70.w;
    float _993 = _989 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _995 = in.m_68.w;
    float _997 = in.m_72.w;
    float _999 = _195 * _985;
    float _1001 = _189 * _985;
    float _1003 = _201 * _985;
    float _1005 = fma(_193, _983, _999);
    float _1007 = fma(_187, _983, _1001);
    float _1009 = fma(_199, _983, _1003);
    float _1011 = fma(_197, _987, _1005);
    float _1013 = fma(_191, _987, _1007);
    float _1015 = fma(_203, _987, _1009);
    float _1017 = _1011 + _991;
    float _1019 = _1013 + _995;
    float _1021 = _1015 + _997;
    float _1023 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1025 = _1017 + _1023;
    float _1027 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1029 = _1019 + _1027;
    float _1031 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1033 = _1021 + _1031;
    float _1035 = _1025 * _1025;
    float _1037 = fma(_1029, _1029, _1035);
    float _1039 = fma(_1033, _1033, _1037);
    float _1041 = sqrt(_1039);
    float _1043 = rsqrt(_1039);
    float _1045 = _1041 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1047 = precise::min(_993, _1045);
    float _1049 = _1043 * _1047;
    float _1051 = _1029 * _1049;
    float _1053 = _1033 * _1049;
    float _1055 = -_1051;
    float _1057 = _1019 + _1055;
    float _1059 = -_1053;
    float _1061 = _1021 + _1059;
    float _1063 = fma(_1057, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1065 = fma(_1061, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1067 = floor(_1063);
    float _1069 = floor(_1065);
    float _1071 = -_1067;
    float _1073 = _1063 + _1071;
    float _1075 = -_1069;
    float _1077 = _1065 + _1075;
    float2 _6020 = float2(_1073, _1077);
    float _1079 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6020, float2(0.0), isnan(_6020)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6020, float2(0.0), isnan(_6020)), level(0.0)).x;
    float _1081 = -_1017;
    float _1083 = _1081 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1085 = -_1019;
    float _1087 = _1085 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1089 = _1083 * _1083;
    float _1091 = _1025 * _1049;
    float _1093 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1095 = -_1021;
    float _1097 = _1095 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1099 = fma(_1087, _1087, _1089);
    float _1101 = -_1091;
    float _1103 = _1025 + _1101;
    float _1105 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1093);
    float _1107 = fma(_1097, _1097, _1099);
    float _1109 = _1103 * _1103;
    float _1111 = -_1091;
    float _1113 = _1017 + _1111;
    float _1115 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1105);
    float _1117 = rsqrt(_1107);
    float _1119 = _1113 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1121 = -_1051;
    float _1123 = _1029 + _1121;
    float _1125 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1127 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1119);
    float _1129 = -_1053;
    float _1131 = _1033 + _1129;
    float _1133 = fma(_1123, _1123, _1109);
    float _1135 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1125);
    float _1137 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1127);
    float _1139 = rsqrt(_1115);
    float _1141 = fma(_1131, _1131, _1133);
    float _1143 = _397 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1145 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1135);
    float _1147 = _1137 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1149 = _1113 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1151 = _1087 * _1117;
    float _1153 = _1097 * _1117;
    float _1155 = 1.0 / _1147;
    float _1157 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1149);
    float _1159 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1161 = _1151 * _1159;
    float _1163 = _1083 * _1117;
    float _1165 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1167 = _1153 * _1165;
    float _1169 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1157);
    float _1171 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1173 = -_1161;
    float _1175 = fma(_1153, _1171, _1173);
    float _1177 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1179 = _1163 * _1177;
    float _1181 = sqrt(_1141);
    float _1183 = _1169 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1185 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1187 = -_1167;
    float _1189 = fma(_1163, _1185, _1187);
    float _1191 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1193 = -_1179;
    float _1195 = fma(_1151, _1191, _1193);
    float _1197 = _1183 + _1147;
    float _1199 = _221 * _1139;
    float _1201 = rsqrt(_1145);
    float _1203 = _1175 * _1175;
    float _1205 = _1197 * _1155;
    float _1207 = _1205 * 0.5;
    float _1209 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1211 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1199);
    float _1213 = fma(_1189, _1189, _1203);
    float _1215 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1217 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1215);
    float _1219 = _1113 + _1209;
    float _1221 = _1043 * _1181;
    float _1223 = fma(_1195, _1195, _1213);
    float _1225 = _1219 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1227 = 1.0 / _1217;
    float _1229 = _1219 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1231 = _1143 * _1221;
    float _1233 = fma(_1057, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1225);
    float _1235 = _217 * _1201;
    float _1237 = fma(_1057, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1229);
    float _1239 = _1231 * _1211;
    float _1241 = fma(_1061, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1233);
    float _1243 = rsqrt(_1223);
    float _1245 = fma(_1061, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1237);
    float _1247 = _989 * _1221;
    float _1249 = _1241 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1251 = _1221 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1253 = _1251 * 0.5;
    float _1255 = _1245 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1257 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1259 = _1227 * _1257;
    float _1261 = trunc(_1249);
    int _1263 = int(_1261);
    bool _1265 = _1259 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1267 = _1259 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1269 = _1189 * _1243;
    float _1271 = _1175 * _1243;
    float _1273 = _1195 * _1243;
    float _1275 = trunc(_1255);
    int _1277 = int(_1275);
    float _1279 = _1163 * _1269;
    float _1281 = _1153 * _1271;
    float _1283 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1235);
    bool _1285 = !_1265;
    int _1287 = _1285 ? 0 : 1;
    float _1289 = -_1279;
    float _1291 = fma(_1151, _1271, _1289);
    float _1293 = -_1281;
    float _1295 = fma(_1163, _1273, _1293);
    float _1297 = _1247 * _1283;
    int _1299 = 2;
    float _1301 = _1219;
    if (!_1265)
    {
        _1299 = 1;
    }
    int _1303 = _1299;
    float _1305 = _1239 * _1291;
    float _1307 = _1239 * _1295;
    int _1309 = _1303;
    if (!_1267)
    {
        _1309 = _1287;
    }
    int _1311 = _1309;
    float _1313 = fma(_1297, _1273, _1305);
    float _1315 = fma(_1297, _1269, _1307);
    int _1317 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1319 = _1263 + _1317;
    int _1321 = _1319 + 1;
    float _1323 = fma(_1253, _1153, _1313);
    int _1325 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1327 = _1277 + _1325;
    int _1329 = _1327 + 1;
    float _1331 = fma(_1253, _1151, _1315);
    int _1333 = _1311 << 6;
    float _1335 = _1021 + _1323;
    bool _1337 = _1321 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1339 = _1019 + _1331;
    int _1341 = _1321 | _1329;
    float _1343 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1345 = _1335 + _1343;
    int _1347 = _1333 + 48;
    uint _1350 = uint(int(uint(_1347) >> uint(2)));
    uint _1352 = uint(int(uint(int(_1350)) >> uint(2)));
    int _1354 = int(_1350) & 3;
    float _1356 = (*spvDescriptorSet0.vp_c15)._m0[int(_1352)][_1354];
    int _1358 = int(_1350) + 1;
    uint _1360 = uint(int(uint(_1358) >> uint(2)));
    int _1362 = _1358 & 3;
    float _1364 = (*spvDescriptorSet0.vp_c15)._m0[int(_1360)][_1362];
    bool _1366 = _1341 < 0;
    bool _1368 = _1366 || _1337;
    float _1370 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1372 = _1339 + _1370;
    float _1374 = _1345 * _1345;
    bool _1376 = _1329 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1378 = _1376 || _1368;
    int _1380 = _1333 + 56;
    uint _1382 = uint(int(uint(_1380) >> uint(2)));
    uint _1384 = uint(int(uint(int(_1382)) >> uint(2)));
    int _1386 = int(_1382) & 3;
    float _1388 = (*spvDescriptorSet0.vp_c15)._m0[int(_1384)][_1386];
    int _1390 = int(_1382) + 1;
    uint _1392 = uint(int(uint(_1390) >> uint(2)));
    int _1394 = _1390 & 3;
    float _1396 = (*spvDescriptorSet0.vp_c15)._m0[int(_1392)][_1394];
    float _1398 = fma(_1372, _1372, _1374);
    float _1400 = _1151 * _1273;
    int _1402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1404 = _1402 != 0;
    int _1406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1408 = _1406 != 0;
    int _1410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1412 = _1410 != 0;
    float _1414 = sqrt(_1398);
    float _1416 = -_1400;
    float _1418 = fma(_1153, _1269, _1416);
    int _1420 = int(_1368);
    int _1422 = _1265 ? 2 : 0;
    int _1424 = _1420 | _1422;
    int _1426 = _1378 ? 4 : 0;
    int _1428 = _1424 | _1426;
    int _1430 = false ? 8 : 0;
    int _1432 = _1428 | _1430;
    int _1434 = _1404 ? 16 : 0;
    int _1436 = _1432 | _1434;
    int _1438 = _1408 ? 32 : 0;
    int _1440 = _1436 | _1438;
    int _1442 = _1412 ? 64 : 0;
    int _1444 = _1440 | _1442;
    int _1446 = _1444 & 4;
    int _1448 = _1333 + 64;
    uint _1450 = uint(int(uint(_1448) >> uint(2)));
    uint _1452 = uint(int(uint(int(_1450)) >> uint(2)));
    int _1454 = int(_1450) & 3;
    float _1456 = (*spvDescriptorSet0.vp_c15)._m0[int(_1452)][_1454];
    int _1458 = int(_1450) + 1;
    uint _1460 = uint(int(uint(_1458) >> uint(2)));
    int _1462 = _1458 & 3;
    float _1464 = (*spvDescriptorSet0.vp_c15)._m0[int(_1460)][_1462];
    float _1466 = _1239 * _1418;
    int _1468 = _1321;
    int _1470 = _1329;
    int _1472 = _1446;
    float _1474 = _1339;
    float _1476 = _1335;
    float _1478 = as_type<float>(_1311);
    float _1480 = as_type<float>(_1333);
    if (!_1378)
    {
        int _1482 = _1329 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1484 = _1482 + _1321;
        _1468 = _1484;
    }
    int _1486 = _1468;
    float _1488 = fma(_1297, _1271, _1466);
    bool _1490 = !_1408;
    int _1492 = _1490 ? 0 : 1;
    int _1494 = _1333 + 72;
    uint _1496 = uint(int(uint(_1494) >> uint(2)));
    uint _1498 = uint(int(uint(int(_1496)) >> uint(2)));
    int _1500 = int(_1496) & 3;
    float _1502 = (*spvDescriptorSet0.vp_c15)._m0[int(_1498)][_1500];
    int _1504 = int(_1496) + 1;
    uint _1506 = uint(int(uint(_1504) >> uint(2)));
    int _1508 = _1504 & 3;
    float _1510 = (*spvDescriptorSet0.vp_c15)._m0[int(_1506)][_1508];
    bool _1512 = _1446 != 0;
    float _1514 = fma(_1253, _1163, _1488);
    bool _1516 = !_1404;
    int _1518 = _1516 ? 0 : 1;
    bool _1520 = _1414 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1522 = _1017 + _1514;
    int _1524 = _1333 + 96;
    uint _1526 = uint(int(uint(_1524) >> uint(2)));
    uint _1528 = uint(int(uint(int(_1526)) >> uint(2)));
    int _1530 = int(_1526) & 3;
    float _1532 = (*spvDescriptorSet0.vp_c15)._m0[int(_1528)][_1530];
    int _1534 = int(_1526) + 1;
    uint _1536 = uint(int(uint(_1534) >> uint(2)));
    int _1538 = _1534 & 3;
    float _1540 = (*spvDescriptorSet0.vp_c15)._m0[int(_1536)][_1538];
    int _1542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1544 = _1542 != 0;
    int _1546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1548 = _1546 != 0;
    int _1550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1552 = _1550 != 0;
    int _1554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1556 = _1554 != 0;
    if (!_1512)
    {
        int _1558 = _1486 << 2;
        _1470 = _1558;
    }
    int _1560 = _1470;
    int _1562 = _1333 + 104;
    uint _1564 = uint(int(uint(_1562) >> uint(2)));
    uint _1566 = uint(int(uint(int(_1564)) >> uint(2)));
    int _1568 = int(_1564) & 3;
    float _1570 = (*spvDescriptorSet0.vp_c15)._m0[int(_1566)][_1568];
    int _1572 = int(_1564) + 1;
    uint _1574 = uint(int(uint(_1572) >> uint(2)));
    int _1576 = _1572 & 3;
    float _1578 = (*spvDescriptorSet0.vp_c15)._m0[int(_1574)][_1576];
    int _1580 = _1560;
    if (!_1512)
    {
        uint _1582 = uint(int(uint(_1486) >> uint(2)));
        _1472 = int(_1582);
    }
    int _1584 = _1472;
    if (!_1512)
    {
        int _1586 = 12 & _1560;
        _1580 = _1586;
    }
    int _1588 = _1580;
    bool _1590 = !_1548;
    int _1592 = _1590 ? 0 : 1;
    int _1594 = 0;
    if (!_1512)
    {
        int _1596 = _1584 << 4;
        int _1598 = _1596 + _1588;
        _1594 = _1598;
    }
    int _1600 = _1594;
    bool _1602 = !_1412;
    int _1604 = _1602 ? 0 : 1;
    bool _1606 = !_1544;
    int _1608 = _1606 ? 0 : 1;
    bool _1610 = !_1552;
    int _1612 = _1610 ? 0 : 1;
    bool _1614 = !_1556;
    int _1616 = _1614 ? 0 : 1;
    float _1618 = 0.0;
    if (!_1520)
    {
        _1618 = _1522;
    }
    float _1620 = _1618;
    bool _1622 = !_1520;
    float _1624 = _1620;
    float _1626 = _1356;
    float _1628 = _1456;
    if (!_1622)
    {
        float _1630 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1632 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1634 = _1414 + _1632;
        float _1636 = rsqrt(_1398);
        float _1638 = _1634 * _1630;
        float _1640 = _1522 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1642 = _1638 * 0.15915493667125701904296875;
        float _1644 = _1642 * 6.283185482025146484375;
        float _1646 = cos(_1644);
        float _1648 = _1642 * 6.283185482025146484375;
        float _1650 = sin(_1648);
        float _1652 = _1646 + (-1.0);
        float _1654 = fma(_1650, _1640, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1656 = _1652 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1658 = _1636 * _1654;
        float _1660 = fma(_1522, _1646, _1656);
        float _1662 = fma(_1372, _1658, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1664 = fma(_1345, _1658, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1624 = _1660;
        _1474 = _1662;
        _1476 = _1664;
    }
    float _1666 = _1624;
    float _1668 = _1474;
    float _1670 = _1476;
    float _1672 = -_1017;
    float _1674 = _1672 + _1666;
    float _1676 = -_1019;
    float _1678 = _1676 + _1668;
    int _1680 = _1333 + 80;
    uint _1682 = uint(int(uint(_1680) >> uint(2)));
    uint _1684 = uint(int(uint(int(_1682)) >> uint(2)));
    int _1686 = int(_1682) & 3;
    float _1688 = (*spvDescriptorSet0.vp_c15)._m0[int(_1684)][_1686];
    int _1690 = int(_1682) + 1;
    uint _1692 = uint(int(uint(_1690) >> uint(2)));
    int _1694 = _1690 & 3;
    float _1696 = (*spvDescriptorSet0.vp_c15)._m0[int(_1692)][_1694];
    float _1698 = -_1021;
    float _1700 = _1698 + _1670;
    float _1702 = _1674 * _1674;
    float _1704 = _1219 * _1540;
    float _1706 = _1219 * _1364;
    float _1708 = _1219 * _1464;
    float _1710 = fma(_1678, _1678, _1702);
    float _1712 = fma(_1057, _1532, _1704);
    int _1714 = _1333 + 88;
    uint _1716 = uint(int(uint(_1714) >> uint(2)));
    uint _1718 = uint(int(uint(int(_1716)) >> uint(2)));
    int _1720 = int(_1716) & 3;
    float _1722 = (*spvDescriptorSet0.vp_c15)._m0[int(_1718)][_1720];
    int _1724 = int(_1716) + 1;
    uint _1726 = uint(int(uint(_1724) >> uint(2)));
    int _1728 = _1724 & 3;
    float _1730 = (*spvDescriptorSet0.vp_c15)._m0[int(_1726)][_1728];
    float _1732 = _1702;
    if (!_1512)
    {
        float _1734 = floor(_1249);
        _1732 = _1734;
    }
    float _1736 = _1732;
    float _1738 = fma(_1700, _1700, _1710);
    float _1740 = fma(_1061, _1570, _1712);
    float _1742 = fma(_1057, _1356, _1706);
    float _1744 = fma(_1057, _1456, _1708);
    float _1746 = -_1051;
    float _1748 = _1746 + _1668;
    float _1750 = _1740 + _1578;
    float _1752 = _1019;
    float _1754 = _1742;
    float _1756 = _1744;
    if (!_1512)
    {
        int _1758 = _1600 + 400;
        uint _1760 = uint(int(uint(_1758) >> uint(2)));
        uint _1762 = uint(int(uint(int(_1760)) >> uint(2)));
        int _1764 = int(_1760) & 3;
        float _1766 = (*spvDescriptorSet0.vp_c15)._m0[int(_1762)][_1764];
        _1752 = _1766;
    }
    float _1768 = _1752;
    float _1770 = sqrt(_1738);
    float _1772 = -_1091;
    float _1774 = _1772 + _1666;
    float _1776 = -_1053;
    float _1778 = _1776 + _1670;
    float _1780 = fma(_1061, _1388, _1742);
    float _1782 = fma(_1061, _1502, _1744);
    bool _1784 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1786 = isnan(0.5);
    bool _1788 = _1784 || _1786;
    bool _1790 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1792 = _1788 || _1790;
    float _1794 = _1780 + _1396;
    float _1796 = _1712;
    if (!_1512)
    {
        float _1798 = floor(_1255);
        _1796 = _1798;
    }
    float _1800 = _1796;
    float _1802 = _1782 + _1510;
    bool _1804 = _1770 > 0.0;
    float _1806 = 1.0 / _1750;
    if (!_1804)
    {
        _1626 = _1748;
    }
    float _1808 = _1626;
    float _1810 = _1808;
    if (!_1804)
    {
        _1754 = _1774;
    }
    float _1812 = _1754;
    float _1814 = _1812;
    if (!_1804)
    {
        _1756 = _1778;
    }
    float _1816 = _1756;
    bool _1818 = !_1804;
    float _1820 = _1816;
    float _1822 = _1816;
    if (!_1818)
    {
        float _1824 = _237 * _237;
        float _1826 = fma(_233, _233, _1824);
        float _1828 = fma(_239, _239, _1826);
        float _1830 = rsqrt(_1738);
        float _1832 = sqrt(_1828);
        float _1834 = _1678 * _1830;
        float _1836 = _1674 * _1830;
        float _1838 = _1700 * _1830;
        bool _1840 = _1832 > 0.0;
        float _1842 = _1832;
        float _1844 = _1830;
        if (!_1840)
        {
            _1842 = _1748;
        }
        float _1846 = _1842;
        _1810 = _1846;
        if (!_1840)
        {
            _1844 = _1774;
        }
        float _1848 = _1844;
        _1814 = _1848;
        if (!_1840)
        {
            _1820 = _1778;
        }
        float _1850 = _1820;
        bool _1852 = !_1840;
        _1822 = _1850;
        if (!_1852)
        {
            float _1854 = rsqrt(_1828);
            float _1856 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1858 = _237 * _1854;
            float _1860 = _233 * _1854;
            float _1862 = _1836 * _1858;
            float _1864 = _239 * _1854;
            float _1866 = fma(_1834, _1860, _1862);
            float _1868 = _1856 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1870 = fma(_1838, _1864, _1866);
            float _1872 = _1870 * _1868;
            float _1874 = fma(_233, _1872, _1748);
            float _1876 = fma(_237, _1872, _1774);
            float _1878 = fma(_239, _1872, _1778);
            _1822 = _1878;
            _1810 = _1874;
            _1814 = _1876;
            _1628 = _1856;
        }
    }
    float _1880 = _1822;
    float _1882 = _1810;
    float _1884 = _1814;
    float _1886 = _1628;
    float _1888 = _1884;
    float _1890 = _1882;
    float _1892 = _1886;
    if (_1792)
    {
        _243 = _1880;
    }
    float _1894 = _243;
    float _1896 = _1894;
    if (!_1792)
    {
        float _1898 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1900 = _1113 + _1898;
        float _1902 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1904 = _1057 + _1902;
        float _1906 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1908 = -_1061;
        float _1910 = _1908 + _1880;
        float _1912 = _1900 * _1900;
        float _1914 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1916 = _1061 + _1914;
        float _1918 = fma(_1904, _1904, _1912);
        float _1920 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1922 = fma(_1916, _1916, _1918);
        float _1924 = sqrt(_1922);
        float _1926 = _1906 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1928 = precise::min(_1924, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1930 = _1928 * _1920;
        float _1932 = -_1057;
        float _1934 = _1932 + _1882;
        float _1936 = _1926 * _1930;
        float _1938 = -_1113;
        float _1940 = _1938 + _1884;
        float _1942 = fma(_1934, _1936, _1057);
        float _1944 = fma(_1940, _1936, _1113);
        float _1946 = fma(_1910, _1936, _1061);
        _1888 = _1944;
        _1890 = _1942;
        _1896 = _1946;
        _1892 = _1920;
    }
    float _1948 = _1888;
    float _1950 = _1890;
    float _1952 = _1896;
    float _1954 = _1892;
    float _1956 = _1948 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1958 = _1802 * _1806;
    float _1960 = _1794 * _1806;
    float _1962 = _1948 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1964 = _1948 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1966 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1956);
    float _1968 = _1954;
    if (!_1512)
    {
        float _1970 = rint(_1768);
        float _1972 = precise::max(_1970, 0.0);
        uint _1974 = uint(_1972);
        uint _1976 = clamp(_1974, 0u, 65535u);
        _1968 = as_type<float>(_1976);
    }
    float _1978 = _1968;
    float _1980 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1962);
    float _1982 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1964);
    bool _1984 = _1960 >= 0.0;
    float _1986 = fma(_1952, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1966);
    float _1988 = fma(_1952, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1980);
    float _1990 = fma(_1952, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1982);
    bool _1992 = _1960 <= 1.0;
    bool _1994 = _1992 && _1984;
    float _1996 = _1948 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1998 = _1986 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2000 = _1988 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2002 = _1990 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2004 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1996);
    float _2006 = _1998 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2008 = _1958 >= 0.0;
    bool _2010 = _2008 && _1994;
    float _2012 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2014 = _2000 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2016 = fma(_1952, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2004);
    float _2018 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2006);
    bool _2020 = _1958 <= 1.0;
    bool _2022 = _2020 && _2010;
    float _2024 = -_2014;
    float _2026 = fma(_2024, _2012, 1.0);
    float _2028 = _2016 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2030 = fma(_2000, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2018);
    float _2032 = _1219 * _1696;
    float _2034 = log2(_2026);
    float _2036 = _1998 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2038 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2030);
    float _2040 = _1998 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2042 = fma(_1057, _1688, _2032);
    float _2044 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2036);
    float _2046 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2040);
    float _2048 = 1.0 / _2038;
    float _2050 = _2030;
    float _2052 = _2026;
    float _2054 = _2046;
    if (_2022)
    {
        float _2056 = float(_1311);
        _2050 = _2056;
    }
    float _2058 = _2050;
    float _2060 = fma(_1061, _1722, _2042);
    float _2062 = fma(_2000, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2044);
    float _2064 = fma(_2000, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2046);
    if (!_1512)
    {
        float _2066 = -_1800;
        float _2068 = _1255 + _2066;
        _2052 = _2068;
    }
    float _2070 = _2052;
    float _2072 = _2060 + _1730;
    float _2074 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2062);
    float _2076 = _2058;
    float _2078 = _2074;
    if (_2022)
    {
        float _2080 = rint(_2058);
        float _2082 = precise::max(_2080, 0.0);
        uint _2084 = uint(_2082);
        uint _2086 = clamp(_2084, 0u, 65535u);
        _2076 = as_type<float>(_2086);
    }
    float _2088 = _2076;
    float _2090 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2064);
    float _2092 = _2034 * 0.693147182464599609375;
    if (!_1512)
    {
        float _2094 = -_1736;
        float _2096 = _1249 + _2094;
        _2054 = _2096;
    }
    float _2098 = _2054;
    float _2100 = _2072 * _1806;
    float _2102 = _2092 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2104 = _2074 * _2048;
    float _2106 = _2090 * _2048;
    float _2108 = _2070;
    float _2110 = _2048;
    if (!_1512)
    {
        float3 _7691 = float3(_2098, _2070, float(as_type<int>(_1978)));
        float3 _7695 = select(_7691, float3(0.0), isnan(_7691));
        float _2112 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7695.xy, uint(rint(_7695.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7695.xy, uint(rint(_7695.z)), level(0.0)).x;
        _2108 = _2112;
    }
    float _2114 = _2108;
    float _2116 = fma(_2104, 0.5, 0.5);
    float _2118 = fma(_2106, -0.5, 0.5);
    float _2120 = _1958;
    float _2122 = _2118;
    float _2124 = _2116;
    if (_2022)
    {
        float3 _7716 = float3(_1960, _1958, float(as_type<int>(_2088)));
        float3 _7718 = select(_7716, float3(0.0), isnan(_7716));
        float _2126 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7718.xy, uint(rint(_7718.z)), _2100, level(0.0));
        _2120 = _2126;
    }
    float _2128 = _2120;
    float3 _7728 = float3(_2116, _2118, _2102);
    float _2130 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7728, float3(0.0), isnan(_7728)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7728, float3(0.0), isnan(_7728)), level(0.0)).x;
    float3 _7737 = float3(_2116, _2118, _2102);
    float4 _2133 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7737, float3(0.0), isnan(_7737)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7737, float3(0.0), isnan(_7737)), level(0.0)).xyzw;
    float _2135 = _2133.x;
    float _2137 = _2133.y;
    float _2139 = _2133.z;
    float _2141 = _2133.w;
    bool _2143 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2145 = isnan(0.5);
    bool _2147 = _2143 || _2145;
    bool _2149 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2151 = _2147 || _2149;
    float _2153 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_1512)
    {
        _2110 = 1.0;
    }
    float _2155 = _2110;
    int _2157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2159 = _2157 != 0;
    float _2161 = _2155;
    if (_2151)
    {
        _2153 = 1.0;
    }
    float _2163 = _2153;
    float _2165 = _2163;
    if (_2151)
    {
        _1478 = 1.0;
    }
    float _2167 = _1478;
    float _2169 = _2167;
    if (!_2151)
    {
        float _2171 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2173 = _2171 * 0.15915493667125701904296875;
        float _2175 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2177 = _2173 * 6.283185482025146484375;
        float _2179 = cos(_2177);
        float _2181 = _2175 * 0.15915493667125701904296875;
        float _2183 = _2173 * 6.283185482025146484375;
        float _2185 = sin(_2183);
        float _2187 = 1.0 / _2179;
        float _2189 = _2181 * 6.283185482025146484375;
        float _2191 = cos(_2189);
        float _2193 = _2185 * _2187;
        float _2195 = _2181 * 6.283185482025146484375;
        float _2197 = sin(_2195);
        float _2199 = _2191 * _2193;
        float _2201 = 1.0 / _2199;
        float _2203 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2205 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2203;
        float _2207 = 1.0 / _2205;
        float _2209 = _2197 * _2201;
        float _2211 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2213 = fma(_1259, _2209, _2211);
        float _2215 = _2213 * _2207;
        float _2217 = precise::clamp(_2215, 0.0, 1.0);
        _2122 = _2173;
        _2124 = _2181;
        _2169 = _2217;
    }
    float _2219 = _2122;
    float _2221 = _2124;
    float _2223 = _2169;
    float _2225 = _2221;
    float _2227 = _2219;
    if (!_2151)
    {
        float _2229 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2231 = _2229 * 0.15915493667125701904296875;
        float _2233 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2235 = _2231 * 6.283185482025146484375;
        float _2237 = cos(_2235);
        float _2239 = _2233 * 0.15915493667125701904296875;
        float _2241 = _2231 * 6.283185482025146484375;
        float _2243 = sin(_2241);
        float _2245 = 1.0 / _2237;
        float _2247 = _2239 * 6.283185482025146484375;
        float _2249 = cos(_2247);
        float _2251 = _2243 * _2245;
        float _2253 = _2239 * 6.283185482025146484375;
        float _2255 = sin(_2253);
        float _2257 = _2249 * _2251;
        float _2259 = 1.0 / _2257;
        float _2261 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2263 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2261;
        float _2265 = 1.0 / _2263;
        float _2267 = _2255 * _2259;
        float _2269 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2271 = fma(_1259, _2267, _2269);
        float _2273 = _2271 * _2265;
        float _2275 = precise::clamp(_2273, 0.0, 1.0);
        float _2277 = -_2275;
        float _2279 = _2277 + 1.0;
        _2225 = _2257;
        _2227 = _2245;
        _2165 = _2279;
    }
    float _2281 = _2225;
    float _2283 = _2227;
    float _2285 = _2165;
    float _2287 = _2283;
    if (!_1512)
    {
        int _2289 = _1486 << 4;
        int _2291 = _2289 + 2048;
        uint _2293 = uint(int(uint(_2291) >> uint(2)));
        uint _2295 = uint(int(uint(int(_2293)) >> uint(2)));
        int _2297 = int(_2293) & 3;
        float _2299 = (*spvDescriptorSet0.vp_c15)._m0[int(_2295)][_2297];
        int _2301 = int(_2293) + 1;
        uint _2303 = uint(int(uint(_2301) >> uint(2)));
        int _2305 = _2301 & 3;
        float _2307 = (*spvDescriptorSet0.vp_c15)._m0[int(_2303)][_2305];
        int _2309 = _2291 + 8;
        uint _2311 = uint(int(uint(_2309) >> uint(2)));
        uint _2313 = uint(int(uint(int(_2311)) >> uint(2)));
        int _2315 = int(_2311) & 3;
        float _2317 = (*spvDescriptorSet0.vp_c15)._m0[int(_2313)][_2315];
        int _2319 = int(_2311) + 1;
        uint _2321 = uint(int(uint(_2319) >> uint(2)));
        int _2323 = _2319 & 3;
        float _2325 = (*spvDescriptorSet0.vp_c15)._m0[int(_2321)][_2323];
        float _2327 = _1219 * _2307;
        float _2329 = fma(_1057, _2299, _2327);
        float _2331 = fma(_1061, _2317, _2329);
        float _2333 = _2331 + _2325;
        float _2335 = precise::clamp(_2333, 0.0, 1.0);
        float _2337 = -_2335;
        float _2339 = _2337 + _2114;
        float _2341 = fma(_2339, 500.0, 1.5);
        float _2343 = exp2(_2341);
        float _2345 = 0.0 + _2343;
        float _2347 = precise::clamp(_2345, 0.0, 1.0);
        _2161 = _2347;
    }
    float _2349 = _2161;
    float _2351 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2353 = _1948 + _2351;
    float _2355 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2357 = _1950 + _2355;
    float _2359 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2361 = _1952 + _2359;
    float _2363 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _2365 = int(_2363);
    float _2367 = _2353 * _2353;
    float _2369 = fma(_2357, _2357, _2367);
    float _2371 = fma(_2361, _2361, _2369);
    float _2373 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2375 = _2373 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2377 = rsqrt(_2371);
    float _2379 = sqrt(_2371);
    float _2381 = _2377 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2383 = 1.0 / _2375;
    float _2385 = _2357 * _2381;
    float _2387 = _2361 * _2381;
    float _2389 = _2385 * _2385;
    float _2391 = _2387 * _2387;
    float _2393 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _2395 = int(_2393);
    float _2397 = _2389 + _2391;
    float _2399 = sqrt(_2397);
    float _2401 = float(_2395);
    float _2403 = 1.0 / _2401;
    bool _2405 = _2399 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2407 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2409 = _2399 + _2407;
    float _2411 = _159 * _2403;
    float _2413 = _2377;
    float _2415 = _2409;
    float _2417 = _2353;
    float _2419 = _2397;
    float _2421 = _2389;
    if (_2405)
    {
        float _2423 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2413 = _2423;
    }
    float _2425 = _2413;
    if (_2405)
    {
        float _2427 = rsqrt(_2397);
        _2287 = _2427;
    }
    float _2429 = _2287;
    if (_2405)
    {
        float _2431 = _2409 * _2425;
        _2415 = _2431;
    }
    float _2433 = _2415;
    float _2435 = trunc(_2411);
    int _2437 = int(_2435);
    if (_2405)
    {
        float _2439 = _2433 * 0.15915493667125701904296875;
        _1301 = _2439;
    }
    float _2441 = _1301;
    float _2443 = _2425;
    if (_2405)
    {
        float _2445 = _2441 * 6.283185482025146484375;
        float _2447 = sin(_2445);
        _2443 = _2447;
    }
    float _2449 = _2443;
    float _2451 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2453 = precise::max(0.0, _2451);
    float _2455 = _2281;
    float _2457 = _2453;
    if (_2405)
    {
        float _2459 = _2441 * 6.283185482025146484375;
        float _2461 = cos(_2459);
        _2455 = _2461;
    }
    float _2463 = _2455;
    float _2465 = -_2381;
    float _2467 = -_2453;
    float _2469 = fma(_2353, _2465, _2467);
    if (_2405)
    {
        float _2471 = _2469 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2457 = _2471;
    }
    float _2473 = _2457;
    float _2475 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2477 = int(_2475);
    float _2479 = _2473;
    float _2481 = _2449;
    if (_2405)
    {
        float _2483 = fma(_2449, _2473, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2479 = _2483;
    }
    float _2485 = _2479;
    float _2487 = _2485;
    if (!_2405)
    {
        _2481 = _2385;
    }
    float _2489 = _2481;
    float _2491 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2493 = fma(_2379, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2491);
    float _2495 = precise::clamp(_2493, 0.0, 1.0);
    float _2497 = _2489;
    if (_2405)
    {
        float _2499 = _2429 * _2485;
        _1480 = _2499;
    }
    float _2501 = _1480;
    float _2503 = _2463;
    if (_2405)
    {
        float _2505 = _2463 + (-1.0);
        _2417 = _2505;
    }
    float _2507 = _2417;
    float _2509 = _2507;
    if (!_2405)
    {
        _2487 = _2469;
    }
    float _2511 = _2487;
    float _2513 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _2515 = int(_2513);
    float _2517 = _2511;
    if (_2405)
    {
        float _2519 = _2385 * _2501;
        _2497 = _2519;
    }
    float _2521 = _2497;
    if (_2405)
    {
        float _2523 = _2507 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2419 = _2523;
    }
    float _2525 = _2419;
    if (!_2405)
    {
        _2509 = _2387;
    }
    float _2527 = _2509;
    float _2529 = _2527;
    if (_2405)
    {
        float _2531 = _2387 * _2501;
        _2529 = _2531;
    }
    float _2533 = _2529;
    if (_2405)
    {
        float _2535 = _2521 * _2521;
        _2421 = _2535;
    }
    float _2537 = _2421;
    if (_2405)
    {
        float _2539 = fma(_2469, _2463, _2525);
        _2517 = _2539;
    }
    float _2541 = _2517;
    if (!_2405)
    {
        _2503 = _2391;
    }
    float _2543 = _2503;
    float _2545 = _2543;
    if (_2405)
    {
        float _2547 = _2533 * _2533;
        _2545 = _2547;
    }
    float _2549 = _2545;
    float _2551 = -_2495;
    float _2553 = _2551 + 1.0;
    float _2555 = fma(_2541, _2541, _2537);
    float _2557 = float(uint(_2365));
    float _2559 = _2555 + _2549;
    float _2561 = abs(_2553);
    float _2563 = log2(_2561);
    float _2565 = float(_2515);
    float _2567 = rsqrt(_2559);
    float _2569 = _2563 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2571 = 1.0 / _2565;
    float _2573 = _2567 * _2521;
    float _2575 = _2567 * _2541;
    float _2577 = _2567 * _2533;
    float _2579 = exp2(_2569);
    float _2581 = _2573 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2583 = -_2581;
    float _2585 = fma(_2575, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2583);
    float _2587 = 1.0 / _2557;
    float _2589 = -_2577;
    float _2591 = fma(_2589, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2585);
    float _2593 = in.m_74.x;
    float _2595 = in.m_74.y;
    float _2597 = in.m_74.z;
    float _2599 = in.m_74.w;
    float _2601 = fma(_2591, -0.5, 0.5);
    float _2603 = fma(_2591, 0.5, 0.5);
    float _2605 = fma(_2603, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2607 = sqrt(_2601);
    float _2609 = fma(_2603, _2605, -0.212114393711090087890625);
    float _2611 = _2575 + 1.0;
    float _2613 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2615 = _2613 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2617 = fma(_2603, _2609, 1.570728778839111328125);
    float _2619 = -_2575;
    float _2621 = fma(_2579, _2611, _2619);
    float _2623 = float(uint(_2477));
    float _2625 = 1.0 / _2615;
    float _2627 = fma(_2621, 0.5, 0.5);
    float _2629 = _2607 * 0.636619746685028076171875;
    float _2631 = -_2617;
    float _2633 = fma(_2629, _2631, 1.0);
    float2 _8460 = float2(_2633, _2627);
    float3 _2637 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8460, float2(0.0), isnan(_8460)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8460, float2(0.0), isnan(_8460)), level(0.0)).xyz;
    float _2639 = _2637.x;
    float _2641 = _2637.y;
    float _2643 = _2637.z;
    float _2645 = _159 * _2571;
    bool _2647 = _2599 > 0.5;
    float _2649 = 0.0;
    float _2651 = _2597;
    if (_2159)
    {
        float _2653 = in.m_74.x;
        _2649 = _2653;
    }
    float _2655 = _2649;
    float _2657 = 1.0 / _2623;
    int _2659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2661 = _2659 != 0;
    float _2663 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2665 = _981 + _2663;
    int _2667 = as_type<int>(_2587) + (-2);
    float _2669 = _2655;
    if (!_2159)
    {
        float _2671 = in.m_74.y;
        _2669 = _2671;
    }
    float _2673 = _2669;
    float _2675 = float(uint(_2437));
    float _2677 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2679 = _981 + _2677;
    float _2681 = trunc(_2645);
    int _2683 = int(_2681);
    float _2685 = as_type<float>(_2667) * _2675;
    int _2687 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2689 = _2687 != 0;
    float _2691 = _2593 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2693 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2695 = trunc(_2685);
    float _2697 = precise::max(_2695, 0.0);
    uint _2699 = uint(_2697);
    float _2701 = -_2693;
    float _2703 = fma(_2691, 2.0, _2701);
    float _2705 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2707 = _2595 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2709 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2711 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2709;
    float _2713 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2715 = _2713 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2717 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2719 = _2717 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2721 = fma(_2707, -2.0, _2705);
    float _2723 = _2711 * _2383;
    int _2725 = as_type<int>(_2657) + (-2);
    float _2727 = _2715 * _2625;
    float _2729 = float(uint(_2683));
    float _2731 = 1.0 / _2719;
    int _2733 = ~_2365;
    int _2735 = _2733 + 1;
    float _2737 = fma(_2723, _2665, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2739 = as_type<float>(_2725) * _2729;
    float _2741 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2743 = _981 + _2741;
    float _2745 = _2657;
    if (_2159)
    {
        _2745 = 1.0;
    }
    float _2747 = _2745;
    float _2749 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2751 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2749;
    float _2753 = _2747;
    if (!_2159)
    {
        _2753 = 7.345489978790283203125;
    }
    float _2755 = _2753;
    int _2757 = _2735 * int(_2699);
    int _2759 = _2757 + _2437;
    float _2761 = trunc(_2739);
    float _2763 = precise::max(_2761, 0.0);
    uint _2765 = uint(_2763);
    float _2767 = _951 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2769 = _2755 * _2593;
    float _2771 = float(uint(_2759));
    float _2773 = _2751 * _2731;
    int _2775 = ~_2477;
    int _2777 = _2775 + 1;
    float _2779 = _2767 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2781 = _2755;
    int _2783 = int(_2699);
    if (_2159)
    {
        _2781 = 1.0;
    }
    float _2785 = _2781;
    float _2787 = as_type<float>(_2667) * _2771;
    float _2789 = _2785;
    if (!_2159)
    {
        _2789 = 1.2345600128173828125;
    }
    float _2791 = _2789;
    float _2793 = floor(_2769);
    int _2795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2797 = _2795 != 0;
    out.m_80.x = _1057;
    out.m_80.y = _1113;
    out.m_80.z = _1061;
    bool _2799 = _2595 > 0.5;
    float _2801 = _2673 * _2791;
    float _2803 = -_221;
    int _2805 = _2647 ? as_type<int>(_2803) : as_type<int>(_221);
    int _2807 = _2777 * int(_2765);
    int _2809 = _2807 + _2683;
    int _2811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2813 = _2811 != 0;
    float _2815 = trunc(_2787);
    float _2817 = precise::max(_2815, 0.0);
    uint _2819 = uint(_2817);
    float _2821 = -_221;
    int _2823 = _2799 ? as_type<int>(_2821) : as_type<int>(_221);
    out.m_82.w = _1047;
    bool _2825 = !_2797;
    float _2827 = _2825 ? _221 : as_type<float>(_2805);
    float _2829 = _1998 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2831 = _2593 > 0.5;
    out.m_84.x = _1269;
    out.m_84.y = _1271;
    out.m_84.z = _1273;
    float _2833 = float(uint(_2809));
    float _2835 = floor(_2801);
    bool _2837 = !_2813;
    float _2839 = _2837 ? _221 : as_type<float>(_2823);
    float _2841 = -_2793;
    float _2843 = _2769 + _2841;
    float _2845 = -_217;
    int _2847 = _2831 ? as_type<int>(_2845) : as_type<int>(_217);
    float _2849 = as_type<float>(_2725) * _2833;
    bool _2851 = _2597 > 0.5;
    float _2853 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2829);
    bool _2855 = !_2689;
    float _2857 = _2855 ? _217 : as_type<float>(_2847);
    float _2859 = _2563 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2861 = int(_2699) + int(_2819);
    float _2863 = trunc(_2849);
    float _2865 = precise::max(_2863, 0.0);
    uint _2867 = uint(_2865);
    float _2869 = float(_125);
    float _2871 = fma(_2727, _2743, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _2873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2875 = _2873 != 0;
    float _2877 = fma(_2773, _2679, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2879 = -_217;
    int _2881 = _2851 ? as_type<int>(_2879) : as_type<int>(_217);
    float _2883 = -_2835;
    float _2885 = _2801 + _2883;
    if (_2159)
    {
        _2783 = 0;
    }
    int _2887 = _2783;
    float _2889 = 1.0 / _2869;
    int _2891 = ~_2365;
    int _2893 = _2891 + 1;
    float _2895 = -_1079;
    float _2897 = _2895 + 1.0;
    int _2899 = _2887;
    if (!_2159)
    {
        _2899 = 1;
    }
    int _2901 = _2899;
    out.m_86.x = _1247;
    bool _2903 = !_2875;
    float _2905 = _2903 ? _217 : as_type<float>(_2881);
    int _2907 = _2893 * _2861;
    int _2909 = _2907 + _2437;
    bool _2911 = _2901 != 1;
    float _2913 = exp2(_2859);
    float _2915 = float(_2365);
    out.m_88.x = _1950;
    out.m_88.y = _1948;
    out.m_88.z = _1952;
    float _2917 = float(_2477);
    float _2919 = float(_2437);
    float _2921 = _2843 * _2915;
    int _2923 = int(_2765) + int(_2867);
    float _2925 = _159 * _2889;
    int _2927 = ~_2477;
    int _2929 = _2927 + 1;
    float _2931 = _2885 * _2917;
    float _2933 = float(_2683);
    float _2935 = _2925 * _2915;
    bool _2937 = _2919 >= _2915;
    bool _2939 = isnan(_2919);
    bool _2941 = _2937 || _2939;
    bool _2943 = isnan(_2915);
    bool _2945 = _2941 || _2943;
    float _2947 = float(_2945);
    float _2949 = _2925 * _2917;
    bool _2951 = uint(_2909) >= uint(_2365);
    float _2953 = trunc(_2921);
    int _2955 = int(_2953);
    bool _2957 = _2933 >= _2917;
    bool _2959 = isnan(_2933);
    bool _2961 = _2957 || _2959;
    bool _2963 = isnan(_2917);
    bool _2965 = _2961 || _2963;
    float _2967 = float(_2965);
    int _2969 = _2929 * _2923;
    int _2971 = _2969 + _2683;
    bool _2973 = !_2951;
    int _2975 = _2973 ? 0 : (-1);
    int _2977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2979 = _2977 != 0;
    bool _2981 = uint(_2971) >= uint(_2477);
    float _2983 = trunc(_2947);
    int _2985 = int(_2983);
    int _2987 = ~_2861;
    int _2989 = _2987 + _2975;
    int _2991 = _2989 + 1;
    int _2993 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2995 = _2993 != 0;
    bool _2997 = !_2979;
    int _2999 = _2997 ? 0 : 1;
    int _3001 = _2365 * _2991;
    int _3003 = _3001 + _2437;
    bool _3005 = !_2995;
    int _3007 = _3005 ? 0 : 1;
    float _3009 = trunc(_2931);
    int _3011 = int(_3009);
    int _3013 = abs(_2999);
    bool _3015 = !_2981;
    int _3017 = _3015 ? 0 : (-1);
    bool _3019 = _2365 == 0;
    int _3021 = ~_2923;
    int _3023 = _3021 + _3017;
    int _3025 = _3023 + 1;
    float _3027 = trunc(_2967);
    int _3029 = int(_3027);
    int _3031 = abs(_3007);
    int _3033 = _2477 * _3025;
    int _3035 = _3033 + _2683;
    int _3037 = ~_2985;
    int _3039 = _3037 + 1;
    int _3041 = _3039 + 1;
    int _3043 = _2955 * _3013;
    int _3045 = _3043 + _2437;
    bool _3047 = !_3019;
    int _3049 = _3047 ? _3003 : (-1);
    int _3051 = _3011 * _3031;
    int _3053 = _3051 + _2683;
    bool _3055 = _2477 == 0;
    float _3057 = trunc(_2935);
    int _3059 = int(_3057);
    int _3061 = _2365 + (-1);
    int _3063 = _3049 * _3041;
    bool _3065 = !_3055;
    int _3067 = _3065 ? _3035 : (-1);
    int _3069 = ~_3029;
    int _3071 = _3069 + 1;
    int _3073 = _3071 + 1;
    int _3075 = _2985 * _3061;
    int _3077 = _3075 + _3063;
    int _3079 = abs(_1492);
    float _3081 = trunc(_2949);
    int _3083 = int(_3081);
    int _3085 = _2477 + (-1);
    int _3087 = _3067 * _3073;
    int _3089 = abs(_1592);
    int _3091 = _3029 * _3085;
    int _3093 = _3091 + _3087;
    bool _3095 = _981 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _3097 = isnan(_981);
    bool _3099 = _3095 || _3097;
    bool _3101 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _3103 = _3099 || _3101;
    float _3105 = float(_3103);
    int _3107 = abs(_1518);
    int _3109 = _3077 * _3079;
    bool _3111 = _981 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _3113 = isnan(_981);
    bool _3115 = _3111 || _3113;
    bool _3117 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _3119 = _3115 || _3117;
    float _3121 = float(_3119);
    float _3123 = -_3105;
    float _3125 = _3123 + 1.0;
    int _3127 = abs(_1608);
    int _3129 = _3093 * _3089;
    bool _3131 = _981 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _3133 = isnan(_981);
    bool _3135 = _3131 || _3133;
    bool _3137 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _3139 = _3135 || _3137;
    float _3141 = float(_3139);
    float _3143 = _3121 * _3125;
    float _3145 = -_3121;
    float _3147 = _3145 + 1.0;
    bool _3149 = _981 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _3151 = isnan(_981);
    bool _3153 = _3149 || _3151;
    bool _3155 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _3157 = _3153 || _3155;
    float _3159 = float(_3157);
    int _3161 = _3059 * _3107;
    int _3163 = _3161 + _3109;
    float _3165 = -_3141;
    float _3167 = _3165 + 1.0;
    float _3169 = _3141 * _3147;
    bool _3171 = !_2661;
    int _3173 = _3171 ? 0 : 1;
    int _3175 = _3083 * _3127;
    int _3177 = _3175 + _3129;
    int _3179 = abs(_1604);
    float _3181 = _3159 * _3167;
    int _3183 = abs(_1612);
    int _3185 = abs(_3173);
    int _3187 = _3045 * _3179;
    int _3189 = _3187 + _3163;
    float _3191 = _2737 * _3181;
    int _3193 = abs(_1616);
    int _3195 = _3053 * _3183;
    int _3197 = _3195 + _3177;
    float _3199 = -_3159;
    float _3201 = _3199 + 1.0;
    int _3203 = _2955 * _3185;
    int _3205 = _3203 + _3189;
    float _3207 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2721);
    float _3209 = -_159;
    float _3211 = fma(_3209, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2703);
    float _3213 = _2857 + 0.5;
    float _3215 = float(uint(_3205));
    int _3217 = _3011 * _3193;
    int _3219 = _3217 + _3197;
    float _3221 = _2839 + (-0.5);
    float _3223 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3225 = fma(_3213, (*spvDescriptorSet0.vp_c9)._m0[80].x, _3211);
    float _3227 = as_type<float>(_2667) * _3215;
    float _3229 = fma(_3201, (*spvDescriptorSet0.vp_c9)._m0[131].x, _3191);
    float _3231 = _3213;
    float _3233 = _3191;
    if (!_2911)
    {
        _3231 = _2595;
    }
    float _3235 = _3231;
    float _3237 = fma(_2593, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3223);
    float _3239 = trunc(_3227);
    float _3241 = precise::max(_3239, 0.0);
    uint _3243 = uint(_3241);
    float _3245 = _3235;
    if (!_2911)
    {
        _3233 = _2595;
    }
    float _3247 = _3233;
    float _3249 = -_3221;
    float _3251 = -_3207;
    float _3253 = fma(_3249, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3251);
    float _3255 = _3247;
    if (_2911)
    {
        _3245 = _2593;
    }
    float _3257 = _3245;
    float _3259 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3237);
    if (_2911)
    {
        _3255 = _2593;
    }
    float _3261 = _3255;
    float _3263 = _3257 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _3265 = float(uint(_3219));
    int _3267 = ~_2365;
    int _3269 = _3267 + 1;
    float _3271 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3273 = as_type<float>(_2725) * _3265;
    float _3275 = fma(_2595, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3271);
    int _3277 = _3269 * int(_3243);
    int _3279 = _3277 + _3205;
    float _3281 = _3271;
    if (!_2911)
    {
        _3281 = _2597;
    }
    float _3283 = _3281;
    float _3285 = _3283;
    if (_2911)
    {
        _2651 = _2595;
    }
    float _3287 = _2651;
    float _3289 = trunc(_3273);
    float _3291 = precise::max(_3289, 0.0);
    uint _3293 = uint(_3291);
    if (_2911)
    {
        _3285 = _2595;
    }
    float _3295 = _3285;
    float _3297 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3299 = fma(_2871, _3169, _3229);
    float _3301 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3303 = float(uint(_3279));
    float _3305 = fma(_3261, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3297);
    int _3307 = ~_2477;
    int _3309 = _3307 + 1;
    float _3311 = fma(_3295, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3301);
    float _3313 = as_type<float>(_2667) * _3303;
    float _3315 = float(uint(_3045));
    float _3317 = fma(_2877, _3143, _3299);
    float _3319 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3321 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3275);
    float _3323 = trunc(_3313);
    float _3325 = precise::max(_3323, 0.0);
    uint _3327 = uint(_3325);
    int _3329 = _3309 * int(_3293);
    int _3331 = _3329 + _3219;
    float _3333 = as_type<float>(_2667) * _3315;
    float _3335 = _3287 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _3337 = -_3319;
    float _3339 = fma(_3263, 2.0, _3337);
    float _3341 = fma(_3105, (*spvDescriptorSet0.vp_c9)._m0[134].x, _3317);
    float _3343 = float(uint(_3331));
    float _3345 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3347 = trunc(_3333);
    float _3349 = precise::max(_3347, 0.0);
    uint _3351 = uint(_3349);
    int _3353 = ~_2365;
    int _3355 = _3353 + 1;
    float _3357 = -_159;
    float _3359 = fma(_3357, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3339);
    float _3361 = as_type<float>(_2725) * _3343;
    float _3363 = fma(_3335, -2.0, _3345);
    int _3365 = ~_2365;
    int _3367 = _3365 + 1;
    float _3369 = _2905 + 0.5;
    float _3371 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3305);
    int _3373 = int(_3243) + int(_3327);
    float _3375 = trunc(_3361);
    float _3377 = precise::max(_3375, 0.0);
    uint _3379 = uint(_3377);
    float _3381 = fma(_3369, (*spvDescriptorSet0.vp_c9)._m0[85].x, _3359);
    float _3383 = float(uint(_3053));
    float _3385 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3311);
    int _3387 = _3355 * _3373;
    int _3389 = _3387 + _3205;
    float _3391 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3363);
    float _3393 = _2827 + (-0.5);
    int _3395 = _3367 * int(_3351);
    int _3397 = _3395 + _3045;
    int _3399 = ~_2477;
    int _3401 = _3399 + 1;
    float _3403 = as_type<float>(_2725) * _3383;
    bool _3405 = uint(_3389) >= uint(_2365);
    float _3407 = -_3321;
    float _3409 = _3407 + 1.0;
    float _3411 = float(uint(_3397));
    bool _3413 = !_3405;
    int _3415 = _3413 ? 0 : (-1);
    int _3417 = int(_3293) + int(_3379);
    float _3419 = -_3393;
    float _3421 = -_3391;
    float _3423 = fma(_3419, (*spvDescriptorSet0.vp_c9)._m0[85].y, _3421);
    int _3425 = ~_3373;
    int _3427 = _3425 + _3415;
    int _3429 = _3427 + 1;
    float _3431 = -_3259;
    float _3433 = _3431 + 1.0;
    int _3435 = _3401 * _3417;
    int _3437 = _3435 + _3219;
    float _3439 = as_type<float>(_2667) * _3411;
    int _3441 = _2365 * _3429;
    int _3443 = _3441 + _3205;
    float _3445 = -_3385;
    float _3447 = _3445 + 1.0;
    float _3449 = trunc(_3403);
    float _3451 = precise::max(_3449, 0.0);
    uint _3453 = uint(_3451);
    float _3455 = -_3433;
    float _3457 = fma(_2857, _3455, _3225);
    int _3459 = ~_2477;
    int _3461 = _3459 + 1;
    float _3463 = fma(_2827, _3447, _3423);
    float _3465 = _947 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3467 = fma(_2839, _3409, _3253);
    float _3469 = _949 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _3471 = !_3019;
    int _3473 = _3471 ? _3443 : (-1);
    float _3475 = _3341 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _3477 = uint(_3437) >= uint(_2477);
    float _3479 = -_3371;
    float _3481 = _3479 + 1.0;
    int _3483 = _3473 & 3;
    bool _3485 = _3483 != 0;
    float _3487 = _3465 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3489 = _3473 & 3;
    bool _3491 = _3489 != 0;
    float _3493 = -_3481;
    float _3495 = fma(_2905, _3493, _3381);
    bool _3497 = uint(_3483) > 1u;
    int _3499 = _3461 * int(_3453);
    int _3501 = _3499 + _3053;
    bool _3503 = !_3477;
    int _3505 = _3503 ? 0 : (-1);
    float _3507 = _3469 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3509 = _3491 ? 0 : 1;
    float _3511 = trunc(_3439);
    float _3513 = precise::max(_3511, 0.0);
    uint _3515 = uint(_3513);
    float _3517 = float(uint(_3501));
    out.m_90.x = _3457;
    out.m_90.y = _3467;
    out.m_90.z = _3495;
    out.m_90.w = _3463;
    int _3519 = ~_3417;
    int _3521 = _3519 + _3505;
    int _3523 = _3521 + 1;
    int _3525 = ~_3509;
    int _3527 = _3525 + 1;
    int _3529 = _3527 + 1;
    float _3531 = as_type<float>(_2725) * _3517;
    float _3533 = _1199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3535 = _3529;
    if (!_3497)
    {
        int _3537 = ~_3509;
        int _3539 = _3537 + 1;
        _3535 = _3539;
    }
    int _3541 = _3535;
    int _3543 = _2477 * _3523;
    int _3545 = _3543 + _3219;
    bool _3547 = uint(_3483) >= 2u;
    out.m_92.x = _3487;
    out.m_92.y = _3507;
    out.m_92.z = _2779;
    out.m_92.w = _3475;
    float _3549 = trunc(_3531);
    float _3551 = precise::max(_3549, 0.0);
    uint _3553 = uint(_3551);
    int _3555 = _3473 >> 31;
    float _3557 = _3533 * _1291;
    bool _3559 = !_3485;
    int _3561 = _3559 ? 0 : 1;
    int _3563 = _3547 ? 0 : 1;
    bool _3565 = _3483 != 3;
    int _3567 = _3555 & 3;
    int _3569 = int(_3351) + int(_3515);
    float _3571 = fma(_3533, _3533, 1.0);
    bool _3573 = !_3055;
    int _3575 = _3573 ? _3545 : (-1);
    int _3577 = _3473 + _3567;
    int _3579 = _3575 >> 31;
    float _3581 = rsqrt(_3571);
    int _3583 = ~_2365;
    int _3585 = _3583 + 1;
    int _3587 = _3579 & 3;
    int _3589 = ~_2477;
    int _3591 = _3589 + 1;
    int _3593 = ~_3563;
    int _3595 = _3593 + 1;
    int _3597 = _3595 + 1;
    int _3599 = _3577 >> 2;
    int _3601 = _3597;
    if (_3565)
    {
        int _3603 = ~_3563;
        int _3605 = _3603 + 1;
        _3601 = _3605;
    }
    int _3607 = _3601;
    int _3609 = _3575 + _3587;
    int _3611 = _3585 * _3569;
    int _3613 = _3611 + _3045;
    int _3615 = int(_3453) + int(_3553);
    float _3617 = _3533 * _3581;
    int _3619 = _3599 << 4;
    int _3621 = _3619 + 368;
    int _3623 = _3609 >> 2;
    int _3625 = _3591 * _3615;
    int _3627 = _3625 + _3053;
    bool _3629 = uint(_3613) >= uint(_2365);
    float _3631 = -_1153;
    float _3633 = _3617 * _3631;
    uint _3635 = uint(int(uint(_3621) >> uint(2)));
    uint _3637 = uint(int(uint(int(_3635)) >> uint(2)));
    int _3639 = int(_3635) & 3;
    float _3641 = (*spvDescriptorSet0.vp_c9)._m0[int(_3637)][_3639];
    int _3643 = int(_3635) + 1;
    uint _3645 = uint(int(uint(_3643) >> uint(2)));
    int _3647 = _3643 & 3;
    float _3649 = (*spvDescriptorSet0.vp_c9)._m0[int(_3645)][_3647];
    int _3651 = _3623 << 4;
    int _3653 = _3651 + 512;
    float _3655 = -_1151;
    float _3657 = _3617 * _3655;
    float _3659 = -_1163;
    float _3661 = _3617 * _3659;
    bool _3663 = !_3629;
    int _3665 = _3663 ? 0 : (-1);
    float _3667 = fma(_3581, _1291, _3633);
    bool _3669 = uint(_3627) >= uint(_2477);
    float _3671 = fma(_3581, _1295, _3657);
    float _3673 = fma(_3581, _1418, _3661);
    uint _3675 = uint(int(uint(_3653) >> uint(2)));
    uint _3677 = uint(int(uint(int(_3675)) >> uint(2)));
    int _3679 = int(_3675) & 3;
    float _3681 = (*spvDescriptorSet0.vp_c9)._m0[int(_3677)][_3679];
    int _3683 = int(_3675) + 1;
    uint _3685 = uint(int(uint(_3683) >> uint(2)));
    int _3687 = _3683 & 3;
    float _3689 = (*spvDescriptorSet0.vp_c9)._m0[int(_3685)][_3687];
    bool _3691 = !_3669;
    int _3693 = _3691 ? 0 : (-1);
    float _3695 = _3533 * _1295;
    int _3697 = _3575 & 3;
    bool _3699 = _3697 != 0;
    out.m_94.x = _3671;
    out.m_94.y = _3673;
    out.m_94.z = _3667;
    int _3701 = _3575 & 3;
    bool _3703 = _3701 != 0;
    float _3705 = _3533 * _1418;
    int _3707 = _3699 ? 0 : 1;
    int _3709 = _3621 + 8;
    uint _3711 = uint(int(uint(_3709) >> uint(2)));
    uint _3713 = uint(int(uint(int(_3711)) >> uint(2)));
    int _3715 = int(_3711) & 3;
    float _3717 = (*spvDescriptorSet0.vp_c9)._m0[int(_3713)][_3715];
    int _3719 = int(_3711) + 1;
    uint _3721 = uint(int(uint(_3719) >> uint(2)));
    int _3723 = _3719 & 3;
    float _3725 = (*spvDescriptorSet0.vp_c9)._m0[int(_3721)][_3723];
    bool _3727 = uint(_3701) > 1u;
    float _3729 = _1235 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3731 = ~_3707;
    int _3733 = _3731 + 1;
    int _3735 = _3733 + 1;
    int _3737 = ~_3615;
    int _3739 = _3737 + _3693;
    int _3741 = _3739 + 1;
    float _3743 = fma(_3729, _1269, _3695);
    float _3745 = fma(_3729, _1271, _3705);
    int _3747 = abs(_3541);
    int _3749 = _3653 + 8;
    uint _3751 = uint(int(uint(_3749) >> uint(2)));
    uint _3753 = uint(int(uint(int(_3751)) >> uint(2)));
    int _3755 = int(_3751) & 3;
    float _3757 = (*spvDescriptorSet0.vp_c9)._m0[int(_3753)][_3755];
    int _3759 = int(_3751) + 1;
    uint _3761 = uint(int(uint(_3759) >> uint(2)));
    int _3763 = _3759 & 3;
    float _3765 = (*spvDescriptorSet0.vp_c9)._m0[int(_3761)][_3763];
    int _3767 = abs(_3561);
    float _3769 = fma(_3729, _1273, _3557);
    int _3771 = ~_3747;
    int _3773 = _3771 + 1;
    int _3775 = _3773 + 1;
    int _3777 = _2477 * _3741;
    int _3779 = _3777 + _3053;
    int _3781 = _3735;
    if (!_3727)
    {
        int _3783 = ~_3707;
        int _3785 = _3783 + 1;
        _3781 = _3785;
    }
    int _3787 = _3781;
    bool _3789 = uint(_3701) >= 2u;
    bool _3791 = !_3703;
    int _3793 = _3791 ? 0 : 1;
    int _3795 = _3789 ? 0 : 1;
    bool _3797 = _3701 != 3;
    int _3799 = ~_3767;
    int _3801 = _3799 + 1;
    int _3803 = _3801 + 1;
    int _3805 = abs(_3793);
    int _3807 = abs(_3787);
    int _3809 = abs(_3607);
    int _3811 = _3775 * as_type<int>(_3649);
    int _3813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3815 = _3813 != 0;
    int _3817 = ~_3807;
    int _3819 = _3817 + 1;
    int _3821 = _3819 + 1;
    int _3823 = _3803 * as_type<int>(_3641);
    int _3825 = _3823 + _3811;
    int _3827 = ~_3809;
    int _3829 = _3827 + 1;
    int _3831 = _3829 + 1;
    bool _3833 = _3483 != 3;
    float _3835 = abs(_1259);
    float _3837 = log2(_3835);
    bool _3839 = !_3815;
    int _3841 = _3839 ? 0 : 1;
    int _3843 = _3821 * as_type<int>(_3689);
    bool _3845 = _3701 != 3;
    int _3847 = ~_3795;
    int _3849 = _3847 + 1;
    int _3851 = _3849 + 1;
    int _3853 = ~_3805;
    int _3855 = _3853 + 1;
    int _3857 = _3855 + 1;
    int _3859 = _3831 * as_type<int>(_3717);
    int _3861 = _3859 + _3825;
    bool _3863 = !_3833;
    int _3865 = _3863 ? 0 : (-1);
    int _3867 = _3851;
    if (_3797)
    {
        int _3869 = ~_3795;
        int _3871 = _3869 + 1;
        _3867 = _3871;
    }
    int _3873 = _3867;
    int _3875 = _3857 * as_type<int>(_3681);
    int _3877 = _3875 + _3843;
    int _3879 = abs(_3841);
    bool _3881 = !_3845;
    int _3883 = _3881 ? 0 : (-1);
    int _3885 = abs(_3865);
    int _3887 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3889 = _3887 != 0;
    int _3891 = abs(_3873);
    int _3893 = abs(_3883);
    bool _3895 = !_3889;
    int _3897 = _3895 ? 0 : 1;
    int _3899 = ~_3885;
    int _3901 = _3899 + 1;
    int _3903 = _3901 + 1;
    int _3905 = abs(_3897);
    int _3907 = ~_3891;
    int _3909 = _3907 + 1;
    int _3911 = _3909 + 1;
    int _3913 = _3903 * as_type<int>(_3725);
    int _3915 = _3913 + _3861;
    float _3917 = _3837 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _3919 = ~_3879;
    int _3921 = _3919 + 1;
    int _3923 = _3921 + 1;
    int _3925 = _3911 * as_type<int>(_3757);
    int _3927 = _3925 + _3877;
    int _3929 = ~_3893;
    int _3931 = _3929 + 1;
    int _3933 = _3931 + 1;
    float _3935 = fma(_2000, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2853);
    bool _3937 = !_3055;
    int _3939 = _3937 ? _3779 : (-1);
    int _3941 = _3915 * _3923;
    float _3943 = exp2(_3917);
    int _3945 = ~_3905;
    int _3947 = _3945 + 1;
    int _3949 = _3947 + 1;
    int _3951 = _3933 * as_type<int>(_3765);
    int _3953 = _3951 + _3927;
    int _3955 = ~_3569;
    int _3957 = _3955 + _3665;
    int _3959 = _3957 + 1;
    float _3961 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3935);
    int _3963 = _3953 * _3949;
    bool _3965 = _1259 <= 8000.0;
    bool _3967 = isnan(_1259);
    bool _3969 = _3965 || _3967;
    bool _3971 = isnan(8000.0);
    bool _3973 = _3969 || _3971;
    float _3975 = float(_3973);
    int _3977 = _2365 * _3959;
    int _3979 = _3977 + _3045;
    out.gl_Position.x = _2074;
    out.gl_Position.y = _2090;
    out.gl_Position.z = _3961;
    out.gl_Position.w = _2038;
    int _3981 = _3939 * _3905;
    int _3983 = _3981 + _3963;
    float _3985 = _3961 + _2038;
    bool _3987 = !_3019;
    int _3989 = _3987 ? _3979 : (-1);
    float _3991 = _2074 + _2038;
    float _3993 = float(_3983);
    float _3995 = fma(_3943, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3997 = precise::clamp(_3995, 0.0, 1.0);
    int _3999 = _3989 * _3879;
    int _4001 = _3999 + _3941;
    float _4003 = _2038 * 0.5;
    float _4005 = fma(_3997, -2.0, 3.0);
    float _4007 = _3997 * _3997;
    float _4009 = _3985 * 0.5;
    float _4011 = fma(_2090, -0.5, _4003);
    float _4013 = float(_4001);
    float _4015 = _4007 * _4005;
    float _4017 = _3991 * 0.5;
    float _4019 = _1151 + _3743;
    float _4021 = _1163 + _3745;
    float _4023 = -_4015;
    float _4025 = _4023 + 1.0;
    out.m_96.x = _4013;
    out.m_96.y = _3993;
    float _4027 = _1153 + _3769;
    float _4029 = _4025;
    if (!_2022)
    {
        _2078 = 1.0;
    }
    float _4031 = _2078;
    float _4033 = fma(_4025, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4015);
    out.m_98.x = _4017;
    out.m_98.y = _4011;
    out.m_98.z = _4009;
    out.m_98.w = _2038;
    float _4035 = _4031;
    if (_2022)
    {
        bool _4037 = _2128 >= _2100;
        bool _4039 = isnan(_2128);
        bool _4041 = _4037 || _4039;
        bool _4043 = isnan(_2100);
        bool _4045 = _4041 || _4043;
        float _4047 = float(_4045);
        _4035 = _4047;
    }
    float _4049 = _4035;
    float _4051 = _3975 * _4033;
    out.m_100.x = _4019;
    out.m_100.y = _4021;
    out.m_100.z = _4027;
    bool _4053 = _2379 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4055 = isnan(_2379);
    bool _4057 = _4053 || _4055;
    bool _4059 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4061 = _4057 || _4059;
    float _4063 = _4049 * _2349;
    float _4065 = _4051 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4067 = -_2913;
    float _4069 = _4067 + 1.0;
    float _4071 = _2897 * _4065;
    float _4073 = precise::clamp(_4071, 0.0, 1.0);
    float _4075 = _4069 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4077 = -_4073;
    float _4079 = fma(_4077, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4081 = _4075 * _2130;
    float _4083 = -_4075;
    float _4085 = _4083 + 1.0;
    float _4087 = _4085;
    float _4089 = _4073;
    float _4091 = _4063;
    if (!_4061)
    {
        _4029 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4093 = _4029;
    float _4095 = -_4063;
    float _4097 = fma(_4095, _4079, 1.0);
    float _4099 = precise::clamp(_4097, 0.0, 1.0);
    float _4101 = _2141 * _4081;
    float _4103 = _2643 * _4081;
    float _4105 = _2141 * _4085;
    float _4107 = _4099 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4109 = fma(_2639, _4101, _2135);
    float _4111 = fma(_2641, _4101, _2137);
    float _4113 = fma(_2141, _4103, _2139);
    float _4115 = _2223 * _2285;
    out.m_102.x = _4107;
    float _4117 = _4107;
    float _4119 = _4115;
    float _4121 = _4093;
    float _4123 = _4093;
    if (!_4061)
    {
        _4087 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4125 = _4087;
    float _4127 = _4115 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_104.x = _4109;
    out.m_104.y = _4111;
    out.m_104.z = _4113;
    out.m_104.w = _4105;
    float _4129 = _4125;
    float _4131 = _4125;
    if (!_4061)
    {
        _4089 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4133 = _4089;
    float _4135 = _4133;
    float _4137 = _4133;
    if (!_4061)
    {
        _4091 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4139 = _4091;
    float _4141 = _4139;
    float _4143 = _4139;
    if (!_4061)
    {
        _4117 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4145 = _4117;
    float _4147 = _4145;
    float _4149 = _4145;
    if (!_4061)
    {
        _4119 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4151 = _4119;
    bool _4153 = !_4061;
    float _4155 = _4151;
    float _4157 = _4151;
    if (!_4153)
    {
        bool _4159 = _2379 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4161 = isnan(_2379);
        bool _4163 = _4159 || _4161;
        bool _4165 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4167 = _4163 || _4165;
        if (!_4167)
        {
            float _4169 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4171 = _2379 + _4169;
            float _4173 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4175 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4173;
            float _4177 = 1.0 / _4175;
            float _4179 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4181 = _4179 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4183 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4185 = _4183 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4187 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4189 = _4187 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4191 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4193 = _4191 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4195 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4197 = _4195 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4199 = _4171 * _4177;
            float _4201 = precise::clamp(_4199, 0.0, 1.0);
            float _4203 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4205 = _4203 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4207 = fma(_4201, _4181, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4209 = fma(_4201, _4205, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4211 = fma(_4201, _4185, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4213 = fma(_4201, _4189, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4215 = fma(_4201, _4193, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4217 = fma(_4201, _4197, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4131 = _4207;
            _4149 = _4215;
            _4123 = _4209;
            _4143 = _4213;
            _4137 = _4211;
            _4157 = _4217;
            _4219 = true;
        }
        else
        {
            bool _4221 = _2379 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4223 = isnan(_2379);
            bool _4225 = _4221 || _4223;
            bool _4227 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4229 = _4225 || _4227;
            if (!_4229)
            {
                _4121 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4231 = _4121;
            _4123 = _4231;
            if (!_4229)
            {
                _4129 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4233 = _4129;
            _4131 = _4233;
            if (!_4229)
            {
                _4135 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4235 = _4135;
            _4137 = _4235;
            if (!_4229)
            {
                _4141 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4237 = _4141;
            _4143 = _4237;
            if (!_4229)
            {
                _4147 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4239 = _4147;
            _4149 = _4239;
            if (!_4229)
            {
                _4155 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4241 = _4155;
            bool _4243 = !_4229;
            _4157 = _4241;
            if (!_4243)
            {
                bool _4245 = _2379 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4247 = isnan(_2379);
                bool _4249 = _4245 || _4247;
                bool _4251 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4253 = _4249 || _4251;
                if (!_4253)
                {
                    float _4255 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4257 = _2379 + _4255;
                    float _4259 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4261 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4259;
                    float _4263 = 1.0 / _4261;
                    float _4265 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4267 = _4265 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4269 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4271 = _4269 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4273 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4275 = _4273 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4277 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4279 = _4277 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4281 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4283 = _4281 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4285 = _4257 * _4263;
                    float _4287 = precise::clamp(_4285, 0.0, 1.0);
                    float _4289 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4291 = _4289 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4293 = fma(_4287, _4267, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4295 = fma(_4287, _4291, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4297 = fma(_4287, _4271, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4299 = fma(_4287, _4275, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4301 = fma(_4287, _4279, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4303 = fma(_4287, _4283, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4131 = _4293;
                    _4149 = _4301;
                    _4123 = _4295;
                    _4143 = _4299;
                    _4137 = _4297;
                    _4157 = _4303;
                    _4219 = true;
                }
                else
                {
                    _4131 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4149 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4123 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4143 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4137 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4157 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4219 = false;
    float _4305 = _4131;
    float _4307 = _4149;
    float _4309 = _4123;
    float _4311 = _4143;
    float _4313 = _4137;
    float _4315 = _4157;
    float _4317 = fma(_4021, -0.5, 0.5);
    float _4319 = precise::clamp(_4317, 0.0, 1.0);
    float _4321 = -_4305;
    float _4323 = _4321 + _4307;
    float _4325 = _4127 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4327 = -_4309;
    float _4329 = _4327 + _4311;
    out.m_106.x = 0.0;
    float _4331 = fma(_4319, _4323, _4305);
    float _4333 = fma(_4319, _4329, _4309);
    out.m_59.x = _4325;
    float _4335 = -_4313;
    float _4337 = _4335 + _4315;
    float _4339 = _4331 * 0.586610972881317138671875;
    bool _4341 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4343 = fma(_4319, _4337, _4313);
    float _4345 = fma(_4333, 0.298911988735198974609375, _4339);
    bool _4347 = _2223 > 0.0;
    bool _4349 = isnan(_2223);
    bool _4351 = _4347 || _4349;
    bool _4353 = isnan(0.0);
    bool _4355 = _4351 || _4353;
    float _4357 = fma(_4343, 0.114477999508380889892578125, _4345);
    bool _4359 = _2285 <= 0.0;
    bool _4361 = !_4355;
    bool _4363 = _4359 || _4361;
    float _4365 = -_4357;
    float _4367 = _4333 + _4365;
    float _4369 = -_4357;
    float _4371 = _4331 + _4369;
    float _4373 = -_4357;
    float _4375 = _4343 + _4373;
    float _4377 = fma(_4367, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4357);
    float _4379 = fma(_4371, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4357);
    float _4381 = fma(_4375, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4357);
    bool _4383 = !_4341;
    if (!_4383)
    {
        float _4385 = -_1948;
        float _4387 = _4385 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4389 = -_1950;
        float _4391 = _4389 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4393 = -_1952;
        float _4395 = _4393 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4397 = _4387 * _4387;
        float _4399 = fma(_4391, _4391, _4397);
        float _4401 = fma(_4395, _4395, _4399);
        float _4403 = sqrt(_4401);
        float _4405 = rsqrt(_4401);
        float _4407 = -_4403;
        float _4409 = _4407 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4411 = _4409 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4413 = precise::clamp(_4411, 0.0, 1.0);
        float _4415 = _4391 * _4405;
        float _4417 = _4387 * _4405;
        float _4419 = abs(_4413);
        float _4421 = log2(_4419);
        float _4423 = _4395 * _4405;
        float _4425 = _4415 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4427 = _4021 * _4417;
        float _4429 = -_4417;
        float _4431 = -_4425;
        float _4433 = fma(_4429, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4431);
        float _4435 = fma(_4019, _4415, _4427);
        float _4437 = -_4423;
        float _4439 = fma(_4437, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4433);
        float _4441 = fma(_4027, _4423, _4435);
        float _4443 = precise::clamp(_4441, 0.0, 1.0);
        float _4445 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4447 = _4439 + _4445;
        float _4449 = _4421 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4451 = _4447 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4453 = precise::clamp(_4451, 0.0, 1.0);
        float _4455 = exp2(_4449);
        float _4457 = _4455 * _4453;
        float _4459 = _4443 * _4457;
        float _4461 = _4459 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4463 = _4459 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4465 = _4459 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_106.x = _4461;
        out.m_106.y = _4463;
        out.m_106.z = _4465;
    }
    out.m_82.x = _4377;
    out.m_82.y = _4379;
    out.m_82.z = _4381;
    if (!_4363)
    {
        return out;
    }
    out.m_59.x = 0.0;
    float _4467 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4467;
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
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4219 = false;
    bool _973 = false;
    bool _805 = false;
    bool _587 = false;
    bool _419 = false;
    bool _263 = false;
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
        float _4524 = as_type<float>(_141);
        out.gl_Position.z = _4524;
    }
    if (!_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = in.m_61.w;
    bool _147 = _145 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _149 = isnan(_145);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _155 = _151 || _153;
    float _157 = -_145;
    float _159 = _157 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _161 = 0.0;
    if (_155)
    {
        float _163 = float(_125);
        _161 = _163;
    }
    float _165 = _161;
    bool _167 = _159 >= _165;
    bool _169 = !_155;
    bool _171 = _167 || _169;
    if (_171)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _173 = _135;
    if (_171)
    {
        out.m_59.x = 0.0;
    }
    if (_171)
    {
        float _175 = _173 * 5.0;
        _143 = as_type<int>(_175);
    }
    int _177 = _143;
    if (_171)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4592 = as_type<float>(_177);
        out.gl_Position.z = _4592;
    }
    if (_171)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _179 = as_type<float>(int(gl_VertexIndex));
    float _181 = in.m_66.x;
    float _183 = in.m_66.y;
    float _185 = in.m_66.z;
    float _187 = in.m_68.x;
    float _189 = in.m_68.y;
    float _191 = in.m_68.z;
    float _193 = in.m_70.x;
    float _195 = in.m_70.y;
    float _197 = in.m_70.z;
    float _199 = in.m_72.x;
    float _201 = in.m_72.y;
    float _203 = in.m_72.z;
    int _205 = as_type<int>(_179) & 1;
    bool _207 = _205 != 0;
    int _209 = as_type<int>(_179) & 2;
    bool _211 = _209 != 0;
    bool _213 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _215 = !_207;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = !_211;
    float _221 = _219 ? (-0.5) : 0.5;
    float _223 = _183 * _189;
    float _225 = _183 * _195;
    float _227 = fma(_181, _187, _223);
    float _229 = _183 * _201;
    float _231 = fma(_181, _193, _225);
    float _233 = fma(_185, _191, _227);
    float _235 = fma(_181, _199, _229);
    float _237 = fma(_185, _197, _231);
    float _239 = fma(_185, _203, _235);
    bool _241 = !_213;
    float _243 = _239;
    float _261;
    if (!_241)
    {
        float _245 = in.m_74.x;
        float _247 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _249 = _245 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _251 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[12].x, _159);
        float _253 = _251 * _247;
        float _255 = floor(_253);
        float _257 = -_255;
        float _259 = _253 + _257;
        _261 = _259;
        _263 = true;
    }
    else
    {
        float _265 = float(_125);
        float _267 = 1.0 / _265;
        float _269 = _159 * _267;
        _261 = _269;
    }
    _263 = false;
    float _271 = _261;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = _271 + _273;
    bool _277 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _279 = isnan(_271);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _291 = _271 + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _299 = _297 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _301 = -_287;
    float _303 = _301 + 1.0;
    float _305 = in.m_76.x;
    float _307 = in.m_76.y;
    float _309 = 1.0 / _299;
    bool _311 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _313 = isnan(_271);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    bool _323 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _325 = 1.0 / _295;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _331 = _291 * _309;
    float _333 = fma(_329, _331, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _335 = _275 * _325;
    bool _337 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _339 = isnan(_271);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _345 = _341 || _343;
    float _347 = float(_345);
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _353;
    float _357 = _347 * _303;
    float _359 = -_347;
    float _361 = _359 + 1.0;
    float _363 = fma(_351, _335, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _365 = fma(_355, _335, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _367 = _321 * _361;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _371 = _369 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _373 = -_321;
    float _375 = _373 + 1.0;
    float _377 = _363 * _367;
    float _379 = _365 * _367;
    float _381 = fma(_371, _331, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _383 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[143].x, _377);
    float _385 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[143].y, _379);
    float _387 = fma(_381, _357, _383);
    float _389 = fma(_333, _357, _385);
    float _391 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[145].x, _387);
    float _393 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[145].y, _389);
    float _395 = _391 * _305;
    float _397 = _393 * _307;
    bool _399 = !_323;
    float _417;
    if (!_399)
    {
        float _401 = in.m_74.x;
        float _403 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _405 = _401 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _407 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[11].x, _159);
        float _409 = _407 * _403;
        float _411 = floor(_409);
        float _413 = -_411;
        float _415 = _409 + _413;
        _417 = _415;
        _419 = true;
    }
    else
    {
        float _421 = float(_125);
        float _423 = 1.0 / _421;
        float _425 = _159 * _423;
        _417 = _425;
    }
    _419 = false;
    float _427 = _417;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _431 = _427 + _429;
    bool _433 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _435 = isnan(_427);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _441 = _437 || _439;
    float _443 = float(_441);
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _447 = _427 + _445;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _449;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _457 = -_443;
    float _459 = _457 + 1.0;
    float _461 = 1.0 / _451;
    bool _463 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _465 = 1.0 / _455;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _467;
    float _471 = _431 * _461;
    bool _473 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _475 = isnan(_427);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _485;
    bool _489 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _491 = isnan(_427);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = fma(_469, _471, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _503 = fma(_487, _471, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _505 = _499 * _459;
    float _507 = -_499;
    float _509 = _507 + 1.0;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _511;
    float _515 = _447 * _465;
    float _517 = _483 * _509;
    float _519 = fma(_513, _471, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _521 = -_483;
    float _523 = _521 + 1.0;
    float _525 = _501 * _517;
    float _527 = _519 * _517;
    float _529 = _503 * _517;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _543 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[107].x, _527);
    float _545 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[107].y, _525);
    float _547 = fma(_533, _515, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _549 = fma(_537, _515, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _551 = fma(_541, _515, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _553 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[107].z, _529);
    float _555 = fma(_547, _505, _543);
    float _557 = fma(_549, _505, _545);
    float _559 = fma(_551, _505, _553);
    float _561 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[109].x, _555);
    float _563 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[109].y, _557);
    float _565 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[109].z, _559);
    bool _567 = !_463;
    float _585;
    if (!_567)
    {
        float _569 = in.m_74.x;
        float _571 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _573 = _569 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _575 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[11].y, _159);
        float _577 = _575 * _571;
        float _579 = floor(_577);
        float _581 = -_579;
        float _583 = _577 + _581;
        _585 = _583;
        _587 = true;
    }
    else
    {
        float _589 = float(_125);
        float _591 = 1.0 / _589;
        float _593 = _159 * _591;
        _585 = _593;
    }
    _587 = false;
    float _595 = _585;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _603 = _601 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _605 = 1.0 / _599;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _609 = _607 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _611;
    bool _615 = _595 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _617 = isnan(_595);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _631 = _595 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _633 = isnan(_595);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _639 = _635 || _637;
    float _641 = float(_639);
    float _643 = 1.0 / _603;
    bool _645 = _595 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _647 = isnan(_595);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = -_641;
    float _659 = _657 + 1.0;
    bool _661 = _595 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _663 = isnan(_595);
    bool _665 = _661 || _663;
    bool _667 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _669 = _665 || _667;
    float _671 = float(_669);
    bool _673 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _675 = _625 * _659;
    float _677 = 1.0 / _609;
    float _679 = _613 * _605;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _683 = _595 + _681;
    float _685 = fma(_679, _683, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _687 = -_625;
    float _689 = _687 + 1.0;
    float _691 = 1.0 / _629;
    float _693 = -_655;
    float _695 = _693 + 1.0;
    float _697 = _655 * _689;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _699;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _705 = _703 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _707 = _671 * _695;
    float _709 = -_671;
    float _711 = _709 + 1.0;
    float _713 = _701 * _643;
    float _715 = _705 * _677;
    float _717 = _685 * _707;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _721 = _595 + _719;
    bool _723 = _595 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _725 = isnan(_595);
    bool _727 = _723 || _725;
    bool _729 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _731 = _727 || _729;
    float _733 = float(_731);
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _737 = _735 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _741 = _595 + _739;
    float _743 = fma(_715, _721, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _745 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[115].x, _717);
    float _747 = _737 * _691;
    float _749 = fma(_713, _741, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _751 = -_733;
    float _753 = _751 + 1.0;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _757 = _595 + _755;
    float _759 = fma(_743, _697, _745);
    float _761 = _561 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _763 = _641 * _753;
    float _765 = fma(_747, _757, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _767 = fma(_749, _675, _759);
    float _769 = _565 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _771 = _761 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _773 = fma(_765, _763, _767);
    float _775 = _563 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _777 = _769 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _779 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[119].x, _773);
    float _781 = _775 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _783 = _779 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_78.x = _771;
    out.m_78.y = _781;
    out.m_78.z = _777;
    out.m_78.w = _783;
    bool _785 = !_673;
    float _803;
    if (!_785)
    {
        float _787 = in.m_74.x;
        float _789 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _791 = _787 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _793 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[11].z, _159);
        float _795 = _793 * _789;
        float _797 = floor(_795);
        float _799 = -_797;
        float _801 = _795 + _799;
        _803 = _801;
        _805 = true;
    }
    else
    {
        float _807 = float(_125);
        float _809 = 1.0 / _807;
        float _811 = _159 * _809;
        _803 = _811;
    }
    _805 = false;
    float _813 = _803;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _817 = _813 + _815;
    bool _819 = _813 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _821 = isnan(_813);
    bool _823 = _819 || _821;
    bool _825 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _827 = _823 || _825;
    float _829 = float(_827);
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _833 = _813 + _831;
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _835;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _841 = _839 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _843 = -_829;
    float _845 = _843 + 1.0;
    float _847 = 1.0 / _837;
    bool _849 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _851 = 1.0 / _841;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _853;
    float _857 = _817 * _847;
    bool _859 = _813 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _861 = isnan(_813);
    bool _863 = _859 || _861;
    bool _865 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _867 = _863 || _865;
    float _869 = float(_867);
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _871;
    bool _875 = _813 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _877 = isnan(_813);
    bool _879 = _875 || _877;
    bool _881 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _883 = _879 || _881;
    float _885 = float(_883);
    float _887 = fma(_855, _857, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _889 = fma(_873, _857, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _891 = _885 * _845;
    float _893 = -_885;
    float _895 = _893 + 1.0;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _897;
    float _901 = _833 * _851;
    float _903 = _869 * _895;
    float _905 = fma(_899, _857, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _907 = -_869;
    float _909 = _907 + 1.0;
    float _911 = _887 * _903;
    float _913 = _905 * _903;
    float _915 = _889 * _903;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _919 = _917 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _923 = _921 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _927 = _925 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _929 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[123].x, _913);
    float _931 = fma(_919, _901, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _933 = fma(_923, _901, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _935 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[123].y, _911);
    float _937 = fma(_927, _901, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _939 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[123].z, _915);
    float _941 = fma(_931, _891, _929);
    float _943 = fma(_933, _891, _935);
    float _945 = fma(_937, _891, _939);
    float _947 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[125].x, _941);
    float _949 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[125].y, _943);
    float _951 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[125].z, _945);
    bool _953 = !_849;
    float _971;
    if (!_953)
    {
        float _955 = in.m_74.x;
        float _957 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _959 = _955 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _961 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[11].w, _159);
        float _963 = _961 * _957;
        float _965 = floor(_963);
        float _967 = -_965;
        float _969 = _963 + _967;
        _971 = _969;
        _973 = true;
    }
    else
    {
        float _975 = float(_125);
        float _977 = 1.0 / _975;
        float _979 = _159 * _977;
        _971 = _979;
    }
    _973 = false;
    float _981 = _971;
    float _983 = in.m_56.x;
    float _985 = in.m_56.y;
    float _987 = in.m_56.z;
    float _989 = _395 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _991 = in.m_70.w;
    float _993 = _989 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _995 = in.m_68.w;
    float _997 = in.m_72.w;
    float _999 = _195 * _985;
    float _1001 = _189 * _985;
    float _1003 = _201 * _985;
    float _1005 = fma(_193, _983, _999);
    float _1007 = fma(_187, _983, _1001);
    float _1009 = fma(_199, _983, _1003);
    float _1011 = fma(_197, _987, _1005);
    float _1013 = fma(_191, _987, _1007);
    float _1015 = fma(_203, _987, _1009);
    float _1017 = _1011 + _991;
    float _1019 = _1013 + _995;
    float _1021 = _1015 + _997;
    float _1023 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1025 = _1017 + _1023;
    float _1027 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1029 = _1019 + _1027;
    float _1031 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1033 = _1021 + _1031;
    float _1035 = _1025 * _1025;
    float _1037 = fma(_1029, _1029, _1035);
    float _1039 = fma(_1033, _1033, _1037);
    float _1041 = sqrt(_1039);
    float _1043 = rsqrt(_1039);
    float _1045 = _1041 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1047 = precise::min(_993, _1045);
    float _1049 = _1043 * _1047;
    float _1051 = _1029 * _1049;
    float _1053 = _1033 * _1049;
    float _1055 = -_1051;
    float _1057 = _1019 + _1055;
    float _1059 = -_1053;
    float _1061 = _1021 + _1059;
    float _1063 = fma(_1057, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1065 = fma(_1061, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1067 = floor(_1063);
    float _1069 = floor(_1065);
    float _1071 = -_1067;
    float _1073 = _1063 + _1071;
    float _1075 = -_1069;
    float _1077 = _1065 + _1075;
    float2 _6020 = float2(_1073, _1077);
    float _1079 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6020, float2(0.0), isnan(_6020)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6020, float2(0.0), isnan(_6020)), level(0.0)).x;
    float _1081 = -_1017;
    float _1083 = _1081 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1085 = -_1019;
    float _1087 = _1085 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1089 = _1083 * _1083;
    float _1091 = _1025 * _1049;
    float _1093 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1095 = -_1021;
    float _1097 = _1095 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1099 = fma(_1087, _1087, _1089);
    float _1101 = -_1091;
    float _1103 = _1025 + _1101;
    float _1105 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1093);
    float _1107 = fma(_1097, _1097, _1099);
    float _1109 = _1103 * _1103;
    float _1111 = -_1091;
    float _1113 = _1017 + _1111;
    float _1115 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1105);
    float _1117 = rsqrt(_1107);
    float _1119 = _1113 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1121 = -_1051;
    float _1123 = _1029 + _1121;
    float _1125 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1127 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1119);
    float _1129 = -_1053;
    float _1131 = _1033 + _1129;
    float _1133 = fma(_1123, _1123, _1109);
    float _1135 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1125);
    float _1137 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1127);
    float _1139 = rsqrt(_1115);
    float _1141 = fma(_1131, _1131, _1133);
    float _1143 = _397 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1145 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1135);
    float _1147 = _1137 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1149 = _1113 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1151 = _1087 * _1117;
    float _1153 = _1097 * _1117;
    float _1155 = 1.0 / _1147;
    float _1157 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1149);
    float _1159 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1161 = _1151 * _1159;
    float _1163 = _1083 * _1117;
    float _1165 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1167 = _1153 * _1165;
    float _1169 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1157);
    float _1171 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1173 = -_1161;
    float _1175 = fma(_1153, _1171, _1173);
    float _1177 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1179 = _1163 * _1177;
    float _1181 = sqrt(_1141);
    float _1183 = _1169 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1185 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1187 = -_1167;
    float _1189 = fma(_1163, _1185, _1187);
    float _1191 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1193 = -_1179;
    float _1195 = fma(_1151, _1191, _1193);
    float _1197 = _1183 + _1147;
    float _1199 = _221 * _1139;
    float _1201 = rsqrt(_1145);
    float _1203 = _1175 * _1175;
    float _1205 = _1197 * _1155;
    float _1207 = _1205 * 0.5;
    float _1209 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1211 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1199);
    float _1213 = fma(_1189, _1189, _1203);
    float _1215 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1217 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1215);
    float _1219 = _1113 + _1209;
    float _1221 = _1043 * _1181;
    float _1223 = fma(_1195, _1195, _1213);
    float _1225 = _1219 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1227 = 1.0 / _1217;
    float _1229 = _1219 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1231 = _1143 * _1221;
    float _1233 = fma(_1057, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1225);
    float _1235 = _217 * _1201;
    float _1237 = fma(_1057, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1229);
    float _1239 = _1231 * _1211;
    float _1241 = fma(_1061, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1233);
    float _1243 = rsqrt(_1223);
    float _1245 = fma(_1061, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1237);
    float _1247 = _989 * _1221;
    float _1249 = _1241 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1251 = _1221 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1253 = _1251 * 0.5;
    float _1255 = _1245 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1257 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1259 = _1227 * _1257;
    float _1261 = trunc(_1249);
    int _1263 = int(_1261);
    bool _1265 = _1259 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1267 = _1259 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1269 = _1189 * _1243;
    float _1271 = _1175 * _1243;
    float _1273 = _1195 * _1243;
    float _1275 = trunc(_1255);
    int _1277 = int(_1275);
    float _1279 = _1163 * _1269;
    float _1281 = _1153 * _1271;
    float _1283 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1235);
    bool _1285 = !_1265;
    int _1287 = _1285 ? 0 : 1;
    float _1289 = -_1279;
    float _1291 = fma(_1151, _1271, _1289);
    float _1293 = -_1281;
    float _1295 = fma(_1163, _1273, _1293);
    float _1297 = _1247 * _1283;
    int _1299 = 2;
    float _1301 = _1219;
    if (!_1265)
    {
        _1299 = 1;
    }
    int _1303 = _1299;
    float _1305 = _1239 * _1291;
    float _1307 = _1239 * _1295;
    int _1309 = _1303;
    if (!_1267)
    {
        _1309 = _1287;
    }
    int _1311 = _1309;
    float _1313 = fma(_1297, _1273, _1305);
    float _1315 = fma(_1297, _1269, _1307);
    int _1317 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1319 = _1263 + _1317;
    int _1321 = _1319 + 1;
    float _1323 = fma(_1253, _1153, _1313);
    int _1325 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1327 = _1277 + _1325;
    int _1329 = _1327 + 1;
    float _1331 = fma(_1253, _1151, _1315);
    int _1333 = _1311 << 6;
    float _1335 = _1021 + _1323;
    bool _1337 = _1321 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1339 = _1019 + _1331;
    int _1341 = _1321 | _1329;
    float _1343 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1345 = _1335 + _1343;
    int _1347 = _1333 + 48;
    uint _1350 = uint(int(uint(_1347) >> uint(2)));
    uint _1352 = uint(int(uint(int(_1350)) >> uint(2)));
    int _1354 = int(_1350) & 3;
    float _1356 = (*spvDescriptorSet0.vp_c15)._m0[int(_1352)][_1354];
    int _1358 = int(_1350) + 1;
    uint _1360 = uint(int(uint(_1358) >> uint(2)));
    int _1362 = _1358 & 3;
    float _1364 = (*spvDescriptorSet0.vp_c15)._m0[int(_1360)][_1362];
    bool _1366 = _1341 < 0;
    bool _1368 = _1366 || _1337;
    float _1370 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1372 = _1339 + _1370;
    float _1374 = _1345 * _1345;
    bool _1376 = _1329 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1378 = _1376 || _1368;
    int _1380 = _1333 + 56;
    uint _1382 = uint(int(uint(_1380) >> uint(2)));
    uint _1384 = uint(int(uint(int(_1382)) >> uint(2)));
    int _1386 = int(_1382) & 3;
    float _1388 = (*spvDescriptorSet0.vp_c15)._m0[int(_1384)][_1386];
    int _1390 = int(_1382) + 1;
    uint _1392 = uint(int(uint(_1390) >> uint(2)));
    int _1394 = _1390 & 3;
    float _1396 = (*spvDescriptorSet0.vp_c15)._m0[int(_1392)][_1394];
    float _1398 = fma(_1372, _1372, _1374);
    float _1400 = _1151 * _1273;
    int _1402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1404 = _1402 != 0;
    int _1406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1408 = _1406 != 0;
    int _1410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1412 = _1410 != 0;
    float _1414 = sqrt(_1398);
    float _1416 = -_1400;
    float _1418 = fma(_1153, _1269, _1416);
    int _1420 = int(_1368);
    int _1422 = _1265 ? 2 : 0;
    int _1424 = _1420 | _1422;
    int _1426 = _1378 ? 4 : 0;
    int _1428 = _1424 | _1426;
    int _1430 = false ? 8 : 0;
    int _1432 = _1428 | _1430;
    int _1434 = _1404 ? 16 : 0;
    int _1436 = _1432 | _1434;
    int _1438 = _1408 ? 32 : 0;
    int _1440 = _1436 | _1438;
    int _1442 = _1412 ? 64 : 0;
    int _1444 = _1440 | _1442;
    int _1446 = _1444 & 4;
    int _1448 = _1333 + 64;
    uint _1450 = uint(int(uint(_1448) >> uint(2)));
    uint _1452 = uint(int(uint(int(_1450)) >> uint(2)));
    int _1454 = int(_1450) & 3;
    float _1456 = (*spvDescriptorSet0.vp_c15)._m0[int(_1452)][_1454];
    int _1458 = int(_1450) + 1;
    uint _1460 = uint(int(uint(_1458) >> uint(2)));
    int _1462 = _1458 & 3;
    float _1464 = (*spvDescriptorSet0.vp_c15)._m0[int(_1460)][_1462];
    float _1466 = _1239 * _1418;
    int _1468 = _1321;
    int _1470 = _1329;
    int _1472 = _1446;
    float _1474 = _1339;
    float _1476 = _1335;
    float _1478 = as_type<float>(_1311);
    float _1480 = as_type<float>(_1333);
    if (!_1378)
    {
        int _1482 = _1329 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1484 = _1482 + _1321;
        _1468 = _1484;
    }
    int _1486 = _1468;
    float _1488 = fma(_1297, _1271, _1466);
    bool _1490 = !_1408;
    int _1492 = _1490 ? 0 : 1;
    int _1494 = _1333 + 72;
    uint _1496 = uint(int(uint(_1494) >> uint(2)));
    uint _1498 = uint(int(uint(int(_1496)) >> uint(2)));
    int _1500 = int(_1496) & 3;
    float _1502 = (*spvDescriptorSet0.vp_c15)._m0[int(_1498)][_1500];
    int _1504 = int(_1496) + 1;
    uint _1506 = uint(int(uint(_1504) >> uint(2)));
    int _1508 = _1504 & 3;
    float _1510 = (*spvDescriptorSet0.vp_c15)._m0[int(_1506)][_1508];
    bool _1512 = _1446 != 0;
    float _1514 = fma(_1253, _1163, _1488);
    bool _1516 = !_1404;
    int _1518 = _1516 ? 0 : 1;
    bool _1520 = _1414 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1522 = _1017 + _1514;
    int _1524 = _1333 + 96;
    uint _1526 = uint(int(uint(_1524) >> uint(2)));
    uint _1528 = uint(int(uint(int(_1526)) >> uint(2)));
    int _1530 = int(_1526) & 3;
    float _1532 = (*spvDescriptorSet0.vp_c15)._m0[int(_1528)][_1530];
    int _1534 = int(_1526) + 1;
    uint _1536 = uint(int(uint(_1534) >> uint(2)));
    int _1538 = _1534 & 3;
    float _1540 = (*spvDescriptorSet0.vp_c15)._m0[int(_1536)][_1538];
    int _1542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1544 = _1542 != 0;
    int _1546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1548 = _1546 != 0;
    int _1550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1552 = _1550 != 0;
    int _1554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1556 = _1554 != 0;
    if (!_1512)
    {
        int _1558 = _1486 << 2;
        _1470 = _1558;
    }
    int _1560 = _1470;
    int _1562 = _1333 + 104;
    uint _1564 = uint(int(uint(_1562) >> uint(2)));
    uint _1566 = uint(int(uint(int(_1564)) >> uint(2)));
    int _1568 = int(_1564) & 3;
    float _1570 = (*spvDescriptorSet0.vp_c15)._m0[int(_1566)][_1568];
    int _1572 = int(_1564) + 1;
    uint _1574 = uint(int(uint(_1572) >> uint(2)));
    int _1576 = _1572 & 3;
    float _1578 = (*spvDescriptorSet0.vp_c15)._m0[int(_1574)][_1576];
    int _1580 = _1560;
    if (!_1512)
    {
        uint _1582 = uint(int(uint(_1486) >> uint(2)));
        _1472 = int(_1582);
    }
    int _1584 = _1472;
    if (!_1512)
    {
        int _1586 = 12 & _1560;
        _1580 = _1586;
    }
    int _1588 = _1580;
    bool _1590 = !_1548;
    int _1592 = _1590 ? 0 : 1;
    int _1594 = 0;
    if (!_1512)
    {
        int _1596 = _1584 << 4;
        int _1598 = _1596 + _1588;
        _1594 = _1598;
    }
    int _1600 = _1594;
    bool _1602 = !_1412;
    int _1604 = _1602 ? 0 : 1;
    bool _1606 = !_1544;
    int _1608 = _1606 ? 0 : 1;
    bool _1610 = !_1552;
    int _1612 = _1610 ? 0 : 1;
    bool _1614 = !_1556;
    int _1616 = _1614 ? 0 : 1;
    float _1618 = 0.0;
    if (!_1520)
    {
        _1618 = _1522;
    }
    float _1620 = _1618;
    bool _1622 = !_1520;
    float _1624 = _1620;
    float _1626 = _1356;
    float _1628 = _1456;
    if (!_1622)
    {
        float _1630 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1632 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1634 = _1414 + _1632;
        float _1636 = rsqrt(_1398);
        float _1638 = _1634 * _1630;
        float _1640 = _1522 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1642 = _1638 * 0.15915493667125701904296875;
        float _1644 = _1642 * 6.283185482025146484375;
        float _1646 = cos(_1644);
        float _1648 = _1642 * 6.283185482025146484375;
        float _1650 = sin(_1648);
        float _1652 = _1646 + (-1.0);
        float _1654 = fma(_1650, _1640, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1656 = _1652 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1658 = _1636 * _1654;
        float _1660 = fma(_1522, _1646, _1656);
        float _1662 = fma(_1372, _1658, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1664 = fma(_1345, _1658, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1624 = _1660;
        _1474 = _1662;
        _1476 = _1664;
    }
    float _1666 = _1624;
    float _1668 = _1474;
    float _1670 = _1476;
    float _1672 = -_1017;
    float _1674 = _1672 + _1666;
    float _1676 = -_1019;
    float _1678 = _1676 + _1668;
    int _1680 = _1333 + 80;
    uint _1682 = uint(int(uint(_1680) >> uint(2)));
    uint _1684 = uint(int(uint(int(_1682)) >> uint(2)));
    int _1686 = int(_1682) & 3;
    float _1688 = (*spvDescriptorSet0.vp_c15)._m0[int(_1684)][_1686];
    int _1690 = int(_1682) + 1;
    uint _1692 = uint(int(uint(_1690) >> uint(2)));
    int _1694 = _1690 & 3;
    float _1696 = (*spvDescriptorSet0.vp_c15)._m0[int(_1692)][_1694];
    float _1698 = -_1021;
    float _1700 = _1698 + _1670;
    float _1702 = _1674 * _1674;
    float _1704 = _1219 * _1540;
    float _1706 = _1219 * _1364;
    float _1708 = _1219 * _1464;
    float _1710 = fma(_1678, _1678, _1702);
    float _1712 = fma(_1057, _1532, _1704);
    int _1714 = _1333 + 88;
    uint _1716 = uint(int(uint(_1714) >> uint(2)));
    uint _1718 = uint(int(uint(int(_1716)) >> uint(2)));
    int _1720 = int(_1716) & 3;
    float _1722 = (*spvDescriptorSet0.vp_c15)._m0[int(_1718)][_1720];
    int _1724 = int(_1716) + 1;
    uint _1726 = uint(int(uint(_1724) >> uint(2)));
    int _1728 = _1724 & 3;
    float _1730 = (*spvDescriptorSet0.vp_c15)._m0[int(_1726)][_1728];
    float _1732 = _1702;
    if (!_1512)
    {
        float _1734 = floor(_1249);
        _1732 = _1734;
    }
    float _1736 = _1732;
    float _1738 = fma(_1700, _1700, _1710);
    float _1740 = fma(_1061, _1570, _1712);
    float _1742 = fma(_1057, _1356, _1706);
    float _1744 = fma(_1057, _1456, _1708);
    float _1746 = -_1051;
    float _1748 = _1746 + _1668;
    float _1750 = _1740 + _1578;
    float _1752 = _1019;
    float _1754 = _1742;
    float _1756 = _1744;
    if (!_1512)
    {
        int _1758 = _1600 + 400;
        uint _1760 = uint(int(uint(_1758) >> uint(2)));
        uint _1762 = uint(int(uint(int(_1760)) >> uint(2)));
        int _1764 = int(_1760) & 3;
        float _1766 = (*spvDescriptorSet0.vp_c15)._m0[int(_1762)][_1764];
        _1752 = _1766;
    }
    float _1768 = _1752;
    float _1770 = sqrt(_1738);
    float _1772 = -_1091;
    float _1774 = _1772 + _1666;
    float _1776 = -_1053;
    float _1778 = _1776 + _1670;
    float _1780 = fma(_1061, _1388, _1742);
    float _1782 = fma(_1061, _1502, _1744);
    bool _1784 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1786 = isnan(0.5);
    bool _1788 = _1784 || _1786;
    bool _1790 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1792 = _1788 || _1790;
    float _1794 = _1780 + _1396;
    float _1796 = _1712;
    if (!_1512)
    {
        float _1798 = floor(_1255);
        _1796 = _1798;
    }
    float _1800 = _1796;
    float _1802 = _1782 + _1510;
    bool _1804 = _1770 > 0.0;
    float _1806 = 1.0 / _1750;
    if (!_1804)
    {
        _1626 = _1748;
    }
    float _1808 = _1626;
    float _1810 = _1808;
    if (!_1804)
    {
        _1754 = _1774;
    }
    float _1812 = _1754;
    float _1814 = _1812;
    if (!_1804)
    {
        _1756 = _1778;
    }
    float _1816 = _1756;
    bool _1818 = !_1804;
    float _1820 = _1816;
    float _1822 = _1816;
    if (!_1818)
    {
        float _1824 = _237 * _237;
        float _1826 = fma(_233, _233, _1824);
        float _1828 = fma(_239, _239, _1826);
        float _1830 = rsqrt(_1738);
        float _1832 = sqrt(_1828);
        float _1834 = _1678 * _1830;
        float _1836 = _1674 * _1830;
        float _1838 = _1700 * _1830;
        bool _1840 = _1832 > 0.0;
        float _1842 = _1832;
        float _1844 = _1830;
        if (!_1840)
        {
            _1842 = _1748;
        }
        float _1846 = _1842;
        _1810 = _1846;
        if (!_1840)
        {
            _1844 = _1774;
        }
        float _1848 = _1844;
        _1814 = _1848;
        if (!_1840)
        {
            _1820 = _1778;
        }
        float _1850 = _1820;
        bool _1852 = !_1840;
        _1822 = _1850;
        if (!_1852)
        {
            float _1854 = rsqrt(_1828);
            float _1856 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1858 = _237 * _1854;
            float _1860 = _233 * _1854;
            float _1862 = _1836 * _1858;
            float _1864 = _239 * _1854;
            float _1866 = fma(_1834, _1860, _1862);
            float _1868 = _1856 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1870 = fma(_1838, _1864, _1866);
            float _1872 = _1870 * _1868;
            float _1874 = fma(_233, _1872, _1748);
            float _1876 = fma(_237, _1872, _1774);
            float _1878 = fma(_239, _1872, _1778);
            _1822 = _1878;
            _1810 = _1874;
            _1814 = _1876;
            _1628 = _1856;
        }
    }
    float _1880 = _1822;
    float _1882 = _1810;
    float _1884 = _1814;
    float _1886 = _1628;
    float _1888 = _1884;
    float _1890 = _1882;
    float _1892 = _1886;
    if (_1792)
    {
        _243 = _1880;
    }
    float _1894 = _243;
    float _1896 = _1894;
    if (!_1792)
    {
        float _1898 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1900 = _1113 + _1898;
        float _1902 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1904 = _1057 + _1902;
        float _1906 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1908 = -_1061;
        float _1910 = _1908 + _1880;
        float _1912 = _1900 * _1900;
        float _1914 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1916 = _1061 + _1914;
        float _1918 = fma(_1904, _1904, _1912);
        float _1920 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1922 = fma(_1916, _1916, _1918);
        float _1924 = sqrt(_1922);
        float _1926 = _1906 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1928 = precise::min(_1924, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1930 = _1928 * _1920;
        float _1932 = -_1057;
        float _1934 = _1932 + _1882;
        float _1936 = _1926 * _1930;
        float _1938 = -_1113;
        float _1940 = _1938 + _1884;
        float _1942 = fma(_1934, _1936, _1057);
        float _1944 = fma(_1940, _1936, _1113);
        float _1946 = fma(_1910, _1936, _1061);
        _1888 = _1944;
        _1890 = _1942;
        _1896 = _1946;
        _1892 = _1920;
    }
    float _1948 = _1888;
    float _1950 = _1890;
    float _1952 = _1896;
    float _1954 = _1892;
    float _1956 = _1948 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1958 = _1802 * _1806;
    float _1960 = _1794 * _1806;
    float _1962 = _1948 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1964 = _1948 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1966 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1956);
    float _1968 = _1954;
    if (!_1512)
    {
        float _1970 = rint(_1768);
        float _1972 = precise::max(_1970, 0.0);
        uint _1974 = uint(_1972);
        uint _1976 = clamp(_1974, 0u, 65535u);
        _1968 = as_type<float>(_1976);
    }
    float _1978 = _1968;
    float _1980 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1962);
    float _1982 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1964);
    bool _1984 = _1960 >= 0.0;
    float _1986 = fma(_1952, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1966);
    float _1988 = fma(_1952, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1980);
    float _1990 = fma(_1952, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1982);
    bool _1992 = _1960 <= 1.0;
    bool _1994 = _1992 && _1984;
    float _1996 = _1948 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1998 = _1986 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2000 = _1988 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2002 = _1990 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2004 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1996);
    float _2006 = _1998 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2008 = _1958 >= 0.0;
    bool _2010 = _2008 && _1994;
    float _2012 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2014 = _2000 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2016 = fma(_1952, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2004);
    float _2018 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2006);
    bool _2020 = _1958 <= 1.0;
    bool _2022 = _2020 && _2010;
    float _2024 = -_2014;
    float _2026 = fma(_2024, _2012, 1.0);
    float _2028 = _2016 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2030 = fma(_2000, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2018);
    float _2032 = _1219 * _1696;
    float _2034 = log2(_2026);
    float _2036 = _1998 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2038 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2030);
    float _2040 = _1998 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2042 = fma(_1057, _1688, _2032);
    float _2044 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2036);
    float _2046 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2040);
    float _2048 = 1.0 / _2038;
    float _2050 = _2030;
    float _2052 = _2026;
    float _2054 = _2046;
    if (_2022)
    {
        float _2056 = float(_1311);
        _2050 = _2056;
    }
    float _2058 = _2050;
    float _2060 = fma(_1061, _1722, _2042);
    float _2062 = fma(_2000, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2044);
    float _2064 = fma(_2000, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2046);
    if (!_1512)
    {
        float _2066 = -_1800;
        float _2068 = _1255 + _2066;
        _2052 = _2068;
    }
    float _2070 = _2052;
    float _2072 = _2060 + _1730;
    float _2074 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2062);
    float _2076 = _2058;
    float _2078 = _2074;
    if (_2022)
    {
        float _2080 = rint(_2058);
        float _2082 = precise::max(_2080, 0.0);
        uint _2084 = uint(_2082);
        uint _2086 = clamp(_2084, 0u, 65535u);
        _2076 = as_type<float>(_2086);
    }
    float _2088 = _2076;
    float _2090 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2064);
    float _2092 = _2034 * 0.693147182464599609375;
    if (!_1512)
    {
        float _2094 = -_1736;
        float _2096 = _1249 + _2094;
        _2054 = _2096;
    }
    float _2098 = _2054;
    float _2100 = _2072 * _1806;
    float _2102 = _2092 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2104 = _2074 * _2048;
    float _2106 = _2090 * _2048;
    float _2108 = _2070;
    float _2110 = _2048;
    if (!_1512)
    {
        float3 _7691 = float3(_2098, _2070, float(as_type<int>(_1978)));
        float3 _7695 = select(_7691, float3(0.0), isnan(_7691));
        float _2112 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7695.xy, uint(rint(_7695.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7695.xy, uint(rint(_7695.z)), level(0.0)).x;
        _2108 = _2112;
    }
    float _2114 = _2108;
    float _2116 = fma(_2104, 0.5, 0.5);
    float _2118 = fma(_2106, -0.5, 0.5);
    float _2120 = _1958;
    float _2122 = _2118;
    float _2124 = _2116;
    if (_2022)
    {
        float3 _7716 = float3(_1960, _1958, float(as_type<int>(_2088)));
        float3 _7718 = select(_7716, float3(0.0), isnan(_7716));
        float _2126 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7718.xy, uint(rint(_7718.z)), _2100, level(0.0));
        _2120 = _2126;
    }
    float _2128 = _2120;
    float3 _7728 = float3(_2116, _2118, _2102);
    float _2130 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7728, float3(0.0), isnan(_7728)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7728, float3(0.0), isnan(_7728)), level(0.0)).x;
    float3 _7737 = float3(_2116, _2118, _2102);
    float4 _2133 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7737, float3(0.0), isnan(_7737)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7737, float3(0.0), isnan(_7737)), level(0.0)).xyzw;
    float _2135 = _2133.x;
    float _2137 = _2133.y;
    float _2139 = _2133.z;
    float _2141 = _2133.w;
    bool _2143 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2145 = isnan(0.5);
    bool _2147 = _2143 || _2145;
    bool _2149 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2151 = _2147 || _2149;
    float _2153 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_1512)
    {
        _2110 = 1.0;
    }
    float _2155 = _2110;
    int _2157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2159 = _2157 != 0;
    float _2161 = _2155;
    if (_2151)
    {
        _2153 = 1.0;
    }
    float _2163 = _2153;
    float _2165 = _2163;
    if (_2151)
    {
        _1478 = 1.0;
    }
    float _2167 = _1478;
    float _2169 = _2167;
    if (!_2151)
    {
        float _2171 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2173 = _2171 * 0.15915493667125701904296875;
        float _2175 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2177 = _2173 * 6.283185482025146484375;
        float _2179 = cos(_2177);
        float _2181 = _2175 * 0.15915493667125701904296875;
        float _2183 = _2173 * 6.283185482025146484375;
        float _2185 = sin(_2183);
        float _2187 = 1.0 / _2179;
        float _2189 = _2181 * 6.283185482025146484375;
        float _2191 = cos(_2189);
        float _2193 = _2185 * _2187;
        float _2195 = _2181 * 6.283185482025146484375;
        float _2197 = sin(_2195);
        float _2199 = _2191 * _2193;
        float _2201 = 1.0 / _2199;
        float _2203 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2205 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2203;
        float _2207 = 1.0 / _2205;
        float _2209 = _2197 * _2201;
        float _2211 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2213 = fma(_1259, _2209, _2211);
        float _2215 = _2213 * _2207;
        float _2217 = precise::clamp(_2215, 0.0, 1.0);
        _2122 = _2173;
        _2124 = _2181;
        _2169 = _2217;
    }
    float _2219 = _2122;
    float _2221 = _2124;
    float _2223 = _2169;
    float _2225 = _2221;
    float _2227 = _2219;
    if (!_2151)
    {
        float _2229 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2231 = _2229 * 0.15915493667125701904296875;
        float _2233 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2235 = _2231 * 6.283185482025146484375;
        float _2237 = cos(_2235);
        float _2239 = _2233 * 0.15915493667125701904296875;
        float _2241 = _2231 * 6.283185482025146484375;
        float _2243 = sin(_2241);
        float _2245 = 1.0 / _2237;
        float _2247 = _2239 * 6.283185482025146484375;
        float _2249 = cos(_2247);
        float _2251 = _2243 * _2245;
        float _2253 = _2239 * 6.283185482025146484375;
        float _2255 = sin(_2253);
        float _2257 = _2249 * _2251;
        float _2259 = 1.0 / _2257;
        float _2261 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2263 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2261;
        float _2265 = 1.0 / _2263;
        float _2267 = _2255 * _2259;
        float _2269 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2271 = fma(_1259, _2267, _2269);
        float _2273 = _2271 * _2265;
        float _2275 = precise::clamp(_2273, 0.0, 1.0);
        float _2277 = -_2275;
        float _2279 = _2277 + 1.0;
        _2225 = _2257;
        _2227 = _2245;
        _2165 = _2279;
    }
    float _2281 = _2225;
    float _2283 = _2227;
    float _2285 = _2165;
    float _2287 = _2283;
    if (!_1512)
    {
        int _2289 = _1486 << 4;
        int _2291 = _2289 + 2048;
        uint _2293 = uint(int(uint(_2291) >> uint(2)));
        uint _2295 = uint(int(uint(int(_2293)) >> uint(2)));
        int _2297 = int(_2293) & 3;
        float _2299 = (*spvDescriptorSet0.vp_c15)._m0[int(_2295)][_2297];
        int _2301 = int(_2293) + 1;
        uint _2303 = uint(int(uint(_2301) >> uint(2)));
        int _2305 = _2301 & 3;
        float _2307 = (*spvDescriptorSet0.vp_c15)._m0[int(_2303)][_2305];
        int _2309 = _2291 + 8;
        uint _2311 = uint(int(uint(_2309) >> uint(2)));
        uint _2313 = uint(int(uint(int(_2311)) >> uint(2)));
        int _2315 = int(_2311) & 3;
        float _2317 = (*spvDescriptorSet0.vp_c15)._m0[int(_2313)][_2315];
        int _2319 = int(_2311) + 1;
        uint _2321 = uint(int(uint(_2319) >> uint(2)));
        int _2323 = _2319 & 3;
        float _2325 = (*spvDescriptorSet0.vp_c15)._m0[int(_2321)][_2323];
        float _2327 = _1219 * _2307;
        float _2329 = fma(_1057, _2299, _2327);
        float _2331 = fma(_1061, _2317, _2329);
        float _2333 = _2331 + _2325;
        float _2335 = precise::clamp(_2333, 0.0, 1.0);
        float _2337 = -_2335;
        float _2339 = _2337 + _2114;
        float _2341 = fma(_2339, 500.0, 1.5);
        float _2343 = exp2(_2341);
        float _2345 = 0.0 + _2343;
        float _2347 = precise::clamp(_2345, 0.0, 1.0);
        _2161 = _2347;
    }
    float _2349 = _2161;
    float _2351 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2353 = _1948 + _2351;
    float _2355 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2357 = _1950 + _2355;
    float _2359 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2361 = _1952 + _2359;
    float _2363 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _2365 = int(_2363);
    float _2367 = _2353 * _2353;
    float _2369 = fma(_2357, _2357, _2367);
    float _2371 = fma(_2361, _2361, _2369);
    float _2373 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2375 = _2373 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2377 = rsqrt(_2371);
    float _2379 = sqrt(_2371);
    float _2381 = _2377 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2383 = 1.0 / _2375;
    float _2385 = _2357 * _2381;
    float _2387 = _2361 * _2381;
    float _2389 = _2385 * _2385;
    float _2391 = _2387 * _2387;
    float _2393 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _2395 = int(_2393);
    float _2397 = _2389 + _2391;
    float _2399 = sqrt(_2397);
    float _2401 = float(_2395);
    float _2403 = 1.0 / _2401;
    bool _2405 = _2399 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2407 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2409 = _2399 + _2407;
    float _2411 = _159 * _2403;
    float _2413 = _2377;
    float _2415 = _2409;
    float _2417 = _2353;
    float _2419 = _2397;
    float _2421 = _2389;
    if (_2405)
    {
        float _2423 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2413 = _2423;
    }
    float _2425 = _2413;
    if (_2405)
    {
        float _2427 = rsqrt(_2397);
        _2287 = _2427;
    }
    float _2429 = _2287;
    if (_2405)
    {
        float _2431 = _2409 * _2425;
        _2415 = _2431;
    }
    float _2433 = _2415;
    float _2435 = trunc(_2411);
    int _2437 = int(_2435);
    if (_2405)
    {
        float _2439 = _2433 * 0.15915493667125701904296875;
        _1301 = _2439;
    }
    float _2441 = _1301;
    float _2443 = _2425;
    if (_2405)
    {
        float _2445 = _2441 * 6.283185482025146484375;
        float _2447 = sin(_2445);
        _2443 = _2447;
    }
    float _2449 = _2443;
    float _2451 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2453 = precise::max(0.0, _2451);
    float _2455 = _2281;
    float _2457 = _2453;
    if (_2405)
    {
        float _2459 = _2441 * 6.283185482025146484375;
        float _2461 = cos(_2459);
        _2455 = _2461;
    }
    float _2463 = _2455;
    float _2465 = -_2381;
    float _2467 = -_2453;
    float _2469 = fma(_2353, _2465, _2467);
    if (_2405)
    {
        float _2471 = _2469 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2457 = _2471;
    }
    float _2473 = _2457;
    float _2475 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2477 = int(_2475);
    float _2479 = _2473;
    float _2481 = _2449;
    if (_2405)
    {
        float _2483 = fma(_2449, _2473, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2479 = _2483;
    }
    float _2485 = _2479;
    float _2487 = _2485;
    if (!_2405)
    {
        _2481 = _2385;
    }
    float _2489 = _2481;
    float _2491 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2493 = fma(_2379, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2491);
    float _2495 = precise::clamp(_2493, 0.0, 1.0);
    float _2497 = _2489;
    if (_2405)
    {
        float _2499 = _2429 * _2485;
        _1480 = _2499;
    }
    float _2501 = _1480;
    float _2503 = _2463;
    if (_2405)
    {
        float _2505 = _2463 + (-1.0);
        _2417 = _2505;
    }
    float _2507 = _2417;
    float _2509 = _2507;
    if (!_2405)
    {
        _2487 = _2469;
    }
    float _2511 = _2487;
    float _2513 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _2515 = int(_2513);
    float _2517 = _2511;
    if (_2405)
    {
        float _2519 = _2385 * _2501;
        _2497 = _2519;
    }
    float _2521 = _2497;
    if (_2405)
    {
        float _2523 = _2507 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2419 = _2523;
    }
    float _2525 = _2419;
    if (!_2405)
    {
        _2509 = _2387;
    }
    float _2527 = _2509;
    float _2529 = _2527;
    if (_2405)
    {
        float _2531 = _2387 * _2501;
        _2529 = _2531;
    }
    float _2533 = _2529;
    if (_2405)
    {
        float _2535 = _2521 * _2521;
        _2421 = _2535;
    }
    float _2537 = _2421;
    if (_2405)
    {
        float _2539 = fma(_2469, _2463, _2525);
        _2517 = _2539;
    }
    float _2541 = _2517;
    if (!_2405)
    {
        _2503 = _2391;
    }
    float _2543 = _2503;
    float _2545 = _2543;
    if (_2405)
    {
        float _2547 = _2533 * _2533;
        _2545 = _2547;
    }
    float _2549 = _2545;
    float _2551 = -_2495;
    float _2553 = _2551 + 1.0;
    float _2555 = fma(_2541, _2541, _2537);
    float _2557 = float(uint(_2365));
    float _2559 = _2555 + _2549;
    float _2561 = abs(_2553);
    float _2563 = log2(_2561);
    float _2565 = float(_2515);
    float _2567 = rsqrt(_2559);
    float _2569 = _2563 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2571 = 1.0 / _2565;
    float _2573 = _2567 * _2521;
    float _2575 = _2567 * _2541;
    float _2577 = _2567 * _2533;
    float _2579 = exp2(_2569);
    float _2581 = _2573 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2583 = -_2581;
    float _2585 = fma(_2575, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2583);
    float _2587 = 1.0 / _2557;
    float _2589 = -_2577;
    float _2591 = fma(_2589, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2585);
    float _2593 = in.m_74.x;
    float _2595 = in.m_74.y;
    float _2597 = in.m_74.z;
    float _2599 = in.m_74.w;
    float _2601 = fma(_2591, -0.5, 0.5);
    float _2603 = fma(_2591, 0.5, 0.5);
    float _2605 = fma(_2603, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2607 = sqrt(_2601);
    float _2609 = fma(_2603, _2605, -0.212114393711090087890625);
    float _2611 = _2575 + 1.0;
    float _2613 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2615 = _2613 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2617 = fma(_2603, _2609, 1.570728778839111328125);
    float _2619 = -_2575;
    float _2621 = fma(_2579, _2611, _2619);
    float _2623 = float(uint(_2477));
    float _2625 = 1.0 / _2615;
    float _2627 = fma(_2621, 0.5, 0.5);
    float _2629 = _2607 * 0.636619746685028076171875;
    float _2631 = -_2617;
    float _2633 = fma(_2629, _2631, 1.0);
    float2 _8460 = float2(_2633, _2627);
    float3 _2637 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8460, float2(0.0), isnan(_8460)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8460, float2(0.0), isnan(_8460)), level(0.0)).xyz;
    float _2639 = _2637.x;
    float _2641 = _2637.y;
    float _2643 = _2637.z;
    float _2645 = _159 * _2571;
    bool _2647 = _2599 > 0.5;
    float _2649 = 0.0;
    float _2651 = _2597;
    if (_2159)
    {
        float _2653 = in.m_74.x;
        _2649 = _2653;
    }
    float _2655 = _2649;
    float _2657 = 1.0 / _2623;
    int _2659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2661 = _2659 != 0;
    float _2663 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2665 = _981 + _2663;
    int _2667 = as_type<int>(_2587) + (-2);
    float _2669 = _2655;
    if (!_2159)
    {
        float _2671 = in.m_74.y;
        _2669 = _2671;
    }
    float _2673 = _2669;
    float _2675 = float(uint(_2437));
    float _2677 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2679 = _981 + _2677;
    float _2681 = trunc(_2645);
    int _2683 = int(_2681);
    float _2685 = as_type<float>(_2667) * _2675;
    int _2687 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2689 = _2687 != 0;
    float _2691 = _2593 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2693 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2695 = trunc(_2685);
    float _2697 = precise::max(_2695, 0.0);
    uint _2699 = uint(_2697);
    float _2701 = -_2693;
    float _2703 = fma(_2691, 2.0, _2701);
    float _2705 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2707 = _2595 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2709 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2711 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2709;
    float _2713 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2715 = _2713 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2717 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2719 = _2717 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2721 = fma(_2707, -2.0, _2705);
    float _2723 = _2711 * _2383;
    int _2725 = as_type<int>(_2657) + (-2);
    float _2727 = _2715 * _2625;
    float _2729 = float(uint(_2683));
    float _2731 = 1.0 / _2719;
    int _2733 = ~_2365;
    int _2735 = _2733 + 1;
    float _2737 = fma(_2723, _2665, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2739 = as_type<float>(_2725) * _2729;
    float _2741 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2743 = _981 + _2741;
    float _2745 = _2657;
    if (_2159)
    {
        _2745 = 1.0;
    }
    float _2747 = _2745;
    float _2749 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2751 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2749;
    float _2753 = _2747;
    if (!_2159)
    {
        _2753 = 7.345489978790283203125;
    }
    float _2755 = _2753;
    int _2757 = _2735 * int(_2699);
    int _2759 = _2757 + _2437;
    float _2761 = trunc(_2739);
    float _2763 = precise::max(_2761, 0.0);
    uint _2765 = uint(_2763);
    float _2767 = _951 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2769 = _2755 * _2593;
    float _2771 = float(uint(_2759));
    float _2773 = _2751 * _2731;
    int _2775 = ~_2477;
    int _2777 = _2775 + 1;
    float _2779 = _2767 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2781 = _2755;
    int _2783 = int(_2699);
    if (_2159)
    {
        _2781 = 1.0;
    }
    float _2785 = _2781;
    float _2787 = as_type<float>(_2667) * _2771;
    float _2789 = _2785;
    if (!_2159)
    {
        _2789 = 1.2345600128173828125;
    }
    float _2791 = _2789;
    float _2793 = floor(_2769);
    int _2795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2797 = _2795 != 0;
    out.m_80.x = _1057;
    out.m_80.y = _1113;
    out.m_80.z = _1061;
    bool _2799 = _2595 > 0.5;
    float _2801 = _2673 * _2791;
    float _2803 = -_221;
    int _2805 = _2647 ? as_type<int>(_2803) : as_type<int>(_221);
    int _2807 = _2777 * int(_2765);
    int _2809 = _2807 + _2683;
    int _2811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2813 = _2811 != 0;
    float _2815 = trunc(_2787);
    float _2817 = precise::max(_2815, 0.0);
    uint _2819 = uint(_2817);
    float _2821 = -_221;
    int _2823 = _2799 ? as_type<int>(_2821) : as_type<int>(_221);
    out.m_82.w = _1047;
    bool _2825 = !_2797;
    float _2827 = _2825 ? _221 : as_type<float>(_2805);
    float _2829 = _1998 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2831 = _2593 > 0.5;
    out.m_84.x = _1269;
    out.m_84.y = _1271;
    out.m_84.z = _1273;
    float _2833 = float(uint(_2809));
    float _2835 = floor(_2801);
    bool _2837 = !_2813;
    float _2839 = _2837 ? _221 : as_type<float>(_2823);
    float _2841 = -_2793;
    float _2843 = _2769 + _2841;
    float _2845 = -_217;
    int _2847 = _2831 ? as_type<int>(_2845) : as_type<int>(_217);
    float _2849 = as_type<float>(_2725) * _2833;
    bool _2851 = _2597 > 0.5;
    float _2853 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2829);
    bool _2855 = !_2689;
    float _2857 = _2855 ? _217 : as_type<float>(_2847);
    float _2859 = _2563 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2861 = int(_2699) + int(_2819);
    float _2863 = trunc(_2849);
    float _2865 = precise::max(_2863, 0.0);
    uint _2867 = uint(_2865);
    float _2869 = float(_125);
    float _2871 = fma(_2727, _2743, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _2873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2875 = _2873 != 0;
    float _2877 = fma(_2773, _2679, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2879 = -_217;
    int _2881 = _2851 ? as_type<int>(_2879) : as_type<int>(_217);
    float _2883 = -_2835;
    float _2885 = _2801 + _2883;
    if (_2159)
    {
        _2783 = 0;
    }
    int _2887 = _2783;
    float _2889 = 1.0 / _2869;
    int _2891 = ~_2365;
    int _2893 = _2891 + 1;
    float _2895 = -_1079;
    float _2897 = _2895 + 1.0;
    int _2899 = _2887;
    if (!_2159)
    {
        _2899 = 1;
    }
    int _2901 = _2899;
    out.m_86.x = _1247;
    bool _2903 = !_2875;
    float _2905 = _2903 ? _217 : as_type<float>(_2881);
    int _2907 = _2893 * _2861;
    int _2909 = _2907 + _2437;
    bool _2911 = _2901 != 1;
    float _2913 = exp2(_2859);
    float _2915 = float(_2365);
    out.m_88.x = _1950;
    out.m_88.y = _1948;
    out.m_88.z = _1952;
    float _2917 = float(_2477);
    float _2919 = float(_2437);
    float _2921 = _2843 * _2915;
    int _2923 = int(_2765) + int(_2867);
    float _2925 = _159 * _2889;
    int _2927 = ~_2477;
    int _2929 = _2927 + 1;
    float _2931 = _2885 * _2917;
    float _2933 = float(_2683);
    float _2935 = _2925 * _2915;
    bool _2937 = _2919 >= _2915;
    bool _2939 = isnan(_2919);
    bool _2941 = _2937 || _2939;
    bool _2943 = isnan(_2915);
    bool _2945 = _2941 || _2943;
    float _2947 = float(_2945);
    float _2949 = _2925 * _2917;
    bool _2951 = uint(_2909) >= uint(_2365);
    float _2953 = trunc(_2921);
    int _2955 = int(_2953);
    bool _2957 = _2933 >= _2917;
    bool _2959 = isnan(_2933);
    bool _2961 = _2957 || _2959;
    bool _2963 = isnan(_2917);
    bool _2965 = _2961 || _2963;
    float _2967 = float(_2965);
    int _2969 = _2929 * _2923;
    int _2971 = _2969 + _2683;
    bool _2973 = !_2951;
    int _2975 = _2973 ? 0 : (-1);
    int _2977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2979 = _2977 != 0;
    bool _2981 = uint(_2971) >= uint(_2477);
    float _2983 = trunc(_2947);
    int _2985 = int(_2983);
    int _2987 = ~_2861;
    int _2989 = _2987 + _2975;
    int _2991 = _2989 + 1;
    int _2993 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2995 = _2993 != 0;
    bool _2997 = !_2979;
    int _2999 = _2997 ? 0 : 1;
    int _3001 = _2365 * _2991;
    int _3003 = _3001 + _2437;
    bool _3005 = !_2995;
    int _3007 = _3005 ? 0 : 1;
    float _3009 = trunc(_2931);
    int _3011 = int(_3009);
    int _3013 = abs(_2999);
    bool _3015 = !_2981;
    int _3017 = _3015 ? 0 : (-1);
    bool _3019 = _2365 == 0;
    int _3021 = ~_2923;
    int _3023 = _3021 + _3017;
    int _3025 = _3023 + 1;
    float _3027 = trunc(_2967);
    int _3029 = int(_3027);
    int _3031 = abs(_3007);
    int _3033 = _2477 * _3025;
    int _3035 = _3033 + _2683;
    int _3037 = ~_2985;
    int _3039 = _3037 + 1;
    int _3041 = _3039 + 1;
    int _3043 = _2955 * _3013;
    int _3045 = _3043 + _2437;
    bool _3047 = !_3019;
    int _3049 = _3047 ? _3003 : (-1);
    int _3051 = _3011 * _3031;
    int _3053 = _3051 + _2683;
    bool _3055 = _2477 == 0;
    float _3057 = trunc(_2935);
    int _3059 = int(_3057);
    int _3061 = _2365 + (-1);
    int _3063 = _3049 * _3041;
    bool _3065 = !_3055;
    int _3067 = _3065 ? _3035 : (-1);
    int _3069 = ~_3029;
    int _3071 = _3069 + 1;
    int _3073 = _3071 + 1;
    int _3075 = _2985 * _3061;
    int _3077 = _3075 + _3063;
    int _3079 = abs(_1492);
    float _3081 = trunc(_2949);
    int _3083 = int(_3081);
    int _3085 = _2477 + (-1);
    int _3087 = _3067 * _3073;
    int _3089 = abs(_1592);
    int _3091 = _3029 * _3085;
    int _3093 = _3091 + _3087;
    bool _3095 = _981 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _3097 = isnan(_981);
    bool _3099 = _3095 || _3097;
    bool _3101 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _3103 = _3099 || _3101;
    float _3105 = float(_3103);
    int _3107 = abs(_1518);
    int _3109 = _3077 * _3079;
    bool _3111 = _981 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _3113 = isnan(_981);
    bool _3115 = _3111 || _3113;
    bool _3117 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _3119 = _3115 || _3117;
    float _3121 = float(_3119);
    float _3123 = -_3105;
    float _3125 = _3123 + 1.0;
    int _3127 = abs(_1608);
    int _3129 = _3093 * _3089;
    bool _3131 = _981 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _3133 = isnan(_981);
    bool _3135 = _3131 || _3133;
    bool _3137 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _3139 = _3135 || _3137;
    float _3141 = float(_3139);
    float _3143 = _3121 * _3125;
    float _3145 = -_3121;
    float _3147 = _3145 + 1.0;
    bool _3149 = _981 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _3151 = isnan(_981);
    bool _3153 = _3149 || _3151;
    bool _3155 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _3157 = _3153 || _3155;
    float _3159 = float(_3157);
    int _3161 = _3059 * _3107;
    int _3163 = _3161 + _3109;
    float _3165 = -_3141;
    float _3167 = _3165 + 1.0;
    float _3169 = _3141 * _3147;
    bool _3171 = !_2661;
    int _3173 = _3171 ? 0 : 1;
    int _3175 = _3083 * _3127;
    int _3177 = _3175 + _3129;
    int _3179 = abs(_1604);
    float _3181 = _3159 * _3167;
    int _3183 = abs(_1612);
    int _3185 = abs(_3173);
    int _3187 = _3045 * _3179;
    int _3189 = _3187 + _3163;
    float _3191 = _2737 * _3181;
    int _3193 = abs(_1616);
    int _3195 = _3053 * _3183;
    int _3197 = _3195 + _3177;
    float _3199 = -_3159;
    float _3201 = _3199 + 1.0;
    int _3203 = _2955 * _3185;
    int _3205 = _3203 + _3189;
    float _3207 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2721);
    float _3209 = -_159;
    float _3211 = fma(_3209, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2703);
    float _3213 = _2857 + 0.5;
    float _3215 = float(uint(_3205));
    int _3217 = _3011 * _3193;
    int _3219 = _3217 + _3197;
    float _3221 = _2839 + (-0.5);
    float _3223 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3225 = fma(_3213, (*spvDescriptorSet0.vp_c9)._m0[80].x, _3211);
    float _3227 = as_type<float>(_2667) * _3215;
    float _3229 = fma(_3201, (*spvDescriptorSet0.vp_c9)._m0[131].x, _3191);
    float _3231 = _3213;
    float _3233 = _3191;
    if (!_2911)
    {
        _3231 = _2595;
    }
    float _3235 = _3231;
    float _3237 = fma(_2593, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3223);
    float _3239 = trunc(_3227);
    float _3241 = precise::max(_3239, 0.0);
    uint _3243 = uint(_3241);
    float _3245 = _3235;
    if (!_2911)
    {
        _3233 = _2595;
    }
    float _3247 = _3233;
    float _3249 = -_3221;
    float _3251 = -_3207;
    float _3253 = fma(_3249, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3251);
    float _3255 = _3247;
    if (_2911)
    {
        _3245 = _2593;
    }
    float _3257 = _3245;
    float _3259 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3237);
    if (_2911)
    {
        _3255 = _2593;
    }
    float _3261 = _3255;
    float _3263 = _3257 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _3265 = float(uint(_3219));
    int _3267 = ~_2365;
    int _3269 = _3267 + 1;
    float _3271 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3273 = as_type<float>(_2725) * _3265;
    float _3275 = fma(_2595, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3271);
    int _3277 = _3269 * int(_3243);
    int _3279 = _3277 + _3205;
    float _3281 = _3271;
    if (!_2911)
    {
        _3281 = _2597;
    }
    float _3283 = _3281;
    float _3285 = _3283;
    if (_2911)
    {
        _2651 = _2595;
    }
    float _3287 = _2651;
    float _3289 = trunc(_3273);
    float _3291 = precise::max(_3289, 0.0);
    uint _3293 = uint(_3291);
    if (_2911)
    {
        _3285 = _2595;
    }
    float _3295 = _3285;
    float _3297 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3299 = fma(_2871, _3169, _3229);
    float _3301 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3303 = float(uint(_3279));
    float _3305 = fma(_3261, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3297);
    int _3307 = ~_2477;
    int _3309 = _3307 + 1;
    float _3311 = fma(_3295, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3301);
    float _3313 = as_type<float>(_2667) * _3303;
    float _3315 = float(uint(_3045));
    float _3317 = fma(_2877, _3143, _3299);
    float _3319 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3321 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3275);
    float _3323 = trunc(_3313);
    float _3325 = precise::max(_3323, 0.0);
    uint _3327 = uint(_3325);
    int _3329 = _3309 * int(_3293);
    int _3331 = _3329 + _3219;
    float _3333 = as_type<float>(_2667) * _3315;
    float _3335 = _3287 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _3337 = -_3319;
    float _3339 = fma(_3263, 2.0, _3337);
    float _3341 = fma(_3105, (*spvDescriptorSet0.vp_c9)._m0[134].x, _3317);
    float _3343 = float(uint(_3331));
    float _3345 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3347 = trunc(_3333);
    float _3349 = precise::max(_3347, 0.0);
    uint _3351 = uint(_3349);
    int _3353 = ~_2365;
    int _3355 = _3353 + 1;
    float _3357 = -_159;
    float _3359 = fma(_3357, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3339);
    float _3361 = as_type<float>(_2725) * _3343;
    float _3363 = fma(_3335, -2.0, _3345);
    int _3365 = ~_2365;
    int _3367 = _3365 + 1;
    float _3369 = _2905 + 0.5;
    float _3371 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3305);
    int _3373 = int(_3243) + int(_3327);
    float _3375 = trunc(_3361);
    float _3377 = precise::max(_3375, 0.0);
    uint _3379 = uint(_3377);
    float _3381 = fma(_3369, (*spvDescriptorSet0.vp_c9)._m0[85].x, _3359);
    float _3383 = float(uint(_3053));
    float _3385 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3311);
    int _3387 = _3355 * _3373;
    int _3389 = _3387 + _3205;
    float _3391 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3363);
    float _3393 = _2827 + (-0.5);
    int _3395 = _3367 * int(_3351);
    int _3397 = _3395 + _3045;
    int _3399 = ~_2477;
    int _3401 = _3399 + 1;
    float _3403 = as_type<float>(_2725) * _3383;
    bool _3405 = uint(_3389) >= uint(_2365);
    float _3407 = -_3321;
    float _3409 = _3407 + 1.0;
    float _3411 = float(uint(_3397));
    bool _3413 = !_3405;
    int _3415 = _3413 ? 0 : (-1);
    int _3417 = int(_3293) + int(_3379);
    float _3419 = -_3393;
    float _3421 = -_3391;
    float _3423 = fma(_3419, (*spvDescriptorSet0.vp_c9)._m0[85].y, _3421);
    int _3425 = ~_3373;
    int _3427 = _3425 + _3415;
    int _3429 = _3427 + 1;
    float _3431 = -_3259;
    float _3433 = _3431 + 1.0;
    int _3435 = _3401 * _3417;
    int _3437 = _3435 + _3219;
    float _3439 = as_type<float>(_2667) * _3411;
    int _3441 = _2365 * _3429;
    int _3443 = _3441 + _3205;
    float _3445 = -_3385;
    float _3447 = _3445 + 1.0;
    float _3449 = trunc(_3403);
    float _3451 = precise::max(_3449, 0.0);
    uint _3453 = uint(_3451);
    float _3455 = -_3433;
    float _3457 = fma(_2857, _3455, _3225);
    int _3459 = ~_2477;
    int _3461 = _3459 + 1;
    float _3463 = fma(_2827, _3447, _3423);
    float _3465 = _947 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3467 = fma(_2839, _3409, _3253);
    float _3469 = _949 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _3471 = !_3019;
    int _3473 = _3471 ? _3443 : (-1);
    float _3475 = _3341 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _3477 = uint(_3437) >= uint(_2477);
    float _3479 = -_3371;
    float _3481 = _3479 + 1.0;
    int _3483 = _3473 & 3;
    bool _3485 = _3483 != 0;
    float _3487 = _3465 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3489 = _3473 & 3;
    bool _3491 = _3489 != 0;
    float _3493 = -_3481;
    float _3495 = fma(_2905, _3493, _3381);
    bool _3497 = uint(_3483) > 1u;
    int _3499 = _3461 * int(_3453);
    int _3501 = _3499 + _3053;
    bool _3503 = !_3477;
    int _3505 = _3503 ? 0 : (-1);
    float _3507 = _3469 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3509 = _3491 ? 0 : 1;
    float _3511 = trunc(_3439);
    float _3513 = precise::max(_3511, 0.0);
    uint _3515 = uint(_3513);
    float _3517 = float(uint(_3501));
    out.m_90.x = _3457;
    out.m_90.y = _3467;
    out.m_90.z = _3495;
    out.m_90.w = _3463;
    int _3519 = ~_3417;
    int _3521 = _3519 + _3505;
    int _3523 = _3521 + 1;
    int _3525 = ~_3509;
    int _3527 = _3525 + 1;
    int _3529 = _3527 + 1;
    float _3531 = as_type<float>(_2725) * _3517;
    float _3533 = _1199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3535 = _3529;
    if (!_3497)
    {
        int _3537 = ~_3509;
        int _3539 = _3537 + 1;
        _3535 = _3539;
    }
    int _3541 = _3535;
    int _3543 = _2477 * _3523;
    int _3545 = _3543 + _3219;
    bool _3547 = uint(_3483) >= 2u;
    out.m_92.x = _3487;
    out.m_92.y = _3507;
    out.m_92.z = _2779;
    out.m_92.w = _3475;
    float _3549 = trunc(_3531);
    float _3551 = precise::max(_3549, 0.0);
    uint _3553 = uint(_3551);
    int _3555 = _3473 >> 31;
    float _3557 = _3533 * _1291;
    bool _3559 = !_3485;
    int _3561 = _3559 ? 0 : 1;
    int _3563 = _3547 ? 0 : 1;
    bool _3565 = _3483 != 3;
    int _3567 = _3555 & 3;
    int _3569 = int(_3351) + int(_3515);
    float _3571 = fma(_3533, _3533, 1.0);
    bool _3573 = !_3055;
    int _3575 = _3573 ? _3545 : (-1);
    int _3577 = _3473 + _3567;
    int _3579 = _3575 >> 31;
    float _3581 = rsqrt(_3571);
    int _3583 = ~_2365;
    int _3585 = _3583 + 1;
    int _3587 = _3579 & 3;
    int _3589 = ~_2477;
    int _3591 = _3589 + 1;
    int _3593 = ~_3563;
    int _3595 = _3593 + 1;
    int _3597 = _3595 + 1;
    int _3599 = _3577 >> 2;
    int _3601 = _3597;
    if (_3565)
    {
        int _3603 = ~_3563;
        int _3605 = _3603 + 1;
        _3601 = _3605;
    }
    int _3607 = _3601;
    int _3609 = _3575 + _3587;
    int _3611 = _3585 * _3569;
    int _3613 = _3611 + _3045;
    int _3615 = int(_3453) + int(_3553);
    float _3617 = _3533 * _3581;
    int _3619 = _3599 << 4;
    int _3621 = _3619 + 368;
    int _3623 = _3609 >> 2;
    int _3625 = _3591 * _3615;
    int _3627 = _3625 + _3053;
    bool _3629 = uint(_3613) >= uint(_2365);
    float _3631 = -_1153;
    float _3633 = _3617 * _3631;
    uint _3635 = uint(int(uint(_3621) >> uint(2)));
    uint _3637 = uint(int(uint(int(_3635)) >> uint(2)));
    int _3639 = int(_3635) & 3;
    float _3641 = (*spvDescriptorSet0.vp_c9)._m0[int(_3637)][_3639];
    int _3643 = int(_3635) + 1;
    uint _3645 = uint(int(uint(_3643) >> uint(2)));
    int _3647 = _3643 & 3;
    float _3649 = (*spvDescriptorSet0.vp_c9)._m0[int(_3645)][_3647];
    int _3651 = _3623 << 4;
    int _3653 = _3651 + 512;
    float _3655 = -_1151;
    float _3657 = _3617 * _3655;
    float _3659 = -_1163;
    float _3661 = _3617 * _3659;
    bool _3663 = !_3629;
    int _3665 = _3663 ? 0 : (-1);
    float _3667 = fma(_3581, _1291, _3633);
    bool _3669 = uint(_3627) >= uint(_2477);
    float _3671 = fma(_3581, _1295, _3657);
    float _3673 = fma(_3581, _1418, _3661);
    uint _3675 = uint(int(uint(_3653) >> uint(2)));
    uint _3677 = uint(int(uint(int(_3675)) >> uint(2)));
    int _3679 = int(_3675) & 3;
    float _3681 = (*spvDescriptorSet0.vp_c9)._m0[int(_3677)][_3679];
    int _3683 = int(_3675) + 1;
    uint _3685 = uint(int(uint(_3683) >> uint(2)));
    int _3687 = _3683 & 3;
    float _3689 = (*spvDescriptorSet0.vp_c9)._m0[int(_3685)][_3687];
    bool _3691 = !_3669;
    int _3693 = _3691 ? 0 : (-1);
    float _3695 = _3533 * _1295;
    int _3697 = _3575 & 3;
    bool _3699 = _3697 != 0;
    out.m_94.x = _3671;
    out.m_94.y = _3673;
    out.m_94.z = _3667;
    int _3701 = _3575 & 3;
    bool _3703 = _3701 != 0;
    float _3705 = _3533 * _1418;
    int _3707 = _3699 ? 0 : 1;
    int _3709 = _3621 + 8;
    uint _3711 = uint(int(uint(_3709) >> uint(2)));
    uint _3713 = uint(int(uint(int(_3711)) >> uint(2)));
    int _3715 = int(_3711) & 3;
    float _3717 = (*spvDescriptorSet0.vp_c9)._m0[int(_3713)][_3715];
    int _3719 = int(_3711) + 1;
    uint _3721 = uint(int(uint(_3719) >> uint(2)));
    int _3723 = _3719 & 3;
    float _3725 = (*spvDescriptorSet0.vp_c9)._m0[int(_3721)][_3723];
    bool _3727 = uint(_3701) > 1u;
    float _3729 = _1235 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3731 = ~_3707;
    int _3733 = _3731 + 1;
    int _3735 = _3733 + 1;
    int _3737 = ~_3615;
    int _3739 = _3737 + _3693;
    int _3741 = _3739 + 1;
    float _3743 = fma(_3729, _1269, _3695);
    float _3745 = fma(_3729, _1271, _3705);
    int _3747 = abs(_3541);
    int _3749 = _3653 + 8;
    uint _3751 = uint(int(uint(_3749) >> uint(2)));
    uint _3753 = uint(int(uint(int(_3751)) >> uint(2)));
    int _3755 = int(_3751) & 3;
    float _3757 = (*spvDescriptorSet0.vp_c9)._m0[int(_3753)][_3755];
    int _3759 = int(_3751) + 1;
    uint _3761 = uint(int(uint(_3759) >> uint(2)));
    int _3763 = _3759 & 3;
    float _3765 = (*spvDescriptorSet0.vp_c9)._m0[int(_3761)][_3763];
    int _3767 = abs(_3561);
    float _3769 = fma(_3729, _1273, _3557);
    int _3771 = ~_3747;
    int _3773 = _3771 + 1;
    int _3775 = _3773 + 1;
    int _3777 = _2477 * _3741;
    int _3779 = _3777 + _3053;
    int _3781 = _3735;
    if (!_3727)
    {
        int _3783 = ~_3707;
        int _3785 = _3783 + 1;
        _3781 = _3785;
    }
    int _3787 = _3781;
    bool _3789 = uint(_3701) >= 2u;
    bool _3791 = !_3703;
    int _3793 = _3791 ? 0 : 1;
    int _3795 = _3789 ? 0 : 1;
    bool _3797 = _3701 != 3;
    int _3799 = ~_3767;
    int _3801 = _3799 + 1;
    int _3803 = _3801 + 1;
    int _3805 = abs(_3793);
    int _3807 = abs(_3787);
    int _3809 = abs(_3607);
    int _3811 = _3775 * as_type<int>(_3649);
    int _3813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3815 = _3813 != 0;
    int _3817 = ~_3807;
    int _3819 = _3817 + 1;
    int _3821 = _3819 + 1;
    int _3823 = _3803 * as_type<int>(_3641);
    int _3825 = _3823 + _3811;
    int _3827 = ~_3809;
    int _3829 = _3827 + 1;
    int _3831 = _3829 + 1;
    bool _3833 = _3483 != 3;
    float _3835 = abs(_1259);
    float _3837 = log2(_3835);
    bool _3839 = !_3815;
    int _3841 = _3839 ? 0 : 1;
    int _3843 = _3821 * as_type<int>(_3689);
    bool _3845 = _3701 != 3;
    int _3847 = ~_3795;
    int _3849 = _3847 + 1;
    int _3851 = _3849 + 1;
    int _3853 = ~_3805;
    int _3855 = _3853 + 1;
    int _3857 = _3855 + 1;
    int _3859 = _3831 * as_type<int>(_3717);
    int _3861 = _3859 + _3825;
    bool _3863 = !_3833;
    int _3865 = _3863 ? 0 : (-1);
    int _3867 = _3851;
    if (_3797)
    {
        int _3869 = ~_3795;
        int _3871 = _3869 + 1;
        _3867 = _3871;
    }
    int _3873 = _3867;
    int _3875 = _3857 * as_type<int>(_3681);
    int _3877 = _3875 + _3843;
    int _3879 = abs(_3841);
    bool _3881 = !_3845;
    int _3883 = _3881 ? 0 : (-1);
    int _3885 = abs(_3865);
    int _3887 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3889 = _3887 != 0;
    int _3891 = abs(_3873);
    int _3893 = abs(_3883);
    bool _3895 = !_3889;
    int _3897 = _3895 ? 0 : 1;
    int _3899 = ~_3885;
    int _3901 = _3899 + 1;
    int _3903 = _3901 + 1;
    int _3905 = abs(_3897);
    int _3907 = ~_3891;
    int _3909 = _3907 + 1;
    int _3911 = _3909 + 1;
    int _3913 = _3903 * as_type<int>(_3725);
    int _3915 = _3913 + _3861;
    float _3917 = _3837 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _3919 = ~_3879;
    int _3921 = _3919 + 1;
    int _3923 = _3921 + 1;
    int _3925 = _3911 * as_type<int>(_3757);
    int _3927 = _3925 + _3877;
    int _3929 = ~_3893;
    int _3931 = _3929 + 1;
    int _3933 = _3931 + 1;
    float _3935 = fma(_2000, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2853);
    bool _3937 = !_3055;
    int _3939 = _3937 ? _3779 : (-1);
    int _3941 = _3915 * _3923;
    float _3943 = exp2(_3917);
    int _3945 = ~_3905;
    int _3947 = _3945 + 1;
    int _3949 = _3947 + 1;
    int _3951 = _3933 * as_type<int>(_3765);
    int _3953 = _3951 + _3927;
    int _3955 = ~_3569;
    int _3957 = _3955 + _3665;
    int _3959 = _3957 + 1;
    float _3961 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3935);
    int _3963 = _3953 * _3949;
    bool _3965 = _1259 <= 8000.0;
    bool _3967 = isnan(_1259);
    bool _3969 = _3965 || _3967;
    bool _3971 = isnan(8000.0);
    bool _3973 = _3969 || _3971;
    float _3975 = float(_3973);
    int _3977 = _2365 * _3959;
    int _3979 = _3977 + _3045;
    out.gl_Position.x = _2074;
    out.gl_Position.y = _2090;
    out.gl_Position.z = _3961;
    out.gl_Position.w = _2038;
    int _3981 = _3939 * _3905;
    int _3983 = _3981 + _3963;
    float _3985 = _3961 + _2038;
    bool _3987 = !_3019;
    int _3989 = _3987 ? _3979 : (-1);
    float _3991 = _2074 + _2038;
    float _3993 = float(_3983);
    float _3995 = fma(_3943, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3997 = precise::clamp(_3995, 0.0, 1.0);
    int _3999 = _3989 * _3879;
    int _4001 = _3999 + _3941;
    float _4003 = _2038 * 0.5;
    float _4005 = fma(_3997, -2.0, 3.0);
    float _4007 = _3997 * _3997;
    float _4009 = _3985 * 0.5;
    float _4011 = fma(_2090, -0.5, _4003);
    float _4013 = float(_4001);
    float _4015 = _4007 * _4005;
    float _4017 = _3991 * 0.5;
    float _4019 = _1151 + _3743;
    float _4021 = _1163 + _3745;
    float _4023 = -_4015;
    float _4025 = _4023 + 1.0;
    out.m_96.x = _4013;
    out.m_96.y = _3993;
    float _4027 = _1153 + _3769;
    float _4029 = _4025;
    if (!_2022)
    {
        _2078 = 1.0;
    }
    float _4031 = _2078;
    float _4033 = fma(_4025, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4015);
    out.m_98.x = _4017;
    out.m_98.y = _4011;
    out.m_98.z = _4009;
    out.m_98.w = _2038;
    float _4035 = _4031;
    if (_2022)
    {
        bool _4037 = _2128 >= _2100;
        bool _4039 = isnan(_2128);
        bool _4041 = _4037 || _4039;
        bool _4043 = isnan(_2100);
        bool _4045 = _4041 || _4043;
        float _4047 = float(_4045);
        _4035 = _4047;
    }
    float _4049 = _4035;
    float _4051 = _3975 * _4033;
    out.m_100.x = _4019;
    out.m_100.y = _4021;
    out.m_100.z = _4027;
    bool _4053 = _2379 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4055 = isnan(_2379);
    bool _4057 = _4053 || _4055;
    bool _4059 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4061 = _4057 || _4059;
    float _4063 = _4049 * _2349;
    float _4065 = _4051 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4067 = -_2913;
    float _4069 = _4067 + 1.0;
    float _4071 = _2897 * _4065;
    float _4073 = precise::clamp(_4071, 0.0, 1.0);
    float _4075 = _4069 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4077 = -_4073;
    float _4079 = fma(_4077, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4081 = _4075 * _2130;
    float _4083 = -_4075;
    float _4085 = _4083 + 1.0;
    float _4087 = _4085;
    float _4089 = _4073;
    float _4091 = _4063;
    if (!_4061)
    {
        _4029 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4093 = _4029;
    float _4095 = -_4063;
    float _4097 = fma(_4095, _4079, 1.0);
    float _4099 = precise::clamp(_4097, 0.0, 1.0);
    float _4101 = _2141 * _4081;
    float _4103 = _2643 * _4081;
    float _4105 = _2141 * _4085;
    float _4107 = _4099 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4109 = fma(_2639, _4101, _2135);
    float _4111 = fma(_2641, _4101, _2137);
    float _4113 = fma(_2141, _4103, _2139);
    float _4115 = _2223 * _2285;
    out.m_102.x = _4107;
    float _4117 = _4107;
    float _4119 = _4115;
    float _4121 = _4093;
    float _4123 = _4093;
    if (!_4061)
    {
        _4087 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4125 = _4087;
    float _4127 = _4115 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_104.x = _4109;
    out.m_104.y = _4111;
    out.m_104.z = _4113;
    out.m_104.w = _4105;
    float _4129 = _4125;
    float _4131 = _4125;
    if (!_4061)
    {
        _4089 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4133 = _4089;
    float _4135 = _4133;
    float _4137 = _4133;
    if (!_4061)
    {
        _4091 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4139 = _4091;
    float _4141 = _4139;
    float _4143 = _4139;
    if (!_4061)
    {
        _4117 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4145 = _4117;
    float _4147 = _4145;
    float _4149 = _4145;
    if (!_4061)
    {
        _4119 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4151 = _4119;
    bool _4153 = !_4061;
    float _4155 = _4151;
    float _4157 = _4151;
    if (!_4153)
    {
        bool _4159 = _2379 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4161 = isnan(_2379);
        bool _4163 = _4159 || _4161;
        bool _4165 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4167 = _4163 || _4165;
        if (!_4167)
        {
            float _4169 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4171 = _2379 + _4169;
            float _4173 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4175 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4173;
            float _4177 = 1.0 / _4175;
            float _4179 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4181 = _4179 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4183 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4185 = _4183 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4187 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4189 = _4187 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4191 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4193 = _4191 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4195 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4197 = _4195 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4199 = _4171 * _4177;
            float _4201 = precise::clamp(_4199, 0.0, 1.0);
            float _4203 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4205 = _4203 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4207 = fma(_4201, _4181, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4209 = fma(_4201, _4205, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4211 = fma(_4201, _4185, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4213 = fma(_4201, _4189, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4215 = fma(_4201, _4193, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4217 = fma(_4201, _4197, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4131 = _4207;
            _4149 = _4215;
            _4123 = _4209;
            _4143 = _4213;
            _4137 = _4211;
            _4157 = _4217;
            _4219 = true;
        }
        else
        {
            bool _4221 = _2379 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4223 = isnan(_2379);
            bool _4225 = _4221 || _4223;
            bool _4227 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4229 = _4225 || _4227;
            if (!_4229)
            {
                _4121 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4231 = _4121;
            _4123 = _4231;
            if (!_4229)
            {
                _4129 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4233 = _4129;
            _4131 = _4233;
            if (!_4229)
            {
                _4135 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4235 = _4135;
            _4137 = _4235;
            if (!_4229)
            {
                _4141 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4237 = _4141;
            _4143 = _4237;
            if (!_4229)
            {
                _4147 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4239 = _4147;
            _4149 = _4239;
            if (!_4229)
            {
                _4155 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4241 = _4155;
            bool _4243 = !_4229;
            _4157 = _4241;
            if (!_4243)
            {
                bool _4245 = _2379 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4247 = isnan(_2379);
                bool _4249 = _4245 || _4247;
                bool _4251 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4253 = _4249 || _4251;
                if (!_4253)
                {
                    float _4255 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4257 = _2379 + _4255;
                    float _4259 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4261 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4259;
                    float _4263 = 1.0 / _4261;
                    float _4265 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4267 = _4265 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4269 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4271 = _4269 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4273 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4275 = _4273 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4277 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4279 = _4277 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4281 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4283 = _4281 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4285 = _4257 * _4263;
                    float _4287 = precise::clamp(_4285, 0.0, 1.0);
                    float _4289 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4291 = _4289 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4293 = fma(_4287, _4267, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4295 = fma(_4287, _4291, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4297 = fma(_4287, _4271, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4299 = fma(_4287, _4275, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4301 = fma(_4287, _4279, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4303 = fma(_4287, _4283, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4131 = _4293;
                    _4149 = _4301;
                    _4123 = _4295;
                    _4143 = _4299;
                    _4137 = _4297;
                    _4157 = _4303;
                    _4219 = true;
                }
                else
                {
                    _4131 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4149 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4123 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4143 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4137 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4157 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4219 = false;
    float _4305 = _4131;
    float _4307 = _4149;
    float _4309 = _4123;
    float _4311 = _4143;
    float _4313 = _4137;
    float _4315 = _4157;
    float _4317 = fma(_4021, -0.5, 0.5);
    float _4319 = precise::clamp(_4317, 0.0, 1.0);
    float _4321 = -_4305;
    float _4323 = _4321 + _4307;
    float _4325 = _4127 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4327 = -_4309;
    float _4329 = _4327 + _4311;
    out.m_106.x = 0.0;
    float _4331 = fma(_4319, _4323, _4305);
    float _4333 = fma(_4319, _4329, _4309);
    out.m_59.x = _4325;
    float _4335 = -_4313;
    float _4337 = _4335 + _4315;
    float _4339 = _4331 * 0.586610972881317138671875;
    bool _4341 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4343 = fma(_4319, _4337, _4313);
    float _4345 = fma(_4333, 0.298911988735198974609375, _4339);
    bool _4347 = _2223 > 0.0;
    bool _4349 = isnan(_2223);
    bool _4351 = _4347 || _4349;
    bool _4353 = isnan(0.0);
    bool _4355 = _4351 || _4353;
    float _4357 = fma(_4343, 0.114477999508380889892578125, _4345);
    bool _4359 = _2285 <= 0.0;
    bool _4361 = !_4355;
    bool _4363 = _4359 || _4361;
    float _4365 = -_4357;
    float _4367 = _4333 + _4365;
    float _4369 = -_4357;
    float _4371 = _4331 + _4369;
    float _4373 = -_4357;
    float _4375 = _4343 + _4373;
    float _4377 = fma(_4367, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4357);
    float _4379 = fma(_4371, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4357);
    float _4381 = fma(_4375, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4357);
    bool _4383 = !_4341;
    if (!_4383)
    {
        float _4385 = -_1948;
        float _4387 = _4385 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4389 = -_1950;
        float _4391 = _4389 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4393 = -_1952;
        float _4395 = _4393 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4397 = _4387 * _4387;
        float _4399 = fma(_4391, _4391, _4397);
        float _4401 = fma(_4395, _4395, _4399);
        float _4403 = sqrt(_4401);
        float _4405 = rsqrt(_4401);
        float _4407 = -_4403;
        float _4409 = _4407 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4411 = _4409 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4413 = precise::clamp(_4411, 0.0, 1.0);
        float _4415 = _4391 * _4405;
        float _4417 = _4387 * _4405;
        float _4419 = abs(_4413);
        float _4421 = log2(_4419);
        float _4423 = _4395 * _4405;
        float _4425 = _4415 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4427 = _4021 * _4417;
        float _4429 = -_4417;
        float _4431 = -_4425;
        float _4433 = fma(_4429, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4431);
        float _4435 = fma(_4019, _4415, _4427);
        float _4437 = -_4423;
        float _4439 = fma(_4437, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4433);
        float _4441 = fma(_4027, _4423, _4435);
        float _4443 = precise::clamp(_4441, 0.0, 1.0);
        float _4445 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4447 = _4439 + _4445;
        float _4449 = _4421 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4451 = _4447 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4453 = precise::clamp(_4451, 0.0, 1.0);
        float _4455 = exp2(_4449);
        float _4457 = _4455 * _4453;
        float _4459 = _4443 * _4457;
        float _4461 = _4459 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4463 = _4459 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4465 = _4459 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_106.x = _4461;
        out.m_106.y = _4463;
        out.m_106.z = _4465;
    }
    out.m_82.x = _4377;
    out.m_82.y = _4379;
    out.m_82.z = _4381;
    if (!_4363)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_59.x = 0.0;
    float _4467 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4467;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

