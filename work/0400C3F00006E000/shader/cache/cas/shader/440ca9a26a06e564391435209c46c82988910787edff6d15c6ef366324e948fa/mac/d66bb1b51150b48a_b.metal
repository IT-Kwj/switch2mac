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
    float4 m_74 [[user(locn0)]];
    float4 m_76 [[user(locn1)]];
    float4 m_80 [[user(locn2)]];
    float4 m_78 [[user(locn3)]];
    float4 m_90 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_82 [[user(locn6)]];
    float4 m_88 [[user(locn7)]];
    float4 m_84 [[user(locn8)]];
    float4 m_86 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_67 [[attribute(1)]];
    float4 m_65 [[attribute(2)]];
    float4 m_56 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_63 [[attribute(5)]];
    float4 m_72 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2425 = false;
    bool _301 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_56.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_59.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2730 = as_type<float>(_125);
        out.gl_Position.z = _2730;
    }
    if (!_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = in.m_61.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = 0.0;
    float _147 = _143;
    if (_139)
    {
        float _149 = float(_109);
        _145 = _149;
    }
    float _151 = _145;
    bool _153 = _143 >= _151;
    bool _155 = !_139;
    bool _157 = _153 || _155;
    if (_157)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _119;
    if (_157)
    {
        out.m_59.x = 0.0;
    }
    if (_157)
    {
        float _161 = _159 * 5.0;
        _127 = as_type<int>(_161);
    }
    int _163 = _127;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2799 = as_type<float>(_163);
        out.gl_Position.z = _2799;
    }
    if (_157)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _165 = in.m_63.x;
    float _167 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _169 = _143 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _171 = in.m_65.x;
    float _173 = in.m_65.y;
    float _175 = in.m_65.z;
    float _177 = _169 * _167;
    int _179 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _181 = _179 != 0;
    float _183 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[20].x, _177);
    int _185 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _187 = _185 != 0;
    int _189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _191 = _189 != 0;
    float _193 = _183 * 6.283185482025146484375;
    float _195 = floor(_183);
    float _197 = _173 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _199 = _173 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _201 = _193 * 0.15915493667125701904296875;
    float _203 = _173 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _205 = !_187;
    int _207 = _205 ? 0 : 1;
    float _209 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].x, _197);
    float _211 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].x, _199);
    float _213 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].x, _203);
    float _215 = _201 * 6.283185482025146484375;
    float _217 = cos(_215);
    bool _219 = !_181;
    int _221 = _219 ? 0 : 1;
    float _223 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[5].z, _211);
    bool _225 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _227 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[4].z, _209);
    int _229 = abs(_221);
    float _231 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[6].z, _213);
    float _233 = -_195;
    float _235 = _183 + _233;
    int _237 = abs(_207);
    bool _239 = !_191;
    int _241 = _239 ? 0 : 1;
    float _243 = float(_237);
    float _245 = -_235;
    float _247 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _249 = abs(_241);
    float _251 = fma(_217, 0.5, 0.5);
    float _253 = abs(_247);
    float _255 = _243 * _253;
    bool _257 = _235 < 0.5;
    float _259 = float(_257);
    float _261 = -_251;
    float _263 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _265 = float(_229);
    float _267 = -_259;
    float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _271 = float(_249);
    float _273 = fma(_265, _263, _255);
    float _275 = abs(_269);
    float _277 = fma(_271, _275, _273);
    bool _279 = !_225;
    float _281 = _223;
    float _283 = _231;
    float _299;
    if (!_279)
    {
        float _285 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _287 = _165 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _289 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _291 = _289 * _285;
        float _293 = floor(_291);
        float _295 = -_293;
        float _297 = _291 + _295;
        _299 = _297;
        _301 = true;
    }
    else
    {
        float _303 = float(_109);
        float _305 = 1.0 / _303;
        float _307 = _143 * _305;
        _299 = _307;
    }
    _301 = false;
    float _309 = _299;
    float _311 = in.m_56.x;
    float _313 = in.m_56.y;
    float _315 = in.m_56.z;
    float _317 = _313 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _319 = _313 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _321 = fma(_311, (*spvDescriptorSet0.vp_c10)._m0[4].x, _317);
    float _323 = fma(_311, (*spvDescriptorSet0.vp_c10)._m0[6].x, _319);
    float _325 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[4].z, _321);
    float _327 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[6].z, _323);
    float _329 = _325 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _331 = _327 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _333 = fma(_329, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _335 = fma(_331, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _337 = floor(_333);
    float _339 = floor(_335);
    float _341 = -_337;
    float _343 = _333 + _341;
    float _345 = -_339;
    float _347 = _335 + _345;
    float2 _3094 = float2(_343, _347);
    float _349 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3094, float2(0.0), isnan(_3094)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3094, float2(0.0), isnan(_3094)), level(0.0)).x;
    float _351 = in.m_63.z;
    float _353 = _165 * 2.0;
    float _355 = _313 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _357 = in.m_63.y;
    int _359 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _361 = _359 != 0;
    int _363 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _365 = _363 != 0;
    int _367 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _369 = _367 != 0;
    float _371 = floor(_353);
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _373;
    float _377 = fma(_311, (*spvDescriptorSet0.vp_c10)._m0[5].x, _355);
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _381 = _309 + _379;
    float _383 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[5].z, _377);
    float _385 = 1.0 / _375;
    float _387 = _383 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _389 = _371 > 0.0;
    float _391 = _351 * 2.0;
    bool _393 = _371 >= 0.0;
    bool _395 = isnan(_371);
    bool _397 = _393 || _395;
    bool _399 = isnan(0.0);
    bool _401 = _397 || _399;
    float _403 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _405 = log2(_403);
    float _407 = _165 + _351;
    float _409 = _357 * 2.0;
    float _411 = _165 + _357;
    float _413 = _357 + _351;
    float _415 = _351 + (-0.5);
    float _417 = _411 + (-1.0);
    float _419 = floor(_391);
    float _421 = floor(_409);
    float _423 = _413 + (-1.0);
    float _425 = _381 * _385;
    bool _427 = !_365;
    int _429 = _427 ? 0 : 1;
    float _431 = _405 * _143;
    float _433 = fma(_423, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _435 = abs(_429);
    bool _437 = _419 > 0.0;
    float _439 = _407 + (-1.0);
    float _441 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _443 = _401 ? 0 : 1;
    float _445 = exp2(_431);
    bool _447 = _419 >= 0.0;
    bool _449 = isnan(_419);
    bool _451 = _447 || _449;
    bool _453 = isnan(0.0);
    bool _455 = _451 || _453;
    float _457 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _459 = ~_443;
    int _461 = _459 + 1;
    int _463 = _461 + 1;
    int _465 = _455 ? 0 : 1;
    int _467 = _463;
    int _469 = 2;
    if (!_389)
    {
        int _471 = ~_443;
        int _473 = _471 + 1;
        _467 = _473;
    }
    int _475 = _467;
    bool _477 = _421 > 0.0;
    bool _479 = _421 >= 0.0;
    bool _481 = isnan(_421);
    bool _483 = _479 || _481;
    bool _485 = isnan(0.0);
    bool _487 = _483 || _485;
    float _489 = float(_435);
    int _491 = ~_465;
    int _493 = _491 + 1;
    int _495 = _493 + 1;
    float _497 = -_445;
    float _499 = _497 + 1.0;
    float _501 = float(_475);
    int _503 = _495;
    if (!_437)
    {
        int _505 = ~_465;
        int _507 = _505 + 1;
        _503 = _507;
    }
    int _509 = _503;
    bool _511 = !_361;
    int _513 = _511 ? 0 : 1;
    float _515 = _489 * _501;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _519 = 1.0 + _517;
    float _521 = in.m_67.x;
    float _523 = in.m_67.y;
    float _525 = in.m_67.z;
    int _527 = abs(_513);
    float _529 = _387 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _531 = 1.0 / _519;
    float _533 = float(_509);
    float _535 = _515 * (-2.0);
    float _537 = fma(_329, (*spvDescriptorSet0.vp_c8)._m0[11].x, _529);
    float _539 = float(_527);
    float _541 = _387 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _543 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _545 = isnan(1.0);
    bool _547 = _543 || _545;
    bool _549 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _551 = _547 || _549;
    float _553 = fma(_331, (*spvDescriptorSet0.vp_c8)._m0[11].z, _537);
    bool _555 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _557 = isnan(0.0);
    bool _559 = _555 || _557;
    bool _561 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _563 = _559 || _561;
    float _565 = fma(_329, (*spvDescriptorSet0.vp_c8)._m0[10].x, _541);
    float _567 = _539 * _533;
    float _569 = _553 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _571 = _487 ? 0 : 1;
    float _573 = fma(_331, (*spvDescriptorSet0.vp_c8)._m0[10].z, _565);
    float _575 = _563 ? _499 : 0.0;
    float _577 = 1.0 / _569;
    float _579 = _567 * (-2.0);
    int _581 = ~_571;
    int _583 = _581 + 1;
    int _585 = _583 + 1;
    float _587 = _573 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _589 = _585;
    if (!_477)
    {
        int _591 = ~_571;
        int _593 = _591 + 1;
        _589 = _593;
    }
    int _595 = _589;
    if (_551)
    {
        float _597 = _575 * _531;
        _147 = _597;
    }
    float _599 = _147;
    float _601 = fma(_535, _523, _523);
    float _603 = _165 + (-0.5);
    float _605 = fma(_579, _521, _521);
    float _607 = _357 + (-0.5);
    float _609 = fma(_433, _535, _433);
    float _611 = _587 + _569;
    float _613 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[196].x, _605);
    bool _615 = !_369;
    int _617 = _615 ? 0 : 1;
    float _619 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[196].y, _601);
    float _621 = _611 * _577;
    float _623 = _621 * 0.5;
    int _625 = abs(_617);
    float _627 = fma(_609, _599, _619);
    bool _629 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _631 = isnan(_309);
    bool _633 = _629 || _631;
    bool _635 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _637 = _633 || _635;
    float _639 = float(_637);
    float _641 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _643 = fma(_623, (*spvDescriptorSet0.vp_c8)._m0[30].w, _641);
    bool _645 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _647 = isnan(_309);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = fma(_441, _579, _441);
    float _659 = float(_625);
    float _661 = as_type<float>(int(gl_VertexIndex));
    float _663 = float(_595);
    float _665 = -_655;
    float _667 = _665 + 1.0;
    float _669 = in.m_72.x;
    float _671 = in.m_72.y;
    float _673 = _659 * _663;
    float _675 = _639 * _667;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _677;
    float _681 = fma(_657, _599, _613);
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _683;
    float _687 = _673 * (-2.0);
    float _689 = fma(_679, _425, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _691 = -_639;
    float _693 = _691 + 1.0;
    float _695 = fma(_685, _425, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _697 = fma(_687, _525, _525);
    float _699 = _689 * _675;
    float _701 = 1.0 / _643;
    float _703 = _695 * _675;
    float _705 = fma(_457, _687, _457);
    float _707 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[196].z, _697);
    float _709 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[143].x, _699);
    float _711 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[143].y, _703);
    float _713 = _627 * 0.15915493667125701904296875;
    float _715 = _681 * 0.15915493667125701904296875;
    float _717 = fma(_705, _599, _707);
    float _719 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[144].y, _711);
    float _721 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[144].x, _709);
    float _723 = _713 * 6.283185482025146484375;
    float _725 = sin(_723);
    int _727 = as_type<int>(_661) & 1;
    bool _729 = _727 != 0;
    int _731 = as_type<int>(_661) & 2;
    bool _733 = _731 != 0;
    float _735 = _717 * 0.15915493667125701904296875;
    float _737 = _719 * _671;
    float _739 = _721 * _669;
    float _741 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _743 = _701 * _741;
    bool _745 = !_733;
    float _747 = _745 ? (-0.5) : 0.5;
    float _749 = _277 * _737;
    float _751 = _713 * 6.283185482025146484375;
    float _753 = cos(_751);
    float _755 = _277 * _739;
    bool _757 = _743 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _759 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _747);
    float _761 = _749 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _763 = _755 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _765 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _767 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _769 = _715 * 6.283185482025146484375;
    float _771 = sin(_769);
    bool _773 = !_729;
    float _775 = _773 ? (-0.5) : 0.5;
    float _777 = _761 * _759;
    bool _779 = _743 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _781 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _775);
    if (!_757)
    {
        _469 = 1;
    }
    int _783 = _469;
    float _785 = _715 * 6.283185482025146484375;
    float _787 = cos(_785);
    float _789 = _763 * _781;
    float _791 = _735 * 6.283185482025146484375;
    float _793 = sin(_791);
    float _795 = _771 * _725;
    float _797 = _387 + _765;
    float _799 = _771 * _753;
    float _801 = _797 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _803 = _735 * 6.283185482025146484375;
    float _805 = cos(_803);
    float _807 = _787 * _753;
    float _809 = _787 * _725;
    float _811 = fma(_329, (*spvDescriptorSet0.vp_c15)._m0[126].x, _801);
    float _813 = fma(_331, (*spvDescriptorSet0.vp_c15)._m0[126].z, _811);
    float _815 = fma(_793, _807, _795);
    float _817 = fma(_793, _795, _807);
    bool _819 = !_757;
    int _821 = _819 ? 0 : 1;
    float _823 = -_809;
    float _825 = fma(_793, _799, _823);
    float _827 = -_799;
    float _829 = fma(_793, _809, _827);
    float _831 = _813 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    int _833 = _783;
    float _835 = _797;
    if (!_779)
    {
        _833 = _821;
    }
    int _837 = _833;
    float _839 = _797 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _841 = _787 * _805;
    float _843 = _771 * _805;
    float _845 = _753 * _805;
    float _847 = _725 * _805;
    float _849 = _841 * _777;
    float _851 = fma(_329, (*spvDescriptorSet0.vp_c15)._m0[127].x, _839);
    float _853 = -_777;
    float _855 = _793 * _853;
    float _857 = _843 * _777;
    float _859 = fma(_815, _789, _849);
    float _861 = fma(_331, (*spvDescriptorSet0.vp_c15)._m0[127].z, _851);
    float _863 = fma(_845, _789, _855);
    float _865 = fma(_825, _789, _857);
    float _867 = fma(_829, _767, _859);
    float _869 = trunc(_831);
    int _871 = int(_869);
    float _873 = fma(_847, _767, _863);
    float _875 = _861 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _877 = _867 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _879 = fma(_817, _767, _865);
    float _881 = _867 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _883 = _837 << 6;
    float _885 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[26].x, _877);
    float _887 = trunc(_875);
    int _889 = int(_887);
    float _891 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[24].x, _881);
    int _893 = _883 + 72;
    uint _896 = uint(int(uint(_893) >> uint(2)));
    uint _898 = uint(int(uint(int(_896)) >> uint(2)));
    int _900 = int(_896) & 3;
    float _902 = (*spvDescriptorSet0.vp_c15)._m0[int(_898)][_900];
    int _904 = int(_896) + 1;
    uint _906 = uint(int(uint(_904) >> uint(2)));
    int _908 = _904 & 3;
    float _910 = (*spvDescriptorSet0.vp_c15)._m0[int(_906)][_908];
    float _912 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[26].z, _885);
    float _914 = _867 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _916 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[24].z, _891);
    float _918 = _912 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _920 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _922 = _871 + _920;
    int _924 = _922 + 1;
    float _926 = _916 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _928 = _883 + 48;
    uint _930 = uint(int(uint(_928) >> uint(2)));
    uint _932 = uint(int(uint(int(_930)) >> uint(2)));
    int _934 = int(_930) & 3;
    float _936 = (*spvDescriptorSet0.vp_c15)._m0[int(_932)][_934];
    int _938 = int(_930) + 1;
    uint _940 = uint(int(uint(_938) >> uint(2)));
    int _942 = _938 & 3;
    float _944 = (*spvDescriptorSet0.vp_c15)._m0[int(_940)][_942];
    float _946 = _331 + _918;
    bool _948 = _924 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _950 = _329 + _926;
    float _952 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[25].x, _914);
    float _954 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _956 = _946 + _954;
    int _958 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _960 = _889 + _958;
    int _962 = _960 + 1;
    float _964 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _966 = _950 + _964;
    int _968 = _883 + 56;
    uint _970 = uint(int(uint(_968) >> uint(2)));
    uint _972 = uint(int(uint(int(_970)) >> uint(2)));
    int _974 = int(_970) & 3;
    float _976 = (*spvDescriptorSet0.vp_c15)._m0[int(_972)][_974];
    int _978 = int(_970) + 1;
    uint _980 = uint(int(uint(_978) >> uint(2)));
    int _982 = _978 & 3;
    float _984 = (*spvDescriptorSet0.vp_c15)._m0[int(_980)][_982];
    float _986 = _956 * _956;
    int _988 = _924 | _962;
    float _990 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[25].z, _952);
    float _992 = fma(_966, _966, _986);
    bool _994 = _988 < 0;
    bool _996 = _994 || _948;
    float _998 = _990 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1000 = _883 + 64;
    uint _1002 = uint(int(uint(_1000) >> uint(2)));
    uint _1004 = uint(int(uint(int(_1002)) >> uint(2)));
    int _1006 = int(_1002) & 3;
    float _1008 = (*spvDescriptorSet0.vp_c15)._m0[int(_1004)][_1006];
    int _1010 = int(_1002) + 1;
    uint _1012 = uint(int(uint(_1010) >> uint(2)));
    int _1014 = _1010 & 3;
    float _1016 = (*spvDescriptorSet0.vp_c15)._m0[int(_1012)][_1014];
    float _1018 = sqrt(_992);
    bool _1020 = _962 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1022 = _1020 || _996;
    float _1024 = _387 + _998;
    int _1026 = _883 + 96;
    uint _1028 = uint(int(uint(_1026) >> uint(2)));
    uint _1030 = uint(int(uint(int(_1028)) >> uint(2)));
    int _1032 = int(_1028) & 3;
    float _1034 = (*spvDescriptorSet0.vp_c15)._m0[int(_1030)][_1032];
    int _1036 = int(_1028) + 1;
    uint _1038 = uint(int(uint(_1036) >> uint(2)));
    int _1040 = _1036 & 3;
    float _1042 = (*spvDescriptorSet0.vp_c15)._m0[int(_1038)][_1040];
    int _1044 = _924;
    int _1046 = as_type<int>(_879);
    int _1048 = _962;
    float _1050 = _950;
    float _1052 = _946;
    float _1054 = as_type<float>(_837);
    float _1056 = as_type<float>(_883);
    float _1058 = _875;
    if (!_1022)
    {
        int _1060 = _962 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1062 = _1060 + _924;
        _1044 = _1062;
    }
    int _1064 = _1044;
    int _1066 = _883 + 104;
    uint _1068 = uint(int(uint(_1066) >> uint(2)));
    uint _1070 = uint(int(uint(int(_1068)) >> uint(2)));
    int _1072 = int(_1068) & 3;
    float _1074 = (*spvDescriptorSet0.vp_c15)._m0[int(_1070)][_1072];
    int _1076 = int(_1068) + 1;
    uint _1078 = uint(int(uint(_1076) >> uint(2)));
    int _1080 = _1076 & 3;
    float _1082 = (*spvDescriptorSet0.vp_c15)._m0[int(_1078)][_1080];
    bool _1084 = _1018 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1086 = as_type<float>(_1064);
    if (!_1022)
    {
        int _1088 = _1064 << 2;
        _1046 = _1088;
    }
    int _1090 = _1046;
    int _1092 = _1090;
    if (!_1022)
    {
        uint _1094 = uint(int(uint(_1064) >> uint(2)));
        _1048 = int(_1094);
    }
    int _1096 = _1048;
    float _1098 = as_type<float>(_1096);
    if (!_1022)
    {
        int _1100 = 12 & _1090;
        _1092 = _1100;
    }
    int _1102 = _1092;
    float _1104 = as_type<float>(_1102);
    if (!_1022)
    {
        int _1106 = _1096 << 4;
        int _1108 = _1106 + _1102;
        _1098 = as_type<float>(_1108);
    }
    float _1110 = _1098;
    if (!_1084)
    {
        _1104 = _950;
    }
    float _1112 = _1104;
    float _1114 = _1112;
    if (!_1084)
    {
        _1050 = _1024;
    }
    float _1116 = _1050;
    bool _1118 = !_1084;
    float _1120 = _1116;
    float _1122 = _976;
    if (!_1118)
    {
        float _1124 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1126 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1128 = _1018 + _1126;
        float _1130 = _1024 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1132 = rsqrt(_992);
        float _1134 = _1128 * _1124;
        float _1136 = _1134 * 0.15915493667125701904296875;
        float _1138 = _1136 * 6.283185482025146484375;
        float _1140 = cos(_1138);
        float _1142 = _1136 * 6.283185482025146484375;
        float _1144 = sin(_1142);
        float _1146 = _1140 + (-1.0);
        float _1148 = fma(_1144, _1130, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1150 = _1146 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1152 = _1132 * _1148;
        float _1154 = fma(_1024, _1140, _1150);
        float _1156 = fma(_966, _1152, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1158 = fma(_956, _1152, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1120 = _1154;
        _1114 = _1156;
        _1052 = _1158;
    }
    float _1160 = _1120;
    float _1162 = _1114;
    float _1164 = _1052;
    float _1166 = -_387;
    float _1168 = _1166 + _1160;
    int _1170 = _883 + 80;
    uint _1172 = uint(int(uint(_1170) >> uint(2)));
    uint _1174 = uint(int(uint(int(_1172)) >> uint(2)));
    int _1176 = int(_1172) & 3;
    float _1178 = (*spvDescriptorSet0.vp_c15)._m0[int(_1174)][_1176];
    int _1180 = int(_1172) + 1;
    uint _1182 = uint(int(uint(_1180) >> uint(2)));
    int _1184 = _1180 & 3;
    float _1186 = (*spvDescriptorSet0.vp_c15)._m0[int(_1182)][_1184];
    float _1188 = -_329;
    float _1190 = _1188 + _1162;
    float _1192 = -_331;
    float _1194 = _1192 + _1164;
    float _1196 = _1168 * _1168;
    float _1198 = _797 * _1042;
    float _1200 = _797 * _1016;
    float _1202 = fma(_1190, _1190, _1196);
    int _1204 = _883 + 88;
    uint _1206 = uint(int(uint(_1204) >> uint(2)));
    uint _1208 = uint(int(uint(int(_1206)) >> uint(2)));
    int _1210 = int(_1206) & 3;
    float _1212 = (*spvDescriptorSet0.vp_c15)._m0[int(_1208)][_1210];
    int _1214 = int(_1206) + 1;
    uint _1216 = uint(int(uint(_1214) >> uint(2)));
    int _1218 = _1214 & 3;
    float _1220 = (*spvDescriptorSet0.vp_c15)._m0[int(_1216)][_1218];
    float _1222 = fma(_329, _1034, _1198);
    float _1224 = _1196;
    float _1226 = _1160;
    float _1228 = _1164;
    float _1230 = _1162;
    if (!_1022)
    {
        float _1232 = floor(_831);
        _1224 = _1232;
    }
    float _1234 = _1224;
    float _1236 = fma(_1194, _1194, _1202);
    bool _1238 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1240 = isnan(0.5);
    bool _1242 = _1238 || _1240;
    bool _1244 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1246 = _1242 || _1244;
    float _1248 = fma(_331, _1074, _1222);
    float _1250 = _797 * _944;
    float _1252 = fma(_329, _1008, _1200);
    float _1254 = _1110;
    if (!_1022)
    {
        int _1256 = as_type<int>(_1110) + 400;
        uint _1258 = uint(int(uint(_1256) >> uint(2)));
        uint _1260 = uint(int(uint(int(_1258)) >> uint(2)));
        int _1262 = int(_1258) & 3;
        float _1264 = (*spvDescriptorSet0.vp_c15)._m0[int(_1260)][_1262];
        _1254 = _1264;
    }
    float _1266 = _1254;
    float _1268 = _1248 + _1082;
    float _1270 = sqrt(_1236);
    float _1272 = fma(_329, _936, _1250);
    float _1274 = fma(_331, _902, _1252);
    float _1276 = fma(_331, _976, _1272);
    float _1278 = _1274 + _910;
    float _1280 = _1222;
    if (!_1022)
    {
        float _1282 = floor(_875);
        _1280 = _1282;
    }
    float _1284 = _1280;
    float _1286 = _1276 + _984;
    bool _1288 = _1270 > 0.0;
    float _1290 = 1.0 / _1268;
    if (!_1288)
    {
        _1122 = _1162;
    }
    float _1292 = _1122;
    bool _1294 = !_1288;
    float _1296 = _1292;
    float _1298 = _1266;
    if (!_1294)
    {
        float _1300 = _223 * _223;
        float _1302 = rsqrt(_1236);
        float _1304 = fma(_227, _227, _1300);
        float _1306 = fma(_231, _231, _1304);
        float _1308 = sqrt(_1306);
        float _1310 = _1190 * _1302;
        float _1312 = _1168 * _1302;
        float _1314 = _1194 * _1302;
        bool _1316 = _1308 > 0.0;
        float _1318 = _1308;
        if (!_1316)
        {
            _1318 = _1162;
        }
        float _1320 = _1318;
        bool _1322 = !_1316;
        _1296 = _1320;
        if (!_1322)
        {
            float _1324 = rsqrt(_1306);
            float _1326 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1328 = _223 * _1324;
            float _1330 = _227 * _1324;
            float _1332 = _231 * _1324;
            float _1334 = _1312 * _1328;
            float _1336 = fma(_1310, _1330, _1334);
            float _1338 = _1326 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1340 = fma(_1314, _1332, _1336);
            float _1342 = _1340 * _1338;
            float _1344 = fma(_227, _1342, _1162);
            float _1346 = fma(_223, _1342, _1160);
            float _1348 = fma(_231, _1342, _1164);
            _1296 = _1344;
            _1226 = _1346;
            _1228 = _1348;
        }
    }
    float _1350 = _1296;
    float _1352 = _1226;
    float _1354 = _1228;
    float _1356 = _1350;
    float _1358 = _1352;
    if (_1246)
    {
        _281 = _1350;
    }
    float _1360 = _281;
    float _1362 = _1360;
    if (_1246)
    {
        _283 = _1352;
    }
    float _1364 = _283;
    float _1366 = _1364;
    if (_1246)
    {
        _1230 = _1354;
    }
    float _1368 = _1230;
    float _1370 = _1368;
    if (!_1246)
    {
        float _1372 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1374 = _387 + _1372;
        float _1376 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1378 = _329 + _1376;
        float _1380 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1382 = -_387;
        float _1384 = _1382 + _1352;
        float _1386 = _1374 * _1374;
        float _1388 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1390 = _331 + _1388;
        float _1392 = -_329;
        float _1394 = _1392 + _1350;
        float _1396 = fma(_1378, _1378, _1386);
        float _1398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1400 = fma(_1390, _1390, _1396);
        float _1402 = sqrt(_1400);
        float _1404 = _1380 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1406 = precise::min(_1402, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1408 = _1406 * _1398;
        float _1410 = _1404 * _1408;
        float _1412 = -_331;
        float _1414 = _1412 + _1354;
        float _1416 = fma(_1384, _1410, _387);
        float _1418 = fma(_1394, _1410, _329);
        float _1420 = fma(_1414, _1410, _331);
        _1366 = _1416;
        _1362 = _1418;
        _1370 = _1420;
        _1356 = _1394;
    }
    float _1422 = _1366;
    float _1424 = _1362;
    float _1426 = _1370;
    float _1428 = _1356;
    float _1430 = _1422 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1432 = _1286 * _1290;
    float _1434 = _1422 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1436 = _1422 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1438 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1430);
    float _1440 = _1278 * _1290;
    float _1442 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1434);
    bool _1444 = _1432 >= 0.0;
    float _1446 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1438);
    float _1448 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1436);
    float _1450 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1442);
    float _1452 = _1422 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1454 = _1446 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1456 = _1432 <= 1.0;
    bool _1458 = _1456 && _1444;
    float _1460 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1448);
    float _1462 = _1450 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1464 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1452);
    float _1466 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1468 = _1460 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1470 = _1440 >= 0.0;
    bool _1472 = _1470 && _1458;
    float _1474 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1464);
    float _1476 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1466);
    float _1478 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1480 = _1468 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1482 = _1440 <= 1.0;
    bool _1484 = _1482 && _1472;
    float _1486 = _1474 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1488 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1476);
    float _1490 = -_1480;
    float _1492 = fma(_1490, _1478, 1.0);
    float _1494 = _797 * _1186;
    float _1496 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1498 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1488);
    float _1500 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1502 = fma(_329, _1178, _1494);
    float _1504 = log2(_1492);
    float _1506 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1496);
    float _1508 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1500);
    float _1510 = fma(_331, _1212, _1502);
    if (_1484)
    {
        float _1512 = float(_837);
        _1054 = _1512;
    }
    float _1514 = _1054;
    float _1516 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1506);
    float _1518 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1508);
    float _1520 = _1510 + _1220;
    float _1522 = 1.0 / _1498;
    float _1524 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1516);
    float _1526 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1518);
    float _1528 = _1516;
    if (!_1022)
    {
        float _1530 = -_1284;
        float _1532 = _875 + _1530;
        _1056 = _1532;
    }
    float _1534 = _1056;
    if (!_1022)
    {
        float _1536 = -_1234;
        float _1538 = _831 + _1536;
        _1528 = _1538;
    }
    float _1540 = _1528;
    float _1542 = _1520 * _1290;
    float _1544 = _1428;
    if (!_1022)
    {
        float _1546 = rint(_1266);
        float _1548 = precise::max(_1546, 0.0);
        uint _1550 = uint(_1548);
        uint _1552 = clamp(_1550, 0u, 65535u);
        _1544 = as_type<float>(_1552);
    }
    float _1554 = _1544;
    float _1556 = _1504 * 0.693147182464599609375;
    float _1558 = _1556 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1560 = _1502;
    if (_1484)
    {
        float _1562 = rint(_1514);
        float _1564 = precise::max(_1562, 0.0);
        uint _1566 = uint(_1564);
        uint _1568 = clamp(_1566, 0u, 65535u);
        _1560 = as_type<float>(_1568);
    }
    float _1570 = _1560;
    float _1572 = _1524 * _1522;
    float _1574 = _1526 * _1522;
    float _1576 = fma(_1572, 0.5, 0.5);
    float _1578 = fma(_1574, -0.5, 0.5);
    float _1580 = _831;
    if (!_1022)
    {
        float3 _5048 = float3(_1540, _1534, float(as_type<int>(_1554)));
        float3 _5052 = select(_5048, float3(0.0), isnan(_5048));
        float _1582 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5052.xy, uint(rint(_5052.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5052.xy, uint(rint(_5052.z)), level(0.0)).x;
        _1580 = _1582;
    }
    float _1584 = _1580;
    float _1586 = _1514;
    if (_1484)
    {
        float3 _5067 = float3(_1432, _1440, float(as_type<int>(_1570)));
        float3 _5069 = select(_5067, float3(0.0), isnan(_5067));
        float _1588 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5069.xy, uint(rint(_5069.z)), _1542, level(0.0));
        _1586 = _1588;
    }
    float _1590 = _1586;
    float3 _5079 = float3(_1576, _1578, _1558);
    float _1592 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5079, float3(0.0), isnan(_5079)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5079, float3(0.0), isnan(_5079)), level(0.0)).x;
    float3 _5088 = float3(_1576, _1578, _1558);
    float4 _1595 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5088, float3(0.0), isnan(_5088)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5088, float3(0.0), isnan(_5088)), level(0.0)).xyzw;
    float _1597 = _1595.x;
    float _1599 = _1595.y;
    float _1601 = _1595.z;
    float _1603 = _1595.w;
    bool _1605 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1607 = isnan(0.5);
    bool _1609 = _1605 || _1607;
    bool _1611 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1613 = _1609 || _1611;
    if (_1022)
    {
        _1298 = 1.0;
    }
    float _1615 = _1298;
    float _1617 = _1615;
    if (_1613)
    {
        _1058 = 1.0;
    }
    float _1619 = _1058;
    float _1621 = _1619;
    if (_1613)
    {
        _1358 = 1.0;
    }
    float _1623 = _1358;
    float _1625 = _1623;
    if (!_1613)
    {
        float _1627 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1629 = _1627 * 0.15915493667125701904296875;
        float _1631 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1633 = _1629 * 6.283185482025146484375;
        float _1635 = cos(_1633);
        float _1637 = _1631 * 0.15915493667125701904296875;
        float _1639 = _1629 * 6.283185482025146484375;
        float _1641 = sin(_1639);
        float _1643 = 1.0 / _1635;
        float _1645 = _1637 * 6.283185482025146484375;
        float _1647 = cos(_1645);
        float _1649 = _1641 * _1643;
        float _1651 = _1637 * 6.283185482025146484375;
        float _1653 = sin(_1651);
        float _1655 = _1647 * _1649;
        float _1657 = 1.0 / _1655;
        float _1659 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1661 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1659;
        float _1663 = 1.0 / _1661;
        float _1665 = _1653 * _1657;
        float _1667 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1669 = fma(_743, _1665, _1667);
        float _1671 = _1669 * _1663;
        float _1673 = precise::clamp(_1671, 0.0, 1.0);
        _1625 = _1673;
    }
    float _1675 = _1625;
    if (!_1613)
    {
        float _1677 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1679 = _1677 * 0.15915493667125701904296875;
        float _1681 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1683 = _1679 * 6.283185482025146484375;
        float _1685 = cos(_1683);
        float _1687 = _1681 * 0.15915493667125701904296875;
        float _1689 = _1679 * 6.283185482025146484375;
        float _1691 = sin(_1689);
        float _1693 = 1.0 / _1685;
        float _1695 = _1687 * 6.283185482025146484375;
        float _1697 = cos(_1695);
        float _1699 = _1691 * _1693;
        float _1701 = _1687 * 6.283185482025146484375;
        float _1703 = sin(_1701);
        float _1705 = _1697 * _1699;
        float _1707 = 1.0 / _1705;
        float _1709 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1711 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1709;
        float _1713 = 1.0 / _1711;
        float _1715 = _1703 * _1707;
        float _1717 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1719 = fma(_743, _1715, _1717);
        float _1721 = _1719 * _1713;
        float _1723 = precise::clamp(_1721, 0.0, 1.0);
        float _1725 = -_1723;
        float _1727 = _1725 + 1.0;
        _1621 = _1727;
    }
    float _1729 = _1621;
    if (!_1022)
    {
        int _1731 = _1064 << 4;
        int _1733 = _1731 + 2048;
        uint _1735 = uint(int(uint(_1733) >> uint(2)));
        uint _1737 = uint(int(uint(int(_1735)) >> uint(2)));
        int _1739 = int(_1735) & 3;
        float _1741 = (*spvDescriptorSet0.vp_c15)._m0[int(_1737)][_1739];
        int _1743 = int(_1735) + 1;
        uint _1745 = uint(int(uint(_1743) >> uint(2)));
        int _1747 = _1743 & 3;
        float _1749 = (*spvDescriptorSet0.vp_c15)._m0[int(_1745)][_1747];
        int _1751 = _1733 + 8;
        uint _1753 = uint(int(uint(_1751) >> uint(2)));
        uint _1755 = uint(int(uint(int(_1753)) >> uint(2)));
        int _1757 = int(_1753) & 3;
        float _1759 = (*spvDescriptorSet0.vp_c15)._m0[int(_1755)][_1757];
        int _1761 = int(_1753) + 1;
        uint _1763 = uint(int(uint(_1761) >> uint(2)));
        int _1765 = _1761 & 3;
        float _1767 = (*spvDescriptorSet0.vp_c15)._m0[int(_1763)][_1765];
        float _1769 = _797 * _1749;
        float _1771 = fma(_329, _1741, _1769);
        float _1773 = fma(_331, _1759, _1771);
        float _1775 = _1773 + _1767;
        float _1777 = precise::clamp(_1775, 0.0, 1.0);
        float _1779 = -_1777;
        float _1781 = _1779 + _1584;
        float _1783 = fma(_1781, 500.0, 1.5);
        float _1785 = exp2(_1783);
        float _1787 = 0.0 + _1785;
        float _1789 = precise::clamp(_1787, 0.0, 1.0);
        _835 = _1769;
        _1086 = as_type<float>(_1733);
        _1617 = _1789;
    }
    float _1791 = _835;
    float _1793 = _1086;
    float _1795 = _1617;
    float _1797 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1799 = _1422 + _1797;
    float _1801 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1803 = _1424 + _1801;
    float _1805 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1807 = _1426 + _1805;
    float _1809 = _1799 * _1799;
    float _1811 = fma(_1803, _1803, _1809);
    float _1813 = fma(_1807, _1807, _1811);
    float _1815 = rsqrt(_1813);
    float _1817 = sqrt(_1813);
    float _1819 = _1815 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1821 = _1803 * _1819;
    float _1823 = _1807 * _1819;
    float _1825 = _1821 * _1821;
    float _1827 = _1823 * _1823;
    float _1829 = _1825 + _1827;
    float _1831 = sqrt(_1829);
    bool _1833 = _1831 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1835 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1837 = _1831 + _1835;
    float _1839 = _1440;
    float _1841 = _1829;
    float _1843 = _1837;
    float _1845 = _1793;
    float _1847 = _1821;
    float _1849 = _1823;
    float _1851 = _1825;
    float _1853 = _1827;
    if (_1833)
    {
        float _1855 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1839 = _1855;
    }
    float _1857 = _1839;
    if (_1833)
    {
        float _1859 = rsqrt(_1829);
        _1841 = _1859;
    }
    float _1861 = _1841;
    if (_1833)
    {
        float _1863 = _1837 * _1857;
        _1843 = _1863;
    }
    float _1865 = _1843;
    if (_1833)
    {
        float _1867 = _1865 * 0.15915493667125701904296875;
        _1845 = _1867;
    }
    float _1869 = _1845;
    float _1871 = _1791;
    if (_1833)
    {
        float _1873 = _1869 * 6.283185482025146484375;
        float _1875 = sin(_1873);
        _1871 = _1875;
    }
    float _1877 = _1871;
    float _1879 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1881 = precise::max(0.0, _1879);
    float _1883 = _1857;
    float _1885 = _1881;
    if (_1833)
    {
        float _1887 = _1869 * 6.283185482025146484375;
        float _1889 = cos(_1887);
        _1883 = _1889;
    }
    float _1891 = _1883;
    float _1893 = -_1819;
    float _1895 = -_1881;
    float _1897 = fma(_1799, _1893, _1895);
    float _1899 = _1897;
    if (_1833)
    {
        float _1901 = _1897 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1885 = _1901;
    }
    float _1903 = _1885;
    float _1905 = _1877;
    float _1907 = _1903;
    if (_1833)
    {
        float _1909 = fma(_1877, _1903, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1905 = _1909;
    }
    float _1911 = _1905;
    float _1913 = _1911;
    if (_1833)
    {
        float _1915 = _1891 + (-1.0);
        _1907 = _1915;
    }
    float _1917 = _1907;
    float _1919 = _1917;
    if (_1833)
    {
        float _1921 = _1861 * _1911;
        _1913 = _1921;
    }
    float _1923 = _1913;
    if (_1833)
    {
        float _1925 = _1917 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1919 = _1925;
    }
    float _1927 = _1919;
    if (_1833)
    {
        float _1929 = _1821 * _1923;
        _1847 = _1929;
    }
    float _1931 = _1847;
    if (_1833)
    {
        float _1933 = _1823 * _1923;
        _1849 = _1933;
    }
    float _1935 = _1849;
    if (_1833)
    {
        float _1937 = fma(_1897, _1891, _1927);
        _1899 = _1937;
    }
    float _1939 = _1899;
    if (_1833)
    {
        float _1941 = _1931 * _1931;
        _1851 = _1941;
    }
    float _1943 = _1851;
    if (_1833)
    {
        float _1945 = _1935 * _1935;
        _1853 = _1945;
    }
    float _1947 = _1853;
    float _1949 = fma(_1939, _1939, _1943);
    float _1951 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1953 = fma(_1817, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1951);
    float _1955 = precise::clamp(_1953, 0.0, 1.0);
    float _1957 = _1949 + _1947;
    float _1959 = -_1955;
    float _1961 = _1959 + 1.0;
    float _1963 = rsqrt(_1957);
    float _1965 = abs(_1961);
    float _1967 = log2(_1965);
    float _1969 = _1963 * _1931;
    float _1971 = _1963 * _1939;
    float _1973 = _1963 * _1935;
    float _1975 = _1969 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1977 = -_1975;
    float _1979 = fma(_1971, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1977);
    float _1981 = -_1973;
    float _1983 = fma(_1981, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1979);
    float _1985 = _1967 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1987 = fma(_1983, -0.5, 0.5);
    float _1989 = exp2(_1985);
    float _1991 = fma(_1983, 0.5, 0.5);
    float _1993 = fma(_1991, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1995 = sqrt(_1987);
    float _1997 = fma(_1991, _1993, -0.212114393711090087890625);
    float _1999 = _1971 + 1.0;
    float _2001 = fma(_1991, _1997, 1.570728778839111328125);
    float _2003 = -_1971;
    float _2005 = fma(_1989, _1999, _2003);
    float _2007 = fma(_2005, 0.5, 0.5);
    float _2009 = _1995 * 0.636619746685028076171875;
    float _2011 = -_2001;
    float _2013 = fma(_2009, _2011, 1.0);
    float2 _5700 = float2(_2013, _2007);
    float3 _2017 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5700, float2(0.0), isnan(_5700)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5700, float2(0.0), isnan(_5700)), level(0.0)).xyz;
    float _2019 = _2017.x;
    float _2021 = _2017.y;
    float _2023 = _2017.z;
    float _2025 = abs(_743);
    float _2027 = log2(_2025);
    bool _2029 = _357 > 0.5;
    float _2031 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2033 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2035 = _2033 != 0;
    float _2037 = _1967 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2039 = -_747;
    int _2041 = _2029 ? as_type<int>(_2039) : as_type<int>(_747);
    float _2043 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2031);
    int _2045 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2047 = _2045 != 0;
    float _2049 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2051 = !_2035;
    float _2053 = _2051 ? _747 : as_type<float>(_2041);
    float _2055 = _747 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2057 = _165 > 0.5;
    float _2059 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2043);
    float _2061 = -_2053;
    float _2063 = _2061 + 0.5;
    float _2065 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2067 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2069 = -_349;
    float _2071 = _2069 + 1.0;
    float _2073 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2075 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2077 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2079 = -_775;
    int _2081 = _2057 ? as_type<int>(_2079) : as_type<int>(_775);
    float _2083 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2085 = _2063 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2087 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _2089 = !_2047;
    float _2091 = _2089 ? _775 : as_type<float>(_2081);
    float _2093 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2095 = _2067 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2097 = _2073 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2099 = _2075 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2101 = _2027 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2103 = _2085 * _2049;
    float _2105 = _2077 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2107 = _2083 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2109 = _2087 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2111 = _2091 + 0.5;
    float _2113 = _841 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_74.x = _2095;
    out.m_74.y = _2097;
    out.m_74.z = _2099;
    out.m_74.w = _2093;
    float _2115 = exp2(_2101);
    float _2117 = _2111 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2119 = _841 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_76.x = _2105;
    out.m_76.y = _2107;
    out.m_76.z = _2109;
    float _2121 = _841 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2123 = _2117 * _2065;
    float _2125 = -_793;
    float _2127 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2119);
    float _2129 = _775 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2131 = -_793;
    float _2133 = fma(_2131, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2113);
    float _2135 = -_793;
    float _2137 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2121);
    float _2139 = exp2(_2037);
    bool _2141 = _743 <= 8000.0;
    bool _2143 = isnan(_743);
    bool _2145 = _2141 || _2143;
    bool _2147 = isnan(8000.0);
    bool _2149 = _2145 || _2147;
    float _2151 = float(_2149);
    float _2153 = _815 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2155 = _815 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2157 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2133);
    float _2159 = fma(_2115, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2161 = precise::clamp(_2159, 0.0, 1.0);
    float _2163 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2153);
    float _2165 = _829 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2167 = _2055 * _2157;
    float _2169 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2155);
    float _2171 = _829 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2173 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2165);
    float _2175 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2163);
    float _2177 = _829 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2179 = _815 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2181 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2127);
    float _2183 = fma(_2129, _2175, _2167);
    float _2185 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2177);
    float _2187 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2059);
    float _2189 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2179);
    float _2191 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2137);
    float _2193 = fma(_2161, -2.0, 3.0);
    float _2195 = _2161 * _2161;
    out.gl_Position.x = _1524;
    out.gl_Position.y = _1526;
    out.gl_Position.z = _2187;
    out.gl_Position.w = _1498;
    float _2197 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2171);
    float _2199 = _2055 * _2181;
    float _2201 = _2195 * _2193;
    float _2203 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2169);
    float _2205 = _2187 + _1498;
    float _2207 = _2055 * _2191;
    float _2209 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2189);
    float _2211 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2197);
    float _2213 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2173);
    float _2215 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2185);
    float _2217 = fma(_2129, _2203, _2199);
    float _2219 = _2205 * 0.5;
    float _2221 = -_2201;
    float _2223 = _2221 + 1.0;
    float _2225 = -_2139;
    float _2227 = _2225 + 1.0;
    float _2229 = fma(_2129, _2209, _2207);
    float _2231 = _2213 + _2183;
    float _2233 = fma(_2223, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2201);
    float _2235 = _2223;
    float _2237 = _2219;
    if (!_1484)
    {
        _2235 = 1.0;
    }
    float _2239 = _2235;
    float _2241 = _2227 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2243 = _2239;
    float _2245 = _2241;
    if (_1484)
    {
        bool _2247 = _1590 >= _1542;
        bool _2249 = isnan(_1590);
        bool _2251 = _2247 || _2249;
        bool _2253 = isnan(_1542);
        bool _2255 = _2251 || _2253;
        float _2257 = float(_2255);
        _2243 = _2257;
    }
    float _2259 = _2243;
    float _2261 = _2151 * _2233;
    out.m_78.z = _2219;
    out.m_78.w = _1498;
    float _2263 = _2241 * _1592;
    float _2265 = -_2241;
    float _2267 = _2265 + 1.0;
    float _2269 = _2261 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2271 = _2259 * _1795;
    float _2273 = _1603 * _2263;
    float _2275 = _2211 + _2217;
    float _2277 = _2071 * _2269;
    float _2279 = precise::clamp(_2277, 0.0, 1.0);
    float _2281 = _2215 + _2229;
    out.m_80.x = _2123;
    out.m_80.y = _2103;
    bool _2283 = _1817 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2285 = isnan(_1817);
    bool _2287 = _2283 || _2285;
    bool _2289 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2291 = _2287 || _2289;
    float _2293 = -_2279;
    float _2295 = fma(_2293, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_82.x = _2275;
    out.m_82.y = _2231;
    out.m_82.z = _2281;
    float _2297 = -_2271;
    float _2299 = fma(_2297, _2295, 1.0);
    float _2301 = precise::clamp(_2299, 0.0, 1.0);
    float _2303 = _1603 * _2267;
    float _2305 = _2301 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2307 = _1675 * _1729;
    float _2309 = _2269;
    float _2311 = _2267;
    float _2313 = _2307;
    float _2315 = _2273;
    if (!_2291)
    {
        _2309 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2317 = _2309;
    out.m_84.x = _2305;
    float _2319 = _2307 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2321 = _2317;
    float _2323 = _2317;
    if (!_2291)
    {
        _2237 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2325 = _2237;
    float _2327 = _2325;
    float _2329 = _2325;
    if (!_2291)
    {
        _2311 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2331 = _2311;
    float _2333 = _2331;
    float _2335 = _2331;
    if (!_2291)
    {
        _2245 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2337 = _2245;
    float _2339 = _2337;
    float _2341 = _2337;
    if (!_2291)
    {
        _2313 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2343 = _2313;
    float _2345 = _2023 * _2263;
    float _2347 = fma(_2019, _2273, _1597);
    float _2349 = fma(_2021, _2273, _1599);
    float _2351 = _2343;
    float _2353 = _2343;
    if (!_2291)
    {
        _2315 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2355 = _2315;
    float _2357 = fma(_1603, _2345, _1601);
    out.m_86.x = _2347;
    out.m_86.y = _2349;
    out.m_86.z = _2357;
    out.m_86.w = _2303;
    bool _2359 = !_2291;
    float _2361 = _2355;
    float _2363 = _2355;
    if (!_2359)
    {
        bool _2365 = _1817 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2367 = isnan(_1817);
        bool _2369 = _2365 || _2367;
        bool _2371 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2373 = _2369 || _2371;
        if (!_2373)
        {
            float _2375 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2377 = _1817 + _2375;
            float _2379 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2381 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2379;
            float _2383 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2385 = _2383 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2387 = 1.0 / _2381;
            float _2389 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2391 = _2389 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2393 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2395 = _2393 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2397 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2399 = _2397 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2401 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2403 = _2401 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2405 = _2377 * _2387;
            float _2407 = precise::clamp(_2405, 0.0, 1.0);
            float _2409 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2411 = _2409 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2413 = fma(_2407, _2385, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2415 = fma(_2407, _2411, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2417 = fma(_2407, _2391, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2419 = fma(_2407, _2395, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2421 = fma(_2407, _2399, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2423 = fma(_2407, _2403, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2329 = _2417;
            _2341 = _2421;
            _2323 = _2413;
            _2335 = _2419;
            _2363 = _2415;
            _2353 = _2423;
            _2425 = true;
        }
        else
        {
            bool _2427 = _1817 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2429 = isnan(_1817);
            bool _2431 = _2427 || _2429;
            bool _2433 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2435 = _2431 || _2433;
            if (!_2435)
            {
                _2321 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2437 = _2321;
            _2323 = _2437;
            if (!_2435)
            {
                _2327 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2439 = _2327;
            _2329 = _2439;
            if (!_2435)
            {
                _2361 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2441 = _2361;
            _2363 = _2441;
            if (!_2435)
            {
                _2333 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2443 = _2333;
            _2335 = _2443;
            if (!_2435)
            {
                _2339 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2445 = _2339;
            _2341 = _2445;
            if (!_2435)
            {
                _2351 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2447 = _2351;
            bool _2449 = !_2435;
            _2353 = _2447;
            if (!_2449)
            {
                bool _2451 = _1817 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2453 = isnan(_1817);
                bool _2455 = _2451 || _2453;
                bool _2457 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2459 = _2455 || _2457;
                if (!_2459)
                {
                    float _2461 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2463 = _1817 + _2461;
                    float _2465 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2467 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2465;
                    float _2469 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2471 = _2469 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2473 = 1.0 / _2467;
                    float _2475 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2477 = _2475 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2479 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2481 = _2479 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2483 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2485 = _2483 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2487 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2489 = _2487 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2491 = _2463 * _2473;
                    float _2493 = precise::clamp(_2491, 0.0, 1.0);
                    float _2495 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2497 = _2495 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2499 = fma(_2493, _2471, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2501 = fma(_2493, _2497, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2503 = fma(_2493, _2477, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2505 = fma(_2493, _2481, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2507 = fma(_2493, _2485, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2509 = fma(_2493, _2489, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2329 = _2503;
                    _2341 = _2507;
                    _2323 = _2499;
                    _2335 = _2505;
                    _2363 = _2501;
                    _2353 = _2509;
                    _2425 = true;
                }
                else
                {
                    _2329 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2341 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2323 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2335 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2363 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2353 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2425 = false;
    float _2511 = _2329;
    float _2513 = _2341;
    float _2515 = _2323;
    float _2517 = _2335;
    float _2519 = _2363;
    float _2521 = _2353;
    float _2523 = _2319 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2525 = fma(_2231, -0.5, 0.5);
    float _2527 = precise::clamp(_2525, 0.0, 1.0);
    float _2529 = -_2511;
    float _2531 = _2529 + _2513;
    float _2533 = -_2515;
    float _2535 = _2533 + _2517;
    out.m_59.x = _2523;
    float _2537 = fma(_2527, _2531, _2511);
    float _2539 = -_2519;
    float _2541 = _2539 + _2521;
    float _2543 = fma(_2527, _2535, _2515);
    float _2545 = _2537 * 0.586610972881317138671875;
    bool _2547 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2549 = fma(_2527, _2541, _2519);
    out.m_88.x = 0.0;
    float _2551 = fma(_2543, 0.298911988735198974609375, _2545);
    bool _2553 = _1675 > 0.0;
    bool _2555 = isnan(_1675);
    bool _2557 = _2553 || _2555;
    bool _2559 = isnan(0.0);
    bool _2561 = _2557 || _2559;
    float _2563 = fma(_2549, 0.114477999508380889892578125, _2551);
    bool _2565 = _1729 <= 0.0;
    bool _2567 = !_2561;
    bool _2569 = _2565 || _2567;
    float _2571 = -_2563;
    float _2573 = _2543 + _2571;
    float _2575 = -_2563;
    float _2577 = _2537 + _2575;
    float _2579 = -_2563;
    float _2581 = _2549 + _2579;
    float _2583 = fma(_2573, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2563);
    float _2585 = fma(_2577, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2563);
    float _2587 = fma(_2581, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2563);
    bool _2589 = !_2547;
    if (!_2589)
    {
        float _2591 = -_1422;
        float _2593 = _2591 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2595 = -_1424;
        float _2597 = _2595 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2599 = -_1426;
        float _2601 = _2599 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2603 = _2593 * _2593;
        float _2605 = fma(_2597, _2597, _2603);
        float _2607 = fma(_2601, _2601, _2605);
        float _2609 = sqrt(_2607);
        float _2611 = rsqrt(_2607);
        float _2613 = -_2609;
        float _2615 = _2613 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2617 = _2615 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2619 = precise::clamp(_2617, 0.0, 1.0);
        float _2621 = _2597 * _2611;
        float _2623 = _2593 * _2611;
        float _2625 = abs(_2619);
        float _2627 = log2(_2625);
        float _2629 = _2601 * _2611;
        float _2631 = _2621 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2633 = _2231 * _2623;
        float _2635 = -_2623;
        float _2637 = -_2631;
        float _2639 = fma(_2635, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2637);
        float _2641 = fma(_2275, _2621, _2633);
        float _2643 = -_2629;
        float _2645 = fma(_2643, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2639);
        float _2647 = fma(_2281, _2629, _2641);
        float _2649 = precise::clamp(_2647, 0.0, 1.0);
        float _2651 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2653 = _2645 + _2651;
        float _2655 = _2627 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2657 = _2653 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2659 = precise::clamp(_2657, 0.0, 1.0);
        float _2661 = exp2(_2655);
        float _2663 = _2661 * _2659;
        float _2665 = _2649 * _2663;
        float _2667 = _2665 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2669 = _2665 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2671 = _2665 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _2667;
        out.m_88.y = _2669;
        out.m_88.z = _2671;
    }
    out.m_90.x = _2583;
    out.m_90.y = _2585;
    out.m_90.z = _2587;
    if (!_2569)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_59.x = 0.0;
    float _2673 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2673;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2425 = false;
    bool _301 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_56.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_59.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2730 = as_type<float>(_125);
        out.gl_Position.z = _2730;
    }
    if (!_113)
    {
        return out;
    }
    float _129 = in.m_61.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = 0.0;
    float _147 = _143;
    if (_139)
    {
        float _149 = float(_109);
        _145 = _149;
    }
    float _151 = _145;
    bool _153 = _143 >= _151;
    bool _155 = !_139;
    bool _157 = _153 || _155;
    if (_157)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _119;
    if (_157)
    {
        out.m_59.x = 0.0;
    }
    if (_157)
    {
        float _161 = _159 * 5.0;
        _127 = as_type<int>(_161);
    }
    int _163 = _127;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2799 = as_type<float>(_163);
        out.gl_Position.z = _2799;
    }
    if (_157)
    {
        return out;
    }
    float _165 = in.m_63.x;
    float _167 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _169 = _143 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _171 = in.m_65.x;
    float _173 = in.m_65.y;
    float _175 = in.m_65.z;
    float _177 = _169 * _167;
    int _179 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _181 = _179 != 0;
    float _183 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[20].x, _177);
    int _185 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _187 = _185 != 0;
    int _189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _191 = _189 != 0;
    float _193 = _183 * 6.283185482025146484375;
    float _195 = floor(_183);
    float _197 = _173 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _199 = _173 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _201 = _193 * 0.15915493667125701904296875;
    float _203 = _173 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _205 = !_187;
    int _207 = _205 ? 0 : 1;
    float _209 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].x, _197);
    float _211 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].x, _199);
    float _213 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].x, _203);
    float _215 = _201 * 6.283185482025146484375;
    float _217 = cos(_215);
    bool _219 = !_181;
    int _221 = _219 ? 0 : 1;
    float _223 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[5].z, _211);
    bool _225 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _227 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[4].z, _209);
    int _229 = abs(_221);
    float _231 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[6].z, _213);
    float _233 = -_195;
    float _235 = _183 + _233;
    int _237 = abs(_207);
    bool _239 = !_191;
    int _241 = _239 ? 0 : 1;
    float _243 = float(_237);
    float _245 = -_235;
    float _247 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _249 = abs(_241);
    float _251 = fma(_217, 0.5, 0.5);
    float _253 = abs(_247);
    float _255 = _243 * _253;
    bool _257 = _235 < 0.5;
    float _259 = float(_257);
    float _261 = -_251;
    float _263 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _265 = float(_229);
    float _267 = -_259;
    float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _271 = float(_249);
    float _273 = fma(_265, _263, _255);
    float _275 = abs(_269);
    float _277 = fma(_271, _275, _273);
    bool _279 = !_225;
    float _281 = _223;
    float _283 = _231;
    float _299;
    if (!_279)
    {
        float _285 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _287 = _165 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _289 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _291 = _289 * _285;
        float _293 = floor(_291);
        float _295 = -_293;
        float _297 = _291 + _295;
        _299 = _297;
        _301 = true;
    }
    else
    {
        float _303 = float(_109);
        float _305 = 1.0 / _303;
        float _307 = _143 * _305;
        _299 = _307;
    }
    _301 = false;
    float _309 = _299;
    float _311 = in.m_56.x;
    float _313 = in.m_56.y;
    float _315 = in.m_56.z;
    float _317 = _313 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _319 = _313 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _321 = fma(_311, (*spvDescriptorSet0.vp_c10)._m0[4].x, _317);
    float _323 = fma(_311, (*spvDescriptorSet0.vp_c10)._m0[6].x, _319);
    float _325 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[4].z, _321);
    float _327 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[6].z, _323);
    float _329 = _325 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _331 = _327 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _333 = fma(_329, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _335 = fma(_331, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _337 = floor(_333);
    float _339 = floor(_335);
    float _341 = -_337;
    float _343 = _333 + _341;
    float _345 = -_339;
    float _347 = _335 + _345;
    float2 _3094 = float2(_343, _347);
    float _349 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3094, float2(0.0), isnan(_3094)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3094, float2(0.0), isnan(_3094)), level(0.0)).x;
    float _351 = in.m_63.z;
    float _353 = _165 * 2.0;
    float _355 = _313 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _357 = in.m_63.y;
    int _359 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _361 = _359 != 0;
    int _363 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _365 = _363 != 0;
    int _367 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _369 = _367 != 0;
    float _371 = floor(_353);
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _373;
    float _377 = fma(_311, (*spvDescriptorSet0.vp_c10)._m0[5].x, _355);
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _381 = _309 + _379;
    float _383 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[5].z, _377);
    float _385 = 1.0 / _375;
    float _387 = _383 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _389 = _371 > 0.0;
    float _391 = _351 * 2.0;
    bool _393 = _371 >= 0.0;
    bool _395 = isnan(_371);
    bool _397 = _393 || _395;
    bool _399 = isnan(0.0);
    bool _401 = _397 || _399;
    float _403 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _405 = log2(_403);
    float _407 = _165 + _351;
    float _409 = _357 * 2.0;
    float _411 = _165 + _357;
    float _413 = _357 + _351;
    float _415 = _351 + (-0.5);
    float _417 = _411 + (-1.0);
    float _419 = floor(_391);
    float _421 = floor(_409);
    float _423 = _413 + (-1.0);
    float _425 = _381 * _385;
    bool _427 = !_365;
    int _429 = _427 ? 0 : 1;
    float _431 = _405 * _143;
    float _433 = fma(_423, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _435 = abs(_429);
    bool _437 = _419 > 0.0;
    float _439 = _407 + (-1.0);
    float _441 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _443 = _401 ? 0 : 1;
    float _445 = exp2(_431);
    bool _447 = _419 >= 0.0;
    bool _449 = isnan(_419);
    bool _451 = _447 || _449;
    bool _453 = isnan(0.0);
    bool _455 = _451 || _453;
    float _457 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _459 = ~_443;
    int _461 = _459 + 1;
    int _463 = _461 + 1;
    int _465 = _455 ? 0 : 1;
    int _467 = _463;
    int _469 = 2;
    if (!_389)
    {
        int _471 = ~_443;
        int _473 = _471 + 1;
        _467 = _473;
    }
    int _475 = _467;
    bool _477 = _421 > 0.0;
    bool _479 = _421 >= 0.0;
    bool _481 = isnan(_421);
    bool _483 = _479 || _481;
    bool _485 = isnan(0.0);
    bool _487 = _483 || _485;
    float _489 = float(_435);
    int _491 = ~_465;
    int _493 = _491 + 1;
    int _495 = _493 + 1;
    float _497 = -_445;
    float _499 = _497 + 1.0;
    float _501 = float(_475);
    int _503 = _495;
    if (!_437)
    {
        int _505 = ~_465;
        int _507 = _505 + 1;
        _503 = _507;
    }
    int _509 = _503;
    bool _511 = !_361;
    int _513 = _511 ? 0 : 1;
    float _515 = _489 * _501;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _519 = 1.0 + _517;
    float _521 = in.m_67.x;
    float _523 = in.m_67.y;
    float _525 = in.m_67.z;
    int _527 = abs(_513);
    float _529 = _387 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _531 = 1.0 / _519;
    float _533 = float(_509);
    float _535 = _515 * (-2.0);
    float _537 = fma(_329, (*spvDescriptorSet0.vp_c8)._m0[11].x, _529);
    float _539 = float(_527);
    float _541 = _387 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _543 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _545 = isnan(1.0);
    bool _547 = _543 || _545;
    bool _549 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _551 = _547 || _549;
    float _553 = fma(_331, (*spvDescriptorSet0.vp_c8)._m0[11].z, _537);
    bool _555 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _557 = isnan(0.0);
    bool _559 = _555 || _557;
    bool _561 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _563 = _559 || _561;
    float _565 = fma(_329, (*spvDescriptorSet0.vp_c8)._m0[10].x, _541);
    float _567 = _539 * _533;
    float _569 = _553 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _571 = _487 ? 0 : 1;
    float _573 = fma(_331, (*spvDescriptorSet0.vp_c8)._m0[10].z, _565);
    float _575 = _563 ? _499 : 0.0;
    float _577 = 1.0 / _569;
    float _579 = _567 * (-2.0);
    int _581 = ~_571;
    int _583 = _581 + 1;
    int _585 = _583 + 1;
    float _587 = _573 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _589 = _585;
    if (!_477)
    {
        int _591 = ~_571;
        int _593 = _591 + 1;
        _589 = _593;
    }
    int _595 = _589;
    if (_551)
    {
        float _597 = _575 * _531;
        _147 = _597;
    }
    float _599 = _147;
    float _601 = fma(_535, _523, _523);
    float _603 = _165 + (-0.5);
    float _605 = fma(_579, _521, _521);
    float _607 = _357 + (-0.5);
    float _609 = fma(_433, _535, _433);
    float _611 = _587 + _569;
    float _613 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[196].x, _605);
    bool _615 = !_369;
    int _617 = _615 ? 0 : 1;
    float _619 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[196].y, _601);
    float _621 = _611 * _577;
    float _623 = _621 * 0.5;
    int _625 = abs(_617);
    float _627 = fma(_609, _599, _619);
    bool _629 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _631 = isnan(_309);
    bool _633 = _629 || _631;
    bool _635 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _637 = _633 || _635;
    float _639 = float(_637);
    float _641 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _643 = fma(_623, (*spvDescriptorSet0.vp_c8)._m0[30].w, _641);
    bool _645 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _647 = isnan(_309);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = fma(_441, _579, _441);
    float _659 = float(_625);
    float _661 = as_type<float>(int(gl_VertexIndex));
    float _663 = float(_595);
    float _665 = -_655;
    float _667 = _665 + 1.0;
    float _669 = in.m_72.x;
    float _671 = in.m_72.y;
    float _673 = _659 * _663;
    float _675 = _639 * _667;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _677;
    float _681 = fma(_657, _599, _613);
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _683;
    float _687 = _673 * (-2.0);
    float _689 = fma(_679, _425, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _691 = -_639;
    float _693 = _691 + 1.0;
    float _695 = fma(_685, _425, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _697 = fma(_687, _525, _525);
    float _699 = _689 * _675;
    float _701 = 1.0 / _643;
    float _703 = _695 * _675;
    float _705 = fma(_457, _687, _457);
    float _707 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[196].z, _697);
    float _709 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[143].x, _699);
    float _711 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[143].y, _703);
    float _713 = _627 * 0.15915493667125701904296875;
    float _715 = _681 * 0.15915493667125701904296875;
    float _717 = fma(_705, _599, _707);
    float _719 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[144].y, _711);
    float _721 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[144].x, _709);
    float _723 = _713 * 6.283185482025146484375;
    float _725 = sin(_723);
    int _727 = as_type<int>(_661) & 1;
    bool _729 = _727 != 0;
    int _731 = as_type<int>(_661) & 2;
    bool _733 = _731 != 0;
    float _735 = _717 * 0.15915493667125701904296875;
    float _737 = _719 * _671;
    float _739 = _721 * _669;
    float _741 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _743 = _701 * _741;
    bool _745 = !_733;
    float _747 = _745 ? (-0.5) : 0.5;
    float _749 = _277 * _737;
    float _751 = _713 * 6.283185482025146484375;
    float _753 = cos(_751);
    float _755 = _277 * _739;
    bool _757 = _743 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _759 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _747);
    float _761 = _749 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _763 = _755 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _765 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _767 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _769 = _715 * 6.283185482025146484375;
    float _771 = sin(_769);
    bool _773 = !_729;
    float _775 = _773 ? (-0.5) : 0.5;
    float _777 = _761 * _759;
    bool _779 = _743 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _781 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _775);
    if (!_757)
    {
        _469 = 1;
    }
    int _783 = _469;
    float _785 = _715 * 6.283185482025146484375;
    float _787 = cos(_785);
    float _789 = _763 * _781;
    float _791 = _735 * 6.283185482025146484375;
    float _793 = sin(_791);
    float _795 = _771 * _725;
    float _797 = _387 + _765;
    float _799 = _771 * _753;
    float _801 = _797 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _803 = _735 * 6.283185482025146484375;
    float _805 = cos(_803);
    float _807 = _787 * _753;
    float _809 = _787 * _725;
    float _811 = fma(_329, (*spvDescriptorSet0.vp_c15)._m0[126].x, _801);
    float _813 = fma(_331, (*spvDescriptorSet0.vp_c15)._m0[126].z, _811);
    float _815 = fma(_793, _807, _795);
    float _817 = fma(_793, _795, _807);
    bool _819 = !_757;
    int _821 = _819 ? 0 : 1;
    float _823 = -_809;
    float _825 = fma(_793, _799, _823);
    float _827 = -_799;
    float _829 = fma(_793, _809, _827);
    float _831 = _813 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    int _833 = _783;
    float _835 = _797;
    if (!_779)
    {
        _833 = _821;
    }
    int _837 = _833;
    float _839 = _797 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _841 = _787 * _805;
    float _843 = _771 * _805;
    float _845 = _753 * _805;
    float _847 = _725 * _805;
    float _849 = _841 * _777;
    float _851 = fma(_329, (*spvDescriptorSet0.vp_c15)._m0[127].x, _839);
    float _853 = -_777;
    float _855 = _793 * _853;
    float _857 = _843 * _777;
    float _859 = fma(_815, _789, _849);
    float _861 = fma(_331, (*spvDescriptorSet0.vp_c15)._m0[127].z, _851);
    float _863 = fma(_845, _789, _855);
    float _865 = fma(_825, _789, _857);
    float _867 = fma(_829, _767, _859);
    float _869 = trunc(_831);
    int _871 = int(_869);
    float _873 = fma(_847, _767, _863);
    float _875 = _861 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _877 = _867 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _879 = fma(_817, _767, _865);
    float _881 = _867 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _883 = _837 << 6;
    float _885 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[26].x, _877);
    float _887 = trunc(_875);
    int _889 = int(_887);
    float _891 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[24].x, _881);
    int _893 = _883 + 72;
    uint _896 = uint(int(uint(_893) >> uint(2)));
    uint _898 = uint(int(uint(int(_896)) >> uint(2)));
    int _900 = int(_896) & 3;
    float _902 = (*spvDescriptorSet0.vp_c15)._m0[int(_898)][_900];
    int _904 = int(_896) + 1;
    uint _906 = uint(int(uint(_904) >> uint(2)));
    int _908 = _904 & 3;
    float _910 = (*spvDescriptorSet0.vp_c15)._m0[int(_906)][_908];
    float _912 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[26].z, _885);
    float _914 = _867 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _916 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[24].z, _891);
    float _918 = _912 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _920 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _922 = _871 + _920;
    int _924 = _922 + 1;
    float _926 = _916 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _928 = _883 + 48;
    uint _930 = uint(int(uint(_928) >> uint(2)));
    uint _932 = uint(int(uint(int(_930)) >> uint(2)));
    int _934 = int(_930) & 3;
    float _936 = (*spvDescriptorSet0.vp_c15)._m0[int(_932)][_934];
    int _938 = int(_930) + 1;
    uint _940 = uint(int(uint(_938) >> uint(2)));
    int _942 = _938 & 3;
    float _944 = (*spvDescriptorSet0.vp_c15)._m0[int(_940)][_942];
    float _946 = _331 + _918;
    bool _948 = _924 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _950 = _329 + _926;
    float _952 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[25].x, _914);
    float _954 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _956 = _946 + _954;
    int _958 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _960 = _889 + _958;
    int _962 = _960 + 1;
    float _964 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _966 = _950 + _964;
    int _968 = _883 + 56;
    uint _970 = uint(int(uint(_968) >> uint(2)));
    uint _972 = uint(int(uint(int(_970)) >> uint(2)));
    int _974 = int(_970) & 3;
    float _976 = (*spvDescriptorSet0.vp_c15)._m0[int(_972)][_974];
    int _978 = int(_970) + 1;
    uint _980 = uint(int(uint(_978) >> uint(2)));
    int _982 = _978 & 3;
    float _984 = (*spvDescriptorSet0.vp_c15)._m0[int(_980)][_982];
    float _986 = _956 * _956;
    int _988 = _924 | _962;
    float _990 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[25].z, _952);
    float _992 = fma(_966, _966, _986);
    bool _994 = _988 < 0;
    bool _996 = _994 || _948;
    float _998 = _990 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1000 = _883 + 64;
    uint _1002 = uint(int(uint(_1000) >> uint(2)));
    uint _1004 = uint(int(uint(int(_1002)) >> uint(2)));
    int _1006 = int(_1002) & 3;
    float _1008 = (*spvDescriptorSet0.vp_c15)._m0[int(_1004)][_1006];
    int _1010 = int(_1002) + 1;
    uint _1012 = uint(int(uint(_1010) >> uint(2)));
    int _1014 = _1010 & 3;
    float _1016 = (*spvDescriptorSet0.vp_c15)._m0[int(_1012)][_1014];
    float _1018 = sqrt(_992);
    bool _1020 = _962 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1022 = _1020 || _996;
    float _1024 = _387 + _998;
    int _1026 = _883 + 96;
    uint _1028 = uint(int(uint(_1026) >> uint(2)));
    uint _1030 = uint(int(uint(int(_1028)) >> uint(2)));
    int _1032 = int(_1028) & 3;
    float _1034 = (*spvDescriptorSet0.vp_c15)._m0[int(_1030)][_1032];
    int _1036 = int(_1028) + 1;
    uint _1038 = uint(int(uint(_1036) >> uint(2)));
    int _1040 = _1036 & 3;
    float _1042 = (*spvDescriptorSet0.vp_c15)._m0[int(_1038)][_1040];
    int _1044 = _924;
    int _1046 = as_type<int>(_879);
    int _1048 = _962;
    float _1050 = _950;
    float _1052 = _946;
    float _1054 = as_type<float>(_837);
    float _1056 = as_type<float>(_883);
    float _1058 = _875;
    if (!_1022)
    {
        int _1060 = _962 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1062 = _1060 + _924;
        _1044 = _1062;
    }
    int _1064 = _1044;
    int _1066 = _883 + 104;
    uint _1068 = uint(int(uint(_1066) >> uint(2)));
    uint _1070 = uint(int(uint(int(_1068)) >> uint(2)));
    int _1072 = int(_1068) & 3;
    float _1074 = (*spvDescriptorSet0.vp_c15)._m0[int(_1070)][_1072];
    int _1076 = int(_1068) + 1;
    uint _1078 = uint(int(uint(_1076) >> uint(2)));
    int _1080 = _1076 & 3;
    float _1082 = (*spvDescriptorSet0.vp_c15)._m0[int(_1078)][_1080];
    bool _1084 = _1018 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1086 = as_type<float>(_1064);
    if (!_1022)
    {
        int _1088 = _1064 << 2;
        _1046 = _1088;
    }
    int _1090 = _1046;
    int _1092 = _1090;
    if (!_1022)
    {
        uint _1094 = uint(int(uint(_1064) >> uint(2)));
        _1048 = int(_1094);
    }
    int _1096 = _1048;
    float _1098 = as_type<float>(_1096);
    if (!_1022)
    {
        int _1100 = 12 & _1090;
        _1092 = _1100;
    }
    int _1102 = _1092;
    float _1104 = as_type<float>(_1102);
    if (!_1022)
    {
        int _1106 = _1096 << 4;
        int _1108 = _1106 + _1102;
        _1098 = as_type<float>(_1108);
    }
    float _1110 = _1098;
    if (!_1084)
    {
        _1104 = _950;
    }
    float _1112 = _1104;
    float _1114 = _1112;
    if (!_1084)
    {
        _1050 = _1024;
    }
    float _1116 = _1050;
    bool _1118 = !_1084;
    float _1120 = _1116;
    float _1122 = _976;
    if (!_1118)
    {
        float _1124 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1126 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1128 = _1018 + _1126;
        float _1130 = _1024 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1132 = rsqrt(_992);
        float _1134 = _1128 * _1124;
        float _1136 = _1134 * 0.15915493667125701904296875;
        float _1138 = _1136 * 6.283185482025146484375;
        float _1140 = cos(_1138);
        float _1142 = _1136 * 6.283185482025146484375;
        float _1144 = sin(_1142);
        float _1146 = _1140 + (-1.0);
        float _1148 = fma(_1144, _1130, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1150 = _1146 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1152 = _1132 * _1148;
        float _1154 = fma(_1024, _1140, _1150);
        float _1156 = fma(_966, _1152, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1158 = fma(_956, _1152, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1120 = _1154;
        _1114 = _1156;
        _1052 = _1158;
    }
    float _1160 = _1120;
    float _1162 = _1114;
    float _1164 = _1052;
    float _1166 = -_387;
    float _1168 = _1166 + _1160;
    int _1170 = _883 + 80;
    uint _1172 = uint(int(uint(_1170) >> uint(2)));
    uint _1174 = uint(int(uint(int(_1172)) >> uint(2)));
    int _1176 = int(_1172) & 3;
    float _1178 = (*spvDescriptorSet0.vp_c15)._m0[int(_1174)][_1176];
    int _1180 = int(_1172) + 1;
    uint _1182 = uint(int(uint(_1180) >> uint(2)));
    int _1184 = _1180 & 3;
    float _1186 = (*spvDescriptorSet0.vp_c15)._m0[int(_1182)][_1184];
    float _1188 = -_329;
    float _1190 = _1188 + _1162;
    float _1192 = -_331;
    float _1194 = _1192 + _1164;
    float _1196 = _1168 * _1168;
    float _1198 = _797 * _1042;
    float _1200 = _797 * _1016;
    float _1202 = fma(_1190, _1190, _1196);
    int _1204 = _883 + 88;
    uint _1206 = uint(int(uint(_1204) >> uint(2)));
    uint _1208 = uint(int(uint(int(_1206)) >> uint(2)));
    int _1210 = int(_1206) & 3;
    float _1212 = (*spvDescriptorSet0.vp_c15)._m0[int(_1208)][_1210];
    int _1214 = int(_1206) + 1;
    uint _1216 = uint(int(uint(_1214) >> uint(2)));
    int _1218 = _1214 & 3;
    float _1220 = (*spvDescriptorSet0.vp_c15)._m0[int(_1216)][_1218];
    float _1222 = fma(_329, _1034, _1198);
    float _1224 = _1196;
    float _1226 = _1160;
    float _1228 = _1164;
    float _1230 = _1162;
    if (!_1022)
    {
        float _1232 = floor(_831);
        _1224 = _1232;
    }
    float _1234 = _1224;
    float _1236 = fma(_1194, _1194, _1202);
    bool _1238 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1240 = isnan(0.5);
    bool _1242 = _1238 || _1240;
    bool _1244 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1246 = _1242 || _1244;
    float _1248 = fma(_331, _1074, _1222);
    float _1250 = _797 * _944;
    float _1252 = fma(_329, _1008, _1200);
    float _1254 = _1110;
    if (!_1022)
    {
        int _1256 = as_type<int>(_1110) + 400;
        uint _1258 = uint(int(uint(_1256) >> uint(2)));
        uint _1260 = uint(int(uint(int(_1258)) >> uint(2)));
        int _1262 = int(_1258) & 3;
        float _1264 = (*spvDescriptorSet0.vp_c15)._m0[int(_1260)][_1262];
        _1254 = _1264;
    }
    float _1266 = _1254;
    float _1268 = _1248 + _1082;
    float _1270 = sqrt(_1236);
    float _1272 = fma(_329, _936, _1250);
    float _1274 = fma(_331, _902, _1252);
    float _1276 = fma(_331, _976, _1272);
    float _1278 = _1274 + _910;
    float _1280 = _1222;
    if (!_1022)
    {
        float _1282 = floor(_875);
        _1280 = _1282;
    }
    float _1284 = _1280;
    float _1286 = _1276 + _984;
    bool _1288 = _1270 > 0.0;
    float _1290 = 1.0 / _1268;
    if (!_1288)
    {
        _1122 = _1162;
    }
    float _1292 = _1122;
    bool _1294 = !_1288;
    float _1296 = _1292;
    float _1298 = _1266;
    if (!_1294)
    {
        float _1300 = _223 * _223;
        float _1302 = rsqrt(_1236);
        float _1304 = fma(_227, _227, _1300);
        float _1306 = fma(_231, _231, _1304);
        float _1308 = sqrt(_1306);
        float _1310 = _1190 * _1302;
        float _1312 = _1168 * _1302;
        float _1314 = _1194 * _1302;
        bool _1316 = _1308 > 0.0;
        float _1318 = _1308;
        if (!_1316)
        {
            _1318 = _1162;
        }
        float _1320 = _1318;
        bool _1322 = !_1316;
        _1296 = _1320;
        if (!_1322)
        {
            float _1324 = rsqrt(_1306);
            float _1326 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1328 = _223 * _1324;
            float _1330 = _227 * _1324;
            float _1332 = _231 * _1324;
            float _1334 = _1312 * _1328;
            float _1336 = fma(_1310, _1330, _1334);
            float _1338 = _1326 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1340 = fma(_1314, _1332, _1336);
            float _1342 = _1340 * _1338;
            float _1344 = fma(_227, _1342, _1162);
            float _1346 = fma(_223, _1342, _1160);
            float _1348 = fma(_231, _1342, _1164);
            _1296 = _1344;
            _1226 = _1346;
            _1228 = _1348;
        }
    }
    float _1350 = _1296;
    float _1352 = _1226;
    float _1354 = _1228;
    float _1356 = _1350;
    float _1358 = _1352;
    if (_1246)
    {
        _281 = _1350;
    }
    float _1360 = _281;
    float _1362 = _1360;
    if (_1246)
    {
        _283 = _1352;
    }
    float _1364 = _283;
    float _1366 = _1364;
    if (_1246)
    {
        _1230 = _1354;
    }
    float _1368 = _1230;
    float _1370 = _1368;
    if (!_1246)
    {
        float _1372 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1374 = _387 + _1372;
        float _1376 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1378 = _329 + _1376;
        float _1380 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1382 = -_387;
        float _1384 = _1382 + _1352;
        float _1386 = _1374 * _1374;
        float _1388 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1390 = _331 + _1388;
        float _1392 = -_329;
        float _1394 = _1392 + _1350;
        float _1396 = fma(_1378, _1378, _1386);
        float _1398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1400 = fma(_1390, _1390, _1396);
        float _1402 = sqrt(_1400);
        float _1404 = _1380 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1406 = precise::min(_1402, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1408 = _1406 * _1398;
        float _1410 = _1404 * _1408;
        float _1412 = -_331;
        float _1414 = _1412 + _1354;
        float _1416 = fma(_1384, _1410, _387);
        float _1418 = fma(_1394, _1410, _329);
        float _1420 = fma(_1414, _1410, _331);
        _1366 = _1416;
        _1362 = _1418;
        _1370 = _1420;
        _1356 = _1394;
    }
    float _1422 = _1366;
    float _1424 = _1362;
    float _1426 = _1370;
    float _1428 = _1356;
    float _1430 = _1422 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1432 = _1286 * _1290;
    float _1434 = _1422 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1436 = _1422 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1438 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1430);
    float _1440 = _1278 * _1290;
    float _1442 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1434);
    bool _1444 = _1432 >= 0.0;
    float _1446 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1438);
    float _1448 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1436);
    float _1450 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1442);
    float _1452 = _1422 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1454 = _1446 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1456 = _1432 <= 1.0;
    bool _1458 = _1456 && _1444;
    float _1460 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1448);
    float _1462 = _1450 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1464 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1452);
    float _1466 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1468 = _1460 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1470 = _1440 >= 0.0;
    bool _1472 = _1470 && _1458;
    float _1474 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1464);
    float _1476 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1466);
    float _1478 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1480 = _1468 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1482 = _1440 <= 1.0;
    bool _1484 = _1482 && _1472;
    float _1486 = _1474 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1488 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1476);
    float _1490 = -_1480;
    float _1492 = fma(_1490, _1478, 1.0);
    float _1494 = _797 * _1186;
    float _1496 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1498 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1488);
    float _1500 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1502 = fma(_329, _1178, _1494);
    float _1504 = log2(_1492);
    float _1506 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1496);
    float _1508 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1500);
    float _1510 = fma(_331, _1212, _1502);
    if (_1484)
    {
        float _1512 = float(_837);
        _1054 = _1512;
    }
    float _1514 = _1054;
    float _1516 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1506);
    float _1518 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1508);
    float _1520 = _1510 + _1220;
    float _1522 = 1.0 / _1498;
    float _1524 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1516);
    float _1526 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1518);
    float _1528 = _1516;
    if (!_1022)
    {
        float _1530 = -_1284;
        float _1532 = _875 + _1530;
        _1056 = _1532;
    }
    float _1534 = _1056;
    if (!_1022)
    {
        float _1536 = -_1234;
        float _1538 = _831 + _1536;
        _1528 = _1538;
    }
    float _1540 = _1528;
    float _1542 = _1520 * _1290;
    float _1544 = _1428;
    if (!_1022)
    {
        float _1546 = rint(_1266);
        float _1548 = precise::max(_1546, 0.0);
        uint _1550 = uint(_1548);
        uint _1552 = clamp(_1550, 0u, 65535u);
        _1544 = as_type<float>(_1552);
    }
    float _1554 = _1544;
    float _1556 = _1504 * 0.693147182464599609375;
    float _1558 = _1556 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1560 = _1502;
    if (_1484)
    {
        float _1562 = rint(_1514);
        float _1564 = precise::max(_1562, 0.0);
        uint _1566 = uint(_1564);
        uint _1568 = clamp(_1566, 0u, 65535u);
        _1560 = as_type<float>(_1568);
    }
    float _1570 = _1560;
    float _1572 = _1524 * _1522;
    float _1574 = _1526 * _1522;
    float _1576 = fma(_1572, 0.5, 0.5);
    float _1578 = fma(_1574, -0.5, 0.5);
    float _1580 = _831;
    if (!_1022)
    {
        float3 _5048 = float3(_1540, _1534, float(as_type<int>(_1554)));
        float3 _5052 = select(_5048, float3(0.0), isnan(_5048));
        float _1582 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5052.xy, uint(rint(_5052.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5052.xy, uint(rint(_5052.z)), level(0.0)).x;
        _1580 = _1582;
    }
    float _1584 = _1580;
    float _1586 = _1514;
    if (_1484)
    {
        float3 _5067 = float3(_1432, _1440, float(as_type<int>(_1570)));
        float3 _5069 = select(_5067, float3(0.0), isnan(_5067));
        float _1588 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5069.xy, uint(rint(_5069.z)), _1542, level(0.0));
        _1586 = _1588;
    }
    float _1590 = _1586;
    float3 _5079 = float3(_1576, _1578, _1558);
    float _1592 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5079, float3(0.0), isnan(_5079)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5079, float3(0.0), isnan(_5079)), level(0.0)).x;
    float3 _5088 = float3(_1576, _1578, _1558);
    float4 _1595 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5088, float3(0.0), isnan(_5088)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5088, float3(0.0), isnan(_5088)), level(0.0)).xyzw;
    float _1597 = _1595.x;
    float _1599 = _1595.y;
    float _1601 = _1595.z;
    float _1603 = _1595.w;
    bool _1605 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1607 = isnan(0.5);
    bool _1609 = _1605 || _1607;
    bool _1611 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1613 = _1609 || _1611;
    if (_1022)
    {
        _1298 = 1.0;
    }
    float _1615 = _1298;
    float _1617 = _1615;
    if (_1613)
    {
        _1058 = 1.0;
    }
    float _1619 = _1058;
    float _1621 = _1619;
    if (_1613)
    {
        _1358 = 1.0;
    }
    float _1623 = _1358;
    float _1625 = _1623;
    if (!_1613)
    {
        float _1627 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1629 = _1627 * 0.15915493667125701904296875;
        float _1631 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1633 = _1629 * 6.283185482025146484375;
        float _1635 = cos(_1633);
        float _1637 = _1631 * 0.15915493667125701904296875;
        float _1639 = _1629 * 6.283185482025146484375;
        float _1641 = sin(_1639);
        float _1643 = 1.0 / _1635;
        float _1645 = _1637 * 6.283185482025146484375;
        float _1647 = cos(_1645);
        float _1649 = _1641 * _1643;
        float _1651 = _1637 * 6.283185482025146484375;
        float _1653 = sin(_1651);
        float _1655 = _1647 * _1649;
        float _1657 = 1.0 / _1655;
        float _1659 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1661 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1659;
        float _1663 = 1.0 / _1661;
        float _1665 = _1653 * _1657;
        float _1667 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1669 = fma(_743, _1665, _1667);
        float _1671 = _1669 * _1663;
        float _1673 = precise::clamp(_1671, 0.0, 1.0);
        _1625 = _1673;
    }
    float _1675 = _1625;
    if (!_1613)
    {
        float _1677 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1679 = _1677 * 0.15915493667125701904296875;
        float _1681 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1683 = _1679 * 6.283185482025146484375;
        float _1685 = cos(_1683);
        float _1687 = _1681 * 0.15915493667125701904296875;
        float _1689 = _1679 * 6.283185482025146484375;
        float _1691 = sin(_1689);
        float _1693 = 1.0 / _1685;
        float _1695 = _1687 * 6.283185482025146484375;
        float _1697 = cos(_1695);
        float _1699 = _1691 * _1693;
        float _1701 = _1687 * 6.283185482025146484375;
        float _1703 = sin(_1701);
        float _1705 = _1697 * _1699;
        float _1707 = 1.0 / _1705;
        float _1709 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1711 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1709;
        float _1713 = 1.0 / _1711;
        float _1715 = _1703 * _1707;
        float _1717 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1719 = fma(_743, _1715, _1717);
        float _1721 = _1719 * _1713;
        float _1723 = precise::clamp(_1721, 0.0, 1.0);
        float _1725 = -_1723;
        float _1727 = _1725 + 1.0;
        _1621 = _1727;
    }
    float _1729 = _1621;
    if (!_1022)
    {
        int _1731 = _1064 << 4;
        int _1733 = _1731 + 2048;
        uint _1735 = uint(int(uint(_1733) >> uint(2)));
        uint _1737 = uint(int(uint(int(_1735)) >> uint(2)));
        int _1739 = int(_1735) & 3;
        float _1741 = (*spvDescriptorSet0.vp_c15)._m0[int(_1737)][_1739];
        int _1743 = int(_1735) + 1;
        uint _1745 = uint(int(uint(_1743) >> uint(2)));
        int _1747 = _1743 & 3;
        float _1749 = (*spvDescriptorSet0.vp_c15)._m0[int(_1745)][_1747];
        int _1751 = _1733 + 8;
        uint _1753 = uint(int(uint(_1751) >> uint(2)));
        uint _1755 = uint(int(uint(int(_1753)) >> uint(2)));
        int _1757 = int(_1753) & 3;
        float _1759 = (*spvDescriptorSet0.vp_c15)._m0[int(_1755)][_1757];
        int _1761 = int(_1753) + 1;
        uint _1763 = uint(int(uint(_1761) >> uint(2)));
        int _1765 = _1761 & 3;
        float _1767 = (*spvDescriptorSet0.vp_c15)._m0[int(_1763)][_1765];
        float _1769 = _797 * _1749;
        float _1771 = fma(_329, _1741, _1769);
        float _1773 = fma(_331, _1759, _1771);
        float _1775 = _1773 + _1767;
        float _1777 = precise::clamp(_1775, 0.0, 1.0);
        float _1779 = -_1777;
        float _1781 = _1779 + _1584;
        float _1783 = fma(_1781, 500.0, 1.5);
        float _1785 = exp2(_1783);
        float _1787 = 0.0 + _1785;
        float _1789 = precise::clamp(_1787, 0.0, 1.0);
        _835 = _1769;
        _1086 = as_type<float>(_1733);
        _1617 = _1789;
    }
    float _1791 = _835;
    float _1793 = _1086;
    float _1795 = _1617;
    float _1797 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1799 = _1422 + _1797;
    float _1801 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1803 = _1424 + _1801;
    float _1805 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1807 = _1426 + _1805;
    float _1809 = _1799 * _1799;
    float _1811 = fma(_1803, _1803, _1809);
    float _1813 = fma(_1807, _1807, _1811);
    float _1815 = rsqrt(_1813);
    float _1817 = sqrt(_1813);
    float _1819 = _1815 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1821 = _1803 * _1819;
    float _1823 = _1807 * _1819;
    float _1825 = _1821 * _1821;
    float _1827 = _1823 * _1823;
    float _1829 = _1825 + _1827;
    float _1831 = sqrt(_1829);
    bool _1833 = _1831 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1835 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1837 = _1831 + _1835;
    float _1839 = _1440;
    float _1841 = _1829;
    float _1843 = _1837;
    float _1845 = _1793;
    float _1847 = _1821;
    float _1849 = _1823;
    float _1851 = _1825;
    float _1853 = _1827;
    if (_1833)
    {
        float _1855 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1839 = _1855;
    }
    float _1857 = _1839;
    if (_1833)
    {
        float _1859 = rsqrt(_1829);
        _1841 = _1859;
    }
    float _1861 = _1841;
    if (_1833)
    {
        float _1863 = _1837 * _1857;
        _1843 = _1863;
    }
    float _1865 = _1843;
    if (_1833)
    {
        float _1867 = _1865 * 0.15915493667125701904296875;
        _1845 = _1867;
    }
    float _1869 = _1845;
    float _1871 = _1791;
    if (_1833)
    {
        float _1873 = _1869 * 6.283185482025146484375;
        float _1875 = sin(_1873);
        _1871 = _1875;
    }
    float _1877 = _1871;
    float _1879 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1881 = precise::max(0.0, _1879);
    float _1883 = _1857;
    float _1885 = _1881;
    if (_1833)
    {
        float _1887 = _1869 * 6.283185482025146484375;
        float _1889 = cos(_1887);
        _1883 = _1889;
    }
    float _1891 = _1883;
    float _1893 = -_1819;
    float _1895 = -_1881;
    float _1897 = fma(_1799, _1893, _1895);
    float _1899 = _1897;
    if (_1833)
    {
        float _1901 = _1897 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1885 = _1901;
    }
    float _1903 = _1885;
    float _1905 = _1877;
    float _1907 = _1903;
    if (_1833)
    {
        float _1909 = fma(_1877, _1903, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1905 = _1909;
    }
    float _1911 = _1905;
    float _1913 = _1911;
    if (_1833)
    {
        float _1915 = _1891 + (-1.0);
        _1907 = _1915;
    }
    float _1917 = _1907;
    float _1919 = _1917;
    if (_1833)
    {
        float _1921 = _1861 * _1911;
        _1913 = _1921;
    }
    float _1923 = _1913;
    if (_1833)
    {
        float _1925 = _1917 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1919 = _1925;
    }
    float _1927 = _1919;
    if (_1833)
    {
        float _1929 = _1821 * _1923;
        _1847 = _1929;
    }
    float _1931 = _1847;
    if (_1833)
    {
        float _1933 = _1823 * _1923;
        _1849 = _1933;
    }
    float _1935 = _1849;
    if (_1833)
    {
        float _1937 = fma(_1897, _1891, _1927);
        _1899 = _1937;
    }
    float _1939 = _1899;
    if (_1833)
    {
        float _1941 = _1931 * _1931;
        _1851 = _1941;
    }
    float _1943 = _1851;
    if (_1833)
    {
        float _1945 = _1935 * _1935;
        _1853 = _1945;
    }
    float _1947 = _1853;
    float _1949 = fma(_1939, _1939, _1943);
    float _1951 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1953 = fma(_1817, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1951);
    float _1955 = precise::clamp(_1953, 0.0, 1.0);
    float _1957 = _1949 + _1947;
    float _1959 = -_1955;
    float _1961 = _1959 + 1.0;
    float _1963 = rsqrt(_1957);
    float _1965 = abs(_1961);
    float _1967 = log2(_1965);
    float _1969 = _1963 * _1931;
    float _1971 = _1963 * _1939;
    float _1973 = _1963 * _1935;
    float _1975 = _1969 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1977 = -_1975;
    float _1979 = fma(_1971, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1977);
    float _1981 = -_1973;
    float _1983 = fma(_1981, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1979);
    float _1985 = _1967 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1987 = fma(_1983, -0.5, 0.5);
    float _1989 = exp2(_1985);
    float _1991 = fma(_1983, 0.5, 0.5);
    float _1993 = fma(_1991, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1995 = sqrt(_1987);
    float _1997 = fma(_1991, _1993, -0.212114393711090087890625);
    float _1999 = _1971 + 1.0;
    float _2001 = fma(_1991, _1997, 1.570728778839111328125);
    float _2003 = -_1971;
    float _2005 = fma(_1989, _1999, _2003);
    float _2007 = fma(_2005, 0.5, 0.5);
    float _2009 = _1995 * 0.636619746685028076171875;
    float _2011 = -_2001;
    float _2013 = fma(_2009, _2011, 1.0);
    float2 _5700 = float2(_2013, _2007);
    float3 _2017 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5700, float2(0.0), isnan(_5700)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5700, float2(0.0), isnan(_5700)), level(0.0)).xyz;
    float _2019 = _2017.x;
    float _2021 = _2017.y;
    float _2023 = _2017.z;
    float _2025 = abs(_743);
    float _2027 = log2(_2025);
    bool _2029 = _357 > 0.5;
    float _2031 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2033 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2035 = _2033 != 0;
    float _2037 = _1967 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2039 = -_747;
    int _2041 = _2029 ? as_type<int>(_2039) : as_type<int>(_747);
    float _2043 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2031);
    int _2045 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2047 = _2045 != 0;
    float _2049 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2051 = !_2035;
    float _2053 = _2051 ? _747 : as_type<float>(_2041);
    float _2055 = _747 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2057 = _165 > 0.5;
    float _2059 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2043);
    float _2061 = -_2053;
    float _2063 = _2061 + 0.5;
    float _2065 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2067 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2069 = -_349;
    float _2071 = _2069 + 1.0;
    float _2073 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2075 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2077 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2079 = -_775;
    int _2081 = _2057 ? as_type<int>(_2079) : as_type<int>(_775);
    float _2083 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2085 = _2063 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2087 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _2089 = !_2047;
    float _2091 = _2089 ? _775 : as_type<float>(_2081);
    float _2093 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2095 = _2067 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2097 = _2073 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2099 = _2075 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2101 = _2027 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2103 = _2085 * _2049;
    float _2105 = _2077 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2107 = _2083 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2109 = _2087 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2111 = _2091 + 0.5;
    float _2113 = _841 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_74.x = _2095;
    out.m_74.y = _2097;
    out.m_74.z = _2099;
    out.m_74.w = _2093;
    float _2115 = exp2(_2101);
    float _2117 = _2111 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2119 = _841 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_76.x = _2105;
    out.m_76.y = _2107;
    out.m_76.z = _2109;
    float _2121 = _841 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2123 = _2117 * _2065;
    float _2125 = -_793;
    float _2127 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2119);
    float _2129 = _775 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2131 = -_793;
    float _2133 = fma(_2131, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2113);
    float _2135 = -_793;
    float _2137 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2121);
    float _2139 = exp2(_2037);
    bool _2141 = _743 <= 8000.0;
    bool _2143 = isnan(_743);
    bool _2145 = _2141 || _2143;
    bool _2147 = isnan(8000.0);
    bool _2149 = _2145 || _2147;
    float _2151 = float(_2149);
    float _2153 = _815 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2155 = _815 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2157 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2133);
    float _2159 = fma(_2115, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2161 = precise::clamp(_2159, 0.0, 1.0);
    float _2163 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2153);
    float _2165 = _829 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2167 = _2055 * _2157;
    float _2169 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2155);
    float _2171 = _829 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2173 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2165);
    float _2175 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2163);
    float _2177 = _829 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2179 = _815 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2181 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2127);
    float _2183 = fma(_2129, _2175, _2167);
    float _2185 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2177);
    float _2187 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2059);
    float _2189 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2179);
    float _2191 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2137);
    float _2193 = fma(_2161, -2.0, 3.0);
    float _2195 = _2161 * _2161;
    out.gl_Position.x = _1524;
    out.gl_Position.y = _1526;
    out.gl_Position.z = _2187;
    out.gl_Position.w = _1498;
    float _2197 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2171);
    float _2199 = _2055 * _2181;
    float _2201 = _2195 * _2193;
    float _2203 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2169);
    float _2205 = _2187 + _1498;
    float _2207 = _2055 * _2191;
    float _2209 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2189);
    float _2211 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2197);
    float _2213 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2173);
    float _2215 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2185);
    float _2217 = fma(_2129, _2203, _2199);
    float _2219 = _2205 * 0.5;
    float _2221 = -_2201;
    float _2223 = _2221 + 1.0;
    float _2225 = -_2139;
    float _2227 = _2225 + 1.0;
    float _2229 = fma(_2129, _2209, _2207);
    float _2231 = _2213 + _2183;
    float _2233 = fma(_2223, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2201);
    float _2235 = _2223;
    float _2237 = _2219;
    if (!_1484)
    {
        _2235 = 1.0;
    }
    float _2239 = _2235;
    float _2241 = _2227 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2243 = _2239;
    float _2245 = _2241;
    if (_1484)
    {
        bool _2247 = _1590 >= _1542;
        bool _2249 = isnan(_1590);
        bool _2251 = _2247 || _2249;
        bool _2253 = isnan(_1542);
        bool _2255 = _2251 || _2253;
        float _2257 = float(_2255);
        _2243 = _2257;
    }
    float _2259 = _2243;
    float _2261 = _2151 * _2233;
    out.m_78.z = _2219;
    out.m_78.w = _1498;
    float _2263 = _2241 * _1592;
    float _2265 = -_2241;
    float _2267 = _2265 + 1.0;
    float _2269 = _2261 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2271 = _2259 * _1795;
    float _2273 = _1603 * _2263;
    float _2275 = _2211 + _2217;
    float _2277 = _2071 * _2269;
    float _2279 = precise::clamp(_2277, 0.0, 1.0);
    float _2281 = _2215 + _2229;
    out.m_80.x = _2123;
    out.m_80.y = _2103;
    bool _2283 = _1817 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2285 = isnan(_1817);
    bool _2287 = _2283 || _2285;
    bool _2289 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2291 = _2287 || _2289;
    float _2293 = -_2279;
    float _2295 = fma(_2293, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_82.x = _2275;
    out.m_82.y = _2231;
    out.m_82.z = _2281;
    float _2297 = -_2271;
    float _2299 = fma(_2297, _2295, 1.0);
    float _2301 = precise::clamp(_2299, 0.0, 1.0);
    float _2303 = _1603 * _2267;
    float _2305 = _2301 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2307 = _1675 * _1729;
    float _2309 = _2269;
    float _2311 = _2267;
    float _2313 = _2307;
    float _2315 = _2273;
    if (!_2291)
    {
        _2309 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2317 = _2309;
    out.m_84.x = _2305;
    float _2319 = _2307 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2321 = _2317;
    float _2323 = _2317;
    if (!_2291)
    {
        _2237 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2325 = _2237;
    float _2327 = _2325;
    float _2329 = _2325;
    if (!_2291)
    {
        _2311 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2331 = _2311;
    float _2333 = _2331;
    float _2335 = _2331;
    if (!_2291)
    {
        _2245 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2337 = _2245;
    float _2339 = _2337;
    float _2341 = _2337;
    if (!_2291)
    {
        _2313 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2343 = _2313;
    float _2345 = _2023 * _2263;
    float _2347 = fma(_2019, _2273, _1597);
    float _2349 = fma(_2021, _2273, _1599);
    float _2351 = _2343;
    float _2353 = _2343;
    if (!_2291)
    {
        _2315 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2355 = _2315;
    float _2357 = fma(_1603, _2345, _1601);
    out.m_86.x = _2347;
    out.m_86.y = _2349;
    out.m_86.z = _2357;
    out.m_86.w = _2303;
    bool _2359 = !_2291;
    float _2361 = _2355;
    float _2363 = _2355;
    if (!_2359)
    {
        bool _2365 = _1817 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2367 = isnan(_1817);
        bool _2369 = _2365 || _2367;
        bool _2371 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2373 = _2369 || _2371;
        if (!_2373)
        {
            float _2375 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2377 = _1817 + _2375;
            float _2379 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2381 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2379;
            float _2383 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2385 = _2383 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2387 = 1.0 / _2381;
            float _2389 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2391 = _2389 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2393 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2395 = _2393 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2397 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2399 = _2397 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2401 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2403 = _2401 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2405 = _2377 * _2387;
            float _2407 = precise::clamp(_2405, 0.0, 1.0);
            float _2409 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2411 = _2409 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2413 = fma(_2407, _2385, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2415 = fma(_2407, _2411, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2417 = fma(_2407, _2391, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2419 = fma(_2407, _2395, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2421 = fma(_2407, _2399, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2423 = fma(_2407, _2403, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2329 = _2417;
            _2341 = _2421;
            _2323 = _2413;
            _2335 = _2419;
            _2363 = _2415;
            _2353 = _2423;
            _2425 = true;
        }
        else
        {
            bool _2427 = _1817 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2429 = isnan(_1817);
            bool _2431 = _2427 || _2429;
            bool _2433 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2435 = _2431 || _2433;
            if (!_2435)
            {
                _2321 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2437 = _2321;
            _2323 = _2437;
            if (!_2435)
            {
                _2327 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2439 = _2327;
            _2329 = _2439;
            if (!_2435)
            {
                _2361 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2441 = _2361;
            _2363 = _2441;
            if (!_2435)
            {
                _2333 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2443 = _2333;
            _2335 = _2443;
            if (!_2435)
            {
                _2339 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2445 = _2339;
            _2341 = _2445;
            if (!_2435)
            {
                _2351 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2447 = _2351;
            bool _2449 = !_2435;
            _2353 = _2447;
            if (!_2449)
            {
                bool _2451 = _1817 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2453 = isnan(_1817);
                bool _2455 = _2451 || _2453;
                bool _2457 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2459 = _2455 || _2457;
                if (!_2459)
                {
                    float _2461 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2463 = _1817 + _2461;
                    float _2465 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2467 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2465;
                    float _2469 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2471 = _2469 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2473 = 1.0 / _2467;
                    float _2475 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2477 = _2475 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2479 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2481 = _2479 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2483 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2485 = _2483 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2487 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2489 = _2487 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2491 = _2463 * _2473;
                    float _2493 = precise::clamp(_2491, 0.0, 1.0);
                    float _2495 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2497 = _2495 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2499 = fma(_2493, _2471, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2501 = fma(_2493, _2497, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2503 = fma(_2493, _2477, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2505 = fma(_2493, _2481, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2507 = fma(_2493, _2485, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2509 = fma(_2493, _2489, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2329 = _2503;
                    _2341 = _2507;
                    _2323 = _2499;
                    _2335 = _2505;
                    _2363 = _2501;
                    _2353 = _2509;
                    _2425 = true;
                }
                else
                {
                    _2329 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2341 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2323 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2335 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2363 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2353 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2425 = false;
    float _2511 = _2329;
    float _2513 = _2341;
    float _2515 = _2323;
    float _2517 = _2335;
    float _2519 = _2363;
    float _2521 = _2353;
    float _2523 = _2319 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2525 = fma(_2231, -0.5, 0.5);
    float _2527 = precise::clamp(_2525, 0.0, 1.0);
    float _2529 = -_2511;
    float _2531 = _2529 + _2513;
    float _2533 = -_2515;
    float _2535 = _2533 + _2517;
    out.m_59.x = _2523;
    float _2537 = fma(_2527, _2531, _2511);
    float _2539 = -_2519;
    float _2541 = _2539 + _2521;
    float _2543 = fma(_2527, _2535, _2515);
    float _2545 = _2537 * 0.586610972881317138671875;
    bool _2547 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2549 = fma(_2527, _2541, _2519);
    out.m_88.x = 0.0;
    float _2551 = fma(_2543, 0.298911988735198974609375, _2545);
    bool _2553 = _1675 > 0.0;
    bool _2555 = isnan(_1675);
    bool _2557 = _2553 || _2555;
    bool _2559 = isnan(0.0);
    bool _2561 = _2557 || _2559;
    float _2563 = fma(_2549, 0.114477999508380889892578125, _2551);
    bool _2565 = _1729 <= 0.0;
    bool _2567 = !_2561;
    bool _2569 = _2565 || _2567;
    float _2571 = -_2563;
    float _2573 = _2543 + _2571;
    float _2575 = -_2563;
    float _2577 = _2537 + _2575;
    float _2579 = -_2563;
    float _2581 = _2549 + _2579;
    float _2583 = fma(_2573, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2563);
    float _2585 = fma(_2577, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2563);
    float _2587 = fma(_2581, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2563);
    bool _2589 = !_2547;
    if (!_2589)
    {
        float _2591 = -_1422;
        float _2593 = _2591 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2595 = -_1424;
        float _2597 = _2595 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2599 = -_1426;
        float _2601 = _2599 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2603 = _2593 * _2593;
        float _2605 = fma(_2597, _2597, _2603);
        float _2607 = fma(_2601, _2601, _2605);
        float _2609 = sqrt(_2607);
        float _2611 = rsqrt(_2607);
        float _2613 = -_2609;
        float _2615 = _2613 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2617 = _2615 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2619 = precise::clamp(_2617, 0.0, 1.0);
        float _2621 = _2597 * _2611;
        float _2623 = _2593 * _2611;
        float _2625 = abs(_2619);
        float _2627 = log2(_2625);
        float _2629 = _2601 * _2611;
        float _2631 = _2621 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2633 = _2231 * _2623;
        float _2635 = -_2623;
        float _2637 = -_2631;
        float _2639 = fma(_2635, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2637);
        float _2641 = fma(_2275, _2621, _2633);
        float _2643 = -_2629;
        float _2645 = fma(_2643, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2639);
        float _2647 = fma(_2281, _2629, _2641);
        float _2649 = precise::clamp(_2647, 0.0, 1.0);
        float _2651 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2653 = _2645 + _2651;
        float _2655 = _2627 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2657 = _2653 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2659 = precise::clamp(_2657, 0.0, 1.0);
        float _2661 = exp2(_2655);
        float _2663 = _2661 * _2659;
        float _2665 = _2649 * _2663;
        float _2667 = _2665 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2669 = _2665 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2671 = _2665 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _2667;
        out.m_88.y = _2669;
        out.m_88.z = _2671;
    }
    out.m_90.x = _2583;
    out.m_90.y = _2585;
    out.m_90.z = _2587;
    if (!_2569)
    {
        return out;
    }
    out.m_59.x = 0.0;
    float _2673 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2673;
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
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2425 = false;
    bool _301 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_56.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_59.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2730 = as_type<float>(_125);
        out.gl_Position.z = _2730;
    }
    if (!_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = in.m_61.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = 0.0;
    float _147 = _143;
    if (_139)
    {
        float _149 = float(_109);
        _145 = _149;
    }
    float _151 = _145;
    bool _153 = _143 >= _151;
    bool _155 = !_139;
    bool _157 = _153 || _155;
    if (_157)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _119;
    if (_157)
    {
        out.m_59.x = 0.0;
    }
    if (_157)
    {
        float _161 = _159 * 5.0;
        _127 = as_type<int>(_161);
    }
    int _163 = _127;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2799 = as_type<float>(_163);
        out.gl_Position.z = _2799;
    }
    if (_157)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _165 = in.m_63.x;
    float _167 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _169 = _143 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _171 = in.m_65.x;
    float _173 = in.m_65.y;
    float _175 = in.m_65.z;
    float _177 = _169 * _167;
    int _179 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _181 = _179 != 0;
    float _183 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[20].x, _177);
    int _185 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _187 = _185 != 0;
    int _189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _191 = _189 != 0;
    float _193 = _183 * 6.283185482025146484375;
    float _195 = floor(_183);
    float _197 = _173 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _199 = _173 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _201 = _193 * 0.15915493667125701904296875;
    float _203 = _173 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _205 = !_187;
    int _207 = _205 ? 0 : 1;
    float _209 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].x, _197);
    float _211 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].x, _199);
    float _213 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].x, _203);
    float _215 = _201 * 6.283185482025146484375;
    float _217 = cos(_215);
    bool _219 = !_181;
    int _221 = _219 ? 0 : 1;
    float _223 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[5].z, _211);
    bool _225 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _227 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[4].z, _209);
    int _229 = abs(_221);
    float _231 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[6].z, _213);
    float _233 = -_195;
    float _235 = _183 + _233;
    int _237 = abs(_207);
    bool _239 = !_191;
    int _241 = _239 ? 0 : 1;
    float _243 = float(_237);
    float _245 = -_235;
    float _247 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _249 = abs(_241);
    float _251 = fma(_217, 0.5, 0.5);
    float _253 = abs(_247);
    float _255 = _243 * _253;
    bool _257 = _235 < 0.5;
    float _259 = float(_257);
    float _261 = -_251;
    float _263 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _265 = float(_229);
    float _267 = -_259;
    float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _271 = float(_249);
    float _273 = fma(_265, _263, _255);
    float _275 = abs(_269);
    float _277 = fma(_271, _275, _273);
    bool _279 = !_225;
    float _281 = _223;
    float _283 = _231;
    float _299;
    if (!_279)
    {
        float _285 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _287 = _165 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _289 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _291 = _289 * _285;
        float _293 = floor(_291);
        float _295 = -_293;
        float _297 = _291 + _295;
        _299 = _297;
        _301 = true;
    }
    else
    {
        float _303 = float(_109);
        float _305 = 1.0 / _303;
        float _307 = _143 * _305;
        _299 = _307;
    }
    _301 = false;
    float _309 = _299;
    float _311 = in.m_56.x;
    float _313 = in.m_56.y;
    float _315 = in.m_56.z;
    float _317 = _313 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _319 = _313 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _321 = fma(_311, (*spvDescriptorSet0.vp_c10)._m0[4].x, _317);
    float _323 = fma(_311, (*spvDescriptorSet0.vp_c10)._m0[6].x, _319);
    float _325 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[4].z, _321);
    float _327 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[6].z, _323);
    float _329 = _325 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _331 = _327 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _333 = fma(_329, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _335 = fma(_331, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _337 = floor(_333);
    float _339 = floor(_335);
    float _341 = -_337;
    float _343 = _333 + _341;
    float _345 = -_339;
    float _347 = _335 + _345;
    float2 _3094 = float2(_343, _347);
    float _349 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3094, float2(0.0), isnan(_3094)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3094, float2(0.0), isnan(_3094)), level(0.0)).x;
    float _351 = in.m_63.z;
    float _353 = _165 * 2.0;
    float _355 = _313 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _357 = in.m_63.y;
    int _359 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _361 = _359 != 0;
    int _363 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _365 = _363 != 0;
    int _367 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _369 = _367 != 0;
    float _371 = floor(_353);
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _373;
    float _377 = fma(_311, (*spvDescriptorSet0.vp_c10)._m0[5].x, _355);
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _381 = _309 + _379;
    float _383 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[5].z, _377);
    float _385 = 1.0 / _375;
    float _387 = _383 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _389 = _371 > 0.0;
    float _391 = _351 * 2.0;
    bool _393 = _371 >= 0.0;
    bool _395 = isnan(_371);
    bool _397 = _393 || _395;
    bool _399 = isnan(0.0);
    bool _401 = _397 || _399;
    float _403 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _405 = log2(_403);
    float _407 = _165 + _351;
    float _409 = _357 * 2.0;
    float _411 = _165 + _357;
    float _413 = _357 + _351;
    float _415 = _351 + (-0.5);
    float _417 = _411 + (-1.0);
    float _419 = floor(_391);
    float _421 = floor(_409);
    float _423 = _413 + (-1.0);
    float _425 = _381 * _385;
    bool _427 = !_365;
    int _429 = _427 ? 0 : 1;
    float _431 = _405 * _143;
    float _433 = fma(_423, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _435 = abs(_429);
    bool _437 = _419 > 0.0;
    float _439 = _407 + (-1.0);
    float _441 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _443 = _401 ? 0 : 1;
    float _445 = exp2(_431);
    bool _447 = _419 >= 0.0;
    bool _449 = isnan(_419);
    bool _451 = _447 || _449;
    bool _453 = isnan(0.0);
    bool _455 = _451 || _453;
    float _457 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _459 = ~_443;
    int _461 = _459 + 1;
    int _463 = _461 + 1;
    int _465 = _455 ? 0 : 1;
    int _467 = _463;
    int _469 = 2;
    if (!_389)
    {
        int _471 = ~_443;
        int _473 = _471 + 1;
        _467 = _473;
    }
    int _475 = _467;
    bool _477 = _421 > 0.0;
    bool _479 = _421 >= 0.0;
    bool _481 = isnan(_421);
    bool _483 = _479 || _481;
    bool _485 = isnan(0.0);
    bool _487 = _483 || _485;
    float _489 = float(_435);
    int _491 = ~_465;
    int _493 = _491 + 1;
    int _495 = _493 + 1;
    float _497 = -_445;
    float _499 = _497 + 1.0;
    float _501 = float(_475);
    int _503 = _495;
    if (!_437)
    {
        int _505 = ~_465;
        int _507 = _505 + 1;
        _503 = _507;
    }
    int _509 = _503;
    bool _511 = !_361;
    int _513 = _511 ? 0 : 1;
    float _515 = _489 * _501;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _519 = 1.0 + _517;
    float _521 = in.m_67.x;
    float _523 = in.m_67.y;
    float _525 = in.m_67.z;
    int _527 = abs(_513);
    float _529 = _387 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _531 = 1.0 / _519;
    float _533 = float(_509);
    float _535 = _515 * (-2.0);
    float _537 = fma(_329, (*spvDescriptorSet0.vp_c8)._m0[11].x, _529);
    float _539 = float(_527);
    float _541 = _387 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _543 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _545 = isnan(1.0);
    bool _547 = _543 || _545;
    bool _549 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _551 = _547 || _549;
    float _553 = fma(_331, (*spvDescriptorSet0.vp_c8)._m0[11].z, _537);
    bool _555 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _557 = isnan(0.0);
    bool _559 = _555 || _557;
    bool _561 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _563 = _559 || _561;
    float _565 = fma(_329, (*spvDescriptorSet0.vp_c8)._m0[10].x, _541);
    float _567 = _539 * _533;
    float _569 = _553 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _571 = _487 ? 0 : 1;
    float _573 = fma(_331, (*spvDescriptorSet0.vp_c8)._m0[10].z, _565);
    float _575 = _563 ? _499 : 0.0;
    float _577 = 1.0 / _569;
    float _579 = _567 * (-2.0);
    int _581 = ~_571;
    int _583 = _581 + 1;
    int _585 = _583 + 1;
    float _587 = _573 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _589 = _585;
    if (!_477)
    {
        int _591 = ~_571;
        int _593 = _591 + 1;
        _589 = _593;
    }
    int _595 = _589;
    if (_551)
    {
        float _597 = _575 * _531;
        _147 = _597;
    }
    float _599 = _147;
    float _601 = fma(_535, _523, _523);
    float _603 = _165 + (-0.5);
    float _605 = fma(_579, _521, _521);
    float _607 = _357 + (-0.5);
    float _609 = fma(_433, _535, _433);
    float _611 = _587 + _569;
    float _613 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[196].x, _605);
    bool _615 = !_369;
    int _617 = _615 ? 0 : 1;
    float _619 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[196].y, _601);
    float _621 = _611 * _577;
    float _623 = _621 * 0.5;
    int _625 = abs(_617);
    float _627 = fma(_609, _599, _619);
    bool _629 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _631 = isnan(_309);
    bool _633 = _629 || _631;
    bool _635 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _637 = _633 || _635;
    float _639 = float(_637);
    float _641 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _643 = fma(_623, (*spvDescriptorSet0.vp_c8)._m0[30].w, _641);
    bool _645 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _647 = isnan(_309);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = fma(_441, _579, _441);
    float _659 = float(_625);
    float _661 = as_type<float>(int(gl_VertexIndex));
    float _663 = float(_595);
    float _665 = -_655;
    float _667 = _665 + 1.0;
    float _669 = in.m_72.x;
    float _671 = in.m_72.y;
    float _673 = _659 * _663;
    float _675 = _639 * _667;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _677;
    float _681 = fma(_657, _599, _613);
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _683;
    float _687 = _673 * (-2.0);
    float _689 = fma(_679, _425, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _691 = -_639;
    float _693 = _691 + 1.0;
    float _695 = fma(_685, _425, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _697 = fma(_687, _525, _525);
    float _699 = _689 * _675;
    float _701 = 1.0 / _643;
    float _703 = _695 * _675;
    float _705 = fma(_457, _687, _457);
    float _707 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[196].z, _697);
    float _709 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[143].x, _699);
    float _711 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[143].y, _703);
    float _713 = _627 * 0.15915493667125701904296875;
    float _715 = _681 * 0.15915493667125701904296875;
    float _717 = fma(_705, _599, _707);
    float _719 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[144].y, _711);
    float _721 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[144].x, _709);
    float _723 = _713 * 6.283185482025146484375;
    float _725 = sin(_723);
    int _727 = as_type<int>(_661) & 1;
    bool _729 = _727 != 0;
    int _731 = as_type<int>(_661) & 2;
    bool _733 = _731 != 0;
    float _735 = _717 * 0.15915493667125701904296875;
    float _737 = _719 * _671;
    float _739 = _721 * _669;
    float _741 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _743 = _701 * _741;
    bool _745 = !_733;
    float _747 = _745 ? (-0.5) : 0.5;
    float _749 = _277 * _737;
    float _751 = _713 * 6.283185482025146484375;
    float _753 = cos(_751);
    float _755 = _277 * _739;
    bool _757 = _743 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _759 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _747);
    float _761 = _749 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _763 = _755 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _765 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _767 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _769 = _715 * 6.283185482025146484375;
    float _771 = sin(_769);
    bool _773 = !_729;
    float _775 = _773 ? (-0.5) : 0.5;
    float _777 = _761 * _759;
    bool _779 = _743 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _781 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _775);
    if (!_757)
    {
        _469 = 1;
    }
    int _783 = _469;
    float _785 = _715 * 6.283185482025146484375;
    float _787 = cos(_785);
    float _789 = _763 * _781;
    float _791 = _735 * 6.283185482025146484375;
    float _793 = sin(_791);
    float _795 = _771 * _725;
    float _797 = _387 + _765;
    float _799 = _771 * _753;
    float _801 = _797 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _803 = _735 * 6.283185482025146484375;
    float _805 = cos(_803);
    float _807 = _787 * _753;
    float _809 = _787 * _725;
    float _811 = fma(_329, (*spvDescriptorSet0.vp_c15)._m0[126].x, _801);
    float _813 = fma(_331, (*spvDescriptorSet0.vp_c15)._m0[126].z, _811);
    float _815 = fma(_793, _807, _795);
    float _817 = fma(_793, _795, _807);
    bool _819 = !_757;
    int _821 = _819 ? 0 : 1;
    float _823 = -_809;
    float _825 = fma(_793, _799, _823);
    float _827 = -_799;
    float _829 = fma(_793, _809, _827);
    float _831 = _813 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    int _833 = _783;
    float _835 = _797;
    if (!_779)
    {
        _833 = _821;
    }
    int _837 = _833;
    float _839 = _797 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _841 = _787 * _805;
    float _843 = _771 * _805;
    float _845 = _753 * _805;
    float _847 = _725 * _805;
    float _849 = _841 * _777;
    float _851 = fma(_329, (*spvDescriptorSet0.vp_c15)._m0[127].x, _839);
    float _853 = -_777;
    float _855 = _793 * _853;
    float _857 = _843 * _777;
    float _859 = fma(_815, _789, _849);
    float _861 = fma(_331, (*spvDescriptorSet0.vp_c15)._m0[127].z, _851);
    float _863 = fma(_845, _789, _855);
    float _865 = fma(_825, _789, _857);
    float _867 = fma(_829, _767, _859);
    float _869 = trunc(_831);
    int _871 = int(_869);
    float _873 = fma(_847, _767, _863);
    float _875 = _861 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _877 = _867 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _879 = fma(_817, _767, _865);
    float _881 = _867 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _883 = _837 << 6;
    float _885 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[26].x, _877);
    float _887 = trunc(_875);
    int _889 = int(_887);
    float _891 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[24].x, _881);
    int _893 = _883 + 72;
    uint _896 = uint(int(uint(_893) >> uint(2)));
    uint _898 = uint(int(uint(int(_896)) >> uint(2)));
    int _900 = int(_896) & 3;
    float _902 = (*spvDescriptorSet0.vp_c15)._m0[int(_898)][_900];
    int _904 = int(_896) + 1;
    uint _906 = uint(int(uint(_904) >> uint(2)));
    int _908 = _904 & 3;
    float _910 = (*spvDescriptorSet0.vp_c15)._m0[int(_906)][_908];
    float _912 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[26].z, _885);
    float _914 = _867 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _916 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[24].z, _891);
    float _918 = _912 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _920 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _922 = _871 + _920;
    int _924 = _922 + 1;
    float _926 = _916 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _928 = _883 + 48;
    uint _930 = uint(int(uint(_928) >> uint(2)));
    uint _932 = uint(int(uint(int(_930)) >> uint(2)));
    int _934 = int(_930) & 3;
    float _936 = (*spvDescriptorSet0.vp_c15)._m0[int(_932)][_934];
    int _938 = int(_930) + 1;
    uint _940 = uint(int(uint(_938) >> uint(2)));
    int _942 = _938 & 3;
    float _944 = (*spvDescriptorSet0.vp_c15)._m0[int(_940)][_942];
    float _946 = _331 + _918;
    bool _948 = _924 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _950 = _329 + _926;
    float _952 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[25].x, _914);
    float _954 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _956 = _946 + _954;
    int _958 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _960 = _889 + _958;
    int _962 = _960 + 1;
    float _964 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _966 = _950 + _964;
    int _968 = _883 + 56;
    uint _970 = uint(int(uint(_968) >> uint(2)));
    uint _972 = uint(int(uint(int(_970)) >> uint(2)));
    int _974 = int(_970) & 3;
    float _976 = (*spvDescriptorSet0.vp_c15)._m0[int(_972)][_974];
    int _978 = int(_970) + 1;
    uint _980 = uint(int(uint(_978) >> uint(2)));
    int _982 = _978 & 3;
    float _984 = (*spvDescriptorSet0.vp_c15)._m0[int(_980)][_982];
    float _986 = _956 * _956;
    int _988 = _924 | _962;
    float _990 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[25].z, _952);
    float _992 = fma(_966, _966, _986);
    bool _994 = _988 < 0;
    bool _996 = _994 || _948;
    float _998 = _990 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1000 = _883 + 64;
    uint _1002 = uint(int(uint(_1000) >> uint(2)));
    uint _1004 = uint(int(uint(int(_1002)) >> uint(2)));
    int _1006 = int(_1002) & 3;
    float _1008 = (*spvDescriptorSet0.vp_c15)._m0[int(_1004)][_1006];
    int _1010 = int(_1002) + 1;
    uint _1012 = uint(int(uint(_1010) >> uint(2)));
    int _1014 = _1010 & 3;
    float _1016 = (*spvDescriptorSet0.vp_c15)._m0[int(_1012)][_1014];
    float _1018 = sqrt(_992);
    bool _1020 = _962 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1022 = _1020 || _996;
    float _1024 = _387 + _998;
    int _1026 = _883 + 96;
    uint _1028 = uint(int(uint(_1026) >> uint(2)));
    uint _1030 = uint(int(uint(int(_1028)) >> uint(2)));
    int _1032 = int(_1028) & 3;
    float _1034 = (*spvDescriptorSet0.vp_c15)._m0[int(_1030)][_1032];
    int _1036 = int(_1028) + 1;
    uint _1038 = uint(int(uint(_1036) >> uint(2)));
    int _1040 = _1036 & 3;
    float _1042 = (*spvDescriptorSet0.vp_c15)._m0[int(_1038)][_1040];
    int _1044 = _924;
    int _1046 = as_type<int>(_879);
    int _1048 = _962;
    float _1050 = _950;
    float _1052 = _946;
    float _1054 = as_type<float>(_837);
    float _1056 = as_type<float>(_883);
    float _1058 = _875;
    if (!_1022)
    {
        int _1060 = _962 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1062 = _1060 + _924;
        _1044 = _1062;
    }
    int _1064 = _1044;
    int _1066 = _883 + 104;
    uint _1068 = uint(int(uint(_1066) >> uint(2)));
    uint _1070 = uint(int(uint(int(_1068)) >> uint(2)));
    int _1072 = int(_1068) & 3;
    float _1074 = (*spvDescriptorSet0.vp_c15)._m0[int(_1070)][_1072];
    int _1076 = int(_1068) + 1;
    uint _1078 = uint(int(uint(_1076) >> uint(2)));
    int _1080 = _1076 & 3;
    float _1082 = (*spvDescriptorSet0.vp_c15)._m0[int(_1078)][_1080];
    bool _1084 = _1018 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1086 = as_type<float>(_1064);
    if (!_1022)
    {
        int _1088 = _1064 << 2;
        _1046 = _1088;
    }
    int _1090 = _1046;
    int _1092 = _1090;
    if (!_1022)
    {
        uint _1094 = uint(int(uint(_1064) >> uint(2)));
        _1048 = int(_1094);
    }
    int _1096 = _1048;
    float _1098 = as_type<float>(_1096);
    if (!_1022)
    {
        int _1100 = 12 & _1090;
        _1092 = _1100;
    }
    int _1102 = _1092;
    float _1104 = as_type<float>(_1102);
    if (!_1022)
    {
        int _1106 = _1096 << 4;
        int _1108 = _1106 + _1102;
        _1098 = as_type<float>(_1108);
    }
    float _1110 = _1098;
    if (!_1084)
    {
        _1104 = _950;
    }
    float _1112 = _1104;
    float _1114 = _1112;
    if (!_1084)
    {
        _1050 = _1024;
    }
    float _1116 = _1050;
    bool _1118 = !_1084;
    float _1120 = _1116;
    float _1122 = _976;
    if (!_1118)
    {
        float _1124 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1126 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1128 = _1018 + _1126;
        float _1130 = _1024 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1132 = rsqrt(_992);
        float _1134 = _1128 * _1124;
        float _1136 = _1134 * 0.15915493667125701904296875;
        float _1138 = _1136 * 6.283185482025146484375;
        float _1140 = cos(_1138);
        float _1142 = _1136 * 6.283185482025146484375;
        float _1144 = sin(_1142);
        float _1146 = _1140 + (-1.0);
        float _1148 = fma(_1144, _1130, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1150 = _1146 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1152 = _1132 * _1148;
        float _1154 = fma(_1024, _1140, _1150);
        float _1156 = fma(_966, _1152, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1158 = fma(_956, _1152, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1120 = _1154;
        _1114 = _1156;
        _1052 = _1158;
    }
    float _1160 = _1120;
    float _1162 = _1114;
    float _1164 = _1052;
    float _1166 = -_387;
    float _1168 = _1166 + _1160;
    int _1170 = _883 + 80;
    uint _1172 = uint(int(uint(_1170) >> uint(2)));
    uint _1174 = uint(int(uint(int(_1172)) >> uint(2)));
    int _1176 = int(_1172) & 3;
    float _1178 = (*spvDescriptorSet0.vp_c15)._m0[int(_1174)][_1176];
    int _1180 = int(_1172) + 1;
    uint _1182 = uint(int(uint(_1180) >> uint(2)));
    int _1184 = _1180 & 3;
    float _1186 = (*spvDescriptorSet0.vp_c15)._m0[int(_1182)][_1184];
    float _1188 = -_329;
    float _1190 = _1188 + _1162;
    float _1192 = -_331;
    float _1194 = _1192 + _1164;
    float _1196 = _1168 * _1168;
    float _1198 = _797 * _1042;
    float _1200 = _797 * _1016;
    float _1202 = fma(_1190, _1190, _1196);
    int _1204 = _883 + 88;
    uint _1206 = uint(int(uint(_1204) >> uint(2)));
    uint _1208 = uint(int(uint(int(_1206)) >> uint(2)));
    int _1210 = int(_1206) & 3;
    float _1212 = (*spvDescriptorSet0.vp_c15)._m0[int(_1208)][_1210];
    int _1214 = int(_1206) + 1;
    uint _1216 = uint(int(uint(_1214) >> uint(2)));
    int _1218 = _1214 & 3;
    float _1220 = (*spvDescriptorSet0.vp_c15)._m0[int(_1216)][_1218];
    float _1222 = fma(_329, _1034, _1198);
    float _1224 = _1196;
    float _1226 = _1160;
    float _1228 = _1164;
    float _1230 = _1162;
    if (!_1022)
    {
        float _1232 = floor(_831);
        _1224 = _1232;
    }
    float _1234 = _1224;
    float _1236 = fma(_1194, _1194, _1202);
    bool _1238 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1240 = isnan(0.5);
    bool _1242 = _1238 || _1240;
    bool _1244 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1246 = _1242 || _1244;
    float _1248 = fma(_331, _1074, _1222);
    float _1250 = _797 * _944;
    float _1252 = fma(_329, _1008, _1200);
    float _1254 = _1110;
    if (!_1022)
    {
        int _1256 = as_type<int>(_1110) + 400;
        uint _1258 = uint(int(uint(_1256) >> uint(2)));
        uint _1260 = uint(int(uint(int(_1258)) >> uint(2)));
        int _1262 = int(_1258) & 3;
        float _1264 = (*spvDescriptorSet0.vp_c15)._m0[int(_1260)][_1262];
        _1254 = _1264;
    }
    float _1266 = _1254;
    float _1268 = _1248 + _1082;
    float _1270 = sqrt(_1236);
    float _1272 = fma(_329, _936, _1250);
    float _1274 = fma(_331, _902, _1252);
    float _1276 = fma(_331, _976, _1272);
    float _1278 = _1274 + _910;
    float _1280 = _1222;
    if (!_1022)
    {
        float _1282 = floor(_875);
        _1280 = _1282;
    }
    float _1284 = _1280;
    float _1286 = _1276 + _984;
    bool _1288 = _1270 > 0.0;
    float _1290 = 1.0 / _1268;
    if (!_1288)
    {
        _1122 = _1162;
    }
    float _1292 = _1122;
    bool _1294 = !_1288;
    float _1296 = _1292;
    float _1298 = _1266;
    if (!_1294)
    {
        float _1300 = _223 * _223;
        float _1302 = rsqrt(_1236);
        float _1304 = fma(_227, _227, _1300);
        float _1306 = fma(_231, _231, _1304);
        float _1308 = sqrt(_1306);
        float _1310 = _1190 * _1302;
        float _1312 = _1168 * _1302;
        float _1314 = _1194 * _1302;
        bool _1316 = _1308 > 0.0;
        float _1318 = _1308;
        if (!_1316)
        {
            _1318 = _1162;
        }
        float _1320 = _1318;
        bool _1322 = !_1316;
        _1296 = _1320;
        if (!_1322)
        {
            float _1324 = rsqrt(_1306);
            float _1326 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1328 = _223 * _1324;
            float _1330 = _227 * _1324;
            float _1332 = _231 * _1324;
            float _1334 = _1312 * _1328;
            float _1336 = fma(_1310, _1330, _1334);
            float _1338 = _1326 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1340 = fma(_1314, _1332, _1336);
            float _1342 = _1340 * _1338;
            float _1344 = fma(_227, _1342, _1162);
            float _1346 = fma(_223, _1342, _1160);
            float _1348 = fma(_231, _1342, _1164);
            _1296 = _1344;
            _1226 = _1346;
            _1228 = _1348;
        }
    }
    float _1350 = _1296;
    float _1352 = _1226;
    float _1354 = _1228;
    float _1356 = _1350;
    float _1358 = _1352;
    if (_1246)
    {
        _281 = _1350;
    }
    float _1360 = _281;
    float _1362 = _1360;
    if (_1246)
    {
        _283 = _1352;
    }
    float _1364 = _283;
    float _1366 = _1364;
    if (_1246)
    {
        _1230 = _1354;
    }
    float _1368 = _1230;
    float _1370 = _1368;
    if (!_1246)
    {
        float _1372 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1374 = _387 + _1372;
        float _1376 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1378 = _329 + _1376;
        float _1380 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1382 = -_387;
        float _1384 = _1382 + _1352;
        float _1386 = _1374 * _1374;
        float _1388 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1390 = _331 + _1388;
        float _1392 = -_329;
        float _1394 = _1392 + _1350;
        float _1396 = fma(_1378, _1378, _1386);
        float _1398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1400 = fma(_1390, _1390, _1396);
        float _1402 = sqrt(_1400);
        float _1404 = _1380 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1406 = precise::min(_1402, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1408 = _1406 * _1398;
        float _1410 = _1404 * _1408;
        float _1412 = -_331;
        float _1414 = _1412 + _1354;
        float _1416 = fma(_1384, _1410, _387);
        float _1418 = fma(_1394, _1410, _329);
        float _1420 = fma(_1414, _1410, _331);
        _1366 = _1416;
        _1362 = _1418;
        _1370 = _1420;
        _1356 = _1394;
    }
    float _1422 = _1366;
    float _1424 = _1362;
    float _1426 = _1370;
    float _1428 = _1356;
    float _1430 = _1422 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1432 = _1286 * _1290;
    float _1434 = _1422 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1436 = _1422 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1438 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1430);
    float _1440 = _1278 * _1290;
    float _1442 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1434);
    bool _1444 = _1432 >= 0.0;
    float _1446 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1438);
    float _1448 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1436);
    float _1450 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1442);
    float _1452 = _1422 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1454 = _1446 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1456 = _1432 <= 1.0;
    bool _1458 = _1456 && _1444;
    float _1460 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1448);
    float _1462 = _1450 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1464 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1452);
    float _1466 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1468 = _1460 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1470 = _1440 >= 0.0;
    bool _1472 = _1470 && _1458;
    float _1474 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1464);
    float _1476 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1466);
    float _1478 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1480 = _1468 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1482 = _1440 <= 1.0;
    bool _1484 = _1482 && _1472;
    float _1486 = _1474 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1488 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1476);
    float _1490 = -_1480;
    float _1492 = fma(_1490, _1478, 1.0);
    float _1494 = _797 * _1186;
    float _1496 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1498 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1488);
    float _1500 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1502 = fma(_329, _1178, _1494);
    float _1504 = log2(_1492);
    float _1506 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1496);
    float _1508 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1500);
    float _1510 = fma(_331, _1212, _1502);
    if (_1484)
    {
        float _1512 = float(_837);
        _1054 = _1512;
    }
    float _1514 = _1054;
    float _1516 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1506);
    float _1518 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1508);
    float _1520 = _1510 + _1220;
    float _1522 = 1.0 / _1498;
    float _1524 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1516);
    float _1526 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1518);
    float _1528 = _1516;
    if (!_1022)
    {
        float _1530 = -_1284;
        float _1532 = _875 + _1530;
        _1056 = _1532;
    }
    float _1534 = _1056;
    if (!_1022)
    {
        float _1536 = -_1234;
        float _1538 = _831 + _1536;
        _1528 = _1538;
    }
    float _1540 = _1528;
    float _1542 = _1520 * _1290;
    float _1544 = _1428;
    if (!_1022)
    {
        float _1546 = rint(_1266);
        float _1548 = precise::max(_1546, 0.0);
        uint _1550 = uint(_1548);
        uint _1552 = clamp(_1550, 0u, 65535u);
        _1544 = as_type<float>(_1552);
    }
    float _1554 = _1544;
    float _1556 = _1504 * 0.693147182464599609375;
    float _1558 = _1556 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1560 = _1502;
    if (_1484)
    {
        float _1562 = rint(_1514);
        float _1564 = precise::max(_1562, 0.0);
        uint _1566 = uint(_1564);
        uint _1568 = clamp(_1566, 0u, 65535u);
        _1560 = as_type<float>(_1568);
    }
    float _1570 = _1560;
    float _1572 = _1524 * _1522;
    float _1574 = _1526 * _1522;
    float _1576 = fma(_1572, 0.5, 0.5);
    float _1578 = fma(_1574, -0.5, 0.5);
    float _1580 = _831;
    if (!_1022)
    {
        float3 _5048 = float3(_1540, _1534, float(as_type<int>(_1554)));
        float3 _5052 = select(_5048, float3(0.0), isnan(_5048));
        float _1582 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5052.xy, uint(rint(_5052.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5052.xy, uint(rint(_5052.z)), level(0.0)).x;
        _1580 = _1582;
    }
    float _1584 = _1580;
    float _1586 = _1514;
    if (_1484)
    {
        float3 _5067 = float3(_1432, _1440, float(as_type<int>(_1570)));
        float3 _5069 = select(_5067, float3(0.0), isnan(_5067));
        float _1588 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5069.xy, uint(rint(_5069.z)), _1542, level(0.0));
        _1586 = _1588;
    }
    float _1590 = _1586;
    float3 _5079 = float3(_1576, _1578, _1558);
    float _1592 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5079, float3(0.0), isnan(_5079)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5079, float3(0.0), isnan(_5079)), level(0.0)).x;
    float3 _5088 = float3(_1576, _1578, _1558);
    float4 _1595 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5088, float3(0.0), isnan(_5088)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5088, float3(0.0), isnan(_5088)), level(0.0)).xyzw;
    float _1597 = _1595.x;
    float _1599 = _1595.y;
    float _1601 = _1595.z;
    float _1603 = _1595.w;
    bool _1605 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1607 = isnan(0.5);
    bool _1609 = _1605 || _1607;
    bool _1611 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1613 = _1609 || _1611;
    if (_1022)
    {
        _1298 = 1.0;
    }
    float _1615 = _1298;
    float _1617 = _1615;
    if (_1613)
    {
        _1058 = 1.0;
    }
    float _1619 = _1058;
    float _1621 = _1619;
    if (_1613)
    {
        _1358 = 1.0;
    }
    float _1623 = _1358;
    float _1625 = _1623;
    if (!_1613)
    {
        float _1627 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1629 = _1627 * 0.15915493667125701904296875;
        float _1631 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1633 = _1629 * 6.283185482025146484375;
        float _1635 = cos(_1633);
        float _1637 = _1631 * 0.15915493667125701904296875;
        float _1639 = _1629 * 6.283185482025146484375;
        float _1641 = sin(_1639);
        float _1643 = 1.0 / _1635;
        float _1645 = _1637 * 6.283185482025146484375;
        float _1647 = cos(_1645);
        float _1649 = _1641 * _1643;
        float _1651 = _1637 * 6.283185482025146484375;
        float _1653 = sin(_1651);
        float _1655 = _1647 * _1649;
        float _1657 = 1.0 / _1655;
        float _1659 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1661 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1659;
        float _1663 = 1.0 / _1661;
        float _1665 = _1653 * _1657;
        float _1667 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1669 = fma(_743, _1665, _1667);
        float _1671 = _1669 * _1663;
        float _1673 = precise::clamp(_1671, 0.0, 1.0);
        _1625 = _1673;
    }
    float _1675 = _1625;
    if (!_1613)
    {
        float _1677 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1679 = _1677 * 0.15915493667125701904296875;
        float _1681 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1683 = _1679 * 6.283185482025146484375;
        float _1685 = cos(_1683);
        float _1687 = _1681 * 0.15915493667125701904296875;
        float _1689 = _1679 * 6.283185482025146484375;
        float _1691 = sin(_1689);
        float _1693 = 1.0 / _1685;
        float _1695 = _1687 * 6.283185482025146484375;
        float _1697 = cos(_1695);
        float _1699 = _1691 * _1693;
        float _1701 = _1687 * 6.283185482025146484375;
        float _1703 = sin(_1701);
        float _1705 = _1697 * _1699;
        float _1707 = 1.0 / _1705;
        float _1709 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1711 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1709;
        float _1713 = 1.0 / _1711;
        float _1715 = _1703 * _1707;
        float _1717 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1719 = fma(_743, _1715, _1717);
        float _1721 = _1719 * _1713;
        float _1723 = precise::clamp(_1721, 0.0, 1.0);
        float _1725 = -_1723;
        float _1727 = _1725 + 1.0;
        _1621 = _1727;
    }
    float _1729 = _1621;
    if (!_1022)
    {
        int _1731 = _1064 << 4;
        int _1733 = _1731 + 2048;
        uint _1735 = uint(int(uint(_1733) >> uint(2)));
        uint _1737 = uint(int(uint(int(_1735)) >> uint(2)));
        int _1739 = int(_1735) & 3;
        float _1741 = (*spvDescriptorSet0.vp_c15)._m0[int(_1737)][_1739];
        int _1743 = int(_1735) + 1;
        uint _1745 = uint(int(uint(_1743) >> uint(2)));
        int _1747 = _1743 & 3;
        float _1749 = (*spvDescriptorSet0.vp_c15)._m0[int(_1745)][_1747];
        int _1751 = _1733 + 8;
        uint _1753 = uint(int(uint(_1751) >> uint(2)));
        uint _1755 = uint(int(uint(int(_1753)) >> uint(2)));
        int _1757 = int(_1753) & 3;
        float _1759 = (*spvDescriptorSet0.vp_c15)._m0[int(_1755)][_1757];
        int _1761 = int(_1753) + 1;
        uint _1763 = uint(int(uint(_1761) >> uint(2)));
        int _1765 = _1761 & 3;
        float _1767 = (*spvDescriptorSet0.vp_c15)._m0[int(_1763)][_1765];
        float _1769 = _797 * _1749;
        float _1771 = fma(_329, _1741, _1769);
        float _1773 = fma(_331, _1759, _1771);
        float _1775 = _1773 + _1767;
        float _1777 = precise::clamp(_1775, 0.0, 1.0);
        float _1779 = -_1777;
        float _1781 = _1779 + _1584;
        float _1783 = fma(_1781, 500.0, 1.5);
        float _1785 = exp2(_1783);
        float _1787 = 0.0 + _1785;
        float _1789 = precise::clamp(_1787, 0.0, 1.0);
        _835 = _1769;
        _1086 = as_type<float>(_1733);
        _1617 = _1789;
    }
    float _1791 = _835;
    float _1793 = _1086;
    float _1795 = _1617;
    float _1797 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1799 = _1422 + _1797;
    float _1801 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1803 = _1424 + _1801;
    float _1805 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1807 = _1426 + _1805;
    float _1809 = _1799 * _1799;
    float _1811 = fma(_1803, _1803, _1809);
    float _1813 = fma(_1807, _1807, _1811);
    float _1815 = rsqrt(_1813);
    float _1817 = sqrt(_1813);
    float _1819 = _1815 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1821 = _1803 * _1819;
    float _1823 = _1807 * _1819;
    float _1825 = _1821 * _1821;
    float _1827 = _1823 * _1823;
    float _1829 = _1825 + _1827;
    float _1831 = sqrt(_1829);
    bool _1833 = _1831 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1835 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1837 = _1831 + _1835;
    float _1839 = _1440;
    float _1841 = _1829;
    float _1843 = _1837;
    float _1845 = _1793;
    float _1847 = _1821;
    float _1849 = _1823;
    float _1851 = _1825;
    float _1853 = _1827;
    if (_1833)
    {
        float _1855 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1839 = _1855;
    }
    float _1857 = _1839;
    if (_1833)
    {
        float _1859 = rsqrt(_1829);
        _1841 = _1859;
    }
    float _1861 = _1841;
    if (_1833)
    {
        float _1863 = _1837 * _1857;
        _1843 = _1863;
    }
    float _1865 = _1843;
    if (_1833)
    {
        float _1867 = _1865 * 0.15915493667125701904296875;
        _1845 = _1867;
    }
    float _1869 = _1845;
    float _1871 = _1791;
    if (_1833)
    {
        float _1873 = _1869 * 6.283185482025146484375;
        float _1875 = sin(_1873);
        _1871 = _1875;
    }
    float _1877 = _1871;
    float _1879 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1881 = precise::max(0.0, _1879);
    float _1883 = _1857;
    float _1885 = _1881;
    if (_1833)
    {
        float _1887 = _1869 * 6.283185482025146484375;
        float _1889 = cos(_1887);
        _1883 = _1889;
    }
    float _1891 = _1883;
    float _1893 = -_1819;
    float _1895 = -_1881;
    float _1897 = fma(_1799, _1893, _1895);
    float _1899 = _1897;
    if (_1833)
    {
        float _1901 = _1897 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1885 = _1901;
    }
    float _1903 = _1885;
    float _1905 = _1877;
    float _1907 = _1903;
    if (_1833)
    {
        float _1909 = fma(_1877, _1903, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1905 = _1909;
    }
    float _1911 = _1905;
    float _1913 = _1911;
    if (_1833)
    {
        float _1915 = _1891 + (-1.0);
        _1907 = _1915;
    }
    float _1917 = _1907;
    float _1919 = _1917;
    if (_1833)
    {
        float _1921 = _1861 * _1911;
        _1913 = _1921;
    }
    float _1923 = _1913;
    if (_1833)
    {
        float _1925 = _1917 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1919 = _1925;
    }
    float _1927 = _1919;
    if (_1833)
    {
        float _1929 = _1821 * _1923;
        _1847 = _1929;
    }
    float _1931 = _1847;
    if (_1833)
    {
        float _1933 = _1823 * _1923;
        _1849 = _1933;
    }
    float _1935 = _1849;
    if (_1833)
    {
        float _1937 = fma(_1897, _1891, _1927);
        _1899 = _1937;
    }
    float _1939 = _1899;
    if (_1833)
    {
        float _1941 = _1931 * _1931;
        _1851 = _1941;
    }
    float _1943 = _1851;
    if (_1833)
    {
        float _1945 = _1935 * _1935;
        _1853 = _1945;
    }
    float _1947 = _1853;
    float _1949 = fma(_1939, _1939, _1943);
    float _1951 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1953 = fma(_1817, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1951);
    float _1955 = precise::clamp(_1953, 0.0, 1.0);
    float _1957 = _1949 + _1947;
    float _1959 = -_1955;
    float _1961 = _1959 + 1.0;
    float _1963 = rsqrt(_1957);
    float _1965 = abs(_1961);
    float _1967 = log2(_1965);
    float _1969 = _1963 * _1931;
    float _1971 = _1963 * _1939;
    float _1973 = _1963 * _1935;
    float _1975 = _1969 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1977 = -_1975;
    float _1979 = fma(_1971, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1977);
    float _1981 = -_1973;
    float _1983 = fma(_1981, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1979);
    float _1985 = _1967 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1987 = fma(_1983, -0.5, 0.5);
    float _1989 = exp2(_1985);
    float _1991 = fma(_1983, 0.5, 0.5);
    float _1993 = fma(_1991, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1995 = sqrt(_1987);
    float _1997 = fma(_1991, _1993, -0.212114393711090087890625);
    float _1999 = _1971 + 1.0;
    float _2001 = fma(_1991, _1997, 1.570728778839111328125);
    float _2003 = -_1971;
    float _2005 = fma(_1989, _1999, _2003);
    float _2007 = fma(_2005, 0.5, 0.5);
    float _2009 = _1995 * 0.636619746685028076171875;
    float _2011 = -_2001;
    float _2013 = fma(_2009, _2011, 1.0);
    float2 _5700 = float2(_2013, _2007);
    float3 _2017 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5700, float2(0.0), isnan(_5700)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5700, float2(0.0), isnan(_5700)), level(0.0)).xyz;
    float _2019 = _2017.x;
    float _2021 = _2017.y;
    float _2023 = _2017.z;
    float _2025 = abs(_743);
    float _2027 = log2(_2025);
    bool _2029 = _357 > 0.5;
    float _2031 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2033 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2035 = _2033 != 0;
    float _2037 = _1967 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2039 = -_747;
    int _2041 = _2029 ? as_type<int>(_2039) : as_type<int>(_747);
    float _2043 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2031);
    int _2045 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2047 = _2045 != 0;
    float _2049 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2051 = !_2035;
    float _2053 = _2051 ? _747 : as_type<float>(_2041);
    float _2055 = _747 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2057 = _165 > 0.5;
    float _2059 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2043);
    float _2061 = -_2053;
    float _2063 = _2061 + 0.5;
    float _2065 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2067 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2069 = -_349;
    float _2071 = _2069 + 1.0;
    float _2073 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2075 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2077 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2079 = -_775;
    int _2081 = _2057 ? as_type<int>(_2079) : as_type<int>(_775);
    float _2083 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2085 = _2063 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2087 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _2089 = !_2047;
    float _2091 = _2089 ? _775 : as_type<float>(_2081);
    float _2093 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2095 = _2067 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2097 = _2073 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2099 = _2075 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2101 = _2027 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2103 = _2085 * _2049;
    float _2105 = _2077 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2107 = _2083 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2109 = _2087 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2111 = _2091 + 0.5;
    float _2113 = _841 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_74.x = _2095;
    out.m_74.y = _2097;
    out.m_74.z = _2099;
    out.m_74.w = _2093;
    float _2115 = exp2(_2101);
    float _2117 = _2111 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2119 = _841 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_76.x = _2105;
    out.m_76.y = _2107;
    out.m_76.z = _2109;
    float _2121 = _841 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2123 = _2117 * _2065;
    float _2125 = -_793;
    float _2127 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2119);
    float _2129 = _775 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2131 = -_793;
    float _2133 = fma(_2131, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2113);
    float _2135 = -_793;
    float _2137 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2121);
    float _2139 = exp2(_2037);
    bool _2141 = _743 <= 8000.0;
    bool _2143 = isnan(_743);
    bool _2145 = _2141 || _2143;
    bool _2147 = isnan(8000.0);
    bool _2149 = _2145 || _2147;
    float _2151 = float(_2149);
    float _2153 = _815 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2155 = _815 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2157 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2133);
    float _2159 = fma(_2115, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2161 = precise::clamp(_2159, 0.0, 1.0);
    float _2163 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2153);
    float _2165 = _829 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2167 = _2055 * _2157;
    float _2169 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2155);
    float _2171 = _829 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2173 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2165);
    float _2175 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2163);
    float _2177 = _829 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2179 = _815 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2181 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2127);
    float _2183 = fma(_2129, _2175, _2167);
    float _2185 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2177);
    float _2187 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2059);
    float _2189 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2179);
    float _2191 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2137);
    float _2193 = fma(_2161, -2.0, 3.0);
    float _2195 = _2161 * _2161;
    out.gl_Position.x = _1524;
    out.gl_Position.y = _1526;
    out.gl_Position.z = _2187;
    out.gl_Position.w = _1498;
    float _2197 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2171);
    float _2199 = _2055 * _2181;
    float _2201 = _2195 * _2193;
    float _2203 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2169);
    float _2205 = _2187 + _1498;
    float _2207 = _2055 * _2191;
    float _2209 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2189);
    float _2211 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2197);
    float _2213 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2173);
    float _2215 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2185);
    float _2217 = fma(_2129, _2203, _2199);
    float _2219 = _2205 * 0.5;
    float _2221 = -_2201;
    float _2223 = _2221 + 1.0;
    float _2225 = -_2139;
    float _2227 = _2225 + 1.0;
    float _2229 = fma(_2129, _2209, _2207);
    float _2231 = _2213 + _2183;
    float _2233 = fma(_2223, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2201);
    float _2235 = _2223;
    float _2237 = _2219;
    if (!_1484)
    {
        _2235 = 1.0;
    }
    float _2239 = _2235;
    float _2241 = _2227 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2243 = _2239;
    float _2245 = _2241;
    if (_1484)
    {
        bool _2247 = _1590 >= _1542;
        bool _2249 = isnan(_1590);
        bool _2251 = _2247 || _2249;
        bool _2253 = isnan(_1542);
        bool _2255 = _2251 || _2253;
        float _2257 = float(_2255);
        _2243 = _2257;
    }
    float _2259 = _2243;
    float _2261 = _2151 * _2233;
    out.m_78.z = _2219;
    out.m_78.w = _1498;
    float _2263 = _2241 * _1592;
    float _2265 = -_2241;
    float _2267 = _2265 + 1.0;
    float _2269 = _2261 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2271 = _2259 * _1795;
    float _2273 = _1603 * _2263;
    float _2275 = _2211 + _2217;
    float _2277 = _2071 * _2269;
    float _2279 = precise::clamp(_2277, 0.0, 1.0);
    float _2281 = _2215 + _2229;
    out.m_80.x = _2123;
    out.m_80.y = _2103;
    bool _2283 = _1817 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2285 = isnan(_1817);
    bool _2287 = _2283 || _2285;
    bool _2289 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2291 = _2287 || _2289;
    float _2293 = -_2279;
    float _2295 = fma(_2293, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_82.x = _2275;
    out.m_82.y = _2231;
    out.m_82.z = _2281;
    float _2297 = -_2271;
    float _2299 = fma(_2297, _2295, 1.0);
    float _2301 = precise::clamp(_2299, 0.0, 1.0);
    float _2303 = _1603 * _2267;
    float _2305 = _2301 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2307 = _1675 * _1729;
    float _2309 = _2269;
    float _2311 = _2267;
    float _2313 = _2307;
    float _2315 = _2273;
    if (!_2291)
    {
        _2309 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2317 = _2309;
    out.m_84.x = _2305;
    float _2319 = _2307 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2321 = _2317;
    float _2323 = _2317;
    if (!_2291)
    {
        _2237 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2325 = _2237;
    float _2327 = _2325;
    float _2329 = _2325;
    if (!_2291)
    {
        _2311 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2331 = _2311;
    float _2333 = _2331;
    float _2335 = _2331;
    if (!_2291)
    {
        _2245 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2337 = _2245;
    float _2339 = _2337;
    float _2341 = _2337;
    if (!_2291)
    {
        _2313 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2343 = _2313;
    float _2345 = _2023 * _2263;
    float _2347 = fma(_2019, _2273, _1597);
    float _2349 = fma(_2021, _2273, _1599);
    float _2351 = _2343;
    float _2353 = _2343;
    if (!_2291)
    {
        _2315 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2355 = _2315;
    float _2357 = fma(_1603, _2345, _1601);
    out.m_86.x = _2347;
    out.m_86.y = _2349;
    out.m_86.z = _2357;
    out.m_86.w = _2303;
    bool _2359 = !_2291;
    float _2361 = _2355;
    float _2363 = _2355;
    if (!_2359)
    {
        bool _2365 = _1817 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2367 = isnan(_1817);
        bool _2369 = _2365 || _2367;
        bool _2371 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2373 = _2369 || _2371;
        if (!_2373)
        {
            float _2375 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2377 = _1817 + _2375;
            float _2379 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2381 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2379;
            float _2383 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2385 = _2383 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2387 = 1.0 / _2381;
            float _2389 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2391 = _2389 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2393 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2395 = _2393 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2397 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2399 = _2397 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2401 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2403 = _2401 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2405 = _2377 * _2387;
            float _2407 = precise::clamp(_2405, 0.0, 1.0);
            float _2409 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2411 = _2409 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2413 = fma(_2407, _2385, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2415 = fma(_2407, _2411, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2417 = fma(_2407, _2391, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2419 = fma(_2407, _2395, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2421 = fma(_2407, _2399, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2423 = fma(_2407, _2403, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2329 = _2417;
            _2341 = _2421;
            _2323 = _2413;
            _2335 = _2419;
            _2363 = _2415;
            _2353 = _2423;
            _2425 = true;
        }
        else
        {
            bool _2427 = _1817 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2429 = isnan(_1817);
            bool _2431 = _2427 || _2429;
            bool _2433 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2435 = _2431 || _2433;
            if (!_2435)
            {
                _2321 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2437 = _2321;
            _2323 = _2437;
            if (!_2435)
            {
                _2327 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2439 = _2327;
            _2329 = _2439;
            if (!_2435)
            {
                _2361 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2441 = _2361;
            _2363 = _2441;
            if (!_2435)
            {
                _2333 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2443 = _2333;
            _2335 = _2443;
            if (!_2435)
            {
                _2339 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2445 = _2339;
            _2341 = _2445;
            if (!_2435)
            {
                _2351 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2447 = _2351;
            bool _2449 = !_2435;
            _2353 = _2447;
            if (!_2449)
            {
                bool _2451 = _1817 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2453 = isnan(_1817);
                bool _2455 = _2451 || _2453;
                bool _2457 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2459 = _2455 || _2457;
                if (!_2459)
                {
                    float _2461 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2463 = _1817 + _2461;
                    float _2465 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2467 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2465;
                    float _2469 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2471 = _2469 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2473 = 1.0 / _2467;
                    float _2475 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2477 = _2475 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2479 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2481 = _2479 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2483 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2485 = _2483 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2487 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2489 = _2487 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2491 = _2463 * _2473;
                    float _2493 = precise::clamp(_2491, 0.0, 1.0);
                    float _2495 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2497 = _2495 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2499 = fma(_2493, _2471, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2501 = fma(_2493, _2497, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2503 = fma(_2493, _2477, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2505 = fma(_2493, _2481, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2507 = fma(_2493, _2485, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2509 = fma(_2493, _2489, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2329 = _2503;
                    _2341 = _2507;
                    _2323 = _2499;
                    _2335 = _2505;
                    _2363 = _2501;
                    _2353 = _2509;
                    _2425 = true;
                }
                else
                {
                    _2329 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2341 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2323 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2335 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2363 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2353 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2425 = false;
    float _2511 = _2329;
    float _2513 = _2341;
    float _2515 = _2323;
    float _2517 = _2335;
    float _2519 = _2363;
    float _2521 = _2353;
    float _2523 = _2319 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2525 = fma(_2231, -0.5, 0.5);
    float _2527 = precise::clamp(_2525, 0.0, 1.0);
    float _2529 = -_2511;
    float _2531 = _2529 + _2513;
    float _2533 = -_2515;
    float _2535 = _2533 + _2517;
    out.m_59.x = _2523;
    float _2537 = fma(_2527, _2531, _2511);
    float _2539 = -_2519;
    float _2541 = _2539 + _2521;
    float _2543 = fma(_2527, _2535, _2515);
    float _2545 = _2537 * 0.586610972881317138671875;
    bool _2547 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2549 = fma(_2527, _2541, _2519);
    out.m_88.x = 0.0;
    float _2551 = fma(_2543, 0.298911988735198974609375, _2545);
    bool _2553 = _1675 > 0.0;
    bool _2555 = isnan(_1675);
    bool _2557 = _2553 || _2555;
    bool _2559 = isnan(0.0);
    bool _2561 = _2557 || _2559;
    float _2563 = fma(_2549, 0.114477999508380889892578125, _2551);
    bool _2565 = _1729 <= 0.0;
    bool _2567 = !_2561;
    bool _2569 = _2565 || _2567;
    float _2571 = -_2563;
    float _2573 = _2543 + _2571;
    float _2575 = -_2563;
    float _2577 = _2537 + _2575;
    float _2579 = -_2563;
    float _2581 = _2549 + _2579;
    float _2583 = fma(_2573, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2563);
    float _2585 = fma(_2577, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2563);
    float _2587 = fma(_2581, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2563);
    bool _2589 = !_2547;
    if (!_2589)
    {
        float _2591 = -_1422;
        float _2593 = _2591 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2595 = -_1424;
        float _2597 = _2595 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2599 = -_1426;
        float _2601 = _2599 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2603 = _2593 * _2593;
        float _2605 = fma(_2597, _2597, _2603);
        float _2607 = fma(_2601, _2601, _2605);
        float _2609 = sqrt(_2607);
        float _2611 = rsqrt(_2607);
        float _2613 = -_2609;
        float _2615 = _2613 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2617 = _2615 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2619 = precise::clamp(_2617, 0.0, 1.0);
        float _2621 = _2597 * _2611;
        float _2623 = _2593 * _2611;
        float _2625 = abs(_2619);
        float _2627 = log2(_2625);
        float _2629 = _2601 * _2611;
        float _2631 = _2621 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2633 = _2231 * _2623;
        float _2635 = -_2623;
        float _2637 = -_2631;
        float _2639 = fma(_2635, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2637);
        float _2641 = fma(_2275, _2621, _2633);
        float _2643 = -_2629;
        float _2645 = fma(_2643, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2639);
        float _2647 = fma(_2281, _2629, _2641);
        float _2649 = precise::clamp(_2647, 0.0, 1.0);
        float _2651 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2653 = _2645 + _2651;
        float _2655 = _2627 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2657 = _2653 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2659 = precise::clamp(_2657, 0.0, 1.0);
        float _2661 = exp2(_2655);
        float _2663 = _2661 * _2659;
        float _2665 = _2649 * _2663;
        float _2667 = _2665 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2669 = _2665 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2671 = _2665 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _2667;
        out.m_88.y = _2669;
        out.m_88.z = _2671;
    }
    out.m_90.x = _2583;
    out.m_90.y = _2585;
    out.m_90.z = _2587;
    if (!_2569)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_59.x = 0.0;
    float _2673 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2673;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

