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
    float4 m_76 [[user(locn0)]];
    float4 m_80 [[user(locn1)]];
    float4 m_78 [[user(locn2)]];
    float4 m_84 [[user(locn3)]];
    float4 m_94 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_86 [[user(locn6)]];
    float4 m_82 [[user(locn7)]];
    float4 m_74 [[user(locn8)]];
    float4 m_92 [[user(locn9)]];
    float4 m_88 [[user(locn10)]];
    float4 m_90 [[user(locn11)]];
    float4 m_96 [[user(locn12)]];
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
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3033 = false;
    bool _309 = false;
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
        float _3378 = as_type<float>(_131);
        out.gl_Position.z = _3378;
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
    float _153 = _149;
    if (_145)
    {
        float _155 = float(_115);
        _151 = _155;
    }
    float _157 = _151;
    bool _159 = _149 >= _157;
    bool _161 = !_145;
    bool _163 = _159 || _161;
    if (_163)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _125;
    if (_163)
    {
        out.m_59.x = 0.0;
    }
    if (_163)
    {
        float _167 = _165 * 5.0;
        _133 = as_type<int>(_167);
    }
    int _169 = _133;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3447 = as_type<float>(_169);
        out.gl_Position.z = _3447;
    }
    if (_163)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _171 = in.m_63.x;
    float _173 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _175 = _149 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _177 = in.m_65.x;
    float _179 = in.m_65.y;
    float _181 = in.m_65.z;
    float _183 = _175 * _173;
    float _185 = fma(_171, (*spvDescriptorSet0.vp_c9)._m0[20].x, _183);
    float _187 = floor(_185);
    int _189 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _191 = _189 != 0;
    float _193 = _185 * 6.283185482025146484375;
    float _195 = _179 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _197 = _179 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _199 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _201 = _199 != 0;
    int _203 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _205 = _203 != 0;
    float _207 = _193 * 0.15915493667125701904296875;
    float _209 = _179 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _211 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[4].x, _195);
    float _213 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[5].x, _197);
    bool _215 = !_201;
    int _217 = _215 ? 0 : 1;
    float _219 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[6].x, _209);
    float _221 = _207 * 6.283185482025146484375;
    float _223 = cos(_221);
    bool _225 = !_205;
    int _227 = _225 ? 0 : 1;
    float _229 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[4].z, _211);
    int _231 = abs(_217);
    float _233 = -_187;
    float _235 = _185 + _233;
    bool _237 = !_191;
    int _239 = _237 ? 0 : 1;
    float _241 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[5].z, _213);
    float _243 = -_235;
    float _245 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _247 = abs(_239);
    float _249 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[6].z, _219);
    float _251 = float(_231);
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _255 = abs(_227);
    float _257 = fma(_223, 0.5, 0.5);
    float _259 = abs(_245);
    float _261 = _251 * _259;
    bool _263 = _235 < 0.5;
    float _265 = float(_263);
    float _267 = -_257;
    float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _271 = float(_247);
    float _273 = -_265;
    float _275 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _277 = float(_255);
    float _279 = fma(_271, _269, _261);
    float _281 = abs(_275);
    float _283 = fma(_277, _281, _279);
    bool _285 = !_253;
    float _287 = _249;
    float _305;
    float _307;
    if (!_285)
    {
        float _289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _291 = _171 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _293 = float(_115);
        float _295 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _297 = _295 * _289;
        float _299 = floor(_297);
        float _301 = -_299;
        float _303 = _297 + _301;
        _305 = _303;
        _307 = _293;
        _309 = true;
    }
    else
    {
        float _311 = float(_115);
        float _313 = 1.0 / _311;
        float _315 = _149 * _313;
        _305 = _315;
        _307 = _311;
    }
    _309 = false;
    float _317 = _305;
    float _319 = _307;
    float _321 = in.m_56.x;
    float _323 = in.m_56.y;
    float _325 = in.m_56.z;
    float _327 = _323 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _329 = _323 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _331 = fma(_321, (*spvDescriptorSet0.vp_c10)._m0[4].x, _327);
    float _333 = fma(_321, (*spvDescriptorSet0.vp_c10)._m0[6].x, _329);
    float _335 = fma(_325, (*spvDescriptorSet0.vp_c10)._m0[4].z, _331);
    float _337 = fma(_325, (*spvDescriptorSet0.vp_c10)._m0[6].z, _333);
    float _339 = _335 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _341 = _337 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _343 = fma(_339, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _345 = fma(_341, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _347 = floor(_343);
    float _349 = floor(_345);
    float _351 = -_347;
    float _353 = _343 + _351;
    float _355 = -_349;
    float _357 = _345 + _355;
    float2 _3746 = float2(_353, _357);
    float _359 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3746, float2(0.0), isnan(_3746)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3746, float2(0.0), isnan(_3746)), level(0.0)).x;
    float _361 = in.m_63.y;
    float _363 = _171 * 2.0;
    float _365 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _367 = log2(_365);
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _371 = _317 + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _381;
    float _385 = _171 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _387 = floor(_363);
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _393 = _317 + _391;
    float _395 = -_389;
    float _397 = fma(_385, 2.0, _395);
    float _399 = 1.0 / _375;
    float _401 = in.m_63.z;
    float _403 = 1.0 / _379;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _407 = _317 + _405;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _413 = _387 > 0.0;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _417 = _387 >= 0.0;
    bool _419 = isnan(_387);
    bool _421 = _417 || _419;
    bool _423 = isnan(0.0);
    bool _425 = _421 || _423;
    float _427 = _361 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _429 = 1.0 / _383;
    float _431 = _323 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _433;
    float _437 = _407 * _399;
    int _439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _441 = _439 != 0;
    int _443 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _445 = _443 != 0;
    int _447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _449 = _447 != 0;
    float _451 = fma(_321, (*spvDescriptorSet0.vp_c10)._m0[5].x, _431);
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _455 = _317 + _453;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _459 = _317 + _457;
    float _461 = 1.0 / _411;
    float _463 = _361 * 2.0;
    float _465 = _171 + _401;
    float _467 = _455 * _403;
    float _469 = _171 + _361;
    float _471 = _465 + (-1.0);
    float _473 = fma(_325, (*spvDescriptorSet0.vp_c10)._m0[5].z, _451);
    float _475 = floor(_463);
    float _477 = _469 + (-1.0);
    float _479 = fma(_427, -2.0, _415);
    float _481 = _371 * _429;
    int _483 = _425 ? 0 : 1;
    float _485 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _487 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _489 = isnan(_317);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _495 = _491 || _493;
    float _497 = float(_495);
    float _499 = 1.0 / _435;
    float _501 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _503;
    float _507 = _393 * _461;
    float _509 = -_497;
    float _511 = _509 + 1.0;
    float _513 = _401 * 2.0;
    float _515 = fma(_505, _437, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _517 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _519 = isnan(_317);
    bool _521 = _517 || _519;
    bool _523 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _525 = _521 || _523;
    float _527 = float(_525);
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _531 = _529 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _533 = _361 + _401;
    bool _535 = _475 > 0.0;
    float _537 = floor(_513);
    bool _539 = _475 >= 0.0;
    bool _541 = isnan(_475);
    bool _543 = _539 || _541;
    bool _545 = isnan(0.0);
    bool _547 = _543 || _545;
    float _549 = _533 + (-1.0);
    bool _551 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _553 = isnan(_317);
    bool _555 = _551 || _553;
    bool _557 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _559 = _555 || _557;
    float _561 = float(_559);
    float _563 = -_527;
    float _565 = _563 + 1.0;
    float _567 = _459 * _499;
    float _569 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _571;
    float _575 = _561 * _511;
    float _577 = -_561;
    float _579 = _577 + 1.0;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _583 = _581 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _585 = fma(_573, _437, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _587 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _589 = isnan(_317);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _595 = _591 || _593;
    float _597 = float(_595);
    float _599 = _527 * _579;
    bool _601 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _603 = isnan(_317);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = fma(_531, _467, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _615 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _617 = isnan(_317);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = _597 * _565;
    float _629 = -_597;
    float _631 = _629 + 1.0;
    float _633 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _635 = int(_633);
    bool _637 = _537 >= 0.0;
    bool _639 = isnan(_537);
    bool _641 = _637 || _639;
    bool _643 = isnan(0.0);
    bool _645 = _641 || _643;
    float _647 = -_625;
    float _649 = _647 + 1.0;
    float _651 = _625 * _631;
    float _653 = _367 * _149;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _655;
    float _659 = _611 * _649;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _663 = _661 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _665 = exp2(_653);
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _667;
    float _671 = fma(_657, _481, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _673 = _515 * _659;
    float _675 = _585 * _659;
    float _677 = fma(_583, _467, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _679 = fma(_669, _481, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _681 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _683 = int(_681);
    float _685 = fma(_663, _507, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _687 = float(_635);
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _691 = !_445;
    int _693 = _691 ? 0 : 1;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _697 = 1.0 + _695;
    int _699 = ~_483;
    int _701 = _699 + 1;
    int _703 = _701 + 1;
    float _705 = -_665;
    float _707 = _705 + 1.0;
    bool _709 = !_441;
    int _711 = _709 ? 0 : 1;
    float _713 = 1.0 / _687;
    bool _715 = !_449;
    int _717 = _715 ? 0 : 1;
    float _719 = _473 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _721 = _703;
    if (!_413)
    {
        int _723 = ~_483;
        int _725 = _723 + 1;
        _721 = _725;
    }
    int _727 = _721;
    float _729 = fma(_171, (*spvDescriptorSet0.vp_c9)._m0[78].z, _689);
    int _731 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _733 = _731 != 0;
    int _735 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _737 = _735 != 0;
    int _739 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _741 = _739 != 0;
    float _743 = _719 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _745 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _747 = isnan(0.0);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _753 = _749 || _751;
    float _755 = 1.0 / _697;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _759 = _757 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _761 = _753 ? _707 : 0.0;
    float _763 = fma(_339, (*spvDescriptorSet0.vp_c8)._m0[11].x, _743);
    bool _765 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _767 = isnan(1.0);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _773 = _769 || _771;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _777 = fma(_759, _507, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _779 = float(_683);
    float _781 = -_149;
    float _783 = fma(_781, (*spvDescriptorSet0.vp_c9)._m0[76].x, _397);
    float _785 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _479);
    float _787 = _719 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _789 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[78].w, _775);
    float _791 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _729);
    float _793 = fma(_341, (*spvDescriptorSet0.vp_c8)._m0[11].z, _763);
    bool _795 = !_737;
    int _797 = _795 ? 0 : 1;
    float _799 = -_611;
    float _801 = _799 + 1.0;
    int _803 = _547 ? 0 : 1;
    float _805 = fma(_339, (*spvDescriptorSet0.vp_c8)._m0[10].x, _787);
    float _807 = _779 * _149;
    float _809 = _713 * _149;
    float _811 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _789);
    float _813 = _793 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    if (_773)
    {
        float _815 = _761 * _755;
        _153 = _815;
    }
    float _817 = _153;
    int _819 = abs(_797);
    float _821 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[143].x, _673);
    int _823 = ~_803;
    int _825 = _823 + 1;
    int _827 = _825 + 1;
    float _829 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[143].y, _675);
    bool _831 = _537 > 0.0;
    float _833 = in.m_67.x;
    float _835 = in.m_67.y;
    float _837 = in.m_67.z;
    int _839 = _827;
    if (!_535)
    {
        int _841 = ~_803;
        int _843 = _841 + 1;
        _839 = _843;
    }
    int _845 = _839;
    float _847 = fma(_341, (*spvDescriptorSet0.vp_c8)._m0[10].z, _805);
    float _849 = float(_727);
    float _851 = 1.0 / _813;
    float _853 = float(_819);
    float _855 = _847 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _857 = !_733;
    int _859 = _857 ? 0 : 1;
    float _861 = fma(_613, _651, _821);
    int _863 = _645 ? 0 : 1;
    float _865 = _853 * _849;
    bool _867 = !_741;
    int _869 = _867 ? 0 : 1;
    float _871 = _855 + _813;
    int _873 = abs(_859);
    float _875 = _865 * (-2.0);
    int _877 = ~_863;
    int _879 = _877 + 1;
    int _881 = _879 + 1;
    float _883 = _401 + (-0.5);
    int _885 = _881;
    if (!_831)
    {
        int _887 = ~_863;
        int _889 = _887 + 1;
        _885 = _889;
    }
    int _891 = _885;
    float _893 = fma(_677, _651, _829);
    int _895 = abs(_869);
    float _897 = _871 * _851;
    float _899 = _897 * 0.5;
    float _901 = _361 + (-0.5);
    float _903 = float(_891);
    float _905 = fma(_875, _835, _835);
    float _907 = float(_873);
    float _909 = fma(_671, _627, _861);
    float _911 = float(_895);
    float _913 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[196].y, _905);
    float _915 = float(_845);
    float _917 = _907 * _903;
    float _919 = fma(_569, _875, _569);
    float _921 = fma(_679, _627, _893);
    float _923 = _917 * (-2.0);
    float _925 = _911 * _915;
    float _927 = fma(_919, _817, _913);
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _929;
    float _933 = fma(_501, _923, _501);
    float _935 = fma(_923, _833, _833);
    float _937 = _171 + (-0.5);
    float _939 = _925 * (-2.0);
    float _941 = _927 * 0.15915493667125701904296875;
    float _943 = fma(_685, _599, _909);
    float _945 = fma(_937, (*spvDescriptorSet0.vp_c9)._m0[196].x, _935);
    float _947 = fma(_939, _837, _837);
    float _949 = as_type<float>(int(gl_VertexIndex));
    float _951 = fma(_485, _939, _485);
    float _953 = fma(_933, _817, _945);
    float _955 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[196].z, _947);
    float _957 = in.m_72.x;
    float _959 = in.m_72.y;
    float _961 = fma(_777, _599, _921);
    float _963 = fma(_951, _817, _955);
    float _965 = _953 * 0.15915493667125701904296875;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _967;
    float _971 = _963 * 0.15915493667125701904296875;
    float _973 = _941 * 6.283185482025146484375;
    float _975 = sin(_973);
    float _977 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _979 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[30].w, _977);
    float _981 = fma(_969, _567, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _983 = fma(_931, _567, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _985 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _987 = fma(_981, _575, _943);
    float _989 = fma(_983, _575, _961);
    float _991 = _941 * 6.283185482025146484375;
    float _993 = cos(_991);
    float _995 = _719 + _985;
    float _997 = fma(_497, (*spvDescriptorSet0.vp_c9)._m0[148].x, _987);
    float _999 = fma(_497, (*spvDescriptorSet0.vp_c9)._m0[148].y, _989);
    int _1001 = as_type<int>(_949) & 1;
    bool _1003 = _1001 != 0;
    int _1005 = as_type<int>(_949) & 2;
    bool _1007 = _1005 != 0;
    float _1009 = _995 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1011 = _995 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1013 = _965 * 6.283185482025146484375;
    float _1015 = sin(_1013);
    float _1017 = _999 * _959;
    float _1019 = _997 * _957;
    bool _1021 = !_1007;
    float _1023 = _1021 ? (-0.5) : 0.5;
    float _1025 = fma(_339, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1009);
    float _1027 = _283 * _1017;
    bool _1029 = !_1003;
    float _1031 = _1029 ? (-0.5) : 0.5;
    float _1033 = _283 * _1019;
    float _1035 = _971 * 6.283185482025146484375;
    float _1037 = cos(_1035);
    float _1039 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1023);
    float _1041 = _1027 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1043 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1031);
    float _1045 = _1033 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1047 = fma(_339, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1011);
    float _1049 = _1041 * _1039;
    float _1051 = _965 * 6.283185482025146484375;
    float _1053 = cos(_1051);
    float _1055 = _1015 * _975;
    float _1057 = _1045 * _1043;
    float _1059 = _1015 * _993;
    float _1061 = 1.0 / _979;
    float _1063 = _1015 * _1037;
    float _1065 = _971 * 6.283185482025146484375;
    float _1067 = sin(_1065);
    float _1069 = _1053 * _993;
    float _1071 = _1053 * _1037;
    float _1073 = _1053 * _975;
    float _1075 = _993 * _1037;
    float _1077 = _975 * _1037;
    float _1079 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1081 = _1061 * _1079;
    float _1083 = _1071 * _1049;
    bool _1085 = _1081 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1087 = _1081 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1089 = fma(_1067, _1069, _1055);
    float _1091 = fma(_1067, _1055, _1069);
    float _1093 = -_1073;
    float _1095 = fma(_1067, _1059, _1093);
    float _1097 = -_1059;
    float _1099 = fma(_1067, _1073, _1097);
    float _1101 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1103 = -_1049;
    float _1105 = _1067 * _1103;
    float _1107 = fma(_1089, _1057, _1083);
    float _1109 = _1063 * _1049;
    float _1111 = fma(_1075, _1057, _1105);
    float _1113 = fma(_1099, _1101, _1107);
    float _1115 = fma(_1095, _1057, _1109);
    int _1117 = 2;
    if (!_1085)
    {
        _1117 = 1;
    }
    int _1119 = _1117;
    float _1121 = fma(_1077, _1101, _1111);
    float _1123 = _1113 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1125 = fma(_1091, _1101, _1115);
    bool _1127 = !_1085;
    int _1129 = _1127 ? 0 : 1;
    float _1131 = _1113 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1133 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1123);
    int _1135 = _1119;
    if (!_1087)
    {
        _1135 = _1129;
    }
    int _1137 = _1135;
    float _1139 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1131);
    float _1141 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1133);
    int _1143 = _1137 << 6;
    float _1145 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1139);
    float _1147 = _1141 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _1149 = _1143 + 48;
    uint _1152 = uint(int(uint(_1149) >> uint(2)));
    uint _1154 = uint(int(uint(int(_1152)) >> uint(2)));
    int _1156 = int(_1152) & 3;
    float _1158 = (*spvDescriptorSet0.vp_c15)._m0[int(_1154)][_1156];
    int _1160 = int(_1152) + 1;
    uint _1162 = uint(int(uint(_1160) >> uint(2)));
    int _1164 = _1160 & 3;
    float _1166 = (*spvDescriptorSet0.vp_c15)._m0[int(_1162)][_1164];
    float _1168 = _1145 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1170 = _341 + _1147;
    float _1172 = fma(_341, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1047);
    float _1174 = _1113 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1176 = _339 + _1168;
    float _1178 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1180 = _1170 + _1178;
    float _1182 = _1172 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1184 = _1143 + 56;
    uint _1186 = uint(int(uint(_1184) >> uint(2)));
    uint _1188 = uint(int(uint(int(_1186)) >> uint(2)));
    int _1190 = int(_1186) & 3;
    float _1192 = (*spvDescriptorSet0.vp_c15)._m0[int(_1188)][_1190];
    int _1194 = int(_1186) + 1;
    uint _1196 = uint(int(uint(_1194) >> uint(2)));
    int _1198 = _1194 & 3;
    float _1200 = (*spvDescriptorSet0.vp_c15)._m0[int(_1196)][_1198];
    float _1202 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1204 = _1176 + _1202;
    float _1206 = _1180 * _1180;
    float _1208 = trunc(_1182);
    int _1210 = int(_1208);
    float _1212 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1174);
    float _1214 = fma(_1204, _1204, _1206);
    float _1216 = fma(_341, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1025);
    int _1218 = _1143 + 64;
    uint _1220 = uint(int(uint(_1218) >> uint(2)));
    uint _1222 = uint(int(uint(int(_1220)) >> uint(2)));
    int _1224 = int(_1220) & 3;
    float _1226 = (*spvDescriptorSet0.vp_c15)._m0[int(_1222)][_1224];
    int _1228 = int(_1220) + 1;
    uint _1230 = uint(int(uint(_1228) >> uint(2)));
    int _1232 = _1228 & 3;
    float _1234 = (*spvDescriptorSet0.vp_c15)._m0[int(_1230)][_1232];
    float _1236 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1212);
    float _1238 = sqrt(_1214);
    float _1240 = _1216 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1242 = _1236 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1244 = _1143 + 72;
    uint _1246 = uint(int(uint(_1244) >> uint(2)));
    uint _1248 = uint(int(uint(int(_1246)) >> uint(2)));
    int _1250 = int(_1246) & 3;
    float _1252 = (*spvDescriptorSet0.vp_c15)._m0[int(_1248)][_1250];
    int _1254 = int(_1246) + 1;
    uint _1256 = uint(int(uint(_1254) >> uint(2)));
    int _1258 = _1254 & 3;
    float _1260 = (*spvDescriptorSet0.vp_c15)._m0[int(_1256)][_1258];
    float _1262 = _719 + _1242;
    float _1264 = trunc(_1240);
    int _1266 = int(_1264);
    int _1268 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1270 = _1210 + _1268;
    int _1272 = _1270 + 1;
    int _1274 = _1143 + 96;
    uint _1276 = uint(int(uint(_1274) >> uint(2)));
    uint _1278 = uint(int(uint(int(_1276)) >> uint(2)));
    int _1280 = int(_1276) & 3;
    float _1282 = (*spvDescriptorSet0.vp_c15)._m0[int(_1278)][_1280];
    int _1284 = int(_1276) + 1;
    uint _1286 = uint(int(uint(_1284) >> uint(2)));
    int _1288 = _1284 & 3;
    float _1290 = (*spvDescriptorSet0.vp_c15)._m0[int(_1286)][_1288];
    bool _1292 = _1238 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1294 = _1143 + 104;
    uint _1296 = uint(int(uint(_1294) >> uint(2)));
    uint _1298 = uint(int(uint(int(_1296)) >> uint(2)));
    int _1300 = int(_1296) & 3;
    float _1302 = (*spvDescriptorSet0.vp_c15)._m0[int(_1298)][_1300];
    int _1304 = int(_1296) + 1;
    uint _1306 = uint(int(uint(_1304) >> uint(2)));
    int _1308 = _1304 & 3;
    float _1310 = (*spvDescriptorSet0.vp_c15)._m0[int(_1306)][_1308];
    int _1312 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1314 = _1266 + _1312;
    int _1316 = _1314 + 1;
    float _1318 = _1242;
    float _1320 = _1262;
    float _1322 = _1170;
    int _1324 = _1272;
    float _1326 = as_type<float>(_1316);
    if (!_1292)
    {
        _1318 = _1176;
    }
    float _1328 = _1318;
    bool _1330 = !_1292;
    float _1332 = _1328;
    int _1334 = as_type<int>(_1290);
    int _1336 = as_type<int>(_1192);
    if (!_1330)
    {
        float _1338 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1340 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1342 = _1238 + _1340;
        float _1344 = rsqrt(_1214);
        float _1346 = _1342 * _1338;
        float _1348 = _1262 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1350 = _1346 * 0.15915493667125701904296875;
        float _1352 = _1350 * 6.283185482025146484375;
        float _1354 = cos(_1352);
        float _1356 = _1350 * 6.283185482025146484375;
        float _1358 = sin(_1356);
        float _1360 = _1354 + (-1.0);
        float _1362 = fma(_1358, _1348, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1364 = _1360 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1366 = _1344 * _1362;
        float _1368 = fma(_1262, _1354, _1364);
        float _1370 = fma(_1204, _1366, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1372 = fma(_1180, _1366, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1320 = _1368;
        _1332 = _1370;
        _1322 = _1372;
    }
    float _1374 = _1320;
    float _1376 = _1332;
    float _1378 = _1322;
    float _1380 = -_719;
    float _1382 = _1380 + _1374;
    bool _1384 = _1316 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1386 = _1143 + 80;
    uint _1388 = uint(int(uint(_1386) >> uint(2)));
    uint _1390 = uint(int(uint(int(_1388)) >> uint(2)));
    int _1392 = int(_1388) & 3;
    float _1394 = (*spvDescriptorSet0.vp_c15)._m0[int(_1390)][_1392];
    int _1396 = int(_1388) + 1;
    uint _1398 = uint(int(uint(_1396) >> uint(2)));
    int _1400 = _1396 & 3;
    float _1402 = (*spvDescriptorSet0.vp_c15)._m0[int(_1398)][_1400];
    int _1404 = _1316 | _1272;
    float _1406 = -_339;
    float _1408 = _1406 + _1376;
    float _1410 = _1382 * _1382;
    float _1412 = -_341;
    float _1414 = _1412 + _1378;
    bool _1416 = _1404 < 0;
    bool _1418 = _1416 || _1384;
    float _1420 = fma(_1408, _1408, _1410);
    float _1422 = _995 * _1290;
    bool _1424 = _1272 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1426 = _1424 || _1418;
    float _1428 = fma(_1414, _1414, _1420);
    float _1430 = fma(_339, _1282, _1422);
    float _1432 = _995 * _1166;
    float _1434 = _995 * _1234;
    float _1436 = sqrt(_1428);
    float _1438 = fma(_341, _1302, _1430);
    float _1440 = fma(_339, _1158, _1432);
    float _1442 = fma(_339, _1226, _1434);
    bool _1444 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1446 = isnan(0.5);
    bool _1448 = _1444 || _1446;
    bool _1450 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1452 = _1448 || _1450;
    float _1454 = _1438 + _1310;
    float _1456 = fma(_341, _1192, _1440);
    int _1458 = as_type<int>(_1434);
    int _1460 = as_type<int>(_1442);
    float _1462 = _1376;
    float _1464 = _1374;
    float _1466 = _1378;
    float _1468 = _1456;
    float _1470 = _1438;
    float _1472 = _1408;
    if (!_1426)
    {
        int _1474 = _1272 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1476 = _1474 + _1316;
        _1324 = _1476;
    }
    int _1478 = _1324;
    float _1480 = _1234;
    if (!_1426)
    {
        float _1482 = floor(_1240);
        _1480 = _1482;
    }
    float _1484 = _1480;
    float _1486 = fma(_341, _1252, _1442);
    if (!_1426)
    {
        int _1488 = _1478 << 2;
        _1334 = _1488;
    }
    int _1490 = _1334;
    float _1492 = _1486 + _1260;
    if (!_1426)
    {
        uint _1494 = uint(int(uint(_1478) >> uint(2)));
        _1458 = int(_1494);
    }
    int _1496 = _1458;
    bool _1498 = _1436 > 0.0;
    float _1500 = 1.0 / _1454;
    float _1502 = as_type<float>(_1496);
    if (!_1426)
    {
        int _1504 = 12 & _1490;
        _1336 = _1504;
    }
    int _1506 = _1336;
    float _1508 = _1456 + _1200;
    if (!_1426)
    {
        int _1510 = _1496 << 4;
        int _1512 = _1510 + _1506;
        _1460 = _1512;
    }
    int _1514 = _1460;
    bool _1516 = !_1498;
    float _1518 = _1484;
    if (!_1516)
    {
        float _1520 = _241 * _241;
        float _1522 = rsqrt(_1428);
        float _1524 = fma(_229, _229, _1520);
        float _1526 = fma(_249, _249, _1524);
        float _1528 = sqrt(_1526);
        float _1530 = _1408 * _1522;
        float _1532 = _1382 * _1522;
        float _1534 = _1414 * _1522;
        bool _1536 = _1528 > 0.0;
        bool _1538 = !_1536;
        _1502 = _1526;
        _1468 = _1528;
        _1470 = _1530;
        if (!_1538)
        {
            float _1540 = rsqrt(_1526);
            float _1542 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1544 = _241 * _1540;
            float _1546 = _229 * _1540;
            float _1548 = _1532 * _1544;
            float _1550 = _249 * _1540;
            float _1552 = fma(_1530, _1546, _1548);
            float _1554 = _1542 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1556 = fma(_1534, _1550, _1552);
            float _1558 = _1556 * _1554;
            float _1560 = fma(_229, _1558, _1376);
            float _1562 = fma(_241, _1558, _1374);
            float _1564 = fma(_249, _1558, _1378);
            _1462 = _1560;
            _1464 = _1562;
            _1466 = _1564;
            _1502 = _1540;
            _1468 = _1546;
        }
    }
    float _1566 = _1462;
    float _1568 = _1464;
    float _1570 = _1466;
    float _1572 = _1502;
    float _1574 = _1468;
    float _1576 = _1470;
    float _1578 = _1574;
    float _1580 = _1572;
    if (_1452)
    {
        _1578 = _1566;
    }
    float _1582 = _1578;
    float _1584 = _1582;
    if (_1452)
    {
        _1580 = _1568;
    }
    float _1586 = _1580;
    float _1588 = _1586;
    if (_1452)
    {
        _287 = _1570;
    }
    float _1590 = _287;
    float _1592 = _1590;
    if (!_1452)
    {
        float _1594 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1596 = _719 + _1594;
        float _1598 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1600 = _339 + _1598;
        float _1602 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1604 = _1596 * _1596;
        float _1606 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1608 = _341 + _1606;
        float _1610 = fma(_1600, _1600, _1604);
        float _1612 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1614 = fma(_1608, _1608, _1610);
        float _1616 = sqrt(_1614);
        float _1618 = _1602 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1620 = -_719;
        float _1622 = _1620 + _1568;
        float _1624 = precise::min(_1616, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1626 = _1624 * _1612;
        float _1628 = -_341;
        float _1630 = _1628 + _1570;
        float _1632 = _1618 * _1626;
        float _1634 = -_339;
        float _1636 = _1634 + _1566;
        float _1638 = fma(_1622, _1632, _719);
        float _1640 = fma(_1636, _1632, _339);
        float _1642 = fma(_1630, _1632, _341);
        _1588 = _1638;
        _1584 = _1640;
        _1592 = _1642;
    }
    float _1644 = _1588;
    float _1646 = _1584;
    float _1648 = _1592;
    int _1650 = _1143 + 88;
    uint _1652 = uint(int(uint(_1650) >> uint(2)));
    uint _1654 = uint(int(uint(int(_1652)) >> uint(2)));
    int _1656 = int(_1652) & 3;
    float _1658 = (*spvDescriptorSet0.vp_c15)._m0[int(_1654)][_1656];
    int _1660 = int(_1652) + 1;
    uint _1662 = uint(int(uint(_1660) >> uint(2)));
    int _1664 = _1660 & 3;
    float _1666 = (*spvDescriptorSet0.vp_c15)._m0[int(_1662)][_1664];
    float _1668 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1670 = _1492 * _1500;
    float _1672 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1674 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1676 = fma(_1646, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1668);
    float _1678 = _1508 * _1500;
    float _1680 = fma(_1646, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1672);
    float _1682 = fma(_1646, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1674);
    float _1684 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1676);
    float _1686 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _1688 = _1678 >= 0.0;
    float _1690 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1680);
    float _1692 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1682);
    float _1694 = _1684 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1696 = _1678 <= 1.0;
    bool _1698 = _1696 && _1688;
    float _1700 = _1690 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1702 = fma(_1646, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1686);
    float _1704 = _1692 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1706 = _1694 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1708 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1710 = _1700 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1712 = _1670 >= 0.0;
    bool _1714 = _1712 && _1698;
    float _1716 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1702);
    float _1718 = fma(_1704, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1706);
    float _1720 = -_1710;
    float _1722 = fma(_1720, _1708, 1.0);
    bool _1724 = _1670 <= 1.0;
    bool _1726 = _1724 && _1714;
    float _1728 = _1716 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1730 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1718);
    float _1732 = _1576;
    float _1734 = _1722;
    if (!_1426)
    {
        float _1736 = floor(_1182);
        _1732 = _1736;
    }
    float _1738 = _1732;
    float _1740 = _1566;
    if (!_1426)
    {
        int _1742 = _1514 + 400;
        uint _1744 = uint(int(uint(_1742) >> uint(2)));
        uint _1746 = uint(int(uint(int(_1744)) >> uint(2)));
        int _1748 = int(_1744) & 3;
        float _1750 = (*spvDescriptorSet0.vp_c15)._m0[int(_1746)][_1748];
        _1740 = _1750;
    }
    float _1752 = _1740;
    float _1754 = _1694 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1756 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1730);
    float _1758 = _995 * _1402;
    if (!_1426)
    {
        float _1760 = -_1484;
        float _1762 = _1240 + _1760;
        _1518 = _1762;
    }
    float _1764 = _1518;
    float _1766 = fma(_1704, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1754);
    float _1768 = 1.0 / _1756;
    float _1770 = _1694 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    if (_1726)
    {
        float _1772 = float(_1137);
        _1472 = _1772;
    }
    float _1774 = _1472;
    float _1776 = fma(_339, _1394, _1758);
    float _1778 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1766);
    float _1780 = fma(_1704, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1770);
    float _1782 = log2(_1722);
    float _1784 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1780);
    float _1786 = fma(_341, _1658, _1776);
    float _1788 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1784);
    float _1790 = _1786 + _1666;
    float _1792 = _1770;
    if (_1726)
    {
        float _1794 = rint(_1774);
        float _1796 = precise::max(_1794, 0.0);
        uint _1798 = uint(_1796);
        uint _1800 = clamp(_1798, 0u, 65535u);
        _1792 = as_type<float>(_1800);
    }
    float _1802 = _1792;
    if (!_1426)
    {
        float _1804 = -_1738;
        float _1806 = _1182 + _1804;
        _1734 = _1806;
    }
    float _1808 = _1734;
    float _1810 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1778);
    float _1812 = _1788 * _1768;
    float _1814 = _1810 * _1768;
    float _1816 = fma(_1812, 0.5, 0.5);
    float _1818 = _1782 * 0.693147182464599609375;
    float _1820 = _1790 * _1500;
    float _1822 = fma(_1814, -0.5, 0.5);
    float _1824 = _1818 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1826 = _1670;
    if (_1726)
    {
        float3 _6090 = float3(_1678, _1670, float(as_type<int>(_1802)));
        float3 _6094 = select(_6090, float3(0.0), isnan(_6090));
        float _1828 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6094.xy, uint(rint(_6094.z)), _1820, level(0.0));
        _1826 = _1828;
    }
    float _1830 = _1826;
    float3 _6104 = float3(_1816, _1822, _1824);
    float _1832 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6104, float3(0.0), isnan(_6104)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6104, float3(0.0), isnan(_6104)), level(0.0)).x;
    float3 _6113 = float3(_1816, _1822, _1824);
    float4 _1835 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6113, float3(0.0), isnan(_6113)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6113, float3(0.0), isnan(_6113)), level(0.0)).xyzw;
    float _1837 = _1835.x;
    float _1839 = _1835.y;
    float _1841 = _1835.z;
    float _1843 = _1835.w;
    float _1845 = _1500;
    if (!_1426)
    {
        float _1847 = rint(_1752);
        float _1849 = precise::max(_1847, 0.0);
        uint _1851 = uint(_1849);
        uint _1853 = clamp(_1851, 0u, 65535u);
        _1845 = as_type<float>(_1853);
    }
    float _1855 = _1845;
    float _1857 = _1808;
    if (!_1426)
    {
        float3 _6152 = float3(_1764, _1808, float(as_type<int>(_1855)));
        float3 _6154 = select(_6152, float3(0.0), isnan(_6152));
        float _1859 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6154.xy, uint(rint(_6154.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6154.xy, uint(rint(_6154.z)), level(0.0)).x;
        _1857 = _1859;
    }
    float _1861 = _1857;
    float _1863 = float(uint(_683));
    float _1865 = trunc(_809);
    int _1867 = int(_1865);
    float _1869 = 1.0 / _1863;
    float _1871 = float(uint(_1867));
    int _1873 = as_type<int>(_1869) + (-2);
    float _1875 = as_type<float>(_1873) * _1871;
    float _1877 = trunc(_1875);
    float _1879 = precise::max(_1877, 0.0);
    uint _1881 = uint(_1879);
    int _1883 = ~_683;
    int _1885 = _1883 + 1;
    int _1887 = ~_683;
    int _1889 = _1887 + 1;
    int _1891 = _1885 * int(_1881);
    int _1893 = _1891 + _1867;
    float _1895 = float(uint(_1893));
    float _1897 = as_type<float>(_1873) * _1895;
    float _1899 = trunc(_1897);
    float _1901 = precise::max(_1899, 0.0);
    uint _1903 = uint(_1901);
    int _1905 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1907 = _1905 != 0;
    bool _1909 = !_1907;
    float _1911 = _1909 ? 7.345489978790283203125 : 1.0;
    float _1913 = _1897;
    if (_1426)
    {
        _1913 = 1.0;
    }
    float _1915 = _1913;
    float _1917 = _1911 * _171;
    int _1919 = int(_1881) + int(_1903);
    float _1921 = floor(_1917);
    int _1923 = _1889 * _1919;
    int _1925 = _1923 + _1867;
    bool _1927 = uint(_1925) >= uint(_683);
    bool _1929 = !_1927;
    int _1931 = _1929 ? 0 : (-1);
    float _1933 = -_1921;
    float _1935 = _1917 + _1933;
    int _1937 = ~_1919;
    int _1939 = _1937 + _1931;
    int _1941 = _1939 + 1;
    float _1943 = _1915;
    if (!_1426)
    {
        int _1945 = _1478 << 4;
        int _1947 = _1945 + 2048;
        uint _1949 = uint(int(uint(_1947) >> uint(2)));
        uint _1951 = uint(int(uint(int(_1949)) >> uint(2)));
        int _1953 = int(_1949) & 3;
        float _1955 = (*spvDescriptorSet0.vp_c15)._m0[int(_1951)][_1953];
        int _1957 = int(_1949) + 1;
        uint _1959 = uint(int(uint(_1957) >> uint(2)));
        int _1961 = _1957 & 3;
        float _1963 = (*spvDescriptorSet0.vp_c15)._m0[int(_1959)][_1961];
        int _1965 = _1947 + 8;
        uint _1967 = uint(int(uint(_1965) >> uint(2)));
        uint _1969 = uint(int(uint(int(_1967)) >> uint(2)));
        int _1971 = int(_1967) & 3;
        float _1973 = (*spvDescriptorSet0.vp_c15)._m0[int(_1969)][_1971];
        int _1975 = int(_1967) + 1;
        uint _1977 = uint(int(uint(_1975) >> uint(2)));
        int _1979 = _1975 & 3;
        float _1981 = (*spvDescriptorSet0.vp_c15)._m0[int(_1977)][_1979];
        float _1983 = _995 * _1963;
        float _1985 = fma(_339, _1955, _1983);
        float _1987 = fma(_341, _1973, _1985);
        float _1989 = _1987 + _1981;
        float _1991 = precise::clamp(_1989, 0.0, 1.0);
        float _1993 = -_1991;
        float _1995 = _1993 + _1861;
        float _1997 = fma(_1995, 500.0, 1.5);
        float _1999 = exp2(_1997);
        float _2001 = 0.0 + _1999;
        float _2003 = precise::clamp(_2001, 0.0, 1.0);
        _1943 = _2003;
    }
    float _2005 = _1943;
    float _2007 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2009 = _1644 + _2007;
    float _2011 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2013 = _1646 + _2011;
    float _2015 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2017 = _1648 + _2015;
    float _2019 = _2009 * _2009;
    float _2021 = fma(_2013, _2013, _2019);
    float _2023 = fma(_2017, _2017, _2021);
    float _2025 = rsqrt(_2023);
    float _2027 = sqrt(_2023);
    float _2029 = _2013 * _2025;
    float _2031 = _2017 * _2025;
    float _2033 = _2009 * _2025;
    float _2035 = _2029 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2037 = _2031 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2039 = _2035 * _2035;
    float _2041 = _2037 * _2037;
    float _2043 = _2039 + _2041;
    float _2045 = sqrt(_2043);
    bool _2047 = _2045 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2049 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2051 = _2045 + _2049;
    float _2053 = _1861;
    float _2055 = _2043;
    float _2057 = _2051;
    float _2059 = _2035;
    float _2061 = _2039;
    float _2063 = _2041;
    if (_2047)
    {
        float _2065 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2053 = _2065;
    }
    float _2067 = _2053;
    if (_2047)
    {
        float _2069 = rsqrt(_2043);
        _2055 = _2069;
    }
    float _2071 = _2055;
    if (_2047)
    {
        float _2073 = _2051 * _2067;
        _2057 = _2073;
    }
    float _2075 = _2057;
    if (_2047)
    {
        float _2077 = _2075 * 0.15915493667125701904296875;
        _1326 = _2077;
    }
    float _2079 = _1326;
    float _2081 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2083 = _1824;
    if (_2047)
    {
        float _2085 = _2079 * 6.283185482025146484375;
        float _2087 = sin(_2085);
        _2083 = _2087;
    }
    float _2089 = _2083;
    float _2091 = precise::max(0.0, _2081);
    float _2093 = _2075;
    float _2095 = _2091;
    if (_2047)
    {
        float _2097 = _2079 * 6.283185482025146484375;
        float _2099 = cos(_2097);
        _2093 = _2099;
    }
    float _2101 = _2093;
    float _2103 = -_2033;
    float _2105 = -_2091;
    float _2107 = fma(_2103, (*spvDescriptorSet0.vp_c15)._m0[24].y, _2105);
    float _2109 = _2107;
    if (_2047)
    {
        float _2111 = _2107 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2095 = _2111;
    }
    float _2113 = _2095;
    float _2115 = _2113;
    float _2117 = _2089;
    if (_2047)
    {
        float _2119 = fma(_2089, _2113, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2115 = _2119;
    }
    float _2121 = _2115;
    float _2123 = _2121;
    if (_2047)
    {
        float _2125 = _2071 * _2121;
        _2123 = _2125;
    }
    float _2127 = _2123;
    if (_2047)
    {
        float _2129 = _2101 + (-1.0);
        _2117 = _2129;
    }
    float _2131 = _2117;
    float _2133 = _2131;
    if (_2047)
    {
        float _2135 = _2035 * _2127;
        _2059 = _2135;
    }
    float _2137 = _2059;
    float _2139 = 0.0;
    if (_2047)
    {
        float _2141 = _2131 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2139 = _2141;
    }
    float _2143 = _2139;
    if (!_2047)
    {
        _2133 = _2037;
    }
    float _2145 = _2133;
    float _2147 = _2145;
    if (_2047)
    {
        float _2149 = _2037 * _2127;
        _2147 = _2149;
    }
    float _2151 = _2147;
    if (_2047)
    {
        float _2153 = _2137 * _2137;
        _2061 = _2153;
    }
    float _2155 = _2061;
    if (_2047)
    {
        float _2157 = fma(_2107, _2101, _2143);
        _2109 = _2157;
    }
    float _2159 = _2109;
    if (_2047)
    {
        float _2161 = _2151 * _2151;
        _2063 = _2161;
    }
    float _2163 = _2063;
    float _2165 = fma(_2159, _2159, _2155);
    float _2167 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2169 = fma(_2027, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2167);
    float _2171 = precise::clamp(_2169, 0.0, 1.0);
    float _2173 = _2165 + _2163;
    float _2175 = -_2171;
    float _2177 = _2175 + 1.0;
    float _2179 = rsqrt(_2173);
    float _2181 = abs(_2177);
    float _2183 = log2(_2181);
    float _2185 = _2179 * _2137;
    float _2187 = _2179 * _2159;
    float _2189 = _2179 * _2151;
    float _2191 = float(_1867);
    float _2193 = _2185 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2195 = _2187 + 1.0;
    bool _2197 = _2191 >= _779;
    bool _2199 = isnan(_2191);
    bool _2201 = _2197 || _2199;
    bool _2203 = isnan(_779);
    bool _2205 = _2201 || _2203;
    float _2207 = float(_2205);
    float _2209 = -_2193;
    float _2211 = fma(_2187, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2209);
    float _2213 = _2183 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2215 = -_2189;
    float _2217 = fma(_2215, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2211);
    float _2219 = trunc(_2207);
    int _2221 = int(_2219);
    float _2223 = fma(_2217, -0.5, 0.5);
    float _2225 = fma(_2217, 0.5, 0.5);
    float _2227 = exp2(_2213);
    float _2229 = fma(_2225, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2231 = fma(_2225, _2229, -0.212114393711090087890625);
    float _2233 = sqrt(_2223);
    float _2235 = fma(_2225, _2231, 1.570728778839111328125);
    float _2237 = -_2187;
    float _2239 = fma(_2227, _2195, _2237);
    float _2241 = 1.0 / _319;
    float _2243 = fma(_2239, 0.5, 0.5);
    float _2245 = _2233 * 0.636619746685028076171875;
    float _2247 = -_2235;
    float _2249 = fma(_2245, _2247, 1.0);
    float2 _6733 = float2(_2249, _2243);
    float3 _2253 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6733, float2(0.0), isnan(_6733)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6733, float2(0.0), isnan(_6733)), level(0.0)).xyz;
    float _2255 = _2253.x;
    float _2257 = _2253.y;
    float _2259 = _2253.z;
    int _2261 = _683 * _1941;
    int _2263 = _2261 + _1867;
    bool _2265 = _683 == 0;
    float _2267 = _1935 * _779;
    float _2269 = _807 * _2241;
    float _2271 = -_791;
    float _2273 = _2271 + 1.0;
    int _2275 = ~_2221;
    int _2277 = _2275 + 1;
    int _2279 = _2277 + 1;
    float _2281 = -_811;
    float _2283 = _2281 + 1.0;
    bool _2285 = !_2265;
    int _2287 = _2285 ? _2263 : (-1);
    float _2289 = trunc(_2267);
    int _2291 = int(_2289);
    int _2293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2295 = _2293 != 0;
    float _2297 = _2183 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2299 = _683 + (-1);
    int _2301 = _2287 * _2279;
    bool _2303 = !_2295;
    int _2305 = _2303 ? 0 : 1;
    float _2307 = -_359;
    float _2309 = _2307 + 1.0;
    int _2311 = abs(_693);
    float _2313 = trunc(_2269);
    int _2315 = int(_2313);
    int _2317 = _2221 * _2299;
    int _2319 = _2317 + _2301;
    int _2321 = abs(_2305);
    out.m_74.x = _1646;
    out.m_74.y = _1644;
    out.m_74.z = _1648;
    int _2323 = abs(_711);
    int _2325 = _2319 * _2311;
    int _2327 = abs(_717);
    int _2329 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2331 = _2329 != 0;
    float _2333 = exp2(_2297);
    bool _2335 = !_2331;
    int _2337 = _2335 ? 0 : 1;
    int _2339 = _2291 * _2321;
    int _2341 = _2339 + _1867;
    int _2343 = _2315 * _2323;
    int _2345 = _2343 + _2325;
    int _2347 = abs(_2337);
    int _2349 = ~_683;
    int _2351 = _2349 + 1;
    int _2353 = _2341 * _2327;
    int _2355 = _2353 + _2345;
    int _2357 = ~_683;
    int _2359 = _2357 + 1;
    bool _2361 = _171 > 0.5;
    int _2363 = _2291 * _2347;
    int _2365 = _2363 + _2355;
    int _2367 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2369 = _2367 != 0;
    float _2371 = -_2333;
    float _2373 = _2371 + 1.0;
    int _2375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2377 = _2375 != 0;
    float _2379 = float(uint(_2365));
    float _2381 = _2373 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2383 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2385 = _2383 != 0;
    int _2387 = ~_683;
    int _2389 = _2387 + 1;
    float _2391 = as_type<float>(_1873) * _2379;
    float _2393 = _2381 * _1832;
    float _2395 = trunc(_2391);
    float _2397 = precise::max(_2395, 0.0);
    uint _2399 = uint(_2397);
    int _2401 = _2351 * int(_2399);
    int _2403 = _2401 + _2365;
    float _2405 = float(uint(_2403));
    float _2407 = as_type<float>(_1873) * _2405;
    float _2409 = trunc(_2407);
    float _2411 = precise::max(_2409, 0.0);
    uint _2413 = uint(_2411);
    float _2415 = -_1031;
    int _2417 = _2361 ? as_type<int>(_2415) : as_type<int>(_1031);
    bool _2419 = !_2377;
    float _2421 = _2419 ? _1031 : as_type<float>(_2417);
    float _2423 = _1031 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2425 = int(_2399) + int(_2413);
    float _2427 = _2421 + 0.5;
    float _2429 = float(uint(_2341));
    int _2431 = _2359 * _2425;
    int _2433 = _2431 + _2365;
    float _2435 = fma(_2427, (*spvDescriptorSet0.vp_c9)._m0[80].x, _783);
    bool _2437 = uint(_2433) >= uint(_683);
    float _2439 = as_type<float>(_1873) * _2429;
    float _2441 = -_2273;
    float _2443 = fma(_2421, _2441, _2435);
    bool _2445 = !_2437;
    int _2447 = _2445 ? 0 : (-1);
    bool _2449 = _361 > 0.5;
    float _2451 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2453 = ~_2425;
    int _2455 = _2453 + _2447;
    int _2457 = _2455 + 1;
    float _2459 = trunc(_2439);
    float _2461 = precise::max(_2459, 0.0);
    uint _2463 = uint(_2461);
    float _2465 = -_1023;
    int _2467 = _2449 ? as_type<int>(_2465) : as_type<int>(_1023);
    float _2469 = _2451 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2471 = _683 * _2457;
    int _2473 = _2471 + _2365;
    int _2475 = ~_683;
    int _2477 = _2475 + 1;
    float _2479 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _2481 = !_2385;
    float _2483 = _2481 ? _1023 : as_type<float>(_2467);
    float _2485 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2487 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2489 = _2483 + (-0.5);
    int _2491 = _2389 * int(_2463);
    int _2493 = _2491 + _2341;
    float _2495 = _2485 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2497 = _2487 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2499 = float(uint(_2493));
    float _2501 = -_2489;
    float _2503 = -_785;
    float _2505 = fma(_2501, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2503);
    bool _2507 = !_2265;
    int _2509 = _2507 ? _2473 : (-1);
    out.m_76.x = _2469;
    out.m_76.y = _2495;
    out.m_76.z = _2497;
    out.m_76.w = _2479;
    float _2511 = abs(_1081);
    float _2513 = log2(_2511);
    float _2515 = as_type<float>(_1873) * _2499;
    int _2517 = _2509 >> 31;
    float _2519 = fma(_2483, _2283, _2505);
    int _2521 = _2517 & 3;
    out.m_78.x = _2443;
    out.m_78.y = _2519;
    int _2523 = _2509 & 3;
    bool _2525 = _2523 != 0;
    int _2527 = _2509 + _2521;
    float _2529 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2531 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2533 = _2527 >> 2;
    float _2535 = _2513 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2537 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2539 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2541 = _2533 << 4;
    int _2543 = _2541 + 368;
    float _2545 = trunc(_2515);
    float _2547 = precise::max(_2545, 0.0);
    uint _2549 = uint(_2547);
    float _2551 = _2531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2553 = _2537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    uint _2555 = uint(int(uint(_2543) >> uint(2)));
    uint _2557 = uint(int(uint(int(_2555)) >> uint(2)));
    int _2559 = int(_2555) & 3;
    float _2561 = (*spvDescriptorSet0.vp_c9)._m0[int(_2557)][_2559];
    int _2563 = int(_2555) + 1;
    uint _2565 = uint(int(uint(_2563) >> uint(2)));
    int _2567 = _2563 & 3;
    float _2569 = (*spvDescriptorSet0.vp_c9)._m0[int(_2565)][_2567];
    float _2571 = _2539 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2573 = _2509 & 3;
    bool _2575 = _2573 != 0;
    float _2577 = -_1067;
    float _2579 = fma(_2577, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2529);
    float _2581 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2583 = exp2(_2535);
    out.m_80.x = _2551;
    out.m_80.y = _2553;
    out.m_80.z = _2571;
    bool _2585 = uint(_2573) > 1u;
    float _2587 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2589 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2581);
    float _2591 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2593 = _1081 <= 8000.0;
    bool _2595 = isnan(_1081);
    bool _2597 = _2593 || _2595;
    bool _2599 = isnan(8000.0);
    bool _2601 = _2597 || _2599;
    float _2603 = float(_2601);
    int _2605 = int(_2463) + int(_2549);
    float _2607 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2609 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2611 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2589);
    int _2613 = _2543 + 8;
    uint _2615 = uint(int(uint(_2613) >> uint(2)));
    uint _2617 = uint(int(uint(int(_2615)) >> uint(2)));
    int _2619 = int(_2615) & 3;
    float _2621 = (*spvDescriptorSet0.vp_c9)._m0[int(_2617)][_2619];
    int _2623 = int(_2615) + 1;
    uint _2625 = uint(int(uint(_2623) >> uint(2)));
    int _2627 = _2623 & 3;
    float _2629 = (*spvDescriptorSet0.vp_c9)._m0[int(_2625)][_2627];
    float _2631 = -_1067;
    float _2633 = fma(_2631, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2607);
    int _2635 = _2525 ? 0 : 1;
    float _2637 = -_1067;
    float _2639 = fma(_2637, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2609);
    float _2641 = fma(_2583, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2643 = precise::clamp(_2641, 0.0, 1.0);
    float _2645 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2647 = ~_2635;
    int _2649 = _2647 + 1;
    int _2651 = _2649 + 1;
    float _2653 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2633);
    int _2655 = _2651;
    float _2657 = _2603;
    if (!_2585)
    {
        int _2659 = ~_2635;
        int _2661 = _2659 + 1;
        _2655 = _2661;
    }
    int _2663 = _2655;
    float _2665 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2579);
    bool _2667 = _2573 != 3;
    float _2669 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2639);
    bool _2671 = uint(_2573) >= 2u;
    float _2673 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2587);
    float _2675 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2645);
    int _2677 = abs(_2663);
    float _2679 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2681 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2683 = _2671 ? 0 : 1;
    float _2685 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2591);
    bool _2687 = !_2575;
    int _2689 = _2687 ? 0 : 1;
    float _2691 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2679);
    bool _2693 = _2573 != 3;
    int _2695 = _2477 * _2605;
    int _2697 = _2695 + _2341;
    int _2699 = ~_2677;
    int _2701 = _2699 + 1;
    int _2703 = _2701 + 1;
    float _2705 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2681);
    int _2707 = ~_2683;
    int _2709 = _2707 + 1;
    int _2711 = _2709 + 1;
    float _2713 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2675);
    int _2715 = _2711;
    if (_2667)
    {
        int _2717 = ~_2683;
        int _2719 = _2717 + 1;
        _2715 = _2719;
    }
    int _2721 = _2715;
    float _2723 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2673);
    int _2725 = abs(_2689);
    int _2727 = _2703 * as_type<int>(_2569);
    bool _2729 = !_2693;
    int _2731 = _2729 ? 0 : (-1);
    float _2733 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2685);
    int _2735 = abs(_2721);
    float _2737 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2691);
    bool _2739 = !_2369;
    int _2741 = _2739 ? 0 : 1;
    float _2743 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2705);
    bool _2745 = uint(_2697) >= uint(_683);
    int _2747 = abs(_2731);
    int _2749 = ~_2725;
    int _2751 = _2749 + 1;
    int _2753 = _2751 + 1;
    int _2755 = abs(_2741);
    bool _2757 = !_2745;
    int _2759 = _2757 ? 0 : (-1);
    int _2761 = _2753 * as_type<int>(_2561);
    int _2763 = _2761 + _2727;
    int _2765 = ~_2735;
    int _2767 = _2765 + 1;
    int _2769 = _2767 + 1;
    int _2771 = ~_2605;
    int _2773 = _2771 + _2759;
    int _2775 = _2773 + 1;
    int _2777 = _2769 * as_type<int>(_2621);
    int _2779 = _2777 + _2763;
    int _2781 = ~_2747;
    int _2783 = _2781 + 1;
    int _2785 = _2783 + 1;
    float _2787 = _1023 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2789 = ~_2755;
    int _2791 = _2789 + 1;
    int _2793 = _2791 + 1;
    int _2795 = _683 * _2775;
    int _2797 = _2795 + _2341;
    int _2799 = _2785 * as_type<int>(_2629);
    int _2801 = _2799 + _2779;
    float _2803 = _2787 * _2665;
    float _2805 = _2787 * _2669;
    int _2807 = _2801 * _2793;
    bool _2809 = !_2265;
    int _2811 = _2809 ? _2797 : (-1);
    float _2813 = _2787 * _2653;
    float _2815 = fma(_2643, -2.0, 3.0);
    float _2817 = _2643 * _2643;
    float _2819 = fma(_2423, _2713, _2805);
    int _2821 = _2811 * _2755;
    int _2823 = _2821 + _2807;
    float _2825 = _1694 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2827 = _2817 * _2815;
    float _2829 = fma(_2423, _2723, _2803);
    float _2831 = _2743 + _2819;
    float _2833 = fma(_1704, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2825);
    float _2835 = -_2827;
    float _2837 = _2835 + 1.0;
    float _2839 = float(_2823);
    float _2841 = fma(_2423, _2611, _2813);
    float _2843 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2833);
    float _2845 = fma(_2837, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2827);
    float _2847 = _1843 * _2393;
    float _2849 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2843);
    float _2851 = _2603 * _2845;
    float _2853 = _2839;
    if (!_1726)
    {
        _2657 = 1.0;
    }
    float _2855 = _2657;
    float _2857 = _2737 + _2841;
    float _2859 = _2849 + _1756;
    float _2861 = _2851 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2863 = _2855;
    float _2865 = _2861;
    if (_1726)
    {
        bool _2867 = _1830 >= _1820;
        bool _2869 = isnan(_1830);
        bool _2871 = _2867 || _2869;
        bool _2873 = isnan(_1820);
        bool _2875 = _2871 || _2873;
        float _2877 = float(_2875);
        _2863 = _2877;
    }
    float _2879 = _2863;
    float _2881 = _2733 + _2829;
    float _2883 = _2859 * 0.5;
    float _2885 = _2309 * _2861;
    float _2887 = precise::clamp(_2885, 0.0, 1.0);
    float _2889 = _2879 * _2005;
    out.m_82.x = _2857;
    out.m_82.y = _2881;
    out.m_82.z = _2831;
    float _2891 = -_2887;
    float _2893 = fma(_2891, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    bool _2895 = _2027 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2897 = isnan(_2027);
    bool _2899 = _2895 || _2897;
    bool _2901 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2903 = _2899 || _2901;
    out.m_84.z = _2883;
    out.m_84.w = _1756;
    float _2905 = -_2889;
    float _2907 = fma(_2905, _2893, 1.0);
    float _2909 = precise::clamp(_2907, 0.0, 1.0);
    out.gl_Position.x = _1788;
    out.gl_Position.y = _1810;
    out.gl_Position.z = _2849;
    out.gl_Position.w = _1756;
    float _2911 = _2259 * _2393;
    float _2913 = fma(_2255, _2847, _1837);
    float _2915 = fma(_2257, _2847, _1839);
    float _2917 = -_2381;
    float _2919 = _2917 + 1.0;
    float _2921 = _2909 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2923 = fma(_1843, _2911, _1841);
    out.m_86.x = _2839;
    float _2925 = _1843 * _2919;
    float _2927 = _2919;
    float _2929 = _2889;
    float _2931 = _2887;
    float _2933 = _2909;
    if (!_2903)
    {
        _2865 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2935 = _2865;
    out.m_88.x = _2921;
    float _2937 = _2935;
    float _2939 = _2935;
    if (!_2903)
    {
        _2927 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2941 = _2927;
    float _2943 = _2941;
    float _2945 = _2941;
    if (!_2903)
    {
        _2929 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2947 = _2929;
    out.m_90.x = _2913;
    out.m_90.y = _2915;
    out.m_90.z = _2923;
    out.m_90.w = _2925;
    float _2949 = _2947;
    float _2951 = _2947;
    if (!_2903)
    {
        _2853 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2953 = _2853;
    float _2955 = _2953;
    float _2957 = _2953;
    if (!_2903)
    {
        _2931 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2959 = _2931;
    float _2961 = _2959;
    float _2963 = _2959;
    if (!_2903)
    {
        _2933 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2965 = _2933;
    bool _2967 = !_2903;
    float _2969 = _2965;
    float _2971 = _2965;
    if (!_2967)
    {
        bool _2973 = _2027 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2975 = isnan(_2027);
        bool _2977 = _2973 || _2975;
        bool _2979 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2981 = _2977 || _2979;
        if (!_2981)
        {
            float _2983 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2985 = _2027 + _2983;
            float _2987 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2989 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2987;
            float _2991 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2993 = _2991 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2995 = 1.0 / _2989;
            float _2997 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2999 = _2997 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3001 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3003 = _3001 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3005 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3007 = _3005 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3009 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3011 = _3009 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3013 = _2985 * _2995;
            float _3015 = precise::clamp(_3013, 0.0, 1.0);
            float _3017 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3019 = _3017 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3021 = fma(_3015, _2993, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3023 = fma(_3015, _3019, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3025 = fma(_3015, _2999, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3027 = fma(_3015, _3003, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3029 = fma(_3015, _3007, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3031 = fma(_3015, _3011, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2945 = _3025;
            _2963 = _3029;
            _2939 = _3021;
            _2951 = _3027;
            _2957 = _3023;
            _2971 = _3031;
            _3033 = true;
        }
        else
        {
            bool _3035 = _2027 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3037 = isnan(_2027);
            bool _3039 = _3035 || _3037;
            bool _3041 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3043 = _3039 || _3041;
            if (!_3043)
            {
                _2937 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3045 = _2937;
            _2939 = _3045;
            if (!_3043)
            {
                _2943 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3047 = _2943;
            _2945 = _3047;
            if (!_3043)
            {
                _2955 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3049 = _2955;
            _2957 = _3049;
            if (!_3043)
            {
                _2949 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3051 = _2949;
            _2951 = _3051;
            if (!_3043)
            {
                _2961 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3053 = _2961;
            _2963 = _3053;
            if (!_3043)
            {
                _2969 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3055 = _2969;
            bool _3057 = !_3043;
            _2971 = _3055;
            if (!_3057)
            {
                bool _3059 = _2027 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3061 = isnan(_2027);
                bool _3063 = _3059 || _3061;
                bool _3065 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3067 = _3063 || _3065;
                if (!_3067)
                {
                    float _3069 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3071 = _2027 + _3069;
                    float _3073 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3075 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3073;
                    float _3077 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3079 = _3077 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3081 = 1.0 / _3075;
                    float _3083 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3085 = _3083 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3087 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3089 = _3087 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3091 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3093 = _3091 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3095 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3097 = _3095 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3099 = _3071 * _3081;
                    float _3101 = precise::clamp(_3099, 0.0, 1.0);
                    float _3103 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3105 = _3103 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3107 = fma(_3101, _3079, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3109 = fma(_3101, _3105, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3111 = fma(_3101, _3085, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3113 = fma(_3101, _3089, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3115 = fma(_3101, _3093, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3117 = fma(_3101, _3097, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2945 = _3111;
                    _2963 = _3115;
                    _2939 = _3107;
                    _2951 = _3113;
                    _2957 = _3109;
                    _2971 = _3117;
                    _3033 = true;
                }
                else
                {
                    _2945 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2963 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2939 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2951 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2957 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2971 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3033 = false;
    float _3119 = _2945;
    float _3121 = _2963;
    float _3123 = _2939;
    float _3125 = _2951;
    float _3127 = _2957;
    float _3129 = _2971;
    float _3131 = fma(_2881, -0.5, 0.5);
    float _3133 = precise::clamp(_3131, 0.0, 1.0);
    float _3135 = -_3119;
    float _3137 = _3135 + _3121;
    float _3139 = -_3123;
    float _3141 = _3139 + _3125;
    float _3143 = -_3127;
    float _3145 = _3143 + _3129;
    bool _3147 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3149 = fma(_3133, _3137, _3119);
    float _3151 = fma(_3133, _3141, _3123);
    float _3153 = fma(_3133, _3145, _3127);
    float _3155 = _3149 * 0.586610972881317138671875;
    out.m_92.x = 0.0;
    float _3157 = fma(_3151, 0.298911988735198974609375, _3155);
    float _3159 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3161 = fma(_3153, 0.114477999508380889892578125, _3157);
    out.m_59.x = _3159;
    float _3163 = -_3161;
    float _3165 = _3151 + _3163;
    float _3167 = -_3161;
    float _3169 = _3149 + _3167;
    float _3171 = -_3161;
    float _3173 = _3153 + _3171;
    out.m_94.x = 0.0;
    float _3175 = fma(_3165, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3161);
    float _3177 = fma(_3169, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3161);
    float _3179 = fma(_3173, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3161);
    out.m_96.x = _3175;
    out.m_96.y = _3177;
    out.m_96.z = _3179;
    if (!_3147)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3181 = -_1644;
    float _3183 = _3181 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3185 = -_1646;
    float _3187 = _3185 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3189 = -_1648;
    float _3191 = _3189 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3193 = _3183 * _3183;
    float _3195 = fma(_3187, _3187, _3193);
    float _3197 = fma(_3191, _3191, _3195);
    float _3199 = rsqrt(_3197);
    float _3201 = sqrt(_3197);
    float _3203 = _3183 * _3199;
    float _3205 = _3187 * _3199;
    float _3207 = _3191 * _3199;
    float _3209 = -_2033;
    float _3211 = _3209 + _3203;
    float _3213 = -_2029;
    float _3215 = _3213 + _3205;
    float _3217 = -_2031;
    float _3219 = _3217 + _3207;
    float _3221 = _3211 * _3211;
    float _3223 = -_3201;
    float _3225 = _3223 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3227 = fma(_3215, _3215, _3221);
    float _3229 = _3225 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3231 = precise::clamp(_3229, 0.0, 1.0);
    float _3233 = fma(_3219, _3219, _3227);
    float _3235 = abs(_3231);
    float _3237 = log2(_3235);
    float _3239 = rsqrt(_3233);
    float _3241 = _3237 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3243 = exp2(_3241);
    float _3245 = _3211 * _3239;
    float _3247 = _3215 * _3239;
    float _3249 = _3219 * _3239;
    float _3251 = _2881 * _3245;
    float _3253 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _3255 = precise::clamp(_3253, 0.0, 1.0);
    float _3257 = _2881 * _3203;
    float _3259 = fma(_2857, _3247, _3251);
    float _3261 = _3255 * _3255;
    float _3263 = fma(_2857, _3205, _3257);
    float _3265 = fma(_2831, _3249, _3259);
    float _3267 = precise::clamp(_3265, 0.0, 1.0);
    float _3269 = _3261 + (-1.0);
    float _3271 = fma(_2831, _3207, _3263);
    float _3273 = precise::clamp(_3271, 0.0, 1.0);
    float _3275 = _3267 * _3267;
    float _3277 = _3205 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3279 = fma(_3275, _3269, 1.0);
    float _3281 = -_3203;
    float _3283 = -_3277;
    float _3285 = fma(_3281, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3283);
    float _3287 = _3279 * _3279;
    float _3289 = -_3207;
    float _3291 = fma(_3289, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3285);
    float _3293 = 1.0 / _3287;
    float _3295 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3297 = _3291 + _3295;
    float _3299 = _3297 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3301 = precise::clamp(_3299, 0.0, 1.0);
    float _3303 = _3243 * _3301;
    float _3305 = _3273 * _3303;
    float _3307 = _3261 * _3293;
    float _3309 = _3305 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3311 = _3305 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _3313 = _3305 * _3307;
    float _3315 = _3305 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3317 = _3313 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3319 = _3313 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3321 = _3313 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_92.x = _3315;
    out.m_92.y = _3309;
    out.m_92.z = _3311;
    out.m_94.x = _3317;
    out.m_94.y = _3319;
    out.m_94.z = _3321;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3033 = false;
    bool _309 = false;
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
        float _3378 = as_type<float>(_131);
        out.gl_Position.z = _3378;
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
    float _153 = _149;
    if (_145)
    {
        float _155 = float(_115);
        _151 = _155;
    }
    float _157 = _151;
    bool _159 = _149 >= _157;
    bool _161 = !_145;
    bool _163 = _159 || _161;
    if (_163)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _125;
    if (_163)
    {
        out.m_59.x = 0.0;
    }
    if (_163)
    {
        float _167 = _165 * 5.0;
        _133 = as_type<int>(_167);
    }
    int _169 = _133;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3447 = as_type<float>(_169);
        out.gl_Position.z = _3447;
    }
    if (_163)
    {
        return out;
    }
    float _171 = in.m_63.x;
    float _173 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _175 = _149 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _177 = in.m_65.x;
    float _179 = in.m_65.y;
    float _181 = in.m_65.z;
    float _183 = _175 * _173;
    float _185 = fma(_171, (*spvDescriptorSet0.vp_c9)._m0[20].x, _183);
    float _187 = floor(_185);
    int _189 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _191 = _189 != 0;
    float _193 = _185 * 6.283185482025146484375;
    float _195 = _179 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _197 = _179 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _199 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _201 = _199 != 0;
    int _203 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _205 = _203 != 0;
    float _207 = _193 * 0.15915493667125701904296875;
    float _209 = _179 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _211 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[4].x, _195);
    float _213 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[5].x, _197);
    bool _215 = !_201;
    int _217 = _215 ? 0 : 1;
    float _219 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[6].x, _209);
    float _221 = _207 * 6.283185482025146484375;
    float _223 = cos(_221);
    bool _225 = !_205;
    int _227 = _225 ? 0 : 1;
    float _229 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[4].z, _211);
    int _231 = abs(_217);
    float _233 = -_187;
    float _235 = _185 + _233;
    bool _237 = !_191;
    int _239 = _237 ? 0 : 1;
    float _241 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[5].z, _213);
    float _243 = -_235;
    float _245 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _247 = abs(_239);
    float _249 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[6].z, _219);
    float _251 = float(_231);
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _255 = abs(_227);
    float _257 = fma(_223, 0.5, 0.5);
    float _259 = abs(_245);
    float _261 = _251 * _259;
    bool _263 = _235 < 0.5;
    float _265 = float(_263);
    float _267 = -_257;
    float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _271 = float(_247);
    float _273 = -_265;
    float _275 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _277 = float(_255);
    float _279 = fma(_271, _269, _261);
    float _281 = abs(_275);
    float _283 = fma(_277, _281, _279);
    bool _285 = !_253;
    float _287 = _249;
    float _305;
    float _307;
    if (!_285)
    {
        float _289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _291 = _171 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _293 = float(_115);
        float _295 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _297 = _295 * _289;
        float _299 = floor(_297);
        float _301 = -_299;
        float _303 = _297 + _301;
        _305 = _303;
        _307 = _293;
        _309 = true;
    }
    else
    {
        float _311 = float(_115);
        float _313 = 1.0 / _311;
        float _315 = _149 * _313;
        _305 = _315;
        _307 = _311;
    }
    _309 = false;
    float _317 = _305;
    float _319 = _307;
    float _321 = in.m_56.x;
    float _323 = in.m_56.y;
    float _325 = in.m_56.z;
    float _327 = _323 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _329 = _323 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _331 = fma(_321, (*spvDescriptorSet0.vp_c10)._m0[4].x, _327);
    float _333 = fma(_321, (*spvDescriptorSet0.vp_c10)._m0[6].x, _329);
    float _335 = fma(_325, (*spvDescriptorSet0.vp_c10)._m0[4].z, _331);
    float _337 = fma(_325, (*spvDescriptorSet0.vp_c10)._m0[6].z, _333);
    float _339 = _335 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _341 = _337 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _343 = fma(_339, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _345 = fma(_341, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _347 = floor(_343);
    float _349 = floor(_345);
    float _351 = -_347;
    float _353 = _343 + _351;
    float _355 = -_349;
    float _357 = _345 + _355;
    float2 _3746 = float2(_353, _357);
    float _359 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3746, float2(0.0), isnan(_3746)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3746, float2(0.0), isnan(_3746)), level(0.0)).x;
    float _361 = in.m_63.y;
    float _363 = _171 * 2.0;
    float _365 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _367 = log2(_365);
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _371 = _317 + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _381;
    float _385 = _171 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _387 = floor(_363);
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _393 = _317 + _391;
    float _395 = -_389;
    float _397 = fma(_385, 2.0, _395);
    float _399 = 1.0 / _375;
    float _401 = in.m_63.z;
    float _403 = 1.0 / _379;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _407 = _317 + _405;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _413 = _387 > 0.0;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _417 = _387 >= 0.0;
    bool _419 = isnan(_387);
    bool _421 = _417 || _419;
    bool _423 = isnan(0.0);
    bool _425 = _421 || _423;
    float _427 = _361 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _429 = 1.0 / _383;
    float _431 = _323 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _433;
    float _437 = _407 * _399;
    int _439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _441 = _439 != 0;
    int _443 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _445 = _443 != 0;
    int _447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _449 = _447 != 0;
    float _451 = fma(_321, (*spvDescriptorSet0.vp_c10)._m0[5].x, _431);
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _455 = _317 + _453;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _459 = _317 + _457;
    float _461 = 1.0 / _411;
    float _463 = _361 * 2.0;
    float _465 = _171 + _401;
    float _467 = _455 * _403;
    float _469 = _171 + _361;
    float _471 = _465 + (-1.0);
    float _473 = fma(_325, (*spvDescriptorSet0.vp_c10)._m0[5].z, _451);
    float _475 = floor(_463);
    float _477 = _469 + (-1.0);
    float _479 = fma(_427, -2.0, _415);
    float _481 = _371 * _429;
    int _483 = _425 ? 0 : 1;
    float _485 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _487 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _489 = isnan(_317);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _495 = _491 || _493;
    float _497 = float(_495);
    float _499 = 1.0 / _435;
    float _501 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _503;
    float _507 = _393 * _461;
    float _509 = -_497;
    float _511 = _509 + 1.0;
    float _513 = _401 * 2.0;
    float _515 = fma(_505, _437, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _517 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _519 = isnan(_317);
    bool _521 = _517 || _519;
    bool _523 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _525 = _521 || _523;
    float _527 = float(_525);
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _531 = _529 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _533 = _361 + _401;
    bool _535 = _475 > 0.0;
    float _537 = floor(_513);
    bool _539 = _475 >= 0.0;
    bool _541 = isnan(_475);
    bool _543 = _539 || _541;
    bool _545 = isnan(0.0);
    bool _547 = _543 || _545;
    float _549 = _533 + (-1.0);
    bool _551 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _553 = isnan(_317);
    bool _555 = _551 || _553;
    bool _557 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _559 = _555 || _557;
    float _561 = float(_559);
    float _563 = -_527;
    float _565 = _563 + 1.0;
    float _567 = _459 * _499;
    float _569 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _571;
    float _575 = _561 * _511;
    float _577 = -_561;
    float _579 = _577 + 1.0;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _583 = _581 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _585 = fma(_573, _437, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _587 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _589 = isnan(_317);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _595 = _591 || _593;
    float _597 = float(_595);
    float _599 = _527 * _579;
    bool _601 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _603 = isnan(_317);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = fma(_531, _467, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _615 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _617 = isnan(_317);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = _597 * _565;
    float _629 = -_597;
    float _631 = _629 + 1.0;
    float _633 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _635 = int(_633);
    bool _637 = _537 >= 0.0;
    bool _639 = isnan(_537);
    bool _641 = _637 || _639;
    bool _643 = isnan(0.0);
    bool _645 = _641 || _643;
    float _647 = -_625;
    float _649 = _647 + 1.0;
    float _651 = _625 * _631;
    float _653 = _367 * _149;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _655;
    float _659 = _611 * _649;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _663 = _661 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _665 = exp2(_653);
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _667;
    float _671 = fma(_657, _481, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _673 = _515 * _659;
    float _675 = _585 * _659;
    float _677 = fma(_583, _467, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _679 = fma(_669, _481, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _681 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _683 = int(_681);
    float _685 = fma(_663, _507, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _687 = float(_635);
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _691 = !_445;
    int _693 = _691 ? 0 : 1;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _697 = 1.0 + _695;
    int _699 = ~_483;
    int _701 = _699 + 1;
    int _703 = _701 + 1;
    float _705 = -_665;
    float _707 = _705 + 1.0;
    bool _709 = !_441;
    int _711 = _709 ? 0 : 1;
    float _713 = 1.0 / _687;
    bool _715 = !_449;
    int _717 = _715 ? 0 : 1;
    float _719 = _473 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _721 = _703;
    if (!_413)
    {
        int _723 = ~_483;
        int _725 = _723 + 1;
        _721 = _725;
    }
    int _727 = _721;
    float _729 = fma(_171, (*spvDescriptorSet0.vp_c9)._m0[78].z, _689);
    int _731 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _733 = _731 != 0;
    int _735 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _737 = _735 != 0;
    int _739 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _741 = _739 != 0;
    float _743 = _719 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _745 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _747 = isnan(0.0);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _753 = _749 || _751;
    float _755 = 1.0 / _697;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _759 = _757 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _761 = _753 ? _707 : 0.0;
    float _763 = fma(_339, (*spvDescriptorSet0.vp_c8)._m0[11].x, _743);
    bool _765 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _767 = isnan(1.0);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _773 = _769 || _771;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _777 = fma(_759, _507, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _779 = float(_683);
    float _781 = -_149;
    float _783 = fma(_781, (*spvDescriptorSet0.vp_c9)._m0[76].x, _397);
    float _785 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _479);
    float _787 = _719 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _789 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[78].w, _775);
    float _791 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _729);
    float _793 = fma(_341, (*spvDescriptorSet0.vp_c8)._m0[11].z, _763);
    bool _795 = !_737;
    int _797 = _795 ? 0 : 1;
    float _799 = -_611;
    float _801 = _799 + 1.0;
    int _803 = _547 ? 0 : 1;
    float _805 = fma(_339, (*spvDescriptorSet0.vp_c8)._m0[10].x, _787);
    float _807 = _779 * _149;
    float _809 = _713 * _149;
    float _811 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _789);
    float _813 = _793 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    if (_773)
    {
        float _815 = _761 * _755;
        _153 = _815;
    }
    float _817 = _153;
    int _819 = abs(_797);
    float _821 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[143].x, _673);
    int _823 = ~_803;
    int _825 = _823 + 1;
    int _827 = _825 + 1;
    float _829 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[143].y, _675);
    bool _831 = _537 > 0.0;
    float _833 = in.m_67.x;
    float _835 = in.m_67.y;
    float _837 = in.m_67.z;
    int _839 = _827;
    if (!_535)
    {
        int _841 = ~_803;
        int _843 = _841 + 1;
        _839 = _843;
    }
    int _845 = _839;
    float _847 = fma(_341, (*spvDescriptorSet0.vp_c8)._m0[10].z, _805);
    float _849 = float(_727);
    float _851 = 1.0 / _813;
    float _853 = float(_819);
    float _855 = _847 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _857 = !_733;
    int _859 = _857 ? 0 : 1;
    float _861 = fma(_613, _651, _821);
    int _863 = _645 ? 0 : 1;
    float _865 = _853 * _849;
    bool _867 = !_741;
    int _869 = _867 ? 0 : 1;
    float _871 = _855 + _813;
    int _873 = abs(_859);
    float _875 = _865 * (-2.0);
    int _877 = ~_863;
    int _879 = _877 + 1;
    int _881 = _879 + 1;
    float _883 = _401 + (-0.5);
    int _885 = _881;
    if (!_831)
    {
        int _887 = ~_863;
        int _889 = _887 + 1;
        _885 = _889;
    }
    int _891 = _885;
    float _893 = fma(_677, _651, _829);
    int _895 = abs(_869);
    float _897 = _871 * _851;
    float _899 = _897 * 0.5;
    float _901 = _361 + (-0.5);
    float _903 = float(_891);
    float _905 = fma(_875, _835, _835);
    float _907 = float(_873);
    float _909 = fma(_671, _627, _861);
    float _911 = float(_895);
    float _913 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[196].y, _905);
    float _915 = float(_845);
    float _917 = _907 * _903;
    float _919 = fma(_569, _875, _569);
    float _921 = fma(_679, _627, _893);
    float _923 = _917 * (-2.0);
    float _925 = _911 * _915;
    float _927 = fma(_919, _817, _913);
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _929;
    float _933 = fma(_501, _923, _501);
    float _935 = fma(_923, _833, _833);
    float _937 = _171 + (-0.5);
    float _939 = _925 * (-2.0);
    float _941 = _927 * 0.15915493667125701904296875;
    float _943 = fma(_685, _599, _909);
    float _945 = fma(_937, (*spvDescriptorSet0.vp_c9)._m0[196].x, _935);
    float _947 = fma(_939, _837, _837);
    float _949 = as_type<float>(int(gl_VertexIndex));
    float _951 = fma(_485, _939, _485);
    float _953 = fma(_933, _817, _945);
    float _955 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[196].z, _947);
    float _957 = in.m_72.x;
    float _959 = in.m_72.y;
    float _961 = fma(_777, _599, _921);
    float _963 = fma(_951, _817, _955);
    float _965 = _953 * 0.15915493667125701904296875;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _967;
    float _971 = _963 * 0.15915493667125701904296875;
    float _973 = _941 * 6.283185482025146484375;
    float _975 = sin(_973);
    float _977 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _979 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[30].w, _977);
    float _981 = fma(_969, _567, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _983 = fma(_931, _567, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _985 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _987 = fma(_981, _575, _943);
    float _989 = fma(_983, _575, _961);
    float _991 = _941 * 6.283185482025146484375;
    float _993 = cos(_991);
    float _995 = _719 + _985;
    float _997 = fma(_497, (*spvDescriptorSet0.vp_c9)._m0[148].x, _987);
    float _999 = fma(_497, (*spvDescriptorSet0.vp_c9)._m0[148].y, _989);
    int _1001 = as_type<int>(_949) & 1;
    bool _1003 = _1001 != 0;
    int _1005 = as_type<int>(_949) & 2;
    bool _1007 = _1005 != 0;
    float _1009 = _995 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1011 = _995 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1013 = _965 * 6.283185482025146484375;
    float _1015 = sin(_1013);
    float _1017 = _999 * _959;
    float _1019 = _997 * _957;
    bool _1021 = !_1007;
    float _1023 = _1021 ? (-0.5) : 0.5;
    float _1025 = fma(_339, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1009);
    float _1027 = _283 * _1017;
    bool _1029 = !_1003;
    float _1031 = _1029 ? (-0.5) : 0.5;
    float _1033 = _283 * _1019;
    float _1035 = _971 * 6.283185482025146484375;
    float _1037 = cos(_1035);
    float _1039 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1023);
    float _1041 = _1027 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1043 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1031);
    float _1045 = _1033 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1047 = fma(_339, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1011);
    float _1049 = _1041 * _1039;
    float _1051 = _965 * 6.283185482025146484375;
    float _1053 = cos(_1051);
    float _1055 = _1015 * _975;
    float _1057 = _1045 * _1043;
    float _1059 = _1015 * _993;
    float _1061 = 1.0 / _979;
    float _1063 = _1015 * _1037;
    float _1065 = _971 * 6.283185482025146484375;
    float _1067 = sin(_1065);
    float _1069 = _1053 * _993;
    float _1071 = _1053 * _1037;
    float _1073 = _1053 * _975;
    float _1075 = _993 * _1037;
    float _1077 = _975 * _1037;
    float _1079 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1081 = _1061 * _1079;
    float _1083 = _1071 * _1049;
    bool _1085 = _1081 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1087 = _1081 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1089 = fma(_1067, _1069, _1055);
    float _1091 = fma(_1067, _1055, _1069);
    float _1093 = -_1073;
    float _1095 = fma(_1067, _1059, _1093);
    float _1097 = -_1059;
    float _1099 = fma(_1067, _1073, _1097);
    float _1101 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1103 = -_1049;
    float _1105 = _1067 * _1103;
    float _1107 = fma(_1089, _1057, _1083);
    float _1109 = _1063 * _1049;
    float _1111 = fma(_1075, _1057, _1105);
    float _1113 = fma(_1099, _1101, _1107);
    float _1115 = fma(_1095, _1057, _1109);
    int _1117 = 2;
    if (!_1085)
    {
        _1117 = 1;
    }
    int _1119 = _1117;
    float _1121 = fma(_1077, _1101, _1111);
    float _1123 = _1113 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1125 = fma(_1091, _1101, _1115);
    bool _1127 = !_1085;
    int _1129 = _1127 ? 0 : 1;
    float _1131 = _1113 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1133 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1123);
    int _1135 = _1119;
    if (!_1087)
    {
        _1135 = _1129;
    }
    int _1137 = _1135;
    float _1139 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1131);
    float _1141 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1133);
    int _1143 = _1137 << 6;
    float _1145 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1139);
    float _1147 = _1141 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _1149 = _1143 + 48;
    uint _1152 = uint(int(uint(_1149) >> uint(2)));
    uint _1154 = uint(int(uint(int(_1152)) >> uint(2)));
    int _1156 = int(_1152) & 3;
    float _1158 = (*spvDescriptorSet0.vp_c15)._m0[int(_1154)][_1156];
    int _1160 = int(_1152) + 1;
    uint _1162 = uint(int(uint(_1160) >> uint(2)));
    int _1164 = _1160 & 3;
    float _1166 = (*spvDescriptorSet0.vp_c15)._m0[int(_1162)][_1164];
    float _1168 = _1145 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1170 = _341 + _1147;
    float _1172 = fma(_341, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1047);
    float _1174 = _1113 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1176 = _339 + _1168;
    float _1178 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1180 = _1170 + _1178;
    float _1182 = _1172 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1184 = _1143 + 56;
    uint _1186 = uint(int(uint(_1184) >> uint(2)));
    uint _1188 = uint(int(uint(int(_1186)) >> uint(2)));
    int _1190 = int(_1186) & 3;
    float _1192 = (*spvDescriptorSet0.vp_c15)._m0[int(_1188)][_1190];
    int _1194 = int(_1186) + 1;
    uint _1196 = uint(int(uint(_1194) >> uint(2)));
    int _1198 = _1194 & 3;
    float _1200 = (*spvDescriptorSet0.vp_c15)._m0[int(_1196)][_1198];
    float _1202 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1204 = _1176 + _1202;
    float _1206 = _1180 * _1180;
    float _1208 = trunc(_1182);
    int _1210 = int(_1208);
    float _1212 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1174);
    float _1214 = fma(_1204, _1204, _1206);
    float _1216 = fma(_341, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1025);
    int _1218 = _1143 + 64;
    uint _1220 = uint(int(uint(_1218) >> uint(2)));
    uint _1222 = uint(int(uint(int(_1220)) >> uint(2)));
    int _1224 = int(_1220) & 3;
    float _1226 = (*spvDescriptorSet0.vp_c15)._m0[int(_1222)][_1224];
    int _1228 = int(_1220) + 1;
    uint _1230 = uint(int(uint(_1228) >> uint(2)));
    int _1232 = _1228 & 3;
    float _1234 = (*spvDescriptorSet0.vp_c15)._m0[int(_1230)][_1232];
    float _1236 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1212);
    float _1238 = sqrt(_1214);
    float _1240 = _1216 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1242 = _1236 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1244 = _1143 + 72;
    uint _1246 = uint(int(uint(_1244) >> uint(2)));
    uint _1248 = uint(int(uint(int(_1246)) >> uint(2)));
    int _1250 = int(_1246) & 3;
    float _1252 = (*spvDescriptorSet0.vp_c15)._m0[int(_1248)][_1250];
    int _1254 = int(_1246) + 1;
    uint _1256 = uint(int(uint(_1254) >> uint(2)));
    int _1258 = _1254 & 3;
    float _1260 = (*spvDescriptorSet0.vp_c15)._m0[int(_1256)][_1258];
    float _1262 = _719 + _1242;
    float _1264 = trunc(_1240);
    int _1266 = int(_1264);
    int _1268 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1270 = _1210 + _1268;
    int _1272 = _1270 + 1;
    int _1274 = _1143 + 96;
    uint _1276 = uint(int(uint(_1274) >> uint(2)));
    uint _1278 = uint(int(uint(int(_1276)) >> uint(2)));
    int _1280 = int(_1276) & 3;
    float _1282 = (*spvDescriptorSet0.vp_c15)._m0[int(_1278)][_1280];
    int _1284 = int(_1276) + 1;
    uint _1286 = uint(int(uint(_1284) >> uint(2)));
    int _1288 = _1284 & 3;
    float _1290 = (*spvDescriptorSet0.vp_c15)._m0[int(_1286)][_1288];
    bool _1292 = _1238 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1294 = _1143 + 104;
    uint _1296 = uint(int(uint(_1294) >> uint(2)));
    uint _1298 = uint(int(uint(int(_1296)) >> uint(2)));
    int _1300 = int(_1296) & 3;
    float _1302 = (*spvDescriptorSet0.vp_c15)._m0[int(_1298)][_1300];
    int _1304 = int(_1296) + 1;
    uint _1306 = uint(int(uint(_1304) >> uint(2)));
    int _1308 = _1304 & 3;
    float _1310 = (*spvDescriptorSet0.vp_c15)._m0[int(_1306)][_1308];
    int _1312 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1314 = _1266 + _1312;
    int _1316 = _1314 + 1;
    float _1318 = _1242;
    float _1320 = _1262;
    float _1322 = _1170;
    int _1324 = _1272;
    float _1326 = as_type<float>(_1316);
    if (!_1292)
    {
        _1318 = _1176;
    }
    float _1328 = _1318;
    bool _1330 = !_1292;
    float _1332 = _1328;
    int _1334 = as_type<int>(_1290);
    int _1336 = as_type<int>(_1192);
    if (!_1330)
    {
        float _1338 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1340 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1342 = _1238 + _1340;
        float _1344 = rsqrt(_1214);
        float _1346 = _1342 * _1338;
        float _1348 = _1262 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1350 = _1346 * 0.15915493667125701904296875;
        float _1352 = _1350 * 6.283185482025146484375;
        float _1354 = cos(_1352);
        float _1356 = _1350 * 6.283185482025146484375;
        float _1358 = sin(_1356);
        float _1360 = _1354 + (-1.0);
        float _1362 = fma(_1358, _1348, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1364 = _1360 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1366 = _1344 * _1362;
        float _1368 = fma(_1262, _1354, _1364);
        float _1370 = fma(_1204, _1366, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1372 = fma(_1180, _1366, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1320 = _1368;
        _1332 = _1370;
        _1322 = _1372;
    }
    float _1374 = _1320;
    float _1376 = _1332;
    float _1378 = _1322;
    float _1380 = -_719;
    float _1382 = _1380 + _1374;
    bool _1384 = _1316 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1386 = _1143 + 80;
    uint _1388 = uint(int(uint(_1386) >> uint(2)));
    uint _1390 = uint(int(uint(int(_1388)) >> uint(2)));
    int _1392 = int(_1388) & 3;
    float _1394 = (*spvDescriptorSet0.vp_c15)._m0[int(_1390)][_1392];
    int _1396 = int(_1388) + 1;
    uint _1398 = uint(int(uint(_1396) >> uint(2)));
    int _1400 = _1396 & 3;
    float _1402 = (*spvDescriptorSet0.vp_c15)._m0[int(_1398)][_1400];
    int _1404 = _1316 | _1272;
    float _1406 = -_339;
    float _1408 = _1406 + _1376;
    float _1410 = _1382 * _1382;
    float _1412 = -_341;
    float _1414 = _1412 + _1378;
    bool _1416 = _1404 < 0;
    bool _1418 = _1416 || _1384;
    float _1420 = fma(_1408, _1408, _1410);
    float _1422 = _995 * _1290;
    bool _1424 = _1272 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1426 = _1424 || _1418;
    float _1428 = fma(_1414, _1414, _1420);
    float _1430 = fma(_339, _1282, _1422);
    float _1432 = _995 * _1166;
    float _1434 = _995 * _1234;
    float _1436 = sqrt(_1428);
    float _1438 = fma(_341, _1302, _1430);
    float _1440 = fma(_339, _1158, _1432);
    float _1442 = fma(_339, _1226, _1434);
    bool _1444 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1446 = isnan(0.5);
    bool _1448 = _1444 || _1446;
    bool _1450 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1452 = _1448 || _1450;
    float _1454 = _1438 + _1310;
    float _1456 = fma(_341, _1192, _1440);
    int _1458 = as_type<int>(_1434);
    int _1460 = as_type<int>(_1442);
    float _1462 = _1376;
    float _1464 = _1374;
    float _1466 = _1378;
    float _1468 = _1456;
    float _1470 = _1438;
    float _1472 = _1408;
    if (!_1426)
    {
        int _1474 = _1272 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1476 = _1474 + _1316;
        _1324 = _1476;
    }
    int _1478 = _1324;
    float _1480 = _1234;
    if (!_1426)
    {
        float _1482 = floor(_1240);
        _1480 = _1482;
    }
    float _1484 = _1480;
    float _1486 = fma(_341, _1252, _1442);
    if (!_1426)
    {
        int _1488 = _1478 << 2;
        _1334 = _1488;
    }
    int _1490 = _1334;
    float _1492 = _1486 + _1260;
    if (!_1426)
    {
        uint _1494 = uint(int(uint(_1478) >> uint(2)));
        _1458 = int(_1494);
    }
    int _1496 = _1458;
    bool _1498 = _1436 > 0.0;
    float _1500 = 1.0 / _1454;
    float _1502 = as_type<float>(_1496);
    if (!_1426)
    {
        int _1504 = 12 & _1490;
        _1336 = _1504;
    }
    int _1506 = _1336;
    float _1508 = _1456 + _1200;
    if (!_1426)
    {
        int _1510 = _1496 << 4;
        int _1512 = _1510 + _1506;
        _1460 = _1512;
    }
    int _1514 = _1460;
    bool _1516 = !_1498;
    float _1518 = _1484;
    if (!_1516)
    {
        float _1520 = _241 * _241;
        float _1522 = rsqrt(_1428);
        float _1524 = fma(_229, _229, _1520);
        float _1526 = fma(_249, _249, _1524);
        float _1528 = sqrt(_1526);
        float _1530 = _1408 * _1522;
        float _1532 = _1382 * _1522;
        float _1534 = _1414 * _1522;
        bool _1536 = _1528 > 0.0;
        bool _1538 = !_1536;
        _1502 = _1526;
        _1468 = _1528;
        _1470 = _1530;
        if (!_1538)
        {
            float _1540 = rsqrt(_1526);
            float _1542 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1544 = _241 * _1540;
            float _1546 = _229 * _1540;
            float _1548 = _1532 * _1544;
            float _1550 = _249 * _1540;
            float _1552 = fma(_1530, _1546, _1548);
            float _1554 = _1542 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1556 = fma(_1534, _1550, _1552);
            float _1558 = _1556 * _1554;
            float _1560 = fma(_229, _1558, _1376);
            float _1562 = fma(_241, _1558, _1374);
            float _1564 = fma(_249, _1558, _1378);
            _1462 = _1560;
            _1464 = _1562;
            _1466 = _1564;
            _1502 = _1540;
            _1468 = _1546;
        }
    }
    float _1566 = _1462;
    float _1568 = _1464;
    float _1570 = _1466;
    float _1572 = _1502;
    float _1574 = _1468;
    float _1576 = _1470;
    float _1578 = _1574;
    float _1580 = _1572;
    if (_1452)
    {
        _1578 = _1566;
    }
    float _1582 = _1578;
    float _1584 = _1582;
    if (_1452)
    {
        _1580 = _1568;
    }
    float _1586 = _1580;
    float _1588 = _1586;
    if (_1452)
    {
        _287 = _1570;
    }
    float _1590 = _287;
    float _1592 = _1590;
    if (!_1452)
    {
        float _1594 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1596 = _719 + _1594;
        float _1598 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1600 = _339 + _1598;
        float _1602 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1604 = _1596 * _1596;
        float _1606 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1608 = _341 + _1606;
        float _1610 = fma(_1600, _1600, _1604);
        float _1612 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1614 = fma(_1608, _1608, _1610);
        float _1616 = sqrt(_1614);
        float _1618 = _1602 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1620 = -_719;
        float _1622 = _1620 + _1568;
        float _1624 = precise::min(_1616, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1626 = _1624 * _1612;
        float _1628 = -_341;
        float _1630 = _1628 + _1570;
        float _1632 = _1618 * _1626;
        float _1634 = -_339;
        float _1636 = _1634 + _1566;
        float _1638 = fma(_1622, _1632, _719);
        float _1640 = fma(_1636, _1632, _339);
        float _1642 = fma(_1630, _1632, _341);
        _1588 = _1638;
        _1584 = _1640;
        _1592 = _1642;
    }
    float _1644 = _1588;
    float _1646 = _1584;
    float _1648 = _1592;
    int _1650 = _1143 + 88;
    uint _1652 = uint(int(uint(_1650) >> uint(2)));
    uint _1654 = uint(int(uint(int(_1652)) >> uint(2)));
    int _1656 = int(_1652) & 3;
    float _1658 = (*spvDescriptorSet0.vp_c15)._m0[int(_1654)][_1656];
    int _1660 = int(_1652) + 1;
    uint _1662 = uint(int(uint(_1660) >> uint(2)));
    int _1664 = _1660 & 3;
    float _1666 = (*spvDescriptorSet0.vp_c15)._m0[int(_1662)][_1664];
    float _1668 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1670 = _1492 * _1500;
    float _1672 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1674 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1676 = fma(_1646, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1668);
    float _1678 = _1508 * _1500;
    float _1680 = fma(_1646, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1672);
    float _1682 = fma(_1646, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1674);
    float _1684 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1676);
    float _1686 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _1688 = _1678 >= 0.0;
    float _1690 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1680);
    float _1692 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1682);
    float _1694 = _1684 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1696 = _1678 <= 1.0;
    bool _1698 = _1696 && _1688;
    float _1700 = _1690 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1702 = fma(_1646, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1686);
    float _1704 = _1692 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1706 = _1694 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1708 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1710 = _1700 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1712 = _1670 >= 0.0;
    bool _1714 = _1712 && _1698;
    float _1716 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1702);
    float _1718 = fma(_1704, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1706);
    float _1720 = -_1710;
    float _1722 = fma(_1720, _1708, 1.0);
    bool _1724 = _1670 <= 1.0;
    bool _1726 = _1724 && _1714;
    float _1728 = _1716 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1730 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1718);
    float _1732 = _1576;
    float _1734 = _1722;
    if (!_1426)
    {
        float _1736 = floor(_1182);
        _1732 = _1736;
    }
    float _1738 = _1732;
    float _1740 = _1566;
    if (!_1426)
    {
        int _1742 = _1514 + 400;
        uint _1744 = uint(int(uint(_1742) >> uint(2)));
        uint _1746 = uint(int(uint(int(_1744)) >> uint(2)));
        int _1748 = int(_1744) & 3;
        float _1750 = (*spvDescriptorSet0.vp_c15)._m0[int(_1746)][_1748];
        _1740 = _1750;
    }
    float _1752 = _1740;
    float _1754 = _1694 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1756 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1730);
    float _1758 = _995 * _1402;
    if (!_1426)
    {
        float _1760 = -_1484;
        float _1762 = _1240 + _1760;
        _1518 = _1762;
    }
    float _1764 = _1518;
    float _1766 = fma(_1704, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1754);
    float _1768 = 1.0 / _1756;
    float _1770 = _1694 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    if (_1726)
    {
        float _1772 = float(_1137);
        _1472 = _1772;
    }
    float _1774 = _1472;
    float _1776 = fma(_339, _1394, _1758);
    float _1778 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1766);
    float _1780 = fma(_1704, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1770);
    float _1782 = log2(_1722);
    float _1784 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1780);
    float _1786 = fma(_341, _1658, _1776);
    float _1788 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1784);
    float _1790 = _1786 + _1666;
    float _1792 = _1770;
    if (_1726)
    {
        float _1794 = rint(_1774);
        float _1796 = precise::max(_1794, 0.0);
        uint _1798 = uint(_1796);
        uint _1800 = clamp(_1798, 0u, 65535u);
        _1792 = as_type<float>(_1800);
    }
    float _1802 = _1792;
    if (!_1426)
    {
        float _1804 = -_1738;
        float _1806 = _1182 + _1804;
        _1734 = _1806;
    }
    float _1808 = _1734;
    float _1810 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1778);
    float _1812 = _1788 * _1768;
    float _1814 = _1810 * _1768;
    float _1816 = fma(_1812, 0.5, 0.5);
    float _1818 = _1782 * 0.693147182464599609375;
    float _1820 = _1790 * _1500;
    float _1822 = fma(_1814, -0.5, 0.5);
    float _1824 = _1818 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1826 = _1670;
    if (_1726)
    {
        float3 _6090 = float3(_1678, _1670, float(as_type<int>(_1802)));
        float3 _6094 = select(_6090, float3(0.0), isnan(_6090));
        float _1828 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6094.xy, uint(rint(_6094.z)), _1820, level(0.0));
        _1826 = _1828;
    }
    float _1830 = _1826;
    float3 _6104 = float3(_1816, _1822, _1824);
    float _1832 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6104, float3(0.0), isnan(_6104)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6104, float3(0.0), isnan(_6104)), level(0.0)).x;
    float3 _6113 = float3(_1816, _1822, _1824);
    float4 _1835 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6113, float3(0.0), isnan(_6113)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6113, float3(0.0), isnan(_6113)), level(0.0)).xyzw;
    float _1837 = _1835.x;
    float _1839 = _1835.y;
    float _1841 = _1835.z;
    float _1843 = _1835.w;
    float _1845 = _1500;
    if (!_1426)
    {
        float _1847 = rint(_1752);
        float _1849 = precise::max(_1847, 0.0);
        uint _1851 = uint(_1849);
        uint _1853 = clamp(_1851, 0u, 65535u);
        _1845 = as_type<float>(_1853);
    }
    float _1855 = _1845;
    float _1857 = _1808;
    if (!_1426)
    {
        float3 _6152 = float3(_1764, _1808, float(as_type<int>(_1855)));
        float3 _6154 = select(_6152, float3(0.0), isnan(_6152));
        float _1859 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6154.xy, uint(rint(_6154.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6154.xy, uint(rint(_6154.z)), level(0.0)).x;
        _1857 = _1859;
    }
    float _1861 = _1857;
    float _1863 = float(uint(_683));
    float _1865 = trunc(_809);
    int _1867 = int(_1865);
    float _1869 = 1.0 / _1863;
    float _1871 = float(uint(_1867));
    int _1873 = as_type<int>(_1869) + (-2);
    float _1875 = as_type<float>(_1873) * _1871;
    float _1877 = trunc(_1875);
    float _1879 = precise::max(_1877, 0.0);
    uint _1881 = uint(_1879);
    int _1883 = ~_683;
    int _1885 = _1883 + 1;
    int _1887 = ~_683;
    int _1889 = _1887 + 1;
    int _1891 = _1885 * int(_1881);
    int _1893 = _1891 + _1867;
    float _1895 = float(uint(_1893));
    float _1897 = as_type<float>(_1873) * _1895;
    float _1899 = trunc(_1897);
    float _1901 = precise::max(_1899, 0.0);
    uint _1903 = uint(_1901);
    int _1905 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1907 = _1905 != 0;
    bool _1909 = !_1907;
    float _1911 = _1909 ? 7.345489978790283203125 : 1.0;
    float _1913 = _1897;
    if (_1426)
    {
        _1913 = 1.0;
    }
    float _1915 = _1913;
    float _1917 = _1911 * _171;
    int _1919 = int(_1881) + int(_1903);
    float _1921 = floor(_1917);
    int _1923 = _1889 * _1919;
    int _1925 = _1923 + _1867;
    bool _1927 = uint(_1925) >= uint(_683);
    bool _1929 = !_1927;
    int _1931 = _1929 ? 0 : (-1);
    float _1933 = -_1921;
    float _1935 = _1917 + _1933;
    int _1937 = ~_1919;
    int _1939 = _1937 + _1931;
    int _1941 = _1939 + 1;
    float _1943 = _1915;
    if (!_1426)
    {
        int _1945 = _1478 << 4;
        int _1947 = _1945 + 2048;
        uint _1949 = uint(int(uint(_1947) >> uint(2)));
        uint _1951 = uint(int(uint(int(_1949)) >> uint(2)));
        int _1953 = int(_1949) & 3;
        float _1955 = (*spvDescriptorSet0.vp_c15)._m0[int(_1951)][_1953];
        int _1957 = int(_1949) + 1;
        uint _1959 = uint(int(uint(_1957) >> uint(2)));
        int _1961 = _1957 & 3;
        float _1963 = (*spvDescriptorSet0.vp_c15)._m0[int(_1959)][_1961];
        int _1965 = _1947 + 8;
        uint _1967 = uint(int(uint(_1965) >> uint(2)));
        uint _1969 = uint(int(uint(int(_1967)) >> uint(2)));
        int _1971 = int(_1967) & 3;
        float _1973 = (*spvDescriptorSet0.vp_c15)._m0[int(_1969)][_1971];
        int _1975 = int(_1967) + 1;
        uint _1977 = uint(int(uint(_1975) >> uint(2)));
        int _1979 = _1975 & 3;
        float _1981 = (*spvDescriptorSet0.vp_c15)._m0[int(_1977)][_1979];
        float _1983 = _995 * _1963;
        float _1985 = fma(_339, _1955, _1983);
        float _1987 = fma(_341, _1973, _1985);
        float _1989 = _1987 + _1981;
        float _1991 = precise::clamp(_1989, 0.0, 1.0);
        float _1993 = -_1991;
        float _1995 = _1993 + _1861;
        float _1997 = fma(_1995, 500.0, 1.5);
        float _1999 = exp2(_1997);
        float _2001 = 0.0 + _1999;
        float _2003 = precise::clamp(_2001, 0.0, 1.0);
        _1943 = _2003;
    }
    float _2005 = _1943;
    float _2007 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2009 = _1644 + _2007;
    float _2011 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2013 = _1646 + _2011;
    float _2015 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2017 = _1648 + _2015;
    float _2019 = _2009 * _2009;
    float _2021 = fma(_2013, _2013, _2019);
    float _2023 = fma(_2017, _2017, _2021);
    float _2025 = rsqrt(_2023);
    float _2027 = sqrt(_2023);
    float _2029 = _2013 * _2025;
    float _2031 = _2017 * _2025;
    float _2033 = _2009 * _2025;
    float _2035 = _2029 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2037 = _2031 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2039 = _2035 * _2035;
    float _2041 = _2037 * _2037;
    float _2043 = _2039 + _2041;
    float _2045 = sqrt(_2043);
    bool _2047 = _2045 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2049 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2051 = _2045 + _2049;
    float _2053 = _1861;
    float _2055 = _2043;
    float _2057 = _2051;
    float _2059 = _2035;
    float _2061 = _2039;
    float _2063 = _2041;
    if (_2047)
    {
        float _2065 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2053 = _2065;
    }
    float _2067 = _2053;
    if (_2047)
    {
        float _2069 = rsqrt(_2043);
        _2055 = _2069;
    }
    float _2071 = _2055;
    if (_2047)
    {
        float _2073 = _2051 * _2067;
        _2057 = _2073;
    }
    float _2075 = _2057;
    if (_2047)
    {
        float _2077 = _2075 * 0.15915493667125701904296875;
        _1326 = _2077;
    }
    float _2079 = _1326;
    float _2081 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2083 = _1824;
    if (_2047)
    {
        float _2085 = _2079 * 6.283185482025146484375;
        float _2087 = sin(_2085);
        _2083 = _2087;
    }
    float _2089 = _2083;
    float _2091 = precise::max(0.0, _2081);
    float _2093 = _2075;
    float _2095 = _2091;
    if (_2047)
    {
        float _2097 = _2079 * 6.283185482025146484375;
        float _2099 = cos(_2097);
        _2093 = _2099;
    }
    float _2101 = _2093;
    float _2103 = -_2033;
    float _2105 = -_2091;
    float _2107 = fma(_2103, (*spvDescriptorSet0.vp_c15)._m0[24].y, _2105);
    float _2109 = _2107;
    if (_2047)
    {
        float _2111 = _2107 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2095 = _2111;
    }
    float _2113 = _2095;
    float _2115 = _2113;
    float _2117 = _2089;
    if (_2047)
    {
        float _2119 = fma(_2089, _2113, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2115 = _2119;
    }
    float _2121 = _2115;
    float _2123 = _2121;
    if (_2047)
    {
        float _2125 = _2071 * _2121;
        _2123 = _2125;
    }
    float _2127 = _2123;
    if (_2047)
    {
        float _2129 = _2101 + (-1.0);
        _2117 = _2129;
    }
    float _2131 = _2117;
    float _2133 = _2131;
    if (_2047)
    {
        float _2135 = _2035 * _2127;
        _2059 = _2135;
    }
    float _2137 = _2059;
    float _2139 = 0.0;
    if (_2047)
    {
        float _2141 = _2131 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2139 = _2141;
    }
    float _2143 = _2139;
    if (!_2047)
    {
        _2133 = _2037;
    }
    float _2145 = _2133;
    float _2147 = _2145;
    if (_2047)
    {
        float _2149 = _2037 * _2127;
        _2147 = _2149;
    }
    float _2151 = _2147;
    if (_2047)
    {
        float _2153 = _2137 * _2137;
        _2061 = _2153;
    }
    float _2155 = _2061;
    if (_2047)
    {
        float _2157 = fma(_2107, _2101, _2143);
        _2109 = _2157;
    }
    float _2159 = _2109;
    if (_2047)
    {
        float _2161 = _2151 * _2151;
        _2063 = _2161;
    }
    float _2163 = _2063;
    float _2165 = fma(_2159, _2159, _2155);
    float _2167 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2169 = fma(_2027, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2167);
    float _2171 = precise::clamp(_2169, 0.0, 1.0);
    float _2173 = _2165 + _2163;
    float _2175 = -_2171;
    float _2177 = _2175 + 1.0;
    float _2179 = rsqrt(_2173);
    float _2181 = abs(_2177);
    float _2183 = log2(_2181);
    float _2185 = _2179 * _2137;
    float _2187 = _2179 * _2159;
    float _2189 = _2179 * _2151;
    float _2191 = float(_1867);
    float _2193 = _2185 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2195 = _2187 + 1.0;
    bool _2197 = _2191 >= _779;
    bool _2199 = isnan(_2191);
    bool _2201 = _2197 || _2199;
    bool _2203 = isnan(_779);
    bool _2205 = _2201 || _2203;
    float _2207 = float(_2205);
    float _2209 = -_2193;
    float _2211 = fma(_2187, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2209);
    float _2213 = _2183 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2215 = -_2189;
    float _2217 = fma(_2215, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2211);
    float _2219 = trunc(_2207);
    int _2221 = int(_2219);
    float _2223 = fma(_2217, -0.5, 0.5);
    float _2225 = fma(_2217, 0.5, 0.5);
    float _2227 = exp2(_2213);
    float _2229 = fma(_2225, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2231 = fma(_2225, _2229, -0.212114393711090087890625);
    float _2233 = sqrt(_2223);
    float _2235 = fma(_2225, _2231, 1.570728778839111328125);
    float _2237 = -_2187;
    float _2239 = fma(_2227, _2195, _2237);
    float _2241 = 1.0 / _319;
    float _2243 = fma(_2239, 0.5, 0.5);
    float _2245 = _2233 * 0.636619746685028076171875;
    float _2247 = -_2235;
    float _2249 = fma(_2245, _2247, 1.0);
    float2 _6733 = float2(_2249, _2243);
    float3 _2253 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6733, float2(0.0), isnan(_6733)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6733, float2(0.0), isnan(_6733)), level(0.0)).xyz;
    float _2255 = _2253.x;
    float _2257 = _2253.y;
    float _2259 = _2253.z;
    int _2261 = _683 * _1941;
    int _2263 = _2261 + _1867;
    bool _2265 = _683 == 0;
    float _2267 = _1935 * _779;
    float _2269 = _807 * _2241;
    float _2271 = -_791;
    float _2273 = _2271 + 1.0;
    int _2275 = ~_2221;
    int _2277 = _2275 + 1;
    int _2279 = _2277 + 1;
    float _2281 = -_811;
    float _2283 = _2281 + 1.0;
    bool _2285 = !_2265;
    int _2287 = _2285 ? _2263 : (-1);
    float _2289 = trunc(_2267);
    int _2291 = int(_2289);
    int _2293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2295 = _2293 != 0;
    float _2297 = _2183 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2299 = _683 + (-1);
    int _2301 = _2287 * _2279;
    bool _2303 = !_2295;
    int _2305 = _2303 ? 0 : 1;
    float _2307 = -_359;
    float _2309 = _2307 + 1.0;
    int _2311 = abs(_693);
    float _2313 = trunc(_2269);
    int _2315 = int(_2313);
    int _2317 = _2221 * _2299;
    int _2319 = _2317 + _2301;
    int _2321 = abs(_2305);
    out.m_74.x = _1646;
    out.m_74.y = _1644;
    out.m_74.z = _1648;
    int _2323 = abs(_711);
    int _2325 = _2319 * _2311;
    int _2327 = abs(_717);
    int _2329 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2331 = _2329 != 0;
    float _2333 = exp2(_2297);
    bool _2335 = !_2331;
    int _2337 = _2335 ? 0 : 1;
    int _2339 = _2291 * _2321;
    int _2341 = _2339 + _1867;
    int _2343 = _2315 * _2323;
    int _2345 = _2343 + _2325;
    int _2347 = abs(_2337);
    int _2349 = ~_683;
    int _2351 = _2349 + 1;
    int _2353 = _2341 * _2327;
    int _2355 = _2353 + _2345;
    int _2357 = ~_683;
    int _2359 = _2357 + 1;
    bool _2361 = _171 > 0.5;
    int _2363 = _2291 * _2347;
    int _2365 = _2363 + _2355;
    int _2367 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2369 = _2367 != 0;
    float _2371 = -_2333;
    float _2373 = _2371 + 1.0;
    int _2375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2377 = _2375 != 0;
    float _2379 = float(uint(_2365));
    float _2381 = _2373 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2383 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2385 = _2383 != 0;
    int _2387 = ~_683;
    int _2389 = _2387 + 1;
    float _2391 = as_type<float>(_1873) * _2379;
    float _2393 = _2381 * _1832;
    float _2395 = trunc(_2391);
    float _2397 = precise::max(_2395, 0.0);
    uint _2399 = uint(_2397);
    int _2401 = _2351 * int(_2399);
    int _2403 = _2401 + _2365;
    float _2405 = float(uint(_2403));
    float _2407 = as_type<float>(_1873) * _2405;
    float _2409 = trunc(_2407);
    float _2411 = precise::max(_2409, 0.0);
    uint _2413 = uint(_2411);
    float _2415 = -_1031;
    int _2417 = _2361 ? as_type<int>(_2415) : as_type<int>(_1031);
    bool _2419 = !_2377;
    float _2421 = _2419 ? _1031 : as_type<float>(_2417);
    float _2423 = _1031 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2425 = int(_2399) + int(_2413);
    float _2427 = _2421 + 0.5;
    float _2429 = float(uint(_2341));
    int _2431 = _2359 * _2425;
    int _2433 = _2431 + _2365;
    float _2435 = fma(_2427, (*spvDescriptorSet0.vp_c9)._m0[80].x, _783);
    bool _2437 = uint(_2433) >= uint(_683);
    float _2439 = as_type<float>(_1873) * _2429;
    float _2441 = -_2273;
    float _2443 = fma(_2421, _2441, _2435);
    bool _2445 = !_2437;
    int _2447 = _2445 ? 0 : (-1);
    bool _2449 = _361 > 0.5;
    float _2451 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2453 = ~_2425;
    int _2455 = _2453 + _2447;
    int _2457 = _2455 + 1;
    float _2459 = trunc(_2439);
    float _2461 = precise::max(_2459, 0.0);
    uint _2463 = uint(_2461);
    float _2465 = -_1023;
    int _2467 = _2449 ? as_type<int>(_2465) : as_type<int>(_1023);
    float _2469 = _2451 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2471 = _683 * _2457;
    int _2473 = _2471 + _2365;
    int _2475 = ~_683;
    int _2477 = _2475 + 1;
    float _2479 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _2481 = !_2385;
    float _2483 = _2481 ? _1023 : as_type<float>(_2467);
    float _2485 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2487 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2489 = _2483 + (-0.5);
    int _2491 = _2389 * int(_2463);
    int _2493 = _2491 + _2341;
    float _2495 = _2485 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2497 = _2487 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2499 = float(uint(_2493));
    float _2501 = -_2489;
    float _2503 = -_785;
    float _2505 = fma(_2501, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2503);
    bool _2507 = !_2265;
    int _2509 = _2507 ? _2473 : (-1);
    out.m_76.x = _2469;
    out.m_76.y = _2495;
    out.m_76.z = _2497;
    out.m_76.w = _2479;
    float _2511 = abs(_1081);
    float _2513 = log2(_2511);
    float _2515 = as_type<float>(_1873) * _2499;
    int _2517 = _2509 >> 31;
    float _2519 = fma(_2483, _2283, _2505);
    int _2521 = _2517 & 3;
    out.m_78.x = _2443;
    out.m_78.y = _2519;
    int _2523 = _2509 & 3;
    bool _2525 = _2523 != 0;
    int _2527 = _2509 + _2521;
    float _2529 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2531 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2533 = _2527 >> 2;
    float _2535 = _2513 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2537 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2539 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2541 = _2533 << 4;
    int _2543 = _2541 + 368;
    float _2545 = trunc(_2515);
    float _2547 = precise::max(_2545, 0.0);
    uint _2549 = uint(_2547);
    float _2551 = _2531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2553 = _2537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    uint _2555 = uint(int(uint(_2543) >> uint(2)));
    uint _2557 = uint(int(uint(int(_2555)) >> uint(2)));
    int _2559 = int(_2555) & 3;
    float _2561 = (*spvDescriptorSet0.vp_c9)._m0[int(_2557)][_2559];
    int _2563 = int(_2555) + 1;
    uint _2565 = uint(int(uint(_2563) >> uint(2)));
    int _2567 = _2563 & 3;
    float _2569 = (*spvDescriptorSet0.vp_c9)._m0[int(_2565)][_2567];
    float _2571 = _2539 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2573 = _2509 & 3;
    bool _2575 = _2573 != 0;
    float _2577 = -_1067;
    float _2579 = fma(_2577, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2529);
    float _2581 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2583 = exp2(_2535);
    out.m_80.x = _2551;
    out.m_80.y = _2553;
    out.m_80.z = _2571;
    bool _2585 = uint(_2573) > 1u;
    float _2587 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2589 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2581);
    float _2591 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2593 = _1081 <= 8000.0;
    bool _2595 = isnan(_1081);
    bool _2597 = _2593 || _2595;
    bool _2599 = isnan(8000.0);
    bool _2601 = _2597 || _2599;
    float _2603 = float(_2601);
    int _2605 = int(_2463) + int(_2549);
    float _2607 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2609 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2611 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2589);
    int _2613 = _2543 + 8;
    uint _2615 = uint(int(uint(_2613) >> uint(2)));
    uint _2617 = uint(int(uint(int(_2615)) >> uint(2)));
    int _2619 = int(_2615) & 3;
    float _2621 = (*spvDescriptorSet0.vp_c9)._m0[int(_2617)][_2619];
    int _2623 = int(_2615) + 1;
    uint _2625 = uint(int(uint(_2623) >> uint(2)));
    int _2627 = _2623 & 3;
    float _2629 = (*spvDescriptorSet0.vp_c9)._m0[int(_2625)][_2627];
    float _2631 = -_1067;
    float _2633 = fma(_2631, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2607);
    int _2635 = _2525 ? 0 : 1;
    float _2637 = -_1067;
    float _2639 = fma(_2637, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2609);
    float _2641 = fma(_2583, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2643 = precise::clamp(_2641, 0.0, 1.0);
    float _2645 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2647 = ~_2635;
    int _2649 = _2647 + 1;
    int _2651 = _2649 + 1;
    float _2653 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2633);
    int _2655 = _2651;
    float _2657 = _2603;
    if (!_2585)
    {
        int _2659 = ~_2635;
        int _2661 = _2659 + 1;
        _2655 = _2661;
    }
    int _2663 = _2655;
    float _2665 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2579);
    bool _2667 = _2573 != 3;
    float _2669 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2639);
    bool _2671 = uint(_2573) >= 2u;
    float _2673 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2587);
    float _2675 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2645);
    int _2677 = abs(_2663);
    float _2679 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2681 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2683 = _2671 ? 0 : 1;
    float _2685 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2591);
    bool _2687 = !_2575;
    int _2689 = _2687 ? 0 : 1;
    float _2691 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2679);
    bool _2693 = _2573 != 3;
    int _2695 = _2477 * _2605;
    int _2697 = _2695 + _2341;
    int _2699 = ~_2677;
    int _2701 = _2699 + 1;
    int _2703 = _2701 + 1;
    float _2705 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2681);
    int _2707 = ~_2683;
    int _2709 = _2707 + 1;
    int _2711 = _2709 + 1;
    float _2713 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2675);
    int _2715 = _2711;
    if (_2667)
    {
        int _2717 = ~_2683;
        int _2719 = _2717 + 1;
        _2715 = _2719;
    }
    int _2721 = _2715;
    float _2723 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2673);
    int _2725 = abs(_2689);
    int _2727 = _2703 * as_type<int>(_2569);
    bool _2729 = !_2693;
    int _2731 = _2729 ? 0 : (-1);
    float _2733 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2685);
    int _2735 = abs(_2721);
    float _2737 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2691);
    bool _2739 = !_2369;
    int _2741 = _2739 ? 0 : 1;
    float _2743 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2705);
    bool _2745 = uint(_2697) >= uint(_683);
    int _2747 = abs(_2731);
    int _2749 = ~_2725;
    int _2751 = _2749 + 1;
    int _2753 = _2751 + 1;
    int _2755 = abs(_2741);
    bool _2757 = !_2745;
    int _2759 = _2757 ? 0 : (-1);
    int _2761 = _2753 * as_type<int>(_2561);
    int _2763 = _2761 + _2727;
    int _2765 = ~_2735;
    int _2767 = _2765 + 1;
    int _2769 = _2767 + 1;
    int _2771 = ~_2605;
    int _2773 = _2771 + _2759;
    int _2775 = _2773 + 1;
    int _2777 = _2769 * as_type<int>(_2621);
    int _2779 = _2777 + _2763;
    int _2781 = ~_2747;
    int _2783 = _2781 + 1;
    int _2785 = _2783 + 1;
    float _2787 = _1023 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2789 = ~_2755;
    int _2791 = _2789 + 1;
    int _2793 = _2791 + 1;
    int _2795 = _683 * _2775;
    int _2797 = _2795 + _2341;
    int _2799 = _2785 * as_type<int>(_2629);
    int _2801 = _2799 + _2779;
    float _2803 = _2787 * _2665;
    float _2805 = _2787 * _2669;
    int _2807 = _2801 * _2793;
    bool _2809 = !_2265;
    int _2811 = _2809 ? _2797 : (-1);
    float _2813 = _2787 * _2653;
    float _2815 = fma(_2643, -2.0, 3.0);
    float _2817 = _2643 * _2643;
    float _2819 = fma(_2423, _2713, _2805);
    int _2821 = _2811 * _2755;
    int _2823 = _2821 + _2807;
    float _2825 = _1694 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2827 = _2817 * _2815;
    float _2829 = fma(_2423, _2723, _2803);
    float _2831 = _2743 + _2819;
    float _2833 = fma(_1704, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2825);
    float _2835 = -_2827;
    float _2837 = _2835 + 1.0;
    float _2839 = float(_2823);
    float _2841 = fma(_2423, _2611, _2813);
    float _2843 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2833);
    float _2845 = fma(_2837, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2827);
    float _2847 = _1843 * _2393;
    float _2849 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2843);
    float _2851 = _2603 * _2845;
    float _2853 = _2839;
    if (!_1726)
    {
        _2657 = 1.0;
    }
    float _2855 = _2657;
    float _2857 = _2737 + _2841;
    float _2859 = _2849 + _1756;
    float _2861 = _2851 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2863 = _2855;
    float _2865 = _2861;
    if (_1726)
    {
        bool _2867 = _1830 >= _1820;
        bool _2869 = isnan(_1830);
        bool _2871 = _2867 || _2869;
        bool _2873 = isnan(_1820);
        bool _2875 = _2871 || _2873;
        float _2877 = float(_2875);
        _2863 = _2877;
    }
    float _2879 = _2863;
    float _2881 = _2733 + _2829;
    float _2883 = _2859 * 0.5;
    float _2885 = _2309 * _2861;
    float _2887 = precise::clamp(_2885, 0.0, 1.0);
    float _2889 = _2879 * _2005;
    out.m_82.x = _2857;
    out.m_82.y = _2881;
    out.m_82.z = _2831;
    float _2891 = -_2887;
    float _2893 = fma(_2891, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    bool _2895 = _2027 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2897 = isnan(_2027);
    bool _2899 = _2895 || _2897;
    bool _2901 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2903 = _2899 || _2901;
    out.m_84.z = _2883;
    out.m_84.w = _1756;
    float _2905 = -_2889;
    float _2907 = fma(_2905, _2893, 1.0);
    float _2909 = precise::clamp(_2907, 0.0, 1.0);
    out.gl_Position.x = _1788;
    out.gl_Position.y = _1810;
    out.gl_Position.z = _2849;
    out.gl_Position.w = _1756;
    float _2911 = _2259 * _2393;
    float _2913 = fma(_2255, _2847, _1837);
    float _2915 = fma(_2257, _2847, _1839);
    float _2917 = -_2381;
    float _2919 = _2917 + 1.0;
    float _2921 = _2909 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2923 = fma(_1843, _2911, _1841);
    out.m_86.x = _2839;
    float _2925 = _1843 * _2919;
    float _2927 = _2919;
    float _2929 = _2889;
    float _2931 = _2887;
    float _2933 = _2909;
    if (!_2903)
    {
        _2865 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2935 = _2865;
    out.m_88.x = _2921;
    float _2937 = _2935;
    float _2939 = _2935;
    if (!_2903)
    {
        _2927 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2941 = _2927;
    float _2943 = _2941;
    float _2945 = _2941;
    if (!_2903)
    {
        _2929 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2947 = _2929;
    out.m_90.x = _2913;
    out.m_90.y = _2915;
    out.m_90.z = _2923;
    out.m_90.w = _2925;
    float _2949 = _2947;
    float _2951 = _2947;
    if (!_2903)
    {
        _2853 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2953 = _2853;
    float _2955 = _2953;
    float _2957 = _2953;
    if (!_2903)
    {
        _2931 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2959 = _2931;
    float _2961 = _2959;
    float _2963 = _2959;
    if (!_2903)
    {
        _2933 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2965 = _2933;
    bool _2967 = !_2903;
    float _2969 = _2965;
    float _2971 = _2965;
    if (!_2967)
    {
        bool _2973 = _2027 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2975 = isnan(_2027);
        bool _2977 = _2973 || _2975;
        bool _2979 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2981 = _2977 || _2979;
        if (!_2981)
        {
            float _2983 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2985 = _2027 + _2983;
            float _2987 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2989 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2987;
            float _2991 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2993 = _2991 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2995 = 1.0 / _2989;
            float _2997 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2999 = _2997 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3001 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3003 = _3001 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3005 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3007 = _3005 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3009 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3011 = _3009 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3013 = _2985 * _2995;
            float _3015 = precise::clamp(_3013, 0.0, 1.0);
            float _3017 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3019 = _3017 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3021 = fma(_3015, _2993, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3023 = fma(_3015, _3019, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3025 = fma(_3015, _2999, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3027 = fma(_3015, _3003, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3029 = fma(_3015, _3007, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3031 = fma(_3015, _3011, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2945 = _3025;
            _2963 = _3029;
            _2939 = _3021;
            _2951 = _3027;
            _2957 = _3023;
            _2971 = _3031;
            _3033 = true;
        }
        else
        {
            bool _3035 = _2027 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3037 = isnan(_2027);
            bool _3039 = _3035 || _3037;
            bool _3041 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3043 = _3039 || _3041;
            if (!_3043)
            {
                _2937 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3045 = _2937;
            _2939 = _3045;
            if (!_3043)
            {
                _2943 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3047 = _2943;
            _2945 = _3047;
            if (!_3043)
            {
                _2955 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3049 = _2955;
            _2957 = _3049;
            if (!_3043)
            {
                _2949 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3051 = _2949;
            _2951 = _3051;
            if (!_3043)
            {
                _2961 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3053 = _2961;
            _2963 = _3053;
            if (!_3043)
            {
                _2969 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3055 = _2969;
            bool _3057 = !_3043;
            _2971 = _3055;
            if (!_3057)
            {
                bool _3059 = _2027 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3061 = isnan(_2027);
                bool _3063 = _3059 || _3061;
                bool _3065 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3067 = _3063 || _3065;
                if (!_3067)
                {
                    float _3069 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3071 = _2027 + _3069;
                    float _3073 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3075 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3073;
                    float _3077 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3079 = _3077 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3081 = 1.0 / _3075;
                    float _3083 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3085 = _3083 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3087 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3089 = _3087 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3091 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3093 = _3091 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3095 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3097 = _3095 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3099 = _3071 * _3081;
                    float _3101 = precise::clamp(_3099, 0.0, 1.0);
                    float _3103 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3105 = _3103 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3107 = fma(_3101, _3079, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3109 = fma(_3101, _3105, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3111 = fma(_3101, _3085, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3113 = fma(_3101, _3089, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3115 = fma(_3101, _3093, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3117 = fma(_3101, _3097, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2945 = _3111;
                    _2963 = _3115;
                    _2939 = _3107;
                    _2951 = _3113;
                    _2957 = _3109;
                    _2971 = _3117;
                    _3033 = true;
                }
                else
                {
                    _2945 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2963 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2939 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2951 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2957 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2971 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3033 = false;
    float _3119 = _2945;
    float _3121 = _2963;
    float _3123 = _2939;
    float _3125 = _2951;
    float _3127 = _2957;
    float _3129 = _2971;
    float _3131 = fma(_2881, -0.5, 0.5);
    float _3133 = precise::clamp(_3131, 0.0, 1.0);
    float _3135 = -_3119;
    float _3137 = _3135 + _3121;
    float _3139 = -_3123;
    float _3141 = _3139 + _3125;
    float _3143 = -_3127;
    float _3145 = _3143 + _3129;
    bool _3147 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3149 = fma(_3133, _3137, _3119);
    float _3151 = fma(_3133, _3141, _3123);
    float _3153 = fma(_3133, _3145, _3127);
    float _3155 = _3149 * 0.586610972881317138671875;
    out.m_92.x = 0.0;
    float _3157 = fma(_3151, 0.298911988735198974609375, _3155);
    float _3159 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3161 = fma(_3153, 0.114477999508380889892578125, _3157);
    out.m_59.x = _3159;
    float _3163 = -_3161;
    float _3165 = _3151 + _3163;
    float _3167 = -_3161;
    float _3169 = _3149 + _3167;
    float _3171 = -_3161;
    float _3173 = _3153 + _3171;
    out.m_94.x = 0.0;
    float _3175 = fma(_3165, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3161);
    float _3177 = fma(_3169, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3161);
    float _3179 = fma(_3173, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3161);
    out.m_96.x = _3175;
    out.m_96.y = _3177;
    out.m_96.z = _3179;
    if (!_3147)
    {
        return out;
    }
    float _3181 = -_1644;
    float _3183 = _3181 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3185 = -_1646;
    float _3187 = _3185 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3189 = -_1648;
    float _3191 = _3189 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3193 = _3183 * _3183;
    float _3195 = fma(_3187, _3187, _3193);
    float _3197 = fma(_3191, _3191, _3195);
    float _3199 = rsqrt(_3197);
    float _3201 = sqrt(_3197);
    float _3203 = _3183 * _3199;
    float _3205 = _3187 * _3199;
    float _3207 = _3191 * _3199;
    float _3209 = -_2033;
    float _3211 = _3209 + _3203;
    float _3213 = -_2029;
    float _3215 = _3213 + _3205;
    float _3217 = -_2031;
    float _3219 = _3217 + _3207;
    float _3221 = _3211 * _3211;
    float _3223 = -_3201;
    float _3225 = _3223 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3227 = fma(_3215, _3215, _3221);
    float _3229 = _3225 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3231 = precise::clamp(_3229, 0.0, 1.0);
    float _3233 = fma(_3219, _3219, _3227);
    float _3235 = abs(_3231);
    float _3237 = log2(_3235);
    float _3239 = rsqrt(_3233);
    float _3241 = _3237 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3243 = exp2(_3241);
    float _3245 = _3211 * _3239;
    float _3247 = _3215 * _3239;
    float _3249 = _3219 * _3239;
    float _3251 = _2881 * _3245;
    float _3253 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _3255 = precise::clamp(_3253, 0.0, 1.0);
    float _3257 = _2881 * _3203;
    float _3259 = fma(_2857, _3247, _3251);
    float _3261 = _3255 * _3255;
    float _3263 = fma(_2857, _3205, _3257);
    float _3265 = fma(_2831, _3249, _3259);
    float _3267 = precise::clamp(_3265, 0.0, 1.0);
    float _3269 = _3261 + (-1.0);
    float _3271 = fma(_2831, _3207, _3263);
    float _3273 = precise::clamp(_3271, 0.0, 1.0);
    float _3275 = _3267 * _3267;
    float _3277 = _3205 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3279 = fma(_3275, _3269, 1.0);
    float _3281 = -_3203;
    float _3283 = -_3277;
    float _3285 = fma(_3281, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3283);
    float _3287 = _3279 * _3279;
    float _3289 = -_3207;
    float _3291 = fma(_3289, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3285);
    float _3293 = 1.0 / _3287;
    float _3295 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3297 = _3291 + _3295;
    float _3299 = _3297 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3301 = precise::clamp(_3299, 0.0, 1.0);
    float _3303 = _3243 * _3301;
    float _3305 = _3273 * _3303;
    float _3307 = _3261 * _3293;
    float _3309 = _3305 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3311 = _3305 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _3313 = _3305 * _3307;
    float _3315 = _3305 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3317 = _3313 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3319 = _3313 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3321 = _3313 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_92.x = _3315;
    out.m_92.y = _3309;
    out.m_92.z = _3311;
    out.m_94.x = _3317;
    out.m_94.y = _3319;
    out.m_94.z = _3321;
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
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3033 = false;
    bool _309 = false;
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
        float _3378 = as_type<float>(_131);
        out.gl_Position.z = _3378;
    }
    if (!_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _153 = _149;
    if (_145)
    {
        float _155 = float(_115);
        _151 = _155;
    }
    float _157 = _151;
    bool _159 = _149 >= _157;
    bool _161 = !_145;
    bool _163 = _159 || _161;
    if (_163)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _125;
    if (_163)
    {
        out.m_59.x = 0.0;
    }
    if (_163)
    {
        float _167 = _165 * 5.0;
        _133 = as_type<int>(_167);
    }
    int _169 = _133;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3447 = as_type<float>(_169);
        out.gl_Position.z = _3447;
    }
    if (_163)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _171 = in.m_63.x;
    float _173 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _175 = _149 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _177 = in.m_65.x;
    float _179 = in.m_65.y;
    float _181 = in.m_65.z;
    float _183 = _175 * _173;
    float _185 = fma(_171, (*spvDescriptorSet0.vp_c9)._m0[20].x, _183);
    float _187 = floor(_185);
    int _189 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _191 = _189 != 0;
    float _193 = _185 * 6.283185482025146484375;
    float _195 = _179 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _197 = _179 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _199 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _201 = _199 != 0;
    int _203 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _205 = _203 != 0;
    float _207 = _193 * 0.15915493667125701904296875;
    float _209 = _179 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _211 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[4].x, _195);
    float _213 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[5].x, _197);
    bool _215 = !_201;
    int _217 = _215 ? 0 : 1;
    float _219 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[6].x, _209);
    float _221 = _207 * 6.283185482025146484375;
    float _223 = cos(_221);
    bool _225 = !_205;
    int _227 = _225 ? 0 : 1;
    float _229 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[4].z, _211);
    int _231 = abs(_217);
    float _233 = -_187;
    float _235 = _185 + _233;
    bool _237 = !_191;
    int _239 = _237 ? 0 : 1;
    float _241 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[5].z, _213);
    float _243 = -_235;
    float _245 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _247 = abs(_239);
    float _249 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[6].z, _219);
    float _251 = float(_231);
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _255 = abs(_227);
    float _257 = fma(_223, 0.5, 0.5);
    float _259 = abs(_245);
    float _261 = _251 * _259;
    bool _263 = _235 < 0.5;
    float _265 = float(_263);
    float _267 = -_257;
    float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _271 = float(_247);
    float _273 = -_265;
    float _275 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _277 = float(_255);
    float _279 = fma(_271, _269, _261);
    float _281 = abs(_275);
    float _283 = fma(_277, _281, _279);
    bool _285 = !_253;
    float _287 = _249;
    float _305;
    float _307;
    if (!_285)
    {
        float _289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _291 = _171 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _293 = float(_115);
        float _295 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _297 = _295 * _289;
        float _299 = floor(_297);
        float _301 = -_299;
        float _303 = _297 + _301;
        _305 = _303;
        _307 = _293;
        _309 = true;
    }
    else
    {
        float _311 = float(_115);
        float _313 = 1.0 / _311;
        float _315 = _149 * _313;
        _305 = _315;
        _307 = _311;
    }
    _309 = false;
    float _317 = _305;
    float _319 = _307;
    float _321 = in.m_56.x;
    float _323 = in.m_56.y;
    float _325 = in.m_56.z;
    float _327 = _323 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _329 = _323 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _331 = fma(_321, (*spvDescriptorSet0.vp_c10)._m0[4].x, _327);
    float _333 = fma(_321, (*spvDescriptorSet0.vp_c10)._m0[6].x, _329);
    float _335 = fma(_325, (*spvDescriptorSet0.vp_c10)._m0[4].z, _331);
    float _337 = fma(_325, (*spvDescriptorSet0.vp_c10)._m0[6].z, _333);
    float _339 = _335 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _341 = _337 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _343 = fma(_339, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _345 = fma(_341, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _347 = floor(_343);
    float _349 = floor(_345);
    float _351 = -_347;
    float _353 = _343 + _351;
    float _355 = -_349;
    float _357 = _345 + _355;
    float2 _3746 = float2(_353, _357);
    float _359 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3746, float2(0.0), isnan(_3746)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3746, float2(0.0), isnan(_3746)), level(0.0)).x;
    float _361 = in.m_63.y;
    float _363 = _171 * 2.0;
    float _365 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _367 = log2(_365);
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _371 = _317 + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _381;
    float _385 = _171 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _387 = floor(_363);
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _393 = _317 + _391;
    float _395 = -_389;
    float _397 = fma(_385, 2.0, _395);
    float _399 = 1.0 / _375;
    float _401 = in.m_63.z;
    float _403 = 1.0 / _379;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _407 = _317 + _405;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _413 = _387 > 0.0;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _417 = _387 >= 0.0;
    bool _419 = isnan(_387);
    bool _421 = _417 || _419;
    bool _423 = isnan(0.0);
    bool _425 = _421 || _423;
    float _427 = _361 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _429 = 1.0 / _383;
    float _431 = _323 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _433;
    float _437 = _407 * _399;
    int _439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _441 = _439 != 0;
    int _443 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _445 = _443 != 0;
    int _447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _449 = _447 != 0;
    float _451 = fma(_321, (*spvDescriptorSet0.vp_c10)._m0[5].x, _431);
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _455 = _317 + _453;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _459 = _317 + _457;
    float _461 = 1.0 / _411;
    float _463 = _361 * 2.0;
    float _465 = _171 + _401;
    float _467 = _455 * _403;
    float _469 = _171 + _361;
    float _471 = _465 + (-1.0);
    float _473 = fma(_325, (*spvDescriptorSet0.vp_c10)._m0[5].z, _451);
    float _475 = floor(_463);
    float _477 = _469 + (-1.0);
    float _479 = fma(_427, -2.0, _415);
    float _481 = _371 * _429;
    int _483 = _425 ? 0 : 1;
    float _485 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _487 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _489 = isnan(_317);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _495 = _491 || _493;
    float _497 = float(_495);
    float _499 = 1.0 / _435;
    float _501 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _503;
    float _507 = _393 * _461;
    float _509 = -_497;
    float _511 = _509 + 1.0;
    float _513 = _401 * 2.0;
    float _515 = fma(_505, _437, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _517 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _519 = isnan(_317);
    bool _521 = _517 || _519;
    bool _523 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _525 = _521 || _523;
    float _527 = float(_525);
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _531 = _529 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _533 = _361 + _401;
    bool _535 = _475 > 0.0;
    float _537 = floor(_513);
    bool _539 = _475 >= 0.0;
    bool _541 = isnan(_475);
    bool _543 = _539 || _541;
    bool _545 = isnan(0.0);
    bool _547 = _543 || _545;
    float _549 = _533 + (-1.0);
    bool _551 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _553 = isnan(_317);
    bool _555 = _551 || _553;
    bool _557 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _559 = _555 || _557;
    float _561 = float(_559);
    float _563 = -_527;
    float _565 = _563 + 1.0;
    float _567 = _459 * _499;
    float _569 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _571;
    float _575 = _561 * _511;
    float _577 = -_561;
    float _579 = _577 + 1.0;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _583 = _581 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _585 = fma(_573, _437, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _587 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _589 = isnan(_317);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _595 = _591 || _593;
    float _597 = float(_595);
    float _599 = _527 * _579;
    bool _601 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _603 = isnan(_317);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = fma(_531, _467, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _615 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _617 = isnan(_317);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = _597 * _565;
    float _629 = -_597;
    float _631 = _629 + 1.0;
    float _633 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _635 = int(_633);
    bool _637 = _537 >= 0.0;
    bool _639 = isnan(_537);
    bool _641 = _637 || _639;
    bool _643 = isnan(0.0);
    bool _645 = _641 || _643;
    float _647 = -_625;
    float _649 = _647 + 1.0;
    float _651 = _625 * _631;
    float _653 = _367 * _149;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _655;
    float _659 = _611 * _649;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _663 = _661 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _665 = exp2(_653);
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _667;
    float _671 = fma(_657, _481, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _673 = _515 * _659;
    float _675 = _585 * _659;
    float _677 = fma(_583, _467, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _679 = fma(_669, _481, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _681 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _683 = int(_681);
    float _685 = fma(_663, _507, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _687 = float(_635);
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _691 = !_445;
    int _693 = _691 ? 0 : 1;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _697 = 1.0 + _695;
    int _699 = ~_483;
    int _701 = _699 + 1;
    int _703 = _701 + 1;
    float _705 = -_665;
    float _707 = _705 + 1.0;
    bool _709 = !_441;
    int _711 = _709 ? 0 : 1;
    float _713 = 1.0 / _687;
    bool _715 = !_449;
    int _717 = _715 ? 0 : 1;
    float _719 = _473 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _721 = _703;
    if (!_413)
    {
        int _723 = ~_483;
        int _725 = _723 + 1;
        _721 = _725;
    }
    int _727 = _721;
    float _729 = fma(_171, (*spvDescriptorSet0.vp_c9)._m0[78].z, _689);
    int _731 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _733 = _731 != 0;
    int _735 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _737 = _735 != 0;
    int _739 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _741 = _739 != 0;
    float _743 = _719 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _745 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _747 = isnan(0.0);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _753 = _749 || _751;
    float _755 = 1.0 / _697;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _759 = _757 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _761 = _753 ? _707 : 0.0;
    float _763 = fma(_339, (*spvDescriptorSet0.vp_c8)._m0[11].x, _743);
    bool _765 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _767 = isnan(1.0);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _773 = _769 || _771;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _777 = fma(_759, _507, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _779 = float(_683);
    float _781 = -_149;
    float _783 = fma(_781, (*spvDescriptorSet0.vp_c9)._m0[76].x, _397);
    float _785 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _479);
    float _787 = _719 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _789 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[78].w, _775);
    float _791 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _729);
    float _793 = fma(_341, (*spvDescriptorSet0.vp_c8)._m0[11].z, _763);
    bool _795 = !_737;
    int _797 = _795 ? 0 : 1;
    float _799 = -_611;
    float _801 = _799 + 1.0;
    int _803 = _547 ? 0 : 1;
    float _805 = fma(_339, (*spvDescriptorSet0.vp_c8)._m0[10].x, _787);
    float _807 = _779 * _149;
    float _809 = _713 * _149;
    float _811 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _789);
    float _813 = _793 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    if (_773)
    {
        float _815 = _761 * _755;
        _153 = _815;
    }
    float _817 = _153;
    int _819 = abs(_797);
    float _821 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[143].x, _673);
    int _823 = ~_803;
    int _825 = _823 + 1;
    int _827 = _825 + 1;
    float _829 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[143].y, _675);
    bool _831 = _537 > 0.0;
    float _833 = in.m_67.x;
    float _835 = in.m_67.y;
    float _837 = in.m_67.z;
    int _839 = _827;
    if (!_535)
    {
        int _841 = ~_803;
        int _843 = _841 + 1;
        _839 = _843;
    }
    int _845 = _839;
    float _847 = fma(_341, (*spvDescriptorSet0.vp_c8)._m0[10].z, _805);
    float _849 = float(_727);
    float _851 = 1.0 / _813;
    float _853 = float(_819);
    float _855 = _847 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _857 = !_733;
    int _859 = _857 ? 0 : 1;
    float _861 = fma(_613, _651, _821);
    int _863 = _645 ? 0 : 1;
    float _865 = _853 * _849;
    bool _867 = !_741;
    int _869 = _867 ? 0 : 1;
    float _871 = _855 + _813;
    int _873 = abs(_859);
    float _875 = _865 * (-2.0);
    int _877 = ~_863;
    int _879 = _877 + 1;
    int _881 = _879 + 1;
    float _883 = _401 + (-0.5);
    int _885 = _881;
    if (!_831)
    {
        int _887 = ~_863;
        int _889 = _887 + 1;
        _885 = _889;
    }
    int _891 = _885;
    float _893 = fma(_677, _651, _829);
    int _895 = abs(_869);
    float _897 = _871 * _851;
    float _899 = _897 * 0.5;
    float _901 = _361 + (-0.5);
    float _903 = float(_891);
    float _905 = fma(_875, _835, _835);
    float _907 = float(_873);
    float _909 = fma(_671, _627, _861);
    float _911 = float(_895);
    float _913 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[196].y, _905);
    float _915 = float(_845);
    float _917 = _907 * _903;
    float _919 = fma(_569, _875, _569);
    float _921 = fma(_679, _627, _893);
    float _923 = _917 * (-2.0);
    float _925 = _911 * _915;
    float _927 = fma(_919, _817, _913);
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _929;
    float _933 = fma(_501, _923, _501);
    float _935 = fma(_923, _833, _833);
    float _937 = _171 + (-0.5);
    float _939 = _925 * (-2.0);
    float _941 = _927 * 0.15915493667125701904296875;
    float _943 = fma(_685, _599, _909);
    float _945 = fma(_937, (*spvDescriptorSet0.vp_c9)._m0[196].x, _935);
    float _947 = fma(_939, _837, _837);
    float _949 = as_type<float>(int(gl_VertexIndex));
    float _951 = fma(_485, _939, _485);
    float _953 = fma(_933, _817, _945);
    float _955 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[196].z, _947);
    float _957 = in.m_72.x;
    float _959 = in.m_72.y;
    float _961 = fma(_777, _599, _921);
    float _963 = fma(_951, _817, _955);
    float _965 = _953 * 0.15915493667125701904296875;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _967;
    float _971 = _963 * 0.15915493667125701904296875;
    float _973 = _941 * 6.283185482025146484375;
    float _975 = sin(_973);
    float _977 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _979 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[30].w, _977);
    float _981 = fma(_969, _567, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _983 = fma(_931, _567, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _985 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _987 = fma(_981, _575, _943);
    float _989 = fma(_983, _575, _961);
    float _991 = _941 * 6.283185482025146484375;
    float _993 = cos(_991);
    float _995 = _719 + _985;
    float _997 = fma(_497, (*spvDescriptorSet0.vp_c9)._m0[148].x, _987);
    float _999 = fma(_497, (*spvDescriptorSet0.vp_c9)._m0[148].y, _989);
    int _1001 = as_type<int>(_949) & 1;
    bool _1003 = _1001 != 0;
    int _1005 = as_type<int>(_949) & 2;
    bool _1007 = _1005 != 0;
    float _1009 = _995 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1011 = _995 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1013 = _965 * 6.283185482025146484375;
    float _1015 = sin(_1013);
    float _1017 = _999 * _959;
    float _1019 = _997 * _957;
    bool _1021 = !_1007;
    float _1023 = _1021 ? (-0.5) : 0.5;
    float _1025 = fma(_339, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1009);
    float _1027 = _283 * _1017;
    bool _1029 = !_1003;
    float _1031 = _1029 ? (-0.5) : 0.5;
    float _1033 = _283 * _1019;
    float _1035 = _971 * 6.283185482025146484375;
    float _1037 = cos(_1035);
    float _1039 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1023);
    float _1041 = _1027 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1043 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1031);
    float _1045 = _1033 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1047 = fma(_339, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1011);
    float _1049 = _1041 * _1039;
    float _1051 = _965 * 6.283185482025146484375;
    float _1053 = cos(_1051);
    float _1055 = _1015 * _975;
    float _1057 = _1045 * _1043;
    float _1059 = _1015 * _993;
    float _1061 = 1.0 / _979;
    float _1063 = _1015 * _1037;
    float _1065 = _971 * 6.283185482025146484375;
    float _1067 = sin(_1065);
    float _1069 = _1053 * _993;
    float _1071 = _1053 * _1037;
    float _1073 = _1053 * _975;
    float _1075 = _993 * _1037;
    float _1077 = _975 * _1037;
    float _1079 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1081 = _1061 * _1079;
    float _1083 = _1071 * _1049;
    bool _1085 = _1081 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1087 = _1081 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1089 = fma(_1067, _1069, _1055);
    float _1091 = fma(_1067, _1055, _1069);
    float _1093 = -_1073;
    float _1095 = fma(_1067, _1059, _1093);
    float _1097 = -_1059;
    float _1099 = fma(_1067, _1073, _1097);
    float _1101 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1103 = -_1049;
    float _1105 = _1067 * _1103;
    float _1107 = fma(_1089, _1057, _1083);
    float _1109 = _1063 * _1049;
    float _1111 = fma(_1075, _1057, _1105);
    float _1113 = fma(_1099, _1101, _1107);
    float _1115 = fma(_1095, _1057, _1109);
    int _1117 = 2;
    if (!_1085)
    {
        _1117 = 1;
    }
    int _1119 = _1117;
    float _1121 = fma(_1077, _1101, _1111);
    float _1123 = _1113 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1125 = fma(_1091, _1101, _1115);
    bool _1127 = !_1085;
    int _1129 = _1127 ? 0 : 1;
    float _1131 = _1113 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1133 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1123);
    int _1135 = _1119;
    if (!_1087)
    {
        _1135 = _1129;
    }
    int _1137 = _1135;
    float _1139 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1131);
    float _1141 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1133);
    int _1143 = _1137 << 6;
    float _1145 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1139);
    float _1147 = _1141 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _1149 = _1143 + 48;
    uint _1152 = uint(int(uint(_1149) >> uint(2)));
    uint _1154 = uint(int(uint(int(_1152)) >> uint(2)));
    int _1156 = int(_1152) & 3;
    float _1158 = (*spvDescriptorSet0.vp_c15)._m0[int(_1154)][_1156];
    int _1160 = int(_1152) + 1;
    uint _1162 = uint(int(uint(_1160) >> uint(2)));
    int _1164 = _1160 & 3;
    float _1166 = (*spvDescriptorSet0.vp_c15)._m0[int(_1162)][_1164];
    float _1168 = _1145 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1170 = _341 + _1147;
    float _1172 = fma(_341, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1047);
    float _1174 = _1113 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1176 = _339 + _1168;
    float _1178 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1180 = _1170 + _1178;
    float _1182 = _1172 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1184 = _1143 + 56;
    uint _1186 = uint(int(uint(_1184) >> uint(2)));
    uint _1188 = uint(int(uint(int(_1186)) >> uint(2)));
    int _1190 = int(_1186) & 3;
    float _1192 = (*spvDescriptorSet0.vp_c15)._m0[int(_1188)][_1190];
    int _1194 = int(_1186) + 1;
    uint _1196 = uint(int(uint(_1194) >> uint(2)));
    int _1198 = _1194 & 3;
    float _1200 = (*spvDescriptorSet0.vp_c15)._m0[int(_1196)][_1198];
    float _1202 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1204 = _1176 + _1202;
    float _1206 = _1180 * _1180;
    float _1208 = trunc(_1182);
    int _1210 = int(_1208);
    float _1212 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1174);
    float _1214 = fma(_1204, _1204, _1206);
    float _1216 = fma(_341, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1025);
    int _1218 = _1143 + 64;
    uint _1220 = uint(int(uint(_1218) >> uint(2)));
    uint _1222 = uint(int(uint(int(_1220)) >> uint(2)));
    int _1224 = int(_1220) & 3;
    float _1226 = (*spvDescriptorSet0.vp_c15)._m0[int(_1222)][_1224];
    int _1228 = int(_1220) + 1;
    uint _1230 = uint(int(uint(_1228) >> uint(2)));
    int _1232 = _1228 & 3;
    float _1234 = (*spvDescriptorSet0.vp_c15)._m0[int(_1230)][_1232];
    float _1236 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1212);
    float _1238 = sqrt(_1214);
    float _1240 = _1216 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1242 = _1236 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1244 = _1143 + 72;
    uint _1246 = uint(int(uint(_1244) >> uint(2)));
    uint _1248 = uint(int(uint(int(_1246)) >> uint(2)));
    int _1250 = int(_1246) & 3;
    float _1252 = (*spvDescriptorSet0.vp_c15)._m0[int(_1248)][_1250];
    int _1254 = int(_1246) + 1;
    uint _1256 = uint(int(uint(_1254) >> uint(2)));
    int _1258 = _1254 & 3;
    float _1260 = (*spvDescriptorSet0.vp_c15)._m0[int(_1256)][_1258];
    float _1262 = _719 + _1242;
    float _1264 = trunc(_1240);
    int _1266 = int(_1264);
    int _1268 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1270 = _1210 + _1268;
    int _1272 = _1270 + 1;
    int _1274 = _1143 + 96;
    uint _1276 = uint(int(uint(_1274) >> uint(2)));
    uint _1278 = uint(int(uint(int(_1276)) >> uint(2)));
    int _1280 = int(_1276) & 3;
    float _1282 = (*spvDescriptorSet0.vp_c15)._m0[int(_1278)][_1280];
    int _1284 = int(_1276) + 1;
    uint _1286 = uint(int(uint(_1284) >> uint(2)));
    int _1288 = _1284 & 3;
    float _1290 = (*spvDescriptorSet0.vp_c15)._m0[int(_1286)][_1288];
    bool _1292 = _1238 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1294 = _1143 + 104;
    uint _1296 = uint(int(uint(_1294) >> uint(2)));
    uint _1298 = uint(int(uint(int(_1296)) >> uint(2)));
    int _1300 = int(_1296) & 3;
    float _1302 = (*spvDescriptorSet0.vp_c15)._m0[int(_1298)][_1300];
    int _1304 = int(_1296) + 1;
    uint _1306 = uint(int(uint(_1304) >> uint(2)));
    int _1308 = _1304 & 3;
    float _1310 = (*spvDescriptorSet0.vp_c15)._m0[int(_1306)][_1308];
    int _1312 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1314 = _1266 + _1312;
    int _1316 = _1314 + 1;
    float _1318 = _1242;
    float _1320 = _1262;
    float _1322 = _1170;
    int _1324 = _1272;
    float _1326 = as_type<float>(_1316);
    if (!_1292)
    {
        _1318 = _1176;
    }
    float _1328 = _1318;
    bool _1330 = !_1292;
    float _1332 = _1328;
    int _1334 = as_type<int>(_1290);
    int _1336 = as_type<int>(_1192);
    if (!_1330)
    {
        float _1338 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1340 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1342 = _1238 + _1340;
        float _1344 = rsqrt(_1214);
        float _1346 = _1342 * _1338;
        float _1348 = _1262 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1350 = _1346 * 0.15915493667125701904296875;
        float _1352 = _1350 * 6.283185482025146484375;
        float _1354 = cos(_1352);
        float _1356 = _1350 * 6.283185482025146484375;
        float _1358 = sin(_1356);
        float _1360 = _1354 + (-1.0);
        float _1362 = fma(_1358, _1348, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1364 = _1360 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1366 = _1344 * _1362;
        float _1368 = fma(_1262, _1354, _1364);
        float _1370 = fma(_1204, _1366, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1372 = fma(_1180, _1366, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1320 = _1368;
        _1332 = _1370;
        _1322 = _1372;
    }
    float _1374 = _1320;
    float _1376 = _1332;
    float _1378 = _1322;
    float _1380 = -_719;
    float _1382 = _1380 + _1374;
    bool _1384 = _1316 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1386 = _1143 + 80;
    uint _1388 = uint(int(uint(_1386) >> uint(2)));
    uint _1390 = uint(int(uint(int(_1388)) >> uint(2)));
    int _1392 = int(_1388) & 3;
    float _1394 = (*spvDescriptorSet0.vp_c15)._m0[int(_1390)][_1392];
    int _1396 = int(_1388) + 1;
    uint _1398 = uint(int(uint(_1396) >> uint(2)));
    int _1400 = _1396 & 3;
    float _1402 = (*spvDescriptorSet0.vp_c15)._m0[int(_1398)][_1400];
    int _1404 = _1316 | _1272;
    float _1406 = -_339;
    float _1408 = _1406 + _1376;
    float _1410 = _1382 * _1382;
    float _1412 = -_341;
    float _1414 = _1412 + _1378;
    bool _1416 = _1404 < 0;
    bool _1418 = _1416 || _1384;
    float _1420 = fma(_1408, _1408, _1410);
    float _1422 = _995 * _1290;
    bool _1424 = _1272 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1426 = _1424 || _1418;
    float _1428 = fma(_1414, _1414, _1420);
    float _1430 = fma(_339, _1282, _1422);
    float _1432 = _995 * _1166;
    float _1434 = _995 * _1234;
    float _1436 = sqrt(_1428);
    float _1438 = fma(_341, _1302, _1430);
    float _1440 = fma(_339, _1158, _1432);
    float _1442 = fma(_339, _1226, _1434);
    bool _1444 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1446 = isnan(0.5);
    bool _1448 = _1444 || _1446;
    bool _1450 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1452 = _1448 || _1450;
    float _1454 = _1438 + _1310;
    float _1456 = fma(_341, _1192, _1440);
    int _1458 = as_type<int>(_1434);
    int _1460 = as_type<int>(_1442);
    float _1462 = _1376;
    float _1464 = _1374;
    float _1466 = _1378;
    float _1468 = _1456;
    float _1470 = _1438;
    float _1472 = _1408;
    if (!_1426)
    {
        int _1474 = _1272 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1476 = _1474 + _1316;
        _1324 = _1476;
    }
    int _1478 = _1324;
    float _1480 = _1234;
    if (!_1426)
    {
        float _1482 = floor(_1240);
        _1480 = _1482;
    }
    float _1484 = _1480;
    float _1486 = fma(_341, _1252, _1442);
    if (!_1426)
    {
        int _1488 = _1478 << 2;
        _1334 = _1488;
    }
    int _1490 = _1334;
    float _1492 = _1486 + _1260;
    if (!_1426)
    {
        uint _1494 = uint(int(uint(_1478) >> uint(2)));
        _1458 = int(_1494);
    }
    int _1496 = _1458;
    bool _1498 = _1436 > 0.0;
    float _1500 = 1.0 / _1454;
    float _1502 = as_type<float>(_1496);
    if (!_1426)
    {
        int _1504 = 12 & _1490;
        _1336 = _1504;
    }
    int _1506 = _1336;
    float _1508 = _1456 + _1200;
    if (!_1426)
    {
        int _1510 = _1496 << 4;
        int _1512 = _1510 + _1506;
        _1460 = _1512;
    }
    int _1514 = _1460;
    bool _1516 = !_1498;
    float _1518 = _1484;
    if (!_1516)
    {
        float _1520 = _241 * _241;
        float _1522 = rsqrt(_1428);
        float _1524 = fma(_229, _229, _1520);
        float _1526 = fma(_249, _249, _1524);
        float _1528 = sqrt(_1526);
        float _1530 = _1408 * _1522;
        float _1532 = _1382 * _1522;
        float _1534 = _1414 * _1522;
        bool _1536 = _1528 > 0.0;
        bool _1538 = !_1536;
        _1502 = _1526;
        _1468 = _1528;
        _1470 = _1530;
        if (!_1538)
        {
            float _1540 = rsqrt(_1526);
            float _1542 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1544 = _241 * _1540;
            float _1546 = _229 * _1540;
            float _1548 = _1532 * _1544;
            float _1550 = _249 * _1540;
            float _1552 = fma(_1530, _1546, _1548);
            float _1554 = _1542 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1556 = fma(_1534, _1550, _1552);
            float _1558 = _1556 * _1554;
            float _1560 = fma(_229, _1558, _1376);
            float _1562 = fma(_241, _1558, _1374);
            float _1564 = fma(_249, _1558, _1378);
            _1462 = _1560;
            _1464 = _1562;
            _1466 = _1564;
            _1502 = _1540;
            _1468 = _1546;
        }
    }
    float _1566 = _1462;
    float _1568 = _1464;
    float _1570 = _1466;
    float _1572 = _1502;
    float _1574 = _1468;
    float _1576 = _1470;
    float _1578 = _1574;
    float _1580 = _1572;
    if (_1452)
    {
        _1578 = _1566;
    }
    float _1582 = _1578;
    float _1584 = _1582;
    if (_1452)
    {
        _1580 = _1568;
    }
    float _1586 = _1580;
    float _1588 = _1586;
    if (_1452)
    {
        _287 = _1570;
    }
    float _1590 = _287;
    float _1592 = _1590;
    if (!_1452)
    {
        float _1594 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1596 = _719 + _1594;
        float _1598 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1600 = _339 + _1598;
        float _1602 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1604 = _1596 * _1596;
        float _1606 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1608 = _341 + _1606;
        float _1610 = fma(_1600, _1600, _1604);
        float _1612 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1614 = fma(_1608, _1608, _1610);
        float _1616 = sqrt(_1614);
        float _1618 = _1602 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1620 = -_719;
        float _1622 = _1620 + _1568;
        float _1624 = precise::min(_1616, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1626 = _1624 * _1612;
        float _1628 = -_341;
        float _1630 = _1628 + _1570;
        float _1632 = _1618 * _1626;
        float _1634 = -_339;
        float _1636 = _1634 + _1566;
        float _1638 = fma(_1622, _1632, _719);
        float _1640 = fma(_1636, _1632, _339);
        float _1642 = fma(_1630, _1632, _341);
        _1588 = _1638;
        _1584 = _1640;
        _1592 = _1642;
    }
    float _1644 = _1588;
    float _1646 = _1584;
    float _1648 = _1592;
    int _1650 = _1143 + 88;
    uint _1652 = uint(int(uint(_1650) >> uint(2)));
    uint _1654 = uint(int(uint(int(_1652)) >> uint(2)));
    int _1656 = int(_1652) & 3;
    float _1658 = (*spvDescriptorSet0.vp_c15)._m0[int(_1654)][_1656];
    int _1660 = int(_1652) + 1;
    uint _1662 = uint(int(uint(_1660) >> uint(2)));
    int _1664 = _1660 & 3;
    float _1666 = (*spvDescriptorSet0.vp_c15)._m0[int(_1662)][_1664];
    float _1668 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1670 = _1492 * _1500;
    float _1672 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1674 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1676 = fma(_1646, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1668);
    float _1678 = _1508 * _1500;
    float _1680 = fma(_1646, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1672);
    float _1682 = fma(_1646, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1674);
    float _1684 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1676);
    float _1686 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _1688 = _1678 >= 0.0;
    float _1690 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1680);
    float _1692 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1682);
    float _1694 = _1684 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1696 = _1678 <= 1.0;
    bool _1698 = _1696 && _1688;
    float _1700 = _1690 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1702 = fma(_1646, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1686);
    float _1704 = _1692 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1706 = _1694 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1708 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1710 = _1700 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1712 = _1670 >= 0.0;
    bool _1714 = _1712 && _1698;
    float _1716 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1702);
    float _1718 = fma(_1704, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1706);
    float _1720 = -_1710;
    float _1722 = fma(_1720, _1708, 1.0);
    bool _1724 = _1670 <= 1.0;
    bool _1726 = _1724 && _1714;
    float _1728 = _1716 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1730 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1718);
    float _1732 = _1576;
    float _1734 = _1722;
    if (!_1426)
    {
        float _1736 = floor(_1182);
        _1732 = _1736;
    }
    float _1738 = _1732;
    float _1740 = _1566;
    if (!_1426)
    {
        int _1742 = _1514 + 400;
        uint _1744 = uint(int(uint(_1742) >> uint(2)));
        uint _1746 = uint(int(uint(int(_1744)) >> uint(2)));
        int _1748 = int(_1744) & 3;
        float _1750 = (*spvDescriptorSet0.vp_c15)._m0[int(_1746)][_1748];
        _1740 = _1750;
    }
    float _1752 = _1740;
    float _1754 = _1694 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1756 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1730);
    float _1758 = _995 * _1402;
    if (!_1426)
    {
        float _1760 = -_1484;
        float _1762 = _1240 + _1760;
        _1518 = _1762;
    }
    float _1764 = _1518;
    float _1766 = fma(_1704, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1754);
    float _1768 = 1.0 / _1756;
    float _1770 = _1694 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    if (_1726)
    {
        float _1772 = float(_1137);
        _1472 = _1772;
    }
    float _1774 = _1472;
    float _1776 = fma(_339, _1394, _1758);
    float _1778 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1766);
    float _1780 = fma(_1704, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1770);
    float _1782 = log2(_1722);
    float _1784 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1780);
    float _1786 = fma(_341, _1658, _1776);
    float _1788 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1784);
    float _1790 = _1786 + _1666;
    float _1792 = _1770;
    if (_1726)
    {
        float _1794 = rint(_1774);
        float _1796 = precise::max(_1794, 0.0);
        uint _1798 = uint(_1796);
        uint _1800 = clamp(_1798, 0u, 65535u);
        _1792 = as_type<float>(_1800);
    }
    float _1802 = _1792;
    if (!_1426)
    {
        float _1804 = -_1738;
        float _1806 = _1182 + _1804;
        _1734 = _1806;
    }
    float _1808 = _1734;
    float _1810 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1778);
    float _1812 = _1788 * _1768;
    float _1814 = _1810 * _1768;
    float _1816 = fma(_1812, 0.5, 0.5);
    float _1818 = _1782 * 0.693147182464599609375;
    float _1820 = _1790 * _1500;
    float _1822 = fma(_1814, -0.5, 0.5);
    float _1824 = _1818 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1826 = _1670;
    if (_1726)
    {
        float3 _6090 = float3(_1678, _1670, float(as_type<int>(_1802)));
        float3 _6094 = select(_6090, float3(0.0), isnan(_6090));
        float _1828 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6094.xy, uint(rint(_6094.z)), _1820, level(0.0));
        _1826 = _1828;
    }
    float _1830 = _1826;
    float3 _6104 = float3(_1816, _1822, _1824);
    float _1832 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6104, float3(0.0), isnan(_6104)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6104, float3(0.0), isnan(_6104)), level(0.0)).x;
    float3 _6113 = float3(_1816, _1822, _1824);
    float4 _1835 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6113, float3(0.0), isnan(_6113)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6113, float3(0.0), isnan(_6113)), level(0.0)).xyzw;
    float _1837 = _1835.x;
    float _1839 = _1835.y;
    float _1841 = _1835.z;
    float _1843 = _1835.w;
    float _1845 = _1500;
    if (!_1426)
    {
        float _1847 = rint(_1752);
        float _1849 = precise::max(_1847, 0.0);
        uint _1851 = uint(_1849);
        uint _1853 = clamp(_1851, 0u, 65535u);
        _1845 = as_type<float>(_1853);
    }
    float _1855 = _1845;
    float _1857 = _1808;
    if (!_1426)
    {
        float3 _6152 = float3(_1764, _1808, float(as_type<int>(_1855)));
        float3 _6154 = select(_6152, float3(0.0), isnan(_6152));
        float _1859 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6154.xy, uint(rint(_6154.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6154.xy, uint(rint(_6154.z)), level(0.0)).x;
        _1857 = _1859;
    }
    float _1861 = _1857;
    float _1863 = float(uint(_683));
    float _1865 = trunc(_809);
    int _1867 = int(_1865);
    float _1869 = 1.0 / _1863;
    float _1871 = float(uint(_1867));
    int _1873 = as_type<int>(_1869) + (-2);
    float _1875 = as_type<float>(_1873) * _1871;
    float _1877 = trunc(_1875);
    float _1879 = precise::max(_1877, 0.0);
    uint _1881 = uint(_1879);
    int _1883 = ~_683;
    int _1885 = _1883 + 1;
    int _1887 = ~_683;
    int _1889 = _1887 + 1;
    int _1891 = _1885 * int(_1881);
    int _1893 = _1891 + _1867;
    float _1895 = float(uint(_1893));
    float _1897 = as_type<float>(_1873) * _1895;
    float _1899 = trunc(_1897);
    float _1901 = precise::max(_1899, 0.0);
    uint _1903 = uint(_1901);
    int _1905 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1907 = _1905 != 0;
    bool _1909 = !_1907;
    float _1911 = _1909 ? 7.345489978790283203125 : 1.0;
    float _1913 = _1897;
    if (_1426)
    {
        _1913 = 1.0;
    }
    float _1915 = _1913;
    float _1917 = _1911 * _171;
    int _1919 = int(_1881) + int(_1903);
    float _1921 = floor(_1917);
    int _1923 = _1889 * _1919;
    int _1925 = _1923 + _1867;
    bool _1927 = uint(_1925) >= uint(_683);
    bool _1929 = !_1927;
    int _1931 = _1929 ? 0 : (-1);
    float _1933 = -_1921;
    float _1935 = _1917 + _1933;
    int _1937 = ~_1919;
    int _1939 = _1937 + _1931;
    int _1941 = _1939 + 1;
    float _1943 = _1915;
    if (!_1426)
    {
        int _1945 = _1478 << 4;
        int _1947 = _1945 + 2048;
        uint _1949 = uint(int(uint(_1947) >> uint(2)));
        uint _1951 = uint(int(uint(int(_1949)) >> uint(2)));
        int _1953 = int(_1949) & 3;
        float _1955 = (*spvDescriptorSet0.vp_c15)._m0[int(_1951)][_1953];
        int _1957 = int(_1949) + 1;
        uint _1959 = uint(int(uint(_1957) >> uint(2)));
        int _1961 = _1957 & 3;
        float _1963 = (*spvDescriptorSet0.vp_c15)._m0[int(_1959)][_1961];
        int _1965 = _1947 + 8;
        uint _1967 = uint(int(uint(_1965) >> uint(2)));
        uint _1969 = uint(int(uint(int(_1967)) >> uint(2)));
        int _1971 = int(_1967) & 3;
        float _1973 = (*spvDescriptorSet0.vp_c15)._m0[int(_1969)][_1971];
        int _1975 = int(_1967) + 1;
        uint _1977 = uint(int(uint(_1975) >> uint(2)));
        int _1979 = _1975 & 3;
        float _1981 = (*spvDescriptorSet0.vp_c15)._m0[int(_1977)][_1979];
        float _1983 = _995 * _1963;
        float _1985 = fma(_339, _1955, _1983);
        float _1987 = fma(_341, _1973, _1985);
        float _1989 = _1987 + _1981;
        float _1991 = precise::clamp(_1989, 0.0, 1.0);
        float _1993 = -_1991;
        float _1995 = _1993 + _1861;
        float _1997 = fma(_1995, 500.0, 1.5);
        float _1999 = exp2(_1997);
        float _2001 = 0.0 + _1999;
        float _2003 = precise::clamp(_2001, 0.0, 1.0);
        _1943 = _2003;
    }
    float _2005 = _1943;
    float _2007 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2009 = _1644 + _2007;
    float _2011 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2013 = _1646 + _2011;
    float _2015 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2017 = _1648 + _2015;
    float _2019 = _2009 * _2009;
    float _2021 = fma(_2013, _2013, _2019);
    float _2023 = fma(_2017, _2017, _2021);
    float _2025 = rsqrt(_2023);
    float _2027 = sqrt(_2023);
    float _2029 = _2013 * _2025;
    float _2031 = _2017 * _2025;
    float _2033 = _2009 * _2025;
    float _2035 = _2029 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2037 = _2031 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2039 = _2035 * _2035;
    float _2041 = _2037 * _2037;
    float _2043 = _2039 + _2041;
    float _2045 = sqrt(_2043);
    bool _2047 = _2045 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2049 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2051 = _2045 + _2049;
    float _2053 = _1861;
    float _2055 = _2043;
    float _2057 = _2051;
    float _2059 = _2035;
    float _2061 = _2039;
    float _2063 = _2041;
    if (_2047)
    {
        float _2065 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2053 = _2065;
    }
    float _2067 = _2053;
    if (_2047)
    {
        float _2069 = rsqrt(_2043);
        _2055 = _2069;
    }
    float _2071 = _2055;
    if (_2047)
    {
        float _2073 = _2051 * _2067;
        _2057 = _2073;
    }
    float _2075 = _2057;
    if (_2047)
    {
        float _2077 = _2075 * 0.15915493667125701904296875;
        _1326 = _2077;
    }
    float _2079 = _1326;
    float _2081 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2083 = _1824;
    if (_2047)
    {
        float _2085 = _2079 * 6.283185482025146484375;
        float _2087 = sin(_2085);
        _2083 = _2087;
    }
    float _2089 = _2083;
    float _2091 = precise::max(0.0, _2081);
    float _2093 = _2075;
    float _2095 = _2091;
    if (_2047)
    {
        float _2097 = _2079 * 6.283185482025146484375;
        float _2099 = cos(_2097);
        _2093 = _2099;
    }
    float _2101 = _2093;
    float _2103 = -_2033;
    float _2105 = -_2091;
    float _2107 = fma(_2103, (*spvDescriptorSet0.vp_c15)._m0[24].y, _2105);
    float _2109 = _2107;
    if (_2047)
    {
        float _2111 = _2107 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2095 = _2111;
    }
    float _2113 = _2095;
    float _2115 = _2113;
    float _2117 = _2089;
    if (_2047)
    {
        float _2119 = fma(_2089, _2113, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2115 = _2119;
    }
    float _2121 = _2115;
    float _2123 = _2121;
    if (_2047)
    {
        float _2125 = _2071 * _2121;
        _2123 = _2125;
    }
    float _2127 = _2123;
    if (_2047)
    {
        float _2129 = _2101 + (-1.0);
        _2117 = _2129;
    }
    float _2131 = _2117;
    float _2133 = _2131;
    if (_2047)
    {
        float _2135 = _2035 * _2127;
        _2059 = _2135;
    }
    float _2137 = _2059;
    float _2139 = 0.0;
    if (_2047)
    {
        float _2141 = _2131 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2139 = _2141;
    }
    float _2143 = _2139;
    if (!_2047)
    {
        _2133 = _2037;
    }
    float _2145 = _2133;
    float _2147 = _2145;
    if (_2047)
    {
        float _2149 = _2037 * _2127;
        _2147 = _2149;
    }
    float _2151 = _2147;
    if (_2047)
    {
        float _2153 = _2137 * _2137;
        _2061 = _2153;
    }
    float _2155 = _2061;
    if (_2047)
    {
        float _2157 = fma(_2107, _2101, _2143);
        _2109 = _2157;
    }
    float _2159 = _2109;
    if (_2047)
    {
        float _2161 = _2151 * _2151;
        _2063 = _2161;
    }
    float _2163 = _2063;
    float _2165 = fma(_2159, _2159, _2155);
    float _2167 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2169 = fma(_2027, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2167);
    float _2171 = precise::clamp(_2169, 0.0, 1.0);
    float _2173 = _2165 + _2163;
    float _2175 = -_2171;
    float _2177 = _2175 + 1.0;
    float _2179 = rsqrt(_2173);
    float _2181 = abs(_2177);
    float _2183 = log2(_2181);
    float _2185 = _2179 * _2137;
    float _2187 = _2179 * _2159;
    float _2189 = _2179 * _2151;
    float _2191 = float(_1867);
    float _2193 = _2185 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2195 = _2187 + 1.0;
    bool _2197 = _2191 >= _779;
    bool _2199 = isnan(_2191);
    bool _2201 = _2197 || _2199;
    bool _2203 = isnan(_779);
    bool _2205 = _2201 || _2203;
    float _2207 = float(_2205);
    float _2209 = -_2193;
    float _2211 = fma(_2187, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2209);
    float _2213 = _2183 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2215 = -_2189;
    float _2217 = fma(_2215, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2211);
    float _2219 = trunc(_2207);
    int _2221 = int(_2219);
    float _2223 = fma(_2217, -0.5, 0.5);
    float _2225 = fma(_2217, 0.5, 0.5);
    float _2227 = exp2(_2213);
    float _2229 = fma(_2225, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2231 = fma(_2225, _2229, -0.212114393711090087890625);
    float _2233 = sqrt(_2223);
    float _2235 = fma(_2225, _2231, 1.570728778839111328125);
    float _2237 = -_2187;
    float _2239 = fma(_2227, _2195, _2237);
    float _2241 = 1.0 / _319;
    float _2243 = fma(_2239, 0.5, 0.5);
    float _2245 = _2233 * 0.636619746685028076171875;
    float _2247 = -_2235;
    float _2249 = fma(_2245, _2247, 1.0);
    float2 _6733 = float2(_2249, _2243);
    float3 _2253 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6733, float2(0.0), isnan(_6733)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6733, float2(0.0), isnan(_6733)), level(0.0)).xyz;
    float _2255 = _2253.x;
    float _2257 = _2253.y;
    float _2259 = _2253.z;
    int _2261 = _683 * _1941;
    int _2263 = _2261 + _1867;
    bool _2265 = _683 == 0;
    float _2267 = _1935 * _779;
    float _2269 = _807 * _2241;
    float _2271 = -_791;
    float _2273 = _2271 + 1.0;
    int _2275 = ~_2221;
    int _2277 = _2275 + 1;
    int _2279 = _2277 + 1;
    float _2281 = -_811;
    float _2283 = _2281 + 1.0;
    bool _2285 = !_2265;
    int _2287 = _2285 ? _2263 : (-1);
    float _2289 = trunc(_2267);
    int _2291 = int(_2289);
    int _2293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2295 = _2293 != 0;
    float _2297 = _2183 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2299 = _683 + (-1);
    int _2301 = _2287 * _2279;
    bool _2303 = !_2295;
    int _2305 = _2303 ? 0 : 1;
    float _2307 = -_359;
    float _2309 = _2307 + 1.0;
    int _2311 = abs(_693);
    float _2313 = trunc(_2269);
    int _2315 = int(_2313);
    int _2317 = _2221 * _2299;
    int _2319 = _2317 + _2301;
    int _2321 = abs(_2305);
    out.m_74.x = _1646;
    out.m_74.y = _1644;
    out.m_74.z = _1648;
    int _2323 = abs(_711);
    int _2325 = _2319 * _2311;
    int _2327 = abs(_717);
    int _2329 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2331 = _2329 != 0;
    float _2333 = exp2(_2297);
    bool _2335 = !_2331;
    int _2337 = _2335 ? 0 : 1;
    int _2339 = _2291 * _2321;
    int _2341 = _2339 + _1867;
    int _2343 = _2315 * _2323;
    int _2345 = _2343 + _2325;
    int _2347 = abs(_2337);
    int _2349 = ~_683;
    int _2351 = _2349 + 1;
    int _2353 = _2341 * _2327;
    int _2355 = _2353 + _2345;
    int _2357 = ~_683;
    int _2359 = _2357 + 1;
    bool _2361 = _171 > 0.5;
    int _2363 = _2291 * _2347;
    int _2365 = _2363 + _2355;
    int _2367 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2369 = _2367 != 0;
    float _2371 = -_2333;
    float _2373 = _2371 + 1.0;
    int _2375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2377 = _2375 != 0;
    float _2379 = float(uint(_2365));
    float _2381 = _2373 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2383 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2385 = _2383 != 0;
    int _2387 = ~_683;
    int _2389 = _2387 + 1;
    float _2391 = as_type<float>(_1873) * _2379;
    float _2393 = _2381 * _1832;
    float _2395 = trunc(_2391);
    float _2397 = precise::max(_2395, 0.0);
    uint _2399 = uint(_2397);
    int _2401 = _2351 * int(_2399);
    int _2403 = _2401 + _2365;
    float _2405 = float(uint(_2403));
    float _2407 = as_type<float>(_1873) * _2405;
    float _2409 = trunc(_2407);
    float _2411 = precise::max(_2409, 0.0);
    uint _2413 = uint(_2411);
    float _2415 = -_1031;
    int _2417 = _2361 ? as_type<int>(_2415) : as_type<int>(_1031);
    bool _2419 = !_2377;
    float _2421 = _2419 ? _1031 : as_type<float>(_2417);
    float _2423 = _1031 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2425 = int(_2399) + int(_2413);
    float _2427 = _2421 + 0.5;
    float _2429 = float(uint(_2341));
    int _2431 = _2359 * _2425;
    int _2433 = _2431 + _2365;
    float _2435 = fma(_2427, (*spvDescriptorSet0.vp_c9)._m0[80].x, _783);
    bool _2437 = uint(_2433) >= uint(_683);
    float _2439 = as_type<float>(_1873) * _2429;
    float _2441 = -_2273;
    float _2443 = fma(_2421, _2441, _2435);
    bool _2445 = !_2437;
    int _2447 = _2445 ? 0 : (-1);
    bool _2449 = _361 > 0.5;
    float _2451 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2453 = ~_2425;
    int _2455 = _2453 + _2447;
    int _2457 = _2455 + 1;
    float _2459 = trunc(_2439);
    float _2461 = precise::max(_2459, 0.0);
    uint _2463 = uint(_2461);
    float _2465 = -_1023;
    int _2467 = _2449 ? as_type<int>(_2465) : as_type<int>(_1023);
    float _2469 = _2451 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2471 = _683 * _2457;
    int _2473 = _2471 + _2365;
    int _2475 = ~_683;
    int _2477 = _2475 + 1;
    float _2479 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _2481 = !_2385;
    float _2483 = _2481 ? _1023 : as_type<float>(_2467);
    float _2485 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2487 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2489 = _2483 + (-0.5);
    int _2491 = _2389 * int(_2463);
    int _2493 = _2491 + _2341;
    float _2495 = _2485 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2497 = _2487 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2499 = float(uint(_2493));
    float _2501 = -_2489;
    float _2503 = -_785;
    float _2505 = fma(_2501, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2503);
    bool _2507 = !_2265;
    int _2509 = _2507 ? _2473 : (-1);
    out.m_76.x = _2469;
    out.m_76.y = _2495;
    out.m_76.z = _2497;
    out.m_76.w = _2479;
    float _2511 = abs(_1081);
    float _2513 = log2(_2511);
    float _2515 = as_type<float>(_1873) * _2499;
    int _2517 = _2509 >> 31;
    float _2519 = fma(_2483, _2283, _2505);
    int _2521 = _2517 & 3;
    out.m_78.x = _2443;
    out.m_78.y = _2519;
    int _2523 = _2509 & 3;
    bool _2525 = _2523 != 0;
    int _2527 = _2509 + _2521;
    float _2529 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2531 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2533 = _2527 >> 2;
    float _2535 = _2513 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2537 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2539 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2541 = _2533 << 4;
    int _2543 = _2541 + 368;
    float _2545 = trunc(_2515);
    float _2547 = precise::max(_2545, 0.0);
    uint _2549 = uint(_2547);
    float _2551 = _2531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2553 = _2537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    uint _2555 = uint(int(uint(_2543) >> uint(2)));
    uint _2557 = uint(int(uint(int(_2555)) >> uint(2)));
    int _2559 = int(_2555) & 3;
    float _2561 = (*spvDescriptorSet0.vp_c9)._m0[int(_2557)][_2559];
    int _2563 = int(_2555) + 1;
    uint _2565 = uint(int(uint(_2563) >> uint(2)));
    int _2567 = _2563 & 3;
    float _2569 = (*spvDescriptorSet0.vp_c9)._m0[int(_2565)][_2567];
    float _2571 = _2539 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2573 = _2509 & 3;
    bool _2575 = _2573 != 0;
    float _2577 = -_1067;
    float _2579 = fma(_2577, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2529);
    float _2581 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2583 = exp2(_2535);
    out.m_80.x = _2551;
    out.m_80.y = _2553;
    out.m_80.z = _2571;
    bool _2585 = uint(_2573) > 1u;
    float _2587 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2589 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2581);
    float _2591 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2593 = _1081 <= 8000.0;
    bool _2595 = isnan(_1081);
    bool _2597 = _2593 || _2595;
    bool _2599 = isnan(8000.0);
    bool _2601 = _2597 || _2599;
    float _2603 = float(_2601);
    int _2605 = int(_2463) + int(_2549);
    float _2607 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2609 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2611 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2589);
    int _2613 = _2543 + 8;
    uint _2615 = uint(int(uint(_2613) >> uint(2)));
    uint _2617 = uint(int(uint(int(_2615)) >> uint(2)));
    int _2619 = int(_2615) & 3;
    float _2621 = (*spvDescriptorSet0.vp_c9)._m0[int(_2617)][_2619];
    int _2623 = int(_2615) + 1;
    uint _2625 = uint(int(uint(_2623) >> uint(2)));
    int _2627 = _2623 & 3;
    float _2629 = (*spvDescriptorSet0.vp_c9)._m0[int(_2625)][_2627];
    float _2631 = -_1067;
    float _2633 = fma(_2631, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2607);
    int _2635 = _2525 ? 0 : 1;
    float _2637 = -_1067;
    float _2639 = fma(_2637, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2609);
    float _2641 = fma(_2583, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2643 = precise::clamp(_2641, 0.0, 1.0);
    float _2645 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2647 = ~_2635;
    int _2649 = _2647 + 1;
    int _2651 = _2649 + 1;
    float _2653 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2633);
    int _2655 = _2651;
    float _2657 = _2603;
    if (!_2585)
    {
        int _2659 = ~_2635;
        int _2661 = _2659 + 1;
        _2655 = _2661;
    }
    int _2663 = _2655;
    float _2665 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2579);
    bool _2667 = _2573 != 3;
    float _2669 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2639);
    bool _2671 = uint(_2573) >= 2u;
    float _2673 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2587);
    float _2675 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2645);
    int _2677 = abs(_2663);
    float _2679 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2681 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2683 = _2671 ? 0 : 1;
    float _2685 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2591);
    bool _2687 = !_2575;
    int _2689 = _2687 ? 0 : 1;
    float _2691 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2679);
    bool _2693 = _2573 != 3;
    int _2695 = _2477 * _2605;
    int _2697 = _2695 + _2341;
    int _2699 = ~_2677;
    int _2701 = _2699 + 1;
    int _2703 = _2701 + 1;
    float _2705 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2681);
    int _2707 = ~_2683;
    int _2709 = _2707 + 1;
    int _2711 = _2709 + 1;
    float _2713 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2675);
    int _2715 = _2711;
    if (_2667)
    {
        int _2717 = ~_2683;
        int _2719 = _2717 + 1;
        _2715 = _2719;
    }
    int _2721 = _2715;
    float _2723 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2673);
    int _2725 = abs(_2689);
    int _2727 = _2703 * as_type<int>(_2569);
    bool _2729 = !_2693;
    int _2731 = _2729 ? 0 : (-1);
    float _2733 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2685);
    int _2735 = abs(_2721);
    float _2737 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2691);
    bool _2739 = !_2369;
    int _2741 = _2739 ? 0 : 1;
    float _2743 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2705);
    bool _2745 = uint(_2697) >= uint(_683);
    int _2747 = abs(_2731);
    int _2749 = ~_2725;
    int _2751 = _2749 + 1;
    int _2753 = _2751 + 1;
    int _2755 = abs(_2741);
    bool _2757 = !_2745;
    int _2759 = _2757 ? 0 : (-1);
    int _2761 = _2753 * as_type<int>(_2561);
    int _2763 = _2761 + _2727;
    int _2765 = ~_2735;
    int _2767 = _2765 + 1;
    int _2769 = _2767 + 1;
    int _2771 = ~_2605;
    int _2773 = _2771 + _2759;
    int _2775 = _2773 + 1;
    int _2777 = _2769 * as_type<int>(_2621);
    int _2779 = _2777 + _2763;
    int _2781 = ~_2747;
    int _2783 = _2781 + 1;
    int _2785 = _2783 + 1;
    float _2787 = _1023 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2789 = ~_2755;
    int _2791 = _2789 + 1;
    int _2793 = _2791 + 1;
    int _2795 = _683 * _2775;
    int _2797 = _2795 + _2341;
    int _2799 = _2785 * as_type<int>(_2629);
    int _2801 = _2799 + _2779;
    float _2803 = _2787 * _2665;
    float _2805 = _2787 * _2669;
    int _2807 = _2801 * _2793;
    bool _2809 = !_2265;
    int _2811 = _2809 ? _2797 : (-1);
    float _2813 = _2787 * _2653;
    float _2815 = fma(_2643, -2.0, 3.0);
    float _2817 = _2643 * _2643;
    float _2819 = fma(_2423, _2713, _2805);
    int _2821 = _2811 * _2755;
    int _2823 = _2821 + _2807;
    float _2825 = _1694 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2827 = _2817 * _2815;
    float _2829 = fma(_2423, _2723, _2803);
    float _2831 = _2743 + _2819;
    float _2833 = fma(_1704, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2825);
    float _2835 = -_2827;
    float _2837 = _2835 + 1.0;
    float _2839 = float(_2823);
    float _2841 = fma(_2423, _2611, _2813);
    float _2843 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2833);
    float _2845 = fma(_2837, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2827);
    float _2847 = _1843 * _2393;
    float _2849 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2843);
    float _2851 = _2603 * _2845;
    float _2853 = _2839;
    if (!_1726)
    {
        _2657 = 1.0;
    }
    float _2855 = _2657;
    float _2857 = _2737 + _2841;
    float _2859 = _2849 + _1756;
    float _2861 = _2851 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2863 = _2855;
    float _2865 = _2861;
    if (_1726)
    {
        bool _2867 = _1830 >= _1820;
        bool _2869 = isnan(_1830);
        bool _2871 = _2867 || _2869;
        bool _2873 = isnan(_1820);
        bool _2875 = _2871 || _2873;
        float _2877 = float(_2875);
        _2863 = _2877;
    }
    float _2879 = _2863;
    float _2881 = _2733 + _2829;
    float _2883 = _2859 * 0.5;
    float _2885 = _2309 * _2861;
    float _2887 = precise::clamp(_2885, 0.0, 1.0);
    float _2889 = _2879 * _2005;
    out.m_82.x = _2857;
    out.m_82.y = _2881;
    out.m_82.z = _2831;
    float _2891 = -_2887;
    float _2893 = fma(_2891, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    bool _2895 = _2027 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2897 = isnan(_2027);
    bool _2899 = _2895 || _2897;
    bool _2901 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2903 = _2899 || _2901;
    out.m_84.z = _2883;
    out.m_84.w = _1756;
    float _2905 = -_2889;
    float _2907 = fma(_2905, _2893, 1.0);
    float _2909 = precise::clamp(_2907, 0.0, 1.0);
    out.gl_Position.x = _1788;
    out.gl_Position.y = _1810;
    out.gl_Position.z = _2849;
    out.gl_Position.w = _1756;
    float _2911 = _2259 * _2393;
    float _2913 = fma(_2255, _2847, _1837);
    float _2915 = fma(_2257, _2847, _1839);
    float _2917 = -_2381;
    float _2919 = _2917 + 1.0;
    float _2921 = _2909 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2923 = fma(_1843, _2911, _1841);
    out.m_86.x = _2839;
    float _2925 = _1843 * _2919;
    float _2927 = _2919;
    float _2929 = _2889;
    float _2931 = _2887;
    float _2933 = _2909;
    if (!_2903)
    {
        _2865 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2935 = _2865;
    out.m_88.x = _2921;
    float _2937 = _2935;
    float _2939 = _2935;
    if (!_2903)
    {
        _2927 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2941 = _2927;
    float _2943 = _2941;
    float _2945 = _2941;
    if (!_2903)
    {
        _2929 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2947 = _2929;
    out.m_90.x = _2913;
    out.m_90.y = _2915;
    out.m_90.z = _2923;
    out.m_90.w = _2925;
    float _2949 = _2947;
    float _2951 = _2947;
    if (!_2903)
    {
        _2853 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2953 = _2853;
    float _2955 = _2953;
    float _2957 = _2953;
    if (!_2903)
    {
        _2931 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2959 = _2931;
    float _2961 = _2959;
    float _2963 = _2959;
    if (!_2903)
    {
        _2933 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2965 = _2933;
    bool _2967 = !_2903;
    float _2969 = _2965;
    float _2971 = _2965;
    if (!_2967)
    {
        bool _2973 = _2027 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2975 = isnan(_2027);
        bool _2977 = _2973 || _2975;
        bool _2979 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2981 = _2977 || _2979;
        if (!_2981)
        {
            float _2983 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2985 = _2027 + _2983;
            float _2987 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2989 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2987;
            float _2991 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2993 = _2991 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2995 = 1.0 / _2989;
            float _2997 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2999 = _2997 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3001 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3003 = _3001 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3005 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3007 = _3005 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3009 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3011 = _3009 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3013 = _2985 * _2995;
            float _3015 = precise::clamp(_3013, 0.0, 1.0);
            float _3017 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3019 = _3017 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3021 = fma(_3015, _2993, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3023 = fma(_3015, _3019, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3025 = fma(_3015, _2999, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3027 = fma(_3015, _3003, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3029 = fma(_3015, _3007, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3031 = fma(_3015, _3011, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2945 = _3025;
            _2963 = _3029;
            _2939 = _3021;
            _2951 = _3027;
            _2957 = _3023;
            _2971 = _3031;
            _3033 = true;
        }
        else
        {
            bool _3035 = _2027 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3037 = isnan(_2027);
            bool _3039 = _3035 || _3037;
            bool _3041 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3043 = _3039 || _3041;
            if (!_3043)
            {
                _2937 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3045 = _2937;
            _2939 = _3045;
            if (!_3043)
            {
                _2943 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3047 = _2943;
            _2945 = _3047;
            if (!_3043)
            {
                _2955 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3049 = _2955;
            _2957 = _3049;
            if (!_3043)
            {
                _2949 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3051 = _2949;
            _2951 = _3051;
            if (!_3043)
            {
                _2961 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3053 = _2961;
            _2963 = _3053;
            if (!_3043)
            {
                _2969 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3055 = _2969;
            bool _3057 = !_3043;
            _2971 = _3055;
            if (!_3057)
            {
                bool _3059 = _2027 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3061 = isnan(_2027);
                bool _3063 = _3059 || _3061;
                bool _3065 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3067 = _3063 || _3065;
                if (!_3067)
                {
                    float _3069 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3071 = _2027 + _3069;
                    float _3073 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3075 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3073;
                    float _3077 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3079 = _3077 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3081 = 1.0 / _3075;
                    float _3083 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3085 = _3083 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3087 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3089 = _3087 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3091 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3093 = _3091 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3095 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3097 = _3095 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3099 = _3071 * _3081;
                    float _3101 = precise::clamp(_3099, 0.0, 1.0);
                    float _3103 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3105 = _3103 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3107 = fma(_3101, _3079, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3109 = fma(_3101, _3105, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3111 = fma(_3101, _3085, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3113 = fma(_3101, _3089, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3115 = fma(_3101, _3093, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3117 = fma(_3101, _3097, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2945 = _3111;
                    _2963 = _3115;
                    _2939 = _3107;
                    _2951 = _3113;
                    _2957 = _3109;
                    _2971 = _3117;
                    _3033 = true;
                }
                else
                {
                    _2945 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2963 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2939 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2951 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2957 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2971 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3033 = false;
    float _3119 = _2945;
    float _3121 = _2963;
    float _3123 = _2939;
    float _3125 = _2951;
    float _3127 = _2957;
    float _3129 = _2971;
    float _3131 = fma(_2881, -0.5, 0.5);
    float _3133 = precise::clamp(_3131, 0.0, 1.0);
    float _3135 = -_3119;
    float _3137 = _3135 + _3121;
    float _3139 = -_3123;
    float _3141 = _3139 + _3125;
    float _3143 = -_3127;
    float _3145 = _3143 + _3129;
    bool _3147 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3149 = fma(_3133, _3137, _3119);
    float _3151 = fma(_3133, _3141, _3123);
    float _3153 = fma(_3133, _3145, _3127);
    float _3155 = _3149 * 0.586610972881317138671875;
    out.m_92.x = 0.0;
    float _3157 = fma(_3151, 0.298911988735198974609375, _3155);
    float _3159 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3161 = fma(_3153, 0.114477999508380889892578125, _3157);
    out.m_59.x = _3159;
    float _3163 = -_3161;
    float _3165 = _3151 + _3163;
    float _3167 = -_3161;
    float _3169 = _3149 + _3167;
    float _3171 = -_3161;
    float _3173 = _3153 + _3171;
    out.m_94.x = 0.0;
    float _3175 = fma(_3165, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3161);
    float _3177 = fma(_3169, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3161);
    float _3179 = fma(_3173, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3161);
    out.m_96.x = _3175;
    out.m_96.y = _3177;
    out.m_96.z = _3179;
    if (!_3147)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3181 = -_1644;
    float _3183 = _3181 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3185 = -_1646;
    float _3187 = _3185 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3189 = -_1648;
    float _3191 = _3189 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3193 = _3183 * _3183;
    float _3195 = fma(_3187, _3187, _3193);
    float _3197 = fma(_3191, _3191, _3195);
    float _3199 = rsqrt(_3197);
    float _3201 = sqrt(_3197);
    float _3203 = _3183 * _3199;
    float _3205 = _3187 * _3199;
    float _3207 = _3191 * _3199;
    float _3209 = -_2033;
    float _3211 = _3209 + _3203;
    float _3213 = -_2029;
    float _3215 = _3213 + _3205;
    float _3217 = -_2031;
    float _3219 = _3217 + _3207;
    float _3221 = _3211 * _3211;
    float _3223 = -_3201;
    float _3225 = _3223 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3227 = fma(_3215, _3215, _3221);
    float _3229 = _3225 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3231 = precise::clamp(_3229, 0.0, 1.0);
    float _3233 = fma(_3219, _3219, _3227);
    float _3235 = abs(_3231);
    float _3237 = log2(_3235);
    float _3239 = rsqrt(_3233);
    float _3241 = _3237 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3243 = exp2(_3241);
    float _3245 = _3211 * _3239;
    float _3247 = _3215 * _3239;
    float _3249 = _3219 * _3239;
    float _3251 = _2881 * _3245;
    float _3253 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _3255 = precise::clamp(_3253, 0.0, 1.0);
    float _3257 = _2881 * _3203;
    float _3259 = fma(_2857, _3247, _3251);
    float _3261 = _3255 * _3255;
    float _3263 = fma(_2857, _3205, _3257);
    float _3265 = fma(_2831, _3249, _3259);
    float _3267 = precise::clamp(_3265, 0.0, 1.0);
    float _3269 = _3261 + (-1.0);
    float _3271 = fma(_2831, _3207, _3263);
    float _3273 = precise::clamp(_3271, 0.0, 1.0);
    float _3275 = _3267 * _3267;
    float _3277 = _3205 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3279 = fma(_3275, _3269, 1.0);
    float _3281 = -_3203;
    float _3283 = -_3277;
    float _3285 = fma(_3281, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3283);
    float _3287 = _3279 * _3279;
    float _3289 = -_3207;
    float _3291 = fma(_3289, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3285);
    float _3293 = 1.0 / _3287;
    float _3295 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3297 = _3291 + _3295;
    float _3299 = _3297 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3301 = precise::clamp(_3299, 0.0, 1.0);
    float _3303 = _3243 * _3301;
    float _3305 = _3273 * _3303;
    float _3307 = _3261 * _3293;
    float _3309 = _3305 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3311 = _3305 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _3313 = _3305 * _3307;
    float _3315 = _3305 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3317 = _3313 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3319 = _3313 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3321 = _3313 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_92.x = _3315;
    out.m_92.y = _3309;
    out.m_92.z = _3311;
    out.m_94.x = _3317;
    out.m_94.y = _3319;
    out.m_94.z = _3321;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

