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
    float4 m_59 [[user(locn0)]];
    float4 m_88 [[user(locn1)]];
    float4 m_92 [[user(locn2)]];
    float4 m_72 [[user(locn3)]];
    float4 m_74 [[user(locn4)]];
    float4 m_78 [[user(locn5)]];
    float4 m_80 [[user(locn6)]];
    float4 m_76 [[user(locn7)]];
    float4 m_82 [[user(locn8)]];
    float4 m_90 [[user(locn9)]];
    float4 m_86 [[user(locn10)]];
    float4 m_84 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_68 [[attribute(1)]];
    float4 m_56 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_66 [[attribute(4)]];
    float4 m_70 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4009 = false;
    bool _355 = false;
    bool _207 = false;
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
        float _4294 = as_type<float>(_127);
        out.gl_Position.z = _4294;
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
        float _4364 = as_type<float>(_165);
        out.gl_Position.z = _4364;
    }
    if (_157)
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
        float _189 = in.m_66.x;
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
    bool _221 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _223 = isnan(_215);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    bool _233 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _235 = isnan(_215);
    bool _237 = _233 || _235;
    bool _239 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _241 = _237 || _239;
    float _243 = float(_241);
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _247 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _245;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _251 = _249 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _253 = -_231;
    float _255 = _253 + 1.0;
    float _257 = 1.0 / _251;
    bool _259 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _261 = isnan(_215);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    float _271 = _243 * _255;
    float _273 = -_243;
    float _275 = _273 + 1.0;
    bool _277 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _279 = _269 * _275;
    float _281 = 1.0 / _247;
    float _283 = -_269;
    float _285 = _283 + 1.0;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _289 = _287 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _291 = _219 * _281;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _295 = _215 + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _301;
    float _305 = _295 * _257;
    float _307 = fma(_299, _291, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _309 = fma(_303, _291, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _313 = _311 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _315 = fma(_289, _305, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _317 = _307 * _279;
    float _319 = _309 * _279;
    float _321 = fma(_313, _305, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _323 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[143].x, _317);
    float _325 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[143].y, _319);
    float _327 = fma(_321, _271, _323);
    float _329 = fma(_315, _271, _325);
    float _331 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[145].x, _327);
    float _333 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[145].y, _329);
    bool _335 = !_277;
    float _353;
    if (!_335)
    {
        float _337 = in.m_66.x;
        float _339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _341 = _337 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _343 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[14].x, _145);
        float _345 = _343 * _339;
        float _347 = floor(_345);
        float _349 = -_347;
        float _351 = _345 + _349;
        _353 = _351;
        _355 = true;
    }
    else
    {
        float _357 = float(_111);
        float _359 = 1.0 / _357;
        float _361 = _145 * _359;
        _353 = _361;
    }
    _355 = false;
    float _363 = _353;
    float _365 = in.m_56.x;
    float _367 = in.m_56.y;
    float _369 = in.m_56.z;
    float _371 = _367 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _373 = _367 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _375 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].x, _371);
    float _377 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].x, _373);
    float _379 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[4].z, _375);
    float _381 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[6].z, _377);
    float _383 = _379 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _385 = _381 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _387 = fma(_383, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _389 = fma(_385, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _391 = floor(_387);
    float _393 = floor(_389);
    float _395 = -_391;
    float _397 = _387 + _395;
    float _399 = -_393;
    float _401 = _389 + _399;
    float2 _4749 = float2(_397, _401);
    float _403 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4749, float2(0.0), isnan(_4749)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4749, float2(0.0), isnan(_4749)), level(0.0)).x;
    float _405 = in.m_66.x;
    float _407 = in.m_66.y;
    float _409 = in.m_66.z;
    float _411 = in.m_66.w;
    float _413 = _367 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _415 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _417 = log2(_415);
    int _419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _421 = _419 != 0;
    float _423 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].x, _413);
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _427 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[5].z, _423);
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _431 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _433 = int(_431);
    float _435 = float(_111);
    int _437 = as_type<int>(_365);
    float _439 = _423;
    float _441 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_421)
    {
        _437 = 0;
    }
    int _443 = _437;
    int _445 = _443;
    if (!_421)
    {
        _445 = 1;
    }
    int _447 = _445;
    float _449 = 1.0 / _435;
    float _451 = _417 * _145;
    float _453 = _405 * 2.0;
    float _455 = _407 * 2.0;
    float _457 = _405 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _459 = _447 != 1;
    float _461 = _407 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _463 = floor(_453);
    float _465 = -_425;
    float _467 = fma(_457, 2.0, _465);
    float _469 = _405 + _407;
    float _471 = fma(_461, -2.0, _429);
    float _473 = -_145;
    float _475 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[76].x, _467);
    float _477 = _469 + (-1.0);
    float _479 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _471);
    float _481 = floor(_455);
    float _483 = _409 * 2.0;
    if (!_459)
    {
        _439 = _407;
    }
    float _485 = _439;
    float _487 = _485;
    if (_459)
    {
        _487 = _405;
    }
    float _489 = _487;
    float _491 = floor(_483);
    bool _493 = _463 > 0.0;
    bool _495 = _463 >= 0.0;
    bool _497 = isnan(_463);
    bool _499 = _495 || _497;
    bool _501 = isnan(0.0);
    bool _503 = _499 || _501;
    float _505 = _503 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _507 = exp2(_451);
    bool _509 = _481 > 0.0;
    float _511 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _513 = _481 >= 0.0;
    bool _515 = isnan(_481);
    bool _517 = _513 || _515;
    bool _519 = isnan(0.0);
    bool _521 = _517 || _519;
    int _523 = ~as_type<int>(_505);
    int _525 = _523 + 1;
    int _527 = _525 + 1;
    int _529 = _521 ? 0 : 1;
    float _531 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _533 = int(_531);
    bool _535 = _491 >= 0.0;
    bool _537 = isnan(_491);
    bool _539 = _535 || _537;
    bool _541 = isnan(0.0);
    bool _543 = _539 || _541;
    bool _545 = _491 > 0.0;
    int _547 = _527;
    float _549 = _505;
    float _551 = _489;
    if (!_493)
    {
        int _553 = ~as_type<int>(_505);
        int _555 = _553 + 1;
        _547 = _555;
    }
    int _557 = _547;
    int _559 = _543 ? 0 : 1;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_459)
    {
        _549 = _409;
    }
    float _563 = _549;
    int _565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _567 = _565 != 0;
    int _569 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _571 = _569 != 0;
    int _573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _575 = _573 != 0;
    int _577 = ~_529;
    int _579 = _577 + 1;
    int _581 = _579 + 1;
    float _583 = _563;
    int _585 = _581;
    if (_459)
    {
        _583 = _407;
    }
    float _587 = _583;
    if (!_509)
    {
        int _589 = ~_529;
        int _591 = _589 + 1;
        _585 = _591;
    }
    int _593 = _585;
    float _595 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[83].w, _561);
    bool _597 = !_571;
    int _599 = _597 ? 0 : 1;
    bool _601 = !_567;
    int _603 = _601 ? 0 : 1;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _607 = !_575;
    int _609 = _607 ? 0 : 1;
    float _611 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _595);
    int _613 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _615 = _613 != 0;
    int _617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _619 = _617 != 0;
    int _621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _623 = _621 != 0;
    float _625 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[83].z, _605);
    int _627 = ~_559;
    int _629 = _627 + 1;
    int _631 = _629 + 1;
    float _633 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _625);
    int _635 = _631;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_545)
    {
        int _639 = ~_559;
        int _641 = _639 + 1;
        _635 = _641;
    }
    int _643 = _635;
    float _645 = float(_533);
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _649 = !_619;
    int _651 = _649 ? 0 : 1;
    bool _653 = !_615;
    int _655 = _653 ? 0 : 1;
    float _657 = 1.0 / _645;
    if (!_459)
    {
        _551 = _407;
    }
    float _659 = _551;
    float _661 = _659;
    if (!_459)
    {
        _637 = _409;
    }
    float _663 = _637;
    float _665 = _663;
    if (_459)
    {
        _661 = _405;
    }
    float _667 = _661;
    if (_459)
    {
        _665 = _407;
    }
    float _669 = _665;
    int _671 = abs(_651);
    float _673 = _427 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _675 = abs(_655);
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _679 = _667 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _681 = _669 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _683 = float(_557);
    float _685 = _673 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _687 = float(_671);
    float _689 = _673 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _691 = float(_675);
    float _693 = fma(_681, -2.0, _677);
    float _695 = float(_643);
    float _697 = _687 * _683;
    float _699 = float(_433);
    float _701 = fma(_383, (*spvDescriptorSet0.vp_c8)._m0[11].x, _685);
    float _703 = fma(_383, (*spvDescriptorSet0.vp_c8)._m0[10].x, _689);
    float _705 = _691 * _695;
    float _707 = -_647;
    float _709 = fma(_679, 2.0, _707);
    float _711 = in.m_68.x;
    float _713 = in.m_68.y;
    float _715 = in.m_68.z;
    float _717 = fma(_385, (*spvDescriptorSet0.vp_c8)._m0[11].z, _701);
    float _719 = fma(_385, (*spvDescriptorSet0.vp_c8)._m0[10].z, _703);
    float _721 = _657 * _145;
    float _723 = _717 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _725 = _719 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _729 = 1.0 + _727;
    float _731 = 1.0 / _699;
    float _733 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _735 = _449 * _145;
    float _737 = _725 + _723;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _741 = -_145;
    float _743 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[81].x, _709);
    bool _745 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _747 = isnan(1.0);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _753 = _749 || _751;
    float _755 = 1.0 / _729;
    float _757 = -_507;
    float _759 = _757 + 1.0;
    float _761 = _673 + _733;
    float _763 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[78].z, _739);
    float _765 = _705 * (-2.0);
    bool _767 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _769 = isnan(0.0);
    bool _771 = _767 || _769;
    bool _773 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _775 = _771 || _773;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _779 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _763);
    float _781 = 1.0 / _723;
    float _783 = _761 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _785 = fma(_511, _765, _511);
    float _787 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[78].w, _777);
    float _789 = _775 ? _759 : 0.0;
    float _791 = fma(_383, (*spvDescriptorSet0.vp_c15)._m0[126].x, _783);
    float _793 = fma(_765, _711, _711);
    float _795 = _405 + (-0.5);
    bool _797 = !_623;
    int _799 = _797 ? 0 : 1;
    float _801 = _731 * _145;
    float _803 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _787);
    float _805 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _693);
    float _807 = fma(_385, (*spvDescriptorSet0.vp_c15)._m0[126].z, _791);
    float _809 = _761;
    if (_753)
    {
        float _811 = _789 * _755;
        _147 = _811;
    }
    float _813 = _147;
    float _815 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[196].x, _793);
    int _817 = abs(_799);
    float _819 = _737 * _781;
    float _821 = _819 * 0.5;
    float _823 = _409 + _407;
    float _825 = _807 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _827 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _829 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[30].w, _827);
    float _831 = _823 + (-1.0);
    float _833 = fma(_785, _813, _815);
    float _835 = _697 * (-2.0);
    float _837 = float(_593);
    float _839 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _841 = float(_817);
    float _843 = _407 + (-0.5);
    float _845 = fma(_835, _713, _713);
    float _847 = fma(_839, _835, _839);
    float _849 = _409 + _405;
    float _851 = _841 * _837;
    float _853 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[196].y, _845);
    float _855 = in.m_70.x;
    float _857 = in.m_70.y;
    float _859 = _851 * (-2.0);
    float _861 = _849 + (-1.0);
    float _863 = fma(_847, _813, _853);
    float _865 = 1.0 / _829;
    float _867 = fma(_859, _715, _715);
    float _869 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _871 = _409 + (-0.5);
    float _873 = _833 * 0.15915493667125701904296875;
    float _875 = _863 * 0.15915493667125701904296875;
    float _877 = fma(_869, _859, _869);
    float _879 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[196].z, _867);
    float _881 = _873 * 6.283185482025146484375;
    float _883 = sin(_881);
    float _885 = _761 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _887 = fma(_877, _813, _879);
    float _889 = fma(_383, (*spvDescriptorSet0.vp_c15)._m0[127].x, _885);
    float _891 = _887 * 0.15915493667125701904296875;
    float _893 = _873 * 6.283185482025146484375;
    float _895 = cos(_893);
    float _897 = fma(_385, (*spvDescriptorSet0.vp_c15)._m0[127].z, _889);
    float _899 = _331 * _855;
    float _901 = _333 * _857;
    float _903 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _905 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _907 = _875 * 6.283185482025146484375;
    float _909 = sin(_907);
    float _911 = _899 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _913 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _915 = _865 * _913;
    float _917 = _901 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _919 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _921 = _911 * _903;
    float _923 = _897 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _925 = _915 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _927 = _875 * 6.283185482025146484375;
    float _929 = cos(_927);
    bool _931 = _915 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _933 = _917 * _905;
    float _935 = _891 * 6.283185482025146484375;
    float _937 = cos(_935);
    float _939 = _883 * _909;
    float _941 = _895 * _909;
    int _943 = 2;
    if (!_925)
    {
        _943 = 1;
    }
    int _945 = _943;
    float _947 = _891 * 6.283185482025146484375;
    float _949 = sin(_947);
    float _951 = _883 * _929;
    float _953 = _895 * _929;
    float _955 = trunc(_825);
    int _957 = int(_955);
    float _959 = _883 * _937;
    float _961 = _929 * _937;
    float _963 = _895 * _937;
    float _965 = _909 * _937;
    bool _967 = !_925;
    int _969 = _967 ? 0 : 1;
    float _971 = _959 * _933;
    float _973 = trunc(_923);
    int _975 = int(_973);
    int _977 = _945;
    if (!_931)
    {
        _977 = _969;
    }
    int _979 = _977;
    float _981 = -_933;
    float _983 = _949 * _981;
    float _985 = -_941;
    float _987 = fma(_949, _951, _985);
    float _989 = -_951;
    float _991 = fma(_949, _941, _989);
    int _993 = _979 << 6;
    float _995 = fma(_949, _953, _939);
    float _997 = fma(_987, _921, _971);
    int _999 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1001 = _957 + _999;
    int _1003 = _1001 + 1;
    float _1005 = fma(_961, _921, _983);
    int _1007 = _993 + 64;
    uint _1010 = uint(int(uint(_1007) >> uint(2)));
    uint _1012 = uint(int(uint(int(_1010)) >> uint(2)));
    int _1014 = int(_1010) & 3;
    float _1016 = (*spvDescriptorSet0.vp_c15)._m0[int(_1012)][_1014];
    int _1018 = int(_1010) + 1;
    uint _1020 = uint(int(uint(_1018) >> uint(2)));
    int _1022 = _1018 & 3;
    float _1024 = (*spvDescriptorSet0.vp_c15)._m0[int(_1020)][_1022];
    float _1026 = fma(_949, _939, _953);
    bool _1028 = _1003 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1030 = fma(_965, _919, _1005);
    float _1032 = fma(_1026, _919, _997);
    int _1034 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1036 = _975 + _1034;
    int _1038 = _1036 + 1;
    float _1040 = _963 * _933;
    int _1042 = _993 + 96;
    uint _1044 = uint(int(uint(_1042) >> uint(2)));
    uint _1046 = uint(int(uint(int(_1044)) >> uint(2)));
    int _1048 = int(_1044) & 3;
    float _1050 = (*spvDescriptorSet0.vp_c15)._m0[int(_1046)][_1048];
    int _1052 = int(_1044) + 1;
    uint _1054 = uint(int(uint(_1052) >> uint(2)));
    int _1056 = _1052 & 3;
    float _1058 = (*spvDescriptorSet0.vp_c15)._m0[int(_1054)][_1056];
    int _1060 = _1003 | _1038;
    float _1062 = fma(_995, _921, _1040);
    bool _1064 = _1060 < 0;
    bool _1066 = _1064 || _1028;
    float _1068 = fma(_991, _919, _1062);
    int _1070 = _993 + 104;
    uint _1072 = uint(int(uint(_1070) >> uint(2)));
    uint _1074 = uint(int(uint(int(_1072)) >> uint(2)));
    int _1076 = int(_1072) & 3;
    float _1078 = (*spvDescriptorSet0.vp_c15)._m0[int(_1074)][_1076];
    int _1080 = int(_1072) + 1;
    uint _1082 = uint(int(uint(_1080) >> uint(2)));
    int _1084 = _1080 & 3;
    float _1086 = (*spvDescriptorSet0.vp_c15)._m0[int(_1082)][_1084];
    bool _1088 = _1038 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1090 = _1088 || _1066;
    float _1092 = _1068 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1094 = _1068 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1096 = _1068 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1098 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1092);
    int _1100 = _993 + 72;
    uint _1102 = uint(int(uint(_1100) >> uint(2)));
    uint _1104 = uint(int(uint(int(_1102)) >> uint(2)));
    int _1106 = int(_1102) & 3;
    float _1108 = (*spvDescriptorSet0.vp_c15)._m0[int(_1104)][_1106];
    int _1110 = int(_1102) + 1;
    uint _1112 = uint(int(uint(_1110) >> uint(2)));
    int _1114 = _1110 & 3;
    float _1116 = (*spvDescriptorSet0.vp_c15)._m0[int(_1112)][_1114];
    float _1118 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1094);
    float _1120 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1096);
    float _1122 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1098);
    float _1124 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1118);
    float _1126 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1120);
    float _1128 = _1122 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _1130 = _993 + 48;
    uint _1132 = uint(int(uint(_1130) >> uint(2)));
    uint _1134 = uint(int(uint(int(_1132)) >> uint(2)));
    int _1136 = int(_1132) & 3;
    float _1138 = (*spvDescriptorSet0.vp_c15)._m0[int(_1134)][_1136];
    int _1140 = int(_1132) + 1;
    uint _1142 = uint(int(uint(_1140) >> uint(2)));
    int _1144 = _1140 & 3;
    float _1146 = (*spvDescriptorSet0.vp_c15)._m0[int(_1142)][_1144];
    float _1148 = _1124 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _1150 = _1003;
    if (!_1090)
    {
        int _1152 = _1038 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1154 = _1152 + _1003;
        _1150 = _1154;
    }
    int _1156 = _1150;
    float _1158 = _385 + _1128;
    float _1160 = 0.0;
    float _1162 = _1158;
    float _1164 = as_type<float>(_1156);
    if (!_1090)
    {
        float _1166 = floor(_825);
        _1160 = _1166;
    }
    float _1168 = _1160;
    float _1170 = _383 + _1148;
    float _1172 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1174 = _1158 + _1172;
    int _1176 = _993 + 56;
    uint _1178 = uint(int(uint(_1176) >> uint(2)));
    uint _1180 = uint(int(uint(int(_1178)) >> uint(2)));
    int _1182 = int(_1178) & 3;
    float _1184 = (*spvDescriptorSet0.vp_c15)._m0[int(_1180)][_1182];
    int _1186 = int(_1178) + 1;
    uint _1188 = uint(int(uint(_1186) >> uint(2)));
    int _1190 = _1186 & 3;
    float _1192 = (*spvDescriptorSet0.vp_c15)._m0[int(_1188)][_1190];
    float _1194 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1196 = _1170 + _1194;
    int _1198 = 0;
    float _1200 = _1170;
    float _1202 = _1174;
    float _1204 = _1196;
    if (!_1090)
    {
        int _1206 = _1156 << 2;
        _1198 = _1206;
    }
    int _1208 = _1198;
    float _1210 = _1174 * _1174;
    int _1212 = 0;
    int _1214 = _1208;
    if (!_1090)
    {
        uint _1216 = uint(int(uint(_1156) >> uint(2)));
        _1212 = int(_1216);
    }
    int _1218 = _1212;
    int _1220 = _1218;
    if (!_1090)
    {
        int _1222 = 12 & _1208;
        _1214 = _1222;
    }
    int _1224 = _1214;
    float _1226 = fma(_1196, _1196, _1210);
    int _1228 = _993 + 80;
    uint _1230 = uint(int(uint(_1228) >> uint(2)));
    uint _1232 = uint(int(uint(int(_1230)) >> uint(2)));
    int _1234 = int(_1230) & 3;
    float _1236 = (*spvDescriptorSet0.vp_c15)._m0[int(_1232)][_1234];
    int _1238 = int(_1230) + 1;
    uint _1240 = uint(int(uint(_1238) >> uint(2)));
    int _1242 = _1238 & 3;
    float _1244 = (*spvDescriptorSet0.vp_c15)._m0[int(_1240)][_1242];
    float _1246 = _761 * _1024;
    float _1248 = _1226;
    if (!_1090)
    {
        int _1250 = _1218 << 4;
        int _1252 = _1250 + _1224;
        _1220 = _1252;
    }
    int _1254 = _1220;
    float _1256 = sqrt(_1226);
    float _1258 = fma(_383, _1016, _1246);
    float _1260 = _761 * _1058;
    float _1262 = fma(_383, _1050, _1260);
    float _1264 = fma(_385, _1078, _1262);
    bool _1266 = _1256 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1270 = _1268 != 0;
    int _1272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1274 = _1272 != 0;
    int _1276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1278 = _1276 != 0;
    int _1280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1282 = _1280 != 0;
    float _1284 = fma(_385, _1108, _1258);
    float _1286 = _1264 + _1086;
    bool _1288 = !_1274;
    int _1290 = _1288 ? 0 : 1;
    float _1292 = _1284 + _1116;
    bool _1294 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1296 = isnan(0.5);
    bool _1298 = _1294 || _1296;
    bool _1300 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1302 = _1298 || _1300;
    float _1304 = 1.0 / _1286;
    float _1306 = _761 * _1146;
    bool _1308 = !_1278;
    int _1310 = _1308 ? 0 : 1;
    bool _1312 = !_1282;
    int _1314 = _1312 ? 0 : 1;
    float _1316 = fma(_383, _1138, _1306);
    float _1318 = _1126 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1320 = !_1270;
    int _1322 = _1320 ? 0 : 1;
    float _1324 = fma(_385, _1184, _1316);
    float _1326 = _673 + _1318;
    float _1328 = _1324 + _1192;
    float _1330 = _1318;
    float _1332 = _1264;
    float _1334 = as_type<float>(_1254);
    if (!_1266)
    {
        _1330 = _1326;
    }
    float _1336 = _1330;
    bool _1338 = !_1266;
    float _1340 = _1336;
    if (!_1338)
    {
        float _1342 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1344 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1346 = _1256 + _1344;
        float _1348 = _1326 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1350 = rsqrt(_1226);
        float _1352 = _1346 * _1342;
        float _1354 = _1352 * 0.15915493667125701904296875;
        float _1356 = _1354 * 6.283185482025146484375;
        float _1358 = cos(_1356);
        float _1360 = _1354 * 6.283185482025146484375;
        float _1362 = sin(_1360);
        float _1364 = _1358 + (-1.0);
        float _1366 = _1364 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1368 = fma(_1362, _1348, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1370 = fma(_1326, _1358, _1366);
        float _1372 = _1350 * _1368;
        float _1374 = fma(_1196, _1372, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1376 = fma(_1174, _1372, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1200 = _1374;
        _1340 = _1370;
        _1162 = _1376;
        _1332 = _1372;
        _1248 = _1350;
    }
    float _1378 = _1200;
    float _1380 = _1340;
    float _1382 = _1162;
    float _1384 = _1332;
    float _1386 = _1248;
    float _1388 = _1386;
    float _1390 = _1384;
    if (_1302)
    {
        _1202 = _1378;
    }
    float _1392 = _1202;
    float _1394 = _1392;
    if (_1302)
    {
        _1204 = _1380;
    }
    float _1396 = _1204;
    float _1398 = _1396;
    if (_1302)
    {
        _1388 = _1382;
    }
    float _1400 = _1388;
    float _1402 = _1400;
    if (!_1302)
    {
        float _1404 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1406 = _673 + _1404;
        float _1408 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1410 = _383 + _1408;
        float _1412 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1414 = -_383;
        float _1416 = _1414 + _1378;
        float _1418 = _1406 * _1406;
        float _1420 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1422 = _385 + _1420;
        float _1424 = -_673;
        float _1426 = _1424 + _1380;
        float _1428 = -_385;
        float _1430 = _1428 + _1382;
        float _1432 = fma(_1410, _1410, _1418);
        float _1434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1436 = fma(_1422, _1422, _1432);
        float _1438 = sqrt(_1436);
        float _1440 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1442 = precise::min(_1438, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1444 = _1442 * _1434;
        float _1446 = _1440 * _1444;
        float _1448 = fma(_1416, _1446, _383);
        float _1450 = fma(_1426, _1446, _673);
        float _1452 = fma(_1430, _1446, _385);
        _1390 = _1438;
        _1398 = _1450;
        _1394 = _1448;
        _1402 = _1452;
    }
    float _1454 = _1390;
    float _1456 = _1398;
    float _1458 = _1394;
    float _1460 = _1402;
    float _1462 = _1454;
    if (!_1090)
    {
        int _1464 = _1254 + 400;
        uint _1466 = uint(int(uint(_1464) >> uint(2)));
        uint _1468 = uint(int(uint(int(_1466)) >> uint(2)));
        int _1470 = int(_1466) & 3;
        float _1472 = (*spvDescriptorSet0.vp_c15)._m0[int(_1468)][_1470];
        _1462 = _1472;
    }
    float _1474 = _1462;
    float _1476 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1478 = _1328 * _1304;
    float _1480 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1482 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1484 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1476);
    float _1486 = _1292 * _1304;
    float _1488 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1480);
    int _1490 = _993 + 88;
    uint _1492 = uint(int(uint(_1490) >> uint(2)));
    uint _1494 = uint(int(uint(int(_1492)) >> uint(2)));
    int _1496 = int(_1492) & 3;
    float _1498 = (*spvDescriptorSet0.vp_c15)._m0[int(_1494)][_1496];
    int _1500 = int(_1492) + 1;
    uint _1502 = uint(int(uint(_1500) >> uint(2)));
    int _1504 = _1500 & 3;
    float _1506 = (*spvDescriptorSet0.vp_c15)._m0[int(_1502)][_1504];
    float _1508 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1482);
    float _1510 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1484);
    bool _1512 = _1478 >= 0.0;
    float _1514 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1488);
    float _1516 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1518 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1508);
    float _1520 = _1510 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1522 = _1478 <= 1.0;
    bool _1524 = _1522 && _1512;
    float _1526 = _1514 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1528 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1516);
    float _1530 = _1518 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1532 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1534 = _1486 >= 0.0;
    bool _1536 = _1534 && _1524;
    float _1538 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1540 = _1526 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1542 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1528);
    float _1544 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1532);
    bool _1546 = _1486 <= 1.0;
    bool _1548 = _1546 && _1536;
    float _1550 = -_1540;
    float _1552 = fma(_1550, _1538, 1.0);
    float _1554 = _1542 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1556 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1544);
    float _1558 = _1108;
    if (!_1090)
    {
        float _1560 = floor(_923);
        _1558 = _1560;
    }
    float _1562 = _1558;
    float _1564 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1566 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1568 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1556);
    float _1570 = _761 * _1244;
    float _1572 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1566);
    float _1574 = log2(_1552);
    float _1576 = _1568;
    if (_1548)
    {
        float _1578 = float(_979);
        _1334 = _1578;
    }
    float _1580 = _1334;
    float _1582 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1564);
    float _1584 = fma(_383, _1236, _1570);
    float _1586 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1572);
    float _1588 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1582);
    float _1590 = 1.0 / _1568;
    float _1592 = 0.0;
    float _1594 = _1586;
    if (!_1090)
    {
        float _1596 = -_1562;
        float _1598 = _923 + _1596;
        _1592 = _1598;
    }
    float _1600 = _1592;
    float _1602 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1588);
    float _1604 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1586);
    float _1606 = _1604;
    if (!_1090)
    {
        float _1608 = -_1168;
        float _1610 = _825 + _1608;
        _1594 = _1610;
    }
    float _1612 = _1594;
    float _1614 = _1564;
    float _1616 = _1612;
    if (_1548)
    {
        float _1618 = rint(_1580);
        float _1620 = precise::max(_1618, 0.0);
        uint _1622 = uint(_1620);
        uint _1624 = clamp(_1622, 0u, 65535u);
        _1614 = as_type<float>(_1624);
    }
    float _1626 = _1614;
    float _1628 = _1574 * 0.693147182464599609375;
    float _1630 = fma(_385, _1498, _1584);
    float _1632 = _1628 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1634 = _1630 + _1506;
    float _1636 = _1474;
    if (!_1090)
    {
        float _1638 = rint(_1474);
        float _1640 = precise::max(_1638, 0.0);
        uint _1642 = uint(_1640);
        uint _1644 = clamp(_1642, 0u, 65535u);
        _1636 = as_type<float>(_1644);
    }
    float _1646 = _1636;
    float _1648 = _1602 * _1590;
    float _1650 = _1604 * _1590;
    float _1652 = _1634 * _1304;
    float _1654 = fma(_1648, 0.5, 0.5);
    float _1656 = fma(_1650, -0.5, 0.5);
    float _1658 = _1486;
    if (_1548)
    {
        float3 _6751 = float3(_1478, _1486, float(as_type<int>(_1626)));
        float3 _6755 = select(_6751, float3(0.0), isnan(_6751));
        float _1660 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6755.xy, uint(rint(_6755.z)), _1652, level(0.0));
        _1658 = _1660;
    }
    float _1662 = _1658;
    float3 _6765 = float3(_1654, _1656, _1632);
    float _1664 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6765, float3(0.0), isnan(_6765)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6765, float3(0.0), isnan(_6765)), level(0.0)).x;
    float3 _6774 = float3(_1654, _1656, _1632);
    float4 _1667 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6774, float3(0.0), isnan(_6774)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6774, float3(0.0), isnan(_6774)), level(0.0)).xyzw;
    float _1669 = _1667.x;
    float _1671 = _1667.y;
    float _1673 = _1667.z;
    float _1675 = _1667.w;
    float _1677 = _1168;
    if (!_1090)
    {
        float3 _6797 = float3(_1612, _1600, float(as_type<int>(_1646)));
        float3 _6799 = select(_6797, float3(0.0), isnan(_6797));
        float _1679 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6799.xy, uint(rint(_6799.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6799.xy, uint(rint(_6799.z)), level(0.0)).x;
        _1677 = _1679;
    }
    float _1681 = _1677;
    float _1683 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1685 = int(_1683);
    int _1687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1689 = _1687 != 0;
    int _1691 = abs(_603);
    int _1693 = abs(_1290);
    float _1695 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1697 = int(_1695);
    if (_1689)
    {
        _441 = 1.0;
    }
    float _1699 = _441;
    float _1701 = float(uint(_1685));
    float _1703 = trunc(_721);
    int _1705 = int(_1703);
    float _1707 = trunc(_801);
    int _1709 = int(_1707);
    float _1711 = float(uint(_1697));
    int _1713 = ~_1685;
    int _1715 = _1713 + 1;
    float _1717 = _1699;
    if (_1689)
    {
        float _1719 = in.m_66.x;
        _1616 = _1719;
    }
    float _1721 = _1616;
    int _1723 = ~_1697;
    int _1725 = _1723 + 1;
    if (!_1689)
    {
        _1717 = 7.345489978790283203125;
    }
    float _1727 = _1717;
    float _1729 = 1.0 / _1701;
    float _1731 = float(uint(_1705));
    float _1733 = _1721;
    if (!_1689)
    {
        float _1735 = in.m_66.y;
        _1733 = _1735;
    }
    float _1737 = _1733;
    float _1739 = float(_1685);
    float _1741 = _1727 * _405;
    bool _1743 = _1685 == 0;
    float _1745 = 1.0 / _1711;
    int _1747 = as_type<int>(_1729) + (-2);
    float _1749 = float(uint(_1709));
    float _1751 = as_type<float>(_1747) * _1731;
    int _1753 = as_type<int>(_1745) + (-2);
    float _1755 = trunc(_1751);
    float _1757 = precise::max(_1755, 0.0);
    uint _1759 = uint(_1757);
    float _1761 = as_type<float>(_1753) * _1749;
    float _1763 = floor(_1741);
    int _1765 = _1715 * int(_1759);
    int _1767 = _1765 + _1705;
    float _1769 = trunc(_1761);
    float _1771 = precise::max(_1769, 0.0);
    uint _1773 = uint(_1771);
    float _1775 = float(uint(_1767));
    float _1777 = -_1763;
    float _1779 = _1741 + _1777;
    float _1781 = as_type<float>(_1747) * _1775;
    float _1783 = float(_1705);
    bool _1785 = _1783 >= _1739;
    bool _1787 = isnan(_1783);
    bool _1789 = _1785 || _1787;
    bool _1791 = isnan(_1739);
    bool _1793 = _1789 || _1791;
    float _1795 = float(_1793);
    float _1797 = trunc(_1781);
    float _1799 = precise::max(_1797, 0.0);
    uint _1801 = uint(_1799);
    int _1803 = _1725 * int(_1773);
    int _1805 = _1803 + _1709;
    int _1807 = ~_1685;
    int _1809 = _1807 + 1;
    float _1811 = float(uint(_1805));
    float _1813 = trunc(_1795);
    int _1815 = int(_1813);
    float _1817 = as_type<float>(_1753) * _1811;
    int _1819 = int(_1759) + int(_1801);
    float _1821 = trunc(_1817);
    float _1823 = precise::max(_1821, 0.0);
    uint _1825 = uint(_1823);
    float _1827 = as_type<float>(_1759);
    if (_1689)
    {
        _1827 = 1.0;
    }
    float _1829 = _1827;
    float _1831 = _1829;
    if (!_1689)
    {
        _1831 = 1.2345600128173828125;
    }
    float _1833 = _1831;
    int _1835 = _1809 * _1819;
    int _1837 = _1835 + _1705;
    int _1839 = ~_1815;
    int _1841 = _1839 + 1;
    int _1843 = _1841 + 1;
    float _1845 = _1737 * _1833;
    bool _1847 = uint(_1837) >= uint(_1685);
    int _1849 = ~_1697;
    int _1851 = _1849 + 1;
    float _1853 = floor(_1845);
    bool _1855 = !_1847;
    int _1857 = _1855 ? 0 : (-1);
    int _1859 = int(_1773) + int(_1825);
    int _1861 = ~_1819;
    int _1863 = _1861 + _1857;
    int _1865 = _1863 + 1;
    int _1867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1869 = _1867 != 0;
    float _1871 = _1779 * _1739;
    int _1873 = _1685 * _1865;
    int _1875 = _1873 + _1705;
    int _1877 = abs(_599);
    int _1879 = _1851 * _1859;
    int _1881 = _1879 + _1709;
    int _1883 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1885 = _1883 != 0;
    float _1887 = trunc(_1871);
    int _1889 = int(_1887);
    bool _1891 = !_1743;
    int _1893 = _1891 ? _1875 : (-1);
    float _1895 = -_1853;
    float _1897 = _1845 + _1895;
    bool _1899 = uint(_1881) >= uint(_1697);
    bool _1901 = !_1885;
    int _1903 = _1901 ? 0 : 1;
    int _1905 = _1893 * _1843;
    float _1907 = _1739 * _735;
    float _1909 = float(_1697);
    float _1911 = float(_1709);
    int _1913 = _1685 + (-1);
    float _1915 = _1909 * _735;
    int _1917 = abs(_1903);
    float _1919 = trunc(_1907);
    int _1921 = int(_1919);
    bool _1923 = _1911 >= _1909;
    bool _1925 = isnan(_1911);
    bool _1927 = _1923 || _1925;
    bool _1929 = isnan(_1909);
    bool _1931 = _1927 || _1929;
    float _1933 = float(_1931);
    int _1935 = _1815 * _1913;
    int _1937 = _1935 + _1905;
    float _1939 = _1897 * _1909;
    bool _1941 = !_1899;
    int _1943 = _1941 ? 0 : (-1);
    int _1945 = _1889 * _1917;
    int _1947 = _1945 + _1705;
    int _1949 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1951 = _1949 != 0;
    float _1953 = trunc(_1933);
    int _1955 = int(_1953);
    int _1957 = ~_1859;
    int _1959 = _1957 + _1943;
    int _1961 = _1959 + 1;
    int _1963 = _1937 * _1877;
    bool _1965 = !_1869;
    int _1967 = _1965 ? 0 : 1;
    int _1969 = abs(_609);
    bool _1971 = !_1951;
    int _1973 = _1971 ? 0 : 1;
    float _1975 = trunc(_1939);
    int _1977 = int(_1975);
    int _1979 = abs(_1967);
    int _1981 = _1921 * _1691;
    int _1983 = _1981 + _1963;
    int _1985 = _1697 * _1961;
    int _1987 = _1985 + _1709;
    int _1989 = abs(_1973);
    bool _1991 = _1697 == 0;
    int _1993 = _1947 * _1969;
    int _1995 = _1993 + _1983;
    float _1997 = trunc(_1915);
    int _1999 = int(_1997);
    int _2001 = ~_1955;
    int _2003 = _2001 + 1;
    int _2005 = _2003 + 1;
    bool _2007 = !_1991;
    int _2009 = _2007 ? _1987 : (-1);
    int _2011 = _1889 * _1979;
    int _2013 = _2011 + _1995;
    int _2015 = _1977 * _1989;
    int _2017 = _2015 + _1709;
    int _2019 = _1697 + (-1);
    int _2021 = _2009 * _2005;
    float _2023 = float(uint(_2013));
    int _2025 = abs(_1322);
    int _2027 = _1955 * _2019;
    int _2029 = _2027 + _2021;
    float _2031 = as_type<float>(_1747) * _2023;
    int _2033 = abs(_1310);
    int _2035 = _2029 * _1693;
    float _2037 = float(uint(_1947));
    float _2039 = trunc(_2031);
    float _2041 = precise::max(_2039, 0.0);
    uint _2043 = uint(_2041);
    int _2045 = ~_1685;
    int _2047 = _2045 + 1;
    int _2049 = _1999 * _2025;
    int _2051 = _2049 + _2035;
    int _2053 = abs(_1314);
    float _2055 = as_type<float>(_1747) * _2037;
    int _2057 = _2017 * _2033;
    int _2059 = _2057 + _2051;
    int _2061 = ~_1685;
    int _2063 = _2061 + 1;
    float _2065 = trunc(_2055);
    float _2067 = precise::max(_2065, 0.0);
    uint _2069 = uint(_2067);
    int _2071 = _1977 * _2053;
    int _2073 = _2071 + _2059;
    int _2075 = ~_1685;
    int _2077 = _2075 + 1;
    float _2079 = float(uint(_2073));
    int _2081 = _2063 * int(_2043);
    int _2083 = _2081 + _2013;
    float _2085 = as_type<float>(_1753) * _2079;
    float _2087 = float(uint(_2083));
    int _2089 = _2077 * int(_2069);
    int _2091 = _2089 + _1947;
    float _2093 = trunc(_2085);
    float _2095 = precise::max(_2093, 0.0);
    uint _2097 = uint(_2095);
    float _2099 = as_type<float>(_1747) * _2087;
    float _2101 = float(uint(_2091));
    int _2103 = ~_1697;
    int _2105 = _2103 + 1;
    float _2107 = trunc(_2099);
    float _2109 = precise::max(_2107, 0.0);
    uint _2111 = uint(_2109);
    float _2113 = as_type<float>(_1747) * _2101;
    int _2115 = ~_1685;
    int _2117 = _2115 + 1;
    int _2119 = _2105 * int(_2097);
    int _2121 = _2119 + _2073;
    float _2123 = trunc(_2113);
    float _2125 = precise::max(_2123, 0.0);
    uint _2127 = uint(_2125);
    float _2129 = float(uint(_2121));
    int _2131 = int(_2043) + int(_2111);
    float _2133 = as_type<float>(_1753) * _2129;
    int _2135 = _2117 * _2131;
    int _2137 = _2135 + _2013;
    float _2139 = trunc(_2133);
    float _2141 = precise::max(_2139, 0.0);
    uint _2143 = uint(_2141);
    int _2145 = int(_2069) + int(_2127);
    bool _2147 = uint(_2137) >= uint(_1685);
    bool _2149 = !_2147;
    int _2151 = _2149 ? 0 : (-1);
    int _2153 = _2047 * _2145;
    int _2155 = _2153 + _1947;
    int _2157 = ~_2131;
    int _2159 = _2157 + _2151;
    int _2161 = _2159 + 1;
    float _2163 = as_type<float>(_2131);
    float _2165 = as_type<float>(_1983);
    if (_1090)
    {
        _2163 = 1.0;
    }
    float _2167 = _2163;
    bool _2169 = uint(_2155) >= uint(_1685);
    int _2171 = _1685 * _2161;
    int _2173 = _2171 + _2013;
    int _2175 = int(_2097) + int(_2143);
    float _2177 = _2167;
    if (!_1090)
    {
        int _2179 = _1156 << 4;
        int _2181 = _2179 + 2048;
        uint _2183 = uint(int(uint(_2181) >> uint(2)));
        uint _2185 = uint(int(uint(int(_2183)) >> uint(2)));
        int _2187 = int(_2183) & 3;
        float _2189 = (*spvDescriptorSet0.vp_c15)._m0[int(_2185)][_2187];
        int _2191 = int(_2183) + 1;
        uint _2193 = uint(int(uint(_2191) >> uint(2)));
        int _2195 = _2191 & 3;
        float _2197 = (*spvDescriptorSet0.vp_c15)._m0[int(_2193)][_2195];
        int _2199 = _2181 + 8;
        uint _2201 = uint(int(uint(_2199) >> uint(2)));
        uint _2203 = uint(int(uint(int(_2201)) >> uint(2)));
        int _2205 = int(_2201) & 3;
        float _2207 = (*spvDescriptorSet0.vp_c15)._m0[int(_2203)][_2205];
        int _2209 = int(_2201) + 1;
        uint _2211 = uint(int(uint(_2209) >> uint(2)));
        int _2213 = _2209 & 3;
        float _2215 = (*spvDescriptorSet0.vp_c15)._m0[int(_2211)][_2213];
        float _2217 = _761 * _2197;
        float _2219 = fma(_383, _2189, _2217);
        float _2221 = fma(_385, _2207, _2219);
        float _2223 = _2221 + _2215;
        float _2225 = precise::clamp(_2223, 0.0, 1.0);
        float _2227 = -_2225;
        float _2229 = _2227 + _1681;
        float _2231 = fma(_2229, 500.0, 1.5);
        float _2233 = exp2(_2231);
        float _2235 = 0.0 + _2233;
        float _2237 = precise::clamp(_2235, 0.0, 1.0);
        _1164 = as_type<float>(_2181);
        _2177 = _2237;
    }
    float _2239 = _1164;
    float _2241 = _2177;
    float _2243 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2245 = _1456 + _2243;
    float _2247 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2249 = _1458 + _2247;
    float _2251 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2253 = _1460 + _2251;
    float _2255 = _2245 * _2245;
    float _2257 = fma(_2249, _2249, _2255);
    float _2259 = fma(_2253, _2253, _2257);
    float _2261 = rsqrt(_2259);
    float _2263 = sqrt(_2259);
    float _2265 = _2261 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2267 = _2249 * _2265;
    float _2269 = _2253 * _2265;
    float _2271 = _2267 * _2267;
    float _2273 = _2269 * _2269;
    float _2275 = _2271 + _2273;
    float _2277 = sqrt(_2275);
    bool _2279 = _2277 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2281 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2283 = _2277 + _2281;
    float _2285 = _2261;
    float _2287 = _2283;
    float _2289 = _2239;
    float _2291 = _2245;
    if (_2279)
    {
        float _2293 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2285 = _2293;
    }
    float _2295 = _2285;
    if (_2279)
    {
        float _2297 = rsqrt(_2275);
        _809 = _2297;
    }
    float _2299 = _809;
    float _2301 = _2299;
    if (_2279)
    {
        float _2303 = _2283 * _2295;
        _2287 = _2303;
    }
    float _2305 = _2287;
    if (_2279)
    {
        float _2307 = _2305 * 0.15915493667125701904296875;
        _2289 = _2307;
    }
    float _2309 = _2289;
    float _2311 = _2253;
    float _2313 = _2309;
    if (_2279)
    {
        float _2315 = _2309 * 6.283185482025146484375;
        float _2317 = sin(_2315);
        _2311 = _2317;
    }
    float _2319 = _2311;
    float _2321 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2323 = precise::max(0.0, _2321);
    float _2325 = _2295;
    float _2327 = _2323;
    if (_2279)
    {
        float _2329 = _2309 * 6.283185482025146484375;
        float _2331 = cos(_2329);
        _2325 = _2331;
    }
    float _2333 = _2325;
    float _2335 = -_2265;
    float _2337 = -_2323;
    float _2339 = fma(_2245, _2335, _2337);
    if (_2279)
    {
        float _2341 = _2339 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2291 = _2341;
    }
    float _2343 = _2291;
    float _2345 = _2343;
    float _2347 = _2319;
    if (_2279)
    {
        float _2349 = fma(_2319, _2343, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2345 = _2349;
    }
    float _2351 = _2345;
    float _2353 = _2351;
    if (!_2279)
    {
        _2347 = _2267;
    }
    float _2355 = _2347;
    float _2357 = _2355;
    float _2359 = _2333;
    if (_2279)
    {
        float _2361 = _2333 + (-1.0);
        _2327 = _2361;
    }
    float _2363 = _2327;
    float _2365 = _2363;
    if (_2279)
    {
        float _2367 = _2299 * _2351;
        _2165 = _2367;
    }
    float _2369 = _2165;
    if (!_2279)
    {
        _2353 = _2339;
    }
    float _2371 = _2353;
    float _2373 = _2371;
    if (_2279)
    {
        float _2375 = _2363 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2313 = _2375;
    }
    float _2377 = _2313;
    if (_2279)
    {
        float _2379 = _2267 * _2369;
        _2357 = _2379;
    }
    float _2381 = _2357;
    if (!_2279)
    {
        _2365 = _2269;
    }
    float _2383 = _2365;
    float _2385 = _2383;
    if (_2279)
    {
        float _2387 = _2269 * _2369;
        _2385 = _2387;
    }
    float _2389 = _2385;
    if (!_2279)
    {
        _2301 = _2271;
    }
    float _2391 = _2301;
    float _2393 = _2391;
    if (_2279)
    {
        float _2395 = fma(_2339, _2333, _2377);
        _2373 = _2395;
    }
    float _2397 = _2373;
    if (_2279)
    {
        float _2399 = _2381 * _2381;
        _2393 = _2399;
    }
    float _2401 = _2393;
    if (!_2279)
    {
        _2359 = _2273;
    }
    float _2403 = _2359;
    float _2405 = _2403;
    if (_2279)
    {
        float _2407 = _2389 * _2389;
        _2405 = _2407;
    }
    float _2409 = _2405;
    float _2411 = fma(_2397, _2397, _2401);
    float _2413 = float(uint(_2017));
    int _2415 = ~_1697;
    int _2417 = _2415 + 1;
    float _2419 = _2411 + _2409;
    float _2421 = rsqrt(_2419);
    float _2423 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2425 = fma(_2263, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2423);
    float _2427 = precise::clamp(_2425, 0.0, 1.0);
    float _2429 = -_2427;
    float _2431 = _2429 + 1.0;
    float _2433 = abs(_2431);
    float _2435 = log2(_2433);
    float _2437 = _2421 * _2381;
    float _2439 = _2421 * _2397;
    float _2441 = _2421 * _2389;
    float _2443 = _2437 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2445 = -_2443;
    float _2447 = fma(_2439, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2445);
    float _2449 = -_2441;
    float _2451 = fma(_2449, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2447);
    float _2453 = _2435 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2455 = fma(_2451, -0.5, 0.5);
    float _2457 = fma(_2451, 0.5, 0.5);
    float _2459 = exp2(_2453);
    float _2461 = fma(_2457, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2463 = as_type<float>(_1753) * _2413;
    float _2465 = fma(_2457, _2461, -0.212114393711090087890625);
    float _2467 = sqrt(_2455);
    float _2469 = fma(_2457, _2465, 1.570728778839111328125);
    int _2471 = ~_1697;
    int _2473 = _2471 + 1;
    float _2475 = trunc(_2463);
    float _2477 = precise::max(_2475, 0.0);
    uint _2479 = uint(_2477);
    float _2481 = _2439 + 1.0;
    float _2483 = -_2439;
    float _2485 = fma(_2459, _2481, _2483);
    float _2487 = _2467 * 0.636619746685028076171875;
    float _2489 = fma(_2485, 0.5, 0.5);
    float _2491 = -_2469;
    float _2493 = fma(_2487, _2491, 1.0);
    float2 _7950 = float2(_2493, _2489);
    float3 _2497 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7950, float2(0.0), isnan(_7950)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7950, float2(0.0), isnan(_7950)), level(0.0)).xyz;
    float _2499 = _2497.x;
    float _2501 = _2497.y;
    float _2503 = _2497.z;
    bool _2505 = !_1743;
    int _2507 = _2505 ? _2173 : (-1);
    int _2509 = _2473 * _2175;
    int _2511 = _2509 + _2073;
    bool _2513 = !_2169;
    int _2515 = _2513 ? 0 : (-1);
    int _2517 = _2417 * int(_2479);
    int _2519 = _2517 + _2017;
    int _2521 = _2507 & 3;
    bool _2523 = _2521 != 0;
    float _2525 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2527 = _363 + _2525;
    bool _2529 = uint(_2511) >= uint(_1697);
    float _2531 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2533 = _363 + _2531;
    int _2535 = _2507 & 3;
    bool _2537 = _2535 != 0;
    out.m_72.x = _383;
    out.m_72.y = _673;
    out.m_72.z = _385;
    bool _2539 = uint(_2521) >= 2u;
    float _2541 = _2435 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2543 = !_2529;
    int _2545 = _2543 ? 0 : (-1);
    float _2547 = -_803;
    float _2549 = _2547 + 1.0;
    int _2551 = ~_2145;
    int _2553 = _2551 + _2515;
    int _2555 = _2553 + 1;
    float _2557 = -_633;
    float _2559 = _2557 + 1.0;
    int _2561 = _2537 ? 0 : 1;
    float _2563 = exp2(_2541);
    int _2565 = _2539 ? 0 : 1;
    int _2567 = _1685 * _2555;
    int _2569 = _2567 + _1947;
    bool _2571 = uint(_2521) > 1u;
    float _2573 = -_611;
    float _2575 = _2573 + 1.0;
    bool _2577 = _2521 != 3;
    float _2579 = -_403;
    float _2581 = _2579 + 1.0;
    int _2583 = ~_2175;
    int _2585 = _2583 + _2545;
    int _2587 = _2585 + 1;
    float _2589 = float(uint(_2519));
    bool _2591 = _411 > 0.5;
    int _2593 = _1697 * _2587;
    int _2595 = _2593 + _2073;
    int _2597 = ~_2561;
    int _2599 = _2597 + 1;
    int _2601 = _2599 + 1;
    float _2603 = as_type<float>(_1753) * _2589;
    int _2605 = ~_2565;
    int _2607 = _2605 + 1;
    int _2609 = _2607 + 1;
    float _2611 = -_2563;
    float _2613 = _2611 + 1.0;
    bool _2615 = !_1991;
    int _2617 = _2615 ? _2595 : (-1);
    float _2619 = trunc(_2603);
    float _2621 = precise::max(_2619, 0.0);
    uint _2623 = uint(_2621);
    int _2625 = _2601;
    int _2627 = _2609;
    if (!_2571)
    {
        int _2629 = ~_2561;
        int _2631 = _2629 + 1;
        _2625 = _2631;
    }
    int _2633 = _2625;
    float _2635 = _2613 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_2577)
    {
        int _2637 = ~_2565;
        int _2639 = _2637 + 1;
        _2627 = _2639;
    }
    int _2641 = _2627;
    int _2643 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2645 = _2643 != 0;
    float _2647 = _2635 * _1664;
    float _2649 = -_185;
    int _2651 = _2591 ? as_type<int>(_2649) : as_type<int>(_185);
    int _2653 = _2617 & 3;
    bool _2655 = _2653 != 0;
    bool _2657 = !_2645;
    int _2659 = _2657 ? 0 : 1;
    bool _2661 = uint(_2653) > 1u;
    bool _2663 = !_1743;
    int _2665 = _2663 ? _2569 : (-1);
    int _2667 = _2617 & 3;
    bool _2669 = _2667 != 0;
    bool _2671 = !_2655;
    int _2673 = _2671 ? 0 : 1;
    int _2675 = _2669 ? 0 : 1;
    bool _2677 = _2521 != 3;
    int _2679 = ~_2675;
    int _2681 = _2679 + 1;
    int _2683 = _2681 + 1;
    float _2685 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2687 = _2685 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _2689 = _2683;
    if (!_2661)
    {
        int _2691 = ~_2675;
        int _2693 = _2691 + 1;
        _2689 = _2693;
    }
    int _2695 = _2689;
    bool _2697 = !_2677;
    int _2699 = _2697 ? 0 : (-1);
    float _2701 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2703 = _2701 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2705 = 1.0 / _2687;
    bool _2707 = _2653 != 3;
    int _2709 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2711 = _2709 != 0;
    float _2713 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2715 = _2713 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2717 = ~_1697;
    int _2719 = _2717 + 1;
    bool _2721 = uint(_2653) >= 2u;
    float _2723 = 1.0 / _2703;
    int _2725 = int(_2479) + int(_2623);
    int _2727 = _2719 * _2725;
    int _2729 = _2727 + _2017;
    bool _2731 = !_2523;
    int _2733 = _2731 ? 0 : 1;
    bool _2735 = !_2711;
    int _2737 = _2735 ? 0 : 1;
    float _2739 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2741 = _2739 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _2743 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2745 = _2743 != 0;
    int _2747 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2749 = _2747 != 0;
    float _2751 = 1.0 / _2741;
    int _2753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2755 = _2753 != 0;
    int _2757 = _2721 ? 0 : 1;
    bool _2759 = _2653 != 3;
    int _2761 = ~_2757;
    int _2763 = _2761 + 1;
    int _2765 = _2763 + 1;
    float _2767 = 1.0 / _2715;
    int _2769 = _2765;
    if (_2707)
    {
        int _2771 = ~_2757;
        int _2773 = _2771 + 1;
        _2769 = _2773;
    }
    int _2775 = _2769;
    bool _2777 = uint(_2729) >= uint(_1697);
    float _2779 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2781 = _2779 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2783 = !_2759;
    int _2785 = _2783 ? 0 : (-1);
    bool _2787 = _405 > 0.5;
    float _2789 = 1.0 / _2781;
    float _2791 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2793 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2791;
    float _2795 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2797 = _2795 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _2799 = _2617 >> 31;
    float _2801 = _2793 * _2723;
    bool _2803 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2805 = isnan(_363);
    bool _2807 = _2803 || _2805;
    bool _2809 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2811 = _2807 || _2809;
    float _2813 = float(_2811);
    float _2815 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2817 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2815;
    bool _2819 = !_2777;
    int _2821 = _2819 ? 0 : (-1);
    float _2823 = fma(_2801, _2533, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    int _2825 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2827 = _2825 != 0;
    float _2829 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2831 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2829;
    float _2833 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2835 = _2833 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2837 = _2817 * _2751;
    int _2839 = _2799 & 3;
    float _2841 = _2831 * _2705;
    float _2843 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2845 = _363 + _2843;
    float _2847 = _2835 * _2767;
    float _2849 = _2797 * _2789;
    float _2851 = -_2813;
    float _2853 = _2851 + 1.0;
    float _2855 = fma(_2841, _2845, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2857 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2859 = isnan(_363);
    bool _2861 = _2857 || _2859;
    bool _2863 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2865 = _2861 || _2863;
    float _2867 = float(_2865);
    float _2869 = fma(_2847, _2527, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _2871 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2873 = isnan(_363);
    bool _2875 = _2871 || _2873;
    bool _2877 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2879 = _2875 || _2877;
    float _2881 = float(_2879);
    float _2883 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2885 = _363 + _2883;
    int _2887 = _2507 >> 31;
    float _2889 = _2867 * _2853;
    float _2891 = -_2867;
    float _2893 = _2891 + 1.0;
    bool _2895 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2897 = isnan(_363);
    bool _2899 = _2895 || _2897;
    bool _2901 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2903 = _2899 || _2901;
    float _2905 = float(_2903);
    float _2907 = fma(_2849, _2885, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    int _2909 = _2887 & 3;
    float _2911 = -_2881;
    float _2913 = _2911 + 1.0;
    float _2915 = _2881 * _2893;
    bool _2917 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2919 = isnan(_363);
    bool _2921 = _2917 || _2919;
    bool _2923 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2925 = _2921 || _2923;
    float _2927 = float(_2925);
    float _2929 = -_2905;
    float _2931 = _2929 + 1.0;
    float _2933 = _2905 * _2913;
    int _2935 = _2617 + _2839;
    float _2937 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2939 = _2937 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    int _2941 = _2507 + _2909;
    float _2943 = _2927 * _2931;
    bool _2945 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2947 = isnan(_363);
    bool _2949 = _2945 || _2947;
    bool _2951 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2953 = _2949 || _2951;
    float _2955 = float(_2953);
    float _2957 = -_2927;
    float _2959 = _2957 + 1.0;
    bool _2961 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2963 = isnan(_363);
    bool _2965 = _2961 || _2963;
    bool _2967 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2969 = _2965 || _2967;
    float _2971 = float(_2969);
    float _2973 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2975 = _363 + _2973;
    int _2977 = _2941 >> 2;
    float _2979 = -_2955;
    float _2981 = _2979 + 1.0;
    int _2983 = _2935 >> 2;
    float _2985 = _2955 * _2959;
    int _2987 = _2977 << 4;
    int _2989 = _2987 + 368;
    float _2991 = _2971 * _2981;
    int _2993 = _2983 << 4;
    int _2995 = _2993 + 512;
    uint _2997 = uint(int(uint(_2989) >> uint(2)));
    uint _2999 = uint(int(uint(int(_2997)) >> uint(2)));
    int _3001 = int(_2997) & 3;
    float _3003 = (*spvDescriptorSet0.vp_c9)._m0[int(_2999)][_3001];
    int _3005 = int(_2997) + 1;
    uint _3007 = uint(int(uint(_3005) >> uint(2)));
    int _3009 = _3005 & 3;
    float _3011 = (*spvDescriptorSet0.vp_c9)._m0[int(_3007)][_3009];
    float _3013 = _2855 * _2991;
    float _3015 = -_2971;
    float _3017 = _3015 + 1.0;
    float _3019 = fma(_3017, (*spvDescriptorSet0.vp_c9)._m0[159].x, _3013);
    uint _3021 = uint(int(uint(_2995) >> uint(2)));
    uint _3023 = uint(int(uint(int(_3021)) >> uint(2)));
    int _3025 = int(_3021) & 3;
    float _3027 = (*spvDescriptorSet0.vp_c9)._m0[int(_3023)][_3025];
    int _3029 = int(_3021) + 1;
    uint _3031 = uint(int(uint(_3029) >> uint(2)));
    int _3033 = _3029 & 3;
    float _3035 = (*spvDescriptorSet0.vp_c9)._m0[int(_3031)][_3033];
    float _3037 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3039 = _3037 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3041 = fma(_2869, _2985, _3019);
    float _3043 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3045 = _3043 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _3047 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3049 = _363 + _3047;
    int _3051 = abs(_2695);
    float _3053 = fma(_2823, _2943, _3041);
    int _3055 = ~_2725;
    int _3057 = _3055 + _2821;
    int _3059 = _3057 + 1;
    float _3061 = 1.0 / _3039;
    int _3063 = _2989 + 8;
    uint _3065 = uint(int(uint(_3063) >> uint(2)));
    uint _3067 = uint(int(uint(int(_3065)) >> uint(2)));
    int _3069 = int(_3065) & 3;
    float _3071 = (*spvDescriptorSet0.vp_c9)._m0[int(_3067)][_3069];
    int _3073 = int(_3065) + 1;
    uint _3075 = uint(int(uint(_3073) >> uint(2)));
    int _3077 = _3073 & 3;
    float _3079 = (*spvDescriptorSet0.vp_c9)._m0[int(_3075)][_3077];
    float _3081 = fma(_2837, _3049, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _3083 = fma(_2907, _2933, _3053);
    int _3085 = _1697 * _3059;
    int _3087 = _3085 + _2017;
    bool _3089 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _3091 = isnan(_363);
    bool _3093 = _3089 || _3091;
    bool _3095 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _3097 = _3093 || _3095;
    float _3099 = float(_3097);
    float _3101 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3103 = _363 + _3101;
    float _3105 = fma(_3081, _2915, _3083);
    float _3107 = 1.0 / _3045;
    int _3109 = _2995 + 8;
    uint _3111 = uint(int(uint(_3109) >> uint(2)));
    uint _3113 = uint(int(uint(int(_3111)) >> uint(2)));
    int _3115 = int(_3111) & 3;
    float _3117 = (*spvDescriptorSet0.vp_c9)._m0[int(_3113)][_3115];
    int _3119 = int(_3111) + 1;
    uint _3121 = uint(int(uint(_3119) >> uint(2)));
    int _3123 = _3119 & 3;
    float _3125 = (*spvDescriptorSet0.vp_c9)._m0[int(_3121)][_3123];
    bool _3127 = !_1991;
    int _3129 = _3127 ? _3087 : (-1);
    bool _3131 = _407 > 0.5;
    int _3133 = abs(_2633);
    float _3135 = _2939 * _3061;
    float _3137 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3139 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _3137;
    float _3141 = -_181;
    int _3143 = _2787 ? as_type<int>(_3141) : as_type<int>(_181);
    bool _3145 = _409 > 0.5;
    float _3147 = fma(_3135, _2975, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _3149 = ~_3133;
    int _3151 = _3149 + 1;
    int _3153 = _3151 + 1;
    float _3155 = -_3099;
    float _3157 = _3155 + 1.0;
    float _3159 = _3139 * _3107;
    int _3161 = abs(_2733);
    float _3163 = fma(_3147, _2889, _3105);
    int _3165 = ~_3051;
    int _3167 = _3165 + 1;
    int _3169 = _3167 + 1;
    float _3171 = fma(_3159, _3103, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _3173 = abs(_2673);
    float _3175 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3177 = int(_3175);
    int _3179 = _3153 * as_type<int>(_3011);
    int _3181 = abs(_2775);
    float _3183 = _2813 * _3157;
    int _3185 = ~_3161;
    int _3187 = _3185 + 1;
    int _3189 = _3187 + 1;
    int _3191 = abs(_2641);
    float _3193 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3195 = int(_3193);
    int _3197 = abs(_2699);
    int _3199 = _3169 * as_type<int>(_3035);
    int _3201 = _3189 * as_type<int>(_3003);
    int _3203 = _3201 + _3179;
    float _3205 = _995 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3207 = ~_3173;
    int _3209 = _3207 + 1;
    int _3211 = _3209 + 1;
    float _3213 = abs(_915);
    float _3215 = log2(_3213);
    float _3217 = float(uint(_3177));
    float _3219 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3205);
    int _3221 = ~_3191;
    int _3223 = _3221 + 1;
    int _3225 = _3223 + 1;
    int _3227 = _3211 * as_type<int>(_3027);
    int _3229 = _3227 + _3199;
    int _3231 = ~_3181;
    int _3233 = _3231 + 1;
    int _3235 = _3233 + 1;
    float _3237 = fma(_3171, _3183, _3163);
    int _3239 = ~_3197;
    int _3241 = _3239 + 1;
    int _3243 = _3241 + 1;
    int _3245 = _3225 * as_type<int>(_3071);
    int _3247 = _3245 + _3203;
    float _3249 = 1.0 / _3217;
    float _3251 = float(uint(_3195));
    int _3253 = _3235 * as_type<int>(_3117);
    int _3255 = _3253 + _3229;
    int _3257 = abs(_2659);
    int _3259 = _3243 * as_type<int>(_3079);
    int _3261 = _3259 + _3247;
    int _3263 = abs(_2785);
    float _3265 = fma(_3099, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3237);
    int _3267 = ~_3257;
    int _3269 = _3267 + 1;
    int _3271 = _3269 + 1;
    float _3273 = 1.0 / _3251;
    int _3275 = abs(_3177);
    float _3277 = _3215 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _3279 = abs(_2737);
    int _3281 = _3261 * _3271;
    int _3283 = ~_3263;
    int _3285 = _3283 + 1;
    int _3287 = _3285 + 1;
    float _3289 = _963 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3291 = abs(_3195);
    int _3293 = _2665 * _3257;
    int _3295 = _3293 + _3281;
    float _3297 = float(uint(_3275));
    int _3299 = _3287 * as_type<int>(_3125);
    int _3301 = _3299 + _3255;
    int _3303 = ~_3279;
    int _3305 = _3303 + 1;
    int _3307 = _3305 + 1;
    float _3309 = _963 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3311 = float(uint(_3291));
    float _3313 = _963 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3315 = 1.0 / _3297;
    int _3317 = _3301 * _3307;
    int _3319 = as_type<int>(_3249) + (-2);
    float _3321 = -_949;
    float _3323 = fma(_3321, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3289);
    float _3325 = float(uint(_3295));
    float _3327 = -_949;
    float _3329 = fma(_3327, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3309);
    float _3331 = -_949;
    float _3333 = fma(_3331, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3313);
    int _3335 = _3129 * _3279;
    int _3337 = _3335 + _3317;
    float _3339 = 1.0 / _3311;
    float _3341 = as_type<float>(_3319) * _3325;
    int _3343 = as_type<int>(_3273) + (-2);
    out.m_74.x = _3265;
    float _3345 = float(uint(_3337));
    int _3347 = abs(_3295);
    float _3349 = exp2(_3277);
    float _3351 = as_type<float>(_3343) * _3345;
    int _3353 = abs(_3337);
    int _3355 = as_type<int>(_3315) + (-2);
    float _3357 = trunc(_3341);
    float _3359 = precise::max(_3357, 0.0);
    uint _3361 = uint(_3359);
    float _3363 = float(uint(_3347));
    int _3365 = as_type<int>(_3339) + (-2);
    float _3367 = as_type<float>(_3355) * _3363;
    int _3369 = ~_3177;
    int _3371 = _3369 + 1;
    float _3373 = fma(_3349, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3375 = precise::clamp(_3373, 0.0, 1.0);
    float _3377 = float(uint(_3353));
    float _3379 = trunc(_3351);
    float _3381 = precise::max(_3379, 0.0);
    uint _3383 = uint(_3381);
    float _3385 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3323);
    float _3387 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3329);
    float _3389 = _995 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3391 = as_type<float>(_3365) * _3377;
    float _3393 = _995 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3395 = _3371 * int(_3361);
    int _3397 = _3395 + _3295;
    float _3399 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3389);
    float _3401 = trunc(_3367);
    float _3403 = precise::max(_3401, 0.0);
    uint _3405 = uint(_3403);
    float _3407 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3393);
    int _3409 = ~_3275;
    int _3411 = _3409 + 1;
    float _3413 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3333);
    float _3415 = float(uint(_3397));
    int _3417 = ~_3195;
    int _3419 = _3417 + 1;
    float _3421 = trunc(_3391);
    float _3423 = precise::max(_3421, 0.0);
    uint _3425 = uint(_3423);
    float _3427 = as_type<float>(_3319) * _3415;
    int _3429 = _3419 * int(_3383);
    int _3431 = _3429 + _3337;
    int _3433 = ~_3291;
    int _3435 = _3433 + 1;
    float _3437 = _991 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _3439 = !_2745;
    float _3441 = _3439 ? _185 : as_type<float>(_2651);
    int _3443 = _3411 * int(_3405);
    int _3445 = _3443 + _3347;
    float _3447 = float(uint(_3431));
    float _3449 = _991 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3451 = trunc(_3427);
    float _3453 = precise::max(_3451, 0.0);
    uint _3455 = uint(_3453);
    float _3457 = _991 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3459 = float(uint(_3445));
    float _3461 = as_type<float>(_3343) * _3447;
    float _3463 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3399);
    int _3465 = _3435 * int(_3425);
    int _3467 = _3465 + _3353;
    float _3469 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3449);
    float _3471 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3437);
    float _3473 = trunc(_3461);
    float _3475 = precise::max(_3473, 0.0);
    uint _3477 = uint(_3475);
    float _3479 = -_185;
    int _3481 = _3131 ? as_type<int>(_3479) : as_type<int>(_185);
    float _3483 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3457);
    float _3485 = float(uint(_3467));
    float _3487 = as_type<float>(_3355) * _3459;
    float _3489 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3407);
    float _3491 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3219);
    float _3493 = as_type<float>(_3365) * _3485;
    bool _3495 = !_2749;
    float _3497 = _3495 ? _185 : as_type<float>(_3481);
    float _3499 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3501 = fma(_3375, -2.0, 3.0);
    float _3503 = trunc(_3493);
    float _3505 = precise::max(_3503, 0.0);
    uint _3507 = uint(_3505);
    float _3509 = _3375 * _3375;
    float _3511 = -_181;
    int _3513 = _3145 ? as_type<int>(_3511) : as_type<int>(_181);
    float _3515 = _3499 * _3385;
    bool _3517 = !_2827;
    float _3519 = _3517 ? _181 : as_type<float>(_3143);
    float _3521 = _3509 * _3501;
    bool _3523 = !_2755;
    float _3525 = _3523 ? _181 : as_type<float>(_3513);
    float _3527 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3529 = trunc(_3487);
    float _3531 = precise::max(_3529, 0.0);
    uint _3533 = uint(_3531);
    int _3535 = ~_3177;
    int _3537 = _3535 + 1;
    float _3539 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3469);
    float _3541 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3471);
    float _3543 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3483);
    int _3545 = int(_3361) + int(_3455);
    float _3547 = fma(_3527, _3463, _3515);
    int _3549 = ~_3195;
    int _3551 = _3549 + 1;
    out.m_76.x = _3463;
    out.m_76.y = _3491;
    out.m_76.z = _3489;
    int _3553 = int(_3383) + int(_3477);
    int _3555 = ~_3291;
    int _3557 = _3555 + 1;
    int _3559 = int(_3425) + int(_3507);
    int _3561 = _3537 * _3545;
    int _3563 = _3561 + _3295;
    int _3565 = int(_3405) + int(_3533);
    int _3567 = ~_3275;
    int _3569 = _3567 + 1;
    int _3571 = _3551 * _3553;
    int _3573 = _3571 + _3337;
    bool _3575 = uint(_3563) >= uint(_3177);
    int _3577 = _3569 * _3565;
    int _3579 = _3577 + _3347;
    bool _3581 = uint(_3573) >= uint(_3195);
    int _3583 = _3557 * _3559;
    int _3585 = _3583 + _3353;
    float _3587 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3589 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3591 = !_3575;
    int _3593 = _3591 ? 0 : (-1);
    bool _3595 = !_3581;
    int _3597 = _3595 ? 0 : (-1);
    float _3599 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3587);
    bool _3601 = uint(_3585) >= uint(_3291);
    bool _3603 = uint(_3579) >= uint(_3275);
    float _3605 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3607 = _3295 ^ _3177;
    float _3609 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3599);
    int _3611 = ~_3545;
    int _3613 = _3611 + _3593;
    int _3615 = _3613 + 1;
    float _3617 = _2503 * _2647;
    bool _3619 = !_3603;
    int _3621 = _3619 ? 0 : (-1);
    float _3623 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3609);
    uint _3625 = uint(int(uint(_3607) >> uint(31)));
    int _3627 = _3177 * _3615;
    int _3629 = _3627 + _3295;
    int _3631 = ~_3553;
    int _3633 = _3631 + _3597;
    int _3635 = _3633 + 1;
    float _3637 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3639 = ~_3621;
    int _3641 = _3565 + _3639;
    int _3643 = _3641 + 1;
    float _3645 = _3539 + _3547;
    int _3647 = ~int(_3625);
    int _3649 = _3647 + 1;
    int _3651 = _3337 ^ _3195;
    int _3653 = _3195 * _3635;
    int _3655 = _3653 + _3337;
    bool _3657 = _3177 == 0;
    bool _3659 = !_3601;
    int _3661 = _3659 ? 0 : (-1);
    bool _3663 = _3195 == 0;
    bool _3665 = _3195 == 0;
    float _3667 = _3589 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3669 = _3643 ^ _3649;
    float _3671 = fma(_3499, _3499, 1.0);
    uint _3673 = uint(int(uint(_3651) >> uint(31)));
    float _3675 = _3637 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3677 = !_3657;
    int _3679 = _3677 ? _3629 : (-1);
    int _3681 = ~_3661;
    int _3683 = _3559 + _3681;
    int _3685 = _3683 + 1;
    bool _3687 = _3177 == 0;
    int _3689 = ~int(_3673);
    int _3691 = _3689 + 1;
    float _3693 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3695 = ~_3649;
    int _3697 = _3695 + _3669;
    int _3699 = _3697 + 1;
    bool _3701 = !_3663;
    int _3703 = _3701 ? _3655 : (-1);
    float _3705 = float(_3679);
    int _3707 = _3685 ^ _3691;
    float _3709 = rsqrt(_3671);
    float _3711 = float(_3703);
    float _3713 = fma(_3667, _3705, _475);
    float _3715 = _3519 + 0.5;
    int _3717 = ~_3691;
    int _3719 = _3717 + _3707;
    int _3721 = _3719 + 1;
    bool _3723 = !_3687;
    int _3725 = _3723 ? _3699 : (-1);
    float _3727 = fma(_3675, _3711, _743);
    float _3729 = fma(_3667, _3715, _3713);
    float _3731 = _3525 + 0.5;
    bool _3733 = !_3665;
    int _3735 = _3733 ? _3721 : (-1);
    float _3737 = _3605 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3739 = float(_3725);
    float _3741 = fma(_3675, _3731, _3727);
    float _3743 = float(_3735);
    float _3745 = _3693 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3747 = _3499 * _3709;
    float _3749 = -_479;
    float _3751 = fma(_3737, _3739, _3749);
    float _3753 = _3497 + (-0.5);
    float _3755 = -_805;
    float _3757 = fma(_3745, _3743, _3755);
    float _3759 = -_3539;
    float _3761 = _3747 * _3759;
    float _3763 = _3441 + (-0.5);
    float _3765 = -_3737;
    float _3767 = fma(_3765, _3753, _3751);
    float _3769 = -_3541;
    float _3771 = _3747 * _3769;
    float _3773 = fma(_3709, _3385, _3761);
    float _3775 = -_3745;
    float _3777 = fma(_3775, _3763, _3757);
    float _3779 = -_3543;
    float _3781 = _3747 * _3779;
    float _3783 = fma(_3709, _3387, _3771);
    float _3785 = _3499 * _3413;
    float _3787 = _3499 * _3387;
    float _3789 = fma(_3709, _3413, _3781);
    float _3791 = -_779;
    float _3793 = _3791 + 1.0;
    float _3795 = fma(_3527, _3489, _3785);
    float _3797 = fma(_3527, _3491, _3787);
    float _3799 = -_2559;
    float _3801 = fma(_3525, _3799, _3741);
    out.m_78.x = _3773;
    out.m_78.y = _3783;
    out.m_78.z = _3789;
    float _3803 = _3543 + _3795;
    float _3805 = -_3521;
    float _3807 = _3805 + 1.0;
    float _3809 = _3541 + _3797;
    float _3811 = -_3793;
    float _3813 = fma(_3519, _3811, _3729);
    float _3815 = fma(_3497, _2549, _3767);
    float _3817 = fma(_3807, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3521);
    float _3819 = fma(_3441, _2575, _3777);
    float _3821 = _3623 + _1568;
    out.m_80.x = _3645;
    out.m_80.y = _3809;
    out.m_80.z = _3803;
    bool _3823 = _915 <= 8000.0;
    bool _3825 = isnan(_915);
    bool _3827 = _3823 || _3825;
    bool _3829 = isnan(8000.0);
    bool _3831 = _3827 || _3829;
    float _3833 = float(_3831);
    out.m_82.x = _3813;
    out.m_82.y = _3815;
    out.m_82.z = _3801;
    out.m_82.w = _3819;
    float _3835 = _3821 * 0.5;
    float _3837 = _3821;
    float _3839 = _3835;
    float _3841 = _3623;
    if (!_1548)
    {
        _3837 = 1.0;
    }
    float _3843 = _3837;
    float _3845 = _3833 * _3817;
    float _3847 = _3843;
    if (_1548)
    {
        bool _3849 = _1662 >= _1652;
        bool _3851 = isnan(_1662);
        bool _3853 = _3849 || _3851;
        bool _3855 = isnan(_1652);
        bool _3857 = _3853 || _3855;
        float _3859 = float(_3857);
        _3847 = _3859;
    }
    float _3861 = _3847;
    float _3863 = _1675 * _2647;
    float _3865 = _3861 * _2241;
    float _3867 = fma(_2499, _3863, _1669);
    out.gl_Position.x = _1602;
    out.gl_Position.y = _1604;
    out.gl_Position.z = _3623;
    out.gl_Position.w = _1568;
    float _3869 = fma(_2501, _3863, _1671);
    float _3871 = _3845 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3873 = fma(_1675, _3617, _1673);
    out.m_84.z = _3835;
    out.m_84.w = _1568;
    bool _3875 = _2263 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3877 = isnan(_2263);
    bool _3879 = _3875 || _3877;
    bool _3881 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3883 = _3879 || _3881;
    float _3885 = _2581 * _3871;
    float _3887 = precise::clamp(_3885, 0.0, 1.0);
    float _3889 = -_3887;
    float _3891 = fma(_3889, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3893 = -_3865;
    float _3895 = fma(_3893, _3891, 1.0);
    float _3897 = precise::clamp(_3895, 0.0, 1.0);
    float _3899 = -_2635;
    float _3901 = _3899 + 1.0;
    float _3903 = _3897 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3905 = _1675 * _3901;
    float _3907 = _3897;
    float _3909 = _3901;
    if (!_3883)
    {
        _3907 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3911 = _3907;
    float _3913 = _3911;
    float _3915 = _3911;
    if (!_3883)
    {
        _3839 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3917 = _3839;
    out.m_86.x = _3903;
    float _3919 = _3917;
    float _3921 = _3917;
    if (!_3883)
    {
        _1576 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3923 = _1576;
    float _3925 = _3923;
    float _3927 = _3923;
    if (!_3883)
    {
        _3841 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3929 = _3841;
    out.m_88.x = _3867;
    out.m_88.y = _3869;
    out.m_88.z = _3873;
    out.m_88.w = _3905;
    float _3931 = _3929;
    float _3933 = _3929;
    if (!_3883)
    {
        _1606 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3935 = _1606;
    float _3937 = _3935;
    float _3939 = _3935;
    if (!_3883)
    {
        _3909 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3941 = _3909;
    bool _3943 = !_3883;
    float _3945 = _3941;
    float _3947 = _3941;
    if (!_3943)
    {
        bool _3949 = _2263 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3951 = isnan(_2263);
        bool _3953 = _3949 || _3951;
        bool _3955 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3957 = _3953 || _3955;
        if (!_3957)
        {
            float _3959 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3961 = _2263 + _3959;
            float _3963 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3965 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3963;
            float _3967 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3969 = _3967 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3971 = 1.0 / _3965;
            float _3973 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3975 = _3973 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3977 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3979 = _3977 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3981 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3983 = _3981 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3985 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3987 = _3985 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3989 = _3961 * _3971;
            float _3991 = precise::clamp(_3989, 0.0, 1.0);
            float _3993 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3995 = _3993 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3997 = fma(_3991, _3969, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3999 = fma(_3991, _3995, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4001 = fma(_3991, _3975, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4003 = fma(_3991, _3979, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4005 = fma(_3991, _3983, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4007 = fma(_3991, _3987, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3921 = _4001;
            _3939 = _4005;
            _3915 = _3997;
            _3933 = _4003;
            _3927 = _3999;
            _3947 = _4007;
            _4009 = true;
        }
        else
        {
            bool _4011 = _2263 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4013 = isnan(_2263);
            bool _4015 = _4011 || _4013;
            bool _4017 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4019 = _4015 || _4017;
            if (!_4019)
            {
                _3913 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4021 = _3913;
            _3915 = _4021;
            if (!_4019)
            {
                _3919 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4023 = _3919;
            _3921 = _4023;
            if (!_4019)
            {
                _3925 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4025 = _3925;
            _3927 = _4025;
            if (!_4019)
            {
                _3931 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4027 = _3931;
            _3933 = _4027;
            if (!_4019)
            {
                _3937 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4029 = _3937;
            _3939 = _4029;
            if (!_4019)
            {
                _3945 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4031 = _3945;
            bool _4033 = !_4019;
            _3947 = _4031;
            if (!_4033)
            {
                bool _4035 = _2263 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4037 = isnan(_2263);
                bool _4039 = _4035 || _4037;
                bool _4041 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4043 = _4039 || _4041;
                if (!_4043)
                {
                    float _4045 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4047 = _2263 + _4045;
                    float _4049 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4051 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4049;
                    float _4053 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4055 = _4053 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4057 = 1.0 / _4051;
                    float _4059 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4061 = _4059 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4063 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4065 = _4063 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4067 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4069 = _4067 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4071 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4073 = _4071 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4075 = _4047 * _4057;
                    float _4077 = precise::clamp(_4075, 0.0, 1.0);
                    float _4079 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4081 = _4079 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4083 = fma(_4077, _4055, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4085 = fma(_4077, _4081, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4087 = fma(_4077, _4061, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4089 = fma(_4077, _4065, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4091 = fma(_4077, _4069, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4093 = fma(_4077, _4073, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3921 = _4087;
                    _3939 = _4091;
                    _3915 = _4083;
                    _3933 = _4089;
                    _3927 = _4085;
                    _3947 = _4093;
                    _4009 = true;
                }
                else
                {
                    _3921 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3939 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3915 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3933 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3927 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3947 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4009 = false;
    float _4095 = _3921;
    float _4097 = _3939;
    float _4099 = _3915;
    float _4101 = _3933;
    float _4103 = _3927;
    float _4105 = _3947;
    float _4107 = fma(_3809, -0.5, 0.5);
    float _4109 = precise::clamp(_4107, 0.0, 1.0);
    float _4111 = -_4095;
    float _4113 = _4111 + _4097;
    float _4115 = -_4099;
    float _4117 = _4115 + _4101;
    float _4119 = -_4103;
    float _4121 = _4119 + _4105;
    bool _4123 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4125 = fma(_4109, _4113, _4095);
    float _4127 = fma(_4109, _4117, _4099);
    float _4129 = fma(_4109, _4121, _4103);
    float _4131 = _4125 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _4133 = fma(_4127, 0.298911988735198974609375, _4131);
    float _4135 = fma(_4129, 0.114477999508380889892578125, _4133);
    out.m_90.x = 0.0;
    float _4137 = -_4135;
    float _4139 = _4127 + _4137;
    float _4141 = -_4135;
    float _4143 = _4125 + _4141;
    float _4145 = -_4135;
    float _4147 = _4129 + _4145;
    float _4149 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4151 = fma(_4139, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4135);
    float _4153 = fma(_4143, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4135);
    float _4155 = fma(_4147, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4135);
    out.m_86.w = _4149;
    out.m_92.x = _4151;
    out.m_92.y = _4153;
    out.m_92.z = _4155;
    if (!_4123)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4157 = -_1456;
    float _4159 = _4157 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4161 = -_1458;
    float _4163 = _4161 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4165 = -_1460;
    float _4167 = _4165 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4169 = _4159 * _4159;
    float _4171 = fma(_4163, _4163, _4169);
    float _4173 = fma(_4167, _4167, _4171);
    float _4175 = sqrt(_4173);
    float _4177 = rsqrt(_4173);
    float _4179 = -_4175;
    float _4181 = _4179 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4183 = _4181 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4185 = precise::clamp(_4183, 0.0, 1.0);
    float _4187 = _4163 * _4177;
    float _4189 = _4159 * _4177;
    float _4191 = abs(_4185);
    float _4193 = log2(_4191);
    float _4195 = _4167 * _4177;
    float _4197 = _4187 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4199 = _3809 * _4189;
    float _4201 = -_4189;
    float _4203 = -_4197;
    float _4205 = fma(_4201, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4203);
    float _4207 = fma(_3645, _4187, _4199);
    float _4209 = -_4195;
    float _4211 = fma(_4209, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4205);
    float _4213 = fma(_3803, _4195, _4207);
    float _4215 = precise::clamp(_4213, 0.0, 1.0);
    float _4217 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4219 = _4211 + _4217;
    float _4221 = _4193 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4223 = _4219 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4225 = precise::clamp(_4223, 0.0, 1.0);
    float _4227 = exp2(_4221);
    float _4229 = _4227 * _4225;
    float _4231 = _4215 * _4229;
    float _4233 = _4231 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4235 = _4231 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4237 = _4231 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _4233;
    out.m_90.y = _4235;
    out.m_90.z = _4237;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4009 = false;
    bool _355 = false;
    bool _207 = false;
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
        float _4294 = as_type<float>(_127);
        out.gl_Position.z = _4294;
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
        float _4364 = as_type<float>(_165);
        out.gl_Position.z = _4364;
    }
    if (_157)
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
        float _189 = in.m_66.x;
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
    bool _221 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _223 = isnan(_215);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    bool _233 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _235 = isnan(_215);
    bool _237 = _233 || _235;
    bool _239 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _241 = _237 || _239;
    float _243 = float(_241);
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _247 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _245;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _251 = _249 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _253 = -_231;
    float _255 = _253 + 1.0;
    float _257 = 1.0 / _251;
    bool _259 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _261 = isnan(_215);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    float _271 = _243 * _255;
    float _273 = -_243;
    float _275 = _273 + 1.0;
    bool _277 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _279 = _269 * _275;
    float _281 = 1.0 / _247;
    float _283 = -_269;
    float _285 = _283 + 1.0;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _289 = _287 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _291 = _219 * _281;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _295 = _215 + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _301;
    float _305 = _295 * _257;
    float _307 = fma(_299, _291, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _309 = fma(_303, _291, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _313 = _311 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _315 = fma(_289, _305, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _317 = _307 * _279;
    float _319 = _309 * _279;
    float _321 = fma(_313, _305, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _323 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[143].x, _317);
    float _325 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[143].y, _319);
    float _327 = fma(_321, _271, _323);
    float _329 = fma(_315, _271, _325);
    float _331 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[145].x, _327);
    float _333 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[145].y, _329);
    bool _335 = !_277;
    float _353;
    if (!_335)
    {
        float _337 = in.m_66.x;
        float _339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _341 = _337 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _343 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[14].x, _145);
        float _345 = _343 * _339;
        float _347 = floor(_345);
        float _349 = -_347;
        float _351 = _345 + _349;
        _353 = _351;
        _355 = true;
    }
    else
    {
        float _357 = float(_111);
        float _359 = 1.0 / _357;
        float _361 = _145 * _359;
        _353 = _361;
    }
    _355 = false;
    float _363 = _353;
    float _365 = in.m_56.x;
    float _367 = in.m_56.y;
    float _369 = in.m_56.z;
    float _371 = _367 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _373 = _367 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _375 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].x, _371);
    float _377 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].x, _373);
    float _379 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[4].z, _375);
    float _381 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[6].z, _377);
    float _383 = _379 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _385 = _381 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _387 = fma(_383, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _389 = fma(_385, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _391 = floor(_387);
    float _393 = floor(_389);
    float _395 = -_391;
    float _397 = _387 + _395;
    float _399 = -_393;
    float _401 = _389 + _399;
    float2 _4749 = float2(_397, _401);
    float _403 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4749, float2(0.0), isnan(_4749)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4749, float2(0.0), isnan(_4749)), level(0.0)).x;
    float _405 = in.m_66.x;
    float _407 = in.m_66.y;
    float _409 = in.m_66.z;
    float _411 = in.m_66.w;
    float _413 = _367 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _415 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _417 = log2(_415);
    int _419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _421 = _419 != 0;
    float _423 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].x, _413);
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _427 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[5].z, _423);
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _431 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _433 = int(_431);
    float _435 = float(_111);
    int _437 = as_type<int>(_365);
    float _439 = _423;
    float _441 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_421)
    {
        _437 = 0;
    }
    int _443 = _437;
    int _445 = _443;
    if (!_421)
    {
        _445 = 1;
    }
    int _447 = _445;
    float _449 = 1.0 / _435;
    float _451 = _417 * _145;
    float _453 = _405 * 2.0;
    float _455 = _407 * 2.0;
    float _457 = _405 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _459 = _447 != 1;
    float _461 = _407 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _463 = floor(_453);
    float _465 = -_425;
    float _467 = fma(_457, 2.0, _465);
    float _469 = _405 + _407;
    float _471 = fma(_461, -2.0, _429);
    float _473 = -_145;
    float _475 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[76].x, _467);
    float _477 = _469 + (-1.0);
    float _479 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _471);
    float _481 = floor(_455);
    float _483 = _409 * 2.0;
    if (!_459)
    {
        _439 = _407;
    }
    float _485 = _439;
    float _487 = _485;
    if (_459)
    {
        _487 = _405;
    }
    float _489 = _487;
    float _491 = floor(_483);
    bool _493 = _463 > 0.0;
    bool _495 = _463 >= 0.0;
    bool _497 = isnan(_463);
    bool _499 = _495 || _497;
    bool _501 = isnan(0.0);
    bool _503 = _499 || _501;
    float _505 = _503 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _507 = exp2(_451);
    bool _509 = _481 > 0.0;
    float _511 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _513 = _481 >= 0.0;
    bool _515 = isnan(_481);
    bool _517 = _513 || _515;
    bool _519 = isnan(0.0);
    bool _521 = _517 || _519;
    int _523 = ~as_type<int>(_505);
    int _525 = _523 + 1;
    int _527 = _525 + 1;
    int _529 = _521 ? 0 : 1;
    float _531 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _533 = int(_531);
    bool _535 = _491 >= 0.0;
    bool _537 = isnan(_491);
    bool _539 = _535 || _537;
    bool _541 = isnan(0.0);
    bool _543 = _539 || _541;
    bool _545 = _491 > 0.0;
    int _547 = _527;
    float _549 = _505;
    float _551 = _489;
    if (!_493)
    {
        int _553 = ~as_type<int>(_505);
        int _555 = _553 + 1;
        _547 = _555;
    }
    int _557 = _547;
    int _559 = _543 ? 0 : 1;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_459)
    {
        _549 = _409;
    }
    float _563 = _549;
    int _565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _567 = _565 != 0;
    int _569 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _571 = _569 != 0;
    int _573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _575 = _573 != 0;
    int _577 = ~_529;
    int _579 = _577 + 1;
    int _581 = _579 + 1;
    float _583 = _563;
    int _585 = _581;
    if (_459)
    {
        _583 = _407;
    }
    float _587 = _583;
    if (!_509)
    {
        int _589 = ~_529;
        int _591 = _589 + 1;
        _585 = _591;
    }
    int _593 = _585;
    float _595 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[83].w, _561);
    bool _597 = !_571;
    int _599 = _597 ? 0 : 1;
    bool _601 = !_567;
    int _603 = _601 ? 0 : 1;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _607 = !_575;
    int _609 = _607 ? 0 : 1;
    float _611 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _595);
    int _613 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _615 = _613 != 0;
    int _617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _619 = _617 != 0;
    int _621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _623 = _621 != 0;
    float _625 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[83].z, _605);
    int _627 = ~_559;
    int _629 = _627 + 1;
    int _631 = _629 + 1;
    float _633 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _625);
    int _635 = _631;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_545)
    {
        int _639 = ~_559;
        int _641 = _639 + 1;
        _635 = _641;
    }
    int _643 = _635;
    float _645 = float(_533);
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _649 = !_619;
    int _651 = _649 ? 0 : 1;
    bool _653 = !_615;
    int _655 = _653 ? 0 : 1;
    float _657 = 1.0 / _645;
    if (!_459)
    {
        _551 = _407;
    }
    float _659 = _551;
    float _661 = _659;
    if (!_459)
    {
        _637 = _409;
    }
    float _663 = _637;
    float _665 = _663;
    if (_459)
    {
        _661 = _405;
    }
    float _667 = _661;
    if (_459)
    {
        _665 = _407;
    }
    float _669 = _665;
    int _671 = abs(_651);
    float _673 = _427 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _675 = abs(_655);
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _679 = _667 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _681 = _669 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _683 = float(_557);
    float _685 = _673 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _687 = float(_671);
    float _689 = _673 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _691 = float(_675);
    float _693 = fma(_681, -2.0, _677);
    float _695 = float(_643);
    float _697 = _687 * _683;
    float _699 = float(_433);
    float _701 = fma(_383, (*spvDescriptorSet0.vp_c8)._m0[11].x, _685);
    float _703 = fma(_383, (*spvDescriptorSet0.vp_c8)._m0[10].x, _689);
    float _705 = _691 * _695;
    float _707 = -_647;
    float _709 = fma(_679, 2.0, _707);
    float _711 = in.m_68.x;
    float _713 = in.m_68.y;
    float _715 = in.m_68.z;
    float _717 = fma(_385, (*spvDescriptorSet0.vp_c8)._m0[11].z, _701);
    float _719 = fma(_385, (*spvDescriptorSet0.vp_c8)._m0[10].z, _703);
    float _721 = _657 * _145;
    float _723 = _717 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _725 = _719 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _729 = 1.0 + _727;
    float _731 = 1.0 / _699;
    float _733 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _735 = _449 * _145;
    float _737 = _725 + _723;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _741 = -_145;
    float _743 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[81].x, _709);
    bool _745 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _747 = isnan(1.0);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _753 = _749 || _751;
    float _755 = 1.0 / _729;
    float _757 = -_507;
    float _759 = _757 + 1.0;
    float _761 = _673 + _733;
    float _763 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[78].z, _739);
    float _765 = _705 * (-2.0);
    bool _767 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _769 = isnan(0.0);
    bool _771 = _767 || _769;
    bool _773 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _775 = _771 || _773;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _779 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _763);
    float _781 = 1.0 / _723;
    float _783 = _761 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _785 = fma(_511, _765, _511);
    float _787 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[78].w, _777);
    float _789 = _775 ? _759 : 0.0;
    float _791 = fma(_383, (*spvDescriptorSet0.vp_c15)._m0[126].x, _783);
    float _793 = fma(_765, _711, _711);
    float _795 = _405 + (-0.5);
    bool _797 = !_623;
    int _799 = _797 ? 0 : 1;
    float _801 = _731 * _145;
    float _803 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _787);
    float _805 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _693);
    float _807 = fma(_385, (*spvDescriptorSet0.vp_c15)._m0[126].z, _791);
    float _809 = _761;
    if (_753)
    {
        float _811 = _789 * _755;
        _147 = _811;
    }
    float _813 = _147;
    float _815 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[196].x, _793);
    int _817 = abs(_799);
    float _819 = _737 * _781;
    float _821 = _819 * 0.5;
    float _823 = _409 + _407;
    float _825 = _807 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _827 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _829 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[30].w, _827);
    float _831 = _823 + (-1.0);
    float _833 = fma(_785, _813, _815);
    float _835 = _697 * (-2.0);
    float _837 = float(_593);
    float _839 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _841 = float(_817);
    float _843 = _407 + (-0.5);
    float _845 = fma(_835, _713, _713);
    float _847 = fma(_839, _835, _839);
    float _849 = _409 + _405;
    float _851 = _841 * _837;
    float _853 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[196].y, _845);
    float _855 = in.m_70.x;
    float _857 = in.m_70.y;
    float _859 = _851 * (-2.0);
    float _861 = _849 + (-1.0);
    float _863 = fma(_847, _813, _853);
    float _865 = 1.0 / _829;
    float _867 = fma(_859, _715, _715);
    float _869 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _871 = _409 + (-0.5);
    float _873 = _833 * 0.15915493667125701904296875;
    float _875 = _863 * 0.15915493667125701904296875;
    float _877 = fma(_869, _859, _869);
    float _879 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[196].z, _867);
    float _881 = _873 * 6.283185482025146484375;
    float _883 = sin(_881);
    float _885 = _761 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _887 = fma(_877, _813, _879);
    float _889 = fma(_383, (*spvDescriptorSet0.vp_c15)._m0[127].x, _885);
    float _891 = _887 * 0.15915493667125701904296875;
    float _893 = _873 * 6.283185482025146484375;
    float _895 = cos(_893);
    float _897 = fma(_385, (*spvDescriptorSet0.vp_c15)._m0[127].z, _889);
    float _899 = _331 * _855;
    float _901 = _333 * _857;
    float _903 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _905 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _907 = _875 * 6.283185482025146484375;
    float _909 = sin(_907);
    float _911 = _899 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _913 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _915 = _865 * _913;
    float _917 = _901 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _919 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _921 = _911 * _903;
    float _923 = _897 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _925 = _915 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _927 = _875 * 6.283185482025146484375;
    float _929 = cos(_927);
    bool _931 = _915 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _933 = _917 * _905;
    float _935 = _891 * 6.283185482025146484375;
    float _937 = cos(_935);
    float _939 = _883 * _909;
    float _941 = _895 * _909;
    int _943 = 2;
    if (!_925)
    {
        _943 = 1;
    }
    int _945 = _943;
    float _947 = _891 * 6.283185482025146484375;
    float _949 = sin(_947);
    float _951 = _883 * _929;
    float _953 = _895 * _929;
    float _955 = trunc(_825);
    int _957 = int(_955);
    float _959 = _883 * _937;
    float _961 = _929 * _937;
    float _963 = _895 * _937;
    float _965 = _909 * _937;
    bool _967 = !_925;
    int _969 = _967 ? 0 : 1;
    float _971 = _959 * _933;
    float _973 = trunc(_923);
    int _975 = int(_973);
    int _977 = _945;
    if (!_931)
    {
        _977 = _969;
    }
    int _979 = _977;
    float _981 = -_933;
    float _983 = _949 * _981;
    float _985 = -_941;
    float _987 = fma(_949, _951, _985);
    float _989 = -_951;
    float _991 = fma(_949, _941, _989);
    int _993 = _979 << 6;
    float _995 = fma(_949, _953, _939);
    float _997 = fma(_987, _921, _971);
    int _999 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1001 = _957 + _999;
    int _1003 = _1001 + 1;
    float _1005 = fma(_961, _921, _983);
    int _1007 = _993 + 64;
    uint _1010 = uint(int(uint(_1007) >> uint(2)));
    uint _1012 = uint(int(uint(int(_1010)) >> uint(2)));
    int _1014 = int(_1010) & 3;
    float _1016 = (*spvDescriptorSet0.vp_c15)._m0[int(_1012)][_1014];
    int _1018 = int(_1010) + 1;
    uint _1020 = uint(int(uint(_1018) >> uint(2)));
    int _1022 = _1018 & 3;
    float _1024 = (*spvDescriptorSet0.vp_c15)._m0[int(_1020)][_1022];
    float _1026 = fma(_949, _939, _953);
    bool _1028 = _1003 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1030 = fma(_965, _919, _1005);
    float _1032 = fma(_1026, _919, _997);
    int _1034 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1036 = _975 + _1034;
    int _1038 = _1036 + 1;
    float _1040 = _963 * _933;
    int _1042 = _993 + 96;
    uint _1044 = uint(int(uint(_1042) >> uint(2)));
    uint _1046 = uint(int(uint(int(_1044)) >> uint(2)));
    int _1048 = int(_1044) & 3;
    float _1050 = (*spvDescriptorSet0.vp_c15)._m0[int(_1046)][_1048];
    int _1052 = int(_1044) + 1;
    uint _1054 = uint(int(uint(_1052) >> uint(2)));
    int _1056 = _1052 & 3;
    float _1058 = (*spvDescriptorSet0.vp_c15)._m0[int(_1054)][_1056];
    int _1060 = _1003 | _1038;
    float _1062 = fma(_995, _921, _1040);
    bool _1064 = _1060 < 0;
    bool _1066 = _1064 || _1028;
    float _1068 = fma(_991, _919, _1062);
    int _1070 = _993 + 104;
    uint _1072 = uint(int(uint(_1070) >> uint(2)));
    uint _1074 = uint(int(uint(int(_1072)) >> uint(2)));
    int _1076 = int(_1072) & 3;
    float _1078 = (*spvDescriptorSet0.vp_c15)._m0[int(_1074)][_1076];
    int _1080 = int(_1072) + 1;
    uint _1082 = uint(int(uint(_1080) >> uint(2)));
    int _1084 = _1080 & 3;
    float _1086 = (*spvDescriptorSet0.vp_c15)._m0[int(_1082)][_1084];
    bool _1088 = _1038 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1090 = _1088 || _1066;
    float _1092 = _1068 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1094 = _1068 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1096 = _1068 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1098 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1092);
    int _1100 = _993 + 72;
    uint _1102 = uint(int(uint(_1100) >> uint(2)));
    uint _1104 = uint(int(uint(int(_1102)) >> uint(2)));
    int _1106 = int(_1102) & 3;
    float _1108 = (*spvDescriptorSet0.vp_c15)._m0[int(_1104)][_1106];
    int _1110 = int(_1102) + 1;
    uint _1112 = uint(int(uint(_1110) >> uint(2)));
    int _1114 = _1110 & 3;
    float _1116 = (*spvDescriptorSet0.vp_c15)._m0[int(_1112)][_1114];
    float _1118 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1094);
    float _1120 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1096);
    float _1122 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1098);
    float _1124 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1118);
    float _1126 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1120);
    float _1128 = _1122 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _1130 = _993 + 48;
    uint _1132 = uint(int(uint(_1130) >> uint(2)));
    uint _1134 = uint(int(uint(int(_1132)) >> uint(2)));
    int _1136 = int(_1132) & 3;
    float _1138 = (*spvDescriptorSet0.vp_c15)._m0[int(_1134)][_1136];
    int _1140 = int(_1132) + 1;
    uint _1142 = uint(int(uint(_1140) >> uint(2)));
    int _1144 = _1140 & 3;
    float _1146 = (*spvDescriptorSet0.vp_c15)._m0[int(_1142)][_1144];
    float _1148 = _1124 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _1150 = _1003;
    if (!_1090)
    {
        int _1152 = _1038 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1154 = _1152 + _1003;
        _1150 = _1154;
    }
    int _1156 = _1150;
    float _1158 = _385 + _1128;
    float _1160 = 0.0;
    float _1162 = _1158;
    float _1164 = as_type<float>(_1156);
    if (!_1090)
    {
        float _1166 = floor(_825);
        _1160 = _1166;
    }
    float _1168 = _1160;
    float _1170 = _383 + _1148;
    float _1172 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1174 = _1158 + _1172;
    int _1176 = _993 + 56;
    uint _1178 = uint(int(uint(_1176) >> uint(2)));
    uint _1180 = uint(int(uint(int(_1178)) >> uint(2)));
    int _1182 = int(_1178) & 3;
    float _1184 = (*spvDescriptorSet0.vp_c15)._m0[int(_1180)][_1182];
    int _1186 = int(_1178) + 1;
    uint _1188 = uint(int(uint(_1186) >> uint(2)));
    int _1190 = _1186 & 3;
    float _1192 = (*spvDescriptorSet0.vp_c15)._m0[int(_1188)][_1190];
    float _1194 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1196 = _1170 + _1194;
    int _1198 = 0;
    float _1200 = _1170;
    float _1202 = _1174;
    float _1204 = _1196;
    if (!_1090)
    {
        int _1206 = _1156 << 2;
        _1198 = _1206;
    }
    int _1208 = _1198;
    float _1210 = _1174 * _1174;
    int _1212 = 0;
    int _1214 = _1208;
    if (!_1090)
    {
        uint _1216 = uint(int(uint(_1156) >> uint(2)));
        _1212 = int(_1216);
    }
    int _1218 = _1212;
    int _1220 = _1218;
    if (!_1090)
    {
        int _1222 = 12 & _1208;
        _1214 = _1222;
    }
    int _1224 = _1214;
    float _1226 = fma(_1196, _1196, _1210);
    int _1228 = _993 + 80;
    uint _1230 = uint(int(uint(_1228) >> uint(2)));
    uint _1232 = uint(int(uint(int(_1230)) >> uint(2)));
    int _1234 = int(_1230) & 3;
    float _1236 = (*spvDescriptorSet0.vp_c15)._m0[int(_1232)][_1234];
    int _1238 = int(_1230) + 1;
    uint _1240 = uint(int(uint(_1238) >> uint(2)));
    int _1242 = _1238 & 3;
    float _1244 = (*spvDescriptorSet0.vp_c15)._m0[int(_1240)][_1242];
    float _1246 = _761 * _1024;
    float _1248 = _1226;
    if (!_1090)
    {
        int _1250 = _1218 << 4;
        int _1252 = _1250 + _1224;
        _1220 = _1252;
    }
    int _1254 = _1220;
    float _1256 = sqrt(_1226);
    float _1258 = fma(_383, _1016, _1246);
    float _1260 = _761 * _1058;
    float _1262 = fma(_383, _1050, _1260);
    float _1264 = fma(_385, _1078, _1262);
    bool _1266 = _1256 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1270 = _1268 != 0;
    int _1272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1274 = _1272 != 0;
    int _1276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1278 = _1276 != 0;
    int _1280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1282 = _1280 != 0;
    float _1284 = fma(_385, _1108, _1258);
    float _1286 = _1264 + _1086;
    bool _1288 = !_1274;
    int _1290 = _1288 ? 0 : 1;
    float _1292 = _1284 + _1116;
    bool _1294 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1296 = isnan(0.5);
    bool _1298 = _1294 || _1296;
    bool _1300 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1302 = _1298 || _1300;
    float _1304 = 1.0 / _1286;
    float _1306 = _761 * _1146;
    bool _1308 = !_1278;
    int _1310 = _1308 ? 0 : 1;
    bool _1312 = !_1282;
    int _1314 = _1312 ? 0 : 1;
    float _1316 = fma(_383, _1138, _1306);
    float _1318 = _1126 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1320 = !_1270;
    int _1322 = _1320 ? 0 : 1;
    float _1324 = fma(_385, _1184, _1316);
    float _1326 = _673 + _1318;
    float _1328 = _1324 + _1192;
    float _1330 = _1318;
    float _1332 = _1264;
    float _1334 = as_type<float>(_1254);
    if (!_1266)
    {
        _1330 = _1326;
    }
    float _1336 = _1330;
    bool _1338 = !_1266;
    float _1340 = _1336;
    if (!_1338)
    {
        float _1342 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1344 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1346 = _1256 + _1344;
        float _1348 = _1326 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1350 = rsqrt(_1226);
        float _1352 = _1346 * _1342;
        float _1354 = _1352 * 0.15915493667125701904296875;
        float _1356 = _1354 * 6.283185482025146484375;
        float _1358 = cos(_1356);
        float _1360 = _1354 * 6.283185482025146484375;
        float _1362 = sin(_1360);
        float _1364 = _1358 + (-1.0);
        float _1366 = _1364 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1368 = fma(_1362, _1348, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1370 = fma(_1326, _1358, _1366);
        float _1372 = _1350 * _1368;
        float _1374 = fma(_1196, _1372, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1376 = fma(_1174, _1372, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1200 = _1374;
        _1340 = _1370;
        _1162 = _1376;
        _1332 = _1372;
        _1248 = _1350;
    }
    float _1378 = _1200;
    float _1380 = _1340;
    float _1382 = _1162;
    float _1384 = _1332;
    float _1386 = _1248;
    float _1388 = _1386;
    float _1390 = _1384;
    if (_1302)
    {
        _1202 = _1378;
    }
    float _1392 = _1202;
    float _1394 = _1392;
    if (_1302)
    {
        _1204 = _1380;
    }
    float _1396 = _1204;
    float _1398 = _1396;
    if (_1302)
    {
        _1388 = _1382;
    }
    float _1400 = _1388;
    float _1402 = _1400;
    if (!_1302)
    {
        float _1404 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1406 = _673 + _1404;
        float _1408 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1410 = _383 + _1408;
        float _1412 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1414 = -_383;
        float _1416 = _1414 + _1378;
        float _1418 = _1406 * _1406;
        float _1420 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1422 = _385 + _1420;
        float _1424 = -_673;
        float _1426 = _1424 + _1380;
        float _1428 = -_385;
        float _1430 = _1428 + _1382;
        float _1432 = fma(_1410, _1410, _1418);
        float _1434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1436 = fma(_1422, _1422, _1432);
        float _1438 = sqrt(_1436);
        float _1440 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1442 = precise::min(_1438, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1444 = _1442 * _1434;
        float _1446 = _1440 * _1444;
        float _1448 = fma(_1416, _1446, _383);
        float _1450 = fma(_1426, _1446, _673);
        float _1452 = fma(_1430, _1446, _385);
        _1390 = _1438;
        _1398 = _1450;
        _1394 = _1448;
        _1402 = _1452;
    }
    float _1454 = _1390;
    float _1456 = _1398;
    float _1458 = _1394;
    float _1460 = _1402;
    float _1462 = _1454;
    if (!_1090)
    {
        int _1464 = _1254 + 400;
        uint _1466 = uint(int(uint(_1464) >> uint(2)));
        uint _1468 = uint(int(uint(int(_1466)) >> uint(2)));
        int _1470 = int(_1466) & 3;
        float _1472 = (*spvDescriptorSet0.vp_c15)._m0[int(_1468)][_1470];
        _1462 = _1472;
    }
    float _1474 = _1462;
    float _1476 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1478 = _1328 * _1304;
    float _1480 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1482 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1484 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1476);
    float _1486 = _1292 * _1304;
    float _1488 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1480);
    int _1490 = _993 + 88;
    uint _1492 = uint(int(uint(_1490) >> uint(2)));
    uint _1494 = uint(int(uint(int(_1492)) >> uint(2)));
    int _1496 = int(_1492) & 3;
    float _1498 = (*spvDescriptorSet0.vp_c15)._m0[int(_1494)][_1496];
    int _1500 = int(_1492) + 1;
    uint _1502 = uint(int(uint(_1500) >> uint(2)));
    int _1504 = _1500 & 3;
    float _1506 = (*spvDescriptorSet0.vp_c15)._m0[int(_1502)][_1504];
    float _1508 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1482);
    float _1510 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1484);
    bool _1512 = _1478 >= 0.0;
    float _1514 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1488);
    float _1516 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1518 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1508);
    float _1520 = _1510 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1522 = _1478 <= 1.0;
    bool _1524 = _1522 && _1512;
    float _1526 = _1514 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1528 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1516);
    float _1530 = _1518 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1532 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1534 = _1486 >= 0.0;
    bool _1536 = _1534 && _1524;
    float _1538 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1540 = _1526 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1542 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1528);
    float _1544 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1532);
    bool _1546 = _1486 <= 1.0;
    bool _1548 = _1546 && _1536;
    float _1550 = -_1540;
    float _1552 = fma(_1550, _1538, 1.0);
    float _1554 = _1542 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1556 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1544);
    float _1558 = _1108;
    if (!_1090)
    {
        float _1560 = floor(_923);
        _1558 = _1560;
    }
    float _1562 = _1558;
    float _1564 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1566 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1568 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1556);
    float _1570 = _761 * _1244;
    float _1572 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1566);
    float _1574 = log2(_1552);
    float _1576 = _1568;
    if (_1548)
    {
        float _1578 = float(_979);
        _1334 = _1578;
    }
    float _1580 = _1334;
    float _1582 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1564);
    float _1584 = fma(_383, _1236, _1570);
    float _1586 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1572);
    float _1588 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1582);
    float _1590 = 1.0 / _1568;
    float _1592 = 0.0;
    float _1594 = _1586;
    if (!_1090)
    {
        float _1596 = -_1562;
        float _1598 = _923 + _1596;
        _1592 = _1598;
    }
    float _1600 = _1592;
    float _1602 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1588);
    float _1604 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1586);
    float _1606 = _1604;
    if (!_1090)
    {
        float _1608 = -_1168;
        float _1610 = _825 + _1608;
        _1594 = _1610;
    }
    float _1612 = _1594;
    float _1614 = _1564;
    float _1616 = _1612;
    if (_1548)
    {
        float _1618 = rint(_1580);
        float _1620 = precise::max(_1618, 0.0);
        uint _1622 = uint(_1620);
        uint _1624 = clamp(_1622, 0u, 65535u);
        _1614 = as_type<float>(_1624);
    }
    float _1626 = _1614;
    float _1628 = _1574 * 0.693147182464599609375;
    float _1630 = fma(_385, _1498, _1584);
    float _1632 = _1628 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1634 = _1630 + _1506;
    float _1636 = _1474;
    if (!_1090)
    {
        float _1638 = rint(_1474);
        float _1640 = precise::max(_1638, 0.0);
        uint _1642 = uint(_1640);
        uint _1644 = clamp(_1642, 0u, 65535u);
        _1636 = as_type<float>(_1644);
    }
    float _1646 = _1636;
    float _1648 = _1602 * _1590;
    float _1650 = _1604 * _1590;
    float _1652 = _1634 * _1304;
    float _1654 = fma(_1648, 0.5, 0.5);
    float _1656 = fma(_1650, -0.5, 0.5);
    float _1658 = _1486;
    if (_1548)
    {
        float3 _6751 = float3(_1478, _1486, float(as_type<int>(_1626)));
        float3 _6755 = select(_6751, float3(0.0), isnan(_6751));
        float _1660 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6755.xy, uint(rint(_6755.z)), _1652, level(0.0));
        _1658 = _1660;
    }
    float _1662 = _1658;
    float3 _6765 = float3(_1654, _1656, _1632);
    float _1664 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6765, float3(0.0), isnan(_6765)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6765, float3(0.0), isnan(_6765)), level(0.0)).x;
    float3 _6774 = float3(_1654, _1656, _1632);
    float4 _1667 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6774, float3(0.0), isnan(_6774)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6774, float3(0.0), isnan(_6774)), level(0.0)).xyzw;
    float _1669 = _1667.x;
    float _1671 = _1667.y;
    float _1673 = _1667.z;
    float _1675 = _1667.w;
    float _1677 = _1168;
    if (!_1090)
    {
        float3 _6797 = float3(_1612, _1600, float(as_type<int>(_1646)));
        float3 _6799 = select(_6797, float3(0.0), isnan(_6797));
        float _1679 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6799.xy, uint(rint(_6799.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6799.xy, uint(rint(_6799.z)), level(0.0)).x;
        _1677 = _1679;
    }
    float _1681 = _1677;
    float _1683 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1685 = int(_1683);
    int _1687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1689 = _1687 != 0;
    int _1691 = abs(_603);
    int _1693 = abs(_1290);
    float _1695 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1697 = int(_1695);
    if (_1689)
    {
        _441 = 1.0;
    }
    float _1699 = _441;
    float _1701 = float(uint(_1685));
    float _1703 = trunc(_721);
    int _1705 = int(_1703);
    float _1707 = trunc(_801);
    int _1709 = int(_1707);
    float _1711 = float(uint(_1697));
    int _1713 = ~_1685;
    int _1715 = _1713 + 1;
    float _1717 = _1699;
    if (_1689)
    {
        float _1719 = in.m_66.x;
        _1616 = _1719;
    }
    float _1721 = _1616;
    int _1723 = ~_1697;
    int _1725 = _1723 + 1;
    if (!_1689)
    {
        _1717 = 7.345489978790283203125;
    }
    float _1727 = _1717;
    float _1729 = 1.0 / _1701;
    float _1731 = float(uint(_1705));
    float _1733 = _1721;
    if (!_1689)
    {
        float _1735 = in.m_66.y;
        _1733 = _1735;
    }
    float _1737 = _1733;
    float _1739 = float(_1685);
    float _1741 = _1727 * _405;
    bool _1743 = _1685 == 0;
    float _1745 = 1.0 / _1711;
    int _1747 = as_type<int>(_1729) + (-2);
    float _1749 = float(uint(_1709));
    float _1751 = as_type<float>(_1747) * _1731;
    int _1753 = as_type<int>(_1745) + (-2);
    float _1755 = trunc(_1751);
    float _1757 = precise::max(_1755, 0.0);
    uint _1759 = uint(_1757);
    float _1761 = as_type<float>(_1753) * _1749;
    float _1763 = floor(_1741);
    int _1765 = _1715 * int(_1759);
    int _1767 = _1765 + _1705;
    float _1769 = trunc(_1761);
    float _1771 = precise::max(_1769, 0.0);
    uint _1773 = uint(_1771);
    float _1775 = float(uint(_1767));
    float _1777 = -_1763;
    float _1779 = _1741 + _1777;
    float _1781 = as_type<float>(_1747) * _1775;
    float _1783 = float(_1705);
    bool _1785 = _1783 >= _1739;
    bool _1787 = isnan(_1783);
    bool _1789 = _1785 || _1787;
    bool _1791 = isnan(_1739);
    bool _1793 = _1789 || _1791;
    float _1795 = float(_1793);
    float _1797 = trunc(_1781);
    float _1799 = precise::max(_1797, 0.0);
    uint _1801 = uint(_1799);
    int _1803 = _1725 * int(_1773);
    int _1805 = _1803 + _1709;
    int _1807 = ~_1685;
    int _1809 = _1807 + 1;
    float _1811 = float(uint(_1805));
    float _1813 = trunc(_1795);
    int _1815 = int(_1813);
    float _1817 = as_type<float>(_1753) * _1811;
    int _1819 = int(_1759) + int(_1801);
    float _1821 = trunc(_1817);
    float _1823 = precise::max(_1821, 0.0);
    uint _1825 = uint(_1823);
    float _1827 = as_type<float>(_1759);
    if (_1689)
    {
        _1827 = 1.0;
    }
    float _1829 = _1827;
    float _1831 = _1829;
    if (!_1689)
    {
        _1831 = 1.2345600128173828125;
    }
    float _1833 = _1831;
    int _1835 = _1809 * _1819;
    int _1837 = _1835 + _1705;
    int _1839 = ~_1815;
    int _1841 = _1839 + 1;
    int _1843 = _1841 + 1;
    float _1845 = _1737 * _1833;
    bool _1847 = uint(_1837) >= uint(_1685);
    int _1849 = ~_1697;
    int _1851 = _1849 + 1;
    float _1853 = floor(_1845);
    bool _1855 = !_1847;
    int _1857 = _1855 ? 0 : (-1);
    int _1859 = int(_1773) + int(_1825);
    int _1861 = ~_1819;
    int _1863 = _1861 + _1857;
    int _1865 = _1863 + 1;
    int _1867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1869 = _1867 != 0;
    float _1871 = _1779 * _1739;
    int _1873 = _1685 * _1865;
    int _1875 = _1873 + _1705;
    int _1877 = abs(_599);
    int _1879 = _1851 * _1859;
    int _1881 = _1879 + _1709;
    int _1883 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1885 = _1883 != 0;
    float _1887 = trunc(_1871);
    int _1889 = int(_1887);
    bool _1891 = !_1743;
    int _1893 = _1891 ? _1875 : (-1);
    float _1895 = -_1853;
    float _1897 = _1845 + _1895;
    bool _1899 = uint(_1881) >= uint(_1697);
    bool _1901 = !_1885;
    int _1903 = _1901 ? 0 : 1;
    int _1905 = _1893 * _1843;
    float _1907 = _1739 * _735;
    float _1909 = float(_1697);
    float _1911 = float(_1709);
    int _1913 = _1685 + (-1);
    float _1915 = _1909 * _735;
    int _1917 = abs(_1903);
    float _1919 = trunc(_1907);
    int _1921 = int(_1919);
    bool _1923 = _1911 >= _1909;
    bool _1925 = isnan(_1911);
    bool _1927 = _1923 || _1925;
    bool _1929 = isnan(_1909);
    bool _1931 = _1927 || _1929;
    float _1933 = float(_1931);
    int _1935 = _1815 * _1913;
    int _1937 = _1935 + _1905;
    float _1939 = _1897 * _1909;
    bool _1941 = !_1899;
    int _1943 = _1941 ? 0 : (-1);
    int _1945 = _1889 * _1917;
    int _1947 = _1945 + _1705;
    int _1949 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1951 = _1949 != 0;
    float _1953 = trunc(_1933);
    int _1955 = int(_1953);
    int _1957 = ~_1859;
    int _1959 = _1957 + _1943;
    int _1961 = _1959 + 1;
    int _1963 = _1937 * _1877;
    bool _1965 = !_1869;
    int _1967 = _1965 ? 0 : 1;
    int _1969 = abs(_609);
    bool _1971 = !_1951;
    int _1973 = _1971 ? 0 : 1;
    float _1975 = trunc(_1939);
    int _1977 = int(_1975);
    int _1979 = abs(_1967);
    int _1981 = _1921 * _1691;
    int _1983 = _1981 + _1963;
    int _1985 = _1697 * _1961;
    int _1987 = _1985 + _1709;
    int _1989 = abs(_1973);
    bool _1991 = _1697 == 0;
    int _1993 = _1947 * _1969;
    int _1995 = _1993 + _1983;
    float _1997 = trunc(_1915);
    int _1999 = int(_1997);
    int _2001 = ~_1955;
    int _2003 = _2001 + 1;
    int _2005 = _2003 + 1;
    bool _2007 = !_1991;
    int _2009 = _2007 ? _1987 : (-1);
    int _2011 = _1889 * _1979;
    int _2013 = _2011 + _1995;
    int _2015 = _1977 * _1989;
    int _2017 = _2015 + _1709;
    int _2019 = _1697 + (-1);
    int _2021 = _2009 * _2005;
    float _2023 = float(uint(_2013));
    int _2025 = abs(_1322);
    int _2027 = _1955 * _2019;
    int _2029 = _2027 + _2021;
    float _2031 = as_type<float>(_1747) * _2023;
    int _2033 = abs(_1310);
    int _2035 = _2029 * _1693;
    float _2037 = float(uint(_1947));
    float _2039 = trunc(_2031);
    float _2041 = precise::max(_2039, 0.0);
    uint _2043 = uint(_2041);
    int _2045 = ~_1685;
    int _2047 = _2045 + 1;
    int _2049 = _1999 * _2025;
    int _2051 = _2049 + _2035;
    int _2053 = abs(_1314);
    float _2055 = as_type<float>(_1747) * _2037;
    int _2057 = _2017 * _2033;
    int _2059 = _2057 + _2051;
    int _2061 = ~_1685;
    int _2063 = _2061 + 1;
    float _2065 = trunc(_2055);
    float _2067 = precise::max(_2065, 0.0);
    uint _2069 = uint(_2067);
    int _2071 = _1977 * _2053;
    int _2073 = _2071 + _2059;
    int _2075 = ~_1685;
    int _2077 = _2075 + 1;
    float _2079 = float(uint(_2073));
    int _2081 = _2063 * int(_2043);
    int _2083 = _2081 + _2013;
    float _2085 = as_type<float>(_1753) * _2079;
    float _2087 = float(uint(_2083));
    int _2089 = _2077 * int(_2069);
    int _2091 = _2089 + _1947;
    float _2093 = trunc(_2085);
    float _2095 = precise::max(_2093, 0.0);
    uint _2097 = uint(_2095);
    float _2099 = as_type<float>(_1747) * _2087;
    float _2101 = float(uint(_2091));
    int _2103 = ~_1697;
    int _2105 = _2103 + 1;
    float _2107 = trunc(_2099);
    float _2109 = precise::max(_2107, 0.0);
    uint _2111 = uint(_2109);
    float _2113 = as_type<float>(_1747) * _2101;
    int _2115 = ~_1685;
    int _2117 = _2115 + 1;
    int _2119 = _2105 * int(_2097);
    int _2121 = _2119 + _2073;
    float _2123 = trunc(_2113);
    float _2125 = precise::max(_2123, 0.0);
    uint _2127 = uint(_2125);
    float _2129 = float(uint(_2121));
    int _2131 = int(_2043) + int(_2111);
    float _2133 = as_type<float>(_1753) * _2129;
    int _2135 = _2117 * _2131;
    int _2137 = _2135 + _2013;
    float _2139 = trunc(_2133);
    float _2141 = precise::max(_2139, 0.0);
    uint _2143 = uint(_2141);
    int _2145 = int(_2069) + int(_2127);
    bool _2147 = uint(_2137) >= uint(_1685);
    bool _2149 = !_2147;
    int _2151 = _2149 ? 0 : (-1);
    int _2153 = _2047 * _2145;
    int _2155 = _2153 + _1947;
    int _2157 = ~_2131;
    int _2159 = _2157 + _2151;
    int _2161 = _2159 + 1;
    float _2163 = as_type<float>(_2131);
    float _2165 = as_type<float>(_1983);
    if (_1090)
    {
        _2163 = 1.0;
    }
    float _2167 = _2163;
    bool _2169 = uint(_2155) >= uint(_1685);
    int _2171 = _1685 * _2161;
    int _2173 = _2171 + _2013;
    int _2175 = int(_2097) + int(_2143);
    float _2177 = _2167;
    if (!_1090)
    {
        int _2179 = _1156 << 4;
        int _2181 = _2179 + 2048;
        uint _2183 = uint(int(uint(_2181) >> uint(2)));
        uint _2185 = uint(int(uint(int(_2183)) >> uint(2)));
        int _2187 = int(_2183) & 3;
        float _2189 = (*spvDescriptorSet0.vp_c15)._m0[int(_2185)][_2187];
        int _2191 = int(_2183) + 1;
        uint _2193 = uint(int(uint(_2191) >> uint(2)));
        int _2195 = _2191 & 3;
        float _2197 = (*spvDescriptorSet0.vp_c15)._m0[int(_2193)][_2195];
        int _2199 = _2181 + 8;
        uint _2201 = uint(int(uint(_2199) >> uint(2)));
        uint _2203 = uint(int(uint(int(_2201)) >> uint(2)));
        int _2205 = int(_2201) & 3;
        float _2207 = (*spvDescriptorSet0.vp_c15)._m0[int(_2203)][_2205];
        int _2209 = int(_2201) + 1;
        uint _2211 = uint(int(uint(_2209) >> uint(2)));
        int _2213 = _2209 & 3;
        float _2215 = (*spvDescriptorSet0.vp_c15)._m0[int(_2211)][_2213];
        float _2217 = _761 * _2197;
        float _2219 = fma(_383, _2189, _2217);
        float _2221 = fma(_385, _2207, _2219);
        float _2223 = _2221 + _2215;
        float _2225 = precise::clamp(_2223, 0.0, 1.0);
        float _2227 = -_2225;
        float _2229 = _2227 + _1681;
        float _2231 = fma(_2229, 500.0, 1.5);
        float _2233 = exp2(_2231);
        float _2235 = 0.0 + _2233;
        float _2237 = precise::clamp(_2235, 0.0, 1.0);
        _1164 = as_type<float>(_2181);
        _2177 = _2237;
    }
    float _2239 = _1164;
    float _2241 = _2177;
    float _2243 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2245 = _1456 + _2243;
    float _2247 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2249 = _1458 + _2247;
    float _2251 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2253 = _1460 + _2251;
    float _2255 = _2245 * _2245;
    float _2257 = fma(_2249, _2249, _2255);
    float _2259 = fma(_2253, _2253, _2257);
    float _2261 = rsqrt(_2259);
    float _2263 = sqrt(_2259);
    float _2265 = _2261 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2267 = _2249 * _2265;
    float _2269 = _2253 * _2265;
    float _2271 = _2267 * _2267;
    float _2273 = _2269 * _2269;
    float _2275 = _2271 + _2273;
    float _2277 = sqrt(_2275);
    bool _2279 = _2277 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2281 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2283 = _2277 + _2281;
    float _2285 = _2261;
    float _2287 = _2283;
    float _2289 = _2239;
    float _2291 = _2245;
    if (_2279)
    {
        float _2293 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2285 = _2293;
    }
    float _2295 = _2285;
    if (_2279)
    {
        float _2297 = rsqrt(_2275);
        _809 = _2297;
    }
    float _2299 = _809;
    float _2301 = _2299;
    if (_2279)
    {
        float _2303 = _2283 * _2295;
        _2287 = _2303;
    }
    float _2305 = _2287;
    if (_2279)
    {
        float _2307 = _2305 * 0.15915493667125701904296875;
        _2289 = _2307;
    }
    float _2309 = _2289;
    float _2311 = _2253;
    float _2313 = _2309;
    if (_2279)
    {
        float _2315 = _2309 * 6.283185482025146484375;
        float _2317 = sin(_2315);
        _2311 = _2317;
    }
    float _2319 = _2311;
    float _2321 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2323 = precise::max(0.0, _2321);
    float _2325 = _2295;
    float _2327 = _2323;
    if (_2279)
    {
        float _2329 = _2309 * 6.283185482025146484375;
        float _2331 = cos(_2329);
        _2325 = _2331;
    }
    float _2333 = _2325;
    float _2335 = -_2265;
    float _2337 = -_2323;
    float _2339 = fma(_2245, _2335, _2337);
    if (_2279)
    {
        float _2341 = _2339 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2291 = _2341;
    }
    float _2343 = _2291;
    float _2345 = _2343;
    float _2347 = _2319;
    if (_2279)
    {
        float _2349 = fma(_2319, _2343, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2345 = _2349;
    }
    float _2351 = _2345;
    float _2353 = _2351;
    if (!_2279)
    {
        _2347 = _2267;
    }
    float _2355 = _2347;
    float _2357 = _2355;
    float _2359 = _2333;
    if (_2279)
    {
        float _2361 = _2333 + (-1.0);
        _2327 = _2361;
    }
    float _2363 = _2327;
    float _2365 = _2363;
    if (_2279)
    {
        float _2367 = _2299 * _2351;
        _2165 = _2367;
    }
    float _2369 = _2165;
    if (!_2279)
    {
        _2353 = _2339;
    }
    float _2371 = _2353;
    float _2373 = _2371;
    if (_2279)
    {
        float _2375 = _2363 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2313 = _2375;
    }
    float _2377 = _2313;
    if (_2279)
    {
        float _2379 = _2267 * _2369;
        _2357 = _2379;
    }
    float _2381 = _2357;
    if (!_2279)
    {
        _2365 = _2269;
    }
    float _2383 = _2365;
    float _2385 = _2383;
    if (_2279)
    {
        float _2387 = _2269 * _2369;
        _2385 = _2387;
    }
    float _2389 = _2385;
    if (!_2279)
    {
        _2301 = _2271;
    }
    float _2391 = _2301;
    float _2393 = _2391;
    if (_2279)
    {
        float _2395 = fma(_2339, _2333, _2377);
        _2373 = _2395;
    }
    float _2397 = _2373;
    if (_2279)
    {
        float _2399 = _2381 * _2381;
        _2393 = _2399;
    }
    float _2401 = _2393;
    if (!_2279)
    {
        _2359 = _2273;
    }
    float _2403 = _2359;
    float _2405 = _2403;
    if (_2279)
    {
        float _2407 = _2389 * _2389;
        _2405 = _2407;
    }
    float _2409 = _2405;
    float _2411 = fma(_2397, _2397, _2401);
    float _2413 = float(uint(_2017));
    int _2415 = ~_1697;
    int _2417 = _2415 + 1;
    float _2419 = _2411 + _2409;
    float _2421 = rsqrt(_2419);
    float _2423 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2425 = fma(_2263, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2423);
    float _2427 = precise::clamp(_2425, 0.0, 1.0);
    float _2429 = -_2427;
    float _2431 = _2429 + 1.0;
    float _2433 = abs(_2431);
    float _2435 = log2(_2433);
    float _2437 = _2421 * _2381;
    float _2439 = _2421 * _2397;
    float _2441 = _2421 * _2389;
    float _2443 = _2437 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2445 = -_2443;
    float _2447 = fma(_2439, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2445);
    float _2449 = -_2441;
    float _2451 = fma(_2449, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2447);
    float _2453 = _2435 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2455 = fma(_2451, -0.5, 0.5);
    float _2457 = fma(_2451, 0.5, 0.5);
    float _2459 = exp2(_2453);
    float _2461 = fma(_2457, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2463 = as_type<float>(_1753) * _2413;
    float _2465 = fma(_2457, _2461, -0.212114393711090087890625);
    float _2467 = sqrt(_2455);
    float _2469 = fma(_2457, _2465, 1.570728778839111328125);
    int _2471 = ~_1697;
    int _2473 = _2471 + 1;
    float _2475 = trunc(_2463);
    float _2477 = precise::max(_2475, 0.0);
    uint _2479 = uint(_2477);
    float _2481 = _2439 + 1.0;
    float _2483 = -_2439;
    float _2485 = fma(_2459, _2481, _2483);
    float _2487 = _2467 * 0.636619746685028076171875;
    float _2489 = fma(_2485, 0.5, 0.5);
    float _2491 = -_2469;
    float _2493 = fma(_2487, _2491, 1.0);
    float2 _7950 = float2(_2493, _2489);
    float3 _2497 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7950, float2(0.0), isnan(_7950)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7950, float2(0.0), isnan(_7950)), level(0.0)).xyz;
    float _2499 = _2497.x;
    float _2501 = _2497.y;
    float _2503 = _2497.z;
    bool _2505 = !_1743;
    int _2507 = _2505 ? _2173 : (-1);
    int _2509 = _2473 * _2175;
    int _2511 = _2509 + _2073;
    bool _2513 = !_2169;
    int _2515 = _2513 ? 0 : (-1);
    int _2517 = _2417 * int(_2479);
    int _2519 = _2517 + _2017;
    int _2521 = _2507 & 3;
    bool _2523 = _2521 != 0;
    float _2525 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2527 = _363 + _2525;
    bool _2529 = uint(_2511) >= uint(_1697);
    float _2531 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2533 = _363 + _2531;
    int _2535 = _2507 & 3;
    bool _2537 = _2535 != 0;
    out.m_72.x = _383;
    out.m_72.y = _673;
    out.m_72.z = _385;
    bool _2539 = uint(_2521) >= 2u;
    float _2541 = _2435 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2543 = !_2529;
    int _2545 = _2543 ? 0 : (-1);
    float _2547 = -_803;
    float _2549 = _2547 + 1.0;
    int _2551 = ~_2145;
    int _2553 = _2551 + _2515;
    int _2555 = _2553 + 1;
    float _2557 = -_633;
    float _2559 = _2557 + 1.0;
    int _2561 = _2537 ? 0 : 1;
    float _2563 = exp2(_2541);
    int _2565 = _2539 ? 0 : 1;
    int _2567 = _1685 * _2555;
    int _2569 = _2567 + _1947;
    bool _2571 = uint(_2521) > 1u;
    float _2573 = -_611;
    float _2575 = _2573 + 1.0;
    bool _2577 = _2521 != 3;
    float _2579 = -_403;
    float _2581 = _2579 + 1.0;
    int _2583 = ~_2175;
    int _2585 = _2583 + _2545;
    int _2587 = _2585 + 1;
    float _2589 = float(uint(_2519));
    bool _2591 = _411 > 0.5;
    int _2593 = _1697 * _2587;
    int _2595 = _2593 + _2073;
    int _2597 = ~_2561;
    int _2599 = _2597 + 1;
    int _2601 = _2599 + 1;
    float _2603 = as_type<float>(_1753) * _2589;
    int _2605 = ~_2565;
    int _2607 = _2605 + 1;
    int _2609 = _2607 + 1;
    float _2611 = -_2563;
    float _2613 = _2611 + 1.0;
    bool _2615 = !_1991;
    int _2617 = _2615 ? _2595 : (-1);
    float _2619 = trunc(_2603);
    float _2621 = precise::max(_2619, 0.0);
    uint _2623 = uint(_2621);
    int _2625 = _2601;
    int _2627 = _2609;
    if (!_2571)
    {
        int _2629 = ~_2561;
        int _2631 = _2629 + 1;
        _2625 = _2631;
    }
    int _2633 = _2625;
    float _2635 = _2613 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_2577)
    {
        int _2637 = ~_2565;
        int _2639 = _2637 + 1;
        _2627 = _2639;
    }
    int _2641 = _2627;
    int _2643 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2645 = _2643 != 0;
    float _2647 = _2635 * _1664;
    float _2649 = -_185;
    int _2651 = _2591 ? as_type<int>(_2649) : as_type<int>(_185);
    int _2653 = _2617 & 3;
    bool _2655 = _2653 != 0;
    bool _2657 = !_2645;
    int _2659 = _2657 ? 0 : 1;
    bool _2661 = uint(_2653) > 1u;
    bool _2663 = !_1743;
    int _2665 = _2663 ? _2569 : (-1);
    int _2667 = _2617 & 3;
    bool _2669 = _2667 != 0;
    bool _2671 = !_2655;
    int _2673 = _2671 ? 0 : 1;
    int _2675 = _2669 ? 0 : 1;
    bool _2677 = _2521 != 3;
    int _2679 = ~_2675;
    int _2681 = _2679 + 1;
    int _2683 = _2681 + 1;
    float _2685 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2687 = _2685 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _2689 = _2683;
    if (!_2661)
    {
        int _2691 = ~_2675;
        int _2693 = _2691 + 1;
        _2689 = _2693;
    }
    int _2695 = _2689;
    bool _2697 = !_2677;
    int _2699 = _2697 ? 0 : (-1);
    float _2701 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2703 = _2701 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2705 = 1.0 / _2687;
    bool _2707 = _2653 != 3;
    int _2709 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2711 = _2709 != 0;
    float _2713 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2715 = _2713 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2717 = ~_1697;
    int _2719 = _2717 + 1;
    bool _2721 = uint(_2653) >= 2u;
    float _2723 = 1.0 / _2703;
    int _2725 = int(_2479) + int(_2623);
    int _2727 = _2719 * _2725;
    int _2729 = _2727 + _2017;
    bool _2731 = !_2523;
    int _2733 = _2731 ? 0 : 1;
    bool _2735 = !_2711;
    int _2737 = _2735 ? 0 : 1;
    float _2739 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2741 = _2739 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _2743 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2745 = _2743 != 0;
    int _2747 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2749 = _2747 != 0;
    float _2751 = 1.0 / _2741;
    int _2753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2755 = _2753 != 0;
    int _2757 = _2721 ? 0 : 1;
    bool _2759 = _2653 != 3;
    int _2761 = ~_2757;
    int _2763 = _2761 + 1;
    int _2765 = _2763 + 1;
    float _2767 = 1.0 / _2715;
    int _2769 = _2765;
    if (_2707)
    {
        int _2771 = ~_2757;
        int _2773 = _2771 + 1;
        _2769 = _2773;
    }
    int _2775 = _2769;
    bool _2777 = uint(_2729) >= uint(_1697);
    float _2779 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2781 = _2779 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2783 = !_2759;
    int _2785 = _2783 ? 0 : (-1);
    bool _2787 = _405 > 0.5;
    float _2789 = 1.0 / _2781;
    float _2791 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2793 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2791;
    float _2795 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2797 = _2795 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _2799 = _2617 >> 31;
    float _2801 = _2793 * _2723;
    bool _2803 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2805 = isnan(_363);
    bool _2807 = _2803 || _2805;
    bool _2809 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2811 = _2807 || _2809;
    float _2813 = float(_2811);
    float _2815 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2817 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2815;
    bool _2819 = !_2777;
    int _2821 = _2819 ? 0 : (-1);
    float _2823 = fma(_2801, _2533, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    int _2825 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2827 = _2825 != 0;
    float _2829 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2831 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2829;
    float _2833 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2835 = _2833 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2837 = _2817 * _2751;
    int _2839 = _2799 & 3;
    float _2841 = _2831 * _2705;
    float _2843 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2845 = _363 + _2843;
    float _2847 = _2835 * _2767;
    float _2849 = _2797 * _2789;
    float _2851 = -_2813;
    float _2853 = _2851 + 1.0;
    float _2855 = fma(_2841, _2845, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2857 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2859 = isnan(_363);
    bool _2861 = _2857 || _2859;
    bool _2863 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2865 = _2861 || _2863;
    float _2867 = float(_2865);
    float _2869 = fma(_2847, _2527, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _2871 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2873 = isnan(_363);
    bool _2875 = _2871 || _2873;
    bool _2877 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2879 = _2875 || _2877;
    float _2881 = float(_2879);
    float _2883 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2885 = _363 + _2883;
    int _2887 = _2507 >> 31;
    float _2889 = _2867 * _2853;
    float _2891 = -_2867;
    float _2893 = _2891 + 1.0;
    bool _2895 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2897 = isnan(_363);
    bool _2899 = _2895 || _2897;
    bool _2901 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2903 = _2899 || _2901;
    float _2905 = float(_2903);
    float _2907 = fma(_2849, _2885, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    int _2909 = _2887 & 3;
    float _2911 = -_2881;
    float _2913 = _2911 + 1.0;
    float _2915 = _2881 * _2893;
    bool _2917 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2919 = isnan(_363);
    bool _2921 = _2917 || _2919;
    bool _2923 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2925 = _2921 || _2923;
    float _2927 = float(_2925);
    float _2929 = -_2905;
    float _2931 = _2929 + 1.0;
    float _2933 = _2905 * _2913;
    int _2935 = _2617 + _2839;
    float _2937 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2939 = _2937 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    int _2941 = _2507 + _2909;
    float _2943 = _2927 * _2931;
    bool _2945 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2947 = isnan(_363);
    bool _2949 = _2945 || _2947;
    bool _2951 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2953 = _2949 || _2951;
    float _2955 = float(_2953);
    float _2957 = -_2927;
    float _2959 = _2957 + 1.0;
    bool _2961 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2963 = isnan(_363);
    bool _2965 = _2961 || _2963;
    bool _2967 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2969 = _2965 || _2967;
    float _2971 = float(_2969);
    float _2973 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2975 = _363 + _2973;
    int _2977 = _2941 >> 2;
    float _2979 = -_2955;
    float _2981 = _2979 + 1.0;
    int _2983 = _2935 >> 2;
    float _2985 = _2955 * _2959;
    int _2987 = _2977 << 4;
    int _2989 = _2987 + 368;
    float _2991 = _2971 * _2981;
    int _2993 = _2983 << 4;
    int _2995 = _2993 + 512;
    uint _2997 = uint(int(uint(_2989) >> uint(2)));
    uint _2999 = uint(int(uint(int(_2997)) >> uint(2)));
    int _3001 = int(_2997) & 3;
    float _3003 = (*spvDescriptorSet0.vp_c9)._m0[int(_2999)][_3001];
    int _3005 = int(_2997) + 1;
    uint _3007 = uint(int(uint(_3005) >> uint(2)));
    int _3009 = _3005 & 3;
    float _3011 = (*spvDescriptorSet0.vp_c9)._m0[int(_3007)][_3009];
    float _3013 = _2855 * _2991;
    float _3015 = -_2971;
    float _3017 = _3015 + 1.0;
    float _3019 = fma(_3017, (*spvDescriptorSet0.vp_c9)._m0[159].x, _3013);
    uint _3021 = uint(int(uint(_2995) >> uint(2)));
    uint _3023 = uint(int(uint(int(_3021)) >> uint(2)));
    int _3025 = int(_3021) & 3;
    float _3027 = (*spvDescriptorSet0.vp_c9)._m0[int(_3023)][_3025];
    int _3029 = int(_3021) + 1;
    uint _3031 = uint(int(uint(_3029) >> uint(2)));
    int _3033 = _3029 & 3;
    float _3035 = (*spvDescriptorSet0.vp_c9)._m0[int(_3031)][_3033];
    float _3037 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3039 = _3037 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3041 = fma(_2869, _2985, _3019);
    float _3043 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3045 = _3043 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _3047 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3049 = _363 + _3047;
    int _3051 = abs(_2695);
    float _3053 = fma(_2823, _2943, _3041);
    int _3055 = ~_2725;
    int _3057 = _3055 + _2821;
    int _3059 = _3057 + 1;
    float _3061 = 1.0 / _3039;
    int _3063 = _2989 + 8;
    uint _3065 = uint(int(uint(_3063) >> uint(2)));
    uint _3067 = uint(int(uint(int(_3065)) >> uint(2)));
    int _3069 = int(_3065) & 3;
    float _3071 = (*spvDescriptorSet0.vp_c9)._m0[int(_3067)][_3069];
    int _3073 = int(_3065) + 1;
    uint _3075 = uint(int(uint(_3073) >> uint(2)));
    int _3077 = _3073 & 3;
    float _3079 = (*spvDescriptorSet0.vp_c9)._m0[int(_3075)][_3077];
    float _3081 = fma(_2837, _3049, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _3083 = fma(_2907, _2933, _3053);
    int _3085 = _1697 * _3059;
    int _3087 = _3085 + _2017;
    bool _3089 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _3091 = isnan(_363);
    bool _3093 = _3089 || _3091;
    bool _3095 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _3097 = _3093 || _3095;
    float _3099 = float(_3097);
    float _3101 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3103 = _363 + _3101;
    float _3105 = fma(_3081, _2915, _3083);
    float _3107 = 1.0 / _3045;
    int _3109 = _2995 + 8;
    uint _3111 = uint(int(uint(_3109) >> uint(2)));
    uint _3113 = uint(int(uint(int(_3111)) >> uint(2)));
    int _3115 = int(_3111) & 3;
    float _3117 = (*spvDescriptorSet0.vp_c9)._m0[int(_3113)][_3115];
    int _3119 = int(_3111) + 1;
    uint _3121 = uint(int(uint(_3119) >> uint(2)));
    int _3123 = _3119 & 3;
    float _3125 = (*spvDescriptorSet0.vp_c9)._m0[int(_3121)][_3123];
    bool _3127 = !_1991;
    int _3129 = _3127 ? _3087 : (-1);
    bool _3131 = _407 > 0.5;
    int _3133 = abs(_2633);
    float _3135 = _2939 * _3061;
    float _3137 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3139 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _3137;
    float _3141 = -_181;
    int _3143 = _2787 ? as_type<int>(_3141) : as_type<int>(_181);
    bool _3145 = _409 > 0.5;
    float _3147 = fma(_3135, _2975, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _3149 = ~_3133;
    int _3151 = _3149 + 1;
    int _3153 = _3151 + 1;
    float _3155 = -_3099;
    float _3157 = _3155 + 1.0;
    float _3159 = _3139 * _3107;
    int _3161 = abs(_2733);
    float _3163 = fma(_3147, _2889, _3105);
    int _3165 = ~_3051;
    int _3167 = _3165 + 1;
    int _3169 = _3167 + 1;
    float _3171 = fma(_3159, _3103, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _3173 = abs(_2673);
    float _3175 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3177 = int(_3175);
    int _3179 = _3153 * as_type<int>(_3011);
    int _3181 = abs(_2775);
    float _3183 = _2813 * _3157;
    int _3185 = ~_3161;
    int _3187 = _3185 + 1;
    int _3189 = _3187 + 1;
    int _3191 = abs(_2641);
    float _3193 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3195 = int(_3193);
    int _3197 = abs(_2699);
    int _3199 = _3169 * as_type<int>(_3035);
    int _3201 = _3189 * as_type<int>(_3003);
    int _3203 = _3201 + _3179;
    float _3205 = _995 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3207 = ~_3173;
    int _3209 = _3207 + 1;
    int _3211 = _3209 + 1;
    float _3213 = abs(_915);
    float _3215 = log2(_3213);
    float _3217 = float(uint(_3177));
    float _3219 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3205);
    int _3221 = ~_3191;
    int _3223 = _3221 + 1;
    int _3225 = _3223 + 1;
    int _3227 = _3211 * as_type<int>(_3027);
    int _3229 = _3227 + _3199;
    int _3231 = ~_3181;
    int _3233 = _3231 + 1;
    int _3235 = _3233 + 1;
    float _3237 = fma(_3171, _3183, _3163);
    int _3239 = ~_3197;
    int _3241 = _3239 + 1;
    int _3243 = _3241 + 1;
    int _3245 = _3225 * as_type<int>(_3071);
    int _3247 = _3245 + _3203;
    float _3249 = 1.0 / _3217;
    float _3251 = float(uint(_3195));
    int _3253 = _3235 * as_type<int>(_3117);
    int _3255 = _3253 + _3229;
    int _3257 = abs(_2659);
    int _3259 = _3243 * as_type<int>(_3079);
    int _3261 = _3259 + _3247;
    int _3263 = abs(_2785);
    float _3265 = fma(_3099, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3237);
    int _3267 = ~_3257;
    int _3269 = _3267 + 1;
    int _3271 = _3269 + 1;
    float _3273 = 1.0 / _3251;
    int _3275 = abs(_3177);
    float _3277 = _3215 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _3279 = abs(_2737);
    int _3281 = _3261 * _3271;
    int _3283 = ~_3263;
    int _3285 = _3283 + 1;
    int _3287 = _3285 + 1;
    float _3289 = _963 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3291 = abs(_3195);
    int _3293 = _2665 * _3257;
    int _3295 = _3293 + _3281;
    float _3297 = float(uint(_3275));
    int _3299 = _3287 * as_type<int>(_3125);
    int _3301 = _3299 + _3255;
    int _3303 = ~_3279;
    int _3305 = _3303 + 1;
    int _3307 = _3305 + 1;
    float _3309 = _963 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3311 = float(uint(_3291));
    float _3313 = _963 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3315 = 1.0 / _3297;
    int _3317 = _3301 * _3307;
    int _3319 = as_type<int>(_3249) + (-2);
    float _3321 = -_949;
    float _3323 = fma(_3321, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3289);
    float _3325 = float(uint(_3295));
    float _3327 = -_949;
    float _3329 = fma(_3327, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3309);
    float _3331 = -_949;
    float _3333 = fma(_3331, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3313);
    int _3335 = _3129 * _3279;
    int _3337 = _3335 + _3317;
    float _3339 = 1.0 / _3311;
    float _3341 = as_type<float>(_3319) * _3325;
    int _3343 = as_type<int>(_3273) + (-2);
    out.m_74.x = _3265;
    float _3345 = float(uint(_3337));
    int _3347 = abs(_3295);
    float _3349 = exp2(_3277);
    float _3351 = as_type<float>(_3343) * _3345;
    int _3353 = abs(_3337);
    int _3355 = as_type<int>(_3315) + (-2);
    float _3357 = trunc(_3341);
    float _3359 = precise::max(_3357, 0.0);
    uint _3361 = uint(_3359);
    float _3363 = float(uint(_3347));
    int _3365 = as_type<int>(_3339) + (-2);
    float _3367 = as_type<float>(_3355) * _3363;
    int _3369 = ~_3177;
    int _3371 = _3369 + 1;
    float _3373 = fma(_3349, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3375 = precise::clamp(_3373, 0.0, 1.0);
    float _3377 = float(uint(_3353));
    float _3379 = trunc(_3351);
    float _3381 = precise::max(_3379, 0.0);
    uint _3383 = uint(_3381);
    float _3385 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3323);
    float _3387 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3329);
    float _3389 = _995 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3391 = as_type<float>(_3365) * _3377;
    float _3393 = _995 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3395 = _3371 * int(_3361);
    int _3397 = _3395 + _3295;
    float _3399 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3389);
    float _3401 = trunc(_3367);
    float _3403 = precise::max(_3401, 0.0);
    uint _3405 = uint(_3403);
    float _3407 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3393);
    int _3409 = ~_3275;
    int _3411 = _3409 + 1;
    float _3413 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3333);
    float _3415 = float(uint(_3397));
    int _3417 = ~_3195;
    int _3419 = _3417 + 1;
    float _3421 = trunc(_3391);
    float _3423 = precise::max(_3421, 0.0);
    uint _3425 = uint(_3423);
    float _3427 = as_type<float>(_3319) * _3415;
    int _3429 = _3419 * int(_3383);
    int _3431 = _3429 + _3337;
    int _3433 = ~_3291;
    int _3435 = _3433 + 1;
    float _3437 = _991 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _3439 = !_2745;
    float _3441 = _3439 ? _185 : as_type<float>(_2651);
    int _3443 = _3411 * int(_3405);
    int _3445 = _3443 + _3347;
    float _3447 = float(uint(_3431));
    float _3449 = _991 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3451 = trunc(_3427);
    float _3453 = precise::max(_3451, 0.0);
    uint _3455 = uint(_3453);
    float _3457 = _991 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3459 = float(uint(_3445));
    float _3461 = as_type<float>(_3343) * _3447;
    float _3463 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3399);
    int _3465 = _3435 * int(_3425);
    int _3467 = _3465 + _3353;
    float _3469 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3449);
    float _3471 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3437);
    float _3473 = trunc(_3461);
    float _3475 = precise::max(_3473, 0.0);
    uint _3477 = uint(_3475);
    float _3479 = -_185;
    int _3481 = _3131 ? as_type<int>(_3479) : as_type<int>(_185);
    float _3483 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3457);
    float _3485 = float(uint(_3467));
    float _3487 = as_type<float>(_3355) * _3459;
    float _3489 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3407);
    float _3491 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3219);
    float _3493 = as_type<float>(_3365) * _3485;
    bool _3495 = !_2749;
    float _3497 = _3495 ? _185 : as_type<float>(_3481);
    float _3499 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3501 = fma(_3375, -2.0, 3.0);
    float _3503 = trunc(_3493);
    float _3505 = precise::max(_3503, 0.0);
    uint _3507 = uint(_3505);
    float _3509 = _3375 * _3375;
    float _3511 = -_181;
    int _3513 = _3145 ? as_type<int>(_3511) : as_type<int>(_181);
    float _3515 = _3499 * _3385;
    bool _3517 = !_2827;
    float _3519 = _3517 ? _181 : as_type<float>(_3143);
    float _3521 = _3509 * _3501;
    bool _3523 = !_2755;
    float _3525 = _3523 ? _181 : as_type<float>(_3513);
    float _3527 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3529 = trunc(_3487);
    float _3531 = precise::max(_3529, 0.0);
    uint _3533 = uint(_3531);
    int _3535 = ~_3177;
    int _3537 = _3535 + 1;
    float _3539 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3469);
    float _3541 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3471);
    float _3543 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3483);
    int _3545 = int(_3361) + int(_3455);
    float _3547 = fma(_3527, _3463, _3515);
    int _3549 = ~_3195;
    int _3551 = _3549 + 1;
    out.m_76.x = _3463;
    out.m_76.y = _3491;
    out.m_76.z = _3489;
    int _3553 = int(_3383) + int(_3477);
    int _3555 = ~_3291;
    int _3557 = _3555 + 1;
    int _3559 = int(_3425) + int(_3507);
    int _3561 = _3537 * _3545;
    int _3563 = _3561 + _3295;
    int _3565 = int(_3405) + int(_3533);
    int _3567 = ~_3275;
    int _3569 = _3567 + 1;
    int _3571 = _3551 * _3553;
    int _3573 = _3571 + _3337;
    bool _3575 = uint(_3563) >= uint(_3177);
    int _3577 = _3569 * _3565;
    int _3579 = _3577 + _3347;
    bool _3581 = uint(_3573) >= uint(_3195);
    int _3583 = _3557 * _3559;
    int _3585 = _3583 + _3353;
    float _3587 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3589 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3591 = !_3575;
    int _3593 = _3591 ? 0 : (-1);
    bool _3595 = !_3581;
    int _3597 = _3595 ? 0 : (-1);
    float _3599 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3587);
    bool _3601 = uint(_3585) >= uint(_3291);
    bool _3603 = uint(_3579) >= uint(_3275);
    float _3605 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3607 = _3295 ^ _3177;
    float _3609 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3599);
    int _3611 = ~_3545;
    int _3613 = _3611 + _3593;
    int _3615 = _3613 + 1;
    float _3617 = _2503 * _2647;
    bool _3619 = !_3603;
    int _3621 = _3619 ? 0 : (-1);
    float _3623 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3609);
    uint _3625 = uint(int(uint(_3607) >> uint(31)));
    int _3627 = _3177 * _3615;
    int _3629 = _3627 + _3295;
    int _3631 = ~_3553;
    int _3633 = _3631 + _3597;
    int _3635 = _3633 + 1;
    float _3637 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3639 = ~_3621;
    int _3641 = _3565 + _3639;
    int _3643 = _3641 + 1;
    float _3645 = _3539 + _3547;
    int _3647 = ~int(_3625);
    int _3649 = _3647 + 1;
    int _3651 = _3337 ^ _3195;
    int _3653 = _3195 * _3635;
    int _3655 = _3653 + _3337;
    bool _3657 = _3177 == 0;
    bool _3659 = !_3601;
    int _3661 = _3659 ? 0 : (-1);
    bool _3663 = _3195 == 0;
    bool _3665 = _3195 == 0;
    float _3667 = _3589 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3669 = _3643 ^ _3649;
    float _3671 = fma(_3499, _3499, 1.0);
    uint _3673 = uint(int(uint(_3651) >> uint(31)));
    float _3675 = _3637 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3677 = !_3657;
    int _3679 = _3677 ? _3629 : (-1);
    int _3681 = ~_3661;
    int _3683 = _3559 + _3681;
    int _3685 = _3683 + 1;
    bool _3687 = _3177 == 0;
    int _3689 = ~int(_3673);
    int _3691 = _3689 + 1;
    float _3693 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3695 = ~_3649;
    int _3697 = _3695 + _3669;
    int _3699 = _3697 + 1;
    bool _3701 = !_3663;
    int _3703 = _3701 ? _3655 : (-1);
    float _3705 = float(_3679);
    int _3707 = _3685 ^ _3691;
    float _3709 = rsqrt(_3671);
    float _3711 = float(_3703);
    float _3713 = fma(_3667, _3705, _475);
    float _3715 = _3519 + 0.5;
    int _3717 = ~_3691;
    int _3719 = _3717 + _3707;
    int _3721 = _3719 + 1;
    bool _3723 = !_3687;
    int _3725 = _3723 ? _3699 : (-1);
    float _3727 = fma(_3675, _3711, _743);
    float _3729 = fma(_3667, _3715, _3713);
    float _3731 = _3525 + 0.5;
    bool _3733 = !_3665;
    int _3735 = _3733 ? _3721 : (-1);
    float _3737 = _3605 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3739 = float(_3725);
    float _3741 = fma(_3675, _3731, _3727);
    float _3743 = float(_3735);
    float _3745 = _3693 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3747 = _3499 * _3709;
    float _3749 = -_479;
    float _3751 = fma(_3737, _3739, _3749);
    float _3753 = _3497 + (-0.5);
    float _3755 = -_805;
    float _3757 = fma(_3745, _3743, _3755);
    float _3759 = -_3539;
    float _3761 = _3747 * _3759;
    float _3763 = _3441 + (-0.5);
    float _3765 = -_3737;
    float _3767 = fma(_3765, _3753, _3751);
    float _3769 = -_3541;
    float _3771 = _3747 * _3769;
    float _3773 = fma(_3709, _3385, _3761);
    float _3775 = -_3745;
    float _3777 = fma(_3775, _3763, _3757);
    float _3779 = -_3543;
    float _3781 = _3747 * _3779;
    float _3783 = fma(_3709, _3387, _3771);
    float _3785 = _3499 * _3413;
    float _3787 = _3499 * _3387;
    float _3789 = fma(_3709, _3413, _3781);
    float _3791 = -_779;
    float _3793 = _3791 + 1.0;
    float _3795 = fma(_3527, _3489, _3785);
    float _3797 = fma(_3527, _3491, _3787);
    float _3799 = -_2559;
    float _3801 = fma(_3525, _3799, _3741);
    out.m_78.x = _3773;
    out.m_78.y = _3783;
    out.m_78.z = _3789;
    float _3803 = _3543 + _3795;
    float _3805 = -_3521;
    float _3807 = _3805 + 1.0;
    float _3809 = _3541 + _3797;
    float _3811 = -_3793;
    float _3813 = fma(_3519, _3811, _3729);
    float _3815 = fma(_3497, _2549, _3767);
    float _3817 = fma(_3807, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3521);
    float _3819 = fma(_3441, _2575, _3777);
    float _3821 = _3623 + _1568;
    out.m_80.x = _3645;
    out.m_80.y = _3809;
    out.m_80.z = _3803;
    bool _3823 = _915 <= 8000.0;
    bool _3825 = isnan(_915);
    bool _3827 = _3823 || _3825;
    bool _3829 = isnan(8000.0);
    bool _3831 = _3827 || _3829;
    float _3833 = float(_3831);
    out.m_82.x = _3813;
    out.m_82.y = _3815;
    out.m_82.z = _3801;
    out.m_82.w = _3819;
    float _3835 = _3821 * 0.5;
    float _3837 = _3821;
    float _3839 = _3835;
    float _3841 = _3623;
    if (!_1548)
    {
        _3837 = 1.0;
    }
    float _3843 = _3837;
    float _3845 = _3833 * _3817;
    float _3847 = _3843;
    if (_1548)
    {
        bool _3849 = _1662 >= _1652;
        bool _3851 = isnan(_1662);
        bool _3853 = _3849 || _3851;
        bool _3855 = isnan(_1652);
        bool _3857 = _3853 || _3855;
        float _3859 = float(_3857);
        _3847 = _3859;
    }
    float _3861 = _3847;
    float _3863 = _1675 * _2647;
    float _3865 = _3861 * _2241;
    float _3867 = fma(_2499, _3863, _1669);
    out.gl_Position.x = _1602;
    out.gl_Position.y = _1604;
    out.gl_Position.z = _3623;
    out.gl_Position.w = _1568;
    float _3869 = fma(_2501, _3863, _1671);
    float _3871 = _3845 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3873 = fma(_1675, _3617, _1673);
    out.m_84.z = _3835;
    out.m_84.w = _1568;
    bool _3875 = _2263 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3877 = isnan(_2263);
    bool _3879 = _3875 || _3877;
    bool _3881 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3883 = _3879 || _3881;
    float _3885 = _2581 * _3871;
    float _3887 = precise::clamp(_3885, 0.0, 1.0);
    float _3889 = -_3887;
    float _3891 = fma(_3889, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3893 = -_3865;
    float _3895 = fma(_3893, _3891, 1.0);
    float _3897 = precise::clamp(_3895, 0.0, 1.0);
    float _3899 = -_2635;
    float _3901 = _3899 + 1.0;
    float _3903 = _3897 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3905 = _1675 * _3901;
    float _3907 = _3897;
    float _3909 = _3901;
    if (!_3883)
    {
        _3907 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3911 = _3907;
    float _3913 = _3911;
    float _3915 = _3911;
    if (!_3883)
    {
        _3839 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3917 = _3839;
    out.m_86.x = _3903;
    float _3919 = _3917;
    float _3921 = _3917;
    if (!_3883)
    {
        _1576 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3923 = _1576;
    float _3925 = _3923;
    float _3927 = _3923;
    if (!_3883)
    {
        _3841 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3929 = _3841;
    out.m_88.x = _3867;
    out.m_88.y = _3869;
    out.m_88.z = _3873;
    out.m_88.w = _3905;
    float _3931 = _3929;
    float _3933 = _3929;
    if (!_3883)
    {
        _1606 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3935 = _1606;
    float _3937 = _3935;
    float _3939 = _3935;
    if (!_3883)
    {
        _3909 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3941 = _3909;
    bool _3943 = !_3883;
    float _3945 = _3941;
    float _3947 = _3941;
    if (!_3943)
    {
        bool _3949 = _2263 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3951 = isnan(_2263);
        bool _3953 = _3949 || _3951;
        bool _3955 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3957 = _3953 || _3955;
        if (!_3957)
        {
            float _3959 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3961 = _2263 + _3959;
            float _3963 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3965 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3963;
            float _3967 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3969 = _3967 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3971 = 1.0 / _3965;
            float _3973 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3975 = _3973 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3977 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3979 = _3977 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3981 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3983 = _3981 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3985 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3987 = _3985 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3989 = _3961 * _3971;
            float _3991 = precise::clamp(_3989, 0.0, 1.0);
            float _3993 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3995 = _3993 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3997 = fma(_3991, _3969, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3999 = fma(_3991, _3995, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4001 = fma(_3991, _3975, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4003 = fma(_3991, _3979, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4005 = fma(_3991, _3983, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4007 = fma(_3991, _3987, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3921 = _4001;
            _3939 = _4005;
            _3915 = _3997;
            _3933 = _4003;
            _3927 = _3999;
            _3947 = _4007;
            _4009 = true;
        }
        else
        {
            bool _4011 = _2263 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4013 = isnan(_2263);
            bool _4015 = _4011 || _4013;
            bool _4017 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4019 = _4015 || _4017;
            if (!_4019)
            {
                _3913 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4021 = _3913;
            _3915 = _4021;
            if (!_4019)
            {
                _3919 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4023 = _3919;
            _3921 = _4023;
            if (!_4019)
            {
                _3925 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4025 = _3925;
            _3927 = _4025;
            if (!_4019)
            {
                _3931 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4027 = _3931;
            _3933 = _4027;
            if (!_4019)
            {
                _3937 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4029 = _3937;
            _3939 = _4029;
            if (!_4019)
            {
                _3945 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4031 = _3945;
            bool _4033 = !_4019;
            _3947 = _4031;
            if (!_4033)
            {
                bool _4035 = _2263 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4037 = isnan(_2263);
                bool _4039 = _4035 || _4037;
                bool _4041 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4043 = _4039 || _4041;
                if (!_4043)
                {
                    float _4045 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4047 = _2263 + _4045;
                    float _4049 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4051 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4049;
                    float _4053 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4055 = _4053 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4057 = 1.0 / _4051;
                    float _4059 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4061 = _4059 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4063 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4065 = _4063 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4067 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4069 = _4067 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4071 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4073 = _4071 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4075 = _4047 * _4057;
                    float _4077 = precise::clamp(_4075, 0.0, 1.0);
                    float _4079 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4081 = _4079 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4083 = fma(_4077, _4055, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4085 = fma(_4077, _4081, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4087 = fma(_4077, _4061, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4089 = fma(_4077, _4065, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4091 = fma(_4077, _4069, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4093 = fma(_4077, _4073, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3921 = _4087;
                    _3939 = _4091;
                    _3915 = _4083;
                    _3933 = _4089;
                    _3927 = _4085;
                    _3947 = _4093;
                    _4009 = true;
                }
                else
                {
                    _3921 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3939 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3915 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3933 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3927 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3947 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4009 = false;
    float _4095 = _3921;
    float _4097 = _3939;
    float _4099 = _3915;
    float _4101 = _3933;
    float _4103 = _3927;
    float _4105 = _3947;
    float _4107 = fma(_3809, -0.5, 0.5);
    float _4109 = precise::clamp(_4107, 0.0, 1.0);
    float _4111 = -_4095;
    float _4113 = _4111 + _4097;
    float _4115 = -_4099;
    float _4117 = _4115 + _4101;
    float _4119 = -_4103;
    float _4121 = _4119 + _4105;
    bool _4123 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4125 = fma(_4109, _4113, _4095);
    float _4127 = fma(_4109, _4117, _4099);
    float _4129 = fma(_4109, _4121, _4103);
    float _4131 = _4125 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _4133 = fma(_4127, 0.298911988735198974609375, _4131);
    float _4135 = fma(_4129, 0.114477999508380889892578125, _4133);
    out.m_90.x = 0.0;
    float _4137 = -_4135;
    float _4139 = _4127 + _4137;
    float _4141 = -_4135;
    float _4143 = _4125 + _4141;
    float _4145 = -_4135;
    float _4147 = _4129 + _4145;
    float _4149 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4151 = fma(_4139, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4135);
    float _4153 = fma(_4143, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4135);
    float _4155 = fma(_4147, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4135);
    out.m_86.w = _4149;
    out.m_92.x = _4151;
    out.m_92.y = _4153;
    out.m_92.z = _4155;
    if (!_4123)
    {
        return out;
    }
    float _4157 = -_1456;
    float _4159 = _4157 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4161 = -_1458;
    float _4163 = _4161 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4165 = -_1460;
    float _4167 = _4165 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4169 = _4159 * _4159;
    float _4171 = fma(_4163, _4163, _4169);
    float _4173 = fma(_4167, _4167, _4171);
    float _4175 = sqrt(_4173);
    float _4177 = rsqrt(_4173);
    float _4179 = -_4175;
    float _4181 = _4179 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4183 = _4181 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4185 = precise::clamp(_4183, 0.0, 1.0);
    float _4187 = _4163 * _4177;
    float _4189 = _4159 * _4177;
    float _4191 = abs(_4185);
    float _4193 = log2(_4191);
    float _4195 = _4167 * _4177;
    float _4197 = _4187 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4199 = _3809 * _4189;
    float _4201 = -_4189;
    float _4203 = -_4197;
    float _4205 = fma(_4201, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4203);
    float _4207 = fma(_3645, _4187, _4199);
    float _4209 = -_4195;
    float _4211 = fma(_4209, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4205);
    float _4213 = fma(_3803, _4195, _4207);
    float _4215 = precise::clamp(_4213, 0.0, 1.0);
    float _4217 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4219 = _4211 + _4217;
    float _4221 = _4193 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4223 = _4219 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4225 = precise::clamp(_4223, 0.0, 1.0);
    float _4227 = exp2(_4221);
    float _4229 = _4227 * _4225;
    float _4231 = _4215 * _4229;
    float _4233 = _4231 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4235 = _4231 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4237 = _4231 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _4233;
    out.m_90.y = _4235;
    out.m_90.z = _4237;
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
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4009 = false;
    bool _355 = false;
    bool _207 = false;
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
        float _4294 = as_type<float>(_127);
        out.gl_Position.z = _4294;
    }
    if (!_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _4364 = as_type<float>(_165);
        out.gl_Position.z = _4364;
    }
    if (_157)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _189 = in.m_66.x;
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
    bool _221 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _223 = isnan(_215);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    bool _233 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _235 = isnan(_215);
    bool _237 = _233 || _235;
    bool _239 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _241 = _237 || _239;
    float _243 = float(_241);
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _247 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _245;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _251 = _249 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _253 = -_231;
    float _255 = _253 + 1.0;
    float _257 = 1.0 / _251;
    bool _259 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _261 = isnan(_215);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    float _271 = _243 * _255;
    float _273 = -_243;
    float _275 = _273 + 1.0;
    bool _277 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _279 = _269 * _275;
    float _281 = 1.0 / _247;
    float _283 = -_269;
    float _285 = _283 + 1.0;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _289 = _287 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _291 = _219 * _281;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _295 = _215 + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _301;
    float _305 = _295 * _257;
    float _307 = fma(_299, _291, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _309 = fma(_303, _291, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _313 = _311 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _315 = fma(_289, _305, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _317 = _307 * _279;
    float _319 = _309 * _279;
    float _321 = fma(_313, _305, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _323 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[143].x, _317);
    float _325 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[143].y, _319);
    float _327 = fma(_321, _271, _323);
    float _329 = fma(_315, _271, _325);
    float _331 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[145].x, _327);
    float _333 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[145].y, _329);
    bool _335 = !_277;
    float _353;
    if (!_335)
    {
        float _337 = in.m_66.x;
        float _339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _341 = _337 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _343 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[14].x, _145);
        float _345 = _343 * _339;
        float _347 = floor(_345);
        float _349 = -_347;
        float _351 = _345 + _349;
        _353 = _351;
        _355 = true;
    }
    else
    {
        float _357 = float(_111);
        float _359 = 1.0 / _357;
        float _361 = _145 * _359;
        _353 = _361;
    }
    _355 = false;
    float _363 = _353;
    float _365 = in.m_56.x;
    float _367 = in.m_56.y;
    float _369 = in.m_56.z;
    float _371 = _367 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _373 = _367 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _375 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].x, _371);
    float _377 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].x, _373);
    float _379 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[4].z, _375);
    float _381 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[6].z, _377);
    float _383 = _379 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _385 = _381 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _387 = fma(_383, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _389 = fma(_385, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _391 = floor(_387);
    float _393 = floor(_389);
    float _395 = -_391;
    float _397 = _387 + _395;
    float _399 = -_393;
    float _401 = _389 + _399;
    float2 _4749 = float2(_397, _401);
    float _403 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4749, float2(0.0), isnan(_4749)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4749, float2(0.0), isnan(_4749)), level(0.0)).x;
    float _405 = in.m_66.x;
    float _407 = in.m_66.y;
    float _409 = in.m_66.z;
    float _411 = in.m_66.w;
    float _413 = _367 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _415 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _417 = log2(_415);
    int _419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _421 = _419 != 0;
    float _423 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].x, _413);
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _427 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[5].z, _423);
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _431 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _433 = int(_431);
    float _435 = float(_111);
    int _437 = as_type<int>(_365);
    float _439 = _423;
    float _441 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_421)
    {
        _437 = 0;
    }
    int _443 = _437;
    int _445 = _443;
    if (!_421)
    {
        _445 = 1;
    }
    int _447 = _445;
    float _449 = 1.0 / _435;
    float _451 = _417 * _145;
    float _453 = _405 * 2.0;
    float _455 = _407 * 2.0;
    float _457 = _405 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _459 = _447 != 1;
    float _461 = _407 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _463 = floor(_453);
    float _465 = -_425;
    float _467 = fma(_457, 2.0, _465);
    float _469 = _405 + _407;
    float _471 = fma(_461, -2.0, _429);
    float _473 = -_145;
    float _475 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[76].x, _467);
    float _477 = _469 + (-1.0);
    float _479 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _471);
    float _481 = floor(_455);
    float _483 = _409 * 2.0;
    if (!_459)
    {
        _439 = _407;
    }
    float _485 = _439;
    float _487 = _485;
    if (_459)
    {
        _487 = _405;
    }
    float _489 = _487;
    float _491 = floor(_483);
    bool _493 = _463 > 0.0;
    bool _495 = _463 >= 0.0;
    bool _497 = isnan(_463);
    bool _499 = _495 || _497;
    bool _501 = isnan(0.0);
    bool _503 = _499 || _501;
    float _505 = _503 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _507 = exp2(_451);
    bool _509 = _481 > 0.0;
    float _511 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _513 = _481 >= 0.0;
    bool _515 = isnan(_481);
    bool _517 = _513 || _515;
    bool _519 = isnan(0.0);
    bool _521 = _517 || _519;
    int _523 = ~as_type<int>(_505);
    int _525 = _523 + 1;
    int _527 = _525 + 1;
    int _529 = _521 ? 0 : 1;
    float _531 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _533 = int(_531);
    bool _535 = _491 >= 0.0;
    bool _537 = isnan(_491);
    bool _539 = _535 || _537;
    bool _541 = isnan(0.0);
    bool _543 = _539 || _541;
    bool _545 = _491 > 0.0;
    int _547 = _527;
    float _549 = _505;
    float _551 = _489;
    if (!_493)
    {
        int _553 = ~as_type<int>(_505);
        int _555 = _553 + 1;
        _547 = _555;
    }
    int _557 = _547;
    int _559 = _543 ? 0 : 1;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_459)
    {
        _549 = _409;
    }
    float _563 = _549;
    int _565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _567 = _565 != 0;
    int _569 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _571 = _569 != 0;
    int _573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _575 = _573 != 0;
    int _577 = ~_529;
    int _579 = _577 + 1;
    int _581 = _579 + 1;
    float _583 = _563;
    int _585 = _581;
    if (_459)
    {
        _583 = _407;
    }
    float _587 = _583;
    if (!_509)
    {
        int _589 = ~_529;
        int _591 = _589 + 1;
        _585 = _591;
    }
    int _593 = _585;
    float _595 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[83].w, _561);
    bool _597 = !_571;
    int _599 = _597 ? 0 : 1;
    bool _601 = !_567;
    int _603 = _601 ? 0 : 1;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _607 = !_575;
    int _609 = _607 ? 0 : 1;
    float _611 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _595);
    int _613 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _615 = _613 != 0;
    int _617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _619 = _617 != 0;
    int _621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _623 = _621 != 0;
    float _625 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[83].z, _605);
    int _627 = ~_559;
    int _629 = _627 + 1;
    int _631 = _629 + 1;
    float _633 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _625);
    int _635 = _631;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_545)
    {
        int _639 = ~_559;
        int _641 = _639 + 1;
        _635 = _641;
    }
    int _643 = _635;
    float _645 = float(_533);
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _649 = !_619;
    int _651 = _649 ? 0 : 1;
    bool _653 = !_615;
    int _655 = _653 ? 0 : 1;
    float _657 = 1.0 / _645;
    if (!_459)
    {
        _551 = _407;
    }
    float _659 = _551;
    float _661 = _659;
    if (!_459)
    {
        _637 = _409;
    }
    float _663 = _637;
    float _665 = _663;
    if (_459)
    {
        _661 = _405;
    }
    float _667 = _661;
    if (_459)
    {
        _665 = _407;
    }
    float _669 = _665;
    int _671 = abs(_651);
    float _673 = _427 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _675 = abs(_655);
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _679 = _667 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _681 = _669 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _683 = float(_557);
    float _685 = _673 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _687 = float(_671);
    float _689 = _673 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _691 = float(_675);
    float _693 = fma(_681, -2.0, _677);
    float _695 = float(_643);
    float _697 = _687 * _683;
    float _699 = float(_433);
    float _701 = fma(_383, (*spvDescriptorSet0.vp_c8)._m0[11].x, _685);
    float _703 = fma(_383, (*spvDescriptorSet0.vp_c8)._m0[10].x, _689);
    float _705 = _691 * _695;
    float _707 = -_647;
    float _709 = fma(_679, 2.0, _707);
    float _711 = in.m_68.x;
    float _713 = in.m_68.y;
    float _715 = in.m_68.z;
    float _717 = fma(_385, (*spvDescriptorSet0.vp_c8)._m0[11].z, _701);
    float _719 = fma(_385, (*spvDescriptorSet0.vp_c8)._m0[10].z, _703);
    float _721 = _657 * _145;
    float _723 = _717 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _725 = _719 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _729 = 1.0 + _727;
    float _731 = 1.0 / _699;
    float _733 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _735 = _449 * _145;
    float _737 = _725 + _723;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _741 = -_145;
    float _743 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[81].x, _709);
    bool _745 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _747 = isnan(1.0);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _753 = _749 || _751;
    float _755 = 1.0 / _729;
    float _757 = -_507;
    float _759 = _757 + 1.0;
    float _761 = _673 + _733;
    float _763 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[78].z, _739);
    float _765 = _705 * (-2.0);
    bool _767 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _769 = isnan(0.0);
    bool _771 = _767 || _769;
    bool _773 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _775 = _771 || _773;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _779 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _763);
    float _781 = 1.0 / _723;
    float _783 = _761 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _785 = fma(_511, _765, _511);
    float _787 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[78].w, _777);
    float _789 = _775 ? _759 : 0.0;
    float _791 = fma(_383, (*spvDescriptorSet0.vp_c15)._m0[126].x, _783);
    float _793 = fma(_765, _711, _711);
    float _795 = _405 + (-0.5);
    bool _797 = !_623;
    int _799 = _797 ? 0 : 1;
    float _801 = _731 * _145;
    float _803 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _787);
    float _805 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _693);
    float _807 = fma(_385, (*spvDescriptorSet0.vp_c15)._m0[126].z, _791);
    float _809 = _761;
    if (_753)
    {
        float _811 = _789 * _755;
        _147 = _811;
    }
    float _813 = _147;
    float _815 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[196].x, _793);
    int _817 = abs(_799);
    float _819 = _737 * _781;
    float _821 = _819 * 0.5;
    float _823 = _409 + _407;
    float _825 = _807 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _827 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _829 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[30].w, _827);
    float _831 = _823 + (-1.0);
    float _833 = fma(_785, _813, _815);
    float _835 = _697 * (-2.0);
    float _837 = float(_593);
    float _839 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _841 = float(_817);
    float _843 = _407 + (-0.5);
    float _845 = fma(_835, _713, _713);
    float _847 = fma(_839, _835, _839);
    float _849 = _409 + _405;
    float _851 = _841 * _837;
    float _853 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[196].y, _845);
    float _855 = in.m_70.x;
    float _857 = in.m_70.y;
    float _859 = _851 * (-2.0);
    float _861 = _849 + (-1.0);
    float _863 = fma(_847, _813, _853);
    float _865 = 1.0 / _829;
    float _867 = fma(_859, _715, _715);
    float _869 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _871 = _409 + (-0.5);
    float _873 = _833 * 0.15915493667125701904296875;
    float _875 = _863 * 0.15915493667125701904296875;
    float _877 = fma(_869, _859, _869);
    float _879 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[196].z, _867);
    float _881 = _873 * 6.283185482025146484375;
    float _883 = sin(_881);
    float _885 = _761 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _887 = fma(_877, _813, _879);
    float _889 = fma(_383, (*spvDescriptorSet0.vp_c15)._m0[127].x, _885);
    float _891 = _887 * 0.15915493667125701904296875;
    float _893 = _873 * 6.283185482025146484375;
    float _895 = cos(_893);
    float _897 = fma(_385, (*spvDescriptorSet0.vp_c15)._m0[127].z, _889);
    float _899 = _331 * _855;
    float _901 = _333 * _857;
    float _903 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _905 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _907 = _875 * 6.283185482025146484375;
    float _909 = sin(_907);
    float _911 = _899 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _913 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _915 = _865 * _913;
    float _917 = _901 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _919 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _921 = _911 * _903;
    float _923 = _897 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _925 = _915 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _927 = _875 * 6.283185482025146484375;
    float _929 = cos(_927);
    bool _931 = _915 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _933 = _917 * _905;
    float _935 = _891 * 6.283185482025146484375;
    float _937 = cos(_935);
    float _939 = _883 * _909;
    float _941 = _895 * _909;
    int _943 = 2;
    if (!_925)
    {
        _943 = 1;
    }
    int _945 = _943;
    float _947 = _891 * 6.283185482025146484375;
    float _949 = sin(_947);
    float _951 = _883 * _929;
    float _953 = _895 * _929;
    float _955 = trunc(_825);
    int _957 = int(_955);
    float _959 = _883 * _937;
    float _961 = _929 * _937;
    float _963 = _895 * _937;
    float _965 = _909 * _937;
    bool _967 = !_925;
    int _969 = _967 ? 0 : 1;
    float _971 = _959 * _933;
    float _973 = trunc(_923);
    int _975 = int(_973);
    int _977 = _945;
    if (!_931)
    {
        _977 = _969;
    }
    int _979 = _977;
    float _981 = -_933;
    float _983 = _949 * _981;
    float _985 = -_941;
    float _987 = fma(_949, _951, _985);
    float _989 = -_951;
    float _991 = fma(_949, _941, _989);
    int _993 = _979 << 6;
    float _995 = fma(_949, _953, _939);
    float _997 = fma(_987, _921, _971);
    int _999 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1001 = _957 + _999;
    int _1003 = _1001 + 1;
    float _1005 = fma(_961, _921, _983);
    int _1007 = _993 + 64;
    uint _1010 = uint(int(uint(_1007) >> uint(2)));
    uint _1012 = uint(int(uint(int(_1010)) >> uint(2)));
    int _1014 = int(_1010) & 3;
    float _1016 = (*spvDescriptorSet0.vp_c15)._m0[int(_1012)][_1014];
    int _1018 = int(_1010) + 1;
    uint _1020 = uint(int(uint(_1018) >> uint(2)));
    int _1022 = _1018 & 3;
    float _1024 = (*spvDescriptorSet0.vp_c15)._m0[int(_1020)][_1022];
    float _1026 = fma(_949, _939, _953);
    bool _1028 = _1003 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1030 = fma(_965, _919, _1005);
    float _1032 = fma(_1026, _919, _997);
    int _1034 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1036 = _975 + _1034;
    int _1038 = _1036 + 1;
    float _1040 = _963 * _933;
    int _1042 = _993 + 96;
    uint _1044 = uint(int(uint(_1042) >> uint(2)));
    uint _1046 = uint(int(uint(int(_1044)) >> uint(2)));
    int _1048 = int(_1044) & 3;
    float _1050 = (*spvDescriptorSet0.vp_c15)._m0[int(_1046)][_1048];
    int _1052 = int(_1044) + 1;
    uint _1054 = uint(int(uint(_1052) >> uint(2)));
    int _1056 = _1052 & 3;
    float _1058 = (*spvDescriptorSet0.vp_c15)._m0[int(_1054)][_1056];
    int _1060 = _1003 | _1038;
    float _1062 = fma(_995, _921, _1040);
    bool _1064 = _1060 < 0;
    bool _1066 = _1064 || _1028;
    float _1068 = fma(_991, _919, _1062);
    int _1070 = _993 + 104;
    uint _1072 = uint(int(uint(_1070) >> uint(2)));
    uint _1074 = uint(int(uint(int(_1072)) >> uint(2)));
    int _1076 = int(_1072) & 3;
    float _1078 = (*spvDescriptorSet0.vp_c15)._m0[int(_1074)][_1076];
    int _1080 = int(_1072) + 1;
    uint _1082 = uint(int(uint(_1080) >> uint(2)));
    int _1084 = _1080 & 3;
    float _1086 = (*spvDescriptorSet0.vp_c15)._m0[int(_1082)][_1084];
    bool _1088 = _1038 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1090 = _1088 || _1066;
    float _1092 = _1068 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1094 = _1068 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1096 = _1068 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1098 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1092);
    int _1100 = _993 + 72;
    uint _1102 = uint(int(uint(_1100) >> uint(2)));
    uint _1104 = uint(int(uint(int(_1102)) >> uint(2)));
    int _1106 = int(_1102) & 3;
    float _1108 = (*spvDescriptorSet0.vp_c15)._m0[int(_1104)][_1106];
    int _1110 = int(_1102) + 1;
    uint _1112 = uint(int(uint(_1110) >> uint(2)));
    int _1114 = _1110 & 3;
    float _1116 = (*spvDescriptorSet0.vp_c15)._m0[int(_1112)][_1114];
    float _1118 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1094);
    float _1120 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1096);
    float _1122 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1098);
    float _1124 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1118);
    float _1126 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1120);
    float _1128 = _1122 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _1130 = _993 + 48;
    uint _1132 = uint(int(uint(_1130) >> uint(2)));
    uint _1134 = uint(int(uint(int(_1132)) >> uint(2)));
    int _1136 = int(_1132) & 3;
    float _1138 = (*spvDescriptorSet0.vp_c15)._m0[int(_1134)][_1136];
    int _1140 = int(_1132) + 1;
    uint _1142 = uint(int(uint(_1140) >> uint(2)));
    int _1144 = _1140 & 3;
    float _1146 = (*spvDescriptorSet0.vp_c15)._m0[int(_1142)][_1144];
    float _1148 = _1124 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _1150 = _1003;
    if (!_1090)
    {
        int _1152 = _1038 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1154 = _1152 + _1003;
        _1150 = _1154;
    }
    int _1156 = _1150;
    float _1158 = _385 + _1128;
    float _1160 = 0.0;
    float _1162 = _1158;
    float _1164 = as_type<float>(_1156);
    if (!_1090)
    {
        float _1166 = floor(_825);
        _1160 = _1166;
    }
    float _1168 = _1160;
    float _1170 = _383 + _1148;
    float _1172 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1174 = _1158 + _1172;
    int _1176 = _993 + 56;
    uint _1178 = uint(int(uint(_1176) >> uint(2)));
    uint _1180 = uint(int(uint(int(_1178)) >> uint(2)));
    int _1182 = int(_1178) & 3;
    float _1184 = (*spvDescriptorSet0.vp_c15)._m0[int(_1180)][_1182];
    int _1186 = int(_1178) + 1;
    uint _1188 = uint(int(uint(_1186) >> uint(2)));
    int _1190 = _1186 & 3;
    float _1192 = (*spvDescriptorSet0.vp_c15)._m0[int(_1188)][_1190];
    float _1194 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1196 = _1170 + _1194;
    int _1198 = 0;
    float _1200 = _1170;
    float _1202 = _1174;
    float _1204 = _1196;
    if (!_1090)
    {
        int _1206 = _1156 << 2;
        _1198 = _1206;
    }
    int _1208 = _1198;
    float _1210 = _1174 * _1174;
    int _1212 = 0;
    int _1214 = _1208;
    if (!_1090)
    {
        uint _1216 = uint(int(uint(_1156) >> uint(2)));
        _1212 = int(_1216);
    }
    int _1218 = _1212;
    int _1220 = _1218;
    if (!_1090)
    {
        int _1222 = 12 & _1208;
        _1214 = _1222;
    }
    int _1224 = _1214;
    float _1226 = fma(_1196, _1196, _1210);
    int _1228 = _993 + 80;
    uint _1230 = uint(int(uint(_1228) >> uint(2)));
    uint _1232 = uint(int(uint(int(_1230)) >> uint(2)));
    int _1234 = int(_1230) & 3;
    float _1236 = (*spvDescriptorSet0.vp_c15)._m0[int(_1232)][_1234];
    int _1238 = int(_1230) + 1;
    uint _1240 = uint(int(uint(_1238) >> uint(2)));
    int _1242 = _1238 & 3;
    float _1244 = (*spvDescriptorSet0.vp_c15)._m0[int(_1240)][_1242];
    float _1246 = _761 * _1024;
    float _1248 = _1226;
    if (!_1090)
    {
        int _1250 = _1218 << 4;
        int _1252 = _1250 + _1224;
        _1220 = _1252;
    }
    int _1254 = _1220;
    float _1256 = sqrt(_1226);
    float _1258 = fma(_383, _1016, _1246);
    float _1260 = _761 * _1058;
    float _1262 = fma(_383, _1050, _1260);
    float _1264 = fma(_385, _1078, _1262);
    bool _1266 = _1256 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1270 = _1268 != 0;
    int _1272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1274 = _1272 != 0;
    int _1276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1278 = _1276 != 0;
    int _1280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1282 = _1280 != 0;
    float _1284 = fma(_385, _1108, _1258);
    float _1286 = _1264 + _1086;
    bool _1288 = !_1274;
    int _1290 = _1288 ? 0 : 1;
    float _1292 = _1284 + _1116;
    bool _1294 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1296 = isnan(0.5);
    bool _1298 = _1294 || _1296;
    bool _1300 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1302 = _1298 || _1300;
    float _1304 = 1.0 / _1286;
    float _1306 = _761 * _1146;
    bool _1308 = !_1278;
    int _1310 = _1308 ? 0 : 1;
    bool _1312 = !_1282;
    int _1314 = _1312 ? 0 : 1;
    float _1316 = fma(_383, _1138, _1306);
    float _1318 = _1126 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1320 = !_1270;
    int _1322 = _1320 ? 0 : 1;
    float _1324 = fma(_385, _1184, _1316);
    float _1326 = _673 + _1318;
    float _1328 = _1324 + _1192;
    float _1330 = _1318;
    float _1332 = _1264;
    float _1334 = as_type<float>(_1254);
    if (!_1266)
    {
        _1330 = _1326;
    }
    float _1336 = _1330;
    bool _1338 = !_1266;
    float _1340 = _1336;
    if (!_1338)
    {
        float _1342 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1344 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1346 = _1256 + _1344;
        float _1348 = _1326 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1350 = rsqrt(_1226);
        float _1352 = _1346 * _1342;
        float _1354 = _1352 * 0.15915493667125701904296875;
        float _1356 = _1354 * 6.283185482025146484375;
        float _1358 = cos(_1356);
        float _1360 = _1354 * 6.283185482025146484375;
        float _1362 = sin(_1360);
        float _1364 = _1358 + (-1.0);
        float _1366 = _1364 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1368 = fma(_1362, _1348, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1370 = fma(_1326, _1358, _1366);
        float _1372 = _1350 * _1368;
        float _1374 = fma(_1196, _1372, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1376 = fma(_1174, _1372, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1200 = _1374;
        _1340 = _1370;
        _1162 = _1376;
        _1332 = _1372;
        _1248 = _1350;
    }
    float _1378 = _1200;
    float _1380 = _1340;
    float _1382 = _1162;
    float _1384 = _1332;
    float _1386 = _1248;
    float _1388 = _1386;
    float _1390 = _1384;
    if (_1302)
    {
        _1202 = _1378;
    }
    float _1392 = _1202;
    float _1394 = _1392;
    if (_1302)
    {
        _1204 = _1380;
    }
    float _1396 = _1204;
    float _1398 = _1396;
    if (_1302)
    {
        _1388 = _1382;
    }
    float _1400 = _1388;
    float _1402 = _1400;
    if (!_1302)
    {
        float _1404 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1406 = _673 + _1404;
        float _1408 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1410 = _383 + _1408;
        float _1412 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1414 = -_383;
        float _1416 = _1414 + _1378;
        float _1418 = _1406 * _1406;
        float _1420 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1422 = _385 + _1420;
        float _1424 = -_673;
        float _1426 = _1424 + _1380;
        float _1428 = -_385;
        float _1430 = _1428 + _1382;
        float _1432 = fma(_1410, _1410, _1418);
        float _1434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1436 = fma(_1422, _1422, _1432);
        float _1438 = sqrt(_1436);
        float _1440 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1442 = precise::min(_1438, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1444 = _1442 * _1434;
        float _1446 = _1440 * _1444;
        float _1448 = fma(_1416, _1446, _383);
        float _1450 = fma(_1426, _1446, _673);
        float _1452 = fma(_1430, _1446, _385);
        _1390 = _1438;
        _1398 = _1450;
        _1394 = _1448;
        _1402 = _1452;
    }
    float _1454 = _1390;
    float _1456 = _1398;
    float _1458 = _1394;
    float _1460 = _1402;
    float _1462 = _1454;
    if (!_1090)
    {
        int _1464 = _1254 + 400;
        uint _1466 = uint(int(uint(_1464) >> uint(2)));
        uint _1468 = uint(int(uint(int(_1466)) >> uint(2)));
        int _1470 = int(_1466) & 3;
        float _1472 = (*spvDescriptorSet0.vp_c15)._m0[int(_1468)][_1470];
        _1462 = _1472;
    }
    float _1474 = _1462;
    float _1476 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1478 = _1328 * _1304;
    float _1480 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1482 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1484 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1476);
    float _1486 = _1292 * _1304;
    float _1488 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1480);
    int _1490 = _993 + 88;
    uint _1492 = uint(int(uint(_1490) >> uint(2)));
    uint _1494 = uint(int(uint(int(_1492)) >> uint(2)));
    int _1496 = int(_1492) & 3;
    float _1498 = (*spvDescriptorSet0.vp_c15)._m0[int(_1494)][_1496];
    int _1500 = int(_1492) + 1;
    uint _1502 = uint(int(uint(_1500) >> uint(2)));
    int _1504 = _1500 & 3;
    float _1506 = (*spvDescriptorSet0.vp_c15)._m0[int(_1502)][_1504];
    float _1508 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1482);
    float _1510 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1484);
    bool _1512 = _1478 >= 0.0;
    float _1514 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1488);
    float _1516 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1518 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1508);
    float _1520 = _1510 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1522 = _1478 <= 1.0;
    bool _1524 = _1522 && _1512;
    float _1526 = _1514 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1528 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1516);
    float _1530 = _1518 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1532 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1534 = _1486 >= 0.0;
    bool _1536 = _1534 && _1524;
    float _1538 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1540 = _1526 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1542 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1528);
    float _1544 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1532);
    bool _1546 = _1486 <= 1.0;
    bool _1548 = _1546 && _1536;
    float _1550 = -_1540;
    float _1552 = fma(_1550, _1538, 1.0);
    float _1554 = _1542 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1556 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1544);
    float _1558 = _1108;
    if (!_1090)
    {
        float _1560 = floor(_923);
        _1558 = _1560;
    }
    float _1562 = _1558;
    float _1564 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1566 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1568 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1556);
    float _1570 = _761 * _1244;
    float _1572 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1566);
    float _1574 = log2(_1552);
    float _1576 = _1568;
    if (_1548)
    {
        float _1578 = float(_979);
        _1334 = _1578;
    }
    float _1580 = _1334;
    float _1582 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1564);
    float _1584 = fma(_383, _1236, _1570);
    float _1586 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1572);
    float _1588 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1582);
    float _1590 = 1.0 / _1568;
    float _1592 = 0.0;
    float _1594 = _1586;
    if (!_1090)
    {
        float _1596 = -_1562;
        float _1598 = _923 + _1596;
        _1592 = _1598;
    }
    float _1600 = _1592;
    float _1602 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1588);
    float _1604 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1586);
    float _1606 = _1604;
    if (!_1090)
    {
        float _1608 = -_1168;
        float _1610 = _825 + _1608;
        _1594 = _1610;
    }
    float _1612 = _1594;
    float _1614 = _1564;
    float _1616 = _1612;
    if (_1548)
    {
        float _1618 = rint(_1580);
        float _1620 = precise::max(_1618, 0.0);
        uint _1622 = uint(_1620);
        uint _1624 = clamp(_1622, 0u, 65535u);
        _1614 = as_type<float>(_1624);
    }
    float _1626 = _1614;
    float _1628 = _1574 * 0.693147182464599609375;
    float _1630 = fma(_385, _1498, _1584);
    float _1632 = _1628 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1634 = _1630 + _1506;
    float _1636 = _1474;
    if (!_1090)
    {
        float _1638 = rint(_1474);
        float _1640 = precise::max(_1638, 0.0);
        uint _1642 = uint(_1640);
        uint _1644 = clamp(_1642, 0u, 65535u);
        _1636 = as_type<float>(_1644);
    }
    float _1646 = _1636;
    float _1648 = _1602 * _1590;
    float _1650 = _1604 * _1590;
    float _1652 = _1634 * _1304;
    float _1654 = fma(_1648, 0.5, 0.5);
    float _1656 = fma(_1650, -0.5, 0.5);
    float _1658 = _1486;
    if (_1548)
    {
        float3 _6751 = float3(_1478, _1486, float(as_type<int>(_1626)));
        float3 _6755 = select(_6751, float3(0.0), isnan(_6751));
        float _1660 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6755.xy, uint(rint(_6755.z)), _1652, level(0.0));
        _1658 = _1660;
    }
    float _1662 = _1658;
    float3 _6765 = float3(_1654, _1656, _1632);
    float _1664 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6765, float3(0.0), isnan(_6765)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6765, float3(0.0), isnan(_6765)), level(0.0)).x;
    float3 _6774 = float3(_1654, _1656, _1632);
    float4 _1667 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6774, float3(0.0), isnan(_6774)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6774, float3(0.0), isnan(_6774)), level(0.0)).xyzw;
    float _1669 = _1667.x;
    float _1671 = _1667.y;
    float _1673 = _1667.z;
    float _1675 = _1667.w;
    float _1677 = _1168;
    if (!_1090)
    {
        float3 _6797 = float3(_1612, _1600, float(as_type<int>(_1646)));
        float3 _6799 = select(_6797, float3(0.0), isnan(_6797));
        float _1679 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6799.xy, uint(rint(_6799.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6799.xy, uint(rint(_6799.z)), level(0.0)).x;
        _1677 = _1679;
    }
    float _1681 = _1677;
    float _1683 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1685 = int(_1683);
    int _1687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1689 = _1687 != 0;
    int _1691 = abs(_603);
    int _1693 = abs(_1290);
    float _1695 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1697 = int(_1695);
    if (_1689)
    {
        _441 = 1.0;
    }
    float _1699 = _441;
    float _1701 = float(uint(_1685));
    float _1703 = trunc(_721);
    int _1705 = int(_1703);
    float _1707 = trunc(_801);
    int _1709 = int(_1707);
    float _1711 = float(uint(_1697));
    int _1713 = ~_1685;
    int _1715 = _1713 + 1;
    float _1717 = _1699;
    if (_1689)
    {
        float _1719 = in.m_66.x;
        _1616 = _1719;
    }
    float _1721 = _1616;
    int _1723 = ~_1697;
    int _1725 = _1723 + 1;
    if (!_1689)
    {
        _1717 = 7.345489978790283203125;
    }
    float _1727 = _1717;
    float _1729 = 1.0 / _1701;
    float _1731 = float(uint(_1705));
    float _1733 = _1721;
    if (!_1689)
    {
        float _1735 = in.m_66.y;
        _1733 = _1735;
    }
    float _1737 = _1733;
    float _1739 = float(_1685);
    float _1741 = _1727 * _405;
    bool _1743 = _1685 == 0;
    float _1745 = 1.0 / _1711;
    int _1747 = as_type<int>(_1729) + (-2);
    float _1749 = float(uint(_1709));
    float _1751 = as_type<float>(_1747) * _1731;
    int _1753 = as_type<int>(_1745) + (-2);
    float _1755 = trunc(_1751);
    float _1757 = precise::max(_1755, 0.0);
    uint _1759 = uint(_1757);
    float _1761 = as_type<float>(_1753) * _1749;
    float _1763 = floor(_1741);
    int _1765 = _1715 * int(_1759);
    int _1767 = _1765 + _1705;
    float _1769 = trunc(_1761);
    float _1771 = precise::max(_1769, 0.0);
    uint _1773 = uint(_1771);
    float _1775 = float(uint(_1767));
    float _1777 = -_1763;
    float _1779 = _1741 + _1777;
    float _1781 = as_type<float>(_1747) * _1775;
    float _1783 = float(_1705);
    bool _1785 = _1783 >= _1739;
    bool _1787 = isnan(_1783);
    bool _1789 = _1785 || _1787;
    bool _1791 = isnan(_1739);
    bool _1793 = _1789 || _1791;
    float _1795 = float(_1793);
    float _1797 = trunc(_1781);
    float _1799 = precise::max(_1797, 0.0);
    uint _1801 = uint(_1799);
    int _1803 = _1725 * int(_1773);
    int _1805 = _1803 + _1709;
    int _1807 = ~_1685;
    int _1809 = _1807 + 1;
    float _1811 = float(uint(_1805));
    float _1813 = trunc(_1795);
    int _1815 = int(_1813);
    float _1817 = as_type<float>(_1753) * _1811;
    int _1819 = int(_1759) + int(_1801);
    float _1821 = trunc(_1817);
    float _1823 = precise::max(_1821, 0.0);
    uint _1825 = uint(_1823);
    float _1827 = as_type<float>(_1759);
    if (_1689)
    {
        _1827 = 1.0;
    }
    float _1829 = _1827;
    float _1831 = _1829;
    if (!_1689)
    {
        _1831 = 1.2345600128173828125;
    }
    float _1833 = _1831;
    int _1835 = _1809 * _1819;
    int _1837 = _1835 + _1705;
    int _1839 = ~_1815;
    int _1841 = _1839 + 1;
    int _1843 = _1841 + 1;
    float _1845 = _1737 * _1833;
    bool _1847 = uint(_1837) >= uint(_1685);
    int _1849 = ~_1697;
    int _1851 = _1849 + 1;
    float _1853 = floor(_1845);
    bool _1855 = !_1847;
    int _1857 = _1855 ? 0 : (-1);
    int _1859 = int(_1773) + int(_1825);
    int _1861 = ~_1819;
    int _1863 = _1861 + _1857;
    int _1865 = _1863 + 1;
    int _1867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1869 = _1867 != 0;
    float _1871 = _1779 * _1739;
    int _1873 = _1685 * _1865;
    int _1875 = _1873 + _1705;
    int _1877 = abs(_599);
    int _1879 = _1851 * _1859;
    int _1881 = _1879 + _1709;
    int _1883 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1885 = _1883 != 0;
    float _1887 = trunc(_1871);
    int _1889 = int(_1887);
    bool _1891 = !_1743;
    int _1893 = _1891 ? _1875 : (-1);
    float _1895 = -_1853;
    float _1897 = _1845 + _1895;
    bool _1899 = uint(_1881) >= uint(_1697);
    bool _1901 = !_1885;
    int _1903 = _1901 ? 0 : 1;
    int _1905 = _1893 * _1843;
    float _1907 = _1739 * _735;
    float _1909 = float(_1697);
    float _1911 = float(_1709);
    int _1913 = _1685 + (-1);
    float _1915 = _1909 * _735;
    int _1917 = abs(_1903);
    float _1919 = trunc(_1907);
    int _1921 = int(_1919);
    bool _1923 = _1911 >= _1909;
    bool _1925 = isnan(_1911);
    bool _1927 = _1923 || _1925;
    bool _1929 = isnan(_1909);
    bool _1931 = _1927 || _1929;
    float _1933 = float(_1931);
    int _1935 = _1815 * _1913;
    int _1937 = _1935 + _1905;
    float _1939 = _1897 * _1909;
    bool _1941 = !_1899;
    int _1943 = _1941 ? 0 : (-1);
    int _1945 = _1889 * _1917;
    int _1947 = _1945 + _1705;
    int _1949 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1951 = _1949 != 0;
    float _1953 = trunc(_1933);
    int _1955 = int(_1953);
    int _1957 = ~_1859;
    int _1959 = _1957 + _1943;
    int _1961 = _1959 + 1;
    int _1963 = _1937 * _1877;
    bool _1965 = !_1869;
    int _1967 = _1965 ? 0 : 1;
    int _1969 = abs(_609);
    bool _1971 = !_1951;
    int _1973 = _1971 ? 0 : 1;
    float _1975 = trunc(_1939);
    int _1977 = int(_1975);
    int _1979 = abs(_1967);
    int _1981 = _1921 * _1691;
    int _1983 = _1981 + _1963;
    int _1985 = _1697 * _1961;
    int _1987 = _1985 + _1709;
    int _1989 = abs(_1973);
    bool _1991 = _1697 == 0;
    int _1993 = _1947 * _1969;
    int _1995 = _1993 + _1983;
    float _1997 = trunc(_1915);
    int _1999 = int(_1997);
    int _2001 = ~_1955;
    int _2003 = _2001 + 1;
    int _2005 = _2003 + 1;
    bool _2007 = !_1991;
    int _2009 = _2007 ? _1987 : (-1);
    int _2011 = _1889 * _1979;
    int _2013 = _2011 + _1995;
    int _2015 = _1977 * _1989;
    int _2017 = _2015 + _1709;
    int _2019 = _1697 + (-1);
    int _2021 = _2009 * _2005;
    float _2023 = float(uint(_2013));
    int _2025 = abs(_1322);
    int _2027 = _1955 * _2019;
    int _2029 = _2027 + _2021;
    float _2031 = as_type<float>(_1747) * _2023;
    int _2033 = abs(_1310);
    int _2035 = _2029 * _1693;
    float _2037 = float(uint(_1947));
    float _2039 = trunc(_2031);
    float _2041 = precise::max(_2039, 0.0);
    uint _2043 = uint(_2041);
    int _2045 = ~_1685;
    int _2047 = _2045 + 1;
    int _2049 = _1999 * _2025;
    int _2051 = _2049 + _2035;
    int _2053 = abs(_1314);
    float _2055 = as_type<float>(_1747) * _2037;
    int _2057 = _2017 * _2033;
    int _2059 = _2057 + _2051;
    int _2061 = ~_1685;
    int _2063 = _2061 + 1;
    float _2065 = trunc(_2055);
    float _2067 = precise::max(_2065, 0.0);
    uint _2069 = uint(_2067);
    int _2071 = _1977 * _2053;
    int _2073 = _2071 + _2059;
    int _2075 = ~_1685;
    int _2077 = _2075 + 1;
    float _2079 = float(uint(_2073));
    int _2081 = _2063 * int(_2043);
    int _2083 = _2081 + _2013;
    float _2085 = as_type<float>(_1753) * _2079;
    float _2087 = float(uint(_2083));
    int _2089 = _2077 * int(_2069);
    int _2091 = _2089 + _1947;
    float _2093 = trunc(_2085);
    float _2095 = precise::max(_2093, 0.0);
    uint _2097 = uint(_2095);
    float _2099 = as_type<float>(_1747) * _2087;
    float _2101 = float(uint(_2091));
    int _2103 = ~_1697;
    int _2105 = _2103 + 1;
    float _2107 = trunc(_2099);
    float _2109 = precise::max(_2107, 0.0);
    uint _2111 = uint(_2109);
    float _2113 = as_type<float>(_1747) * _2101;
    int _2115 = ~_1685;
    int _2117 = _2115 + 1;
    int _2119 = _2105 * int(_2097);
    int _2121 = _2119 + _2073;
    float _2123 = trunc(_2113);
    float _2125 = precise::max(_2123, 0.0);
    uint _2127 = uint(_2125);
    float _2129 = float(uint(_2121));
    int _2131 = int(_2043) + int(_2111);
    float _2133 = as_type<float>(_1753) * _2129;
    int _2135 = _2117 * _2131;
    int _2137 = _2135 + _2013;
    float _2139 = trunc(_2133);
    float _2141 = precise::max(_2139, 0.0);
    uint _2143 = uint(_2141);
    int _2145 = int(_2069) + int(_2127);
    bool _2147 = uint(_2137) >= uint(_1685);
    bool _2149 = !_2147;
    int _2151 = _2149 ? 0 : (-1);
    int _2153 = _2047 * _2145;
    int _2155 = _2153 + _1947;
    int _2157 = ~_2131;
    int _2159 = _2157 + _2151;
    int _2161 = _2159 + 1;
    float _2163 = as_type<float>(_2131);
    float _2165 = as_type<float>(_1983);
    if (_1090)
    {
        _2163 = 1.0;
    }
    float _2167 = _2163;
    bool _2169 = uint(_2155) >= uint(_1685);
    int _2171 = _1685 * _2161;
    int _2173 = _2171 + _2013;
    int _2175 = int(_2097) + int(_2143);
    float _2177 = _2167;
    if (!_1090)
    {
        int _2179 = _1156 << 4;
        int _2181 = _2179 + 2048;
        uint _2183 = uint(int(uint(_2181) >> uint(2)));
        uint _2185 = uint(int(uint(int(_2183)) >> uint(2)));
        int _2187 = int(_2183) & 3;
        float _2189 = (*spvDescriptorSet0.vp_c15)._m0[int(_2185)][_2187];
        int _2191 = int(_2183) + 1;
        uint _2193 = uint(int(uint(_2191) >> uint(2)));
        int _2195 = _2191 & 3;
        float _2197 = (*spvDescriptorSet0.vp_c15)._m0[int(_2193)][_2195];
        int _2199 = _2181 + 8;
        uint _2201 = uint(int(uint(_2199) >> uint(2)));
        uint _2203 = uint(int(uint(int(_2201)) >> uint(2)));
        int _2205 = int(_2201) & 3;
        float _2207 = (*spvDescriptorSet0.vp_c15)._m0[int(_2203)][_2205];
        int _2209 = int(_2201) + 1;
        uint _2211 = uint(int(uint(_2209) >> uint(2)));
        int _2213 = _2209 & 3;
        float _2215 = (*spvDescriptorSet0.vp_c15)._m0[int(_2211)][_2213];
        float _2217 = _761 * _2197;
        float _2219 = fma(_383, _2189, _2217);
        float _2221 = fma(_385, _2207, _2219);
        float _2223 = _2221 + _2215;
        float _2225 = precise::clamp(_2223, 0.0, 1.0);
        float _2227 = -_2225;
        float _2229 = _2227 + _1681;
        float _2231 = fma(_2229, 500.0, 1.5);
        float _2233 = exp2(_2231);
        float _2235 = 0.0 + _2233;
        float _2237 = precise::clamp(_2235, 0.0, 1.0);
        _1164 = as_type<float>(_2181);
        _2177 = _2237;
    }
    float _2239 = _1164;
    float _2241 = _2177;
    float _2243 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2245 = _1456 + _2243;
    float _2247 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2249 = _1458 + _2247;
    float _2251 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2253 = _1460 + _2251;
    float _2255 = _2245 * _2245;
    float _2257 = fma(_2249, _2249, _2255);
    float _2259 = fma(_2253, _2253, _2257);
    float _2261 = rsqrt(_2259);
    float _2263 = sqrt(_2259);
    float _2265 = _2261 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2267 = _2249 * _2265;
    float _2269 = _2253 * _2265;
    float _2271 = _2267 * _2267;
    float _2273 = _2269 * _2269;
    float _2275 = _2271 + _2273;
    float _2277 = sqrt(_2275);
    bool _2279 = _2277 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2281 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2283 = _2277 + _2281;
    float _2285 = _2261;
    float _2287 = _2283;
    float _2289 = _2239;
    float _2291 = _2245;
    if (_2279)
    {
        float _2293 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2285 = _2293;
    }
    float _2295 = _2285;
    if (_2279)
    {
        float _2297 = rsqrt(_2275);
        _809 = _2297;
    }
    float _2299 = _809;
    float _2301 = _2299;
    if (_2279)
    {
        float _2303 = _2283 * _2295;
        _2287 = _2303;
    }
    float _2305 = _2287;
    if (_2279)
    {
        float _2307 = _2305 * 0.15915493667125701904296875;
        _2289 = _2307;
    }
    float _2309 = _2289;
    float _2311 = _2253;
    float _2313 = _2309;
    if (_2279)
    {
        float _2315 = _2309 * 6.283185482025146484375;
        float _2317 = sin(_2315);
        _2311 = _2317;
    }
    float _2319 = _2311;
    float _2321 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2323 = precise::max(0.0, _2321);
    float _2325 = _2295;
    float _2327 = _2323;
    if (_2279)
    {
        float _2329 = _2309 * 6.283185482025146484375;
        float _2331 = cos(_2329);
        _2325 = _2331;
    }
    float _2333 = _2325;
    float _2335 = -_2265;
    float _2337 = -_2323;
    float _2339 = fma(_2245, _2335, _2337);
    if (_2279)
    {
        float _2341 = _2339 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2291 = _2341;
    }
    float _2343 = _2291;
    float _2345 = _2343;
    float _2347 = _2319;
    if (_2279)
    {
        float _2349 = fma(_2319, _2343, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2345 = _2349;
    }
    float _2351 = _2345;
    float _2353 = _2351;
    if (!_2279)
    {
        _2347 = _2267;
    }
    float _2355 = _2347;
    float _2357 = _2355;
    float _2359 = _2333;
    if (_2279)
    {
        float _2361 = _2333 + (-1.0);
        _2327 = _2361;
    }
    float _2363 = _2327;
    float _2365 = _2363;
    if (_2279)
    {
        float _2367 = _2299 * _2351;
        _2165 = _2367;
    }
    float _2369 = _2165;
    if (!_2279)
    {
        _2353 = _2339;
    }
    float _2371 = _2353;
    float _2373 = _2371;
    if (_2279)
    {
        float _2375 = _2363 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2313 = _2375;
    }
    float _2377 = _2313;
    if (_2279)
    {
        float _2379 = _2267 * _2369;
        _2357 = _2379;
    }
    float _2381 = _2357;
    if (!_2279)
    {
        _2365 = _2269;
    }
    float _2383 = _2365;
    float _2385 = _2383;
    if (_2279)
    {
        float _2387 = _2269 * _2369;
        _2385 = _2387;
    }
    float _2389 = _2385;
    if (!_2279)
    {
        _2301 = _2271;
    }
    float _2391 = _2301;
    float _2393 = _2391;
    if (_2279)
    {
        float _2395 = fma(_2339, _2333, _2377);
        _2373 = _2395;
    }
    float _2397 = _2373;
    if (_2279)
    {
        float _2399 = _2381 * _2381;
        _2393 = _2399;
    }
    float _2401 = _2393;
    if (!_2279)
    {
        _2359 = _2273;
    }
    float _2403 = _2359;
    float _2405 = _2403;
    if (_2279)
    {
        float _2407 = _2389 * _2389;
        _2405 = _2407;
    }
    float _2409 = _2405;
    float _2411 = fma(_2397, _2397, _2401);
    float _2413 = float(uint(_2017));
    int _2415 = ~_1697;
    int _2417 = _2415 + 1;
    float _2419 = _2411 + _2409;
    float _2421 = rsqrt(_2419);
    float _2423 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2425 = fma(_2263, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2423);
    float _2427 = precise::clamp(_2425, 0.0, 1.0);
    float _2429 = -_2427;
    float _2431 = _2429 + 1.0;
    float _2433 = abs(_2431);
    float _2435 = log2(_2433);
    float _2437 = _2421 * _2381;
    float _2439 = _2421 * _2397;
    float _2441 = _2421 * _2389;
    float _2443 = _2437 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2445 = -_2443;
    float _2447 = fma(_2439, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2445);
    float _2449 = -_2441;
    float _2451 = fma(_2449, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2447);
    float _2453 = _2435 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2455 = fma(_2451, -0.5, 0.5);
    float _2457 = fma(_2451, 0.5, 0.5);
    float _2459 = exp2(_2453);
    float _2461 = fma(_2457, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2463 = as_type<float>(_1753) * _2413;
    float _2465 = fma(_2457, _2461, -0.212114393711090087890625);
    float _2467 = sqrt(_2455);
    float _2469 = fma(_2457, _2465, 1.570728778839111328125);
    int _2471 = ~_1697;
    int _2473 = _2471 + 1;
    float _2475 = trunc(_2463);
    float _2477 = precise::max(_2475, 0.0);
    uint _2479 = uint(_2477);
    float _2481 = _2439 + 1.0;
    float _2483 = -_2439;
    float _2485 = fma(_2459, _2481, _2483);
    float _2487 = _2467 * 0.636619746685028076171875;
    float _2489 = fma(_2485, 0.5, 0.5);
    float _2491 = -_2469;
    float _2493 = fma(_2487, _2491, 1.0);
    float2 _7950 = float2(_2493, _2489);
    float3 _2497 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7950, float2(0.0), isnan(_7950)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7950, float2(0.0), isnan(_7950)), level(0.0)).xyz;
    float _2499 = _2497.x;
    float _2501 = _2497.y;
    float _2503 = _2497.z;
    bool _2505 = !_1743;
    int _2507 = _2505 ? _2173 : (-1);
    int _2509 = _2473 * _2175;
    int _2511 = _2509 + _2073;
    bool _2513 = !_2169;
    int _2515 = _2513 ? 0 : (-1);
    int _2517 = _2417 * int(_2479);
    int _2519 = _2517 + _2017;
    int _2521 = _2507 & 3;
    bool _2523 = _2521 != 0;
    float _2525 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2527 = _363 + _2525;
    bool _2529 = uint(_2511) >= uint(_1697);
    float _2531 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2533 = _363 + _2531;
    int _2535 = _2507 & 3;
    bool _2537 = _2535 != 0;
    out.m_72.x = _383;
    out.m_72.y = _673;
    out.m_72.z = _385;
    bool _2539 = uint(_2521) >= 2u;
    float _2541 = _2435 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2543 = !_2529;
    int _2545 = _2543 ? 0 : (-1);
    float _2547 = -_803;
    float _2549 = _2547 + 1.0;
    int _2551 = ~_2145;
    int _2553 = _2551 + _2515;
    int _2555 = _2553 + 1;
    float _2557 = -_633;
    float _2559 = _2557 + 1.0;
    int _2561 = _2537 ? 0 : 1;
    float _2563 = exp2(_2541);
    int _2565 = _2539 ? 0 : 1;
    int _2567 = _1685 * _2555;
    int _2569 = _2567 + _1947;
    bool _2571 = uint(_2521) > 1u;
    float _2573 = -_611;
    float _2575 = _2573 + 1.0;
    bool _2577 = _2521 != 3;
    float _2579 = -_403;
    float _2581 = _2579 + 1.0;
    int _2583 = ~_2175;
    int _2585 = _2583 + _2545;
    int _2587 = _2585 + 1;
    float _2589 = float(uint(_2519));
    bool _2591 = _411 > 0.5;
    int _2593 = _1697 * _2587;
    int _2595 = _2593 + _2073;
    int _2597 = ~_2561;
    int _2599 = _2597 + 1;
    int _2601 = _2599 + 1;
    float _2603 = as_type<float>(_1753) * _2589;
    int _2605 = ~_2565;
    int _2607 = _2605 + 1;
    int _2609 = _2607 + 1;
    float _2611 = -_2563;
    float _2613 = _2611 + 1.0;
    bool _2615 = !_1991;
    int _2617 = _2615 ? _2595 : (-1);
    float _2619 = trunc(_2603);
    float _2621 = precise::max(_2619, 0.0);
    uint _2623 = uint(_2621);
    int _2625 = _2601;
    int _2627 = _2609;
    if (!_2571)
    {
        int _2629 = ~_2561;
        int _2631 = _2629 + 1;
        _2625 = _2631;
    }
    int _2633 = _2625;
    float _2635 = _2613 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_2577)
    {
        int _2637 = ~_2565;
        int _2639 = _2637 + 1;
        _2627 = _2639;
    }
    int _2641 = _2627;
    int _2643 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2645 = _2643 != 0;
    float _2647 = _2635 * _1664;
    float _2649 = -_185;
    int _2651 = _2591 ? as_type<int>(_2649) : as_type<int>(_185);
    int _2653 = _2617 & 3;
    bool _2655 = _2653 != 0;
    bool _2657 = !_2645;
    int _2659 = _2657 ? 0 : 1;
    bool _2661 = uint(_2653) > 1u;
    bool _2663 = !_1743;
    int _2665 = _2663 ? _2569 : (-1);
    int _2667 = _2617 & 3;
    bool _2669 = _2667 != 0;
    bool _2671 = !_2655;
    int _2673 = _2671 ? 0 : 1;
    int _2675 = _2669 ? 0 : 1;
    bool _2677 = _2521 != 3;
    int _2679 = ~_2675;
    int _2681 = _2679 + 1;
    int _2683 = _2681 + 1;
    float _2685 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2687 = _2685 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _2689 = _2683;
    if (!_2661)
    {
        int _2691 = ~_2675;
        int _2693 = _2691 + 1;
        _2689 = _2693;
    }
    int _2695 = _2689;
    bool _2697 = !_2677;
    int _2699 = _2697 ? 0 : (-1);
    float _2701 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2703 = _2701 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2705 = 1.0 / _2687;
    bool _2707 = _2653 != 3;
    int _2709 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2711 = _2709 != 0;
    float _2713 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2715 = _2713 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2717 = ~_1697;
    int _2719 = _2717 + 1;
    bool _2721 = uint(_2653) >= 2u;
    float _2723 = 1.0 / _2703;
    int _2725 = int(_2479) + int(_2623);
    int _2727 = _2719 * _2725;
    int _2729 = _2727 + _2017;
    bool _2731 = !_2523;
    int _2733 = _2731 ? 0 : 1;
    bool _2735 = !_2711;
    int _2737 = _2735 ? 0 : 1;
    float _2739 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2741 = _2739 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _2743 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2745 = _2743 != 0;
    int _2747 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2749 = _2747 != 0;
    float _2751 = 1.0 / _2741;
    int _2753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2755 = _2753 != 0;
    int _2757 = _2721 ? 0 : 1;
    bool _2759 = _2653 != 3;
    int _2761 = ~_2757;
    int _2763 = _2761 + 1;
    int _2765 = _2763 + 1;
    float _2767 = 1.0 / _2715;
    int _2769 = _2765;
    if (_2707)
    {
        int _2771 = ~_2757;
        int _2773 = _2771 + 1;
        _2769 = _2773;
    }
    int _2775 = _2769;
    bool _2777 = uint(_2729) >= uint(_1697);
    float _2779 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2781 = _2779 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2783 = !_2759;
    int _2785 = _2783 ? 0 : (-1);
    bool _2787 = _405 > 0.5;
    float _2789 = 1.0 / _2781;
    float _2791 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2793 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2791;
    float _2795 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2797 = _2795 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _2799 = _2617 >> 31;
    float _2801 = _2793 * _2723;
    bool _2803 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2805 = isnan(_363);
    bool _2807 = _2803 || _2805;
    bool _2809 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2811 = _2807 || _2809;
    float _2813 = float(_2811);
    float _2815 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2817 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2815;
    bool _2819 = !_2777;
    int _2821 = _2819 ? 0 : (-1);
    float _2823 = fma(_2801, _2533, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    int _2825 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2827 = _2825 != 0;
    float _2829 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2831 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2829;
    float _2833 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2835 = _2833 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2837 = _2817 * _2751;
    int _2839 = _2799 & 3;
    float _2841 = _2831 * _2705;
    float _2843 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2845 = _363 + _2843;
    float _2847 = _2835 * _2767;
    float _2849 = _2797 * _2789;
    float _2851 = -_2813;
    float _2853 = _2851 + 1.0;
    float _2855 = fma(_2841, _2845, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2857 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2859 = isnan(_363);
    bool _2861 = _2857 || _2859;
    bool _2863 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2865 = _2861 || _2863;
    float _2867 = float(_2865);
    float _2869 = fma(_2847, _2527, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _2871 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2873 = isnan(_363);
    bool _2875 = _2871 || _2873;
    bool _2877 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2879 = _2875 || _2877;
    float _2881 = float(_2879);
    float _2883 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2885 = _363 + _2883;
    int _2887 = _2507 >> 31;
    float _2889 = _2867 * _2853;
    float _2891 = -_2867;
    float _2893 = _2891 + 1.0;
    bool _2895 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2897 = isnan(_363);
    bool _2899 = _2895 || _2897;
    bool _2901 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2903 = _2899 || _2901;
    float _2905 = float(_2903);
    float _2907 = fma(_2849, _2885, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    int _2909 = _2887 & 3;
    float _2911 = -_2881;
    float _2913 = _2911 + 1.0;
    float _2915 = _2881 * _2893;
    bool _2917 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2919 = isnan(_363);
    bool _2921 = _2917 || _2919;
    bool _2923 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2925 = _2921 || _2923;
    float _2927 = float(_2925);
    float _2929 = -_2905;
    float _2931 = _2929 + 1.0;
    float _2933 = _2905 * _2913;
    int _2935 = _2617 + _2839;
    float _2937 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2939 = _2937 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    int _2941 = _2507 + _2909;
    float _2943 = _2927 * _2931;
    bool _2945 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2947 = isnan(_363);
    bool _2949 = _2945 || _2947;
    bool _2951 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2953 = _2949 || _2951;
    float _2955 = float(_2953);
    float _2957 = -_2927;
    float _2959 = _2957 + 1.0;
    bool _2961 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2963 = isnan(_363);
    bool _2965 = _2961 || _2963;
    bool _2967 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2969 = _2965 || _2967;
    float _2971 = float(_2969);
    float _2973 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2975 = _363 + _2973;
    int _2977 = _2941 >> 2;
    float _2979 = -_2955;
    float _2981 = _2979 + 1.0;
    int _2983 = _2935 >> 2;
    float _2985 = _2955 * _2959;
    int _2987 = _2977 << 4;
    int _2989 = _2987 + 368;
    float _2991 = _2971 * _2981;
    int _2993 = _2983 << 4;
    int _2995 = _2993 + 512;
    uint _2997 = uint(int(uint(_2989) >> uint(2)));
    uint _2999 = uint(int(uint(int(_2997)) >> uint(2)));
    int _3001 = int(_2997) & 3;
    float _3003 = (*spvDescriptorSet0.vp_c9)._m0[int(_2999)][_3001];
    int _3005 = int(_2997) + 1;
    uint _3007 = uint(int(uint(_3005) >> uint(2)));
    int _3009 = _3005 & 3;
    float _3011 = (*spvDescriptorSet0.vp_c9)._m0[int(_3007)][_3009];
    float _3013 = _2855 * _2991;
    float _3015 = -_2971;
    float _3017 = _3015 + 1.0;
    float _3019 = fma(_3017, (*spvDescriptorSet0.vp_c9)._m0[159].x, _3013);
    uint _3021 = uint(int(uint(_2995) >> uint(2)));
    uint _3023 = uint(int(uint(int(_3021)) >> uint(2)));
    int _3025 = int(_3021) & 3;
    float _3027 = (*spvDescriptorSet0.vp_c9)._m0[int(_3023)][_3025];
    int _3029 = int(_3021) + 1;
    uint _3031 = uint(int(uint(_3029) >> uint(2)));
    int _3033 = _3029 & 3;
    float _3035 = (*spvDescriptorSet0.vp_c9)._m0[int(_3031)][_3033];
    float _3037 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3039 = _3037 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3041 = fma(_2869, _2985, _3019);
    float _3043 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3045 = _3043 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _3047 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3049 = _363 + _3047;
    int _3051 = abs(_2695);
    float _3053 = fma(_2823, _2943, _3041);
    int _3055 = ~_2725;
    int _3057 = _3055 + _2821;
    int _3059 = _3057 + 1;
    float _3061 = 1.0 / _3039;
    int _3063 = _2989 + 8;
    uint _3065 = uint(int(uint(_3063) >> uint(2)));
    uint _3067 = uint(int(uint(int(_3065)) >> uint(2)));
    int _3069 = int(_3065) & 3;
    float _3071 = (*spvDescriptorSet0.vp_c9)._m0[int(_3067)][_3069];
    int _3073 = int(_3065) + 1;
    uint _3075 = uint(int(uint(_3073) >> uint(2)));
    int _3077 = _3073 & 3;
    float _3079 = (*spvDescriptorSet0.vp_c9)._m0[int(_3075)][_3077];
    float _3081 = fma(_2837, _3049, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _3083 = fma(_2907, _2933, _3053);
    int _3085 = _1697 * _3059;
    int _3087 = _3085 + _2017;
    bool _3089 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _3091 = isnan(_363);
    bool _3093 = _3089 || _3091;
    bool _3095 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _3097 = _3093 || _3095;
    float _3099 = float(_3097);
    float _3101 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3103 = _363 + _3101;
    float _3105 = fma(_3081, _2915, _3083);
    float _3107 = 1.0 / _3045;
    int _3109 = _2995 + 8;
    uint _3111 = uint(int(uint(_3109) >> uint(2)));
    uint _3113 = uint(int(uint(int(_3111)) >> uint(2)));
    int _3115 = int(_3111) & 3;
    float _3117 = (*spvDescriptorSet0.vp_c9)._m0[int(_3113)][_3115];
    int _3119 = int(_3111) + 1;
    uint _3121 = uint(int(uint(_3119) >> uint(2)));
    int _3123 = _3119 & 3;
    float _3125 = (*spvDescriptorSet0.vp_c9)._m0[int(_3121)][_3123];
    bool _3127 = !_1991;
    int _3129 = _3127 ? _3087 : (-1);
    bool _3131 = _407 > 0.5;
    int _3133 = abs(_2633);
    float _3135 = _2939 * _3061;
    float _3137 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3139 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _3137;
    float _3141 = -_181;
    int _3143 = _2787 ? as_type<int>(_3141) : as_type<int>(_181);
    bool _3145 = _409 > 0.5;
    float _3147 = fma(_3135, _2975, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _3149 = ~_3133;
    int _3151 = _3149 + 1;
    int _3153 = _3151 + 1;
    float _3155 = -_3099;
    float _3157 = _3155 + 1.0;
    float _3159 = _3139 * _3107;
    int _3161 = abs(_2733);
    float _3163 = fma(_3147, _2889, _3105);
    int _3165 = ~_3051;
    int _3167 = _3165 + 1;
    int _3169 = _3167 + 1;
    float _3171 = fma(_3159, _3103, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _3173 = abs(_2673);
    float _3175 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3177 = int(_3175);
    int _3179 = _3153 * as_type<int>(_3011);
    int _3181 = abs(_2775);
    float _3183 = _2813 * _3157;
    int _3185 = ~_3161;
    int _3187 = _3185 + 1;
    int _3189 = _3187 + 1;
    int _3191 = abs(_2641);
    float _3193 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3195 = int(_3193);
    int _3197 = abs(_2699);
    int _3199 = _3169 * as_type<int>(_3035);
    int _3201 = _3189 * as_type<int>(_3003);
    int _3203 = _3201 + _3179;
    float _3205 = _995 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3207 = ~_3173;
    int _3209 = _3207 + 1;
    int _3211 = _3209 + 1;
    float _3213 = abs(_915);
    float _3215 = log2(_3213);
    float _3217 = float(uint(_3177));
    float _3219 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3205);
    int _3221 = ~_3191;
    int _3223 = _3221 + 1;
    int _3225 = _3223 + 1;
    int _3227 = _3211 * as_type<int>(_3027);
    int _3229 = _3227 + _3199;
    int _3231 = ~_3181;
    int _3233 = _3231 + 1;
    int _3235 = _3233 + 1;
    float _3237 = fma(_3171, _3183, _3163);
    int _3239 = ~_3197;
    int _3241 = _3239 + 1;
    int _3243 = _3241 + 1;
    int _3245 = _3225 * as_type<int>(_3071);
    int _3247 = _3245 + _3203;
    float _3249 = 1.0 / _3217;
    float _3251 = float(uint(_3195));
    int _3253 = _3235 * as_type<int>(_3117);
    int _3255 = _3253 + _3229;
    int _3257 = abs(_2659);
    int _3259 = _3243 * as_type<int>(_3079);
    int _3261 = _3259 + _3247;
    int _3263 = abs(_2785);
    float _3265 = fma(_3099, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3237);
    int _3267 = ~_3257;
    int _3269 = _3267 + 1;
    int _3271 = _3269 + 1;
    float _3273 = 1.0 / _3251;
    int _3275 = abs(_3177);
    float _3277 = _3215 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _3279 = abs(_2737);
    int _3281 = _3261 * _3271;
    int _3283 = ~_3263;
    int _3285 = _3283 + 1;
    int _3287 = _3285 + 1;
    float _3289 = _963 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3291 = abs(_3195);
    int _3293 = _2665 * _3257;
    int _3295 = _3293 + _3281;
    float _3297 = float(uint(_3275));
    int _3299 = _3287 * as_type<int>(_3125);
    int _3301 = _3299 + _3255;
    int _3303 = ~_3279;
    int _3305 = _3303 + 1;
    int _3307 = _3305 + 1;
    float _3309 = _963 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3311 = float(uint(_3291));
    float _3313 = _963 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3315 = 1.0 / _3297;
    int _3317 = _3301 * _3307;
    int _3319 = as_type<int>(_3249) + (-2);
    float _3321 = -_949;
    float _3323 = fma(_3321, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3289);
    float _3325 = float(uint(_3295));
    float _3327 = -_949;
    float _3329 = fma(_3327, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3309);
    float _3331 = -_949;
    float _3333 = fma(_3331, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3313);
    int _3335 = _3129 * _3279;
    int _3337 = _3335 + _3317;
    float _3339 = 1.0 / _3311;
    float _3341 = as_type<float>(_3319) * _3325;
    int _3343 = as_type<int>(_3273) + (-2);
    out.m_74.x = _3265;
    float _3345 = float(uint(_3337));
    int _3347 = abs(_3295);
    float _3349 = exp2(_3277);
    float _3351 = as_type<float>(_3343) * _3345;
    int _3353 = abs(_3337);
    int _3355 = as_type<int>(_3315) + (-2);
    float _3357 = trunc(_3341);
    float _3359 = precise::max(_3357, 0.0);
    uint _3361 = uint(_3359);
    float _3363 = float(uint(_3347));
    int _3365 = as_type<int>(_3339) + (-2);
    float _3367 = as_type<float>(_3355) * _3363;
    int _3369 = ~_3177;
    int _3371 = _3369 + 1;
    float _3373 = fma(_3349, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3375 = precise::clamp(_3373, 0.0, 1.0);
    float _3377 = float(uint(_3353));
    float _3379 = trunc(_3351);
    float _3381 = precise::max(_3379, 0.0);
    uint _3383 = uint(_3381);
    float _3385 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3323);
    float _3387 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3329);
    float _3389 = _995 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3391 = as_type<float>(_3365) * _3377;
    float _3393 = _995 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3395 = _3371 * int(_3361);
    int _3397 = _3395 + _3295;
    float _3399 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3389);
    float _3401 = trunc(_3367);
    float _3403 = precise::max(_3401, 0.0);
    uint _3405 = uint(_3403);
    float _3407 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3393);
    int _3409 = ~_3275;
    int _3411 = _3409 + 1;
    float _3413 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3333);
    float _3415 = float(uint(_3397));
    int _3417 = ~_3195;
    int _3419 = _3417 + 1;
    float _3421 = trunc(_3391);
    float _3423 = precise::max(_3421, 0.0);
    uint _3425 = uint(_3423);
    float _3427 = as_type<float>(_3319) * _3415;
    int _3429 = _3419 * int(_3383);
    int _3431 = _3429 + _3337;
    int _3433 = ~_3291;
    int _3435 = _3433 + 1;
    float _3437 = _991 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _3439 = !_2745;
    float _3441 = _3439 ? _185 : as_type<float>(_2651);
    int _3443 = _3411 * int(_3405);
    int _3445 = _3443 + _3347;
    float _3447 = float(uint(_3431));
    float _3449 = _991 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3451 = trunc(_3427);
    float _3453 = precise::max(_3451, 0.0);
    uint _3455 = uint(_3453);
    float _3457 = _991 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3459 = float(uint(_3445));
    float _3461 = as_type<float>(_3343) * _3447;
    float _3463 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3399);
    int _3465 = _3435 * int(_3425);
    int _3467 = _3465 + _3353;
    float _3469 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3449);
    float _3471 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3437);
    float _3473 = trunc(_3461);
    float _3475 = precise::max(_3473, 0.0);
    uint _3477 = uint(_3475);
    float _3479 = -_185;
    int _3481 = _3131 ? as_type<int>(_3479) : as_type<int>(_185);
    float _3483 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3457);
    float _3485 = float(uint(_3467));
    float _3487 = as_type<float>(_3355) * _3459;
    float _3489 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3407);
    float _3491 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3219);
    float _3493 = as_type<float>(_3365) * _3485;
    bool _3495 = !_2749;
    float _3497 = _3495 ? _185 : as_type<float>(_3481);
    float _3499 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3501 = fma(_3375, -2.0, 3.0);
    float _3503 = trunc(_3493);
    float _3505 = precise::max(_3503, 0.0);
    uint _3507 = uint(_3505);
    float _3509 = _3375 * _3375;
    float _3511 = -_181;
    int _3513 = _3145 ? as_type<int>(_3511) : as_type<int>(_181);
    float _3515 = _3499 * _3385;
    bool _3517 = !_2827;
    float _3519 = _3517 ? _181 : as_type<float>(_3143);
    float _3521 = _3509 * _3501;
    bool _3523 = !_2755;
    float _3525 = _3523 ? _181 : as_type<float>(_3513);
    float _3527 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3529 = trunc(_3487);
    float _3531 = precise::max(_3529, 0.0);
    uint _3533 = uint(_3531);
    int _3535 = ~_3177;
    int _3537 = _3535 + 1;
    float _3539 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3469);
    float _3541 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3471);
    float _3543 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3483);
    int _3545 = int(_3361) + int(_3455);
    float _3547 = fma(_3527, _3463, _3515);
    int _3549 = ~_3195;
    int _3551 = _3549 + 1;
    out.m_76.x = _3463;
    out.m_76.y = _3491;
    out.m_76.z = _3489;
    int _3553 = int(_3383) + int(_3477);
    int _3555 = ~_3291;
    int _3557 = _3555 + 1;
    int _3559 = int(_3425) + int(_3507);
    int _3561 = _3537 * _3545;
    int _3563 = _3561 + _3295;
    int _3565 = int(_3405) + int(_3533);
    int _3567 = ~_3275;
    int _3569 = _3567 + 1;
    int _3571 = _3551 * _3553;
    int _3573 = _3571 + _3337;
    bool _3575 = uint(_3563) >= uint(_3177);
    int _3577 = _3569 * _3565;
    int _3579 = _3577 + _3347;
    bool _3581 = uint(_3573) >= uint(_3195);
    int _3583 = _3557 * _3559;
    int _3585 = _3583 + _3353;
    float _3587 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3589 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3591 = !_3575;
    int _3593 = _3591 ? 0 : (-1);
    bool _3595 = !_3581;
    int _3597 = _3595 ? 0 : (-1);
    float _3599 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3587);
    bool _3601 = uint(_3585) >= uint(_3291);
    bool _3603 = uint(_3579) >= uint(_3275);
    float _3605 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3607 = _3295 ^ _3177;
    float _3609 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3599);
    int _3611 = ~_3545;
    int _3613 = _3611 + _3593;
    int _3615 = _3613 + 1;
    float _3617 = _2503 * _2647;
    bool _3619 = !_3603;
    int _3621 = _3619 ? 0 : (-1);
    float _3623 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3609);
    uint _3625 = uint(int(uint(_3607) >> uint(31)));
    int _3627 = _3177 * _3615;
    int _3629 = _3627 + _3295;
    int _3631 = ~_3553;
    int _3633 = _3631 + _3597;
    int _3635 = _3633 + 1;
    float _3637 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3639 = ~_3621;
    int _3641 = _3565 + _3639;
    int _3643 = _3641 + 1;
    float _3645 = _3539 + _3547;
    int _3647 = ~int(_3625);
    int _3649 = _3647 + 1;
    int _3651 = _3337 ^ _3195;
    int _3653 = _3195 * _3635;
    int _3655 = _3653 + _3337;
    bool _3657 = _3177 == 0;
    bool _3659 = !_3601;
    int _3661 = _3659 ? 0 : (-1);
    bool _3663 = _3195 == 0;
    bool _3665 = _3195 == 0;
    float _3667 = _3589 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3669 = _3643 ^ _3649;
    float _3671 = fma(_3499, _3499, 1.0);
    uint _3673 = uint(int(uint(_3651) >> uint(31)));
    float _3675 = _3637 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3677 = !_3657;
    int _3679 = _3677 ? _3629 : (-1);
    int _3681 = ~_3661;
    int _3683 = _3559 + _3681;
    int _3685 = _3683 + 1;
    bool _3687 = _3177 == 0;
    int _3689 = ~int(_3673);
    int _3691 = _3689 + 1;
    float _3693 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3695 = ~_3649;
    int _3697 = _3695 + _3669;
    int _3699 = _3697 + 1;
    bool _3701 = !_3663;
    int _3703 = _3701 ? _3655 : (-1);
    float _3705 = float(_3679);
    int _3707 = _3685 ^ _3691;
    float _3709 = rsqrt(_3671);
    float _3711 = float(_3703);
    float _3713 = fma(_3667, _3705, _475);
    float _3715 = _3519 + 0.5;
    int _3717 = ~_3691;
    int _3719 = _3717 + _3707;
    int _3721 = _3719 + 1;
    bool _3723 = !_3687;
    int _3725 = _3723 ? _3699 : (-1);
    float _3727 = fma(_3675, _3711, _743);
    float _3729 = fma(_3667, _3715, _3713);
    float _3731 = _3525 + 0.5;
    bool _3733 = !_3665;
    int _3735 = _3733 ? _3721 : (-1);
    float _3737 = _3605 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3739 = float(_3725);
    float _3741 = fma(_3675, _3731, _3727);
    float _3743 = float(_3735);
    float _3745 = _3693 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3747 = _3499 * _3709;
    float _3749 = -_479;
    float _3751 = fma(_3737, _3739, _3749);
    float _3753 = _3497 + (-0.5);
    float _3755 = -_805;
    float _3757 = fma(_3745, _3743, _3755);
    float _3759 = -_3539;
    float _3761 = _3747 * _3759;
    float _3763 = _3441 + (-0.5);
    float _3765 = -_3737;
    float _3767 = fma(_3765, _3753, _3751);
    float _3769 = -_3541;
    float _3771 = _3747 * _3769;
    float _3773 = fma(_3709, _3385, _3761);
    float _3775 = -_3745;
    float _3777 = fma(_3775, _3763, _3757);
    float _3779 = -_3543;
    float _3781 = _3747 * _3779;
    float _3783 = fma(_3709, _3387, _3771);
    float _3785 = _3499 * _3413;
    float _3787 = _3499 * _3387;
    float _3789 = fma(_3709, _3413, _3781);
    float _3791 = -_779;
    float _3793 = _3791 + 1.0;
    float _3795 = fma(_3527, _3489, _3785);
    float _3797 = fma(_3527, _3491, _3787);
    float _3799 = -_2559;
    float _3801 = fma(_3525, _3799, _3741);
    out.m_78.x = _3773;
    out.m_78.y = _3783;
    out.m_78.z = _3789;
    float _3803 = _3543 + _3795;
    float _3805 = -_3521;
    float _3807 = _3805 + 1.0;
    float _3809 = _3541 + _3797;
    float _3811 = -_3793;
    float _3813 = fma(_3519, _3811, _3729);
    float _3815 = fma(_3497, _2549, _3767);
    float _3817 = fma(_3807, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3521);
    float _3819 = fma(_3441, _2575, _3777);
    float _3821 = _3623 + _1568;
    out.m_80.x = _3645;
    out.m_80.y = _3809;
    out.m_80.z = _3803;
    bool _3823 = _915 <= 8000.0;
    bool _3825 = isnan(_915);
    bool _3827 = _3823 || _3825;
    bool _3829 = isnan(8000.0);
    bool _3831 = _3827 || _3829;
    float _3833 = float(_3831);
    out.m_82.x = _3813;
    out.m_82.y = _3815;
    out.m_82.z = _3801;
    out.m_82.w = _3819;
    float _3835 = _3821 * 0.5;
    float _3837 = _3821;
    float _3839 = _3835;
    float _3841 = _3623;
    if (!_1548)
    {
        _3837 = 1.0;
    }
    float _3843 = _3837;
    float _3845 = _3833 * _3817;
    float _3847 = _3843;
    if (_1548)
    {
        bool _3849 = _1662 >= _1652;
        bool _3851 = isnan(_1662);
        bool _3853 = _3849 || _3851;
        bool _3855 = isnan(_1652);
        bool _3857 = _3853 || _3855;
        float _3859 = float(_3857);
        _3847 = _3859;
    }
    float _3861 = _3847;
    float _3863 = _1675 * _2647;
    float _3865 = _3861 * _2241;
    float _3867 = fma(_2499, _3863, _1669);
    out.gl_Position.x = _1602;
    out.gl_Position.y = _1604;
    out.gl_Position.z = _3623;
    out.gl_Position.w = _1568;
    float _3869 = fma(_2501, _3863, _1671);
    float _3871 = _3845 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3873 = fma(_1675, _3617, _1673);
    out.m_84.z = _3835;
    out.m_84.w = _1568;
    bool _3875 = _2263 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3877 = isnan(_2263);
    bool _3879 = _3875 || _3877;
    bool _3881 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3883 = _3879 || _3881;
    float _3885 = _2581 * _3871;
    float _3887 = precise::clamp(_3885, 0.0, 1.0);
    float _3889 = -_3887;
    float _3891 = fma(_3889, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3893 = -_3865;
    float _3895 = fma(_3893, _3891, 1.0);
    float _3897 = precise::clamp(_3895, 0.0, 1.0);
    float _3899 = -_2635;
    float _3901 = _3899 + 1.0;
    float _3903 = _3897 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3905 = _1675 * _3901;
    float _3907 = _3897;
    float _3909 = _3901;
    if (!_3883)
    {
        _3907 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3911 = _3907;
    float _3913 = _3911;
    float _3915 = _3911;
    if (!_3883)
    {
        _3839 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3917 = _3839;
    out.m_86.x = _3903;
    float _3919 = _3917;
    float _3921 = _3917;
    if (!_3883)
    {
        _1576 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3923 = _1576;
    float _3925 = _3923;
    float _3927 = _3923;
    if (!_3883)
    {
        _3841 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3929 = _3841;
    out.m_88.x = _3867;
    out.m_88.y = _3869;
    out.m_88.z = _3873;
    out.m_88.w = _3905;
    float _3931 = _3929;
    float _3933 = _3929;
    if (!_3883)
    {
        _1606 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3935 = _1606;
    float _3937 = _3935;
    float _3939 = _3935;
    if (!_3883)
    {
        _3909 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3941 = _3909;
    bool _3943 = !_3883;
    float _3945 = _3941;
    float _3947 = _3941;
    if (!_3943)
    {
        bool _3949 = _2263 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3951 = isnan(_2263);
        bool _3953 = _3949 || _3951;
        bool _3955 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3957 = _3953 || _3955;
        if (!_3957)
        {
            float _3959 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3961 = _2263 + _3959;
            float _3963 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3965 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3963;
            float _3967 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3969 = _3967 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3971 = 1.0 / _3965;
            float _3973 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3975 = _3973 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3977 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3979 = _3977 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3981 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3983 = _3981 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3985 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3987 = _3985 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3989 = _3961 * _3971;
            float _3991 = precise::clamp(_3989, 0.0, 1.0);
            float _3993 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3995 = _3993 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3997 = fma(_3991, _3969, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3999 = fma(_3991, _3995, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4001 = fma(_3991, _3975, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4003 = fma(_3991, _3979, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4005 = fma(_3991, _3983, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4007 = fma(_3991, _3987, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3921 = _4001;
            _3939 = _4005;
            _3915 = _3997;
            _3933 = _4003;
            _3927 = _3999;
            _3947 = _4007;
            _4009 = true;
        }
        else
        {
            bool _4011 = _2263 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4013 = isnan(_2263);
            bool _4015 = _4011 || _4013;
            bool _4017 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4019 = _4015 || _4017;
            if (!_4019)
            {
                _3913 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4021 = _3913;
            _3915 = _4021;
            if (!_4019)
            {
                _3919 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4023 = _3919;
            _3921 = _4023;
            if (!_4019)
            {
                _3925 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4025 = _3925;
            _3927 = _4025;
            if (!_4019)
            {
                _3931 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4027 = _3931;
            _3933 = _4027;
            if (!_4019)
            {
                _3937 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4029 = _3937;
            _3939 = _4029;
            if (!_4019)
            {
                _3945 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4031 = _3945;
            bool _4033 = !_4019;
            _3947 = _4031;
            if (!_4033)
            {
                bool _4035 = _2263 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4037 = isnan(_2263);
                bool _4039 = _4035 || _4037;
                bool _4041 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4043 = _4039 || _4041;
                if (!_4043)
                {
                    float _4045 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4047 = _2263 + _4045;
                    float _4049 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4051 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4049;
                    float _4053 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4055 = _4053 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4057 = 1.0 / _4051;
                    float _4059 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4061 = _4059 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4063 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4065 = _4063 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4067 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4069 = _4067 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4071 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4073 = _4071 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4075 = _4047 * _4057;
                    float _4077 = precise::clamp(_4075, 0.0, 1.0);
                    float _4079 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4081 = _4079 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4083 = fma(_4077, _4055, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4085 = fma(_4077, _4081, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4087 = fma(_4077, _4061, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4089 = fma(_4077, _4065, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4091 = fma(_4077, _4069, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4093 = fma(_4077, _4073, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3921 = _4087;
                    _3939 = _4091;
                    _3915 = _4083;
                    _3933 = _4089;
                    _3927 = _4085;
                    _3947 = _4093;
                    _4009 = true;
                }
                else
                {
                    _3921 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3939 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3915 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3933 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3927 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3947 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4009 = false;
    float _4095 = _3921;
    float _4097 = _3939;
    float _4099 = _3915;
    float _4101 = _3933;
    float _4103 = _3927;
    float _4105 = _3947;
    float _4107 = fma(_3809, -0.5, 0.5);
    float _4109 = precise::clamp(_4107, 0.0, 1.0);
    float _4111 = -_4095;
    float _4113 = _4111 + _4097;
    float _4115 = -_4099;
    float _4117 = _4115 + _4101;
    float _4119 = -_4103;
    float _4121 = _4119 + _4105;
    bool _4123 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4125 = fma(_4109, _4113, _4095);
    float _4127 = fma(_4109, _4117, _4099);
    float _4129 = fma(_4109, _4121, _4103);
    float _4131 = _4125 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _4133 = fma(_4127, 0.298911988735198974609375, _4131);
    float _4135 = fma(_4129, 0.114477999508380889892578125, _4133);
    out.m_90.x = 0.0;
    float _4137 = -_4135;
    float _4139 = _4127 + _4137;
    float _4141 = -_4135;
    float _4143 = _4125 + _4141;
    float _4145 = -_4135;
    float _4147 = _4129 + _4145;
    float _4149 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4151 = fma(_4139, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4135);
    float _4153 = fma(_4143, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4135);
    float _4155 = fma(_4147, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4135);
    out.m_86.w = _4149;
    out.m_92.x = _4151;
    out.m_92.y = _4153;
    out.m_92.z = _4155;
    if (!_4123)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4157 = -_1456;
    float _4159 = _4157 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4161 = -_1458;
    float _4163 = _4161 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4165 = -_1460;
    float _4167 = _4165 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4169 = _4159 * _4159;
    float _4171 = fma(_4163, _4163, _4169);
    float _4173 = fma(_4167, _4167, _4171);
    float _4175 = sqrt(_4173);
    float _4177 = rsqrt(_4173);
    float _4179 = -_4175;
    float _4181 = _4179 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4183 = _4181 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4185 = precise::clamp(_4183, 0.0, 1.0);
    float _4187 = _4163 * _4177;
    float _4189 = _4159 * _4177;
    float _4191 = abs(_4185);
    float _4193 = log2(_4191);
    float _4195 = _4167 * _4177;
    float _4197 = _4187 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4199 = _3809 * _4189;
    float _4201 = -_4189;
    float _4203 = -_4197;
    float _4205 = fma(_4201, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4203);
    float _4207 = fma(_3645, _4187, _4199);
    float _4209 = -_4195;
    float _4211 = fma(_4209, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4205);
    float _4213 = fma(_3803, _4195, _4207);
    float _4215 = precise::clamp(_4213, 0.0, 1.0);
    float _4217 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4219 = _4211 + _4217;
    float _4221 = _4193 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4223 = _4219 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4225 = precise::clamp(_4223, 0.0, 1.0);
    float _4227 = exp2(_4221);
    float _4229 = _4227 * _4225;
    float _4231 = _4215 * _4229;
    float _4233 = _4231 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4235 = _4231 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4237 = _4231 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _4233;
    out.m_90.y = _4235;
    out.m_90.z = _4237;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

