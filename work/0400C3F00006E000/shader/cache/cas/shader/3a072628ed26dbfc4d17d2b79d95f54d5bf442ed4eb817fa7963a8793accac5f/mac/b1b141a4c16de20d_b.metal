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
    float4 m_84 [[user(locn0)]];
    float4 m_80 [[user(locn1)]];
    float4 m_94 [[user(locn2)]];
    float4 m_82 [[user(locn3)]];
    float4 m_59 [[user(locn4)]];
    float4 m_76 [[user(locn5)]];
    float4 m_90 [[user(locn6)]];
    float4 m_92 [[user(locn7)]];
    float4 m_86 [[user(locn8)]];
    float4 m_88 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_72 [[attribute(1)]];
    float4 m_70 [[attribute(2)]];
    float4 m_74 [[attribute(3)]];
    float4 m_68 [[attribute(5)]];
    float4 m_56 [[attribute(6)]];
    float4 m_61 [[attribute(7)]];
    float4 m_63 [[attribute(8)]];
    float4 m_78 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2289 = false;
    bool _529 = false;
    bool _337 = false;
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
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2588 = as_type<float>(_129);
        out.gl_Position.z = _2588;
    }
    if (!_117)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _133 = in.m_61.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_143)
    {
        float _149 = float(_113);
        _123 = _149;
    }
    float _151 = _123;
    bool _153 = _147 >= _151;
    bool _155 = !_143;
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
        _131 = as_type<int>(_163);
    }
    int _165 = _131;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2657 = as_type<float>(_165);
        out.gl_Position.z = _2657;
    }
    if (_157)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _167 = in.m_63.x;
    float _169 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _171 = _147 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _173 = as_type<float>(int(gl_VertexIndex));
    float _175 = in.m_68.x;
    float _177 = in.m_68.y;
    float _179 = in.m_68.z;
    float _181 = in.m_70.x;
    float _183 = in.m_70.y;
    float _185 = in.m_70.z;
    float _187 = in.m_72.x;
    float _189 = in.m_72.y;
    float _191 = in.m_72.z;
    float _193 = _171 * _169;
    float _195 = in.m_74.x;
    float _197 = in.m_74.y;
    float _199 = in.m_74.z;
    float _201 = fma(_167, (*spvDescriptorSet0.vp_c9)._m0[20].x, _193);
    int _203 = as_type<int>(_173) & 1;
    bool _205 = _203 != 0;
    int _207 = as_type<int>(_173) & 2;
    bool _209 = _207 != 0;
    float _211 = _201 * 6.283185482025146484375;
    float _213 = floor(_201);
    int _215 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _217 = _215 != 0;
    float _219 = _211 * 0.15915493667125701904296875;
    bool _221 = !_209;
    int _223 = _221 ? (-1090519040) : 1056964608;
    int _225 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _227 = _225 != 0;
    int _229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _231 = _229 != 0;
    float _233 = _177 * _183;
    bool _235 = !_205;
    int _237 = _235 ? (-1090519040) : 1056964608;
    float _239 = _219 * 6.283185482025146484375;
    float _241 = cos(_239);
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _245 = fma(_175, _181, _233);
    bool _247 = !_227;
    int _249 = _247 ? 0 : 1;
    out.m_76.x = as_type<float>(_237);
    out.m_76.y = as_type<float>(_223);
    bool _251 = !_217;
    int _253 = _251 ? 0 : 1;
    float _255 = -_213;
    float _257 = _201 + _255;
    int _259 = abs(_249);
    float _261 = _177 * _189;
    int _263 = abs(_253);
    float _265 = -_257;
    float _267 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _269 = _177 * _197;
    bool _271 = !_231;
    int _273 = _271 ? 0 : 1;
    float _275 = fma(_175, _187, _261);
    float _277 = float(_259);
    float _279 = fma(_241, 0.5, 0.5);
    bool _281 = _257 < 0.5;
    float _283 = float(_281);
    float _285 = fma(_175, _195, _269);
    int _287 = abs(_273);
    float _289 = abs(_267);
    float _291 = _277 * _289;
    float _293 = float(_263);
    float _295 = -_279;
    float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _299 = -_283;
    float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _303 = float(_287);
    float _305 = fma(_293, _297, _291);
    float _307 = fma(_179, _191, _275);
    float _309 = fma(_179, _185, _245);
    float _311 = fma(_179, _199, _285);
    float _313 = abs(_301);
    float _315 = fma(_303, _313, _305);
    bool _317 = !_243;
    float _319 = _315;
    float _335;
    if (!_317)
    {
        float _321 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _323 = _167 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _325 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _327 = _325 * _321;
        float _329 = floor(_327);
        float _331 = -_329;
        float _333 = _327 + _331;
        _335 = _333;
        _337 = true;
    }
    else
    {
        float _339 = float(_113);
        float _341 = 1.0 / _339;
        float _343 = _147 * _341;
        _335 = _343;
    }
    _337 = false;
    float _345 = _335;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _349 = _345 + _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _353 = _345 + _351;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _357 = _345 + _355;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _359;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _367;
    bool _371 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _373 = isnan(_345);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = 1.0 / _361;
    bool _385 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _387 = 1.0 / _369;
    float _389 = 1.0 / _365;
    float _391 = _349 * _383;
    bool _393 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _395 = isnan(_345);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = -_381;
    float _407 = _405 + 1.0;
    bool _409 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _411 = isnan(_345);
    bool _413 = _409 || _411;
    bool _415 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _417 = _413 || _415;
    float _419 = float(_417);
    float _421 = _403 * _407;
    float _423 = _353 * _387;
    float _425 = -_403;
    float _427 = _425 + 1.0;
    float _429 = _419 * _427;
    float _431 = -_419;
    float _433 = _431 + 1.0;
    float _435 = _357 * _389;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _441 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _443 = isnan(_345);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _453;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _465 = fma(_455, _391, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _467 = _451 * _433;
    float _469 = fma(_459, _391, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _471 = fma(_439, _435, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _473 = fma(_463, _435, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _475 = -_451;
    float _477 = _475 + 1.0;
    float _479 = _465 * _467;
    float _481 = _469 * _467;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _483;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _487;
    float _491 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[143].x, _479);
    float _493 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[143].y, _481);
    float _495 = fma(_485, _423, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _497 = fma(_489, _423, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _499 = fma(_471, _429, _491);
    float _501 = fma(_473, _429, _493);
    float _503 = fma(_497, _421, _499);
    float _505 = fma(_495, _421, _501);
    float _507 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[146].x, _503);
    float _509 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[146].y, _505);
    bool _511 = !_385;
    float _527;
    if (!_511)
    {
        float _513 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _515 = _167 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _517 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[11].y, _147);
        float _519 = _517 * _513;
        float _521 = floor(_519);
        float _523 = -_521;
        float _525 = _519 + _523;
        _527 = _525;
        _529 = true;
    }
    else
    {
        float _531 = float(_113);
        float _533 = 1.0 / _531;
        float _535 = _147 * _533;
        _527 = _535;
    }
    _529 = false;
    float _537 = _527;
    float _539 = in.m_56.x;
    float _541 = in.m_56.y;
    float _543 = in.m_56.z;
    float _545 = in.m_74.w;
    float _547 = in.m_72.w;
    float _549 = _197 * _541;
    float _551 = _189 * _541;
    float _553 = fma(_195, _539, _549);
    float _555 = fma(_187, _539, _551);
    float _557 = fma(_199, _543, _553);
    float _559 = fma(_191, _543, _555);
    float _561 = _557 + _545;
    float _563 = _559 + _547;
    float _565 = fma(_561, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _567 = fma(_563, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _569 = floor(_565);
    float _571 = floor(_567);
    float _573 = -_569;
    float _575 = _565 + _573;
    float _577 = -_571;
    float _579 = _567 + _577;
    float2 _3290 = float2(_579, _575);
    float _581 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3290, float2(0.0), isnan(_3290)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3290, float2(0.0), isnan(_3290)), level(0.0)).x;
    float _583 = in.m_70.w;
    float _585 = _183 * _541;
    float _587 = fma(_181, _539, _585);
    float _589 = in.m_78.x;
    float _591 = in.m_78.y;
    float _593 = fma(_185, _543, _587);
    float _595 = _593 + _583;
    float _597 = _595 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _599 = _507 * _589;
    float _601 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[11].x, _597);
    float _603 = _509 * _591;
    float _605 = fma(_561, (*spvDescriptorSet0.vp_c8)._m0[11].z, _601);
    float _607 = _595 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _609 = _603 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _611 = _605 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _613 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[10].x, _607);
    float _615 = 1.0 / _611;
    float _617 = fma(_561, (*spvDescriptorSet0.vp_c8)._m0[10].z, _613);
    float _619 = _617 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _621 = _619 + _611;
    float _623 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_237));
    float _625 = _621 * _615;
    float _627 = _625 * 0.5;
    float _629 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_223));
    float _631 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _633 = fma(_627, (*spvDescriptorSet0.vp_c8)._m0[30].w, _631);
    float _635 = _599 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _637 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _639 = 1.0 / _633;
    float _641 = _635 * _623;
    float _643 = _595 + _637;
    float _645 = _609 * _629;
    float _647 = _643 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _649 = _645 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _651 = _645 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _653 = _643 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _655 = fma(_563, (*spvDescriptorSet0.vp_c15)._m0[127].x, _647);
    float _657 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[26].x, _649);
    float _659 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[24].x, _651);
    float _661 = fma(_563, (*spvDescriptorSet0.vp_c15)._m0[126].x, _653);
    float _663 = fma(_561, (*spvDescriptorSet0.vp_c15)._m0[127].z, _655);
    float _665 = _645 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _667 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _669 = _639 * _667;
    float _671 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _673 = fma(_561, (*spvDescriptorSet0.vp_c15)._m0[126].z, _661);
    float _675 = _663 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _677 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[25].x, _665);
    bool _679 = _669 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _681 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[26].z, _657);
    bool _683 = _669 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _685 = _673 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _687 = !_679;
    int _689 = _687 ? 0 : 1;
    float _691 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[24].z, _659);
    float _693 = _681 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _695 = trunc(_685);
    int _697 = int(_695);
    float _699 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[25].z, _677);
    float _701 = _691 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _703 = _561 + _693;
    float _705 = _699 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _707 = 2;
    int _709 = as_type<int>(_641);
    float _711 = _703;
    if (!_679)
    {
        _707 = 1;
    }
    int _713 = _707;
    float _715 = _563 + _701;
    int _717 = _713;
    float _719 = _715;
    if (!_683)
    {
        _717 = _689;
    }
    int _721 = _717;
    float _723 = trunc(_675);
    int _725 = int(_723);
    float _727 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _729 = _703 + _727;
    float _731 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _733 = _715 + _731;
    int _735 = _721 << 6;
    float _737 = _595 + _705;
    float _739 = _729 * _729;
    int _741 = _735 + 48;
    uint _744 = uint(int(uint(_741) >> uint(2)));
    uint _746 = uint(int(uint(int(_744)) >> uint(2)));
    int _748 = int(_744) & 3;
    float _750 = (*spvDescriptorSet0.vp_c15)._m0[int(_746)][_748];
    int _752 = int(_744) + 1;
    uint _754 = uint(int(uint(_752) >> uint(2)));
    int _756 = _752 & 3;
    float _758 = (*spvDescriptorSet0.vp_c15)._m0[int(_754)][_756];
    int _760 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _762 = _697 + _760;
    int _764 = _762 + 1;
    float _766 = fma(_733, _733, _739);
    bool _768 = _764 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _770 = sqrt(_766);
    int _772 = _735 + 56;
    uint _774 = uint(int(uint(_772) >> uint(2)));
    uint _776 = uint(int(uint(int(_774)) >> uint(2)));
    int _778 = int(_774) & 3;
    float _780 = (*spvDescriptorSet0.vp_c15)._m0[int(_776)][_778];
    int _782 = int(_774) + 1;
    uint _784 = uint(int(uint(_782) >> uint(2)));
    int _786 = _782 & 3;
    float _788 = (*spvDescriptorSet0.vp_c15)._m0[int(_784)][_786];
    int _790 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _792 = _725 + _790;
    int _794 = _792 + 1;
    int _796 = _764 | _794;
    int _798 = _735 + 64;
    uint _800 = uint(int(uint(_798) >> uint(2)));
    uint _802 = uint(int(uint(int(_800)) >> uint(2)));
    int _804 = int(_800) & 3;
    float _806 = (*spvDescriptorSet0.vp_c15)._m0[int(_802)][_804];
    int _808 = int(_800) + 1;
    uint _810 = uint(int(uint(_808) >> uint(2)));
    int _812 = _808 & 3;
    float _814 = (*spvDescriptorSet0.vp_c15)._m0[int(_810)][_812];
    bool _816 = _796 < 0;
    bool _818 = _816 || _768;
    bool _820 = _794 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _822 = _820 || _818;
    bool _824 = _770 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _826 = _735 + 72;
    uint _828 = uint(int(uint(_826) >> uint(2)));
    uint _830 = uint(int(uint(int(_828)) >> uint(2)));
    int _832 = int(_828) & 3;
    float _834 = (*spvDescriptorSet0.vp_c15)._m0[int(_830)][_832];
    int _836 = int(_828) + 1;
    uint _838 = uint(int(uint(_836) >> uint(2)));
    int _840 = _836 & 3;
    float _842 = (*spvDescriptorSet0.vp_c15)._m0[int(_838)][_840];
    int _844 = _735 + 96;
    uint _846 = uint(int(uint(_844) >> uint(2)));
    uint _848 = uint(int(uint(int(_846)) >> uint(2)));
    int _850 = int(_846) & 3;
    float _852 = (*spvDescriptorSet0.vp_c15)._m0[int(_848)][_850];
    int _854 = int(_846) + 1;
    uint _856 = uint(int(uint(_854) >> uint(2)));
    int _858 = _854 & 3;
    float _860 = (*spvDescriptorSet0.vp_c15)._m0[int(_856)][_858];
    float _862 = as_type<float>(_796);
    int _864 = _794;
    int _866 = _764;
    float _868 = _770;
    float _870 = as_type<float>(_721);
    if (!_822)
    {
        int _872 = _794 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _874 = _872 + _764;
        _709 = _874;
    }
    int _876 = _709;
    if (!_824)
    {
        _862 = _737;
    }
    float _878 = _862;
    float _880 = _878;
    if (!_822)
    {
        int _882 = _876 << 2;
        _864 = _882;
    }
    int _884 = _864;
    int _886 = _735 + 104;
    uint _888 = uint(int(uint(_886) >> uint(2)));
    uint _890 = uint(int(uint(int(_888)) >> uint(2)));
    int _892 = int(_888) & 3;
    float _894 = (*spvDescriptorSet0.vp_c15)._m0[int(_890)][_892];
    int _896 = int(_888) + 1;
    uint _898 = uint(int(uint(_896) >> uint(2)));
    int _900 = _896 & 3;
    float _902 = (*spvDescriptorSet0.vp_c15)._m0[int(_898)][_900];
    int _904 = _884;
    if (!_822)
    {
        uint _906 = uint(int(uint(_876) >> uint(2)));
        _866 = int(_906);
    }
    int _908 = _866;
    float _910 = as_type<float>(_908);
    if (!_822)
    {
        int _912 = 12 & _884;
        _904 = _912;
    }
    int _914 = _904;
    bool _916 = !_824;
    float _918 = _750;
    float _920 = _806;
    if (!_916)
    {
        float _922 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _924 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _926 = _770 + _924;
        float _928 = _737 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _930 = rsqrt(_766);
        float _932 = _926 * _922;
        float _934 = _932 * 0.15915493667125701904296875;
        float _936 = _934 * 6.283185482025146484375;
        float _938 = sin(_936);
        float _940 = _934 * 6.283185482025146484375;
        float _942 = cos(_940);
        float _944 = fma(_938, _928, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _946 = _930 * _944;
        float _948 = _942 + (-1.0);
        float _950 = fma(_733, _946, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _952 = fma(_729, _946, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _954 = _948 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _956 = fma(_737, _942, _954);
        _880 = _956;
        _719 = _950;
        _711 = _952;
        _868 = _954;
    }
    float _958 = _880;
    float _960 = _719;
    float _962 = _711;
    float _964 = _868;
    float _966 = _964;
    float _968 = _960;
    float _970 = _958;
    float _972 = _962;
    if (!_822)
    {
        int _974 = _908 << 4;
        int _976 = _974 + _914;
        _966 = as_type<float>(_976);
    }
    float _978 = _966;
    float _980 = -_595;
    float _982 = _980 + _958;
    int _984 = _735 + 80;
    uint _986 = uint(int(uint(_984) >> uint(2)));
    uint _988 = uint(int(uint(int(_986)) >> uint(2)));
    int _990 = int(_986) & 3;
    float _992 = (*spvDescriptorSet0.vp_c15)._m0[int(_988)][_990];
    int _994 = int(_986) + 1;
    uint _996 = uint(int(uint(_994) >> uint(2)));
    int _998 = _994 & 3;
    float _1000 = (*spvDescriptorSet0.vp_c15)._m0[int(_996)][_998];
    float _1002 = -_563;
    float _1004 = _1002 + _960;
    float _1006 = -_561;
    float _1008 = _1006 + _962;
    float _1010 = _982 * _982;
    float _1012 = _643 * _860;
    float _1014 = _982;
    if (!_822)
    {
        float _1016 = floor(_685);
        _910 = _1016;
    }
    float _1018 = _910;
    float _1020 = _643 * _814;
    float _1022 = fma(_1004, _1004, _1010);
    int _1024 = _735 + 88;
    uint _1026 = uint(int(uint(_1024) >> uint(2)));
    uint _1028 = uint(int(uint(int(_1026)) >> uint(2)));
    int _1030 = int(_1026) & 3;
    float _1032 = (*spvDescriptorSet0.vp_c15)._m0[int(_1028)][_1030];
    int _1034 = int(_1026) + 1;
    uint _1036 = uint(int(uint(_1034) >> uint(2)));
    int _1038 = _1034 & 3;
    float _1040 = (*spvDescriptorSet0.vp_c15)._m0[int(_1036)][_1038];
    float _1042 = fma(_563, _852, _1012);
    float _1044 = fma(_563, _806, _1020);
    float _1046 = fma(_1008, _1008, _1022);
    float _1048 = fma(_561, _894, _1042);
    float _1050 = _643 * _758;
    float _1052 = sqrt(_1046);
    float _1054 = _978;
    float _1056 = _1044;
    if (!_822)
    {
        int _1058 = as_type<int>(_978) + 400;
        uint _1060 = uint(int(uint(_1058) >> uint(2)));
        uint _1062 = uint(int(uint(int(_1060)) >> uint(2)));
        int _1064 = int(_1060) & 3;
        float _1066 = (*spvDescriptorSet0.vp_c15)._m0[int(_1062)][_1064];
        _1054 = _1066;
    }
    float _1068 = _1054;
    float _1070 = _1048 + _902;
    float _1072 = fma(_563, _750, _1050);
    float _1074 = fma(_561, _834, _1044);
    bool _1076 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1078 = isnan(0.5);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1084 = _1080 || _1082;
    float _1086 = fma(_561, _780, _1072);
    float _1088 = _1010;
    float _1090 = _1072;
    if (!_822)
    {
        float _1092 = floor(_675);
        _1088 = _1092;
    }
    float _1094 = _1088;
    float _1096 = _1074 + _842;
    float _1098 = _1086 + _788;
    bool _1100 = _1052 > 0.0;
    float _1102 = 1.0 / _1070;
    bool _1104 = !_1100;
    float _1106 = _1094;
    float _1108 = _1102;
    if (!_1104)
    {
        float _1110 = _309 * _309;
        float _1112 = rsqrt(_1046);
        float _1114 = fma(_307, _307, _1110);
        float _1116 = fma(_311, _311, _1114);
        float _1118 = sqrt(_1116);
        float _1120 = _1004 * _1112;
        float _1122 = _982 * _1112;
        float _1124 = _1008 * _1112;
        bool _1126 = _1118 > 0.0;
        bool _1128 = !_1126;
        _918 = _1124;
        _920 = _1122;
        _1090 = _1110;
        if (!_1128)
        {
            float _1130 = rsqrt(_1116);
            float _1132 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1134 = _309 * _1130;
            float _1136 = _307 * _1130;
            float _1138 = _311 * _1130;
            float _1140 = _1122 * _1134;
            float _1142 = fma(_1120, _1136, _1140);
            float _1144 = _1132 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1146 = fma(_1124, _1138, _1142);
            float _1148 = _1146 * _1144;
            float _1150 = fma(_307, _1148, _960);
            float _1152 = fma(_309, _1148, _958);
            float _1154 = fma(_311, _1148, _962);
            _968 = _1150;
            _970 = _1152;
            _972 = _1154;
            _1056 = _1132;
            _920 = _1144;
            _1090 = _1138;
        }
    }
    float _1156 = _968;
    float _1158 = _970;
    float _1160 = _972;
    float _1162 = _918;
    float _1164 = _1056;
    float _1166 = _920;
    float _1168 = _1090;
    float _1170 = _1166;
    float _1172 = _1164;
    float _1174 = _1162;
    float _1176 = _1168;
    if (_1084)
    {
        _1170 = _1156;
    }
    float _1178 = _1170;
    float _1180 = _1178;
    if (_1084)
    {
        _1172 = _1158;
    }
    float _1182 = _1172;
    float _1184 = _1182;
    if (_1084)
    {
        _1174 = _1160;
    }
    float _1186 = _1174;
    float _1188 = _1186;
    if (!_1084)
    {
        float _1190 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1192 = _595 + _1190;
        float _1194 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1196 = _563 + _1194;
        float _1198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1200 = -_595;
        float _1202 = _1200 + _1158;
        float _1204 = _1192 * _1192;
        float _1206 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1208 = _561 + _1206;
        float _1210 = -_563;
        float _1212 = _1210 + _1156;
        float _1214 = -_561;
        float _1216 = _1214 + _1160;
        float _1218 = fma(_1196, _1196, _1204);
        float _1220 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1222 = fma(_1208, _1208, _1218);
        float _1224 = sqrt(_1222);
        float _1226 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        bool _1228 = _1224 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1230 = isnan(_1224);
        bool _1232 = _1228 || _1230;
        bool _1234 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1236 = _1232 || _1234;
        float _1238 = precise::min(_1224, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1240 = _1238 * _1198;
        float _1242 = _1226 * _1240;
        float _1244 = _1186;
        float _1246 = _1238;
        float _1248 = _1224;
        if (_1236)
        {
            float _1250 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1244 = _1250;
        }
        float _1252 = _1244;
        if (_1236)
        {
            float _1254 = precise::max(_1224, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1246 = _1254;
        }
        float _1256 = _1246;
        float _1258 = fma(_1202, _1242, _595);
        float _1260 = fma(_1212, _1242, _563);
        float _1262 = _1258;
        float _1264 = _1260;
        if (_1236)
        {
            float _1266 = _1256 * _1252;
            _1248 = _1266;
        }
        float _1268 = _1248;
        float _1270 = fma(_1216, _1242, _561);
        float _1272 = _1268;
        _1188 = _1270;
        if (_1236)
        {
            float _1274 = _1226 * _1268;
            _1272 = _1274;
        }
        float _1276 = _1272;
        _1176 = _1276;
        if (_1236)
        {
            float _1278 = fma(_1202, _1276, _595);
            _1262 = _1278;
        }
        float _1280 = _1262;
        _1184 = _1280;
        if (_1236)
        {
            float _1282 = fma(_1212, _1276, _563);
            _1264 = _1282;
        }
        float _1284 = _1264;
        _1180 = _1284;
        if (_1236)
        {
            float _1286 = fma(_1216, _1276, _561);
            _1188 = _1286;
        }
    }
    float _1288 = _1184;
    float _1290 = _1180;
    float _1292 = _1188;
    float _1294 = _1176;
    float _1296 = _1288 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1298 = _1288 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1300 = _1288 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1302 = _1098 * _1102;
    float _1304 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1296);
    float _1306 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1298);
    float _1308 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1300);
    float _1310 = _1294;
    if (!_822)
    {
        float _1312 = rint(_1068);
        float _1314 = precise::max(_1312, 0.0);
        uint _1316 = uint(_1314);
        uint _1318 = clamp(_1316, 0u, 65535u);
        _1310 = as_type<float>(_1318);
    }
    float _1320 = _1310;
    float _1322 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1304);
    bool _1324 = _1302 >= 0.0;
    float _1326 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1306);
    float _1328 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1308);
    float _1330 = _1288 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1332 = _1096 * _1102;
    bool _1334 = _1302 <= 1.0;
    bool _1336 = _1334 && _1324;
    float _1338 = _1326 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1340 = _1322 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1342 = _1328 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1344 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1330);
    bool _1346 = _1332 >= 0.0;
    bool _1348 = _1346 && _1336;
    float _1350 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1352 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1354 = _1338 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1356 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1344);
    float _1358 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1350);
    bool _1360 = _1332 <= 1.0;
    bool _1362 = _1360 && _1348;
    float _1364 = -_1354;
    float _1366 = fma(_1364, _1352, 1.0);
    float _1368 = _1356 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1370 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1358);
    float _1372 = _643 * _1000;
    float _1374 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1376 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1378 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1370);
    float _1380 = log2(_1366);
    float _1382 = fma(_563, _992, _1372);
    float _1384 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1374);
    float _1386 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1376);
    float _1388 = _1356;
    if (!_822)
    {
        float _1390 = -_1094;
        float _1392 = _675 + _1390;
        _1106 = _1392;
    }
    float _1394 = _1106;
    if (_1362)
    {
        float _1396 = float(_721);
        _870 = _1396;
    }
    float _1398 = _870;
    float _1400 = fma(_561, _1032, _1382);
    float _1402 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1384);
    float _1404 = 1.0 / _1378;
    float _1406 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1386);
    float _1408 = _1400 + _1040;
    float _1410 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1402);
    float _1412 = _1398;
    if (!_822)
    {
        float _1414 = -_1018;
        float _1416 = _685 + _1414;
        _1388 = _1416;
    }
    float _1418 = _1388;
    float _1420 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1406);
    float _1422 = _1382;
    if (_1362)
    {
        float _1424 = rint(_1398);
        float _1426 = precise::max(_1424, 0.0);
        uint _1428 = uint(_1426);
        uint _1430 = clamp(_1428, 0u, 65535u);
        _1422 = as_type<float>(_1430);
    }
    float _1432 = _1422;
    float _1434 = _1380 * 0.693147182464599609375;
    float _1436 = _1408 * _1102;
    float _1438 = _1410 * _1404;
    float _1440 = _1420 * _1404;
    float _1442 = _1434 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1444 = fma(_1438, 0.5, 0.5);
    float _1446 = fma(_1440, -0.5, 0.5);
    float _1448 = _1320;
    if (!_822)
    {
        float3 _4731 = float3(_1418, _1394, float(as_type<int>(_1320)));
        float3 _4735 = select(_4731, float3(0.0), isnan(_4731));
        float _1450 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4735.xy, uint(rint(_4735.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4735.xy, uint(rint(_4735.z)), level(0.0)).x;
        _1448 = _1450;
    }
    float _1452 = _1448;
    float _1454 = _1440;
    float _1456 = _1432;
    if (_1362)
    {
        float3 _4751 = float3(_1302, _1332, float(as_type<int>(_1432)));
        float3 _4753 = select(_4751, float3(0.0), isnan(_4751));
        float _1458 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4753.xy, uint(rint(_4753.z)), _1436, level(0.0));
        _1454 = _1458;
    }
    float _1460 = _1454;
    float3 _4763 = float3(_1444, _1446, _1442);
    float _1462 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4763, float3(0.0), isnan(_4763)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4763, float3(0.0), isnan(_4763)), level(0.0)).x;
    float3 _4772 = float3(_1444, _1446, _1442);
    float4 _1465 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4772, float3(0.0), isnan(_4772)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4772, float3(0.0), isnan(_4772)), level(0.0)).xyzw;
    float _1467 = _1465.x;
    float _1469 = _1465.y;
    float _1471 = _1465.z;
    float _1473 = _1465.w;
    bool _1475 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1477 = isnan(0.5);
    bool _1479 = _1475 || _1477;
    bool _1481 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1483 = _1479 || _1481;
    if (_822)
    {
        _1412 = 1.0;
    }
    float _1485 = _1412;
    float _1487 = _1485;
    if (_1483)
    {
        _1108 = 1.0;
    }
    float _1489 = _1108;
    float _1491 = _1489;
    float _1493 = _1452;
    float _1495 = _1471;
    float _1497 = _1473;
    if (!_1483)
    {
        float _1499 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1501 = _1499 * 0.15915493667125701904296875;
        float _1503 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1505 = _1501 * 6.283185482025146484375;
        float _1507 = cos(_1505);
        float _1509 = _1503 * 0.15915493667125701904296875;
        float _1511 = _1501 * 6.283185482025146484375;
        float _1513 = sin(_1511);
        float _1515 = 1.0 / _1507;
        float _1517 = _1509 * 6.283185482025146484375;
        float _1519 = cos(_1517);
        float _1521 = _1513 * _1515;
        float _1523 = _1509 * 6.283185482025146484375;
        float _1525 = sin(_1523);
        float _1527 = _1519 * _1521;
        float _1529 = 1.0 / _1527;
        float _1531 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1533 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1531;
        float _1535 = 1.0 / _1533;
        float _1537 = _1525 * _1529;
        float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1541 = fma(_669, _1537, _1539);
        float _1543 = _1541 * _1535;
        float _1545 = precise::clamp(_1543, 0.0, 1.0);
        float _1547 = -_1545;
        float _1549 = _1547 + 1.0;
        _1456 = _1527;
        _1491 = _1549;
    }
    float _1551 = _1456;
    float _1553 = _1491;
    float _1555 = _1551;
    if (!_822)
    {
        int _1557 = _876 << 4;
        int _1559 = _1557 + 2048;
        uint _1561 = uint(int(uint(_1559) >> uint(2)));
        uint _1563 = uint(int(uint(int(_1561)) >> uint(2)));
        int _1565 = int(_1561) & 3;
        float _1567 = (*spvDescriptorSet0.vp_c15)._m0[int(_1563)][_1565];
        int _1569 = int(_1561) + 1;
        uint _1571 = uint(int(uint(_1569) >> uint(2)));
        int _1573 = _1569 & 3;
        float _1575 = (*spvDescriptorSet0.vp_c15)._m0[int(_1571)][_1573];
        int _1577 = _1559 + 8;
        uint _1579 = uint(int(uint(_1577) >> uint(2)));
        uint _1581 = uint(int(uint(int(_1579)) >> uint(2)));
        int _1583 = int(_1579) & 3;
        float _1585 = (*spvDescriptorSet0.vp_c15)._m0[int(_1581)][_1583];
        int _1587 = int(_1579) + 1;
        uint _1589 = uint(int(uint(_1587) >> uint(2)));
        int _1591 = _1587 & 3;
        float _1593 = (*spvDescriptorSet0.vp_c15)._m0[int(_1589)][_1591];
        float _1595 = _643 * _1575;
        float _1597 = fma(_563, _1567, _1595);
        float _1599 = fma(_561, _1585, _1597);
        float _1601 = _1599 + _1593;
        float _1603 = precise::clamp(_1601, 0.0, 1.0);
        float _1605 = -_1603;
        float _1607 = _1605 + _1452;
        float _1609 = fma(_1607, 500.0, 1.5);
        float _1611 = exp2(_1609);
        float _1613 = 0.0 + _1611;
        float _1615 = precise::clamp(_1613, 0.0, 1.0);
        _1555 = _1585;
        _1487 = _1615;
    }
    float _1617 = _1555;
    float _1619 = _1487;
    float _1621 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1623 = _1288 + _1621;
    float _1625 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1627 = _1290 + _1625;
    float _1629 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1631 = _1292 + _1629;
    float _1633 = _1623 * _1623;
    float _1635 = fma(_1627, _1627, _1633);
    float _1637 = fma(_1631, _1631, _1635);
    float _1639 = rsqrt(_1637);
    float _1641 = _1639 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1643 = _1627 * _1641;
    float _1645 = _1631 * _1641;
    float _1647 = _1643 * _1643;
    float _1649 = _1645 * _1645;
    float _1651 = _1647 + _1649;
    float _1653 = sqrt(_1651);
    bool _1655 = _1653 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1657 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1659 = _1653 + _1657;
    float _1661 = _1631;
    float _1663 = _1617;
    float _1665 = _1659;
    float _1667 = _1623;
    if (_1655)
    {
        float _1669 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1661 = _1669;
    }
    float _1671 = _1661;
    if (_1655)
    {
        float _1673 = rsqrt(_1651);
        _1663 = _1673;
    }
    float _1675 = _1663;
    float _1677 = _1675;
    if (_1655)
    {
        float _1679 = _1659 * _1671;
        _1665 = _1679;
    }
    float _1681 = _1665;
    if (_1655)
    {
        float _1683 = _1681 * 0.15915493667125701904296875;
        _1493 = _1683;
    }
    float _1685 = _1493;
    float _1687 = _1639;
    if (_1655)
    {
        float _1689 = _1685 * 6.283185482025146484375;
        float _1691 = sin(_1689);
        _1687 = _1691;
    }
    float _1693 = _1687;
    float _1695 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1697 = precise::max(0.0, _1695);
    float _1699 = _1633;
    float _1701 = _1697;
    float _1703 = _1695;
    if (_1655)
    {
        float _1705 = _1685 * 6.283185482025146484375;
        float _1707 = cos(_1705);
        _1699 = _1707;
    }
    float _1709 = _1699;
    float _1711 = -_1641;
    float _1713 = -_1697;
    float _1715 = fma(_1623, _1711, _1713);
    if (_1655)
    {
        float _1717 = _1715 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1701 = _1717;
    }
    float _1719 = _1701;
    float _1721 = _1719;
    float _1723 = _1693;
    if (_1655)
    {
        float _1725 = fma(_1693, _1719, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1721 = _1725;
    }
    float _1727 = _1721;
    float _1729 = _1727;
    if (!_1655)
    {
        _1723 = _1643;
    }
    float _1731 = _1723;
    float _1733 = _1731;
    float _1735 = _1709;
    if (_1655)
    {
        float _1737 = _1709 + (-1.0);
        _1703 = _1737;
    }
    float _1739 = _1703;
    float _1741 = _1739;
    if (_1655)
    {
        float _1743 = _1675 * _1727;
        _1014 = _1743;
    }
    float _1745 = _1014;
    if (!_1655)
    {
        _1729 = _1715;
    }
    float _1747 = _1729;
    float _1749 = _1747;
    if (_1655)
    {
        float _1751 = _1739 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1667 = _1751;
    }
    float _1753 = _1667;
    if (_1655)
    {
        float _1755 = _1643 * _1745;
        _1733 = _1755;
    }
    float _1757 = _1733;
    if (!_1655)
    {
        _1741 = _1645;
    }
    float _1759 = _1741;
    float _1761 = _1759;
    if (_1655)
    {
        float _1763 = _1645 * _1745;
        _1761 = _1763;
    }
    float _1765 = _1761;
    if (!_1655)
    {
        _1677 = _1647;
    }
    float _1767 = _1677;
    float _1769 = _1767;
    if (_1655)
    {
        float _1771 = fma(_1715, _1709, _1753);
        _1749 = _1771;
    }
    float _1773 = _1749;
    if (_1655)
    {
        float _1775 = _1757 * _1757;
        _1769 = _1775;
    }
    float _1777 = _1769;
    if (!_1655)
    {
        _1735 = _1649;
    }
    float _1779 = _1735;
    float _1781 = sqrt(_1637);
    float _1783 = _1779;
    if (_1655)
    {
        float _1785 = _1765 * _1765;
        _1783 = _1785;
    }
    float _1787 = _1783;
    float _1789 = fma(_1773, _1773, _1777);
    float _1791 = _1789 + _1787;
    float _1793 = rsqrt(_1791);
    float _1795 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1797 = fma(_1781, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1795);
    float _1799 = precise::clamp(_1797, 0.0, 1.0);
    float _1801 = -_1799;
    float _1803 = _1801 + 1.0;
    float _1805 = abs(_1803);
    float _1807 = log2(_1805);
    float _1809 = _1793 * _1757;
    float _1811 = _1793 * _1773;
    float _1813 = _1793 * _1765;
    float _1815 = _1809 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1817 = -_1815;
    float _1819 = fma(_1811, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1817);
    float _1821 = -_1813;
    float _1823 = fma(_1821, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1819);
    float _1825 = _1807 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1827 = fma(_1823, -0.5, 0.5);
    float _1829 = fma(_1823, 0.5, 0.5);
    float _1831 = exp2(_1825);
    float _1833 = fma(_1829, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1835 = fma(_1829, _1833, -0.212114393711090087890625);
    float _1837 = _1811 + 1.0;
    float _1839 = sqrt(_1827);
    float _1841 = fma(_1829, _1835, 1.570728778839111328125);
    float _1843 = -_1811;
    float _1845 = fma(_1831, _1837, _1843);
    float _1847 = fma(_1845, 0.5, 0.5);
    float _1849 = _1839 * 0.636619746685028076171875;
    float _1851 = -_1841;
    float _1853 = fma(_1849, _1851, 1.0);
    float2 _5349 = float2(_1853, _1847);
    float3 _1857 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5349, float2(0.0), isnan(_5349)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5349, float2(0.0), isnan(_5349)), level(0.0)).xyz;
    float _1859 = _1857.x;
    float _1861 = _1857.y;
    float _1863 = _1857.z;
    float _1865 = abs(_669);
    float _1867 = log2(_1865);
    float _1869 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1871 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1873 = _1871 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1875 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1877 = _1875 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1879 = _537 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1881 = isnan(_537);
    bool _1883 = _1879 || _1881;
    bool _1885 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1887 = _1883 || _1885;
    float _1889 = float(_1887);
    float _1891 = 1.0 / _1873;
    float _1893 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1895 = _1893 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1897 = _537 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1899 = isnan(_537);
    bool _1901 = _1897 || _1899;
    bool _1903 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1905 = _1901 || _1903;
    float _1907 = float(_1905);
    float _1909 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1911 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1909;
    float _1913 = -_1889;
    float _1915 = _1913 + 1.0;
    bool _1917 = _537 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1919 = isnan(_537);
    bool _1921 = _1917 || _1919;
    bool _1923 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1925 = _1921 || _1923;
    float _1927 = float(_1925);
    float _1929 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1869);
    float _1931 = 1.0 / _1877;
    float _1933 = _1907 * _1915;
    float _1935 = -_1907;
    float _1937 = _1935 + 1.0;
    float _1939 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1941 = _1939 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1943 = _1867 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1945 = _1807 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1947 = _1927 * _1937;
    float _1949 = -_1927;
    float _1951 = _1949 + 1.0;
    float _1953 = 1.0 / _1895;
    float _1955 = _1911 * _1891;
    float _1957 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1959 = _537 + _1957;
    float _1961 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1929);
    bool _1963 = _669 <= 8000.0;
    bool _1965 = isnan(_669);
    bool _1967 = _1963 || _1965;
    bool _1969 = isnan(8000.0);
    bool _1971 = _1967 || _1969;
    float _1973 = float(_1971);
    float _1975 = fma(_1955, _1959, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1977 = _537 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1979 = isnan(_537);
    bool _1981 = _1977 || _1979;
    bool _1983 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1985 = _1981 || _1983;
    float _1987 = float(_1985);
    float _1989 = _1941 * _1931;
    float _1991 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1993 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1991;
    float _1995 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1997 = _537 + _1995;
    float _1999 = _1975 * _1947;
    float _2001 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2003 = _537 + _2001;
    float _2005 = -_1987;
    float _2007 = _2005 + 1.0;
    float _2009 = fma(_1989, _1997, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2011 = fma(_1951, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1999);
    float _2013 = _1993 * _1953;
    float _2015 = exp2(_1943);
    float _2017 = fma(_2009, _1933, _2011);
    float _2019 = fma(_2013, _2003, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _2021 = _1889 * _2007;
    float _2023 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2025 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2027 = fma(_2019, _2021, _2017);
    float _2029 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2031 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2033 = _2025 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2035 = _2029 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2037 = fma(_1987, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2027);
    float _2039 = _2031 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2041 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2043 = exp2(_1945);
    float _2045 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1961);
    float _2047 = as_type<float>(_223) * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_80.x = _2033;
    out.m_80.y = _2035;
    out.m_80.z = _2039;
    out.m_80.w = _2023;
    float _2049 = -_581;
    float _2051 = _2049 + 1.0;
    float _2053 = _2045 + _1378;
    float _2055 = as_type<float>(_237) * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2057 = _2047 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2059 = _2047 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2061 = _2047 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2063 = fma(_2055, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2057);
    float _2065 = fma(_2055, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2059);
    float _2067 = fma(_2055, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2061);
    float _2069 = _2053 * 0.5;
    bool _2071 = _1781 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2073 = isnan(_1781);
    bool _2075 = _2071 || _2073;
    bool _2077 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2079 = _2075 || _2077;
    float _2081 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2083 = _2037 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2085 = _2041 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2087 = fma(_2015, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2089 = precise::clamp(_2087, 0.0, 1.0);
    float _2091 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2093 = _2081 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_82.z = _2069;
    out.m_82.w = _1378;
    float _2095 = fma(_2089, -2.0, 3.0);
    float _2097 = _2089 * _2089;
    float _2099 = _2091 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.gl_Position.x = _1410;
    out.gl_Position.y = _1420;
    out.gl_Position.z = _2045;
    out.gl_Position.w = _1378;
    float _2101 = _2097 * _2095;
    out.m_84.x = _2085;
    out.m_84.y = _2093;
    out.m_84.z = _2099;
    out.m_84.w = _2083;
    float _2103 = -_2101;
    float _2105 = _2103 + 1.0;
    float _2107 = fma(_2105, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2101);
    float _2109 = _1973 * _2107;
    float _2111 = -_2043;
    float _2113 = _2111 + 1.0;
    float _2115 = _1410;
    float _2117 = _2063;
    float _2119 = _2065;
    if (!_1362)
    {
        _2115 = 1.0;
    }
    float _2121 = _2115;
    float _2123 = _1553 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2125 = _2109 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2127 = _2121;
    float _2129 = _2123;
    if (_1362)
    {
        bool _2131 = _1460 >= _1436;
        bool _2133 = isnan(_1460);
        bool _2135 = _2131 || _2133;
        bool _2137 = isnan(_1436);
        bool _2139 = _2135 || _2137;
        float _2141 = float(_2139);
        _2127 = _2141;
    }
    float _2143 = _2127;
    float _2145 = _2113 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2147 = _2051 * _2125;
    float _2149 = precise::clamp(_2147, 0.0, 1.0);
    float _2151 = _2145 * _1462;
    float _2153 = _2143 * _1619;
    float _2155 = -_2149;
    float _2157 = fma(_2155, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2159 = -_2145;
    float _2161 = _2159 + 1.0;
    float _2163 = _1473 * _2151;
    float _2165 = _315 * _2123;
    float _2167 = -_2153;
    float _2169 = fma(_2167, _2157, 1.0);
    float _2171 = precise::clamp(_2169, 0.0, 1.0);
    if (!_2079)
    {
        _319 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2173 = _319;
    float _2175 = _2173;
    float _2177 = _2173;
    if (!_2079)
    {
        _2129 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2179 = _2129;
    float _2181 = _2171 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2183 = _2063 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2185 = _2179;
    float _2187 = _2179;
    if (!_2079)
    {
        _2117 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2189 = _2117;
    out.m_86.x = _2181;
    float _2191 = _1863 * _2151;
    float _2193 = fma(_1861, _2163, _1469);
    float _2195 = fma(_1859, _2163, _1467);
    float _2197 = _1473 * _2161;
    float _2199 = fma(_1473, _2191, _1471);
    float _2201 = _2065 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2203 = _2067 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2205 = _2189;
    float _2207 = _2189;
    if (!_2079)
    {
        _1495 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2209 = _1495;
    out.m_88.x = _2195;
    out.m_88.y = _2193;
    out.m_88.z = _2199;
    out.m_88.w = _2197;
    float _2211 = _2209;
    float _2213 = _2209;
    if (!_2079)
    {
        _1497 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2215 = _1497;
    float _2217 = _2215;
    float _2219 = _2215;
    if (!_2079)
    {
        _2119 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2221 = _2119;
    out.m_90.x = _2183;
    out.m_90.y = _2201;
    out.m_90.z = _2203;
    bool _2223 = !_2079;
    float _2225 = _2221;
    float _2227 = _2221;
    if (!_2223)
    {
        bool _2229 = _1781 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2231 = isnan(_1781);
        bool _2233 = _2229 || _2231;
        bool _2235 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2237 = _2233 || _2235;
        if (!_2237)
        {
            float _2239 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2241 = _1781 + _2239;
            float _2243 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2245 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2243;
            float _2247 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2249 = _2247 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2251 = 1.0 / _2245;
            float _2253 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2255 = _2253 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2257 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2259 = _2257 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2261 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2263 = _2261 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2265 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2267 = _2265 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2269 = _2241 * _2251;
            float _2271 = precise::clamp(_2269, 0.0, 1.0);
            float _2273 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2275 = _2273 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2277 = fma(_2271, _2249, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2279 = fma(_2271, _2275, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2281 = fma(_2271, _2255, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2283 = fma(_2271, _2259, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2285 = fma(_2271, _2263, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2287 = fma(_2271, _2267, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2219 = _2281;
            _2227 = _2285;
            _2213 = _2277;
            _2207 = _2283;
            _2177 = _2279;
            _2187 = _2287;
            _2289 = true;
        }
        else
        {
            bool _2291 = _1781 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2293 = isnan(_1781);
            bool _2295 = _2291 || _2293;
            bool _2297 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2299 = _2295 || _2297;
            if (!_2299)
            {
                _2211 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2301 = _2211;
            _2213 = _2301;
            if (!_2299)
            {
                _2217 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2303 = _2217;
            _2219 = _2303;
            if (!_2299)
            {
                _2175 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2305 = _2175;
            _2177 = _2305;
            if (!_2299)
            {
                _2205 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2307 = _2205;
            _2207 = _2307;
            if (!_2299)
            {
                _2225 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2309 = _2225;
            _2227 = _2309;
            if (!_2299)
            {
                _2185 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2311 = _2185;
            bool _2313 = !_2299;
            _2187 = _2311;
            if (!_2313)
            {
                bool _2315 = _1781 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2317 = isnan(_1781);
                bool _2319 = _2315 || _2317;
                bool _2321 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2323 = _2319 || _2321;
                if (!_2323)
                {
                    float _2325 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2327 = _1781 + _2325;
                    float _2329 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2331 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2329;
                    float _2333 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2335 = _2333 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2337 = 1.0 / _2331;
                    float _2339 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2341 = _2339 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2343 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2345 = _2343 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2347 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2349 = _2347 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2351 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2353 = _2351 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2355 = _2327 * _2337;
                    float _2357 = precise::clamp(_2355, 0.0, 1.0);
                    float _2359 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2361 = _2359 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2363 = fma(_2357, _2335, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2365 = fma(_2357, _2361, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2367 = fma(_2357, _2341, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2369 = fma(_2357, _2345, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2371 = fma(_2357, _2349, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2373 = fma(_2357, _2353, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2219 = _2367;
                    _2227 = _2371;
                    _2213 = _2363;
                    _2207 = _2369;
                    _2177 = _2365;
                    _2187 = _2373;
                    _2289 = true;
                }
                else
                {
                    _2219 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2227 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2213 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2207 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2177 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2187 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2289 = false;
    float _2375 = _2219;
    float _2377 = _2227;
    float _2379 = _2213;
    float _2381 = _2207;
    float _2383 = _2177;
    float _2385 = _2187;
    float _2387 = fma(_2201, -0.5, 0.5);
    float _2389 = precise::clamp(_2387, 0.0, 1.0);
    float _2391 = -_2375;
    float _2393 = _2391 + _2377;
    float _2395 = _2165 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2397 = -_2379;
    float _2399 = _2397 + _2381;
    float _2401 = fma(_2389, _2393, _2375);
    out.m_92.x = 0.0;
    float _2403 = -_2383;
    float _2405 = _2403 + _2385;
    float _2407 = fma(_2389, _2399, _2379);
    float _2409 = _2401 * 0.586610972881317138671875;
    out.m_59.x = _2395;
    bool _2411 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2413 = fma(_2389, _2405, _2383);
    float _2415 = fma(_2407, 0.298911988735198974609375, _2409);
    bool _2417 = _1553 > 0.0;
    bool _2419 = isnan(_1553);
    bool _2421 = _2417 || _2419;
    bool _2423 = isnan(0.0);
    bool _2425 = _2421 || _2423;
    float _2427 = fma(_2413, 0.114477999508380889892578125, _2415);
    float _2429 = -_2427;
    float _2431 = _2407 + _2429;
    float _2433 = -_2427;
    float _2435 = _2401 + _2433;
    float _2437 = -_2427;
    float _2439 = _2413 + _2437;
    float _2441 = fma(_2431, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2427);
    float _2443 = fma(_2435, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2427);
    float _2445 = fma(_2439, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2427);
    bool _2447 = !_2411;
    if (!_2447)
    {
        float _2449 = -_1288;
        float _2451 = _2449 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2453 = -_1290;
        float _2455 = _2453 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2457 = -_1292;
        float _2459 = _2457 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2461 = _2451 * _2451;
        float _2463 = fma(_2455, _2455, _2461);
        float _2465 = fma(_2459, _2459, _2463);
        float _2467 = sqrt(_2465);
        float _2469 = rsqrt(_2465);
        float _2471 = -_2467;
        float _2473 = _2471 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2475 = _2473 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2477 = precise::clamp(_2475, 0.0, 1.0);
        float _2479 = _2455 * _2469;
        float _2481 = _2451 * _2469;
        float _2483 = abs(_2477);
        float _2485 = log2(_2483);
        float _2487 = _2459 * _2469;
        float _2489 = _2479 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2491 = _2201 * _2481;
        float _2493 = -_2481;
        float _2495 = -_2489;
        float _2497 = fma(_2493, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2495);
        float _2499 = fma(_2183, _2479, _2491);
        float _2501 = -_2487;
        float _2503 = fma(_2501, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2497);
        float _2505 = fma(_2203, _2487, _2499);
        float _2507 = precise::clamp(_2505, 0.0, 1.0);
        float _2509 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2511 = _2503 + _2509;
        float _2513 = _2485 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2515 = _2511 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2517 = precise::clamp(_2515, 0.0, 1.0);
        float _2519 = exp2(_2513);
        float _2521 = _2519 * _2517;
        float _2523 = _2507 * _2521;
        float _2525 = _2523 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2527 = _2523 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2529 = _2523 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _2525;
        out.m_92.y = _2527;
        out.m_92.z = _2529;
    }
    out.m_94.x = _2441;
    out.m_94.y = _2443;
    out.m_94.z = _2445;
    if (_2425)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_59.x = 0.0;
    float _2531 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2531;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2289 = false;
    bool _529 = false;
    bool _337 = false;
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
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2588 = as_type<float>(_129);
        out.gl_Position.z = _2588;
    }
    if (!_117)
    {
        return out;
    }
    float _133 = in.m_61.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_143)
    {
        float _149 = float(_113);
        _123 = _149;
    }
    float _151 = _123;
    bool _153 = _147 >= _151;
    bool _155 = !_143;
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
        _131 = as_type<int>(_163);
    }
    int _165 = _131;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2657 = as_type<float>(_165);
        out.gl_Position.z = _2657;
    }
    if (_157)
    {
        return out;
    }
    float _167 = in.m_63.x;
    float _169 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _171 = _147 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _173 = as_type<float>(int(gl_VertexIndex));
    float _175 = in.m_68.x;
    float _177 = in.m_68.y;
    float _179 = in.m_68.z;
    float _181 = in.m_70.x;
    float _183 = in.m_70.y;
    float _185 = in.m_70.z;
    float _187 = in.m_72.x;
    float _189 = in.m_72.y;
    float _191 = in.m_72.z;
    float _193 = _171 * _169;
    float _195 = in.m_74.x;
    float _197 = in.m_74.y;
    float _199 = in.m_74.z;
    float _201 = fma(_167, (*spvDescriptorSet0.vp_c9)._m0[20].x, _193);
    int _203 = as_type<int>(_173) & 1;
    bool _205 = _203 != 0;
    int _207 = as_type<int>(_173) & 2;
    bool _209 = _207 != 0;
    float _211 = _201 * 6.283185482025146484375;
    float _213 = floor(_201);
    int _215 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _217 = _215 != 0;
    float _219 = _211 * 0.15915493667125701904296875;
    bool _221 = !_209;
    int _223 = _221 ? (-1090519040) : 1056964608;
    int _225 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _227 = _225 != 0;
    int _229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _231 = _229 != 0;
    float _233 = _177 * _183;
    bool _235 = !_205;
    int _237 = _235 ? (-1090519040) : 1056964608;
    float _239 = _219 * 6.283185482025146484375;
    float _241 = cos(_239);
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _245 = fma(_175, _181, _233);
    bool _247 = !_227;
    int _249 = _247 ? 0 : 1;
    out.m_76.x = as_type<float>(_237);
    out.m_76.y = as_type<float>(_223);
    bool _251 = !_217;
    int _253 = _251 ? 0 : 1;
    float _255 = -_213;
    float _257 = _201 + _255;
    int _259 = abs(_249);
    float _261 = _177 * _189;
    int _263 = abs(_253);
    float _265 = -_257;
    float _267 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _269 = _177 * _197;
    bool _271 = !_231;
    int _273 = _271 ? 0 : 1;
    float _275 = fma(_175, _187, _261);
    float _277 = float(_259);
    float _279 = fma(_241, 0.5, 0.5);
    bool _281 = _257 < 0.5;
    float _283 = float(_281);
    float _285 = fma(_175, _195, _269);
    int _287 = abs(_273);
    float _289 = abs(_267);
    float _291 = _277 * _289;
    float _293 = float(_263);
    float _295 = -_279;
    float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _299 = -_283;
    float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _303 = float(_287);
    float _305 = fma(_293, _297, _291);
    float _307 = fma(_179, _191, _275);
    float _309 = fma(_179, _185, _245);
    float _311 = fma(_179, _199, _285);
    float _313 = abs(_301);
    float _315 = fma(_303, _313, _305);
    bool _317 = !_243;
    float _319 = _315;
    float _335;
    if (!_317)
    {
        float _321 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _323 = _167 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _325 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _327 = _325 * _321;
        float _329 = floor(_327);
        float _331 = -_329;
        float _333 = _327 + _331;
        _335 = _333;
        _337 = true;
    }
    else
    {
        float _339 = float(_113);
        float _341 = 1.0 / _339;
        float _343 = _147 * _341;
        _335 = _343;
    }
    _337 = false;
    float _345 = _335;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _349 = _345 + _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _353 = _345 + _351;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _357 = _345 + _355;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _359;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _367;
    bool _371 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _373 = isnan(_345);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = 1.0 / _361;
    bool _385 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _387 = 1.0 / _369;
    float _389 = 1.0 / _365;
    float _391 = _349 * _383;
    bool _393 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _395 = isnan(_345);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = -_381;
    float _407 = _405 + 1.0;
    bool _409 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _411 = isnan(_345);
    bool _413 = _409 || _411;
    bool _415 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _417 = _413 || _415;
    float _419 = float(_417);
    float _421 = _403 * _407;
    float _423 = _353 * _387;
    float _425 = -_403;
    float _427 = _425 + 1.0;
    float _429 = _419 * _427;
    float _431 = -_419;
    float _433 = _431 + 1.0;
    float _435 = _357 * _389;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _441 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _443 = isnan(_345);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _453;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _465 = fma(_455, _391, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _467 = _451 * _433;
    float _469 = fma(_459, _391, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _471 = fma(_439, _435, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _473 = fma(_463, _435, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _475 = -_451;
    float _477 = _475 + 1.0;
    float _479 = _465 * _467;
    float _481 = _469 * _467;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _483;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _487;
    float _491 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[143].x, _479);
    float _493 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[143].y, _481);
    float _495 = fma(_485, _423, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _497 = fma(_489, _423, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _499 = fma(_471, _429, _491);
    float _501 = fma(_473, _429, _493);
    float _503 = fma(_497, _421, _499);
    float _505 = fma(_495, _421, _501);
    float _507 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[146].x, _503);
    float _509 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[146].y, _505);
    bool _511 = !_385;
    float _527;
    if (!_511)
    {
        float _513 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _515 = _167 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _517 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[11].y, _147);
        float _519 = _517 * _513;
        float _521 = floor(_519);
        float _523 = -_521;
        float _525 = _519 + _523;
        _527 = _525;
        _529 = true;
    }
    else
    {
        float _531 = float(_113);
        float _533 = 1.0 / _531;
        float _535 = _147 * _533;
        _527 = _535;
    }
    _529 = false;
    float _537 = _527;
    float _539 = in.m_56.x;
    float _541 = in.m_56.y;
    float _543 = in.m_56.z;
    float _545 = in.m_74.w;
    float _547 = in.m_72.w;
    float _549 = _197 * _541;
    float _551 = _189 * _541;
    float _553 = fma(_195, _539, _549);
    float _555 = fma(_187, _539, _551);
    float _557 = fma(_199, _543, _553);
    float _559 = fma(_191, _543, _555);
    float _561 = _557 + _545;
    float _563 = _559 + _547;
    float _565 = fma(_561, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _567 = fma(_563, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _569 = floor(_565);
    float _571 = floor(_567);
    float _573 = -_569;
    float _575 = _565 + _573;
    float _577 = -_571;
    float _579 = _567 + _577;
    float2 _3290 = float2(_579, _575);
    float _581 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3290, float2(0.0), isnan(_3290)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3290, float2(0.0), isnan(_3290)), level(0.0)).x;
    float _583 = in.m_70.w;
    float _585 = _183 * _541;
    float _587 = fma(_181, _539, _585);
    float _589 = in.m_78.x;
    float _591 = in.m_78.y;
    float _593 = fma(_185, _543, _587);
    float _595 = _593 + _583;
    float _597 = _595 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _599 = _507 * _589;
    float _601 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[11].x, _597);
    float _603 = _509 * _591;
    float _605 = fma(_561, (*spvDescriptorSet0.vp_c8)._m0[11].z, _601);
    float _607 = _595 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _609 = _603 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _611 = _605 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _613 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[10].x, _607);
    float _615 = 1.0 / _611;
    float _617 = fma(_561, (*spvDescriptorSet0.vp_c8)._m0[10].z, _613);
    float _619 = _617 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _621 = _619 + _611;
    float _623 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_237));
    float _625 = _621 * _615;
    float _627 = _625 * 0.5;
    float _629 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_223));
    float _631 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _633 = fma(_627, (*spvDescriptorSet0.vp_c8)._m0[30].w, _631);
    float _635 = _599 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _637 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _639 = 1.0 / _633;
    float _641 = _635 * _623;
    float _643 = _595 + _637;
    float _645 = _609 * _629;
    float _647 = _643 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _649 = _645 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _651 = _645 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _653 = _643 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _655 = fma(_563, (*spvDescriptorSet0.vp_c15)._m0[127].x, _647);
    float _657 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[26].x, _649);
    float _659 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[24].x, _651);
    float _661 = fma(_563, (*spvDescriptorSet0.vp_c15)._m0[126].x, _653);
    float _663 = fma(_561, (*spvDescriptorSet0.vp_c15)._m0[127].z, _655);
    float _665 = _645 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _667 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _669 = _639 * _667;
    float _671 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _673 = fma(_561, (*spvDescriptorSet0.vp_c15)._m0[126].z, _661);
    float _675 = _663 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _677 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[25].x, _665);
    bool _679 = _669 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _681 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[26].z, _657);
    bool _683 = _669 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _685 = _673 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _687 = !_679;
    int _689 = _687 ? 0 : 1;
    float _691 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[24].z, _659);
    float _693 = _681 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _695 = trunc(_685);
    int _697 = int(_695);
    float _699 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[25].z, _677);
    float _701 = _691 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _703 = _561 + _693;
    float _705 = _699 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _707 = 2;
    int _709 = as_type<int>(_641);
    float _711 = _703;
    if (!_679)
    {
        _707 = 1;
    }
    int _713 = _707;
    float _715 = _563 + _701;
    int _717 = _713;
    float _719 = _715;
    if (!_683)
    {
        _717 = _689;
    }
    int _721 = _717;
    float _723 = trunc(_675);
    int _725 = int(_723);
    float _727 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _729 = _703 + _727;
    float _731 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _733 = _715 + _731;
    int _735 = _721 << 6;
    float _737 = _595 + _705;
    float _739 = _729 * _729;
    int _741 = _735 + 48;
    uint _744 = uint(int(uint(_741) >> uint(2)));
    uint _746 = uint(int(uint(int(_744)) >> uint(2)));
    int _748 = int(_744) & 3;
    float _750 = (*spvDescriptorSet0.vp_c15)._m0[int(_746)][_748];
    int _752 = int(_744) + 1;
    uint _754 = uint(int(uint(_752) >> uint(2)));
    int _756 = _752 & 3;
    float _758 = (*spvDescriptorSet0.vp_c15)._m0[int(_754)][_756];
    int _760 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _762 = _697 + _760;
    int _764 = _762 + 1;
    float _766 = fma(_733, _733, _739);
    bool _768 = _764 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _770 = sqrt(_766);
    int _772 = _735 + 56;
    uint _774 = uint(int(uint(_772) >> uint(2)));
    uint _776 = uint(int(uint(int(_774)) >> uint(2)));
    int _778 = int(_774) & 3;
    float _780 = (*spvDescriptorSet0.vp_c15)._m0[int(_776)][_778];
    int _782 = int(_774) + 1;
    uint _784 = uint(int(uint(_782) >> uint(2)));
    int _786 = _782 & 3;
    float _788 = (*spvDescriptorSet0.vp_c15)._m0[int(_784)][_786];
    int _790 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _792 = _725 + _790;
    int _794 = _792 + 1;
    int _796 = _764 | _794;
    int _798 = _735 + 64;
    uint _800 = uint(int(uint(_798) >> uint(2)));
    uint _802 = uint(int(uint(int(_800)) >> uint(2)));
    int _804 = int(_800) & 3;
    float _806 = (*spvDescriptorSet0.vp_c15)._m0[int(_802)][_804];
    int _808 = int(_800) + 1;
    uint _810 = uint(int(uint(_808) >> uint(2)));
    int _812 = _808 & 3;
    float _814 = (*spvDescriptorSet0.vp_c15)._m0[int(_810)][_812];
    bool _816 = _796 < 0;
    bool _818 = _816 || _768;
    bool _820 = _794 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _822 = _820 || _818;
    bool _824 = _770 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _826 = _735 + 72;
    uint _828 = uint(int(uint(_826) >> uint(2)));
    uint _830 = uint(int(uint(int(_828)) >> uint(2)));
    int _832 = int(_828) & 3;
    float _834 = (*spvDescriptorSet0.vp_c15)._m0[int(_830)][_832];
    int _836 = int(_828) + 1;
    uint _838 = uint(int(uint(_836) >> uint(2)));
    int _840 = _836 & 3;
    float _842 = (*spvDescriptorSet0.vp_c15)._m0[int(_838)][_840];
    int _844 = _735 + 96;
    uint _846 = uint(int(uint(_844) >> uint(2)));
    uint _848 = uint(int(uint(int(_846)) >> uint(2)));
    int _850 = int(_846) & 3;
    float _852 = (*spvDescriptorSet0.vp_c15)._m0[int(_848)][_850];
    int _854 = int(_846) + 1;
    uint _856 = uint(int(uint(_854) >> uint(2)));
    int _858 = _854 & 3;
    float _860 = (*spvDescriptorSet0.vp_c15)._m0[int(_856)][_858];
    float _862 = as_type<float>(_796);
    int _864 = _794;
    int _866 = _764;
    float _868 = _770;
    float _870 = as_type<float>(_721);
    if (!_822)
    {
        int _872 = _794 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _874 = _872 + _764;
        _709 = _874;
    }
    int _876 = _709;
    if (!_824)
    {
        _862 = _737;
    }
    float _878 = _862;
    float _880 = _878;
    if (!_822)
    {
        int _882 = _876 << 2;
        _864 = _882;
    }
    int _884 = _864;
    int _886 = _735 + 104;
    uint _888 = uint(int(uint(_886) >> uint(2)));
    uint _890 = uint(int(uint(int(_888)) >> uint(2)));
    int _892 = int(_888) & 3;
    float _894 = (*spvDescriptorSet0.vp_c15)._m0[int(_890)][_892];
    int _896 = int(_888) + 1;
    uint _898 = uint(int(uint(_896) >> uint(2)));
    int _900 = _896 & 3;
    float _902 = (*spvDescriptorSet0.vp_c15)._m0[int(_898)][_900];
    int _904 = _884;
    if (!_822)
    {
        uint _906 = uint(int(uint(_876) >> uint(2)));
        _866 = int(_906);
    }
    int _908 = _866;
    float _910 = as_type<float>(_908);
    if (!_822)
    {
        int _912 = 12 & _884;
        _904 = _912;
    }
    int _914 = _904;
    bool _916 = !_824;
    float _918 = _750;
    float _920 = _806;
    if (!_916)
    {
        float _922 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _924 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _926 = _770 + _924;
        float _928 = _737 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _930 = rsqrt(_766);
        float _932 = _926 * _922;
        float _934 = _932 * 0.15915493667125701904296875;
        float _936 = _934 * 6.283185482025146484375;
        float _938 = sin(_936);
        float _940 = _934 * 6.283185482025146484375;
        float _942 = cos(_940);
        float _944 = fma(_938, _928, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _946 = _930 * _944;
        float _948 = _942 + (-1.0);
        float _950 = fma(_733, _946, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _952 = fma(_729, _946, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _954 = _948 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _956 = fma(_737, _942, _954);
        _880 = _956;
        _719 = _950;
        _711 = _952;
        _868 = _954;
    }
    float _958 = _880;
    float _960 = _719;
    float _962 = _711;
    float _964 = _868;
    float _966 = _964;
    float _968 = _960;
    float _970 = _958;
    float _972 = _962;
    if (!_822)
    {
        int _974 = _908 << 4;
        int _976 = _974 + _914;
        _966 = as_type<float>(_976);
    }
    float _978 = _966;
    float _980 = -_595;
    float _982 = _980 + _958;
    int _984 = _735 + 80;
    uint _986 = uint(int(uint(_984) >> uint(2)));
    uint _988 = uint(int(uint(int(_986)) >> uint(2)));
    int _990 = int(_986) & 3;
    float _992 = (*spvDescriptorSet0.vp_c15)._m0[int(_988)][_990];
    int _994 = int(_986) + 1;
    uint _996 = uint(int(uint(_994) >> uint(2)));
    int _998 = _994 & 3;
    float _1000 = (*spvDescriptorSet0.vp_c15)._m0[int(_996)][_998];
    float _1002 = -_563;
    float _1004 = _1002 + _960;
    float _1006 = -_561;
    float _1008 = _1006 + _962;
    float _1010 = _982 * _982;
    float _1012 = _643 * _860;
    float _1014 = _982;
    if (!_822)
    {
        float _1016 = floor(_685);
        _910 = _1016;
    }
    float _1018 = _910;
    float _1020 = _643 * _814;
    float _1022 = fma(_1004, _1004, _1010);
    int _1024 = _735 + 88;
    uint _1026 = uint(int(uint(_1024) >> uint(2)));
    uint _1028 = uint(int(uint(int(_1026)) >> uint(2)));
    int _1030 = int(_1026) & 3;
    float _1032 = (*spvDescriptorSet0.vp_c15)._m0[int(_1028)][_1030];
    int _1034 = int(_1026) + 1;
    uint _1036 = uint(int(uint(_1034) >> uint(2)));
    int _1038 = _1034 & 3;
    float _1040 = (*spvDescriptorSet0.vp_c15)._m0[int(_1036)][_1038];
    float _1042 = fma(_563, _852, _1012);
    float _1044 = fma(_563, _806, _1020);
    float _1046 = fma(_1008, _1008, _1022);
    float _1048 = fma(_561, _894, _1042);
    float _1050 = _643 * _758;
    float _1052 = sqrt(_1046);
    float _1054 = _978;
    float _1056 = _1044;
    if (!_822)
    {
        int _1058 = as_type<int>(_978) + 400;
        uint _1060 = uint(int(uint(_1058) >> uint(2)));
        uint _1062 = uint(int(uint(int(_1060)) >> uint(2)));
        int _1064 = int(_1060) & 3;
        float _1066 = (*spvDescriptorSet0.vp_c15)._m0[int(_1062)][_1064];
        _1054 = _1066;
    }
    float _1068 = _1054;
    float _1070 = _1048 + _902;
    float _1072 = fma(_563, _750, _1050);
    float _1074 = fma(_561, _834, _1044);
    bool _1076 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1078 = isnan(0.5);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1084 = _1080 || _1082;
    float _1086 = fma(_561, _780, _1072);
    float _1088 = _1010;
    float _1090 = _1072;
    if (!_822)
    {
        float _1092 = floor(_675);
        _1088 = _1092;
    }
    float _1094 = _1088;
    float _1096 = _1074 + _842;
    float _1098 = _1086 + _788;
    bool _1100 = _1052 > 0.0;
    float _1102 = 1.0 / _1070;
    bool _1104 = !_1100;
    float _1106 = _1094;
    float _1108 = _1102;
    if (!_1104)
    {
        float _1110 = _309 * _309;
        float _1112 = rsqrt(_1046);
        float _1114 = fma(_307, _307, _1110);
        float _1116 = fma(_311, _311, _1114);
        float _1118 = sqrt(_1116);
        float _1120 = _1004 * _1112;
        float _1122 = _982 * _1112;
        float _1124 = _1008 * _1112;
        bool _1126 = _1118 > 0.0;
        bool _1128 = !_1126;
        _918 = _1124;
        _920 = _1122;
        _1090 = _1110;
        if (!_1128)
        {
            float _1130 = rsqrt(_1116);
            float _1132 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1134 = _309 * _1130;
            float _1136 = _307 * _1130;
            float _1138 = _311 * _1130;
            float _1140 = _1122 * _1134;
            float _1142 = fma(_1120, _1136, _1140);
            float _1144 = _1132 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1146 = fma(_1124, _1138, _1142);
            float _1148 = _1146 * _1144;
            float _1150 = fma(_307, _1148, _960);
            float _1152 = fma(_309, _1148, _958);
            float _1154 = fma(_311, _1148, _962);
            _968 = _1150;
            _970 = _1152;
            _972 = _1154;
            _1056 = _1132;
            _920 = _1144;
            _1090 = _1138;
        }
    }
    float _1156 = _968;
    float _1158 = _970;
    float _1160 = _972;
    float _1162 = _918;
    float _1164 = _1056;
    float _1166 = _920;
    float _1168 = _1090;
    float _1170 = _1166;
    float _1172 = _1164;
    float _1174 = _1162;
    float _1176 = _1168;
    if (_1084)
    {
        _1170 = _1156;
    }
    float _1178 = _1170;
    float _1180 = _1178;
    if (_1084)
    {
        _1172 = _1158;
    }
    float _1182 = _1172;
    float _1184 = _1182;
    if (_1084)
    {
        _1174 = _1160;
    }
    float _1186 = _1174;
    float _1188 = _1186;
    if (!_1084)
    {
        float _1190 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1192 = _595 + _1190;
        float _1194 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1196 = _563 + _1194;
        float _1198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1200 = -_595;
        float _1202 = _1200 + _1158;
        float _1204 = _1192 * _1192;
        float _1206 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1208 = _561 + _1206;
        float _1210 = -_563;
        float _1212 = _1210 + _1156;
        float _1214 = -_561;
        float _1216 = _1214 + _1160;
        float _1218 = fma(_1196, _1196, _1204);
        float _1220 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1222 = fma(_1208, _1208, _1218);
        float _1224 = sqrt(_1222);
        float _1226 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        bool _1228 = _1224 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1230 = isnan(_1224);
        bool _1232 = _1228 || _1230;
        bool _1234 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1236 = _1232 || _1234;
        float _1238 = precise::min(_1224, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1240 = _1238 * _1198;
        float _1242 = _1226 * _1240;
        float _1244 = _1186;
        float _1246 = _1238;
        float _1248 = _1224;
        if (_1236)
        {
            float _1250 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1244 = _1250;
        }
        float _1252 = _1244;
        if (_1236)
        {
            float _1254 = precise::max(_1224, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1246 = _1254;
        }
        float _1256 = _1246;
        float _1258 = fma(_1202, _1242, _595);
        float _1260 = fma(_1212, _1242, _563);
        float _1262 = _1258;
        float _1264 = _1260;
        if (_1236)
        {
            float _1266 = _1256 * _1252;
            _1248 = _1266;
        }
        float _1268 = _1248;
        float _1270 = fma(_1216, _1242, _561);
        float _1272 = _1268;
        _1188 = _1270;
        if (_1236)
        {
            float _1274 = _1226 * _1268;
            _1272 = _1274;
        }
        float _1276 = _1272;
        _1176 = _1276;
        if (_1236)
        {
            float _1278 = fma(_1202, _1276, _595);
            _1262 = _1278;
        }
        float _1280 = _1262;
        _1184 = _1280;
        if (_1236)
        {
            float _1282 = fma(_1212, _1276, _563);
            _1264 = _1282;
        }
        float _1284 = _1264;
        _1180 = _1284;
        if (_1236)
        {
            float _1286 = fma(_1216, _1276, _561);
            _1188 = _1286;
        }
    }
    float _1288 = _1184;
    float _1290 = _1180;
    float _1292 = _1188;
    float _1294 = _1176;
    float _1296 = _1288 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1298 = _1288 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1300 = _1288 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1302 = _1098 * _1102;
    float _1304 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1296);
    float _1306 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1298);
    float _1308 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1300);
    float _1310 = _1294;
    if (!_822)
    {
        float _1312 = rint(_1068);
        float _1314 = precise::max(_1312, 0.0);
        uint _1316 = uint(_1314);
        uint _1318 = clamp(_1316, 0u, 65535u);
        _1310 = as_type<float>(_1318);
    }
    float _1320 = _1310;
    float _1322 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1304);
    bool _1324 = _1302 >= 0.0;
    float _1326 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1306);
    float _1328 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1308);
    float _1330 = _1288 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1332 = _1096 * _1102;
    bool _1334 = _1302 <= 1.0;
    bool _1336 = _1334 && _1324;
    float _1338 = _1326 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1340 = _1322 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1342 = _1328 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1344 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1330);
    bool _1346 = _1332 >= 0.0;
    bool _1348 = _1346 && _1336;
    float _1350 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1352 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1354 = _1338 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1356 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1344);
    float _1358 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1350);
    bool _1360 = _1332 <= 1.0;
    bool _1362 = _1360 && _1348;
    float _1364 = -_1354;
    float _1366 = fma(_1364, _1352, 1.0);
    float _1368 = _1356 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1370 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1358);
    float _1372 = _643 * _1000;
    float _1374 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1376 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1378 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1370);
    float _1380 = log2(_1366);
    float _1382 = fma(_563, _992, _1372);
    float _1384 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1374);
    float _1386 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1376);
    float _1388 = _1356;
    if (!_822)
    {
        float _1390 = -_1094;
        float _1392 = _675 + _1390;
        _1106 = _1392;
    }
    float _1394 = _1106;
    if (_1362)
    {
        float _1396 = float(_721);
        _870 = _1396;
    }
    float _1398 = _870;
    float _1400 = fma(_561, _1032, _1382);
    float _1402 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1384);
    float _1404 = 1.0 / _1378;
    float _1406 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1386);
    float _1408 = _1400 + _1040;
    float _1410 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1402);
    float _1412 = _1398;
    if (!_822)
    {
        float _1414 = -_1018;
        float _1416 = _685 + _1414;
        _1388 = _1416;
    }
    float _1418 = _1388;
    float _1420 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1406);
    float _1422 = _1382;
    if (_1362)
    {
        float _1424 = rint(_1398);
        float _1426 = precise::max(_1424, 0.0);
        uint _1428 = uint(_1426);
        uint _1430 = clamp(_1428, 0u, 65535u);
        _1422 = as_type<float>(_1430);
    }
    float _1432 = _1422;
    float _1434 = _1380 * 0.693147182464599609375;
    float _1436 = _1408 * _1102;
    float _1438 = _1410 * _1404;
    float _1440 = _1420 * _1404;
    float _1442 = _1434 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1444 = fma(_1438, 0.5, 0.5);
    float _1446 = fma(_1440, -0.5, 0.5);
    float _1448 = _1320;
    if (!_822)
    {
        float3 _4731 = float3(_1418, _1394, float(as_type<int>(_1320)));
        float3 _4735 = select(_4731, float3(0.0), isnan(_4731));
        float _1450 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4735.xy, uint(rint(_4735.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4735.xy, uint(rint(_4735.z)), level(0.0)).x;
        _1448 = _1450;
    }
    float _1452 = _1448;
    float _1454 = _1440;
    float _1456 = _1432;
    if (_1362)
    {
        float3 _4751 = float3(_1302, _1332, float(as_type<int>(_1432)));
        float3 _4753 = select(_4751, float3(0.0), isnan(_4751));
        float _1458 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4753.xy, uint(rint(_4753.z)), _1436, level(0.0));
        _1454 = _1458;
    }
    float _1460 = _1454;
    float3 _4763 = float3(_1444, _1446, _1442);
    float _1462 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4763, float3(0.0), isnan(_4763)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4763, float3(0.0), isnan(_4763)), level(0.0)).x;
    float3 _4772 = float3(_1444, _1446, _1442);
    float4 _1465 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4772, float3(0.0), isnan(_4772)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4772, float3(0.0), isnan(_4772)), level(0.0)).xyzw;
    float _1467 = _1465.x;
    float _1469 = _1465.y;
    float _1471 = _1465.z;
    float _1473 = _1465.w;
    bool _1475 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1477 = isnan(0.5);
    bool _1479 = _1475 || _1477;
    bool _1481 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1483 = _1479 || _1481;
    if (_822)
    {
        _1412 = 1.0;
    }
    float _1485 = _1412;
    float _1487 = _1485;
    if (_1483)
    {
        _1108 = 1.0;
    }
    float _1489 = _1108;
    float _1491 = _1489;
    float _1493 = _1452;
    float _1495 = _1471;
    float _1497 = _1473;
    if (!_1483)
    {
        float _1499 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1501 = _1499 * 0.15915493667125701904296875;
        float _1503 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1505 = _1501 * 6.283185482025146484375;
        float _1507 = cos(_1505);
        float _1509 = _1503 * 0.15915493667125701904296875;
        float _1511 = _1501 * 6.283185482025146484375;
        float _1513 = sin(_1511);
        float _1515 = 1.0 / _1507;
        float _1517 = _1509 * 6.283185482025146484375;
        float _1519 = cos(_1517);
        float _1521 = _1513 * _1515;
        float _1523 = _1509 * 6.283185482025146484375;
        float _1525 = sin(_1523);
        float _1527 = _1519 * _1521;
        float _1529 = 1.0 / _1527;
        float _1531 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1533 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1531;
        float _1535 = 1.0 / _1533;
        float _1537 = _1525 * _1529;
        float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1541 = fma(_669, _1537, _1539);
        float _1543 = _1541 * _1535;
        float _1545 = precise::clamp(_1543, 0.0, 1.0);
        float _1547 = -_1545;
        float _1549 = _1547 + 1.0;
        _1456 = _1527;
        _1491 = _1549;
    }
    float _1551 = _1456;
    float _1553 = _1491;
    float _1555 = _1551;
    if (!_822)
    {
        int _1557 = _876 << 4;
        int _1559 = _1557 + 2048;
        uint _1561 = uint(int(uint(_1559) >> uint(2)));
        uint _1563 = uint(int(uint(int(_1561)) >> uint(2)));
        int _1565 = int(_1561) & 3;
        float _1567 = (*spvDescriptorSet0.vp_c15)._m0[int(_1563)][_1565];
        int _1569 = int(_1561) + 1;
        uint _1571 = uint(int(uint(_1569) >> uint(2)));
        int _1573 = _1569 & 3;
        float _1575 = (*spvDescriptorSet0.vp_c15)._m0[int(_1571)][_1573];
        int _1577 = _1559 + 8;
        uint _1579 = uint(int(uint(_1577) >> uint(2)));
        uint _1581 = uint(int(uint(int(_1579)) >> uint(2)));
        int _1583 = int(_1579) & 3;
        float _1585 = (*spvDescriptorSet0.vp_c15)._m0[int(_1581)][_1583];
        int _1587 = int(_1579) + 1;
        uint _1589 = uint(int(uint(_1587) >> uint(2)));
        int _1591 = _1587 & 3;
        float _1593 = (*spvDescriptorSet0.vp_c15)._m0[int(_1589)][_1591];
        float _1595 = _643 * _1575;
        float _1597 = fma(_563, _1567, _1595);
        float _1599 = fma(_561, _1585, _1597);
        float _1601 = _1599 + _1593;
        float _1603 = precise::clamp(_1601, 0.0, 1.0);
        float _1605 = -_1603;
        float _1607 = _1605 + _1452;
        float _1609 = fma(_1607, 500.0, 1.5);
        float _1611 = exp2(_1609);
        float _1613 = 0.0 + _1611;
        float _1615 = precise::clamp(_1613, 0.0, 1.0);
        _1555 = _1585;
        _1487 = _1615;
    }
    float _1617 = _1555;
    float _1619 = _1487;
    float _1621 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1623 = _1288 + _1621;
    float _1625 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1627 = _1290 + _1625;
    float _1629 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1631 = _1292 + _1629;
    float _1633 = _1623 * _1623;
    float _1635 = fma(_1627, _1627, _1633);
    float _1637 = fma(_1631, _1631, _1635);
    float _1639 = rsqrt(_1637);
    float _1641 = _1639 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1643 = _1627 * _1641;
    float _1645 = _1631 * _1641;
    float _1647 = _1643 * _1643;
    float _1649 = _1645 * _1645;
    float _1651 = _1647 + _1649;
    float _1653 = sqrt(_1651);
    bool _1655 = _1653 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1657 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1659 = _1653 + _1657;
    float _1661 = _1631;
    float _1663 = _1617;
    float _1665 = _1659;
    float _1667 = _1623;
    if (_1655)
    {
        float _1669 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1661 = _1669;
    }
    float _1671 = _1661;
    if (_1655)
    {
        float _1673 = rsqrt(_1651);
        _1663 = _1673;
    }
    float _1675 = _1663;
    float _1677 = _1675;
    if (_1655)
    {
        float _1679 = _1659 * _1671;
        _1665 = _1679;
    }
    float _1681 = _1665;
    if (_1655)
    {
        float _1683 = _1681 * 0.15915493667125701904296875;
        _1493 = _1683;
    }
    float _1685 = _1493;
    float _1687 = _1639;
    if (_1655)
    {
        float _1689 = _1685 * 6.283185482025146484375;
        float _1691 = sin(_1689);
        _1687 = _1691;
    }
    float _1693 = _1687;
    float _1695 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1697 = precise::max(0.0, _1695);
    float _1699 = _1633;
    float _1701 = _1697;
    float _1703 = _1695;
    if (_1655)
    {
        float _1705 = _1685 * 6.283185482025146484375;
        float _1707 = cos(_1705);
        _1699 = _1707;
    }
    float _1709 = _1699;
    float _1711 = -_1641;
    float _1713 = -_1697;
    float _1715 = fma(_1623, _1711, _1713);
    if (_1655)
    {
        float _1717 = _1715 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1701 = _1717;
    }
    float _1719 = _1701;
    float _1721 = _1719;
    float _1723 = _1693;
    if (_1655)
    {
        float _1725 = fma(_1693, _1719, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1721 = _1725;
    }
    float _1727 = _1721;
    float _1729 = _1727;
    if (!_1655)
    {
        _1723 = _1643;
    }
    float _1731 = _1723;
    float _1733 = _1731;
    float _1735 = _1709;
    if (_1655)
    {
        float _1737 = _1709 + (-1.0);
        _1703 = _1737;
    }
    float _1739 = _1703;
    float _1741 = _1739;
    if (_1655)
    {
        float _1743 = _1675 * _1727;
        _1014 = _1743;
    }
    float _1745 = _1014;
    if (!_1655)
    {
        _1729 = _1715;
    }
    float _1747 = _1729;
    float _1749 = _1747;
    if (_1655)
    {
        float _1751 = _1739 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1667 = _1751;
    }
    float _1753 = _1667;
    if (_1655)
    {
        float _1755 = _1643 * _1745;
        _1733 = _1755;
    }
    float _1757 = _1733;
    if (!_1655)
    {
        _1741 = _1645;
    }
    float _1759 = _1741;
    float _1761 = _1759;
    if (_1655)
    {
        float _1763 = _1645 * _1745;
        _1761 = _1763;
    }
    float _1765 = _1761;
    if (!_1655)
    {
        _1677 = _1647;
    }
    float _1767 = _1677;
    float _1769 = _1767;
    if (_1655)
    {
        float _1771 = fma(_1715, _1709, _1753);
        _1749 = _1771;
    }
    float _1773 = _1749;
    if (_1655)
    {
        float _1775 = _1757 * _1757;
        _1769 = _1775;
    }
    float _1777 = _1769;
    if (!_1655)
    {
        _1735 = _1649;
    }
    float _1779 = _1735;
    float _1781 = sqrt(_1637);
    float _1783 = _1779;
    if (_1655)
    {
        float _1785 = _1765 * _1765;
        _1783 = _1785;
    }
    float _1787 = _1783;
    float _1789 = fma(_1773, _1773, _1777);
    float _1791 = _1789 + _1787;
    float _1793 = rsqrt(_1791);
    float _1795 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1797 = fma(_1781, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1795);
    float _1799 = precise::clamp(_1797, 0.0, 1.0);
    float _1801 = -_1799;
    float _1803 = _1801 + 1.0;
    float _1805 = abs(_1803);
    float _1807 = log2(_1805);
    float _1809 = _1793 * _1757;
    float _1811 = _1793 * _1773;
    float _1813 = _1793 * _1765;
    float _1815 = _1809 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1817 = -_1815;
    float _1819 = fma(_1811, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1817);
    float _1821 = -_1813;
    float _1823 = fma(_1821, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1819);
    float _1825 = _1807 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1827 = fma(_1823, -0.5, 0.5);
    float _1829 = fma(_1823, 0.5, 0.5);
    float _1831 = exp2(_1825);
    float _1833 = fma(_1829, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1835 = fma(_1829, _1833, -0.212114393711090087890625);
    float _1837 = _1811 + 1.0;
    float _1839 = sqrt(_1827);
    float _1841 = fma(_1829, _1835, 1.570728778839111328125);
    float _1843 = -_1811;
    float _1845 = fma(_1831, _1837, _1843);
    float _1847 = fma(_1845, 0.5, 0.5);
    float _1849 = _1839 * 0.636619746685028076171875;
    float _1851 = -_1841;
    float _1853 = fma(_1849, _1851, 1.0);
    float2 _5349 = float2(_1853, _1847);
    float3 _1857 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5349, float2(0.0), isnan(_5349)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5349, float2(0.0), isnan(_5349)), level(0.0)).xyz;
    float _1859 = _1857.x;
    float _1861 = _1857.y;
    float _1863 = _1857.z;
    float _1865 = abs(_669);
    float _1867 = log2(_1865);
    float _1869 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1871 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1873 = _1871 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1875 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1877 = _1875 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1879 = _537 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1881 = isnan(_537);
    bool _1883 = _1879 || _1881;
    bool _1885 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1887 = _1883 || _1885;
    float _1889 = float(_1887);
    float _1891 = 1.0 / _1873;
    float _1893 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1895 = _1893 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1897 = _537 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1899 = isnan(_537);
    bool _1901 = _1897 || _1899;
    bool _1903 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1905 = _1901 || _1903;
    float _1907 = float(_1905);
    float _1909 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1911 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1909;
    float _1913 = -_1889;
    float _1915 = _1913 + 1.0;
    bool _1917 = _537 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1919 = isnan(_537);
    bool _1921 = _1917 || _1919;
    bool _1923 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1925 = _1921 || _1923;
    float _1927 = float(_1925);
    float _1929 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1869);
    float _1931 = 1.0 / _1877;
    float _1933 = _1907 * _1915;
    float _1935 = -_1907;
    float _1937 = _1935 + 1.0;
    float _1939 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1941 = _1939 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1943 = _1867 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1945 = _1807 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1947 = _1927 * _1937;
    float _1949 = -_1927;
    float _1951 = _1949 + 1.0;
    float _1953 = 1.0 / _1895;
    float _1955 = _1911 * _1891;
    float _1957 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1959 = _537 + _1957;
    float _1961 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1929);
    bool _1963 = _669 <= 8000.0;
    bool _1965 = isnan(_669);
    bool _1967 = _1963 || _1965;
    bool _1969 = isnan(8000.0);
    bool _1971 = _1967 || _1969;
    float _1973 = float(_1971);
    float _1975 = fma(_1955, _1959, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1977 = _537 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1979 = isnan(_537);
    bool _1981 = _1977 || _1979;
    bool _1983 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1985 = _1981 || _1983;
    float _1987 = float(_1985);
    float _1989 = _1941 * _1931;
    float _1991 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1993 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1991;
    float _1995 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1997 = _537 + _1995;
    float _1999 = _1975 * _1947;
    float _2001 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2003 = _537 + _2001;
    float _2005 = -_1987;
    float _2007 = _2005 + 1.0;
    float _2009 = fma(_1989, _1997, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2011 = fma(_1951, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1999);
    float _2013 = _1993 * _1953;
    float _2015 = exp2(_1943);
    float _2017 = fma(_2009, _1933, _2011);
    float _2019 = fma(_2013, _2003, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _2021 = _1889 * _2007;
    float _2023 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2025 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2027 = fma(_2019, _2021, _2017);
    float _2029 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2031 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2033 = _2025 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2035 = _2029 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2037 = fma(_1987, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2027);
    float _2039 = _2031 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2041 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2043 = exp2(_1945);
    float _2045 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1961);
    float _2047 = as_type<float>(_223) * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_80.x = _2033;
    out.m_80.y = _2035;
    out.m_80.z = _2039;
    out.m_80.w = _2023;
    float _2049 = -_581;
    float _2051 = _2049 + 1.0;
    float _2053 = _2045 + _1378;
    float _2055 = as_type<float>(_237) * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2057 = _2047 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2059 = _2047 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2061 = _2047 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2063 = fma(_2055, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2057);
    float _2065 = fma(_2055, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2059);
    float _2067 = fma(_2055, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2061);
    float _2069 = _2053 * 0.5;
    bool _2071 = _1781 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2073 = isnan(_1781);
    bool _2075 = _2071 || _2073;
    bool _2077 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2079 = _2075 || _2077;
    float _2081 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2083 = _2037 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2085 = _2041 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2087 = fma(_2015, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2089 = precise::clamp(_2087, 0.0, 1.0);
    float _2091 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2093 = _2081 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_82.z = _2069;
    out.m_82.w = _1378;
    float _2095 = fma(_2089, -2.0, 3.0);
    float _2097 = _2089 * _2089;
    float _2099 = _2091 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.gl_Position.x = _1410;
    out.gl_Position.y = _1420;
    out.gl_Position.z = _2045;
    out.gl_Position.w = _1378;
    float _2101 = _2097 * _2095;
    out.m_84.x = _2085;
    out.m_84.y = _2093;
    out.m_84.z = _2099;
    out.m_84.w = _2083;
    float _2103 = -_2101;
    float _2105 = _2103 + 1.0;
    float _2107 = fma(_2105, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2101);
    float _2109 = _1973 * _2107;
    float _2111 = -_2043;
    float _2113 = _2111 + 1.0;
    float _2115 = _1410;
    float _2117 = _2063;
    float _2119 = _2065;
    if (!_1362)
    {
        _2115 = 1.0;
    }
    float _2121 = _2115;
    float _2123 = _1553 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2125 = _2109 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2127 = _2121;
    float _2129 = _2123;
    if (_1362)
    {
        bool _2131 = _1460 >= _1436;
        bool _2133 = isnan(_1460);
        bool _2135 = _2131 || _2133;
        bool _2137 = isnan(_1436);
        bool _2139 = _2135 || _2137;
        float _2141 = float(_2139);
        _2127 = _2141;
    }
    float _2143 = _2127;
    float _2145 = _2113 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2147 = _2051 * _2125;
    float _2149 = precise::clamp(_2147, 0.0, 1.0);
    float _2151 = _2145 * _1462;
    float _2153 = _2143 * _1619;
    float _2155 = -_2149;
    float _2157 = fma(_2155, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2159 = -_2145;
    float _2161 = _2159 + 1.0;
    float _2163 = _1473 * _2151;
    float _2165 = _315 * _2123;
    float _2167 = -_2153;
    float _2169 = fma(_2167, _2157, 1.0);
    float _2171 = precise::clamp(_2169, 0.0, 1.0);
    if (!_2079)
    {
        _319 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2173 = _319;
    float _2175 = _2173;
    float _2177 = _2173;
    if (!_2079)
    {
        _2129 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2179 = _2129;
    float _2181 = _2171 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2183 = _2063 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2185 = _2179;
    float _2187 = _2179;
    if (!_2079)
    {
        _2117 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2189 = _2117;
    out.m_86.x = _2181;
    float _2191 = _1863 * _2151;
    float _2193 = fma(_1861, _2163, _1469);
    float _2195 = fma(_1859, _2163, _1467);
    float _2197 = _1473 * _2161;
    float _2199 = fma(_1473, _2191, _1471);
    float _2201 = _2065 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2203 = _2067 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2205 = _2189;
    float _2207 = _2189;
    if (!_2079)
    {
        _1495 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2209 = _1495;
    out.m_88.x = _2195;
    out.m_88.y = _2193;
    out.m_88.z = _2199;
    out.m_88.w = _2197;
    float _2211 = _2209;
    float _2213 = _2209;
    if (!_2079)
    {
        _1497 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2215 = _1497;
    float _2217 = _2215;
    float _2219 = _2215;
    if (!_2079)
    {
        _2119 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2221 = _2119;
    out.m_90.x = _2183;
    out.m_90.y = _2201;
    out.m_90.z = _2203;
    bool _2223 = !_2079;
    float _2225 = _2221;
    float _2227 = _2221;
    if (!_2223)
    {
        bool _2229 = _1781 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2231 = isnan(_1781);
        bool _2233 = _2229 || _2231;
        bool _2235 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2237 = _2233 || _2235;
        if (!_2237)
        {
            float _2239 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2241 = _1781 + _2239;
            float _2243 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2245 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2243;
            float _2247 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2249 = _2247 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2251 = 1.0 / _2245;
            float _2253 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2255 = _2253 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2257 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2259 = _2257 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2261 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2263 = _2261 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2265 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2267 = _2265 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2269 = _2241 * _2251;
            float _2271 = precise::clamp(_2269, 0.0, 1.0);
            float _2273 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2275 = _2273 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2277 = fma(_2271, _2249, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2279 = fma(_2271, _2275, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2281 = fma(_2271, _2255, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2283 = fma(_2271, _2259, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2285 = fma(_2271, _2263, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2287 = fma(_2271, _2267, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2219 = _2281;
            _2227 = _2285;
            _2213 = _2277;
            _2207 = _2283;
            _2177 = _2279;
            _2187 = _2287;
            _2289 = true;
        }
        else
        {
            bool _2291 = _1781 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2293 = isnan(_1781);
            bool _2295 = _2291 || _2293;
            bool _2297 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2299 = _2295 || _2297;
            if (!_2299)
            {
                _2211 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2301 = _2211;
            _2213 = _2301;
            if (!_2299)
            {
                _2217 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2303 = _2217;
            _2219 = _2303;
            if (!_2299)
            {
                _2175 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2305 = _2175;
            _2177 = _2305;
            if (!_2299)
            {
                _2205 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2307 = _2205;
            _2207 = _2307;
            if (!_2299)
            {
                _2225 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2309 = _2225;
            _2227 = _2309;
            if (!_2299)
            {
                _2185 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2311 = _2185;
            bool _2313 = !_2299;
            _2187 = _2311;
            if (!_2313)
            {
                bool _2315 = _1781 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2317 = isnan(_1781);
                bool _2319 = _2315 || _2317;
                bool _2321 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2323 = _2319 || _2321;
                if (!_2323)
                {
                    float _2325 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2327 = _1781 + _2325;
                    float _2329 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2331 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2329;
                    float _2333 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2335 = _2333 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2337 = 1.0 / _2331;
                    float _2339 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2341 = _2339 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2343 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2345 = _2343 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2347 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2349 = _2347 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2351 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2353 = _2351 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2355 = _2327 * _2337;
                    float _2357 = precise::clamp(_2355, 0.0, 1.0);
                    float _2359 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2361 = _2359 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2363 = fma(_2357, _2335, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2365 = fma(_2357, _2361, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2367 = fma(_2357, _2341, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2369 = fma(_2357, _2345, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2371 = fma(_2357, _2349, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2373 = fma(_2357, _2353, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2219 = _2367;
                    _2227 = _2371;
                    _2213 = _2363;
                    _2207 = _2369;
                    _2177 = _2365;
                    _2187 = _2373;
                    _2289 = true;
                }
                else
                {
                    _2219 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2227 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2213 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2207 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2177 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2187 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2289 = false;
    float _2375 = _2219;
    float _2377 = _2227;
    float _2379 = _2213;
    float _2381 = _2207;
    float _2383 = _2177;
    float _2385 = _2187;
    float _2387 = fma(_2201, -0.5, 0.5);
    float _2389 = precise::clamp(_2387, 0.0, 1.0);
    float _2391 = -_2375;
    float _2393 = _2391 + _2377;
    float _2395 = _2165 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2397 = -_2379;
    float _2399 = _2397 + _2381;
    float _2401 = fma(_2389, _2393, _2375);
    out.m_92.x = 0.0;
    float _2403 = -_2383;
    float _2405 = _2403 + _2385;
    float _2407 = fma(_2389, _2399, _2379);
    float _2409 = _2401 * 0.586610972881317138671875;
    out.m_59.x = _2395;
    bool _2411 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2413 = fma(_2389, _2405, _2383);
    float _2415 = fma(_2407, 0.298911988735198974609375, _2409);
    bool _2417 = _1553 > 0.0;
    bool _2419 = isnan(_1553);
    bool _2421 = _2417 || _2419;
    bool _2423 = isnan(0.0);
    bool _2425 = _2421 || _2423;
    float _2427 = fma(_2413, 0.114477999508380889892578125, _2415);
    float _2429 = -_2427;
    float _2431 = _2407 + _2429;
    float _2433 = -_2427;
    float _2435 = _2401 + _2433;
    float _2437 = -_2427;
    float _2439 = _2413 + _2437;
    float _2441 = fma(_2431, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2427);
    float _2443 = fma(_2435, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2427);
    float _2445 = fma(_2439, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2427);
    bool _2447 = !_2411;
    if (!_2447)
    {
        float _2449 = -_1288;
        float _2451 = _2449 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2453 = -_1290;
        float _2455 = _2453 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2457 = -_1292;
        float _2459 = _2457 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2461 = _2451 * _2451;
        float _2463 = fma(_2455, _2455, _2461);
        float _2465 = fma(_2459, _2459, _2463);
        float _2467 = sqrt(_2465);
        float _2469 = rsqrt(_2465);
        float _2471 = -_2467;
        float _2473 = _2471 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2475 = _2473 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2477 = precise::clamp(_2475, 0.0, 1.0);
        float _2479 = _2455 * _2469;
        float _2481 = _2451 * _2469;
        float _2483 = abs(_2477);
        float _2485 = log2(_2483);
        float _2487 = _2459 * _2469;
        float _2489 = _2479 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2491 = _2201 * _2481;
        float _2493 = -_2481;
        float _2495 = -_2489;
        float _2497 = fma(_2493, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2495);
        float _2499 = fma(_2183, _2479, _2491);
        float _2501 = -_2487;
        float _2503 = fma(_2501, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2497);
        float _2505 = fma(_2203, _2487, _2499);
        float _2507 = precise::clamp(_2505, 0.0, 1.0);
        float _2509 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2511 = _2503 + _2509;
        float _2513 = _2485 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2515 = _2511 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2517 = precise::clamp(_2515, 0.0, 1.0);
        float _2519 = exp2(_2513);
        float _2521 = _2519 * _2517;
        float _2523 = _2507 * _2521;
        float _2525 = _2523 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2527 = _2523 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2529 = _2523 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _2525;
        out.m_92.y = _2527;
        out.m_92.z = _2529;
    }
    out.m_94.x = _2441;
    out.m_94.y = _2443;
    out.m_94.z = _2445;
    if (_2425)
    {
        return out;
    }
    out.m_59.x = 0.0;
    float _2531 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2531;
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
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2289 = false;
    bool _529 = false;
    bool _337 = false;
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
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2588 = as_type<float>(_129);
        out.gl_Position.z = _2588;
    }
    if (!_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _133 = in.m_61.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_143)
    {
        float _149 = float(_113);
        _123 = _149;
    }
    float _151 = _123;
    bool _153 = _147 >= _151;
    bool _155 = !_143;
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
        _131 = as_type<int>(_163);
    }
    int _165 = _131;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2657 = as_type<float>(_165);
        out.gl_Position.z = _2657;
    }
    if (_157)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _167 = in.m_63.x;
    float _169 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _171 = _147 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _173 = as_type<float>(int(gl_VertexIndex));
    float _175 = in.m_68.x;
    float _177 = in.m_68.y;
    float _179 = in.m_68.z;
    float _181 = in.m_70.x;
    float _183 = in.m_70.y;
    float _185 = in.m_70.z;
    float _187 = in.m_72.x;
    float _189 = in.m_72.y;
    float _191 = in.m_72.z;
    float _193 = _171 * _169;
    float _195 = in.m_74.x;
    float _197 = in.m_74.y;
    float _199 = in.m_74.z;
    float _201 = fma(_167, (*spvDescriptorSet0.vp_c9)._m0[20].x, _193);
    int _203 = as_type<int>(_173) & 1;
    bool _205 = _203 != 0;
    int _207 = as_type<int>(_173) & 2;
    bool _209 = _207 != 0;
    float _211 = _201 * 6.283185482025146484375;
    float _213 = floor(_201);
    int _215 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _217 = _215 != 0;
    float _219 = _211 * 0.15915493667125701904296875;
    bool _221 = !_209;
    int _223 = _221 ? (-1090519040) : 1056964608;
    int _225 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _227 = _225 != 0;
    int _229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _231 = _229 != 0;
    float _233 = _177 * _183;
    bool _235 = !_205;
    int _237 = _235 ? (-1090519040) : 1056964608;
    float _239 = _219 * 6.283185482025146484375;
    float _241 = cos(_239);
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _245 = fma(_175, _181, _233);
    bool _247 = !_227;
    int _249 = _247 ? 0 : 1;
    out.m_76.x = as_type<float>(_237);
    out.m_76.y = as_type<float>(_223);
    bool _251 = !_217;
    int _253 = _251 ? 0 : 1;
    float _255 = -_213;
    float _257 = _201 + _255;
    int _259 = abs(_249);
    float _261 = _177 * _189;
    int _263 = abs(_253);
    float _265 = -_257;
    float _267 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _269 = _177 * _197;
    bool _271 = !_231;
    int _273 = _271 ? 0 : 1;
    float _275 = fma(_175, _187, _261);
    float _277 = float(_259);
    float _279 = fma(_241, 0.5, 0.5);
    bool _281 = _257 < 0.5;
    float _283 = float(_281);
    float _285 = fma(_175, _195, _269);
    int _287 = abs(_273);
    float _289 = abs(_267);
    float _291 = _277 * _289;
    float _293 = float(_263);
    float _295 = -_279;
    float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _299 = -_283;
    float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _303 = float(_287);
    float _305 = fma(_293, _297, _291);
    float _307 = fma(_179, _191, _275);
    float _309 = fma(_179, _185, _245);
    float _311 = fma(_179, _199, _285);
    float _313 = abs(_301);
    float _315 = fma(_303, _313, _305);
    bool _317 = !_243;
    float _319 = _315;
    float _335;
    if (!_317)
    {
        float _321 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _323 = _167 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _325 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _327 = _325 * _321;
        float _329 = floor(_327);
        float _331 = -_329;
        float _333 = _327 + _331;
        _335 = _333;
        _337 = true;
    }
    else
    {
        float _339 = float(_113);
        float _341 = 1.0 / _339;
        float _343 = _147 * _341;
        _335 = _343;
    }
    _337 = false;
    float _345 = _335;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _349 = _345 + _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _353 = _345 + _351;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _357 = _345 + _355;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _359;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _367;
    bool _371 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _373 = isnan(_345);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = 1.0 / _361;
    bool _385 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _387 = 1.0 / _369;
    float _389 = 1.0 / _365;
    float _391 = _349 * _383;
    bool _393 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _395 = isnan(_345);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = -_381;
    float _407 = _405 + 1.0;
    bool _409 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _411 = isnan(_345);
    bool _413 = _409 || _411;
    bool _415 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _417 = _413 || _415;
    float _419 = float(_417);
    float _421 = _403 * _407;
    float _423 = _353 * _387;
    float _425 = -_403;
    float _427 = _425 + 1.0;
    float _429 = _419 * _427;
    float _431 = -_419;
    float _433 = _431 + 1.0;
    float _435 = _357 * _389;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _441 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _443 = isnan(_345);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _453;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _465 = fma(_455, _391, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _467 = _451 * _433;
    float _469 = fma(_459, _391, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _471 = fma(_439, _435, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _473 = fma(_463, _435, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _475 = -_451;
    float _477 = _475 + 1.0;
    float _479 = _465 * _467;
    float _481 = _469 * _467;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _483;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _487;
    float _491 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[143].x, _479);
    float _493 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[143].y, _481);
    float _495 = fma(_485, _423, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _497 = fma(_489, _423, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _499 = fma(_471, _429, _491);
    float _501 = fma(_473, _429, _493);
    float _503 = fma(_497, _421, _499);
    float _505 = fma(_495, _421, _501);
    float _507 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[146].x, _503);
    float _509 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[146].y, _505);
    bool _511 = !_385;
    float _527;
    if (!_511)
    {
        float _513 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _515 = _167 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _517 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[11].y, _147);
        float _519 = _517 * _513;
        float _521 = floor(_519);
        float _523 = -_521;
        float _525 = _519 + _523;
        _527 = _525;
        _529 = true;
    }
    else
    {
        float _531 = float(_113);
        float _533 = 1.0 / _531;
        float _535 = _147 * _533;
        _527 = _535;
    }
    _529 = false;
    float _537 = _527;
    float _539 = in.m_56.x;
    float _541 = in.m_56.y;
    float _543 = in.m_56.z;
    float _545 = in.m_74.w;
    float _547 = in.m_72.w;
    float _549 = _197 * _541;
    float _551 = _189 * _541;
    float _553 = fma(_195, _539, _549);
    float _555 = fma(_187, _539, _551);
    float _557 = fma(_199, _543, _553);
    float _559 = fma(_191, _543, _555);
    float _561 = _557 + _545;
    float _563 = _559 + _547;
    float _565 = fma(_561, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _567 = fma(_563, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _569 = floor(_565);
    float _571 = floor(_567);
    float _573 = -_569;
    float _575 = _565 + _573;
    float _577 = -_571;
    float _579 = _567 + _577;
    float2 _3290 = float2(_579, _575);
    float _581 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3290, float2(0.0), isnan(_3290)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3290, float2(0.0), isnan(_3290)), level(0.0)).x;
    float _583 = in.m_70.w;
    float _585 = _183 * _541;
    float _587 = fma(_181, _539, _585);
    float _589 = in.m_78.x;
    float _591 = in.m_78.y;
    float _593 = fma(_185, _543, _587);
    float _595 = _593 + _583;
    float _597 = _595 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _599 = _507 * _589;
    float _601 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[11].x, _597);
    float _603 = _509 * _591;
    float _605 = fma(_561, (*spvDescriptorSet0.vp_c8)._m0[11].z, _601);
    float _607 = _595 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _609 = _603 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _611 = _605 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _613 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[10].x, _607);
    float _615 = 1.0 / _611;
    float _617 = fma(_561, (*spvDescriptorSet0.vp_c8)._m0[10].z, _613);
    float _619 = _617 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _621 = _619 + _611;
    float _623 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_237));
    float _625 = _621 * _615;
    float _627 = _625 * 0.5;
    float _629 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_223));
    float _631 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _633 = fma(_627, (*spvDescriptorSet0.vp_c8)._m0[30].w, _631);
    float _635 = _599 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _637 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _639 = 1.0 / _633;
    float _641 = _635 * _623;
    float _643 = _595 + _637;
    float _645 = _609 * _629;
    float _647 = _643 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _649 = _645 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _651 = _645 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _653 = _643 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _655 = fma(_563, (*spvDescriptorSet0.vp_c15)._m0[127].x, _647);
    float _657 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[26].x, _649);
    float _659 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[24].x, _651);
    float _661 = fma(_563, (*spvDescriptorSet0.vp_c15)._m0[126].x, _653);
    float _663 = fma(_561, (*spvDescriptorSet0.vp_c15)._m0[127].z, _655);
    float _665 = _645 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _667 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _669 = _639 * _667;
    float _671 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _673 = fma(_561, (*spvDescriptorSet0.vp_c15)._m0[126].z, _661);
    float _675 = _663 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _677 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[25].x, _665);
    bool _679 = _669 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _681 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[26].z, _657);
    bool _683 = _669 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _685 = _673 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _687 = !_679;
    int _689 = _687 ? 0 : 1;
    float _691 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[24].z, _659);
    float _693 = _681 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _695 = trunc(_685);
    int _697 = int(_695);
    float _699 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[25].z, _677);
    float _701 = _691 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _703 = _561 + _693;
    float _705 = _699 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _707 = 2;
    int _709 = as_type<int>(_641);
    float _711 = _703;
    if (!_679)
    {
        _707 = 1;
    }
    int _713 = _707;
    float _715 = _563 + _701;
    int _717 = _713;
    float _719 = _715;
    if (!_683)
    {
        _717 = _689;
    }
    int _721 = _717;
    float _723 = trunc(_675);
    int _725 = int(_723);
    float _727 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _729 = _703 + _727;
    float _731 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _733 = _715 + _731;
    int _735 = _721 << 6;
    float _737 = _595 + _705;
    float _739 = _729 * _729;
    int _741 = _735 + 48;
    uint _744 = uint(int(uint(_741) >> uint(2)));
    uint _746 = uint(int(uint(int(_744)) >> uint(2)));
    int _748 = int(_744) & 3;
    float _750 = (*spvDescriptorSet0.vp_c15)._m0[int(_746)][_748];
    int _752 = int(_744) + 1;
    uint _754 = uint(int(uint(_752) >> uint(2)));
    int _756 = _752 & 3;
    float _758 = (*spvDescriptorSet0.vp_c15)._m0[int(_754)][_756];
    int _760 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _762 = _697 + _760;
    int _764 = _762 + 1;
    float _766 = fma(_733, _733, _739);
    bool _768 = _764 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _770 = sqrt(_766);
    int _772 = _735 + 56;
    uint _774 = uint(int(uint(_772) >> uint(2)));
    uint _776 = uint(int(uint(int(_774)) >> uint(2)));
    int _778 = int(_774) & 3;
    float _780 = (*spvDescriptorSet0.vp_c15)._m0[int(_776)][_778];
    int _782 = int(_774) + 1;
    uint _784 = uint(int(uint(_782) >> uint(2)));
    int _786 = _782 & 3;
    float _788 = (*spvDescriptorSet0.vp_c15)._m0[int(_784)][_786];
    int _790 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _792 = _725 + _790;
    int _794 = _792 + 1;
    int _796 = _764 | _794;
    int _798 = _735 + 64;
    uint _800 = uint(int(uint(_798) >> uint(2)));
    uint _802 = uint(int(uint(int(_800)) >> uint(2)));
    int _804 = int(_800) & 3;
    float _806 = (*spvDescriptorSet0.vp_c15)._m0[int(_802)][_804];
    int _808 = int(_800) + 1;
    uint _810 = uint(int(uint(_808) >> uint(2)));
    int _812 = _808 & 3;
    float _814 = (*spvDescriptorSet0.vp_c15)._m0[int(_810)][_812];
    bool _816 = _796 < 0;
    bool _818 = _816 || _768;
    bool _820 = _794 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _822 = _820 || _818;
    bool _824 = _770 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _826 = _735 + 72;
    uint _828 = uint(int(uint(_826) >> uint(2)));
    uint _830 = uint(int(uint(int(_828)) >> uint(2)));
    int _832 = int(_828) & 3;
    float _834 = (*spvDescriptorSet0.vp_c15)._m0[int(_830)][_832];
    int _836 = int(_828) + 1;
    uint _838 = uint(int(uint(_836) >> uint(2)));
    int _840 = _836 & 3;
    float _842 = (*spvDescriptorSet0.vp_c15)._m0[int(_838)][_840];
    int _844 = _735 + 96;
    uint _846 = uint(int(uint(_844) >> uint(2)));
    uint _848 = uint(int(uint(int(_846)) >> uint(2)));
    int _850 = int(_846) & 3;
    float _852 = (*spvDescriptorSet0.vp_c15)._m0[int(_848)][_850];
    int _854 = int(_846) + 1;
    uint _856 = uint(int(uint(_854) >> uint(2)));
    int _858 = _854 & 3;
    float _860 = (*spvDescriptorSet0.vp_c15)._m0[int(_856)][_858];
    float _862 = as_type<float>(_796);
    int _864 = _794;
    int _866 = _764;
    float _868 = _770;
    float _870 = as_type<float>(_721);
    if (!_822)
    {
        int _872 = _794 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _874 = _872 + _764;
        _709 = _874;
    }
    int _876 = _709;
    if (!_824)
    {
        _862 = _737;
    }
    float _878 = _862;
    float _880 = _878;
    if (!_822)
    {
        int _882 = _876 << 2;
        _864 = _882;
    }
    int _884 = _864;
    int _886 = _735 + 104;
    uint _888 = uint(int(uint(_886) >> uint(2)));
    uint _890 = uint(int(uint(int(_888)) >> uint(2)));
    int _892 = int(_888) & 3;
    float _894 = (*spvDescriptorSet0.vp_c15)._m0[int(_890)][_892];
    int _896 = int(_888) + 1;
    uint _898 = uint(int(uint(_896) >> uint(2)));
    int _900 = _896 & 3;
    float _902 = (*spvDescriptorSet0.vp_c15)._m0[int(_898)][_900];
    int _904 = _884;
    if (!_822)
    {
        uint _906 = uint(int(uint(_876) >> uint(2)));
        _866 = int(_906);
    }
    int _908 = _866;
    float _910 = as_type<float>(_908);
    if (!_822)
    {
        int _912 = 12 & _884;
        _904 = _912;
    }
    int _914 = _904;
    bool _916 = !_824;
    float _918 = _750;
    float _920 = _806;
    if (!_916)
    {
        float _922 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _924 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _926 = _770 + _924;
        float _928 = _737 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _930 = rsqrt(_766);
        float _932 = _926 * _922;
        float _934 = _932 * 0.15915493667125701904296875;
        float _936 = _934 * 6.283185482025146484375;
        float _938 = sin(_936);
        float _940 = _934 * 6.283185482025146484375;
        float _942 = cos(_940);
        float _944 = fma(_938, _928, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _946 = _930 * _944;
        float _948 = _942 + (-1.0);
        float _950 = fma(_733, _946, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _952 = fma(_729, _946, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _954 = _948 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _956 = fma(_737, _942, _954);
        _880 = _956;
        _719 = _950;
        _711 = _952;
        _868 = _954;
    }
    float _958 = _880;
    float _960 = _719;
    float _962 = _711;
    float _964 = _868;
    float _966 = _964;
    float _968 = _960;
    float _970 = _958;
    float _972 = _962;
    if (!_822)
    {
        int _974 = _908 << 4;
        int _976 = _974 + _914;
        _966 = as_type<float>(_976);
    }
    float _978 = _966;
    float _980 = -_595;
    float _982 = _980 + _958;
    int _984 = _735 + 80;
    uint _986 = uint(int(uint(_984) >> uint(2)));
    uint _988 = uint(int(uint(int(_986)) >> uint(2)));
    int _990 = int(_986) & 3;
    float _992 = (*spvDescriptorSet0.vp_c15)._m0[int(_988)][_990];
    int _994 = int(_986) + 1;
    uint _996 = uint(int(uint(_994) >> uint(2)));
    int _998 = _994 & 3;
    float _1000 = (*spvDescriptorSet0.vp_c15)._m0[int(_996)][_998];
    float _1002 = -_563;
    float _1004 = _1002 + _960;
    float _1006 = -_561;
    float _1008 = _1006 + _962;
    float _1010 = _982 * _982;
    float _1012 = _643 * _860;
    float _1014 = _982;
    if (!_822)
    {
        float _1016 = floor(_685);
        _910 = _1016;
    }
    float _1018 = _910;
    float _1020 = _643 * _814;
    float _1022 = fma(_1004, _1004, _1010);
    int _1024 = _735 + 88;
    uint _1026 = uint(int(uint(_1024) >> uint(2)));
    uint _1028 = uint(int(uint(int(_1026)) >> uint(2)));
    int _1030 = int(_1026) & 3;
    float _1032 = (*spvDescriptorSet0.vp_c15)._m0[int(_1028)][_1030];
    int _1034 = int(_1026) + 1;
    uint _1036 = uint(int(uint(_1034) >> uint(2)));
    int _1038 = _1034 & 3;
    float _1040 = (*spvDescriptorSet0.vp_c15)._m0[int(_1036)][_1038];
    float _1042 = fma(_563, _852, _1012);
    float _1044 = fma(_563, _806, _1020);
    float _1046 = fma(_1008, _1008, _1022);
    float _1048 = fma(_561, _894, _1042);
    float _1050 = _643 * _758;
    float _1052 = sqrt(_1046);
    float _1054 = _978;
    float _1056 = _1044;
    if (!_822)
    {
        int _1058 = as_type<int>(_978) + 400;
        uint _1060 = uint(int(uint(_1058) >> uint(2)));
        uint _1062 = uint(int(uint(int(_1060)) >> uint(2)));
        int _1064 = int(_1060) & 3;
        float _1066 = (*spvDescriptorSet0.vp_c15)._m0[int(_1062)][_1064];
        _1054 = _1066;
    }
    float _1068 = _1054;
    float _1070 = _1048 + _902;
    float _1072 = fma(_563, _750, _1050);
    float _1074 = fma(_561, _834, _1044);
    bool _1076 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1078 = isnan(0.5);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1084 = _1080 || _1082;
    float _1086 = fma(_561, _780, _1072);
    float _1088 = _1010;
    float _1090 = _1072;
    if (!_822)
    {
        float _1092 = floor(_675);
        _1088 = _1092;
    }
    float _1094 = _1088;
    float _1096 = _1074 + _842;
    float _1098 = _1086 + _788;
    bool _1100 = _1052 > 0.0;
    float _1102 = 1.0 / _1070;
    bool _1104 = !_1100;
    float _1106 = _1094;
    float _1108 = _1102;
    if (!_1104)
    {
        float _1110 = _309 * _309;
        float _1112 = rsqrt(_1046);
        float _1114 = fma(_307, _307, _1110);
        float _1116 = fma(_311, _311, _1114);
        float _1118 = sqrt(_1116);
        float _1120 = _1004 * _1112;
        float _1122 = _982 * _1112;
        float _1124 = _1008 * _1112;
        bool _1126 = _1118 > 0.0;
        bool _1128 = !_1126;
        _918 = _1124;
        _920 = _1122;
        _1090 = _1110;
        if (!_1128)
        {
            float _1130 = rsqrt(_1116);
            float _1132 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1134 = _309 * _1130;
            float _1136 = _307 * _1130;
            float _1138 = _311 * _1130;
            float _1140 = _1122 * _1134;
            float _1142 = fma(_1120, _1136, _1140);
            float _1144 = _1132 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1146 = fma(_1124, _1138, _1142);
            float _1148 = _1146 * _1144;
            float _1150 = fma(_307, _1148, _960);
            float _1152 = fma(_309, _1148, _958);
            float _1154 = fma(_311, _1148, _962);
            _968 = _1150;
            _970 = _1152;
            _972 = _1154;
            _1056 = _1132;
            _920 = _1144;
            _1090 = _1138;
        }
    }
    float _1156 = _968;
    float _1158 = _970;
    float _1160 = _972;
    float _1162 = _918;
    float _1164 = _1056;
    float _1166 = _920;
    float _1168 = _1090;
    float _1170 = _1166;
    float _1172 = _1164;
    float _1174 = _1162;
    float _1176 = _1168;
    if (_1084)
    {
        _1170 = _1156;
    }
    float _1178 = _1170;
    float _1180 = _1178;
    if (_1084)
    {
        _1172 = _1158;
    }
    float _1182 = _1172;
    float _1184 = _1182;
    if (_1084)
    {
        _1174 = _1160;
    }
    float _1186 = _1174;
    float _1188 = _1186;
    if (!_1084)
    {
        float _1190 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1192 = _595 + _1190;
        float _1194 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1196 = _563 + _1194;
        float _1198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1200 = -_595;
        float _1202 = _1200 + _1158;
        float _1204 = _1192 * _1192;
        float _1206 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1208 = _561 + _1206;
        float _1210 = -_563;
        float _1212 = _1210 + _1156;
        float _1214 = -_561;
        float _1216 = _1214 + _1160;
        float _1218 = fma(_1196, _1196, _1204);
        float _1220 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1222 = fma(_1208, _1208, _1218);
        float _1224 = sqrt(_1222);
        float _1226 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        bool _1228 = _1224 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1230 = isnan(_1224);
        bool _1232 = _1228 || _1230;
        bool _1234 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1236 = _1232 || _1234;
        float _1238 = precise::min(_1224, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1240 = _1238 * _1198;
        float _1242 = _1226 * _1240;
        float _1244 = _1186;
        float _1246 = _1238;
        float _1248 = _1224;
        if (_1236)
        {
            float _1250 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1244 = _1250;
        }
        float _1252 = _1244;
        if (_1236)
        {
            float _1254 = precise::max(_1224, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1246 = _1254;
        }
        float _1256 = _1246;
        float _1258 = fma(_1202, _1242, _595);
        float _1260 = fma(_1212, _1242, _563);
        float _1262 = _1258;
        float _1264 = _1260;
        if (_1236)
        {
            float _1266 = _1256 * _1252;
            _1248 = _1266;
        }
        float _1268 = _1248;
        float _1270 = fma(_1216, _1242, _561);
        float _1272 = _1268;
        _1188 = _1270;
        if (_1236)
        {
            float _1274 = _1226 * _1268;
            _1272 = _1274;
        }
        float _1276 = _1272;
        _1176 = _1276;
        if (_1236)
        {
            float _1278 = fma(_1202, _1276, _595);
            _1262 = _1278;
        }
        float _1280 = _1262;
        _1184 = _1280;
        if (_1236)
        {
            float _1282 = fma(_1212, _1276, _563);
            _1264 = _1282;
        }
        float _1284 = _1264;
        _1180 = _1284;
        if (_1236)
        {
            float _1286 = fma(_1216, _1276, _561);
            _1188 = _1286;
        }
    }
    float _1288 = _1184;
    float _1290 = _1180;
    float _1292 = _1188;
    float _1294 = _1176;
    float _1296 = _1288 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1298 = _1288 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1300 = _1288 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1302 = _1098 * _1102;
    float _1304 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1296);
    float _1306 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1298);
    float _1308 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1300);
    float _1310 = _1294;
    if (!_822)
    {
        float _1312 = rint(_1068);
        float _1314 = precise::max(_1312, 0.0);
        uint _1316 = uint(_1314);
        uint _1318 = clamp(_1316, 0u, 65535u);
        _1310 = as_type<float>(_1318);
    }
    float _1320 = _1310;
    float _1322 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1304);
    bool _1324 = _1302 >= 0.0;
    float _1326 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1306);
    float _1328 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1308);
    float _1330 = _1288 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1332 = _1096 * _1102;
    bool _1334 = _1302 <= 1.0;
    bool _1336 = _1334 && _1324;
    float _1338 = _1326 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1340 = _1322 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1342 = _1328 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1344 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1330);
    bool _1346 = _1332 >= 0.0;
    bool _1348 = _1346 && _1336;
    float _1350 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1352 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1354 = _1338 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1356 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1344);
    float _1358 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1350);
    bool _1360 = _1332 <= 1.0;
    bool _1362 = _1360 && _1348;
    float _1364 = -_1354;
    float _1366 = fma(_1364, _1352, 1.0);
    float _1368 = _1356 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1370 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1358);
    float _1372 = _643 * _1000;
    float _1374 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1376 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1378 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1370);
    float _1380 = log2(_1366);
    float _1382 = fma(_563, _992, _1372);
    float _1384 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1374);
    float _1386 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1376);
    float _1388 = _1356;
    if (!_822)
    {
        float _1390 = -_1094;
        float _1392 = _675 + _1390;
        _1106 = _1392;
    }
    float _1394 = _1106;
    if (_1362)
    {
        float _1396 = float(_721);
        _870 = _1396;
    }
    float _1398 = _870;
    float _1400 = fma(_561, _1032, _1382);
    float _1402 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1384);
    float _1404 = 1.0 / _1378;
    float _1406 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1386);
    float _1408 = _1400 + _1040;
    float _1410 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1402);
    float _1412 = _1398;
    if (!_822)
    {
        float _1414 = -_1018;
        float _1416 = _685 + _1414;
        _1388 = _1416;
    }
    float _1418 = _1388;
    float _1420 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1406);
    float _1422 = _1382;
    if (_1362)
    {
        float _1424 = rint(_1398);
        float _1426 = precise::max(_1424, 0.0);
        uint _1428 = uint(_1426);
        uint _1430 = clamp(_1428, 0u, 65535u);
        _1422 = as_type<float>(_1430);
    }
    float _1432 = _1422;
    float _1434 = _1380 * 0.693147182464599609375;
    float _1436 = _1408 * _1102;
    float _1438 = _1410 * _1404;
    float _1440 = _1420 * _1404;
    float _1442 = _1434 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1444 = fma(_1438, 0.5, 0.5);
    float _1446 = fma(_1440, -0.5, 0.5);
    float _1448 = _1320;
    if (!_822)
    {
        float3 _4731 = float3(_1418, _1394, float(as_type<int>(_1320)));
        float3 _4735 = select(_4731, float3(0.0), isnan(_4731));
        float _1450 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4735.xy, uint(rint(_4735.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4735.xy, uint(rint(_4735.z)), level(0.0)).x;
        _1448 = _1450;
    }
    float _1452 = _1448;
    float _1454 = _1440;
    float _1456 = _1432;
    if (_1362)
    {
        float3 _4751 = float3(_1302, _1332, float(as_type<int>(_1432)));
        float3 _4753 = select(_4751, float3(0.0), isnan(_4751));
        float _1458 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4753.xy, uint(rint(_4753.z)), _1436, level(0.0));
        _1454 = _1458;
    }
    float _1460 = _1454;
    float3 _4763 = float3(_1444, _1446, _1442);
    float _1462 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4763, float3(0.0), isnan(_4763)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4763, float3(0.0), isnan(_4763)), level(0.0)).x;
    float3 _4772 = float3(_1444, _1446, _1442);
    float4 _1465 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4772, float3(0.0), isnan(_4772)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4772, float3(0.0), isnan(_4772)), level(0.0)).xyzw;
    float _1467 = _1465.x;
    float _1469 = _1465.y;
    float _1471 = _1465.z;
    float _1473 = _1465.w;
    bool _1475 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1477 = isnan(0.5);
    bool _1479 = _1475 || _1477;
    bool _1481 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1483 = _1479 || _1481;
    if (_822)
    {
        _1412 = 1.0;
    }
    float _1485 = _1412;
    float _1487 = _1485;
    if (_1483)
    {
        _1108 = 1.0;
    }
    float _1489 = _1108;
    float _1491 = _1489;
    float _1493 = _1452;
    float _1495 = _1471;
    float _1497 = _1473;
    if (!_1483)
    {
        float _1499 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1501 = _1499 * 0.15915493667125701904296875;
        float _1503 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1505 = _1501 * 6.283185482025146484375;
        float _1507 = cos(_1505);
        float _1509 = _1503 * 0.15915493667125701904296875;
        float _1511 = _1501 * 6.283185482025146484375;
        float _1513 = sin(_1511);
        float _1515 = 1.0 / _1507;
        float _1517 = _1509 * 6.283185482025146484375;
        float _1519 = cos(_1517);
        float _1521 = _1513 * _1515;
        float _1523 = _1509 * 6.283185482025146484375;
        float _1525 = sin(_1523);
        float _1527 = _1519 * _1521;
        float _1529 = 1.0 / _1527;
        float _1531 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1533 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1531;
        float _1535 = 1.0 / _1533;
        float _1537 = _1525 * _1529;
        float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1541 = fma(_669, _1537, _1539);
        float _1543 = _1541 * _1535;
        float _1545 = precise::clamp(_1543, 0.0, 1.0);
        float _1547 = -_1545;
        float _1549 = _1547 + 1.0;
        _1456 = _1527;
        _1491 = _1549;
    }
    float _1551 = _1456;
    float _1553 = _1491;
    float _1555 = _1551;
    if (!_822)
    {
        int _1557 = _876 << 4;
        int _1559 = _1557 + 2048;
        uint _1561 = uint(int(uint(_1559) >> uint(2)));
        uint _1563 = uint(int(uint(int(_1561)) >> uint(2)));
        int _1565 = int(_1561) & 3;
        float _1567 = (*spvDescriptorSet0.vp_c15)._m0[int(_1563)][_1565];
        int _1569 = int(_1561) + 1;
        uint _1571 = uint(int(uint(_1569) >> uint(2)));
        int _1573 = _1569 & 3;
        float _1575 = (*spvDescriptorSet0.vp_c15)._m0[int(_1571)][_1573];
        int _1577 = _1559 + 8;
        uint _1579 = uint(int(uint(_1577) >> uint(2)));
        uint _1581 = uint(int(uint(int(_1579)) >> uint(2)));
        int _1583 = int(_1579) & 3;
        float _1585 = (*spvDescriptorSet0.vp_c15)._m0[int(_1581)][_1583];
        int _1587 = int(_1579) + 1;
        uint _1589 = uint(int(uint(_1587) >> uint(2)));
        int _1591 = _1587 & 3;
        float _1593 = (*spvDescriptorSet0.vp_c15)._m0[int(_1589)][_1591];
        float _1595 = _643 * _1575;
        float _1597 = fma(_563, _1567, _1595);
        float _1599 = fma(_561, _1585, _1597);
        float _1601 = _1599 + _1593;
        float _1603 = precise::clamp(_1601, 0.0, 1.0);
        float _1605 = -_1603;
        float _1607 = _1605 + _1452;
        float _1609 = fma(_1607, 500.0, 1.5);
        float _1611 = exp2(_1609);
        float _1613 = 0.0 + _1611;
        float _1615 = precise::clamp(_1613, 0.0, 1.0);
        _1555 = _1585;
        _1487 = _1615;
    }
    float _1617 = _1555;
    float _1619 = _1487;
    float _1621 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1623 = _1288 + _1621;
    float _1625 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1627 = _1290 + _1625;
    float _1629 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1631 = _1292 + _1629;
    float _1633 = _1623 * _1623;
    float _1635 = fma(_1627, _1627, _1633);
    float _1637 = fma(_1631, _1631, _1635);
    float _1639 = rsqrt(_1637);
    float _1641 = _1639 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1643 = _1627 * _1641;
    float _1645 = _1631 * _1641;
    float _1647 = _1643 * _1643;
    float _1649 = _1645 * _1645;
    float _1651 = _1647 + _1649;
    float _1653 = sqrt(_1651);
    bool _1655 = _1653 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1657 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1659 = _1653 + _1657;
    float _1661 = _1631;
    float _1663 = _1617;
    float _1665 = _1659;
    float _1667 = _1623;
    if (_1655)
    {
        float _1669 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1661 = _1669;
    }
    float _1671 = _1661;
    if (_1655)
    {
        float _1673 = rsqrt(_1651);
        _1663 = _1673;
    }
    float _1675 = _1663;
    float _1677 = _1675;
    if (_1655)
    {
        float _1679 = _1659 * _1671;
        _1665 = _1679;
    }
    float _1681 = _1665;
    if (_1655)
    {
        float _1683 = _1681 * 0.15915493667125701904296875;
        _1493 = _1683;
    }
    float _1685 = _1493;
    float _1687 = _1639;
    if (_1655)
    {
        float _1689 = _1685 * 6.283185482025146484375;
        float _1691 = sin(_1689);
        _1687 = _1691;
    }
    float _1693 = _1687;
    float _1695 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1697 = precise::max(0.0, _1695);
    float _1699 = _1633;
    float _1701 = _1697;
    float _1703 = _1695;
    if (_1655)
    {
        float _1705 = _1685 * 6.283185482025146484375;
        float _1707 = cos(_1705);
        _1699 = _1707;
    }
    float _1709 = _1699;
    float _1711 = -_1641;
    float _1713 = -_1697;
    float _1715 = fma(_1623, _1711, _1713);
    if (_1655)
    {
        float _1717 = _1715 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1701 = _1717;
    }
    float _1719 = _1701;
    float _1721 = _1719;
    float _1723 = _1693;
    if (_1655)
    {
        float _1725 = fma(_1693, _1719, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1721 = _1725;
    }
    float _1727 = _1721;
    float _1729 = _1727;
    if (!_1655)
    {
        _1723 = _1643;
    }
    float _1731 = _1723;
    float _1733 = _1731;
    float _1735 = _1709;
    if (_1655)
    {
        float _1737 = _1709 + (-1.0);
        _1703 = _1737;
    }
    float _1739 = _1703;
    float _1741 = _1739;
    if (_1655)
    {
        float _1743 = _1675 * _1727;
        _1014 = _1743;
    }
    float _1745 = _1014;
    if (!_1655)
    {
        _1729 = _1715;
    }
    float _1747 = _1729;
    float _1749 = _1747;
    if (_1655)
    {
        float _1751 = _1739 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1667 = _1751;
    }
    float _1753 = _1667;
    if (_1655)
    {
        float _1755 = _1643 * _1745;
        _1733 = _1755;
    }
    float _1757 = _1733;
    if (!_1655)
    {
        _1741 = _1645;
    }
    float _1759 = _1741;
    float _1761 = _1759;
    if (_1655)
    {
        float _1763 = _1645 * _1745;
        _1761 = _1763;
    }
    float _1765 = _1761;
    if (!_1655)
    {
        _1677 = _1647;
    }
    float _1767 = _1677;
    float _1769 = _1767;
    if (_1655)
    {
        float _1771 = fma(_1715, _1709, _1753);
        _1749 = _1771;
    }
    float _1773 = _1749;
    if (_1655)
    {
        float _1775 = _1757 * _1757;
        _1769 = _1775;
    }
    float _1777 = _1769;
    if (!_1655)
    {
        _1735 = _1649;
    }
    float _1779 = _1735;
    float _1781 = sqrt(_1637);
    float _1783 = _1779;
    if (_1655)
    {
        float _1785 = _1765 * _1765;
        _1783 = _1785;
    }
    float _1787 = _1783;
    float _1789 = fma(_1773, _1773, _1777);
    float _1791 = _1789 + _1787;
    float _1793 = rsqrt(_1791);
    float _1795 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1797 = fma(_1781, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1795);
    float _1799 = precise::clamp(_1797, 0.0, 1.0);
    float _1801 = -_1799;
    float _1803 = _1801 + 1.0;
    float _1805 = abs(_1803);
    float _1807 = log2(_1805);
    float _1809 = _1793 * _1757;
    float _1811 = _1793 * _1773;
    float _1813 = _1793 * _1765;
    float _1815 = _1809 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1817 = -_1815;
    float _1819 = fma(_1811, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1817);
    float _1821 = -_1813;
    float _1823 = fma(_1821, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1819);
    float _1825 = _1807 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1827 = fma(_1823, -0.5, 0.5);
    float _1829 = fma(_1823, 0.5, 0.5);
    float _1831 = exp2(_1825);
    float _1833 = fma(_1829, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1835 = fma(_1829, _1833, -0.212114393711090087890625);
    float _1837 = _1811 + 1.0;
    float _1839 = sqrt(_1827);
    float _1841 = fma(_1829, _1835, 1.570728778839111328125);
    float _1843 = -_1811;
    float _1845 = fma(_1831, _1837, _1843);
    float _1847 = fma(_1845, 0.5, 0.5);
    float _1849 = _1839 * 0.636619746685028076171875;
    float _1851 = -_1841;
    float _1853 = fma(_1849, _1851, 1.0);
    float2 _5349 = float2(_1853, _1847);
    float3 _1857 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5349, float2(0.0), isnan(_5349)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5349, float2(0.0), isnan(_5349)), level(0.0)).xyz;
    float _1859 = _1857.x;
    float _1861 = _1857.y;
    float _1863 = _1857.z;
    float _1865 = abs(_669);
    float _1867 = log2(_1865);
    float _1869 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1871 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1873 = _1871 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1875 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1877 = _1875 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1879 = _537 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1881 = isnan(_537);
    bool _1883 = _1879 || _1881;
    bool _1885 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1887 = _1883 || _1885;
    float _1889 = float(_1887);
    float _1891 = 1.0 / _1873;
    float _1893 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1895 = _1893 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1897 = _537 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1899 = isnan(_537);
    bool _1901 = _1897 || _1899;
    bool _1903 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1905 = _1901 || _1903;
    float _1907 = float(_1905);
    float _1909 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1911 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1909;
    float _1913 = -_1889;
    float _1915 = _1913 + 1.0;
    bool _1917 = _537 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1919 = isnan(_537);
    bool _1921 = _1917 || _1919;
    bool _1923 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1925 = _1921 || _1923;
    float _1927 = float(_1925);
    float _1929 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1869);
    float _1931 = 1.0 / _1877;
    float _1933 = _1907 * _1915;
    float _1935 = -_1907;
    float _1937 = _1935 + 1.0;
    float _1939 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1941 = _1939 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1943 = _1867 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1945 = _1807 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1947 = _1927 * _1937;
    float _1949 = -_1927;
    float _1951 = _1949 + 1.0;
    float _1953 = 1.0 / _1895;
    float _1955 = _1911 * _1891;
    float _1957 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1959 = _537 + _1957;
    float _1961 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1929);
    bool _1963 = _669 <= 8000.0;
    bool _1965 = isnan(_669);
    bool _1967 = _1963 || _1965;
    bool _1969 = isnan(8000.0);
    bool _1971 = _1967 || _1969;
    float _1973 = float(_1971);
    float _1975 = fma(_1955, _1959, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1977 = _537 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1979 = isnan(_537);
    bool _1981 = _1977 || _1979;
    bool _1983 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1985 = _1981 || _1983;
    float _1987 = float(_1985);
    float _1989 = _1941 * _1931;
    float _1991 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1993 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1991;
    float _1995 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1997 = _537 + _1995;
    float _1999 = _1975 * _1947;
    float _2001 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2003 = _537 + _2001;
    float _2005 = -_1987;
    float _2007 = _2005 + 1.0;
    float _2009 = fma(_1989, _1997, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2011 = fma(_1951, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1999);
    float _2013 = _1993 * _1953;
    float _2015 = exp2(_1943);
    float _2017 = fma(_2009, _1933, _2011);
    float _2019 = fma(_2013, _2003, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _2021 = _1889 * _2007;
    float _2023 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2025 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2027 = fma(_2019, _2021, _2017);
    float _2029 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2031 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2033 = _2025 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2035 = _2029 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2037 = fma(_1987, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2027);
    float _2039 = _2031 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2041 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2043 = exp2(_1945);
    float _2045 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1961);
    float _2047 = as_type<float>(_223) * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_80.x = _2033;
    out.m_80.y = _2035;
    out.m_80.z = _2039;
    out.m_80.w = _2023;
    float _2049 = -_581;
    float _2051 = _2049 + 1.0;
    float _2053 = _2045 + _1378;
    float _2055 = as_type<float>(_237) * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2057 = _2047 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2059 = _2047 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2061 = _2047 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2063 = fma(_2055, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2057);
    float _2065 = fma(_2055, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2059);
    float _2067 = fma(_2055, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2061);
    float _2069 = _2053 * 0.5;
    bool _2071 = _1781 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2073 = isnan(_1781);
    bool _2075 = _2071 || _2073;
    bool _2077 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2079 = _2075 || _2077;
    float _2081 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2083 = _2037 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2085 = _2041 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2087 = fma(_2015, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2089 = precise::clamp(_2087, 0.0, 1.0);
    float _2091 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2093 = _2081 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_82.z = _2069;
    out.m_82.w = _1378;
    float _2095 = fma(_2089, -2.0, 3.0);
    float _2097 = _2089 * _2089;
    float _2099 = _2091 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.gl_Position.x = _1410;
    out.gl_Position.y = _1420;
    out.gl_Position.z = _2045;
    out.gl_Position.w = _1378;
    float _2101 = _2097 * _2095;
    out.m_84.x = _2085;
    out.m_84.y = _2093;
    out.m_84.z = _2099;
    out.m_84.w = _2083;
    float _2103 = -_2101;
    float _2105 = _2103 + 1.0;
    float _2107 = fma(_2105, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2101);
    float _2109 = _1973 * _2107;
    float _2111 = -_2043;
    float _2113 = _2111 + 1.0;
    float _2115 = _1410;
    float _2117 = _2063;
    float _2119 = _2065;
    if (!_1362)
    {
        _2115 = 1.0;
    }
    float _2121 = _2115;
    float _2123 = _1553 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2125 = _2109 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2127 = _2121;
    float _2129 = _2123;
    if (_1362)
    {
        bool _2131 = _1460 >= _1436;
        bool _2133 = isnan(_1460);
        bool _2135 = _2131 || _2133;
        bool _2137 = isnan(_1436);
        bool _2139 = _2135 || _2137;
        float _2141 = float(_2139);
        _2127 = _2141;
    }
    float _2143 = _2127;
    float _2145 = _2113 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2147 = _2051 * _2125;
    float _2149 = precise::clamp(_2147, 0.0, 1.0);
    float _2151 = _2145 * _1462;
    float _2153 = _2143 * _1619;
    float _2155 = -_2149;
    float _2157 = fma(_2155, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2159 = -_2145;
    float _2161 = _2159 + 1.0;
    float _2163 = _1473 * _2151;
    float _2165 = _315 * _2123;
    float _2167 = -_2153;
    float _2169 = fma(_2167, _2157, 1.0);
    float _2171 = precise::clamp(_2169, 0.0, 1.0);
    if (!_2079)
    {
        _319 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2173 = _319;
    float _2175 = _2173;
    float _2177 = _2173;
    if (!_2079)
    {
        _2129 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2179 = _2129;
    float _2181 = _2171 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2183 = _2063 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2185 = _2179;
    float _2187 = _2179;
    if (!_2079)
    {
        _2117 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2189 = _2117;
    out.m_86.x = _2181;
    float _2191 = _1863 * _2151;
    float _2193 = fma(_1861, _2163, _1469);
    float _2195 = fma(_1859, _2163, _1467);
    float _2197 = _1473 * _2161;
    float _2199 = fma(_1473, _2191, _1471);
    float _2201 = _2065 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2203 = _2067 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2205 = _2189;
    float _2207 = _2189;
    if (!_2079)
    {
        _1495 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2209 = _1495;
    out.m_88.x = _2195;
    out.m_88.y = _2193;
    out.m_88.z = _2199;
    out.m_88.w = _2197;
    float _2211 = _2209;
    float _2213 = _2209;
    if (!_2079)
    {
        _1497 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2215 = _1497;
    float _2217 = _2215;
    float _2219 = _2215;
    if (!_2079)
    {
        _2119 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2221 = _2119;
    out.m_90.x = _2183;
    out.m_90.y = _2201;
    out.m_90.z = _2203;
    bool _2223 = !_2079;
    float _2225 = _2221;
    float _2227 = _2221;
    if (!_2223)
    {
        bool _2229 = _1781 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2231 = isnan(_1781);
        bool _2233 = _2229 || _2231;
        bool _2235 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2237 = _2233 || _2235;
        if (!_2237)
        {
            float _2239 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2241 = _1781 + _2239;
            float _2243 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2245 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2243;
            float _2247 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2249 = _2247 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2251 = 1.0 / _2245;
            float _2253 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2255 = _2253 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2257 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2259 = _2257 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2261 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2263 = _2261 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2265 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2267 = _2265 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2269 = _2241 * _2251;
            float _2271 = precise::clamp(_2269, 0.0, 1.0);
            float _2273 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2275 = _2273 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2277 = fma(_2271, _2249, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2279 = fma(_2271, _2275, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2281 = fma(_2271, _2255, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2283 = fma(_2271, _2259, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2285 = fma(_2271, _2263, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2287 = fma(_2271, _2267, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2219 = _2281;
            _2227 = _2285;
            _2213 = _2277;
            _2207 = _2283;
            _2177 = _2279;
            _2187 = _2287;
            _2289 = true;
        }
        else
        {
            bool _2291 = _1781 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2293 = isnan(_1781);
            bool _2295 = _2291 || _2293;
            bool _2297 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2299 = _2295 || _2297;
            if (!_2299)
            {
                _2211 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2301 = _2211;
            _2213 = _2301;
            if (!_2299)
            {
                _2217 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2303 = _2217;
            _2219 = _2303;
            if (!_2299)
            {
                _2175 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2305 = _2175;
            _2177 = _2305;
            if (!_2299)
            {
                _2205 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2307 = _2205;
            _2207 = _2307;
            if (!_2299)
            {
                _2225 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2309 = _2225;
            _2227 = _2309;
            if (!_2299)
            {
                _2185 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2311 = _2185;
            bool _2313 = !_2299;
            _2187 = _2311;
            if (!_2313)
            {
                bool _2315 = _1781 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2317 = isnan(_1781);
                bool _2319 = _2315 || _2317;
                bool _2321 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2323 = _2319 || _2321;
                if (!_2323)
                {
                    float _2325 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2327 = _1781 + _2325;
                    float _2329 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2331 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2329;
                    float _2333 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2335 = _2333 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2337 = 1.0 / _2331;
                    float _2339 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2341 = _2339 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2343 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2345 = _2343 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2347 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2349 = _2347 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2351 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2353 = _2351 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2355 = _2327 * _2337;
                    float _2357 = precise::clamp(_2355, 0.0, 1.0);
                    float _2359 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2361 = _2359 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2363 = fma(_2357, _2335, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2365 = fma(_2357, _2361, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2367 = fma(_2357, _2341, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2369 = fma(_2357, _2345, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2371 = fma(_2357, _2349, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2373 = fma(_2357, _2353, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2219 = _2367;
                    _2227 = _2371;
                    _2213 = _2363;
                    _2207 = _2369;
                    _2177 = _2365;
                    _2187 = _2373;
                    _2289 = true;
                }
                else
                {
                    _2219 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2227 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2213 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2207 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2177 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2187 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2289 = false;
    float _2375 = _2219;
    float _2377 = _2227;
    float _2379 = _2213;
    float _2381 = _2207;
    float _2383 = _2177;
    float _2385 = _2187;
    float _2387 = fma(_2201, -0.5, 0.5);
    float _2389 = precise::clamp(_2387, 0.0, 1.0);
    float _2391 = -_2375;
    float _2393 = _2391 + _2377;
    float _2395 = _2165 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2397 = -_2379;
    float _2399 = _2397 + _2381;
    float _2401 = fma(_2389, _2393, _2375);
    out.m_92.x = 0.0;
    float _2403 = -_2383;
    float _2405 = _2403 + _2385;
    float _2407 = fma(_2389, _2399, _2379);
    float _2409 = _2401 * 0.586610972881317138671875;
    out.m_59.x = _2395;
    bool _2411 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2413 = fma(_2389, _2405, _2383);
    float _2415 = fma(_2407, 0.298911988735198974609375, _2409);
    bool _2417 = _1553 > 0.0;
    bool _2419 = isnan(_1553);
    bool _2421 = _2417 || _2419;
    bool _2423 = isnan(0.0);
    bool _2425 = _2421 || _2423;
    float _2427 = fma(_2413, 0.114477999508380889892578125, _2415);
    float _2429 = -_2427;
    float _2431 = _2407 + _2429;
    float _2433 = -_2427;
    float _2435 = _2401 + _2433;
    float _2437 = -_2427;
    float _2439 = _2413 + _2437;
    float _2441 = fma(_2431, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2427);
    float _2443 = fma(_2435, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2427);
    float _2445 = fma(_2439, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2427);
    bool _2447 = !_2411;
    if (!_2447)
    {
        float _2449 = -_1288;
        float _2451 = _2449 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2453 = -_1290;
        float _2455 = _2453 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2457 = -_1292;
        float _2459 = _2457 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2461 = _2451 * _2451;
        float _2463 = fma(_2455, _2455, _2461);
        float _2465 = fma(_2459, _2459, _2463);
        float _2467 = sqrt(_2465);
        float _2469 = rsqrt(_2465);
        float _2471 = -_2467;
        float _2473 = _2471 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2475 = _2473 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2477 = precise::clamp(_2475, 0.0, 1.0);
        float _2479 = _2455 * _2469;
        float _2481 = _2451 * _2469;
        float _2483 = abs(_2477);
        float _2485 = log2(_2483);
        float _2487 = _2459 * _2469;
        float _2489 = _2479 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2491 = _2201 * _2481;
        float _2493 = -_2481;
        float _2495 = -_2489;
        float _2497 = fma(_2493, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2495);
        float _2499 = fma(_2183, _2479, _2491);
        float _2501 = -_2487;
        float _2503 = fma(_2501, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2497);
        float _2505 = fma(_2203, _2487, _2499);
        float _2507 = precise::clamp(_2505, 0.0, 1.0);
        float _2509 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2511 = _2503 + _2509;
        float _2513 = _2485 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2515 = _2511 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2517 = precise::clamp(_2515, 0.0, 1.0);
        float _2519 = exp2(_2513);
        float _2521 = _2519 * _2517;
        float _2523 = _2507 * _2521;
        float _2525 = _2523 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2527 = _2523 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2529 = _2523 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _2525;
        out.m_92.y = _2527;
        out.m_92.z = _2529;
    }
    out.m_94.x = _2441;
    out.m_94.y = _2443;
    out.m_94.z = _2445;
    if (_2425)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_59.x = 0.0;
    float _2531 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2531;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

