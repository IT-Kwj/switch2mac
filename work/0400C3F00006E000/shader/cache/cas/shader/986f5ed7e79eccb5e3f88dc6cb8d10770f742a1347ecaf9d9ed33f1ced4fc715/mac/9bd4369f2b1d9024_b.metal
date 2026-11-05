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
    bool _3921 = false;
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
        float _4206 = as_type<float>(_127);
        out.gl_Position.z = _4206;
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
        float _4276 = as_type<float>(_165);
        out.gl_Position.z = _4276;
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
    float2 _4661 = float2(_397, _401);
    float _403 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4661, float2(0.0), isnan(_4661)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4661, float2(0.0), isnan(_4661)), level(0.0)).x;
    float _405 = in.m_66.x;
    float _407 = in.m_66.y;
    float _409 = in.m_66.z;
    float _411 = in.m_66.w;
    float _413 = _367 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _415 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _417 = log2(_415);
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _423 = _421 != 0;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _427 = float(_111);
    float _429 = _417 * _145;
    float _431 = 1.0 / _427;
    float _433 = _407 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _435 = _407 * 2.0;
    float _437 = _405 * 2.0;
    float _439 = _405 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _441 = fma(_433, -2.0, _419);
    float _443 = _409 * 2.0;
    float _445 = floor(_437);
    float _447 = -_425;
    float _449 = fma(_439, 2.0, _447);
    float _451 = _405 + _407;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _455 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _441);
    float _457 = -_145;
    float _459 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[76].x, _449);
    float _461 = floor(_435);
    float _463 = _451 + (-1.0);
    float _465 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].x, _413);
    float _467 = _409 + _407;
    int _469 = as_type<int>(_365);
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_423)
    {
        _469 = 0;
    }
    int _473 = _469;
    float _475 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _477 = _473;
    if (!_423)
    {
        _477 = 1;
    }
    int _479 = _477;
    float _481 = _467 + (-1.0);
    float _483 = floor(_443);
    bool _485 = _445 >= 0.0;
    bool _487 = isnan(_445);
    bool _489 = _485 || _487;
    bool _491 = isnan(0.0);
    bool _493 = _489 || _491;
    float _495 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[5].z, _465);
    bool _497 = _445 > 0.0;
    float _499 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _501 = _493 ? 0 : 1;
    bool _503 = _479 != 1;
    float _505 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _507 = int(_505);
    bool _509 = _461 > 0.0;
    bool _511 = _461 >= 0.0;
    bool _513 = isnan(_461);
    bool _515 = _511 || _513;
    bool _517 = isnan(0.0);
    bool _519 = _515 || _517;
    int _521 = ~_501;
    int _523 = _521 + 1;
    int _525 = _523 + 1;
    float _527 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _529 = int(_527);
    bool _531 = _483 > 0.0;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _535 = _483 >= 0.0;
    bool _537 = isnan(_483);
    bool _539 = _535 || _537;
    bool _541 = isnan(0.0);
    bool _543 = _539 || _541;
    int _545 = _519 ? 0 : 1;
    int _547 = _543 ? 0 : 1;
    float _549 = exp2(_429);
    int _551 = ~_545;
    int _553 = _551 + 1;
    int _555 = _553 + 1;
    int _557 = _555;
    float _559 = as_type<float>(_479);
    int _561 = _525;
    float _563 = as_type<float>(_507);
    float _565 = as_type<float>(_529);
    if (!_509)
    {
        int _567 = ~_545;
        int _569 = _567 + 1;
        _557 = _569;
    }
    int _571 = _557;
    int _573 = ~_547;
    int _575 = _573 + 1;
    int _577 = _575 + 1;
    int _579 = _577;
    if (!_531)
    {
        int _581 = ~_547;
        int _583 = _581 + 1;
        _579 = _583;
    }
    int _585 = _579;
    int _587 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _589 = _587 != 0;
    int _591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _593 = _591 != 0;
    int _595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _597 = _595 != 0;
    if (!_503)
    {
        _559 = _407;
    }
    float _599 = _559;
    float _601 = _599;
    if (_503)
    {
        _601 = _405;
    }
    float _603 = _601;
    bool _605 = !_593;
    int _607 = _605 ? 0 : 1;
    float _609 = -_549;
    float _611 = _609 + 1.0;
    bool _613 = !_589;
    int _615 = _613 ? 0 : 1;
    float _617 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[83].z, _533);
    bool _619 = !_597;
    int _621 = _619 ? 0 : 1;
    int _623 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _625 = _623 != 0;
    int _627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _629 = _627 != 0;
    int _631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _633 = _631 != 0;
    float _635 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _617);
    float _637 = float(_507);
    if (!_497)
    {
        int _639 = ~_501;
        int _641 = _639 + 1;
        _561 = _641;
    }
    int _643 = _561;
    bool _645 = !_629;
    float _647 = _645 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _649 = 1.0 / _637;
    float _651 = float(_529);
    int _653 = abs(as_type<int>(_647));
    float _655 = _647;
    if (!_503)
    {
        _563 = _409;
    }
    float _657 = _563;
    float _659 = _657;
    if (!_503)
    {
        _655 = _409;
    }
    float _661 = _655;
    float _663 = 1.0 / _651;
    float _665 = _661;
    if (!_503)
    {
        _565 = _407;
    }
    float _667 = _565;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _671 = _667;
    if (_503)
    {
        _659 = _407;
    }
    float _673 = _659;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (_503)
    {
        _665 = _407;
    }
    float _677 = _665;
    float _679 = _649 * _145;
    if (_503)
    {
        _671 = _405;
    }
    float _681 = _671;
    float _683 = _673 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _685 = float(_643);
    float _687 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[83].w, _453);
    float _689 = float(_653);
    float _691 = _681 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _693 = fma(_683, -2.0, _675);
    float _695 = _689 * _685;
    float _697 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[78].z, _669);
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _701 = _495 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _705 = !_625;
    int _707 = _705 ? 0 : 1;
    float _709 = -_699;
    float _711 = fma(_691, 2.0, _709);
    float _713 = _701 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _715 = in.m_68.x;
    float _717 = in.m_68.y;
    float _719 = in.m_68.z;
    float _721 = _701 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _723 = fma(_383, (*spvDescriptorSet0.vp_c8)._m0[11].x, _713);
    float _725 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[78].w, _703);
    float _727 = fma(_383, (*spvDescriptorSet0.vp_c8)._m0[10].x, _721);
    float _729 = _431 * _145;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _733 = 1.0 + _731;
    float _735 = fma(_385, (*spvDescriptorSet0.vp_c8)._m0[11].z, _723);
    float _737 = fma(_385, (*spvDescriptorSet0.vp_c8)._m0[10].z, _727);
    float _739 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _725);
    float _741 = 1.0 / _733;
    float _743 = _735 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _745 = _695 * (-2.0);
    float _747 = _737 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _749 = abs(_707);
    float _751 = _663 * _145;
    bool _753 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _755 = isnan(1.0);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _761 = _757 || _759;
    float _763 = fma(_499, _745, _499);
    float _765 = _747 + _743;
    bool _767 = !_633;
    int _769 = _767 ? 0 : 1;
    float _771 = 1.0 / _743;
    float _773 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _697);
    int _775 = abs(_769);
    float _777 = fma(_745, _717, _717);
    float _779 = float(_571);
    float _781 = _407 + (-0.5);
    bool _783 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _785 = isnan(0.0);
    bool _787 = _783 || _785;
    bool _789 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _791 = _787 || _789;
    float _793 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _687);
    float _795 = float(_775);
    float _797 = -_145;
    float _799 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[81].x, _711);
    float _801 = float(_749);
    float _803 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _693);
    float _805 = float(_585);
    float _807 = _795 * _779;
    float _809 = _791 ? _611 : 0.0;
    float _811 = fma(_781, (*spvDescriptorSet0.vp_c9)._m0[196].y, _777);
    float _813 = _801 * _805;
    float _815 = _765 * _771;
    float _817 = _815 * 0.5;
    float _819 = in.m_70.x;
    float _821 = in.m_70.y;
    if (_761)
    {
        float _823 = _809 * _741;
        _147 = _823;
    }
    float _825 = _147;
    float _827 = _813 * (-2.0);
    float _829 = _405 + (-0.5);
    float _831 = fma(_763, _825, _811);
    float _833 = _409 + _405;
    float _835 = fma(_827, _715, _715);
    float _837 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _839 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[30].w, _837);
    float _841 = _807 * (-2.0);
    float _843 = _833 + (-1.0);
    float _845 = fma(_475, _827, _475);
    float _847 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[196].x, _835);
    float _849 = fma(_841, _719, _719);
    float _851 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _853 = _409 + (-0.5);
    float _855 = 1.0 / _839;
    float _857 = fma(_845, _825, _847);
    float _859 = fma(_851, _841, _851);
    float _861 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[196].z, _849);
    float _863 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _865 = _857 * 0.15915493667125701904296875;
    float _867 = _831 * 0.15915493667125701904296875;
    float _869 = fma(_859, _825, _861);
    float _871 = _331 * _819;
    float _873 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _875 = _865 * 6.283185482025146484375;
    float _877 = sin(_875);
    float _879 = _869 * 0.15915493667125701904296875;
    float _881 = _871 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _883 = _701 + _863;
    float _885 = _333 * _821;
    float _887 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _889 = _881 * _873;
    float _891 = _883 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _893 = _867 * 6.283185482025146484375;
    float _895 = sin(_893);
    float _897 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _899 = _855 * _897;
    float _901 = _883 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _903 = fma(_383, (*spvDescriptorSet0.vp_c15)._m0[126].x, _891);
    float _905 = _885 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _907 = _899 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _909 = fma(_385, (*spvDescriptorSet0.vp_c15)._m0[126].z, _903);
    float _911 = _867 * 6.283185482025146484375;
    float _913 = cos(_911);
    bool _915 = _899 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _917 = fma(_383, (*spvDescriptorSet0.vp_c15)._m0[127].x, _901);
    float _919 = _905 * _887;
    float _921 = _909 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _923 = fma(_385, (*spvDescriptorSet0.vp_c15)._m0[127].z, _917);
    float _925 = _865 * 6.283185482025146484375;
    float _927 = cos(_925);
    float _929 = _877 * _895;
    float _931 = _923 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _933 = 2;
    float _935 = _883;
    if (!_907)
    {
        _933 = 1;
    }
    int _937 = _933;
    float _939 = _879 * 6.283185482025146484375;
    float _941 = cos(_939);
    float _943 = _877 * _913;
    float _945 = _879 * 6.283185482025146484375;
    float _947 = sin(_945);
    float _949 = _927 * _913;
    float _951 = _927 * _895;
    float _953 = _877 * _941;
    float _955 = _913 * _941;
    float _957 = _927 * _941;
    float _959 = _895 * _941;
    bool _961 = !_907;
    int _963 = _961 ? 0 : 1;
    float _965 = trunc(_921);
    int _967 = int(_965);
    float _969 = _953 * _919;
    float _971 = fma(_947, _949, _929);
    int _973 = _937;
    if (!_915)
    {
        _973 = _963;
    }
    int _975 = _973;
    float _977 = fma(_947, _929, _949);
    float _979 = -_919;
    float _981 = _947 * _979;
    float _983 = _957 * _919;
    float _985 = trunc(_931);
    int _987 = int(_985);
    int _989 = _975 << 6;
    float _991 = -_951;
    float _993 = fma(_947, _943, _991);
    float _995 = fma(_955, _889, _981);
    float _997 = fma(_971, _889, _983);
    float _999 = -_943;
    float _1001 = fma(_947, _951, _999);
    int _1003 = _989 + 96;
    uint _1006 = uint(int(uint(_1003) >> uint(2)));
    uint _1008 = uint(int(uint(int(_1006)) >> uint(2)));
    int _1010 = int(_1006) & 3;
    float _1012 = (*spvDescriptorSet0.vp_c15)._m0[int(_1008)][_1010];
    int _1014 = int(_1006) + 1;
    uint _1016 = uint(int(uint(_1014) >> uint(2)));
    int _1018 = _1014 & 3;
    float _1020 = (*spvDescriptorSet0.vp_c15)._m0[int(_1016)][_1018];
    float _1022 = fma(_993, _889, _969);
    float _1024 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1026 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1028 = _967 + _1026;
    int _1030 = _1028 + 1;
    float _1032 = fma(_959, _1024, _995);
    float _1034 = fma(_1001, _1024, _997);
    int _1036 = _989 + 64;
    uint _1038 = uint(int(uint(_1036) >> uint(2)));
    uint _1040 = uint(int(uint(int(_1038)) >> uint(2)));
    int _1042 = int(_1038) & 3;
    float _1044 = (*spvDescriptorSet0.vp_c15)._m0[int(_1040)][_1042];
    int _1046 = int(_1038) + 1;
    uint _1048 = uint(int(uint(_1046) >> uint(2)));
    int _1050 = _1046 & 3;
    float _1052 = (*spvDescriptorSet0.vp_c15)._m0[int(_1048)][_1050];
    float _1054 = fma(_977, _1024, _1022);
    int _1056 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1058 = _987 + _1056;
    int _1060 = _1058 + 1;
    float _1062 = _1034 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1064 = _1034 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1066 = _1030 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1068 = _1034 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1070 = _1030 | _1060;
    int _1072 = _989 + 104;
    uint _1074 = uint(int(uint(_1072) >> uint(2)));
    uint _1076 = uint(int(uint(int(_1074)) >> uint(2)));
    int _1078 = int(_1074) & 3;
    float _1080 = (*spvDescriptorSet0.vp_c15)._m0[int(_1076)][_1078];
    int _1082 = int(_1074) + 1;
    uint _1084 = uint(int(uint(_1082) >> uint(2)));
    int _1086 = _1082 & 3;
    float _1088 = (*spvDescriptorSet0.vp_c15)._m0[int(_1084)][_1086];
    float _1090 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1062);
    float _1092 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1064);
    bool _1094 = _1070 < 0;
    bool _1096 = _1094 || _1066;
    float _1098 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1068);
    float _1100 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1090);
    float _1102 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1092);
    bool _1104 = _1060 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1106 = _1104 || _1096;
    int _1108 = _989 + 72;
    uint _1110 = uint(int(uint(_1108) >> uint(2)));
    uint _1112 = uint(int(uint(int(_1110)) >> uint(2)));
    int _1114 = int(_1110) & 3;
    float _1116 = (*spvDescriptorSet0.vp_c15)._m0[int(_1112)][_1114];
    int _1118 = int(_1110) + 1;
    uint _1120 = uint(int(uint(_1118) >> uint(2)));
    int _1122 = _1118 & 3;
    float _1124 = (*spvDescriptorSet0.vp_c15)._m0[int(_1120)][_1122];
    float _1126 = _1100 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1128 = _1102 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1130 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1098);
    float _1132 = _385 + _1126;
    float _1134 = _383 + _1128;
    int _1136 = _989 + 48;
    uint _1138 = uint(int(uint(_1136) >> uint(2)));
    uint _1140 = uint(int(uint(int(_1138)) >> uint(2)));
    int _1142 = int(_1138) & 3;
    float _1144 = (*spvDescriptorSet0.vp_c15)._m0[int(_1140)][_1142];
    int _1146 = int(_1138) + 1;
    uint _1148 = uint(int(uint(_1146) >> uint(2)));
    int _1150 = _1146 & 3;
    float _1152 = (*spvDescriptorSet0.vp_c15)._m0[int(_1148)][_1150];
    float _1154 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1156 = _1132 + _1154;
    int _1158 = _1030;
    float _1160 = _1054;
    float _1162 = _1134;
    float _1164 = _1132;
    if (!_1106)
    {
        int _1166 = _1060 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1168 = _1166 + _1030;
        _1158 = _1168;
    }
    int _1170 = _1158;
    float _1172 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1174 = _1134 + _1172;
    float _1176 = _1156 * _1156;
    float _1178 = 0.0;
    float _1180 = as_type<float>(_1170);
    if (!_1106)
    {
        float _1182 = floor(_921);
        _1178 = _1182;
    }
    float _1184 = _1178;
    int _1186 = _989 + 56;
    uint _1188 = uint(int(uint(_1186) >> uint(2)));
    uint _1190 = uint(int(uint(int(_1188)) >> uint(2)));
    int _1192 = int(_1188) & 3;
    float _1194 = (*spvDescriptorSet0.vp_c15)._m0[int(_1190)][_1192];
    int _1196 = int(_1188) + 1;
    uint _1198 = uint(int(uint(_1196) >> uint(2)));
    int _1200 = _1196 & 3;
    float _1202 = (*spvDescriptorSet0.vp_c15)._m0[int(_1198)][_1200];
    int _1204 = 0;
    if (!_1106)
    {
        int _1206 = _1170 << 2;
        _1204 = _1206;
    }
    int _1208 = _1204;
    float _1210 = fma(_1174, _1174, _1176);
    int _1212 = 0;
    int _1214 = _1208;
    if (!_1106)
    {
        uint _1216 = uint(int(uint(_1170) >> uint(2)));
        _1212 = int(_1216);
    }
    int _1218 = _1212;
    int _1220 = _1218;
    if (!_1106)
    {
        int _1222 = 12 & _1208;
        _1214 = _1222;
    }
    int _1224 = _1214;
    float _1226 = sqrt(_1210);
    int _1228 = _989 + 80;
    uint _1230 = uint(int(uint(_1228) >> uint(2)));
    uint _1232 = uint(int(uint(int(_1230)) >> uint(2)));
    int _1234 = int(_1230) & 3;
    float _1236 = (*spvDescriptorSet0.vp_c15)._m0[int(_1232)][_1234];
    int _1238 = int(_1230) + 1;
    uint _1240 = uint(int(uint(_1238) >> uint(2)));
    int _1242 = _1238 & 3;
    float _1244 = (*spvDescriptorSet0.vp_c15)._m0[int(_1240)][_1242];
    float _1246 = _883 * _1020;
    if (!_1106)
    {
        int _1248 = _1218 << 4;
        int _1250 = _1248 + _1224;
        _1220 = _1250;
    }
    int _1252 = _1220;
    float _1254 = fma(_383, _1012, _1246);
    float _1256 = _1130 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1258 = _883 * _1052;
    float _1260 = fma(_383, _1044, _1258);
    bool _1262 = _1226 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1264 = fma(_385, _1080, _1254);
    int _1266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1268 = _1266 != 0;
    int _1270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1272 = _1270 != 0;
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1276 = _1274 != 0;
    int _1278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1280 = _1278 != 0;
    float _1282 = _1264 + _1088;
    float _1284 = fma(_385, _1116, _1260);
    bool _1286 = !_1272;
    int _1288 = _1286 ? 0 : 1;
    float _1290 = 1.0 / _1282;
    bool _1292 = !_1268;
    int _1294 = _1292 ? 0 : 1;
    float _1296 = _1284 + _1124;
    float _1298 = _701 + _1256;
    bool _1300 = !_1276;
    int _1302 = _1300 ? 0 : 1;
    float _1304 = _883 * _1152;
    bool _1306 = !_1280;
    int _1308 = _1306 ? 0 : 1;
    float _1310 = _1282;
    float _1312 = _1226;
    float _1314 = as_type<float>(_1252);
    if (!_1262)
    {
        _1160 = _1298;
    }
    float _1316 = _1160;
    float _1318 = fma(_383, _1144, _1304);
    float _1320 = fma(_385, _1194, _1318);
    float _1322 = _1320 + _1202;
    bool _1324 = !_1262;
    float _1326 = _1316;
    if (!_1324)
    {
        float _1328 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1330 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1332 = _1226 + _1330;
        float _1334 = _1298 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1336 = rsqrt(_1210);
        float _1338 = _1332 * _1328;
        float _1340 = _1338 * 0.15915493667125701904296875;
        float _1342 = _1340 * 6.283185482025146484375;
        float _1344 = cos(_1342);
        float _1346 = _1340 * 6.283185482025146484375;
        float _1348 = sin(_1346);
        float _1350 = _1344 + (-1.0);
        float _1352 = fma(_1348, _1334, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1354 = _1350 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1356 = _1336 * _1352;
        float _1358 = fma(_1298, _1344, _1354);
        float _1360 = fma(_1174, _1356, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1362 = fma(_1156, _1356, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1310 = _1340;
        _1326 = _1358;
        _1162 = _1360;
        _1164 = _1362;
        _1312 = _1332;
    }
    float _1364 = _1310;
    float _1366 = _1326;
    float _1368 = _1162;
    float _1370 = _1164;
    float _1372 = _1312;
    float _1374 = _1364;
    float _1376 = _1372;
    if (!_1106)
    {
        int _1378 = _1252 + 400;
        uint _1380 = uint(int(uint(_1378) >> uint(2)));
        uint _1382 = uint(int(uint(int(_1380)) >> uint(2)));
        int _1384 = int(_1380) & 3;
        float _1386 = (*spvDescriptorSet0.vp_c15)._m0[int(_1382)][_1384];
        _1374 = _1386;
    }
    float _1388 = _1374;
    float _1390 = _1322 * _1290;
    float _1392 = _1366 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1394 = _1366 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1396 = _1366 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1398 = _1366 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1400 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1392);
    float _1402 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1394);
    int _1404 = _989 + 88;
    uint _1406 = uint(int(uint(_1404) >> uint(2)));
    uint _1408 = uint(int(uint(int(_1406)) >> uint(2)));
    int _1410 = int(_1406) & 3;
    float _1412 = (*spvDescriptorSet0.vp_c15)._m0[int(_1408)][_1410];
    int _1414 = int(_1406) + 1;
    uint _1416 = uint(int(uint(_1414) >> uint(2)));
    int _1418 = _1414 & 3;
    float _1420 = (*spvDescriptorSet0.vp_c15)._m0[int(_1416)][_1418];
    float _1422 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1396);
    float _1424 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1400);
    bool _1426 = _1390 >= 0.0;
    float _1428 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1402);
    float _1430 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1422);
    float _1432 = _1424 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1434 = _1296 * _1290;
    bool _1436 = _1390 <= 1.0;
    bool _1438 = _1436 && _1426;
    float _1440 = _1428 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1442 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1398);
    float _1444 = _1430 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1446 = _1432 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1448 = _1434 >= 0.0;
    bool _1450 = _1448 && _1438;
    float _1452 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1454 = _1440 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1456 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1442);
    float _1458 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1446);
    bool _1460 = _1434 <= 1.0;
    bool _1462 = _1460 && _1450;
    float _1464 = -_1454;
    float _1466 = fma(_1464, _1452, 1.0);
    float _1468 = _1456 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1470 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1458);
    float _1472 = _1088;
    if (!_1106)
    {
        float _1474 = floor(_931);
        _1472 = _1474;
    }
    float _1476 = _1472;
    float _1478 = _1432 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1480 = _1432 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1482 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1470);
    float _1484 = _883 * _1244;
    float _1486 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1478);
    float _1488 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1480);
    float _1490 = log2(_1466);
    float _1492 = _1482;
    if (_1462)
    {
        float _1494 = float(_975);
        _1314 = _1494;
    }
    float _1496 = _1314;
    float _1498 = fma(_383, _1236, _1484);
    float _1500 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1486);
    float _1502 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1488);
    float _1504 = 1.0 / _1482;
    float _1506 = _1476;
    if (!_1106)
    {
        float _1508 = -_1476;
        float _1510 = _931 + _1508;
        _1376 = _1510;
    }
    float _1512 = _1376;
    float _1514 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1500);
    float _1516 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1502);
    float _1518 = _1516;
    if (!_1106)
    {
        float _1520 = -_1184;
        float _1522 = _921 + _1520;
        _1506 = _1522;
    }
    float _1524 = _1506;
    float _1526 = _1478;
    float _1528 = _1524;
    if (_1462)
    {
        float _1530 = rint(_1496);
        float _1532 = precise::max(_1530, 0.0);
        uint _1534 = uint(_1532);
        uint _1536 = clamp(_1534, 0u, 65535u);
        _1526 = as_type<float>(_1536);
    }
    float _1538 = _1526;
    float _1540 = _1490 * 0.693147182464599609375;
    float _1542 = fma(_385, _1412, _1498);
    float _1544 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1546 = _1542 + _1420;
    float _1548 = _1388;
    if (!_1106)
    {
        float _1550 = rint(_1388);
        float _1552 = precise::max(_1550, 0.0);
        uint _1554 = uint(_1552);
        uint _1556 = clamp(_1554, 0u, 65535u);
        _1548 = as_type<float>(_1556);
    }
    float _1558 = _1548;
    float _1560 = _1514 * _1504;
    float _1562 = _1516 * _1504;
    float _1564 = _1546 * _1290;
    float _1566 = fma(_1560, 0.5, 0.5);
    float _1568 = fma(_1562, -0.5, 0.5);
    float _1570 = _1434;
    if (_1462)
    {
        float3 _6537 = float3(_1390, _1434, float(as_type<int>(_1538)));
        float3 _6541 = select(_6537, float3(0.0), isnan(_6537));
        float _1572 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6541.xy, uint(rint(_6541.z)), _1564, level(0.0));
        _1570 = _1572;
    }
    float _1574 = _1570;
    float3 _6551 = float3(_1566, _1568, _1544);
    float _1576 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6551, float3(0.0), isnan(_6551)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6551, float3(0.0), isnan(_6551)), level(0.0)).x;
    float3 _6560 = float3(_1566, _1568, _1544);
    float4 _1579 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6560, float3(0.0), isnan(_6560)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6560, float3(0.0), isnan(_6560)), level(0.0)).xyzw;
    float _1581 = _1579.x;
    float _1583 = _1579.y;
    float _1585 = _1579.z;
    float _1587 = _1579.w;
    float _1589 = _1184;
    if (!_1106)
    {
        float3 _6583 = float3(_1524, _1512, float(as_type<int>(_1558)));
        float3 _6585 = select(_6583, float3(0.0), isnan(_6583));
        float _1591 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6585.xy, uint(rint(_6585.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6585.xy, uint(rint(_6585.z)), level(0.0)).x;
        _1589 = _1591;
    }
    float _1593 = _1589;
    float _1595 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1597 = int(_1595);
    int _1599 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1601 = _1599 != 0;
    int _1603 = abs(_615);
    int _1605 = abs(_1288);
    int _1607 = abs(_1294);
    float _1609 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1611 = int(_1609);
    int _1613 = abs(_1302);
    if (_1601)
    {
        _471 = 1.0;
    }
    float _1615 = _471;
    float _1617 = float(uint(_1597));
    float _1619 = trunc(_679);
    int _1621 = int(_1619);
    float _1623 = trunc(_751);
    int _1625 = int(_1623);
    float _1627 = float(uint(_1611));
    int _1629 = ~_1597;
    int _1631 = _1629 + 1;
    float _1633 = _1615;
    if (_1601)
    {
        float _1635 = in.m_66.x;
        _1528 = _1635;
    }
    float _1637 = _1528;
    int _1639 = ~_1611;
    int _1641 = _1639 + 1;
    if (!_1601)
    {
        _1633 = 7.345489978790283203125;
    }
    float _1643 = _1633;
    float _1645 = 1.0 / _1617;
    float _1647 = float(uint(_1621));
    float _1649 = _1637;
    if (!_1601)
    {
        float _1651 = in.m_66.y;
        _1649 = _1651;
    }
    float _1653 = _1649;
    float _1655 = float(_1597);
    float _1657 = _1643 * _405;
    bool _1659 = _1597 == 0;
    float _1661 = 1.0 / _1627;
    int _1663 = as_type<int>(_1645) + (-2);
    float _1665 = float(uint(_1625));
    float _1667 = as_type<float>(_1663) * _1647;
    int _1669 = as_type<int>(_1661) + (-2);
    float _1671 = trunc(_1667);
    float _1673 = precise::max(_1671, 0.0);
    uint _1675 = uint(_1673);
    float _1677 = as_type<float>(_1669) * _1665;
    float _1679 = floor(_1657);
    int _1681 = _1631 * int(_1675);
    int _1683 = _1681 + _1621;
    float _1685 = trunc(_1677);
    float _1687 = precise::max(_1685, 0.0);
    uint _1689 = uint(_1687);
    float _1691 = float(uint(_1683));
    float _1693 = -_1679;
    float _1695 = _1657 + _1693;
    float _1697 = as_type<float>(_1663) * _1691;
    float _1699 = float(_1621);
    bool _1701 = _1699 >= _1655;
    bool _1703 = isnan(_1699);
    bool _1705 = _1701 || _1703;
    bool _1707 = isnan(_1655);
    bool _1709 = _1705 || _1707;
    float _1711 = float(_1709);
    float _1713 = trunc(_1697);
    float _1715 = precise::max(_1713, 0.0);
    uint _1717 = uint(_1715);
    int _1719 = _1641 * int(_1689);
    int _1721 = _1719 + _1625;
    int _1723 = ~_1597;
    int _1725 = _1723 + 1;
    float _1727 = float(uint(_1721));
    float _1729 = trunc(_1711);
    int _1731 = int(_1729);
    float _1733 = as_type<float>(_1669) * _1727;
    int _1735 = int(_1675) + int(_1717);
    float _1737 = trunc(_1733);
    float _1739 = precise::max(_1737, 0.0);
    uint _1741 = uint(_1739);
    float _1743 = as_type<float>(_1675);
    if (_1601)
    {
        _1743 = 1.0;
    }
    float _1745 = _1743;
    float _1747 = _1745;
    if (!_1601)
    {
        _1747 = 1.2345600128173828125;
    }
    float _1749 = _1747;
    int _1751 = _1725 * _1735;
    int _1753 = _1751 + _1621;
    int _1755 = ~_1731;
    int _1757 = _1755 + 1;
    int _1759 = _1757 + 1;
    float _1761 = _1653 * _1749;
    bool _1763 = uint(_1753) >= uint(_1597);
    int _1765 = ~_1611;
    int _1767 = _1765 + 1;
    float _1769 = floor(_1761);
    bool _1771 = !_1763;
    int _1773 = _1771 ? 0 : (-1);
    int _1775 = int(_1689) + int(_1741);
    int _1777 = ~_1735;
    int _1779 = _1777 + _1773;
    int _1781 = _1779 + 1;
    int _1783 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1785 = _1783 != 0;
    float _1787 = _1695 * _1655;
    int _1789 = _1597 * _1781;
    int _1791 = _1789 + _1621;
    int _1793 = abs(_607);
    int _1795 = _1767 * _1775;
    int _1797 = _1795 + _1625;
    int _1799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1801 = _1799 != 0;
    float _1803 = trunc(_1787);
    int _1805 = int(_1803);
    bool _1807 = !_1659;
    int _1809 = _1807 ? _1791 : (-1);
    float _1811 = -_1769;
    float _1813 = _1761 + _1811;
    bool _1815 = uint(_1797) >= uint(_1611);
    bool _1817 = !_1801;
    int _1819 = _1817 ? 0 : 1;
    int _1821 = _1809 * _1759;
    float _1823 = _1655 * _729;
    float _1825 = float(_1611);
    float _1827 = float(_1625);
    int _1829 = _1597 + (-1);
    float _1831 = _1825 * _729;
    int _1833 = abs(_1819);
    float _1835 = trunc(_1823);
    int _1837 = int(_1835);
    bool _1839 = _1827 >= _1825;
    bool _1841 = isnan(_1827);
    bool _1843 = _1839 || _1841;
    bool _1845 = isnan(_1825);
    bool _1847 = _1843 || _1845;
    float _1849 = float(_1847);
    int _1851 = _1731 * _1829;
    int _1853 = _1851 + _1821;
    float _1855 = _1813 * _1825;
    bool _1857 = !_1815;
    int _1859 = _1857 ? 0 : (-1);
    int _1861 = _1805 * _1833;
    int _1863 = _1861 + _1621;
    int _1865 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1867 = _1865 != 0;
    float _1869 = trunc(_1849);
    int _1871 = int(_1869);
    int _1873 = ~_1775;
    int _1875 = _1873 + _1859;
    int _1877 = _1875 + 1;
    int _1879 = _1853 * _1793;
    bool _1881 = !_1785;
    int _1883 = _1881 ? 0 : 1;
    int _1885 = abs(_621);
    bool _1887 = !_1867;
    int _1889 = _1887 ? 0 : 1;
    float _1891 = trunc(_1855);
    int _1893 = int(_1891);
    int _1895 = abs(_1883);
    int _1897 = _1837 * _1603;
    int _1899 = _1897 + _1879;
    int _1901 = _1611 * _1877;
    int _1903 = _1901 + _1625;
    int _1905 = abs(_1889);
    bool _1907 = _1611 == 0;
    int _1909 = _1863 * _1885;
    int _1911 = _1909 + _1899;
    float _1913 = trunc(_1831);
    int _1915 = int(_1913);
    int _1917 = ~_1871;
    int _1919 = _1917 + 1;
    int _1921 = _1919 + 1;
    bool _1923 = !_1907;
    int _1925 = _1923 ? _1903 : (-1);
    int _1927 = _1805 * _1895;
    int _1929 = _1927 + _1911;
    int _1931 = _1893 * _1905;
    int _1933 = _1931 + _1625;
    int _1935 = _1611 + (-1);
    int _1937 = _1925 * _1921;
    float _1939 = float(uint(_1929));
    int _1941 = _1871 * _1935;
    int _1943 = _1941 + _1937;
    float _1945 = as_type<float>(_1663) * _1939;
    int _1947 = _1943 * _1605;
    float _1949 = float(uint(_1863));
    float _1951 = trunc(_1945);
    float _1953 = precise::max(_1951, 0.0);
    uint _1955 = uint(_1953);
    int _1957 = ~_1597;
    int _1959 = _1957 + 1;
    int _1961 = _1915 * _1607;
    int _1963 = _1961 + _1947;
    int _1965 = abs(_1308);
    float _1967 = as_type<float>(_1663) * _1949;
    int _1969 = _1933 * _1613;
    int _1971 = _1969 + _1963;
    int _1973 = ~_1597;
    int _1975 = _1973 + 1;
    float _1977 = trunc(_1967);
    float _1979 = precise::max(_1977, 0.0);
    uint _1981 = uint(_1979);
    int _1983 = _1893 * _1965;
    int _1985 = _1983 + _1971;
    int _1987 = ~_1597;
    int _1989 = _1987 + 1;
    float _1991 = float(uint(_1985));
    int _1993 = _1975 * int(_1955);
    int _1995 = _1993 + _1929;
    float _1997 = as_type<float>(_1669) * _1991;
    float _1999 = float(uint(_1995));
    int _2001 = _1989 * int(_1981);
    int _2003 = _2001 + _1863;
    float _2005 = trunc(_1997);
    float _2007 = precise::max(_2005, 0.0);
    uint _2009 = uint(_2007);
    float _2011 = as_type<float>(_1663) * _1999;
    float _2013 = float(uint(_2003));
    int _2015 = ~_1611;
    int _2017 = _2015 + 1;
    float _2019 = trunc(_2011);
    float _2021 = precise::max(_2019, 0.0);
    uint _2023 = uint(_2021);
    float _2025 = as_type<float>(_1663) * _2013;
    int _2027 = ~_1597;
    int _2029 = _2027 + 1;
    int _2031 = _2017 * int(_2009);
    int _2033 = _2031 + _1985;
    float _2035 = trunc(_2025);
    float _2037 = precise::max(_2035, 0.0);
    uint _2039 = uint(_2037);
    float _2041 = float(uint(_2033));
    int _2043 = int(_1955) + int(_2023);
    float _2045 = as_type<float>(_1669) * _2041;
    int _2047 = _2029 * _2043;
    int _2049 = _2047 + _1929;
    float _2051 = trunc(_2045);
    float _2053 = precise::max(_2051, 0.0);
    uint _2055 = uint(_2053);
    int _2057 = int(_1981) + int(_2039);
    bool _2059 = uint(_2049) >= uint(_1597);
    bool _2061 = !_2059;
    int _2063 = _2061 ? 0 : (-1);
    int _2065 = _1959 * _2057;
    int _2067 = _2065 + _1863;
    int _2069 = ~_2043;
    int _2071 = _2069 + _2063;
    int _2073 = _2071 + 1;
    float _2075 = as_type<float>(_2043);
    float _2077 = as_type<float>(_1899);
    if (_1106)
    {
        _2075 = 1.0;
    }
    float _2079 = _2075;
    bool _2081 = uint(_2067) >= uint(_1597);
    int _2083 = _1597 * _2073;
    int _2085 = _2083 + _1929;
    int _2087 = int(_2009) + int(_2055);
    float _2089 = _2079;
    if (!_1106)
    {
        int _2091 = _1170 << 4;
        int _2093 = _2091 + 2048;
        uint _2095 = uint(int(uint(_2093) >> uint(2)));
        uint _2097 = uint(int(uint(int(_2095)) >> uint(2)));
        int _2099 = int(_2095) & 3;
        float _2101 = (*spvDescriptorSet0.vp_c15)._m0[int(_2097)][_2099];
        int _2103 = int(_2095) + 1;
        uint _2105 = uint(int(uint(_2103) >> uint(2)));
        int _2107 = _2103 & 3;
        float _2109 = (*spvDescriptorSet0.vp_c15)._m0[int(_2105)][_2107];
        int _2111 = _2093 + 8;
        uint _2113 = uint(int(uint(_2111) >> uint(2)));
        uint _2115 = uint(int(uint(int(_2113)) >> uint(2)));
        int _2117 = int(_2113) & 3;
        float _2119 = (*spvDescriptorSet0.vp_c15)._m0[int(_2115)][_2117];
        int _2121 = int(_2113) + 1;
        uint _2123 = uint(int(uint(_2121) >> uint(2)));
        int _2125 = _2121 & 3;
        float _2127 = (*spvDescriptorSet0.vp_c15)._m0[int(_2123)][_2125];
        float _2129 = _883 * _2109;
        float _2131 = fma(_383, _2101, _2129);
        float _2133 = fma(_385, _2119, _2131);
        float _2135 = _2133 + _2127;
        float _2137 = precise::clamp(_2135, 0.0, 1.0);
        float _2139 = -_2137;
        float _2141 = _2139 + _1593;
        float _2143 = fma(_2141, 500.0, 1.5);
        float _2145 = exp2(_2143);
        float _2147 = 0.0 + _2145;
        float _2149 = precise::clamp(_2147, 0.0, 1.0);
        _1180 = as_type<float>(_2093);
        _2089 = _2149;
    }
    float _2151 = _1180;
    float _2153 = _2089;
    float _2155 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2157 = _1366 + _2155;
    float _2159 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2161 = _1368 + _2159;
    float _2163 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2165 = _1370 + _2163;
    float _2167 = _2157 * _2157;
    float _2169 = fma(_2161, _2161, _2167);
    float _2171 = fma(_2165, _2165, _2169);
    float _2173 = rsqrt(_2171);
    float _2175 = sqrt(_2171);
    float _2177 = _2173 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2179 = _2161 * _2177;
    float _2181 = _2165 * _2177;
    float _2183 = _2179 * _2179;
    float _2185 = _2181 * _2181;
    float _2187 = _2183 + _2185;
    float _2189 = sqrt(_2187);
    bool _2191 = _2189 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2193 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2195 = _2189 + _2193;
    float _2197 = _2173;
    float _2199 = _2195;
    float _2201 = _2151;
    float _2203 = _2157;
    if (_2191)
    {
        float _2205 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2197 = _2205;
    }
    float _2207 = _2197;
    if (_2191)
    {
        float _2209 = rsqrt(_2187);
        _935 = _2209;
    }
    float _2211 = _935;
    float _2213 = _2211;
    if (_2191)
    {
        float _2215 = _2195 * _2207;
        _2199 = _2215;
    }
    float _2217 = _2199;
    if (_2191)
    {
        float _2219 = _2217 * 0.15915493667125701904296875;
        _2201 = _2219;
    }
    float _2221 = _2201;
    float _2223 = _2165;
    float _2225 = _2221;
    if (_2191)
    {
        float _2227 = _2221 * 6.283185482025146484375;
        float _2229 = sin(_2227);
        _2223 = _2229;
    }
    float _2231 = _2223;
    float _2233 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2235 = precise::max(0.0, _2233);
    float _2237 = _2207;
    float _2239 = _2235;
    if (_2191)
    {
        float _2241 = _2221 * 6.283185482025146484375;
        float _2243 = cos(_2241);
        _2237 = _2243;
    }
    float _2245 = _2237;
    float _2247 = -_2177;
    float _2249 = -_2235;
    float _2251 = fma(_2157, _2247, _2249);
    if (_2191)
    {
        float _2253 = _2251 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2203 = _2253;
    }
    float _2255 = _2203;
    float _2257 = _2255;
    float _2259 = _2231;
    if (_2191)
    {
        float _2261 = fma(_2231, _2255, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2257 = _2261;
    }
    float _2263 = _2257;
    float _2265 = _2263;
    if (!_2191)
    {
        _2259 = _2179;
    }
    float _2267 = _2259;
    float _2269 = _2267;
    float _2271 = _2245;
    if (_2191)
    {
        float _2273 = _2245 + (-1.0);
        _2239 = _2273;
    }
    float _2275 = _2239;
    float _2277 = _2275;
    if (_2191)
    {
        float _2279 = _2211 * _2263;
        _2077 = _2279;
    }
    float _2281 = _2077;
    if (!_2191)
    {
        _2265 = _2251;
    }
    float _2283 = _2265;
    float _2285 = _2283;
    if (_2191)
    {
        float _2287 = _2275 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2225 = _2287;
    }
    float _2289 = _2225;
    if (_2191)
    {
        float _2291 = _2179 * _2281;
        _2269 = _2291;
    }
    float _2293 = _2269;
    if (!_2191)
    {
        _2277 = _2181;
    }
    float _2295 = _2277;
    float _2297 = _2295;
    if (_2191)
    {
        float _2299 = _2181 * _2281;
        _2297 = _2299;
    }
    float _2301 = _2297;
    if (!_2191)
    {
        _2213 = _2183;
    }
    float _2303 = _2213;
    float _2305 = _2303;
    if (_2191)
    {
        float _2307 = fma(_2251, _2245, _2289);
        _2285 = _2307;
    }
    float _2309 = _2285;
    if (_2191)
    {
        float _2311 = _2293 * _2293;
        _2305 = _2311;
    }
    float _2313 = _2305;
    if (!_2191)
    {
        _2271 = _2185;
    }
    float _2315 = _2271;
    float _2317 = _2315;
    if (_2191)
    {
        float _2319 = _2301 * _2301;
        _2317 = _2319;
    }
    float _2321 = _2317;
    float _2323 = fma(_2309, _2309, _2313);
    float _2325 = float(uint(_1933));
    int _2327 = ~_1611;
    int _2329 = _2327 + 1;
    float _2331 = _2323 + _2321;
    float _2333 = rsqrt(_2331);
    float _2335 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2337 = fma(_2175, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2335);
    float _2339 = precise::clamp(_2337, 0.0, 1.0);
    float _2341 = -_2339;
    float _2343 = _2341 + 1.0;
    float _2345 = abs(_2343);
    float _2347 = log2(_2345);
    float _2349 = _2333 * _2293;
    float _2351 = _2333 * _2309;
    float _2353 = _2333 * _2301;
    float _2355 = _2349 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2357 = -_2355;
    float _2359 = fma(_2351, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2357);
    float _2361 = -_2353;
    float _2363 = fma(_2361, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2359);
    float _2365 = _2347 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2367 = fma(_2363, -0.5, 0.5);
    float _2369 = fma(_2363, 0.5, 0.5);
    float _2371 = exp2(_2365);
    float _2373 = fma(_2369, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2375 = as_type<float>(_1669) * _2325;
    float _2377 = fma(_2369, _2373, -0.212114393711090087890625);
    float _2379 = sqrt(_2367);
    float _2381 = fma(_2369, _2377, 1.570728778839111328125);
    int _2383 = ~_1611;
    int _2385 = _2383 + 1;
    float _2387 = trunc(_2375);
    float _2389 = precise::max(_2387, 0.0);
    uint _2391 = uint(_2389);
    float _2393 = _2351 + 1.0;
    float _2395 = -_2351;
    float _2397 = fma(_2371, _2393, _2395);
    float _2399 = _2379 * 0.636619746685028076171875;
    float _2401 = fma(_2397, 0.5, 0.5);
    float _2403 = -_2381;
    float _2405 = fma(_2399, _2403, 1.0);
    float2 _7737 = float2(_2405, _2401);
    float3 _2409 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7737, float2(0.0), isnan(_7737)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7737, float2(0.0), isnan(_7737)), level(0.0)).xyz;
    float _2411 = _2409.x;
    float _2413 = _2409.y;
    float _2415 = _2409.z;
    bool _2417 = !_1659;
    int _2419 = _2417 ? _2085 : (-1);
    int _2421 = _2385 * _2087;
    int _2423 = _2421 + _1985;
    bool _2425 = !_2081;
    int _2427 = _2425 ? 0 : (-1);
    int _2429 = _2329 * int(_2391);
    int _2431 = _2429 + _1933;
    int _2433 = _2419 & 3;
    bool _2435 = _2433 != 0;
    float _2437 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2439 = _363 + _2437;
    bool _2441 = uint(_2423) >= uint(_1611);
    float _2443 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2445 = _363 + _2443;
    int _2447 = _2419 & 3;
    bool _2449 = _2447 != 0;
    out.m_72.x = _383;
    out.m_72.y = _701;
    out.m_72.z = _385;
    bool _2451 = uint(_2433) >= 2u;
    float _2453 = _2347 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2455 = !_2441;
    int _2457 = _2455 ? 0 : (-1);
    float _2459 = -_739;
    float _2461 = _2459 + 1.0;
    int _2463 = ~_2057;
    int _2465 = _2463 + _2427;
    int _2467 = _2465 + 1;
    float _2469 = -_635;
    float _2471 = _2469 + 1.0;
    int _2473 = _2449 ? 0 : 1;
    float _2475 = exp2(_2453);
    int _2477 = _2451 ? 0 : 1;
    int _2479 = _1597 * _2467;
    int _2481 = _2479 + _1863;
    bool _2483 = uint(_2433) > 1u;
    float _2485 = -_793;
    float _2487 = _2485 + 1.0;
    bool _2489 = _2433 != 3;
    float _2491 = -_403;
    float _2493 = _2491 + 1.0;
    int _2495 = ~_2087;
    int _2497 = _2495 + _2457;
    int _2499 = _2497 + 1;
    float _2501 = float(uint(_2431));
    bool _2503 = _411 > 0.5;
    int _2505 = _1611 * _2499;
    int _2507 = _2505 + _1985;
    int _2509 = ~_2473;
    int _2511 = _2509 + 1;
    int _2513 = _2511 + 1;
    float _2515 = as_type<float>(_1669) * _2501;
    int _2517 = ~_2477;
    int _2519 = _2517 + 1;
    int _2521 = _2519 + 1;
    float _2523 = -_2475;
    float _2525 = _2523 + 1.0;
    bool _2527 = !_1907;
    int _2529 = _2527 ? _2507 : (-1);
    float _2531 = trunc(_2515);
    float _2533 = precise::max(_2531, 0.0);
    uint _2535 = uint(_2533);
    int _2537 = _2513;
    int _2539 = _2521;
    if (!_2483)
    {
        int _2541 = ~_2473;
        int _2543 = _2541 + 1;
        _2537 = _2543;
    }
    int _2545 = _2537;
    float _2547 = _2525 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_2489)
    {
        int _2549 = ~_2477;
        int _2551 = _2549 + 1;
        _2539 = _2551;
    }
    int _2553 = _2539;
    int _2555 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2557 = _2555 != 0;
    float _2559 = _2547 * _1576;
    float _2561 = -_185;
    int _2563 = _2503 ? as_type<int>(_2561) : as_type<int>(_185);
    int _2565 = _2529 & 3;
    bool _2567 = _2565 != 0;
    bool _2569 = !_2557;
    int _2571 = _2569 ? 0 : 1;
    bool _2573 = uint(_2565) > 1u;
    bool _2575 = !_1659;
    int _2577 = _2575 ? _2481 : (-1);
    int _2579 = _2529 & 3;
    bool _2581 = _2579 != 0;
    bool _2583 = !_2567;
    int _2585 = _2583 ? 0 : 1;
    int _2587 = _2581 ? 0 : 1;
    bool _2589 = _2433 != 3;
    int _2591 = ~_2587;
    int _2593 = _2591 + 1;
    int _2595 = _2593 + 1;
    float _2597 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2599 = _2597 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _2601 = _2595;
    if (!_2573)
    {
        int _2603 = ~_2587;
        int _2605 = _2603 + 1;
        _2601 = _2605;
    }
    int _2607 = _2601;
    bool _2609 = !_2589;
    int _2611 = _2609 ? 0 : (-1);
    float _2613 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2615 = _2613 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2617 = 1.0 / _2599;
    bool _2619 = _2565 != 3;
    int _2621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2623 = _2621 != 0;
    float _2625 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2627 = _2625 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2629 = ~_1611;
    int _2631 = _2629 + 1;
    bool _2633 = uint(_2565) >= 2u;
    float _2635 = 1.0 / _2615;
    int _2637 = int(_2391) + int(_2535);
    int _2639 = _2631 * _2637;
    int _2641 = _2639 + _1933;
    bool _2643 = !_2435;
    int _2645 = _2643 ? 0 : 1;
    bool _2647 = !_2623;
    int _2649 = _2647 ? 0 : 1;
    float _2651 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2653 = _2651 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _2655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2657 = _2655 != 0;
    int _2659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2661 = _2659 != 0;
    float _2663 = 1.0 / _2653;
    int _2665 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2667 = _2665 != 0;
    int _2669 = _2633 ? 0 : 1;
    bool _2671 = _2565 != 3;
    int _2673 = ~_2669;
    int _2675 = _2673 + 1;
    int _2677 = _2675 + 1;
    float _2679 = 1.0 / _2627;
    int _2681 = _2677;
    if (_2619)
    {
        int _2683 = ~_2669;
        int _2685 = _2683 + 1;
        _2681 = _2685;
    }
    int _2687 = _2681;
    bool _2689 = uint(_2641) >= uint(_1611);
    float _2691 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2693 = _2691 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2695 = !_2671;
    int _2697 = _2695 ? 0 : (-1);
    bool _2699 = _405 > 0.5;
    float _2701 = 1.0 / _2693;
    float _2703 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2705 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2703;
    float _2707 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2709 = _2707 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _2711 = _2529 >> 31;
    float _2713 = _2705 * _2635;
    bool _2715 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2717 = isnan(_363);
    bool _2719 = _2715 || _2717;
    bool _2721 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2723 = _2719 || _2721;
    float _2725 = float(_2723);
    float _2727 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2729 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2727;
    bool _2731 = !_2689;
    int _2733 = _2731 ? 0 : (-1);
    float _2735 = fma(_2713, _2445, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    int _2737 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2739 = _2737 != 0;
    float _2741 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2743 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2741;
    float _2745 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2747 = _2745 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2749 = _2729 * _2663;
    int _2751 = _2711 & 3;
    float _2753 = _2743 * _2617;
    float _2755 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2757 = _363 + _2755;
    float _2759 = _2747 * _2679;
    float _2761 = _2709 * _2701;
    float _2763 = -_2725;
    float _2765 = _2763 + 1.0;
    float _2767 = fma(_2753, _2757, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2769 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2771 = isnan(_363);
    bool _2773 = _2769 || _2771;
    bool _2775 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2777 = _2773 || _2775;
    float _2779 = float(_2777);
    float _2781 = fma(_2759, _2439, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _2783 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2785 = isnan(_363);
    bool _2787 = _2783 || _2785;
    bool _2789 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2791 = _2787 || _2789;
    float _2793 = float(_2791);
    float _2795 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2797 = _363 + _2795;
    int _2799 = _2419 >> 31;
    float _2801 = _2779 * _2765;
    float _2803 = -_2779;
    float _2805 = _2803 + 1.0;
    bool _2807 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2809 = isnan(_363);
    bool _2811 = _2807 || _2809;
    bool _2813 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2815 = _2811 || _2813;
    float _2817 = float(_2815);
    float _2819 = fma(_2761, _2797, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    int _2821 = _2799 & 3;
    float _2823 = -_2793;
    float _2825 = _2823 + 1.0;
    float _2827 = _2793 * _2805;
    bool _2829 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2831 = isnan(_363);
    bool _2833 = _2829 || _2831;
    bool _2835 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2837 = _2833 || _2835;
    float _2839 = float(_2837);
    float _2841 = -_2817;
    float _2843 = _2841 + 1.0;
    float _2845 = _2817 * _2825;
    int _2847 = _2529 + _2751;
    float _2849 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2851 = _2849 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    int _2853 = _2419 + _2821;
    float _2855 = _2839 * _2843;
    bool _2857 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2859 = isnan(_363);
    bool _2861 = _2857 || _2859;
    bool _2863 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2865 = _2861 || _2863;
    float _2867 = float(_2865);
    float _2869 = -_2839;
    float _2871 = _2869 + 1.0;
    bool _2873 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2875 = isnan(_363);
    bool _2877 = _2873 || _2875;
    bool _2879 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2881 = _2877 || _2879;
    float _2883 = float(_2881);
    float _2885 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2887 = _363 + _2885;
    int _2889 = _2853 >> 2;
    float _2891 = -_2867;
    float _2893 = _2891 + 1.0;
    int _2895 = _2847 >> 2;
    float _2897 = _2867 * _2871;
    int _2899 = _2889 << 4;
    int _2901 = _2899 + 368;
    float _2903 = _2883 * _2893;
    int _2905 = _2895 << 4;
    int _2907 = _2905 + 512;
    uint _2909 = uint(int(uint(_2901) >> uint(2)));
    uint _2911 = uint(int(uint(int(_2909)) >> uint(2)));
    int _2913 = int(_2909) & 3;
    float _2915 = (*spvDescriptorSet0.vp_c9)._m0[int(_2911)][_2913];
    int _2917 = int(_2909) + 1;
    uint _2919 = uint(int(uint(_2917) >> uint(2)));
    int _2921 = _2917 & 3;
    float _2923 = (*spvDescriptorSet0.vp_c9)._m0[int(_2919)][_2921];
    float _2925 = _2767 * _2903;
    float _2927 = -_2883;
    float _2929 = _2927 + 1.0;
    float _2931 = fma(_2929, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2925);
    uint _2933 = uint(int(uint(_2907) >> uint(2)));
    uint _2935 = uint(int(uint(int(_2933)) >> uint(2)));
    int _2937 = int(_2933) & 3;
    float _2939 = (*spvDescriptorSet0.vp_c9)._m0[int(_2935)][_2937];
    int _2941 = int(_2933) + 1;
    uint _2943 = uint(int(uint(_2941) >> uint(2)));
    int _2945 = _2941 & 3;
    float _2947 = (*spvDescriptorSet0.vp_c9)._m0[int(_2943)][_2945];
    float _2949 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2951 = _2949 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2953 = fma(_2781, _2897, _2931);
    float _2955 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2957 = _2955 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2959 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2961 = _363 + _2959;
    int _2963 = abs(_2607);
    float _2965 = fma(_2735, _2855, _2953);
    int _2967 = ~_2637;
    int _2969 = _2967 + _2733;
    int _2971 = _2969 + 1;
    float _2973 = 1.0 / _2951;
    int _2975 = _2901 + 8;
    uint _2977 = uint(int(uint(_2975) >> uint(2)));
    uint _2979 = uint(int(uint(int(_2977)) >> uint(2)));
    int _2981 = int(_2977) & 3;
    float _2983 = (*spvDescriptorSet0.vp_c9)._m0[int(_2979)][_2981];
    int _2985 = int(_2977) + 1;
    uint _2987 = uint(int(uint(_2985) >> uint(2)));
    int _2989 = _2985 & 3;
    float _2991 = (*spvDescriptorSet0.vp_c9)._m0[int(_2987)][_2989];
    float _2993 = fma(_2749, _2961, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2995 = fma(_2819, _2845, _2965);
    int _2997 = _1611 * _2971;
    int _2999 = _2997 + _1933;
    bool _3001 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _3003 = isnan(_363);
    bool _3005 = _3001 || _3003;
    bool _3007 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _3009 = _3005 || _3007;
    float _3011 = float(_3009);
    float _3013 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3015 = _363 + _3013;
    float _3017 = fma(_2993, _2827, _2995);
    float _3019 = 1.0 / _2957;
    int _3021 = _2907 + 8;
    uint _3023 = uint(int(uint(_3021) >> uint(2)));
    uint _3025 = uint(int(uint(int(_3023)) >> uint(2)));
    int _3027 = int(_3023) & 3;
    float _3029 = (*spvDescriptorSet0.vp_c9)._m0[int(_3025)][_3027];
    int _3031 = int(_3023) + 1;
    uint _3033 = uint(int(uint(_3031) >> uint(2)));
    int _3035 = _3031 & 3;
    float _3037 = (*spvDescriptorSet0.vp_c9)._m0[int(_3033)][_3035];
    bool _3039 = !_1907;
    int _3041 = _3039 ? _2999 : (-1);
    bool _3043 = _407 > 0.5;
    int _3045 = abs(_2545);
    float _3047 = _2851 * _2973;
    float _3049 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3051 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _3049;
    float _3053 = -_181;
    int _3055 = _2699 ? as_type<int>(_3053) : as_type<int>(_181);
    bool _3057 = _409 > 0.5;
    float _3059 = fma(_3047, _2887, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _3061 = ~_3045;
    int _3063 = _3061 + 1;
    int _3065 = _3063 + 1;
    float _3067 = -_3011;
    float _3069 = _3067 + 1.0;
    float _3071 = _3051 * _3019;
    int _3073 = abs(_2645);
    float _3075 = fma(_3059, _2801, _3017);
    int _3077 = ~_2963;
    int _3079 = _3077 + 1;
    int _3081 = _3079 + 1;
    float _3083 = fma(_3071, _3015, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _3085 = abs(_2585);
    float _3087 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3089 = int(_3087);
    int _3091 = _3065 * as_type<int>(_2923);
    int _3093 = abs(_2687);
    float _3095 = _2725 * _3069;
    int _3097 = ~_3073;
    int _3099 = _3097 + 1;
    int _3101 = _3099 + 1;
    int _3103 = abs(_2553);
    float _3105 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3107 = int(_3105);
    int _3109 = abs(_2611);
    int _3111 = _3081 * as_type<int>(_2947);
    int _3113 = _3101 * as_type<int>(_2915);
    int _3115 = _3113 + _3091;
    float _3117 = _971 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3119 = ~_3085;
    int _3121 = _3119 + 1;
    int _3123 = _3121 + 1;
    float _3125 = abs(_899);
    float _3127 = log2(_3125);
    float _3129 = float(uint(_3089));
    float _3131 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3117);
    int _3133 = ~_3103;
    int _3135 = _3133 + 1;
    int _3137 = _3135 + 1;
    int _3139 = _3123 * as_type<int>(_2939);
    int _3141 = _3139 + _3111;
    int _3143 = ~_3093;
    int _3145 = _3143 + 1;
    int _3147 = _3145 + 1;
    float _3149 = fma(_3083, _3095, _3075);
    int _3151 = ~_3109;
    int _3153 = _3151 + 1;
    int _3155 = _3153 + 1;
    int _3157 = _3137 * as_type<int>(_2983);
    int _3159 = _3157 + _3115;
    float _3161 = 1.0 / _3129;
    float _3163 = float(uint(_3107));
    int _3165 = _3147 * as_type<int>(_3029);
    int _3167 = _3165 + _3141;
    int _3169 = abs(_2571);
    int _3171 = _3155 * as_type<int>(_2991);
    int _3173 = _3171 + _3159;
    int _3175 = abs(_2697);
    float _3177 = fma(_3011, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3149);
    int _3179 = ~_3169;
    int _3181 = _3179 + 1;
    int _3183 = _3181 + 1;
    float _3185 = 1.0 / _3163;
    int _3187 = abs(_3089);
    float _3189 = _3127 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _3191 = abs(_2649);
    int _3193 = _3173 * _3183;
    int _3195 = ~_3175;
    int _3197 = _3195 + 1;
    int _3199 = _3197 + 1;
    float _3201 = _957 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3203 = abs(_3107);
    int _3205 = _2577 * _3169;
    int _3207 = _3205 + _3193;
    float _3209 = float(uint(_3187));
    int _3211 = _3199 * as_type<int>(_3037);
    int _3213 = _3211 + _3167;
    int _3215 = ~_3191;
    int _3217 = _3215 + 1;
    int _3219 = _3217 + 1;
    float _3221 = _957 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3223 = float(uint(_3203));
    float _3225 = _957 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3227 = 1.0 / _3209;
    int _3229 = _3213 * _3219;
    int _3231 = as_type<int>(_3161) + (-2);
    float _3233 = -_947;
    float _3235 = fma(_3233, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3201);
    float _3237 = float(uint(_3207));
    float _3239 = -_947;
    float _3241 = fma(_3239, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3221);
    float _3243 = -_947;
    float _3245 = fma(_3243, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3225);
    int _3247 = _3041 * _3191;
    int _3249 = _3247 + _3229;
    float _3251 = 1.0 / _3223;
    float _3253 = as_type<float>(_3231) * _3237;
    int _3255 = as_type<int>(_3185) + (-2);
    out.m_74.x = _3177;
    float _3257 = float(uint(_3249));
    int _3259 = abs(_3207);
    float _3261 = exp2(_3189);
    float _3263 = as_type<float>(_3255) * _3257;
    int _3265 = abs(_3249);
    int _3267 = as_type<int>(_3227) + (-2);
    float _3269 = trunc(_3253);
    float _3271 = precise::max(_3269, 0.0);
    uint _3273 = uint(_3271);
    float _3275 = float(uint(_3259));
    int _3277 = as_type<int>(_3251) + (-2);
    float _3279 = as_type<float>(_3267) * _3275;
    int _3281 = ~_3089;
    int _3283 = _3281 + 1;
    float _3285 = fma(_3261, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3287 = precise::clamp(_3285, 0.0, 1.0);
    float _3289 = float(uint(_3265));
    float _3291 = trunc(_3263);
    float _3293 = precise::max(_3291, 0.0);
    uint _3295 = uint(_3293);
    float _3297 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3235);
    float _3299 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3241);
    float _3301 = _971 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3303 = as_type<float>(_3277) * _3289;
    float _3305 = _971 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3307 = _3283 * int(_3273);
    int _3309 = _3307 + _3207;
    float _3311 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3301);
    float _3313 = trunc(_3279);
    float _3315 = precise::max(_3313, 0.0);
    uint _3317 = uint(_3315);
    float _3319 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3305);
    int _3321 = ~_3187;
    int _3323 = _3321 + 1;
    float _3325 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3245);
    float _3327 = float(uint(_3309));
    int _3329 = ~_3107;
    int _3331 = _3329 + 1;
    float _3333 = trunc(_3303);
    float _3335 = precise::max(_3333, 0.0);
    uint _3337 = uint(_3335);
    float _3339 = as_type<float>(_3231) * _3327;
    int _3341 = _3331 * int(_3295);
    int _3343 = _3341 + _3249;
    int _3345 = ~_3203;
    int _3347 = _3345 + 1;
    float _3349 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _3351 = !_2657;
    float _3353 = _3351 ? _185 : as_type<float>(_2563);
    int _3355 = _3323 * int(_3317);
    int _3357 = _3355 + _3259;
    float _3359 = float(uint(_3343));
    float _3361 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3363 = trunc(_3339);
    float _3365 = precise::max(_3363, 0.0);
    uint _3367 = uint(_3365);
    float _3369 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3371 = float(uint(_3357));
    float _3373 = as_type<float>(_3255) * _3359;
    float _3375 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3311);
    int _3377 = _3347 * int(_3337);
    int _3379 = _3377 + _3265;
    float _3381 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3361);
    float _3383 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3349);
    float _3385 = trunc(_3373);
    float _3387 = precise::max(_3385, 0.0);
    uint _3389 = uint(_3387);
    float _3391 = -_185;
    int _3393 = _3043 ? as_type<int>(_3391) : as_type<int>(_185);
    float _3395 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3369);
    float _3397 = float(uint(_3379));
    float _3399 = as_type<float>(_3267) * _3371;
    float _3401 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3319);
    float _3403 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3131);
    float _3405 = as_type<float>(_3277) * _3397;
    bool _3407 = !_2661;
    float _3409 = _3407 ? _185 : as_type<float>(_3393);
    float _3411 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3413 = fma(_3287, -2.0, 3.0);
    float _3415 = trunc(_3405);
    float _3417 = precise::max(_3415, 0.0);
    uint _3419 = uint(_3417);
    float _3421 = _3287 * _3287;
    float _3423 = -_181;
    int _3425 = _3057 ? as_type<int>(_3423) : as_type<int>(_181);
    float _3427 = _3411 * _3297;
    bool _3429 = !_2739;
    float _3431 = _3429 ? _181 : as_type<float>(_3055);
    float _3433 = _3421 * _3413;
    bool _3435 = !_2667;
    float _3437 = _3435 ? _181 : as_type<float>(_3425);
    float _3439 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3441 = trunc(_3399);
    float _3443 = precise::max(_3441, 0.0);
    uint _3445 = uint(_3443);
    int _3447 = ~_3089;
    int _3449 = _3447 + 1;
    float _3451 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3381);
    float _3453 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3383);
    float _3455 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3395);
    int _3457 = int(_3273) + int(_3367);
    float _3459 = fma(_3439, _3375, _3427);
    int _3461 = ~_3107;
    int _3463 = _3461 + 1;
    out.m_76.x = _3375;
    out.m_76.y = _3403;
    out.m_76.z = _3401;
    int _3465 = int(_3295) + int(_3389);
    int _3467 = ~_3203;
    int _3469 = _3467 + 1;
    int _3471 = int(_3337) + int(_3419);
    int _3473 = _3449 * _3457;
    int _3475 = _3473 + _3207;
    int _3477 = int(_3317) + int(_3445);
    int _3479 = ~_3187;
    int _3481 = _3479 + 1;
    int _3483 = _3463 * _3465;
    int _3485 = _3483 + _3249;
    bool _3487 = uint(_3475) >= uint(_3089);
    int _3489 = _3481 * _3477;
    int _3491 = _3489 + _3259;
    bool _3493 = uint(_3485) >= uint(_3107);
    int _3495 = _3469 * _3471;
    int _3497 = _3495 + _3265;
    float _3499 = _1432 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3501 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3503 = !_3487;
    int _3505 = _3503 ? 0 : (-1);
    bool _3507 = !_3493;
    int _3509 = _3507 ? 0 : (-1);
    float _3511 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3499);
    bool _3513 = uint(_3497) >= uint(_3203);
    bool _3515 = uint(_3491) >= uint(_3187);
    float _3517 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3519 = _3207 ^ _3089;
    float _3521 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3511);
    int _3523 = ~_3457;
    int _3525 = _3523 + _3505;
    int _3527 = _3525 + 1;
    float _3529 = _2415 * _2559;
    bool _3531 = !_3515;
    int _3533 = _3531 ? 0 : (-1);
    float _3535 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3521);
    uint _3537 = uint(int(uint(_3519) >> uint(31)));
    int _3539 = _3089 * _3527;
    int _3541 = _3539 + _3207;
    int _3543 = ~_3465;
    int _3545 = _3543 + _3509;
    int _3547 = _3545 + 1;
    float _3549 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3551 = ~_3533;
    int _3553 = _3477 + _3551;
    int _3555 = _3553 + 1;
    float _3557 = _3451 + _3459;
    int _3559 = ~int(_3537);
    int _3561 = _3559 + 1;
    int _3563 = _3249 ^ _3107;
    int _3565 = _3107 * _3547;
    int _3567 = _3565 + _3249;
    bool _3569 = _3089 == 0;
    bool _3571 = !_3513;
    int _3573 = _3571 ? 0 : (-1);
    bool _3575 = _3107 == 0;
    bool _3577 = _3107 == 0;
    float _3579 = _3501 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3581 = _3555 ^ _3561;
    float _3583 = fma(_3411, _3411, 1.0);
    uint _3585 = uint(int(uint(_3563) >> uint(31)));
    float _3587 = _3549 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3589 = !_3569;
    int _3591 = _3589 ? _3541 : (-1);
    int _3593 = ~_3573;
    int _3595 = _3471 + _3593;
    int _3597 = _3595 + 1;
    bool _3599 = _3089 == 0;
    int _3601 = ~int(_3585);
    int _3603 = _3601 + 1;
    float _3605 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3607 = ~_3561;
    int _3609 = _3607 + _3581;
    int _3611 = _3609 + 1;
    bool _3613 = !_3575;
    int _3615 = _3613 ? _3567 : (-1);
    float _3617 = float(_3591);
    int _3619 = _3597 ^ _3603;
    float _3621 = rsqrt(_3583);
    float _3623 = float(_3615);
    float _3625 = fma(_3579, _3617, _459);
    float _3627 = _3431 + 0.5;
    int _3629 = ~_3603;
    int _3631 = _3629 + _3619;
    int _3633 = _3631 + 1;
    bool _3635 = !_3599;
    int _3637 = _3635 ? _3611 : (-1);
    float _3639 = fma(_3587, _3623, _799);
    float _3641 = fma(_3579, _3627, _3625);
    float _3643 = _3437 + 0.5;
    bool _3645 = !_3577;
    int _3647 = _3645 ? _3633 : (-1);
    float _3649 = _3517 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3651 = float(_3637);
    float _3653 = fma(_3587, _3643, _3639);
    float _3655 = float(_3647);
    float _3657 = _3605 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3659 = _3411 * _3621;
    float _3661 = -_455;
    float _3663 = fma(_3649, _3651, _3661);
    float _3665 = _3409 + (-0.5);
    float _3667 = -_803;
    float _3669 = fma(_3657, _3655, _3667);
    float _3671 = -_3451;
    float _3673 = _3659 * _3671;
    float _3675 = _3353 + (-0.5);
    float _3677 = -_3649;
    float _3679 = fma(_3677, _3665, _3663);
    float _3681 = -_3453;
    float _3683 = _3659 * _3681;
    float _3685 = fma(_3621, _3297, _3673);
    float _3687 = -_3657;
    float _3689 = fma(_3687, _3675, _3669);
    float _3691 = -_3455;
    float _3693 = _3659 * _3691;
    float _3695 = fma(_3621, _3299, _3683);
    float _3697 = _3411 * _3325;
    float _3699 = _3411 * _3299;
    float _3701 = fma(_3621, _3325, _3693);
    float _3703 = -_773;
    float _3705 = _3703 + 1.0;
    float _3707 = fma(_3439, _3401, _3697);
    float _3709 = fma(_3439, _3403, _3699);
    float _3711 = -_2471;
    float _3713 = fma(_3437, _3711, _3653);
    out.m_78.x = _3685;
    out.m_78.y = _3695;
    out.m_78.z = _3701;
    float _3715 = _3455 + _3707;
    float _3717 = -_3433;
    float _3719 = _3717 + 1.0;
    float _3721 = _3453 + _3709;
    float _3723 = -_3705;
    float _3725 = fma(_3431, _3723, _3641);
    float _3727 = fma(_3409, _2461, _3679);
    float _3729 = fma(_3719, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3433);
    float _3731 = fma(_3353, _2487, _3689);
    float _3733 = _3535 + _1482;
    out.m_80.x = _3557;
    out.m_80.y = _3721;
    out.m_80.z = _3715;
    bool _3735 = _899 <= 8000.0;
    bool _3737 = isnan(_899);
    bool _3739 = _3735 || _3737;
    bool _3741 = isnan(8000.0);
    bool _3743 = _3739 || _3741;
    float _3745 = float(_3743);
    out.m_82.x = _3725;
    out.m_82.y = _3727;
    out.m_82.z = _3713;
    out.m_82.w = _3731;
    float _3747 = _3733 * 0.5;
    float _3749 = _3733;
    float _3751 = _3747;
    float _3753 = _3535;
    if (!_1462)
    {
        _3749 = 1.0;
    }
    float _3755 = _3749;
    float _3757 = _3745 * _3729;
    float _3759 = _3755;
    if (_1462)
    {
        bool _3761 = _1574 >= _1564;
        bool _3763 = isnan(_1574);
        bool _3765 = _3761 || _3763;
        bool _3767 = isnan(_1564);
        bool _3769 = _3765 || _3767;
        float _3771 = float(_3769);
        _3759 = _3771;
    }
    float _3773 = _3759;
    float _3775 = _1587 * _2559;
    float _3777 = _3773 * _2153;
    float _3779 = fma(_2411, _3775, _1581);
    out.gl_Position.x = _1514;
    out.gl_Position.y = _1516;
    out.gl_Position.z = _3535;
    out.gl_Position.w = _1482;
    float _3781 = fma(_2413, _3775, _1583);
    float _3783 = _3757 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3785 = fma(_1587, _3529, _1585);
    out.m_84.z = _3747;
    out.m_84.w = _1482;
    bool _3787 = _2175 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3789 = isnan(_2175);
    bool _3791 = _3787 || _3789;
    bool _3793 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3795 = _3791 || _3793;
    float _3797 = _2493 * _3783;
    float _3799 = precise::clamp(_3797, 0.0, 1.0);
    float _3801 = -_3799;
    float _3803 = fma(_3801, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3805 = -_3777;
    float _3807 = fma(_3805, _3803, 1.0);
    float _3809 = precise::clamp(_3807, 0.0, 1.0);
    float _3811 = -_2547;
    float _3813 = _3811 + 1.0;
    float _3815 = _3809 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3817 = _1587 * _3813;
    float _3819 = _3809;
    float _3821 = _3813;
    if (!_3795)
    {
        _3819 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3823 = _3819;
    float _3825 = _3823;
    float _3827 = _3823;
    if (!_3795)
    {
        _3751 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3829 = _3751;
    out.m_86.x = _3815;
    float _3831 = _3829;
    float _3833 = _3829;
    if (!_3795)
    {
        _1492 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3835 = _1492;
    float _3837 = _3835;
    float _3839 = _3835;
    if (!_3795)
    {
        _3753 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3841 = _3753;
    out.m_88.x = _3779;
    out.m_88.y = _3781;
    out.m_88.z = _3785;
    out.m_88.w = _3817;
    float _3843 = _3841;
    float _3845 = _3841;
    if (!_3795)
    {
        _1518 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3847 = _1518;
    float _3849 = _3847;
    float _3851 = _3847;
    if (!_3795)
    {
        _3821 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3853 = _3821;
    bool _3855 = !_3795;
    float _3857 = _3853;
    float _3859 = _3853;
    if (!_3855)
    {
        bool _3861 = _2175 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3863 = isnan(_2175);
        bool _3865 = _3861 || _3863;
        bool _3867 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3869 = _3865 || _3867;
        if (!_3869)
        {
            float _3871 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3873 = _2175 + _3871;
            float _3875 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3877 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3875;
            float _3879 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3881 = _3879 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3883 = 1.0 / _3877;
            float _3885 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3887 = _3885 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3889 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3891 = _3889 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3893 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3895 = _3893 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3897 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3899 = _3897 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3901 = _3873 * _3883;
            float _3903 = precise::clamp(_3901, 0.0, 1.0);
            float _3905 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3907 = _3905 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3909 = fma(_3903, _3881, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3911 = fma(_3903, _3907, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3913 = fma(_3903, _3887, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3915 = fma(_3903, _3891, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3917 = fma(_3903, _3895, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3919 = fma(_3903, _3899, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3833 = _3913;
            _3851 = _3917;
            _3827 = _3909;
            _3845 = _3915;
            _3839 = _3911;
            _3859 = _3919;
            _3921 = true;
        }
        else
        {
            bool _3923 = _2175 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3925 = isnan(_2175);
            bool _3927 = _3923 || _3925;
            bool _3929 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3931 = _3927 || _3929;
            if (!_3931)
            {
                _3825 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3933 = _3825;
            _3827 = _3933;
            if (!_3931)
            {
                _3831 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3935 = _3831;
            _3833 = _3935;
            if (!_3931)
            {
                _3837 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3937 = _3837;
            _3839 = _3937;
            if (!_3931)
            {
                _3843 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3939 = _3843;
            _3845 = _3939;
            if (!_3931)
            {
                _3849 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3941 = _3849;
            _3851 = _3941;
            if (!_3931)
            {
                _3857 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3943 = _3857;
            bool _3945 = !_3931;
            _3859 = _3943;
            if (!_3945)
            {
                bool _3947 = _2175 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3949 = isnan(_2175);
                bool _3951 = _3947 || _3949;
                bool _3953 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3955 = _3951 || _3953;
                if (!_3955)
                {
                    float _3957 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3959 = _2175 + _3957;
                    float _3961 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3963 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3961;
                    float _3965 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3967 = _3965 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3969 = 1.0 / _3963;
                    float _3971 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3973 = _3971 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3975 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3977 = _3975 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3979 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3981 = _3979 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3983 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3985 = _3983 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3987 = _3959 * _3969;
                    float _3989 = precise::clamp(_3987, 0.0, 1.0);
                    float _3991 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3993 = _3991 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3995 = fma(_3989, _3967, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3997 = fma(_3989, _3993, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3999 = fma(_3989, _3973, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4001 = fma(_3989, _3977, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4003 = fma(_3989, _3981, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4005 = fma(_3989, _3985, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3833 = _3999;
                    _3851 = _4003;
                    _3827 = _3995;
                    _3845 = _4001;
                    _3839 = _3997;
                    _3859 = _4005;
                    _3921 = true;
                }
                else
                {
                    _3833 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3851 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3827 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3845 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3839 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3859 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3921 = false;
    float _4007 = _3833;
    float _4009 = _3851;
    float _4011 = _3827;
    float _4013 = _3845;
    float _4015 = _3839;
    float _4017 = _3859;
    float _4019 = fma(_3721, -0.5, 0.5);
    float _4021 = precise::clamp(_4019, 0.0, 1.0);
    float _4023 = -_4007;
    float _4025 = _4023 + _4009;
    float _4027 = -_4011;
    float _4029 = _4027 + _4013;
    float _4031 = -_4015;
    float _4033 = _4031 + _4017;
    bool _4035 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4037 = fma(_4021, _4025, _4007);
    float _4039 = fma(_4021, _4029, _4011);
    float _4041 = fma(_4021, _4033, _4015);
    float _4043 = _4037 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _4045 = fma(_4039, 0.298911988735198974609375, _4043);
    float _4047 = fma(_4041, 0.114477999508380889892578125, _4045);
    out.m_90.x = 0.0;
    float _4049 = -_4047;
    float _4051 = _4039 + _4049;
    float _4053 = -_4047;
    float _4055 = _4037 + _4053;
    float _4057 = -_4047;
    float _4059 = _4041 + _4057;
    float _4061 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4063 = fma(_4051, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4047);
    float _4065 = fma(_4055, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4047);
    float _4067 = fma(_4059, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4047);
    out.m_86.w = _4061;
    out.m_92.x = _4063;
    out.m_92.y = _4065;
    out.m_92.z = _4067;
    if (!_4035)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4069 = -_1366;
    float _4071 = _4069 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4073 = -_1368;
    float _4075 = _4073 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4077 = -_1370;
    float _4079 = _4077 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4081 = _4071 * _4071;
    float _4083 = fma(_4075, _4075, _4081);
    float _4085 = fma(_4079, _4079, _4083);
    float _4087 = sqrt(_4085);
    float _4089 = rsqrt(_4085);
    float _4091 = -_4087;
    float _4093 = _4091 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4095 = _4093 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4097 = precise::clamp(_4095, 0.0, 1.0);
    float _4099 = _4075 * _4089;
    float _4101 = _4071 * _4089;
    float _4103 = abs(_4097);
    float _4105 = log2(_4103);
    float _4107 = _4079 * _4089;
    float _4109 = _4099 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4111 = _3721 * _4101;
    float _4113 = -_4101;
    float _4115 = -_4109;
    float _4117 = fma(_4113, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4115);
    float _4119 = fma(_3557, _4099, _4111);
    float _4121 = -_4107;
    float _4123 = fma(_4121, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4117);
    float _4125 = fma(_3715, _4107, _4119);
    float _4127 = precise::clamp(_4125, 0.0, 1.0);
    float _4129 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4131 = _4123 + _4129;
    float _4133 = _4105 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4135 = _4131 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4137 = precise::clamp(_4135, 0.0, 1.0);
    float _4139 = exp2(_4133);
    float _4141 = _4139 * _4137;
    float _4143 = _4127 * _4141;
    float _4145 = _4143 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4147 = _4143 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4149 = _4143 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _4145;
    out.m_90.y = _4147;
    out.m_90.z = _4149;
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
    bool _3921 = false;
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
        float _4206 = as_type<float>(_127);
        out.gl_Position.z = _4206;
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
        float _4276 = as_type<float>(_165);
        out.gl_Position.z = _4276;
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
    float2 _4661 = float2(_397, _401);
    float _403 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4661, float2(0.0), isnan(_4661)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4661, float2(0.0), isnan(_4661)), level(0.0)).x;
    float _405 = in.m_66.x;
    float _407 = in.m_66.y;
    float _409 = in.m_66.z;
    float _411 = in.m_66.w;
    float _413 = _367 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _415 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _417 = log2(_415);
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _423 = _421 != 0;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _427 = float(_111);
    float _429 = _417 * _145;
    float _431 = 1.0 / _427;
    float _433 = _407 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _435 = _407 * 2.0;
    float _437 = _405 * 2.0;
    float _439 = _405 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _441 = fma(_433, -2.0, _419);
    float _443 = _409 * 2.0;
    float _445 = floor(_437);
    float _447 = -_425;
    float _449 = fma(_439, 2.0, _447);
    float _451 = _405 + _407;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _455 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _441);
    float _457 = -_145;
    float _459 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[76].x, _449);
    float _461 = floor(_435);
    float _463 = _451 + (-1.0);
    float _465 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].x, _413);
    float _467 = _409 + _407;
    int _469 = as_type<int>(_365);
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_423)
    {
        _469 = 0;
    }
    int _473 = _469;
    float _475 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _477 = _473;
    if (!_423)
    {
        _477 = 1;
    }
    int _479 = _477;
    float _481 = _467 + (-1.0);
    float _483 = floor(_443);
    bool _485 = _445 >= 0.0;
    bool _487 = isnan(_445);
    bool _489 = _485 || _487;
    bool _491 = isnan(0.0);
    bool _493 = _489 || _491;
    float _495 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[5].z, _465);
    bool _497 = _445 > 0.0;
    float _499 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _501 = _493 ? 0 : 1;
    bool _503 = _479 != 1;
    float _505 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _507 = int(_505);
    bool _509 = _461 > 0.0;
    bool _511 = _461 >= 0.0;
    bool _513 = isnan(_461);
    bool _515 = _511 || _513;
    bool _517 = isnan(0.0);
    bool _519 = _515 || _517;
    int _521 = ~_501;
    int _523 = _521 + 1;
    int _525 = _523 + 1;
    float _527 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _529 = int(_527);
    bool _531 = _483 > 0.0;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _535 = _483 >= 0.0;
    bool _537 = isnan(_483);
    bool _539 = _535 || _537;
    bool _541 = isnan(0.0);
    bool _543 = _539 || _541;
    int _545 = _519 ? 0 : 1;
    int _547 = _543 ? 0 : 1;
    float _549 = exp2(_429);
    int _551 = ~_545;
    int _553 = _551 + 1;
    int _555 = _553 + 1;
    int _557 = _555;
    float _559 = as_type<float>(_479);
    int _561 = _525;
    float _563 = as_type<float>(_507);
    float _565 = as_type<float>(_529);
    if (!_509)
    {
        int _567 = ~_545;
        int _569 = _567 + 1;
        _557 = _569;
    }
    int _571 = _557;
    int _573 = ~_547;
    int _575 = _573 + 1;
    int _577 = _575 + 1;
    int _579 = _577;
    if (!_531)
    {
        int _581 = ~_547;
        int _583 = _581 + 1;
        _579 = _583;
    }
    int _585 = _579;
    int _587 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _589 = _587 != 0;
    int _591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _593 = _591 != 0;
    int _595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _597 = _595 != 0;
    if (!_503)
    {
        _559 = _407;
    }
    float _599 = _559;
    float _601 = _599;
    if (_503)
    {
        _601 = _405;
    }
    float _603 = _601;
    bool _605 = !_593;
    int _607 = _605 ? 0 : 1;
    float _609 = -_549;
    float _611 = _609 + 1.0;
    bool _613 = !_589;
    int _615 = _613 ? 0 : 1;
    float _617 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[83].z, _533);
    bool _619 = !_597;
    int _621 = _619 ? 0 : 1;
    int _623 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _625 = _623 != 0;
    int _627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _629 = _627 != 0;
    int _631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _633 = _631 != 0;
    float _635 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _617);
    float _637 = float(_507);
    if (!_497)
    {
        int _639 = ~_501;
        int _641 = _639 + 1;
        _561 = _641;
    }
    int _643 = _561;
    bool _645 = !_629;
    float _647 = _645 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _649 = 1.0 / _637;
    float _651 = float(_529);
    int _653 = abs(as_type<int>(_647));
    float _655 = _647;
    if (!_503)
    {
        _563 = _409;
    }
    float _657 = _563;
    float _659 = _657;
    if (!_503)
    {
        _655 = _409;
    }
    float _661 = _655;
    float _663 = 1.0 / _651;
    float _665 = _661;
    if (!_503)
    {
        _565 = _407;
    }
    float _667 = _565;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _671 = _667;
    if (_503)
    {
        _659 = _407;
    }
    float _673 = _659;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (_503)
    {
        _665 = _407;
    }
    float _677 = _665;
    float _679 = _649 * _145;
    if (_503)
    {
        _671 = _405;
    }
    float _681 = _671;
    float _683 = _673 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _685 = float(_643);
    float _687 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[83].w, _453);
    float _689 = float(_653);
    float _691 = _681 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _693 = fma(_683, -2.0, _675);
    float _695 = _689 * _685;
    float _697 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[78].z, _669);
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _701 = _495 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _705 = !_625;
    int _707 = _705 ? 0 : 1;
    float _709 = -_699;
    float _711 = fma(_691, 2.0, _709);
    float _713 = _701 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _715 = in.m_68.x;
    float _717 = in.m_68.y;
    float _719 = in.m_68.z;
    float _721 = _701 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _723 = fma(_383, (*spvDescriptorSet0.vp_c8)._m0[11].x, _713);
    float _725 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[78].w, _703);
    float _727 = fma(_383, (*spvDescriptorSet0.vp_c8)._m0[10].x, _721);
    float _729 = _431 * _145;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _733 = 1.0 + _731;
    float _735 = fma(_385, (*spvDescriptorSet0.vp_c8)._m0[11].z, _723);
    float _737 = fma(_385, (*spvDescriptorSet0.vp_c8)._m0[10].z, _727);
    float _739 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _725);
    float _741 = 1.0 / _733;
    float _743 = _735 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _745 = _695 * (-2.0);
    float _747 = _737 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _749 = abs(_707);
    float _751 = _663 * _145;
    bool _753 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _755 = isnan(1.0);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _761 = _757 || _759;
    float _763 = fma(_499, _745, _499);
    float _765 = _747 + _743;
    bool _767 = !_633;
    int _769 = _767 ? 0 : 1;
    float _771 = 1.0 / _743;
    float _773 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _697);
    int _775 = abs(_769);
    float _777 = fma(_745, _717, _717);
    float _779 = float(_571);
    float _781 = _407 + (-0.5);
    bool _783 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _785 = isnan(0.0);
    bool _787 = _783 || _785;
    bool _789 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _791 = _787 || _789;
    float _793 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _687);
    float _795 = float(_775);
    float _797 = -_145;
    float _799 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[81].x, _711);
    float _801 = float(_749);
    float _803 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _693);
    float _805 = float(_585);
    float _807 = _795 * _779;
    float _809 = _791 ? _611 : 0.0;
    float _811 = fma(_781, (*spvDescriptorSet0.vp_c9)._m0[196].y, _777);
    float _813 = _801 * _805;
    float _815 = _765 * _771;
    float _817 = _815 * 0.5;
    float _819 = in.m_70.x;
    float _821 = in.m_70.y;
    if (_761)
    {
        float _823 = _809 * _741;
        _147 = _823;
    }
    float _825 = _147;
    float _827 = _813 * (-2.0);
    float _829 = _405 + (-0.5);
    float _831 = fma(_763, _825, _811);
    float _833 = _409 + _405;
    float _835 = fma(_827, _715, _715);
    float _837 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _839 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[30].w, _837);
    float _841 = _807 * (-2.0);
    float _843 = _833 + (-1.0);
    float _845 = fma(_475, _827, _475);
    float _847 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[196].x, _835);
    float _849 = fma(_841, _719, _719);
    float _851 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _853 = _409 + (-0.5);
    float _855 = 1.0 / _839;
    float _857 = fma(_845, _825, _847);
    float _859 = fma(_851, _841, _851);
    float _861 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[196].z, _849);
    float _863 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _865 = _857 * 0.15915493667125701904296875;
    float _867 = _831 * 0.15915493667125701904296875;
    float _869 = fma(_859, _825, _861);
    float _871 = _331 * _819;
    float _873 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _875 = _865 * 6.283185482025146484375;
    float _877 = sin(_875);
    float _879 = _869 * 0.15915493667125701904296875;
    float _881 = _871 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _883 = _701 + _863;
    float _885 = _333 * _821;
    float _887 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _889 = _881 * _873;
    float _891 = _883 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _893 = _867 * 6.283185482025146484375;
    float _895 = sin(_893);
    float _897 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _899 = _855 * _897;
    float _901 = _883 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _903 = fma(_383, (*spvDescriptorSet0.vp_c15)._m0[126].x, _891);
    float _905 = _885 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _907 = _899 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _909 = fma(_385, (*spvDescriptorSet0.vp_c15)._m0[126].z, _903);
    float _911 = _867 * 6.283185482025146484375;
    float _913 = cos(_911);
    bool _915 = _899 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _917 = fma(_383, (*spvDescriptorSet0.vp_c15)._m0[127].x, _901);
    float _919 = _905 * _887;
    float _921 = _909 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _923 = fma(_385, (*spvDescriptorSet0.vp_c15)._m0[127].z, _917);
    float _925 = _865 * 6.283185482025146484375;
    float _927 = cos(_925);
    float _929 = _877 * _895;
    float _931 = _923 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _933 = 2;
    float _935 = _883;
    if (!_907)
    {
        _933 = 1;
    }
    int _937 = _933;
    float _939 = _879 * 6.283185482025146484375;
    float _941 = cos(_939);
    float _943 = _877 * _913;
    float _945 = _879 * 6.283185482025146484375;
    float _947 = sin(_945);
    float _949 = _927 * _913;
    float _951 = _927 * _895;
    float _953 = _877 * _941;
    float _955 = _913 * _941;
    float _957 = _927 * _941;
    float _959 = _895 * _941;
    bool _961 = !_907;
    int _963 = _961 ? 0 : 1;
    float _965 = trunc(_921);
    int _967 = int(_965);
    float _969 = _953 * _919;
    float _971 = fma(_947, _949, _929);
    int _973 = _937;
    if (!_915)
    {
        _973 = _963;
    }
    int _975 = _973;
    float _977 = fma(_947, _929, _949);
    float _979 = -_919;
    float _981 = _947 * _979;
    float _983 = _957 * _919;
    float _985 = trunc(_931);
    int _987 = int(_985);
    int _989 = _975 << 6;
    float _991 = -_951;
    float _993 = fma(_947, _943, _991);
    float _995 = fma(_955, _889, _981);
    float _997 = fma(_971, _889, _983);
    float _999 = -_943;
    float _1001 = fma(_947, _951, _999);
    int _1003 = _989 + 96;
    uint _1006 = uint(int(uint(_1003) >> uint(2)));
    uint _1008 = uint(int(uint(int(_1006)) >> uint(2)));
    int _1010 = int(_1006) & 3;
    float _1012 = (*spvDescriptorSet0.vp_c15)._m0[int(_1008)][_1010];
    int _1014 = int(_1006) + 1;
    uint _1016 = uint(int(uint(_1014) >> uint(2)));
    int _1018 = _1014 & 3;
    float _1020 = (*spvDescriptorSet0.vp_c15)._m0[int(_1016)][_1018];
    float _1022 = fma(_993, _889, _969);
    float _1024 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1026 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1028 = _967 + _1026;
    int _1030 = _1028 + 1;
    float _1032 = fma(_959, _1024, _995);
    float _1034 = fma(_1001, _1024, _997);
    int _1036 = _989 + 64;
    uint _1038 = uint(int(uint(_1036) >> uint(2)));
    uint _1040 = uint(int(uint(int(_1038)) >> uint(2)));
    int _1042 = int(_1038) & 3;
    float _1044 = (*spvDescriptorSet0.vp_c15)._m0[int(_1040)][_1042];
    int _1046 = int(_1038) + 1;
    uint _1048 = uint(int(uint(_1046) >> uint(2)));
    int _1050 = _1046 & 3;
    float _1052 = (*spvDescriptorSet0.vp_c15)._m0[int(_1048)][_1050];
    float _1054 = fma(_977, _1024, _1022);
    int _1056 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1058 = _987 + _1056;
    int _1060 = _1058 + 1;
    float _1062 = _1034 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1064 = _1034 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1066 = _1030 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1068 = _1034 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1070 = _1030 | _1060;
    int _1072 = _989 + 104;
    uint _1074 = uint(int(uint(_1072) >> uint(2)));
    uint _1076 = uint(int(uint(int(_1074)) >> uint(2)));
    int _1078 = int(_1074) & 3;
    float _1080 = (*spvDescriptorSet0.vp_c15)._m0[int(_1076)][_1078];
    int _1082 = int(_1074) + 1;
    uint _1084 = uint(int(uint(_1082) >> uint(2)));
    int _1086 = _1082 & 3;
    float _1088 = (*spvDescriptorSet0.vp_c15)._m0[int(_1084)][_1086];
    float _1090 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1062);
    float _1092 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1064);
    bool _1094 = _1070 < 0;
    bool _1096 = _1094 || _1066;
    float _1098 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1068);
    float _1100 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1090);
    float _1102 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1092);
    bool _1104 = _1060 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1106 = _1104 || _1096;
    int _1108 = _989 + 72;
    uint _1110 = uint(int(uint(_1108) >> uint(2)));
    uint _1112 = uint(int(uint(int(_1110)) >> uint(2)));
    int _1114 = int(_1110) & 3;
    float _1116 = (*spvDescriptorSet0.vp_c15)._m0[int(_1112)][_1114];
    int _1118 = int(_1110) + 1;
    uint _1120 = uint(int(uint(_1118) >> uint(2)));
    int _1122 = _1118 & 3;
    float _1124 = (*spvDescriptorSet0.vp_c15)._m0[int(_1120)][_1122];
    float _1126 = _1100 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1128 = _1102 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1130 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1098);
    float _1132 = _385 + _1126;
    float _1134 = _383 + _1128;
    int _1136 = _989 + 48;
    uint _1138 = uint(int(uint(_1136) >> uint(2)));
    uint _1140 = uint(int(uint(int(_1138)) >> uint(2)));
    int _1142 = int(_1138) & 3;
    float _1144 = (*spvDescriptorSet0.vp_c15)._m0[int(_1140)][_1142];
    int _1146 = int(_1138) + 1;
    uint _1148 = uint(int(uint(_1146) >> uint(2)));
    int _1150 = _1146 & 3;
    float _1152 = (*spvDescriptorSet0.vp_c15)._m0[int(_1148)][_1150];
    float _1154 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1156 = _1132 + _1154;
    int _1158 = _1030;
    float _1160 = _1054;
    float _1162 = _1134;
    float _1164 = _1132;
    if (!_1106)
    {
        int _1166 = _1060 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1168 = _1166 + _1030;
        _1158 = _1168;
    }
    int _1170 = _1158;
    float _1172 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1174 = _1134 + _1172;
    float _1176 = _1156 * _1156;
    float _1178 = 0.0;
    float _1180 = as_type<float>(_1170);
    if (!_1106)
    {
        float _1182 = floor(_921);
        _1178 = _1182;
    }
    float _1184 = _1178;
    int _1186 = _989 + 56;
    uint _1188 = uint(int(uint(_1186) >> uint(2)));
    uint _1190 = uint(int(uint(int(_1188)) >> uint(2)));
    int _1192 = int(_1188) & 3;
    float _1194 = (*spvDescriptorSet0.vp_c15)._m0[int(_1190)][_1192];
    int _1196 = int(_1188) + 1;
    uint _1198 = uint(int(uint(_1196) >> uint(2)));
    int _1200 = _1196 & 3;
    float _1202 = (*spvDescriptorSet0.vp_c15)._m0[int(_1198)][_1200];
    int _1204 = 0;
    if (!_1106)
    {
        int _1206 = _1170 << 2;
        _1204 = _1206;
    }
    int _1208 = _1204;
    float _1210 = fma(_1174, _1174, _1176);
    int _1212 = 0;
    int _1214 = _1208;
    if (!_1106)
    {
        uint _1216 = uint(int(uint(_1170) >> uint(2)));
        _1212 = int(_1216);
    }
    int _1218 = _1212;
    int _1220 = _1218;
    if (!_1106)
    {
        int _1222 = 12 & _1208;
        _1214 = _1222;
    }
    int _1224 = _1214;
    float _1226 = sqrt(_1210);
    int _1228 = _989 + 80;
    uint _1230 = uint(int(uint(_1228) >> uint(2)));
    uint _1232 = uint(int(uint(int(_1230)) >> uint(2)));
    int _1234 = int(_1230) & 3;
    float _1236 = (*spvDescriptorSet0.vp_c15)._m0[int(_1232)][_1234];
    int _1238 = int(_1230) + 1;
    uint _1240 = uint(int(uint(_1238) >> uint(2)));
    int _1242 = _1238 & 3;
    float _1244 = (*spvDescriptorSet0.vp_c15)._m0[int(_1240)][_1242];
    float _1246 = _883 * _1020;
    if (!_1106)
    {
        int _1248 = _1218 << 4;
        int _1250 = _1248 + _1224;
        _1220 = _1250;
    }
    int _1252 = _1220;
    float _1254 = fma(_383, _1012, _1246);
    float _1256 = _1130 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1258 = _883 * _1052;
    float _1260 = fma(_383, _1044, _1258);
    bool _1262 = _1226 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1264 = fma(_385, _1080, _1254);
    int _1266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1268 = _1266 != 0;
    int _1270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1272 = _1270 != 0;
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1276 = _1274 != 0;
    int _1278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1280 = _1278 != 0;
    float _1282 = _1264 + _1088;
    float _1284 = fma(_385, _1116, _1260);
    bool _1286 = !_1272;
    int _1288 = _1286 ? 0 : 1;
    float _1290 = 1.0 / _1282;
    bool _1292 = !_1268;
    int _1294 = _1292 ? 0 : 1;
    float _1296 = _1284 + _1124;
    float _1298 = _701 + _1256;
    bool _1300 = !_1276;
    int _1302 = _1300 ? 0 : 1;
    float _1304 = _883 * _1152;
    bool _1306 = !_1280;
    int _1308 = _1306 ? 0 : 1;
    float _1310 = _1282;
    float _1312 = _1226;
    float _1314 = as_type<float>(_1252);
    if (!_1262)
    {
        _1160 = _1298;
    }
    float _1316 = _1160;
    float _1318 = fma(_383, _1144, _1304);
    float _1320 = fma(_385, _1194, _1318);
    float _1322 = _1320 + _1202;
    bool _1324 = !_1262;
    float _1326 = _1316;
    if (!_1324)
    {
        float _1328 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1330 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1332 = _1226 + _1330;
        float _1334 = _1298 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1336 = rsqrt(_1210);
        float _1338 = _1332 * _1328;
        float _1340 = _1338 * 0.15915493667125701904296875;
        float _1342 = _1340 * 6.283185482025146484375;
        float _1344 = cos(_1342);
        float _1346 = _1340 * 6.283185482025146484375;
        float _1348 = sin(_1346);
        float _1350 = _1344 + (-1.0);
        float _1352 = fma(_1348, _1334, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1354 = _1350 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1356 = _1336 * _1352;
        float _1358 = fma(_1298, _1344, _1354);
        float _1360 = fma(_1174, _1356, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1362 = fma(_1156, _1356, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1310 = _1340;
        _1326 = _1358;
        _1162 = _1360;
        _1164 = _1362;
        _1312 = _1332;
    }
    float _1364 = _1310;
    float _1366 = _1326;
    float _1368 = _1162;
    float _1370 = _1164;
    float _1372 = _1312;
    float _1374 = _1364;
    float _1376 = _1372;
    if (!_1106)
    {
        int _1378 = _1252 + 400;
        uint _1380 = uint(int(uint(_1378) >> uint(2)));
        uint _1382 = uint(int(uint(int(_1380)) >> uint(2)));
        int _1384 = int(_1380) & 3;
        float _1386 = (*spvDescriptorSet0.vp_c15)._m0[int(_1382)][_1384];
        _1374 = _1386;
    }
    float _1388 = _1374;
    float _1390 = _1322 * _1290;
    float _1392 = _1366 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1394 = _1366 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1396 = _1366 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1398 = _1366 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1400 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1392);
    float _1402 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1394);
    int _1404 = _989 + 88;
    uint _1406 = uint(int(uint(_1404) >> uint(2)));
    uint _1408 = uint(int(uint(int(_1406)) >> uint(2)));
    int _1410 = int(_1406) & 3;
    float _1412 = (*spvDescriptorSet0.vp_c15)._m0[int(_1408)][_1410];
    int _1414 = int(_1406) + 1;
    uint _1416 = uint(int(uint(_1414) >> uint(2)));
    int _1418 = _1414 & 3;
    float _1420 = (*spvDescriptorSet0.vp_c15)._m0[int(_1416)][_1418];
    float _1422 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1396);
    float _1424 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1400);
    bool _1426 = _1390 >= 0.0;
    float _1428 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1402);
    float _1430 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1422);
    float _1432 = _1424 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1434 = _1296 * _1290;
    bool _1436 = _1390 <= 1.0;
    bool _1438 = _1436 && _1426;
    float _1440 = _1428 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1442 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1398);
    float _1444 = _1430 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1446 = _1432 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1448 = _1434 >= 0.0;
    bool _1450 = _1448 && _1438;
    float _1452 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1454 = _1440 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1456 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1442);
    float _1458 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1446);
    bool _1460 = _1434 <= 1.0;
    bool _1462 = _1460 && _1450;
    float _1464 = -_1454;
    float _1466 = fma(_1464, _1452, 1.0);
    float _1468 = _1456 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1470 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1458);
    float _1472 = _1088;
    if (!_1106)
    {
        float _1474 = floor(_931);
        _1472 = _1474;
    }
    float _1476 = _1472;
    float _1478 = _1432 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1480 = _1432 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1482 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1470);
    float _1484 = _883 * _1244;
    float _1486 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1478);
    float _1488 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1480);
    float _1490 = log2(_1466);
    float _1492 = _1482;
    if (_1462)
    {
        float _1494 = float(_975);
        _1314 = _1494;
    }
    float _1496 = _1314;
    float _1498 = fma(_383, _1236, _1484);
    float _1500 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1486);
    float _1502 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1488);
    float _1504 = 1.0 / _1482;
    float _1506 = _1476;
    if (!_1106)
    {
        float _1508 = -_1476;
        float _1510 = _931 + _1508;
        _1376 = _1510;
    }
    float _1512 = _1376;
    float _1514 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1500);
    float _1516 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1502);
    float _1518 = _1516;
    if (!_1106)
    {
        float _1520 = -_1184;
        float _1522 = _921 + _1520;
        _1506 = _1522;
    }
    float _1524 = _1506;
    float _1526 = _1478;
    float _1528 = _1524;
    if (_1462)
    {
        float _1530 = rint(_1496);
        float _1532 = precise::max(_1530, 0.0);
        uint _1534 = uint(_1532);
        uint _1536 = clamp(_1534, 0u, 65535u);
        _1526 = as_type<float>(_1536);
    }
    float _1538 = _1526;
    float _1540 = _1490 * 0.693147182464599609375;
    float _1542 = fma(_385, _1412, _1498);
    float _1544 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1546 = _1542 + _1420;
    float _1548 = _1388;
    if (!_1106)
    {
        float _1550 = rint(_1388);
        float _1552 = precise::max(_1550, 0.0);
        uint _1554 = uint(_1552);
        uint _1556 = clamp(_1554, 0u, 65535u);
        _1548 = as_type<float>(_1556);
    }
    float _1558 = _1548;
    float _1560 = _1514 * _1504;
    float _1562 = _1516 * _1504;
    float _1564 = _1546 * _1290;
    float _1566 = fma(_1560, 0.5, 0.5);
    float _1568 = fma(_1562, -0.5, 0.5);
    float _1570 = _1434;
    if (_1462)
    {
        float3 _6537 = float3(_1390, _1434, float(as_type<int>(_1538)));
        float3 _6541 = select(_6537, float3(0.0), isnan(_6537));
        float _1572 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6541.xy, uint(rint(_6541.z)), _1564, level(0.0));
        _1570 = _1572;
    }
    float _1574 = _1570;
    float3 _6551 = float3(_1566, _1568, _1544);
    float _1576 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6551, float3(0.0), isnan(_6551)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6551, float3(0.0), isnan(_6551)), level(0.0)).x;
    float3 _6560 = float3(_1566, _1568, _1544);
    float4 _1579 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6560, float3(0.0), isnan(_6560)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6560, float3(0.0), isnan(_6560)), level(0.0)).xyzw;
    float _1581 = _1579.x;
    float _1583 = _1579.y;
    float _1585 = _1579.z;
    float _1587 = _1579.w;
    float _1589 = _1184;
    if (!_1106)
    {
        float3 _6583 = float3(_1524, _1512, float(as_type<int>(_1558)));
        float3 _6585 = select(_6583, float3(0.0), isnan(_6583));
        float _1591 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6585.xy, uint(rint(_6585.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6585.xy, uint(rint(_6585.z)), level(0.0)).x;
        _1589 = _1591;
    }
    float _1593 = _1589;
    float _1595 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1597 = int(_1595);
    int _1599 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1601 = _1599 != 0;
    int _1603 = abs(_615);
    int _1605 = abs(_1288);
    int _1607 = abs(_1294);
    float _1609 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1611 = int(_1609);
    int _1613 = abs(_1302);
    if (_1601)
    {
        _471 = 1.0;
    }
    float _1615 = _471;
    float _1617 = float(uint(_1597));
    float _1619 = trunc(_679);
    int _1621 = int(_1619);
    float _1623 = trunc(_751);
    int _1625 = int(_1623);
    float _1627 = float(uint(_1611));
    int _1629 = ~_1597;
    int _1631 = _1629 + 1;
    float _1633 = _1615;
    if (_1601)
    {
        float _1635 = in.m_66.x;
        _1528 = _1635;
    }
    float _1637 = _1528;
    int _1639 = ~_1611;
    int _1641 = _1639 + 1;
    if (!_1601)
    {
        _1633 = 7.345489978790283203125;
    }
    float _1643 = _1633;
    float _1645 = 1.0 / _1617;
    float _1647 = float(uint(_1621));
    float _1649 = _1637;
    if (!_1601)
    {
        float _1651 = in.m_66.y;
        _1649 = _1651;
    }
    float _1653 = _1649;
    float _1655 = float(_1597);
    float _1657 = _1643 * _405;
    bool _1659 = _1597 == 0;
    float _1661 = 1.0 / _1627;
    int _1663 = as_type<int>(_1645) + (-2);
    float _1665 = float(uint(_1625));
    float _1667 = as_type<float>(_1663) * _1647;
    int _1669 = as_type<int>(_1661) + (-2);
    float _1671 = trunc(_1667);
    float _1673 = precise::max(_1671, 0.0);
    uint _1675 = uint(_1673);
    float _1677 = as_type<float>(_1669) * _1665;
    float _1679 = floor(_1657);
    int _1681 = _1631 * int(_1675);
    int _1683 = _1681 + _1621;
    float _1685 = trunc(_1677);
    float _1687 = precise::max(_1685, 0.0);
    uint _1689 = uint(_1687);
    float _1691 = float(uint(_1683));
    float _1693 = -_1679;
    float _1695 = _1657 + _1693;
    float _1697 = as_type<float>(_1663) * _1691;
    float _1699 = float(_1621);
    bool _1701 = _1699 >= _1655;
    bool _1703 = isnan(_1699);
    bool _1705 = _1701 || _1703;
    bool _1707 = isnan(_1655);
    bool _1709 = _1705 || _1707;
    float _1711 = float(_1709);
    float _1713 = trunc(_1697);
    float _1715 = precise::max(_1713, 0.0);
    uint _1717 = uint(_1715);
    int _1719 = _1641 * int(_1689);
    int _1721 = _1719 + _1625;
    int _1723 = ~_1597;
    int _1725 = _1723 + 1;
    float _1727 = float(uint(_1721));
    float _1729 = trunc(_1711);
    int _1731 = int(_1729);
    float _1733 = as_type<float>(_1669) * _1727;
    int _1735 = int(_1675) + int(_1717);
    float _1737 = trunc(_1733);
    float _1739 = precise::max(_1737, 0.0);
    uint _1741 = uint(_1739);
    float _1743 = as_type<float>(_1675);
    if (_1601)
    {
        _1743 = 1.0;
    }
    float _1745 = _1743;
    float _1747 = _1745;
    if (!_1601)
    {
        _1747 = 1.2345600128173828125;
    }
    float _1749 = _1747;
    int _1751 = _1725 * _1735;
    int _1753 = _1751 + _1621;
    int _1755 = ~_1731;
    int _1757 = _1755 + 1;
    int _1759 = _1757 + 1;
    float _1761 = _1653 * _1749;
    bool _1763 = uint(_1753) >= uint(_1597);
    int _1765 = ~_1611;
    int _1767 = _1765 + 1;
    float _1769 = floor(_1761);
    bool _1771 = !_1763;
    int _1773 = _1771 ? 0 : (-1);
    int _1775 = int(_1689) + int(_1741);
    int _1777 = ~_1735;
    int _1779 = _1777 + _1773;
    int _1781 = _1779 + 1;
    int _1783 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1785 = _1783 != 0;
    float _1787 = _1695 * _1655;
    int _1789 = _1597 * _1781;
    int _1791 = _1789 + _1621;
    int _1793 = abs(_607);
    int _1795 = _1767 * _1775;
    int _1797 = _1795 + _1625;
    int _1799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1801 = _1799 != 0;
    float _1803 = trunc(_1787);
    int _1805 = int(_1803);
    bool _1807 = !_1659;
    int _1809 = _1807 ? _1791 : (-1);
    float _1811 = -_1769;
    float _1813 = _1761 + _1811;
    bool _1815 = uint(_1797) >= uint(_1611);
    bool _1817 = !_1801;
    int _1819 = _1817 ? 0 : 1;
    int _1821 = _1809 * _1759;
    float _1823 = _1655 * _729;
    float _1825 = float(_1611);
    float _1827 = float(_1625);
    int _1829 = _1597 + (-1);
    float _1831 = _1825 * _729;
    int _1833 = abs(_1819);
    float _1835 = trunc(_1823);
    int _1837 = int(_1835);
    bool _1839 = _1827 >= _1825;
    bool _1841 = isnan(_1827);
    bool _1843 = _1839 || _1841;
    bool _1845 = isnan(_1825);
    bool _1847 = _1843 || _1845;
    float _1849 = float(_1847);
    int _1851 = _1731 * _1829;
    int _1853 = _1851 + _1821;
    float _1855 = _1813 * _1825;
    bool _1857 = !_1815;
    int _1859 = _1857 ? 0 : (-1);
    int _1861 = _1805 * _1833;
    int _1863 = _1861 + _1621;
    int _1865 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1867 = _1865 != 0;
    float _1869 = trunc(_1849);
    int _1871 = int(_1869);
    int _1873 = ~_1775;
    int _1875 = _1873 + _1859;
    int _1877 = _1875 + 1;
    int _1879 = _1853 * _1793;
    bool _1881 = !_1785;
    int _1883 = _1881 ? 0 : 1;
    int _1885 = abs(_621);
    bool _1887 = !_1867;
    int _1889 = _1887 ? 0 : 1;
    float _1891 = trunc(_1855);
    int _1893 = int(_1891);
    int _1895 = abs(_1883);
    int _1897 = _1837 * _1603;
    int _1899 = _1897 + _1879;
    int _1901 = _1611 * _1877;
    int _1903 = _1901 + _1625;
    int _1905 = abs(_1889);
    bool _1907 = _1611 == 0;
    int _1909 = _1863 * _1885;
    int _1911 = _1909 + _1899;
    float _1913 = trunc(_1831);
    int _1915 = int(_1913);
    int _1917 = ~_1871;
    int _1919 = _1917 + 1;
    int _1921 = _1919 + 1;
    bool _1923 = !_1907;
    int _1925 = _1923 ? _1903 : (-1);
    int _1927 = _1805 * _1895;
    int _1929 = _1927 + _1911;
    int _1931 = _1893 * _1905;
    int _1933 = _1931 + _1625;
    int _1935 = _1611 + (-1);
    int _1937 = _1925 * _1921;
    float _1939 = float(uint(_1929));
    int _1941 = _1871 * _1935;
    int _1943 = _1941 + _1937;
    float _1945 = as_type<float>(_1663) * _1939;
    int _1947 = _1943 * _1605;
    float _1949 = float(uint(_1863));
    float _1951 = trunc(_1945);
    float _1953 = precise::max(_1951, 0.0);
    uint _1955 = uint(_1953);
    int _1957 = ~_1597;
    int _1959 = _1957 + 1;
    int _1961 = _1915 * _1607;
    int _1963 = _1961 + _1947;
    int _1965 = abs(_1308);
    float _1967 = as_type<float>(_1663) * _1949;
    int _1969 = _1933 * _1613;
    int _1971 = _1969 + _1963;
    int _1973 = ~_1597;
    int _1975 = _1973 + 1;
    float _1977 = trunc(_1967);
    float _1979 = precise::max(_1977, 0.0);
    uint _1981 = uint(_1979);
    int _1983 = _1893 * _1965;
    int _1985 = _1983 + _1971;
    int _1987 = ~_1597;
    int _1989 = _1987 + 1;
    float _1991 = float(uint(_1985));
    int _1993 = _1975 * int(_1955);
    int _1995 = _1993 + _1929;
    float _1997 = as_type<float>(_1669) * _1991;
    float _1999 = float(uint(_1995));
    int _2001 = _1989 * int(_1981);
    int _2003 = _2001 + _1863;
    float _2005 = trunc(_1997);
    float _2007 = precise::max(_2005, 0.0);
    uint _2009 = uint(_2007);
    float _2011 = as_type<float>(_1663) * _1999;
    float _2013 = float(uint(_2003));
    int _2015 = ~_1611;
    int _2017 = _2015 + 1;
    float _2019 = trunc(_2011);
    float _2021 = precise::max(_2019, 0.0);
    uint _2023 = uint(_2021);
    float _2025 = as_type<float>(_1663) * _2013;
    int _2027 = ~_1597;
    int _2029 = _2027 + 1;
    int _2031 = _2017 * int(_2009);
    int _2033 = _2031 + _1985;
    float _2035 = trunc(_2025);
    float _2037 = precise::max(_2035, 0.0);
    uint _2039 = uint(_2037);
    float _2041 = float(uint(_2033));
    int _2043 = int(_1955) + int(_2023);
    float _2045 = as_type<float>(_1669) * _2041;
    int _2047 = _2029 * _2043;
    int _2049 = _2047 + _1929;
    float _2051 = trunc(_2045);
    float _2053 = precise::max(_2051, 0.0);
    uint _2055 = uint(_2053);
    int _2057 = int(_1981) + int(_2039);
    bool _2059 = uint(_2049) >= uint(_1597);
    bool _2061 = !_2059;
    int _2063 = _2061 ? 0 : (-1);
    int _2065 = _1959 * _2057;
    int _2067 = _2065 + _1863;
    int _2069 = ~_2043;
    int _2071 = _2069 + _2063;
    int _2073 = _2071 + 1;
    float _2075 = as_type<float>(_2043);
    float _2077 = as_type<float>(_1899);
    if (_1106)
    {
        _2075 = 1.0;
    }
    float _2079 = _2075;
    bool _2081 = uint(_2067) >= uint(_1597);
    int _2083 = _1597 * _2073;
    int _2085 = _2083 + _1929;
    int _2087 = int(_2009) + int(_2055);
    float _2089 = _2079;
    if (!_1106)
    {
        int _2091 = _1170 << 4;
        int _2093 = _2091 + 2048;
        uint _2095 = uint(int(uint(_2093) >> uint(2)));
        uint _2097 = uint(int(uint(int(_2095)) >> uint(2)));
        int _2099 = int(_2095) & 3;
        float _2101 = (*spvDescriptorSet0.vp_c15)._m0[int(_2097)][_2099];
        int _2103 = int(_2095) + 1;
        uint _2105 = uint(int(uint(_2103) >> uint(2)));
        int _2107 = _2103 & 3;
        float _2109 = (*spvDescriptorSet0.vp_c15)._m0[int(_2105)][_2107];
        int _2111 = _2093 + 8;
        uint _2113 = uint(int(uint(_2111) >> uint(2)));
        uint _2115 = uint(int(uint(int(_2113)) >> uint(2)));
        int _2117 = int(_2113) & 3;
        float _2119 = (*spvDescriptorSet0.vp_c15)._m0[int(_2115)][_2117];
        int _2121 = int(_2113) + 1;
        uint _2123 = uint(int(uint(_2121) >> uint(2)));
        int _2125 = _2121 & 3;
        float _2127 = (*spvDescriptorSet0.vp_c15)._m0[int(_2123)][_2125];
        float _2129 = _883 * _2109;
        float _2131 = fma(_383, _2101, _2129);
        float _2133 = fma(_385, _2119, _2131);
        float _2135 = _2133 + _2127;
        float _2137 = precise::clamp(_2135, 0.0, 1.0);
        float _2139 = -_2137;
        float _2141 = _2139 + _1593;
        float _2143 = fma(_2141, 500.0, 1.5);
        float _2145 = exp2(_2143);
        float _2147 = 0.0 + _2145;
        float _2149 = precise::clamp(_2147, 0.0, 1.0);
        _1180 = as_type<float>(_2093);
        _2089 = _2149;
    }
    float _2151 = _1180;
    float _2153 = _2089;
    float _2155 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2157 = _1366 + _2155;
    float _2159 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2161 = _1368 + _2159;
    float _2163 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2165 = _1370 + _2163;
    float _2167 = _2157 * _2157;
    float _2169 = fma(_2161, _2161, _2167);
    float _2171 = fma(_2165, _2165, _2169);
    float _2173 = rsqrt(_2171);
    float _2175 = sqrt(_2171);
    float _2177 = _2173 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2179 = _2161 * _2177;
    float _2181 = _2165 * _2177;
    float _2183 = _2179 * _2179;
    float _2185 = _2181 * _2181;
    float _2187 = _2183 + _2185;
    float _2189 = sqrt(_2187);
    bool _2191 = _2189 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2193 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2195 = _2189 + _2193;
    float _2197 = _2173;
    float _2199 = _2195;
    float _2201 = _2151;
    float _2203 = _2157;
    if (_2191)
    {
        float _2205 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2197 = _2205;
    }
    float _2207 = _2197;
    if (_2191)
    {
        float _2209 = rsqrt(_2187);
        _935 = _2209;
    }
    float _2211 = _935;
    float _2213 = _2211;
    if (_2191)
    {
        float _2215 = _2195 * _2207;
        _2199 = _2215;
    }
    float _2217 = _2199;
    if (_2191)
    {
        float _2219 = _2217 * 0.15915493667125701904296875;
        _2201 = _2219;
    }
    float _2221 = _2201;
    float _2223 = _2165;
    float _2225 = _2221;
    if (_2191)
    {
        float _2227 = _2221 * 6.283185482025146484375;
        float _2229 = sin(_2227);
        _2223 = _2229;
    }
    float _2231 = _2223;
    float _2233 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2235 = precise::max(0.0, _2233);
    float _2237 = _2207;
    float _2239 = _2235;
    if (_2191)
    {
        float _2241 = _2221 * 6.283185482025146484375;
        float _2243 = cos(_2241);
        _2237 = _2243;
    }
    float _2245 = _2237;
    float _2247 = -_2177;
    float _2249 = -_2235;
    float _2251 = fma(_2157, _2247, _2249);
    if (_2191)
    {
        float _2253 = _2251 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2203 = _2253;
    }
    float _2255 = _2203;
    float _2257 = _2255;
    float _2259 = _2231;
    if (_2191)
    {
        float _2261 = fma(_2231, _2255, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2257 = _2261;
    }
    float _2263 = _2257;
    float _2265 = _2263;
    if (!_2191)
    {
        _2259 = _2179;
    }
    float _2267 = _2259;
    float _2269 = _2267;
    float _2271 = _2245;
    if (_2191)
    {
        float _2273 = _2245 + (-1.0);
        _2239 = _2273;
    }
    float _2275 = _2239;
    float _2277 = _2275;
    if (_2191)
    {
        float _2279 = _2211 * _2263;
        _2077 = _2279;
    }
    float _2281 = _2077;
    if (!_2191)
    {
        _2265 = _2251;
    }
    float _2283 = _2265;
    float _2285 = _2283;
    if (_2191)
    {
        float _2287 = _2275 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2225 = _2287;
    }
    float _2289 = _2225;
    if (_2191)
    {
        float _2291 = _2179 * _2281;
        _2269 = _2291;
    }
    float _2293 = _2269;
    if (!_2191)
    {
        _2277 = _2181;
    }
    float _2295 = _2277;
    float _2297 = _2295;
    if (_2191)
    {
        float _2299 = _2181 * _2281;
        _2297 = _2299;
    }
    float _2301 = _2297;
    if (!_2191)
    {
        _2213 = _2183;
    }
    float _2303 = _2213;
    float _2305 = _2303;
    if (_2191)
    {
        float _2307 = fma(_2251, _2245, _2289);
        _2285 = _2307;
    }
    float _2309 = _2285;
    if (_2191)
    {
        float _2311 = _2293 * _2293;
        _2305 = _2311;
    }
    float _2313 = _2305;
    if (!_2191)
    {
        _2271 = _2185;
    }
    float _2315 = _2271;
    float _2317 = _2315;
    if (_2191)
    {
        float _2319 = _2301 * _2301;
        _2317 = _2319;
    }
    float _2321 = _2317;
    float _2323 = fma(_2309, _2309, _2313);
    float _2325 = float(uint(_1933));
    int _2327 = ~_1611;
    int _2329 = _2327 + 1;
    float _2331 = _2323 + _2321;
    float _2333 = rsqrt(_2331);
    float _2335 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2337 = fma(_2175, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2335);
    float _2339 = precise::clamp(_2337, 0.0, 1.0);
    float _2341 = -_2339;
    float _2343 = _2341 + 1.0;
    float _2345 = abs(_2343);
    float _2347 = log2(_2345);
    float _2349 = _2333 * _2293;
    float _2351 = _2333 * _2309;
    float _2353 = _2333 * _2301;
    float _2355 = _2349 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2357 = -_2355;
    float _2359 = fma(_2351, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2357);
    float _2361 = -_2353;
    float _2363 = fma(_2361, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2359);
    float _2365 = _2347 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2367 = fma(_2363, -0.5, 0.5);
    float _2369 = fma(_2363, 0.5, 0.5);
    float _2371 = exp2(_2365);
    float _2373 = fma(_2369, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2375 = as_type<float>(_1669) * _2325;
    float _2377 = fma(_2369, _2373, -0.212114393711090087890625);
    float _2379 = sqrt(_2367);
    float _2381 = fma(_2369, _2377, 1.570728778839111328125);
    int _2383 = ~_1611;
    int _2385 = _2383 + 1;
    float _2387 = trunc(_2375);
    float _2389 = precise::max(_2387, 0.0);
    uint _2391 = uint(_2389);
    float _2393 = _2351 + 1.0;
    float _2395 = -_2351;
    float _2397 = fma(_2371, _2393, _2395);
    float _2399 = _2379 * 0.636619746685028076171875;
    float _2401 = fma(_2397, 0.5, 0.5);
    float _2403 = -_2381;
    float _2405 = fma(_2399, _2403, 1.0);
    float2 _7737 = float2(_2405, _2401);
    float3 _2409 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7737, float2(0.0), isnan(_7737)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7737, float2(0.0), isnan(_7737)), level(0.0)).xyz;
    float _2411 = _2409.x;
    float _2413 = _2409.y;
    float _2415 = _2409.z;
    bool _2417 = !_1659;
    int _2419 = _2417 ? _2085 : (-1);
    int _2421 = _2385 * _2087;
    int _2423 = _2421 + _1985;
    bool _2425 = !_2081;
    int _2427 = _2425 ? 0 : (-1);
    int _2429 = _2329 * int(_2391);
    int _2431 = _2429 + _1933;
    int _2433 = _2419 & 3;
    bool _2435 = _2433 != 0;
    float _2437 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2439 = _363 + _2437;
    bool _2441 = uint(_2423) >= uint(_1611);
    float _2443 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2445 = _363 + _2443;
    int _2447 = _2419 & 3;
    bool _2449 = _2447 != 0;
    out.m_72.x = _383;
    out.m_72.y = _701;
    out.m_72.z = _385;
    bool _2451 = uint(_2433) >= 2u;
    float _2453 = _2347 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2455 = !_2441;
    int _2457 = _2455 ? 0 : (-1);
    float _2459 = -_739;
    float _2461 = _2459 + 1.0;
    int _2463 = ~_2057;
    int _2465 = _2463 + _2427;
    int _2467 = _2465 + 1;
    float _2469 = -_635;
    float _2471 = _2469 + 1.0;
    int _2473 = _2449 ? 0 : 1;
    float _2475 = exp2(_2453);
    int _2477 = _2451 ? 0 : 1;
    int _2479 = _1597 * _2467;
    int _2481 = _2479 + _1863;
    bool _2483 = uint(_2433) > 1u;
    float _2485 = -_793;
    float _2487 = _2485 + 1.0;
    bool _2489 = _2433 != 3;
    float _2491 = -_403;
    float _2493 = _2491 + 1.0;
    int _2495 = ~_2087;
    int _2497 = _2495 + _2457;
    int _2499 = _2497 + 1;
    float _2501 = float(uint(_2431));
    bool _2503 = _411 > 0.5;
    int _2505 = _1611 * _2499;
    int _2507 = _2505 + _1985;
    int _2509 = ~_2473;
    int _2511 = _2509 + 1;
    int _2513 = _2511 + 1;
    float _2515 = as_type<float>(_1669) * _2501;
    int _2517 = ~_2477;
    int _2519 = _2517 + 1;
    int _2521 = _2519 + 1;
    float _2523 = -_2475;
    float _2525 = _2523 + 1.0;
    bool _2527 = !_1907;
    int _2529 = _2527 ? _2507 : (-1);
    float _2531 = trunc(_2515);
    float _2533 = precise::max(_2531, 0.0);
    uint _2535 = uint(_2533);
    int _2537 = _2513;
    int _2539 = _2521;
    if (!_2483)
    {
        int _2541 = ~_2473;
        int _2543 = _2541 + 1;
        _2537 = _2543;
    }
    int _2545 = _2537;
    float _2547 = _2525 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_2489)
    {
        int _2549 = ~_2477;
        int _2551 = _2549 + 1;
        _2539 = _2551;
    }
    int _2553 = _2539;
    int _2555 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2557 = _2555 != 0;
    float _2559 = _2547 * _1576;
    float _2561 = -_185;
    int _2563 = _2503 ? as_type<int>(_2561) : as_type<int>(_185);
    int _2565 = _2529 & 3;
    bool _2567 = _2565 != 0;
    bool _2569 = !_2557;
    int _2571 = _2569 ? 0 : 1;
    bool _2573 = uint(_2565) > 1u;
    bool _2575 = !_1659;
    int _2577 = _2575 ? _2481 : (-1);
    int _2579 = _2529 & 3;
    bool _2581 = _2579 != 0;
    bool _2583 = !_2567;
    int _2585 = _2583 ? 0 : 1;
    int _2587 = _2581 ? 0 : 1;
    bool _2589 = _2433 != 3;
    int _2591 = ~_2587;
    int _2593 = _2591 + 1;
    int _2595 = _2593 + 1;
    float _2597 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2599 = _2597 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _2601 = _2595;
    if (!_2573)
    {
        int _2603 = ~_2587;
        int _2605 = _2603 + 1;
        _2601 = _2605;
    }
    int _2607 = _2601;
    bool _2609 = !_2589;
    int _2611 = _2609 ? 0 : (-1);
    float _2613 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2615 = _2613 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2617 = 1.0 / _2599;
    bool _2619 = _2565 != 3;
    int _2621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2623 = _2621 != 0;
    float _2625 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2627 = _2625 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2629 = ~_1611;
    int _2631 = _2629 + 1;
    bool _2633 = uint(_2565) >= 2u;
    float _2635 = 1.0 / _2615;
    int _2637 = int(_2391) + int(_2535);
    int _2639 = _2631 * _2637;
    int _2641 = _2639 + _1933;
    bool _2643 = !_2435;
    int _2645 = _2643 ? 0 : 1;
    bool _2647 = !_2623;
    int _2649 = _2647 ? 0 : 1;
    float _2651 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2653 = _2651 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _2655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2657 = _2655 != 0;
    int _2659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2661 = _2659 != 0;
    float _2663 = 1.0 / _2653;
    int _2665 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2667 = _2665 != 0;
    int _2669 = _2633 ? 0 : 1;
    bool _2671 = _2565 != 3;
    int _2673 = ~_2669;
    int _2675 = _2673 + 1;
    int _2677 = _2675 + 1;
    float _2679 = 1.0 / _2627;
    int _2681 = _2677;
    if (_2619)
    {
        int _2683 = ~_2669;
        int _2685 = _2683 + 1;
        _2681 = _2685;
    }
    int _2687 = _2681;
    bool _2689 = uint(_2641) >= uint(_1611);
    float _2691 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2693 = _2691 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2695 = !_2671;
    int _2697 = _2695 ? 0 : (-1);
    bool _2699 = _405 > 0.5;
    float _2701 = 1.0 / _2693;
    float _2703 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2705 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2703;
    float _2707 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2709 = _2707 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _2711 = _2529 >> 31;
    float _2713 = _2705 * _2635;
    bool _2715 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2717 = isnan(_363);
    bool _2719 = _2715 || _2717;
    bool _2721 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2723 = _2719 || _2721;
    float _2725 = float(_2723);
    float _2727 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2729 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2727;
    bool _2731 = !_2689;
    int _2733 = _2731 ? 0 : (-1);
    float _2735 = fma(_2713, _2445, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    int _2737 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2739 = _2737 != 0;
    float _2741 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2743 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2741;
    float _2745 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2747 = _2745 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2749 = _2729 * _2663;
    int _2751 = _2711 & 3;
    float _2753 = _2743 * _2617;
    float _2755 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2757 = _363 + _2755;
    float _2759 = _2747 * _2679;
    float _2761 = _2709 * _2701;
    float _2763 = -_2725;
    float _2765 = _2763 + 1.0;
    float _2767 = fma(_2753, _2757, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2769 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2771 = isnan(_363);
    bool _2773 = _2769 || _2771;
    bool _2775 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2777 = _2773 || _2775;
    float _2779 = float(_2777);
    float _2781 = fma(_2759, _2439, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _2783 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2785 = isnan(_363);
    bool _2787 = _2783 || _2785;
    bool _2789 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2791 = _2787 || _2789;
    float _2793 = float(_2791);
    float _2795 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2797 = _363 + _2795;
    int _2799 = _2419 >> 31;
    float _2801 = _2779 * _2765;
    float _2803 = -_2779;
    float _2805 = _2803 + 1.0;
    bool _2807 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2809 = isnan(_363);
    bool _2811 = _2807 || _2809;
    bool _2813 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2815 = _2811 || _2813;
    float _2817 = float(_2815);
    float _2819 = fma(_2761, _2797, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    int _2821 = _2799 & 3;
    float _2823 = -_2793;
    float _2825 = _2823 + 1.0;
    float _2827 = _2793 * _2805;
    bool _2829 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2831 = isnan(_363);
    bool _2833 = _2829 || _2831;
    bool _2835 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2837 = _2833 || _2835;
    float _2839 = float(_2837);
    float _2841 = -_2817;
    float _2843 = _2841 + 1.0;
    float _2845 = _2817 * _2825;
    int _2847 = _2529 + _2751;
    float _2849 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2851 = _2849 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    int _2853 = _2419 + _2821;
    float _2855 = _2839 * _2843;
    bool _2857 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2859 = isnan(_363);
    bool _2861 = _2857 || _2859;
    bool _2863 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2865 = _2861 || _2863;
    float _2867 = float(_2865);
    float _2869 = -_2839;
    float _2871 = _2869 + 1.0;
    bool _2873 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2875 = isnan(_363);
    bool _2877 = _2873 || _2875;
    bool _2879 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2881 = _2877 || _2879;
    float _2883 = float(_2881);
    float _2885 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2887 = _363 + _2885;
    int _2889 = _2853 >> 2;
    float _2891 = -_2867;
    float _2893 = _2891 + 1.0;
    int _2895 = _2847 >> 2;
    float _2897 = _2867 * _2871;
    int _2899 = _2889 << 4;
    int _2901 = _2899 + 368;
    float _2903 = _2883 * _2893;
    int _2905 = _2895 << 4;
    int _2907 = _2905 + 512;
    uint _2909 = uint(int(uint(_2901) >> uint(2)));
    uint _2911 = uint(int(uint(int(_2909)) >> uint(2)));
    int _2913 = int(_2909) & 3;
    float _2915 = (*spvDescriptorSet0.vp_c9)._m0[int(_2911)][_2913];
    int _2917 = int(_2909) + 1;
    uint _2919 = uint(int(uint(_2917) >> uint(2)));
    int _2921 = _2917 & 3;
    float _2923 = (*spvDescriptorSet0.vp_c9)._m0[int(_2919)][_2921];
    float _2925 = _2767 * _2903;
    float _2927 = -_2883;
    float _2929 = _2927 + 1.0;
    float _2931 = fma(_2929, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2925);
    uint _2933 = uint(int(uint(_2907) >> uint(2)));
    uint _2935 = uint(int(uint(int(_2933)) >> uint(2)));
    int _2937 = int(_2933) & 3;
    float _2939 = (*spvDescriptorSet0.vp_c9)._m0[int(_2935)][_2937];
    int _2941 = int(_2933) + 1;
    uint _2943 = uint(int(uint(_2941) >> uint(2)));
    int _2945 = _2941 & 3;
    float _2947 = (*spvDescriptorSet0.vp_c9)._m0[int(_2943)][_2945];
    float _2949 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2951 = _2949 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2953 = fma(_2781, _2897, _2931);
    float _2955 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2957 = _2955 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2959 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2961 = _363 + _2959;
    int _2963 = abs(_2607);
    float _2965 = fma(_2735, _2855, _2953);
    int _2967 = ~_2637;
    int _2969 = _2967 + _2733;
    int _2971 = _2969 + 1;
    float _2973 = 1.0 / _2951;
    int _2975 = _2901 + 8;
    uint _2977 = uint(int(uint(_2975) >> uint(2)));
    uint _2979 = uint(int(uint(int(_2977)) >> uint(2)));
    int _2981 = int(_2977) & 3;
    float _2983 = (*spvDescriptorSet0.vp_c9)._m0[int(_2979)][_2981];
    int _2985 = int(_2977) + 1;
    uint _2987 = uint(int(uint(_2985) >> uint(2)));
    int _2989 = _2985 & 3;
    float _2991 = (*spvDescriptorSet0.vp_c9)._m0[int(_2987)][_2989];
    float _2993 = fma(_2749, _2961, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2995 = fma(_2819, _2845, _2965);
    int _2997 = _1611 * _2971;
    int _2999 = _2997 + _1933;
    bool _3001 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _3003 = isnan(_363);
    bool _3005 = _3001 || _3003;
    bool _3007 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _3009 = _3005 || _3007;
    float _3011 = float(_3009);
    float _3013 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3015 = _363 + _3013;
    float _3017 = fma(_2993, _2827, _2995);
    float _3019 = 1.0 / _2957;
    int _3021 = _2907 + 8;
    uint _3023 = uint(int(uint(_3021) >> uint(2)));
    uint _3025 = uint(int(uint(int(_3023)) >> uint(2)));
    int _3027 = int(_3023) & 3;
    float _3029 = (*spvDescriptorSet0.vp_c9)._m0[int(_3025)][_3027];
    int _3031 = int(_3023) + 1;
    uint _3033 = uint(int(uint(_3031) >> uint(2)));
    int _3035 = _3031 & 3;
    float _3037 = (*spvDescriptorSet0.vp_c9)._m0[int(_3033)][_3035];
    bool _3039 = !_1907;
    int _3041 = _3039 ? _2999 : (-1);
    bool _3043 = _407 > 0.5;
    int _3045 = abs(_2545);
    float _3047 = _2851 * _2973;
    float _3049 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3051 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _3049;
    float _3053 = -_181;
    int _3055 = _2699 ? as_type<int>(_3053) : as_type<int>(_181);
    bool _3057 = _409 > 0.5;
    float _3059 = fma(_3047, _2887, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _3061 = ~_3045;
    int _3063 = _3061 + 1;
    int _3065 = _3063 + 1;
    float _3067 = -_3011;
    float _3069 = _3067 + 1.0;
    float _3071 = _3051 * _3019;
    int _3073 = abs(_2645);
    float _3075 = fma(_3059, _2801, _3017);
    int _3077 = ~_2963;
    int _3079 = _3077 + 1;
    int _3081 = _3079 + 1;
    float _3083 = fma(_3071, _3015, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _3085 = abs(_2585);
    float _3087 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3089 = int(_3087);
    int _3091 = _3065 * as_type<int>(_2923);
    int _3093 = abs(_2687);
    float _3095 = _2725 * _3069;
    int _3097 = ~_3073;
    int _3099 = _3097 + 1;
    int _3101 = _3099 + 1;
    int _3103 = abs(_2553);
    float _3105 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3107 = int(_3105);
    int _3109 = abs(_2611);
    int _3111 = _3081 * as_type<int>(_2947);
    int _3113 = _3101 * as_type<int>(_2915);
    int _3115 = _3113 + _3091;
    float _3117 = _971 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3119 = ~_3085;
    int _3121 = _3119 + 1;
    int _3123 = _3121 + 1;
    float _3125 = abs(_899);
    float _3127 = log2(_3125);
    float _3129 = float(uint(_3089));
    float _3131 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3117);
    int _3133 = ~_3103;
    int _3135 = _3133 + 1;
    int _3137 = _3135 + 1;
    int _3139 = _3123 * as_type<int>(_2939);
    int _3141 = _3139 + _3111;
    int _3143 = ~_3093;
    int _3145 = _3143 + 1;
    int _3147 = _3145 + 1;
    float _3149 = fma(_3083, _3095, _3075);
    int _3151 = ~_3109;
    int _3153 = _3151 + 1;
    int _3155 = _3153 + 1;
    int _3157 = _3137 * as_type<int>(_2983);
    int _3159 = _3157 + _3115;
    float _3161 = 1.0 / _3129;
    float _3163 = float(uint(_3107));
    int _3165 = _3147 * as_type<int>(_3029);
    int _3167 = _3165 + _3141;
    int _3169 = abs(_2571);
    int _3171 = _3155 * as_type<int>(_2991);
    int _3173 = _3171 + _3159;
    int _3175 = abs(_2697);
    float _3177 = fma(_3011, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3149);
    int _3179 = ~_3169;
    int _3181 = _3179 + 1;
    int _3183 = _3181 + 1;
    float _3185 = 1.0 / _3163;
    int _3187 = abs(_3089);
    float _3189 = _3127 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _3191 = abs(_2649);
    int _3193 = _3173 * _3183;
    int _3195 = ~_3175;
    int _3197 = _3195 + 1;
    int _3199 = _3197 + 1;
    float _3201 = _957 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3203 = abs(_3107);
    int _3205 = _2577 * _3169;
    int _3207 = _3205 + _3193;
    float _3209 = float(uint(_3187));
    int _3211 = _3199 * as_type<int>(_3037);
    int _3213 = _3211 + _3167;
    int _3215 = ~_3191;
    int _3217 = _3215 + 1;
    int _3219 = _3217 + 1;
    float _3221 = _957 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3223 = float(uint(_3203));
    float _3225 = _957 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3227 = 1.0 / _3209;
    int _3229 = _3213 * _3219;
    int _3231 = as_type<int>(_3161) + (-2);
    float _3233 = -_947;
    float _3235 = fma(_3233, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3201);
    float _3237 = float(uint(_3207));
    float _3239 = -_947;
    float _3241 = fma(_3239, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3221);
    float _3243 = -_947;
    float _3245 = fma(_3243, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3225);
    int _3247 = _3041 * _3191;
    int _3249 = _3247 + _3229;
    float _3251 = 1.0 / _3223;
    float _3253 = as_type<float>(_3231) * _3237;
    int _3255 = as_type<int>(_3185) + (-2);
    out.m_74.x = _3177;
    float _3257 = float(uint(_3249));
    int _3259 = abs(_3207);
    float _3261 = exp2(_3189);
    float _3263 = as_type<float>(_3255) * _3257;
    int _3265 = abs(_3249);
    int _3267 = as_type<int>(_3227) + (-2);
    float _3269 = trunc(_3253);
    float _3271 = precise::max(_3269, 0.0);
    uint _3273 = uint(_3271);
    float _3275 = float(uint(_3259));
    int _3277 = as_type<int>(_3251) + (-2);
    float _3279 = as_type<float>(_3267) * _3275;
    int _3281 = ~_3089;
    int _3283 = _3281 + 1;
    float _3285 = fma(_3261, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3287 = precise::clamp(_3285, 0.0, 1.0);
    float _3289 = float(uint(_3265));
    float _3291 = trunc(_3263);
    float _3293 = precise::max(_3291, 0.0);
    uint _3295 = uint(_3293);
    float _3297 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3235);
    float _3299 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3241);
    float _3301 = _971 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3303 = as_type<float>(_3277) * _3289;
    float _3305 = _971 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3307 = _3283 * int(_3273);
    int _3309 = _3307 + _3207;
    float _3311 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3301);
    float _3313 = trunc(_3279);
    float _3315 = precise::max(_3313, 0.0);
    uint _3317 = uint(_3315);
    float _3319 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3305);
    int _3321 = ~_3187;
    int _3323 = _3321 + 1;
    float _3325 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3245);
    float _3327 = float(uint(_3309));
    int _3329 = ~_3107;
    int _3331 = _3329 + 1;
    float _3333 = trunc(_3303);
    float _3335 = precise::max(_3333, 0.0);
    uint _3337 = uint(_3335);
    float _3339 = as_type<float>(_3231) * _3327;
    int _3341 = _3331 * int(_3295);
    int _3343 = _3341 + _3249;
    int _3345 = ~_3203;
    int _3347 = _3345 + 1;
    float _3349 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _3351 = !_2657;
    float _3353 = _3351 ? _185 : as_type<float>(_2563);
    int _3355 = _3323 * int(_3317);
    int _3357 = _3355 + _3259;
    float _3359 = float(uint(_3343));
    float _3361 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3363 = trunc(_3339);
    float _3365 = precise::max(_3363, 0.0);
    uint _3367 = uint(_3365);
    float _3369 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3371 = float(uint(_3357));
    float _3373 = as_type<float>(_3255) * _3359;
    float _3375 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3311);
    int _3377 = _3347 * int(_3337);
    int _3379 = _3377 + _3265;
    float _3381 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3361);
    float _3383 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3349);
    float _3385 = trunc(_3373);
    float _3387 = precise::max(_3385, 0.0);
    uint _3389 = uint(_3387);
    float _3391 = -_185;
    int _3393 = _3043 ? as_type<int>(_3391) : as_type<int>(_185);
    float _3395 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3369);
    float _3397 = float(uint(_3379));
    float _3399 = as_type<float>(_3267) * _3371;
    float _3401 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3319);
    float _3403 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3131);
    float _3405 = as_type<float>(_3277) * _3397;
    bool _3407 = !_2661;
    float _3409 = _3407 ? _185 : as_type<float>(_3393);
    float _3411 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3413 = fma(_3287, -2.0, 3.0);
    float _3415 = trunc(_3405);
    float _3417 = precise::max(_3415, 0.0);
    uint _3419 = uint(_3417);
    float _3421 = _3287 * _3287;
    float _3423 = -_181;
    int _3425 = _3057 ? as_type<int>(_3423) : as_type<int>(_181);
    float _3427 = _3411 * _3297;
    bool _3429 = !_2739;
    float _3431 = _3429 ? _181 : as_type<float>(_3055);
    float _3433 = _3421 * _3413;
    bool _3435 = !_2667;
    float _3437 = _3435 ? _181 : as_type<float>(_3425);
    float _3439 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3441 = trunc(_3399);
    float _3443 = precise::max(_3441, 0.0);
    uint _3445 = uint(_3443);
    int _3447 = ~_3089;
    int _3449 = _3447 + 1;
    float _3451 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3381);
    float _3453 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3383);
    float _3455 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3395);
    int _3457 = int(_3273) + int(_3367);
    float _3459 = fma(_3439, _3375, _3427);
    int _3461 = ~_3107;
    int _3463 = _3461 + 1;
    out.m_76.x = _3375;
    out.m_76.y = _3403;
    out.m_76.z = _3401;
    int _3465 = int(_3295) + int(_3389);
    int _3467 = ~_3203;
    int _3469 = _3467 + 1;
    int _3471 = int(_3337) + int(_3419);
    int _3473 = _3449 * _3457;
    int _3475 = _3473 + _3207;
    int _3477 = int(_3317) + int(_3445);
    int _3479 = ~_3187;
    int _3481 = _3479 + 1;
    int _3483 = _3463 * _3465;
    int _3485 = _3483 + _3249;
    bool _3487 = uint(_3475) >= uint(_3089);
    int _3489 = _3481 * _3477;
    int _3491 = _3489 + _3259;
    bool _3493 = uint(_3485) >= uint(_3107);
    int _3495 = _3469 * _3471;
    int _3497 = _3495 + _3265;
    float _3499 = _1432 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3501 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3503 = !_3487;
    int _3505 = _3503 ? 0 : (-1);
    bool _3507 = !_3493;
    int _3509 = _3507 ? 0 : (-1);
    float _3511 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3499);
    bool _3513 = uint(_3497) >= uint(_3203);
    bool _3515 = uint(_3491) >= uint(_3187);
    float _3517 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3519 = _3207 ^ _3089;
    float _3521 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3511);
    int _3523 = ~_3457;
    int _3525 = _3523 + _3505;
    int _3527 = _3525 + 1;
    float _3529 = _2415 * _2559;
    bool _3531 = !_3515;
    int _3533 = _3531 ? 0 : (-1);
    float _3535 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3521);
    uint _3537 = uint(int(uint(_3519) >> uint(31)));
    int _3539 = _3089 * _3527;
    int _3541 = _3539 + _3207;
    int _3543 = ~_3465;
    int _3545 = _3543 + _3509;
    int _3547 = _3545 + 1;
    float _3549 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3551 = ~_3533;
    int _3553 = _3477 + _3551;
    int _3555 = _3553 + 1;
    float _3557 = _3451 + _3459;
    int _3559 = ~int(_3537);
    int _3561 = _3559 + 1;
    int _3563 = _3249 ^ _3107;
    int _3565 = _3107 * _3547;
    int _3567 = _3565 + _3249;
    bool _3569 = _3089 == 0;
    bool _3571 = !_3513;
    int _3573 = _3571 ? 0 : (-1);
    bool _3575 = _3107 == 0;
    bool _3577 = _3107 == 0;
    float _3579 = _3501 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3581 = _3555 ^ _3561;
    float _3583 = fma(_3411, _3411, 1.0);
    uint _3585 = uint(int(uint(_3563) >> uint(31)));
    float _3587 = _3549 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3589 = !_3569;
    int _3591 = _3589 ? _3541 : (-1);
    int _3593 = ~_3573;
    int _3595 = _3471 + _3593;
    int _3597 = _3595 + 1;
    bool _3599 = _3089 == 0;
    int _3601 = ~int(_3585);
    int _3603 = _3601 + 1;
    float _3605 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3607 = ~_3561;
    int _3609 = _3607 + _3581;
    int _3611 = _3609 + 1;
    bool _3613 = !_3575;
    int _3615 = _3613 ? _3567 : (-1);
    float _3617 = float(_3591);
    int _3619 = _3597 ^ _3603;
    float _3621 = rsqrt(_3583);
    float _3623 = float(_3615);
    float _3625 = fma(_3579, _3617, _459);
    float _3627 = _3431 + 0.5;
    int _3629 = ~_3603;
    int _3631 = _3629 + _3619;
    int _3633 = _3631 + 1;
    bool _3635 = !_3599;
    int _3637 = _3635 ? _3611 : (-1);
    float _3639 = fma(_3587, _3623, _799);
    float _3641 = fma(_3579, _3627, _3625);
    float _3643 = _3437 + 0.5;
    bool _3645 = !_3577;
    int _3647 = _3645 ? _3633 : (-1);
    float _3649 = _3517 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3651 = float(_3637);
    float _3653 = fma(_3587, _3643, _3639);
    float _3655 = float(_3647);
    float _3657 = _3605 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3659 = _3411 * _3621;
    float _3661 = -_455;
    float _3663 = fma(_3649, _3651, _3661);
    float _3665 = _3409 + (-0.5);
    float _3667 = -_803;
    float _3669 = fma(_3657, _3655, _3667);
    float _3671 = -_3451;
    float _3673 = _3659 * _3671;
    float _3675 = _3353 + (-0.5);
    float _3677 = -_3649;
    float _3679 = fma(_3677, _3665, _3663);
    float _3681 = -_3453;
    float _3683 = _3659 * _3681;
    float _3685 = fma(_3621, _3297, _3673);
    float _3687 = -_3657;
    float _3689 = fma(_3687, _3675, _3669);
    float _3691 = -_3455;
    float _3693 = _3659 * _3691;
    float _3695 = fma(_3621, _3299, _3683);
    float _3697 = _3411 * _3325;
    float _3699 = _3411 * _3299;
    float _3701 = fma(_3621, _3325, _3693);
    float _3703 = -_773;
    float _3705 = _3703 + 1.0;
    float _3707 = fma(_3439, _3401, _3697);
    float _3709 = fma(_3439, _3403, _3699);
    float _3711 = -_2471;
    float _3713 = fma(_3437, _3711, _3653);
    out.m_78.x = _3685;
    out.m_78.y = _3695;
    out.m_78.z = _3701;
    float _3715 = _3455 + _3707;
    float _3717 = -_3433;
    float _3719 = _3717 + 1.0;
    float _3721 = _3453 + _3709;
    float _3723 = -_3705;
    float _3725 = fma(_3431, _3723, _3641);
    float _3727 = fma(_3409, _2461, _3679);
    float _3729 = fma(_3719, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3433);
    float _3731 = fma(_3353, _2487, _3689);
    float _3733 = _3535 + _1482;
    out.m_80.x = _3557;
    out.m_80.y = _3721;
    out.m_80.z = _3715;
    bool _3735 = _899 <= 8000.0;
    bool _3737 = isnan(_899);
    bool _3739 = _3735 || _3737;
    bool _3741 = isnan(8000.0);
    bool _3743 = _3739 || _3741;
    float _3745 = float(_3743);
    out.m_82.x = _3725;
    out.m_82.y = _3727;
    out.m_82.z = _3713;
    out.m_82.w = _3731;
    float _3747 = _3733 * 0.5;
    float _3749 = _3733;
    float _3751 = _3747;
    float _3753 = _3535;
    if (!_1462)
    {
        _3749 = 1.0;
    }
    float _3755 = _3749;
    float _3757 = _3745 * _3729;
    float _3759 = _3755;
    if (_1462)
    {
        bool _3761 = _1574 >= _1564;
        bool _3763 = isnan(_1574);
        bool _3765 = _3761 || _3763;
        bool _3767 = isnan(_1564);
        bool _3769 = _3765 || _3767;
        float _3771 = float(_3769);
        _3759 = _3771;
    }
    float _3773 = _3759;
    float _3775 = _1587 * _2559;
    float _3777 = _3773 * _2153;
    float _3779 = fma(_2411, _3775, _1581);
    out.gl_Position.x = _1514;
    out.gl_Position.y = _1516;
    out.gl_Position.z = _3535;
    out.gl_Position.w = _1482;
    float _3781 = fma(_2413, _3775, _1583);
    float _3783 = _3757 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3785 = fma(_1587, _3529, _1585);
    out.m_84.z = _3747;
    out.m_84.w = _1482;
    bool _3787 = _2175 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3789 = isnan(_2175);
    bool _3791 = _3787 || _3789;
    bool _3793 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3795 = _3791 || _3793;
    float _3797 = _2493 * _3783;
    float _3799 = precise::clamp(_3797, 0.0, 1.0);
    float _3801 = -_3799;
    float _3803 = fma(_3801, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3805 = -_3777;
    float _3807 = fma(_3805, _3803, 1.0);
    float _3809 = precise::clamp(_3807, 0.0, 1.0);
    float _3811 = -_2547;
    float _3813 = _3811 + 1.0;
    float _3815 = _3809 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3817 = _1587 * _3813;
    float _3819 = _3809;
    float _3821 = _3813;
    if (!_3795)
    {
        _3819 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3823 = _3819;
    float _3825 = _3823;
    float _3827 = _3823;
    if (!_3795)
    {
        _3751 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3829 = _3751;
    out.m_86.x = _3815;
    float _3831 = _3829;
    float _3833 = _3829;
    if (!_3795)
    {
        _1492 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3835 = _1492;
    float _3837 = _3835;
    float _3839 = _3835;
    if (!_3795)
    {
        _3753 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3841 = _3753;
    out.m_88.x = _3779;
    out.m_88.y = _3781;
    out.m_88.z = _3785;
    out.m_88.w = _3817;
    float _3843 = _3841;
    float _3845 = _3841;
    if (!_3795)
    {
        _1518 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3847 = _1518;
    float _3849 = _3847;
    float _3851 = _3847;
    if (!_3795)
    {
        _3821 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3853 = _3821;
    bool _3855 = !_3795;
    float _3857 = _3853;
    float _3859 = _3853;
    if (!_3855)
    {
        bool _3861 = _2175 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3863 = isnan(_2175);
        bool _3865 = _3861 || _3863;
        bool _3867 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3869 = _3865 || _3867;
        if (!_3869)
        {
            float _3871 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3873 = _2175 + _3871;
            float _3875 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3877 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3875;
            float _3879 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3881 = _3879 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3883 = 1.0 / _3877;
            float _3885 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3887 = _3885 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3889 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3891 = _3889 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3893 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3895 = _3893 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3897 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3899 = _3897 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3901 = _3873 * _3883;
            float _3903 = precise::clamp(_3901, 0.0, 1.0);
            float _3905 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3907 = _3905 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3909 = fma(_3903, _3881, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3911 = fma(_3903, _3907, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3913 = fma(_3903, _3887, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3915 = fma(_3903, _3891, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3917 = fma(_3903, _3895, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3919 = fma(_3903, _3899, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3833 = _3913;
            _3851 = _3917;
            _3827 = _3909;
            _3845 = _3915;
            _3839 = _3911;
            _3859 = _3919;
            _3921 = true;
        }
        else
        {
            bool _3923 = _2175 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3925 = isnan(_2175);
            bool _3927 = _3923 || _3925;
            bool _3929 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3931 = _3927 || _3929;
            if (!_3931)
            {
                _3825 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3933 = _3825;
            _3827 = _3933;
            if (!_3931)
            {
                _3831 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3935 = _3831;
            _3833 = _3935;
            if (!_3931)
            {
                _3837 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3937 = _3837;
            _3839 = _3937;
            if (!_3931)
            {
                _3843 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3939 = _3843;
            _3845 = _3939;
            if (!_3931)
            {
                _3849 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3941 = _3849;
            _3851 = _3941;
            if (!_3931)
            {
                _3857 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3943 = _3857;
            bool _3945 = !_3931;
            _3859 = _3943;
            if (!_3945)
            {
                bool _3947 = _2175 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3949 = isnan(_2175);
                bool _3951 = _3947 || _3949;
                bool _3953 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3955 = _3951 || _3953;
                if (!_3955)
                {
                    float _3957 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3959 = _2175 + _3957;
                    float _3961 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3963 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3961;
                    float _3965 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3967 = _3965 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3969 = 1.0 / _3963;
                    float _3971 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3973 = _3971 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3975 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3977 = _3975 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3979 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3981 = _3979 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3983 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3985 = _3983 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3987 = _3959 * _3969;
                    float _3989 = precise::clamp(_3987, 0.0, 1.0);
                    float _3991 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3993 = _3991 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3995 = fma(_3989, _3967, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3997 = fma(_3989, _3993, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3999 = fma(_3989, _3973, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4001 = fma(_3989, _3977, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4003 = fma(_3989, _3981, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4005 = fma(_3989, _3985, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3833 = _3999;
                    _3851 = _4003;
                    _3827 = _3995;
                    _3845 = _4001;
                    _3839 = _3997;
                    _3859 = _4005;
                    _3921 = true;
                }
                else
                {
                    _3833 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3851 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3827 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3845 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3839 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3859 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3921 = false;
    float _4007 = _3833;
    float _4009 = _3851;
    float _4011 = _3827;
    float _4013 = _3845;
    float _4015 = _3839;
    float _4017 = _3859;
    float _4019 = fma(_3721, -0.5, 0.5);
    float _4021 = precise::clamp(_4019, 0.0, 1.0);
    float _4023 = -_4007;
    float _4025 = _4023 + _4009;
    float _4027 = -_4011;
    float _4029 = _4027 + _4013;
    float _4031 = -_4015;
    float _4033 = _4031 + _4017;
    bool _4035 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4037 = fma(_4021, _4025, _4007);
    float _4039 = fma(_4021, _4029, _4011);
    float _4041 = fma(_4021, _4033, _4015);
    float _4043 = _4037 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _4045 = fma(_4039, 0.298911988735198974609375, _4043);
    float _4047 = fma(_4041, 0.114477999508380889892578125, _4045);
    out.m_90.x = 0.0;
    float _4049 = -_4047;
    float _4051 = _4039 + _4049;
    float _4053 = -_4047;
    float _4055 = _4037 + _4053;
    float _4057 = -_4047;
    float _4059 = _4041 + _4057;
    float _4061 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4063 = fma(_4051, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4047);
    float _4065 = fma(_4055, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4047);
    float _4067 = fma(_4059, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4047);
    out.m_86.w = _4061;
    out.m_92.x = _4063;
    out.m_92.y = _4065;
    out.m_92.z = _4067;
    if (!_4035)
    {
        return out;
    }
    float _4069 = -_1366;
    float _4071 = _4069 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4073 = -_1368;
    float _4075 = _4073 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4077 = -_1370;
    float _4079 = _4077 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4081 = _4071 * _4071;
    float _4083 = fma(_4075, _4075, _4081);
    float _4085 = fma(_4079, _4079, _4083);
    float _4087 = sqrt(_4085);
    float _4089 = rsqrt(_4085);
    float _4091 = -_4087;
    float _4093 = _4091 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4095 = _4093 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4097 = precise::clamp(_4095, 0.0, 1.0);
    float _4099 = _4075 * _4089;
    float _4101 = _4071 * _4089;
    float _4103 = abs(_4097);
    float _4105 = log2(_4103);
    float _4107 = _4079 * _4089;
    float _4109 = _4099 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4111 = _3721 * _4101;
    float _4113 = -_4101;
    float _4115 = -_4109;
    float _4117 = fma(_4113, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4115);
    float _4119 = fma(_3557, _4099, _4111);
    float _4121 = -_4107;
    float _4123 = fma(_4121, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4117);
    float _4125 = fma(_3715, _4107, _4119);
    float _4127 = precise::clamp(_4125, 0.0, 1.0);
    float _4129 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4131 = _4123 + _4129;
    float _4133 = _4105 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4135 = _4131 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4137 = precise::clamp(_4135, 0.0, 1.0);
    float _4139 = exp2(_4133);
    float _4141 = _4139 * _4137;
    float _4143 = _4127 * _4141;
    float _4145 = _4143 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4147 = _4143 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4149 = _4143 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _4145;
    out.m_90.y = _4147;
    out.m_90.z = _4149;
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
    bool _3921 = false;
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
        float _4206 = as_type<float>(_127);
        out.gl_Position.z = _4206;
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
        float _4276 = as_type<float>(_165);
        out.gl_Position.z = _4276;
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
    float2 _4661 = float2(_397, _401);
    float _403 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4661, float2(0.0), isnan(_4661)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4661, float2(0.0), isnan(_4661)), level(0.0)).x;
    float _405 = in.m_66.x;
    float _407 = in.m_66.y;
    float _409 = in.m_66.z;
    float _411 = in.m_66.w;
    float _413 = _367 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _415 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _417 = log2(_415);
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _423 = _421 != 0;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _427 = float(_111);
    float _429 = _417 * _145;
    float _431 = 1.0 / _427;
    float _433 = _407 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _435 = _407 * 2.0;
    float _437 = _405 * 2.0;
    float _439 = _405 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _441 = fma(_433, -2.0, _419);
    float _443 = _409 * 2.0;
    float _445 = floor(_437);
    float _447 = -_425;
    float _449 = fma(_439, 2.0, _447);
    float _451 = _405 + _407;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _455 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _441);
    float _457 = -_145;
    float _459 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[76].x, _449);
    float _461 = floor(_435);
    float _463 = _451 + (-1.0);
    float _465 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].x, _413);
    float _467 = _409 + _407;
    int _469 = as_type<int>(_365);
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_423)
    {
        _469 = 0;
    }
    int _473 = _469;
    float _475 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _477 = _473;
    if (!_423)
    {
        _477 = 1;
    }
    int _479 = _477;
    float _481 = _467 + (-1.0);
    float _483 = floor(_443);
    bool _485 = _445 >= 0.0;
    bool _487 = isnan(_445);
    bool _489 = _485 || _487;
    bool _491 = isnan(0.0);
    bool _493 = _489 || _491;
    float _495 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[5].z, _465);
    bool _497 = _445 > 0.0;
    float _499 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _501 = _493 ? 0 : 1;
    bool _503 = _479 != 1;
    float _505 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _507 = int(_505);
    bool _509 = _461 > 0.0;
    bool _511 = _461 >= 0.0;
    bool _513 = isnan(_461);
    bool _515 = _511 || _513;
    bool _517 = isnan(0.0);
    bool _519 = _515 || _517;
    int _521 = ~_501;
    int _523 = _521 + 1;
    int _525 = _523 + 1;
    float _527 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _529 = int(_527);
    bool _531 = _483 > 0.0;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _535 = _483 >= 0.0;
    bool _537 = isnan(_483);
    bool _539 = _535 || _537;
    bool _541 = isnan(0.0);
    bool _543 = _539 || _541;
    int _545 = _519 ? 0 : 1;
    int _547 = _543 ? 0 : 1;
    float _549 = exp2(_429);
    int _551 = ~_545;
    int _553 = _551 + 1;
    int _555 = _553 + 1;
    int _557 = _555;
    float _559 = as_type<float>(_479);
    int _561 = _525;
    float _563 = as_type<float>(_507);
    float _565 = as_type<float>(_529);
    if (!_509)
    {
        int _567 = ~_545;
        int _569 = _567 + 1;
        _557 = _569;
    }
    int _571 = _557;
    int _573 = ~_547;
    int _575 = _573 + 1;
    int _577 = _575 + 1;
    int _579 = _577;
    if (!_531)
    {
        int _581 = ~_547;
        int _583 = _581 + 1;
        _579 = _583;
    }
    int _585 = _579;
    int _587 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _589 = _587 != 0;
    int _591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _593 = _591 != 0;
    int _595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _597 = _595 != 0;
    if (!_503)
    {
        _559 = _407;
    }
    float _599 = _559;
    float _601 = _599;
    if (_503)
    {
        _601 = _405;
    }
    float _603 = _601;
    bool _605 = !_593;
    int _607 = _605 ? 0 : 1;
    float _609 = -_549;
    float _611 = _609 + 1.0;
    bool _613 = !_589;
    int _615 = _613 ? 0 : 1;
    float _617 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[83].z, _533);
    bool _619 = !_597;
    int _621 = _619 ? 0 : 1;
    int _623 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _625 = _623 != 0;
    int _627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _629 = _627 != 0;
    int _631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _633 = _631 != 0;
    float _635 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _617);
    float _637 = float(_507);
    if (!_497)
    {
        int _639 = ~_501;
        int _641 = _639 + 1;
        _561 = _641;
    }
    int _643 = _561;
    bool _645 = !_629;
    float _647 = _645 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _649 = 1.0 / _637;
    float _651 = float(_529);
    int _653 = abs(as_type<int>(_647));
    float _655 = _647;
    if (!_503)
    {
        _563 = _409;
    }
    float _657 = _563;
    float _659 = _657;
    if (!_503)
    {
        _655 = _409;
    }
    float _661 = _655;
    float _663 = 1.0 / _651;
    float _665 = _661;
    if (!_503)
    {
        _565 = _407;
    }
    float _667 = _565;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _671 = _667;
    if (_503)
    {
        _659 = _407;
    }
    float _673 = _659;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (_503)
    {
        _665 = _407;
    }
    float _677 = _665;
    float _679 = _649 * _145;
    if (_503)
    {
        _671 = _405;
    }
    float _681 = _671;
    float _683 = _673 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _685 = float(_643);
    float _687 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[83].w, _453);
    float _689 = float(_653);
    float _691 = _681 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _693 = fma(_683, -2.0, _675);
    float _695 = _689 * _685;
    float _697 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[78].z, _669);
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _701 = _495 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _705 = !_625;
    int _707 = _705 ? 0 : 1;
    float _709 = -_699;
    float _711 = fma(_691, 2.0, _709);
    float _713 = _701 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _715 = in.m_68.x;
    float _717 = in.m_68.y;
    float _719 = in.m_68.z;
    float _721 = _701 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _723 = fma(_383, (*spvDescriptorSet0.vp_c8)._m0[11].x, _713);
    float _725 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[78].w, _703);
    float _727 = fma(_383, (*spvDescriptorSet0.vp_c8)._m0[10].x, _721);
    float _729 = _431 * _145;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _733 = 1.0 + _731;
    float _735 = fma(_385, (*spvDescriptorSet0.vp_c8)._m0[11].z, _723);
    float _737 = fma(_385, (*spvDescriptorSet0.vp_c8)._m0[10].z, _727);
    float _739 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _725);
    float _741 = 1.0 / _733;
    float _743 = _735 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _745 = _695 * (-2.0);
    float _747 = _737 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _749 = abs(_707);
    float _751 = _663 * _145;
    bool _753 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _755 = isnan(1.0);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _761 = _757 || _759;
    float _763 = fma(_499, _745, _499);
    float _765 = _747 + _743;
    bool _767 = !_633;
    int _769 = _767 ? 0 : 1;
    float _771 = 1.0 / _743;
    float _773 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _697);
    int _775 = abs(_769);
    float _777 = fma(_745, _717, _717);
    float _779 = float(_571);
    float _781 = _407 + (-0.5);
    bool _783 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _785 = isnan(0.0);
    bool _787 = _783 || _785;
    bool _789 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _791 = _787 || _789;
    float _793 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _687);
    float _795 = float(_775);
    float _797 = -_145;
    float _799 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[81].x, _711);
    float _801 = float(_749);
    float _803 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _693);
    float _805 = float(_585);
    float _807 = _795 * _779;
    float _809 = _791 ? _611 : 0.0;
    float _811 = fma(_781, (*spvDescriptorSet0.vp_c9)._m0[196].y, _777);
    float _813 = _801 * _805;
    float _815 = _765 * _771;
    float _817 = _815 * 0.5;
    float _819 = in.m_70.x;
    float _821 = in.m_70.y;
    if (_761)
    {
        float _823 = _809 * _741;
        _147 = _823;
    }
    float _825 = _147;
    float _827 = _813 * (-2.0);
    float _829 = _405 + (-0.5);
    float _831 = fma(_763, _825, _811);
    float _833 = _409 + _405;
    float _835 = fma(_827, _715, _715);
    float _837 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _839 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[30].w, _837);
    float _841 = _807 * (-2.0);
    float _843 = _833 + (-1.0);
    float _845 = fma(_475, _827, _475);
    float _847 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[196].x, _835);
    float _849 = fma(_841, _719, _719);
    float _851 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _853 = _409 + (-0.5);
    float _855 = 1.0 / _839;
    float _857 = fma(_845, _825, _847);
    float _859 = fma(_851, _841, _851);
    float _861 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[196].z, _849);
    float _863 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _865 = _857 * 0.15915493667125701904296875;
    float _867 = _831 * 0.15915493667125701904296875;
    float _869 = fma(_859, _825, _861);
    float _871 = _331 * _819;
    float _873 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _875 = _865 * 6.283185482025146484375;
    float _877 = sin(_875);
    float _879 = _869 * 0.15915493667125701904296875;
    float _881 = _871 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _883 = _701 + _863;
    float _885 = _333 * _821;
    float _887 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _889 = _881 * _873;
    float _891 = _883 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _893 = _867 * 6.283185482025146484375;
    float _895 = sin(_893);
    float _897 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _899 = _855 * _897;
    float _901 = _883 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _903 = fma(_383, (*spvDescriptorSet0.vp_c15)._m0[126].x, _891);
    float _905 = _885 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _907 = _899 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _909 = fma(_385, (*spvDescriptorSet0.vp_c15)._m0[126].z, _903);
    float _911 = _867 * 6.283185482025146484375;
    float _913 = cos(_911);
    bool _915 = _899 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _917 = fma(_383, (*spvDescriptorSet0.vp_c15)._m0[127].x, _901);
    float _919 = _905 * _887;
    float _921 = _909 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _923 = fma(_385, (*spvDescriptorSet0.vp_c15)._m0[127].z, _917);
    float _925 = _865 * 6.283185482025146484375;
    float _927 = cos(_925);
    float _929 = _877 * _895;
    float _931 = _923 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _933 = 2;
    float _935 = _883;
    if (!_907)
    {
        _933 = 1;
    }
    int _937 = _933;
    float _939 = _879 * 6.283185482025146484375;
    float _941 = cos(_939);
    float _943 = _877 * _913;
    float _945 = _879 * 6.283185482025146484375;
    float _947 = sin(_945);
    float _949 = _927 * _913;
    float _951 = _927 * _895;
    float _953 = _877 * _941;
    float _955 = _913 * _941;
    float _957 = _927 * _941;
    float _959 = _895 * _941;
    bool _961 = !_907;
    int _963 = _961 ? 0 : 1;
    float _965 = trunc(_921);
    int _967 = int(_965);
    float _969 = _953 * _919;
    float _971 = fma(_947, _949, _929);
    int _973 = _937;
    if (!_915)
    {
        _973 = _963;
    }
    int _975 = _973;
    float _977 = fma(_947, _929, _949);
    float _979 = -_919;
    float _981 = _947 * _979;
    float _983 = _957 * _919;
    float _985 = trunc(_931);
    int _987 = int(_985);
    int _989 = _975 << 6;
    float _991 = -_951;
    float _993 = fma(_947, _943, _991);
    float _995 = fma(_955, _889, _981);
    float _997 = fma(_971, _889, _983);
    float _999 = -_943;
    float _1001 = fma(_947, _951, _999);
    int _1003 = _989 + 96;
    uint _1006 = uint(int(uint(_1003) >> uint(2)));
    uint _1008 = uint(int(uint(int(_1006)) >> uint(2)));
    int _1010 = int(_1006) & 3;
    float _1012 = (*spvDescriptorSet0.vp_c15)._m0[int(_1008)][_1010];
    int _1014 = int(_1006) + 1;
    uint _1016 = uint(int(uint(_1014) >> uint(2)));
    int _1018 = _1014 & 3;
    float _1020 = (*spvDescriptorSet0.vp_c15)._m0[int(_1016)][_1018];
    float _1022 = fma(_993, _889, _969);
    float _1024 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1026 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1028 = _967 + _1026;
    int _1030 = _1028 + 1;
    float _1032 = fma(_959, _1024, _995);
    float _1034 = fma(_1001, _1024, _997);
    int _1036 = _989 + 64;
    uint _1038 = uint(int(uint(_1036) >> uint(2)));
    uint _1040 = uint(int(uint(int(_1038)) >> uint(2)));
    int _1042 = int(_1038) & 3;
    float _1044 = (*spvDescriptorSet0.vp_c15)._m0[int(_1040)][_1042];
    int _1046 = int(_1038) + 1;
    uint _1048 = uint(int(uint(_1046) >> uint(2)));
    int _1050 = _1046 & 3;
    float _1052 = (*spvDescriptorSet0.vp_c15)._m0[int(_1048)][_1050];
    float _1054 = fma(_977, _1024, _1022);
    int _1056 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1058 = _987 + _1056;
    int _1060 = _1058 + 1;
    float _1062 = _1034 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1064 = _1034 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1066 = _1030 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1068 = _1034 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1070 = _1030 | _1060;
    int _1072 = _989 + 104;
    uint _1074 = uint(int(uint(_1072) >> uint(2)));
    uint _1076 = uint(int(uint(int(_1074)) >> uint(2)));
    int _1078 = int(_1074) & 3;
    float _1080 = (*spvDescriptorSet0.vp_c15)._m0[int(_1076)][_1078];
    int _1082 = int(_1074) + 1;
    uint _1084 = uint(int(uint(_1082) >> uint(2)));
    int _1086 = _1082 & 3;
    float _1088 = (*spvDescriptorSet0.vp_c15)._m0[int(_1084)][_1086];
    float _1090 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1062);
    float _1092 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1064);
    bool _1094 = _1070 < 0;
    bool _1096 = _1094 || _1066;
    float _1098 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1068);
    float _1100 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1090);
    float _1102 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1092);
    bool _1104 = _1060 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1106 = _1104 || _1096;
    int _1108 = _989 + 72;
    uint _1110 = uint(int(uint(_1108) >> uint(2)));
    uint _1112 = uint(int(uint(int(_1110)) >> uint(2)));
    int _1114 = int(_1110) & 3;
    float _1116 = (*spvDescriptorSet0.vp_c15)._m0[int(_1112)][_1114];
    int _1118 = int(_1110) + 1;
    uint _1120 = uint(int(uint(_1118) >> uint(2)));
    int _1122 = _1118 & 3;
    float _1124 = (*spvDescriptorSet0.vp_c15)._m0[int(_1120)][_1122];
    float _1126 = _1100 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1128 = _1102 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1130 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1098);
    float _1132 = _385 + _1126;
    float _1134 = _383 + _1128;
    int _1136 = _989 + 48;
    uint _1138 = uint(int(uint(_1136) >> uint(2)));
    uint _1140 = uint(int(uint(int(_1138)) >> uint(2)));
    int _1142 = int(_1138) & 3;
    float _1144 = (*spvDescriptorSet0.vp_c15)._m0[int(_1140)][_1142];
    int _1146 = int(_1138) + 1;
    uint _1148 = uint(int(uint(_1146) >> uint(2)));
    int _1150 = _1146 & 3;
    float _1152 = (*spvDescriptorSet0.vp_c15)._m0[int(_1148)][_1150];
    float _1154 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1156 = _1132 + _1154;
    int _1158 = _1030;
    float _1160 = _1054;
    float _1162 = _1134;
    float _1164 = _1132;
    if (!_1106)
    {
        int _1166 = _1060 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1168 = _1166 + _1030;
        _1158 = _1168;
    }
    int _1170 = _1158;
    float _1172 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1174 = _1134 + _1172;
    float _1176 = _1156 * _1156;
    float _1178 = 0.0;
    float _1180 = as_type<float>(_1170);
    if (!_1106)
    {
        float _1182 = floor(_921);
        _1178 = _1182;
    }
    float _1184 = _1178;
    int _1186 = _989 + 56;
    uint _1188 = uint(int(uint(_1186) >> uint(2)));
    uint _1190 = uint(int(uint(int(_1188)) >> uint(2)));
    int _1192 = int(_1188) & 3;
    float _1194 = (*spvDescriptorSet0.vp_c15)._m0[int(_1190)][_1192];
    int _1196 = int(_1188) + 1;
    uint _1198 = uint(int(uint(_1196) >> uint(2)));
    int _1200 = _1196 & 3;
    float _1202 = (*spvDescriptorSet0.vp_c15)._m0[int(_1198)][_1200];
    int _1204 = 0;
    if (!_1106)
    {
        int _1206 = _1170 << 2;
        _1204 = _1206;
    }
    int _1208 = _1204;
    float _1210 = fma(_1174, _1174, _1176);
    int _1212 = 0;
    int _1214 = _1208;
    if (!_1106)
    {
        uint _1216 = uint(int(uint(_1170) >> uint(2)));
        _1212 = int(_1216);
    }
    int _1218 = _1212;
    int _1220 = _1218;
    if (!_1106)
    {
        int _1222 = 12 & _1208;
        _1214 = _1222;
    }
    int _1224 = _1214;
    float _1226 = sqrt(_1210);
    int _1228 = _989 + 80;
    uint _1230 = uint(int(uint(_1228) >> uint(2)));
    uint _1232 = uint(int(uint(int(_1230)) >> uint(2)));
    int _1234 = int(_1230) & 3;
    float _1236 = (*spvDescriptorSet0.vp_c15)._m0[int(_1232)][_1234];
    int _1238 = int(_1230) + 1;
    uint _1240 = uint(int(uint(_1238) >> uint(2)));
    int _1242 = _1238 & 3;
    float _1244 = (*spvDescriptorSet0.vp_c15)._m0[int(_1240)][_1242];
    float _1246 = _883 * _1020;
    if (!_1106)
    {
        int _1248 = _1218 << 4;
        int _1250 = _1248 + _1224;
        _1220 = _1250;
    }
    int _1252 = _1220;
    float _1254 = fma(_383, _1012, _1246);
    float _1256 = _1130 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1258 = _883 * _1052;
    float _1260 = fma(_383, _1044, _1258);
    bool _1262 = _1226 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1264 = fma(_385, _1080, _1254);
    int _1266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1268 = _1266 != 0;
    int _1270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1272 = _1270 != 0;
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1276 = _1274 != 0;
    int _1278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1280 = _1278 != 0;
    float _1282 = _1264 + _1088;
    float _1284 = fma(_385, _1116, _1260);
    bool _1286 = !_1272;
    int _1288 = _1286 ? 0 : 1;
    float _1290 = 1.0 / _1282;
    bool _1292 = !_1268;
    int _1294 = _1292 ? 0 : 1;
    float _1296 = _1284 + _1124;
    float _1298 = _701 + _1256;
    bool _1300 = !_1276;
    int _1302 = _1300 ? 0 : 1;
    float _1304 = _883 * _1152;
    bool _1306 = !_1280;
    int _1308 = _1306 ? 0 : 1;
    float _1310 = _1282;
    float _1312 = _1226;
    float _1314 = as_type<float>(_1252);
    if (!_1262)
    {
        _1160 = _1298;
    }
    float _1316 = _1160;
    float _1318 = fma(_383, _1144, _1304);
    float _1320 = fma(_385, _1194, _1318);
    float _1322 = _1320 + _1202;
    bool _1324 = !_1262;
    float _1326 = _1316;
    if (!_1324)
    {
        float _1328 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1330 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1332 = _1226 + _1330;
        float _1334 = _1298 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1336 = rsqrt(_1210);
        float _1338 = _1332 * _1328;
        float _1340 = _1338 * 0.15915493667125701904296875;
        float _1342 = _1340 * 6.283185482025146484375;
        float _1344 = cos(_1342);
        float _1346 = _1340 * 6.283185482025146484375;
        float _1348 = sin(_1346);
        float _1350 = _1344 + (-1.0);
        float _1352 = fma(_1348, _1334, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1354 = _1350 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1356 = _1336 * _1352;
        float _1358 = fma(_1298, _1344, _1354);
        float _1360 = fma(_1174, _1356, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1362 = fma(_1156, _1356, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1310 = _1340;
        _1326 = _1358;
        _1162 = _1360;
        _1164 = _1362;
        _1312 = _1332;
    }
    float _1364 = _1310;
    float _1366 = _1326;
    float _1368 = _1162;
    float _1370 = _1164;
    float _1372 = _1312;
    float _1374 = _1364;
    float _1376 = _1372;
    if (!_1106)
    {
        int _1378 = _1252 + 400;
        uint _1380 = uint(int(uint(_1378) >> uint(2)));
        uint _1382 = uint(int(uint(int(_1380)) >> uint(2)));
        int _1384 = int(_1380) & 3;
        float _1386 = (*spvDescriptorSet0.vp_c15)._m0[int(_1382)][_1384];
        _1374 = _1386;
    }
    float _1388 = _1374;
    float _1390 = _1322 * _1290;
    float _1392 = _1366 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1394 = _1366 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1396 = _1366 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1398 = _1366 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1400 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1392);
    float _1402 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1394);
    int _1404 = _989 + 88;
    uint _1406 = uint(int(uint(_1404) >> uint(2)));
    uint _1408 = uint(int(uint(int(_1406)) >> uint(2)));
    int _1410 = int(_1406) & 3;
    float _1412 = (*spvDescriptorSet0.vp_c15)._m0[int(_1408)][_1410];
    int _1414 = int(_1406) + 1;
    uint _1416 = uint(int(uint(_1414) >> uint(2)));
    int _1418 = _1414 & 3;
    float _1420 = (*spvDescriptorSet0.vp_c15)._m0[int(_1416)][_1418];
    float _1422 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1396);
    float _1424 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1400);
    bool _1426 = _1390 >= 0.0;
    float _1428 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1402);
    float _1430 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1422);
    float _1432 = _1424 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1434 = _1296 * _1290;
    bool _1436 = _1390 <= 1.0;
    bool _1438 = _1436 && _1426;
    float _1440 = _1428 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1442 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1398);
    float _1444 = _1430 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1446 = _1432 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1448 = _1434 >= 0.0;
    bool _1450 = _1448 && _1438;
    float _1452 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1454 = _1440 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1456 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1442);
    float _1458 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1446);
    bool _1460 = _1434 <= 1.0;
    bool _1462 = _1460 && _1450;
    float _1464 = -_1454;
    float _1466 = fma(_1464, _1452, 1.0);
    float _1468 = _1456 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1470 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1458);
    float _1472 = _1088;
    if (!_1106)
    {
        float _1474 = floor(_931);
        _1472 = _1474;
    }
    float _1476 = _1472;
    float _1478 = _1432 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1480 = _1432 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1482 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1470);
    float _1484 = _883 * _1244;
    float _1486 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1478);
    float _1488 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1480);
    float _1490 = log2(_1466);
    float _1492 = _1482;
    if (_1462)
    {
        float _1494 = float(_975);
        _1314 = _1494;
    }
    float _1496 = _1314;
    float _1498 = fma(_383, _1236, _1484);
    float _1500 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1486);
    float _1502 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1488);
    float _1504 = 1.0 / _1482;
    float _1506 = _1476;
    if (!_1106)
    {
        float _1508 = -_1476;
        float _1510 = _931 + _1508;
        _1376 = _1510;
    }
    float _1512 = _1376;
    float _1514 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1500);
    float _1516 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1502);
    float _1518 = _1516;
    if (!_1106)
    {
        float _1520 = -_1184;
        float _1522 = _921 + _1520;
        _1506 = _1522;
    }
    float _1524 = _1506;
    float _1526 = _1478;
    float _1528 = _1524;
    if (_1462)
    {
        float _1530 = rint(_1496);
        float _1532 = precise::max(_1530, 0.0);
        uint _1534 = uint(_1532);
        uint _1536 = clamp(_1534, 0u, 65535u);
        _1526 = as_type<float>(_1536);
    }
    float _1538 = _1526;
    float _1540 = _1490 * 0.693147182464599609375;
    float _1542 = fma(_385, _1412, _1498);
    float _1544 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1546 = _1542 + _1420;
    float _1548 = _1388;
    if (!_1106)
    {
        float _1550 = rint(_1388);
        float _1552 = precise::max(_1550, 0.0);
        uint _1554 = uint(_1552);
        uint _1556 = clamp(_1554, 0u, 65535u);
        _1548 = as_type<float>(_1556);
    }
    float _1558 = _1548;
    float _1560 = _1514 * _1504;
    float _1562 = _1516 * _1504;
    float _1564 = _1546 * _1290;
    float _1566 = fma(_1560, 0.5, 0.5);
    float _1568 = fma(_1562, -0.5, 0.5);
    float _1570 = _1434;
    if (_1462)
    {
        float3 _6537 = float3(_1390, _1434, float(as_type<int>(_1538)));
        float3 _6541 = select(_6537, float3(0.0), isnan(_6537));
        float _1572 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6541.xy, uint(rint(_6541.z)), _1564, level(0.0));
        _1570 = _1572;
    }
    float _1574 = _1570;
    float3 _6551 = float3(_1566, _1568, _1544);
    float _1576 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6551, float3(0.0), isnan(_6551)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6551, float3(0.0), isnan(_6551)), level(0.0)).x;
    float3 _6560 = float3(_1566, _1568, _1544);
    float4 _1579 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6560, float3(0.0), isnan(_6560)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6560, float3(0.0), isnan(_6560)), level(0.0)).xyzw;
    float _1581 = _1579.x;
    float _1583 = _1579.y;
    float _1585 = _1579.z;
    float _1587 = _1579.w;
    float _1589 = _1184;
    if (!_1106)
    {
        float3 _6583 = float3(_1524, _1512, float(as_type<int>(_1558)));
        float3 _6585 = select(_6583, float3(0.0), isnan(_6583));
        float _1591 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6585.xy, uint(rint(_6585.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6585.xy, uint(rint(_6585.z)), level(0.0)).x;
        _1589 = _1591;
    }
    float _1593 = _1589;
    float _1595 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1597 = int(_1595);
    int _1599 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1601 = _1599 != 0;
    int _1603 = abs(_615);
    int _1605 = abs(_1288);
    int _1607 = abs(_1294);
    float _1609 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1611 = int(_1609);
    int _1613 = abs(_1302);
    if (_1601)
    {
        _471 = 1.0;
    }
    float _1615 = _471;
    float _1617 = float(uint(_1597));
    float _1619 = trunc(_679);
    int _1621 = int(_1619);
    float _1623 = trunc(_751);
    int _1625 = int(_1623);
    float _1627 = float(uint(_1611));
    int _1629 = ~_1597;
    int _1631 = _1629 + 1;
    float _1633 = _1615;
    if (_1601)
    {
        float _1635 = in.m_66.x;
        _1528 = _1635;
    }
    float _1637 = _1528;
    int _1639 = ~_1611;
    int _1641 = _1639 + 1;
    if (!_1601)
    {
        _1633 = 7.345489978790283203125;
    }
    float _1643 = _1633;
    float _1645 = 1.0 / _1617;
    float _1647 = float(uint(_1621));
    float _1649 = _1637;
    if (!_1601)
    {
        float _1651 = in.m_66.y;
        _1649 = _1651;
    }
    float _1653 = _1649;
    float _1655 = float(_1597);
    float _1657 = _1643 * _405;
    bool _1659 = _1597 == 0;
    float _1661 = 1.0 / _1627;
    int _1663 = as_type<int>(_1645) + (-2);
    float _1665 = float(uint(_1625));
    float _1667 = as_type<float>(_1663) * _1647;
    int _1669 = as_type<int>(_1661) + (-2);
    float _1671 = trunc(_1667);
    float _1673 = precise::max(_1671, 0.0);
    uint _1675 = uint(_1673);
    float _1677 = as_type<float>(_1669) * _1665;
    float _1679 = floor(_1657);
    int _1681 = _1631 * int(_1675);
    int _1683 = _1681 + _1621;
    float _1685 = trunc(_1677);
    float _1687 = precise::max(_1685, 0.0);
    uint _1689 = uint(_1687);
    float _1691 = float(uint(_1683));
    float _1693 = -_1679;
    float _1695 = _1657 + _1693;
    float _1697 = as_type<float>(_1663) * _1691;
    float _1699 = float(_1621);
    bool _1701 = _1699 >= _1655;
    bool _1703 = isnan(_1699);
    bool _1705 = _1701 || _1703;
    bool _1707 = isnan(_1655);
    bool _1709 = _1705 || _1707;
    float _1711 = float(_1709);
    float _1713 = trunc(_1697);
    float _1715 = precise::max(_1713, 0.0);
    uint _1717 = uint(_1715);
    int _1719 = _1641 * int(_1689);
    int _1721 = _1719 + _1625;
    int _1723 = ~_1597;
    int _1725 = _1723 + 1;
    float _1727 = float(uint(_1721));
    float _1729 = trunc(_1711);
    int _1731 = int(_1729);
    float _1733 = as_type<float>(_1669) * _1727;
    int _1735 = int(_1675) + int(_1717);
    float _1737 = trunc(_1733);
    float _1739 = precise::max(_1737, 0.0);
    uint _1741 = uint(_1739);
    float _1743 = as_type<float>(_1675);
    if (_1601)
    {
        _1743 = 1.0;
    }
    float _1745 = _1743;
    float _1747 = _1745;
    if (!_1601)
    {
        _1747 = 1.2345600128173828125;
    }
    float _1749 = _1747;
    int _1751 = _1725 * _1735;
    int _1753 = _1751 + _1621;
    int _1755 = ~_1731;
    int _1757 = _1755 + 1;
    int _1759 = _1757 + 1;
    float _1761 = _1653 * _1749;
    bool _1763 = uint(_1753) >= uint(_1597);
    int _1765 = ~_1611;
    int _1767 = _1765 + 1;
    float _1769 = floor(_1761);
    bool _1771 = !_1763;
    int _1773 = _1771 ? 0 : (-1);
    int _1775 = int(_1689) + int(_1741);
    int _1777 = ~_1735;
    int _1779 = _1777 + _1773;
    int _1781 = _1779 + 1;
    int _1783 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1785 = _1783 != 0;
    float _1787 = _1695 * _1655;
    int _1789 = _1597 * _1781;
    int _1791 = _1789 + _1621;
    int _1793 = abs(_607);
    int _1795 = _1767 * _1775;
    int _1797 = _1795 + _1625;
    int _1799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1801 = _1799 != 0;
    float _1803 = trunc(_1787);
    int _1805 = int(_1803);
    bool _1807 = !_1659;
    int _1809 = _1807 ? _1791 : (-1);
    float _1811 = -_1769;
    float _1813 = _1761 + _1811;
    bool _1815 = uint(_1797) >= uint(_1611);
    bool _1817 = !_1801;
    int _1819 = _1817 ? 0 : 1;
    int _1821 = _1809 * _1759;
    float _1823 = _1655 * _729;
    float _1825 = float(_1611);
    float _1827 = float(_1625);
    int _1829 = _1597 + (-1);
    float _1831 = _1825 * _729;
    int _1833 = abs(_1819);
    float _1835 = trunc(_1823);
    int _1837 = int(_1835);
    bool _1839 = _1827 >= _1825;
    bool _1841 = isnan(_1827);
    bool _1843 = _1839 || _1841;
    bool _1845 = isnan(_1825);
    bool _1847 = _1843 || _1845;
    float _1849 = float(_1847);
    int _1851 = _1731 * _1829;
    int _1853 = _1851 + _1821;
    float _1855 = _1813 * _1825;
    bool _1857 = !_1815;
    int _1859 = _1857 ? 0 : (-1);
    int _1861 = _1805 * _1833;
    int _1863 = _1861 + _1621;
    int _1865 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1867 = _1865 != 0;
    float _1869 = trunc(_1849);
    int _1871 = int(_1869);
    int _1873 = ~_1775;
    int _1875 = _1873 + _1859;
    int _1877 = _1875 + 1;
    int _1879 = _1853 * _1793;
    bool _1881 = !_1785;
    int _1883 = _1881 ? 0 : 1;
    int _1885 = abs(_621);
    bool _1887 = !_1867;
    int _1889 = _1887 ? 0 : 1;
    float _1891 = trunc(_1855);
    int _1893 = int(_1891);
    int _1895 = abs(_1883);
    int _1897 = _1837 * _1603;
    int _1899 = _1897 + _1879;
    int _1901 = _1611 * _1877;
    int _1903 = _1901 + _1625;
    int _1905 = abs(_1889);
    bool _1907 = _1611 == 0;
    int _1909 = _1863 * _1885;
    int _1911 = _1909 + _1899;
    float _1913 = trunc(_1831);
    int _1915 = int(_1913);
    int _1917 = ~_1871;
    int _1919 = _1917 + 1;
    int _1921 = _1919 + 1;
    bool _1923 = !_1907;
    int _1925 = _1923 ? _1903 : (-1);
    int _1927 = _1805 * _1895;
    int _1929 = _1927 + _1911;
    int _1931 = _1893 * _1905;
    int _1933 = _1931 + _1625;
    int _1935 = _1611 + (-1);
    int _1937 = _1925 * _1921;
    float _1939 = float(uint(_1929));
    int _1941 = _1871 * _1935;
    int _1943 = _1941 + _1937;
    float _1945 = as_type<float>(_1663) * _1939;
    int _1947 = _1943 * _1605;
    float _1949 = float(uint(_1863));
    float _1951 = trunc(_1945);
    float _1953 = precise::max(_1951, 0.0);
    uint _1955 = uint(_1953);
    int _1957 = ~_1597;
    int _1959 = _1957 + 1;
    int _1961 = _1915 * _1607;
    int _1963 = _1961 + _1947;
    int _1965 = abs(_1308);
    float _1967 = as_type<float>(_1663) * _1949;
    int _1969 = _1933 * _1613;
    int _1971 = _1969 + _1963;
    int _1973 = ~_1597;
    int _1975 = _1973 + 1;
    float _1977 = trunc(_1967);
    float _1979 = precise::max(_1977, 0.0);
    uint _1981 = uint(_1979);
    int _1983 = _1893 * _1965;
    int _1985 = _1983 + _1971;
    int _1987 = ~_1597;
    int _1989 = _1987 + 1;
    float _1991 = float(uint(_1985));
    int _1993 = _1975 * int(_1955);
    int _1995 = _1993 + _1929;
    float _1997 = as_type<float>(_1669) * _1991;
    float _1999 = float(uint(_1995));
    int _2001 = _1989 * int(_1981);
    int _2003 = _2001 + _1863;
    float _2005 = trunc(_1997);
    float _2007 = precise::max(_2005, 0.0);
    uint _2009 = uint(_2007);
    float _2011 = as_type<float>(_1663) * _1999;
    float _2013 = float(uint(_2003));
    int _2015 = ~_1611;
    int _2017 = _2015 + 1;
    float _2019 = trunc(_2011);
    float _2021 = precise::max(_2019, 0.0);
    uint _2023 = uint(_2021);
    float _2025 = as_type<float>(_1663) * _2013;
    int _2027 = ~_1597;
    int _2029 = _2027 + 1;
    int _2031 = _2017 * int(_2009);
    int _2033 = _2031 + _1985;
    float _2035 = trunc(_2025);
    float _2037 = precise::max(_2035, 0.0);
    uint _2039 = uint(_2037);
    float _2041 = float(uint(_2033));
    int _2043 = int(_1955) + int(_2023);
    float _2045 = as_type<float>(_1669) * _2041;
    int _2047 = _2029 * _2043;
    int _2049 = _2047 + _1929;
    float _2051 = trunc(_2045);
    float _2053 = precise::max(_2051, 0.0);
    uint _2055 = uint(_2053);
    int _2057 = int(_1981) + int(_2039);
    bool _2059 = uint(_2049) >= uint(_1597);
    bool _2061 = !_2059;
    int _2063 = _2061 ? 0 : (-1);
    int _2065 = _1959 * _2057;
    int _2067 = _2065 + _1863;
    int _2069 = ~_2043;
    int _2071 = _2069 + _2063;
    int _2073 = _2071 + 1;
    float _2075 = as_type<float>(_2043);
    float _2077 = as_type<float>(_1899);
    if (_1106)
    {
        _2075 = 1.0;
    }
    float _2079 = _2075;
    bool _2081 = uint(_2067) >= uint(_1597);
    int _2083 = _1597 * _2073;
    int _2085 = _2083 + _1929;
    int _2087 = int(_2009) + int(_2055);
    float _2089 = _2079;
    if (!_1106)
    {
        int _2091 = _1170 << 4;
        int _2093 = _2091 + 2048;
        uint _2095 = uint(int(uint(_2093) >> uint(2)));
        uint _2097 = uint(int(uint(int(_2095)) >> uint(2)));
        int _2099 = int(_2095) & 3;
        float _2101 = (*spvDescriptorSet0.vp_c15)._m0[int(_2097)][_2099];
        int _2103 = int(_2095) + 1;
        uint _2105 = uint(int(uint(_2103) >> uint(2)));
        int _2107 = _2103 & 3;
        float _2109 = (*spvDescriptorSet0.vp_c15)._m0[int(_2105)][_2107];
        int _2111 = _2093 + 8;
        uint _2113 = uint(int(uint(_2111) >> uint(2)));
        uint _2115 = uint(int(uint(int(_2113)) >> uint(2)));
        int _2117 = int(_2113) & 3;
        float _2119 = (*spvDescriptorSet0.vp_c15)._m0[int(_2115)][_2117];
        int _2121 = int(_2113) + 1;
        uint _2123 = uint(int(uint(_2121) >> uint(2)));
        int _2125 = _2121 & 3;
        float _2127 = (*spvDescriptorSet0.vp_c15)._m0[int(_2123)][_2125];
        float _2129 = _883 * _2109;
        float _2131 = fma(_383, _2101, _2129);
        float _2133 = fma(_385, _2119, _2131);
        float _2135 = _2133 + _2127;
        float _2137 = precise::clamp(_2135, 0.0, 1.0);
        float _2139 = -_2137;
        float _2141 = _2139 + _1593;
        float _2143 = fma(_2141, 500.0, 1.5);
        float _2145 = exp2(_2143);
        float _2147 = 0.0 + _2145;
        float _2149 = precise::clamp(_2147, 0.0, 1.0);
        _1180 = as_type<float>(_2093);
        _2089 = _2149;
    }
    float _2151 = _1180;
    float _2153 = _2089;
    float _2155 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2157 = _1366 + _2155;
    float _2159 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2161 = _1368 + _2159;
    float _2163 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2165 = _1370 + _2163;
    float _2167 = _2157 * _2157;
    float _2169 = fma(_2161, _2161, _2167);
    float _2171 = fma(_2165, _2165, _2169);
    float _2173 = rsqrt(_2171);
    float _2175 = sqrt(_2171);
    float _2177 = _2173 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2179 = _2161 * _2177;
    float _2181 = _2165 * _2177;
    float _2183 = _2179 * _2179;
    float _2185 = _2181 * _2181;
    float _2187 = _2183 + _2185;
    float _2189 = sqrt(_2187);
    bool _2191 = _2189 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2193 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2195 = _2189 + _2193;
    float _2197 = _2173;
    float _2199 = _2195;
    float _2201 = _2151;
    float _2203 = _2157;
    if (_2191)
    {
        float _2205 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2197 = _2205;
    }
    float _2207 = _2197;
    if (_2191)
    {
        float _2209 = rsqrt(_2187);
        _935 = _2209;
    }
    float _2211 = _935;
    float _2213 = _2211;
    if (_2191)
    {
        float _2215 = _2195 * _2207;
        _2199 = _2215;
    }
    float _2217 = _2199;
    if (_2191)
    {
        float _2219 = _2217 * 0.15915493667125701904296875;
        _2201 = _2219;
    }
    float _2221 = _2201;
    float _2223 = _2165;
    float _2225 = _2221;
    if (_2191)
    {
        float _2227 = _2221 * 6.283185482025146484375;
        float _2229 = sin(_2227);
        _2223 = _2229;
    }
    float _2231 = _2223;
    float _2233 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2235 = precise::max(0.0, _2233);
    float _2237 = _2207;
    float _2239 = _2235;
    if (_2191)
    {
        float _2241 = _2221 * 6.283185482025146484375;
        float _2243 = cos(_2241);
        _2237 = _2243;
    }
    float _2245 = _2237;
    float _2247 = -_2177;
    float _2249 = -_2235;
    float _2251 = fma(_2157, _2247, _2249);
    if (_2191)
    {
        float _2253 = _2251 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2203 = _2253;
    }
    float _2255 = _2203;
    float _2257 = _2255;
    float _2259 = _2231;
    if (_2191)
    {
        float _2261 = fma(_2231, _2255, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2257 = _2261;
    }
    float _2263 = _2257;
    float _2265 = _2263;
    if (!_2191)
    {
        _2259 = _2179;
    }
    float _2267 = _2259;
    float _2269 = _2267;
    float _2271 = _2245;
    if (_2191)
    {
        float _2273 = _2245 + (-1.0);
        _2239 = _2273;
    }
    float _2275 = _2239;
    float _2277 = _2275;
    if (_2191)
    {
        float _2279 = _2211 * _2263;
        _2077 = _2279;
    }
    float _2281 = _2077;
    if (!_2191)
    {
        _2265 = _2251;
    }
    float _2283 = _2265;
    float _2285 = _2283;
    if (_2191)
    {
        float _2287 = _2275 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2225 = _2287;
    }
    float _2289 = _2225;
    if (_2191)
    {
        float _2291 = _2179 * _2281;
        _2269 = _2291;
    }
    float _2293 = _2269;
    if (!_2191)
    {
        _2277 = _2181;
    }
    float _2295 = _2277;
    float _2297 = _2295;
    if (_2191)
    {
        float _2299 = _2181 * _2281;
        _2297 = _2299;
    }
    float _2301 = _2297;
    if (!_2191)
    {
        _2213 = _2183;
    }
    float _2303 = _2213;
    float _2305 = _2303;
    if (_2191)
    {
        float _2307 = fma(_2251, _2245, _2289);
        _2285 = _2307;
    }
    float _2309 = _2285;
    if (_2191)
    {
        float _2311 = _2293 * _2293;
        _2305 = _2311;
    }
    float _2313 = _2305;
    if (!_2191)
    {
        _2271 = _2185;
    }
    float _2315 = _2271;
    float _2317 = _2315;
    if (_2191)
    {
        float _2319 = _2301 * _2301;
        _2317 = _2319;
    }
    float _2321 = _2317;
    float _2323 = fma(_2309, _2309, _2313);
    float _2325 = float(uint(_1933));
    int _2327 = ~_1611;
    int _2329 = _2327 + 1;
    float _2331 = _2323 + _2321;
    float _2333 = rsqrt(_2331);
    float _2335 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2337 = fma(_2175, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2335);
    float _2339 = precise::clamp(_2337, 0.0, 1.0);
    float _2341 = -_2339;
    float _2343 = _2341 + 1.0;
    float _2345 = abs(_2343);
    float _2347 = log2(_2345);
    float _2349 = _2333 * _2293;
    float _2351 = _2333 * _2309;
    float _2353 = _2333 * _2301;
    float _2355 = _2349 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2357 = -_2355;
    float _2359 = fma(_2351, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2357);
    float _2361 = -_2353;
    float _2363 = fma(_2361, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2359);
    float _2365 = _2347 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2367 = fma(_2363, -0.5, 0.5);
    float _2369 = fma(_2363, 0.5, 0.5);
    float _2371 = exp2(_2365);
    float _2373 = fma(_2369, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2375 = as_type<float>(_1669) * _2325;
    float _2377 = fma(_2369, _2373, -0.212114393711090087890625);
    float _2379 = sqrt(_2367);
    float _2381 = fma(_2369, _2377, 1.570728778839111328125);
    int _2383 = ~_1611;
    int _2385 = _2383 + 1;
    float _2387 = trunc(_2375);
    float _2389 = precise::max(_2387, 0.0);
    uint _2391 = uint(_2389);
    float _2393 = _2351 + 1.0;
    float _2395 = -_2351;
    float _2397 = fma(_2371, _2393, _2395);
    float _2399 = _2379 * 0.636619746685028076171875;
    float _2401 = fma(_2397, 0.5, 0.5);
    float _2403 = -_2381;
    float _2405 = fma(_2399, _2403, 1.0);
    float2 _7737 = float2(_2405, _2401);
    float3 _2409 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7737, float2(0.0), isnan(_7737)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7737, float2(0.0), isnan(_7737)), level(0.0)).xyz;
    float _2411 = _2409.x;
    float _2413 = _2409.y;
    float _2415 = _2409.z;
    bool _2417 = !_1659;
    int _2419 = _2417 ? _2085 : (-1);
    int _2421 = _2385 * _2087;
    int _2423 = _2421 + _1985;
    bool _2425 = !_2081;
    int _2427 = _2425 ? 0 : (-1);
    int _2429 = _2329 * int(_2391);
    int _2431 = _2429 + _1933;
    int _2433 = _2419 & 3;
    bool _2435 = _2433 != 0;
    float _2437 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2439 = _363 + _2437;
    bool _2441 = uint(_2423) >= uint(_1611);
    float _2443 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2445 = _363 + _2443;
    int _2447 = _2419 & 3;
    bool _2449 = _2447 != 0;
    out.m_72.x = _383;
    out.m_72.y = _701;
    out.m_72.z = _385;
    bool _2451 = uint(_2433) >= 2u;
    float _2453 = _2347 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2455 = !_2441;
    int _2457 = _2455 ? 0 : (-1);
    float _2459 = -_739;
    float _2461 = _2459 + 1.0;
    int _2463 = ~_2057;
    int _2465 = _2463 + _2427;
    int _2467 = _2465 + 1;
    float _2469 = -_635;
    float _2471 = _2469 + 1.0;
    int _2473 = _2449 ? 0 : 1;
    float _2475 = exp2(_2453);
    int _2477 = _2451 ? 0 : 1;
    int _2479 = _1597 * _2467;
    int _2481 = _2479 + _1863;
    bool _2483 = uint(_2433) > 1u;
    float _2485 = -_793;
    float _2487 = _2485 + 1.0;
    bool _2489 = _2433 != 3;
    float _2491 = -_403;
    float _2493 = _2491 + 1.0;
    int _2495 = ~_2087;
    int _2497 = _2495 + _2457;
    int _2499 = _2497 + 1;
    float _2501 = float(uint(_2431));
    bool _2503 = _411 > 0.5;
    int _2505 = _1611 * _2499;
    int _2507 = _2505 + _1985;
    int _2509 = ~_2473;
    int _2511 = _2509 + 1;
    int _2513 = _2511 + 1;
    float _2515 = as_type<float>(_1669) * _2501;
    int _2517 = ~_2477;
    int _2519 = _2517 + 1;
    int _2521 = _2519 + 1;
    float _2523 = -_2475;
    float _2525 = _2523 + 1.0;
    bool _2527 = !_1907;
    int _2529 = _2527 ? _2507 : (-1);
    float _2531 = trunc(_2515);
    float _2533 = precise::max(_2531, 0.0);
    uint _2535 = uint(_2533);
    int _2537 = _2513;
    int _2539 = _2521;
    if (!_2483)
    {
        int _2541 = ~_2473;
        int _2543 = _2541 + 1;
        _2537 = _2543;
    }
    int _2545 = _2537;
    float _2547 = _2525 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_2489)
    {
        int _2549 = ~_2477;
        int _2551 = _2549 + 1;
        _2539 = _2551;
    }
    int _2553 = _2539;
    int _2555 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2557 = _2555 != 0;
    float _2559 = _2547 * _1576;
    float _2561 = -_185;
    int _2563 = _2503 ? as_type<int>(_2561) : as_type<int>(_185);
    int _2565 = _2529 & 3;
    bool _2567 = _2565 != 0;
    bool _2569 = !_2557;
    int _2571 = _2569 ? 0 : 1;
    bool _2573 = uint(_2565) > 1u;
    bool _2575 = !_1659;
    int _2577 = _2575 ? _2481 : (-1);
    int _2579 = _2529 & 3;
    bool _2581 = _2579 != 0;
    bool _2583 = !_2567;
    int _2585 = _2583 ? 0 : 1;
    int _2587 = _2581 ? 0 : 1;
    bool _2589 = _2433 != 3;
    int _2591 = ~_2587;
    int _2593 = _2591 + 1;
    int _2595 = _2593 + 1;
    float _2597 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2599 = _2597 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _2601 = _2595;
    if (!_2573)
    {
        int _2603 = ~_2587;
        int _2605 = _2603 + 1;
        _2601 = _2605;
    }
    int _2607 = _2601;
    bool _2609 = !_2589;
    int _2611 = _2609 ? 0 : (-1);
    float _2613 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2615 = _2613 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2617 = 1.0 / _2599;
    bool _2619 = _2565 != 3;
    int _2621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2623 = _2621 != 0;
    float _2625 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2627 = _2625 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2629 = ~_1611;
    int _2631 = _2629 + 1;
    bool _2633 = uint(_2565) >= 2u;
    float _2635 = 1.0 / _2615;
    int _2637 = int(_2391) + int(_2535);
    int _2639 = _2631 * _2637;
    int _2641 = _2639 + _1933;
    bool _2643 = !_2435;
    int _2645 = _2643 ? 0 : 1;
    bool _2647 = !_2623;
    int _2649 = _2647 ? 0 : 1;
    float _2651 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2653 = _2651 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _2655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2657 = _2655 != 0;
    int _2659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2661 = _2659 != 0;
    float _2663 = 1.0 / _2653;
    int _2665 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2667 = _2665 != 0;
    int _2669 = _2633 ? 0 : 1;
    bool _2671 = _2565 != 3;
    int _2673 = ~_2669;
    int _2675 = _2673 + 1;
    int _2677 = _2675 + 1;
    float _2679 = 1.0 / _2627;
    int _2681 = _2677;
    if (_2619)
    {
        int _2683 = ~_2669;
        int _2685 = _2683 + 1;
        _2681 = _2685;
    }
    int _2687 = _2681;
    bool _2689 = uint(_2641) >= uint(_1611);
    float _2691 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2693 = _2691 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2695 = !_2671;
    int _2697 = _2695 ? 0 : (-1);
    bool _2699 = _405 > 0.5;
    float _2701 = 1.0 / _2693;
    float _2703 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2705 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2703;
    float _2707 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2709 = _2707 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _2711 = _2529 >> 31;
    float _2713 = _2705 * _2635;
    bool _2715 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2717 = isnan(_363);
    bool _2719 = _2715 || _2717;
    bool _2721 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2723 = _2719 || _2721;
    float _2725 = float(_2723);
    float _2727 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2729 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2727;
    bool _2731 = !_2689;
    int _2733 = _2731 ? 0 : (-1);
    float _2735 = fma(_2713, _2445, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    int _2737 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2739 = _2737 != 0;
    float _2741 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2743 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2741;
    float _2745 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2747 = _2745 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2749 = _2729 * _2663;
    int _2751 = _2711 & 3;
    float _2753 = _2743 * _2617;
    float _2755 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2757 = _363 + _2755;
    float _2759 = _2747 * _2679;
    float _2761 = _2709 * _2701;
    float _2763 = -_2725;
    float _2765 = _2763 + 1.0;
    float _2767 = fma(_2753, _2757, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2769 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2771 = isnan(_363);
    bool _2773 = _2769 || _2771;
    bool _2775 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2777 = _2773 || _2775;
    float _2779 = float(_2777);
    float _2781 = fma(_2759, _2439, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _2783 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2785 = isnan(_363);
    bool _2787 = _2783 || _2785;
    bool _2789 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2791 = _2787 || _2789;
    float _2793 = float(_2791);
    float _2795 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2797 = _363 + _2795;
    int _2799 = _2419 >> 31;
    float _2801 = _2779 * _2765;
    float _2803 = -_2779;
    float _2805 = _2803 + 1.0;
    bool _2807 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2809 = isnan(_363);
    bool _2811 = _2807 || _2809;
    bool _2813 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2815 = _2811 || _2813;
    float _2817 = float(_2815);
    float _2819 = fma(_2761, _2797, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    int _2821 = _2799 & 3;
    float _2823 = -_2793;
    float _2825 = _2823 + 1.0;
    float _2827 = _2793 * _2805;
    bool _2829 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2831 = isnan(_363);
    bool _2833 = _2829 || _2831;
    bool _2835 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2837 = _2833 || _2835;
    float _2839 = float(_2837);
    float _2841 = -_2817;
    float _2843 = _2841 + 1.0;
    float _2845 = _2817 * _2825;
    int _2847 = _2529 + _2751;
    float _2849 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2851 = _2849 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    int _2853 = _2419 + _2821;
    float _2855 = _2839 * _2843;
    bool _2857 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2859 = isnan(_363);
    bool _2861 = _2857 || _2859;
    bool _2863 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2865 = _2861 || _2863;
    float _2867 = float(_2865);
    float _2869 = -_2839;
    float _2871 = _2869 + 1.0;
    bool _2873 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2875 = isnan(_363);
    bool _2877 = _2873 || _2875;
    bool _2879 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2881 = _2877 || _2879;
    float _2883 = float(_2881);
    float _2885 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2887 = _363 + _2885;
    int _2889 = _2853 >> 2;
    float _2891 = -_2867;
    float _2893 = _2891 + 1.0;
    int _2895 = _2847 >> 2;
    float _2897 = _2867 * _2871;
    int _2899 = _2889 << 4;
    int _2901 = _2899 + 368;
    float _2903 = _2883 * _2893;
    int _2905 = _2895 << 4;
    int _2907 = _2905 + 512;
    uint _2909 = uint(int(uint(_2901) >> uint(2)));
    uint _2911 = uint(int(uint(int(_2909)) >> uint(2)));
    int _2913 = int(_2909) & 3;
    float _2915 = (*spvDescriptorSet0.vp_c9)._m0[int(_2911)][_2913];
    int _2917 = int(_2909) + 1;
    uint _2919 = uint(int(uint(_2917) >> uint(2)));
    int _2921 = _2917 & 3;
    float _2923 = (*spvDescriptorSet0.vp_c9)._m0[int(_2919)][_2921];
    float _2925 = _2767 * _2903;
    float _2927 = -_2883;
    float _2929 = _2927 + 1.0;
    float _2931 = fma(_2929, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2925);
    uint _2933 = uint(int(uint(_2907) >> uint(2)));
    uint _2935 = uint(int(uint(int(_2933)) >> uint(2)));
    int _2937 = int(_2933) & 3;
    float _2939 = (*spvDescriptorSet0.vp_c9)._m0[int(_2935)][_2937];
    int _2941 = int(_2933) + 1;
    uint _2943 = uint(int(uint(_2941) >> uint(2)));
    int _2945 = _2941 & 3;
    float _2947 = (*spvDescriptorSet0.vp_c9)._m0[int(_2943)][_2945];
    float _2949 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2951 = _2949 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2953 = fma(_2781, _2897, _2931);
    float _2955 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2957 = _2955 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2959 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2961 = _363 + _2959;
    int _2963 = abs(_2607);
    float _2965 = fma(_2735, _2855, _2953);
    int _2967 = ~_2637;
    int _2969 = _2967 + _2733;
    int _2971 = _2969 + 1;
    float _2973 = 1.0 / _2951;
    int _2975 = _2901 + 8;
    uint _2977 = uint(int(uint(_2975) >> uint(2)));
    uint _2979 = uint(int(uint(int(_2977)) >> uint(2)));
    int _2981 = int(_2977) & 3;
    float _2983 = (*spvDescriptorSet0.vp_c9)._m0[int(_2979)][_2981];
    int _2985 = int(_2977) + 1;
    uint _2987 = uint(int(uint(_2985) >> uint(2)));
    int _2989 = _2985 & 3;
    float _2991 = (*spvDescriptorSet0.vp_c9)._m0[int(_2987)][_2989];
    float _2993 = fma(_2749, _2961, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2995 = fma(_2819, _2845, _2965);
    int _2997 = _1611 * _2971;
    int _2999 = _2997 + _1933;
    bool _3001 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _3003 = isnan(_363);
    bool _3005 = _3001 || _3003;
    bool _3007 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _3009 = _3005 || _3007;
    float _3011 = float(_3009);
    float _3013 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3015 = _363 + _3013;
    float _3017 = fma(_2993, _2827, _2995);
    float _3019 = 1.0 / _2957;
    int _3021 = _2907 + 8;
    uint _3023 = uint(int(uint(_3021) >> uint(2)));
    uint _3025 = uint(int(uint(int(_3023)) >> uint(2)));
    int _3027 = int(_3023) & 3;
    float _3029 = (*spvDescriptorSet0.vp_c9)._m0[int(_3025)][_3027];
    int _3031 = int(_3023) + 1;
    uint _3033 = uint(int(uint(_3031) >> uint(2)));
    int _3035 = _3031 & 3;
    float _3037 = (*spvDescriptorSet0.vp_c9)._m0[int(_3033)][_3035];
    bool _3039 = !_1907;
    int _3041 = _3039 ? _2999 : (-1);
    bool _3043 = _407 > 0.5;
    int _3045 = abs(_2545);
    float _3047 = _2851 * _2973;
    float _3049 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3051 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _3049;
    float _3053 = -_181;
    int _3055 = _2699 ? as_type<int>(_3053) : as_type<int>(_181);
    bool _3057 = _409 > 0.5;
    float _3059 = fma(_3047, _2887, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _3061 = ~_3045;
    int _3063 = _3061 + 1;
    int _3065 = _3063 + 1;
    float _3067 = -_3011;
    float _3069 = _3067 + 1.0;
    float _3071 = _3051 * _3019;
    int _3073 = abs(_2645);
    float _3075 = fma(_3059, _2801, _3017);
    int _3077 = ~_2963;
    int _3079 = _3077 + 1;
    int _3081 = _3079 + 1;
    float _3083 = fma(_3071, _3015, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _3085 = abs(_2585);
    float _3087 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3089 = int(_3087);
    int _3091 = _3065 * as_type<int>(_2923);
    int _3093 = abs(_2687);
    float _3095 = _2725 * _3069;
    int _3097 = ~_3073;
    int _3099 = _3097 + 1;
    int _3101 = _3099 + 1;
    int _3103 = abs(_2553);
    float _3105 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3107 = int(_3105);
    int _3109 = abs(_2611);
    int _3111 = _3081 * as_type<int>(_2947);
    int _3113 = _3101 * as_type<int>(_2915);
    int _3115 = _3113 + _3091;
    float _3117 = _971 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3119 = ~_3085;
    int _3121 = _3119 + 1;
    int _3123 = _3121 + 1;
    float _3125 = abs(_899);
    float _3127 = log2(_3125);
    float _3129 = float(uint(_3089));
    float _3131 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3117);
    int _3133 = ~_3103;
    int _3135 = _3133 + 1;
    int _3137 = _3135 + 1;
    int _3139 = _3123 * as_type<int>(_2939);
    int _3141 = _3139 + _3111;
    int _3143 = ~_3093;
    int _3145 = _3143 + 1;
    int _3147 = _3145 + 1;
    float _3149 = fma(_3083, _3095, _3075);
    int _3151 = ~_3109;
    int _3153 = _3151 + 1;
    int _3155 = _3153 + 1;
    int _3157 = _3137 * as_type<int>(_2983);
    int _3159 = _3157 + _3115;
    float _3161 = 1.0 / _3129;
    float _3163 = float(uint(_3107));
    int _3165 = _3147 * as_type<int>(_3029);
    int _3167 = _3165 + _3141;
    int _3169 = abs(_2571);
    int _3171 = _3155 * as_type<int>(_2991);
    int _3173 = _3171 + _3159;
    int _3175 = abs(_2697);
    float _3177 = fma(_3011, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3149);
    int _3179 = ~_3169;
    int _3181 = _3179 + 1;
    int _3183 = _3181 + 1;
    float _3185 = 1.0 / _3163;
    int _3187 = abs(_3089);
    float _3189 = _3127 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _3191 = abs(_2649);
    int _3193 = _3173 * _3183;
    int _3195 = ~_3175;
    int _3197 = _3195 + 1;
    int _3199 = _3197 + 1;
    float _3201 = _957 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3203 = abs(_3107);
    int _3205 = _2577 * _3169;
    int _3207 = _3205 + _3193;
    float _3209 = float(uint(_3187));
    int _3211 = _3199 * as_type<int>(_3037);
    int _3213 = _3211 + _3167;
    int _3215 = ~_3191;
    int _3217 = _3215 + 1;
    int _3219 = _3217 + 1;
    float _3221 = _957 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3223 = float(uint(_3203));
    float _3225 = _957 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3227 = 1.0 / _3209;
    int _3229 = _3213 * _3219;
    int _3231 = as_type<int>(_3161) + (-2);
    float _3233 = -_947;
    float _3235 = fma(_3233, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3201);
    float _3237 = float(uint(_3207));
    float _3239 = -_947;
    float _3241 = fma(_3239, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3221);
    float _3243 = -_947;
    float _3245 = fma(_3243, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3225);
    int _3247 = _3041 * _3191;
    int _3249 = _3247 + _3229;
    float _3251 = 1.0 / _3223;
    float _3253 = as_type<float>(_3231) * _3237;
    int _3255 = as_type<int>(_3185) + (-2);
    out.m_74.x = _3177;
    float _3257 = float(uint(_3249));
    int _3259 = abs(_3207);
    float _3261 = exp2(_3189);
    float _3263 = as_type<float>(_3255) * _3257;
    int _3265 = abs(_3249);
    int _3267 = as_type<int>(_3227) + (-2);
    float _3269 = trunc(_3253);
    float _3271 = precise::max(_3269, 0.0);
    uint _3273 = uint(_3271);
    float _3275 = float(uint(_3259));
    int _3277 = as_type<int>(_3251) + (-2);
    float _3279 = as_type<float>(_3267) * _3275;
    int _3281 = ~_3089;
    int _3283 = _3281 + 1;
    float _3285 = fma(_3261, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3287 = precise::clamp(_3285, 0.0, 1.0);
    float _3289 = float(uint(_3265));
    float _3291 = trunc(_3263);
    float _3293 = precise::max(_3291, 0.0);
    uint _3295 = uint(_3293);
    float _3297 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3235);
    float _3299 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3241);
    float _3301 = _971 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3303 = as_type<float>(_3277) * _3289;
    float _3305 = _971 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3307 = _3283 * int(_3273);
    int _3309 = _3307 + _3207;
    float _3311 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3301);
    float _3313 = trunc(_3279);
    float _3315 = precise::max(_3313, 0.0);
    uint _3317 = uint(_3315);
    float _3319 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3305);
    int _3321 = ~_3187;
    int _3323 = _3321 + 1;
    float _3325 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3245);
    float _3327 = float(uint(_3309));
    int _3329 = ~_3107;
    int _3331 = _3329 + 1;
    float _3333 = trunc(_3303);
    float _3335 = precise::max(_3333, 0.0);
    uint _3337 = uint(_3335);
    float _3339 = as_type<float>(_3231) * _3327;
    int _3341 = _3331 * int(_3295);
    int _3343 = _3341 + _3249;
    int _3345 = ~_3203;
    int _3347 = _3345 + 1;
    float _3349 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _3351 = !_2657;
    float _3353 = _3351 ? _185 : as_type<float>(_2563);
    int _3355 = _3323 * int(_3317);
    int _3357 = _3355 + _3259;
    float _3359 = float(uint(_3343));
    float _3361 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3363 = trunc(_3339);
    float _3365 = precise::max(_3363, 0.0);
    uint _3367 = uint(_3365);
    float _3369 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3371 = float(uint(_3357));
    float _3373 = as_type<float>(_3255) * _3359;
    float _3375 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3311);
    int _3377 = _3347 * int(_3337);
    int _3379 = _3377 + _3265;
    float _3381 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3361);
    float _3383 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3349);
    float _3385 = trunc(_3373);
    float _3387 = precise::max(_3385, 0.0);
    uint _3389 = uint(_3387);
    float _3391 = -_185;
    int _3393 = _3043 ? as_type<int>(_3391) : as_type<int>(_185);
    float _3395 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3369);
    float _3397 = float(uint(_3379));
    float _3399 = as_type<float>(_3267) * _3371;
    float _3401 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3319);
    float _3403 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3131);
    float _3405 = as_type<float>(_3277) * _3397;
    bool _3407 = !_2661;
    float _3409 = _3407 ? _185 : as_type<float>(_3393);
    float _3411 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3413 = fma(_3287, -2.0, 3.0);
    float _3415 = trunc(_3405);
    float _3417 = precise::max(_3415, 0.0);
    uint _3419 = uint(_3417);
    float _3421 = _3287 * _3287;
    float _3423 = -_181;
    int _3425 = _3057 ? as_type<int>(_3423) : as_type<int>(_181);
    float _3427 = _3411 * _3297;
    bool _3429 = !_2739;
    float _3431 = _3429 ? _181 : as_type<float>(_3055);
    float _3433 = _3421 * _3413;
    bool _3435 = !_2667;
    float _3437 = _3435 ? _181 : as_type<float>(_3425);
    float _3439 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3441 = trunc(_3399);
    float _3443 = precise::max(_3441, 0.0);
    uint _3445 = uint(_3443);
    int _3447 = ~_3089;
    int _3449 = _3447 + 1;
    float _3451 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3381);
    float _3453 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3383);
    float _3455 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3395);
    int _3457 = int(_3273) + int(_3367);
    float _3459 = fma(_3439, _3375, _3427);
    int _3461 = ~_3107;
    int _3463 = _3461 + 1;
    out.m_76.x = _3375;
    out.m_76.y = _3403;
    out.m_76.z = _3401;
    int _3465 = int(_3295) + int(_3389);
    int _3467 = ~_3203;
    int _3469 = _3467 + 1;
    int _3471 = int(_3337) + int(_3419);
    int _3473 = _3449 * _3457;
    int _3475 = _3473 + _3207;
    int _3477 = int(_3317) + int(_3445);
    int _3479 = ~_3187;
    int _3481 = _3479 + 1;
    int _3483 = _3463 * _3465;
    int _3485 = _3483 + _3249;
    bool _3487 = uint(_3475) >= uint(_3089);
    int _3489 = _3481 * _3477;
    int _3491 = _3489 + _3259;
    bool _3493 = uint(_3485) >= uint(_3107);
    int _3495 = _3469 * _3471;
    int _3497 = _3495 + _3265;
    float _3499 = _1432 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3501 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3503 = !_3487;
    int _3505 = _3503 ? 0 : (-1);
    bool _3507 = !_3493;
    int _3509 = _3507 ? 0 : (-1);
    float _3511 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3499);
    bool _3513 = uint(_3497) >= uint(_3203);
    bool _3515 = uint(_3491) >= uint(_3187);
    float _3517 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3519 = _3207 ^ _3089;
    float _3521 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3511);
    int _3523 = ~_3457;
    int _3525 = _3523 + _3505;
    int _3527 = _3525 + 1;
    float _3529 = _2415 * _2559;
    bool _3531 = !_3515;
    int _3533 = _3531 ? 0 : (-1);
    float _3535 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3521);
    uint _3537 = uint(int(uint(_3519) >> uint(31)));
    int _3539 = _3089 * _3527;
    int _3541 = _3539 + _3207;
    int _3543 = ~_3465;
    int _3545 = _3543 + _3509;
    int _3547 = _3545 + 1;
    float _3549 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3551 = ~_3533;
    int _3553 = _3477 + _3551;
    int _3555 = _3553 + 1;
    float _3557 = _3451 + _3459;
    int _3559 = ~int(_3537);
    int _3561 = _3559 + 1;
    int _3563 = _3249 ^ _3107;
    int _3565 = _3107 * _3547;
    int _3567 = _3565 + _3249;
    bool _3569 = _3089 == 0;
    bool _3571 = !_3513;
    int _3573 = _3571 ? 0 : (-1);
    bool _3575 = _3107 == 0;
    bool _3577 = _3107 == 0;
    float _3579 = _3501 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3581 = _3555 ^ _3561;
    float _3583 = fma(_3411, _3411, 1.0);
    uint _3585 = uint(int(uint(_3563) >> uint(31)));
    float _3587 = _3549 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3589 = !_3569;
    int _3591 = _3589 ? _3541 : (-1);
    int _3593 = ~_3573;
    int _3595 = _3471 + _3593;
    int _3597 = _3595 + 1;
    bool _3599 = _3089 == 0;
    int _3601 = ~int(_3585);
    int _3603 = _3601 + 1;
    float _3605 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3607 = ~_3561;
    int _3609 = _3607 + _3581;
    int _3611 = _3609 + 1;
    bool _3613 = !_3575;
    int _3615 = _3613 ? _3567 : (-1);
    float _3617 = float(_3591);
    int _3619 = _3597 ^ _3603;
    float _3621 = rsqrt(_3583);
    float _3623 = float(_3615);
    float _3625 = fma(_3579, _3617, _459);
    float _3627 = _3431 + 0.5;
    int _3629 = ~_3603;
    int _3631 = _3629 + _3619;
    int _3633 = _3631 + 1;
    bool _3635 = !_3599;
    int _3637 = _3635 ? _3611 : (-1);
    float _3639 = fma(_3587, _3623, _799);
    float _3641 = fma(_3579, _3627, _3625);
    float _3643 = _3437 + 0.5;
    bool _3645 = !_3577;
    int _3647 = _3645 ? _3633 : (-1);
    float _3649 = _3517 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3651 = float(_3637);
    float _3653 = fma(_3587, _3643, _3639);
    float _3655 = float(_3647);
    float _3657 = _3605 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3659 = _3411 * _3621;
    float _3661 = -_455;
    float _3663 = fma(_3649, _3651, _3661);
    float _3665 = _3409 + (-0.5);
    float _3667 = -_803;
    float _3669 = fma(_3657, _3655, _3667);
    float _3671 = -_3451;
    float _3673 = _3659 * _3671;
    float _3675 = _3353 + (-0.5);
    float _3677 = -_3649;
    float _3679 = fma(_3677, _3665, _3663);
    float _3681 = -_3453;
    float _3683 = _3659 * _3681;
    float _3685 = fma(_3621, _3297, _3673);
    float _3687 = -_3657;
    float _3689 = fma(_3687, _3675, _3669);
    float _3691 = -_3455;
    float _3693 = _3659 * _3691;
    float _3695 = fma(_3621, _3299, _3683);
    float _3697 = _3411 * _3325;
    float _3699 = _3411 * _3299;
    float _3701 = fma(_3621, _3325, _3693);
    float _3703 = -_773;
    float _3705 = _3703 + 1.0;
    float _3707 = fma(_3439, _3401, _3697);
    float _3709 = fma(_3439, _3403, _3699);
    float _3711 = -_2471;
    float _3713 = fma(_3437, _3711, _3653);
    out.m_78.x = _3685;
    out.m_78.y = _3695;
    out.m_78.z = _3701;
    float _3715 = _3455 + _3707;
    float _3717 = -_3433;
    float _3719 = _3717 + 1.0;
    float _3721 = _3453 + _3709;
    float _3723 = -_3705;
    float _3725 = fma(_3431, _3723, _3641);
    float _3727 = fma(_3409, _2461, _3679);
    float _3729 = fma(_3719, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3433);
    float _3731 = fma(_3353, _2487, _3689);
    float _3733 = _3535 + _1482;
    out.m_80.x = _3557;
    out.m_80.y = _3721;
    out.m_80.z = _3715;
    bool _3735 = _899 <= 8000.0;
    bool _3737 = isnan(_899);
    bool _3739 = _3735 || _3737;
    bool _3741 = isnan(8000.0);
    bool _3743 = _3739 || _3741;
    float _3745 = float(_3743);
    out.m_82.x = _3725;
    out.m_82.y = _3727;
    out.m_82.z = _3713;
    out.m_82.w = _3731;
    float _3747 = _3733 * 0.5;
    float _3749 = _3733;
    float _3751 = _3747;
    float _3753 = _3535;
    if (!_1462)
    {
        _3749 = 1.0;
    }
    float _3755 = _3749;
    float _3757 = _3745 * _3729;
    float _3759 = _3755;
    if (_1462)
    {
        bool _3761 = _1574 >= _1564;
        bool _3763 = isnan(_1574);
        bool _3765 = _3761 || _3763;
        bool _3767 = isnan(_1564);
        bool _3769 = _3765 || _3767;
        float _3771 = float(_3769);
        _3759 = _3771;
    }
    float _3773 = _3759;
    float _3775 = _1587 * _2559;
    float _3777 = _3773 * _2153;
    float _3779 = fma(_2411, _3775, _1581);
    out.gl_Position.x = _1514;
    out.gl_Position.y = _1516;
    out.gl_Position.z = _3535;
    out.gl_Position.w = _1482;
    float _3781 = fma(_2413, _3775, _1583);
    float _3783 = _3757 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3785 = fma(_1587, _3529, _1585);
    out.m_84.z = _3747;
    out.m_84.w = _1482;
    bool _3787 = _2175 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3789 = isnan(_2175);
    bool _3791 = _3787 || _3789;
    bool _3793 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3795 = _3791 || _3793;
    float _3797 = _2493 * _3783;
    float _3799 = precise::clamp(_3797, 0.0, 1.0);
    float _3801 = -_3799;
    float _3803 = fma(_3801, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3805 = -_3777;
    float _3807 = fma(_3805, _3803, 1.0);
    float _3809 = precise::clamp(_3807, 0.0, 1.0);
    float _3811 = -_2547;
    float _3813 = _3811 + 1.0;
    float _3815 = _3809 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3817 = _1587 * _3813;
    float _3819 = _3809;
    float _3821 = _3813;
    if (!_3795)
    {
        _3819 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3823 = _3819;
    float _3825 = _3823;
    float _3827 = _3823;
    if (!_3795)
    {
        _3751 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3829 = _3751;
    out.m_86.x = _3815;
    float _3831 = _3829;
    float _3833 = _3829;
    if (!_3795)
    {
        _1492 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3835 = _1492;
    float _3837 = _3835;
    float _3839 = _3835;
    if (!_3795)
    {
        _3753 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3841 = _3753;
    out.m_88.x = _3779;
    out.m_88.y = _3781;
    out.m_88.z = _3785;
    out.m_88.w = _3817;
    float _3843 = _3841;
    float _3845 = _3841;
    if (!_3795)
    {
        _1518 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3847 = _1518;
    float _3849 = _3847;
    float _3851 = _3847;
    if (!_3795)
    {
        _3821 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3853 = _3821;
    bool _3855 = !_3795;
    float _3857 = _3853;
    float _3859 = _3853;
    if (!_3855)
    {
        bool _3861 = _2175 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3863 = isnan(_2175);
        bool _3865 = _3861 || _3863;
        bool _3867 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3869 = _3865 || _3867;
        if (!_3869)
        {
            float _3871 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3873 = _2175 + _3871;
            float _3875 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3877 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3875;
            float _3879 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3881 = _3879 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3883 = 1.0 / _3877;
            float _3885 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3887 = _3885 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3889 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3891 = _3889 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3893 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3895 = _3893 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3897 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3899 = _3897 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3901 = _3873 * _3883;
            float _3903 = precise::clamp(_3901, 0.0, 1.0);
            float _3905 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3907 = _3905 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3909 = fma(_3903, _3881, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3911 = fma(_3903, _3907, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3913 = fma(_3903, _3887, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3915 = fma(_3903, _3891, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3917 = fma(_3903, _3895, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3919 = fma(_3903, _3899, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3833 = _3913;
            _3851 = _3917;
            _3827 = _3909;
            _3845 = _3915;
            _3839 = _3911;
            _3859 = _3919;
            _3921 = true;
        }
        else
        {
            bool _3923 = _2175 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3925 = isnan(_2175);
            bool _3927 = _3923 || _3925;
            bool _3929 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3931 = _3927 || _3929;
            if (!_3931)
            {
                _3825 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3933 = _3825;
            _3827 = _3933;
            if (!_3931)
            {
                _3831 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3935 = _3831;
            _3833 = _3935;
            if (!_3931)
            {
                _3837 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3937 = _3837;
            _3839 = _3937;
            if (!_3931)
            {
                _3843 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3939 = _3843;
            _3845 = _3939;
            if (!_3931)
            {
                _3849 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3941 = _3849;
            _3851 = _3941;
            if (!_3931)
            {
                _3857 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3943 = _3857;
            bool _3945 = !_3931;
            _3859 = _3943;
            if (!_3945)
            {
                bool _3947 = _2175 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3949 = isnan(_2175);
                bool _3951 = _3947 || _3949;
                bool _3953 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3955 = _3951 || _3953;
                if (!_3955)
                {
                    float _3957 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3959 = _2175 + _3957;
                    float _3961 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3963 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3961;
                    float _3965 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3967 = _3965 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3969 = 1.0 / _3963;
                    float _3971 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3973 = _3971 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3975 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3977 = _3975 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3979 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3981 = _3979 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3983 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3985 = _3983 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3987 = _3959 * _3969;
                    float _3989 = precise::clamp(_3987, 0.0, 1.0);
                    float _3991 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3993 = _3991 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3995 = fma(_3989, _3967, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3997 = fma(_3989, _3993, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3999 = fma(_3989, _3973, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4001 = fma(_3989, _3977, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4003 = fma(_3989, _3981, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4005 = fma(_3989, _3985, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3833 = _3999;
                    _3851 = _4003;
                    _3827 = _3995;
                    _3845 = _4001;
                    _3839 = _3997;
                    _3859 = _4005;
                    _3921 = true;
                }
                else
                {
                    _3833 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3851 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3827 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3845 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3839 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3859 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3921 = false;
    float _4007 = _3833;
    float _4009 = _3851;
    float _4011 = _3827;
    float _4013 = _3845;
    float _4015 = _3839;
    float _4017 = _3859;
    float _4019 = fma(_3721, -0.5, 0.5);
    float _4021 = precise::clamp(_4019, 0.0, 1.0);
    float _4023 = -_4007;
    float _4025 = _4023 + _4009;
    float _4027 = -_4011;
    float _4029 = _4027 + _4013;
    float _4031 = -_4015;
    float _4033 = _4031 + _4017;
    bool _4035 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4037 = fma(_4021, _4025, _4007);
    float _4039 = fma(_4021, _4029, _4011);
    float _4041 = fma(_4021, _4033, _4015);
    float _4043 = _4037 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _4045 = fma(_4039, 0.298911988735198974609375, _4043);
    float _4047 = fma(_4041, 0.114477999508380889892578125, _4045);
    out.m_90.x = 0.0;
    float _4049 = -_4047;
    float _4051 = _4039 + _4049;
    float _4053 = -_4047;
    float _4055 = _4037 + _4053;
    float _4057 = -_4047;
    float _4059 = _4041 + _4057;
    float _4061 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4063 = fma(_4051, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4047);
    float _4065 = fma(_4055, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4047);
    float _4067 = fma(_4059, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4047);
    out.m_86.w = _4061;
    out.m_92.x = _4063;
    out.m_92.y = _4065;
    out.m_92.z = _4067;
    if (!_4035)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4069 = -_1366;
    float _4071 = _4069 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4073 = -_1368;
    float _4075 = _4073 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4077 = -_1370;
    float _4079 = _4077 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4081 = _4071 * _4071;
    float _4083 = fma(_4075, _4075, _4081);
    float _4085 = fma(_4079, _4079, _4083);
    float _4087 = sqrt(_4085);
    float _4089 = rsqrt(_4085);
    float _4091 = -_4087;
    float _4093 = _4091 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4095 = _4093 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4097 = precise::clamp(_4095, 0.0, 1.0);
    float _4099 = _4075 * _4089;
    float _4101 = _4071 * _4089;
    float _4103 = abs(_4097);
    float _4105 = log2(_4103);
    float _4107 = _4079 * _4089;
    float _4109 = _4099 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4111 = _3721 * _4101;
    float _4113 = -_4101;
    float _4115 = -_4109;
    float _4117 = fma(_4113, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4115);
    float _4119 = fma(_3557, _4099, _4111);
    float _4121 = -_4107;
    float _4123 = fma(_4121, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4117);
    float _4125 = fma(_3715, _4107, _4119);
    float _4127 = precise::clamp(_4125, 0.0, 1.0);
    float _4129 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4131 = _4123 + _4129;
    float _4133 = _4105 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4135 = _4131 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4137 = precise::clamp(_4135, 0.0, 1.0);
    float _4139 = exp2(_4133);
    float _4141 = _4139 * _4137;
    float _4143 = _4127 * _4141;
    float _4145 = _4143 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4147 = _4143 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4149 = _4143 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _4145;
    out.m_90.y = _4147;
    out.m_90.z = _4149;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

