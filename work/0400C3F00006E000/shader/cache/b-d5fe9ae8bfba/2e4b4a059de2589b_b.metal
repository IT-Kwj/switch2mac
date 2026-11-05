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
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c10 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_20 [[id(7)]];
    sampler vp_t_tcb_20Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_24 [[id(9)]];
    sampler vp_t_tcb_24Smplr [[id(10)]];
    texture2d_array<float> vp_t_tcb_16 [[id(11)]];
    sampler vp_t_tcb_16Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_32 [[id(13)]];
    sampler vp_t_tcb_32Smplr [[id(14)]];
    texture3d<float> vp_t_tcb_30 [[id(15)]];
    sampler vp_t_tcb_30Smplr [[id(16)]];
    texture2d<float> vp_t_tcb_1C [[id(17)]];
    sampler vp_t_tcb_1CSmplr [[id(18)]];
    texture2d_array<float> vp_t_tcb_14 [[id(19)]];
    sampler vp_t_tcb_14Smplr [[id(20)]];
    sampler vp_t_tcb_20Smplr_w [[id(21)]];
    sampler vp_t_tcb_24Smplr_w [[id(22)]];
    sampler vp_t_tcb_32Smplr_w [[id(23)]];
    sampler vp_t_tcb_30Smplr_w [[id(24)]];
    sampler vp_t_tcb_1CSmplr_w [[id(25)]];
    sampler vp_t_tcb_14Smplr_w [[id(26)]];
    constant dm_border_t* dm_border [[id(27)]];
};

