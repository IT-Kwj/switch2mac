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
    float4 m_76 [[user(locn0)]];
    float4 m_78 [[user(locn1)]];
    float4 m_86 [[user(locn2)]];
    float4 m_92 [[user(locn3)]];
    float4 m_100 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_84 [[user(locn6)]];
    float4 m_88 [[user(locn7)]];
    float4 m_90 [[user(locn8)]];
    float4 m_80 [[user(locn9)]];
    float4 m_98 [[user(locn10)]];
    float4 m_82 [[user(locn11)]];
    float4 m_94 [[user(locn12)]];
    float4 m_96 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_72 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_65 [[attribute(3)]];
    float4 m_70 [[attribute(4)]];
    float4 m_74 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4037 = false;
    bool _2818 = false;
    bool _215 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _114 = in.m_60.w;
    float _116 = trunc(_114);
    int _119 = int(_116);
    bool _123 = _119 >= 1;
    float _125 = 0.0;
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    float _129 = _127;
    if (!_123)
    {
        out.m_63.x = 0.0;
    }
    int _131 = 0;
    if (!_123)
    {
        float _133 = _127 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    int _137 = _135;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4322 = as_type<float>(_135);
        out.gl_Position.z = _4322;
    }
    if (!_123)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _139 = in.m_65.w;
    bool _141 = _139 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_139);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = -_139;
    float _153 = _151 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _155 = _153;
    if (_149)
    {
        float _157 = float(_119);
        _129 = _157;
    }
    float _159 = _129;
    bool _161 = _153 >= _159;
    bool _163 = !_149;
    bool _165 = _161 || _163;
    float _167 = _159;
    if (_165)
    {
        _167 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _167;
    if (_165)
    {
        out.m_63.x = 0.0;
    }
    if (_165)
    {
        float _171 = _169 * 5.0;
        _137 = as_type<int>(_171);
    }
    int _173 = _137;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4392 = as_type<float>(_173);
        out.gl_Position.z = _4392;
    }
    if (_165)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _175 = as_type<float>(int(gl_VertexIndex));
    bool _177 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _179 = as_type<int>(_175) & 1;
    bool _181 = _179 != 0;
    int _183 = as_type<int>(_175) & 2;
    bool _185 = _183 != 0;
    bool _187 = !_181;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_185;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_177;
    float _213;
    if (!_195)
    {
        float _197 = in.m_70.x;
        float _199 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _201 = _197 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _203 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[12].x, _153);
        float _205 = _203 * _199;
        float _207 = floor(_205);
        float _209 = -_207;
        float _211 = _205 + _209;
        _213 = _211;
        _215 = true;
    }
    else
    {
        float _217 = float(_119);
        float _219 = 1.0 / _217;
        float _221 = _153 * _219;
        _213 = _221;
    }
    _215 = false;
    float _223 = _213;
    float _225 = in.m_70.x;
    float _227 = in.m_70.y;
    float _229 = in.m_70.z;
    float _231 = in.m_70.w;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _235 = _223 + _233;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _239 = _223 + _237;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _241;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _247 = _245 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _251 = _223 + _249;
    float _253 = 1.0 / _243;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _255;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _261 = _259 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _263 = 1.0 / _247;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _269 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _271 = _269 != 0;
    float _273 = _225 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _275 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _277 = _275 != 0;
    int _279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _281 = _279 != 0;
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _285 = _283 != 0;
    float _287 = 1.0 / _257;
    float _289 = _227 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _291 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _293 = isnan(_223);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    bool _303 = !_281;
    int _305 = _303 ? 0 : 1;
    float _307 = fma(_289, -2.0, _267);
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _311 = _223 + _309;
    bool _313 = !_277;
    int _315 = _313 ? 0 : 1;
    float _317 = 1.0 / _261;
    float _319 = -_265;
    float _321 = fma(_273, 2.0, _319);
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _323;
    float _327 = _311 * _263;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _331 = _223 + _329;
    float _333 = _229 + _225;
    float _335 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[76].y, _307);
    float _337 = 1.0 / _325;
    float _339 = _225 * 2.0;
    float _341 = _331 * _253;
    float _343 = _333 + (-1.0);
    float _345 = _225 + _227;
    float _347 = _239 * _287;
    float _349 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _351 = floor(_339);
    float _353 = _227 * 2.0;
    float _355 = _345 + (-1.0);
    float _357 = _229 * 2.0;
    float _359 = _235 * _317;
    float _361 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _363 = _229 + _227;
    float _365 = floor(_353);
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _367;
    float _371 = _363 + (-1.0);
    bool _373 = !_285;
    int _375 = _373 ? 0 : 1;
    float _377 = _251 * _337;
    float _379 = fma(_369, _341, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _381 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _383 = floor(_357);
    bool _385 = _351 > 0.0;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _387;
    bool _391 = _351 >= 0.0;
    bool _393 = isnan(_351);
    bool _395 = _391 || _393;
    bool _397 = isnan(0.0);
    bool _399 = _395 || _397;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _405 = fma(_389, _341, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _407 = _399 ? 0 : 1;
    float _409 = -_301;
    float _411 = _409 + 1.0;
    bool _413 = _365 > 0.0;
    float _415 = fma(_403, _327, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _417 = _365 >= 0.0;
    bool _419 = isnan(_365);
    bool _421 = _417 || _419;
    bool _423 = isnan(0.0);
    bool _425 = _421 || _423;
    bool _427 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _429 = isnan(_223);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    int _439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _441 = _439 != 0;
    int _443 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _445 = _443 != 0;
    int _447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _449 = _447 != 0;
    int _451 = ~_407;
    int _453 = _451 + 1;
    int _455 = _453 + 1;
    float _457 = _437 * _411;
    int _459 = _455;
    int _461 = as_type<int>(_337);
    if (!_385)
    {
        int _463 = ~_407;
        int _465 = _463 + 1;
        _459 = _465;
    }
    int _467 = _459;
    float _469 = -_437;
    float _471 = _469 + 1.0;
    bool _473 = !_441;
    float _475 = _473 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _477 = _383 > 0.0;
    bool _479 = _383 >= 0.0;
    bool _481 = isnan(_383);
    bool _483 = _479 || _481;
    bool _485 = isnan(0.0);
    bool _487 = _483 || _485;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _491 = _489 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _493 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _495 = isnan(_223);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    bool _505 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _507 = isnan(_223);
    bool _509 = _505 || _507;
    bool _511 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _513 = _509 || _511;
    float _515 = float(_513);
    float _517 = fma(_491, _327, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _519 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _521 = isnan(_223);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = _503 * _471;
    bool _533 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _535 = isnan(_223);
    bool _537 = _533 || _535;
    bool _539 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _541 = _537 || _539;
    float _543 = float(_541);
    float _545 = -_515;
    float _547 = _545 + 1.0;
    float _549 = -_503;
    float _551 = _549 + 1.0;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _553;
    float _557 = _543 * _547;
    float _559 = _515 * _551;
    float _561 = -_543;
    float _563 = _561 + 1.0;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _567 = _565 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _573 = fma(_555, _347, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _575 = _529 * _563;
    float _577 = fma(_567, _359, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _579 = fma(_571, _359, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _581 = _567;
    float _583 = _475;
    if (_271)
    {
        _461 = 0;
    }
    int _585 = _461;
    float _587 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _589 = log2(_587);
    int _591 = _585;
    if (!_271)
    {
        _591 = 1;
    }
    int _593 = _591;
    float _595 = -_529;
    float _597 = _595 + 1.0;
    int _599 = _487 ? 0 : 1;
    float _601 = _405 * _575;
    bool _603 = _593 != 1;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _605;
    float _609 = float(_119);
    float _611 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _613 = int(_611);
    int _615 = ~_599;
    int _617 = _615 + 1;
    int _619 = _617 + 1;
    float _621 = fma(_607, _347, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _623 = _379 * _575;
    int _625 = _619;
    float _627 = _601;
    if (!_477)
    {
        int _629 = ~_599;
        int _631 = _629 + 1;
        _625 = _631;
    }
    int _633 = _625;
    float _635 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[143].y, _601);
    float _637 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[143].x, _623);
    float _639 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _641 = int(_639);
    float _643 = _589 * _153;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_603)
    {
        _581 = _227;
    }
    float _647 = _581;
    float _649 = fma(_415, _557, _635);
    float _651 = _647;
    if (_603)
    {
        _651 = _225;
    }
    float _653 = _651;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _657 = 1.0 / _609;
    float _659 = float(_633);
    float _661 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[83].z, _645);
    float _663 = float(_613);
    float _665 = exp2(_643);
    int _667 = abs(as_type<int>(_475));
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _671 = 1.0 + _669;
    if (!_603)
    {
        _583 = _229;
    }
    float _673 = _583;
    float _675 = float(_667);
    float _677 = _673;
    if (_603)
    {
        _677 = _227;
    }
    float _679 = _677;
    float _681 = 1.0 / _663;
    float _683 = float(_641);
    float _685 = _675 * _659;
    float _687 = as_type<float>(_641);
    if (!_603)
    {
        _627 = _227;
    }
    float _689 = _627;
    float _691 = in.m_72.x;
    float _693 = in.m_72.y;
    float _695 = in.m_72.z;
    float _697 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[83].w, _655);
    float _699 = _657 * _153;
    float _701 = 1.0 / _683;
    float _703 = _689;
    if (_603)
    {
        _703 = _225;
    }
    float _705 = _703;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (!_603)
    {
        _687 = _229;
    }
    float _709 = _687;
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _713 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _715 = isnan(0.0);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _721 = _717 || _719;
    float _723 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[78].z, _707);
    float _725 = -_665;
    float _727 = _725 + 1.0;
    float _729 = 1.0 / _671;
    float _731 = _705 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _733 = _709;
    if (_603)
    {
        _733 = _227;
    }
    float _735 = _733;
    float _737 = -_153;
    float _739 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[76].x, _321);
    float _741 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].z, _723);
    bool _743 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _745 = isnan(1.0);
    bool _747 = _743 || _745;
    bool _749 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _751 = _747 || _749;
    float _753 = -_711;
    float _755 = fma(_731, 2.0, _753);
    bool _757 = !_445;
    int _759 = _757 ? 0 : 1;
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _763 = _721 ? _727 : 0.0;
    float _765 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[82].w, _697);
    float _767 = _735 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _771 = !_449;
    int _773 = _771 ? 0 : 1;
    float _775 = -_153;
    float _777 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[81].x, _755);
    int _779 = abs(_759);
    float _781 = _685 * (-2.0);
    float _783 = fma(_767, -2.0, _761);
    float _785 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[78].w, _769);
    int _787 = abs(_773);
    float _789 = fma(_781, _691, _691);
    float _791 = float(_467);
    float _793 = _681 * _153;
    float _795 = float(_779);
    float _797 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[82].z, _661);
    float _799 = _701 * _153;
    float _801 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].w, _785);
    float _803 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[81].y, _783);
    float _805 = _783;
    if (_751)
    {
        float _807 = _763 * _729;
        _155 = _807;
    }
    float _809 = _155;
    float _811 = _225 + (-0.5);
    float _813 = _795 * _791;
    int _815 = _425 ? 0 : 1;
    float _817 = fma(_361, _781, _361);
    float _819 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[196].x, _789);
    float _821 = _813 * (-2.0);
    int _823 = ~_815;
    int _825 = _823 + 1;
    int _827 = _825 + 1;
    float _829 = _227 + (-0.5);
    int _831 = _827;
    if (!_413)
    {
        int _833 = ~_815;
        int _835 = _833 + 1;
        _831 = _835;
    }
    int _837 = _831;
    float _839 = fma(_821, _693, _693);
    float _841 = fma(_817, _809, _819);
    float _843 = float(_837);
    float _845 = fma(_381, _821, _381);
    float _847 = float(_787);
    float _849 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[196].y, _839);
    float _851 = _841 * 0.15915493667125701904296875;
    float _853 = _847 * _843;
    float _855 = fma(_517, _557, _637);
    float _857 = fma(_845, _809, _849);
    float _859 = fma(_621, _559, _649);
    float _861 = in.m_74.x;
    float _863 = in.m_74.y;
    float _865 = _853 * (-2.0);
    float _867 = _857 * 0.15915493667125701904296875;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _869;
    float _873 = _229 + (-0.5);
    float _875 = fma(_865, _695, _695);
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _877;
    float _881 = fma(_573, _559, _855);
    float _883 = fma(_579, _531, _859);
    float _885 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[196].z, _875);
    float _887 = fma(_871, _377, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _889 = fma(_879, _377, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _891 = fma(_577, _531, _881);
    float _893 = fma(_349, _865, _349);
    float _895 = _851 * 6.283185482025146484375;
    float _897 = sin(_895);
    float _899 = fma(_889, _457, _883);
    float _901 = fma(_887, _457, _891);
    float _903 = fma(_893, _809, _885);
    float _905 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _189);
    float _907 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[148].y, _899);
    float _909 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[148].x, _901);
    float _911 = _903 * 0.15915493667125701904296875;
    float _913 = _851 * 6.283185482025146484375;
    float _915 = cos(_913);
    float _917 = _907 * _863;
    float _919 = _909 * _861;
    float _921 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _193);
    float _923 = _917 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _925 = _919 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _927 = _867 * 6.283185482025146484375;
    float _929 = sin(_927);
    float _931 = _923 * _921;
    float _933 = _925 * _905;
    float _935 = in.m_60.x;
    float _937 = in.m_60.y;
    float _939 = in.m_60.z;
    float _941 = _867 * 6.283185482025146484375;
    float _943 = cos(_941);
    float _945 = _911 * 6.283185482025146484375;
    float _947 = cos(_945);
    float _949 = _897 * _929;
    float _951 = _915 * _929;
    float _953 = _911 * 6.283185482025146484375;
    float _955 = sin(_953);
    float _957 = _915 * _943;
    float _959 = _897 * _943;
    float _961 = _915 * _947;
    float _963 = _897 * _947;
    float _965 = _943 * _947;
    float _967 = _929 * _947;
    float _969 = _961 * _931;
    float _971 = _963 * _931;
    float _973 = fma(_955, _957, _949);
    float _975 = fma(_955, _949, _957);
    float _977 = -_951;
    float _979 = fma(_955, _959, _977);
    float _981 = -_931;
    float _983 = _955 * _981;
    float _985 = -_959;
    float _987 = fma(_955, _951, _985);
    float _989 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _991 = fma(_973, _933, _969);
    float _993 = fma(_965, _933, _983);
    float _995 = fma(_979, _933, _971);
    float _997 = fma(_987, _989, _991);
    float _999 = fma(_967, _989, _993);
    float _1001 = fma(_975, _989, _995);
    float _1003 = _937 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1005 = _937 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1007 = _997 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1009 = _997 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1011 = fma(_935, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1003);
    float _1013 = fma(_935, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1005);
    float _1015 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1007);
    float _1017 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1009);
    float _1019 = fma(_939, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1011);
    float _1021 = fma(_939, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1013);
    float _1023 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1015);
    float _1025 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1017);
    float _1027 = _1019 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1029 = _1021 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1031 = _1023 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1033 = _1025 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1035 = _937 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1037 = _1027 + _1031;
    float _1039 = _1029 + _1033;
    float _1041 = fma(_935, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1035);
    float _1043 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1045 = _1037 + _1043;
    float _1047 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1049 = _1039 + _1047;
    float _1051 = fma(_939, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1041);
    float _1053 = _1045 * _1045;
    float _1055 = _1049 * _1049;
    float _1057 = _1053 + _1055;
    float _1059 = sqrt(_1057);
    bool _1061 = _1059 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1063 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1065 = _1059 + _1063;
    float _1067 = _865;
    float _1069 = _939;
    float _1071 = _997;
    float _1073 = _1051;
    float _1075 = _1053;
    float _1077 = _1055;
    if (_1061)
    {
        float _1079 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1067 = _1079;
    }
    float _1081 = _1067;
    if (_1061)
    {
        float _1083 = rsqrt(_1057);
        _1069 = _1083;
    }
    float _1085 = _1069;
    float _1087 = _1081;
    if (_1061)
    {
        float _1089 = _1065 * _1081;
        _1087 = _1089;
    }
    float _1091 = _1087;
    float _1093 = _997 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1095 = _1091;
    if (!_1061)
    {
        _1071 = _1039;
    }
    float _1097 = _1071;
    float _1099 = _1097;
    if (_1061)
    {
        float _1101 = _1091 * 0.15915493667125701904296875;
        _1095 = _1101;
    }
    float _1103 = _1095;
    float _1105 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1093);
    float _1107 = _935;
    float _1109 = _1103;
    if (_1061)
    {
        float _1111 = _1103 * 6.283185482025146484375;
        float _1113 = sin(_1111);
        _1107 = _1113;
    }
    float _1115 = _1107;
    float _1117 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1105);
    float _1119 = _1051 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1121 = _1117 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1123 = _1119 + _1121;
    float _1125 = _1121;
    float _1127 = _1123;
    int _1129 = as_type<int>(_1119);
    if (!_1061)
    {
        _1125 = _1037;
    }
    float _1131 = _1125;
    float _1133 = _1131;
    if (_1061)
    {
        float _1135 = _1123 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1073 = _1135;
    }
    float _1137 = _1073;
    float _1139 = _1137;
    if (_1061)
    {
        float _1141 = fma(_1115, _1137, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1139 = _1141;
    }
    float _1143 = _1139;
    float _1145 = _1143;
    if (_1061)
    {
        float _1147 = _1085 * _1143;
        _1145 = _1147;
    }
    float _1149 = _1145;
    if (_1061)
    {
        float _1151 = fma(_1045, _1149, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1133 = _1151;
    }
    float _1153 = _1133;
    if (_1061)
    {
        float _1155 = fma(_1049, _1149, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1099 = _1155;
    }
    float _1157 = _1099;
    float _1159 = fma(_1153, 6.2500002968590706586837768554688e-05, 0.5);
    float _1161 = fma(_1157, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5942 = float2(_1159, _1161);
    float3 _1165 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5942, float2(0.0), isnan(_5942)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5942, float2(0.0), isnan(_5942)), level(0.0)).xyz;
    float _1167 = _1165.x;
    float _1169 = _1165.y;
    float _1171 = _1165.z;
    float _1173 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1175 = int(_1173);
    if (_271)
    {
        float _1177 = in.m_70.x;
        _805 = _1177;
    }
    float _1179 = _805;
    int _1181 = abs(_305);
    float _1183 = -_801;
    float _1185 = _1183 + 1.0;
    int _1187 = abs(_315);
    float _1189 = _1179;
    if (!_271)
    {
        float _1191 = in.m_70.y;
        _1189 = _1191;
    }
    float _1193 = _1189;
    float _1195 = -_741;
    float _1197 = _1195 + 1.0;
    float _1199 = trunc(_799);
    int _1201 = int(_1199);
    float _1203 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1205 = float(uint(_1175));
    float _1207 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1209 = int(_1207);
    int _1211 = ~_1175;
    int _1213 = _1211 + 1;
    float _1215 = float(_1175);
    int _1217 = ~_1175;
    int _1219 = _1217 + 1;
    float _1221 = float(uint(_1201));
    float _1223 = 1.0 / _1205;
    bool _1225 = _1175 == 0;
    float _1227 = float(uint(_1209));
    float _1229 = _1205;
    if (_1061)
    {
        float _1231 = _1103 * 6.283185482025146484375;
        float _1233 = cos(_1231);
        _1109 = _1233;
    }
    float _1235 = _1109;
    if (_271)
    {
        _1229 = 1.0;
    }
    float _1237 = _1229;
    float _1239 = _1237;
    if (!_271)
    {
        _1239 = 7.345489978790283203125;
    }
    float _1241 = _1239;
    int _1243 = ~_1209;
    int _1245 = _1243 + 1;
    int _1247 = as_type<int>(_1223) + (-2);
    float _1249 = 1.0 / _1227;
    float _1251 = _1241 * _225;
    bool _1253 = _1209 == 0;
    float _1255 = as_type<float>(_1247) * _1221;
    float _1257 = trunc(_793);
    int _1259 = int(_1257);
    float _1261 = trunc(_1255);
    float _1263 = precise::max(_1261, 0.0);
    uint _1266 = uint(_1263);
    float _1268 = floor(_1251);
    int _1270 = _1213 * int(_1266);
    int _1272 = _1270 + _1201;
    float _1274 = float(uint(_1272));
    int _1276 = as_type<int>(_1249) + (-2);
    float _1278 = -_1268;
    float _1280 = _1251 + _1278;
    float _1282 = float(uint(_1259));
    float _1284 = as_type<float>(_1247) * _1274;
    float _1286 = float(_1201);
    float _1288 = _1280 * _1215;
    float _1290 = as_type<float>(_1276) * _1282;
    bool _1292 = _1286 >= _1215;
    bool _1294 = isnan(_1286);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan(_1215);
    bool _1300 = _1296 || _1298;
    float _1302 = float(_1300);
    float _1304 = trunc(_1284);
    float _1306 = precise::max(_1304, 0.0);
    uint _1308 = uint(_1306);
    float _1310 = _1215 * _699;
    float _1312 = trunc(_1290);
    float _1314 = precise::max(_1312, 0.0);
    uint _1316 = uint(_1314);
    int _1318 = int(_1266) + int(_1308);
    float _1320 = trunc(_1302);
    int _1322 = int(_1320);
    int _1324 = _1219 * _1318;
    int _1326 = _1324 + _1201;
    int _1328 = _1245 * int(_1316);
    int _1330 = _1328 + _1259;
    float _1332 = as_type<float>(_1245);
    if (_271)
    {
        _1332 = 1.0;
    }
    float _1334 = _1332;
    float _1336 = trunc(_1288);
    int _1338 = int(_1336);
    bool _1340 = uint(_1326) >= uint(_1175);
    float _1342 = float(uint(_1330));
    bool _1344 = !_1340;
    int _1346 = _1344 ? 0 : (-1);
    float _1348 = as_type<float>(_1276) * _1342;
    int _1350 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1352 = _1350 != 0;
    float _1354 = trunc(_1310);
    int _1356 = int(_1354);
    int _1358 = ~_1318;
    int _1360 = _1358 + _1346;
    int _1362 = _1360 + 1;
    bool _1364 = !_1352;
    int _1366 = _1364 ? 0 : 1;
    float _1368 = _1334;
    if (!_271)
    {
        _1368 = 1.2345600128173828125;
    }
    float _1370 = _1368;
    int _1372 = abs(_1366);
    float _1374 = trunc(_1348);
    float _1376 = precise::max(_1374, 0.0);
    uint _1378 = uint(_1376);
    int _1380 = _1175 * _1362;
    int _1382 = _1380 + _1201;
    float _1384 = _1193 * _1370;
    int _1386 = ~_1209;
    int _1388 = _1386 + 1;
    int _1390 = _1338 * _1372;
    int _1392 = _1390 + _1201;
    int _1394 = ~_1322;
    int _1396 = _1394 + 1;
    int _1398 = _1396 + 1;
    bool _1400 = !_1225;
    int _1402 = _1400 ? _1382 : (-1);
    int _1404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1406 = _1404 != 0;
    int _1408 = _1402 * _1398;
    float _1410 = floor(_1384);
    int _1412 = int(_1316) + int(_1378);
    int _1414 = _1175 + (-1);
    int _1416 = _1388 * _1412;
    int _1418 = _1416 + _1259;
    int _1420 = _1322 * _1414;
    int _1422 = _1420 + _1408;
    float _1424 = float(_1209);
    float _1426 = float(_1259);
    int _1428 = _1422 * _1181;
    bool _1430 = uint(_1418) >= uint(_1209);
    float _1432 = -_1410;
    float _1434 = _1384 + _1432;
    bool _1436 = _1426 >= _1424;
    bool _1438 = isnan(_1426);
    bool _1440 = _1436 || _1438;
    bool _1442 = isnan(_1424);
    bool _1444 = _1440 || _1442;
    float _1446 = float(_1444);
    int _1448 = abs(_375);
    float _1450 = trunc(_1446);
    int _1452 = int(_1450);
    bool _1454 = !_1430;
    int _1456 = _1454 ? 0 : (-1);
    int _1458 = _1356 * _1187;
    int _1460 = _1458 + _1428;
    float _1462 = _1434 * _1424;
    int _1464 = ~_1412;
    int _1466 = _1464 + _1456;
    int _1468 = _1466 + 1;
    bool _1470 = !_1406;
    int _1472 = _1470 ? 0 : 1;
    int _1474 = _1392 * _1448;
    int _1476 = _1474 + _1460;
    int _1478 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1480 = _1478 != 0;
    int _1482 = _1209 * _1468;
    int _1484 = _1482 + _1259;
    int _1486 = abs(_1472);
    float _1488 = _1424 * _699;
    bool _1490 = !_1480;
    int _1492 = _1490 ? 0 : 1;
    float _1494 = trunc(_1462);
    int _1496 = int(_1494);
    int _1498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1500 = _1498 != 0;
    int _1502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1504 = _1502 != 0;
    int _1506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1508 = _1506 != 0;
    int _1510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1512 = _1510 != 0;
    int _1514 = _1338 * _1486;
    int _1516 = _1514 + _1476;
    int _1518 = ~_1452;
    int _1520 = _1518 + 1;
    int _1522 = _1520 + 1;
    bool _1524 = !_1253;
    int _1526 = _1524 ? _1484 : (-1);
    bool _1528 = !_1504;
    int _1530 = _1528 ? 0 : 1;
    float _1532 = trunc(_1488);
    int _1534 = int(_1532);
    int _1536 = abs(_1492);
    int _1538 = _1526 * _1522;
    int _1540 = _1209 + (-1);
    bool _1542 = !_1500;
    int _1544 = _1542 ? 0 : 1;
    int _1546 = abs(_1530);
    int _1548 = _1452 * _1540;
    int _1550 = _1548 + _1538;
    float _1552 = float(uint(_1516));
    int _1554 = abs(_1544);
    float _1556 = as_type<float>(_1247) * _1552;
    int _1558 = _1496 * _1536;
    int _1560 = _1558 + _1259;
    float _1562 = trunc(_1556);
    float _1564 = precise::max(_1562, 0.0);
    uint _1566 = uint(_1564);
    bool _1568 = !_1508;
    int _1570 = _1568 ? 0 : 1;
    int _1572 = _1550 * _1546;
    int _1574 = ~_1175;
    int _1576 = _1574 + 1;
    int _1578 = abs(_1570);
    int _1580 = _1534 * _1554;
    int _1582 = _1580 + _1572;
    bool _1584 = !_1512;
    int _1586 = _1584 ? 0 : 1;
    int _1588 = abs(_1586);
    float _1590 = float(uint(_1392));
    int _1592 = _1576 * int(_1566);
    int _1594 = _1592 + _1516;
    float _1596 = float(uint(_1560));
    int _1598 = _1560 * _1578;
    int _1600 = _1598 + _1582;
    int _1602 = ~_1209;
    int _1604 = _1602 + 1;
    float _1606 = as_type<float>(_1247) * _1590;
    float _1608 = float(uint(_1594));
    int _1610 = _1496 * _1588;
    int _1612 = _1610 + _1600;
    float _1614 = as_type<float>(_1276) * _1596;
    int _1616 = ~_1175;
    int _1618 = _1616 + 1;
    float _1620 = trunc(_1606);
    float _1622 = precise::max(_1620, 0.0);
    uint _1624 = uint(_1622);
    float _1626 = float(uint(_1612));
    float _1628 = as_type<float>(_1247) * _1608;
    float _1630 = as_type<float>(_1276) * _1626;
    float _1632 = trunc(_1614);
    float _1634 = precise::max(_1632, 0.0);
    uint _1636 = uint(_1634);
    float _1638 = trunc(_1628);
    float _1640 = precise::max(_1638, 0.0);
    uint _1642 = uint(_1640);
    int _1644 = _1618 * int(_1624);
    int _1646 = _1644 + _1392;
    float _1648 = float(uint(_1646));
    float _1650 = trunc(_1630);
    float _1652 = precise::max(_1650, 0.0);
    uint _1654 = uint(_1652);
    int _1656 = _1604 * int(_1636);
    int _1658 = _1656 + _1560;
    int _1660 = ~_1209;
    int _1662 = _1660 + 1;
    float _1664 = as_type<float>(_1247) * _1648;
    int _1666 = ~_1175;
    int _1668 = _1666 + 1;
    float _1670 = float(uint(_1658));
    int _1672 = int(_1566) + int(_1642);
    float _1674 = trunc(_1664);
    float _1676 = precise::max(_1674, 0.0);
    uint _1678 = uint(_1676);
    float _1680 = as_type<float>(_1276) * _1670;
    int _1682 = _1668 * _1672;
    int _1684 = _1682 + _1516;
    int _1686 = _1662 * int(_1654);
    int _1688 = _1686 + _1612;
    float _1690 = trunc(_1680);
    float _1692 = precise::max(_1690, 0.0);
    uint _1694 = uint(_1692);
    bool _1696 = uint(_1684) >= uint(_1175);
    float _1698 = float(uint(_1688));
    bool _1700 = !_1696;
    int _1702 = _1700 ? 0 : (-1);
    int _1704 = int(_1624) + int(_1678);
    float _1706 = as_type<float>(_1276) * _1698;
    int _1708 = ~_1672;
    int _1710 = _1708 + _1702;
    int _1712 = _1710 + 1;
    int _1714 = ~_1209;
    int _1716 = _1714 + 1;
    float _1718 = trunc(_1706);
    float _1720 = precise::max(_1718, 0.0);
    uint _1722 = uint(_1720);
    int _1724 = _1175 * _1712;
    int _1726 = _1724 + _1516;
    int _1728 = ~_1175;
    int _1730 = _1728 + 1;
    int _1732 = int(_1636) + int(_1694);
    bool _1734 = !_1225;
    int _1736 = _1734 ? _1726 : (-1);
    int _1738 = ~_1209;
    int _1740 = _1738 + 1;
    int _1742 = _1736 & 3;
    bool _1744 = _1742 != 0;
    int _1746 = _1744 ? 0 : 1;
    int _1748 = int(_1654) + int(_1722);
    int _1750 = _1730 * _1704;
    int _1752 = _1750 + _1392;
    int _1754 = _1736 & 3;
    bool _1756 = _1754 != 0;
    int _1758 = _1716 * _1748;
    int _1760 = _1758 + _1612;
    bool _1762 = uint(_1754) >= 2u;
    bool _1764 = uint(_1752) >= uint(_1175);
    int _1766 = _1762 ? 0 : 1;
    bool _1768 = uint(_1760) >= uint(_1209);
    bool _1770 = !_1764;
    int _1772 = _1770 ? 0 : (-1);
    bool _1774 = !_1768;
    int _1776 = _1774 ? 0 : (-1);
    bool _1778 = uint(_1754) > 1u;
    bool _1780 = _1754 != 3;
    int _1782 = ~_1748;
    int _1784 = _1782 + _1776;
    int _1786 = _1784 + 1;
    int _1788 = ~_1704;
    int _1790 = _1788 + _1772;
    int _1792 = _1790 + 1;
    int _1794 = _1740 * _1732;
    int _1796 = _1794 + _1560;
    bool _1798 = _231 > 0.5;
    int _1800 = _1209 * _1786;
    int _1802 = _1800 + _1612;
    int _1804 = ~_1746;
    int _1806 = _1804 + 1;
    int _1808 = _1806 + 1;
    int _1810 = _1175 * _1792;
    int _1812 = _1810 + _1392;
    float _1814 = -_193;
    int _1816 = _1798 ? as_type<int>(_1814) : as_type<int>(_193);
    int _1818 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1820 = _1818 != 0;
    int _1822 = ~_1766;
    int _1824 = _1822 + 1;
    int _1826 = _1824 + 1;
    bool _1828 = !_1253;
    int _1830 = _1828 ? _1802 : (-1);
    int _1832 = _1808;
    int _1834 = _1826;
    if (!_1778)
    {
        int _1836 = ~_1746;
        int _1838 = _1836 + 1;
        _1832 = _1838;
    }
    int _1840 = _1832;
    if (_1780)
    {
        int _1842 = ~_1766;
        int _1844 = _1842 + 1;
        _1834 = _1844;
    }
    int _1846 = _1834;
    bool _1848 = uint(_1796) >= uint(_1209);
    bool _1850 = !_1225;
    int _1852 = _1850 ? _1812 : (-1);
    int _1854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1856 = _1854 != 0;
    bool _1858 = !_1820;
    int _1860 = _1858 ? 0 : 1;
    int _1862 = _1736 >> 31;
    int _1864 = _1830 & 3;
    bool _1866 = _1864 != 0;
    int _1868 = _1830 >> 31;
    bool _1870 = !_1756;
    int _1872 = _1870 ? 0 : 1;
    bool _1874 = !_1848;
    int _1876 = _1874 ? 0 : (-1);
    int _1878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1880 = _1878 != 0;
    int _1882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1884 = _1882 != 0;
    bool _1886 = !_1856;
    int _1888 = _1886 ? 0 : 1;
    int _1890 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1892 = _1890 != 0;
    int _1894 = _1862 & 3;
    int _1896 = _1830 & 3;
    bool _1898 = _1896 != 0;
    bool _1900 = !_1866;
    int _1902 = _1900 ? 0 : 1;
    int _1904 = _1868 & 3;
    bool _1906 = uint(_1864) > 1u;
    int _1908 = _1736 + _1894;
    int _1910 = _1898 ? 0 : 1;
    int _1912 = _1830 + _1904;
    bool _1914 = _1754 != 3;
    int _1916 = _1908 >> 2;
    int _1918 = ~_1732;
    int _1920 = _1918 + _1876;
    int _1922 = _1920 + 1;
    int _1924 = _1912 >> 2;
    bool _1926 = !_1914;
    int _1928 = _1926 ? 0 : (-1);
    int _1930 = _1209 * _1922;
    int _1932 = _1930 + _1560;
    bool _1934 = uint(_1864) >= 2u;
    int _1936 = _1916 << 4;
    int _1938 = _1936 + 368;
    int _1940 = _1924 << 4;
    int _1942 = _1940 + 512;
    int _1944 = ~_1910;
    int _1946 = _1944 + 1;
    int _1948 = _1946 + 1;
    uint _1950 = uint(int(uint(_1938) >> uint(2)));
    uint _1952 = uint(int(uint(int(_1950)) >> uint(2)));
    int _1954 = int(_1950) & 3;
    float _1956 = (*spvDescriptorSet0.vp_c9)._m0[int(_1952)][_1954];
    int _1958 = int(_1950) + 1;
    uint _1960 = uint(int(uint(_1958) >> uint(2)));
    int _1962 = _1958 & 3;
    float _1964 = (*spvDescriptorSet0.vp_c9)._m0[int(_1960)][_1962];
    int _1966 = _1948;
    if (!_1906)
    {
        int _1968 = ~_1910;
        int _1970 = _1968 + 1;
        _1966 = _1970;
    }
    int _1972 = _1966;
    int _1974 = _1934 ? 0 : 1;
    bool _1976 = _1864 != 3;
    bool _1978 = _1864 != 3;
    int _1980 = _1942 + 8;
    uint _1982 = uint(int(uint(_1980) >> uint(2)));
    uint _1984 = uint(int(uint(int(_1982)) >> uint(2)));
    int _1986 = int(_1982) & 3;
    float _1988 = (*spvDescriptorSet0.vp_c9)._m0[int(_1984)][_1986];
    int _1990 = int(_1982) + 1;
    uint _1992 = uint(int(uint(_1990) >> uint(2)));
    int _1994 = _1990 & 3;
    float _1996 = (*spvDescriptorSet0.vp_c9)._m0[int(_1992)][_1994];
    int _1998 = ~_1974;
    int _2000 = _1998 + 1;
    int _2002 = _2000 + 1;
    bool _2004 = !_1253;
    int _2006 = _2004 ? _1932 : (-1);
    uint _2008 = uint(int(uint(_1942) >> uint(2)));
    uint _2010 = uint(int(uint(int(_2008)) >> uint(2)));
    int _2012 = int(_2008) & 3;
    float _2014 = (*spvDescriptorSet0.vp_c9)._m0[int(_2010)][_2012];
    int _2016 = int(_2008) + 1;
    uint _2018 = uint(int(uint(_2016) >> uint(2)));
    int _2020 = _2016 & 3;
    float _2022 = (*spvDescriptorSet0.vp_c9)._m0[int(_2018)][_2020];
    int _2024 = _2002;
    if (_1976)
    {
        int _2026 = ~_1974;
        int _2028 = _2026 + 1;
        _2024 = _2028;
    }
    int _2030 = _2024;
    float _2032 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2034 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2036 = _2034 != 0;
    float _2038 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2040 = _1938 + 8;
    uint _2042 = uint(int(uint(_2040) >> uint(2)));
    uint _2044 = uint(int(uint(int(_2042)) >> uint(2)));
    int _2046 = int(_2042) & 3;
    float _2048 = (*spvDescriptorSet0.vp_c9)._m0[int(_2044)][_2046];
    int _2050 = int(_2042) + 1;
    uint _2052 = uint(int(uint(_2050) >> uint(2)));
    int _2054 = _2050 & 3;
    float _2056 = (*spvDescriptorSet0.vp_c9)._m0[int(_2052)][_2054];
    float _2058 = _2032 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2060 = abs(_1972);
    float _2062 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2064 = abs(_1840);
    float _2066 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2068 = abs(_1872);
    float _2070 = _2062 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2072 = ~_2064;
    int _2074 = _2072 + 1;
    int _2076 = _2074 + 1;
    float _2078 = _2066 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2080 = !_1978;
    int _2082 = _2080 ? 0 : (-1);
    bool _2084 = _225 > 0.5;
    out.m_76.x = _2070;
    out.m_76.y = _2058;
    out.m_76.z = _2078;
    out.m_76.w = _2038;
    bool _2086 = _227 > 0.5;
    float _2088 = -_189;
    int _2090 = _2084 ? as_type<int>(_2088) : as_type<int>(_189);
    float _2092 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2094 = _2076 * as_type<int>(_1964);
    bool _2096 = _229 > 0.5;
    float _2098 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2100 = _1203 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2102 = _2092 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2104 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2106 = int(_2104);
    float _2108 = _2098 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2110 = abs(_1902);
    float _2112 = _987 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2114 = ~_2060;
    int _2116 = _2114 + 1;
    int _2118 = _2116 + 1;
    int _2120 = ~_2068;
    int _2122 = _2120 + 1;
    int _2124 = _2122 + 1;
    out.m_78.x = _2100;
    out.m_78.y = _2102;
    out.m_78.z = _2108;
    int _2126 = ~_2110;
    int _2128 = _2126 + 1;
    int _2130 = _2128 + 1;
    int _2132 = _2118 * as_type<int>(_2022);
    int _2134 = abs(_1846);
    int _2136 = _2124 * as_type<int>(_1956);
    int _2138 = _2136 + _2094;
    int _2140 = abs(_2082);
    int _2142 = _2130 * as_type<int>(_2014);
    int _2144 = _2142 + _2132;
    int _2146 = abs(_2030);
    float _2148 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2150 = int(_2148);
    float _2152 = _961 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2154 = abs(_1928);
    int _2156 = ~_2146;
    int _2158 = _2156 + 1;
    int _2160 = _2158 + 1;
    float _2162 = -_955;
    float _2164 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2152);
    float _2166 = float(uint(_2106));
    int _2168 = ~_2140;
    int _2170 = _2168 + 1;
    int _2172 = _2170 + 1;
    int _2174 = _2160 * as_type<int>(_1988);
    int _2176 = _2174 + _2144;
    int _2178 = ~_2134;
    int _2180 = _2178 + 1;
    int _2182 = _2180 + 1;
    float _2184 = 1.0 / _2166;
    int _2186 = _2172 * as_type<int>(_1996);
    int _2188 = _2186 + _2176;
    float _2190 = float(uint(_2150));
    int _2192 = _2182 * as_type<int>(_2048);
    int _2194 = _2192 + _2138;
    int _2196 = ~_2154;
    int _2198 = _2196 + 1;
    int _2200 = _2198 + 1;
    float _2202 = _961 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2204 = abs(_1860);
    float _2206 = _961 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2208 = 1.0 / _2190;
    int _2210 = abs(_1888);
    int _2212 = _2200 * as_type<int>(_2056);
    int _2214 = _2212 + _2194;
    int _2216 = ~_2204;
    int _2218 = _2216 + 1;
    int _2220 = _2218 + 1;
    float _2222 = -_955;
    float _2224 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2202);
    int _2226 = abs(_2106);
    float _2228 = -_955;
    float _2230 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2206);
    int _2232 = ~_2210;
    int _2234 = _2232 + 1;
    int _2236 = _2234 + 1;
    int _2238 = _2214 * _2220;
    int _2240 = abs(_2150);
    float _2242 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2164);
    int _2244 = _2188 * _2236;
    float _2246 = float(uint(_2240));
    int _2248 = _1852 * _2204;
    int _2250 = _2248 + _2238;
    float _2252 = float(uint(_2226));
    int _2254 = _2006 * _2210;
    int _2256 = _2254 + _2244;
    int _2258 = as_type<int>(_2184) + (-2);
    float _2260 = _973 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2262 = 1.0 / _2246;
    int _2264 = as_type<int>(_2208) + (-2);
    float _2266 = _973 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2268 = float(uint(_2250));
    float _2270 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2260);
    float _2272 = _973 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2274 = ~_2106;
    int _2276 = _2274 + 1;
    float _2278 = _987 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2280 = 1.0 / _2252;
    float _2282 = as_type<float>(_2258) * _2268;
    float _2284 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2266);
    int _2286 = abs(_2250);
    float _2288 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2272);
    float _2290 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2224);
    float _2292 = trunc(_2282);
    float _2294 = precise::max(_2292, 0.0);
    uint _2296 = uint(_2294);
    int _2298 = abs(_2256);
    float _2300 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2230);
    float _2302 = float(uint(_2256));
    float _2304 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2112);
    int _2306 = as_type<int>(_2262) + (-2);
    float _2308 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2284);
    float _2310 = as_type<float>(_2264) * _2302;
    int _2312 = as_type<int>(_2280) + (-2);
    float _2314 = float(uint(_2286));
    float _2316 = float(uint(_2298));
    float _2318 = trunc(_2310);
    float _2320 = precise::max(_2318, 0.0);
    uint _2322 = uint(_2320);
    int _2324 = ~_2240;
    int _2326 = _2324 + 1;
    float _2328 = as_type<float>(_2312) * _2314;
    float _2330 = _987 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2332 = as_type<float>(_2306) * _2316;
    float _2334 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2278);
    int _2336 = _2276 * int(_2296);
    int _2338 = _2336 + _2250;
    float _2340 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2330);
    float _2342 = trunc(_2328);
    float _2344 = precise::max(_2342, 0.0);
    uint _2346 = uint(_2344);
    float _2348 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2334);
    float _2350 = _2330;
    float _2352 = as_type<float>(_2326);
    if (_1061)
    {
        float _2354 = _1235 + (-1.0);
        _2350 = _2354;
    }
    float _2356 = _2350;
    float _2358 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2340);
    float _2360 = float(uint(_2338));
    float _2362 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2304);
    int _2364 = ~_2150;
    int _2366 = _2364 + 1;
    float _2368 = _2356;
    if (_1061)
    {
        float _2370 = _2356 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2368 = _2370;
    }
    float _2372 = _2368;
    float _2374 = trunc(_2332);
    float _2376 = precise::max(_2374, 0.0);
    uint _2378 = uint(_2376);
    int _2380 = ~_2226;
    int _2382 = _2380 + 1;
    float _2384 = as_type<float>(_2258) * _2360;
    if (_1061)
    {
        float _2386 = fma(_1123, _1235, _2372);
        _1127 = _2386;
    }
    float _2388 = _1127;
    float _2390 = -_189;
    int _2392 = _2096 ? as_type<int>(_2390) : as_type<int>(_189);
    int _2394 = _2366 * int(_2322);
    int _2396 = _2394 + _2256;
    float _2398 = trunc(_2384);
    float _2400 = precise::max(_2398, 0.0);
    uint _2402 = uint(_2400);
    bool _2404 = !_1880;
    float _2406 = _2404 ? _193 : as_type<float>(_1816);
    int _2408 = _2382 * int(_2346);
    int _2410 = _2408 + _2286;
    float _2412 = float(uint(_2396));
    float _2414 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2416 = !_2036;
    float _2418 = _2416 ? _189 : as_type<float>(_2090);
    int _2420 = _2326 * int(_2378);
    int _2422 = _2420 + _2298;
    float _2424 = float(uint(_2410));
    if (_1061)
    {
        float _2426 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2428 = _1153 + _2426;
        _2352 = _2428;
    }
    float _2430 = _2352;
    float _2432 = -_193;
    int _2434 = _2086 ? as_type<int>(_2432) : as_type<int>(_193);
    float _2436 = float(uint(_2422));
    float _2438 = as_type<float>(_2264) * _2412;
    float _2440 = as_type<float>(_2312) * _2424;
    bool _2442 = !_1884;
    float _2444 = _2442 ? _193 : as_type<float>(_2434);
    float _2446 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2448 = as_type<float>(_2306) * _2436;
    bool _2450 = !_1892;
    float _2452 = _2450 ? _189 : as_type<float>(_2392);
    float _2454 = trunc(_2438);
    float _2456 = precise::max(_2454, 0.0);
    uint _2458 = uint(_2456);
    float _2460 = _2414 * _2290;
    float _2462 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2270);
    float _2464 = _2460;
    if (_1061)
    {
        float _2466 = _2430 * _2430;
        _1075 = _2466;
    }
    float _2468 = _1075;
    float _2470 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2472 = _2388 + _2470;
    bool _2474 = _2150 == 0;
    float _2476 = fma(_2446, _2462, _2460);
    if (_1061)
    {
        float _2478 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2480 = _1157 + _2478;
        _2464 = _2480;
    }
    float _2482 = _2464;
    float _2484 = trunc(_2440);
    float _2486 = precise::max(_2484, 0.0);
    uint _2488 = uint(_2486);
    float _2490 = fma(_2472, _2472, _2468);
    float _2492 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2288);
    if (_1061)
    {
        float _2494 = _2482 * _2482;
        _1077 = _2494;
    }
    float _2496 = _1077;
    int _2498 = int(_2296) + int(_2402);
    float _2500 = _2414 * _2242;
    int _2502 = ~_2106;
    int _2504 = _2502 + 1;
    float _2506 = _2414 * _2300;
    float _2508 = trunc(_2448);
    float _2510 = precise::max(_2508, 0.0);
    uint _2512 = uint(_2510);
    int _2514 = int(_2322) + int(_2458);
    float _2516 = fma(_2446, _2308, _2500);
    int _2518 = ~_2150;
    int _2520 = _2518 + 1;
    int _2522 = _2504 * _2498;
    int _2524 = _2522 + _2250;
    int _2526 = ~_2226;
    int _2528 = _2526 + 1;
    float _2530 = fma(_2446, _2492, _2506);
    bool _2532 = _2150 == 0;
    int _2534 = _2520 * _2514;
    int _2536 = _2534 + _2256;
    int _2538 = int(_2346) + int(_2488);
    out.m_80.x = _2462;
    out.m_80.y = _2308;
    out.m_80.z = _2492;
    int _2540 = ~_2240;
    int _2542 = _2540 + 1;
    bool _2544 = uint(_2524) >= uint(_2106);
    bool _2546 = uint(_2536) >= uint(_2150);
    int _2548 = int(_2378) + int(_2512);
    int _2550 = _2528 * _2538;
    int _2552 = _2550 + _2286;
    float _2554 = _2490 + _2496;
    float _2556 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2558 = _2256 ^ _2150;
    int _2560 = _2542 * _2548;
    int _2562 = _2560 + _2298;
    bool _2564 = !_2544;
    int _2566 = _2564 ? 0 : (-1);
    bool _2568 = uint(_2552) >= uint(_2226);
    bool _2570 = !_2546;
    int _2572 = _2570 ? 0 : (-1);
    float _2574 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2576 = uint(_2562) >= uint(_2240);
    int _2578 = ~_2498;
    int _2580 = _2578 + _2566;
    int _2582 = _2580 + 1;
    int _2584 = _2250 ^ _2106;
    int _2586 = ~_2514;
    int _2588 = _2586 + _2572;
    int _2590 = _2588 + 1;
    int _2592 = _2106 * _2582;
    int _2594 = _2592 + _2250;
    bool _2596 = !_2568;
    int _2598 = _2596 ? 0 : (-1);
    float _2600 = _2556 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    uint _2602 = uint(int(uint(_2584) >> uint(31)));
    int _2604 = _2150 * _2590;
    int _2606 = _2604 + _2256;
    bool _2608 = _2106 == 0;
    float _2610 = sqrt(_2554);
    bool _2612 = _2106 == 0;
    float _2614 = _2574 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2616 = ~_2598;
    int _2618 = _2538 + _2616;
    int _2620 = _2618 + 1;
    int _2622 = ~int(_2602);
    int _2624 = _2622 + 1;
    bool _2626 = !_2576;
    int _2628 = _2626 ? 0 : (-1);
    float _2630 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _2632 = uint(int(uint(_2558) >> uint(31)));
    int _2634 = _2620 ^ _2624;
    bool _2636 = !_2608;
    int _2638 = _2636 ? _2594 : (-1);
    int _2640 = ~_2628;
    int _2642 = _2548 + _2640;
    int _2644 = _2642 + 1;
    float _2646 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2648 = ~int(_2632);
    int _2650 = _2648 + 1;
    int _2652 = ~_2624;
    int _2654 = _2652 + _2634;
    int _2656 = _2654 + 1;
    float _2658 = fma(_2414, _2414, 1.0);
    bool _2660 = !_2474;
    int _2662 = _2660 ? _2606 : (-1);
    float _2664 = float(_2638);
    float _2666 = _2630 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2668 = _2644 ^ _2650;
    float _2670 = rsqrt(_2658);
    float _2672 = float(_2662);
    float _2674 = fma(_2600, _2664, _739);
    int _2676 = ~_2650;
    int _2678 = _2676 + _2668;
    int _2680 = _2678 + 1;
    float _2682 = _2418 + 0.5;
    bool _2684 = !_2612;
    int _2686 = _2684 ? _2656 : (-1);
    float _2688 = fma(_2666, _2672, _777);
    bool _2690 = !_2532;
    int _2692 = _2690 ? _2680 : (-1);
    float _2694 = _2646 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2696 = float(_2686);
    float _2698 = fma(_2600, _2682, _2674);
    float _2700 = float(_2692);
    out.m_82.x = _1167;
    out.m_82.y = _1169;
    out.m_82.z = _1171;
    bool _2702 = _2610 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2704 = isnan(_2610);
    bool _2706 = _2702 || _2704;
    bool _2708 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2710 = _2706 || _2708;
    float _2712 = -_335;
    float _2714 = fma(_2614, _2696, _2712);
    float _2716 = _2452 + 0.5;
    float _2718 = -_803;
    float _2720 = fma(_2694, _2700, _2718);
    float _2722 = _2406 + (-0.5);
    float _2724 = _2444 + (-0.5);
    float _2726 = fma(_2666, _2716, _2688);
    float _2728 = _2414 * _2670;
    float _2730 = -_2694;
    float _2732 = fma(_2730, _2722, _2720);
    float _2734 = -_2614;
    float _2736 = fma(_2734, _2724, _2714);
    float _2738 = -_797;
    float _2740 = _2738 + 1.0;
    float _2742 = -_2348;
    float _2744 = _2728 * _2742;
    float _2746 = -_2358;
    float _2748 = _2728 * _2746;
    float _2750 = -_765;
    float _2752 = _2750 + 1.0;
    float _2754 = -_2362;
    float _2756 = _2728 * _2754;
    float _2758 = fma(_2444, _1185, _2736);
    float _2760 = fma(_2670, _2290, _2744);
    float _2762 = fma(_2670, _2242, _2748);
    float _2764 = fma(_2406, _2752, _2732);
    float _2766 = fma(_2670, _2300, _2756);
    float _2768 = _2348 + _2476;
    float _2770 = -_1197;
    float _2772 = fma(_2418, _2770, _2698);
    float _2774 = -_2740;
    float _2776 = fma(_2452, _2774, _2726);
    float _2778 = _2358 + _2516;
    float _2780 = _2362 + _2530;
    out.m_84.x = _2760;
    out.m_84.y = _2762;
    out.m_84.z = _2766;
    float _2782 = _2698;
    if (!_2710)
    {
        _2782 = 1.0;
    }
    float _2784 = _2782;
    out.m_86.x = _2772;
    out.m_86.y = _2758;
    out.m_86.z = _2776;
    out.m_86.w = _2764;
    out.m_88.x = _2768;
    out.m_88.y = _2778;
    out.m_88.z = _2780;
    bool _2786 = !_2710;
    float _2788 = _2784;
    if (!_2786)
    {
        bool _2790 = _2610 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2792 = isnan(_2610);
        bool _2794 = _2790 || _2792;
        bool _2796 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2798 = _2794 || _2796;
        if (!_2798)
        {
            float _2800 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2802 = _2610 + _2800;
            float _2804 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2806 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2804;
            float _2808 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2810 = _2808 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2812 = 1.0 / _2806;
            float _2814 = _2802 * _2812;
            float _2816 = fma(_2814, _2810, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2788 = _2816;
            _2818 = true;
        }
        else
        {
            bool _2820 = _2610 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2822 = isnan(_2610);
            bool _2824 = _2820 || _2822;
            bool _2826 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2828 = _2824 || _2826;
            if (!_2828)
            {
                float _2830 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2832 = _2610 + _2830;
                float _2834 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2836 = _2834 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2838 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2840 = _2838 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2842 = 1.0 / _2836;
                float _2844 = _2832 * _2842;
                float _2846 = fma(_2844, _2840, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2788 = _2846;
                _2818 = true;
            }
            else
            {
                _2788 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2818 = false;
    float _2848 = _2788;
    float _2850 = fma(_1027, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2852 = fma(_1029, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2854 = floor(_2850);
    float _2856 = floor(_2852);
    float _2858 = -_2854;
    float _2860 = _2850 + _2858;
    float _2862 = -_2856;
    float _2864 = _2852 + _2862;
    float2 _8419 = float2(_2860, _2864);
    float _2866 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8419, float2(0.0), isnan(_8419)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8419, float2(0.0), isnan(_8419)), level(0.0)).x;
    float _2868 = _1119 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2870 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2872 = _2388 + _2870;
    float _2874 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2868);
    float _2876 = _1119 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2878 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2880 = _1157 + _2878;
    float _2882 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2874);
    float _2884 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2886 = fma(_2872, _2848, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2888 = _2882 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2890 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2876);
    float _2892 = _1119 + _2884;
    float _2894 = 1.0 / _2888;
    float _2896 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2890);
    float _2898 = _2896 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2900 = _2898 + _2888;
    float _2902 = _2900 * _2894;
    float _2904 = _2902 * 0.5;
    float _2906 = _2892 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2908 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2910 = fma(_2904, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2908);
    float _2912 = fma(_1027, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2906);
    float _2914 = _2892 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2916 = fma(_1029, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2912);
    float _2918 = 1.0 / _2910;
    float _2920 = _2916 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2922 = trunc(_2920);
    int _2924 = int(_2922);
    float _2926 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2928 = _2918 * _2926;
    bool _2930 = _2928 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _2932 = _2928 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _2934 = !_2930;
    int _2936 = _2934 ? 0 : 1;
    int _2938 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2940 = _2924 + _2938;
    int _2942 = _2940 + 1;
    int _2944 = 2;
    float _2946 = _2916;
    if (!_2930)
    {
        _2944 = 1;
    }
    int _2948 = _2944;
    int _2950 = _2948;
    if (!_2932)
    {
        _2950 = _2936;
    }
    int _2952 = _2950;
    float _2954 = fma(_1027, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2914);
    int _2956 = _2952 << 6;
    float _2958 = fma(_1029, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2954);
    bool _2960 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2962 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2964 = _2960 || _2962;
    bool _2966 = isnan(0.5);
    bool _2968 = _2964 || _2966;
    float _2970 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2972 = _1153 + _2970;
    int _2974 = _2956 + 48;
    uint _2976 = uint(int(uint(_2974) >> uint(2)));
    uint _2978 = uint(int(uint(int(_2976)) >> uint(2)));
    int _2980 = int(_2976) & 3;
    float _2982 = (*spvDescriptorSet0.vp_c15)._m0[int(_2978)][_2980];
    int _2984 = int(_2976) + 1;
    uint _2986 = uint(int(uint(_2984) >> uint(2)));
    int _2988 = _2984 & 3;
    float _2990 = (*spvDescriptorSet0.vp_c15)._m0[int(_2986)][_2988];
    float _2992 = _2958 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _2994 = _2942 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2996 = fma(_2972, _2848, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2998 = fma(_2880, _2848, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3000 = trunc(_2992);
    int _3002 = int(_3000);
    int _3004 = _2956 + 56;
    uint _3006 = uint(int(uint(_3004) >> uint(2)));
    uint _3008 = uint(int(uint(int(_3006)) >> uint(2)));
    int _3010 = int(_3006) & 3;
    float _3012 = (*spvDescriptorSet0.vp_c15)._m0[int(_3008)][_3010];
    int _3014 = int(_3006) + 1;
    uint _3016 = uint(int(uint(_3014) >> uint(2)));
    int _3018 = _3014 & 3;
    float _3020 = (*spvDescriptorSet0.vp_c15)._m0[int(_3016)][_3018];
    float _3022 = _2972;
    int _3024 = as_type<int>(_2998);
    if (_2968)
    {
        _3022 = _2886;
    }
    float _3026 = _3022;
    float _3028 = _3026;
    if (_2968)
    {
        _2946 = _2998;
    }
    float _3030 = _2946;
    int _3032 = _2956 + 64;
    uint _3034 = uint(int(uint(_3032) >> uint(2)));
    uint _3036 = uint(int(uint(int(_3034)) >> uint(2)));
    int _3038 = int(_3034) & 3;
    float _3040 = (*spvDescriptorSet0.vp_c15)._m0[int(_3036)][_3038];
    int _3042 = int(_3034) + 1;
    uint _3044 = uint(int(uint(_3042) >> uint(2)));
    int _3046 = _3042 & 3;
    float _3048 = (*spvDescriptorSet0.vp_c15)._m0[int(_3044)][_3046];
    int _3050 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3052 = _3002 + _3050;
    int _3054 = _3052 + 1;
    int _3056 = _2956 + 72;
    uint _3058 = uint(int(uint(_3056) >> uint(2)));
    uint _3060 = uint(int(uint(int(_3058)) >> uint(2)));
    int _3062 = int(_3058) & 3;
    float _3064 = (*spvDescriptorSet0.vp_c15)._m0[int(_3060)][_3062];
    int _3066 = int(_3058) + 1;
    uint _3068 = uint(int(uint(_3066) >> uint(2)));
    int _3070 = _3066 & 3;
    float _3072 = (*spvDescriptorSet0.vp_c15)._m0[int(_3068)][_3070];
    int _3074 = _2942 | _3054;
    bool _3076 = _3074 < 0;
    bool _3078 = _3076 || _2994;
    float _3080 = as_type<float>(_3074);
    float _3082 = _3030;
    if (_2968)
    {
        _3080 = _2996;
    }
    float _3084 = _3080;
    int _3086 = _2956 + 96;
    uint _3088 = uint(int(uint(_3086) >> uint(2)));
    uint _3090 = uint(int(uint(int(_3088)) >> uint(2)));
    int _3092 = int(_3088) & 3;
    float _3094 = (*spvDescriptorSet0.vp_c15)._m0[int(_3090)][_3092];
    int _3096 = int(_3088) + 1;
    uint _3098 = uint(int(uint(_3096) >> uint(2)));
    int _3100 = _3096 & 3;
    float _3102 = (*spvDescriptorSet0.vp_c15)._m0[int(_3098)][_3100];
    bool _3104 = _3054 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3106 = _3104 || _3078;
    int _3108 = _2956 + 104;
    uint _3110 = uint(int(uint(_3108) >> uint(2)));
    uint _3112 = uint(int(uint(int(_3110)) >> uint(2)));
    int _3114 = int(_3110) & 3;
    float _3116 = (*spvDescriptorSet0.vp_c15)._m0[int(_3112)][_3114];
    int _3118 = int(_3110) + 1;
    uint _3120 = uint(int(uint(_3118) >> uint(2)));
    int _3122 = _3118 & 3;
    float _3124 = (*spvDescriptorSet0.vp_c15)._m0[int(_3120)][_3122];
    float _3126 = _3084;
    if (!_2968)
    {
        float _3128 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3130 = _1119 + _3128;
        float _3132 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3134 = _1027 + _3132;
        float _3136 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3138 = _3130 * _3130;
        float _3140 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3142 = _1029 + _3140;
        float _3144 = fma(_3134, _3134, _3138);
        float _3146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3148 = fma(_3142, _3142, _3144);
        float _3150 = sqrt(_3148);
        float _3152 = _3136 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3154 = precise::min(_3150, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3156 = _3154 * _3146;
        float _3158 = -_1119;
        float _3160 = _3158 + _2886;
        float _3162 = -_1027;
        float _3164 = _3162 + _2996;
        float _3166 = _3152 * _3156;
        float _3168 = -_1029;
        float _3170 = _3168 + _2998;
        float _3172 = fma(_3160, _3166, _1119);
        float _3174 = fma(_3164, _3166, _1027);
        float _3176 = fma(_3170, _3166, _1029);
        _3028 = _3172;
        _3126 = _3174;
        _3082 = _3176;
    }
    float _3178 = _3028;
    float _3180 = _3126;
    float _3182 = _3082;
    float _3184 = _2892 * _3102;
    float _3186 = _3178 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _3188 = as_type<int>(_3184);
    if (!_3106)
    {
        int _3190 = _3054 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3192 = _3190 + _2942;
        _1129 = _3192;
    }
    int _3194 = _1129;
    float _3196 = _2892 * _2990;
    float _3198 = fma(_1027, _3094, _3184);
    float _3200 = fma(_3180, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3186);
    float _3202 = _2892 * _3048;
    float _3204 = fma(_1027, _2982, _3196);
    float _3206 = fma(_1029, _3116, _3198);
    float _3208 = fma(_3182, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3200);
    if (!_3106)
    {
        int _3210 = _3194 << 2;
        _3024 = _3210;
    }
    int _3212 = _3024;
    float _3214 = fma(_1027, _3040, _3202);
    float _3216 = _3206 + _3124;
    float _3218 = _3208 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _3220 = _3212;
    if (!_3106)
    {
        uint _3222 = uint(int(uint(_3194) >> uint(2)));
        _3188 = int(_3222);
    }
    int _3224 = _3188;
    int _3226 = _2956 + 80;
    uint _3228 = uint(int(uint(_3226) >> uint(2)));
    uint _3230 = uint(int(uint(int(_3228)) >> uint(2)));
    int _3232 = int(_3228) & 3;
    float _3234 = (*spvDescriptorSet0.vp_c15)._m0[int(_3230)][_3232];
    int _3236 = int(_3228) + 1;
    uint _3238 = uint(int(uint(_3236) >> uint(2)));
    int _3240 = _3236 & 3;
    float _3242 = (*spvDescriptorSet0.vp_c15)._m0[int(_3238)][_3240];
    if (!_3106)
    {
        int _3244 = 12 & _3212;
        _3220 = _3244;
    }
    int _3246 = _3220;
    float _3248 = fma(_1029, _3012, _3204);
    float _3250 = 1.0 / _3216;
    float _3252 = fma(_1029, _3064, _3214);
    float _3254 = as_type<float>(_3246);
    if (!_3106)
    {
        int _3256 = _3224 << 4;
        int _3258 = _3256 + _3246;
        _3254 = as_type<float>(_3258);
    }
    float _3260 = _3254;
    float _3262 = _3178 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3264 = _3248 + _3020;
    int _3266 = _2956 + 88;
    uint _3268 = uint(int(uint(_3266) >> uint(2)));
    uint _3270 = uint(int(uint(int(_3268)) >> uint(2)));
    int _3272 = int(_3268) & 3;
    float _3274 = (*spvDescriptorSet0.vp_c15)._m0[int(_3270)][_3272];
    int _3276 = int(_3268) + 1;
    uint _3278 = uint(int(uint(_3276) >> uint(2)));
    int _3280 = _3276 & 3;
    float _3282 = (*spvDescriptorSet0.vp_c15)._m0[int(_3278)][_3280];
    float _3284 = _3252 + _3072;
    float _3286 = fma(_3180, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3262);
    float _3288 = _3178 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3290 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3292 = _3218 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3294 = fma(_3182, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3286);
    float _3296 = fma(_3180, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3288);
    float _3298 = _3260;
    if (!_3106)
    {
        int _3300 = as_type<int>(_3260) + 400;
        uint _3302 = uint(int(uint(_3300) >> uint(2)));
        uint _3304 = uint(int(uint(int(_3302)) >> uint(2)));
        int _3306 = int(_3302) & 3;
        float _3308 = (*spvDescriptorSet0.vp_c15)._m0[int(_3304)][_3306];
        _3298 = _3308;
    }
    float _3310 = _3298;
    float _3312 = -_3292;
    float _3314 = fma(_3312, _3290, 1.0);
    float _3316 = _3178 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3318 = _3264 * _3250;
    float _3320 = _3284 * _3250;
    float _3322 = fma(_3182, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3296);
    float _3324 = _3294 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3326 = fma(_3180, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3316);
    bool _3328 = _3318 >= 0.0;
    float _3330 = _3322 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3332 = _3324 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3334 = fma(_3182, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3326);
    bool _3336 = _3318 <= 1.0;
    bool _3338 = _3336 && _3328;
    float _3340 = as_type<float>(_2942);
    if (!_3106)
    {
        float _3342 = floor(_2992);
        _3340 = _3342;
    }
    float _3344 = _3340;
    float _3346 = fma(_3330, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3332);
    float _3348 = _3334 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _3350 = _3320 >= 0.0;
    bool _3352 = _3350 && _3338;
    float _3354 = _3324 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3356 = fma(_3218, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3346);
    float _3358 = _3324 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    bool _3360 = _3320 <= 1.0;
    bool _3362 = _3360 && _3352;
    float _3364 = log2(_3314);
    float _3366 = fma(_3348, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3356);
    float _3368 = fma(_3330, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3358);
    float _3370 = fma(_3330, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3354);
    float _3372 = 1.0 / _3366;
    float _3374 = _3344;
    float _3376 = _3356;
    if (!_3106)
    {
        float _3378 = -_3344;
        float _3380 = _2992 + _3378;
        _3374 = _3380;
    }
    float _3382 = _3374;
    float _3384 = _2892 * _3242;
    if (_3362)
    {
        float _3386 = float(_2952);
        _3376 = _3386;
    }
    float _3388 = _3376;
    float _3390 = fma(_3218, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3370);
    float _3392 = fma(_1027, _3234, _3384);
    float _3394 = _2886;
    float _3396 = _3390;
    if (!_3106)
    {
        float _3398 = floor(_2920);
        _3394 = _3398;
    }
    float _3400 = _3394;
    float _3402 = fma(_3218, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3368);
    float _3404 = fma(_3348, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3390);
    float _3406 = fma(_1029, _3274, _3392);
    float _3408 = _3364 * 0.693147182464599609375;
    float _3410 = fma(_3348, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3402);
    float _3412 = _3406 + _3282;
    float _3414 = _3388;
    float _3416 = _3408;
    if (_3362)
    {
        float _3418 = rint(_3388);
        float _3420 = precise::max(_3418, 0.0);
        uint _3422 = uint(_3420);
        uint _3424 = clamp(_3422, 0u, 65535u);
        _3414 = as_type<float>(_3424);
    }
    float _3426 = _3414;
    float _3428 = _3410 * _3372;
    float _3430 = _3404 * _3372;
    float _3432 = _3412 * _3250;
    float _3434 = _3408 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3436 = fma(_3428, 0.5, 0.5);
    float _3438 = fma(_3430, -0.5, 0.5);
    float _3440 = _3392;
    float _3442 = _3434;
    float _3444 = _3436;
    if (!_3106)
    {
        float _3446 = rint(_3310);
        float _3448 = precise::max(_3446, 0.0);
        uint _3450 = uint(_3448);
        uint _3452 = clamp(_3450, 0u, 65535u);
        _3440 = as_type<float>(_3452);
    }
    float _3454 = _3440;
    if (!_3106)
    {
        float _3456 = -_3400;
        float _3458 = _2920 + _3456;
        _3416 = _3458;
    }
    float _3460 = _3416;
    float _3462 = _3426;
    if (_3362)
    {
        float3 _9441 = float3(_3318, _3320, float(as_type<int>(_3426)));
        float3 _9445 = select(_9441, float3(0.0), isnan(_9441));
        float _3464 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9445.xy, uint(rint(_9445.z)), _3432, level(0.0));
        _3462 = _3464;
    }
    float _3466 = _3462;
    float3 _9455 = float3(_3436, _3438, _3434);
    float _3468 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9455, float3(0.0), isnan(_9455)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9455, float3(0.0), isnan(_9455)), level(0.0)).x;
    float3 _9464 = float3(_3436, _3438, _3434);
    float4 _3471 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9464, float3(0.0), isnan(_9464)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9464, float3(0.0), isnan(_9464)), level(0.0)).xyzw;
    float _3473 = _3471.x;
    float _3475 = _3471.y;
    float _3477 = _3471.z;
    float _3479 = _3471.w;
    float _3481 = _3382;
    if (!_3106)
    {
        float3 _9487 = float3(_3460, _3382, float(as_type<int>(_3454)));
        float3 _9489 = select(_9487, float3(0.0), isnan(_9487));
        float _3483 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9489.xy, uint(rint(_9489.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9489.xy, uint(rint(_9489.z)), level(0.0)).x;
        _3481 = _3483;
    }
    float _3485 = _3481;
    if (_3106)
    {
        _3396 = 1.0;
    }
    float _3487 = _3396;
    float _3489 = _3487;
    if (!_3106)
    {
        int _3491 = _3194 << 4;
        int _3493 = _3491 + 2048;
        uint _3495 = uint(int(uint(_3493) >> uint(2)));
        uint _3497 = uint(int(uint(int(_3495)) >> uint(2)));
        int _3499 = int(_3495) & 3;
        float _3501 = (*spvDescriptorSet0.vp_c15)._m0[int(_3497)][_3499];
        int _3503 = int(_3495) + 1;
        uint _3505 = uint(int(uint(_3503) >> uint(2)));
        int _3507 = _3503 & 3;
        float _3509 = (*spvDescriptorSet0.vp_c15)._m0[int(_3505)][_3507];
        int _3511 = _3493 + 8;
        uint _3513 = uint(int(uint(_3511) >> uint(2)));
        uint _3515 = uint(int(uint(int(_3513)) >> uint(2)));
        int _3517 = int(_3513) & 3;
        float _3519 = (*spvDescriptorSet0.vp_c15)._m0[int(_3515)][_3517];
        int _3521 = int(_3513) + 1;
        uint _3523 = uint(int(uint(_3521) >> uint(2)));
        int _3525 = _3521 & 3;
        float _3527 = (*spvDescriptorSet0.vp_c15)._m0[int(_3523)][_3525];
        float _3529 = _2892 * _3509;
        float _3531 = fma(_1027, _3501, _3529);
        float _3533 = fma(_1029, _3519, _3531);
        float _3535 = _3533 + _3527;
        float _3537 = precise::clamp(_3535, 0.0, 1.0);
        float _3539 = -_3537;
        float _3541 = _3539 + _3485;
        float _3543 = fma(_3541, 500.0, 1.5);
        float _3545 = exp2(_3543);
        float _3547 = 0.0 + _3545;
        float _3549 = precise::clamp(_3547, 0.0, 1.0);
        _3442 = _3509;
        _3489 = _3549;
    }
    float _3551 = _3442;
    float _3553 = _3489;
    float _3555 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3557 = _3178 + _3555;
    float _3559 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3561 = _3180 + _3559;
    float _3563 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3565 = _3182 + _3563;
    float _3567 = _3557 * _3557;
    float _3569 = fma(_3561, _3561, _3567);
    float _3571 = fma(_3565, _3565, _3569);
    float _3573 = rsqrt(_3571);
    float _3575 = _3573 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3577 = _3561 * _3575;
    float _3579 = _3565 * _3575;
    float _3581 = _3577 * _3577;
    float _3583 = _3579 * _3579;
    float _3585 = _3581 + _3583;
    float _3587 = sqrt(_3585);
    bool _3589 = _3587 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3591 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3593 = _3587 + _3591;
    float _3595 = _3569;
    float _3597 = _3593;
    float _3599 = _3551;
    float _3601 = _3557;
    float _3603 = _3581;
    if (_3589)
    {
        float _3605 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3595 = _3605;
    }
    float _3607 = _3595;
    float _3609 = _3607;
    if (_3589)
    {
        float _3611 = _3593 * _3607;
        _3597 = _3611;
    }
    float _3613 = _3597;
    if (_3589)
    {
        float _3615 = rsqrt(_3585);
        _3609 = _3615;
    }
    float _3617 = _3609;
    float _3619 = _3617;
    if (_3589)
    {
        float _3621 = _3613 * 0.15915493667125701904296875;
        _3599 = _3621;
    }
    float _3623 = _3599;
    float _3625 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3627 = _3573;
    if (_3589)
    {
        float _3629 = _3623 * 6.283185482025146484375;
        float _3631 = sin(_3629);
        _3627 = _3631;
    }
    float _3633 = _3627;
    float _3635 = precise::max(0.0, _3625);
    float _3637 = _3565;
    float _3639 = _3635;
    if (_3589)
    {
        float _3641 = _3623 * 6.283185482025146484375;
        float _3643 = cos(_3641);
        _3637 = _3643;
    }
    float _3645 = _3637;
    float _3647 = -_3575;
    float _3649 = -_3635;
    float _3651 = fma(_3557, _3647, _3649);
    if (_3589)
    {
        float _3653 = _3651 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3601 = _3653;
    }
    float _3655 = _3601;
    float _3657 = _3633;
    float _3659 = _3655;
    if (_3589)
    {
        float _3661 = fma(_3633, _3655, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3657 = _3661;
    }
    float _3663 = _3657;
    float _3665 = _3663;
    if (!_3589)
    {
        _3659 = _3651;
    }
    float _3667 = _3659;
    float _3669 = _3667;
    if (_3589)
    {
        float _3671 = _3617 * _3663;
        _3444 = _3671;
    }
    float _3673 = _3444;
    if (!_3589)
    {
        _3665 = _3577;
    }
    float _3675 = _3665;
    float _3677 = _3675;
    if (_3589)
    {
        float _3679 = _3645 + (-1.0);
        _3639 = _3679;
    }
    float _3681 = _3639;
    float _3683 = _3681;
    if (_3589)
    {
        float _3685 = _3577 * _3673;
        _3677 = _3685;
    }
    float _3687 = _3677;
    if (_3589)
    {
        float _3689 = _3681 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3619 = _3689;
    }
    float _3691 = _3619;
    float _3693 = _3691;
    if (!_3589)
    {
        _3683 = _3579;
    }
    float _3695 = _3683;
    float _3697 = _3695;
    if (_3589)
    {
        float _3699 = _3579 * _3673;
        _3697 = _3699;
    }
    float _3701 = _3697;
    if (_3589)
    {
        float _3703 = _3687 * _3687;
        _3603 = _3703;
    }
    float _3705 = _3603;
    if (_3589)
    {
        float _3707 = fma(_3651, _3645, _3691);
        _3669 = _3707;
    }
    float _3709 = _3669;
    if (!_3589)
    {
        _3693 = _3583;
    }
    float _3711 = _3693;
    float _3713 = _3711;
    if (_3589)
    {
        float _3715 = _3701 * _3701;
        _3713 = _3715;
    }
    float _3717 = _3713;
    float _3719 = sqrt(_3571);
    float _3721 = fma(_3709, _3709, _3705);
    float _3723 = _3721 + _3717;
    float _3725 = rsqrt(_3723);
    float _3727 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3729 = fma(_3719, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3727);
    float _3731 = precise::clamp(_3729, 0.0, 1.0);
    float _3733 = -_3731;
    float _3735 = _3733 + 1.0;
    float _3737 = _3725 * _3687;
    float _3739 = _3725 * _3709;
    float _3741 = _3725 * _3701;
    float _3743 = _3737 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3745 = _3739 + 1.0;
    float _3747 = abs(_3735);
    float _3749 = log2(_3747);
    float _3751 = -_3743;
    float _3753 = fma(_3739, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3751);
    float _3755 = -_3741;
    float _3757 = fma(_3755, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3753);
    float _3759 = fma(_3757, -0.5, 0.5);
    float _3761 = fma(_3757, 0.5, 0.5);
    float _3763 = fma(_3761, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3765 = _3749 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3767 = sqrt(_3759);
    float _3769 = fma(_3761, _3763, -0.212114393711090087890625);
    float _3771 = fma(_3761, _3769, 1.570728778839111328125);
    float _3773 = exp2(_3765);
    float _3775 = _3767 * 0.636619746685028076171875;
    float _3777 = -_3771;
    float _3779 = fma(_3775, _3777, 1.0);
    float _3781 = -_3739;
    float _3783 = fma(_3773, _3745, _3781);
    float _3785 = fma(_3783, 0.5, 0.5);
    float2 _9955 = float2(_3779, _3785);
    float3 _3787 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9955, float2(0.0), isnan(_9955)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9955, float2(0.0), isnan(_9955)), level(0.0)).xyz;
    float _3789 = _3787.x;
    float _3791 = _3787.y;
    float _3793 = _3787.z;
    float _3795 = abs(_2928);
    float _3797 = log2(_3795);
    float _3799 = -_2866;
    float _3801 = _3799 + 1.0;
    out.m_90.x = _3180;
    out.m_90.y = _3178;
    out.m_90.z = _3182;
    bool _3803 = _2928 <= 8000.0;
    bool _3805 = isnan(_2928);
    bool _3807 = _3803 || _3805;
    bool _3809 = isnan(8000.0);
    bool _3811 = _3807 || _3809;
    float _3813 = float(_3811);
    float _3815 = _3797 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3817 = _3324 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3819 = fma(_3330, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3817);
    float _3821 = exp2(_3815);
    float _3823 = fma(_3218, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3819);
    float _3825 = fma(_3348, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3823);
    float _3827 = fma(_3821, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3829 = precise::clamp(_3827, 0.0, 1.0);
    float _3831 = fma(_3829, -2.0, 3.0);
    float _3833 = _3829 * _3829;
    float _3835 = _3833 * _3831;
    float _3837 = _3749 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3839 = _3825 + _3366;
    float _3841 = -_3835;
    float _3843 = _3841 + 1.0;
    float _3845 = _3839 * 0.5;
    float _3847 = exp2(_3837);
    float _3849 = fma(_3843, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3835);
    out.m_92.z = _3845;
    out.m_92.w = _3366;
    float _3851 = _3813 * _3849;
    float _3853 = _3813;
    float _3855 = _3825;
    float _3857 = _3410;
    float _3859 = _3801;
    if (!_3362)
    {
        _3853 = 1.0;
    }
    float _3861 = _3853;
    float _3863 = _3861;
    if (_3362)
    {
        bool _3865 = _3466 >= _3432;
        bool _3867 = isnan(_3466);
        bool _3869 = _3865 || _3867;
        bool _3871 = isnan(_3432);
        bool _3873 = _3869 || _3871;
        float _3875 = float(_3873);
        _3863 = _3875;
    }
    float _3877 = _3863;
    float _3879 = _3851 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _3410;
    out.gl_Position.y = _3404;
    out.gl_Position.z = _3825;
    out.gl_Position.w = _3366;
    bool _3881 = _3719 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3883 = isnan(_3719);
    bool _3885 = _3881 || _3883;
    bool _3887 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3889 = _3885 || _3887;
    float _3891 = _3801 * _3879;
    float _3893 = precise::clamp(_3891, 0.0, 1.0);
    float _3895 = _3877 * _3553;
    float _3897 = -_3847;
    float _3899 = _3897 + 1.0;
    float _3901 = -_3893;
    float _3903 = fma(_3901, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3905 = _3899 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3907 = -_3895;
    float _3909 = fma(_3907, _3903, 1.0);
    float _3911 = precise::clamp(_3909, 0.0, 1.0);
    float _3913 = _3905 * _3468;
    float _3915 = -_3905;
    float _3917 = _3915 + 1.0;
    float _3919 = _3911 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3921 = _3911;
    if (!_3889)
    {
        _3855 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3923 = _3855;
    float _3925 = _3479 * _3913;
    float _3927 = _3479 * _3917;
    float _3929 = _3923;
    float _3931 = _3923;
    if (!_3889)
    {
        _3857 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3933 = _3857;
    out.m_94.x = _3919;
    float _3935 = _3933;
    float _3937 = _3933;
    if (!_3889)
    {
        _3921 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3939 = _3921;
    float _3941 = _3939;
    float _3943 = _3939;
    if (!_3889)
    {
        _3859 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3945 = _3859;
    float _3947 = _3793 * _3913;
    float _3949 = fma(_3789, _3925, _3473);
    float _3951 = fma(_3791, _3925, _3475);
    float _3953 = _3791;
    float _3955 = _3789;
    float _3957 = _3945;
    float _3959 = _3945;
    if (!_3889)
    {
        _3953 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3961 = _3953;
    float _3963 = fma(_3479, _3947, _3477);
    float _3965 = _3961;
    float _3967 = _3961;
    if (!_3889)
    {
        _3955 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3969 = _3955;
    out.m_96.x = _3949;
    out.m_96.y = _3951;
    out.m_96.z = _3963;
    out.m_96.w = _3927;
    bool _3971 = !_3889;
    float _3973 = _3969;
    float _3975 = _3969;
    if (!_3971)
    {
        bool _3977 = _3719 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3979 = isnan(_3719);
        bool _3981 = _3977 || _3979;
        bool _3983 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3985 = _3981 || _3983;
        if (!_3985)
        {
            float _3987 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3989 = _3719 + _3987;
            float _3991 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3993 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3991;
            float _3995 = 1.0 / _3993;
            float _3997 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3999 = _3997 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4001 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4003 = _4001 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4005 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4007 = _4005 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4009 = _3989 * _3995;
            float _4011 = precise::clamp(_4009, 0.0, 1.0);
            float _4013 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4015 = _4013 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4017 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4019 = _4017 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4021 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4023 = _4021 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4025 = fma(_4011, _4007, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            float _4027 = fma(_4011, _4015, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4029 = fma(_4011, _4019, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4031 = fma(_4011, _4023, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4033 = fma(_4011, _3999, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4035 = fma(_4011, _4003, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            _3937 = _4029;
            _3967 = _4035;
            _3931 = _4027;
            _3959 = _4033;
            _3943 = _4031;
            _3975 = _4025;
            _4037 = true;
        }
        else
        {
            bool _4039 = _3719 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4041 = isnan(_3719);
            bool _4043 = _4039 || _4041;
            bool _4045 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4047 = _4043 || _4045;
            if (!_4047)
            {
                _3929 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4049 = _3929;
            _3931 = _4049;
            if (!_4047)
            {
                _3935 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4051 = _3935;
            _3937 = _4051;
            if (!_4047)
            {
                _3941 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4053 = _3941;
            _3943 = _4053;
            if (!_4047)
            {
                _3957 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4055 = _3957;
            _3959 = _4055;
            if (!_4047)
            {
                _3965 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4057 = _3965;
            _3967 = _4057;
            if (!_4047)
            {
                _3973 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4059 = _3973;
            bool _4061 = !_4047;
            _3975 = _4059;
            if (!_4061)
            {
                bool _4063 = _3719 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4065 = isnan(_3719);
                bool _4067 = _4063 || _4065;
                bool _4069 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4071 = _4067 || _4069;
                if (!_4071)
                {
                    float _4073 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4075 = _3719 + _4073;
                    float _4077 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4079 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4077;
                    float _4081 = 1.0 / _4079;
                    float _4083 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4085 = _4083 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4087 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4089 = _4087 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4091 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4093 = _4091 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4095 = _4075 * _4081;
                    float _4097 = precise::clamp(_4095, 0.0, 1.0);
                    float _4099 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4101 = _4099 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4103 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4105 = _4103 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4107 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4109 = _4107 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4111 = fma(_4097, _4093, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    float _4113 = fma(_4097, _4101, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4115 = fma(_4097, _4105, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4117 = fma(_4097, _4109, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4119 = fma(_4097, _4085, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4121 = fma(_4097, _4089, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    _3937 = _4115;
                    _3967 = _4121;
                    _3931 = _4113;
                    _3959 = _4119;
                    _3943 = _4117;
                    _3975 = _4111;
                    _4037 = true;
                }
                else
                {
                    _3937 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3967 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3931 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3959 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3943 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3975 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4037 = false;
    float _4123 = _3937;
    float _4125 = _3967;
    float _4127 = _3931;
    float _4129 = _3959;
    float _4131 = _3943;
    float _4133 = _3975;
    float _4135 = fma(_2778, -0.5, 0.5);
    float _4137 = precise::clamp(_4135, 0.0, 1.0);
    float _4139 = -_4123;
    float _4141 = _4139 + _4125;
    float _4143 = -_4127;
    float _4145 = _4143 + _4129;
    float _4147 = -_4131;
    float _4149 = _4147 + _4133;
    bool _4151 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4153 = fma(_4137, _4141, _4123);
    float _4155 = fma(_4137, _4145, _4127);
    float _4157 = fma(_4137, _4149, _4131);
    float _4159 = _4153 * 0.586610972881317138671875;
    out.m_63.x = 1.0;
    float _4161 = fma(_4155, 0.298911988735198974609375, _4159);
    float _4163 = fma(_4157, 0.114477999508380889892578125, _4161);
    out.m_98.x = 0.0;
    float _4165 = -_4163;
    float _4167 = _4155 + _4165;
    float _4169 = -_4163;
    float _4171 = _4153 + _4169;
    float _4173 = -_4163;
    float _4175 = _4157 + _4173;
    float _4177 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4179 = fma(_4167, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4163);
    float _4181 = fma(_4171, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4163);
    float _4183 = fma(_4175, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4163);
    out.m_94.w = _4177;
    out.m_100.x = _4179;
    out.m_100.y = _4181;
    out.m_100.z = _4183;
    if (!_4151)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4185 = -_3178;
    float _4187 = _4185 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4189 = -_3180;
    float _4191 = _4189 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4193 = -_3182;
    float _4195 = _4193 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4197 = _4187 * _4187;
    float _4199 = fma(_4191, _4191, _4197);
    float _4201 = fma(_4195, _4195, _4199);
    float _4203 = sqrt(_4201);
    float _4205 = rsqrt(_4201);
    float _4207 = -_4203;
    float _4209 = _4207 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4211 = _4209 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4213 = precise::clamp(_4211, 0.0, 1.0);
    float _4215 = _4191 * _4205;
    float _4217 = _4187 * _4205;
    float _4219 = abs(_4213);
    float _4221 = log2(_4219);
    float _4223 = _4195 * _4205;
    float _4225 = _4215 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4227 = _2778 * _4217;
    float _4229 = -_4217;
    float _4231 = -_4225;
    float _4233 = fma(_4229, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4231);
    float _4235 = fma(_2768, _4215, _4227);
    float _4237 = -_4223;
    float _4239 = fma(_4237, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4233);
    float _4241 = fma(_2780, _4223, _4235);
    float _4243 = precise::clamp(_4241, 0.0, 1.0);
    float _4245 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4247 = _4239 + _4245;
    float _4249 = _4221 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4251 = _4247 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4253 = precise::clamp(_4251, 0.0, 1.0);
    float _4255 = exp2(_4249);
    float _4257 = _4255 * _4253;
    float _4259 = _4243 * _4257;
    float _4261 = _4259 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4263 = _4259 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4265 = _4259 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_98.x = _4261;
    out.m_98.y = _4263;
    out.m_98.z = _4265;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4037 = false;
    bool _2818 = false;
    bool _215 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _114 = in.m_60.w;
    float _116 = trunc(_114);
    int _119 = int(_116);
    bool _123 = _119 >= 1;
    float _125 = 0.0;
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    float _129 = _127;
    if (!_123)
    {
        out.m_63.x = 0.0;
    }
    int _131 = 0;
    if (!_123)
    {
        float _133 = _127 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    int _137 = _135;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4322 = as_type<float>(_135);
        out.gl_Position.z = _4322;
    }
    if (!_123)
    {
        return out;
    }
    float _139 = in.m_65.w;
    bool _141 = _139 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_139);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = -_139;
    float _153 = _151 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _155 = _153;
    if (_149)
    {
        float _157 = float(_119);
        _129 = _157;
    }
    float _159 = _129;
    bool _161 = _153 >= _159;
    bool _163 = !_149;
    bool _165 = _161 || _163;
    float _167 = _159;
    if (_165)
    {
        _167 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _167;
    if (_165)
    {
        out.m_63.x = 0.0;
    }
    if (_165)
    {
        float _171 = _169 * 5.0;
        _137 = as_type<int>(_171);
    }
    int _173 = _137;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4392 = as_type<float>(_173);
        out.gl_Position.z = _4392;
    }
    if (_165)
    {
        return out;
    }
    float _175 = as_type<float>(int(gl_VertexIndex));
    bool _177 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _179 = as_type<int>(_175) & 1;
    bool _181 = _179 != 0;
    int _183 = as_type<int>(_175) & 2;
    bool _185 = _183 != 0;
    bool _187 = !_181;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_185;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_177;
    float _213;
    if (!_195)
    {
        float _197 = in.m_70.x;
        float _199 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _201 = _197 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _203 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[12].x, _153);
        float _205 = _203 * _199;
        float _207 = floor(_205);
        float _209 = -_207;
        float _211 = _205 + _209;
        _213 = _211;
        _215 = true;
    }
    else
    {
        float _217 = float(_119);
        float _219 = 1.0 / _217;
        float _221 = _153 * _219;
        _213 = _221;
    }
    _215 = false;
    float _223 = _213;
    float _225 = in.m_70.x;
    float _227 = in.m_70.y;
    float _229 = in.m_70.z;
    float _231 = in.m_70.w;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _235 = _223 + _233;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _239 = _223 + _237;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _241;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _247 = _245 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _251 = _223 + _249;
    float _253 = 1.0 / _243;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _255;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _261 = _259 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _263 = 1.0 / _247;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _269 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _271 = _269 != 0;
    float _273 = _225 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _275 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _277 = _275 != 0;
    int _279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _281 = _279 != 0;
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _285 = _283 != 0;
    float _287 = 1.0 / _257;
    float _289 = _227 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _291 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _293 = isnan(_223);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    bool _303 = !_281;
    int _305 = _303 ? 0 : 1;
    float _307 = fma(_289, -2.0, _267);
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _311 = _223 + _309;
    bool _313 = !_277;
    int _315 = _313 ? 0 : 1;
    float _317 = 1.0 / _261;
    float _319 = -_265;
    float _321 = fma(_273, 2.0, _319);
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _323;
    float _327 = _311 * _263;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _331 = _223 + _329;
    float _333 = _229 + _225;
    float _335 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[76].y, _307);
    float _337 = 1.0 / _325;
    float _339 = _225 * 2.0;
    float _341 = _331 * _253;
    float _343 = _333 + (-1.0);
    float _345 = _225 + _227;
    float _347 = _239 * _287;
    float _349 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _351 = floor(_339);
    float _353 = _227 * 2.0;
    float _355 = _345 + (-1.0);
    float _357 = _229 * 2.0;
    float _359 = _235 * _317;
    float _361 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _363 = _229 + _227;
    float _365 = floor(_353);
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _367;
    float _371 = _363 + (-1.0);
    bool _373 = !_285;
    int _375 = _373 ? 0 : 1;
    float _377 = _251 * _337;
    float _379 = fma(_369, _341, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _381 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _383 = floor(_357);
    bool _385 = _351 > 0.0;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _387;
    bool _391 = _351 >= 0.0;
    bool _393 = isnan(_351);
    bool _395 = _391 || _393;
    bool _397 = isnan(0.0);
    bool _399 = _395 || _397;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _405 = fma(_389, _341, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _407 = _399 ? 0 : 1;
    float _409 = -_301;
    float _411 = _409 + 1.0;
    bool _413 = _365 > 0.0;
    float _415 = fma(_403, _327, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _417 = _365 >= 0.0;
    bool _419 = isnan(_365);
    bool _421 = _417 || _419;
    bool _423 = isnan(0.0);
    bool _425 = _421 || _423;
    bool _427 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _429 = isnan(_223);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    int _439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _441 = _439 != 0;
    int _443 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _445 = _443 != 0;
    int _447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _449 = _447 != 0;
    int _451 = ~_407;
    int _453 = _451 + 1;
    int _455 = _453 + 1;
    float _457 = _437 * _411;
    int _459 = _455;
    int _461 = as_type<int>(_337);
    if (!_385)
    {
        int _463 = ~_407;
        int _465 = _463 + 1;
        _459 = _465;
    }
    int _467 = _459;
    float _469 = -_437;
    float _471 = _469 + 1.0;
    bool _473 = !_441;
    float _475 = _473 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _477 = _383 > 0.0;
    bool _479 = _383 >= 0.0;
    bool _481 = isnan(_383);
    bool _483 = _479 || _481;
    bool _485 = isnan(0.0);
    bool _487 = _483 || _485;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _491 = _489 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _493 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _495 = isnan(_223);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    bool _505 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _507 = isnan(_223);
    bool _509 = _505 || _507;
    bool _511 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _513 = _509 || _511;
    float _515 = float(_513);
    float _517 = fma(_491, _327, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _519 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _521 = isnan(_223);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = _503 * _471;
    bool _533 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _535 = isnan(_223);
    bool _537 = _533 || _535;
    bool _539 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _541 = _537 || _539;
    float _543 = float(_541);
    float _545 = -_515;
    float _547 = _545 + 1.0;
    float _549 = -_503;
    float _551 = _549 + 1.0;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _553;
    float _557 = _543 * _547;
    float _559 = _515 * _551;
    float _561 = -_543;
    float _563 = _561 + 1.0;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _567 = _565 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _573 = fma(_555, _347, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _575 = _529 * _563;
    float _577 = fma(_567, _359, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _579 = fma(_571, _359, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _581 = _567;
    float _583 = _475;
    if (_271)
    {
        _461 = 0;
    }
    int _585 = _461;
    float _587 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _589 = log2(_587);
    int _591 = _585;
    if (!_271)
    {
        _591 = 1;
    }
    int _593 = _591;
    float _595 = -_529;
    float _597 = _595 + 1.0;
    int _599 = _487 ? 0 : 1;
    float _601 = _405 * _575;
    bool _603 = _593 != 1;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _605;
    float _609 = float(_119);
    float _611 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _613 = int(_611);
    int _615 = ~_599;
    int _617 = _615 + 1;
    int _619 = _617 + 1;
    float _621 = fma(_607, _347, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _623 = _379 * _575;
    int _625 = _619;
    float _627 = _601;
    if (!_477)
    {
        int _629 = ~_599;
        int _631 = _629 + 1;
        _625 = _631;
    }
    int _633 = _625;
    float _635 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[143].y, _601);
    float _637 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[143].x, _623);
    float _639 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _641 = int(_639);
    float _643 = _589 * _153;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_603)
    {
        _581 = _227;
    }
    float _647 = _581;
    float _649 = fma(_415, _557, _635);
    float _651 = _647;
    if (_603)
    {
        _651 = _225;
    }
    float _653 = _651;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _657 = 1.0 / _609;
    float _659 = float(_633);
    float _661 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[83].z, _645);
    float _663 = float(_613);
    float _665 = exp2(_643);
    int _667 = abs(as_type<int>(_475));
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _671 = 1.0 + _669;
    if (!_603)
    {
        _583 = _229;
    }
    float _673 = _583;
    float _675 = float(_667);
    float _677 = _673;
    if (_603)
    {
        _677 = _227;
    }
    float _679 = _677;
    float _681 = 1.0 / _663;
    float _683 = float(_641);
    float _685 = _675 * _659;
    float _687 = as_type<float>(_641);
    if (!_603)
    {
        _627 = _227;
    }
    float _689 = _627;
    float _691 = in.m_72.x;
    float _693 = in.m_72.y;
    float _695 = in.m_72.z;
    float _697 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[83].w, _655);
    float _699 = _657 * _153;
    float _701 = 1.0 / _683;
    float _703 = _689;
    if (_603)
    {
        _703 = _225;
    }
    float _705 = _703;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (!_603)
    {
        _687 = _229;
    }
    float _709 = _687;
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _713 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _715 = isnan(0.0);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _721 = _717 || _719;
    float _723 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[78].z, _707);
    float _725 = -_665;
    float _727 = _725 + 1.0;
    float _729 = 1.0 / _671;
    float _731 = _705 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _733 = _709;
    if (_603)
    {
        _733 = _227;
    }
    float _735 = _733;
    float _737 = -_153;
    float _739 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[76].x, _321);
    float _741 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].z, _723);
    bool _743 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _745 = isnan(1.0);
    bool _747 = _743 || _745;
    bool _749 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _751 = _747 || _749;
    float _753 = -_711;
    float _755 = fma(_731, 2.0, _753);
    bool _757 = !_445;
    int _759 = _757 ? 0 : 1;
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _763 = _721 ? _727 : 0.0;
    float _765 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[82].w, _697);
    float _767 = _735 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _771 = !_449;
    int _773 = _771 ? 0 : 1;
    float _775 = -_153;
    float _777 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[81].x, _755);
    int _779 = abs(_759);
    float _781 = _685 * (-2.0);
    float _783 = fma(_767, -2.0, _761);
    float _785 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[78].w, _769);
    int _787 = abs(_773);
    float _789 = fma(_781, _691, _691);
    float _791 = float(_467);
    float _793 = _681 * _153;
    float _795 = float(_779);
    float _797 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[82].z, _661);
    float _799 = _701 * _153;
    float _801 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].w, _785);
    float _803 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[81].y, _783);
    float _805 = _783;
    if (_751)
    {
        float _807 = _763 * _729;
        _155 = _807;
    }
    float _809 = _155;
    float _811 = _225 + (-0.5);
    float _813 = _795 * _791;
    int _815 = _425 ? 0 : 1;
    float _817 = fma(_361, _781, _361);
    float _819 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[196].x, _789);
    float _821 = _813 * (-2.0);
    int _823 = ~_815;
    int _825 = _823 + 1;
    int _827 = _825 + 1;
    float _829 = _227 + (-0.5);
    int _831 = _827;
    if (!_413)
    {
        int _833 = ~_815;
        int _835 = _833 + 1;
        _831 = _835;
    }
    int _837 = _831;
    float _839 = fma(_821, _693, _693);
    float _841 = fma(_817, _809, _819);
    float _843 = float(_837);
    float _845 = fma(_381, _821, _381);
    float _847 = float(_787);
    float _849 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[196].y, _839);
    float _851 = _841 * 0.15915493667125701904296875;
    float _853 = _847 * _843;
    float _855 = fma(_517, _557, _637);
    float _857 = fma(_845, _809, _849);
    float _859 = fma(_621, _559, _649);
    float _861 = in.m_74.x;
    float _863 = in.m_74.y;
    float _865 = _853 * (-2.0);
    float _867 = _857 * 0.15915493667125701904296875;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _869;
    float _873 = _229 + (-0.5);
    float _875 = fma(_865, _695, _695);
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _877;
    float _881 = fma(_573, _559, _855);
    float _883 = fma(_579, _531, _859);
    float _885 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[196].z, _875);
    float _887 = fma(_871, _377, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _889 = fma(_879, _377, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _891 = fma(_577, _531, _881);
    float _893 = fma(_349, _865, _349);
    float _895 = _851 * 6.283185482025146484375;
    float _897 = sin(_895);
    float _899 = fma(_889, _457, _883);
    float _901 = fma(_887, _457, _891);
    float _903 = fma(_893, _809, _885);
    float _905 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _189);
    float _907 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[148].y, _899);
    float _909 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[148].x, _901);
    float _911 = _903 * 0.15915493667125701904296875;
    float _913 = _851 * 6.283185482025146484375;
    float _915 = cos(_913);
    float _917 = _907 * _863;
    float _919 = _909 * _861;
    float _921 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _193);
    float _923 = _917 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _925 = _919 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _927 = _867 * 6.283185482025146484375;
    float _929 = sin(_927);
    float _931 = _923 * _921;
    float _933 = _925 * _905;
    float _935 = in.m_60.x;
    float _937 = in.m_60.y;
    float _939 = in.m_60.z;
    float _941 = _867 * 6.283185482025146484375;
    float _943 = cos(_941);
    float _945 = _911 * 6.283185482025146484375;
    float _947 = cos(_945);
    float _949 = _897 * _929;
    float _951 = _915 * _929;
    float _953 = _911 * 6.283185482025146484375;
    float _955 = sin(_953);
    float _957 = _915 * _943;
    float _959 = _897 * _943;
    float _961 = _915 * _947;
    float _963 = _897 * _947;
    float _965 = _943 * _947;
    float _967 = _929 * _947;
    float _969 = _961 * _931;
    float _971 = _963 * _931;
    float _973 = fma(_955, _957, _949);
    float _975 = fma(_955, _949, _957);
    float _977 = -_951;
    float _979 = fma(_955, _959, _977);
    float _981 = -_931;
    float _983 = _955 * _981;
    float _985 = -_959;
    float _987 = fma(_955, _951, _985);
    float _989 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _991 = fma(_973, _933, _969);
    float _993 = fma(_965, _933, _983);
    float _995 = fma(_979, _933, _971);
    float _997 = fma(_987, _989, _991);
    float _999 = fma(_967, _989, _993);
    float _1001 = fma(_975, _989, _995);
    float _1003 = _937 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1005 = _937 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1007 = _997 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1009 = _997 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1011 = fma(_935, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1003);
    float _1013 = fma(_935, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1005);
    float _1015 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1007);
    float _1017 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1009);
    float _1019 = fma(_939, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1011);
    float _1021 = fma(_939, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1013);
    float _1023 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1015);
    float _1025 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1017);
    float _1027 = _1019 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1029 = _1021 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1031 = _1023 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1033 = _1025 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1035 = _937 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1037 = _1027 + _1031;
    float _1039 = _1029 + _1033;
    float _1041 = fma(_935, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1035);
    float _1043 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1045 = _1037 + _1043;
    float _1047 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1049 = _1039 + _1047;
    float _1051 = fma(_939, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1041);
    float _1053 = _1045 * _1045;
    float _1055 = _1049 * _1049;
    float _1057 = _1053 + _1055;
    float _1059 = sqrt(_1057);
    bool _1061 = _1059 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1063 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1065 = _1059 + _1063;
    float _1067 = _865;
    float _1069 = _939;
    float _1071 = _997;
    float _1073 = _1051;
    float _1075 = _1053;
    float _1077 = _1055;
    if (_1061)
    {
        float _1079 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1067 = _1079;
    }
    float _1081 = _1067;
    if (_1061)
    {
        float _1083 = rsqrt(_1057);
        _1069 = _1083;
    }
    float _1085 = _1069;
    float _1087 = _1081;
    if (_1061)
    {
        float _1089 = _1065 * _1081;
        _1087 = _1089;
    }
    float _1091 = _1087;
    float _1093 = _997 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1095 = _1091;
    if (!_1061)
    {
        _1071 = _1039;
    }
    float _1097 = _1071;
    float _1099 = _1097;
    if (_1061)
    {
        float _1101 = _1091 * 0.15915493667125701904296875;
        _1095 = _1101;
    }
    float _1103 = _1095;
    float _1105 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1093);
    float _1107 = _935;
    float _1109 = _1103;
    if (_1061)
    {
        float _1111 = _1103 * 6.283185482025146484375;
        float _1113 = sin(_1111);
        _1107 = _1113;
    }
    float _1115 = _1107;
    float _1117 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1105);
    float _1119 = _1051 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1121 = _1117 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1123 = _1119 + _1121;
    float _1125 = _1121;
    float _1127 = _1123;
    int _1129 = as_type<int>(_1119);
    if (!_1061)
    {
        _1125 = _1037;
    }
    float _1131 = _1125;
    float _1133 = _1131;
    if (_1061)
    {
        float _1135 = _1123 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1073 = _1135;
    }
    float _1137 = _1073;
    float _1139 = _1137;
    if (_1061)
    {
        float _1141 = fma(_1115, _1137, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1139 = _1141;
    }
    float _1143 = _1139;
    float _1145 = _1143;
    if (_1061)
    {
        float _1147 = _1085 * _1143;
        _1145 = _1147;
    }
    float _1149 = _1145;
    if (_1061)
    {
        float _1151 = fma(_1045, _1149, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1133 = _1151;
    }
    float _1153 = _1133;
    if (_1061)
    {
        float _1155 = fma(_1049, _1149, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1099 = _1155;
    }
    float _1157 = _1099;
    float _1159 = fma(_1153, 6.2500002968590706586837768554688e-05, 0.5);
    float _1161 = fma(_1157, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5942 = float2(_1159, _1161);
    float3 _1165 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5942, float2(0.0), isnan(_5942)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5942, float2(0.0), isnan(_5942)), level(0.0)).xyz;
    float _1167 = _1165.x;
    float _1169 = _1165.y;
    float _1171 = _1165.z;
    float _1173 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1175 = int(_1173);
    if (_271)
    {
        float _1177 = in.m_70.x;
        _805 = _1177;
    }
    float _1179 = _805;
    int _1181 = abs(_305);
    float _1183 = -_801;
    float _1185 = _1183 + 1.0;
    int _1187 = abs(_315);
    float _1189 = _1179;
    if (!_271)
    {
        float _1191 = in.m_70.y;
        _1189 = _1191;
    }
    float _1193 = _1189;
    float _1195 = -_741;
    float _1197 = _1195 + 1.0;
    float _1199 = trunc(_799);
    int _1201 = int(_1199);
    float _1203 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1205 = float(uint(_1175));
    float _1207 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1209 = int(_1207);
    int _1211 = ~_1175;
    int _1213 = _1211 + 1;
    float _1215 = float(_1175);
    int _1217 = ~_1175;
    int _1219 = _1217 + 1;
    float _1221 = float(uint(_1201));
    float _1223 = 1.0 / _1205;
    bool _1225 = _1175 == 0;
    float _1227 = float(uint(_1209));
    float _1229 = _1205;
    if (_1061)
    {
        float _1231 = _1103 * 6.283185482025146484375;
        float _1233 = cos(_1231);
        _1109 = _1233;
    }
    float _1235 = _1109;
    if (_271)
    {
        _1229 = 1.0;
    }
    float _1237 = _1229;
    float _1239 = _1237;
    if (!_271)
    {
        _1239 = 7.345489978790283203125;
    }
    float _1241 = _1239;
    int _1243 = ~_1209;
    int _1245 = _1243 + 1;
    int _1247 = as_type<int>(_1223) + (-2);
    float _1249 = 1.0 / _1227;
    float _1251 = _1241 * _225;
    bool _1253 = _1209 == 0;
    float _1255 = as_type<float>(_1247) * _1221;
    float _1257 = trunc(_793);
    int _1259 = int(_1257);
    float _1261 = trunc(_1255);
    float _1263 = precise::max(_1261, 0.0);
    uint _1266 = uint(_1263);
    float _1268 = floor(_1251);
    int _1270 = _1213 * int(_1266);
    int _1272 = _1270 + _1201;
    float _1274 = float(uint(_1272));
    int _1276 = as_type<int>(_1249) + (-2);
    float _1278 = -_1268;
    float _1280 = _1251 + _1278;
    float _1282 = float(uint(_1259));
    float _1284 = as_type<float>(_1247) * _1274;
    float _1286 = float(_1201);
    float _1288 = _1280 * _1215;
    float _1290 = as_type<float>(_1276) * _1282;
    bool _1292 = _1286 >= _1215;
    bool _1294 = isnan(_1286);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan(_1215);
    bool _1300 = _1296 || _1298;
    float _1302 = float(_1300);
    float _1304 = trunc(_1284);
    float _1306 = precise::max(_1304, 0.0);
    uint _1308 = uint(_1306);
    float _1310 = _1215 * _699;
    float _1312 = trunc(_1290);
    float _1314 = precise::max(_1312, 0.0);
    uint _1316 = uint(_1314);
    int _1318 = int(_1266) + int(_1308);
    float _1320 = trunc(_1302);
    int _1322 = int(_1320);
    int _1324 = _1219 * _1318;
    int _1326 = _1324 + _1201;
    int _1328 = _1245 * int(_1316);
    int _1330 = _1328 + _1259;
    float _1332 = as_type<float>(_1245);
    if (_271)
    {
        _1332 = 1.0;
    }
    float _1334 = _1332;
    float _1336 = trunc(_1288);
    int _1338 = int(_1336);
    bool _1340 = uint(_1326) >= uint(_1175);
    float _1342 = float(uint(_1330));
    bool _1344 = !_1340;
    int _1346 = _1344 ? 0 : (-1);
    float _1348 = as_type<float>(_1276) * _1342;
    int _1350 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1352 = _1350 != 0;
    float _1354 = trunc(_1310);
    int _1356 = int(_1354);
    int _1358 = ~_1318;
    int _1360 = _1358 + _1346;
    int _1362 = _1360 + 1;
    bool _1364 = !_1352;
    int _1366 = _1364 ? 0 : 1;
    float _1368 = _1334;
    if (!_271)
    {
        _1368 = 1.2345600128173828125;
    }
    float _1370 = _1368;
    int _1372 = abs(_1366);
    float _1374 = trunc(_1348);
    float _1376 = precise::max(_1374, 0.0);
    uint _1378 = uint(_1376);
    int _1380 = _1175 * _1362;
    int _1382 = _1380 + _1201;
    float _1384 = _1193 * _1370;
    int _1386 = ~_1209;
    int _1388 = _1386 + 1;
    int _1390 = _1338 * _1372;
    int _1392 = _1390 + _1201;
    int _1394 = ~_1322;
    int _1396 = _1394 + 1;
    int _1398 = _1396 + 1;
    bool _1400 = !_1225;
    int _1402 = _1400 ? _1382 : (-1);
    int _1404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1406 = _1404 != 0;
    int _1408 = _1402 * _1398;
    float _1410 = floor(_1384);
    int _1412 = int(_1316) + int(_1378);
    int _1414 = _1175 + (-1);
    int _1416 = _1388 * _1412;
    int _1418 = _1416 + _1259;
    int _1420 = _1322 * _1414;
    int _1422 = _1420 + _1408;
    float _1424 = float(_1209);
    float _1426 = float(_1259);
    int _1428 = _1422 * _1181;
    bool _1430 = uint(_1418) >= uint(_1209);
    float _1432 = -_1410;
    float _1434 = _1384 + _1432;
    bool _1436 = _1426 >= _1424;
    bool _1438 = isnan(_1426);
    bool _1440 = _1436 || _1438;
    bool _1442 = isnan(_1424);
    bool _1444 = _1440 || _1442;
    float _1446 = float(_1444);
    int _1448 = abs(_375);
    float _1450 = trunc(_1446);
    int _1452 = int(_1450);
    bool _1454 = !_1430;
    int _1456 = _1454 ? 0 : (-1);
    int _1458 = _1356 * _1187;
    int _1460 = _1458 + _1428;
    float _1462 = _1434 * _1424;
    int _1464 = ~_1412;
    int _1466 = _1464 + _1456;
    int _1468 = _1466 + 1;
    bool _1470 = !_1406;
    int _1472 = _1470 ? 0 : 1;
    int _1474 = _1392 * _1448;
    int _1476 = _1474 + _1460;
    int _1478 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1480 = _1478 != 0;
    int _1482 = _1209 * _1468;
    int _1484 = _1482 + _1259;
    int _1486 = abs(_1472);
    float _1488 = _1424 * _699;
    bool _1490 = !_1480;
    int _1492 = _1490 ? 0 : 1;
    float _1494 = trunc(_1462);
    int _1496 = int(_1494);
    int _1498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1500 = _1498 != 0;
    int _1502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1504 = _1502 != 0;
    int _1506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1508 = _1506 != 0;
    int _1510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1512 = _1510 != 0;
    int _1514 = _1338 * _1486;
    int _1516 = _1514 + _1476;
    int _1518 = ~_1452;
    int _1520 = _1518 + 1;
    int _1522 = _1520 + 1;
    bool _1524 = !_1253;
    int _1526 = _1524 ? _1484 : (-1);
    bool _1528 = !_1504;
    int _1530 = _1528 ? 0 : 1;
    float _1532 = trunc(_1488);
    int _1534 = int(_1532);
    int _1536 = abs(_1492);
    int _1538 = _1526 * _1522;
    int _1540 = _1209 + (-1);
    bool _1542 = !_1500;
    int _1544 = _1542 ? 0 : 1;
    int _1546 = abs(_1530);
    int _1548 = _1452 * _1540;
    int _1550 = _1548 + _1538;
    float _1552 = float(uint(_1516));
    int _1554 = abs(_1544);
    float _1556 = as_type<float>(_1247) * _1552;
    int _1558 = _1496 * _1536;
    int _1560 = _1558 + _1259;
    float _1562 = trunc(_1556);
    float _1564 = precise::max(_1562, 0.0);
    uint _1566 = uint(_1564);
    bool _1568 = !_1508;
    int _1570 = _1568 ? 0 : 1;
    int _1572 = _1550 * _1546;
    int _1574 = ~_1175;
    int _1576 = _1574 + 1;
    int _1578 = abs(_1570);
    int _1580 = _1534 * _1554;
    int _1582 = _1580 + _1572;
    bool _1584 = !_1512;
    int _1586 = _1584 ? 0 : 1;
    int _1588 = abs(_1586);
    float _1590 = float(uint(_1392));
    int _1592 = _1576 * int(_1566);
    int _1594 = _1592 + _1516;
    float _1596 = float(uint(_1560));
    int _1598 = _1560 * _1578;
    int _1600 = _1598 + _1582;
    int _1602 = ~_1209;
    int _1604 = _1602 + 1;
    float _1606 = as_type<float>(_1247) * _1590;
    float _1608 = float(uint(_1594));
    int _1610 = _1496 * _1588;
    int _1612 = _1610 + _1600;
    float _1614 = as_type<float>(_1276) * _1596;
    int _1616 = ~_1175;
    int _1618 = _1616 + 1;
    float _1620 = trunc(_1606);
    float _1622 = precise::max(_1620, 0.0);
    uint _1624 = uint(_1622);
    float _1626 = float(uint(_1612));
    float _1628 = as_type<float>(_1247) * _1608;
    float _1630 = as_type<float>(_1276) * _1626;
    float _1632 = trunc(_1614);
    float _1634 = precise::max(_1632, 0.0);
    uint _1636 = uint(_1634);
    float _1638 = trunc(_1628);
    float _1640 = precise::max(_1638, 0.0);
    uint _1642 = uint(_1640);
    int _1644 = _1618 * int(_1624);
    int _1646 = _1644 + _1392;
    float _1648 = float(uint(_1646));
    float _1650 = trunc(_1630);
    float _1652 = precise::max(_1650, 0.0);
    uint _1654 = uint(_1652);
    int _1656 = _1604 * int(_1636);
    int _1658 = _1656 + _1560;
    int _1660 = ~_1209;
    int _1662 = _1660 + 1;
    float _1664 = as_type<float>(_1247) * _1648;
    int _1666 = ~_1175;
    int _1668 = _1666 + 1;
    float _1670 = float(uint(_1658));
    int _1672 = int(_1566) + int(_1642);
    float _1674 = trunc(_1664);
    float _1676 = precise::max(_1674, 0.0);
    uint _1678 = uint(_1676);
    float _1680 = as_type<float>(_1276) * _1670;
    int _1682 = _1668 * _1672;
    int _1684 = _1682 + _1516;
    int _1686 = _1662 * int(_1654);
    int _1688 = _1686 + _1612;
    float _1690 = trunc(_1680);
    float _1692 = precise::max(_1690, 0.0);
    uint _1694 = uint(_1692);
    bool _1696 = uint(_1684) >= uint(_1175);
    float _1698 = float(uint(_1688));
    bool _1700 = !_1696;
    int _1702 = _1700 ? 0 : (-1);
    int _1704 = int(_1624) + int(_1678);
    float _1706 = as_type<float>(_1276) * _1698;
    int _1708 = ~_1672;
    int _1710 = _1708 + _1702;
    int _1712 = _1710 + 1;
    int _1714 = ~_1209;
    int _1716 = _1714 + 1;
    float _1718 = trunc(_1706);
    float _1720 = precise::max(_1718, 0.0);
    uint _1722 = uint(_1720);
    int _1724 = _1175 * _1712;
    int _1726 = _1724 + _1516;
    int _1728 = ~_1175;
    int _1730 = _1728 + 1;
    int _1732 = int(_1636) + int(_1694);
    bool _1734 = !_1225;
    int _1736 = _1734 ? _1726 : (-1);
    int _1738 = ~_1209;
    int _1740 = _1738 + 1;
    int _1742 = _1736 & 3;
    bool _1744 = _1742 != 0;
    int _1746 = _1744 ? 0 : 1;
    int _1748 = int(_1654) + int(_1722);
    int _1750 = _1730 * _1704;
    int _1752 = _1750 + _1392;
    int _1754 = _1736 & 3;
    bool _1756 = _1754 != 0;
    int _1758 = _1716 * _1748;
    int _1760 = _1758 + _1612;
    bool _1762 = uint(_1754) >= 2u;
    bool _1764 = uint(_1752) >= uint(_1175);
    int _1766 = _1762 ? 0 : 1;
    bool _1768 = uint(_1760) >= uint(_1209);
    bool _1770 = !_1764;
    int _1772 = _1770 ? 0 : (-1);
    bool _1774 = !_1768;
    int _1776 = _1774 ? 0 : (-1);
    bool _1778 = uint(_1754) > 1u;
    bool _1780 = _1754 != 3;
    int _1782 = ~_1748;
    int _1784 = _1782 + _1776;
    int _1786 = _1784 + 1;
    int _1788 = ~_1704;
    int _1790 = _1788 + _1772;
    int _1792 = _1790 + 1;
    int _1794 = _1740 * _1732;
    int _1796 = _1794 + _1560;
    bool _1798 = _231 > 0.5;
    int _1800 = _1209 * _1786;
    int _1802 = _1800 + _1612;
    int _1804 = ~_1746;
    int _1806 = _1804 + 1;
    int _1808 = _1806 + 1;
    int _1810 = _1175 * _1792;
    int _1812 = _1810 + _1392;
    float _1814 = -_193;
    int _1816 = _1798 ? as_type<int>(_1814) : as_type<int>(_193);
    int _1818 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1820 = _1818 != 0;
    int _1822 = ~_1766;
    int _1824 = _1822 + 1;
    int _1826 = _1824 + 1;
    bool _1828 = !_1253;
    int _1830 = _1828 ? _1802 : (-1);
    int _1832 = _1808;
    int _1834 = _1826;
    if (!_1778)
    {
        int _1836 = ~_1746;
        int _1838 = _1836 + 1;
        _1832 = _1838;
    }
    int _1840 = _1832;
    if (_1780)
    {
        int _1842 = ~_1766;
        int _1844 = _1842 + 1;
        _1834 = _1844;
    }
    int _1846 = _1834;
    bool _1848 = uint(_1796) >= uint(_1209);
    bool _1850 = !_1225;
    int _1852 = _1850 ? _1812 : (-1);
    int _1854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1856 = _1854 != 0;
    bool _1858 = !_1820;
    int _1860 = _1858 ? 0 : 1;
    int _1862 = _1736 >> 31;
    int _1864 = _1830 & 3;
    bool _1866 = _1864 != 0;
    int _1868 = _1830 >> 31;
    bool _1870 = !_1756;
    int _1872 = _1870 ? 0 : 1;
    bool _1874 = !_1848;
    int _1876 = _1874 ? 0 : (-1);
    int _1878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1880 = _1878 != 0;
    int _1882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1884 = _1882 != 0;
    bool _1886 = !_1856;
    int _1888 = _1886 ? 0 : 1;
    int _1890 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1892 = _1890 != 0;
    int _1894 = _1862 & 3;
    int _1896 = _1830 & 3;
    bool _1898 = _1896 != 0;
    bool _1900 = !_1866;
    int _1902 = _1900 ? 0 : 1;
    int _1904 = _1868 & 3;
    bool _1906 = uint(_1864) > 1u;
    int _1908 = _1736 + _1894;
    int _1910 = _1898 ? 0 : 1;
    int _1912 = _1830 + _1904;
    bool _1914 = _1754 != 3;
    int _1916 = _1908 >> 2;
    int _1918 = ~_1732;
    int _1920 = _1918 + _1876;
    int _1922 = _1920 + 1;
    int _1924 = _1912 >> 2;
    bool _1926 = !_1914;
    int _1928 = _1926 ? 0 : (-1);
    int _1930 = _1209 * _1922;
    int _1932 = _1930 + _1560;
    bool _1934 = uint(_1864) >= 2u;
    int _1936 = _1916 << 4;
    int _1938 = _1936 + 368;
    int _1940 = _1924 << 4;
    int _1942 = _1940 + 512;
    int _1944 = ~_1910;
    int _1946 = _1944 + 1;
    int _1948 = _1946 + 1;
    uint _1950 = uint(int(uint(_1938) >> uint(2)));
    uint _1952 = uint(int(uint(int(_1950)) >> uint(2)));
    int _1954 = int(_1950) & 3;
    float _1956 = (*spvDescriptorSet0.vp_c9)._m0[int(_1952)][_1954];
    int _1958 = int(_1950) + 1;
    uint _1960 = uint(int(uint(_1958) >> uint(2)));
    int _1962 = _1958 & 3;
    float _1964 = (*spvDescriptorSet0.vp_c9)._m0[int(_1960)][_1962];
    int _1966 = _1948;
    if (!_1906)
    {
        int _1968 = ~_1910;
        int _1970 = _1968 + 1;
        _1966 = _1970;
    }
    int _1972 = _1966;
    int _1974 = _1934 ? 0 : 1;
    bool _1976 = _1864 != 3;
    bool _1978 = _1864 != 3;
    int _1980 = _1942 + 8;
    uint _1982 = uint(int(uint(_1980) >> uint(2)));
    uint _1984 = uint(int(uint(int(_1982)) >> uint(2)));
    int _1986 = int(_1982) & 3;
    float _1988 = (*spvDescriptorSet0.vp_c9)._m0[int(_1984)][_1986];
    int _1990 = int(_1982) + 1;
    uint _1992 = uint(int(uint(_1990) >> uint(2)));
    int _1994 = _1990 & 3;
    float _1996 = (*spvDescriptorSet0.vp_c9)._m0[int(_1992)][_1994];
    int _1998 = ~_1974;
    int _2000 = _1998 + 1;
    int _2002 = _2000 + 1;
    bool _2004 = !_1253;
    int _2006 = _2004 ? _1932 : (-1);
    uint _2008 = uint(int(uint(_1942) >> uint(2)));
    uint _2010 = uint(int(uint(int(_2008)) >> uint(2)));
    int _2012 = int(_2008) & 3;
    float _2014 = (*spvDescriptorSet0.vp_c9)._m0[int(_2010)][_2012];
    int _2016 = int(_2008) + 1;
    uint _2018 = uint(int(uint(_2016) >> uint(2)));
    int _2020 = _2016 & 3;
    float _2022 = (*spvDescriptorSet0.vp_c9)._m0[int(_2018)][_2020];
    int _2024 = _2002;
    if (_1976)
    {
        int _2026 = ~_1974;
        int _2028 = _2026 + 1;
        _2024 = _2028;
    }
    int _2030 = _2024;
    float _2032 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2034 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2036 = _2034 != 0;
    float _2038 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2040 = _1938 + 8;
    uint _2042 = uint(int(uint(_2040) >> uint(2)));
    uint _2044 = uint(int(uint(int(_2042)) >> uint(2)));
    int _2046 = int(_2042) & 3;
    float _2048 = (*spvDescriptorSet0.vp_c9)._m0[int(_2044)][_2046];
    int _2050 = int(_2042) + 1;
    uint _2052 = uint(int(uint(_2050) >> uint(2)));
    int _2054 = _2050 & 3;
    float _2056 = (*spvDescriptorSet0.vp_c9)._m0[int(_2052)][_2054];
    float _2058 = _2032 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2060 = abs(_1972);
    float _2062 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2064 = abs(_1840);
    float _2066 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2068 = abs(_1872);
    float _2070 = _2062 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2072 = ~_2064;
    int _2074 = _2072 + 1;
    int _2076 = _2074 + 1;
    float _2078 = _2066 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2080 = !_1978;
    int _2082 = _2080 ? 0 : (-1);
    bool _2084 = _225 > 0.5;
    out.m_76.x = _2070;
    out.m_76.y = _2058;
    out.m_76.z = _2078;
    out.m_76.w = _2038;
    bool _2086 = _227 > 0.5;
    float _2088 = -_189;
    int _2090 = _2084 ? as_type<int>(_2088) : as_type<int>(_189);
    float _2092 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2094 = _2076 * as_type<int>(_1964);
    bool _2096 = _229 > 0.5;
    float _2098 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2100 = _1203 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2102 = _2092 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2104 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2106 = int(_2104);
    float _2108 = _2098 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2110 = abs(_1902);
    float _2112 = _987 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2114 = ~_2060;
    int _2116 = _2114 + 1;
    int _2118 = _2116 + 1;
    int _2120 = ~_2068;
    int _2122 = _2120 + 1;
    int _2124 = _2122 + 1;
    out.m_78.x = _2100;
    out.m_78.y = _2102;
    out.m_78.z = _2108;
    int _2126 = ~_2110;
    int _2128 = _2126 + 1;
    int _2130 = _2128 + 1;
    int _2132 = _2118 * as_type<int>(_2022);
    int _2134 = abs(_1846);
    int _2136 = _2124 * as_type<int>(_1956);
    int _2138 = _2136 + _2094;
    int _2140 = abs(_2082);
    int _2142 = _2130 * as_type<int>(_2014);
    int _2144 = _2142 + _2132;
    int _2146 = abs(_2030);
    float _2148 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2150 = int(_2148);
    float _2152 = _961 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2154 = abs(_1928);
    int _2156 = ~_2146;
    int _2158 = _2156 + 1;
    int _2160 = _2158 + 1;
    float _2162 = -_955;
    float _2164 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2152);
    float _2166 = float(uint(_2106));
    int _2168 = ~_2140;
    int _2170 = _2168 + 1;
    int _2172 = _2170 + 1;
    int _2174 = _2160 * as_type<int>(_1988);
    int _2176 = _2174 + _2144;
    int _2178 = ~_2134;
    int _2180 = _2178 + 1;
    int _2182 = _2180 + 1;
    float _2184 = 1.0 / _2166;
    int _2186 = _2172 * as_type<int>(_1996);
    int _2188 = _2186 + _2176;
    float _2190 = float(uint(_2150));
    int _2192 = _2182 * as_type<int>(_2048);
    int _2194 = _2192 + _2138;
    int _2196 = ~_2154;
    int _2198 = _2196 + 1;
    int _2200 = _2198 + 1;
    float _2202 = _961 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2204 = abs(_1860);
    float _2206 = _961 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2208 = 1.0 / _2190;
    int _2210 = abs(_1888);
    int _2212 = _2200 * as_type<int>(_2056);
    int _2214 = _2212 + _2194;
    int _2216 = ~_2204;
    int _2218 = _2216 + 1;
    int _2220 = _2218 + 1;
    float _2222 = -_955;
    float _2224 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2202);
    int _2226 = abs(_2106);
    float _2228 = -_955;
    float _2230 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2206);
    int _2232 = ~_2210;
    int _2234 = _2232 + 1;
    int _2236 = _2234 + 1;
    int _2238 = _2214 * _2220;
    int _2240 = abs(_2150);
    float _2242 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2164);
    int _2244 = _2188 * _2236;
    float _2246 = float(uint(_2240));
    int _2248 = _1852 * _2204;
    int _2250 = _2248 + _2238;
    float _2252 = float(uint(_2226));
    int _2254 = _2006 * _2210;
    int _2256 = _2254 + _2244;
    int _2258 = as_type<int>(_2184) + (-2);
    float _2260 = _973 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2262 = 1.0 / _2246;
    int _2264 = as_type<int>(_2208) + (-2);
    float _2266 = _973 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2268 = float(uint(_2250));
    float _2270 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2260);
    float _2272 = _973 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2274 = ~_2106;
    int _2276 = _2274 + 1;
    float _2278 = _987 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2280 = 1.0 / _2252;
    float _2282 = as_type<float>(_2258) * _2268;
    float _2284 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2266);
    int _2286 = abs(_2250);
    float _2288 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2272);
    float _2290 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2224);
    float _2292 = trunc(_2282);
    float _2294 = precise::max(_2292, 0.0);
    uint _2296 = uint(_2294);
    int _2298 = abs(_2256);
    float _2300 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2230);
    float _2302 = float(uint(_2256));
    float _2304 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2112);
    int _2306 = as_type<int>(_2262) + (-2);
    float _2308 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2284);
    float _2310 = as_type<float>(_2264) * _2302;
    int _2312 = as_type<int>(_2280) + (-2);
    float _2314 = float(uint(_2286));
    float _2316 = float(uint(_2298));
    float _2318 = trunc(_2310);
    float _2320 = precise::max(_2318, 0.0);
    uint _2322 = uint(_2320);
    int _2324 = ~_2240;
    int _2326 = _2324 + 1;
    float _2328 = as_type<float>(_2312) * _2314;
    float _2330 = _987 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2332 = as_type<float>(_2306) * _2316;
    float _2334 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2278);
    int _2336 = _2276 * int(_2296);
    int _2338 = _2336 + _2250;
    float _2340 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2330);
    float _2342 = trunc(_2328);
    float _2344 = precise::max(_2342, 0.0);
    uint _2346 = uint(_2344);
    float _2348 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2334);
    float _2350 = _2330;
    float _2352 = as_type<float>(_2326);
    if (_1061)
    {
        float _2354 = _1235 + (-1.0);
        _2350 = _2354;
    }
    float _2356 = _2350;
    float _2358 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2340);
    float _2360 = float(uint(_2338));
    float _2362 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2304);
    int _2364 = ~_2150;
    int _2366 = _2364 + 1;
    float _2368 = _2356;
    if (_1061)
    {
        float _2370 = _2356 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2368 = _2370;
    }
    float _2372 = _2368;
    float _2374 = trunc(_2332);
    float _2376 = precise::max(_2374, 0.0);
    uint _2378 = uint(_2376);
    int _2380 = ~_2226;
    int _2382 = _2380 + 1;
    float _2384 = as_type<float>(_2258) * _2360;
    if (_1061)
    {
        float _2386 = fma(_1123, _1235, _2372);
        _1127 = _2386;
    }
    float _2388 = _1127;
    float _2390 = -_189;
    int _2392 = _2096 ? as_type<int>(_2390) : as_type<int>(_189);
    int _2394 = _2366 * int(_2322);
    int _2396 = _2394 + _2256;
    float _2398 = trunc(_2384);
    float _2400 = precise::max(_2398, 0.0);
    uint _2402 = uint(_2400);
    bool _2404 = !_1880;
    float _2406 = _2404 ? _193 : as_type<float>(_1816);
    int _2408 = _2382 * int(_2346);
    int _2410 = _2408 + _2286;
    float _2412 = float(uint(_2396));
    float _2414 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2416 = !_2036;
    float _2418 = _2416 ? _189 : as_type<float>(_2090);
    int _2420 = _2326 * int(_2378);
    int _2422 = _2420 + _2298;
    float _2424 = float(uint(_2410));
    if (_1061)
    {
        float _2426 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2428 = _1153 + _2426;
        _2352 = _2428;
    }
    float _2430 = _2352;
    float _2432 = -_193;
    int _2434 = _2086 ? as_type<int>(_2432) : as_type<int>(_193);
    float _2436 = float(uint(_2422));
    float _2438 = as_type<float>(_2264) * _2412;
    float _2440 = as_type<float>(_2312) * _2424;
    bool _2442 = !_1884;
    float _2444 = _2442 ? _193 : as_type<float>(_2434);
    float _2446 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2448 = as_type<float>(_2306) * _2436;
    bool _2450 = !_1892;
    float _2452 = _2450 ? _189 : as_type<float>(_2392);
    float _2454 = trunc(_2438);
    float _2456 = precise::max(_2454, 0.0);
    uint _2458 = uint(_2456);
    float _2460 = _2414 * _2290;
    float _2462 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2270);
    float _2464 = _2460;
    if (_1061)
    {
        float _2466 = _2430 * _2430;
        _1075 = _2466;
    }
    float _2468 = _1075;
    float _2470 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2472 = _2388 + _2470;
    bool _2474 = _2150 == 0;
    float _2476 = fma(_2446, _2462, _2460);
    if (_1061)
    {
        float _2478 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2480 = _1157 + _2478;
        _2464 = _2480;
    }
    float _2482 = _2464;
    float _2484 = trunc(_2440);
    float _2486 = precise::max(_2484, 0.0);
    uint _2488 = uint(_2486);
    float _2490 = fma(_2472, _2472, _2468);
    float _2492 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2288);
    if (_1061)
    {
        float _2494 = _2482 * _2482;
        _1077 = _2494;
    }
    float _2496 = _1077;
    int _2498 = int(_2296) + int(_2402);
    float _2500 = _2414 * _2242;
    int _2502 = ~_2106;
    int _2504 = _2502 + 1;
    float _2506 = _2414 * _2300;
    float _2508 = trunc(_2448);
    float _2510 = precise::max(_2508, 0.0);
    uint _2512 = uint(_2510);
    int _2514 = int(_2322) + int(_2458);
    float _2516 = fma(_2446, _2308, _2500);
    int _2518 = ~_2150;
    int _2520 = _2518 + 1;
    int _2522 = _2504 * _2498;
    int _2524 = _2522 + _2250;
    int _2526 = ~_2226;
    int _2528 = _2526 + 1;
    float _2530 = fma(_2446, _2492, _2506);
    bool _2532 = _2150 == 0;
    int _2534 = _2520 * _2514;
    int _2536 = _2534 + _2256;
    int _2538 = int(_2346) + int(_2488);
    out.m_80.x = _2462;
    out.m_80.y = _2308;
    out.m_80.z = _2492;
    int _2540 = ~_2240;
    int _2542 = _2540 + 1;
    bool _2544 = uint(_2524) >= uint(_2106);
    bool _2546 = uint(_2536) >= uint(_2150);
    int _2548 = int(_2378) + int(_2512);
    int _2550 = _2528 * _2538;
    int _2552 = _2550 + _2286;
    float _2554 = _2490 + _2496;
    float _2556 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2558 = _2256 ^ _2150;
    int _2560 = _2542 * _2548;
    int _2562 = _2560 + _2298;
    bool _2564 = !_2544;
    int _2566 = _2564 ? 0 : (-1);
    bool _2568 = uint(_2552) >= uint(_2226);
    bool _2570 = !_2546;
    int _2572 = _2570 ? 0 : (-1);
    float _2574 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2576 = uint(_2562) >= uint(_2240);
    int _2578 = ~_2498;
    int _2580 = _2578 + _2566;
    int _2582 = _2580 + 1;
    int _2584 = _2250 ^ _2106;
    int _2586 = ~_2514;
    int _2588 = _2586 + _2572;
    int _2590 = _2588 + 1;
    int _2592 = _2106 * _2582;
    int _2594 = _2592 + _2250;
    bool _2596 = !_2568;
    int _2598 = _2596 ? 0 : (-1);
    float _2600 = _2556 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    uint _2602 = uint(int(uint(_2584) >> uint(31)));
    int _2604 = _2150 * _2590;
    int _2606 = _2604 + _2256;
    bool _2608 = _2106 == 0;
    float _2610 = sqrt(_2554);
    bool _2612 = _2106 == 0;
    float _2614 = _2574 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2616 = ~_2598;
    int _2618 = _2538 + _2616;
    int _2620 = _2618 + 1;
    int _2622 = ~int(_2602);
    int _2624 = _2622 + 1;
    bool _2626 = !_2576;
    int _2628 = _2626 ? 0 : (-1);
    float _2630 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _2632 = uint(int(uint(_2558) >> uint(31)));
    int _2634 = _2620 ^ _2624;
    bool _2636 = !_2608;
    int _2638 = _2636 ? _2594 : (-1);
    int _2640 = ~_2628;
    int _2642 = _2548 + _2640;
    int _2644 = _2642 + 1;
    float _2646 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2648 = ~int(_2632);
    int _2650 = _2648 + 1;
    int _2652 = ~_2624;
    int _2654 = _2652 + _2634;
    int _2656 = _2654 + 1;
    float _2658 = fma(_2414, _2414, 1.0);
    bool _2660 = !_2474;
    int _2662 = _2660 ? _2606 : (-1);
    float _2664 = float(_2638);
    float _2666 = _2630 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2668 = _2644 ^ _2650;
    float _2670 = rsqrt(_2658);
    float _2672 = float(_2662);
    float _2674 = fma(_2600, _2664, _739);
    int _2676 = ~_2650;
    int _2678 = _2676 + _2668;
    int _2680 = _2678 + 1;
    float _2682 = _2418 + 0.5;
    bool _2684 = !_2612;
    int _2686 = _2684 ? _2656 : (-1);
    float _2688 = fma(_2666, _2672, _777);
    bool _2690 = !_2532;
    int _2692 = _2690 ? _2680 : (-1);
    float _2694 = _2646 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2696 = float(_2686);
    float _2698 = fma(_2600, _2682, _2674);
    float _2700 = float(_2692);
    out.m_82.x = _1167;
    out.m_82.y = _1169;
    out.m_82.z = _1171;
    bool _2702 = _2610 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2704 = isnan(_2610);
    bool _2706 = _2702 || _2704;
    bool _2708 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2710 = _2706 || _2708;
    float _2712 = -_335;
    float _2714 = fma(_2614, _2696, _2712);
    float _2716 = _2452 + 0.5;
    float _2718 = -_803;
    float _2720 = fma(_2694, _2700, _2718);
    float _2722 = _2406 + (-0.5);
    float _2724 = _2444 + (-0.5);
    float _2726 = fma(_2666, _2716, _2688);
    float _2728 = _2414 * _2670;
    float _2730 = -_2694;
    float _2732 = fma(_2730, _2722, _2720);
    float _2734 = -_2614;
    float _2736 = fma(_2734, _2724, _2714);
    float _2738 = -_797;
    float _2740 = _2738 + 1.0;
    float _2742 = -_2348;
    float _2744 = _2728 * _2742;
    float _2746 = -_2358;
    float _2748 = _2728 * _2746;
    float _2750 = -_765;
    float _2752 = _2750 + 1.0;
    float _2754 = -_2362;
    float _2756 = _2728 * _2754;
    float _2758 = fma(_2444, _1185, _2736);
    float _2760 = fma(_2670, _2290, _2744);
    float _2762 = fma(_2670, _2242, _2748);
    float _2764 = fma(_2406, _2752, _2732);
    float _2766 = fma(_2670, _2300, _2756);
    float _2768 = _2348 + _2476;
    float _2770 = -_1197;
    float _2772 = fma(_2418, _2770, _2698);
    float _2774 = -_2740;
    float _2776 = fma(_2452, _2774, _2726);
    float _2778 = _2358 + _2516;
    float _2780 = _2362 + _2530;
    out.m_84.x = _2760;
    out.m_84.y = _2762;
    out.m_84.z = _2766;
    float _2782 = _2698;
    if (!_2710)
    {
        _2782 = 1.0;
    }
    float _2784 = _2782;
    out.m_86.x = _2772;
    out.m_86.y = _2758;
    out.m_86.z = _2776;
    out.m_86.w = _2764;
    out.m_88.x = _2768;
    out.m_88.y = _2778;
    out.m_88.z = _2780;
    bool _2786 = !_2710;
    float _2788 = _2784;
    if (!_2786)
    {
        bool _2790 = _2610 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2792 = isnan(_2610);
        bool _2794 = _2790 || _2792;
        bool _2796 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2798 = _2794 || _2796;
        if (!_2798)
        {
            float _2800 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2802 = _2610 + _2800;
            float _2804 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2806 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2804;
            float _2808 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2810 = _2808 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2812 = 1.0 / _2806;
            float _2814 = _2802 * _2812;
            float _2816 = fma(_2814, _2810, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2788 = _2816;
            _2818 = true;
        }
        else
        {
            bool _2820 = _2610 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2822 = isnan(_2610);
            bool _2824 = _2820 || _2822;
            bool _2826 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2828 = _2824 || _2826;
            if (!_2828)
            {
                float _2830 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2832 = _2610 + _2830;
                float _2834 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2836 = _2834 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2838 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2840 = _2838 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2842 = 1.0 / _2836;
                float _2844 = _2832 * _2842;
                float _2846 = fma(_2844, _2840, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2788 = _2846;
                _2818 = true;
            }
            else
            {
                _2788 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2818 = false;
    float _2848 = _2788;
    float _2850 = fma(_1027, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2852 = fma(_1029, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2854 = floor(_2850);
    float _2856 = floor(_2852);
    float _2858 = -_2854;
    float _2860 = _2850 + _2858;
    float _2862 = -_2856;
    float _2864 = _2852 + _2862;
    float2 _8419 = float2(_2860, _2864);
    float _2866 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8419, float2(0.0), isnan(_8419)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8419, float2(0.0), isnan(_8419)), level(0.0)).x;
    float _2868 = _1119 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2870 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2872 = _2388 + _2870;
    float _2874 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2868);
    float _2876 = _1119 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2878 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2880 = _1157 + _2878;
    float _2882 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2874);
    float _2884 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2886 = fma(_2872, _2848, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2888 = _2882 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2890 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2876);
    float _2892 = _1119 + _2884;
    float _2894 = 1.0 / _2888;
    float _2896 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2890);
    float _2898 = _2896 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2900 = _2898 + _2888;
    float _2902 = _2900 * _2894;
    float _2904 = _2902 * 0.5;
    float _2906 = _2892 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2908 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2910 = fma(_2904, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2908);
    float _2912 = fma(_1027, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2906);
    float _2914 = _2892 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2916 = fma(_1029, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2912);
    float _2918 = 1.0 / _2910;
    float _2920 = _2916 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2922 = trunc(_2920);
    int _2924 = int(_2922);
    float _2926 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2928 = _2918 * _2926;
    bool _2930 = _2928 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _2932 = _2928 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _2934 = !_2930;
    int _2936 = _2934 ? 0 : 1;
    int _2938 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2940 = _2924 + _2938;
    int _2942 = _2940 + 1;
    int _2944 = 2;
    float _2946 = _2916;
    if (!_2930)
    {
        _2944 = 1;
    }
    int _2948 = _2944;
    int _2950 = _2948;
    if (!_2932)
    {
        _2950 = _2936;
    }
    int _2952 = _2950;
    float _2954 = fma(_1027, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2914);
    int _2956 = _2952 << 6;
    float _2958 = fma(_1029, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2954);
    bool _2960 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2962 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2964 = _2960 || _2962;
    bool _2966 = isnan(0.5);
    bool _2968 = _2964 || _2966;
    float _2970 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2972 = _1153 + _2970;
    int _2974 = _2956 + 48;
    uint _2976 = uint(int(uint(_2974) >> uint(2)));
    uint _2978 = uint(int(uint(int(_2976)) >> uint(2)));
    int _2980 = int(_2976) & 3;
    float _2982 = (*spvDescriptorSet0.vp_c15)._m0[int(_2978)][_2980];
    int _2984 = int(_2976) + 1;
    uint _2986 = uint(int(uint(_2984) >> uint(2)));
    int _2988 = _2984 & 3;
    float _2990 = (*spvDescriptorSet0.vp_c15)._m0[int(_2986)][_2988];
    float _2992 = _2958 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _2994 = _2942 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2996 = fma(_2972, _2848, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2998 = fma(_2880, _2848, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3000 = trunc(_2992);
    int _3002 = int(_3000);
    int _3004 = _2956 + 56;
    uint _3006 = uint(int(uint(_3004) >> uint(2)));
    uint _3008 = uint(int(uint(int(_3006)) >> uint(2)));
    int _3010 = int(_3006) & 3;
    float _3012 = (*spvDescriptorSet0.vp_c15)._m0[int(_3008)][_3010];
    int _3014 = int(_3006) + 1;
    uint _3016 = uint(int(uint(_3014) >> uint(2)));
    int _3018 = _3014 & 3;
    float _3020 = (*spvDescriptorSet0.vp_c15)._m0[int(_3016)][_3018];
    float _3022 = _2972;
    int _3024 = as_type<int>(_2998);
    if (_2968)
    {
        _3022 = _2886;
    }
    float _3026 = _3022;
    float _3028 = _3026;
    if (_2968)
    {
        _2946 = _2998;
    }
    float _3030 = _2946;
    int _3032 = _2956 + 64;
    uint _3034 = uint(int(uint(_3032) >> uint(2)));
    uint _3036 = uint(int(uint(int(_3034)) >> uint(2)));
    int _3038 = int(_3034) & 3;
    float _3040 = (*spvDescriptorSet0.vp_c15)._m0[int(_3036)][_3038];
    int _3042 = int(_3034) + 1;
    uint _3044 = uint(int(uint(_3042) >> uint(2)));
    int _3046 = _3042 & 3;
    float _3048 = (*spvDescriptorSet0.vp_c15)._m0[int(_3044)][_3046];
    int _3050 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3052 = _3002 + _3050;
    int _3054 = _3052 + 1;
    int _3056 = _2956 + 72;
    uint _3058 = uint(int(uint(_3056) >> uint(2)));
    uint _3060 = uint(int(uint(int(_3058)) >> uint(2)));
    int _3062 = int(_3058) & 3;
    float _3064 = (*spvDescriptorSet0.vp_c15)._m0[int(_3060)][_3062];
    int _3066 = int(_3058) + 1;
    uint _3068 = uint(int(uint(_3066) >> uint(2)));
    int _3070 = _3066 & 3;
    float _3072 = (*spvDescriptorSet0.vp_c15)._m0[int(_3068)][_3070];
    int _3074 = _2942 | _3054;
    bool _3076 = _3074 < 0;
    bool _3078 = _3076 || _2994;
    float _3080 = as_type<float>(_3074);
    float _3082 = _3030;
    if (_2968)
    {
        _3080 = _2996;
    }
    float _3084 = _3080;
    int _3086 = _2956 + 96;
    uint _3088 = uint(int(uint(_3086) >> uint(2)));
    uint _3090 = uint(int(uint(int(_3088)) >> uint(2)));
    int _3092 = int(_3088) & 3;
    float _3094 = (*spvDescriptorSet0.vp_c15)._m0[int(_3090)][_3092];
    int _3096 = int(_3088) + 1;
    uint _3098 = uint(int(uint(_3096) >> uint(2)));
    int _3100 = _3096 & 3;
    float _3102 = (*spvDescriptorSet0.vp_c15)._m0[int(_3098)][_3100];
    bool _3104 = _3054 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3106 = _3104 || _3078;
    int _3108 = _2956 + 104;
    uint _3110 = uint(int(uint(_3108) >> uint(2)));
    uint _3112 = uint(int(uint(int(_3110)) >> uint(2)));
    int _3114 = int(_3110) & 3;
    float _3116 = (*spvDescriptorSet0.vp_c15)._m0[int(_3112)][_3114];
    int _3118 = int(_3110) + 1;
    uint _3120 = uint(int(uint(_3118) >> uint(2)));
    int _3122 = _3118 & 3;
    float _3124 = (*spvDescriptorSet0.vp_c15)._m0[int(_3120)][_3122];
    float _3126 = _3084;
    if (!_2968)
    {
        float _3128 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3130 = _1119 + _3128;
        float _3132 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3134 = _1027 + _3132;
        float _3136 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3138 = _3130 * _3130;
        float _3140 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3142 = _1029 + _3140;
        float _3144 = fma(_3134, _3134, _3138);
        float _3146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3148 = fma(_3142, _3142, _3144);
        float _3150 = sqrt(_3148);
        float _3152 = _3136 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3154 = precise::min(_3150, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3156 = _3154 * _3146;
        float _3158 = -_1119;
        float _3160 = _3158 + _2886;
        float _3162 = -_1027;
        float _3164 = _3162 + _2996;
        float _3166 = _3152 * _3156;
        float _3168 = -_1029;
        float _3170 = _3168 + _2998;
        float _3172 = fma(_3160, _3166, _1119);
        float _3174 = fma(_3164, _3166, _1027);
        float _3176 = fma(_3170, _3166, _1029);
        _3028 = _3172;
        _3126 = _3174;
        _3082 = _3176;
    }
    float _3178 = _3028;
    float _3180 = _3126;
    float _3182 = _3082;
    float _3184 = _2892 * _3102;
    float _3186 = _3178 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _3188 = as_type<int>(_3184);
    if (!_3106)
    {
        int _3190 = _3054 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3192 = _3190 + _2942;
        _1129 = _3192;
    }
    int _3194 = _1129;
    float _3196 = _2892 * _2990;
    float _3198 = fma(_1027, _3094, _3184);
    float _3200 = fma(_3180, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3186);
    float _3202 = _2892 * _3048;
    float _3204 = fma(_1027, _2982, _3196);
    float _3206 = fma(_1029, _3116, _3198);
    float _3208 = fma(_3182, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3200);
    if (!_3106)
    {
        int _3210 = _3194 << 2;
        _3024 = _3210;
    }
    int _3212 = _3024;
    float _3214 = fma(_1027, _3040, _3202);
    float _3216 = _3206 + _3124;
    float _3218 = _3208 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _3220 = _3212;
    if (!_3106)
    {
        uint _3222 = uint(int(uint(_3194) >> uint(2)));
        _3188 = int(_3222);
    }
    int _3224 = _3188;
    int _3226 = _2956 + 80;
    uint _3228 = uint(int(uint(_3226) >> uint(2)));
    uint _3230 = uint(int(uint(int(_3228)) >> uint(2)));
    int _3232 = int(_3228) & 3;
    float _3234 = (*spvDescriptorSet0.vp_c15)._m0[int(_3230)][_3232];
    int _3236 = int(_3228) + 1;
    uint _3238 = uint(int(uint(_3236) >> uint(2)));
    int _3240 = _3236 & 3;
    float _3242 = (*spvDescriptorSet0.vp_c15)._m0[int(_3238)][_3240];
    if (!_3106)
    {
        int _3244 = 12 & _3212;
        _3220 = _3244;
    }
    int _3246 = _3220;
    float _3248 = fma(_1029, _3012, _3204);
    float _3250 = 1.0 / _3216;
    float _3252 = fma(_1029, _3064, _3214);
    float _3254 = as_type<float>(_3246);
    if (!_3106)
    {
        int _3256 = _3224 << 4;
        int _3258 = _3256 + _3246;
        _3254 = as_type<float>(_3258);
    }
    float _3260 = _3254;
    float _3262 = _3178 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3264 = _3248 + _3020;
    int _3266 = _2956 + 88;
    uint _3268 = uint(int(uint(_3266) >> uint(2)));
    uint _3270 = uint(int(uint(int(_3268)) >> uint(2)));
    int _3272 = int(_3268) & 3;
    float _3274 = (*spvDescriptorSet0.vp_c15)._m0[int(_3270)][_3272];
    int _3276 = int(_3268) + 1;
    uint _3278 = uint(int(uint(_3276) >> uint(2)));
    int _3280 = _3276 & 3;
    float _3282 = (*spvDescriptorSet0.vp_c15)._m0[int(_3278)][_3280];
    float _3284 = _3252 + _3072;
    float _3286 = fma(_3180, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3262);
    float _3288 = _3178 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3290 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3292 = _3218 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3294 = fma(_3182, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3286);
    float _3296 = fma(_3180, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3288);
    float _3298 = _3260;
    if (!_3106)
    {
        int _3300 = as_type<int>(_3260) + 400;
        uint _3302 = uint(int(uint(_3300) >> uint(2)));
        uint _3304 = uint(int(uint(int(_3302)) >> uint(2)));
        int _3306 = int(_3302) & 3;
        float _3308 = (*spvDescriptorSet0.vp_c15)._m0[int(_3304)][_3306];
        _3298 = _3308;
    }
    float _3310 = _3298;
    float _3312 = -_3292;
    float _3314 = fma(_3312, _3290, 1.0);
    float _3316 = _3178 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3318 = _3264 * _3250;
    float _3320 = _3284 * _3250;
    float _3322 = fma(_3182, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3296);
    float _3324 = _3294 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3326 = fma(_3180, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3316);
    bool _3328 = _3318 >= 0.0;
    float _3330 = _3322 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3332 = _3324 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3334 = fma(_3182, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3326);
    bool _3336 = _3318 <= 1.0;
    bool _3338 = _3336 && _3328;
    float _3340 = as_type<float>(_2942);
    if (!_3106)
    {
        float _3342 = floor(_2992);
        _3340 = _3342;
    }
    float _3344 = _3340;
    float _3346 = fma(_3330, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3332);
    float _3348 = _3334 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _3350 = _3320 >= 0.0;
    bool _3352 = _3350 && _3338;
    float _3354 = _3324 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3356 = fma(_3218, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3346);
    float _3358 = _3324 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    bool _3360 = _3320 <= 1.0;
    bool _3362 = _3360 && _3352;
    float _3364 = log2(_3314);
    float _3366 = fma(_3348, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3356);
    float _3368 = fma(_3330, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3358);
    float _3370 = fma(_3330, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3354);
    float _3372 = 1.0 / _3366;
    float _3374 = _3344;
    float _3376 = _3356;
    if (!_3106)
    {
        float _3378 = -_3344;
        float _3380 = _2992 + _3378;
        _3374 = _3380;
    }
    float _3382 = _3374;
    float _3384 = _2892 * _3242;
    if (_3362)
    {
        float _3386 = float(_2952);
        _3376 = _3386;
    }
    float _3388 = _3376;
    float _3390 = fma(_3218, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3370);
    float _3392 = fma(_1027, _3234, _3384);
    float _3394 = _2886;
    float _3396 = _3390;
    if (!_3106)
    {
        float _3398 = floor(_2920);
        _3394 = _3398;
    }
    float _3400 = _3394;
    float _3402 = fma(_3218, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3368);
    float _3404 = fma(_3348, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3390);
    float _3406 = fma(_1029, _3274, _3392);
    float _3408 = _3364 * 0.693147182464599609375;
    float _3410 = fma(_3348, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3402);
    float _3412 = _3406 + _3282;
    float _3414 = _3388;
    float _3416 = _3408;
    if (_3362)
    {
        float _3418 = rint(_3388);
        float _3420 = precise::max(_3418, 0.0);
        uint _3422 = uint(_3420);
        uint _3424 = clamp(_3422, 0u, 65535u);
        _3414 = as_type<float>(_3424);
    }
    float _3426 = _3414;
    float _3428 = _3410 * _3372;
    float _3430 = _3404 * _3372;
    float _3432 = _3412 * _3250;
    float _3434 = _3408 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3436 = fma(_3428, 0.5, 0.5);
    float _3438 = fma(_3430, -0.5, 0.5);
    float _3440 = _3392;
    float _3442 = _3434;
    float _3444 = _3436;
    if (!_3106)
    {
        float _3446 = rint(_3310);
        float _3448 = precise::max(_3446, 0.0);
        uint _3450 = uint(_3448);
        uint _3452 = clamp(_3450, 0u, 65535u);
        _3440 = as_type<float>(_3452);
    }
    float _3454 = _3440;
    if (!_3106)
    {
        float _3456 = -_3400;
        float _3458 = _2920 + _3456;
        _3416 = _3458;
    }
    float _3460 = _3416;
    float _3462 = _3426;
    if (_3362)
    {
        float3 _9441 = float3(_3318, _3320, float(as_type<int>(_3426)));
        float3 _9445 = select(_9441, float3(0.0), isnan(_9441));
        float _3464 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9445.xy, uint(rint(_9445.z)), _3432, level(0.0));
        _3462 = _3464;
    }
    float _3466 = _3462;
    float3 _9455 = float3(_3436, _3438, _3434);
    float _3468 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9455, float3(0.0), isnan(_9455)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9455, float3(0.0), isnan(_9455)), level(0.0)).x;
    float3 _9464 = float3(_3436, _3438, _3434);
    float4 _3471 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9464, float3(0.0), isnan(_9464)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9464, float3(0.0), isnan(_9464)), level(0.0)).xyzw;
    float _3473 = _3471.x;
    float _3475 = _3471.y;
    float _3477 = _3471.z;
    float _3479 = _3471.w;
    float _3481 = _3382;
    if (!_3106)
    {
        float3 _9487 = float3(_3460, _3382, float(as_type<int>(_3454)));
        float3 _9489 = select(_9487, float3(0.0), isnan(_9487));
        float _3483 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9489.xy, uint(rint(_9489.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9489.xy, uint(rint(_9489.z)), level(0.0)).x;
        _3481 = _3483;
    }
    float _3485 = _3481;
    if (_3106)
    {
        _3396 = 1.0;
    }
    float _3487 = _3396;
    float _3489 = _3487;
    if (!_3106)
    {
        int _3491 = _3194 << 4;
        int _3493 = _3491 + 2048;
        uint _3495 = uint(int(uint(_3493) >> uint(2)));
        uint _3497 = uint(int(uint(int(_3495)) >> uint(2)));
        int _3499 = int(_3495) & 3;
        float _3501 = (*spvDescriptorSet0.vp_c15)._m0[int(_3497)][_3499];
        int _3503 = int(_3495) + 1;
        uint _3505 = uint(int(uint(_3503) >> uint(2)));
        int _3507 = _3503 & 3;
        float _3509 = (*spvDescriptorSet0.vp_c15)._m0[int(_3505)][_3507];
        int _3511 = _3493 + 8;
        uint _3513 = uint(int(uint(_3511) >> uint(2)));
        uint _3515 = uint(int(uint(int(_3513)) >> uint(2)));
        int _3517 = int(_3513) & 3;
        float _3519 = (*spvDescriptorSet0.vp_c15)._m0[int(_3515)][_3517];
        int _3521 = int(_3513) + 1;
        uint _3523 = uint(int(uint(_3521) >> uint(2)));
        int _3525 = _3521 & 3;
        float _3527 = (*spvDescriptorSet0.vp_c15)._m0[int(_3523)][_3525];
        float _3529 = _2892 * _3509;
        float _3531 = fma(_1027, _3501, _3529);
        float _3533 = fma(_1029, _3519, _3531);
        float _3535 = _3533 + _3527;
        float _3537 = precise::clamp(_3535, 0.0, 1.0);
        float _3539 = -_3537;
        float _3541 = _3539 + _3485;
        float _3543 = fma(_3541, 500.0, 1.5);
        float _3545 = exp2(_3543);
        float _3547 = 0.0 + _3545;
        float _3549 = precise::clamp(_3547, 0.0, 1.0);
        _3442 = _3509;
        _3489 = _3549;
    }
    float _3551 = _3442;
    float _3553 = _3489;
    float _3555 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3557 = _3178 + _3555;
    float _3559 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3561 = _3180 + _3559;
    float _3563 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3565 = _3182 + _3563;
    float _3567 = _3557 * _3557;
    float _3569 = fma(_3561, _3561, _3567);
    float _3571 = fma(_3565, _3565, _3569);
    float _3573 = rsqrt(_3571);
    float _3575 = _3573 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3577 = _3561 * _3575;
    float _3579 = _3565 * _3575;
    float _3581 = _3577 * _3577;
    float _3583 = _3579 * _3579;
    float _3585 = _3581 + _3583;
    float _3587 = sqrt(_3585);
    bool _3589 = _3587 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3591 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3593 = _3587 + _3591;
    float _3595 = _3569;
    float _3597 = _3593;
    float _3599 = _3551;
    float _3601 = _3557;
    float _3603 = _3581;
    if (_3589)
    {
        float _3605 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3595 = _3605;
    }
    float _3607 = _3595;
    float _3609 = _3607;
    if (_3589)
    {
        float _3611 = _3593 * _3607;
        _3597 = _3611;
    }
    float _3613 = _3597;
    if (_3589)
    {
        float _3615 = rsqrt(_3585);
        _3609 = _3615;
    }
    float _3617 = _3609;
    float _3619 = _3617;
    if (_3589)
    {
        float _3621 = _3613 * 0.15915493667125701904296875;
        _3599 = _3621;
    }
    float _3623 = _3599;
    float _3625 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3627 = _3573;
    if (_3589)
    {
        float _3629 = _3623 * 6.283185482025146484375;
        float _3631 = sin(_3629);
        _3627 = _3631;
    }
    float _3633 = _3627;
    float _3635 = precise::max(0.0, _3625);
    float _3637 = _3565;
    float _3639 = _3635;
    if (_3589)
    {
        float _3641 = _3623 * 6.283185482025146484375;
        float _3643 = cos(_3641);
        _3637 = _3643;
    }
    float _3645 = _3637;
    float _3647 = -_3575;
    float _3649 = -_3635;
    float _3651 = fma(_3557, _3647, _3649);
    if (_3589)
    {
        float _3653 = _3651 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3601 = _3653;
    }
    float _3655 = _3601;
    float _3657 = _3633;
    float _3659 = _3655;
    if (_3589)
    {
        float _3661 = fma(_3633, _3655, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3657 = _3661;
    }
    float _3663 = _3657;
    float _3665 = _3663;
    if (!_3589)
    {
        _3659 = _3651;
    }
    float _3667 = _3659;
    float _3669 = _3667;
    if (_3589)
    {
        float _3671 = _3617 * _3663;
        _3444 = _3671;
    }
    float _3673 = _3444;
    if (!_3589)
    {
        _3665 = _3577;
    }
    float _3675 = _3665;
    float _3677 = _3675;
    if (_3589)
    {
        float _3679 = _3645 + (-1.0);
        _3639 = _3679;
    }
    float _3681 = _3639;
    float _3683 = _3681;
    if (_3589)
    {
        float _3685 = _3577 * _3673;
        _3677 = _3685;
    }
    float _3687 = _3677;
    if (_3589)
    {
        float _3689 = _3681 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3619 = _3689;
    }
    float _3691 = _3619;
    float _3693 = _3691;
    if (!_3589)
    {
        _3683 = _3579;
    }
    float _3695 = _3683;
    float _3697 = _3695;
    if (_3589)
    {
        float _3699 = _3579 * _3673;
        _3697 = _3699;
    }
    float _3701 = _3697;
    if (_3589)
    {
        float _3703 = _3687 * _3687;
        _3603 = _3703;
    }
    float _3705 = _3603;
    if (_3589)
    {
        float _3707 = fma(_3651, _3645, _3691);
        _3669 = _3707;
    }
    float _3709 = _3669;
    if (!_3589)
    {
        _3693 = _3583;
    }
    float _3711 = _3693;
    float _3713 = _3711;
    if (_3589)
    {
        float _3715 = _3701 * _3701;
        _3713 = _3715;
    }
    float _3717 = _3713;
    float _3719 = sqrt(_3571);
    float _3721 = fma(_3709, _3709, _3705);
    float _3723 = _3721 + _3717;
    float _3725 = rsqrt(_3723);
    float _3727 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3729 = fma(_3719, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3727);
    float _3731 = precise::clamp(_3729, 0.0, 1.0);
    float _3733 = -_3731;
    float _3735 = _3733 + 1.0;
    float _3737 = _3725 * _3687;
    float _3739 = _3725 * _3709;
    float _3741 = _3725 * _3701;
    float _3743 = _3737 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3745 = _3739 + 1.0;
    float _3747 = abs(_3735);
    float _3749 = log2(_3747);
    float _3751 = -_3743;
    float _3753 = fma(_3739, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3751);
    float _3755 = -_3741;
    float _3757 = fma(_3755, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3753);
    float _3759 = fma(_3757, -0.5, 0.5);
    float _3761 = fma(_3757, 0.5, 0.5);
    float _3763 = fma(_3761, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3765 = _3749 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3767 = sqrt(_3759);
    float _3769 = fma(_3761, _3763, -0.212114393711090087890625);
    float _3771 = fma(_3761, _3769, 1.570728778839111328125);
    float _3773 = exp2(_3765);
    float _3775 = _3767 * 0.636619746685028076171875;
    float _3777 = -_3771;
    float _3779 = fma(_3775, _3777, 1.0);
    float _3781 = -_3739;
    float _3783 = fma(_3773, _3745, _3781);
    float _3785 = fma(_3783, 0.5, 0.5);
    float2 _9955 = float2(_3779, _3785);
    float3 _3787 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9955, float2(0.0), isnan(_9955)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9955, float2(0.0), isnan(_9955)), level(0.0)).xyz;
    float _3789 = _3787.x;
    float _3791 = _3787.y;
    float _3793 = _3787.z;
    float _3795 = abs(_2928);
    float _3797 = log2(_3795);
    float _3799 = -_2866;
    float _3801 = _3799 + 1.0;
    out.m_90.x = _3180;
    out.m_90.y = _3178;
    out.m_90.z = _3182;
    bool _3803 = _2928 <= 8000.0;
    bool _3805 = isnan(_2928);
    bool _3807 = _3803 || _3805;
    bool _3809 = isnan(8000.0);
    bool _3811 = _3807 || _3809;
    float _3813 = float(_3811);
    float _3815 = _3797 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3817 = _3324 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3819 = fma(_3330, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3817);
    float _3821 = exp2(_3815);
    float _3823 = fma(_3218, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3819);
    float _3825 = fma(_3348, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3823);
    float _3827 = fma(_3821, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3829 = precise::clamp(_3827, 0.0, 1.0);
    float _3831 = fma(_3829, -2.0, 3.0);
    float _3833 = _3829 * _3829;
    float _3835 = _3833 * _3831;
    float _3837 = _3749 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3839 = _3825 + _3366;
    float _3841 = -_3835;
    float _3843 = _3841 + 1.0;
    float _3845 = _3839 * 0.5;
    float _3847 = exp2(_3837);
    float _3849 = fma(_3843, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3835);
    out.m_92.z = _3845;
    out.m_92.w = _3366;
    float _3851 = _3813 * _3849;
    float _3853 = _3813;
    float _3855 = _3825;
    float _3857 = _3410;
    float _3859 = _3801;
    if (!_3362)
    {
        _3853 = 1.0;
    }
    float _3861 = _3853;
    float _3863 = _3861;
    if (_3362)
    {
        bool _3865 = _3466 >= _3432;
        bool _3867 = isnan(_3466);
        bool _3869 = _3865 || _3867;
        bool _3871 = isnan(_3432);
        bool _3873 = _3869 || _3871;
        float _3875 = float(_3873);
        _3863 = _3875;
    }
    float _3877 = _3863;
    float _3879 = _3851 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _3410;
    out.gl_Position.y = _3404;
    out.gl_Position.z = _3825;
    out.gl_Position.w = _3366;
    bool _3881 = _3719 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3883 = isnan(_3719);
    bool _3885 = _3881 || _3883;
    bool _3887 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3889 = _3885 || _3887;
    float _3891 = _3801 * _3879;
    float _3893 = precise::clamp(_3891, 0.0, 1.0);
    float _3895 = _3877 * _3553;
    float _3897 = -_3847;
    float _3899 = _3897 + 1.0;
    float _3901 = -_3893;
    float _3903 = fma(_3901, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3905 = _3899 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3907 = -_3895;
    float _3909 = fma(_3907, _3903, 1.0);
    float _3911 = precise::clamp(_3909, 0.0, 1.0);
    float _3913 = _3905 * _3468;
    float _3915 = -_3905;
    float _3917 = _3915 + 1.0;
    float _3919 = _3911 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3921 = _3911;
    if (!_3889)
    {
        _3855 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3923 = _3855;
    float _3925 = _3479 * _3913;
    float _3927 = _3479 * _3917;
    float _3929 = _3923;
    float _3931 = _3923;
    if (!_3889)
    {
        _3857 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3933 = _3857;
    out.m_94.x = _3919;
    float _3935 = _3933;
    float _3937 = _3933;
    if (!_3889)
    {
        _3921 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3939 = _3921;
    float _3941 = _3939;
    float _3943 = _3939;
    if (!_3889)
    {
        _3859 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3945 = _3859;
    float _3947 = _3793 * _3913;
    float _3949 = fma(_3789, _3925, _3473);
    float _3951 = fma(_3791, _3925, _3475);
    float _3953 = _3791;
    float _3955 = _3789;
    float _3957 = _3945;
    float _3959 = _3945;
    if (!_3889)
    {
        _3953 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3961 = _3953;
    float _3963 = fma(_3479, _3947, _3477);
    float _3965 = _3961;
    float _3967 = _3961;
    if (!_3889)
    {
        _3955 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3969 = _3955;
    out.m_96.x = _3949;
    out.m_96.y = _3951;
    out.m_96.z = _3963;
    out.m_96.w = _3927;
    bool _3971 = !_3889;
    float _3973 = _3969;
    float _3975 = _3969;
    if (!_3971)
    {
        bool _3977 = _3719 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3979 = isnan(_3719);
        bool _3981 = _3977 || _3979;
        bool _3983 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3985 = _3981 || _3983;
        if (!_3985)
        {
            float _3987 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3989 = _3719 + _3987;
            float _3991 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3993 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3991;
            float _3995 = 1.0 / _3993;
            float _3997 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3999 = _3997 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4001 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4003 = _4001 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4005 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4007 = _4005 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4009 = _3989 * _3995;
            float _4011 = precise::clamp(_4009, 0.0, 1.0);
            float _4013 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4015 = _4013 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4017 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4019 = _4017 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4021 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4023 = _4021 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4025 = fma(_4011, _4007, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            float _4027 = fma(_4011, _4015, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4029 = fma(_4011, _4019, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4031 = fma(_4011, _4023, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4033 = fma(_4011, _3999, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4035 = fma(_4011, _4003, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            _3937 = _4029;
            _3967 = _4035;
            _3931 = _4027;
            _3959 = _4033;
            _3943 = _4031;
            _3975 = _4025;
            _4037 = true;
        }
        else
        {
            bool _4039 = _3719 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4041 = isnan(_3719);
            bool _4043 = _4039 || _4041;
            bool _4045 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4047 = _4043 || _4045;
            if (!_4047)
            {
                _3929 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4049 = _3929;
            _3931 = _4049;
            if (!_4047)
            {
                _3935 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4051 = _3935;
            _3937 = _4051;
            if (!_4047)
            {
                _3941 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4053 = _3941;
            _3943 = _4053;
            if (!_4047)
            {
                _3957 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4055 = _3957;
            _3959 = _4055;
            if (!_4047)
            {
                _3965 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4057 = _3965;
            _3967 = _4057;
            if (!_4047)
            {
                _3973 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4059 = _3973;
            bool _4061 = !_4047;
            _3975 = _4059;
            if (!_4061)
            {
                bool _4063 = _3719 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4065 = isnan(_3719);
                bool _4067 = _4063 || _4065;
                bool _4069 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4071 = _4067 || _4069;
                if (!_4071)
                {
                    float _4073 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4075 = _3719 + _4073;
                    float _4077 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4079 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4077;
                    float _4081 = 1.0 / _4079;
                    float _4083 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4085 = _4083 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4087 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4089 = _4087 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4091 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4093 = _4091 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4095 = _4075 * _4081;
                    float _4097 = precise::clamp(_4095, 0.0, 1.0);
                    float _4099 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4101 = _4099 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4103 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4105 = _4103 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4107 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4109 = _4107 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4111 = fma(_4097, _4093, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    float _4113 = fma(_4097, _4101, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4115 = fma(_4097, _4105, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4117 = fma(_4097, _4109, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4119 = fma(_4097, _4085, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4121 = fma(_4097, _4089, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    _3937 = _4115;
                    _3967 = _4121;
                    _3931 = _4113;
                    _3959 = _4119;
                    _3943 = _4117;
                    _3975 = _4111;
                    _4037 = true;
                }
                else
                {
                    _3937 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3967 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3931 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3959 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3943 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3975 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4037 = false;
    float _4123 = _3937;
    float _4125 = _3967;
    float _4127 = _3931;
    float _4129 = _3959;
    float _4131 = _3943;
    float _4133 = _3975;
    float _4135 = fma(_2778, -0.5, 0.5);
    float _4137 = precise::clamp(_4135, 0.0, 1.0);
    float _4139 = -_4123;
    float _4141 = _4139 + _4125;
    float _4143 = -_4127;
    float _4145 = _4143 + _4129;
    float _4147 = -_4131;
    float _4149 = _4147 + _4133;
    bool _4151 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4153 = fma(_4137, _4141, _4123);
    float _4155 = fma(_4137, _4145, _4127);
    float _4157 = fma(_4137, _4149, _4131);
    float _4159 = _4153 * 0.586610972881317138671875;
    out.m_63.x = 1.0;
    float _4161 = fma(_4155, 0.298911988735198974609375, _4159);
    float _4163 = fma(_4157, 0.114477999508380889892578125, _4161);
    out.m_98.x = 0.0;
    float _4165 = -_4163;
    float _4167 = _4155 + _4165;
    float _4169 = -_4163;
    float _4171 = _4153 + _4169;
    float _4173 = -_4163;
    float _4175 = _4157 + _4173;
    float _4177 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4179 = fma(_4167, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4163);
    float _4181 = fma(_4171, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4163);
    float _4183 = fma(_4175, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4163);
    out.m_94.w = _4177;
    out.m_100.x = _4179;
    out.m_100.y = _4181;
    out.m_100.z = _4183;
    if (!_4151)
    {
        return out;
    }
    float _4185 = -_3178;
    float _4187 = _4185 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4189 = -_3180;
    float _4191 = _4189 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4193 = -_3182;
    float _4195 = _4193 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4197 = _4187 * _4187;
    float _4199 = fma(_4191, _4191, _4197);
    float _4201 = fma(_4195, _4195, _4199);
    float _4203 = sqrt(_4201);
    float _4205 = rsqrt(_4201);
    float _4207 = -_4203;
    float _4209 = _4207 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4211 = _4209 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4213 = precise::clamp(_4211, 0.0, 1.0);
    float _4215 = _4191 * _4205;
    float _4217 = _4187 * _4205;
    float _4219 = abs(_4213);
    float _4221 = log2(_4219);
    float _4223 = _4195 * _4205;
    float _4225 = _4215 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4227 = _2778 * _4217;
    float _4229 = -_4217;
    float _4231 = -_4225;
    float _4233 = fma(_4229, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4231);
    float _4235 = fma(_2768, _4215, _4227);
    float _4237 = -_4223;
    float _4239 = fma(_4237, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4233);
    float _4241 = fma(_2780, _4223, _4235);
    float _4243 = precise::clamp(_4241, 0.0, 1.0);
    float _4245 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4247 = _4239 + _4245;
    float _4249 = _4221 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4251 = _4247 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4253 = precise::clamp(_4251, 0.0, 1.0);
    float _4255 = exp2(_4249);
    float _4257 = _4255 * _4253;
    float _4259 = _4243 * _4257;
    float _4261 = _4259 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4263 = _4259 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4265 = _4259 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_98.x = _4261;
    out.m_98.y = _4263;
    out.m_98.z = _4265;
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
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4037 = false;
    bool _2818 = false;
    bool _215 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _114 = in.m_60.w;
    float _116 = trunc(_114);
    int _119 = int(_116);
    bool _123 = _119 >= 1;
    float _125 = 0.0;
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    float _129 = _127;
    if (!_123)
    {
        out.m_63.x = 0.0;
    }
    int _131 = 0;
    if (!_123)
    {
        float _133 = _127 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    int _137 = _135;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4322 = as_type<float>(_135);
        out.gl_Position.z = _4322;
    }
    if (!_123)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _139 = in.m_65.w;
    bool _141 = _139 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_139);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = -_139;
    float _153 = _151 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _155 = _153;
    if (_149)
    {
        float _157 = float(_119);
        _129 = _157;
    }
    float _159 = _129;
    bool _161 = _153 >= _159;
    bool _163 = !_149;
    bool _165 = _161 || _163;
    float _167 = _159;
    if (_165)
    {
        _167 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _167;
    if (_165)
    {
        out.m_63.x = 0.0;
    }
    if (_165)
    {
        float _171 = _169 * 5.0;
        _137 = as_type<int>(_171);
    }
    int _173 = _137;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4392 = as_type<float>(_173);
        out.gl_Position.z = _4392;
    }
    if (_165)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _175 = as_type<float>(int(gl_VertexIndex));
    bool _177 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _179 = as_type<int>(_175) & 1;
    bool _181 = _179 != 0;
    int _183 = as_type<int>(_175) & 2;
    bool _185 = _183 != 0;
    bool _187 = !_181;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_185;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_177;
    float _213;
    if (!_195)
    {
        float _197 = in.m_70.x;
        float _199 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _201 = _197 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _203 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[12].x, _153);
        float _205 = _203 * _199;
        float _207 = floor(_205);
        float _209 = -_207;
        float _211 = _205 + _209;
        _213 = _211;
        _215 = true;
    }
    else
    {
        float _217 = float(_119);
        float _219 = 1.0 / _217;
        float _221 = _153 * _219;
        _213 = _221;
    }
    _215 = false;
    float _223 = _213;
    float _225 = in.m_70.x;
    float _227 = in.m_70.y;
    float _229 = in.m_70.z;
    float _231 = in.m_70.w;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _235 = _223 + _233;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _239 = _223 + _237;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _241;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _247 = _245 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _251 = _223 + _249;
    float _253 = 1.0 / _243;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _255;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _261 = _259 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _263 = 1.0 / _247;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _269 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _271 = _269 != 0;
    float _273 = _225 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _275 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _277 = _275 != 0;
    int _279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _281 = _279 != 0;
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _285 = _283 != 0;
    float _287 = 1.0 / _257;
    float _289 = _227 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _291 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _293 = isnan(_223);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    bool _303 = !_281;
    int _305 = _303 ? 0 : 1;
    float _307 = fma(_289, -2.0, _267);
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _311 = _223 + _309;
    bool _313 = !_277;
    int _315 = _313 ? 0 : 1;
    float _317 = 1.0 / _261;
    float _319 = -_265;
    float _321 = fma(_273, 2.0, _319);
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _323;
    float _327 = _311 * _263;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _331 = _223 + _329;
    float _333 = _229 + _225;
    float _335 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[76].y, _307);
    float _337 = 1.0 / _325;
    float _339 = _225 * 2.0;
    float _341 = _331 * _253;
    float _343 = _333 + (-1.0);
    float _345 = _225 + _227;
    float _347 = _239 * _287;
    float _349 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _351 = floor(_339);
    float _353 = _227 * 2.0;
    float _355 = _345 + (-1.0);
    float _357 = _229 * 2.0;
    float _359 = _235 * _317;
    float _361 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _363 = _229 + _227;
    float _365 = floor(_353);
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _367;
    float _371 = _363 + (-1.0);
    bool _373 = !_285;
    int _375 = _373 ? 0 : 1;
    float _377 = _251 * _337;
    float _379 = fma(_369, _341, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _381 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _383 = floor(_357);
    bool _385 = _351 > 0.0;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _387;
    bool _391 = _351 >= 0.0;
    bool _393 = isnan(_351);
    bool _395 = _391 || _393;
    bool _397 = isnan(0.0);
    bool _399 = _395 || _397;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _405 = fma(_389, _341, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _407 = _399 ? 0 : 1;
    float _409 = -_301;
    float _411 = _409 + 1.0;
    bool _413 = _365 > 0.0;
    float _415 = fma(_403, _327, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _417 = _365 >= 0.0;
    bool _419 = isnan(_365);
    bool _421 = _417 || _419;
    bool _423 = isnan(0.0);
    bool _425 = _421 || _423;
    bool _427 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _429 = isnan(_223);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    int _439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _441 = _439 != 0;
    int _443 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _445 = _443 != 0;
    int _447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _449 = _447 != 0;
    int _451 = ~_407;
    int _453 = _451 + 1;
    int _455 = _453 + 1;
    float _457 = _437 * _411;
    int _459 = _455;
    int _461 = as_type<int>(_337);
    if (!_385)
    {
        int _463 = ~_407;
        int _465 = _463 + 1;
        _459 = _465;
    }
    int _467 = _459;
    float _469 = -_437;
    float _471 = _469 + 1.0;
    bool _473 = !_441;
    float _475 = _473 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _477 = _383 > 0.0;
    bool _479 = _383 >= 0.0;
    bool _481 = isnan(_383);
    bool _483 = _479 || _481;
    bool _485 = isnan(0.0);
    bool _487 = _483 || _485;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _491 = _489 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _493 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _495 = isnan(_223);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    bool _505 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _507 = isnan(_223);
    bool _509 = _505 || _507;
    bool _511 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _513 = _509 || _511;
    float _515 = float(_513);
    float _517 = fma(_491, _327, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _519 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _521 = isnan(_223);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = _503 * _471;
    bool _533 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _535 = isnan(_223);
    bool _537 = _533 || _535;
    bool _539 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _541 = _537 || _539;
    float _543 = float(_541);
    float _545 = -_515;
    float _547 = _545 + 1.0;
    float _549 = -_503;
    float _551 = _549 + 1.0;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _553;
    float _557 = _543 * _547;
    float _559 = _515 * _551;
    float _561 = -_543;
    float _563 = _561 + 1.0;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _567 = _565 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _573 = fma(_555, _347, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _575 = _529 * _563;
    float _577 = fma(_567, _359, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _579 = fma(_571, _359, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _581 = _567;
    float _583 = _475;
    if (_271)
    {
        _461 = 0;
    }
    int _585 = _461;
    float _587 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _589 = log2(_587);
    int _591 = _585;
    if (!_271)
    {
        _591 = 1;
    }
    int _593 = _591;
    float _595 = -_529;
    float _597 = _595 + 1.0;
    int _599 = _487 ? 0 : 1;
    float _601 = _405 * _575;
    bool _603 = _593 != 1;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _605;
    float _609 = float(_119);
    float _611 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _613 = int(_611);
    int _615 = ~_599;
    int _617 = _615 + 1;
    int _619 = _617 + 1;
    float _621 = fma(_607, _347, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _623 = _379 * _575;
    int _625 = _619;
    float _627 = _601;
    if (!_477)
    {
        int _629 = ~_599;
        int _631 = _629 + 1;
        _625 = _631;
    }
    int _633 = _625;
    float _635 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[143].y, _601);
    float _637 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[143].x, _623);
    float _639 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _641 = int(_639);
    float _643 = _589 * _153;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_603)
    {
        _581 = _227;
    }
    float _647 = _581;
    float _649 = fma(_415, _557, _635);
    float _651 = _647;
    if (_603)
    {
        _651 = _225;
    }
    float _653 = _651;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _657 = 1.0 / _609;
    float _659 = float(_633);
    float _661 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[83].z, _645);
    float _663 = float(_613);
    float _665 = exp2(_643);
    int _667 = abs(as_type<int>(_475));
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _671 = 1.0 + _669;
    if (!_603)
    {
        _583 = _229;
    }
    float _673 = _583;
    float _675 = float(_667);
    float _677 = _673;
    if (_603)
    {
        _677 = _227;
    }
    float _679 = _677;
    float _681 = 1.0 / _663;
    float _683 = float(_641);
    float _685 = _675 * _659;
    float _687 = as_type<float>(_641);
    if (!_603)
    {
        _627 = _227;
    }
    float _689 = _627;
    float _691 = in.m_72.x;
    float _693 = in.m_72.y;
    float _695 = in.m_72.z;
    float _697 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[83].w, _655);
    float _699 = _657 * _153;
    float _701 = 1.0 / _683;
    float _703 = _689;
    if (_603)
    {
        _703 = _225;
    }
    float _705 = _703;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (!_603)
    {
        _687 = _229;
    }
    float _709 = _687;
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _713 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _715 = isnan(0.0);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _721 = _717 || _719;
    float _723 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[78].z, _707);
    float _725 = -_665;
    float _727 = _725 + 1.0;
    float _729 = 1.0 / _671;
    float _731 = _705 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _733 = _709;
    if (_603)
    {
        _733 = _227;
    }
    float _735 = _733;
    float _737 = -_153;
    float _739 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[76].x, _321);
    float _741 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].z, _723);
    bool _743 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _745 = isnan(1.0);
    bool _747 = _743 || _745;
    bool _749 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _751 = _747 || _749;
    float _753 = -_711;
    float _755 = fma(_731, 2.0, _753);
    bool _757 = !_445;
    int _759 = _757 ? 0 : 1;
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _763 = _721 ? _727 : 0.0;
    float _765 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[82].w, _697);
    float _767 = _735 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _771 = !_449;
    int _773 = _771 ? 0 : 1;
    float _775 = -_153;
    float _777 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[81].x, _755);
    int _779 = abs(_759);
    float _781 = _685 * (-2.0);
    float _783 = fma(_767, -2.0, _761);
    float _785 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[78].w, _769);
    int _787 = abs(_773);
    float _789 = fma(_781, _691, _691);
    float _791 = float(_467);
    float _793 = _681 * _153;
    float _795 = float(_779);
    float _797 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[82].z, _661);
    float _799 = _701 * _153;
    float _801 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].w, _785);
    float _803 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[81].y, _783);
    float _805 = _783;
    if (_751)
    {
        float _807 = _763 * _729;
        _155 = _807;
    }
    float _809 = _155;
    float _811 = _225 + (-0.5);
    float _813 = _795 * _791;
    int _815 = _425 ? 0 : 1;
    float _817 = fma(_361, _781, _361);
    float _819 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[196].x, _789);
    float _821 = _813 * (-2.0);
    int _823 = ~_815;
    int _825 = _823 + 1;
    int _827 = _825 + 1;
    float _829 = _227 + (-0.5);
    int _831 = _827;
    if (!_413)
    {
        int _833 = ~_815;
        int _835 = _833 + 1;
        _831 = _835;
    }
    int _837 = _831;
    float _839 = fma(_821, _693, _693);
    float _841 = fma(_817, _809, _819);
    float _843 = float(_837);
    float _845 = fma(_381, _821, _381);
    float _847 = float(_787);
    float _849 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[196].y, _839);
    float _851 = _841 * 0.15915493667125701904296875;
    float _853 = _847 * _843;
    float _855 = fma(_517, _557, _637);
    float _857 = fma(_845, _809, _849);
    float _859 = fma(_621, _559, _649);
    float _861 = in.m_74.x;
    float _863 = in.m_74.y;
    float _865 = _853 * (-2.0);
    float _867 = _857 * 0.15915493667125701904296875;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _869;
    float _873 = _229 + (-0.5);
    float _875 = fma(_865, _695, _695);
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _877;
    float _881 = fma(_573, _559, _855);
    float _883 = fma(_579, _531, _859);
    float _885 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[196].z, _875);
    float _887 = fma(_871, _377, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _889 = fma(_879, _377, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _891 = fma(_577, _531, _881);
    float _893 = fma(_349, _865, _349);
    float _895 = _851 * 6.283185482025146484375;
    float _897 = sin(_895);
    float _899 = fma(_889, _457, _883);
    float _901 = fma(_887, _457, _891);
    float _903 = fma(_893, _809, _885);
    float _905 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _189);
    float _907 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[148].y, _899);
    float _909 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[148].x, _901);
    float _911 = _903 * 0.15915493667125701904296875;
    float _913 = _851 * 6.283185482025146484375;
    float _915 = cos(_913);
    float _917 = _907 * _863;
    float _919 = _909 * _861;
    float _921 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _193);
    float _923 = _917 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _925 = _919 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _927 = _867 * 6.283185482025146484375;
    float _929 = sin(_927);
    float _931 = _923 * _921;
    float _933 = _925 * _905;
    float _935 = in.m_60.x;
    float _937 = in.m_60.y;
    float _939 = in.m_60.z;
    float _941 = _867 * 6.283185482025146484375;
    float _943 = cos(_941);
    float _945 = _911 * 6.283185482025146484375;
    float _947 = cos(_945);
    float _949 = _897 * _929;
    float _951 = _915 * _929;
    float _953 = _911 * 6.283185482025146484375;
    float _955 = sin(_953);
    float _957 = _915 * _943;
    float _959 = _897 * _943;
    float _961 = _915 * _947;
    float _963 = _897 * _947;
    float _965 = _943 * _947;
    float _967 = _929 * _947;
    float _969 = _961 * _931;
    float _971 = _963 * _931;
    float _973 = fma(_955, _957, _949);
    float _975 = fma(_955, _949, _957);
    float _977 = -_951;
    float _979 = fma(_955, _959, _977);
    float _981 = -_931;
    float _983 = _955 * _981;
    float _985 = -_959;
    float _987 = fma(_955, _951, _985);
    float _989 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _991 = fma(_973, _933, _969);
    float _993 = fma(_965, _933, _983);
    float _995 = fma(_979, _933, _971);
    float _997 = fma(_987, _989, _991);
    float _999 = fma(_967, _989, _993);
    float _1001 = fma(_975, _989, _995);
    float _1003 = _937 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1005 = _937 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1007 = _997 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1009 = _997 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1011 = fma(_935, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1003);
    float _1013 = fma(_935, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1005);
    float _1015 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1007);
    float _1017 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1009);
    float _1019 = fma(_939, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1011);
    float _1021 = fma(_939, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1013);
    float _1023 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1015);
    float _1025 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1017);
    float _1027 = _1019 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1029 = _1021 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1031 = _1023 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1033 = _1025 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1035 = _937 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1037 = _1027 + _1031;
    float _1039 = _1029 + _1033;
    float _1041 = fma(_935, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1035);
    float _1043 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1045 = _1037 + _1043;
    float _1047 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1049 = _1039 + _1047;
    float _1051 = fma(_939, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1041);
    float _1053 = _1045 * _1045;
    float _1055 = _1049 * _1049;
    float _1057 = _1053 + _1055;
    float _1059 = sqrt(_1057);
    bool _1061 = _1059 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1063 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1065 = _1059 + _1063;
    float _1067 = _865;
    float _1069 = _939;
    float _1071 = _997;
    float _1073 = _1051;
    float _1075 = _1053;
    float _1077 = _1055;
    if (_1061)
    {
        float _1079 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1067 = _1079;
    }
    float _1081 = _1067;
    if (_1061)
    {
        float _1083 = rsqrt(_1057);
        _1069 = _1083;
    }
    float _1085 = _1069;
    float _1087 = _1081;
    if (_1061)
    {
        float _1089 = _1065 * _1081;
        _1087 = _1089;
    }
    float _1091 = _1087;
    float _1093 = _997 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1095 = _1091;
    if (!_1061)
    {
        _1071 = _1039;
    }
    float _1097 = _1071;
    float _1099 = _1097;
    if (_1061)
    {
        float _1101 = _1091 * 0.15915493667125701904296875;
        _1095 = _1101;
    }
    float _1103 = _1095;
    float _1105 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1093);
    float _1107 = _935;
    float _1109 = _1103;
    if (_1061)
    {
        float _1111 = _1103 * 6.283185482025146484375;
        float _1113 = sin(_1111);
        _1107 = _1113;
    }
    float _1115 = _1107;
    float _1117 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1105);
    float _1119 = _1051 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1121 = _1117 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1123 = _1119 + _1121;
    float _1125 = _1121;
    float _1127 = _1123;
    int _1129 = as_type<int>(_1119);
    if (!_1061)
    {
        _1125 = _1037;
    }
    float _1131 = _1125;
    float _1133 = _1131;
    if (_1061)
    {
        float _1135 = _1123 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1073 = _1135;
    }
    float _1137 = _1073;
    float _1139 = _1137;
    if (_1061)
    {
        float _1141 = fma(_1115, _1137, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1139 = _1141;
    }
    float _1143 = _1139;
    float _1145 = _1143;
    if (_1061)
    {
        float _1147 = _1085 * _1143;
        _1145 = _1147;
    }
    float _1149 = _1145;
    if (_1061)
    {
        float _1151 = fma(_1045, _1149, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1133 = _1151;
    }
    float _1153 = _1133;
    if (_1061)
    {
        float _1155 = fma(_1049, _1149, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1099 = _1155;
    }
    float _1157 = _1099;
    float _1159 = fma(_1153, 6.2500002968590706586837768554688e-05, 0.5);
    float _1161 = fma(_1157, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5942 = float2(_1159, _1161);
    float3 _1165 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5942, float2(0.0), isnan(_5942)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5942, float2(0.0), isnan(_5942)), level(0.0)).xyz;
    float _1167 = _1165.x;
    float _1169 = _1165.y;
    float _1171 = _1165.z;
    float _1173 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1175 = int(_1173);
    if (_271)
    {
        float _1177 = in.m_70.x;
        _805 = _1177;
    }
    float _1179 = _805;
    int _1181 = abs(_305);
    float _1183 = -_801;
    float _1185 = _1183 + 1.0;
    int _1187 = abs(_315);
    float _1189 = _1179;
    if (!_271)
    {
        float _1191 = in.m_70.y;
        _1189 = _1191;
    }
    float _1193 = _1189;
    float _1195 = -_741;
    float _1197 = _1195 + 1.0;
    float _1199 = trunc(_799);
    int _1201 = int(_1199);
    float _1203 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1205 = float(uint(_1175));
    float _1207 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1209 = int(_1207);
    int _1211 = ~_1175;
    int _1213 = _1211 + 1;
    float _1215 = float(_1175);
    int _1217 = ~_1175;
    int _1219 = _1217 + 1;
    float _1221 = float(uint(_1201));
    float _1223 = 1.0 / _1205;
    bool _1225 = _1175 == 0;
    float _1227 = float(uint(_1209));
    float _1229 = _1205;
    if (_1061)
    {
        float _1231 = _1103 * 6.283185482025146484375;
        float _1233 = cos(_1231);
        _1109 = _1233;
    }
    float _1235 = _1109;
    if (_271)
    {
        _1229 = 1.0;
    }
    float _1237 = _1229;
    float _1239 = _1237;
    if (!_271)
    {
        _1239 = 7.345489978790283203125;
    }
    float _1241 = _1239;
    int _1243 = ~_1209;
    int _1245 = _1243 + 1;
    int _1247 = as_type<int>(_1223) + (-2);
    float _1249 = 1.0 / _1227;
    float _1251 = _1241 * _225;
    bool _1253 = _1209 == 0;
    float _1255 = as_type<float>(_1247) * _1221;
    float _1257 = trunc(_793);
    int _1259 = int(_1257);
    float _1261 = trunc(_1255);
    float _1263 = precise::max(_1261, 0.0);
    uint _1266 = uint(_1263);
    float _1268 = floor(_1251);
    int _1270 = _1213 * int(_1266);
    int _1272 = _1270 + _1201;
    float _1274 = float(uint(_1272));
    int _1276 = as_type<int>(_1249) + (-2);
    float _1278 = -_1268;
    float _1280 = _1251 + _1278;
    float _1282 = float(uint(_1259));
    float _1284 = as_type<float>(_1247) * _1274;
    float _1286 = float(_1201);
    float _1288 = _1280 * _1215;
    float _1290 = as_type<float>(_1276) * _1282;
    bool _1292 = _1286 >= _1215;
    bool _1294 = isnan(_1286);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan(_1215);
    bool _1300 = _1296 || _1298;
    float _1302 = float(_1300);
    float _1304 = trunc(_1284);
    float _1306 = precise::max(_1304, 0.0);
    uint _1308 = uint(_1306);
    float _1310 = _1215 * _699;
    float _1312 = trunc(_1290);
    float _1314 = precise::max(_1312, 0.0);
    uint _1316 = uint(_1314);
    int _1318 = int(_1266) + int(_1308);
    float _1320 = trunc(_1302);
    int _1322 = int(_1320);
    int _1324 = _1219 * _1318;
    int _1326 = _1324 + _1201;
    int _1328 = _1245 * int(_1316);
    int _1330 = _1328 + _1259;
    float _1332 = as_type<float>(_1245);
    if (_271)
    {
        _1332 = 1.0;
    }
    float _1334 = _1332;
    float _1336 = trunc(_1288);
    int _1338 = int(_1336);
    bool _1340 = uint(_1326) >= uint(_1175);
    float _1342 = float(uint(_1330));
    bool _1344 = !_1340;
    int _1346 = _1344 ? 0 : (-1);
    float _1348 = as_type<float>(_1276) * _1342;
    int _1350 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1352 = _1350 != 0;
    float _1354 = trunc(_1310);
    int _1356 = int(_1354);
    int _1358 = ~_1318;
    int _1360 = _1358 + _1346;
    int _1362 = _1360 + 1;
    bool _1364 = !_1352;
    int _1366 = _1364 ? 0 : 1;
    float _1368 = _1334;
    if (!_271)
    {
        _1368 = 1.2345600128173828125;
    }
    float _1370 = _1368;
    int _1372 = abs(_1366);
    float _1374 = trunc(_1348);
    float _1376 = precise::max(_1374, 0.0);
    uint _1378 = uint(_1376);
    int _1380 = _1175 * _1362;
    int _1382 = _1380 + _1201;
    float _1384 = _1193 * _1370;
    int _1386 = ~_1209;
    int _1388 = _1386 + 1;
    int _1390 = _1338 * _1372;
    int _1392 = _1390 + _1201;
    int _1394 = ~_1322;
    int _1396 = _1394 + 1;
    int _1398 = _1396 + 1;
    bool _1400 = !_1225;
    int _1402 = _1400 ? _1382 : (-1);
    int _1404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1406 = _1404 != 0;
    int _1408 = _1402 * _1398;
    float _1410 = floor(_1384);
    int _1412 = int(_1316) + int(_1378);
    int _1414 = _1175 + (-1);
    int _1416 = _1388 * _1412;
    int _1418 = _1416 + _1259;
    int _1420 = _1322 * _1414;
    int _1422 = _1420 + _1408;
    float _1424 = float(_1209);
    float _1426 = float(_1259);
    int _1428 = _1422 * _1181;
    bool _1430 = uint(_1418) >= uint(_1209);
    float _1432 = -_1410;
    float _1434 = _1384 + _1432;
    bool _1436 = _1426 >= _1424;
    bool _1438 = isnan(_1426);
    bool _1440 = _1436 || _1438;
    bool _1442 = isnan(_1424);
    bool _1444 = _1440 || _1442;
    float _1446 = float(_1444);
    int _1448 = abs(_375);
    float _1450 = trunc(_1446);
    int _1452 = int(_1450);
    bool _1454 = !_1430;
    int _1456 = _1454 ? 0 : (-1);
    int _1458 = _1356 * _1187;
    int _1460 = _1458 + _1428;
    float _1462 = _1434 * _1424;
    int _1464 = ~_1412;
    int _1466 = _1464 + _1456;
    int _1468 = _1466 + 1;
    bool _1470 = !_1406;
    int _1472 = _1470 ? 0 : 1;
    int _1474 = _1392 * _1448;
    int _1476 = _1474 + _1460;
    int _1478 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1480 = _1478 != 0;
    int _1482 = _1209 * _1468;
    int _1484 = _1482 + _1259;
    int _1486 = abs(_1472);
    float _1488 = _1424 * _699;
    bool _1490 = !_1480;
    int _1492 = _1490 ? 0 : 1;
    float _1494 = trunc(_1462);
    int _1496 = int(_1494);
    int _1498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1500 = _1498 != 0;
    int _1502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1504 = _1502 != 0;
    int _1506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1508 = _1506 != 0;
    int _1510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1512 = _1510 != 0;
    int _1514 = _1338 * _1486;
    int _1516 = _1514 + _1476;
    int _1518 = ~_1452;
    int _1520 = _1518 + 1;
    int _1522 = _1520 + 1;
    bool _1524 = !_1253;
    int _1526 = _1524 ? _1484 : (-1);
    bool _1528 = !_1504;
    int _1530 = _1528 ? 0 : 1;
    float _1532 = trunc(_1488);
    int _1534 = int(_1532);
    int _1536 = abs(_1492);
    int _1538 = _1526 * _1522;
    int _1540 = _1209 + (-1);
    bool _1542 = !_1500;
    int _1544 = _1542 ? 0 : 1;
    int _1546 = abs(_1530);
    int _1548 = _1452 * _1540;
    int _1550 = _1548 + _1538;
    float _1552 = float(uint(_1516));
    int _1554 = abs(_1544);
    float _1556 = as_type<float>(_1247) * _1552;
    int _1558 = _1496 * _1536;
    int _1560 = _1558 + _1259;
    float _1562 = trunc(_1556);
    float _1564 = precise::max(_1562, 0.0);
    uint _1566 = uint(_1564);
    bool _1568 = !_1508;
    int _1570 = _1568 ? 0 : 1;
    int _1572 = _1550 * _1546;
    int _1574 = ~_1175;
    int _1576 = _1574 + 1;
    int _1578 = abs(_1570);
    int _1580 = _1534 * _1554;
    int _1582 = _1580 + _1572;
    bool _1584 = !_1512;
    int _1586 = _1584 ? 0 : 1;
    int _1588 = abs(_1586);
    float _1590 = float(uint(_1392));
    int _1592 = _1576 * int(_1566);
    int _1594 = _1592 + _1516;
    float _1596 = float(uint(_1560));
    int _1598 = _1560 * _1578;
    int _1600 = _1598 + _1582;
    int _1602 = ~_1209;
    int _1604 = _1602 + 1;
    float _1606 = as_type<float>(_1247) * _1590;
    float _1608 = float(uint(_1594));
    int _1610 = _1496 * _1588;
    int _1612 = _1610 + _1600;
    float _1614 = as_type<float>(_1276) * _1596;
    int _1616 = ~_1175;
    int _1618 = _1616 + 1;
    float _1620 = trunc(_1606);
    float _1622 = precise::max(_1620, 0.0);
    uint _1624 = uint(_1622);
    float _1626 = float(uint(_1612));
    float _1628 = as_type<float>(_1247) * _1608;
    float _1630 = as_type<float>(_1276) * _1626;
    float _1632 = trunc(_1614);
    float _1634 = precise::max(_1632, 0.0);
    uint _1636 = uint(_1634);
    float _1638 = trunc(_1628);
    float _1640 = precise::max(_1638, 0.0);
    uint _1642 = uint(_1640);
    int _1644 = _1618 * int(_1624);
    int _1646 = _1644 + _1392;
    float _1648 = float(uint(_1646));
    float _1650 = trunc(_1630);
    float _1652 = precise::max(_1650, 0.0);
    uint _1654 = uint(_1652);
    int _1656 = _1604 * int(_1636);
    int _1658 = _1656 + _1560;
    int _1660 = ~_1209;
    int _1662 = _1660 + 1;
    float _1664 = as_type<float>(_1247) * _1648;
    int _1666 = ~_1175;
    int _1668 = _1666 + 1;
    float _1670 = float(uint(_1658));
    int _1672 = int(_1566) + int(_1642);
    float _1674 = trunc(_1664);
    float _1676 = precise::max(_1674, 0.0);
    uint _1678 = uint(_1676);
    float _1680 = as_type<float>(_1276) * _1670;
    int _1682 = _1668 * _1672;
    int _1684 = _1682 + _1516;
    int _1686 = _1662 * int(_1654);
    int _1688 = _1686 + _1612;
    float _1690 = trunc(_1680);
    float _1692 = precise::max(_1690, 0.0);
    uint _1694 = uint(_1692);
    bool _1696 = uint(_1684) >= uint(_1175);
    float _1698 = float(uint(_1688));
    bool _1700 = !_1696;
    int _1702 = _1700 ? 0 : (-1);
    int _1704 = int(_1624) + int(_1678);
    float _1706 = as_type<float>(_1276) * _1698;
    int _1708 = ~_1672;
    int _1710 = _1708 + _1702;
    int _1712 = _1710 + 1;
    int _1714 = ~_1209;
    int _1716 = _1714 + 1;
    float _1718 = trunc(_1706);
    float _1720 = precise::max(_1718, 0.0);
    uint _1722 = uint(_1720);
    int _1724 = _1175 * _1712;
    int _1726 = _1724 + _1516;
    int _1728 = ~_1175;
    int _1730 = _1728 + 1;
    int _1732 = int(_1636) + int(_1694);
    bool _1734 = !_1225;
    int _1736 = _1734 ? _1726 : (-1);
    int _1738 = ~_1209;
    int _1740 = _1738 + 1;
    int _1742 = _1736 & 3;
    bool _1744 = _1742 != 0;
    int _1746 = _1744 ? 0 : 1;
    int _1748 = int(_1654) + int(_1722);
    int _1750 = _1730 * _1704;
    int _1752 = _1750 + _1392;
    int _1754 = _1736 & 3;
    bool _1756 = _1754 != 0;
    int _1758 = _1716 * _1748;
    int _1760 = _1758 + _1612;
    bool _1762 = uint(_1754) >= 2u;
    bool _1764 = uint(_1752) >= uint(_1175);
    int _1766 = _1762 ? 0 : 1;
    bool _1768 = uint(_1760) >= uint(_1209);
    bool _1770 = !_1764;
    int _1772 = _1770 ? 0 : (-1);
    bool _1774 = !_1768;
    int _1776 = _1774 ? 0 : (-1);
    bool _1778 = uint(_1754) > 1u;
    bool _1780 = _1754 != 3;
    int _1782 = ~_1748;
    int _1784 = _1782 + _1776;
    int _1786 = _1784 + 1;
    int _1788 = ~_1704;
    int _1790 = _1788 + _1772;
    int _1792 = _1790 + 1;
    int _1794 = _1740 * _1732;
    int _1796 = _1794 + _1560;
    bool _1798 = _231 > 0.5;
    int _1800 = _1209 * _1786;
    int _1802 = _1800 + _1612;
    int _1804 = ~_1746;
    int _1806 = _1804 + 1;
    int _1808 = _1806 + 1;
    int _1810 = _1175 * _1792;
    int _1812 = _1810 + _1392;
    float _1814 = -_193;
    int _1816 = _1798 ? as_type<int>(_1814) : as_type<int>(_193);
    int _1818 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1820 = _1818 != 0;
    int _1822 = ~_1766;
    int _1824 = _1822 + 1;
    int _1826 = _1824 + 1;
    bool _1828 = !_1253;
    int _1830 = _1828 ? _1802 : (-1);
    int _1832 = _1808;
    int _1834 = _1826;
    if (!_1778)
    {
        int _1836 = ~_1746;
        int _1838 = _1836 + 1;
        _1832 = _1838;
    }
    int _1840 = _1832;
    if (_1780)
    {
        int _1842 = ~_1766;
        int _1844 = _1842 + 1;
        _1834 = _1844;
    }
    int _1846 = _1834;
    bool _1848 = uint(_1796) >= uint(_1209);
    bool _1850 = !_1225;
    int _1852 = _1850 ? _1812 : (-1);
    int _1854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1856 = _1854 != 0;
    bool _1858 = !_1820;
    int _1860 = _1858 ? 0 : 1;
    int _1862 = _1736 >> 31;
    int _1864 = _1830 & 3;
    bool _1866 = _1864 != 0;
    int _1868 = _1830 >> 31;
    bool _1870 = !_1756;
    int _1872 = _1870 ? 0 : 1;
    bool _1874 = !_1848;
    int _1876 = _1874 ? 0 : (-1);
    int _1878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1880 = _1878 != 0;
    int _1882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1884 = _1882 != 0;
    bool _1886 = !_1856;
    int _1888 = _1886 ? 0 : 1;
    int _1890 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1892 = _1890 != 0;
    int _1894 = _1862 & 3;
    int _1896 = _1830 & 3;
    bool _1898 = _1896 != 0;
    bool _1900 = !_1866;
    int _1902 = _1900 ? 0 : 1;
    int _1904 = _1868 & 3;
    bool _1906 = uint(_1864) > 1u;
    int _1908 = _1736 + _1894;
    int _1910 = _1898 ? 0 : 1;
    int _1912 = _1830 + _1904;
    bool _1914 = _1754 != 3;
    int _1916 = _1908 >> 2;
    int _1918 = ~_1732;
    int _1920 = _1918 + _1876;
    int _1922 = _1920 + 1;
    int _1924 = _1912 >> 2;
    bool _1926 = !_1914;
    int _1928 = _1926 ? 0 : (-1);
    int _1930 = _1209 * _1922;
    int _1932 = _1930 + _1560;
    bool _1934 = uint(_1864) >= 2u;
    int _1936 = _1916 << 4;
    int _1938 = _1936 + 368;
    int _1940 = _1924 << 4;
    int _1942 = _1940 + 512;
    int _1944 = ~_1910;
    int _1946 = _1944 + 1;
    int _1948 = _1946 + 1;
    uint _1950 = uint(int(uint(_1938) >> uint(2)));
    uint _1952 = uint(int(uint(int(_1950)) >> uint(2)));
    int _1954 = int(_1950) & 3;
    float _1956 = (*spvDescriptorSet0.vp_c9)._m0[int(_1952)][_1954];
    int _1958 = int(_1950) + 1;
    uint _1960 = uint(int(uint(_1958) >> uint(2)));
    int _1962 = _1958 & 3;
    float _1964 = (*spvDescriptorSet0.vp_c9)._m0[int(_1960)][_1962];
    int _1966 = _1948;
    if (!_1906)
    {
        int _1968 = ~_1910;
        int _1970 = _1968 + 1;
        _1966 = _1970;
    }
    int _1972 = _1966;
    int _1974 = _1934 ? 0 : 1;
    bool _1976 = _1864 != 3;
    bool _1978 = _1864 != 3;
    int _1980 = _1942 + 8;
    uint _1982 = uint(int(uint(_1980) >> uint(2)));
    uint _1984 = uint(int(uint(int(_1982)) >> uint(2)));
    int _1986 = int(_1982) & 3;
    float _1988 = (*spvDescriptorSet0.vp_c9)._m0[int(_1984)][_1986];
    int _1990 = int(_1982) + 1;
    uint _1992 = uint(int(uint(_1990) >> uint(2)));
    int _1994 = _1990 & 3;
    float _1996 = (*spvDescriptorSet0.vp_c9)._m0[int(_1992)][_1994];
    int _1998 = ~_1974;
    int _2000 = _1998 + 1;
    int _2002 = _2000 + 1;
    bool _2004 = !_1253;
    int _2006 = _2004 ? _1932 : (-1);
    uint _2008 = uint(int(uint(_1942) >> uint(2)));
    uint _2010 = uint(int(uint(int(_2008)) >> uint(2)));
    int _2012 = int(_2008) & 3;
    float _2014 = (*spvDescriptorSet0.vp_c9)._m0[int(_2010)][_2012];
    int _2016 = int(_2008) + 1;
    uint _2018 = uint(int(uint(_2016) >> uint(2)));
    int _2020 = _2016 & 3;
    float _2022 = (*spvDescriptorSet0.vp_c9)._m0[int(_2018)][_2020];
    int _2024 = _2002;
    if (_1976)
    {
        int _2026 = ~_1974;
        int _2028 = _2026 + 1;
        _2024 = _2028;
    }
    int _2030 = _2024;
    float _2032 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2034 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2036 = _2034 != 0;
    float _2038 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2040 = _1938 + 8;
    uint _2042 = uint(int(uint(_2040) >> uint(2)));
    uint _2044 = uint(int(uint(int(_2042)) >> uint(2)));
    int _2046 = int(_2042) & 3;
    float _2048 = (*spvDescriptorSet0.vp_c9)._m0[int(_2044)][_2046];
    int _2050 = int(_2042) + 1;
    uint _2052 = uint(int(uint(_2050) >> uint(2)));
    int _2054 = _2050 & 3;
    float _2056 = (*spvDescriptorSet0.vp_c9)._m0[int(_2052)][_2054];
    float _2058 = _2032 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2060 = abs(_1972);
    float _2062 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2064 = abs(_1840);
    float _2066 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2068 = abs(_1872);
    float _2070 = _2062 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2072 = ~_2064;
    int _2074 = _2072 + 1;
    int _2076 = _2074 + 1;
    float _2078 = _2066 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2080 = !_1978;
    int _2082 = _2080 ? 0 : (-1);
    bool _2084 = _225 > 0.5;
    out.m_76.x = _2070;
    out.m_76.y = _2058;
    out.m_76.z = _2078;
    out.m_76.w = _2038;
    bool _2086 = _227 > 0.5;
    float _2088 = -_189;
    int _2090 = _2084 ? as_type<int>(_2088) : as_type<int>(_189);
    float _2092 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2094 = _2076 * as_type<int>(_1964);
    bool _2096 = _229 > 0.5;
    float _2098 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2100 = _1203 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2102 = _2092 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2104 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2106 = int(_2104);
    float _2108 = _2098 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2110 = abs(_1902);
    float _2112 = _987 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2114 = ~_2060;
    int _2116 = _2114 + 1;
    int _2118 = _2116 + 1;
    int _2120 = ~_2068;
    int _2122 = _2120 + 1;
    int _2124 = _2122 + 1;
    out.m_78.x = _2100;
    out.m_78.y = _2102;
    out.m_78.z = _2108;
    int _2126 = ~_2110;
    int _2128 = _2126 + 1;
    int _2130 = _2128 + 1;
    int _2132 = _2118 * as_type<int>(_2022);
    int _2134 = abs(_1846);
    int _2136 = _2124 * as_type<int>(_1956);
    int _2138 = _2136 + _2094;
    int _2140 = abs(_2082);
    int _2142 = _2130 * as_type<int>(_2014);
    int _2144 = _2142 + _2132;
    int _2146 = abs(_2030);
    float _2148 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2150 = int(_2148);
    float _2152 = _961 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2154 = abs(_1928);
    int _2156 = ~_2146;
    int _2158 = _2156 + 1;
    int _2160 = _2158 + 1;
    float _2162 = -_955;
    float _2164 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2152);
    float _2166 = float(uint(_2106));
    int _2168 = ~_2140;
    int _2170 = _2168 + 1;
    int _2172 = _2170 + 1;
    int _2174 = _2160 * as_type<int>(_1988);
    int _2176 = _2174 + _2144;
    int _2178 = ~_2134;
    int _2180 = _2178 + 1;
    int _2182 = _2180 + 1;
    float _2184 = 1.0 / _2166;
    int _2186 = _2172 * as_type<int>(_1996);
    int _2188 = _2186 + _2176;
    float _2190 = float(uint(_2150));
    int _2192 = _2182 * as_type<int>(_2048);
    int _2194 = _2192 + _2138;
    int _2196 = ~_2154;
    int _2198 = _2196 + 1;
    int _2200 = _2198 + 1;
    float _2202 = _961 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2204 = abs(_1860);
    float _2206 = _961 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2208 = 1.0 / _2190;
    int _2210 = abs(_1888);
    int _2212 = _2200 * as_type<int>(_2056);
    int _2214 = _2212 + _2194;
    int _2216 = ~_2204;
    int _2218 = _2216 + 1;
    int _2220 = _2218 + 1;
    float _2222 = -_955;
    float _2224 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2202);
    int _2226 = abs(_2106);
    float _2228 = -_955;
    float _2230 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2206);
    int _2232 = ~_2210;
    int _2234 = _2232 + 1;
    int _2236 = _2234 + 1;
    int _2238 = _2214 * _2220;
    int _2240 = abs(_2150);
    float _2242 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2164);
    int _2244 = _2188 * _2236;
    float _2246 = float(uint(_2240));
    int _2248 = _1852 * _2204;
    int _2250 = _2248 + _2238;
    float _2252 = float(uint(_2226));
    int _2254 = _2006 * _2210;
    int _2256 = _2254 + _2244;
    int _2258 = as_type<int>(_2184) + (-2);
    float _2260 = _973 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2262 = 1.0 / _2246;
    int _2264 = as_type<int>(_2208) + (-2);
    float _2266 = _973 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2268 = float(uint(_2250));
    float _2270 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2260);
    float _2272 = _973 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2274 = ~_2106;
    int _2276 = _2274 + 1;
    float _2278 = _987 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2280 = 1.0 / _2252;
    float _2282 = as_type<float>(_2258) * _2268;
    float _2284 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2266);
    int _2286 = abs(_2250);
    float _2288 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2272);
    float _2290 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2224);
    float _2292 = trunc(_2282);
    float _2294 = precise::max(_2292, 0.0);
    uint _2296 = uint(_2294);
    int _2298 = abs(_2256);
    float _2300 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2230);
    float _2302 = float(uint(_2256));
    float _2304 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2112);
    int _2306 = as_type<int>(_2262) + (-2);
    float _2308 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2284);
    float _2310 = as_type<float>(_2264) * _2302;
    int _2312 = as_type<int>(_2280) + (-2);
    float _2314 = float(uint(_2286));
    float _2316 = float(uint(_2298));
    float _2318 = trunc(_2310);
    float _2320 = precise::max(_2318, 0.0);
    uint _2322 = uint(_2320);
    int _2324 = ~_2240;
    int _2326 = _2324 + 1;
    float _2328 = as_type<float>(_2312) * _2314;
    float _2330 = _987 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2332 = as_type<float>(_2306) * _2316;
    float _2334 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2278);
    int _2336 = _2276 * int(_2296);
    int _2338 = _2336 + _2250;
    float _2340 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2330);
    float _2342 = trunc(_2328);
    float _2344 = precise::max(_2342, 0.0);
    uint _2346 = uint(_2344);
    float _2348 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2334);
    float _2350 = _2330;
    float _2352 = as_type<float>(_2326);
    if (_1061)
    {
        float _2354 = _1235 + (-1.0);
        _2350 = _2354;
    }
    float _2356 = _2350;
    float _2358 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2340);
    float _2360 = float(uint(_2338));
    float _2362 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2304);
    int _2364 = ~_2150;
    int _2366 = _2364 + 1;
    float _2368 = _2356;
    if (_1061)
    {
        float _2370 = _2356 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2368 = _2370;
    }
    float _2372 = _2368;
    float _2374 = trunc(_2332);
    float _2376 = precise::max(_2374, 0.0);
    uint _2378 = uint(_2376);
    int _2380 = ~_2226;
    int _2382 = _2380 + 1;
    float _2384 = as_type<float>(_2258) * _2360;
    if (_1061)
    {
        float _2386 = fma(_1123, _1235, _2372);
        _1127 = _2386;
    }
    float _2388 = _1127;
    float _2390 = -_189;
    int _2392 = _2096 ? as_type<int>(_2390) : as_type<int>(_189);
    int _2394 = _2366 * int(_2322);
    int _2396 = _2394 + _2256;
    float _2398 = trunc(_2384);
    float _2400 = precise::max(_2398, 0.0);
    uint _2402 = uint(_2400);
    bool _2404 = !_1880;
    float _2406 = _2404 ? _193 : as_type<float>(_1816);
    int _2408 = _2382 * int(_2346);
    int _2410 = _2408 + _2286;
    float _2412 = float(uint(_2396));
    float _2414 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2416 = !_2036;
    float _2418 = _2416 ? _189 : as_type<float>(_2090);
    int _2420 = _2326 * int(_2378);
    int _2422 = _2420 + _2298;
    float _2424 = float(uint(_2410));
    if (_1061)
    {
        float _2426 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2428 = _1153 + _2426;
        _2352 = _2428;
    }
    float _2430 = _2352;
    float _2432 = -_193;
    int _2434 = _2086 ? as_type<int>(_2432) : as_type<int>(_193);
    float _2436 = float(uint(_2422));
    float _2438 = as_type<float>(_2264) * _2412;
    float _2440 = as_type<float>(_2312) * _2424;
    bool _2442 = !_1884;
    float _2444 = _2442 ? _193 : as_type<float>(_2434);
    float _2446 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2448 = as_type<float>(_2306) * _2436;
    bool _2450 = !_1892;
    float _2452 = _2450 ? _189 : as_type<float>(_2392);
    float _2454 = trunc(_2438);
    float _2456 = precise::max(_2454, 0.0);
    uint _2458 = uint(_2456);
    float _2460 = _2414 * _2290;
    float _2462 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2270);
    float _2464 = _2460;
    if (_1061)
    {
        float _2466 = _2430 * _2430;
        _1075 = _2466;
    }
    float _2468 = _1075;
    float _2470 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2472 = _2388 + _2470;
    bool _2474 = _2150 == 0;
    float _2476 = fma(_2446, _2462, _2460);
    if (_1061)
    {
        float _2478 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2480 = _1157 + _2478;
        _2464 = _2480;
    }
    float _2482 = _2464;
    float _2484 = trunc(_2440);
    float _2486 = precise::max(_2484, 0.0);
    uint _2488 = uint(_2486);
    float _2490 = fma(_2472, _2472, _2468);
    float _2492 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2288);
    if (_1061)
    {
        float _2494 = _2482 * _2482;
        _1077 = _2494;
    }
    float _2496 = _1077;
    int _2498 = int(_2296) + int(_2402);
    float _2500 = _2414 * _2242;
    int _2502 = ~_2106;
    int _2504 = _2502 + 1;
    float _2506 = _2414 * _2300;
    float _2508 = trunc(_2448);
    float _2510 = precise::max(_2508, 0.0);
    uint _2512 = uint(_2510);
    int _2514 = int(_2322) + int(_2458);
    float _2516 = fma(_2446, _2308, _2500);
    int _2518 = ~_2150;
    int _2520 = _2518 + 1;
    int _2522 = _2504 * _2498;
    int _2524 = _2522 + _2250;
    int _2526 = ~_2226;
    int _2528 = _2526 + 1;
    float _2530 = fma(_2446, _2492, _2506);
    bool _2532 = _2150 == 0;
    int _2534 = _2520 * _2514;
    int _2536 = _2534 + _2256;
    int _2538 = int(_2346) + int(_2488);
    out.m_80.x = _2462;
    out.m_80.y = _2308;
    out.m_80.z = _2492;
    int _2540 = ~_2240;
    int _2542 = _2540 + 1;
    bool _2544 = uint(_2524) >= uint(_2106);
    bool _2546 = uint(_2536) >= uint(_2150);
    int _2548 = int(_2378) + int(_2512);
    int _2550 = _2528 * _2538;
    int _2552 = _2550 + _2286;
    float _2554 = _2490 + _2496;
    float _2556 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2558 = _2256 ^ _2150;
    int _2560 = _2542 * _2548;
    int _2562 = _2560 + _2298;
    bool _2564 = !_2544;
    int _2566 = _2564 ? 0 : (-1);
    bool _2568 = uint(_2552) >= uint(_2226);
    bool _2570 = !_2546;
    int _2572 = _2570 ? 0 : (-1);
    float _2574 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2576 = uint(_2562) >= uint(_2240);
    int _2578 = ~_2498;
    int _2580 = _2578 + _2566;
    int _2582 = _2580 + 1;
    int _2584 = _2250 ^ _2106;
    int _2586 = ~_2514;
    int _2588 = _2586 + _2572;
    int _2590 = _2588 + 1;
    int _2592 = _2106 * _2582;
    int _2594 = _2592 + _2250;
    bool _2596 = !_2568;
    int _2598 = _2596 ? 0 : (-1);
    float _2600 = _2556 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    uint _2602 = uint(int(uint(_2584) >> uint(31)));
    int _2604 = _2150 * _2590;
    int _2606 = _2604 + _2256;
    bool _2608 = _2106 == 0;
    float _2610 = sqrt(_2554);
    bool _2612 = _2106 == 0;
    float _2614 = _2574 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2616 = ~_2598;
    int _2618 = _2538 + _2616;
    int _2620 = _2618 + 1;
    int _2622 = ~int(_2602);
    int _2624 = _2622 + 1;
    bool _2626 = !_2576;
    int _2628 = _2626 ? 0 : (-1);
    float _2630 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _2632 = uint(int(uint(_2558) >> uint(31)));
    int _2634 = _2620 ^ _2624;
    bool _2636 = !_2608;
    int _2638 = _2636 ? _2594 : (-1);
    int _2640 = ~_2628;
    int _2642 = _2548 + _2640;
    int _2644 = _2642 + 1;
    float _2646 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2648 = ~int(_2632);
    int _2650 = _2648 + 1;
    int _2652 = ~_2624;
    int _2654 = _2652 + _2634;
    int _2656 = _2654 + 1;
    float _2658 = fma(_2414, _2414, 1.0);
    bool _2660 = !_2474;
    int _2662 = _2660 ? _2606 : (-1);
    float _2664 = float(_2638);
    float _2666 = _2630 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2668 = _2644 ^ _2650;
    float _2670 = rsqrt(_2658);
    float _2672 = float(_2662);
    float _2674 = fma(_2600, _2664, _739);
    int _2676 = ~_2650;
    int _2678 = _2676 + _2668;
    int _2680 = _2678 + 1;
    float _2682 = _2418 + 0.5;
    bool _2684 = !_2612;
    int _2686 = _2684 ? _2656 : (-1);
    float _2688 = fma(_2666, _2672, _777);
    bool _2690 = !_2532;
    int _2692 = _2690 ? _2680 : (-1);
    float _2694 = _2646 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2696 = float(_2686);
    float _2698 = fma(_2600, _2682, _2674);
    float _2700 = float(_2692);
    out.m_82.x = _1167;
    out.m_82.y = _1169;
    out.m_82.z = _1171;
    bool _2702 = _2610 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2704 = isnan(_2610);
    bool _2706 = _2702 || _2704;
    bool _2708 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2710 = _2706 || _2708;
    float _2712 = -_335;
    float _2714 = fma(_2614, _2696, _2712);
    float _2716 = _2452 + 0.5;
    float _2718 = -_803;
    float _2720 = fma(_2694, _2700, _2718);
    float _2722 = _2406 + (-0.5);
    float _2724 = _2444 + (-0.5);
    float _2726 = fma(_2666, _2716, _2688);
    float _2728 = _2414 * _2670;
    float _2730 = -_2694;
    float _2732 = fma(_2730, _2722, _2720);
    float _2734 = -_2614;
    float _2736 = fma(_2734, _2724, _2714);
    float _2738 = -_797;
    float _2740 = _2738 + 1.0;
    float _2742 = -_2348;
    float _2744 = _2728 * _2742;
    float _2746 = -_2358;
    float _2748 = _2728 * _2746;
    float _2750 = -_765;
    float _2752 = _2750 + 1.0;
    float _2754 = -_2362;
    float _2756 = _2728 * _2754;
    float _2758 = fma(_2444, _1185, _2736);
    float _2760 = fma(_2670, _2290, _2744);
    float _2762 = fma(_2670, _2242, _2748);
    float _2764 = fma(_2406, _2752, _2732);
    float _2766 = fma(_2670, _2300, _2756);
    float _2768 = _2348 + _2476;
    float _2770 = -_1197;
    float _2772 = fma(_2418, _2770, _2698);
    float _2774 = -_2740;
    float _2776 = fma(_2452, _2774, _2726);
    float _2778 = _2358 + _2516;
    float _2780 = _2362 + _2530;
    out.m_84.x = _2760;
    out.m_84.y = _2762;
    out.m_84.z = _2766;
    float _2782 = _2698;
    if (!_2710)
    {
        _2782 = 1.0;
    }
    float _2784 = _2782;
    out.m_86.x = _2772;
    out.m_86.y = _2758;
    out.m_86.z = _2776;
    out.m_86.w = _2764;
    out.m_88.x = _2768;
    out.m_88.y = _2778;
    out.m_88.z = _2780;
    bool _2786 = !_2710;
    float _2788 = _2784;
    if (!_2786)
    {
        bool _2790 = _2610 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2792 = isnan(_2610);
        bool _2794 = _2790 || _2792;
        bool _2796 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2798 = _2794 || _2796;
        if (!_2798)
        {
            float _2800 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2802 = _2610 + _2800;
            float _2804 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2806 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2804;
            float _2808 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2810 = _2808 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2812 = 1.0 / _2806;
            float _2814 = _2802 * _2812;
            float _2816 = fma(_2814, _2810, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2788 = _2816;
            _2818 = true;
        }
        else
        {
            bool _2820 = _2610 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2822 = isnan(_2610);
            bool _2824 = _2820 || _2822;
            bool _2826 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2828 = _2824 || _2826;
            if (!_2828)
            {
                float _2830 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2832 = _2610 + _2830;
                float _2834 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2836 = _2834 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2838 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2840 = _2838 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2842 = 1.0 / _2836;
                float _2844 = _2832 * _2842;
                float _2846 = fma(_2844, _2840, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2788 = _2846;
                _2818 = true;
            }
            else
            {
                _2788 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2818 = false;
    float _2848 = _2788;
    float _2850 = fma(_1027, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2852 = fma(_1029, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2854 = floor(_2850);
    float _2856 = floor(_2852);
    float _2858 = -_2854;
    float _2860 = _2850 + _2858;
    float _2862 = -_2856;
    float _2864 = _2852 + _2862;
    float2 _8419 = float2(_2860, _2864);
    float _2866 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8419, float2(0.0), isnan(_8419)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8419, float2(0.0), isnan(_8419)), level(0.0)).x;
    float _2868 = _1119 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2870 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2872 = _2388 + _2870;
    float _2874 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2868);
    float _2876 = _1119 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2878 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2880 = _1157 + _2878;
    float _2882 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2874);
    float _2884 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2886 = fma(_2872, _2848, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2888 = _2882 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2890 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2876);
    float _2892 = _1119 + _2884;
    float _2894 = 1.0 / _2888;
    float _2896 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2890);
    float _2898 = _2896 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2900 = _2898 + _2888;
    float _2902 = _2900 * _2894;
    float _2904 = _2902 * 0.5;
    float _2906 = _2892 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2908 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2910 = fma(_2904, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2908);
    float _2912 = fma(_1027, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2906);
    float _2914 = _2892 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2916 = fma(_1029, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2912);
    float _2918 = 1.0 / _2910;
    float _2920 = _2916 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2922 = trunc(_2920);
    int _2924 = int(_2922);
    float _2926 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2928 = _2918 * _2926;
    bool _2930 = _2928 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _2932 = _2928 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _2934 = !_2930;
    int _2936 = _2934 ? 0 : 1;
    int _2938 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2940 = _2924 + _2938;
    int _2942 = _2940 + 1;
    int _2944 = 2;
    float _2946 = _2916;
    if (!_2930)
    {
        _2944 = 1;
    }
    int _2948 = _2944;
    int _2950 = _2948;
    if (!_2932)
    {
        _2950 = _2936;
    }
    int _2952 = _2950;
    float _2954 = fma(_1027, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2914);
    int _2956 = _2952 << 6;
    float _2958 = fma(_1029, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2954);
    bool _2960 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2962 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2964 = _2960 || _2962;
    bool _2966 = isnan(0.5);
    bool _2968 = _2964 || _2966;
    float _2970 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2972 = _1153 + _2970;
    int _2974 = _2956 + 48;
    uint _2976 = uint(int(uint(_2974) >> uint(2)));
    uint _2978 = uint(int(uint(int(_2976)) >> uint(2)));
    int _2980 = int(_2976) & 3;
    float _2982 = (*spvDescriptorSet0.vp_c15)._m0[int(_2978)][_2980];
    int _2984 = int(_2976) + 1;
    uint _2986 = uint(int(uint(_2984) >> uint(2)));
    int _2988 = _2984 & 3;
    float _2990 = (*spvDescriptorSet0.vp_c15)._m0[int(_2986)][_2988];
    float _2992 = _2958 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _2994 = _2942 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2996 = fma(_2972, _2848, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2998 = fma(_2880, _2848, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3000 = trunc(_2992);
    int _3002 = int(_3000);
    int _3004 = _2956 + 56;
    uint _3006 = uint(int(uint(_3004) >> uint(2)));
    uint _3008 = uint(int(uint(int(_3006)) >> uint(2)));
    int _3010 = int(_3006) & 3;
    float _3012 = (*spvDescriptorSet0.vp_c15)._m0[int(_3008)][_3010];
    int _3014 = int(_3006) + 1;
    uint _3016 = uint(int(uint(_3014) >> uint(2)));
    int _3018 = _3014 & 3;
    float _3020 = (*spvDescriptorSet0.vp_c15)._m0[int(_3016)][_3018];
    float _3022 = _2972;
    int _3024 = as_type<int>(_2998);
    if (_2968)
    {
        _3022 = _2886;
    }
    float _3026 = _3022;
    float _3028 = _3026;
    if (_2968)
    {
        _2946 = _2998;
    }
    float _3030 = _2946;
    int _3032 = _2956 + 64;
    uint _3034 = uint(int(uint(_3032) >> uint(2)));
    uint _3036 = uint(int(uint(int(_3034)) >> uint(2)));
    int _3038 = int(_3034) & 3;
    float _3040 = (*spvDescriptorSet0.vp_c15)._m0[int(_3036)][_3038];
    int _3042 = int(_3034) + 1;
    uint _3044 = uint(int(uint(_3042) >> uint(2)));
    int _3046 = _3042 & 3;
    float _3048 = (*spvDescriptorSet0.vp_c15)._m0[int(_3044)][_3046];
    int _3050 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3052 = _3002 + _3050;
    int _3054 = _3052 + 1;
    int _3056 = _2956 + 72;
    uint _3058 = uint(int(uint(_3056) >> uint(2)));
    uint _3060 = uint(int(uint(int(_3058)) >> uint(2)));
    int _3062 = int(_3058) & 3;
    float _3064 = (*spvDescriptorSet0.vp_c15)._m0[int(_3060)][_3062];
    int _3066 = int(_3058) + 1;
    uint _3068 = uint(int(uint(_3066) >> uint(2)));
    int _3070 = _3066 & 3;
    float _3072 = (*spvDescriptorSet0.vp_c15)._m0[int(_3068)][_3070];
    int _3074 = _2942 | _3054;
    bool _3076 = _3074 < 0;
    bool _3078 = _3076 || _2994;
    float _3080 = as_type<float>(_3074);
    float _3082 = _3030;
    if (_2968)
    {
        _3080 = _2996;
    }
    float _3084 = _3080;
    int _3086 = _2956 + 96;
    uint _3088 = uint(int(uint(_3086) >> uint(2)));
    uint _3090 = uint(int(uint(int(_3088)) >> uint(2)));
    int _3092 = int(_3088) & 3;
    float _3094 = (*spvDescriptorSet0.vp_c15)._m0[int(_3090)][_3092];
    int _3096 = int(_3088) + 1;
    uint _3098 = uint(int(uint(_3096) >> uint(2)));
    int _3100 = _3096 & 3;
    float _3102 = (*spvDescriptorSet0.vp_c15)._m0[int(_3098)][_3100];
    bool _3104 = _3054 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3106 = _3104 || _3078;
    int _3108 = _2956 + 104;
    uint _3110 = uint(int(uint(_3108) >> uint(2)));
    uint _3112 = uint(int(uint(int(_3110)) >> uint(2)));
    int _3114 = int(_3110) & 3;
    float _3116 = (*spvDescriptorSet0.vp_c15)._m0[int(_3112)][_3114];
    int _3118 = int(_3110) + 1;
    uint _3120 = uint(int(uint(_3118) >> uint(2)));
    int _3122 = _3118 & 3;
    float _3124 = (*spvDescriptorSet0.vp_c15)._m0[int(_3120)][_3122];
    float _3126 = _3084;
    if (!_2968)
    {
        float _3128 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3130 = _1119 + _3128;
        float _3132 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3134 = _1027 + _3132;
        float _3136 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3138 = _3130 * _3130;
        float _3140 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3142 = _1029 + _3140;
        float _3144 = fma(_3134, _3134, _3138);
        float _3146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3148 = fma(_3142, _3142, _3144);
        float _3150 = sqrt(_3148);
        float _3152 = _3136 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3154 = precise::min(_3150, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3156 = _3154 * _3146;
        float _3158 = -_1119;
        float _3160 = _3158 + _2886;
        float _3162 = -_1027;
        float _3164 = _3162 + _2996;
        float _3166 = _3152 * _3156;
        float _3168 = -_1029;
        float _3170 = _3168 + _2998;
        float _3172 = fma(_3160, _3166, _1119);
        float _3174 = fma(_3164, _3166, _1027);
        float _3176 = fma(_3170, _3166, _1029);
        _3028 = _3172;
        _3126 = _3174;
        _3082 = _3176;
    }
    float _3178 = _3028;
    float _3180 = _3126;
    float _3182 = _3082;
    float _3184 = _2892 * _3102;
    float _3186 = _3178 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _3188 = as_type<int>(_3184);
    if (!_3106)
    {
        int _3190 = _3054 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3192 = _3190 + _2942;
        _1129 = _3192;
    }
    int _3194 = _1129;
    float _3196 = _2892 * _2990;
    float _3198 = fma(_1027, _3094, _3184);
    float _3200 = fma(_3180, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3186);
    float _3202 = _2892 * _3048;
    float _3204 = fma(_1027, _2982, _3196);
    float _3206 = fma(_1029, _3116, _3198);
    float _3208 = fma(_3182, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3200);
    if (!_3106)
    {
        int _3210 = _3194 << 2;
        _3024 = _3210;
    }
    int _3212 = _3024;
    float _3214 = fma(_1027, _3040, _3202);
    float _3216 = _3206 + _3124;
    float _3218 = _3208 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _3220 = _3212;
    if (!_3106)
    {
        uint _3222 = uint(int(uint(_3194) >> uint(2)));
        _3188 = int(_3222);
    }
    int _3224 = _3188;
    int _3226 = _2956 + 80;
    uint _3228 = uint(int(uint(_3226) >> uint(2)));
    uint _3230 = uint(int(uint(int(_3228)) >> uint(2)));
    int _3232 = int(_3228) & 3;
    float _3234 = (*spvDescriptorSet0.vp_c15)._m0[int(_3230)][_3232];
    int _3236 = int(_3228) + 1;
    uint _3238 = uint(int(uint(_3236) >> uint(2)));
    int _3240 = _3236 & 3;
    float _3242 = (*spvDescriptorSet0.vp_c15)._m0[int(_3238)][_3240];
    if (!_3106)
    {
        int _3244 = 12 & _3212;
        _3220 = _3244;
    }
    int _3246 = _3220;
    float _3248 = fma(_1029, _3012, _3204);
    float _3250 = 1.0 / _3216;
    float _3252 = fma(_1029, _3064, _3214);
    float _3254 = as_type<float>(_3246);
    if (!_3106)
    {
        int _3256 = _3224 << 4;
        int _3258 = _3256 + _3246;
        _3254 = as_type<float>(_3258);
    }
    float _3260 = _3254;
    float _3262 = _3178 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3264 = _3248 + _3020;
    int _3266 = _2956 + 88;
    uint _3268 = uint(int(uint(_3266) >> uint(2)));
    uint _3270 = uint(int(uint(int(_3268)) >> uint(2)));
    int _3272 = int(_3268) & 3;
    float _3274 = (*spvDescriptorSet0.vp_c15)._m0[int(_3270)][_3272];
    int _3276 = int(_3268) + 1;
    uint _3278 = uint(int(uint(_3276) >> uint(2)));
    int _3280 = _3276 & 3;
    float _3282 = (*spvDescriptorSet0.vp_c15)._m0[int(_3278)][_3280];
    float _3284 = _3252 + _3072;
    float _3286 = fma(_3180, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3262);
    float _3288 = _3178 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3290 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3292 = _3218 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3294 = fma(_3182, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3286);
    float _3296 = fma(_3180, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3288);
    float _3298 = _3260;
    if (!_3106)
    {
        int _3300 = as_type<int>(_3260) + 400;
        uint _3302 = uint(int(uint(_3300) >> uint(2)));
        uint _3304 = uint(int(uint(int(_3302)) >> uint(2)));
        int _3306 = int(_3302) & 3;
        float _3308 = (*spvDescriptorSet0.vp_c15)._m0[int(_3304)][_3306];
        _3298 = _3308;
    }
    float _3310 = _3298;
    float _3312 = -_3292;
    float _3314 = fma(_3312, _3290, 1.0);
    float _3316 = _3178 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3318 = _3264 * _3250;
    float _3320 = _3284 * _3250;
    float _3322 = fma(_3182, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3296);
    float _3324 = _3294 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3326 = fma(_3180, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3316);
    bool _3328 = _3318 >= 0.0;
    float _3330 = _3322 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3332 = _3324 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3334 = fma(_3182, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3326);
    bool _3336 = _3318 <= 1.0;
    bool _3338 = _3336 && _3328;
    float _3340 = as_type<float>(_2942);
    if (!_3106)
    {
        float _3342 = floor(_2992);
        _3340 = _3342;
    }
    float _3344 = _3340;
    float _3346 = fma(_3330, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3332);
    float _3348 = _3334 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _3350 = _3320 >= 0.0;
    bool _3352 = _3350 && _3338;
    float _3354 = _3324 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3356 = fma(_3218, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3346);
    float _3358 = _3324 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    bool _3360 = _3320 <= 1.0;
    bool _3362 = _3360 && _3352;
    float _3364 = log2(_3314);
    float _3366 = fma(_3348, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3356);
    float _3368 = fma(_3330, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3358);
    float _3370 = fma(_3330, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3354);
    float _3372 = 1.0 / _3366;
    float _3374 = _3344;
    float _3376 = _3356;
    if (!_3106)
    {
        float _3378 = -_3344;
        float _3380 = _2992 + _3378;
        _3374 = _3380;
    }
    float _3382 = _3374;
    float _3384 = _2892 * _3242;
    if (_3362)
    {
        float _3386 = float(_2952);
        _3376 = _3386;
    }
    float _3388 = _3376;
    float _3390 = fma(_3218, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3370);
    float _3392 = fma(_1027, _3234, _3384);
    float _3394 = _2886;
    float _3396 = _3390;
    if (!_3106)
    {
        float _3398 = floor(_2920);
        _3394 = _3398;
    }
    float _3400 = _3394;
    float _3402 = fma(_3218, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3368);
    float _3404 = fma(_3348, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3390);
    float _3406 = fma(_1029, _3274, _3392);
    float _3408 = _3364 * 0.693147182464599609375;
    float _3410 = fma(_3348, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3402);
    float _3412 = _3406 + _3282;
    float _3414 = _3388;
    float _3416 = _3408;
    if (_3362)
    {
        float _3418 = rint(_3388);
        float _3420 = precise::max(_3418, 0.0);
        uint _3422 = uint(_3420);
        uint _3424 = clamp(_3422, 0u, 65535u);
        _3414 = as_type<float>(_3424);
    }
    float _3426 = _3414;
    float _3428 = _3410 * _3372;
    float _3430 = _3404 * _3372;
    float _3432 = _3412 * _3250;
    float _3434 = _3408 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3436 = fma(_3428, 0.5, 0.5);
    float _3438 = fma(_3430, -0.5, 0.5);
    float _3440 = _3392;
    float _3442 = _3434;
    float _3444 = _3436;
    if (!_3106)
    {
        float _3446 = rint(_3310);
        float _3448 = precise::max(_3446, 0.0);
        uint _3450 = uint(_3448);
        uint _3452 = clamp(_3450, 0u, 65535u);
        _3440 = as_type<float>(_3452);
    }
    float _3454 = _3440;
    if (!_3106)
    {
        float _3456 = -_3400;
        float _3458 = _2920 + _3456;
        _3416 = _3458;
    }
    float _3460 = _3416;
    float _3462 = _3426;
    if (_3362)
    {
        float3 _9441 = float3(_3318, _3320, float(as_type<int>(_3426)));
        float3 _9445 = select(_9441, float3(0.0), isnan(_9441));
        float _3464 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9445.xy, uint(rint(_9445.z)), _3432, level(0.0));
        _3462 = _3464;
    }
    float _3466 = _3462;
    float3 _9455 = float3(_3436, _3438, _3434);
    float _3468 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9455, float3(0.0), isnan(_9455)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9455, float3(0.0), isnan(_9455)), level(0.0)).x;
    float3 _9464 = float3(_3436, _3438, _3434);
    float4 _3471 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9464, float3(0.0), isnan(_9464)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9464, float3(0.0), isnan(_9464)), level(0.0)).xyzw;
    float _3473 = _3471.x;
    float _3475 = _3471.y;
    float _3477 = _3471.z;
    float _3479 = _3471.w;
    float _3481 = _3382;
    if (!_3106)
    {
        float3 _9487 = float3(_3460, _3382, float(as_type<int>(_3454)));
        float3 _9489 = select(_9487, float3(0.0), isnan(_9487));
        float _3483 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9489.xy, uint(rint(_9489.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9489.xy, uint(rint(_9489.z)), level(0.0)).x;
        _3481 = _3483;
    }
    float _3485 = _3481;
    if (_3106)
    {
        _3396 = 1.0;
    }
    float _3487 = _3396;
    float _3489 = _3487;
    if (!_3106)
    {
        int _3491 = _3194 << 4;
        int _3493 = _3491 + 2048;
        uint _3495 = uint(int(uint(_3493) >> uint(2)));
        uint _3497 = uint(int(uint(int(_3495)) >> uint(2)));
        int _3499 = int(_3495) & 3;
        float _3501 = (*spvDescriptorSet0.vp_c15)._m0[int(_3497)][_3499];
        int _3503 = int(_3495) + 1;
        uint _3505 = uint(int(uint(_3503) >> uint(2)));
        int _3507 = _3503 & 3;
        float _3509 = (*spvDescriptorSet0.vp_c15)._m0[int(_3505)][_3507];
        int _3511 = _3493 + 8;
        uint _3513 = uint(int(uint(_3511) >> uint(2)));
        uint _3515 = uint(int(uint(int(_3513)) >> uint(2)));
        int _3517 = int(_3513) & 3;
        float _3519 = (*spvDescriptorSet0.vp_c15)._m0[int(_3515)][_3517];
        int _3521 = int(_3513) + 1;
        uint _3523 = uint(int(uint(_3521) >> uint(2)));
        int _3525 = _3521 & 3;
        float _3527 = (*spvDescriptorSet0.vp_c15)._m0[int(_3523)][_3525];
        float _3529 = _2892 * _3509;
        float _3531 = fma(_1027, _3501, _3529);
        float _3533 = fma(_1029, _3519, _3531);
        float _3535 = _3533 + _3527;
        float _3537 = precise::clamp(_3535, 0.0, 1.0);
        float _3539 = -_3537;
        float _3541 = _3539 + _3485;
        float _3543 = fma(_3541, 500.0, 1.5);
        float _3545 = exp2(_3543);
        float _3547 = 0.0 + _3545;
        float _3549 = precise::clamp(_3547, 0.0, 1.0);
        _3442 = _3509;
        _3489 = _3549;
    }
    float _3551 = _3442;
    float _3553 = _3489;
    float _3555 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3557 = _3178 + _3555;
    float _3559 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3561 = _3180 + _3559;
    float _3563 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3565 = _3182 + _3563;
    float _3567 = _3557 * _3557;
    float _3569 = fma(_3561, _3561, _3567);
    float _3571 = fma(_3565, _3565, _3569);
    float _3573 = rsqrt(_3571);
    float _3575 = _3573 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3577 = _3561 * _3575;
    float _3579 = _3565 * _3575;
    float _3581 = _3577 * _3577;
    float _3583 = _3579 * _3579;
    float _3585 = _3581 + _3583;
    float _3587 = sqrt(_3585);
    bool _3589 = _3587 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3591 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3593 = _3587 + _3591;
    float _3595 = _3569;
    float _3597 = _3593;
    float _3599 = _3551;
    float _3601 = _3557;
    float _3603 = _3581;
    if (_3589)
    {
        float _3605 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3595 = _3605;
    }
    float _3607 = _3595;
    float _3609 = _3607;
    if (_3589)
    {
        float _3611 = _3593 * _3607;
        _3597 = _3611;
    }
    float _3613 = _3597;
    if (_3589)
    {
        float _3615 = rsqrt(_3585);
        _3609 = _3615;
    }
    float _3617 = _3609;
    float _3619 = _3617;
    if (_3589)
    {
        float _3621 = _3613 * 0.15915493667125701904296875;
        _3599 = _3621;
    }
    float _3623 = _3599;
    float _3625 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3627 = _3573;
    if (_3589)
    {
        float _3629 = _3623 * 6.283185482025146484375;
        float _3631 = sin(_3629);
        _3627 = _3631;
    }
    float _3633 = _3627;
    float _3635 = precise::max(0.0, _3625);
    float _3637 = _3565;
    float _3639 = _3635;
    if (_3589)
    {
        float _3641 = _3623 * 6.283185482025146484375;
        float _3643 = cos(_3641);
        _3637 = _3643;
    }
    float _3645 = _3637;
    float _3647 = -_3575;
    float _3649 = -_3635;
    float _3651 = fma(_3557, _3647, _3649);
    if (_3589)
    {
        float _3653 = _3651 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3601 = _3653;
    }
    float _3655 = _3601;
    float _3657 = _3633;
    float _3659 = _3655;
    if (_3589)
    {
        float _3661 = fma(_3633, _3655, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3657 = _3661;
    }
    float _3663 = _3657;
    float _3665 = _3663;
    if (!_3589)
    {
        _3659 = _3651;
    }
    float _3667 = _3659;
    float _3669 = _3667;
    if (_3589)
    {
        float _3671 = _3617 * _3663;
        _3444 = _3671;
    }
    float _3673 = _3444;
    if (!_3589)
    {
        _3665 = _3577;
    }
    float _3675 = _3665;
    float _3677 = _3675;
    if (_3589)
    {
        float _3679 = _3645 + (-1.0);
        _3639 = _3679;
    }
    float _3681 = _3639;
    float _3683 = _3681;
    if (_3589)
    {
        float _3685 = _3577 * _3673;
        _3677 = _3685;
    }
    float _3687 = _3677;
    if (_3589)
    {
        float _3689 = _3681 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3619 = _3689;
    }
    float _3691 = _3619;
    float _3693 = _3691;
    if (!_3589)
    {
        _3683 = _3579;
    }
    float _3695 = _3683;
    float _3697 = _3695;
    if (_3589)
    {
        float _3699 = _3579 * _3673;
        _3697 = _3699;
    }
    float _3701 = _3697;
    if (_3589)
    {
        float _3703 = _3687 * _3687;
        _3603 = _3703;
    }
    float _3705 = _3603;
    if (_3589)
    {
        float _3707 = fma(_3651, _3645, _3691);
        _3669 = _3707;
    }
    float _3709 = _3669;
    if (!_3589)
    {
        _3693 = _3583;
    }
    float _3711 = _3693;
    float _3713 = _3711;
    if (_3589)
    {
        float _3715 = _3701 * _3701;
        _3713 = _3715;
    }
    float _3717 = _3713;
    float _3719 = sqrt(_3571);
    float _3721 = fma(_3709, _3709, _3705);
    float _3723 = _3721 + _3717;
    float _3725 = rsqrt(_3723);
    float _3727 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3729 = fma(_3719, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3727);
    float _3731 = precise::clamp(_3729, 0.0, 1.0);
    float _3733 = -_3731;
    float _3735 = _3733 + 1.0;
    float _3737 = _3725 * _3687;
    float _3739 = _3725 * _3709;
    float _3741 = _3725 * _3701;
    float _3743 = _3737 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3745 = _3739 + 1.0;
    float _3747 = abs(_3735);
    float _3749 = log2(_3747);
    float _3751 = -_3743;
    float _3753 = fma(_3739, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3751);
    float _3755 = -_3741;
    float _3757 = fma(_3755, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3753);
    float _3759 = fma(_3757, -0.5, 0.5);
    float _3761 = fma(_3757, 0.5, 0.5);
    float _3763 = fma(_3761, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3765 = _3749 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3767 = sqrt(_3759);
    float _3769 = fma(_3761, _3763, -0.212114393711090087890625);
    float _3771 = fma(_3761, _3769, 1.570728778839111328125);
    float _3773 = exp2(_3765);
    float _3775 = _3767 * 0.636619746685028076171875;
    float _3777 = -_3771;
    float _3779 = fma(_3775, _3777, 1.0);
    float _3781 = -_3739;
    float _3783 = fma(_3773, _3745, _3781);
    float _3785 = fma(_3783, 0.5, 0.5);
    float2 _9955 = float2(_3779, _3785);
    float3 _3787 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9955, float2(0.0), isnan(_9955)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9955, float2(0.0), isnan(_9955)), level(0.0)).xyz;
    float _3789 = _3787.x;
    float _3791 = _3787.y;
    float _3793 = _3787.z;
    float _3795 = abs(_2928);
    float _3797 = log2(_3795);
    float _3799 = -_2866;
    float _3801 = _3799 + 1.0;
    out.m_90.x = _3180;
    out.m_90.y = _3178;
    out.m_90.z = _3182;
    bool _3803 = _2928 <= 8000.0;
    bool _3805 = isnan(_2928);
    bool _3807 = _3803 || _3805;
    bool _3809 = isnan(8000.0);
    bool _3811 = _3807 || _3809;
    float _3813 = float(_3811);
    float _3815 = _3797 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3817 = _3324 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3819 = fma(_3330, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3817);
    float _3821 = exp2(_3815);
    float _3823 = fma(_3218, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3819);
    float _3825 = fma(_3348, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3823);
    float _3827 = fma(_3821, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3829 = precise::clamp(_3827, 0.0, 1.0);
    float _3831 = fma(_3829, -2.0, 3.0);
    float _3833 = _3829 * _3829;
    float _3835 = _3833 * _3831;
    float _3837 = _3749 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3839 = _3825 + _3366;
    float _3841 = -_3835;
    float _3843 = _3841 + 1.0;
    float _3845 = _3839 * 0.5;
    float _3847 = exp2(_3837);
    float _3849 = fma(_3843, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3835);
    out.m_92.z = _3845;
    out.m_92.w = _3366;
    float _3851 = _3813 * _3849;
    float _3853 = _3813;
    float _3855 = _3825;
    float _3857 = _3410;
    float _3859 = _3801;
    if (!_3362)
    {
        _3853 = 1.0;
    }
    float _3861 = _3853;
    float _3863 = _3861;
    if (_3362)
    {
        bool _3865 = _3466 >= _3432;
        bool _3867 = isnan(_3466);
        bool _3869 = _3865 || _3867;
        bool _3871 = isnan(_3432);
        bool _3873 = _3869 || _3871;
        float _3875 = float(_3873);
        _3863 = _3875;
    }
    float _3877 = _3863;
    float _3879 = _3851 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _3410;
    out.gl_Position.y = _3404;
    out.gl_Position.z = _3825;
    out.gl_Position.w = _3366;
    bool _3881 = _3719 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3883 = isnan(_3719);
    bool _3885 = _3881 || _3883;
    bool _3887 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3889 = _3885 || _3887;
    float _3891 = _3801 * _3879;
    float _3893 = precise::clamp(_3891, 0.0, 1.0);
    float _3895 = _3877 * _3553;
    float _3897 = -_3847;
    float _3899 = _3897 + 1.0;
    float _3901 = -_3893;
    float _3903 = fma(_3901, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3905 = _3899 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3907 = -_3895;
    float _3909 = fma(_3907, _3903, 1.0);
    float _3911 = precise::clamp(_3909, 0.0, 1.0);
    float _3913 = _3905 * _3468;
    float _3915 = -_3905;
    float _3917 = _3915 + 1.0;
    float _3919 = _3911 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3921 = _3911;
    if (!_3889)
    {
        _3855 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3923 = _3855;
    float _3925 = _3479 * _3913;
    float _3927 = _3479 * _3917;
    float _3929 = _3923;
    float _3931 = _3923;
    if (!_3889)
    {
        _3857 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3933 = _3857;
    out.m_94.x = _3919;
    float _3935 = _3933;
    float _3937 = _3933;
    if (!_3889)
    {
        _3921 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3939 = _3921;
    float _3941 = _3939;
    float _3943 = _3939;
    if (!_3889)
    {
        _3859 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3945 = _3859;
    float _3947 = _3793 * _3913;
    float _3949 = fma(_3789, _3925, _3473);
    float _3951 = fma(_3791, _3925, _3475);
    float _3953 = _3791;
    float _3955 = _3789;
    float _3957 = _3945;
    float _3959 = _3945;
    if (!_3889)
    {
        _3953 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3961 = _3953;
    float _3963 = fma(_3479, _3947, _3477);
    float _3965 = _3961;
    float _3967 = _3961;
    if (!_3889)
    {
        _3955 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3969 = _3955;
    out.m_96.x = _3949;
    out.m_96.y = _3951;
    out.m_96.z = _3963;
    out.m_96.w = _3927;
    bool _3971 = !_3889;
    float _3973 = _3969;
    float _3975 = _3969;
    if (!_3971)
    {
        bool _3977 = _3719 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3979 = isnan(_3719);
        bool _3981 = _3977 || _3979;
        bool _3983 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3985 = _3981 || _3983;
        if (!_3985)
        {
            float _3987 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3989 = _3719 + _3987;
            float _3991 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3993 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3991;
            float _3995 = 1.0 / _3993;
            float _3997 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3999 = _3997 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4001 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4003 = _4001 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4005 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4007 = _4005 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4009 = _3989 * _3995;
            float _4011 = precise::clamp(_4009, 0.0, 1.0);
            float _4013 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4015 = _4013 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4017 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4019 = _4017 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4021 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4023 = _4021 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4025 = fma(_4011, _4007, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            float _4027 = fma(_4011, _4015, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4029 = fma(_4011, _4019, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4031 = fma(_4011, _4023, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4033 = fma(_4011, _3999, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4035 = fma(_4011, _4003, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            _3937 = _4029;
            _3967 = _4035;
            _3931 = _4027;
            _3959 = _4033;
            _3943 = _4031;
            _3975 = _4025;
            _4037 = true;
        }
        else
        {
            bool _4039 = _3719 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4041 = isnan(_3719);
            bool _4043 = _4039 || _4041;
            bool _4045 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4047 = _4043 || _4045;
            if (!_4047)
            {
                _3929 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4049 = _3929;
            _3931 = _4049;
            if (!_4047)
            {
                _3935 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4051 = _3935;
            _3937 = _4051;
            if (!_4047)
            {
                _3941 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4053 = _3941;
            _3943 = _4053;
            if (!_4047)
            {
                _3957 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4055 = _3957;
            _3959 = _4055;
            if (!_4047)
            {
                _3965 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4057 = _3965;
            _3967 = _4057;
            if (!_4047)
            {
                _3973 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4059 = _3973;
            bool _4061 = !_4047;
            _3975 = _4059;
            if (!_4061)
            {
                bool _4063 = _3719 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4065 = isnan(_3719);
                bool _4067 = _4063 || _4065;
                bool _4069 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4071 = _4067 || _4069;
                if (!_4071)
                {
                    float _4073 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4075 = _3719 + _4073;
                    float _4077 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4079 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4077;
                    float _4081 = 1.0 / _4079;
                    float _4083 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4085 = _4083 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4087 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4089 = _4087 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4091 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4093 = _4091 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4095 = _4075 * _4081;
                    float _4097 = precise::clamp(_4095, 0.0, 1.0);
                    float _4099 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4101 = _4099 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4103 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4105 = _4103 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4107 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4109 = _4107 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4111 = fma(_4097, _4093, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    float _4113 = fma(_4097, _4101, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4115 = fma(_4097, _4105, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4117 = fma(_4097, _4109, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4119 = fma(_4097, _4085, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4121 = fma(_4097, _4089, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    _3937 = _4115;
                    _3967 = _4121;
                    _3931 = _4113;
                    _3959 = _4119;
                    _3943 = _4117;
                    _3975 = _4111;
                    _4037 = true;
                }
                else
                {
                    _3937 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3967 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3931 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3959 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3943 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3975 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4037 = false;
    float _4123 = _3937;
    float _4125 = _3967;
    float _4127 = _3931;
    float _4129 = _3959;
    float _4131 = _3943;
    float _4133 = _3975;
    float _4135 = fma(_2778, -0.5, 0.5);
    float _4137 = precise::clamp(_4135, 0.0, 1.0);
    float _4139 = -_4123;
    float _4141 = _4139 + _4125;
    float _4143 = -_4127;
    float _4145 = _4143 + _4129;
    float _4147 = -_4131;
    float _4149 = _4147 + _4133;
    bool _4151 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4153 = fma(_4137, _4141, _4123);
    float _4155 = fma(_4137, _4145, _4127);
    float _4157 = fma(_4137, _4149, _4131);
    float _4159 = _4153 * 0.586610972881317138671875;
    out.m_63.x = 1.0;
    float _4161 = fma(_4155, 0.298911988735198974609375, _4159);
    float _4163 = fma(_4157, 0.114477999508380889892578125, _4161);
    out.m_98.x = 0.0;
    float _4165 = -_4163;
    float _4167 = _4155 + _4165;
    float _4169 = -_4163;
    float _4171 = _4153 + _4169;
    float _4173 = -_4163;
    float _4175 = _4157 + _4173;
    float _4177 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4179 = fma(_4167, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4163);
    float _4181 = fma(_4171, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4163);
    float _4183 = fma(_4175, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4163);
    out.m_94.w = _4177;
    out.m_100.x = _4179;
    out.m_100.y = _4181;
    out.m_100.z = _4183;
    if (!_4151)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4185 = -_3178;
    float _4187 = _4185 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4189 = -_3180;
    float _4191 = _4189 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4193 = -_3182;
    float _4195 = _4193 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4197 = _4187 * _4187;
    float _4199 = fma(_4191, _4191, _4197);
    float _4201 = fma(_4195, _4195, _4199);
    float _4203 = sqrt(_4201);
    float _4205 = rsqrt(_4201);
    float _4207 = -_4203;
    float _4209 = _4207 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4211 = _4209 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4213 = precise::clamp(_4211, 0.0, 1.0);
    float _4215 = _4191 * _4205;
    float _4217 = _4187 * _4205;
    float _4219 = abs(_4213);
    float _4221 = log2(_4219);
    float _4223 = _4195 * _4205;
    float _4225 = _4215 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4227 = _2778 * _4217;
    float _4229 = -_4217;
    float _4231 = -_4225;
    float _4233 = fma(_4229, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4231);
    float _4235 = fma(_2768, _4215, _4227);
    float _4237 = -_4223;
    float _4239 = fma(_4237, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4233);
    float _4241 = fma(_2780, _4223, _4235);
    float _4243 = precise::clamp(_4241, 0.0, 1.0);
    float _4245 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4247 = _4239 + _4245;
    float _4249 = _4221 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4251 = _4247 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4253 = precise::clamp(_4251, 0.0, 1.0);
    float _4255 = exp2(_4249);
    float _4257 = _4255 * _4253;
    float _4259 = _4243 * _4257;
    float _4261 = _4259 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4263 = _4259 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4265 = _4259 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_98.x = _4261;
    out.m_98.y = _4263;
    out.m_98.z = _4265;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

