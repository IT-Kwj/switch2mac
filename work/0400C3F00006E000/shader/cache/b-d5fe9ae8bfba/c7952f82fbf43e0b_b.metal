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
    texture2d<float> vp_t_tcb_28 [[id(6)]];
    sampler vp_t_tcb_28Smplr [[id(7)]];
    texture2d_array<float> vp_t_tcb_14 [[id(8)]];
    sampler vp_t_tcb_14Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_24 [[id(10)]];
    sampler vp_t_tcb_24Smplr [[id(11)]];
    texture2d_array<float> vp_t_tcb_16 [[id(12)]];
    sampler vp_t_tcb_16Smplr [[id(13)]];
    texture3d<float> vp_t_tcb_32 [[id(14)]];
    sampler vp_t_tcb_32Smplr [[id(15)]];
    texture3d<float> vp_t_tcb_30 [[id(16)]];
    sampler vp_t_tcb_30Smplr [[id(17)]];
    texture2d<float> vp_t_tcb_1C [[id(18)]];
    sampler vp_t_tcb_1CSmplr [[id(19)]];
    sampler vp_t_tcb_28Smplr_w [[id(20)]];
    sampler vp_t_tcb_14Smplr_w [[id(21)]];
    sampler vp_t_tcb_24Smplr_w [[id(22)]];
    sampler vp_t_tcb_32Smplr_w [[id(23)]];
    sampler vp_t_tcb_30Smplr_w [[id(24)]];
    sampler vp_t_tcb_1CSmplr_w [[id(25)]];
    constant dm_border_t* dm_border [[id(26)]];
};

