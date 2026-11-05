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
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    texture2d_array<float> vp_t_tcb_14 [[id(17)]];
    sampler vp_t_tcb_14Smplr [[id(18)]];
    sampler vp_t_tcb_24Smplr_w [[id(19)]];
    sampler vp_t_tcb_32Smplr_w [[id(20)]];
    sampler vp_t_tcb_30Smplr_w [[id(21)]];
    sampler vp_t_tcb_1CSmplr_w [[id(22)]];
    sampler vp_t_tcb_14Smplr_w [[id(23)]];
    constant dm_border_t* dm_border [[id(24)]];
};

struct main0_out
{
    float4 m_72 [[user(locn0)]];
    float4 m_78 [[user(locn1)]];
    float4 m_76 [[user(locn2)]];
    float4 m_84 [[user(locn3)]];
    float4 m_92 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_80 [[user(locn6)]];
    float4 m_82 [[user(locn7)]];
    float4 m_90 [[user(locn8)]];
    float4 m_86 [[user(locn9)]];
    float4 m_88 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_74 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_68 [[attribute(4)]];
    float4 m_70 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2571 = false;
    bool _1423 = false;
    bool _497 = false;
    bool _309 = false;
    bool _207 = false;
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
        float _2855 = as_type<float>(_127);
        out.gl_Position.z = _2855;
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
        float _2925 = as_type<float>(_165);
        out.gl_Position.z = _2925;
    }
    if (_155)
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
        float _189 = in.m_68.x;
        float _191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _193 = _189 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _195 = fma(_193, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
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
        float _213 = _143 * _211;
        _205 = _213;
    }
    _207 = false;
    float _215 = _205;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _219 = _215 + _217;
    bool _221 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _223 = isnan(_215);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _233;
    float _237 = -_231;
    float _239 = _237 + 1.0;
    bool _241 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _243 = isnan(_215);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _253;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _259 = 1.0 / _235;
    float _261 = _251 * _239;
    float _263 = -_251;
    float _265 = _263 + 1.0;
    float _267 = _219 * _259;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _269;
    float _273 = fma(_255, _267, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _275 = fma(_271, _267, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _277 = _273 * _261;
    float _279 = _275 * _261;
    float _281 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[143].x, _277);
    float _283 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[143].y, _279);
    float _285 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[144].x, _281);
    float _287 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[144].y, _283);
    bool _289 = !_257;
    float _307;
    if (!_289)
    {
        float _291 = in.m_68.x;
        float _293 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _295 = _291 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[11].y, _143);
        float _299 = _297 * _293;
        float _301 = floor(_299);
        float _303 = -_301;
        float _305 = _299 + _303;
        _307 = _305;
        _309 = true;
    }
    else
    {
        float _311 = float(_111);
        float _313 = 1.0 / _311;
        float _315 = _143 * _313;
        _307 = _315;
    }
    _309 = false;
    float _317 = _307;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _325 = _323 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _327 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _329 = isnan(_317);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = 1.0 / _321;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _343 = _341 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _345 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _347 = isnan(_317);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _353 = _349 || _351;
    float _355 = float(_353);
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _357;
    float _361 = -_337;
    float _363 = _361 + 1.0;
    bool _365 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _367 = isnan(_317);
    bool _369 = _365 || _367;
    bool _371 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _373 = _369 || _371;
    float _375 = float(_373);
    bool _377 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _379 = 1.0 / _325;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _385 = _355 * _363;
    float _387 = -_355;
    float _389 = _387 + 1.0;
    float _391 = _375 * _389;
    float _393 = 1.0 / _343;
    float _395 = _359 * _339;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _399 = _317 + _397;
    float _401 = -_375;
    float _403 = _401 + 1.0;
    float _405 = fma(_395, _399, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _409 = _317 + _407;
    float _411 = _383 * _379;
    bool _413 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _415 = isnan(_317);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _425;
    float _429 = _405 * _391;
    float _431 = fma(_411, _409, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _435 = _317 + _433;
    float _437 = -_423;
    float _439 = _437 + 1.0;
    float _441 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[115].x, _429);
    float _443 = _427 * _393;
    float _445 = _337 * _439;
    float _447 = fma(_431, _385, _441);
    float _449 = fma(_443, _435, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _451 = fma(_449, _445, _447);
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _457 = fma(_423, (*spvDescriptorSet0.vp_c9)._m0[118].x, _451);
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _461 = _453 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _463 = _455 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _465 = _457 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _467 = _459 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _469 = in.m_70.x;
    float _471 = in.m_70.y;
    out.m_72.x = _461;
    out.m_72.y = _463;
    out.m_72.z = _467;
    out.m_72.w = _465;
    float _473 = _287 * _471;
    float _475 = _285 * _469;
    bool _477 = !_377;
    float _495;
    if (!_477)
    {
        float _479 = in.m_68.x;
        float _481 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _483 = _479 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _485 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[11].w, _143);
        float _487 = _485 * _481;
        float _489 = floor(_487);
        float _491 = -_489;
        float _493 = _487 + _491;
        _495 = _493;
        _497 = true;
    }
    else
    {
        float _499 = float(_111);
        float _501 = 1.0 / _499;
        float _503 = _143 * _501;
        _495 = _503;
    }
    _497 = false;
    float _505 = _495;
    float _507 = in.m_68.z;
    float _509 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _511 = log2(_509);
    float _513 = _473 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _515 = in.m_68.x;
    float _517 = _475 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _519 = in.m_68.y;
    float _521 = _507 * 2.0;
    float _523 = _515 * 2.0;
    float _525 = floor(_521);
    float _527 = _519 * 2.0;
    float _529 = floor(_523);
    float _531 = floor(_527);
    bool _533 = _525 >= 0.0;
    bool _535 = isnan(_525);
    bool _537 = _533 || _535;
    bool _539 = isnan(0.0);
    bool _541 = _537 || _539;
    bool _543 = _525 > 0.0;
    float _545 = _515 + _519;
    bool _547 = _529 >= 0.0;
    bool _549 = isnan(_529);
    bool _551 = _547 || _549;
    bool _553 = isnan(0.0);
    bool _555 = _551 || _553;
    float _557 = _545 + (-1.0);
    bool _559 = _529 > 0.0;
    float _561 = _507 + _519;
    int _563 = _555 ? 0 : 1;
    float _565 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _567 = _561 + (-1.0);
    bool _569 = _531 > 0.0;
    bool _571 = _531 >= 0.0;
    bool _573 = isnan(_531);
    bool _575 = _571 || _573;
    bool _577 = isnan(0.0);
    bool _579 = _575 || _577;
    float _581 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _583 = _541 ? 0 : 1;
    int _585 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _587 = _585 != 0;
    int _589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _591 = _589 != 0;
    int _593 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _595 = _593 != 0;
    float _597 = _511 * _143;
    int _599 = _579 ? 0 : 1;
    int _601 = ~_583;
    int _603 = _601 + 1;
    int _605 = _603 + 1;
    float _607 = exp2(_597);
    int _609 = ~_599;
    int _611 = _609 + 1;
    int _613 = _611 + 1;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _617 = 1.0 + _615;
    int _619 = _605;
    int _621 = _613;
    bool _623 = _591;
    if (!_543)
    {
        int _625 = ~_583;
        int _627 = _625 + 1;
        _619 = _627;
    }
    int _629 = _619;
    if (!_569)
    {
        int _631 = ~_599;
        int _633 = _631 + 1;
        _621 = _633;
    }
    int _635 = _621;
    int _637 = ~_563;
    int _639 = _637 + 1;
    int _641 = _639 + 1;
    float _643 = in.m_74.x;
    float _645 = in.m_74.y;
    float _647 = in.m_74.z;
    int _649 = _641;
    if (!_559)
    {
        int _651 = ~_563;
        int _653 = _651 + 1;
        _649 = _653;
    }
    int _655 = _649;
    float _657 = 1.0 / _617;
    bool _659 = !_587;
    int _661 = _659 ? 0 : 1;
    bool _663 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _665 = isnan(1.0);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _671 = _667 || _669;
    float _673 = -_607;
    float _675 = _673 + 1.0;
    int _677 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2048;
    bool _679 = _677 != 0;
    int _681 = abs(_661);
    bool _683 = !_591;
    int _685 = _683 ? 0 : 1;
    bool _687 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _689 = isnan(0.0);
    bool _691 = _687 || _689;
    bool _693 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _695 = _691 || _693;
    bool _697 = !_595;
    int _699 = _697 ? 0 : 1;
    float _701 = float(_681);
    float _703 = float(_629);
    int _705 = abs(_685);
    int _707 = abs(_699);
    float _709 = _701 * _703;
    float _711 = _695 ? _675 : 0.0;
    float _713 = float(_705);
    float _715 = _709 * (-2.0);
    float _717 = float(_655);
    float _719 = _711;
    if (_671)
    {
        float _721 = _711 * _657;
        _145 = _721;
    }
    float _723 = _145;
    float _725 = float(_707);
    if (_679)
    {
        float _727 = _519 * 3.1415927410125732421875;
        _719 = _727;
    }
    float _729 = _719;
    float _731 = float(_635);
    float _733 = _713 * _717;
    float _735 = _515 + (-0.5);
    float _737 = _729;
    if (_679)
    {
        float _739 = _729 * 0.15915493667125701904296875;
        _737 = _739;
    }
    float _741 = _737;
    float _743 = _725 * _731;
    float _745 = fma(_715, _643, _643);
    float _747 = _733 * (-2.0);
    float _749 = fma(_565, _715, _565);
    float _751 = _741;
    if (_679)
    {
        float _753 = _741 * 6.283185482025146484375;
        float _755 = sin(_753);
        _751 = _755;
    }
    float _757 = _751;
    float _759 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[196].x, _745);
    float _761 = fma(_747, _645, _645);
    float _763 = _515 + _507;
    float _765 = fma(_581, _747, _581);
    float _767 = fma(_749, _723, _759);
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _771 = _769 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _773 = _763 + (-1.0);
    float _775 = _743 * (-2.0);
    float _777 = _767 * 0.15915493667125701904296875;
    float _779 = in.m_68.w;
    float _781 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _783 = 1.0 / _771;
    float _785 = fma(_775, _647, _647);
    bool _787 = _519 > 0.5;
    float _789 = _519 + (-0.5);
    if (_679)
    {
        bool _791 = _757 > 0.5;
        _623 = _791;
    }
    bool _793 = _623;
    float _795 = _507 + (-0.5);
    float _797 = fma(_781, _775, _781);
    float _799 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[196].y, _761);
    int _801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1024;
    bool _803 = _801 != 0;
    float _805 = in.m_58.x;
    float _807 = in.m_58.y;
    float _809 = in.m_58.z;
    float _811 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[196].z, _785);
    float _813 = fma(_765, _723, _799);
    float _815 = _799;
    if (!_679)
    {
        _815 = _185;
    }
    float _817 = _815;
    float _819 = _777 * 6.283185482025146484375;
    float _821 = sin(_819);
    float _823 = fma(_797, _723, _811);
    float _825 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _827 = _817;
    if (_679)
    {
        float _829 = -_185;
        float _831 = _793 ? _829 : _185;
        _827 = _831;
    }
    float _833 = _827;
    float _835 = _813 * 0.15915493667125701904296875;
    int _837 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _839 = _837 != 0;
    float _841 = _513 * _825;
    int _843 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _845 = _843 != 0;
    float _847 = _777 * 6.283185482025146484375;
    float _849 = cos(_847);
    int _851 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _853 = _851 != 0;
    float _855 = _823 * 0.15915493667125701904296875;
    int _857 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _859 = _857 != 0;
    float _861 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _863 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _865 = _507 > 0.5;
    float _867 = _835 * 6.283185482025146484375;
    float _869 = sin(_867);
    float _871 = -_185;
    int _873 = _787 ? as_type<int>(_871) : as_type<int>(_185);
    bool _875 = _779 > 0.5;
    float _877 = _517 * _861;
    float _879 = _807 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _881 = _807 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _883 = _807 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _885 = _835 * 6.283185482025146484375;
    float _887 = cos(_885);
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _891 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _889;
    float _893 = fma(_805, (*spvDescriptorSet0.vp_c10)._m0[5].x, _881);
    float _895 = fma(_805, (*spvDescriptorSet0.vp_c10)._m0[4].x, _879);
    float _897 = -_185;
    int _899 = _875 ? as_type<int>(_897) : as_type<int>(_185);
    float _901 = _891 * _783;
    float _903 = fma(_809, (*spvDescriptorSet0.vp_c10)._m0[5].z, _893);
    float _905 = _855 * 6.283185482025146484375;
    float _907 = sin(_905);
    float _909 = fma(_805, (*spvDescriptorSet0.vp_c10)._m0[6].x, _883);
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _913 = _505 + _911;
    float _915 = fma(_809, (*spvDescriptorSet0.vp_c10)._m0[4].z, _895);
    float _917 = _849 * _869;
    float _919 = fma(_809, (*spvDescriptorSet0.vp_c10)._m0[6].z, _909);
    float _921 = fma(_901, _913, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _923 = _821 * _869;
    float _925 = _855 * 6.283185482025146484375;
    float _927 = cos(_925);
    float _929 = _849 * _887;
    float _931 = _821 * _887;
    float _933 = _909;
    float _935 = _869;
    bool _937 = _875;
    if (_803)
    {
        float _939 = _515 * 3.1415927410125732421875;
        _933 = _939;
    }
    float _941 = _933;
    float _943 = _915 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _945 = _919 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _947 = _903 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _949 = -_841;
    float _951 = _907 * _949;
    float _953 = fma(_907, _929, _923);
    float _955 = fma(_907, _923, _929);
    bool _957 = !_845;
    float _959 = _957 ? _185 : as_type<float>(_873);
    float _961 = -_931;
    float _963 = fma(_907, _917, _961);
    bool _965 = _515 > 0.5;
    float _967 = -_917;
    float _969 = fma(_907, _931, _967);
    bool _971 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _973 = isnan(_505);
    bool _975 = _971 || _973;
    bool _977 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _979 = _975 || _977;
    float _981 = float(_979);
    float _983 = _849 * _927;
    float _985 = _821 * _927;
    float _987 = _887 * _927;
    float _989 = _869 * _927;
    bool _991 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _993 = isnan(_505);
    bool _995 = _991 || _993;
    bool _997 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _999 = _995 || _997;
    float _1001 = float(_999);
    float _1003 = _983 * _841;
    float _1005 = _963;
    float _1007 = _969;
    if (_803)
    {
        float _1009 = _941 * 0.15915493667125701904296875;
        _935 = _1009;
    }
    float _1011 = _935;
    float _1013 = _985 * _841;
    float _1015 = fma(_987, _877, _951);
    float _1017 = -_1001;
    float _1019 = _1017 + 1.0;
    float _1021 = fma(_953, _877, _1003);
    float _1023 = fma(_969, _877, _1013);
    float _1025 = _1011;
    if (_803)
    {
        float _1027 = _1011 * 6.283185482025146484375;
        float _1029 = sin(_1027);
        _1025 = _1029;
    }
    float _1031 = _1025;
    float _1033 = _981 * _1019;
    float _1035 = fma(_963, _863, _1021);
    float _1037 = fma(_989, _863, _1015);
    float _1039 = fma(_955, _863, _1023);
    float _1041 = _921 * _1033;
    float _1043 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1045 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1047 = -_981;
    float _1049 = _1047 + 1.0;
    float _1051 = _983 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1053 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1043);
    float _1055 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1045);
    float _1057 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1041);
    float _1059 = _983 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1061 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1053);
    float _1063 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1055);
    if (_803)
    {
        bool _1065 = _1031 > 0.5;
        _937 = _1065;
    }
    bool _1067 = _937;
    float _1069 = fma(_1001, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1057);
    float _1071 = _1061 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1073 = _1063 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1075 = _983 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1077 = -_907;
    float _1079 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1051);
    float _1081 = _943 + _1071;
    float _1083 = _945 + _1073;
    float _1085 = -_907;
    float _1087 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1059);
    float _1089 = -_907;
    float _1091 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1075);
    float _1093 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1095 = _1081 + _1093;
    float _1097 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1099 = _1083 + _1097;
    float _1101 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1079);
    float _1103 = _953 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1105 = _1095 * _1095;
    float _1107 = _1099 * _1099;
    float _1109 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1111 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1103);
    float _1113 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1087);
    float _1115 = _1105 + _1107;
    float _1117 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1091);
    float _1119 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1109);
    float _1121 = _953 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1123 = sqrt(_1115);
    bool _1125 = !_859;
    float _1127 = _1125 ? _185 : as_type<float>(_899);
    float _1129 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1131 = _963 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1133 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1121);
    float _1135 = _963 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1137 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1119);
    float _1139 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1131);
    float _1141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1143 = _953 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1145 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1135);
    float _1147 = _1137 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1149 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1111);
    float _1151 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1143);
    float _1153 = _963 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1155 = _947 + _1147;
    bool _1157 = _1123 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1159 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1161 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1153);
    float _1163 = _1129 * _1101;
    float _1165 = _1129 * _1113;
    float _1167 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1151);
    float _1169 = _1129 * _1117;
    float _1171 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1133);
    float _1173 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].z;
    float _1175 = _1151;
    float _1177 = _1147;
    float _1179 = _1105;
    float _1181 = _1107;
    if (!_1157)
    {
        _1175 = _1081;
    }
    float _1183 = _1175;
    float _1185 = _1183;
    if (!_1157)
    {
        _1005 = _1083;
    }
    float _1187 = _1005;
    float _1189 = _1187;
    if (!_1157)
    {
        _1177 = _1155;
    }
    float _1191 = _1177;
    bool _1193 = !_1157;
    float _1195 = _1191;
    if (!_1193)
    {
        float _1197 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1199 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1201 = _1123 + _1199;
        float _1203 = _1155 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1205 = rsqrt(_1115);
        float _1207 = _1201 * _1197;
        float _1209 = _1207 * 0.15915493667125701904296875;
        float _1211 = _1209 * 6.283185482025146484375;
        float _1213 = sin(_1211);
        float _1215 = _1209 * 6.283185482025146484375;
        float _1217 = cos(_1215);
        float _1219 = fma(_1213, _1203, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1221 = _1205 * _1219;
        float _1223 = fma(_1095, _1221, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1225 = _1217 + (-1.0);
        float _1227 = fma(_1099, _1221, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1229 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1231 = _1223 + _1229;
        float _1233 = _1225 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1235 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1237 = _1227 + _1235;
        float _1239 = _1231 * _1231;
        float _1241 = fma(_1155, _1217, _1233);
        float _1243 = _1237 * _1237;
        _1195 = _1241;
        _1007 = _1225;
        _1179 = _1239;
        _1181 = _1243;
        _1185 = _1223;
        _1189 = _1227;
    }
    float _1245 = _1195;
    float _1247 = _1007;
    float _1249 = _1179;
    float _1251 = _1181;
    float _1253 = _1185;
    float _1255 = _1189;
    float _1257 = -_181;
    int _1259 = _965 ? as_type<int>(_1257) : as_type<int>(_181);
    float _1261 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1263 = -_181;
    int _1265 = _865 ? as_type<int>(_1263) : as_type<int>(_181);
    float _1267 = -_959;
    float _1269 = _1267 + 0.5;
    float _1271 = _1247;
    if (!_803)
    {
        _1271 = _181;
    }
    float _1273 = _1271;
    float _1275 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].w;
    float _1277 = _1273;
    if (_803)
    {
        float _1279 = -_181;
        float _1281 = _1067 ? _1279 : _181;
        _1277 = _1281;
    }
    float _1283 = _1277;
    float _1285 = -_1127;
    float _1287 = _1285 + 0.5;
    bool _1289 = !_839;
    float _1291 = _1289 ? _181 : as_type<float>(_1259);
    float _1293 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1139);
    bool _1295 = !_853;
    float _1297 = _1295 ? _181 : as_type<float>(_1265);
    float _1299 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1301 = _1245 + _1299;
    float _1303 = _1283 + 0.5;
    float _1305 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1161);
    float _1307 = _1291 + 0.5;
    float _1309 = fma(_1301, _1301, _1249);
    float _1311 = -_833;
    float _1313 = _1311 + 0.5;
    float _1315 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1317 = _1303 * (*spvDescriptorSet0.vp_c9)._m0[105].x;
    float _1319 = _1309 + _1251;
    float _1321 = _1313 * (*spvDescriptorSet0.vp_c9)._m0[105].y;
    float _1323 = _1307 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1325 = _1317 * _1173;
    float _1327 = _1269 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1329 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1331 = _1323 * _1141;
    float _1333 = _1327 * _1159;
    float _1335 = _1287 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1337 = _1297 + 0.5;
    float _1339 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1145);
    float _1341 = sqrt(_1319);
    float _1343 = _1335 * _1315;
    float _1345 = fma(_1261, _1171, _1163);
    float _1347 = fma(_1261, _1149, _1165);
    float _1349 = fma(_1261, _1167, _1169);
    float _1351 = _1337 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1353 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1355 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1357 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1359 = _1321 * _1275;
    float _1361 = _1351 * _1329;
    float _1363 = _1293 + _1345;
    float _1365 = _1353 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1367 = _1355 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1369 = _1357 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1371 = _1069 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1373 = _1339 + _1347;
    float _1375 = _1305 + _1349;
    out.m_76.x = _1331;
    out.m_76.y = _1333;
    out.m_76.z = _1361;
    out.m_76.w = _1343;
    bool _1377 = _1341 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1379 = isnan(_1341);
    bool _1381 = _1377 || _1379;
    bool _1383 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1385 = _1381 || _1383;
    out.m_78.x = _1365;
    out.m_78.y = _1367;
    out.m_78.z = _1369;
    out.m_78.w = _1371;
    out.m_80.x = _1325;
    out.m_80.y = _1359;
    out.m_82.x = _1363;
    out.m_82.y = _1373;
    out.m_82.z = _1375;
    float _1387 = _1345;
    if (!_1385)
    {
        _1387 = 1.0;
    }
    float _1389 = _1387;
    bool _1391 = !_1385;
    float _1393 = _1389;
    if (!_1391)
    {
        bool _1395 = _1341 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1397 = isnan(_1341);
        bool _1399 = _1395 || _1397;
        bool _1401 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1403 = _1399 || _1401;
        if (!_1403)
        {
            float _1405 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1407 = _1341 + _1405;
            float _1409 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1411 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1409;
            float _1413 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1415 = _1413 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1417 = 1.0 / _1411;
            float _1419 = _1407 * _1417;
            float _1421 = fma(_1419, _1415, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1393 = _1421;
            _1423 = true;
        }
        else
        {
            bool _1425 = _1341 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1427 = isnan(_1341);
            bool _1429 = _1425 || _1427;
            bool _1431 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1433 = _1429 || _1431;
            if (!_1433)
            {
                float _1435 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1437 = _1341 + _1435;
                float _1439 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1441 = _1439 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1443 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1445 = _1443 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1447 = 1.0 / _1441;
                float _1449 = _1437 * _1447;
                float _1451 = fma(_1449, _1445, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1393 = _1451;
                _1423 = true;
            }
            else
            {
                _1393 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1423 = false;
    float _1453 = _1393;
    float _1455 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1457 = _1245 + _1455;
    float _1459 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1461 = _1253 + _1459;
    float _1463 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1465 = _1255 + _1463;
    float _1467 = _947 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1469 = fma(_1457, _1453, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1471 = fma(_1461, _1453, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1473 = fma(_1465, _1453, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1475 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1467);
    float _1477 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1479 = _1469 + _1477;
    float _1481 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1483 = _1471 + _1481;
    float _1485 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1487 = _1473 + _1485;
    float _1489 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1475);
    float _1491 = _1479 * _1479;
    float _1493 = _947 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1495 = _1489 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1497 = fma(_1483, _1483, _1491);
    float _1499 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1493);
    float _1501 = 1.0 / _1495;
    float _1503 = fma(_1487, _1487, _1497);
    float _1505 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1499);
    float _1507 = _1505 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1509 = rsqrt(_1503);
    float _1511 = _1507 + _1495;
    float _1513 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1515 = fma(_943, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1517 = _947 + _1513;
    float _1519 = _1511 * _1501;
    float _1521 = _1519 * 0.5;
    float _1523 = floor(_1515);
    float _1525 = _1517 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1527 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1529 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1527);
    float _1531 = _1517 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1533 = fma(_943, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1525);
    float _1535 = _1509 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1537 = fma(_943, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1531);
    float _1539 = 1.0 / _1529;
    float _1541 = fma(_945, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1533);
    float _1543 = _1483 * _1535;
    float _1545 = _1487 * _1535;
    float _1547 = fma(_945, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1537);
    float _1549 = _1541 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1551 = _1543 * _1543;
    float _1553 = _1545 * _1545;
    float _1555 = _1547 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1557 = trunc(_1549);
    int _1559 = int(_1557);
    float _1561 = _1551 + _1553;
    float _1563 = -_1523;
    float _1565 = _1515 + _1563;
    float _1567 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1569 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1571 = _1539 * _1569;
    float _1573 = sqrt(_1561);
    bool _1575 = _1571 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1577 = _1571 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1579 = trunc(_1555);
    int _1581 = int(_1579);
    int _1583 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1585 = _1559 + _1583;
    int _1587 = _1585 + 1;
    bool _1589 = _1573 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1591 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1593 = _1573 + _1591;
    int _1595 = 2;
    float _1597 = _1535;
    float _1599 = _1561;
    float _1601 = _1593;
    float _1603 = _1543;
    float _1605 = _1551;
    int _1607 = as_type<int>(_1555);
    if (!_1575)
    {
        _1595 = 1;
    }
    int _1609 = _1595;
    float _1611 = sqrt(_1503);
    float _1613 = precise::max(0.0, _1567);
    int _1615 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1617 = _1581 + _1615;
    int _1619 = _1617 + 1;
    float _1621 = -_1535;
    float _1623 = -_1613;
    float _1625 = fma(_1479, _1621, _1623);
    int _1627 = _1587 | _1619;
    float _1629 = _1501;
    int _1631 = _1609;
    float _1633 = as_type<float>(_1627);
    float _1635 = _1625;
    if (_1589)
    {
        float _1637 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1629 = _1637;
    }
    float _1639 = _1629;
    if (_1589)
    {
        float _1641 = _1625 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1597 = _1641;
    }
    float _1643 = _1597;
    if (_1589)
    {
        float _1645 = rsqrt(_1561);
        _1599 = _1645;
    }
    float _1647 = _1599;
    float _1649 = _1647;
    if (_1589)
    {
        float _1651 = _1593 * _1639;
        _1601 = _1651;
    }
    float _1653 = _1601;
    float _1655 = 0.0;
    if (_1589)
    {
        float _1657 = _1653 * 0.15915493667125701904296875;
        _1655 = _1657;
    }
    float _1659 = _1655;
    bool _1661 = !_1575;
    int _1663 = _1661 ? 0 : 1;
    float _1665 = _1547;
    if (_1589)
    {
        float _1667 = _1659 * 6.283185482025146484375;
        float _1669 = sin(_1667);
        _1665 = _1669;
    }
    float _1671 = _1665;
    if (!_1577)
    {
        _1631 = _1663;
    }
    int _1673 = _1631;
    bool _1675 = _1587 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1677 = _1673 << 6;
    bool _1679 = _1627 < 0;
    bool _1681 = _1679 || _1675;
    float _1683 = _1659;
    if (_1589)
    {
        float _1685 = _1659 * 6.283185482025146484375;
        float _1687 = cos(_1685);
        _1683 = _1687;
    }
    float _1689 = _1683;
    int _1691 = _1677 + 96;
    uint _1694 = uint(int(uint(_1691) >> uint(2)));
    uint _1696 = uint(int(uint(int(_1694)) >> uint(2)));
    int _1698 = int(_1694) & 3;
    float _1700 = (*spvDescriptorSet0.vp_c15)._m0[int(_1696)][_1698];
    int _1702 = int(_1694) + 1;
    uint _1704 = uint(int(uint(_1702) >> uint(2)));
    int _1706 = _1702 & 3;
    float _1708 = (*spvDescriptorSet0.vp_c15)._m0[int(_1704)][_1706];
    bool _1710 = _1619 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1712 = _1710 || _1681;
    float _1714 = fma(_945, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    if (_1589)
    {
        float _1716 = fma(_1671, _1643, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1633 = _1716;
    }
    float _1718 = _1633;
    int _1720 = _1677 + 48;
    uint _1722 = uint(int(uint(_1720) >> uint(2)));
    uint _1724 = uint(int(uint(int(_1722)) >> uint(2)));
    int _1726 = int(_1722) & 3;
    float _1728 = (*spvDescriptorSet0.vp_c15)._m0[int(_1724)][_1726];
    int _1730 = int(_1722) + 1;
    uint _1732 = uint(int(uint(_1730) >> uint(2)));
    int _1734 = _1730 & 3;
    float _1736 = (*spvDescriptorSet0.vp_c15)._m0[int(_1732)][_1734];
    float _1738 = _1469 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1740 = floor(_1714);
    float _1742 = 0.0;
    if (_1589)
    {
        float _1744 = _1647 * _1718;
        _1742 = _1744;
    }
    float _1746 = _1742;
    float _1748 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1738);
    float _1750 = _1746;
    if (_1589)
    {
        float _1752 = _1689 + (-1.0);
        _1649 = _1752;
    }
    float _1754 = _1649;
    int _1756 = _1677 + 64;
    uint _1758 = uint(int(uint(_1756) >> uint(2)));
    uint _1760 = uint(int(uint(int(_1758)) >> uint(2)));
    int _1762 = int(_1758) & 3;
    float _1764 = (*spvDescriptorSet0.vp_c15)._m0[int(_1760)][_1762];
    int _1766 = int(_1758) + 1;
    uint _1768 = uint(int(uint(_1766) >> uint(2)));
    int _1770 = _1766 & 3;
    float _1772 = (*spvDescriptorSet0.vp_c15)._m0[int(_1768)][_1770];
    float _1774 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1748);
    float _1776 = _1754;
    if (_1589)
    {
        float _1778 = _1543 * _1746;
        _1603 = _1778;
    }
    float _1780 = _1603;
    float _1782 = 0.0;
    if (_1589)
    {
        float _1784 = _1754 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1782 = _1784;
    }
    float _1786 = _1782;
    if (!_1589)
    {
        _1776 = _1545;
    }
    float _1788 = _1776;
    float _1790 = _1788;
    if (_1589)
    {
        float _1792 = _1545 * _1746;
        _1790 = _1792;
    }
    float _1794 = _1790;
    float _1796 = _1774 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (_1589)
    {
        float _1798 = fma(_1625, _1689, _1786);
        _1635 = _1798;
    }
    float _1800 = _1635;
    int _1802 = _1677 + 104;
    uint _1804 = uint(int(uint(_1802) >> uint(2)));
    uint _1806 = uint(int(uint(int(_1804)) >> uint(2)));
    int _1808 = int(_1804) & 3;
    float _1810 = (*spvDescriptorSet0.vp_c15)._m0[int(_1806)][_1808];
    int _1812 = int(_1804) + 1;
    uint _1814 = uint(int(uint(_1812) >> uint(2)));
    int _1816 = _1812 & 3;
    float _1818 = (*spvDescriptorSet0.vp_c15)._m0[int(_1814)][_1816];
    if (_1589)
    {
        float _1820 = _1780 * _1780;
        _1605 = _1820;
    }
    float _1822 = _1605;
    float _1824 = _1822;
    if (!_1589)
    {
        _1750 = _1553;
    }
    float _1826 = _1750;
    float _1828 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1830 = _1796 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1832 = _1826;
    int _1834 = as_type<int>(_1828);
    if (_1589)
    {
        float _1836 = _1794 * _1794;
        _1832 = _1836;
    }
    float _1838 = _1832;
    float _1840 = fma(_1800, _1800, _1822);
    float _1842 = 0.0;
    if (!_1712)
    {
        float _1844 = floor(_1555);
        _1842 = _1844;
    }
    float _1846 = _1842;
    int _1848 = _1677 + 80;
    uint _1850 = uint(int(uint(_1848) >> uint(2)));
    uint _1852 = uint(int(uint(int(_1850)) >> uint(2)));
    int _1854 = int(_1850) & 3;
    float _1856 = (*spvDescriptorSet0.vp_c15)._m0[int(_1852)][_1854];
    int _1858 = int(_1850) + 1;
    uint _1860 = uint(int(uint(_1858) >> uint(2)));
    int _1862 = _1858 & 3;
    float _1864 = (*spvDescriptorSet0.vp_c15)._m0[int(_1860)][_1862];
    float _1866 = -_1830;
    float _1868 = fma(_1866, _1828, 1.0);
    float _1870 = _1840 + _1838;
    if (!_1712)
    {
        int _1872 = _1619 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1874 = _1872 + _1587;
        _1834 = _1874;
    }
    int _1876 = _1834;
    float _1878 = -_1740;
    float _1880 = _1714 + _1878;
    float _1882 = log2(_1868);
    int _1884 = _1677 + 56;
    uint _1886 = uint(int(uint(_1884) >> uint(2)));
    uint _1888 = uint(int(uint(int(_1886)) >> uint(2)));
    int _1890 = int(_1886) & 3;
    float _1892 = (*spvDescriptorSet0.vp_c15)._m0[int(_1888)][_1890];
    int _1894 = int(_1886) + 1;
    uint _1896 = uint(int(uint(_1894) >> uint(2)));
    int _1898 = _1894 & 3;
    float _1900 = (*spvDescriptorSet0.vp_c15)._m0[int(_1896)][_1898];
    float _1902 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1904 = fma(_1611, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1902);
    float _1906 = precise::clamp(_1904, 0.0, 1.0);
    float _1908 = -_1906;
    float _1910 = _1908 + 1.0;
    if (!_1712)
    {
        float _1912 = -_1846;
        float _1914 = _1555 + _1912;
        _1824 = _1914;
    }
    float _1916 = _1824;
    int _1918 = _1677 + 88;
    uint _1920 = uint(int(uint(_1918) >> uint(2)));
    uint _1922 = uint(int(uint(int(_1920)) >> uint(2)));
    int _1924 = int(_1920) & 3;
    float _1926 = (*spvDescriptorSet0.vp_c15)._m0[int(_1922)][_1924];
    int _1928 = int(_1920) + 1;
    uint _1930 = uint(int(uint(_1928) >> uint(2)));
    int _1932 = _1928 & 3;
    float _1934 = (*spvDescriptorSet0.vp_c15)._m0[int(_1930)][_1932];
    float _1936 = _1517 * _1708;
    if (!_1712)
    {
        int _1938 = _1876 << 2;
        _1607 = _1938;
    }
    int _1940 = _1607;
    float _1942 = fma(_943, _1700, _1936);
    int _1944 = _1940;
    if (!_1712)
    {
        int _1946 = 12 & _1940;
        _1944 = _1946;
    }
    int _1948 = _1944;
    float _1950 = _1882 * 0.693147182464599609375;
    int _1952 = _1677 + 72;
    uint _1954 = uint(int(uint(_1952) >> uint(2)));
    uint _1956 = uint(int(uint(int(_1954)) >> uint(2)));
    int _1958 = int(_1954) & 3;
    float _1960 = (*spvDescriptorSet0.vp_c15)._m0[int(_1956)][_1958];
    int _1962 = int(_1954) + 1;
    uint _1964 = uint(int(uint(_1962) >> uint(2)));
    int _1966 = _1962 & 3;
    float _1968 = (*spvDescriptorSet0.vp_c15)._m0[int(_1964)][_1966];
    float _1970 = _1517 * _1736;
    float2 _5835 = float2(_1565, _1880);
    float _1972 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5835, float2(0.0), isnan(_5835)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5835, float2(0.0), isnan(_5835)), level(0.0)).x;
    float _1974 = _1950 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1976 = fma(_943, _1728, _1970);
    float _1978 = _1517 * _1772;
    float _1980 = rsqrt(_1870);
    float _1982 = fma(_943, _1764, _1978);
    float _1984 = fma(_945, _1810, _1942);
    float _1986 = _1984 + _1818;
    float _1988 = _1517 * _1864;
    int _1990 = as_type<int>(_1864);
    int _1992 = as_type<int>(_1856);
    if (!_1712)
    {
        uint _1994 = uint(int(uint(_1876) >> uint(2)));
        _1990 = int(_1994);
    }
    int _1996 = _1990;
    float _1998 = 1.0 / _1986;
    float _2000 = _1980 * _1780;
    float _2002 = fma(_943, _1856, _1988);
    float _2004 = _1980 * _1800;
    if (!_1712)
    {
        int _2006 = _1996 << 4;
        int _2008 = _2006 + _1948;
        _1992 = _2008;
    }
    int _2010 = _1992;
    float _2012 = _2000 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2014 = fma(_945, _1892, _1976);
    float _2016 = _1980 * _1794;
    float _2018 = abs(_1910);
    float _2020 = log2(_2018);
    float _2022 = -_2012;
    float _2024 = fma(_2004, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2022);
    float _2026 = _1469 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2028 = _1970;
    if (!_1712)
    {
        int _2030 = _2010 + 400;
        uint _2032 = uint(int(uint(_2030) >> uint(2)));
        uint _2034 = uint(int(uint(int(_2032)) >> uint(2)));
        int _2036 = int(_2032) & 3;
        float _2038 = (*spvDescriptorSet0.vp_c15)._m0[int(_2034)][_2036];
        _2028 = _2038;
    }
    float _2040 = _2028;
    float _2042 = -_2016;
    float _2044 = fma(_2042, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2024);
    float _2046 = fma(_945, _1926, _2002);
    float _2048 = _2014 + _1900;
    float _2050 = _1469 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2052 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2026);
    float _2054 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2050);
    float _2056 = _2048 * _1998;
    float _2058 = fma(_945, _1960, _1982);
    float _2060 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2052);
    float _2062 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2054);
    float _2064 = _2020 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2066 = _2058 + _1968;
    float _2068 = _1469 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _2070 = _2056 >= 0.0;
    float _2072 = _2060 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2074 = _2066 * _1998;
    float _2076 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2068);
    bool _2078 = _2056 <= 1.0;
    bool _2080 = _2078 && _2070;
    float _2082 = exp2(_2064);
    float _2084 = _2072 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2086 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2076);
    bool _2088 = _2074 >= 0.0;
    bool _2090 = _2088 && _2080;
    float _2092 = fma(_2044, -0.5, 0.5);
    float _2094 = fma(_2044, 0.5, 0.5);
    float _2096 = _2086 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _2098 = _2074 <= 1.0;
    bool _2100 = _2098 && _2090;
    float _2102 = _2062 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2104 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2084);
    float _2106 = sqrt(_2092);
    float _2108 = _2046 + _1934;
    float _2110 = _2004 + 1.0;
    float _2112 = fma(_2094, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2114 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2104);
    float _2116 = _2072 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2118 = -_2004;
    float _2120 = fma(_2082, _2110, _2118);
    float _2122 = fma(_2094, _2112, -0.212114393711090087890625);
    float _2124 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2114);
    float _2126 = _2072 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2128 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2116);
    float _2130 = fma(_2094, _2122, 1.570728778839111328125);
    float _2132 = 1.0 / _2124;
    float _2134 = _2094;
    float _2136 = _2124;
    if (_2100)
    {
        float _2138 = float(_1673);
        _2134 = _2138;
    }
    float _2140 = _2134;
    float _2142 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2126);
    float _2144 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2128);
    float _2146 = _2106 * 0.636619746685028076171875;
    float _2148 = _2108 * _1998;
    float _2150 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2142);
    float _2152 = _2140;
    float _2154 = _2150;
    if (_2100)
    {
        float _2156 = rint(_2140);
        float _2158 = precise::max(_2156, 0.0);
        uint _2160 = uint(_2158);
        uint _2162 = clamp(_2160, 0u, 65535u);
        _2152 = as_type<float>(_2162);
    }
    float _2164 = _2152;
    float _2166 = -_2130;
    float _2168 = fma(_2146, _2166, 1.0);
    float _2170 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2144);
    float _2172 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2150);
    float _2174 = _2066;
    float _2176 = _2170;
    float _2178 = _2172;
    if (!_1712)
    {
        float _2180 = floor(_1549);
        _2174 = _2180;
    }
    float _2182 = _2174;
    float _2184 = _2170 * _2132;
    float _2186 = _2172 * _2132;
    float _2188 = fma(_2120, 0.5, 0.5);
    float _2190 = fma(_2184, 0.5, 0.5);
    float _2192 = fma(_2186, -0.5, 0.5);
    float _2194 = _2074;
    if (_2100)
    {
        float3 _6216 = float3(_2056, _2074, float(as_type<int>(_2164)));
        float3 _6220 = select(_6216, float3(0.0), isnan(_6216));
        float _2196 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6220.xy, uint(rint(_6220.z)), _2148, level(0.0));
        _2194 = _2196;
    }
    float _2198 = _2194;
    float _2200 = _2004;
    if (!_1712)
    {
        float _2202 = rint(_2040);
        float _2204 = precise::max(_2202, 0.0);
        uint _2206 = uint(_2204);
        uint _2208 = clamp(_2206, 0u, 65535u);
        _2200 = as_type<float>(_2208);
    }
    float _2210 = _2200;
    if (!_1712)
    {
        float _2212 = -_2182;
        float _2214 = _1549 + _2212;
        _2154 = _2214;
    }
    float _2216 = _2154;
    float3 _6257 = float3(_2190, _2192, _1974);
    float _2218 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6257, float3(0.0), isnan(_6257)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6257, float3(0.0), isnan(_6257)), level(0.0)).x;
    float3 _6266 = float3(_2190, _2192, _1974);
    float4 _2221 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6266, float3(0.0), isnan(_6266)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6266, float3(0.0), isnan(_6266)), level(0.0)).xyzw;
    float _2223 = _2221.x;
    float _2225 = _2221.y;
    float _2227 = _2221.z;
    float _2229 = _2221.w;
    float2 _6282 = float2(_2168, _2188);
    float3 _2233 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6282, float2(0.0), isnan(_6282)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6282, float2(0.0), isnan(_6282)), level(0.0)).xyz;
    float _2235 = _2233.x;
    float _2237 = _2233.y;
    float _2239 = _2233.z;
    float _2241 = _1916;
    if (!_1712)
    {
        float3 _6303 = float3(_2216, _1916, float(as_type<int>(_2210)));
        float3 _6305 = select(_6303, float3(0.0), isnan(_6303));
        float _2243 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6305.xy, uint(rint(_6305.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6305.xy, uint(rint(_6305.z)), level(0.0)).x;
        _2241 = _2243;
    }
    float _2245 = _2241;
    float _2247 = abs(_1571);
    float _2249 = log2(_2247);
    float _2251 = _2072 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2253 = _2020 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2255 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2251);
    float _2257 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2255);
    float _2259 = _2124 * 0.5;
    float _2261 = exp2(_2253);
    bool _2263 = _1571 <= 8000.0;
    bool _2265 = isnan(_1571);
    bool _2267 = _2263 || _2265;
    bool _2269 = isnan(8000.0);
    bool _2271 = _2267 || _2269;
    float _2273 = float(_2271);
    float _2275 = _2249 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2277 = exp2(_2275);
    float _2279 = fma(_2172, -0.5, _2259);
    float _2281 = fma(_2277, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2283 = precise::clamp(_2281, 0.0, 1.0);
    float _2285 = fma(_2283, -2.0, 3.0);
    float _2287 = _2283 * _2283;
    float _2289 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2257);
    float _2291 = _2287 * _2285;
    float _2293 = _2289 + _2124;
    float _2295 = _2170 + _2124;
    float _2297 = -_2291;
    float _2299 = _2297 + 1.0;
    float _2301 = _2293 * 0.5;
    float _2303 = _2295 * 0.5;
    out.gl_Position.x = _2170;
    out.gl_Position.y = _2172;
    out.gl_Position.z = _2289;
    out.gl_Position.w = _2124;
    float _2305 = fma(_2299, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2291);
    out.m_84.x = _2303;
    out.m_84.y = _2279;
    out.m_84.z = _2301;
    out.m_84.w = _2124;
    float _2307 = _2273 * _2305;
    float _2309 = -_2261;
    float _2311 = _2309 + 1.0;
    float _2313 = _2307 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2315 = _2307;
    float _2317 = _2289;
    float _2319 = _2303;
    if (!_2100)
    {
        _2315 = 1.0;
    }
    float _2321 = _2315;
    float _2323 = _2311 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2325 = _2321;
    if (_1712)
    {
        _2176 = 1.0;
    }
    float _2327 = _2176;
    float _2329 = -_1972;
    float _2331 = _2329 + 1.0;
    float _2333 = _2331 * _2313;
    float _2335 = precise::clamp(_2333, 0.0, 1.0);
    float _2337 = _2327;
    if (_2100)
    {
        bool _2339 = _2198 >= _2148;
        bool _2341 = isnan(_2198);
        bool _2343 = _2339 || _2341;
        bool _2345 = isnan(_2148);
        bool _2347 = _2343 || _2345;
        float _2349 = float(_2347);
        _2325 = _2349;
    }
    float _2351 = _2325;
    if (!_1712)
    {
        int _2353 = _1876 << 4;
        int _2355 = _2353 + 2048;
        uint _2357 = uint(int(uint(_2355) >> uint(2)));
        uint _2359 = uint(int(uint(int(_2357)) >> uint(2)));
        int _2361 = int(_2357) & 3;
        float _2363 = (*spvDescriptorSet0.vp_c15)._m0[int(_2359)][_2361];
        int _2365 = int(_2357) + 1;
        uint _2367 = uint(int(uint(_2365) >> uint(2)));
        int _2369 = _2365 & 3;
        float _2371 = (*spvDescriptorSet0.vp_c15)._m0[int(_2367)][_2369];
        int _2373 = _2355 + 8;
        uint _2375 = uint(int(uint(_2373) >> uint(2)));
        uint _2377 = uint(int(uint(int(_2375)) >> uint(2)));
        int _2379 = int(_2375) & 3;
        float _2381 = (*spvDescriptorSet0.vp_c15)._m0[int(_2377)][_2379];
        int _2383 = int(_2375) + 1;
        uint _2385 = uint(int(uint(_2383) >> uint(2)));
        int _2387 = _2383 & 3;
        float _2389 = (*spvDescriptorSet0.vp_c15)._m0[int(_2385)][_2387];
        float _2391 = _1517 * _2371;
        float _2393 = fma(_943, _2363, _2391);
        float _2395 = fma(_945, _2381, _2393);
        float _2397 = _2395 + _2389;
        float _2399 = precise::clamp(_2397, 0.0, 1.0);
        float _2401 = -_2399;
        float _2403 = _2401 + _2245;
        float _2405 = fma(_2403, 500.0, 1.5);
        float _2407 = exp2(_2405);
        float _2409 = 0.0 + _2407;
        float _2411 = precise::clamp(_2409, 0.0, 1.0);
        _2337 = _2411;
        _2136 = _2389;
        _2178 = 500.0;
        _2317 = _2381;
    }
    float _2413 = _2337;
    float _2415 = _2136;
    float _2417 = _2178;
    float _2419 = _2317;
    float _2421 = _2323 * _2218;
    float _2423 = _2351 * _2413;
    float _2425 = -_2335;
    float _2427 = fma(_2425, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2429 = -_2323;
    float _2431 = _2429 + 1.0;
    float _2433 = _2229 * _2421;
    float _2435 = _2239 * _2421;
    float _2437 = -_2423;
    float _2439 = fma(_2437, _2427, 1.0);
    float _2441 = precise::clamp(_2439, 0.0, 1.0);
    bool _2443 = _1611 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2445 = isnan(_1611);
    bool _2447 = _2443 || _2445;
    bool _2449 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2451 = _2447 || _2449;
    float _2453 = fma(_2235, _2433, _2223);
    float _2455 = fma(_2237, _2433, _2225);
    float _2457 = _2441 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2459 = _2229 * _2431;
    float _2461 = fma(_2229, _2435, _2227);
    out.m_86.x = _2457;
    out.m_88.x = _2453;
    out.m_88.y = _2455;
    out.m_88.z = _2461;
    out.m_88.w = _2459;
    float _2463 = _2415;
    float _2465 = _2419;
    float _2467 = _2417;
    float _2469 = _2423;
    float _2471 = _2441;
    if (!_2451)
    {
        _2319 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2473 = _2319;
    float _2475 = _2473;
    float _2477 = _2473;
    if (!_2451)
    {
        _2463 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2479 = _2463;
    float _2481 = _2479;
    float _2483 = _2479;
    if (!_2451)
    {
        _2465 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2485 = _2465;
    float _2487 = _2485;
    float _2489 = _2485;
    if (!_2451)
    {
        _2467 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2491 = _2467;
    float _2493 = _2491;
    float _2495 = _2491;
    if (!_2451)
    {
        _2469 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2497 = _2469;
    float _2499 = _2497;
    float _2501 = _2497;
    if (!_2451)
    {
        _2471 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2503 = _2471;
    bool _2505 = !_2451;
    float _2507 = _2503;
    float _2509 = _2503;
    if (!_2505)
    {
        bool _2511 = _1611 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2513 = isnan(_1611);
        bool _2515 = _2511 || _2513;
        bool _2517 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2519 = _2515 || _2517;
        if (!_2519)
        {
            float _2521 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2523 = _1611 + _2521;
            float _2525 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2527 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2525;
            float _2529 = 1.0 / _2527;
            float _2531 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2533 = _2531 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2535 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2537 = _2535 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2539 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2541 = _2539 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2543 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2545 = _2543 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2547 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2549 = _2547 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2551 = _2523 * _2529;
            float _2553 = precise::clamp(_2551, 0.0, 1.0);
            float _2555 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2557 = _2555 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2559 = fma(_2553, _2533, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2561 = fma(_2553, _2557, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2563 = fma(_2553, _2537, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2565 = fma(_2553, _2541, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2567 = fma(_2553, _2545, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2569 = fma(_2553, _2549, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2483 = _2561;
            _2501 = _2567;
            _2477 = _2559;
            _2495 = _2565;
            _2489 = _2563;
            _2509 = _2569;
            _2571 = true;
        }
        else
        {
            bool _2573 = _1611 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2575 = isnan(_1611);
            bool _2577 = _2573 || _2575;
            bool _2579 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2581 = _2577 || _2579;
            if (!_2581)
            {
                _2475 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2583 = _2475;
            _2477 = _2583;
            if (!_2581)
            {
                _2481 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2585 = _2481;
            _2483 = _2585;
            if (!_2581)
            {
                _2487 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2587 = _2487;
            _2489 = _2587;
            if (!_2581)
            {
                _2493 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2589 = _2493;
            _2495 = _2589;
            if (!_2581)
            {
                _2499 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2591 = _2499;
            _2501 = _2591;
            if (!_2581)
            {
                _2507 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2593 = _2507;
            bool _2595 = !_2581;
            _2509 = _2593;
            if (!_2595)
            {
                bool _2597 = _1611 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2599 = isnan(_1611);
                bool _2601 = _2597 || _2599;
                bool _2603 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2605 = _2601 || _2603;
                if (!_2605)
                {
                    float _2607 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2609 = _1611 + _2607;
                    float _2611 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2613 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2611;
                    float _2615 = 1.0 / _2613;
                    float _2617 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2619 = _2617 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2621 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2623 = _2621 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2625 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2627 = _2625 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2629 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2631 = _2629 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2633 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2635 = _2633 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2637 = _2609 * _2615;
                    float _2639 = precise::clamp(_2637, 0.0, 1.0);
                    float _2641 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2643 = _2641 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2645 = fma(_2639, _2619, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2647 = fma(_2639, _2643, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2649 = fma(_2639, _2623, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2651 = fma(_2639, _2627, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2653 = fma(_2639, _2631, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2655 = fma(_2639, _2635, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2483 = _2647;
                    _2501 = _2653;
                    _2477 = _2645;
                    _2495 = _2651;
                    _2489 = _2649;
                    _2509 = _2655;
                    _2571 = true;
                }
                else
                {
                    _2483 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2501 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2477 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2495 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2489 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2509 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2571 = false;
    float _2657 = _2483;
    float _2659 = _2501;
    float _2661 = _2477;
    float _2663 = _2495;
    float _2665 = _2489;
    float _2667 = _2509;
    float _2669 = fma(_1373, -0.5, 0.5);
    float _2671 = precise::clamp(_2669, 0.0, 1.0);
    float _2673 = -_2657;
    float _2675 = _2673 + _2659;
    float _2677 = -_2661;
    float _2679 = _2677 + _2663;
    float _2681 = -_2665;
    float _2683 = _2681 + _2667;
    bool _2685 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2687 = fma(_2671, _2675, _2657);
    float _2689 = fma(_2671, _2679, _2661);
    float _2691 = fma(_2671, _2683, _2665);
    float _2693 = _2687 * 0.586610972881317138671875;
    out.m_90.x = 0.0;
    float _2695 = fma(_2689, 0.298911988735198974609375, _2693);
    float _2697 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2699 = fma(_2691, 0.114477999508380889892578125, _2695);
    out.m_61.x = _2697;
    float _2701 = -_2699;
    float _2703 = _2689 + _2701;
    float _2705 = -_2699;
    float _2707 = _2687 + _2705;
    float _2709 = -_2699;
    float _2711 = _2691 + _2709;
    float _2713 = fma(_2703, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2699);
    float _2715 = fma(_2707, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2699);
    float _2717 = fma(_2711, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2699);
    out.m_92.x = _2713;
    out.m_92.y = _2715;
    out.m_92.z = _2717;
    if (!_2685)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2719 = -_1469;
    float _2721 = _2719 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2723 = -_1471;
    float _2725 = _2723 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2727 = -_1473;
    float _2729 = _2727 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2731 = _2721 * _2721;
    float _2733 = fma(_2725, _2725, _2731);
    float _2735 = fma(_2729, _2729, _2733);
    float _2737 = sqrt(_2735);
    float _2739 = rsqrt(_2735);
    float _2741 = -_2737;
    float _2743 = _2741 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2745 = _2743 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2747 = precise::clamp(_2745, 0.0, 1.0);
    float _2749 = _2725 * _2739;
    float _2751 = _2721 * _2739;
    float _2753 = abs(_2747);
    float _2755 = log2(_2753);
    float _2757 = _2729 * _2739;
    float _2759 = _2749 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2761 = _1373 * _2751;
    float _2763 = -_2751;
    float _2765 = -_2759;
    float _2767 = fma(_2763, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2765);
    float _2769 = fma(_1363, _2749, _2761);
    float _2771 = -_2757;
    float _2773 = fma(_2771, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2767);
    float _2775 = fma(_1375, _2757, _2769);
    float _2777 = precise::clamp(_2775, 0.0, 1.0);
    float _2779 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2781 = _2773 + _2779;
    float _2783 = _2755 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2785 = _2781 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2787 = precise::clamp(_2785, 0.0, 1.0);
    float _2789 = exp2(_2783);
    float _2791 = _2789 * _2787;
    float _2793 = _2777 * _2791;
    float _2795 = _2793 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2797 = _2793 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2799 = _2793 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _2795;
    out.m_90.y = _2797;
    out.m_90.z = _2799;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2571 = false;
    bool _1423 = false;
    bool _497 = false;
    bool _309 = false;
    bool _207 = false;
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
        float _2855 = as_type<float>(_127);
        out.gl_Position.z = _2855;
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
        float _2925 = as_type<float>(_165);
        out.gl_Position.z = _2925;
    }
    if (_155)
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
        float _189 = in.m_68.x;
        float _191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _193 = _189 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _195 = fma(_193, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
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
        float _213 = _143 * _211;
        _205 = _213;
    }
    _207 = false;
    float _215 = _205;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _219 = _215 + _217;
    bool _221 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _223 = isnan(_215);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _233;
    float _237 = -_231;
    float _239 = _237 + 1.0;
    bool _241 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _243 = isnan(_215);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _253;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _259 = 1.0 / _235;
    float _261 = _251 * _239;
    float _263 = -_251;
    float _265 = _263 + 1.0;
    float _267 = _219 * _259;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _269;
    float _273 = fma(_255, _267, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _275 = fma(_271, _267, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _277 = _273 * _261;
    float _279 = _275 * _261;
    float _281 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[143].x, _277);
    float _283 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[143].y, _279);
    float _285 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[144].x, _281);
    float _287 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[144].y, _283);
    bool _289 = !_257;
    float _307;
    if (!_289)
    {
        float _291 = in.m_68.x;
        float _293 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _295 = _291 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[11].y, _143);
        float _299 = _297 * _293;
        float _301 = floor(_299);
        float _303 = -_301;
        float _305 = _299 + _303;
        _307 = _305;
        _309 = true;
    }
    else
    {
        float _311 = float(_111);
        float _313 = 1.0 / _311;
        float _315 = _143 * _313;
        _307 = _315;
    }
    _309 = false;
    float _317 = _307;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _325 = _323 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _327 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _329 = isnan(_317);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = 1.0 / _321;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _343 = _341 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _345 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _347 = isnan(_317);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _353 = _349 || _351;
    float _355 = float(_353);
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _357;
    float _361 = -_337;
    float _363 = _361 + 1.0;
    bool _365 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _367 = isnan(_317);
    bool _369 = _365 || _367;
    bool _371 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _373 = _369 || _371;
    float _375 = float(_373);
    bool _377 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _379 = 1.0 / _325;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _385 = _355 * _363;
    float _387 = -_355;
    float _389 = _387 + 1.0;
    float _391 = _375 * _389;
    float _393 = 1.0 / _343;
    float _395 = _359 * _339;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _399 = _317 + _397;
    float _401 = -_375;
    float _403 = _401 + 1.0;
    float _405 = fma(_395, _399, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _409 = _317 + _407;
    float _411 = _383 * _379;
    bool _413 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _415 = isnan(_317);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _425;
    float _429 = _405 * _391;
    float _431 = fma(_411, _409, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _435 = _317 + _433;
    float _437 = -_423;
    float _439 = _437 + 1.0;
    float _441 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[115].x, _429);
    float _443 = _427 * _393;
    float _445 = _337 * _439;
    float _447 = fma(_431, _385, _441);
    float _449 = fma(_443, _435, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _451 = fma(_449, _445, _447);
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _457 = fma(_423, (*spvDescriptorSet0.vp_c9)._m0[118].x, _451);
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _461 = _453 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _463 = _455 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _465 = _457 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _467 = _459 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _469 = in.m_70.x;
    float _471 = in.m_70.y;
    out.m_72.x = _461;
    out.m_72.y = _463;
    out.m_72.z = _467;
    out.m_72.w = _465;
    float _473 = _287 * _471;
    float _475 = _285 * _469;
    bool _477 = !_377;
    float _495;
    if (!_477)
    {
        float _479 = in.m_68.x;
        float _481 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _483 = _479 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _485 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[11].w, _143);
        float _487 = _485 * _481;
        float _489 = floor(_487);
        float _491 = -_489;
        float _493 = _487 + _491;
        _495 = _493;
        _497 = true;
    }
    else
    {
        float _499 = float(_111);
        float _501 = 1.0 / _499;
        float _503 = _143 * _501;
        _495 = _503;
    }
    _497 = false;
    float _505 = _495;
    float _507 = in.m_68.z;
    float _509 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _511 = log2(_509);
    float _513 = _473 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _515 = in.m_68.x;
    float _517 = _475 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _519 = in.m_68.y;
    float _521 = _507 * 2.0;
    float _523 = _515 * 2.0;
    float _525 = floor(_521);
    float _527 = _519 * 2.0;
    float _529 = floor(_523);
    float _531 = floor(_527);
    bool _533 = _525 >= 0.0;
    bool _535 = isnan(_525);
    bool _537 = _533 || _535;
    bool _539 = isnan(0.0);
    bool _541 = _537 || _539;
    bool _543 = _525 > 0.0;
    float _545 = _515 + _519;
    bool _547 = _529 >= 0.0;
    bool _549 = isnan(_529);
    bool _551 = _547 || _549;
    bool _553 = isnan(0.0);
    bool _555 = _551 || _553;
    float _557 = _545 + (-1.0);
    bool _559 = _529 > 0.0;
    float _561 = _507 + _519;
    int _563 = _555 ? 0 : 1;
    float _565 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _567 = _561 + (-1.0);
    bool _569 = _531 > 0.0;
    bool _571 = _531 >= 0.0;
    bool _573 = isnan(_531);
    bool _575 = _571 || _573;
    bool _577 = isnan(0.0);
    bool _579 = _575 || _577;
    float _581 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _583 = _541 ? 0 : 1;
    int _585 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _587 = _585 != 0;
    int _589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _591 = _589 != 0;
    int _593 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _595 = _593 != 0;
    float _597 = _511 * _143;
    int _599 = _579 ? 0 : 1;
    int _601 = ~_583;
    int _603 = _601 + 1;
    int _605 = _603 + 1;
    float _607 = exp2(_597);
    int _609 = ~_599;
    int _611 = _609 + 1;
    int _613 = _611 + 1;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _617 = 1.0 + _615;
    int _619 = _605;
    int _621 = _613;
    bool _623 = _591;
    if (!_543)
    {
        int _625 = ~_583;
        int _627 = _625 + 1;
        _619 = _627;
    }
    int _629 = _619;
    if (!_569)
    {
        int _631 = ~_599;
        int _633 = _631 + 1;
        _621 = _633;
    }
    int _635 = _621;
    int _637 = ~_563;
    int _639 = _637 + 1;
    int _641 = _639 + 1;
    float _643 = in.m_74.x;
    float _645 = in.m_74.y;
    float _647 = in.m_74.z;
    int _649 = _641;
    if (!_559)
    {
        int _651 = ~_563;
        int _653 = _651 + 1;
        _649 = _653;
    }
    int _655 = _649;
    float _657 = 1.0 / _617;
    bool _659 = !_587;
    int _661 = _659 ? 0 : 1;
    bool _663 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _665 = isnan(1.0);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _671 = _667 || _669;
    float _673 = -_607;
    float _675 = _673 + 1.0;
    int _677 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2048;
    bool _679 = _677 != 0;
    int _681 = abs(_661);
    bool _683 = !_591;
    int _685 = _683 ? 0 : 1;
    bool _687 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _689 = isnan(0.0);
    bool _691 = _687 || _689;
    bool _693 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _695 = _691 || _693;
    bool _697 = !_595;
    int _699 = _697 ? 0 : 1;
    float _701 = float(_681);
    float _703 = float(_629);
    int _705 = abs(_685);
    int _707 = abs(_699);
    float _709 = _701 * _703;
    float _711 = _695 ? _675 : 0.0;
    float _713 = float(_705);
    float _715 = _709 * (-2.0);
    float _717 = float(_655);
    float _719 = _711;
    if (_671)
    {
        float _721 = _711 * _657;
        _145 = _721;
    }
    float _723 = _145;
    float _725 = float(_707);
    if (_679)
    {
        float _727 = _519 * 3.1415927410125732421875;
        _719 = _727;
    }
    float _729 = _719;
    float _731 = float(_635);
    float _733 = _713 * _717;
    float _735 = _515 + (-0.5);
    float _737 = _729;
    if (_679)
    {
        float _739 = _729 * 0.15915493667125701904296875;
        _737 = _739;
    }
    float _741 = _737;
    float _743 = _725 * _731;
    float _745 = fma(_715, _643, _643);
    float _747 = _733 * (-2.0);
    float _749 = fma(_565, _715, _565);
    float _751 = _741;
    if (_679)
    {
        float _753 = _741 * 6.283185482025146484375;
        float _755 = sin(_753);
        _751 = _755;
    }
    float _757 = _751;
    float _759 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[196].x, _745);
    float _761 = fma(_747, _645, _645);
    float _763 = _515 + _507;
    float _765 = fma(_581, _747, _581);
    float _767 = fma(_749, _723, _759);
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _771 = _769 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _773 = _763 + (-1.0);
    float _775 = _743 * (-2.0);
    float _777 = _767 * 0.15915493667125701904296875;
    float _779 = in.m_68.w;
    float _781 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _783 = 1.0 / _771;
    float _785 = fma(_775, _647, _647);
    bool _787 = _519 > 0.5;
    float _789 = _519 + (-0.5);
    if (_679)
    {
        bool _791 = _757 > 0.5;
        _623 = _791;
    }
    bool _793 = _623;
    float _795 = _507 + (-0.5);
    float _797 = fma(_781, _775, _781);
    float _799 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[196].y, _761);
    int _801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1024;
    bool _803 = _801 != 0;
    float _805 = in.m_58.x;
    float _807 = in.m_58.y;
    float _809 = in.m_58.z;
    float _811 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[196].z, _785);
    float _813 = fma(_765, _723, _799);
    float _815 = _799;
    if (!_679)
    {
        _815 = _185;
    }
    float _817 = _815;
    float _819 = _777 * 6.283185482025146484375;
    float _821 = sin(_819);
    float _823 = fma(_797, _723, _811);
    float _825 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _827 = _817;
    if (_679)
    {
        float _829 = -_185;
        float _831 = _793 ? _829 : _185;
        _827 = _831;
    }
    float _833 = _827;
    float _835 = _813 * 0.15915493667125701904296875;
    int _837 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _839 = _837 != 0;
    float _841 = _513 * _825;
    int _843 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _845 = _843 != 0;
    float _847 = _777 * 6.283185482025146484375;
    float _849 = cos(_847);
    int _851 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _853 = _851 != 0;
    float _855 = _823 * 0.15915493667125701904296875;
    int _857 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _859 = _857 != 0;
    float _861 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _863 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _865 = _507 > 0.5;
    float _867 = _835 * 6.283185482025146484375;
    float _869 = sin(_867);
    float _871 = -_185;
    int _873 = _787 ? as_type<int>(_871) : as_type<int>(_185);
    bool _875 = _779 > 0.5;
    float _877 = _517 * _861;
    float _879 = _807 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _881 = _807 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _883 = _807 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _885 = _835 * 6.283185482025146484375;
    float _887 = cos(_885);
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _891 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _889;
    float _893 = fma(_805, (*spvDescriptorSet0.vp_c10)._m0[5].x, _881);
    float _895 = fma(_805, (*spvDescriptorSet0.vp_c10)._m0[4].x, _879);
    float _897 = -_185;
    int _899 = _875 ? as_type<int>(_897) : as_type<int>(_185);
    float _901 = _891 * _783;
    float _903 = fma(_809, (*spvDescriptorSet0.vp_c10)._m0[5].z, _893);
    float _905 = _855 * 6.283185482025146484375;
    float _907 = sin(_905);
    float _909 = fma(_805, (*spvDescriptorSet0.vp_c10)._m0[6].x, _883);
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _913 = _505 + _911;
    float _915 = fma(_809, (*spvDescriptorSet0.vp_c10)._m0[4].z, _895);
    float _917 = _849 * _869;
    float _919 = fma(_809, (*spvDescriptorSet0.vp_c10)._m0[6].z, _909);
    float _921 = fma(_901, _913, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _923 = _821 * _869;
    float _925 = _855 * 6.283185482025146484375;
    float _927 = cos(_925);
    float _929 = _849 * _887;
    float _931 = _821 * _887;
    float _933 = _909;
    float _935 = _869;
    bool _937 = _875;
    if (_803)
    {
        float _939 = _515 * 3.1415927410125732421875;
        _933 = _939;
    }
    float _941 = _933;
    float _943 = _915 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _945 = _919 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _947 = _903 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _949 = -_841;
    float _951 = _907 * _949;
    float _953 = fma(_907, _929, _923);
    float _955 = fma(_907, _923, _929);
    bool _957 = !_845;
    float _959 = _957 ? _185 : as_type<float>(_873);
    float _961 = -_931;
    float _963 = fma(_907, _917, _961);
    bool _965 = _515 > 0.5;
    float _967 = -_917;
    float _969 = fma(_907, _931, _967);
    bool _971 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _973 = isnan(_505);
    bool _975 = _971 || _973;
    bool _977 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _979 = _975 || _977;
    float _981 = float(_979);
    float _983 = _849 * _927;
    float _985 = _821 * _927;
    float _987 = _887 * _927;
    float _989 = _869 * _927;
    bool _991 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _993 = isnan(_505);
    bool _995 = _991 || _993;
    bool _997 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _999 = _995 || _997;
    float _1001 = float(_999);
    float _1003 = _983 * _841;
    float _1005 = _963;
    float _1007 = _969;
    if (_803)
    {
        float _1009 = _941 * 0.15915493667125701904296875;
        _935 = _1009;
    }
    float _1011 = _935;
    float _1013 = _985 * _841;
    float _1015 = fma(_987, _877, _951);
    float _1017 = -_1001;
    float _1019 = _1017 + 1.0;
    float _1021 = fma(_953, _877, _1003);
    float _1023 = fma(_969, _877, _1013);
    float _1025 = _1011;
    if (_803)
    {
        float _1027 = _1011 * 6.283185482025146484375;
        float _1029 = sin(_1027);
        _1025 = _1029;
    }
    float _1031 = _1025;
    float _1033 = _981 * _1019;
    float _1035 = fma(_963, _863, _1021);
    float _1037 = fma(_989, _863, _1015);
    float _1039 = fma(_955, _863, _1023);
    float _1041 = _921 * _1033;
    float _1043 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1045 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1047 = -_981;
    float _1049 = _1047 + 1.0;
    float _1051 = _983 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1053 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1043);
    float _1055 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1045);
    float _1057 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1041);
    float _1059 = _983 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1061 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1053);
    float _1063 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1055);
    if (_803)
    {
        bool _1065 = _1031 > 0.5;
        _937 = _1065;
    }
    bool _1067 = _937;
    float _1069 = fma(_1001, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1057);
    float _1071 = _1061 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1073 = _1063 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1075 = _983 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1077 = -_907;
    float _1079 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1051);
    float _1081 = _943 + _1071;
    float _1083 = _945 + _1073;
    float _1085 = -_907;
    float _1087 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1059);
    float _1089 = -_907;
    float _1091 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1075);
    float _1093 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1095 = _1081 + _1093;
    float _1097 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1099 = _1083 + _1097;
    float _1101 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1079);
    float _1103 = _953 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1105 = _1095 * _1095;
    float _1107 = _1099 * _1099;
    float _1109 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1111 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1103);
    float _1113 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1087);
    float _1115 = _1105 + _1107;
    float _1117 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1091);
    float _1119 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1109);
    float _1121 = _953 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1123 = sqrt(_1115);
    bool _1125 = !_859;
    float _1127 = _1125 ? _185 : as_type<float>(_899);
    float _1129 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1131 = _963 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1133 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1121);
    float _1135 = _963 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1137 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1119);
    float _1139 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1131);
    float _1141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1143 = _953 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1145 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1135);
    float _1147 = _1137 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1149 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1111);
    float _1151 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1143);
    float _1153 = _963 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1155 = _947 + _1147;
    bool _1157 = _1123 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1159 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1161 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1153);
    float _1163 = _1129 * _1101;
    float _1165 = _1129 * _1113;
    float _1167 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1151);
    float _1169 = _1129 * _1117;
    float _1171 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1133);
    float _1173 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].z;
    float _1175 = _1151;
    float _1177 = _1147;
    float _1179 = _1105;
    float _1181 = _1107;
    if (!_1157)
    {
        _1175 = _1081;
    }
    float _1183 = _1175;
    float _1185 = _1183;
    if (!_1157)
    {
        _1005 = _1083;
    }
    float _1187 = _1005;
    float _1189 = _1187;
    if (!_1157)
    {
        _1177 = _1155;
    }
    float _1191 = _1177;
    bool _1193 = !_1157;
    float _1195 = _1191;
    if (!_1193)
    {
        float _1197 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1199 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1201 = _1123 + _1199;
        float _1203 = _1155 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1205 = rsqrt(_1115);
        float _1207 = _1201 * _1197;
        float _1209 = _1207 * 0.15915493667125701904296875;
        float _1211 = _1209 * 6.283185482025146484375;
        float _1213 = sin(_1211);
        float _1215 = _1209 * 6.283185482025146484375;
        float _1217 = cos(_1215);
        float _1219 = fma(_1213, _1203, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1221 = _1205 * _1219;
        float _1223 = fma(_1095, _1221, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1225 = _1217 + (-1.0);
        float _1227 = fma(_1099, _1221, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1229 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1231 = _1223 + _1229;
        float _1233 = _1225 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1235 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1237 = _1227 + _1235;
        float _1239 = _1231 * _1231;
        float _1241 = fma(_1155, _1217, _1233);
        float _1243 = _1237 * _1237;
        _1195 = _1241;
        _1007 = _1225;
        _1179 = _1239;
        _1181 = _1243;
        _1185 = _1223;
        _1189 = _1227;
    }
    float _1245 = _1195;
    float _1247 = _1007;
    float _1249 = _1179;
    float _1251 = _1181;
    float _1253 = _1185;
    float _1255 = _1189;
    float _1257 = -_181;
    int _1259 = _965 ? as_type<int>(_1257) : as_type<int>(_181);
    float _1261 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1263 = -_181;
    int _1265 = _865 ? as_type<int>(_1263) : as_type<int>(_181);
    float _1267 = -_959;
    float _1269 = _1267 + 0.5;
    float _1271 = _1247;
    if (!_803)
    {
        _1271 = _181;
    }
    float _1273 = _1271;
    float _1275 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].w;
    float _1277 = _1273;
    if (_803)
    {
        float _1279 = -_181;
        float _1281 = _1067 ? _1279 : _181;
        _1277 = _1281;
    }
    float _1283 = _1277;
    float _1285 = -_1127;
    float _1287 = _1285 + 0.5;
    bool _1289 = !_839;
    float _1291 = _1289 ? _181 : as_type<float>(_1259);
    float _1293 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1139);
    bool _1295 = !_853;
    float _1297 = _1295 ? _181 : as_type<float>(_1265);
    float _1299 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1301 = _1245 + _1299;
    float _1303 = _1283 + 0.5;
    float _1305 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1161);
    float _1307 = _1291 + 0.5;
    float _1309 = fma(_1301, _1301, _1249);
    float _1311 = -_833;
    float _1313 = _1311 + 0.5;
    float _1315 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1317 = _1303 * (*spvDescriptorSet0.vp_c9)._m0[105].x;
    float _1319 = _1309 + _1251;
    float _1321 = _1313 * (*spvDescriptorSet0.vp_c9)._m0[105].y;
    float _1323 = _1307 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1325 = _1317 * _1173;
    float _1327 = _1269 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1329 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1331 = _1323 * _1141;
    float _1333 = _1327 * _1159;
    float _1335 = _1287 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1337 = _1297 + 0.5;
    float _1339 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1145);
    float _1341 = sqrt(_1319);
    float _1343 = _1335 * _1315;
    float _1345 = fma(_1261, _1171, _1163);
    float _1347 = fma(_1261, _1149, _1165);
    float _1349 = fma(_1261, _1167, _1169);
    float _1351 = _1337 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1353 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1355 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1357 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1359 = _1321 * _1275;
    float _1361 = _1351 * _1329;
    float _1363 = _1293 + _1345;
    float _1365 = _1353 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1367 = _1355 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1369 = _1357 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1371 = _1069 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1373 = _1339 + _1347;
    float _1375 = _1305 + _1349;
    out.m_76.x = _1331;
    out.m_76.y = _1333;
    out.m_76.z = _1361;
    out.m_76.w = _1343;
    bool _1377 = _1341 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1379 = isnan(_1341);
    bool _1381 = _1377 || _1379;
    bool _1383 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1385 = _1381 || _1383;
    out.m_78.x = _1365;
    out.m_78.y = _1367;
    out.m_78.z = _1369;
    out.m_78.w = _1371;
    out.m_80.x = _1325;
    out.m_80.y = _1359;
    out.m_82.x = _1363;
    out.m_82.y = _1373;
    out.m_82.z = _1375;
    float _1387 = _1345;
    if (!_1385)
    {
        _1387 = 1.0;
    }
    float _1389 = _1387;
    bool _1391 = !_1385;
    float _1393 = _1389;
    if (!_1391)
    {
        bool _1395 = _1341 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1397 = isnan(_1341);
        bool _1399 = _1395 || _1397;
        bool _1401 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1403 = _1399 || _1401;
        if (!_1403)
        {
            float _1405 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1407 = _1341 + _1405;
            float _1409 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1411 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1409;
            float _1413 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1415 = _1413 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1417 = 1.0 / _1411;
            float _1419 = _1407 * _1417;
            float _1421 = fma(_1419, _1415, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1393 = _1421;
            _1423 = true;
        }
        else
        {
            bool _1425 = _1341 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1427 = isnan(_1341);
            bool _1429 = _1425 || _1427;
            bool _1431 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1433 = _1429 || _1431;
            if (!_1433)
            {
                float _1435 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1437 = _1341 + _1435;
                float _1439 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1441 = _1439 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1443 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1445 = _1443 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1447 = 1.0 / _1441;
                float _1449 = _1437 * _1447;
                float _1451 = fma(_1449, _1445, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1393 = _1451;
                _1423 = true;
            }
            else
            {
                _1393 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1423 = false;
    float _1453 = _1393;
    float _1455 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1457 = _1245 + _1455;
    float _1459 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1461 = _1253 + _1459;
    float _1463 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1465 = _1255 + _1463;
    float _1467 = _947 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1469 = fma(_1457, _1453, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1471 = fma(_1461, _1453, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1473 = fma(_1465, _1453, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1475 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1467);
    float _1477 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1479 = _1469 + _1477;
    float _1481 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1483 = _1471 + _1481;
    float _1485 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1487 = _1473 + _1485;
    float _1489 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1475);
    float _1491 = _1479 * _1479;
    float _1493 = _947 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1495 = _1489 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1497 = fma(_1483, _1483, _1491);
    float _1499 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1493);
    float _1501 = 1.0 / _1495;
    float _1503 = fma(_1487, _1487, _1497);
    float _1505 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1499);
    float _1507 = _1505 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1509 = rsqrt(_1503);
    float _1511 = _1507 + _1495;
    float _1513 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1515 = fma(_943, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1517 = _947 + _1513;
    float _1519 = _1511 * _1501;
    float _1521 = _1519 * 0.5;
    float _1523 = floor(_1515);
    float _1525 = _1517 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1527 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1529 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1527);
    float _1531 = _1517 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1533 = fma(_943, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1525);
    float _1535 = _1509 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1537 = fma(_943, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1531);
    float _1539 = 1.0 / _1529;
    float _1541 = fma(_945, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1533);
    float _1543 = _1483 * _1535;
    float _1545 = _1487 * _1535;
    float _1547 = fma(_945, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1537);
    float _1549 = _1541 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1551 = _1543 * _1543;
    float _1553 = _1545 * _1545;
    float _1555 = _1547 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1557 = trunc(_1549);
    int _1559 = int(_1557);
    float _1561 = _1551 + _1553;
    float _1563 = -_1523;
    float _1565 = _1515 + _1563;
    float _1567 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1569 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1571 = _1539 * _1569;
    float _1573 = sqrt(_1561);
    bool _1575 = _1571 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1577 = _1571 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1579 = trunc(_1555);
    int _1581 = int(_1579);
    int _1583 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1585 = _1559 + _1583;
    int _1587 = _1585 + 1;
    bool _1589 = _1573 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1591 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1593 = _1573 + _1591;
    int _1595 = 2;
    float _1597 = _1535;
    float _1599 = _1561;
    float _1601 = _1593;
    float _1603 = _1543;
    float _1605 = _1551;
    int _1607 = as_type<int>(_1555);
    if (!_1575)
    {
        _1595 = 1;
    }
    int _1609 = _1595;
    float _1611 = sqrt(_1503);
    float _1613 = precise::max(0.0, _1567);
    int _1615 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1617 = _1581 + _1615;
    int _1619 = _1617 + 1;
    float _1621 = -_1535;
    float _1623 = -_1613;
    float _1625 = fma(_1479, _1621, _1623);
    int _1627 = _1587 | _1619;
    float _1629 = _1501;
    int _1631 = _1609;
    float _1633 = as_type<float>(_1627);
    float _1635 = _1625;
    if (_1589)
    {
        float _1637 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1629 = _1637;
    }
    float _1639 = _1629;
    if (_1589)
    {
        float _1641 = _1625 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1597 = _1641;
    }
    float _1643 = _1597;
    if (_1589)
    {
        float _1645 = rsqrt(_1561);
        _1599 = _1645;
    }
    float _1647 = _1599;
    float _1649 = _1647;
    if (_1589)
    {
        float _1651 = _1593 * _1639;
        _1601 = _1651;
    }
    float _1653 = _1601;
    float _1655 = 0.0;
    if (_1589)
    {
        float _1657 = _1653 * 0.15915493667125701904296875;
        _1655 = _1657;
    }
    float _1659 = _1655;
    bool _1661 = !_1575;
    int _1663 = _1661 ? 0 : 1;
    float _1665 = _1547;
    if (_1589)
    {
        float _1667 = _1659 * 6.283185482025146484375;
        float _1669 = sin(_1667);
        _1665 = _1669;
    }
    float _1671 = _1665;
    if (!_1577)
    {
        _1631 = _1663;
    }
    int _1673 = _1631;
    bool _1675 = _1587 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1677 = _1673 << 6;
    bool _1679 = _1627 < 0;
    bool _1681 = _1679 || _1675;
    float _1683 = _1659;
    if (_1589)
    {
        float _1685 = _1659 * 6.283185482025146484375;
        float _1687 = cos(_1685);
        _1683 = _1687;
    }
    float _1689 = _1683;
    int _1691 = _1677 + 96;
    uint _1694 = uint(int(uint(_1691) >> uint(2)));
    uint _1696 = uint(int(uint(int(_1694)) >> uint(2)));
    int _1698 = int(_1694) & 3;
    float _1700 = (*spvDescriptorSet0.vp_c15)._m0[int(_1696)][_1698];
    int _1702 = int(_1694) + 1;
    uint _1704 = uint(int(uint(_1702) >> uint(2)));
    int _1706 = _1702 & 3;
    float _1708 = (*spvDescriptorSet0.vp_c15)._m0[int(_1704)][_1706];
    bool _1710 = _1619 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1712 = _1710 || _1681;
    float _1714 = fma(_945, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    if (_1589)
    {
        float _1716 = fma(_1671, _1643, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1633 = _1716;
    }
    float _1718 = _1633;
    int _1720 = _1677 + 48;
    uint _1722 = uint(int(uint(_1720) >> uint(2)));
    uint _1724 = uint(int(uint(int(_1722)) >> uint(2)));
    int _1726 = int(_1722) & 3;
    float _1728 = (*spvDescriptorSet0.vp_c15)._m0[int(_1724)][_1726];
    int _1730 = int(_1722) + 1;
    uint _1732 = uint(int(uint(_1730) >> uint(2)));
    int _1734 = _1730 & 3;
    float _1736 = (*spvDescriptorSet0.vp_c15)._m0[int(_1732)][_1734];
    float _1738 = _1469 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1740 = floor(_1714);
    float _1742 = 0.0;
    if (_1589)
    {
        float _1744 = _1647 * _1718;
        _1742 = _1744;
    }
    float _1746 = _1742;
    float _1748 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1738);
    float _1750 = _1746;
    if (_1589)
    {
        float _1752 = _1689 + (-1.0);
        _1649 = _1752;
    }
    float _1754 = _1649;
    int _1756 = _1677 + 64;
    uint _1758 = uint(int(uint(_1756) >> uint(2)));
    uint _1760 = uint(int(uint(int(_1758)) >> uint(2)));
    int _1762 = int(_1758) & 3;
    float _1764 = (*spvDescriptorSet0.vp_c15)._m0[int(_1760)][_1762];
    int _1766 = int(_1758) + 1;
    uint _1768 = uint(int(uint(_1766) >> uint(2)));
    int _1770 = _1766 & 3;
    float _1772 = (*spvDescriptorSet0.vp_c15)._m0[int(_1768)][_1770];
    float _1774 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1748);
    float _1776 = _1754;
    if (_1589)
    {
        float _1778 = _1543 * _1746;
        _1603 = _1778;
    }
    float _1780 = _1603;
    float _1782 = 0.0;
    if (_1589)
    {
        float _1784 = _1754 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1782 = _1784;
    }
    float _1786 = _1782;
    if (!_1589)
    {
        _1776 = _1545;
    }
    float _1788 = _1776;
    float _1790 = _1788;
    if (_1589)
    {
        float _1792 = _1545 * _1746;
        _1790 = _1792;
    }
    float _1794 = _1790;
    float _1796 = _1774 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (_1589)
    {
        float _1798 = fma(_1625, _1689, _1786);
        _1635 = _1798;
    }
    float _1800 = _1635;
    int _1802 = _1677 + 104;
    uint _1804 = uint(int(uint(_1802) >> uint(2)));
    uint _1806 = uint(int(uint(int(_1804)) >> uint(2)));
    int _1808 = int(_1804) & 3;
    float _1810 = (*spvDescriptorSet0.vp_c15)._m0[int(_1806)][_1808];
    int _1812 = int(_1804) + 1;
    uint _1814 = uint(int(uint(_1812) >> uint(2)));
    int _1816 = _1812 & 3;
    float _1818 = (*spvDescriptorSet0.vp_c15)._m0[int(_1814)][_1816];
    if (_1589)
    {
        float _1820 = _1780 * _1780;
        _1605 = _1820;
    }
    float _1822 = _1605;
    float _1824 = _1822;
    if (!_1589)
    {
        _1750 = _1553;
    }
    float _1826 = _1750;
    float _1828 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1830 = _1796 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1832 = _1826;
    int _1834 = as_type<int>(_1828);
    if (_1589)
    {
        float _1836 = _1794 * _1794;
        _1832 = _1836;
    }
    float _1838 = _1832;
    float _1840 = fma(_1800, _1800, _1822);
    float _1842 = 0.0;
    if (!_1712)
    {
        float _1844 = floor(_1555);
        _1842 = _1844;
    }
    float _1846 = _1842;
    int _1848 = _1677 + 80;
    uint _1850 = uint(int(uint(_1848) >> uint(2)));
    uint _1852 = uint(int(uint(int(_1850)) >> uint(2)));
    int _1854 = int(_1850) & 3;
    float _1856 = (*spvDescriptorSet0.vp_c15)._m0[int(_1852)][_1854];
    int _1858 = int(_1850) + 1;
    uint _1860 = uint(int(uint(_1858) >> uint(2)));
    int _1862 = _1858 & 3;
    float _1864 = (*spvDescriptorSet0.vp_c15)._m0[int(_1860)][_1862];
    float _1866 = -_1830;
    float _1868 = fma(_1866, _1828, 1.0);
    float _1870 = _1840 + _1838;
    if (!_1712)
    {
        int _1872 = _1619 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1874 = _1872 + _1587;
        _1834 = _1874;
    }
    int _1876 = _1834;
    float _1878 = -_1740;
    float _1880 = _1714 + _1878;
    float _1882 = log2(_1868);
    int _1884 = _1677 + 56;
    uint _1886 = uint(int(uint(_1884) >> uint(2)));
    uint _1888 = uint(int(uint(int(_1886)) >> uint(2)));
    int _1890 = int(_1886) & 3;
    float _1892 = (*spvDescriptorSet0.vp_c15)._m0[int(_1888)][_1890];
    int _1894 = int(_1886) + 1;
    uint _1896 = uint(int(uint(_1894) >> uint(2)));
    int _1898 = _1894 & 3;
    float _1900 = (*spvDescriptorSet0.vp_c15)._m0[int(_1896)][_1898];
    float _1902 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1904 = fma(_1611, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1902);
    float _1906 = precise::clamp(_1904, 0.0, 1.0);
    float _1908 = -_1906;
    float _1910 = _1908 + 1.0;
    if (!_1712)
    {
        float _1912 = -_1846;
        float _1914 = _1555 + _1912;
        _1824 = _1914;
    }
    float _1916 = _1824;
    int _1918 = _1677 + 88;
    uint _1920 = uint(int(uint(_1918) >> uint(2)));
    uint _1922 = uint(int(uint(int(_1920)) >> uint(2)));
    int _1924 = int(_1920) & 3;
    float _1926 = (*spvDescriptorSet0.vp_c15)._m0[int(_1922)][_1924];
    int _1928 = int(_1920) + 1;
    uint _1930 = uint(int(uint(_1928) >> uint(2)));
    int _1932 = _1928 & 3;
    float _1934 = (*spvDescriptorSet0.vp_c15)._m0[int(_1930)][_1932];
    float _1936 = _1517 * _1708;
    if (!_1712)
    {
        int _1938 = _1876 << 2;
        _1607 = _1938;
    }
    int _1940 = _1607;
    float _1942 = fma(_943, _1700, _1936);
    int _1944 = _1940;
    if (!_1712)
    {
        int _1946 = 12 & _1940;
        _1944 = _1946;
    }
    int _1948 = _1944;
    float _1950 = _1882 * 0.693147182464599609375;
    int _1952 = _1677 + 72;
    uint _1954 = uint(int(uint(_1952) >> uint(2)));
    uint _1956 = uint(int(uint(int(_1954)) >> uint(2)));
    int _1958 = int(_1954) & 3;
    float _1960 = (*spvDescriptorSet0.vp_c15)._m0[int(_1956)][_1958];
    int _1962 = int(_1954) + 1;
    uint _1964 = uint(int(uint(_1962) >> uint(2)));
    int _1966 = _1962 & 3;
    float _1968 = (*spvDescriptorSet0.vp_c15)._m0[int(_1964)][_1966];
    float _1970 = _1517 * _1736;
    float2 _5835 = float2(_1565, _1880);
    float _1972 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5835, float2(0.0), isnan(_5835)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5835, float2(0.0), isnan(_5835)), level(0.0)).x;
    float _1974 = _1950 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1976 = fma(_943, _1728, _1970);
    float _1978 = _1517 * _1772;
    float _1980 = rsqrt(_1870);
    float _1982 = fma(_943, _1764, _1978);
    float _1984 = fma(_945, _1810, _1942);
    float _1986 = _1984 + _1818;
    float _1988 = _1517 * _1864;
    int _1990 = as_type<int>(_1864);
    int _1992 = as_type<int>(_1856);
    if (!_1712)
    {
        uint _1994 = uint(int(uint(_1876) >> uint(2)));
        _1990 = int(_1994);
    }
    int _1996 = _1990;
    float _1998 = 1.0 / _1986;
    float _2000 = _1980 * _1780;
    float _2002 = fma(_943, _1856, _1988);
    float _2004 = _1980 * _1800;
    if (!_1712)
    {
        int _2006 = _1996 << 4;
        int _2008 = _2006 + _1948;
        _1992 = _2008;
    }
    int _2010 = _1992;
    float _2012 = _2000 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2014 = fma(_945, _1892, _1976);
    float _2016 = _1980 * _1794;
    float _2018 = abs(_1910);
    float _2020 = log2(_2018);
    float _2022 = -_2012;
    float _2024 = fma(_2004, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2022);
    float _2026 = _1469 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2028 = _1970;
    if (!_1712)
    {
        int _2030 = _2010 + 400;
        uint _2032 = uint(int(uint(_2030) >> uint(2)));
        uint _2034 = uint(int(uint(int(_2032)) >> uint(2)));
        int _2036 = int(_2032) & 3;
        float _2038 = (*spvDescriptorSet0.vp_c15)._m0[int(_2034)][_2036];
        _2028 = _2038;
    }
    float _2040 = _2028;
    float _2042 = -_2016;
    float _2044 = fma(_2042, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2024);
    float _2046 = fma(_945, _1926, _2002);
    float _2048 = _2014 + _1900;
    float _2050 = _1469 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2052 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2026);
    float _2054 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2050);
    float _2056 = _2048 * _1998;
    float _2058 = fma(_945, _1960, _1982);
    float _2060 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2052);
    float _2062 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2054);
    float _2064 = _2020 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2066 = _2058 + _1968;
    float _2068 = _1469 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _2070 = _2056 >= 0.0;
    float _2072 = _2060 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2074 = _2066 * _1998;
    float _2076 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2068);
    bool _2078 = _2056 <= 1.0;
    bool _2080 = _2078 && _2070;
    float _2082 = exp2(_2064);
    float _2084 = _2072 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2086 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2076);
    bool _2088 = _2074 >= 0.0;
    bool _2090 = _2088 && _2080;
    float _2092 = fma(_2044, -0.5, 0.5);
    float _2094 = fma(_2044, 0.5, 0.5);
    float _2096 = _2086 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _2098 = _2074 <= 1.0;
    bool _2100 = _2098 && _2090;
    float _2102 = _2062 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2104 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2084);
    float _2106 = sqrt(_2092);
    float _2108 = _2046 + _1934;
    float _2110 = _2004 + 1.0;
    float _2112 = fma(_2094, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2114 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2104);
    float _2116 = _2072 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2118 = -_2004;
    float _2120 = fma(_2082, _2110, _2118);
    float _2122 = fma(_2094, _2112, -0.212114393711090087890625);
    float _2124 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2114);
    float _2126 = _2072 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2128 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2116);
    float _2130 = fma(_2094, _2122, 1.570728778839111328125);
    float _2132 = 1.0 / _2124;
    float _2134 = _2094;
    float _2136 = _2124;
    if (_2100)
    {
        float _2138 = float(_1673);
        _2134 = _2138;
    }
    float _2140 = _2134;
    float _2142 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2126);
    float _2144 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2128);
    float _2146 = _2106 * 0.636619746685028076171875;
    float _2148 = _2108 * _1998;
    float _2150 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2142);
    float _2152 = _2140;
    float _2154 = _2150;
    if (_2100)
    {
        float _2156 = rint(_2140);
        float _2158 = precise::max(_2156, 0.0);
        uint _2160 = uint(_2158);
        uint _2162 = clamp(_2160, 0u, 65535u);
        _2152 = as_type<float>(_2162);
    }
    float _2164 = _2152;
    float _2166 = -_2130;
    float _2168 = fma(_2146, _2166, 1.0);
    float _2170 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2144);
    float _2172 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2150);
    float _2174 = _2066;
    float _2176 = _2170;
    float _2178 = _2172;
    if (!_1712)
    {
        float _2180 = floor(_1549);
        _2174 = _2180;
    }
    float _2182 = _2174;
    float _2184 = _2170 * _2132;
    float _2186 = _2172 * _2132;
    float _2188 = fma(_2120, 0.5, 0.5);
    float _2190 = fma(_2184, 0.5, 0.5);
    float _2192 = fma(_2186, -0.5, 0.5);
    float _2194 = _2074;
    if (_2100)
    {
        float3 _6216 = float3(_2056, _2074, float(as_type<int>(_2164)));
        float3 _6220 = select(_6216, float3(0.0), isnan(_6216));
        float _2196 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6220.xy, uint(rint(_6220.z)), _2148, level(0.0));
        _2194 = _2196;
    }
    float _2198 = _2194;
    float _2200 = _2004;
    if (!_1712)
    {
        float _2202 = rint(_2040);
        float _2204 = precise::max(_2202, 0.0);
        uint _2206 = uint(_2204);
        uint _2208 = clamp(_2206, 0u, 65535u);
        _2200 = as_type<float>(_2208);
    }
    float _2210 = _2200;
    if (!_1712)
    {
        float _2212 = -_2182;
        float _2214 = _1549 + _2212;
        _2154 = _2214;
    }
    float _2216 = _2154;
    float3 _6257 = float3(_2190, _2192, _1974);
    float _2218 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6257, float3(0.0), isnan(_6257)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6257, float3(0.0), isnan(_6257)), level(0.0)).x;
    float3 _6266 = float3(_2190, _2192, _1974);
    float4 _2221 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6266, float3(0.0), isnan(_6266)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6266, float3(0.0), isnan(_6266)), level(0.0)).xyzw;
    float _2223 = _2221.x;
    float _2225 = _2221.y;
    float _2227 = _2221.z;
    float _2229 = _2221.w;
    float2 _6282 = float2(_2168, _2188);
    float3 _2233 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6282, float2(0.0), isnan(_6282)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6282, float2(0.0), isnan(_6282)), level(0.0)).xyz;
    float _2235 = _2233.x;
    float _2237 = _2233.y;
    float _2239 = _2233.z;
    float _2241 = _1916;
    if (!_1712)
    {
        float3 _6303 = float3(_2216, _1916, float(as_type<int>(_2210)));
        float3 _6305 = select(_6303, float3(0.0), isnan(_6303));
        float _2243 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6305.xy, uint(rint(_6305.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6305.xy, uint(rint(_6305.z)), level(0.0)).x;
        _2241 = _2243;
    }
    float _2245 = _2241;
    float _2247 = abs(_1571);
    float _2249 = log2(_2247);
    float _2251 = _2072 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2253 = _2020 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2255 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2251);
    float _2257 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2255);
    float _2259 = _2124 * 0.5;
    float _2261 = exp2(_2253);
    bool _2263 = _1571 <= 8000.0;
    bool _2265 = isnan(_1571);
    bool _2267 = _2263 || _2265;
    bool _2269 = isnan(8000.0);
    bool _2271 = _2267 || _2269;
    float _2273 = float(_2271);
    float _2275 = _2249 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2277 = exp2(_2275);
    float _2279 = fma(_2172, -0.5, _2259);
    float _2281 = fma(_2277, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2283 = precise::clamp(_2281, 0.0, 1.0);
    float _2285 = fma(_2283, -2.0, 3.0);
    float _2287 = _2283 * _2283;
    float _2289 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2257);
    float _2291 = _2287 * _2285;
    float _2293 = _2289 + _2124;
    float _2295 = _2170 + _2124;
    float _2297 = -_2291;
    float _2299 = _2297 + 1.0;
    float _2301 = _2293 * 0.5;
    float _2303 = _2295 * 0.5;
    out.gl_Position.x = _2170;
    out.gl_Position.y = _2172;
    out.gl_Position.z = _2289;
    out.gl_Position.w = _2124;
    float _2305 = fma(_2299, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2291);
    out.m_84.x = _2303;
    out.m_84.y = _2279;
    out.m_84.z = _2301;
    out.m_84.w = _2124;
    float _2307 = _2273 * _2305;
    float _2309 = -_2261;
    float _2311 = _2309 + 1.0;
    float _2313 = _2307 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2315 = _2307;
    float _2317 = _2289;
    float _2319 = _2303;
    if (!_2100)
    {
        _2315 = 1.0;
    }
    float _2321 = _2315;
    float _2323 = _2311 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2325 = _2321;
    if (_1712)
    {
        _2176 = 1.0;
    }
    float _2327 = _2176;
    float _2329 = -_1972;
    float _2331 = _2329 + 1.0;
    float _2333 = _2331 * _2313;
    float _2335 = precise::clamp(_2333, 0.0, 1.0);
    float _2337 = _2327;
    if (_2100)
    {
        bool _2339 = _2198 >= _2148;
        bool _2341 = isnan(_2198);
        bool _2343 = _2339 || _2341;
        bool _2345 = isnan(_2148);
        bool _2347 = _2343 || _2345;
        float _2349 = float(_2347);
        _2325 = _2349;
    }
    float _2351 = _2325;
    if (!_1712)
    {
        int _2353 = _1876 << 4;
        int _2355 = _2353 + 2048;
        uint _2357 = uint(int(uint(_2355) >> uint(2)));
        uint _2359 = uint(int(uint(int(_2357)) >> uint(2)));
        int _2361 = int(_2357) & 3;
        float _2363 = (*spvDescriptorSet0.vp_c15)._m0[int(_2359)][_2361];
        int _2365 = int(_2357) + 1;
        uint _2367 = uint(int(uint(_2365) >> uint(2)));
        int _2369 = _2365 & 3;
        float _2371 = (*spvDescriptorSet0.vp_c15)._m0[int(_2367)][_2369];
        int _2373 = _2355 + 8;
        uint _2375 = uint(int(uint(_2373) >> uint(2)));
        uint _2377 = uint(int(uint(int(_2375)) >> uint(2)));
        int _2379 = int(_2375) & 3;
        float _2381 = (*spvDescriptorSet0.vp_c15)._m0[int(_2377)][_2379];
        int _2383 = int(_2375) + 1;
        uint _2385 = uint(int(uint(_2383) >> uint(2)));
        int _2387 = _2383 & 3;
        float _2389 = (*spvDescriptorSet0.vp_c15)._m0[int(_2385)][_2387];
        float _2391 = _1517 * _2371;
        float _2393 = fma(_943, _2363, _2391);
        float _2395 = fma(_945, _2381, _2393);
        float _2397 = _2395 + _2389;
        float _2399 = precise::clamp(_2397, 0.0, 1.0);
        float _2401 = -_2399;
        float _2403 = _2401 + _2245;
        float _2405 = fma(_2403, 500.0, 1.5);
        float _2407 = exp2(_2405);
        float _2409 = 0.0 + _2407;
        float _2411 = precise::clamp(_2409, 0.0, 1.0);
        _2337 = _2411;
        _2136 = _2389;
        _2178 = 500.0;
        _2317 = _2381;
    }
    float _2413 = _2337;
    float _2415 = _2136;
    float _2417 = _2178;
    float _2419 = _2317;
    float _2421 = _2323 * _2218;
    float _2423 = _2351 * _2413;
    float _2425 = -_2335;
    float _2427 = fma(_2425, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2429 = -_2323;
    float _2431 = _2429 + 1.0;
    float _2433 = _2229 * _2421;
    float _2435 = _2239 * _2421;
    float _2437 = -_2423;
    float _2439 = fma(_2437, _2427, 1.0);
    float _2441 = precise::clamp(_2439, 0.0, 1.0);
    bool _2443 = _1611 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2445 = isnan(_1611);
    bool _2447 = _2443 || _2445;
    bool _2449 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2451 = _2447 || _2449;
    float _2453 = fma(_2235, _2433, _2223);
    float _2455 = fma(_2237, _2433, _2225);
    float _2457 = _2441 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2459 = _2229 * _2431;
    float _2461 = fma(_2229, _2435, _2227);
    out.m_86.x = _2457;
    out.m_88.x = _2453;
    out.m_88.y = _2455;
    out.m_88.z = _2461;
    out.m_88.w = _2459;
    float _2463 = _2415;
    float _2465 = _2419;
    float _2467 = _2417;
    float _2469 = _2423;
    float _2471 = _2441;
    if (!_2451)
    {
        _2319 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2473 = _2319;
    float _2475 = _2473;
    float _2477 = _2473;
    if (!_2451)
    {
        _2463 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2479 = _2463;
    float _2481 = _2479;
    float _2483 = _2479;
    if (!_2451)
    {
        _2465 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2485 = _2465;
    float _2487 = _2485;
    float _2489 = _2485;
    if (!_2451)
    {
        _2467 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2491 = _2467;
    float _2493 = _2491;
    float _2495 = _2491;
    if (!_2451)
    {
        _2469 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2497 = _2469;
    float _2499 = _2497;
    float _2501 = _2497;
    if (!_2451)
    {
        _2471 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2503 = _2471;
    bool _2505 = !_2451;
    float _2507 = _2503;
    float _2509 = _2503;
    if (!_2505)
    {
        bool _2511 = _1611 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2513 = isnan(_1611);
        bool _2515 = _2511 || _2513;
        bool _2517 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2519 = _2515 || _2517;
        if (!_2519)
        {
            float _2521 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2523 = _1611 + _2521;
            float _2525 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2527 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2525;
            float _2529 = 1.0 / _2527;
            float _2531 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2533 = _2531 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2535 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2537 = _2535 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2539 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2541 = _2539 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2543 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2545 = _2543 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2547 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2549 = _2547 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2551 = _2523 * _2529;
            float _2553 = precise::clamp(_2551, 0.0, 1.0);
            float _2555 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2557 = _2555 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2559 = fma(_2553, _2533, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2561 = fma(_2553, _2557, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2563 = fma(_2553, _2537, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2565 = fma(_2553, _2541, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2567 = fma(_2553, _2545, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2569 = fma(_2553, _2549, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2483 = _2561;
            _2501 = _2567;
            _2477 = _2559;
            _2495 = _2565;
            _2489 = _2563;
            _2509 = _2569;
            _2571 = true;
        }
        else
        {
            bool _2573 = _1611 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2575 = isnan(_1611);
            bool _2577 = _2573 || _2575;
            bool _2579 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2581 = _2577 || _2579;
            if (!_2581)
            {
                _2475 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2583 = _2475;
            _2477 = _2583;
            if (!_2581)
            {
                _2481 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2585 = _2481;
            _2483 = _2585;
            if (!_2581)
            {
                _2487 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2587 = _2487;
            _2489 = _2587;
            if (!_2581)
            {
                _2493 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2589 = _2493;
            _2495 = _2589;
            if (!_2581)
            {
                _2499 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2591 = _2499;
            _2501 = _2591;
            if (!_2581)
            {
                _2507 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2593 = _2507;
            bool _2595 = !_2581;
            _2509 = _2593;
            if (!_2595)
            {
                bool _2597 = _1611 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2599 = isnan(_1611);
                bool _2601 = _2597 || _2599;
                bool _2603 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2605 = _2601 || _2603;
                if (!_2605)
                {
                    float _2607 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2609 = _1611 + _2607;
                    float _2611 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2613 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2611;
                    float _2615 = 1.0 / _2613;
                    float _2617 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2619 = _2617 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2621 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2623 = _2621 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2625 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2627 = _2625 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2629 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2631 = _2629 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2633 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2635 = _2633 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2637 = _2609 * _2615;
                    float _2639 = precise::clamp(_2637, 0.0, 1.0);
                    float _2641 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2643 = _2641 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2645 = fma(_2639, _2619, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2647 = fma(_2639, _2643, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2649 = fma(_2639, _2623, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2651 = fma(_2639, _2627, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2653 = fma(_2639, _2631, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2655 = fma(_2639, _2635, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2483 = _2647;
                    _2501 = _2653;
                    _2477 = _2645;
                    _2495 = _2651;
                    _2489 = _2649;
                    _2509 = _2655;
                    _2571 = true;
                }
                else
                {
                    _2483 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2501 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2477 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2495 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2489 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2509 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2571 = false;
    float _2657 = _2483;
    float _2659 = _2501;
    float _2661 = _2477;
    float _2663 = _2495;
    float _2665 = _2489;
    float _2667 = _2509;
    float _2669 = fma(_1373, -0.5, 0.5);
    float _2671 = precise::clamp(_2669, 0.0, 1.0);
    float _2673 = -_2657;
    float _2675 = _2673 + _2659;
    float _2677 = -_2661;
    float _2679 = _2677 + _2663;
    float _2681 = -_2665;
    float _2683 = _2681 + _2667;
    bool _2685 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2687 = fma(_2671, _2675, _2657);
    float _2689 = fma(_2671, _2679, _2661);
    float _2691 = fma(_2671, _2683, _2665);
    float _2693 = _2687 * 0.586610972881317138671875;
    out.m_90.x = 0.0;
    float _2695 = fma(_2689, 0.298911988735198974609375, _2693);
    float _2697 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2699 = fma(_2691, 0.114477999508380889892578125, _2695);
    out.m_61.x = _2697;
    float _2701 = -_2699;
    float _2703 = _2689 + _2701;
    float _2705 = -_2699;
    float _2707 = _2687 + _2705;
    float _2709 = -_2699;
    float _2711 = _2691 + _2709;
    float _2713 = fma(_2703, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2699);
    float _2715 = fma(_2707, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2699);
    float _2717 = fma(_2711, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2699);
    out.m_92.x = _2713;
    out.m_92.y = _2715;
    out.m_92.z = _2717;
    if (!_2685)
    {
        return out;
    }
    float _2719 = -_1469;
    float _2721 = _2719 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2723 = -_1471;
    float _2725 = _2723 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2727 = -_1473;
    float _2729 = _2727 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2731 = _2721 * _2721;
    float _2733 = fma(_2725, _2725, _2731);
    float _2735 = fma(_2729, _2729, _2733);
    float _2737 = sqrt(_2735);
    float _2739 = rsqrt(_2735);
    float _2741 = -_2737;
    float _2743 = _2741 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2745 = _2743 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2747 = precise::clamp(_2745, 0.0, 1.0);
    float _2749 = _2725 * _2739;
    float _2751 = _2721 * _2739;
    float _2753 = abs(_2747);
    float _2755 = log2(_2753);
    float _2757 = _2729 * _2739;
    float _2759 = _2749 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2761 = _1373 * _2751;
    float _2763 = -_2751;
    float _2765 = -_2759;
    float _2767 = fma(_2763, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2765);
    float _2769 = fma(_1363, _2749, _2761);
    float _2771 = -_2757;
    float _2773 = fma(_2771, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2767);
    float _2775 = fma(_1375, _2757, _2769);
    float _2777 = precise::clamp(_2775, 0.0, 1.0);
    float _2779 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2781 = _2773 + _2779;
    float _2783 = _2755 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2785 = _2781 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2787 = precise::clamp(_2785, 0.0, 1.0);
    float _2789 = exp2(_2783);
    float _2791 = _2789 * _2787;
    float _2793 = _2777 * _2791;
    float _2795 = _2793 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2797 = _2793 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2799 = _2793 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _2795;
    out.m_90.y = _2797;
    out.m_90.z = _2799;
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
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2571 = false;
    bool _1423 = false;
    bool _497 = false;
    bool _309 = false;
    bool _207 = false;
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
        float _2855 = as_type<float>(_127);
        out.gl_Position.z = _2855;
    }
    if (!_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2925 = as_type<float>(_165);
        out.gl_Position.z = _2925;
    }
    if (_155)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _189 = in.m_68.x;
        float _191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _193 = _189 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _195 = fma(_193, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
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
        float _213 = _143 * _211;
        _205 = _213;
    }
    _207 = false;
    float _215 = _205;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _219 = _215 + _217;
    bool _221 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _223 = isnan(_215);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _233;
    float _237 = -_231;
    float _239 = _237 + 1.0;
    bool _241 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _243 = isnan(_215);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _253;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _259 = 1.0 / _235;
    float _261 = _251 * _239;
    float _263 = -_251;
    float _265 = _263 + 1.0;
    float _267 = _219 * _259;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _269;
    float _273 = fma(_255, _267, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _275 = fma(_271, _267, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _277 = _273 * _261;
    float _279 = _275 * _261;
    float _281 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[143].x, _277);
    float _283 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[143].y, _279);
    float _285 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[144].x, _281);
    float _287 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[144].y, _283);
    bool _289 = !_257;
    float _307;
    if (!_289)
    {
        float _291 = in.m_68.x;
        float _293 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _295 = _291 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[11].y, _143);
        float _299 = _297 * _293;
        float _301 = floor(_299);
        float _303 = -_301;
        float _305 = _299 + _303;
        _307 = _305;
        _309 = true;
    }
    else
    {
        float _311 = float(_111);
        float _313 = 1.0 / _311;
        float _315 = _143 * _313;
        _307 = _315;
    }
    _309 = false;
    float _317 = _307;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _325 = _323 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _327 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _329 = isnan(_317);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = 1.0 / _321;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _343 = _341 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _345 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _347 = isnan(_317);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _353 = _349 || _351;
    float _355 = float(_353);
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _357;
    float _361 = -_337;
    float _363 = _361 + 1.0;
    bool _365 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _367 = isnan(_317);
    bool _369 = _365 || _367;
    bool _371 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _373 = _369 || _371;
    float _375 = float(_373);
    bool _377 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _379 = 1.0 / _325;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _385 = _355 * _363;
    float _387 = -_355;
    float _389 = _387 + 1.0;
    float _391 = _375 * _389;
    float _393 = 1.0 / _343;
    float _395 = _359 * _339;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _399 = _317 + _397;
    float _401 = -_375;
    float _403 = _401 + 1.0;
    float _405 = fma(_395, _399, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _409 = _317 + _407;
    float _411 = _383 * _379;
    bool _413 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _415 = isnan(_317);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _425;
    float _429 = _405 * _391;
    float _431 = fma(_411, _409, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _435 = _317 + _433;
    float _437 = -_423;
    float _439 = _437 + 1.0;
    float _441 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[115].x, _429);
    float _443 = _427 * _393;
    float _445 = _337 * _439;
    float _447 = fma(_431, _385, _441);
    float _449 = fma(_443, _435, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _451 = fma(_449, _445, _447);
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _457 = fma(_423, (*spvDescriptorSet0.vp_c9)._m0[118].x, _451);
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _461 = _453 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _463 = _455 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _465 = _457 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _467 = _459 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _469 = in.m_70.x;
    float _471 = in.m_70.y;
    out.m_72.x = _461;
    out.m_72.y = _463;
    out.m_72.z = _467;
    out.m_72.w = _465;
    float _473 = _287 * _471;
    float _475 = _285 * _469;
    bool _477 = !_377;
    float _495;
    if (!_477)
    {
        float _479 = in.m_68.x;
        float _481 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _483 = _479 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _485 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[11].w, _143);
        float _487 = _485 * _481;
        float _489 = floor(_487);
        float _491 = -_489;
        float _493 = _487 + _491;
        _495 = _493;
        _497 = true;
    }
    else
    {
        float _499 = float(_111);
        float _501 = 1.0 / _499;
        float _503 = _143 * _501;
        _495 = _503;
    }
    _497 = false;
    float _505 = _495;
    float _507 = in.m_68.z;
    float _509 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _511 = log2(_509);
    float _513 = _473 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _515 = in.m_68.x;
    float _517 = _475 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _519 = in.m_68.y;
    float _521 = _507 * 2.0;
    float _523 = _515 * 2.0;
    float _525 = floor(_521);
    float _527 = _519 * 2.0;
    float _529 = floor(_523);
    float _531 = floor(_527);
    bool _533 = _525 >= 0.0;
    bool _535 = isnan(_525);
    bool _537 = _533 || _535;
    bool _539 = isnan(0.0);
    bool _541 = _537 || _539;
    bool _543 = _525 > 0.0;
    float _545 = _515 + _519;
    bool _547 = _529 >= 0.0;
    bool _549 = isnan(_529);
    bool _551 = _547 || _549;
    bool _553 = isnan(0.0);
    bool _555 = _551 || _553;
    float _557 = _545 + (-1.0);
    bool _559 = _529 > 0.0;
    float _561 = _507 + _519;
    int _563 = _555 ? 0 : 1;
    float _565 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _567 = _561 + (-1.0);
    bool _569 = _531 > 0.0;
    bool _571 = _531 >= 0.0;
    bool _573 = isnan(_531);
    bool _575 = _571 || _573;
    bool _577 = isnan(0.0);
    bool _579 = _575 || _577;
    float _581 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _583 = _541 ? 0 : 1;
    int _585 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _587 = _585 != 0;
    int _589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _591 = _589 != 0;
    int _593 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _595 = _593 != 0;
    float _597 = _511 * _143;
    int _599 = _579 ? 0 : 1;
    int _601 = ~_583;
    int _603 = _601 + 1;
    int _605 = _603 + 1;
    float _607 = exp2(_597);
    int _609 = ~_599;
    int _611 = _609 + 1;
    int _613 = _611 + 1;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _617 = 1.0 + _615;
    int _619 = _605;
    int _621 = _613;
    bool _623 = _591;
    if (!_543)
    {
        int _625 = ~_583;
        int _627 = _625 + 1;
        _619 = _627;
    }
    int _629 = _619;
    if (!_569)
    {
        int _631 = ~_599;
        int _633 = _631 + 1;
        _621 = _633;
    }
    int _635 = _621;
    int _637 = ~_563;
    int _639 = _637 + 1;
    int _641 = _639 + 1;
    float _643 = in.m_74.x;
    float _645 = in.m_74.y;
    float _647 = in.m_74.z;
    int _649 = _641;
    if (!_559)
    {
        int _651 = ~_563;
        int _653 = _651 + 1;
        _649 = _653;
    }
    int _655 = _649;
    float _657 = 1.0 / _617;
    bool _659 = !_587;
    int _661 = _659 ? 0 : 1;
    bool _663 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _665 = isnan(1.0);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _671 = _667 || _669;
    float _673 = -_607;
    float _675 = _673 + 1.0;
    int _677 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2048;
    bool _679 = _677 != 0;
    int _681 = abs(_661);
    bool _683 = !_591;
    int _685 = _683 ? 0 : 1;
    bool _687 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _689 = isnan(0.0);
    bool _691 = _687 || _689;
    bool _693 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _695 = _691 || _693;
    bool _697 = !_595;
    int _699 = _697 ? 0 : 1;
    float _701 = float(_681);
    float _703 = float(_629);
    int _705 = abs(_685);
    int _707 = abs(_699);
    float _709 = _701 * _703;
    float _711 = _695 ? _675 : 0.0;
    float _713 = float(_705);
    float _715 = _709 * (-2.0);
    float _717 = float(_655);
    float _719 = _711;
    if (_671)
    {
        float _721 = _711 * _657;
        _145 = _721;
    }
    float _723 = _145;
    float _725 = float(_707);
    if (_679)
    {
        float _727 = _519 * 3.1415927410125732421875;
        _719 = _727;
    }
    float _729 = _719;
    float _731 = float(_635);
    float _733 = _713 * _717;
    float _735 = _515 + (-0.5);
    float _737 = _729;
    if (_679)
    {
        float _739 = _729 * 0.15915493667125701904296875;
        _737 = _739;
    }
    float _741 = _737;
    float _743 = _725 * _731;
    float _745 = fma(_715, _643, _643);
    float _747 = _733 * (-2.0);
    float _749 = fma(_565, _715, _565);
    float _751 = _741;
    if (_679)
    {
        float _753 = _741 * 6.283185482025146484375;
        float _755 = sin(_753);
        _751 = _755;
    }
    float _757 = _751;
    float _759 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[196].x, _745);
    float _761 = fma(_747, _645, _645);
    float _763 = _515 + _507;
    float _765 = fma(_581, _747, _581);
    float _767 = fma(_749, _723, _759);
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _771 = _769 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _773 = _763 + (-1.0);
    float _775 = _743 * (-2.0);
    float _777 = _767 * 0.15915493667125701904296875;
    float _779 = in.m_68.w;
    float _781 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _783 = 1.0 / _771;
    float _785 = fma(_775, _647, _647);
    bool _787 = _519 > 0.5;
    float _789 = _519 + (-0.5);
    if (_679)
    {
        bool _791 = _757 > 0.5;
        _623 = _791;
    }
    bool _793 = _623;
    float _795 = _507 + (-0.5);
    float _797 = fma(_781, _775, _781);
    float _799 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[196].y, _761);
    int _801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1024;
    bool _803 = _801 != 0;
    float _805 = in.m_58.x;
    float _807 = in.m_58.y;
    float _809 = in.m_58.z;
    float _811 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[196].z, _785);
    float _813 = fma(_765, _723, _799);
    float _815 = _799;
    if (!_679)
    {
        _815 = _185;
    }
    float _817 = _815;
    float _819 = _777 * 6.283185482025146484375;
    float _821 = sin(_819);
    float _823 = fma(_797, _723, _811);
    float _825 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _827 = _817;
    if (_679)
    {
        float _829 = -_185;
        float _831 = _793 ? _829 : _185;
        _827 = _831;
    }
    float _833 = _827;
    float _835 = _813 * 0.15915493667125701904296875;
    int _837 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _839 = _837 != 0;
    float _841 = _513 * _825;
    int _843 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _845 = _843 != 0;
    float _847 = _777 * 6.283185482025146484375;
    float _849 = cos(_847);
    int _851 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _853 = _851 != 0;
    float _855 = _823 * 0.15915493667125701904296875;
    int _857 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _859 = _857 != 0;
    float _861 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _863 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _865 = _507 > 0.5;
    float _867 = _835 * 6.283185482025146484375;
    float _869 = sin(_867);
    float _871 = -_185;
    int _873 = _787 ? as_type<int>(_871) : as_type<int>(_185);
    bool _875 = _779 > 0.5;
    float _877 = _517 * _861;
    float _879 = _807 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _881 = _807 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _883 = _807 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _885 = _835 * 6.283185482025146484375;
    float _887 = cos(_885);
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _891 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _889;
    float _893 = fma(_805, (*spvDescriptorSet0.vp_c10)._m0[5].x, _881);
    float _895 = fma(_805, (*spvDescriptorSet0.vp_c10)._m0[4].x, _879);
    float _897 = -_185;
    int _899 = _875 ? as_type<int>(_897) : as_type<int>(_185);
    float _901 = _891 * _783;
    float _903 = fma(_809, (*spvDescriptorSet0.vp_c10)._m0[5].z, _893);
    float _905 = _855 * 6.283185482025146484375;
    float _907 = sin(_905);
    float _909 = fma(_805, (*spvDescriptorSet0.vp_c10)._m0[6].x, _883);
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _913 = _505 + _911;
    float _915 = fma(_809, (*spvDescriptorSet0.vp_c10)._m0[4].z, _895);
    float _917 = _849 * _869;
    float _919 = fma(_809, (*spvDescriptorSet0.vp_c10)._m0[6].z, _909);
    float _921 = fma(_901, _913, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _923 = _821 * _869;
    float _925 = _855 * 6.283185482025146484375;
    float _927 = cos(_925);
    float _929 = _849 * _887;
    float _931 = _821 * _887;
    float _933 = _909;
    float _935 = _869;
    bool _937 = _875;
    if (_803)
    {
        float _939 = _515 * 3.1415927410125732421875;
        _933 = _939;
    }
    float _941 = _933;
    float _943 = _915 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _945 = _919 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _947 = _903 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _949 = -_841;
    float _951 = _907 * _949;
    float _953 = fma(_907, _929, _923);
    float _955 = fma(_907, _923, _929);
    bool _957 = !_845;
    float _959 = _957 ? _185 : as_type<float>(_873);
    float _961 = -_931;
    float _963 = fma(_907, _917, _961);
    bool _965 = _515 > 0.5;
    float _967 = -_917;
    float _969 = fma(_907, _931, _967);
    bool _971 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _973 = isnan(_505);
    bool _975 = _971 || _973;
    bool _977 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _979 = _975 || _977;
    float _981 = float(_979);
    float _983 = _849 * _927;
    float _985 = _821 * _927;
    float _987 = _887 * _927;
    float _989 = _869 * _927;
    bool _991 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _993 = isnan(_505);
    bool _995 = _991 || _993;
    bool _997 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _999 = _995 || _997;
    float _1001 = float(_999);
    float _1003 = _983 * _841;
    float _1005 = _963;
    float _1007 = _969;
    if (_803)
    {
        float _1009 = _941 * 0.15915493667125701904296875;
        _935 = _1009;
    }
    float _1011 = _935;
    float _1013 = _985 * _841;
    float _1015 = fma(_987, _877, _951);
    float _1017 = -_1001;
    float _1019 = _1017 + 1.0;
    float _1021 = fma(_953, _877, _1003);
    float _1023 = fma(_969, _877, _1013);
    float _1025 = _1011;
    if (_803)
    {
        float _1027 = _1011 * 6.283185482025146484375;
        float _1029 = sin(_1027);
        _1025 = _1029;
    }
    float _1031 = _1025;
    float _1033 = _981 * _1019;
    float _1035 = fma(_963, _863, _1021);
    float _1037 = fma(_989, _863, _1015);
    float _1039 = fma(_955, _863, _1023);
    float _1041 = _921 * _1033;
    float _1043 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1045 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1047 = -_981;
    float _1049 = _1047 + 1.0;
    float _1051 = _983 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1053 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1043);
    float _1055 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1045);
    float _1057 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1041);
    float _1059 = _983 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1061 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1053);
    float _1063 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1055);
    if (_803)
    {
        bool _1065 = _1031 > 0.5;
        _937 = _1065;
    }
    bool _1067 = _937;
    float _1069 = fma(_1001, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1057);
    float _1071 = _1061 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1073 = _1063 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1075 = _983 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1077 = -_907;
    float _1079 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1051);
    float _1081 = _943 + _1071;
    float _1083 = _945 + _1073;
    float _1085 = -_907;
    float _1087 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1059);
    float _1089 = -_907;
    float _1091 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1075);
    float _1093 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1095 = _1081 + _1093;
    float _1097 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1099 = _1083 + _1097;
    float _1101 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1079);
    float _1103 = _953 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1105 = _1095 * _1095;
    float _1107 = _1099 * _1099;
    float _1109 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1111 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1103);
    float _1113 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1087);
    float _1115 = _1105 + _1107;
    float _1117 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1091);
    float _1119 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1109);
    float _1121 = _953 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1123 = sqrt(_1115);
    bool _1125 = !_859;
    float _1127 = _1125 ? _185 : as_type<float>(_899);
    float _1129 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1131 = _963 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1133 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1121);
    float _1135 = _963 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1137 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1119);
    float _1139 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1131);
    float _1141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1143 = _953 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1145 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1135);
    float _1147 = _1137 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1149 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1111);
    float _1151 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1143);
    float _1153 = _963 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1155 = _947 + _1147;
    bool _1157 = _1123 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1159 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1161 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1153);
    float _1163 = _1129 * _1101;
    float _1165 = _1129 * _1113;
    float _1167 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1151);
    float _1169 = _1129 * _1117;
    float _1171 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1133);
    float _1173 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].z;
    float _1175 = _1151;
    float _1177 = _1147;
    float _1179 = _1105;
    float _1181 = _1107;
    if (!_1157)
    {
        _1175 = _1081;
    }
    float _1183 = _1175;
    float _1185 = _1183;
    if (!_1157)
    {
        _1005 = _1083;
    }
    float _1187 = _1005;
    float _1189 = _1187;
    if (!_1157)
    {
        _1177 = _1155;
    }
    float _1191 = _1177;
    bool _1193 = !_1157;
    float _1195 = _1191;
    if (!_1193)
    {
        float _1197 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1199 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1201 = _1123 + _1199;
        float _1203 = _1155 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1205 = rsqrt(_1115);
        float _1207 = _1201 * _1197;
        float _1209 = _1207 * 0.15915493667125701904296875;
        float _1211 = _1209 * 6.283185482025146484375;
        float _1213 = sin(_1211);
        float _1215 = _1209 * 6.283185482025146484375;
        float _1217 = cos(_1215);
        float _1219 = fma(_1213, _1203, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1221 = _1205 * _1219;
        float _1223 = fma(_1095, _1221, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1225 = _1217 + (-1.0);
        float _1227 = fma(_1099, _1221, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1229 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1231 = _1223 + _1229;
        float _1233 = _1225 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1235 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1237 = _1227 + _1235;
        float _1239 = _1231 * _1231;
        float _1241 = fma(_1155, _1217, _1233);
        float _1243 = _1237 * _1237;
        _1195 = _1241;
        _1007 = _1225;
        _1179 = _1239;
        _1181 = _1243;
        _1185 = _1223;
        _1189 = _1227;
    }
    float _1245 = _1195;
    float _1247 = _1007;
    float _1249 = _1179;
    float _1251 = _1181;
    float _1253 = _1185;
    float _1255 = _1189;
    float _1257 = -_181;
    int _1259 = _965 ? as_type<int>(_1257) : as_type<int>(_181);
    float _1261 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1263 = -_181;
    int _1265 = _865 ? as_type<int>(_1263) : as_type<int>(_181);
    float _1267 = -_959;
    float _1269 = _1267 + 0.5;
    float _1271 = _1247;
    if (!_803)
    {
        _1271 = _181;
    }
    float _1273 = _1271;
    float _1275 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].w;
    float _1277 = _1273;
    if (_803)
    {
        float _1279 = -_181;
        float _1281 = _1067 ? _1279 : _181;
        _1277 = _1281;
    }
    float _1283 = _1277;
    float _1285 = -_1127;
    float _1287 = _1285 + 0.5;
    bool _1289 = !_839;
    float _1291 = _1289 ? _181 : as_type<float>(_1259);
    float _1293 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1139);
    bool _1295 = !_853;
    float _1297 = _1295 ? _181 : as_type<float>(_1265);
    float _1299 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1301 = _1245 + _1299;
    float _1303 = _1283 + 0.5;
    float _1305 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1161);
    float _1307 = _1291 + 0.5;
    float _1309 = fma(_1301, _1301, _1249);
    float _1311 = -_833;
    float _1313 = _1311 + 0.5;
    float _1315 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1317 = _1303 * (*spvDescriptorSet0.vp_c9)._m0[105].x;
    float _1319 = _1309 + _1251;
    float _1321 = _1313 * (*spvDescriptorSet0.vp_c9)._m0[105].y;
    float _1323 = _1307 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1325 = _1317 * _1173;
    float _1327 = _1269 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1329 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1331 = _1323 * _1141;
    float _1333 = _1327 * _1159;
    float _1335 = _1287 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1337 = _1297 + 0.5;
    float _1339 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1145);
    float _1341 = sqrt(_1319);
    float _1343 = _1335 * _1315;
    float _1345 = fma(_1261, _1171, _1163);
    float _1347 = fma(_1261, _1149, _1165);
    float _1349 = fma(_1261, _1167, _1169);
    float _1351 = _1337 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1353 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1355 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1357 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1359 = _1321 * _1275;
    float _1361 = _1351 * _1329;
    float _1363 = _1293 + _1345;
    float _1365 = _1353 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1367 = _1355 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1369 = _1357 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1371 = _1069 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1373 = _1339 + _1347;
    float _1375 = _1305 + _1349;
    out.m_76.x = _1331;
    out.m_76.y = _1333;
    out.m_76.z = _1361;
    out.m_76.w = _1343;
    bool _1377 = _1341 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1379 = isnan(_1341);
    bool _1381 = _1377 || _1379;
    bool _1383 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1385 = _1381 || _1383;
    out.m_78.x = _1365;
    out.m_78.y = _1367;
    out.m_78.z = _1369;
    out.m_78.w = _1371;
    out.m_80.x = _1325;
    out.m_80.y = _1359;
    out.m_82.x = _1363;
    out.m_82.y = _1373;
    out.m_82.z = _1375;
    float _1387 = _1345;
    if (!_1385)
    {
        _1387 = 1.0;
    }
    float _1389 = _1387;
    bool _1391 = !_1385;
    float _1393 = _1389;
    if (!_1391)
    {
        bool _1395 = _1341 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1397 = isnan(_1341);
        bool _1399 = _1395 || _1397;
        bool _1401 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1403 = _1399 || _1401;
        if (!_1403)
        {
            float _1405 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1407 = _1341 + _1405;
            float _1409 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1411 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1409;
            float _1413 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1415 = _1413 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1417 = 1.0 / _1411;
            float _1419 = _1407 * _1417;
            float _1421 = fma(_1419, _1415, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1393 = _1421;
            _1423 = true;
        }
        else
        {
            bool _1425 = _1341 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1427 = isnan(_1341);
            bool _1429 = _1425 || _1427;
            bool _1431 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1433 = _1429 || _1431;
            if (!_1433)
            {
                float _1435 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1437 = _1341 + _1435;
                float _1439 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1441 = _1439 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1443 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1445 = _1443 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1447 = 1.0 / _1441;
                float _1449 = _1437 * _1447;
                float _1451 = fma(_1449, _1445, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1393 = _1451;
                _1423 = true;
            }
            else
            {
                _1393 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1423 = false;
    float _1453 = _1393;
    float _1455 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1457 = _1245 + _1455;
    float _1459 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1461 = _1253 + _1459;
    float _1463 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1465 = _1255 + _1463;
    float _1467 = _947 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1469 = fma(_1457, _1453, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1471 = fma(_1461, _1453, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1473 = fma(_1465, _1453, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1475 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1467);
    float _1477 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1479 = _1469 + _1477;
    float _1481 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1483 = _1471 + _1481;
    float _1485 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1487 = _1473 + _1485;
    float _1489 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1475);
    float _1491 = _1479 * _1479;
    float _1493 = _947 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1495 = _1489 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1497 = fma(_1483, _1483, _1491);
    float _1499 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1493);
    float _1501 = 1.0 / _1495;
    float _1503 = fma(_1487, _1487, _1497);
    float _1505 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1499);
    float _1507 = _1505 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1509 = rsqrt(_1503);
    float _1511 = _1507 + _1495;
    float _1513 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1515 = fma(_943, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1517 = _947 + _1513;
    float _1519 = _1511 * _1501;
    float _1521 = _1519 * 0.5;
    float _1523 = floor(_1515);
    float _1525 = _1517 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1527 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1529 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1527);
    float _1531 = _1517 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1533 = fma(_943, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1525);
    float _1535 = _1509 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1537 = fma(_943, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1531);
    float _1539 = 1.0 / _1529;
    float _1541 = fma(_945, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1533);
    float _1543 = _1483 * _1535;
    float _1545 = _1487 * _1535;
    float _1547 = fma(_945, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1537);
    float _1549 = _1541 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1551 = _1543 * _1543;
    float _1553 = _1545 * _1545;
    float _1555 = _1547 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1557 = trunc(_1549);
    int _1559 = int(_1557);
    float _1561 = _1551 + _1553;
    float _1563 = -_1523;
    float _1565 = _1515 + _1563;
    float _1567 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1569 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1571 = _1539 * _1569;
    float _1573 = sqrt(_1561);
    bool _1575 = _1571 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1577 = _1571 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1579 = trunc(_1555);
    int _1581 = int(_1579);
    int _1583 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1585 = _1559 + _1583;
    int _1587 = _1585 + 1;
    bool _1589 = _1573 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1591 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1593 = _1573 + _1591;
    int _1595 = 2;
    float _1597 = _1535;
    float _1599 = _1561;
    float _1601 = _1593;
    float _1603 = _1543;
    float _1605 = _1551;
    int _1607 = as_type<int>(_1555);
    if (!_1575)
    {
        _1595 = 1;
    }
    int _1609 = _1595;
    float _1611 = sqrt(_1503);
    float _1613 = precise::max(0.0, _1567);
    int _1615 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1617 = _1581 + _1615;
    int _1619 = _1617 + 1;
    float _1621 = -_1535;
    float _1623 = -_1613;
    float _1625 = fma(_1479, _1621, _1623);
    int _1627 = _1587 | _1619;
    float _1629 = _1501;
    int _1631 = _1609;
    float _1633 = as_type<float>(_1627);
    float _1635 = _1625;
    if (_1589)
    {
        float _1637 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1629 = _1637;
    }
    float _1639 = _1629;
    if (_1589)
    {
        float _1641 = _1625 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1597 = _1641;
    }
    float _1643 = _1597;
    if (_1589)
    {
        float _1645 = rsqrt(_1561);
        _1599 = _1645;
    }
    float _1647 = _1599;
    float _1649 = _1647;
    if (_1589)
    {
        float _1651 = _1593 * _1639;
        _1601 = _1651;
    }
    float _1653 = _1601;
    float _1655 = 0.0;
    if (_1589)
    {
        float _1657 = _1653 * 0.15915493667125701904296875;
        _1655 = _1657;
    }
    float _1659 = _1655;
    bool _1661 = !_1575;
    int _1663 = _1661 ? 0 : 1;
    float _1665 = _1547;
    if (_1589)
    {
        float _1667 = _1659 * 6.283185482025146484375;
        float _1669 = sin(_1667);
        _1665 = _1669;
    }
    float _1671 = _1665;
    if (!_1577)
    {
        _1631 = _1663;
    }
    int _1673 = _1631;
    bool _1675 = _1587 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1677 = _1673 << 6;
    bool _1679 = _1627 < 0;
    bool _1681 = _1679 || _1675;
    float _1683 = _1659;
    if (_1589)
    {
        float _1685 = _1659 * 6.283185482025146484375;
        float _1687 = cos(_1685);
        _1683 = _1687;
    }
    float _1689 = _1683;
    int _1691 = _1677 + 96;
    uint _1694 = uint(int(uint(_1691) >> uint(2)));
    uint _1696 = uint(int(uint(int(_1694)) >> uint(2)));
    int _1698 = int(_1694) & 3;
    float _1700 = (*spvDescriptorSet0.vp_c15)._m0[int(_1696)][_1698];
    int _1702 = int(_1694) + 1;
    uint _1704 = uint(int(uint(_1702) >> uint(2)));
    int _1706 = _1702 & 3;
    float _1708 = (*spvDescriptorSet0.vp_c15)._m0[int(_1704)][_1706];
    bool _1710 = _1619 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1712 = _1710 || _1681;
    float _1714 = fma(_945, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    if (_1589)
    {
        float _1716 = fma(_1671, _1643, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1633 = _1716;
    }
    float _1718 = _1633;
    int _1720 = _1677 + 48;
    uint _1722 = uint(int(uint(_1720) >> uint(2)));
    uint _1724 = uint(int(uint(int(_1722)) >> uint(2)));
    int _1726 = int(_1722) & 3;
    float _1728 = (*spvDescriptorSet0.vp_c15)._m0[int(_1724)][_1726];
    int _1730 = int(_1722) + 1;
    uint _1732 = uint(int(uint(_1730) >> uint(2)));
    int _1734 = _1730 & 3;
    float _1736 = (*spvDescriptorSet0.vp_c15)._m0[int(_1732)][_1734];
    float _1738 = _1469 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1740 = floor(_1714);
    float _1742 = 0.0;
    if (_1589)
    {
        float _1744 = _1647 * _1718;
        _1742 = _1744;
    }
    float _1746 = _1742;
    float _1748 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1738);
    float _1750 = _1746;
    if (_1589)
    {
        float _1752 = _1689 + (-1.0);
        _1649 = _1752;
    }
    float _1754 = _1649;
    int _1756 = _1677 + 64;
    uint _1758 = uint(int(uint(_1756) >> uint(2)));
    uint _1760 = uint(int(uint(int(_1758)) >> uint(2)));
    int _1762 = int(_1758) & 3;
    float _1764 = (*spvDescriptorSet0.vp_c15)._m0[int(_1760)][_1762];
    int _1766 = int(_1758) + 1;
    uint _1768 = uint(int(uint(_1766) >> uint(2)));
    int _1770 = _1766 & 3;
    float _1772 = (*spvDescriptorSet0.vp_c15)._m0[int(_1768)][_1770];
    float _1774 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1748);
    float _1776 = _1754;
    if (_1589)
    {
        float _1778 = _1543 * _1746;
        _1603 = _1778;
    }
    float _1780 = _1603;
    float _1782 = 0.0;
    if (_1589)
    {
        float _1784 = _1754 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1782 = _1784;
    }
    float _1786 = _1782;
    if (!_1589)
    {
        _1776 = _1545;
    }
    float _1788 = _1776;
    float _1790 = _1788;
    if (_1589)
    {
        float _1792 = _1545 * _1746;
        _1790 = _1792;
    }
    float _1794 = _1790;
    float _1796 = _1774 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (_1589)
    {
        float _1798 = fma(_1625, _1689, _1786);
        _1635 = _1798;
    }
    float _1800 = _1635;
    int _1802 = _1677 + 104;
    uint _1804 = uint(int(uint(_1802) >> uint(2)));
    uint _1806 = uint(int(uint(int(_1804)) >> uint(2)));
    int _1808 = int(_1804) & 3;
    float _1810 = (*spvDescriptorSet0.vp_c15)._m0[int(_1806)][_1808];
    int _1812 = int(_1804) + 1;
    uint _1814 = uint(int(uint(_1812) >> uint(2)));
    int _1816 = _1812 & 3;
    float _1818 = (*spvDescriptorSet0.vp_c15)._m0[int(_1814)][_1816];
    if (_1589)
    {
        float _1820 = _1780 * _1780;
        _1605 = _1820;
    }
    float _1822 = _1605;
    float _1824 = _1822;
    if (!_1589)
    {
        _1750 = _1553;
    }
    float _1826 = _1750;
    float _1828 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1830 = _1796 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1832 = _1826;
    int _1834 = as_type<int>(_1828);
    if (_1589)
    {
        float _1836 = _1794 * _1794;
        _1832 = _1836;
    }
    float _1838 = _1832;
    float _1840 = fma(_1800, _1800, _1822);
    float _1842 = 0.0;
    if (!_1712)
    {
        float _1844 = floor(_1555);
        _1842 = _1844;
    }
    float _1846 = _1842;
    int _1848 = _1677 + 80;
    uint _1850 = uint(int(uint(_1848) >> uint(2)));
    uint _1852 = uint(int(uint(int(_1850)) >> uint(2)));
    int _1854 = int(_1850) & 3;
    float _1856 = (*spvDescriptorSet0.vp_c15)._m0[int(_1852)][_1854];
    int _1858 = int(_1850) + 1;
    uint _1860 = uint(int(uint(_1858) >> uint(2)));
    int _1862 = _1858 & 3;
    float _1864 = (*spvDescriptorSet0.vp_c15)._m0[int(_1860)][_1862];
    float _1866 = -_1830;
    float _1868 = fma(_1866, _1828, 1.0);
    float _1870 = _1840 + _1838;
    if (!_1712)
    {
        int _1872 = _1619 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1874 = _1872 + _1587;
        _1834 = _1874;
    }
    int _1876 = _1834;
    float _1878 = -_1740;
    float _1880 = _1714 + _1878;
    float _1882 = log2(_1868);
    int _1884 = _1677 + 56;
    uint _1886 = uint(int(uint(_1884) >> uint(2)));
    uint _1888 = uint(int(uint(int(_1886)) >> uint(2)));
    int _1890 = int(_1886) & 3;
    float _1892 = (*spvDescriptorSet0.vp_c15)._m0[int(_1888)][_1890];
    int _1894 = int(_1886) + 1;
    uint _1896 = uint(int(uint(_1894) >> uint(2)));
    int _1898 = _1894 & 3;
    float _1900 = (*spvDescriptorSet0.vp_c15)._m0[int(_1896)][_1898];
    float _1902 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1904 = fma(_1611, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1902);
    float _1906 = precise::clamp(_1904, 0.0, 1.0);
    float _1908 = -_1906;
    float _1910 = _1908 + 1.0;
    if (!_1712)
    {
        float _1912 = -_1846;
        float _1914 = _1555 + _1912;
        _1824 = _1914;
    }
    float _1916 = _1824;
    int _1918 = _1677 + 88;
    uint _1920 = uint(int(uint(_1918) >> uint(2)));
    uint _1922 = uint(int(uint(int(_1920)) >> uint(2)));
    int _1924 = int(_1920) & 3;
    float _1926 = (*spvDescriptorSet0.vp_c15)._m0[int(_1922)][_1924];
    int _1928 = int(_1920) + 1;
    uint _1930 = uint(int(uint(_1928) >> uint(2)));
    int _1932 = _1928 & 3;
    float _1934 = (*spvDescriptorSet0.vp_c15)._m0[int(_1930)][_1932];
    float _1936 = _1517 * _1708;
    if (!_1712)
    {
        int _1938 = _1876 << 2;
        _1607 = _1938;
    }
    int _1940 = _1607;
    float _1942 = fma(_943, _1700, _1936);
    int _1944 = _1940;
    if (!_1712)
    {
        int _1946 = 12 & _1940;
        _1944 = _1946;
    }
    int _1948 = _1944;
    float _1950 = _1882 * 0.693147182464599609375;
    int _1952 = _1677 + 72;
    uint _1954 = uint(int(uint(_1952) >> uint(2)));
    uint _1956 = uint(int(uint(int(_1954)) >> uint(2)));
    int _1958 = int(_1954) & 3;
    float _1960 = (*spvDescriptorSet0.vp_c15)._m0[int(_1956)][_1958];
    int _1962 = int(_1954) + 1;
    uint _1964 = uint(int(uint(_1962) >> uint(2)));
    int _1966 = _1962 & 3;
    float _1968 = (*spvDescriptorSet0.vp_c15)._m0[int(_1964)][_1966];
    float _1970 = _1517 * _1736;
    float2 _5835 = float2(_1565, _1880);
    float _1972 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5835, float2(0.0), isnan(_5835)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5835, float2(0.0), isnan(_5835)), level(0.0)).x;
    float _1974 = _1950 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1976 = fma(_943, _1728, _1970);
    float _1978 = _1517 * _1772;
    float _1980 = rsqrt(_1870);
    float _1982 = fma(_943, _1764, _1978);
    float _1984 = fma(_945, _1810, _1942);
    float _1986 = _1984 + _1818;
    float _1988 = _1517 * _1864;
    int _1990 = as_type<int>(_1864);
    int _1992 = as_type<int>(_1856);
    if (!_1712)
    {
        uint _1994 = uint(int(uint(_1876) >> uint(2)));
        _1990 = int(_1994);
    }
    int _1996 = _1990;
    float _1998 = 1.0 / _1986;
    float _2000 = _1980 * _1780;
    float _2002 = fma(_943, _1856, _1988);
    float _2004 = _1980 * _1800;
    if (!_1712)
    {
        int _2006 = _1996 << 4;
        int _2008 = _2006 + _1948;
        _1992 = _2008;
    }
    int _2010 = _1992;
    float _2012 = _2000 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2014 = fma(_945, _1892, _1976);
    float _2016 = _1980 * _1794;
    float _2018 = abs(_1910);
    float _2020 = log2(_2018);
    float _2022 = -_2012;
    float _2024 = fma(_2004, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2022);
    float _2026 = _1469 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2028 = _1970;
    if (!_1712)
    {
        int _2030 = _2010 + 400;
        uint _2032 = uint(int(uint(_2030) >> uint(2)));
        uint _2034 = uint(int(uint(int(_2032)) >> uint(2)));
        int _2036 = int(_2032) & 3;
        float _2038 = (*spvDescriptorSet0.vp_c15)._m0[int(_2034)][_2036];
        _2028 = _2038;
    }
    float _2040 = _2028;
    float _2042 = -_2016;
    float _2044 = fma(_2042, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2024);
    float _2046 = fma(_945, _1926, _2002);
    float _2048 = _2014 + _1900;
    float _2050 = _1469 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2052 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2026);
    float _2054 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2050);
    float _2056 = _2048 * _1998;
    float _2058 = fma(_945, _1960, _1982);
    float _2060 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2052);
    float _2062 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2054);
    float _2064 = _2020 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2066 = _2058 + _1968;
    float _2068 = _1469 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _2070 = _2056 >= 0.0;
    float _2072 = _2060 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2074 = _2066 * _1998;
    float _2076 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2068);
    bool _2078 = _2056 <= 1.0;
    bool _2080 = _2078 && _2070;
    float _2082 = exp2(_2064);
    float _2084 = _2072 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2086 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2076);
    bool _2088 = _2074 >= 0.0;
    bool _2090 = _2088 && _2080;
    float _2092 = fma(_2044, -0.5, 0.5);
    float _2094 = fma(_2044, 0.5, 0.5);
    float _2096 = _2086 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _2098 = _2074 <= 1.0;
    bool _2100 = _2098 && _2090;
    float _2102 = _2062 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2104 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2084);
    float _2106 = sqrt(_2092);
    float _2108 = _2046 + _1934;
    float _2110 = _2004 + 1.0;
    float _2112 = fma(_2094, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2114 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2104);
    float _2116 = _2072 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2118 = -_2004;
    float _2120 = fma(_2082, _2110, _2118);
    float _2122 = fma(_2094, _2112, -0.212114393711090087890625);
    float _2124 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2114);
    float _2126 = _2072 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2128 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2116);
    float _2130 = fma(_2094, _2122, 1.570728778839111328125);
    float _2132 = 1.0 / _2124;
    float _2134 = _2094;
    float _2136 = _2124;
    if (_2100)
    {
        float _2138 = float(_1673);
        _2134 = _2138;
    }
    float _2140 = _2134;
    float _2142 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2126);
    float _2144 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2128);
    float _2146 = _2106 * 0.636619746685028076171875;
    float _2148 = _2108 * _1998;
    float _2150 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2142);
    float _2152 = _2140;
    float _2154 = _2150;
    if (_2100)
    {
        float _2156 = rint(_2140);
        float _2158 = precise::max(_2156, 0.0);
        uint _2160 = uint(_2158);
        uint _2162 = clamp(_2160, 0u, 65535u);
        _2152 = as_type<float>(_2162);
    }
    float _2164 = _2152;
    float _2166 = -_2130;
    float _2168 = fma(_2146, _2166, 1.0);
    float _2170 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2144);
    float _2172 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2150);
    float _2174 = _2066;
    float _2176 = _2170;
    float _2178 = _2172;
    if (!_1712)
    {
        float _2180 = floor(_1549);
        _2174 = _2180;
    }
    float _2182 = _2174;
    float _2184 = _2170 * _2132;
    float _2186 = _2172 * _2132;
    float _2188 = fma(_2120, 0.5, 0.5);
    float _2190 = fma(_2184, 0.5, 0.5);
    float _2192 = fma(_2186, -0.5, 0.5);
    float _2194 = _2074;
    if (_2100)
    {
        float3 _6216 = float3(_2056, _2074, float(as_type<int>(_2164)));
        float3 _6220 = select(_6216, float3(0.0), isnan(_6216));
        float _2196 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6220.xy, uint(rint(_6220.z)), _2148, level(0.0));
        _2194 = _2196;
    }
    float _2198 = _2194;
    float _2200 = _2004;
    if (!_1712)
    {
        float _2202 = rint(_2040);
        float _2204 = precise::max(_2202, 0.0);
        uint _2206 = uint(_2204);
        uint _2208 = clamp(_2206, 0u, 65535u);
        _2200 = as_type<float>(_2208);
    }
    float _2210 = _2200;
    if (!_1712)
    {
        float _2212 = -_2182;
        float _2214 = _1549 + _2212;
        _2154 = _2214;
    }
    float _2216 = _2154;
    float3 _6257 = float3(_2190, _2192, _1974);
    float _2218 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6257, float3(0.0), isnan(_6257)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6257, float3(0.0), isnan(_6257)), level(0.0)).x;
    float3 _6266 = float3(_2190, _2192, _1974);
    float4 _2221 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6266, float3(0.0), isnan(_6266)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6266, float3(0.0), isnan(_6266)), level(0.0)).xyzw;
    float _2223 = _2221.x;
    float _2225 = _2221.y;
    float _2227 = _2221.z;
    float _2229 = _2221.w;
    float2 _6282 = float2(_2168, _2188);
    float3 _2233 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6282, float2(0.0), isnan(_6282)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6282, float2(0.0), isnan(_6282)), level(0.0)).xyz;
    float _2235 = _2233.x;
    float _2237 = _2233.y;
    float _2239 = _2233.z;
    float _2241 = _1916;
    if (!_1712)
    {
        float3 _6303 = float3(_2216, _1916, float(as_type<int>(_2210)));
        float3 _6305 = select(_6303, float3(0.0), isnan(_6303));
        float _2243 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6305.xy, uint(rint(_6305.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6305.xy, uint(rint(_6305.z)), level(0.0)).x;
        _2241 = _2243;
    }
    float _2245 = _2241;
    float _2247 = abs(_1571);
    float _2249 = log2(_2247);
    float _2251 = _2072 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2253 = _2020 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2255 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2251);
    float _2257 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2255);
    float _2259 = _2124 * 0.5;
    float _2261 = exp2(_2253);
    bool _2263 = _1571 <= 8000.0;
    bool _2265 = isnan(_1571);
    bool _2267 = _2263 || _2265;
    bool _2269 = isnan(8000.0);
    bool _2271 = _2267 || _2269;
    float _2273 = float(_2271);
    float _2275 = _2249 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2277 = exp2(_2275);
    float _2279 = fma(_2172, -0.5, _2259);
    float _2281 = fma(_2277, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2283 = precise::clamp(_2281, 0.0, 1.0);
    float _2285 = fma(_2283, -2.0, 3.0);
    float _2287 = _2283 * _2283;
    float _2289 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2257);
    float _2291 = _2287 * _2285;
    float _2293 = _2289 + _2124;
    float _2295 = _2170 + _2124;
    float _2297 = -_2291;
    float _2299 = _2297 + 1.0;
    float _2301 = _2293 * 0.5;
    float _2303 = _2295 * 0.5;
    out.gl_Position.x = _2170;
    out.gl_Position.y = _2172;
    out.gl_Position.z = _2289;
    out.gl_Position.w = _2124;
    float _2305 = fma(_2299, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2291);
    out.m_84.x = _2303;
    out.m_84.y = _2279;
    out.m_84.z = _2301;
    out.m_84.w = _2124;
    float _2307 = _2273 * _2305;
    float _2309 = -_2261;
    float _2311 = _2309 + 1.0;
    float _2313 = _2307 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2315 = _2307;
    float _2317 = _2289;
    float _2319 = _2303;
    if (!_2100)
    {
        _2315 = 1.0;
    }
    float _2321 = _2315;
    float _2323 = _2311 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2325 = _2321;
    if (_1712)
    {
        _2176 = 1.0;
    }
    float _2327 = _2176;
    float _2329 = -_1972;
    float _2331 = _2329 + 1.0;
    float _2333 = _2331 * _2313;
    float _2335 = precise::clamp(_2333, 0.0, 1.0);
    float _2337 = _2327;
    if (_2100)
    {
        bool _2339 = _2198 >= _2148;
        bool _2341 = isnan(_2198);
        bool _2343 = _2339 || _2341;
        bool _2345 = isnan(_2148);
        bool _2347 = _2343 || _2345;
        float _2349 = float(_2347);
        _2325 = _2349;
    }
    float _2351 = _2325;
    if (!_1712)
    {
        int _2353 = _1876 << 4;
        int _2355 = _2353 + 2048;
        uint _2357 = uint(int(uint(_2355) >> uint(2)));
        uint _2359 = uint(int(uint(int(_2357)) >> uint(2)));
        int _2361 = int(_2357) & 3;
        float _2363 = (*spvDescriptorSet0.vp_c15)._m0[int(_2359)][_2361];
        int _2365 = int(_2357) + 1;
        uint _2367 = uint(int(uint(_2365) >> uint(2)));
        int _2369 = _2365 & 3;
        float _2371 = (*spvDescriptorSet0.vp_c15)._m0[int(_2367)][_2369];
        int _2373 = _2355 + 8;
        uint _2375 = uint(int(uint(_2373) >> uint(2)));
        uint _2377 = uint(int(uint(int(_2375)) >> uint(2)));
        int _2379 = int(_2375) & 3;
        float _2381 = (*spvDescriptorSet0.vp_c15)._m0[int(_2377)][_2379];
        int _2383 = int(_2375) + 1;
        uint _2385 = uint(int(uint(_2383) >> uint(2)));
        int _2387 = _2383 & 3;
        float _2389 = (*spvDescriptorSet0.vp_c15)._m0[int(_2385)][_2387];
        float _2391 = _1517 * _2371;
        float _2393 = fma(_943, _2363, _2391);
        float _2395 = fma(_945, _2381, _2393);
        float _2397 = _2395 + _2389;
        float _2399 = precise::clamp(_2397, 0.0, 1.0);
        float _2401 = -_2399;
        float _2403 = _2401 + _2245;
        float _2405 = fma(_2403, 500.0, 1.5);
        float _2407 = exp2(_2405);
        float _2409 = 0.0 + _2407;
        float _2411 = precise::clamp(_2409, 0.0, 1.0);
        _2337 = _2411;
        _2136 = _2389;
        _2178 = 500.0;
        _2317 = _2381;
    }
    float _2413 = _2337;
    float _2415 = _2136;
    float _2417 = _2178;
    float _2419 = _2317;
    float _2421 = _2323 * _2218;
    float _2423 = _2351 * _2413;
    float _2425 = -_2335;
    float _2427 = fma(_2425, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2429 = -_2323;
    float _2431 = _2429 + 1.0;
    float _2433 = _2229 * _2421;
    float _2435 = _2239 * _2421;
    float _2437 = -_2423;
    float _2439 = fma(_2437, _2427, 1.0);
    float _2441 = precise::clamp(_2439, 0.0, 1.0);
    bool _2443 = _1611 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2445 = isnan(_1611);
    bool _2447 = _2443 || _2445;
    bool _2449 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2451 = _2447 || _2449;
    float _2453 = fma(_2235, _2433, _2223);
    float _2455 = fma(_2237, _2433, _2225);
    float _2457 = _2441 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2459 = _2229 * _2431;
    float _2461 = fma(_2229, _2435, _2227);
    out.m_86.x = _2457;
    out.m_88.x = _2453;
    out.m_88.y = _2455;
    out.m_88.z = _2461;
    out.m_88.w = _2459;
    float _2463 = _2415;
    float _2465 = _2419;
    float _2467 = _2417;
    float _2469 = _2423;
    float _2471 = _2441;
    if (!_2451)
    {
        _2319 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2473 = _2319;
    float _2475 = _2473;
    float _2477 = _2473;
    if (!_2451)
    {
        _2463 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2479 = _2463;
    float _2481 = _2479;
    float _2483 = _2479;
    if (!_2451)
    {
        _2465 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2485 = _2465;
    float _2487 = _2485;
    float _2489 = _2485;
    if (!_2451)
    {
        _2467 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2491 = _2467;
    float _2493 = _2491;
    float _2495 = _2491;
    if (!_2451)
    {
        _2469 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2497 = _2469;
    float _2499 = _2497;
    float _2501 = _2497;
    if (!_2451)
    {
        _2471 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2503 = _2471;
    bool _2505 = !_2451;
    float _2507 = _2503;
    float _2509 = _2503;
    if (!_2505)
    {
        bool _2511 = _1611 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2513 = isnan(_1611);
        bool _2515 = _2511 || _2513;
        bool _2517 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2519 = _2515 || _2517;
        if (!_2519)
        {
            float _2521 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2523 = _1611 + _2521;
            float _2525 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2527 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2525;
            float _2529 = 1.0 / _2527;
            float _2531 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2533 = _2531 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2535 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2537 = _2535 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2539 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2541 = _2539 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2543 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2545 = _2543 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2547 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2549 = _2547 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2551 = _2523 * _2529;
            float _2553 = precise::clamp(_2551, 0.0, 1.0);
            float _2555 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2557 = _2555 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2559 = fma(_2553, _2533, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2561 = fma(_2553, _2557, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2563 = fma(_2553, _2537, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2565 = fma(_2553, _2541, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2567 = fma(_2553, _2545, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2569 = fma(_2553, _2549, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2483 = _2561;
            _2501 = _2567;
            _2477 = _2559;
            _2495 = _2565;
            _2489 = _2563;
            _2509 = _2569;
            _2571 = true;
        }
        else
        {
            bool _2573 = _1611 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2575 = isnan(_1611);
            bool _2577 = _2573 || _2575;
            bool _2579 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2581 = _2577 || _2579;
            if (!_2581)
            {
                _2475 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2583 = _2475;
            _2477 = _2583;
            if (!_2581)
            {
                _2481 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2585 = _2481;
            _2483 = _2585;
            if (!_2581)
            {
                _2487 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2587 = _2487;
            _2489 = _2587;
            if (!_2581)
            {
                _2493 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2589 = _2493;
            _2495 = _2589;
            if (!_2581)
            {
                _2499 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2591 = _2499;
            _2501 = _2591;
            if (!_2581)
            {
                _2507 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2593 = _2507;
            bool _2595 = !_2581;
            _2509 = _2593;
            if (!_2595)
            {
                bool _2597 = _1611 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2599 = isnan(_1611);
                bool _2601 = _2597 || _2599;
                bool _2603 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2605 = _2601 || _2603;
                if (!_2605)
                {
                    float _2607 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2609 = _1611 + _2607;
                    float _2611 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2613 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2611;
                    float _2615 = 1.0 / _2613;
                    float _2617 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2619 = _2617 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2621 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2623 = _2621 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2625 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2627 = _2625 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2629 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2631 = _2629 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2633 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2635 = _2633 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2637 = _2609 * _2615;
                    float _2639 = precise::clamp(_2637, 0.0, 1.0);
                    float _2641 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2643 = _2641 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2645 = fma(_2639, _2619, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2647 = fma(_2639, _2643, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2649 = fma(_2639, _2623, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2651 = fma(_2639, _2627, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2653 = fma(_2639, _2631, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2655 = fma(_2639, _2635, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2483 = _2647;
                    _2501 = _2653;
                    _2477 = _2645;
                    _2495 = _2651;
                    _2489 = _2649;
                    _2509 = _2655;
                    _2571 = true;
                }
                else
                {
                    _2483 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2501 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2477 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2495 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2489 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2509 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2571 = false;
    float _2657 = _2483;
    float _2659 = _2501;
    float _2661 = _2477;
    float _2663 = _2495;
    float _2665 = _2489;
    float _2667 = _2509;
    float _2669 = fma(_1373, -0.5, 0.5);
    float _2671 = precise::clamp(_2669, 0.0, 1.0);
    float _2673 = -_2657;
    float _2675 = _2673 + _2659;
    float _2677 = -_2661;
    float _2679 = _2677 + _2663;
    float _2681 = -_2665;
    float _2683 = _2681 + _2667;
    bool _2685 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2687 = fma(_2671, _2675, _2657);
    float _2689 = fma(_2671, _2679, _2661);
    float _2691 = fma(_2671, _2683, _2665);
    float _2693 = _2687 * 0.586610972881317138671875;
    out.m_90.x = 0.0;
    float _2695 = fma(_2689, 0.298911988735198974609375, _2693);
    float _2697 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2699 = fma(_2691, 0.114477999508380889892578125, _2695);
    out.m_61.x = _2697;
    float _2701 = -_2699;
    float _2703 = _2689 + _2701;
    float _2705 = -_2699;
    float _2707 = _2687 + _2705;
    float _2709 = -_2699;
    float _2711 = _2691 + _2709;
    float _2713 = fma(_2703, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2699);
    float _2715 = fma(_2707, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2699);
    float _2717 = fma(_2711, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2699);
    out.m_92.x = _2713;
    out.m_92.y = _2715;
    out.m_92.z = _2717;
    if (!_2685)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2719 = -_1469;
    float _2721 = _2719 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2723 = -_1471;
    float _2725 = _2723 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2727 = -_1473;
    float _2729 = _2727 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2731 = _2721 * _2721;
    float _2733 = fma(_2725, _2725, _2731);
    float _2735 = fma(_2729, _2729, _2733);
    float _2737 = sqrt(_2735);
    float _2739 = rsqrt(_2735);
    float _2741 = -_2737;
    float _2743 = _2741 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2745 = _2743 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2747 = precise::clamp(_2745, 0.0, 1.0);
    float _2749 = _2725 * _2739;
    float _2751 = _2721 * _2739;
    float _2753 = abs(_2747);
    float _2755 = log2(_2753);
    float _2757 = _2729 * _2739;
    float _2759 = _2749 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2761 = _1373 * _2751;
    float _2763 = -_2751;
    float _2765 = -_2759;
    float _2767 = fma(_2763, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2765);
    float _2769 = fma(_1363, _2749, _2761);
    float _2771 = -_2757;
    float _2773 = fma(_2771, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2767);
    float _2775 = fma(_1375, _2757, _2769);
    float _2777 = precise::clamp(_2775, 0.0, 1.0);
    float _2779 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2781 = _2773 + _2779;
    float _2783 = _2755 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2785 = _2781 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2787 = precise::clamp(_2785, 0.0, 1.0);
    float _2789 = exp2(_2783);
    float _2791 = _2789 * _2787;
    float _2793 = _2777 * _2791;
    float _2795 = _2793 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2797 = _2793 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2799 = _2793 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _2795;
    out.m_90.y = _2797;
    out.m_90.z = _2799;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

