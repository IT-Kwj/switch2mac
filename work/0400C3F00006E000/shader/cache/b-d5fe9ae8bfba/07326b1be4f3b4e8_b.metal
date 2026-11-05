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
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
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
    float4 m_78 [[user(locn0)]];
    float4 m_76 [[user(locn1)]];
    float4 m_80 [[user(locn2)]];
    float4 m_82 [[user(locn3)]];
    float4 m_92 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_84 [[user(locn6)]];
    float4 m_74 [[user(locn7)]];
    float4 m_90 [[user(locn8)]];
    float4 m_86 [[user(locn9)]];
    float4 m_88 [[user(locn10)]];
    float4 m_94 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_70 [[attribute(1)]];
    float4 m_63 [[attribute(2)]];
    float4 m_56 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_65 [[attribute(5)]];
    float4 m_72 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2185 = false;
    bool _215 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_56.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_59.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2529 = as_type<float>(_129);
        out.gl_Position.z = _2529;
    }
    if (!_117)
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
        float _149 = float(_113);
        _123 = _149;
    }
    float _151 = _123;
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
    int _163 = 0;
    if (_157)
    {
        float _165 = _161 * 5.0;
        _163 = as_type<int>(_165);
    }
    int _167 = _163;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2599 = as_type<float>(_167);
        out.gl_Position.z = _2599;
    }
    if (_157)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _169 = in.m_63.x;
    float _171 = in.m_63.y;
    float _173 = in.m_63.z;
    bool _175 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _177 = _171 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _179 = _171 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _181 = _171 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _183 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[4].x, _177);
    float _185 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[5].x, _179);
    float _187 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[6].x, _181);
    float _189 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[4].z, _183);
    float _191 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[5].z, _185);
    float _193 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[6].z, _187);
    bool _195 = !_175;
    float _213;
    if (!_195)
    {
        float _197 = in.m_65.x;
        float _199 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _201 = _197 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _203 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _205 = _203 * _199;
        float _207 = floor(_205);
        float _209 = -_207;
        float _211 = _205 + _209;
        _213 = _211;
        _215 = true;
    }
    else
    {
        float _217 = float(_113);
        float _219 = 1.0 / _217;
        float _221 = _145 * _219;
        _213 = _221;
    }
    _215 = false;
    float _223 = _213;
    float _225 = in.m_56.x;
    float _227 = in.m_56.y;
    float _229 = in.m_56.z;
    float _231 = _227 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _233 = _227 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _235 = fma(_225, (*spvDescriptorSet0.vp_c10)._m0[4].x, _231);
    float _237 = fma(_225, (*spvDescriptorSet0.vp_c10)._m0[6].x, _233);
    float _239 = fma(_229, (*spvDescriptorSet0.vp_c10)._m0[4].z, _235);
    float _241 = fma(_229, (*spvDescriptorSet0.vp_c10)._m0[6].z, _237);
    float _243 = _239 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _245 = _241 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _247 = fma(_243, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _249 = fma(_245, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _251 = floor(_247);
    float _253 = floor(_249);
    float _255 = -_251;
    float _257 = _247 + _255;
    float _259 = -_253;
    float _261 = _249 + _259;
    float2 _2775 = float2(_257, _261);
    float _263 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2775, float2(0.0), isnan(_2775)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2775, float2(0.0), isnan(_2775)), level(0.0)).x;
    float _265 = in.m_65.z;
    float _267 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _269 = log2(_267);
    float _271 = as_type<float>(int(gl_VertexIndex));
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _279 = _277 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _281 = in.m_65.x;
    float _283 = in.m_65.y;
    float _285 = 1.0 / _275;
    float _287 = 1.0 / _279;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _291 = _223 + _289;
    float _293 = _269 * _145;
    float _295 = _265 * 2.0;
    float _297 = exp2(_293);
    int _299 = as_type<int>(_271) & 1;
    bool _301 = _299 != 0;
    int _303 = as_type<int>(_271) & 2;
    bool _305 = _303 != 0;
    float _307 = _281 * 2.0;
    int _309 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _311 = _309 != 0;
    int _313 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _315 = _313 != 0;
    int _317 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _319 = _317 != 0;
    float _321 = floor(_295);
    float _323 = _227 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _327 = _223 + _325;
    float _329 = _291 * _287;
    float _331 = _265 + _281;
    float _333 = fma(_225, (*spvDescriptorSet0.vp_c10)._m0[5].x, _323);
    float _335 = _327 * _285;
    float _337 = _283 * 2.0;
    float _339 = floor(_307);
    float _341 = _283 + _265;
    float _343 = _283 + _281;
    float _345 = _331 + (-1.0);
    float _347 = -_297;
    float _349 = _347 + 1.0;
    float _351 = _341 + (-1.0);
    float _353 = _343 + (-1.0);
    bool _355 = _321 > 0.0;
    float _357 = floor(_337);
    bool _359 = _321 >= 0.0;
    bool _361 = isnan(_321);
    bool _363 = _359 || _361;
    bool _365 = isnan(0.0);
    bool _367 = _363 || _365;
    float _369 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _371 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _373 = !_311;
    int _375 = _373 ? 0 : 1;
    int _377 = _367 ? 0 : 1;
    bool _379 = _339 >= 0.0;
    bool _381 = isnan(_339);
    bool _383 = _379 || _381;
    bool _385 = isnan(0.0);
    bool _387 = _383 || _385;
    int _389 = ~_377;
    int _391 = _389 + 1;
    int _393 = _391 + 1;
    int _395 = _393;
    int _397 = 2;
    float _399 = _243;
    if (!_355)
    {
        int _401 = ~_377;
        int _403 = _401 + 1;
        _395 = _403;
    }
    int _405 = _395;
    bool _407 = _339 > 0.0;
    int _409 = _387 ? 0 : 1;
    bool _411 = _357 > 0.0;
    bool _413 = _357 >= 0.0;
    bool _415 = isnan(_357);
    bool _417 = _413 || _415;
    bool _419 = isnan(0.0);
    bool _421 = _417 || _419;
    float _423 = fma(_229, (*spvDescriptorSet0.vp_c10)._m0[5].z, _333);
    int _425 = abs(_375);
    float _427 = float(_405);
    float _429 = _423 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _431 = float(_425);
    int _433 = ~_409;
    int _435 = _433 + 1;
    int _437 = _435 + 1;
    int _439 = _437;
    if (!_407)
    {
        int _441 = ~_409;
        int _443 = _441 + 1;
        _439 = _443;
    }
    int _445 = _439;
    float _447 = _429 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _449 = _431 * _427;
    float _451 = in.m_70.x;
    float _453 = in.m_70.y;
    float _455 = in.m_70.z;
    float _457 = fma(_243, (*spvDescriptorSet0.vp_c8)._m0[11].x, _447);
    float _459 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _461;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _465;
    float _469 = fma(_245, (*spvDescriptorSet0.vp_c8)._m0[11].z, _457);
    float _471 = _429 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _473 = fma(_463, _335, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _475 = fma(_467, _335, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _479 = 1.0 + _477;
    bool _481 = !_315;
    int _483 = _481 ? 0 : 1;
    float _485 = fma(_243, (*spvDescriptorSet0.vp_c8)._m0[10].x, _471);
    bool _487 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _489 = isnan(1.0);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _495 = _491 || _493;
    float _497 = 1.0 / _479;
    int _499 = abs(_483);
    float _501 = fma(_245, (*spvDescriptorSet0.vp_c8)._m0[10].z, _485);
    float _503 = _469 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _505 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _507 = isnan(0.0);
    bool _509 = _505 || _507;
    bool _511 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _513 = _509 || _511;
    float _515 = _449 * (-2.0);
    float _517 = _501 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _519 = 1.0 / _503;
    float _521 = _513 ? _349 : 0.0;
    float _523 = float(_499);
    float _525 = float(_445);
    int _527 = _421 ? 0 : 1;
    if (_495)
    {
        float _529 = _521 * _497;
        _147 = _529;
    }
    float _531 = _147;
    float _533 = _517 + _503;
    float _535 = fma(_371, _515, _371);
    float _537 = fma(_515, _451, _451);
    float _539 = _281 + (-0.5);
    float _541 = _523 * _525;
    int _543 = ~_527;
    int _545 = _543 + 1;
    int _547 = _545 + 1;
    bool _549 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _551 = isnan(_223);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[196].x, _537);
    bool _563 = !_319;
    int _565 = _563 ? 0 : 1;
    float _567 = _533 * _519;
    float _569 = _567 * 0.5;
    int _571 = _547;
    if (!_411)
    {
        int _573 = ~_527;
        int _575 = _573 + 1;
        _571 = _575;
    }
    int _577 = _571;
    float _579 = fma(_535, _531, _561);
    bool _581 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _583 = isnan(_223);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _595 = fma(_569, (*spvDescriptorSet0.vp_c8)._m0[30].w, _593);
    int _597 = abs(_565);
    float _599 = -_559;
    float _601 = _599 + 1.0;
    float _603 = float(_577);
    float _605 = _541 * (-2.0);
    float _607 = float(_597);
    float _609 = _591 * _601;
    float _611 = -_591;
    float _613 = _611 + 1.0;
    float _615 = _283 + (-0.5);
    float _617 = fma(_605, _453, _453);
    float _619 = _607 * _603;
    float _621 = fma(_369, _605, _369);
    bool _623 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _625 = isnan(_223);
    bool _627 = _623 || _625;
    bool _629 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _631 = _627 || _629;
    float _633 = float(_631);
    float _635 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[196].y, _617);
    float _637 = _619 * (-2.0);
    float _639 = _579 * 0.15915493667125701904296875;
    float _641 = 1.0 / _595;
    float _643 = fma(_621, _531, _635);
    float _645 = fma(_459, _637, _459);
    float _647 = in.m_72.x;
    float _649 = in.m_72.y;
    float _651 = fma(_637, _455, _455);
    float _653 = _265 + (-0.5);
    float _655 = _633 * _613;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _663 = _661 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _665 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[196].z, _651);
    float _667 = _473 * _655;
    float _669 = _475 * _655;
    float _671 = -_633;
    float _673 = _671 + 1.0;
    float _675 = fma(_645, _531, _665);
    float _677 = fma(_659, _329, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _679 = fma(_663, _329, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _681 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[143].x, _667);
    float _683 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[143].y, _669);
    float _685 = _643 * 0.15915493667125701904296875;
    float _687 = _675 * 0.15915493667125701904296875;
    float _689 = fma(_677, _609, _681);
    float _691 = fma(_679, _609, _683);
    float _693 = _639 * 6.283185482025146484375;
    float _695 = cos(_693);
    float _697 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[145].x, _689);
    float _699 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[145].y, _691);
    float _701 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _703 = _641 * _701;
    bool _705 = !_305;
    float _707 = _705 ? (-0.5) : 0.5;
    float _709 = _697 * _647;
    bool _711 = !_301;
    float _713 = _711 ? (-0.5) : 0.5;
    float _715 = _685 * 6.283185482025146484375;
    float _717 = sin(_715);
    float _719 = _699 * _649;
    float _721 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _707);
    float _723 = _709 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _725 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _713);
    float _727 = _719 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _729 = _703 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _731 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _733 = _685 * 6.283185482025146484375;
    float _735 = cos(_733);
    float _737 = _727 * _721;
    float _739 = _723 * _725;
    bool _741 = _703 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _743 = _429 + _731;
    float _745 = _639 * 6.283185482025146484375;
    float _747 = sin(_745);
    float _749 = _695 * _717;
    float _751 = _743 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _753 = _743;
    if (!_729)
    {
        _397 = 1;
    }
    int _755 = _397;
    float _757 = _743 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _759 = fma(_243, (*spvDescriptorSet0.vp_c15)._m0[126].x, _751);
    float _761 = _687 * 6.283185482025146484375;
    float _763 = cos(_761);
    float _765 = _695 * _735;
    float _767 = fma(_245, (*spvDescriptorSet0.vp_c15)._m0[126].z, _759);
    float _769 = fma(_243, (*spvDescriptorSet0.vp_c15)._m0[127].x, _757);
    float _771 = _767 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _773 = fma(_245, (*spvDescriptorSet0.vp_c15)._m0[127].z, _769);
    float _775 = _687 * 6.283185482025146484375;
    float _777 = sin(_775);
    float _779 = _747 * _717;
    float _781 = _747 * _735;
    float _783 = _695 * _763;
    float _785 = _747 * _763;
    float _787 = _735 * _763;
    float _789 = _717 * _763;
    float _791 = _783 * _737;
    float _793 = _785 * _737;
    float _795 = fma(_777, _765, _779);
    float _797 = -_749;
    float _799 = fma(_777, _781, _797);
    float _801 = fma(_777, _779, _765);
    float _803 = -_781;
    float _805 = fma(_777, _749, _803);
    float _807 = -_737;
    float _809 = _777 * _807;
    float _811 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _813 = fma(_795, _739, _791);
    float _815 = fma(_787, _739, _809);
    float _817 = fma(_799, _739, _793);
    float _819 = fma(_805, _811, _813);
    bool _821 = !_729;
    int _823 = _821 ? 0 : 1;
    float _825 = fma(_789, _811, _815);
    float _827 = fma(_801, _811, _817);
    float _829 = _819 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _831 = _819 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _833 = _755;
    float _835 = _827;
    if (!_741)
    {
        _833 = _823;
    }
    int _837 = _833;
    float _839 = _819 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _841 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[26].x, _829);
    float _843 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[24].x, _831);
    int _845 = _837 << 6;
    float _847 = trunc(_771);
    int _849 = int(_847);
    float _851 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[26].z, _841);
    float _853 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[24].z, _843);
    int _855 = _845 + 48;
    uint _858 = uint(int(uint(_855) >> uint(2)));
    uint _860 = uint(int(uint(int(_858)) >> uint(2)));
    int _862 = int(_858) & 3;
    float _864 = (*spvDescriptorSet0.vp_c15)._m0[int(_860)][_862];
    int _866 = int(_858) + 1;
    uint _868 = uint(int(uint(_866) >> uint(2)));
    int _870 = _866 & 3;
    float _872 = (*spvDescriptorSet0.vp_c15)._m0[int(_868)][_870];
    float _874 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[25].x, _839);
    float _876 = _851 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _878 = _853 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _880 = _773 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _882 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[25].z, _874);
    float _884 = _245 + _876;
    float _886 = _243 + _878;
    int _888 = _845 + 56;
    uint _890 = uint(int(uint(_888) >> uint(2)));
    uint _892 = uint(int(uint(int(_890)) >> uint(2)));
    int _894 = int(_890) & 3;
    float _896 = (*spvDescriptorSet0.vp_c15)._m0[int(_892)][_894];
    int _898 = int(_890) + 1;
    uint _900 = uint(int(uint(_898) >> uint(2)));
    int _902 = _898 & 3;
    float _904 = (*spvDescriptorSet0.vp_c15)._m0[int(_900)][_902];
    float _906 = trunc(_880);
    int _908 = int(_906);
    float _910 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _912 = _884 + _910;
    float _914 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _916 = _886 + _914;
    float _918 = _882 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _920 = _912 * _912;
    int _922 = _845 + 64;
    uint _924 = uint(int(uint(_922) >> uint(2)));
    uint _926 = uint(int(uint(int(_924)) >> uint(2)));
    int _928 = int(_924) & 3;
    float _930 = (*spvDescriptorSet0.vp_c15)._m0[int(_926)][_928];
    int _932 = int(_924) + 1;
    uint _934 = uint(int(uint(_932) >> uint(2)));
    int _936 = _932 & 3;
    float _938 = (*spvDescriptorSet0.vp_c15)._m0[int(_934)][_936];
    float _940 = _429 + _918;
    float _942 = fma(_916, _916, _920);
    int _944 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _946 = _849 + _944;
    int _948 = _946 + 1;
    float _950 = sqrt(_942);
    int _952 = _845 + 72;
    uint _954 = uint(int(uint(_952) >> uint(2)));
    uint _956 = uint(int(uint(int(_954)) >> uint(2)));
    int _958 = int(_954) & 3;
    float _960 = (*spvDescriptorSet0.vp_c15)._m0[int(_956)][_958];
    int _962 = int(_954) + 1;
    uint _964 = uint(int(uint(_962) >> uint(2)));
    int _966 = _962 & 3;
    float _968 = (*spvDescriptorSet0.vp_c15)._m0[int(_964)][_966];
    int _970 = _845 + 96;
    uint _972 = uint(int(uint(_970) >> uint(2)));
    uint _974 = uint(int(uint(int(_972)) >> uint(2)));
    int _976 = int(_972) & 3;
    float _978 = (*spvDescriptorSet0.vp_c15)._m0[int(_974)][_976];
    int _980 = int(_972) + 1;
    uint _982 = uint(int(uint(_980) >> uint(2)));
    int _984 = _980 & 3;
    float _986 = (*spvDescriptorSet0.vp_c15)._m0[int(_982)][_984];
    bool _988 = _950 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _990 = _845 + 104;
    uint _992 = uint(int(uint(_990) >> uint(2)));
    uint _994 = uint(int(uint(int(_992)) >> uint(2)));
    int _996 = int(_992) & 3;
    float _998 = (*spvDescriptorSet0.vp_c15)._m0[int(_994)][_996];
    int _1000 = int(_992) + 1;
    uint _1002 = uint(int(uint(_1000) >> uint(2)));
    int _1004 = _1000 & 3;
    float _1006 = (*spvDescriptorSet0.vp_c15)._m0[int(_1002)][_1004];
    float _1008 = as_type<float>(_849);
    float _1010 = _884;
    int _1012 = _948;
    float _1014 = as_type<float>(_837);
    if (!_988)
    {
        _1008 = _884;
    }
    float _1016 = _1008;
    float _1018 = _1016;
    if (!_988)
    {
        _835 = _886;
    }
    float _1020 = _835;
    float _1022 = _1020;
    if (!_988)
    {
        _1010 = _940;
    }
    float _1024 = _1010;
    bool _1026 = !_988;
    float _1028 = _1024;
    int _1030 = as_type<int>(_938);
    int _1032 = as_type<int>(_930);
    int _1034 = as_type<int>(_896);
    if (!_1026)
    {
        float _1036 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1038 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1040 = _950 + _1038;
        float _1042 = rsqrt(_942);
        float _1044 = _1040 * _1036;
        float _1046 = _940 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1048 = _1044 * 0.15915493667125701904296875;
        float _1050 = _1048 * 6.283185482025146484375;
        float _1052 = cos(_1050);
        float _1054 = _1048 * 6.283185482025146484375;
        float _1056 = sin(_1054);
        float _1058 = _1052 + (-1.0);
        float _1060 = fma(_1056, _1046, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1062 = _1058 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1064 = _1042 * _1060;
        float _1066 = fma(_940, _1052, _1062);
        float _1068 = fma(_916, _1064, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1070 = fma(_912, _1064, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1028 = _1066;
        _1022 = _1068;
        _1018 = _1070;
    }
    float _1072 = _1028;
    float _1074 = _1022;
    float _1076 = _1018;
    float _1078 = -_429;
    float _1080 = _1078 + _1072;
    int _1082 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1084 = _908 + _1082;
    int _1086 = _1084 + 1;
    int _1088 = _845 + 80;
    uint _1090 = uint(int(uint(_1088) >> uint(2)));
    uint _1092 = uint(int(uint(int(_1090)) >> uint(2)));
    int _1094 = int(_1090) & 3;
    float _1096 = (*spvDescriptorSet0.vp_c15)._m0[int(_1092)][_1094];
    int _1098 = int(_1090) + 1;
    uint _1100 = uint(int(uint(_1098) >> uint(2)));
    int _1102 = _1098 & 3;
    float _1104 = (*spvDescriptorSet0.vp_c15)._m0[int(_1100)][_1102];
    float _1106 = -_243;
    float _1108 = _1106 + _1074;
    float _1110 = _1080 * _1080;
    float _1112 = -_245;
    float _1114 = _1112 + _1076;
    bool _1116 = _948 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1118 = fma(_1108, _1108, _1110);
    int _1120 = _948 | _1086;
    float _1122 = fma(_1114, _1114, _1118);
    bool _1124 = _1120 < 0;
    bool _1126 = _1124 || _1116;
    float _1128 = _743 * _986;
    float _1130 = sqrt(_1122);
    bool _1132 = _1086 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1134 = _1132 || _1126;
    float _1136 = fma(_243, _978, _1128);
    float _1138 = _743 * _872;
    float _1140 = fma(_245, _998, _1136);
    float _1142 = _743 * _938;
    float _1144 = fma(_243, _864, _1138);
    float _1146 = _1140 + _1006;
    float _1148 = fma(_243, _930, _1142);
    float _1150 = fma(_245, _896, _1144);
    float _1152 = _1150;
    float _1154 = _1148;
    float _1156 = _1076;
    if (!_1134)
    {
        int _1158 = _1086 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1160 = _1158 + _948;
        _1012 = _1160;
    }
    int _1162 = _1012;
    float _1164 = _986;
    if (!_1134)
    {
        float _1166 = floor(_771);
        _1164 = _1166;
    }
    float _1168 = _1164;
    bool _1170 = _1130 > 0.0;
    float _1172 = fma(_245, _960, _1148);
    if (!_1134)
    {
        int _1174 = _1162 << 2;
        _1030 = _1174;
    }
    int _1176 = _1030;
    int _1178 = _1176;
    if (!_1134)
    {
        uint _1180 = uint(int(uint(_1162) >> uint(2)));
        _1032 = int(_1180);
    }
    int _1182 = _1032;
    float _1184 = _1172 + _968;
    float _1186 = 1.0 / _1146;
    if (!_1134)
    {
        int _1188 = 12 & _1176;
        _1178 = _1188;
    }
    int _1190 = _1178;
    if (!_1134)
    {
        int _1192 = _1182 << 4;
        int _1194 = _1192 + _1190;
        _1034 = _1194;
    }
    int _1196 = _1034;
    float _1198 = _1150 + _904;
    if (!_1170)
    {
        _1152 = _1074;
    }
    float _1200 = _1152;
    float _1202 = _1200;
    if (!_1170)
    {
        _1154 = _1072;
    }
    float _1204 = _1154;
    bool _1206 = !_1170;
    float _1208 = _1204;
    if (!_1206)
    {
        float _1210 = _191 * _191;
        float _1212 = rsqrt(_1122);
        float _1214 = fma(_189, _189, _1210);
        float _1216 = fma(_193, _193, _1214);
        float _1218 = sqrt(_1216);
        float _1220 = _1108 * _1212;
        float _1222 = _1080 * _1212;
        float _1224 = _1114 * _1212;
        bool _1226 = _1218 > 0.0;
        float _1228 = _1218;
        float _1230 = _1212;
        if (!_1226)
        {
            _1228 = _1074;
        }
        float _1232 = _1228;
        _1202 = _1232;
        if (!_1226)
        {
            _1230 = _1072;
        }
        float _1234 = _1230;
        bool _1236 = !_1226;
        _1208 = _1234;
        if (!_1236)
        {
            float _1238 = rsqrt(_1216);
            float _1240 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1242 = _191 * _1238;
            float _1244 = _189 * _1238;
            float _1246 = _193 * _1238;
            float _1248 = _1222 * _1242;
            float _1250 = fma(_1220, _1244, _1248);
            float _1252 = _1240 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1254 = fma(_1224, _1246, _1250);
            float _1256 = _1254 * _1252;
            float _1258 = fma(_189, _1256, _1074);
            float _1260 = fma(_191, _1256, _1072);
            float _1262 = fma(_193, _1256, _1076);
            _1208 = _1260;
            _1202 = _1258;
            _1156 = _1262;
        }
    }
    float _1264 = _1208;
    float _1266 = _1202;
    float _1268 = _1156;
    int _1270 = _845 + 88;
    uint _1272 = uint(int(uint(_1270) >> uint(2)));
    uint _1274 = uint(int(uint(int(_1272)) >> uint(2)));
    int _1276 = int(_1272) & 3;
    float _1278 = (*spvDescriptorSet0.vp_c15)._m0[int(_1274)][_1276];
    int _1280 = int(_1272) + 1;
    uint _1282 = uint(int(uint(_1280) >> uint(2)));
    int _1284 = _1280 & 3;
    float _1286 = (*spvDescriptorSet0.vp_c15)._m0[int(_1282)][_1284];
    float _1288 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1290 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1292 = _1198 * _1186;
    float _1294 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1296 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1288);
    float _1298 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1290);
    float _1300 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1302 = _1108;
    if (!_1134)
    {
        int _1304 = _1196 + 400;
        uint _1306 = uint(int(uint(_1304) >> uint(2)));
        uint _1308 = uint(int(uint(int(_1306)) >> uint(2)));
        int _1310 = int(_1306) & 3;
        float _1312 = (*spvDescriptorSet0.vp_c15)._m0[int(_1308)][_1310];
        _1302 = _1312;
    }
    float _1314 = _1302;
    float _1316 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1296);
    bool _1318 = _1292 >= 0.0;
    float _1320 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1294);
    float _1322 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1298);
    float _1324 = _1316 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1326 = _1184 * _1186;
    bool _1328 = _1292 <= 1.0;
    bool _1330 = _1328 && _1318;
    float _1332 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1320);
    float _1334 = _1322 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1336 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1338 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1300);
    float _1340 = _1332 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1342 = _1326 >= 0.0;
    bool _1344 = _1342 && _1330;
    float _1346 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1336);
    float _1348 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1338);
    float _1350 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1352 = _1340 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1354 = _1326 <= 1.0;
    bool _1356 = _1354 && _1344;
    float _1358 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1346);
    float _1360 = _1348 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1362 = _743 * _1104;
    float _1364 = -_1352;
    float _1366 = fma(_1364, _1350, 1.0);
    float _1368 = _193;
    float _1370 = _1338;
    if (!_1134)
    {
        float _1372 = floor(_880);
        _1368 = _1372;
    }
    float _1374 = _1368;
    float _1376 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1358);
    float _1378 = fma(_243, _1096, _1362);
    float _1380 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1382 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1384 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1380);
    float _1386 = log2(_1366);
    float _1388 = _1382;
    float _1390 = _1376;
    if (_1356)
    {
        float _1392 = float(_837);
        _1014 = _1392;
    }
    float _1394 = _1014;
    float _1396 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1382);
    float _1398 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1384);
    float _1400 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1396);
    float _1402 = 1.0 / _1376;
    float _1404 = fma(_245, _1278, _1378);
    if (!_1134)
    {
        float _1406 = -_1374;
        float _1408 = _880 + _1406;
        _1370 = _1408;
    }
    float _1410 = _1370;
    float _1412 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1398);
    float _1414 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1400);
    float _1416 = _1404 + _1286;
    float _1418 = _1362;
    float _1420 = _1414;
    if (_1356)
    {
        float _1422 = rint(_1394);
        float _1424 = precise::max(_1422, 0.0);
        uint _1426 = uint(_1424);
        uint _1428 = clamp(_1426, 0u, 65535u);
        _1418 = as_type<float>(_1428);
    }
    float _1430 = _1418;
    float _1432 = _1416 * _1186;
    float _1434 = _1386 * 0.693147182464599609375;
    float _1436 = _1434 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1438 = _1416;
    if (!_1134)
    {
        float _1440 = rint(_1314);
        float _1442 = precise::max(_1440, 0.0);
        uint _1444 = uint(_1442);
        uint _1446 = clamp(_1444, 0u, 65535u);
        _1438 = as_type<float>(_1446);
    }
    float _1448 = _1438;
    float _1450 = _1412 * _1402;
    float _1452 = _1414 * _1402;
    float _1454 = fma(_1450, 0.5, 0.5);
    float _1456 = fma(_1452, -0.5, 0.5);
    float _1458 = _1450;
    float _1460 = _1402;
    if (!_1134)
    {
        float _1462 = -_1168;
        float _1464 = _771 + _1462;
        _1458 = _1464;
    }
    float _1466 = _1458;
    float _1468 = _1394;
    if (_1356)
    {
        float3 _4698 = float3(_1292, _1326, float(as_type<int>(_1430)));
        float3 _4702 = select(_4698, float3(0.0), isnan(_4698));
        float _1470 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4702.xy, uint(rint(_4702.z)), _1432, level(0.0));
        _1468 = _1470;
    }
    float _1472 = _1468;
    float3 _4712 = float3(_1454, _1456, _1436);
    float _1474 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4712, float3(0.0), isnan(_4712)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4712, float3(0.0), isnan(_4712)), level(0.0)).x;
    float3 _4721 = float3(_1454, _1456, _1436);
    float4 _1477 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4721, float3(0.0), isnan(_4721)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4721, float3(0.0), isnan(_4721)), level(0.0)).xyzw;
    float _1479 = _1477.x;
    float _1481 = _1477.y;
    float _1483 = _1477.z;
    float _1485 = _1477.w;
    float _1487 = _1410;
    if (!_1134)
    {
        float3 _4744 = float3(_1466, _1410, float(as_type<int>(_1448)));
        float3 _4746 = select(_4744, float3(0.0), isnan(_4744));
        float _1489 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4746.xy, uint(rint(_4746.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4746.xy, uint(rint(_4746.z)), level(0.0)).x;
        _1487 = _1489;
    }
    float _1491 = _1487;
    if (_1134)
    {
        _1388 = 1.0;
    }
    float _1493 = _1388;
    float _1495 = _1493;
    if (!_1134)
    {
        int _1497 = _1162 << 4;
        int _1499 = _1497 + 2048;
        uint _1501 = uint(int(uint(_1499) >> uint(2)));
        uint _1503 = uint(int(uint(int(_1501)) >> uint(2)));
        int _1505 = int(_1501) & 3;
        float _1507 = (*spvDescriptorSet0.vp_c15)._m0[int(_1503)][_1505];
        int _1509 = int(_1501) + 1;
        uint _1511 = uint(int(uint(_1509) >> uint(2)));
        int _1513 = _1509 & 3;
        float _1515 = (*spvDescriptorSet0.vp_c15)._m0[int(_1511)][_1513];
        int _1517 = _1499 + 8;
        uint _1519 = uint(int(uint(_1517) >> uint(2)));
        uint _1521 = uint(int(uint(int(_1519)) >> uint(2)));
        int _1523 = int(_1519) & 3;
        float _1525 = (*spvDescriptorSet0.vp_c15)._m0[int(_1521)][_1523];
        int _1527 = int(_1519) + 1;
        uint _1529 = uint(int(uint(_1527) >> uint(2)));
        int _1531 = _1527 & 3;
        float _1533 = (*spvDescriptorSet0.vp_c15)._m0[int(_1529)][_1531];
        float _1535 = _743 * _1515;
        float _1537 = fma(_243, _1507, _1535);
        float _1539 = fma(_245, _1525, _1537);
        float _1541 = _1539 + _1533;
        float _1543 = precise::clamp(_1541, 0.0, 1.0);
        float _1545 = -_1543;
        float _1547 = _1545 + _1491;
        float _1549 = fma(_1547, 500.0, 1.5);
        float _1551 = exp2(_1549);
        float _1553 = 0.0 + _1551;
        float _1555 = precise::clamp(_1553, 0.0, 1.0);
        _753 = _1535;
        _1495 = _1555;
    }
    float _1557 = _753;
    float _1559 = _1495;
    float _1561 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1563 = _1264 + _1561;
    float _1565 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1567 = _1266 + _1565;
    float _1569 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1571 = _1268 + _1569;
    float _1573 = _1563 * _1563;
    float _1575 = fma(_1567, _1567, _1573);
    float _1577 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1579 = fma(_1571, _1571, _1575);
    float _1581 = precise::max(0.0, _1577);
    float _1583 = rsqrt(_1579);
    float _1585 = sqrt(_1579);
    float _1587 = _1567 * _1583;
    float _1589 = _1571 * _1583;
    float _1591 = _1563 * _1583;
    float _1593 = _1587 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1595 = _1589 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1597 = -_1591;
    float _1599 = -_1581;
    float _1601 = fma(_1597, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1599);
    float _1603 = _1593 * _1593;
    float _1605 = _1595 * _1595;
    float _1607 = _1603 + _1605;
    float _1609 = sqrt(_1607);
    bool _1611 = _1609 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1613 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1615 = _1609 + _1613;
    float _1617 = _1557;
    float _1619 = _1581;
    float _1621 = _1583;
    float _1623 = _1615;
    float _1625 = _1593;
    float _1627 = _1595;
    float _1629 = _1603;
    float _1631 = _1605;
    if (_1611)
    {
        float _1633 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1617 = _1633;
    }
    float _1635 = _1617;
    if (_1611)
    {
        float _1637 = _1601 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1619 = _1637;
    }
    float _1639 = _1619;
    float _1641 = _1639;
    if (_1611)
    {
        float _1643 = rsqrt(_1607);
        _1621 = _1643;
    }
    float _1645 = _1621;
    float _1647 = _1645;
    if (_1611)
    {
        float _1649 = _1615 * _1635;
        _1623 = _1649;
    }
    float _1651 = _1623;
    if (_1611)
    {
        float _1653 = _1651 * 0.15915493667125701904296875;
        _1460 = _1653;
    }
    float _1655 = _1460;
    float _1657 = _1635;
    if (_1611)
    {
        float _1659 = _1655 * 6.283185482025146484375;
        float _1661 = sin(_1659);
        _1657 = _1661;
    }
    float _1663 = _1657;
    float _1665 = _1651;
    if (_1611)
    {
        float _1667 = _1655 * 6.283185482025146484375;
        float _1669 = cos(_1667);
        _1665 = _1669;
    }
    float _1671 = _1665;
    float _1673 = _1663;
    if (_1611)
    {
        float _1675 = fma(_1663, _1639, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _399 = _1675;
    }
    float _1677 = _399;
    float _1679 = _1677;
    if (_1611)
    {
        float _1681 = _1645 * _1677;
        _1679 = _1681;
    }
    float _1683 = _1679;
    if (!_1611)
    {
        _1647 = _1601;
    }
    float _1685 = _1647;
    float _1687 = _1685;
    if (_1611)
    {
        float _1689 = _1671 + (-1.0);
        _1641 = _1689;
    }
    float _1691 = _1641;
    if (_1611)
    {
        float _1693 = _1593 * _1683;
        _1625 = _1693;
    }
    float _1695 = _1625;
    if (_1611)
    {
        float _1697 = _1595 * _1683;
        _1627 = _1697;
    }
    float _1699 = _1627;
    if (_1611)
    {
        float _1701 = _1691 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1673 = _1701;
    }
    float _1703 = _1673;
    if (_1611)
    {
        float _1705 = _1695 * _1695;
        _1629 = _1705;
    }
    float _1707 = _1629;
    if (_1611)
    {
        float _1709 = _1699 * _1699;
        _1631 = _1709;
    }
    float _1711 = _1631;
    if (_1611)
    {
        float _1713 = fma(_1601, _1671, _1703);
        _1687 = _1713;
    }
    float _1715 = _1687;
    float _1717 = fma(_1715, _1715, _1707);
    float _1719 = _1717 + _1711;
    float _1721 = rsqrt(_1719);
    float _1723 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1725 = fma(_1585, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1723);
    float _1727 = precise::clamp(_1725, 0.0, 1.0);
    float _1729 = -_1727;
    float _1731 = _1729 + 1.0;
    float _1733 = abs(_1731);
    float _1735 = log2(_1733);
    float _1737 = _1721 * _1695;
    float _1739 = _1721 * _1715;
    float _1741 = _1721 * _1699;
    float _1743 = _1737 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1745 = -_1743;
    float _1747 = fma(_1739, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1745);
    float _1749 = -_1741;
    float _1751 = fma(_1749, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1747);
    float _1753 = _1735 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1755 = fma(_1751, -0.5, 0.5);
    float _1757 = exp2(_1753);
    float _1759 = fma(_1751, 0.5, 0.5);
    float _1761 = fma(_1759, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1763 = sqrt(_1755);
    float _1765 = fma(_1759, _1761, -0.212114393711090087890625);
    float _1767 = _1739 + 1.0;
    float _1769 = fma(_1759, _1765, 1.570728778839111328125);
    float _1771 = -_1739;
    float _1773 = fma(_1757, _1767, _1771);
    float _1775 = fma(_1773, 0.5, 0.5);
    float _1777 = _1763 * 0.636619746685028076171875;
    float _1779 = -_1769;
    float _1781 = fma(_1777, _1779, 1.0);
    float2 _5201 = float2(_1781, _1775);
    float3 _1785 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5201, float2(0.0), isnan(_5201)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5201, float2(0.0), isnan(_5201)), level(0.0)).xyz;
    float _1787 = _1785.x;
    float _1789 = _1785.y;
    float _1791 = _1785.z;
    float _1793 = abs(_703);
    float _1795 = log2(_1793);
    float _1797 = _783 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1799 = _283 > 0.5;
    float _1801 = _1735 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1805 = _1803 != 0;
    float _1807 = -_263;
    float _1809 = _1807 + 1.0;
    bool _1811 = _281 > 0.5;
    float _1813 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1815 = -_707;
    int _1817 = _1799 ? as_type<int>(_1815) : as_type<int>(_707);
    out.m_74.x = _1266;
    out.m_74.y = _1264;
    out.m_74.z = _1268;
    int _1819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1821 = _1819 != 0;
    float _1823 = -_713;
    int _1825 = _1811 ? as_type<int>(_1823) : as_type<int>(_713);
    float _1827 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1829 = !_1805;
    float _1831 = _1829 ? _707 : as_type<float>(_1817);
    float _1833 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1835 = !_1821;
    float _1837 = _1835 ? _713 : as_type<float>(_1825);
    float _1839 = _1795 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1841 = -_1831;
    float _1843 = _1841 + 0.5;
    float _1845 = _1833 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1847 = _1837 + 0.5;
    float _1849 = exp2(_1839);
    float _1851 = _1843 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1853 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1855 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1857 = _1847 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1859 = _1851 * _1813;
    float _1861 = _783 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1863 = _783 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1865 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1867 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1869 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1871 = _1853 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1873 = _1855 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1875 = _1857 * _1827;
    float _1877 = -_777;
    float _1879 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1861);
    float _1881 = -_777;
    float _1883 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1863);
    float _1885 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1887 = _1865 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1889 = _1867 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1891 = _1869 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1893 = -_777;
    float _1895 = fma(_1893, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1797);
    out.m_76.x = _1871;
    out.m_76.y = _1873;
    out.m_76.z = _1845;
    float _1897 = _707 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1899 = _713 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1901 = exp2(_1801);
    out.m_78.x = _1887;
    out.m_78.y = _1889;
    out.m_78.z = _1891;
    out.m_78.w = _1885;
    float _1903 = fma(_1849, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1905 = precise::clamp(_1903, 0.0, 1.0);
    out.m_80.x = _1875;
    out.m_80.y = _1859;
    float _1907 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1879);
    float _1909 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1883);
    float _1911 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1895);
    float _1913 = _795 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1915 = _1897 * _1907;
    float _1917 = _795 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1919 = _795 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1921 = fma(_1905, -2.0, 3.0);
    float _1923 = _1905 * _1905;
    float _1925 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1917);
    float _1927 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1919);
    float _1929 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1913);
    float _1931 = _1923 * _1921;
    float _1933 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1925);
    float _1935 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1927);
    float _1937 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1929);
    float _1939 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1941 = fma(_1899, _1933, _1915);
    float _1943 = -_1931;
    float _1945 = _1943 + 1.0;
    float _1947 = _805 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1949 = _805 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1951 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1939);
    float _1953 = fma(_1945, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1931);
    float _1955 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1947);
    bool _1957 = _703 <= 8000.0;
    bool _1959 = isnan(_703);
    bool _1961 = _1957 || _1959;
    bool _1963 = isnan(8000.0);
    bool _1965 = _1961 || _1963;
    float _1967 = float(_1965);
    float _1969 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1949);
    float _1971 = _1897 * _1909;
    float _1973 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1951);
    float _1975 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1955);
    float _1977 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1969);
    float _1979 = fma(_1899, _1935, _1971);
    float _1981 = _1967 * _1953;
    float _1983 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1973);
    float _1985 = _1975 + _1941;
    float _1987 = -_1901;
    float _1989 = _1987 + 1.0;
    float _1991 = _1977 + _1979;
    float _1993 = _1981 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1995 = _1983 + _1376;
    float _1997 = _1967;
    float _1999 = _1983;
    if (!_1356)
    {
        _1997 = 1.0;
    }
    float _2001 = _1997;
    float _2003 = _1989 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2005 = _2001;
    if (_1356)
    {
        bool _2007 = _1472 >= _1432;
        bool _2009 = isnan(_1472);
        bool _2011 = _2007 || _2009;
        bool _2013 = isnan(_1432);
        bool _2015 = _2011 || _2013;
        float _2017 = float(_2015);
        _2005 = _2017;
    }
    float _2019 = _2005;
    float _2021 = _805 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2023 = _1809 * _1993;
    float _2025 = precise::clamp(_2023, 0.0, 1.0);
    float _2027 = _1995 * 0.5;
    float _2029 = _2003 * _1474;
    float _2031 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2021);
    float _2033 = _1897 * _1911;
    float _2035 = _2019 * _1559;
    float _2037 = -_2025;
    float _2039 = fma(_2037, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_82.z = _2027;
    out.m_82.w = _1376;
    float _2041 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2031);
    float _2043 = fma(_1899, _1937, _2033);
    float _2045 = -_2035;
    float _2047 = fma(_2045, _2039, 1.0);
    float _2049 = precise::clamp(_2047, 0.0, 1.0);
    out.gl_Position.x = _1412;
    out.gl_Position.y = _1414;
    out.gl_Position.z = _1983;
    out.gl_Position.w = _1376;
    bool _2051 = _1585 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2053 = isnan(_1585);
    bool _2055 = _2051 || _2053;
    bool _2057 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2059 = _2055 || _2057;
    float _2061 = _2041 + _2043;
    float _2063 = _2049 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2065 = _1485 * _2029;
    out.m_84.x = _1985;
    out.m_84.y = _1991;
    out.m_84.z = _2061;
    out.m_86.x = _2063;
    float _2067 = -_2003;
    float _2069 = _2067 + 1.0;
    float _2071 = _2035;
    float _2073 = _2069;
    float _2075 = _2049;
    if (!_2059)
    {
        _2071 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2077 = _2071;
    float _2079 = _2077;
    float _2081 = _2077;
    if (!_2059)
    {
        _1390 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2083 = _1390;
    float _2085 = _1485 * _2069;
    float _2087 = _2083;
    float _2089 = _2083;
    if (!_2059)
    {
        _1999 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2091 = _1999;
    float _2093 = _2091;
    float _2095 = _2091;
    if (!_2059)
    {
        _1420 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2097 = _1420;
    float _2099 = _2097;
    float _2101 = _2097;
    if (!_2059)
    {
        _2073 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2103 = _2073;
    float _2105 = _2103;
    float _2107 = _2103;
    if (!_2059)
    {
        _2075 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2109 = _2075;
    float _2111 = _1791 * _2029;
    float _2113 = fma(_1787, _2065, _1479);
    float _2115 = fma(_1789, _2065, _1481);
    float _2117 = fma(_1485, _2111, _1483);
    out.m_88.x = _2113;
    out.m_88.y = _2115;
    out.m_88.z = _2117;
    out.m_88.w = _2085;
    bool _2119 = !_2059;
    float _2121 = _2109;
    float _2123 = _2109;
    if (!_2119)
    {
        bool _2125 = _1585 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2127 = isnan(_1585);
        bool _2129 = _2125 || _2127;
        bool _2131 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2133 = _2129 || _2131;
        if (!_2133)
        {
            float _2135 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2137 = _1585 + _2135;
            float _2139 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2141 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2139;
            float _2143 = 1.0 / _2141;
            float _2145 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2147 = _2145 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2149 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2151 = _2149 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2153 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2155 = _2153 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2157 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2159 = _2157 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2161 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2163 = _2161 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2165 = _2137 * _2143;
            float _2167 = precise::clamp(_2165, 0.0, 1.0);
            float _2169 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2171 = _2169 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2173 = fma(_2167, _2147, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2175 = fma(_2167, _2171, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2177 = fma(_2167, _2151, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2179 = fma(_2167, _2155, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2181 = fma(_2167, _2159, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2183 = fma(_2167, _2163, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2089 = _2175;
            _2107 = _2181;
            _2081 = _2173;
            _2101 = _2179;
            _2095 = _2177;
            _2123 = _2183;
            _2185 = true;
        }
        else
        {
            bool _2187 = _1585 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2189 = isnan(_1585);
            bool _2191 = _2187 || _2189;
            bool _2193 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2195 = _2191 || _2193;
            if (!_2195)
            {
                _2079 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2197 = _2079;
            _2081 = _2197;
            if (!_2195)
            {
                _2087 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2199 = _2087;
            _2089 = _2199;
            if (!_2195)
            {
                _2093 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2201 = _2093;
            _2095 = _2201;
            if (!_2195)
            {
                _2099 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2203 = _2099;
            _2101 = _2203;
            if (!_2195)
            {
                _2105 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2205 = _2105;
            _2107 = _2205;
            if (!_2195)
            {
                _2121 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2207 = _2121;
            bool _2209 = !_2195;
            _2123 = _2207;
            if (!_2209)
            {
                bool _2211 = _1585 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2213 = isnan(_1585);
                bool _2215 = _2211 || _2213;
                bool _2217 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2219 = _2215 || _2217;
                if (!_2219)
                {
                    float _2221 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2223 = _1585 + _2221;
                    float _2225 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2227 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2225;
                    float _2229 = 1.0 / _2227;
                    float _2231 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2233 = _2231 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2235 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2237 = _2235 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2239 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2241 = _2239 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2243 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2245 = _2243 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2247 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2249 = _2247 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2251 = _2223 * _2229;
                    float _2253 = precise::clamp(_2251, 0.0, 1.0);
                    float _2255 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2257 = _2255 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2259 = fma(_2253, _2233, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2261 = fma(_2253, _2257, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2263 = fma(_2253, _2237, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2265 = fma(_2253, _2241, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2267 = fma(_2253, _2245, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2269 = fma(_2253, _2249, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2089 = _2261;
                    _2107 = _2267;
                    _2081 = _2259;
                    _2101 = _2265;
                    _2095 = _2263;
                    _2123 = _2269;
                    _2185 = true;
                }
                else
                {
                    _2089 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2107 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2081 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2101 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2095 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2123 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2185 = false;
    float _2271 = _2089;
    float _2273 = _2107;
    float _2275 = _2081;
    float _2277 = _2101;
    float _2279 = _2095;
    float _2281 = _2123;
    float _2283 = fma(_1991, -0.5, 0.5);
    float _2285 = precise::clamp(_2283, 0.0, 1.0);
    float _2287 = -_2271;
    float _2289 = _2287 + _2273;
    float _2291 = -_2275;
    float _2293 = _2291 + _2277;
    float _2295 = -_2279;
    float _2297 = _2295 + _2281;
    bool _2299 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2301 = fma(_2285, _2289, _2271);
    float _2303 = fma(_2285, _2293, _2275);
    float _2305 = fma(_2285, _2297, _2279);
    float _2307 = _2301 * 0.586610972881317138671875;
    out.m_90.x = 0.0;
    float _2309 = fma(_2303, 0.298911988735198974609375, _2307);
    float _2311 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2313 = fma(_2305, 0.114477999508380889892578125, _2309);
    out.m_59.x = _2311;
    float _2315 = -_2313;
    float _2317 = _2303 + _2315;
    float _2319 = -_2313;
    float _2321 = _2301 + _2319;
    float _2323 = -_2313;
    float _2325 = _2305 + _2323;
    out.m_92.x = 0.0;
    float _2327 = fma(_2317, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2313);
    float _2329 = fma(_2321, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2313);
    float _2331 = fma(_2325, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2313);
    out.m_94.x = _2327;
    out.m_94.y = _2329;
    out.m_94.z = _2331;
    if (!_2299)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2333 = -_1264;
    float _2335 = _2333 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2337 = -_1266;
    float _2339 = _2337 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2341 = -_1268;
    float _2343 = _2341 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2345 = _2335 * _2335;
    float _2347 = fma(_2339, _2339, _2345);
    float _2349 = fma(_2343, _2343, _2347);
    float _2351 = rsqrt(_2349);
    float _2353 = _2335 * _2351;
    float _2355 = _2339 * _2351;
    float _2357 = _2343 * _2351;
    float _2359 = sqrt(_2349);
    float _2361 = -_1591;
    float _2363 = _2361 + _2353;
    float _2365 = -_1587;
    float _2367 = _2365 + _2355;
    float _2369 = -_1589;
    float _2371 = _2369 + _2357;
    float _2373 = _2363 * _2363;
    float _2375 = fma(_2367, _2367, _2373);
    float _2377 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2379 = precise::clamp(_2377, 0.0, 1.0);
    float _2381 = fma(_2371, _2371, _2375);
    float _2383 = _2379 * _2379;
    float _2385 = -_2359;
    float _2387 = _2385 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2389 = _2383 + (-1.0);
    float _2391 = rsqrt(_2381);
    float _2393 = _2387 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2395 = precise::clamp(_2393, 0.0, 1.0);
    float _2397 = abs(_2395);
    float _2399 = log2(_2397);
    float _2401 = _2363 * _2391;
    float _2403 = _2367 * _2391;
    float _2405 = _2371 * _2391;
    float _2407 = _1991 * _2401;
    float _2409 = _1991 * _2353;
    float _2411 = fma(_1985, _2403, _2407);
    float _2413 = _2399 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2415 = fma(_1985, _2355, _2409);
    float _2417 = fma(_2061, _2405, _2411);
    float _2419 = precise::clamp(_2417, 0.0, 1.0);
    float _2421 = fma(_2061, _2357, _2415);
    float _2423 = precise::clamp(_2421, 0.0, 1.0);
    float _2425 = exp2(_2413);
    float _2427 = _2419 * _2419;
    float _2429 = _2355 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2431 = fma(_2427, _2389, 1.0);
    float _2433 = -_2353;
    float _2435 = -_2429;
    float _2437 = fma(_2433, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2435);
    float _2439 = _2431 * _2431;
    float _2441 = -_2357;
    float _2443 = fma(_2441, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2437);
    float _2445 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2447 = _2443 + _2445;
    float _2449 = 1.0 / _2439;
    float _2451 = _2447 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2453 = precise::clamp(_2451, 0.0, 1.0);
    float _2455 = _2425 * _2453;
    float _2457 = _2423 * _2455;
    float _2459 = _2457 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2461 = _2383 * _2449;
    float _2463 = _2457 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2465 = _2457 * _2461;
    float _2467 = _2457 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2469 = _2465 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2471 = _2465 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2473 = _2465 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _2459;
    out.m_90.y = _2467;
    out.m_90.z = _2463;
    out.m_92.x = _2469;
    out.m_92.y = _2471;
    out.m_92.z = _2473;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2185 = false;
    bool _215 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_56.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_59.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2529 = as_type<float>(_129);
        out.gl_Position.z = _2529;
    }
    if (!_117)
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
        float _149 = float(_113);
        _123 = _149;
    }
    float _151 = _123;
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
    int _163 = 0;
    if (_157)
    {
        float _165 = _161 * 5.0;
        _163 = as_type<int>(_165);
    }
    int _167 = _163;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2599 = as_type<float>(_167);
        out.gl_Position.z = _2599;
    }
    if (_157)
    {
        return out;
    }
    float _169 = in.m_63.x;
    float _171 = in.m_63.y;
    float _173 = in.m_63.z;
    bool _175 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _177 = _171 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _179 = _171 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _181 = _171 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _183 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[4].x, _177);
    float _185 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[5].x, _179);
    float _187 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[6].x, _181);
    float _189 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[4].z, _183);
    float _191 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[5].z, _185);
    float _193 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[6].z, _187);
    bool _195 = !_175;
    float _213;
    if (!_195)
    {
        float _197 = in.m_65.x;
        float _199 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _201 = _197 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _203 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _205 = _203 * _199;
        float _207 = floor(_205);
        float _209 = -_207;
        float _211 = _205 + _209;
        _213 = _211;
        _215 = true;
    }
    else
    {
        float _217 = float(_113);
        float _219 = 1.0 / _217;
        float _221 = _145 * _219;
        _213 = _221;
    }
    _215 = false;
    float _223 = _213;
    float _225 = in.m_56.x;
    float _227 = in.m_56.y;
    float _229 = in.m_56.z;
    float _231 = _227 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _233 = _227 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _235 = fma(_225, (*spvDescriptorSet0.vp_c10)._m0[4].x, _231);
    float _237 = fma(_225, (*spvDescriptorSet0.vp_c10)._m0[6].x, _233);
    float _239 = fma(_229, (*spvDescriptorSet0.vp_c10)._m0[4].z, _235);
    float _241 = fma(_229, (*spvDescriptorSet0.vp_c10)._m0[6].z, _237);
    float _243 = _239 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _245 = _241 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _247 = fma(_243, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _249 = fma(_245, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _251 = floor(_247);
    float _253 = floor(_249);
    float _255 = -_251;
    float _257 = _247 + _255;
    float _259 = -_253;
    float _261 = _249 + _259;
    float2 _2775 = float2(_257, _261);
    float _263 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2775, float2(0.0), isnan(_2775)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2775, float2(0.0), isnan(_2775)), level(0.0)).x;
    float _265 = in.m_65.z;
    float _267 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _269 = log2(_267);
    float _271 = as_type<float>(int(gl_VertexIndex));
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _279 = _277 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _281 = in.m_65.x;
    float _283 = in.m_65.y;
    float _285 = 1.0 / _275;
    float _287 = 1.0 / _279;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _291 = _223 + _289;
    float _293 = _269 * _145;
    float _295 = _265 * 2.0;
    float _297 = exp2(_293);
    int _299 = as_type<int>(_271) & 1;
    bool _301 = _299 != 0;
    int _303 = as_type<int>(_271) & 2;
    bool _305 = _303 != 0;
    float _307 = _281 * 2.0;
    int _309 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _311 = _309 != 0;
    int _313 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _315 = _313 != 0;
    int _317 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _319 = _317 != 0;
    float _321 = floor(_295);
    float _323 = _227 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _327 = _223 + _325;
    float _329 = _291 * _287;
    float _331 = _265 + _281;
    float _333 = fma(_225, (*spvDescriptorSet0.vp_c10)._m0[5].x, _323);
    float _335 = _327 * _285;
    float _337 = _283 * 2.0;
    float _339 = floor(_307);
    float _341 = _283 + _265;
    float _343 = _283 + _281;
    float _345 = _331 + (-1.0);
    float _347 = -_297;
    float _349 = _347 + 1.0;
    float _351 = _341 + (-1.0);
    float _353 = _343 + (-1.0);
    bool _355 = _321 > 0.0;
    float _357 = floor(_337);
    bool _359 = _321 >= 0.0;
    bool _361 = isnan(_321);
    bool _363 = _359 || _361;
    bool _365 = isnan(0.0);
    bool _367 = _363 || _365;
    float _369 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _371 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _373 = !_311;
    int _375 = _373 ? 0 : 1;
    int _377 = _367 ? 0 : 1;
    bool _379 = _339 >= 0.0;
    bool _381 = isnan(_339);
    bool _383 = _379 || _381;
    bool _385 = isnan(0.0);
    bool _387 = _383 || _385;
    int _389 = ~_377;
    int _391 = _389 + 1;
    int _393 = _391 + 1;
    int _395 = _393;
    int _397 = 2;
    float _399 = _243;
    if (!_355)
    {
        int _401 = ~_377;
        int _403 = _401 + 1;
        _395 = _403;
    }
    int _405 = _395;
    bool _407 = _339 > 0.0;
    int _409 = _387 ? 0 : 1;
    bool _411 = _357 > 0.0;
    bool _413 = _357 >= 0.0;
    bool _415 = isnan(_357);
    bool _417 = _413 || _415;
    bool _419 = isnan(0.0);
    bool _421 = _417 || _419;
    float _423 = fma(_229, (*spvDescriptorSet0.vp_c10)._m0[5].z, _333);
    int _425 = abs(_375);
    float _427 = float(_405);
    float _429 = _423 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _431 = float(_425);
    int _433 = ~_409;
    int _435 = _433 + 1;
    int _437 = _435 + 1;
    int _439 = _437;
    if (!_407)
    {
        int _441 = ~_409;
        int _443 = _441 + 1;
        _439 = _443;
    }
    int _445 = _439;
    float _447 = _429 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _449 = _431 * _427;
    float _451 = in.m_70.x;
    float _453 = in.m_70.y;
    float _455 = in.m_70.z;
    float _457 = fma(_243, (*spvDescriptorSet0.vp_c8)._m0[11].x, _447);
    float _459 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _461;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _465;
    float _469 = fma(_245, (*spvDescriptorSet0.vp_c8)._m0[11].z, _457);
    float _471 = _429 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _473 = fma(_463, _335, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _475 = fma(_467, _335, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _479 = 1.0 + _477;
    bool _481 = !_315;
    int _483 = _481 ? 0 : 1;
    float _485 = fma(_243, (*spvDescriptorSet0.vp_c8)._m0[10].x, _471);
    bool _487 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _489 = isnan(1.0);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _495 = _491 || _493;
    float _497 = 1.0 / _479;
    int _499 = abs(_483);
    float _501 = fma(_245, (*spvDescriptorSet0.vp_c8)._m0[10].z, _485);
    float _503 = _469 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _505 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _507 = isnan(0.0);
    bool _509 = _505 || _507;
    bool _511 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _513 = _509 || _511;
    float _515 = _449 * (-2.0);
    float _517 = _501 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _519 = 1.0 / _503;
    float _521 = _513 ? _349 : 0.0;
    float _523 = float(_499);
    float _525 = float(_445);
    int _527 = _421 ? 0 : 1;
    if (_495)
    {
        float _529 = _521 * _497;
        _147 = _529;
    }
    float _531 = _147;
    float _533 = _517 + _503;
    float _535 = fma(_371, _515, _371);
    float _537 = fma(_515, _451, _451);
    float _539 = _281 + (-0.5);
    float _541 = _523 * _525;
    int _543 = ~_527;
    int _545 = _543 + 1;
    int _547 = _545 + 1;
    bool _549 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _551 = isnan(_223);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[196].x, _537);
    bool _563 = !_319;
    int _565 = _563 ? 0 : 1;
    float _567 = _533 * _519;
    float _569 = _567 * 0.5;
    int _571 = _547;
    if (!_411)
    {
        int _573 = ~_527;
        int _575 = _573 + 1;
        _571 = _575;
    }
    int _577 = _571;
    float _579 = fma(_535, _531, _561);
    bool _581 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _583 = isnan(_223);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _595 = fma(_569, (*spvDescriptorSet0.vp_c8)._m0[30].w, _593);
    int _597 = abs(_565);
    float _599 = -_559;
    float _601 = _599 + 1.0;
    float _603 = float(_577);
    float _605 = _541 * (-2.0);
    float _607 = float(_597);
    float _609 = _591 * _601;
    float _611 = -_591;
    float _613 = _611 + 1.0;
    float _615 = _283 + (-0.5);
    float _617 = fma(_605, _453, _453);
    float _619 = _607 * _603;
    float _621 = fma(_369, _605, _369);
    bool _623 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _625 = isnan(_223);
    bool _627 = _623 || _625;
    bool _629 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _631 = _627 || _629;
    float _633 = float(_631);
    float _635 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[196].y, _617);
    float _637 = _619 * (-2.0);
    float _639 = _579 * 0.15915493667125701904296875;
    float _641 = 1.0 / _595;
    float _643 = fma(_621, _531, _635);
    float _645 = fma(_459, _637, _459);
    float _647 = in.m_72.x;
    float _649 = in.m_72.y;
    float _651 = fma(_637, _455, _455);
    float _653 = _265 + (-0.5);
    float _655 = _633 * _613;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _663 = _661 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _665 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[196].z, _651);
    float _667 = _473 * _655;
    float _669 = _475 * _655;
    float _671 = -_633;
    float _673 = _671 + 1.0;
    float _675 = fma(_645, _531, _665);
    float _677 = fma(_659, _329, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _679 = fma(_663, _329, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _681 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[143].x, _667);
    float _683 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[143].y, _669);
    float _685 = _643 * 0.15915493667125701904296875;
    float _687 = _675 * 0.15915493667125701904296875;
    float _689 = fma(_677, _609, _681);
    float _691 = fma(_679, _609, _683);
    float _693 = _639 * 6.283185482025146484375;
    float _695 = cos(_693);
    float _697 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[145].x, _689);
    float _699 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[145].y, _691);
    float _701 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _703 = _641 * _701;
    bool _705 = !_305;
    float _707 = _705 ? (-0.5) : 0.5;
    float _709 = _697 * _647;
    bool _711 = !_301;
    float _713 = _711 ? (-0.5) : 0.5;
    float _715 = _685 * 6.283185482025146484375;
    float _717 = sin(_715);
    float _719 = _699 * _649;
    float _721 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _707);
    float _723 = _709 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _725 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _713);
    float _727 = _719 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _729 = _703 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _731 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _733 = _685 * 6.283185482025146484375;
    float _735 = cos(_733);
    float _737 = _727 * _721;
    float _739 = _723 * _725;
    bool _741 = _703 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _743 = _429 + _731;
    float _745 = _639 * 6.283185482025146484375;
    float _747 = sin(_745);
    float _749 = _695 * _717;
    float _751 = _743 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _753 = _743;
    if (!_729)
    {
        _397 = 1;
    }
    int _755 = _397;
    float _757 = _743 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _759 = fma(_243, (*spvDescriptorSet0.vp_c15)._m0[126].x, _751);
    float _761 = _687 * 6.283185482025146484375;
    float _763 = cos(_761);
    float _765 = _695 * _735;
    float _767 = fma(_245, (*spvDescriptorSet0.vp_c15)._m0[126].z, _759);
    float _769 = fma(_243, (*spvDescriptorSet0.vp_c15)._m0[127].x, _757);
    float _771 = _767 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _773 = fma(_245, (*spvDescriptorSet0.vp_c15)._m0[127].z, _769);
    float _775 = _687 * 6.283185482025146484375;
    float _777 = sin(_775);
    float _779 = _747 * _717;
    float _781 = _747 * _735;
    float _783 = _695 * _763;
    float _785 = _747 * _763;
    float _787 = _735 * _763;
    float _789 = _717 * _763;
    float _791 = _783 * _737;
    float _793 = _785 * _737;
    float _795 = fma(_777, _765, _779);
    float _797 = -_749;
    float _799 = fma(_777, _781, _797);
    float _801 = fma(_777, _779, _765);
    float _803 = -_781;
    float _805 = fma(_777, _749, _803);
    float _807 = -_737;
    float _809 = _777 * _807;
    float _811 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _813 = fma(_795, _739, _791);
    float _815 = fma(_787, _739, _809);
    float _817 = fma(_799, _739, _793);
    float _819 = fma(_805, _811, _813);
    bool _821 = !_729;
    int _823 = _821 ? 0 : 1;
    float _825 = fma(_789, _811, _815);
    float _827 = fma(_801, _811, _817);
    float _829 = _819 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _831 = _819 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _833 = _755;
    float _835 = _827;
    if (!_741)
    {
        _833 = _823;
    }
    int _837 = _833;
    float _839 = _819 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _841 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[26].x, _829);
    float _843 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[24].x, _831);
    int _845 = _837 << 6;
    float _847 = trunc(_771);
    int _849 = int(_847);
    float _851 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[26].z, _841);
    float _853 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[24].z, _843);
    int _855 = _845 + 48;
    uint _858 = uint(int(uint(_855) >> uint(2)));
    uint _860 = uint(int(uint(int(_858)) >> uint(2)));
    int _862 = int(_858) & 3;
    float _864 = (*spvDescriptorSet0.vp_c15)._m0[int(_860)][_862];
    int _866 = int(_858) + 1;
    uint _868 = uint(int(uint(_866) >> uint(2)));
    int _870 = _866 & 3;
    float _872 = (*spvDescriptorSet0.vp_c15)._m0[int(_868)][_870];
    float _874 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[25].x, _839);
    float _876 = _851 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _878 = _853 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _880 = _773 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _882 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[25].z, _874);
    float _884 = _245 + _876;
    float _886 = _243 + _878;
    int _888 = _845 + 56;
    uint _890 = uint(int(uint(_888) >> uint(2)));
    uint _892 = uint(int(uint(int(_890)) >> uint(2)));
    int _894 = int(_890) & 3;
    float _896 = (*spvDescriptorSet0.vp_c15)._m0[int(_892)][_894];
    int _898 = int(_890) + 1;
    uint _900 = uint(int(uint(_898) >> uint(2)));
    int _902 = _898 & 3;
    float _904 = (*spvDescriptorSet0.vp_c15)._m0[int(_900)][_902];
    float _906 = trunc(_880);
    int _908 = int(_906);
    float _910 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _912 = _884 + _910;
    float _914 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _916 = _886 + _914;
    float _918 = _882 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _920 = _912 * _912;
    int _922 = _845 + 64;
    uint _924 = uint(int(uint(_922) >> uint(2)));
    uint _926 = uint(int(uint(int(_924)) >> uint(2)));
    int _928 = int(_924) & 3;
    float _930 = (*spvDescriptorSet0.vp_c15)._m0[int(_926)][_928];
    int _932 = int(_924) + 1;
    uint _934 = uint(int(uint(_932) >> uint(2)));
    int _936 = _932 & 3;
    float _938 = (*spvDescriptorSet0.vp_c15)._m0[int(_934)][_936];
    float _940 = _429 + _918;
    float _942 = fma(_916, _916, _920);
    int _944 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _946 = _849 + _944;
    int _948 = _946 + 1;
    float _950 = sqrt(_942);
    int _952 = _845 + 72;
    uint _954 = uint(int(uint(_952) >> uint(2)));
    uint _956 = uint(int(uint(int(_954)) >> uint(2)));
    int _958 = int(_954) & 3;
    float _960 = (*spvDescriptorSet0.vp_c15)._m0[int(_956)][_958];
    int _962 = int(_954) + 1;
    uint _964 = uint(int(uint(_962) >> uint(2)));
    int _966 = _962 & 3;
    float _968 = (*spvDescriptorSet0.vp_c15)._m0[int(_964)][_966];
    int _970 = _845 + 96;
    uint _972 = uint(int(uint(_970) >> uint(2)));
    uint _974 = uint(int(uint(int(_972)) >> uint(2)));
    int _976 = int(_972) & 3;
    float _978 = (*spvDescriptorSet0.vp_c15)._m0[int(_974)][_976];
    int _980 = int(_972) + 1;
    uint _982 = uint(int(uint(_980) >> uint(2)));
    int _984 = _980 & 3;
    float _986 = (*spvDescriptorSet0.vp_c15)._m0[int(_982)][_984];
    bool _988 = _950 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _990 = _845 + 104;
    uint _992 = uint(int(uint(_990) >> uint(2)));
    uint _994 = uint(int(uint(int(_992)) >> uint(2)));
    int _996 = int(_992) & 3;
    float _998 = (*spvDescriptorSet0.vp_c15)._m0[int(_994)][_996];
    int _1000 = int(_992) + 1;
    uint _1002 = uint(int(uint(_1000) >> uint(2)));
    int _1004 = _1000 & 3;
    float _1006 = (*spvDescriptorSet0.vp_c15)._m0[int(_1002)][_1004];
    float _1008 = as_type<float>(_849);
    float _1010 = _884;
    int _1012 = _948;
    float _1014 = as_type<float>(_837);
    if (!_988)
    {
        _1008 = _884;
    }
    float _1016 = _1008;
    float _1018 = _1016;
    if (!_988)
    {
        _835 = _886;
    }
    float _1020 = _835;
    float _1022 = _1020;
    if (!_988)
    {
        _1010 = _940;
    }
    float _1024 = _1010;
    bool _1026 = !_988;
    float _1028 = _1024;
    int _1030 = as_type<int>(_938);
    int _1032 = as_type<int>(_930);
    int _1034 = as_type<int>(_896);
    if (!_1026)
    {
        float _1036 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1038 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1040 = _950 + _1038;
        float _1042 = rsqrt(_942);
        float _1044 = _1040 * _1036;
        float _1046 = _940 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1048 = _1044 * 0.15915493667125701904296875;
        float _1050 = _1048 * 6.283185482025146484375;
        float _1052 = cos(_1050);
        float _1054 = _1048 * 6.283185482025146484375;
        float _1056 = sin(_1054);
        float _1058 = _1052 + (-1.0);
        float _1060 = fma(_1056, _1046, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1062 = _1058 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1064 = _1042 * _1060;
        float _1066 = fma(_940, _1052, _1062);
        float _1068 = fma(_916, _1064, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1070 = fma(_912, _1064, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1028 = _1066;
        _1022 = _1068;
        _1018 = _1070;
    }
    float _1072 = _1028;
    float _1074 = _1022;
    float _1076 = _1018;
    float _1078 = -_429;
    float _1080 = _1078 + _1072;
    int _1082 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1084 = _908 + _1082;
    int _1086 = _1084 + 1;
    int _1088 = _845 + 80;
    uint _1090 = uint(int(uint(_1088) >> uint(2)));
    uint _1092 = uint(int(uint(int(_1090)) >> uint(2)));
    int _1094 = int(_1090) & 3;
    float _1096 = (*spvDescriptorSet0.vp_c15)._m0[int(_1092)][_1094];
    int _1098 = int(_1090) + 1;
    uint _1100 = uint(int(uint(_1098) >> uint(2)));
    int _1102 = _1098 & 3;
    float _1104 = (*spvDescriptorSet0.vp_c15)._m0[int(_1100)][_1102];
    float _1106 = -_243;
    float _1108 = _1106 + _1074;
    float _1110 = _1080 * _1080;
    float _1112 = -_245;
    float _1114 = _1112 + _1076;
    bool _1116 = _948 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1118 = fma(_1108, _1108, _1110);
    int _1120 = _948 | _1086;
    float _1122 = fma(_1114, _1114, _1118);
    bool _1124 = _1120 < 0;
    bool _1126 = _1124 || _1116;
    float _1128 = _743 * _986;
    float _1130 = sqrt(_1122);
    bool _1132 = _1086 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1134 = _1132 || _1126;
    float _1136 = fma(_243, _978, _1128);
    float _1138 = _743 * _872;
    float _1140 = fma(_245, _998, _1136);
    float _1142 = _743 * _938;
    float _1144 = fma(_243, _864, _1138);
    float _1146 = _1140 + _1006;
    float _1148 = fma(_243, _930, _1142);
    float _1150 = fma(_245, _896, _1144);
    float _1152 = _1150;
    float _1154 = _1148;
    float _1156 = _1076;
    if (!_1134)
    {
        int _1158 = _1086 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1160 = _1158 + _948;
        _1012 = _1160;
    }
    int _1162 = _1012;
    float _1164 = _986;
    if (!_1134)
    {
        float _1166 = floor(_771);
        _1164 = _1166;
    }
    float _1168 = _1164;
    bool _1170 = _1130 > 0.0;
    float _1172 = fma(_245, _960, _1148);
    if (!_1134)
    {
        int _1174 = _1162 << 2;
        _1030 = _1174;
    }
    int _1176 = _1030;
    int _1178 = _1176;
    if (!_1134)
    {
        uint _1180 = uint(int(uint(_1162) >> uint(2)));
        _1032 = int(_1180);
    }
    int _1182 = _1032;
    float _1184 = _1172 + _968;
    float _1186 = 1.0 / _1146;
    if (!_1134)
    {
        int _1188 = 12 & _1176;
        _1178 = _1188;
    }
    int _1190 = _1178;
    if (!_1134)
    {
        int _1192 = _1182 << 4;
        int _1194 = _1192 + _1190;
        _1034 = _1194;
    }
    int _1196 = _1034;
    float _1198 = _1150 + _904;
    if (!_1170)
    {
        _1152 = _1074;
    }
    float _1200 = _1152;
    float _1202 = _1200;
    if (!_1170)
    {
        _1154 = _1072;
    }
    float _1204 = _1154;
    bool _1206 = !_1170;
    float _1208 = _1204;
    if (!_1206)
    {
        float _1210 = _191 * _191;
        float _1212 = rsqrt(_1122);
        float _1214 = fma(_189, _189, _1210);
        float _1216 = fma(_193, _193, _1214);
        float _1218 = sqrt(_1216);
        float _1220 = _1108 * _1212;
        float _1222 = _1080 * _1212;
        float _1224 = _1114 * _1212;
        bool _1226 = _1218 > 0.0;
        float _1228 = _1218;
        float _1230 = _1212;
        if (!_1226)
        {
            _1228 = _1074;
        }
        float _1232 = _1228;
        _1202 = _1232;
        if (!_1226)
        {
            _1230 = _1072;
        }
        float _1234 = _1230;
        bool _1236 = !_1226;
        _1208 = _1234;
        if (!_1236)
        {
            float _1238 = rsqrt(_1216);
            float _1240 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1242 = _191 * _1238;
            float _1244 = _189 * _1238;
            float _1246 = _193 * _1238;
            float _1248 = _1222 * _1242;
            float _1250 = fma(_1220, _1244, _1248);
            float _1252 = _1240 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1254 = fma(_1224, _1246, _1250);
            float _1256 = _1254 * _1252;
            float _1258 = fma(_189, _1256, _1074);
            float _1260 = fma(_191, _1256, _1072);
            float _1262 = fma(_193, _1256, _1076);
            _1208 = _1260;
            _1202 = _1258;
            _1156 = _1262;
        }
    }
    float _1264 = _1208;
    float _1266 = _1202;
    float _1268 = _1156;
    int _1270 = _845 + 88;
    uint _1272 = uint(int(uint(_1270) >> uint(2)));
    uint _1274 = uint(int(uint(int(_1272)) >> uint(2)));
    int _1276 = int(_1272) & 3;
    float _1278 = (*spvDescriptorSet0.vp_c15)._m0[int(_1274)][_1276];
    int _1280 = int(_1272) + 1;
    uint _1282 = uint(int(uint(_1280) >> uint(2)));
    int _1284 = _1280 & 3;
    float _1286 = (*spvDescriptorSet0.vp_c15)._m0[int(_1282)][_1284];
    float _1288 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1290 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1292 = _1198 * _1186;
    float _1294 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1296 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1288);
    float _1298 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1290);
    float _1300 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1302 = _1108;
    if (!_1134)
    {
        int _1304 = _1196 + 400;
        uint _1306 = uint(int(uint(_1304) >> uint(2)));
        uint _1308 = uint(int(uint(int(_1306)) >> uint(2)));
        int _1310 = int(_1306) & 3;
        float _1312 = (*spvDescriptorSet0.vp_c15)._m0[int(_1308)][_1310];
        _1302 = _1312;
    }
    float _1314 = _1302;
    float _1316 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1296);
    bool _1318 = _1292 >= 0.0;
    float _1320 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1294);
    float _1322 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1298);
    float _1324 = _1316 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1326 = _1184 * _1186;
    bool _1328 = _1292 <= 1.0;
    bool _1330 = _1328 && _1318;
    float _1332 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1320);
    float _1334 = _1322 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1336 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1338 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1300);
    float _1340 = _1332 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1342 = _1326 >= 0.0;
    bool _1344 = _1342 && _1330;
    float _1346 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1336);
    float _1348 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1338);
    float _1350 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1352 = _1340 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1354 = _1326 <= 1.0;
    bool _1356 = _1354 && _1344;
    float _1358 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1346);
    float _1360 = _1348 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1362 = _743 * _1104;
    float _1364 = -_1352;
    float _1366 = fma(_1364, _1350, 1.0);
    float _1368 = _193;
    float _1370 = _1338;
    if (!_1134)
    {
        float _1372 = floor(_880);
        _1368 = _1372;
    }
    float _1374 = _1368;
    float _1376 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1358);
    float _1378 = fma(_243, _1096, _1362);
    float _1380 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1382 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1384 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1380);
    float _1386 = log2(_1366);
    float _1388 = _1382;
    float _1390 = _1376;
    if (_1356)
    {
        float _1392 = float(_837);
        _1014 = _1392;
    }
    float _1394 = _1014;
    float _1396 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1382);
    float _1398 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1384);
    float _1400 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1396);
    float _1402 = 1.0 / _1376;
    float _1404 = fma(_245, _1278, _1378);
    if (!_1134)
    {
        float _1406 = -_1374;
        float _1408 = _880 + _1406;
        _1370 = _1408;
    }
    float _1410 = _1370;
    float _1412 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1398);
    float _1414 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1400);
    float _1416 = _1404 + _1286;
    float _1418 = _1362;
    float _1420 = _1414;
    if (_1356)
    {
        float _1422 = rint(_1394);
        float _1424 = precise::max(_1422, 0.0);
        uint _1426 = uint(_1424);
        uint _1428 = clamp(_1426, 0u, 65535u);
        _1418 = as_type<float>(_1428);
    }
    float _1430 = _1418;
    float _1432 = _1416 * _1186;
    float _1434 = _1386 * 0.693147182464599609375;
    float _1436 = _1434 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1438 = _1416;
    if (!_1134)
    {
        float _1440 = rint(_1314);
        float _1442 = precise::max(_1440, 0.0);
        uint _1444 = uint(_1442);
        uint _1446 = clamp(_1444, 0u, 65535u);
        _1438 = as_type<float>(_1446);
    }
    float _1448 = _1438;
    float _1450 = _1412 * _1402;
    float _1452 = _1414 * _1402;
    float _1454 = fma(_1450, 0.5, 0.5);
    float _1456 = fma(_1452, -0.5, 0.5);
    float _1458 = _1450;
    float _1460 = _1402;
    if (!_1134)
    {
        float _1462 = -_1168;
        float _1464 = _771 + _1462;
        _1458 = _1464;
    }
    float _1466 = _1458;
    float _1468 = _1394;
    if (_1356)
    {
        float3 _4698 = float3(_1292, _1326, float(as_type<int>(_1430)));
        float3 _4702 = select(_4698, float3(0.0), isnan(_4698));
        float _1470 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4702.xy, uint(rint(_4702.z)), _1432, level(0.0));
        _1468 = _1470;
    }
    float _1472 = _1468;
    float3 _4712 = float3(_1454, _1456, _1436);
    float _1474 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4712, float3(0.0), isnan(_4712)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4712, float3(0.0), isnan(_4712)), level(0.0)).x;
    float3 _4721 = float3(_1454, _1456, _1436);
    float4 _1477 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4721, float3(0.0), isnan(_4721)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4721, float3(0.0), isnan(_4721)), level(0.0)).xyzw;
    float _1479 = _1477.x;
    float _1481 = _1477.y;
    float _1483 = _1477.z;
    float _1485 = _1477.w;
    float _1487 = _1410;
    if (!_1134)
    {
        float3 _4744 = float3(_1466, _1410, float(as_type<int>(_1448)));
        float3 _4746 = select(_4744, float3(0.0), isnan(_4744));
        float _1489 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4746.xy, uint(rint(_4746.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4746.xy, uint(rint(_4746.z)), level(0.0)).x;
        _1487 = _1489;
    }
    float _1491 = _1487;
    if (_1134)
    {
        _1388 = 1.0;
    }
    float _1493 = _1388;
    float _1495 = _1493;
    if (!_1134)
    {
        int _1497 = _1162 << 4;
        int _1499 = _1497 + 2048;
        uint _1501 = uint(int(uint(_1499) >> uint(2)));
        uint _1503 = uint(int(uint(int(_1501)) >> uint(2)));
        int _1505 = int(_1501) & 3;
        float _1507 = (*spvDescriptorSet0.vp_c15)._m0[int(_1503)][_1505];
        int _1509 = int(_1501) + 1;
        uint _1511 = uint(int(uint(_1509) >> uint(2)));
        int _1513 = _1509 & 3;
        float _1515 = (*spvDescriptorSet0.vp_c15)._m0[int(_1511)][_1513];
        int _1517 = _1499 + 8;
        uint _1519 = uint(int(uint(_1517) >> uint(2)));
        uint _1521 = uint(int(uint(int(_1519)) >> uint(2)));
        int _1523 = int(_1519) & 3;
        float _1525 = (*spvDescriptorSet0.vp_c15)._m0[int(_1521)][_1523];
        int _1527 = int(_1519) + 1;
        uint _1529 = uint(int(uint(_1527) >> uint(2)));
        int _1531 = _1527 & 3;
        float _1533 = (*spvDescriptorSet0.vp_c15)._m0[int(_1529)][_1531];
        float _1535 = _743 * _1515;
        float _1537 = fma(_243, _1507, _1535);
        float _1539 = fma(_245, _1525, _1537);
        float _1541 = _1539 + _1533;
        float _1543 = precise::clamp(_1541, 0.0, 1.0);
        float _1545 = -_1543;
        float _1547 = _1545 + _1491;
        float _1549 = fma(_1547, 500.0, 1.5);
        float _1551 = exp2(_1549);
        float _1553 = 0.0 + _1551;
        float _1555 = precise::clamp(_1553, 0.0, 1.0);
        _753 = _1535;
        _1495 = _1555;
    }
    float _1557 = _753;
    float _1559 = _1495;
    float _1561 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1563 = _1264 + _1561;
    float _1565 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1567 = _1266 + _1565;
    float _1569 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1571 = _1268 + _1569;
    float _1573 = _1563 * _1563;
    float _1575 = fma(_1567, _1567, _1573);
    float _1577 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1579 = fma(_1571, _1571, _1575);
    float _1581 = precise::max(0.0, _1577);
    float _1583 = rsqrt(_1579);
    float _1585 = sqrt(_1579);
    float _1587 = _1567 * _1583;
    float _1589 = _1571 * _1583;
    float _1591 = _1563 * _1583;
    float _1593 = _1587 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1595 = _1589 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1597 = -_1591;
    float _1599 = -_1581;
    float _1601 = fma(_1597, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1599);
    float _1603 = _1593 * _1593;
    float _1605 = _1595 * _1595;
    float _1607 = _1603 + _1605;
    float _1609 = sqrt(_1607);
    bool _1611 = _1609 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1613 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1615 = _1609 + _1613;
    float _1617 = _1557;
    float _1619 = _1581;
    float _1621 = _1583;
    float _1623 = _1615;
    float _1625 = _1593;
    float _1627 = _1595;
    float _1629 = _1603;
    float _1631 = _1605;
    if (_1611)
    {
        float _1633 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1617 = _1633;
    }
    float _1635 = _1617;
    if (_1611)
    {
        float _1637 = _1601 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1619 = _1637;
    }
    float _1639 = _1619;
    float _1641 = _1639;
    if (_1611)
    {
        float _1643 = rsqrt(_1607);
        _1621 = _1643;
    }
    float _1645 = _1621;
    float _1647 = _1645;
    if (_1611)
    {
        float _1649 = _1615 * _1635;
        _1623 = _1649;
    }
    float _1651 = _1623;
    if (_1611)
    {
        float _1653 = _1651 * 0.15915493667125701904296875;
        _1460 = _1653;
    }
    float _1655 = _1460;
    float _1657 = _1635;
    if (_1611)
    {
        float _1659 = _1655 * 6.283185482025146484375;
        float _1661 = sin(_1659);
        _1657 = _1661;
    }
    float _1663 = _1657;
    float _1665 = _1651;
    if (_1611)
    {
        float _1667 = _1655 * 6.283185482025146484375;
        float _1669 = cos(_1667);
        _1665 = _1669;
    }
    float _1671 = _1665;
    float _1673 = _1663;
    if (_1611)
    {
        float _1675 = fma(_1663, _1639, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _399 = _1675;
    }
    float _1677 = _399;
    float _1679 = _1677;
    if (_1611)
    {
        float _1681 = _1645 * _1677;
        _1679 = _1681;
    }
    float _1683 = _1679;
    if (!_1611)
    {
        _1647 = _1601;
    }
    float _1685 = _1647;
    float _1687 = _1685;
    if (_1611)
    {
        float _1689 = _1671 + (-1.0);
        _1641 = _1689;
    }
    float _1691 = _1641;
    if (_1611)
    {
        float _1693 = _1593 * _1683;
        _1625 = _1693;
    }
    float _1695 = _1625;
    if (_1611)
    {
        float _1697 = _1595 * _1683;
        _1627 = _1697;
    }
    float _1699 = _1627;
    if (_1611)
    {
        float _1701 = _1691 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1673 = _1701;
    }
    float _1703 = _1673;
    if (_1611)
    {
        float _1705 = _1695 * _1695;
        _1629 = _1705;
    }
    float _1707 = _1629;
    if (_1611)
    {
        float _1709 = _1699 * _1699;
        _1631 = _1709;
    }
    float _1711 = _1631;
    if (_1611)
    {
        float _1713 = fma(_1601, _1671, _1703);
        _1687 = _1713;
    }
    float _1715 = _1687;
    float _1717 = fma(_1715, _1715, _1707);
    float _1719 = _1717 + _1711;
    float _1721 = rsqrt(_1719);
    float _1723 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1725 = fma(_1585, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1723);
    float _1727 = precise::clamp(_1725, 0.0, 1.0);
    float _1729 = -_1727;
    float _1731 = _1729 + 1.0;
    float _1733 = abs(_1731);
    float _1735 = log2(_1733);
    float _1737 = _1721 * _1695;
    float _1739 = _1721 * _1715;
    float _1741 = _1721 * _1699;
    float _1743 = _1737 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1745 = -_1743;
    float _1747 = fma(_1739, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1745);
    float _1749 = -_1741;
    float _1751 = fma(_1749, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1747);
    float _1753 = _1735 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1755 = fma(_1751, -0.5, 0.5);
    float _1757 = exp2(_1753);
    float _1759 = fma(_1751, 0.5, 0.5);
    float _1761 = fma(_1759, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1763 = sqrt(_1755);
    float _1765 = fma(_1759, _1761, -0.212114393711090087890625);
    float _1767 = _1739 + 1.0;
    float _1769 = fma(_1759, _1765, 1.570728778839111328125);
    float _1771 = -_1739;
    float _1773 = fma(_1757, _1767, _1771);
    float _1775 = fma(_1773, 0.5, 0.5);
    float _1777 = _1763 * 0.636619746685028076171875;
    float _1779 = -_1769;
    float _1781 = fma(_1777, _1779, 1.0);
    float2 _5201 = float2(_1781, _1775);
    float3 _1785 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5201, float2(0.0), isnan(_5201)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5201, float2(0.0), isnan(_5201)), level(0.0)).xyz;
    float _1787 = _1785.x;
    float _1789 = _1785.y;
    float _1791 = _1785.z;
    float _1793 = abs(_703);
    float _1795 = log2(_1793);
    float _1797 = _783 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1799 = _283 > 0.5;
    float _1801 = _1735 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1805 = _1803 != 0;
    float _1807 = -_263;
    float _1809 = _1807 + 1.0;
    bool _1811 = _281 > 0.5;
    float _1813 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1815 = -_707;
    int _1817 = _1799 ? as_type<int>(_1815) : as_type<int>(_707);
    out.m_74.x = _1266;
    out.m_74.y = _1264;
    out.m_74.z = _1268;
    int _1819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1821 = _1819 != 0;
    float _1823 = -_713;
    int _1825 = _1811 ? as_type<int>(_1823) : as_type<int>(_713);
    float _1827 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1829 = !_1805;
    float _1831 = _1829 ? _707 : as_type<float>(_1817);
    float _1833 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1835 = !_1821;
    float _1837 = _1835 ? _713 : as_type<float>(_1825);
    float _1839 = _1795 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1841 = -_1831;
    float _1843 = _1841 + 0.5;
    float _1845 = _1833 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1847 = _1837 + 0.5;
    float _1849 = exp2(_1839);
    float _1851 = _1843 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1853 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1855 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1857 = _1847 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1859 = _1851 * _1813;
    float _1861 = _783 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1863 = _783 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1865 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1867 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1869 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1871 = _1853 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1873 = _1855 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1875 = _1857 * _1827;
    float _1877 = -_777;
    float _1879 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1861);
    float _1881 = -_777;
    float _1883 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1863);
    float _1885 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1887 = _1865 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1889 = _1867 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1891 = _1869 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1893 = -_777;
    float _1895 = fma(_1893, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1797);
    out.m_76.x = _1871;
    out.m_76.y = _1873;
    out.m_76.z = _1845;
    float _1897 = _707 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1899 = _713 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1901 = exp2(_1801);
    out.m_78.x = _1887;
    out.m_78.y = _1889;
    out.m_78.z = _1891;
    out.m_78.w = _1885;
    float _1903 = fma(_1849, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1905 = precise::clamp(_1903, 0.0, 1.0);
    out.m_80.x = _1875;
    out.m_80.y = _1859;
    float _1907 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1879);
    float _1909 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1883);
    float _1911 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1895);
    float _1913 = _795 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1915 = _1897 * _1907;
    float _1917 = _795 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1919 = _795 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1921 = fma(_1905, -2.0, 3.0);
    float _1923 = _1905 * _1905;
    float _1925 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1917);
    float _1927 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1919);
    float _1929 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1913);
    float _1931 = _1923 * _1921;
    float _1933 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1925);
    float _1935 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1927);
    float _1937 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1929);
    float _1939 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1941 = fma(_1899, _1933, _1915);
    float _1943 = -_1931;
    float _1945 = _1943 + 1.0;
    float _1947 = _805 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1949 = _805 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1951 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1939);
    float _1953 = fma(_1945, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1931);
    float _1955 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1947);
    bool _1957 = _703 <= 8000.0;
    bool _1959 = isnan(_703);
    bool _1961 = _1957 || _1959;
    bool _1963 = isnan(8000.0);
    bool _1965 = _1961 || _1963;
    float _1967 = float(_1965);
    float _1969 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1949);
    float _1971 = _1897 * _1909;
    float _1973 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1951);
    float _1975 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1955);
    float _1977 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1969);
    float _1979 = fma(_1899, _1935, _1971);
    float _1981 = _1967 * _1953;
    float _1983 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1973);
    float _1985 = _1975 + _1941;
    float _1987 = -_1901;
    float _1989 = _1987 + 1.0;
    float _1991 = _1977 + _1979;
    float _1993 = _1981 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1995 = _1983 + _1376;
    float _1997 = _1967;
    float _1999 = _1983;
    if (!_1356)
    {
        _1997 = 1.0;
    }
    float _2001 = _1997;
    float _2003 = _1989 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2005 = _2001;
    if (_1356)
    {
        bool _2007 = _1472 >= _1432;
        bool _2009 = isnan(_1472);
        bool _2011 = _2007 || _2009;
        bool _2013 = isnan(_1432);
        bool _2015 = _2011 || _2013;
        float _2017 = float(_2015);
        _2005 = _2017;
    }
    float _2019 = _2005;
    float _2021 = _805 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2023 = _1809 * _1993;
    float _2025 = precise::clamp(_2023, 0.0, 1.0);
    float _2027 = _1995 * 0.5;
    float _2029 = _2003 * _1474;
    float _2031 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2021);
    float _2033 = _1897 * _1911;
    float _2035 = _2019 * _1559;
    float _2037 = -_2025;
    float _2039 = fma(_2037, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_82.z = _2027;
    out.m_82.w = _1376;
    float _2041 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2031);
    float _2043 = fma(_1899, _1937, _2033);
    float _2045 = -_2035;
    float _2047 = fma(_2045, _2039, 1.0);
    float _2049 = precise::clamp(_2047, 0.0, 1.0);
    out.gl_Position.x = _1412;
    out.gl_Position.y = _1414;
    out.gl_Position.z = _1983;
    out.gl_Position.w = _1376;
    bool _2051 = _1585 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2053 = isnan(_1585);
    bool _2055 = _2051 || _2053;
    bool _2057 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2059 = _2055 || _2057;
    float _2061 = _2041 + _2043;
    float _2063 = _2049 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2065 = _1485 * _2029;
    out.m_84.x = _1985;
    out.m_84.y = _1991;
    out.m_84.z = _2061;
    out.m_86.x = _2063;
    float _2067 = -_2003;
    float _2069 = _2067 + 1.0;
    float _2071 = _2035;
    float _2073 = _2069;
    float _2075 = _2049;
    if (!_2059)
    {
        _2071 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2077 = _2071;
    float _2079 = _2077;
    float _2081 = _2077;
    if (!_2059)
    {
        _1390 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2083 = _1390;
    float _2085 = _1485 * _2069;
    float _2087 = _2083;
    float _2089 = _2083;
    if (!_2059)
    {
        _1999 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2091 = _1999;
    float _2093 = _2091;
    float _2095 = _2091;
    if (!_2059)
    {
        _1420 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2097 = _1420;
    float _2099 = _2097;
    float _2101 = _2097;
    if (!_2059)
    {
        _2073 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2103 = _2073;
    float _2105 = _2103;
    float _2107 = _2103;
    if (!_2059)
    {
        _2075 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2109 = _2075;
    float _2111 = _1791 * _2029;
    float _2113 = fma(_1787, _2065, _1479);
    float _2115 = fma(_1789, _2065, _1481);
    float _2117 = fma(_1485, _2111, _1483);
    out.m_88.x = _2113;
    out.m_88.y = _2115;
    out.m_88.z = _2117;
    out.m_88.w = _2085;
    bool _2119 = !_2059;
    float _2121 = _2109;
    float _2123 = _2109;
    if (!_2119)
    {
        bool _2125 = _1585 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2127 = isnan(_1585);
        bool _2129 = _2125 || _2127;
        bool _2131 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2133 = _2129 || _2131;
        if (!_2133)
        {
            float _2135 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2137 = _1585 + _2135;
            float _2139 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2141 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2139;
            float _2143 = 1.0 / _2141;
            float _2145 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2147 = _2145 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2149 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2151 = _2149 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2153 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2155 = _2153 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2157 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2159 = _2157 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2161 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2163 = _2161 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2165 = _2137 * _2143;
            float _2167 = precise::clamp(_2165, 0.0, 1.0);
            float _2169 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2171 = _2169 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2173 = fma(_2167, _2147, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2175 = fma(_2167, _2171, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2177 = fma(_2167, _2151, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2179 = fma(_2167, _2155, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2181 = fma(_2167, _2159, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2183 = fma(_2167, _2163, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2089 = _2175;
            _2107 = _2181;
            _2081 = _2173;
            _2101 = _2179;
            _2095 = _2177;
            _2123 = _2183;
            _2185 = true;
        }
        else
        {
            bool _2187 = _1585 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2189 = isnan(_1585);
            bool _2191 = _2187 || _2189;
            bool _2193 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2195 = _2191 || _2193;
            if (!_2195)
            {
                _2079 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2197 = _2079;
            _2081 = _2197;
            if (!_2195)
            {
                _2087 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2199 = _2087;
            _2089 = _2199;
            if (!_2195)
            {
                _2093 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2201 = _2093;
            _2095 = _2201;
            if (!_2195)
            {
                _2099 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2203 = _2099;
            _2101 = _2203;
            if (!_2195)
            {
                _2105 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2205 = _2105;
            _2107 = _2205;
            if (!_2195)
            {
                _2121 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2207 = _2121;
            bool _2209 = !_2195;
            _2123 = _2207;
            if (!_2209)
            {
                bool _2211 = _1585 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2213 = isnan(_1585);
                bool _2215 = _2211 || _2213;
                bool _2217 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2219 = _2215 || _2217;
                if (!_2219)
                {
                    float _2221 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2223 = _1585 + _2221;
                    float _2225 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2227 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2225;
                    float _2229 = 1.0 / _2227;
                    float _2231 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2233 = _2231 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2235 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2237 = _2235 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2239 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2241 = _2239 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2243 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2245 = _2243 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2247 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2249 = _2247 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2251 = _2223 * _2229;
                    float _2253 = precise::clamp(_2251, 0.0, 1.0);
                    float _2255 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2257 = _2255 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2259 = fma(_2253, _2233, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2261 = fma(_2253, _2257, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2263 = fma(_2253, _2237, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2265 = fma(_2253, _2241, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2267 = fma(_2253, _2245, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2269 = fma(_2253, _2249, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2089 = _2261;
                    _2107 = _2267;
                    _2081 = _2259;
                    _2101 = _2265;
                    _2095 = _2263;
                    _2123 = _2269;
                    _2185 = true;
                }
                else
                {
                    _2089 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2107 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2081 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2101 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2095 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2123 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2185 = false;
    float _2271 = _2089;
    float _2273 = _2107;
    float _2275 = _2081;
    float _2277 = _2101;
    float _2279 = _2095;
    float _2281 = _2123;
    float _2283 = fma(_1991, -0.5, 0.5);
    float _2285 = precise::clamp(_2283, 0.0, 1.0);
    float _2287 = -_2271;
    float _2289 = _2287 + _2273;
    float _2291 = -_2275;
    float _2293 = _2291 + _2277;
    float _2295 = -_2279;
    float _2297 = _2295 + _2281;
    bool _2299 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2301 = fma(_2285, _2289, _2271);
    float _2303 = fma(_2285, _2293, _2275);
    float _2305 = fma(_2285, _2297, _2279);
    float _2307 = _2301 * 0.586610972881317138671875;
    out.m_90.x = 0.0;
    float _2309 = fma(_2303, 0.298911988735198974609375, _2307);
    float _2311 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2313 = fma(_2305, 0.114477999508380889892578125, _2309);
    out.m_59.x = _2311;
    float _2315 = -_2313;
    float _2317 = _2303 + _2315;
    float _2319 = -_2313;
    float _2321 = _2301 + _2319;
    float _2323 = -_2313;
    float _2325 = _2305 + _2323;
    out.m_92.x = 0.0;
    float _2327 = fma(_2317, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2313);
    float _2329 = fma(_2321, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2313);
    float _2331 = fma(_2325, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2313);
    out.m_94.x = _2327;
    out.m_94.y = _2329;
    out.m_94.z = _2331;
    if (!_2299)
    {
        return out;
    }
    float _2333 = -_1264;
    float _2335 = _2333 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2337 = -_1266;
    float _2339 = _2337 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2341 = -_1268;
    float _2343 = _2341 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2345 = _2335 * _2335;
    float _2347 = fma(_2339, _2339, _2345);
    float _2349 = fma(_2343, _2343, _2347);
    float _2351 = rsqrt(_2349);
    float _2353 = _2335 * _2351;
    float _2355 = _2339 * _2351;
    float _2357 = _2343 * _2351;
    float _2359 = sqrt(_2349);
    float _2361 = -_1591;
    float _2363 = _2361 + _2353;
    float _2365 = -_1587;
    float _2367 = _2365 + _2355;
    float _2369 = -_1589;
    float _2371 = _2369 + _2357;
    float _2373 = _2363 * _2363;
    float _2375 = fma(_2367, _2367, _2373);
    float _2377 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2379 = precise::clamp(_2377, 0.0, 1.0);
    float _2381 = fma(_2371, _2371, _2375);
    float _2383 = _2379 * _2379;
    float _2385 = -_2359;
    float _2387 = _2385 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2389 = _2383 + (-1.0);
    float _2391 = rsqrt(_2381);
    float _2393 = _2387 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2395 = precise::clamp(_2393, 0.0, 1.0);
    float _2397 = abs(_2395);
    float _2399 = log2(_2397);
    float _2401 = _2363 * _2391;
    float _2403 = _2367 * _2391;
    float _2405 = _2371 * _2391;
    float _2407 = _1991 * _2401;
    float _2409 = _1991 * _2353;
    float _2411 = fma(_1985, _2403, _2407);
    float _2413 = _2399 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2415 = fma(_1985, _2355, _2409);
    float _2417 = fma(_2061, _2405, _2411);
    float _2419 = precise::clamp(_2417, 0.0, 1.0);
    float _2421 = fma(_2061, _2357, _2415);
    float _2423 = precise::clamp(_2421, 0.0, 1.0);
    float _2425 = exp2(_2413);
    float _2427 = _2419 * _2419;
    float _2429 = _2355 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2431 = fma(_2427, _2389, 1.0);
    float _2433 = -_2353;
    float _2435 = -_2429;
    float _2437 = fma(_2433, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2435);
    float _2439 = _2431 * _2431;
    float _2441 = -_2357;
    float _2443 = fma(_2441, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2437);
    float _2445 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2447 = _2443 + _2445;
    float _2449 = 1.0 / _2439;
    float _2451 = _2447 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2453 = precise::clamp(_2451, 0.0, 1.0);
    float _2455 = _2425 * _2453;
    float _2457 = _2423 * _2455;
    float _2459 = _2457 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2461 = _2383 * _2449;
    float _2463 = _2457 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2465 = _2457 * _2461;
    float _2467 = _2457 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2469 = _2465 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2471 = _2465 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2473 = _2465 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _2459;
    out.m_90.y = _2467;
    out.m_90.z = _2463;
    out.m_92.x = _2469;
    out.m_92.y = _2471;
    out.m_92.z = _2473;
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
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2185 = false;
    bool _215 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_56.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_59.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2529 = as_type<float>(_129);
        out.gl_Position.z = _2529;
    }
    if (!_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _149 = float(_113);
        _123 = _149;
    }
    float _151 = _123;
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
    int _163 = 0;
    if (_157)
    {
        float _165 = _161 * 5.0;
        _163 = as_type<int>(_165);
    }
    int _167 = _163;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2599 = as_type<float>(_167);
        out.gl_Position.z = _2599;
    }
    if (_157)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _169 = in.m_63.x;
    float _171 = in.m_63.y;
    float _173 = in.m_63.z;
    bool _175 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _177 = _171 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _179 = _171 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _181 = _171 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _183 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[4].x, _177);
    float _185 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[5].x, _179);
    float _187 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[6].x, _181);
    float _189 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[4].z, _183);
    float _191 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[5].z, _185);
    float _193 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[6].z, _187);
    bool _195 = !_175;
    float _213;
    if (!_195)
    {
        float _197 = in.m_65.x;
        float _199 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _201 = _197 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _203 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _205 = _203 * _199;
        float _207 = floor(_205);
        float _209 = -_207;
        float _211 = _205 + _209;
        _213 = _211;
        _215 = true;
    }
    else
    {
        float _217 = float(_113);
        float _219 = 1.0 / _217;
        float _221 = _145 * _219;
        _213 = _221;
    }
    _215 = false;
    float _223 = _213;
    float _225 = in.m_56.x;
    float _227 = in.m_56.y;
    float _229 = in.m_56.z;
    float _231 = _227 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _233 = _227 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _235 = fma(_225, (*spvDescriptorSet0.vp_c10)._m0[4].x, _231);
    float _237 = fma(_225, (*spvDescriptorSet0.vp_c10)._m0[6].x, _233);
    float _239 = fma(_229, (*spvDescriptorSet0.vp_c10)._m0[4].z, _235);
    float _241 = fma(_229, (*spvDescriptorSet0.vp_c10)._m0[6].z, _237);
    float _243 = _239 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _245 = _241 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _247 = fma(_243, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _249 = fma(_245, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _251 = floor(_247);
    float _253 = floor(_249);
    float _255 = -_251;
    float _257 = _247 + _255;
    float _259 = -_253;
    float _261 = _249 + _259;
    float2 _2775 = float2(_257, _261);
    float _263 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2775, float2(0.0), isnan(_2775)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2775, float2(0.0), isnan(_2775)), level(0.0)).x;
    float _265 = in.m_65.z;
    float _267 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _269 = log2(_267);
    float _271 = as_type<float>(int(gl_VertexIndex));
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _279 = _277 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _281 = in.m_65.x;
    float _283 = in.m_65.y;
    float _285 = 1.0 / _275;
    float _287 = 1.0 / _279;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _291 = _223 + _289;
    float _293 = _269 * _145;
    float _295 = _265 * 2.0;
    float _297 = exp2(_293);
    int _299 = as_type<int>(_271) & 1;
    bool _301 = _299 != 0;
    int _303 = as_type<int>(_271) & 2;
    bool _305 = _303 != 0;
    float _307 = _281 * 2.0;
    int _309 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _311 = _309 != 0;
    int _313 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _315 = _313 != 0;
    int _317 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _319 = _317 != 0;
    float _321 = floor(_295);
    float _323 = _227 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _327 = _223 + _325;
    float _329 = _291 * _287;
    float _331 = _265 + _281;
    float _333 = fma(_225, (*spvDescriptorSet0.vp_c10)._m0[5].x, _323);
    float _335 = _327 * _285;
    float _337 = _283 * 2.0;
    float _339 = floor(_307);
    float _341 = _283 + _265;
    float _343 = _283 + _281;
    float _345 = _331 + (-1.0);
    float _347 = -_297;
    float _349 = _347 + 1.0;
    float _351 = _341 + (-1.0);
    float _353 = _343 + (-1.0);
    bool _355 = _321 > 0.0;
    float _357 = floor(_337);
    bool _359 = _321 >= 0.0;
    bool _361 = isnan(_321);
    bool _363 = _359 || _361;
    bool _365 = isnan(0.0);
    bool _367 = _363 || _365;
    float _369 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _371 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _373 = !_311;
    int _375 = _373 ? 0 : 1;
    int _377 = _367 ? 0 : 1;
    bool _379 = _339 >= 0.0;
    bool _381 = isnan(_339);
    bool _383 = _379 || _381;
    bool _385 = isnan(0.0);
    bool _387 = _383 || _385;
    int _389 = ~_377;
    int _391 = _389 + 1;
    int _393 = _391 + 1;
    int _395 = _393;
    int _397 = 2;
    float _399 = _243;
    if (!_355)
    {
        int _401 = ~_377;
        int _403 = _401 + 1;
        _395 = _403;
    }
    int _405 = _395;
    bool _407 = _339 > 0.0;
    int _409 = _387 ? 0 : 1;
    bool _411 = _357 > 0.0;
    bool _413 = _357 >= 0.0;
    bool _415 = isnan(_357);
    bool _417 = _413 || _415;
    bool _419 = isnan(0.0);
    bool _421 = _417 || _419;
    float _423 = fma(_229, (*spvDescriptorSet0.vp_c10)._m0[5].z, _333);
    int _425 = abs(_375);
    float _427 = float(_405);
    float _429 = _423 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _431 = float(_425);
    int _433 = ~_409;
    int _435 = _433 + 1;
    int _437 = _435 + 1;
    int _439 = _437;
    if (!_407)
    {
        int _441 = ~_409;
        int _443 = _441 + 1;
        _439 = _443;
    }
    int _445 = _439;
    float _447 = _429 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _449 = _431 * _427;
    float _451 = in.m_70.x;
    float _453 = in.m_70.y;
    float _455 = in.m_70.z;
    float _457 = fma(_243, (*spvDescriptorSet0.vp_c8)._m0[11].x, _447);
    float _459 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _461;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _465;
    float _469 = fma(_245, (*spvDescriptorSet0.vp_c8)._m0[11].z, _457);
    float _471 = _429 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _473 = fma(_463, _335, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _475 = fma(_467, _335, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _479 = 1.0 + _477;
    bool _481 = !_315;
    int _483 = _481 ? 0 : 1;
    float _485 = fma(_243, (*spvDescriptorSet0.vp_c8)._m0[10].x, _471);
    bool _487 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _489 = isnan(1.0);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _495 = _491 || _493;
    float _497 = 1.0 / _479;
    int _499 = abs(_483);
    float _501 = fma(_245, (*spvDescriptorSet0.vp_c8)._m0[10].z, _485);
    float _503 = _469 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _505 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _507 = isnan(0.0);
    bool _509 = _505 || _507;
    bool _511 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _513 = _509 || _511;
    float _515 = _449 * (-2.0);
    float _517 = _501 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _519 = 1.0 / _503;
    float _521 = _513 ? _349 : 0.0;
    float _523 = float(_499);
    float _525 = float(_445);
    int _527 = _421 ? 0 : 1;
    if (_495)
    {
        float _529 = _521 * _497;
        _147 = _529;
    }
    float _531 = _147;
    float _533 = _517 + _503;
    float _535 = fma(_371, _515, _371);
    float _537 = fma(_515, _451, _451);
    float _539 = _281 + (-0.5);
    float _541 = _523 * _525;
    int _543 = ~_527;
    int _545 = _543 + 1;
    int _547 = _545 + 1;
    bool _549 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _551 = isnan(_223);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[196].x, _537);
    bool _563 = !_319;
    int _565 = _563 ? 0 : 1;
    float _567 = _533 * _519;
    float _569 = _567 * 0.5;
    int _571 = _547;
    if (!_411)
    {
        int _573 = ~_527;
        int _575 = _573 + 1;
        _571 = _575;
    }
    int _577 = _571;
    float _579 = fma(_535, _531, _561);
    bool _581 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _583 = isnan(_223);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _595 = fma(_569, (*spvDescriptorSet0.vp_c8)._m0[30].w, _593);
    int _597 = abs(_565);
    float _599 = -_559;
    float _601 = _599 + 1.0;
    float _603 = float(_577);
    float _605 = _541 * (-2.0);
    float _607 = float(_597);
    float _609 = _591 * _601;
    float _611 = -_591;
    float _613 = _611 + 1.0;
    float _615 = _283 + (-0.5);
    float _617 = fma(_605, _453, _453);
    float _619 = _607 * _603;
    float _621 = fma(_369, _605, _369);
    bool _623 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _625 = isnan(_223);
    bool _627 = _623 || _625;
    bool _629 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _631 = _627 || _629;
    float _633 = float(_631);
    float _635 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[196].y, _617);
    float _637 = _619 * (-2.0);
    float _639 = _579 * 0.15915493667125701904296875;
    float _641 = 1.0 / _595;
    float _643 = fma(_621, _531, _635);
    float _645 = fma(_459, _637, _459);
    float _647 = in.m_72.x;
    float _649 = in.m_72.y;
    float _651 = fma(_637, _455, _455);
    float _653 = _265 + (-0.5);
    float _655 = _633 * _613;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _663 = _661 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _665 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[196].z, _651);
    float _667 = _473 * _655;
    float _669 = _475 * _655;
    float _671 = -_633;
    float _673 = _671 + 1.0;
    float _675 = fma(_645, _531, _665);
    float _677 = fma(_659, _329, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _679 = fma(_663, _329, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _681 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[143].x, _667);
    float _683 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[143].y, _669);
    float _685 = _643 * 0.15915493667125701904296875;
    float _687 = _675 * 0.15915493667125701904296875;
    float _689 = fma(_677, _609, _681);
    float _691 = fma(_679, _609, _683);
    float _693 = _639 * 6.283185482025146484375;
    float _695 = cos(_693);
    float _697 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[145].x, _689);
    float _699 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[145].y, _691);
    float _701 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _703 = _641 * _701;
    bool _705 = !_305;
    float _707 = _705 ? (-0.5) : 0.5;
    float _709 = _697 * _647;
    bool _711 = !_301;
    float _713 = _711 ? (-0.5) : 0.5;
    float _715 = _685 * 6.283185482025146484375;
    float _717 = sin(_715);
    float _719 = _699 * _649;
    float _721 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _707);
    float _723 = _709 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _725 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _713);
    float _727 = _719 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _729 = _703 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _731 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _733 = _685 * 6.283185482025146484375;
    float _735 = cos(_733);
    float _737 = _727 * _721;
    float _739 = _723 * _725;
    bool _741 = _703 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _743 = _429 + _731;
    float _745 = _639 * 6.283185482025146484375;
    float _747 = sin(_745);
    float _749 = _695 * _717;
    float _751 = _743 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _753 = _743;
    if (!_729)
    {
        _397 = 1;
    }
    int _755 = _397;
    float _757 = _743 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _759 = fma(_243, (*spvDescriptorSet0.vp_c15)._m0[126].x, _751);
    float _761 = _687 * 6.283185482025146484375;
    float _763 = cos(_761);
    float _765 = _695 * _735;
    float _767 = fma(_245, (*spvDescriptorSet0.vp_c15)._m0[126].z, _759);
    float _769 = fma(_243, (*spvDescriptorSet0.vp_c15)._m0[127].x, _757);
    float _771 = _767 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _773 = fma(_245, (*spvDescriptorSet0.vp_c15)._m0[127].z, _769);
    float _775 = _687 * 6.283185482025146484375;
    float _777 = sin(_775);
    float _779 = _747 * _717;
    float _781 = _747 * _735;
    float _783 = _695 * _763;
    float _785 = _747 * _763;
    float _787 = _735 * _763;
    float _789 = _717 * _763;
    float _791 = _783 * _737;
    float _793 = _785 * _737;
    float _795 = fma(_777, _765, _779);
    float _797 = -_749;
    float _799 = fma(_777, _781, _797);
    float _801 = fma(_777, _779, _765);
    float _803 = -_781;
    float _805 = fma(_777, _749, _803);
    float _807 = -_737;
    float _809 = _777 * _807;
    float _811 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _813 = fma(_795, _739, _791);
    float _815 = fma(_787, _739, _809);
    float _817 = fma(_799, _739, _793);
    float _819 = fma(_805, _811, _813);
    bool _821 = !_729;
    int _823 = _821 ? 0 : 1;
    float _825 = fma(_789, _811, _815);
    float _827 = fma(_801, _811, _817);
    float _829 = _819 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _831 = _819 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _833 = _755;
    float _835 = _827;
    if (!_741)
    {
        _833 = _823;
    }
    int _837 = _833;
    float _839 = _819 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _841 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[26].x, _829);
    float _843 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[24].x, _831);
    int _845 = _837 << 6;
    float _847 = trunc(_771);
    int _849 = int(_847);
    float _851 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[26].z, _841);
    float _853 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[24].z, _843);
    int _855 = _845 + 48;
    uint _858 = uint(int(uint(_855) >> uint(2)));
    uint _860 = uint(int(uint(int(_858)) >> uint(2)));
    int _862 = int(_858) & 3;
    float _864 = (*spvDescriptorSet0.vp_c15)._m0[int(_860)][_862];
    int _866 = int(_858) + 1;
    uint _868 = uint(int(uint(_866) >> uint(2)));
    int _870 = _866 & 3;
    float _872 = (*spvDescriptorSet0.vp_c15)._m0[int(_868)][_870];
    float _874 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[25].x, _839);
    float _876 = _851 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _878 = _853 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _880 = _773 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _882 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[25].z, _874);
    float _884 = _245 + _876;
    float _886 = _243 + _878;
    int _888 = _845 + 56;
    uint _890 = uint(int(uint(_888) >> uint(2)));
    uint _892 = uint(int(uint(int(_890)) >> uint(2)));
    int _894 = int(_890) & 3;
    float _896 = (*spvDescriptorSet0.vp_c15)._m0[int(_892)][_894];
    int _898 = int(_890) + 1;
    uint _900 = uint(int(uint(_898) >> uint(2)));
    int _902 = _898 & 3;
    float _904 = (*spvDescriptorSet0.vp_c15)._m0[int(_900)][_902];
    float _906 = trunc(_880);
    int _908 = int(_906);
    float _910 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _912 = _884 + _910;
    float _914 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _916 = _886 + _914;
    float _918 = _882 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _920 = _912 * _912;
    int _922 = _845 + 64;
    uint _924 = uint(int(uint(_922) >> uint(2)));
    uint _926 = uint(int(uint(int(_924)) >> uint(2)));
    int _928 = int(_924) & 3;
    float _930 = (*spvDescriptorSet0.vp_c15)._m0[int(_926)][_928];
    int _932 = int(_924) + 1;
    uint _934 = uint(int(uint(_932) >> uint(2)));
    int _936 = _932 & 3;
    float _938 = (*spvDescriptorSet0.vp_c15)._m0[int(_934)][_936];
    float _940 = _429 + _918;
    float _942 = fma(_916, _916, _920);
    int _944 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _946 = _849 + _944;
    int _948 = _946 + 1;
    float _950 = sqrt(_942);
    int _952 = _845 + 72;
    uint _954 = uint(int(uint(_952) >> uint(2)));
    uint _956 = uint(int(uint(int(_954)) >> uint(2)));
    int _958 = int(_954) & 3;
    float _960 = (*spvDescriptorSet0.vp_c15)._m0[int(_956)][_958];
    int _962 = int(_954) + 1;
    uint _964 = uint(int(uint(_962) >> uint(2)));
    int _966 = _962 & 3;
    float _968 = (*spvDescriptorSet0.vp_c15)._m0[int(_964)][_966];
    int _970 = _845 + 96;
    uint _972 = uint(int(uint(_970) >> uint(2)));
    uint _974 = uint(int(uint(int(_972)) >> uint(2)));
    int _976 = int(_972) & 3;
    float _978 = (*spvDescriptorSet0.vp_c15)._m0[int(_974)][_976];
    int _980 = int(_972) + 1;
    uint _982 = uint(int(uint(_980) >> uint(2)));
    int _984 = _980 & 3;
    float _986 = (*spvDescriptorSet0.vp_c15)._m0[int(_982)][_984];
    bool _988 = _950 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _990 = _845 + 104;
    uint _992 = uint(int(uint(_990) >> uint(2)));
    uint _994 = uint(int(uint(int(_992)) >> uint(2)));
    int _996 = int(_992) & 3;
    float _998 = (*spvDescriptorSet0.vp_c15)._m0[int(_994)][_996];
    int _1000 = int(_992) + 1;
    uint _1002 = uint(int(uint(_1000) >> uint(2)));
    int _1004 = _1000 & 3;
    float _1006 = (*spvDescriptorSet0.vp_c15)._m0[int(_1002)][_1004];
    float _1008 = as_type<float>(_849);
    float _1010 = _884;
    int _1012 = _948;
    float _1014 = as_type<float>(_837);
    if (!_988)
    {
        _1008 = _884;
    }
    float _1016 = _1008;
    float _1018 = _1016;
    if (!_988)
    {
        _835 = _886;
    }
    float _1020 = _835;
    float _1022 = _1020;
    if (!_988)
    {
        _1010 = _940;
    }
    float _1024 = _1010;
    bool _1026 = !_988;
    float _1028 = _1024;
    int _1030 = as_type<int>(_938);
    int _1032 = as_type<int>(_930);
    int _1034 = as_type<int>(_896);
    if (!_1026)
    {
        float _1036 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1038 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1040 = _950 + _1038;
        float _1042 = rsqrt(_942);
        float _1044 = _1040 * _1036;
        float _1046 = _940 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1048 = _1044 * 0.15915493667125701904296875;
        float _1050 = _1048 * 6.283185482025146484375;
        float _1052 = cos(_1050);
        float _1054 = _1048 * 6.283185482025146484375;
        float _1056 = sin(_1054);
        float _1058 = _1052 + (-1.0);
        float _1060 = fma(_1056, _1046, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1062 = _1058 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1064 = _1042 * _1060;
        float _1066 = fma(_940, _1052, _1062);
        float _1068 = fma(_916, _1064, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1070 = fma(_912, _1064, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1028 = _1066;
        _1022 = _1068;
        _1018 = _1070;
    }
    float _1072 = _1028;
    float _1074 = _1022;
    float _1076 = _1018;
    float _1078 = -_429;
    float _1080 = _1078 + _1072;
    int _1082 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1084 = _908 + _1082;
    int _1086 = _1084 + 1;
    int _1088 = _845 + 80;
    uint _1090 = uint(int(uint(_1088) >> uint(2)));
    uint _1092 = uint(int(uint(int(_1090)) >> uint(2)));
    int _1094 = int(_1090) & 3;
    float _1096 = (*spvDescriptorSet0.vp_c15)._m0[int(_1092)][_1094];
    int _1098 = int(_1090) + 1;
    uint _1100 = uint(int(uint(_1098) >> uint(2)));
    int _1102 = _1098 & 3;
    float _1104 = (*spvDescriptorSet0.vp_c15)._m0[int(_1100)][_1102];
    float _1106 = -_243;
    float _1108 = _1106 + _1074;
    float _1110 = _1080 * _1080;
    float _1112 = -_245;
    float _1114 = _1112 + _1076;
    bool _1116 = _948 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1118 = fma(_1108, _1108, _1110);
    int _1120 = _948 | _1086;
    float _1122 = fma(_1114, _1114, _1118);
    bool _1124 = _1120 < 0;
    bool _1126 = _1124 || _1116;
    float _1128 = _743 * _986;
    float _1130 = sqrt(_1122);
    bool _1132 = _1086 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1134 = _1132 || _1126;
    float _1136 = fma(_243, _978, _1128);
    float _1138 = _743 * _872;
    float _1140 = fma(_245, _998, _1136);
    float _1142 = _743 * _938;
    float _1144 = fma(_243, _864, _1138);
    float _1146 = _1140 + _1006;
    float _1148 = fma(_243, _930, _1142);
    float _1150 = fma(_245, _896, _1144);
    float _1152 = _1150;
    float _1154 = _1148;
    float _1156 = _1076;
    if (!_1134)
    {
        int _1158 = _1086 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1160 = _1158 + _948;
        _1012 = _1160;
    }
    int _1162 = _1012;
    float _1164 = _986;
    if (!_1134)
    {
        float _1166 = floor(_771);
        _1164 = _1166;
    }
    float _1168 = _1164;
    bool _1170 = _1130 > 0.0;
    float _1172 = fma(_245, _960, _1148);
    if (!_1134)
    {
        int _1174 = _1162 << 2;
        _1030 = _1174;
    }
    int _1176 = _1030;
    int _1178 = _1176;
    if (!_1134)
    {
        uint _1180 = uint(int(uint(_1162) >> uint(2)));
        _1032 = int(_1180);
    }
    int _1182 = _1032;
    float _1184 = _1172 + _968;
    float _1186 = 1.0 / _1146;
    if (!_1134)
    {
        int _1188 = 12 & _1176;
        _1178 = _1188;
    }
    int _1190 = _1178;
    if (!_1134)
    {
        int _1192 = _1182 << 4;
        int _1194 = _1192 + _1190;
        _1034 = _1194;
    }
    int _1196 = _1034;
    float _1198 = _1150 + _904;
    if (!_1170)
    {
        _1152 = _1074;
    }
    float _1200 = _1152;
    float _1202 = _1200;
    if (!_1170)
    {
        _1154 = _1072;
    }
    float _1204 = _1154;
    bool _1206 = !_1170;
    float _1208 = _1204;
    if (!_1206)
    {
        float _1210 = _191 * _191;
        float _1212 = rsqrt(_1122);
        float _1214 = fma(_189, _189, _1210);
        float _1216 = fma(_193, _193, _1214);
        float _1218 = sqrt(_1216);
        float _1220 = _1108 * _1212;
        float _1222 = _1080 * _1212;
        float _1224 = _1114 * _1212;
        bool _1226 = _1218 > 0.0;
        float _1228 = _1218;
        float _1230 = _1212;
        if (!_1226)
        {
            _1228 = _1074;
        }
        float _1232 = _1228;
        _1202 = _1232;
        if (!_1226)
        {
            _1230 = _1072;
        }
        float _1234 = _1230;
        bool _1236 = !_1226;
        _1208 = _1234;
        if (!_1236)
        {
            float _1238 = rsqrt(_1216);
            float _1240 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1242 = _191 * _1238;
            float _1244 = _189 * _1238;
            float _1246 = _193 * _1238;
            float _1248 = _1222 * _1242;
            float _1250 = fma(_1220, _1244, _1248);
            float _1252 = _1240 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1254 = fma(_1224, _1246, _1250);
            float _1256 = _1254 * _1252;
            float _1258 = fma(_189, _1256, _1074);
            float _1260 = fma(_191, _1256, _1072);
            float _1262 = fma(_193, _1256, _1076);
            _1208 = _1260;
            _1202 = _1258;
            _1156 = _1262;
        }
    }
    float _1264 = _1208;
    float _1266 = _1202;
    float _1268 = _1156;
    int _1270 = _845 + 88;
    uint _1272 = uint(int(uint(_1270) >> uint(2)));
    uint _1274 = uint(int(uint(int(_1272)) >> uint(2)));
    int _1276 = int(_1272) & 3;
    float _1278 = (*spvDescriptorSet0.vp_c15)._m0[int(_1274)][_1276];
    int _1280 = int(_1272) + 1;
    uint _1282 = uint(int(uint(_1280) >> uint(2)));
    int _1284 = _1280 & 3;
    float _1286 = (*spvDescriptorSet0.vp_c15)._m0[int(_1282)][_1284];
    float _1288 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1290 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1292 = _1198 * _1186;
    float _1294 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1296 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1288);
    float _1298 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1290);
    float _1300 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1302 = _1108;
    if (!_1134)
    {
        int _1304 = _1196 + 400;
        uint _1306 = uint(int(uint(_1304) >> uint(2)));
        uint _1308 = uint(int(uint(int(_1306)) >> uint(2)));
        int _1310 = int(_1306) & 3;
        float _1312 = (*spvDescriptorSet0.vp_c15)._m0[int(_1308)][_1310];
        _1302 = _1312;
    }
    float _1314 = _1302;
    float _1316 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1296);
    bool _1318 = _1292 >= 0.0;
    float _1320 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1294);
    float _1322 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1298);
    float _1324 = _1316 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1326 = _1184 * _1186;
    bool _1328 = _1292 <= 1.0;
    bool _1330 = _1328 && _1318;
    float _1332 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1320);
    float _1334 = _1322 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1336 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1338 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1300);
    float _1340 = _1332 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1342 = _1326 >= 0.0;
    bool _1344 = _1342 && _1330;
    float _1346 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1336);
    float _1348 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1338);
    float _1350 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1352 = _1340 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1354 = _1326 <= 1.0;
    bool _1356 = _1354 && _1344;
    float _1358 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1346);
    float _1360 = _1348 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1362 = _743 * _1104;
    float _1364 = -_1352;
    float _1366 = fma(_1364, _1350, 1.0);
    float _1368 = _193;
    float _1370 = _1338;
    if (!_1134)
    {
        float _1372 = floor(_880);
        _1368 = _1372;
    }
    float _1374 = _1368;
    float _1376 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1358);
    float _1378 = fma(_243, _1096, _1362);
    float _1380 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1382 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1384 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1380);
    float _1386 = log2(_1366);
    float _1388 = _1382;
    float _1390 = _1376;
    if (_1356)
    {
        float _1392 = float(_837);
        _1014 = _1392;
    }
    float _1394 = _1014;
    float _1396 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1382);
    float _1398 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1384);
    float _1400 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1396);
    float _1402 = 1.0 / _1376;
    float _1404 = fma(_245, _1278, _1378);
    if (!_1134)
    {
        float _1406 = -_1374;
        float _1408 = _880 + _1406;
        _1370 = _1408;
    }
    float _1410 = _1370;
    float _1412 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1398);
    float _1414 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1400);
    float _1416 = _1404 + _1286;
    float _1418 = _1362;
    float _1420 = _1414;
    if (_1356)
    {
        float _1422 = rint(_1394);
        float _1424 = precise::max(_1422, 0.0);
        uint _1426 = uint(_1424);
        uint _1428 = clamp(_1426, 0u, 65535u);
        _1418 = as_type<float>(_1428);
    }
    float _1430 = _1418;
    float _1432 = _1416 * _1186;
    float _1434 = _1386 * 0.693147182464599609375;
    float _1436 = _1434 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1438 = _1416;
    if (!_1134)
    {
        float _1440 = rint(_1314);
        float _1442 = precise::max(_1440, 0.0);
        uint _1444 = uint(_1442);
        uint _1446 = clamp(_1444, 0u, 65535u);
        _1438 = as_type<float>(_1446);
    }
    float _1448 = _1438;
    float _1450 = _1412 * _1402;
    float _1452 = _1414 * _1402;
    float _1454 = fma(_1450, 0.5, 0.5);
    float _1456 = fma(_1452, -0.5, 0.5);
    float _1458 = _1450;
    float _1460 = _1402;
    if (!_1134)
    {
        float _1462 = -_1168;
        float _1464 = _771 + _1462;
        _1458 = _1464;
    }
    float _1466 = _1458;
    float _1468 = _1394;
    if (_1356)
    {
        float3 _4698 = float3(_1292, _1326, float(as_type<int>(_1430)));
        float3 _4702 = select(_4698, float3(0.0), isnan(_4698));
        float _1470 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4702.xy, uint(rint(_4702.z)), _1432, level(0.0));
        _1468 = _1470;
    }
    float _1472 = _1468;
    float3 _4712 = float3(_1454, _1456, _1436);
    float _1474 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4712, float3(0.0), isnan(_4712)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4712, float3(0.0), isnan(_4712)), level(0.0)).x;
    float3 _4721 = float3(_1454, _1456, _1436);
    float4 _1477 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4721, float3(0.0), isnan(_4721)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4721, float3(0.0), isnan(_4721)), level(0.0)).xyzw;
    float _1479 = _1477.x;
    float _1481 = _1477.y;
    float _1483 = _1477.z;
    float _1485 = _1477.w;
    float _1487 = _1410;
    if (!_1134)
    {
        float3 _4744 = float3(_1466, _1410, float(as_type<int>(_1448)));
        float3 _4746 = select(_4744, float3(0.0), isnan(_4744));
        float _1489 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4746.xy, uint(rint(_4746.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4746.xy, uint(rint(_4746.z)), level(0.0)).x;
        _1487 = _1489;
    }
    float _1491 = _1487;
    if (_1134)
    {
        _1388 = 1.0;
    }
    float _1493 = _1388;
    float _1495 = _1493;
    if (!_1134)
    {
        int _1497 = _1162 << 4;
        int _1499 = _1497 + 2048;
        uint _1501 = uint(int(uint(_1499) >> uint(2)));
        uint _1503 = uint(int(uint(int(_1501)) >> uint(2)));
        int _1505 = int(_1501) & 3;
        float _1507 = (*spvDescriptorSet0.vp_c15)._m0[int(_1503)][_1505];
        int _1509 = int(_1501) + 1;
        uint _1511 = uint(int(uint(_1509) >> uint(2)));
        int _1513 = _1509 & 3;
        float _1515 = (*spvDescriptorSet0.vp_c15)._m0[int(_1511)][_1513];
        int _1517 = _1499 + 8;
        uint _1519 = uint(int(uint(_1517) >> uint(2)));
        uint _1521 = uint(int(uint(int(_1519)) >> uint(2)));
        int _1523 = int(_1519) & 3;
        float _1525 = (*spvDescriptorSet0.vp_c15)._m0[int(_1521)][_1523];
        int _1527 = int(_1519) + 1;
        uint _1529 = uint(int(uint(_1527) >> uint(2)));
        int _1531 = _1527 & 3;
        float _1533 = (*spvDescriptorSet0.vp_c15)._m0[int(_1529)][_1531];
        float _1535 = _743 * _1515;
        float _1537 = fma(_243, _1507, _1535);
        float _1539 = fma(_245, _1525, _1537);
        float _1541 = _1539 + _1533;
        float _1543 = precise::clamp(_1541, 0.0, 1.0);
        float _1545 = -_1543;
        float _1547 = _1545 + _1491;
        float _1549 = fma(_1547, 500.0, 1.5);
        float _1551 = exp2(_1549);
        float _1553 = 0.0 + _1551;
        float _1555 = precise::clamp(_1553, 0.0, 1.0);
        _753 = _1535;
        _1495 = _1555;
    }
    float _1557 = _753;
    float _1559 = _1495;
    float _1561 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1563 = _1264 + _1561;
    float _1565 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1567 = _1266 + _1565;
    float _1569 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1571 = _1268 + _1569;
    float _1573 = _1563 * _1563;
    float _1575 = fma(_1567, _1567, _1573);
    float _1577 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1579 = fma(_1571, _1571, _1575);
    float _1581 = precise::max(0.0, _1577);
    float _1583 = rsqrt(_1579);
    float _1585 = sqrt(_1579);
    float _1587 = _1567 * _1583;
    float _1589 = _1571 * _1583;
    float _1591 = _1563 * _1583;
    float _1593 = _1587 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1595 = _1589 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1597 = -_1591;
    float _1599 = -_1581;
    float _1601 = fma(_1597, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1599);
    float _1603 = _1593 * _1593;
    float _1605 = _1595 * _1595;
    float _1607 = _1603 + _1605;
    float _1609 = sqrt(_1607);
    bool _1611 = _1609 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1613 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1615 = _1609 + _1613;
    float _1617 = _1557;
    float _1619 = _1581;
    float _1621 = _1583;
    float _1623 = _1615;
    float _1625 = _1593;
    float _1627 = _1595;
    float _1629 = _1603;
    float _1631 = _1605;
    if (_1611)
    {
        float _1633 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1617 = _1633;
    }
    float _1635 = _1617;
    if (_1611)
    {
        float _1637 = _1601 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1619 = _1637;
    }
    float _1639 = _1619;
    float _1641 = _1639;
    if (_1611)
    {
        float _1643 = rsqrt(_1607);
        _1621 = _1643;
    }
    float _1645 = _1621;
    float _1647 = _1645;
    if (_1611)
    {
        float _1649 = _1615 * _1635;
        _1623 = _1649;
    }
    float _1651 = _1623;
    if (_1611)
    {
        float _1653 = _1651 * 0.15915493667125701904296875;
        _1460 = _1653;
    }
    float _1655 = _1460;
    float _1657 = _1635;
    if (_1611)
    {
        float _1659 = _1655 * 6.283185482025146484375;
        float _1661 = sin(_1659);
        _1657 = _1661;
    }
    float _1663 = _1657;
    float _1665 = _1651;
    if (_1611)
    {
        float _1667 = _1655 * 6.283185482025146484375;
        float _1669 = cos(_1667);
        _1665 = _1669;
    }
    float _1671 = _1665;
    float _1673 = _1663;
    if (_1611)
    {
        float _1675 = fma(_1663, _1639, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _399 = _1675;
    }
    float _1677 = _399;
    float _1679 = _1677;
    if (_1611)
    {
        float _1681 = _1645 * _1677;
        _1679 = _1681;
    }
    float _1683 = _1679;
    if (!_1611)
    {
        _1647 = _1601;
    }
    float _1685 = _1647;
    float _1687 = _1685;
    if (_1611)
    {
        float _1689 = _1671 + (-1.0);
        _1641 = _1689;
    }
    float _1691 = _1641;
    if (_1611)
    {
        float _1693 = _1593 * _1683;
        _1625 = _1693;
    }
    float _1695 = _1625;
    if (_1611)
    {
        float _1697 = _1595 * _1683;
        _1627 = _1697;
    }
    float _1699 = _1627;
    if (_1611)
    {
        float _1701 = _1691 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1673 = _1701;
    }
    float _1703 = _1673;
    if (_1611)
    {
        float _1705 = _1695 * _1695;
        _1629 = _1705;
    }
    float _1707 = _1629;
    if (_1611)
    {
        float _1709 = _1699 * _1699;
        _1631 = _1709;
    }
    float _1711 = _1631;
    if (_1611)
    {
        float _1713 = fma(_1601, _1671, _1703);
        _1687 = _1713;
    }
    float _1715 = _1687;
    float _1717 = fma(_1715, _1715, _1707);
    float _1719 = _1717 + _1711;
    float _1721 = rsqrt(_1719);
    float _1723 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1725 = fma(_1585, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1723);
    float _1727 = precise::clamp(_1725, 0.0, 1.0);
    float _1729 = -_1727;
    float _1731 = _1729 + 1.0;
    float _1733 = abs(_1731);
    float _1735 = log2(_1733);
    float _1737 = _1721 * _1695;
    float _1739 = _1721 * _1715;
    float _1741 = _1721 * _1699;
    float _1743 = _1737 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1745 = -_1743;
    float _1747 = fma(_1739, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1745);
    float _1749 = -_1741;
    float _1751 = fma(_1749, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1747);
    float _1753 = _1735 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1755 = fma(_1751, -0.5, 0.5);
    float _1757 = exp2(_1753);
    float _1759 = fma(_1751, 0.5, 0.5);
    float _1761 = fma(_1759, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1763 = sqrt(_1755);
    float _1765 = fma(_1759, _1761, -0.212114393711090087890625);
    float _1767 = _1739 + 1.0;
    float _1769 = fma(_1759, _1765, 1.570728778839111328125);
    float _1771 = -_1739;
    float _1773 = fma(_1757, _1767, _1771);
    float _1775 = fma(_1773, 0.5, 0.5);
    float _1777 = _1763 * 0.636619746685028076171875;
    float _1779 = -_1769;
    float _1781 = fma(_1777, _1779, 1.0);
    float2 _5201 = float2(_1781, _1775);
    float3 _1785 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5201, float2(0.0), isnan(_5201)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5201, float2(0.0), isnan(_5201)), level(0.0)).xyz;
    float _1787 = _1785.x;
    float _1789 = _1785.y;
    float _1791 = _1785.z;
    float _1793 = abs(_703);
    float _1795 = log2(_1793);
    float _1797 = _783 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1799 = _283 > 0.5;
    float _1801 = _1735 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1805 = _1803 != 0;
    float _1807 = -_263;
    float _1809 = _1807 + 1.0;
    bool _1811 = _281 > 0.5;
    float _1813 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1815 = -_707;
    int _1817 = _1799 ? as_type<int>(_1815) : as_type<int>(_707);
    out.m_74.x = _1266;
    out.m_74.y = _1264;
    out.m_74.z = _1268;
    int _1819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1821 = _1819 != 0;
    float _1823 = -_713;
    int _1825 = _1811 ? as_type<int>(_1823) : as_type<int>(_713);
    float _1827 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1829 = !_1805;
    float _1831 = _1829 ? _707 : as_type<float>(_1817);
    float _1833 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1835 = !_1821;
    float _1837 = _1835 ? _713 : as_type<float>(_1825);
    float _1839 = _1795 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1841 = -_1831;
    float _1843 = _1841 + 0.5;
    float _1845 = _1833 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1847 = _1837 + 0.5;
    float _1849 = exp2(_1839);
    float _1851 = _1843 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1853 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1855 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1857 = _1847 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1859 = _1851 * _1813;
    float _1861 = _783 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1863 = _783 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1865 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1867 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1869 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1871 = _1853 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1873 = _1855 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1875 = _1857 * _1827;
    float _1877 = -_777;
    float _1879 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1861);
    float _1881 = -_777;
    float _1883 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1863);
    float _1885 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1887 = _1865 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1889 = _1867 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1891 = _1869 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1893 = -_777;
    float _1895 = fma(_1893, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1797);
    out.m_76.x = _1871;
    out.m_76.y = _1873;
    out.m_76.z = _1845;
    float _1897 = _707 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1899 = _713 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1901 = exp2(_1801);
    out.m_78.x = _1887;
    out.m_78.y = _1889;
    out.m_78.z = _1891;
    out.m_78.w = _1885;
    float _1903 = fma(_1849, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1905 = precise::clamp(_1903, 0.0, 1.0);
    out.m_80.x = _1875;
    out.m_80.y = _1859;
    float _1907 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1879);
    float _1909 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1883);
    float _1911 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1895);
    float _1913 = _795 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1915 = _1897 * _1907;
    float _1917 = _795 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1919 = _795 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1921 = fma(_1905, -2.0, 3.0);
    float _1923 = _1905 * _1905;
    float _1925 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1917);
    float _1927 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1919);
    float _1929 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1913);
    float _1931 = _1923 * _1921;
    float _1933 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1925);
    float _1935 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1927);
    float _1937 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1929);
    float _1939 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1941 = fma(_1899, _1933, _1915);
    float _1943 = -_1931;
    float _1945 = _1943 + 1.0;
    float _1947 = _805 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1949 = _805 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1951 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1939);
    float _1953 = fma(_1945, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1931);
    float _1955 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1947);
    bool _1957 = _703 <= 8000.0;
    bool _1959 = isnan(_703);
    bool _1961 = _1957 || _1959;
    bool _1963 = isnan(8000.0);
    bool _1965 = _1961 || _1963;
    float _1967 = float(_1965);
    float _1969 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1949);
    float _1971 = _1897 * _1909;
    float _1973 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1951);
    float _1975 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1955);
    float _1977 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1969);
    float _1979 = fma(_1899, _1935, _1971);
    float _1981 = _1967 * _1953;
    float _1983 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1973);
    float _1985 = _1975 + _1941;
    float _1987 = -_1901;
    float _1989 = _1987 + 1.0;
    float _1991 = _1977 + _1979;
    float _1993 = _1981 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1995 = _1983 + _1376;
    float _1997 = _1967;
    float _1999 = _1983;
    if (!_1356)
    {
        _1997 = 1.0;
    }
    float _2001 = _1997;
    float _2003 = _1989 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2005 = _2001;
    if (_1356)
    {
        bool _2007 = _1472 >= _1432;
        bool _2009 = isnan(_1472);
        bool _2011 = _2007 || _2009;
        bool _2013 = isnan(_1432);
        bool _2015 = _2011 || _2013;
        float _2017 = float(_2015);
        _2005 = _2017;
    }
    float _2019 = _2005;
    float _2021 = _805 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2023 = _1809 * _1993;
    float _2025 = precise::clamp(_2023, 0.0, 1.0);
    float _2027 = _1995 * 0.5;
    float _2029 = _2003 * _1474;
    float _2031 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2021);
    float _2033 = _1897 * _1911;
    float _2035 = _2019 * _1559;
    float _2037 = -_2025;
    float _2039 = fma(_2037, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_82.z = _2027;
    out.m_82.w = _1376;
    float _2041 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2031);
    float _2043 = fma(_1899, _1937, _2033);
    float _2045 = -_2035;
    float _2047 = fma(_2045, _2039, 1.0);
    float _2049 = precise::clamp(_2047, 0.0, 1.0);
    out.gl_Position.x = _1412;
    out.gl_Position.y = _1414;
    out.gl_Position.z = _1983;
    out.gl_Position.w = _1376;
    bool _2051 = _1585 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2053 = isnan(_1585);
    bool _2055 = _2051 || _2053;
    bool _2057 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2059 = _2055 || _2057;
    float _2061 = _2041 + _2043;
    float _2063 = _2049 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2065 = _1485 * _2029;
    out.m_84.x = _1985;
    out.m_84.y = _1991;
    out.m_84.z = _2061;
    out.m_86.x = _2063;
    float _2067 = -_2003;
    float _2069 = _2067 + 1.0;
    float _2071 = _2035;
    float _2073 = _2069;
    float _2075 = _2049;
    if (!_2059)
    {
        _2071 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2077 = _2071;
    float _2079 = _2077;
    float _2081 = _2077;
    if (!_2059)
    {
        _1390 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2083 = _1390;
    float _2085 = _1485 * _2069;
    float _2087 = _2083;
    float _2089 = _2083;
    if (!_2059)
    {
        _1999 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2091 = _1999;
    float _2093 = _2091;
    float _2095 = _2091;
    if (!_2059)
    {
        _1420 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2097 = _1420;
    float _2099 = _2097;
    float _2101 = _2097;
    if (!_2059)
    {
        _2073 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2103 = _2073;
    float _2105 = _2103;
    float _2107 = _2103;
    if (!_2059)
    {
        _2075 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2109 = _2075;
    float _2111 = _1791 * _2029;
    float _2113 = fma(_1787, _2065, _1479);
    float _2115 = fma(_1789, _2065, _1481);
    float _2117 = fma(_1485, _2111, _1483);
    out.m_88.x = _2113;
    out.m_88.y = _2115;
    out.m_88.z = _2117;
    out.m_88.w = _2085;
    bool _2119 = !_2059;
    float _2121 = _2109;
    float _2123 = _2109;
    if (!_2119)
    {
        bool _2125 = _1585 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2127 = isnan(_1585);
        bool _2129 = _2125 || _2127;
        bool _2131 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2133 = _2129 || _2131;
        if (!_2133)
        {
            float _2135 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2137 = _1585 + _2135;
            float _2139 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2141 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2139;
            float _2143 = 1.0 / _2141;
            float _2145 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2147 = _2145 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2149 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2151 = _2149 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2153 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2155 = _2153 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2157 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2159 = _2157 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2161 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2163 = _2161 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2165 = _2137 * _2143;
            float _2167 = precise::clamp(_2165, 0.0, 1.0);
            float _2169 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2171 = _2169 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2173 = fma(_2167, _2147, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2175 = fma(_2167, _2171, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2177 = fma(_2167, _2151, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2179 = fma(_2167, _2155, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2181 = fma(_2167, _2159, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2183 = fma(_2167, _2163, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2089 = _2175;
            _2107 = _2181;
            _2081 = _2173;
            _2101 = _2179;
            _2095 = _2177;
            _2123 = _2183;
            _2185 = true;
        }
        else
        {
            bool _2187 = _1585 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2189 = isnan(_1585);
            bool _2191 = _2187 || _2189;
            bool _2193 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2195 = _2191 || _2193;
            if (!_2195)
            {
                _2079 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2197 = _2079;
            _2081 = _2197;
            if (!_2195)
            {
                _2087 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2199 = _2087;
            _2089 = _2199;
            if (!_2195)
            {
                _2093 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2201 = _2093;
            _2095 = _2201;
            if (!_2195)
            {
                _2099 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2203 = _2099;
            _2101 = _2203;
            if (!_2195)
            {
                _2105 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2205 = _2105;
            _2107 = _2205;
            if (!_2195)
            {
                _2121 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2207 = _2121;
            bool _2209 = !_2195;
            _2123 = _2207;
            if (!_2209)
            {
                bool _2211 = _1585 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2213 = isnan(_1585);
                bool _2215 = _2211 || _2213;
                bool _2217 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2219 = _2215 || _2217;
                if (!_2219)
                {
                    float _2221 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2223 = _1585 + _2221;
                    float _2225 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2227 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2225;
                    float _2229 = 1.0 / _2227;
                    float _2231 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2233 = _2231 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2235 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2237 = _2235 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2239 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2241 = _2239 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2243 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2245 = _2243 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2247 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2249 = _2247 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2251 = _2223 * _2229;
                    float _2253 = precise::clamp(_2251, 0.0, 1.0);
                    float _2255 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2257 = _2255 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2259 = fma(_2253, _2233, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2261 = fma(_2253, _2257, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2263 = fma(_2253, _2237, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2265 = fma(_2253, _2241, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2267 = fma(_2253, _2245, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2269 = fma(_2253, _2249, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2089 = _2261;
                    _2107 = _2267;
                    _2081 = _2259;
                    _2101 = _2265;
                    _2095 = _2263;
                    _2123 = _2269;
                    _2185 = true;
                }
                else
                {
                    _2089 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2107 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2081 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2101 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2095 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2123 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2185 = false;
    float _2271 = _2089;
    float _2273 = _2107;
    float _2275 = _2081;
    float _2277 = _2101;
    float _2279 = _2095;
    float _2281 = _2123;
    float _2283 = fma(_1991, -0.5, 0.5);
    float _2285 = precise::clamp(_2283, 0.0, 1.0);
    float _2287 = -_2271;
    float _2289 = _2287 + _2273;
    float _2291 = -_2275;
    float _2293 = _2291 + _2277;
    float _2295 = -_2279;
    float _2297 = _2295 + _2281;
    bool _2299 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2301 = fma(_2285, _2289, _2271);
    float _2303 = fma(_2285, _2293, _2275);
    float _2305 = fma(_2285, _2297, _2279);
    float _2307 = _2301 * 0.586610972881317138671875;
    out.m_90.x = 0.0;
    float _2309 = fma(_2303, 0.298911988735198974609375, _2307);
    float _2311 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2313 = fma(_2305, 0.114477999508380889892578125, _2309);
    out.m_59.x = _2311;
    float _2315 = -_2313;
    float _2317 = _2303 + _2315;
    float _2319 = -_2313;
    float _2321 = _2301 + _2319;
    float _2323 = -_2313;
    float _2325 = _2305 + _2323;
    out.m_92.x = 0.0;
    float _2327 = fma(_2317, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2313);
    float _2329 = fma(_2321, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2313);
    float _2331 = fma(_2325, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2313);
    out.m_94.x = _2327;
    out.m_94.y = _2329;
    out.m_94.z = _2331;
    if (!_2299)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2333 = -_1264;
    float _2335 = _2333 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2337 = -_1266;
    float _2339 = _2337 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2341 = -_1268;
    float _2343 = _2341 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2345 = _2335 * _2335;
    float _2347 = fma(_2339, _2339, _2345);
    float _2349 = fma(_2343, _2343, _2347);
    float _2351 = rsqrt(_2349);
    float _2353 = _2335 * _2351;
    float _2355 = _2339 * _2351;
    float _2357 = _2343 * _2351;
    float _2359 = sqrt(_2349);
    float _2361 = -_1591;
    float _2363 = _2361 + _2353;
    float _2365 = -_1587;
    float _2367 = _2365 + _2355;
    float _2369 = -_1589;
    float _2371 = _2369 + _2357;
    float _2373 = _2363 * _2363;
    float _2375 = fma(_2367, _2367, _2373);
    float _2377 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2379 = precise::clamp(_2377, 0.0, 1.0);
    float _2381 = fma(_2371, _2371, _2375);
    float _2383 = _2379 * _2379;
    float _2385 = -_2359;
    float _2387 = _2385 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2389 = _2383 + (-1.0);
    float _2391 = rsqrt(_2381);
    float _2393 = _2387 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2395 = precise::clamp(_2393, 0.0, 1.0);
    float _2397 = abs(_2395);
    float _2399 = log2(_2397);
    float _2401 = _2363 * _2391;
    float _2403 = _2367 * _2391;
    float _2405 = _2371 * _2391;
    float _2407 = _1991 * _2401;
    float _2409 = _1991 * _2353;
    float _2411 = fma(_1985, _2403, _2407);
    float _2413 = _2399 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2415 = fma(_1985, _2355, _2409);
    float _2417 = fma(_2061, _2405, _2411);
    float _2419 = precise::clamp(_2417, 0.0, 1.0);
    float _2421 = fma(_2061, _2357, _2415);
    float _2423 = precise::clamp(_2421, 0.0, 1.0);
    float _2425 = exp2(_2413);
    float _2427 = _2419 * _2419;
    float _2429 = _2355 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2431 = fma(_2427, _2389, 1.0);
    float _2433 = -_2353;
    float _2435 = -_2429;
    float _2437 = fma(_2433, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2435);
    float _2439 = _2431 * _2431;
    float _2441 = -_2357;
    float _2443 = fma(_2441, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2437);
    float _2445 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2447 = _2443 + _2445;
    float _2449 = 1.0 / _2439;
    float _2451 = _2447 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2453 = precise::clamp(_2451, 0.0, 1.0);
    float _2455 = _2425 * _2453;
    float _2457 = _2423 * _2455;
    float _2459 = _2457 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2461 = _2383 * _2449;
    float _2463 = _2457 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2465 = _2457 * _2461;
    float _2467 = _2457 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2469 = _2465 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2471 = _2465 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2473 = _2465 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _2459;
    out.m_90.y = _2467;
    out.m_90.z = _2463;
    out.m_92.x = _2469;
    out.m_92.y = _2471;
    out.m_92.z = _2473;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

