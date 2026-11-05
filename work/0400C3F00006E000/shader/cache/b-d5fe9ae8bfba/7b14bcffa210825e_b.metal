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
    float4 m_80 [[user(locn0)]];
    float4 m_82 [[user(locn1)]];
    float4 m_63 [[user(locn2)]];
    float4 m_110 [[user(locn3)]];
    float4 m_61 [[user(locn4)]];
    float4 m_90 [[user(locn5)]];
    float4 m_98 [[user(locn6)]];
    float4 m_86 [[user(locn7)]];
    float4 m_92 [[user(locn8)]];
    float4 m_84 [[user(locn9)]];
    float4 m_88 [[user(locn10)]];
    float4 m_100 [[user(locn11)]];
    float4 m_102 [[user(locn12)]];
    float4 m_96 [[user(locn13)]];
    float4 m_108 [[user(locn14)]];
    float4 m_104 [[user(locn15)]];
    float4 m_106 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_70 [[attribute(1)]];
    float4 m_72 [[attribute(2)]];
    float4 m_74 [[attribute(3)]];
    float4 m_94 [[attribute(4)]];
    float4 m_68 [[attribute(5)]];
    float4 m_56 [[attribute(6)]];
    float4 m_58 [[attribute(7)]];
    float4 m_76 [[attribute(8)]];
    float4 m_78 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_110 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_108 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5469 = false;
    bool _725 = false;
    bool _505 = false;
    bool _271 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _124 = in.m_56.w;
    float _126 = in.m_58.w;
    float _128 = trunc(_124);
    int _131 = int(_128);
    float _133 = -_126;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_61.y = _135;
    bool _139 = _131 >= 1;
    float _141 = 0.0;
    float _143 = _126;
    float _145 = _135;
    if (!_139)
    {
        _141 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _147 = _141;
    if (!_139)
    {
        out.m_63.x = 0.0;
    }
    int _149 = 0;
    if (!_139)
    {
        float _151 = _147 * 5.0;
        _149 = as_type<int>(_151);
    }
    int _153 = _149;
    int _155 = _153;
    if (!_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5779 = as_type<float>(_153);
        out.gl_Position.z = _5779;
    }
    if (!_139)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _157 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _159 = isnan(_126);
    bool _161 = _157 || _159;
    bool _163 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _165 = _161 || _163;
    float _167 = float(_131);
    bool _169 = _135 >= _167;
    bool _171 = !_165;
    bool _173 = _169 || _171;
    float _175 = 1.0 / _167;
    if (_173)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _177 = _143;
    if (_173)
    {
        out.m_63.x = 0.0;
    }
    float _179 = _135 * _175;
    float _181 = _179;
    if (_173)
    {
        float _183 = _177 * 5.0;
        _155 = as_type<int>(_183);
    }
    int _185 = _155;
    out.m_61.x = _179;
    if (_173)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5842 = as_type<float>(_185);
        out.gl_Position.z = _5842;
    }
    if (_173)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _187 = as_type<float>(int(gl_VertexIndex));
    float _189 = in.m_68.x;
    float _191 = in.m_68.y;
    float _193 = in.m_68.z;
    float _195 = in.m_70.x;
    float _197 = in.m_70.y;
    float _199 = in.m_70.z;
    float _201 = in.m_72.x;
    float _203 = in.m_72.y;
    float _205 = in.m_72.z;
    float _207 = in.m_74.x;
    float _209 = in.m_74.y;
    float _211 = in.m_74.z;
    int _213 = as_type<int>(_187) & 1;
    bool _215 = _213 != 0;
    int _217 = as_type<int>(_187) & 2;
    bool _219 = _217 != 0;
    bool _221 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _223 = !_215;
    float _225 = _223 ? (-0.5) : 0.5;
    bool _227 = !_219;
    float _229 = _227 ? (-0.5) : 0.5;
    float _231 = _191 * _197;
    float _233 = _191 * _203;
    float _235 = fma(_189, _195, _231);
    float _237 = _191 * _209;
    float _239 = fma(_189, _201, _233);
    float _241 = fma(_193, _199, _235);
    float _243 = fma(_189, _207, _237);
    float _245 = fma(_193, _205, _239);
    float _247 = fma(_193, _211, _243);
    bool _249 = !_221;
    bool _251 = false;
    float _269;
    if (!_249)
    {
        float _253 = in.m_76.x;
        float _255 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _257 = _253 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _259 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _261 = _259 * _255;
        float _263 = floor(_261);
        float _265 = -_263;
        float _267 = _261 + _265;
        _269 = _267;
        _271 = true;
    }
    else
    {
        _269 = _179;
    }
    _271 = false;
    float _273 = _269;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _277 = _273 + _275;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _281 = _273 + _279;
    bool _283 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _285 = isnan(_273);
    bool _287 = _283 || _285;
    bool _289 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _291 = _287 || _289;
    float _293 = float(_291);
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _301 = _299 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _303;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _309 = _307 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _313 = _273 + _311;
    float _315 = 1.0 / _301;
    bool _317 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _319 = 1.0 / _305;
    bool _321 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _323 = isnan(_273);
    bool _325 = _321 || _323;
    bool _327 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _329 = _325 || _327;
    float _331 = float(_329);
    float _333 = 1.0 / _297;
    float _335 = _277 * _315;
    bool _337 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _339 = isnan(_273);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _345 = _341 || _343;
    float _347 = float(_345);
    float _349 = 1.0 / _309;
    float _351 = _281 * _319;
    float _353 = -_293;
    float _355 = _353 + 1.0;
    bool _357 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _359 = isnan(_273);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = _347 * _355;
    float _371 = -_347;
    float _373 = _371 + 1.0;
    float _375 = _313 * _333;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _379 = _273 + _377;
    bool _381 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _383 = isnan(_273);
    bool _385 = _381 || _383;
    bool _387 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _389 = _385 || _387;
    float _391 = float(_389);
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _397;
    float _401 = _379 * _349;
    float _403 = _331 * _373;
    float _405 = -_331;
    float _407 = _405 + 1.0;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _417 = fma(_399, _375, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _419 = _367 * _407;
    float _421 = -_367;
    float _423 = _421 + 1.0;
    float _425 = fma(_411, _375, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _427 = fma(_395, _335, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _429 = fma(_415, _335, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _431 = _391 * _423;
    float _433 = -_391;
    float _435 = _433 + 1.0;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _437;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _441;
    float _445 = _425 * _431;
    float _447 = _417 * _431;
    float _449 = fma(_439, _351, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _451 = fma(_443, _351, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _453 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[143].x, _445);
    float _455 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[143].y, _447);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _465 = fma(_427, _419, _453);
    float _467 = fma(_429, _419, _455);
    float _469 = fma(_459, _401, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _471 = fma(_463, _401, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _473 = fma(_449, _403, _465);
    float _475 = fma(_451, _403, _467);
    float _477 = fma(_469, _369, _473);
    float _479 = fma(_471, _369, _475);
    float _481 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[147].x, _477);
    float _483 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[147].y, _479);
    bool _485 = !_317;
    float _503;
    if (!_485)
    {
        float _487 = in.m_76.x;
        float _489 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _491 = _487 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _493 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _495 = _493 * _489;
        float _497 = floor(_495);
        float _499 = -_497;
        float _501 = _495 + _499;
        _503 = _501;
        _505 = true;
    }
    else
    {
        _503 = _179;
    }
    _505 = false;
    float _507 = _503;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _511 = _507 + _509;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _515 = _513 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _523 = _521 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _525 = _507 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _527 = isnan(_507);
    bool _529 = _525 || _527;
    bool _531 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _533 = _529 || _531;
    float _535 = float(_533);
    float _537 = 1.0 / _515;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _539;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _547 = _507 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _549 = isnan(_507);
    bool _551 = _547 || _549;
    bool _553 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _555 = _551 || _553;
    float _557 = float(_555);
    float _559 = -_535;
    float _561 = _559 + 1.0;
    bool _563 = _507 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _565 = isnan(_507);
    bool _567 = _563 || _565;
    bool _569 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _571 = _567 || _569;
    float _573 = float(_571);
    float _575 = 1.0 / _519;
    float _577 = -_557;
    float _579 = _577 + 1.0;
    bool _581 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _583 = _535 * _579;
    float _585 = _541 * _537;
    float _587 = 1.0 / _523;
    bool _589 = _507 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _591 = isnan(_507);
    bool _593 = _589 || _591;
    bool _595 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _597 = _593 || _595;
    float _599 = float(_597);
    float _601 = fma(_585, _511, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _603;
    float _607 = -_599;
    float _609 = _607 + 1.0;
    float _611 = _599 * _561;
    float _613 = 1.0 / _545;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _617 = _615 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _619 = _573 * _609;
    float _621 = -_573;
    float _623 = _621 + 1.0;
    float _625 = _617 * _575;
    float _627 = _601 * _619;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _631 = _507 + _629;
    float _633 = _605 * _587;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _637 = _507 + _635;
    bool _639 = _507 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _641 = isnan(_507);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _655 = fma(_625, _631, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _657 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[115].x, _627);
    float _659 = fma(_633, _637, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _661 = -_649;
    float _663 = _661 + 1.0;
    float _665 = _653 * _613;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _669 = _507 + _667;
    float _671 = fma(_655, _611, _657);
    float _673 = _557 * _663;
    float _675 = fma(_665, _669, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _677 = fma(_659, _583, _671);
    float _679 = in.m_78.x;
    float _681 = in.m_78.y;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _685 = fma(_675, _673, _677);
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _689 = _683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _691 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[119].x, _685);
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _695 = _687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _697 = _691 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _699 = _693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_80.x = _695;
    out.m_80.y = _689;
    out.m_80.z = _699;
    out.m_80.w = _697;
    float _701 = _483 * _681;
    float _703 = _481 * _679;
    bool _705 = !_581;
    float _723;
    if (!_705)
    {
        float _707 = in.m_76.x;
        float _709 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _711 = _707 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _713 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[11].w, _135);
        float _715 = _713 * _709;
        float _717 = floor(_715);
        float _719 = -_717;
        float _721 = _715 + _719;
        _723 = _721;
        _725 = true;
    }
    else
    {
        _723 = _179;
    }
    _725 = false;
    float _727 = _723;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _731 = _727 + _729;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _735 = _733 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _739 = _737 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _741 = _727 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _743 = isnan(_727);
    bool _745 = _741 || _743;
    bool _747 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _749 = _745 || _747;
    float _751 = float(_749);
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _755 = _753 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _757 = _727 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _759 = isnan(_727);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _765 = _761 || _763;
    float _767 = float(_765);
    float _769 = 1.0 / _735;
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _773 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _771;
    float _775 = -_751;
    float _777 = _775 + 1.0;
    bool _779 = _727 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _781 = isnan(_727);
    bool _783 = _779 || _781;
    bool _785 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _787 = _783 || _785;
    float _789 = float(_787);
    bool _791 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _793 = 1.0 / _739;
    float _795 = 1.0 / _755;
    float _797 = _773 * _769;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _801 = _799 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _803 = _767 * _777;
    float _805 = -_767;
    float _807 = _805 + 1.0;
    float _809 = fma(_797, _731, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _811 = _727 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _813 = isnan(_727);
    bool _815 = _811 || _813;
    bool _817 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _819 = _815 || _817;
    float _821 = float(_819);
    float _823 = _789 * _807;
    float _825 = _801 * _793;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _827;
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _833 = _727 + _831;
    float _835 = _809 * _823;
    float _837 = -_789;
    float _839 = _837 + 1.0;
    float _841 = -_821;
    float _843 = _841 + 1.0;
    float _845 = fma(_825, _833, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _847 = _829 * _795;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _851 = _727 + _849;
    float _853 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[131].x, _835);
    float _855 = _751 * _843;
    float _857 = fma(_847, _851, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _859 = fma(_845, _803, _853);
    float _861 = fma(_857, _855, _859);
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _869 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[134].x, _861);
    float _871 = _863 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _873 = _865 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _875 = _867 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _877 = _869 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_82.x = _871;
    out.m_82.y = _873;
    out.m_82.z = _875;
    out.m_82.w = _877;
    bool _879 = !_791;
    float _881 = _873;
    float _883 = _877;
    if (!_879)
    {
        float _885 = in.m_76.x;
        float _887 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _889 = _885 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _891 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[14].x, _135);
        float _893 = _891 * _887;
        float _895 = floor(_893);
        float _897 = -_895;
        float _899 = _893 + _897;
        _181 = _899;
    }
    float _901 = _181;
    float _903 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _905 = int(_903);
    int _907 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _909 = _907 != 0;
    float _911 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _913 = int(_911);
    float _915 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _917 = int(_915);
    float _919 = float(_905);
    float _921 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _923 = int(_921);
    float _925 = float(_913);
    float _927 = 1.0 / _919;
    float _929 = float(_917);
    float _931 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _933 = int(_931);
    float _935 = float(uint(_923));
    float _937 = 1.0 / _925;
    float _939 = _927 * _135;
    float _941 = _927;
    if (_909)
    {
        float _943 = in.m_76.w;
        _941 = _943;
    }
    float _945 = _941;
    float _947 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _949 = int(_947);
    float _951 = float(uint(_933));
    int _953 = ~_933;
    int _955 = _953 + 1;
    float _957 = 1.0 / _929;
    float _959 = _937 * _135;
    float _961 = 1.0 / _935;
    float _963 = float(uint(_949));
    int _965 = ~_949;
    int _967 = _965 + 1;
    float _969 = _945;
    if (_909)
    {
        float _971 = _945 * 3.1415927410125732421875;
        _969 = _971;
    }
    float _973 = _969;
    float _975 = trunc(_939);
    int _977 = int(_975);
    float _979 = _957 * _135;
    if (_909)
    {
        float _981 = _973 * 0.15915493667125701904296875;
        _881 = _981;
    }
    float _983 = _881;
    float _985 = 1.0 / _951;
    int _987 = as_type<int>(_961) + (-2);
    int _989 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _991 = _989 != 0;
    float _993 = trunc(_959);
    int _995 = int(_993);
    float _997 = float(uint(_977));
    int _999 = ~_923;
    int _1001 = _999 + 1;
    float _1003 = as_type<float>(_987) * _997;
    float _1005 = 1.0 / _963;
    int _1007 = as_type<int>(_985) + (-2);
    if (_991)
    {
        _883 = 1.0;
    }
    float _1009 = _883;
    float _1011 = 0.0;
    float _1013 = _1009;
    if (_991)
    {
        _1011 = 1.0;
    }
    float _1015 = _1011;
    float _1017 = trunc(_979);
    int _1019 = int(_1017);
    float _1021 = float(uint(_995));
    int _1023 = 0;
    float _1025 = _1015;
    if (_991)
    {
        _1023 = 0;
    }
    int _1027 = _1023;
    float _1029 = as_type<float>(_1007) * _1021;
    int _1031 = as_type<int>(_1005) + (-2);
    float _1033 = trunc(_1003);
    float _1035 = precise::max(_1033, 0.0);
    uint _1038 = uint(_1035);
    float _1040 = float(uint(_1019));
    float _1042 = trunc(_1029);
    float _1044 = precise::max(_1042, 0.0);
    uint _1046 = uint(_1044);
    float _1048 = as_type<float>(_1031) * _1040;
    float _1050 = trunc(_1048);
    float _1052 = precise::max(_1050, 0.0);
    uint _1054 = uint(_1052);
    int _1056 = _1001 * int(_1038);
    int _1058 = _1056 + _977;
    float _1060 = float(uint(_1058));
    float _1062 = _983;
    int _1064 = _1027;
    if (_909)
    {
        float _1066 = _983 * 6.283185482025146484375;
        float _1068 = sin(_1066);
        _1062 = _1068;
    }
    float _1070 = _1062;
    float _1072 = _973;
    float _1074 = _1048;
    if (_991)
    {
        float _1076 = in.m_76.x;
        float _1078 = in.m_76.y;
        _1072 = _1076;
        _1074 = _1078;
    }
    float _1080 = _1072;
    float _1082 = _1074;
    int _1084 = _955 * int(_1046);
    int _1086 = _1084 + _995;
    float _1088 = as_type<float>(_987) * _1060;
    float _1090 = in.m_76.z;
    float _1092 = in.m_76.w;
    float _1094 = float(uint(_1086));
    int _1096 = _967 * int(_1054);
    int _1098 = _1096 + _1019;
    float _1100 = trunc(_1088);
    float _1102 = precise::max(_1100, 0.0);
    uint _1104 = uint(_1102);
    float _1106 = as_type<float>(_1007) * _1094;
    float _1108 = float(uint(_1098));
    float _1110 = as_type<float>(_1031) * _1108;
    float _1112 = trunc(_1106);
    float _1114 = precise::max(_1112, 0.0);
    uint _1116 = uint(_1114);
    int _1118 = as_type<int>(_1108);
    float _1120 = _1094;
    float _1122 = _1088;
    if (_991)
    {
        _1118 = 0;
    }
    int _1124 = _1118;
    float _1126 = _1080;
    float _1128 = _1082;
    int _1130 = _1124;
    if (_991)
    {
        _1120 = _1080;
    }
    float _1132 = _1120;
    float _1134 = trunc(_1110);
    float _1136 = precise::max(_1134, 0.0);
    uint _1138 = uint(_1136);
    float _1140 = 0.0;
    float _1142 = _1132;
    if (_991)
    {
        _1140 = _1082;
    }
    float _1144 = _1140;
    float _1146 = 0.0;
    float _1148 = _1144;
    if (_991)
    {
        _1146 = _1132;
    }
    float _1150 = _1146;
    float _1152 = _1150;
    if (_991)
    {
        _1122 = _1132;
    }
    float _1154 = _1122;
    float _1156 = _1154;
    if (!_991)
    {
        float _1158 = in.m_76.x;
        float _1160 = in.m_76.y;
        float _1162 = in.m_76.z;
        float _1164 = _1158 * 3.1415927410125732421875;
        float _1166 = _1164 * 0.15915493667125701904296875;
        float _1168 = _1160 * 3.1415927410125732421875;
        float _1170 = _1168 * 0.15915493667125701904296875;
        float _1172 = _1166 * 6.283185482025146484375;
        float _1174 = sin(_1172);
        float _1176 = _1170 * 6.283185482025146484375;
        float _1178 = sin(_1176);
        _1025 = 5.839270114898681640625;
        _1156 = _1162;
        _1013 = 7.345489978790283203125;
        _1126 = _1158;
        _1128 = _1160;
        _1142 = _1160;
        _1130 = 1;
        _1152 = _1174;
        _1064 = 2;
        _1148 = _1178;
    }
    float _1180 = _1025;
    float _1182 = _1156;
    float _1184 = _1013;
    float _1186 = _1126;
    float _1188 = _1128;
    float _1190 = _1142;
    int _1192 = _1130;
    float _1194 = _1152;
    int _1196 = _1064;
    float _1198 = _1148;
    float _1200 = _1180 * _1182;
    int _1202 = ~_923;
    int _1204 = _1202 + 1;
    float _1206 = _1184 * _1186;
    int _1208 = int(_1038) + int(_1104);
    float _1210 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1212 = _901 + _1210;
    int _1214 = ~_949;
    int _1216 = _1214 + 1;
    float _1218 = floor(_1206);
    int _1220 = int(_1054) + int(_1138);
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1224 = _901 + _1222;
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1228 = _901 + _1226;
    float _1230 = in.m_70.w;
    int _1232 = ~_933;
    int _1234 = _1232 + 1;
    float _1236 = floor(_1200);
    int _1238 = int(_1046) + int(_1116);
    int _1240 = _1204 * _1208;
    int _1242 = _1240 + _977;
    bool _1244 = _1092 > 0.5;
    int _1246 = _1216 * _1220;
    int _1248 = _1246 + _1019;
    bool _1250 = uint(_1242) >= uint(_923);
    float _1252 = -_1218;
    float _1254 = _1206 + _1252;
    bool _1256 = uint(_1248) >= uint(_949);
    int _1258 = _1234 * _1238;
    int _1260 = _1258 + _995;
    float _1262 = _1230;
    if (_909)
    {
        bool _1264 = _1070 > 0.5;
        _251 = _1264;
    }
    bool _1266 = _251;
    bool _1268 = !_1256;
    int _1270 = _1268 ? 0 : (-1);
    bool _1272 = !_1250;
    int _1274 = _1272 ? 0 : (-1);
    float _1276 = -_1236;
    float _1278 = _1200 + _1276;
    bool _1280 = _1090 > 0.5;
    int _1282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1284 = _1282 != 0;
    float _1286 = -_229;
    int _1288 = _1244 ? as_type<int>(_1286) : as_type<int>(_229);
    bool _1290 = uint(_1260) >= uint(_933);
    float _1292 = float(_923);
    bool _1294 = _1188 > 0.5;
    float _1296 = 0.0;
    if (!_909)
    {
        _1296 = _225;
    }
    float _1298 = _1296;
    float _1300 = _1254 * _1292;
    float _1302 = -_229;
    int _1304 = _1280 ? as_type<int>(_1302) : as_type<int>(_229);
    bool _1306 = !_1284;
    int _1308 = _1306 ? 0 : 1;
    float _1310 = _1298;
    if (_909)
    {
        float _1312 = -_225;
        float _1314 = _1266 ? _1312 : _225;
        _1310 = _1314;
    }
    float _1316 = _1310;
    float _1318 = trunc(_1300);
    int _1320 = int(_1318);
    int _1322 = ~_1220;
    int _1324 = _1322 + _1270;
    int _1326 = _1324 + 1;
    int _1328 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1330 = _1328 != 0;
    int _1332 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1334 = _1332 != 0;
    int _1336 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1338 = _1336 != 0;
    float _1340 = -_225;
    int _1342 = _1294 ? as_type<int>(_1340) : as_type<int>(_225);
    int _1344 = _949 * _1326;
    int _1346 = _1344 + _1019;
    int _1348 = ~_1208;
    int _1350 = _1348 + _1274;
    int _1352 = _1350 + 1;
    float _1354 = float(_977);
    int _1356 = _923 * _1352;
    int _1358 = _1356 + _977;
    float _1360 = float(_949);
    int _1362 = abs(_1308);
    bool _1364 = !_1338;
    float _1366 = _1364 ? _229 : as_type<float>(_1304);
    float _1368 = _1278 * _1360;
    bool _1370 = !_1334;
    float _1372 = _1370 ? _225 : as_type<float>(_1342);
    float _1374 = float(_1019);
    int _1376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1378 = _1376 != 0;
    int _1380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1382 = _1380 != 0;
    int _1384 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1386 = _1384 != 0;
    float _1388 = trunc(_1368);
    int _1390 = int(_1388);
    bool _1392 = _1354 >= _1292;
    bool _1394 = isnan(_1354);
    bool _1396 = _1392 || _1394;
    bool _1398 = isnan(_1292);
    bool _1400 = _1396 || _1398;
    float _1402 = float(_1400);
    int _1404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1406 = _1404 != 0;
    bool _1408 = _1374 >= _1360;
    bool _1410 = isnan(_1374);
    bool _1412 = _1408 || _1410;
    bool _1414 = isnan(_1360);
    bool _1416 = _1412 || _1414;
    float _1418 = float(_1416);
    bool _1420 = !_1382;
    int _1422 = _1420 ? 0 : 1;
    float _1424 = trunc(_1402);
    int _1426 = int(_1424);
    bool _1428 = !_1378;
    int _1430 = _1428 ? 0 : 1;
    bool _1432 = !_1386;
    int _1434 = _1432 ? 0 : 1;
    int _1436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1438 = _1436 != 0;
    int _1440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1442 = _1440 != 0;
    int _1444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1446 = _1444 != 0;
    bool _1448 = !_1406;
    int _1450 = _1448 ? 0 : 1;
    float _1452 = trunc(_1418);
    int _1454 = int(_1452);
    int _1456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1458 = _1456 != 0;
    bool _1460 = !_1442;
    int _1462 = _1460 ? 0 : 1;
    int _1464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1466 = _1464 != 0;
    int _1468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1470 = _1468 != 0;
    bool _1472 = !_1330;
    float _1474 = _1472 ? _229 : as_type<float>(_1288);
    int _1476 = _1320 * _1362;
    int _1478 = _1476 + _977;
    bool _1480 = !_1458;
    int _1482 = _1480 ? 0 : 1;
    float _1484 = _175 * _135;
    bool _1486 = !_1466;
    int _1488 = _1486 ? 0 : 1;
    bool _1490 = !_1290;
    int _1492 = _1490 ? 0 : (-1);
    float _1494 = _1292 * _1484;
    int _1496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1498 = _1496 != 0;
    int _1500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1502 = _1500 != 0;
    int _1504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1506 = _1504 != 0;
    int _1508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1510 = _1508 != 0;
    float _1512 = _1360 * _1484;
    bool _1514 = !_1438;
    int _1516 = _1514 ? 0 : 1;
    float _1518 = trunc(_1494);
    int _1520 = int(_1518);
    bool _1522 = _923 == 0;
    int _1524 = abs(_1482);
    bool _1526 = !_1502;
    int _1528 = _1526 ? 0 : 1;
    bool _1530 = _949 == 0;
    int _1532 = _1390 * _1524;
    int _1534 = _1532 + _1019;
    int _1536 = ~_1426;
    int _1538 = _1536 + 1;
    int _1540 = _1538 + 1;
    float _1542 = trunc(_1512);
    int _1544 = int(_1542);
    bool _1546 = !_1522;
    int _1548 = _1546 ? _1358 : (-1);
    int _1550 = ~_1454;
    int _1552 = _1550 + 1;
    int _1554 = _1552 + 1;
    bool _1556 = !_1530;
    int _1558 = _1556 ? _1346 : (-1);
    int _1560 = _1548 * _1540;
    int _1562 = _923 + (-1);
    int _1564 = abs(_1422);
    int _1566 = _1558 * _1554;
    int _1568 = _949 + (-1);
    int _1570 = _1426 * _1562;
    int _1572 = _1570 + _1560;
    int _1574 = abs(_1430);
    int _1576 = _1454 * _1568;
    int _1578 = _1576 + _1566;
    int _1580 = abs(_1434);
    int _1582 = _1572 * _1564;
    int _1584 = abs(_1462);
    int _1586 = _1520 * _1574;
    int _1588 = _1586 + _1582;
    int _1590 = abs(_1450);
    bool _1592 = !_1446;
    int _1594 = _1592 ? 0 : 1;
    int _1596 = _1478 * _1580;
    int _1598 = _1596 + _1588;
    int _1600 = abs(_1516);
    int _1602 = _1320 * _1590;
    int _1604 = _1602 + _1598;
    int _1606 = abs(_1594);
    int _1608 = _1578 * _1584;
    float _1610 = float(uint(_1604));
    int _1612 = abs(_1488);
    int _1614 = _1544 * _1600;
    int _1616 = _1614 + _1608;
    float _1618 = float(_933);
    float _1620 = as_type<float>(_987) * _1610;
    float _1622 = float(_995);
    int _1624 = _1534 * _1606;
    int _1626 = _1624 + _1616;
    int _1628 = ~_923;
    int _1630 = _1628 + 1;
    bool _1632 = _1622 >= _1618;
    bool _1634 = isnan(_1622);
    bool _1636 = _1632 || _1634;
    bool _1638 = isnan(_1618);
    bool _1640 = _1636 || _1638;
    float _1642 = float(_1640);
    int _1644 = _1390 * _1612;
    int _1646 = _1644 + _1626;
    float _1648 = trunc(_1620);
    float _1650 = precise::max(_1648, 0.0);
    uint _1652 = uint(_1650);
    float _1654 = _1184 * _1190;
    float _1656 = _1618 * _1484;
    int _1658 = ~_1238;
    int _1660 = _1658 + _1492;
    int _1662 = _1660 + 1;
    float _1664 = float(uint(_1646));
    int _1666 = ~_949;
    int _1668 = _1666 + 1;
    float _1670 = floor(_1654);
    int _1672 = _933 * _1662;
    int _1674 = _1672 + _995;
    float _1676 = as_type<float>(_1031) * _1664;
    bool _1678 = !_1470;
    int _1680 = _1678 ? 0 : 1;
    int _1682 = abs(_1528);
    int _1684 = abs(_1680);
    float _1686 = trunc(_1676);
    float _1688 = precise::max(_1686, 0.0);
    uint _1690 = uint(_1688);
    int _1692 = _1630 * int(_1652);
    int _1694 = _1692 + _1604;
    bool _1696 = _1090 > 0.5;
    int _1698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1700 = _1698 != 0;
    float _1702 = float(uint(_1694));
    float _1704 = trunc(_1642);
    int _1706 = int(_1704);
    bool _1708 = !_1498;
    int _1710 = _1708 ? 0 : 1;
    float _1712 = -_1670;
    float _1714 = _1654 + _1712;
    bool _1716 = _933 == 0;
    float _1718 = as_type<float>(_987) * _1702;
    int _1720 = abs(_1710);
    float _1722 = _1714 * _1618;
    bool _1724 = !_1716;
    int _1726 = _1724 ? _1674 : (-1);
    int _1728 = _1668 * int(_1690);
    int _1730 = _1728 + _1646;
    float _1732 = trunc(_1718);
    float _1734 = precise::max(_1732, 0.0);
    uint _1736 = uint(_1734);
    int _1738 = _933 + (-1);
    float _1740 = float(uint(_1730));
    int _1742 = ~_1706;
    int _1744 = _1742 + 1;
    int _1746 = _1744 + 1;
    float _1748 = trunc(_1656);
    int _1750 = int(_1748);
    float _1752 = as_type<float>(_1031) * _1740;
    int _1754 = _1726 * _1746;
    bool _1756 = !_1506;
    int _1758 = _1756 ? 0 : 1;
    float _1760 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1762 = _1760 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _1764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1766 = _1764 != 0;
    float _1768 = trunc(_1722);
    int _1770 = int(_1768);
    int _1772 = _1706 * _1738;
    int _1774 = _1772 + _1754;
    int _1776 = ~_923;
    int _1778 = _1776 + 1;
    float _1780 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1782 = _1780 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _1784 = int(_1652) + int(_1736);
    int _1786 = _1774 * _1682;
    int _1788 = abs(_1758);
    float _1790 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1792 = _1790 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1794 = trunc(_1752);
    float _1796 = precise::max(_1794, 0.0);
    uint _1798 = uint(_1796);
    int _1800 = _1750 * _1720;
    int _1802 = _1800 + _1786;
    int _1804 = ~_949;
    int _1806 = _1804 + 1;
    int _1808 = _1778 * _1784;
    int _1810 = _1808 + _1604;
    float _1812 = as_type<float>(_1758);
    float _1814 = as_type<float>(_1580);
    float _1816 = _1316;
    if (_1766)
    {
        float _1818 = in.m_76.x;
        _1812 = _1818;
    }
    float _1820 = _1812;
    int _1822 = ~_933;
    int _1824 = _1822 + 1;
    int _1826 = _1770 * _1684;
    int _1828 = _1826 + _995;
    bool _1830 = !_1510;
    int _1832 = _1830 ? 0 : 1;
    float _1834 = 1.0 / _1762;
    bool _1836 = uint(_1810) >= uint(_923);
    int _1838 = _1828 * _1788;
    int _1840 = _1838 + _1802;
    int _1842 = abs(_1832);
    bool _1844 = !_1836;
    int _1846 = _1844 ? 0 : (-1);
    int _1848 = int(_1690) + int(_1798);
    float _1850 = 1.0 / _1782;
    float _1852 = float(uint(_1478));
    int _1854 = _1806 * _1848;
    int _1856 = _1854 + _1646;
    int _1858 = ~_1784;
    int _1860 = _1858 + _1846;
    int _1862 = _1860 + 1;
    int _1864 = _1770 * _1842;
    int _1866 = _1864 + _1840;
    float _1868 = float(uint(_1534));
    float _1870 = as_type<float>(_987) * _1852;
    bool _1872 = uint(_1856) >= uint(_949);
    int _1874 = _923 * _1862;
    int _1876 = _1874 + _1604;
    float _1878 = -_225;
    int _1880 = _1696 ? as_type<int>(_1878) : as_type<int>(_225);
    float _1882 = trunc(_1870);
    float _1884 = precise::max(_1882, 0.0);
    uint _1886 = uint(_1884);
    float _1888 = as_type<float>(_1031) * _1868;
    float _1890 = float(uint(_1866));
    bool _1892 = !_1522;
    int _1894 = _1892 ? _1876 : (-1);
    float _1896 = as_type<float>(_1876);
    if (_1766)
    {
        float _1898 = _1820 * 3.1415927410125732421875;
        _1896 = _1898;
    }
    float _1900 = _1896;
    bool _1902 = !_1700;
    float _1904 = _1902 ? _225 : as_type<float>(_1880);
    float _1906 = as_type<float>(_1007) * _1890;
    float _1908 = trunc(_1888);
    float _1910 = precise::max(_1908, 0.0);
    uint _1912 = uint(_1910);
    int _1914 = _1894 & 3;
    bool _1916 = _1914 != 0;
    float _1918 = _1900;
    if (_1766)
    {
        float _1920 = _1900 * 0.15915493667125701904296875;
        _1918 = _1920;
    }
    float _1922 = _1918;
    int _1924 = ~_923;
    int _1926 = _1924 + 1;
    int _1928 = _1916 ? 0 : 1;
    int _1930 = _1894 & 3;
    bool _1932 = _1930 != 0;
    float _1934 = _1922;
    if (_1766)
    {
        float _1936 = _1922 * 6.283185482025146484375;
        float _1938 = sin(_1936);
        _1934 = _1938;
    }
    float _1940 = _1934;
    bool _1942 = !_1872;
    int _1944 = _1942 ? 0 : (-1);
    int _1946 = _1926 * int(_1886);
    int _1948 = _1946 + _1478;
    bool _1950 = uint(_1930) > 1u;
    int _1952 = ~_949;
    int _1954 = _1952 + 1;
    float _1956 = float(uint(_1948));
    float _1958 = trunc(_1906);
    float _1960 = precise::max(_1958, 0.0);
    uint _1962 = uint(_1960);
    int _1964 = ~_1848;
    int _1966 = _1964 + _1944;
    int _1968 = _1966 + 1;
    int _1970 = _1954 * int(_1912);
    int _1972 = _1970 + _1534;
    bool _1974 = _1950;
    if (!_1766)
    {
        _1814 = _229;
    }
    float _1976 = _1814;
    float _1978 = as_type<float>(_987) * _1956;
    int _1980 = ~_1928;
    int _1982 = _1980 + 1;
    int _1984 = _1982 + 1;
    float _1986 = float(uint(_1972));
    float _1988 = 1.0 / _1792;
    int _1990 = _1984;
    float _1992 = _1976;
    if (!_1950)
    {
        int _1994 = ~_1928;
        int _1996 = _1994 + 1;
        _1990 = _1996;
    }
    int _1998 = _1990;
    if (_1766)
    {
        bool _2000 = _1940 > 0.5;
        _1974 = _2000;
    }
    bool _2002 = _1974;
    float _2004 = as_type<float>(_1031) * _1986;
    int _2006 = _949 * _1968;
    int _2008 = _2006 + _1646;
    bool _2010 = _1188 > 0.5;
    int _2012 = _1824 * int(_1962);
    int _2014 = _2012 + _1866;
    if (_1766)
    {
        float _2016 = -_229;
        float _2018 = _2002 ? _2016 : _229;
        _1992 = _2018;
    }
    float _2020 = _1992;
    float _2022 = trunc(_1978);
    float _2024 = precise::max(_2022, 0.0);
    uint _2026 = uint(_2024);
    bool _2028 = _1930 != 3;
    bool _2030 = uint(_1930) >= 2u;
    float _2032 = float(uint(_2014));
    bool _2034 = !_1530;
    int _2036 = _2034 ? _2008 : (-1);
    float _2038 = trunc(_2004);
    float _2040 = precise::max(_2038, 0.0);
    uint _2042 = uint(_2040);
    float _2044 = as_type<float>(_1007) * _2032;
    int _2046 = _2030 ? 0 : 1;
    float _2048 = -_229;
    int _2050 = _2010 ? as_type<int>(_2048) : as_type<int>(_229);
    int _2052 = _2036 & 3;
    bool _2054 = _2052 != 0;
    float _2056 = trunc(_2044);
    float _2058 = precise::max(_2056, 0.0);
    uint _2060 = uint(_2058);
    int _2062 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2064 = _2062 != 0;
    int _2066 = ~_2046;
    int _2068 = _2066 + 1;
    int _2070 = _2068 + 1;
    int _2072 = _2070;
    if (_2028)
    {
        int _2074 = ~_2046;
        int _2076 = _2074 + 1;
        _2072 = _2076;
    }
    int _2078 = _2072;
    bool _2080 = uint(_2052) > 1u;
    int _2082 = int(_1886) + int(_2026);
    bool _2084 = !_2064;
    float _2086 = _2084 ? _229 : as_type<float>(_2050);
    int _2088 = ~_923;
    int _2090 = _2088 + 1;
    int _2092 = _2036 & 3;
    bool _2094 = _2092 != 0;
    int _2096 = int(_1912) + int(_2042);
    int _2098 = _2090 * _2082;
    int _2100 = _2098 + _1478;
    int _2102 = _2094 ? 0 : 1;
    int _2104 = ~_949;
    int _2106 = _2104 + 1;
    int _2108 = ~_2102;
    int _2110 = _2108 + 1;
    int _2112 = _2110 + 1;
    int _2114 = _2112;
    if (!_2080)
    {
        int _2116 = ~_2102;
        int _2118 = _2116 + 1;
        _2114 = _2118;
    }
    int _2120 = _2114;
    int _2122 = _2106 * _2096;
    int _2124 = _2122 + _1534;
    bool _2126 = uint(_2100) >= uint(_923);
    int _2128 = int(_1962) + int(_2060);
    bool _2130 = !_2126;
    int _2132 = _2130 ? 0 : (-1);
    bool _2134 = uint(_2124) >= uint(_949);
    float _2136 = in.m_56.x;
    float _2138 = in.m_56.y;
    float _2140 = in.m_56.z;
    bool _2142 = _2052 != 3;
    float _2144 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2146 = _2144 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _2148 = ~_933;
    int _2150 = _2148 + 1;
    float _2152 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2154 = _2152 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2156 = !_1932;
    int _2158 = _2156 ? 0 : 1;
    bool _2160 = uint(_2052) >= 2u;
    float _2162 = 1.0 / _2146;
    int _2164 = _2150 * _2128;
    int _2166 = _2164 + _1866;
    bool _2168 = !_2054;
    int _2170 = _2168 ? 0 : 1;
    int _2172 = _2160 ? 0 : 1;
    bool _2174 = _2052 != 3;
    float _2176 = 1.0 / _2154;
    bool _2178 = uint(_2166) >= uint(_933);
    int _2180 = ~_2172;
    int _2182 = _2180 + 1;
    int _2184 = _2182 + 1;
    float _2186 = _197 * _2138;
    float _2188 = _203 * _2138;
    float _2190 = _209 * _2138;
    int _2192 = _2184;
    if (_2142)
    {
        int _2194 = ~_2172;
        int _2196 = _2194 + 1;
        _2192 = _2196;
    }
    int _2198 = _2192;
    float _2200 = fma(_195, _2136, _2186);
    float _2202 = fma(_201, _2136, _2188);
    float _2204 = fma(_207, _2136, _2190);
    float _2206 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2208 = _2206 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2210 = fma(_199, _2140, _2200);
    float _2212 = fma(_211, _2140, _2204);
    float _2214 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2216 = _2214 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2218 = fma(_205, _2140, _2202);
    float _2220 = 1.0 / _2208;
    float _2222 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2224 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2222;
    float _2226 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2228 = _2226 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2230 = in.m_72.w;
    float _2232 = _2224 * _1834;
    float _2234 = _2228 * _1850;
    float _2236 = 1.0 / _2216;
    float _2238 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2240 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2238;
    float _2242 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2244 = _2242 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _2246 = _901 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2248 = isnan(_901);
    bool _2250 = _2246 || _2248;
    bool _2252 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2254 = _2250 || _2252;
    float _2256 = float(_2254);
    float _2258 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2260 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2258;
    float _2262 = _2244 * _1988;
    bool _2264 = _901 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2266 = isnan(_901);
    bool _2268 = _2264 || _2266;
    bool _2270 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2272 = _2268 || _2270;
    float _2274 = float(_2272);
    float _2276 = _2260 * _2220;
    float _2278 = -_2256;
    float _2280 = _2278 + 1.0;
    float _2282 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2284 = _2282 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2286 = _901 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2288 = isnan(_901);
    bool _2290 = _2286 || _2288;
    bool _2292 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2294 = _2290 || _2292;
    float _2296 = float(_2294);
    float _2298 = -_2274;
    float _2300 = _2298 + 1.0;
    float _2302 = _2274 * _2280;
    float _2304 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2306 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2304;
    bool _2308 = _901 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2310 = isnan(_901);
    bool _2312 = _2308 || _2310;
    bool _2314 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2316 = _2312 || _2314;
    float _2318 = float(_2316);
    float _2320 = _2284 * _2236;
    float _2322 = _2296 * _2300;
    float _2324 = -_2296;
    float _2326 = _2324 + 1.0;
    bool _2328 = !_2174;
    int _2330 = _2328 ? 0 : (-1);
    float _2332 = _2306 * _2162;
    bool _2334 = !_2134;
    int _2336 = _2334 ? 0 : (-1);
    float _2338 = _2318 * _2326;
    int _2340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2342 = _2340 != 0;
    float _2344 = _2240 * _2176;
    int _2346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2348 = _2346 != 0;
    float _2350 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2352 = _901 + _2350;
    int _2354 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2356 = _2354 != 0;
    float _2358 = -_2318;
    float _2360 = _2358 + 1.0;
    bool _2362 = !_2178;
    int _2364 = _2362 ? 0 : (-1);
    float _2366 = fma(_2232, _2352, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2368 = _1186 > 0.5;
    float _2370 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2372 = _901 + _2370;
    bool _2374 = _901 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2376 = isnan(_901);
    bool _2378 = _2374 || _2376;
    bool _2380 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2382 = _2378 || _2380;
    float _2384 = float(_2382);
    float _2386 = fma(_2344, _1212, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2388 = fma(_2234, _2372, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _2390 = _901 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2392 = isnan(_901);
    bool _2394 = _2390 || _2392;
    bool _2396 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2398 = _2394 || _2396;
    float _2400 = float(_2398);
    float _2402 = _2384 * _2360;
    float _2404 = -_225;
    int _2406 = _2368 ? as_type<int>(_2404) : as_type<int>(_225);
    float _2408 = -_2384;
    float _2410 = _2408 + 1.0;
    int _2412 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2414 = _2412 != 0;
    float _2416 = -_2400;
    float _2418 = _2416 + 1.0;
    bool _2420 = _901 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2422 = isnan(_901);
    bool _2424 = _2420 || _2422;
    bool _2426 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2428 = _2424 || _2426;
    float _2430 = float(_2428);
    float _2432 = _2400 * _2410;
    bool _2434 = _901 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2436 = isnan(_901);
    bool _2438 = _2434 || _2436;
    bool _2440 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2442 = _2438 || _2440;
    float _2444 = float(_2442);
    float _2446 = in.m_74.w;
    float _2448 = _2218 + _2230;
    float _2450 = _2430 * _2418;
    float _2452 = -_2430;
    float _2454 = _2452 + 1.0;
    float _2456 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2458 = _901 + _2456;
    float _2460 = _2210 + _1230;
    float _2462 = _2444 * _2454;
    float _2464 = fma(_2276, _2458, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2466 = fma(_2262, _1224, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2468 = _2366 * _2462;
    float _2470 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2472 = _901 + _2470;
    bool _2474 = !_2414;
    float _2476 = _2474 ? _225 : as_type<float>(_2406);
    float _2478 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    bool _2480 = _1192 != 1;
    float _2482 = -_2444;
    float _2484 = _2482 + 1.0;
    float _2486 = fma(_2320, _2472, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2488 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2490 = fma(_2484, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2468);
    float _2492 = fma(_2332, _1228, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2494 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2496 = fma(_2388, _2450, _2490);
    float _2498 = _1186 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2500 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2502 = _2212 + _2446;
    float _2504 = _2472;
    float _2506 = _2458;
    float _2508 = _2490;
    float _2510 = _2444;
    float _2512 = _2446;
    if (!_2480)
    {
        _2504 = _1188;
    }
    float _2514 = _2504;
    float _2516 = -_2494;
    float _2518 = fma(_2498, 2.0, _2516);
    float _2520 = _2514;
    if (!_2480)
    {
        _2506 = _1188;
    }
    float _2522 = _2506;
    float _2524 = _1194 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2526 = _2522;
    if (!_2480)
    {
        _2508 = _1090;
    }
    float _2528 = _2508;
    float _2530 = _2020 + (-0.5);
    float _2532 = _2528;
    if (!_2480)
    {
        _2510 = _1090;
    }
    float _2534 = _2510;
    float _2536 = -_135;
    float _2538 = fma(_2536, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2518);
    float _2540 = _2534;
    if (_2480)
    {
        _2520 = _1186;
    }
    float _2542 = _2520;
    if (_2480)
    {
        _2526 = _1186;
    }
    float _2544 = _2526;
    if (_2480)
    {
        _2532 = _1188;
    }
    float _2546 = _2532;
    float _2548 = _2542 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_2480)
    {
        _2540 = _1188;
    }
    float _2550 = _2540;
    bool _2552 = _1196 != 2;
    float _2554 = fma(_2386, _2432, _2496);
    float _2556 = _1188 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2558 = fma(_2556, -2.0, _2500);
    float _2560 = fma(_2466, _2402, _2554);
    float _2562 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2564 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2566 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2568 = _2448 + _2566;
    float _2570 = fma(_1194, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2562);
    float _2572 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2574 = _2460 + _2572;
    float _2576 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2564);
    float _2578 = _1198 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2580 = _2568 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2582 = -_2478;
    float _2584 = fma(_2524, 2.0, _2582);
    float _2586 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2588 = _2502 + _2586;
    float _2590 = fma(_2578, -2.0, _2488);
    float _2592 = fma(_2574, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2580);
    if (_2552)
    {
        _1262 = _1188;
    }
    float _2594 = _1262;
    float _2596 = fma(_2464, _2338, _2560);
    float _2598 = _2594;
    if (_2552)
    {
        _2512 = _1186;
    }
    float _2600 = _2512;
    float _2602 = fma(_2588, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2592);
    float _2604 = _2600;
    if (!_2552)
    {
        _2604 = _1090;
    }
    float _2606 = _2604;
    float _2608 = -_135;
    float _2610 = fma(_2608, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2584);
    if (!_2552)
    {
        _2598 = _1186;
    }
    float _2612 = _2598;
    float _2614 = _1316 + 0.5;
    bool _2616 = _2602 >= 0.0;
    float _2618 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2620 = fma(_2614, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2610);
    float _2622 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2590);
    float _2624 = fma(_2544, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2618);
    int _2626 = _2036 >> 31;
    float _2628 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2630 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2558);
    float _2632 = -_2530;
    float _2634 = -_2622;
    float _2636 = fma(_2632, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2634);
    int _2638 = _2626 & 3;
    float _2640 = fma(_2550, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2628);
    float _2642 = _2086 + (-0.5);
    float _2644 = fma(_2486, _2322, _2596);
    int _2646 = _2036 + _2638;
    float _2648 = _2546 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2650 = float(uint(_1828));
    float _2652 = -_2642;
    float _2654 = -_2630;
    float _2656 = fma(_2652, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2654);
    int _2658 = _2646 >> 2;
    float _2660 = _2606 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2662 = as_type<float>(_1007) * _2650;
    int _2664 = _2658 << 4;
    int _2666 = _2664 + 656;
    float _2668 = fma(_2492, _2302, _2644);
    float _2670 = _2476 + 0.5;
    float _2672 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    uint _2674 = uint(int(uint(_2666) >> uint(2)));
    uint _2676 = uint(int(uint(int(_2674)) >> uint(2)));
    int _2678 = int(_2674) & 3;
    float _2680 = (*spvDescriptorSet0.vp_c9)._m0[int(_2676)][_2678];
    int _2682 = int(_2674) + 1;
    uint _2684 = uint(int(uint(_2682) >> uint(2)));
    int _2686 = _2682 & 3;
    float _2688 = (*spvDescriptorSet0.vp_c9)._m0[int(_2684)][_2686];
    float _2690 = trunc(_2662);
    float _2692 = precise::max(_2690, 0.0);
    uint _2694 = uint(_2692);
    float _2696 = -_2672;
    float _2698 = fma(_2660, 2.0, _2696);
    float _2700 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2576);
    float _2702 = fma(_2670, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2538);
    int _2704 = ~_933;
    int _2706 = _2704 + 1;
    float _2708 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _2710 = _2666 + 8;
    uint _2712 = uint(int(uint(_2710) >> uint(2)));
    uint _2714 = uint(int(uint(int(_2712)) >> uint(2)));
    int _2716 = int(_2712) & 3;
    float _2718 = (*spvDescriptorSet0.vp_c9)._m0[int(_2714)][_2716];
    int _2720 = int(_2712) + 1;
    uint _2722 = uint(int(uint(_2720) >> uint(2)));
    int _2724 = _2720 & 3;
    float _2726 = (*spvDescriptorSet0.vp_c9)._m0[int(_2722)][_2724];
    float _2728 = _2612 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2730 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2732 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2570);
    float _2734 = fma(_2728, -2.0, _2708);
    int _2736 = abs(_2120);
    float _2738 = -_135;
    float _2740 = fma(_2738, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2698);
    float _2742 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2744 = _2706 * int(_2694);
    int _2746 = _2744 + _1828;
    int _2748 = ~_2128;
    int _2750 = _2748 + _2364;
    int _2752 = _2750 + 1;
    float _2754 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2756 = -_2742;
    float _2758 = fma(_2548, 2.0, _2756);
    float _2760 = -_2700;
    float _2762 = _2760 + 1.0;
    float _2764 = float(uint(_2746));
    float _2766 = -_2732;
    float _2768 = _2766 + 1.0;
    float _2770 = fma(_2256, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2668);
    int _2772 = abs(_2170);
    int _2774 = _933 * _2752;
    int _2776 = _2774 + _1866;
    float _2778 = -_2768;
    float _2780 = fma(_2778, _1316, _2620);
    if (_2616)
    {
        _1816 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2782 = _1816;
    float _2784 = as_type<float>(_1007) * _2764;
    float _2786 = fma(_2762, _2020, _2636);
    float _2788 = _2730 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2790 = as_type<int>(_2730);
    if (_2616)
    {
        float _2792 = _2782 * 5.0;
        _2790 = as_type<int>(_2792);
    }
    int _2794 = _2790;
    out.m_84.x = _2780;
    out.m_84.y = _2786;
    float _2796 = trunc(_2784);
    float _2798 = precise::max(_2796, 0.0);
    uint _2800 = uint(_2798);
    int _2802 = ~_2096;
    int _2804 = _2802 + _2336;
    int _2806 = _2804 + 1;
    float _2808 = _1904 + 0.5;
    if (_2616)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9703 = as_type<float>(_2794);
        out.gl_Position.z = _9703;
    }
    int _2810 = ~_933;
    int _2812 = _2810 + 1;
    float _2814 = -_135;
    float _2816 = fma(_2814, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2758);
    int _2818 = _949 * _2806;
    int _2820 = _2818 + _1534;
    int _2822 = abs(_1998);
    float _2824 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2624);
    int _2826 = abs(_2198);
    float _2828 = fma(_2788, _2808, _2816);
    int _2830 = abs(_2330);
    float _2832 = _2754 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2834 = ~_2822;
    int _2836 = _2834 + 1;
    int _2838 = _2836 + 1;
    float _2840 = _1474 + (-0.5);
    int _2842 = ~_2736;
    int _2844 = _2842 + 1;
    int _2846 = _2844 + 1;
    float _2848 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2850 = int(_2848);
    float _2852 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2640);
    int _2854 = int(_2694) + int(_2800);
    int _2856 = _2846 * as_type<int>(_2688);
    int _2858 = ~_2772;
    int _2860 = _2858 + 1;
    int _2862 = _2860 + 1;
    float _2864 = -_2852;
    float _2866 = _2864 + 1.0;
    int _2868 = _1894 >> 31;
    int _2870 = _2812 * _2854;
    int _2872 = _2870 + _1828;
    int _2874 = _2862 * as_type<int>(_2680);
    int _2876 = _2874 + _2856;
    int _2878 = _2868 & 3;
    out.m_86.x = _2770;
    int _2880 = ~_2826;
    int _2882 = _2880 + 1;
    int _2884 = _2882 + 1;
    float _2886 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2888 = _1894 + _2878;
    int _2890 = as_type<int>(_2866);
    if (_2616)
    {
        out.m_63.x = 0.0;
    }
    int _2892 = ~_2830;
    int _2894 = _2892 + 1;
    int _2896 = _2894 + 1;
    int _2898 = _2884 * as_type<int>(_2718);
    int _2900 = _2898 + _2876;
    bool _2902 = !_1716;
    int _2904 = _2902 ? _2776 : (-1);
    float _2906 = fma(_2648, -2.0, _2886);
    bool _2908 = !_2348;
    int _2910 = _2908 ? 0 : 1;
    int _2912 = _2896 * as_type<int>(_2726);
    int _2914 = _2912 + _2900;
    int _2916 = _2904 >> 31;
    float _2918 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2906);
    float _2920 = float(uint(_2850));
    int _2922 = _2916 & 3;
    float _2924 = -_2832;
    float _2926 = -_2918;
    float _2928 = fma(_2924, _2840, _2926);
    int _2930 = abs(_2910);
    float _2932 = 1.0 / _2920;
    int _2934 = abs(_2850);
    float _2936 = fma(_1474, _2866, _2928);
    int _2938 = _2904 + _2922;
    int _2940 = _2888 >> 2;
    float _2942 = float(uint(_2934));
    int _2944 = ~_2930;
    int _2946 = _2944 + 1;
    int _2948 = _2946 + 1;
    int _2950 = _2938 >> 2;
    float _2952 = 1.0 / _2942;
    int _2954 = _2940 << 4;
    int _2956 = _2954 + 368;
    int _2958 = _2914 * _2948;
    bool _2960 = _1930 != 3;
    bool _2962 = !_1530;
    int _2964 = _2962 ? _2820 : (-1);
    uint _2966 = uint(int(uint(_2956) >> uint(2)));
    uint _2968 = uint(int(uint(int(_2966)) >> uint(2)));
    int _2970 = int(_2966) & 3;
    float _2972 = (*spvDescriptorSet0.vp_c9)._m0[int(_2968)][_2970];
    int _2974 = int(_2966) + 1;
    uint _2976 = uint(int(uint(_2974) >> uint(2)));
    int _2978 = _2974 & 3;
    float _2980 = (*spvDescriptorSet0.vp_c9)._m0[int(_2976)][_2978];
    int _2982 = _2950 << 4;
    int _2984 = _2982 + 800;
    int _2986 = _2904 & 3;
    bool _2988 = _2986 != 0;
    int _2990 = _2964 * _2930;
    int _2992 = _2990 + _2958;
    bool _2994 = !_2960;
    int _2996 = _2994 ? 0 : (-1);
    bool _2998 = uint(_2872) >= uint(_933);
    uint _3000 = uint(int(uint(_2984) >> uint(2)));
    uint _3002 = uint(int(uint(int(_3000)) >> uint(2)));
    int _3004 = int(_3000) & 3;
    float _3006 = (*spvDescriptorSet0.vp_c9)._m0[int(_3002)][_3004];
    int _3008 = int(_3000) + 1;
    uint _3010 = uint(int(uint(_3008) >> uint(2)));
    int _3012 = _3008 & 3;
    float _3014 = (*spvDescriptorSet0.vp_c9)._m0[int(_3010)][_3012];
    bool _3016 = !_2988;
    int _3018 = _3016 ? 0 : 1;
    int _3020 = _2904 & 3;
    bool _3022 = _3020 != 0;
    int _3024 = as_type<int>(_2932) + (-2);
    int _3026 = _3022 ? 0 : 1;
    int _3028 = _2984 + 8;
    uint _3030 = uint(int(uint(_3028) >> uint(2)));
    uint _3032 = uint(int(uint(int(_3030)) >> uint(2)));
    int _3034 = int(_3030) & 3;
    float _3036 = (*spvDescriptorSet0.vp_c9)._m0[int(_3032)][_3034];
    int _3038 = int(_3030) + 1;
    uint _3040 = uint(int(uint(_3038) >> uint(2)));
    int _3042 = _3038 & 3;
    float _3044 = (*spvDescriptorSet0.vp_c9)._m0[int(_3040)][_3042];
    float _3046 = float(uint(_2992));
    bool _3048 = uint(_2986) >= 2u;
    int _3050 = ~_2082;
    int _3052 = _3050 + _2132;
    int _3054 = _3052 + 1;
    float _3056 = as_type<float>(_3024) * _3046;
    int _3058 = abs(_2992);
    int _3060 = _2956 + 8;
    uint _3062 = uint(int(uint(_3060) >> uint(2)));
    uint _3064 = uint(int(uint(int(_3062)) >> uint(2)));
    int _3066 = int(_3062) & 3;
    float _3068 = (*spvDescriptorSet0.vp_c9)._m0[int(_3064)][_3066];
    int _3070 = int(_3062) + 1;
    uint _3072 = uint(int(uint(_3070) >> uint(2)));
    int _3074 = _3070 & 3;
    float _3076 = (*spvDescriptorSet0.vp_c9)._m0[int(_3072)][_3074];
    int _3078 = _3048 ? 0 : 1;
    int _3080 = _923 * _3054;
    int _3082 = _3080 + _1478;
    bool _3084 = uint(_2986) > 1u;
    float _3086 = trunc(_3056);
    float _3088 = precise::max(_3086, 0.0);
    uint _3090 = uint(_3088);
    int _3092 = as_type<int>(_2952) + (-2);
    float _3094 = float(uint(_3058));
    bool _3096 = !_2998;
    int _3098 = _3096 ? 0 : (-1);
    bool _3100 = _2986 != 3;
    float _3102 = as_type<float>(_3092) * _3094;
    int _3104 = ~_2854;
    int _3106 = _3104 + _3098;
    int _3108 = _3106 + 1;
    int _3110 = ~_3026;
    int _3112 = _3110 + 1;
    int _3114 = _3112 + 1;
    float _3116 = trunc(_3102);
    float _3118 = precise::max(_3116, 0.0);
    uint _3120 = uint(_3118);
    int _3122 = _3114;
    if (!_3084)
    {
        int _3124 = ~_3026;
        int _3126 = _3124 + 1;
        _3122 = _3126;
    }
    int _3128 = _3122;
    int _3130 = _933 * _3108;
    int _3132 = _3130 + _1828;
    int _3134 = ~_2850;
    int _3136 = _3134 + 1;
    bool _3138 = _2986 != 3;
    int _3140 = _2838 * as_type<int>(_2980);
    int _3142 = ~_3078;
    int _3144 = _3142 + 1;
    int _3146 = _3144 + 1;
    int _3148 = _3146;
    if (_3100)
    {
        int _3150 = ~_3078;
        int _3152 = _3150 + 1;
        _3148 = _3152;
    }
    int _3154 = _3148;
    int _3156 = abs(_2158);
    int _3158 = _3136 * int(_3090);
    int _3160 = _3158 + _2992;
    int _3162 = ~_2934;
    int _3164 = _3162 + 1;
    int _3166 = abs(_3128);
    float _3168 = float(uint(_3160));
    int _3170 = _3164 * int(_3120);
    int _3172 = _3170 + _3058;
    int _3174 = ~_3166;
    int _3176 = _3174 + 1;
    int _3178 = _3176 + 1;
    int _3180 = ~_3156;
    int _3182 = _3180 + 1;
    int _3184 = _3182 + 1;
    float _3186 = as_type<float>(_3024) * _3168;
    float _3188 = float(uint(_3172));
    int _3190 = _3178 * as_type<int>(_3014);
    int _3192 = abs(_3018);
    float _3194 = trunc(_3186);
    float _3196 = precise::max(_3194, 0.0);
    uint _3198 = uint(_3196);
    int _3200 = _3184 * as_type<int>(_2972);
    int _3202 = _3200 + _3140;
    float _3204 = as_type<float>(_3092) * _3188;
    int _3206 = abs(_2078);
    int _3208 = abs(_3154);
    int _3210 = ~_3192;
    int _3212 = _3210 + 1;
    int _3214 = _3212 + 1;
    float _3216 = trunc(_3204);
    float _3218 = precise::max(_3216, 0.0);
    uint _3220 = uint(_3218);
    int _3222 = abs(_2996);
    int _3224 = ~_3206;
    int _3226 = _3224 + 1;
    int _3228 = _3226 + 1;
    int _3230 = _3214 * as_type<int>(_3006);
    int _3232 = _3230 + _3190;
    int _3234 = ~_3208;
    int _3236 = _3234 + 1;
    int _3238 = _3236 + 1;
    int _3240 = ~_3222;
    int _3242 = _3240 + 1;
    int _3244 = _3242 + 1;
    int _3246 = _3228 * as_type<int>(_3068);
    int _3248 = _3246 + _3202;
    int _3250 = ~_2850;
    int _3252 = _3250 + 1;
    int _3254 = _3238 * as_type<int>(_3036);
    int _3256 = _3254 + _3232;
    bool _3258 = !_3138;
    int _3260 = _3258 ? 0 : (-1);
    int _3262 = _3244 * as_type<int>(_3076);
    int _3264 = _3262 + _3248;
    bool _3266 = !_2342;
    int _3268 = _3266 ? 0 : 1;
    int _3270 = int(_3090) + int(_3198);
    int _3272 = abs(_3260);
    int _3274 = abs(_3268);
    int _3276 = _3252 * _3270;
    int _3278 = _3276 + _2992;
    int _3280 = ~_3272;
    int _3282 = _3280 + 1;
    int _3284 = _3282 + 1;
    int _3286 = int(_3120) + int(_3220);
    int _3288 = ~_2934;
    int _3290 = _3288 + 1;
    int _3292 = _3284 * as_type<int>(_3044);
    int _3294 = _3292 + _3256;
    int _3296 = ~_3274;
    int _3298 = _3296 + 1;
    int _3300 = _3298 + 1;
    bool _3302 = uint(_3278) >= uint(_2850);
    int _3304 = _3290 * _3286;
    int _3306 = _3304 + _3058;
    bool _3308 = !_2356;
    int _3310 = _3308 ? 0 : 1;
    int _3312 = _3264 * _3300;
    bool _3314 = !_3302;
    int _3316 = _3314 ? 0 : (-1);
    float _3318 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3320 = abs(_3310);
    bool _3322 = uint(_3306) >= uint(_2934);
    int _3324 = _2992 ^ _2850;
    int _3326 = ~_3270;
    int _3328 = _3326 + _3316;
    int _3330 = _3328 + 1;
    int _3332 = ~_3320;
    int _3334 = _3332 + 1;
    int _3336 = _3334 + 1;
    bool _3338 = !_3322;
    int _3340 = _3338 ? 0 : (-1);
    int _3342 = _2850 * _3330;
    int _3344 = _3342 + _2992;
    uint _3346 = uint(int(uint(_3324) >> uint(31)));
    int _3348 = _3294 * _3336;
    bool _3350 = _2850 == 0;
    float _3352 = _3318 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3354 = _2850 == 0;
    float _3356 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3358 = ~_3340;
    int _3360 = _3286 + _3358;
    int _3362 = _3360 + 1;
    float _3364 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2734);
    int _3366 = ~int(_3346);
    int _3368 = _3366 + 1;
    bool _3370 = !_1522;
    int _3372 = _3370 ? _3082 : (-1);
    int _3374 = _3362 ^ _3368;
    bool _3376 = !_3350;
    int _3378 = _3376 ? _3344 : (-1);
    int _3380 = _3372 * _3274;
    int _3382 = _3380 + _3312;
    int _3384 = ~_3368;
    int _3386 = _3384 + _3374;
    int _3388 = _3386 + 1;
    float _3390 = float(_3378);
    bool _3392 = !_3354;
    int _3394 = _3392 ? _3388 : (-1);
    float _3396 = fma(_3352, _3390, _2740);
    float _3398 = _3356 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3400 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3402 = _1372 + 0.5;
    float _3404 = float(_3394);
    float _3406 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3400);
    bool _3408 = !_1716;
    int _3410 = _3408 ? _3132 : (-1);
    float _3412 = fma(_3352, _3402, _3396);
    float _3414 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3416 = -_3364;
    float _3418 = fma(_3398, _3404, _3416);
    float _3420 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3406);
    float _3422 = _1366 + (-0.5);
    float _3424 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3414);
    int _3426 = _3410 * _3320;
    int _3428 = _3426 + _3348;
    float _3430 = -_3420;
    float _3432 = _3430 + 1.0;
    float _3434 = -_3398;
    float _3436 = fma(_3434, _3422, _3418);
    float _3438 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3424);
    float _3440 = -_3432;
    float _3442 = fma(_1372, _3440, _3412);
    float _3444 = _2568 * _2568;
    float _3446 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3448 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3450 = -_3438;
    float _3452 = _3450 + 1.0;
    float _3454 = fma(_2574, _2574, _3444);
    float _3456 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3446);
    float _3458 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3448);
    float _3460 = -_3452;
    float _3462 = fma(_2476, _3460, _2702);
    float _3464 = fma(_2588, _2588, _3454);
    float _3466 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3456);
    float _3468 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3458);
    float _3470 = float(_3382);
    float _3472 = -_3466;
    float _3474 = _3472 + 1.0;
    float _3476 = rsqrt(_3464);
    float _3478 = -_2824;
    float _3480 = _3478 + 1.0;
    float _3482 = -_3468;
    float _3484 = _3482 + 1.0;
    float _3486 = fma(_2086, _3474, _2656);
    int _3488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3490 = _3488 != 0;
    int _3492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3494 = _3492 != 0;
    int _3496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3498 = _3496 != 0;
    float _3500 = -_3480;
    float _3502 = fma(_1904, _3500, _2828);
    float _3504 = float(_3428);
    float _3506 = fma(_1366, _3484, _3436);
    out.m_88.x = _3470;
    bool _3508 = !_3494;
    int _3510 = _3508 ? 0 : 1;
    bool _3512 = !_3498;
    int _3514 = _3512 ? 0 : 1;
    out.m_90.x = _3462;
    out.m_90.y = _3486;
    out.m_90.z = _3502;
    out.m_90.w = _2936;
    bool _3516 = !_3490;
    int _3518 = _3516 ? 0 : 1;
    out.m_88.w = _3504;
    float _3520 = _2568 * _3476;
    float _3522 = _2574 * _3476;
    out.m_92.x = _3442;
    out.m_92.y = _3506;
    float _3524 = _3502;
    float _3526 = _3520;
    if (_2616)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3528 = -_3520;
    float _3530 = fma(_3528, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2448);
    float _3532 = _2588 * _3476;
    float _3534 = -_3522;
    float _3536 = fma(_3534, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2460);
    float _3538 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3540 = _3530 + _3538;
    float _3542 = -_3532;
    float _3544 = fma(_3542, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2502);
    float _3546 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3548 = _3536 + _3546;
    float _3550 = _3540 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3552 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3554 = _3544 + _3552;
    float _3556 = fma(_3548, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3550);
    float _3558 = fma(_3554, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3556);
    bool _3560 = _3558 >= 0.0;
    float _3562 = _3554;
    if (_3560)
    {
        _3524 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3564 = _3524;
    int _3566 = as_type<int>(_3564);
    if (_3560)
    {
        out.m_63.x = 0.0;
    }
    if (_3560)
    {
        float _3568 = _3564 * 5.0;
        _3566 = as_type<int>(_3568);
    }
    int _3570 = _3566;
    if (_3560)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10809 = as_type<float>(_3570);
        out.gl_Position.z = _10809;
    }
    if (_3560)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3572 = fma(_3536, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3574 = fma(_3544, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3576 = floor(_3572);
    float _3578 = floor(_3574);
    float _3580 = -_3576;
    float _3582 = _3572 + _3580;
    float _3584 = -_3578;
    float _3586 = _3574 + _3584;
    float2 _10845 = float2(_3582, _3586);
    float _3588 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_10845, float2(0.0), isnan(_10845)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_10845, float2(0.0), isnan(_10845)), level(0.0)).x;
    float _3590 = _1090 * 2.0;
    float _3592 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3594 = log2(_3592);
    float _3596 = _1186 * 2.0;
    float _3598 = _1188 + _1186;
    float _3600 = _1188 * 2.0;
    int _3602 = abs(_3518);
    float _3604 = -_3520;
    float _3606 = fma(_3604, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2568);
    float _3608 = _3598 + (-1.0);
    float _3610 = -_3522;
    float _3612 = fma(_3610, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2574);
    float _3614 = floor(_3590);
    float _3616 = _3606 * _3606;
    float _3618 = float(_3602);
    float _3620 = -_3532;
    float _3622 = fma(_3620, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2588);
    float _3624 = _701 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3626 = _703 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3628 = floor(_3596);
    float _3630 = _3594 * _135;
    bool _3632 = _3614 > 0.0;
    float _3634 = floor(_3600);
    bool _3636 = _3614 >= 0.0;
    bool _3638 = isnan(_3614);
    bool _3640 = _3636 || _3638;
    bool _3642 = isnan(0.0);
    bool _3644 = _3640 || _3642;
    float _3646 = fma(_3608, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3648 = _1188 + _1090;
    float _3650 = _1188 + (-0.5);
    int _3652 = _3644 ? 0 : 1;
    float _3654 = _3648 + (-1.0);
    float _3656 = exp2(_3630);
    bool _3658 = _3628 >= 0.0;
    bool _3660 = isnan(_3628);
    bool _3662 = _3658 || _3660;
    bool _3664 = isnan(0.0);
    bool _3666 = _3662 || _3664;
    int _3668 = ~_3652;
    int _3670 = _3668 + 1;
    int _3672 = _3670 + 1;
    int _3674 = _3672;
    int _3676 = 2;
    if (!_3632)
    {
        int _3678 = ~_3652;
        int _3680 = _3678 + 1;
        _3674 = _3680;
    }
    int _3682 = _3674;
    bool _3684 = _3628 > 0.0;
    bool _3686 = _3634 > 0.0;
    float _3688 = fma(_3654, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3690 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3692 = 1.0 + _3690;
    float _3694 = in.m_94.x;
    float _3696 = in.m_94.y;
    float _3698 = in.m_94.z;
    bool _3700 = _3634 >= 0.0;
    bool _3702 = isnan(_3634);
    bool _3704 = _3700 || _3702;
    bool _3706 = isnan(0.0);
    bool _3708 = _3704 || _3706;
    float _3710 = -_3656;
    float _3712 = _3710 + 1.0;
    float _3714 = 1.0 / _3692;
    int _3716 = _3666 ? 0 : 1;
    bool _3718 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3720 = isnan(1.0);
    bool _3722 = _3718 || _3720;
    bool _3724 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3726 = _3722 || _3724;
    int _3728 = ~_3716;
    int _3730 = _3728 + 1;
    int _3732 = _3730 + 1;
    int _3734 = _3732;
    if (!_3684)
    {
        int _3736 = ~_3716;
        int _3738 = _3736 + 1;
        _3734 = _3738;
    }
    int _3740 = _3734;
    bool _3742 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3744 = isnan(0.0);
    bool _3746 = _3742 || _3744;
    bool _3748 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3750 = _3746 || _3748;
    float _3752 = float(_3682);
    float _3754 = _3750 ? _3712 : 0.0;
    int _3756 = abs(_3510);
    float _3758 = _3618 * _3752;
    float _3760 = float(_3740);
    if (_3726)
    {
        float _3762 = _3754 * _3714;
        _145 = _3762;
    }
    float _3764 = _145;
    float _3766 = float(_3756);
    float _3768 = fma(_3612, _3612, _3616);
    float _3770 = _3758 * (-2.0);
    int _3772 = _3708 ? 0 : 1;
    float _3774 = _3766 * _3760;
    float _3776 = _1186 + (-0.5);
    float _3778 = fma(_3770, _3694, _3694);
    float _3780 = fma(_3646, _3770, _3646);
    int _3782 = abs(_3514);
    float _3784 = _1186 + _1090;
    float _3786 = fma(_3776, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3778);
    float _3788 = _3774 * (-2.0);
    int _3790 = ~_3772;
    int _3792 = _3790 + 1;
    int _3794 = _3792 + 1;
    float _3796 = _3784 + (-1.0);
    int _3798 = _3794;
    if (!_3686)
    {
        int _3800 = ~_3772;
        int _3802 = _3800 + 1;
        _3798 = _3802;
    }
    int _3804 = _3798;
    float _3806 = fma(_3688, _3788, _3688);
    float _3808 = fma(_3788, _3696, _3696);
    float _3810 = _1090 + (-0.5);
    float _3812 = float(_3804);
    float _3814 = fma(_3650, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3808);
    float _3816 = float(_3782);
    float _3818 = fma(_3780, _3764, _3786);
    float _3820 = fma(_3622, _3622, _3768);
    float _3822 = fma(_3806, _3764, _3814);
    float _3824 = _3816 * _3812;
    float _3826 = _3818 * 0.15915493667125701904296875;
    float _3828 = _3822 * 0.15915493667125701904296875;
    float _3830 = _3824 * (-2.0);
    float _3832 = sqrt(_3820);
    float _3834 = fma(_3796, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3836 = fma(_3830, _3698, _3698);
    float _3838 = fma(_3834, _3830, _3834);
    float _3840 = fma(_3810, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3836);
    float _3842 = _3826 * 6.283185482025146484375;
    float _3844 = sin(_3842);
    float _3846 = fma(_3838, _3764, _3840);
    float _3848 = _3530 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3850 = _3846 * 0.15915493667125701904296875;
    float _3852 = fma(_3536, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3848);
    float _3854 = _3826 * 6.283185482025146484375;
    float _3856 = cos(_3854);
    float _3858 = _3476 * _3832;
    float _3860 = fma(_3544, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3852);
    float _3862 = _3860 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3864 = _3530 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3866 = _3828 * 6.283185482025146484375;
    float _3868 = sin(_3866);
    float _3870 = fma(_3536, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3864);
    float _3872 = fma(_3544, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3870);
    float _3874 = _3828 * 6.283185482025146484375;
    float _3876 = cos(_3874);
    float _3878 = _3872 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3880 = _3878 + _3862;
    float _3882 = 1.0 / _3862;
    float _3884 = _3844 * _3868;
    float _3886 = _3850 * 6.283185482025146484375;
    float _3888 = sin(_3886);
    float _3890 = _3856 * _3876;
    float _3892 = _3858 * _3624;
    float _3894 = _3844 * _3876;
    float _3896 = _3850 * 6.283185482025146484375;
    float _3898 = cos(_3896);
    float _3900 = _3880 * _3882;
    float _3902 = _3900 * 0.5;
    float _3904 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _229);
    float _3906 = _3904 * _3892;
    float _3908 = _3858 * _3626;
    float _3910 = fma(_3888, _3890, _3884);
    float _3912 = fma(_3888, _3884, _3890);
    float _3914 = _3856 * _3868;
    float _3916 = -_3914;
    float _3918 = fma(_3888, _3894, _3916);
    float _3920 = _3868 * _3898;
    float _3922 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3924 = fma(_3902, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3922);
    float _3926 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _3928 = _3856 * _3898;
    float _3930 = _3876 * _3898;
    float _3932 = _3844 * _3898;
    float _3934 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _225);
    float _3936 = 1.0 / _3924;
    float _3938 = _3530 + _3926;
    float _3940 = -_3894;
    float _3942 = fma(_3888, _3914, _3940);
    float _3944 = _3934 * _3908;
    float _3946 = -_3906;
    float _3948 = _3888 * _3946;
    float _3950 = _3928 * _3906;
    float _3952 = _3938 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _3954 = _3932 * _3906;
    float _3956 = fma(_3930, _3944, _3948);
    float _3958 = fma(_3910, _3944, _3950);
    float _3960 = _3938 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _3962 = fma(_3536, (*spvDescriptorSet0.vp_c15)._m0[126].x, _3952);
    float _3964 = fma(_3918, _3944, _3954);
    float _3966 = _3858 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3968 = _3966 * 0.5;
    float _3970 = fma(_3536, (*spvDescriptorSet0.vp_c15)._m0[127].x, _3960);
    float _3972 = fma(_3544, (*spvDescriptorSet0.vp_c15)._m0[126].z, _3962);
    float _3974 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3976 = _3936 * _3974;
    float _3978 = fma(_3942, _3968, _3958);
    float _3980 = fma(_3920, _3968, _3956);
    float _3982 = fma(_3544, (*spvDescriptorSet0.vp_c15)._m0[127].z, _3970);
    float _3984 = _3972 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _3986 = _3976 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _3988 = fma(_3912, _3968, _3964);
    bool _3990 = _3976 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _3992 = _3978 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3994 = _3978 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3996 = trunc(_3984);
    int _3998 = int(_3996);
    float _4000 = _3982 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _4002 = fma(_3980, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3992);
    float _4004 = fma(_3980, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3994);
    bool _4006 = !_3986;
    int _4008 = _4006 ? 0 : 1;
    float _4010 = _3978 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4012 = fma(_3988, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4002);
    float _4014 = fma(_3988, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4004);
    float _4016 = trunc(_4000);
    int _4018 = int(_4016);
    int _4020 = as_type<int>(_4010);
    int _4022 = as_type<int>(_3988);
    if (!_3986)
    {
        _3676 = 1;
    }
    int _4024 = _3676;
    float _4026 = _4012 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _4028 = _4024;
    if (!_3990)
    {
        _4028 = _4008;
    }
    int _4030 = _4028;
    float _4032 = _4014 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _4034 = fma(_3980, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4010);
    float _4036 = _2502 + _4026;
    int _4038 = _4030 << 6;
    float _4040 = _2460 + _4032;
    int _4042 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _4044 = _3998 + _4042;
    int _4046 = _4044 + 1;
    float _4048 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _4050 = _4036 + _4048;
    int _4052 = _4038 + 48;
    uint _4054 = uint(int(uint(_4052) >> uint(2)));
    uint _4056 = uint(int(uint(int(_4054)) >> uint(2)));
    int _4058 = int(_4054) & 3;
    float _4060 = (*spvDescriptorSet0.vp_c15)._m0[int(_4056)][_4058];
    int _4062 = int(_4054) + 1;
    uint _4064 = uint(int(uint(_4062) >> uint(2)));
    int _4066 = _4062 & 3;
    float _4068 = (*spvDescriptorSet0.vp_c15)._m0[int(_4064)][_4066];
    float _4070 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _4072 = _4040 + _4070;
    bool _4074 = _4046 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _4076 = fma(_3988, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4034);
    int _4078 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _4080 = _4018 + _4078;
    int _4082 = _4080 + 1;
    float _4084 = _4050 * _4050;
    float _4086 = _4076 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _4088 = _4038 + 56;
    uint _4090 = uint(int(uint(_4088) >> uint(2)));
    uint _4092 = uint(int(uint(int(_4090)) >> uint(2)));
    int _4094 = int(_4090) & 3;
    float _4096 = (*spvDescriptorSet0.vp_c15)._m0[int(_4092)][_4094];
    int _4098 = int(_4090) + 1;
    uint _4100 = uint(int(uint(_4098) >> uint(2)));
    int _4102 = _4098 & 3;
    float _4104 = (*spvDescriptorSet0.vp_c15)._m0[int(_4100)][_4102];
    int _4106 = _4046 | _4082;
    float _4108 = fma(_4072, _4072, _4084);
    float _4110 = _2448 + _4086;
    bool _4112 = _4106 < 0;
    bool _4114 = _4112 || _4074;
    float _4116 = sqrt(_4108);
    int _4118 = _4038 + 64;
    uint _4120 = uint(int(uint(_4118) >> uint(2)));
    uint _4122 = uint(int(uint(int(_4120)) >> uint(2)));
    int _4124 = int(_4120) & 3;
    float _4126 = (*spvDescriptorSet0.vp_c15)._m0[int(_4122)][_4124];
    int _4128 = int(_4120) + 1;
    uint _4130 = uint(int(uint(_4128) >> uint(2)));
    int _4132 = _4128 & 3;
    float _4134 = (*spvDescriptorSet0.vp_c15)._m0[int(_4130)][_4132];
    bool _4136 = _4082 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _4138 = _4136 || _4114;
    int _4140 = _4038 + 72;
    uint _4142 = uint(int(uint(_4140) >> uint(2)));
    uint _4144 = uint(int(uint(int(_4142)) >> uint(2)));
    int _4146 = int(_4142) & 3;
    float _4148 = (*spvDescriptorSet0.vp_c15)._m0[int(_4144)][_4146];
    int _4150 = int(_4142) + 1;
    uint _4152 = uint(int(uint(_4150) >> uint(2)));
    int _4154 = _4150 & 3;
    float _4156 = (*spvDescriptorSet0.vp_c15)._m0[int(_4152)][_4154];
    float _4158 = as_type<float>(_4046);
    float _4160 = as_type<float>(_4082);
    float _4162 = _4040;
    float _4164 = _4108;
    if (!_4138)
    {
        int _4166 = _4082 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _4168 = _4166 + _4046;
        _4020 = _4168;
    }
    int _4170 = _4020;
    bool _4172 = _4116 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _4174 = _4038 + 96;
    uint _4176 = uint(int(uint(_4174) >> uint(2)));
    uint _4178 = uint(int(uint(int(_4176)) >> uint(2)));
    int _4180 = int(_4176) & 3;
    float _4182 = (*spvDescriptorSet0.vp_c15)._m0[int(_4178)][_4180];
    int _4184 = int(_4176) + 1;
    uint _4186 = uint(int(uint(_4184) >> uint(2)));
    int _4188 = _4184 & 3;
    float _4190 = (*spvDescriptorSet0.vp_c15)._m0[int(_4186)][_4188];
    if (!_4138)
    {
        int _4192 = _4170 << 2;
        _4022 = _4192;
    }
    int _4194 = _4022;
    int _4196 = _4194;
    if (!_4138)
    {
        uint _4198 = uint(int(uint(_4170) >> uint(2)));
        _2890 = int(_4198);
    }
    int _4200 = _2890;
    float _4202 = as_type<float>(_4200);
    if (!_4138)
    {
        int _4204 = 12 & _4194;
        _4196 = _4204;
    }
    int _4206 = _4196;
    int _4208 = _4038 + 104;
    uint _4210 = uint(int(uint(_4208) >> uint(2)));
    uint _4212 = uint(int(uint(int(_4210)) >> uint(2)));
    int _4214 = int(_4210) & 3;
    float _4216 = (*spvDescriptorSet0.vp_c15)._m0[int(_4212)][_4214];
    int _4218 = int(_4210) + 1;
    uint _4220 = uint(int(uint(_4218) >> uint(2)));
    int _4222 = _4218 & 3;
    float _4224 = (*spvDescriptorSet0.vp_c15)._m0[int(_4220)][_4222];
    if (!_4138)
    {
        int _4226 = _4200 << 4;
        int _4228 = _4226 + _4206;
        _4202 = as_type<float>(_4228);
    }
    float _4230 = _4202;
    if (!_4172)
    {
        _4158 = _4040;
    }
    float _4232 = _4158;
    float _4234 = _4232;
    if (!_4172)
    {
        _4160 = _4036;
    }
    float _4236 = _4160;
    float _4238 = _4236;
    if (!_4172)
    {
        _4162 = _4110;
    }
    float _4240 = _4162;
    bool _4242 = !_4172;
    float _4244 = _4240;
    float _4246 = _4126;
    if (!_4242)
    {
        float _4248 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4250 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4252 = _4116 + _4250;
        float _4254 = _4110 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4256 = rsqrt(_4108);
        float _4258 = _4252 * _4248;
        float _4260 = _4258 * 0.15915493667125701904296875;
        float _4262 = _4260 * 6.283185482025146484375;
        float _4264 = cos(_4262);
        float _4266 = _4260 * 6.283185482025146484375;
        float _4268 = sin(_4266);
        float _4270 = _4264 + (-1.0);
        float _4272 = fma(_4268, _4254, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4274 = _4270 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4276 = _4256 * _4272;
        float _4278 = fma(_4110, _4264, _4274);
        float _4280 = fma(_4072, _4276, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4282 = fma(_4050, _4276, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _4244 = _4278;
        _4234 = _4280;
        _4238 = _4282;
        _4164 = _4256;
    }
    float _4284 = _4244;
    float _4286 = _4234;
    float _4288 = _4238;
    float _4290 = _4164;
    float _4292 = -_2448;
    float _4294 = _4292 + _4284;
    int _4296 = _4038 + 80;
    uint _4298 = uint(int(uint(_4296) >> uint(2)));
    uint _4300 = uint(int(uint(int(_4298)) >> uint(2)));
    int _4302 = int(_4298) & 3;
    float _4304 = (*spvDescriptorSet0.vp_c15)._m0[int(_4300)][_4302];
    int _4306 = int(_4298) + 1;
    uint _4308 = uint(int(uint(_4306) >> uint(2)));
    int _4310 = _4306 & 3;
    float _4312 = (*spvDescriptorSet0.vp_c15)._m0[int(_4308)][_4310];
    float _4314 = -_2460;
    float _4316 = _4314 + _4286;
    float _4318 = -_2502;
    float _4320 = _4318 + _4288;
    float _4322 = _4294 * _4294;
    float _4324 = _3938 * _4190;
    float _4326 = _4290;
    float _4328 = _4322;
    float _4330 = _4288;
    float _4332 = _4286;
    float _4334 = _4284;
    if (!_4138)
    {
        float _4336 = floor(_3984);
        _4326 = _4336;
    }
    float _4338 = _4326;
    float _4340 = _3938 * _4134;
    float _4342 = fma(_4316, _4316, _4322);
    int _4344 = _4038 + 88;
    uint _4346 = uint(int(uint(_4344) >> uint(2)));
    uint _4348 = uint(int(uint(int(_4346)) >> uint(2)));
    int _4350 = int(_4346) & 3;
    float _4352 = (*spvDescriptorSet0.vp_c15)._m0[int(_4348)][_4350];
    int _4354 = int(_4346) + 1;
    uint _4356 = uint(int(uint(_4354) >> uint(2)));
    int _4358 = _4354 & 3;
    float _4360 = (*spvDescriptorSet0.vp_c15)._m0[int(_4356)][_4358];
    float _4362 = fma(_3536, _4182, _4324);
    float _4364 = fma(_3536, _4126, _4340);
    float _4366 = fma(_4320, _4320, _4342);
    float _4368 = fma(_3544, _4216, _4362);
    if (!_4138)
    {
        float _4370 = floor(_4000);
        _4328 = _4370;
    }
    float _4372 = _4328;
    bool _4374 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _4376 = isnan(0.5);
    bool _4378 = _4374 || _4376;
    bool _4380 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4382 = _4378 || _4380;
    float _4384 = _4230;
    float _4386 = _4372;
    if (!_4138)
    {
        int _4388 = as_type<int>(_4230) + 400;
        uint _4390 = uint(int(uint(_4388) >> uint(2)));
        uint _4392 = uint(int(uint(int(_4390)) >> uint(2)));
        int _4394 = int(_4390) & 3;
        float _4396 = (*spvDescriptorSet0.vp_c15)._m0[int(_4392)][_4394];
        _4384 = _4396;
    }
    float _4398 = _4384;
    float _4400 = _4368 + _4224;
    float _4402 = _3938 * _4068;
    float _4404 = fma(_3544, _4148, _4364);
    float _4406 = sqrt(_4366);
    float _4408 = fma(_3536, _4060, _4402);
    float _4410 = fma(_3544, _4096, _4408);
    float _4412 = 1.0 / _4400;
    bool _4414 = _4406 > 0.0;
    bool _4416 = !_4414;
    float _4418 = _4404;
    if (!_4416)
    {
        float _4420 = _245 * _245;
        float _4422 = rsqrt(_4366);
        float _4424 = fma(_241, _241, _4420);
        float _4426 = fma(_247, _247, _4424);
        float _4428 = sqrt(_4426);
        float _4430 = _4316 * _4422;
        float _4432 = _4294 * _4422;
        float _4434 = _4320 * _4422;
        bool _4436 = _4428 > 0.0;
        bool _4438 = !_4436;
        if (!_4438)
        {
            float _4440 = rsqrt(_4426);
            float _4442 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4444 = _245 * _4440;
            float _4446 = _241 * _4440;
            float _4448 = _247 * _4440;
            float _4450 = _4432 * _4444;
            float _4452 = fma(_4430, _4446, _4450);
            float _4454 = _4442 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4456 = fma(_4434, _4448, _4452);
            float _4458 = _4456 * _4454;
            float _4460 = fma(_241, _4458, _4286);
            float _4462 = fma(_245, _4458, _4284);
            float _4464 = fma(_247, _4458, _4288);
            _4330 = _4464;
            _4332 = _4460;
            _4334 = _4462;
            _4246 = _4446;
        }
    }
    float _4466 = _4330;
    float _4468 = _4332;
    float _4470 = _4334;
    float _4472 = _4246;
    float _4474 = -_3532;
    float _4476 = fma(_4474, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4466);
    float _4478 = _4404 + _4156;
    float _4480 = -_3522;
    float _4482 = fma(_4480, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4468);
    float _4484 = -_3520;
    float _4486 = fma(_4484, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4470);
    float _4488 = _4410 + _4104;
    float _4490 = _4486;
    float _4492 = _4482;
    if (_4382)
    {
        _4418 = _4476;
    }
    float _4494 = _4418;
    float _4496 = _4494;
    if (!_4382)
    {
        float _4498 = _3540 * _3540;
        float _4500 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4502 = -_2502;
        float _4504 = _4502 + _4466;
        float _4506 = -_2448;
        float _4508 = _4506 + _4470;
        float _4510 = fma(_3548, _3548, _4498);
        float _4512 = -_2460;
        float _4514 = _4512 + _4468;
        float _4516 = fma(_3554, _3554, _4510);
        float _4518 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4520 = sqrt(_4516);
        float _4522 = 1.0 / _3858;
        float _4524 = _4518 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4526 = precise::min(_4520, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4528 = _4526 * _4500;
        float _4530 = _4528 * _4522;
        float _4532 = _4524 * _4530;
        float _4534 = _4504 * _4530;
        float _4536 = fma(_4508, _4532, _3530);
        float _4538 = fma(_4514, _4532, _3536);
        float _4540 = fma(_4524, _4534, _3544);
        _4490 = _4536;
        _4492 = _4538;
        _4496 = _4540;
    }
    float _4542 = _4490;
    float _4544 = _4492;
    float _4546 = _4496;
    float _4548 = _4542 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4550 = _4542 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4552 = _4488 * _4412;
    float _4554 = _4542 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4556 = fma(_4544, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4548);
    float _4558 = fma(_4544, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4550);
    float _4560 = _4478 * _4412;
    bool _4562 = _4552 >= 0.0;
    float _4564 = fma(_4546, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4556);
    float _4566 = fma(_4544, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4554);
    float _4568 = fma(_4546, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4558);
    float _4570 = _4542 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4572 = _4564 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _4574 = _4552 <= 1.0;
    bool _4576 = _4574 && _4562;
    float _4578 = fma(_4546, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4566);
    float _4580 = _4568 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4582 = fma(_4544, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4570);
    float _4584 = _4572 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _4586 = _4560 >= 0.0;
    bool _4588 = _4586 && _4576;
    float _4590 = _4578 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4592 = fma(_4546, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4582);
    float _4594 = fma(_4580, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4584);
    bool _4596 = _4560 <= 1.0;
    bool _4598 = _4596 && _4588;
    float _4600 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4602 = _4590 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4604 = _4592 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4606 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4594);
    float _4608 = _4572 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4610 = -_4602;
    float _4612 = fma(_4610, _4600, 1.0);
    float _4614 = _3938 * _4312;
    float _4616 = fma(_4604, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4606);
    float _4618 = _4572 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4620 = fma(_4580, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4608);
    float _4622 = fma(_3536, _4304, _4614);
    float _4624 = 1.0 / _4616;
    float _4626 = _4554;
    float _4628 = _4566;
    float _4630 = _4616;
    if (_4598)
    {
        float _4632 = float(_4030);
        _4626 = _4632;
    }
    float _4634 = _4626;
    float _4636 = fma(_4580, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4618);
    float _4638 = fma(_3544, _4352, _4622);
    float _4640 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4620);
    if (!_4138)
    {
        float _4642 = -_4338;
        float _4644 = _3984 + _4642;
        _4628 = _4644;
    }
    float _4646 = _4628;
    float _4648 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4636);
    float _4650 = _4638 + _4360;
    float _4652 = log2(_4612);
    float _4654 = _4646;
    if (!_4138)
    {
        float _4656 = -_4372;
        float _4658 = _4000 + _4656;
        _4386 = _4658;
    }
    float _4660 = _4386;
    float _4662 = fma(_4604, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4648);
    float _4664 = fma(_4604, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4640);
    float _4666 = _4650 * _4412;
    float _4668 = _4472;
    if (!_4138)
    {
        float _4670 = rint(_4398);
        float _4672 = precise::max(_4670, 0.0);
        uint _4674 = uint(_4672);
        uint _4676 = clamp(_4674, 0u, 65535u);
        _4668 = as_type<float>(_4676);
    }
    float _4678 = _4668;
    float _4680 = _4662 * _4624;
    float _4682 = _4664 * _4624;
    float _4684 = fma(_4680, 0.5, 0.5);
    float _4686 = fma(_4682, -0.5, 0.5);
    float _4688 = _4634;
    float _4690 = _4682;
    if (_4598)
    {
        float _4692 = rint(_4634);
        float _4694 = precise::max(_4692, 0.0);
        uint _4696 = uint(_4694);
        uint _4698 = clamp(_4696, 0u, 65535u);
        _4688 = as_type<float>(_4698);
    }
    float _4700 = _4688;
    float _4702 = _4652 * 0.693147182464599609375;
    float _4704 = _4702 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4706 = _4660;
    if (!_4138)
    {
        float3 _12624 = float3(_4646, _4660, float(as_type<int>(_4678)));
        float3 _12628 = select(_12624, float3(0.0), isnan(_12624));
        float _4708 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _12628.xy, uint(rint(_12628.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _12628.xy, uint(rint(_12628.z)), level(0.0)).x;
        _4706 = _4708;
    }
    float _4710 = _4706;
    float _4712 = _4560;
    if (_4598)
    {
        float3 _12643 = float3(_4552, _4560, float(as_type<int>(_4700)));
        float3 _12645 = select(_12643, float3(0.0), isnan(_12643));
        float _4714 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _12645.xy, uint(rint(_12645.z)), _4666, level(0.0));
        _4712 = _4714;
    }
    float _4716 = _4712;
    float3 _12655 = float3(_4684, _4686, _4704);
    float _4718 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12655, float3(0.0), isnan(_12655)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12655, float3(0.0), isnan(_12655)), level(0.0)).x;
    float3 _12664 = float3(_4684, _4686, _4704);
    float4 _4721 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12664, float3(0.0), isnan(_12664)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12664, float3(0.0), isnan(_12664)), level(0.0)).xyzw;
    float _4723 = _4721.x;
    float _4725 = _4721.y;
    float _4727 = _4721.z;
    float _4729 = _4721.w;
    bool _4731 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _4733 = isnan(0.5);
    bool _4735 = _4731 || _4733;
    bool _4737 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4739 = _4735 || _4737;
    if (_4138)
    {
        _3562 = 1.0;
    }
    float _4741 = _3562;
    float _4743 = _4741;
    if (_4739)
    {
        _4690 = 1.0;
    }
    float _4745 = _4690;
    float _4747 = _4745;
    float _4749 = _4725;
    float _4751 = _4723;
    if (!_4739)
    {
        float _4753 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4755 = _4753 * 0.15915493667125701904296875;
        float _4757 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4759 = _4755 * 6.283185482025146484375;
        float _4761 = cos(_4759);
        float _4763 = _4757 * 0.15915493667125701904296875;
        float _4765 = _4755 * 6.283185482025146484375;
        float _4767 = sin(_4765);
        float _4769 = 1.0 / _4761;
        float _4771 = _4763 * 6.283185482025146484375;
        float _4773 = cos(_4771);
        float _4775 = _4767 * _4769;
        float _4777 = _4763 * 6.283185482025146484375;
        float _4779 = sin(_4777);
        float _4781 = _4773 * _4775;
        float _4783 = 1.0 / _4781;
        float _4785 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4787 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4785;
        float _4789 = 1.0 / _4787;
        float _4791 = _4779 * _4783;
        float _4793 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4795 = fma(_3976, _4791, _4793);
        float _4797 = _4795 * _4789;
        float _4799 = precise::clamp(_4797, 0.0, 1.0);
        _4654 = _4769;
        _4747 = _4799;
    }
    float _4801 = _4654;
    float _4803 = _4747;
    float _4805 = _4801;
    if (!_4138)
    {
        int _4807 = _4170 << 4;
        int _4809 = _4807 + 2048;
        uint _4811 = uint(int(uint(_4809) >> uint(2)));
        uint _4813 = uint(int(uint(int(_4811)) >> uint(2)));
        int _4815 = int(_4811) & 3;
        float _4817 = (*spvDescriptorSet0.vp_c15)._m0[int(_4813)][_4815];
        int _4819 = int(_4811) + 1;
        uint _4821 = uint(int(uint(_4819) >> uint(2)));
        int _4823 = _4819 & 3;
        float _4825 = (*spvDescriptorSet0.vp_c15)._m0[int(_4821)][_4823];
        int _4827 = _4809 + 8;
        uint _4829 = uint(int(uint(_4827) >> uint(2)));
        uint _4831 = uint(int(uint(int(_4829)) >> uint(2)));
        int _4833 = int(_4829) & 3;
        float _4835 = (*spvDescriptorSet0.vp_c15)._m0[int(_4831)][_4833];
        int _4837 = int(_4829) + 1;
        uint _4839 = uint(int(uint(_4837) >> uint(2)));
        int _4841 = _4837 & 3;
        float _4843 = (*spvDescriptorSet0.vp_c15)._m0[int(_4839)][_4841];
        float _4845 = _3938 * _4825;
        float _4847 = fma(_3536, _4817, _4845);
        float _4849 = fma(_3544, _4835, _4847);
        float _4851 = _4849 + _4843;
        float _4853 = precise::clamp(_4851, 0.0, 1.0);
        float _4855 = -_4853;
        float _4857 = _4855 + _4710;
        float _4859 = fma(_4857, 500.0, 1.5);
        float _4861 = exp2(_4859);
        float _4863 = 0.0 + _4861;
        float _4865 = precise::clamp(_4863, 0.0, 1.0);
        _4805 = _4825;
        _4743 = _4865;
    }
    float _4867 = _4805;
    float _4869 = _4743;
    float _4871 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4873 = _4542 + _4871;
    float _4875 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4877 = _4544 + _4875;
    float _4879 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4881 = _4546 + _4879;
    float _4883 = _4873 * _4873;
    float _4885 = fma(_4877, _4877, _4883);
    float _4887 = fma(_4881, _4881, _4885);
    float _4889 = rsqrt(_4887);
    float _4891 = _4889 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4893 = _4877 * _4891;
    float _4895 = _4881 * _4891;
    float _4897 = _4893 * _4893;
    float _4899 = _4895 * _4895;
    float _4901 = _4897 + _4899;
    float _4903 = sqrt(_4901);
    bool _4905 = _4903 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4907 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4909 = _4903 + _4907;
    float _4911 = _4885;
    float _4913 = _4889;
    float _4915 = _4909;
    float _4917 = _4873;
    float _4919 = _4891;
    if (_4905)
    {
        float _4921 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4911 = _4921;
    }
    float _4923 = _4911;
    if (_4905)
    {
        float _4925 = rsqrt(_4901);
        _4913 = _4925;
    }
    float _4927 = _4913;
    float _4929 = _4923;
    float _4931 = _4927;
    if (_4905)
    {
        float _4933 = _4909 * _4923;
        _4915 = _4933;
    }
    float _4935 = _4915;
    if (_4905)
    {
        float _4937 = _4935 * 0.15915493667125701904296875;
        _4929 = _4937;
    }
    float _4939 = _4929;
    float _4941 = _4881;
    float _4943 = _4939;
    if (_4905)
    {
        float _4945 = _4939 * 6.283185482025146484375;
        float _4947 = sin(_4945);
        _4941 = _4947;
    }
    float _4949 = _4941;
    float _4951 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4953 = precise::max(0.0, _4951);
    float _4955 = _4867;
    float _4957 = _4953;
    if (_4905)
    {
        float _4959 = _4939 * 6.283185482025146484375;
        float _4961 = cos(_4959);
        _4955 = _4961;
    }
    float _4963 = _4955;
    float _4965 = -_4891;
    float _4967 = -_4953;
    float _4969 = fma(_4873, _4965, _4967);
    if (_4905)
    {
        float _4971 = _4969 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4917 = _4971;
    }
    float _4973 = _4917;
    float _4975 = _4973;
    if (!_4905)
    {
        _4943 = _4897;
    }
    float _4977 = _4943;
    float _4979 = _4949;
    float _4981 = _4977;
    if (_4905)
    {
        float _4983 = fma(_4949, _4973, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4975 = _4983;
    }
    float _4985 = _4975;
    float _4987 = _4985;
    if (!_4905)
    {
        _4979 = _4969;
    }
    float _4989 = _4979;
    float _4991 = _4989;
    float _4993 = _4963;
    if (_4905)
    {
        float _4995 = _4963 + (-1.0);
        _4957 = _4995;
    }
    float _4997 = _4957;
    if (_4905)
    {
        float _4999 = _4927 * _4985;
        _3526 = _4999;
    }
    float _5001 = _3526;
    if (!_4905)
    {
        _4931 = _4893;
    }
    float _5003 = _4931;
    float _5005 = _5003;
    if (_4905)
    {
        float _5007 = _4997 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4919 = _5007;
    }
    float _5009 = _4919;
    if (_4905)
    {
        float _5011 = _4893 * _5001;
        _5005 = _5011;
    }
    float _5013 = _5005;
    if (!_4905)
    {
        _4987 = _4895;
    }
    float _5015 = _4987;
    float _5017 = _5015;
    if (_4905)
    {
        float _5019 = _4895 * _5001;
        _5017 = _5019;
    }
    float _5021 = _5017;
    if (_4905)
    {
        float _5023 = fma(_4969, _4963, _5009);
        _4991 = _5023;
    }
    float _5025 = _4991;
    if (_4905)
    {
        float _5027 = _5013 * _5013;
        _4981 = _5027;
    }
    float _5029 = _4981;
    if (!_4905)
    {
        _4993 = _4899;
    }
    float _5031 = _4993;
    float _5033 = _5031;
    if (_4905)
    {
        float _5035 = _5021 * _5021;
        _5033 = _5035;
    }
    float _5037 = _5033;
    float _5039 = sqrt(_4887);
    float _5041 = fma(_5025, _5025, _5029);
    float _5043 = _5041 + _5037;
    float _5045 = rsqrt(_5043);
    float _5047 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _5049 = fma(_5039, (*spvDescriptorSet0.vp_c15)._m0[23].w, _5047);
    float _5051 = precise::clamp(_5049, 0.0, 1.0);
    float _5053 = -_5051;
    float _5055 = _5053 + 1.0;
    float _5057 = abs(_5055);
    float _5059 = log2(_5057);
    float _5061 = _5045 * _5013;
    float _5063 = _5045 * _5025;
    float _5065 = _5045 * _5021;
    float _5067 = _5061 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _5069 = -_5067;
    float _5071 = fma(_5063, (*spvDescriptorSet0.vp_c15)._m0[21].y, _5069);
    float _5073 = -_5065;
    float _5075 = fma(_5073, (*spvDescriptorSet0.vp_c15)._m0[21].z, _5071);
    float _5077 = _5059 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _5079 = fma(_5075, -0.5, 0.5);
    float _5081 = fma(_5075, 0.5, 0.5);
    float _5083 = exp2(_5077);
    float _5085 = fma(_5081, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _5087 = fma(_5081, _5085, -0.212114393711090087890625);
    float _5089 = _5063 + 1.0;
    float _5091 = sqrt(_5079);
    float _5093 = fma(_5081, _5087, 1.570728778839111328125);
    float _5095 = -_5063;
    float _5097 = fma(_5083, _5089, _5095);
    float _5099 = fma(_5097, 0.5, 0.5);
    float _5101 = _5091 * 0.636619746685028076171875;
    float _5103 = -_5093;
    float _5105 = fma(_5101, _5103, 1.0);
    float2 _13236 = float2(_5105, _5099);
    float3 _5109 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_13236, float2(0.0), isnan(_13236)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_13236, float2(0.0), isnan(_13236)), level(0.0)).xyz;
    float _5111 = _5109.x;
    float _5113 = _5109.y;
    float _5115 = _5109.z;
    float _5117 = _229 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5119 = abs(_3976);
    float _5121 = log2(_5119);
    float _5123 = _3928 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5125 = _3928 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5127 = fma(_5117, _5117, 1.0);
    float _5129 = _3928 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5131 = _3910 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5133 = _3910 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5135 = _3910 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5137 = -_3888;
    float _5139 = fma(_5137, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5123);
    float _5141 = -_3888;
    float _5143 = fma(_5141, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5125);
    float _5145 = -_3888;
    float _5147 = fma(_5145, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5129);
    float _5149 = rsqrt(_5127);
    float _5151 = _3942 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5153 = _3942 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5155 = _3942 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5157 = fma(_3930, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5131);
    float _5159 = fma(_3920, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5151);
    float _5161 = fma(_3920, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5153);
    float _5163 = fma(_3920, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5155);
    float _5165 = fma(_3932, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5139);
    float _5167 = fma(_3930, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5133);
    float _5169 = _5121 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5171 = fma(_3930, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5135);
    float _5173 = fma(_3932, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5143);
    float _5175 = fma(_3918, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5157);
    float _5177 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5179 = _5117 * _5165;
    float _5181 = fma(_3932, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5147);
    float _5183 = fma(_3918, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5167);
    float _5185 = _4572 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5187 = fma(_3918, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5171);
    float _5189 = fma(_5177, _5175, _5179);
    float _5191 = exp2(_5169);
    float _5193 = fma(_3912, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5159);
    float _5195 = fma(_3912, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5161);
    float _5197 = _5117 * _5173;
    float _5199 = _5117 * _5181;
    float _5201 = fma(_3912, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5163);
    float _5203 = _5117 * _5149;
    float _5205 = fma(_4580, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5185);
    out.m_96.x = _5175;
    out.m_96.y = _5183;
    out.m_96.z = _5187;
    float _5207 = fma(_5177, _5187, _5199);
    float _5209 = _5059 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _5211 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5205);
    float _5213 = _4662 + _4616;
    bool _5215 = _3976 <= 8000.0;
    bool _5217 = isnan(_3976);
    bool _5219 = _5215 || _5217;
    bool _5221 = isnan(8000.0);
    bool _5223 = _5219 || _5221;
    float _5225 = float(_5223);
    float _5227 = fma(_5177, _5183, _5197);
    float _5229 = fma(_4604, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5211);
    float _5231 = exp2(_5209);
    float _5233 = -_5193;
    float _5235 = _5203 * _5233;
    float _5237 = _4616 * 0.5;
    float _5239 = -_3588;
    float _5241 = _5239 + 1.0;
    float _5243 = -_5201;
    float _5245 = _5203 * _5243;
    out.gl_Position.x = _4662;
    out.gl_Position.y = _4664;
    out.gl_Position.z = _5229;
    out.gl_Position.w = _4616;
    float _5247 = fma(_5149, _5165, _5235);
    float _5249 = fma(_4664, -0.5, _5237);
    float _5251 = fma(_5149, _5181, _5245);
    float _5253 = -_5195;
    float _5255 = _5203 * _5253;
    float _5257 = _5229 + _4616;
    float _5259 = _5213 * 0.5;
    float _5261 = fma(_5191, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5263 = precise::clamp(_5261, 0.0, 1.0);
    float _5265 = fma(_5149, _5173, _5255);
    float _5267 = _5257 * 0.5;
    float _5269 = _5201 + _5207;
    float _5271 = -_5231;
    float _5273 = _5271 + 1.0;
    float _5275 = fma(_5263, -2.0, 3.0);
    float _5277 = _5263 * _5263;
    out.m_98.x = _5259;
    out.m_98.y = _5249;
    out.m_98.z = _5267;
    out.m_98.w = _4616;
    float _5279 = _5273 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5281 = _5193 + _5189;
    float _5283 = _5277 * _5275;
    float _5285 = _5195 + _5227;
    float _5287 = _5279 * _4718;
    float _5289 = -_5279;
    float _5291 = _5289 + 1.0;
    float _5293 = -_5283;
    float _5295 = _5293 + 1.0;
    out.m_100.x = _5247;
    out.m_100.y = _5265;
    out.m_100.z = _5251;
    bool _5297 = _5039 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5299 = isnan(_5039);
    bool _5301 = _5297 || _5299;
    bool _5303 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5305 = _5301 || _5303;
    float _5307 = fma(_5295, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5283);
    out.m_102.x = _5281;
    out.m_102.y = _5285;
    out.m_102.z = _5269;
    float _5309 = _4729 * _5287;
    float _5311 = _5225 * _5307;
    float _5313 = _5307;
    float _5315 = _5291;
    float _5317 = _5273;
    if (!_4598)
    {
        _5313 = 1.0;
    }
    float _5319 = _5313;
    float _5321 = _4729 * _5291;
    float _5323 = _5319;
    if (_4598)
    {
        bool _5325 = _4716 >= _4666;
        bool _5327 = isnan(_4716);
        bool _5329 = _5325 || _5327;
        bool _5331 = isnan(_4666);
        bool _5333 = _5329 || _5331;
        float _5335 = float(_5333);
        _5323 = _5335;
    }
    float _5337 = _5323;
    float _5339 = _5311 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    if (!_5305)
    {
        _4630 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5341 = _4630;
    float _5343 = _5241 * _5339;
    float _5345 = precise::clamp(_5343, 0.0, 1.0);
    float _5347 = _5337 * _4869;
    float _5349 = _4803 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _5351 = _5341;
    float _5353 = _5341;
    if (!_5305)
    {
        _5315 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5355 = _5315;
    float _5357 = -_5345;
    float _5359 = fma(_5357, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5361 = _5355;
    float _5363 = _5355;
    if (!_5305)
    {
        _5317 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5365 = _5317;
    float _5367 = -_5347;
    float _5369 = fma(_5367, _5359, 1.0);
    float _5371 = precise::clamp(_5369, 0.0, 1.0);
    float _5373 = _5371 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5375 = _5371;
    float _5377 = _5365;
    float _5379 = _5365;
    if (!_5305)
    {
        _5375 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5381 = _5375;
    out.m_104.x = _5373;
    float _5383 = _5115 * _5287;
    float _5385 = fma(_5111, _5309, _4723);
    float _5387 = fma(_5113, _5309, _4725);
    float _5389 = _5381;
    float _5391 = _5381;
    if (!_5305)
    {
        _4749 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5393 = _4749;
    float _5395 = fma(_4729, _5383, _4727);
    float _5397 = _5393;
    float _5399 = _5393;
    if (!_5305)
    {
        _4751 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5401 = _4751;
    out.m_106.x = _5385;
    out.m_106.y = _5387;
    out.m_106.z = _5395;
    out.m_106.w = _5321;
    bool _5403 = !_5305;
    float _5405 = _5401;
    float _5407 = _5401;
    if (!_5403)
    {
        bool _5409 = _5039 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5411 = isnan(_5039);
        bool _5413 = _5409 || _5411;
        bool _5415 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5417 = _5413 || _5415;
        if (!_5417)
        {
            float _5419 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5421 = _5039 + _5419;
            float _5423 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5425 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5423;
            float _5427 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5429 = _5427 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5431 = 1.0 / _5425;
            float _5433 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5435 = _5433 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5437 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5439 = _5437 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5441 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5443 = _5441 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5445 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5447 = _5445 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5449 = _5421 * _5431;
            float _5451 = precise::clamp(_5449, 0.0, 1.0);
            float _5453 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5455 = _5453 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5457 = fma(_5451, _5429, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5459 = fma(_5451, _5455, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5461 = fma(_5451, _5435, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5463 = fma(_5451, _5439, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5465 = fma(_5451, _5443, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5467 = fma(_5451, _5447, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5407 = _5461;
            _5379 = _5465;
            _5399 = _5457;
            _5363 = _5463;
            _5353 = _5459;
            _5391 = _5467;
            _5469 = true;
        }
        else
        {
            bool _5471 = _5039 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5473 = isnan(_5039);
            bool _5475 = _5471 || _5473;
            bool _5477 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5479 = _5475 || _5477;
            if (!_5479)
            {
                _5397 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5481 = _5397;
            _5399 = _5481;
            if (!_5479)
            {
                _5405 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5483 = _5405;
            _5407 = _5483;
            if (!_5479)
            {
                _5351 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5485 = _5351;
            _5353 = _5485;
            if (!_5479)
            {
                _5361 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5487 = _5361;
            _5363 = _5487;
            if (!_5479)
            {
                _5377 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5489 = _5377;
            _5379 = _5489;
            if (!_5479)
            {
                _5389 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5491 = _5389;
            bool _5493 = !_5479;
            _5391 = _5491;
            if (!_5493)
            {
                bool _5495 = _5039 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5497 = isnan(_5039);
                bool _5499 = _5495 || _5497;
                bool _5501 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5503 = _5499 || _5501;
                if (!_5503)
                {
                    float _5505 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5507 = _5039 + _5505;
                    float _5509 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5511 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5509;
                    float _5513 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5515 = _5513 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5517 = 1.0 / _5511;
                    float _5519 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5521 = _5519 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5523 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5525 = _5523 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5527 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5529 = _5527 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5531 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5533 = _5531 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5535 = _5507 * _5517;
                    float _5537 = precise::clamp(_5535, 0.0, 1.0);
                    float _5539 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5541 = _5539 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5543 = fma(_5537, _5515, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5545 = fma(_5537, _5541, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5547 = fma(_5537, _5521, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5549 = fma(_5537, _5525, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5551 = fma(_5537, _5529, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5553 = fma(_5537, _5533, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5407 = _5547;
                    _5379 = _5551;
                    _5399 = _5543;
                    _5363 = _5549;
                    _5353 = _5545;
                    _5391 = _5553;
                    _5469 = true;
                }
                else
                {
                    _5407 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5379 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5399 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5363 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5353 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5391 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5469 = false;
    float _5555 = _5407;
    float _5557 = _5379;
    float _5559 = _5399;
    float _5561 = _5363;
    float _5563 = _5353;
    float _5565 = _5391;
    float _5567 = _5349 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5569 = fma(_5285, -0.5, 0.5);
    float _5571 = precise::clamp(_5569, 0.0, 1.0);
    float _5573 = -_5555;
    float _5575 = _5573 + _5557;
    float _5577 = -_5559;
    float _5579 = _5577 + _5561;
    out.m_63.x = _5567;
    float _5581 = fma(_5571, _5575, _5555);
    float _5583 = -_5563;
    float _5585 = _5583 + _5565;
    float _5587 = fma(_5571, _5579, _5559);
    float _5589 = _5581 * 0.586610972881317138671875;
    bool _5591 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5593 = fma(_5571, _5585, _5563);
    out.m_108.x = 0.0;
    float _5595 = fma(_5587, 0.298911988735198974609375, _5589);
    bool _5597 = _4803 > 0.0;
    bool _5599 = isnan(_4803);
    bool _5601 = _5597 || _5599;
    bool _5603 = isnan(0.0);
    bool _5605 = _5601 || _5603;
    float _5607 = fma(_5593, 0.114477999508380889892578125, _5595);
    float _5609 = -_5607;
    float _5611 = _5587 + _5609;
    float _5613 = -_5607;
    float _5615 = _5581 + _5613;
    float _5617 = -_5607;
    float _5619 = _5593 + _5617;
    float _5621 = fma(_5611, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5607);
    float _5623 = fma(_5615, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5607);
    float _5625 = fma(_5619, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5607);
    bool _5627 = !_5591;
    if (!_5627)
    {
        float _5629 = -_4542;
        float _5631 = _5629 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5633 = -_4544;
        float _5635 = _5633 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5637 = -_4546;
        float _5639 = _5637 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5641 = _5631 * _5631;
        float _5643 = fma(_5635, _5635, _5641);
        float _5645 = fma(_5639, _5639, _5643);
        float _5647 = sqrt(_5645);
        float _5649 = rsqrt(_5645);
        float _5651 = -_5647;
        float _5653 = _5651 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5655 = _5653 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5657 = precise::clamp(_5655, 0.0, 1.0);
        float _5659 = _5635 * _5649;
        float _5661 = _5631 * _5649;
        float _5663 = abs(_5657);
        float _5665 = log2(_5663);
        float _5667 = _5639 * _5649;
        float _5669 = _5659 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5671 = _5285 * _5661;
        float _5673 = -_5661;
        float _5675 = -_5669;
        float _5677 = fma(_5673, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5675);
        float _5679 = fma(_5281, _5659, _5671);
        float _5681 = -_5667;
        float _5683 = fma(_5681, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5677);
        float _5685 = fma(_5269, _5667, _5679);
        float _5687 = precise::clamp(_5685, 0.0, 1.0);
        float _5689 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5691 = _5683 + _5689;
        float _5693 = _5665 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5695 = _5691 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5697 = precise::clamp(_5695, 0.0, 1.0);
        float _5699 = exp2(_5693);
        float _5701 = _5699 * _5697;
        float _5703 = _5687 * _5701;
        float _5705 = _5703 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5707 = _5703 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5709 = _5703 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_108.x = _5705;
        out.m_108.y = _5707;
        out.m_108.z = _5709;
    }
    out.m_110.x = _5621;
    out.m_110.y = _5623;
    out.m_110.z = _5625;
    if (_5605)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _5711 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_63.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5711;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_110 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_108 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5469 = false;
    bool _725 = false;
    bool _505 = false;
    bool _271 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _124 = in.m_56.w;
    float _126 = in.m_58.w;
    float _128 = trunc(_124);
    int _131 = int(_128);
    float _133 = -_126;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_61.y = _135;
    bool _139 = _131 >= 1;
    float _141 = 0.0;
    float _143 = _126;
    float _145 = _135;
    if (!_139)
    {
        _141 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _147 = _141;
    if (!_139)
    {
        out.m_63.x = 0.0;
    }
    int _149 = 0;
    if (!_139)
    {
        float _151 = _147 * 5.0;
        _149 = as_type<int>(_151);
    }
    int _153 = _149;
    int _155 = _153;
    if (!_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5779 = as_type<float>(_153);
        out.gl_Position.z = _5779;
    }
    if (!_139)
    {
        return out;
    }
    bool _157 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _159 = isnan(_126);
    bool _161 = _157 || _159;
    bool _163 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _165 = _161 || _163;
    float _167 = float(_131);
    bool _169 = _135 >= _167;
    bool _171 = !_165;
    bool _173 = _169 || _171;
    float _175 = 1.0 / _167;
    if (_173)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _177 = _143;
    if (_173)
    {
        out.m_63.x = 0.0;
    }
    float _179 = _135 * _175;
    float _181 = _179;
    if (_173)
    {
        float _183 = _177 * 5.0;
        _155 = as_type<int>(_183);
    }
    int _185 = _155;
    out.m_61.x = _179;
    if (_173)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5842 = as_type<float>(_185);
        out.gl_Position.z = _5842;
    }
    if (_173)
    {
        return out;
    }
    float _187 = as_type<float>(int(gl_VertexIndex));
    float _189 = in.m_68.x;
    float _191 = in.m_68.y;
    float _193 = in.m_68.z;
    float _195 = in.m_70.x;
    float _197 = in.m_70.y;
    float _199 = in.m_70.z;
    float _201 = in.m_72.x;
    float _203 = in.m_72.y;
    float _205 = in.m_72.z;
    float _207 = in.m_74.x;
    float _209 = in.m_74.y;
    float _211 = in.m_74.z;
    int _213 = as_type<int>(_187) & 1;
    bool _215 = _213 != 0;
    int _217 = as_type<int>(_187) & 2;
    bool _219 = _217 != 0;
    bool _221 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _223 = !_215;
    float _225 = _223 ? (-0.5) : 0.5;
    bool _227 = !_219;
    float _229 = _227 ? (-0.5) : 0.5;
    float _231 = _191 * _197;
    float _233 = _191 * _203;
    float _235 = fma(_189, _195, _231);
    float _237 = _191 * _209;
    float _239 = fma(_189, _201, _233);
    float _241 = fma(_193, _199, _235);
    float _243 = fma(_189, _207, _237);
    float _245 = fma(_193, _205, _239);
    float _247 = fma(_193, _211, _243);
    bool _249 = !_221;
    bool _251 = false;
    float _269;
    if (!_249)
    {
        float _253 = in.m_76.x;
        float _255 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _257 = _253 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _259 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _261 = _259 * _255;
        float _263 = floor(_261);
        float _265 = -_263;
        float _267 = _261 + _265;
        _269 = _267;
        _271 = true;
    }
    else
    {
        _269 = _179;
    }
    _271 = false;
    float _273 = _269;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _277 = _273 + _275;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _281 = _273 + _279;
    bool _283 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _285 = isnan(_273);
    bool _287 = _283 || _285;
    bool _289 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _291 = _287 || _289;
    float _293 = float(_291);
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _301 = _299 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _303;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _309 = _307 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _313 = _273 + _311;
    float _315 = 1.0 / _301;
    bool _317 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _319 = 1.0 / _305;
    bool _321 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _323 = isnan(_273);
    bool _325 = _321 || _323;
    bool _327 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _329 = _325 || _327;
    float _331 = float(_329);
    float _333 = 1.0 / _297;
    float _335 = _277 * _315;
    bool _337 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _339 = isnan(_273);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _345 = _341 || _343;
    float _347 = float(_345);
    float _349 = 1.0 / _309;
    float _351 = _281 * _319;
    float _353 = -_293;
    float _355 = _353 + 1.0;
    bool _357 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _359 = isnan(_273);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = _347 * _355;
    float _371 = -_347;
    float _373 = _371 + 1.0;
    float _375 = _313 * _333;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _379 = _273 + _377;
    bool _381 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _383 = isnan(_273);
    bool _385 = _381 || _383;
    bool _387 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _389 = _385 || _387;
    float _391 = float(_389);
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _397;
    float _401 = _379 * _349;
    float _403 = _331 * _373;
    float _405 = -_331;
    float _407 = _405 + 1.0;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _417 = fma(_399, _375, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _419 = _367 * _407;
    float _421 = -_367;
    float _423 = _421 + 1.0;
    float _425 = fma(_411, _375, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _427 = fma(_395, _335, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _429 = fma(_415, _335, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _431 = _391 * _423;
    float _433 = -_391;
    float _435 = _433 + 1.0;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _437;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _441;
    float _445 = _425 * _431;
    float _447 = _417 * _431;
    float _449 = fma(_439, _351, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _451 = fma(_443, _351, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _453 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[143].x, _445);
    float _455 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[143].y, _447);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _465 = fma(_427, _419, _453);
    float _467 = fma(_429, _419, _455);
    float _469 = fma(_459, _401, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _471 = fma(_463, _401, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _473 = fma(_449, _403, _465);
    float _475 = fma(_451, _403, _467);
    float _477 = fma(_469, _369, _473);
    float _479 = fma(_471, _369, _475);
    float _481 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[147].x, _477);
    float _483 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[147].y, _479);
    bool _485 = !_317;
    float _503;
    if (!_485)
    {
        float _487 = in.m_76.x;
        float _489 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _491 = _487 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _493 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _495 = _493 * _489;
        float _497 = floor(_495);
        float _499 = -_497;
        float _501 = _495 + _499;
        _503 = _501;
        _505 = true;
    }
    else
    {
        _503 = _179;
    }
    _505 = false;
    float _507 = _503;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _511 = _507 + _509;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _515 = _513 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _523 = _521 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _525 = _507 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _527 = isnan(_507);
    bool _529 = _525 || _527;
    bool _531 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _533 = _529 || _531;
    float _535 = float(_533);
    float _537 = 1.0 / _515;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _539;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _547 = _507 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _549 = isnan(_507);
    bool _551 = _547 || _549;
    bool _553 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _555 = _551 || _553;
    float _557 = float(_555);
    float _559 = -_535;
    float _561 = _559 + 1.0;
    bool _563 = _507 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _565 = isnan(_507);
    bool _567 = _563 || _565;
    bool _569 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _571 = _567 || _569;
    float _573 = float(_571);
    float _575 = 1.0 / _519;
    float _577 = -_557;
    float _579 = _577 + 1.0;
    bool _581 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _583 = _535 * _579;
    float _585 = _541 * _537;
    float _587 = 1.0 / _523;
    bool _589 = _507 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _591 = isnan(_507);
    bool _593 = _589 || _591;
    bool _595 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _597 = _593 || _595;
    float _599 = float(_597);
    float _601 = fma(_585, _511, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _603;
    float _607 = -_599;
    float _609 = _607 + 1.0;
    float _611 = _599 * _561;
    float _613 = 1.0 / _545;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _617 = _615 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _619 = _573 * _609;
    float _621 = -_573;
    float _623 = _621 + 1.0;
    float _625 = _617 * _575;
    float _627 = _601 * _619;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _631 = _507 + _629;
    float _633 = _605 * _587;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _637 = _507 + _635;
    bool _639 = _507 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _641 = isnan(_507);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _655 = fma(_625, _631, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _657 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[115].x, _627);
    float _659 = fma(_633, _637, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _661 = -_649;
    float _663 = _661 + 1.0;
    float _665 = _653 * _613;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _669 = _507 + _667;
    float _671 = fma(_655, _611, _657);
    float _673 = _557 * _663;
    float _675 = fma(_665, _669, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _677 = fma(_659, _583, _671);
    float _679 = in.m_78.x;
    float _681 = in.m_78.y;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _685 = fma(_675, _673, _677);
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _689 = _683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _691 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[119].x, _685);
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _695 = _687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _697 = _691 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _699 = _693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_80.x = _695;
    out.m_80.y = _689;
    out.m_80.z = _699;
    out.m_80.w = _697;
    float _701 = _483 * _681;
    float _703 = _481 * _679;
    bool _705 = !_581;
    float _723;
    if (!_705)
    {
        float _707 = in.m_76.x;
        float _709 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _711 = _707 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _713 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[11].w, _135);
        float _715 = _713 * _709;
        float _717 = floor(_715);
        float _719 = -_717;
        float _721 = _715 + _719;
        _723 = _721;
        _725 = true;
    }
    else
    {
        _723 = _179;
    }
    _725 = false;
    float _727 = _723;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _731 = _727 + _729;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _735 = _733 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _739 = _737 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _741 = _727 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _743 = isnan(_727);
    bool _745 = _741 || _743;
    bool _747 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _749 = _745 || _747;
    float _751 = float(_749);
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _755 = _753 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _757 = _727 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _759 = isnan(_727);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _765 = _761 || _763;
    float _767 = float(_765);
    float _769 = 1.0 / _735;
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _773 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _771;
    float _775 = -_751;
    float _777 = _775 + 1.0;
    bool _779 = _727 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _781 = isnan(_727);
    bool _783 = _779 || _781;
    bool _785 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _787 = _783 || _785;
    float _789 = float(_787);
    bool _791 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _793 = 1.0 / _739;
    float _795 = 1.0 / _755;
    float _797 = _773 * _769;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _801 = _799 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _803 = _767 * _777;
    float _805 = -_767;
    float _807 = _805 + 1.0;
    float _809 = fma(_797, _731, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _811 = _727 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _813 = isnan(_727);
    bool _815 = _811 || _813;
    bool _817 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _819 = _815 || _817;
    float _821 = float(_819);
    float _823 = _789 * _807;
    float _825 = _801 * _793;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _827;
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _833 = _727 + _831;
    float _835 = _809 * _823;
    float _837 = -_789;
    float _839 = _837 + 1.0;
    float _841 = -_821;
    float _843 = _841 + 1.0;
    float _845 = fma(_825, _833, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _847 = _829 * _795;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _851 = _727 + _849;
    float _853 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[131].x, _835);
    float _855 = _751 * _843;
    float _857 = fma(_847, _851, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _859 = fma(_845, _803, _853);
    float _861 = fma(_857, _855, _859);
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _869 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[134].x, _861);
    float _871 = _863 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _873 = _865 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _875 = _867 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _877 = _869 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_82.x = _871;
    out.m_82.y = _873;
    out.m_82.z = _875;
    out.m_82.w = _877;
    bool _879 = !_791;
    float _881 = _873;
    float _883 = _877;
    if (!_879)
    {
        float _885 = in.m_76.x;
        float _887 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _889 = _885 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _891 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[14].x, _135);
        float _893 = _891 * _887;
        float _895 = floor(_893);
        float _897 = -_895;
        float _899 = _893 + _897;
        _181 = _899;
    }
    float _901 = _181;
    float _903 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _905 = int(_903);
    int _907 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _909 = _907 != 0;
    float _911 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _913 = int(_911);
    float _915 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _917 = int(_915);
    float _919 = float(_905);
    float _921 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _923 = int(_921);
    float _925 = float(_913);
    float _927 = 1.0 / _919;
    float _929 = float(_917);
    float _931 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _933 = int(_931);
    float _935 = float(uint(_923));
    float _937 = 1.0 / _925;
    float _939 = _927 * _135;
    float _941 = _927;
    if (_909)
    {
        float _943 = in.m_76.w;
        _941 = _943;
    }
    float _945 = _941;
    float _947 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _949 = int(_947);
    float _951 = float(uint(_933));
    int _953 = ~_933;
    int _955 = _953 + 1;
    float _957 = 1.0 / _929;
    float _959 = _937 * _135;
    float _961 = 1.0 / _935;
    float _963 = float(uint(_949));
    int _965 = ~_949;
    int _967 = _965 + 1;
    float _969 = _945;
    if (_909)
    {
        float _971 = _945 * 3.1415927410125732421875;
        _969 = _971;
    }
    float _973 = _969;
    float _975 = trunc(_939);
    int _977 = int(_975);
    float _979 = _957 * _135;
    if (_909)
    {
        float _981 = _973 * 0.15915493667125701904296875;
        _881 = _981;
    }
    float _983 = _881;
    float _985 = 1.0 / _951;
    int _987 = as_type<int>(_961) + (-2);
    int _989 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _991 = _989 != 0;
    float _993 = trunc(_959);
    int _995 = int(_993);
    float _997 = float(uint(_977));
    int _999 = ~_923;
    int _1001 = _999 + 1;
    float _1003 = as_type<float>(_987) * _997;
    float _1005 = 1.0 / _963;
    int _1007 = as_type<int>(_985) + (-2);
    if (_991)
    {
        _883 = 1.0;
    }
    float _1009 = _883;
    float _1011 = 0.0;
    float _1013 = _1009;
    if (_991)
    {
        _1011 = 1.0;
    }
    float _1015 = _1011;
    float _1017 = trunc(_979);
    int _1019 = int(_1017);
    float _1021 = float(uint(_995));
    int _1023 = 0;
    float _1025 = _1015;
    if (_991)
    {
        _1023 = 0;
    }
    int _1027 = _1023;
    float _1029 = as_type<float>(_1007) * _1021;
    int _1031 = as_type<int>(_1005) + (-2);
    float _1033 = trunc(_1003);
    float _1035 = precise::max(_1033, 0.0);
    uint _1038 = uint(_1035);
    float _1040 = float(uint(_1019));
    float _1042 = trunc(_1029);
    float _1044 = precise::max(_1042, 0.0);
    uint _1046 = uint(_1044);
    float _1048 = as_type<float>(_1031) * _1040;
    float _1050 = trunc(_1048);
    float _1052 = precise::max(_1050, 0.0);
    uint _1054 = uint(_1052);
    int _1056 = _1001 * int(_1038);
    int _1058 = _1056 + _977;
    float _1060 = float(uint(_1058));
    float _1062 = _983;
    int _1064 = _1027;
    if (_909)
    {
        float _1066 = _983 * 6.283185482025146484375;
        float _1068 = sin(_1066);
        _1062 = _1068;
    }
    float _1070 = _1062;
    float _1072 = _973;
    float _1074 = _1048;
    if (_991)
    {
        float _1076 = in.m_76.x;
        float _1078 = in.m_76.y;
        _1072 = _1076;
        _1074 = _1078;
    }
    float _1080 = _1072;
    float _1082 = _1074;
    int _1084 = _955 * int(_1046);
    int _1086 = _1084 + _995;
    float _1088 = as_type<float>(_987) * _1060;
    float _1090 = in.m_76.z;
    float _1092 = in.m_76.w;
    float _1094 = float(uint(_1086));
    int _1096 = _967 * int(_1054);
    int _1098 = _1096 + _1019;
    float _1100 = trunc(_1088);
    float _1102 = precise::max(_1100, 0.0);
    uint _1104 = uint(_1102);
    float _1106 = as_type<float>(_1007) * _1094;
    float _1108 = float(uint(_1098));
    float _1110 = as_type<float>(_1031) * _1108;
    float _1112 = trunc(_1106);
    float _1114 = precise::max(_1112, 0.0);
    uint _1116 = uint(_1114);
    int _1118 = as_type<int>(_1108);
    float _1120 = _1094;
    float _1122 = _1088;
    if (_991)
    {
        _1118 = 0;
    }
    int _1124 = _1118;
    float _1126 = _1080;
    float _1128 = _1082;
    int _1130 = _1124;
    if (_991)
    {
        _1120 = _1080;
    }
    float _1132 = _1120;
    float _1134 = trunc(_1110);
    float _1136 = precise::max(_1134, 0.0);
    uint _1138 = uint(_1136);
    float _1140 = 0.0;
    float _1142 = _1132;
    if (_991)
    {
        _1140 = _1082;
    }
    float _1144 = _1140;
    float _1146 = 0.0;
    float _1148 = _1144;
    if (_991)
    {
        _1146 = _1132;
    }
    float _1150 = _1146;
    float _1152 = _1150;
    if (_991)
    {
        _1122 = _1132;
    }
    float _1154 = _1122;
    float _1156 = _1154;
    if (!_991)
    {
        float _1158 = in.m_76.x;
        float _1160 = in.m_76.y;
        float _1162 = in.m_76.z;
        float _1164 = _1158 * 3.1415927410125732421875;
        float _1166 = _1164 * 0.15915493667125701904296875;
        float _1168 = _1160 * 3.1415927410125732421875;
        float _1170 = _1168 * 0.15915493667125701904296875;
        float _1172 = _1166 * 6.283185482025146484375;
        float _1174 = sin(_1172);
        float _1176 = _1170 * 6.283185482025146484375;
        float _1178 = sin(_1176);
        _1025 = 5.839270114898681640625;
        _1156 = _1162;
        _1013 = 7.345489978790283203125;
        _1126 = _1158;
        _1128 = _1160;
        _1142 = _1160;
        _1130 = 1;
        _1152 = _1174;
        _1064 = 2;
        _1148 = _1178;
    }
    float _1180 = _1025;
    float _1182 = _1156;
    float _1184 = _1013;
    float _1186 = _1126;
    float _1188 = _1128;
    float _1190 = _1142;
    int _1192 = _1130;
    float _1194 = _1152;
    int _1196 = _1064;
    float _1198 = _1148;
    float _1200 = _1180 * _1182;
    int _1202 = ~_923;
    int _1204 = _1202 + 1;
    float _1206 = _1184 * _1186;
    int _1208 = int(_1038) + int(_1104);
    float _1210 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1212 = _901 + _1210;
    int _1214 = ~_949;
    int _1216 = _1214 + 1;
    float _1218 = floor(_1206);
    int _1220 = int(_1054) + int(_1138);
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1224 = _901 + _1222;
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1228 = _901 + _1226;
    float _1230 = in.m_70.w;
    int _1232 = ~_933;
    int _1234 = _1232 + 1;
    float _1236 = floor(_1200);
    int _1238 = int(_1046) + int(_1116);
    int _1240 = _1204 * _1208;
    int _1242 = _1240 + _977;
    bool _1244 = _1092 > 0.5;
    int _1246 = _1216 * _1220;
    int _1248 = _1246 + _1019;
    bool _1250 = uint(_1242) >= uint(_923);
    float _1252 = -_1218;
    float _1254 = _1206 + _1252;
    bool _1256 = uint(_1248) >= uint(_949);
    int _1258 = _1234 * _1238;
    int _1260 = _1258 + _995;
    float _1262 = _1230;
    if (_909)
    {
        bool _1264 = _1070 > 0.5;
        _251 = _1264;
    }
    bool _1266 = _251;
    bool _1268 = !_1256;
    int _1270 = _1268 ? 0 : (-1);
    bool _1272 = !_1250;
    int _1274 = _1272 ? 0 : (-1);
    float _1276 = -_1236;
    float _1278 = _1200 + _1276;
    bool _1280 = _1090 > 0.5;
    int _1282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1284 = _1282 != 0;
    float _1286 = -_229;
    int _1288 = _1244 ? as_type<int>(_1286) : as_type<int>(_229);
    bool _1290 = uint(_1260) >= uint(_933);
    float _1292 = float(_923);
    bool _1294 = _1188 > 0.5;
    float _1296 = 0.0;
    if (!_909)
    {
        _1296 = _225;
    }
    float _1298 = _1296;
    float _1300 = _1254 * _1292;
    float _1302 = -_229;
    int _1304 = _1280 ? as_type<int>(_1302) : as_type<int>(_229);
    bool _1306 = !_1284;
    int _1308 = _1306 ? 0 : 1;
    float _1310 = _1298;
    if (_909)
    {
        float _1312 = -_225;
        float _1314 = _1266 ? _1312 : _225;
        _1310 = _1314;
    }
    float _1316 = _1310;
    float _1318 = trunc(_1300);
    int _1320 = int(_1318);
    int _1322 = ~_1220;
    int _1324 = _1322 + _1270;
    int _1326 = _1324 + 1;
    int _1328 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1330 = _1328 != 0;
    int _1332 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1334 = _1332 != 0;
    int _1336 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1338 = _1336 != 0;
    float _1340 = -_225;
    int _1342 = _1294 ? as_type<int>(_1340) : as_type<int>(_225);
    int _1344 = _949 * _1326;
    int _1346 = _1344 + _1019;
    int _1348 = ~_1208;
    int _1350 = _1348 + _1274;
    int _1352 = _1350 + 1;
    float _1354 = float(_977);
    int _1356 = _923 * _1352;
    int _1358 = _1356 + _977;
    float _1360 = float(_949);
    int _1362 = abs(_1308);
    bool _1364 = !_1338;
    float _1366 = _1364 ? _229 : as_type<float>(_1304);
    float _1368 = _1278 * _1360;
    bool _1370 = !_1334;
    float _1372 = _1370 ? _225 : as_type<float>(_1342);
    float _1374 = float(_1019);
    int _1376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1378 = _1376 != 0;
    int _1380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1382 = _1380 != 0;
    int _1384 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1386 = _1384 != 0;
    float _1388 = trunc(_1368);
    int _1390 = int(_1388);
    bool _1392 = _1354 >= _1292;
    bool _1394 = isnan(_1354);
    bool _1396 = _1392 || _1394;
    bool _1398 = isnan(_1292);
    bool _1400 = _1396 || _1398;
    float _1402 = float(_1400);
    int _1404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1406 = _1404 != 0;
    bool _1408 = _1374 >= _1360;
    bool _1410 = isnan(_1374);
    bool _1412 = _1408 || _1410;
    bool _1414 = isnan(_1360);
    bool _1416 = _1412 || _1414;
    float _1418 = float(_1416);
    bool _1420 = !_1382;
    int _1422 = _1420 ? 0 : 1;
    float _1424 = trunc(_1402);
    int _1426 = int(_1424);
    bool _1428 = !_1378;
    int _1430 = _1428 ? 0 : 1;
    bool _1432 = !_1386;
    int _1434 = _1432 ? 0 : 1;
    int _1436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1438 = _1436 != 0;
    int _1440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1442 = _1440 != 0;
    int _1444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1446 = _1444 != 0;
    bool _1448 = !_1406;
    int _1450 = _1448 ? 0 : 1;
    float _1452 = trunc(_1418);
    int _1454 = int(_1452);
    int _1456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1458 = _1456 != 0;
    bool _1460 = !_1442;
    int _1462 = _1460 ? 0 : 1;
    int _1464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1466 = _1464 != 0;
    int _1468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1470 = _1468 != 0;
    bool _1472 = !_1330;
    float _1474 = _1472 ? _229 : as_type<float>(_1288);
    int _1476 = _1320 * _1362;
    int _1478 = _1476 + _977;
    bool _1480 = !_1458;
    int _1482 = _1480 ? 0 : 1;
    float _1484 = _175 * _135;
    bool _1486 = !_1466;
    int _1488 = _1486 ? 0 : 1;
    bool _1490 = !_1290;
    int _1492 = _1490 ? 0 : (-1);
    float _1494 = _1292 * _1484;
    int _1496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1498 = _1496 != 0;
    int _1500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1502 = _1500 != 0;
    int _1504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1506 = _1504 != 0;
    int _1508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1510 = _1508 != 0;
    float _1512 = _1360 * _1484;
    bool _1514 = !_1438;
    int _1516 = _1514 ? 0 : 1;
    float _1518 = trunc(_1494);
    int _1520 = int(_1518);
    bool _1522 = _923 == 0;
    int _1524 = abs(_1482);
    bool _1526 = !_1502;
    int _1528 = _1526 ? 0 : 1;
    bool _1530 = _949 == 0;
    int _1532 = _1390 * _1524;
    int _1534 = _1532 + _1019;
    int _1536 = ~_1426;
    int _1538 = _1536 + 1;
    int _1540 = _1538 + 1;
    float _1542 = trunc(_1512);
    int _1544 = int(_1542);
    bool _1546 = !_1522;
    int _1548 = _1546 ? _1358 : (-1);
    int _1550 = ~_1454;
    int _1552 = _1550 + 1;
    int _1554 = _1552 + 1;
    bool _1556 = !_1530;
    int _1558 = _1556 ? _1346 : (-1);
    int _1560 = _1548 * _1540;
    int _1562 = _923 + (-1);
    int _1564 = abs(_1422);
    int _1566 = _1558 * _1554;
    int _1568 = _949 + (-1);
    int _1570 = _1426 * _1562;
    int _1572 = _1570 + _1560;
    int _1574 = abs(_1430);
    int _1576 = _1454 * _1568;
    int _1578 = _1576 + _1566;
    int _1580 = abs(_1434);
    int _1582 = _1572 * _1564;
    int _1584 = abs(_1462);
    int _1586 = _1520 * _1574;
    int _1588 = _1586 + _1582;
    int _1590 = abs(_1450);
    bool _1592 = !_1446;
    int _1594 = _1592 ? 0 : 1;
    int _1596 = _1478 * _1580;
    int _1598 = _1596 + _1588;
    int _1600 = abs(_1516);
    int _1602 = _1320 * _1590;
    int _1604 = _1602 + _1598;
    int _1606 = abs(_1594);
    int _1608 = _1578 * _1584;
    float _1610 = float(uint(_1604));
    int _1612 = abs(_1488);
    int _1614 = _1544 * _1600;
    int _1616 = _1614 + _1608;
    float _1618 = float(_933);
    float _1620 = as_type<float>(_987) * _1610;
    float _1622 = float(_995);
    int _1624 = _1534 * _1606;
    int _1626 = _1624 + _1616;
    int _1628 = ~_923;
    int _1630 = _1628 + 1;
    bool _1632 = _1622 >= _1618;
    bool _1634 = isnan(_1622);
    bool _1636 = _1632 || _1634;
    bool _1638 = isnan(_1618);
    bool _1640 = _1636 || _1638;
    float _1642 = float(_1640);
    int _1644 = _1390 * _1612;
    int _1646 = _1644 + _1626;
    float _1648 = trunc(_1620);
    float _1650 = precise::max(_1648, 0.0);
    uint _1652 = uint(_1650);
    float _1654 = _1184 * _1190;
    float _1656 = _1618 * _1484;
    int _1658 = ~_1238;
    int _1660 = _1658 + _1492;
    int _1662 = _1660 + 1;
    float _1664 = float(uint(_1646));
    int _1666 = ~_949;
    int _1668 = _1666 + 1;
    float _1670 = floor(_1654);
    int _1672 = _933 * _1662;
    int _1674 = _1672 + _995;
    float _1676 = as_type<float>(_1031) * _1664;
    bool _1678 = !_1470;
    int _1680 = _1678 ? 0 : 1;
    int _1682 = abs(_1528);
    int _1684 = abs(_1680);
    float _1686 = trunc(_1676);
    float _1688 = precise::max(_1686, 0.0);
    uint _1690 = uint(_1688);
    int _1692 = _1630 * int(_1652);
    int _1694 = _1692 + _1604;
    bool _1696 = _1090 > 0.5;
    int _1698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1700 = _1698 != 0;
    float _1702 = float(uint(_1694));
    float _1704 = trunc(_1642);
    int _1706 = int(_1704);
    bool _1708 = !_1498;
    int _1710 = _1708 ? 0 : 1;
    float _1712 = -_1670;
    float _1714 = _1654 + _1712;
    bool _1716 = _933 == 0;
    float _1718 = as_type<float>(_987) * _1702;
    int _1720 = abs(_1710);
    float _1722 = _1714 * _1618;
    bool _1724 = !_1716;
    int _1726 = _1724 ? _1674 : (-1);
    int _1728 = _1668 * int(_1690);
    int _1730 = _1728 + _1646;
    float _1732 = trunc(_1718);
    float _1734 = precise::max(_1732, 0.0);
    uint _1736 = uint(_1734);
    int _1738 = _933 + (-1);
    float _1740 = float(uint(_1730));
    int _1742 = ~_1706;
    int _1744 = _1742 + 1;
    int _1746 = _1744 + 1;
    float _1748 = trunc(_1656);
    int _1750 = int(_1748);
    float _1752 = as_type<float>(_1031) * _1740;
    int _1754 = _1726 * _1746;
    bool _1756 = !_1506;
    int _1758 = _1756 ? 0 : 1;
    float _1760 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1762 = _1760 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _1764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1766 = _1764 != 0;
    float _1768 = trunc(_1722);
    int _1770 = int(_1768);
    int _1772 = _1706 * _1738;
    int _1774 = _1772 + _1754;
    int _1776 = ~_923;
    int _1778 = _1776 + 1;
    float _1780 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1782 = _1780 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _1784 = int(_1652) + int(_1736);
    int _1786 = _1774 * _1682;
    int _1788 = abs(_1758);
    float _1790 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1792 = _1790 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1794 = trunc(_1752);
    float _1796 = precise::max(_1794, 0.0);
    uint _1798 = uint(_1796);
    int _1800 = _1750 * _1720;
    int _1802 = _1800 + _1786;
    int _1804 = ~_949;
    int _1806 = _1804 + 1;
    int _1808 = _1778 * _1784;
    int _1810 = _1808 + _1604;
    float _1812 = as_type<float>(_1758);
    float _1814 = as_type<float>(_1580);
    float _1816 = _1316;
    if (_1766)
    {
        float _1818 = in.m_76.x;
        _1812 = _1818;
    }
    float _1820 = _1812;
    int _1822 = ~_933;
    int _1824 = _1822 + 1;
    int _1826 = _1770 * _1684;
    int _1828 = _1826 + _995;
    bool _1830 = !_1510;
    int _1832 = _1830 ? 0 : 1;
    float _1834 = 1.0 / _1762;
    bool _1836 = uint(_1810) >= uint(_923);
    int _1838 = _1828 * _1788;
    int _1840 = _1838 + _1802;
    int _1842 = abs(_1832);
    bool _1844 = !_1836;
    int _1846 = _1844 ? 0 : (-1);
    int _1848 = int(_1690) + int(_1798);
    float _1850 = 1.0 / _1782;
    float _1852 = float(uint(_1478));
    int _1854 = _1806 * _1848;
    int _1856 = _1854 + _1646;
    int _1858 = ~_1784;
    int _1860 = _1858 + _1846;
    int _1862 = _1860 + 1;
    int _1864 = _1770 * _1842;
    int _1866 = _1864 + _1840;
    float _1868 = float(uint(_1534));
    float _1870 = as_type<float>(_987) * _1852;
    bool _1872 = uint(_1856) >= uint(_949);
    int _1874 = _923 * _1862;
    int _1876 = _1874 + _1604;
    float _1878 = -_225;
    int _1880 = _1696 ? as_type<int>(_1878) : as_type<int>(_225);
    float _1882 = trunc(_1870);
    float _1884 = precise::max(_1882, 0.0);
    uint _1886 = uint(_1884);
    float _1888 = as_type<float>(_1031) * _1868;
    float _1890 = float(uint(_1866));
    bool _1892 = !_1522;
    int _1894 = _1892 ? _1876 : (-1);
    float _1896 = as_type<float>(_1876);
    if (_1766)
    {
        float _1898 = _1820 * 3.1415927410125732421875;
        _1896 = _1898;
    }
    float _1900 = _1896;
    bool _1902 = !_1700;
    float _1904 = _1902 ? _225 : as_type<float>(_1880);
    float _1906 = as_type<float>(_1007) * _1890;
    float _1908 = trunc(_1888);
    float _1910 = precise::max(_1908, 0.0);
    uint _1912 = uint(_1910);
    int _1914 = _1894 & 3;
    bool _1916 = _1914 != 0;
    float _1918 = _1900;
    if (_1766)
    {
        float _1920 = _1900 * 0.15915493667125701904296875;
        _1918 = _1920;
    }
    float _1922 = _1918;
    int _1924 = ~_923;
    int _1926 = _1924 + 1;
    int _1928 = _1916 ? 0 : 1;
    int _1930 = _1894 & 3;
    bool _1932 = _1930 != 0;
    float _1934 = _1922;
    if (_1766)
    {
        float _1936 = _1922 * 6.283185482025146484375;
        float _1938 = sin(_1936);
        _1934 = _1938;
    }
    float _1940 = _1934;
    bool _1942 = !_1872;
    int _1944 = _1942 ? 0 : (-1);
    int _1946 = _1926 * int(_1886);
    int _1948 = _1946 + _1478;
    bool _1950 = uint(_1930) > 1u;
    int _1952 = ~_949;
    int _1954 = _1952 + 1;
    float _1956 = float(uint(_1948));
    float _1958 = trunc(_1906);
    float _1960 = precise::max(_1958, 0.0);
    uint _1962 = uint(_1960);
    int _1964 = ~_1848;
    int _1966 = _1964 + _1944;
    int _1968 = _1966 + 1;
    int _1970 = _1954 * int(_1912);
    int _1972 = _1970 + _1534;
    bool _1974 = _1950;
    if (!_1766)
    {
        _1814 = _229;
    }
    float _1976 = _1814;
    float _1978 = as_type<float>(_987) * _1956;
    int _1980 = ~_1928;
    int _1982 = _1980 + 1;
    int _1984 = _1982 + 1;
    float _1986 = float(uint(_1972));
    float _1988 = 1.0 / _1792;
    int _1990 = _1984;
    float _1992 = _1976;
    if (!_1950)
    {
        int _1994 = ~_1928;
        int _1996 = _1994 + 1;
        _1990 = _1996;
    }
    int _1998 = _1990;
    if (_1766)
    {
        bool _2000 = _1940 > 0.5;
        _1974 = _2000;
    }
    bool _2002 = _1974;
    float _2004 = as_type<float>(_1031) * _1986;
    int _2006 = _949 * _1968;
    int _2008 = _2006 + _1646;
    bool _2010 = _1188 > 0.5;
    int _2012 = _1824 * int(_1962);
    int _2014 = _2012 + _1866;
    if (_1766)
    {
        float _2016 = -_229;
        float _2018 = _2002 ? _2016 : _229;
        _1992 = _2018;
    }
    float _2020 = _1992;
    float _2022 = trunc(_1978);
    float _2024 = precise::max(_2022, 0.0);
    uint _2026 = uint(_2024);
    bool _2028 = _1930 != 3;
    bool _2030 = uint(_1930) >= 2u;
    float _2032 = float(uint(_2014));
    bool _2034 = !_1530;
    int _2036 = _2034 ? _2008 : (-1);
    float _2038 = trunc(_2004);
    float _2040 = precise::max(_2038, 0.0);
    uint _2042 = uint(_2040);
    float _2044 = as_type<float>(_1007) * _2032;
    int _2046 = _2030 ? 0 : 1;
    float _2048 = -_229;
    int _2050 = _2010 ? as_type<int>(_2048) : as_type<int>(_229);
    int _2052 = _2036 & 3;
    bool _2054 = _2052 != 0;
    float _2056 = trunc(_2044);
    float _2058 = precise::max(_2056, 0.0);
    uint _2060 = uint(_2058);
    int _2062 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2064 = _2062 != 0;
    int _2066 = ~_2046;
    int _2068 = _2066 + 1;
    int _2070 = _2068 + 1;
    int _2072 = _2070;
    if (_2028)
    {
        int _2074 = ~_2046;
        int _2076 = _2074 + 1;
        _2072 = _2076;
    }
    int _2078 = _2072;
    bool _2080 = uint(_2052) > 1u;
    int _2082 = int(_1886) + int(_2026);
    bool _2084 = !_2064;
    float _2086 = _2084 ? _229 : as_type<float>(_2050);
    int _2088 = ~_923;
    int _2090 = _2088 + 1;
    int _2092 = _2036 & 3;
    bool _2094 = _2092 != 0;
    int _2096 = int(_1912) + int(_2042);
    int _2098 = _2090 * _2082;
    int _2100 = _2098 + _1478;
    int _2102 = _2094 ? 0 : 1;
    int _2104 = ~_949;
    int _2106 = _2104 + 1;
    int _2108 = ~_2102;
    int _2110 = _2108 + 1;
    int _2112 = _2110 + 1;
    int _2114 = _2112;
    if (!_2080)
    {
        int _2116 = ~_2102;
        int _2118 = _2116 + 1;
        _2114 = _2118;
    }
    int _2120 = _2114;
    int _2122 = _2106 * _2096;
    int _2124 = _2122 + _1534;
    bool _2126 = uint(_2100) >= uint(_923);
    int _2128 = int(_1962) + int(_2060);
    bool _2130 = !_2126;
    int _2132 = _2130 ? 0 : (-1);
    bool _2134 = uint(_2124) >= uint(_949);
    float _2136 = in.m_56.x;
    float _2138 = in.m_56.y;
    float _2140 = in.m_56.z;
    bool _2142 = _2052 != 3;
    float _2144 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2146 = _2144 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _2148 = ~_933;
    int _2150 = _2148 + 1;
    float _2152 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2154 = _2152 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2156 = !_1932;
    int _2158 = _2156 ? 0 : 1;
    bool _2160 = uint(_2052) >= 2u;
    float _2162 = 1.0 / _2146;
    int _2164 = _2150 * _2128;
    int _2166 = _2164 + _1866;
    bool _2168 = !_2054;
    int _2170 = _2168 ? 0 : 1;
    int _2172 = _2160 ? 0 : 1;
    bool _2174 = _2052 != 3;
    float _2176 = 1.0 / _2154;
    bool _2178 = uint(_2166) >= uint(_933);
    int _2180 = ~_2172;
    int _2182 = _2180 + 1;
    int _2184 = _2182 + 1;
    float _2186 = _197 * _2138;
    float _2188 = _203 * _2138;
    float _2190 = _209 * _2138;
    int _2192 = _2184;
    if (_2142)
    {
        int _2194 = ~_2172;
        int _2196 = _2194 + 1;
        _2192 = _2196;
    }
    int _2198 = _2192;
    float _2200 = fma(_195, _2136, _2186);
    float _2202 = fma(_201, _2136, _2188);
    float _2204 = fma(_207, _2136, _2190);
    float _2206 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2208 = _2206 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2210 = fma(_199, _2140, _2200);
    float _2212 = fma(_211, _2140, _2204);
    float _2214 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2216 = _2214 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2218 = fma(_205, _2140, _2202);
    float _2220 = 1.0 / _2208;
    float _2222 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2224 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2222;
    float _2226 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2228 = _2226 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2230 = in.m_72.w;
    float _2232 = _2224 * _1834;
    float _2234 = _2228 * _1850;
    float _2236 = 1.0 / _2216;
    float _2238 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2240 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2238;
    float _2242 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2244 = _2242 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _2246 = _901 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2248 = isnan(_901);
    bool _2250 = _2246 || _2248;
    bool _2252 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2254 = _2250 || _2252;
    float _2256 = float(_2254);
    float _2258 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2260 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2258;
    float _2262 = _2244 * _1988;
    bool _2264 = _901 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2266 = isnan(_901);
    bool _2268 = _2264 || _2266;
    bool _2270 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2272 = _2268 || _2270;
    float _2274 = float(_2272);
    float _2276 = _2260 * _2220;
    float _2278 = -_2256;
    float _2280 = _2278 + 1.0;
    float _2282 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2284 = _2282 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2286 = _901 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2288 = isnan(_901);
    bool _2290 = _2286 || _2288;
    bool _2292 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2294 = _2290 || _2292;
    float _2296 = float(_2294);
    float _2298 = -_2274;
    float _2300 = _2298 + 1.0;
    float _2302 = _2274 * _2280;
    float _2304 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2306 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2304;
    bool _2308 = _901 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2310 = isnan(_901);
    bool _2312 = _2308 || _2310;
    bool _2314 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2316 = _2312 || _2314;
    float _2318 = float(_2316);
    float _2320 = _2284 * _2236;
    float _2322 = _2296 * _2300;
    float _2324 = -_2296;
    float _2326 = _2324 + 1.0;
    bool _2328 = !_2174;
    int _2330 = _2328 ? 0 : (-1);
    float _2332 = _2306 * _2162;
    bool _2334 = !_2134;
    int _2336 = _2334 ? 0 : (-1);
    float _2338 = _2318 * _2326;
    int _2340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2342 = _2340 != 0;
    float _2344 = _2240 * _2176;
    int _2346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2348 = _2346 != 0;
    float _2350 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2352 = _901 + _2350;
    int _2354 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2356 = _2354 != 0;
    float _2358 = -_2318;
    float _2360 = _2358 + 1.0;
    bool _2362 = !_2178;
    int _2364 = _2362 ? 0 : (-1);
    float _2366 = fma(_2232, _2352, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2368 = _1186 > 0.5;
    float _2370 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2372 = _901 + _2370;
    bool _2374 = _901 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2376 = isnan(_901);
    bool _2378 = _2374 || _2376;
    bool _2380 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2382 = _2378 || _2380;
    float _2384 = float(_2382);
    float _2386 = fma(_2344, _1212, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2388 = fma(_2234, _2372, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _2390 = _901 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2392 = isnan(_901);
    bool _2394 = _2390 || _2392;
    bool _2396 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2398 = _2394 || _2396;
    float _2400 = float(_2398);
    float _2402 = _2384 * _2360;
    float _2404 = -_225;
    int _2406 = _2368 ? as_type<int>(_2404) : as_type<int>(_225);
    float _2408 = -_2384;
    float _2410 = _2408 + 1.0;
    int _2412 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2414 = _2412 != 0;
    float _2416 = -_2400;
    float _2418 = _2416 + 1.0;
    bool _2420 = _901 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2422 = isnan(_901);
    bool _2424 = _2420 || _2422;
    bool _2426 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2428 = _2424 || _2426;
    float _2430 = float(_2428);
    float _2432 = _2400 * _2410;
    bool _2434 = _901 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2436 = isnan(_901);
    bool _2438 = _2434 || _2436;
    bool _2440 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2442 = _2438 || _2440;
    float _2444 = float(_2442);
    float _2446 = in.m_74.w;
    float _2448 = _2218 + _2230;
    float _2450 = _2430 * _2418;
    float _2452 = -_2430;
    float _2454 = _2452 + 1.0;
    float _2456 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2458 = _901 + _2456;
    float _2460 = _2210 + _1230;
    float _2462 = _2444 * _2454;
    float _2464 = fma(_2276, _2458, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2466 = fma(_2262, _1224, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2468 = _2366 * _2462;
    float _2470 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2472 = _901 + _2470;
    bool _2474 = !_2414;
    float _2476 = _2474 ? _225 : as_type<float>(_2406);
    float _2478 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    bool _2480 = _1192 != 1;
    float _2482 = -_2444;
    float _2484 = _2482 + 1.0;
    float _2486 = fma(_2320, _2472, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2488 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2490 = fma(_2484, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2468);
    float _2492 = fma(_2332, _1228, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2494 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2496 = fma(_2388, _2450, _2490);
    float _2498 = _1186 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2500 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2502 = _2212 + _2446;
    float _2504 = _2472;
    float _2506 = _2458;
    float _2508 = _2490;
    float _2510 = _2444;
    float _2512 = _2446;
    if (!_2480)
    {
        _2504 = _1188;
    }
    float _2514 = _2504;
    float _2516 = -_2494;
    float _2518 = fma(_2498, 2.0, _2516);
    float _2520 = _2514;
    if (!_2480)
    {
        _2506 = _1188;
    }
    float _2522 = _2506;
    float _2524 = _1194 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2526 = _2522;
    if (!_2480)
    {
        _2508 = _1090;
    }
    float _2528 = _2508;
    float _2530 = _2020 + (-0.5);
    float _2532 = _2528;
    if (!_2480)
    {
        _2510 = _1090;
    }
    float _2534 = _2510;
    float _2536 = -_135;
    float _2538 = fma(_2536, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2518);
    float _2540 = _2534;
    if (_2480)
    {
        _2520 = _1186;
    }
    float _2542 = _2520;
    if (_2480)
    {
        _2526 = _1186;
    }
    float _2544 = _2526;
    if (_2480)
    {
        _2532 = _1188;
    }
    float _2546 = _2532;
    float _2548 = _2542 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_2480)
    {
        _2540 = _1188;
    }
    float _2550 = _2540;
    bool _2552 = _1196 != 2;
    float _2554 = fma(_2386, _2432, _2496);
    float _2556 = _1188 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2558 = fma(_2556, -2.0, _2500);
    float _2560 = fma(_2466, _2402, _2554);
    float _2562 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2564 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2566 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2568 = _2448 + _2566;
    float _2570 = fma(_1194, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2562);
    float _2572 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2574 = _2460 + _2572;
    float _2576 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2564);
    float _2578 = _1198 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2580 = _2568 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2582 = -_2478;
    float _2584 = fma(_2524, 2.0, _2582);
    float _2586 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2588 = _2502 + _2586;
    float _2590 = fma(_2578, -2.0, _2488);
    float _2592 = fma(_2574, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2580);
    if (_2552)
    {
        _1262 = _1188;
    }
    float _2594 = _1262;
    float _2596 = fma(_2464, _2338, _2560);
    float _2598 = _2594;
    if (_2552)
    {
        _2512 = _1186;
    }
    float _2600 = _2512;
    float _2602 = fma(_2588, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2592);
    float _2604 = _2600;
    if (!_2552)
    {
        _2604 = _1090;
    }
    float _2606 = _2604;
    float _2608 = -_135;
    float _2610 = fma(_2608, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2584);
    if (!_2552)
    {
        _2598 = _1186;
    }
    float _2612 = _2598;
    float _2614 = _1316 + 0.5;
    bool _2616 = _2602 >= 0.0;
    float _2618 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2620 = fma(_2614, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2610);
    float _2622 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2590);
    float _2624 = fma(_2544, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2618);
    int _2626 = _2036 >> 31;
    float _2628 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2630 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2558);
    float _2632 = -_2530;
    float _2634 = -_2622;
    float _2636 = fma(_2632, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2634);
    int _2638 = _2626 & 3;
    float _2640 = fma(_2550, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2628);
    float _2642 = _2086 + (-0.5);
    float _2644 = fma(_2486, _2322, _2596);
    int _2646 = _2036 + _2638;
    float _2648 = _2546 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2650 = float(uint(_1828));
    float _2652 = -_2642;
    float _2654 = -_2630;
    float _2656 = fma(_2652, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2654);
    int _2658 = _2646 >> 2;
    float _2660 = _2606 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2662 = as_type<float>(_1007) * _2650;
    int _2664 = _2658 << 4;
    int _2666 = _2664 + 656;
    float _2668 = fma(_2492, _2302, _2644);
    float _2670 = _2476 + 0.5;
    float _2672 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    uint _2674 = uint(int(uint(_2666) >> uint(2)));
    uint _2676 = uint(int(uint(int(_2674)) >> uint(2)));
    int _2678 = int(_2674) & 3;
    float _2680 = (*spvDescriptorSet0.vp_c9)._m0[int(_2676)][_2678];
    int _2682 = int(_2674) + 1;
    uint _2684 = uint(int(uint(_2682) >> uint(2)));
    int _2686 = _2682 & 3;
    float _2688 = (*spvDescriptorSet0.vp_c9)._m0[int(_2684)][_2686];
    float _2690 = trunc(_2662);
    float _2692 = precise::max(_2690, 0.0);
    uint _2694 = uint(_2692);
    float _2696 = -_2672;
    float _2698 = fma(_2660, 2.0, _2696);
    float _2700 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2576);
    float _2702 = fma(_2670, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2538);
    int _2704 = ~_933;
    int _2706 = _2704 + 1;
    float _2708 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _2710 = _2666 + 8;
    uint _2712 = uint(int(uint(_2710) >> uint(2)));
    uint _2714 = uint(int(uint(int(_2712)) >> uint(2)));
    int _2716 = int(_2712) & 3;
    float _2718 = (*spvDescriptorSet0.vp_c9)._m0[int(_2714)][_2716];
    int _2720 = int(_2712) + 1;
    uint _2722 = uint(int(uint(_2720) >> uint(2)));
    int _2724 = _2720 & 3;
    float _2726 = (*spvDescriptorSet0.vp_c9)._m0[int(_2722)][_2724];
    float _2728 = _2612 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2730 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2732 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2570);
    float _2734 = fma(_2728, -2.0, _2708);
    int _2736 = abs(_2120);
    float _2738 = -_135;
    float _2740 = fma(_2738, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2698);
    float _2742 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2744 = _2706 * int(_2694);
    int _2746 = _2744 + _1828;
    int _2748 = ~_2128;
    int _2750 = _2748 + _2364;
    int _2752 = _2750 + 1;
    float _2754 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2756 = -_2742;
    float _2758 = fma(_2548, 2.0, _2756);
    float _2760 = -_2700;
    float _2762 = _2760 + 1.0;
    float _2764 = float(uint(_2746));
    float _2766 = -_2732;
    float _2768 = _2766 + 1.0;
    float _2770 = fma(_2256, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2668);
    int _2772 = abs(_2170);
    int _2774 = _933 * _2752;
    int _2776 = _2774 + _1866;
    float _2778 = -_2768;
    float _2780 = fma(_2778, _1316, _2620);
    if (_2616)
    {
        _1816 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2782 = _1816;
    float _2784 = as_type<float>(_1007) * _2764;
    float _2786 = fma(_2762, _2020, _2636);
    float _2788 = _2730 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2790 = as_type<int>(_2730);
    if (_2616)
    {
        float _2792 = _2782 * 5.0;
        _2790 = as_type<int>(_2792);
    }
    int _2794 = _2790;
    out.m_84.x = _2780;
    out.m_84.y = _2786;
    float _2796 = trunc(_2784);
    float _2798 = precise::max(_2796, 0.0);
    uint _2800 = uint(_2798);
    int _2802 = ~_2096;
    int _2804 = _2802 + _2336;
    int _2806 = _2804 + 1;
    float _2808 = _1904 + 0.5;
    if (_2616)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9703 = as_type<float>(_2794);
        out.gl_Position.z = _9703;
    }
    int _2810 = ~_933;
    int _2812 = _2810 + 1;
    float _2814 = -_135;
    float _2816 = fma(_2814, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2758);
    int _2818 = _949 * _2806;
    int _2820 = _2818 + _1534;
    int _2822 = abs(_1998);
    float _2824 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2624);
    int _2826 = abs(_2198);
    float _2828 = fma(_2788, _2808, _2816);
    int _2830 = abs(_2330);
    float _2832 = _2754 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2834 = ~_2822;
    int _2836 = _2834 + 1;
    int _2838 = _2836 + 1;
    float _2840 = _1474 + (-0.5);
    int _2842 = ~_2736;
    int _2844 = _2842 + 1;
    int _2846 = _2844 + 1;
    float _2848 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2850 = int(_2848);
    float _2852 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2640);
    int _2854 = int(_2694) + int(_2800);
    int _2856 = _2846 * as_type<int>(_2688);
    int _2858 = ~_2772;
    int _2860 = _2858 + 1;
    int _2862 = _2860 + 1;
    float _2864 = -_2852;
    float _2866 = _2864 + 1.0;
    int _2868 = _1894 >> 31;
    int _2870 = _2812 * _2854;
    int _2872 = _2870 + _1828;
    int _2874 = _2862 * as_type<int>(_2680);
    int _2876 = _2874 + _2856;
    int _2878 = _2868 & 3;
    out.m_86.x = _2770;
    int _2880 = ~_2826;
    int _2882 = _2880 + 1;
    int _2884 = _2882 + 1;
    float _2886 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2888 = _1894 + _2878;
    int _2890 = as_type<int>(_2866);
    if (_2616)
    {
        out.m_63.x = 0.0;
    }
    int _2892 = ~_2830;
    int _2894 = _2892 + 1;
    int _2896 = _2894 + 1;
    int _2898 = _2884 * as_type<int>(_2718);
    int _2900 = _2898 + _2876;
    bool _2902 = !_1716;
    int _2904 = _2902 ? _2776 : (-1);
    float _2906 = fma(_2648, -2.0, _2886);
    bool _2908 = !_2348;
    int _2910 = _2908 ? 0 : 1;
    int _2912 = _2896 * as_type<int>(_2726);
    int _2914 = _2912 + _2900;
    int _2916 = _2904 >> 31;
    float _2918 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2906);
    float _2920 = float(uint(_2850));
    int _2922 = _2916 & 3;
    float _2924 = -_2832;
    float _2926 = -_2918;
    float _2928 = fma(_2924, _2840, _2926);
    int _2930 = abs(_2910);
    float _2932 = 1.0 / _2920;
    int _2934 = abs(_2850);
    float _2936 = fma(_1474, _2866, _2928);
    int _2938 = _2904 + _2922;
    int _2940 = _2888 >> 2;
    float _2942 = float(uint(_2934));
    int _2944 = ~_2930;
    int _2946 = _2944 + 1;
    int _2948 = _2946 + 1;
    int _2950 = _2938 >> 2;
    float _2952 = 1.0 / _2942;
    int _2954 = _2940 << 4;
    int _2956 = _2954 + 368;
    int _2958 = _2914 * _2948;
    bool _2960 = _1930 != 3;
    bool _2962 = !_1530;
    int _2964 = _2962 ? _2820 : (-1);
    uint _2966 = uint(int(uint(_2956) >> uint(2)));
    uint _2968 = uint(int(uint(int(_2966)) >> uint(2)));
    int _2970 = int(_2966) & 3;
    float _2972 = (*spvDescriptorSet0.vp_c9)._m0[int(_2968)][_2970];
    int _2974 = int(_2966) + 1;
    uint _2976 = uint(int(uint(_2974) >> uint(2)));
    int _2978 = _2974 & 3;
    float _2980 = (*spvDescriptorSet0.vp_c9)._m0[int(_2976)][_2978];
    int _2982 = _2950 << 4;
    int _2984 = _2982 + 800;
    int _2986 = _2904 & 3;
    bool _2988 = _2986 != 0;
    int _2990 = _2964 * _2930;
    int _2992 = _2990 + _2958;
    bool _2994 = !_2960;
    int _2996 = _2994 ? 0 : (-1);
    bool _2998 = uint(_2872) >= uint(_933);
    uint _3000 = uint(int(uint(_2984) >> uint(2)));
    uint _3002 = uint(int(uint(int(_3000)) >> uint(2)));
    int _3004 = int(_3000) & 3;
    float _3006 = (*spvDescriptorSet0.vp_c9)._m0[int(_3002)][_3004];
    int _3008 = int(_3000) + 1;
    uint _3010 = uint(int(uint(_3008) >> uint(2)));
    int _3012 = _3008 & 3;
    float _3014 = (*spvDescriptorSet0.vp_c9)._m0[int(_3010)][_3012];
    bool _3016 = !_2988;
    int _3018 = _3016 ? 0 : 1;
    int _3020 = _2904 & 3;
    bool _3022 = _3020 != 0;
    int _3024 = as_type<int>(_2932) + (-2);
    int _3026 = _3022 ? 0 : 1;
    int _3028 = _2984 + 8;
    uint _3030 = uint(int(uint(_3028) >> uint(2)));
    uint _3032 = uint(int(uint(int(_3030)) >> uint(2)));
    int _3034 = int(_3030) & 3;
    float _3036 = (*spvDescriptorSet0.vp_c9)._m0[int(_3032)][_3034];
    int _3038 = int(_3030) + 1;
    uint _3040 = uint(int(uint(_3038) >> uint(2)));
    int _3042 = _3038 & 3;
    float _3044 = (*spvDescriptorSet0.vp_c9)._m0[int(_3040)][_3042];
    float _3046 = float(uint(_2992));
    bool _3048 = uint(_2986) >= 2u;
    int _3050 = ~_2082;
    int _3052 = _3050 + _2132;
    int _3054 = _3052 + 1;
    float _3056 = as_type<float>(_3024) * _3046;
    int _3058 = abs(_2992);
    int _3060 = _2956 + 8;
    uint _3062 = uint(int(uint(_3060) >> uint(2)));
    uint _3064 = uint(int(uint(int(_3062)) >> uint(2)));
    int _3066 = int(_3062) & 3;
    float _3068 = (*spvDescriptorSet0.vp_c9)._m0[int(_3064)][_3066];
    int _3070 = int(_3062) + 1;
    uint _3072 = uint(int(uint(_3070) >> uint(2)));
    int _3074 = _3070 & 3;
    float _3076 = (*spvDescriptorSet0.vp_c9)._m0[int(_3072)][_3074];
    int _3078 = _3048 ? 0 : 1;
    int _3080 = _923 * _3054;
    int _3082 = _3080 + _1478;
    bool _3084 = uint(_2986) > 1u;
    float _3086 = trunc(_3056);
    float _3088 = precise::max(_3086, 0.0);
    uint _3090 = uint(_3088);
    int _3092 = as_type<int>(_2952) + (-2);
    float _3094 = float(uint(_3058));
    bool _3096 = !_2998;
    int _3098 = _3096 ? 0 : (-1);
    bool _3100 = _2986 != 3;
    float _3102 = as_type<float>(_3092) * _3094;
    int _3104 = ~_2854;
    int _3106 = _3104 + _3098;
    int _3108 = _3106 + 1;
    int _3110 = ~_3026;
    int _3112 = _3110 + 1;
    int _3114 = _3112 + 1;
    float _3116 = trunc(_3102);
    float _3118 = precise::max(_3116, 0.0);
    uint _3120 = uint(_3118);
    int _3122 = _3114;
    if (!_3084)
    {
        int _3124 = ~_3026;
        int _3126 = _3124 + 1;
        _3122 = _3126;
    }
    int _3128 = _3122;
    int _3130 = _933 * _3108;
    int _3132 = _3130 + _1828;
    int _3134 = ~_2850;
    int _3136 = _3134 + 1;
    bool _3138 = _2986 != 3;
    int _3140 = _2838 * as_type<int>(_2980);
    int _3142 = ~_3078;
    int _3144 = _3142 + 1;
    int _3146 = _3144 + 1;
    int _3148 = _3146;
    if (_3100)
    {
        int _3150 = ~_3078;
        int _3152 = _3150 + 1;
        _3148 = _3152;
    }
    int _3154 = _3148;
    int _3156 = abs(_2158);
    int _3158 = _3136 * int(_3090);
    int _3160 = _3158 + _2992;
    int _3162 = ~_2934;
    int _3164 = _3162 + 1;
    int _3166 = abs(_3128);
    float _3168 = float(uint(_3160));
    int _3170 = _3164 * int(_3120);
    int _3172 = _3170 + _3058;
    int _3174 = ~_3166;
    int _3176 = _3174 + 1;
    int _3178 = _3176 + 1;
    int _3180 = ~_3156;
    int _3182 = _3180 + 1;
    int _3184 = _3182 + 1;
    float _3186 = as_type<float>(_3024) * _3168;
    float _3188 = float(uint(_3172));
    int _3190 = _3178 * as_type<int>(_3014);
    int _3192 = abs(_3018);
    float _3194 = trunc(_3186);
    float _3196 = precise::max(_3194, 0.0);
    uint _3198 = uint(_3196);
    int _3200 = _3184 * as_type<int>(_2972);
    int _3202 = _3200 + _3140;
    float _3204 = as_type<float>(_3092) * _3188;
    int _3206 = abs(_2078);
    int _3208 = abs(_3154);
    int _3210 = ~_3192;
    int _3212 = _3210 + 1;
    int _3214 = _3212 + 1;
    float _3216 = trunc(_3204);
    float _3218 = precise::max(_3216, 0.0);
    uint _3220 = uint(_3218);
    int _3222 = abs(_2996);
    int _3224 = ~_3206;
    int _3226 = _3224 + 1;
    int _3228 = _3226 + 1;
    int _3230 = _3214 * as_type<int>(_3006);
    int _3232 = _3230 + _3190;
    int _3234 = ~_3208;
    int _3236 = _3234 + 1;
    int _3238 = _3236 + 1;
    int _3240 = ~_3222;
    int _3242 = _3240 + 1;
    int _3244 = _3242 + 1;
    int _3246 = _3228 * as_type<int>(_3068);
    int _3248 = _3246 + _3202;
    int _3250 = ~_2850;
    int _3252 = _3250 + 1;
    int _3254 = _3238 * as_type<int>(_3036);
    int _3256 = _3254 + _3232;
    bool _3258 = !_3138;
    int _3260 = _3258 ? 0 : (-1);
    int _3262 = _3244 * as_type<int>(_3076);
    int _3264 = _3262 + _3248;
    bool _3266 = !_2342;
    int _3268 = _3266 ? 0 : 1;
    int _3270 = int(_3090) + int(_3198);
    int _3272 = abs(_3260);
    int _3274 = abs(_3268);
    int _3276 = _3252 * _3270;
    int _3278 = _3276 + _2992;
    int _3280 = ~_3272;
    int _3282 = _3280 + 1;
    int _3284 = _3282 + 1;
    int _3286 = int(_3120) + int(_3220);
    int _3288 = ~_2934;
    int _3290 = _3288 + 1;
    int _3292 = _3284 * as_type<int>(_3044);
    int _3294 = _3292 + _3256;
    int _3296 = ~_3274;
    int _3298 = _3296 + 1;
    int _3300 = _3298 + 1;
    bool _3302 = uint(_3278) >= uint(_2850);
    int _3304 = _3290 * _3286;
    int _3306 = _3304 + _3058;
    bool _3308 = !_2356;
    int _3310 = _3308 ? 0 : 1;
    int _3312 = _3264 * _3300;
    bool _3314 = !_3302;
    int _3316 = _3314 ? 0 : (-1);
    float _3318 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3320 = abs(_3310);
    bool _3322 = uint(_3306) >= uint(_2934);
    int _3324 = _2992 ^ _2850;
    int _3326 = ~_3270;
    int _3328 = _3326 + _3316;
    int _3330 = _3328 + 1;
    int _3332 = ~_3320;
    int _3334 = _3332 + 1;
    int _3336 = _3334 + 1;
    bool _3338 = !_3322;
    int _3340 = _3338 ? 0 : (-1);
    int _3342 = _2850 * _3330;
    int _3344 = _3342 + _2992;
    uint _3346 = uint(int(uint(_3324) >> uint(31)));
    int _3348 = _3294 * _3336;
    bool _3350 = _2850 == 0;
    float _3352 = _3318 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3354 = _2850 == 0;
    float _3356 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3358 = ~_3340;
    int _3360 = _3286 + _3358;
    int _3362 = _3360 + 1;
    float _3364 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2734);
    int _3366 = ~int(_3346);
    int _3368 = _3366 + 1;
    bool _3370 = !_1522;
    int _3372 = _3370 ? _3082 : (-1);
    int _3374 = _3362 ^ _3368;
    bool _3376 = !_3350;
    int _3378 = _3376 ? _3344 : (-1);
    int _3380 = _3372 * _3274;
    int _3382 = _3380 + _3312;
    int _3384 = ~_3368;
    int _3386 = _3384 + _3374;
    int _3388 = _3386 + 1;
    float _3390 = float(_3378);
    bool _3392 = !_3354;
    int _3394 = _3392 ? _3388 : (-1);
    float _3396 = fma(_3352, _3390, _2740);
    float _3398 = _3356 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3400 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3402 = _1372 + 0.5;
    float _3404 = float(_3394);
    float _3406 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3400);
    bool _3408 = !_1716;
    int _3410 = _3408 ? _3132 : (-1);
    float _3412 = fma(_3352, _3402, _3396);
    float _3414 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3416 = -_3364;
    float _3418 = fma(_3398, _3404, _3416);
    float _3420 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3406);
    float _3422 = _1366 + (-0.5);
    float _3424 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3414);
    int _3426 = _3410 * _3320;
    int _3428 = _3426 + _3348;
    float _3430 = -_3420;
    float _3432 = _3430 + 1.0;
    float _3434 = -_3398;
    float _3436 = fma(_3434, _3422, _3418);
    float _3438 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3424);
    float _3440 = -_3432;
    float _3442 = fma(_1372, _3440, _3412);
    float _3444 = _2568 * _2568;
    float _3446 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3448 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3450 = -_3438;
    float _3452 = _3450 + 1.0;
    float _3454 = fma(_2574, _2574, _3444);
    float _3456 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3446);
    float _3458 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3448);
    float _3460 = -_3452;
    float _3462 = fma(_2476, _3460, _2702);
    float _3464 = fma(_2588, _2588, _3454);
    float _3466 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3456);
    float _3468 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3458);
    float _3470 = float(_3382);
    float _3472 = -_3466;
    float _3474 = _3472 + 1.0;
    float _3476 = rsqrt(_3464);
    float _3478 = -_2824;
    float _3480 = _3478 + 1.0;
    float _3482 = -_3468;
    float _3484 = _3482 + 1.0;
    float _3486 = fma(_2086, _3474, _2656);
    int _3488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3490 = _3488 != 0;
    int _3492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3494 = _3492 != 0;
    int _3496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3498 = _3496 != 0;
    float _3500 = -_3480;
    float _3502 = fma(_1904, _3500, _2828);
    float _3504 = float(_3428);
    float _3506 = fma(_1366, _3484, _3436);
    out.m_88.x = _3470;
    bool _3508 = !_3494;
    int _3510 = _3508 ? 0 : 1;
    bool _3512 = !_3498;
    int _3514 = _3512 ? 0 : 1;
    out.m_90.x = _3462;
    out.m_90.y = _3486;
    out.m_90.z = _3502;
    out.m_90.w = _2936;
    bool _3516 = !_3490;
    int _3518 = _3516 ? 0 : 1;
    out.m_88.w = _3504;
    float _3520 = _2568 * _3476;
    float _3522 = _2574 * _3476;
    out.m_92.x = _3442;
    out.m_92.y = _3506;
    float _3524 = _3502;
    float _3526 = _3520;
    if (_2616)
    {
        return out;
    }
    float _3528 = -_3520;
    float _3530 = fma(_3528, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2448);
    float _3532 = _2588 * _3476;
    float _3534 = -_3522;
    float _3536 = fma(_3534, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2460);
    float _3538 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3540 = _3530 + _3538;
    float _3542 = -_3532;
    float _3544 = fma(_3542, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2502);
    float _3546 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3548 = _3536 + _3546;
    float _3550 = _3540 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3552 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3554 = _3544 + _3552;
    float _3556 = fma(_3548, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3550);
    float _3558 = fma(_3554, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3556);
    bool _3560 = _3558 >= 0.0;
    float _3562 = _3554;
    if (_3560)
    {
        _3524 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3564 = _3524;
    int _3566 = as_type<int>(_3564);
    if (_3560)
    {
        out.m_63.x = 0.0;
    }
    if (_3560)
    {
        float _3568 = _3564 * 5.0;
        _3566 = as_type<int>(_3568);
    }
    int _3570 = _3566;
    if (_3560)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10809 = as_type<float>(_3570);
        out.gl_Position.z = _10809;
    }
    if (_3560)
    {
        return out;
    }
    float _3572 = fma(_3536, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3574 = fma(_3544, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3576 = floor(_3572);
    float _3578 = floor(_3574);
    float _3580 = -_3576;
    float _3582 = _3572 + _3580;
    float _3584 = -_3578;
    float _3586 = _3574 + _3584;
    float2 _10845 = float2(_3582, _3586);
    float _3588 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_10845, float2(0.0), isnan(_10845)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_10845, float2(0.0), isnan(_10845)), level(0.0)).x;
    float _3590 = _1090 * 2.0;
    float _3592 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3594 = log2(_3592);
    float _3596 = _1186 * 2.0;
    float _3598 = _1188 + _1186;
    float _3600 = _1188 * 2.0;
    int _3602 = abs(_3518);
    float _3604 = -_3520;
    float _3606 = fma(_3604, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2568);
    float _3608 = _3598 + (-1.0);
    float _3610 = -_3522;
    float _3612 = fma(_3610, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2574);
    float _3614 = floor(_3590);
    float _3616 = _3606 * _3606;
    float _3618 = float(_3602);
    float _3620 = -_3532;
    float _3622 = fma(_3620, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2588);
    float _3624 = _701 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3626 = _703 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3628 = floor(_3596);
    float _3630 = _3594 * _135;
    bool _3632 = _3614 > 0.0;
    float _3634 = floor(_3600);
    bool _3636 = _3614 >= 0.0;
    bool _3638 = isnan(_3614);
    bool _3640 = _3636 || _3638;
    bool _3642 = isnan(0.0);
    bool _3644 = _3640 || _3642;
    float _3646 = fma(_3608, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3648 = _1188 + _1090;
    float _3650 = _1188 + (-0.5);
    int _3652 = _3644 ? 0 : 1;
    float _3654 = _3648 + (-1.0);
    float _3656 = exp2(_3630);
    bool _3658 = _3628 >= 0.0;
    bool _3660 = isnan(_3628);
    bool _3662 = _3658 || _3660;
    bool _3664 = isnan(0.0);
    bool _3666 = _3662 || _3664;
    int _3668 = ~_3652;
    int _3670 = _3668 + 1;
    int _3672 = _3670 + 1;
    int _3674 = _3672;
    int _3676 = 2;
    if (!_3632)
    {
        int _3678 = ~_3652;
        int _3680 = _3678 + 1;
        _3674 = _3680;
    }
    int _3682 = _3674;
    bool _3684 = _3628 > 0.0;
    bool _3686 = _3634 > 0.0;
    float _3688 = fma(_3654, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3690 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3692 = 1.0 + _3690;
    float _3694 = in.m_94.x;
    float _3696 = in.m_94.y;
    float _3698 = in.m_94.z;
    bool _3700 = _3634 >= 0.0;
    bool _3702 = isnan(_3634);
    bool _3704 = _3700 || _3702;
    bool _3706 = isnan(0.0);
    bool _3708 = _3704 || _3706;
    float _3710 = -_3656;
    float _3712 = _3710 + 1.0;
    float _3714 = 1.0 / _3692;
    int _3716 = _3666 ? 0 : 1;
    bool _3718 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3720 = isnan(1.0);
    bool _3722 = _3718 || _3720;
    bool _3724 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3726 = _3722 || _3724;
    int _3728 = ~_3716;
    int _3730 = _3728 + 1;
    int _3732 = _3730 + 1;
    int _3734 = _3732;
    if (!_3684)
    {
        int _3736 = ~_3716;
        int _3738 = _3736 + 1;
        _3734 = _3738;
    }
    int _3740 = _3734;
    bool _3742 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3744 = isnan(0.0);
    bool _3746 = _3742 || _3744;
    bool _3748 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3750 = _3746 || _3748;
    float _3752 = float(_3682);
    float _3754 = _3750 ? _3712 : 0.0;
    int _3756 = abs(_3510);
    float _3758 = _3618 * _3752;
    float _3760 = float(_3740);
    if (_3726)
    {
        float _3762 = _3754 * _3714;
        _145 = _3762;
    }
    float _3764 = _145;
    float _3766 = float(_3756);
    float _3768 = fma(_3612, _3612, _3616);
    float _3770 = _3758 * (-2.0);
    int _3772 = _3708 ? 0 : 1;
    float _3774 = _3766 * _3760;
    float _3776 = _1186 + (-0.5);
    float _3778 = fma(_3770, _3694, _3694);
    float _3780 = fma(_3646, _3770, _3646);
    int _3782 = abs(_3514);
    float _3784 = _1186 + _1090;
    float _3786 = fma(_3776, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3778);
    float _3788 = _3774 * (-2.0);
    int _3790 = ~_3772;
    int _3792 = _3790 + 1;
    int _3794 = _3792 + 1;
    float _3796 = _3784 + (-1.0);
    int _3798 = _3794;
    if (!_3686)
    {
        int _3800 = ~_3772;
        int _3802 = _3800 + 1;
        _3798 = _3802;
    }
    int _3804 = _3798;
    float _3806 = fma(_3688, _3788, _3688);
    float _3808 = fma(_3788, _3696, _3696);
    float _3810 = _1090 + (-0.5);
    float _3812 = float(_3804);
    float _3814 = fma(_3650, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3808);
    float _3816 = float(_3782);
    float _3818 = fma(_3780, _3764, _3786);
    float _3820 = fma(_3622, _3622, _3768);
    float _3822 = fma(_3806, _3764, _3814);
    float _3824 = _3816 * _3812;
    float _3826 = _3818 * 0.15915493667125701904296875;
    float _3828 = _3822 * 0.15915493667125701904296875;
    float _3830 = _3824 * (-2.0);
    float _3832 = sqrt(_3820);
    float _3834 = fma(_3796, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3836 = fma(_3830, _3698, _3698);
    float _3838 = fma(_3834, _3830, _3834);
    float _3840 = fma(_3810, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3836);
    float _3842 = _3826 * 6.283185482025146484375;
    float _3844 = sin(_3842);
    float _3846 = fma(_3838, _3764, _3840);
    float _3848 = _3530 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3850 = _3846 * 0.15915493667125701904296875;
    float _3852 = fma(_3536, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3848);
    float _3854 = _3826 * 6.283185482025146484375;
    float _3856 = cos(_3854);
    float _3858 = _3476 * _3832;
    float _3860 = fma(_3544, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3852);
    float _3862 = _3860 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3864 = _3530 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3866 = _3828 * 6.283185482025146484375;
    float _3868 = sin(_3866);
    float _3870 = fma(_3536, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3864);
    float _3872 = fma(_3544, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3870);
    float _3874 = _3828 * 6.283185482025146484375;
    float _3876 = cos(_3874);
    float _3878 = _3872 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3880 = _3878 + _3862;
    float _3882 = 1.0 / _3862;
    float _3884 = _3844 * _3868;
    float _3886 = _3850 * 6.283185482025146484375;
    float _3888 = sin(_3886);
    float _3890 = _3856 * _3876;
    float _3892 = _3858 * _3624;
    float _3894 = _3844 * _3876;
    float _3896 = _3850 * 6.283185482025146484375;
    float _3898 = cos(_3896);
    float _3900 = _3880 * _3882;
    float _3902 = _3900 * 0.5;
    float _3904 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _229);
    float _3906 = _3904 * _3892;
    float _3908 = _3858 * _3626;
    float _3910 = fma(_3888, _3890, _3884);
    float _3912 = fma(_3888, _3884, _3890);
    float _3914 = _3856 * _3868;
    float _3916 = -_3914;
    float _3918 = fma(_3888, _3894, _3916);
    float _3920 = _3868 * _3898;
    float _3922 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3924 = fma(_3902, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3922);
    float _3926 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _3928 = _3856 * _3898;
    float _3930 = _3876 * _3898;
    float _3932 = _3844 * _3898;
    float _3934 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _225);
    float _3936 = 1.0 / _3924;
    float _3938 = _3530 + _3926;
    float _3940 = -_3894;
    float _3942 = fma(_3888, _3914, _3940);
    float _3944 = _3934 * _3908;
    float _3946 = -_3906;
    float _3948 = _3888 * _3946;
    float _3950 = _3928 * _3906;
    float _3952 = _3938 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _3954 = _3932 * _3906;
    float _3956 = fma(_3930, _3944, _3948);
    float _3958 = fma(_3910, _3944, _3950);
    float _3960 = _3938 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _3962 = fma(_3536, (*spvDescriptorSet0.vp_c15)._m0[126].x, _3952);
    float _3964 = fma(_3918, _3944, _3954);
    float _3966 = _3858 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3968 = _3966 * 0.5;
    float _3970 = fma(_3536, (*spvDescriptorSet0.vp_c15)._m0[127].x, _3960);
    float _3972 = fma(_3544, (*spvDescriptorSet0.vp_c15)._m0[126].z, _3962);
    float _3974 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3976 = _3936 * _3974;
    float _3978 = fma(_3942, _3968, _3958);
    float _3980 = fma(_3920, _3968, _3956);
    float _3982 = fma(_3544, (*spvDescriptorSet0.vp_c15)._m0[127].z, _3970);
    float _3984 = _3972 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _3986 = _3976 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _3988 = fma(_3912, _3968, _3964);
    bool _3990 = _3976 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _3992 = _3978 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3994 = _3978 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3996 = trunc(_3984);
    int _3998 = int(_3996);
    float _4000 = _3982 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _4002 = fma(_3980, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3992);
    float _4004 = fma(_3980, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3994);
    bool _4006 = !_3986;
    int _4008 = _4006 ? 0 : 1;
    float _4010 = _3978 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4012 = fma(_3988, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4002);
    float _4014 = fma(_3988, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4004);
    float _4016 = trunc(_4000);
    int _4018 = int(_4016);
    int _4020 = as_type<int>(_4010);
    int _4022 = as_type<int>(_3988);
    if (!_3986)
    {
        _3676 = 1;
    }
    int _4024 = _3676;
    float _4026 = _4012 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _4028 = _4024;
    if (!_3990)
    {
        _4028 = _4008;
    }
    int _4030 = _4028;
    float _4032 = _4014 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _4034 = fma(_3980, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4010);
    float _4036 = _2502 + _4026;
    int _4038 = _4030 << 6;
    float _4040 = _2460 + _4032;
    int _4042 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _4044 = _3998 + _4042;
    int _4046 = _4044 + 1;
    float _4048 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _4050 = _4036 + _4048;
    int _4052 = _4038 + 48;
    uint _4054 = uint(int(uint(_4052) >> uint(2)));
    uint _4056 = uint(int(uint(int(_4054)) >> uint(2)));
    int _4058 = int(_4054) & 3;
    float _4060 = (*spvDescriptorSet0.vp_c15)._m0[int(_4056)][_4058];
    int _4062 = int(_4054) + 1;
    uint _4064 = uint(int(uint(_4062) >> uint(2)));
    int _4066 = _4062 & 3;
    float _4068 = (*spvDescriptorSet0.vp_c15)._m0[int(_4064)][_4066];
    float _4070 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _4072 = _4040 + _4070;
    bool _4074 = _4046 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _4076 = fma(_3988, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4034);
    int _4078 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _4080 = _4018 + _4078;
    int _4082 = _4080 + 1;
    float _4084 = _4050 * _4050;
    float _4086 = _4076 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _4088 = _4038 + 56;
    uint _4090 = uint(int(uint(_4088) >> uint(2)));
    uint _4092 = uint(int(uint(int(_4090)) >> uint(2)));
    int _4094 = int(_4090) & 3;
    float _4096 = (*spvDescriptorSet0.vp_c15)._m0[int(_4092)][_4094];
    int _4098 = int(_4090) + 1;
    uint _4100 = uint(int(uint(_4098) >> uint(2)));
    int _4102 = _4098 & 3;
    float _4104 = (*spvDescriptorSet0.vp_c15)._m0[int(_4100)][_4102];
    int _4106 = _4046 | _4082;
    float _4108 = fma(_4072, _4072, _4084);
    float _4110 = _2448 + _4086;
    bool _4112 = _4106 < 0;
    bool _4114 = _4112 || _4074;
    float _4116 = sqrt(_4108);
    int _4118 = _4038 + 64;
    uint _4120 = uint(int(uint(_4118) >> uint(2)));
    uint _4122 = uint(int(uint(int(_4120)) >> uint(2)));
    int _4124 = int(_4120) & 3;
    float _4126 = (*spvDescriptorSet0.vp_c15)._m0[int(_4122)][_4124];
    int _4128 = int(_4120) + 1;
    uint _4130 = uint(int(uint(_4128) >> uint(2)));
    int _4132 = _4128 & 3;
    float _4134 = (*spvDescriptorSet0.vp_c15)._m0[int(_4130)][_4132];
    bool _4136 = _4082 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _4138 = _4136 || _4114;
    int _4140 = _4038 + 72;
    uint _4142 = uint(int(uint(_4140) >> uint(2)));
    uint _4144 = uint(int(uint(int(_4142)) >> uint(2)));
    int _4146 = int(_4142) & 3;
    float _4148 = (*spvDescriptorSet0.vp_c15)._m0[int(_4144)][_4146];
    int _4150 = int(_4142) + 1;
    uint _4152 = uint(int(uint(_4150) >> uint(2)));
    int _4154 = _4150 & 3;
    float _4156 = (*spvDescriptorSet0.vp_c15)._m0[int(_4152)][_4154];
    float _4158 = as_type<float>(_4046);
    float _4160 = as_type<float>(_4082);
    float _4162 = _4040;
    float _4164 = _4108;
    if (!_4138)
    {
        int _4166 = _4082 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _4168 = _4166 + _4046;
        _4020 = _4168;
    }
    int _4170 = _4020;
    bool _4172 = _4116 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _4174 = _4038 + 96;
    uint _4176 = uint(int(uint(_4174) >> uint(2)));
    uint _4178 = uint(int(uint(int(_4176)) >> uint(2)));
    int _4180 = int(_4176) & 3;
    float _4182 = (*spvDescriptorSet0.vp_c15)._m0[int(_4178)][_4180];
    int _4184 = int(_4176) + 1;
    uint _4186 = uint(int(uint(_4184) >> uint(2)));
    int _4188 = _4184 & 3;
    float _4190 = (*spvDescriptorSet0.vp_c15)._m0[int(_4186)][_4188];
    if (!_4138)
    {
        int _4192 = _4170 << 2;
        _4022 = _4192;
    }
    int _4194 = _4022;
    int _4196 = _4194;
    if (!_4138)
    {
        uint _4198 = uint(int(uint(_4170) >> uint(2)));
        _2890 = int(_4198);
    }
    int _4200 = _2890;
    float _4202 = as_type<float>(_4200);
    if (!_4138)
    {
        int _4204 = 12 & _4194;
        _4196 = _4204;
    }
    int _4206 = _4196;
    int _4208 = _4038 + 104;
    uint _4210 = uint(int(uint(_4208) >> uint(2)));
    uint _4212 = uint(int(uint(int(_4210)) >> uint(2)));
    int _4214 = int(_4210) & 3;
    float _4216 = (*spvDescriptorSet0.vp_c15)._m0[int(_4212)][_4214];
    int _4218 = int(_4210) + 1;
    uint _4220 = uint(int(uint(_4218) >> uint(2)));
    int _4222 = _4218 & 3;
    float _4224 = (*spvDescriptorSet0.vp_c15)._m0[int(_4220)][_4222];
    if (!_4138)
    {
        int _4226 = _4200 << 4;
        int _4228 = _4226 + _4206;
        _4202 = as_type<float>(_4228);
    }
    float _4230 = _4202;
    if (!_4172)
    {
        _4158 = _4040;
    }
    float _4232 = _4158;
    float _4234 = _4232;
    if (!_4172)
    {
        _4160 = _4036;
    }
    float _4236 = _4160;
    float _4238 = _4236;
    if (!_4172)
    {
        _4162 = _4110;
    }
    float _4240 = _4162;
    bool _4242 = !_4172;
    float _4244 = _4240;
    float _4246 = _4126;
    if (!_4242)
    {
        float _4248 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4250 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4252 = _4116 + _4250;
        float _4254 = _4110 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4256 = rsqrt(_4108);
        float _4258 = _4252 * _4248;
        float _4260 = _4258 * 0.15915493667125701904296875;
        float _4262 = _4260 * 6.283185482025146484375;
        float _4264 = cos(_4262);
        float _4266 = _4260 * 6.283185482025146484375;
        float _4268 = sin(_4266);
        float _4270 = _4264 + (-1.0);
        float _4272 = fma(_4268, _4254, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4274 = _4270 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4276 = _4256 * _4272;
        float _4278 = fma(_4110, _4264, _4274);
        float _4280 = fma(_4072, _4276, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4282 = fma(_4050, _4276, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _4244 = _4278;
        _4234 = _4280;
        _4238 = _4282;
        _4164 = _4256;
    }
    float _4284 = _4244;
    float _4286 = _4234;
    float _4288 = _4238;
    float _4290 = _4164;
    float _4292 = -_2448;
    float _4294 = _4292 + _4284;
    int _4296 = _4038 + 80;
    uint _4298 = uint(int(uint(_4296) >> uint(2)));
    uint _4300 = uint(int(uint(int(_4298)) >> uint(2)));
    int _4302 = int(_4298) & 3;
    float _4304 = (*spvDescriptorSet0.vp_c15)._m0[int(_4300)][_4302];
    int _4306 = int(_4298) + 1;
    uint _4308 = uint(int(uint(_4306) >> uint(2)));
    int _4310 = _4306 & 3;
    float _4312 = (*spvDescriptorSet0.vp_c15)._m0[int(_4308)][_4310];
    float _4314 = -_2460;
    float _4316 = _4314 + _4286;
    float _4318 = -_2502;
    float _4320 = _4318 + _4288;
    float _4322 = _4294 * _4294;
    float _4324 = _3938 * _4190;
    float _4326 = _4290;
    float _4328 = _4322;
    float _4330 = _4288;
    float _4332 = _4286;
    float _4334 = _4284;
    if (!_4138)
    {
        float _4336 = floor(_3984);
        _4326 = _4336;
    }
    float _4338 = _4326;
    float _4340 = _3938 * _4134;
    float _4342 = fma(_4316, _4316, _4322);
    int _4344 = _4038 + 88;
    uint _4346 = uint(int(uint(_4344) >> uint(2)));
    uint _4348 = uint(int(uint(int(_4346)) >> uint(2)));
    int _4350 = int(_4346) & 3;
    float _4352 = (*spvDescriptorSet0.vp_c15)._m0[int(_4348)][_4350];
    int _4354 = int(_4346) + 1;
    uint _4356 = uint(int(uint(_4354) >> uint(2)));
    int _4358 = _4354 & 3;
    float _4360 = (*spvDescriptorSet0.vp_c15)._m0[int(_4356)][_4358];
    float _4362 = fma(_3536, _4182, _4324);
    float _4364 = fma(_3536, _4126, _4340);
    float _4366 = fma(_4320, _4320, _4342);
    float _4368 = fma(_3544, _4216, _4362);
    if (!_4138)
    {
        float _4370 = floor(_4000);
        _4328 = _4370;
    }
    float _4372 = _4328;
    bool _4374 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _4376 = isnan(0.5);
    bool _4378 = _4374 || _4376;
    bool _4380 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4382 = _4378 || _4380;
    float _4384 = _4230;
    float _4386 = _4372;
    if (!_4138)
    {
        int _4388 = as_type<int>(_4230) + 400;
        uint _4390 = uint(int(uint(_4388) >> uint(2)));
        uint _4392 = uint(int(uint(int(_4390)) >> uint(2)));
        int _4394 = int(_4390) & 3;
        float _4396 = (*spvDescriptorSet0.vp_c15)._m0[int(_4392)][_4394];
        _4384 = _4396;
    }
    float _4398 = _4384;
    float _4400 = _4368 + _4224;
    float _4402 = _3938 * _4068;
    float _4404 = fma(_3544, _4148, _4364);
    float _4406 = sqrt(_4366);
    float _4408 = fma(_3536, _4060, _4402);
    float _4410 = fma(_3544, _4096, _4408);
    float _4412 = 1.0 / _4400;
    bool _4414 = _4406 > 0.0;
    bool _4416 = !_4414;
    float _4418 = _4404;
    if (!_4416)
    {
        float _4420 = _245 * _245;
        float _4422 = rsqrt(_4366);
        float _4424 = fma(_241, _241, _4420);
        float _4426 = fma(_247, _247, _4424);
        float _4428 = sqrt(_4426);
        float _4430 = _4316 * _4422;
        float _4432 = _4294 * _4422;
        float _4434 = _4320 * _4422;
        bool _4436 = _4428 > 0.0;
        bool _4438 = !_4436;
        if (!_4438)
        {
            float _4440 = rsqrt(_4426);
            float _4442 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4444 = _245 * _4440;
            float _4446 = _241 * _4440;
            float _4448 = _247 * _4440;
            float _4450 = _4432 * _4444;
            float _4452 = fma(_4430, _4446, _4450);
            float _4454 = _4442 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4456 = fma(_4434, _4448, _4452);
            float _4458 = _4456 * _4454;
            float _4460 = fma(_241, _4458, _4286);
            float _4462 = fma(_245, _4458, _4284);
            float _4464 = fma(_247, _4458, _4288);
            _4330 = _4464;
            _4332 = _4460;
            _4334 = _4462;
            _4246 = _4446;
        }
    }
    float _4466 = _4330;
    float _4468 = _4332;
    float _4470 = _4334;
    float _4472 = _4246;
    float _4474 = -_3532;
    float _4476 = fma(_4474, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4466);
    float _4478 = _4404 + _4156;
    float _4480 = -_3522;
    float _4482 = fma(_4480, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4468);
    float _4484 = -_3520;
    float _4486 = fma(_4484, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4470);
    float _4488 = _4410 + _4104;
    float _4490 = _4486;
    float _4492 = _4482;
    if (_4382)
    {
        _4418 = _4476;
    }
    float _4494 = _4418;
    float _4496 = _4494;
    if (!_4382)
    {
        float _4498 = _3540 * _3540;
        float _4500 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4502 = -_2502;
        float _4504 = _4502 + _4466;
        float _4506 = -_2448;
        float _4508 = _4506 + _4470;
        float _4510 = fma(_3548, _3548, _4498);
        float _4512 = -_2460;
        float _4514 = _4512 + _4468;
        float _4516 = fma(_3554, _3554, _4510);
        float _4518 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4520 = sqrt(_4516);
        float _4522 = 1.0 / _3858;
        float _4524 = _4518 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4526 = precise::min(_4520, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4528 = _4526 * _4500;
        float _4530 = _4528 * _4522;
        float _4532 = _4524 * _4530;
        float _4534 = _4504 * _4530;
        float _4536 = fma(_4508, _4532, _3530);
        float _4538 = fma(_4514, _4532, _3536);
        float _4540 = fma(_4524, _4534, _3544);
        _4490 = _4536;
        _4492 = _4538;
        _4496 = _4540;
    }
    float _4542 = _4490;
    float _4544 = _4492;
    float _4546 = _4496;
    float _4548 = _4542 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4550 = _4542 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4552 = _4488 * _4412;
    float _4554 = _4542 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4556 = fma(_4544, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4548);
    float _4558 = fma(_4544, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4550);
    float _4560 = _4478 * _4412;
    bool _4562 = _4552 >= 0.0;
    float _4564 = fma(_4546, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4556);
    float _4566 = fma(_4544, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4554);
    float _4568 = fma(_4546, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4558);
    float _4570 = _4542 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4572 = _4564 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _4574 = _4552 <= 1.0;
    bool _4576 = _4574 && _4562;
    float _4578 = fma(_4546, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4566);
    float _4580 = _4568 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4582 = fma(_4544, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4570);
    float _4584 = _4572 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _4586 = _4560 >= 0.0;
    bool _4588 = _4586 && _4576;
    float _4590 = _4578 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4592 = fma(_4546, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4582);
    float _4594 = fma(_4580, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4584);
    bool _4596 = _4560 <= 1.0;
    bool _4598 = _4596 && _4588;
    float _4600 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4602 = _4590 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4604 = _4592 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4606 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4594);
    float _4608 = _4572 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4610 = -_4602;
    float _4612 = fma(_4610, _4600, 1.0);
    float _4614 = _3938 * _4312;
    float _4616 = fma(_4604, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4606);
    float _4618 = _4572 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4620 = fma(_4580, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4608);
    float _4622 = fma(_3536, _4304, _4614);
    float _4624 = 1.0 / _4616;
    float _4626 = _4554;
    float _4628 = _4566;
    float _4630 = _4616;
    if (_4598)
    {
        float _4632 = float(_4030);
        _4626 = _4632;
    }
    float _4634 = _4626;
    float _4636 = fma(_4580, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4618);
    float _4638 = fma(_3544, _4352, _4622);
    float _4640 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4620);
    if (!_4138)
    {
        float _4642 = -_4338;
        float _4644 = _3984 + _4642;
        _4628 = _4644;
    }
    float _4646 = _4628;
    float _4648 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4636);
    float _4650 = _4638 + _4360;
    float _4652 = log2(_4612);
    float _4654 = _4646;
    if (!_4138)
    {
        float _4656 = -_4372;
        float _4658 = _4000 + _4656;
        _4386 = _4658;
    }
    float _4660 = _4386;
    float _4662 = fma(_4604, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4648);
    float _4664 = fma(_4604, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4640);
    float _4666 = _4650 * _4412;
    float _4668 = _4472;
    if (!_4138)
    {
        float _4670 = rint(_4398);
        float _4672 = precise::max(_4670, 0.0);
        uint _4674 = uint(_4672);
        uint _4676 = clamp(_4674, 0u, 65535u);
        _4668 = as_type<float>(_4676);
    }
    float _4678 = _4668;
    float _4680 = _4662 * _4624;
    float _4682 = _4664 * _4624;
    float _4684 = fma(_4680, 0.5, 0.5);
    float _4686 = fma(_4682, -0.5, 0.5);
    float _4688 = _4634;
    float _4690 = _4682;
    if (_4598)
    {
        float _4692 = rint(_4634);
        float _4694 = precise::max(_4692, 0.0);
        uint _4696 = uint(_4694);
        uint _4698 = clamp(_4696, 0u, 65535u);
        _4688 = as_type<float>(_4698);
    }
    float _4700 = _4688;
    float _4702 = _4652 * 0.693147182464599609375;
    float _4704 = _4702 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4706 = _4660;
    if (!_4138)
    {
        float3 _12624 = float3(_4646, _4660, float(as_type<int>(_4678)));
        float3 _12628 = select(_12624, float3(0.0), isnan(_12624));
        float _4708 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _12628.xy, uint(rint(_12628.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _12628.xy, uint(rint(_12628.z)), level(0.0)).x;
        _4706 = _4708;
    }
    float _4710 = _4706;
    float _4712 = _4560;
    if (_4598)
    {
        float3 _12643 = float3(_4552, _4560, float(as_type<int>(_4700)));
        float3 _12645 = select(_12643, float3(0.0), isnan(_12643));
        float _4714 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _12645.xy, uint(rint(_12645.z)), _4666, level(0.0));
        _4712 = _4714;
    }
    float _4716 = _4712;
    float3 _12655 = float3(_4684, _4686, _4704);
    float _4718 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12655, float3(0.0), isnan(_12655)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12655, float3(0.0), isnan(_12655)), level(0.0)).x;
    float3 _12664 = float3(_4684, _4686, _4704);
    float4 _4721 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12664, float3(0.0), isnan(_12664)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12664, float3(0.0), isnan(_12664)), level(0.0)).xyzw;
    float _4723 = _4721.x;
    float _4725 = _4721.y;
    float _4727 = _4721.z;
    float _4729 = _4721.w;
    bool _4731 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _4733 = isnan(0.5);
    bool _4735 = _4731 || _4733;
    bool _4737 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4739 = _4735 || _4737;
    if (_4138)
    {
        _3562 = 1.0;
    }
    float _4741 = _3562;
    float _4743 = _4741;
    if (_4739)
    {
        _4690 = 1.0;
    }
    float _4745 = _4690;
    float _4747 = _4745;
    float _4749 = _4725;
    float _4751 = _4723;
    if (!_4739)
    {
        float _4753 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4755 = _4753 * 0.15915493667125701904296875;
        float _4757 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4759 = _4755 * 6.283185482025146484375;
        float _4761 = cos(_4759);
        float _4763 = _4757 * 0.15915493667125701904296875;
        float _4765 = _4755 * 6.283185482025146484375;
        float _4767 = sin(_4765);
        float _4769 = 1.0 / _4761;
        float _4771 = _4763 * 6.283185482025146484375;
        float _4773 = cos(_4771);
        float _4775 = _4767 * _4769;
        float _4777 = _4763 * 6.283185482025146484375;
        float _4779 = sin(_4777);
        float _4781 = _4773 * _4775;
        float _4783 = 1.0 / _4781;
        float _4785 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4787 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4785;
        float _4789 = 1.0 / _4787;
        float _4791 = _4779 * _4783;
        float _4793 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4795 = fma(_3976, _4791, _4793);
        float _4797 = _4795 * _4789;
        float _4799 = precise::clamp(_4797, 0.0, 1.0);
        _4654 = _4769;
        _4747 = _4799;
    }
    float _4801 = _4654;
    float _4803 = _4747;
    float _4805 = _4801;
    if (!_4138)
    {
        int _4807 = _4170 << 4;
        int _4809 = _4807 + 2048;
        uint _4811 = uint(int(uint(_4809) >> uint(2)));
        uint _4813 = uint(int(uint(int(_4811)) >> uint(2)));
        int _4815 = int(_4811) & 3;
        float _4817 = (*spvDescriptorSet0.vp_c15)._m0[int(_4813)][_4815];
        int _4819 = int(_4811) + 1;
        uint _4821 = uint(int(uint(_4819) >> uint(2)));
        int _4823 = _4819 & 3;
        float _4825 = (*spvDescriptorSet0.vp_c15)._m0[int(_4821)][_4823];
        int _4827 = _4809 + 8;
        uint _4829 = uint(int(uint(_4827) >> uint(2)));
        uint _4831 = uint(int(uint(int(_4829)) >> uint(2)));
        int _4833 = int(_4829) & 3;
        float _4835 = (*spvDescriptorSet0.vp_c15)._m0[int(_4831)][_4833];
        int _4837 = int(_4829) + 1;
        uint _4839 = uint(int(uint(_4837) >> uint(2)));
        int _4841 = _4837 & 3;
        float _4843 = (*spvDescriptorSet0.vp_c15)._m0[int(_4839)][_4841];
        float _4845 = _3938 * _4825;
        float _4847 = fma(_3536, _4817, _4845);
        float _4849 = fma(_3544, _4835, _4847);
        float _4851 = _4849 + _4843;
        float _4853 = precise::clamp(_4851, 0.0, 1.0);
        float _4855 = -_4853;
        float _4857 = _4855 + _4710;
        float _4859 = fma(_4857, 500.0, 1.5);
        float _4861 = exp2(_4859);
        float _4863 = 0.0 + _4861;
        float _4865 = precise::clamp(_4863, 0.0, 1.0);
        _4805 = _4825;
        _4743 = _4865;
    }
    float _4867 = _4805;
    float _4869 = _4743;
    float _4871 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4873 = _4542 + _4871;
    float _4875 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4877 = _4544 + _4875;
    float _4879 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4881 = _4546 + _4879;
    float _4883 = _4873 * _4873;
    float _4885 = fma(_4877, _4877, _4883);
    float _4887 = fma(_4881, _4881, _4885);
    float _4889 = rsqrt(_4887);
    float _4891 = _4889 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4893 = _4877 * _4891;
    float _4895 = _4881 * _4891;
    float _4897 = _4893 * _4893;
    float _4899 = _4895 * _4895;
    float _4901 = _4897 + _4899;
    float _4903 = sqrt(_4901);
    bool _4905 = _4903 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4907 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4909 = _4903 + _4907;
    float _4911 = _4885;
    float _4913 = _4889;
    float _4915 = _4909;
    float _4917 = _4873;
    float _4919 = _4891;
    if (_4905)
    {
        float _4921 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4911 = _4921;
    }
    float _4923 = _4911;
    if (_4905)
    {
        float _4925 = rsqrt(_4901);
        _4913 = _4925;
    }
    float _4927 = _4913;
    float _4929 = _4923;
    float _4931 = _4927;
    if (_4905)
    {
        float _4933 = _4909 * _4923;
        _4915 = _4933;
    }
    float _4935 = _4915;
    if (_4905)
    {
        float _4937 = _4935 * 0.15915493667125701904296875;
        _4929 = _4937;
    }
    float _4939 = _4929;
    float _4941 = _4881;
    float _4943 = _4939;
    if (_4905)
    {
        float _4945 = _4939 * 6.283185482025146484375;
        float _4947 = sin(_4945);
        _4941 = _4947;
    }
    float _4949 = _4941;
    float _4951 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4953 = precise::max(0.0, _4951);
    float _4955 = _4867;
    float _4957 = _4953;
    if (_4905)
    {
        float _4959 = _4939 * 6.283185482025146484375;
        float _4961 = cos(_4959);
        _4955 = _4961;
    }
    float _4963 = _4955;
    float _4965 = -_4891;
    float _4967 = -_4953;
    float _4969 = fma(_4873, _4965, _4967);
    if (_4905)
    {
        float _4971 = _4969 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4917 = _4971;
    }
    float _4973 = _4917;
    float _4975 = _4973;
    if (!_4905)
    {
        _4943 = _4897;
    }
    float _4977 = _4943;
    float _4979 = _4949;
    float _4981 = _4977;
    if (_4905)
    {
        float _4983 = fma(_4949, _4973, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4975 = _4983;
    }
    float _4985 = _4975;
    float _4987 = _4985;
    if (!_4905)
    {
        _4979 = _4969;
    }
    float _4989 = _4979;
    float _4991 = _4989;
    float _4993 = _4963;
    if (_4905)
    {
        float _4995 = _4963 + (-1.0);
        _4957 = _4995;
    }
    float _4997 = _4957;
    if (_4905)
    {
        float _4999 = _4927 * _4985;
        _3526 = _4999;
    }
    float _5001 = _3526;
    if (!_4905)
    {
        _4931 = _4893;
    }
    float _5003 = _4931;
    float _5005 = _5003;
    if (_4905)
    {
        float _5007 = _4997 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4919 = _5007;
    }
    float _5009 = _4919;
    if (_4905)
    {
        float _5011 = _4893 * _5001;
        _5005 = _5011;
    }
    float _5013 = _5005;
    if (!_4905)
    {
        _4987 = _4895;
    }
    float _5015 = _4987;
    float _5017 = _5015;
    if (_4905)
    {
        float _5019 = _4895 * _5001;
        _5017 = _5019;
    }
    float _5021 = _5017;
    if (_4905)
    {
        float _5023 = fma(_4969, _4963, _5009);
        _4991 = _5023;
    }
    float _5025 = _4991;
    if (_4905)
    {
        float _5027 = _5013 * _5013;
        _4981 = _5027;
    }
    float _5029 = _4981;
    if (!_4905)
    {
        _4993 = _4899;
    }
    float _5031 = _4993;
    float _5033 = _5031;
    if (_4905)
    {
        float _5035 = _5021 * _5021;
        _5033 = _5035;
    }
    float _5037 = _5033;
    float _5039 = sqrt(_4887);
    float _5041 = fma(_5025, _5025, _5029);
    float _5043 = _5041 + _5037;
    float _5045 = rsqrt(_5043);
    float _5047 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _5049 = fma(_5039, (*spvDescriptorSet0.vp_c15)._m0[23].w, _5047);
    float _5051 = precise::clamp(_5049, 0.0, 1.0);
    float _5053 = -_5051;
    float _5055 = _5053 + 1.0;
    float _5057 = abs(_5055);
    float _5059 = log2(_5057);
    float _5061 = _5045 * _5013;
    float _5063 = _5045 * _5025;
    float _5065 = _5045 * _5021;
    float _5067 = _5061 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _5069 = -_5067;
    float _5071 = fma(_5063, (*spvDescriptorSet0.vp_c15)._m0[21].y, _5069);
    float _5073 = -_5065;
    float _5075 = fma(_5073, (*spvDescriptorSet0.vp_c15)._m0[21].z, _5071);
    float _5077 = _5059 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _5079 = fma(_5075, -0.5, 0.5);
    float _5081 = fma(_5075, 0.5, 0.5);
    float _5083 = exp2(_5077);
    float _5085 = fma(_5081, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _5087 = fma(_5081, _5085, -0.212114393711090087890625);
    float _5089 = _5063 + 1.0;
    float _5091 = sqrt(_5079);
    float _5093 = fma(_5081, _5087, 1.570728778839111328125);
    float _5095 = -_5063;
    float _5097 = fma(_5083, _5089, _5095);
    float _5099 = fma(_5097, 0.5, 0.5);
    float _5101 = _5091 * 0.636619746685028076171875;
    float _5103 = -_5093;
    float _5105 = fma(_5101, _5103, 1.0);
    float2 _13236 = float2(_5105, _5099);
    float3 _5109 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_13236, float2(0.0), isnan(_13236)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_13236, float2(0.0), isnan(_13236)), level(0.0)).xyz;
    float _5111 = _5109.x;
    float _5113 = _5109.y;
    float _5115 = _5109.z;
    float _5117 = _229 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5119 = abs(_3976);
    float _5121 = log2(_5119);
    float _5123 = _3928 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5125 = _3928 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5127 = fma(_5117, _5117, 1.0);
    float _5129 = _3928 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5131 = _3910 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5133 = _3910 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5135 = _3910 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5137 = -_3888;
    float _5139 = fma(_5137, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5123);
    float _5141 = -_3888;
    float _5143 = fma(_5141, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5125);
    float _5145 = -_3888;
    float _5147 = fma(_5145, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5129);
    float _5149 = rsqrt(_5127);
    float _5151 = _3942 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5153 = _3942 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5155 = _3942 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5157 = fma(_3930, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5131);
    float _5159 = fma(_3920, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5151);
    float _5161 = fma(_3920, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5153);
    float _5163 = fma(_3920, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5155);
    float _5165 = fma(_3932, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5139);
    float _5167 = fma(_3930, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5133);
    float _5169 = _5121 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5171 = fma(_3930, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5135);
    float _5173 = fma(_3932, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5143);
    float _5175 = fma(_3918, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5157);
    float _5177 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5179 = _5117 * _5165;
    float _5181 = fma(_3932, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5147);
    float _5183 = fma(_3918, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5167);
    float _5185 = _4572 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5187 = fma(_3918, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5171);
    float _5189 = fma(_5177, _5175, _5179);
    float _5191 = exp2(_5169);
    float _5193 = fma(_3912, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5159);
    float _5195 = fma(_3912, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5161);
    float _5197 = _5117 * _5173;
    float _5199 = _5117 * _5181;
    float _5201 = fma(_3912, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5163);
    float _5203 = _5117 * _5149;
    float _5205 = fma(_4580, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5185);
    out.m_96.x = _5175;
    out.m_96.y = _5183;
    out.m_96.z = _5187;
    float _5207 = fma(_5177, _5187, _5199);
    float _5209 = _5059 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _5211 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5205);
    float _5213 = _4662 + _4616;
    bool _5215 = _3976 <= 8000.0;
    bool _5217 = isnan(_3976);
    bool _5219 = _5215 || _5217;
    bool _5221 = isnan(8000.0);
    bool _5223 = _5219 || _5221;
    float _5225 = float(_5223);
    float _5227 = fma(_5177, _5183, _5197);
    float _5229 = fma(_4604, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5211);
    float _5231 = exp2(_5209);
    float _5233 = -_5193;
    float _5235 = _5203 * _5233;
    float _5237 = _4616 * 0.5;
    float _5239 = -_3588;
    float _5241 = _5239 + 1.0;
    float _5243 = -_5201;
    float _5245 = _5203 * _5243;
    out.gl_Position.x = _4662;
    out.gl_Position.y = _4664;
    out.gl_Position.z = _5229;
    out.gl_Position.w = _4616;
    float _5247 = fma(_5149, _5165, _5235);
    float _5249 = fma(_4664, -0.5, _5237);
    float _5251 = fma(_5149, _5181, _5245);
    float _5253 = -_5195;
    float _5255 = _5203 * _5253;
    float _5257 = _5229 + _4616;
    float _5259 = _5213 * 0.5;
    float _5261 = fma(_5191, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5263 = precise::clamp(_5261, 0.0, 1.0);
    float _5265 = fma(_5149, _5173, _5255);
    float _5267 = _5257 * 0.5;
    float _5269 = _5201 + _5207;
    float _5271 = -_5231;
    float _5273 = _5271 + 1.0;
    float _5275 = fma(_5263, -2.0, 3.0);
    float _5277 = _5263 * _5263;
    out.m_98.x = _5259;
    out.m_98.y = _5249;
    out.m_98.z = _5267;
    out.m_98.w = _4616;
    float _5279 = _5273 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5281 = _5193 + _5189;
    float _5283 = _5277 * _5275;
    float _5285 = _5195 + _5227;
    float _5287 = _5279 * _4718;
    float _5289 = -_5279;
    float _5291 = _5289 + 1.0;
    float _5293 = -_5283;
    float _5295 = _5293 + 1.0;
    out.m_100.x = _5247;
    out.m_100.y = _5265;
    out.m_100.z = _5251;
    bool _5297 = _5039 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5299 = isnan(_5039);
    bool _5301 = _5297 || _5299;
    bool _5303 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5305 = _5301 || _5303;
    float _5307 = fma(_5295, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5283);
    out.m_102.x = _5281;
    out.m_102.y = _5285;
    out.m_102.z = _5269;
    float _5309 = _4729 * _5287;
    float _5311 = _5225 * _5307;
    float _5313 = _5307;
    float _5315 = _5291;
    float _5317 = _5273;
    if (!_4598)
    {
        _5313 = 1.0;
    }
    float _5319 = _5313;
    float _5321 = _4729 * _5291;
    float _5323 = _5319;
    if (_4598)
    {
        bool _5325 = _4716 >= _4666;
        bool _5327 = isnan(_4716);
        bool _5329 = _5325 || _5327;
        bool _5331 = isnan(_4666);
        bool _5333 = _5329 || _5331;
        float _5335 = float(_5333);
        _5323 = _5335;
    }
    float _5337 = _5323;
    float _5339 = _5311 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    if (!_5305)
    {
        _4630 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5341 = _4630;
    float _5343 = _5241 * _5339;
    float _5345 = precise::clamp(_5343, 0.0, 1.0);
    float _5347 = _5337 * _4869;
    float _5349 = _4803 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _5351 = _5341;
    float _5353 = _5341;
    if (!_5305)
    {
        _5315 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5355 = _5315;
    float _5357 = -_5345;
    float _5359 = fma(_5357, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5361 = _5355;
    float _5363 = _5355;
    if (!_5305)
    {
        _5317 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5365 = _5317;
    float _5367 = -_5347;
    float _5369 = fma(_5367, _5359, 1.0);
    float _5371 = precise::clamp(_5369, 0.0, 1.0);
    float _5373 = _5371 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5375 = _5371;
    float _5377 = _5365;
    float _5379 = _5365;
    if (!_5305)
    {
        _5375 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5381 = _5375;
    out.m_104.x = _5373;
    float _5383 = _5115 * _5287;
    float _5385 = fma(_5111, _5309, _4723);
    float _5387 = fma(_5113, _5309, _4725);
    float _5389 = _5381;
    float _5391 = _5381;
    if (!_5305)
    {
        _4749 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5393 = _4749;
    float _5395 = fma(_4729, _5383, _4727);
    float _5397 = _5393;
    float _5399 = _5393;
    if (!_5305)
    {
        _4751 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5401 = _4751;
    out.m_106.x = _5385;
    out.m_106.y = _5387;
    out.m_106.z = _5395;
    out.m_106.w = _5321;
    bool _5403 = !_5305;
    float _5405 = _5401;
    float _5407 = _5401;
    if (!_5403)
    {
        bool _5409 = _5039 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5411 = isnan(_5039);
        bool _5413 = _5409 || _5411;
        bool _5415 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5417 = _5413 || _5415;
        if (!_5417)
        {
            float _5419 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5421 = _5039 + _5419;
            float _5423 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5425 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5423;
            float _5427 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5429 = _5427 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5431 = 1.0 / _5425;
            float _5433 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5435 = _5433 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5437 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5439 = _5437 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5441 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5443 = _5441 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5445 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5447 = _5445 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5449 = _5421 * _5431;
            float _5451 = precise::clamp(_5449, 0.0, 1.0);
            float _5453 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5455 = _5453 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5457 = fma(_5451, _5429, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5459 = fma(_5451, _5455, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5461 = fma(_5451, _5435, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5463 = fma(_5451, _5439, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5465 = fma(_5451, _5443, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5467 = fma(_5451, _5447, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5407 = _5461;
            _5379 = _5465;
            _5399 = _5457;
            _5363 = _5463;
            _5353 = _5459;
            _5391 = _5467;
            _5469 = true;
        }
        else
        {
            bool _5471 = _5039 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5473 = isnan(_5039);
            bool _5475 = _5471 || _5473;
            bool _5477 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5479 = _5475 || _5477;
            if (!_5479)
            {
                _5397 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5481 = _5397;
            _5399 = _5481;
            if (!_5479)
            {
                _5405 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5483 = _5405;
            _5407 = _5483;
            if (!_5479)
            {
                _5351 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5485 = _5351;
            _5353 = _5485;
            if (!_5479)
            {
                _5361 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5487 = _5361;
            _5363 = _5487;
            if (!_5479)
            {
                _5377 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5489 = _5377;
            _5379 = _5489;
            if (!_5479)
            {
                _5389 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5491 = _5389;
            bool _5493 = !_5479;
            _5391 = _5491;
            if (!_5493)
            {
                bool _5495 = _5039 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5497 = isnan(_5039);
                bool _5499 = _5495 || _5497;
                bool _5501 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5503 = _5499 || _5501;
                if (!_5503)
                {
                    float _5505 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5507 = _5039 + _5505;
                    float _5509 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5511 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5509;
                    float _5513 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5515 = _5513 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5517 = 1.0 / _5511;
                    float _5519 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5521 = _5519 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5523 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5525 = _5523 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5527 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5529 = _5527 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5531 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5533 = _5531 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5535 = _5507 * _5517;
                    float _5537 = precise::clamp(_5535, 0.0, 1.0);
                    float _5539 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5541 = _5539 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5543 = fma(_5537, _5515, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5545 = fma(_5537, _5541, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5547 = fma(_5537, _5521, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5549 = fma(_5537, _5525, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5551 = fma(_5537, _5529, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5553 = fma(_5537, _5533, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5407 = _5547;
                    _5379 = _5551;
                    _5399 = _5543;
                    _5363 = _5549;
                    _5353 = _5545;
                    _5391 = _5553;
                    _5469 = true;
                }
                else
                {
                    _5407 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5379 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5399 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5363 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5353 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5391 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5469 = false;
    float _5555 = _5407;
    float _5557 = _5379;
    float _5559 = _5399;
    float _5561 = _5363;
    float _5563 = _5353;
    float _5565 = _5391;
    float _5567 = _5349 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5569 = fma(_5285, -0.5, 0.5);
    float _5571 = precise::clamp(_5569, 0.0, 1.0);
    float _5573 = -_5555;
    float _5575 = _5573 + _5557;
    float _5577 = -_5559;
    float _5579 = _5577 + _5561;
    out.m_63.x = _5567;
    float _5581 = fma(_5571, _5575, _5555);
    float _5583 = -_5563;
    float _5585 = _5583 + _5565;
    float _5587 = fma(_5571, _5579, _5559);
    float _5589 = _5581 * 0.586610972881317138671875;
    bool _5591 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5593 = fma(_5571, _5585, _5563);
    out.m_108.x = 0.0;
    float _5595 = fma(_5587, 0.298911988735198974609375, _5589);
    bool _5597 = _4803 > 0.0;
    bool _5599 = isnan(_4803);
    bool _5601 = _5597 || _5599;
    bool _5603 = isnan(0.0);
    bool _5605 = _5601 || _5603;
    float _5607 = fma(_5593, 0.114477999508380889892578125, _5595);
    float _5609 = -_5607;
    float _5611 = _5587 + _5609;
    float _5613 = -_5607;
    float _5615 = _5581 + _5613;
    float _5617 = -_5607;
    float _5619 = _5593 + _5617;
    float _5621 = fma(_5611, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5607);
    float _5623 = fma(_5615, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5607);
    float _5625 = fma(_5619, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5607);
    bool _5627 = !_5591;
    if (!_5627)
    {
        float _5629 = -_4542;
        float _5631 = _5629 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5633 = -_4544;
        float _5635 = _5633 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5637 = -_4546;
        float _5639 = _5637 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5641 = _5631 * _5631;
        float _5643 = fma(_5635, _5635, _5641);
        float _5645 = fma(_5639, _5639, _5643);
        float _5647 = sqrt(_5645);
        float _5649 = rsqrt(_5645);
        float _5651 = -_5647;
        float _5653 = _5651 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5655 = _5653 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5657 = precise::clamp(_5655, 0.0, 1.0);
        float _5659 = _5635 * _5649;
        float _5661 = _5631 * _5649;
        float _5663 = abs(_5657);
        float _5665 = log2(_5663);
        float _5667 = _5639 * _5649;
        float _5669 = _5659 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5671 = _5285 * _5661;
        float _5673 = -_5661;
        float _5675 = -_5669;
        float _5677 = fma(_5673, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5675);
        float _5679 = fma(_5281, _5659, _5671);
        float _5681 = -_5667;
        float _5683 = fma(_5681, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5677);
        float _5685 = fma(_5269, _5667, _5679);
        float _5687 = precise::clamp(_5685, 0.0, 1.0);
        float _5689 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5691 = _5683 + _5689;
        float _5693 = _5665 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5695 = _5691 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5697 = precise::clamp(_5695, 0.0, 1.0);
        float _5699 = exp2(_5693);
        float _5701 = _5699 * _5697;
        float _5703 = _5687 * _5701;
        float _5705 = _5703 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5707 = _5703 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5709 = _5703 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_108.x = _5705;
        out.m_108.y = _5707;
        out.m_108.z = _5709;
    }
    out.m_110.x = _5621;
    out.m_110.y = _5623;
    out.m_110.z = _5625;
    if (_5605)
    {
        return out;
    }
    float _5711 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_63.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5711;
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
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_110 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_108 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5469 = false;
    bool _725 = false;
    bool _505 = false;
    bool _271 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _124 = in.m_56.w;
    float _126 = in.m_58.w;
    float _128 = trunc(_124);
    int _131 = int(_128);
    float _133 = -_126;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_61.y = _135;
    bool _139 = _131 >= 1;
    float _141 = 0.0;
    float _143 = _126;
    float _145 = _135;
    if (!_139)
    {
        _141 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _147 = _141;
    if (!_139)
    {
        out.m_63.x = 0.0;
    }
    int _149 = 0;
    if (!_139)
    {
        float _151 = _147 * 5.0;
        _149 = as_type<int>(_151);
    }
    int _153 = _149;
    int _155 = _153;
    if (!_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5779 = as_type<float>(_153);
        out.gl_Position.z = _5779;
    }
    if (!_139)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _157 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _159 = isnan(_126);
    bool _161 = _157 || _159;
    bool _163 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _165 = _161 || _163;
    float _167 = float(_131);
    bool _169 = _135 >= _167;
    bool _171 = !_165;
    bool _173 = _169 || _171;
    float _175 = 1.0 / _167;
    if (_173)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _177 = _143;
    if (_173)
    {
        out.m_63.x = 0.0;
    }
    float _179 = _135 * _175;
    float _181 = _179;
    if (_173)
    {
        float _183 = _177 * 5.0;
        _155 = as_type<int>(_183);
    }
    int _185 = _155;
    out.m_61.x = _179;
    if (_173)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5842 = as_type<float>(_185);
        out.gl_Position.z = _5842;
    }
    if (_173)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _187 = as_type<float>(int(gl_VertexIndex));
    float _189 = in.m_68.x;
    float _191 = in.m_68.y;
    float _193 = in.m_68.z;
    float _195 = in.m_70.x;
    float _197 = in.m_70.y;
    float _199 = in.m_70.z;
    float _201 = in.m_72.x;
    float _203 = in.m_72.y;
    float _205 = in.m_72.z;
    float _207 = in.m_74.x;
    float _209 = in.m_74.y;
    float _211 = in.m_74.z;
    int _213 = as_type<int>(_187) & 1;
    bool _215 = _213 != 0;
    int _217 = as_type<int>(_187) & 2;
    bool _219 = _217 != 0;
    bool _221 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _223 = !_215;
    float _225 = _223 ? (-0.5) : 0.5;
    bool _227 = !_219;
    float _229 = _227 ? (-0.5) : 0.5;
    float _231 = _191 * _197;
    float _233 = _191 * _203;
    float _235 = fma(_189, _195, _231);
    float _237 = _191 * _209;
    float _239 = fma(_189, _201, _233);
    float _241 = fma(_193, _199, _235);
    float _243 = fma(_189, _207, _237);
    float _245 = fma(_193, _205, _239);
    float _247 = fma(_193, _211, _243);
    bool _249 = !_221;
    bool _251 = false;
    float _269;
    if (!_249)
    {
        float _253 = in.m_76.x;
        float _255 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _257 = _253 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _259 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _261 = _259 * _255;
        float _263 = floor(_261);
        float _265 = -_263;
        float _267 = _261 + _265;
        _269 = _267;
        _271 = true;
    }
    else
    {
        _269 = _179;
    }
    _271 = false;
    float _273 = _269;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _277 = _273 + _275;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _281 = _273 + _279;
    bool _283 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _285 = isnan(_273);
    bool _287 = _283 || _285;
    bool _289 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _291 = _287 || _289;
    float _293 = float(_291);
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _301 = _299 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _303;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _309 = _307 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _313 = _273 + _311;
    float _315 = 1.0 / _301;
    bool _317 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _319 = 1.0 / _305;
    bool _321 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _323 = isnan(_273);
    bool _325 = _321 || _323;
    bool _327 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _329 = _325 || _327;
    float _331 = float(_329);
    float _333 = 1.0 / _297;
    float _335 = _277 * _315;
    bool _337 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _339 = isnan(_273);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _345 = _341 || _343;
    float _347 = float(_345);
    float _349 = 1.0 / _309;
    float _351 = _281 * _319;
    float _353 = -_293;
    float _355 = _353 + 1.0;
    bool _357 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _359 = isnan(_273);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = _347 * _355;
    float _371 = -_347;
    float _373 = _371 + 1.0;
    float _375 = _313 * _333;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _379 = _273 + _377;
    bool _381 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _383 = isnan(_273);
    bool _385 = _381 || _383;
    bool _387 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _389 = _385 || _387;
    float _391 = float(_389);
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _397;
    float _401 = _379 * _349;
    float _403 = _331 * _373;
    float _405 = -_331;
    float _407 = _405 + 1.0;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _417 = fma(_399, _375, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _419 = _367 * _407;
    float _421 = -_367;
    float _423 = _421 + 1.0;
    float _425 = fma(_411, _375, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _427 = fma(_395, _335, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _429 = fma(_415, _335, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _431 = _391 * _423;
    float _433 = -_391;
    float _435 = _433 + 1.0;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _437;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _441;
    float _445 = _425 * _431;
    float _447 = _417 * _431;
    float _449 = fma(_439, _351, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _451 = fma(_443, _351, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _453 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[143].x, _445);
    float _455 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[143].y, _447);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _465 = fma(_427, _419, _453);
    float _467 = fma(_429, _419, _455);
    float _469 = fma(_459, _401, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _471 = fma(_463, _401, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _473 = fma(_449, _403, _465);
    float _475 = fma(_451, _403, _467);
    float _477 = fma(_469, _369, _473);
    float _479 = fma(_471, _369, _475);
    float _481 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[147].x, _477);
    float _483 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[147].y, _479);
    bool _485 = !_317;
    float _503;
    if (!_485)
    {
        float _487 = in.m_76.x;
        float _489 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _491 = _487 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _493 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _495 = _493 * _489;
        float _497 = floor(_495);
        float _499 = -_497;
        float _501 = _495 + _499;
        _503 = _501;
        _505 = true;
    }
    else
    {
        _503 = _179;
    }
    _505 = false;
    float _507 = _503;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _511 = _507 + _509;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _515 = _513 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _523 = _521 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _525 = _507 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _527 = isnan(_507);
    bool _529 = _525 || _527;
    bool _531 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _533 = _529 || _531;
    float _535 = float(_533);
    float _537 = 1.0 / _515;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _539;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _547 = _507 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _549 = isnan(_507);
    bool _551 = _547 || _549;
    bool _553 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _555 = _551 || _553;
    float _557 = float(_555);
    float _559 = -_535;
    float _561 = _559 + 1.0;
    bool _563 = _507 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _565 = isnan(_507);
    bool _567 = _563 || _565;
    bool _569 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _571 = _567 || _569;
    float _573 = float(_571);
    float _575 = 1.0 / _519;
    float _577 = -_557;
    float _579 = _577 + 1.0;
    bool _581 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _583 = _535 * _579;
    float _585 = _541 * _537;
    float _587 = 1.0 / _523;
    bool _589 = _507 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _591 = isnan(_507);
    bool _593 = _589 || _591;
    bool _595 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _597 = _593 || _595;
    float _599 = float(_597);
    float _601 = fma(_585, _511, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _603;
    float _607 = -_599;
    float _609 = _607 + 1.0;
    float _611 = _599 * _561;
    float _613 = 1.0 / _545;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _617 = _615 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _619 = _573 * _609;
    float _621 = -_573;
    float _623 = _621 + 1.0;
    float _625 = _617 * _575;
    float _627 = _601 * _619;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _631 = _507 + _629;
    float _633 = _605 * _587;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _637 = _507 + _635;
    bool _639 = _507 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _641 = isnan(_507);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _655 = fma(_625, _631, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _657 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[115].x, _627);
    float _659 = fma(_633, _637, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _661 = -_649;
    float _663 = _661 + 1.0;
    float _665 = _653 * _613;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _669 = _507 + _667;
    float _671 = fma(_655, _611, _657);
    float _673 = _557 * _663;
    float _675 = fma(_665, _669, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _677 = fma(_659, _583, _671);
    float _679 = in.m_78.x;
    float _681 = in.m_78.y;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _685 = fma(_675, _673, _677);
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _689 = _683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _691 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[119].x, _685);
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _695 = _687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _697 = _691 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _699 = _693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_80.x = _695;
    out.m_80.y = _689;
    out.m_80.z = _699;
    out.m_80.w = _697;
    float _701 = _483 * _681;
    float _703 = _481 * _679;
    bool _705 = !_581;
    float _723;
    if (!_705)
    {
        float _707 = in.m_76.x;
        float _709 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _711 = _707 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _713 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[11].w, _135);
        float _715 = _713 * _709;
        float _717 = floor(_715);
        float _719 = -_717;
        float _721 = _715 + _719;
        _723 = _721;
        _725 = true;
    }
    else
    {
        _723 = _179;
    }
    _725 = false;
    float _727 = _723;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _731 = _727 + _729;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _735 = _733 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _739 = _737 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _741 = _727 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _743 = isnan(_727);
    bool _745 = _741 || _743;
    bool _747 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _749 = _745 || _747;
    float _751 = float(_749);
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _755 = _753 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _757 = _727 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _759 = isnan(_727);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _765 = _761 || _763;
    float _767 = float(_765);
    float _769 = 1.0 / _735;
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _773 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _771;
    float _775 = -_751;
    float _777 = _775 + 1.0;
    bool _779 = _727 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _781 = isnan(_727);
    bool _783 = _779 || _781;
    bool _785 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _787 = _783 || _785;
    float _789 = float(_787);
    bool _791 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _793 = 1.0 / _739;
    float _795 = 1.0 / _755;
    float _797 = _773 * _769;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _801 = _799 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _803 = _767 * _777;
    float _805 = -_767;
    float _807 = _805 + 1.0;
    float _809 = fma(_797, _731, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _811 = _727 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _813 = isnan(_727);
    bool _815 = _811 || _813;
    bool _817 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _819 = _815 || _817;
    float _821 = float(_819);
    float _823 = _789 * _807;
    float _825 = _801 * _793;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _827;
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _833 = _727 + _831;
    float _835 = _809 * _823;
    float _837 = -_789;
    float _839 = _837 + 1.0;
    float _841 = -_821;
    float _843 = _841 + 1.0;
    float _845 = fma(_825, _833, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _847 = _829 * _795;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _851 = _727 + _849;
    float _853 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[131].x, _835);
    float _855 = _751 * _843;
    float _857 = fma(_847, _851, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _859 = fma(_845, _803, _853);
    float _861 = fma(_857, _855, _859);
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _869 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[134].x, _861);
    float _871 = _863 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _873 = _865 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _875 = _867 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _877 = _869 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_82.x = _871;
    out.m_82.y = _873;
    out.m_82.z = _875;
    out.m_82.w = _877;
    bool _879 = !_791;
    float _881 = _873;
    float _883 = _877;
    if (!_879)
    {
        float _885 = in.m_76.x;
        float _887 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _889 = _885 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _891 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[14].x, _135);
        float _893 = _891 * _887;
        float _895 = floor(_893);
        float _897 = -_895;
        float _899 = _893 + _897;
        _181 = _899;
    }
    float _901 = _181;
    float _903 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _905 = int(_903);
    int _907 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _909 = _907 != 0;
    float _911 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _913 = int(_911);
    float _915 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _917 = int(_915);
    float _919 = float(_905);
    float _921 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _923 = int(_921);
    float _925 = float(_913);
    float _927 = 1.0 / _919;
    float _929 = float(_917);
    float _931 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _933 = int(_931);
    float _935 = float(uint(_923));
    float _937 = 1.0 / _925;
    float _939 = _927 * _135;
    float _941 = _927;
    if (_909)
    {
        float _943 = in.m_76.w;
        _941 = _943;
    }
    float _945 = _941;
    float _947 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _949 = int(_947);
    float _951 = float(uint(_933));
    int _953 = ~_933;
    int _955 = _953 + 1;
    float _957 = 1.0 / _929;
    float _959 = _937 * _135;
    float _961 = 1.0 / _935;
    float _963 = float(uint(_949));
    int _965 = ~_949;
    int _967 = _965 + 1;
    float _969 = _945;
    if (_909)
    {
        float _971 = _945 * 3.1415927410125732421875;
        _969 = _971;
    }
    float _973 = _969;
    float _975 = trunc(_939);
    int _977 = int(_975);
    float _979 = _957 * _135;
    if (_909)
    {
        float _981 = _973 * 0.15915493667125701904296875;
        _881 = _981;
    }
    float _983 = _881;
    float _985 = 1.0 / _951;
    int _987 = as_type<int>(_961) + (-2);
    int _989 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _991 = _989 != 0;
    float _993 = trunc(_959);
    int _995 = int(_993);
    float _997 = float(uint(_977));
    int _999 = ~_923;
    int _1001 = _999 + 1;
    float _1003 = as_type<float>(_987) * _997;
    float _1005 = 1.0 / _963;
    int _1007 = as_type<int>(_985) + (-2);
    if (_991)
    {
        _883 = 1.0;
    }
    float _1009 = _883;
    float _1011 = 0.0;
    float _1013 = _1009;
    if (_991)
    {
        _1011 = 1.0;
    }
    float _1015 = _1011;
    float _1017 = trunc(_979);
    int _1019 = int(_1017);
    float _1021 = float(uint(_995));
    int _1023 = 0;
    float _1025 = _1015;
    if (_991)
    {
        _1023 = 0;
    }
    int _1027 = _1023;
    float _1029 = as_type<float>(_1007) * _1021;
    int _1031 = as_type<int>(_1005) + (-2);
    float _1033 = trunc(_1003);
    float _1035 = precise::max(_1033, 0.0);
    uint _1038 = uint(_1035);
    float _1040 = float(uint(_1019));
    float _1042 = trunc(_1029);
    float _1044 = precise::max(_1042, 0.0);
    uint _1046 = uint(_1044);
    float _1048 = as_type<float>(_1031) * _1040;
    float _1050 = trunc(_1048);
    float _1052 = precise::max(_1050, 0.0);
    uint _1054 = uint(_1052);
    int _1056 = _1001 * int(_1038);
    int _1058 = _1056 + _977;
    float _1060 = float(uint(_1058));
    float _1062 = _983;
    int _1064 = _1027;
    if (_909)
    {
        float _1066 = _983 * 6.283185482025146484375;
        float _1068 = sin(_1066);
        _1062 = _1068;
    }
    float _1070 = _1062;
    float _1072 = _973;
    float _1074 = _1048;
    if (_991)
    {
        float _1076 = in.m_76.x;
        float _1078 = in.m_76.y;
        _1072 = _1076;
        _1074 = _1078;
    }
    float _1080 = _1072;
    float _1082 = _1074;
    int _1084 = _955 * int(_1046);
    int _1086 = _1084 + _995;
    float _1088 = as_type<float>(_987) * _1060;
    float _1090 = in.m_76.z;
    float _1092 = in.m_76.w;
    float _1094 = float(uint(_1086));
    int _1096 = _967 * int(_1054);
    int _1098 = _1096 + _1019;
    float _1100 = trunc(_1088);
    float _1102 = precise::max(_1100, 0.0);
    uint _1104 = uint(_1102);
    float _1106 = as_type<float>(_1007) * _1094;
    float _1108 = float(uint(_1098));
    float _1110 = as_type<float>(_1031) * _1108;
    float _1112 = trunc(_1106);
    float _1114 = precise::max(_1112, 0.0);
    uint _1116 = uint(_1114);
    int _1118 = as_type<int>(_1108);
    float _1120 = _1094;
    float _1122 = _1088;
    if (_991)
    {
        _1118 = 0;
    }
    int _1124 = _1118;
    float _1126 = _1080;
    float _1128 = _1082;
    int _1130 = _1124;
    if (_991)
    {
        _1120 = _1080;
    }
    float _1132 = _1120;
    float _1134 = trunc(_1110);
    float _1136 = precise::max(_1134, 0.0);
    uint _1138 = uint(_1136);
    float _1140 = 0.0;
    float _1142 = _1132;
    if (_991)
    {
        _1140 = _1082;
    }
    float _1144 = _1140;
    float _1146 = 0.0;
    float _1148 = _1144;
    if (_991)
    {
        _1146 = _1132;
    }
    float _1150 = _1146;
    float _1152 = _1150;
    if (_991)
    {
        _1122 = _1132;
    }
    float _1154 = _1122;
    float _1156 = _1154;
    if (!_991)
    {
        float _1158 = in.m_76.x;
        float _1160 = in.m_76.y;
        float _1162 = in.m_76.z;
        float _1164 = _1158 * 3.1415927410125732421875;
        float _1166 = _1164 * 0.15915493667125701904296875;
        float _1168 = _1160 * 3.1415927410125732421875;
        float _1170 = _1168 * 0.15915493667125701904296875;
        float _1172 = _1166 * 6.283185482025146484375;
        float _1174 = sin(_1172);
        float _1176 = _1170 * 6.283185482025146484375;
        float _1178 = sin(_1176);
        _1025 = 5.839270114898681640625;
        _1156 = _1162;
        _1013 = 7.345489978790283203125;
        _1126 = _1158;
        _1128 = _1160;
        _1142 = _1160;
        _1130 = 1;
        _1152 = _1174;
        _1064 = 2;
        _1148 = _1178;
    }
    float _1180 = _1025;
    float _1182 = _1156;
    float _1184 = _1013;
    float _1186 = _1126;
    float _1188 = _1128;
    float _1190 = _1142;
    int _1192 = _1130;
    float _1194 = _1152;
    int _1196 = _1064;
    float _1198 = _1148;
    float _1200 = _1180 * _1182;
    int _1202 = ~_923;
    int _1204 = _1202 + 1;
    float _1206 = _1184 * _1186;
    int _1208 = int(_1038) + int(_1104);
    float _1210 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1212 = _901 + _1210;
    int _1214 = ~_949;
    int _1216 = _1214 + 1;
    float _1218 = floor(_1206);
    int _1220 = int(_1054) + int(_1138);
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1224 = _901 + _1222;
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1228 = _901 + _1226;
    float _1230 = in.m_70.w;
    int _1232 = ~_933;
    int _1234 = _1232 + 1;
    float _1236 = floor(_1200);
    int _1238 = int(_1046) + int(_1116);
    int _1240 = _1204 * _1208;
    int _1242 = _1240 + _977;
    bool _1244 = _1092 > 0.5;
    int _1246 = _1216 * _1220;
    int _1248 = _1246 + _1019;
    bool _1250 = uint(_1242) >= uint(_923);
    float _1252 = -_1218;
    float _1254 = _1206 + _1252;
    bool _1256 = uint(_1248) >= uint(_949);
    int _1258 = _1234 * _1238;
    int _1260 = _1258 + _995;
    float _1262 = _1230;
    if (_909)
    {
        bool _1264 = _1070 > 0.5;
        _251 = _1264;
    }
    bool _1266 = _251;
    bool _1268 = !_1256;
    int _1270 = _1268 ? 0 : (-1);
    bool _1272 = !_1250;
    int _1274 = _1272 ? 0 : (-1);
    float _1276 = -_1236;
    float _1278 = _1200 + _1276;
    bool _1280 = _1090 > 0.5;
    int _1282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1284 = _1282 != 0;
    float _1286 = -_229;
    int _1288 = _1244 ? as_type<int>(_1286) : as_type<int>(_229);
    bool _1290 = uint(_1260) >= uint(_933);
    float _1292 = float(_923);
    bool _1294 = _1188 > 0.5;
    float _1296 = 0.0;
    if (!_909)
    {
        _1296 = _225;
    }
    float _1298 = _1296;
    float _1300 = _1254 * _1292;
    float _1302 = -_229;
    int _1304 = _1280 ? as_type<int>(_1302) : as_type<int>(_229);
    bool _1306 = !_1284;
    int _1308 = _1306 ? 0 : 1;
    float _1310 = _1298;
    if (_909)
    {
        float _1312 = -_225;
        float _1314 = _1266 ? _1312 : _225;
        _1310 = _1314;
    }
    float _1316 = _1310;
    float _1318 = trunc(_1300);
    int _1320 = int(_1318);
    int _1322 = ~_1220;
    int _1324 = _1322 + _1270;
    int _1326 = _1324 + 1;
    int _1328 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1330 = _1328 != 0;
    int _1332 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1334 = _1332 != 0;
    int _1336 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1338 = _1336 != 0;
    float _1340 = -_225;
    int _1342 = _1294 ? as_type<int>(_1340) : as_type<int>(_225);
    int _1344 = _949 * _1326;
    int _1346 = _1344 + _1019;
    int _1348 = ~_1208;
    int _1350 = _1348 + _1274;
    int _1352 = _1350 + 1;
    float _1354 = float(_977);
    int _1356 = _923 * _1352;
    int _1358 = _1356 + _977;
    float _1360 = float(_949);
    int _1362 = abs(_1308);
    bool _1364 = !_1338;
    float _1366 = _1364 ? _229 : as_type<float>(_1304);
    float _1368 = _1278 * _1360;
    bool _1370 = !_1334;
    float _1372 = _1370 ? _225 : as_type<float>(_1342);
    float _1374 = float(_1019);
    int _1376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1378 = _1376 != 0;
    int _1380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1382 = _1380 != 0;
    int _1384 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1386 = _1384 != 0;
    float _1388 = trunc(_1368);
    int _1390 = int(_1388);
    bool _1392 = _1354 >= _1292;
    bool _1394 = isnan(_1354);
    bool _1396 = _1392 || _1394;
    bool _1398 = isnan(_1292);
    bool _1400 = _1396 || _1398;
    float _1402 = float(_1400);
    int _1404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1406 = _1404 != 0;
    bool _1408 = _1374 >= _1360;
    bool _1410 = isnan(_1374);
    bool _1412 = _1408 || _1410;
    bool _1414 = isnan(_1360);
    bool _1416 = _1412 || _1414;
    float _1418 = float(_1416);
    bool _1420 = !_1382;
    int _1422 = _1420 ? 0 : 1;
    float _1424 = trunc(_1402);
    int _1426 = int(_1424);
    bool _1428 = !_1378;
    int _1430 = _1428 ? 0 : 1;
    bool _1432 = !_1386;
    int _1434 = _1432 ? 0 : 1;
    int _1436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1438 = _1436 != 0;
    int _1440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1442 = _1440 != 0;
    int _1444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1446 = _1444 != 0;
    bool _1448 = !_1406;
    int _1450 = _1448 ? 0 : 1;
    float _1452 = trunc(_1418);
    int _1454 = int(_1452);
    int _1456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1458 = _1456 != 0;
    bool _1460 = !_1442;
    int _1462 = _1460 ? 0 : 1;
    int _1464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1466 = _1464 != 0;
    int _1468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1470 = _1468 != 0;
    bool _1472 = !_1330;
    float _1474 = _1472 ? _229 : as_type<float>(_1288);
    int _1476 = _1320 * _1362;
    int _1478 = _1476 + _977;
    bool _1480 = !_1458;
    int _1482 = _1480 ? 0 : 1;
    float _1484 = _175 * _135;
    bool _1486 = !_1466;
    int _1488 = _1486 ? 0 : 1;
    bool _1490 = !_1290;
    int _1492 = _1490 ? 0 : (-1);
    float _1494 = _1292 * _1484;
    int _1496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1498 = _1496 != 0;
    int _1500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1502 = _1500 != 0;
    int _1504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1506 = _1504 != 0;
    int _1508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1510 = _1508 != 0;
    float _1512 = _1360 * _1484;
    bool _1514 = !_1438;
    int _1516 = _1514 ? 0 : 1;
    float _1518 = trunc(_1494);
    int _1520 = int(_1518);
    bool _1522 = _923 == 0;
    int _1524 = abs(_1482);
    bool _1526 = !_1502;
    int _1528 = _1526 ? 0 : 1;
    bool _1530 = _949 == 0;
    int _1532 = _1390 * _1524;
    int _1534 = _1532 + _1019;
    int _1536 = ~_1426;
    int _1538 = _1536 + 1;
    int _1540 = _1538 + 1;
    float _1542 = trunc(_1512);
    int _1544 = int(_1542);
    bool _1546 = !_1522;
    int _1548 = _1546 ? _1358 : (-1);
    int _1550 = ~_1454;
    int _1552 = _1550 + 1;
    int _1554 = _1552 + 1;
    bool _1556 = !_1530;
    int _1558 = _1556 ? _1346 : (-1);
    int _1560 = _1548 * _1540;
    int _1562 = _923 + (-1);
    int _1564 = abs(_1422);
    int _1566 = _1558 * _1554;
    int _1568 = _949 + (-1);
    int _1570 = _1426 * _1562;
    int _1572 = _1570 + _1560;
    int _1574 = abs(_1430);
    int _1576 = _1454 * _1568;
    int _1578 = _1576 + _1566;
    int _1580 = abs(_1434);
    int _1582 = _1572 * _1564;
    int _1584 = abs(_1462);
    int _1586 = _1520 * _1574;
    int _1588 = _1586 + _1582;
    int _1590 = abs(_1450);
    bool _1592 = !_1446;
    int _1594 = _1592 ? 0 : 1;
    int _1596 = _1478 * _1580;
    int _1598 = _1596 + _1588;
    int _1600 = abs(_1516);
    int _1602 = _1320 * _1590;
    int _1604 = _1602 + _1598;
    int _1606 = abs(_1594);
    int _1608 = _1578 * _1584;
    float _1610 = float(uint(_1604));
    int _1612 = abs(_1488);
    int _1614 = _1544 * _1600;
    int _1616 = _1614 + _1608;
    float _1618 = float(_933);
    float _1620 = as_type<float>(_987) * _1610;
    float _1622 = float(_995);
    int _1624 = _1534 * _1606;
    int _1626 = _1624 + _1616;
    int _1628 = ~_923;
    int _1630 = _1628 + 1;
    bool _1632 = _1622 >= _1618;
    bool _1634 = isnan(_1622);
    bool _1636 = _1632 || _1634;
    bool _1638 = isnan(_1618);
    bool _1640 = _1636 || _1638;
    float _1642 = float(_1640);
    int _1644 = _1390 * _1612;
    int _1646 = _1644 + _1626;
    float _1648 = trunc(_1620);
    float _1650 = precise::max(_1648, 0.0);
    uint _1652 = uint(_1650);
    float _1654 = _1184 * _1190;
    float _1656 = _1618 * _1484;
    int _1658 = ~_1238;
    int _1660 = _1658 + _1492;
    int _1662 = _1660 + 1;
    float _1664 = float(uint(_1646));
    int _1666 = ~_949;
    int _1668 = _1666 + 1;
    float _1670 = floor(_1654);
    int _1672 = _933 * _1662;
    int _1674 = _1672 + _995;
    float _1676 = as_type<float>(_1031) * _1664;
    bool _1678 = !_1470;
    int _1680 = _1678 ? 0 : 1;
    int _1682 = abs(_1528);
    int _1684 = abs(_1680);
    float _1686 = trunc(_1676);
    float _1688 = precise::max(_1686, 0.0);
    uint _1690 = uint(_1688);
    int _1692 = _1630 * int(_1652);
    int _1694 = _1692 + _1604;
    bool _1696 = _1090 > 0.5;
    int _1698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1700 = _1698 != 0;
    float _1702 = float(uint(_1694));
    float _1704 = trunc(_1642);
    int _1706 = int(_1704);
    bool _1708 = !_1498;
    int _1710 = _1708 ? 0 : 1;
    float _1712 = -_1670;
    float _1714 = _1654 + _1712;
    bool _1716 = _933 == 0;
    float _1718 = as_type<float>(_987) * _1702;
    int _1720 = abs(_1710);
    float _1722 = _1714 * _1618;
    bool _1724 = !_1716;
    int _1726 = _1724 ? _1674 : (-1);
    int _1728 = _1668 * int(_1690);
    int _1730 = _1728 + _1646;
    float _1732 = trunc(_1718);
    float _1734 = precise::max(_1732, 0.0);
    uint _1736 = uint(_1734);
    int _1738 = _933 + (-1);
    float _1740 = float(uint(_1730));
    int _1742 = ~_1706;
    int _1744 = _1742 + 1;
    int _1746 = _1744 + 1;
    float _1748 = trunc(_1656);
    int _1750 = int(_1748);
    float _1752 = as_type<float>(_1031) * _1740;
    int _1754 = _1726 * _1746;
    bool _1756 = !_1506;
    int _1758 = _1756 ? 0 : 1;
    float _1760 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1762 = _1760 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _1764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1766 = _1764 != 0;
    float _1768 = trunc(_1722);
    int _1770 = int(_1768);
    int _1772 = _1706 * _1738;
    int _1774 = _1772 + _1754;
    int _1776 = ~_923;
    int _1778 = _1776 + 1;
    float _1780 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1782 = _1780 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _1784 = int(_1652) + int(_1736);
    int _1786 = _1774 * _1682;
    int _1788 = abs(_1758);
    float _1790 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1792 = _1790 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1794 = trunc(_1752);
    float _1796 = precise::max(_1794, 0.0);
    uint _1798 = uint(_1796);
    int _1800 = _1750 * _1720;
    int _1802 = _1800 + _1786;
    int _1804 = ~_949;
    int _1806 = _1804 + 1;
    int _1808 = _1778 * _1784;
    int _1810 = _1808 + _1604;
    float _1812 = as_type<float>(_1758);
    float _1814 = as_type<float>(_1580);
    float _1816 = _1316;
    if (_1766)
    {
        float _1818 = in.m_76.x;
        _1812 = _1818;
    }
    float _1820 = _1812;
    int _1822 = ~_933;
    int _1824 = _1822 + 1;
    int _1826 = _1770 * _1684;
    int _1828 = _1826 + _995;
    bool _1830 = !_1510;
    int _1832 = _1830 ? 0 : 1;
    float _1834 = 1.0 / _1762;
    bool _1836 = uint(_1810) >= uint(_923);
    int _1838 = _1828 * _1788;
    int _1840 = _1838 + _1802;
    int _1842 = abs(_1832);
    bool _1844 = !_1836;
    int _1846 = _1844 ? 0 : (-1);
    int _1848 = int(_1690) + int(_1798);
    float _1850 = 1.0 / _1782;
    float _1852 = float(uint(_1478));
    int _1854 = _1806 * _1848;
    int _1856 = _1854 + _1646;
    int _1858 = ~_1784;
    int _1860 = _1858 + _1846;
    int _1862 = _1860 + 1;
    int _1864 = _1770 * _1842;
    int _1866 = _1864 + _1840;
    float _1868 = float(uint(_1534));
    float _1870 = as_type<float>(_987) * _1852;
    bool _1872 = uint(_1856) >= uint(_949);
    int _1874 = _923 * _1862;
    int _1876 = _1874 + _1604;
    float _1878 = -_225;
    int _1880 = _1696 ? as_type<int>(_1878) : as_type<int>(_225);
    float _1882 = trunc(_1870);
    float _1884 = precise::max(_1882, 0.0);
    uint _1886 = uint(_1884);
    float _1888 = as_type<float>(_1031) * _1868;
    float _1890 = float(uint(_1866));
    bool _1892 = !_1522;
    int _1894 = _1892 ? _1876 : (-1);
    float _1896 = as_type<float>(_1876);
    if (_1766)
    {
        float _1898 = _1820 * 3.1415927410125732421875;
        _1896 = _1898;
    }
    float _1900 = _1896;
    bool _1902 = !_1700;
    float _1904 = _1902 ? _225 : as_type<float>(_1880);
    float _1906 = as_type<float>(_1007) * _1890;
    float _1908 = trunc(_1888);
    float _1910 = precise::max(_1908, 0.0);
    uint _1912 = uint(_1910);
    int _1914 = _1894 & 3;
    bool _1916 = _1914 != 0;
    float _1918 = _1900;
    if (_1766)
    {
        float _1920 = _1900 * 0.15915493667125701904296875;
        _1918 = _1920;
    }
    float _1922 = _1918;
    int _1924 = ~_923;
    int _1926 = _1924 + 1;
    int _1928 = _1916 ? 0 : 1;
    int _1930 = _1894 & 3;
    bool _1932 = _1930 != 0;
    float _1934 = _1922;
    if (_1766)
    {
        float _1936 = _1922 * 6.283185482025146484375;
        float _1938 = sin(_1936);
        _1934 = _1938;
    }
    float _1940 = _1934;
    bool _1942 = !_1872;
    int _1944 = _1942 ? 0 : (-1);
    int _1946 = _1926 * int(_1886);
    int _1948 = _1946 + _1478;
    bool _1950 = uint(_1930) > 1u;
    int _1952 = ~_949;
    int _1954 = _1952 + 1;
    float _1956 = float(uint(_1948));
    float _1958 = trunc(_1906);
    float _1960 = precise::max(_1958, 0.0);
    uint _1962 = uint(_1960);
    int _1964 = ~_1848;
    int _1966 = _1964 + _1944;
    int _1968 = _1966 + 1;
    int _1970 = _1954 * int(_1912);
    int _1972 = _1970 + _1534;
    bool _1974 = _1950;
    if (!_1766)
    {
        _1814 = _229;
    }
    float _1976 = _1814;
    float _1978 = as_type<float>(_987) * _1956;
    int _1980 = ~_1928;
    int _1982 = _1980 + 1;
    int _1984 = _1982 + 1;
    float _1986 = float(uint(_1972));
    float _1988 = 1.0 / _1792;
    int _1990 = _1984;
    float _1992 = _1976;
    if (!_1950)
    {
        int _1994 = ~_1928;
        int _1996 = _1994 + 1;
        _1990 = _1996;
    }
    int _1998 = _1990;
    if (_1766)
    {
        bool _2000 = _1940 > 0.5;
        _1974 = _2000;
    }
    bool _2002 = _1974;
    float _2004 = as_type<float>(_1031) * _1986;
    int _2006 = _949 * _1968;
    int _2008 = _2006 + _1646;
    bool _2010 = _1188 > 0.5;
    int _2012 = _1824 * int(_1962);
    int _2014 = _2012 + _1866;
    if (_1766)
    {
        float _2016 = -_229;
        float _2018 = _2002 ? _2016 : _229;
        _1992 = _2018;
    }
    float _2020 = _1992;
    float _2022 = trunc(_1978);
    float _2024 = precise::max(_2022, 0.0);
    uint _2026 = uint(_2024);
    bool _2028 = _1930 != 3;
    bool _2030 = uint(_1930) >= 2u;
    float _2032 = float(uint(_2014));
    bool _2034 = !_1530;
    int _2036 = _2034 ? _2008 : (-1);
    float _2038 = trunc(_2004);
    float _2040 = precise::max(_2038, 0.0);
    uint _2042 = uint(_2040);
    float _2044 = as_type<float>(_1007) * _2032;
    int _2046 = _2030 ? 0 : 1;
    float _2048 = -_229;
    int _2050 = _2010 ? as_type<int>(_2048) : as_type<int>(_229);
    int _2052 = _2036 & 3;
    bool _2054 = _2052 != 0;
    float _2056 = trunc(_2044);
    float _2058 = precise::max(_2056, 0.0);
    uint _2060 = uint(_2058);
    int _2062 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2064 = _2062 != 0;
    int _2066 = ~_2046;
    int _2068 = _2066 + 1;
    int _2070 = _2068 + 1;
    int _2072 = _2070;
    if (_2028)
    {
        int _2074 = ~_2046;
        int _2076 = _2074 + 1;
        _2072 = _2076;
    }
    int _2078 = _2072;
    bool _2080 = uint(_2052) > 1u;
    int _2082 = int(_1886) + int(_2026);
    bool _2084 = !_2064;
    float _2086 = _2084 ? _229 : as_type<float>(_2050);
    int _2088 = ~_923;
    int _2090 = _2088 + 1;
    int _2092 = _2036 & 3;
    bool _2094 = _2092 != 0;
    int _2096 = int(_1912) + int(_2042);
    int _2098 = _2090 * _2082;
    int _2100 = _2098 + _1478;
    int _2102 = _2094 ? 0 : 1;
    int _2104 = ~_949;
    int _2106 = _2104 + 1;
    int _2108 = ~_2102;
    int _2110 = _2108 + 1;
    int _2112 = _2110 + 1;
    int _2114 = _2112;
    if (!_2080)
    {
        int _2116 = ~_2102;
        int _2118 = _2116 + 1;
        _2114 = _2118;
    }
    int _2120 = _2114;
    int _2122 = _2106 * _2096;
    int _2124 = _2122 + _1534;
    bool _2126 = uint(_2100) >= uint(_923);
    int _2128 = int(_1962) + int(_2060);
    bool _2130 = !_2126;
    int _2132 = _2130 ? 0 : (-1);
    bool _2134 = uint(_2124) >= uint(_949);
    float _2136 = in.m_56.x;
    float _2138 = in.m_56.y;
    float _2140 = in.m_56.z;
    bool _2142 = _2052 != 3;
    float _2144 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2146 = _2144 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _2148 = ~_933;
    int _2150 = _2148 + 1;
    float _2152 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2154 = _2152 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2156 = !_1932;
    int _2158 = _2156 ? 0 : 1;
    bool _2160 = uint(_2052) >= 2u;
    float _2162 = 1.0 / _2146;
    int _2164 = _2150 * _2128;
    int _2166 = _2164 + _1866;
    bool _2168 = !_2054;
    int _2170 = _2168 ? 0 : 1;
    int _2172 = _2160 ? 0 : 1;
    bool _2174 = _2052 != 3;
    float _2176 = 1.0 / _2154;
    bool _2178 = uint(_2166) >= uint(_933);
    int _2180 = ~_2172;
    int _2182 = _2180 + 1;
    int _2184 = _2182 + 1;
    float _2186 = _197 * _2138;
    float _2188 = _203 * _2138;
    float _2190 = _209 * _2138;
    int _2192 = _2184;
    if (_2142)
    {
        int _2194 = ~_2172;
        int _2196 = _2194 + 1;
        _2192 = _2196;
    }
    int _2198 = _2192;
    float _2200 = fma(_195, _2136, _2186);
    float _2202 = fma(_201, _2136, _2188);
    float _2204 = fma(_207, _2136, _2190);
    float _2206 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2208 = _2206 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2210 = fma(_199, _2140, _2200);
    float _2212 = fma(_211, _2140, _2204);
    float _2214 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2216 = _2214 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2218 = fma(_205, _2140, _2202);
    float _2220 = 1.0 / _2208;
    float _2222 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2224 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2222;
    float _2226 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2228 = _2226 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2230 = in.m_72.w;
    float _2232 = _2224 * _1834;
    float _2234 = _2228 * _1850;
    float _2236 = 1.0 / _2216;
    float _2238 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2240 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2238;
    float _2242 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2244 = _2242 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _2246 = _901 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2248 = isnan(_901);
    bool _2250 = _2246 || _2248;
    bool _2252 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2254 = _2250 || _2252;
    float _2256 = float(_2254);
    float _2258 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2260 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2258;
    float _2262 = _2244 * _1988;
    bool _2264 = _901 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2266 = isnan(_901);
    bool _2268 = _2264 || _2266;
    bool _2270 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2272 = _2268 || _2270;
    float _2274 = float(_2272);
    float _2276 = _2260 * _2220;
    float _2278 = -_2256;
    float _2280 = _2278 + 1.0;
    float _2282 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2284 = _2282 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2286 = _901 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2288 = isnan(_901);
    bool _2290 = _2286 || _2288;
    bool _2292 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2294 = _2290 || _2292;
    float _2296 = float(_2294);
    float _2298 = -_2274;
    float _2300 = _2298 + 1.0;
    float _2302 = _2274 * _2280;
    float _2304 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2306 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2304;
    bool _2308 = _901 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2310 = isnan(_901);
    bool _2312 = _2308 || _2310;
    bool _2314 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2316 = _2312 || _2314;
    float _2318 = float(_2316);
    float _2320 = _2284 * _2236;
    float _2322 = _2296 * _2300;
    float _2324 = -_2296;
    float _2326 = _2324 + 1.0;
    bool _2328 = !_2174;
    int _2330 = _2328 ? 0 : (-1);
    float _2332 = _2306 * _2162;
    bool _2334 = !_2134;
    int _2336 = _2334 ? 0 : (-1);
    float _2338 = _2318 * _2326;
    int _2340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2342 = _2340 != 0;
    float _2344 = _2240 * _2176;
    int _2346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2348 = _2346 != 0;
    float _2350 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2352 = _901 + _2350;
    int _2354 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2356 = _2354 != 0;
    float _2358 = -_2318;
    float _2360 = _2358 + 1.0;
    bool _2362 = !_2178;
    int _2364 = _2362 ? 0 : (-1);
    float _2366 = fma(_2232, _2352, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2368 = _1186 > 0.5;
    float _2370 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2372 = _901 + _2370;
    bool _2374 = _901 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2376 = isnan(_901);
    bool _2378 = _2374 || _2376;
    bool _2380 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2382 = _2378 || _2380;
    float _2384 = float(_2382);
    float _2386 = fma(_2344, _1212, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2388 = fma(_2234, _2372, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _2390 = _901 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2392 = isnan(_901);
    bool _2394 = _2390 || _2392;
    bool _2396 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2398 = _2394 || _2396;
    float _2400 = float(_2398);
    float _2402 = _2384 * _2360;
    float _2404 = -_225;
    int _2406 = _2368 ? as_type<int>(_2404) : as_type<int>(_225);
    float _2408 = -_2384;
    float _2410 = _2408 + 1.0;
    int _2412 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2414 = _2412 != 0;
    float _2416 = -_2400;
    float _2418 = _2416 + 1.0;
    bool _2420 = _901 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2422 = isnan(_901);
    bool _2424 = _2420 || _2422;
    bool _2426 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2428 = _2424 || _2426;
    float _2430 = float(_2428);
    float _2432 = _2400 * _2410;
    bool _2434 = _901 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2436 = isnan(_901);
    bool _2438 = _2434 || _2436;
    bool _2440 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2442 = _2438 || _2440;
    float _2444 = float(_2442);
    float _2446 = in.m_74.w;
    float _2448 = _2218 + _2230;
    float _2450 = _2430 * _2418;
    float _2452 = -_2430;
    float _2454 = _2452 + 1.0;
    float _2456 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2458 = _901 + _2456;
    float _2460 = _2210 + _1230;
    float _2462 = _2444 * _2454;
    float _2464 = fma(_2276, _2458, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2466 = fma(_2262, _1224, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2468 = _2366 * _2462;
    float _2470 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2472 = _901 + _2470;
    bool _2474 = !_2414;
    float _2476 = _2474 ? _225 : as_type<float>(_2406);
    float _2478 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    bool _2480 = _1192 != 1;
    float _2482 = -_2444;
    float _2484 = _2482 + 1.0;
    float _2486 = fma(_2320, _2472, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2488 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2490 = fma(_2484, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2468);
    float _2492 = fma(_2332, _1228, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2494 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2496 = fma(_2388, _2450, _2490);
    float _2498 = _1186 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2500 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2502 = _2212 + _2446;
    float _2504 = _2472;
    float _2506 = _2458;
    float _2508 = _2490;
    float _2510 = _2444;
    float _2512 = _2446;
    if (!_2480)
    {
        _2504 = _1188;
    }
    float _2514 = _2504;
    float _2516 = -_2494;
    float _2518 = fma(_2498, 2.0, _2516);
    float _2520 = _2514;
    if (!_2480)
    {
        _2506 = _1188;
    }
    float _2522 = _2506;
    float _2524 = _1194 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2526 = _2522;
    if (!_2480)
    {
        _2508 = _1090;
    }
    float _2528 = _2508;
    float _2530 = _2020 + (-0.5);
    float _2532 = _2528;
    if (!_2480)
    {
        _2510 = _1090;
    }
    float _2534 = _2510;
    float _2536 = -_135;
    float _2538 = fma(_2536, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2518);
    float _2540 = _2534;
    if (_2480)
    {
        _2520 = _1186;
    }
    float _2542 = _2520;
    if (_2480)
    {
        _2526 = _1186;
    }
    float _2544 = _2526;
    if (_2480)
    {
        _2532 = _1188;
    }
    float _2546 = _2532;
    float _2548 = _2542 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_2480)
    {
        _2540 = _1188;
    }
    float _2550 = _2540;
    bool _2552 = _1196 != 2;
    float _2554 = fma(_2386, _2432, _2496);
    float _2556 = _1188 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2558 = fma(_2556, -2.0, _2500);
    float _2560 = fma(_2466, _2402, _2554);
    float _2562 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2564 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2566 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2568 = _2448 + _2566;
    float _2570 = fma(_1194, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2562);
    float _2572 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2574 = _2460 + _2572;
    float _2576 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2564);
    float _2578 = _1198 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2580 = _2568 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2582 = -_2478;
    float _2584 = fma(_2524, 2.0, _2582);
    float _2586 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2588 = _2502 + _2586;
    float _2590 = fma(_2578, -2.0, _2488);
    float _2592 = fma(_2574, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2580);
    if (_2552)
    {
        _1262 = _1188;
    }
    float _2594 = _1262;
    float _2596 = fma(_2464, _2338, _2560);
    float _2598 = _2594;
    if (_2552)
    {
        _2512 = _1186;
    }
    float _2600 = _2512;
    float _2602 = fma(_2588, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2592);
    float _2604 = _2600;
    if (!_2552)
    {
        _2604 = _1090;
    }
    float _2606 = _2604;
    float _2608 = -_135;
    float _2610 = fma(_2608, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2584);
    if (!_2552)
    {
        _2598 = _1186;
    }
    float _2612 = _2598;
    float _2614 = _1316 + 0.5;
    bool _2616 = _2602 >= 0.0;
    float _2618 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2620 = fma(_2614, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2610);
    float _2622 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2590);
    float _2624 = fma(_2544, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2618);
    int _2626 = _2036 >> 31;
    float _2628 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2630 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2558);
    float _2632 = -_2530;
    float _2634 = -_2622;
    float _2636 = fma(_2632, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2634);
    int _2638 = _2626 & 3;
    float _2640 = fma(_2550, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2628);
    float _2642 = _2086 + (-0.5);
    float _2644 = fma(_2486, _2322, _2596);
    int _2646 = _2036 + _2638;
    float _2648 = _2546 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2650 = float(uint(_1828));
    float _2652 = -_2642;
    float _2654 = -_2630;
    float _2656 = fma(_2652, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2654);
    int _2658 = _2646 >> 2;
    float _2660 = _2606 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2662 = as_type<float>(_1007) * _2650;
    int _2664 = _2658 << 4;
    int _2666 = _2664 + 656;
    float _2668 = fma(_2492, _2302, _2644);
    float _2670 = _2476 + 0.5;
    float _2672 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    uint _2674 = uint(int(uint(_2666) >> uint(2)));
    uint _2676 = uint(int(uint(int(_2674)) >> uint(2)));
    int _2678 = int(_2674) & 3;
    float _2680 = (*spvDescriptorSet0.vp_c9)._m0[int(_2676)][_2678];
    int _2682 = int(_2674) + 1;
    uint _2684 = uint(int(uint(_2682) >> uint(2)));
    int _2686 = _2682 & 3;
    float _2688 = (*spvDescriptorSet0.vp_c9)._m0[int(_2684)][_2686];
    float _2690 = trunc(_2662);
    float _2692 = precise::max(_2690, 0.0);
    uint _2694 = uint(_2692);
    float _2696 = -_2672;
    float _2698 = fma(_2660, 2.0, _2696);
    float _2700 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2576);
    float _2702 = fma(_2670, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2538);
    int _2704 = ~_933;
    int _2706 = _2704 + 1;
    float _2708 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _2710 = _2666 + 8;
    uint _2712 = uint(int(uint(_2710) >> uint(2)));
    uint _2714 = uint(int(uint(int(_2712)) >> uint(2)));
    int _2716 = int(_2712) & 3;
    float _2718 = (*spvDescriptorSet0.vp_c9)._m0[int(_2714)][_2716];
    int _2720 = int(_2712) + 1;
    uint _2722 = uint(int(uint(_2720) >> uint(2)));
    int _2724 = _2720 & 3;
    float _2726 = (*spvDescriptorSet0.vp_c9)._m0[int(_2722)][_2724];
    float _2728 = _2612 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2730 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2732 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2570);
    float _2734 = fma(_2728, -2.0, _2708);
    int _2736 = abs(_2120);
    float _2738 = -_135;
    float _2740 = fma(_2738, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2698);
    float _2742 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2744 = _2706 * int(_2694);
    int _2746 = _2744 + _1828;
    int _2748 = ~_2128;
    int _2750 = _2748 + _2364;
    int _2752 = _2750 + 1;
    float _2754 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2756 = -_2742;
    float _2758 = fma(_2548, 2.0, _2756);
    float _2760 = -_2700;
    float _2762 = _2760 + 1.0;
    float _2764 = float(uint(_2746));
    float _2766 = -_2732;
    float _2768 = _2766 + 1.0;
    float _2770 = fma(_2256, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2668);
    int _2772 = abs(_2170);
    int _2774 = _933 * _2752;
    int _2776 = _2774 + _1866;
    float _2778 = -_2768;
    float _2780 = fma(_2778, _1316, _2620);
    if (_2616)
    {
        _1816 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2782 = _1816;
    float _2784 = as_type<float>(_1007) * _2764;
    float _2786 = fma(_2762, _2020, _2636);
    float _2788 = _2730 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2790 = as_type<int>(_2730);
    if (_2616)
    {
        float _2792 = _2782 * 5.0;
        _2790 = as_type<int>(_2792);
    }
    int _2794 = _2790;
    out.m_84.x = _2780;
    out.m_84.y = _2786;
    float _2796 = trunc(_2784);
    float _2798 = precise::max(_2796, 0.0);
    uint _2800 = uint(_2798);
    int _2802 = ~_2096;
    int _2804 = _2802 + _2336;
    int _2806 = _2804 + 1;
    float _2808 = _1904 + 0.5;
    if (_2616)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9703 = as_type<float>(_2794);
        out.gl_Position.z = _9703;
    }
    int _2810 = ~_933;
    int _2812 = _2810 + 1;
    float _2814 = -_135;
    float _2816 = fma(_2814, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2758);
    int _2818 = _949 * _2806;
    int _2820 = _2818 + _1534;
    int _2822 = abs(_1998);
    float _2824 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2624);
    int _2826 = abs(_2198);
    float _2828 = fma(_2788, _2808, _2816);
    int _2830 = abs(_2330);
    float _2832 = _2754 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2834 = ~_2822;
    int _2836 = _2834 + 1;
    int _2838 = _2836 + 1;
    float _2840 = _1474 + (-0.5);
    int _2842 = ~_2736;
    int _2844 = _2842 + 1;
    int _2846 = _2844 + 1;
    float _2848 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2850 = int(_2848);
    float _2852 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2640);
    int _2854 = int(_2694) + int(_2800);
    int _2856 = _2846 * as_type<int>(_2688);
    int _2858 = ~_2772;
    int _2860 = _2858 + 1;
    int _2862 = _2860 + 1;
    float _2864 = -_2852;
    float _2866 = _2864 + 1.0;
    int _2868 = _1894 >> 31;
    int _2870 = _2812 * _2854;
    int _2872 = _2870 + _1828;
    int _2874 = _2862 * as_type<int>(_2680);
    int _2876 = _2874 + _2856;
    int _2878 = _2868 & 3;
    out.m_86.x = _2770;
    int _2880 = ~_2826;
    int _2882 = _2880 + 1;
    int _2884 = _2882 + 1;
    float _2886 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2888 = _1894 + _2878;
    int _2890 = as_type<int>(_2866);
    if (_2616)
    {
        out.m_63.x = 0.0;
    }
    int _2892 = ~_2830;
    int _2894 = _2892 + 1;
    int _2896 = _2894 + 1;
    int _2898 = _2884 * as_type<int>(_2718);
    int _2900 = _2898 + _2876;
    bool _2902 = !_1716;
    int _2904 = _2902 ? _2776 : (-1);
    float _2906 = fma(_2648, -2.0, _2886);
    bool _2908 = !_2348;
    int _2910 = _2908 ? 0 : 1;
    int _2912 = _2896 * as_type<int>(_2726);
    int _2914 = _2912 + _2900;
    int _2916 = _2904 >> 31;
    float _2918 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2906);
    float _2920 = float(uint(_2850));
    int _2922 = _2916 & 3;
    float _2924 = -_2832;
    float _2926 = -_2918;
    float _2928 = fma(_2924, _2840, _2926);
    int _2930 = abs(_2910);
    float _2932 = 1.0 / _2920;
    int _2934 = abs(_2850);
    float _2936 = fma(_1474, _2866, _2928);
    int _2938 = _2904 + _2922;
    int _2940 = _2888 >> 2;
    float _2942 = float(uint(_2934));
    int _2944 = ~_2930;
    int _2946 = _2944 + 1;
    int _2948 = _2946 + 1;
    int _2950 = _2938 >> 2;
    float _2952 = 1.0 / _2942;
    int _2954 = _2940 << 4;
    int _2956 = _2954 + 368;
    int _2958 = _2914 * _2948;
    bool _2960 = _1930 != 3;
    bool _2962 = !_1530;
    int _2964 = _2962 ? _2820 : (-1);
    uint _2966 = uint(int(uint(_2956) >> uint(2)));
    uint _2968 = uint(int(uint(int(_2966)) >> uint(2)));
    int _2970 = int(_2966) & 3;
    float _2972 = (*spvDescriptorSet0.vp_c9)._m0[int(_2968)][_2970];
    int _2974 = int(_2966) + 1;
    uint _2976 = uint(int(uint(_2974) >> uint(2)));
    int _2978 = _2974 & 3;
    float _2980 = (*spvDescriptorSet0.vp_c9)._m0[int(_2976)][_2978];
    int _2982 = _2950 << 4;
    int _2984 = _2982 + 800;
    int _2986 = _2904 & 3;
    bool _2988 = _2986 != 0;
    int _2990 = _2964 * _2930;
    int _2992 = _2990 + _2958;
    bool _2994 = !_2960;
    int _2996 = _2994 ? 0 : (-1);
    bool _2998 = uint(_2872) >= uint(_933);
    uint _3000 = uint(int(uint(_2984) >> uint(2)));
    uint _3002 = uint(int(uint(int(_3000)) >> uint(2)));
    int _3004 = int(_3000) & 3;
    float _3006 = (*spvDescriptorSet0.vp_c9)._m0[int(_3002)][_3004];
    int _3008 = int(_3000) + 1;
    uint _3010 = uint(int(uint(_3008) >> uint(2)));
    int _3012 = _3008 & 3;
    float _3014 = (*spvDescriptorSet0.vp_c9)._m0[int(_3010)][_3012];
    bool _3016 = !_2988;
    int _3018 = _3016 ? 0 : 1;
    int _3020 = _2904 & 3;
    bool _3022 = _3020 != 0;
    int _3024 = as_type<int>(_2932) + (-2);
    int _3026 = _3022 ? 0 : 1;
    int _3028 = _2984 + 8;
    uint _3030 = uint(int(uint(_3028) >> uint(2)));
    uint _3032 = uint(int(uint(int(_3030)) >> uint(2)));
    int _3034 = int(_3030) & 3;
    float _3036 = (*spvDescriptorSet0.vp_c9)._m0[int(_3032)][_3034];
    int _3038 = int(_3030) + 1;
    uint _3040 = uint(int(uint(_3038) >> uint(2)));
    int _3042 = _3038 & 3;
    float _3044 = (*spvDescriptorSet0.vp_c9)._m0[int(_3040)][_3042];
    float _3046 = float(uint(_2992));
    bool _3048 = uint(_2986) >= 2u;
    int _3050 = ~_2082;
    int _3052 = _3050 + _2132;
    int _3054 = _3052 + 1;
    float _3056 = as_type<float>(_3024) * _3046;
    int _3058 = abs(_2992);
    int _3060 = _2956 + 8;
    uint _3062 = uint(int(uint(_3060) >> uint(2)));
    uint _3064 = uint(int(uint(int(_3062)) >> uint(2)));
    int _3066 = int(_3062) & 3;
    float _3068 = (*spvDescriptorSet0.vp_c9)._m0[int(_3064)][_3066];
    int _3070 = int(_3062) + 1;
    uint _3072 = uint(int(uint(_3070) >> uint(2)));
    int _3074 = _3070 & 3;
    float _3076 = (*spvDescriptorSet0.vp_c9)._m0[int(_3072)][_3074];
    int _3078 = _3048 ? 0 : 1;
    int _3080 = _923 * _3054;
    int _3082 = _3080 + _1478;
    bool _3084 = uint(_2986) > 1u;
    float _3086 = trunc(_3056);
    float _3088 = precise::max(_3086, 0.0);
    uint _3090 = uint(_3088);
    int _3092 = as_type<int>(_2952) + (-2);
    float _3094 = float(uint(_3058));
    bool _3096 = !_2998;
    int _3098 = _3096 ? 0 : (-1);
    bool _3100 = _2986 != 3;
    float _3102 = as_type<float>(_3092) * _3094;
    int _3104 = ~_2854;
    int _3106 = _3104 + _3098;
    int _3108 = _3106 + 1;
    int _3110 = ~_3026;
    int _3112 = _3110 + 1;
    int _3114 = _3112 + 1;
    float _3116 = trunc(_3102);
    float _3118 = precise::max(_3116, 0.0);
    uint _3120 = uint(_3118);
    int _3122 = _3114;
    if (!_3084)
    {
        int _3124 = ~_3026;
        int _3126 = _3124 + 1;
        _3122 = _3126;
    }
    int _3128 = _3122;
    int _3130 = _933 * _3108;
    int _3132 = _3130 + _1828;
    int _3134 = ~_2850;
    int _3136 = _3134 + 1;
    bool _3138 = _2986 != 3;
    int _3140 = _2838 * as_type<int>(_2980);
    int _3142 = ~_3078;
    int _3144 = _3142 + 1;
    int _3146 = _3144 + 1;
    int _3148 = _3146;
    if (_3100)
    {
        int _3150 = ~_3078;
        int _3152 = _3150 + 1;
        _3148 = _3152;
    }
    int _3154 = _3148;
    int _3156 = abs(_2158);
    int _3158 = _3136 * int(_3090);
    int _3160 = _3158 + _2992;
    int _3162 = ~_2934;
    int _3164 = _3162 + 1;
    int _3166 = abs(_3128);
    float _3168 = float(uint(_3160));
    int _3170 = _3164 * int(_3120);
    int _3172 = _3170 + _3058;
    int _3174 = ~_3166;
    int _3176 = _3174 + 1;
    int _3178 = _3176 + 1;
    int _3180 = ~_3156;
    int _3182 = _3180 + 1;
    int _3184 = _3182 + 1;
    float _3186 = as_type<float>(_3024) * _3168;
    float _3188 = float(uint(_3172));
    int _3190 = _3178 * as_type<int>(_3014);
    int _3192 = abs(_3018);
    float _3194 = trunc(_3186);
    float _3196 = precise::max(_3194, 0.0);
    uint _3198 = uint(_3196);
    int _3200 = _3184 * as_type<int>(_2972);
    int _3202 = _3200 + _3140;
    float _3204 = as_type<float>(_3092) * _3188;
    int _3206 = abs(_2078);
    int _3208 = abs(_3154);
    int _3210 = ~_3192;
    int _3212 = _3210 + 1;
    int _3214 = _3212 + 1;
    float _3216 = trunc(_3204);
    float _3218 = precise::max(_3216, 0.0);
    uint _3220 = uint(_3218);
    int _3222 = abs(_2996);
    int _3224 = ~_3206;
    int _3226 = _3224 + 1;
    int _3228 = _3226 + 1;
    int _3230 = _3214 * as_type<int>(_3006);
    int _3232 = _3230 + _3190;
    int _3234 = ~_3208;
    int _3236 = _3234 + 1;
    int _3238 = _3236 + 1;
    int _3240 = ~_3222;
    int _3242 = _3240 + 1;
    int _3244 = _3242 + 1;
    int _3246 = _3228 * as_type<int>(_3068);
    int _3248 = _3246 + _3202;
    int _3250 = ~_2850;
    int _3252 = _3250 + 1;
    int _3254 = _3238 * as_type<int>(_3036);
    int _3256 = _3254 + _3232;
    bool _3258 = !_3138;
    int _3260 = _3258 ? 0 : (-1);
    int _3262 = _3244 * as_type<int>(_3076);
    int _3264 = _3262 + _3248;
    bool _3266 = !_2342;
    int _3268 = _3266 ? 0 : 1;
    int _3270 = int(_3090) + int(_3198);
    int _3272 = abs(_3260);
    int _3274 = abs(_3268);
    int _3276 = _3252 * _3270;
    int _3278 = _3276 + _2992;
    int _3280 = ~_3272;
    int _3282 = _3280 + 1;
    int _3284 = _3282 + 1;
    int _3286 = int(_3120) + int(_3220);
    int _3288 = ~_2934;
    int _3290 = _3288 + 1;
    int _3292 = _3284 * as_type<int>(_3044);
    int _3294 = _3292 + _3256;
    int _3296 = ~_3274;
    int _3298 = _3296 + 1;
    int _3300 = _3298 + 1;
    bool _3302 = uint(_3278) >= uint(_2850);
    int _3304 = _3290 * _3286;
    int _3306 = _3304 + _3058;
    bool _3308 = !_2356;
    int _3310 = _3308 ? 0 : 1;
    int _3312 = _3264 * _3300;
    bool _3314 = !_3302;
    int _3316 = _3314 ? 0 : (-1);
    float _3318 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3320 = abs(_3310);
    bool _3322 = uint(_3306) >= uint(_2934);
    int _3324 = _2992 ^ _2850;
    int _3326 = ~_3270;
    int _3328 = _3326 + _3316;
    int _3330 = _3328 + 1;
    int _3332 = ~_3320;
    int _3334 = _3332 + 1;
    int _3336 = _3334 + 1;
    bool _3338 = !_3322;
    int _3340 = _3338 ? 0 : (-1);
    int _3342 = _2850 * _3330;
    int _3344 = _3342 + _2992;
    uint _3346 = uint(int(uint(_3324) >> uint(31)));
    int _3348 = _3294 * _3336;
    bool _3350 = _2850 == 0;
    float _3352 = _3318 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3354 = _2850 == 0;
    float _3356 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3358 = ~_3340;
    int _3360 = _3286 + _3358;
    int _3362 = _3360 + 1;
    float _3364 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2734);
    int _3366 = ~int(_3346);
    int _3368 = _3366 + 1;
    bool _3370 = !_1522;
    int _3372 = _3370 ? _3082 : (-1);
    int _3374 = _3362 ^ _3368;
    bool _3376 = !_3350;
    int _3378 = _3376 ? _3344 : (-1);
    int _3380 = _3372 * _3274;
    int _3382 = _3380 + _3312;
    int _3384 = ~_3368;
    int _3386 = _3384 + _3374;
    int _3388 = _3386 + 1;
    float _3390 = float(_3378);
    bool _3392 = !_3354;
    int _3394 = _3392 ? _3388 : (-1);
    float _3396 = fma(_3352, _3390, _2740);
    float _3398 = _3356 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3400 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3402 = _1372 + 0.5;
    float _3404 = float(_3394);
    float _3406 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3400);
    bool _3408 = !_1716;
    int _3410 = _3408 ? _3132 : (-1);
    float _3412 = fma(_3352, _3402, _3396);
    float _3414 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3416 = -_3364;
    float _3418 = fma(_3398, _3404, _3416);
    float _3420 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3406);
    float _3422 = _1366 + (-0.5);
    float _3424 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3414);
    int _3426 = _3410 * _3320;
    int _3428 = _3426 + _3348;
    float _3430 = -_3420;
    float _3432 = _3430 + 1.0;
    float _3434 = -_3398;
    float _3436 = fma(_3434, _3422, _3418);
    float _3438 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3424);
    float _3440 = -_3432;
    float _3442 = fma(_1372, _3440, _3412);
    float _3444 = _2568 * _2568;
    float _3446 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3448 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3450 = -_3438;
    float _3452 = _3450 + 1.0;
    float _3454 = fma(_2574, _2574, _3444);
    float _3456 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3446);
    float _3458 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3448);
    float _3460 = -_3452;
    float _3462 = fma(_2476, _3460, _2702);
    float _3464 = fma(_2588, _2588, _3454);
    float _3466 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3456);
    float _3468 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3458);
    float _3470 = float(_3382);
    float _3472 = -_3466;
    float _3474 = _3472 + 1.0;
    float _3476 = rsqrt(_3464);
    float _3478 = -_2824;
    float _3480 = _3478 + 1.0;
    float _3482 = -_3468;
    float _3484 = _3482 + 1.0;
    float _3486 = fma(_2086, _3474, _2656);
    int _3488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3490 = _3488 != 0;
    int _3492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3494 = _3492 != 0;
    int _3496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3498 = _3496 != 0;
    float _3500 = -_3480;
    float _3502 = fma(_1904, _3500, _2828);
    float _3504 = float(_3428);
    float _3506 = fma(_1366, _3484, _3436);
    out.m_88.x = _3470;
    bool _3508 = !_3494;
    int _3510 = _3508 ? 0 : 1;
    bool _3512 = !_3498;
    int _3514 = _3512 ? 0 : 1;
    out.m_90.x = _3462;
    out.m_90.y = _3486;
    out.m_90.z = _3502;
    out.m_90.w = _2936;
    bool _3516 = !_3490;
    int _3518 = _3516 ? 0 : 1;
    out.m_88.w = _3504;
    float _3520 = _2568 * _3476;
    float _3522 = _2574 * _3476;
    out.m_92.x = _3442;
    out.m_92.y = _3506;
    float _3524 = _3502;
    float _3526 = _3520;
    if (_2616)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3528 = -_3520;
    float _3530 = fma(_3528, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2448);
    float _3532 = _2588 * _3476;
    float _3534 = -_3522;
    float _3536 = fma(_3534, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2460);
    float _3538 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3540 = _3530 + _3538;
    float _3542 = -_3532;
    float _3544 = fma(_3542, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2502);
    float _3546 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3548 = _3536 + _3546;
    float _3550 = _3540 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3552 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3554 = _3544 + _3552;
    float _3556 = fma(_3548, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3550);
    float _3558 = fma(_3554, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3556);
    bool _3560 = _3558 >= 0.0;
    float _3562 = _3554;
    if (_3560)
    {
        _3524 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3564 = _3524;
    int _3566 = as_type<int>(_3564);
    if (_3560)
    {
        out.m_63.x = 0.0;
    }
    if (_3560)
    {
        float _3568 = _3564 * 5.0;
        _3566 = as_type<int>(_3568);
    }
    int _3570 = _3566;
    if (_3560)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10809 = as_type<float>(_3570);
        out.gl_Position.z = _10809;
    }
    if (_3560)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3572 = fma(_3536, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3574 = fma(_3544, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3576 = floor(_3572);
    float _3578 = floor(_3574);
    float _3580 = -_3576;
    float _3582 = _3572 + _3580;
    float _3584 = -_3578;
    float _3586 = _3574 + _3584;
    float2 _10845 = float2(_3582, _3586);
    float _3588 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_10845, float2(0.0), isnan(_10845)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_10845, float2(0.0), isnan(_10845)), level(0.0)).x;
    float _3590 = _1090 * 2.0;
    float _3592 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3594 = log2(_3592);
    float _3596 = _1186 * 2.0;
    float _3598 = _1188 + _1186;
    float _3600 = _1188 * 2.0;
    int _3602 = abs(_3518);
    float _3604 = -_3520;
    float _3606 = fma(_3604, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2568);
    float _3608 = _3598 + (-1.0);
    float _3610 = -_3522;
    float _3612 = fma(_3610, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2574);
    float _3614 = floor(_3590);
    float _3616 = _3606 * _3606;
    float _3618 = float(_3602);
    float _3620 = -_3532;
    float _3622 = fma(_3620, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2588);
    float _3624 = _701 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3626 = _703 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3628 = floor(_3596);
    float _3630 = _3594 * _135;
    bool _3632 = _3614 > 0.0;
    float _3634 = floor(_3600);
    bool _3636 = _3614 >= 0.0;
    bool _3638 = isnan(_3614);
    bool _3640 = _3636 || _3638;
    bool _3642 = isnan(0.0);
    bool _3644 = _3640 || _3642;
    float _3646 = fma(_3608, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3648 = _1188 + _1090;
    float _3650 = _1188 + (-0.5);
    int _3652 = _3644 ? 0 : 1;
    float _3654 = _3648 + (-1.0);
    float _3656 = exp2(_3630);
    bool _3658 = _3628 >= 0.0;
    bool _3660 = isnan(_3628);
    bool _3662 = _3658 || _3660;
    bool _3664 = isnan(0.0);
    bool _3666 = _3662 || _3664;
    int _3668 = ~_3652;
    int _3670 = _3668 + 1;
    int _3672 = _3670 + 1;
    int _3674 = _3672;
    int _3676 = 2;
    if (!_3632)
    {
        int _3678 = ~_3652;
        int _3680 = _3678 + 1;
        _3674 = _3680;
    }
    int _3682 = _3674;
    bool _3684 = _3628 > 0.0;
    bool _3686 = _3634 > 0.0;
    float _3688 = fma(_3654, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3690 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3692 = 1.0 + _3690;
    float _3694 = in.m_94.x;
    float _3696 = in.m_94.y;
    float _3698 = in.m_94.z;
    bool _3700 = _3634 >= 0.0;
    bool _3702 = isnan(_3634);
    bool _3704 = _3700 || _3702;
    bool _3706 = isnan(0.0);
    bool _3708 = _3704 || _3706;
    float _3710 = -_3656;
    float _3712 = _3710 + 1.0;
    float _3714 = 1.0 / _3692;
    int _3716 = _3666 ? 0 : 1;
    bool _3718 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3720 = isnan(1.0);
    bool _3722 = _3718 || _3720;
    bool _3724 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3726 = _3722 || _3724;
    int _3728 = ~_3716;
    int _3730 = _3728 + 1;
    int _3732 = _3730 + 1;
    int _3734 = _3732;
    if (!_3684)
    {
        int _3736 = ~_3716;
        int _3738 = _3736 + 1;
        _3734 = _3738;
    }
    int _3740 = _3734;
    bool _3742 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3744 = isnan(0.0);
    bool _3746 = _3742 || _3744;
    bool _3748 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3750 = _3746 || _3748;
    float _3752 = float(_3682);
    float _3754 = _3750 ? _3712 : 0.0;
    int _3756 = abs(_3510);
    float _3758 = _3618 * _3752;
    float _3760 = float(_3740);
    if (_3726)
    {
        float _3762 = _3754 * _3714;
        _145 = _3762;
    }
    float _3764 = _145;
    float _3766 = float(_3756);
    float _3768 = fma(_3612, _3612, _3616);
    float _3770 = _3758 * (-2.0);
    int _3772 = _3708 ? 0 : 1;
    float _3774 = _3766 * _3760;
    float _3776 = _1186 + (-0.5);
    float _3778 = fma(_3770, _3694, _3694);
    float _3780 = fma(_3646, _3770, _3646);
    int _3782 = abs(_3514);
    float _3784 = _1186 + _1090;
    float _3786 = fma(_3776, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3778);
    float _3788 = _3774 * (-2.0);
    int _3790 = ~_3772;
    int _3792 = _3790 + 1;
    int _3794 = _3792 + 1;
    float _3796 = _3784 + (-1.0);
    int _3798 = _3794;
    if (!_3686)
    {
        int _3800 = ~_3772;
        int _3802 = _3800 + 1;
        _3798 = _3802;
    }
    int _3804 = _3798;
    float _3806 = fma(_3688, _3788, _3688);
    float _3808 = fma(_3788, _3696, _3696);
    float _3810 = _1090 + (-0.5);
    float _3812 = float(_3804);
    float _3814 = fma(_3650, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3808);
    float _3816 = float(_3782);
    float _3818 = fma(_3780, _3764, _3786);
    float _3820 = fma(_3622, _3622, _3768);
    float _3822 = fma(_3806, _3764, _3814);
    float _3824 = _3816 * _3812;
    float _3826 = _3818 * 0.15915493667125701904296875;
    float _3828 = _3822 * 0.15915493667125701904296875;
    float _3830 = _3824 * (-2.0);
    float _3832 = sqrt(_3820);
    float _3834 = fma(_3796, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3836 = fma(_3830, _3698, _3698);
    float _3838 = fma(_3834, _3830, _3834);
    float _3840 = fma(_3810, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3836);
    float _3842 = _3826 * 6.283185482025146484375;
    float _3844 = sin(_3842);
    float _3846 = fma(_3838, _3764, _3840);
    float _3848 = _3530 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3850 = _3846 * 0.15915493667125701904296875;
    float _3852 = fma(_3536, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3848);
    float _3854 = _3826 * 6.283185482025146484375;
    float _3856 = cos(_3854);
    float _3858 = _3476 * _3832;
    float _3860 = fma(_3544, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3852);
    float _3862 = _3860 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3864 = _3530 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3866 = _3828 * 6.283185482025146484375;
    float _3868 = sin(_3866);
    float _3870 = fma(_3536, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3864);
    float _3872 = fma(_3544, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3870);
    float _3874 = _3828 * 6.283185482025146484375;
    float _3876 = cos(_3874);
    float _3878 = _3872 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3880 = _3878 + _3862;
    float _3882 = 1.0 / _3862;
    float _3884 = _3844 * _3868;
    float _3886 = _3850 * 6.283185482025146484375;
    float _3888 = sin(_3886);
    float _3890 = _3856 * _3876;
    float _3892 = _3858 * _3624;
    float _3894 = _3844 * _3876;
    float _3896 = _3850 * 6.283185482025146484375;
    float _3898 = cos(_3896);
    float _3900 = _3880 * _3882;
    float _3902 = _3900 * 0.5;
    float _3904 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _229);
    float _3906 = _3904 * _3892;
    float _3908 = _3858 * _3626;
    float _3910 = fma(_3888, _3890, _3884);
    float _3912 = fma(_3888, _3884, _3890);
    float _3914 = _3856 * _3868;
    float _3916 = -_3914;
    float _3918 = fma(_3888, _3894, _3916);
    float _3920 = _3868 * _3898;
    float _3922 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3924 = fma(_3902, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3922);
    float _3926 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _3928 = _3856 * _3898;
    float _3930 = _3876 * _3898;
    float _3932 = _3844 * _3898;
    float _3934 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _225);
    float _3936 = 1.0 / _3924;
    float _3938 = _3530 + _3926;
    float _3940 = -_3894;
    float _3942 = fma(_3888, _3914, _3940);
    float _3944 = _3934 * _3908;
    float _3946 = -_3906;
    float _3948 = _3888 * _3946;
    float _3950 = _3928 * _3906;
    float _3952 = _3938 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _3954 = _3932 * _3906;
    float _3956 = fma(_3930, _3944, _3948);
    float _3958 = fma(_3910, _3944, _3950);
    float _3960 = _3938 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _3962 = fma(_3536, (*spvDescriptorSet0.vp_c15)._m0[126].x, _3952);
    float _3964 = fma(_3918, _3944, _3954);
    float _3966 = _3858 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3968 = _3966 * 0.5;
    float _3970 = fma(_3536, (*spvDescriptorSet0.vp_c15)._m0[127].x, _3960);
    float _3972 = fma(_3544, (*spvDescriptorSet0.vp_c15)._m0[126].z, _3962);
    float _3974 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3976 = _3936 * _3974;
    float _3978 = fma(_3942, _3968, _3958);
    float _3980 = fma(_3920, _3968, _3956);
    float _3982 = fma(_3544, (*spvDescriptorSet0.vp_c15)._m0[127].z, _3970);
    float _3984 = _3972 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _3986 = _3976 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _3988 = fma(_3912, _3968, _3964);
    bool _3990 = _3976 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _3992 = _3978 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3994 = _3978 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3996 = trunc(_3984);
    int _3998 = int(_3996);
    float _4000 = _3982 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _4002 = fma(_3980, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3992);
    float _4004 = fma(_3980, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3994);
    bool _4006 = !_3986;
    int _4008 = _4006 ? 0 : 1;
    float _4010 = _3978 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4012 = fma(_3988, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4002);
    float _4014 = fma(_3988, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4004);
    float _4016 = trunc(_4000);
    int _4018 = int(_4016);
    int _4020 = as_type<int>(_4010);
    int _4022 = as_type<int>(_3988);
    if (!_3986)
    {
        _3676 = 1;
    }
    int _4024 = _3676;
    float _4026 = _4012 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _4028 = _4024;
    if (!_3990)
    {
        _4028 = _4008;
    }
    int _4030 = _4028;
    float _4032 = _4014 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _4034 = fma(_3980, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4010);
    float _4036 = _2502 + _4026;
    int _4038 = _4030 << 6;
    float _4040 = _2460 + _4032;
    int _4042 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _4044 = _3998 + _4042;
    int _4046 = _4044 + 1;
    float _4048 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _4050 = _4036 + _4048;
    int _4052 = _4038 + 48;
    uint _4054 = uint(int(uint(_4052) >> uint(2)));
    uint _4056 = uint(int(uint(int(_4054)) >> uint(2)));
    int _4058 = int(_4054) & 3;
    float _4060 = (*spvDescriptorSet0.vp_c15)._m0[int(_4056)][_4058];
    int _4062 = int(_4054) + 1;
    uint _4064 = uint(int(uint(_4062) >> uint(2)));
    int _4066 = _4062 & 3;
    float _4068 = (*spvDescriptorSet0.vp_c15)._m0[int(_4064)][_4066];
    float _4070 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _4072 = _4040 + _4070;
    bool _4074 = _4046 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _4076 = fma(_3988, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4034);
    int _4078 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _4080 = _4018 + _4078;
    int _4082 = _4080 + 1;
    float _4084 = _4050 * _4050;
    float _4086 = _4076 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _4088 = _4038 + 56;
    uint _4090 = uint(int(uint(_4088) >> uint(2)));
    uint _4092 = uint(int(uint(int(_4090)) >> uint(2)));
    int _4094 = int(_4090) & 3;
    float _4096 = (*spvDescriptorSet0.vp_c15)._m0[int(_4092)][_4094];
    int _4098 = int(_4090) + 1;
    uint _4100 = uint(int(uint(_4098) >> uint(2)));
    int _4102 = _4098 & 3;
    float _4104 = (*spvDescriptorSet0.vp_c15)._m0[int(_4100)][_4102];
    int _4106 = _4046 | _4082;
    float _4108 = fma(_4072, _4072, _4084);
    float _4110 = _2448 + _4086;
    bool _4112 = _4106 < 0;
    bool _4114 = _4112 || _4074;
    float _4116 = sqrt(_4108);
    int _4118 = _4038 + 64;
    uint _4120 = uint(int(uint(_4118) >> uint(2)));
    uint _4122 = uint(int(uint(int(_4120)) >> uint(2)));
    int _4124 = int(_4120) & 3;
    float _4126 = (*spvDescriptorSet0.vp_c15)._m0[int(_4122)][_4124];
    int _4128 = int(_4120) + 1;
    uint _4130 = uint(int(uint(_4128) >> uint(2)));
    int _4132 = _4128 & 3;
    float _4134 = (*spvDescriptorSet0.vp_c15)._m0[int(_4130)][_4132];
    bool _4136 = _4082 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _4138 = _4136 || _4114;
    int _4140 = _4038 + 72;
    uint _4142 = uint(int(uint(_4140) >> uint(2)));
    uint _4144 = uint(int(uint(int(_4142)) >> uint(2)));
    int _4146 = int(_4142) & 3;
    float _4148 = (*spvDescriptorSet0.vp_c15)._m0[int(_4144)][_4146];
    int _4150 = int(_4142) + 1;
    uint _4152 = uint(int(uint(_4150) >> uint(2)));
    int _4154 = _4150 & 3;
    float _4156 = (*spvDescriptorSet0.vp_c15)._m0[int(_4152)][_4154];
    float _4158 = as_type<float>(_4046);
    float _4160 = as_type<float>(_4082);
    float _4162 = _4040;
    float _4164 = _4108;
    if (!_4138)
    {
        int _4166 = _4082 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _4168 = _4166 + _4046;
        _4020 = _4168;
    }
    int _4170 = _4020;
    bool _4172 = _4116 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _4174 = _4038 + 96;
    uint _4176 = uint(int(uint(_4174) >> uint(2)));
    uint _4178 = uint(int(uint(int(_4176)) >> uint(2)));
    int _4180 = int(_4176) & 3;
    float _4182 = (*spvDescriptorSet0.vp_c15)._m0[int(_4178)][_4180];
    int _4184 = int(_4176) + 1;
    uint _4186 = uint(int(uint(_4184) >> uint(2)));
    int _4188 = _4184 & 3;
    float _4190 = (*spvDescriptorSet0.vp_c15)._m0[int(_4186)][_4188];
    if (!_4138)
    {
        int _4192 = _4170 << 2;
        _4022 = _4192;
    }
    int _4194 = _4022;
    int _4196 = _4194;
    if (!_4138)
    {
        uint _4198 = uint(int(uint(_4170) >> uint(2)));
        _2890 = int(_4198);
    }
    int _4200 = _2890;
    float _4202 = as_type<float>(_4200);
    if (!_4138)
    {
        int _4204 = 12 & _4194;
        _4196 = _4204;
    }
    int _4206 = _4196;
    int _4208 = _4038 + 104;
    uint _4210 = uint(int(uint(_4208) >> uint(2)));
    uint _4212 = uint(int(uint(int(_4210)) >> uint(2)));
    int _4214 = int(_4210) & 3;
    float _4216 = (*spvDescriptorSet0.vp_c15)._m0[int(_4212)][_4214];
    int _4218 = int(_4210) + 1;
    uint _4220 = uint(int(uint(_4218) >> uint(2)));
    int _4222 = _4218 & 3;
    float _4224 = (*spvDescriptorSet0.vp_c15)._m0[int(_4220)][_4222];
    if (!_4138)
    {
        int _4226 = _4200 << 4;
        int _4228 = _4226 + _4206;
        _4202 = as_type<float>(_4228);
    }
    float _4230 = _4202;
    if (!_4172)
    {
        _4158 = _4040;
    }
    float _4232 = _4158;
    float _4234 = _4232;
    if (!_4172)
    {
        _4160 = _4036;
    }
    float _4236 = _4160;
    float _4238 = _4236;
    if (!_4172)
    {
        _4162 = _4110;
    }
    float _4240 = _4162;
    bool _4242 = !_4172;
    float _4244 = _4240;
    float _4246 = _4126;
    if (!_4242)
    {
        float _4248 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4250 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4252 = _4116 + _4250;
        float _4254 = _4110 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4256 = rsqrt(_4108);
        float _4258 = _4252 * _4248;
        float _4260 = _4258 * 0.15915493667125701904296875;
        float _4262 = _4260 * 6.283185482025146484375;
        float _4264 = cos(_4262);
        float _4266 = _4260 * 6.283185482025146484375;
        float _4268 = sin(_4266);
        float _4270 = _4264 + (-1.0);
        float _4272 = fma(_4268, _4254, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4274 = _4270 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4276 = _4256 * _4272;
        float _4278 = fma(_4110, _4264, _4274);
        float _4280 = fma(_4072, _4276, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4282 = fma(_4050, _4276, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _4244 = _4278;
        _4234 = _4280;
        _4238 = _4282;
        _4164 = _4256;
    }
    float _4284 = _4244;
    float _4286 = _4234;
    float _4288 = _4238;
    float _4290 = _4164;
    float _4292 = -_2448;
    float _4294 = _4292 + _4284;
    int _4296 = _4038 + 80;
    uint _4298 = uint(int(uint(_4296) >> uint(2)));
    uint _4300 = uint(int(uint(int(_4298)) >> uint(2)));
    int _4302 = int(_4298) & 3;
    float _4304 = (*spvDescriptorSet0.vp_c15)._m0[int(_4300)][_4302];
    int _4306 = int(_4298) + 1;
    uint _4308 = uint(int(uint(_4306) >> uint(2)));
    int _4310 = _4306 & 3;
    float _4312 = (*spvDescriptorSet0.vp_c15)._m0[int(_4308)][_4310];
    float _4314 = -_2460;
    float _4316 = _4314 + _4286;
    float _4318 = -_2502;
    float _4320 = _4318 + _4288;
    float _4322 = _4294 * _4294;
    float _4324 = _3938 * _4190;
    float _4326 = _4290;
    float _4328 = _4322;
    float _4330 = _4288;
    float _4332 = _4286;
    float _4334 = _4284;
    if (!_4138)
    {
        float _4336 = floor(_3984);
        _4326 = _4336;
    }
    float _4338 = _4326;
    float _4340 = _3938 * _4134;
    float _4342 = fma(_4316, _4316, _4322);
    int _4344 = _4038 + 88;
    uint _4346 = uint(int(uint(_4344) >> uint(2)));
    uint _4348 = uint(int(uint(int(_4346)) >> uint(2)));
    int _4350 = int(_4346) & 3;
    float _4352 = (*spvDescriptorSet0.vp_c15)._m0[int(_4348)][_4350];
    int _4354 = int(_4346) + 1;
    uint _4356 = uint(int(uint(_4354) >> uint(2)));
    int _4358 = _4354 & 3;
    float _4360 = (*spvDescriptorSet0.vp_c15)._m0[int(_4356)][_4358];
    float _4362 = fma(_3536, _4182, _4324);
    float _4364 = fma(_3536, _4126, _4340);
    float _4366 = fma(_4320, _4320, _4342);
    float _4368 = fma(_3544, _4216, _4362);
    if (!_4138)
    {
        float _4370 = floor(_4000);
        _4328 = _4370;
    }
    float _4372 = _4328;
    bool _4374 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _4376 = isnan(0.5);
    bool _4378 = _4374 || _4376;
    bool _4380 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4382 = _4378 || _4380;
    float _4384 = _4230;
    float _4386 = _4372;
    if (!_4138)
    {
        int _4388 = as_type<int>(_4230) + 400;
        uint _4390 = uint(int(uint(_4388) >> uint(2)));
        uint _4392 = uint(int(uint(int(_4390)) >> uint(2)));
        int _4394 = int(_4390) & 3;
        float _4396 = (*spvDescriptorSet0.vp_c15)._m0[int(_4392)][_4394];
        _4384 = _4396;
    }
    float _4398 = _4384;
    float _4400 = _4368 + _4224;
    float _4402 = _3938 * _4068;
    float _4404 = fma(_3544, _4148, _4364);
    float _4406 = sqrt(_4366);
    float _4408 = fma(_3536, _4060, _4402);
    float _4410 = fma(_3544, _4096, _4408);
    float _4412 = 1.0 / _4400;
    bool _4414 = _4406 > 0.0;
    bool _4416 = !_4414;
    float _4418 = _4404;
    if (!_4416)
    {
        float _4420 = _245 * _245;
        float _4422 = rsqrt(_4366);
        float _4424 = fma(_241, _241, _4420);
        float _4426 = fma(_247, _247, _4424);
        float _4428 = sqrt(_4426);
        float _4430 = _4316 * _4422;
        float _4432 = _4294 * _4422;
        float _4434 = _4320 * _4422;
        bool _4436 = _4428 > 0.0;
        bool _4438 = !_4436;
        if (!_4438)
        {
            float _4440 = rsqrt(_4426);
            float _4442 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4444 = _245 * _4440;
            float _4446 = _241 * _4440;
            float _4448 = _247 * _4440;
            float _4450 = _4432 * _4444;
            float _4452 = fma(_4430, _4446, _4450);
            float _4454 = _4442 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4456 = fma(_4434, _4448, _4452);
            float _4458 = _4456 * _4454;
            float _4460 = fma(_241, _4458, _4286);
            float _4462 = fma(_245, _4458, _4284);
            float _4464 = fma(_247, _4458, _4288);
            _4330 = _4464;
            _4332 = _4460;
            _4334 = _4462;
            _4246 = _4446;
        }
    }
    float _4466 = _4330;
    float _4468 = _4332;
    float _4470 = _4334;
    float _4472 = _4246;
    float _4474 = -_3532;
    float _4476 = fma(_4474, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4466);
    float _4478 = _4404 + _4156;
    float _4480 = -_3522;
    float _4482 = fma(_4480, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4468);
    float _4484 = -_3520;
    float _4486 = fma(_4484, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4470);
    float _4488 = _4410 + _4104;
    float _4490 = _4486;
    float _4492 = _4482;
    if (_4382)
    {
        _4418 = _4476;
    }
    float _4494 = _4418;
    float _4496 = _4494;
    if (!_4382)
    {
        float _4498 = _3540 * _3540;
        float _4500 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4502 = -_2502;
        float _4504 = _4502 + _4466;
        float _4506 = -_2448;
        float _4508 = _4506 + _4470;
        float _4510 = fma(_3548, _3548, _4498);
        float _4512 = -_2460;
        float _4514 = _4512 + _4468;
        float _4516 = fma(_3554, _3554, _4510);
        float _4518 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4520 = sqrt(_4516);
        float _4522 = 1.0 / _3858;
        float _4524 = _4518 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4526 = precise::min(_4520, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4528 = _4526 * _4500;
        float _4530 = _4528 * _4522;
        float _4532 = _4524 * _4530;
        float _4534 = _4504 * _4530;
        float _4536 = fma(_4508, _4532, _3530);
        float _4538 = fma(_4514, _4532, _3536);
        float _4540 = fma(_4524, _4534, _3544);
        _4490 = _4536;
        _4492 = _4538;
        _4496 = _4540;
    }
    float _4542 = _4490;
    float _4544 = _4492;
    float _4546 = _4496;
    float _4548 = _4542 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4550 = _4542 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4552 = _4488 * _4412;
    float _4554 = _4542 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4556 = fma(_4544, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4548);
    float _4558 = fma(_4544, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4550);
    float _4560 = _4478 * _4412;
    bool _4562 = _4552 >= 0.0;
    float _4564 = fma(_4546, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4556);
    float _4566 = fma(_4544, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4554);
    float _4568 = fma(_4546, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4558);
    float _4570 = _4542 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4572 = _4564 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _4574 = _4552 <= 1.0;
    bool _4576 = _4574 && _4562;
    float _4578 = fma(_4546, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4566);
    float _4580 = _4568 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4582 = fma(_4544, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4570);
    float _4584 = _4572 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _4586 = _4560 >= 0.0;
    bool _4588 = _4586 && _4576;
    float _4590 = _4578 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4592 = fma(_4546, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4582);
    float _4594 = fma(_4580, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4584);
    bool _4596 = _4560 <= 1.0;
    bool _4598 = _4596 && _4588;
    float _4600 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4602 = _4590 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4604 = _4592 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4606 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4594);
    float _4608 = _4572 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4610 = -_4602;
    float _4612 = fma(_4610, _4600, 1.0);
    float _4614 = _3938 * _4312;
    float _4616 = fma(_4604, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4606);
    float _4618 = _4572 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4620 = fma(_4580, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4608);
    float _4622 = fma(_3536, _4304, _4614);
    float _4624 = 1.0 / _4616;
    float _4626 = _4554;
    float _4628 = _4566;
    float _4630 = _4616;
    if (_4598)
    {
        float _4632 = float(_4030);
        _4626 = _4632;
    }
    float _4634 = _4626;
    float _4636 = fma(_4580, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4618);
    float _4638 = fma(_3544, _4352, _4622);
    float _4640 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4620);
    if (!_4138)
    {
        float _4642 = -_4338;
        float _4644 = _3984 + _4642;
        _4628 = _4644;
    }
    float _4646 = _4628;
    float _4648 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4636);
    float _4650 = _4638 + _4360;
    float _4652 = log2(_4612);
    float _4654 = _4646;
    if (!_4138)
    {
        float _4656 = -_4372;
        float _4658 = _4000 + _4656;
        _4386 = _4658;
    }
    float _4660 = _4386;
    float _4662 = fma(_4604, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4648);
    float _4664 = fma(_4604, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4640);
    float _4666 = _4650 * _4412;
    float _4668 = _4472;
    if (!_4138)
    {
        float _4670 = rint(_4398);
        float _4672 = precise::max(_4670, 0.0);
        uint _4674 = uint(_4672);
        uint _4676 = clamp(_4674, 0u, 65535u);
        _4668 = as_type<float>(_4676);
    }
    float _4678 = _4668;
    float _4680 = _4662 * _4624;
    float _4682 = _4664 * _4624;
    float _4684 = fma(_4680, 0.5, 0.5);
    float _4686 = fma(_4682, -0.5, 0.5);
    float _4688 = _4634;
    float _4690 = _4682;
    if (_4598)
    {
        float _4692 = rint(_4634);
        float _4694 = precise::max(_4692, 0.0);
        uint _4696 = uint(_4694);
        uint _4698 = clamp(_4696, 0u, 65535u);
        _4688 = as_type<float>(_4698);
    }
    float _4700 = _4688;
    float _4702 = _4652 * 0.693147182464599609375;
    float _4704 = _4702 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4706 = _4660;
    if (!_4138)
    {
        float3 _12624 = float3(_4646, _4660, float(as_type<int>(_4678)));
        float3 _12628 = select(_12624, float3(0.0), isnan(_12624));
        float _4708 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _12628.xy, uint(rint(_12628.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _12628.xy, uint(rint(_12628.z)), level(0.0)).x;
        _4706 = _4708;
    }
    float _4710 = _4706;
    float _4712 = _4560;
    if (_4598)
    {
        float3 _12643 = float3(_4552, _4560, float(as_type<int>(_4700)));
        float3 _12645 = select(_12643, float3(0.0), isnan(_12643));
        float _4714 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _12645.xy, uint(rint(_12645.z)), _4666, level(0.0));
        _4712 = _4714;
    }
    float _4716 = _4712;
    float3 _12655 = float3(_4684, _4686, _4704);
    float _4718 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12655, float3(0.0), isnan(_12655)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12655, float3(0.0), isnan(_12655)), level(0.0)).x;
    float3 _12664 = float3(_4684, _4686, _4704);
    float4 _4721 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12664, float3(0.0), isnan(_12664)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12664, float3(0.0), isnan(_12664)), level(0.0)).xyzw;
    float _4723 = _4721.x;
    float _4725 = _4721.y;
    float _4727 = _4721.z;
    float _4729 = _4721.w;
    bool _4731 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _4733 = isnan(0.5);
    bool _4735 = _4731 || _4733;
    bool _4737 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4739 = _4735 || _4737;
    if (_4138)
    {
        _3562 = 1.0;
    }
    float _4741 = _3562;
    float _4743 = _4741;
    if (_4739)
    {
        _4690 = 1.0;
    }
    float _4745 = _4690;
    float _4747 = _4745;
    float _4749 = _4725;
    float _4751 = _4723;
    if (!_4739)
    {
        float _4753 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4755 = _4753 * 0.15915493667125701904296875;
        float _4757 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4759 = _4755 * 6.283185482025146484375;
        float _4761 = cos(_4759);
        float _4763 = _4757 * 0.15915493667125701904296875;
        float _4765 = _4755 * 6.283185482025146484375;
        float _4767 = sin(_4765);
        float _4769 = 1.0 / _4761;
        float _4771 = _4763 * 6.283185482025146484375;
        float _4773 = cos(_4771);
        float _4775 = _4767 * _4769;
        float _4777 = _4763 * 6.283185482025146484375;
        float _4779 = sin(_4777);
        float _4781 = _4773 * _4775;
        float _4783 = 1.0 / _4781;
        float _4785 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4787 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4785;
        float _4789 = 1.0 / _4787;
        float _4791 = _4779 * _4783;
        float _4793 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4795 = fma(_3976, _4791, _4793);
        float _4797 = _4795 * _4789;
        float _4799 = precise::clamp(_4797, 0.0, 1.0);
        _4654 = _4769;
        _4747 = _4799;
    }
    float _4801 = _4654;
    float _4803 = _4747;
    float _4805 = _4801;
    if (!_4138)
    {
        int _4807 = _4170 << 4;
        int _4809 = _4807 + 2048;
        uint _4811 = uint(int(uint(_4809) >> uint(2)));
        uint _4813 = uint(int(uint(int(_4811)) >> uint(2)));
        int _4815 = int(_4811) & 3;
        float _4817 = (*spvDescriptorSet0.vp_c15)._m0[int(_4813)][_4815];
        int _4819 = int(_4811) + 1;
        uint _4821 = uint(int(uint(_4819) >> uint(2)));
        int _4823 = _4819 & 3;
        float _4825 = (*spvDescriptorSet0.vp_c15)._m0[int(_4821)][_4823];
        int _4827 = _4809 + 8;
        uint _4829 = uint(int(uint(_4827) >> uint(2)));
        uint _4831 = uint(int(uint(int(_4829)) >> uint(2)));
        int _4833 = int(_4829) & 3;
        float _4835 = (*spvDescriptorSet0.vp_c15)._m0[int(_4831)][_4833];
        int _4837 = int(_4829) + 1;
        uint _4839 = uint(int(uint(_4837) >> uint(2)));
        int _4841 = _4837 & 3;
        float _4843 = (*spvDescriptorSet0.vp_c15)._m0[int(_4839)][_4841];
        float _4845 = _3938 * _4825;
        float _4847 = fma(_3536, _4817, _4845);
        float _4849 = fma(_3544, _4835, _4847);
        float _4851 = _4849 + _4843;
        float _4853 = precise::clamp(_4851, 0.0, 1.0);
        float _4855 = -_4853;
        float _4857 = _4855 + _4710;
        float _4859 = fma(_4857, 500.0, 1.5);
        float _4861 = exp2(_4859);
        float _4863 = 0.0 + _4861;
        float _4865 = precise::clamp(_4863, 0.0, 1.0);
        _4805 = _4825;
        _4743 = _4865;
    }
    float _4867 = _4805;
    float _4869 = _4743;
    float _4871 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4873 = _4542 + _4871;
    float _4875 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4877 = _4544 + _4875;
    float _4879 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4881 = _4546 + _4879;
    float _4883 = _4873 * _4873;
    float _4885 = fma(_4877, _4877, _4883);
    float _4887 = fma(_4881, _4881, _4885);
    float _4889 = rsqrt(_4887);
    float _4891 = _4889 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4893 = _4877 * _4891;
    float _4895 = _4881 * _4891;
    float _4897 = _4893 * _4893;
    float _4899 = _4895 * _4895;
    float _4901 = _4897 + _4899;
    float _4903 = sqrt(_4901);
    bool _4905 = _4903 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4907 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4909 = _4903 + _4907;
    float _4911 = _4885;
    float _4913 = _4889;
    float _4915 = _4909;
    float _4917 = _4873;
    float _4919 = _4891;
    if (_4905)
    {
        float _4921 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4911 = _4921;
    }
    float _4923 = _4911;
    if (_4905)
    {
        float _4925 = rsqrt(_4901);
        _4913 = _4925;
    }
    float _4927 = _4913;
    float _4929 = _4923;
    float _4931 = _4927;
    if (_4905)
    {
        float _4933 = _4909 * _4923;
        _4915 = _4933;
    }
    float _4935 = _4915;
    if (_4905)
    {
        float _4937 = _4935 * 0.15915493667125701904296875;
        _4929 = _4937;
    }
    float _4939 = _4929;
    float _4941 = _4881;
    float _4943 = _4939;
    if (_4905)
    {
        float _4945 = _4939 * 6.283185482025146484375;
        float _4947 = sin(_4945);
        _4941 = _4947;
    }
    float _4949 = _4941;
    float _4951 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4953 = precise::max(0.0, _4951);
    float _4955 = _4867;
    float _4957 = _4953;
    if (_4905)
    {
        float _4959 = _4939 * 6.283185482025146484375;
        float _4961 = cos(_4959);
        _4955 = _4961;
    }
    float _4963 = _4955;
    float _4965 = -_4891;
    float _4967 = -_4953;
    float _4969 = fma(_4873, _4965, _4967);
    if (_4905)
    {
        float _4971 = _4969 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4917 = _4971;
    }
    float _4973 = _4917;
    float _4975 = _4973;
    if (!_4905)
    {
        _4943 = _4897;
    }
    float _4977 = _4943;
    float _4979 = _4949;
    float _4981 = _4977;
    if (_4905)
    {
        float _4983 = fma(_4949, _4973, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4975 = _4983;
    }
    float _4985 = _4975;
    float _4987 = _4985;
    if (!_4905)
    {
        _4979 = _4969;
    }
    float _4989 = _4979;
    float _4991 = _4989;
    float _4993 = _4963;
    if (_4905)
    {
        float _4995 = _4963 + (-1.0);
        _4957 = _4995;
    }
    float _4997 = _4957;
    if (_4905)
    {
        float _4999 = _4927 * _4985;
        _3526 = _4999;
    }
    float _5001 = _3526;
    if (!_4905)
    {
        _4931 = _4893;
    }
    float _5003 = _4931;
    float _5005 = _5003;
    if (_4905)
    {
        float _5007 = _4997 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4919 = _5007;
    }
    float _5009 = _4919;
    if (_4905)
    {
        float _5011 = _4893 * _5001;
        _5005 = _5011;
    }
    float _5013 = _5005;
    if (!_4905)
    {
        _4987 = _4895;
    }
    float _5015 = _4987;
    float _5017 = _5015;
    if (_4905)
    {
        float _5019 = _4895 * _5001;
        _5017 = _5019;
    }
    float _5021 = _5017;
    if (_4905)
    {
        float _5023 = fma(_4969, _4963, _5009);
        _4991 = _5023;
    }
    float _5025 = _4991;
    if (_4905)
    {
        float _5027 = _5013 * _5013;
        _4981 = _5027;
    }
    float _5029 = _4981;
    if (!_4905)
    {
        _4993 = _4899;
    }
    float _5031 = _4993;
    float _5033 = _5031;
    if (_4905)
    {
        float _5035 = _5021 * _5021;
        _5033 = _5035;
    }
    float _5037 = _5033;
    float _5039 = sqrt(_4887);
    float _5041 = fma(_5025, _5025, _5029);
    float _5043 = _5041 + _5037;
    float _5045 = rsqrt(_5043);
    float _5047 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _5049 = fma(_5039, (*spvDescriptorSet0.vp_c15)._m0[23].w, _5047);
    float _5051 = precise::clamp(_5049, 0.0, 1.0);
    float _5053 = -_5051;
    float _5055 = _5053 + 1.0;
    float _5057 = abs(_5055);
    float _5059 = log2(_5057);
    float _5061 = _5045 * _5013;
    float _5063 = _5045 * _5025;
    float _5065 = _5045 * _5021;
    float _5067 = _5061 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _5069 = -_5067;
    float _5071 = fma(_5063, (*spvDescriptorSet0.vp_c15)._m0[21].y, _5069);
    float _5073 = -_5065;
    float _5075 = fma(_5073, (*spvDescriptorSet0.vp_c15)._m0[21].z, _5071);
    float _5077 = _5059 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _5079 = fma(_5075, -0.5, 0.5);
    float _5081 = fma(_5075, 0.5, 0.5);
    float _5083 = exp2(_5077);
    float _5085 = fma(_5081, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _5087 = fma(_5081, _5085, -0.212114393711090087890625);
    float _5089 = _5063 + 1.0;
    float _5091 = sqrt(_5079);
    float _5093 = fma(_5081, _5087, 1.570728778839111328125);
    float _5095 = -_5063;
    float _5097 = fma(_5083, _5089, _5095);
    float _5099 = fma(_5097, 0.5, 0.5);
    float _5101 = _5091 * 0.636619746685028076171875;
    float _5103 = -_5093;
    float _5105 = fma(_5101, _5103, 1.0);
    float2 _13236 = float2(_5105, _5099);
    float3 _5109 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_13236, float2(0.0), isnan(_13236)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_13236, float2(0.0), isnan(_13236)), level(0.0)).xyz;
    float _5111 = _5109.x;
    float _5113 = _5109.y;
    float _5115 = _5109.z;
    float _5117 = _229 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5119 = abs(_3976);
    float _5121 = log2(_5119);
    float _5123 = _3928 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5125 = _3928 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5127 = fma(_5117, _5117, 1.0);
    float _5129 = _3928 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5131 = _3910 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5133 = _3910 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5135 = _3910 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5137 = -_3888;
    float _5139 = fma(_5137, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5123);
    float _5141 = -_3888;
    float _5143 = fma(_5141, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5125);
    float _5145 = -_3888;
    float _5147 = fma(_5145, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5129);
    float _5149 = rsqrt(_5127);
    float _5151 = _3942 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5153 = _3942 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5155 = _3942 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5157 = fma(_3930, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5131);
    float _5159 = fma(_3920, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5151);
    float _5161 = fma(_3920, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5153);
    float _5163 = fma(_3920, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5155);
    float _5165 = fma(_3932, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5139);
    float _5167 = fma(_3930, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5133);
    float _5169 = _5121 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5171 = fma(_3930, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5135);
    float _5173 = fma(_3932, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5143);
    float _5175 = fma(_3918, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5157);
    float _5177 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5179 = _5117 * _5165;
    float _5181 = fma(_3932, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5147);
    float _5183 = fma(_3918, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5167);
    float _5185 = _4572 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5187 = fma(_3918, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5171);
    float _5189 = fma(_5177, _5175, _5179);
    float _5191 = exp2(_5169);
    float _5193 = fma(_3912, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5159);
    float _5195 = fma(_3912, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5161);
    float _5197 = _5117 * _5173;
    float _5199 = _5117 * _5181;
    float _5201 = fma(_3912, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5163);
    float _5203 = _5117 * _5149;
    float _5205 = fma(_4580, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5185);
    out.m_96.x = _5175;
    out.m_96.y = _5183;
    out.m_96.z = _5187;
    float _5207 = fma(_5177, _5187, _5199);
    float _5209 = _5059 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _5211 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5205);
    float _5213 = _4662 + _4616;
    bool _5215 = _3976 <= 8000.0;
    bool _5217 = isnan(_3976);
    bool _5219 = _5215 || _5217;
    bool _5221 = isnan(8000.0);
    bool _5223 = _5219 || _5221;
    float _5225 = float(_5223);
    float _5227 = fma(_5177, _5183, _5197);
    float _5229 = fma(_4604, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5211);
    float _5231 = exp2(_5209);
    float _5233 = -_5193;
    float _5235 = _5203 * _5233;
    float _5237 = _4616 * 0.5;
    float _5239 = -_3588;
    float _5241 = _5239 + 1.0;
    float _5243 = -_5201;
    float _5245 = _5203 * _5243;
    out.gl_Position.x = _4662;
    out.gl_Position.y = _4664;
    out.gl_Position.z = _5229;
    out.gl_Position.w = _4616;
    float _5247 = fma(_5149, _5165, _5235);
    float _5249 = fma(_4664, -0.5, _5237);
    float _5251 = fma(_5149, _5181, _5245);
    float _5253 = -_5195;
    float _5255 = _5203 * _5253;
    float _5257 = _5229 + _4616;
    float _5259 = _5213 * 0.5;
    float _5261 = fma(_5191, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5263 = precise::clamp(_5261, 0.0, 1.0);
    float _5265 = fma(_5149, _5173, _5255);
    float _5267 = _5257 * 0.5;
    float _5269 = _5201 + _5207;
    float _5271 = -_5231;
    float _5273 = _5271 + 1.0;
    float _5275 = fma(_5263, -2.0, 3.0);
    float _5277 = _5263 * _5263;
    out.m_98.x = _5259;
    out.m_98.y = _5249;
    out.m_98.z = _5267;
    out.m_98.w = _4616;
    float _5279 = _5273 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5281 = _5193 + _5189;
    float _5283 = _5277 * _5275;
    float _5285 = _5195 + _5227;
    float _5287 = _5279 * _4718;
    float _5289 = -_5279;
    float _5291 = _5289 + 1.0;
    float _5293 = -_5283;
    float _5295 = _5293 + 1.0;
    out.m_100.x = _5247;
    out.m_100.y = _5265;
    out.m_100.z = _5251;
    bool _5297 = _5039 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5299 = isnan(_5039);
    bool _5301 = _5297 || _5299;
    bool _5303 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5305 = _5301 || _5303;
    float _5307 = fma(_5295, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5283);
    out.m_102.x = _5281;
    out.m_102.y = _5285;
    out.m_102.z = _5269;
    float _5309 = _4729 * _5287;
    float _5311 = _5225 * _5307;
    float _5313 = _5307;
    float _5315 = _5291;
    float _5317 = _5273;
    if (!_4598)
    {
        _5313 = 1.0;
    }
    float _5319 = _5313;
    float _5321 = _4729 * _5291;
    float _5323 = _5319;
    if (_4598)
    {
        bool _5325 = _4716 >= _4666;
        bool _5327 = isnan(_4716);
        bool _5329 = _5325 || _5327;
        bool _5331 = isnan(_4666);
        bool _5333 = _5329 || _5331;
        float _5335 = float(_5333);
        _5323 = _5335;
    }
    float _5337 = _5323;
    float _5339 = _5311 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    if (!_5305)
    {
        _4630 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5341 = _4630;
    float _5343 = _5241 * _5339;
    float _5345 = precise::clamp(_5343, 0.0, 1.0);
    float _5347 = _5337 * _4869;
    float _5349 = _4803 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _5351 = _5341;
    float _5353 = _5341;
    if (!_5305)
    {
        _5315 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5355 = _5315;
    float _5357 = -_5345;
    float _5359 = fma(_5357, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5361 = _5355;
    float _5363 = _5355;
    if (!_5305)
    {
        _5317 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5365 = _5317;
    float _5367 = -_5347;
    float _5369 = fma(_5367, _5359, 1.0);
    float _5371 = precise::clamp(_5369, 0.0, 1.0);
    float _5373 = _5371 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5375 = _5371;
    float _5377 = _5365;
    float _5379 = _5365;
    if (!_5305)
    {
        _5375 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5381 = _5375;
    out.m_104.x = _5373;
    float _5383 = _5115 * _5287;
    float _5385 = fma(_5111, _5309, _4723);
    float _5387 = fma(_5113, _5309, _4725);
    float _5389 = _5381;
    float _5391 = _5381;
    if (!_5305)
    {
        _4749 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5393 = _4749;
    float _5395 = fma(_4729, _5383, _4727);
    float _5397 = _5393;
    float _5399 = _5393;
    if (!_5305)
    {
        _4751 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5401 = _4751;
    out.m_106.x = _5385;
    out.m_106.y = _5387;
    out.m_106.z = _5395;
    out.m_106.w = _5321;
    bool _5403 = !_5305;
    float _5405 = _5401;
    float _5407 = _5401;
    if (!_5403)
    {
        bool _5409 = _5039 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5411 = isnan(_5039);
        bool _5413 = _5409 || _5411;
        bool _5415 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5417 = _5413 || _5415;
        if (!_5417)
        {
            float _5419 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5421 = _5039 + _5419;
            float _5423 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5425 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5423;
            float _5427 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5429 = _5427 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5431 = 1.0 / _5425;
            float _5433 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5435 = _5433 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5437 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5439 = _5437 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5441 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5443 = _5441 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5445 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5447 = _5445 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5449 = _5421 * _5431;
            float _5451 = precise::clamp(_5449, 0.0, 1.0);
            float _5453 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5455 = _5453 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5457 = fma(_5451, _5429, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5459 = fma(_5451, _5455, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5461 = fma(_5451, _5435, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5463 = fma(_5451, _5439, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5465 = fma(_5451, _5443, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5467 = fma(_5451, _5447, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5407 = _5461;
            _5379 = _5465;
            _5399 = _5457;
            _5363 = _5463;
            _5353 = _5459;
            _5391 = _5467;
            _5469 = true;
        }
        else
        {
            bool _5471 = _5039 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5473 = isnan(_5039);
            bool _5475 = _5471 || _5473;
            bool _5477 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5479 = _5475 || _5477;
            if (!_5479)
            {
                _5397 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5481 = _5397;
            _5399 = _5481;
            if (!_5479)
            {
                _5405 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5483 = _5405;
            _5407 = _5483;
            if (!_5479)
            {
                _5351 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5485 = _5351;
            _5353 = _5485;
            if (!_5479)
            {
                _5361 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5487 = _5361;
            _5363 = _5487;
            if (!_5479)
            {
                _5377 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5489 = _5377;
            _5379 = _5489;
            if (!_5479)
            {
                _5389 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5491 = _5389;
            bool _5493 = !_5479;
            _5391 = _5491;
            if (!_5493)
            {
                bool _5495 = _5039 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5497 = isnan(_5039);
                bool _5499 = _5495 || _5497;
                bool _5501 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5503 = _5499 || _5501;
                if (!_5503)
                {
                    float _5505 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5507 = _5039 + _5505;
                    float _5509 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5511 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5509;
                    float _5513 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5515 = _5513 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5517 = 1.0 / _5511;
                    float _5519 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5521 = _5519 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5523 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5525 = _5523 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5527 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5529 = _5527 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5531 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5533 = _5531 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5535 = _5507 * _5517;
                    float _5537 = precise::clamp(_5535, 0.0, 1.0);
                    float _5539 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5541 = _5539 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5543 = fma(_5537, _5515, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5545 = fma(_5537, _5541, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5547 = fma(_5537, _5521, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5549 = fma(_5537, _5525, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5551 = fma(_5537, _5529, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5553 = fma(_5537, _5533, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5407 = _5547;
                    _5379 = _5551;
                    _5399 = _5543;
                    _5363 = _5549;
                    _5353 = _5545;
                    _5391 = _5553;
                    _5469 = true;
                }
                else
                {
                    _5407 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5379 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5399 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5363 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5353 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5391 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5469 = false;
    float _5555 = _5407;
    float _5557 = _5379;
    float _5559 = _5399;
    float _5561 = _5363;
    float _5563 = _5353;
    float _5565 = _5391;
    float _5567 = _5349 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5569 = fma(_5285, -0.5, 0.5);
    float _5571 = precise::clamp(_5569, 0.0, 1.0);
    float _5573 = -_5555;
    float _5575 = _5573 + _5557;
    float _5577 = -_5559;
    float _5579 = _5577 + _5561;
    out.m_63.x = _5567;
    float _5581 = fma(_5571, _5575, _5555);
    float _5583 = -_5563;
    float _5585 = _5583 + _5565;
    float _5587 = fma(_5571, _5579, _5559);
    float _5589 = _5581 * 0.586610972881317138671875;
    bool _5591 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5593 = fma(_5571, _5585, _5563);
    out.m_108.x = 0.0;
    float _5595 = fma(_5587, 0.298911988735198974609375, _5589);
    bool _5597 = _4803 > 0.0;
    bool _5599 = isnan(_4803);
    bool _5601 = _5597 || _5599;
    bool _5603 = isnan(0.0);
    bool _5605 = _5601 || _5603;
    float _5607 = fma(_5593, 0.114477999508380889892578125, _5595);
    float _5609 = -_5607;
    float _5611 = _5587 + _5609;
    float _5613 = -_5607;
    float _5615 = _5581 + _5613;
    float _5617 = -_5607;
    float _5619 = _5593 + _5617;
    float _5621 = fma(_5611, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5607);
    float _5623 = fma(_5615, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5607);
    float _5625 = fma(_5619, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5607);
    bool _5627 = !_5591;
    if (!_5627)
    {
        float _5629 = -_4542;
        float _5631 = _5629 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5633 = -_4544;
        float _5635 = _5633 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5637 = -_4546;
        float _5639 = _5637 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5641 = _5631 * _5631;
        float _5643 = fma(_5635, _5635, _5641);
        float _5645 = fma(_5639, _5639, _5643);
        float _5647 = sqrt(_5645);
        float _5649 = rsqrt(_5645);
        float _5651 = -_5647;
        float _5653 = _5651 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5655 = _5653 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5657 = precise::clamp(_5655, 0.0, 1.0);
        float _5659 = _5635 * _5649;
        float _5661 = _5631 * _5649;
        float _5663 = abs(_5657);
        float _5665 = log2(_5663);
        float _5667 = _5639 * _5649;
        float _5669 = _5659 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5671 = _5285 * _5661;
        float _5673 = -_5661;
        float _5675 = -_5669;
        float _5677 = fma(_5673, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5675);
        float _5679 = fma(_5281, _5659, _5671);
        float _5681 = -_5667;
        float _5683 = fma(_5681, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5677);
        float _5685 = fma(_5269, _5667, _5679);
        float _5687 = precise::clamp(_5685, 0.0, 1.0);
        float _5689 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5691 = _5683 + _5689;
        float _5693 = _5665 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5695 = _5691 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5697 = precise::clamp(_5695, 0.0, 1.0);
        float _5699 = exp2(_5693);
        float _5701 = _5699 * _5697;
        float _5703 = _5687 * _5701;
        float _5705 = _5703 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5707 = _5703 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5709 = _5703 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_108.x = _5705;
        out.m_108.y = _5707;
        out.m_108.z = _5709;
    }
    out.m_110.x = _5621;
    out.m_110.y = _5623;
    out.m_110.z = _5625;
    if (_5605)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _5711 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_63.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5711;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