struct main0_out
{
    float4 m_80 [[user(locn0)]];
    float4 m_76 [[user(locn1)]];
    float4 m_78 [[user(locn2)]];
    float4 m_84 [[user(locn3)]];
    float4 m_92 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_82 [[user(locn6)]];
    float4 m_90 [[user(locn7)]];
    float4 m_86 [[user(locn8)]];
    float4 m_88 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_67 [[attribute(0)]];
    float4 m_69 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_74 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2473 = false;
    bool _383 = false;
    bool _189 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_58.w;
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
        out.m_61.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2771 = as_type<float>(_127);
        out.gl_Position.z = _2771;
    }
    if (!_115)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = in.m_63.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = _143;
    if (_139)
    {
        float _147 = float(_111);
        _121 = _147;
    }
    float _149 = _121;
    bool _151 = _143 >= _149;
    bool _153 = !_139;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_61.x = 0.0;
    }
    int _161 = 0;
    if (_155)
    {
        float _163 = _159 * 5.0;
        _161 = as_type<int>(_163);
    }
    int _165 = _161;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2841 = as_type<float>(_165);
        out.gl_Position.z = _2841;
    }
    if (_155)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _167 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _169 = !_167;
    float _187;
    if (!_169)
    {
        float _171 = in.m_65.x;
        float _173 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _175 = _171 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _177 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _179 = _177 * _173;
        float _181 = floor(_179);
        float _183 = -_181;
        float _185 = _179 + _183;
        _187 = _185;
        _189 = true;
    }
    else
    {
        float _191 = float(_111);
        float _193 = 1.0 / _191;
        float _195 = _143 * _193;
        _187 = _195;
    }
    _189 = false;
    float _197 = _187;
    float _199 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _201 = _197 + _199;
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _205 = _197 + _203;
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _209 = _197 + _207;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _213 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _211;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _217 = _215 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _221 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _219;
    bool _223 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _225 = isnan(_197);
    bool _227 = _223 || _225;
    bool _229 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _231 = _227 || _229;
    float _233 = float(_231);
    float _235 = 1.0 / _213;
    bool _237 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _239 = 1.0 / _221;
    float _241 = 1.0 / _217;
    float _243 = _201 * _235;
    bool _245 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _247 = isnan(_197);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = -_233;
    float _259 = _257 + 1.0;
    float _261 = _255 * _259;
    float _263 = _205 * _239;
    bool _265 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _267 = isnan(_197);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    float _277 = -_255;
    float _279 = _277 + 1.0;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _283 = _281 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _285 = _275 * _279;
    float _287 = -_275;
    float _289 = _287 + 1.0;
    float _291 = _209 * _241;
    bool _293 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _295 = isnan(_197);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _305;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _317 = fma(_307, _243, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _319 = _303 * _289;
    float _321 = fma(_311, _243, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _323 = -_303;
    float _325 = _323 + 1.0;
    float _327 = _317 * _319;
    float _329 = _321 * _319;
    float _331 = fma(_283, _291, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _333 = fma(_315, _291, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _335 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[143].x, _327);
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _341;
    float _345 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[143].y, _329);
    float _347 = fma(_331, _285, _335);
    float _349 = fma(_339, _263, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _351 = fma(_343, _263, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _353 = fma(_333, _285, _345);
    float _355 = fma(_349, _261, _347);
    float _357 = fma(_351, _261, _353);
    float _359 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[146].x, _355);
    float _361 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[146].y, _357);
    bool _363 = !_237;
    float _381;
    if (!_363)
    {
        float _365 = in.m_65.x;
        float _367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _369 = _365 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _371 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[11].y, _143);
        float _373 = _371 * _367;
        float _375 = floor(_373);
        float _377 = -_375;
        float _379 = _373 + _377;
        _381 = _379;
        _383 = true;
    }
    else
    {
        float _385 = float(_111);
        float _387 = 1.0 / _385;
        float _389 = _143 * _387;
        _381 = _389;
    }
    _383 = false;
    float _391 = _381;
    float _393 = in.m_65.x;
    float _395 = in.m_65.y;
    float _397 = in.m_65.z;
    int _399 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _401 = _399 != 0;
    int _403 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _405 = _403 != 0;
    int _407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _409 = _407 != 0;
    float _411 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _413 = log2(_411);
    float _415 = in.m_58.x;
    float _417 = in.m_58.y;
    float _419 = in.m_58.z;
    float _421 = in.m_67.y;
    float _423 = _413 * _143;
    float _425 = _393 * 2.0;
    float _427 = _395 * 2.0;
    float _429 = _397 * 2.0;
    float _431 = floor(_427);
    float _433 = floor(_425);
    float _435 = floor(_429);
    bool _437 = _431 >= 0.0;
    bool _439 = isnan(_431);
    bool _441 = _437 || _439;
    bool _443 = isnan(0.0);
    bool _445 = _441 || _443;
    int _447 = _445 ? 0 : 1;
    bool _449 = _433 > 0.0;
    float _451 = _417 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _453 = _433 >= 0.0;
    bool _455 = isnan(_433);
    bool _457 = _453 || _455;
    bool _459 = isnan(0.0);
    bool _461 = _457 || _459;
    float _463 = _417 + _421;
    float _465 = _417 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _467 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[4].x, _451);
    int _469 = _461 ? 0 : 1;
    float _471 = _395 + _397;
    float _473 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[6].x, _465);
    bool _475 = _435 > 0.0;
    float _477 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[4].z, _467);
    bool _479 = !_405;
    int _481 = _479 ? 0 : 1;
    float _483 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[6].z, _473);
    int _485 = ~_469;
    int _487 = _485 + 1;
    int _489 = _487 + 1;
    float _491 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _493 = _463 + _491;
    bool _495 = _435 >= 0.0;
    bool _497 = isnan(_435);
    bool _499 = _495 || _497;
    bool _501 = isnan(0.0);
    bool _503 = _499 || _501;
    float _505 = _477 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _507 = _489;
    if (!_449)
    {
        int _509 = ~_469;
        int _511 = _509 + 1;
        _507 = _511;
    }
    int _513 = _507;
    float _515 = exp2(_423);
    int _517 = abs(_481);
    float _519 = _471 + (-1.0);
    bool _521 = _431 > 0.0;
    float _523 = _483 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _525 = _493 * _493;
    int _527 = _503 ? 0 : 1;
    float _529 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _531 = _505 + _529;
    float _533 = float(_517);
    float _535 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _537 = float(_513);
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _541 = 1.0 + _539;
    int _543 = ~_527;
    int _545 = _543 + 1;
    int _547 = _545 + 1;
    float _549 = fma(_531, _531, _525);
    int _551 = _547;
    float _553 = _523;
    if (!_475)
    {
        int _555 = ~_527;
        int _557 = _555 + 1;
        _551 = _557;
    }
    int _559 = _551;
    float _561 = _533 * _537;
    float _563 = 1.0 / _541;
    float _565 = in.m_69.x;
    float _567 = in.m_69.y;
    float _569 = in.m_69.z;
    bool _571 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _573 = isnan(1.0);
    bool _575 = _571 || _573;
    bool _577 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _579 = _575 || _577;
    float _581 = -_515;
    float _583 = _581 + 1.0;
    bool _585 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _587 = isnan(0.0);
    bool _589 = _585 || _587;
    bool _591 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _593 = _589 || _591;
    float _595 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _597 = _523 + _595;
    bool _599 = !_401;
    int _601 = _599 ? 0 : 1;
    float _603 = _593 ? _583 : 0.0;
    float _605 = fma(_597, _597, _549);
    int _607 = abs(_601);
    float _609 = _397 + _393;
    float _611 = float(_559);
    float _613 = _397 + (-0.5);
    float _615 = float(_607);
    float _617 = rsqrt(_605);
    if (_579)
    {
        float _619 = _603 * _563;
        _145 = _619;
    }
    float _621 = _145;
    float _623 = _561 * (-2.0);
    int _625 = ~_447;
    int _627 = _625 + 1;
    int _629 = _627 + 1;
    float _631 = _615 * _611;
    bool _633 = !_409;
    int _635 = _633 ? 0 : 1;
    float _637 = fma(_535, _623, _535);
    int _639 = _629;
    if (!_521)
    {
        int _641 = ~_447;
        int _643 = _641 + 1;
        _639 = _643;
    }
    int _645 = _639;
    float _647 = _609 + (-1.0);
    int _649 = abs(_635);
    float _651 = fma(_623, _567, _567);
    float _653 = _395 + (-0.5);
    float _655 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _657 = float(_649);
    float _659 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[196].y, _651);
    float _661 = _395 + _393;
    float _663 = float(_645);
    float _665 = _493 * _617;
    float _667 = fma(_637, _621, _659);
    float _669 = _661 + (-1.0);
    float _671 = _631 * (-2.0);
    float _673 = _657 * _663;
    float _675 = _531 * _617;
    float _677 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _679 = _393 + (-0.5);
    float _681 = fma(_671, _565, _565);
    float _683 = -_665;
    float _685 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[18].w, _493);
    float _687 = fma(_677, _671, _677);
    float _689 = _673 * (-2.0);
    float _691 = as_type<float>(int(gl_VertexIndex));
    float _693 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[196].x, _681);
    float _695 = -_675;
    float _697 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[18].w, _531);
    float _699 = fma(_689, _569, _569);
    float _701 = _685 * _685;
    float _703 = _597 * _617;
    float _705 = in.m_74.x;
    float _707 = in.m_74.y;
    float _709 = fma(_655, _689, _655);
    float _711 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[196].z, _699);
    float _713 = fma(_697, _697, _701);
    float _715 = -_703;
    float _717 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[18].w, _597);
    float _719 = fma(_687, _621, _693);
    float _721 = fma(_709, _621, _711);
    float _723 = _667 * 0.15915493667125701904296875;
    float _725 = fma(_717, _717, _713);
    float _727 = _719 * 0.15915493667125701904296875;
    float _729 = _721 * 0.15915493667125701904296875;
    float _731 = _723 * 6.283185482025146484375;
    float _733 = sin(_731);
    int _735 = as_type<int>(_691) & 1;
    bool _737 = _735 != 0;
    int _739 = as_type<int>(_691) & 2;
    bool _741 = _739 != 0;
    float _743 = sqrt(_725);
    float _745 = _359 * _705;
    float _747 = _361 * _707;
    bool _749 = !_737;
    float _751 = _749 ? (-0.5) : 0.5;
    float _753 = _723 * 6.283185482025146484375;
    float _755 = cos(_753);
    float _757 = _745 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _759 = !_741;
    float _761 = _759 ? (-0.5) : 0.5;
    float _763 = _747 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _765 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _761);
    float _767 = _727 * 6.283185482025146484375;
    float _769 = sin(_767);
    float _771 = _617 * _743;
    float _773 = _757 * _771;
    float _775 = _771 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _777 = _775 * 0.5;
    float _779 = _763 * _771;
    float _781 = _727 * 6.283185482025146484375;
    float _783 = cos(_781);
    float _785 = _779 * _765;
    float _787 = _729 * 6.283185482025146484375;
    float _789 = cos(_787);
    float _791 = _769 * _733;
    float _793 = _769 * _755;
    float _795 = _729 * 6.283185482025146484375;
    float _797 = sin(_795);
    float _799 = _783 * _755;
    float _801 = _783 * _733;
    float _803 = _769 * _789;
    float _805 = _755 * _789;
    float _807 = _783 * _789;
    float _809 = _733 * _789;
    float _811 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _751);
    float _813 = _807 * _777;
    float _815 = _773 * _811;
    float _817 = fma(_797, _799, _791);
    float _819 = -_793;
    float _821 = fma(_797, _801, _819);
    float _823 = _797 * _777;
    float _825 = -_801;
    float _827 = fma(_797, _793, _825);
    float _829 = fma(_817, _815, _813);
    float _831 = _803 * _777;
    float _833 = -_823;
    float _835 = fma(_805, _815, _833);
    float _837 = fma(_797, _791, _799);
    float _839 = -_785;
    float _841 = fma(_821, _839, _829);
    float _843 = fma(_827, _815, _831);
    float _845 = -_785;
    float _847 = fma(_809, _845, _835);
    float _849 = _841 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _851 = -_785;
    float _853 = fma(_837, _851, _843);
    float _855 = _841 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _857 = _841 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _859 = fma(_847, (*spvDescriptorSet0.vp_c10)._m0[10].x, _849);
    float _861 = fma(_847, (*spvDescriptorSet0.vp_c10)._m0[8].x, _855);
    float _863 = fma(_847, (*spvDescriptorSet0.vp_c10)._m0[9].x, _857);
    float _865 = fma(_853, (*spvDescriptorSet0.vp_c10)._m0[10].z, _859);
    float _867 = fma(_853, (*spvDescriptorSet0.vp_c10)._m0[8].z, _861);
    float _869 = fma(_853, (*spvDescriptorSet0.vp_c10)._m0[9].z, _863);
    float _871 = _523 + _865;
    float _873 = _505 + _867;
    float _875 = _463 + _869;
    float _877 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _879 = _871 + _877;
    float _881 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _883 = _873 + _881;
    float _885 = _879 * _879;
    float _887 = fma(_883, _883, _885);
    float _889 = sqrt(_887);
    bool _891 = _889 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _893 = 0.0;
    float _895 = _871;
    float _897 = _873;
    int _899 = as_type<int>(_883);
    float _901 = _675;
    if (!_891)
    {
        _893 = _875;
    }
    float _903 = _893;
    bool _905 = !_891;
    float _907 = _903;
    if (!_905)
    {
        float _909 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _911 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _913 = _889 + _911;
        float _915 = rsqrt(_887);
        float _917 = _913 * _909;
        float _919 = _875 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _921 = _917 * 0.15915493667125701904296875;
        float _923 = _921 * 6.283185482025146484375;
        float _925 = cos(_923);
        float _927 = _921 * 6.283185482025146484375;
        float _929 = sin(_927);
        float _931 = _925 + (-1.0);
        float _933 = fma(_929, _919, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _935 = _931 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _937 = _915 * _933;
        float _939 = fma(_875, _925, _935);
        float _941 = fma(_883, _937, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _943 = fma(_879, _937, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _895 = _943;
        _897 = _941;
        _907 = _939;
    }
    float _945 = _895;
    float _947 = _897;
    float _949 = _907;
    float _951 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _953 = _945 + _951;
    float _955 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _957 = _947 + _955;
    float _959 = fma(_953, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _961 = fma(_957, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4040 = float2(_961, _959);
    float _963 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4040, float2(0.0), isnan(_4040)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4040, float2(0.0), isnan(_4040)), level(0.0)).x;
    float _965 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _967 = -_675;
    float _969 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[18].w, _505);
    float _971 = -_703;
    float _973 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[18].w, _523);
    float _975 = fma(_963, 100.0, _463);
    float _977 = -_665;
    float _979 = fma(_977, (*spvDescriptorSet0.vp_c9)._m0[18].w, _975);
    float _981 = _979 + _965;
    float _983 = _981 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _985 = _981 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _987 = fma(_969, (*spvDescriptorSet0.vp_c15)._m0[126].x, _983);
    float _989 = fma(_969, (*spvDescriptorSet0.vp_c15)._m0[127].x, _985);
    float _991 = fma(_973, (*spvDescriptorSet0.vp_c15)._m0[126].z, _987);
    float _993 = fma(_973, (*spvDescriptorSet0.vp_c15)._m0[127].z, _989);
    float _995 = _991 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _997 = _993 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _999 = trunc(_995);
    int _1001 = int(_999);
    float _1003 = trunc(_997);
    int _1005 = int(_1003);
    int _1007 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1009 = _1001 + _1007;
    int _1011 = _1009 + 1;
    bool _1013 = _1011 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1015 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1017 = _1005 + _1015;
    int _1019 = _1017 + 1;
    int _1021 = _1011 | _1019;
    bool _1023 = _1021 < 0;
    bool _1025 = _1023 || _1013;
    bool _1027 = _1019 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1029 = _1027 || _1025;
    int _1031 = _1011;
    int _1033 = _1019;
    int _1035 = _1021;
    if (!_1029)
    {
        int _1037 = _1019 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1039 = _1037 + _1011;
        _1031 = _1039;
    }
    int _1041 = _1031;
    float _1043 = _993;
    if (!_1029)
    {
        float _1045 = floor(_997);
        _1043 = _1045;
    }
    float _1047 = _1043;
    if (!_1029)
    {
        int _1049 = _1041 << 2;
        _1033 = _1049;
    }
    int _1051 = _1033;
    int _1053 = _1051;
    if (!_1029)
    {
        uint _1056 = uint(int(uint(_1041) >> uint(2)));
        _1035 = int(_1056);
    }
    int _1058 = _1035;
    if (!_1029)
    {
        int _1060 = 12 & _1051;
        _1053 = _1060;
    }
    int _1062 = _1053;
    if (!_1029)
    {
        int _1064 = _1058 << 4;
        int _1066 = _1064 + _1062;
        _899 = _1066;
    }
    int _1068 = _899;
    float _1070 = as_type<float>(_1062);
    if (!_1029)
    {
        float _1072 = floor(_995);
        _1070 = _1072;
    }
    float _1074 = _1070;
    float _1076 = as_type<float>(_1058);
    if (!_1029)
    {
        int _1078 = _1068 + 400;
        uint _1080 = uint(int(uint(_1078) >> uint(2)));
        uint _1082 = uint(int(uint(int(_1080)) >> uint(2)));
        int _1084 = int(_1080) & 3;
        float _1086 = (*spvDescriptorSet0.vp_c15)._m0[int(_1082)][_1084];
        _1076 = _1086;
    }
    float _1088 = _1076;
    float _1090 = 0.0;
    if (!_1029)
    {
        float _1092 = -_1047;
        float _1094 = _997 + _1092;
        _1090 = _1094;
    }
    float _1096 = _1090;
    float _1098 = _1074;
    if (!_1029)
    {
        float _1100 = -_1074;
        float _1102 = _995 + _1100;
        _1098 = _1102;
    }
    float _1104 = _1098;
    float _1106 = _1088;
    if (!_1029)
    {
        float _1108 = rint(_1088);
        float _1110 = precise::max(_1108, 0.0);
        uint _1112 = uint(_1110);
        uint _1114 = clamp(_1112, 0u, 65535u);
        _1106 = as_type<float>(_1114);
    }
    float _1116 = _1106;
    float _1118 = _1096;
    if (!_1029)
    {
        float3 _4315 = float3(_1104, _1096, float(as_type<int>(_1116)));
        float3 _4319 = select(_4315, float3(0.0), isnan(_4315));
        float _1120 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4319.xy, uint(rint(_4319.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4319.xy, uint(rint(_4319.z)), level(0.0)).x;
        _1118 = _1120;
    }
    float _1122 = _1118;
    float _1124 = _979 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1126 = -_703;
    float _1128 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[18].w, _945);
    float _1130 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1124);
    float _1132 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1130);
    float _1134 = _979 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1136 = _1132 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1138 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1134);
    float _1140 = 1.0 / _1136;
    float _1142 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1138);
    float _1144 = _1142 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1146 = _1144 + _1136;
    float _1148 = _1146 * _1140;
    float _1150 = _1148 * 0.5;
    float _1152 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1154 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1152);
    float _1156 = 1.0 / _1154;
    float _1158 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1160 = _1156 * _1158;
    bool _1162 = _1160 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1164 = _1160 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1166 = !_1162;
    int _1168 = _1166 ? 0 : 1;
    int _1170 = 2;
    if (!_1162)
    {
        _1170 = 1;
    }
    int _1172 = _1170;
    int _1174 = _1172;
    if (!_1164)
    {
        _1174 = _1168;
    }
    int _1176 = _1174;
    bool _1178 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1180 = isnan(0.5);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1186 = _1182 || _1184;
    int _1188 = _1176 << 6;
    int _1190 = _1188 + 96;
    uint _1192 = uint(int(uint(_1190) >> uint(2)));
    uint _1194 = uint(int(uint(int(_1192)) >> uint(2)));
    int _1196 = int(_1192) & 3;
    float _1198 = (*spvDescriptorSet0.vp_c15)._m0[int(_1194)][_1196];
    int _1200 = int(_1192) + 1;
    uint _1202 = uint(int(uint(_1200) >> uint(2)));
    int _1204 = _1200 & 3;
    float _1206 = (*spvDescriptorSet0.vp_c15)._m0[int(_1202)][_1204];
    int _1208 = _1188 + 48;
    uint _1210 = uint(int(uint(_1208) >> uint(2)));
    uint _1212 = uint(int(uint(int(_1210)) >> uint(2)));
    int _1214 = int(_1210) & 3;
    float _1216 = (*spvDescriptorSet0.vp_c15)._m0[int(_1212)][_1214];
    int _1218 = int(_1210) + 1;
    uint _1220 = uint(int(uint(_1218) >> uint(2)));
    int _1222 = _1218 & 3;
    float _1224 = (*spvDescriptorSet0.vp_c15)._m0[int(_1220)][_1222];
    int _1226 = _1188 + 104;
    uint _1228 = uint(int(uint(_1226) >> uint(2)));
    uint _1230 = uint(int(uint(int(_1228)) >> uint(2)));
    int _1232 = int(_1228) & 3;
    float _1234 = (*spvDescriptorSet0.vp_c15)._m0[int(_1230)][_1232];
    int _1236 = int(_1228) + 1;
    uint _1238 = uint(int(uint(_1236) >> uint(2)));
    int _1240 = _1236 & 3;
    float _1242 = (*spvDescriptorSet0.vp_c15)._m0[int(_1238)][_1240];
    int _1244 = _1188 + 80;
    uint _1246 = uint(int(uint(_1244) >> uint(2)));
    uint _1248 = uint(int(uint(int(_1246)) >> uint(2)));
    int _1250 = int(_1246) & 3;
    float _1252 = (*spvDescriptorSet0.vp_c15)._m0[int(_1248)][_1250];
    int _1254 = int(_1246) + 1;
    uint _1256 = uint(int(uint(_1254) >> uint(2)));
    int _1258 = _1254 & 3;
    float _1260 = (*spvDescriptorSet0.vp_c15)._m0[int(_1256)][_1258];
    int _1262 = _1188 + 64;
    uint _1264 = uint(int(uint(_1262) >> uint(2)));
    uint _1266 = uint(int(uint(int(_1264)) >> uint(2)));
    int _1268 = int(_1264) & 3;
    float _1270 = (*spvDescriptorSet0.vp_c15)._m0[int(_1266)][_1268];
    int _1272 = int(_1264) + 1;
    uint _1274 = uint(int(uint(_1272) >> uint(2)));
    int _1276 = _1272 & 3;
    float _1278 = (*spvDescriptorSet0.vp_c15)._m0[int(_1274)][_1276];
    int _1280 = _1188 + 88;
    uint _1282 = uint(int(uint(_1280) >> uint(2)));
    uint _1284 = uint(int(uint(int(_1282)) >> uint(2)));
    int _1286 = int(_1282) & 3;
    float _1288 = (*spvDescriptorSet0.vp_c15)._m0[int(_1284)][_1286];
    int _1290 = int(_1282) + 1;
    uint _1292 = uint(int(uint(_1290) >> uint(2)));
    int _1294 = _1290 & 3;
    float _1296 = (*spvDescriptorSet0.vp_c15)._m0[int(_1292)][_1294];
    int _1298 = _1188 + 56;
    uint _1300 = uint(int(uint(_1298) >> uint(2)));
    uint _1302 = uint(int(uint(int(_1300)) >> uint(2)));
    int _1304 = int(_1300) & 3;
    float _1306 = (*spvDescriptorSet0.vp_c15)._m0[int(_1302)][_1304];
    int _1308 = int(_1300) + 1;
    uint _1310 = uint(int(uint(_1308) >> uint(2)));
    int _1312 = _1308 & 3;
    float _1314 = (*spvDescriptorSet0.vp_c15)._m0[int(_1310)][_1312];
    float _1316 = _981 * _1206;
    float _1318 = fma(_963, 100.0, _949);
    float _1320 = fma(_969, _1198, _1316);
    float _1322 = -_665;
    float _1324 = fma(_1322, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1318);
    float _1326 = -_675;
    float _1328 = fma(_1326, (*spvDescriptorSet0.vp_c9)._m0[18].w, _947);
    int _1330 = _1188 + 72;
    uint _1332 = uint(int(uint(_1330) >> uint(2)));
    uint _1334 = uint(int(uint(int(_1332)) >> uint(2)));
    int _1336 = int(_1332) & 3;
    float _1338 = (*spvDescriptorSet0.vp_c15)._m0[int(_1334)][_1336];
    int _1340 = int(_1332) + 1;
    uint _1342 = uint(int(uint(_1340) >> uint(2)));
    int _1344 = _1340 & 3;
    float _1346 = (*spvDescriptorSet0.vp_c15)._m0[int(_1342)][_1344];
    float _1348 = _981 * _1224;
    float _1350 = fma(_969, _1216, _1348);
    float _1352 = fma(_973, _1234, _1320);
    float _1354 = _1352 + _1242;
    float _1356 = _981 * _1260;
    float _1358 = 1.0 / _1354;
    float _1360 = fma(_969, _1252, _1356);
    float _1362 = _981 * _1278;
    float _1364 = fma(_969, _1270, _1362);
    float _1366 = fma(_973, _1288, _1360);
    float _1368 = _1366 + _1296;
    float _1370 = _1366;
    float _1372 = _1296;
    float _1374 = _1328;
    float _1376 = _1368;
    float _1378 = _1278;
    if (_1186)
    {
        _1370 = _1128;
    }
    float _1380 = _1370;
    float _1382 = _1380;
    if (_1186)
    {
        _1372 = _1324;
    }
    float _1384 = _1372;
    float _1386 = fma(_973, _1306, _1350);
    float _1388 = _1386 + _1314;
    float _1390 = fma(_973, _1338, _1364);
    float _1392 = _1390 + _1346;
    float _1394 = _1384;
    if (!_1186)
    {
        float _1396 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1398 = _979 + _1396;
        float _1400 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1402 = _969 + _1400;
        float _1404 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1406 = -_523;
        float _1408 = _1406 + _945;
        float _1410 = _1398 * _1398;
        float _1412 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1414 = _973 + _1412;
        float _1416 = -_463;
        float _1418 = _1416 + _949;
        float _1420 = -_505;
        float _1422 = _1420 + _947;
        float _1424 = fma(_1402, _1402, _1410);
        float _1426 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1428 = fma(_1414, _1414, _1424);
        float _1430 = sqrt(_1428);
        float _1432 = 1.0 / _771;
        float _1434 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1436 = precise::min(_1430, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1438 = _1436 * _1404;
        float _1440 = _1438 * _1432;
        float _1442 = _1434 * _1440;
        float _1444 = _1408 * _1440;
        float _1446 = fma(_1418, _1442, _979);
        float _1448 = fma(_1422, _1442, _969);
        float _1450 = fma(_1434, _1444, _973);
        _1394 = _1446;
        _1374 = _1448;
        _1382 = _1450;
        _553 = _1444;
    }
    float _1452 = _1394;
    float _1454 = _1374;
    float _1456 = _1382;
    float _1458 = _553;
    float _1460 = _1388 * _1358;
    float _1462 = _1392 * _1358;
    float _1464 = _1368 * _1358;
    float _1466 = _1458;
    if (_1029)
    {
        _1466 = 1.0;
    }
    float _1468 = _1466;
    float _1470 = _1468;
    if (!_1029)
    {
        int _1472 = _1041 << 4;
        int _1474 = _1472 + 2048;
        uint _1476 = uint(int(uint(_1474) >> uint(2)));
        uint _1478 = uint(int(uint(int(_1476)) >> uint(2)));
        int _1480 = int(_1476) & 3;
        float _1482 = (*spvDescriptorSet0.vp_c15)._m0[int(_1478)][_1480];
        int _1484 = int(_1476) + 1;
        uint _1486 = uint(int(uint(_1484) >> uint(2)));
        int _1488 = _1484 & 3;
        float _1490 = (*spvDescriptorSet0.vp_c15)._m0[int(_1486)][_1488];
        int _1492 = _1474 + 8;
        uint _1494 = uint(int(uint(_1492) >> uint(2)));
        uint _1496 = uint(int(uint(int(_1494)) >> uint(2)));
        int _1498 = int(_1494) & 3;
        float _1500 = (*spvDescriptorSet0.vp_c15)._m0[int(_1496)][_1498];
        int _1502 = int(_1494) + 1;
        uint _1504 = uint(int(uint(_1502) >> uint(2)));
        int _1506 = _1502 & 3;
        float _1508 = (*spvDescriptorSet0.vp_c15)._m0[int(_1504)][_1506];
        float _1510 = _981 * _1490;
        float _1512 = fma(_969, _1482, _1510);
        float _1514 = fma(_973, _1500, _1512);
        float _1516 = _1514 + _1508;
        float _1518 = precise::clamp(_1516, 0.0, 1.0);
        float _1520 = -_1518;
        float _1522 = _1520 + _1122;
        float _1524 = fma(_1522, 500.0, 1.5);
        float _1526 = exp2(_1524);
        float _1528 = 0.0 + _1526;
        float _1530 = precise::clamp(_1528, 0.0, 1.0);
        _1470 = _1530;
    }
    float _1532 = _1470;
    float _1534 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1536 = _1452 + _1534;
    float _1538 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1540 = _1454 + _1538;
    float _1542 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1544 = _1456 + _1542;
    float _1546 = _1536 * _1536;
    float _1548 = fma(_1540, _1540, _1546);
    float _1550 = fma(_1544, _1544, _1548);
    float _1552 = rsqrt(_1550);
    float _1554 = sqrt(_1550);
    float _1556 = _1552 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1558 = _1540 * _1556;
    float _1560 = _1544 * _1556;
    float _1562 = _1558 * _1558;
    float _1564 = _1560 * _1560;
    float _1566 = _1562 + _1564;
    float _1568 = sqrt(_1566);
    bool _1570 = _1568 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1572 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1574 = _1568 + _1572;
    float _1576 = _1544;
    float _1578 = _1546;
    float _1580 = _1574;
    float _1582 = _1536;
    float _1584 = _1564;
    if (_1570)
    {
        float _1586 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1576 = _1586;
    }
    float _1588 = _1576;
    if (_1570)
    {
        float _1590 = rsqrt(_1566);
        _1578 = _1590;
    }
    float _1592 = _1578;
    float _1594 = _1592;
    if (_1570)
    {
        float _1596 = _1574 * _1588;
        _1580 = _1596;
    }
    float _1598 = _1580;
    if (_1570)
    {
        float _1600 = _1598 * 0.15915493667125701904296875;
        _1376 = _1600;
    }
    float _1602 = _1376;
    float _1604 = _1588;
    if (_1570)
    {
        float _1606 = _1602 * 6.283185482025146484375;
        float _1608 = sin(_1606);
        _1604 = _1608;
    }
    float _1610 = _1604;
    float _1612 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1614 = precise::max(0.0, _1612);
    float _1616 = _1552;
    float _1618 = _1614;
    if (_1570)
    {
        float _1620 = _1602 * 6.283185482025146484375;
        float _1622 = cos(_1620);
        _1616 = _1622;
    }
    float _1624 = _1616;
    float _1626 = -_1556;
    float _1628 = -_1614;
    float _1630 = fma(_1536, _1626, _1628);
    if (_1570)
    {
        float _1632 = _1630 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1618 = _1632;
    }
    float _1634 = _1618;
    float _1636 = _1634;
    float _1638 = _1610;
    if (_1570)
    {
        float _1640 = fma(_1610, _1634, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1636 = _1640;
    }
    float _1642 = _1636;
    float _1644 = _1642;
    if (!_1570)
    {
        _1638 = _1558;
    }
    float _1646 = _1638;
    float _1648 = _1646;
    float _1650 = _1624;
    if (_1570)
    {
        float _1652 = _1624 + (-1.0);
        _1582 = _1652;
    }
    float _1654 = _1582;
    float _1656 = _1654;
    if (_1570)
    {
        float _1658 = _1592 * _1642;
        _901 = _1658;
    }
    float _1660 = _901;
    if (!_1570)
    {
        _1644 = _1630;
    }
    float _1662 = _1644;
    float _1664 = _1662;
    if (_1570)
    {
        float _1666 = _1654 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1378 = _1666;
    }
    float _1668 = _1378;
    if (_1570)
    {
        float _1670 = _1558 * _1660;
        _1648 = _1670;
    }
    float _1672 = _1648;
    if (!_1570)
    {
        _1594 = _1560;
    }
    float _1674 = _1594;
    float _1676 = _1674;
    if (_1570)
    {
        float _1678 = _1560 * _1660;
        _1676 = _1678;
    }
    float _1680 = _1676;
    if (!_1570)
    {
        _1656 = _1562;
    }
    float _1682 = _1656;
    float _1684 = _1682;
    if (_1570)
    {
        float _1686 = fma(_1630, _1624, _1668);
        _1664 = _1686;
    }
    float _1688 = _1664;
    if (_1570)
    {
        float _1690 = _1672 * _1672;
        _1684 = _1690;
    }
    float _1692 = _1684;
    if (!_1570)
    {
        _1650 = _1564;
    }
    float _1694 = _1650;
    float _1696 = _1694;
    if (_1570)
    {
        float _1698 = _1680 * _1680;
        _1696 = _1698;
    }
    float _1700 = _1696;
    float _1702 = _1452 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1704 = fma(_1688, _1688, _1692);
    float _1706 = _1452 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1708 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1702);
    float _1710 = _1704 + _1700;
    bool _1712 = _1460 >= 0.0;
    float _1714 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1716 = fma(_1554, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1714);
    float _1718 = precise::clamp(_1716, 0.0, 1.0);
    float _1720 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1708);
    float _1722 = rsqrt(_1710);
    float _1724 = -_1718;
    float _1726 = _1724 + 1.0;
    float _1728 = _1720 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1730 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _1732 = _1460 <= 1.0;
    bool _1734 = _1732 && _1712;
    float _1736 = fma(_969, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1738 = abs(_1726);
    float _1740 = log2(_1738);
    float _1742 = _1728 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1744 = _1462 >= 0.0;
    bool _1746 = _1744 && _1734;
    float _1748 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1706);
    bool _1750 = _1462 <= 1.0;
    bool _1752 = _1750 && _1746;
    float _1754 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1748);
    float _1756 = _1722 * _1672;
    float _1758 = fma(_973, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1760 = -_1742;
    float _1762 = fma(_1760, _1730, 1.0);
    float _1764 = _1722 * _1688;
    float _1766 = _1756 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1768 = _1452 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1770 = _1722 * _1680;
    float _1772 = _1452 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1774 = -_1766;
    float _1776 = fma(_1764, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1774);
    float _1778 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1768);
    float _1780 = floor(_1758);
    float _1782 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1772);
    float _1784 = -_1770;
    float _1786 = fma(_1784, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1776);
    float _1788 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1778);
    float _1790 = _1740 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1792 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1782);
    float _1794 = _1754 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1796 = _1788 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1798 = floor(_1736);
    float _1800 = _1792 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    if (_1752)
    {
        float _1802 = float(_1176);
        _1584 = _1802;
    }
    float _1804 = _1584;
    float _1806 = _1796 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1808 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1806);
    float _1810 = log2(_1762);
    float _1812 = -_1780;
    float _1814 = _1758 + _1812;
    float _1816 = _1796 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1818 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1808);
    float _1820 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1818);
    float _1822 = exp2(_1790);
    float _1824 = fma(_1786, -0.5, 0.5);
    float _1826 = -_1798;
    float _1828 = _1736 + _1826;
    float _1830 = _1796 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1832 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1816);
    float _1834 = fma(_1786, 0.5, 0.5);
    float _1836 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1830);
    float _1838 = 1.0 / _1820;
    float _1840 = _1764 + 1.0;
    float _1842 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1836);
    float _1844 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1832);
    float _1846 = fma(_1834, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1848 = sqrt(_1824);
    float _1850 = -_1764;
    float _1852 = fma(_1822, _1840, _1850);
    float _1854 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1842);
    float _1856 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1844);
    float _1858 = fma(_1834, _1846, -0.212114393711090087890625);
    float _1860 = _1810 * 0.693147182464599609375;
    float _1862 = _1804;
    float _1864 = _1820;
    if (_1752)
    {
        float _1866 = rint(_1804);
        float _1868 = precise::max(_1866, 0.0);
        uint _1870 = uint(_1868);
        uint _1872 = clamp(_1870, 0u, 65535u);
        _1862 = as_type<float>(_1872);
    }
    float _1874 = _1862;
    float _1876 = _1854 * _1838;
    float _1878 = _1856 * _1838;
    float2 _5561 = float2(_1828, _1814);
    float _1880 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5561, float2(0.0), isnan(_5561)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5561, float2(0.0), isnan(_5561)), level(0.0)).x;
    float _1882 = fma(_1834, _1858, 1.570728778839111328125);
    float _1884 = _1860 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1886 = fma(_1876, 0.5, 0.5);
    float _1888 = fma(_1878, -0.5, 0.5);
    float _1890 = _1848 * 0.636619746685028076171875;
    float _1892 = -_1882;
    float _1894 = fma(_1890, _1892, 1.0);
    float _1896 = fma(_1852, 0.5, 0.5);
    float _1898 = _1874;
    if (_1752)
    {
        float3 _5597 = float3(_1460, _1462, float(as_type<int>(_1874)));
        float3 _5599 = select(_5597, float3(0.0), isnan(_5597));
        float _1900 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5599.xy, uint(rint(_5599.z)), _1464, level(0.0));
        _1898 = _1900;
    }
    float _1902 = _1898;
    float3 _5609 = float3(_1886, _1888, _1884);
    float _1904 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5609, float3(0.0), isnan(_5609)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5609, float3(0.0), isnan(_5609)), level(0.0)).x;
    float3 _5618 = float3(_1886, _1888, _1884);
    float4 _1907 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5618, float3(0.0), isnan(_5618)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5618, float3(0.0), isnan(_5618)), level(0.0)).xyzw;
    float _1909 = _1907.x;
    float _1911 = _1907.y;
    float _1913 = _1907.z;
    float _1915 = _1907.w;
    float2 _5634 = float2(_1894, _1896);
    float3 _1919 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5634, float2(0.0), isnan(_5634)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5634, float2(0.0), isnan(_5634)), level(0.0)).xyz;
    float _1921 = _1919.x;
    float _1923 = _1919.y;
    float _1925 = _1919.z;
    float _1927 = _1740 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1929 = _1796 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1931 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1933 = _1931 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1935 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1937 = _1935 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1939 = _393 > 0.5;
    float _1941 = 1.0 / _1933;
    bool _1943 = _395 > 0.5;
    float _1945 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1947 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1945;
    float _1949 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1951 = _1949 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1953 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1955 = _391 + _1953;
    bool _1957 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1959 = isnan(_391);
    bool _1961 = _1957 || _1959;
    bool _1963 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1965 = _1961 || _1963;
    float _1967 = float(_1965);
    float _1969 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1971 = _1969 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _1973 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1975 = isnan(_391);
    bool _1977 = _1973 || _1975;
    bool _1979 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1981 = _1977 || _1979;
    float _1983 = float(_1981);
    float _1985 = 1.0 / _1937;
    bool _1987 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1989 = isnan(_391);
    bool _1991 = _1987 || _1989;
    bool _1993 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1995 = _1991 || _1993;
    float _1997 = float(_1995);
    float _1999 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1929);
    float _2001 = -_1997;
    float _2003 = _2001 + 1.0;
    int _2005 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2007 = _2005 != 0;
    float _2009 = _1947 * _1941;
    float _2011 = 1.0 / _1951;
    float _2013 = fma(_2009, _1955, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _2015 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2017 = isnan(_391);
    bool _2019 = _2015 || _2017;
    bool _2021 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2023 = _2019 || _2021;
    float _2025 = float(_2023);
    int _2027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2029 = _2027 != 0;
    float _2031 = exp2(_1927);
    float _2033 = -_2025;
    float _2035 = _2033 + 1.0;
    float _2037 = _2025 * _2003;
    float _2039 = -_1967;
    float _2041 = _2039 + 1.0;
    float _2043 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2045 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _2043;
    float _2047 = _1983 * _2035;
    float _2049 = -_751;
    int _2051 = _1939 ? as_type<int>(_2049) : as_type<int>(_751);
    float _2053 = _1997 * _2041;
    float _2055 = _2045 * _1985;
    float _2057 = _1971 * _2011;
    float _2059 = _2013 * _2047;
    float _2061 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2063 = _391 + _2061;
    float _2065 = -_1983;
    float _2067 = _2065 + 1.0;
    float _2069 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2071 = _391 + _2069;
    float _2073 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2075 = fma(_2057, _2063, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2077 = fma(_2067, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2059);
    float _2079 = fma(_2055, _2071, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _2081 = !_2007;
    float _2083 = _2081 ? _751 : as_type<float>(_2051);
    float _2085 = -_2031;
    float _2087 = _2085 + 1.0;
    float _2089 = fma(_2075, _2037, _2077);
    float _2091 = -_761;
    int _2093 = _1943 ? as_type<int>(_2091) : as_type<int>(_761);
    float _2095 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2097 = _2083 + 0.5;
    float _2099 = fma(_2079, _2053, _2089);
    float _2101 = _751 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2103 = !_2029;
    float _2105 = _2103 ? _761 : as_type<float>(_2093);
    float _2107 = _2097 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2109 = -_797;
    float _2111 = fma(_805, _2101, _2109);
    float _2113 = fma(_817, _2101, _807);
    float _2115 = _761 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2117 = fma(_827, _2101, _803);
    float _2119 = -_2105;
    float _2121 = _2119 + 0.5;
    float _2123 = -_2115;
    float _2125 = fma(_837, _2123, _2117);
    float _2127 = _2107 * _2073;
    float _2129 = abs(_1160);
    float _2131 = log2(_2129);
    float _2133 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2135 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2137 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2139 = _2121 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2141 = _2133 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2143 = _2135 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2145 = _2137 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2147 = _2139 * _2095;
    float _2149 = -_2115;
    float _2151 = fma(_821, _2149, _2113);
    float _2153 = -_2115;
    float _2155 = fma(_809, _2153, _2111);
    out.m_76.x = _2141;
    out.m_76.y = _2143;
    out.m_76.z = _2145;
    bool _2157 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2159 = isnan(0.5);
    bool _2161 = _2157 || _2159;
    bool _2163 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2165 = _2161 || _2163;
    float _2167 = fma(_1967, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2099);
    float _2169 = _2131 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.m_78.x = _2127;
    out.m_78.y = _2147;
    float _2171 = _2167 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2173 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2175 = exp2(_2169);
    float _2177 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2179 = _2151 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2181 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2183 = _2173 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2185 = _2151 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2187 = fma(_2155, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2179);
    float _2189 = _2177 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2191 = _2181 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2193 = fma(_2155, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2185);
    float _2195 = fma(_2125, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2187);
    float _2197 = _2147;
    if (!_2165)
    {
        _2197 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2199 = _2197;
    float _2201 = _2151 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2203 = fma(_2125, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2193);
    out.m_80.x = _2183;
    out.m_80.y = _2189;
    out.m_80.z = _2191;
    out.m_80.w = _2171;
    float _2205 = fma(_2175, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2207 = precise::clamp(_2205, 0.0, 1.0);
    float _2209 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1999);
    float _2211 = fma(_2155, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2201);
    float _2213 = fma(_2207, -2.0, 3.0);
    float _2215 = _2207 * _2207;
    float _2217 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2209);
    float _2219 = fma(_2125, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2211);
    float _2221 = _2215 * _2213;
    float _2223 = _2213;
    float _2225 = _2199;
    float _2227 = _2221;
    float _2229 = _2217;
    if (!_2165)
    {
        float _2231 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2233 = _2199 + _2231;
        _2223 = _2233;
    }
    float _2235 = _2223;
    if (!_2165)
    {
        float _2237 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2239 = _1160 + _2237;
        _2225 = _2239;
    }
    float _2241 = _2225;
    bool _2243 = _1160 <= 8000.0;
    bool _2245 = isnan(_1160);
    bool _2247 = _2243 || _2245;
    bool _2249 = isnan(8000.0);
    bool _2251 = _2247 || _2249;
    float _2253 = float(_2251);
    float _2255 = -_2221;
    float _2257 = _2255 + 1.0;
    float _2259 = _803;
    if (!_2165)
    {
        float _2261 = 1.0 / _2235;
        _2259 = _2261;
    }
    float _2263 = _2259;
    out.gl_Position.x = _1854;
    out.gl_Position.y = _1856;
    out.gl_Position.z = _2217;
    out.gl_Position.w = _1820;
    float _2265 = _2217 + _1820;
    float _2267 = fma(_2257, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2221);
    float _2269 = _1854 + _1820;
    float _2271 = _2265 * 0.5;
    float _2273 = _2253 * _2267;
    float _2275 = _2269 * 0.5;
    float _2277 = _1820 * 0.5;
    out.m_82.x = _2219;
    out.m_82.y = _2195;
    out.m_82.z = _2203;
    float _2279 = _2273 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2281 = _2277;
    if (_2165)
    {
        _2227 = 1.0;
    }
    float _2283 = _2227;
    float _2285 = fma(_1856, -0.5, _2277);
    float _2287 = _2283;
    if (!_1752)
    {
        _2281 = 1.0;
    }
    float _2289 = _2281;
    float _2291 = _2289;
    if (!_2165)
    {
        float _2293 = _2241 * _2263;
        float _2295 = precise::clamp(_2293, 0.0, 1.0);
        _2287 = _2295;
    }
    float _2297 = _2287;
    out.m_84.x = _2275;
    out.m_84.y = _2285;
    out.m_84.z = _2271;
    out.m_84.w = _1820;
    float _2299 = -_1880;
    float _2301 = _2299 + 1.0;
    float _2303 = _2301 * _2279;
    float _2305 = precise::clamp(_2303, 0.0, 1.0);
    float _2307 = -_2305;
    float _2309 = fma(_2307, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2311 = _1909;
    if (_1752)
    {
        bool _2313 = _1902 >= _1464;
        bool _2315 = isnan(_1902);
        bool _2317 = _2313 || _2315;
        bool _2319 = isnan(_1464);
        bool _2321 = _2317 || _2319;
        float _2323 = float(_2321);
        _2291 = _2323;
    }
    float _2325 = _2291;
    float _2327 = _2087 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2329 = _1554 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2331 = isnan(_1554);
    bool _2333 = _2329 || _2331;
    bool _2335 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2337 = _2333 || _2335;
    float _2339 = _2325 * _1532;
    float _2341 = _2327 * _1904;
    float _2343 = -_2327;
    float _2345 = _2343 + 1.0;
    float _2347 = -_2339;
    float _2349 = fma(_2347, _2309, 1.0);
    float _2351 = precise::clamp(_2349, 0.0, 1.0);
    float _2353 = _1915 * _2341;
    float _2355 = _1925 * _2341;
    float _2357 = _1915 * _2345;
    float _2359 = _2351 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2361 = fma(_1921, _2353, _1909);
    float _2363 = fma(_1923, _2353, _1911);
    float _2365 = fma(_1915, _2355, _1913);
    float _2367 = _2297 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_86.x = _2359;
    float _2369 = _2327;
    float _2371 = _2353;
    float _2373 = _2345;
    if (!_2337)
    {
        _2369 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2375 = _2369;
    float _2377 = _2375;
    float _2379 = _2375;
    if (!_2337)
    {
        _2311 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2381 = _2311;
    out.m_88.x = _2361;
    out.m_88.y = _2363;
    out.m_88.z = _2365;
    out.m_88.w = _2357;
    float _2383 = _2381;
    float _2385 = _2381;
    if (!_2337)
    {
        _1864 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2387 = _1864;
    float _2389 = _2387;
    float _2391 = _2387;
    if (!_2337)
    {
        _2229 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2393 = _2229;
    float _2395 = _2393;
    float _2397 = _2393;
    if (!_2337)
    {
        _2371 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2399 = _2371;
    float _2401 = _2399;
    float _2403 = _2399;
    if (!_2337)
    {
        _2373 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2405 = _2373;
    bool _2407 = !_2337;
    float _2409 = _2405;
    float _2411 = _2405;
    if (!_2407)
    {
        bool _2413 = _1554 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2415 = isnan(_1554);
        bool _2417 = _2413 || _2415;
        bool _2419 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2421 = _2417 || _2419;
        if (!_2421)
        {
            float _2423 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2425 = _1554 + _2423;
            float _2427 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2429 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2427;
            float _2431 = 1.0 / _2429;
            float _2433 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2435 = _2433 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2437 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2439 = _2437 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2441 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2443 = _2441 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2445 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2447 = _2445 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2449 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2451 = _2449 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2453 = _2425 * _2431;
            float _2455 = precise::clamp(_2453, 0.0, 1.0);
            float _2457 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2459 = _2457 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2461 = fma(_2455, _2435, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2463 = fma(_2455, _2459, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2465 = fma(_2455, _2439, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2467 = fma(_2455, _2443, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2469 = fma(_2455, _2447, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2471 = fma(_2455, _2451, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2385 = _2463;
            _2403 = _2469;
            _2379 = _2461;
            _2397 = _2467;
            _2391 = _2465;
            _2411 = _2471;
            _2473 = true;
        }
        else
        {
            bool _2475 = _1554 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2477 = isnan(_1554);
            bool _2479 = _2475 || _2477;
            bool _2481 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2483 = _2479 || _2481;
            if (!_2483)
            {
                _2377 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2485 = _2377;
            _2379 = _2485;
            if (!_2483)
            {
                _2383 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2487 = _2383;
            _2385 = _2487;
            if (!_2483)
            {
                _2389 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2489 = _2389;
            _2391 = _2489;
            if (!_2483)
            {
                _2395 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2491 = _2395;
            _2397 = _2491;
            if (!_2483)
            {
                _2401 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2493 = _2401;
            _2403 = _2493;
            if (!_2483)
            {
                _2409 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2495 = _2409;
            bool _2497 = !_2483;
            _2411 = _2495;
            if (!_2497)
            {
                bool _2499 = _1554 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2501 = isnan(_1554);
                bool _2503 = _2499 || _2501;
                bool _2505 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2507 = _2503 || _2505;
                if (!_2507)
                {
                    float _2509 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2511 = _1554 + _2509;
                    float _2513 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2515 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2513;
                    float _2517 = 1.0 / _2515;
                    float _2519 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2521 = _2519 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2523 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2525 = _2523 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2527 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2529 = _2527 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2531 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2533 = _2531 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2535 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2537 = _2535 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2539 = _2511 * _2517;
                    float _2541 = precise::clamp(_2539, 0.0, 1.0);
                    float _2543 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2545 = _2543 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2547 = fma(_2541, _2521, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2549 = fma(_2541, _2545, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2551 = fma(_2541, _2525, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2553 = fma(_2541, _2529, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2555 = fma(_2541, _2533, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2557 = fma(_2541, _2537, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2385 = _2549;
                    _2403 = _2555;
                    _2379 = _2547;
                    _2397 = _2553;
                    _2391 = _2551;
                    _2411 = _2557;
                    _2473 = true;
                }
                else
                {
                    _2385 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2403 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2379 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2397 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2391 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2411 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2473 = false;
    float _2559 = _2385;
    float _2561 = _2403;
    float _2563 = _2379;
    float _2565 = _2397;
    float _2567 = _2391;
    float _2569 = _2411;
    float _2571 = fma(_2195, -0.5, 0.5);
    float _2573 = precise::clamp(_2571, 0.0, 1.0);
    float _2575 = -_2559;
    float _2577 = _2575 + _2561;
    float _2579 = _2367 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2581 = -_2563;
    float _2583 = _2581 + _2565;
    float _2585 = fma(_2573, _2577, _2559);
    out.m_90.x = 0.0;
    float _2587 = -_2567;
    float _2589 = _2587 + _2569;
    float _2591 = fma(_2573, _2583, _2563);
    float _2593 = _2585 * 0.586610972881317138671875;
    out.m_61.x = _2579;
    bool _2595 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2597 = fma(_2573, _2589, _2567);
    float _2599 = fma(_2591, 0.298911988735198974609375, _2593);
    bool _2601 = _2297 > 0.0;
    bool _2603 = isnan(_2297);
    bool _2605 = _2601 || _2603;
    bool _2607 = isnan(0.0);
    bool _2609 = _2605 || _2607;
    float _2611 = fma(_2597, 0.114477999508380889892578125, _2599);
    float _2613 = -_2611;
    float _2615 = _2591 + _2613;
    float _2617 = -_2611;
    float _2619 = _2585 + _2617;
    float _2621 = -_2611;
    float _2623 = _2597 + _2621;
    float _2625 = fma(_2615, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2611);
    float _2627 = fma(_2619, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2611);
    float _2629 = fma(_2623, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2611);
    bool _2631 = !_2595;
    if (!_2631)
    {
        float _2633 = -_1452;
        float _2635 = _2633 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2637 = -_1454;
        float _2639 = _2637 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2641 = -_1456;
        float _2643 = _2641 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2645 = _2635 * _2635;
        float _2647 = fma(_2639, _2639, _2645);
        float _2649 = fma(_2643, _2643, _2647);
        float _2651 = sqrt(_2649);
        float _2653 = rsqrt(_2649);
        float _2655 = -_2651;
        float _2657 = _2655 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2659 = _2657 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2661 = precise::clamp(_2659, 0.0, 1.0);
        float _2663 = _2639 * _2653;
        float _2665 = _2635 * _2653;
        float _2667 = abs(_2661);
        float _2669 = log2(_2667);
        float _2671 = _2643 * _2653;
        float _2673 = _2663 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2675 = _2195 * _2665;
        float _2677 = -_2665;
        float _2679 = -_2673;
        float _2681 = fma(_2677, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2679);
        float _2683 = fma(_2219, _2663, _2675);
        float _2685 = -_2671;
        float _2687 = fma(_2685, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2681);
        float _2689 = fma(_2203, _2671, _2683);
        float _2691 = precise::clamp(_2689, 0.0, 1.0);
        float _2693 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2695 = _2687 + _2693;
        float _2697 = _2669 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2699 = _2695 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2701 = precise::clamp(_2699, 0.0, 1.0);
        float _2703 = exp2(_2697);
        float _2705 = _2703 * _2701;
        float _2707 = _2691 * _2705;
        float _2709 = _2707 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2711 = _2707 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2713 = _2707 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _2709;
        out.m_90.y = _2711;
        out.m_90.z = _2713;
    }
    out.m_92.x = _2625;
    out.m_92.y = _2627;
    out.m_92.z = _2629;
    if (_2609)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_61.x = 0.0;
    float _2715 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2715;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2473 = false;
    bool _383 = false;
    bool _189 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_58.w;
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
        out.m_61.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2771 = as_type<float>(_127);
        out.gl_Position.z = _2771;
    }
    if (!_115)
    {
        return out;
    }
    float _129 = in.m_63.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = _143;
    if (_139)
    {
        float _147 = float(_111);
        _121 = _147;
    }
    float _149 = _121;
    bool _151 = _143 >= _149;
    bool _153 = !_139;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_61.x = 0.0;
    }
    int _161 = 0;
    if (_155)
    {
        float _163 = _159 * 5.0;
        _161 = as_type<int>(_163);
    }
    int _165 = _161;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2841 = as_type<float>(_165);
        out.gl_Position.z = _2841;
    }
    if (_155)
    {
        return out;
    }
    bool _167 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _169 = !_167;
    float _187;
    if (!_169)
    {
        float _171 = in.m_65.x;
        float _173 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _175 = _171 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _177 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _179 = _177 * _173;
        float _181 = floor(_179);
        float _183 = -_181;
        float _185 = _179 + _183;
        _187 = _185;
        _189 = true;
    }
    else
    {
        float _191 = float(_111);
        float _193 = 1.0 / _191;
        float _195 = _143 * _193;
        _187 = _195;
    }
    _189 = false;
    float _197 = _187;
    float _199 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _201 = _197 + _199;
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _205 = _197 + _203;
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _209 = _197 + _207;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _213 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _211;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _217 = _215 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _221 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _219;
    bool _223 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _225 = isnan(_197);
    bool _227 = _223 || _225;
    bool _229 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _231 = _227 || _229;
    float _233 = float(_231);
    float _235 = 1.0 / _213;
    bool _237 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _239 = 1.0 / _221;
    float _241 = 1.0 / _217;
    float _243 = _201 * _235;
    bool _245 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _247 = isnan(_197);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = -_233;
    float _259 = _257 + 1.0;
    float _261 = _255 * _259;
    float _263 = _205 * _239;
    bool _265 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _267 = isnan(_197);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    float _277 = -_255;
    float _279 = _277 + 1.0;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _283 = _281 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _285 = _275 * _279;
    float _287 = -_275;
    float _289 = _287 + 1.0;
    float _291 = _209 * _241;
    bool _293 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _295 = isnan(_197);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _305;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _317 = fma(_307, _243, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _319 = _303 * _289;
    float _321 = fma(_311, _243, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _323 = -_303;
    float _325 = _323 + 1.0;
    float _327 = _317 * _319;
    float _329 = _321 * _319;
    float _331 = fma(_283, _291, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _333 = fma(_315, _291, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _335 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[143].x, _327);
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _341;
    float _345 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[143].y, _329);
    float _347 = fma(_331, _285, _335);
    float _349 = fma(_339, _263, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _351 = fma(_343, _263, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _353 = fma(_333, _285, _345);
    float _355 = fma(_349, _261, _347);
    float _357 = fma(_351, _261, _353);
    float _359 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[146].x, _355);
    float _361 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[146].y, _357);
    bool _363 = !_237;
    float _381;
    if (!_363)
    {
        float _365 = in.m_65.x;
        float _367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _369 = _365 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _371 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[11].y, _143);
        float _373 = _371 * _367;
        float _375 = floor(_373);
        float _377 = -_375;
        float _379 = _373 + _377;
        _381 = _379;
        _383 = true;
    }
    else
    {
        float _385 = float(_111);
        float _387 = 1.0 / _385;
        float _389 = _143 * _387;
        _381 = _389;
    }
    _383 = false;
    float _391 = _381;
    float _393 = in.m_65.x;
    float _395 = in.m_65.y;
    float _397 = in.m_65.z;
    int _399 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _401 = _399 != 0;
    int _403 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _405 = _403 != 0;
    int _407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _409 = _407 != 0;
    float _411 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _413 = log2(_411);
    float _415 = in.m_58.x;
    float _417 = in.m_58.y;
    float _419 = in.m_58.z;
    float _421 = in.m_67.y;
    float _423 = _413 * _143;
    float _425 = _393 * 2.0;
    float _427 = _395 * 2.0;
    float _429 = _397 * 2.0;
    float _431 = floor(_427);
    float _433 = floor(_425);
    float _435 = floor(_429);
    bool _437 = _431 >= 0.0;
    bool _439 = isnan(_431);
    bool _441 = _437 || _439;
    bool _443 = isnan(0.0);
    bool _445 = _441 || _443;
    int _447 = _445 ? 0 : 1;
    bool _449 = _433 > 0.0;
    float _451 = _417 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _453 = _433 >= 0.0;
    bool _455 = isnan(_433);
    bool _457 = _453 || _455;
    bool _459 = isnan(0.0);
    bool _461 = _457 || _459;
    float _463 = _417 + _421;
    float _465 = _417 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _467 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[4].x, _451);
    int _469 = _461 ? 0 : 1;
    float _471 = _395 + _397;
    float _473 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[6].x, _465);
    bool _475 = _435 > 0.0;
    float _477 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[4].z, _467);
    bool _479 = !_405;
    int _481 = _479 ? 0 : 1;
    float _483 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[6].z, _473);
    int _485 = ~_469;
    int _487 = _485 + 1;
    int _489 = _487 + 1;
    float _491 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _493 = _463 + _491;
    bool _495 = _435 >= 0.0;
    bool _497 = isnan(_435);
    bool _499 = _495 || _497;
    bool _501 = isnan(0.0);
    bool _503 = _499 || _501;
    float _505 = _477 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _507 = _489;
    if (!_449)
    {
        int _509 = ~_469;
        int _511 = _509 + 1;
        _507 = _511;
    }
    int _513 = _507;
    float _515 = exp2(_423);
    int _517 = abs(_481);
    float _519 = _471 + (-1.0);
    bool _521 = _431 > 0.0;
    float _523 = _483 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _525 = _493 * _493;
    int _527 = _503 ? 0 : 1;
    float _529 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _531 = _505 + _529;
    float _533 = float(_517);
    float _535 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _537 = float(_513);
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _541 = 1.0 + _539;
    int _543 = ~_527;
    int _545 = _543 + 1;
    int _547 = _545 + 1;
    float _549 = fma(_531, _531, _525);
    int _551 = _547;
    float _553 = _523;
    if (!_475)
    {
        int _555 = ~_527;
        int _557 = _555 + 1;
        _551 = _557;
    }
    int _559 = _551;
    float _561 = _533 * _537;
    float _563 = 1.0 / _541;
    float _565 = in.m_69.x;
    float _567 = in.m_69.y;
    float _569 = in.m_69.z;
    bool _571 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _573 = isnan(1.0);
    bool _575 = _571 || _573;
    bool _577 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _579 = _575 || _577;
    float _581 = -_515;
    float _583 = _581 + 1.0;
    bool _585 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _587 = isnan(0.0);
    bool _589 = _585 || _587;
    bool _591 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _593 = _589 || _591;
    float _595 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _597 = _523 + _595;
    bool _599 = !_401;
    int _601 = _599 ? 0 : 1;
    float _603 = _593 ? _583 : 0.0;
    float _605 = fma(_597, _597, _549);
    int _607 = abs(_601);
    float _609 = _397 + _393;
    float _611 = float(_559);
    float _613 = _397 + (-0.5);
    float _615 = float(_607);
    float _617 = rsqrt(_605);
    if (_579)
    {
        float _619 = _603 * _563;
        _145 = _619;
    }
    float _621 = _145;
    float _623 = _561 * (-2.0);
    int _625 = ~_447;
    int _627 = _625 + 1;
    int _629 = _627 + 1;
    float _631 = _615 * _611;
    bool _633 = !_409;
    int _635 = _633 ? 0 : 1;
    float _637 = fma(_535, _623, _535);
    int _639 = _629;
    if (!_521)
    {
        int _641 = ~_447;
        int _643 = _641 + 1;
        _639 = _643;
    }
    int _645 = _639;
    float _647 = _609 + (-1.0);
    int _649 = abs(_635);
    float _651 = fma(_623, _567, _567);
    float _653 = _395 + (-0.5);
    float _655 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _657 = float(_649);
    float _659 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[196].y, _651);
    float _661 = _395 + _393;
    float _663 = float(_645);
    float _665 = _493 * _617;
    float _667 = fma(_637, _621, _659);
    float _669 = _661 + (-1.0);
    float _671 = _631 * (-2.0);
    float _673 = _657 * _663;
    float _675 = _531 * _617;
    float _677 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _679 = _393 + (-0.5);
    float _681 = fma(_671, _565, _565);
    float _683 = -_665;
    float _685 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[18].w, _493);
    float _687 = fma(_677, _671, _677);
    float _689 = _673 * (-2.0);
    float _691 = as_type<float>(int(gl_VertexIndex));
    float _693 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[196].x, _681);
    float _695 = -_675;
    float _697 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[18].w, _531);
    float _699 = fma(_689, _569, _569);
    float _701 = _685 * _685;
    float _703 = _597 * _617;
    float _705 = in.m_74.x;
    float _707 = in.m_74.y;
    float _709 = fma(_655, _689, _655);
    float _711 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[196].z, _699);
    float _713 = fma(_697, _697, _701);
    float _715 = -_703;
    float _717 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[18].w, _597);
    float _719 = fma(_687, _621, _693);
    float _721 = fma(_709, _621, _711);
    float _723 = _667 * 0.15915493667125701904296875;
    float _725 = fma(_717, _717, _713);
    float _727 = _719 * 0.15915493667125701904296875;
    float _729 = _721 * 0.15915493667125701904296875;
    float _731 = _723 * 6.283185482025146484375;
    float _733 = sin(_731);
    int _735 = as_type<int>(_691) & 1;
    bool _737 = _735 != 0;
    int _739 = as_type<int>(_691) & 2;
    bool _741 = _739 != 0;
    float _743 = sqrt(_725);
    float _745 = _359 * _705;
    float _747 = _361 * _707;
    bool _749 = !_737;
    float _751 = _749 ? (-0.5) : 0.5;
    float _753 = _723 * 6.283185482025146484375;
    float _755 = cos(_753);
    float _757 = _745 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _759 = !_741;
    float _761 = _759 ? (-0.5) : 0.5;
    float _763 = _747 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _765 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _761);
    float _767 = _727 * 6.283185482025146484375;
    float _769 = sin(_767);
    float _771 = _617 * _743;
    float _773 = _757 * _771;
    float _775 = _771 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _777 = _775 * 0.5;
    float _779 = _763 * _771;
    float _781 = _727 * 6.283185482025146484375;
    float _783 = cos(_781);
    float _785 = _779 * _765;
    float _787 = _729 * 6.283185482025146484375;
    float _789 = cos(_787);
    float _791 = _769 * _733;
    float _793 = _769 * _755;
    float _795 = _729 * 6.283185482025146484375;
    float _797 = sin(_795);
    float _799 = _783 * _755;
    float _801 = _783 * _733;
    float _803 = _769 * _789;
    float _805 = _755 * _789;
    float _807 = _783 * _789;
    float _809 = _733 * _789;
    float _811 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _751);
    float _813 = _807 * _777;
    float _815 = _773 * _811;
    float _817 = fma(_797, _799, _791);
    float _819 = -_793;
    float _821 = fma(_797, _801, _819);
    float _823 = _797 * _777;
    float _825 = -_801;
    float _827 = fma(_797, _793, _825);
    float _829 = fma(_817, _815, _813);
    float _831 = _803 * _777;
    float _833 = -_823;
    float _835 = fma(_805, _815, _833);
    float _837 = fma(_797, _791, _799);
    float _839 = -_785;
    float _841 = fma(_821, _839, _829);
    float _843 = fma(_827, _815, _831);
    float _845 = -_785;
    float _847 = fma(_809, _845, _835);
    float _849 = _841 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _851 = -_785;
    float _853 = fma(_837, _851, _843);
    float _855 = _841 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _857 = _841 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _859 = fma(_847, (*spvDescriptorSet0.vp_c10)._m0[10].x, _849);
    float _861 = fma(_847, (*spvDescriptorSet0.vp_c10)._m0[8].x, _855);
    float _863 = fma(_847, (*spvDescriptorSet0.vp_c10)._m0[9].x, _857);
    float _865 = fma(_853, (*spvDescriptorSet0.vp_c10)._m0[10].z, _859);
    float _867 = fma(_853, (*spvDescriptorSet0.vp_c10)._m0[8].z, _861);
    float _869 = fma(_853, (*spvDescriptorSet0.vp_c10)._m0[9].z, _863);
    float _871 = _523 + _865;
    float _873 = _505 + _867;
    float _875 = _463 + _869;
    float _877 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _879 = _871 + _877;
    float _881 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _883 = _873 + _881;
    float _885 = _879 * _879;
    float _887 = fma(_883, _883, _885);
    float _889 = sqrt(_887);
    bool _891 = _889 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _893 = 0.0;
    float _895 = _871;
    float _897 = _873;
    int _899 = as_type<int>(_883);
    float _901 = _675;
    if (!_891)
    {
        _893 = _875;
    }
    float _903 = _893;
    bool _905 = !_891;
    float _907 = _903;
    if (!_905)
    {
        float _909 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _911 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _913 = _889 + _911;
        float _915 = rsqrt(_887);
        float _917 = _913 * _909;
        float _919 = _875 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _921 = _917 * 0.15915493667125701904296875;
        float _923 = _921 * 6.283185482025146484375;
        float _925 = cos(_923);
        float _927 = _921 * 6.283185482025146484375;
        float _929 = sin(_927);
        float _931 = _925 + (-1.0);
        float _933 = fma(_929, _919, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _935 = _931 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _937 = _915 * _933;
        float _939 = fma(_875, _925, _935);
        float _941 = fma(_883, _937, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _943 = fma(_879, _937, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _895 = _943;
        _897 = _941;
        _907 = _939;
    }
    float _945 = _895;
    float _947 = _897;
    float _949 = _907;
    float _951 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _953 = _945 + _951;
    float _955 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _957 = _947 + _955;
    float _959 = fma(_953, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _961 = fma(_957, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4040 = float2(_961, _959);
    float _963 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4040, float2(0.0), isnan(_4040)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4040, float2(0.0), isnan(_4040)), level(0.0)).x;
    float _965 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _967 = -_675;
    float _969 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[18].w, _505);
    float _971 = -_703;
    float _973 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[18].w, _523);
    float _975 = fma(_963, 100.0, _463);
    float _977 = -_665;
    float _979 = fma(_977, (*spvDescriptorSet0.vp_c9)._m0[18].w, _975);
    float _981 = _979 + _965;
    float _983 = _981 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _985 = _981 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _987 = fma(_969, (*spvDescriptorSet0.vp_c15)._m0[126].x, _983);
    float _989 = fma(_969, (*spvDescriptorSet0.vp_c15)._m0[127].x, _985);
    float _991 = fma(_973, (*spvDescriptorSet0.vp_c15)._m0[126].z, _987);
    float _993 = fma(_973, (*spvDescriptorSet0.vp_c15)._m0[127].z, _989);
    float _995 = _991 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _997 = _993 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _999 = trunc(_995);
    int _1001 = int(_999);
    float _1003 = trunc(_997);
    int _1005 = int(_1003);
    int _1007 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1009 = _1001 + _1007;
    int _1011 = _1009 + 1;
    bool _1013 = _1011 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1015 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1017 = _1005 + _1015;
    int _1019 = _1017 + 1;
    int _1021 = _1011 | _1019;
    bool _1023 = _1021 < 0;
    bool _1025 = _1023 || _1013;
    bool _1027 = _1019 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1029 = _1027 || _1025;
    int _1031 = _1011;
    int _1033 = _1019;
    int _1035 = _1021;
    if (!_1029)
    {
        int _1037 = _1019 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1039 = _1037 + _1011;
        _1031 = _1039;
    }
    int _1041 = _1031;
    float _1043 = _993;
    if (!_1029)
    {
        float _1045 = floor(_997);
        _1043 = _1045;
    }
    float _1047 = _1043;
    if (!_1029)
    {
        int _1049 = _1041 << 2;
        _1033 = _1049;
    }
    int _1051 = _1033;
    int _1053 = _1051;
    if (!_1029)
    {
        uint _1056 = uint(int(uint(_1041) >> uint(2)));
        _1035 = int(_1056);
    }
    int _1058 = _1035;
    if (!_1029)
    {
        int _1060 = 12 & _1051;
        _1053 = _1060;
    }
    int _1062 = _1053;
    if (!_1029)
    {
        int _1064 = _1058 << 4;
        int _1066 = _1064 + _1062;
        _899 = _1066;
    }
    int _1068 = _899;
    float _1070 = as_type<float>(_1062);
    if (!_1029)
    {
        float _1072 = floor(_995);
        _1070 = _1072;
    }
    float _1074 = _1070;
    float _1076 = as_type<float>(_1058);
    if (!_1029)
    {
        int _1078 = _1068 + 400;
        uint _1080 = uint(int(uint(_1078) >> uint(2)));
        uint _1082 = uint(int(uint(int(_1080)) >> uint(2)));
        int _1084 = int(_1080) & 3;
        float _1086 = (*spvDescriptorSet0.vp_c15)._m0[int(_1082)][_1084];
        _1076 = _1086;
    }
    float _1088 = _1076;
    float _1090 = 0.0;
    if (!_1029)
    {
        float _1092 = -_1047;
        float _1094 = _997 + _1092;
        _1090 = _1094;
    }
    float _1096 = _1090;
    float _1098 = _1074;
    if (!_1029)
    {
        float _1100 = -_1074;
        float _1102 = _995 + _1100;
        _1098 = _1102;
    }
    float _1104 = _1098;
    float _1106 = _1088;
    if (!_1029)
    {
        float _1108 = rint(_1088);
        float _1110 = precise::max(_1108, 0.0);
        uint _1112 = uint(_1110);
        uint _1114 = clamp(_1112, 0u, 65535u);
        _1106 = as_type<float>(_1114);
    }
    float _1116 = _1106;
    float _1118 = _1096;
    if (!_1029)
    {
        float3 _4315 = float3(_1104, _1096, float(as_type<int>(_1116)));
        float3 _4319 = select(_4315, float3(0.0), isnan(_4315));
        float _1120 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4319.xy, uint(rint(_4319.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4319.xy, uint(rint(_4319.z)), level(0.0)).x;
        _1118 = _1120;
    }
    float _1122 = _1118;
    float _1124 = _979 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1126 = -_703;
    float _1128 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[18].w, _945);
    float _1130 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1124);
    float _1132 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1130);
    float _1134 = _979 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1136 = _1132 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1138 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1134);
    float _1140 = 1.0 / _1136;
    float _1142 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1138);
    float _1144 = _1142 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1146 = _1144 + _1136;
    float _1148 = _1146 * _1140;
    float _1150 = _1148 * 0.5;
    float _1152 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1154 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1152);
    float _1156 = 1.0 / _1154;
    float _1158 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1160 = _1156 * _1158;
    bool _1162 = _1160 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1164 = _1160 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1166 = !_1162;
    int _1168 = _1166 ? 0 : 1;
    int _1170 = 2;
    if (!_1162)
    {
        _1170 = 1;
    }
    int _1172 = _1170;
    int _1174 = _1172;
    if (!_1164)
    {
        _1174 = _1168;
    }
    int _1176 = _1174;
    bool _1178 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1180 = isnan(0.5);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1186 = _1182 || _1184;
    int _1188 = _1176 << 6;
    int _1190 = _1188 + 96;
    uint _1192 = uint(int(uint(_1190) >> uint(2)));
    uint _1194 = uint(int(uint(int(_1192)) >> uint(2)));
    int _1196 = int(_1192) & 3;
    float _1198 = (*spvDescriptorSet0.vp_c15)._m0[int(_1194)][_1196];
    int _1200 = int(_1192) + 1;
    uint _1202 = uint(int(uint(_1200) >> uint(2)));
    int _1204 = _1200 & 3;
    float _1206 = (*spvDescriptorSet0.vp_c15)._m0[int(_1202)][_1204];
    int _1208 = _1188 + 48;
    uint _1210 = uint(int(uint(_1208) >> uint(2)));
    uint _1212 = uint(int(uint(int(_1210)) >> uint(2)));
    int _1214 = int(_1210) & 3;
    float _1216 = (*spvDescriptorSet0.vp_c15)._m0[int(_1212)][_1214];
    int _1218 = int(_1210) + 1;
    uint _1220 = uint(int(uint(_1218) >> uint(2)));
    int _1222 = _1218 & 3;
    float _1224 = (*spvDescriptorSet0.vp_c15)._m0[int(_1220)][_1222];
    int _1226 = _1188 + 104;
    uint _1228 = uint(int(uint(_1226) >> uint(2)));
    uint _1230 = uint(int(uint(int(_1228)) >> uint(2)));
    int _1232 = int(_1228) & 3;
    float _1234 = (*spvDescriptorSet0.vp_c15)._m0[int(_1230)][_1232];
    int _1236 = int(_1228) + 1;
    uint _1238 = uint(int(uint(_1236) >> uint(2)));
    int _1240 = _1236 & 3;
    float _1242 = (*spvDescriptorSet0.vp_c15)._m0[int(_1238)][_1240];
    int _1244 = _1188 + 80;
    uint _1246 = uint(int(uint(_1244) >> uint(2)));
    uint _1248 = uint(int(uint(int(_1246)) >> uint(2)));
    int _1250 = int(_1246) & 3;
    float _1252 = (*spvDescriptorSet0.vp_c15)._m0[int(_1248)][_1250];
    int _1254 = int(_1246) + 1;
    uint _1256 = uint(int(uint(_1254) >> uint(2)));
    int _1258 = _1254 & 3;
    float _1260 = (*spvDescriptorSet0.vp_c15)._m0[int(_1256)][_1258];
    int _1262 = _1188 + 64;
    uint _1264 = uint(int(uint(_1262) >> uint(2)));
    uint _1266 = uint(int(uint(int(_1264)) >> uint(2)));
    int _1268 = int(_1264) & 3;
    float _1270 = (*spvDescriptorSet0.vp_c15)._m0[int(_1266)][_1268];
    int _1272 = int(_1264) + 1;
    uint _1274 = uint(int(uint(_1272) >> uint(2)));
    int _1276 = _1272 & 3;
    float _1278 = (*spvDescriptorSet0.vp_c15)._m0[int(_1274)][_1276];
    int _1280 = _1188 + 88;
    uint _1282 = uint(int(uint(_1280) >> uint(2)));
    uint _1284 = uint(int(uint(int(_1282)) >> uint(2)));
    int _1286 = int(_1282) & 3;
    float _1288 = (*spvDescriptorSet0.vp_c15)._m0[int(_1284)][_1286];
    int _1290 = int(_1282) + 1;
    uint _1292 = uint(int(uint(_1290) >> uint(2)));
    int _1294 = _1290 & 3;
    float _1296 = (*spvDescriptorSet0.vp_c15)._m0[int(_1292)][_1294];
    int _1298 = _1188 + 56;
    uint _1300 = uint(int(uint(_1298) >> uint(2)));
    uint _1302 = uint(int(uint(int(_1300)) >> uint(2)));
    int _1304 = int(_1300) & 3;
    float _1306 = (*spvDescriptorSet0.vp_c15)._m0[int(_1302)][_1304];
    int _1308 = int(_1300) + 1;
    uint _1310 = uint(int(uint(_1308) >> uint(2)));
    int _1312 = _1308 & 3;
    float _1314 = (*spvDescriptorSet0.vp_c15)._m0[int(_1310)][_1312];
    float _1316 = _981 * _1206;
    float _1318 = fma(_963, 100.0, _949);
    float _1320 = fma(_969, _1198, _1316);
    float _1322 = -_665;
    float _1324 = fma(_1322, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1318);
    float _1326 = -_675;
    float _1328 = fma(_1326, (*spvDescriptorSet0.vp_c9)._m0[18].w, _947);
    int _1330 = _1188 + 72;
    uint _1332 = uint(int(uint(_1330) >> uint(2)));
    uint _1334 = uint(int(uint(int(_1332)) >> uint(2)));
    int _1336 = int(_1332) & 3;
    float _1338 = (*spvDescriptorSet0.vp_c15)._m0[int(_1334)][_1336];
    int _1340 = int(_1332) + 1;
    uint _1342 = uint(int(uint(_1340) >> uint(2)));
    int _1344 = _1340 & 3;
    float _1346 = (*spvDescriptorSet0.vp_c15)._m0[int(_1342)][_1344];
    float _1348 = _981 * _1224;
    float _1350 = fma(_969, _1216, _1348);
    float _1352 = fma(_973, _1234, _1320);
    float _1354 = _1352 + _1242;
    float _1356 = _981 * _1260;
    float _1358 = 1.0 / _1354;
    float _1360 = fma(_969, _1252, _1356);
    float _1362 = _981 * _1278;
    float _1364 = fma(_969, _1270, _1362);
    float _1366 = fma(_973, _1288, _1360);
    float _1368 = _1366 + _1296;
    float _1370 = _1366;
    float _1372 = _1296;
    float _1374 = _1328;
    float _1376 = _1368;
    float _1378 = _1278;
    if (_1186)
    {
        _1370 = _1128;
    }
    float _1380 = _1370;
    float _1382 = _1380;
    if (_1186)
    {
        _1372 = _1324;
    }
    float _1384 = _1372;
    float _1386 = fma(_973, _1306, _1350);
    float _1388 = _1386 + _1314;
    float _1390 = fma(_973, _1338, _1364);
    float _1392 = _1390 + _1346;
    float _1394 = _1384;
    if (!_1186)
    {
        float _1396 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1398 = _979 + _1396;
        float _1400 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1402 = _969 + _1400;
        float _1404 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1406 = -_523;
        float _1408 = _1406 + _945;
        float _1410 = _1398 * _1398;
        float _1412 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1414 = _973 + _1412;
        float _1416 = -_463;
        float _1418 = _1416 + _949;
        float _1420 = -_505;
        float _1422 = _1420 + _947;
        float _1424 = fma(_1402, _1402, _1410);
        float _1426 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1428 = fma(_1414, _1414, _1424);
        float _1430 = sqrt(_1428);
        float _1432 = 1.0 / _771;
        float _1434 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1436 = precise::min(_1430, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1438 = _1436 * _1404;
        float _1440 = _1438 * _1432;
        float _1442 = _1434 * _1440;
        float _1444 = _1408 * _1440;
        float _1446 = fma(_1418, _1442, _979);
        float _1448 = fma(_1422, _1442, _969);
        float _1450 = fma(_1434, _1444, _973);
        _1394 = _1446;
        _1374 = _1448;
        _1382 = _1450;
        _553 = _1444;
    }
    float _1452 = _1394;
    float _1454 = _1374;
    float _1456 = _1382;
    float _1458 = _553;
    float _1460 = _1388 * _1358;
    float _1462 = _1392 * _1358;
    float _1464 = _1368 * _1358;
    float _1466 = _1458;
    if (_1029)
    {
        _1466 = 1.0;
    }
    float _1468 = _1466;
    float _1470 = _1468;
    if (!_1029)
    {
        int _1472 = _1041 << 4;
        int _1474 = _1472 + 2048;
        uint _1476 = uint(int(uint(_1474) >> uint(2)));
        uint _1478 = uint(int(uint(int(_1476)) >> uint(2)));
        int _1480 = int(_1476) & 3;
        float _1482 = (*spvDescriptorSet0.vp_c15)._m0[int(_1478)][_1480];
        int _1484 = int(_1476) + 1;
        uint _1486 = uint(int(uint(_1484) >> uint(2)));
        int _1488 = _1484 & 3;
        float _1490 = (*spvDescriptorSet0.vp_c15)._m0[int(_1486)][_1488];
        int _1492 = _1474 + 8;
        uint _1494 = uint(int(uint(_1492) >> uint(2)));
        uint _1496 = uint(int(uint(int(_1494)) >> uint(2)));
        int _1498 = int(_1494) & 3;
        float _1500 = (*spvDescriptorSet0.vp_c15)._m0[int(_1496)][_1498];
        int _1502 = int(_1494) + 1;
        uint _1504 = uint(int(uint(_1502) >> uint(2)));
        int _1506 = _1502 & 3;
        float _1508 = (*spvDescriptorSet0.vp_c15)._m0[int(_1504)][_1506];
        float _1510 = _981 * _1490;
        float _1512 = fma(_969, _1482, _1510);
        float _1514 = fma(_973, _1500, _1512);
        float _1516 = _1514 + _1508;
        float _1518 = precise::clamp(_1516, 0.0, 1.0);
        float _1520 = -_1518;
        float _1522 = _1520 + _1122;
        float _1524 = fma(_1522, 500.0, 1.5);
        float _1526 = exp2(_1524);
        float _1528 = 0.0 + _1526;
        float _1530 = precise::clamp(_1528, 0.0, 1.0);
        _1470 = _1530;
    }
    float _1532 = _1470;
    float _1534 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1536 = _1452 + _1534;
    float _1538 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1540 = _1454 + _1538;
    float _1542 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1544 = _1456 + _1542;
    float _1546 = _1536 * _1536;
    float _1548 = fma(_1540, _1540, _1546);
    float _1550 = fma(_1544, _1544, _1548);
    float _1552 = rsqrt(_1550);
    float _1554 = sqrt(_1550);
    float _1556 = _1552 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1558 = _1540 * _1556;
    float _1560 = _1544 * _1556;
    float _1562 = _1558 * _1558;
    float _1564 = _1560 * _1560;
    float _1566 = _1562 + _1564;
    float _1568 = sqrt(_1566);
    bool _1570 = _1568 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1572 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1574 = _1568 + _1572;
    float _1576 = _1544;
    float _1578 = _1546;
    float _1580 = _1574;
    float _1582 = _1536;
    float _1584 = _1564;
    if (_1570)
    {
        float _1586 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1576 = _1586;
    }
    float _1588 = _1576;
    if (_1570)
    {
        float _1590 = rsqrt(_1566);
        _1578 = _1590;
    }
    float _1592 = _1578;
    float _1594 = _1592;
    if (_1570)
    {
        float _1596 = _1574 * _1588;
        _1580 = _1596;
    }
    float _1598 = _1580;
    if (_1570)
    {
        float _1600 = _1598 * 0.15915493667125701904296875;
        _1376 = _1600;
    }
    float _1602 = _1376;
    float _1604 = _1588;
    if (_1570)
    {
        float _1606 = _1602 * 6.283185482025146484375;
        float _1608 = sin(_1606);
        _1604 = _1608;
    }
    float _1610 = _1604;
    float _1612 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1614 = precise::max(0.0, _1612);
    float _1616 = _1552;
    float _1618 = _1614;
    if (_1570)
    {
        float _1620 = _1602 * 6.283185482025146484375;
        float _1622 = cos(_1620);
        _1616 = _1622;
    }
    float _1624 = _1616;
    float _1626 = -_1556;
    float _1628 = -_1614;
    float _1630 = fma(_1536, _1626, _1628);
    if (_1570)
    {
        float _1632 = _1630 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1618 = _1632;
    }
    float _1634 = _1618;
    float _1636 = _1634;
    float _1638 = _1610;
    if (_1570)
    {
        float _1640 = fma(_1610, _1634, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1636 = _1640;
    }
    float _1642 = _1636;
    float _1644 = _1642;
    if (!_1570)
    {
        _1638 = _1558;
    }
    float _1646 = _1638;
    float _1648 = _1646;
    float _1650 = _1624;
    if (_1570)
    {
        float _1652 = _1624 + (-1.0);
        _1582 = _1652;
    }
    float _1654 = _1582;
    float _1656 = _1654;
    if (_1570)
    {
        float _1658 = _1592 * _1642;
        _901 = _1658;
    }
    float _1660 = _901;
    if (!_1570)
    {
        _1644 = _1630;
    }
    float _1662 = _1644;
    float _1664 = _1662;
    if (_1570)
    {
        float _1666 = _1654 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1378 = _1666;
    }
    float _1668 = _1378;
    if (_1570)
    {
        float _1670 = _1558 * _1660;
        _1648 = _1670;
    }
    float _1672 = _1648;
    if (!_1570)
    {
        _1594 = _1560;
    }
    float _1674 = _1594;
    float _1676 = _1674;
    if (_1570)
    {
        float _1678 = _1560 * _1660;
        _1676 = _1678;
    }
    float _1680 = _1676;
    if (!_1570)
    {
        _1656 = _1562;
    }
    float _1682 = _1656;
    float _1684 = _1682;
    if (_1570)
    {
        float _1686 = fma(_1630, _1624, _1668);
        _1664 = _1686;
    }
    float _1688 = _1664;
    if (_1570)
    {
        float _1690 = _1672 * _1672;
        _1684 = _1690;
    }
    float _1692 = _1684;
    if (!_1570)
    {
        _1650 = _1564;
    }
    float _1694 = _1650;
    float _1696 = _1694;
    if (_1570)
    {
        float _1698 = _1680 * _1680;
        _1696 = _1698;
    }
    float _1700 = _1696;
    float _1702 = _1452 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1704 = fma(_1688, _1688, _1692);
    float _1706 = _1452 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1708 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1702);
    float _1710 = _1704 + _1700;
    bool _1712 = _1460 >= 0.0;
    float _1714 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1716 = fma(_1554, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1714);
    float _1718 = precise::clamp(_1716, 0.0, 1.0);
    float _1720 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1708);
    float _1722 = rsqrt(_1710);
    float _1724 = -_1718;
    float _1726 = _1724 + 1.0;
    float _1728 = _1720 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1730 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _1732 = _1460 <= 1.0;
    bool _1734 = _1732 && _1712;
    float _1736 = fma(_969, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1738 = abs(_1726);
    float _1740 = log2(_1738);
    float _1742 = _1728 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1744 = _1462 >= 0.0;
    bool _1746 = _1744 && _1734;
    float _1748 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1706);
    bool _1750 = _1462 <= 1.0;
    bool _1752 = _1750 && _1746;
    float _1754 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1748);
    float _1756 = _1722 * _1672;
    float _1758 = fma(_973, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1760 = -_1742;
    float _1762 = fma(_1760, _1730, 1.0);
    float _1764 = _1722 * _1688;
    float _1766 = _1756 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1768 = _1452 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1770 = _1722 * _1680;
    float _1772 = _1452 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1774 = -_1766;
    float _1776 = fma(_1764, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1774);
    float _1778 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1768);
    float _1780 = floor(_1758);
    float _1782 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1772);
    float _1784 = -_1770;
    float _1786 = fma(_1784, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1776);
    float _1788 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1778);
    float _1790 = _1740 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1792 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1782);
    float _1794 = _1754 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1796 = _1788 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1798 = floor(_1736);
    float _1800 = _1792 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    if (_1752)
    {
        float _1802 = float(_1176);
        _1584 = _1802;
    }
    float _1804 = _1584;
    float _1806 = _1796 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1808 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1806);
    float _1810 = log2(_1762);
    float _1812 = -_1780;
    float _1814 = _1758 + _1812;
    float _1816 = _1796 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1818 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1808);
    float _1820 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1818);
    float _1822 = exp2(_1790);
    float _1824 = fma(_1786, -0.5, 0.5);
    float _1826 = -_1798;
    float _1828 = _1736 + _1826;
    float _1830 = _1796 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1832 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1816);
    float _1834 = fma(_1786, 0.5, 0.5);
    float _1836 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1830);
    float _1838 = 1.0 / _1820;
    float _1840 = _1764 + 1.0;
    float _1842 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1836);
    float _1844 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1832);
    float _1846 = fma(_1834, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1848 = sqrt(_1824);
    float _1850 = -_1764;
    float _1852 = fma(_1822, _1840, _1850);
    float _1854 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1842);
    float _1856 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1844);
    float _1858 = fma(_1834, _1846, -0.212114393711090087890625);
    float _1860 = _1810 * 0.693147182464599609375;
    float _1862 = _1804;
    float _1864 = _1820;
    if (_1752)
    {
        float _1866 = rint(_1804);
        float _1868 = precise::max(_1866, 0.0);
        uint _1870 = uint(_1868);
        uint _1872 = clamp(_1870, 0u, 65535u);
        _1862 = as_type<float>(_1872);
    }
    float _1874 = _1862;
    float _1876 = _1854 * _1838;
    float _1878 = _1856 * _1838;
    float2 _5561 = float2(_1828, _1814);
    float _1880 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5561, float2(0.0), isnan(_5561)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5561, float2(0.0), isnan(_5561)), level(0.0)).x;
    float _1882 = fma(_1834, _1858, 1.570728778839111328125);
    float _1884 = _1860 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1886 = fma(_1876, 0.5, 0.5);
    float _1888 = fma(_1878, -0.5, 0.5);
    float _1890 = _1848 * 0.636619746685028076171875;
    float _1892 = -_1882;
    float _1894 = fma(_1890, _1892, 1.0);
    float _1896 = fma(_1852, 0.5, 0.5);
    float _1898 = _1874;
    if (_1752)
    {
        float3 _5597 = float3(_1460, _1462, float(as_type<int>(_1874)));
        float3 _5599 = select(_5597, float3(0.0), isnan(_5597));
        float _1900 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5599.xy, uint(rint(_5599.z)), _1464, level(0.0));
        _1898 = _1900;
    }
    float _1902 = _1898;
    float3 _5609 = float3(_1886, _1888, _1884);
    float _1904 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5609, float3(0.0), isnan(_5609)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5609, float3(0.0), isnan(_5609)), level(0.0)).x;
    float3 _5618 = float3(_1886, _1888, _1884);
    float4 _1907 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5618, float3(0.0), isnan(_5618)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5618, float3(0.0), isnan(_5618)), level(0.0)).xyzw;
    float _1909 = _1907.x;
    float _1911 = _1907.y;
    float _1913 = _1907.z;
    float _1915 = _1907.w;
    float2 _5634 = float2(_1894, _1896);
    float3 _1919 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5634, float2(0.0), isnan(_5634)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5634, float2(0.0), isnan(_5634)), level(0.0)).xyz;
    float _1921 = _1919.x;
    float _1923 = _1919.y;
    float _1925 = _1919.z;
    float _1927 = _1740 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1929 = _1796 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1931 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1933 = _1931 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1935 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1937 = _1935 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1939 = _393 > 0.5;
    float _1941 = 1.0 / _1933;
    bool _1943 = _395 > 0.5;
    float _1945 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1947 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1945;
    float _1949 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1951 = _1949 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1953 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1955 = _391 + _1953;
    bool _1957 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1959 = isnan(_391);
    bool _1961 = _1957 || _1959;
    bool _1963 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1965 = _1961 || _1963;
    float _1967 = float(_1965);
    float _1969 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1971 = _1969 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _1973 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1975 = isnan(_391);
    bool _1977 = _1973 || _1975;
    bool _1979 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1981 = _1977 || _1979;
    float _1983 = float(_1981);
    float _1985 = 1.0 / _1937;
    bool _1987 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1989 = isnan(_391);
    bool _1991 = _1987 || _1989;
    bool _1993 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1995 = _1991 || _1993;
    float _1997 = float(_1995);
    float _1999 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1929);
    float _2001 = -_1997;
    float _2003 = _2001 + 1.0;
    int _2005 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2007 = _2005 != 0;
    float _2009 = _1947 * _1941;
    float _2011 = 1.0 / _1951;
    float _2013 = fma(_2009, _1955, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _2015 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2017 = isnan(_391);
    bool _2019 = _2015 || _2017;
    bool _2021 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2023 = _2019 || _2021;
    float _2025 = float(_2023);
    int _2027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2029 = _2027 != 0;
    float _2031 = exp2(_1927);
    float _2033 = -_2025;
    float _2035 = _2033 + 1.0;
    float _2037 = _2025 * _2003;
    float _2039 = -_1967;
    float _2041 = _2039 + 1.0;
    float _2043 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2045 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _2043;
    float _2047 = _1983 * _2035;
    float _2049 = -_751;
    int _2051 = _1939 ? as_type<int>(_2049) : as_type<int>(_751);
    float _2053 = _1997 * _2041;
    float _2055 = _2045 * _1985;
    float _2057 = _1971 * _2011;
    float _2059 = _2013 * _2047;
    float _2061 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2063 = _391 + _2061;
    float _2065 = -_1983;
    float _2067 = _2065 + 1.0;
    float _2069 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2071 = _391 + _2069;
    float _2073 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2075 = fma(_2057, _2063, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2077 = fma(_2067, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2059);
    float _2079 = fma(_2055, _2071, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _2081 = !_2007;
    float _2083 = _2081 ? _751 : as_type<float>(_2051);
    float _2085 = -_2031;
    float _2087 = _2085 + 1.0;
    float _2089 = fma(_2075, _2037, _2077);
    float _2091 = -_761;
    int _2093 = _1943 ? as_type<int>(_2091) : as_type<int>(_761);
    float _2095 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2097 = _2083 + 0.5;
    float _2099 = fma(_2079, _2053, _2089);
    float _2101 = _751 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2103 = !_2029;
    float _2105 = _2103 ? _761 : as_type<float>(_2093);
    float _2107 = _2097 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2109 = -_797;
    float _2111 = fma(_805, _2101, _2109);
    float _2113 = fma(_817, _2101, _807);
    float _2115 = _761 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2117 = fma(_827, _2101, _803);
    float _2119 = -_2105;
    float _2121 = _2119 + 0.5;
    float _2123 = -_2115;
    float _2125 = fma(_837, _2123, _2117);
    float _2127 = _2107 * _2073;
    float _2129 = abs(_1160);
    float _2131 = log2(_2129);
    float _2133 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2135 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2137 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2139 = _2121 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2141 = _2133 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2143 = _2135 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2145 = _2137 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2147 = _2139 * _2095;
    float _2149 = -_2115;
    float _2151 = fma(_821, _2149, _2113);
    float _2153 = -_2115;
    float _2155 = fma(_809, _2153, _2111);
    out.m_76.x = _2141;
    out.m_76.y = _2143;
    out.m_76.z = _2145;
    bool _2157 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2159 = isnan(0.5);
    bool _2161 = _2157 || _2159;
    bool _2163 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2165 = _2161 || _2163;
    float _2167 = fma(_1967, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2099);
    float _2169 = _2131 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.m_78.x = _2127;
    out.m_78.y = _2147;
    float _2171 = _2167 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2173 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2175 = exp2(_2169);
    float _2177 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2179 = _2151 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2181 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2183 = _2173 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2185 = _2151 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2187 = fma(_2155, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2179);
    float _2189 = _2177 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2191 = _2181 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2193 = fma(_2155, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2185);
    float _2195 = fma(_2125, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2187);
    float _2197 = _2147;
    if (!_2165)
    {
        _2197 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2199 = _2197;
    float _2201 = _2151 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2203 = fma(_2125, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2193);
    out.m_80.x = _2183;
    out.m_80.y = _2189;
    out.m_80.z = _2191;
    out.m_80.w = _2171;
    float _2205 = fma(_2175, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2207 = precise::clamp(_2205, 0.0, 1.0);
    float _2209 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1999);
    float _2211 = fma(_2155, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2201);
    float _2213 = fma(_2207, -2.0, 3.0);
    float _2215 = _2207 * _2207;
    float _2217 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2209);
    float _2219 = fma(_2125, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2211);
    float _2221 = _2215 * _2213;
    float _2223 = _2213;
    float _2225 = _2199;
    float _2227 = _2221;
    float _2229 = _2217;
    if (!_2165)
    {
        float _2231 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2233 = _2199 + _2231;
        _2223 = _2233;
    }
    float _2235 = _2223;
    if (!_2165)
    {
        float _2237 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2239 = _1160 + _2237;
        _2225 = _2239;
    }
    float _2241 = _2225;
    bool _2243 = _1160 <= 8000.0;
    bool _2245 = isnan(_1160);
    bool _2247 = _2243 || _2245;
    bool _2249 = isnan(8000.0);
    bool _2251 = _2247 || _2249;
    float _2253 = float(_2251);
    float _2255 = -_2221;
    float _2257 = _2255 + 1.0;
    float _2259 = _803;
    if (!_2165)
    {
        float _2261 = 1.0 / _2235;
        _2259 = _2261;
    }
    float _2263 = _2259;
    out.gl_Position.x = _1854;
    out.gl_Position.y = _1856;
    out.gl_Position.z = _2217;
    out.gl_Position.w = _1820;
    float _2265 = _2217 + _1820;
    float _2267 = fma(_2257, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2221);
    float _2269 = _1854 + _1820;
    float _2271 = _2265 * 0.5;
    float _2273 = _2253 * _2267;
    float _2275 = _2269 * 0.5;
    float _2277 = _1820 * 0.5;
    out.m_82.x = _2219;
    out.m_82.y = _2195;
    out.m_82.z = _2203;
    float _2279 = _2273 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2281 = _2277;
    if (_2165)
    {
        _2227 = 1.0;
    }
    float _2283 = _2227;
    float _2285 = fma(_1856, -0.5, _2277);
    float _2287 = _2283;
    if (!_1752)
    {
        _2281 = 1.0;
    }
    float _2289 = _2281;
    float _2291 = _2289;
    if (!_2165)
    {
        float _2293 = _2241 * _2263;
        float _2295 = precise::clamp(_2293, 0.0, 1.0);
        _2287 = _2295;
    }
    float _2297 = _2287;
    out.m_84.x = _2275;
    out.m_84.y = _2285;
    out.m_84.z = _2271;
    out.m_84.w = _1820;
    float _2299 = -_1880;
    float _2301 = _2299 + 1.0;
    float _2303 = _2301 * _2279;
    float _2305 = precise::clamp(_2303, 0.0, 1.0);
    float _2307 = -_2305;
    float _2309 = fma(_2307, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2311 = _1909;
    if (_1752)
    {
        bool _2313 = _1902 >= _1464;
        bool _2315 = isnan(_1902);
        bool _2317 = _2313 || _2315;
        bool _2319 = isnan(_1464);
        bool _2321 = _2317 || _2319;
        float _2323 = float(_2321);
        _2291 = _2323;
    }
    float _2325 = _2291;
    float _2327 = _2087 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2329 = _1554 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2331 = isnan(_1554);
    bool _2333 = _2329 || _2331;
    bool _2335 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2337 = _2333 || _2335;
    float _2339 = _2325 * _1532;
    float _2341 = _2327 * _1904;
    float _2343 = -_2327;
    float _2345 = _2343 + 1.0;
    float _2347 = -_2339;
    float _2349 = fma(_2347, _2309, 1.0);
    float _2351 = precise::clamp(_2349, 0.0, 1.0);
    float _2353 = _1915 * _2341;
    float _2355 = _1925 * _2341;
    float _2357 = _1915 * _2345;
    float _2359 = _2351 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2361 = fma(_1921, _2353, _1909);
    float _2363 = fma(_1923, _2353, _1911);
    float _2365 = fma(_1915, _2355, _1913);
    float _2367 = _2297 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_86.x = _2359;
    float _2369 = _2327;
    float _2371 = _2353;
    float _2373 = _2345;
    if (!_2337)
    {
        _2369 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2375 = _2369;
    float _2377 = _2375;
    float _2379 = _2375;
    if (!_2337)
    {
        _2311 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2381 = _2311;
    out.m_88.x = _2361;
    out.m_88.y = _2363;
    out.m_88.z = _2365;
    out.m_88.w = _2357;
    float _2383 = _2381;
    float _2385 = _2381;
    if (!_2337)
    {
        _1864 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2387 = _1864;
    float _2389 = _2387;
    float _2391 = _2387;
    if (!_2337)
    {
        _2229 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2393 = _2229;
    float _2395 = _2393;
    float _2397 = _2393;
    if (!_2337)
    {
        _2371 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2399 = _2371;
    float _2401 = _2399;
    float _2403 = _2399;
    if (!_2337)
    {
        _2373 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2405 = _2373;
    bool _2407 = !_2337;
    float _2409 = _2405;
    float _2411 = _2405;
    if (!_2407)
    {
        bool _2413 = _1554 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2415 = isnan(_1554);
        bool _2417 = _2413 || _2415;
        bool _2419 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2421 = _2417 || _2419;
        if (!_2421)
        {
            float _2423 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2425 = _1554 + _2423;
            float _2427 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2429 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2427;
            float _2431 = 1.0 / _2429;
            float _2433 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2435 = _2433 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2437 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2439 = _2437 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2441 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2443 = _2441 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2445 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2447 = _2445 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2449 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2451 = _2449 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2453 = _2425 * _2431;
            float _2455 = precise::clamp(_2453, 0.0, 1.0);
            float _2457 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2459 = _2457 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2461 = fma(_2455, _2435, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2463 = fma(_2455, _2459, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2465 = fma(_2455, _2439, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2467 = fma(_2455, _2443, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2469 = fma(_2455, _2447, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2471 = fma(_2455, _2451, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2385 = _2463;
            _2403 = _2469;
            _2379 = _2461;
            _2397 = _2467;
            _2391 = _2465;
            _2411 = _2471;
            _2473 = true;
        }
        else
        {
            bool _2475 = _1554 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2477 = isnan(_1554);
            bool _2479 = _2475 || _2477;
            bool _2481 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2483 = _2479 || _2481;
            if (!_2483)
            {
                _2377 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2485 = _2377;
            _2379 = _2485;
            if (!_2483)
            {
                _2383 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2487 = _2383;
            _2385 = _2487;
            if (!_2483)
            {
                _2389 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2489 = _2389;
            _2391 = _2489;
            if (!_2483)
            {
                _2395 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2491 = _2395;
            _2397 = _2491;
            if (!_2483)
            {
                _2401 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2493 = _2401;
            _2403 = _2493;
            if (!_2483)
            {
                _2409 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2495 = _2409;
            bool _2497 = !_2483;
            _2411 = _2495;
            if (!_2497)
            {
                bool _2499 = _1554 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2501 = isnan(_1554);
                bool _2503 = _2499 || _2501;
                bool _2505 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2507 = _2503 || _2505;
                if (!_2507)
                {
                    float _2509 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2511 = _1554 + _2509;
                    float _2513 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2515 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2513;
                    float _2517 = 1.0 / _2515;
                    float _2519 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2521 = _2519 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2523 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2525 = _2523 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2527 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2529 = _2527 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2531 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2533 = _2531 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2535 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2537 = _2535 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2539 = _2511 * _2517;
                    float _2541 = precise::clamp(_2539, 0.0, 1.0);
                    float _2543 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2545 = _2543 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2547 = fma(_2541, _2521, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2549 = fma(_2541, _2545, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2551 = fma(_2541, _2525, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2553 = fma(_2541, _2529, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2555 = fma(_2541, _2533, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2557 = fma(_2541, _2537, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2385 = _2549;
                    _2403 = _2555;
                    _2379 = _2547;
                    _2397 = _2553;
                    _2391 = _2551;
                    _2411 = _2557;
                    _2473 = true;
                }
                else
                {
                    _2385 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2403 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2379 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2397 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2391 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2411 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2473 = false;
    float _2559 = _2385;
    float _2561 = _2403;
    float _2563 = _2379;
    float _2565 = _2397;
    float _2567 = _2391;
    float _2569 = _2411;
    float _2571 = fma(_2195, -0.5, 0.5);
    float _2573 = precise::clamp(_2571, 0.0, 1.0);
    float _2575 = -_2559;
    float _2577 = _2575 + _2561;
    float _2579 = _2367 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2581 = -_2563;
    float _2583 = _2581 + _2565;
    float _2585 = fma(_2573, _2577, _2559);
    out.m_90.x = 0.0;
    float _2587 = -_2567;
    float _2589 = _2587 + _2569;
    float _2591 = fma(_2573, _2583, _2563);
    float _2593 = _2585 * 0.586610972881317138671875;
    out.m_61.x = _2579;
    bool _2595 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2597 = fma(_2573, _2589, _2567);
    float _2599 = fma(_2591, 0.298911988735198974609375, _2593);
    bool _2601 = _2297 > 0.0;
    bool _2603 = isnan(_2297);
    bool _2605 = _2601 || _2603;
    bool _2607 = isnan(0.0);
    bool _2609 = _2605 || _2607;
    float _2611 = fma(_2597, 0.114477999508380889892578125, _2599);
    float _2613 = -_2611;
    float _2615 = _2591 + _2613;
    float _2617 = -_2611;
    float _2619 = _2585 + _2617;
    float _2621 = -_2611;
    float _2623 = _2597 + _2621;
    float _2625 = fma(_2615, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2611);
    float _2627 = fma(_2619, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2611);
    float _2629 = fma(_2623, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2611);
    bool _2631 = !_2595;
    if (!_2631)
    {
        float _2633 = -_1452;
        float _2635 = _2633 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2637 = -_1454;
        float _2639 = _2637 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2641 = -_1456;
        float _2643 = _2641 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2645 = _2635 * _2635;
        float _2647 = fma(_2639, _2639, _2645);
        float _2649 = fma(_2643, _2643, _2647);
        float _2651 = sqrt(_2649);
        float _2653 = rsqrt(_2649);
        float _2655 = -_2651;
        float _2657 = _2655 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2659 = _2657 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2661 = precise::clamp(_2659, 0.0, 1.0);
        float _2663 = _2639 * _2653;
        float _2665 = _2635 * _2653;
        float _2667 = abs(_2661);
        float _2669 = log2(_2667);
        float _2671 = _2643 * _2653;
        float _2673 = _2663 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2675 = _2195 * _2665;
        float _2677 = -_2665;
        float _2679 = -_2673;
        float _2681 = fma(_2677, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2679);
        float _2683 = fma(_2219, _2663, _2675);
        float _2685 = -_2671;
        float _2687 = fma(_2685, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2681);
        float _2689 = fma(_2203, _2671, _2683);
        float _2691 = precise::clamp(_2689, 0.0, 1.0);
        float _2693 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2695 = _2687 + _2693;
        float _2697 = _2669 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2699 = _2695 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2701 = precise::clamp(_2699, 0.0, 1.0);
        float _2703 = exp2(_2697);
        float _2705 = _2703 * _2701;
        float _2707 = _2691 * _2705;
        float _2709 = _2707 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2711 = _2707 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2713 = _2707 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _2709;
        out.m_90.y = _2711;
        out.m_90.z = _2713;
    }
    out.m_92.x = _2625;
    out.m_92.y = _2627;
    out.m_92.z = _2629;
    if (_2609)
    {
        return out;
    }
    out.m_61.x = 0.0;
    float _2715 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2715;
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
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2473 = false;
    bool _383 = false;
    bool _189 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_58.w;
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
        out.m_61.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2771 = as_type<float>(_127);
        out.gl_Position.z = _2771;
    }
    if (!_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = in.m_63.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = _143;
    if (_139)
    {
        float _147 = float(_111);
        _121 = _147;
    }
    float _149 = _121;
    bool _151 = _143 >= _149;
    bool _153 = !_139;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_61.x = 0.0;
    }
    int _161 = 0;
    if (_155)
    {
        float _163 = _159 * 5.0;
        _161 = as_type<int>(_163);
    }
    int _165 = _161;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2841 = as_type<float>(_165);
        out.gl_Position.z = _2841;
    }
    if (_155)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _167 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _169 = !_167;
    float _187;
    if (!_169)
    {
        float _171 = in.m_65.x;
        float _173 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _175 = _171 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _177 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _179 = _177 * _173;
        float _181 = floor(_179);
        float _183 = -_181;
        float _185 = _179 + _183;
        _187 = _185;
        _189 = true;
    }
    else
    {
        float _191 = float(_111);
        float _193 = 1.0 / _191;
        float _195 = _143 * _193;
        _187 = _195;
    }
    _189 = false;
    float _197 = _187;
    float _199 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _201 = _197 + _199;
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _205 = _197 + _203;
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _209 = _197 + _207;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _213 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _211;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _217 = _215 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _221 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _219;
    bool _223 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _225 = isnan(_197);
    bool _227 = _223 || _225;
    bool _229 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _231 = _227 || _229;
    float _233 = float(_231);
    float _235 = 1.0 / _213;
    bool _237 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _239 = 1.0 / _221;
    float _241 = 1.0 / _217;
    float _243 = _201 * _235;
    bool _245 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _247 = isnan(_197);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = -_233;
    float _259 = _257 + 1.0;
    float _261 = _255 * _259;
    float _263 = _205 * _239;
    bool _265 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _267 = isnan(_197);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    float _277 = -_255;
    float _279 = _277 + 1.0;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _283 = _281 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _285 = _275 * _279;
    float _287 = -_275;
    float _289 = _287 + 1.0;
    float _291 = _209 * _241;
    bool _293 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _295 = isnan(_197);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _305;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _317 = fma(_307, _243, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _319 = _303 * _289;
    float _321 = fma(_311, _243, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _323 = -_303;
    float _325 = _323 + 1.0;
    float _327 = _317 * _319;
    float _329 = _321 * _319;
    float _331 = fma(_283, _291, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _333 = fma(_315, _291, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _335 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[143].x, _327);
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _341;
    float _345 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[143].y, _329);
    float _347 = fma(_331, _285, _335);
    float _349 = fma(_339, _263, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _351 = fma(_343, _263, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _353 = fma(_333, _285, _345);
    float _355 = fma(_349, _261, _347);
    float _357 = fma(_351, _261, _353);
    float _359 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[146].x, _355);
    float _361 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[146].y, _357);
    bool _363 = !_237;
    float _381;
    if (!_363)
    {
        float _365 = in.m_65.x;
        float _367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _369 = _365 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _371 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[11].y, _143);
        float _373 = _371 * _367;
        float _375 = floor(_373);
        float _377 = -_375;
        float _379 = _373 + _377;
        _381 = _379;
        _383 = true;
    }
    else
    {
        float _385 = float(_111);
        float _387 = 1.0 / _385;
        float _389 = _143 * _387;
        _381 = _389;
    }
    _383 = false;
    float _391 = _381;
    float _393 = in.m_65.x;
    float _395 = in.m_65.y;
    float _397 = in.m_65.z;
    int _399 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _401 = _399 != 0;
    int _403 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _405 = _403 != 0;
    int _407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _409 = _407 != 0;
    float _411 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _413 = log2(_411);
    float _415 = in.m_58.x;
    float _417 = in.m_58.y;
    float _419 = in.m_58.z;
    float _421 = in.m_67.y;
    float _423 = _413 * _143;
    float _425 = _393 * 2.0;
    float _427 = _395 * 2.0;
    float _429 = _397 * 2.0;
    float _431 = floor(_427);
    float _433 = floor(_425);
    float _435 = floor(_429);
    bool _437 = _431 >= 0.0;
    bool _439 = isnan(_431);
    bool _441 = _437 || _439;
    bool _443 = isnan(0.0);
    bool _445 = _441 || _443;
    int _447 = _445 ? 0 : 1;
    bool _449 = _433 > 0.0;
    float _451 = _417 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _453 = _433 >= 0.0;
    bool _455 = isnan(_433);
    bool _457 = _453 || _455;
    bool _459 = isnan(0.0);
    bool _461 = _457 || _459;
    float _463 = _417 + _421;
    float _465 = _417 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _467 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[4].x, _451);
    int _469 = _461 ? 0 : 1;
    float _471 = _395 + _397;
    float _473 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[6].x, _465);
    bool _475 = _435 > 0.0;
    float _477 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[4].z, _467);
    bool _479 = !_405;
    int _481 = _479 ? 0 : 1;
    float _483 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[6].z, _473);
    int _485 = ~_469;
    int _487 = _485 + 1;
    int _489 = _487 + 1;
    float _491 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _493 = _463 + _491;
    bool _495 = _435 >= 0.0;
    bool _497 = isnan(_435);
    bool _499 = _495 || _497;
    bool _501 = isnan(0.0);
    bool _503 = _499 || _501;
    float _505 = _477 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _507 = _489;
    if (!_449)
    {
        int _509 = ~_469;
        int _511 = _509 + 1;
        _507 = _511;
    }
    int _513 = _507;
    float _515 = exp2(_423);
    int _517 = abs(_481);
    float _519 = _471 + (-1.0);
    bool _521 = _431 > 0.0;
    float _523 = _483 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _525 = _493 * _493;
    int _527 = _503 ? 0 : 1;
    float _529 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _531 = _505 + _529;
    float _533 = float(_517);
    float _535 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _537 = float(_513);
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _541 = 1.0 + _539;
    int _543 = ~_527;
    int _545 = _543 + 1;
    int _547 = _545 + 1;
    float _549 = fma(_531, _531, _525);
    int _551 = _547;
    float _553 = _523;
    if (!_475)
    {
        int _555 = ~_527;
        int _557 = _555 + 1;
        _551 = _557;
    }
    int _559 = _551;
    float _561 = _533 * _537;
    float _563 = 1.0 / _541;
    float _565 = in.m_69.x;
    float _567 = in.m_69.y;
    float _569 = in.m_69.z;
    bool _571 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _573 = isnan(1.0);
    bool _575 = _571 || _573;
    bool _577 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _579 = _575 || _577;
    float _581 = -_515;
    float _583 = _581 + 1.0;
    bool _585 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _587 = isnan(0.0);
    bool _589 = _585 || _587;
    bool _591 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _593 = _589 || _591;
    float _595 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _597 = _523 + _595;
    bool _599 = !_401;
    int _601 = _599 ? 0 : 1;
    float _603 = _593 ? _583 : 0.0;
    float _605 = fma(_597, _597, _549);
    int _607 = abs(_601);
    float _609 = _397 + _393;
    float _611 = float(_559);
    float _613 = _397 + (-0.5);
    float _615 = float(_607);
    float _617 = rsqrt(_605);
    if (_579)
    {
        float _619 = _603 * _563;
        _145 = _619;
    }
    float _621 = _145;
    float _623 = _561 * (-2.0);
    int _625 = ~_447;
    int _627 = _625 + 1;
    int _629 = _627 + 1;
    float _631 = _615 * _611;
    bool _633 = !_409;
    int _635 = _633 ? 0 : 1;
    float _637 = fma(_535, _623, _535);
    int _639 = _629;
    if (!_521)
    {
        int _641 = ~_447;
        int _643 = _641 + 1;
        _639 = _643;
    }
    int _645 = _639;
    float _647 = _609 + (-1.0);
    int _649 = abs(_635);
    float _651 = fma(_623, _567, _567);
    float _653 = _395 + (-0.5);
    float _655 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _657 = float(_649);
    float _659 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[196].y, _651);
    float _661 = _395 + _393;
    float _663 = float(_645);
    float _665 = _493 * _617;
    float _667 = fma(_637, _621, _659);
    float _669 = _661 + (-1.0);
    float _671 = _631 * (-2.0);
    float _673 = _657 * _663;
    float _675 = _531 * _617;
    float _677 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _679 = _393 + (-0.5);
    float _681 = fma(_671, _565, _565);
    float _683 = -_665;
    float _685 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[18].w, _493);
    float _687 = fma(_677, _671, _677);
    float _689 = _673 * (-2.0);
    float _691 = as_type<float>(int(gl_VertexIndex));
    float _693 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[196].x, _681);
    float _695 = -_675;
    float _697 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[18].w, _531);
    float _699 = fma(_689, _569, _569);
    float _701 = _685 * _685;
    float _703 = _597 * _617;
    float _705 = in.m_74.x;
    float _707 = in.m_74.y;
    float _709 = fma(_655, _689, _655);
    float _711 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[196].z, _699);
    float _713 = fma(_697, _697, _701);
    float _715 = -_703;
    float _717 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[18].w, _597);
    float _719 = fma(_687, _621, _693);
    float _721 = fma(_709, _621, _711);
    float _723 = _667 * 0.15915493667125701904296875;
    float _725 = fma(_717, _717, _713);
    float _727 = _719 * 0.15915493667125701904296875;
    float _729 = _721 * 0.15915493667125701904296875;
    float _731 = _723 * 6.283185482025146484375;
    float _733 = sin(_731);
    int _735 = as_type<int>(_691) & 1;
    bool _737 = _735 != 0;
    int _739 = as_type<int>(_691) & 2;
    bool _741 = _739 != 0;
    float _743 = sqrt(_725);
    float _745 = _359 * _705;
    float _747 = _361 * _707;
    bool _749 = !_737;
    float _751 = _749 ? (-0.5) : 0.5;
    float _753 = _723 * 6.283185482025146484375;
    float _755 = cos(_753);
    float _757 = _745 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _759 = !_741;
    float _761 = _759 ? (-0.5) : 0.5;
    float _763 = _747 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _765 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _761);
    float _767 = _727 * 6.283185482025146484375;
    float _769 = sin(_767);
    float _771 = _617 * _743;
    float _773 = _757 * _771;
    float _775 = _771 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _777 = _775 * 0.5;
    float _779 = _763 * _771;
    float _781 = _727 * 6.283185482025146484375;
    float _783 = cos(_781);
    float _785 = _779 * _765;
    float _787 = _729 * 6.283185482025146484375;
    float _789 = cos(_787);
    float _791 = _769 * _733;
    float _793 = _769 * _755;
    float _795 = _729 * 6.283185482025146484375;
    float _797 = sin(_795);
    float _799 = _783 * _755;
    float _801 = _783 * _733;
    float _803 = _769 * _789;
    float _805 = _755 * _789;
    float _807 = _783 * _789;
    float _809 = _733 * _789;
    float _811 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _751);
    float _813 = _807 * _777;
    float _815 = _773 * _811;
    float _817 = fma(_797, _799, _791);
    float _819 = -_793;
    float _821 = fma(_797, _801, _819);
    float _823 = _797 * _777;
    float _825 = -_801;
    float _827 = fma(_797, _793, _825);
    float _829 = fma(_817, _815, _813);
    float _831 = _803 * _777;
    float _833 = -_823;
    float _835 = fma(_805, _815, _833);
    float _837 = fma(_797, _791, _799);
    float _839 = -_785;
    float _841 = fma(_821, _839, _829);
    float _843 = fma(_827, _815, _831);
    float _845 = -_785;
    float _847 = fma(_809, _845, _835);
    float _849 = _841 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _851 = -_785;
    float _853 = fma(_837, _851, _843);
    float _855 = _841 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _857 = _841 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _859 = fma(_847, (*spvDescriptorSet0.vp_c10)._m0[10].x, _849);
    float _861 = fma(_847, (*spvDescriptorSet0.vp_c10)._m0[8].x, _855);
    float _863 = fma(_847, (*spvDescriptorSet0.vp_c10)._m0[9].x, _857);
    float _865 = fma(_853, (*spvDescriptorSet0.vp_c10)._m0[10].z, _859);
    float _867 = fma(_853, (*spvDescriptorSet0.vp_c10)._m0[8].z, _861);
    float _869 = fma(_853, (*spvDescriptorSet0.vp_c10)._m0[9].z, _863);
    float _871 = _523 + _865;
    float _873 = _505 + _867;
    float _875 = _463 + _869;
    float _877 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _879 = _871 + _877;
    float _881 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _883 = _873 + _881;
    float _885 = _879 * _879;
    float _887 = fma(_883, _883, _885);
    float _889 = sqrt(_887);
    bool _891 = _889 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _893 = 0.0;
    float _895 = _871;
    float _897 = _873;
    int _899 = as_type<int>(_883);
    float _901 = _675;
    if (!_891)
    {
        _893 = _875;
    }
    float _903 = _893;
    bool _905 = !_891;
    float _907 = _903;
    if (!_905)
    {
        float _909 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _911 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _913 = _889 + _911;
        float _915 = rsqrt(_887);
        float _917 = _913 * _909;
        float _919 = _875 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _921 = _917 * 0.15915493667125701904296875;
        float _923 = _921 * 6.283185482025146484375;
        float _925 = cos(_923);
        float _927 = _921 * 6.283185482025146484375;
        float _929 = sin(_927);
        float _931 = _925 + (-1.0);
        float _933 = fma(_929, _919, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _935 = _931 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _937 = _915 * _933;
        float _939 = fma(_875, _925, _935);
        float _941 = fma(_883, _937, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _943 = fma(_879, _937, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _895 = _943;
        _897 = _941;
        _907 = _939;
    }
    float _945 = _895;
    float _947 = _897;
    float _949 = _907;
    float _951 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _953 = _945 + _951;
    float _955 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _957 = _947 + _955;
    float _959 = fma(_953, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _961 = fma(_957, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4040 = float2(_961, _959);
    float _963 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4040, float2(0.0), isnan(_4040)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4040, float2(0.0), isnan(_4040)), level(0.0)).x;
    float _965 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _967 = -_675;
    float _969 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[18].w, _505);
    float _971 = -_703;
    float _973 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[18].w, _523);
    float _975 = fma(_963, 100.0, _463);
    float _977 = -_665;
    float _979 = fma(_977, (*spvDescriptorSet0.vp_c9)._m0[18].w, _975);
    float _981 = _979 + _965;
    float _983 = _981 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _985 = _981 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _987 = fma(_969, (*spvDescriptorSet0.vp_c15)._m0[126].x, _983);
    float _989 = fma(_969, (*spvDescriptorSet0.vp_c15)._m0[127].x, _985);
    float _991 = fma(_973, (*spvDescriptorSet0.vp_c15)._m0[126].z, _987);
    float _993 = fma(_973, (*spvDescriptorSet0.vp_c15)._m0[127].z, _989);
    float _995 = _991 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _997 = _993 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _999 = trunc(_995);
    int _1001 = int(_999);
    float _1003 = trunc(_997);
    int _1005 = int(_1003);
    int _1007 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1009 = _1001 + _1007;
    int _1011 = _1009 + 1;
    bool _1013 = _1011 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1015 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1017 = _1005 + _1015;
    int _1019 = _1017 + 1;
    int _1021 = _1011 | _1019;
    bool _1023 = _1021 < 0;
    bool _1025 = _1023 || _1013;
    bool _1027 = _1019 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1029 = _1027 || _1025;
    int _1031 = _1011;
    int _1033 = _1019;
    int _1035 = _1021;
    if (!_1029)
    {
        int _1037 = _1019 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1039 = _1037 + _1011;
        _1031 = _1039;
    }
    int _1041 = _1031;
    float _1043 = _993;
    if (!_1029)
    {
        float _1045 = floor(_997);
        _1043 = _1045;
    }
    float _1047 = _1043;
    if (!_1029)
    {
        int _1049 = _1041 << 2;
        _1033 = _1049;
    }
    int _1051 = _1033;
    int _1053 = _1051;
    if (!_1029)
    {
        uint _1056 = uint(int(uint(_1041) >> uint(2)));
        _1035 = int(_1056);
    }
    int _1058 = _1035;
    if (!_1029)
    {
        int _1060 = 12 & _1051;
        _1053 = _1060;
    }
    int _1062 = _1053;
    if (!_1029)
    {
        int _1064 = _1058 << 4;
        int _1066 = _1064 + _1062;
        _899 = _1066;
    }
    int _1068 = _899;
    float _1070 = as_type<float>(_1062);
    if (!_1029)
    {
        float _1072 = floor(_995);
        _1070 = _1072;
    }
    float _1074 = _1070;
    float _1076 = as_type<float>(_1058);
    if (!_1029)
    {
        int _1078 = _1068 + 400;
        uint _1080 = uint(int(uint(_1078) >> uint(2)));
        uint _1082 = uint(int(uint(int(_1080)) >> uint(2)));
        int _1084 = int(_1080) & 3;
        float _1086 = (*spvDescriptorSet0.vp_c15)._m0[int(_1082)][_1084];
        _1076 = _1086;
    }
    float _1088 = _1076;
    float _1090 = 0.0;
    if (!_1029)
    {
        float _1092 = -_1047;
        float _1094 = _997 + _1092;
        _1090 = _1094;
    }
    float _1096 = _1090;
    float _1098 = _1074;
    if (!_1029)
    {
        float _1100 = -_1074;
        float _1102 = _995 + _1100;
        _1098 = _1102;
    }
    float _1104 = _1098;
    float _1106 = _1088;
    if (!_1029)
    {
        float _1108 = rint(_1088);
        float _1110 = precise::max(_1108, 0.0);
        uint _1112 = uint(_1110);
        uint _1114 = clamp(_1112, 0u, 65535u);
        _1106 = as_type<float>(_1114);
    }
    float _1116 = _1106;
    float _1118 = _1096;
    if (!_1029)
    {
        float3 _4315 = float3(_1104, _1096, float(as_type<int>(_1116)));
        float3 _4319 = select(_4315, float3(0.0), isnan(_4315));
        float _1120 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4319.xy, uint(rint(_4319.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4319.xy, uint(rint(_4319.z)), level(0.0)).x;
        _1118 = _1120;
    }
    float _1122 = _1118;
    float _1124 = _979 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1126 = -_703;
    float _1128 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[18].w, _945);
    float _1130 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1124);
    float _1132 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1130);
    float _1134 = _979 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1136 = _1132 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1138 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1134);
    float _1140 = 1.0 / _1136;
    float _1142 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1138);
    float _1144 = _1142 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1146 = _1144 + _1136;
    float _1148 = _1146 * _1140;
    float _1150 = _1148 * 0.5;
    float _1152 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1154 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1152);
    float _1156 = 1.0 / _1154;
    float _1158 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1160 = _1156 * _1158;
    bool _1162 = _1160 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1164 = _1160 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1166 = !_1162;
    int _1168 = _1166 ? 0 : 1;
    int _1170 = 2;
    if (!_1162)
    {
        _1170 = 1;
    }
    int _1172 = _1170;
    int _1174 = _1172;
    if (!_1164)
    {
        _1174 = _1168;
    }
    int _1176 = _1174;
    bool _1178 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1180 = isnan(0.5);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1186 = _1182 || _1184;
    int _1188 = _1176 << 6;
    int _1190 = _1188 + 96;
    uint _1192 = uint(int(uint(_1190) >> uint(2)));
    uint _1194 = uint(int(uint(int(_1192)) >> uint(2)));
    int _1196 = int(_1192) & 3;
    float _1198 = (*spvDescriptorSet0.vp_c15)._m0[int(_1194)][_1196];
    int _1200 = int(_1192) + 1;
    uint _1202 = uint(int(uint(_1200) >> uint(2)));
    int _1204 = _1200 & 3;
    float _1206 = (*spvDescriptorSet0.vp_c15)._m0[int(_1202)][_1204];
    int _1208 = _1188 + 48;
    uint _1210 = uint(int(uint(_1208) >> uint(2)));
    uint _1212 = uint(int(uint(int(_1210)) >> uint(2)));
    int _1214 = int(_1210) & 3;
    float _1216 = (*spvDescriptorSet0.vp_c15)._m0[int(_1212)][_1214];
    int _1218 = int(_1210) + 1;
    uint _1220 = uint(int(uint(_1218) >> uint(2)));
    int _1222 = _1218 & 3;
    float _1224 = (*spvDescriptorSet0.vp_c15)._m0[int(_1220)][_1222];
    int _1226 = _1188 + 104;
    uint _1228 = uint(int(uint(_1226) >> uint(2)));
    uint _1230 = uint(int(uint(int(_1228)) >> uint(2)));
    int _1232 = int(_1228) & 3;
    float _1234 = (*spvDescriptorSet0.vp_c15)._m0[int(_1230)][_1232];
    int _1236 = int(_1228) + 1;
    uint _1238 = uint(int(uint(_1236) >> uint(2)));
    int _1240 = _1236 & 3;
    float _1242 = (*spvDescriptorSet0.vp_c15)._m0[int(_1238)][_1240];
    int _1244 = _1188 + 80;
    uint _1246 = uint(int(uint(_1244) >> uint(2)));
    uint _1248 = uint(int(uint(int(_1246)) >> uint(2)));
    int _1250 = int(_1246) & 3;
    float _1252 = (*spvDescriptorSet0.vp_c15)._m0[int(_1248)][_1250];
    int _1254 = int(_1246) + 1;
    uint _1256 = uint(int(uint(_1254) >> uint(2)));
    int _1258 = _1254 & 3;
    float _1260 = (*spvDescriptorSet0.vp_c15)._m0[int(_1256)][_1258];
    int _1262 = _1188 + 64;
    uint _1264 = uint(int(uint(_1262) >> uint(2)));
    uint _1266 = uint(int(uint(int(_1264)) >> uint(2)));
    int _1268 = int(_1264) & 3;
    float _1270 = (*spvDescriptorSet0.vp_c15)._m0[int(_1266)][_1268];
    int _1272 = int(_1264) + 1;
    uint _1274 = uint(int(uint(_1272) >> uint(2)));
    int _1276 = _1272 & 3;
    float _1278 = (*spvDescriptorSet0.vp_c15)._m0[int(_1274)][_1276];
    int _1280 = _1188 + 88;
    uint _1282 = uint(int(uint(_1280) >> uint(2)));
    uint _1284 = uint(int(uint(int(_1282)) >> uint(2)));
    int _1286 = int(_1282) & 3;
    float _1288 = (*spvDescriptorSet0.vp_c15)._m0[int(_1284)][_1286];
    int _1290 = int(_1282) + 1;
    uint _1292 = uint(int(uint(_1290) >> uint(2)));
    int _1294 = _1290 & 3;
    float _1296 = (*spvDescriptorSet0.vp_c15)._m0[int(_1292)][_1294];
    int _1298 = _1188 + 56;
    uint _1300 = uint(int(uint(_1298) >> uint(2)));
    uint _1302 = uint(int(uint(int(_1300)) >> uint(2)));
    int _1304 = int(_1300) & 3;
    float _1306 = (*spvDescriptorSet0.vp_c15)._m0[int(_1302)][_1304];
    int _1308 = int(_1300) + 1;
    uint _1310 = uint(int(uint(_1308) >> uint(2)));
    int _1312 = _1308 & 3;
    float _1314 = (*spvDescriptorSet0.vp_c15)._m0[int(_1310)][_1312];
    float _1316 = _981 * _1206;
    float _1318 = fma(_963, 100.0, _949);
    float _1320 = fma(_969, _1198, _1316);
    float _1322 = -_665;
    float _1324 = fma(_1322, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1318);
    float _1326 = -_675;
    float _1328 = fma(_1326, (*spvDescriptorSet0.vp_c9)._m0[18].w, _947);
    int _1330 = _1188 + 72;
    uint _1332 = uint(int(uint(_1330) >> uint(2)));
    uint _1334 = uint(int(uint(int(_1332)) >> uint(2)));
    int _1336 = int(_1332) & 3;
    float _1338 = (*spvDescriptorSet0.vp_c15)._m0[int(_1334)][_1336];
    int _1340 = int(_1332) + 1;
    uint _1342 = uint(int(uint(_1340) >> uint(2)));
    int _1344 = _1340 & 3;
    float _1346 = (*spvDescriptorSet0.vp_c15)._m0[int(_1342)][_1344];
    float _1348 = _981 * _1224;
    float _1350 = fma(_969, _1216, _1348);
    float _1352 = fma(_973, _1234, _1320);
    float _1354 = _1352 + _1242;
    float _1356 = _981 * _1260;
    float _1358 = 1.0 / _1354;
    float _1360 = fma(_969, _1252, _1356);
    float _1362 = _981 * _1278;
    float _1364 = fma(_969, _1270, _1362);
    float _1366 = fma(_973, _1288, _1360);
    float _1368 = _1366 + _1296;
    float _1370 = _1366;
    float _1372 = _1296;
    float _1374 = _1328;
    float _1376 = _1368;
    float _1378 = _1278;
    if (_1186)
    {
        _1370 = _1128;
    }
    float _1380 = _1370;
    float _1382 = _1380;
    if (_1186)
    {
        _1372 = _1324;
    }
    float _1384 = _1372;
    float _1386 = fma(_973, _1306, _1350);
    float _1388 = _1386 + _1314;
    float _1390 = fma(_973, _1338, _1364);
    float _1392 = _1390 + _1346;
    float _1394 = _1384;
    if (!_1186)
    {
        float _1396 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1398 = _979 + _1396;
        float _1400 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1402 = _969 + _1400;
        float _1404 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1406 = -_523;
        float _1408 = _1406 + _945;
        float _1410 = _1398 * _1398;
        float _1412 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1414 = _973 + _1412;
        float _1416 = -_463;
        float _1418 = _1416 + _949;
        float _1420 = -_505;
        float _1422 = _1420 + _947;
        float _1424 = fma(_1402, _1402, _1410);
        float _1426 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1428 = fma(_1414, _1414, _1424);
        float _1430 = sqrt(_1428);
        float _1432 = 1.0 / _771;
        float _1434 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1436 = precise::min(_1430, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1438 = _1436 * _1404;
        float _1440 = _1438 * _1432;
        float _1442 = _1434 * _1440;
        float _1444 = _1408 * _1440;
        float _1446 = fma(_1418, _1442, _979);
        float _1448 = fma(_1422, _1442, _969);
        float _1450 = fma(_1434, _1444, _973);
        _1394 = _1446;
        _1374 = _1448;
        _1382 = _1450;
        _553 = _1444;
    }
    float _1452 = _1394;
    float _1454 = _1374;
    float _1456 = _1382;
    float _1458 = _553;
    float _1460 = _1388 * _1358;
    float _1462 = _1392 * _1358;
    float _1464 = _1368 * _1358;
    float _1466 = _1458;
    if (_1029)
    {
        _1466 = 1.0;
    }
    float _1468 = _1466;
    float _1470 = _1468;
    if (!_1029)
    {
        int _1472 = _1041 << 4;
        int _1474 = _1472 + 2048;
        uint _1476 = uint(int(uint(_1474) >> uint(2)));
        uint _1478 = uint(int(uint(int(_1476)) >> uint(2)));
        int _1480 = int(_1476) & 3;
        float _1482 = (*spvDescriptorSet0.vp_c15)._m0[int(_1478)][_1480];
        int _1484 = int(_1476) + 1;
        uint _1486 = uint(int(uint(_1484) >> uint(2)));
        int _1488 = _1484 & 3;
        float _1490 = (*spvDescriptorSet0.vp_c15)._m0[int(_1486)][_1488];
        int _1492 = _1474 + 8;
        uint _1494 = uint(int(uint(_1492) >> uint(2)));
        uint _1496 = uint(int(uint(int(_1494)) >> uint(2)));
        int _1498 = int(_1494) & 3;
        float _1500 = (*spvDescriptorSet0.vp_c15)._m0[int(_1496)][_1498];
        int _1502 = int(_1494) + 1;
        uint _1504 = uint(int(uint(_1502) >> uint(2)));
        int _1506 = _1502 & 3;
        float _1508 = (*spvDescriptorSet0.vp_c15)._m0[int(_1504)][_1506];
        float _1510 = _981 * _1490;
        float _1512 = fma(_969, _1482, _1510);
        float _1514 = fma(_973, _1500, _1512);
        float _1516 = _1514 + _1508;
        float _1518 = precise::clamp(_1516, 0.0, 1.0);
        float _1520 = -_1518;
        float _1522 = _1520 + _1122;
        float _1524 = fma(_1522, 500.0, 1.5);
        float _1526 = exp2(_1524);
        float _1528 = 0.0 + _1526;
        float _1530 = precise::clamp(_1528, 0.0, 1.0);
        _1470 = _1530;
    }
    float _1532 = _1470;
    float _1534 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1536 = _1452 + _1534;
    float _1538 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1540 = _1454 + _1538;
    float _1542 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1544 = _1456 + _1542;
    float _1546 = _1536 * _1536;
    float _1548 = fma(_1540, _1540, _1546);
    float _1550 = fma(_1544, _1544, _1548);
    float _1552 = rsqrt(_1550);
    float _1554 = sqrt(_1550);
    float _1556 = _1552 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1558 = _1540 * _1556;
    float _1560 = _1544 * _1556;
    float _1562 = _1558 * _1558;
    float _1564 = _1560 * _1560;
    float _1566 = _1562 + _1564;
    float _1568 = sqrt(_1566);
    bool _1570 = _1568 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1572 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1574 = _1568 + _1572;
    float _1576 = _1544;
    float _1578 = _1546;
    float _1580 = _1574;
    float _1582 = _1536;
    float _1584 = _1564;
    if (_1570)
    {
        float _1586 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1576 = _1586;
    }
    float _1588 = _1576;
    if (_1570)
    {
        float _1590 = rsqrt(_1566);
        _1578 = _1590;
    }
    float _1592 = _1578;
    float _1594 = _1592;
    if (_1570)
    {
        float _1596 = _1574 * _1588;
        _1580 = _1596;
    }
    float _1598 = _1580;
    if (_1570)
    {
        float _1600 = _1598 * 0.15915493667125701904296875;
        _1376 = _1600;
    }
    float _1602 = _1376;
    float _1604 = _1588;
    if (_1570)
    {
        float _1606 = _1602 * 6.283185482025146484375;
        float _1608 = sin(_1606);
        _1604 = _1608;
    }
    float _1610 = _1604;
    float _1612 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1614 = precise::max(0.0, _1612);
    float _1616 = _1552;
    float _1618 = _1614;
    if (_1570)
    {
        float _1620 = _1602 * 6.283185482025146484375;
        float _1622 = cos(_1620);
        _1616 = _1622;
    }
    float _1624 = _1616;
    float _1626 = -_1556;
    float _1628 = -_1614;
    float _1630 = fma(_1536, _1626, _1628);
    if (_1570)
    {
        float _1632 = _1630 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1618 = _1632;
    }
    float _1634 = _1618;
    float _1636 = _1634;
    float _1638 = _1610;
    if (_1570)
    {
        float _1640 = fma(_1610, _1634, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1636 = _1640;
    }
    float _1642 = _1636;
    float _1644 = _1642;
    if (!_1570)
    {
        _1638 = _1558;
    }
    float _1646 = _1638;
    float _1648 = _1646;
    float _1650 = _1624;
    if (_1570)
    {
        float _1652 = _1624 + (-1.0);
        _1582 = _1652;
    }
    float _1654 = _1582;
    float _1656 = _1654;
    if (_1570)
    {
        float _1658 = _1592 * _1642;
        _901 = _1658;
    }
    float _1660 = _901;
    if (!_1570)
    {
        _1644 = _1630;
    }
    float _1662 = _1644;
    float _1664 = _1662;
    if (_1570)
    {
        float _1666 = _1654 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1378 = _1666;
    }
    float _1668 = _1378;
    if (_1570)
    {
        float _1670 = _1558 * _1660;
        _1648 = _1670;
    }
    float _1672 = _1648;
    if (!_1570)
    {
        _1594 = _1560;
    }
    float _1674 = _1594;
    float _1676 = _1674;
    if (_1570)
    {
        float _1678 = _1560 * _1660;
        _1676 = _1678;
    }
    float _1680 = _1676;
    if (!_1570)
    {
        _1656 = _1562;
    }
    float _1682 = _1656;
    float _1684 = _1682;
    if (_1570)
    {
        float _1686 = fma(_1630, _1624, _1668);
        _1664 = _1686;
    }
    float _1688 = _1664;
    if (_1570)
    {
        float _1690 = _1672 * _1672;
        _1684 = _1690;
    }
    float _1692 = _1684;
    if (!_1570)
    {
        _1650 = _1564;
    }
    float _1694 = _1650;
    float _1696 = _1694;
    if (_1570)
    {
        float _1698 = _1680 * _1680;
        _1696 = _1698;
    }
    float _1700 = _1696;
    float _1702 = _1452 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1704 = fma(_1688, _1688, _1692);
    float _1706 = _1452 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1708 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1702);
    float _1710 = _1704 + _1700;
    bool _1712 = _1460 >= 0.0;
    float _1714 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1716 = fma(_1554, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1714);
    float _1718 = precise::clamp(_1716, 0.0, 1.0);
    float _1720 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1708);
    float _1722 = rsqrt(_1710);
    float _1724 = -_1718;
    float _1726 = _1724 + 1.0;
    float _1728 = _1720 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1730 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _1732 = _1460 <= 1.0;
    bool _1734 = _1732 && _1712;
    float _1736 = fma(_969, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1738 = abs(_1726);
    float _1740 = log2(_1738);
    float _1742 = _1728 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1744 = _1462 >= 0.0;
    bool _1746 = _1744 && _1734;
    float _1748 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1706);
    bool _1750 = _1462 <= 1.0;
    bool _1752 = _1750 && _1746;
    float _1754 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1748);
    float _1756 = _1722 * _1672;
    float _1758 = fma(_973, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1760 = -_1742;
    float _1762 = fma(_1760, _1730, 1.0);
    float _1764 = _1722 * _1688;
    float _1766 = _1756 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1768 = _1452 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1770 = _1722 * _1680;
    float _1772 = _1452 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1774 = -_1766;
    float _1776 = fma(_1764, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1774);
    float _1778 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1768);
    float _1780 = floor(_1758);
    float _1782 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1772);
    float _1784 = -_1770;
    float _1786 = fma(_1784, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1776);
    float _1788 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1778);
    float _1790 = _1740 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1792 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1782);
    float _1794 = _1754 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1796 = _1788 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1798 = floor(_1736);
    float _1800 = _1792 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    if (_1752)
    {
        float _1802 = float(_1176);
        _1584 = _1802;
    }
    float _1804 = _1584;
    float _1806 = _1796 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1808 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1806);
    float _1810 = log2(_1762);
    float _1812 = -_1780;
    float _1814 = _1758 + _1812;
    float _1816 = _1796 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1818 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1808);
    float _1820 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1818);
    float _1822 = exp2(_1790);
    float _1824 = fma(_1786, -0.5, 0.5);
    float _1826 = -_1798;
    float _1828 = _1736 + _1826;
    float _1830 = _1796 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1832 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1816);
    float _1834 = fma(_1786, 0.5, 0.5);
    float _1836 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1830);
    float _1838 = 1.0 / _1820;
    float _1840 = _1764 + 1.0;
    float _1842 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1836);
    float _1844 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1832);
    float _1846 = fma(_1834, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1848 = sqrt(_1824);
    float _1850 = -_1764;
    float _1852 = fma(_1822, _1840, _1850);
    float _1854 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1842);
    float _1856 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1844);
    float _1858 = fma(_1834, _1846, -0.212114393711090087890625);
    float _1860 = _1810 * 0.693147182464599609375;
    float _1862 = _1804;
    float _1864 = _1820;
    if (_1752)
    {
        float _1866 = rint(_1804);
        float _1868 = precise::max(_1866, 0.0);
        uint _1870 = uint(_1868);
        uint _1872 = clamp(_1870, 0u, 65535u);
        _1862 = as_type<float>(_1872);
    }
    float _1874 = _1862;
    float _1876 = _1854 * _1838;
    float _1878 = _1856 * _1838;
    float2 _5561 = float2(_1828, _1814);
    float _1880 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5561, float2(0.0), isnan(_5561)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5561, float2(0.0), isnan(_5561)), level(0.0)).x;
    float _1882 = fma(_1834, _1858, 1.570728778839111328125);
    float _1884 = _1860 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1886 = fma(_1876, 0.5, 0.5);
    float _1888 = fma(_1878, -0.5, 0.5);
    float _1890 = _1848 * 0.636619746685028076171875;
    float _1892 = -_1882;
    float _1894 = fma(_1890, _1892, 1.0);
    float _1896 = fma(_1852, 0.5, 0.5);
    float _1898 = _1874;
    if (_1752)
    {
        float3 _5597 = float3(_1460, _1462, float(as_type<int>(_1874)));
        float3 _5599 = select(_5597, float3(0.0), isnan(_5597));
        float _1900 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5599.xy, uint(rint(_5599.z)), _1464, level(0.0));
        _1898 = _1900;
    }
    float _1902 = _1898;
    float3 _5609 = float3(_1886, _1888, _1884);
    float _1904 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5609, float3(0.0), isnan(_5609)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5609, float3(0.0), isnan(_5609)), level(0.0)).x;
    float3 _5618 = float3(_1886, _1888, _1884);
    float4 _1907 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5618, float3(0.0), isnan(_5618)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5618, float3(0.0), isnan(_5618)), level(0.0)).xyzw;
    float _1909 = _1907.x;
    float _1911 = _1907.y;
    float _1913 = _1907.z;
    float _1915 = _1907.w;
    float2 _5634 = float2(_1894, _1896);
    float3 _1919 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5634, float2(0.0), isnan(_5634)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5634, float2(0.0), isnan(_5634)), level(0.0)).xyz;
    float _1921 = _1919.x;
    float _1923 = _1919.y;
    float _1925 = _1919.z;
    float _1927 = _1740 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1929 = _1796 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1931 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1933 = _1931 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1935 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1937 = _1935 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1939 = _393 > 0.5;
    float _1941 = 1.0 / _1933;
    bool _1943 = _395 > 0.5;
    float _1945 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1947 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1945;
    float _1949 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1951 = _1949 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1953 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1955 = _391 + _1953;
    bool _1957 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1959 = isnan(_391);
    bool _1961 = _1957 || _1959;
    bool _1963 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1965 = _1961 || _1963;
    float _1967 = float(_1965);
    float _1969 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1971 = _1969 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _1973 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1975 = isnan(_391);
    bool _1977 = _1973 || _1975;
    bool _1979 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1981 = _1977 || _1979;
    float _1983 = float(_1981);
    float _1985 = 1.0 / _1937;
    bool _1987 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1989 = isnan(_391);
    bool _1991 = _1987 || _1989;
    bool _1993 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1995 = _1991 || _1993;
    float _1997 = float(_1995);
    float _1999 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1929);
    float _2001 = -_1997;
    float _2003 = _2001 + 1.0;
    int _2005 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2007 = _2005 != 0;
    float _2009 = _1947 * _1941;
    float _2011 = 1.0 / _1951;
    float _2013 = fma(_2009, _1955, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _2015 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2017 = isnan(_391);
    bool _2019 = _2015 || _2017;
    bool _2021 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2023 = _2019 || _2021;
    float _2025 = float(_2023);
    int _2027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2029 = _2027 != 0;
    float _2031 = exp2(_1927);
    float _2033 = -_2025;
    float _2035 = _2033 + 1.0;
    float _2037 = _2025 * _2003;
    float _2039 = -_1967;
    float _2041 = _2039 + 1.0;
    float _2043 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2045 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _2043;
    float _2047 = _1983 * _2035;
    float _2049 = -_751;
    int _2051 = _1939 ? as_type<int>(_2049) : as_type<int>(_751);
    float _2053 = _1997 * _2041;
    float _2055 = _2045 * _1985;
    float _2057 = _1971 * _2011;
    float _2059 = _2013 * _2047;
    float _2061 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2063 = _391 + _2061;
    float _2065 = -_1983;
    float _2067 = _2065 + 1.0;
    float _2069 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2071 = _391 + _2069;
    float _2073 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2075 = fma(_2057, _2063, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2077 = fma(_2067, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2059);
    float _2079 = fma(_2055, _2071, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _2081 = !_2007;
    float _2083 = _2081 ? _751 : as_type<float>(_2051);
    float _2085 = -_2031;
    float _2087 = _2085 + 1.0;
    float _2089 = fma(_2075, _2037, _2077);
    float _2091 = -_761;
    int _2093 = _1943 ? as_type<int>(_2091) : as_type<int>(_761);
    float _2095 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2097 = _2083 + 0.5;
    float _2099 = fma(_2079, _2053, _2089);
    float _2101 = _751 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2103 = !_2029;
    float _2105 = _2103 ? _761 : as_type<float>(_2093);
    float _2107 = _2097 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2109 = -_797;
    float _2111 = fma(_805, _2101, _2109);
    float _2113 = fma(_817, _2101, _807);
    float _2115 = _761 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2117 = fma(_827, _2101, _803);
    float _2119 = -_2105;
    float _2121 = _2119 + 0.5;
    float _2123 = -_2115;
    float _2125 = fma(_837, _2123, _2117);
    float _2127 = _2107 * _2073;
    float _2129 = abs(_1160);
    float _2131 = log2(_2129);
    float _2133 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2135 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2137 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2139 = _2121 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2141 = _2133 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2143 = _2135 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2145 = _2137 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2147 = _2139 * _2095;
    float _2149 = -_2115;
    float _2151 = fma(_821, _2149, _2113);
    float _2153 = -_2115;
    float _2155 = fma(_809, _2153, _2111);
    out.m_76.x = _2141;
    out.m_76.y = _2143;
    out.m_76.z = _2145;
    bool _2157 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2159 = isnan(0.5);
    bool _2161 = _2157 || _2159;
    bool _2163 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2165 = _2161 || _2163;
    float _2167 = fma(_1967, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2099);
    float _2169 = _2131 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.m_78.x = _2127;
    out.m_78.y = _2147;
    float _2171 = _2167 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2173 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2175 = exp2(_2169);
    float _2177 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2179 = _2151 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2181 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2183 = _2173 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2185 = _2151 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2187 = fma(_2155, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2179);
    float _2189 = _2177 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2191 = _2181 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2193 = fma(_2155, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2185);
    float _2195 = fma(_2125, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2187);
    float _2197 = _2147;
    if (!_2165)
    {
        _2197 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2199 = _2197;
    float _2201 = _2151 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2203 = fma(_2125, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2193);
    out.m_80.x = _2183;
    out.m_80.y = _2189;
    out.m_80.z = _2191;
    out.m_80.w = _2171;
    float _2205 = fma(_2175, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2207 = precise::clamp(_2205, 0.0, 1.0);
    float _2209 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1999);
    float _2211 = fma(_2155, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2201);
    float _2213 = fma(_2207, -2.0, 3.0);
    float _2215 = _2207 * _2207;
    float _2217 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2209);
    float _2219 = fma(_2125, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2211);
    float _2221 = _2215 * _2213;
    float _2223 = _2213;
    float _2225 = _2199;
    float _2227 = _2221;
    float _2229 = _2217;
    if (!_2165)
    {
        float _2231 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2233 = _2199 + _2231;
        _2223 = _2233;
    }
    float _2235 = _2223;
    if (!_2165)
    {
        float _2237 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2239 = _1160 + _2237;
        _2225 = _2239;
    }
    float _2241 = _2225;
    bool _2243 = _1160 <= 8000.0;
    bool _2245 = isnan(_1160);
    bool _2247 = _2243 || _2245;
    bool _2249 = isnan(8000.0);
    bool _2251 = _2247 || _2249;
    float _2253 = float(_2251);
    float _2255 = -_2221;
    float _2257 = _2255 + 1.0;
    float _2259 = _803;
    if (!_2165)
    {
        float _2261 = 1.0 / _2235;
        _2259 = _2261;
    }
    float _2263 = _2259;
    out.gl_Position.x = _1854;
    out.gl_Position.y = _1856;
    out.gl_Position.z = _2217;
    out.gl_Position.w = _1820;
    float _2265 = _2217 + _1820;
    float _2267 = fma(_2257, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2221);
    float _2269 = _1854 + _1820;
    float _2271 = _2265 * 0.5;
    float _2273 = _2253 * _2267;
    float _2275 = _2269 * 0.5;
    float _2277 = _1820 * 0.5;
    out.m_82.x = _2219;
    out.m_82.y = _2195;
    out.m_82.z = _2203;
    float _2279 = _2273 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2281 = _2277;
    if (_2165)
    {
        _2227 = 1.0;
    }
    float _2283 = _2227;
    float _2285 = fma(_1856, -0.5, _2277);
    float _2287 = _2283;
    if (!_1752)
    {
        _2281 = 1.0;
    }
    float _2289 = _2281;
    float _2291 = _2289;
    if (!_2165)
    {
        float _2293 = _2241 * _2263;
        float _2295 = precise::clamp(_2293, 0.0, 1.0);
        _2287 = _2295;
    }
    float _2297 = _2287;
    out.m_84.x = _2275;
    out.m_84.y = _2285;
    out.m_84.z = _2271;
    out.m_84.w = _1820;
    float _2299 = -_1880;
    float _2301 = _2299 + 1.0;
    float _2303 = _2301 * _2279;
    float _2305 = precise::clamp(_2303, 0.0, 1.0);
    float _2307 = -_2305;
    float _2309 = fma(_2307, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2311 = _1909;
    if (_1752)
    {
        bool _2313 = _1902 >= _1464;
        bool _2315 = isnan(_1902);
        bool _2317 = _2313 || _2315;
        bool _2319 = isnan(_1464);
        bool _2321 = _2317 || _2319;
        float _2323 = float(_2321);
        _2291 = _2323;
    }
    float _2325 = _2291;
    float _2327 = _2087 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2329 = _1554 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2331 = isnan(_1554);
    bool _2333 = _2329 || _2331;
    bool _2335 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2337 = _2333 || _2335;
    float _2339 = _2325 * _1532;
    float _2341 = _2327 * _1904;
    float _2343 = -_2327;
    float _2345 = _2343 + 1.0;
    float _2347 = -_2339;
    float _2349 = fma(_2347, _2309, 1.0);
    float _2351 = precise::clamp(_2349, 0.0, 1.0);
    float _2353 = _1915 * _2341;
    float _2355 = _1925 * _2341;
    float _2357 = _1915 * _2345;
    float _2359 = _2351 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2361 = fma(_1921, _2353, _1909);
    float _2363 = fma(_1923, _2353, _1911);
    float _2365 = fma(_1915, _2355, _1913);
    float _2367 = _2297 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_86.x = _2359;
    float _2369 = _2327;
    float _2371 = _2353;
    float _2373 = _2345;
    if (!_2337)
    {
        _2369 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2375 = _2369;
    float _2377 = _2375;
    float _2379 = _2375;
    if (!_2337)
    {
        _2311 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2381 = _2311;
    out.m_88.x = _2361;
    out.m_88.y = _2363;
    out.m_88.z = _2365;
    out.m_88.w = _2357;
    float _2383 = _2381;
    float _2385 = _2381;
    if (!_2337)
    {
        _1864 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2387 = _1864;
    float _2389 = _2387;
    float _2391 = _2387;
    if (!_2337)
    {
        _2229 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2393 = _2229;
    float _2395 = _2393;
    float _2397 = _2393;
    if (!_2337)
    {
        _2371 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2399 = _2371;
    float _2401 = _2399;
    float _2403 = _2399;
    if (!_2337)
    {
        _2373 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2405 = _2373;
    bool _2407 = !_2337;
    float _2409 = _2405;
    float _2411 = _2405;
    if (!_2407)
    {
        bool _2413 = _1554 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2415 = isnan(_1554);
        bool _2417 = _2413 || _2415;
        bool _2419 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2421 = _2417 || _2419;
        if (!_2421)
        {
            float _2423 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2425 = _1554 + _2423;
            float _2427 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2429 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2427;
            float _2431 = 1.0 / _2429;
            float _2433 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2435 = _2433 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2437 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2439 = _2437 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2441 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2443 = _2441 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2445 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2447 = _2445 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2449 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2451 = _2449 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2453 = _2425 * _2431;
            float _2455 = precise::clamp(_2453, 0.0, 1.0);
            float _2457 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2459 = _2457 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2461 = fma(_2455, _2435, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2463 = fma(_2455, _2459, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2465 = fma(_2455, _2439, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2467 = fma(_2455, _2443, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2469 = fma(_2455, _2447, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2471 = fma(_2455, _2451, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2385 = _2463;
            _2403 = _2469;
            _2379 = _2461;
            _2397 = _2467;
            _2391 = _2465;
            _2411 = _2471;
            _2473 = true;
        }
        else
        {
            bool _2475 = _1554 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2477 = isnan(_1554);
            bool _2479 = _2475 || _2477;
            bool _2481 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2483 = _2479 || _2481;
            if (!_2483)
            {
                _2377 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2485 = _2377;
            _2379 = _2485;
            if (!_2483)
            {
                _2383 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2487 = _2383;
            _2385 = _2487;
            if (!_2483)
            {
                _2389 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2489 = _2389;
            _2391 = _2489;
            if (!_2483)
            {
                _2395 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2491 = _2395;
            _2397 = _2491;
            if (!_2483)
            {
                _2401 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2493 = _2401;
            _2403 = _2493;
            if (!_2483)
            {
                _2409 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2495 = _2409;
            bool _2497 = !_2483;
            _2411 = _2495;
            if (!_2497)
            {
                bool _2499 = _1554 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2501 = isnan(_1554);
                bool _2503 = _2499 || _2501;
                bool _2505 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2507 = _2503 || _2505;
                if (!_2507)
                {
                    float _2509 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2511 = _1554 + _2509;
                    float _2513 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2515 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2513;
                    float _2517 = 1.0 / _2515;
                    float _2519 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2521 = _2519 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2523 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2525 = _2523 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2527 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2529 = _2527 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2531 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2533 = _2531 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2535 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2537 = _2535 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2539 = _2511 * _2517;
                    float _2541 = precise::clamp(_2539, 0.0, 1.0);
                    float _2543 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2545 = _2543 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2547 = fma(_2541, _2521, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2549 = fma(_2541, _2545, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2551 = fma(_2541, _2525, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2553 = fma(_2541, _2529, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2555 = fma(_2541, _2533, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2557 = fma(_2541, _2537, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2385 = _2549;
                    _2403 = _2555;
                    _2379 = _2547;
                    _2397 = _2553;
                    _2391 = _2551;
                    _2411 = _2557;
                    _2473 = true;
                }
                else
                {
                    _2385 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2403 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2379 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2397 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2391 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2411 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2473 = false;
    float _2559 = _2385;
    float _2561 = _2403;
    float _2563 = _2379;
    float _2565 = _2397;
    float _2567 = _2391;
    float _2569 = _2411;
    float _2571 = fma(_2195, -0.5, 0.5);
    float _2573 = precise::clamp(_2571, 0.0, 1.0);
    float _2575 = -_2559;
    float _2577 = _2575 + _2561;
    float _2579 = _2367 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2581 = -_2563;
    float _2583 = _2581 + _2565;
    float _2585 = fma(_2573, _2577, _2559);
    out.m_90.x = 0.0;
    float _2587 = -_2567;
    float _2589 = _2587 + _2569;
    float _2591 = fma(_2573, _2583, _2563);
    float _2593 = _2585 * 0.586610972881317138671875;
    out.m_61.x = _2579;
    bool _2595 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2597 = fma(_2573, _2589, _2567);
    float _2599 = fma(_2591, 0.298911988735198974609375, _2593);
    bool _2601 = _2297 > 0.0;
    bool _2603 = isnan(_2297);
    bool _2605 = _2601 || _2603;
    bool _2607 = isnan(0.0);
    bool _2609 = _2605 || _2607;
    float _2611 = fma(_2597, 0.114477999508380889892578125, _2599);
    float _2613 = -_2611;
    float _2615 = _2591 + _2613;
    float _2617 = -_2611;
    float _2619 = _2585 + _2617;
    float _2621 = -_2611;
    float _2623 = _2597 + _2621;
    float _2625 = fma(_2615, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2611);
    float _2627 = fma(_2619, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2611);
    float _2629 = fma(_2623, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2611);
    bool _2631 = !_2595;
    if (!_2631)
    {
        float _2633 = -_1452;
        float _2635 = _2633 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2637 = -_1454;
        float _2639 = _2637 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2641 = -_1456;
        float _2643 = _2641 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2645 = _2635 * _2635;
        float _2647 = fma(_2639, _2639, _2645);
        float _2649 = fma(_2643, _2643, _2647);
        float _2651 = sqrt(_2649);
        float _2653 = rsqrt(_2649);
        float _2655 = -_2651;
        float _2657 = _2655 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2659 = _2657 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2661 = precise::clamp(_2659, 0.0, 1.0);
        float _2663 = _2639 * _2653;
        float _2665 = _2635 * _2653;
        float _2667 = abs(_2661);
        float _2669 = log2(_2667);
        float _2671 = _2643 * _2653;
        float _2673 = _2663 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2675 = _2195 * _2665;
        float _2677 = -_2665;
        float _2679 = -_2673;
        float _2681 = fma(_2677, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2679);
        float _2683 = fma(_2219, _2663, _2675);
        float _2685 = -_2671;
        float _2687 = fma(_2685, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2681);
        float _2689 = fma(_2203, _2671, _2683);
        float _2691 = precise::clamp(_2689, 0.0, 1.0);
        float _2693 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2695 = _2687 + _2693;
        float _2697 = _2669 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2699 = _2695 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2701 = precise::clamp(_2699, 0.0, 1.0);
        float _2703 = exp2(_2697);
        float _2705 = _2703 * _2701;
        float _2707 = _2691 * _2705;
        float _2709 = _2707 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2711 = _2707 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2713 = _2707 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _2709;
        out.m_90.y = _2711;
        out.m_90.z = _2713;
    }
    out.m_92.x = _2625;
    out.m_92.y = _2627;
    out.m_92.z = _2629;
    if (_2609)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_61.x = 0.0;
    float _2715 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2715;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