struct main0_out
{
    float4 m_82 [[user(locn0)]];
    float4 m_84 [[user(locn1)]];
    float4 m_104 [[user(locn2)]];
    float4 m_90 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_88 [[user(locn6)]];
    float4 m_94 [[user(locn7)]];
    float4 m_96 [[user(locn8)]];
    float4 m_86 [[user(locn9)]];
    float4 m_102 [[user(locn10)]];
    float4 m_92 [[user(locn11)]];
    float4 m_98 [[user(locn12)]];
    float4 m_100 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_76 [[attribute(1)]];
    float4 m_80 [[attribute(2)]];
    float4 m_78 [[attribute(3)]];
    float4 m_72 [[attribute(4)]];
    float4 m_60 [[attribute(5)]];
    float4 m_65 [[attribute(6)]];
    float4 m_70 [[attribute(7)]];
    float4 m_74 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3913 = false;
    bool _2792 = false;
    bool _219 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _118 = in.m_60.w;
    float _120 = trunc(_118);
    int _123 = int(_120);
    bool _127 = _123 >= 1;
    float _129 = 0.0;
    if (!_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    float _133 = _131;
    if (!_127)
    {
        out.m_63.x = 0.0;
    }
    int _135 = 0;
    if (!_127)
    {
        float _137 = _131 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    int _141 = _139;
    if (!_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4198 = as_type<float>(_139);
        out.gl_Position.z = _4198;
    }
    if (!_127)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _143 = in.m_65.w;
    bool _145 = _143 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _147 = isnan(_143);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _153 = _149 || _151;
    float _155 = -_143;
    float _157 = _155 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _159 = _157;
    if (_153)
    {
        float _161 = float(_123);
        _133 = _161;
    }
    float _163 = _133;
    bool _165 = _157 >= _163;
    bool _167 = !_153;
    bool _169 = _165 || _167;
    float _171 = _163;
    if (_169)
    {
        _171 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _173 = _171;
    if (_169)
    {
        out.m_63.x = 0.0;
    }
    if (_169)
    {
        float _175 = _173 * 5.0;
        _141 = as_type<int>(_175);
    }
    int _177 = _141;
    if (_169)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4268 = as_type<float>(_177);
        out.gl_Position.z = _4268;
    }
    if (_169)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _179 = as_type<float>(int(gl_VertexIndex));
    bool _181 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _183 = as_type<int>(_179) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_179) & 2;
    bool _189 = _187 != 0;
    bool _191 = !_185;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_189;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_181;
    float _217;
    if (!_199)
    {
        float _201 = in.m_70.x;
        float _203 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _205 = _201 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _207 = fma(_205, (*spvDescriptorSet0.vp_c9)._m0[12].x, _157);
        float _209 = _207 * _203;
        float _211 = floor(_209);
        float _213 = -_211;
        float _215 = _209 + _213;
        _217 = _215;
        _219 = true;
    }
    else
    {
        float _221 = float(_123);
        float _223 = 1.0 / _221;
        float _225 = _157 * _223;
        _217 = _225;
    }
    _219 = false;
    float _227 = _217;
    float _229 = in.m_70.x;
    float _231 = in.m_70.y;
    float _233 = in.m_70.z;
    float _235 = in.m_70.w;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _239 = _227 + _237;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _241;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _247 = _245 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _249;
    float _253 = 1.0 / _243;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _257 = _255 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    int _259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _261 = _259 != 0;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _265 = 1.0 / _247;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _273;
    float _277 = _231 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _279 = _229 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _281 = 1.0 / _251;
    float _283 = _229 * 2.0;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _287 = _227 + _285;
    float _289 = -_267;
    float _291 = fma(_279, 2.0, _289);
    float _293 = _231 * 2.0;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _297 = _295 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _299 = floor(_283);
    float _301 = fma(_277, -2.0, _263);
    float _303 = _233 * 2.0;
    float _305 = _287 * _253;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _309 = _227 + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _311;
    float _315 = fma(_271, _305, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _317 = floor(_303);
    float _319 = _309 * _265;
    float _321 = _229 + _231;
    float _323 = fma(_275, _305, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _329 = _321 + (-1.0);
    float _331 = _233 + _231;
    float _333 = floor(_293);
    bool _335 = _299 > 0.0;
    float _337 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _339 = _331 + (-1.0);
    bool _341 = _299 >= 0.0;
    bool _343 = isnan(_299);
    bool _345 = _341 || _343;
    bool _347 = isnan(0.0);
    bool _349 = _345 || _347;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _353 = float(_123);
    float _355 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _357 = 1.0 / _257;
    bool _359 = _317 > 0.0;
    float _361 = fma(_297, _319, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _363 = as_type<int>(_339);
    if (_261)
    {
        _363 = 0;
    }
    int _365 = _363;
    float _367 = fma(_327, _319, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _369 = _317 >= 0.0;
    bool _371 = isnan(_317);
    bool _373 = _369 || _371;
    bool _375 = isnan(0.0);
    bool _377 = _373 || _375;
    int _379 = _365;
    if (!_261)
    {
        _379 = 1;
    }
    int _381 = _379;
    float _383 = 1.0 / _353;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _387 = _227 + _385;
    bool _389 = _333 > 0.0;
    bool _391 = _333 >= 0.0;
    bool _393 = isnan(_333);
    bool _395 = _391 || _393;
    bool _397 = isnan(0.0);
    bool _399 = _395 || _397;
    float _401 = _387 * _281;
    float _403 = _233 + _229;
    int _405 = _349 ? 0 : 1;
    float _407 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _409 = int(_407);
    bool _411 = _381 != 1;
    float _413 = _403 + (-1.0);
    int _415 = _377 ? 0 : 1;
    float _417 = fma(_313, _401, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _419 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _421 = _399 ? 0 : 1;
    float _423 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _425 = int(_423);
    int _427 = ~_405;
    int _429 = _427 + 1;
    int _431 = _429 + 1;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _433;
    int _437 = _431;
    float _439 = as_type<float>(_381);
    if (!_335)
    {
        int _441 = ~_405;
        int _443 = _441 + 1;
        _437 = _443;
    }
    int _445 = _437;
    float _447 = _239 * _357;
    int _449 = ~_415;
    int _451 = _449 + 1;
    int _453 = _451 + 1;
    float _455 = fma(_435, _401, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    int _457 = _453;
    if (!_359)
    {
        int _459 = ~_415;
        int _461 = _459 + 1;
        _457 = _461;
    }
    int _463 = _457;
    float _465 = _383 * _157;
    int _467 = ~_421;
    int _469 = _467 + 1;
    int _471 = _469 + 1;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _475 = _473 != 0;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _479 = _477 != 0;
    int _481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _483 = _481 != 0;
    int _485 = _471;
    if (!_389)
    {
        int _487 = ~_421;
        int _489 = _487 + 1;
        _485 = _489;
    }
    int _491 = _485;
    float _493 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _495 = log2(_493);
    bool _497 = !_479;
    int _499 = _497 ? 0 : 1;
    bool _501 = !_475;
    int _503 = _501 ? 0 : 1;
    bool _505 = !_483;
    int _507 = _505 ? 0 : 1;
    int _509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _511 = _509 != 0;
    int _513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _515 = _513 != 0;
    int _517 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _519 = _517 != 0;
    float _521 = float(_425);
    float _523 = as_type<float>(_425);
    if (!_411)
    {
        _523 = _231;
    }
    float _525 = _523;
    float _527 = _525;
    if (_411)
    {
        _527 = _229;
    }
    float _529 = _527;
    float _531 = 1.0 / _521;
    bool _533 = !_511;
    float _535 = _533 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _537 = _529 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _539 = _535;
    if (!_411)
    {
        _439 = _231;
    }
    float _541 = _439;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _545 = _541;
    if (_411)
    {
        _545 = _229;
    }
    float _547 = _545;
    float _549 = -_351;
    float _551 = fma(_537, 2.0, _549);
    float _553 = _495 * _157;
    int _555 = abs(as_type<int>(_535));
    float _557 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[83].z, _543);
    float _559 = _547;
    if (!_411)
    {
        _539 = _233;
    }
    float _561 = _539;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _565 = _561;
    if (_411)
    {
        _565 = _231;
    }
    float _567 = _565;
    float _569 = exp2(_553);
    if (!_411)
    {
        _559 = _233;
    }
    float _571 = _559;
    float _573 = _531 * _157;
    float _575 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[83].w, _563);
    float _577 = _571;
    if (_411)
    {
        _577 = _231;
    }
    float _579 = _577;
    float _581 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[82].z, _557);
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _585 = float(_409);
    float _587 = _579 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _589 = float(_555);
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _593 = 1.0 + _591;
    float _595 = 1.0 / _585;
    float _597 = fma(_587, -2.0, _583);
    float _599 = float(_463);
    float _601 = -_157;
    float _603 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[76].x, _291);
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _607 = 1.0 / _593;
    float _609 = _589 * _599;
    bool _611 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _613 = isnan(1.0);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _619 = _615 || _617;
    float _621 = in.m_72.x;
    float _623 = in.m_72.y;
    float _625 = in.m_72.z;
    float _627 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[78].z, _605);
    float _629 = -_569;
    float _631 = _629 + 1.0;
    bool _633 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _635 = isnan(0.0);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _641 = _637 || _639;
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _645 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _647 = isnan(_227);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = _595 * _157;
    float _659 = _641 ? _631 : 0.0;
    float _661 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[78].w, _643);
    bool _663 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _665 = isnan(_227);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    float _675 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[76].y, _301);
    float _677 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[82].w, _575);
    float _679 = -_655;
    float _681 = _679 + 1.0;
    float _683 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[77].z, _627);
    float _685 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[77].w, _661);
    float _687 = -_157;
    float _689 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[81].x, _551);
    float _691 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[81].y, _597);
    if (_619)
    {
        float _693 = _659 * _607;
        _159 = _693;
    }
    float _695 = _159;
    float _697 = _609 * (-2.0);
    bool _699 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _701 = isnan(_227);
    bool _703 = _699 || _701;
    bool _705 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _707 = _703 || _705;
    float _709 = float(_707);
    float _711 = -_673;
    float _713 = _711 + 1.0;
    float _715 = _673 * _681;
    float _717 = fma(_337, _697, _337);
    bool _719 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _721 = isnan(_227);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _727 = _723 || _725;
    float _729 = float(_727);
    float _731 = _709 * _713;
    bool _733 = !_515;
    int _735 = _733 ? 0 : 1;
    float _737 = -_709;
    float _739 = _737 + 1.0;
    bool _741 = !_519;
    int _743 = _741 ? 0 : 1;
    float _745 = fma(_697, _621, _621);
    int _747 = abs(_735);
    bool _749 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _751 = isnan(_227);
    bool _753 = _749 || _751;
    bool _755 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _757 = _753 || _755;
    float _759 = float(_757);
    float _761 = _729 * _739;
    int _763 = abs(_743);
    float _765 = _229 + (-0.5);
    float _767 = float(_445);
    float _769 = -_729;
    float _771 = _769 + 1.0;
    float _773 = float(_747);
    float _775 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[196].x, _745);
    float _777 = float(_491);
    float _779 = _759 * _771;
    float _781 = -_759;
    float _783 = _781 + 1.0;
    float _785 = _773 * _767;
    float _787 = fma(_717, _695, _775);
    float _789 = _323 * _779;
    float _791 = _315 * _779;
    float _793 = _785 * (-2.0);
    float _795 = float(_763);
    float _797 = _231 + (-0.5);
    float _799 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[143].y, _789);
    float _801 = fma(_793, _623, _623);
    float _803 = fma(_355, _793, _355);
    float _805 = _795 * _777;
    float _807 = fma(_367, _761, _799);
    float _809 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[196].y, _801);
    float _811 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[143].x, _791);
    float _813 = _805 * (-2.0);
    float _815 = in.m_74.x;
    float _817 = in.m_74.y;
    float _819 = fma(_803, _695, _809);
    float _821 = _787 * 0.15915493667125701904296875;
    float _823 = fma(_813, _625, _625);
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _827 = _825 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _829 = _819 * 0.15915493667125701904296875;
    float _831 = _233 + (-0.5);
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _835 = _833 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _837 = fma(_361, _761, _811);
    float _839 = fma(_419, _813, _419);
    float _841 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[196].z, _823);
    float _843 = in.m_60.x;
    float _845 = in.m_60.y;
    float _847 = in.m_60.z;
    float _849 = fma(_827, _447, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _851 = fma(_835, _447, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _853 = fma(_455, _731, _807);
    float _855 = in.m_76.x;
    float _857 = in.m_76.y;
    float _859 = in.m_76.z;
    float _861 = fma(_417, _731, _837);
    float _863 = fma(_839, _695, _841);
    float _865 = fma(_851, _715, _853);
    float _867 = _821 * 6.283185482025146484375;
    float _869 = cos(_867);
    float _871 = fma(_849, _715, _861);
    float _873 = _863 * 0.15915493667125701904296875;
    float _875 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[147].y, _865);
    float _877 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[147].x, _871);
    float _879 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _881 = _875 * _817;
    float _883 = _829 * 6.283185482025146484375;
    float _885 = sin(_883);
    float _887 = _877 * _815;
    float _889 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _891 = _881 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _893 = _887 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _895 = in.m_78.x;
    float _897 = in.m_78.y;
    float _899 = in.m_78.z;
    float _901 = _829 * 6.283185482025146484375;
    float _903 = cos(_901);
    float _905 = _893 * _879;
    float _907 = _891 * _889;
    float _909 = _845 * _857;
    float _911 = _821 * 6.283185482025146484375;
    float _913 = sin(_911);
    float _915 = fma(_843, _855, _909);
    float _917 = _869 * _885;
    float _919 = fma(_847, _859, _915);
    float _921 = _873 * 6.283185482025146484375;
    float _923 = cos(_921);
    float _925 = _869 * _903;
    float _927 = _873 * 6.283185482025146484375;
    float _929 = sin(_927);
    float _931 = _913 * _885;
    float _933 = _913 * _903;
    float _935 = _869 * _923;
    float _937 = _913 * _923;
    float _939 = _903 * _923;
    float _941 = _885 * _923;
    float _943 = _935 * _907;
    float _945 = _937 * _907;
    float _947 = fma(_929, _925, _931);
    float _949 = -_917;
    float _951 = fma(_929, _933, _949);
    float _953 = -_933;
    float _955 = fma(_929, _917, _953);
    float _957 = -_907;
    float _959 = _929 * _957;
    float _961 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _963 = fma(_947, _905, _943);
    float _965 = fma(_929, _931, _925);
    float _967 = fma(_939, _905, _959);
    float _969 = _845 * _897;
    float _971 = fma(_955, _961, _963);
    float _973 = fma(_951, _905, _945);
    float _975 = fma(_941, _961, _967);
    float _977 = fma(_843, _895, _969);
    float _979 = _971 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _981 = _971 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _983 = fma(_965, _961, _973);
    float _985 = fma(_847, _899, _977);
    float _987 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[24].x, _979);
    float _989 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[26].x, _981);
    float _991 = _919 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _993 = _985 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _995 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[24].z, _987);
    float _997 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[26].z, _989);
    float _999 = _995 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1001 = _997 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1003 = _991 + _999;
    float _1005 = _993 + _1001;
    float _1007 = in.m_80.x;
    float _1009 = in.m_80.y;
    float _1011 = in.m_80.z;
    float _1013 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1015 = _1003 + _1013;
    float _1017 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1019 = _1005 + _1017;
    float _1021 = _1015 * _1015;
    float _1023 = _1019 * _1019;
    float _1025 = _1021 + _1023;
    float _1027 = sqrt(_1025);
    float _1029 = _845 * _1009;
    float _1031 = fma(_843, _1007, _1029);
    bool _1033 = _1027 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1035 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1037 = _1027 + _1035;
    float _1039 = fma(_847, _1011, _1031);
    float _1041 = _945;
    float _1043 = _1025;
    float _1045 = _1037;
    float _1047 = _971;
    float _1049 = _845;
    float _1051 = _1003;
    float _1053 = _1005;
    float _1055 = _1021;
    float _1057 = _1023;
    if (_1033)
    {
        float _1059 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1041 = _1059;
    }
    float _1061 = _1041;
    if (_1033)
    {
        float _1063 = rsqrt(_1025);
        _1043 = _1063;
    }
    float _1065 = _1043;
    float _1067 = _1065;
    if (_1033)
    {
        float _1069 = _1037 * _1061;
        _1045 = _1069;
    }
    float _1071 = _1045;
    float _1073 = _971 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (_1033)
    {
        float _1075 = _1071 * 0.15915493667125701904296875;
        _1047 = _1075;
    }
    float _1077 = _1047;
    float _1079 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1073);
    float _1081 = _1039 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1083 = _843;
    float _1085 = _1081;
    if (_1033)
    {
        float _1087 = _1077 * 6.283185482025146484375;
        float _1089 = sin(_1087);
        _1083 = _1089;
    }
    float _1091 = _1083;
    float _1093 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1079);
    float _1095 = _1093 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1097 = _1081 + _1095;
    float _1099 = _1097;
    if (_1033)
    {
        float _1101 = _1097 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1049 = _1101;
    }
    float _1103 = _1049;
    float _1105 = _1091;
    if (_1033)
    {
        float _1107 = fma(_1091, _1103, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1105 = _1107;
    }
    float _1109 = _1105;
    float _1111 = _1109;
    if (_1033)
    {
        float _1113 = _1065 * _1109;
        _1111 = _1113;
    }
    float _1115 = _1111;
    if (_1033)
    {
        float _1117 = fma(_1015, _1115, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1051 = _1117;
    }
    float _1119 = _1051;
    if (_1033)
    {
        float _1121 = fma(_1019, _1115, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1053 = _1121;
    }
    float _1123 = _1053;
    float _1125 = fma(_1119, 6.2500002968590706586837768554688e-05, 0.5);
    float _1127 = fma(_1123, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5737 = float2(_1125, _1127);
    float3 _1131 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5737, float2(0.0), isnan(_5737)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5737, float2(0.0), isnan(_5737)), level(0.0)).xyz;
    float _1133 = _1131.x;
    float _1135 = _1131.y;
    float _1137 = _1131.z;
    float _1139 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1141 = int(_1139);
    if (_261)
    {
        float _1143 = in.m_70.x;
        _1067 = _1143;
    }
    float _1145 = _1067;
    float _1147 = -_581;
    float _1149 = _1147 + 1.0;
    float _1151 = -_683;
    float _1153 = _1151 + 1.0;
    float _1155 = _1145;
    if (!_261)
    {
        float _1157 = in.m_70.y;
        _1155 = _1157;
    }
    float _1159 = _1155;
    float _1161 = -_685;
    float _1163 = _1161 + 1.0;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1167 = trunc(_573);
    int _1169 = int(_1167);
    float _1171 = -_677;
    float _1173 = _1171 + 1.0;
    float _1175 = float(uint(_1141));
    float _1177 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1179 = int(_1177);
    int _1181 = ~_1141;
    int _1183 = _1181 + 1;
    float _1185 = float(_1141);
    bool _1187 = _1141 == 0;
    float _1189 = float(uint(_1169));
    float _1191 = 1.0 / _1175;
    float _1193 = float(uint(_1179));
    float _1195 = trunc(_657);
    int _1197 = int(_1195);
    int _1199 = ~_1179;
    int _1201 = _1199 + 1;
    bool _1203 = _1179 == 0;
    int _1205 = as_type<int>(_1191) + (-2);
    float _1207 = 1.0 / _1193;
    float _1209 = _1191;
    float _1211 = _1173;
    if (_261)
    {
        _1209 = 1.0;
    }
    float _1213 = _1209;
    float _1215 = _1213;
    if (!_261)
    {
        _1215 = 7.345489978790283203125;
    }
    float _1217 = _1215;
    float _1219 = as_type<float>(_1205) * _1189;
    float _1221 = trunc(_1219);
    float _1223 = precise::max(_1221, 0.0);
    uint _1226 = uint(_1223);
    float _1228 = _1217 * _229;
    int _1230 = as_type<int>(_1207) + (-2);
    float _1232 = float(uint(_1197));
    int _1234 = _1183 * int(_1226);
    int _1236 = _1234 + _1169;
    float _1238 = as_type<float>(_1230) * _1232;
    float _1240 = float(_1169);
    float _1242 = float(uint(_1236));
    float _1244 = floor(_1228);
    bool _1246 = _1240 >= _1185;
    bool _1248 = isnan(_1240);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan(_1185);
    bool _1254 = _1250 || _1252;
    float _1256 = float(_1254);
    float _1258 = as_type<float>(_1205) * _1242;
    float _1260 = trunc(_1238);
    float _1262 = precise::max(_1260, 0.0);
    uint _1264 = uint(_1262);
    float _1266 = trunc(_1258);
    float _1268 = precise::max(_1266, 0.0);
    uint _1270 = uint(_1268);
    float _1272 = -_1244;
    float _1274 = _1228 + _1272;
    int _1276 = ~_1141;
    int _1278 = _1276 + 1;
    float _1280 = _1274 * _1185;
    int _1282 = _1201 * int(_1264);
    int _1284 = _1282 + _1197;
    float _1286 = trunc(_1256);
    int _1288 = int(_1286);
    float _1290 = float(uint(_1284));
    int _1292 = int(_1226) + int(_1270);
    float _1294 = as_type<float>(_1230) * _1290;
    float _1296 = trunc(_1280);
    int _1298 = int(_1296);
    int _1300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1302 = _1300 != 0;
    float _1304 = as_type<float>(_1278);
    if (_261)
    {
        _1304 = 1.0;
    }
    float _1306 = _1304;
    int _1308 = _1278 * _1292;
    int _1310 = _1308 + _1169;
    float _1312 = _1306;
    if (!_261)
    {
        _1312 = 1.2345600128173828125;
    }
    float _1314 = _1312;
    bool _1316 = !_1302;
    int _1318 = _1316 ? 0 : 1;
    bool _1320 = uint(_1310) >= uint(_1141);
    float _1322 = _1314 * _1159;
    float _1324 = trunc(_1294);
    float _1326 = precise::max(_1324, 0.0);
    uint _1328 = uint(_1326);
    int _1330 = abs(_1318);
    bool _1332 = !_1320;
    int _1334 = _1332 ? 0 : (-1);
    int _1336 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1338 = _1336 != 0;
    int _1340 = ~_1292;
    int _1342 = _1340 + _1334;
    int _1344 = _1342 + 1;
    float _1346 = _1185 * _465;
    int _1348 = ~_1179;
    int _1350 = _1348 + 1;
    int _1352 = abs(_503);
    int _1354 = _1141 * _1344;
    int _1356 = _1354 + _1169;
    float _1358 = trunc(_1346);
    int _1360 = int(_1358);
    int _1362 = ~_1288;
    int _1364 = _1362 + 1;
    int _1366 = _1364 + 1;
    bool _1368 = !_1187;
    int _1370 = _1368 ? _1356 : (-1);
    int _1372 = _1298 * _1330;
    int _1374 = _1372 + _1169;
    int _1376 = int(_1264) + int(_1328);
    int _1378 = _1141 + (-1);
    int _1380 = _1370 * _1366;
    int _1382 = abs(_499);
    int _1384 = _1350 * _1376;
    int _1386 = _1384 + _1197;
    float _1388 = floor(_1322);
    int _1390 = _1288 * _1378;
    int _1392 = _1390 + _1380;
    float _1394 = float(_1179);
    float _1396 = float(_1197);
    bool _1398 = uint(_1386) >= uint(_1179);
    int _1400 = _1392 * _1382;
    bool _1402 = _1396 >= _1394;
    bool _1404 = isnan(_1396);
    bool _1406 = _1402 || _1404;
    bool _1408 = isnan(_1394);
    bool _1410 = _1406 || _1408;
    float _1412 = float(_1410);
    int _1414 = abs(_507);
    bool _1416 = !_1398;
    int _1418 = _1416 ? 0 : (-1);
    float _1420 = trunc(_1412);
    int _1422 = int(_1420);
    float _1424 = -_1388;
    float _1426 = _1322 + _1424;
    int _1428 = ~_1376;
    int _1430 = _1428 + _1418;
    int _1432 = _1430 + 1;
    bool _1434 = !_1338;
    int _1436 = _1434 ? 0 : 1;
    int _1438 = _1360 * _1352;
    int _1440 = _1438 + _1400;
    float _1442 = _1426 * _1394;
    int _1444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1446 = _1444 != 0;
    int _1448 = _1179 * _1432;
    int _1450 = _1448 + _1197;
    int _1452 = abs(_1436);
    int _1454 = _1374 * _1414;
    int _1456 = _1454 + _1440;
    bool _1458 = !_1446;
    int _1460 = _1458 ? 0 : 1;
    float _1462 = trunc(_1442);
    int _1464 = int(_1462);
    int _1466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1468 = _1466 != 0;
    int _1470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1472 = _1470 != 0;
    int _1474 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1476 = _1474 != 0;
    int _1478 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1480 = _1478 != 0;
    float _1482 = _1394 * _465;
    int _1484 = _1298 * _1452;
    int _1486 = _1484 + _1456;
    int _1488 = ~_1422;
    int _1490 = _1488 + 1;
    int _1492 = _1490 + 1;
    bool _1494 = !_1203;
    int _1496 = _1494 ? _1450 : (-1);
    float _1498 = trunc(_1482);
    int _1500 = int(_1498);
    bool _1502 = !_1472;
    int _1504 = _1502 ? 0 : 1;
    float _1506 = float(uint(_1486));
    int _1508 = _1496 * _1492;
    int _1510 = abs(_1460);
    int _1512 = _1179 + (-1);
    float _1514 = as_type<float>(_1205) * _1506;
    bool _1516 = !_1468;
    int _1518 = _1516 ? 0 : 1;
    int _1520 = abs(_1504);
    int _1522 = _1422 * _1512;
    int _1524 = _1522 + _1508;
    int _1526 = abs(_1518);
    float _1528 = trunc(_1514);
    float _1530 = precise::max(_1528, 0.0);
    uint _1532 = uint(_1530);
    int _1534 = _1464 * _1510;
    int _1536 = _1534 + _1197;
    bool _1538 = !_1476;
    int _1540 = _1538 ? 0 : 1;
    int _1542 = _1524 * _1520;
    int _1544 = ~_1141;
    int _1546 = _1544 + 1;
    float _1548 = float(uint(_1374));
    int _1550 = _1500 * _1526;
    int _1552 = _1550 + _1542;
    bool _1554 = !_1480;
    int _1556 = _1554 ? 0 : 1;
    int _1558 = abs(_1540);
    float _1560 = as_type<float>(_1205) * _1548;
    int _1562 = abs(_1556);
    int _1564 = _1536 * _1558;
    int _1566 = _1564 + _1552;
    float _1568 = trunc(_1560);
    float _1570 = precise::max(_1568, 0.0);
    uint _1572 = uint(_1570);
    int _1574 = _1546 * int(_1532);
    int _1576 = _1574 + _1486;
    float _1578 = float(uint(_1536));
    int _1580 = _1464 * _1562;
    int _1582 = _1580 + _1566;
    int _1584 = ~_1179;
    int _1586 = _1584 + 1;
    float _1588 = float(uint(_1576));
    float _1590 = as_type<float>(_1230) * _1578;
    float _1592 = float(uint(_1582));
    int _1594 = ~_1141;
    int _1596 = _1594 + 1;
    float _1598 = trunc(_1590);
    float _1600 = precise::max(_1598, 0.0);
    uint _1602 = uint(_1600);
    float _1604 = as_type<float>(_1205) * _1588;
    float _1606 = as_type<float>(_1230) * _1592;
    int _1608 = _1596 * int(_1572);
    int _1610 = _1608 + _1374;
    float _1612 = trunc(_1604);
    float _1614 = precise::max(_1612, 0.0);
    uint _1616 = uint(_1614);
    int _1618 = ~_1179;
    int _1620 = _1618 + 1;
    float _1622 = float(uint(_1610));
    float _1624 = trunc(_1606);
    float _1626 = precise::max(_1624, 0.0);
    uint _1628 = uint(_1626);
    int _1630 = _1586 * int(_1602);
    int _1632 = _1630 + _1536;
    float _1634 = as_type<float>(_1205) * _1622;
    int _1636 = ~_1141;
    int _1638 = _1636 + 1;
    float _1640 = float(uint(_1632));
    float _1642 = trunc(_1634);
    float _1644 = precise::max(_1642, 0.0);
    uint _1646 = uint(_1644);
    int _1648 = int(_1532) + int(_1616);
    float _1650 = as_type<float>(_1230) * _1640;
    int _1652 = _1620 * int(_1628);
    int _1654 = _1652 + _1582;
    float _1656 = trunc(_1650);
    float _1658 = precise::max(_1656, 0.0);
    uint _1660 = uint(_1658);
    int _1662 = _1638 * _1648;
    int _1664 = _1662 + _1486;
    float _1666 = float(uint(_1654));
    bool _1668 = uint(_1664) >= uint(_1141);
    int _1670 = int(_1572) + int(_1646);
    float _1672 = as_type<float>(_1230) * _1666;
    bool _1674 = !_1668;
    int _1676 = _1674 ? 0 : (-1);
    int _1678 = ~_1179;
    int _1680 = _1678 + 1;
    float _1682 = trunc(_1672);
    float _1684 = precise::max(_1682, 0.0);
    uint _1686 = uint(_1684);
    int _1688 = ~_1648;
    int _1690 = _1688 + _1676;
    int _1692 = _1690 + 1;
    int _1694 = int(_1602) + int(_1660);
    int _1696 = _1141 * _1692;
    int _1698 = _1696 + _1486;
    int _1700 = ~_1141;
    int _1702 = _1700 + 1;
    int _1704 = _1680 * _1694;
    int _1706 = _1704 + _1536;
    int _1708 = ~_1179;
    int _1710 = _1708 + 1;
    bool _1712 = !_1187;
    int _1714 = _1712 ? _1698 : (-1);
    int _1716 = _1702 * _1670;
    int _1718 = _1716 + _1374;
    int _1720 = _1714 & 3;
    bool _1722 = _1720 != 0;
    int _1724 = int(_1628) + int(_1686);
    int _1726 = _1714 & 3;
    bool _1728 = _1726 != 0;
    bool _1730 = uint(_1720) >= 2u;
    int _1732 = _1710 * _1724;
    int _1734 = _1732 + _1582;
    int _1736 = _1728 ? 0 : 1;
    bool _1738 = uint(_1718) >= uint(_1141);
    int _1740 = _1730 ? 0 : 1;
    bool _1742 = uint(_1734) >= uint(_1179);
    bool _1744 = uint(_1720) > 1u;
    bool _1746 = !_1738;
    int _1748 = _1746 ? 0 : (-1);
    bool _1750 = !_1742;
    int _1752 = _1750 ? 0 : (-1);
    int _1754 = ~_1670;
    int _1756 = _1754 + _1748;
    int _1758 = _1756 + 1;
    int _1760 = ~_1724;
    int _1762 = _1760 + _1752;
    int _1764 = _1762 + 1;
    bool _1766 = _235 > 0.5;
    int _1768 = _1141 * _1758;
    int _1770 = _1768 + _1374;
    int _1772 = ~_1736;
    int _1774 = _1772 + 1;
    int _1776 = _1774 + 1;
    int _1778 = _1179 * _1764;
    int _1780 = _1778 + _1582;
    int _1782 = _1776;
    if (!_1744)
    {
        int _1784 = ~_1736;
        int _1786 = _1784 + 1;
        _1782 = _1786;
    }
    int _1788 = _1782;
    float _1790 = -_197;
    int _1792 = _1766 ? as_type<int>(_1790) : as_type<int>(_197);
    int _1794 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1796 = _1794 != 0;
    bool _1798 = !_1203;
    int _1800 = _1798 ? _1780 : (-1);
    bool _1802 = _1720 != 3;
    bool _1804 = !_1187;
    int _1806 = _1804 ? _1770 : (-1);
    int _1808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1810 = _1808 != 0;
    bool _1812 = !_1796;
    int _1814 = _1812 ? 0 : 1;
    int _1816 = _1714 >> 31;
    int _1818 = _1800 & 3;
    bool _1820 = _1818 != 0;
    int _1822 = _1800 >> 31;
    bool _1824 = !_1810;
    int _1826 = _1824 ? 0 : 1;
    int _1828 = _1816 & 3;
    bool _1830 = uint(_1706) >= uint(_1179);
    int _1832 = _1800 & 3;
    bool _1834 = _1832 != 0;
    bool _1836 = !_1820;
    float _1838 = _1836 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _1840 = _1822 & 3;
    bool _1842 = uint(_1818) > 1u;
    int _1844 = _1714 + _1828;
    bool _1846 = !_1830;
    int _1848 = _1846 ? 0 : (-1);
    int _1850 = _1834 ? 0 : 1;
    int _1852 = _1800 + _1840;
    int _1854 = ~_1740;
    int _1856 = _1854 + 1;
    int _1858 = _1856 + 1;
    bool _1860 = _1720 != 3;
    int _1862 = _1858;
    float _1864 = _1838;
    if (_1802)
    {
        int _1866 = ~_1740;
        int _1868 = _1866 + 1;
        _1862 = _1868;
    }
    int _1870 = _1862;
    bool _1872 = !_1722;
    int _1874 = _1872 ? 0 : 1;
    int _1876 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1878 = _1876 != 0;
    int _1880 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1882 = _1880 != 0;
    int _1884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1886 = _1884 != 0;
    int _1888 = _1844 >> 2;
    int _1890 = ~_1694;
    int _1892 = _1890 + _1848;
    int _1894 = _1892 + 1;
    int _1896 = _1852 >> 2;
    bool _1898 = !_1860;
    int _1900 = _1898 ? 0 : (-1);
    int _1902 = _1179 * _1894;
    int _1904 = _1902 + _1536;
    bool _1906 = uint(_1818) >= 2u;
    int _1908 = _1888 << 4;
    int _1910 = _1908 + 368;
    int _1912 = _1896 << 4;
    int _1914 = _1912 + 512;
    int _1916 = ~_1850;
    int _1918 = _1916 + 1;
    int _1920 = _1918 + 1;
    uint _1922 = uint(int(uint(_1910) >> uint(2)));
    uint _1924 = uint(int(uint(int(_1922)) >> uint(2)));
    int _1926 = int(_1922) & 3;
    float _1928 = (*spvDescriptorSet0.vp_c9)._m0[int(_1924)][_1926];
    int _1930 = int(_1922) + 1;
    uint _1932 = uint(int(uint(_1930) >> uint(2)));
    int _1934 = _1930 & 3;
    float _1936 = (*spvDescriptorSet0.vp_c9)._m0[int(_1932)][_1934];
    int _1938 = _1920;
    if (!_1842)
    {
        int _1940 = ~_1850;
        int _1942 = _1940 + 1;
        _1938 = _1942;
    }
    int _1944 = _1938;
    int _1946 = _1906 ? 0 : 1;
    bool _1948 = _1818 != 3;
    bool _1950 = _1818 != 3;
    int _1952 = _1910 + 8;
    uint _1954 = uint(int(uint(_1952) >> uint(2)));
    uint _1956 = uint(int(uint(int(_1954)) >> uint(2)));
    int _1958 = int(_1954) & 3;
    float _1960 = (*spvDescriptorSet0.vp_c9)._m0[int(_1956)][_1958];
    int _1962 = int(_1954) + 1;
    uint _1964 = uint(int(uint(_1962) >> uint(2)));
    int _1966 = _1962 & 3;
    float _1968 = (*spvDescriptorSet0.vp_c9)._m0[int(_1964)][_1966];
    int _1970 = ~_1946;
    int _1972 = _1970 + 1;
    int _1974 = _1972 + 1;
    bool _1976 = !_1203;
    int _1978 = _1976 ? _1904 : (-1);
    uint _1980 = uint(int(uint(_1914) >> uint(2)));
    uint _1982 = uint(int(uint(int(_1980)) >> uint(2)));
    int _1984 = int(_1980) & 3;
    float _1986 = (*spvDescriptorSet0.vp_c9)._m0[int(_1982)][_1984];
    int _1988 = int(_1980) + 1;
    uint _1990 = uint(int(uint(_1988) >> uint(2)));
    int _1992 = _1988 & 3;
    float _1994 = (*spvDescriptorSet0.vp_c9)._m0[int(_1990)][_1992];
    int _1996 = _1974;
    if (_1948)
    {
        int _1998 = ~_1946;
        int _2000 = _1998 + 1;
        _1996 = _2000;
    }
    int _2002 = _1996;
    float _2004 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2006 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2008 = _2006 != 0;
    float _2010 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2012 = _1914 + 8;
    uint _2014 = uint(int(uint(_2012) >> uint(2)));
    uint _2016 = uint(int(uint(int(_2014)) >> uint(2)));
    int _2018 = int(_2014) & 3;
    float _2020 = (*spvDescriptorSet0.vp_c9)._m0[int(_2016)][_2018];
    int _2022 = int(_2014) + 1;
    uint _2024 = uint(int(uint(_2022) >> uint(2)));
    int _2026 = _2022 & 3;
    float _2028 = (*spvDescriptorSet0.vp_c9)._m0[int(_2024)][_2026];
    float _2030 = _2004 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2032 = abs(_1944);
    float _2034 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2036 = abs(_1788);
    float _2038 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2040 = abs(_1874);
    float _2042 = _2034 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2044 = !_1950;
    int _2046 = _2044 ? 0 : (-1);
    float _2048 = _2038 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2050 = _229 > 0.5;
    bool _2052 = _231 > 0.5;
    out.m_82.x = _2042;
    out.m_82.y = _2030;
    out.m_82.z = _2048;
    out.m_82.w = _2010;
    int _2054 = ~_2036;
    int _2056 = _2054 + 1;
    int _2058 = _2056 + 1;
    float _2060 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2062 = -_193;
    int _2064 = _2050 ? as_type<int>(_2062) : as_type<int>(_193);
    float _2066 = _1165 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2068 = _233 > 0.5;
    float _2070 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2072 = _2058 * as_type<int>(_1936);
    int _2074 = abs(_1870);
    float _2076 = _2060 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2078 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2080 = int(_2078);
    float _2082 = _2070 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2084 = abs(as_type<int>(_1838));
    if (_1033)
    {
        float _2086 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2088 = _1119 + _2086;
        _1864 = _2088;
    }
    float _2090 = _1864;
    int _2092 = ~_2032;
    int _2094 = _2092 + 1;
    int _2096 = _2094 + 1;
    int _2098 = ~_2040;
    int _2100 = _2098 + 1;
    int _2102 = _2100 + 1;
    out.m_84.x = _2066;
    out.m_84.y = _2076;
    out.m_84.z = _2082;
    int _2104 = ~_2084;
    int _2106 = _2104 + 1;
    int _2108 = _2106 + 1;
    int _2110 = _2096 * as_type<int>(_1994);
    int _2112 = abs(_1900);
    int _2114 = _2102 * as_type<int>(_1928);
    int _2116 = _2114 + _2072;
    int _2118 = abs(_2046);
    int _2120 = _2108 * as_type<int>(_1986);
    int _2122 = _2120 + _2110;
    float _2124 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2126 = int(_2124);
    int _2128 = abs(_2002);
    float _2130 = _935 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2132 = ~_2074;
    int _2134 = _2132 + 1;
    int _2136 = _2134 + 1;
    float _2138 = _947 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2140 = _935 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2142 = float(uint(_2080));
    int _2144 = _2136 * as_type<int>(_1960);
    int _2146 = _2144 + _2116;
    int _2148 = ~_2112;
    int _2150 = _2148 + 1;
    int _2152 = _2150 + 1;
    float _2154 = _947 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2156 = ~_2128;
    int _2158 = _2156 + 1;
    int _2160 = _2158 + 1;
    if (_1033)
    {
        float _2162 = _2090 * _2090;
        _1055 = _2162;
    }
    float _2164 = _1055;
    float _2166 = 1.0 / _2142;
    int _2168 = _2152 * as_type<int>(_1968);
    int _2170 = _2168 + _2146;
    int _2172 = abs(_1814);
    int _2174 = _2160 * as_type<int>(_2020);
    int _2176 = _2174 + _2122;
    int _2178 = abs(_2080);
    int _2180 = ~_2172;
    int _2182 = _2180 + 1;
    int _2184 = _2182 + 1;
    int _2186 = ~_2118;
    int _2188 = _2186 + 1;
    int _2190 = _2188 + 1;
    float _2192 = float(uint(_2126));
    int _2194 = _2170 * _2184;
    int _2196 = _2190 * as_type<int>(_2028);
    int _2198 = _2196 + _2176;
    int _2200 = abs(_1826);
    float _2202 = _935 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2204 = _1806 * _2172;
    int _2206 = _2204 + _2194;
    float _2208 = 1.0 / _2192;
    float _2210 = float(uint(_2178));
    float _2212 = -_929;
    float _2214 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2130);
    int _2216 = abs(_2126);
    float _2218 = -_929;
    float _2220 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2202);
    int _2222 = as_type<int>(_2166) + (-2);
    float _2224 = _955 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2226 = float(uint(_2206));
    float _2228 = 1.0 / _2210;
    float _2230 = -_929;
    float _2232 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2140);
    int _2234 = ~_2200;
    int _2236 = _2234 + 1;
    int _2238 = _2236 + 1;
    float _2240 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2214);
    float _2242 = float(uint(_2216));
    float _2244 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2232);
    float _2246 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2220);
    float _2248 = _947 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2250 = as_type<float>(_2222) * _2226;
    int _2252 = _2198 * _2238;
    float _2254 = 1.0 / _2242;
    float _2256 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2248);
    int _2258 = abs(_2206);
    int _2260 = _1978 * _2200;
    int _2262 = _2260 + _2252;
    float _2264 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2138);
    float _2266 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2154);
    int _2268 = as_type<int>(_2208) + (-2);
    float _2270 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2256);
    float _2272 = trunc(_2250);
    float _2274 = precise::max(_2272, 0.0);
    uint _2276 = uint(_2274);
    float _2278 = float(uint(_2262));
    int _2280 = abs(_2262);
    float _2282 = as_type<float>(_2268) * _2278;
    float _2284 = float(uint(_2258));
    float _2286 = as_type<float>(_2198);
    if (_1033)
    {
        float _2288 = _1077 * 6.283185482025146484375;
        float _2290 = cos(_2288);
        _2286 = _2290;
    }
    float _2292 = _2286;
    int _2294 = ~_2080;
    int _2296 = _2294 + 1;
    float _2298 = _955 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2300 = as_type<int>(_2254) + (-2);
    float _2302 = float(uint(_2280));
    bool _2304 = !_1878;
    float _2306 = _2304 ? _197 : as_type<float>(_1792);
    float _2308 = trunc(_2282);
    float _2310 = precise::max(_2308, 0.0);
    uint _2312 = uint(_2310);
    int _2314 = as_type<int>(_2228) + (-2);
    float _2316 = _955 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2318 = !_2008;
    float _2320 = _2318 ? _193 : as_type<float>(_2064);
    bool _2322 = _2126 == 0;
    float _2324 = as_type<float>(_2314) * _2284;
    float _2326 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2298);
    int _2328 = _2296 * int(_2276);
    int _2330 = _2328 + _2206;
    float _2332 = as_type<float>(_2300) * _2302;
    float _2334 = trunc(_2324);
    float _2336 = precise::max(_2334, 0.0);
    uint _2338 = uint(_2336);
    float _2340 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2316);
    float _2342 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2224);
    float _2344 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2326);
    float _2346 = float(uint(_2330));
    float _2348 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2340);
    float _2350 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2342);
    int _2352 = ~_2178;
    int _2354 = _2352 + 1;
    float _2356 = trunc(_2332);
    float _2358 = precise::max(_2356, 0.0);
    uint _2360 = uint(_2358);
    int _2362 = ~_2126;
    int _2364 = _2362 + 1;
    float _2366 = as_type<float>(_2222) * _2346;
    float _2368 = as_type<float>(_2354);
    if (_1033)
    {
        float _2370 = _2292 + (-1.0);
        _2368 = _2370;
    }
    float _2372 = _2368;
    int _2374 = ~_2216;
    int _2376 = _2374 + 1;
    int _2378 = _2364 * int(_2312);
    int _2380 = _2378 + _2262;
    int _2382 = _2354 * int(_2338);
    int _2384 = _2382 + _2258;
    float _2386 = _2372;
    if (_1033)
    {
        float _2388 = _2372 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2386 = _2388;
    }
    float _2390 = _2386;
    float _2392 = trunc(_2366);
    float _2394 = precise::max(_2392, 0.0);
    uint _2396 = uint(_2394);
    float _2398 = float(uint(_2380));
    float _2400 = float(uint(_2384));
    if (_1033)
    {
        float _2402 = fma(_1097, _2292, _2390);
        _1099 = _2402;
    }
    float _2404 = _1099;
    float _2406 = -_197;
    int _2408 = _2052 ? as_type<int>(_2406) : as_type<int>(_197);
    int _2410 = _2376 * int(_2360);
    int _2412 = _2410 + _2280;
    float _2414 = as_type<float>(_2314) * _2400;
    bool _2416 = !_1882;
    float _2418 = _2416 ? _197 : as_type<float>(_2408);
    float _2420 = _197 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2422 = float(uint(_2412));
    float _2424 = as_type<float>(_2268) * _2398;
    float _2426 = -_193;
    int _2428 = _2068 ? as_type<int>(_2426) : as_type<int>(_193);
    float _2430 = trunc(_2414);
    float _2432 = precise::max(_2430, 0.0);
    uint _2434 = uint(_2432);
    float _2436 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2264);
    float _2438 = as_type<float>(_2300) * _2422;
    bool _2440 = !_1886;
    float _2442 = _2440 ? _193 : as_type<float>(_2428);
    float _2444 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2446 = _2420 * _2244;
    float _2448 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2266);
    float _2450 = _2420 * _2246;
    float _2452 = trunc(_2424);
    float _2454 = precise::max(_2452, 0.0);
    uint _2456 = uint(_2454);
    float _2458 = fma(_2444, _2270, _2446);
    float _2460 = _2446;
    if (_1033)
    {
        float _2462 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2464 = _1123 + _2462;
        _2460 = _2464;
    }
    float _2466 = _2460;
    float _2468 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2470 = _2404 + _2468;
    out.m_86.x = _2270;
    out.m_86.y = _2436;
    out.m_86.z = _2448;
    if (_1033)
    {
        float _2472 = _2466 * _2466;
        _1057 = _2472;
    }
    float _2474 = _1057;
    int _2476 = int(_2276) + int(_2396);
    float _2478 = trunc(_2438);
    float _2480 = precise::max(_2478, 0.0);
    uint _2482 = uint(_2480);
    float _2484 = _2420 * _2240;
    int _2486 = ~_2080;
    int _2488 = _2486 + 1;
    float _2490 = fma(_2470, _2470, _2164);
    bool _2492 = _2126 == 0;
    float _2494 = fma(_2444, _2436, _2484);
    float _2496 = fma(_2444, _2448, _2450);
    int _2498 = ~_2178;
    int _2500 = _2498 + 1;
    int _2502 = int(_2312) + int(_2456);
    int _2504 = ~_2126;
    int _2506 = _2504 + 1;
    int _2508 = int(_2338) + int(_2434);
    int _2510 = int(_2360) + int(_2482);
    int _2512 = _2488 * _2476;
    int _2514 = _2512 + _2206;
    int _2516 = ~_2216;
    int _2518 = _2516 + 1;
    int _2520 = _2500 * _2508;
    int _2522 = _2520 + _2258;
    float _2524 = _2490 + _2474;
    int _2526 = _2506 * _2502;
    int _2528 = _2526 + _2262;
    bool _2530 = uint(_2514) >= uint(_2080);
    int _2532 = _2518 * _2510;
    int _2534 = _2532 + _2280;
    float _2536 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2538 = uint(_2522) >= uint(_2178);
    bool _2540 = uint(_2528) >= uint(_2126);
    bool _2542 = !_2530;
    int _2544 = _2542 ? 0 : (-1);
    bool _2546 = !_2540;
    int _2548 = _2546 ? 0 : (-1);
    float _2550 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2552 = ~_2476;
    int _2554 = _2552 + _2544;
    int _2556 = _2554 + 1;
    bool _2558 = uint(_2534) >= uint(_2216);
    int _2560 = ~_2502;
    int _2562 = _2560 + _2548;
    int _2564 = _2562 + 1;
    int _2566 = _2080 * _2556;
    int _2568 = _2566 + _2206;
    int _2570 = _2206 ^ _2080;
    float _2572 = sqrt(_2524);
    bool _2574 = !_2558;
    int _2576 = _2574 ? 0 : (-1);
    int _2578 = _2126 * _2564;
    int _2580 = _2578 + _2262;
    bool _2582 = !_2538;
    int _2584 = _2582 ? 0 : (-1);
    uint _2586 = uint(int(uint(_2570) >> uint(31)));
    bool _2588 = _2080 == 0;
    float _2590 = _2550 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2592 = _2080 == 0;
    float _2594 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2596 = _2262 ^ _2126;
    int _2598 = ~_2576;
    int _2600 = _2510 + _2598;
    int _2602 = _2600 + 1;
    int _2604 = ~_2584;
    int _2606 = _2508 + _2604;
    int _2608 = _2606 + 1;
    float _2610 = fma(_2420, _2420, 1.0);
    int _2612 = ~int(_2586);
    int _2614 = _2612 + 1;
    float _2616 = _2536 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2618 = !_2588;
    int _2620 = _2618 ? _2568 : (-1);
    float _2622 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _2624 = uint(int(uint(_2596) >> uint(31)));
    int _2626 = _2608 ^ _2614;
    float _2628 = float(_2620);
    int _2630 = ~int(_2624);
    int _2632 = _2630 + 1;
    int _2634 = ~_2614;
    int _2636 = _2634 + _2626;
    int _2638 = _2636 + 1;
    float _2640 = fma(_2616, _2628, _603);
    bool _2642 = !_2322;
    int _2644 = _2642 ? _2580 : (-1);
    float _2646 = rsqrt(_2610);
    int _2648 = _2602 ^ _2632;
    float _2650 = float(_2644);
    float _2652 = _2594 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2654 = ~_2632;
    int _2656 = _2654 + _2648;
    int _2658 = _2656 + 1;
    float _2660 = _2320 + 0.5;
    bool _2662 = !_2592;
    int _2664 = _2662 ? _2638 : (-1);
    float _2666 = fma(_2652, _2650, _689);
    bool _2668 = !_2492;
    int _2670 = _2668 ? _2658 : (-1);
    float _2672 = fma(_2616, _2660, _2640);
    float _2674 = float(_2664);
    float _2676 = _2442 + 0.5;
    float _2678 = float(_2670);
    float _2680 = _2622 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2682 = -_1153;
    float _2684 = fma(_2320, _2682, _2672);
    float _2686 = -_675;
    float _2688 = fma(_2590, _2674, _2686);
    float _2690 = _2418 + (-0.5);
    float _2692 = fma(_2652, _2676, _2666);
    float _2694 = _2420 * _2646;
    float _2696 = -_691;
    float _2698 = fma(_2680, _2678, _2696);
    float _2700 = _2306 + (-0.5);
    float _2702 = -_2590;
    float _2704 = fma(_2702, _2690, _2688);
    float _2706 = -_2344;
    float _2708 = _2694 * _2706;
    float _2710 = -_2348;
    float _2712 = _2694 * _2710;
    float _2714 = -_2350;
    float _2716 = _2694 * _2714;
    float _2718 = -_2680;
    float _2720 = fma(_2718, _2700, _2698);
    float _2722 = fma(_2646, _2240, _2708);
    float _2724 = fma(_2646, _2244, _2712);
    float _2726 = -_1149;
    float _2728 = fma(_2442, _2726, _2692);
    float _2730 = fma(_2646, _2246, _2716);
    float _2732 = _2348 + _2458;
    float _2734 = fma(_2418, _1163, _2704);
    float _2736 = fma(_2306, _1173, _2720);
    float _2738 = _2344 + _2494;
    float _2740 = _2350 + _2496;
    out.m_88.x = _2724;
    out.m_88.y = _2722;
    out.m_88.z = _2730;
    bool _2742 = _2572 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2744 = isnan(_2572);
    bool _2746 = _2742 || _2744;
    bool _2748 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2750 = _2746 || _2748;
    out.m_90.x = _2684;
    out.m_90.y = _2734;
    out.m_90.z = _2728;
    out.m_90.w = _2736;
    out.m_92.x = _1133;
    out.m_92.y = _1135;
    out.m_92.z = _1137;
    out.m_94.x = _2732;
    out.m_94.y = _2738;
    out.m_94.z = _2740;
    float _2752 = _2610;
    float _2754 = as_type<float>(_2514);
    float _2756 = as_type<float>(_2638);
    if (!_2750)
    {
        _1211 = 1.0;
    }
    float _2758 = _1211;
    bool _2760 = !_2750;
    float _2762 = _2758;
    if (!_2760)
    {
        bool _2764 = _2572 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2766 = isnan(_2572);
        bool _2768 = _2764 || _2766;
        bool _2770 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2772 = _2768 || _2770;
        if (!_2772)
        {
            float _2774 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2776 = _2572 + _2774;
            float _2778 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2780 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2778;
            float _2782 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2784 = _2782 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2786 = 1.0 / _2780;
            float _2788 = _2776 * _2786;
            float _2790 = fma(_2788, _2784, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2762 = _2790;
            _2792 = true;
        }
        else
        {
            bool _2794 = _2572 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2796 = isnan(_2572);
            bool _2798 = _2794 || _2796;
            bool _2800 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2802 = _2798 || _2800;
            if (!_2802)
            {
                float _2804 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2806 = _2572 + _2804;
                float _2808 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2810 = _2808 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2812 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2814 = _2812 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2816 = 1.0 / _2810;
                float _2818 = _2806 * _2816;
                float _2820 = fma(_2818, _2814, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2762 = _2820;
                _2792 = true;
            }
            else
            {
                _2762 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2792 = false;
    float _2822 = _2762;
    float _2824 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2826 = _2404 + _2824;
    float _2828 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2830 = _1119 + _2828;
    float _2832 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2834 = _1123 + _2832;
    float _2836 = fma(_2826, _2822, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2838 = fma(_2830, _2822, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2840 = fma(_2834, _2822, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2842 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2844 = _2836 + _2842;
    float _2846 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2848 = _2838 + _2846;
    float _2850 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2852 = _2840 + _2850;
    float _2854 = _2844 * _2844;
    float _2856 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2858 = fma(_2848, _2848, _2854);
    float _2860 = _1081 + _2856;
    float _2862 = fma(_2852, _2852, _2858);
    float _2864 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2866 = rsqrt(_2862);
    float _2868 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2864);
    float _2870 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2868);
    float _2872 = sqrt(_2862);
    float _2874 = _2870 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2876 = _2866 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2878 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2880 = _2848 * _2876;
    float _2882 = _2852 * _2876;
    float _2884 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2878);
    float _2886 = _2880 * _2880;
    float _2888 = _2882 * _2882;
    float _2890 = 1.0 / _2874;
    float _2892 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2884);
    float _2894 = _2886 + _2888;
    float _2896 = _2892 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2898 = sqrt(_2894);
    float _2900 = _2896 + _2874;
    float _2902 = _2860 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2904 = _2900 * _2890;
    float _2906 = _2904 * 0.5;
    float _2908 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2910 = fma(_2906, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2908);
    float _2912 = fma(_991, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2914 = _2860 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    bool _2916 = _2898 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2918 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2920 = _2898 + _2918;
    float _2922 = 1.0 / _2910;
    float _2924 = fma(_991, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2914);
    float _2926 = fma(_993, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2924);
    float _2928 = floor(_2912);
    float _2930 = _2926 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2932 = _1135;
    int _2934 = 2;
    float _2936 = _2876;
    float _2938 = _2880;
    float _2940 = _2886;
    float _2942 = _2826;
    int _2944 = as_type<int>(_2888);
    if (_2916)
    {
        float _2946 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2932 = _2946;
    }
    float _2948 = _2932;
    float _2950 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2952 = _2922 * _2950;
    float _2954 = fma(_991, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2902);
    bool _2956 = _2952 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2958 = fma(_993, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2954);
    bool _2960 = _2952 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2962 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2964 = trunc(_2930);
    int _2966 = int(_2964);
    float _2968 = _2958 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2970 = -_2928;
    float _2972 = _2912 + _2970;
    float _2974 = precise::max(0.0, _2962);
    float _2976 = _2958;
    int _2978 = as_type<int>(_2968);
    if (_2916)
    {
        float _2980 = _2920 * _2948;
        _2976 = _2980;
    }
    float _2982 = _2976;
    float _2984 = trunc(_2968);
    int _2986 = int(_2984);
    if (!_2956)
    {
        _2934 = 1;
    }
    int _2988 = _2934;
    int _2990 = _2988;
    if (_2916)
    {
        float _2992 = _2982 * 0.15915493667125701904296875;
        _1085 = _2992;
    }
    float _2994 = _1085;
    bool _2996 = !_2956;
    int _2998 = _2996 ? 0 : 1;
    float _3000 = -_2876;
    float _3002 = -_2974;
    float _3004 = fma(_2844, _3000, _3002);
    if (!_2960)
    {
        _2990 = _2998;
    }
    int _3006 = _2990;
    float _3008 = _2926;
    float _3010 = as_type<float>(_3006);
    if (_2916)
    {
        float _3012 = _2994 * 6.283185482025146484375;
        float _3014 = sin(_3012);
        _3008 = _3014;
    }
    float _3016 = _3008;
    if (_2916)
    {
        float _3018 = _3004 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2936 = _3018;
    }
    float _3020 = _2936;
    int _3022 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _3024 = _2966 + _3022;
    int _3026 = _3024 + 1;
    int _3028 = _3006 << 6;
    int _3030 = _3028 + 48;
    uint _3032 = uint(int(uint(_3030) >> uint(2)));
    uint _3034 = uint(int(uint(int(_3032)) >> uint(2)));
    int _3036 = int(_3032) & 3;
    float _3038 = (*spvDescriptorSet0.vp_c15)._m0[int(_3034)][_3036];
    int _3040 = int(_3032) + 1;
    uint _3042 = uint(int(uint(_3040) >> uint(2)));
    int _3044 = _3040 & 3;
    float _3046 = (*spvDescriptorSet0.vp_c15)._m0[int(_3042)][_3044];
    float _3048 = _2894;
    if (_2916)
    {
        float _3050 = rsqrt(_2894);
        _3048 = _3050;
    }
    float _3052 = _3048;
    int _3054 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3056 = _2986 + _3054;
    int _3058 = _3056 + 1;
    float _3060 = fma(_993, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    bool _3062 = _3026 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _3064 = _3026 | _3058;
    int _3066 = _3028 + 96;
    uint _3068 = uint(int(uint(_3066) >> uint(2)));
    uint _3070 = uint(int(uint(int(_3068)) >> uint(2)));
    int _3072 = int(_3068) & 3;
    float _3074 = (*spvDescriptorSet0.vp_c15)._m0[int(_3070)][_3072];
    int _3076 = int(_3068) + 1;
    uint _3078 = uint(int(uint(_3076) >> uint(2)));
    int _3080 = _3076 & 3;
    float _3082 = (*spvDescriptorSet0.vp_c15)._m0[int(_3078)][_3080];
    if (_2916)
    {
        float _3084 = fma(_3016, _3020, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2752 = _3084;
    }
    float _3086 = _2752;
    float _3088 = _2994;
    float _3090 = _3086;
    if (_2916)
    {
        float _3092 = _2994 * 6.283185482025146484375;
        float _3094 = cos(_3092);
        _3088 = _3094;
    }
    float _3096 = _3088;
    bool _3098 = _3064 < 0;
    bool _3100 = _3098 || _3062;
    float _3102 = _2836 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _3104 = _3058 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3106 = _3104 || _3100;
    int _3108 = _3028 + 56;
    uint _3110 = uint(int(uint(_3108) >> uint(2)));
    uint _3112 = uint(int(uint(int(_3110)) >> uint(2)));
    int _3114 = int(_3110) & 3;
    float _3116 = (*spvDescriptorSet0.vp_c15)._m0[int(_3112)][_3114];
    int _3118 = int(_3110) + 1;
    uint _3120 = uint(int(uint(_3118) >> uint(2)));
    int _3122 = _3118 & 3;
    float _3124 = (*spvDescriptorSet0.vp_c15)._m0[int(_3120)][_3122];
    float _3126 = _3052;
    if (_2916)
    {
        float _3128 = _3052 * _3086;
        _2754 = _3128;
    }
    float _3130 = _2754;
    float _3132 = fma(_2838, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3102);
    if (!_2916)
    {
        _3090 = _3004;
    }
    float _3134 = _3090;
    float _3136 = floor(_3060);
    float _3138 = _3134;
    if (_2916)
    {
        float _3140 = _2880 * _3130;
        _2938 = _3140;
    }
    float _3142 = _2938;
    float _3144 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3132);
    int _3146 = _3028 + 104;
    uint _3148 = uint(int(uint(_3146) >> uint(2)));
    uint _3150 = uint(int(uint(int(_3148)) >> uint(2)));
    int _3152 = int(_3148) & 3;
    float _3154 = (*spvDescriptorSet0.vp_c15)._m0[int(_3150)][_3152];
    int _3156 = int(_3148) + 1;
    uint _3158 = uint(int(uint(_3156) >> uint(2)));
    int _3160 = _3156 & 3;
    float _3162 = (*spvDescriptorSet0.vp_c15)._m0[int(_3158)][_3160];
    if (_2916)
    {
        float _3164 = _3142 * _3142;
        _2940 = _3164;
    }
    float _3166 = _2940;
    float _3168 = _3096;
    if (_2916)
    {
        float _3170 = _3096 + (-1.0);
        _3126 = _3170;
    }
    float _3172 = _3126;
    float _3174 = _3172;
    if (!_3106)
    {
        float _3176 = floor(_2968);
        _2756 = _3176;
    }
    float _3178 = _2756;
    if (_2916)
    {
        float _3180 = _3172 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2942 = _3180;
    }
    float _3182 = _2942;
    if (!_2916)
    {
        _3174 = _2882;
    }
    float _3184 = _3174;
    int _3186 = _3028 + 64;
    uint _3188 = uint(int(uint(_3186) >> uint(2)));
    uint _3190 = uint(int(uint(int(_3188)) >> uint(2)));
    int _3192 = int(_3188) & 3;
    float _3194 = (*spvDescriptorSet0.vp_c15)._m0[int(_3190)][_3192];
    int _3196 = int(_3188) + 1;
    uint _3198 = uint(int(uint(_3196) >> uint(2)));
    int _3200 = _3196 & 3;
    float _3202 = (*spvDescriptorSet0.vp_c15)._m0[int(_3198)][_3200];
    float _3204 = _3184;
    if (_2916)
    {
        float _3206 = _2882 * _3130;
        _3204 = _3206;
    }
    float _3208 = _3204;
    if (_2916)
    {
        float _3210 = fma(_3004, _3096, _3182);
        _3138 = _3210;
    }
    float _3212 = _3138;
    if (!_2916)
    {
        _3168 = _2888;
    }
    float _3214 = _3168;
    float _3216 = _3214;
    if (!_3106)
    {
        int _3218 = _3058 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3220 = _3218 + _3026;
        _2944 = _3220;
    }
    int _3222 = _2944;
    if (_2916)
    {
        float _3224 = _3208 * _3208;
        _3216 = _3224;
    }
    float _3226 = _3216;
    float _3228 = fma(_3212, _3212, _3166);
    float _3230 = _3144 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _3232 = _3028 + 80;
    uint _3234 = uint(int(uint(_3232) >> uint(2)));
    uint _3236 = uint(int(uint(int(_3234)) >> uint(2)));
    int _3238 = int(_3234) & 3;
    float _3240 = (*spvDescriptorSet0.vp_c15)._m0[int(_3236)][_3238];
    int _3242 = int(_3234) + 1;
    uint _3244 = uint(int(uint(_3242) >> uint(2)));
    int _3246 = _3242 & 3;
    float _3248 = (*spvDescriptorSet0.vp_c15)._m0[int(_3244)][_3246];
    float _3250 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3252 = _3228 + _3226;
    float _3254 = _3230 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3256 = -_3136;
    float _3258 = _3060 + _3256;
    int _3260 = _3028 + 72;
    uint _3262 = uint(int(uint(_3260) >> uint(2)));
    uint _3264 = uint(int(uint(int(_3262)) >> uint(2)));
    int _3266 = int(_3262) & 3;
    float _3268 = (*spvDescriptorSet0.vp_c15)._m0[int(_3264)][_3266];
    int _3270 = int(_3262) + 1;
    uint _3272 = uint(int(uint(_3270) >> uint(2)));
    int _3274 = _3270 & 3;
    float _3276 = (*spvDescriptorSet0.vp_c15)._m0[int(_3272)][_3274];
    float _3278 = _2860 * _3046;
    float _3280 = -_3254;
    float _3282 = fma(_3280, _3250, 1.0);
    float _3284 = rsqrt(_3252);
    float _3286 = fma(_991, _3038, _3278);
    int _3288 = _3028 + 88;
    uint _3290 = uint(int(uint(_3288) >> uint(2)));
    uint _3292 = uint(int(uint(int(_3290)) >> uint(2)));
    int _3294 = int(_3290) & 3;
    float _3296 = (*spvDescriptorSet0.vp_c15)._m0[int(_3292)][_3294];
    int _3298 = int(_3290) + 1;
    uint _3300 = uint(int(uint(_3298) >> uint(2)));
    int _3302 = _3298 & 3;
    float _3304 = (*spvDescriptorSet0.vp_c15)._m0[int(_3300)][_3302];
    float _3306 = _2860 * _3082;
    float _3308 = fma(_991, _3074, _3306);
    float _3310 = fma(_993, _3116, _3286);
    float _3312 = _3284 * _3142;
    float _3314 = _3284 * _3212;
    float _3316 = _3284 * _3208;
    float _3318 = _3312 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3320 = fma(_993, _3154, _3308);
    float _3322 = _3310 + _3124;
    float _3324 = _2836 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3326 = -_3318;
    float _3328 = fma(_3314, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3326);
    float _3330 = _3320 + _3162;
    float _3332 = _2836 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3334 = fma(_2838, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3324);
    float _3336 = -_3316;
    float _3338 = fma(_3336, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3328);
    float _3340 = _2860 * _3202;
    float _3342 = _3202;
    int _3344 = as_type<int>((*spvDescriptorSet0.vp_c15)._m0[23].w);
    int _3346 = as_type<int>(_3074);
    if (!_3106)
    {
        float _3348 = -_3178;
        float _3350 = _2968 + _3348;
        _3342 = _3350;
    }
    float _3352 = _3342;
    float _3354 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3356 = fma(_2872, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3354);
    float _3358 = precise::clamp(_3356, 0.0, 1.0);
    float _3360 = 1.0 / _3330;
    float _3362 = fma(_991, _3194, _3340);
    float _3364 = fma(_2838, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3332);
    float _3366 = -_3358;
    float _3368 = _3366 + 1.0;
    if (!_3106)
    {
        int _3370 = _3222 << 2;
        _2978 = _3370;
    }
    int _3372 = _2978;
    float _3374 = _2860 * _3248;
    float _3376 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3364);
    int _3378 = _3372;
    if (!_3106)
    {
        uint _3380 = uint(int(uint(_3222) >> uint(2)));
        _3344 = int(_3380);
    }
    int _3382 = _3344;
    float _3384 = abs(_3368);
    float _3386 = log2(_3384);
    float _3388 = fma(_991, _3240, _3374);
    if (!_3106)
    {
        int _3390 = 12 & _3372;
        _3378 = _3390;
    }
    int _3392 = _3378;
    float _3394 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3334);
    float _3396 = fma(_993, _3268, _3362);
    float _3398 = _3394;
    if (!_3106)
    {
        int _3400 = _3382 << 4;
        int _3402 = _3400 + _3392;
        _3346 = _3402;
    }
    int _3404 = _3346;
    float _3406 = _3322 * _3360;
    float _3408 = _3396 + _3276;
    float _3410 = _2836 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3412 = as_type<float>(_3382);
    if (!_3106)
    {
        int _3414 = _3404 + 400;
        uint _3416 = uint(int(uint(_3414) >> uint(2)));
        uint _3418 = uint(int(uint(int(_3416)) >> uint(2)));
        int _3420 = int(_3416) & 3;
        float _3422 = (*spvDescriptorSet0.vp_c15)._m0[int(_3418)][_3420];
        _3412 = _3422;
    }
    float _3424 = _3412;
    bool _3426 = _3406 >= 0.0;
    float _3428 = fma(_2838, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3410);
    float _3430 = fma(_993, _3296, _3388);
    float _3432 = _3386 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3434 = _3408 * _3360;
    float _3436 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3428);
    float _3438 = _3376 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _3440 = _3406 <= 1.0;
    bool _3442 = _3440 && _3426;
    float _3444 = exp2(_3432);
    float _3446 = _3436 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3448 = _3438 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _3450 = _3434 >= 0.0;
    bool _3452 = _3450 && _3442;
    float _3454 = fma(_3338, -0.5, 0.5);
    float _3456 = fma(_3338, 0.5, 0.5);
    float _3458 = fma(_3446, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3448);
    bool _3460 = _3434 <= 1.0;
    bool _3462 = _3460 && _3452;
    float _3464 = log2(_3282);
    float _3466 = fma(_3456, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3468 = fma(_3230, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3458);
    float _3470 = _3430 + _3304;
    float _3472 = _3314 + 1.0;
    float _3474 = fma(_3456, _3466, -0.212114393711090087890625);
    float _3476 = _3438 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3478 = _3438 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3480 = sqrt(_3454);
    float _3482 = _3394 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3484 = -_3314;
    float _3486 = fma(_3444, _3472, _3484);
    float _3488 = fma(_3456, _3474, 1.570728778839111328125);
    float _3490 = fma(_3446, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3476);
    if (_3462)
    {
        float _3492 = float(_3006);
        _3010 = _3492;
    }
    float _3494 = _3010;
    float _3496 = fma(_3446, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3478);
    float _3498 = _3470 * _3360;
    float _3500 = _3432;
    if (!_3106)
    {
        float _3502 = floor(_2930);
        _3500 = _3502;
    }
    float _3504 = _3500;
    float _3506 = fma(_3482, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3468);
    float _3508 = fma(_3230, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3490);
    float _3510 = fma(_3230, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3496);
    float _3512 = _3464 * 0.693147182464599609375;
    float _3514 = fma(_3482, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3508);
    float _3516 = fma(_3482, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3510);
    float _3518 = 1.0 / _3506;
    float _3520 = _3480 * 0.636619746685028076171875;
    float2 _9380 = float2(_2972, _3258);
    float _3522 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9380, float2(0.0), isnan(_9380)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9380, float2(0.0), isnan(_9380)), level(0.0)).x;
    float _3524 = _3512 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3526 = fma(_3486, 0.5, 0.5);
    float _3528 = -_3488;
    float _3530 = fma(_3520, _3528, 1.0);
    float _3532 = _3490;
    float _3534 = _3516;
    if (_3462)
    {
        float _3536 = rint(_3494);
        float _3538 = precise::max(_3536, 0.0);
        uint _3540 = uint(_3538);
        uint _3542 = clamp(_3540, 0u, 65535u);
        _3532 = as_type<float>(_3542);
    }
    float _3544 = _3532;
    if (!_3106)
    {
        float _3546 = -_3504;
        float _3548 = _2930 + _3546;
        _3398 = _3548;
    }
    float _3550 = _3398;
    float _3552 = _3516 * _3518;
    float _3554 = _3514 * _3518;
    float _3556 = _3360;
    if (!_3106)
    {
        float _3558 = rint(_3424);
        float _3560 = precise::max(_3558, 0.0);
        uint _3562 = uint(_3560);
        uint _3564 = clamp(_3562, 0u, 65535u);
        _3556 = as_type<float>(_3564);
    }
    float _3566 = _3556;
    float _3568 = fma(_3552, 0.5, 0.5);
    float _3570 = fma(_3554, -0.5, 0.5);
    float _3572 = _3544;
    if (_3462)
    {
        float3 _9460 = float3(_3406, _3434, float(as_type<int>(_3544)));
        float3 _9464 = select(_9460, float3(0.0), isnan(_9460));
        float _3574 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9464.xy, uint(rint(_9464.z)), _3498, level(0.0));
        _3572 = _3574;
    }
    float _3576 = _3572;
    float3 _9474 = float3(_3568, _3570, _3524);
    float _3578 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9474, float3(0.0), isnan(_9474)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9474, float3(0.0), isnan(_9474)), level(0.0)).x;
    float3 _9483 = float3(_3568, _3570, _3524);
    float4 _3581 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9483, float3(0.0), isnan(_9483)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9483, float3(0.0), isnan(_9483)), level(0.0)).xyzw;
    float _3583 = _3581.x;
    float _3585 = _3581.y;
    float _3587 = _3581.z;
    float _3589 = _3581.w;
    float2 _9499 = float2(_3530, _3526);
    float3 _3591 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9499, float2(0.0), isnan(_9499)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9499, float2(0.0), isnan(_9499)), level(0.0)).xyz;
    float _3593 = _3591.x;
    float _3595 = _3591.y;
    float _3597 = _3591.z;
    float _3599 = _3566;
    if (!_3106)
    {
        float3 _9520 = float3(_3550, _3352, float(as_type<int>(_3566)));
        float3 _9522 = select(_9520, float3(0.0), isnan(_9520));
        float _3601 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9522.xy, uint(rint(_9522.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9522.xy, uint(rint(_9522.z)), level(0.0)).x;
        _3599 = _3601;
    }
    float _3603 = _3599;
    float _3605 = abs(_2952);
    float _3607 = log2(_3605);
    bool _3609 = _2952 <= 8000.0;
    bool _3611 = isnan(_2952);
    bool _3613 = _3609 || _3611;
    bool _3615 = isnan(8000.0);
    bool _3617 = _3613 || _3615;
    float _3619 = float(_3617);
    float _3621 = _3607 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3623 = _3438 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3625 = fma(_3446, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3623);
    float _3627 = exp2(_3621);
    float _3629 = _3386 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3631 = fma(_3230, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3625);
    float _3633 = fma(_3482, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3631);
    float _3635 = exp2(_3629);
    out.gl_Position.x = _3516;
    out.gl_Position.y = _3514;
    out.gl_Position.z = _3633;
    out.gl_Position.w = _3506;
    float _3637 = fma(_3627, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3639 = precise::clamp(_3637, 0.0, 1.0);
    float _3641 = fma(_3639, -2.0, 3.0);
    float _3643 = _3639 * _3639;
    float _3645 = _3643 * _3641;
    float _3647 = -_3645;
    float _3649 = _3647 + 1.0;
    float _3651 = fma(_3649, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3645);
    float _3653 = _3619 * _3651;
    float _3655 = _3619;
    float _3657 = _3633;
    if (!_3462)
    {
        _3655 = 1.0;
    }
    float _3659 = _3655;
    float _3661 = _3653 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3663 = -_3635;
    float _3665 = _3663 + 1.0;
    float _3667 = -_3522;
    float _3669 = _3667 + 1.0;
    float _3671 = _3669 * _3661;
    float _3673 = precise::clamp(_3671, 0.0, 1.0);
    float _3675 = _3659;
    float _3677 = _3665;
    float _3679 = _3661;
    if (_3462)
    {
        bool _3681 = _3576 >= _3498;
        bool _3683 = isnan(_3576);
        bool _3685 = _3681 || _3683;
        bool _3687 = isnan(_3498);
        bool _3689 = _3685 || _3687;
        float _3691 = float(_3689);
        _3675 = _3691;
    }
    float _3693 = _3675;
    float _3695 = _3665 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_3106)
    {
        _3677 = 1.0;
    }
    float _3697 = _3677;
    float _3699 = _3697;
    if (!_3106)
    {
        int _3701 = _3222 << 4;
        int _3703 = _3701 + 2048;
        uint _3705 = uint(int(uint(_3703) >> uint(2)));
        uint _3707 = uint(int(uint(int(_3705)) >> uint(2)));
        int _3709 = int(_3705) & 3;
        float _3711 = (*spvDescriptorSet0.vp_c15)._m0[int(_3707)][_3709];
        int _3713 = int(_3705) + 1;
        uint _3715 = uint(int(uint(_3713) >> uint(2)));
        int _3717 = _3713 & 3;
        float _3719 = (*spvDescriptorSet0.vp_c15)._m0[int(_3715)][_3717];
        int _3721 = _3703 + 8;
        uint _3723 = uint(int(uint(_3721) >> uint(2)));
        uint _3725 = uint(int(uint(int(_3723)) >> uint(2)));
        int _3727 = int(_3723) & 3;
        float _3729 = (*spvDescriptorSet0.vp_c15)._m0[int(_3725)][_3727];
        int _3731 = int(_3723) + 1;
        uint _3733 = uint(int(uint(_3731) >> uint(2)));
        int _3735 = _3731 & 3;
        float _3737 = (*spvDescriptorSet0.vp_c15)._m0[int(_3733)][_3735];
        float _3739 = _2860 * _3719;
        float _3741 = fma(_991, _3711, _3739);
        float _3743 = fma(_993, _3729, _3741);
        float _3745 = _3743 + _3737;
        float _3747 = precise::clamp(_3745, 0.0, 1.0);
        float _3749 = -_3747;
        float _3751 = _3749 + _3603;
        float _3753 = fma(_3751, 500.0, 1.5);
        float _3755 = exp2(_3753);
        float _3757 = 0.0 + _3755;
        float _3759 = precise::clamp(_3757, 0.0, 1.0);
        _3699 = _3759;
        _3534 = _3729;
    }
    float _3761 = _3699;
    float _3763 = _3534;
    float _3765 = _3693 * _3761;
    float _3767 = _3695 * _3578;
    float _3769 = -_3673;
    float _3771 = fma(_3769, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3773 = -_3695;
    float _3775 = _3773 + 1.0;
    out.m_96.x = _2838;
    out.m_96.y = _2836;
    out.m_96.z = _2840;
    float _3777 = _3589 * _3767;
    float _3779 = -_3765;
    float _3781 = fma(_3779, _3771, 1.0);
    float _3783 = precise::clamp(_3781, 0.0, 1.0);
    float _3785 = _3597 * _3767;
    float _3787 = _3589 * _3775;
    float _3789 = fma(_3593, _3777, _3583);
    float _3791 = fma(_3595, _3777, _3585);
    float _3793 = _3783 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3795 = fma(_3589, _3785, _3587);
    bool _3797 = _2872 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3799 = isnan(_2872);
    bool _3801 = _3797 || _3799;
    bool _3803 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3805 = _3801 || _3803;
    out.m_98.x = _3793;
    out.m_100.x = _3789;
    out.m_100.y = _3791;
    out.m_100.z = _3795;
    out.m_100.w = _3787;
    float _3807 = _3763;
    float _3809 = _3777;
    float _3811 = _3771;
    float _3813 = _3783;
    if (!_3805)
    {
        _3657 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3815 = _3657;
    float _3817 = _3815;
    float _3819 = _3815;
    if (!_3805)
    {
        _3807 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3821 = _3807;
    float _3823 = _3821;
    float _3825 = _3821;
    if (!_3805)
    {
        _3679 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3827 = _3679;
    float _3829 = _3827;
    float _3831 = _3827;
    if (!_3805)
    {
        _3809 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3833 = _3809;
    float _3835 = _3833;
    float _3837 = _3833;
    if (!_3805)
    {
        _3811 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3839 = _3811;
    float _3841 = _3839;
    float _3843 = _3839;
    if (!_3805)
    {
        _3813 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3845 = _3813;
    bool _3847 = !_3805;
    float _3849 = _3845;
    float _3851 = _3845;
    if (!_3847)
    {
        bool _3853 = _2872 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3855 = isnan(_2872);
        bool _3857 = _3853 || _3855;
        bool _3859 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3861 = _3857 || _3859;
        if (!_3861)
        {
            float _3863 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3865 = _2872 + _3863;
            float _3867 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3869 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3867;
            float _3871 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3873 = _3871 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3875 = 1.0 / _3869;
            float _3877 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3879 = _3877 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3881 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3883 = _3881 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3885 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3887 = _3885 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3889 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3891 = _3889 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3893 = _3865 * _3875;
            float _3895 = precise::clamp(_3893, 0.0, 1.0);
            float _3897 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3899 = _3897 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3901 = fma(_3895, _3873, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3903 = fma(_3895, _3899, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3905 = fma(_3895, _3879, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3907 = fma(_3895, _3883, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3909 = fma(_3895, _3887, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3911 = fma(_3895, _3891, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3825 = _3905;
            _3843 = _3909;
            _3819 = _3901;
            _3837 = _3907;
            _3831 = _3903;
            _3851 = _3911;
            _3913 = true;
        }
        else
        {
            bool _3915 = _2872 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3917 = isnan(_2872);
            bool _3919 = _3915 || _3917;
            bool _3921 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3923 = _3919 || _3921;
            if (!_3923)
            {
                _3817 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3925 = _3817;
            _3819 = _3925;
            if (!_3923)
            {
                _3823 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3927 = _3823;
            _3825 = _3927;
            if (!_3923)
            {
                _3829 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3929 = _3829;
            _3831 = _3929;
            if (!_3923)
            {
                _3835 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3931 = _3835;
            _3837 = _3931;
            if (!_3923)
            {
                _3841 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3933 = _3841;
            _3843 = _3933;
            if (!_3923)
            {
                _3849 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3935 = _3849;
            bool _3937 = !_3923;
            _3851 = _3935;
            if (!_3937)
            {
                bool _3939 = _2872 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3941 = isnan(_2872);
                bool _3943 = _3939 || _3941;
                bool _3945 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3947 = _3943 || _3945;
                if (!_3947)
                {
                    float _3949 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3951 = _2872 + _3949;
                    float _3953 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3955 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3953;
                    float _3957 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3959 = _3957 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3961 = 1.0 / _3955;
                    float _3963 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3965 = _3963 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3967 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3969 = _3967 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3971 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3973 = _3971 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3975 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3977 = _3975 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3979 = _3951 * _3961;
                    float _3981 = precise::clamp(_3979, 0.0, 1.0);
                    float _3983 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3985 = _3983 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3987 = fma(_3981, _3959, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3989 = fma(_3981, _3985, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3991 = fma(_3981, _3965, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3993 = fma(_3981, _3969, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3995 = fma(_3981, _3973, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3997 = fma(_3981, _3977, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3825 = _3991;
                    _3843 = _3995;
                    _3819 = _3987;
                    _3837 = _3993;
                    _3831 = _3989;
                    _3851 = _3997;
                    _3913 = true;
                }
                else
                {
                    _3825 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3843 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3819 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3837 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3831 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3851 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3913 = false;
    float _3999 = _3825;
    float _4001 = _3843;
    float _4003 = _3819;
    float _4005 = _3837;
    float _4007 = _3831;
    float _4009 = _3851;
    float _4011 = fma(_2738, -0.5, 0.5);
    float _4013 = precise::clamp(_4011, 0.0, 1.0);
    float _4015 = -_3999;
    float _4017 = _4015 + _4001;
    float _4019 = -_4003;
    float _4021 = _4019 + _4005;
    float _4023 = -_4007;
    float _4025 = _4023 + _4009;
    bool _4027 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4029 = fma(_4013, _4017, _3999);
    float _4031 = fma(_4013, _4021, _4003);
    float _4033 = fma(_4013, _4025, _4007);
    float _4035 = _4029 * 0.586610972881317138671875;
    out.m_63.x = 1.0;
    float _4037 = fma(_4031, 0.298911988735198974609375, _4035);
    float _4039 = fma(_4033, 0.114477999508380889892578125, _4037);
    out.m_102.x = 0.0;
    float _4041 = -_4039;
    float _4043 = _4031 + _4041;
    float _4045 = -_4039;
    float _4047 = _4029 + _4045;
    float _4049 = -_4039;
    float _4051 = _4033 + _4049;
    float _4053 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4055 = fma(_4043, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4039);
    float _4057 = fma(_4047, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4039);
    float _4059 = fma(_4051, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4039);
    out.m_98.w = _4053;
    out.m_104.x = _4055;
    out.m_104.y = _4057;
    out.m_104.z = _4059;
    if (!_4027)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4061 = -_2836;
    float _4063 = _4061 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4065 = -_2838;
    float _4067 = _4065 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4069 = -_2840;
    float _4071 = _4069 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4073 = _4063 * _4063;
    float _4075 = fma(_4067, _4067, _4073);
    float _4077 = fma(_4071, _4071, _4075);
    float _4079 = sqrt(_4077);
    float _4081 = rsqrt(_4077);
    float _4083 = -_4079;
    float _4085 = _4083 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4087 = _4085 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4089 = precise::clamp(_4087, 0.0, 1.0);
    float _4091 = _4067 * _4081;
    float _4093 = _4063 * _4081;
    float _4095 = abs(_4089);
    float _4097 = log2(_4095);
    float _4099 = _4071 * _4081;
    float _4101 = _4091 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4103 = _2738 * _4093;
    float _4105 = -_4093;
    float _4107 = -_4101;
    float _4109 = fma(_4105, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4107);
    float _4111 = fma(_2732, _4091, _4103);
    float _4113 = -_4099;
    float _4115 = fma(_4113, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4109);
    float _4117 = fma(_2740, _4099, _4111);
    float _4119 = precise::clamp(_4117, 0.0, 1.0);
    float _4121 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4123 = _4115 + _4121;
    float _4125 = _4097 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4127 = _4123 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4129 = precise::clamp(_4127, 0.0, 1.0);
    float _4131 = exp2(_4125);
    float _4133 = _4131 * _4129;
    float _4135 = _4119 * _4133;
    float _4137 = _4135 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4139 = _4135 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4141 = _4135 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_102.x = _4137;
    out.m_102.y = _4139;
    out.m_102.z = _4141;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3913 = false;
    bool _2792 = false;
    bool _219 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _118 = in.m_60.w;
    float _120 = trunc(_118);
    int _123 = int(_120);
    bool _127 = _123 >= 1;
    float _129 = 0.0;
    if (!_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    float _133 = _131;
    if (!_127)
    {
        out.m_63.x = 0.0;
    }
    int _135 = 0;
    if (!_127)
    {
        float _137 = _131 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    int _141 = _139;
    if (!_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4198 = as_type<float>(_139);
        out.gl_Position.z = _4198;
    }
    if (!_127)
    {
        return out;
    }
    float _143 = in.m_65.w;
    bool _145 = _143 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _147 = isnan(_143);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _153 = _149 || _151;
    float _155 = -_143;
    float _157 = _155 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _159 = _157;
    if (_153)
    {
        float _161 = float(_123);
        _133 = _161;
    }
    float _163 = _133;
    bool _165 = _157 >= _163;
    bool _167 = !_153;
    bool _169 = _165 || _167;
    float _171 = _163;
    if (_169)
    {
        _171 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _173 = _171;
    if (_169)
    {
        out.m_63.x = 0.0;
    }
    if (_169)
    {
        float _175 = _173 * 5.0;
        _141 = as_type<int>(_175);
    }
    int _177 = _141;
    if (_169)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4268 = as_type<float>(_177);
        out.gl_Position.z = _4268;
    }
    if (_169)
    {
        return out;
    }
    float _179 = as_type<float>(int(gl_VertexIndex));
    bool _181 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _183 = as_type<int>(_179) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_179) & 2;
    bool _189 = _187 != 0;
    bool _191 = !_185;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_189;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_181;
    float _217;
    if (!_199)
    {
        float _201 = in.m_70.x;
        float _203 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _205 = _201 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _207 = fma(_205, (*spvDescriptorSet0.vp_c9)._m0[12].x, _157);
        float _209 = _207 * _203;
        float _211 = floor(_209);
        float _213 = -_211;
        float _215 = _209 + _213;
        _217 = _215;
        _219 = true;
    }
    else
    {
        float _221 = float(_123);
        float _223 = 1.0 / _221;
        float _225 = _157 * _223;
        _217 = _225;
    }
    _219 = false;
    float _227 = _217;
    float _229 = in.m_70.x;
    float _231 = in.m_70.y;
    float _233 = in.m_70.z;
    float _235 = in.m_70.w;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _239 = _227 + _237;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _241;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _247 = _245 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _249;
    float _253 = 1.0 / _243;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _257 = _255 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    int _259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _261 = _259 != 0;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _265 = 1.0 / _247;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _273;
    float _277 = _231 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _279 = _229 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _281 = 1.0 / _251;
    float _283 = _229 * 2.0;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _287 = _227 + _285;
    float _289 = -_267;
    float _291 = fma(_279, 2.0, _289);
    float _293 = _231 * 2.0;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _297 = _295 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _299 = floor(_283);
    float _301 = fma(_277, -2.0, _263);
    float _303 = _233 * 2.0;
    float _305 = _287 * _253;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _309 = _227 + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _311;
    float _315 = fma(_271, _305, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _317 = floor(_303);
    float _319 = _309 * _265;
    float _321 = _229 + _231;
    float _323 = fma(_275, _305, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _329 = _321 + (-1.0);
    float _331 = _233 + _231;
    float _333 = floor(_293);
    bool _335 = _299 > 0.0;
    float _337 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _339 = _331 + (-1.0);
    bool _341 = _299 >= 0.0;
    bool _343 = isnan(_299);
    bool _345 = _341 || _343;
    bool _347 = isnan(0.0);
    bool _349 = _345 || _347;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _353 = float(_123);
    float _355 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _357 = 1.0 / _257;
    bool _359 = _317 > 0.0;
    float _361 = fma(_297, _319, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _363 = as_type<int>(_339);
    if (_261)
    {
        _363 = 0;
    }
    int _365 = _363;
    float _367 = fma(_327, _319, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _369 = _317 >= 0.0;
    bool _371 = isnan(_317);
    bool _373 = _369 || _371;
    bool _375 = isnan(0.0);
    bool _377 = _373 || _375;
    int _379 = _365;
    if (!_261)
    {
        _379 = 1;
    }
    int _381 = _379;
    float _383 = 1.0 / _353;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _387 = _227 + _385;
    bool _389 = _333 > 0.0;
    bool _391 = _333 >= 0.0;
    bool _393 = isnan(_333);
    bool _395 = _391 || _393;
    bool _397 = isnan(0.0);
    bool _399 = _395 || _397;
    float _401 = _387 * _281;
    float _403 = _233 + _229;
    int _405 = _349 ? 0 : 1;
    float _407 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _409 = int(_407);
    bool _411 = _381 != 1;
    float _413 = _403 + (-1.0);
    int _415 = _377 ? 0 : 1;
    float _417 = fma(_313, _401, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _419 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _421 = _399 ? 0 : 1;
    float _423 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _425 = int(_423);
    int _427 = ~_405;
    int _429 = _427 + 1;
    int _431 = _429 + 1;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _433;
    int _437 = _431;
    float _439 = as_type<float>(_381);
    if (!_335)
    {
        int _441 = ~_405;
        int _443 = _441 + 1;
        _437 = _443;
    }
    int _445 = _437;
    float _447 = _239 * _357;
    int _449 = ~_415;
    int _451 = _449 + 1;
    int _453 = _451 + 1;
    float _455 = fma(_435, _401, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    int _457 = _453;
    if (!_359)
    {
        int _459 = ~_415;
        int _461 = _459 + 1;
        _457 = _461;
    }
    int _463 = _457;
    float _465 = _383 * _157;
    int _467 = ~_421;
    int _469 = _467 + 1;
    int _471 = _469 + 1;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _475 = _473 != 0;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _479 = _477 != 0;
    int _481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _483 = _481 != 0;
    int _485 = _471;
    if (!_389)
    {
        int _487 = ~_421;
        int _489 = _487 + 1;
        _485 = _489;
    }
    int _491 = _485;
    float _493 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _495 = log2(_493);
    bool _497 = !_479;
    int _499 = _497 ? 0 : 1;
    bool _501 = !_475;
    int _503 = _501 ? 0 : 1;
    bool _505 = !_483;
    int _507 = _505 ? 0 : 1;
    int _509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _511 = _509 != 0;
    int _513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _515 = _513 != 0;
    int _517 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _519 = _517 != 0;
    float _521 = float(_425);
    float _523 = as_type<float>(_425);
    if (!_411)
    {
        _523 = _231;
    }
    float _525 = _523;
    float _527 = _525;
    if (_411)
    {
        _527 = _229;
    }
    float _529 = _527;
    float _531 = 1.0 / _521;
    bool _533 = !_511;
    float _535 = _533 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _537 = _529 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _539 = _535;
    if (!_411)
    {
        _439 = _231;
    }
    float _541 = _439;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _545 = _541;
    if (_411)
    {
        _545 = _229;
    }
    float _547 = _545;
    float _549 = -_351;
    float _551 = fma(_537, 2.0, _549);
    float _553 = _495 * _157;
    int _555 = abs(as_type<int>(_535));
    float _557 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[83].z, _543);
    float _559 = _547;
    if (!_411)
    {
        _539 = _233;
    }
    float _561 = _539;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _565 = _561;
    if (_411)
    {
        _565 = _231;
    }
    float _567 = _565;
    float _569 = exp2(_553);
    if (!_411)
    {
        _559 = _233;
    }
    float _571 = _559;
    float _573 = _531 * _157;
    float _575 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[83].w, _563);
    float _577 = _571;
    if (_411)
    {
        _577 = _231;
    }
    float _579 = _577;
    float _581 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[82].z, _557);
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _585 = float(_409);
    float _587 = _579 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _589 = float(_555);
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _593 = 1.0 + _591;
    float _595 = 1.0 / _585;
    float _597 = fma(_587, -2.0, _583);
    float _599 = float(_463);
    float _601 = -_157;
    float _603 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[76].x, _291);
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _607 = 1.0 / _593;
    float _609 = _589 * _599;
    bool _611 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _613 = isnan(1.0);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _619 = _615 || _617;
    float _621 = in.m_72.x;
    float _623 = in.m_72.y;
    float _625 = in.m_72.z;
    float _627 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[78].z, _605);
    float _629 = -_569;
    float _631 = _629 + 1.0;
    bool _633 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _635 = isnan(0.0);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _641 = _637 || _639;
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _645 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _647 = isnan(_227);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = _595 * _157;
    float _659 = _641 ? _631 : 0.0;
    float _661 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[78].w, _643);
    bool _663 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _665 = isnan(_227);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    float _675 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[76].y, _301);
    float _677 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[82].w, _575);
    float _679 = -_655;
    float _681 = _679 + 1.0;
    float _683 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[77].z, _627);
    float _685 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[77].w, _661);
    float _687 = -_157;
    float _689 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[81].x, _551);
    float _691 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[81].y, _597);
    if (_619)
    {
        float _693 = _659 * _607;
        _159 = _693;
    }
    float _695 = _159;
    float _697 = _609 * (-2.0);
    bool _699 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _701 = isnan(_227);
    bool _703 = _699 || _701;
    bool _705 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _707 = _703 || _705;
    float _709 = float(_707);
    float _711 = -_673;
    float _713 = _711 + 1.0;
    float _715 = _673 * _681;
    float _717 = fma(_337, _697, _337);
    bool _719 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _721 = isnan(_227);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _727 = _723 || _725;
    float _729 = float(_727);
    float _731 = _709 * _713;
    bool _733 = !_515;
    int _735 = _733 ? 0 : 1;
    float _737 = -_709;
    float _739 = _737 + 1.0;
    bool _741 = !_519;
    int _743 = _741 ? 0 : 1;
    float _745 = fma(_697, _621, _621);
    int _747 = abs(_735);
    bool _749 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _751 = isnan(_227);
    bool _753 = _749 || _751;
    bool _755 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _757 = _753 || _755;
    float _759 = float(_757);
    float _761 = _729 * _739;
    int _763 = abs(_743);
    float _765 = _229 + (-0.5);
    float _767 = float(_445);
    float _769 = -_729;
    float _771 = _769 + 1.0;
    float _773 = float(_747);
    float _775 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[196].x, _745);
    float _777 = float(_491);
    float _779 = _759 * _771;
    float _781 = -_759;
    float _783 = _781 + 1.0;
    float _785 = _773 * _767;
    float _787 = fma(_717, _695, _775);
    float _789 = _323 * _779;
    float _791 = _315 * _779;
    float _793 = _785 * (-2.0);
    float _795 = float(_763);
    float _797 = _231 + (-0.5);
    float _799 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[143].y, _789);
    float _801 = fma(_793, _623, _623);
    float _803 = fma(_355, _793, _355);
    float _805 = _795 * _777;
    float _807 = fma(_367, _761, _799);
    float _809 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[196].y, _801);
    float _811 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[143].x, _791);
    float _813 = _805 * (-2.0);
    float _815 = in.m_74.x;
    float _817 = in.m_74.y;
    float _819 = fma(_803, _695, _809);
    float _821 = _787 * 0.15915493667125701904296875;
    float _823 = fma(_813, _625, _625);
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _827 = _825 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _829 = _819 * 0.15915493667125701904296875;
    float _831 = _233 + (-0.5);
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _835 = _833 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _837 = fma(_361, _761, _811);
    float _839 = fma(_419, _813, _419);
    float _841 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[196].z, _823);
    float _843 = in.m_60.x;
    float _845 = in.m_60.y;
    float _847 = in.m_60.z;
    float _849 = fma(_827, _447, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _851 = fma(_835, _447, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _853 = fma(_455, _731, _807);
    float _855 = in.m_76.x;
    float _857 = in.m_76.y;
    float _859 = in.m_76.z;
    float _861 = fma(_417, _731, _837);
    float _863 = fma(_839, _695, _841);
    float _865 = fma(_851, _715, _853);
    float _867 = _821 * 6.283185482025146484375;
    float _869 = cos(_867);
    float _871 = fma(_849, _715, _861);
    float _873 = _863 * 0.15915493667125701904296875;
    float _875 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[147].y, _865);
    float _877 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[147].x, _871);
    float _879 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _881 = _875 * _817;
    float _883 = _829 * 6.283185482025146484375;
    float _885 = sin(_883);
    float _887 = _877 * _815;
    float _889 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _891 = _881 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _893 = _887 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _895 = in.m_78.x;
    float _897 = in.m_78.y;
    float _899 = in.m_78.z;
    float _901 = _829 * 6.283185482025146484375;
    float _903 = cos(_901);
    float _905 = _893 * _879;
    float _907 = _891 * _889;
    float _909 = _845 * _857;
    float _911 = _821 * 6.283185482025146484375;
    float _913 = sin(_911);
    float _915 = fma(_843, _855, _909);
    float _917 = _869 * _885;
    float _919 = fma(_847, _859, _915);
    float _921 = _873 * 6.283185482025146484375;
    float _923 = cos(_921);
    float _925 = _869 * _903;
    float _927 = _873 * 6.283185482025146484375;
    float _929 = sin(_927);
    float _931 = _913 * _885;
    float _933 = _913 * _903;
    float _935 = _869 * _923;
    float _937 = _913 * _923;
    float _939 = _903 * _923;
    float _941 = _885 * _923;
    float _943 = _935 * _907;
    float _945 = _937 * _907;
    float _947 = fma(_929, _925, _931);
    float _949 = -_917;
    float _951 = fma(_929, _933, _949);
    float _953 = -_933;
    float _955 = fma(_929, _917, _953);
    float _957 = -_907;
    float _959 = _929 * _957;
    float _961 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _963 = fma(_947, _905, _943);
    float _965 = fma(_929, _931, _925);
    float _967 = fma(_939, _905, _959);
    float _969 = _845 * _897;
    float _971 = fma(_955, _961, _963);
    float _973 = fma(_951, _905, _945);
    float _975 = fma(_941, _961, _967);
    float _977 = fma(_843, _895, _969);
    float _979 = _971 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _981 = _971 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _983 = fma(_965, _961, _973);
    float _985 = fma(_847, _899, _977);
    float _987 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[24].x, _979);
    float _989 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[26].x, _981);
    float _991 = _919 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _993 = _985 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _995 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[24].z, _987);
    float _997 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[26].z, _989);
    float _999 = _995 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1001 = _997 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1003 = _991 + _999;
    float _1005 = _993 + _1001;
    float _1007 = in.m_80.x;
    float _1009 = in.m_80.y;
    float _1011 = in.m_80.z;
    float _1013 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1015 = _1003 + _1013;
    float _1017 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1019 = _1005 + _1017;
    float _1021 = _1015 * _1015;
    float _1023 = _1019 * _1019;
    float _1025 = _1021 + _1023;
    float _1027 = sqrt(_1025);
    float _1029 = _845 * _1009;
    float _1031 = fma(_843, _1007, _1029);
    bool _1033 = _1027 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1035 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1037 = _1027 + _1035;
    float _1039 = fma(_847, _1011, _1031);
    float _1041 = _945;
    float _1043 = _1025;
    float _1045 = _1037;
    float _1047 = _971;
    float _1049 = _845;
    float _1051 = _1003;
    float _1053 = _1005;
    float _1055 = _1021;
    float _1057 = _1023;
    if (_1033)
    {
        float _1059 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1041 = _1059;
    }
    float _1061 = _1041;
    if (_1033)
    {
        float _1063 = rsqrt(_1025);
        _1043 = _1063;
    }
    float _1065 = _1043;
    float _1067 = _1065;
    if (_1033)
    {
        float _1069 = _1037 * _1061;
        _1045 = _1069;
    }
    float _1071 = _1045;
    float _1073 = _971 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (_1033)
    {
        float _1075 = _1071 * 0.15915493667125701904296875;
        _1047 = _1075;
    }
    float _1077 = _1047;
    float _1079 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1073);
    float _1081 = _1039 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1083 = _843;
    float _1085 = _1081;
    if (_1033)
    {
        float _1087 = _1077 * 6.283185482025146484375;
        float _1089 = sin(_1087);
        _1083 = _1089;
    }
    float _1091 = _1083;
    float _1093 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1079);
    float _1095 = _1093 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1097 = _1081 + _1095;
    float _1099 = _1097;
    if (_1033)
    {
        float _1101 = _1097 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1049 = _1101;
    }
    float _1103 = _1049;
    float _1105 = _1091;
    if (_1033)
    {
        float _1107 = fma(_1091, _1103, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1105 = _1107;
    }
    float _1109 = _1105;
    float _1111 = _1109;
    if (_1033)
    {
        float _1113 = _1065 * _1109;
        _1111 = _1113;
    }
    float _1115 = _1111;
    if (_1033)
    {
        float _1117 = fma(_1015, _1115, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1051 = _1117;
    }
    float _1119 = _1051;
    if (_1033)
    {
        float _1121 = fma(_1019, _1115, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1053 = _1121;
    }
    float _1123 = _1053;
    float _1125 = fma(_1119, 6.2500002968590706586837768554688e-05, 0.5);
    float _1127 = fma(_1123, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5737 = float2(_1125, _1127);
    float3 _1131 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5737, float2(0.0), isnan(_5737)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5737, float2(0.0), isnan(_5737)), level(0.0)).xyz;
    float _1133 = _1131.x;
    float _1135 = _1131.y;
    float _1137 = _1131.z;
    float _1139 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1141 = int(_1139);
    if (_261)
    {
        float _1143 = in.m_70.x;
        _1067 = _1143;
    }
    float _1145 = _1067;
    float _1147 = -_581;
    float _1149 = _1147 + 1.0;
    float _1151 = -_683;
    float _1153 = _1151 + 1.0;
    float _1155 = _1145;
    if (!_261)
    {
        float _1157 = in.m_70.y;
        _1155 = _1157;
    }
    float _1159 = _1155;
    float _1161 = -_685;
    float _1163 = _1161 + 1.0;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1167 = trunc(_573);
    int _1169 = int(_1167);
    float _1171 = -_677;
    float _1173 = _1171 + 1.0;
    float _1175 = float(uint(_1141));
    float _1177 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1179 = int(_1177);
    int _1181 = ~_1141;
    int _1183 = _1181 + 1;
    float _1185 = float(_1141);
    bool _1187 = _1141 == 0;
    float _1189 = float(uint(_1169));
    float _1191 = 1.0 / _1175;
    float _1193 = float(uint(_1179));
    float _1195 = trunc(_657);
    int _1197 = int(_1195);
    int _1199 = ~_1179;
    int _1201 = _1199 + 1;
    bool _1203 = _1179 == 0;
    int _1205 = as_type<int>(_1191) + (-2);
    float _1207 = 1.0 / _1193;
    float _1209 = _1191;
    float _1211 = _1173;
    if (_261)
    {
        _1209 = 1.0;
    }
    float _1213 = _1209;
    float _1215 = _1213;
    if (!_261)
    {
        _1215 = 7.345489978790283203125;
    }
    float _1217 = _1215;
    float _1219 = as_type<float>(_1205) * _1189;
    float _1221 = trunc(_1219);
    float _1223 = precise::max(_1221, 0.0);
    uint _1226 = uint(_1223);
    float _1228 = _1217 * _229;
    int _1230 = as_type<int>(_1207) + (-2);
    float _1232 = float(uint(_1197));
    int _1234 = _1183 * int(_1226);
    int _1236 = _1234 + _1169;
    float _1238 = as_type<float>(_1230) * _1232;
    float _1240 = float(_1169);
    float _1242 = float(uint(_1236));
    float _1244 = floor(_1228);
    bool _1246 = _1240 >= _1185;
    bool _1248 = isnan(_1240);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan(_1185);
    bool _1254 = _1250 || _1252;
    float _1256 = float(_1254);
    float _1258 = as_type<float>(_1205) * _1242;
    float _1260 = trunc(_1238);
    float _1262 = precise::max(_1260, 0.0);
    uint _1264 = uint(_1262);
    float _1266 = trunc(_1258);
    float _1268 = precise::max(_1266, 0.0);
    uint _1270 = uint(_1268);
    float _1272 = -_1244;
    float _1274 = _1228 + _1272;
    int _1276 = ~_1141;
    int _1278 = _1276 + 1;
    float _1280 = _1274 * _1185;
    int _1282 = _1201 * int(_1264);
    int _1284 = _1282 + _1197;
    float _1286 = trunc(_1256);
    int _1288 = int(_1286);
    float _1290 = float(uint(_1284));
    int _1292 = int(_1226) + int(_1270);
    float _1294 = as_type<float>(_1230) * _1290;
    float _1296 = trunc(_1280);
    int _1298 = int(_1296);
    int _1300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1302 = _1300 != 0;
    float _1304 = as_type<float>(_1278);
    if (_261)
    {
        _1304 = 1.0;
    }
    float _1306 = _1304;
    int _1308 = _1278 * _1292;
    int _1310 = _1308 + _1169;
    float _1312 = _1306;
    if (!_261)
    {
        _1312 = 1.2345600128173828125;
    }
    float _1314 = _1312;
    bool _1316 = !_1302;
    int _1318 = _1316 ? 0 : 1;
    bool _1320 = uint(_1310) >= uint(_1141);
    float _1322 = _1314 * _1159;
    float _1324 = trunc(_1294);
    float _1326 = precise::max(_1324, 0.0);
    uint _1328 = uint(_1326);
    int _1330 = abs(_1318);
    bool _1332 = !_1320;
    int _1334 = _1332 ? 0 : (-1);
    int _1336 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1338 = _1336 != 0;
    int _1340 = ~_1292;
    int _1342 = _1340 + _1334;
    int _1344 = _1342 + 1;
    float _1346 = _1185 * _465;
    int _1348 = ~_1179;
    int _1350 = _1348 + 1;
    int _1352 = abs(_503);
    int _1354 = _1141 * _1344;
    int _1356 = _1354 + _1169;
    float _1358 = trunc(_1346);
    int _1360 = int(_1358);
    int _1362 = ~_1288;
    int _1364 = _1362 + 1;
    int _1366 = _1364 + 1;
    bool _1368 = !_1187;
    int _1370 = _1368 ? _1356 : (-1);
    int _1372 = _1298 * _1330;
    int _1374 = _1372 + _1169;
    int _1376 = int(_1264) + int(_1328);
    int _1378 = _1141 + (-1);
    int _1380 = _1370 * _1366;
    int _1382 = abs(_499);
    int _1384 = _1350 * _1376;
    int _1386 = _1384 + _1197;
    float _1388 = floor(_1322);
    int _1390 = _1288 * _1378;
    int _1392 = _1390 + _1380;
    float _1394 = float(_1179);
    float _1396 = float(_1197);
    bool _1398 = uint(_1386) >= uint(_1179);
    int _1400 = _1392 * _1382;
    bool _1402 = _1396 >= _1394;
    bool _1404 = isnan(_1396);
    bool _1406 = _1402 || _1404;
    bool _1408 = isnan(_1394);
    bool _1410 = _1406 || _1408;
    float _1412 = float(_1410);
    int _1414 = abs(_507);
    bool _1416 = !_1398;
    int _1418 = _1416 ? 0 : (-1);
    float _1420 = trunc(_1412);
    int _1422 = int(_1420);
    float _1424 = -_1388;
    float _1426 = _1322 + _1424;
    int _1428 = ~_1376;
    int _1430 = _1428 + _1418;
    int _1432 = _1430 + 1;
    bool _1434 = !_1338;
    int _1436 = _1434 ? 0 : 1;
    int _1438 = _1360 * _1352;
    int _1440 = _1438 + _1400;
    float _1442 = _1426 * _1394;
    int _1444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1446 = _1444 != 0;
    int _1448 = _1179 * _1432;
    int _1450 = _1448 + _1197;
    int _1452 = abs(_1436);
    int _1454 = _1374 * _1414;
    int _1456 = _1454 + _1440;
    bool _1458 = !_1446;
    int _1460 = _1458 ? 0 : 1;
    float _1462 = trunc(_1442);
    int _1464 = int(_1462);
    int _1466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1468 = _1466 != 0;
    int _1470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1472 = _1470 != 0;
    int _1474 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1476 = _1474 != 0;
    int _1478 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1480 = _1478 != 0;
    float _1482 = _1394 * _465;
    int _1484 = _1298 * _1452;
    int _1486 = _1484 + _1456;
    int _1488 = ~_1422;
    int _1490 = _1488 + 1;
    int _1492 = _1490 + 1;
    bool _1494 = !_1203;
    int _1496 = _1494 ? _1450 : (-1);
    float _1498 = trunc(_1482);
    int _1500 = int(_1498);
    bool _1502 = !_1472;
    int _1504 = _1502 ? 0 : 1;
    float _1506 = float(uint(_1486));
    int _1508 = _1496 * _1492;
    int _1510 = abs(_1460);
    int _1512 = _1179 + (-1);
    float _1514 = as_type<float>(_1205) * _1506;
    bool _1516 = !_1468;
    int _1518 = _1516 ? 0 : 1;
    int _1520 = abs(_1504);
    int _1522 = _1422 * _1512;
    int _1524 = _1522 + _1508;
    int _1526 = abs(_1518);
    float _1528 = trunc(_1514);
    float _1530 = precise::max(_1528, 0.0);
    uint _1532 = uint(_1530);
    int _1534 = _1464 * _1510;
    int _1536 = _1534 + _1197;
    bool _1538 = !_1476;
    int _1540 = _1538 ? 0 : 1;
    int _1542 = _1524 * _1520;
    int _1544 = ~_1141;
    int _1546 = _1544 + 1;
    float _1548 = float(uint(_1374));
    int _1550 = _1500 * _1526;
    int _1552 = _1550 + _1542;
    bool _1554 = !_1480;
    int _1556 = _1554 ? 0 : 1;
    int _1558 = abs(_1540);
    float _1560 = as_type<float>(_1205) * _1548;
    int _1562 = abs(_1556);
    int _1564 = _1536 * _1558;
    int _1566 = _1564 + _1552;
    float _1568 = trunc(_1560);
    float _1570 = precise::max(_1568, 0.0);
    uint _1572 = uint(_1570);
    int _1574 = _1546 * int(_1532);
    int _1576 = _1574 + _1486;
    float _1578 = float(uint(_1536));
    int _1580 = _1464 * _1562;
    int _1582 = _1580 + _1566;
    int _1584 = ~_1179;
    int _1586 = _1584 + 1;
    float _1588 = float(uint(_1576));
    float _1590 = as_type<float>(_1230) * _1578;
    float _1592 = float(uint(_1582));
    int _1594 = ~_1141;
    int _1596 = _1594 + 1;
    float _1598 = trunc(_1590);
    float _1600 = precise::max(_1598, 0.0);
    uint _1602 = uint(_1600);
    float _1604 = as_type<float>(_1205) * _1588;
    float _1606 = as_type<float>(_1230) * _1592;
    int _1608 = _1596 * int(_1572);
    int _1610 = _1608 + _1374;
    float _1612 = trunc(_1604);
    float _1614 = precise::max(_1612, 0.0);
    uint _1616 = uint(_1614);
    int _1618 = ~_1179;
    int _1620 = _1618 + 1;
    float _1622 = float(uint(_1610));
    float _1624 = trunc(_1606);
    float _1626 = precise::max(_1624, 0.0);
    uint _1628 = uint(_1626);
    int _1630 = _1586 * int(_1602);
    int _1632 = _1630 + _1536;
    float _1634 = as_type<float>(_1205) * _1622;
    int _1636 = ~_1141;
    int _1638 = _1636 + 1;
    float _1640 = float(uint(_1632));
    float _1642 = trunc(_1634);
    float _1644 = precise::max(_1642, 0.0);
    uint _1646 = uint(_1644);
    int _1648 = int(_1532) + int(_1616);
    float _1650 = as_type<float>(_1230) * _1640;
    int _1652 = _1620 * int(_1628);
    int _1654 = _1652 + _1582;
    float _1656 = trunc(_1650);
    float _1658 = precise::max(_1656, 0.0);
    uint _1660 = uint(_1658);
    int _1662 = _1638 * _1648;
    int _1664 = _1662 + _1486;
    float _1666 = float(uint(_1654));
    bool _1668 = uint(_1664) >= uint(_1141);
    int _1670 = int(_1572) + int(_1646);
    float _1672 = as_type<float>(_1230) * _1666;
    bool _1674 = !_1668;
    int _1676 = _1674 ? 0 : (-1);
    int _1678 = ~_1179;
    int _1680 = _1678 + 1;
    float _1682 = trunc(_1672);
    float _1684 = precise::max(_1682, 0.0);
    uint _1686 = uint(_1684);
    int _1688 = ~_1648;
    int _1690 = _1688 + _1676;
    int _1692 = _1690 + 1;
    int _1694 = int(_1602) + int(_1660);
    int _1696 = _1141 * _1692;
    int _1698 = _1696 + _1486;
    int _1700 = ~_1141;
    int _1702 = _1700 + 1;
    int _1704 = _1680 * _1694;
    int _1706 = _1704 + _1536;
    int _1708 = ~_1179;
    int _1710 = _1708 + 1;
    bool _1712 = !_1187;
    int _1714 = _1712 ? _1698 : (-1);
    int _1716 = _1702 * _1670;
    int _1718 = _1716 + _1374;
    int _1720 = _1714 & 3;
    bool _1722 = _1720 != 0;
    int _1724 = int(_1628) + int(_1686);
    int _1726 = _1714 & 3;
    bool _1728 = _1726 != 0;
    bool _1730 = uint(_1720) >= 2u;
    int _1732 = _1710 * _1724;
    int _1734 = _1732 + _1582;
    int _1736 = _1728 ? 0 : 1;
    bool _1738 = uint(_1718) >= uint(_1141);
    int _1740 = _1730 ? 0 : 1;
    bool _1742 = uint(_1734) >= uint(_1179);
    bool _1744 = uint(_1720) > 1u;
    bool _1746 = !_1738;
    int _1748 = _1746 ? 0 : (-1);
    bool _1750 = !_1742;
    int _1752 = _1750 ? 0 : (-1);
    int _1754 = ~_1670;
    int _1756 = _1754 + _1748;
    int _1758 = _1756 + 1;
    int _1760 = ~_1724;
    int _1762 = _1760 + _1752;
    int _1764 = _1762 + 1;
    bool _1766 = _235 > 0.5;
    int _1768 = _1141 * _1758;
    int _1770 = _1768 + _1374;
    int _1772 = ~_1736;
    int _1774 = _1772 + 1;
    int _1776 = _1774 + 1;
    int _1778 = _1179 * _1764;
    int _1780 = _1778 + _1582;
    int _1782 = _1776;
    if (!_1744)
    {
        int _1784 = ~_1736;
        int _1786 = _1784 + 1;
        _1782 = _1786;
    }
    int _1788 = _1782;
    float _1790 = -_197;
    int _1792 = _1766 ? as_type<int>(_1790) : as_type<int>(_197);
    int _1794 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1796 = _1794 != 0;
    bool _1798 = !_1203;
    int _1800 = _1798 ? _1780 : (-1);
    bool _1802 = _1720 != 3;
    bool _1804 = !_1187;
    int _1806 = _1804 ? _1770 : (-1);
    int _1808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1810 = _1808 != 0;
    bool _1812 = !_1796;
    int _1814 = _1812 ? 0 : 1;
    int _1816 = _1714 >> 31;
    int _1818 = _1800 & 3;
    bool _1820 = _1818 != 0;
    int _1822 = _1800 >> 31;
    bool _1824 = !_1810;
    int _1826 = _1824 ? 0 : 1;
    int _1828 = _1816 & 3;
    bool _1830 = uint(_1706) >= uint(_1179);
    int _1832 = _1800 & 3;
    bool _1834 = _1832 != 0;
    bool _1836 = !_1820;
    float _1838 = _1836 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _1840 = _1822 & 3;
    bool _1842 = uint(_1818) > 1u;
    int _1844 = _1714 + _1828;
    bool _1846 = !_1830;
    int _1848 = _1846 ? 0 : (-1);
    int _1850 = _1834 ? 0 : 1;
    int _1852 = _1800 + _1840;
    int _1854 = ~_1740;
    int _1856 = _1854 + 1;
    int _1858 = _1856 + 1;
    bool _1860 = _1720 != 3;
    int _1862 = _1858;
    float _1864 = _1838;
    if (_1802)
    {
        int _1866 = ~_1740;
        int _1868 = _1866 + 1;
        _1862 = _1868;
    }
    int _1870 = _1862;
    bool _1872 = !_1722;
    int _1874 = _1872 ? 0 : 1;
    int _1876 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1878 = _1876 != 0;
    int _1880 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1882 = _1880 != 0;
    int _1884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1886 = _1884 != 0;
    int _1888 = _1844 >> 2;
    int _1890 = ~_1694;
    int _1892 = _1890 + _1848;
    int _1894 = _1892 + 1;
    int _1896 = _1852 >> 2;
    bool _1898 = !_1860;
    int _1900 = _1898 ? 0 : (-1);
    int _1902 = _1179 * _1894;
    int _1904 = _1902 + _1536;
    bool _1906 = uint(_1818) >= 2u;
    int _1908 = _1888 << 4;
    int _1910 = _1908 + 368;
    int _1912 = _1896 << 4;
    int _1914 = _1912 + 512;
    int _1916 = ~_1850;
    int _1918 = _1916 + 1;
    int _1920 = _1918 + 1;
    uint _1922 = uint(int(uint(_1910) >> uint(2)));
    uint _1924 = uint(int(uint(int(_1922)) >> uint(2)));
    int _1926 = int(_1922) & 3;
    float _1928 = (*spvDescriptorSet0.vp_c9)._m0[int(_1924)][_1926];
    int _1930 = int(_1922) + 1;
    uint _1932 = uint(int(uint(_1930) >> uint(2)));
    int _1934 = _1930 & 3;
    float _1936 = (*spvDescriptorSet0.vp_c9)._m0[int(_1932)][_1934];
    int _1938 = _1920;
    if (!_1842)
    {
        int _1940 = ~_1850;
        int _1942 = _1940 + 1;
        _1938 = _1942;
    }
    int _1944 = _1938;
    int _1946 = _1906 ? 0 : 1;
    bool _1948 = _1818 != 3;
    bool _1950 = _1818 != 3;
    int _1952 = _1910 + 8;
    uint _1954 = uint(int(uint(_1952) >> uint(2)));
    uint _1956 = uint(int(uint(int(_1954)) >> uint(2)));
    int _1958 = int(_1954) & 3;
    float _1960 = (*spvDescriptorSet0.vp_c9)._m0[int(_1956)][_1958];
    int _1962 = int(_1954) + 1;
    uint _1964 = uint(int(uint(_1962) >> uint(2)));
    int _1966 = _1962 & 3;
    float _1968 = (*spvDescriptorSet0.vp_c9)._m0[int(_1964)][_1966];
    int _1970 = ~_1946;
    int _1972 = _1970 + 1;
    int _1974 = _1972 + 1;
    bool _1976 = !_1203;
    int _1978 = _1976 ? _1904 : (-1);
    uint _1980 = uint(int(uint(_1914) >> uint(2)));
    uint _1982 = uint(int(uint(int(_1980)) >> uint(2)));
    int _1984 = int(_1980) & 3;
    float _1986 = (*spvDescriptorSet0.vp_c9)._m0[int(_1982)][_1984];
    int _1988 = int(_1980) + 1;
    uint _1990 = uint(int(uint(_1988) >> uint(2)));
    int _1992 = _1988 & 3;
    float _1994 = (*spvDescriptorSet0.vp_c9)._m0[int(_1990)][_1992];
    int _1996 = _1974;
    if (_1948)
    {
        int _1998 = ~_1946;
        int _2000 = _1998 + 1;
        _1996 = _2000;
    }
    int _2002 = _1996;
    float _2004 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2006 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2008 = _2006 != 0;
    float _2010 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2012 = _1914 + 8;
    uint _2014 = uint(int(uint(_2012) >> uint(2)));
    uint _2016 = uint(int(uint(int(_2014)) >> uint(2)));
    int _2018 = int(_2014) & 3;
    float _2020 = (*spvDescriptorSet0.vp_c9)._m0[int(_2016)][_2018];
    int _2022 = int(_2014) + 1;
    uint _2024 = uint(int(uint(_2022) >> uint(2)));
    int _2026 = _2022 & 3;
    float _2028 = (*spvDescriptorSet0.vp_c9)._m0[int(_2024)][_2026];
    float _2030 = _2004 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2032 = abs(_1944);
    float _2034 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2036 = abs(_1788);
    float _2038 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2040 = abs(_1874);
    float _2042 = _2034 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2044 = !_1950;
    int _2046 = _2044 ? 0 : (-1);
    float _2048 = _2038 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2050 = _229 > 0.5;
    bool _2052 = _231 > 0.5;
    out.m_82.x = _2042;
    out.m_82.y = _2030;
    out.m_82.z = _2048;
    out.m_82.w = _2010;
    int _2054 = ~_2036;
    int _2056 = _2054 + 1;
    int _2058 = _2056 + 1;
    float _2060 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2062 = -_193;
    int _2064 = _2050 ? as_type<int>(_2062) : as_type<int>(_193);
    float _2066 = _1165 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2068 = _233 > 0.5;
    float _2070 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2072 = _2058 * as_type<int>(_1936);
    int _2074 = abs(_1870);
    float _2076 = _2060 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2078 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2080 = int(_2078);
    float _2082 = _2070 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2084 = abs(as_type<int>(_1838));
    if (_1033)
    {
        float _2086 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2088 = _1119 + _2086;
        _1864 = _2088;
    }
    float _2090 = _1864;
    int _2092 = ~_2032;
    int _2094 = _2092 + 1;
    int _2096 = _2094 + 1;
    int _2098 = ~_2040;
    int _2100 = _2098 + 1;
    int _2102 = _2100 + 1;
    out.m_84.x = _2066;
    out.m_84.y = _2076;
    out.m_84.z = _2082;
    int _2104 = ~_2084;
    int _2106 = _2104 + 1;
    int _2108 = _2106 + 1;
    int _2110 = _2096 * as_type<int>(_1994);
    int _2112 = abs(_1900);
    int _2114 = _2102 * as_type<int>(_1928);
    int _2116 = _2114 + _2072;
    int _2118 = abs(_2046);
    int _2120 = _2108 * as_type<int>(_1986);
    int _2122 = _2120 + _2110;
    float _2124 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2126 = int(_2124);
    int _2128 = abs(_2002);
    float _2130 = _935 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2132 = ~_2074;
    int _2134 = _2132 + 1;
    int _2136 = _2134 + 1;
    float _2138 = _947 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2140 = _935 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2142 = float(uint(_2080));
    int _2144 = _2136 * as_type<int>(_1960);
    int _2146 = _2144 + _2116;
    int _2148 = ~_2112;
    int _2150 = _2148 + 1;
    int _2152 = _2150 + 1;
    float _2154 = _947 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2156 = ~_2128;
    int _2158 = _2156 + 1;
    int _2160 = _2158 + 1;
    if (_1033)
    {
        float _2162 = _2090 * _2090;
        _1055 = _2162;
    }
    float _2164 = _1055;
    float _2166 = 1.0 / _2142;
    int _2168 = _2152 * as_type<int>(_1968);
    int _2170 = _2168 + _2146;
    int _2172 = abs(_1814);
    int _2174 = _2160 * as_type<int>(_2020);
    int _2176 = _2174 + _2122;
    int _2178 = abs(_2080);
    int _2180 = ~_2172;
    int _2182 = _2180 + 1;
    int _2184 = _2182 + 1;
    int _2186 = ~_2118;
    int _2188 = _2186 + 1;
    int _2190 = _2188 + 1;
    float _2192 = float(uint(_2126));
    int _2194 = _2170 * _2184;
    int _2196 = _2190 * as_type<int>(_2028);
    int _2198 = _2196 + _2176;
    int _2200 = abs(_1826);
    float _2202 = _935 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2204 = _1806 * _2172;
    int _2206 = _2204 + _2194;
    float _2208 = 1.0 / _2192;
    float _2210 = float(uint(_2178));
    float _2212 = -_929;
    float _2214 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2130);
    int _2216 = abs(_2126);
    float _2218 = -_929;
    float _2220 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2202);
    int _2222 = as_type<int>(_2166) + (-2);
    float _2224 = _955 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2226 = float(uint(_2206));
    float _2228 = 1.0 / _2210;
    float _2230 = -_929;
    float _2232 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2140);
    int _2234 = ~_2200;
    int _2236 = _2234 + 1;
    int _2238 = _2236 + 1;
    float _2240 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2214);
    float _2242 = float(uint(_2216));
    float _2244 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2232);
    float _2246 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2220);
    float _2248 = _947 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2250 = as_type<float>(_2222) * _2226;
    int _2252 = _2198 * _2238;
    float _2254 = 1.0 / _2242;
    float _2256 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2248);
    int _2258 = abs(_2206);
    int _2260 = _1978 * _2200;
    int _2262 = _2260 + _2252;
    float _2264 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2138);
    float _2266 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2154);
    int _2268 = as_type<int>(_2208) + (-2);
    float _2270 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2256);
    float _2272 = trunc(_2250);
    float _2274 = precise::max(_2272, 0.0);
    uint _2276 = uint(_2274);
    float _2278 = float(uint(_2262));
    int _2280 = abs(_2262);
    float _2282 = as_type<float>(_2268) * _2278;
    float _2284 = float(uint(_2258));
    float _2286 = as_type<float>(_2198);
    if (_1033)
    {
        float _2288 = _1077 * 6.283185482025146484375;
        float _2290 = cos(_2288);
        _2286 = _2290;
    }
    float _2292 = _2286;
    int _2294 = ~_2080;
    int _2296 = _2294 + 1;
    float _2298 = _955 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2300 = as_type<int>(_2254) + (-2);
    float _2302 = float(uint(_2280));
    bool _2304 = !_1878;
    float _2306 = _2304 ? _197 : as_type<float>(_1792);
    float _2308 = trunc(_2282);
    float _2310 = precise::max(_2308, 0.0);
    uint _2312 = uint(_2310);
    int _2314 = as_type<int>(_2228) + (-2);
    float _2316 = _955 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2318 = !_2008;
    float _2320 = _2318 ? _193 : as_type<float>(_2064);
    bool _2322 = _2126 == 0;
    float _2324 = as_type<float>(_2314) * _2284;
    float _2326 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2298);
    int _2328 = _2296 * int(_2276);
    int _2330 = _2328 + _2206;
    float _2332 = as_type<float>(_2300) * _2302;
    float _2334 = trunc(_2324);
    float _2336 = precise::max(_2334, 0.0);
    uint _2338 = uint(_2336);
    float _2340 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2316);
    float _2342 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2224);
    float _2344 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2326);
    float _2346 = float(uint(_2330));
    float _2348 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2340);
    float _2350 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2342);
    int _2352 = ~_2178;
    int _2354 = _2352 + 1;
    float _2356 = trunc(_2332);
    float _2358 = precise::max(_2356, 0.0);
    uint _2360 = uint(_2358);
    int _2362 = ~_2126;
    int _2364 = _2362 + 1;
    float _2366 = as_type<float>(_2222) * _2346;
    float _2368 = as_type<float>(_2354);
    if (_1033)
    {
        float _2370 = _2292 + (-1.0);
        _2368 = _2370;
    }
    float _2372 = _2368;
    int _2374 = ~_2216;
    int _2376 = _2374 + 1;
    int _2378 = _2364 * int(_2312);
    int _2380 = _2378 + _2262;
    int _2382 = _2354 * int(_2338);
    int _2384 = _2382 + _2258;
    float _2386 = _2372;
    if (_1033)
    {
        float _2388 = _2372 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2386 = _2388;
    }
    float _2390 = _2386;
    float _2392 = trunc(_2366);
    float _2394 = precise::max(_2392, 0.0);
    uint _2396 = uint(_2394);
    float _2398 = float(uint(_2380));
    float _2400 = float(uint(_2384));
    if (_1033)
    {
        float _2402 = fma(_1097, _2292, _2390);
        _1099 = _2402;
    }
    float _2404 = _1099;
    float _2406 = -_197;
    int _2408 = _2052 ? as_type<int>(_2406) : as_type<int>(_197);
    int _2410 = _2376 * int(_2360);
    int _2412 = _2410 + _2280;
    float _2414 = as_type<float>(_2314) * _2400;
    bool _2416 = !_1882;
    float _2418 = _2416 ? _197 : as_type<float>(_2408);
    float _2420 = _197 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2422 = float(uint(_2412));
    float _2424 = as_type<float>(_2268) * _2398;
    float _2426 = -_193;
    int _2428 = _2068 ? as_type<int>(_2426) : as_type<int>(_193);
    float _2430 = trunc(_2414);
    float _2432 = precise::max(_2430, 0.0);
    uint _2434 = uint(_2432);
    float _2436 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2264);
    float _2438 = as_type<float>(_2300) * _2422;
    bool _2440 = !_1886;
    float _2442 = _2440 ? _193 : as_type<float>(_2428);
    float _2444 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2446 = _2420 * _2244;
    float _2448 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2266);
    float _2450 = _2420 * _2246;
    float _2452 = trunc(_2424);
    float _2454 = precise::max(_2452, 0.0);
    uint _2456 = uint(_2454);
    float _2458 = fma(_2444, _2270, _2446);
    float _2460 = _2446;
    if (_1033)
    {
        float _2462 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2464 = _1123 + _2462;
        _2460 = _2464;
    }
    float _2466 = _2460;
    float _2468 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2470 = _2404 + _2468;
    out.m_86.x = _2270;
    out.m_86.y = _2436;
    out.m_86.z = _2448;
    if (_1033)
    {
        float _2472 = _2466 * _2466;
        _1057 = _2472;
    }
    float _2474 = _1057;
    int _2476 = int(_2276) + int(_2396);
    float _2478 = trunc(_2438);
    float _2480 = precise::max(_2478, 0.0);
    uint _2482 = uint(_2480);
    float _2484 = _2420 * _2240;
    int _2486 = ~_2080;
    int _2488 = _2486 + 1;
    float _2490 = fma(_2470, _2470, _2164);
    bool _2492 = _2126 == 0;
    float _2494 = fma(_2444, _2436, _2484);
    float _2496 = fma(_2444, _2448, _2450);
    int _2498 = ~_2178;
    int _2500 = _2498 + 1;
    int _2502 = int(_2312) + int(_2456);
    int _2504 = ~_2126;
    int _2506 = _2504 + 1;
    int _2508 = int(_2338) + int(_2434);
    int _2510 = int(_2360) + int(_2482);
    int _2512 = _2488 * _2476;
    int _2514 = _2512 + _2206;
    int _2516 = ~_2216;
    int _2518 = _2516 + 1;
    int _2520 = _2500 * _2508;
    int _2522 = _2520 + _2258;
    float _2524 = _2490 + _2474;
    int _2526 = _2506 * _2502;
    int _2528 = _2526 + _2262;
    bool _2530 = uint(_2514) >= uint(_2080);
    int _2532 = _2518 * _2510;
    int _2534 = _2532 + _2280;
    float _2536 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2538 = uint(_2522) >= uint(_2178);
    bool _2540 = uint(_2528) >= uint(_2126);
    bool _2542 = !_2530;
    int _2544 = _2542 ? 0 : (-1);
    bool _2546 = !_2540;
    int _2548 = _2546 ? 0 : (-1);
    float _2550 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2552 = ~_2476;
    int _2554 = _2552 + _2544;
    int _2556 = _2554 + 1;
    bool _2558 = uint(_2534) >= uint(_2216);
    int _2560 = ~_2502;
    int _2562 = _2560 + _2548;
    int _2564 = _2562 + 1;
    int _2566 = _2080 * _2556;
    int _2568 = _2566 + _2206;
    int _2570 = _2206 ^ _2080;
    float _2572 = sqrt(_2524);
    bool _2574 = !_2558;
    int _2576 = _2574 ? 0 : (-1);
    int _2578 = _2126 * _2564;
    int _2580 = _2578 + _2262;
    bool _2582 = !_2538;
    int _2584 = _2582 ? 0 : (-1);
    uint _2586 = uint(int(uint(_2570) >> uint(31)));
    bool _2588 = _2080 == 0;
    float _2590 = _2550 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2592 = _2080 == 0;
    float _2594 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2596 = _2262 ^ _2126;
    int _2598 = ~_2576;
    int _2600 = _2510 + _2598;
    int _2602 = _2600 + 1;
    int _2604 = ~_2584;
    int _2606 = _2508 + _2604;
    int _2608 = _2606 + 1;
    float _2610 = fma(_2420, _2420, 1.0);
    int _2612 = ~int(_2586);
    int _2614 = _2612 + 1;
    float _2616 = _2536 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2618 = !_2588;
    int _2620 = _2618 ? _2568 : (-1);
    float _2622 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _2624 = uint(int(uint(_2596) >> uint(31)));
    int _2626 = _2608 ^ _2614;
    float _2628 = float(_2620);
    int _2630 = ~int(_2624);
    int _2632 = _2630 + 1;
    int _2634 = ~_2614;
    int _2636 = _2634 + _2626;
    int _2638 = _2636 + 1;
    float _2640 = fma(_2616, _2628, _603);
    bool _2642 = !_2322;
    int _2644 = _2642 ? _2580 : (-1);
    float _2646 = rsqrt(_2610);
    int _2648 = _2602 ^ _2632;
    float _2650 = float(_2644);
    float _2652 = _2594 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2654 = ~_2632;
    int _2656 = _2654 + _2648;
    int _2658 = _2656 + 1;
    float _2660 = _2320 + 0.5;
    bool _2662 = !_2592;
    int _2664 = _2662 ? _2638 : (-1);
    float _2666 = fma(_2652, _2650, _689);
    bool _2668 = !_2492;
    int _2670 = _2668 ? _2658 : (-1);
    float _2672 = fma(_2616, _2660, _2640);
    float _2674 = float(_2664);
    float _2676 = _2442 + 0.5;
    float _2678 = float(_2670);
    float _2680 = _2622 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2682 = -_1153;
    float _2684 = fma(_2320, _2682, _2672);
    float _2686 = -_675;
    float _2688 = fma(_2590, _2674, _2686);
    float _2690 = _2418 + (-0.5);
    float _2692 = fma(_2652, _2676, _2666);
    float _2694 = _2420 * _2646;
    float _2696 = -_691;
    float _2698 = fma(_2680, _2678, _2696);
    float _2700 = _2306 + (-0.5);
    float _2702 = -_2590;
    float _2704 = fma(_2702, _2690, _2688);
    float _2706 = -_2344;
    float _2708 = _2694 * _2706;
    float _2710 = -_2348;
    float _2712 = _2694 * _2710;
    float _2714 = -_2350;
    float _2716 = _2694 * _2714;
    float _2718 = -_2680;
    float _2720 = fma(_2718, _2700, _2698);
    float _2722 = fma(_2646, _2240, _2708);
    float _2724 = fma(_2646, _2244, _2712);
    float _2726 = -_1149;
    float _2728 = fma(_2442, _2726, _2692);
    float _2730 = fma(_2646, _2246, _2716);
    float _2732 = _2348 + _2458;
    float _2734 = fma(_2418, _1163, _2704);
    float _2736 = fma(_2306, _1173, _2720);
    float _2738 = _2344 + _2494;
    float _2740 = _2350 + _2496;
    out.m_88.x = _2724;
    out.m_88.y = _2722;
    out.m_88.z = _2730;
    bool _2742 = _2572 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2744 = isnan(_2572);
    bool _2746 = _2742 || _2744;
    bool _2748 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2750 = _2746 || _2748;
    out.m_90.x = _2684;
    out.m_90.y = _2734;
    out.m_90.z = _2728;
    out.m_90.w = _2736;
    out.m_92.x = _1133;
    out.m_92.y = _1135;
    out.m_92.z = _1137;
    out.m_94.x = _2732;
    out.m_94.y = _2738;
    out.m_94.z = _2740;
    float _2752 = _2610;
    float _2754 = as_type<float>(_2514);
    float _2756 = as_type<float>(_2638);
    if (!_2750)
    {
        _1211 = 1.0;
    }
    float _2758 = _1211;
    bool _2760 = !_2750;
    float _2762 = _2758;
    if (!_2760)
    {
        bool _2764 = _2572 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2766 = isnan(_2572);
        bool _2768 = _2764 || _2766;
        bool _2770 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2772 = _2768 || _2770;
        if (!_2772)
        {
            float _2774 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2776 = _2572 + _2774;
            float _2778 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2780 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2778;
            float _2782 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2784 = _2782 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2786 = 1.0 / _2780;
            float _2788 = _2776 * _2786;
            float _2790 = fma(_2788, _2784, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2762 = _2790;
            _2792 = true;
        }
        else
        {
            bool _2794 = _2572 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2796 = isnan(_2572);
            bool _2798 = _2794 || _2796;
            bool _2800 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2802 = _2798 || _2800;
            if (!_2802)
            {
                float _2804 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2806 = _2572 + _2804;
                float _2808 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2810 = _2808 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2812 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2814 = _2812 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2816 = 1.0 / _2810;
                float _2818 = _2806 * _2816;
                float _2820 = fma(_2818, _2814, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2762 = _2820;
                _2792 = true;
            }
            else
            {
                _2762 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2792 = false;
    float _2822 = _2762;
    float _2824 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2826 = _2404 + _2824;
    float _2828 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2830 = _1119 + _2828;
    float _2832 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2834 = _1123 + _2832;
    float _2836 = fma(_2826, _2822, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2838 = fma(_2830, _2822, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2840 = fma(_2834, _2822, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2842 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2844 = _2836 + _2842;
    float _2846 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2848 = _2838 + _2846;
    float _2850 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2852 = _2840 + _2850;
    float _2854 = _2844 * _2844;
    float _2856 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2858 = fma(_2848, _2848, _2854);
    float _2860 = _1081 + _2856;
    float _2862 = fma(_2852, _2852, _2858);
    float _2864 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2866 = rsqrt(_2862);
    float _2868 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2864);
    float _2870 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2868);
    float _2872 = sqrt(_2862);
    float _2874 = _2870 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2876 = _2866 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2878 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2880 = _2848 * _2876;
    float _2882 = _2852 * _2876;
    float _2884 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2878);
    float _2886 = _2880 * _2880;
    float _2888 = _2882 * _2882;
    float _2890 = 1.0 / _2874;
    float _2892 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2884);
    float _2894 = _2886 + _2888;
    float _2896 = _2892 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2898 = sqrt(_2894);
    float _2900 = _2896 + _2874;
    float _2902 = _2860 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2904 = _2900 * _2890;
    float _2906 = _2904 * 0.5;
    float _2908 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2910 = fma(_2906, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2908);
    float _2912 = fma(_991, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2914 = _2860 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    bool _2916 = _2898 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2918 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2920 = _2898 + _2918;
    float _2922 = 1.0 / _2910;
    float _2924 = fma(_991, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2914);
    float _2926 = fma(_993, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2924);
    float _2928 = floor(_2912);
    float _2930 = _2926 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2932 = _1135;
    int _2934 = 2;
    float _2936 = _2876;
    float _2938 = _2880;
    float _2940 = _2886;
    float _2942 = _2826;
    int _2944 = as_type<int>(_2888);
    if (_2916)
    {
        float _2946 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2932 = _2946;
    }
    float _2948 = _2932;
    float _2950 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2952 = _2922 * _2950;
    float _2954 = fma(_991, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2902);
    bool _2956 = _2952 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2958 = fma(_993, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2954);
    bool _2960 = _2952 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2962 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2964 = trunc(_2930);
    int _2966 = int(_2964);
    float _2968 = _2958 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2970 = -_2928;
    float _2972 = _2912 + _2970;
    float _2974 = precise::max(0.0, _2962);
    float _2976 = _2958;
    int _2978 = as_type<int>(_2968);
    if (_2916)
    {
        float _2980 = _2920 * _2948;
        _2976 = _2980;
    }
    float _2982 = _2976;
    float _2984 = trunc(_2968);
    int _2986 = int(_2984);
    if (!_2956)
    {
        _2934 = 1;
    }
    int _2988 = _2934;
    int _2990 = _2988;
    if (_2916)
    {
        float _2992 = _2982 * 0.15915493667125701904296875;
        _1085 = _2992;
    }
    float _2994 = _1085;
    bool _2996 = !_2956;
    int _2998 = _2996 ? 0 : 1;
    float _3000 = -_2876;
    float _3002 = -_2974;
    float _3004 = fma(_2844, _3000, _3002);
    if (!_2960)
    {
        _2990 = _2998;
    }
    int _3006 = _2990;
    float _3008 = _2926;
    float _3010 = as_type<float>(_3006);
    if (_2916)
    {
        float _3012 = _2994 * 6.283185482025146484375;
        float _3014 = sin(_3012);
        _3008 = _3014;
    }
    float _3016 = _3008;
    if (_2916)
    {
        float _3018 = _3004 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2936 = _3018;
    }
    float _3020 = _2936;
    int _3022 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _3024 = _2966 + _3022;
    int _3026 = _3024 + 1;
    int _3028 = _3006 << 6;
    int _3030 = _3028 + 48;
    uint _3032 = uint(int(uint(_3030) >> uint(2)));
    uint _3034 = uint(int(uint(int(_3032)) >> uint(2)));
    int _3036 = int(_3032) & 3;
    float _3038 = (*spvDescriptorSet0.vp_c15)._m0[int(_3034)][_3036];
    int _3040 = int(_3032) + 1;
    uint _3042 = uint(int(uint(_3040) >> uint(2)));
    int _3044 = _3040 & 3;
    float _3046 = (*spvDescriptorSet0.vp_c15)._m0[int(_3042)][_3044];
    float _3048 = _2894;
    if (_2916)
    {
        float _3050 = rsqrt(_2894);
        _3048 = _3050;
    }
    float _3052 = _3048;
    int _3054 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3056 = _2986 + _3054;
    int _3058 = _3056 + 1;
    float _3060 = fma(_993, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    bool _3062 = _3026 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _3064 = _3026 | _3058;
    int _3066 = _3028 + 96;
    uint _3068 = uint(int(uint(_3066) >> uint(2)));
    uint _3070 = uint(int(uint(int(_3068)) >> uint(2)));
    int _3072 = int(_3068) & 3;
    float _3074 = (*spvDescriptorSet0.vp_c15)._m0[int(_3070)][_3072];
    int _3076 = int(_3068) + 1;
    uint _3078 = uint(int(uint(_3076) >> uint(2)));
    int _3080 = _3076 & 3;
    float _3082 = (*spvDescriptorSet0.vp_c15)._m0[int(_3078)][_3080];
    if (_2916)
    {
        float _3084 = fma(_3016, _3020, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2752 = _3084;
    }
    float _3086 = _2752;
    float _3088 = _2994;
    float _3090 = _3086;
    if (_2916)
    {
        float _3092 = _2994 * 6.283185482025146484375;
        float _3094 = cos(_3092);
        _3088 = _3094;
    }
    float _3096 = _3088;
    bool _3098 = _3064 < 0;
    bool _3100 = _3098 || _3062;
    float _3102 = _2836 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _3104 = _3058 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3106 = _3104 || _3100;
    int _3108 = _3028 + 56;
    uint _3110 = uint(int(uint(_3108) >> uint(2)));
    uint _3112 = uint(int(uint(int(_3110)) >> uint(2)));
    int _3114 = int(_3110) & 3;
    float _3116 = (*spvDescriptorSet0.vp_c15)._m0[int(_3112)][_3114];
    int _3118 = int(_3110) + 1;
    uint _3120 = uint(int(uint(_3118) >> uint(2)));
    int _3122 = _3118 & 3;
    float _3124 = (*spvDescriptorSet0.vp_c15)._m0[int(_3120)][_3122];
    float _3126 = _3052;
    if (_2916)
    {
        float _3128 = _3052 * _3086;
        _2754 = _3128;
    }
    float _3130 = _2754;
    float _3132 = fma(_2838, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3102);
    if (!_2916)
    {
        _3090 = _3004;
    }
    float _3134 = _3090;
    float _3136 = floor(_3060);
    float _3138 = _3134;
    if (_2916)
    {
        float _3140 = _2880 * _3130;
        _2938 = _3140;
    }
    float _3142 = _2938;
    float _3144 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3132);
    int _3146 = _3028 + 104;
    uint _3148 = uint(int(uint(_3146) >> uint(2)));
    uint _3150 = uint(int(uint(int(_3148)) >> uint(2)));
    int _3152 = int(_3148) & 3;
    float _3154 = (*spvDescriptorSet0.vp_c15)._m0[int(_3150)][_3152];
    int _3156 = int(_3148) + 1;
    uint _3158 = uint(int(uint(_3156) >> uint(2)));
    int _3160 = _3156 & 3;
    float _3162 = (*spvDescriptorSet0.vp_c15)._m0[int(_3158)][_3160];
    if (_2916)
    {
        float _3164 = _3142 * _3142;
        _2940 = _3164;
    }
    float _3166 = _2940;
    float _3168 = _3096;
    if (_2916)
    {
        float _3170 = _3096 + (-1.0);
        _3126 = _3170;
    }
    float _3172 = _3126;
    float _3174 = _3172;
    if (!_3106)
    {
        float _3176 = floor(_2968);
        _2756 = _3176;
    }
    float _3178 = _2756;
    if (_2916)
    {
        float _3180 = _3172 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2942 = _3180;
    }
    float _3182 = _2942;
    if (!_2916)
    {
        _3174 = _2882;
    }
    float _3184 = _3174;
    int _3186 = _3028 + 64;
    uint _3188 = uint(int(uint(_3186) >> uint(2)));
    uint _3190 = uint(int(uint(int(_3188)) >> uint(2)));
    int _3192 = int(_3188) & 3;
    float _3194 = (*spvDescriptorSet0.vp_c15)._m0[int(_3190)][_3192];
    int _3196 = int(_3188) + 1;
    uint _3198 = uint(int(uint(_3196) >> uint(2)));
    int _3200 = _3196 & 3;
    float _3202 = (*spvDescriptorSet0.vp_c15)._m0[int(_3198)][_3200];
    float _3204 = _3184;
    if (_2916)
    {
        float _3206 = _2882 * _3130;
        _3204 = _3206;
    }
    float _3208 = _3204;
    if (_2916)
    {
        float _3210 = fma(_3004, _3096, _3182);
        _3138 = _3210;
    }
    float _3212 = _3138;
    if (!_2916)
    {
        _3168 = _2888;
    }
    float _3214 = _3168;
    float _3216 = _3214;
    if (!_3106)
    {
        int _3218 = _3058 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3220 = _3218 + _3026;
        _2944 = _3220;
    }
    int _3222 = _2944;
    if (_2916)
    {
        float _3224 = _3208 * _3208;
        _3216 = _3224;
    }
    float _3226 = _3216;
    float _3228 = fma(_3212, _3212, _3166);
    float _3230 = _3144 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _3232 = _3028 + 80;
    uint _3234 = uint(int(uint(_3232) >> uint(2)));
    uint _3236 = uint(int(uint(int(_3234)) >> uint(2)));
    int _3238 = int(_3234) & 3;
    float _3240 = (*spvDescriptorSet0.vp_c15)._m0[int(_3236)][_3238];
    int _3242 = int(_3234) + 1;
    uint _3244 = uint(int(uint(_3242) >> uint(2)));
    int _3246 = _3242 & 3;
    float _3248 = (*spvDescriptorSet0.vp_c15)._m0[int(_3244)][_3246];
    float _3250 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3252 = _3228 + _3226;
    float _3254 = _3230 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3256 = -_3136;
    float _3258 = _3060 + _3256;
    int _3260 = _3028 + 72;
    uint _3262 = uint(int(uint(_3260) >> uint(2)));
    uint _3264 = uint(int(uint(int(_3262)) >> uint(2)));
    int _3266 = int(_3262) & 3;
    float _3268 = (*spvDescriptorSet0.vp_c15)._m0[int(_3264)][_3266];
    int _3270 = int(_3262) + 1;
    uint _3272 = uint(int(uint(_3270) >> uint(2)));
    int _3274 = _3270 & 3;
    float _3276 = (*spvDescriptorSet0.vp_c15)._m0[int(_3272)][_3274];
    float _3278 = _2860 * _3046;
    float _3280 = -_3254;
    float _3282 = fma(_3280, _3250, 1.0);
    float _3284 = rsqrt(_3252);
    float _3286 = fma(_991, _3038, _3278);
    int _3288 = _3028 + 88;
    uint _3290 = uint(int(uint(_3288) >> uint(2)));
    uint _3292 = uint(int(uint(int(_3290)) >> uint(2)));
    int _3294 = int(_3290) & 3;
    float _3296 = (*spvDescriptorSet0.vp_c15)._m0[int(_3292)][_3294];
    int _3298 = int(_3290) + 1;
    uint _3300 = uint(int(uint(_3298) >> uint(2)));
    int _3302 = _3298 & 3;
    float _3304 = (*spvDescriptorSet0.vp_c15)._m0[int(_3300)][_3302];
    float _3306 = _2860 * _3082;
    float _3308 = fma(_991, _3074, _3306);
    float _3310 = fma(_993, _3116, _3286);
    float _3312 = _3284 * _3142;
    float _3314 = _3284 * _3212;
    float _3316 = _3284 * _3208;
    float _3318 = _3312 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3320 = fma(_993, _3154, _3308);
    float _3322 = _3310 + _3124;
    float _3324 = _2836 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3326 = -_3318;
    float _3328 = fma(_3314, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3326);
    float _3330 = _3320 + _3162;
    float _3332 = _2836 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3334 = fma(_2838, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3324);
    float _3336 = -_3316;
    float _3338 = fma(_3336, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3328);
    float _3340 = _2860 * _3202;
    float _3342 = _3202;
    int _3344 = as_type<int>((*spvDescriptorSet0.vp_c15)._m0[23].w);
    int _3346 = as_type<int>(_3074);
    if (!_3106)
    {
        float _3348 = -_3178;
        float _3350 = _2968 + _3348;
        _3342 = _3350;
    }
    float _3352 = _3342;
    float _3354 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3356 = fma(_2872, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3354);
    float _3358 = precise::clamp(_3356, 0.0, 1.0);
    float _3360 = 1.0 / _3330;
    float _3362 = fma(_991, _3194, _3340);
    float _3364 = fma(_2838, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3332);
    float _3366 = -_3358;
    float _3368 = _3366 + 1.0;
    if (!_3106)
    {
        int _3370 = _3222 << 2;
        _2978 = _3370;
    }
    int _3372 = _2978;
    float _3374 = _2860 * _3248;
    float _3376 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3364);
    int _3378 = _3372;
    if (!_3106)
    {
        uint _3380 = uint(int(uint(_3222) >> uint(2)));
        _3344 = int(_3380);
    }
    int _3382 = _3344;
    float _3384 = abs(_3368);
    float _3386 = log2(_3384);
    float _3388 = fma(_991, _3240, _3374);
    if (!_3106)
    {
        int _3390 = 12 & _3372;
        _3378 = _3390;
    }
    int _3392 = _3378;
    float _3394 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3334);
    float _3396 = fma(_993, _3268, _3362);
    float _3398 = _3394;
    if (!_3106)
    {
        int _3400 = _3382 << 4;
        int _3402 = _3400 + _3392;
        _3346 = _3402;
    }
    int _3404 = _3346;
    float _3406 = _3322 * _3360;
    float _3408 = _3396 + _3276;
    float _3410 = _2836 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3412 = as_type<float>(_3382);
    if (!_3106)
    {
        int _3414 = _3404 + 400;
        uint _3416 = uint(int(uint(_3414) >> uint(2)));
        uint _3418 = uint(int(uint(int(_3416)) >> uint(2)));
        int _3420 = int(_3416) & 3;
        float _3422 = (*spvDescriptorSet0.vp_c15)._m0[int(_3418)][_3420];
        _3412 = _3422;
    }
    float _3424 = _3412;
    bool _3426 = _3406 >= 0.0;
    float _3428 = fma(_2838, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3410);
    float _3430 = fma(_993, _3296, _3388);
    float _3432 = _3386 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3434 = _3408 * _3360;
    float _3436 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3428);
    float _3438 = _3376 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _3440 = _3406 <= 1.0;
    bool _3442 = _3440 && _3426;
    float _3444 = exp2(_3432);
    float _3446 = _3436 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3448 = _3438 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _3450 = _3434 >= 0.0;
    bool _3452 = _3450 && _3442;
    float _3454 = fma(_3338, -0.5, 0.5);
    float _3456 = fma(_3338, 0.5, 0.5);
    float _3458 = fma(_3446, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3448);
    bool _3460 = _3434 <= 1.0;
    bool _3462 = _3460 && _3452;
    float _3464 = log2(_3282);
    float _3466 = fma(_3456, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3468 = fma(_3230, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3458);
    float _3470 = _3430 + _3304;
    float _3472 = _3314 + 1.0;
    float _3474 = fma(_3456, _3466, -0.212114393711090087890625);
    float _3476 = _3438 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3478 = _3438 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3480 = sqrt(_3454);
    float _3482 = _3394 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3484 = -_3314;
    float _3486 = fma(_3444, _3472, _3484);
    float _3488 = fma(_3456, _3474, 1.570728778839111328125);
    float _3490 = fma(_3446, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3476);
    if (_3462)
    {
        float _3492 = float(_3006);
        _3010 = _3492;
    }
    float _3494 = _3010;
    float _3496 = fma(_3446, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3478);
    float _3498 = _3470 * _3360;
    float _3500 = _3432;
    if (!_3106)
    {
        float _3502 = floor(_2930);
        _3500 = _3502;
    }
    float _3504 = _3500;
    float _3506 = fma(_3482, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3468);
    float _3508 = fma(_3230, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3490);
    float _3510 = fma(_3230, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3496);
    float _3512 = _3464 * 0.693147182464599609375;
    float _3514 = fma(_3482, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3508);
    float _3516 = fma(_3482, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3510);
    float _3518 = 1.0 / _3506;
    float _3520 = _3480 * 0.636619746685028076171875;
    float2 _9380 = float2(_2972, _3258);
    float _3522 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9380, float2(0.0), isnan(_9380)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9380, float2(0.0), isnan(_9380)), level(0.0)).x;
    float _3524 = _3512 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3526 = fma(_3486, 0.5, 0.5);
    float _3528 = -_3488;
    float _3530 = fma(_3520, _3528, 1.0);
    float _3532 = _3490;
    float _3534 = _3516;
    if (_3462)
    {
        float _3536 = rint(_3494);
        float _3538 = precise::max(_3536, 0.0);
        uint _3540 = uint(_3538);
        uint _3542 = clamp(_3540, 0u, 65535u);
        _3532 = as_type<float>(_3542);
    }
    float _3544 = _3532;
    if (!_3106)
    {
        float _3546 = -_3504;
        float _3548 = _2930 + _3546;
        _3398 = _3548;
    }
    float _3550 = _3398;
    float _3552 = _3516 * _3518;
    float _3554 = _3514 * _3518;
    float _3556 = _3360;
    if (!_3106)
    {
        float _3558 = rint(_3424);
        float _3560 = precise::max(_3558, 0.0);
        uint _3562 = uint(_3560);
        uint _3564 = clamp(_3562, 0u, 65535u);
        _3556 = as_type<float>(_3564);
    }
    float _3566 = _3556;
    float _3568 = fma(_3552, 0.5, 0.5);
    float _3570 = fma(_3554, -0.5, 0.5);
    float _3572 = _3544;
    if (_3462)
    {
        float3 _9460 = float3(_3406, _3434, float(as_type<int>(_3544)));
        float3 _9464 = select(_9460, float3(0.0), isnan(_9460));
        float _3574 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9464.xy, uint(rint(_9464.z)), _3498, level(0.0));
        _3572 = _3574;
    }
    float _3576 = _3572;
    float3 _9474 = float3(_3568, _3570, _3524);
    float _3578 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9474, float3(0.0), isnan(_9474)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9474, float3(0.0), isnan(_9474)), level(0.0)).x;
    float3 _9483 = float3(_3568, _3570, _3524);
    float4 _3581 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9483, float3(0.0), isnan(_9483)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9483, float3(0.0), isnan(_9483)), level(0.0)).xyzw;
    float _3583 = _3581.x;
    float _3585 = _3581.y;
    float _3587 = _3581.z;
    float _3589 = _3581.w;
    float2 _9499 = float2(_3530, _3526);
    float3 _3591 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9499, float2(0.0), isnan(_9499)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9499, float2(0.0), isnan(_9499)), level(0.0)).xyz;
    float _3593 = _3591.x;
    float _3595 = _3591.y;
    float _3597 = _3591.z;
    float _3599 = _3566;
    if (!_3106)
    {
        float3 _9520 = float3(_3550, _3352, float(as_type<int>(_3566)));
        float3 _9522 = select(_9520, float3(0.0), isnan(_9520));
        float _3601 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9522.xy, uint(rint(_9522.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9522.xy, uint(rint(_9522.z)), level(0.0)).x;
        _3599 = _3601;
    }
    float _3603 = _3599;
    float _3605 = abs(_2952);
    float _3607 = log2(_3605);
    bool _3609 = _2952 <= 8000.0;
    bool _3611 = isnan(_2952);
    bool _3613 = _3609 || _3611;
    bool _3615 = isnan(8000.0);
    bool _3617 = _3613 || _3615;
    float _3619 = float(_3617);
    float _3621 = _3607 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3623 = _3438 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3625 = fma(_3446, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3623);
    float _3627 = exp2(_3621);
    float _3629 = _3386 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3631 = fma(_3230, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3625);
    float _3633 = fma(_3482, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3631);
    float _3635 = exp2(_3629);
    out.gl_Position.x = _3516;
    out.gl_Position.y = _3514;
    out.gl_Position.z = _3633;
    out.gl_Position.w = _3506;
    float _3637 = fma(_3627, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3639 = precise::clamp(_3637, 0.0, 1.0);
    float _3641 = fma(_3639, -2.0, 3.0);
    float _3643 = _3639 * _3639;
    float _3645 = _3643 * _3641;
    float _3647 = -_3645;
    float _3649 = _3647 + 1.0;
    float _3651 = fma(_3649, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3645);
    float _3653 = _3619 * _3651;
    float _3655 = _3619;
    float _3657 = _3633;
    if (!_3462)
    {
        _3655 = 1.0;
    }
    float _3659 = _3655;
    float _3661 = _3653 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3663 = -_3635;
    float _3665 = _3663 + 1.0;
    float _3667 = -_3522;
    float _3669 = _3667 + 1.0;
    float _3671 = _3669 * _3661;
    float _3673 = precise::clamp(_3671, 0.0, 1.0);
    float _3675 = _3659;
    float _3677 = _3665;
    float _3679 = _3661;
    if (_3462)
    {
        bool _3681 = _3576 >= _3498;
        bool _3683 = isnan(_3576);
        bool _3685 = _3681 || _3683;
        bool _3687 = isnan(_3498);
        bool _3689 = _3685 || _3687;
        float _3691 = float(_3689);
        _3675 = _3691;
    }
    float _3693 = _3675;
    float _3695 = _3665 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_3106)
    {
        _3677 = 1.0;
    }
    float _3697 = _3677;
    float _3699 = _3697;
    if (!_3106)
    {
        int _3701 = _3222 << 4;
        int _3703 = _3701 + 2048;
        uint _3705 = uint(int(uint(_3703) >> uint(2)));
        uint _3707 = uint(int(uint(int(_3705)) >> uint(2)));
        int _3709 = int(_3705) & 3;
        float _3711 = (*spvDescriptorSet0.vp_c15)._m0[int(_3707)][_3709];
        int _3713 = int(_3705) + 1;
        uint _3715 = uint(int(uint(_3713) >> uint(2)));
        int _3717 = _3713 & 3;
        float _3719 = (*spvDescriptorSet0.vp_c15)._m0[int(_3715)][_3717];
        int _3721 = _3703 + 8;
        uint _3723 = uint(int(uint(_3721) >> uint(2)));
        uint _3725 = uint(int(uint(int(_3723)) >> uint(2)));
        int _3727 = int(_3723) & 3;
        float _3729 = (*spvDescriptorSet0.vp_c15)._m0[int(_3725)][_3727];
        int _3731 = int(_3723) + 1;
        uint _3733 = uint(int(uint(_3731) >> uint(2)));
        int _3735 = _3731 & 3;
        float _3737 = (*spvDescriptorSet0.vp_c15)._m0[int(_3733)][_3735];
        float _3739 = _2860 * _3719;
        float _3741 = fma(_991, _3711, _3739);
        float _3743 = fma(_993, _3729, _3741);
        float _3745 = _3743 + _3737;
        float _3747 = precise::clamp(_3745, 0.0, 1.0);
        float _3749 = -_3747;
        float _3751 = _3749 + _3603;
        float _3753 = fma(_3751, 500.0, 1.5);
        float _3755 = exp2(_3753);
        float _3757 = 0.0 + _3755;
        float _3759 = precise::clamp(_3757, 0.0, 1.0);
        _3699 = _3759;
        _3534 = _3729;
    }
    float _3761 = _3699;
    float _3763 = _3534;
    float _3765 = _3693 * _3761;
    float _3767 = _3695 * _3578;
    float _3769 = -_3673;
    float _3771 = fma(_3769, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3773 = -_3695;
    float _3775 = _3773 + 1.0;
    out.m_96.x = _2838;
    out.m_96.y = _2836;
    out.m_96.z = _2840;
    float _3777 = _3589 * _3767;
    float _3779 = -_3765;
    float _3781 = fma(_3779, _3771, 1.0);
    float _3783 = precise::clamp(_3781, 0.0, 1.0);
    float _3785 = _3597 * _3767;
    float _3787 = _3589 * _3775;
    float _3789 = fma(_3593, _3777, _3583);
    float _3791 = fma(_3595, _3777, _3585);
    float _3793 = _3783 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3795 = fma(_3589, _3785, _3587);
    bool _3797 = _2872 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3799 = isnan(_2872);
    bool _3801 = _3797 || _3799;
    bool _3803 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3805 = _3801 || _3803;
    out.m_98.x = _3793;
    out.m_100.x = _3789;
    out.m_100.y = _3791;
    out.m_100.z = _3795;
    out.m_100.w = _3787;
    float _3807 = _3763;
    float _3809 = _3777;
    float _3811 = _3771;
    float _3813 = _3783;
    if (!_3805)
    {
        _3657 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3815 = _3657;
    float _3817 = _3815;
    float _3819 = _3815;
    if (!_3805)
    {
        _3807 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3821 = _3807;
    float _3823 = _3821;
    float _3825 = _3821;
    if (!_3805)
    {
        _3679 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3827 = _3679;
    float _3829 = _3827;
    float _3831 = _3827;
    if (!_3805)
    {
        _3809 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3833 = _3809;
    float _3835 = _3833;
    float _3837 = _3833;
    if (!_3805)
    {
        _3811 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3839 = _3811;
    float _3841 = _3839;
    float _3843 = _3839;
    if (!_3805)
    {
        _3813 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3845 = _3813;
    bool _3847 = !_3805;
    float _3849 = _3845;
    float _3851 = _3845;
    if (!_3847)
    {
        bool _3853 = _2872 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3855 = isnan(_2872);
        bool _3857 = _3853 || _3855;
        bool _3859 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3861 = _3857 || _3859;
        if (!_3861)
        {
            float _3863 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3865 = _2872 + _3863;
            float _3867 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3869 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3867;
            float _3871 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3873 = _3871 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3875 = 1.0 / _3869;
            float _3877 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3879 = _3877 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3881 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3883 = _3881 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3885 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3887 = _3885 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3889 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3891 = _3889 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3893 = _3865 * _3875;
            float _3895 = precise::clamp(_3893, 0.0, 1.0);
            float _3897 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3899 = _3897 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3901 = fma(_3895, _3873, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3903 = fma(_3895, _3899, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3905 = fma(_3895, _3879, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3907 = fma(_3895, _3883, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3909 = fma(_3895, _3887, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3911 = fma(_3895, _3891, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3825 = _3905;
            _3843 = _3909;
            _3819 = _3901;
            _3837 = _3907;
            _3831 = _3903;
            _3851 = _3911;
            _3913 = true;
        }
        else
        {
            bool _3915 = _2872 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3917 = isnan(_2872);
            bool _3919 = _3915 || _3917;
            bool _3921 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3923 = _3919 || _3921;
            if (!_3923)
            {
                _3817 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3925 = _3817;
            _3819 = _3925;
            if (!_3923)
            {
                _3823 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3927 = _3823;
            _3825 = _3927;
            if (!_3923)
            {
                _3829 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3929 = _3829;
            _3831 = _3929;
            if (!_3923)
            {
                _3835 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3931 = _3835;
            _3837 = _3931;
            if (!_3923)
            {
                _3841 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3933 = _3841;
            _3843 = _3933;
            if (!_3923)
            {
                _3849 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3935 = _3849;
            bool _3937 = !_3923;
            _3851 = _3935;
            if (!_3937)
            {
                bool _3939 = _2872 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3941 = isnan(_2872);
                bool _3943 = _3939 || _3941;
                bool _3945 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3947 = _3943 || _3945;
                if (!_3947)
                {
                    float _3949 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3951 = _2872 + _3949;
                    float _3953 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3955 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3953;
                    float _3957 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3959 = _3957 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3961 = 1.0 / _3955;
                    float _3963 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3965 = _3963 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3967 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3969 = _3967 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3971 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3973 = _3971 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3975 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3977 = _3975 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3979 = _3951 * _3961;
                    float _3981 = precise::clamp(_3979, 0.0, 1.0);
                    float _3983 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3985 = _3983 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3987 = fma(_3981, _3959, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3989 = fma(_3981, _3985, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3991 = fma(_3981, _3965, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3993 = fma(_3981, _3969, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3995 = fma(_3981, _3973, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3997 = fma(_3981, _3977, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3825 = _3991;
                    _3843 = _3995;
                    _3819 = _3987;
                    _3837 = _3993;
                    _3831 = _3989;
                    _3851 = _3997;
                    _3913 = true;
                }
                else
                {
                    _3825 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3843 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3819 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3837 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3831 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3851 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3913 = false;
    float _3999 = _3825;
    float _4001 = _3843;
    float _4003 = _3819;
    float _4005 = _3837;
    float _4007 = _3831;
    float _4009 = _3851;
    float _4011 = fma(_2738, -0.5, 0.5);
    float _4013 = precise::clamp(_4011, 0.0, 1.0);
    float _4015 = -_3999;
    float _4017 = _4015 + _4001;
    float _4019 = -_4003;
    float _4021 = _4019 + _4005;
    float _4023 = -_4007;
    float _4025 = _4023 + _4009;
    bool _4027 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4029 = fma(_4013, _4017, _3999);
    float _4031 = fma(_4013, _4021, _4003);
    float _4033 = fma(_4013, _4025, _4007);
    float _4035 = _4029 * 0.586610972881317138671875;
    out.m_63.x = 1.0;
    float _4037 = fma(_4031, 0.298911988735198974609375, _4035);
    float _4039 = fma(_4033, 0.114477999508380889892578125, _4037);
    out.m_102.x = 0.0;
    float _4041 = -_4039;
    float _4043 = _4031 + _4041;
    float _4045 = -_4039;
    float _4047 = _4029 + _4045;
    float _4049 = -_4039;
    float _4051 = _4033 + _4049;
    float _4053 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4055 = fma(_4043, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4039);
    float _4057 = fma(_4047, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4039);
    float _4059 = fma(_4051, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4039);
    out.m_98.w = _4053;
    out.m_104.x = _4055;
    out.m_104.y = _4057;
    out.m_104.z = _4059;
    if (!_4027)
    {
        return out;
    }
    float _4061 = -_2836;
    float _4063 = _4061 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4065 = -_2838;
    float _4067 = _4065 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4069 = -_2840;
    float _4071 = _4069 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4073 = _4063 * _4063;
    float _4075 = fma(_4067, _4067, _4073);
    float _4077 = fma(_4071, _4071, _4075);
    float _4079 = sqrt(_4077);
    float _4081 = rsqrt(_4077);
    float _4083 = -_4079;
    float _4085 = _4083 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4087 = _4085 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4089 = precise::clamp(_4087, 0.0, 1.0);
    float _4091 = _4067 * _4081;
    float _4093 = _4063 * _4081;
    float _4095 = abs(_4089);
    float _4097 = log2(_4095);
    float _4099 = _4071 * _4081;
    float _4101 = _4091 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4103 = _2738 * _4093;
    float _4105 = -_4093;
    float _4107 = -_4101;
    float _4109 = fma(_4105, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4107);
    float _4111 = fma(_2732, _4091, _4103);
    float _4113 = -_4099;
    float _4115 = fma(_4113, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4109);
    float _4117 = fma(_2740, _4099, _4111);
    float _4119 = precise::clamp(_4117, 0.0, 1.0);
    float _4121 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4123 = _4115 + _4121;
    float _4125 = _4097 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4127 = _4123 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4129 = precise::clamp(_4127, 0.0, 1.0);
    float _4131 = exp2(_4125);
    float _4133 = _4131 * _4129;
    float _4135 = _4119 * _4133;
    float _4137 = _4135 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4139 = _4135 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4141 = _4135 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_102.x = _4137;
    out.m_102.y = _4139;
    out.m_102.z = _4141;
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
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3913 = false;
    bool _2792 = false;
    bool _219 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _118 = in.m_60.w;
    float _120 = trunc(_118);
    int _123 = int(_120);
    bool _127 = _123 >= 1;
    float _129 = 0.0;
    if (!_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    float _133 = _131;
    if (!_127)
    {
        out.m_63.x = 0.0;
    }
    int _135 = 0;
    if (!_127)
    {
        float _137 = _131 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    int _141 = _139;
    if (!_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4198 = as_type<float>(_139);
        out.gl_Position.z = _4198;
    }
    if (!_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _143 = in.m_65.w;
    bool _145 = _143 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _147 = isnan(_143);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _153 = _149 || _151;
    float _155 = -_143;
    float _157 = _155 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _159 = _157;
    if (_153)
    {
        float _161 = float(_123);
        _133 = _161;
    }
    float _163 = _133;
    bool _165 = _157 >= _163;
    bool _167 = !_153;
    bool _169 = _165 || _167;
    float _171 = _163;
    if (_169)
    {
        _171 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _173 = _171;
    if (_169)
    {
        out.m_63.x = 0.0;
    }
    if (_169)
    {
        float _175 = _173 * 5.0;
        _141 = as_type<int>(_175);
    }
    int _177 = _141;
    if (_169)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4268 = as_type<float>(_177);
        out.gl_Position.z = _4268;
    }
    if (_169)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _179 = as_type<float>(int(gl_VertexIndex));
    bool _181 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _183 = as_type<int>(_179) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_179) & 2;
    bool _189 = _187 != 0;
    bool _191 = !_185;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_189;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_181;
    float _217;
    if (!_199)
    {
        float _201 = in.m_70.x;
        float _203 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _205 = _201 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _207 = fma(_205, (*spvDescriptorSet0.vp_c9)._m0[12].x, _157);
        float _209 = _207 * _203;
        float _211 = floor(_209);
        float _213 = -_211;
        float _215 = _209 + _213;
        _217 = _215;
        _219 = true;
    }
    else
    {
        float _221 = float(_123);
        float _223 = 1.0 / _221;
        float _225 = _157 * _223;
        _217 = _225;
    }
    _219 = false;
    float _227 = _217;
    float _229 = in.m_70.x;
    float _231 = in.m_70.y;
    float _233 = in.m_70.z;
    float _235 = in.m_70.w;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _239 = _227 + _237;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _241;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _247 = _245 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _249;
    float _253 = 1.0 / _243;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _257 = _255 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    int _259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _261 = _259 != 0;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _265 = 1.0 / _247;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _273;
    float _277 = _231 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _279 = _229 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _281 = 1.0 / _251;
    float _283 = _229 * 2.0;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _287 = _227 + _285;
    float _289 = -_267;
    float _291 = fma(_279, 2.0, _289);
    float _293 = _231 * 2.0;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _297 = _295 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _299 = floor(_283);
    float _301 = fma(_277, -2.0, _263);
    float _303 = _233 * 2.0;
    float _305 = _287 * _253;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _309 = _227 + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _311;
    float _315 = fma(_271, _305, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _317 = floor(_303);
    float _319 = _309 * _265;
    float _321 = _229 + _231;
    float _323 = fma(_275, _305, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _329 = _321 + (-1.0);
    float _331 = _233 + _231;
    float _333 = floor(_293);
    bool _335 = _299 > 0.0;
    float _337 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _339 = _331 + (-1.0);
    bool _341 = _299 >= 0.0;
    bool _343 = isnan(_299);
    bool _345 = _341 || _343;
    bool _347 = isnan(0.0);
    bool _349 = _345 || _347;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _353 = float(_123);
    float _355 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _357 = 1.0 / _257;
    bool _359 = _317 > 0.0;
    float _361 = fma(_297, _319, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _363 = as_type<int>(_339);
    if (_261)
    {
        _363 = 0;
    }
    int _365 = _363;
    float _367 = fma(_327, _319, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _369 = _317 >= 0.0;
    bool _371 = isnan(_317);
    bool _373 = _369 || _371;
    bool _375 = isnan(0.0);
    bool _377 = _373 || _375;
    int _379 = _365;
    if (!_261)
    {
        _379 = 1;
    }
    int _381 = _379;
    float _383 = 1.0 / _353;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _387 = _227 + _385;
    bool _389 = _333 > 0.0;
    bool _391 = _333 >= 0.0;
    bool _393 = isnan(_333);
    bool _395 = _391 || _393;
    bool _397 = isnan(0.0);
    bool _399 = _395 || _397;
    float _401 = _387 * _281;
    float _403 = _233 + _229;
    int _405 = _349 ? 0 : 1;
    float _407 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _409 = int(_407);
    bool _411 = _381 != 1;
    float _413 = _403 + (-1.0);
    int _415 = _377 ? 0 : 1;
    float _417 = fma(_313, _401, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _419 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _421 = _399 ? 0 : 1;
    float _423 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _425 = int(_423);
    int _427 = ~_405;
    int _429 = _427 + 1;
    int _431 = _429 + 1;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _433;
    int _437 = _431;
    float _439 = as_type<float>(_381);
    if (!_335)
    {
        int _441 = ~_405;
        int _443 = _441 + 1;
        _437 = _443;
    }
    int _445 = _437;
    float _447 = _239 * _357;
    int _449 = ~_415;
    int _451 = _449 + 1;
    int _453 = _451 + 1;
    float _455 = fma(_435, _401, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    int _457 = _453;
    if (!_359)
    {
        int _459 = ~_415;
        int _461 = _459 + 1;
        _457 = _461;
    }
    int _463 = _457;
    float _465 = _383 * _157;
    int _467 = ~_421;
    int _469 = _467 + 1;
    int _471 = _469 + 1;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _475 = _473 != 0;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _479 = _477 != 0;
    int _481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _483 = _481 != 0;
    int _485 = _471;
    if (!_389)
    {
        int _487 = ~_421;
        int _489 = _487 + 1;
        _485 = _489;
    }
    int _491 = _485;
    float _493 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _495 = log2(_493);
    bool _497 = !_479;
    int _499 = _497 ? 0 : 1;
    bool _501 = !_475;
    int _503 = _501 ? 0 : 1;
    bool _505 = !_483;
    int _507 = _505 ? 0 : 1;
    int _509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _511 = _509 != 0;
    int _513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _515 = _513 != 0;
    int _517 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _519 = _517 != 0;
    float _521 = float(_425);
    float _523 = as_type<float>(_425);
    if (!_411)
    {
        _523 = _231;
    }
    float _525 = _523;
    float _527 = _525;
    if (_411)
    {
        _527 = _229;
    }
    float _529 = _527;
    float _531 = 1.0 / _521;
    bool _533 = !_511;
    float _535 = _533 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _537 = _529 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _539 = _535;
    if (!_411)
    {
        _439 = _231;
    }
    float _541 = _439;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _545 = _541;
    if (_411)
    {
        _545 = _229;
    }
    float _547 = _545;
    float _549 = -_351;
    float _551 = fma(_537, 2.0, _549);
    float _553 = _495 * _157;
    int _555 = abs(as_type<int>(_535));
    float _557 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[83].z, _543);
    float _559 = _547;
    if (!_411)
    {
        _539 = _233;
    }
    float _561 = _539;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _565 = _561;
    if (_411)
    {
        _565 = _231;
    }
    float _567 = _565;
    float _569 = exp2(_553);
    if (!_411)
    {
        _559 = _233;
    }
    float _571 = _559;
    float _573 = _531 * _157;
    float _575 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[83].w, _563);
    float _577 = _571;
    if (_411)
    {
        _577 = _231;
    }
    float _579 = _577;
    float _581 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[82].z, _557);
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _585 = float(_409);
    float _587 = _579 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _589 = float(_555);
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _593 = 1.0 + _591;
    float _595 = 1.0 / _585;
    float _597 = fma(_587, -2.0, _583);
    float _599 = float(_463);
    float _601 = -_157;
    float _603 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[76].x, _291);
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _607 = 1.0 / _593;
    float _609 = _589 * _599;
    bool _611 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _613 = isnan(1.0);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _619 = _615 || _617;
    float _621 = in.m_72.x;
    float _623 = in.m_72.y;
    float _625 = in.m_72.z;
    float _627 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[78].z, _605);
    float _629 = -_569;
    float _631 = _629 + 1.0;
    bool _633 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _635 = isnan(0.0);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _641 = _637 || _639;
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _645 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _647 = isnan(_227);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = _595 * _157;
    float _659 = _641 ? _631 : 0.0;
    float _661 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[78].w, _643);
    bool _663 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _665 = isnan(_227);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    float _675 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[76].y, _301);
    float _677 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[82].w, _575);
    float _679 = -_655;
    float _681 = _679 + 1.0;
    float _683 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[77].z, _627);
    float _685 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[77].w, _661);
    float _687 = -_157;
    float _689 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[81].x, _551);
    float _691 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[81].y, _597);
    if (_619)
    {
        float _693 = _659 * _607;
        _159 = _693;
    }
    float _695 = _159;
    float _697 = _609 * (-2.0);
    bool _699 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _701 = isnan(_227);
    bool _703 = _699 || _701;
    bool _705 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _707 = _703 || _705;
    float _709 = float(_707);
    float _711 = -_673;
    float _713 = _711 + 1.0;
    float _715 = _673 * _681;
    float _717 = fma(_337, _697, _337);
    bool _719 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _721 = isnan(_227);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _727 = _723 || _725;
    float _729 = float(_727);
    float _731 = _709 * _713;
    bool _733 = !_515;
    int _735 = _733 ? 0 : 1;
    float _737 = -_709;
    float _739 = _737 + 1.0;
    bool _741 = !_519;
    int _743 = _741 ? 0 : 1;
    float _745 = fma(_697, _621, _621);
    int _747 = abs(_735);
    bool _749 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _751 = isnan(_227);
    bool _753 = _749 || _751;
    bool _755 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _757 = _753 || _755;
    float _759 = float(_757);
    float _761 = _729 * _739;
    int _763 = abs(_743);
    float _765 = _229 + (-0.5);
    float _767 = float(_445);
    float _769 = -_729;
    float _771 = _769 + 1.0;
    float _773 = float(_747);
    float _775 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[196].x, _745);
    float _777 = float(_491);
    float _779 = _759 * _771;
    float _781 = -_759;
    float _783 = _781 + 1.0;
    float _785 = _773 * _767;
    float _787 = fma(_717, _695, _775);
    float _789 = _323 * _779;
    float _791 = _315 * _779;
    float _793 = _785 * (-2.0);
    float _795 = float(_763);
    float _797 = _231 + (-0.5);
    float _799 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[143].y, _789);
    float _801 = fma(_793, _623, _623);
    float _803 = fma(_355, _793, _355);
    float _805 = _795 * _777;
    float _807 = fma(_367, _761, _799);
    float _809 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[196].y, _801);
    float _811 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[143].x, _791);
    float _813 = _805 * (-2.0);
    float _815 = in.m_74.x;
    float _817 = in.m_74.y;
    float _819 = fma(_803, _695, _809);
    float _821 = _787 * 0.15915493667125701904296875;
    float _823 = fma(_813, _625, _625);
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _827 = _825 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _829 = _819 * 0.15915493667125701904296875;
    float _831 = _233 + (-0.5);
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _835 = _833 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _837 = fma(_361, _761, _811);
    float _839 = fma(_419, _813, _419);
    float _841 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[196].z, _823);
    float _843 = in.m_60.x;
    float _845 = in.m_60.y;
    float _847 = in.m_60.z;
    float _849 = fma(_827, _447, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _851 = fma(_835, _447, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _853 = fma(_455, _731, _807);
    float _855 = in.m_76.x;
    float _857 = in.m_76.y;
    float _859 = in.m_76.z;
    float _861 = fma(_417, _731, _837);
    float _863 = fma(_839, _695, _841);
    float _865 = fma(_851, _715, _853);
    float _867 = _821 * 6.283185482025146484375;
    float _869 = cos(_867);
    float _871 = fma(_849, _715, _861);
    float _873 = _863 * 0.15915493667125701904296875;
    float _875 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[147].y, _865);
    float _877 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[147].x, _871);
    float _879 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _881 = _875 * _817;
    float _883 = _829 * 6.283185482025146484375;
    float _885 = sin(_883);
    float _887 = _877 * _815;
    float _889 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _891 = _881 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _893 = _887 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _895 = in.m_78.x;
    float _897 = in.m_78.y;
    float _899 = in.m_78.z;
    float _901 = _829 * 6.283185482025146484375;
    float _903 = cos(_901);
    float _905 = _893 * _879;
    float _907 = _891 * _889;
    float _909 = _845 * _857;
    float _911 = _821 * 6.283185482025146484375;
    float _913 = sin(_911);
    float _915 = fma(_843, _855, _909);
    float _917 = _869 * _885;
    float _919 = fma(_847, _859, _915);
    float _921 = _873 * 6.283185482025146484375;
    float _923 = cos(_921);
    float _925 = _869 * _903;
    float _927 = _873 * 6.283185482025146484375;
    float _929 = sin(_927);
    float _931 = _913 * _885;
    float _933 = _913 * _903;
    float _935 = _869 * _923;
    float _937 = _913 * _923;
    float _939 = _903 * _923;
    float _941 = _885 * _923;
    float _943 = _935 * _907;
    float _945 = _937 * _907;
    float _947 = fma(_929, _925, _931);
    float _949 = -_917;
    float _951 = fma(_929, _933, _949);
    float _953 = -_933;
    float _955 = fma(_929, _917, _953);
    float _957 = -_907;
    float _959 = _929 * _957;
    float _961 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _963 = fma(_947, _905, _943);
    float _965 = fma(_929, _931, _925);
    float _967 = fma(_939, _905, _959);
    float _969 = _845 * _897;
    float _971 = fma(_955, _961, _963);
    float _973 = fma(_951, _905, _945);
    float _975 = fma(_941, _961, _967);
    float _977 = fma(_843, _895, _969);
    float _979 = _971 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _981 = _971 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _983 = fma(_965, _961, _973);
    float _985 = fma(_847, _899, _977);
    float _987 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[24].x, _979);
    float _989 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[26].x, _981);
    float _991 = _919 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _993 = _985 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _995 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[24].z, _987);
    float _997 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[26].z, _989);
    float _999 = _995 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1001 = _997 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1003 = _991 + _999;
    float _1005 = _993 + _1001;
    float _1007 = in.m_80.x;
    float _1009 = in.m_80.y;
    float _1011 = in.m_80.z;
    float _1013 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1015 = _1003 + _1013;
    float _1017 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1019 = _1005 + _1017;
    float _1021 = _1015 * _1015;
    float _1023 = _1019 * _1019;
    float _1025 = _1021 + _1023;
    float _1027 = sqrt(_1025);
    float _1029 = _845 * _1009;
    float _1031 = fma(_843, _1007, _1029);
    bool _1033 = _1027 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1035 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1037 = _1027 + _1035;
    float _1039 = fma(_847, _1011, _1031);
    float _1041 = _945;
    float _1043 = _1025;
    float _1045 = _1037;
    float _1047 = _971;
    float _1049 = _845;
    float _1051 = _1003;
    float _1053 = _1005;
    float _1055 = _1021;
    float _1057 = _1023;
    if (_1033)
    {
        float _1059 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1041 = _1059;
    }
    float _1061 = _1041;
    if (_1033)
    {
        float _1063 = rsqrt(_1025);
        _1043 = _1063;
    }
    float _1065 = _1043;
    float _1067 = _1065;
    if (_1033)
    {
        float _1069 = _1037 * _1061;
        _1045 = _1069;
    }
    float _1071 = _1045;
    float _1073 = _971 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (_1033)
    {
        float _1075 = _1071 * 0.15915493667125701904296875;
        _1047 = _1075;
    }
    float _1077 = _1047;
    float _1079 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1073);
    float _1081 = _1039 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1083 = _843;
    float _1085 = _1081;
    if (_1033)
    {
        float _1087 = _1077 * 6.283185482025146484375;
        float _1089 = sin(_1087);
        _1083 = _1089;
    }
    float _1091 = _1083;
    float _1093 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1079);
    float _1095 = _1093 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1097 = _1081 + _1095;
    float _1099 = _1097;
    if (_1033)
    {
        float _1101 = _1097 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1049 = _1101;
    }
    float _1103 = _1049;
    float _1105 = _1091;
    if (_1033)
    {
        float _1107 = fma(_1091, _1103, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1105 = _1107;
    }
    float _1109 = _1105;
    float _1111 = _1109;
    if (_1033)
    {
        float _1113 = _1065 * _1109;
        _1111 = _1113;
    }
    float _1115 = _1111;
    if (_1033)
    {
        float _1117 = fma(_1015, _1115, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1051 = _1117;
    }
    float _1119 = _1051;
    if (_1033)
    {
        float _1121 = fma(_1019, _1115, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1053 = _1121;
    }
    float _1123 = _1053;
    float _1125 = fma(_1119, 6.2500002968590706586837768554688e-05, 0.5);
    float _1127 = fma(_1123, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5737 = float2(_1125, _1127);
    float3 _1131 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5737, float2(0.0), isnan(_5737)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5737, float2(0.0), isnan(_5737)), level(0.0)).xyz;
    float _1133 = _1131.x;
    float _1135 = _1131.y;
    float _1137 = _1131.z;
    float _1139 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1141 = int(_1139);
    if (_261)
    {
        float _1143 = in.m_70.x;
        _1067 = _1143;
    }
    float _1145 = _1067;
    float _1147 = -_581;
    float _1149 = _1147 + 1.0;
    float _1151 = -_683;
    float _1153 = _1151 + 1.0;
    float _1155 = _1145;
    if (!_261)
    {
        float _1157 = in.m_70.y;
        _1155 = _1157;
    }
    float _1159 = _1155;
    float _1161 = -_685;
    float _1163 = _1161 + 1.0;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1167 = trunc(_573);
    int _1169 = int(_1167);
    float _1171 = -_677;
    float _1173 = _1171 + 1.0;
    float _1175 = float(uint(_1141));
    float _1177 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1179 = int(_1177);
    int _1181 = ~_1141;
    int _1183 = _1181 + 1;
    float _1185 = float(_1141);
    bool _1187 = _1141 == 0;
    float _1189 = float(uint(_1169));
    float _1191 = 1.0 / _1175;
    float _1193 = float(uint(_1179));
    float _1195 = trunc(_657);
    int _1197 = int(_1195);
    int _1199 = ~_1179;
    int _1201 = _1199 + 1;
    bool _1203 = _1179 == 0;
    int _1205 = as_type<int>(_1191) + (-2);
    float _1207 = 1.0 / _1193;
    float _1209 = _1191;
    float _1211 = _1173;
    if (_261)
    {
        _1209 = 1.0;
    }
    float _1213 = _1209;
    float _1215 = _1213;
    if (!_261)
    {
        _1215 = 7.345489978790283203125;
    }
    float _1217 = _1215;
    float _1219 = as_type<float>(_1205) * _1189;
    float _1221 = trunc(_1219);
    float _1223 = precise::max(_1221, 0.0);
    uint _1226 = uint(_1223);
    float _1228 = _1217 * _229;
    int _1230 = as_type<int>(_1207) + (-2);
    float _1232 = float(uint(_1197));
    int _1234 = _1183 * int(_1226);
    int _1236 = _1234 + _1169;
    float _1238 = as_type<float>(_1230) * _1232;
    float _1240 = float(_1169);
    float _1242 = float(uint(_1236));
    float _1244 = floor(_1228);
    bool _1246 = _1240 >= _1185;
    bool _1248 = isnan(_1240);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan(_1185);
    bool _1254 = _1250 || _1252;
    float _1256 = float(_1254);
    float _1258 = as_type<float>(_1205) * _1242;
    float _1260 = trunc(_1238);
    float _1262 = precise::max(_1260, 0.0);
    uint _1264 = uint(_1262);
    float _1266 = trunc(_1258);
    float _1268 = precise::max(_1266, 0.0);
    uint _1270 = uint(_1268);
    float _1272 = -_1244;
    float _1274 = _1228 + _1272;
    int _1276 = ~_1141;
    int _1278 = _1276 + 1;
    float _1280 = _1274 * _1185;
    int _1282 = _1201 * int(_1264);
    int _1284 = _1282 + _1197;
    float _1286 = trunc(_1256);
    int _1288 = int(_1286);
    float _1290 = float(uint(_1284));
    int _1292 = int(_1226) + int(_1270);
    float _1294 = as_type<float>(_1230) * _1290;
    float _1296 = trunc(_1280);
    int _1298 = int(_1296);
    int _1300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1302 = _1300 != 0;
    float _1304 = as_type<float>(_1278);
    if (_261)
    {
        _1304 = 1.0;
    }
    float _1306 = _1304;
    int _1308 = _1278 * _1292;
    int _1310 = _1308 + _1169;
    float _1312 = _1306;
    if (!_261)
    {
        _1312 = 1.2345600128173828125;
    }
    float _1314 = _1312;
    bool _1316 = !_1302;
    int _1318 = _1316 ? 0 : 1;
    bool _1320 = uint(_1310) >= uint(_1141);
    float _1322 = _1314 * _1159;
    float _1324 = trunc(_1294);
    float _1326 = precise::max(_1324, 0.0);
    uint _1328 = uint(_1326);
    int _1330 = abs(_1318);
    bool _1332 = !_1320;
    int _1334 = _1332 ? 0 : (-1);
    int _1336 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1338 = _1336 != 0;
    int _1340 = ~_1292;
    int _1342 = _1340 + _1334;
    int _1344 = _1342 + 1;
    float _1346 = _1185 * _465;
    int _1348 = ~_1179;
    int _1350 = _1348 + 1;
    int _1352 = abs(_503);
    int _1354 = _1141 * _1344;
    int _1356 = _1354 + _1169;
    float _1358 = trunc(_1346);
    int _1360 = int(_1358);
    int _1362 = ~_1288;
    int _1364 = _1362 + 1;
    int _1366 = _1364 + 1;
    bool _1368 = !_1187;
    int _1370 = _1368 ? _1356 : (-1);
    int _1372 = _1298 * _1330;
    int _1374 = _1372 + _1169;
    int _1376 = int(_1264) + int(_1328);
    int _1378 = _1141 + (-1);
    int _1380 = _1370 * _1366;
    int _1382 = abs(_499);
    int _1384 = _1350 * _1376;
    int _1386 = _1384 + _1197;
    float _1388 = floor(_1322);
    int _1390 = _1288 * _1378;
    int _1392 = _1390 + _1380;
    float _1394 = float(_1179);
    float _1396 = float(_1197);
    bool _1398 = uint(_1386) >= uint(_1179);
    int _1400 = _1392 * _1382;
    bool _1402 = _1396 >= _1394;
    bool _1404 = isnan(_1396);
    bool _1406 = _1402 || _1404;
    bool _1408 = isnan(_1394);
    bool _1410 = _1406 || _1408;
    float _1412 = float(_1410);
    int _1414 = abs(_507);
    bool _1416 = !_1398;
    int _1418 = _1416 ? 0 : (-1);
    float _1420 = trunc(_1412);
    int _1422 = int(_1420);
    float _1424 = -_1388;
    float _1426 = _1322 + _1424;
    int _1428 = ~_1376;
    int _1430 = _1428 + _1418;
    int _1432 = _1430 + 1;
    bool _1434 = !_1338;
    int _1436 = _1434 ? 0 : 1;
    int _1438 = _1360 * _1352;
    int _1440 = _1438 + _1400;
    float _1442 = _1426 * _1394;
    int _1444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1446 = _1444 != 0;
    int _1448 = _1179 * _1432;
    int _1450 = _1448 + _1197;
    int _1452 = abs(_1436);
    int _1454 = _1374 * _1414;
    int _1456 = _1454 + _1440;
    bool _1458 = !_1446;
    int _1460 = _1458 ? 0 : 1;
    float _1462 = trunc(_1442);
    int _1464 = int(_1462);
    int _1466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1468 = _1466 != 0;
    int _1470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1472 = _1470 != 0;
    int _1474 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1476 = _1474 != 0;
    int _1478 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1480 = _1478 != 0;
    float _1482 = _1394 * _465;
    int _1484 = _1298 * _1452;
    int _1486 = _1484 + _1456;
    int _1488 = ~_1422;
    int _1490 = _1488 + 1;
    int _1492 = _1490 + 1;
    bool _1494 = !_1203;
    int _1496 = _1494 ? _1450 : (-1);
    float _1498 = trunc(_1482);
    int _1500 = int(_1498);
    bool _1502 = !_1472;
    int _1504 = _1502 ? 0 : 1;
    float _1506 = float(uint(_1486));
    int _1508 = _1496 * _1492;
    int _1510 = abs(_1460);
    int _1512 = _1179 + (-1);
    float _1514 = as_type<float>(_1205) * _1506;
    bool _1516 = !_1468;
    int _1518 = _1516 ? 0 : 1;
    int _1520 = abs(_1504);
    int _1522 = _1422 * _1512;
    int _1524 = _1522 + _1508;
    int _1526 = abs(_1518);
    float _1528 = trunc(_1514);
    float _1530 = precise::max(_1528, 0.0);
    uint _1532 = uint(_1530);
    int _1534 = _1464 * _1510;
    int _1536 = _1534 + _1197;
    bool _1538 = !_1476;
    int _1540 = _1538 ? 0 : 1;
    int _1542 = _1524 * _1520;
    int _1544 = ~_1141;
    int _1546 = _1544 + 1;
    float _1548 = float(uint(_1374));
    int _1550 = _1500 * _1526;
    int _1552 = _1550 + _1542;
    bool _1554 = !_1480;
    int _1556 = _1554 ? 0 : 1;
    int _1558 = abs(_1540);
    float _1560 = as_type<float>(_1205) * _1548;
    int _1562 = abs(_1556);
    int _1564 = _1536 * _1558;
    int _1566 = _1564 + _1552;
    float _1568 = trunc(_1560);
    float _1570 = precise::max(_1568, 0.0);
    uint _1572 = uint(_1570);
    int _1574 = _1546 * int(_1532);
    int _1576 = _1574 + _1486;
    float _1578 = float(uint(_1536));
    int _1580 = _1464 * _1562;
    int _1582 = _1580 + _1566;
    int _1584 = ~_1179;
    int _1586 = _1584 + 1;
    float _1588 = float(uint(_1576));
    float _1590 = as_type<float>(_1230) * _1578;
    float _1592 = float(uint(_1582));
    int _1594 = ~_1141;
    int _1596 = _1594 + 1;
    float _1598 = trunc(_1590);
    float _1600 = precise::max(_1598, 0.0);
    uint _1602 = uint(_1600);
    float _1604 = as_type<float>(_1205) * _1588;
    float _1606 = as_type<float>(_1230) * _1592;
    int _1608 = _1596 * int(_1572);
    int _1610 = _1608 + _1374;
    float _1612 = trunc(_1604);
    float _1614 = precise::max(_1612, 0.0);
    uint _1616 = uint(_1614);
    int _1618 = ~_1179;
    int _1620 = _1618 + 1;
    float _1622 = float(uint(_1610));
    float _1624 = trunc(_1606);
    float _1626 = precise::max(_1624, 0.0);
    uint _1628 = uint(_1626);
    int _1630 = _1586 * int(_1602);
    int _1632 = _1630 + _1536;
    float _1634 = as_type<float>(_1205) * _1622;
    int _1636 = ~_1141;
    int _1638 = _1636 + 1;
    float _1640 = float(uint(_1632));
    float _1642 = trunc(_1634);
    float _1644 = precise::max(_1642, 0.0);
    uint _1646 = uint(_1644);
    int _1648 = int(_1532) + int(_1616);
    float _1650 = as_type<float>(_1230) * _1640;
    int _1652 = _1620 * int(_1628);
    int _1654 = _1652 + _1582;
    float _1656 = trunc(_1650);
    float _1658 = precise::max(_1656, 0.0);
    uint _1660 = uint(_1658);
    int _1662 = _1638 * _1648;
    int _1664 = _1662 + _1486;
    float _1666 = float(uint(_1654));
    bool _1668 = uint(_1664) >= uint(_1141);
    int _1670 = int(_1572) + int(_1646);
    float _1672 = as_type<float>(_1230) * _1666;
    bool _1674 = !_1668;
    int _1676 = _1674 ? 0 : (-1);
    int _1678 = ~_1179;
    int _1680 = _1678 + 1;
    float _1682 = trunc(_1672);
    float _1684 = precise::max(_1682, 0.0);
    uint _1686 = uint(_1684);
    int _1688 = ~_1648;
    int _1690 = _1688 + _1676;
    int _1692 = _1690 + 1;
    int _1694 = int(_1602) + int(_1660);
    int _1696 = _1141 * _1692;
    int _1698 = _1696 + _1486;
    int _1700 = ~_1141;
    int _1702 = _1700 + 1;
    int _1704 = _1680 * _1694;
    int _1706 = _1704 + _1536;
    int _1708 = ~_1179;
    int _1710 = _1708 + 1;
    bool _1712 = !_1187;
    int _1714 = _1712 ? _1698 : (-1);
    int _1716 = _1702 * _1670;
    int _1718 = _1716 + _1374;
    int _1720 = _1714 & 3;
    bool _1722 = _1720 != 0;
    int _1724 = int(_1628) + int(_1686);
    int _1726 = _1714 & 3;
    bool _1728 = _1726 != 0;
    bool _1730 = uint(_1720) >= 2u;
    int _1732 = _1710 * _1724;
    int _1734 = _1732 + _1582;
    int _1736 = _1728 ? 0 : 1;
    bool _1738 = uint(_1718) >= uint(_1141);
    int _1740 = _1730 ? 0 : 1;
    bool _1742 = uint(_1734) >= uint(_1179);
    bool _1744 = uint(_1720) > 1u;
    bool _1746 = !_1738;
    int _1748 = _1746 ? 0 : (-1);
    bool _1750 = !_1742;
    int _1752 = _1750 ? 0 : (-1);
    int _1754 = ~_1670;
    int _1756 = _1754 + _1748;
    int _1758 = _1756 + 1;
    int _1760 = ~_1724;
    int _1762 = _1760 + _1752;
    int _1764 = _1762 + 1;
    bool _1766 = _235 > 0.5;
    int _1768 = _1141 * _1758;
    int _1770 = _1768 + _1374;
    int _1772 = ~_1736;
    int _1774 = _1772 + 1;
    int _1776 = _1774 + 1;
    int _1778 = _1179 * _1764;
    int _1780 = _1778 + _1582;
    int _1782 = _1776;
    if (!_1744)
    {
        int _1784 = ~_1736;
        int _1786 = _1784 + 1;
        _1782 = _1786;
    }
    int _1788 = _1782;
    float _1790 = -_197;
    int _1792 = _1766 ? as_type<int>(_1790) : as_type<int>(_197);
    int _1794 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1796 = _1794 != 0;
    bool _1798 = !_1203;
    int _1800 = _1798 ? _1780 : (-1);
    bool _1802 = _1720 != 3;
    bool _1804 = !_1187;
    int _1806 = _1804 ? _1770 : (-1);
    int _1808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1810 = _1808 != 0;
    bool _1812 = !_1796;
    int _1814 = _1812 ? 0 : 1;
    int _1816 = _1714 >> 31;
    int _1818 = _1800 & 3;
    bool _1820 = _1818 != 0;
    int _1822 = _1800 >> 31;
    bool _1824 = !_1810;
    int _1826 = _1824 ? 0 : 1;
    int _1828 = _1816 & 3;
    bool _1830 = uint(_1706) >= uint(_1179);
    int _1832 = _1800 & 3;
    bool _1834 = _1832 != 0;
    bool _1836 = !_1820;
    float _1838 = _1836 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _1840 = _1822 & 3;
    bool _1842 = uint(_1818) > 1u;
    int _1844 = _1714 + _1828;
    bool _1846 = !_1830;
    int _1848 = _1846 ? 0 : (-1);
    int _1850 = _1834 ? 0 : 1;
    int _1852 = _1800 + _1840;
    int _1854 = ~_1740;
    int _1856 = _1854 + 1;
    int _1858 = _1856 + 1;
    bool _1860 = _1720 != 3;
    int _1862 = _1858;
    float _1864 = _1838;
    if (_1802)
    {
        int _1866 = ~_1740;
        int _1868 = _1866 + 1;
        _1862 = _1868;
    }
    int _1870 = _1862;
    bool _1872 = !_1722;
    int _1874 = _1872 ? 0 : 1;
    int _1876 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1878 = _1876 != 0;
    int _1880 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1882 = _1880 != 0;
    int _1884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1886 = _1884 != 0;
    int _1888 = _1844 >> 2;
    int _1890 = ~_1694;
    int _1892 = _1890 + _1848;
    int _1894 = _1892 + 1;
    int _1896 = _1852 >> 2;
    bool _1898 = !_1860;
    int _1900 = _1898 ? 0 : (-1);
    int _1902 = _1179 * _1894;
    int _1904 = _1902 + _1536;
    bool _1906 = uint(_1818) >= 2u;
    int _1908 = _1888 << 4;
    int _1910 = _1908 + 368;
    int _1912 = _1896 << 4;
    int _1914 = _1912 + 512;
    int _1916 = ~_1850;
    int _1918 = _1916 + 1;
    int _1920 = _1918 + 1;
    uint _1922 = uint(int(uint(_1910) >> uint(2)));
    uint _1924 = uint(int(uint(int(_1922)) >> uint(2)));
    int _1926 = int(_1922) & 3;
    float _1928 = (*spvDescriptorSet0.vp_c9)._m0[int(_1924)][_1926];
    int _1930 = int(_1922) + 1;
    uint _1932 = uint(int(uint(_1930) >> uint(2)));
    int _1934 = _1930 & 3;
    float _1936 = (*spvDescriptorSet0.vp_c9)._m0[int(_1932)][_1934];
    int _1938 = _1920;
    if (!_1842)
    {
        int _1940 = ~_1850;
        int _1942 = _1940 + 1;
        _1938 = _1942;
    }
    int _1944 = _1938;
    int _1946 = _1906 ? 0 : 1;
    bool _1948 = _1818 != 3;
    bool _1950 = _1818 != 3;
    int _1952 = _1910 + 8;
    uint _1954 = uint(int(uint(_1952) >> uint(2)));
    uint _1956 = uint(int(uint(int(_1954)) >> uint(2)));
    int _1958 = int(_1954) & 3;
    float _1960 = (*spvDescriptorSet0.vp_c9)._m0[int(_1956)][_1958];
    int _1962 = int(_1954) + 1;
    uint _1964 = uint(int(uint(_1962) >> uint(2)));
    int _1966 = _1962 & 3;
    float _1968 = (*spvDescriptorSet0.vp_c9)._m0[int(_1964)][_1966];
    int _1970 = ~_1946;
    int _1972 = _1970 + 1;
    int _1974 = _1972 + 1;
    bool _1976 = !_1203;
    int _1978 = _1976 ? _1904 : (-1);
    uint _1980 = uint(int(uint(_1914) >> uint(2)));
    uint _1982 = uint(int(uint(int(_1980)) >> uint(2)));
    int _1984 = int(_1980) & 3;
    float _1986 = (*spvDescriptorSet0.vp_c9)._m0[int(_1982)][_1984];
    int _1988 = int(_1980) + 1;
    uint _1990 = uint(int(uint(_1988) >> uint(2)));
    int _1992 = _1988 & 3;
    float _1994 = (*spvDescriptorSet0.vp_c9)._m0[int(_1990)][_1992];
    int _1996 = _1974;
    if (_1948)
    {
        int _1998 = ~_1946;
        int _2000 = _1998 + 1;
        _1996 = _2000;
    }
    int _2002 = _1996;
    float _2004 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2006 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2008 = _2006 != 0;
    float _2010 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2012 = _1914 + 8;
    uint _2014 = uint(int(uint(_2012) >> uint(2)));
    uint _2016 = uint(int(uint(int(_2014)) >> uint(2)));
    int _2018 = int(_2014) & 3;
    float _2020 = (*spvDescriptorSet0.vp_c9)._m0[int(_2016)][_2018];
    int _2022 = int(_2014) + 1;
    uint _2024 = uint(int(uint(_2022) >> uint(2)));
    int _2026 = _2022 & 3;
    float _2028 = (*spvDescriptorSet0.vp_c9)._m0[int(_2024)][_2026];
    float _2030 = _2004 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2032 = abs(_1944);
    float _2034 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2036 = abs(_1788);
    float _2038 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2040 = abs(_1874);
    float _2042 = _2034 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2044 = !_1950;
    int _2046 = _2044 ? 0 : (-1);
    float _2048 = _2038 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2050 = _229 > 0.5;
    bool _2052 = _231 > 0.5;
    out.m_82.x = _2042;
    out.m_82.y = _2030;
    out.m_82.z = _2048;
    out.m_82.w = _2010;
    int _2054 = ~_2036;
    int _2056 = _2054 + 1;
    int _2058 = _2056 + 1;
    float _2060 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2062 = -_193;
    int _2064 = _2050 ? as_type<int>(_2062) : as_type<int>(_193);
    float _2066 = _1165 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2068 = _233 > 0.5;
    float _2070 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2072 = _2058 * as_type<int>(_1936);
    int _2074 = abs(_1870);
    float _2076 = _2060 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2078 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2080 = int(_2078);
    float _2082 = _2070 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2084 = abs(as_type<int>(_1838));
    if (_1033)
    {
        float _2086 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2088 = _1119 + _2086;
        _1864 = _2088;
    }
    float _2090 = _1864;
    int _2092 = ~_2032;
    int _2094 = _2092 + 1;
    int _2096 = _2094 + 1;
    int _2098 = ~_2040;
    int _2100 = _2098 + 1;
    int _2102 = _2100 + 1;
    out.m_84.x = _2066;
    out.m_84.y = _2076;
    out.m_84.z = _2082;
    int _2104 = ~_2084;
    int _2106 = _2104 + 1;
    int _2108 = _2106 + 1;
    int _2110 = _2096 * as_type<int>(_1994);
    int _2112 = abs(_1900);
    int _2114 = _2102 * as_type<int>(_1928);
    int _2116 = _2114 + _2072;
    int _2118 = abs(_2046);
    int _2120 = _2108 * as_type<int>(_1986);
    int _2122 = _2120 + _2110;
    float _2124 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2126 = int(_2124);
    int _2128 = abs(_2002);
    float _2130 = _935 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2132 = ~_2074;
    int _2134 = _2132 + 1;
    int _2136 = _2134 + 1;
    float _2138 = _947 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2140 = _935 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2142 = float(uint(_2080));
    int _2144 = _2136 * as_type<int>(_1960);
    int _2146 = _2144 + _2116;
    int _2148 = ~_2112;
    int _2150 = _2148 + 1;
    int _2152 = _2150 + 1;
    float _2154 = _947 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2156 = ~_2128;
    int _2158 = _2156 + 1;
    int _2160 = _2158 + 1;
    if (_1033)
    {
        float _2162 = _2090 * _2090;
        _1055 = _2162;
    }
    float _2164 = _1055;
    float _2166 = 1.0 / _2142;
    int _2168 = _2152 * as_type<int>(_1968);
    int _2170 = _2168 + _2146;
    int _2172 = abs(_1814);
    int _2174 = _2160 * as_type<int>(_2020);
    int _2176 = _2174 + _2122;
    int _2178 = abs(_2080);
    int _2180 = ~_2172;
    int _2182 = _2180 + 1;
    int _2184 = _2182 + 1;
    int _2186 = ~_2118;
    int _2188 = _2186 + 1;
    int _2190 = _2188 + 1;
    float _2192 = float(uint(_2126));
    int _2194 = _2170 * _2184;
    int _2196 = _2190 * as_type<int>(_2028);
    int _2198 = _2196 + _2176;
    int _2200 = abs(_1826);
    float _2202 = _935 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2204 = _1806 * _2172;
    int _2206 = _2204 + _2194;
    float _2208 = 1.0 / _2192;
    float _2210 = float(uint(_2178));
    float _2212 = -_929;
    float _2214 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2130);
    int _2216 = abs(_2126);
    float _2218 = -_929;
    float _2220 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2202);
    int _2222 = as_type<int>(_2166) + (-2);
    float _2224 = _955 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2226 = float(uint(_2206));
    float _2228 = 1.0 / _2210;
    float _2230 = -_929;
    float _2232 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2140);
    int _2234 = ~_2200;
    int _2236 = _2234 + 1;
    int _2238 = _2236 + 1;
    float _2240 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2214);
    float _2242 = float(uint(_2216));
    float _2244 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2232);
    float _2246 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2220);
    float _2248 = _947 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2250 = as_type<float>(_2222) * _2226;
    int _2252 = _2198 * _2238;
    float _2254 = 1.0 / _2242;
    float _2256 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2248);
    int _2258 = abs(_2206);
    int _2260 = _1978 * _2200;
    int _2262 = _2260 + _2252;
    float _2264 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2138);
    float _2266 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2154);
    int _2268 = as_type<int>(_2208) + (-2);
    float _2270 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2256);
    float _2272 = trunc(_2250);
    float _2274 = precise::max(_2272, 0.0);
    uint _2276 = uint(_2274);
    float _2278 = float(uint(_2262));
    int _2280 = abs(_2262);
    float _2282 = as_type<float>(_2268) * _2278;
    float _2284 = float(uint(_2258));
    float _2286 = as_type<float>(_2198);
    if (_1033)
    {
        float _2288 = _1077 * 6.283185482025146484375;
        float _2290 = cos(_2288);
        _2286 = _2290;
    }
    float _2292 = _2286;
    int _2294 = ~_2080;
    int _2296 = _2294 + 1;
    float _2298 = _955 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2300 = as_type<int>(_2254) + (-2);
    float _2302 = float(uint(_2280));
    bool _2304 = !_1878;
    float _2306 = _2304 ? _197 : as_type<float>(_1792);
    float _2308 = trunc(_2282);
    float _2310 = precise::max(_2308, 0.0);
    uint _2312 = uint(_2310);
    int _2314 = as_type<int>(_2228) + (-2);
    float _2316 = _955 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2318 = !_2008;
    float _2320 = _2318 ? _193 : as_type<float>(_2064);
    bool _2322 = _2126 == 0;
    float _2324 = as_type<float>(_2314) * _2284;
    float _2326 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2298);
    int _2328 = _2296 * int(_2276);
    int _2330 = _2328 + _2206;
    float _2332 = as_type<float>(_2300) * _2302;
    float _2334 = trunc(_2324);
    float _2336 = precise::max(_2334, 0.0);
    uint _2338 = uint(_2336);
    float _2340 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2316);
    float _2342 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2224);
    float _2344 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2326);
    float _2346 = float(uint(_2330));
    float _2348 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2340);
    float _2350 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2342);
    int _2352 = ~_2178;
    int _2354 = _2352 + 1;
    float _2356 = trunc(_2332);
    float _2358 = precise::max(_2356, 0.0);
    uint _2360 = uint(_2358);
    int _2362 = ~_2126;
    int _2364 = _2362 + 1;
    float _2366 = as_type<float>(_2222) * _2346;
    float _2368 = as_type<float>(_2354);
    if (_1033)
    {
        float _2370 = _2292 + (-1.0);
        _2368 = _2370;
    }
    float _2372 = _2368;
    int _2374 = ~_2216;
    int _2376 = _2374 + 1;
    int _2378 = _2364 * int(_2312);
    int _2380 = _2378 + _2262;
    int _2382 = _2354 * int(_2338);
    int _2384 = _2382 + _2258;
    float _2386 = _2372;
    if (_1033)
    {
        float _2388 = _2372 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2386 = _2388;
    }
    float _2390 = _2386;
    float _2392 = trunc(_2366);
    float _2394 = precise::max(_2392, 0.0);
    uint _2396 = uint(_2394);
    float _2398 = float(uint(_2380));
    float _2400 = float(uint(_2384));
    if (_1033)
    {
        float _2402 = fma(_1097, _2292, _2390);
        _1099 = _2402;
    }
    float _2404 = _1099;
    float _2406 = -_197;
    int _2408 = _2052 ? as_type<int>(_2406) : as_type<int>(_197);
    int _2410 = _2376 * int(_2360);
    int _2412 = _2410 + _2280;
    float _2414 = as_type<float>(_2314) * _2400;
    bool _2416 = !_1882;
    float _2418 = _2416 ? _197 : as_type<float>(_2408);
    float _2420 = _197 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2422 = float(uint(_2412));
    float _2424 = as_type<float>(_2268) * _2398;
    float _2426 = -_193;
    int _2428 = _2068 ? as_type<int>(_2426) : as_type<int>(_193);
    float _2430 = trunc(_2414);
    float _2432 = precise::max(_2430, 0.0);
    uint _2434 = uint(_2432);
    float _2436 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2264);
    float _2438 = as_type<float>(_2300) * _2422;
    bool _2440 = !_1886;
    float _2442 = _2440 ? _193 : as_type<float>(_2428);
    float _2444 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2446 = _2420 * _2244;
    float _2448 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2266);
    float _2450 = _2420 * _2246;
    float _2452 = trunc(_2424);
    float _2454 = precise::max(_2452, 0.0);
    uint _2456 = uint(_2454);
    float _2458 = fma(_2444, _2270, _2446);
    float _2460 = _2446;
    if (_1033)
    {
        float _2462 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2464 = _1123 + _2462;
        _2460 = _2464;
    }
    float _2466 = _2460;
    float _2468 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2470 = _2404 + _2468;
    out.m_86.x = _2270;
    out.m_86.y = _2436;
    out.m_86.z = _2448;
    if (_1033)
    {
        float _2472 = _2466 * _2466;
        _1057 = _2472;
    }
    float _2474 = _1057;
    int _2476 = int(_2276) + int(_2396);
    float _2478 = trunc(_2438);
    float _2480 = precise::max(_2478, 0.0);
    uint _2482 = uint(_2480);
    float _2484 = _2420 * _2240;
    int _2486 = ~_2080;
    int _2488 = _2486 + 1;
    float _2490 = fma(_2470, _2470, _2164);
    bool _2492 = _2126 == 0;
    float _2494 = fma(_2444, _2436, _2484);
    float _2496 = fma(_2444, _2448, _2450);
    int _2498 = ~_2178;
    int _2500 = _2498 + 1;
    int _2502 = int(_2312) + int(_2456);
    int _2504 = ~_2126;
    int _2506 = _2504 + 1;
    int _2508 = int(_2338) + int(_2434);
    int _2510 = int(_2360) + int(_2482);
    int _2512 = _2488 * _2476;
    int _2514 = _2512 + _2206;
    int _2516 = ~_2216;
    int _2518 = _2516 + 1;
    int _2520 = _2500 * _2508;
    int _2522 = _2520 + _2258;
    float _2524 = _2490 + _2474;
    int _2526 = _2506 * _2502;
    int _2528 = _2526 + _2262;
    bool _2530 = uint(_2514) >= uint(_2080);
    int _2532 = _2518 * _2510;
    int _2534 = _2532 + _2280;
    float _2536 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2538 = uint(_2522) >= uint(_2178);
    bool _2540 = uint(_2528) >= uint(_2126);
    bool _2542 = !_2530;
    int _2544 = _2542 ? 0 : (-1);
    bool _2546 = !_2540;
    int _2548 = _2546 ? 0 : (-1);
    float _2550 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2552 = ~_2476;
    int _2554 = _2552 + _2544;
    int _2556 = _2554 + 1;
    bool _2558 = uint(_2534) >= uint(_2216);
    int _2560 = ~_2502;
    int _2562 = _2560 + _2548;
    int _2564 = _2562 + 1;
    int _2566 = _2080 * _2556;
    int _2568 = _2566 + _2206;
    int _2570 = _2206 ^ _2080;
    float _2572 = sqrt(_2524);
    bool _2574 = !_2558;
    int _2576 = _2574 ? 0 : (-1);
    int _2578 = _2126 * _2564;
    int _2580 = _2578 + _2262;
    bool _2582 = !_2538;
    int _2584 = _2582 ? 0 : (-1);
    uint _2586 = uint(int(uint(_2570) >> uint(31)));
    bool _2588 = _2080 == 0;
    float _2590 = _2550 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2592 = _2080 == 0;
    float _2594 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2596 = _2262 ^ _2126;
    int _2598 = ~_2576;
    int _2600 = _2510 + _2598;
    int _2602 = _2600 + 1;
    int _2604 = ~_2584;
    int _2606 = _2508 + _2604;
    int _2608 = _2606 + 1;
    float _2610 = fma(_2420, _2420, 1.0);
    int _2612 = ~int(_2586);
    int _2614 = _2612 + 1;
    float _2616 = _2536 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2618 = !_2588;
    int _2620 = _2618 ? _2568 : (-1);
    float _2622 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _2624 = uint(int(uint(_2596) >> uint(31)));
    int _2626 = _2608 ^ _2614;
    float _2628 = float(_2620);
    int _2630 = ~int(_2624);
    int _2632 = _2630 + 1;
    int _2634 = ~_2614;
    int _2636 = _2634 + _2626;
    int _2638 = _2636 + 1;
    float _2640 = fma(_2616, _2628, _603);
    bool _2642 = !_2322;
    int _2644 = _2642 ? _2580 : (-1);
    float _2646 = rsqrt(_2610);
    int _2648 = _2602 ^ _2632;
    float _2650 = float(_2644);
    float _2652 = _2594 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2654 = ~_2632;
    int _2656 = _2654 + _2648;
    int _2658 = _2656 + 1;
    float _2660 = _2320 + 0.5;
    bool _2662 = !_2592;
    int _2664 = _2662 ? _2638 : (-1);
    float _2666 = fma(_2652, _2650, _689);
    bool _2668 = !_2492;
    int _2670 = _2668 ? _2658 : (-1);
    float _2672 = fma(_2616, _2660, _2640);
    float _2674 = float(_2664);
    float _2676 = _2442 + 0.5;
    float _2678 = float(_2670);
    float _2680 = _2622 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2682 = -_1153;
    float _2684 = fma(_2320, _2682, _2672);
    float _2686 = -_675;
    float _2688 = fma(_2590, _2674, _2686);
    float _2690 = _2418 + (-0.5);
    float _2692 = fma(_2652, _2676, _2666);
    float _2694 = _2420 * _2646;
    float _2696 = -_691;
    float _2698 = fma(_2680, _2678, _2696);
    float _2700 = _2306 + (-0.5);
    float _2702 = -_2590;
    float _2704 = fma(_2702, _2690, _2688);
    float _2706 = -_2344;
    float _2708 = _2694 * _2706;
    float _2710 = -_2348;
    float _2712 = _2694 * _2710;
    float _2714 = -_2350;
    float _2716 = _2694 * _2714;
    float _2718 = -_2680;
    float _2720 = fma(_2718, _2700, _2698);
    float _2722 = fma(_2646, _2240, _2708);
    float _2724 = fma(_2646, _2244, _2712);
    float _2726 = -_1149;
    float _2728 = fma(_2442, _2726, _2692);
    float _2730 = fma(_2646, _2246, _2716);
    float _2732 = _2348 + _2458;
    float _2734 = fma(_2418, _1163, _2704);
    float _2736 = fma(_2306, _1173, _2720);
    float _2738 = _2344 + _2494;
    float _2740 = _2350 + _2496;
    out.m_88.x = _2724;
    out.m_88.y = _2722;
    out.m_88.z = _2730;
    bool _2742 = _2572 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2744 = isnan(_2572);
    bool _2746 = _2742 || _2744;
    bool _2748 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2750 = _2746 || _2748;
    out.m_90.x = _2684;
    out.m_90.y = _2734;
    out.m_90.z = _2728;
    out.m_90.w = _2736;
    out.m_92.x = _1133;
    out.m_92.y = _1135;
    out.m_92.z = _1137;
    out.m_94.x = _2732;
    out.m_94.y = _2738;
    out.m_94.z = _2740;
    float _2752 = _2610;
    float _2754 = as_type<float>(_2514);
    float _2756 = as_type<float>(_2638);
    if (!_2750)
    {
        _1211 = 1.0;
    }
    float _2758 = _1211;
    bool _2760 = !_2750;
    float _2762 = _2758;
    if (!_2760)
    {
        bool _2764 = _2572 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2766 = isnan(_2572);
        bool _2768 = _2764 || _2766;
        bool _2770 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2772 = _2768 || _2770;
        if (!_2772)
        {
            float _2774 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2776 = _2572 + _2774;
            float _2778 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2780 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2778;
            float _2782 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2784 = _2782 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2786 = 1.0 / _2780;
            float _2788 = _2776 * _2786;
            float _2790 = fma(_2788, _2784, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2762 = _2790;
            _2792 = true;
        }
        else
        {
            bool _2794 = _2572 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2796 = isnan(_2572);
            bool _2798 = _2794 || _2796;
            bool _2800 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2802 = _2798 || _2800;
            if (!_2802)
            {
                float _2804 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2806 = _2572 + _2804;
                float _2808 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2810 = _2808 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2812 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2814 = _2812 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2816 = 1.0 / _2810;
                float _2818 = _2806 * _2816;
                float _2820 = fma(_2818, _2814, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2762 = _2820;
                _2792 = true;
            }
            else
            {
                _2762 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2792 = false;
    float _2822 = _2762;
    float _2824 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2826 = _2404 + _2824;
    float _2828 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2830 = _1119 + _2828;
    float _2832 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2834 = _1123 + _2832;
    float _2836 = fma(_2826, _2822, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2838 = fma(_2830, _2822, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2840 = fma(_2834, _2822, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2842 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2844 = _2836 + _2842;
    float _2846 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2848 = _2838 + _2846;
    float _2850 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2852 = _2840 + _2850;
    float _2854 = _2844 * _2844;
    float _2856 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2858 = fma(_2848, _2848, _2854);
    float _2860 = _1081 + _2856;
    float _2862 = fma(_2852, _2852, _2858);
    float _2864 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2866 = rsqrt(_2862);
    float _2868 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2864);
    float _2870 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2868);
    float _2872 = sqrt(_2862);
    float _2874 = _2870 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2876 = _2866 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2878 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2880 = _2848 * _2876;
    float _2882 = _2852 * _2876;
    float _2884 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2878);
    float _2886 = _2880 * _2880;
    float _2888 = _2882 * _2882;
    float _2890 = 1.0 / _2874;
    float _2892 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2884);
    float _2894 = _2886 + _2888;
    float _2896 = _2892 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2898 = sqrt(_2894);
    float _2900 = _2896 + _2874;
    float _2902 = _2860 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2904 = _2900 * _2890;
    float _2906 = _2904 * 0.5;
    float _2908 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2910 = fma(_2906, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2908);
    float _2912 = fma(_991, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2914 = _2860 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    bool _2916 = _2898 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2918 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2920 = _2898 + _2918;
    float _2922 = 1.0 / _2910;
    float _2924 = fma(_991, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2914);
    float _2926 = fma(_993, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2924);
    float _2928 = floor(_2912);
    float _2930 = _2926 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2932 = _1135;
    int _2934 = 2;
    float _2936 = _2876;
    float _2938 = _2880;
    float _2940 = _2886;
    float _2942 = _2826;
    int _2944 = as_type<int>(_2888);
    if (_2916)
    {
        float _2946 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2932 = _2946;
    }
    float _2948 = _2932;
    float _2950 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2952 = _2922 * _2950;
    float _2954 = fma(_991, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2902);
    bool _2956 = _2952 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2958 = fma(_993, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2954);
    bool _2960 = _2952 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2962 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2964 = trunc(_2930);
    int _2966 = int(_2964);
    float _2968 = _2958 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2970 = -_2928;
    float _2972 = _2912 + _2970;
    float _2974 = precise::max(0.0, _2962);
    float _2976 = _2958;
    int _2978 = as_type<int>(_2968);
    if (_2916)
    {
        float _2980 = _2920 * _2948;
        _2976 = _2980;
    }
    float _2982 = _2976;
    float _2984 = trunc(_2968);
    int _2986 = int(_2984);
    if (!_2956)
    {
        _2934 = 1;
    }
    int _2988 = _2934;
    int _2990 = _2988;
    if (_2916)
    {
        float _2992 = _2982 * 0.15915493667125701904296875;
        _1085 = _2992;
    }
    float _2994 = _1085;
    bool _2996 = !_2956;
    int _2998 = _2996 ? 0 : 1;
    float _3000 = -_2876;
    float _3002 = -_2974;
    float _3004 = fma(_2844, _3000, _3002);
    if (!_2960)
    {
        _2990 = _2998;
    }
    int _3006 = _2990;
    float _3008 = _2926;
    float _3010 = as_type<float>(_3006);
    if (_2916)
    {
        float _3012 = _2994 * 6.283185482025146484375;
        float _3014 = sin(_3012);
        _3008 = _3014;
    }
    float _3016 = _3008;
    if (_2916)
    {
        float _3018 = _3004 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2936 = _3018;
    }
    float _3020 = _2936;
    int _3022 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _3024 = _2966 + _3022;
    int _3026 = _3024 + 1;
    int _3028 = _3006 << 6;
    int _3030 = _3028 + 48;
    uint _3032 = uint(int(uint(_3030) >> uint(2)));
    uint _3034 = uint(int(uint(int(_3032)) >> uint(2)));
    int _3036 = int(_3032) & 3;
    float _3038 = (*spvDescriptorSet0.vp_c15)._m0[int(_3034)][_3036];
    int _3040 = int(_3032) + 1;
    uint _3042 = uint(int(uint(_3040) >> uint(2)));
    int _3044 = _3040 & 3;
    float _3046 = (*spvDescriptorSet0.vp_c15)._m0[int(_3042)][_3044];
    float _3048 = _2894;
    if (_2916)
    {
        float _3050 = rsqrt(_2894);
        _3048 = _3050;
    }
    float _3052 = _3048;
    int _3054 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3056 = _2986 + _3054;
    int _3058 = _3056 + 1;
    float _3060 = fma(_993, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    bool _3062 = _3026 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _3064 = _3026 | _3058;
    int _3066 = _3028 + 96;
    uint _3068 = uint(int(uint(_3066) >> uint(2)));
    uint _3070 = uint(int(uint(int(_3068)) >> uint(2)));
    int _3072 = int(_3068) & 3;
    float _3074 = (*spvDescriptorSet0.vp_c15)._m0[int(_3070)][_3072];
    int _3076 = int(_3068) + 1;
    uint _3078 = uint(int(uint(_3076) >> uint(2)));
    int _3080 = _3076 & 3;
    float _3082 = (*spvDescriptorSet0.vp_c15)._m0[int(_3078)][_3080];
    if (_2916)
    {
        float _3084 = fma(_3016, _3020, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2752 = _3084;
    }
    float _3086 = _2752;
    float _3088 = _2994;
    float _3090 = _3086;
    if (_2916)
    {
        float _3092 = _2994 * 6.283185482025146484375;
        float _3094 = cos(_3092);
        _3088 = _3094;
    }
    float _3096 = _3088;
    bool _3098 = _3064 < 0;
    bool _3100 = _3098 || _3062;
    float _3102 = _2836 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _3104 = _3058 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3106 = _3104 || _3100;
    int _3108 = _3028 + 56;
    uint _3110 = uint(int(uint(_3108) >> uint(2)));
    uint _3112 = uint(int(uint(int(_3110)) >> uint(2)));
    int _3114 = int(_3110) & 3;
    float _3116 = (*spvDescriptorSet0.vp_c15)._m0[int(_3112)][_3114];
    int _3118 = int(_3110) + 1;
    uint _3120 = uint(int(uint(_3118) >> uint(2)));
    int _3122 = _3118 & 3;
    float _3124 = (*spvDescriptorSet0.vp_c15)._m0[int(_3120)][_3122];
    float _3126 = _3052;
    if (_2916)
    {
        float _3128 = _3052 * _3086;
        _2754 = _3128;
    }
    float _3130 = _2754;
    float _3132 = fma(_2838, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3102);
    if (!_2916)
    {
        _3090 = _3004;
    }
    float _3134 = _3090;
    float _3136 = floor(_3060);
    float _3138 = _3134;
    if (_2916)
    {
        float _3140 = _2880 * _3130;
        _2938 = _3140;
    }
    float _3142 = _2938;
    float _3144 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3132);
    int _3146 = _3028 + 104;
    uint _3148 = uint(int(uint(_3146) >> uint(2)));
    uint _3150 = uint(int(uint(int(_3148)) >> uint(2)));
    int _3152 = int(_3148) & 3;
    float _3154 = (*spvDescriptorSet0.vp_c15)._m0[int(_3150)][_3152];
    int _3156 = int(_3148) + 1;
    uint _3158 = uint(int(uint(_3156) >> uint(2)));
    int _3160 = _3156 & 3;
    float _3162 = (*spvDescriptorSet0.vp_c15)._m0[int(_3158)][_3160];
    if (_2916)
    {
        float _3164 = _3142 * _3142;
        _2940 = _3164;
    }
    float _3166 = _2940;
    float _3168 = _3096;
    if (_2916)
    {
        float _3170 = _3096 + (-1.0);
        _3126 = _3170;
    }
    float _3172 = _3126;
    float _3174 = _3172;
    if (!_3106)
    {
        float _3176 = floor(_2968);
        _2756 = _3176;
    }
    float _3178 = _2756;
    if (_2916)
    {
        float _3180 = _3172 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2942 = _3180;
    }
    float _3182 = _2942;
    if (!_2916)
    {
        _3174 = _2882;
    }
    float _3184 = _3174;
    int _3186 = _3028 + 64;
    uint _3188 = uint(int(uint(_3186) >> uint(2)));
    uint _3190 = uint(int(uint(int(_3188)) >> uint(2)));
    int _3192 = int(_3188) & 3;
    float _3194 = (*spvDescriptorSet0.vp_c15)._m0[int(_3190)][_3192];
    int _3196 = int(_3188) + 1;
    uint _3198 = uint(int(uint(_3196) >> uint(2)));
    int _3200 = _3196 & 3;
    float _3202 = (*spvDescriptorSet0.vp_c15)._m0[int(_3198)][_3200];
    float _3204 = _3184;
    if (_2916)
    {
        float _3206 = _2882 * _3130;
        _3204 = _3206;
    }
    float _3208 = _3204;
    if (_2916)
    {
        float _3210 = fma(_3004, _3096, _3182);
        _3138 = _3210;
    }
    float _3212 = _3138;
    if (!_2916)
    {
        _3168 = _2888;
    }
    float _3214 = _3168;
    float _3216 = _3214;
    if (!_3106)
    {
        int _3218 = _3058 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3220 = _3218 + _3026;
        _2944 = _3220;
    }
    int _3222 = _2944;
    if (_2916)
    {
        float _3224 = _3208 * _3208;
        _3216 = _3224;
    }
    float _3226 = _3216;
    float _3228 = fma(_3212, _3212, _3166);
    float _3230 = _3144 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _3232 = _3028 + 80;
    uint _3234 = uint(int(uint(_3232) >> uint(2)));
    uint _3236 = uint(int(uint(int(_3234)) >> uint(2)));
    int _3238 = int(_3234) & 3;
    float _3240 = (*spvDescriptorSet0.vp_c15)._m0[int(_3236)][_3238];
    int _3242 = int(_3234) + 1;
    uint _3244 = uint(int(uint(_3242) >> uint(2)));
    int _3246 = _3242 & 3;
    float _3248 = (*spvDescriptorSet0.vp_c15)._m0[int(_3244)][_3246];
    float _3250 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3252 = _3228 + _3226;
    float _3254 = _3230 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3256 = -_3136;
    float _3258 = _3060 + _3256;
    int _3260 = _3028 + 72;
    uint _3262 = uint(int(uint(_3260) >> uint(2)));
    uint _3264 = uint(int(uint(int(_3262)) >> uint(2)));
    int _3266 = int(_3262) & 3;
    float _3268 = (*spvDescriptorSet0.vp_c15)._m0[int(_3264)][_3266];
    int _3270 = int(_3262) + 1;
    uint _3272 = uint(int(uint(_3270) >> uint(2)));
    int _3274 = _3270 & 3;
    float _3276 = (*spvDescriptorSet0.vp_c15)._m0[int(_3272)][_3274];
    float _3278 = _2860 * _3046;
    float _3280 = -_3254;
    float _3282 = fma(_3280, _3250, 1.0);
    float _3284 = rsqrt(_3252);
    float _3286 = fma(_991, _3038, _3278);
    int _3288 = _3028 + 88;
    uint _3290 = uint(int(uint(_3288) >> uint(2)));
    uint _3292 = uint(int(uint(int(_3290)) >> uint(2)));
    int _3294 = int(_3290) & 3;
    float _3296 = (*spvDescriptorSet0.vp_c15)._m0[int(_3292)][_3294];
    int _3298 = int(_3290) + 1;
    uint _3300 = uint(int(uint(_3298) >> uint(2)));
    int _3302 = _3298 & 3;
    float _3304 = (*spvDescriptorSet0.vp_c15)._m0[int(_3300)][_3302];
    float _3306 = _2860 * _3082;
    float _3308 = fma(_991, _3074, _3306);
    float _3310 = fma(_993, _3116, _3286);
    float _3312 = _3284 * _3142;
    float _3314 = _3284 * _3212;
    float _3316 = _3284 * _3208;
    float _3318 = _3312 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3320 = fma(_993, _3154, _3308);
    float _3322 = _3310 + _3124;
    float _3324 = _2836 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3326 = -_3318;
    float _3328 = fma(_3314, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3326);
    float _3330 = _3320 + _3162;
    float _3332 = _2836 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3334 = fma(_2838, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3324);
    float _3336 = -_3316;
    float _3338 = fma(_3336, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3328);
    float _3340 = _2860 * _3202;
    float _3342 = _3202;
    int _3344 = as_type<int>((*spvDescriptorSet0.vp_c15)._m0[23].w);
    int _3346 = as_type<int>(_3074);
    if (!_3106)
    {
        float _3348 = -_3178;
        float _3350 = _2968 + _3348;
        _3342 = _3350;
    }
    float _3352 = _3342;
    float _3354 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3356 = fma(_2872, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3354);
    float _3358 = precise::clamp(_3356, 0.0, 1.0);
    float _3360 = 1.0 / _3330;
    float _3362 = fma(_991, _3194, _3340);
    float _3364 = fma(_2838, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3332);
    float _3366 = -_3358;
    float _3368 = _3366 + 1.0;
    if (!_3106)
    {
        int _3370 = _3222 << 2;
        _2978 = _3370;
    }
    int _3372 = _2978;
    float _3374 = _2860 * _3248;
    float _3376 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3364);
    int _3378 = _3372;
    if (!_3106)
    {
        uint _3380 = uint(int(uint(_3222) >> uint(2)));
        _3344 = int(_3380);
    }
    int _3382 = _3344;
    float _3384 = abs(_3368);
    float _3386 = log2(_3384);
    float _3388 = fma(_991, _3240, _3374);
    if (!_3106)
    {
        int _3390 = 12 & _3372;
        _3378 = _3390;
    }
    int _3392 = _3378;
    float _3394 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3334);
    float _3396 = fma(_993, _3268, _3362);
    float _3398 = _3394;
    if (!_3106)
    {
        int _3400 = _3382 << 4;
        int _3402 = _3400 + _3392;
        _3346 = _3402;
    }
    int _3404 = _3346;
    float _3406 = _3322 * _3360;
    float _3408 = _3396 + _3276;
    float _3410 = _2836 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3412 = as_type<float>(_3382);
    if (!_3106)
    {
        int _3414 = _3404 + 400;
        uint _3416 = uint(int(uint(_3414) >> uint(2)));
        uint _3418 = uint(int(uint(int(_3416)) >> uint(2)));
        int _3420 = int(_3416) & 3;
        float _3422 = (*spvDescriptorSet0.vp_c15)._m0[int(_3418)][_3420];
        _3412 = _3422;
    }
    float _3424 = _3412;
    bool _3426 = _3406 >= 0.0;
    float _3428 = fma(_2838, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3410);
    float _3430 = fma(_993, _3296, _3388);
    float _3432 = _3386 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3434 = _3408 * _3360;
    float _3436 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3428);
    float _3438 = _3376 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _3440 = _3406 <= 1.0;
    bool _3442 = _3440 && _3426;
    float _3444 = exp2(_3432);
    float _3446 = _3436 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3448 = _3438 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _3450 = _3434 >= 0.0;
    bool _3452 = _3450 && _3442;
    float _3454 = fma(_3338, -0.5, 0.5);
    float _3456 = fma(_3338, 0.5, 0.5);
    float _3458 = fma(_3446, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3448);
    bool _3460 = _3434 <= 1.0;
    bool _3462 = _3460 && _3452;
    float _3464 = log2(_3282);
    float _3466 = fma(_3456, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3468 = fma(_3230, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3458);
    float _3470 = _3430 + _3304;
    float _3472 = _3314 + 1.0;
    float _3474 = fma(_3456, _3466, -0.212114393711090087890625);
    float _3476 = _3438 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3478 = _3438 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3480 = sqrt(_3454);
    float _3482 = _3394 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3484 = -_3314;
    float _3486 = fma(_3444, _3472, _3484);
    float _3488 = fma(_3456, _3474, 1.570728778839111328125);
    float _3490 = fma(_3446, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3476);
    if (_3462)
    {
        float _3492 = float(_3006);
        _3010 = _3492;
    }
    float _3494 = _3010;
    float _3496 = fma(_3446, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3478);
    float _3498 = _3470 * _3360;
    float _3500 = _3432;
    if (!_3106)
    {
        float _3502 = floor(_2930);
        _3500 = _3502;
    }
    float _3504 = _3500;
    float _3506 = fma(_3482, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3468);
    float _3508 = fma(_3230, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3490);
    float _3510 = fma(_3230, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3496);
    float _3512 = _3464 * 0.693147182464599609375;
    float _3514 = fma(_3482, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3508);
    float _3516 = fma(_3482, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3510);
    float _3518 = 1.0 / _3506;
    float _3520 = _3480 * 0.636619746685028076171875;
    float2 _9380 = float2(_2972, _3258);
    float _3522 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9380, float2(0.0), isnan(_9380)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9380, float2(0.0), isnan(_9380)), level(0.0)).x;
    float _3524 = _3512 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3526 = fma(_3486, 0.5, 0.5);
    float _3528 = -_3488;
    float _3530 = fma(_3520, _3528, 1.0);
    float _3532 = _3490;
    float _3534 = _3516;
    if (_3462)
    {
        float _3536 = rint(_3494);
        float _3538 = precise::max(_3536, 0.0);
        uint _3540 = uint(_3538);
        uint _3542 = clamp(_3540, 0u, 65535u);
        _3532 = as_type<float>(_3542);
    }
    float _3544 = _3532;
    if (!_3106)
    {
        float _3546 = -_3504;
        float _3548 = _2930 + _3546;
        _3398 = _3548;
    }
    float _3550 = _3398;
    float _3552 = _3516 * _3518;
    float _3554 = _3514 * _3518;
    float _3556 = _3360;
    if (!_3106)
    {
        float _3558 = rint(_3424);
        float _3560 = precise::max(_3558, 0.0);
        uint _3562 = uint(_3560);
        uint _3564 = clamp(_3562, 0u, 65535u);
        _3556 = as_type<float>(_3564);
    }
    float _3566 = _3556;
    float _3568 = fma(_3552, 0.5, 0.5);
    float _3570 = fma(_3554, -0.5, 0.5);
    float _3572 = _3544;
    if (_3462)
    {
        float3 _9460 = float3(_3406, _3434, float(as_type<int>(_3544)));
        float3 _9464 = select(_9460, float3(0.0), isnan(_9460));
        float _3574 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9464.xy, uint(rint(_9464.z)), _3498, level(0.0));
        _3572 = _3574;
    }
    float _3576 = _3572;
    float3 _9474 = float3(_3568, _3570, _3524);
    float _3578 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9474, float3(0.0), isnan(_9474)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9474, float3(0.0), isnan(_9474)), level(0.0)).x;
    float3 _9483 = float3(_3568, _3570, _3524);
    float4 _3581 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9483, float3(0.0), isnan(_9483)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9483, float3(0.0), isnan(_9483)), level(0.0)).xyzw;
    float _3583 = _3581.x;
    float _3585 = _3581.y;
    float _3587 = _3581.z;
    float _3589 = _3581.w;
    float2 _9499 = float2(_3530, _3526);
    float3 _3591 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9499, float2(0.0), isnan(_9499)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9499, float2(0.0), isnan(_9499)), level(0.0)).xyz;
    float _3593 = _3591.x;
    float _3595 = _3591.y;
    float _3597 = _3591.z;
    float _3599 = _3566;
    if (!_3106)
    {
        float3 _9520 = float3(_3550, _3352, float(as_type<int>(_3566)));
        float3 _9522 = select(_9520, float3(0.0), isnan(_9520));
        float _3601 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9522.xy, uint(rint(_9522.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9522.xy, uint(rint(_9522.z)), level(0.0)).x;
        _3599 = _3601;
    }
    float _3603 = _3599;
    float _3605 = abs(_2952);
    float _3607 = log2(_3605);
    bool _3609 = _2952 <= 8000.0;
    bool _3611 = isnan(_2952);
    bool _3613 = _3609 || _3611;
    bool _3615 = isnan(8000.0);
    bool _3617 = _3613 || _3615;
    float _3619 = float(_3617);
    float _3621 = _3607 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3623 = _3438 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3625 = fma(_3446, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3623);
    float _3627 = exp2(_3621);
    float _3629 = _3386 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3631 = fma(_3230, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3625);
    float _3633 = fma(_3482, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3631);
    float _3635 = exp2(_3629);
    out.gl_Position.x = _3516;
    out.gl_Position.y = _3514;
    out.gl_Position.z = _3633;
    out.gl_Position.w = _3506;
    float _3637 = fma(_3627, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3639 = precise::clamp(_3637, 0.0, 1.0);
    float _3641 = fma(_3639, -2.0, 3.0);
    float _3643 = _3639 * _3639;
    float _3645 = _3643 * _3641;
    float _3647 = -_3645;
    float _3649 = _3647 + 1.0;
    float _3651 = fma(_3649, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3645);
    float _3653 = _3619 * _3651;
    float _3655 = _3619;
    float _3657 = _3633;
    if (!_3462)
    {
        _3655 = 1.0;
    }
    float _3659 = _3655;
    float _3661 = _3653 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3663 = -_3635;
    float _3665 = _3663 + 1.0;
    float _3667 = -_3522;
    float _3669 = _3667 + 1.0;
    float _3671 = _3669 * _3661;
    float _3673 = precise::clamp(_3671, 0.0, 1.0);
    float _3675 = _3659;
    float _3677 = _3665;
    float _3679 = _3661;
    if (_3462)
    {
        bool _3681 = _3576 >= _3498;
        bool _3683 = isnan(_3576);
        bool _3685 = _3681 || _3683;
        bool _3687 = isnan(_3498);
        bool _3689 = _3685 || _3687;
        float _3691 = float(_3689);
        _3675 = _3691;
    }
    float _3693 = _3675;
    float _3695 = _3665 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_3106)
    {
        _3677 = 1.0;
    }
    float _3697 = _3677;
    float _3699 = _3697;
    if (!_3106)
    {
        int _3701 = _3222 << 4;
        int _3703 = _3701 + 2048;
        uint _3705 = uint(int(uint(_3703) >> uint(2)));
        uint _3707 = uint(int(uint(int(_3705)) >> uint(2)));
        int _3709 = int(_3705) & 3;
        float _3711 = (*spvDescriptorSet0.vp_c15)._m0[int(_3707)][_3709];
        int _3713 = int(_3705) + 1;
        uint _3715 = uint(int(uint(_3713) >> uint(2)));
        int _3717 = _3713 & 3;
        float _3719 = (*spvDescriptorSet0.vp_c15)._m0[int(_3715)][_3717];
        int _3721 = _3703 + 8;
        uint _3723 = uint(int(uint(_3721) >> uint(2)));
        uint _3725 = uint(int(uint(int(_3723)) >> uint(2)));
        int _3727 = int(_3723) & 3;
        float _3729 = (*spvDescriptorSet0.vp_c15)._m0[int(_3725)][_3727];
        int _3731 = int(_3723) + 1;
        uint _3733 = uint(int(uint(_3731) >> uint(2)));
        int _3735 = _3731 & 3;
        float _3737 = (*spvDescriptorSet0.vp_c15)._m0[int(_3733)][_3735];
        float _3739 = _2860 * _3719;
        float _3741 = fma(_991, _3711, _3739);
        float _3743 = fma(_993, _3729, _3741);
        float _3745 = _3743 + _3737;
        float _3747 = precise::clamp(_3745, 0.0, 1.0);
        float _3749 = -_3747;
        float _3751 = _3749 + _3603;
        float _3753 = fma(_3751, 500.0, 1.5);
        float _3755 = exp2(_3753);
        float _3757 = 0.0 + _3755;
        float _3759 = precise::clamp(_3757, 0.0, 1.0);
        _3699 = _3759;
        _3534 = _3729;
    }
    float _3761 = _3699;
    float _3763 = _3534;
    float _3765 = _3693 * _3761;
    float _3767 = _3695 * _3578;
    float _3769 = -_3673;
    float _3771 = fma(_3769, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3773 = -_3695;
    float _3775 = _3773 + 1.0;
    out.m_96.x = _2838;
    out.m_96.y = _2836;
    out.m_96.z = _2840;
    float _3777 = _3589 * _3767;
    float _3779 = -_3765;
    float _3781 = fma(_3779, _3771, 1.0);
    float _3783 = precise::clamp(_3781, 0.0, 1.0);
    float _3785 = _3597 * _3767;
    float _3787 = _3589 * _3775;
    float _3789 = fma(_3593, _3777, _3583);
    float _3791 = fma(_3595, _3777, _3585);
    float _3793 = _3783 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3795 = fma(_3589, _3785, _3587);
    bool _3797 = _2872 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3799 = isnan(_2872);
    bool _3801 = _3797 || _3799;
    bool _3803 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3805 = _3801 || _3803;
    out.m_98.x = _3793;
    out.m_100.x = _3789;
    out.m_100.y = _3791;
    out.m_100.z = _3795;
    out.m_100.w = _3787;
    float _3807 = _3763;
    float _3809 = _3777;
    float _3811 = _3771;
    float _3813 = _3783;
    if (!_3805)
    {
        _3657 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3815 = _3657;
    float _3817 = _3815;
    float _3819 = _3815;
    if (!_3805)
    {
        _3807 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3821 = _3807;
    float _3823 = _3821;
    float _3825 = _3821;
    if (!_3805)
    {
        _3679 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3827 = _3679;
    float _3829 = _3827;
    float _3831 = _3827;
    if (!_3805)
    {
        _3809 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3833 = _3809;
    float _3835 = _3833;
    float _3837 = _3833;
    if (!_3805)
    {
        _3811 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3839 = _3811;
    float _3841 = _3839;
    float _3843 = _3839;
    if (!_3805)
    {
        _3813 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3845 = _3813;
    bool _3847 = !_3805;
    float _3849 = _3845;
    float _3851 = _3845;
    if (!_3847)
    {
        bool _3853 = _2872 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3855 = isnan(_2872);
        bool _3857 = _3853 || _3855;
        bool _3859 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3861 = _3857 || _3859;
        if (!_3861)
        {
            float _3863 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3865 = _2872 + _3863;
            float _3867 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3869 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3867;
            float _3871 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3873 = _3871 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3875 = 1.0 / _3869;
            float _3877 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3879 = _3877 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3881 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3883 = _3881 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3885 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3887 = _3885 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3889 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3891 = _3889 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3893 = _3865 * _3875;
            float _3895 = precise::clamp(_3893, 0.0, 1.0);
            float _3897 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3899 = _3897 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3901 = fma(_3895, _3873, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3903 = fma(_3895, _3899, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3905 = fma(_3895, _3879, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3907 = fma(_3895, _3883, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3909 = fma(_3895, _3887, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3911 = fma(_3895, _3891, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3825 = _3905;
            _3843 = _3909;
            _3819 = _3901;
            _3837 = _3907;
            _3831 = _3903;
            _3851 = _3911;
            _3913 = true;
        }
        else
        {
            bool _3915 = _2872 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3917 = isnan(_2872);
            bool _3919 = _3915 || _3917;
            bool _3921 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3923 = _3919 || _3921;
            if (!_3923)
            {
                _3817 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3925 = _3817;
            _3819 = _3925;
            if (!_3923)
            {
                _3823 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3927 = _3823;
            _3825 = _3927;
            if (!_3923)
            {
                _3829 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3929 = _3829;
            _3831 = _3929;
            if (!_3923)
            {
                _3835 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3931 = _3835;
            _3837 = _3931;
            if (!_3923)
            {
                _3841 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3933 = _3841;
            _3843 = _3933;
            if (!_3923)
            {
                _3849 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3935 = _3849;
            bool _3937 = !_3923;
            _3851 = _3935;
            if (!_3937)
            {
                bool _3939 = _2872 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3941 = isnan(_2872);
                bool _3943 = _3939 || _3941;
                bool _3945 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3947 = _3943 || _3945;
                if (!_3947)
                {
                    float _3949 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3951 = _2872 + _3949;
                    float _3953 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3955 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3953;
                    float _3957 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3959 = _3957 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3961 = 1.0 / _3955;
                    float _3963 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3965 = _3963 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3967 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3969 = _3967 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3971 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3973 = _3971 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3975 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3977 = _3975 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3979 = _3951 * _3961;
                    float _3981 = precise::clamp(_3979, 0.0, 1.0);
                    float _3983 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3985 = _3983 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3987 = fma(_3981, _3959, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3989 = fma(_3981, _3985, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3991 = fma(_3981, _3965, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3993 = fma(_3981, _3969, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3995 = fma(_3981, _3973, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3997 = fma(_3981, _3977, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3825 = _3991;
                    _3843 = _3995;
                    _3819 = _3987;
                    _3837 = _3993;
                    _3831 = _3989;
                    _3851 = _3997;
                    _3913 = true;
                }
                else
                {
                    _3825 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3843 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3819 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3837 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3831 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3851 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3913 = false;
    float _3999 = _3825;
    float _4001 = _3843;
    float _4003 = _3819;
    float _4005 = _3837;
    float _4007 = _3831;
    float _4009 = _3851;
    float _4011 = fma(_2738, -0.5, 0.5);
    float _4013 = precise::clamp(_4011, 0.0, 1.0);
    float _4015 = -_3999;
    float _4017 = _4015 + _4001;
    float _4019 = -_4003;
    float _4021 = _4019 + _4005;
    float _4023 = -_4007;
    float _4025 = _4023 + _4009;
    bool _4027 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4029 = fma(_4013, _4017, _3999);
    float _4031 = fma(_4013, _4021, _4003);
    float _4033 = fma(_4013, _4025, _4007);
    float _4035 = _4029 * 0.586610972881317138671875;
    out.m_63.x = 1.0;
    float _4037 = fma(_4031, 0.298911988735198974609375, _4035);
    float _4039 = fma(_4033, 0.114477999508380889892578125, _4037);
    out.m_102.x = 0.0;
    float _4041 = -_4039;
    float _4043 = _4031 + _4041;
    float _4045 = -_4039;
    float _4047 = _4029 + _4045;
    float _4049 = -_4039;
    float _4051 = _4033 + _4049;
    float _4053 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4055 = fma(_4043, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4039);
    float _4057 = fma(_4047, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4039);
    float _4059 = fma(_4051, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4039);
    out.m_98.w = _4053;
    out.m_104.x = _4055;
    out.m_104.y = _4057;
    out.m_104.z = _4059;
    if (!_4027)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4061 = -_2836;
    float _4063 = _4061 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4065 = -_2838;
    float _4067 = _4065 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4069 = -_2840;
    float _4071 = _4069 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4073 = _4063 * _4063;
    float _4075 = fma(_4067, _4067, _4073);
    float _4077 = fma(_4071, _4071, _4075);
    float _4079 = sqrt(_4077);
    float _4081 = rsqrt(_4077);
    float _4083 = -_4079;
    float _4085 = _4083 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4087 = _4085 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4089 = precise::clamp(_4087, 0.0, 1.0);
    float _4091 = _4067 * _4081;
    float _4093 = _4063 * _4081;
    float _4095 = abs(_4089);
    float _4097 = log2(_4095);
    float _4099 = _4071 * _4081;
    float _4101 = _4091 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4103 = _2738 * _4093;
    float _4105 = -_4093;
    float _4107 = -_4101;
    float _4109 = fma(_4105, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4107);
    float _4111 = fma(_2732, _4091, _4103);
    float _4113 = -_4099;
    float _4115 = fma(_4113, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4109);
    float _4117 = fma(_2740, _4099, _4111);
    float _4119 = precise::clamp(_4117, 0.0, 1.0);
    float _4121 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4123 = _4115 + _4121;
    float _4125 = _4097 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4127 = _4123 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4129 = precise::clamp(_4127, 0.0, 1.0);
    float _4131 = exp2(_4125);
    float _4133 = _4131 * _4129;
    float _4135 = _4119 * _4133;
    float _4137 = _4135 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4139 = _4135 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4141 = _4135 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_102.x = _4137;
    out.m_102.y = _4139;
    out.m_102.z = _4141;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

