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
    texture2d_array<float> vp_t_tcb_14 [[id(17)]];
    sampler vp_t_tcb_14Smplr [[id(18)]];
    texture2d<float> vp_t_tcb_1C [[id(19)]];
    sampler vp_t_tcb_1CSmplr [[id(20)]];
    sampler vp_t_tcb_20Smplr_w [[id(21)]];
    sampler vp_t_tcb_24Smplr_w [[id(22)]];
    sampler vp_t_tcb_32Smplr_w [[id(23)]];
    sampler vp_t_tcb_30Smplr_w [[id(24)]];
    sampler vp_t_tcb_14Smplr_w [[id(25)]];
    sampler vp_t_tcb_1CSmplr_w [[id(26)]];
    constant dm_border_t* dm_border [[id(27)]];
};

struct main0_out
{
    float4 m_82 [[user(locn0)]];
    float4 m_90 [[user(locn2)]];
    float4 m_96 [[user(locn3)]];
    float4 m_104 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_88 [[user(locn6)]];
    float4 m_92 [[user(locn7)]];
    float4 m_94 [[user(locn8)]];
    float4 m_84 [[user(locn9)]];
    float4 m_102 [[user(locn10)]];
    float4 m_86 [[user(locn11)]];
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
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4007 = false;
    bool _2780 = false;
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
        float _4292 = as_type<float>(_139);
        out.gl_Position.z = _4292;
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
    float _159 = 0.0;
    float _161 = _157;
    if (_153)
    {
        float _163 = float(_123);
        _159 = _163;
    }
    float _165 = _159;
    bool _167 = _157 >= _165;
    bool _169 = !_153;
    bool _171 = _167 || _169;
    if (_171)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _173 = _133;
    if (_171)
    {
        out.m_63.x = 0.0;
    }
    if (_171)
    {
        float _175 = _173 * 5.0;
        _141 = as_type<int>(_175);
    }
    int _177 = _141;
    if (_171)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4361 = as_type<float>(_177);
        out.gl_Position.z = _4361;
    }
    if (_171)
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
    int _255 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _257 = _255 != 0;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _261 = _259 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _265 = 1.0 / _251;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _269 = _227 + _267;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _279 = _277 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _281 = _231 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _283 = float(_123);
    float _285 = 1.0 / _247;
    float _287 = _229 * 2.0;
    float _289 = _269 * _253;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _293 = _227 + _291;
    float _295 = fma(_281, -2.0, _271);
    float _297 = fma(_275, _289, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _299 = floor(_287);
    float _301 = _229 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _307 = -_263;
    float _309 = fma(_301, 2.0, _307);
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _313 = _227 + _311;
    float _315 = 1.0 / _261;
    float _317 = _233 * 2.0;
    float _319 = _313 * _265;
    float _321 = _293 * _285;
    float _323 = _233 + _229;
    float _325 = _229 + _231;
    float _327 = fma(_279, _321, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _329 = floor(_317);
    float _331 = _231 * 2.0;
    float _333 = _323 + (-1.0);
    float _335 = _325 + (-1.0);
    float _337 = _233 + _231;
    bool _339 = _299 > 0.0;
    float _341 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _343 = floor(_331);
    float _345 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _347 = _337 + (-1.0);
    float _349 = _239 * _315;
    bool _351 = _299 >= 0.0;
    bool _353 = isnan(_299);
    bool _355 = _351 || _353;
    bool _357 = isnan(0.0);
    bool _359 = _355 || _357;
    float _361 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _363 = as_type<int>(_347);
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[198].y;
    if (_257)
    {
        _363 = 0;
    }
    int _367 = _363;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _369;
    bool _373 = _329 > 0.0;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _377 = _375 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _379 = _329 >= 0.0;
    bool _381 = isnan(_329);
    bool _383 = _379 || _381;
    bool _385 = isnan(0.0);
    bool _387 = _383 || _385;
    float _389 = fma(_371, _289, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _391 = _367;
    if (!_257)
    {
        _391 = 1;
    }
    int _393 = _391;
    float _395 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _397 = int(_395);
    int _399 = _359 ? 0 : 1;
    float _401 = fma(_377, _321, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _403 = _343 > 0.0;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _407 = _343 >= 0.0;
    bool _409 = isnan(_343);
    bool _411 = _407 || _409;
    bool _413 = isnan(0.0);
    bool _415 = _411 || _413;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _419 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _421 = int(_419);
    float _423 = -_157;
    float _425 = fma(_423, (*spvDescriptorSet0.vp_c9)._m0[76].x, _309);
    int _427 = _387 ? 0 : 1;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _429;
    bool _433 = _393 != 1;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _435;
    int _439 = ~_399;
    int _441 = _439 + 1;
    int _443 = _441 + 1;
    float _445 = fma(_431, _319, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    int _447 = _443;
    float _449 = as_type<float>(_397);
    if (!_339)
    {
        int _451 = ~_399;
        int _453 = _451 + 1;
        _447 = _453;
    }
    int _455 = _447;
    float _457 = fma(_437, _319, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    int _459 = _415 ? 0 : 1;
    float _461 = 1.0 / _283;
    int _463 = ~_427;
    int _465 = _463 + 1;
    int _467 = _465 + 1;
    int _469 = _467;
    if (!_373)
    {
        int _471 = ~_427;
        int _473 = _471 + 1;
        _469 = _473;
    }
    int _475 = _469;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _479 = _477 != 0;
    int _481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _483 = _481 != 0;
    int _485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _487 = _485 != 0;
    int _489 = ~_459;
    int _491 = _489 + 1;
    int _493 = _491 + 1;
    int _495 = _493;
    if (!_403)
    {
        int _497 = ~_459;
        int _499 = _497 + 1;
        _495 = _499;
    }
    int _501 = _495;
    float _503 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _505 = log2(_503);
    bool _507 = !_483;
    int _509 = _507 ? 0 : 1;
    bool _511 = !_479;
    int _513 = _511 ? 0 : 1;
    bool _515 = !_487;
    int _517 = _515 ? 0 : 1;
    float _519 = _461 * _157;
    int _521 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _523 = _521 != 0;
    int _525 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _527 = _525 != 0;
    int _529 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _531 = _529 != 0;
    float _533 = float(_397);
    if (!_433)
    {
        _449 = _231;
    }
    float _535 = _449;
    float _537 = _535;
    if (_433)
    {
        _537 = _229;
    }
    float _539 = _537;
    bool _541 = !_523;
    float _543 = _541 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _545 = 1.0 / _533;
    float _547 = _543;
    if (!_433)
    {
        _365 = _231;
    }
    float _549 = _365;
    float _551 = _539 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _553 = abs(as_type<int>(_543));
    float _555 = _549;
    if (_433)
    {
        _555 = _229;
    }
    float _557 = _555;
    float _559 = -_303;
    float _561 = fma(_551, 2.0, _559);
    float _563 = float(_553);
    float _565 = _505 * _157;
    float _567 = float(_475);
    float _569 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[83].z, _305);
    float _571 = _557;
    if (!_433)
    {
        _571 = _233;
    }
    float _573 = _571;
    float _575 = _573;
    if (_433)
    {
        _575 = _231;
    }
    float _577 = _575;
    float _579 = _563 * _567;
    float _581 = exp2(_565);
    if (!_433)
    {
        _547 = _233;
    }
    float _583 = _547;
    float _585 = _577 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _587 = _583;
    if (_433)
    {
        _587 = _231;
    }
    float _589 = _587;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _593 = 1.0 + _591;
    float _595 = float(_421);
    float _597 = fma(_585, -2.0, _405);
    float _599 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[83].w, _417);
    float _601 = 1.0 / _595;
    float _603 = in.m_72.x;
    float _605 = in.m_72.y;
    float _607 = in.m_72.z;
    float _609 = _545 * _157;
    bool _611 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _613 = isnan(1.0);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _619 = _615 || _617;
    float _621 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[82].z, _569);
    bool _623 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _625 = isnan(0.0);
    bool _627 = _623 || _625;
    bool _629 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _631 = _627 || _629;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _635 = 1.0 / _593;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _639 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _641 = isnan(_227);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    float _651 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[78].z, _633);
    bool _653 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _655 = isnan(_227);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[78].w, _637);
    float _667 = -_581;
    float _669 = _667 + 1.0;
    float _671 = -_649;
    float _673 = _671 + 1.0;
    float _675 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[76].y, _295);
    float _677 = _601 * _157;
    float _679 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[77].z, _651);
    float _681 = _631 ? _669 : 0.0;
    float _683 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[82].w, _599);
    float _685 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[77].w, _665);
    float _687 = -_157;
    float _689 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[81].x, _561);
    float _691 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[81].y, _597);
    float _693 = _609;
    if (_619)
    {
        float _695 = _681 * _635;
        _161 = _695;
    }
    float _697 = _161;
    float _699 = _579 * (-2.0);
    bool _701 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _703 = isnan(_227);
    bool _705 = _701 || _703;
    bool _707 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _709 = _705 || _707;
    float _711 = float(_709);
    float _713 = _663 * _673;
    float _715 = -_663;
    float _717 = _715 + 1.0;
    bool _719 = !_527;
    int _721 = _719 ? 0 : 1;
    float _723 = fma(_345, _699, _345);
    float _725 = fma(_699, _603, _603);
    float _727 = _711 * _717;
    bool _729 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _731 = isnan(_227);
    bool _733 = _729 || _731;
    bool _735 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _737 = _733 || _735;
    float _739 = float(_737);
    float _741 = -_711;
    float _743 = _741 + 1.0;
    int _745 = abs(_721);
    bool _747 = !_531;
    int _749 = _747 ? 0 : 1;
    float _751 = _739 * _743;
    float _753 = float(_455);
    float _755 = -_739;
    float _757 = _755 + 1.0;
    float _759 = float(_745);
    bool _761 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _763 = isnan(_227);
    bool _765 = _761 || _763;
    bool _767 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _769 = _765 || _767;
    float _771 = float(_769);
    int _773 = abs(_749);
    float _775 = _229 + (-0.5);
    float _777 = _759 * _753;
    float _779 = _771 * _757;
    float _781 = float(_773);
    float _783 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[196].x, _725);
    float _785 = float(_501);
    float _787 = _777 * (-2.0);
    float _789 = _297 * _779;
    float _791 = _389 * _779;
    float _793 = -_771;
    float _795 = _793 + 1.0;
    float _797 = _781 * _785;
    float _799 = _231 + (-0.5);
    float _801 = fma(_787, _605, _605);
    float _803 = fma(_723, _697, _783);
    float _805 = fma(_361, _787, _361);
    float _807 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[143].y, _791);
    float _809 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[196].y, _801);
    float _811 = _803 * 0.15915493667125701904296875;
    float _813 = _797 * (-2.0);
    float _815 = fma(_401, _751, _807);
    float _817 = fma(_805, _697, _809);
    float _819 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[143].x, _789);
    float _821 = in.m_74.x;
    float _823 = in.m_74.y;
    float _825 = fma(_341, _813, _341);
    float _827 = fma(_813, _607, _607);
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _831 = _829 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _833 = _233 + (-0.5);
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _837 = _835 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _839 = fma(_327, _751, _819);
    float _841 = _817 * 0.15915493667125701904296875;
    float _843 = in.m_60.x;
    float _845 = in.m_60.y;
    float _847 = in.m_60.z;
    float _849 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[196].z, _827);
    float _851 = fma(_831, _349, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _853 = fma(_837, _349, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _855 = in.m_76.x;
    float _857 = in.m_76.y;
    float _859 = in.m_76.z;
    float _861 = in.m_76.w;
    float _863 = fma(_457, _727, _815);
    float _865 = fma(_445, _727, _839);
    float _867 = fma(_825, _697, _849);
    float _869 = _811 * 6.283185482025146484375;
    float _871 = cos(_869);
    float _873 = fma(_853, _713, _863);
    float _875 = fma(_851, _713, _865);
    float _877 = _867 * 0.15915493667125701904296875;
    float _879 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _881 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[147].y, _873);
    float _883 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[147].x, _875);
    float _885 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _887 = _841 * 6.283185482025146484375;
    float _889 = sin(_887);
    float _891 = _881 * _823;
    float _893 = _883 * _821;
    float _895 = _891 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _897 = _893 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _899 = _841 * 6.283185482025146484375;
    float _901 = cos(_899);
    float _903 = in.m_78.x;
    float _905 = in.m_78.y;
    float _907 = in.m_78.z;
    float _909 = in.m_78.w;
    float _911 = _895 * _879;
    float _913 = _897 * _885;
    float _915 = _845 * _857;
    float _917 = _811 * 6.283185482025146484375;
    float _919 = sin(_917);
    float _921 = fma(_843, _855, _915);
    float _923 = _871 * _889;
    float _925 = fma(_847, _859, _921);
    float _927 = _877 * 6.283185482025146484375;
    float _929 = cos(_927);
    float _931 = _871 * _901;
    float _933 = _877 * 6.283185482025146484375;
    float _935 = sin(_933);
    float _937 = _919 * _889;
    float _939 = _919 * _901;
    float _941 = _871 * _929;
    float _943 = _919 * _929;
    float _945 = _901 * _929;
    float _947 = _889 * _929;
    float _949 = _941 * _911;
    float _951 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _953 = _943 * _911;
    float _955 = fma(_935, _931, _937);
    float _957 = -_923;
    float _959 = fma(_935, _939, _957);
    float _961 = -_939;
    float _963 = fma(_935, _923, _961);
    float _965 = -_911;
    float _967 = _935 * _965;
    float _969 = fma(_955, _913, _949);
    float _971 = fma(_935, _937, _931);
    float _973 = fma(_945, _913, _967);
    float _975 = fma(_963, _951, _969);
    float _977 = _845 * _905;
    float _979 = fma(_959, _913, _953);
    float _981 = fma(_947, _951, _973);
    float _983 = _975 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _985 = _975 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _987 = fma(_843, _903, _977);
    float _989 = fma(_971, _951, _979);
    float _991 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[24].x, _983);
    float _993 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[26].x, _985);
    float _995 = fma(_847, _907, _987);
    float _997 = _925 + _861;
    float _999 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[24].z, _991);
    float _1001 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[26].z, _993);
    float _1003 = _995 + _909;
    float _1005 = _999 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1007 = _1001 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1009 = _997 + _1005;
    float _1011 = _1003 + _1007;
    float _1013 = in.m_80.x;
    float _1015 = in.m_80.y;
    float _1017 = in.m_80.z;
    float _1019 = in.m_80.w;
    float _1021 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1023 = _1009 + _1021;
    float _1025 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1027 = _1011 + _1025;
    float _1029 = _1023 * _1023;
    float _1031 = _1027 * _1027;
    float _1033 = _1029 + _1031;
    float _1035 = sqrt(_1033);
    float _1037 = _845 * _1015;
    float _1039 = fma(_843, _1013, _1037);
    bool _1041 = _1035 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1043 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1045 = _1035 + _1043;
    float _1047 = _975 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1049 = fma(_847, _1017, _1039);
    float _1051 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1047);
    float _1053 = _1049 + _1019;
    float _1055 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1051);
    float _1057 = _853;
    float _1059 = _1033;
    float _1061 = _975;
    float _1063 = _845;
    float _1065 = _1009;
    float _1067 = _1011;
    float _1069 = _1029;
    float _1071 = _1031;
    float _1073 = _1003;
    if (_1041)
    {
        float _1075 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1057 = _1075;
    }
    float _1077 = _1057;
    float _1079 = _1055 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1081 = _1079;
    if (_1041)
    {
        float _1083 = rsqrt(_1033);
        _1059 = _1083;
    }
    float _1085 = _1059;
    float _1087 = _1077;
    if (_1041)
    {
        float _1089 = _1045 * _1077;
        _1087 = _1089;
    }
    float _1091 = _1087;
    if (_1041)
    {
        float _1093 = _1091 * 0.15915493667125701904296875;
        _1061 = _1093;
    }
    float _1095 = _1061;
    float _1097 = _1053 + _1079;
    float _1099 = _843;
    float _1101 = _1097;
    if (_1041)
    {
        float _1103 = _1095 * 6.283185482025146484375;
        float _1105 = sin(_1103);
        _1099 = _1105;
    }
    float _1107 = _1099;
    if (_1041)
    {
        float _1109 = _1097 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1063 = _1109;
    }
    float _1111 = _1063;
    float _1113 = _1111;
    if (_1041)
    {
        float _1115 = fma(_1107, _1111, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1113 = _1115;
    }
    float _1117 = _1113;
    float _1119 = _1117;
    if (_1041)
    {
        float _1121 = _1085 * _1117;
        _1119 = _1121;
    }
    float _1123 = _1119;
    if (_1041)
    {
        float _1125 = fma(_1023, _1123, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1065 = _1125;
    }
    float _1127 = _1065;
    if (_1041)
    {
        float _1129 = fma(_1027, _1123, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1067 = _1129;
    }
    float _1131 = _1067;
    float _1133 = fma(_1127, 6.2500002968590706586837768554688e-05, 0.5);
    float _1135 = fma(_1131, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5831 = float2(_1133, _1135);
    float3 _1139 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5831, float2(0.0), isnan(_5831)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5831, float2(0.0), isnan(_5831)), level(0.0)).xyz;
    float _1141 = _1139.x;
    float _1143 = _1139.y;
    float _1145 = _1139.z;
    float _1147 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1149 = int(_1147);
    if (_257)
    {
        float _1151 = in.m_70.x;
        _1081 = _1151;
    }
    float _1153 = _1081;
    int _1155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1157 = _1155 != 0;
    float _1159 = -_679;
    float _1161 = _1159 + 1.0;
    int _1163 = abs(_509);
    float _1165 = _1153;
    if (!_257)
    {
        float _1167 = in.m_70.y;
        _1165 = _1167;
    }
    float _1169 = _1165;
    float _1171 = -_621;
    float _1173 = _1171 + 1.0;
    float _1175 = -_683;
    float _1177 = _1175 + 1.0;
    float _1179 = trunc(_609);
    int _1181 = int(_1179);
    float _1183 = float(uint(_1149));
    float _1185 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1187 = int(_1185);
    if (_257)
    {
        _693 = 1.0;
    }
    float _1189 = _693;
    float _1191 = _1189;
    if (!_257)
    {
        _1191 = 1.2345600128173828125;
    }
    float _1193 = _1191;
    float _1195 = float(uint(_1181));
    float _1197 = 1.0 / _1183;
    float _1199 = _1193 * _1169;
    int _1201 = ~_1149;
    int _1203 = _1201 + 1;
    float _1205 = float(uint(_1187));
    float _1207 = trunc(_677);
    int _1209 = int(_1207);
    int _1211 = ~_1149;
    int _1213 = _1211 + 1;
    int _1215 = as_type<int>(_1197) + (-2);
    float _1217 = 1.0 / _1205;
    float _1219 = as_type<float>(_1215) * _1195;
    float _1221 = float(uint(_1209));
    float _1223 = floor(_1199);
    float _1225 = float(_1209);
    float _1227 = trunc(_1219);
    float _1229 = precise::max(_1227, 0.0);
    uint _1232 = uint(_1229);
    float _1234 = -_1223;
    float _1236 = _1199 + _1234;
    int _1238 = _1213 * int(_1232);
    int _1240 = _1238 + _1181;
    float _1242 = float(uint(_1240));
    float _1244 = as_type<float>(_1215) * _1242;
    int _1246 = as_type<int>(_1217) + (-2);
    float _1248 = _1217;
    if (_257)
    {
        _1248 = 1.0;
    }
    float _1250 = _1248;
    float _1252 = _1250;
    if (!_257)
    {
        _1252 = 7.345489978790283203125;
    }
    float _1254 = _1252;
    float _1256 = trunc(_1244);
    float _1258 = precise::max(_1256, 0.0);
    uint _1260 = uint(_1258);
    float _1262 = as_type<float>(_1246) * _1221;
    int _1264 = ~_1187;
    int _1266 = _1264 + 1;
    float _1268 = _1254 * _229;
    float _1270 = trunc(_1262);
    float _1272 = precise::max(_1270, 0.0);
    uint _1274 = uint(_1272);
    int _1276 = int(_1232) + int(_1260);
    float _1278 = floor(_1268);
    float _1280 = float(_1149);
    int _1282 = _1203 * _1276;
    int _1284 = _1282 + _1181;
    float _1286 = float(_1181);
    int _1288 = _1266 * int(_1274);
    int _1290 = _1288 + _1209;
    bool _1292 = _1286 >= _1280;
    bool _1294 = isnan(_1286);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan(_1280);
    bool _1300 = _1296 || _1298;
    float _1302 = float(_1300);
    bool _1304 = uint(_1284) >= uint(_1149);
    float _1306 = float(uint(_1290));
    float _1308 = trunc(_1302);
    int _1310 = int(_1308);
    bool _1312 = !_1304;
    int _1314 = _1312 ? 0 : (-1);
    float _1316 = -_1278;
    float _1318 = _1268 + _1316;
    float _1320 = as_type<float>(_1246) * _1306;
    int _1322 = ~_1276;
    int _1324 = _1322 + _1314;
    int _1326 = _1324 + 1;
    float _1328 = _1318 * _1280;
    int _1330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1332 = _1330 != 0;
    float _1334 = trunc(_1320);
    float _1336 = precise::max(_1334, 0.0);
    uint _1338 = uint(_1336);
    int _1340 = _1149 * _1326;
    int _1342 = _1340 + _1181;
    int _1344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1346 = _1344 != 0;
    int _1348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1350 = _1348 != 0;
    int _1352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1354 = _1352 != 0;
    int _1356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1358 = _1356 != 0;
    float _1360 = _1280 * _519;
    bool _1362 = !_1332;
    int _1364 = _1362 ? 0 : 1;
    bool _1366 = _1149 == 0;
    float _1368 = trunc(_1328);
    int _1370 = int(_1368);
    int _1372 = ~_1310;
    int _1374 = _1372 + 1;
    int _1376 = _1374 + 1;
    bool _1378 = !_1366;
    int _1380 = _1378 ? _1342 : (-1);
    int _1382 = _1149 + (-1);
    int _1384 = abs(_1364);
    int _1386 = _1380 * _1376;
    int _1388 = int(_1274) + int(_1338);
    float _1390 = trunc(_1360);
    int _1392 = int(_1390);
    int _1394 = ~_1187;
    int _1396 = _1394 + 1;
    int _1398 = _1310 * _1382;
    int _1400 = _1398 + _1386;
    float _1402 = float(_1187);
    int _1404 = _1396 * _1388;
    int _1406 = _1404 + _1209;
    bool _1408 = _1225 >= _1402;
    bool _1410 = isnan(_1225);
    bool _1412 = _1408 || _1410;
    bool _1414 = isnan(_1402);
    bool _1416 = _1412 || _1414;
    float _1418 = float(_1416);
    float _1420 = _1236 * _1402;
    bool _1422 = !_1157;
    int _1424 = _1422 ? 0 : 1;
    int _1426 = _1400 * _1163;
    bool _1428 = uint(_1406) >= uint(_1187);
    float _1430 = trunc(_1418);
    int _1432 = int(_1430);
    float _1434 = _1402 * _519;
    bool _1436 = !_1428;
    int _1438 = _1436 ? 0 : (-1);
    int _1440 = abs(_513);
    int _1442 = _1370 * _1384;
    int _1444 = _1442 + _1181;
    int _1446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1448 = _1446 != 0;
    float _1450 = trunc(_1420);
    int _1452 = int(_1450);
    int _1454 = ~_1388;
    int _1456 = _1454 + _1438;
    int _1458 = _1456 + 1;
    int _1460 = _1392 * _1440;
    int _1462 = _1460 + _1426;
    bool _1464 = !_1448;
    int _1466 = _1464 ? 0 : 1;
    int _1468 = abs(_517);
    int _1470 = _1187 * _1458;
    int _1472 = _1470 + _1209;
    int _1474 = abs(_1466);
    float _1476 = trunc(_1434);
    int _1478 = int(_1476);
    bool _1480 = _1187 == 0;
    int _1482 = abs(_1424);
    int _1484 = ~_1432;
    int _1486 = _1484 + 1;
    int _1488 = _1486 + 1;
    int _1490 = _1444 * _1468;
    int _1492 = _1490 + _1462;
    bool _1494 = !_1480;
    int _1496 = _1494 ? _1472 : (-1);
    int _1498 = _1452 * _1474;
    int _1500 = _1498 + _1209;
    int _1502 = _1187 + (-1);
    int _1504 = _1370 * _1482;
    int _1506 = _1504 + _1492;
    int _1508 = ~_1149;
    int _1510 = _1508 + 1;
    int _1512 = _1496 * _1488;
    bool _1514 = !_1350;
    int _1516 = _1514 ? 0 : 1;
    float _1518 = float(uint(_1506));
    int _1520 = _1432 * _1502;
    int _1522 = _1520 + _1512;
    bool _1524 = !_1346;
    int _1526 = _1524 ? 0 : 1;
    int _1528 = abs(_1516);
    bool _1530 = !_1354;
    int _1532 = _1530 ? 0 : 1;
    int _1534 = abs(_1526);
    int _1536 = _1522 * _1528;
    int _1538 = abs(_1532);
    float _1540 = as_type<float>(_1215) * _1518;
    bool _1542 = !_1358;
    int _1544 = _1542 ? 0 : 1;
    int _1546 = abs(_1544);
    float _1548 = trunc(_1540);
    float _1550 = precise::max(_1548, 0.0);
    uint _1552 = uint(_1550);
    int _1554 = _1478 * _1534;
    int _1556 = _1554 + _1536;
    float _1558 = float(uint(_1500));
    int _1560 = _1500 * _1538;
    int _1562 = _1560 + _1556;
    int _1564 = ~_1149;
    int _1566 = _1564 + 1;
    float _1568 = float(uint(_1444));
    int _1570 = _1452 * _1546;
    int _1572 = _1570 + _1562;
    int _1574 = ~_1187;
    int _1576 = _1574 + 1;
    float _1578 = as_type<float>(_1215) * _1568;
    float _1580 = float(uint(_1572));
    int _1582 = _1566 * int(_1552);
    int _1584 = _1582 + _1506;
    float _1586 = as_type<float>(_1246) * _1580;
    float _1588 = float(uint(_1584));
    float _1590 = trunc(_1578);
    float _1592 = precise::max(_1590, 0.0);
    uint _1594 = uint(_1592);
    float _1596 = as_type<float>(_1215) * _1588;
    float _1598 = as_type<float>(_1246) * _1558;
    float _1600 = trunc(_1586);
    float _1602 = precise::max(_1600, 0.0);
    uint _1604 = uint(_1602);
    float _1606 = trunc(_1596);
    float _1608 = precise::max(_1606, 0.0);
    uint _1610 = uint(_1608);
    int _1612 = _1576 * int(_1604);
    int _1614 = _1612 + _1572;
    float _1616 = trunc(_1598);
    float _1618 = precise::max(_1616, 0.0);
    uint _1620 = uint(_1618);
    int _1622 = ~_1149;
    int _1624 = _1622 + 1;
    float _1626 = float(uint(_1614));
    int _1628 = _1624 * int(_1594);
    int _1630 = _1628 + _1444;
    int _1632 = int(_1552) + int(_1610);
    float _1634 = as_type<float>(_1246) * _1626;
    int _1636 = ~_1187;
    int _1638 = _1636 + 1;
    float _1640 = float(uint(_1630));
    int _1642 = _1510 * _1632;
    int _1644 = _1642 + _1506;
    float _1646 = trunc(_1634);
    float _1648 = precise::max(_1646, 0.0);
    uint _1650 = uint(_1648);
    float _1652 = as_type<float>(_1215) * _1640;
    bool _1654 = uint(_1644) >= uint(_1149);
    int _1656 = _1638 * int(_1620);
    int _1658 = _1656 + _1500;
    bool _1660 = !_1654;
    int _1662 = _1660 ? 0 : (-1);
    float _1664 = trunc(_1652);
    float _1666 = precise::max(_1664, 0.0);
    uint _1668 = uint(_1666);
    float _1670 = float(uint(_1658));
    int _1672 = ~_1632;
    int _1674 = _1672 + _1662;
    int _1676 = _1674 + 1;
    int _1678 = ~_1187;
    int _1680 = _1678 + 1;
    float _1682 = as_type<float>(_1246) * _1670;
    int _1684 = int(_1604) + int(_1650);
    int _1686 = _1149 * _1676;
    int _1688 = _1686 + _1506;
    float _1690 = trunc(_1682);
    float _1692 = precise::max(_1690, 0.0);
    uint _1694 = uint(_1692);
    int _1696 = ~_1149;
    int _1698 = _1696 + 1;
    int _1700 = _1680 * _1684;
    int _1702 = _1700 + _1572;
    bool _1704 = !_1366;
    int _1706 = _1704 ? _1688 : (-1);
    int _1708 = int(_1594) + int(_1668);
    int _1710 = _1706 & 3;
    bool _1712 = _1710 != 0;
    int _1714 = _1706 & 3;
    bool _1716 = _1714 != 0;
    bool _1718 = uint(_1702) >= uint(_1187);
    int _1720 = _1712 ? 0 : 1;
    bool _1722 = uint(_1714) > 1u;
    bool _1724 = uint(_1714) >= 2u;
    bool _1726 = !_1718;
    int _1728 = _1726 ? 0 : (-1);
    int _1730 = _1724 ? 0 : 1;
    int _1732 = ~_1187;
    int _1734 = _1732 + 1;
    bool _1736 = _1714 != 3;
    bool _1738 = _235 > 0.5;
    int _1740 = _1698 * _1708;
    int _1742 = _1740 + _1444;
    int _1744 = int(_1620) + int(_1694);
    int _1746 = ~_1720;
    int _1748 = _1746 + 1;
    int _1750 = _1748 + 1;
    int _1752 = ~_1684;
    int _1754 = _1752 + _1728;
    int _1756 = _1754 + 1;
    int _1758 = _1734 * _1744;
    int _1760 = _1758 + _1500;
    int _1762 = _1750;
    if (!_1722)
    {
        int _1764 = ~_1720;
        int _1766 = _1764 + 1;
        _1762 = _1766;
    }
    int _1768 = _1762;
    bool _1770 = uint(_1742) >= uint(_1149);
    int _1772 = _1187 * _1756;
    int _1774 = _1772 + _1572;
    int _1776 = ~_1730;
    int _1778 = _1776 + 1;
    int _1780 = _1778 + 1;
    bool _1782 = !_1770;
    int _1784 = _1782 ? 0 : (-1);
    int _1786 = _1780;
    if (_1736)
    {
        int _1788 = ~_1730;
        int _1790 = _1788 + 1;
        _1786 = _1790;
    }
    int _1792 = _1786;
    bool _1794 = uint(_1760) >= uint(_1187);
    int _1796 = ~_1708;
    int _1798 = _1796 + _1784;
    int _1800 = _1798 + 1;
    float _1802 = -_197;
    int _1804 = _1738 ? as_type<int>(_1802) : as_type<int>(_197);
    bool _1806 = !_1480;
    int _1808 = _1806 ? _1774 : (-1);
    int _1810 = _1149 * _1800;
    int _1812 = _1810 + _1444;
    int _1814 = _1706 >> 31;
    int _1816 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1818 = _1816 != 0;
    bool _1820 = !_1794;
    int _1822 = _1820 ? 0 : (-1);
    int _1824 = _1808 >> 31;
    int _1826 = _1814 & 3;
    int _1828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1830 = _1828 != 0;
    bool _1832 = !_1818;
    int _1834 = _1832 ? 0 : 1;
    int _1836 = _1808 & 3;
    bool _1838 = _1836 != 0;
    int _1840 = ~_1744;
    int _1842 = _1840 + _1822;
    int _1844 = _1842 + 1;
    int _1846 = _1824 & 3;
    int _1848 = _1706 + _1826;
    int _1850 = _1187 * _1844;
    int _1852 = _1850 + _1500;
    bool _1854 = !_1830;
    int _1856 = _1854 ? 0 : 1;
    float _1858 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1860 = int(_1858);
    bool _1862 = uint(_1836) > 1u;
    int _1864 = _1808 + _1846;
    int _1866 = _1848 >> 2;
    int _1868 = _1808 & 3;
    bool _1870 = _1868 != 0;
    int _1872 = _1864 >> 2;
    int _1874 = _1866 << 4;
    int _1876 = _1874 + 368;
    int _1878 = _1870 ? 0 : 1;
    bool _1880 = _1714 != 3;
    int _1882 = _1872 << 4;
    int _1884 = _1882 + 512;
    uint _1886 = uint(int(uint(_1876) >> uint(2)));
    uint _1888 = uint(int(uint(int(_1886)) >> uint(2)));
    int _1890 = int(_1886) & 3;
    float _1892 = (*spvDescriptorSet0.vp_c9)._m0[int(_1888)][_1890];
    int _1894 = int(_1886) + 1;
    uint _1896 = uint(int(uint(_1894) >> uint(2)));
    int _1898 = _1894 & 3;
    float _1900 = (*spvDescriptorSet0.vp_c9)._m0[int(_1896)][_1898];
    int _1902 = ~_1878;
    int _1904 = _1902 + 1;
    int _1906 = _1904 + 1;
    int _1908 = _1906;
    if (!_1862)
    {
        int _1910 = ~_1878;
        int _1912 = _1910 + 1;
        _1908 = _1912;
    }
    int _1914 = _1908;
    bool _1916 = !_1716;
    int _1918 = _1916 ? 0 : 1;
    bool _1920 = _1836 != 3;
    uint _1922 = uint(int(uint(_1884) >> uint(2)));
    uint _1924 = uint(int(uint(int(_1922)) >> uint(2)));
    int _1926 = int(_1922) & 3;
    float _1928 = (*spvDescriptorSet0.vp_c9)._m0[int(_1924)][_1926];
    int _1930 = int(_1922) + 1;
    uint _1932 = uint(int(uint(_1930) >> uint(2)));
    int _1934 = _1930 & 3;
    float _1936 = (*spvDescriptorSet0.vp_c9)._m0[int(_1932)][_1934];
    bool _1938 = uint(_1836) >= 2u;
    bool _1940 = !_1366;
    int _1942 = _1940 ? _1812 : (-1);
    int _1944 = _1938 ? 0 : 1;
    bool _1946 = _1836 != 3;
    bool _1948 = !_1838;
    int _1950 = _1948 ? 0 : 1;
    bool _1952 = !_1880;
    int _1954 = _1952 ? 0 : (-1);
    int _1956 = ~_1944;
    int _1958 = _1956 + 1;
    int _1960 = _1958 + 1;
    int _1962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1964 = _1962 != 0;
    int _1966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1968 = _1966 != 0;
    int _1970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1972 = _1970 != 0;
    int _1974 = _1960;
    if (_1920)
    {
        int _1976 = ~_1944;
        int _1978 = _1976 + 1;
        _1974 = _1978;
    }
    int _1980 = _1974;
    int _1982 = _1876 + 8;
    uint _1984 = uint(int(uint(_1982) >> uint(2)));
    uint _1986 = uint(int(uint(int(_1984)) >> uint(2)));
    int _1988 = int(_1984) & 3;
    float _1990 = (*spvDescriptorSet0.vp_c9)._m0[int(_1986)][_1988];
    int _1992 = int(_1984) + 1;
    uint _1994 = uint(int(uint(_1992) >> uint(2)));
    int _1996 = _1992 & 3;
    float _1998 = (*spvDescriptorSet0.vp_c9)._m0[int(_1994)][_1996];
    int _2000 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2002 = _2000 != 0;
    int _2004 = abs(_1768);
    int _2006 = abs(_1914);
    int _2008 = _1884 + 8;
    uint _2010 = uint(int(uint(_2008) >> uint(2)));
    uint _2012 = uint(int(uint(int(_2010)) >> uint(2)));
    int _2014 = int(_2010) & 3;
    float _2016 = (*spvDescriptorSet0.vp_c9)._m0[int(_2012)][_2014];
    int _2018 = int(_2010) + 1;
    uint _2020 = uint(int(uint(_2018) >> uint(2)));
    int _2022 = _2018 & 3;
    float _2024 = (*spvDescriptorSet0.vp_c9)._m0[int(_2020)][_2022];
    bool _2026 = !_1946;
    int _2028 = _2026 ? 0 : (-1);
    bool _2030 = _229 > 0.5;
    int _2032 = abs(_1918);
    int _2034 = ~_2004;
    int _2036 = _2034 + 1;
    int _2038 = _2036 + 1;
    bool _2040 = !_1480;
    int _2042 = _2040 ? _1852 : (-1);
    float _2044 = -_193;
    int _2046 = _2030 ? as_type<int>(_2044) : as_type<int>(_193);
    int _2048 = _2038 * as_type<int>(_1900);
    bool _2050 = _231 > 0.5;
    bool _2052 = _233 > 0.5;
    float _2054 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2056 = abs(_1950);
    float _2058 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2060 = ~_2006;
    int _2062 = _2060 + 1;
    int _2064 = _2062 + 1;
    float _2066 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2068 = ~_2032;
    int _2070 = _2068 + 1;
    int _2072 = _2070 + 1;
    float _2074 = _2054 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2076 = _2064 * as_type<int>(_1936);
    int _2078 = ~_2056;
    int _2080 = _2078 + 1;
    int _2082 = _2080 + 1;
    int _2084 = _2072 * as_type<int>(_1892);
    int _2086 = _2084 + _2048;
    int _2088 = abs(_1792);
    float _2090 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2092 = int(_2090);
    float _2094 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2096 = _2058 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2098 = _2066 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2100 = _2082 * as_type<int>(_1928);
    int _2102 = _2100 + _2076;
    float _2104 = _941 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2106 = abs(_1980);
    out.m_82.x = _2074;
    out.m_82.y = _2096;
    out.m_82.z = _2098;
    out.m_82.w = _2094;
    int _2108 = abs(_2028);
    float _2110 = _941 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2112 = ~_2088;
    int _2114 = _2112 + 1;
    int _2116 = _2114 + 1;
    int _2118 = abs(_1954);
    bool _2120 = !_1964;
    float _2122 = _2120 ? _197 : as_type<float>(_1804);
    int _2124 = _2116 * as_type<int>(_1990);
    int _2126 = _2124 + _2086;
    float _2128 = _963 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2130 = !_2002;
    float _2132 = _2130 ? _193 : as_type<float>(_2046);
    int _2134 = ~_2106;
    int _2136 = _2134 + 1;
    int _2138 = _2136 + 1;
    float _2140 = _941 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2142 = -_935;
    float _2144 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2110);
    float _2146 = float(uint(_1860));
    int _2148 = _2138 * as_type<int>(_2016);
    int _2150 = _2148 + _2102;
    float _2152 = -_935;
    float _2154 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2104);
    int _2156 = ~_2108;
    int _2158 = _2156 + 1;
    int _2160 = _2158 + 1;
    float _2162 = _2104;
    if (_1041)
    {
        float _2164 = _1095 * 6.283185482025146484375;
        float _2166 = cos(_2164);
        _2162 = _2166;
    }
    float _2168 = _2162;
    float _2170 = float(uint(_2092));
    int _2172 = ~_2118;
    int _2174 = _2172 + 1;
    int _2176 = _2174 + 1;
    int _2178 = _2160 * as_type<int>(_2024);
    int _2180 = _2178 + _2150;
    int _2182 = abs(_1834);
    int _2184 = abs(_1856);
    float _2186 = 1.0 / _2146;
    int _2188 = _2176 * as_type<int>(_1998);
    int _2190 = _2188 + _2126;
    int _2192 = ~_2182;
    int _2194 = _2192 + 1;
    int _2196 = _2194 + 1;
    int _2198 = ~_2184;
    int _2200 = _2198 + 1;
    int _2202 = _2200 + 1;
    int _2204 = abs(_1860);
    float _2206 = 1.0 / _2170;
    int _2208 = _2180 * _2202;
    float _2210 = float(uint(_2204));
    int _2212 = abs(_2092);
    int _2214 = _2042 * _2184;
    int _2216 = _2214 + _2208;
    int _2218 = as_type<int>(_2186) + (-2);
    float _2220 = -_935;
    float _2222 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2140);
    int _2224 = _2190 * _2196;
    float _2226 = 1.0 / _2210;
    float _2228 = float(uint(_2212));
    float _2230 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2144);
    int _2232 = _1942 * _2182;
    int _2234 = _2232 + _2224;
    float _2236 = _955 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2238 = as_type<int>(_2206) + (-2);
    float _2240 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2222);
    float _2242 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2154);
    float _2244 = float(uint(_2234));
    float _2246 = 1.0 / _2228;
    float _2248 = _955 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2250 = _955 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2252 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2236);
    float _2254 = as_type<float>(_2218) * _2244;
    int _2256 = abs(_2234);
    float _2258 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2248);
    float _2260 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2250);
    float _2262 = float(uint(_2216));
    float _2264 = trunc(_2254);
    float _2266 = precise::max(_2264, 0.0);
    uint _2268 = uint(_2266);
    float _2270 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2258);
    int _2272 = as_type<int>(_2226) + (-2);
    float _2274 = as_type<float>(_2238) * _2262;
    float _2276 = float(uint(_2256));
    float _2278 = _963 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2280 = abs(_2216);
    int _2282 = ~_1860;
    int _2284 = _2282 + 1;
    float _2286 = as_type<float>(_2272) * _2276;
    int _2288 = as_type<int>(_2246) + (-2);
    float _2290 = _963 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2292 = float(uint(_2280));
    float _2294 = trunc(_2274);
    float _2296 = precise::max(_2294, 0.0);
    uint _2298 = uint(_2296);
    float _2300 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2278);
    int _2302 = _2284 * int(_2268);
    int _2304 = _2302 + _2234;
    float _2306 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2290);
    float _2308 = as_type<float>(_2288) * _2292;
    float _2310 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2128);
    float _2312 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2300);
    float _2314 = float(uint(_2304));
    float _2316 = trunc(_2286);
    float _2318 = precise::max(_2316, 0.0);
    uint _2320 = uint(_2318);
    float _2322 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2306);
    float _2324 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2310);
    int _2326 = ~_2204;
    int _2328 = _2326 + 1;
    float _2330 = as_type<float>(_2218) * _2314;
    int _2332 = ~_2092;
    int _2334 = _2332 + 1;
    float _2336 = trunc(_2308);
    float _2338 = precise::max(_2336, 0.0);
    uint _2340 = uint(_2338);
    int _2342 = ~_2212;
    int _2344 = _2342 + 1;
    int _2346 = _2334 * int(_2298);
    int _2348 = _2346 + _2216;
    float _2350 = as_type<float>(_2328);
    float _2352 = _2286;
    float _2354 = as_type<float>(_2348);
    if (_1041)
    {
        float _2356 = _2168 + (-1.0);
        _2350 = _2356;
    }
    float _2358 = _2350;
    float _2360 = _2358;
    if (_1041)
    {
        float _2362 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2364 = _1127 + _2362;
        _2352 = _2364;
    }
    float _2366 = _2352;
    float _2368 = float(uint(_2348));
    int _2370 = _2328 * int(_2320);
    int _2372 = _2370 + _2256;
    if (_1041)
    {
        float _2374 = _2358 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2360 = _2374;
    }
    float _2376 = _2360;
    float _2378 = trunc(_2330);
    float _2380 = precise::max(_2378, 0.0);
    uint _2382 = uint(_2380);
    if (_1041)
    {
        float _2384 = _2366 * _2366;
        _1069 = _2384;
    }
    float _2386 = _1069;
    float _2388 = as_type<float>(_2238) * _2368;
    float _2390 = float(uint(_2372));
    if (_1041)
    {
        float _2392 = fma(_1097, _2168, _2376);
        _1101 = _2392;
    }
    float _2394 = _1101;
    float _2396 = -_197;
    int _2398 = _2050 ? as_type<int>(_2396) : as_type<int>(_197);
    int _2400 = _2344 * int(_2340);
    int _2402 = _2400 + _2280;
    float _2404 = _197 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2406 = as_type<float>(_2272) * _2390;
    float _2408 = -_193;
    int _2410 = _2052 ? as_type<int>(_2408) : as_type<int>(_193);
    float _2412 = trunc(_2388);
    float _2414 = precise::max(_2412, 0.0);
    uint _2416 = uint(_2414);
    float _2418 = float(uint(_2402));
    float _2420 = _2404 * _2240;
    bool _2422 = !_1968;
    float _2424 = _2422 ? _197 : as_type<float>(_2398);
    float _2426 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2252);
    bool _2428 = !_1972;
    float _2430 = _2428 ? _193 : as_type<float>(_2410);
    float _2432 = as_type<float>(_2288) * _2418;
    float _2434 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2260);
    float _2436 = trunc(_2406);
    float _2438 = precise::max(_2436, 0.0);
    uint _2440 = uint(_2438);
    float _2442 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2444 = _2404 * _2230;
    float _2446 = _2404 * _2242;
    float _2448 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2450 = _2394 + _2448;
    float _2452 = fma(_2442, _2426, _2420);
    float _2454 = fma(_2442, _2270, _2444);
    if (_1041)
    {
        float _2456 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2458 = _1131 + _2456;
        _2354 = _2458;
    }
    float _2460 = _2354;
    float _2462 = trunc(_2432);
    float _2464 = precise::max(_2462, 0.0);
    uint _2466 = uint(_2464);
    float _2468 = fma(_2442, _2434, _2446);
    float _2470 = fma(_2450, _2450, _2386);
    int _2472 = int(_2268) + int(_2382);
    float _2474 = _2468;
    if (_1041)
    {
        float _2476 = _2460 * _2460;
        _1071 = _2476;
    }
    float _2478 = _1071;
    int _2480 = ~_1860;
    int _2482 = _2480 + 1;
    out.m_84.x = _2426;
    out.m_84.y = _2270;
    out.m_84.z = _2434;
    int _2484 = int(_2298) + int(_2416);
    int _2486 = int(_2320) + int(_2440);
    int _2488 = ~_2092;
    int _2490 = _2488 + 1;
    int _2492 = ~_2204;
    int _2494 = _2492 + 1;
    int _2496 = _2482 * _2472;
    int _2498 = _2496 + _2234;
    int _2500 = int(_2340) + int(_2466);
    int _2502 = _2494 * _2486;
    int _2504 = _2502 + _2256;
    int _2506 = ~_2212;
    int _2508 = _2506 + 1;
    int _2510 = _2490 * _2484;
    int _2512 = _2510 + _2216;
    bool _2514 = uint(_2498) >= uint(_1860);
    float _2516 = _2470 + _2478;
    bool _2518 = uint(_2504) >= uint(_2204);
    int _2520 = _2508 * _2500;
    int _2522 = _2520 + _2280;
    bool _2524 = uint(_2512) >= uint(_2092);
    float _2526 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2528 = !_2514;
    int _2530 = _2528 ? 0 : (-1);
    bool _2532 = !_2524;
    int _2534 = _2532 ? 0 : (-1);
    int _2536 = ~_2472;
    int _2538 = _2536 + _2530;
    int _2540 = _2538 + 1;
    bool _2542 = uint(_2522) >= uint(_2212);
    float _2544 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2546 = _2234 ^ _1860;
    float _2548 = fma(_2404, _2404, 1.0);
    int _2550 = ~_2484;
    int _2552 = _2550 + _2534;
    int _2554 = _2552 + 1;
    int _2556 = _1860 * _2540;
    int _2558 = _2556 + _2234;
    bool _2560 = !_2542;
    int _2562 = _2560 ? 0 : (-1);
    bool _2564 = _1860 == 0;
    float _2566 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2568 = !_2518;
    int _2570 = _2568 ? 0 : (-1);
    int _2572 = _2092 * _2554;
    int _2574 = _2572 + _2216;
    uint _2576 = uint(int(uint(_2546) >> uint(31)));
    int _2578 = _2216 ^ _2092;
    int _2580 = ~_2562;
    int _2582 = _2500 + _2580;
    int _2584 = _2582 + 1;
    float _2586 = sqrt(_2516);
    int _2588 = ~_2570;
    int _2590 = _2486 + _2588;
    int _2592 = _2590 + 1;
    int _2594 = ~int(_2576);
    int _2596 = _2594 + 1;
    float _2598 = _2526 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2600 = !_2564;
    int _2602 = _2600 ? _2558 : (-1);
    uint _2604 = uint(int(uint(_2578) >> uint(31)));
    int _2606 = _2592 ^ _2596;
    float _2608 = float(_2602);
    int _2610 = ~int(_2604);
    int _2612 = _2610 + 1;
    bool _2614 = _2092 == 0;
    bool _2616 = _2092 == 0;
    float _2618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2620 = ~_2596;
    int _2622 = _2620 + _2606;
    int _2624 = _2622 + 1;
    float _2626 = fma(_2598, _2608, _425);
    bool _2628 = _1860 == 0;
    int _2630 = _2584 ^ _2612;
    bool _2632 = !_2614;
    int _2634 = _2632 ? _2574 : (-1);
    float _2636 = rsqrt(_2548);
    int _2638 = ~_2612;
    int _2640 = _2638 + _2630;
    int _2642 = _2640 + 1;
    float _2644 = _2544 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2646 = !_2628;
    int _2648 = _2646 ? _2624 : (-1);
    float _2650 = float(_2634);
    float _2652 = _2566 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2654 = float(_2648);
    float _2656 = _2132 + 0.5;
    out.m_86.x = _1141;
    out.m_86.y = _1143;
    out.m_86.z = _1145;
    float _2658 = fma(_2652, _2650, _689);
    bool _2660 = !_2616;
    int _2662 = _2660 ? _2642 : (-1);
    float _2664 = fma(_2598, _2656, _2626);
    float _2666 = -_675;
    float _2668 = fma(_2644, _2654, _2666);
    float _2670 = _2430 + 0.5;
    float _2672 = _2618 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2674 = float(_2662);
    float _2676 = _2424 + (-0.5);
    float _2678 = _2404 * _2636;
    float _2680 = fma(_2652, _2670, _2658);
    bool _2682 = _2586 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2684 = isnan(_2586);
    bool _2686 = _2682 || _2684;
    bool _2688 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2690 = _2686 || _2688;
    float _2692 = -_2644;
    float _2694 = fma(_2692, _2676, _2668);
    float _2696 = -_691;
    float _2698 = fma(_2672, _2674, _2696);
    float _2700 = -_2312;
    float _2702 = _2678 * _2700;
    float _2704 = -_2322;
    float _2706 = _2678 * _2704;
    float _2708 = -_2324;
    float _2710 = _2678 * _2708;
    float _2712 = _2122 + (-0.5);
    float _2714 = fma(_2636, _2240, _2702);
    float _2716 = fma(_2636, _2230, _2706);
    float _2718 = fma(_2636, _2242, _2710);
    float _2720 = -_2672;
    float _2722 = fma(_2720, _2712, _2698);
    float _2724 = -_685;
    float _2726 = _2724 + 1.0;
    float _2728 = -_1161;
    float _2730 = fma(_2132, _2728, _2664);
    float _2732 = -_1173;
    float _2734 = fma(_2430, _2732, _2680);
    float _2736 = _2312 + _2452;
    float _2738 = fma(_2424, _2726, _2694);
    float _2740 = fma(_2122, _1177, _2722);
    float _2742 = _2322 + _2454;
    float _2744 = _2324 + _2468;
    out.m_88.x = _2714;
    out.m_88.y = _2716;
    out.m_88.z = _2718;
    if (!_2690)
    {
        _2474 = 1.0;
    }
    float _2746 = _2474;
    out.m_90.x = _2730;
    out.m_90.y = _2738;
    out.m_90.z = _2734;
    out.m_90.w = _2740;
    out.m_92.x = _2736;
    out.m_92.y = _2742;
    out.m_92.z = _2744;
    bool _2748 = !_2690;
    float _2750 = _2746;
    if (!_2748)
    {
        bool _2752 = _2586 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2754 = isnan(_2586);
        bool _2756 = _2752 || _2754;
        bool _2758 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2760 = _2756 || _2758;
        if (!_2760)
        {
            float _2762 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2764 = _2586 + _2762;
            float _2766 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2768 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2766;
            float _2770 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2772 = _2770 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2774 = 1.0 / _2768;
            float _2776 = _2764 * _2774;
            float _2778 = fma(_2776, _2772, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2750 = _2778;
            _2780 = true;
        }
        else
        {
            bool _2782 = _2586 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2784 = isnan(_2586);
            bool _2786 = _2782 || _2784;
            bool _2788 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2790 = _2786 || _2788;
            if (!_2790)
            {
                float _2792 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2794 = _2586 + _2792;
                float _2796 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2798 = _2796 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2800 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2802 = _2800 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2804 = 1.0 / _2798;
                float _2806 = _2794 * _2804;
                float _2808 = fma(_2806, _2802, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2750 = _2808;
                _2780 = true;
            }
            else
            {
                _2750 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2780 = false;
    float _2810 = _2750;
    float _2812 = fma(_997, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2814 = fma(_1003, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2816 = floor(_2812);
    float _2818 = floor(_2814);
    float _2820 = -_2816;
    float _2822 = _2812 + _2820;
    float _2824 = -_2818;
    float _2826 = _2814 + _2824;
    float2 _8275 = float2(_2822, _2826);
    float _2828 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8275, float2(0.0), isnan(_8275)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8275, float2(0.0), isnan(_8275)), level(0.0)).x;
    float _2830 = _1053 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2832 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2834 = _2394 + _2832;
    float _2836 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2830);
    float _2838 = fma(_2834, _2810, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2840 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2836);
    float _2842 = _1053 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2844 = _2840 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2846 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2842);
    float _2848 = 1.0 / _2844;
    float _2850 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2846);
    float _2852 = _2850 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2854 = _2852 + _2844;
    float _2856 = _2854 * _2848;
    float _2858 = _2856 * 0.5;
    float _2860 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2862 = fma(_2858, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2860);
    float _2864 = 1.0 / _2862;
    float _2866 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2868 = _1053 + _2866;
    float _2870 = _2868 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2872 = fma(_997, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2870);
    float _2874 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2876 = _2864 * _2874;
    float _2878 = _2868 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2880 = fma(_1003, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2872);
    bool _2882 = _2876 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2884 = fma(_997, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2878);
    bool _2886 = _2876 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2888 = _2880 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _2890 = !_2882;
    int _2892 = _2890 ? 0 : 1;
    float _2894 = fma(_1003, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2884);
    float _2896 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2898 = _1131 + _2896;
    float _2900 = trunc(_2888);
    int _2902 = int(_2900);
    float _2904 = _2894 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2906 = fma(_2898, _2810, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    int _2908 = 2;
    float _2910 = _2898;
    int _2912 = as_type<int>(_2810);
    if (!_2882)
    {
        _2908 = 1;
    }
    int _2914 = _2908;
    int _2916 = _2914;
    if (!_2886)
    {
        _2916 = _2892;
    }
    int _2918 = _2916;
    float _2920 = trunc(_2904);
    int _2922 = int(_2920);
    int _2924 = _2918 << 6;
    bool _2926 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2928 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2930 = _2926 || _2928;
    bool _2932 = isnan(0.5);
    bool _2934 = _2930 || _2932;
    int _2936 = _2924 + 48;
    uint _2938 = uint(int(uint(_2936) >> uint(2)));
    uint _2940 = uint(int(uint(int(_2938)) >> uint(2)));
    int _2942 = int(_2938) & 3;
    float _2944 = (*spvDescriptorSet0.vp_c15)._m0[int(_2940)][_2942];
    int _2946 = int(_2938) + 1;
    uint _2948 = uint(int(uint(_2946) >> uint(2)));
    int _2950 = _2946 & 3;
    float _2952 = (*spvDescriptorSet0.vp_c15)._m0[int(_2948)][_2950];
    int _2954 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2956 = _2902 + _2954;
    int _2958 = _2956 + 1;
    bool _2960 = _2958 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2962 = _2924 + 56;
    uint _2964 = uint(int(uint(_2962) >> uint(2)));
    uint _2966 = uint(int(uint(int(_2964)) >> uint(2)));
    int _2968 = int(_2964) & 3;
    float _2970 = (*spvDescriptorSet0.vp_c15)._m0[int(_2966)][_2968];
    int _2972 = int(_2964) + 1;
    uint _2974 = uint(int(uint(_2972) >> uint(2)));
    int _2976 = _2972 & 3;
    float _2978 = (*spvDescriptorSet0.vp_c15)._m0[int(_2974)][_2976];
    int _2980 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2982 = _2922 + _2980;
    int _2984 = _2982 + 1;
    float _2986 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2988 = _1127 + _2986;
    float _2990 = _2988;
    int _2992 = _2958;
    if (_2934)
    {
        _2910 = _2906;
    }
    float _2994 = _2910;
    int _2996 = _2958 | _2984;
    float _2998 = fma(_2988, _2810, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    int _3000 = _2924 + 64;
    uint _3002 = uint(int(uint(_3000) >> uint(2)));
    uint _3004 = uint(int(uint(int(_3002)) >> uint(2)));
    int _3006 = int(_3002) & 3;
    float _3008 = (*spvDescriptorSet0.vp_c15)._m0[int(_3004)][_3006];
    int _3010 = int(_3002) + 1;
    uint _3012 = uint(int(uint(_3010) >> uint(2)));
    int _3014 = _3010 & 3;
    float _3016 = (*spvDescriptorSet0.vp_c15)._m0[int(_3012)][_3014];
    bool _3018 = _2996 < 0;
    bool _3020 = _3018 || _2960;
    float _3022 = as_type<float>(_2996);
    float _3024 = _2994;
    if (_2934)
    {
        _2990 = _2998;
    }
    float _3026 = _2990;
    bool _3028 = _2984 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3030 = _3028 || _3020;
    float _3032 = _3026;
    if (_2934)
    {
        _3022 = _2838;
    }
    float _3034 = _3022;
    int _3036 = _2924 + 72;
    uint _3038 = uint(int(uint(_3036) >> uint(2)));
    uint _3040 = uint(int(uint(int(_3038)) >> uint(2)));
    int _3042 = int(_3038) & 3;
    float _3044 = (*spvDescriptorSet0.vp_c15)._m0[int(_3040)][_3042];
    int _3046 = int(_3038) + 1;
    uint _3048 = uint(int(uint(_3046) >> uint(2)));
    int _3050 = _3046 & 3;
    float _3052 = (*spvDescriptorSet0.vp_c15)._m0[int(_3048)][_3050];
    int _3054 = _2924 + 96;
    uint _3056 = uint(int(uint(_3054) >> uint(2)));
    uint _3058 = uint(int(uint(int(_3056)) >> uint(2)));
    int _3060 = int(_3056) & 3;
    float _3062 = (*spvDescriptorSet0.vp_c15)._m0[int(_3058)][_3060];
    int _3064 = int(_3056) + 1;
    uint _3066 = uint(int(uint(_3064) >> uint(2)));
    int _3068 = _3064 & 3;
    float _3070 = (*spvDescriptorSet0.vp_c15)._m0[int(_3066)][_3068];
    int _3072 = _2924 + 104;
    uint _3074 = uint(int(uint(_3072) >> uint(2)));
    uint _3076 = uint(int(uint(int(_3074)) >> uint(2)));
    int _3078 = int(_3074) & 3;
    float _3080 = (*spvDescriptorSet0.vp_c15)._m0[int(_3076)][_3078];
    int _3082 = int(_3074) + 1;
    uint _3084 = uint(int(uint(_3082) >> uint(2)));
    int _3086 = _3082 & 3;
    float _3088 = (*spvDescriptorSet0.vp_c15)._m0[int(_3084)][_3086];
    float _3090 = _3034;
    if (!_2934)
    {
        float _3092 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3094 = _1053 + _3092;
        float _3096 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3098 = _997 + _3096;
        float _3100 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3102 = _3094 * _3094;
        float _3104 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3106 = _1003 + _3104;
        float _3108 = fma(_3098, _3098, _3102);
        float _3110 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3112 = fma(_3106, _3106, _3108);
        float _3114 = sqrt(_3112);
        float _3116 = _3100 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3118 = -_1003;
        float _3120 = _3118 + _2906;
        float _3122 = precise::min(_3114, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3124 = _3122 * _3110;
        float _3126 = -_1053;
        float _3128 = _3126 + _2838;
        float _3130 = _3116 * _3124;
        float _3132 = -_997;
        float _3134 = _3132 + _2998;
        float _3136 = fma(_3128, _3130, _1053);
        float _3138 = fma(_3134, _3130, _997);
        float _3140 = fma(_3120, _3130, _1003);
        _3090 = _3136;
        _3032 = _3138;
        _2912 = as_type<int>(_3130);
        _3024 = _3140;
    }
    float _3142 = _3090;
    float _3144 = _3032;
    int _3146 = _2912;
    float _3148 = _3024;
    float _3150 = _2868 * _3070;
    float _3152 = _3142 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _3154 = _3146;
    if (!_3030)
    {
        int _3156 = _2984 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3158 = _3156 + _2958;
        _3154 = _3158;
    }
    int _3160 = _3154;
    float _3162 = _2868 * _3016;
    float _3164 = fma(_997, _3062, _3150);
    float _3166 = fma(_3144, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3152);
    float _3168 = _2868 * _2952;
    if (!_3030)
    {
        int _3170 = _3160 << 2;
        _2992 = _3170;
    }
    int _3172 = _2992;
    float _3174 = fma(_1003, _3080, _3164);
    float _3176 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3166);
    float _3178 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    int _3180 = _3172;
    int _3182 = as_type<int>(_3176);
    if (!_3030)
    {
        int _3184 = 12 & _3172;
        _3180 = _3184;
    }
    int _3186 = _3180;
    float _3188 = _3174 + _3088;
    float _3190 = _3176 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (!_3030)
    {
        uint _3192 = uint(int(uint(_3160) >> uint(2)));
        _3182 = int(_3192);
    }
    int _3194 = _3182;
    float _3196 = fma(_997, _2944, _3168);
    float _3198 = fma(_997, _3008, _3162);
    float _3200 = _3190 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    int _3202 = _2924 + 80;
    uint _3204 = uint(int(uint(_3202) >> uint(2)));
    uint _3206 = uint(int(uint(int(_3204)) >> uint(2)));
    int _3208 = int(_3204) & 3;
    float _3210 = (*spvDescriptorSet0.vp_c15)._m0[int(_3206)][_3208];
    int _3212 = int(_3204) + 1;
    uint _3214 = uint(int(uint(_3212) >> uint(2)));
    int _3216 = _3212 & 3;
    float _3218 = (*spvDescriptorSet0.vp_c15)._m0[int(_3214)][_3216];
    float _3220 = 1.0 / _3188;
    float _3222 = fma(_1003, _2970, _3196);
    float _3224 = -_3200;
    float _3226 = fma(_3224, _3178, 1.0);
    float _3228 = _3200;
    if (!_3030)
    {
        int _3230 = _3194 << 4;
        int _3232 = _3230 + _3186;
        _3228 = as_type<float>(_3232);
    }
    float _3234 = _3228;
    float _3236 = fma(_1003, _3044, _3198);
    float _3238 = _3142 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3240 = _3222 + _2978;
    int _3242 = _2924 + 88;
    uint _3244 = uint(int(uint(_3242) >> uint(2)));
    uint _3246 = uint(int(uint(int(_3244)) >> uint(2)));
    int _3248 = int(_3244) & 3;
    float _3250 = (*spvDescriptorSet0.vp_c15)._m0[int(_3246)][_3248];
    int _3252 = int(_3244) + 1;
    uint _3254 = uint(int(uint(_3252) >> uint(2)));
    int _3256 = _3252 & 3;
    float _3258 = (*spvDescriptorSet0.vp_c15)._m0[int(_3254)][_3256];
    float _3260 = _3236 + _3052;
    float _3262 = fma(_3144, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3238);
    float _3264 = _3142 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3266 = _3142 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3268 = as_type<float>(_2642);
    if (!_3030)
    {
        float _3270 = floor(_2904);
        _3268 = _3270;
    }
    float _3272 = _3268;
    float _3274 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3262);
    float _3276 = fma(_3144, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3264);
    float _3278 = _3234;
    if (!_3030)
    {
        int _3280 = as_type<int>(_3234) + 400;
        uint _3282 = uint(int(uint(_3280) >> uint(2)));
        uint _3284 = uint(int(uint(int(_3282)) >> uint(2)));
        int _3286 = int(_3282) & 3;
        float _3288 = (*spvDescriptorSet0.vp_c15)._m0[int(_3284)][_3286];
        _3278 = _3288;
    }
    float _3290 = _3278;
    float _3292 = _3240 * _3220;
    float _3294 = _3260 * _3220;
    float _3296 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3276);
    float _3298 = _3274 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3300 = fma(_3144, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3266);
    bool _3302 = _3292 >= 0.0;
    float _3304 = _3296 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3306 = _3298 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3308 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3300);
    bool _3310 = _3292 <= 1.0;
    bool _3312 = _3310 && _3302;
    float _3314 = log2(_3226);
    float _3316 = fma(_3304, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3306);
    float _3318 = _3308 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _3320 = _3294 >= 0.0;
    bool _3322 = _3320 && _3312;
    float _3324 = _3298 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3326 = fma(_3190, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3316);
    float _3328 = _3272;
    float _3330 = _3324;
    float _3332 = _3300;
    float _3334 = _3220;
    if (!_3030)
    {
        float _3336 = -_3272;
        float _3338 = _2904 + _3336;
        _3328 = _3338;
    }
    float _3340 = _3328;
    bool _3342 = _3294 <= 1.0;
    bool _3344 = _3342 && _3322;
    float _3346 = _2906;
    if (!_3030)
    {
        float _3348 = floor(_2888);
        _3346 = _3348;
    }
    float _3350 = _3346;
    float _3352 = fma(_3318, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3326);
    float _3354 = _3298 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3356 = fma(_3304, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3324);
    float _3358 = fma(_3304, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3354);
    float _3360 = fma(_3190, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3356);
    float _3362 = 1.0 / _3352;
    float _3364 = _3314 * 0.693147182464599609375;
    float _3366 = fma(_3190, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3358);
    float _3368 = fma(_3318, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3360);
    if (_3344)
    {
        float _3370 = float(_2918);
        _3330 = _3370;
    }
    float _3372 = _3330;
    float _3374 = _2868 * _3218;
    float _3376 = fma(_3318, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3366);
    float _3378 = _3364 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    if (!_3030)
    {
        float _3380 = -_3350;
        float _3382 = _2888 + _3380;
        _3332 = _3382;
    }
    float _3384 = _3332;
    float _3386 = fma(_997, _3210, _3374);
    float _3388 = _3372;
    if (_3344)
    {
        float _3390 = rint(_3372);
        float _3392 = precise::max(_3390, 0.0);
        uint _3394 = uint(_3392);
        uint _3396 = clamp(_3394, 0u, 65535u);
        _3388 = as_type<float>(_3396);
    }
    float _3398 = _3388;
    float _3400 = fma(_1003, _3250, _3386);
    float _3402 = _3376 * _3362;
    float _3404 = _3400 + _3258;
    float _3406 = _3368 * _3362;
    float _3408 = fma(_3402, -0.5, 0.5);
    float _3410 = _3290;
    if (!_3030)
    {
        float _3412 = rint(_3290);
        float _3414 = precise::max(_3412, 0.0);
        uint _3416 = uint(_3414);
        uint _3418 = clamp(_3416, 0u, 65535u);
        _3410 = as_type<float>(_3418);
    }
    float _3420 = _3410;
    float _3422 = _3404 * _3220;
    float _3424 = fma(_3406, 0.5, 0.5);
    float _3426 = _3294;
    float _3428 = _3424;
    float _3430 = _3422;
    if (_3344)
    {
        float3 _9303 = float3(_3292, _3294, float(as_type<int>(_3398)));
        float3 _9307 = select(_9303, float3(0.0), isnan(_9303));
        float _3432 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9307.xy, uint(rint(_9307.z)), _3422, level(0.0));
        _3426 = _3432;
    }
    float _3434 = _3426;
    float3 _9317 = float3(_3424, _3408, _3378);
    float _3436 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9317, float3(0.0), isnan(_9317)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9317, float3(0.0), isnan(_9317)), level(0.0)).x;
    float3 _9326 = float3(_3424, _3408, _3378);
    float4 _3439 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9326, float3(0.0), isnan(_9326)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9326, float3(0.0), isnan(_9326)), level(0.0)).xyzw;
    float _3441 = _3439.x;
    float _3443 = _3439.y;
    float _3445 = _3439.z;
    float _3447 = _3439.w;
    float _3449 = _3384;
    if (!_3030)
    {
        float3 _9349 = float3(_3384, _3340, float(as_type<int>(_3420)));
        float3 _9351 = select(_9349, float3(0.0), isnan(_9349));
        float _3451 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9351.xy, uint(rint(_9351.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9351.xy, uint(rint(_9351.z)), level(0.0)).x;
        _3449 = _3451;
    }
    float _3453 = _3449;
    if (_3030)
    {
        _3334 = 1.0;
    }
    float _3455 = _3334;
    float _3457 = _3455;
    float _3459 = _3453;
    if (!_3030)
    {
        int _3461 = _3160 << 4;
        int _3463 = _3461 + 2048;
        uint _3465 = uint(int(uint(_3463) >> uint(2)));
        uint _3467 = uint(int(uint(int(_3465)) >> uint(2)));
        int _3469 = int(_3465) & 3;
        float _3471 = (*spvDescriptorSet0.vp_c15)._m0[int(_3467)][_3469];
        int _3473 = int(_3465) + 1;
        uint _3475 = uint(int(uint(_3473) >> uint(2)));
        int _3477 = _3473 & 3;
        float _3479 = (*spvDescriptorSet0.vp_c15)._m0[int(_3475)][_3477];
        int _3481 = _3463 + 8;
        uint _3483 = uint(int(uint(_3481) >> uint(2)));
        uint _3485 = uint(int(uint(int(_3483)) >> uint(2)));
        int _3487 = int(_3483) & 3;
        float _3489 = (*spvDescriptorSet0.vp_c15)._m0[int(_3485)][_3487];
        int _3491 = int(_3483) + 1;
        uint _3493 = uint(int(uint(_3491) >> uint(2)));
        int _3495 = _3491 & 3;
        float _3497 = (*spvDescriptorSet0.vp_c15)._m0[int(_3493)][_3495];
        float _3499 = _2868 * _3479;
        float _3501 = fma(_997, _3471, _3499);
        float _3503 = fma(_1003, _3489, _3501);
        float _3505 = _3503 + _3497;
        float _3507 = precise::clamp(_3505, 0.0, 1.0);
        float _3509 = -_3507;
        float _3511 = _3509 + _3453;
        float _3513 = fma(_3511, 500.0, 1.5);
        float _3515 = exp2(_3513);
        float _3517 = 0.0 + _3515;
        float _3519 = precise::clamp(_3517, 0.0, 1.0);
        _3428 = _3489;
        _3457 = _3519;
    }
    float _3521 = _3428;
    float _3523 = _3457;
    float _3525 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3527 = _3142 + _3525;
    float _3529 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3531 = _3144 + _3529;
    float _3533 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3535 = _3148 + _3533;
    float _3537 = _3527 * _3527;
    float _3539 = fma(_3531, _3531, _3537);
    float _3541 = fma(_3535, _3535, _3539);
    float _3543 = rsqrt(_3541);
    float _3545 = sqrt(_3541);
    float _3547 = _3543 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3549 = _3531 * _3547;
    float _3551 = _3535 * _3547;
    float _3553 = _3549 * _3549;
    float _3555 = _3551 * _3551;
    float _3557 = _3553 + _3555;
    float _3559 = sqrt(_3557);
    bool _3561 = _3559 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3563 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3565 = _3559 + _3563;
    float _3567 = _3535;
    float _3569 = _3565;
    float _3571 = _3521;
    float _3573 = _3527;
    if (_3561)
    {
        float _3575 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3567 = _3575;
    }
    float _3577 = _3567;
    if (_3561)
    {
        float _3579 = rsqrt(_3557);
        _3459 = _3579;
    }
    float _3581 = _3459;
    float _3583 = _3581;
    if (_3561)
    {
        float _3585 = _3565 * _3577;
        _3569 = _3585;
    }
    float _3587 = _3569;
    if (_3561)
    {
        float _3589 = _3587 * 0.15915493667125701904296875;
        _3571 = _3589;
    }
    float _3591 = _3571;
    float _3593 = _3543;
    if (_3561)
    {
        float _3595 = _3591 * 6.283185482025146484375;
        float _3597 = sin(_3595);
        _3593 = _3597;
    }
    float _3599 = _3593;
    float _3601 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3603 = precise::max(0.0, _3601);
    float _3605 = _3420;
    float _3607 = _3603;
    float _3609 = _3601;
    if (_3561)
    {
        float _3611 = _3591 * 6.283185482025146484375;
        float _3613 = cos(_3611);
        _3605 = _3613;
    }
    float _3615 = _3605;
    float _3617 = -_3547;
    float _3619 = -_3603;
    float _3621 = fma(_3527, _3617, _3619);
    if (!_3561)
    {
        _3607 = _3549;
    }
    float _3623 = _3607;
    float _3625 = _3623;
    if (_3561)
    {
        float _3627 = _3621 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3609 = _3627;
    }
    float _3629 = _3609;
    float _3631 = _3629;
    float _3633 = _3599;
    if (_3561)
    {
        float _3635 = fma(_3599, _3629, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3631 = _3635;
    }
    float _3637 = _3631;
    float _3639 = _3637;
    if (!_3561)
    {
        _3633 = _3553;
    }
    float _3641 = _3633;
    float _3643 = _3641;
    float _3645 = _3615;
    if (_3561)
    {
        float _3647 = _3615 + (-1.0);
        _3573 = _3647;
    }
    float _3649 = _3573;
    float _3651 = _3649;
    if (_3561)
    {
        float _3653 = _3581 * _3637;
        _1073 = _3653;
    }
    float _3655 = _1073;
    if (!_3561)
    {
        _3639 = _3621;
    }
    float _3657 = _3639;
    float _3659 = _3657;
    if (_3561)
    {
        float _3661 = _3649 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3583 = _3661;
    }
    float _3663 = _3583;
    if (_3561)
    {
        float _3665 = _3549 * _3655;
        _3625 = _3665;
    }
    float _3667 = _3625;
    if (!_3561)
    {
        _3651 = _3551;
    }
    float _3669 = _3651;
    float _3671 = _3669;
    if (_3561)
    {
        float _3673 = _3551 * _3655;
        _3671 = _3673;
    }
    float _3675 = _3671;
    if (_3561)
    {
        float _3677 = fma(_3621, _3615, _3663);
        _3659 = _3677;
    }
    float _3679 = _3659;
    if (_3561)
    {
        float _3681 = _3667 * _3667;
        _3643 = _3681;
    }
    float _3683 = _3643;
    if (!_3561)
    {
        _3645 = _3555;
    }
    float _3685 = _3645;
    float _3687 = _3685;
    if (_3561)
    {
        float _3689 = _3675 * _3675;
        _3687 = _3689;
    }
    float _3691 = _3687;
    float _3693 = fma(_3679, _3679, _3683);
    float _3695 = _3693 + _3691;
    float _3697 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3699 = fma(_3545, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3697);
    float _3701 = precise::clamp(_3699, 0.0, 1.0);
    float _3703 = -_3701;
    float _3705 = _3703 + 1.0;
    float _3707 = rsqrt(_3695);
    float _3709 = _3707 * _3679;
    float _3711 = _3707 * _3667;
    float _3713 = abs(_3705);
    float _3715 = log2(_3713);
    float _3717 = _3707 * _3675;
    float _3719 = _3711 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3721 = -_3719;
    float _3723 = fma(_3709, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3721);
    float _3725 = -_3717;
    float _3727 = fma(_3725, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3723);
    float _3729 = fma(_3727, -0.5, 0.5);
    float _3731 = _3715 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3733 = fma(_3727, 0.5, 0.5);
    float _3735 = exp2(_3731);
    float _3737 = fma(_3733, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3739 = fma(_3733, _3737, -0.212114393711090087890625);
    float _3741 = _3709 + 1.0;
    float _3743 = sqrt(_3729);
    float _3745 = fma(_3733, _3739, 1.570728778839111328125);
    float _3747 = -_3709;
    float _3749 = fma(_3735, _3741, _3747);
    float _3751 = fma(_3749, 0.5, 0.5);
    float _3753 = _3743 * 0.636619746685028076171875;
    float _3755 = -_3745;
    float _3757 = fma(_3753, _3755, 1.0);
    float2 _9824 = float2(_3757, _3751);
    float3 _3759 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9824, float2(0.0), isnan(_9824)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9824, float2(0.0), isnan(_9824)), level(0.0)).xyz;
    float _3761 = _3759.x;
    float _3763 = _3759.y;
    float _3765 = _3759.z;
    float _3767 = abs(_2876);
    float _3769 = log2(_3767);
    float _3771 = _3298 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3773 = -_2828;
    float _3775 = _3773 + 1.0;
    out.m_94.x = _3144;
    out.m_94.y = _3142;
    out.m_94.z = _3148;
    float _3777 = fma(_3304, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3771);
    bool _3779 = _2876 <= 8000.0;
    bool _3781 = isnan(_2876);
    bool _3783 = _3779 || _3781;
    bool _3785 = isnan(8000.0);
    bool _3787 = _3783 || _3785;
    float _3789 = float(_3787);
    float _3791 = _3715 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3793 = fma(_3190, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3777);
    float _3795 = fma(_3318, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3793);
    float _3797 = _3769 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3799 = exp2(_3791);
    float _3801 = _3795 + _3352;
    float _3803 = _3801 * 0.5;
    float _3805 = exp2(_3797);
    float _3807 = -_3799;
    float _3809 = _3807 + 1.0;
    float _3811 = _3809 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3813 = fma(_3805, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3815 = precise::clamp(_3813, 0.0, 1.0);
    float _3817 = fma(_3815, -2.0, 3.0);
    float _3819 = _3815 * _3815;
    float _3821 = _3819 * _3817;
    float _3823 = -_3821;
    float _3825 = _3823 + 1.0;
    float _3827 = fma(_3825, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3821);
    float _3829 = _3789 * _3827;
    float _3831 = _3789;
    float _3833 = _3368;
    float _3835 = _3775;
    if (!_3344)
    {
        _3831 = 1.0;
    }
    float _3837 = _3831;
    out.m_96.z = _3803;
    out.m_96.w = _3352;
    float _3839 = _3837;
    if (_3344)
    {
        bool _3841 = _3434 >= _3422;
        bool _3843 = isnan(_3434);
        bool _3845 = _3841 || _3843;
        bool _3847 = isnan(_3422);
        bool _3849 = _3845 || _3847;
        float _3851 = float(_3849);
        _3839 = _3851;
    }
    float _3853 = _3839;
    float _3855 = _3829 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3857 = _3811 * _3436;
    float _3859 = -_3811;
    float _3861 = _3859 + 1.0;
    bool _3863 = _3545 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3865 = isnan(_3545);
    bool _3867 = _3863 || _3865;
    bool _3869 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3871 = _3867 || _3869;
    float _3873 = _3775 * _3855;
    float _3875 = precise::clamp(_3873, 0.0, 1.0);
    float _3877 = _3853 * _3523;
    float _3879 = _3447 * _3857;
    float _3881 = _3447 * _3861;
    float _3883 = -_3875;
    float _3885 = fma(_3883, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.gl_Position.x = _3368;
    out.gl_Position.y = _3376;
    out.gl_Position.z = _3795;
    out.gl_Position.w = _3352;
    float _3887 = -_3877;
    float _3889 = fma(_3887, _3885, 1.0);
    float _3891 = precise::clamp(_3889, 0.0, 1.0);
    float _3893 = _3891 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3895 = _3885;
    float _3897 = _3891;
    float _3899 = _3857;
    if (!_3871)
    {
        _3895 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3901 = _3895;
    float _3903 = _3901;
    float _3905 = _3901;
    if (!_3871)
    {
        _3897 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3907 = _3897;
    out.m_98.x = _3893;
    float _3909 = _3907;
    float _3911 = _3907;
    if (!_3871)
    {
        _3430 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3913 = _3430;
    float _3915 = _3913;
    float _3917 = _3913;
    if (!_3871)
    {
        _3833 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3919 = _3833;
    float _3921 = _3919;
    float _3923 = _3919;
    if (!_3871)
    {
        _3835 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3925 = _3835;
    float _3927 = _3765 * _3857;
    float _3929 = fma(_3761, _3879, _3441);
    float _3931 = fma(_3763, _3879, _3443);
    float _3933 = _3925;
    float _3935 = _3925;
    if (!_3871)
    {
        _3899 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3937 = _3899;
    float _3939 = fma(_3447, _3927, _3445);
    out.m_100.x = _3929;
    out.m_100.y = _3931;
    out.m_100.z = _3939;
    out.m_100.w = _3881;
    bool _3941 = !_3871;
    float _3943 = _3937;
    float _3945 = _3937;
    if (!_3941)
    {
        bool _3947 = _3545 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3949 = isnan(_3545);
        bool _3951 = _3947 || _3949;
        bool _3953 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3955 = _3951 || _3953;
        if (!_3955)
        {
            float _3957 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3959 = _3545 + _3957;
            float _3961 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3963 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3961;
            float _3965 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3967 = _3965 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3969 = 1.0 / _3963;
            float _3971 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3973 = _3971 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3975 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3977 = _3975 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3979 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3981 = _3979 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3983 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3985 = _3983 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3987 = _3959 * _3969;
            float _3989 = precise::clamp(_3987, 0.0, 1.0);
            float _3991 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3993 = _3991 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3995 = fma(_3989, _3967, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3997 = fma(_3989, _3993, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3999 = fma(_3989, _3973, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4001 = fma(_3989, _3977, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4003 = fma(_3989, _3981, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4005 = fma(_3989, _3985, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3905 = _3999;
            _3945 = _4003;
            _3923 = _3995;
            _3917 = _4001;
            _3911 = _3997;
            _3935 = _4005;
            _4007 = true;
        }
        else
        {
            bool _4009 = _3545 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4011 = isnan(_3545);
            bool _4013 = _4009 || _4011;
            bool _4015 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4017 = _4013 || _4015;
            if (!_4017)
            {
                _3921 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4019 = _3921;
            _3923 = _4019;
            if (!_4017)
            {
                _3903 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4021 = _3903;
            _3905 = _4021;
            if (!_4017)
            {
                _3909 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4023 = _3909;
            _3911 = _4023;
            if (!_4017)
            {
                _3915 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4025 = _3915;
            _3917 = _4025;
            if (!_4017)
            {
                _3943 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4027 = _3943;
            _3945 = _4027;
            if (!_4017)
            {
                _3933 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4029 = _3933;
            bool _4031 = !_4017;
            _3935 = _4029;
            if (!_4031)
            {
                bool _4033 = _3545 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4035 = isnan(_3545);
                bool _4037 = _4033 || _4035;
                bool _4039 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4041 = _4037 || _4039;
                if (!_4041)
                {
                    float _4043 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4045 = _3545 + _4043;
                    float _4047 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4049 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4047;
                    float _4051 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4053 = _4051 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4055 = 1.0 / _4049;
                    float _4057 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4059 = _4057 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4061 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4063 = _4061 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4065 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4067 = _4065 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4069 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4071 = _4069 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4073 = _4045 * _4055;
                    float _4075 = precise::clamp(_4073, 0.0, 1.0);
                    float _4077 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4079 = _4077 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4081 = fma(_4075, _4053, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4083 = fma(_4075, _4079, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4085 = fma(_4075, _4059, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4087 = fma(_4075, _4063, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4089 = fma(_4075, _4067, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4091 = fma(_4075, _4071, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3905 = _4085;
                    _3945 = _4089;
                    _3923 = _4081;
                    _3917 = _4087;
                    _3911 = _4083;
                    _3935 = _4091;
                    _4007 = true;
                }
                else
                {
                    _3905 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3945 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3923 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3917 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3911 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3935 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4007 = false;
    float _4093 = _3905;
    float _4095 = _3945;
    float _4097 = _3923;
    float _4099 = _3917;
    float _4101 = _3911;
    float _4103 = _3935;
    float _4105 = fma(_2742, -0.5, 0.5);
    float _4107 = precise::clamp(_4105, 0.0, 1.0);
    float _4109 = -_4093;
    float _4111 = _4109 + _4095;
    float _4113 = -_4097;
    float _4115 = _4113 + _4099;
    float _4117 = -_4101;
    float _4119 = _4117 + _4103;
    bool _4121 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4123 = fma(_4107, _4111, _4093);
    float _4125 = fma(_4107, _4115, _4097);
    float _4127 = fma(_4107, _4119, _4101);
    float _4129 = _4123 * 0.586610972881317138671875;
    out.m_102.x = 0.0;
    float _4131 = fma(_4125, 0.298911988735198974609375, _4129);
    float _4133 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4135 = fma(_4127, 0.114477999508380889892578125, _4131);
    out.m_63.x = _4133;
    float _4137 = -_4135;
    float _4139 = _4125 + _4137;
    float _4141 = -_4135;
    float _4143 = _4123 + _4141;
    float _4145 = -_4135;
    float _4147 = _4127 + _4145;
    float _4149 = fma(_4139, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4135);
    float _4151 = fma(_4143, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4135);
    float _4153 = fma(_4147, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4135);
    out.m_104.x = _4149;
    out.m_104.y = _4151;
    out.m_104.z = _4153;
    if (!_4121)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4155 = -_3142;
    float _4157 = _4155 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4159 = -_3144;
    float _4161 = _4159 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4163 = -_3148;
    float _4165 = _4163 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4167 = _4157 * _4157;
    float _4169 = fma(_4161, _4161, _4167);
    float _4171 = fma(_4165, _4165, _4169);
    float _4173 = sqrt(_4171);
    float _4175 = rsqrt(_4171);
    float _4177 = -_4173;
    float _4179 = _4177 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4181 = _4179 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4183 = precise::clamp(_4181, 0.0, 1.0);
    float _4185 = _4161 * _4175;
    float _4187 = _4157 * _4175;
    float _4189 = abs(_4183);
    float _4191 = log2(_4189);
    float _4193 = _4165 * _4175;
    float _4195 = _4185 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4197 = _2742 * _4187;
    float _4199 = -_4187;
    float _4201 = -_4195;
    float _4203 = fma(_4199, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4201);
    float _4205 = fma(_2736, _4185, _4197);
    float _4207 = -_4193;
    float _4209 = fma(_4207, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4203);
    float _4211 = fma(_2744, _4193, _4205);
    float _4213 = precise::clamp(_4211, 0.0, 1.0);
    float _4215 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4217 = _4209 + _4215;
    float _4219 = _4191 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4221 = _4217 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4223 = precise::clamp(_4221, 0.0, 1.0);
    float _4225 = exp2(_4219);
    float _4227 = _4225 * _4223;
    float _4229 = _4213 * _4227;
    float _4231 = _4229 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4233 = _4229 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4235 = _4229 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_102.x = _4231;
    out.m_102.y = _4233;
    out.m_102.z = _4235;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4007 = false;
    bool _2780 = false;
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
        float _4292 = as_type<float>(_139);
        out.gl_Position.z = _4292;
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
    float _159 = 0.0;
    float _161 = _157;
    if (_153)
    {
        float _163 = float(_123);
        _159 = _163;
    }
    float _165 = _159;
    bool _167 = _157 >= _165;
    bool _169 = !_153;
    bool _171 = _167 || _169;
    if (_171)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _173 = _133;
    if (_171)
    {
        out.m_63.x = 0.0;
    }
    if (_171)
    {
        float _175 = _173 * 5.0;
        _141 = as_type<int>(_175);
    }
    int _177 = _141;
    if (_171)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4361 = as_type<float>(_177);
        out.gl_Position.z = _4361;
    }
    if (_171)
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
    int _255 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _257 = _255 != 0;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _261 = _259 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _265 = 1.0 / _251;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _269 = _227 + _267;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _279 = _277 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _281 = _231 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _283 = float(_123);
    float _285 = 1.0 / _247;
    float _287 = _229 * 2.0;
    float _289 = _269 * _253;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _293 = _227 + _291;
    float _295 = fma(_281, -2.0, _271);
    float _297 = fma(_275, _289, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _299 = floor(_287);
    float _301 = _229 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _307 = -_263;
    float _309 = fma(_301, 2.0, _307);
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _313 = _227 + _311;
    float _315 = 1.0 / _261;
    float _317 = _233 * 2.0;
    float _319 = _313 * _265;
    float _321 = _293 * _285;
    float _323 = _233 + _229;
    float _325 = _229 + _231;
    float _327 = fma(_279, _321, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _329 = floor(_317);
    float _331 = _231 * 2.0;
    float _333 = _323 + (-1.0);
    float _335 = _325 + (-1.0);
    float _337 = _233 + _231;
    bool _339 = _299 > 0.0;
    float _341 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _343 = floor(_331);
    float _345 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _347 = _337 + (-1.0);
    float _349 = _239 * _315;
    bool _351 = _299 >= 0.0;
    bool _353 = isnan(_299);
    bool _355 = _351 || _353;
    bool _357 = isnan(0.0);
    bool _359 = _355 || _357;
    float _361 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _363 = as_type<int>(_347);
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[198].y;
    if (_257)
    {
        _363 = 0;
    }
    int _367 = _363;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _369;
    bool _373 = _329 > 0.0;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _377 = _375 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _379 = _329 >= 0.0;
    bool _381 = isnan(_329);
    bool _383 = _379 || _381;
    bool _385 = isnan(0.0);
    bool _387 = _383 || _385;
    float _389 = fma(_371, _289, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _391 = _367;
    if (!_257)
    {
        _391 = 1;
    }
    int _393 = _391;
    float _395 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _397 = int(_395);
    int _399 = _359 ? 0 : 1;
    float _401 = fma(_377, _321, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _403 = _343 > 0.0;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _407 = _343 >= 0.0;
    bool _409 = isnan(_343);
    bool _411 = _407 || _409;
    bool _413 = isnan(0.0);
    bool _415 = _411 || _413;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _419 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _421 = int(_419);
    float _423 = -_157;
    float _425 = fma(_423, (*spvDescriptorSet0.vp_c9)._m0[76].x, _309);
    int _427 = _387 ? 0 : 1;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _429;
    bool _433 = _393 != 1;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _435;
    int _439 = ~_399;
    int _441 = _439 + 1;
    int _443 = _441 + 1;
    float _445 = fma(_431, _319, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    int _447 = _443;
    float _449 = as_type<float>(_397);
    if (!_339)
    {
        int _451 = ~_399;
        int _453 = _451 + 1;
        _447 = _453;
    }
    int _455 = _447;
    float _457 = fma(_437, _319, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    int _459 = _415 ? 0 : 1;
    float _461 = 1.0 / _283;
    int _463 = ~_427;
    int _465 = _463 + 1;
    int _467 = _465 + 1;
    int _469 = _467;
    if (!_373)
    {
        int _471 = ~_427;
        int _473 = _471 + 1;
        _469 = _473;
    }
    int _475 = _469;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _479 = _477 != 0;
    int _481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _483 = _481 != 0;
    int _485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _487 = _485 != 0;
    int _489 = ~_459;
    int _491 = _489 + 1;
    int _493 = _491 + 1;
    int _495 = _493;
    if (!_403)
    {
        int _497 = ~_459;
        int _499 = _497 + 1;
        _495 = _499;
    }
    int _501 = _495;
    float _503 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _505 = log2(_503);
    bool _507 = !_483;
    int _509 = _507 ? 0 : 1;
    bool _511 = !_479;
    int _513 = _511 ? 0 : 1;
    bool _515 = !_487;
    int _517 = _515 ? 0 : 1;
    float _519 = _461 * _157;
    int _521 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _523 = _521 != 0;
    int _525 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _527 = _525 != 0;
    int _529 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _531 = _529 != 0;
    float _533 = float(_397);
    if (!_433)
    {
        _449 = _231;
    }
    float _535 = _449;
    float _537 = _535;
    if (_433)
    {
        _537 = _229;
    }
    float _539 = _537;
    bool _541 = !_523;
    float _543 = _541 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _545 = 1.0 / _533;
    float _547 = _543;
    if (!_433)
    {
        _365 = _231;
    }
    float _549 = _365;
    float _551 = _539 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _553 = abs(as_type<int>(_543));
    float _555 = _549;
    if (_433)
    {
        _555 = _229;
    }
    float _557 = _555;
    float _559 = -_303;
    float _561 = fma(_551, 2.0, _559);
    float _563 = float(_553);
    float _565 = _505 * _157;
    float _567 = float(_475);
    float _569 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[83].z, _305);
    float _571 = _557;
    if (!_433)
    {
        _571 = _233;
    }
    float _573 = _571;
    float _575 = _573;
    if (_433)
    {
        _575 = _231;
    }
    float _577 = _575;
    float _579 = _563 * _567;
    float _581 = exp2(_565);
    if (!_433)
    {
        _547 = _233;
    }
    float _583 = _547;
    float _585 = _577 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _587 = _583;
    if (_433)
    {
        _587 = _231;
    }
    float _589 = _587;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _593 = 1.0 + _591;
    float _595 = float(_421);
    float _597 = fma(_585, -2.0, _405);
    float _599 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[83].w, _417);
    float _601 = 1.0 / _595;
    float _603 = in.m_72.x;
    float _605 = in.m_72.y;
    float _607 = in.m_72.z;
    float _609 = _545 * _157;
    bool _611 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _613 = isnan(1.0);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _619 = _615 || _617;
    float _621 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[82].z, _569);
    bool _623 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _625 = isnan(0.0);
    bool _627 = _623 || _625;
    bool _629 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _631 = _627 || _629;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _635 = 1.0 / _593;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _639 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _641 = isnan(_227);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    float _651 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[78].z, _633);
    bool _653 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _655 = isnan(_227);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[78].w, _637);
    float _667 = -_581;
    float _669 = _667 + 1.0;
    float _671 = -_649;
    float _673 = _671 + 1.0;
    float _675 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[76].y, _295);
    float _677 = _601 * _157;
    float _679 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[77].z, _651);
    float _681 = _631 ? _669 : 0.0;
    float _683 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[82].w, _599);
    float _685 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[77].w, _665);
    float _687 = -_157;
    float _689 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[81].x, _561);
    float _691 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[81].y, _597);
    float _693 = _609;
    if (_619)
    {
        float _695 = _681 * _635;
        _161 = _695;
    }
    float _697 = _161;
    float _699 = _579 * (-2.0);
    bool _701 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _703 = isnan(_227);
    bool _705 = _701 || _703;
    bool _707 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _709 = _705 || _707;
    float _711 = float(_709);
    float _713 = _663 * _673;
    float _715 = -_663;
    float _717 = _715 + 1.0;
    bool _719 = !_527;
    int _721 = _719 ? 0 : 1;
    float _723 = fma(_345, _699, _345);
    float _725 = fma(_699, _603, _603);
    float _727 = _711 * _717;
    bool _729 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _731 = isnan(_227);
    bool _733 = _729 || _731;
    bool _735 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _737 = _733 || _735;
    float _739 = float(_737);
    float _741 = -_711;
    float _743 = _741 + 1.0;
    int _745 = abs(_721);
    bool _747 = !_531;
    int _749 = _747 ? 0 : 1;
    float _751 = _739 * _743;
    float _753 = float(_455);
    float _755 = -_739;
    float _757 = _755 + 1.0;
    float _759 = float(_745);
    bool _761 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _763 = isnan(_227);
    bool _765 = _761 || _763;
    bool _767 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _769 = _765 || _767;
    float _771 = float(_769);
    int _773 = abs(_749);
    float _775 = _229 + (-0.5);
    float _777 = _759 * _753;
    float _779 = _771 * _757;
    float _781 = float(_773);
    float _783 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[196].x, _725);
    float _785 = float(_501);
    float _787 = _777 * (-2.0);
    float _789 = _297 * _779;
    float _791 = _389 * _779;
    float _793 = -_771;
    float _795 = _793 + 1.0;
    float _797 = _781 * _785;
    float _799 = _231 + (-0.5);
    float _801 = fma(_787, _605, _605);
    float _803 = fma(_723, _697, _783);
    float _805 = fma(_361, _787, _361);
    float _807 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[143].y, _791);
    float _809 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[196].y, _801);
    float _811 = _803 * 0.15915493667125701904296875;
    float _813 = _797 * (-2.0);
    float _815 = fma(_401, _751, _807);
    float _817 = fma(_805, _697, _809);
    float _819 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[143].x, _789);
    float _821 = in.m_74.x;
    float _823 = in.m_74.y;
    float _825 = fma(_341, _813, _341);
    float _827 = fma(_813, _607, _607);
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _831 = _829 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _833 = _233 + (-0.5);
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _837 = _835 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _839 = fma(_327, _751, _819);
    float _841 = _817 * 0.15915493667125701904296875;
    float _843 = in.m_60.x;
    float _845 = in.m_60.y;
    float _847 = in.m_60.z;
    float _849 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[196].z, _827);
    float _851 = fma(_831, _349, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _853 = fma(_837, _349, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _855 = in.m_76.x;
    float _857 = in.m_76.y;
    float _859 = in.m_76.z;
    float _861 = in.m_76.w;
    float _863 = fma(_457, _727, _815);
    float _865 = fma(_445, _727, _839);
    float _867 = fma(_825, _697, _849);
    float _869 = _811 * 6.283185482025146484375;
    float _871 = cos(_869);
    float _873 = fma(_853, _713, _863);
    float _875 = fma(_851, _713, _865);
    float _877 = _867 * 0.15915493667125701904296875;
    float _879 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _881 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[147].y, _873);
    float _883 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[147].x, _875);
    float _885 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _887 = _841 * 6.283185482025146484375;
    float _889 = sin(_887);
    float _891 = _881 * _823;
    float _893 = _883 * _821;
    float _895 = _891 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _897 = _893 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _899 = _841 * 6.283185482025146484375;
    float _901 = cos(_899);
    float _903 = in.m_78.x;
    float _905 = in.m_78.y;
    float _907 = in.m_78.z;
    float _909 = in.m_78.w;
    float _911 = _895 * _879;
    float _913 = _897 * _885;
    float _915 = _845 * _857;
    float _917 = _811 * 6.283185482025146484375;
    float _919 = sin(_917);
    float _921 = fma(_843, _855, _915);
    float _923 = _871 * _889;
    float _925 = fma(_847, _859, _921);
    float _927 = _877 * 6.283185482025146484375;
    float _929 = cos(_927);
    float _931 = _871 * _901;
    float _933 = _877 * 6.283185482025146484375;
    float _935 = sin(_933);
    float _937 = _919 * _889;
    float _939 = _919 * _901;
    float _941 = _871 * _929;
    float _943 = _919 * _929;
    float _945 = _901 * _929;
    float _947 = _889 * _929;
    float _949 = _941 * _911;
    float _951 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _953 = _943 * _911;
    float _955 = fma(_935, _931, _937);
    float _957 = -_923;
    float _959 = fma(_935, _939, _957);
    float _961 = -_939;
    float _963 = fma(_935, _923, _961);
    float _965 = -_911;
    float _967 = _935 * _965;
    float _969 = fma(_955, _913, _949);
    float _971 = fma(_935, _937, _931);
    float _973 = fma(_945, _913, _967);
    float _975 = fma(_963, _951, _969);
    float _977 = _845 * _905;
    float _979 = fma(_959, _913, _953);
    float _981 = fma(_947, _951, _973);
    float _983 = _975 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _985 = _975 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _987 = fma(_843, _903, _977);
    float _989 = fma(_971, _951, _979);
    float _991 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[24].x, _983);
    float _993 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[26].x, _985);
    float _995 = fma(_847, _907, _987);
    float _997 = _925 + _861;
    float _999 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[24].z, _991);
    float _1001 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[26].z, _993);
    float _1003 = _995 + _909;
    float _1005 = _999 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1007 = _1001 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1009 = _997 + _1005;
    float _1011 = _1003 + _1007;
    float _1013 = in.m_80.x;
    float _1015 = in.m_80.y;
    float _1017 = in.m_80.z;
    float _1019 = in.m_80.w;
    float _1021 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1023 = _1009 + _1021;
    float _1025 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1027 = _1011 + _1025;
    float _1029 = _1023 * _1023;
    float _1031 = _1027 * _1027;
    float _1033 = _1029 + _1031;
    float _1035 = sqrt(_1033);
    float _1037 = _845 * _1015;
    float _1039 = fma(_843, _1013, _1037);
    bool _1041 = _1035 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1043 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1045 = _1035 + _1043;
    float _1047 = _975 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1049 = fma(_847, _1017, _1039);
    float _1051 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1047);
    float _1053 = _1049 + _1019;
    float _1055 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1051);
    float _1057 = _853;
    float _1059 = _1033;
    float _1061 = _975;
    float _1063 = _845;
    float _1065 = _1009;
    float _1067 = _1011;
    float _1069 = _1029;
    float _1071 = _1031;
    float _1073 = _1003;
    if (_1041)
    {
        float _1075 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1057 = _1075;
    }
    float _1077 = _1057;
    float _1079 = _1055 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1081 = _1079;
    if (_1041)
    {
        float _1083 = rsqrt(_1033);
        _1059 = _1083;
    }
    float _1085 = _1059;
    float _1087 = _1077;
    if (_1041)
    {
        float _1089 = _1045 * _1077;
        _1087 = _1089;
    }
    float _1091 = _1087;
    if (_1041)
    {
        float _1093 = _1091 * 0.15915493667125701904296875;
        _1061 = _1093;
    }
    float _1095 = _1061;
    float _1097 = _1053 + _1079;
    float _1099 = _843;
    float _1101 = _1097;
    if (_1041)
    {
        float _1103 = _1095 * 6.283185482025146484375;
        float _1105 = sin(_1103);
        _1099 = _1105;
    }
    float _1107 = _1099;
    if (_1041)
    {
        float _1109 = _1097 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1063 = _1109;
    }
    float _1111 = _1063;
    float _1113 = _1111;
    if (_1041)
    {
        float _1115 = fma(_1107, _1111, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1113 = _1115;
    }
    float _1117 = _1113;
    float _1119 = _1117;
    if (_1041)
    {
        float _1121 = _1085 * _1117;
        _1119 = _1121;
    }
    float _1123 = _1119;
    if (_1041)
    {
        float _1125 = fma(_1023, _1123, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1065 = _1125;
    }
    float _1127 = _1065;
    if (_1041)
    {
        float _1129 = fma(_1027, _1123, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1067 = _1129;
    }
    float _1131 = _1067;
    float _1133 = fma(_1127, 6.2500002968590706586837768554688e-05, 0.5);
    float _1135 = fma(_1131, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5831 = float2(_1133, _1135);
    float3 _1139 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5831, float2(0.0), isnan(_5831)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5831, float2(0.0), isnan(_5831)), level(0.0)).xyz;
    float _1141 = _1139.x;
    float _1143 = _1139.y;
    float _1145 = _1139.z;
    float _1147 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1149 = int(_1147);
    if (_257)
    {
        float _1151 = in.m_70.x;
        _1081 = _1151;
    }
    float _1153 = _1081;
    int _1155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1157 = _1155 != 0;
    float _1159 = -_679;
    float _1161 = _1159 + 1.0;
    int _1163 = abs(_509);
    float _1165 = _1153;
    if (!_257)
    {
        float _1167 = in.m_70.y;
        _1165 = _1167;
    }
    float _1169 = _1165;
    float _1171 = -_621;
    float _1173 = _1171 + 1.0;
    float _1175 = -_683;
    float _1177 = _1175 + 1.0;
    float _1179 = trunc(_609);
    int _1181 = int(_1179);
    float _1183 = float(uint(_1149));
    float _1185 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1187 = int(_1185);
    if (_257)
    {
        _693 = 1.0;
    }
    float _1189 = _693;
    float _1191 = _1189;
    if (!_257)
    {
        _1191 = 1.2345600128173828125;
    }
    float _1193 = _1191;
    float _1195 = float(uint(_1181));
    float _1197 = 1.0 / _1183;
    float _1199 = _1193 * _1169;
    int _1201 = ~_1149;
    int _1203 = _1201 + 1;
    float _1205 = float(uint(_1187));
    float _1207 = trunc(_677);
    int _1209 = int(_1207);
    int _1211 = ~_1149;
    int _1213 = _1211 + 1;
    int _1215 = as_type<int>(_1197) + (-2);
    float _1217 = 1.0 / _1205;
    float _1219 = as_type<float>(_1215) * _1195;
    float _1221 = float(uint(_1209));
    float _1223 = floor(_1199);
    float _1225 = float(_1209);
    float _1227 = trunc(_1219);
    float _1229 = precise::max(_1227, 0.0);
    uint _1232 = uint(_1229);
    float _1234 = -_1223;
    float _1236 = _1199 + _1234;
    int _1238 = _1213 * int(_1232);
    int _1240 = _1238 + _1181;
    float _1242 = float(uint(_1240));
    float _1244 = as_type<float>(_1215) * _1242;
    int _1246 = as_type<int>(_1217) + (-2);
    float _1248 = _1217;
    if (_257)
    {
        _1248 = 1.0;
    }
    float _1250 = _1248;
    float _1252 = _1250;
    if (!_257)
    {
        _1252 = 7.345489978790283203125;
    }
    float _1254 = _1252;
    float _1256 = trunc(_1244);
    float _1258 = precise::max(_1256, 0.0);
    uint _1260 = uint(_1258);
    float _1262 = as_type<float>(_1246) * _1221;
    int _1264 = ~_1187;
    int _1266 = _1264 + 1;
    float _1268 = _1254 * _229;
    float _1270 = trunc(_1262);
    float _1272 = precise::max(_1270, 0.0);
    uint _1274 = uint(_1272);
    int _1276 = int(_1232) + int(_1260);
    float _1278 = floor(_1268);
    float _1280 = float(_1149);
    int _1282 = _1203 * _1276;
    int _1284 = _1282 + _1181;
    float _1286 = float(_1181);
    int _1288 = _1266 * int(_1274);
    int _1290 = _1288 + _1209;
    bool _1292 = _1286 >= _1280;
    bool _1294 = isnan(_1286);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan(_1280);
    bool _1300 = _1296 || _1298;
    float _1302 = float(_1300);
    bool _1304 = uint(_1284) >= uint(_1149);
    float _1306 = float(uint(_1290));
    float _1308 = trunc(_1302);
    int _1310 = int(_1308);
    bool _1312 = !_1304;
    int _1314 = _1312 ? 0 : (-1);
    float _1316 = -_1278;
    float _1318 = _1268 + _1316;
    float _1320 = as_type<float>(_1246) * _1306;
    int _1322 = ~_1276;
    int _1324 = _1322 + _1314;
    int _1326 = _1324 + 1;
    float _1328 = _1318 * _1280;
    int _1330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1332 = _1330 != 0;
    float _1334 = trunc(_1320);
    float _1336 = precise::max(_1334, 0.0);
    uint _1338 = uint(_1336);
    int _1340 = _1149 * _1326;
    int _1342 = _1340 + _1181;
    int _1344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1346 = _1344 != 0;
    int _1348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1350 = _1348 != 0;
    int _1352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1354 = _1352 != 0;
    int _1356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1358 = _1356 != 0;
    float _1360 = _1280 * _519;
    bool _1362 = !_1332;
    int _1364 = _1362 ? 0 : 1;
    bool _1366 = _1149 == 0;
    float _1368 = trunc(_1328);
    int _1370 = int(_1368);
    int _1372 = ~_1310;
    int _1374 = _1372 + 1;
    int _1376 = _1374 + 1;
    bool _1378 = !_1366;
    int _1380 = _1378 ? _1342 : (-1);
    int _1382 = _1149 + (-1);
    int _1384 = abs(_1364);
    int _1386 = _1380 * _1376;
    int _1388 = int(_1274) + int(_1338);
    float _1390 = trunc(_1360);
    int _1392 = int(_1390);
    int _1394 = ~_1187;
    int _1396 = _1394 + 1;
    int _1398 = _1310 * _1382;
    int _1400 = _1398 + _1386;
    float _1402 = float(_1187);
    int _1404 = _1396 * _1388;
    int _1406 = _1404 + _1209;
    bool _1408 = _1225 >= _1402;
    bool _1410 = isnan(_1225);
    bool _1412 = _1408 || _1410;
    bool _1414 = isnan(_1402);
    bool _1416 = _1412 || _1414;
    float _1418 = float(_1416);
    float _1420 = _1236 * _1402;
    bool _1422 = !_1157;
    int _1424 = _1422 ? 0 : 1;
    int _1426 = _1400 * _1163;
    bool _1428 = uint(_1406) >= uint(_1187);
    float _1430 = trunc(_1418);
    int _1432 = int(_1430);
    float _1434 = _1402 * _519;
    bool _1436 = !_1428;
    int _1438 = _1436 ? 0 : (-1);
    int _1440 = abs(_513);
    int _1442 = _1370 * _1384;
    int _1444 = _1442 + _1181;
    int _1446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1448 = _1446 != 0;
    float _1450 = trunc(_1420);
    int _1452 = int(_1450);
    int _1454 = ~_1388;
    int _1456 = _1454 + _1438;
    int _1458 = _1456 + 1;
    int _1460 = _1392 * _1440;
    int _1462 = _1460 + _1426;
    bool _1464 = !_1448;
    int _1466 = _1464 ? 0 : 1;
    int _1468 = abs(_517);
    int _1470 = _1187 * _1458;
    int _1472 = _1470 + _1209;
    int _1474 = abs(_1466);
    float _1476 = trunc(_1434);
    int _1478 = int(_1476);
    bool _1480 = _1187 == 0;
    int _1482 = abs(_1424);
    int _1484 = ~_1432;
    int _1486 = _1484 + 1;
    int _1488 = _1486 + 1;
    int _1490 = _1444 * _1468;
    int _1492 = _1490 + _1462;
    bool _1494 = !_1480;
    int _1496 = _1494 ? _1472 : (-1);
    int _1498 = _1452 * _1474;
    int _1500 = _1498 + _1209;
    int _1502 = _1187 + (-1);
    int _1504 = _1370 * _1482;
    int _1506 = _1504 + _1492;
    int _1508 = ~_1149;
    int _1510 = _1508 + 1;
    int _1512 = _1496 * _1488;
    bool _1514 = !_1350;
    int _1516 = _1514 ? 0 : 1;
    float _1518 = float(uint(_1506));
    int _1520 = _1432 * _1502;
    int _1522 = _1520 + _1512;
    bool _1524 = !_1346;
    int _1526 = _1524 ? 0 : 1;
    int _1528 = abs(_1516);
    bool _1530 = !_1354;
    int _1532 = _1530 ? 0 : 1;
    int _1534 = abs(_1526);
    int _1536 = _1522 * _1528;
    int _1538 = abs(_1532);
    float _1540 = as_type<float>(_1215) * _1518;
    bool _1542 = !_1358;
    int _1544 = _1542 ? 0 : 1;
    int _1546 = abs(_1544);
    float _1548 = trunc(_1540);
    float _1550 = precise::max(_1548, 0.0);
    uint _1552 = uint(_1550);
    int _1554 = _1478 * _1534;
    int _1556 = _1554 + _1536;
    float _1558 = float(uint(_1500));
    int _1560 = _1500 * _1538;
    int _1562 = _1560 + _1556;
    int _1564 = ~_1149;
    int _1566 = _1564 + 1;
    float _1568 = float(uint(_1444));
    int _1570 = _1452 * _1546;
    int _1572 = _1570 + _1562;
    int _1574 = ~_1187;
    int _1576 = _1574 + 1;
    float _1578 = as_type<float>(_1215) * _1568;
    float _1580 = float(uint(_1572));
    int _1582 = _1566 * int(_1552);
    int _1584 = _1582 + _1506;
    float _1586 = as_type<float>(_1246) * _1580;
    float _1588 = float(uint(_1584));
    float _1590 = trunc(_1578);
    float _1592 = precise::max(_1590, 0.0);
    uint _1594 = uint(_1592);
    float _1596 = as_type<float>(_1215) * _1588;
    float _1598 = as_type<float>(_1246) * _1558;
    float _1600 = trunc(_1586);
    float _1602 = precise::max(_1600, 0.0);
    uint _1604 = uint(_1602);
    float _1606 = trunc(_1596);
    float _1608 = precise::max(_1606, 0.0);
    uint _1610 = uint(_1608);
    int _1612 = _1576 * int(_1604);
    int _1614 = _1612 + _1572;
    float _1616 = trunc(_1598);
    float _1618 = precise::max(_1616, 0.0);
    uint _1620 = uint(_1618);
    int _1622 = ~_1149;
    int _1624 = _1622 + 1;
    float _1626 = float(uint(_1614));
    int _1628 = _1624 * int(_1594);
    int _1630 = _1628 + _1444;
    int _1632 = int(_1552) + int(_1610);
    float _1634 = as_type<float>(_1246) * _1626;
    int _1636 = ~_1187;
    int _1638 = _1636 + 1;
    float _1640 = float(uint(_1630));
    int _1642 = _1510 * _1632;
    int _1644 = _1642 + _1506;
    float _1646 = trunc(_1634);
    float _1648 = precise::max(_1646, 0.0);
    uint _1650 = uint(_1648);
    float _1652 = as_type<float>(_1215) * _1640;
    bool _1654 = uint(_1644) >= uint(_1149);
    int _1656 = _1638 * int(_1620);
    int _1658 = _1656 + _1500;
    bool _1660 = !_1654;
    int _1662 = _1660 ? 0 : (-1);
    float _1664 = trunc(_1652);
    float _1666 = precise::max(_1664, 0.0);
    uint _1668 = uint(_1666);
    float _1670 = float(uint(_1658));
    int _1672 = ~_1632;
    int _1674 = _1672 + _1662;
    int _1676 = _1674 + 1;
    int _1678 = ~_1187;
    int _1680 = _1678 + 1;
    float _1682 = as_type<float>(_1246) * _1670;
    int _1684 = int(_1604) + int(_1650);
    int _1686 = _1149 * _1676;
    int _1688 = _1686 + _1506;
    float _1690 = trunc(_1682);
    float _1692 = precise::max(_1690, 0.0);
    uint _1694 = uint(_1692);
    int _1696 = ~_1149;
    int _1698 = _1696 + 1;
    int _1700 = _1680 * _1684;
    int _1702 = _1700 + _1572;
    bool _1704 = !_1366;
    int _1706 = _1704 ? _1688 : (-1);
    int _1708 = int(_1594) + int(_1668);
    int _1710 = _1706 & 3;
    bool _1712 = _1710 != 0;
    int _1714 = _1706 & 3;
    bool _1716 = _1714 != 0;
    bool _1718 = uint(_1702) >= uint(_1187);
    int _1720 = _1712 ? 0 : 1;
    bool _1722 = uint(_1714) > 1u;
    bool _1724 = uint(_1714) >= 2u;
    bool _1726 = !_1718;
    int _1728 = _1726 ? 0 : (-1);
    int _1730 = _1724 ? 0 : 1;
    int _1732 = ~_1187;
    int _1734 = _1732 + 1;
    bool _1736 = _1714 != 3;
    bool _1738 = _235 > 0.5;
    int _1740 = _1698 * _1708;
    int _1742 = _1740 + _1444;
    int _1744 = int(_1620) + int(_1694);
    int _1746 = ~_1720;
    int _1748 = _1746 + 1;
    int _1750 = _1748 + 1;
    int _1752 = ~_1684;
    int _1754 = _1752 + _1728;
    int _1756 = _1754 + 1;
    int _1758 = _1734 * _1744;
    int _1760 = _1758 + _1500;
    int _1762 = _1750;
    if (!_1722)
    {
        int _1764 = ~_1720;
        int _1766 = _1764 + 1;
        _1762 = _1766;
    }
    int _1768 = _1762;
    bool _1770 = uint(_1742) >= uint(_1149);
    int _1772 = _1187 * _1756;
    int _1774 = _1772 + _1572;
    int _1776 = ~_1730;
    int _1778 = _1776 + 1;
    int _1780 = _1778 + 1;
    bool _1782 = !_1770;
    int _1784 = _1782 ? 0 : (-1);
    int _1786 = _1780;
    if (_1736)
    {
        int _1788 = ~_1730;
        int _1790 = _1788 + 1;
        _1786 = _1790;
    }
    int _1792 = _1786;
    bool _1794 = uint(_1760) >= uint(_1187);
    int _1796 = ~_1708;
    int _1798 = _1796 + _1784;
    int _1800 = _1798 + 1;
    float _1802 = -_197;
    int _1804 = _1738 ? as_type<int>(_1802) : as_type<int>(_197);
    bool _1806 = !_1480;
    int _1808 = _1806 ? _1774 : (-1);
    int _1810 = _1149 * _1800;
    int _1812 = _1810 + _1444;
    int _1814 = _1706 >> 31;
    int _1816 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1818 = _1816 != 0;
    bool _1820 = !_1794;
    int _1822 = _1820 ? 0 : (-1);
    int _1824 = _1808 >> 31;
    int _1826 = _1814 & 3;
    int _1828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1830 = _1828 != 0;
    bool _1832 = !_1818;
    int _1834 = _1832 ? 0 : 1;
    int _1836 = _1808 & 3;
    bool _1838 = _1836 != 0;
    int _1840 = ~_1744;
    int _1842 = _1840 + _1822;
    int _1844 = _1842 + 1;
    int _1846 = _1824 & 3;
    int _1848 = _1706 + _1826;
    int _1850 = _1187 * _1844;
    int _1852 = _1850 + _1500;
    bool _1854 = !_1830;
    int _1856 = _1854 ? 0 : 1;
    float _1858 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1860 = int(_1858);
    bool _1862 = uint(_1836) > 1u;
    int _1864 = _1808 + _1846;
    int _1866 = _1848 >> 2;
    int _1868 = _1808 & 3;
    bool _1870 = _1868 != 0;
    int _1872 = _1864 >> 2;
    int _1874 = _1866 << 4;
    int _1876 = _1874 + 368;
    int _1878 = _1870 ? 0 : 1;
    bool _1880 = _1714 != 3;
    int _1882 = _1872 << 4;
    int _1884 = _1882 + 512;
    uint _1886 = uint(int(uint(_1876) >> uint(2)));
    uint _1888 = uint(int(uint(int(_1886)) >> uint(2)));
    int _1890 = int(_1886) & 3;
    float _1892 = (*spvDescriptorSet0.vp_c9)._m0[int(_1888)][_1890];
    int _1894 = int(_1886) + 1;
    uint _1896 = uint(int(uint(_1894) >> uint(2)));
    int _1898 = _1894 & 3;
    float _1900 = (*spvDescriptorSet0.vp_c9)._m0[int(_1896)][_1898];
    int _1902 = ~_1878;
    int _1904 = _1902 + 1;
    int _1906 = _1904 + 1;
    int _1908 = _1906;
    if (!_1862)
    {
        int _1910 = ~_1878;
        int _1912 = _1910 + 1;
        _1908 = _1912;
    }
    int _1914 = _1908;
    bool _1916 = !_1716;
    int _1918 = _1916 ? 0 : 1;
    bool _1920 = _1836 != 3;
    uint _1922 = uint(int(uint(_1884) >> uint(2)));
    uint _1924 = uint(int(uint(int(_1922)) >> uint(2)));
    int _1926 = int(_1922) & 3;
    float _1928 = (*spvDescriptorSet0.vp_c9)._m0[int(_1924)][_1926];
    int _1930 = int(_1922) + 1;
    uint _1932 = uint(int(uint(_1930) >> uint(2)));
    int _1934 = _1930 & 3;
    float _1936 = (*spvDescriptorSet0.vp_c9)._m0[int(_1932)][_1934];
    bool _1938 = uint(_1836) >= 2u;
    bool _1940 = !_1366;
    int _1942 = _1940 ? _1812 : (-1);
    int _1944 = _1938 ? 0 : 1;
    bool _1946 = _1836 != 3;
    bool _1948 = !_1838;
    int _1950 = _1948 ? 0 : 1;
    bool _1952 = !_1880;
    int _1954 = _1952 ? 0 : (-1);
    int _1956 = ~_1944;
    int _1958 = _1956 + 1;
    int _1960 = _1958 + 1;
    int _1962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1964 = _1962 != 0;
    int _1966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1968 = _1966 != 0;
    int _1970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1972 = _1970 != 0;
    int _1974 = _1960;
    if (_1920)
    {
        int _1976 = ~_1944;
        int _1978 = _1976 + 1;
        _1974 = _1978;
    }
    int _1980 = _1974;
    int _1982 = _1876 + 8;
    uint _1984 = uint(int(uint(_1982) >> uint(2)));
    uint _1986 = uint(int(uint(int(_1984)) >> uint(2)));
    int _1988 = int(_1984) & 3;
    float _1990 = (*spvDescriptorSet0.vp_c9)._m0[int(_1986)][_1988];
    int _1992 = int(_1984) + 1;
    uint _1994 = uint(int(uint(_1992) >> uint(2)));
    int _1996 = _1992 & 3;
    float _1998 = (*spvDescriptorSet0.vp_c9)._m0[int(_1994)][_1996];
    int _2000 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2002 = _2000 != 0;
    int _2004 = abs(_1768);
    int _2006 = abs(_1914);
    int _2008 = _1884 + 8;
    uint _2010 = uint(int(uint(_2008) >> uint(2)));
    uint _2012 = uint(int(uint(int(_2010)) >> uint(2)));
    int _2014 = int(_2010) & 3;
    float _2016 = (*spvDescriptorSet0.vp_c9)._m0[int(_2012)][_2014];
    int _2018 = int(_2010) + 1;
    uint _2020 = uint(int(uint(_2018) >> uint(2)));
    int _2022 = _2018 & 3;
    float _2024 = (*spvDescriptorSet0.vp_c9)._m0[int(_2020)][_2022];
    bool _2026 = !_1946;
    int _2028 = _2026 ? 0 : (-1);
    bool _2030 = _229 > 0.5;
    int _2032 = abs(_1918);
    int _2034 = ~_2004;
    int _2036 = _2034 + 1;
    int _2038 = _2036 + 1;
    bool _2040 = !_1480;
    int _2042 = _2040 ? _1852 : (-1);
    float _2044 = -_193;
    int _2046 = _2030 ? as_type<int>(_2044) : as_type<int>(_193);
    int _2048 = _2038 * as_type<int>(_1900);
    bool _2050 = _231 > 0.5;
    bool _2052 = _233 > 0.5;
    float _2054 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2056 = abs(_1950);
    float _2058 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2060 = ~_2006;
    int _2062 = _2060 + 1;
    int _2064 = _2062 + 1;
    float _2066 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2068 = ~_2032;
    int _2070 = _2068 + 1;
    int _2072 = _2070 + 1;
    float _2074 = _2054 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2076 = _2064 * as_type<int>(_1936);
    int _2078 = ~_2056;
    int _2080 = _2078 + 1;
    int _2082 = _2080 + 1;
    int _2084 = _2072 * as_type<int>(_1892);
    int _2086 = _2084 + _2048;
    int _2088 = abs(_1792);
    float _2090 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2092 = int(_2090);
    float _2094 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2096 = _2058 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2098 = _2066 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2100 = _2082 * as_type<int>(_1928);
    int _2102 = _2100 + _2076;
    float _2104 = _941 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2106 = abs(_1980);
    out.m_82.x = _2074;
    out.m_82.y = _2096;
    out.m_82.z = _2098;
    out.m_82.w = _2094;
    int _2108 = abs(_2028);
    float _2110 = _941 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2112 = ~_2088;
    int _2114 = _2112 + 1;
    int _2116 = _2114 + 1;
    int _2118 = abs(_1954);
    bool _2120 = !_1964;
    float _2122 = _2120 ? _197 : as_type<float>(_1804);
    int _2124 = _2116 * as_type<int>(_1990);
    int _2126 = _2124 + _2086;
    float _2128 = _963 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2130 = !_2002;
    float _2132 = _2130 ? _193 : as_type<float>(_2046);
    int _2134 = ~_2106;
    int _2136 = _2134 + 1;
    int _2138 = _2136 + 1;
    float _2140 = _941 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2142 = -_935;
    float _2144 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2110);
    float _2146 = float(uint(_1860));
    int _2148 = _2138 * as_type<int>(_2016);
    int _2150 = _2148 + _2102;
    float _2152 = -_935;
    float _2154 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2104);
    int _2156 = ~_2108;
    int _2158 = _2156 + 1;
    int _2160 = _2158 + 1;
    float _2162 = _2104;
    if (_1041)
    {
        float _2164 = _1095 * 6.283185482025146484375;
        float _2166 = cos(_2164);
        _2162 = _2166;
    }
    float _2168 = _2162;
    float _2170 = float(uint(_2092));
    int _2172 = ~_2118;
    int _2174 = _2172 + 1;
    int _2176 = _2174 + 1;
    int _2178 = _2160 * as_type<int>(_2024);
    int _2180 = _2178 + _2150;
    int _2182 = abs(_1834);
    int _2184 = abs(_1856);
    float _2186 = 1.0 / _2146;
    int _2188 = _2176 * as_type<int>(_1998);
    int _2190 = _2188 + _2126;
    int _2192 = ~_2182;
    int _2194 = _2192 + 1;
    int _2196 = _2194 + 1;
    int _2198 = ~_2184;
    int _2200 = _2198 + 1;
    int _2202 = _2200 + 1;
    int _2204 = abs(_1860);
    float _2206 = 1.0 / _2170;
    int _2208 = _2180 * _2202;
    float _2210 = float(uint(_2204));
    int _2212 = abs(_2092);
    int _2214 = _2042 * _2184;
    int _2216 = _2214 + _2208;
    int _2218 = as_type<int>(_2186) + (-2);
    float _2220 = -_935;
    float _2222 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2140);
    int _2224 = _2190 * _2196;
    float _2226 = 1.0 / _2210;
    float _2228 = float(uint(_2212));
    float _2230 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2144);
    int _2232 = _1942 * _2182;
    int _2234 = _2232 + _2224;
    float _2236 = _955 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2238 = as_type<int>(_2206) + (-2);
    float _2240 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2222);
    float _2242 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2154);
    float _2244 = float(uint(_2234));
    float _2246 = 1.0 / _2228;
    float _2248 = _955 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2250 = _955 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2252 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2236);
    float _2254 = as_type<float>(_2218) * _2244;
    int _2256 = abs(_2234);
    float _2258 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2248);
    float _2260 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2250);
    float _2262 = float(uint(_2216));
    float _2264 = trunc(_2254);
    float _2266 = precise::max(_2264, 0.0);
    uint _2268 = uint(_2266);
    float _2270 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2258);
    int _2272 = as_type<int>(_2226) + (-2);
    float _2274 = as_type<float>(_2238) * _2262;
    float _2276 = float(uint(_2256));
    float _2278 = _963 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2280 = abs(_2216);
    int _2282 = ~_1860;
    int _2284 = _2282 + 1;
    float _2286 = as_type<float>(_2272) * _2276;
    int _2288 = as_type<int>(_2246) + (-2);
    float _2290 = _963 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2292 = float(uint(_2280));
    float _2294 = trunc(_2274);
    float _2296 = precise::max(_2294, 0.0);
    uint _2298 = uint(_2296);
    float _2300 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2278);
    int _2302 = _2284 * int(_2268);
    int _2304 = _2302 + _2234;
    float _2306 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2290);
    float _2308 = as_type<float>(_2288) * _2292;
    float _2310 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2128);
    float _2312 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2300);
    float _2314 = float(uint(_2304));
    float _2316 = trunc(_2286);
    float _2318 = precise::max(_2316, 0.0);
    uint _2320 = uint(_2318);
    float _2322 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2306);
    float _2324 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2310);
    int _2326 = ~_2204;
    int _2328 = _2326 + 1;
    float _2330 = as_type<float>(_2218) * _2314;
    int _2332 = ~_2092;
    int _2334 = _2332 + 1;
    float _2336 = trunc(_2308);
    float _2338 = precise::max(_2336, 0.0);
    uint _2340 = uint(_2338);
    int _2342 = ~_2212;
    int _2344 = _2342 + 1;
    int _2346 = _2334 * int(_2298);
    int _2348 = _2346 + _2216;
    float _2350 = as_type<float>(_2328);
    float _2352 = _2286;
    float _2354 = as_type<float>(_2348);
    if (_1041)
    {
        float _2356 = _2168 + (-1.0);
        _2350 = _2356;
    }
    float _2358 = _2350;
    float _2360 = _2358;
    if (_1041)
    {
        float _2362 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2364 = _1127 + _2362;
        _2352 = _2364;
    }
    float _2366 = _2352;
    float _2368 = float(uint(_2348));
    int _2370 = _2328 * int(_2320);
    int _2372 = _2370 + _2256;
    if (_1041)
    {
        float _2374 = _2358 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2360 = _2374;
    }
    float _2376 = _2360;
    float _2378 = trunc(_2330);
    float _2380 = precise::max(_2378, 0.0);
    uint _2382 = uint(_2380);
    if (_1041)
    {
        float _2384 = _2366 * _2366;
        _1069 = _2384;
    }
    float _2386 = _1069;
    float _2388 = as_type<float>(_2238) * _2368;
    float _2390 = float(uint(_2372));
    if (_1041)
    {
        float _2392 = fma(_1097, _2168, _2376);
        _1101 = _2392;
    }
    float _2394 = _1101;
    float _2396 = -_197;
    int _2398 = _2050 ? as_type<int>(_2396) : as_type<int>(_197);
    int _2400 = _2344 * int(_2340);
    int _2402 = _2400 + _2280;
    float _2404 = _197 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2406 = as_type<float>(_2272) * _2390;
    float _2408 = -_193;
    int _2410 = _2052 ? as_type<int>(_2408) : as_type<int>(_193);
    float _2412 = trunc(_2388);
    float _2414 = precise::max(_2412, 0.0);
    uint _2416 = uint(_2414);
    float _2418 = float(uint(_2402));
    float _2420 = _2404 * _2240;
    bool _2422 = !_1968;
    float _2424 = _2422 ? _197 : as_type<float>(_2398);
    float _2426 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2252);
    bool _2428 = !_1972;
    float _2430 = _2428 ? _193 : as_type<float>(_2410);
    float _2432 = as_type<float>(_2288) * _2418;
    float _2434 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2260);
    float _2436 = trunc(_2406);
    float _2438 = precise::max(_2436, 0.0);
    uint _2440 = uint(_2438);
    float _2442 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2444 = _2404 * _2230;
    float _2446 = _2404 * _2242;
    float _2448 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2450 = _2394 + _2448;
    float _2452 = fma(_2442, _2426, _2420);
    float _2454 = fma(_2442, _2270, _2444);
    if (_1041)
    {
        float _2456 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2458 = _1131 + _2456;
        _2354 = _2458;
    }
    float _2460 = _2354;
    float _2462 = trunc(_2432);
    float _2464 = precise::max(_2462, 0.0);
    uint _2466 = uint(_2464);
    float _2468 = fma(_2442, _2434, _2446);
    float _2470 = fma(_2450, _2450, _2386);
    int _2472 = int(_2268) + int(_2382);
    float _2474 = _2468;
    if (_1041)
    {
        float _2476 = _2460 * _2460;
        _1071 = _2476;
    }
    float _2478 = _1071;
    int _2480 = ~_1860;
    int _2482 = _2480 + 1;
    out.m_84.x = _2426;
    out.m_84.y = _2270;
    out.m_84.z = _2434;
    int _2484 = int(_2298) + int(_2416);
    int _2486 = int(_2320) + int(_2440);
    int _2488 = ~_2092;
    int _2490 = _2488 + 1;
    int _2492 = ~_2204;
    int _2494 = _2492 + 1;
    int _2496 = _2482 * _2472;
    int _2498 = _2496 + _2234;
    int _2500 = int(_2340) + int(_2466);
    int _2502 = _2494 * _2486;
    int _2504 = _2502 + _2256;
    int _2506 = ~_2212;
    int _2508 = _2506 + 1;
    int _2510 = _2490 * _2484;
    int _2512 = _2510 + _2216;
    bool _2514 = uint(_2498) >= uint(_1860);
    float _2516 = _2470 + _2478;
    bool _2518 = uint(_2504) >= uint(_2204);
    int _2520 = _2508 * _2500;
    int _2522 = _2520 + _2280;
    bool _2524 = uint(_2512) >= uint(_2092);
    float _2526 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2528 = !_2514;
    int _2530 = _2528 ? 0 : (-1);
    bool _2532 = !_2524;
    int _2534 = _2532 ? 0 : (-1);
    int _2536 = ~_2472;
    int _2538 = _2536 + _2530;
    int _2540 = _2538 + 1;
    bool _2542 = uint(_2522) >= uint(_2212);
    float _2544 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2546 = _2234 ^ _1860;
    float _2548 = fma(_2404, _2404, 1.0);
    int _2550 = ~_2484;
    int _2552 = _2550 + _2534;
    int _2554 = _2552 + 1;
    int _2556 = _1860 * _2540;
    int _2558 = _2556 + _2234;
    bool _2560 = !_2542;
    int _2562 = _2560 ? 0 : (-1);
    bool _2564 = _1860 == 0;
    float _2566 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2568 = !_2518;
    int _2570 = _2568 ? 0 : (-1);
    int _2572 = _2092 * _2554;
    int _2574 = _2572 + _2216;
    uint _2576 = uint(int(uint(_2546) >> uint(31)));
    int _2578 = _2216 ^ _2092;
    int _2580 = ~_2562;
    int _2582 = _2500 + _2580;
    int _2584 = _2582 + 1;
    float _2586 = sqrt(_2516);
    int _2588 = ~_2570;
    int _2590 = _2486 + _2588;
    int _2592 = _2590 + 1;
    int _2594 = ~int(_2576);
    int _2596 = _2594 + 1;
    float _2598 = _2526 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2600 = !_2564;
    int _2602 = _2600 ? _2558 : (-1);
    uint _2604 = uint(int(uint(_2578) >> uint(31)));
    int _2606 = _2592 ^ _2596;
    float _2608 = float(_2602);
    int _2610 = ~int(_2604);
    int _2612 = _2610 + 1;
    bool _2614 = _2092 == 0;
    bool _2616 = _2092 == 0;
    float _2618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2620 = ~_2596;
    int _2622 = _2620 + _2606;
    int _2624 = _2622 + 1;
    float _2626 = fma(_2598, _2608, _425);
    bool _2628 = _1860 == 0;
    int _2630 = _2584 ^ _2612;
    bool _2632 = !_2614;
    int _2634 = _2632 ? _2574 : (-1);
    float _2636 = rsqrt(_2548);
    int _2638 = ~_2612;
    int _2640 = _2638 + _2630;
    int _2642 = _2640 + 1;
    float _2644 = _2544 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2646 = !_2628;
    int _2648 = _2646 ? _2624 : (-1);
    float _2650 = float(_2634);
    float _2652 = _2566 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2654 = float(_2648);
    float _2656 = _2132 + 0.5;
    out.m_86.x = _1141;
    out.m_86.y = _1143;
    out.m_86.z = _1145;
    float _2658 = fma(_2652, _2650, _689);
    bool _2660 = !_2616;
    int _2662 = _2660 ? _2642 : (-1);
    float _2664 = fma(_2598, _2656, _2626);
    float _2666 = -_675;
    float _2668 = fma(_2644, _2654, _2666);
    float _2670 = _2430 + 0.5;
    float _2672 = _2618 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2674 = float(_2662);
    float _2676 = _2424 + (-0.5);
    float _2678 = _2404 * _2636;
    float _2680 = fma(_2652, _2670, _2658);
    bool _2682 = _2586 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2684 = isnan(_2586);
    bool _2686 = _2682 || _2684;
    bool _2688 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2690 = _2686 || _2688;
    float _2692 = -_2644;
    float _2694 = fma(_2692, _2676, _2668);
    float _2696 = -_691;
    float _2698 = fma(_2672, _2674, _2696);
    float _2700 = -_2312;
    float _2702 = _2678 * _2700;
    float _2704 = -_2322;
    float _2706 = _2678 * _2704;
    float _2708 = -_2324;
    float _2710 = _2678 * _2708;
    float _2712 = _2122 + (-0.5);
    float _2714 = fma(_2636, _2240, _2702);
    float _2716 = fma(_2636, _2230, _2706);
    float _2718 = fma(_2636, _2242, _2710);
    float _2720 = -_2672;
    float _2722 = fma(_2720, _2712, _2698);
    float _2724 = -_685;
    float _2726 = _2724 + 1.0;
    float _2728 = -_1161;
    float _2730 = fma(_2132, _2728, _2664);
    float _2732 = -_1173;
    float _2734 = fma(_2430, _2732, _2680);
    float _2736 = _2312 + _2452;
    float _2738 = fma(_2424, _2726, _2694);
    float _2740 = fma(_2122, _1177, _2722);
    float _2742 = _2322 + _2454;
    float _2744 = _2324 + _2468;
    out.m_88.x = _2714;
    out.m_88.y = _2716;
    out.m_88.z = _2718;
    if (!_2690)
    {
        _2474 = 1.0;
    }
    float _2746 = _2474;
    out.m_90.x = _2730;
    out.m_90.y = _2738;
    out.m_90.z = _2734;
    out.m_90.w = _2740;
    out.m_92.x = _2736;
    out.m_92.y = _2742;
    out.m_92.z = _2744;
    bool _2748 = !_2690;
    float _2750 = _2746;
    if (!_2748)
    {
        bool _2752 = _2586 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2754 = isnan(_2586);
        bool _2756 = _2752 || _2754;
        bool _2758 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2760 = _2756 || _2758;
        if (!_2760)
        {
            float _2762 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2764 = _2586 + _2762;
            float _2766 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2768 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2766;
            float _2770 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2772 = _2770 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2774 = 1.0 / _2768;
            float _2776 = _2764 * _2774;
            float _2778 = fma(_2776, _2772, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2750 = _2778;
            _2780 = true;
        }
        else
        {
            bool _2782 = _2586 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2784 = isnan(_2586);
            bool _2786 = _2782 || _2784;
            bool _2788 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2790 = _2786 || _2788;
            if (!_2790)
            {
                float _2792 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2794 = _2586 + _2792;
                float _2796 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2798 = _2796 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2800 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2802 = _2800 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2804 = 1.0 / _2798;
                float _2806 = _2794 * _2804;
                float _2808 = fma(_2806, _2802, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2750 = _2808;
                _2780 = true;
            }
            else
            {
                _2750 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2780 = false;
    float _2810 = _2750;
    float _2812 = fma(_997, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2814 = fma(_1003, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2816 = floor(_2812);
    float _2818 = floor(_2814);
    float _2820 = -_2816;
    float _2822 = _2812 + _2820;
    float _2824 = -_2818;
    float _2826 = _2814 + _2824;
    float2 _8275 = float2(_2822, _2826);
    float _2828 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8275, float2(0.0), isnan(_8275)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8275, float2(0.0), isnan(_8275)), level(0.0)).x;
    float _2830 = _1053 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2832 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2834 = _2394 + _2832;
    float _2836 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2830);
    float _2838 = fma(_2834, _2810, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2840 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2836);
    float _2842 = _1053 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2844 = _2840 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2846 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2842);
    float _2848 = 1.0 / _2844;
    float _2850 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2846);
    float _2852 = _2850 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2854 = _2852 + _2844;
    float _2856 = _2854 * _2848;
    float _2858 = _2856 * 0.5;
    float _2860 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2862 = fma(_2858, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2860);
    float _2864 = 1.0 / _2862;
    float _2866 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2868 = _1053 + _2866;
    float _2870 = _2868 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2872 = fma(_997, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2870);
    float _2874 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2876 = _2864 * _2874;
    float _2878 = _2868 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2880 = fma(_1003, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2872);
    bool _2882 = _2876 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2884 = fma(_997, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2878);
    bool _2886 = _2876 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2888 = _2880 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _2890 = !_2882;
    int _2892 = _2890 ? 0 : 1;
    float _2894 = fma(_1003, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2884);
    float _2896 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2898 = _1131 + _2896;
    float _2900 = trunc(_2888);
    int _2902 = int(_2900);
    float _2904 = _2894 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2906 = fma(_2898, _2810, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    int _2908 = 2;
    float _2910 = _2898;
    int _2912 = as_type<int>(_2810);
    if (!_2882)
    {
        _2908 = 1;
    }
    int _2914 = _2908;
    int _2916 = _2914;
    if (!_2886)
    {
        _2916 = _2892;
    }
    int _2918 = _2916;
    float _2920 = trunc(_2904);
    int _2922 = int(_2920);
    int _2924 = _2918 << 6;
    bool _2926 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2928 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2930 = _2926 || _2928;
    bool _2932 = isnan(0.5);
    bool _2934 = _2930 || _2932;
    int _2936 = _2924 + 48;
    uint _2938 = uint(int(uint(_2936) >> uint(2)));
    uint _2940 = uint(int(uint(int(_2938)) >> uint(2)));
    int _2942 = int(_2938) & 3;
    float _2944 = (*spvDescriptorSet0.vp_c15)._m0[int(_2940)][_2942];
    int _2946 = int(_2938) + 1;
    uint _2948 = uint(int(uint(_2946) >> uint(2)));
    int _2950 = _2946 & 3;
    float _2952 = (*spvDescriptorSet0.vp_c15)._m0[int(_2948)][_2950];
    int _2954 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2956 = _2902 + _2954;
    int _2958 = _2956 + 1;
    bool _2960 = _2958 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2962 = _2924 + 56;
    uint _2964 = uint(int(uint(_2962) >> uint(2)));
    uint _2966 = uint(int(uint(int(_2964)) >> uint(2)));
    int _2968 = int(_2964) & 3;
    float _2970 = (*spvDescriptorSet0.vp_c15)._m0[int(_2966)][_2968];
    int _2972 = int(_2964) + 1;
    uint _2974 = uint(int(uint(_2972) >> uint(2)));
    int _2976 = _2972 & 3;
    float _2978 = (*spvDescriptorSet0.vp_c15)._m0[int(_2974)][_2976];
    int _2980 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2982 = _2922 + _2980;
    int _2984 = _2982 + 1;
    float _2986 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2988 = _1127 + _2986;
    float _2990 = _2988;
    int _2992 = _2958;
    if (_2934)
    {
        _2910 = _2906;
    }
    float _2994 = _2910;
    int _2996 = _2958 | _2984;
    float _2998 = fma(_2988, _2810, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    int _3000 = _2924 + 64;
    uint _3002 = uint(int(uint(_3000) >> uint(2)));
    uint _3004 = uint(int(uint(int(_3002)) >> uint(2)));
    int _3006 = int(_3002) & 3;
    float _3008 = (*spvDescriptorSet0.vp_c15)._m0[int(_3004)][_3006];
    int _3010 = int(_3002) + 1;
    uint _3012 = uint(int(uint(_3010) >> uint(2)));
    int _3014 = _3010 & 3;
    float _3016 = (*spvDescriptorSet0.vp_c15)._m0[int(_3012)][_3014];
    bool _3018 = _2996 < 0;
    bool _3020 = _3018 || _2960;
    float _3022 = as_type<float>(_2996);
    float _3024 = _2994;
    if (_2934)
    {
        _2990 = _2998;
    }
    float _3026 = _2990;
    bool _3028 = _2984 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3030 = _3028 || _3020;
    float _3032 = _3026;
    if (_2934)
    {
        _3022 = _2838;
    }
    float _3034 = _3022;
    int _3036 = _2924 + 72;
    uint _3038 = uint(int(uint(_3036) >> uint(2)));
    uint _3040 = uint(int(uint(int(_3038)) >> uint(2)));
    int _3042 = int(_3038) & 3;
    float _3044 = (*spvDescriptorSet0.vp_c15)._m0[int(_3040)][_3042];
    int _3046 = int(_3038) + 1;
    uint _3048 = uint(int(uint(_3046) >> uint(2)));
    int _3050 = _3046 & 3;
    float _3052 = (*spvDescriptorSet0.vp_c15)._m0[int(_3048)][_3050];
    int _3054 = _2924 + 96;
    uint _3056 = uint(int(uint(_3054) >> uint(2)));
    uint _3058 = uint(int(uint(int(_3056)) >> uint(2)));
    int _3060 = int(_3056) & 3;
    float _3062 = (*spvDescriptorSet0.vp_c15)._m0[int(_3058)][_3060];
    int _3064 = int(_3056) + 1;
    uint _3066 = uint(int(uint(_3064) >> uint(2)));
    int _3068 = _3064 & 3;
    float _3070 = (*spvDescriptorSet0.vp_c15)._m0[int(_3066)][_3068];
    int _3072 = _2924 + 104;
    uint _3074 = uint(int(uint(_3072) >> uint(2)));
    uint _3076 = uint(int(uint(int(_3074)) >> uint(2)));
    int _3078 = int(_3074) & 3;
    float _3080 = (*spvDescriptorSet0.vp_c15)._m0[int(_3076)][_3078];
    int _3082 = int(_3074) + 1;
    uint _3084 = uint(int(uint(_3082) >> uint(2)));
    int _3086 = _3082 & 3;
    float _3088 = (*spvDescriptorSet0.vp_c15)._m0[int(_3084)][_3086];
    float _3090 = _3034;
    if (!_2934)
    {
        float _3092 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3094 = _1053 + _3092;
        float _3096 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3098 = _997 + _3096;
        float _3100 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3102 = _3094 * _3094;
        float _3104 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3106 = _1003 + _3104;
        float _3108 = fma(_3098, _3098, _3102);
        float _3110 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3112 = fma(_3106, _3106, _3108);
        float _3114 = sqrt(_3112);
        float _3116 = _3100 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3118 = -_1003;
        float _3120 = _3118 + _2906;
        float _3122 = precise::min(_3114, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3124 = _3122 * _3110;
        float _3126 = -_1053;
        float _3128 = _3126 + _2838;
        float _3130 = _3116 * _3124;
        float _3132 = -_997;
        float _3134 = _3132 + _2998;
        float _3136 = fma(_3128, _3130, _1053);
        float _3138 = fma(_3134, _3130, _997);
        float _3140 = fma(_3120, _3130, _1003);
        _3090 = _3136;
        _3032 = _3138;
        _2912 = as_type<int>(_3130);
        _3024 = _3140;
    }
    float _3142 = _3090;
    float _3144 = _3032;
    int _3146 = _2912;
    float _3148 = _3024;
    float _3150 = _2868 * _3070;
    float _3152 = _3142 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _3154 = _3146;
    if (!_3030)
    {
        int _3156 = _2984 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3158 = _3156 + _2958;
        _3154 = _3158;
    }
    int _3160 = _3154;
    float _3162 = _2868 * _3016;
    float _3164 = fma(_997, _3062, _3150);
    float _3166 = fma(_3144, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3152);
    float _3168 = _2868 * _2952;
    if (!_3030)
    {
        int _3170 = _3160 << 2;
        _2992 = _3170;
    }
    int _3172 = _2992;
    float _3174 = fma(_1003, _3080, _3164);
    float _3176 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3166);
    float _3178 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    int _3180 = _3172;
    int _3182 = as_type<int>(_3176);
    if (!_3030)
    {
        int _3184 = 12 & _3172;
        _3180 = _3184;
    }
    int _3186 = _3180;
    float _3188 = _3174 + _3088;
    float _3190 = _3176 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (!_3030)
    {
        uint _3192 = uint(int(uint(_3160) >> uint(2)));
        _3182 = int(_3192);
    }
    int _3194 = _3182;
    float _3196 = fma(_997, _2944, _3168);
    float _3198 = fma(_997, _3008, _3162);
    float _3200 = _3190 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    int _3202 = _2924 + 80;
    uint _3204 = uint(int(uint(_3202) >> uint(2)));
    uint _3206 = uint(int(uint(int(_3204)) >> uint(2)));
    int _3208 = int(_3204) & 3;
    float _3210 = (*spvDescriptorSet0.vp_c15)._m0[int(_3206)][_3208];
    int _3212 = int(_3204) + 1;
    uint _3214 = uint(int(uint(_3212) >> uint(2)));
    int _3216 = _3212 & 3;
    float _3218 = (*spvDescriptorSet0.vp_c15)._m0[int(_3214)][_3216];
    float _3220 = 1.0 / _3188;
    float _3222 = fma(_1003, _2970, _3196);
    float _3224 = -_3200;
    float _3226 = fma(_3224, _3178, 1.0);
    float _3228 = _3200;
    if (!_3030)
    {
        int _3230 = _3194 << 4;
        int _3232 = _3230 + _3186;
        _3228 = as_type<float>(_3232);
    }
    float _3234 = _3228;
    float _3236 = fma(_1003, _3044, _3198);
    float _3238 = _3142 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3240 = _3222 + _2978;
    int _3242 = _2924 + 88;
    uint _3244 = uint(int(uint(_3242) >> uint(2)));
    uint _3246 = uint(int(uint(int(_3244)) >> uint(2)));
    int _3248 = int(_3244) & 3;
    float _3250 = (*spvDescriptorSet0.vp_c15)._m0[int(_3246)][_3248];
    int _3252 = int(_3244) + 1;
    uint _3254 = uint(int(uint(_3252) >> uint(2)));
    int _3256 = _3252 & 3;
    float _3258 = (*spvDescriptorSet0.vp_c15)._m0[int(_3254)][_3256];
    float _3260 = _3236 + _3052;
    float _3262 = fma(_3144, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3238);
    float _3264 = _3142 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3266 = _3142 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3268 = as_type<float>(_2642);
    if (!_3030)
    {
        float _3270 = floor(_2904);
        _3268 = _3270;
    }
    float _3272 = _3268;
    float _3274 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3262);
    float _3276 = fma(_3144, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3264);
    float _3278 = _3234;
    if (!_3030)
    {
        int _3280 = as_type<int>(_3234) + 400;
        uint _3282 = uint(int(uint(_3280) >> uint(2)));
        uint _3284 = uint(int(uint(int(_3282)) >> uint(2)));
        int _3286 = int(_3282) & 3;
        float _3288 = (*spvDescriptorSet0.vp_c15)._m0[int(_3284)][_3286];
        _3278 = _3288;
    }
    float _3290 = _3278;
    float _3292 = _3240 * _3220;
    float _3294 = _3260 * _3220;
    float _3296 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3276);
    float _3298 = _3274 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3300 = fma(_3144, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3266);
    bool _3302 = _3292 >= 0.0;
    float _3304 = _3296 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3306 = _3298 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3308 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3300);
    bool _3310 = _3292 <= 1.0;
    bool _3312 = _3310 && _3302;
    float _3314 = log2(_3226);
    float _3316 = fma(_3304, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3306);
    float _3318 = _3308 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _3320 = _3294 >= 0.0;
    bool _3322 = _3320 && _3312;
    float _3324 = _3298 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3326 = fma(_3190, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3316);
    float _3328 = _3272;
    float _3330 = _3324;
    float _3332 = _3300;
    float _3334 = _3220;
    if (!_3030)
    {
        float _3336 = -_3272;
        float _3338 = _2904 + _3336;
        _3328 = _3338;
    }
    float _3340 = _3328;
    bool _3342 = _3294 <= 1.0;
    bool _3344 = _3342 && _3322;
    float _3346 = _2906;
    if (!_3030)
    {
        float _3348 = floor(_2888);
        _3346 = _3348;
    }
    float _3350 = _3346;
    float _3352 = fma(_3318, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3326);
    float _3354 = _3298 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3356 = fma(_3304, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3324);
    float _3358 = fma(_3304, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3354);
    float _3360 = fma(_3190, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3356);
    float _3362 = 1.0 / _3352;
    float _3364 = _3314 * 0.693147182464599609375;
    float _3366 = fma(_3190, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3358);
    float _3368 = fma(_3318, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3360);
    if (_3344)
    {
        float _3370 = float(_2918);
        _3330 = _3370;
    }
    float _3372 = _3330;
    float _3374 = _2868 * _3218;
    float _3376 = fma(_3318, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3366);
    float _3378 = _3364 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    if (!_3030)
    {
        float _3380 = -_3350;
        float _3382 = _2888 + _3380;
        _3332 = _3382;
    }
    float _3384 = _3332;
    float _3386 = fma(_997, _3210, _3374);
    float _3388 = _3372;
    if (_3344)
    {
        float _3390 = rint(_3372);
        float _3392 = precise::max(_3390, 0.0);
        uint _3394 = uint(_3392);
        uint _3396 = clamp(_3394, 0u, 65535u);
        _3388 = as_type<float>(_3396);
    }
    float _3398 = _3388;
    float _3400 = fma(_1003, _3250, _3386);
    float _3402 = _3376 * _3362;
    float _3404 = _3400 + _3258;
    float _3406 = _3368 * _3362;
    float _3408 = fma(_3402, -0.5, 0.5);
    float _3410 = _3290;
    if (!_3030)
    {
        float _3412 = rint(_3290);
        float _3414 = precise::max(_3412, 0.0);
        uint _3416 = uint(_3414);
        uint _3418 = clamp(_3416, 0u, 65535u);
        _3410 = as_type<float>(_3418);
    }
    float _3420 = _3410;
    float _3422 = _3404 * _3220;
    float _3424 = fma(_3406, 0.5, 0.5);
    float _3426 = _3294;
    float _3428 = _3424;
    float _3430 = _3422;
    if (_3344)
    {
        float3 _9303 = float3(_3292, _3294, float(as_type<int>(_3398)));
        float3 _9307 = select(_9303, float3(0.0), isnan(_9303));
        float _3432 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9307.xy, uint(rint(_9307.z)), _3422, level(0.0));
        _3426 = _3432;
    }
    float _3434 = _3426;
    float3 _9317 = float3(_3424, _3408, _3378);
    float _3436 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9317, float3(0.0), isnan(_9317)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9317, float3(0.0), isnan(_9317)), level(0.0)).x;
    float3 _9326 = float3(_3424, _3408, _3378);
    float4 _3439 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9326, float3(0.0), isnan(_9326)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9326, float3(0.0), isnan(_9326)), level(0.0)).xyzw;
    float _3441 = _3439.x;
    float _3443 = _3439.y;
    float _3445 = _3439.z;
    float _3447 = _3439.w;
    float _3449 = _3384;
    if (!_3030)
    {
        float3 _9349 = float3(_3384, _3340, float(as_type<int>(_3420)));
        float3 _9351 = select(_9349, float3(0.0), isnan(_9349));
        float _3451 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9351.xy, uint(rint(_9351.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9351.xy, uint(rint(_9351.z)), level(0.0)).x;
        _3449 = _3451;
    }
    float _3453 = _3449;
    if (_3030)
    {
        _3334 = 1.0;
    }
    float _3455 = _3334;
    float _3457 = _3455;
    float _3459 = _3453;
    if (!_3030)
    {
        int _3461 = _3160 << 4;
        int _3463 = _3461 + 2048;
        uint _3465 = uint(int(uint(_3463) >> uint(2)));
        uint _3467 = uint(int(uint(int(_3465)) >> uint(2)));
        int _3469 = int(_3465) & 3;
        float _3471 = (*spvDescriptorSet0.vp_c15)._m0[int(_3467)][_3469];
        int _3473 = int(_3465) + 1;
        uint _3475 = uint(int(uint(_3473) >> uint(2)));
        int _3477 = _3473 & 3;
        float _3479 = (*spvDescriptorSet0.vp_c15)._m0[int(_3475)][_3477];
        int _3481 = _3463 + 8;
        uint _3483 = uint(int(uint(_3481) >> uint(2)));
        uint _3485 = uint(int(uint(int(_3483)) >> uint(2)));
        int _3487 = int(_3483) & 3;
        float _3489 = (*spvDescriptorSet0.vp_c15)._m0[int(_3485)][_3487];
        int _3491 = int(_3483) + 1;
        uint _3493 = uint(int(uint(_3491) >> uint(2)));
        int _3495 = _3491 & 3;
        float _3497 = (*spvDescriptorSet0.vp_c15)._m0[int(_3493)][_3495];
        float _3499 = _2868 * _3479;
        float _3501 = fma(_997, _3471, _3499);
        float _3503 = fma(_1003, _3489, _3501);
        float _3505 = _3503 + _3497;
        float _3507 = precise::clamp(_3505, 0.0, 1.0);
        float _3509 = -_3507;
        float _3511 = _3509 + _3453;
        float _3513 = fma(_3511, 500.0, 1.5);
        float _3515 = exp2(_3513);
        float _3517 = 0.0 + _3515;
        float _3519 = precise::clamp(_3517, 0.0, 1.0);
        _3428 = _3489;
        _3457 = _3519;
    }
    float _3521 = _3428;
    float _3523 = _3457;
    float _3525 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3527 = _3142 + _3525;
    float _3529 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3531 = _3144 + _3529;
    float _3533 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3535 = _3148 + _3533;
    float _3537 = _3527 * _3527;
    float _3539 = fma(_3531, _3531, _3537);
    float _3541 = fma(_3535, _3535, _3539);
    float _3543 = rsqrt(_3541);
    float _3545 = sqrt(_3541);
    float _3547 = _3543 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3549 = _3531 * _3547;
    float _3551 = _3535 * _3547;
    float _3553 = _3549 * _3549;
    float _3555 = _3551 * _3551;
    float _3557 = _3553 + _3555;
    float _3559 = sqrt(_3557);
    bool _3561 = _3559 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3563 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3565 = _3559 + _3563;
    float _3567 = _3535;
    float _3569 = _3565;
    float _3571 = _3521;
    float _3573 = _3527;
    if (_3561)
    {
        float _3575 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3567 = _3575;
    }
    float _3577 = _3567;
    if (_3561)
    {
        float _3579 = rsqrt(_3557);
        _3459 = _3579;
    }
    float _3581 = _3459;
    float _3583 = _3581;
    if (_3561)
    {
        float _3585 = _3565 * _3577;
        _3569 = _3585;
    }
    float _3587 = _3569;
    if (_3561)
    {
        float _3589 = _3587 * 0.15915493667125701904296875;
        _3571 = _3589;
    }
    float _3591 = _3571;
    float _3593 = _3543;
    if (_3561)
    {
        float _3595 = _3591 * 6.283185482025146484375;
        float _3597 = sin(_3595);
        _3593 = _3597;
    }
    float _3599 = _3593;
    float _3601 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3603 = precise::max(0.0, _3601);
    float _3605 = _3420;
    float _3607 = _3603;
    float _3609 = _3601;
    if (_3561)
    {
        float _3611 = _3591 * 6.283185482025146484375;
        float _3613 = cos(_3611);
        _3605 = _3613;
    }
    float _3615 = _3605;
    float _3617 = -_3547;
    float _3619 = -_3603;
    float _3621 = fma(_3527, _3617, _3619);
    if (!_3561)
    {
        _3607 = _3549;
    }
    float _3623 = _3607;
    float _3625 = _3623;
    if (_3561)
    {
        float _3627 = _3621 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3609 = _3627;
    }
    float _3629 = _3609;
    float _3631 = _3629;
    float _3633 = _3599;
    if (_3561)
    {
        float _3635 = fma(_3599, _3629, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3631 = _3635;
    }
    float _3637 = _3631;
    float _3639 = _3637;
    if (!_3561)
    {
        _3633 = _3553;
    }
    float _3641 = _3633;
    float _3643 = _3641;
    float _3645 = _3615;
    if (_3561)
    {
        float _3647 = _3615 + (-1.0);
        _3573 = _3647;
    }
    float _3649 = _3573;
    float _3651 = _3649;
    if (_3561)
    {
        float _3653 = _3581 * _3637;
        _1073 = _3653;
    }
    float _3655 = _1073;
    if (!_3561)
    {
        _3639 = _3621;
    }
    float _3657 = _3639;
    float _3659 = _3657;
    if (_3561)
    {
        float _3661 = _3649 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3583 = _3661;
    }
    float _3663 = _3583;
    if (_3561)
    {
        float _3665 = _3549 * _3655;
        _3625 = _3665;
    }
    float _3667 = _3625;
    if (!_3561)
    {
        _3651 = _3551;
    }
    float _3669 = _3651;
    float _3671 = _3669;
    if (_3561)
    {
        float _3673 = _3551 * _3655;
        _3671 = _3673;
    }
    float _3675 = _3671;
    if (_3561)
    {
        float _3677 = fma(_3621, _3615, _3663);
        _3659 = _3677;
    }
    float _3679 = _3659;
    if (_3561)
    {
        float _3681 = _3667 * _3667;
        _3643 = _3681;
    }
    float _3683 = _3643;
    if (!_3561)
    {
        _3645 = _3555;
    }
    float _3685 = _3645;
    float _3687 = _3685;
    if (_3561)
    {
        float _3689 = _3675 * _3675;
        _3687 = _3689;
    }
    float _3691 = _3687;
    float _3693 = fma(_3679, _3679, _3683);
    float _3695 = _3693 + _3691;
    float _3697 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3699 = fma(_3545, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3697);
    float _3701 = precise::clamp(_3699, 0.0, 1.0);
    float _3703 = -_3701;
    float _3705 = _3703 + 1.0;
    float _3707 = rsqrt(_3695);
    float _3709 = _3707 * _3679;
    float _3711 = _3707 * _3667;
    float _3713 = abs(_3705);
    float _3715 = log2(_3713);
    float _3717 = _3707 * _3675;
    float _3719 = _3711 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3721 = -_3719;
    float _3723 = fma(_3709, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3721);
    float _3725 = -_3717;
    float _3727 = fma(_3725, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3723);
    float _3729 = fma(_3727, -0.5, 0.5);
    float _3731 = _3715 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3733 = fma(_3727, 0.5, 0.5);
    float _3735 = exp2(_3731);
    float _3737 = fma(_3733, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3739 = fma(_3733, _3737, -0.212114393711090087890625);
    float _3741 = _3709 + 1.0;
    float _3743 = sqrt(_3729);
    float _3745 = fma(_3733, _3739, 1.570728778839111328125);
    float _3747 = -_3709;
    float _3749 = fma(_3735, _3741, _3747);
    float _3751 = fma(_3749, 0.5, 0.5);
    float _3753 = _3743 * 0.636619746685028076171875;
    float _3755 = -_3745;
    float _3757 = fma(_3753, _3755, 1.0);
    float2 _9824 = float2(_3757, _3751);
    float3 _3759 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9824, float2(0.0), isnan(_9824)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9824, float2(0.0), isnan(_9824)), level(0.0)).xyz;
    float _3761 = _3759.x;
    float _3763 = _3759.y;
    float _3765 = _3759.z;
    float _3767 = abs(_2876);
    float _3769 = log2(_3767);
    float _3771 = _3298 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3773 = -_2828;
    float _3775 = _3773 + 1.0;
    out.m_94.x = _3144;
    out.m_94.y = _3142;
    out.m_94.z = _3148;
    float _3777 = fma(_3304, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3771);
    bool _3779 = _2876 <= 8000.0;
    bool _3781 = isnan(_2876);
    bool _3783 = _3779 || _3781;
    bool _3785 = isnan(8000.0);
    bool _3787 = _3783 || _3785;
    float _3789 = float(_3787);
    float _3791 = _3715 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3793 = fma(_3190, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3777);
    float _3795 = fma(_3318, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3793);
    float _3797 = _3769 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3799 = exp2(_3791);
    float _3801 = _3795 + _3352;
    float _3803 = _3801 * 0.5;
    float _3805 = exp2(_3797);
    float _3807 = -_3799;
    float _3809 = _3807 + 1.0;
    float _3811 = _3809 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3813 = fma(_3805, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3815 = precise::clamp(_3813, 0.0, 1.0);
    float _3817 = fma(_3815, -2.0, 3.0);
    float _3819 = _3815 * _3815;
    float _3821 = _3819 * _3817;
    float _3823 = -_3821;
    float _3825 = _3823 + 1.0;
    float _3827 = fma(_3825, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3821);
    float _3829 = _3789 * _3827;
    float _3831 = _3789;
    float _3833 = _3368;
    float _3835 = _3775;
    if (!_3344)
    {
        _3831 = 1.0;
    }
    float _3837 = _3831;
    out.m_96.z = _3803;
    out.m_96.w = _3352;
    float _3839 = _3837;
    if (_3344)
    {
        bool _3841 = _3434 >= _3422;
        bool _3843 = isnan(_3434);
        bool _3845 = _3841 || _3843;
        bool _3847 = isnan(_3422);
        bool _3849 = _3845 || _3847;
        float _3851 = float(_3849);
        _3839 = _3851;
    }
    float _3853 = _3839;
    float _3855 = _3829 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3857 = _3811 * _3436;
    float _3859 = -_3811;
    float _3861 = _3859 + 1.0;
    bool _3863 = _3545 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3865 = isnan(_3545);
    bool _3867 = _3863 || _3865;
    bool _3869 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3871 = _3867 || _3869;
    float _3873 = _3775 * _3855;
    float _3875 = precise::clamp(_3873, 0.0, 1.0);
    float _3877 = _3853 * _3523;
    float _3879 = _3447 * _3857;
    float _3881 = _3447 * _3861;
    float _3883 = -_3875;
    float _3885 = fma(_3883, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.gl_Position.x = _3368;
    out.gl_Position.y = _3376;
    out.gl_Position.z = _3795;
    out.gl_Position.w = _3352;
    float _3887 = -_3877;
    float _3889 = fma(_3887, _3885, 1.0);
    float _3891 = precise::clamp(_3889, 0.0, 1.0);
    float _3893 = _3891 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3895 = _3885;
    float _3897 = _3891;
    float _3899 = _3857;
    if (!_3871)
    {
        _3895 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3901 = _3895;
    float _3903 = _3901;
    float _3905 = _3901;
    if (!_3871)
    {
        _3897 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3907 = _3897;
    out.m_98.x = _3893;
    float _3909 = _3907;
    float _3911 = _3907;
    if (!_3871)
    {
        _3430 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3913 = _3430;
    float _3915 = _3913;
    float _3917 = _3913;
    if (!_3871)
    {
        _3833 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3919 = _3833;
    float _3921 = _3919;
    float _3923 = _3919;
    if (!_3871)
    {
        _3835 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3925 = _3835;
    float _3927 = _3765 * _3857;
    float _3929 = fma(_3761, _3879, _3441);
    float _3931 = fma(_3763, _3879, _3443);
    float _3933 = _3925;
    float _3935 = _3925;
    if (!_3871)
    {
        _3899 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3937 = _3899;
    float _3939 = fma(_3447, _3927, _3445);
    out.m_100.x = _3929;
    out.m_100.y = _3931;
    out.m_100.z = _3939;
    out.m_100.w = _3881;
    bool _3941 = !_3871;
    float _3943 = _3937;
    float _3945 = _3937;
    if (!_3941)
    {
        bool _3947 = _3545 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3949 = isnan(_3545);
        bool _3951 = _3947 || _3949;
        bool _3953 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3955 = _3951 || _3953;
        if (!_3955)
        {
            float _3957 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3959 = _3545 + _3957;
            float _3961 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3963 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3961;
            float _3965 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3967 = _3965 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3969 = 1.0 / _3963;
            float _3971 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3973 = _3971 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3975 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3977 = _3975 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3979 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3981 = _3979 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3983 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3985 = _3983 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3987 = _3959 * _3969;
            float _3989 = precise::clamp(_3987, 0.0, 1.0);
            float _3991 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3993 = _3991 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3995 = fma(_3989, _3967, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3997 = fma(_3989, _3993, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3999 = fma(_3989, _3973, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4001 = fma(_3989, _3977, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4003 = fma(_3989, _3981, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4005 = fma(_3989, _3985, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3905 = _3999;
            _3945 = _4003;
            _3923 = _3995;
            _3917 = _4001;
            _3911 = _3997;
            _3935 = _4005;
            _4007 = true;
        }
        else
        {
            bool _4009 = _3545 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4011 = isnan(_3545);
            bool _4013 = _4009 || _4011;
            bool _4015 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4017 = _4013 || _4015;
            if (!_4017)
            {
                _3921 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4019 = _3921;
            _3923 = _4019;
            if (!_4017)
            {
                _3903 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4021 = _3903;
            _3905 = _4021;
            if (!_4017)
            {
                _3909 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4023 = _3909;
            _3911 = _4023;
            if (!_4017)
            {
                _3915 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4025 = _3915;
            _3917 = _4025;
            if (!_4017)
            {
                _3943 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4027 = _3943;
            _3945 = _4027;
            if (!_4017)
            {
                _3933 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4029 = _3933;
            bool _4031 = !_4017;
            _3935 = _4029;
            if (!_4031)
            {
                bool _4033 = _3545 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4035 = isnan(_3545);
                bool _4037 = _4033 || _4035;
                bool _4039 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4041 = _4037 || _4039;
                if (!_4041)
                {
                    float _4043 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4045 = _3545 + _4043;
                    float _4047 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4049 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4047;
                    float _4051 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4053 = _4051 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4055 = 1.0 / _4049;
                    float _4057 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4059 = _4057 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4061 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4063 = _4061 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4065 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4067 = _4065 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4069 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4071 = _4069 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4073 = _4045 * _4055;
                    float _4075 = precise::clamp(_4073, 0.0, 1.0);
                    float _4077 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4079 = _4077 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4081 = fma(_4075, _4053, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4083 = fma(_4075, _4079, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4085 = fma(_4075, _4059, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4087 = fma(_4075, _4063, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4089 = fma(_4075, _4067, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4091 = fma(_4075, _4071, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3905 = _4085;
                    _3945 = _4089;
                    _3923 = _4081;
                    _3917 = _4087;
                    _3911 = _4083;
                    _3935 = _4091;
                    _4007 = true;
                }
                else
                {
                    _3905 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3945 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3923 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3917 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3911 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3935 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4007 = false;
    float _4093 = _3905;
    float _4095 = _3945;
    float _4097 = _3923;
    float _4099 = _3917;
    float _4101 = _3911;
    float _4103 = _3935;
    float _4105 = fma(_2742, -0.5, 0.5);
    float _4107 = precise::clamp(_4105, 0.0, 1.0);
    float _4109 = -_4093;
    float _4111 = _4109 + _4095;
    float _4113 = -_4097;
    float _4115 = _4113 + _4099;
    float _4117 = -_4101;
    float _4119 = _4117 + _4103;
    bool _4121 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4123 = fma(_4107, _4111, _4093);
    float _4125 = fma(_4107, _4115, _4097);
    float _4127 = fma(_4107, _4119, _4101);
    float _4129 = _4123 * 0.586610972881317138671875;
    out.m_102.x = 0.0;
    float _4131 = fma(_4125, 0.298911988735198974609375, _4129);
    float _4133 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4135 = fma(_4127, 0.114477999508380889892578125, _4131);
    out.m_63.x = _4133;
    float _4137 = -_4135;
    float _4139 = _4125 + _4137;
    float _4141 = -_4135;
    float _4143 = _4123 + _4141;
    float _4145 = -_4135;
    float _4147 = _4127 + _4145;
    float _4149 = fma(_4139, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4135);
    float _4151 = fma(_4143, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4135);
    float _4153 = fma(_4147, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4135);
    out.m_104.x = _4149;
    out.m_104.y = _4151;
    out.m_104.z = _4153;
    if (!_4121)
    {
        return out;
    }
    float _4155 = -_3142;
    float _4157 = _4155 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4159 = -_3144;
    float _4161 = _4159 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4163 = -_3148;
    float _4165 = _4163 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4167 = _4157 * _4157;
    float _4169 = fma(_4161, _4161, _4167);
    float _4171 = fma(_4165, _4165, _4169);
    float _4173 = sqrt(_4171);
    float _4175 = rsqrt(_4171);
    float _4177 = -_4173;
    float _4179 = _4177 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4181 = _4179 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4183 = precise::clamp(_4181, 0.0, 1.0);
    float _4185 = _4161 * _4175;
    float _4187 = _4157 * _4175;
    float _4189 = abs(_4183);
    float _4191 = log2(_4189);
    float _4193 = _4165 * _4175;
    float _4195 = _4185 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4197 = _2742 * _4187;
    float _4199 = -_4187;
    float _4201 = -_4195;
    float _4203 = fma(_4199, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4201);
    float _4205 = fma(_2736, _4185, _4197);
    float _4207 = -_4193;
    float _4209 = fma(_4207, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4203);
    float _4211 = fma(_2744, _4193, _4205);
    float _4213 = precise::clamp(_4211, 0.0, 1.0);
    float _4215 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4217 = _4209 + _4215;
    float _4219 = _4191 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4221 = _4217 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4223 = precise::clamp(_4221, 0.0, 1.0);
    float _4225 = exp2(_4219);
    float _4227 = _4225 * _4223;
    float _4229 = _4213 * _4227;
    float _4231 = _4229 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4233 = _4229 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4235 = _4229 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_102.x = _4231;
    out.m_102.y = _4233;
    out.m_102.z = _4235;
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
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4007 = false;
    bool _2780 = false;
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
        float _4292 = as_type<float>(_139);
        out.gl_Position.z = _4292;
    }
    if (!_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _143 = in.m_65.w;
    bool _145 = _143 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _147 = isnan(_143);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _153 = _149 || _151;
    float _155 = -_143;
    float _157 = _155 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _159 = 0.0;
    float _161 = _157;
    if (_153)
    {
        float _163 = float(_123);
        _159 = _163;
    }
    float _165 = _159;
    bool _167 = _157 >= _165;
    bool _169 = !_153;
    bool _171 = _167 || _169;
    if (_171)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _173 = _133;
    if (_171)
    {
        out.m_63.x = 0.0;
    }
    if (_171)
    {
        float _175 = _173 * 5.0;
        _141 = as_type<int>(_175);
    }
    int _177 = _141;
    if (_171)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4361 = as_type<float>(_177);
        out.gl_Position.z = _4361;
    }
    if (_171)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    int _255 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _257 = _255 != 0;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _261 = _259 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _265 = 1.0 / _251;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _269 = _227 + _267;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _279 = _277 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _281 = _231 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _283 = float(_123);
    float _285 = 1.0 / _247;
    float _287 = _229 * 2.0;
    float _289 = _269 * _253;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _293 = _227 + _291;
    float _295 = fma(_281, -2.0, _271);
    float _297 = fma(_275, _289, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _299 = floor(_287);
    float _301 = _229 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _307 = -_263;
    float _309 = fma(_301, 2.0, _307);
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _313 = _227 + _311;
    float _315 = 1.0 / _261;
    float _317 = _233 * 2.0;
    float _319 = _313 * _265;
    float _321 = _293 * _285;
    float _323 = _233 + _229;
    float _325 = _229 + _231;
    float _327 = fma(_279, _321, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _329 = floor(_317);
    float _331 = _231 * 2.0;
    float _333 = _323 + (-1.0);
    float _335 = _325 + (-1.0);
    float _337 = _233 + _231;
    bool _339 = _299 > 0.0;
    float _341 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _343 = floor(_331);
    float _345 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _347 = _337 + (-1.0);
    float _349 = _239 * _315;
    bool _351 = _299 >= 0.0;
    bool _353 = isnan(_299);
    bool _355 = _351 || _353;
    bool _357 = isnan(0.0);
    bool _359 = _355 || _357;
    float _361 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _363 = as_type<int>(_347);
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[198].y;
    if (_257)
    {
        _363 = 0;
    }
    int _367 = _363;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _369;
    bool _373 = _329 > 0.0;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _377 = _375 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _379 = _329 >= 0.0;
    bool _381 = isnan(_329);
    bool _383 = _379 || _381;
    bool _385 = isnan(0.0);
    bool _387 = _383 || _385;
    float _389 = fma(_371, _289, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _391 = _367;
    if (!_257)
    {
        _391 = 1;
    }
    int _393 = _391;
    float _395 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _397 = int(_395);
    int _399 = _359 ? 0 : 1;
    float _401 = fma(_377, _321, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _403 = _343 > 0.0;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _407 = _343 >= 0.0;
    bool _409 = isnan(_343);
    bool _411 = _407 || _409;
    bool _413 = isnan(0.0);
    bool _415 = _411 || _413;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _419 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _421 = int(_419);
    float _423 = -_157;
    float _425 = fma(_423, (*spvDescriptorSet0.vp_c9)._m0[76].x, _309);
    int _427 = _387 ? 0 : 1;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _429;
    bool _433 = _393 != 1;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _435;
    int _439 = ~_399;
    int _441 = _439 + 1;
    int _443 = _441 + 1;
    float _445 = fma(_431, _319, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    int _447 = _443;
    float _449 = as_type<float>(_397);
    if (!_339)
    {
        int _451 = ~_399;
        int _453 = _451 + 1;
        _447 = _453;
    }
    int _455 = _447;
    float _457 = fma(_437, _319, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    int _459 = _415 ? 0 : 1;
    float _461 = 1.0 / _283;
    int _463 = ~_427;
    int _465 = _463 + 1;
    int _467 = _465 + 1;
    int _469 = _467;
    if (!_373)
    {
        int _471 = ~_427;
        int _473 = _471 + 1;
        _469 = _473;
    }
    int _475 = _469;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _479 = _477 != 0;
    int _481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _483 = _481 != 0;
    int _485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _487 = _485 != 0;
    int _489 = ~_459;
    int _491 = _489 + 1;
    int _493 = _491 + 1;
    int _495 = _493;
    if (!_403)
    {
        int _497 = ~_459;
        int _499 = _497 + 1;
        _495 = _499;
    }
    int _501 = _495;
    float _503 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _505 = log2(_503);
    bool _507 = !_483;
    int _509 = _507 ? 0 : 1;
    bool _511 = !_479;
    int _513 = _511 ? 0 : 1;
    bool _515 = !_487;
    int _517 = _515 ? 0 : 1;
    float _519 = _461 * _157;
    int _521 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _523 = _521 != 0;
    int _525 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _527 = _525 != 0;
    int _529 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _531 = _529 != 0;
    float _533 = float(_397);
    if (!_433)
    {
        _449 = _231;
    }
    float _535 = _449;
    float _537 = _535;
    if (_433)
    {
        _537 = _229;
    }
    float _539 = _537;
    bool _541 = !_523;
    float _543 = _541 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _545 = 1.0 / _533;
    float _547 = _543;
    if (!_433)
    {
        _365 = _231;
    }
    float _549 = _365;
    float _551 = _539 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _553 = abs(as_type<int>(_543));
    float _555 = _549;
    if (_433)
    {
        _555 = _229;
    }
    float _557 = _555;
    float _559 = -_303;
    float _561 = fma(_551, 2.0, _559);
    float _563 = float(_553);
    float _565 = _505 * _157;
    float _567 = float(_475);
    float _569 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[83].z, _305);
    float _571 = _557;
    if (!_433)
    {
        _571 = _233;
    }
    float _573 = _571;
    float _575 = _573;
    if (_433)
    {
        _575 = _231;
    }
    float _577 = _575;
    float _579 = _563 * _567;
    float _581 = exp2(_565);
    if (!_433)
    {
        _547 = _233;
    }
    float _583 = _547;
    float _585 = _577 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _587 = _583;
    if (_433)
    {
        _587 = _231;
    }
    float _589 = _587;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _593 = 1.0 + _591;
    float _595 = float(_421);
    float _597 = fma(_585, -2.0, _405);
    float _599 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[83].w, _417);
    float _601 = 1.0 / _595;
    float _603 = in.m_72.x;
    float _605 = in.m_72.y;
    float _607 = in.m_72.z;
    float _609 = _545 * _157;
    bool _611 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _613 = isnan(1.0);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _619 = _615 || _617;
    float _621 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[82].z, _569);
    bool _623 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _625 = isnan(0.0);
    bool _627 = _623 || _625;
    bool _629 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _631 = _627 || _629;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _635 = 1.0 / _593;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _639 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _641 = isnan(_227);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    float _651 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[78].z, _633);
    bool _653 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _655 = isnan(_227);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[78].w, _637);
    float _667 = -_581;
    float _669 = _667 + 1.0;
    float _671 = -_649;
    float _673 = _671 + 1.0;
    float _675 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[76].y, _295);
    float _677 = _601 * _157;
    float _679 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[77].z, _651);
    float _681 = _631 ? _669 : 0.0;
    float _683 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[82].w, _599);
    float _685 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[77].w, _665);
    float _687 = -_157;
    float _689 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[81].x, _561);
    float _691 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[81].y, _597);
    float _693 = _609;
    if (_619)
    {
        float _695 = _681 * _635;
        _161 = _695;
    }
    float _697 = _161;
    float _699 = _579 * (-2.0);
    bool _701 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _703 = isnan(_227);
    bool _705 = _701 || _703;
    bool _707 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _709 = _705 || _707;
    float _711 = float(_709);
    float _713 = _663 * _673;
    float _715 = -_663;
    float _717 = _715 + 1.0;
    bool _719 = !_527;
    int _721 = _719 ? 0 : 1;
    float _723 = fma(_345, _699, _345);
    float _725 = fma(_699, _603, _603);
    float _727 = _711 * _717;
    bool _729 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _731 = isnan(_227);
    bool _733 = _729 || _731;
    bool _735 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _737 = _733 || _735;
    float _739 = float(_737);
    float _741 = -_711;
    float _743 = _741 + 1.0;
    int _745 = abs(_721);
    bool _747 = !_531;
    int _749 = _747 ? 0 : 1;
    float _751 = _739 * _743;
    float _753 = float(_455);
    float _755 = -_739;
    float _757 = _755 + 1.0;
    float _759 = float(_745);
    bool _761 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _763 = isnan(_227);
    bool _765 = _761 || _763;
    bool _767 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _769 = _765 || _767;
    float _771 = float(_769);
    int _773 = abs(_749);
    float _775 = _229 + (-0.5);
    float _777 = _759 * _753;
    float _779 = _771 * _757;
    float _781 = float(_773);
    float _783 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[196].x, _725);
    float _785 = float(_501);
    float _787 = _777 * (-2.0);
    float _789 = _297 * _779;
    float _791 = _389 * _779;
    float _793 = -_771;
    float _795 = _793 + 1.0;
    float _797 = _781 * _785;
    float _799 = _231 + (-0.5);
    float _801 = fma(_787, _605, _605);
    float _803 = fma(_723, _697, _783);
    float _805 = fma(_361, _787, _361);
    float _807 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[143].y, _791);
    float _809 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[196].y, _801);
    float _811 = _803 * 0.15915493667125701904296875;
    float _813 = _797 * (-2.0);
    float _815 = fma(_401, _751, _807);
    float _817 = fma(_805, _697, _809);
    float _819 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[143].x, _789);
    float _821 = in.m_74.x;
    float _823 = in.m_74.y;
    float _825 = fma(_341, _813, _341);
    float _827 = fma(_813, _607, _607);
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _831 = _829 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _833 = _233 + (-0.5);
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _837 = _835 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _839 = fma(_327, _751, _819);
    float _841 = _817 * 0.15915493667125701904296875;
    float _843 = in.m_60.x;
    float _845 = in.m_60.y;
    float _847 = in.m_60.z;
    float _849 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[196].z, _827);
    float _851 = fma(_831, _349, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _853 = fma(_837, _349, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _855 = in.m_76.x;
    float _857 = in.m_76.y;
    float _859 = in.m_76.z;
    float _861 = in.m_76.w;
    float _863 = fma(_457, _727, _815);
    float _865 = fma(_445, _727, _839);
    float _867 = fma(_825, _697, _849);
    float _869 = _811 * 6.283185482025146484375;
    float _871 = cos(_869);
    float _873 = fma(_853, _713, _863);
    float _875 = fma(_851, _713, _865);
    float _877 = _867 * 0.15915493667125701904296875;
    float _879 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _881 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[147].y, _873);
    float _883 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[147].x, _875);
    float _885 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _887 = _841 * 6.283185482025146484375;
    float _889 = sin(_887);
    float _891 = _881 * _823;
    float _893 = _883 * _821;
    float _895 = _891 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _897 = _893 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _899 = _841 * 6.283185482025146484375;
    float _901 = cos(_899);
    float _903 = in.m_78.x;
    float _905 = in.m_78.y;
    float _907 = in.m_78.z;
    float _909 = in.m_78.w;
    float _911 = _895 * _879;
    float _913 = _897 * _885;
    float _915 = _845 * _857;
    float _917 = _811 * 6.283185482025146484375;
    float _919 = sin(_917);
    float _921 = fma(_843, _855, _915);
    float _923 = _871 * _889;
    float _925 = fma(_847, _859, _921);
    float _927 = _877 * 6.283185482025146484375;
    float _929 = cos(_927);
    float _931 = _871 * _901;
    float _933 = _877 * 6.283185482025146484375;
    float _935 = sin(_933);
    float _937 = _919 * _889;
    float _939 = _919 * _901;
    float _941 = _871 * _929;
    float _943 = _919 * _929;
    float _945 = _901 * _929;
    float _947 = _889 * _929;
    float _949 = _941 * _911;
    float _951 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _953 = _943 * _911;
    float _955 = fma(_935, _931, _937);
    float _957 = -_923;
    float _959 = fma(_935, _939, _957);
    float _961 = -_939;
    float _963 = fma(_935, _923, _961);
    float _965 = -_911;
    float _967 = _935 * _965;
    float _969 = fma(_955, _913, _949);
    float _971 = fma(_935, _937, _931);
    float _973 = fma(_945, _913, _967);
    float _975 = fma(_963, _951, _969);
    float _977 = _845 * _905;
    float _979 = fma(_959, _913, _953);
    float _981 = fma(_947, _951, _973);
    float _983 = _975 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _985 = _975 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _987 = fma(_843, _903, _977);
    float _989 = fma(_971, _951, _979);
    float _991 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[24].x, _983);
    float _993 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[26].x, _985);
    float _995 = fma(_847, _907, _987);
    float _997 = _925 + _861;
    float _999 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[24].z, _991);
    float _1001 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[26].z, _993);
    float _1003 = _995 + _909;
    float _1005 = _999 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1007 = _1001 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1009 = _997 + _1005;
    float _1011 = _1003 + _1007;
    float _1013 = in.m_80.x;
    float _1015 = in.m_80.y;
    float _1017 = in.m_80.z;
    float _1019 = in.m_80.w;
    float _1021 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1023 = _1009 + _1021;
    float _1025 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1027 = _1011 + _1025;
    float _1029 = _1023 * _1023;
    float _1031 = _1027 * _1027;
    float _1033 = _1029 + _1031;
    float _1035 = sqrt(_1033);
    float _1037 = _845 * _1015;
    float _1039 = fma(_843, _1013, _1037);
    bool _1041 = _1035 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1043 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1045 = _1035 + _1043;
    float _1047 = _975 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1049 = fma(_847, _1017, _1039);
    float _1051 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1047);
    float _1053 = _1049 + _1019;
    float _1055 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1051);
    float _1057 = _853;
    float _1059 = _1033;
    float _1061 = _975;
    float _1063 = _845;
    float _1065 = _1009;
    float _1067 = _1011;
    float _1069 = _1029;
    float _1071 = _1031;
    float _1073 = _1003;
    if (_1041)
    {
        float _1075 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1057 = _1075;
    }
    float _1077 = _1057;
    float _1079 = _1055 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1081 = _1079;
    if (_1041)
    {
        float _1083 = rsqrt(_1033);
        _1059 = _1083;
    }
    float _1085 = _1059;
    float _1087 = _1077;
    if (_1041)
    {
        float _1089 = _1045 * _1077;
        _1087 = _1089;
    }
    float _1091 = _1087;
    if (_1041)
    {
        float _1093 = _1091 * 0.15915493667125701904296875;
        _1061 = _1093;
    }
    float _1095 = _1061;
    float _1097 = _1053 + _1079;
    float _1099 = _843;
    float _1101 = _1097;
    if (_1041)
    {
        float _1103 = _1095 * 6.283185482025146484375;
        float _1105 = sin(_1103);
        _1099 = _1105;
    }
    float _1107 = _1099;
    if (_1041)
    {
        float _1109 = _1097 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1063 = _1109;
    }
    float _1111 = _1063;
    float _1113 = _1111;
    if (_1041)
    {
        float _1115 = fma(_1107, _1111, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1113 = _1115;
    }
    float _1117 = _1113;
    float _1119 = _1117;
    if (_1041)
    {
        float _1121 = _1085 * _1117;
        _1119 = _1121;
    }
    float _1123 = _1119;
    if (_1041)
    {
        float _1125 = fma(_1023, _1123, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1065 = _1125;
    }
    float _1127 = _1065;
    if (_1041)
    {
        float _1129 = fma(_1027, _1123, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1067 = _1129;
    }
    float _1131 = _1067;
    float _1133 = fma(_1127, 6.2500002968590706586837768554688e-05, 0.5);
    float _1135 = fma(_1131, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5831 = float2(_1133, _1135);
    float3 _1139 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5831, float2(0.0), isnan(_5831)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5831, float2(0.0), isnan(_5831)), level(0.0)).xyz;
    float _1141 = _1139.x;
    float _1143 = _1139.y;
    float _1145 = _1139.z;
    float _1147 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1149 = int(_1147);
    if (_257)
    {
        float _1151 = in.m_70.x;
        _1081 = _1151;
    }
    float _1153 = _1081;
    int _1155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1157 = _1155 != 0;
    float _1159 = -_679;
    float _1161 = _1159 + 1.0;
    int _1163 = abs(_509);
    float _1165 = _1153;
    if (!_257)
    {
        float _1167 = in.m_70.y;
        _1165 = _1167;
    }
    float _1169 = _1165;
    float _1171 = -_621;
    float _1173 = _1171 + 1.0;
    float _1175 = -_683;
    float _1177 = _1175 + 1.0;
    float _1179 = trunc(_609);
    int _1181 = int(_1179);
    float _1183 = float(uint(_1149));
    float _1185 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1187 = int(_1185);
    if (_257)
    {
        _693 = 1.0;
    }
    float _1189 = _693;
    float _1191 = _1189;
    if (!_257)
    {
        _1191 = 1.2345600128173828125;
    }
    float _1193 = _1191;
    float _1195 = float(uint(_1181));
    float _1197 = 1.0 / _1183;
    float _1199 = _1193 * _1169;
    int _1201 = ~_1149;
    int _1203 = _1201 + 1;
    float _1205 = float(uint(_1187));
    float _1207 = trunc(_677);
    int _1209 = int(_1207);
    int _1211 = ~_1149;
    int _1213 = _1211 + 1;
    int _1215 = as_type<int>(_1197) + (-2);
    float _1217 = 1.0 / _1205;
    float _1219 = as_type<float>(_1215) * _1195;
    float _1221 = float(uint(_1209));
    float _1223 = floor(_1199);
    float _1225 = float(_1209);
    float _1227 = trunc(_1219);
    float _1229 = precise::max(_1227, 0.0);
    uint _1232 = uint(_1229);
    float _1234 = -_1223;
    float _1236 = _1199 + _1234;
    int _1238 = _1213 * int(_1232);
    int _1240 = _1238 + _1181;
    float _1242 = float(uint(_1240));
    float _1244 = as_type<float>(_1215) * _1242;
    int _1246 = as_type<int>(_1217) + (-2);
    float _1248 = _1217;
    if (_257)
    {
        _1248 = 1.0;
    }
    float _1250 = _1248;
    float _1252 = _1250;
    if (!_257)
    {
        _1252 = 7.345489978790283203125;
    }
    float _1254 = _1252;
    float _1256 = trunc(_1244);
    float _1258 = precise::max(_1256, 0.0);
    uint _1260 = uint(_1258);
    float _1262 = as_type<float>(_1246) * _1221;
    int _1264 = ~_1187;
    int _1266 = _1264 + 1;
    float _1268 = _1254 * _229;
    float _1270 = trunc(_1262);
    float _1272 = precise::max(_1270, 0.0);
    uint _1274 = uint(_1272);
    int _1276 = int(_1232) + int(_1260);
    float _1278 = floor(_1268);
    float _1280 = float(_1149);
    int _1282 = _1203 * _1276;
    int _1284 = _1282 + _1181;
    float _1286 = float(_1181);
    int _1288 = _1266 * int(_1274);
    int _1290 = _1288 + _1209;
    bool _1292 = _1286 >= _1280;
    bool _1294 = isnan(_1286);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan(_1280);
    bool _1300 = _1296 || _1298;
    float _1302 = float(_1300);
    bool _1304 = uint(_1284) >= uint(_1149);
    float _1306 = float(uint(_1290));
    float _1308 = trunc(_1302);
    int _1310 = int(_1308);
    bool _1312 = !_1304;
    int _1314 = _1312 ? 0 : (-1);
    float _1316 = -_1278;
    float _1318 = _1268 + _1316;
    float _1320 = as_type<float>(_1246) * _1306;
    int _1322 = ~_1276;
    int _1324 = _1322 + _1314;
    int _1326 = _1324 + 1;
    float _1328 = _1318 * _1280;
    int _1330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1332 = _1330 != 0;
    float _1334 = trunc(_1320);
    float _1336 = precise::max(_1334, 0.0);
    uint _1338 = uint(_1336);
    int _1340 = _1149 * _1326;
    int _1342 = _1340 + _1181;
    int _1344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1346 = _1344 != 0;
    int _1348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1350 = _1348 != 0;
    int _1352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1354 = _1352 != 0;
    int _1356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1358 = _1356 != 0;
    float _1360 = _1280 * _519;
    bool _1362 = !_1332;
    int _1364 = _1362 ? 0 : 1;
    bool _1366 = _1149 == 0;
    float _1368 = trunc(_1328);
    int _1370 = int(_1368);
    int _1372 = ~_1310;
    int _1374 = _1372 + 1;
    int _1376 = _1374 + 1;
    bool _1378 = !_1366;
    int _1380 = _1378 ? _1342 : (-1);
    int _1382 = _1149 + (-1);
    int _1384 = abs(_1364);
    int _1386 = _1380 * _1376;
    int _1388 = int(_1274) + int(_1338);
    float _1390 = trunc(_1360);
    int _1392 = int(_1390);
    int _1394 = ~_1187;
    int _1396 = _1394 + 1;
    int _1398 = _1310 * _1382;
    int _1400 = _1398 + _1386;
    float _1402 = float(_1187);
    int _1404 = _1396 * _1388;
    int _1406 = _1404 + _1209;
    bool _1408 = _1225 >= _1402;
    bool _1410 = isnan(_1225);
    bool _1412 = _1408 || _1410;
    bool _1414 = isnan(_1402);
    bool _1416 = _1412 || _1414;
    float _1418 = float(_1416);
    float _1420 = _1236 * _1402;
    bool _1422 = !_1157;
    int _1424 = _1422 ? 0 : 1;
    int _1426 = _1400 * _1163;
    bool _1428 = uint(_1406) >= uint(_1187);
    float _1430 = trunc(_1418);
    int _1432 = int(_1430);
    float _1434 = _1402 * _519;
    bool _1436 = !_1428;
    int _1438 = _1436 ? 0 : (-1);
    int _1440 = abs(_513);
    int _1442 = _1370 * _1384;
    int _1444 = _1442 + _1181;
    int _1446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1448 = _1446 != 0;
    float _1450 = trunc(_1420);
    int _1452 = int(_1450);
    int _1454 = ~_1388;
    int _1456 = _1454 + _1438;
    int _1458 = _1456 + 1;
    int _1460 = _1392 * _1440;
    int _1462 = _1460 + _1426;
    bool _1464 = !_1448;
    int _1466 = _1464 ? 0 : 1;
    int _1468 = abs(_517);
    int _1470 = _1187 * _1458;
    int _1472 = _1470 + _1209;
    int _1474 = abs(_1466);
    float _1476 = trunc(_1434);
    int _1478 = int(_1476);
    bool _1480 = _1187 == 0;
    int _1482 = abs(_1424);
    int _1484 = ~_1432;
    int _1486 = _1484 + 1;
    int _1488 = _1486 + 1;
    int _1490 = _1444 * _1468;
    int _1492 = _1490 + _1462;
    bool _1494 = !_1480;
    int _1496 = _1494 ? _1472 : (-1);
    int _1498 = _1452 * _1474;
    int _1500 = _1498 + _1209;
    int _1502 = _1187 + (-1);
    int _1504 = _1370 * _1482;
    int _1506 = _1504 + _1492;
    int _1508 = ~_1149;
    int _1510 = _1508 + 1;
    int _1512 = _1496 * _1488;
    bool _1514 = !_1350;
    int _1516 = _1514 ? 0 : 1;
    float _1518 = float(uint(_1506));
    int _1520 = _1432 * _1502;
    int _1522 = _1520 + _1512;
    bool _1524 = !_1346;
    int _1526 = _1524 ? 0 : 1;
    int _1528 = abs(_1516);
    bool _1530 = !_1354;
    int _1532 = _1530 ? 0 : 1;
    int _1534 = abs(_1526);
    int _1536 = _1522 * _1528;
    int _1538 = abs(_1532);
    float _1540 = as_type<float>(_1215) * _1518;
    bool _1542 = !_1358;
    int _1544 = _1542 ? 0 : 1;
    int _1546 = abs(_1544);
    float _1548 = trunc(_1540);
    float _1550 = precise::max(_1548, 0.0);
    uint _1552 = uint(_1550);
    int _1554 = _1478 * _1534;
    int _1556 = _1554 + _1536;
    float _1558 = float(uint(_1500));
    int _1560 = _1500 * _1538;
    int _1562 = _1560 + _1556;
    int _1564 = ~_1149;
    int _1566 = _1564 + 1;
    float _1568 = float(uint(_1444));
    int _1570 = _1452 * _1546;
    int _1572 = _1570 + _1562;
    int _1574 = ~_1187;
    int _1576 = _1574 + 1;
    float _1578 = as_type<float>(_1215) * _1568;
    float _1580 = float(uint(_1572));
    int _1582 = _1566 * int(_1552);
    int _1584 = _1582 + _1506;
    float _1586 = as_type<float>(_1246) * _1580;
    float _1588 = float(uint(_1584));
    float _1590 = trunc(_1578);
    float _1592 = precise::max(_1590, 0.0);
    uint _1594 = uint(_1592);
    float _1596 = as_type<float>(_1215) * _1588;
    float _1598 = as_type<float>(_1246) * _1558;
    float _1600 = trunc(_1586);
    float _1602 = precise::max(_1600, 0.0);
    uint _1604 = uint(_1602);
    float _1606 = trunc(_1596);
    float _1608 = precise::max(_1606, 0.0);
    uint _1610 = uint(_1608);
    int _1612 = _1576 * int(_1604);
    int _1614 = _1612 + _1572;
    float _1616 = trunc(_1598);
    float _1618 = precise::max(_1616, 0.0);
    uint _1620 = uint(_1618);
    int _1622 = ~_1149;
    int _1624 = _1622 + 1;
    float _1626 = float(uint(_1614));
    int _1628 = _1624 * int(_1594);
    int _1630 = _1628 + _1444;
    int _1632 = int(_1552) + int(_1610);
    float _1634 = as_type<float>(_1246) * _1626;
    int _1636 = ~_1187;
    int _1638 = _1636 + 1;
    float _1640 = float(uint(_1630));
    int _1642 = _1510 * _1632;
    int _1644 = _1642 + _1506;
    float _1646 = trunc(_1634);
    float _1648 = precise::max(_1646, 0.0);
    uint _1650 = uint(_1648);
    float _1652 = as_type<float>(_1215) * _1640;
    bool _1654 = uint(_1644) >= uint(_1149);
    int _1656 = _1638 * int(_1620);
    int _1658 = _1656 + _1500;
    bool _1660 = !_1654;
    int _1662 = _1660 ? 0 : (-1);
    float _1664 = trunc(_1652);
    float _1666 = precise::max(_1664, 0.0);
    uint _1668 = uint(_1666);
    float _1670 = float(uint(_1658));
    int _1672 = ~_1632;
    int _1674 = _1672 + _1662;
    int _1676 = _1674 + 1;
    int _1678 = ~_1187;
    int _1680 = _1678 + 1;
    float _1682 = as_type<float>(_1246) * _1670;
    int _1684 = int(_1604) + int(_1650);
    int _1686 = _1149 * _1676;
    int _1688 = _1686 + _1506;
    float _1690 = trunc(_1682);
    float _1692 = precise::max(_1690, 0.0);
    uint _1694 = uint(_1692);
    int _1696 = ~_1149;
    int _1698 = _1696 + 1;
    int _1700 = _1680 * _1684;
    int _1702 = _1700 + _1572;
    bool _1704 = !_1366;
    int _1706 = _1704 ? _1688 : (-1);
    int _1708 = int(_1594) + int(_1668);
    int _1710 = _1706 & 3;
    bool _1712 = _1710 != 0;
    int _1714 = _1706 & 3;
    bool _1716 = _1714 != 0;
    bool _1718 = uint(_1702) >= uint(_1187);
    int _1720 = _1712 ? 0 : 1;
    bool _1722 = uint(_1714) > 1u;
    bool _1724 = uint(_1714) >= 2u;
    bool _1726 = !_1718;
    int _1728 = _1726 ? 0 : (-1);
    int _1730 = _1724 ? 0 : 1;
    int _1732 = ~_1187;
    int _1734 = _1732 + 1;
    bool _1736 = _1714 != 3;
    bool _1738 = _235 > 0.5;
    int _1740 = _1698 * _1708;
    int _1742 = _1740 + _1444;
    int _1744 = int(_1620) + int(_1694);
    int _1746 = ~_1720;
    int _1748 = _1746 + 1;
    int _1750 = _1748 + 1;
    int _1752 = ~_1684;
    int _1754 = _1752 + _1728;
    int _1756 = _1754 + 1;
    int _1758 = _1734 * _1744;
    int _1760 = _1758 + _1500;
    int _1762 = _1750;
    if (!_1722)
    {
        int _1764 = ~_1720;
        int _1766 = _1764 + 1;
        _1762 = _1766;
    }
    int _1768 = _1762;
    bool _1770 = uint(_1742) >= uint(_1149);
    int _1772 = _1187 * _1756;
    int _1774 = _1772 + _1572;
    int _1776 = ~_1730;
    int _1778 = _1776 + 1;
    int _1780 = _1778 + 1;
    bool _1782 = !_1770;
    int _1784 = _1782 ? 0 : (-1);
    int _1786 = _1780;
    if (_1736)
    {
        int _1788 = ~_1730;
        int _1790 = _1788 + 1;
        _1786 = _1790;
    }
    int _1792 = _1786;
    bool _1794 = uint(_1760) >= uint(_1187);
    int _1796 = ~_1708;
    int _1798 = _1796 + _1784;
    int _1800 = _1798 + 1;
    float _1802 = -_197;
    int _1804 = _1738 ? as_type<int>(_1802) : as_type<int>(_197);
    bool _1806 = !_1480;
    int _1808 = _1806 ? _1774 : (-1);
    int _1810 = _1149 * _1800;
    int _1812 = _1810 + _1444;
    int _1814 = _1706 >> 31;
    int _1816 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1818 = _1816 != 0;
    bool _1820 = !_1794;
    int _1822 = _1820 ? 0 : (-1);
    int _1824 = _1808 >> 31;
    int _1826 = _1814 & 3;
    int _1828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1830 = _1828 != 0;
    bool _1832 = !_1818;
    int _1834 = _1832 ? 0 : 1;
    int _1836 = _1808 & 3;
    bool _1838 = _1836 != 0;
    int _1840 = ~_1744;
    int _1842 = _1840 + _1822;
    int _1844 = _1842 + 1;
    int _1846 = _1824 & 3;
    int _1848 = _1706 + _1826;
    int _1850 = _1187 * _1844;
    int _1852 = _1850 + _1500;
    bool _1854 = !_1830;
    int _1856 = _1854 ? 0 : 1;
    float _1858 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1860 = int(_1858);
    bool _1862 = uint(_1836) > 1u;
    int _1864 = _1808 + _1846;
    int _1866 = _1848 >> 2;
    int _1868 = _1808 & 3;
    bool _1870 = _1868 != 0;
    int _1872 = _1864 >> 2;
    int _1874 = _1866 << 4;
    int _1876 = _1874 + 368;
    int _1878 = _1870 ? 0 : 1;
    bool _1880 = _1714 != 3;
    int _1882 = _1872 << 4;
    int _1884 = _1882 + 512;
    uint _1886 = uint(int(uint(_1876) >> uint(2)));
    uint _1888 = uint(int(uint(int(_1886)) >> uint(2)));
    int _1890 = int(_1886) & 3;
    float _1892 = (*spvDescriptorSet0.vp_c9)._m0[int(_1888)][_1890];
    int _1894 = int(_1886) + 1;
    uint _1896 = uint(int(uint(_1894) >> uint(2)));
    int _1898 = _1894 & 3;
    float _1900 = (*spvDescriptorSet0.vp_c9)._m0[int(_1896)][_1898];
    int _1902 = ~_1878;
    int _1904 = _1902 + 1;
    int _1906 = _1904 + 1;
    int _1908 = _1906;
    if (!_1862)
    {
        int _1910 = ~_1878;
        int _1912 = _1910 + 1;
        _1908 = _1912;
    }
    int _1914 = _1908;
    bool _1916 = !_1716;
    int _1918 = _1916 ? 0 : 1;
    bool _1920 = _1836 != 3;
    uint _1922 = uint(int(uint(_1884) >> uint(2)));
    uint _1924 = uint(int(uint(int(_1922)) >> uint(2)));
    int _1926 = int(_1922) & 3;
    float _1928 = (*spvDescriptorSet0.vp_c9)._m0[int(_1924)][_1926];
    int _1930 = int(_1922) + 1;
    uint _1932 = uint(int(uint(_1930) >> uint(2)));
    int _1934 = _1930 & 3;
    float _1936 = (*spvDescriptorSet0.vp_c9)._m0[int(_1932)][_1934];
    bool _1938 = uint(_1836) >= 2u;
    bool _1940 = !_1366;
    int _1942 = _1940 ? _1812 : (-1);
    int _1944 = _1938 ? 0 : 1;
    bool _1946 = _1836 != 3;
    bool _1948 = !_1838;
    int _1950 = _1948 ? 0 : 1;
    bool _1952 = !_1880;
    int _1954 = _1952 ? 0 : (-1);
    int _1956 = ~_1944;
    int _1958 = _1956 + 1;
    int _1960 = _1958 + 1;
    int _1962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1964 = _1962 != 0;
    int _1966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1968 = _1966 != 0;
    int _1970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1972 = _1970 != 0;
    int _1974 = _1960;
    if (_1920)
    {
        int _1976 = ~_1944;
        int _1978 = _1976 + 1;
        _1974 = _1978;
    }
    int _1980 = _1974;
    int _1982 = _1876 + 8;
    uint _1984 = uint(int(uint(_1982) >> uint(2)));
    uint _1986 = uint(int(uint(int(_1984)) >> uint(2)));
    int _1988 = int(_1984) & 3;
    float _1990 = (*spvDescriptorSet0.vp_c9)._m0[int(_1986)][_1988];
    int _1992 = int(_1984) + 1;
    uint _1994 = uint(int(uint(_1992) >> uint(2)));
    int _1996 = _1992 & 3;
    float _1998 = (*spvDescriptorSet0.vp_c9)._m0[int(_1994)][_1996];
    int _2000 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2002 = _2000 != 0;
    int _2004 = abs(_1768);
    int _2006 = abs(_1914);
    int _2008 = _1884 + 8;
    uint _2010 = uint(int(uint(_2008) >> uint(2)));
    uint _2012 = uint(int(uint(int(_2010)) >> uint(2)));
    int _2014 = int(_2010) & 3;
    float _2016 = (*spvDescriptorSet0.vp_c9)._m0[int(_2012)][_2014];
    int _2018 = int(_2010) + 1;
    uint _2020 = uint(int(uint(_2018) >> uint(2)));
    int _2022 = _2018 & 3;
    float _2024 = (*spvDescriptorSet0.vp_c9)._m0[int(_2020)][_2022];
    bool _2026 = !_1946;
    int _2028 = _2026 ? 0 : (-1);
    bool _2030 = _229 > 0.5;
    int _2032 = abs(_1918);
    int _2034 = ~_2004;
    int _2036 = _2034 + 1;
    int _2038 = _2036 + 1;
    bool _2040 = !_1480;
    int _2042 = _2040 ? _1852 : (-1);
    float _2044 = -_193;
    int _2046 = _2030 ? as_type<int>(_2044) : as_type<int>(_193);
    int _2048 = _2038 * as_type<int>(_1900);
    bool _2050 = _231 > 0.5;
    bool _2052 = _233 > 0.5;
    float _2054 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2056 = abs(_1950);
    float _2058 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2060 = ~_2006;
    int _2062 = _2060 + 1;
    int _2064 = _2062 + 1;
    float _2066 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2068 = ~_2032;
    int _2070 = _2068 + 1;
    int _2072 = _2070 + 1;
    float _2074 = _2054 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2076 = _2064 * as_type<int>(_1936);
    int _2078 = ~_2056;
    int _2080 = _2078 + 1;
    int _2082 = _2080 + 1;
    int _2084 = _2072 * as_type<int>(_1892);
    int _2086 = _2084 + _2048;
    int _2088 = abs(_1792);
    float _2090 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2092 = int(_2090);
    float _2094 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2096 = _2058 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2098 = _2066 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2100 = _2082 * as_type<int>(_1928);
    int _2102 = _2100 + _2076;
    float _2104 = _941 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2106 = abs(_1980);
    out.m_82.x = _2074;
    out.m_82.y = _2096;
    out.m_82.z = _2098;
    out.m_82.w = _2094;
    int _2108 = abs(_2028);
    float _2110 = _941 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2112 = ~_2088;
    int _2114 = _2112 + 1;
    int _2116 = _2114 + 1;
    int _2118 = abs(_1954);
    bool _2120 = !_1964;
    float _2122 = _2120 ? _197 : as_type<float>(_1804);
    int _2124 = _2116 * as_type<int>(_1990);
    int _2126 = _2124 + _2086;
    float _2128 = _963 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2130 = !_2002;
    float _2132 = _2130 ? _193 : as_type<float>(_2046);
    int _2134 = ~_2106;
    int _2136 = _2134 + 1;
    int _2138 = _2136 + 1;
    float _2140 = _941 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2142 = -_935;
    float _2144 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2110);
    float _2146 = float(uint(_1860));
    int _2148 = _2138 * as_type<int>(_2016);
    int _2150 = _2148 + _2102;
    float _2152 = -_935;
    float _2154 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2104);
    int _2156 = ~_2108;
    int _2158 = _2156 + 1;
    int _2160 = _2158 + 1;
    float _2162 = _2104;
    if (_1041)
    {
        float _2164 = _1095 * 6.283185482025146484375;
        float _2166 = cos(_2164);
        _2162 = _2166;
    }
    float _2168 = _2162;
    float _2170 = float(uint(_2092));
    int _2172 = ~_2118;
    int _2174 = _2172 + 1;
    int _2176 = _2174 + 1;
    int _2178 = _2160 * as_type<int>(_2024);
    int _2180 = _2178 + _2150;
    int _2182 = abs(_1834);
    int _2184 = abs(_1856);
    float _2186 = 1.0 / _2146;
    int _2188 = _2176 * as_type<int>(_1998);
    int _2190 = _2188 + _2126;
    int _2192 = ~_2182;
    int _2194 = _2192 + 1;
    int _2196 = _2194 + 1;
    int _2198 = ~_2184;
    int _2200 = _2198 + 1;
    int _2202 = _2200 + 1;
    int _2204 = abs(_1860);
    float _2206 = 1.0 / _2170;
    int _2208 = _2180 * _2202;
    float _2210 = float(uint(_2204));
    int _2212 = abs(_2092);
    int _2214 = _2042 * _2184;
    int _2216 = _2214 + _2208;
    int _2218 = as_type<int>(_2186) + (-2);
    float _2220 = -_935;
    float _2222 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2140);
    int _2224 = _2190 * _2196;
    float _2226 = 1.0 / _2210;
    float _2228 = float(uint(_2212));
    float _2230 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2144);
    int _2232 = _1942 * _2182;
    int _2234 = _2232 + _2224;
    float _2236 = _955 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2238 = as_type<int>(_2206) + (-2);
    float _2240 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2222);
    float _2242 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2154);
    float _2244 = float(uint(_2234));
    float _2246 = 1.0 / _2228;
    float _2248 = _955 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2250 = _955 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2252 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2236);
    float _2254 = as_type<float>(_2218) * _2244;
    int _2256 = abs(_2234);
    float _2258 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2248);
    float _2260 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2250);
    float _2262 = float(uint(_2216));
    float _2264 = trunc(_2254);
    float _2266 = precise::max(_2264, 0.0);
    uint _2268 = uint(_2266);
    float _2270 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2258);
    int _2272 = as_type<int>(_2226) + (-2);
    float _2274 = as_type<float>(_2238) * _2262;
    float _2276 = float(uint(_2256));
    float _2278 = _963 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2280 = abs(_2216);
    int _2282 = ~_1860;
    int _2284 = _2282 + 1;
    float _2286 = as_type<float>(_2272) * _2276;
    int _2288 = as_type<int>(_2246) + (-2);
    float _2290 = _963 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2292 = float(uint(_2280));
    float _2294 = trunc(_2274);
    float _2296 = precise::max(_2294, 0.0);
    uint _2298 = uint(_2296);
    float _2300 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2278);
    int _2302 = _2284 * int(_2268);
    int _2304 = _2302 + _2234;
    float _2306 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2290);
    float _2308 = as_type<float>(_2288) * _2292;
    float _2310 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2128);
    float _2312 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2300);
    float _2314 = float(uint(_2304));
    float _2316 = trunc(_2286);
    float _2318 = precise::max(_2316, 0.0);
    uint _2320 = uint(_2318);
    float _2322 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2306);
    float _2324 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2310);
    int _2326 = ~_2204;
    int _2328 = _2326 + 1;
    float _2330 = as_type<float>(_2218) * _2314;
    int _2332 = ~_2092;
    int _2334 = _2332 + 1;
    float _2336 = trunc(_2308);
    float _2338 = precise::max(_2336, 0.0);
    uint _2340 = uint(_2338);
    int _2342 = ~_2212;
    int _2344 = _2342 + 1;
    int _2346 = _2334 * int(_2298);
    int _2348 = _2346 + _2216;
    float _2350 = as_type<float>(_2328);
    float _2352 = _2286;
    float _2354 = as_type<float>(_2348);
    if (_1041)
    {
        float _2356 = _2168 + (-1.0);
        _2350 = _2356;
    }
    float _2358 = _2350;
    float _2360 = _2358;
    if (_1041)
    {
        float _2362 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2364 = _1127 + _2362;
        _2352 = _2364;
    }
    float _2366 = _2352;
    float _2368 = float(uint(_2348));
    int _2370 = _2328 * int(_2320);
    int _2372 = _2370 + _2256;
    if (_1041)
    {
        float _2374 = _2358 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2360 = _2374;
    }
    float _2376 = _2360;
    float _2378 = trunc(_2330);
    float _2380 = precise::max(_2378, 0.0);
    uint _2382 = uint(_2380);
    if (_1041)
    {
        float _2384 = _2366 * _2366;
        _1069 = _2384;
    }
    float _2386 = _1069;
    float _2388 = as_type<float>(_2238) * _2368;
    float _2390 = float(uint(_2372));
    if (_1041)
    {
        float _2392 = fma(_1097, _2168, _2376);
        _1101 = _2392;
    }
    float _2394 = _1101;
    float _2396 = -_197;
    int _2398 = _2050 ? as_type<int>(_2396) : as_type<int>(_197);
    int _2400 = _2344 * int(_2340);
    int _2402 = _2400 + _2280;
    float _2404 = _197 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2406 = as_type<float>(_2272) * _2390;
    float _2408 = -_193;
    int _2410 = _2052 ? as_type<int>(_2408) : as_type<int>(_193);
    float _2412 = trunc(_2388);
    float _2414 = precise::max(_2412, 0.0);
    uint _2416 = uint(_2414);
    float _2418 = float(uint(_2402));
    float _2420 = _2404 * _2240;
    bool _2422 = !_1968;
    float _2424 = _2422 ? _197 : as_type<float>(_2398);
    float _2426 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2252);
    bool _2428 = !_1972;
    float _2430 = _2428 ? _193 : as_type<float>(_2410);
    float _2432 = as_type<float>(_2288) * _2418;
    float _2434 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2260);
    float _2436 = trunc(_2406);
    float _2438 = precise::max(_2436, 0.0);
    uint _2440 = uint(_2438);
    float _2442 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2444 = _2404 * _2230;
    float _2446 = _2404 * _2242;
    float _2448 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2450 = _2394 + _2448;
    float _2452 = fma(_2442, _2426, _2420);
    float _2454 = fma(_2442, _2270, _2444);
    if (_1041)
    {
        float _2456 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2458 = _1131 + _2456;
        _2354 = _2458;
    }
    float _2460 = _2354;
    float _2462 = trunc(_2432);
    float _2464 = precise::max(_2462, 0.0);
    uint _2466 = uint(_2464);
    float _2468 = fma(_2442, _2434, _2446);
    float _2470 = fma(_2450, _2450, _2386);
    int _2472 = int(_2268) + int(_2382);
    float _2474 = _2468;
    if (_1041)
    {
        float _2476 = _2460 * _2460;
        _1071 = _2476;
    }
    float _2478 = _1071;
    int _2480 = ~_1860;
    int _2482 = _2480 + 1;
    out.m_84.x = _2426;
    out.m_84.y = _2270;
    out.m_84.z = _2434;
    int _2484 = int(_2298) + int(_2416);
    int _2486 = int(_2320) + int(_2440);
    int _2488 = ~_2092;
    int _2490 = _2488 + 1;
    int _2492 = ~_2204;
    int _2494 = _2492 + 1;
    int _2496 = _2482 * _2472;
    int _2498 = _2496 + _2234;
    int _2500 = int(_2340) + int(_2466);
    int _2502 = _2494 * _2486;
    int _2504 = _2502 + _2256;
    int _2506 = ~_2212;
    int _2508 = _2506 + 1;
    int _2510 = _2490 * _2484;
    int _2512 = _2510 + _2216;
    bool _2514 = uint(_2498) >= uint(_1860);
    float _2516 = _2470 + _2478;
    bool _2518 = uint(_2504) >= uint(_2204);
    int _2520 = _2508 * _2500;
    int _2522 = _2520 + _2280;
    bool _2524 = uint(_2512) >= uint(_2092);
    float _2526 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2528 = !_2514;
    int _2530 = _2528 ? 0 : (-1);
    bool _2532 = !_2524;
    int _2534 = _2532 ? 0 : (-1);
    int _2536 = ~_2472;
    int _2538 = _2536 + _2530;
    int _2540 = _2538 + 1;
    bool _2542 = uint(_2522) >= uint(_2212);
    float _2544 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2546 = _2234 ^ _1860;
    float _2548 = fma(_2404, _2404, 1.0);
    int _2550 = ~_2484;
    int _2552 = _2550 + _2534;
    int _2554 = _2552 + 1;
    int _2556 = _1860 * _2540;
    int _2558 = _2556 + _2234;
    bool _2560 = !_2542;
    int _2562 = _2560 ? 0 : (-1);
    bool _2564 = _1860 == 0;
    float _2566 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2568 = !_2518;
    int _2570 = _2568 ? 0 : (-1);
    int _2572 = _2092 * _2554;
    int _2574 = _2572 + _2216;
    uint _2576 = uint(int(uint(_2546) >> uint(31)));
    int _2578 = _2216 ^ _2092;
    int _2580 = ~_2562;
    int _2582 = _2500 + _2580;
    int _2584 = _2582 + 1;
    float _2586 = sqrt(_2516);
    int _2588 = ~_2570;
    int _2590 = _2486 + _2588;
    int _2592 = _2590 + 1;
    int _2594 = ~int(_2576);
    int _2596 = _2594 + 1;
    float _2598 = _2526 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2600 = !_2564;
    int _2602 = _2600 ? _2558 : (-1);
    uint _2604 = uint(int(uint(_2578) >> uint(31)));
    int _2606 = _2592 ^ _2596;
    float _2608 = float(_2602);
    int _2610 = ~int(_2604);
    int _2612 = _2610 + 1;
    bool _2614 = _2092 == 0;
    bool _2616 = _2092 == 0;
    float _2618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2620 = ~_2596;
    int _2622 = _2620 + _2606;
    int _2624 = _2622 + 1;
    float _2626 = fma(_2598, _2608, _425);
    bool _2628 = _1860 == 0;
    int _2630 = _2584 ^ _2612;
    bool _2632 = !_2614;
    int _2634 = _2632 ? _2574 : (-1);
    float _2636 = rsqrt(_2548);
    int _2638 = ~_2612;
    int _2640 = _2638 + _2630;
    int _2642 = _2640 + 1;
    float _2644 = _2544 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2646 = !_2628;
    int _2648 = _2646 ? _2624 : (-1);
    float _2650 = float(_2634);
    float _2652 = _2566 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2654 = float(_2648);
    float _2656 = _2132 + 0.5;
    out.m_86.x = _1141;
    out.m_86.y = _1143;
    out.m_86.z = _1145;
    float _2658 = fma(_2652, _2650, _689);
    bool _2660 = !_2616;
    int _2662 = _2660 ? _2642 : (-1);
    float _2664 = fma(_2598, _2656, _2626);
    float _2666 = -_675;
    float _2668 = fma(_2644, _2654, _2666);
    float _2670 = _2430 + 0.5;
    float _2672 = _2618 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2674 = float(_2662);
    float _2676 = _2424 + (-0.5);
    float _2678 = _2404 * _2636;
    float _2680 = fma(_2652, _2670, _2658);
    bool _2682 = _2586 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2684 = isnan(_2586);
    bool _2686 = _2682 || _2684;
    bool _2688 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2690 = _2686 || _2688;
    float _2692 = -_2644;
    float _2694 = fma(_2692, _2676, _2668);
    float _2696 = -_691;
    float _2698 = fma(_2672, _2674, _2696);
    float _2700 = -_2312;
    float _2702 = _2678 * _2700;
    float _2704 = -_2322;
    float _2706 = _2678 * _2704;
    float _2708 = -_2324;
    float _2710 = _2678 * _2708;
    float _2712 = _2122 + (-0.5);
    float _2714 = fma(_2636, _2240, _2702);
    float _2716 = fma(_2636, _2230, _2706);
    float _2718 = fma(_2636, _2242, _2710);
    float _2720 = -_2672;
    float _2722 = fma(_2720, _2712, _2698);
    float _2724 = -_685;
    float _2726 = _2724 + 1.0;
    float _2728 = -_1161;
    float _2730 = fma(_2132, _2728, _2664);
    float _2732 = -_1173;
    float _2734 = fma(_2430, _2732, _2680);
    float _2736 = _2312 + _2452;
    float _2738 = fma(_2424, _2726, _2694);
    float _2740 = fma(_2122, _1177, _2722);
    float _2742 = _2322 + _2454;
    float _2744 = _2324 + _2468;
    out.m_88.x = _2714;
    out.m_88.y = _2716;
    out.m_88.z = _2718;
    if (!_2690)
    {
        _2474 = 1.0;
    }
    float _2746 = _2474;
    out.m_90.x = _2730;
    out.m_90.y = _2738;
    out.m_90.z = _2734;
    out.m_90.w = _2740;
    out.m_92.x = _2736;
    out.m_92.y = _2742;
    out.m_92.z = _2744;
    bool _2748 = !_2690;
    float _2750 = _2746;
    if (!_2748)
    {
        bool _2752 = _2586 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2754 = isnan(_2586);
        bool _2756 = _2752 || _2754;
        bool _2758 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2760 = _2756 || _2758;
        if (!_2760)
        {
            float _2762 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2764 = _2586 + _2762;
            float _2766 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2768 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2766;
            float _2770 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2772 = _2770 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2774 = 1.0 / _2768;
            float _2776 = _2764 * _2774;
            float _2778 = fma(_2776, _2772, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2750 = _2778;
            _2780 = true;
        }
        else
        {
            bool _2782 = _2586 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2784 = isnan(_2586);
            bool _2786 = _2782 || _2784;
            bool _2788 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2790 = _2786 || _2788;
            if (!_2790)
            {
                float _2792 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2794 = _2586 + _2792;
                float _2796 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2798 = _2796 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2800 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2802 = _2800 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2804 = 1.0 / _2798;
                float _2806 = _2794 * _2804;
                float _2808 = fma(_2806, _2802, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2750 = _2808;
                _2780 = true;
            }
            else
            {
                _2750 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2780 = false;
    float _2810 = _2750;
    float _2812 = fma(_997, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2814 = fma(_1003, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2816 = floor(_2812);
    float _2818 = floor(_2814);
    float _2820 = -_2816;
    float _2822 = _2812 + _2820;
    float _2824 = -_2818;
    float _2826 = _2814 + _2824;
    float2 _8275 = float2(_2822, _2826);
    float _2828 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8275, float2(0.0), isnan(_8275)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8275, float2(0.0), isnan(_8275)), level(0.0)).x;
    float _2830 = _1053 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2832 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2834 = _2394 + _2832;
    float _2836 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2830);
    float _2838 = fma(_2834, _2810, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2840 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2836);
    float _2842 = _1053 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2844 = _2840 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2846 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2842);
    float _2848 = 1.0 / _2844;
    float _2850 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2846);
    float _2852 = _2850 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2854 = _2852 + _2844;
    float _2856 = _2854 * _2848;
    float _2858 = _2856 * 0.5;
    float _2860 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2862 = fma(_2858, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2860);
    float _2864 = 1.0 / _2862;
    float _2866 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2868 = _1053 + _2866;
    float _2870 = _2868 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2872 = fma(_997, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2870);
    float _2874 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2876 = _2864 * _2874;
    float _2878 = _2868 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2880 = fma(_1003, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2872);
    bool _2882 = _2876 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2884 = fma(_997, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2878);
    bool _2886 = _2876 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2888 = _2880 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _2890 = !_2882;
    int _2892 = _2890 ? 0 : 1;
    float _2894 = fma(_1003, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2884);
    float _2896 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2898 = _1131 + _2896;
    float _2900 = trunc(_2888);
    int _2902 = int(_2900);
    float _2904 = _2894 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2906 = fma(_2898, _2810, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    int _2908 = 2;
    float _2910 = _2898;
    int _2912 = as_type<int>(_2810);
    if (!_2882)
    {
        _2908 = 1;
    }
    int _2914 = _2908;
    int _2916 = _2914;
    if (!_2886)
    {
        _2916 = _2892;
    }
    int _2918 = _2916;
    float _2920 = trunc(_2904);
    int _2922 = int(_2920);
    int _2924 = _2918 << 6;
    bool _2926 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2928 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2930 = _2926 || _2928;
    bool _2932 = isnan(0.5);
    bool _2934 = _2930 || _2932;
    int _2936 = _2924 + 48;
    uint _2938 = uint(int(uint(_2936) >> uint(2)));
    uint _2940 = uint(int(uint(int(_2938)) >> uint(2)));
    int _2942 = int(_2938) & 3;
    float _2944 = (*spvDescriptorSet0.vp_c15)._m0[int(_2940)][_2942];
    int _2946 = int(_2938) + 1;
    uint _2948 = uint(int(uint(_2946) >> uint(2)));
    int _2950 = _2946 & 3;
    float _2952 = (*spvDescriptorSet0.vp_c15)._m0[int(_2948)][_2950];
    int _2954 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2956 = _2902 + _2954;
    int _2958 = _2956 + 1;
    bool _2960 = _2958 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2962 = _2924 + 56;
    uint _2964 = uint(int(uint(_2962) >> uint(2)));
    uint _2966 = uint(int(uint(int(_2964)) >> uint(2)));
    int _2968 = int(_2964) & 3;
    float _2970 = (*spvDescriptorSet0.vp_c15)._m0[int(_2966)][_2968];
    int _2972 = int(_2964) + 1;
    uint _2974 = uint(int(uint(_2972) >> uint(2)));
    int _2976 = _2972 & 3;
    float _2978 = (*spvDescriptorSet0.vp_c15)._m0[int(_2974)][_2976];
    int _2980 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2982 = _2922 + _2980;
    int _2984 = _2982 + 1;
    float _2986 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2988 = _1127 + _2986;
    float _2990 = _2988;
    int _2992 = _2958;
    if (_2934)
    {
        _2910 = _2906;
    }
    float _2994 = _2910;
    int _2996 = _2958 | _2984;
    float _2998 = fma(_2988, _2810, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    int _3000 = _2924 + 64;
    uint _3002 = uint(int(uint(_3000) >> uint(2)));
    uint _3004 = uint(int(uint(int(_3002)) >> uint(2)));
    int _3006 = int(_3002) & 3;
    float _3008 = (*spvDescriptorSet0.vp_c15)._m0[int(_3004)][_3006];
    int _3010 = int(_3002) + 1;
    uint _3012 = uint(int(uint(_3010) >> uint(2)));
    int _3014 = _3010 & 3;
    float _3016 = (*spvDescriptorSet0.vp_c15)._m0[int(_3012)][_3014];
    bool _3018 = _2996 < 0;
    bool _3020 = _3018 || _2960;
    float _3022 = as_type<float>(_2996);
    float _3024 = _2994;
    if (_2934)
    {
        _2990 = _2998;
    }
    float _3026 = _2990;
    bool _3028 = _2984 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3030 = _3028 || _3020;
    float _3032 = _3026;
    if (_2934)
    {
        _3022 = _2838;
    }
    float _3034 = _3022;
    int _3036 = _2924 + 72;
    uint _3038 = uint(int(uint(_3036) >> uint(2)));
    uint _3040 = uint(int(uint(int(_3038)) >> uint(2)));
    int _3042 = int(_3038) & 3;
    float _3044 = (*spvDescriptorSet0.vp_c15)._m0[int(_3040)][_3042];
    int _3046 = int(_3038) + 1;
    uint _3048 = uint(int(uint(_3046) >> uint(2)));
    int _3050 = _3046 & 3;
    float _3052 = (*spvDescriptorSet0.vp_c15)._m0[int(_3048)][_3050];
    int _3054 = _2924 + 96;
    uint _3056 = uint(int(uint(_3054) >> uint(2)));
    uint _3058 = uint(int(uint(int(_3056)) >> uint(2)));
    int _3060 = int(_3056) & 3;
    float _3062 = (*spvDescriptorSet0.vp_c15)._m0[int(_3058)][_3060];
    int _3064 = int(_3056) + 1;
    uint _3066 = uint(int(uint(_3064) >> uint(2)));
    int _3068 = _3064 & 3;
    float _3070 = (*spvDescriptorSet0.vp_c15)._m0[int(_3066)][_3068];
    int _3072 = _2924 + 104;
    uint _3074 = uint(int(uint(_3072) >> uint(2)));
    uint _3076 = uint(int(uint(int(_3074)) >> uint(2)));
    int _3078 = int(_3074) & 3;
    float _3080 = (*spvDescriptorSet0.vp_c15)._m0[int(_3076)][_3078];
    int _3082 = int(_3074) + 1;
    uint _3084 = uint(int(uint(_3082) >> uint(2)));
    int _3086 = _3082 & 3;
    float _3088 = (*spvDescriptorSet0.vp_c15)._m0[int(_3084)][_3086];
    float _3090 = _3034;
    if (!_2934)
    {
        float _3092 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3094 = _1053 + _3092;
        float _3096 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3098 = _997 + _3096;
        float _3100 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3102 = _3094 * _3094;
        float _3104 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3106 = _1003 + _3104;
        float _3108 = fma(_3098, _3098, _3102);
        float _3110 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3112 = fma(_3106, _3106, _3108);
        float _3114 = sqrt(_3112);
        float _3116 = _3100 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3118 = -_1003;
        float _3120 = _3118 + _2906;
        float _3122 = precise::min(_3114, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3124 = _3122 * _3110;
        float _3126 = -_1053;
        float _3128 = _3126 + _2838;
        float _3130 = _3116 * _3124;
        float _3132 = -_997;
        float _3134 = _3132 + _2998;
        float _3136 = fma(_3128, _3130, _1053);
        float _3138 = fma(_3134, _3130, _997);
        float _3140 = fma(_3120, _3130, _1003);
        _3090 = _3136;
        _3032 = _3138;
        _2912 = as_type<int>(_3130);
        _3024 = _3140;
    }
    float _3142 = _3090;
    float _3144 = _3032;
    int _3146 = _2912;
    float _3148 = _3024;
    float _3150 = _2868 * _3070;
    float _3152 = _3142 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _3154 = _3146;
    if (!_3030)
    {
        int _3156 = _2984 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3158 = _3156 + _2958;
        _3154 = _3158;
    }
    int _3160 = _3154;
    float _3162 = _2868 * _3016;
    float _3164 = fma(_997, _3062, _3150);
    float _3166 = fma(_3144, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3152);
    float _3168 = _2868 * _2952;
    if (!_3030)
    {
        int _3170 = _3160 << 2;
        _2992 = _3170;
    }
    int _3172 = _2992;
    float _3174 = fma(_1003, _3080, _3164);
    float _3176 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3166);
    float _3178 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    int _3180 = _3172;
    int _3182 = as_type<int>(_3176);
    if (!_3030)
    {
        int _3184 = 12 & _3172;
        _3180 = _3184;
    }
    int _3186 = _3180;
    float _3188 = _3174 + _3088;
    float _3190 = _3176 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (!_3030)
    {
        uint _3192 = uint(int(uint(_3160) >> uint(2)));
        _3182 = int(_3192);
    }
    int _3194 = _3182;
    float _3196 = fma(_997, _2944, _3168);
    float _3198 = fma(_997, _3008, _3162);
    float _3200 = _3190 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    int _3202 = _2924 + 80;
    uint _3204 = uint(int(uint(_3202) >> uint(2)));
    uint _3206 = uint(int(uint(int(_3204)) >> uint(2)));
    int _3208 = int(_3204) & 3;
    float _3210 = (*spvDescriptorSet0.vp_c15)._m0[int(_3206)][_3208];
    int _3212 = int(_3204) + 1;
    uint _3214 = uint(int(uint(_3212) >> uint(2)));
    int _3216 = _3212 & 3;
    float _3218 = (*spvDescriptorSet0.vp_c15)._m0[int(_3214)][_3216];
    float _3220 = 1.0 / _3188;
    float _3222 = fma(_1003, _2970, _3196);
    float _3224 = -_3200;
    float _3226 = fma(_3224, _3178, 1.0);
    float _3228 = _3200;
    if (!_3030)
    {
        int _3230 = _3194 << 4;
        int _3232 = _3230 + _3186;
        _3228 = as_type<float>(_3232);
    }
    float _3234 = _3228;
    float _3236 = fma(_1003, _3044, _3198);
    float _3238 = _3142 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3240 = _3222 + _2978;
    int _3242 = _2924 + 88;
    uint _3244 = uint(int(uint(_3242) >> uint(2)));
    uint _3246 = uint(int(uint(int(_3244)) >> uint(2)));
    int _3248 = int(_3244) & 3;
    float _3250 = (*spvDescriptorSet0.vp_c15)._m0[int(_3246)][_3248];
    int _3252 = int(_3244) + 1;
    uint _3254 = uint(int(uint(_3252) >> uint(2)));
    int _3256 = _3252 & 3;
    float _3258 = (*spvDescriptorSet0.vp_c15)._m0[int(_3254)][_3256];
    float _3260 = _3236 + _3052;
    float _3262 = fma(_3144, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3238);
    float _3264 = _3142 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3266 = _3142 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3268 = as_type<float>(_2642);
    if (!_3030)
    {
        float _3270 = floor(_2904);
        _3268 = _3270;
    }
    float _3272 = _3268;
    float _3274 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3262);
    float _3276 = fma(_3144, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3264);
    float _3278 = _3234;
    if (!_3030)
    {
        int _3280 = as_type<int>(_3234) + 400;
        uint _3282 = uint(int(uint(_3280) >> uint(2)));
        uint _3284 = uint(int(uint(int(_3282)) >> uint(2)));
        int _3286 = int(_3282) & 3;
        float _3288 = (*spvDescriptorSet0.vp_c15)._m0[int(_3284)][_3286];
        _3278 = _3288;
    }
    float _3290 = _3278;
    float _3292 = _3240 * _3220;
    float _3294 = _3260 * _3220;
    float _3296 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3276);
    float _3298 = _3274 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3300 = fma(_3144, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3266);
    bool _3302 = _3292 >= 0.0;
    float _3304 = _3296 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3306 = _3298 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3308 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3300);
    bool _3310 = _3292 <= 1.0;
    bool _3312 = _3310 && _3302;
    float _3314 = log2(_3226);
    float _3316 = fma(_3304, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3306);
    float _3318 = _3308 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _3320 = _3294 >= 0.0;
    bool _3322 = _3320 && _3312;
    float _3324 = _3298 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3326 = fma(_3190, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3316);
    float _3328 = _3272;
    float _3330 = _3324;
    float _3332 = _3300;
    float _3334 = _3220;
    if (!_3030)
    {
        float _3336 = -_3272;
        float _3338 = _2904 + _3336;
        _3328 = _3338;
    }
    float _3340 = _3328;
    bool _3342 = _3294 <= 1.0;
    bool _3344 = _3342 && _3322;
    float _3346 = _2906;
    if (!_3030)
    {
        float _3348 = floor(_2888);
        _3346 = _3348;
    }
    float _3350 = _3346;
    float _3352 = fma(_3318, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3326);
    float _3354 = _3298 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3356 = fma(_3304, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3324);
    float _3358 = fma(_3304, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3354);
    float _3360 = fma(_3190, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3356);
    float _3362 = 1.0 / _3352;
    float _3364 = _3314 * 0.693147182464599609375;
    float _3366 = fma(_3190, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3358);
    float _3368 = fma(_3318, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3360);
    if (_3344)
    {
        float _3370 = float(_2918);
        _3330 = _3370;
    }
    float _3372 = _3330;
    float _3374 = _2868 * _3218;
    float _3376 = fma(_3318, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3366);
    float _3378 = _3364 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    if (!_3030)
    {
        float _3380 = -_3350;
        float _3382 = _2888 + _3380;
        _3332 = _3382;
    }
    float _3384 = _3332;
    float _3386 = fma(_997, _3210, _3374);
    float _3388 = _3372;
    if (_3344)
    {
        float _3390 = rint(_3372);
        float _3392 = precise::max(_3390, 0.0);
        uint _3394 = uint(_3392);
        uint _3396 = clamp(_3394, 0u, 65535u);
        _3388 = as_type<float>(_3396);
    }
    float _3398 = _3388;
    float _3400 = fma(_1003, _3250, _3386);
    float _3402 = _3376 * _3362;
    float _3404 = _3400 + _3258;
    float _3406 = _3368 * _3362;
    float _3408 = fma(_3402, -0.5, 0.5);
    float _3410 = _3290;
    if (!_3030)
    {
        float _3412 = rint(_3290);
        float _3414 = precise::max(_3412, 0.0);
        uint _3416 = uint(_3414);
        uint _3418 = clamp(_3416, 0u, 65535u);
        _3410 = as_type<float>(_3418);
    }
    float _3420 = _3410;
    float _3422 = _3404 * _3220;
    float _3424 = fma(_3406, 0.5, 0.5);
    float _3426 = _3294;
    float _3428 = _3424;
    float _3430 = _3422;
    if (_3344)
    {
        float3 _9303 = float3(_3292, _3294, float(as_type<int>(_3398)));
        float3 _9307 = select(_9303, float3(0.0), isnan(_9303));
        float _3432 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9307.xy, uint(rint(_9307.z)), _3422, level(0.0));
        _3426 = _3432;
    }
    float _3434 = _3426;
    float3 _9317 = float3(_3424, _3408, _3378);
    float _3436 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9317, float3(0.0), isnan(_9317)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9317, float3(0.0), isnan(_9317)), level(0.0)).x;
    float3 _9326 = float3(_3424, _3408, _3378);
    float4 _3439 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9326, float3(0.0), isnan(_9326)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9326, float3(0.0), isnan(_9326)), level(0.0)).xyzw;
    float _3441 = _3439.x;
    float _3443 = _3439.y;
    float _3445 = _3439.z;
    float _3447 = _3439.w;
    float _3449 = _3384;
    if (!_3030)
    {
        float3 _9349 = float3(_3384, _3340, float(as_type<int>(_3420)));
        float3 _9351 = select(_9349, float3(0.0), isnan(_9349));
        float _3451 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9351.xy, uint(rint(_9351.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9351.xy, uint(rint(_9351.z)), level(0.0)).x;
        _3449 = _3451;
    }
    float _3453 = _3449;
    if (_3030)
    {
        _3334 = 1.0;
    }
    float _3455 = _3334;
    float _3457 = _3455;
    float _3459 = _3453;
    if (!_3030)
    {
        int _3461 = _3160 << 4;
        int _3463 = _3461 + 2048;
        uint _3465 = uint(int(uint(_3463) >> uint(2)));
        uint _3467 = uint(int(uint(int(_3465)) >> uint(2)));
        int _3469 = int(_3465) & 3;
        float _3471 = (*spvDescriptorSet0.vp_c15)._m0[int(_3467)][_3469];
        int _3473 = int(_3465) + 1;
        uint _3475 = uint(int(uint(_3473) >> uint(2)));
        int _3477 = _3473 & 3;
        float _3479 = (*spvDescriptorSet0.vp_c15)._m0[int(_3475)][_3477];
        int _3481 = _3463 + 8;
        uint _3483 = uint(int(uint(_3481) >> uint(2)));
        uint _3485 = uint(int(uint(int(_3483)) >> uint(2)));
        int _3487 = int(_3483) & 3;
        float _3489 = (*spvDescriptorSet0.vp_c15)._m0[int(_3485)][_3487];
        int _3491 = int(_3483) + 1;
        uint _3493 = uint(int(uint(_3491) >> uint(2)));
        int _3495 = _3491 & 3;
        float _3497 = (*spvDescriptorSet0.vp_c15)._m0[int(_3493)][_3495];
        float _3499 = _2868 * _3479;
        float _3501 = fma(_997, _3471, _3499);
        float _3503 = fma(_1003, _3489, _3501);
        float _3505 = _3503 + _3497;
        float _3507 = precise::clamp(_3505, 0.0, 1.0);
        float _3509 = -_3507;
        float _3511 = _3509 + _3453;
        float _3513 = fma(_3511, 500.0, 1.5);
        float _3515 = exp2(_3513);
        float _3517 = 0.0 + _3515;
        float _3519 = precise::clamp(_3517, 0.0, 1.0);
        _3428 = _3489;
        _3457 = _3519;
    }
    float _3521 = _3428;
    float _3523 = _3457;
    float _3525 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3527 = _3142 + _3525;
    float _3529 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3531 = _3144 + _3529;
    float _3533 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3535 = _3148 + _3533;
    float _3537 = _3527 * _3527;
    float _3539 = fma(_3531, _3531, _3537);
    float _3541 = fma(_3535, _3535, _3539);
    float _3543 = rsqrt(_3541);
    float _3545 = sqrt(_3541);
    float _3547 = _3543 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3549 = _3531 * _3547;
    float _3551 = _3535 * _3547;
    float _3553 = _3549 * _3549;
    float _3555 = _3551 * _3551;
    float _3557 = _3553 + _3555;
    float _3559 = sqrt(_3557);
    bool _3561 = _3559 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3563 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3565 = _3559 + _3563;
    float _3567 = _3535;
    float _3569 = _3565;
    float _3571 = _3521;
    float _3573 = _3527;
    if (_3561)
    {
        float _3575 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3567 = _3575;
    }
    float _3577 = _3567;
    if (_3561)
    {
        float _3579 = rsqrt(_3557);
        _3459 = _3579;
    }
    float _3581 = _3459;
    float _3583 = _3581;
    if (_3561)
    {
        float _3585 = _3565 * _3577;
        _3569 = _3585;
    }
    float _3587 = _3569;
    if (_3561)
    {
        float _3589 = _3587 * 0.15915493667125701904296875;
        _3571 = _3589;
    }
    float _3591 = _3571;
    float _3593 = _3543;
    if (_3561)
    {
        float _3595 = _3591 * 6.283185482025146484375;
        float _3597 = sin(_3595);
        _3593 = _3597;
    }
    float _3599 = _3593;
    float _3601 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3603 = precise::max(0.0, _3601);
    float _3605 = _3420;
    float _3607 = _3603;
    float _3609 = _3601;
    if (_3561)
    {
        float _3611 = _3591 * 6.283185482025146484375;
        float _3613 = cos(_3611);
        _3605 = _3613;
    }
    float _3615 = _3605;
    float _3617 = -_3547;
    float _3619 = -_3603;
    float _3621 = fma(_3527, _3617, _3619);
    if (!_3561)
    {
        _3607 = _3549;
    }
    float _3623 = _3607;
    float _3625 = _3623;
    if (_3561)
    {
        float _3627 = _3621 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3609 = _3627;
    }
    float _3629 = _3609;
    float _3631 = _3629;
    float _3633 = _3599;
    if (_3561)
    {
        float _3635 = fma(_3599, _3629, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3631 = _3635;
    }
    float _3637 = _3631;
    float _3639 = _3637;
    if (!_3561)
    {
        _3633 = _3553;
    }
    float _3641 = _3633;
    float _3643 = _3641;
    float _3645 = _3615;
    if (_3561)
    {
        float _3647 = _3615 + (-1.0);
        _3573 = _3647;
    }
    float _3649 = _3573;
    float _3651 = _3649;
    if (_3561)
    {
        float _3653 = _3581 * _3637;
        _1073 = _3653;
    }
    float _3655 = _1073;
    if (!_3561)
    {
        _3639 = _3621;
    }
    float _3657 = _3639;
    float _3659 = _3657;
    if (_3561)
    {
        float _3661 = _3649 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3583 = _3661;
    }
    float _3663 = _3583;
    if (_3561)
    {
        float _3665 = _3549 * _3655;
        _3625 = _3665;
    }
    float _3667 = _3625;
    if (!_3561)
    {
        _3651 = _3551;
    }
    float _3669 = _3651;
    float _3671 = _3669;
    if (_3561)
    {
        float _3673 = _3551 * _3655;
        _3671 = _3673;
    }
    float _3675 = _3671;
    if (_3561)
    {
        float _3677 = fma(_3621, _3615, _3663);
        _3659 = _3677;
    }
    float _3679 = _3659;
    if (_3561)
    {
        float _3681 = _3667 * _3667;
        _3643 = _3681;
    }
    float _3683 = _3643;
    if (!_3561)
    {
        _3645 = _3555;
    }
    float _3685 = _3645;
    float _3687 = _3685;
    if (_3561)
    {
        float _3689 = _3675 * _3675;
        _3687 = _3689;
    }
    float _3691 = _3687;
    float _3693 = fma(_3679, _3679, _3683);
    float _3695 = _3693 + _3691;
    float _3697 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3699 = fma(_3545, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3697);
    float _3701 = precise::clamp(_3699, 0.0, 1.0);
    float _3703 = -_3701;
    float _3705 = _3703 + 1.0;
    float _3707 = rsqrt(_3695);
    float _3709 = _3707 * _3679;
    float _3711 = _3707 * _3667;
    float _3713 = abs(_3705);
    float _3715 = log2(_3713);
    float _3717 = _3707 * _3675;
    float _3719 = _3711 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3721 = -_3719;
    float _3723 = fma(_3709, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3721);
    float _3725 = -_3717;
    float _3727 = fma(_3725, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3723);
    float _3729 = fma(_3727, -0.5, 0.5);
    float _3731 = _3715 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3733 = fma(_3727, 0.5, 0.5);
    float _3735 = exp2(_3731);
    float _3737 = fma(_3733, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3739 = fma(_3733, _3737, -0.212114393711090087890625);
    float _3741 = _3709 + 1.0;
    float _3743 = sqrt(_3729);
    float _3745 = fma(_3733, _3739, 1.570728778839111328125);
    float _3747 = -_3709;
    float _3749 = fma(_3735, _3741, _3747);
    float _3751 = fma(_3749, 0.5, 0.5);
    float _3753 = _3743 * 0.636619746685028076171875;
    float _3755 = -_3745;
    float _3757 = fma(_3753, _3755, 1.0);
    float2 _9824 = float2(_3757, _3751);
    float3 _3759 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9824, float2(0.0), isnan(_9824)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9824, float2(0.0), isnan(_9824)), level(0.0)).xyz;
    float _3761 = _3759.x;
    float _3763 = _3759.y;
    float _3765 = _3759.z;
    float _3767 = abs(_2876);
    float _3769 = log2(_3767);
    float _3771 = _3298 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3773 = -_2828;
    float _3775 = _3773 + 1.0;
    out.m_94.x = _3144;
    out.m_94.y = _3142;
    out.m_94.z = _3148;
    float _3777 = fma(_3304, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3771);
    bool _3779 = _2876 <= 8000.0;
    bool _3781 = isnan(_2876);
    bool _3783 = _3779 || _3781;
    bool _3785 = isnan(8000.0);
    bool _3787 = _3783 || _3785;
    float _3789 = float(_3787);
    float _3791 = _3715 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3793 = fma(_3190, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3777);
    float _3795 = fma(_3318, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3793);
    float _3797 = _3769 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3799 = exp2(_3791);
    float _3801 = _3795 + _3352;
    float _3803 = _3801 * 0.5;
    float _3805 = exp2(_3797);
    float _3807 = -_3799;
    float _3809 = _3807 + 1.0;
    float _3811 = _3809 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3813 = fma(_3805, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3815 = precise::clamp(_3813, 0.0, 1.0);
    float _3817 = fma(_3815, -2.0, 3.0);
    float _3819 = _3815 * _3815;
    float _3821 = _3819 * _3817;
    float _3823 = -_3821;
    float _3825 = _3823 + 1.0;
    float _3827 = fma(_3825, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3821);
    float _3829 = _3789 * _3827;
    float _3831 = _3789;
    float _3833 = _3368;
    float _3835 = _3775;
    if (!_3344)
    {
        _3831 = 1.0;
    }
    float _3837 = _3831;
    out.m_96.z = _3803;
    out.m_96.w = _3352;
    float _3839 = _3837;
    if (_3344)
    {
        bool _3841 = _3434 >= _3422;
        bool _3843 = isnan(_3434);
        bool _3845 = _3841 || _3843;
        bool _3847 = isnan(_3422);
        bool _3849 = _3845 || _3847;
        float _3851 = float(_3849);
        _3839 = _3851;
    }
    float _3853 = _3839;
    float _3855 = _3829 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3857 = _3811 * _3436;
    float _3859 = -_3811;
    float _3861 = _3859 + 1.0;
    bool _3863 = _3545 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3865 = isnan(_3545);
    bool _3867 = _3863 || _3865;
    bool _3869 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3871 = _3867 || _3869;
    float _3873 = _3775 * _3855;
    float _3875 = precise::clamp(_3873, 0.0, 1.0);
    float _3877 = _3853 * _3523;
    float _3879 = _3447 * _3857;
    float _3881 = _3447 * _3861;
    float _3883 = -_3875;
    float _3885 = fma(_3883, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.gl_Position.x = _3368;
    out.gl_Position.y = _3376;
    out.gl_Position.z = _3795;
    out.gl_Position.w = _3352;
    float _3887 = -_3877;
    float _3889 = fma(_3887, _3885, 1.0);
    float _3891 = precise::clamp(_3889, 0.0, 1.0);
    float _3893 = _3891 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3895 = _3885;
    float _3897 = _3891;
    float _3899 = _3857;
    if (!_3871)
    {
        _3895 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3901 = _3895;
    float _3903 = _3901;
    float _3905 = _3901;
    if (!_3871)
    {
        _3897 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3907 = _3897;
    out.m_98.x = _3893;
    float _3909 = _3907;
    float _3911 = _3907;
    if (!_3871)
    {
        _3430 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3913 = _3430;
    float _3915 = _3913;
    float _3917 = _3913;
    if (!_3871)
    {
        _3833 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3919 = _3833;
    float _3921 = _3919;
    float _3923 = _3919;
    if (!_3871)
    {
        _3835 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3925 = _3835;
    float _3927 = _3765 * _3857;
    float _3929 = fma(_3761, _3879, _3441);
    float _3931 = fma(_3763, _3879, _3443);
    float _3933 = _3925;
    float _3935 = _3925;
    if (!_3871)
    {
        _3899 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3937 = _3899;
    float _3939 = fma(_3447, _3927, _3445);
    out.m_100.x = _3929;
    out.m_100.y = _3931;
    out.m_100.z = _3939;
    out.m_100.w = _3881;
    bool _3941 = !_3871;
    float _3943 = _3937;
    float _3945 = _3937;
    if (!_3941)
    {
        bool _3947 = _3545 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3949 = isnan(_3545);
        bool _3951 = _3947 || _3949;
        bool _3953 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3955 = _3951 || _3953;
        if (!_3955)
        {
            float _3957 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3959 = _3545 + _3957;
            float _3961 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3963 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3961;
            float _3965 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3967 = _3965 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3969 = 1.0 / _3963;
            float _3971 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3973 = _3971 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3975 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3977 = _3975 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3979 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3981 = _3979 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3983 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3985 = _3983 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3987 = _3959 * _3969;
            float _3989 = precise::clamp(_3987, 0.0, 1.0);
            float _3991 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3993 = _3991 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3995 = fma(_3989, _3967, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3997 = fma(_3989, _3993, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3999 = fma(_3989, _3973, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4001 = fma(_3989, _3977, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4003 = fma(_3989, _3981, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4005 = fma(_3989, _3985, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3905 = _3999;
            _3945 = _4003;
            _3923 = _3995;
            _3917 = _4001;
            _3911 = _3997;
            _3935 = _4005;
            _4007 = true;
        }
        else
        {
            bool _4009 = _3545 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4011 = isnan(_3545);
            bool _4013 = _4009 || _4011;
            bool _4015 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4017 = _4013 || _4015;
            if (!_4017)
            {
                _3921 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4019 = _3921;
            _3923 = _4019;
            if (!_4017)
            {
                _3903 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4021 = _3903;
            _3905 = _4021;
            if (!_4017)
            {
                _3909 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4023 = _3909;
            _3911 = _4023;
            if (!_4017)
            {
                _3915 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4025 = _3915;
            _3917 = _4025;
            if (!_4017)
            {
                _3943 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4027 = _3943;
            _3945 = _4027;
            if (!_4017)
            {
                _3933 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4029 = _3933;
            bool _4031 = !_4017;
            _3935 = _4029;
            if (!_4031)
            {
                bool _4033 = _3545 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4035 = isnan(_3545);
                bool _4037 = _4033 || _4035;
                bool _4039 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4041 = _4037 || _4039;
                if (!_4041)
                {
                    float _4043 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4045 = _3545 + _4043;
                    float _4047 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4049 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4047;
                    float _4051 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4053 = _4051 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4055 = 1.0 / _4049;
                    float _4057 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4059 = _4057 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4061 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4063 = _4061 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4065 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4067 = _4065 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4069 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4071 = _4069 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4073 = _4045 * _4055;
                    float _4075 = precise::clamp(_4073, 0.0, 1.0);
                    float _4077 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4079 = _4077 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4081 = fma(_4075, _4053, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4083 = fma(_4075, _4079, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4085 = fma(_4075, _4059, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4087 = fma(_4075, _4063, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4089 = fma(_4075, _4067, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4091 = fma(_4075, _4071, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3905 = _4085;
                    _3945 = _4089;
                    _3923 = _4081;
                    _3917 = _4087;
                    _3911 = _4083;
                    _3935 = _4091;
                    _4007 = true;
                }
                else
                {
                    _3905 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3945 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3923 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3917 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3911 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3935 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4007 = false;
    float _4093 = _3905;
    float _4095 = _3945;
    float _4097 = _3923;
    float _4099 = _3917;
    float _4101 = _3911;
    float _4103 = _3935;
    float _4105 = fma(_2742, -0.5, 0.5);
    float _4107 = precise::clamp(_4105, 0.0, 1.0);
    float _4109 = -_4093;
    float _4111 = _4109 + _4095;
    float _4113 = -_4097;
    float _4115 = _4113 + _4099;
    float _4117 = -_4101;
    float _4119 = _4117 + _4103;
    bool _4121 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4123 = fma(_4107, _4111, _4093);
    float _4125 = fma(_4107, _4115, _4097);
    float _4127 = fma(_4107, _4119, _4101);
    float _4129 = _4123 * 0.586610972881317138671875;
    out.m_102.x = 0.0;
    float _4131 = fma(_4125, 0.298911988735198974609375, _4129);
    float _4133 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4135 = fma(_4127, 0.114477999508380889892578125, _4131);
    out.m_63.x = _4133;
    float _4137 = -_4135;
    float _4139 = _4125 + _4137;
    float _4141 = -_4135;
    float _4143 = _4123 + _4141;
    float _4145 = -_4135;
    float _4147 = _4127 + _4145;
    float _4149 = fma(_4139, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4135);
    float _4151 = fma(_4143, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4135);
    float _4153 = fma(_4147, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4135);
    out.m_104.x = _4149;
    out.m_104.y = _4151;
    out.m_104.z = _4153;
    if (!_4121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4155 = -_3142;
    float _4157 = _4155 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4159 = -_3144;
    float _4161 = _4159 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4163 = -_3148;
    float _4165 = _4163 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4167 = _4157 * _4157;
    float _4169 = fma(_4161, _4161, _4167);
    float _4171 = fma(_4165, _4165, _4169);
    float _4173 = sqrt(_4171);
    float _4175 = rsqrt(_4171);
    float _4177 = -_4173;
    float _4179 = _4177 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4181 = _4179 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4183 = precise::clamp(_4181, 0.0, 1.0);
    float _4185 = _4161 * _4175;
    float _4187 = _4157 * _4175;
    float _4189 = abs(_4183);
    float _4191 = log2(_4189);
    float _4193 = _4165 * _4175;
    float _4195 = _4185 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4197 = _2742 * _4187;
    float _4199 = -_4187;
    float _4201 = -_4195;
    float _4203 = fma(_4199, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4201);
    float _4205 = fma(_2736, _4185, _4197);
    float _4207 = -_4193;
    float _4209 = fma(_4207, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4203);
    float _4211 = fma(_2744, _4193, _4205);
    float _4213 = precise::clamp(_4211, 0.0, 1.0);
    float _4215 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4217 = _4209 + _4215;
    float _4219 = _4191 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4221 = _4217 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4223 = precise::clamp(_4221, 0.0, 1.0);
    float _4225 = exp2(_4219);
    float _4227 = _4225 * _4223;
    float _4229 = _4213 * _4227;
    float _4231 = _4229 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4233 = _4229 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4235 = _4229 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_102.x = _4231;
    out.m_102.y = _4233;
    out.m_102.z = _4235;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

