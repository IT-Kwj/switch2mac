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
    float4 m_80 [[user(locn0)]];
    float4 m_82 [[user(locn1)]];
    float4 m_90 [[user(locn2)]];
    float4 m_86 [[user(locn3)]];
    float4 m_100 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_88 [[user(locn6)]];
    float4 m_96 [[user(locn7)]];
    float4 m_78 [[user(locn8)]];
    float4 m_84 [[user(locn9)]];
    float4 m_98 [[user(locn10)]];
    float4 m_92 [[user(locn11)]];
    float4 m_94 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_68 [[attribute(1)]];
    float4 m_72 [[attribute(2)]];
    float4 m_70 [[attribute(3)]];
    float4 m_74 [[attribute(4)]];
    float4 m_56 [[attribute(5)]];
    float4 m_61 [[attribute(6)]];
    float4 m_66 [[attribute(7)]];
    float4 m_76 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3905 = false;
    bool _217 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _114 = in.m_56.w;
    float _116 = trunc(_114);
    int _119 = int(_116);
    bool _123 = _119 >= 1;
    float _125 = 0.0;
    float _127 = as_type<float>(_119);
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _125;
    float _131 = _129;
    if (!_123)
    {
        out.m_59.x = 0.0;
    }
    int _133 = 0;
    if (!_123)
    {
        float _135 = _129 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    int _139 = _137;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4192 = as_type<float>(_137);
        out.gl_Position.z = _4192;
    }
    if (!_123)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _141 = in.m_61.w;
    bool _143 = _141 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_141);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = -_141;
    float _155 = _153 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _157 = _155;
    if (_151)
    {
        float _159 = float(_119);
        _131 = _159;
    }
    float _161 = _131;
    bool _163 = _155 >= _161;
    bool _165 = !_151;
    bool _167 = _163 || _165;
    float _169 = _161;
    if (_167)
    {
        _169 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _169;
    if (_167)
    {
        out.m_59.x = 0.0;
    }
    if (_167)
    {
        float _173 = _171 * 5.0;
        _139 = as_type<int>(_173);
    }
    int _175 = _139;
    if (_167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4262 = as_type<float>(_175);
        out.gl_Position.z = _4262;
    }
    if (_167)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _177 = as_type<float>(int(gl_VertexIndex));
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _181 = as_type<int>(_177) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_177) & 2;
    bool _187 = _185 != 0;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_187;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_179;
    float _215;
    if (!_197)
    {
        float _199 = in.m_66.x;
        float _201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _203 = _199 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _205 = fma(_203, (*spvDescriptorSet0.vp_c9)._m0[12].x, _155);
        float _207 = _205 * _201;
        float _209 = floor(_207);
        float _211 = -_209;
        float _213 = _207 + _211;
        _215 = _213;
        _217 = true;
    }
    else
    {
        float _219 = float(_119);
        float _221 = 1.0 / _219;
        float _223 = _155 * _221;
        _215 = _223;
    }
    _217 = false;
    float _225 = _215;
    float _227 = in.m_56.x;
    float _229 = in.m_56.y;
    float _231 = in.m_56.z;
    float _233 = in.m_68.x;
    float _235 = in.m_68.y;
    float _237 = in.m_68.z;
    float _239 = in.m_68.w;
    float _241 = in.m_70.x;
    float _243 = in.m_70.y;
    float _245 = in.m_70.z;
    float _247 = in.m_70.w;
    float _249 = _229 * _235;
    float _251 = fma(_227, _233, _249);
    float _253 = _229 * _243;
    float _255 = fma(_231, _237, _251);
    float _257 = fma(_227, _241, _253);
    float _259 = _255 + _239;
    float _261 = fma(_231, _245, _257);
    float _263 = fma(_259, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _265 = _261 + _247;
    float _267 = floor(_263);
    float _269 = fma(_265, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _271 = floor(_269);
    float _273 = -_267;
    float _275 = _263 + _273;
    float _277 = -_271;
    float _279 = _269 + _277;
    float2 _4417 = float2(_275, _279);
    float _281 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4417, float2(0.0), isnan(_4417)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4417, float2(0.0), isnan(_4417)), level(0.0)).x;
    float _283 = in.m_72.x;
    float _285 = in.m_72.y;
    float _287 = in.m_72.z;
    float _289 = in.m_72.w;
    float _291 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _293 = log2(_291);
    float _295 = in.m_66.x;
    float _297 = in.m_66.y;
    float _299 = in.m_66.z;
    float _301 = in.m_66.w;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _303;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _309 = _307 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _317 = _315 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _319 = 1.0 / _305;
    int _321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _323 = _321 != 0;
    float _325 = 1.0 / _313;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _331 = _229 * _285;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _337 = 1.0 / _317;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _339;
    float _343 = fma(_227, _283, _331);
    float _345 = _295 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _349 = _225 + _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _353 = _225 + _351;
    float _355 = fma(_231, _287, _343);
    float _357 = _295 * 2.0;
    float _359 = 1.0 / _341;
    float _361 = -_327;
    float _363 = fma(_345, 2.0, _361);
    float _365 = _349 * _319;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _369 = _225 + _367;
    float _371 = _299 * 2.0;
    float _373 = _353 * _325;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _377 = _225 + _375;
    float _379 = _297 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _381 = 1.0 / _309;
    float _383 = _369 * _337;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _387 = _225 + _385;
    float _389 = fma(_379, -2.0, _329);
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _391;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _397 = _395 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _399 = floor(_357);
    float _401 = _387 * _359;
    float _403 = _299 + _295;
    float _405 = fma(_397, _383, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _407 = _403 + (-1.0);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _411 = _225 + _409;
    float _413 = floor(_371);
    float _415 = _377 * _381;
    float _417 = _295 + _297;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _419;
    float _423 = fma(_393, _373, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _429 = _417 + (-1.0);
    float _431 = 1.0 / _335;
    bool _433 = _399 > 0.0;
    float _435 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _437 = _399 >= 0.0;
    bool _439 = isnan(_399);
    bool _441 = _437 || _439;
    bool _443 = isnan(0.0);
    bool _445 = _441 || _443;
    float _447 = _299 + _297;
    int _449 = as_type<int>(_407);
    float _451 = _355;
    if (_323)
    {
        _449 = 0;
    }
    int _453 = _449;
    float _455 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _457 = _453;
    if (!_323)
    {
        _457 = 1;
    }
    int _459 = _457;
    float _461 = _447 + (-1.0);
    float _463 = _297 * 2.0;
    float _465 = fma(_421, _365, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _467 = _413 > 0.0;
    float _469 = fma(_427, _415, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    bool _471 = _413 >= 0.0;
    bool _473 = isnan(_413);
    bool _475 = _471 || _473;
    bool _477 = isnan(0.0);
    bool _479 = _475 || _477;
    float _481 = floor(_463);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _483;
    int _487 = _445 ? 0 : 1;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _491 = _489 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _493 = _459 != 1;
    float _495 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _497 = ~_487;
    int _499 = _497 + 1;
    int _501 = _499 + 1;
    float _503 = fma(_491, _383, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _505 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _507 = int(_505);
    int _509 = _501;
    if (!_433)
    {
        int _511 = ~_487;
        int _513 = _511 + 1;
        _509 = _513;
    }
    int _515 = _509;
    float _517 = fma(_485, _373, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _519 = _479 ? 0 : 1;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _521;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _525;
    bool _529 = _481 > 0.0;
    float _531 = _411 * _431;
    bool _533 = _481 >= 0.0;
    bool _535 = isnan(_481);
    bool _537 = _533 || _535;
    bool _539 = isnan(0.0);
    bool _541 = _537 || _539;
    float _543 = _355 + _289;
    float _545 = fma(_523, _365, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    int _547 = ~_519;
    int _549 = _547 + 1;
    int _551 = _549 + 1;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    int _557 = _551;
    if (!_467)
    {
        int _559 = ~_519;
        int _561 = _559 + 1;
        _557 = _561;
    }
    int _563 = _557;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _569 = _567 != 0;
    int _571 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _573 = _571 != 0;
    int _575 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _577 = _575 != 0;
    float _579 = fma(_527, _401, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    if (!_493)
    {
        _451 = _297;
    }
    float _581 = _451;
    float _583 = fma(_555, _415, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _585 = _581;
    if (_493)
    {
        _585 = _295;
    }
    float _587 = _585;
    float _589 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _591 = int(_589);
    float _593 = _543 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _595 = !_573;
    int _597 = _595 ? 0 : 1;
    float _599 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[83].z, _565);
    bool _601 = !_569;
    int _603 = _601 ? 0 : 1;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _605;
    bool _609 = !_577;
    int _611 = _609 ? 0 : 1;
    float _613 = _543 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _615 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _617 = _615 != 0;
    int _619 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _621 = _619 != 0;
    int _623 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _625 = _623 != 0;
    float _627 = fma(_607, _401, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _629 = float(_119);
    float _631 = fma(_259, (*spvDescriptorSet0.vp_c8)._m0[11].x, _593);
    if (!_493)
    {
        _127 = _299;
    }
    float _633 = _127;
    float _635 = fma(_259, (*spvDescriptorSet0.vp_c8)._m0[10].x, _613);
    float _637 = _541 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _639 = fma(_265, (*spvDescriptorSet0.vp_c8)._m0[11].z, _631);
    float _641 = _633;
    float _643 = _637;
    if (_493)
    {
        _641 = _297;
    }
    float _645 = _641;
    float _647 = 1.0 / _629;
    bool _649 = !_621;
    int _651 = _649 ? 0 : 1;
    float _653 = fma(_265, (*spvDescriptorSet0.vp_c8)._m0[10].z, _635);
    float _655 = _645 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _657 = float(_507);
    float _659 = _639 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _661 = ~as_type<int>(_637);
    int _663 = _661 + 1;
    int _665 = _663 + 1;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _669 = !_617;
    int _671 = _669 ? 0 : 1;
    float _673 = 1.0 / _657;
    int _675 = _665;
    if (!_529)
    {
        int _677 = ~as_type<int>(_637);
        int _679 = _677 + 1;
        _675 = _679;
    }
    int _681 = _675;
    float _683 = _653 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _685 = abs(_651);
    float _687 = -_155;
    float _689 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[76].x, _363);
    if (!_493)
    {
        _643 = _299;
    }
    float _691 = _643;
    float _693 = _683 + _659;
    float _695 = float(_563);
    float _697 = 1.0 / _659;
    float _699 = _691;
    if (_493)
    {
        _699 = _297;
    }
    float _701 = _699;
    float _703 = _647 * _155;
    float _705 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[76].y, _389);
    int _707 = abs(_671);
    float _709 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[83].w, _667);
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _713 = float(_515);
    float _715 = _293 * _155;
    float _717 = _701;
    if (!_493)
    {
        _717 = _297;
    }
    float _719 = _717;
    float _721 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[78].z, _711);
    float _723 = float(_685);
    float _725 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[82].z, _599);
    float _727 = exp2(_715);
    float _729 = _719;
    if (_493)
    {
        _729 = _295;
    }
    float _731 = _729;
    float _733 = _723 * _713;
    float _735 = float(_707);
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _739 = _731 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _741 = _735 * _695;
    float _743 = -_737;
    float _745 = fma(_739, 2.0, _743);
    float _747 = float(_591);
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _751 = in.m_74.x;
    float _753 = in.m_74.y;
    float _755 = in.m_74.z;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _759 = 1.0 + _757;
    float _761 = 1.0 / _747;
    bool _763 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _765 = isnan(1.0);
    bool _767 = _763 || _765;
    bool _769 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _771 = _767 || _769;
    float _773 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _775 = -_727;
    float _777 = _775 + 1.0;
    bool _779 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _781 = isnan(0.0);
    bool _783 = _779 || _781;
    bool _785 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _787 = _783 || _785;
    float _789 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[82].w, _709);
    float _791 = fma(_655, -2.0, _773);
    bool _793 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _795 = isnan(_225);
    bool _797 = _793 || _795;
    bool _799 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _801 = _797 || _799;
    float _803 = float(_801);
    float _805 = 1.0 / _759;
    float _807 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[78].w, _749);
    float _809 = -_155;
    float _811 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[81].x, _745);
    float _813 = _741 * (-2.0);
    bool _815 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _817 = isnan(_225);
    bool _819 = _815 || _817;
    bool _821 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _823 = _819 || _821;
    float _825 = float(_823);
    float _827 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[77].z, _721);
    float _829 = _673 * _155;
    float _831 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[77].w, _807);
    float _833 = _761 * _155;
    float _835 = _787 ? _777 : 0.0;
    float _837 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[81].y, _791);
    float _839 = fma(_455, _813, _455);
    float _841 = -_803;
    float _843 = _841 + 1.0;
    bool _845 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _847 = isnan(_225);
    bool _849 = _845 || _847;
    bool _851 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _853 = _849 || _851;
    float _855 = float(_853);
    float _857 = _693 * _697;
    float _859 = _857 * 0.5;
    bool _861 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _863 = isnan(_225);
    bool _865 = _861 || _863;
    bool _867 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _869 = _865 || _867;
    float _871 = float(_869);
    if (_771)
    {
        float _873 = _835 * _805;
        _157 = _873;
    }
    float _875 = _157;
    float _877 = -_825;
    float _879 = _877 + 1.0;
    float _881 = _825 * _843;
    float _883 = fma(_813, _751, _751);
    float _885 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _887 = _855 * _879;
    float _889 = -_855;
    float _891 = _889 + 1.0;
    float _893 = -_871;
    float _895 = _893 + 1.0;
    bool _897 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _899 = isnan(_225);
    bool _901 = _897 || _899;
    bool _903 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _905 = _901 || _903;
    float _907 = float(_905);
    float _909 = _543 + _885;
    float _911 = _871 * _891;
    bool _913 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _915 = isnan(_225);
    bool _917 = _913 || _915;
    bool _919 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _921 = _917 || _919;
    float _923 = float(_921);
    float _925 = _295 + (-0.5);
    bool _927 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _929 = isnan(_225);
    bool _931 = _927 || _929;
    bool _933 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _935 = _931 || _933;
    float _937 = float(_935);
    float _939 = _907 * _895;
    bool _941 = !_625;
    int _943 = _941 ? 0 : 1;
    float _945 = -_923;
    float _947 = _945 + 1.0;
    float _949 = -_907;
    float _951 = _949 + 1.0;
    int _953 = abs(_943);
    float _955 = _937 * _947;
    float _957 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[196].x, _883);
    float _959 = _923 * _951;
    float _961 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _963 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[30].w, _961);
    float _965 = _423 * _955;
    float _967 = float(_681);
    float _969 = _733 * (-2.0);
    float _971 = float(_953);
    float _973 = -_937;
    float _975 = _973 + 1.0;
    float _977 = _517 * _955;
    float _979 = fma(_495, _969, _495);
    float _981 = fma(_969, _753, _753);
    float _983 = _971 * _967;
    float _985 = _297 + (-0.5);
    float _987 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[143].x, _965);
    float _989 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[143].y, _977);
    float _991 = _983 * (-2.0);
    float _993 = fma(_839, _875, _957);
    float _995 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[196].y, _981);
    float _997 = fma(_405, _959, _987);
    float _999 = fma(_503, _959, _989);
    float _1001 = fma(_435, _991, _435);
    float _1003 = 1.0 / _963;
    float _1005 = in.m_76.x;
    float _1007 = in.m_76.y;
    float _1009 = fma(_991, _755, _755);
    float _1011 = _299 + (-0.5);
    float _1013 = fma(_545, _939, _999);
    float _1015 = fma(_465, _939, _997);
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _1019 = _1017 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _1021 = fma(_1011, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1009);
    float _1023 = fma(_583, _911, _1013);
    float _1025 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _1027 = _1025 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _1029 = fma(_469, _911, _1015);
    float _1031 = fma(_1019, _531, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _1033 = fma(_579, _887, _1023);
    float _1035 = fma(_1027, _531, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _1037 = fma(_627, _887, _1029);
    float _1039 = fma(_1001, _875, _1021);
    float _1041 = fma(_979, _875, _995);
    float _1043 = fma(_1031, _881, _1033);
    float _1045 = fma(_1035, _881, _1037);
    float _1047 = _1039 * 0.15915493667125701904296875;
    float _1049 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1051 = _1003 * _1049;
    float _1053 = _993 * 0.15915493667125701904296875;
    float _1055 = _1041 * 0.15915493667125701904296875;
    float _1057 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[149].y, _1043);
    float _1059 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[149].x, _1045);
    float _1061 = _909 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1063 = _909 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1065 = _1047 * 6.283185482025146484375;
    float _1067 = cos(_1065);
    bool _1069 = _1051 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1071 = _1059 * _1005;
    bool _1073 = _1051 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1075 = fma(_259, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1061);
    float _1077 = fma(_259, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1063);
    float _1079 = _1057 * _1007;
    float _1081 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _1083 = _1053 * 6.283185482025146484375;
    float _1085 = sin(_1083);
    float _1087 = _1071 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1089 = fma(_265, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1075);
    float _1091 = fma(_265, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1077);
    float _1093 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _1095 = _1079 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1097 = _1087 * _1081;
    float _1099 = _1089 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1101 = _1053 * 6.283185482025146484375;
    float _1103 = cos(_1101);
    float _1105 = _1091 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _1107 = !_1069;
    int _1109 = _1107 ? 0 : 1;
    float _1111 = _1095 * _1093;
    float _1113 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1115 = 2;
    if (!_1069)
    {
        _1115 = 1;
    }
    int _1117 = _1115;
    float _1119 = _1055 * 6.283185482025146484375;
    float _1121 = cos(_1119);
    int _1123 = _1117;
    if (!_1073)
    {
        _1123 = _1109;
    }
    int _1125 = _1123;
    int _1127 = _1125 << 6;
    float _1129 = _1047 * 6.283185482025146484375;
    float _1131 = sin(_1129);
    int _1133 = _1127 + 72;
    uint _1136 = uint(int(uint(_1133) >> uint(2)));
    uint _1138 = uint(int(uint(int(_1136)) >> uint(2)));
    int _1140 = int(_1136) & 3;
    float _1142 = (*spvDescriptorSet0.vp_c15)._m0[int(_1138)][_1140];
    int _1144 = int(_1136) + 1;
    uint _1146 = uint(int(uint(_1144) >> uint(2)));
    int _1148 = _1144 & 3;
    float _1150 = (*spvDescriptorSet0.vp_c15)._m0[int(_1146)][_1148];
    float _1152 = _1055 * 6.283185482025146484375;
    float _1154 = sin(_1152);
    float _1156 = _1085 * _1121;
    float _1158 = _1103 * _1121;
    float _1160 = _1121 * _1067;
    float _1162 = trunc(_1099);
    int _1164 = int(_1162);
    float _1166 = -_1111;
    float _1168 = _1131 * _1166;
    int _1170 = _1127 + 56;
    uint _1172 = uint(int(uint(_1170) >> uint(2)));
    uint _1174 = uint(int(uint(int(_1172)) >> uint(2)));
    int _1176 = int(_1172) & 3;
    float _1178 = (*spvDescriptorSet0.vp_c15)._m0[int(_1174)][_1176];
    int _1180 = int(_1172) + 1;
    uint _1182 = uint(int(uint(_1180) >> uint(2)));
    int _1184 = _1180 & 3;
    float _1186 = (*spvDescriptorSet0.vp_c15)._m0[int(_1182)][_1184];
    float _1188 = fma(_1160, _1097, _1168);
    float _1190 = trunc(_1105);
    int _1192 = int(_1190);
    float _1194 = _1103 * _1154;
    float _1196 = _1085 * _1154;
    float _1198 = _1103 * _1067;
    float _1200 = _1085 * _1067;
    int _1202 = _1127 + 96;
    uint _1204 = uint(int(uint(_1202) >> uint(2)));
    uint _1206 = uint(int(uint(int(_1204)) >> uint(2)));
    int _1208 = int(_1204) & 3;
    float _1210 = (*spvDescriptorSet0.vp_c15)._m0[int(_1206)][_1208];
    int _1212 = int(_1204) + 1;
    uint _1214 = uint(int(uint(_1212) >> uint(2)));
    int _1216 = _1212 & 3;
    float _1218 = (*spvDescriptorSet0.vp_c15)._m0[int(_1214)][_1216];
    float _1220 = -_1194;
    float _1222 = fma(_1131, _1156, _1220);
    float _1224 = -_1156;
    float _1226 = fma(_1131, _1194, _1224);
    float _1228 = fma(_1131, _1158, _1196);
    float _1230 = _1198 * _1111;
    float _1232 = _1200 * _1111;
    int _1234 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1236 = _1164 + _1234;
    int _1238 = _1236 + 1;
    float _1240 = _1154 * _1067;
    float _1242 = fma(_1228, _1097, _1230);
    float _1244 = fma(_1222, _1097, _1232);
    bool _1246 = _1238 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1248 = _1127 + 104;
    uint _1250 = uint(int(uint(_1248) >> uint(2)));
    uint _1252 = uint(int(uint(int(_1250)) >> uint(2)));
    int _1254 = int(_1250) & 3;
    float _1256 = (*spvDescriptorSet0.vp_c15)._m0[int(_1252)][_1254];
    int _1258 = int(_1250) + 1;
    uint _1260 = uint(int(uint(_1258) >> uint(2)));
    int _1262 = _1258 & 3;
    float _1264 = (*spvDescriptorSet0.vp_c15)._m0[int(_1260)][_1262];
    int _1266 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1268 = _1192 + _1266;
    int _1270 = _1268 + 1;
    float _1272 = fma(_1226, _1113, _1242);
    float _1274 = fma(_1131, _1196, _1158);
    float _1276 = fma(_1240, _1113, _1188);
    int _1278 = _1238 | _1270;
    float _1280 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1282 = fma(_1274, _1113, _1244);
    int _1284 = _1127 + 48;
    uint _1286 = uint(int(uint(_1284) >> uint(2)));
    uint _1288 = uint(int(uint(int(_1286)) >> uint(2)));
    int _1290 = int(_1286) & 3;
    float _1292 = (*spvDescriptorSet0.vp_c15)._m0[int(_1288)][_1290];
    int _1294 = int(_1286) + 1;
    uint _1296 = uint(int(uint(_1294) >> uint(2)));
    int _1298 = _1294 & 3;
    float _1300 = (*spvDescriptorSet0.vp_c15)._m0[int(_1296)][_1298];
    bool _1302 = _1278 < 0;
    bool _1304 = _1302 || _1246;
    float _1306 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1308 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1280);
    float _1310 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1312 = _1270 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1314 = _1312 || _1304;
    float _1316 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1306);
    float _1318 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1308);
    int _1320 = _1127 + 64;
    uint _1322 = uint(int(uint(_1320) >> uint(2)));
    uint _1324 = uint(int(uint(int(_1322)) >> uint(2)));
    int _1326 = int(_1322) & 3;
    float _1328 = (*spvDescriptorSet0.vp_c15)._m0[int(_1324)][_1326];
    int _1330 = int(_1322) + 1;
    uint _1332 = uint(int(uint(_1330) >> uint(2)));
    int _1334 = _1330 & 3;
    float _1336 = (*spvDescriptorSet0.vp_c15)._m0[int(_1332)][_1334];
    float _1338 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1310);
    float _1340 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1316);
    float _1342 = _1318 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1344 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1338);
    float _1346 = _1340 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1348 = _265 + _1342;
    int _1350 = _1127 + 80;
    uint _1352 = uint(int(uint(_1350) >> uint(2)));
    uint _1354 = uint(int(uint(int(_1352)) >> uint(2)));
    int _1356 = int(_1352) & 3;
    float _1358 = (*spvDescriptorSet0.vp_c15)._m0[int(_1354)][_1356];
    int _1360 = int(_1352) + 1;
    uint _1362 = uint(int(uint(_1360) >> uint(2)));
    int _1364 = _1360 & 3;
    float _1366 = (*spvDescriptorSet0.vp_c15)._m0[int(_1362)][_1364];
    float _1368 = _1344 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1370 = _1238;
    float _1372 = _1348;
    if (!_1314)
    {
        int _1374 = _1270 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1376 = _1374 + _1238;
        _1370 = _1376;
    }
    int _1378 = _1370;
    float _1380 = _259 + _1346;
    float _1382 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1384 = _1348 + _1382;
    float _1386 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1388 = _1380 + _1386;
    float _1390 = _1384 * _1384;
    int _1392 = 0;
    int _1394 = as_type<int>(_1390);
    float _1396 = _1380;
    float _1398 = as_type<float>(_1378);
    if (!_1314)
    {
        int _1400 = _1378 << 2;
        _1392 = _1400;
    }
    int _1402 = _1392;
    float _1404 = fma(_1388, _1388, _1390);
    int _1406 = _1402;
    if (!_1314)
    {
        uint _1408 = uint(int(uint(_1378) >> uint(2)));
        _1394 = int(_1408);
    }
    int _1410 = _1394;
    int _1412 = _1410;
    if (!_1314)
    {
        int _1414 = 12 & _1402;
        _1406 = _1414;
    }
    int _1416 = _1406;
    float _1418 = sqrt(_1404);
    if (!_1314)
    {
        int _1420 = _1410 << 4;
        int _1422 = _1420 + _1416;
        _1412 = _1422;
    }
    int _1424 = _1412;
    float _1426 = _909 * _1218;
    float _1428 = fma(_259, _1210, _1426);
    float _1430 = fma(_265, _1256, _1428);
    float _1432 = _1430 + _1264;
    float _1434 = _909 * _1300;
    bool _1436 = _1418 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1438 = _543 + _1368;
    float _1440 = fma(_259, _1292, _1434);
    float _1442 = 1.0 / _1432;
    int _1444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1446 = _1444 != 0;
    int _1448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1450 = _1448 != 0;
    int _1452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1454 = _1452 != 0;
    int _1456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1458 = _1456 != 0;
    float _1460 = _909 * _1336;
    float _1462 = fma(_265, _1178, _1440);
    float _1464 = fma(_259, _1328, _1460);
    bool _1466 = !_1450;
    int _1468 = _1466 ? 0 : 1;
    float _1470 = _1292;
    float _1472 = _1464;
    float _1474 = _1328;
    float _1476 = _1418;
    if (!_1314)
    {
        float _1478 = floor(_1099);
        _1470 = _1478;
    }
    float _1480 = _1470;
    float _1482 = _1462 + _1186;
    float _1484 = fma(_265, _1142, _1464);
    bool _1486 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1488 = isnan(0.5);
    bool _1490 = _1486 || _1488;
    bool _1492 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1494 = _1490 || _1492;
    bool _1496 = !_1446;
    int _1498 = _1496 ? 0 : 1;
    float _1500 = _1484 + _1150;
    bool _1502 = !_1454;
    int _1504 = _1502 ? 0 : 1;
    bool _1506 = !_1458;
    int _1508 = _1506 ? 0 : 1;
    if (!_1436)
    {
        _1472 = _1438;
    }
    float _1510 = _1472;
    bool _1512 = !_1436;
    float _1514 = _1510;
    if (!_1512)
    {
        float _1516 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1518 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1520 = _1418 + _1518;
        float _1522 = _1438 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1524 = rsqrt(_1404);
        float _1526 = _1520 * _1516;
        float _1528 = _1526 * 0.15915493667125701904296875;
        float _1530 = _1528 * 6.283185482025146484375;
        float _1532 = cos(_1530);
        float _1534 = _1528 * 6.283185482025146484375;
        float _1536 = sin(_1534);
        float _1538 = _1532 + (-1.0);
        float _1540 = _1538 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1542 = fma(_1536, _1522, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1544 = fma(_1438, _1532, _1540);
        float _1546 = _1524 * _1542;
        float _1548 = fma(_1388, _1546, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1550 = fma(_1384, _1546, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1396 = _1548;
        _1372 = _1550;
        _1514 = _1544;
        _1474 = _1540;
        _1476 = _1528;
    }
    float _1552 = _1396;
    float _1554 = _1372;
    float _1556 = _1514;
    float _1558 = _1474;
    float _1560 = _1476;
    float _1562 = _1558;
    float _1564 = _1560;
    float _1566 = _1556;
    if (_1494)
    {
        _1562 = _1552;
    }
    float _1568 = _1562;
    float _1570 = _1568;
    if (_1494)
    {
        _1564 = _1554;
    }
    float _1572 = _1564;
    float _1574 = _1572;
    if (!_1494)
    {
        float _1576 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1578 = _543 + _1576;
        float _1580 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1582 = _259 + _1580;
        float _1584 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1586 = -_265;
        float _1588 = _1586 + _1554;
        float _1590 = _1578 * _1578;
        float _1592 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1594 = _265 + _1592;
        float _1596 = fma(_1582, _1582, _1590);
        float _1598 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1600 = fma(_1594, _1594, _1596);
        float _1602 = sqrt(_1600);
        float _1604 = _1584 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1606 = precise::min(_1602, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1608 = _1606 * _1598;
        float _1610 = -_543;
        float _1612 = _1610 + _1556;
        float _1614 = _1604 * _1608;
        float _1616 = -_259;
        float _1618 = _1616 + _1552;
        float _1620 = fma(_1612, _1614, _543);
        float _1622 = fma(_1618, _1614, _259);
        float _1624 = fma(_1588, _1614, _265);
        _1566 = _1620;
        _1570 = _1622;
        _1574 = _1624;
    }
    float _1626 = _1566;
    float _1628 = _1570;
    float _1630 = _1574;
    int _1632 = _1127 + 88;
    uint _1634 = uint(int(uint(_1632) >> uint(2)));
    uint _1636 = uint(int(uint(int(_1634)) >> uint(2)));
    int _1638 = int(_1634) & 3;
    float _1640 = (*spvDescriptorSet0.vp_c15)._m0[int(_1636)][_1638];
    int _1642 = int(_1634) + 1;
    uint _1644 = uint(int(uint(_1642) >> uint(2)));
    int _1646 = _1642 & 3;
    float _1648 = (*spvDescriptorSet0.vp_c15)._m0[int(_1644)][_1646];
    float _1650 = _1626 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1652 = _1626 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1654 = _1482 * _1442;
    float _1656 = _1626 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1658 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1650);
    float _1660 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1652);
    float _1662 = _1626 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1664 = _1552;
    if (!_1314)
    {
        int _1666 = _1424 + 400;
        uint _1668 = uint(int(uint(_1666) >> uint(2)));
        uint _1670 = uint(int(uint(int(_1668)) >> uint(2)));
        int _1672 = int(_1668) & 3;
        float _1674 = (*spvDescriptorSet0.vp_c15)._m0[int(_1670)][_1672];
        _1664 = _1674;
    }
    float _1676 = _1664;
    float _1678 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1658);
    bool _1680 = _1654 >= 0.0;
    float _1682 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1656);
    float _1684 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1660);
    float _1686 = _1678 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1688 = _1500 * _1442;
    bool _1690 = _1654 <= 1.0;
    bool _1692 = _1690 && _1680;
    float _1694 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1682);
    float _1696 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1662);
    float _1698 = _1684 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1700 = _1686 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1702 = _1688 >= 0.0;
    bool _1704 = _1702 && _1692;
    float _1706 = _1694 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1708 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1696);
    float _1710 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1700);
    bool _1712 = _1688 <= 1.0;
    bool _1714 = _1712 && _1704;
    float _1716 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1718 = _1706 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1720 = _1708 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1722 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1710);
    float _1724 = _909 * _1366;
    float _1726 = _1142;
    float _1728 = _1716;
    if (!_1314)
    {
        float _1730 = floor(_1105);
        _1726 = _1730;
    }
    float _1732 = _1726;
    float _1734 = -_1718;
    float _1736 = fma(_1734, _1716, 1.0);
    float _1738 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1722);
    float _1740 = fma(_259, _1358, _1724);
    float _1742 = _1686 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1744 = _1686 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    if (_1714)
    {
        float _1746 = float(_1125);
        _1728 = _1746;
    }
    float _1748 = _1728;
    float _1750 = log2(_1736);
    float _1752 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1742);
    float _1754 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1744);
    float _1756 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1752);
    float _1758 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1754);
    float _1760 = 1.0 / _1738;
    float _1762 = 0.0;
    float _1764 = _1752;
    if (!_1314)
    {
        float _1766 = -_1732;
        float _1768 = _1105 + _1766;
        _1762 = _1768;
    }
    float _1770 = _1762;
    float _1772 = fma(_265, _1640, _1740);
    float _1774 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1756);
    float _1776 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1758);
    float _1778 = _1772 + _1648;
    float _1780 = _1742;
    float _1782 = _1774;
    if (_1714)
    {
        float _1784 = rint(_1748);
        float _1786 = precise::max(_1784, 0.0);
        uint _1788 = uint(_1786);
        uint _1790 = clamp(_1788, 0u, 65535u);
        _1780 = as_type<float>(_1790);
    }
    float _1792 = _1780;
    float _1794 = _1750 * 0.693147182464599609375;
    float _1796 = _1778 * _1442;
    float _1798 = _1794 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1800 = _1778;
    if (!_1314)
    {
        float _1802 = rint(_1676);
        float _1804 = precise::max(_1802, 0.0);
        uint _1806 = uint(_1804);
        uint _1808 = clamp(_1806, 0u, 65535u);
        _1800 = as_type<float>(_1808);
    }
    float _1810 = _1800;
    float _1812 = _1774 * _1760;
    float _1814 = _1776 * _1760;
    float _1816 = fma(_1812, 0.5, 0.5);
    float _1818 = fma(_1814, -0.5, 0.5);
    float _1820 = _1812;
    if (!_1314)
    {
        float _1822 = -_1480;
        float _1824 = _1099 + _1822;
        _1820 = _1824;
    }
    float _1826 = _1820;
    float _1828 = _1480;
    if (_1714)
    {
        float3 _6903 = float3(_1654, _1688, float(as_type<int>(_1792)));
        float3 _6907 = select(_6903, float3(0.0), isnan(_6903));
        float _1830 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6907.xy, uint(rint(_6907.z)), _1796, level(0.0));
        _1828 = _1830;
    }
    float _1832 = _1828;
    float3 _6917 = float3(_1816, _1818, _1798);
    float _1834 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6917, float3(0.0), isnan(_6917)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6917, float3(0.0), isnan(_6917)), level(0.0)).x;
    float3 _6926 = float3(_1816, _1818, _1798);
    float4 _1837 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6926, float3(0.0), isnan(_6926)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6926, float3(0.0), isnan(_6926)), level(0.0)).xyzw;
    float _1839 = _1837.x;
    float _1841 = _1837.y;
    float _1843 = _1837.z;
    float _1845 = _1837.w;
    float _1847 = _1770;
    if (!_1314)
    {
        float3 _6949 = float3(_1826, _1770, float(as_type<int>(_1810)));
        float3 _6951 = select(_6949, float3(0.0), isnan(_6949));
        float _1849 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6951.xy, uint(rint(_6951.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6951.xy, uint(rint(_6951.z)), level(0.0)).x;
        _1847 = _1849;
    }
    float _1851 = _1847;
    float _1853 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1855 = int(_1853);
    int _1857 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1859 = _1857 != 0;
    int _1861 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1863 = _1861 != 0;
    int _1865 = abs(_597);
    int _1867 = abs(_1468);
    float _1869 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1871 = int(_1869);
    int _1873 = abs(_1498);
    int _1875 = abs(_1504);
    int _1877 = abs(_1508);
    float _1879 = as_type<float>(_1877);
    if (_1859)
    {
        float _1881 = in.m_66.x;
        _1764 = _1881;
    }
    float _1883 = _1764;
    float _1885 = float(uint(_1855));
    float _1887 = trunc(_829);
    int _1889 = int(_1887);
    float _1891 = _1883;
    if (!_1859)
    {
        float _1893 = in.m_66.y;
        _1891 = _1893;
    }
    float _1895 = _1891;
    int _1897 = ~_1855;
    int _1899 = _1897 + 1;
    float _1901 = float(uint(_1871));
    float _1903 = 1.0 / _1885;
    int _1905 = ~_1871;
    int _1907 = _1905 + 1;
    float _1909 = 1.0 / _1901;
    float _1911 = trunc(_833);
    int _1913 = int(_1911);
    int _1915 = as_type<int>(_1903) + (-2);
    float _1917 = float(uint(_1889));
    float _1919 = float(_1889);
    int _1921 = as_type<int>(_1909) + (-2);
    float _1923 = as_type<float>(_1915) * _1917;
    float _1925 = _1917;
    if (_1859)
    {
        _1925 = 1.0;
    }
    float _1927 = _1925;
    float _1929 = _1927;
    if (!_1859)
    {
        _1929 = 7.345489978790283203125;
    }
    float _1931 = _1929;
    float _1933 = trunc(_1923);
    float _1935 = precise::max(_1933, 0.0);
    uint _1937 = uint(_1935);
    float _1939 = float(uint(_1913));
    float _1941 = _1931 * _295;
    float _1943 = as_type<float>(_1921) * _1939;
    float _1945 = _1939;
    if (_1859)
    {
        _1945 = 1.0;
    }
    float _1947 = _1945;
    float _1949 = floor(_1941);
    float _1951 = _1947;
    if (!_1859)
    {
        _1951 = 1.2345600128173828125;
    }
    float _1953 = _1951;
    float _1955 = _1953 * _1895;
    float _1957 = trunc(_1943);
    float _1959 = precise::max(_1957, 0.0);
    uint _1961 = uint(_1959);
    int _1963 = _1899 * int(_1937);
    int _1965 = _1963 + _1889;
    float _1967 = float(uint(_1965));
    float _1969 = floor(_1955);
    float _1971 = float(_1855);
    float _1973 = as_type<float>(_1915) * _1967;
    int _1975 = _1907 * int(_1961);
    int _1977 = _1975 + _1913;
    float _1979 = trunc(_1973);
    float _1981 = precise::max(_1979, 0.0);
    uint _1983 = uint(_1981);
    float _1985 = float(uint(_1977));
    float _1987 = -_1969;
    float _1989 = _1955 + _1987;
    float _1991 = float(_1871);
    float _1993 = as_type<float>(_1921) * _1985;
    float _1995 = -_1949;
    float _1997 = _1941 + _1995;
    int _1999 = ~_1855;
    int _2001 = _1999 + 1;
    bool _2003 = _1919 >= _1971;
    bool _2005 = isnan(_1919);
    bool _2007 = _2003 || _2005;
    bool _2009 = isnan(_1971);
    bool _2011 = _2007 || _2009;
    float _2013 = float(_2011);
    float _2015 = _1989 * _1991;
    float _2017 = trunc(_1993);
    float _2019 = precise::max(_2017, 0.0);
    uint _2021 = uint(_2019);
    int _2023 = int(_1937) + int(_1983);
    float _2025 = _1997 * _1971;
    float _2027 = _1971 * _703;
    float _2029 = _1991 * _703;
    int _2031 = _2001 * _2023;
    int _2033 = _2031 + _1889;
    float _2035 = trunc(_2013);
    int _2037 = int(_2035);
    bool _2039 = uint(_2033) >= uint(_1855);
    bool _2041 = !_2039;
    int _2043 = _2041 ? 0 : (-1);
    float _2045 = trunc(_2025);
    int _2047 = int(_2045);
    int _2049 = int(_1961) + int(_2021);
    float _2051 = float(_1913);
    int _2053 = ~_1871;
    int _2055 = _2053 + 1;
    bool _2057 = _2051 >= _1991;
    bool _2059 = isnan(_2051);
    bool _2061 = _2057 || _2059;
    bool _2063 = isnan(_1991);
    bool _2065 = _2061 || _2063;
    float _2067 = float(_2065);
    float _2069 = trunc(_2015);
    int _2071 = int(_2069);
    int _2073 = _2055 * _2049;
    int _2075 = _2073 + _1913;
    int _2077 = ~_2023;
    int _2079 = _2077 + _2043;
    int _2081 = _2079 + 1;
    int _2083 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2085 = _2083 != 0;
    int _2087 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2089 = _2087 != 0;
    float _2091 = trunc(_2067);
    int _2093 = int(_2091);
    bool _2095 = uint(_2075) >= uint(_1871);
    bool _2097 = !_2085;
    int _2099 = _2097 ? 0 : 1;
    bool _2101 = !_2089;
    int _2103 = _2101 ? 0 : 1;
    int _2105 = abs(_2099);
    int _2107 = _1855 * _2081;
    int _2109 = _2107 + _1889;
    bool _2111 = !_2095;
    int _2113 = _2111 ? 0 : (-1);
    float _2115 = trunc(_2027);
    int _2117 = int(_2115);
    int _2119 = abs(_2103);
    bool _2121 = _1855 == 0;
    int _2123 = ~_2049;
    int _2125 = _2123 + _2113;
    int _2127 = _2125 + 1;
    int _2129 = _2047 * _2105;
    int _2131 = _2129 + _1889;
    float _2133 = trunc(_2029);
    int _2135 = int(_2133);
    int _2137 = ~_2037;
    int _2139 = _2137 + 1;
    int _2141 = _2139 + 1;
    int _2143 = _1871 * _2127;
    int _2145 = _2143 + _1913;
    bool _2147 = !_2121;
    int _2149 = _2147 ? _2109 : (-1);
    int _2151 = _2071 * _2119;
    int _2153 = _2151 + _1913;
    bool _2155 = _1871 == 0;
    int _2157 = ~_2093;
    int _2159 = _2157 + 1;
    int _2161 = _2159 + 1;
    int _2163 = _2149 * _2141;
    bool _2165 = !_2155;
    int _2167 = _2165 ? _2145 : (-1);
    int _2169 = _1855 + (-1);
    int _2171 = _1871 + (-1);
    int _2173 = _2167 * _2161;
    int _2175 = _2037 * _2169;
    int _2177 = _2175 + _2163;
    int _2179 = _2093 * _2171;
    int _2181 = _2179 + _2173;
    int _2183 = abs(_603);
    int _2185 = _2177 * _1865;
    bool _2187 = !_1863;
    int _2189 = _2187 ? 0 : 1;
    int _2191 = abs(_611);
    int _2193 = _2117 * _2183;
    int _2195 = _2193 + _2185;
    int _2197 = abs(_2189);
    int _2199 = _2181 * _1867;
    int _2201 = _2131 * _2191;
    int _2203 = _2201 + _2195;
    int _2205 = _2135 * _1873;
    int _2207 = _2205 + _2199;
    int _2209 = ~_1871;
    int _2211 = _2209 + 1;
    int _2213 = _2047 * _2197;
    int _2215 = _2213 + _2203;
    int _2217 = _2153 * _1875;
    int _2219 = _2217 + _2207;
    int _2221 = ~_1855;
    int _2223 = _2221 + 1;
    float _2225 = float(uint(_2215));
    int _2227 = _2071 * _1877;
    int _2229 = _2227 + _2219;
    int _2231 = ~_1855;
    int _2233 = _2231 + 1;
    int _2235 = ~_1871;
    int _2237 = _2235 + 1;
    float _2239 = as_type<float>(_1915) * _2225;
    float _2241 = float(uint(_2229));
    float _2243 = float(uint(_2131));
    float _2245 = trunc(_2239);
    float _2247 = precise::max(_2245, 0.0);
    uint _2249 = uint(_2247);
    float _2251 = as_type<float>(_1921) * _2241;
    float _2253 = as_type<float>(_1915) * _2243;
    float _2255 = trunc(_2251);
    float _2257 = precise::max(_2255, 0.0);
    uint _2259 = uint(_2257);
    int _2261 = _2223 * int(_2249);
    int _2263 = _2261 + _2215;
    float _2265 = trunc(_2253);
    float _2267 = precise::max(_2265, 0.0);
    uint _2269 = uint(_2267);
    float _2271 = float(uint(_2263));
    int _2273 = _2211 * int(_2259);
    int _2275 = _2273 + _2229;
    float _2277 = as_type<float>(_1915) * _2271;
    float _2279 = float(uint(_2275));
    int _2281 = ~_1855;
    int _2283 = _2281 + 1;
    float _2285 = trunc(_2277);
    float _2287 = precise::max(_2285, 0.0);
    uint _2289 = uint(_2287);
    float _2291 = as_type<float>(_1921) * _2279;
    float _2293 = float(uint(_2153));
    int _2295 = _2283 * int(_2269);
    int _2297 = _2295 + _2131;
    float _2299 = trunc(_2291);
    float _2301 = precise::max(_2299, 0.0);
    uint _2303 = uint(_2301);
    float _2305 = as_type<float>(_1921) * _2293;
    float _2307 = float(uint(_2297));
    int _2309 = ~_1871;
    int _2311 = _2309 + 1;
    float _2313 = as_type<float>(_1915) * _2307;
    float _2315 = trunc(_2305);
    float _2317 = precise::max(_2315, 0.0);
    uint _2319 = uint(_2317);
    int _2321 = int(_2249) + int(_2289);
    int _2323 = int(_2259) + int(_2303);
    int _2325 = _2233 * _2321;
    int _2327 = _2325 + _2215;
    float _2329 = trunc(_2313);
    float _2331 = precise::max(_2329, 0.0);
    uint _2333 = uint(_2331);
    int _2335 = _2237 * _2323;
    int _2337 = _2335 + _2229;
    bool _2339 = uint(_2327) >= uint(_1855);
    int _2341 = _2311 * int(_2319);
    int _2343 = _2341 + _2153;
    bool _2345 = !_2339;
    int _2347 = _2345 ? 0 : (-1);
    bool _2349 = uint(_2337) >= uint(_1871);
    float _2351 = float(uint(_2343));
    int _2353 = ~_2321;
    int _2355 = _2353 + _2347;
    int _2357 = _2355 + 1;
    bool _2359 = !_2349;
    int _2361 = _2359 ? 0 : (-1);
    float _2363 = as_type<float>(_1921) * _2351;
    int _2365 = int(_2269) + int(_2333);
    int _2367 = _1855 * _2357;
    int _2369 = _2367 + _2215;
    int _2371 = ~_2323;
    int _2373 = _2371 + _2361;
    int _2375 = _2373 + 1;
    float _2377 = as_type<float>(_2321);
    if (_1314)
    {
        _2377 = 1.0;
    }
    float _2379 = _2377;
    float _2381 = _2379;
    if (!_1314)
    {
        int _2383 = _1378 << 4;
        int _2385 = _2383 + 2048;
        uint _2387 = uint(int(uint(_2385) >> uint(2)));
        uint _2389 = uint(int(uint(int(_2387)) >> uint(2)));
        int _2391 = int(_2387) & 3;
        float _2393 = (*spvDescriptorSet0.vp_c15)._m0[int(_2389)][_2391];
        int _2395 = int(_2387) + 1;
        uint _2397 = uint(int(uint(_2395) >> uint(2)));
        int _2399 = _2395 & 3;
        float _2401 = (*spvDescriptorSet0.vp_c15)._m0[int(_2397)][_2399];
        int _2403 = _2385 + 8;
        uint _2405 = uint(int(uint(_2403) >> uint(2)));
        uint _2407 = uint(int(uint(int(_2405)) >> uint(2)));
        int _2409 = int(_2405) & 3;
        float _2411 = (*spvDescriptorSet0.vp_c15)._m0[int(_2407)][_2409];
        int _2413 = int(_2405) + 1;
        uint _2415 = uint(int(uint(_2413) >> uint(2)));
        int _2417 = _2413 & 3;
        float _2419 = (*spvDescriptorSet0.vp_c15)._m0[int(_2415)][_2417];
        float _2421 = _909 * _2401;
        float _2423 = fma(_259, _2393, _2421);
        float _2425 = fma(_265, _2411, _2423);
        float _2427 = _2425 + _2419;
        float _2429 = precise::clamp(_2427, 0.0, 1.0);
        float _2431 = -_2429;
        float _2433 = _2431 + _1851;
        float _2435 = fma(_2433, 500.0, 1.5);
        float _2437 = exp2(_2435);
        float _2439 = 0.0 + _2437;
        float _2441 = precise::clamp(_2439, 0.0, 1.0);
        _1398 = as_type<float>(_2385);
        _2381 = _2441;
    }
    float _2443 = _1398;
    float _2445 = _2381;
    float _2447 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2449 = _1626 + _2447;
    float _2451 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2453 = _1628 + _2451;
    float _2455 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2457 = _1630 + _2455;
    float _2459 = _2449 * _2449;
    float _2461 = fma(_2453, _2453, _2459);
    float _2463 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2465 = fma(_2457, _2457, _2461);
    float _2467 = rsqrt(_2465);
    float _2469 = sqrt(_2465);
    float _2471 = _2467 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2473 = _2453 * _2471;
    float _2475 = _2457 * _2471;
    float _2477 = _2473 * _2473;
    float _2479 = _2475 * _2475;
    float _2481 = _2477 + _2479;
    float _2483 = sqrt(_2481);
    bool _2485 = _2483 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2487 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2489 = _2483 + _2487;
    float _2491 = _2443;
    float _2493 = _2481;
    float _2495 = _2489;
    float _2497 = _2463;
    float _2499 = _2473;
    float _2501 = _2475;
    float _2503 = _2477;
    float _2505 = _2479;
    if (_2485)
    {
        float _2507 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2491 = _2507;
    }
    float _2509 = _2491;
    if (_2485)
    {
        float _2511 = rsqrt(_2481);
        _2493 = _2511;
    }
    float _2513 = _2493;
    if (_2485)
    {
        float _2515 = _2489 * _2509;
        _2495 = _2515;
    }
    float _2517 = _2495;
    float _2519 = precise::max(0.0, _2463);
    float _2521 = _2519;
    if (_2485)
    {
        float _2523 = _2517 * 0.15915493667125701904296875;
        _1879 = _2523;
    }
    float _2525 = _1879;
    float _2527 = -_2471;
    float _2529 = -_2519;
    float _2531 = fma(_2449, _2527, _2529);
    float _2533 = as_type<float>(_2333);
    float _2535 = _2531;
    if (_2485)
    {
        float _2537 = _2525 * 6.283185482025146484375;
        float _2539 = sin(_2537);
        _2533 = _2539;
    }
    float _2541 = _2533;
    if (_2485)
    {
        float _2543 = _2531 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2521 = _2543;
    }
    float _2545 = _2521;
    float _2547 = _2517;
    float _2549 = _2545;
    if (_2485)
    {
        float _2551 = _2525 * 6.283185482025146484375;
        float _2553 = cos(_2551);
        _2547 = _2553;
    }
    float _2555 = _2547;
    float _2557 = _2541;
    if (_2485)
    {
        float _2559 = fma(_2541, _2545, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2549 = _2559;
    }
    float _2561 = _2549;
    float _2563 = _2561;
    if (_2485)
    {
        float _2565 = _2513 * _2561;
        _2557 = _2565;
    }
    float _2567 = _2557;
    if (_2485)
    {
        float _2569 = _2555 + (-1.0);
        _2497 = _2569;
    }
    float _2571 = _2497;
    if (_2485)
    {
        float _2573 = _2473 * _2567;
        _2499 = _2573;
    }
    float _2575 = _2499;
    if (_2485)
    {
        float _2577 = _2475 * _2567;
        _2501 = _2577;
    }
    float _2579 = _2501;
    if (_2485)
    {
        float _2581 = _2571 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2563 = _2581;
    }
    float _2583 = _2563;
    if (_2485)
    {
        float _2585 = _2575 * _2575;
        _2503 = _2585;
    }
    float _2587 = _2503;
    if (_2485)
    {
        float _2589 = _2579 * _2579;
        _2505 = _2589;
    }
    float _2591 = _2505;
    int _2593 = ~_1855;
    int _2595 = _2593 + 1;
    if (_2485)
    {
        float _2597 = fma(_2531, _2555, _2583);
        _2535 = _2597;
    }
    float _2599 = _2535;
    float _2601 = fma(_2599, _2599, _2587);
    float _2603 = _2601 + _2591;
    float _2605 = rsqrt(_2603);
    float _2607 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2609 = fma(_2469, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2607);
    float _2611 = precise::clamp(_2609, 0.0, 1.0);
    float _2613 = -_2611;
    float _2615 = _2613 + 1.0;
    float _2617 = abs(_2615);
    float _2619 = log2(_2617);
    float _2621 = _2605 * _2575;
    float _2623 = _2605 * _2599;
    float _2625 = _2605 * _2579;
    float _2627 = _2621 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2629 = _2623 + 1.0;
    float _2631 = -_2627;
    float _2633 = fma(_2623, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2631);
    float _2635 = _2619 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2637 = -_2625;
    float _2639 = fma(_2637, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2633);
    float _2641 = exp2(_2635);
    float _2643 = fma(_2639, -0.5, 0.5);
    float _2645 = fma(_2639, 0.5, 0.5);
    float _2647 = fma(_2645, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2649 = sqrt(_2643);
    float _2651 = fma(_2645, _2647, -0.212114393711090087890625);
    float _2653 = fma(_2645, _2651, 1.570728778839111328125);
    float _2655 = -_2623;
    float _2657 = fma(_2641, _2629, _2655);
    bool _2659 = !_2121;
    int _2661 = _2659 ? _2369 : (-1);
    int _2663 = _2661 & 3;
    bool _2665 = _2663 != 0;
    float _2667 = _2649 * 0.636619746685028076171875;
    int _2669 = _2661 & 3;
    bool _2671 = _2669 != 0;
    float _2673 = -_2653;
    float _2675 = fma(_2667, _2673, 1.0);
    float _2677 = fma(_2657, 0.5, 0.5);
    int _2679 = _2595 * _2365;
    int _2681 = _2679 + _2131;
    bool _2683 = uint(_2669) > 1u;
    float2 _8117 = float2(_2675, _2677);
    float3 _2687 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8117, float2(0.0), isnan(_8117)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8117, float2(0.0), isnan(_8117)), level(0.0)).xyz;
    float _2689 = _2687.x;
    float _2691 = _2687.y;
    float _2693 = _2687.z;
    int _2695 = _1871 * _2375;
    int _2697 = _2695 + _2229;
    bool _2699 = uint(_2681) >= uint(_1855);
    float _2701 = trunc(_2363);
    float _2703 = precise::max(_2701, 0.0);
    uint _2705 = uint(_2703);
    int _2707 = _2665 ? 0 : 1;
    float _2709 = _1686 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2711 = _2661 >> 31;
    float _2713 = _2619 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2715 = _301 > 0.5;
    float _2717 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2709);
    bool _2719 = !_2155;
    int _2721 = _2719 ? _2697 : (-1);
    float _2723 = -_831;
    float _2725 = _2723 + 1.0;
    int _2727 = ~_2707;
    int _2729 = _2727 + 1;
    int _2731 = _2729 + 1;
    float _2733 = exp2(_2713);
    int _2735 = _2731;
    if (!_2683)
    {
        int _2737 = ~_2707;
        int _2739 = _2737 + 1;
        _2735 = _2739;
    }
    int _2741 = _2735;
    float _2743 = -_725;
    float _2745 = _2743 + 1.0;
    int _2747 = _2711 & 3;
    float _2749 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2717);
    int _2751 = _2721 >> 31;
    float _2753 = -_789;
    float _2755 = _2753 + 1.0;
    int _2757 = _2661 + _2747;
    float _2759 = -_281;
    float _2761 = _2759 + 1.0;
    int _2763 = _2751 & 3;
    float _2765 = -_827;
    float _2767 = _2765 + 1.0;
    bool _2769 = !_2699;
    int _2771 = _2769 ? 0 : (-1);
    out.m_78.x = _1628;
    out.m_78.y = _1626;
    out.m_78.z = _1630;
    bool _2773 = _2669 != 3;
    int _2775 = _2721 + _2763;
    float _2777 = -_2733;
    float _2779 = _2777 + 1.0;
    bool _2781 = uint(_2669) >= 2u;
    int _2783 = _2775 >> 2;
    int _2785 = _2757 >> 2;
    int _2787 = _2781 ? 0 : 1;
    int _2789 = _2783 << 4;
    int _2791 = _2789 + 512;
    int _2793 = _2785 << 4;
    int _2795 = _2793 + 368;
    int _2797 = ~_2787;
    int _2799 = _2797 + 1;
    int _2801 = _2799 + 1;
    int _2803 = _2801;
    if (_2773)
    {
        int _2805 = ~_2787;
        int _2807 = _2805 + 1;
        _2803 = _2807;
    }
    int _2809 = _2803;
    uint _2811 = uint(int(uint(_2795) >> uint(2)));
    uint _2813 = uint(int(uint(int(_2811)) >> uint(2)));
    int _2815 = int(_2811) & 3;
    float _2817 = (*spvDescriptorSet0.vp_c9)._m0[int(_2813)][_2815];
    int _2819 = int(_2811) + 1;
    uint _2821 = uint(int(uint(_2819) >> uint(2)));
    int _2823 = _2819 & 3;
    float _2825 = (*spvDescriptorSet0.vp_c9)._m0[int(_2821)][_2823];
    int _2827 = ~_2365;
    int _2829 = _2827 + _2771;
    int _2831 = _2829 + 1;
    int _2833 = int(_2319) + int(_2705);
    float _2835 = -_195;
    int _2837 = _2715 ? as_type<int>(_2835) : as_type<int>(_195);
    int _2839 = _1855 * _2831;
    int _2841 = _2839 + _2131;
    bool _2843 = !_2671;
    int _2845 = _2843 ? 0 : 1;
    uint _2847 = uint(int(uint(_2791) >> uint(2)));
    uint _2849 = uint(int(uint(int(_2847)) >> uint(2)));
    int _2851 = int(_2847) & 3;
    float _2853 = (*spvDescriptorSet0.vp_c9)._m0[int(_2849)][_2851];
    int _2855 = int(_2847) + 1;
    uint _2857 = uint(int(uint(_2855) >> uint(2)));
    int _2859 = _2855 & 3;
    float _2861 = (*spvDescriptorSet0.vp_c9)._m0[int(_2857)][_2859];
    bool _2863 = _2669 != 3;
    int _2865 = _2721 & 3;
    bool _2867 = _2865 != 0;
    int _2869 = _2721 & 3;
    bool _2871 = _2869 != 0;
    int _2873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2875 = _2873 != 0;
    int _2877 = _2795 + 8;
    uint _2879 = uint(int(uint(_2877) >> uint(2)));
    uint _2881 = uint(int(uint(int(_2879)) >> uint(2)));
    int _2883 = int(_2879) & 3;
    float _2885 = (*spvDescriptorSet0.vp_c9)._m0[int(_2881)][_2883];
    int _2887 = int(_2879) + 1;
    uint _2889 = uint(int(uint(_2887) >> uint(2)));
    int _2891 = _2887 & 3;
    float _2893 = (*spvDescriptorSet0.vp_c9)._m0[int(_2889)][_2891];
    int _2895 = ~_1871;
    int _2897 = _2895 + 1;
    bool _2899 = !_2875;
    int _2901 = _2899 ? 0 : 1;
    bool _2903 = uint(_2869) > 1u;
    int _2905 = _2897 * _2833;
    int _2907 = _2905 + _2153;
    bool _2909 = !_2121;
    int _2911 = _2909 ? _2841 : (-1);
    int _2913 = _2791 + 8;
    uint _2915 = uint(int(uint(_2913) >> uint(2)));
    uint _2917 = uint(int(uint(int(_2915)) >> uint(2)));
    int _2919 = int(_2915) & 3;
    float _2921 = (*spvDescriptorSet0.vp_c9)._m0[int(_2917)][_2919];
    int _2923 = int(_2915) + 1;
    uint _2925 = uint(int(uint(_2923) >> uint(2)));
    int _2927 = _2923 & 3;
    float _2929 = (*spvDescriptorSet0.vp_c9)._m0[int(_2925)][_2927];
    int _2931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2933 = _2931 != 0;
    int _2935 = _2867 ? 0 : 1;
    bool _2937 = !_2933;
    int _2939 = _2937 ? 0 : 1;
    bool _2941 = uint(_2907) >= uint(_1871);
    bool _2943 = _2869 != 3;
    bool _2945 = !_2941;
    int _2947 = _2945 ? 0 : (-1);
    bool _2949 = !_2863;
    int _2951 = _2949 ? 0 : (-1);
    int _2953 = ~_2935;
    int _2955 = _2953 + 1;
    int _2957 = _2955 + 1;
    bool _2959 = !_2871;
    int _2961 = _2959 ? 0 : 1;
    bool _2963 = uint(_2869) >= 2u;
    bool _2965 = _2869 != 3;
    int _2967 = _2957;
    if (!_2903)
    {
        int _2969 = ~_2935;
        int _2971 = _2969 + 1;
        _2967 = _2971;
    }
    int _2973 = _2967;
    int _2975 = ~_2833;
    int _2977 = _2975 + _2947;
    int _2979 = _2977 + 1;
    int _2981 = _2963 ? 0 : 1;
    bool _2983 = !_2965;
    int _2985 = _2983 ? 0 : (-1);
    int _2987 = _1871 * _2979;
    int _2989 = _2987 + _2153;
    int _2991 = abs(_2973);
    int _2993 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2995 = _2993 != 0;
    int _2997 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2999 = _2997 != 0;
    int _3001 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _3003 = _3001 != 0;
    int _3005 = abs(_2741);
    bool _3007 = _295 > 0.5;
    int _3009 = ~_2981;
    int _3011 = _3009 + 1;
    int _3013 = _3011 + 1;
    int _3015 = _3013;
    if (_2943)
    {
        int _3017 = ~_2981;
        int _3019 = _3017 + 1;
        _3015 = _3019;
    }
    int _3021 = _3015;
    int _3023 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3025 = _3023 != 0;
    int _3027 = abs(_2845);
    int _3029 = ~_2991;
    int _3031 = _3029 + 1;
    int _3033 = _3031 + 1;
    int _3035 = ~_3005;
    int _3037 = _3035 + 1;
    int _3039 = _3037 + 1;
    int _3041 = abs(_2961);
    int _3043 = _3033 * as_type<int>(_2861);
    int _3045 = abs(_3021);
    int _3047 = _3039 * as_type<int>(_2825);
    int _3049 = ~_3027;
    int _3051 = _3049 + 1;
    int _3053 = _3051 + 1;
    int _3055 = ~_3041;
    int _3057 = _3055 + 1;
    int _3059 = _3057 + 1;
    int _3061 = abs(_2809);
    int _3063 = _3053 * as_type<int>(_2817);
    int _3065 = _3063 + _3047;
    int _3067 = ~_3061;
    int _3069 = _3067 + 1;
    int _3071 = _3069 + 1;
    float _3073 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3075 = int(_3073);
    int _3077 = ~_3045;
    int _3079 = _3077 + 1;
    int _3081 = _3079 + 1;
    int _3083 = _3059 * as_type<int>(_2853);
    int _3085 = _3083 + _3043;
    int _3087 = _3071 * as_type<int>(_2885);
    int _3089 = _3087 + _3065;
    int _3091 = _3081 * as_type<int>(_2921);
    int _3093 = _3091 + _3085;
    float _3095 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _3097 = abs(_2951);
    float _3099 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _3101 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _3103 = ~_3097;
    int _3105 = _3103 + 1;
    int _3107 = _3105 + 1;
    float _3109 = _3095 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3111 = _3099 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3113 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _3115 = _3101 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3117 = _3107 * as_type<int>(_2893);
    int _3119 = _3117 + _3089;
    int _3121 = abs(_3075);
    float _3123 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3125 = int(_3123);
    int _3127 = abs(_2901);
    out.m_80.x = _3109;
    out.m_80.y = _3111;
    out.m_80.z = _3115;
    out.m_80.w = _3113;
    float _3129 = float(uint(_3075));
    int _3131 = abs(_2985);
    bool _3133 = !_2155;
    int _3135 = _3133 ? _2989 : (-1);
    float _3137 = 1.0 / _3129;
    int _3139 = ~_3131;
    int _3141 = _3139 + 1;
    int _3143 = _3141 + 1;
    float _3145 = -_191;
    int _3147 = _3007 ? as_type<int>(_3145) : as_type<int>(_191);
    bool _3149 = _297 > 0.5;
    int _3151 = _3143 * as_type<int>(_2929);
    int _3153 = _3151 + _3093;
    float _3155 = abs(_1051);
    float _3157 = log2(_3155);
    int _3159 = abs(_2939);
    float _3161 = float(uint(_3125));
    int _3163 = ~_3127;
    int _3165 = _3163 + 1;
    int _3167 = _3165 + 1;
    bool _3169 = _299 > 0.5;
    float _3171 = 1.0 / _3161;
    int _3173 = _3119 * _3167;
    int _3175 = as_type<int>(_3137) + (-2);
    float _3177 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3179 = _2911 * _3127;
    int _3181 = _3179 + _3173;
    float _3183 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3185 = _3157 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3187 = -_1131;
    float _3189 = fma(_3187, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3183);
    float _3191 = float(uint(_3181));
    float _3193 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _3195 = ~_3159;
    int _3197 = _3195 + 1;
    int _3199 = _3197 + 1;
    float _3201 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _3203 = abs(_3125);
    float _3205 = as_type<float>(_3175) * _3191;
    float _3207 = float(uint(_3121));
    float _3209 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _3211 = _3153 * _3199;
    float _3213 = float(uint(_3203));
    float _3215 = exp2(_3185);
    float _3217 = _3193 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3219 = _3201 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3221 = _3209 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3223 = _3135 * _3159;
    int _3225 = _3223 + _3211;
    float _3227 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3229 = -_1131;
    float _3231 = fma(_3229, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3177);
    int _3233 = ~_3075;
    int _3235 = _3233 + 1;
    float _3237 = 1.0 / _3207;
    out.m_82.x = _3217;
    out.m_82.y = _3219;
    out.m_82.z = _3221;
    float _3239 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3241 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3243 = ~_3203;
    int _3245 = _3243 + 1;
    bool _3247 = !_3025;
    float _3249 = _3247 ? _191 : as_type<float>(_3147);
    float _3251 = trunc(_3205);
    float _3253 = precise::max(_3251, 0.0);
    uint _3255 = uint(_3253);
    bool _3257 = !_2995;
    float _3259 = _3257 ? _195 : as_type<float>(_2837);
    bool _3261 = _1051 <= 8000.0;
    bool _3263 = isnan(_1051);
    bool _3265 = _3261 || _3263;
    bool _3267 = isnan(8000.0);
    bool _3269 = _3265 || _3267;
    float _3271 = float(_3269);
    int _3273 = as_type<int>(_3171) + (-2);
    float _3275 = -_1131;
    float _3277 = fma(_3275, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3227);
    float _3279 = float(uint(_3225));
    float _3281 = 1.0 / _3213;
    float _3283 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3189);
    int _3285 = abs(_3181);
    float _3287 = as_type<float>(_3273) * _3279;
    int _3289 = as_type<int>(_3237) + (-2);
    float _3291 = fma(_3215, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3293 = precise::clamp(_3291, 0.0, 1.0);
    int _3295 = abs(_3225);
    int _3297 = _3235 * int(_3255);
    int _3299 = _3297 + _3181;
    float _3301 = float(uint(_3285));
    float _3303 = trunc(_3287);
    float _3305 = precise::max(_3303, 0.0);
    uint _3307 = uint(_3305);
    float _3309 = float(uint(_3295));
    float _3311 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3231);
    float _3313 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3277);
    float _3315 = as_type<float>(_3289) * _3301;
    float _3317 = float(uint(_3299));
    float _3319 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3239);
    int _3321 = as_type<int>(_3281) + (-2);
    float _3323 = trunc(_3315);
    float _3325 = precise::max(_3323, 0.0);
    uint _3327 = uint(_3325);
    int _3329 = ~_3125;
    int _3331 = _3329 + 1;
    float _3333 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3241);
    float _3335 = as_type<float>(_3321) * _3309;
    float _3337 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3339 = as_type<float>(_3175) * _3317;
    float _3341 = trunc(_3335);
    float _3343 = precise::max(_3341, 0.0);
    uint _3345 = uint(_3343);
    int _3347 = ~_3121;
    int _3349 = _3347 + 1;
    float _3351 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3337);
    float _3353 = _1226 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3355 = _3331 * int(_3307);
    int _3357 = _3355 + _3225;
    float _3359 = _1226 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3361 = _1226 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3363 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3353);
    int _3365 = _3349 * int(_3327);
    int _3367 = _3365 + _3285;
    float _3369 = float(uint(_3357));
    float _3371 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3359);
    float _3373 = trunc(_3339);
    float _3375 = precise::max(_3373, 0.0);
    uint _3377 = uint(_3375);
    float _3379 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3361);
    float _3381 = float(uint(_3367));
    float _3383 = as_type<float>(_3273) * _3369;
    float _3385 = -_191;
    int _3387 = _3169 ? as_type<int>(_3385) : as_type<int>(_191);
    int _3389 = _3245 * int(_3345);
    int _3391 = _3389 + _3295;
    float _3393 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3333);
    float _3395 = as_type<float>(_3289) * _3381;
    float _3397 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3319);
    float _3399 = trunc(_3383);
    float _3401 = precise::max(_3399, 0.0);
    uint _3403 = uint(_3401);
    float _3405 = float(uint(_3391));
    float _3407 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3351);
    bool _3409 = !_3003;
    float _3411 = _3409 ? _191 : as_type<float>(_3387);
    float _3413 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3415 = -_195;
    int _3417 = _3149 ? as_type<int>(_3415) : as_type<int>(_195);
    float _3419 = as_type<float>(_3321) * _3405;
    float _3421 = trunc(_3395);
    float _3423 = precise::max(_3421, 0.0);
    uint _3425 = uint(_3423);
    bool _3427 = !_2999;
    float _3429 = _3427 ? _195 : as_type<float>(_3417);
    float _3431 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3371);
    int _3433 = ~_3125;
    int _3435 = _3433 + 1;
    float _3437 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3439 = _3413 * _3283;
    int _3441 = int(_3255) + int(_3377);
    float _3443 = fma(_3293, -2.0, 3.0);
    float _3445 = trunc(_3419);
    float _3447 = precise::max(_3445, 0.0);
    uint _3449 = uint(_3447);
    int _3451 = int(_3307) + int(_3403);
    float _3453 = _3293 * _3293;
    int _3455 = ~_3121;
    int _3457 = _3455 + 1;
    float _3459 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3363);
    float _3461 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3379);
    int _3463 = _3435 * _3451;
    int _3465 = _3463 + _3225;
    float _3467 = fma(_3437, _3393, _3439);
    out.m_84.x = _3393;
    out.m_84.y = _3397;
    out.m_84.z = _3407;
    int _3469 = ~_3075;
    int _3471 = _3469 + 1;
    float _3473 = _3453 * _3443;
    int _3475 = ~_3203;
    int _3477 = _3475 + 1;
    int _3479 = int(_3327) + int(_3425);
    int _3481 = _3471 * _3441;
    int _3483 = _3481 + _3181;
    bool _3485 = uint(_3465) >= uint(_3125);
    int _3487 = int(_3345) + int(_3449);
    bool _3489 = !_3485;
    int _3491 = _3489 ? 0 : (-1);
    bool _3493 = uint(_3483) >= uint(_3075);
    int _3495 = _3457 * _3479;
    int _3497 = _3495 + _3285;
    int _3499 = ~_3451;
    int _3501 = _3499 + _3491;
    int _3503 = _3501 + 1;
    int _3505 = _3477 * _3487;
    int _3507 = _3505 + _3295;
    int _3509 = _3181 ^ _3075;
    float _3511 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3513 = uint(_3497) >= uint(_3121);
    int _3515 = _3125 * _3503;
    int _3517 = _3515 + _3225;
    bool _3519 = !_3493;
    int _3521 = _3519 ? 0 : (-1);
    bool _3523 = uint(_3507) >= uint(_3203);
    bool _3525 = !_3513;
    int _3527 = _3525 ? 0 : (-1);
    float _3529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _3531 = uint(int(uint(_3509) >> uint(31)));
    int _3533 = ~_3441;
    int _3535 = _3533 + _3521;
    int _3537 = _3535 + 1;
    int _3539 = ~_3527;
    int _3541 = _3479 + _3539;
    int _3543 = _3541 + 1;
    int _3545 = ~int(_3531);
    int _3547 = _3545 + 1;
    int _3549 = _3075 * _3537;
    int _3551 = _3549 + _3181;
    int _3553 = _3225 ^ _3125;
    float _3555 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3557 = _3543 ^ _3547;
    bool _3559 = _3075 == 0;
    bool _3561 = _3125 == 0;
    float _3563 = _3529 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3565 = _3125 == 0;
    int _3567 = ~_3547;
    int _3569 = _3567 + _3557;
    int _3571 = _3569 + 1;
    float _3573 = _3511 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3575 = !_3523;
    int _3577 = _3575 ? 0 : (-1);
    uint _3579 = uint(int(uint(_3553) >> uint(31)));
    float _3581 = fma(_3413, _3413, 1.0);
    bool _3583 = !_3559;
    int _3585 = _3583 ? _3551 : (-1);
    bool _3587 = _3075 == 0;
    int _3589 = ~_3577;
    int _3591 = _3487 + _3589;
    int _3593 = _3591 + 1;
    float _3595 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3597 = ~int(_3579);
    int _3599 = _3597 + 1;
    bool _3601 = !_3561;
    int _3603 = _3601 ? _3517 : (-1);
    float _3605 = float(_3585);
    int _3607 = _3593 ^ _3599;
    float _3609 = rsqrt(_3581);
    float _3611 = float(_3603);
    float _3613 = fma(_3573, _3605, _689);
    float _3615 = _3249 + 0.5;
    int _3617 = ~_3599;
    int _3619 = _3617 + _3607;
    int _3621 = _3619 + 1;
    bool _3623 = !_3587;
    int _3625 = _3623 ? _3571 : (-1);
    float _3627 = fma(_3563, _3611, _811);
    float _3629 = fma(_3573, _3615, _3613);
    float _3631 = _3411 + 0.5;
    bool _3633 = !_3565;
    int _3635 = _3633 ? _3621 : (-1);
    float _3637 = _3555 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3639 = float(_3625);
    float _3641 = fma(_3563, _3631, _3627);
    float _3643 = float(_3635);
    float _3645 = _3595 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3647 = _3429 + (-0.5);
    float _3649 = -_705;
    float _3651 = fma(_3637, _3639, _3649);
    float _3653 = _3259 + (-0.5);
    float _3655 = -_837;
    float _3657 = fma(_3645, _3643, _3655);
    float _3659 = _3413 * _3609;
    float _3661 = -_3637;
    float _3663 = fma(_3661, _3647, _3651);
    float _3665 = -_2745;
    float _3667 = fma(_3411, _3665, _3641);
    float _3669 = -_3645;
    float _3671 = fma(_3669, _3653, _3657);
    float _3673 = -_3431;
    float _3675 = _3659 * _3673;
    float _3677 = fma(_3429, _2725, _3663);
    float _3679 = -_3473;
    float _3681 = _3679 + 1.0;
    float _3683 = -_3459;
    float _3685 = _3659 * _3683;
    float _3687 = fma(_3609, _3311, _3675);
    float _3689 = _3413 * _3311;
    float _3691 = fma(_3681, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3473);
    float _3693 = -_3461;
    float _3695 = _3659 * _3693;
    float _3697 = fma(_3609, _3283, _3685);
    float _3699 = fma(_3437, _3397, _3689);
    float _3701 = _3271 * _3691;
    float _3703 = fma(_3609, _3313, _3695);
    float _3705 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2749);
    float _3707 = _3701 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    if (!_1714)
    {
        _1782 = 1.0;
    }
    float _3709 = _1782;
    float _3711 = fma(_3259, _2755, _3671);
    float _3713 = _3709;
    if (_1714)
    {
        bool _3715 = _1832 >= _1796;
        bool _3717 = isnan(_1832);
        bool _3719 = _3715 || _3717;
        bool _3721 = isnan(_1796);
        bool _3723 = _3719 || _3721;
        float _3725 = float(_3723);
        _3713 = _3725;
    }
    float _3727 = _3713;
    float _3729 = _2779 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3731 = _2761 * _3707;
    float _3733 = precise::clamp(_3731, 0.0, 1.0);
    float _3735 = -_2767;
    float _3737 = fma(_3249, _3735, _3629);
    float _3739 = _3705 + _1738;
    float _3741 = _3413 * _3313;
    float _3743 = _3727 * _2445;
    float _3745 = _3729 * _1834;
    float _3747 = -_3733;
    float _3749 = fma(_3747, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3751 = _3739 * 0.5;
    float _3753 = fma(_3437, _3407, _3741);
    float _3755 = _1845 * _3745;
    float _3757 = -_3743;
    float _3759 = fma(_3757, _3749, 1.0);
    float _3761 = precise::clamp(_3759, 0.0, 1.0);
    float _3763 = _2693 * _3745;
    float _3765 = -_3729;
    float _3767 = _3765 + 1.0;
    out.m_86.z = _3751;
    out.m_86.w = _1738;
    float _3769 = _3459 + _3467;
    float _3771 = _3431 + _3699;
    float _3773 = _3461 + _3753;
    float _3775 = fma(_2689, _3755, _1839);
    float _3777 = fma(_2691, _3755, _1841);
    float _3779 = _1845 * _3767;
    float _3781 = fma(_1845, _3763, _1843);
    out.m_88.x = _3697;
    out.m_88.y = _3687;
    out.m_88.z = _3703;
    bool _3783 = _2469 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3785 = isnan(_2469);
    bool _3787 = _3783 || _3785;
    bool _3789 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3791 = _3787 || _3789;
    float _3793 = _3761 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_90.x = _3737;
    out.m_90.y = _3677;
    out.m_90.z = _3667;
    out.m_90.w = _3711;
    out.gl_Position.x = _1774;
    out.gl_Position.y = _1776;
    out.gl_Position.z = _3705;
    out.gl_Position.w = _1738;
    out.m_92.x = _3793;
    float _3795 = _3739;
    float _3797 = _3767;
    float _3799 = _3751;
    float _3801 = _3749;
    float _3803 = _3761;
    float _3805 = _3755;
    if (!_3791)
    {
        _3795 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3807 = _3795;
    out.m_94.x = _3775;
    out.m_94.y = _3777;
    out.m_94.z = _3781;
    out.m_94.w = _3779;
    float _3809 = _3807;
    float _3811 = _3807;
    if (!_3791)
    {
        _3797 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3813 = _3797;
    float _3815 = _3813;
    float _3817 = _3813;
    if (!_3791)
    {
        _3799 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3819 = _3799;
    out.m_96.x = _3769;
    out.m_96.y = _3771;
    out.m_96.z = _3773;
    float _3821 = _3819;
    float _3823 = _3819;
    if (!_3791)
    {
        _3801 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3825 = _3801;
    float _3827 = _3825;
    float _3829 = _3825;
    if (!_3791)
    {
        _3803 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3831 = _3803;
    float _3833 = _3831;
    float _3835 = _3831;
    if (!_3791)
    {
        _3805 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3837 = _3805;
    bool _3839 = !_3791;
    float _3841 = _3837;
    float _3843 = _3837;
    if (!_3839)
    {
        bool _3845 = _2469 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3847 = isnan(_2469);
        bool _3849 = _3845 || _3847;
        bool _3851 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3853 = _3849 || _3851;
        if (!_3853)
        {
            float _3855 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3857 = _2469 + _3855;
            float _3859 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3861 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3859;
            float _3863 = 1.0 / _3861;
            float _3865 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3867 = _3865 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3869 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3871 = _3869 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3873 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3875 = _3873 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3877 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3879 = _3877 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3881 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3883 = _3881 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3885 = _3857 * _3863;
            float _3887 = precise::clamp(_3885, 0.0, 1.0);
            float _3889 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3891 = _3889 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3893 = fma(_3887, _3867, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3895 = fma(_3887, _3891, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3897 = fma(_3887, _3871, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3899 = fma(_3887, _3875, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3901 = fma(_3887, _3879, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3903 = fma(_3887, _3883, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3817 = _3893;
            _3835 = _3901;
            _3811 = _3895;
            _3829 = _3899;
            _3823 = _3897;
            _3843 = _3903;
            _3905 = true;
        }
        else
        {
            bool _3907 = _2469 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3909 = isnan(_2469);
            bool _3911 = _3907 || _3909;
            bool _3913 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3915 = _3911 || _3913;
            if (!_3915)
            {
                _3809 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3917 = _3809;
            _3811 = _3917;
            if (!_3915)
            {
                _3815 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3919 = _3815;
            _3817 = _3919;
            if (!_3915)
            {
                _3821 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3921 = _3821;
            _3823 = _3921;
            if (!_3915)
            {
                _3827 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3923 = _3827;
            _3829 = _3923;
            if (!_3915)
            {
                _3833 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3925 = _3833;
            _3835 = _3925;
            if (!_3915)
            {
                _3841 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3927 = _3841;
            bool _3929 = !_3915;
            _3843 = _3927;
            if (!_3929)
            {
                bool _3931 = _2469 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3933 = isnan(_2469);
                bool _3935 = _3931 || _3933;
                bool _3937 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3939 = _3935 || _3937;
                if (!_3939)
                {
                    float _3941 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3943 = _2469 + _3941;
                    float _3945 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3947 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3945;
                    float _3949 = 1.0 / _3947;
                    float _3951 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3953 = _3951 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3955 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3957 = _3955 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3959 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3961 = _3959 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3963 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3965 = _3963 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3967 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3969 = _3967 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3971 = _3943 * _3949;
                    float _3973 = precise::clamp(_3971, 0.0, 1.0);
                    float _3975 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3977 = _3975 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3979 = fma(_3973, _3953, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3981 = fma(_3973, _3977, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3983 = fma(_3973, _3957, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3985 = fma(_3973, _3961, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3987 = fma(_3973, _3965, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3989 = fma(_3973, _3969, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3817 = _3979;
                    _3835 = _3987;
                    _3811 = _3981;
                    _3829 = _3985;
                    _3823 = _3983;
                    _3843 = _3989;
                    _3905 = true;
                }
                else
                {
                    _3817 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3835 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3811 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3829 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3823 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3843 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3905 = false;
    float _3991 = _3817;
    float _3993 = _3835;
    float _3995 = _3811;
    float _3997 = _3829;
    float _3999 = _3823;
    float _4001 = _3843;
    float _4003 = fma(_3771, -0.5, 0.5);
    float _4005 = precise::clamp(_4003, 0.0, 1.0);
    float _4007 = -_3991;
    float _4009 = _4007 + _3993;
    float _4011 = -_3995;
    float _4013 = _4011 + _3997;
    float _4015 = -_3999;
    float _4017 = _4015 + _4001;
    bool _4019 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4021 = fma(_4005, _4009, _3991);
    float _4023 = fma(_4005, _4013, _3995);
    float _4025 = fma(_4005, _4017, _3999);
    float _4027 = _4021 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _4029 = fma(_4023, 0.298911988735198974609375, _4027);
    float _4031 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4033 = fma(_4025, 0.114477999508380889892578125, _4029);
    out.m_92.w = _4031;
    float _4035 = -_4033;
    float _4037 = _4023 + _4035;
    float _4039 = -_4033;
    float _4041 = _4021 + _4039;
    float _4043 = -_4033;
    float _4045 = _4025 + _4043;
    out.m_98.x = 0.0;
    float _4047 = fma(_4037, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4033);
    float _4049 = fma(_4041, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4033);
    float _4051 = fma(_4045, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4033);
    out.m_100.x = _4047;
    out.m_100.y = _4049;
    out.m_100.z = _4051;
    if (!_4019)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4053 = -_1626;
    float _4055 = _4053 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4057 = -_1628;
    float _4059 = _4057 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4061 = -_1630;
    float _4063 = _4061 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4065 = _4055 * _4055;
    float _4067 = fma(_4059, _4059, _4065);
    float _4069 = fma(_4063, _4063, _4067);
    float _4071 = sqrt(_4069);
    float _4073 = rsqrt(_4069);
    float _4075 = -_4071;
    float _4077 = _4075 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4079 = _4077 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4081 = precise::clamp(_4079, 0.0, 1.0);
    float _4083 = _4059 * _4073;
    float _4085 = _4055 * _4073;
    float _4087 = abs(_4081);
    float _4089 = log2(_4087);
    float _4091 = _4063 * _4073;
    float _4093 = _4083 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4095 = _3771 * _4085;
    float _4097 = -_4085;
    float _4099 = -_4093;
    float _4101 = fma(_4097, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4099);
    float _4103 = fma(_3769, _4083, _4095);
    float _4105 = -_4091;
    float _4107 = fma(_4105, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4101);
    float _4109 = fma(_3773, _4091, _4103);
    float _4111 = precise::clamp(_4109, 0.0, 1.0);
    float _4113 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4115 = _4107 + _4113;
    float _4117 = _4089 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4119 = _4115 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4121 = precise::clamp(_4119, 0.0, 1.0);
    float _4123 = exp2(_4117);
    float _4125 = _4123 * _4121;
    float _4127 = _4111 * _4125;
    float _4129 = _4127 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4131 = _4127 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4133 = _4127 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_98.x = _4129;
    out.m_98.y = _4131;
    out.m_98.z = _4133;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3905 = false;
    bool _217 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _114 = in.m_56.w;
    float _116 = trunc(_114);
    int _119 = int(_116);
    bool _123 = _119 >= 1;
    float _125 = 0.0;
    float _127 = as_type<float>(_119);
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _125;
    float _131 = _129;
    if (!_123)
    {
        out.m_59.x = 0.0;
    }
    int _133 = 0;
    if (!_123)
    {
        float _135 = _129 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    int _139 = _137;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4192 = as_type<float>(_137);
        out.gl_Position.z = _4192;
    }
    if (!_123)
    {
        return out;
    }
    float _141 = in.m_61.w;
    bool _143 = _141 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_141);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = -_141;
    float _155 = _153 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _157 = _155;
    if (_151)
    {
        float _159 = float(_119);
        _131 = _159;
    }
    float _161 = _131;
    bool _163 = _155 >= _161;
    bool _165 = !_151;
    bool _167 = _163 || _165;
    float _169 = _161;
    if (_167)
    {
        _169 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _169;
    if (_167)
    {
        out.m_59.x = 0.0;
    }
    if (_167)
    {
        float _173 = _171 * 5.0;
        _139 = as_type<int>(_173);
    }
    int _175 = _139;
    if (_167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4262 = as_type<float>(_175);
        out.gl_Position.z = _4262;
    }
    if (_167)
    {
        return out;
    }
    float _177 = as_type<float>(int(gl_VertexIndex));
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _181 = as_type<int>(_177) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_177) & 2;
    bool _187 = _185 != 0;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_187;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_179;
    float _215;
    if (!_197)
    {
        float _199 = in.m_66.x;
        float _201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _203 = _199 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _205 = fma(_203, (*spvDescriptorSet0.vp_c9)._m0[12].x, _155);
        float _207 = _205 * _201;
        float _209 = floor(_207);
        float _211 = -_209;
        float _213 = _207 + _211;
        _215 = _213;
        _217 = true;
    }
    else
    {
        float _219 = float(_119);
        float _221 = 1.0 / _219;
        float _223 = _155 * _221;
        _215 = _223;
    }
    _217 = false;
    float _225 = _215;
    float _227 = in.m_56.x;
    float _229 = in.m_56.y;
    float _231 = in.m_56.z;
    float _233 = in.m_68.x;
    float _235 = in.m_68.y;
    float _237 = in.m_68.z;
    float _239 = in.m_68.w;
    float _241 = in.m_70.x;
    float _243 = in.m_70.y;
    float _245 = in.m_70.z;
    float _247 = in.m_70.w;
    float _249 = _229 * _235;
    float _251 = fma(_227, _233, _249);
    float _253 = _229 * _243;
    float _255 = fma(_231, _237, _251);
    float _257 = fma(_227, _241, _253);
    float _259 = _255 + _239;
    float _261 = fma(_231, _245, _257);
    float _263 = fma(_259, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _265 = _261 + _247;
    float _267 = floor(_263);
    float _269 = fma(_265, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _271 = floor(_269);
    float _273 = -_267;
    float _275 = _263 + _273;
    float _277 = -_271;
    float _279 = _269 + _277;
    float2 _4417 = float2(_275, _279);
    float _281 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4417, float2(0.0), isnan(_4417)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4417, float2(0.0), isnan(_4417)), level(0.0)).x;
    float _283 = in.m_72.x;
    float _285 = in.m_72.y;
    float _287 = in.m_72.z;
    float _289 = in.m_72.w;
    float _291 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _293 = log2(_291);
    float _295 = in.m_66.x;
    float _297 = in.m_66.y;
    float _299 = in.m_66.z;
    float _301 = in.m_66.w;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _303;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _309 = _307 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _317 = _315 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _319 = 1.0 / _305;
    int _321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _323 = _321 != 0;
    float _325 = 1.0 / _313;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _331 = _229 * _285;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _337 = 1.0 / _317;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _339;
    float _343 = fma(_227, _283, _331);
    float _345 = _295 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _349 = _225 + _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _353 = _225 + _351;
    float _355 = fma(_231, _287, _343);
    float _357 = _295 * 2.0;
    float _359 = 1.0 / _341;
    float _361 = -_327;
    float _363 = fma(_345, 2.0, _361);
    float _365 = _349 * _319;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _369 = _225 + _367;
    float _371 = _299 * 2.0;
    float _373 = _353 * _325;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _377 = _225 + _375;
    float _379 = _297 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _381 = 1.0 / _309;
    float _383 = _369 * _337;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _387 = _225 + _385;
    float _389 = fma(_379, -2.0, _329);
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _391;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _397 = _395 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _399 = floor(_357);
    float _401 = _387 * _359;
    float _403 = _299 + _295;
    float _405 = fma(_397, _383, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _407 = _403 + (-1.0);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _411 = _225 + _409;
    float _413 = floor(_371);
    float _415 = _377 * _381;
    float _417 = _295 + _297;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _419;
    float _423 = fma(_393, _373, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _429 = _417 + (-1.0);
    float _431 = 1.0 / _335;
    bool _433 = _399 > 0.0;
    float _435 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _437 = _399 >= 0.0;
    bool _439 = isnan(_399);
    bool _441 = _437 || _439;
    bool _443 = isnan(0.0);
    bool _445 = _441 || _443;
    float _447 = _299 + _297;
    int _449 = as_type<int>(_407);
    float _451 = _355;
    if (_323)
    {
        _449 = 0;
    }
    int _453 = _449;
    float _455 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _457 = _453;
    if (!_323)
    {
        _457 = 1;
    }
    int _459 = _457;
    float _461 = _447 + (-1.0);
    float _463 = _297 * 2.0;
    float _465 = fma(_421, _365, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _467 = _413 > 0.0;
    float _469 = fma(_427, _415, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    bool _471 = _413 >= 0.0;
    bool _473 = isnan(_413);
    bool _475 = _471 || _473;
    bool _477 = isnan(0.0);
    bool _479 = _475 || _477;
    float _481 = floor(_463);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _483;
    int _487 = _445 ? 0 : 1;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _491 = _489 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _493 = _459 != 1;
    float _495 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _497 = ~_487;
    int _499 = _497 + 1;
    int _501 = _499 + 1;
    float _503 = fma(_491, _383, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _505 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _507 = int(_505);
    int _509 = _501;
    if (!_433)
    {
        int _511 = ~_487;
        int _513 = _511 + 1;
        _509 = _513;
    }
    int _515 = _509;
    float _517 = fma(_485, _373, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _519 = _479 ? 0 : 1;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _521;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _525;
    bool _529 = _481 > 0.0;
    float _531 = _411 * _431;
    bool _533 = _481 >= 0.0;
    bool _535 = isnan(_481);
    bool _537 = _533 || _535;
    bool _539 = isnan(0.0);
    bool _541 = _537 || _539;
    float _543 = _355 + _289;
    float _545 = fma(_523, _365, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    int _547 = ~_519;
    int _549 = _547 + 1;
    int _551 = _549 + 1;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    int _557 = _551;
    if (!_467)
    {
        int _559 = ~_519;
        int _561 = _559 + 1;
        _557 = _561;
    }
    int _563 = _557;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _569 = _567 != 0;
    int _571 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _573 = _571 != 0;
    int _575 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _577 = _575 != 0;
    float _579 = fma(_527, _401, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    if (!_493)
    {
        _451 = _297;
    }
    float _581 = _451;
    float _583 = fma(_555, _415, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _585 = _581;
    if (_493)
    {
        _585 = _295;
    }
    float _587 = _585;
    float _589 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _591 = int(_589);
    float _593 = _543 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _595 = !_573;
    int _597 = _595 ? 0 : 1;
    float _599 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[83].z, _565);
    bool _601 = !_569;
    int _603 = _601 ? 0 : 1;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _605;
    bool _609 = !_577;
    int _611 = _609 ? 0 : 1;
    float _613 = _543 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _615 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _617 = _615 != 0;
    int _619 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _621 = _619 != 0;
    int _623 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _625 = _623 != 0;
    float _627 = fma(_607, _401, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _629 = float(_119);
    float _631 = fma(_259, (*spvDescriptorSet0.vp_c8)._m0[11].x, _593);
    if (!_493)
    {
        _127 = _299;
    }
    float _633 = _127;
    float _635 = fma(_259, (*spvDescriptorSet0.vp_c8)._m0[10].x, _613);
    float _637 = _541 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _639 = fma(_265, (*spvDescriptorSet0.vp_c8)._m0[11].z, _631);
    float _641 = _633;
    float _643 = _637;
    if (_493)
    {
        _641 = _297;
    }
    float _645 = _641;
    float _647 = 1.0 / _629;
    bool _649 = !_621;
    int _651 = _649 ? 0 : 1;
    float _653 = fma(_265, (*spvDescriptorSet0.vp_c8)._m0[10].z, _635);
    float _655 = _645 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _657 = float(_507);
    float _659 = _639 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _661 = ~as_type<int>(_637);
    int _663 = _661 + 1;
    int _665 = _663 + 1;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _669 = !_617;
    int _671 = _669 ? 0 : 1;
    float _673 = 1.0 / _657;
    int _675 = _665;
    if (!_529)
    {
        int _677 = ~as_type<int>(_637);
        int _679 = _677 + 1;
        _675 = _679;
    }
    int _681 = _675;
    float _683 = _653 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _685 = abs(_651);
    float _687 = -_155;
    float _689 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[76].x, _363);
    if (!_493)
    {
        _643 = _299;
    }
    float _691 = _643;
    float _693 = _683 + _659;
    float _695 = float(_563);
    float _697 = 1.0 / _659;
    float _699 = _691;
    if (_493)
    {
        _699 = _297;
    }
    float _701 = _699;
    float _703 = _647 * _155;
    float _705 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[76].y, _389);
    int _707 = abs(_671);
    float _709 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[83].w, _667);
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _713 = float(_515);
    float _715 = _293 * _155;
    float _717 = _701;
    if (!_493)
    {
        _717 = _297;
    }
    float _719 = _717;
    float _721 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[78].z, _711);
    float _723 = float(_685);
    float _725 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[82].z, _599);
    float _727 = exp2(_715);
    float _729 = _719;
    if (_493)
    {
        _729 = _295;
    }
    float _731 = _729;
    float _733 = _723 * _713;
    float _735 = float(_707);
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _739 = _731 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _741 = _735 * _695;
    float _743 = -_737;
    float _745 = fma(_739, 2.0, _743);
    float _747 = float(_591);
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _751 = in.m_74.x;
    float _753 = in.m_74.y;
    float _755 = in.m_74.z;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _759 = 1.0 + _757;
    float _761 = 1.0 / _747;
    bool _763 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _765 = isnan(1.0);
    bool _767 = _763 || _765;
    bool _769 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _771 = _767 || _769;
    float _773 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _775 = -_727;
    float _777 = _775 + 1.0;
    bool _779 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _781 = isnan(0.0);
    bool _783 = _779 || _781;
    bool _785 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _787 = _783 || _785;
    float _789 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[82].w, _709);
    float _791 = fma(_655, -2.0, _773);
    bool _793 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _795 = isnan(_225);
    bool _797 = _793 || _795;
    bool _799 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _801 = _797 || _799;
    float _803 = float(_801);
    float _805 = 1.0 / _759;
    float _807 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[78].w, _749);
    float _809 = -_155;
    float _811 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[81].x, _745);
    float _813 = _741 * (-2.0);
    bool _815 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _817 = isnan(_225);
    bool _819 = _815 || _817;
    bool _821 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _823 = _819 || _821;
    float _825 = float(_823);
    float _827 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[77].z, _721);
    float _829 = _673 * _155;
    float _831 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[77].w, _807);
    float _833 = _761 * _155;
    float _835 = _787 ? _777 : 0.0;
    float _837 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[81].y, _791);
    float _839 = fma(_455, _813, _455);
    float _841 = -_803;
    float _843 = _841 + 1.0;
    bool _845 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _847 = isnan(_225);
    bool _849 = _845 || _847;
    bool _851 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _853 = _849 || _851;
    float _855 = float(_853);
    float _857 = _693 * _697;
    float _859 = _857 * 0.5;
    bool _861 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _863 = isnan(_225);
    bool _865 = _861 || _863;
    bool _867 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _869 = _865 || _867;
    float _871 = float(_869);
    if (_771)
    {
        float _873 = _835 * _805;
        _157 = _873;
    }
    float _875 = _157;
    float _877 = -_825;
    float _879 = _877 + 1.0;
    float _881 = _825 * _843;
    float _883 = fma(_813, _751, _751);
    float _885 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _887 = _855 * _879;
    float _889 = -_855;
    float _891 = _889 + 1.0;
    float _893 = -_871;
    float _895 = _893 + 1.0;
    bool _897 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _899 = isnan(_225);
    bool _901 = _897 || _899;
    bool _903 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _905 = _901 || _903;
    float _907 = float(_905);
    float _909 = _543 + _885;
    float _911 = _871 * _891;
    bool _913 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _915 = isnan(_225);
    bool _917 = _913 || _915;
    bool _919 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _921 = _917 || _919;
    float _923 = float(_921);
    float _925 = _295 + (-0.5);
    bool _927 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _929 = isnan(_225);
    bool _931 = _927 || _929;
    bool _933 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _935 = _931 || _933;
    float _937 = float(_935);
    float _939 = _907 * _895;
    bool _941 = !_625;
    int _943 = _941 ? 0 : 1;
    float _945 = -_923;
    float _947 = _945 + 1.0;
    float _949 = -_907;
    float _951 = _949 + 1.0;
    int _953 = abs(_943);
    float _955 = _937 * _947;
    float _957 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[196].x, _883);
    float _959 = _923 * _951;
    float _961 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _963 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[30].w, _961);
    float _965 = _423 * _955;
    float _967 = float(_681);
    float _969 = _733 * (-2.0);
    float _971 = float(_953);
    float _973 = -_937;
    float _975 = _973 + 1.0;
    float _977 = _517 * _955;
    float _979 = fma(_495, _969, _495);
    float _981 = fma(_969, _753, _753);
    float _983 = _971 * _967;
    float _985 = _297 + (-0.5);
    float _987 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[143].x, _965);
    float _989 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[143].y, _977);
    float _991 = _983 * (-2.0);
    float _993 = fma(_839, _875, _957);
    float _995 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[196].y, _981);
    float _997 = fma(_405, _959, _987);
    float _999 = fma(_503, _959, _989);
    float _1001 = fma(_435, _991, _435);
    float _1003 = 1.0 / _963;
    float _1005 = in.m_76.x;
    float _1007 = in.m_76.y;
    float _1009 = fma(_991, _755, _755);
    float _1011 = _299 + (-0.5);
    float _1013 = fma(_545, _939, _999);
    float _1015 = fma(_465, _939, _997);
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _1019 = _1017 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _1021 = fma(_1011, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1009);
    float _1023 = fma(_583, _911, _1013);
    float _1025 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _1027 = _1025 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _1029 = fma(_469, _911, _1015);
    float _1031 = fma(_1019, _531, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _1033 = fma(_579, _887, _1023);
    float _1035 = fma(_1027, _531, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _1037 = fma(_627, _887, _1029);
    float _1039 = fma(_1001, _875, _1021);
    float _1041 = fma(_979, _875, _995);
    float _1043 = fma(_1031, _881, _1033);
    float _1045 = fma(_1035, _881, _1037);
    float _1047 = _1039 * 0.15915493667125701904296875;
    float _1049 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1051 = _1003 * _1049;
    float _1053 = _993 * 0.15915493667125701904296875;
    float _1055 = _1041 * 0.15915493667125701904296875;
    float _1057 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[149].y, _1043);
    float _1059 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[149].x, _1045);
    float _1061 = _909 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1063 = _909 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1065 = _1047 * 6.283185482025146484375;
    float _1067 = cos(_1065);
    bool _1069 = _1051 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1071 = _1059 * _1005;
    bool _1073 = _1051 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1075 = fma(_259, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1061);
    float _1077 = fma(_259, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1063);
    float _1079 = _1057 * _1007;
    float _1081 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _1083 = _1053 * 6.283185482025146484375;
    float _1085 = sin(_1083);
    float _1087 = _1071 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1089 = fma(_265, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1075);
    float _1091 = fma(_265, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1077);
    float _1093 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _1095 = _1079 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1097 = _1087 * _1081;
    float _1099 = _1089 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1101 = _1053 * 6.283185482025146484375;
    float _1103 = cos(_1101);
    float _1105 = _1091 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _1107 = !_1069;
    int _1109 = _1107 ? 0 : 1;
    float _1111 = _1095 * _1093;
    float _1113 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1115 = 2;
    if (!_1069)
    {
        _1115 = 1;
    }
    int _1117 = _1115;
    float _1119 = _1055 * 6.283185482025146484375;
    float _1121 = cos(_1119);
    int _1123 = _1117;
    if (!_1073)
    {
        _1123 = _1109;
    }
    int _1125 = _1123;
    int _1127 = _1125 << 6;
    float _1129 = _1047 * 6.283185482025146484375;
    float _1131 = sin(_1129);
    int _1133 = _1127 + 72;
    uint _1136 = uint(int(uint(_1133) >> uint(2)));
    uint _1138 = uint(int(uint(int(_1136)) >> uint(2)));
    int _1140 = int(_1136) & 3;
    float _1142 = (*spvDescriptorSet0.vp_c15)._m0[int(_1138)][_1140];
    int _1144 = int(_1136) + 1;
    uint _1146 = uint(int(uint(_1144) >> uint(2)));
    int _1148 = _1144 & 3;
    float _1150 = (*spvDescriptorSet0.vp_c15)._m0[int(_1146)][_1148];
    float _1152 = _1055 * 6.283185482025146484375;
    float _1154 = sin(_1152);
    float _1156 = _1085 * _1121;
    float _1158 = _1103 * _1121;
    float _1160 = _1121 * _1067;
    float _1162 = trunc(_1099);
    int _1164 = int(_1162);
    float _1166 = -_1111;
    float _1168 = _1131 * _1166;
    int _1170 = _1127 + 56;
    uint _1172 = uint(int(uint(_1170) >> uint(2)));
    uint _1174 = uint(int(uint(int(_1172)) >> uint(2)));
    int _1176 = int(_1172) & 3;
    float _1178 = (*spvDescriptorSet0.vp_c15)._m0[int(_1174)][_1176];
    int _1180 = int(_1172) + 1;
    uint _1182 = uint(int(uint(_1180) >> uint(2)));
    int _1184 = _1180 & 3;
    float _1186 = (*spvDescriptorSet0.vp_c15)._m0[int(_1182)][_1184];
    float _1188 = fma(_1160, _1097, _1168);
    float _1190 = trunc(_1105);
    int _1192 = int(_1190);
    float _1194 = _1103 * _1154;
    float _1196 = _1085 * _1154;
    float _1198 = _1103 * _1067;
    float _1200 = _1085 * _1067;
    int _1202 = _1127 + 96;
    uint _1204 = uint(int(uint(_1202) >> uint(2)));
    uint _1206 = uint(int(uint(int(_1204)) >> uint(2)));
    int _1208 = int(_1204) & 3;
    float _1210 = (*spvDescriptorSet0.vp_c15)._m0[int(_1206)][_1208];
    int _1212 = int(_1204) + 1;
    uint _1214 = uint(int(uint(_1212) >> uint(2)));
    int _1216 = _1212 & 3;
    float _1218 = (*spvDescriptorSet0.vp_c15)._m0[int(_1214)][_1216];
    float _1220 = -_1194;
    float _1222 = fma(_1131, _1156, _1220);
    float _1224 = -_1156;
    float _1226 = fma(_1131, _1194, _1224);
    float _1228 = fma(_1131, _1158, _1196);
    float _1230 = _1198 * _1111;
    float _1232 = _1200 * _1111;
    int _1234 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1236 = _1164 + _1234;
    int _1238 = _1236 + 1;
    float _1240 = _1154 * _1067;
    float _1242 = fma(_1228, _1097, _1230);
    float _1244 = fma(_1222, _1097, _1232);
    bool _1246 = _1238 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1248 = _1127 + 104;
    uint _1250 = uint(int(uint(_1248) >> uint(2)));
    uint _1252 = uint(int(uint(int(_1250)) >> uint(2)));
    int _1254 = int(_1250) & 3;
    float _1256 = (*spvDescriptorSet0.vp_c15)._m0[int(_1252)][_1254];
    int _1258 = int(_1250) + 1;
    uint _1260 = uint(int(uint(_1258) >> uint(2)));
    int _1262 = _1258 & 3;
    float _1264 = (*spvDescriptorSet0.vp_c15)._m0[int(_1260)][_1262];
    int _1266 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1268 = _1192 + _1266;
    int _1270 = _1268 + 1;
    float _1272 = fma(_1226, _1113, _1242);
    float _1274 = fma(_1131, _1196, _1158);
    float _1276 = fma(_1240, _1113, _1188);
    int _1278 = _1238 | _1270;
    float _1280 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1282 = fma(_1274, _1113, _1244);
    int _1284 = _1127 + 48;
    uint _1286 = uint(int(uint(_1284) >> uint(2)));
    uint _1288 = uint(int(uint(int(_1286)) >> uint(2)));
    int _1290 = int(_1286) & 3;
    float _1292 = (*spvDescriptorSet0.vp_c15)._m0[int(_1288)][_1290];
    int _1294 = int(_1286) + 1;
    uint _1296 = uint(int(uint(_1294) >> uint(2)));
    int _1298 = _1294 & 3;
    float _1300 = (*spvDescriptorSet0.vp_c15)._m0[int(_1296)][_1298];
    bool _1302 = _1278 < 0;
    bool _1304 = _1302 || _1246;
    float _1306 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1308 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1280);
    float _1310 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1312 = _1270 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1314 = _1312 || _1304;
    float _1316 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1306);
    float _1318 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1308);
    int _1320 = _1127 + 64;
    uint _1322 = uint(int(uint(_1320) >> uint(2)));
    uint _1324 = uint(int(uint(int(_1322)) >> uint(2)));
    int _1326 = int(_1322) & 3;
    float _1328 = (*spvDescriptorSet0.vp_c15)._m0[int(_1324)][_1326];
    int _1330 = int(_1322) + 1;
    uint _1332 = uint(int(uint(_1330) >> uint(2)));
    int _1334 = _1330 & 3;
    float _1336 = (*spvDescriptorSet0.vp_c15)._m0[int(_1332)][_1334];
    float _1338 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1310);
    float _1340 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1316);
    float _1342 = _1318 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1344 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1338);
    float _1346 = _1340 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1348 = _265 + _1342;
    int _1350 = _1127 + 80;
    uint _1352 = uint(int(uint(_1350) >> uint(2)));
    uint _1354 = uint(int(uint(int(_1352)) >> uint(2)));
    int _1356 = int(_1352) & 3;
    float _1358 = (*spvDescriptorSet0.vp_c15)._m0[int(_1354)][_1356];
    int _1360 = int(_1352) + 1;
    uint _1362 = uint(int(uint(_1360) >> uint(2)));
    int _1364 = _1360 & 3;
    float _1366 = (*spvDescriptorSet0.vp_c15)._m0[int(_1362)][_1364];
    float _1368 = _1344 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1370 = _1238;
    float _1372 = _1348;
    if (!_1314)
    {
        int _1374 = _1270 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1376 = _1374 + _1238;
        _1370 = _1376;
    }
    int _1378 = _1370;
    float _1380 = _259 + _1346;
    float _1382 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1384 = _1348 + _1382;
    float _1386 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1388 = _1380 + _1386;
    float _1390 = _1384 * _1384;
    int _1392 = 0;
    int _1394 = as_type<int>(_1390);
    float _1396 = _1380;
    float _1398 = as_type<float>(_1378);
    if (!_1314)
    {
        int _1400 = _1378 << 2;
        _1392 = _1400;
    }
    int _1402 = _1392;
    float _1404 = fma(_1388, _1388, _1390);
    int _1406 = _1402;
    if (!_1314)
    {
        uint _1408 = uint(int(uint(_1378) >> uint(2)));
        _1394 = int(_1408);
    }
    int _1410 = _1394;
    int _1412 = _1410;
    if (!_1314)
    {
        int _1414 = 12 & _1402;
        _1406 = _1414;
    }
    int _1416 = _1406;
    float _1418 = sqrt(_1404);
    if (!_1314)
    {
        int _1420 = _1410 << 4;
        int _1422 = _1420 + _1416;
        _1412 = _1422;
    }
    int _1424 = _1412;
    float _1426 = _909 * _1218;
    float _1428 = fma(_259, _1210, _1426);
    float _1430 = fma(_265, _1256, _1428);
    float _1432 = _1430 + _1264;
    float _1434 = _909 * _1300;
    bool _1436 = _1418 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1438 = _543 + _1368;
    float _1440 = fma(_259, _1292, _1434);
    float _1442 = 1.0 / _1432;
    int _1444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1446 = _1444 != 0;
    int _1448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1450 = _1448 != 0;
    int _1452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1454 = _1452 != 0;
    int _1456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1458 = _1456 != 0;
    float _1460 = _909 * _1336;
    float _1462 = fma(_265, _1178, _1440);
    float _1464 = fma(_259, _1328, _1460);
    bool _1466 = !_1450;
    int _1468 = _1466 ? 0 : 1;
    float _1470 = _1292;
    float _1472 = _1464;
    float _1474 = _1328;
    float _1476 = _1418;
    if (!_1314)
    {
        float _1478 = floor(_1099);
        _1470 = _1478;
    }
    float _1480 = _1470;
    float _1482 = _1462 + _1186;
    float _1484 = fma(_265, _1142, _1464);
    bool _1486 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1488 = isnan(0.5);
    bool _1490 = _1486 || _1488;
    bool _1492 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1494 = _1490 || _1492;
    bool _1496 = !_1446;
    int _1498 = _1496 ? 0 : 1;
    float _1500 = _1484 + _1150;
    bool _1502 = !_1454;
    int _1504 = _1502 ? 0 : 1;
    bool _1506 = !_1458;
    int _1508 = _1506 ? 0 : 1;
    if (!_1436)
    {
        _1472 = _1438;
    }
    float _1510 = _1472;
    bool _1512 = !_1436;
    float _1514 = _1510;
    if (!_1512)
    {
        float _1516 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1518 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1520 = _1418 + _1518;
        float _1522 = _1438 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1524 = rsqrt(_1404);
        float _1526 = _1520 * _1516;
        float _1528 = _1526 * 0.15915493667125701904296875;
        float _1530 = _1528 * 6.283185482025146484375;
        float _1532 = cos(_1530);
        float _1534 = _1528 * 6.283185482025146484375;
        float _1536 = sin(_1534);
        float _1538 = _1532 + (-1.0);
        float _1540 = _1538 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1542 = fma(_1536, _1522, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1544 = fma(_1438, _1532, _1540);
        float _1546 = _1524 * _1542;
        float _1548 = fma(_1388, _1546, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1550 = fma(_1384, _1546, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1396 = _1548;
        _1372 = _1550;
        _1514 = _1544;
        _1474 = _1540;
        _1476 = _1528;
    }
    float _1552 = _1396;
    float _1554 = _1372;
    float _1556 = _1514;
    float _1558 = _1474;
    float _1560 = _1476;
    float _1562 = _1558;
    float _1564 = _1560;
    float _1566 = _1556;
    if (_1494)
    {
        _1562 = _1552;
    }
    float _1568 = _1562;
    float _1570 = _1568;
    if (_1494)
    {
        _1564 = _1554;
    }
    float _1572 = _1564;
    float _1574 = _1572;
    if (!_1494)
    {
        float _1576 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1578 = _543 + _1576;
        float _1580 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1582 = _259 + _1580;
        float _1584 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1586 = -_265;
        float _1588 = _1586 + _1554;
        float _1590 = _1578 * _1578;
        float _1592 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1594 = _265 + _1592;
        float _1596 = fma(_1582, _1582, _1590);
        float _1598 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1600 = fma(_1594, _1594, _1596);
        float _1602 = sqrt(_1600);
        float _1604 = _1584 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1606 = precise::min(_1602, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1608 = _1606 * _1598;
        float _1610 = -_543;
        float _1612 = _1610 + _1556;
        float _1614 = _1604 * _1608;
        float _1616 = -_259;
        float _1618 = _1616 + _1552;
        float _1620 = fma(_1612, _1614, _543);
        float _1622 = fma(_1618, _1614, _259);
        float _1624 = fma(_1588, _1614, _265);
        _1566 = _1620;
        _1570 = _1622;
        _1574 = _1624;
    }
    float _1626 = _1566;
    float _1628 = _1570;
    float _1630 = _1574;
    int _1632 = _1127 + 88;
    uint _1634 = uint(int(uint(_1632) >> uint(2)));
    uint _1636 = uint(int(uint(int(_1634)) >> uint(2)));
    int _1638 = int(_1634) & 3;
    float _1640 = (*spvDescriptorSet0.vp_c15)._m0[int(_1636)][_1638];
    int _1642 = int(_1634) + 1;
    uint _1644 = uint(int(uint(_1642) >> uint(2)));
    int _1646 = _1642 & 3;
    float _1648 = (*spvDescriptorSet0.vp_c15)._m0[int(_1644)][_1646];
    float _1650 = _1626 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1652 = _1626 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1654 = _1482 * _1442;
    float _1656 = _1626 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1658 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1650);
    float _1660 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1652);
    float _1662 = _1626 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1664 = _1552;
    if (!_1314)
    {
        int _1666 = _1424 + 400;
        uint _1668 = uint(int(uint(_1666) >> uint(2)));
        uint _1670 = uint(int(uint(int(_1668)) >> uint(2)));
        int _1672 = int(_1668) & 3;
        float _1674 = (*spvDescriptorSet0.vp_c15)._m0[int(_1670)][_1672];
        _1664 = _1674;
    }
    float _1676 = _1664;
    float _1678 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1658);
    bool _1680 = _1654 >= 0.0;
    float _1682 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1656);
    float _1684 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1660);
    float _1686 = _1678 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1688 = _1500 * _1442;
    bool _1690 = _1654 <= 1.0;
    bool _1692 = _1690 && _1680;
    float _1694 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1682);
    float _1696 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1662);
    float _1698 = _1684 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1700 = _1686 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1702 = _1688 >= 0.0;
    bool _1704 = _1702 && _1692;
    float _1706 = _1694 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1708 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1696);
    float _1710 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1700);
    bool _1712 = _1688 <= 1.0;
    bool _1714 = _1712 && _1704;
    float _1716 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1718 = _1706 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1720 = _1708 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1722 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1710);
    float _1724 = _909 * _1366;
    float _1726 = _1142;
    float _1728 = _1716;
    if (!_1314)
    {
        float _1730 = floor(_1105);
        _1726 = _1730;
    }
    float _1732 = _1726;
    float _1734 = -_1718;
    float _1736 = fma(_1734, _1716, 1.0);
    float _1738 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1722);
    float _1740 = fma(_259, _1358, _1724);
    float _1742 = _1686 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1744 = _1686 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    if (_1714)
    {
        float _1746 = float(_1125);
        _1728 = _1746;
    }
    float _1748 = _1728;
    float _1750 = log2(_1736);
    float _1752 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1742);
    float _1754 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1744);
    float _1756 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1752);
    float _1758 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1754);
    float _1760 = 1.0 / _1738;
    float _1762 = 0.0;
    float _1764 = _1752;
    if (!_1314)
    {
        float _1766 = -_1732;
        float _1768 = _1105 + _1766;
        _1762 = _1768;
    }
    float _1770 = _1762;
    float _1772 = fma(_265, _1640, _1740);
    float _1774 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1756);
    float _1776 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1758);
    float _1778 = _1772 + _1648;
    float _1780 = _1742;
    float _1782 = _1774;
    if (_1714)
    {
        float _1784 = rint(_1748);
        float _1786 = precise::max(_1784, 0.0);
        uint _1788 = uint(_1786);
        uint _1790 = clamp(_1788, 0u, 65535u);
        _1780 = as_type<float>(_1790);
    }
    float _1792 = _1780;
    float _1794 = _1750 * 0.693147182464599609375;
    float _1796 = _1778 * _1442;
    float _1798 = _1794 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1800 = _1778;
    if (!_1314)
    {
        float _1802 = rint(_1676);
        float _1804 = precise::max(_1802, 0.0);
        uint _1806 = uint(_1804);
        uint _1808 = clamp(_1806, 0u, 65535u);
        _1800 = as_type<float>(_1808);
    }
    float _1810 = _1800;
    float _1812 = _1774 * _1760;
    float _1814 = _1776 * _1760;
    float _1816 = fma(_1812, 0.5, 0.5);
    float _1818 = fma(_1814, -0.5, 0.5);
    float _1820 = _1812;
    if (!_1314)
    {
        float _1822 = -_1480;
        float _1824 = _1099 + _1822;
        _1820 = _1824;
    }
    float _1826 = _1820;
    float _1828 = _1480;
    if (_1714)
    {
        float3 _6903 = float3(_1654, _1688, float(as_type<int>(_1792)));
        float3 _6907 = select(_6903, float3(0.0), isnan(_6903));
        float _1830 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6907.xy, uint(rint(_6907.z)), _1796, level(0.0));
        _1828 = _1830;
    }
    float _1832 = _1828;
    float3 _6917 = float3(_1816, _1818, _1798);
    float _1834 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6917, float3(0.0), isnan(_6917)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6917, float3(0.0), isnan(_6917)), level(0.0)).x;
    float3 _6926 = float3(_1816, _1818, _1798);
    float4 _1837 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6926, float3(0.0), isnan(_6926)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6926, float3(0.0), isnan(_6926)), level(0.0)).xyzw;
    float _1839 = _1837.x;
    float _1841 = _1837.y;
    float _1843 = _1837.z;
    float _1845 = _1837.w;
    float _1847 = _1770;
    if (!_1314)
    {
        float3 _6949 = float3(_1826, _1770, float(as_type<int>(_1810)));
        float3 _6951 = select(_6949, float3(0.0), isnan(_6949));
        float _1849 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6951.xy, uint(rint(_6951.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6951.xy, uint(rint(_6951.z)), level(0.0)).x;
        _1847 = _1849;
    }
    float _1851 = _1847;
    float _1853 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1855 = int(_1853);
    int _1857 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1859 = _1857 != 0;
    int _1861 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1863 = _1861 != 0;
    int _1865 = abs(_597);
    int _1867 = abs(_1468);
    float _1869 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1871 = int(_1869);
    int _1873 = abs(_1498);
    int _1875 = abs(_1504);
    int _1877 = abs(_1508);
    float _1879 = as_type<float>(_1877);
    if (_1859)
    {
        float _1881 = in.m_66.x;
        _1764 = _1881;
    }
    float _1883 = _1764;
    float _1885 = float(uint(_1855));
    float _1887 = trunc(_829);
    int _1889 = int(_1887);
    float _1891 = _1883;
    if (!_1859)
    {
        float _1893 = in.m_66.y;
        _1891 = _1893;
    }
    float _1895 = _1891;
    int _1897 = ~_1855;
    int _1899 = _1897 + 1;
    float _1901 = float(uint(_1871));
    float _1903 = 1.0 / _1885;
    int _1905 = ~_1871;
    int _1907 = _1905 + 1;
    float _1909 = 1.0 / _1901;
    float _1911 = trunc(_833);
    int _1913 = int(_1911);
    int _1915 = as_type<int>(_1903) + (-2);
    float _1917 = float(uint(_1889));
    float _1919 = float(_1889);
    int _1921 = as_type<int>(_1909) + (-2);
    float _1923 = as_type<float>(_1915) * _1917;
    float _1925 = _1917;
    if (_1859)
    {
        _1925 = 1.0;
    }
    float _1927 = _1925;
    float _1929 = _1927;
    if (!_1859)
    {
        _1929 = 7.345489978790283203125;
    }
    float _1931 = _1929;
    float _1933 = trunc(_1923);
    float _1935 = precise::max(_1933, 0.0);
    uint _1937 = uint(_1935);
    float _1939 = float(uint(_1913));
    float _1941 = _1931 * _295;
    float _1943 = as_type<float>(_1921) * _1939;
    float _1945 = _1939;
    if (_1859)
    {
        _1945 = 1.0;
    }
    float _1947 = _1945;
    float _1949 = floor(_1941);
    float _1951 = _1947;
    if (!_1859)
    {
        _1951 = 1.2345600128173828125;
    }
    float _1953 = _1951;
    float _1955 = _1953 * _1895;
    float _1957 = trunc(_1943);
    float _1959 = precise::max(_1957, 0.0);
    uint _1961 = uint(_1959);
    int _1963 = _1899 * int(_1937);
    int _1965 = _1963 + _1889;
    float _1967 = float(uint(_1965));
    float _1969 = floor(_1955);
    float _1971 = float(_1855);
    float _1973 = as_type<float>(_1915) * _1967;
    int _1975 = _1907 * int(_1961);
    int _1977 = _1975 + _1913;
    float _1979 = trunc(_1973);
    float _1981 = precise::max(_1979, 0.0);
    uint _1983 = uint(_1981);
    float _1985 = float(uint(_1977));
    float _1987 = -_1969;
    float _1989 = _1955 + _1987;
    float _1991 = float(_1871);
    float _1993 = as_type<float>(_1921) * _1985;
    float _1995 = -_1949;
    float _1997 = _1941 + _1995;
    int _1999 = ~_1855;
    int _2001 = _1999 + 1;
    bool _2003 = _1919 >= _1971;
    bool _2005 = isnan(_1919);
    bool _2007 = _2003 || _2005;
    bool _2009 = isnan(_1971);
    bool _2011 = _2007 || _2009;
    float _2013 = float(_2011);
    float _2015 = _1989 * _1991;
    float _2017 = trunc(_1993);
    float _2019 = precise::max(_2017, 0.0);
    uint _2021 = uint(_2019);
    int _2023 = int(_1937) + int(_1983);
    float _2025 = _1997 * _1971;
    float _2027 = _1971 * _703;
    float _2029 = _1991 * _703;
    int _2031 = _2001 * _2023;
    int _2033 = _2031 + _1889;
    float _2035 = trunc(_2013);
    int _2037 = int(_2035);
    bool _2039 = uint(_2033) >= uint(_1855);
    bool _2041 = !_2039;
    int _2043 = _2041 ? 0 : (-1);
    float _2045 = trunc(_2025);
    int _2047 = int(_2045);
    int _2049 = int(_1961) + int(_2021);
    float _2051 = float(_1913);
    int _2053 = ~_1871;
    int _2055 = _2053 + 1;
    bool _2057 = _2051 >= _1991;
    bool _2059 = isnan(_2051);
    bool _2061 = _2057 || _2059;
    bool _2063 = isnan(_1991);
    bool _2065 = _2061 || _2063;
    float _2067 = float(_2065);
    float _2069 = trunc(_2015);
    int _2071 = int(_2069);
    int _2073 = _2055 * _2049;
    int _2075 = _2073 + _1913;
    int _2077 = ~_2023;
    int _2079 = _2077 + _2043;
    int _2081 = _2079 + 1;
    int _2083 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2085 = _2083 != 0;
    int _2087 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2089 = _2087 != 0;
    float _2091 = trunc(_2067);
    int _2093 = int(_2091);
    bool _2095 = uint(_2075) >= uint(_1871);
    bool _2097 = !_2085;
    int _2099 = _2097 ? 0 : 1;
    bool _2101 = !_2089;
    int _2103 = _2101 ? 0 : 1;
    int _2105 = abs(_2099);
    int _2107 = _1855 * _2081;
    int _2109 = _2107 + _1889;
    bool _2111 = !_2095;
    int _2113 = _2111 ? 0 : (-1);
    float _2115 = trunc(_2027);
    int _2117 = int(_2115);
    int _2119 = abs(_2103);
    bool _2121 = _1855 == 0;
    int _2123 = ~_2049;
    int _2125 = _2123 + _2113;
    int _2127 = _2125 + 1;
    int _2129 = _2047 * _2105;
    int _2131 = _2129 + _1889;
    float _2133 = trunc(_2029);
    int _2135 = int(_2133);
    int _2137 = ~_2037;
    int _2139 = _2137 + 1;
    int _2141 = _2139 + 1;
    int _2143 = _1871 * _2127;
    int _2145 = _2143 + _1913;
    bool _2147 = !_2121;
    int _2149 = _2147 ? _2109 : (-1);
    int _2151 = _2071 * _2119;
    int _2153 = _2151 + _1913;
    bool _2155 = _1871 == 0;
    int _2157 = ~_2093;
    int _2159 = _2157 + 1;
    int _2161 = _2159 + 1;
    int _2163 = _2149 * _2141;
    bool _2165 = !_2155;
    int _2167 = _2165 ? _2145 : (-1);
    int _2169 = _1855 + (-1);
    int _2171 = _1871 + (-1);
    int _2173 = _2167 * _2161;
    int _2175 = _2037 * _2169;
    int _2177 = _2175 + _2163;
    int _2179 = _2093 * _2171;
    int _2181 = _2179 + _2173;
    int _2183 = abs(_603);
    int _2185 = _2177 * _1865;
    bool _2187 = !_1863;
    int _2189 = _2187 ? 0 : 1;
    int _2191 = abs(_611);
    int _2193 = _2117 * _2183;
    int _2195 = _2193 + _2185;
    int _2197 = abs(_2189);
    int _2199 = _2181 * _1867;
    int _2201 = _2131 * _2191;
    int _2203 = _2201 + _2195;
    int _2205 = _2135 * _1873;
    int _2207 = _2205 + _2199;
    int _2209 = ~_1871;
    int _2211 = _2209 + 1;
    int _2213 = _2047 * _2197;
    int _2215 = _2213 + _2203;
    int _2217 = _2153 * _1875;
    int _2219 = _2217 + _2207;
    int _2221 = ~_1855;
    int _2223 = _2221 + 1;
    float _2225 = float(uint(_2215));
    int _2227 = _2071 * _1877;
    int _2229 = _2227 + _2219;
    int _2231 = ~_1855;
    int _2233 = _2231 + 1;
    int _2235 = ~_1871;
    int _2237 = _2235 + 1;
    float _2239 = as_type<float>(_1915) * _2225;
    float _2241 = float(uint(_2229));
    float _2243 = float(uint(_2131));
    float _2245 = trunc(_2239);
    float _2247 = precise::max(_2245, 0.0);
    uint _2249 = uint(_2247);
    float _2251 = as_type<float>(_1921) * _2241;
    float _2253 = as_type<float>(_1915) * _2243;
    float _2255 = trunc(_2251);
    float _2257 = precise::max(_2255, 0.0);
    uint _2259 = uint(_2257);
    int _2261 = _2223 * int(_2249);
    int _2263 = _2261 + _2215;
    float _2265 = trunc(_2253);
    float _2267 = precise::max(_2265, 0.0);
    uint _2269 = uint(_2267);
    float _2271 = float(uint(_2263));
    int _2273 = _2211 * int(_2259);
    int _2275 = _2273 + _2229;
    float _2277 = as_type<float>(_1915) * _2271;
    float _2279 = float(uint(_2275));
    int _2281 = ~_1855;
    int _2283 = _2281 + 1;
    float _2285 = trunc(_2277);
    float _2287 = precise::max(_2285, 0.0);
    uint _2289 = uint(_2287);
    float _2291 = as_type<float>(_1921) * _2279;
    float _2293 = float(uint(_2153));
    int _2295 = _2283 * int(_2269);
    int _2297 = _2295 + _2131;
    float _2299 = trunc(_2291);
    float _2301 = precise::max(_2299, 0.0);
    uint _2303 = uint(_2301);
    float _2305 = as_type<float>(_1921) * _2293;
    float _2307 = float(uint(_2297));
    int _2309 = ~_1871;
    int _2311 = _2309 + 1;
    float _2313 = as_type<float>(_1915) * _2307;
    float _2315 = trunc(_2305);
    float _2317 = precise::max(_2315, 0.0);
    uint _2319 = uint(_2317);
    int _2321 = int(_2249) + int(_2289);
    int _2323 = int(_2259) + int(_2303);
    int _2325 = _2233 * _2321;
    int _2327 = _2325 + _2215;
    float _2329 = trunc(_2313);
    float _2331 = precise::max(_2329, 0.0);
    uint _2333 = uint(_2331);
    int _2335 = _2237 * _2323;
    int _2337 = _2335 + _2229;
    bool _2339 = uint(_2327) >= uint(_1855);
    int _2341 = _2311 * int(_2319);
    int _2343 = _2341 + _2153;
    bool _2345 = !_2339;
    int _2347 = _2345 ? 0 : (-1);
    bool _2349 = uint(_2337) >= uint(_1871);
    float _2351 = float(uint(_2343));
    int _2353 = ~_2321;
    int _2355 = _2353 + _2347;
    int _2357 = _2355 + 1;
    bool _2359 = !_2349;
    int _2361 = _2359 ? 0 : (-1);
    float _2363 = as_type<float>(_1921) * _2351;
    int _2365 = int(_2269) + int(_2333);
    int _2367 = _1855 * _2357;
    int _2369 = _2367 + _2215;
    int _2371 = ~_2323;
    int _2373 = _2371 + _2361;
    int _2375 = _2373 + 1;
    float _2377 = as_type<float>(_2321);
    if (_1314)
    {
        _2377 = 1.0;
    }
    float _2379 = _2377;
    float _2381 = _2379;
    if (!_1314)
    {
        int _2383 = _1378 << 4;
        int _2385 = _2383 + 2048;
        uint _2387 = uint(int(uint(_2385) >> uint(2)));
        uint _2389 = uint(int(uint(int(_2387)) >> uint(2)));
        int _2391 = int(_2387) & 3;
        float _2393 = (*spvDescriptorSet0.vp_c15)._m0[int(_2389)][_2391];
        int _2395 = int(_2387) + 1;
        uint _2397 = uint(int(uint(_2395) >> uint(2)));
        int _2399 = _2395 & 3;
        float _2401 = (*spvDescriptorSet0.vp_c15)._m0[int(_2397)][_2399];
        int _2403 = _2385 + 8;
        uint _2405 = uint(int(uint(_2403) >> uint(2)));
        uint _2407 = uint(int(uint(int(_2405)) >> uint(2)));
        int _2409 = int(_2405) & 3;
        float _2411 = (*spvDescriptorSet0.vp_c15)._m0[int(_2407)][_2409];
        int _2413 = int(_2405) + 1;
        uint _2415 = uint(int(uint(_2413) >> uint(2)));
        int _2417 = _2413 & 3;
        float _2419 = (*spvDescriptorSet0.vp_c15)._m0[int(_2415)][_2417];
        float _2421 = _909 * _2401;
        float _2423 = fma(_259, _2393, _2421);
        float _2425 = fma(_265, _2411, _2423);
        float _2427 = _2425 + _2419;
        float _2429 = precise::clamp(_2427, 0.0, 1.0);
        float _2431 = -_2429;
        float _2433 = _2431 + _1851;
        float _2435 = fma(_2433, 500.0, 1.5);
        float _2437 = exp2(_2435);
        float _2439 = 0.0 + _2437;
        float _2441 = precise::clamp(_2439, 0.0, 1.0);
        _1398 = as_type<float>(_2385);
        _2381 = _2441;
    }
    float _2443 = _1398;
    float _2445 = _2381;
    float _2447 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2449 = _1626 + _2447;
    float _2451 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2453 = _1628 + _2451;
    float _2455 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2457 = _1630 + _2455;
    float _2459 = _2449 * _2449;
    float _2461 = fma(_2453, _2453, _2459);
    float _2463 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2465 = fma(_2457, _2457, _2461);
    float _2467 = rsqrt(_2465);
    float _2469 = sqrt(_2465);
    float _2471 = _2467 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2473 = _2453 * _2471;
    float _2475 = _2457 * _2471;
    float _2477 = _2473 * _2473;
    float _2479 = _2475 * _2475;
    float _2481 = _2477 + _2479;
    float _2483 = sqrt(_2481);
    bool _2485 = _2483 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2487 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2489 = _2483 + _2487;
    float _2491 = _2443;
    float _2493 = _2481;
    float _2495 = _2489;
    float _2497 = _2463;
    float _2499 = _2473;
    float _2501 = _2475;
    float _2503 = _2477;
    float _2505 = _2479;
    if (_2485)
    {
        float _2507 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2491 = _2507;
    }
    float _2509 = _2491;
    if (_2485)
    {
        float _2511 = rsqrt(_2481);
        _2493 = _2511;
    }
    float _2513 = _2493;
    if (_2485)
    {
        float _2515 = _2489 * _2509;
        _2495 = _2515;
    }
    float _2517 = _2495;
    float _2519 = precise::max(0.0, _2463);
    float _2521 = _2519;
    if (_2485)
    {
        float _2523 = _2517 * 0.15915493667125701904296875;
        _1879 = _2523;
    }
    float _2525 = _1879;
    float _2527 = -_2471;
    float _2529 = -_2519;
    float _2531 = fma(_2449, _2527, _2529);
    float _2533 = as_type<float>(_2333);
    float _2535 = _2531;
    if (_2485)
    {
        float _2537 = _2525 * 6.283185482025146484375;
        float _2539 = sin(_2537);
        _2533 = _2539;
    }
    float _2541 = _2533;
    if (_2485)
    {
        float _2543 = _2531 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2521 = _2543;
    }
    float _2545 = _2521;
    float _2547 = _2517;
    float _2549 = _2545;
    if (_2485)
    {
        float _2551 = _2525 * 6.283185482025146484375;
        float _2553 = cos(_2551);
        _2547 = _2553;
    }
    float _2555 = _2547;
    float _2557 = _2541;
    if (_2485)
    {
        float _2559 = fma(_2541, _2545, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2549 = _2559;
    }
    float _2561 = _2549;
    float _2563 = _2561;
    if (_2485)
    {
        float _2565 = _2513 * _2561;
        _2557 = _2565;
    }
    float _2567 = _2557;
    if (_2485)
    {
        float _2569 = _2555 + (-1.0);
        _2497 = _2569;
    }
    float _2571 = _2497;
    if (_2485)
    {
        float _2573 = _2473 * _2567;
        _2499 = _2573;
    }
    float _2575 = _2499;
    if (_2485)
    {
        float _2577 = _2475 * _2567;
        _2501 = _2577;
    }
    float _2579 = _2501;
    if (_2485)
    {
        float _2581 = _2571 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2563 = _2581;
    }
    float _2583 = _2563;
    if (_2485)
    {
        float _2585 = _2575 * _2575;
        _2503 = _2585;
    }
    float _2587 = _2503;
    if (_2485)
    {
        float _2589 = _2579 * _2579;
        _2505 = _2589;
    }
    float _2591 = _2505;
    int _2593 = ~_1855;
    int _2595 = _2593 + 1;
    if (_2485)
    {
        float _2597 = fma(_2531, _2555, _2583);
        _2535 = _2597;
    }
    float _2599 = _2535;
    float _2601 = fma(_2599, _2599, _2587);
    float _2603 = _2601 + _2591;
    float _2605 = rsqrt(_2603);
    float _2607 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2609 = fma(_2469, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2607);
    float _2611 = precise::clamp(_2609, 0.0, 1.0);
    float _2613 = -_2611;
    float _2615 = _2613 + 1.0;
    float _2617 = abs(_2615);
    float _2619 = log2(_2617);
    float _2621 = _2605 * _2575;
    float _2623 = _2605 * _2599;
    float _2625 = _2605 * _2579;
    float _2627 = _2621 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2629 = _2623 + 1.0;
    float _2631 = -_2627;
    float _2633 = fma(_2623, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2631);
    float _2635 = _2619 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2637 = -_2625;
    float _2639 = fma(_2637, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2633);
    float _2641 = exp2(_2635);
    float _2643 = fma(_2639, -0.5, 0.5);
    float _2645 = fma(_2639, 0.5, 0.5);
    float _2647 = fma(_2645, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2649 = sqrt(_2643);
    float _2651 = fma(_2645, _2647, -0.212114393711090087890625);
    float _2653 = fma(_2645, _2651, 1.570728778839111328125);
    float _2655 = -_2623;
    float _2657 = fma(_2641, _2629, _2655);
    bool _2659 = !_2121;
    int _2661 = _2659 ? _2369 : (-1);
    int _2663 = _2661 & 3;
    bool _2665 = _2663 != 0;
    float _2667 = _2649 * 0.636619746685028076171875;
    int _2669 = _2661 & 3;
    bool _2671 = _2669 != 0;
    float _2673 = -_2653;
    float _2675 = fma(_2667, _2673, 1.0);
    float _2677 = fma(_2657, 0.5, 0.5);
    int _2679 = _2595 * _2365;
    int _2681 = _2679 + _2131;
    bool _2683 = uint(_2669) > 1u;
    float2 _8117 = float2(_2675, _2677);
    float3 _2687 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8117, float2(0.0), isnan(_8117)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8117, float2(0.0), isnan(_8117)), level(0.0)).xyz;
    float _2689 = _2687.x;
    float _2691 = _2687.y;
    float _2693 = _2687.z;
    int _2695 = _1871 * _2375;
    int _2697 = _2695 + _2229;
    bool _2699 = uint(_2681) >= uint(_1855);
    float _2701 = trunc(_2363);
    float _2703 = precise::max(_2701, 0.0);
    uint _2705 = uint(_2703);
    int _2707 = _2665 ? 0 : 1;
    float _2709 = _1686 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2711 = _2661 >> 31;
    float _2713 = _2619 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2715 = _301 > 0.5;
    float _2717 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2709);
    bool _2719 = !_2155;
    int _2721 = _2719 ? _2697 : (-1);
    float _2723 = -_831;
    float _2725 = _2723 + 1.0;
    int _2727 = ~_2707;
    int _2729 = _2727 + 1;
    int _2731 = _2729 + 1;
    float _2733 = exp2(_2713);
    int _2735 = _2731;
    if (!_2683)
    {
        int _2737 = ~_2707;
        int _2739 = _2737 + 1;
        _2735 = _2739;
    }
    int _2741 = _2735;
    float _2743 = -_725;
    float _2745 = _2743 + 1.0;
    int _2747 = _2711 & 3;
    float _2749 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2717);
    int _2751 = _2721 >> 31;
    float _2753 = -_789;
    float _2755 = _2753 + 1.0;
    int _2757 = _2661 + _2747;
    float _2759 = -_281;
    float _2761 = _2759 + 1.0;
    int _2763 = _2751 & 3;
    float _2765 = -_827;
    float _2767 = _2765 + 1.0;
    bool _2769 = !_2699;
    int _2771 = _2769 ? 0 : (-1);
    out.m_78.x = _1628;
    out.m_78.y = _1626;
    out.m_78.z = _1630;
    bool _2773 = _2669 != 3;
    int _2775 = _2721 + _2763;
    float _2777 = -_2733;
    float _2779 = _2777 + 1.0;
    bool _2781 = uint(_2669) >= 2u;
    int _2783 = _2775 >> 2;
    int _2785 = _2757 >> 2;
    int _2787 = _2781 ? 0 : 1;
    int _2789 = _2783 << 4;
    int _2791 = _2789 + 512;
    int _2793 = _2785 << 4;
    int _2795 = _2793 + 368;
    int _2797 = ~_2787;
    int _2799 = _2797 + 1;
    int _2801 = _2799 + 1;
    int _2803 = _2801;
    if (_2773)
    {
        int _2805 = ~_2787;
        int _2807 = _2805 + 1;
        _2803 = _2807;
    }
    int _2809 = _2803;
    uint _2811 = uint(int(uint(_2795) >> uint(2)));
    uint _2813 = uint(int(uint(int(_2811)) >> uint(2)));
    int _2815 = int(_2811) & 3;
    float _2817 = (*spvDescriptorSet0.vp_c9)._m0[int(_2813)][_2815];
    int _2819 = int(_2811) + 1;
    uint _2821 = uint(int(uint(_2819) >> uint(2)));
    int _2823 = _2819 & 3;
    float _2825 = (*spvDescriptorSet0.vp_c9)._m0[int(_2821)][_2823];
    int _2827 = ~_2365;
    int _2829 = _2827 + _2771;
    int _2831 = _2829 + 1;
    int _2833 = int(_2319) + int(_2705);
    float _2835 = -_195;
    int _2837 = _2715 ? as_type<int>(_2835) : as_type<int>(_195);
    int _2839 = _1855 * _2831;
    int _2841 = _2839 + _2131;
    bool _2843 = !_2671;
    int _2845 = _2843 ? 0 : 1;
    uint _2847 = uint(int(uint(_2791) >> uint(2)));
    uint _2849 = uint(int(uint(int(_2847)) >> uint(2)));
    int _2851 = int(_2847) & 3;
    float _2853 = (*spvDescriptorSet0.vp_c9)._m0[int(_2849)][_2851];
    int _2855 = int(_2847) + 1;
    uint _2857 = uint(int(uint(_2855) >> uint(2)));
    int _2859 = _2855 & 3;
    float _2861 = (*spvDescriptorSet0.vp_c9)._m0[int(_2857)][_2859];
    bool _2863 = _2669 != 3;
    int _2865 = _2721 & 3;
    bool _2867 = _2865 != 0;
    int _2869 = _2721 & 3;
    bool _2871 = _2869 != 0;
    int _2873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2875 = _2873 != 0;
    int _2877 = _2795 + 8;
    uint _2879 = uint(int(uint(_2877) >> uint(2)));
    uint _2881 = uint(int(uint(int(_2879)) >> uint(2)));
    int _2883 = int(_2879) & 3;
    float _2885 = (*spvDescriptorSet0.vp_c9)._m0[int(_2881)][_2883];
    int _2887 = int(_2879) + 1;
    uint _2889 = uint(int(uint(_2887) >> uint(2)));
    int _2891 = _2887 & 3;
    float _2893 = (*spvDescriptorSet0.vp_c9)._m0[int(_2889)][_2891];
    int _2895 = ~_1871;
    int _2897 = _2895 + 1;
    bool _2899 = !_2875;
    int _2901 = _2899 ? 0 : 1;
    bool _2903 = uint(_2869) > 1u;
    int _2905 = _2897 * _2833;
    int _2907 = _2905 + _2153;
    bool _2909 = !_2121;
    int _2911 = _2909 ? _2841 : (-1);
    int _2913 = _2791 + 8;
    uint _2915 = uint(int(uint(_2913) >> uint(2)));
    uint _2917 = uint(int(uint(int(_2915)) >> uint(2)));
    int _2919 = int(_2915) & 3;
    float _2921 = (*spvDescriptorSet0.vp_c9)._m0[int(_2917)][_2919];
    int _2923 = int(_2915) + 1;
    uint _2925 = uint(int(uint(_2923) >> uint(2)));
    int _2927 = _2923 & 3;
    float _2929 = (*spvDescriptorSet0.vp_c9)._m0[int(_2925)][_2927];
    int _2931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2933 = _2931 != 0;
    int _2935 = _2867 ? 0 : 1;
    bool _2937 = !_2933;
    int _2939 = _2937 ? 0 : 1;
    bool _2941 = uint(_2907) >= uint(_1871);
    bool _2943 = _2869 != 3;
    bool _2945 = !_2941;
    int _2947 = _2945 ? 0 : (-1);
    bool _2949 = !_2863;
    int _2951 = _2949 ? 0 : (-1);
    int _2953 = ~_2935;
    int _2955 = _2953 + 1;
    int _2957 = _2955 + 1;
    bool _2959 = !_2871;
    int _2961 = _2959 ? 0 : 1;
    bool _2963 = uint(_2869) >= 2u;
    bool _2965 = _2869 != 3;
    int _2967 = _2957;
    if (!_2903)
    {
        int _2969 = ~_2935;
        int _2971 = _2969 + 1;
        _2967 = _2971;
    }
    int _2973 = _2967;
    int _2975 = ~_2833;
    int _2977 = _2975 + _2947;
    int _2979 = _2977 + 1;
    int _2981 = _2963 ? 0 : 1;
    bool _2983 = !_2965;
    int _2985 = _2983 ? 0 : (-1);
    int _2987 = _1871 * _2979;
    int _2989 = _2987 + _2153;
    int _2991 = abs(_2973);
    int _2993 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2995 = _2993 != 0;
    int _2997 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2999 = _2997 != 0;
    int _3001 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _3003 = _3001 != 0;
    int _3005 = abs(_2741);
    bool _3007 = _295 > 0.5;
    int _3009 = ~_2981;
    int _3011 = _3009 + 1;
    int _3013 = _3011 + 1;
    int _3015 = _3013;
    if (_2943)
    {
        int _3017 = ~_2981;
        int _3019 = _3017 + 1;
        _3015 = _3019;
    }
    int _3021 = _3015;
    int _3023 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3025 = _3023 != 0;
    int _3027 = abs(_2845);
    int _3029 = ~_2991;
    int _3031 = _3029 + 1;
    int _3033 = _3031 + 1;
    int _3035 = ~_3005;
    int _3037 = _3035 + 1;
    int _3039 = _3037 + 1;
    int _3041 = abs(_2961);
    int _3043 = _3033 * as_type<int>(_2861);
    int _3045 = abs(_3021);
    int _3047 = _3039 * as_type<int>(_2825);
    int _3049 = ~_3027;
    int _3051 = _3049 + 1;
    int _3053 = _3051 + 1;
    int _3055 = ~_3041;
    int _3057 = _3055 + 1;
    int _3059 = _3057 + 1;
    int _3061 = abs(_2809);
    int _3063 = _3053 * as_type<int>(_2817);
    int _3065 = _3063 + _3047;
    int _3067 = ~_3061;
    int _3069 = _3067 + 1;
    int _3071 = _3069 + 1;
    float _3073 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3075 = int(_3073);
    int _3077 = ~_3045;
    int _3079 = _3077 + 1;
    int _3081 = _3079 + 1;
    int _3083 = _3059 * as_type<int>(_2853);
    int _3085 = _3083 + _3043;
    int _3087 = _3071 * as_type<int>(_2885);
    int _3089 = _3087 + _3065;
    int _3091 = _3081 * as_type<int>(_2921);
    int _3093 = _3091 + _3085;
    float _3095 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _3097 = abs(_2951);
    float _3099 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _3101 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _3103 = ~_3097;
    int _3105 = _3103 + 1;
    int _3107 = _3105 + 1;
    float _3109 = _3095 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3111 = _3099 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3113 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _3115 = _3101 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3117 = _3107 * as_type<int>(_2893);
    int _3119 = _3117 + _3089;
    int _3121 = abs(_3075);
    float _3123 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3125 = int(_3123);
    int _3127 = abs(_2901);
    out.m_80.x = _3109;
    out.m_80.y = _3111;
    out.m_80.z = _3115;
    out.m_80.w = _3113;
    float _3129 = float(uint(_3075));
    int _3131 = abs(_2985);
    bool _3133 = !_2155;
    int _3135 = _3133 ? _2989 : (-1);
    float _3137 = 1.0 / _3129;
    int _3139 = ~_3131;
    int _3141 = _3139 + 1;
    int _3143 = _3141 + 1;
    float _3145 = -_191;
    int _3147 = _3007 ? as_type<int>(_3145) : as_type<int>(_191);
    bool _3149 = _297 > 0.5;
    int _3151 = _3143 * as_type<int>(_2929);
    int _3153 = _3151 + _3093;
    float _3155 = abs(_1051);
    float _3157 = log2(_3155);
    int _3159 = abs(_2939);
    float _3161 = float(uint(_3125));
    int _3163 = ~_3127;
    int _3165 = _3163 + 1;
    int _3167 = _3165 + 1;
    bool _3169 = _299 > 0.5;
    float _3171 = 1.0 / _3161;
    int _3173 = _3119 * _3167;
    int _3175 = as_type<int>(_3137) + (-2);
    float _3177 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3179 = _2911 * _3127;
    int _3181 = _3179 + _3173;
    float _3183 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3185 = _3157 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3187 = -_1131;
    float _3189 = fma(_3187, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3183);
    float _3191 = float(uint(_3181));
    float _3193 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _3195 = ~_3159;
    int _3197 = _3195 + 1;
    int _3199 = _3197 + 1;
    float _3201 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _3203 = abs(_3125);
    float _3205 = as_type<float>(_3175) * _3191;
    float _3207 = float(uint(_3121));
    float _3209 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _3211 = _3153 * _3199;
    float _3213 = float(uint(_3203));
    float _3215 = exp2(_3185);
    float _3217 = _3193 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3219 = _3201 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3221 = _3209 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3223 = _3135 * _3159;
    int _3225 = _3223 + _3211;
    float _3227 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3229 = -_1131;
    float _3231 = fma(_3229, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3177);
    int _3233 = ~_3075;
    int _3235 = _3233 + 1;
    float _3237 = 1.0 / _3207;
    out.m_82.x = _3217;
    out.m_82.y = _3219;
    out.m_82.z = _3221;
    float _3239 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3241 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3243 = ~_3203;
    int _3245 = _3243 + 1;
    bool _3247 = !_3025;
    float _3249 = _3247 ? _191 : as_type<float>(_3147);
    float _3251 = trunc(_3205);
    float _3253 = precise::max(_3251, 0.0);
    uint _3255 = uint(_3253);
    bool _3257 = !_2995;
    float _3259 = _3257 ? _195 : as_type<float>(_2837);
    bool _3261 = _1051 <= 8000.0;
    bool _3263 = isnan(_1051);
    bool _3265 = _3261 || _3263;
    bool _3267 = isnan(8000.0);
    bool _3269 = _3265 || _3267;
    float _3271 = float(_3269);
    int _3273 = as_type<int>(_3171) + (-2);
    float _3275 = -_1131;
    float _3277 = fma(_3275, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3227);
    float _3279 = float(uint(_3225));
    float _3281 = 1.0 / _3213;
    float _3283 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3189);
    int _3285 = abs(_3181);
    float _3287 = as_type<float>(_3273) * _3279;
    int _3289 = as_type<int>(_3237) + (-2);
    float _3291 = fma(_3215, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3293 = precise::clamp(_3291, 0.0, 1.0);
    int _3295 = abs(_3225);
    int _3297 = _3235 * int(_3255);
    int _3299 = _3297 + _3181;
    float _3301 = float(uint(_3285));
    float _3303 = trunc(_3287);
    float _3305 = precise::max(_3303, 0.0);
    uint _3307 = uint(_3305);
    float _3309 = float(uint(_3295));
    float _3311 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3231);
    float _3313 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3277);
    float _3315 = as_type<float>(_3289) * _3301;
    float _3317 = float(uint(_3299));
    float _3319 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3239);
    int _3321 = as_type<int>(_3281) + (-2);
    float _3323 = trunc(_3315);
    float _3325 = precise::max(_3323, 0.0);
    uint _3327 = uint(_3325);
    int _3329 = ~_3125;
    int _3331 = _3329 + 1;
    float _3333 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3241);
    float _3335 = as_type<float>(_3321) * _3309;
    float _3337 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3339 = as_type<float>(_3175) * _3317;
    float _3341 = trunc(_3335);
    float _3343 = precise::max(_3341, 0.0);
    uint _3345 = uint(_3343);
    int _3347 = ~_3121;
    int _3349 = _3347 + 1;
    float _3351 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3337);
    float _3353 = _1226 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3355 = _3331 * int(_3307);
    int _3357 = _3355 + _3225;
    float _3359 = _1226 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3361 = _1226 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3363 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3353);
    int _3365 = _3349 * int(_3327);
    int _3367 = _3365 + _3285;
    float _3369 = float(uint(_3357));
    float _3371 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3359);
    float _3373 = trunc(_3339);
    float _3375 = precise::max(_3373, 0.0);
    uint _3377 = uint(_3375);
    float _3379 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3361);
    float _3381 = float(uint(_3367));
    float _3383 = as_type<float>(_3273) * _3369;
    float _3385 = -_191;
    int _3387 = _3169 ? as_type<int>(_3385) : as_type<int>(_191);
    int _3389 = _3245 * int(_3345);
    int _3391 = _3389 + _3295;
    float _3393 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3333);
    float _3395 = as_type<float>(_3289) * _3381;
    float _3397 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3319);
    float _3399 = trunc(_3383);
    float _3401 = precise::max(_3399, 0.0);
    uint _3403 = uint(_3401);
    float _3405 = float(uint(_3391));
    float _3407 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3351);
    bool _3409 = !_3003;
    float _3411 = _3409 ? _191 : as_type<float>(_3387);
    float _3413 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3415 = -_195;
    int _3417 = _3149 ? as_type<int>(_3415) : as_type<int>(_195);
    float _3419 = as_type<float>(_3321) * _3405;
    float _3421 = trunc(_3395);
    float _3423 = precise::max(_3421, 0.0);
    uint _3425 = uint(_3423);
    bool _3427 = !_2999;
    float _3429 = _3427 ? _195 : as_type<float>(_3417);
    float _3431 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3371);
    int _3433 = ~_3125;
    int _3435 = _3433 + 1;
    float _3437 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3439 = _3413 * _3283;
    int _3441 = int(_3255) + int(_3377);
    float _3443 = fma(_3293, -2.0, 3.0);
    float _3445 = trunc(_3419);
    float _3447 = precise::max(_3445, 0.0);
    uint _3449 = uint(_3447);
    int _3451 = int(_3307) + int(_3403);
    float _3453 = _3293 * _3293;
    int _3455 = ~_3121;
    int _3457 = _3455 + 1;
    float _3459 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3363);
    float _3461 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3379);
    int _3463 = _3435 * _3451;
    int _3465 = _3463 + _3225;
    float _3467 = fma(_3437, _3393, _3439);
    out.m_84.x = _3393;
    out.m_84.y = _3397;
    out.m_84.z = _3407;
    int _3469 = ~_3075;
    int _3471 = _3469 + 1;
    float _3473 = _3453 * _3443;
    int _3475 = ~_3203;
    int _3477 = _3475 + 1;
    int _3479 = int(_3327) + int(_3425);
    int _3481 = _3471 * _3441;
    int _3483 = _3481 + _3181;
    bool _3485 = uint(_3465) >= uint(_3125);
    int _3487 = int(_3345) + int(_3449);
    bool _3489 = !_3485;
    int _3491 = _3489 ? 0 : (-1);
    bool _3493 = uint(_3483) >= uint(_3075);
    int _3495 = _3457 * _3479;
    int _3497 = _3495 + _3285;
    int _3499 = ~_3451;
    int _3501 = _3499 + _3491;
    int _3503 = _3501 + 1;
    int _3505 = _3477 * _3487;
    int _3507 = _3505 + _3295;
    int _3509 = _3181 ^ _3075;
    float _3511 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3513 = uint(_3497) >= uint(_3121);
    int _3515 = _3125 * _3503;
    int _3517 = _3515 + _3225;
    bool _3519 = !_3493;
    int _3521 = _3519 ? 0 : (-1);
    bool _3523 = uint(_3507) >= uint(_3203);
    bool _3525 = !_3513;
    int _3527 = _3525 ? 0 : (-1);
    float _3529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _3531 = uint(int(uint(_3509) >> uint(31)));
    int _3533 = ~_3441;
    int _3535 = _3533 + _3521;
    int _3537 = _3535 + 1;
    int _3539 = ~_3527;
    int _3541 = _3479 + _3539;
    int _3543 = _3541 + 1;
    int _3545 = ~int(_3531);
    int _3547 = _3545 + 1;
    int _3549 = _3075 * _3537;
    int _3551 = _3549 + _3181;
    int _3553 = _3225 ^ _3125;
    float _3555 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3557 = _3543 ^ _3547;
    bool _3559 = _3075 == 0;
    bool _3561 = _3125 == 0;
    float _3563 = _3529 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3565 = _3125 == 0;
    int _3567 = ~_3547;
    int _3569 = _3567 + _3557;
    int _3571 = _3569 + 1;
    float _3573 = _3511 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3575 = !_3523;
    int _3577 = _3575 ? 0 : (-1);
    uint _3579 = uint(int(uint(_3553) >> uint(31)));
    float _3581 = fma(_3413, _3413, 1.0);
    bool _3583 = !_3559;
    int _3585 = _3583 ? _3551 : (-1);
    bool _3587 = _3075 == 0;
    int _3589 = ~_3577;
    int _3591 = _3487 + _3589;
    int _3593 = _3591 + 1;
    float _3595 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3597 = ~int(_3579);
    int _3599 = _3597 + 1;
    bool _3601 = !_3561;
    int _3603 = _3601 ? _3517 : (-1);
    float _3605 = float(_3585);
    int _3607 = _3593 ^ _3599;
    float _3609 = rsqrt(_3581);
    float _3611 = float(_3603);
    float _3613 = fma(_3573, _3605, _689);
    float _3615 = _3249 + 0.5;
    int _3617 = ~_3599;
    int _3619 = _3617 + _3607;
    int _3621 = _3619 + 1;
    bool _3623 = !_3587;
    int _3625 = _3623 ? _3571 : (-1);
    float _3627 = fma(_3563, _3611, _811);
    float _3629 = fma(_3573, _3615, _3613);
    float _3631 = _3411 + 0.5;
    bool _3633 = !_3565;
    int _3635 = _3633 ? _3621 : (-1);
    float _3637 = _3555 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3639 = float(_3625);
    float _3641 = fma(_3563, _3631, _3627);
    float _3643 = float(_3635);
    float _3645 = _3595 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3647 = _3429 + (-0.5);
    float _3649 = -_705;
    float _3651 = fma(_3637, _3639, _3649);
    float _3653 = _3259 + (-0.5);
    float _3655 = -_837;
    float _3657 = fma(_3645, _3643, _3655);
    float _3659 = _3413 * _3609;
    float _3661 = -_3637;
    float _3663 = fma(_3661, _3647, _3651);
    float _3665 = -_2745;
    float _3667 = fma(_3411, _3665, _3641);
    float _3669 = -_3645;
    float _3671 = fma(_3669, _3653, _3657);
    float _3673 = -_3431;
    float _3675 = _3659 * _3673;
    float _3677 = fma(_3429, _2725, _3663);
    float _3679 = -_3473;
    float _3681 = _3679 + 1.0;
    float _3683 = -_3459;
    float _3685 = _3659 * _3683;
    float _3687 = fma(_3609, _3311, _3675);
    float _3689 = _3413 * _3311;
    float _3691 = fma(_3681, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3473);
    float _3693 = -_3461;
    float _3695 = _3659 * _3693;
    float _3697 = fma(_3609, _3283, _3685);
    float _3699 = fma(_3437, _3397, _3689);
    float _3701 = _3271 * _3691;
    float _3703 = fma(_3609, _3313, _3695);
    float _3705 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2749);
    float _3707 = _3701 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    if (!_1714)
    {
        _1782 = 1.0;
    }
    float _3709 = _1782;
    float _3711 = fma(_3259, _2755, _3671);
    float _3713 = _3709;
    if (_1714)
    {
        bool _3715 = _1832 >= _1796;
        bool _3717 = isnan(_1832);
        bool _3719 = _3715 || _3717;
        bool _3721 = isnan(_1796);
        bool _3723 = _3719 || _3721;
        float _3725 = float(_3723);
        _3713 = _3725;
    }
    float _3727 = _3713;
    float _3729 = _2779 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3731 = _2761 * _3707;
    float _3733 = precise::clamp(_3731, 0.0, 1.0);
    float _3735 = -_2767;
    float _3737 = fma(_3249, _3735, _3629);
    float _3739 = _3705 + _1738;
    float _3741 = _3413 * _3313;
    float _3743 = _3727 * _2445;
    float _3745 = _3729 * _1834;
    float _3747 = -_3733;
    float _3749 = fma(_3747, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3751 = _3739 * 0.5;
    float _3753 = fma(_3437, _3407, _3741);
    float _3755 = _1845 * _3745;
    float _3757 = -_3743;
    float _3759 = fma(_3757, _3749, 1.0);
    float _3761 = precise::clamp(_3759, 0.0, 1.0);
    float _3763 = _2693 * _3745;
    float _3765 = -_3729;
    float _3767 = _3765 + 1.0;
    out.m_86.z = _3751;
    out.m_86.w = _1738;
    float _3769 = _3459 + _3467;
    float _3771 = _3431 + _3699;
    float _3773 = _3461 + _3753;
    float _3775 = fma(_2689, _3755, _1839);
    float _3777 = fma(_2691, _3755, _1841);
    float _3779 = _1845 * _3767;
    float _3781 = fma(_1845, _3763, _1843);
    out.m_88.x = _3697;
    out.m_88.y = _3687;
    out.m_88.z = _3703;
    bool _3783 = _2469 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3785 = isnan(_2469);
    bool _3787 = _3783 || _3785;
    bool _3789 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3791 = _3787 || _3789;
    float _3793 = _3761 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_90.x = _3737;
    out.m_90.y = _3677;
    out.m_90.z = _3667;
    out.m_90.w = _3711;
    out.gl_Position.x = _1774;
    out.gl_Position.y = _1776;
    out.gl_Position.z = _3705;
    out.gl_Position.w = _1738;
    out.m_92.x = _3793;
    float _3795 = _3739;
    float _3797 = _3767;
    float _3799 = _3751;
    float _3801 = _3749;
    float _3803 = _3761;
    float _3805 = _3755;
    if (!_3791)
    {
        _3795 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3807 = _3795;
    out.m_94.x = _3775;
    out.m_94.y = _3777;
    out.m_94.z = _3781;
    out.m_94.w = _3779;
    float _3809 = _3807;
    float _3811 = _3807;
    if (!_3791)
    {
        _3797 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3813 = _3797;
    float _3815 = _3813;
    float _3817 = _3813;
    if (!_3791)
    {
        _3799 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3819 = _3799;
    out.m_96.x = _3769;
    out.m_96.y = _3771;
    out.m_96.z = _3773;
    float _3821 = _3819;
    float _3823 = _3819;
    if (!_3791)
    {
        _3801 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3825 = _3801;
    float _3827 = _3825;
    float _3829 = _3825;
    if (!_3791)
    {
        _3803 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3831 = _3803;
    float _3833 = _3831;
    float _3835 = _3831;
    if (!_3791)
    {
        _3805 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3837 = _3805;
    bool _3839 = !_3791;
    float _3841 = _3837;
    float _3843 = _3837;
    if (!_3839)
    {
        bool _3845 = _2469 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3847 = isnan(_2469);
        bool _3849 = _3845 || _3847;
        bool _3851 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3853 = _3849 || _3851;
        if (!_3853)
        {
            float _3855 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3857 = _2469 + _3855;
            float _3859 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3861 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3859;
            float _3863 = 1.0 / _3861;
            float _3865 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3867 = _3865 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3869 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3871 = _3869 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3873 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3875 = _3873 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3877 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3879 = _3877 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3881 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3883 = _3881 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3885 = _3857 * _3863;
            float _3887 = precise::clamp(_3885, 0.0, 1.0);
            float _3889 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3891 = _3889 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3893 = fma(_3887, _3867, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3895 = fma(_3887, _3891, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3897 = fma(_3887, _3871, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3899 = fma(_3887, _3875, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3901 = fma(_3887, _3879, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3903 = fma(_3887, _3883, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3817 = _3893;
            _3835 = _3901;
            _3811 = _3895;
            _3829 = _3899;
            _3823 = _3897;
            _3843 = _3903;
            _3905 = true;
        }
        else
        {
            bool _3907 = _2469 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3909 = isnan(_2469);
            bool _3911 = _3907 || _3909;
            bool _3913 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3915 = _3911 || _3913;
            if (!_3915)
            {
                _3809 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3917 = _3809;
            _3811 = _3917;
            if (!_3915)
            {
                _3815 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3919 = _3815;
            _3817 = _3919;
            if (!_3915)
            {
                _3821 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3921 = _3821;
            _3823 = _3921;
            if (!_3915)
            {
                _3827 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3923 = _3827;
            _3829 = _3923;
            if (!_3915)
            {
                _3833 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3925 = _3833;
            _3835 = _3925;
            if (!_3915)
            {
                _3841 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3927 = _3841;
            bool _3929 = !_3915;
            _3843 = _3927;
            if (!_3929)
            {
                bool _3931 = _2469 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3933 = isnan(_2469);
                bool _3935 = _3931 || _3933;
                bool _3937 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3939 = _3935 || _3937;
                if (!_3939)
                {
                    float _3941 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3943 = _2469 + _3941;
                    float _3945 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3947 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3945;
                    float _3949 = 1.0 / _3947;
                    float _3951 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3953 = _3951 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3955 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3957 = _3955 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3959 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3961 = _3959 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3963 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3965 = _3963 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3967 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3969 = _3967 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3971 = _3943 * _3949;
                    float _3973 = precise::clamp(_3971, 0.0, 1.0);
                    float _3975 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3977 = _3975 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3979 = fma(_3973, _3953, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3981 = fma(_3973, _3977, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3983 = fma(_3973, _3957, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3985 = fma(_3973, _3961, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3987 = fma(_3973, _3965, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3989 = fma(_3973, _3969, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3817 = _3979;
                    _3835 = _3987;
                    _3811 = _3981;
                    _3829 = _3985;
                    _3823 = _3983;
                    _3843 = _3989;
                    _3905 = true;
                }
                else
                {
                    _3817 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3835 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3811 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3829 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3823 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3843 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3905 = false;
    float _3991 = _3817;
    float _3993 = _3835;
    float _3995 = _3811;
    float _3997 = _3829;
    float _3999 = _3823;
    float _4001 = _3843;
    float _4003 = fma(_3771, -0.5, 0.5);
    float _4005 = precise::clamp(_4003, 0.0, 1.0);
    float _4007 = -_3991;
    float _4009 = _4007 + _3993;
    float _4011 = -_3995;
    float _4013 = _4011 + _3997;
    float _4015 = -_3999;
    float _4017 = _4015 + _4001;
    bool _4019 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4021 = fma(_4005, _4009, _3991);
    float _4023 = fma(_4005, _4013, _3995);
    float _4025 = fma(_4005, _4017, _3999);
    float _4027 = _4021 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _4029 = fma(_4023, 0.298911988735198974609375, _4027);
    float _4031 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4033 = fma(_4025, 0.114477999508380889892578125, _4029);
    out.m_92.w = _4031;
    float _4035 = -_4033;
    float _4037 = _4023 + _4035;
    float _4039 = -_4033;
    float _4041 = _4021 + _4039;
    float _4043 = -_4033;
    float _4045 = _4025 + _4043;
    out.m_98.x = 0.0;
    float _4047 = fma(_4037, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4033);
    float _4049 = fma(_4041, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4033);
    float _4051 = fma(_4045, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4033);
    out.m_100.x = _4047;
    out.m_100.y = _4049;
    out.m_100.z = _4051;
    if (!_4019)
    {
        return out;
    }
    float _4053 = -_1626;
    float _4055 = _4053 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4057 = -_1628;
    float _4059 = _4057 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4061 = -_1630;
    float _4063 = _4061 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4065 = _4055 * _4055;
    float _4067 = fma(_4059, _4059, _4065);
    float _4069 = fma(_4063, _4063, _4067);
    float _4071 = sqrt(_4069);
    float _4073 = rsqrt(_4069);
    float _4075 = -_4071;
    float _4077 = _4075 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4079 = _4077 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4081 = precise::clamp(_4079, 0.0, 1.0);
    float _4083 = _4059 * _4073;
    float _4085 = _4055 * _4073;
    float _4087 = abs(_4081);
    float _4089 = log2(_4087);
    float _4091 = _4063 * _4073;
    float _4093 = _4083 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4095 = _3771 * _4085;
    float _4097 = -_4085;
    float _4099 = -_4093;
    float _4101 = fma(_4097, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4099);
    float _4103 = fma(_3769, _4083, _4095);
    float _4105 = -_4091;
    float _4107 = fma(_4105, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4101);
    float _4109 = fma(_3773, _4091, _4103);
    float _4111 = precise::clamp(_4109, 0.0, 1.0);
    float _4113 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4115 = _4107 + _4113;
    float _4117 = _4089 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4119 = _4115 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4121 = precise::clamp(_4119, 0.0, 1.0);
    float _4123 = exp2(_4117);
    float _4125 = _4123 * _4121;
    float _4127 = _4111 * _4125;
    float _4129 = _4127 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4131 = _4127 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4133 = _4127 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_98.x = _4129;
    out.m_98.y = _4131;
    out.m_98.z = _4133;
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
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3905 = false;
    bool _217 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _114 = in.m_56.w;
    float _116 = trunc(_114);
    int _119 = int(_116);
    bool _123 = _119 >= 1;
    float _125 = 0.0;
    float _127 = as_type<float>(_119);
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _125;
    float _131 = _129;
    if (!_123)
    {
        out.m_59.x = 0.0;
    }
    int _133 = 0;
    if (!_123)
    {
        float _135 = _129 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    int _139 = _137;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4192 = as_type<float>(_137);
        out.gl_Position.z = _4192;
    }
    if (!_123)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _141 = in.m_61.w;
    bool _143 = _141 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_141);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = -_141;
    float _155 = _153 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _157 = _155;
    if (_151)
    {
        float _159 = float(_119);
        _131 = _159;
    }
    float _161 = _131;
    bool _163 = _155 >= _161;
    bool _165 = !_151;
    bool _167 = _163 || _165;
    float _169 = _161;
    if (_167)
    {
        _169 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _169;
    if (_167)
    {
        out.m_59.x = 0.0;
    }
    if (_167)
    {
        float _173 = _171 * 5.0;
        _139 = as_type<int>(_173);
    }
    int _175 = _139;
    if (_167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4262 = as_type<float>(_175);
        out.gl_Position.z = _4262;
    }
    if (_167)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _177 = as_type<float>(int(gl_VertexIndex));
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _181 = as_type<int>(_177) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_177) & 2;
    bool _187 = _185 != 0;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_187;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_179;
    float _215;
    if (!_197)
    {
        float _199 = in.m_66.x;
        float _201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _203 = _199 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _205 = fma(_203, (*spvDescriptorSet0.vp_c9)._m0[12].x, _155);
        float _207 = _205 * _201;
        float _209 = floor(_207);
        float _211 = -_209;
        float _213 = _207 + _211;
        _215 = _213;
        _217 = true;
    }
    else
    {
        float _219 = float(_119);
        float _221 = 1.0 / _219;
        float _223 = _155 * _221;
        _215 = _223;
    }
    _217 = false;
    float _225 = _215;
    float _227 = in.m_56.x;
    float _229 = in.m_56.y;
    float _231 = in.m_56.z;
    float _233 = in.m_68.x;
    float _235 = in.m_68.y;
    float _237 = in.m_68.z;
    float _239 = in.m_68.w;
    float _241 = in.m_70.x;
    float _243 = in.m_70.y;
    float _245 = in.m_70.z;
    float _247 = in.m_70.w;
    float _249 = _229 * _235;
    float _251 = fma(_227, _233, _249);
    float _253 = _229 * _243;
    float _255 = fma(_231, _237, _251);
    float _257 = fma(_227, _241, _253);
    float _259 = _255 + _239;
    float _261 = fma(_231, _245, _257);
    float _263 = fma(_259, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _265 = _261 + _247;
    float _267 = floor(_263);
    float _269 = fma(_265, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _271 = floor(_269);
    float _273 = -_267;
    float _275 = _263 + _273;
    float _277 = -_271;
    float _279 = _269 + _277;
    float2 _4417 = float2(_275, _279);
    float _281 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4417, float2(0.0), isnan(_4417)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4417, float2(0.0), isnan(_4417)), level(0.0)).x;
    float _283 = in.m_72.x;
    float _285 = in.m_72.y;
    float _287 = in.m_72.z;
    float _289 = in.m_72.w;
    float _291 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _293 = log2(_291);
    float _295 = in.m_66.x;
    float _297 = in.m_66.y;
    float _299 = in.m_66.z;
    float _301 = in.m_66.w;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _303;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _309 = _307 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _317 = _315 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _319 = 1.0 / _305;
    int _321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _323 = _321 != 0;
    float _325 = 1.0 / _313;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _331 = _229 * _285;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _337 = 1.0 / _317;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _339;
    float _343 = fma(_227, _283, _331);
    float _345 = _295 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _349 = _225 + _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _353 = _225 + _351;
    float _355 = fma(_231, _287, _343);
    float _357 = _295 * 2.0;
    float _359 = 1.0 / _341;
    float _361 = -_327;
    float _363 = fma(_345, 2.0, _361);
    float _365 = _349 * _319;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _369 = _225 + _367;
    float _371 = _299 * 2.0;
    float _373 = _353 * _325;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _377 = _225 + _375;
    float _379 = _297 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _381 = 1.0 / _309;
    float _383 = _369 * _337;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _387 = _225 + _385;
    float _389 = fma(_379, -2.0, _329);
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _391;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _397 = _395 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _399 = floor(_357);
    float _401 = _387 * _359;
    float _403 = _299 + _295;
    float _405 = fma(_397, _383, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _407 = _403 + (-1.0);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _411 = _225 + _409;
    float _413 = floor(_371);
    float _415 = _377 * _381;
    float _417 = _295 + _297;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _419;
    float _423 = fma(_393, _373, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _429 = _417 + (-1.0);
    float _431 = 1.0 / _335;
    bool _433 = _399 > 0.0;
    float _435 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _437 = _399 >= 0.0;
    bool _439 = isnan(_399);
    bool _441 = _437 || _439;
    bool _443 = isnan(0.0);
    bool _445 = _441 || _443;
    float _447 = _299 + _297;
    int _449 = as_type<int>(_407);
    float _451 = _355;
    if (_323)
    {
        _449 = 0;
    }
    int _453 = _449;
    float _455 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _457 = _453;
    if (!_323)
    {
        _457 = 1;
    }
    int _459 = _457;
    float _461 = _447 + (-1.0);
    float _463 = _297 * 2.0;
    float _465 = fma(_421, _365, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _467 = _413 > 0.0;
    float _469 = fma(_427, _415, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    bool _471 = _413 >= 0.0;
    bool _473 = isnan(_413);
    bool _475 = _471 || _473;
    bool _477 = isnan(0.0);
    bool _479 = _475 || _477;
    float _481 = floor(_463);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _483;
    int _487 = _445 ? 0 : 1;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _491 = _489 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _493 = _459 != 1;
    float _495 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _497 = ~_487;
    int _499 = _497 + 1;
    int _501 = _499 + 1;
    float _503 = fma(_491, _383, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _505 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _507 = int(_505);
    int _509 = _501;
    if (!_433)
    {
        int _511 = ~_487;
        int _513 = _511 + 1;
        _509 = _513;
    }
    int _515 = _509;
    float _517 = fma(_485, _373, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _519 = _479 ? 0 : 1;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _521;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _525;
    bool _529 = _481 > 0.0;
    float _531 = _411 * _431;
    bool _533 = _481 >= 0.0;
    bool _535 = isnan(_481);
    bool _537 = _533 || _535;
    bool _539 = isnan(0.0);
    bool _541 = _537 || _539;
    float _543 = _355 + _289;
    float _545 = fma(_523, _365, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    int _547 = ~_519;
    int _549 = _547 + 1;
    int _551 = _549 + 1;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    int _557 = _551;
    if (!_467)
    {
        int _559 = ~_519;
        int _561 = _559 + 1;
        _557 = _561;
    }
    int _563 = _557;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _569 = _567 != 0;
    int _571 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _573 = _571 != 0;
    int _575 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _577 = _575 != 0;
    float _579 = fma(_527, _401, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    if (!_493)
    {
        _451 = _297;
    }
    float _581 = _451;
    float _583 = fma(_555, _415, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _585 = _581;
    if (_493)
    {
        _585 = _295;
    }
    float _587 = _585;
    float _589 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _591 = int(_589);
    float _593 = _543 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _595 = !_573;
    int _597 = _595 ? 0 : 1;
    float _599 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[83].z, _565);
    bool _601 = !_569;
    int _603 = _601 ? 0 : 1;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _605;
    bool _609 = !_577;
    int _611 = _609 ? 0 : 1;
    float _613 = _543 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _615 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _617 = _615 != 0;
    int _619 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _621 = _619 != 0;
    int _623 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _625 = _623 != 0;
    float _627 = fma(_607, _401, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _629 = float(_119);
    float _631 = fma(_259, (*spvDescriptorSet0.vp_c8)._m0[11].x, _593);
    if (!_493)
    {
        _127 = _299;
    }
    float _633 = _127;
    float _635 = fma(_259, (*spvDescriptorSet0.vp_c8)._m0[10].x, _613);
    float _637 = _541 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _639 = fma(_265, (*spvDescriptorSet0.vp_c8)._m0[11].z, _631);
    float _641 = _633;
    float _643 = _637;
    if (_493)
    {
        _641 = _297;
    }
    float _645 = _641;
    float _647 = 1.0 / _629;
    bool _649 = !_621;
    int _651 = _649 ? 0 : 1;
    float _653 = fma(_265, (*spvDescriptorSet0.vp_c8)._m0[10].z, _635);
    float _655 = _645 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _657 = float(_507);
    float _659 = _639 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _661 = ~as_type<int>(_637);
    int _663 = _661 + 1;
    int _665 = _663 + 1;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _669 = !_617;
    int _671 = _669 ? 0 : 1;
    float _673 = 1.0 / _657;
    int _675 = _665;
    if (!_529)
    {
        int _677 = ~as_type<int>(_637);
        int _679 = _677 + 1;
        _675 = _679;
    }
    int _681 = _675;
    float _683 = _653 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _685 = abs(_651);
    float _687 = -_155;
    float _689 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[76].x, _363);
    if (!_493)
    {
        _643 = _299;
    }
    float _691 = _643;
    float _693 = _683 + _659;
    float _695 = float(_563);
    float _697 = 1.0 / _659;
    float _699 = _691;
    if (_493)
    {
        _699 = _297;
    }
    float _701 = _699;
    float _703 = _647 * _155;
    float _705 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[76].y, _389);
    int _707 = abs(_671);
    float _709 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[83].w, _667);
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _713 = float(_515);
    float _715 = _293 * _155;
    float _717 = _701;
    if (!_493)
    {
        _717 = _297;
    }
    float _719 = _717;
    float _721 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[78].z, _711);
    float _723 = float(_685);
    float _725 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[82].z, _599);
    float _727 = exp2(_715);
    float _729 = _719;
    if (_493)
    {
        _729 = _295;
    }
    float _731 = _729;
    float _733 = _723 * _713;
    float _735 = float(_707);
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _739 = _731 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _741 = _735 * _695;
    float _743 = -_737;
    float _745 = fma(_739, 2.0, _743);
    float _747 = float(_591);
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _751 = in.m_74.x;
    float _753 = in.m_74.y;
    float _755 = in.m_74.z;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _759 = 1.0 + _757;
    float _761 = 1.0 / _747;
    bool _763 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _765 = isnan(1.0);
    bool _767 = _763 || _765;
    bool _769 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _771 = _767 || _769;
    float _773 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _775 = -_727;
    float _777 = _775 + 1.0;
    bool _779 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _781 = isnan(0.0);
    bool _783 = _779 || _781;
    bool _785 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _787 = _783 || _785;
    float _789 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[82].w, _709);
    float _791 = fma(_655, -2.0, _773);
    bool _793 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _795 = isnan(_225);
    bool _797 = _793 || _795;
    bool _799 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _801 = _797 || _799;
    float _803 = float(_801);
    float _805 = 1.0 / _759;
    float _807 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[78].w, _749);
    float _809 = -_155;
    float _811 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[81].x, _745);
    float _813 = _741 * (-2.0);
    bool _815 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _817 = isnan(_225);
    bool _819 = _815 || _817;
    bool _821 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _823 = _819 || _821;
    float _825 = float(_823);
    float _827 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[77].z, _721);
    float _829 = _673 * _155;
    float _831 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[77].w, _807);
    float _833 = _761 * _155;
    float _835 = _787 ? _777 : 0.0;
    float _837 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[81].y, _791);
    float _839 = fma(_455, _813, _455);
    float _841 = -_803;
    float _843 = _841 + 1.0;
    bool _845 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _847 = isnan(_225);
    bool _849 = _845 || _847;
    bool _851 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _853 = _849 || _851;
    float _855 = float(_853);
    float _857 = _693 * _697;
    float _859 = _857 * 0.5;
    bool _861 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _863 = isnan(_225);
    bool _865 = _861 || _863;
    bool _867 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _869 = _865 || _867;
    float _871 = float(_869);
    if (_771)
    {
        float _873 = _835 * _805;
        _157 = _873;
    }
    float _875 = _157;
    float _877 = -_825;
    float _879 = _877 + 1.0;
    float _881 = _825 * _843;
    float _883 = fma(_813, _751, _751);
    float _885 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _887 = _855 * _879;
    float _889 = -_855;
    float _891 = _889 + 1.0;
    float _893 = -_871;
    float _895 = _893 + 1.0;
    bool _897 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _899 = isnan(_225);
    bool _901 = _897 || _899;
    bool _903 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _905 = _901 || _903;
    float _907 = float(_905);
    float _909 = _543 + _885;
    float _911 = _871 * _891;
    bool _913 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _915 = isnan(_225);
    bool _917 = _913 || _915;
    bool _919 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _921 = _917 || _919;
    float _923 = float(_921);
    float _925 = _295 + (-0.5);
    bool _927 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _929 = isnan(_225);
    bool _931 = _927 || _929;
    bool _933 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _935 = _931 || _933;
    float _937 = float(_935);
    float _939 = _907 * _895;
    bool _941 = !_625;
    int _943 = _941 ? 0 : 1;
    float _945 = -_923;
    float _947 = _945 + 1.0;
    float _949 = -_907;
    float _951 = _949 + 1.0;
    int _953 = abs(_943);
    float _955 = _937 * _947;
    float _957 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[196].x, _883);
    float _959 = _923 * _951;
    float _961 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _963 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[30].w, _961);
    float _965 = _423 * _955;
    float _967 = float(_681);
    float _969 = _733 * (-2.0);
    float _971 = float(_953);
    float _973 = -_937;
    float _975 = _973 + 1.0;
    float _977 = _517 * _955;
    float _979 = fma(_495, _969, _495);
    float _981 = fma(_969, _753, _753);
    float _983 = _971 * _967;
    float _985 = _297 + (-0.5);
    float _987 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[143].x, _965);
    float _989 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[143].y, _977);
    float _991 = _983 * (-2.0);
    float _993 = fma(_839, _875, _957);
    float _995 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[196].y, _981);
    float _997 = fma(_405, _959, _987);
    float _999 = fma(_503, _959, _989);
    float _1001 = fma(_435, _991, _435);
    float _1003 = 1.0 / _963;
    float _1005 = in.m_76.x;
    float _1007 = in.m_76.y;
    float _1009 = fma(_991, _755, _755);
    float _1011 = _299 + (-0.5);
    float _1013 = fma(_545, _939, _999);
    float _1015 = fma(_465, _939, _997);
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _1019 = _1017 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _1021 = fma(_1011, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1009);
    float _1023 = fma(_583, _911, _1013);
    float _1025 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _1027 = _1025 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _1029 = fma(_469, _911, _1015);
    float _1031 = fma(_1019, _531, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _1033 = fma(_579, _887, _1023);
    float _1035 = fma(_1027, _531, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _1037 = fma(_627, _887, _1029);
    float _1039 = fma(_1001, _875, _1021);
    float _1041 = fma(_979, _875, _995);
    float _1043 = fma(_1031, _881, _1033);
    float _1045 = fma(_1035, _881, _1037);
    float _1047 = _1039 * 0.15915493667125701904296875;
    float _1049 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1051 = _1003 * _1049;
    float _1053 = _993 * 0.15915493667125701904296875;
    float _1055 = _1041 * 0.15915493667125701904296875;
    float _1057 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[149].y, _1043);
    float _1059 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[149].x, _1045);
    float _1061 = _909 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1063 = _909 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1065 = _1047 * 6.283185482025146484375;
    float _1067 = cos(_1065);
    bool _1069 = _1051 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1071 = _1059 * _1005;
    bool _1073 = _1051 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1075 = fma(_259, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1061);
    float _1077 = fma(_259, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1063);
    float _1079 = _1057 * _1007;
    float _1081 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _1083 = _1053 * 6.283185482025146484375;
    float _1085 = sin(_1083);
    float _1087 = _1071 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1089 = fma(_265, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1075);
    float _1091 = fma(_265, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1077);
    float _1093 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _1095 = _1079 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1097 = _1087 * _1081;
    float _1099 = _1089 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1101 = _1053 * 6.283185482025146484375;
    float _1103 = cos(_1101);
    float _1105 = _1091 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _1107 = !_1069;
    int _1109 = _1107 ? 0 : 1;
    float _1111 = _1095 * _1093;
    float _1113 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1115 = 2;
    if (!_1069)
    {
        _1115 = 1;
    }
    int _1117 = _1115;
    float _1119 = _1055 * 6.283185482025146484375;
    float _1121 = cos(_1119);
    int _1123 = _1117;
    if (!_1073)
    {
        _1123 = _1109;
    }
    int _1125 = _1123;
    int _1127 = _1125 << 6;
    float _1129 = _1047 * 6.283185482025146484375;
    float _1131 = sin(_1129);
    int _1133 = _1127 + 72;
    uint _1136 = uint(int(uint(_1133) >> uint(2)));
    uint _1138 = uint(int(uint(int(_1136)) >> uint(2)));
    int _1140 = int(_1136) & 3;
    float _1142 = (*spvDescriptorSet0.vp_c15)._m0[int(_1138)][_1140];
    int _1144 = int(_1136) + 1;
    uint _1146 = uint(int(uint(_1144) >> uint(2)));
    int _1148 = _1144 & 3;
    float _1150 = (*spvDescriptorSet0.vp_c15)._m0[int(_1146)][_1148];
    float _1152 = _1055 * 6.283185482025146484375;
    float _1154 = sin(_1152);
    float _1156 = _1085 * _1121;
    float _1158 = _1103 * _1121;
    float _1160 = _1121 * _1067;
    float _1162 = trunc(_1099);
    int _1164 = int(_1162);
    float _1166 = -_1111;
    float _1168 = _1131 * _1166;
    int _1170 = _1127 + 56;
    uint _1172 = uint(int(uint(_1170) >> uint(2)));
    uint _1174 = uint(int(uint(int(_1172)) >> uint(2)));
    int _1176 = int(_1172) & 3;
    float _1178 = (*spvDescriptorSet0.vp_c15)._m0[int(_1174)][_1176];
    int _1180 = int(_1172) + 1;
    uint _1182 = uint(int(uint(_1180) >> uint(2)));
    int _1184 = _1180 & 3;
    float _1186 = (*spvDescriptorSet0.vp_c15)._m0[int(_1182)][_1184];
    float _1188 = fma(_1160, _1097, _1168);
    float _1190 = trunc(_1105);
    int _1192 = int(_1190);
    float _1194 = _1103 * _1154;
    float _1196 = _1085 * _1154;
    float _1198 = _1103 * _1067;
    float _1200 = _1085 * _1067;
    int _1202 = _1127 + 96;
    uint _1204 = uint(int(uint(_1202) >> uint(2)));
    uint _1206 = uint(int(uint(int(_1204)) >> uint(2)));
    int _1208 = int(_1204) & 3;
    float _1210 = (*spvDescriptorSet0.vp_c15)._m0[int(_1206)][_1208];
    int _1212 = int(_1204) + 1;
    uint _1214 = uint(int(uint(_1212) >> uint(2)));
    int _1216 = _1212 & 3;
    float _1218 = (*spvDescriptorSet0.vp_c15)._m0[int(_1214)][_1216];
    float _1220 = -_1194;
    float _1222 = fma(_1131, _1156, _1220);
    float _1224 = -_1156;
    float _1226 = fma(_1131, _1194, _1224);
    float _1228 = fma(_1131, _1158, _1196);
    float _1230 = _1198 * _1111;
    float _1232 = _1200 * _1111;
    int _1234 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1236 = _1164 + _1234;
    int _1238 = _1236 + 1;
    float _1240 = _1154 * _1067;
    float _1242 = fma(_1228, _1097, _1230);
    float _1244 = fma(_1222, _1097, _1232);
    bool _1246 = _1238 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1248 = _1127 + 104;
    uint _1250 = uint(int(uint(_1248) >> uint(2)));
    uint _1252 = uint(int(uint(int(_1250)) >> uint(2)));
    int _1254 = int(_1250) & 3;
    float _1256 = (*spvDescriptorSet0.vp_c15)._m0[int(_1252)][_1254];
    int _1258 = int(_1250) + 1;
    uint _1260 = uint(int(uint(_1258) >> uint(2)));
    int _1262 = _1258 & 3;
    float _1264 = (*spvDescriptorSet0.vp_c15)._m0[int(_1260)][_1262];
    int _1266 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1268 = _1192 + _1266;
    int _1270 = _1268 + 1;
    float _1272 = fma(_1226, _1113, _1242);
    float _1274 = fma(_1131, _1196, _1158);
    float _1276 = fma(_1240, _1113, _1188);
    int _1278 = _1238 | _1270;
    float _1280 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1282 = fma(_1274, _1113, _1244);
    int _1284 = _1127 + 48;
    uint _1286 = uint(int(uint(_1284) >> uint(2)));
    uint _1288 = uint(int(uint(int(_1286)) >> uint(2)));
    int _1290 = int(_1286) & 3;
    float _1292 = (*spvDescriptorSet0.vp_c15)._m0[int(_1288)][_1290];
    int _1294 = int(_1286) + 1;
    uint _1296 = uint(int(uint(_1294) >> uint(2)));
    int _1298 = _1294 & 3;
    float _1300 = (*spvDescriptorSet0.vp_c15)._m0[int(_1296)][_1298];
    bool _1302 = _1278 < 0;
    bool _1304 = _1302 || _1246;
    float _1306 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1308 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1280);
    float _1310 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1312 = _1270 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1314 = _1312 || _1304;
    float _1316 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1306);
    float _1318 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1308);
    int _1320 = _1127 + 64;
    uint _1322 = uint(int(uint(_1320) >> uint(2)));
    uint _1324 = uint(int(uint(int(_1322)) >> uint(2)));
    int _1326 = int(_1322) & 3;
    float _1328 = (*spvDescriptorSet0.vp_c15)._m0[int(_1324)][_1326];
    int _1330 = int(_1322) + 1;
    uint _1332 = uint(int(uint(_1330) >> uint(2)));
    int _1334 = _1330 & 3;
    float _1336 = (*spvDescriptorSet0.vp_c15)._m0[int(_1332)][_1334];
    float _1338 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1310);
    float _1340 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1316);
    float _1342 = _1318 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1344 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1338);
    float _1346 = _1340 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1348 = _265 + _1342;
    int _1350 = _1127 + 80;
    uint _1352 = uint(int(uint(_1350) >> uint(2)));
    uint _1354 = uint(int(uint(int(_1352)) >> uint(2)));
    int _1356 = int(_1352) & 3;
    float _1358 = (*spvDescriptorSet0.vp_c15)._m0[int(_1354)][_1356];
    int _1360 = int(_1352) + 1;
    uint _1362 = uint(int(uint(_1360) >> uint(2)));
    int _1364 = _1360 & 3;
    float _1366 = (*spvDescriptorSet0.vp_c15)._m0[int(_1362)][_1364];
    float _1368 = _1344 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1370 = _1238;
    float _1372 = _1348;
    if (!_1314)
    {
        int _1374 = _1270 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1376 = _1374 + _1238;
        _1370 = _1376;
    }
    int _1378 = _1370;
    float _1380 = _259 + _1346;
    float _1382 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1384 = _1348 + _1382;
    float _1386 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1388 = _1380 + _1386;
    float _1390 = _1384 * _1384;
    int _1392 = 0;
    int _1394 = as_type<int>(_1390);
    float _1396 = _1380;
    float _1398 = as_type<float>(_1378);
    if (!_1314)
    {
        int _1400 = _1378 << 2;
        _1392 = _1400;
    }
    int _1402 = _1392;
    float _1404 = fma(_1388, _1388, _1390);
    int _1406 = _1402;
    if (!_1314)
    {
        uint _1408 = uint(int(uint(_1378) >> uint(2)));
        _1394 = int(_1408);
    }
    int _1410 = _1394;
    int _1412 = _1410;
    if (!_1314)
    {
        int _1414 = 12 & _1402;
        _1406 = _1414;
    }
    int _1416 = _1406;
    float _1418 = sqrt(_1404);
    if (!_1314)
    {
        int _1420 = _1410 << 4;
        int _1422 = _1420 + _1416;
        _1412 = _1422;
    }
    int _1424 = _1412;
    float _1426 = _909 * _1218;
    float _1428 = fma(_259, _1210, _1426);
    float _1430 = fma(_265, _1256, _1428);
    float _1432 = _1430 + _1264;
    float _1434 = _909 * _1300;
    bool _1436 = _1418 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1438 = _543 + _1368;
    float _1440 = fma(_259, _1292, _1434);
    float _1442 = 1.0 / _1432;
    int _1444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1446 = _1444 != 0;
    int _1448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1450 = _1448 != 0;
    int _1452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1454 = _1452 != 0;
    int _1456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1458 = _1456 != 0;
    float _1460 = _909 * _1336;
    float _1462 = fma(_265, _1178, _1440);
    float _1464 = fma(_259, _1328, _1460);
    bool _1466 = !_1450;
    int _1468 = _1466 ? 0 : 1;
    float _1470 = _1292;
    float _1472 = _1464;
    float _1474 = _1328;
    float _1476 = _1418;
    if (!_1314)
    {
        float _1478 = floor(_1099);
        _1470 = _1478;
    }
    float _1480 = _1470;
    float _1482 = _1462 + _1186;
    float _1484 = fma(_265, _1142, _1464);
    bool _1486 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1488 = isnan(0.5);
    bool _1490 = _1486 || _1488;
    bool _1492 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1494 = _1490 || _1492;
    bool _1496 = !_1446;
    int _1498 = _1496 ? 0 : 1;
    float _1500 = _1484 + _1150;
    bool _1502 = !_1454;
    int _1504 = _1502 ? 0 : 1;
    bool _1506 = !_1458;
    int _1508 = _1506 ? 0 : 1;
    if (!_1436)
    {
        _1472 = _1438;
    }
    float _1510 = _1472;
    bool _1512 = !_1436;
    float _1514 = _1510;
    if (!_1512)
    {
        float _1516 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1518 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1520 = _1418 + _1518;
        float _1522 = _1438 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1524 = rsqrt(_1404);
        float _1526 = _1520 * _1516;
        float _1528 = _1526 * 0.15915493667125701904296875;
        float _1530 = _1528 * 6.283185482025146484375;
        float _1532 = cos(_1530);
        float _1534 = _1528 * 6.283185482025146484375;
        float _1536 = sin(_1534);
        float _1538 = _1532 + (-1.0);
        float _1540 = _1538 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1542 = fma(_1536, _1522, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1544 = fma(_1438, _1532, _1540);
        float _1546 = _1524 * _1542;
        float _1548 = fma(_1388, _1546, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1550 = fma(_1384, _1546, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1396 = _1548;
        _1372 = _1550;
        _1514 = _1544;
        _1474 = _1540;
        _1476 = _1528;
    }
    float _1552 = _1396;
    float _1554 = _1372;
    float _1556 = _1514;
    float _1558 = _1474;
    float _1560 = _1476;
    float _1562 = _1558;
    float _1564 = _1560;
    float _1566 = _1556;
    if (_1494)
    {
        _1562 = _1552;
    }
    float _1568 = _1562;
    float _1570 = _1568;
    if (_1494)
    {
        _1564 = _1554;
    }
    float _1572 = _1564;
    float _1574 = _1572;
    if (!_1494)
    {
        float _1576 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1578 = _543 + _1576;
        float _1580 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1582 = _259 + _1580;
        float _1584 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1586 = -_265;
        float _1588 = _1586 + _1554;
        float _1590 = _1578 * _1578;
        float _1592 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1594 = _265 + _1592;
        float _1596 = fma(_1582, _1582, _1590);
        float _1598 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1600 = fma(_1594, _1594, _1596);
        float _1602 = sqrt(_1600);
        float _1604 = _1584 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1606 = precise::min(_1602, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1608 = _1606 * _1598;
        float _1610 = -_543;
        float _1612 = _1610 + _1556;
        float _1614 = _1604 * _1608;
        float _1616 = -_259;
        float _1618 = _1616 + _1552;
        float _1620 = fma(_1612, _1614, _543);
        float _1622 = fma(_1618, _1614, _259);
        float _1624 = fma(_1588, _1614, _265);
        _1566 = _1620;
        _1570 = _1622;
        _1574 = _1624;
    }
    float _1626 = _1566;
    float _1628 = _1570;
    float _1630 = _1574;
    int _1632 = _1127 + 88;
    uint _1634 = uint(int(uint(_1632) >> uint(2)));
    uint _1636 = uint(int(uint(int(_1634)) >> uint(2)));
    int _1638 = int(_1634) & 3;
    float _1640 = (*spvDescriptorSet0.vp_c15)._m0[int(_1636)][_1638];
    int _1642 = int(_1634) + 1;
    uint _1644 = uint(int(uint(_1642) >> uint(2)));
    int _1646 = _1642 & 3;
    float _1648 = (*spvDescriptorSet0.vp_c15)._m0[int(_1644)][_1646];
    float _1650 = _1626 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1652 = _1626 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1654 = _1482 * _1442;
    float _1656 = _1626 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1658 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1650);
    float _1660 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1652);
    float _1662 = _1626 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1664 = _1552;
    if (!_1314)
    {
        int _1666 = _1424 + 400;
        uint _1668 = uint(int(uint(_1666) >> uint(2)));
        uint _1670 = uint(int(uint(int(_1668)) >> uint(2)));
        int _1672 = int(_1668) & 3;
        float _1674 = (*spvDescriptorSet0.vp_c15)._m0[int(_1670)][_1672];
        _1664 = _1674;
    }
    float _1676 = _1664;
    float _1678 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1658);
    bool _1680 = _1654 >= 0.0;
    float _1682 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1656);
    float _1684 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1660);
    float _1686 = _1678 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1688 = _1500 * _1442;
    bool _1690 = _1654 <= 1.0;
    bool _1692 = _1690 && _1680;
    float _1694 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1682);
    float _1696 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1662);
    float _1698 = _1684 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1700 = _1686 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1702 = _1688 >= 0.0;
    bool _1704 = _1702 && _1692;
    float _1706 = _1694 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1708 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1696);
    float _1710 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1700);
    bool _1712 = _1688 <= 1.0;
    bool _1714 = _1712 && _1704;
    float _1716 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1718 = _1706 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1720 = _1708 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1722 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1710);
    float _1724 = _909 * _1366;
    float _1726 = _1142;
    float _1728 = _1716;
    if (!_1314)
    {
        float _1730 = floor(_1105);
        _1726 = _1730;
    }
    float _1732 = _1726;
    float _1734 = -_1718;
    float _1736 = fma(_1734, _1716, 1.0);
    float _1738 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1722);
    float _1740 = fma(_259, _1358, _1724);
    float _1742 = _1686 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1744 = _1686 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    if (_1714)
    {
        float _1746 = float(_1125);
        _1728 = _1746;
    }
    float _1748 = _1728;
    float _1750 = log2(_1736);
    float _1752 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1742);
    float _1754 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1744);
    float _1756 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1752);
    float _1758 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1754);
    float _1760 = 1.0 / _1738;
    float _1762 = 0.0;
    float _1764 = _1752;
    if (!_1314)
    {
        float _1766 = -_1732;
        float _1768 = _1105 + _1766;
        _1762 = _1768;
    }
    float _1770 = _1762;
    float _1772 = fma(_265, _1640, _1740);
    float _1774 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1756);
    float _1776 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1758);
    float _1778 = _1772 + _1648;
    float _1780 = _1742;
    float _1782 = _1774;
    if (_1714)
    {
        float _1784 = rint(_1748);
        float _1786 = precise::max(_1784, 0.0);
        uint _1788 = uint(_1786);
        uint _1790 = clamp(_1788, 0u, 65535u);
        _1780 = as_type<float>(_1790);
    }
    float _1792 = _1780;
    float _1794 = _1750 * 0.693147182464599609375;
    float _1796 = _1778 * _1442;
    float _1798 = _1794 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1800 = _1778;
    if (!_1314)
    {
        float _1802 = rint(_1676);
        float _1804 = precise::max(_1802, 0.0);
        uint _1806 = uint(_1804);
        uint _1808 = clamp(_1806, 0u, 65535u);
        _1800 = as_type<float>(_1808);
    }
    float _1810 = _1800;
    float _1812 = _1774 * _1760;
    float _1814 = _1776 * _1760;
    float _1816 = fma(_1812, 0.5, 0.5);
    float _1818 = fma(_1814, -0.5, 0.5);
    float _1820 = _1812;
    if (!_1314)
    {
        float _1822 = -_1480;
        float _1824 = _1099 + _1822;
        _1820 = _1824;
    }
    float _1826 = _1820;
    float _1828 = _1480;
    if (_1714)
    {
        float3 _6903 = float3(_1654, _1688, float(as_type<int>(_1792)));
        float3 _6907 = select(_6903, float3(0.0), isnan(_6903));
        float _1830 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6907.xy, uint(rint(_6907.z)), _1796, level(0.0));
        _1828 = _1830;
    }
    float _1832 = _1828;
    float3 _6917 = float3(_1816, _1818, _1798);
    float _1834 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6917, float3(0.0), isnan(_6917)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6917, float3(0.0), isnan(_6917)), level(0.0)).x;
    float3 _6926 = float3(_1816, _1818, _1798);
    float4 _1837 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6926, float3(0.0), isnan(_6926)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6926, float3(0.0), isnan(_6926)), level(0.0)).xyzw;
    float _1839 = _1837.x;
    float _1841 = _1837.y;
    float _1843 = _1837.z;
    float _1845 = _1837.w;
    float _1847 = _1770;
    if (!_1314)
    {
        float3 _6949 = float3(_1826, _1770, float(as_type<int>(_1810)));
        float3 _6951 = select(_6949, float3(0.0), isnan(_6949));
        float _1849 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6951.xy, uint(rint(_6951.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6951.xy, uint(rint(_6951.z)), level(0.0)).x;
        _1847 = _1849;
    }
    float _1851 = _1847;
    float _1853 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1855 = int(_1853);
    int _1857 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1859 = _1857 != 0;
    int _1861 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1863 = _1861 != 0;
    int _1865 = abs(_597);
    int _1867 = abs(_1468);
    float _1869 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1871 = int(_1869);
    int _1873 = abs(_1498);
    int _1875 = abs(_1504);
    int _1877 = abs(_1508);
    float _1879 = as_type<float>(_1877);
    if (_1859)
    {
        float _1881 = in.m_66.x;
        _1764 = _1881;
    }
    float _1883 = _1764;
    float _1885 = float(uint(_1855));
    float _1887 = trunc(_829);
    int _1889 = int(_1887);
    float _1891 = _1883;
    if (!_1859)
    {
        float _1893 = in.m_66.y;
        _1891 = _1893;
    }
    float _1895 = _1891;
    int _1897 = ~_1855;
    int _1899 = _1897 + 1;
    float _1901 = float(uint(_1871));
    float _1903 = 1.0 / _1885;
    int _1905 = ~_1871;
    int _1907 = _1905 + 1;
    float _1909 = 1.0 / _1901;
    float _1911 = trunc(_833);
    int _1913 = int(_1911);
    int _1915 = as_type<int>(_1903) + (-2);
    float _1917 = float(uint(_1889));
    float _1919 = float(_1889);
    int _1921 = as_type<int>(_1909) + (-2);
    float _1923 = as_type<float>(_1915) * _1917;
    float _1925 = _1917;
    if (_1859)
    {
        _1925 = 1.0;
    }
    float _1927 = _1925;
    float _1929 = _1927;
    if (!_1859)
    {
        _1929 = 7.345489978790283203125;
    }
    float _1931 = _1929;
    float _1933 = trunc(_1923);
    float _1935 = precise::max(_1933, 0.0);
    uint _1937 = uint(_1935);
    float _1939 = float(uint(_1913));
    float _1941 = _1931 * _295;
    float _1943 = as_type<float>(_1921) * _1939;
    float _1945 = _1939;
    if (_1859)
    {
        _1945 = 1.0;
    }
    float _1947 = _1945;
    float _1949 = floor(_1941);
    float _1951 = _1947;
    if (!_1859)
    {
        _1951 = 1.2345600128173828125;
    }
    float _1953 = _1951;
    float _1955 = _1953 * _1895;
    float _1957 = trunc(_1943);
    float _1959 = precise::max(_1957, 0.0);
    uint _1961 = uint(_1959);
    int _1963 = _1899 * int(_1937);
    int _1965 = _1963 + _1889;
    float _1967 = float(uint(_1965));
    float _1969 = floor(_1955);
    float _1971 = float(_1855);
    float _1973 = as_type<float>(_1915) * _1967;
    int _1975 = _1907 * int(_1961);
    int _1977 = _1975 + _1913;
    float _1979 = trunc(_1973);
    float _1981 = precise::max(_1979, 0.0);
    uint _1983 = uint(_1981);
    float _1985 = float(uint(_1977));
    float _1987 = -_1969;
    float _1989 = _1955 + _1987;
    float _1991 = float(_1871);
    float _1993 = as_type<float>(_1921) * _1985;
    float _1995 = -_1949;
    float _1997 = _1941 + _1995;
    int _1999 = ~_1855;
    int _2001 = _1999 + 1;
    bool _2003 = _1919 >= _1971;
    bool _2005 = isnan(_1919);
    bool _2007 = _2003 || _2005;
    bool _2009 = isnan(_1971);
    bool _2011 = _2007 || _2009;
    float _2013 = float(_2011);
    float _2015 = _1989 * _1991;
    float _2017 = trunc(_1993);
    float _2019 = precise::max(_2017, 0.0);
    uint _2021 = uint(_2019);
    int _2023 = int(_1937) + int(_1983);
    float _2025 = _1997 * _1971;
    float _2027 = _1971 * _703;
    float _2029 = _1991 * _703;
    int _2031 = _2001 * _2023;
    int _2033 = _2031 + _1889;
    float _2035 = trunc(_2013);
    int _2037 = int(_2035);
    bool _2039 = uint(_2033) >= uint(_1855);
    bool _2041 = !_2039;
    int _2043 = _2041 ? 0 : (-1);
    float _2045 = trunc(_2025);
    int _2047 = int(_2045);
    int _2049 = int(_1961) + int(_2021);
    float _2051 = float(_1913);
    int _2053 = ~_1871;
    int _2055 = _2053 + 1;
    bool _2057 = _2051 >= _1991;
    bool _2059 = isnan(_2051);
    bool _2061 = _2057 || _2059;
    bool _2063 = isnan(_1991);
    bool _2065 = _2061 || _2063;
    float _2067 = float(_2065);
    float _2069 = trunc(_2015);
    int _2071 = int(_2069);
    int _2073 = _2055 * _2049;
    int _2075 = _2073 + _1913;
    int _2077 = ~_2023;
    int _2079 = _2077 + _2043;
    int _2081 = _2079 + 1;
    int _2083 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2085 = _2083 != 0;
    int _2087 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2089 = _2087 != 0;
    float _2091 = trunc(_2067);
    int _2093 = int(_2091);
    bool _2095 = uint(_2075) >= uint(_1871);
    bool _2097 = !_2085;
    int _2099 = _2097 ? 0 : 1;
    bool _2101 = !_2089;
    int _2103 = _2101 ? 0 : 1;
    int _2105 = abs(_2099);
    int _2107 = _1855 * _2081;
    int _2109 = _2107 + _1889;
    bool _2111 = !_2095;
    int _2113 = _2111 ? 0 : (-1);
    float _2115 = trunc(_2027);
    int _2117 = int(_2115);
    int _2119 = abs(_2103);
    bool _2121 = _1855 == 0;
    int _2123 = ~_2049;
    int _2125 = _2123 + _2113;
    int _2127 = _2125 + 1;
    int _2129 = _2047 * _2105;
    int _2131 = _2129 + _1889;
    float _2133 = trunc(_2029);
    int _2135 = int(_2133);
    int _2137 = ~_2037;
    int _2139 = _2137 + 1;
    int _2141 = _2139 + 1;
    int _2143 = _1871 * _2127;
    int _2145 = _2143 + _1913;
    bool _2147 = !_2121;
    int _2149 = _2147 ? _2109 : (-1);
    int _2151 = _2071 * _2119;
    int _2153 = _2151 + _1913;
    bool _2155 = _1871 == 0;
    int _2157 = ~_2093;
    int _2159 = _2157 + 1;
    int _2161 = _2159 + 1;
    int _2163 = _2149 * _2141;
    bool _2165 = !_2155;
    int _2167 = _2165 ? _2145 : (-1);
    int _2169 = _1855 + (-1);
    int _2171 = _1871 + (-1);
    int _2173 = _2167 * _2161;
    int _2175 = _2037 * _2169;
    int _2177 = _2175 + _2163;
    int _2179 = _2093 * _2171;
    int _2181 = _2179 + _2173;
    int _2183 = abs(_603);
    int _2185 = _2177 * _1865;
    bool _2187 = !_1863;
    int _2189 = _2187 ? 0 : 1;
    int _2191 = abs(_611);
    int _2193 = _2117 * _2183;
    int _2195 = _2193 + _2185;
    int _2197 = abs(_2189);
    int _2199 = _2181 * _1867;
    int _2201 = _2131 * _2191;
    int _2203 = _2201 + _2195;
    int _2205 = _2135 * _1873;
    int _2207 = _2205 + _2199;
    int _2209 = ~_1871;
    int _2211 = _2209 + 1;
    int _2213 = _2047 * _2197;
    int _2215 = _2213 + _2203;
    int _2217 = _2153 * _1875;
    int _2219 = _2217 + _2207;
    int _2221 = ~_1855;
    int _2223 = _2221 + 1;
    float _2225 = float(uint(_2215));
    int _2227 = _2071 * _1877;
    int _2229 = _2227 + _2219;
    int _2231 = ~_1855;
    int _2233 = _2231 + 1;
    int _2235 = ~_1871;
    int _2237 = _2235 + 1;
    float _2239 = as_type<float>(_1915) * _2225;
    float _2241 = float(uint(_2229));
    float _2243 = float(uint(_2131));
    float _2245 = trunc(_2239);
    float _2247 = precise::max(_2245, 0.0);
    uint _2249 = uint(_2247);
    float _2251 = as_type<float>(_1921) * _2241;
    float _2253 = as_type<float>(_1915) * _2243;
    float _2255 = trunc(_2251);
    float _2257 = precise::max(_2255, 0.0);
    uint _2259 = uint(_2257);
    int _2261 = _2223 * int(_2249);
    int _2263 = _2261 + _2215;
    float _2265 = trunc(_2253);
    float _2267 = precise::max(_2265, 0.0);
    uint _2269 = uint(_2267);
    float _2271 = float(uint(_2263));
    int _2273 = _2211 * int(_2259);
    int _2275 = _2273 + _2229;
    float _2277 = as_type<float>(_1915) * _2271;
    float _2279 = float(uint(_2275));
    int _2281 = ~_1855;
    int _2283 = _2281 + 1;
    float _2285 = trunc(_2277);
    float _2287 = precise::max(_2285, 0.0);
    uint _2289 = uint(_2287);
    float _2291 = as_type<float>(_1921) * _2279;
    float _2293 = float(uint(_2153));
    int _2295 = _2283 * int(_2269);
    int _2297 = _2295 + _2131;
    float _2299 = trunc(_2291);
    float _2301 = precise::max(_2299, 0.0);
    uint _2303 = uint(_2301);
    float _2305 = as_type<float>(_1921) * _2293;
    float _2307 = float(uint(_2297));
    int _2309 = ~_1871;
    int _2311 = _2309 + 1;
    float _2313 = as_type<float>(_1915) * _2307;
    float _2315 = trunc(_2305);
    float _2317 = precise::max(_2315, 0.0);
    uint _2319 = uint(_2317);
    int _2321 = int(_2249) + int(_2289);
    int _2323 = int(_2259) + int(_2303);
    int _2325 = _2233 * _2321;
    int _2327 = _2325 + _2215;
    float _2329 = trunc(_2313);
    float _2331 = precise::max(_2329, 0.0);
    uint _2333 = uint(_2331);
    int _2335 = _2237 * _2323;
    int _2337 = _2335 + _2229;
    bool _2339 = uint(_2327) >= uint(_1855);
    int _2341 = _2311 * int(_2319);
    int _2343 = _2341 + _2153;
    bool _2345 = !_2339;
    int _2347 = _2345 ? 0 : (-1);
    bool _2349 = uint(_2337) >= uint(_1871);
    float _2351 = float(uint(_2343));
    int _2353 = ~_2321;
    int _2355 = _2353 + _2347;
    int _2357 = _2355 + 1;
    bool _2359 = !_2349;
    int _2361 = _2359 ? 0 : (-1);
    float _2363 = as_type<float>(_1921) * _2351;
    int _2365 = int(_2269) + int(_2333);
    int _2367 = _1855 * _2357;
    int _2369 = _2367 + _2215;
    int _2371 = ~_2323;
    int _2373 = _2371 + _2361;
    int _2375 = _2373 + 1;
    float _2377 = as_type<float>(_2321);
    if (_1314)
    {
        _2377 = 1.0;
    }
    float _2379 = _2377;
    float _2381 = _2379;
    if (!_1314)
    {
        int _2383 = _1378 << 4;
        int _2385 = _2383 + 2048;
        uint _2387 = uint(int(uint(_2385) >> uint(2)));
        uint _2389 = uint(int(uint(int(_2387)) >> uint(2)));
        int _2391 = int(_2387) & 3;
        float _2393 = (*spvDescriptorSet0.vp_c15)._m0[int(_2389)][_2391];
        int _2395 = int(_2387) + 1;
        uint _2397 = uint(int(uint(_2395) >> uint(2)));
        int _2399 = _2395 & 3;
        float _2401 = (*spvDescriptorSet0.vp_c15)._m0[int(_2397)][_2399];
        int _2403 = _2385 + 8;
        uint _2405 = uint(int(uint(_2403) >> uint(2)));
        uint _2407 = uint(int(uint(int(_2405)) >> uint(2)));
        int _2409 = int(_2405) & 3;
        float _2411 = (*spvDescriptorSet0.vp_c15)._m0[int(_2407)][_2409];
        int _2413 = int(_2405) + 1;
        uint _2415 = uint(int(uint(_2413) >> uint(2)));
        int _2417 = _2413 & 3;
        float _2419 = (*spvDescriptorSet0.vp_c15)._m0[int(_2415)][_2417];
        float _2421 = _909 * _2401;
        float _2423 = fma(_259, _2393, _2421);
        float _2425 = fma(_265, _2411, _2423);
        float _2427 = _2425 + _2419;
        float _2429 = precise::clamp(_2427, 0.0, 1.0);
        float _2431 = -_2429;
        float _2433 = _2431 + _1851;
        float _2435 = fma(_2433, 500.0, 1.5);
        float _2437 = exp2(_2435);
        float _2439 = 0.0 + _2437;
        float _2441 = precise::clamp(_2439, 0.0, 1.0);
        _1398 = as_type<float>(_2385);
        _2381 = _2441;
    }
    float _2443 = _1398;
    float _2445 = _2381;
    float _2447 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2449 = _1626 + _2447;
    float _2451 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2453 = _1628 + _2451;
    float _2455 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2457 = _1630 + _2455;
    float _2459 = _2449 * _2449;
    float _2461 = fma(_2453, _2453, _2459);
    float _2463 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2465 = fma(_2457, _2457, _2461);
    float _2467 = rsqrt(_2465);
    float _2469 = sqrt(_2465);
    float _2471 = _2467 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2473 = _2453 * _2471;
    float _2475 = _2457 * _2471;
    float _2477 = _2473 * _2473;
    float _2479 = _2475 * _2475;
    float _2481 = _2477 + _2479;
    float _2483 = sqrt(_2481);
    bool _2485 = _2483 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2487 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2489 = _2483 + _2487;
    float _2491 = _2443;
    float _2493 = _2481;
    float _2495 = _2489;
    float _2497 = _2463;
    float _2499 = _2473;
    float _2501 = _2475;
    float _2503 = _2477;
    float _2505 = _2479;
    if (_2485)
    {
        float _2507 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2491 = _2507;
    }
    float _2509 = _2491;
    if (_2485)
    {
        float _2511 = rsqrt(_2481);
        _2493 = _2511;
    }
    float _2513 = _2493;
    if (_2485)
    {
        float _2515 = _2489 * _2509;
        _2495 = _2515;
    }
    float _2517 = _2495;
    float _2519 = precise::max(0.0, _2463);
    float _2521 = _2519;
    if (_2485)
    {
        float _2523 = _2517 * 0.15915493667125701904296875;
        _1879 = _2523;
    }
    float _2525 = _1879;
    float _2527 = -_2471;
    float _2529 = -_2519;
    float _2531 = fma(_2449, _2527, _2529);
    float _2533 = as_type<float>(_2333);
    float _2535 = _2531;
    if (_2485)
    {
        float _2537 = _2525 * 6.283185482025146484375;
        float _2539 = sin(_2537);
        _2533 = _2539;
    }
    float _2541 = _2533;
    if (_2485)
    {
        float _2543 = _2531 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2521 = _2543;
    }
    float _2545 = _2521;
    float _2547 = _2517;
    float _2549 = _2545;
    if (_2485)
    {
        float _2551 = _2525 * 6.283185482025146484375;
        float _2553 = cos(_2551);
        _2547 = _2553;
    }
    float _2555 = _2547;
    float _2557 = _2541;
    if (_2485)
    {
        float _2559 = fma(_2541, _2545, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2549 = _2559;
    }
    float _2561 = _2549;
    float _2563 = _2561;
    if (_2485)
    {
        float _2565 = _2513 * _2561;
        _2557 = _2565;
    }
    float _2567 = _2557;
    if (_2485)
    {
        float _2569 = _2555 + (-1.0);
        _2497 = _2569;
    }
    float _2571 = _2497;
    if (_2485)
    {
        float _2573 = _2473 * _2567;
        _2499 = _2573;
    }
    float _2575 = _2499;
    if (_2485)
    {
        float _2577 = _2475 * _2567;
        _2501 = _2577;
    }
    float _2579 = _2501;
    if (_2485)
    {
        float _2581 = _2571 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2563 = _2581;
    }
    float _2583 = _2563;
    if (_2485)
    {
        float _2585 = _2575 * _2575;
        _2503 = _2585;
    }
    float _2587 = _2503;
    if (_2485)
    {
        float _2589 = _2579 * _2579;
        _2505 = _2589;
    }
    float _2591 = _2505;
    int _2593 = ~_1855;
    int _2595 = _2593 + 1;
    if (_2485)
    {
        float _2597 = fma(_2531, _2555, _2583);
        _2535 = _2597;
    }
    float _2599 = _2535;
    float _2601 = fma(_2599, _2599, _2587);
    float _2603 = _2601 + _2591;
    float _2605 = rsqrt(_2603);
    float _2607 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2609 = fma(_2469, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2607);
    float _2611 = precise::clamp(_2609, 0.0, 1.0);
    float _2613 = -_2611;
    float _2615 = _2613 + 1.0;
    float _2617 = abs(_2615);
    float _2619 = log2(_2617);
    float _2621 = _2605 * _2575;
    float _2623 = _2605 * _2599;
    float _2625 = _2605 * _2579;
    float _2627 = _2621 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2629 = _2623 + 1.0;
    float _2631 = -_2627;
    float _2633 = fma(_2623, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2631);
    float _2635 = _2619 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2637 = -_2625;
    float _2639 = fma(_2637, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2633);
    float _2641 = exp2(_2635);
    float _2643 = fma(_2639, -0.5, 0.5);
    float _2645 = fma(_2639, 0.5, 0.5);
    float _2647 = fma(_2645, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2649 = sqrt(_2643);
    float _2651 = fma(_2645, _2647, -0.212114393711090087890625);
    float _2653 = fma(_2645, _2651, 1.570728778839111328125);
    float _2655 = -_2623;
    float _2657 = fma(_2641, _2629, _2655);
    bool _2659 = !_2121;
    int _2661 = _2659 ? _2369 : (-1);
    int _2663 = _2661 & 3;
    bool _2665 = _2663 != 0;
    float _2667 = _2649 * 0.636619746685028076171875;
    int _2669 = _2661 & 3;
    bool _2671 = _2669 != 0;
    float _2673 = -_2653;
    float _2675 = fma(_2667, _2673, 1.0);
    float _2677 = fma(_2657, 0.5, 0.5);
    int _2679 = _2595 * _2365;
    int _2681 = _2679 + _2131;
    bool _2683 = uint(_2669) > 1u;
    float2 _8117 = float2(_2675, _2677);
    float3 _2687 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8117, float2(0.0), isnan(_8117)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8117, float2(0.0), isnan(_8117)), level(0.0)).xyz;
    float _2689 = _2687.x;
    float _2691 = _2687.y;
    float _2693 = _2687.z;
    int _2695 = _1871 * _2375;
    int _2697 = _2695 + _2229;
    bool _2699 = uint(_2681) >= uint(_1855);
    float _2701 = trunc(_2363);
    float _2703 = precise::max(_2701, 0.0);
    uint _2705 = uint(_2703);
    int _2707 = _2665 ? 0 : 1;
    float _2709 = _1686 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2711 = _2661 >> 31;
    float _2713 = _2619 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2715 = _301 > 0.5;
    float _2717 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2709);
    bool _2719 = !_2155;
    int _2721 = _2719 ? _2697 : (-1);
    float _2723 = -_831;
    float _2725 = _2723 + 1.0;
    int _2727 = ~_2707;
    int _2729 = _2727 + 1;
    int _2731 = _2729 + 1;
    float _2733 = exp2(_2713);
    int _2735 = _2731;
    if (!_2683)
    {
        int _2737 = ~_2707;
        int _2739 = _2737 + 1;
        _2735 = _2739;
    }
    int _2741 = _2735;
    float _2743 = -_725;
    float _2745 = _2743 + 1.0;
    int _2747 = _2711 & 3;
    float _2749 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2717);
    int _2751 = _2721 >> 31;
    float _2753 = -_789;
    float _2755 = _2753 + 1.0;
    int _2757 = _2661 + _2747;
    float _2759 = -_281;
    float _2761 = _2759 + 1.0;
    int _2763 = _2751 & 3;
    float _2765 = -_827;
    float _2767 = _2765 + 1.0;
    bool _2769 = !_2699;
    int _2771 = _2769 ? 0 : (-1);
    out.m_78.x = _1628;
    out.m_78.y = _1626;
    out.m_78.z = _1630;
    bool _2773 = _2669 != 3;
    int _2775 = _2721 + _2763;
    float _2777 = -_2733;
    float _2779 = _2777 + 1.0;
    bool _2781 = uint(_2669) >= 2u;
    int _2783 = _2775 >> 2;
    int _2785 = _2757 >> 2;
    int _2787 = _2781 ? 0 : 1;
    int _2789 = _2783 << 4;
    int _2791 = _2789 + 512;
    int _2793 = _2785 << 4;
    int _2795 = _2793 + 368;
    int _2797 = ~_2787;
    int _2799 = _2797 + 1;
    int _2801 = _2799 + 1;
    int _2803 = _2801;
    if (_2773)
    {
        int _2805 = ~_2787;
        int _2807 = _2805 + 1;
        _2803 = _2807;
    }
    int _2809 = _2803;
    uint _2811 = uint(int(uint(_2795) >> uint(2)));
    uint _2813 = uint(int(uint(int(_2811)) >> uint(2)));
    int _2815 = int(_2811) & 3;
    float _2817 = (*spvDescriptorSet0.vp_c9)._m0[int(_2813)][_2815];
    int _2819 = int(_2811) + 1;
    uint _2821 = uint(int(uint(_2819) >> uint(2)));
    int _2823 = _2819 & 3;
    float _2825 = (*spvDescriptorSet0.vp_c9)._m0[int(_2821)][_2823];
    int _2827 = ~_2365;
    int _2829 = _2827 + _2771;
    int _2831 = _2829 + 1;
    int _2833 = int(_2319) + int(_2705);
    float _2835 = -_195;
    int _2837 = _2715 ? as_type<int>(_2835) : as_type<int>(_195);
    int _2839 = _1855 * _2831;
    int _2841 = _2839 + _2131;
    bool _2843 = !_2671;
    int _2845 = _2843 ? 0 : 1;
    uint _2847 = uint(int(uint(_2791) >> uint(2)));
    uint _2849 = uint(int(uint(int(_2847)) >> uint(2)));
    int _2851 = int(_2847) & 3;
    float _2853 = (*spvDescriptorSet0.vp_c9)._m0[int(_2849)][_2851];
    int _2855 = int(_2847) + 1;
    uint _2857 = uint(int(uint(_2855) >> uint(2)));
    int _2859 = _2855 & 3;
    float _2861 = (*spvDescriptorSet0.vp_c9)._m0[int(_2857)][_2859];
    bool _2863 = _2669 != 3;
    int _2865 = _2721 & 3;
    bool _2867 = _2865 != 0;
    int _2869 = _2721 & 3;
    bool _2871 = _2869 != 0;
    int _2873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2875 = _2873 != 0;
    int _2877 = _2795 + 8;
    uint _2879 = uint(int(uint(_2877) >> uint(2)));
    uint _2881 = uint(int(uint(int(_2879)) >> uint(2)));
    int _2883 = int(_2879) & 3;
    float _2885 = (*spvDescriptorSet0.vp_c9)._m0[int(_2881)][_2883];
    int _2887 = int(_2879) + 1;
    uint _2889 = uint(int(uint(_2887) >> uint(2)));
    int _2891 = _2887 & 3;
    float _2893 = (*spvDescriptorSet0.vp_c9)._m0[int(_2889)][_2891];
    int _2895 = ~_1871;
    int _2897 = _2895 + 1;
    bool _2899 = !_2875;
    int _2901 = _2899 ? 0 : 1;
    bool _2903 = uint(_2869) > 1u;
    int _2905 = _2897 * _2833;
    int _2907 = _2905 + _2153;
    bool _2909 = !_2121;
    int _2911 = _2909 ? _2841 : (-1);
    int _2913 = _2791 + 8;
    uint _2915 = uint(int(uint(_2913) >> uint(2)));
    uint _2917 = uint(int(uint(int(_2915)) >> uint(2)));
    int _2919 = int(_2915) & 3;
    float _2921 = (*spvDescriptorSet0.vp_c9)._m0[int(_2917)][_2919];
    int _2923 = int(_2915) + 1;
    uint _2925 = uint(int(uint(_2923) >> uint(2)));
    int _2927 = _2923 & 3;
    float _2929 = (*spvDescriptorSet0.vp_c9)._m0[int(_2925)][_2927];
    int _2931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2933 = _2931 != 0;
    int _2935 = _2867 ? 0 : 1;
    bool _2937 = !_2933;
    int _2939 = _2937 ? 0 : 1;
    bool _2941 = uint(_2907) >= uint(_1871);
    bool _2943 = _2869 != 3;
    bool _2945 = !_2941;
    int _2947 = _2945 ? 0 : (-1);
    bool _2949 = !_2863;
    int _2951 = _2949 ? 0 : (-1);
    int _2953 = ~_2935;
    int _2955 = _2953 + 1;
    int _2957 = _2955 + 1;
    bool _2959 = !_2871;
    int _2961 = _2959 ? 0 : 1;
    bool _2963 = uint(_2869) >= 2u;
    bool _2965 = _2869 != 3;
    int _2967 = _2957;
    if (!_2903)
    {
        int _2969 = ~_2935;
        int _2971 = _2969 + 1;
        _2967 = _2971;
    }
    int _2973 = _2967;
    int _2975 = ~_2833;
    int _2977 = _2975 + _2947;
    int _2979 = _2977 + 1;
    int _2981 = _2963 ? 0 : 1;
    bool _2983 = !_2965;
    int _2985 = _2983 ? 0 : (-1);
    int _2987 = _1871 * _2979;
    int _2989 = _2987 + _2153;
    int _2991 = abs(_2973);
    int _2993 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2995 = _2993 != 0;
    int _2997 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2999 = _2997 != 0;
    int _3001 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _3003 = _3001 != 0;
    int _3005 = abs(_2741);
    bool _3007 = _295 > 0.5;
    int _3009 = ~_2981;
    int _3011 = _3009 + 1;
    int _3013 = _3011 + 1;
    int _3015 = _3013;
    if (_2943)
    {
        int _3017 = ~_2981;
        int _3019 = _3017 + 1;
        _3015 = _3019;
    }
    int _3021 = _3015;
    int _3023 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3025 = _3023 != 0;
    int _3027 = abs(_2845);
    int _3029 = ~_2991;
    int _3031 = _3029 + 1;
    int _3033 = _3031 + 1;
    int _3035 = ~_3005;
    int _3037 = _3035 + 1;
    int _3039 = _3037 + 1;
    int _3041 = abs(_2961);
    int _3043 = _3033 * as_type<int>(_2861);
    int _3045 = abs(_3021);
    int _3047 = _3039 * as_type<int>(_2825);
    int _3049 = ~_3027;
    int _3051 = _3049 + 1;
    int _3053 = _3051 + 1;
    int _3055 = ~_3041;
    int _3057 = _3055 + 1;
    int _3059 = _3057 + 1;
    int _3061 = abs(_2809);
    int _3063 = _3053 * as_type<int>(_2817);
    int _3065 = _3063 + _3047;
    int _3067 = ~_3061;
    int _3069 = _3067 + 1;
    int _3071 = _3069 + 1;
    float _3073 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3075 = int(_3073);
    int _3077 = ~_3045;
    int _3079 = _3077 + 1;
    int _3081 = _3079 + 1;
    int _3083 = _3059 * as_type<int>(_2853);
    int _3085 = _3083 + _3043;
    int _3087 = _3071 * as_type<int>(_2885);
    int _3089 = _3087 + _3065;
    int _3091 = _3081 * as_type<int>(_2921);
    int _3093 = _3091 + _3085;
    float _3095 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _3097 = abs(_2951);
    float _3099 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _3101 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _3103 = ~_3097;
    int _3105 = _3103 + 1;
    int _3107 = _3105 + 1;
    float _3109 = _3095 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3111 = _3099 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3113 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _3115 = _3101 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3117 = _3107 * as_type<int>(_2893);
    int _3119 = _3117 + _3089;
    int _3121 = abs(_3075);
    float _3123 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3125 = int(_3123);
    int _3127 = abs(_2901);
    out.m_80.x = _3109;
    out.m_80.y = _3111;
    out.m_80.z = _3115;
    out.m_80.w = _3113;
    float _3129 = float(uint(_3075));
    int _3131 = abs(_2985);
    bool _3133 = !_2155;
    int _3135 = _3133 ? _2989 : (-1);
    float _3137 = 1.0 / _3129;
    int _3139 = ~_3131;
    int _3141 = _3139 + 1;
    int _3143 = _3141 + 1;
    float _3145 = -_191;
    int _3147 = _3007 ? as_type<int>(_3145) : as_type<int>(_191);
    bool _3149 = _297 > 0.5;
    int _3151 = _3143 * as_type<int>(_2929);
    int _3153 = _3151 + _3093;
    float _3155 = abs(_1051);
    float _3157 = log2(_3155);
    int _3159 = abs(_2939);
    float _3161 = float(uint(_3125));
    int _3163 = ~_3127;
    int _3165 = _3163 + 1;
    int _3167 = _3165 + 1;
    bool _3169 = _299 > 0.5;
    float _3171 = 1.0 / _3161;
    int _3173 = _3119 * _3167;
    int _3175 = as_type<int>(_3137) + (-2);
    float _3177 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3179 = _2911 * _3127;
    int _3181 = _3179 + _3173;
    float _3183 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3185 = _3157 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3187 = -_1131;
    float _3189 = fma(_3187, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3183);
    float _3191 = float(uint(_3181));
    float _3193 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _3195 = ~_3159;
    int _3197 = _3195 + 1;
    int _3199 = _3197 + 1;
    float _3201 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _3203 = abs(_3125);
    float _3205 = as_type<float>(_3175) * _3191;
    float _3207 = float(uint(_3121));
    float _3209 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _3211 = _3153 * _3199;
    float _3213 = float(uint(_3203));
    float _3215 = exp2(_3185);
    float _3217 = _3193 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3219 = _3201 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3221 = _3209 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3223 = _3135 * _3159;
    int _3225 = _3223 + _3211;
    float _3227 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3229 = -_1131;
    float _3231 = fma(_3229, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3177);
    int _3233 = ~_3075;
    int _3235 = _3233 + 1;
    float _3237 = 1.0 / _3207;
    out.m_82.x = _3217;
    out.m_82.y = _3219;
    out.m_82.z = _3221;
    float _3239 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3241 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3243 = ~_3203;
    int _3245 = _3243 + 1;
    bool _3247 = !_3025;
    float _3249 = _3247 ? _191 : as_type<float>(_3147);
    float _3251 = trunc(_3205);
    float _3253 = precise::max(_3251, 0.0);
    uint _3255 = uint(_3253);
    bool _3257 = !_2995;
    float _3259 = _3257 ? _195 : as_type<float>(_2837);
    bool _3261 = _1051 <= 8000.0;
    bool _3263 = isnan(_1051);
    bool _3265 = _3261 || _3263;
    bool _3267 = isnan(8000.0);
    bool _3269 = _3265 || _3267;
    float _3271 = float(_3269);
    int _3273 = as_type<int>(_3171) + (-2);
    float _3275 = -_1131;
    float _3277 = fma(_3275, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3227);
    float _3279 = float(uint(_3225));
    float _3281 = 1.0 / _3213;
    float _3283 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3189);
    int _3285 = abs(_3181);
    float _3287 = as_type<float>(_3273) * _3279;
    int _3289 = as_type<int>(_3237) + (-2);
    float _3291 = fma(_3215, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3293 = precise::clamp(_3291, 0.0, 1.0);
    int _3295 = abs(_3225);
    int _3297 = _3235 * int(_3255);
    int _3299 = _3297 + _3181;
    float _3301 = float(uint(_3285));
    float _3303 = trunc(_3287);
    float _3305 = precise::max(_3303, 0.0);
    uint _3307 = uint(_3305);
    float _3309 = float(uint(_3295));
    float _3311 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3231);
    float _3313 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3277);
    float _3315 = as_type<float>(_3289) * _3301;
    float _3317 = float(uint(_3299));
    float _3319 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3239);
    int _3321 = as_type<int>(_3281) + (-2);
    float _3323 = trunc(_3315);
    float _3325 = precise::max(_3323, 0.0);
    uint _3327 = uint(_3325);
    int _3329 = ~_3125;
    int _3331 = _3329 + 1;
    float _3333 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3241);
    float _3335 = as_type<float>(_3321) * _3309;
    float _3337 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3339 = as_type<float>(_3175) * _3317;
    float _3341 = trunc(_3335);
    float _3343 = precise::max(_3341, 0.0);
    uint _3345 = uint(_3343);
    int _3347 = ~_3121;
    int _3349 = _3347 + 1;
    float _3351 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3337);
    float _3353 = _1226 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3355 = _3331 * int(_3307);
    int _3357 = _3355 + _3225;
    float _3359 = _1226 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3361 = _1226 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3363 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3353);
    int _3365 = _3349 * int(_3327);
    int _3367 = _3365 + _3285;
    float _3369 = float(uint(_3357));
    float _3371 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3359);
    float _3373 = trunc(_3339);
    float _3375 = precise::max(_3373, 0.0);
    uint _3377 = uint(_3375);
    float _3379 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3361);
    float _3381 = float(uint(_3367));
    float _3383 = as_type<float>(_3273) * _3369;
    float _3385 = -_191;
    int _3387 = _3169 ? as_type<int>(_3385) : as_type<int>(_191);
    int _3389 = _3245 * int(_3345);
    int _3391 = _3389 + _3295;
    float _3393 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3333);
    float _3395 = as_type<float>(_3289) * _3381;
    float _3397 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3319);
    float _3399 = trunc(_3383);
    float _3401 = precise::max(_3399, 0.0);
    uint _3403 = uint(_3401);
    float _3405 = float(uint(_3391));
    float _3407 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3351);
    bool _3409 = !_3003;
    float _3411 = _3409 ? _191 : as_type<float>(_3387);
    float _3413 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3415 = -_195;
    int _3417 = _3149 ? as_type<int>(_3415) : as_type<int>(_195);
    float _3419 = as_type<float>(_3321) * _3405;
    float _3421 = trunc(_3395);
    float _3423 = precise::max(_3421, 0.0);
    uint _3425 = uint(_3423);
    bool _3427 = !_2999;
    float _3429 = _3427 ? _195 : as_type<float>(_3417);
    float _3431 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3371);
    int _3433 = ~_3125;
    int _3435 = _3433 + 1;
    float _3437 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3439 = _3413 * _3283;
    int _3441 = int(_3255) + int(_3377);
    float _3443 = fma(_3293, -2.0, 3.0);
    float _3445 = trunc(_3419);
    float _3447 = precise::max(_3445, 0.0);
    uint _3449 = uint(_3447);
    int _3451 = int(_3307) + int(_3403);
    float _3453 = _3293 * _3293;
    int _3455 = ~_3121;
    int _3457 = _3455 + 1;
    float _3459 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3363);
    float _3461 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3379);
    int _3463 = _3435 * _3451;
    int _3465 = _3463 + _3225;
    float _3467 = fma(_3437, _3393, _3439);
    out.m_84.x = _3393;
    out.m_84.y = _3397;
    out.m_84.z = _3407;
    int _3469 = ~_3075;
    int _3471 = _3469 + 1;
    float _3473 = _3453 * _3443;
    int _3475 = ~_3203;
    int _3477 = _3475 + 1;
    int _3479 = int(_3327) + int(_3425);
    int _3481 = _3471 * _3441;
    int _3483 = _3481 + _3181;
    bool _3485 = uint(_3465) >= uint(_3125);
    int _3487 = int(_3345) + int(_3449);
    bool _3489 = !_3485;
    int _3491 = _3489 ? 0 : (-1);
    bool _3493 = uint(_3483) >= uint(_3075);
    int _3495 = _3457 * _3479;
    int _3497 = _3495 + _3285;
    int _3499 = ~_3451;
    int _3501 = _3499 + _3491;
    int _3503 = _3501 + 1;
    int _3505 = _3477 * _3487;
    int _3507 = _3505 + _3295;
    int _3509 = _3181 ^ _3075;
    float _3511 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3513 = uint(_3497) >= uint(_3121);
    int _3515 = _3125 * _3503;
    int _3517 = _3515 + _3225;
    bool _3519 = !_3493;
    int _3521 = _3519 ? 0 : (-1);
    bool _3523 = uint(_3507) >= uint(_3203);
    bool _3525 = !_3513;
    int _3527 = _3525 ? 0 : (-1);
    float _3529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _3531 = uint(int(uint(_3509) >> uint(31)));
    int _3533 = ~_3441;
    int _3535 = _3533 + _3521;
    int _3537 = _3535 + 1;
    int _3539 = ~_3527;
    int _3541 = _3479 + _3539;
    int _3543 = _3541 + 1;
    int _3545 = ~int(_3531);
    int _3547 = _3545 + 1;
    int _3549 = _3075 * _3537;
    int _3551 = _3549 + _3181;
    int _3553 = _3225 ^ _3125;
    float _3555 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3557 = _3543 ^ _3547;
    bool _3559 = _3075 == 0;
    bool _3561 = _3125 == 0;
    float _3563 = _3529 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3565 = _3125 == 0;
    int _3567 = ~_3547;
    int _3569 = _3567 + _3557;
    int _3571 = _3569 + 1;
    float _3573 = _3511 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3575 = !_3523;
    int _3577 = _3575 ? 0 : (-1);
    uint _3579 = uint(int(uint(_3553) >> uint(31)));
    float _3581 = fma(_3413, _3413, 1.0);
    bool _3583 = !_3559;
    int _3585 = _3583 ? _3551 : (-1);
    bool _3587 = _3075 == 0;
    int _3589 = ~_3577;
    int _3591 = _3487 + _3589;
    int _3593 = _3591 + 1;
    float _3595 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3597 = ~int(_3579);
    int _3599 = _3597 + 1;
    bool _3601 = !_3561;
    int _3603 = _3601 ? _3517 : (-1);
    float _3605 = float(_3585);
    int _3607 = _3593 ^ _3599;
    float _3609 = rsqrt(_3581);
    float _3611 = float(_3603);
    float _3613 = fma(_3573, _3605, _689);
    float _3615 = _3249 + 0.5;
    int _3617 = ~_3599;
    int _3619 = _3617 + _3607;
    int _3621 = _3619 + 1;
    bool _3623 = !_3587;
    int _3625 = _3623 ? _3571 : (-1);
    float _3627 = fma(_3563, _3611, _811);
    float _3629 = fma(_3573, _3615, _3613);
    float _3631 = _3411 + 0.5;
    bool _3633 = !_3565;
    int _3635 = _3633 ? _3621 : (-1);
    float _3637 = _3555 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3639 = float(_3625);
    float _3641 = fma(_3563, _3631, _3627);
    float _3643 = float(_3635);
    float _3645 = _3595 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3647 = _3429 + (-0.5);
    float _3649 = -_705;
    float _3651 = fma(_3637, _3639, _3649);
    float _3653 = _3259 + (-0.5);
    float _3655 = -_837;
    float _3657 = fma(_3645, _3643, _3655);
    float _3659 = _3413 * _3609;
    float _3661 = -_3637;
    float _3663 = fma(_3661, _3647, _3651);
    float _3665 = -_2745;
    float _3667 = fma(_3411, _3665, _3641);
    float _3669 = -_3645;
    float _3671 = fma(_3669, _3653, _3657);
    float _3673 = -_3431;
    float _3675 = _3659 * _3673;
    float _3677 = fma(_3429, _2725, _3663);
    float _3679 = -_3473;
    float _3681 = _3679 + 1.0;
    float _3683 = -_3459;
    float _3685 = _3659 * _3683;
    float _3687 = fma(_3609, _3311, _3675);
    float _3689 = _3413 * _3311;
    float _3691 = fma(_3681, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3473);
    float _3693 = -_3461;
    float _3695 = _3659 * _3693;
    float _3697 = fma(_3609, _3283, _3685);
    float _3699 = fma(_3437, _3397, _3689);
    float _3701 = _3271 * _3691;
    float _3703 = fma(_3609, _3313, _3695);
    float _3705 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2749);
    float _3707 = _3701 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    if (!_1714)
    {
        _1782 = 1.0;
    }
    float _3709 = _1782;
    float _3711 = fma(_3259, _2755, _3671);
    float _3713 = _3709;
    if (_1714)
    {
        bool _3715 = _1832 >= _1796;
        bool _3717 = isnan(_1832);
        bool _3719 = _3715 || _3717;
        bool _3721 = isnan(_1796);
        bool _3723 = _3719 || _3721;
        float _3725 = float(_3723);
        _3713 = _3725;
    }
    float _3727 = _3713;
    float _3729 = _2779 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3731 = _2761 * _3707;
    float _3733 = precise::clamp(_3731, 0.0, 1.0);
    float _3735 = -_2767;
    float _3737 = fma(_3249, _3735, _3629);
    float _3739 = _3705 + _1738;
    float _3741 = _3413 * _3313;
    float _3743 = _3727 * _2445;
    float _3745 = _3729 * _1834;
    float _3747 = -_3733;
    float _3749 = fma(_3747, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3751 = _3739 * 0.5;
    float _3753 = fma(_3437, _3407, _3741);
    float _3755 = _1845 * _3745;
    float _3757 = -_3743;
    float _3759 = fma(_3757, _3749, 1.0);
    float _3761 = precise::clamp(_3759, 0.0, 1.0);
    float _3763 = _2693 * _3745;
    float _3765 = -_3729;
    float _3767 = _3765 + 1.0;
    out.m_86.z = _3751;
    out.m_86.w = _1738;
    float _3769 = _3459 + _3467;
    float _3771 = _3431 + _3699;
    float _3773 = _3461 + _3753;
    float _3775 = fma(_2689, _3755, _1839);
    float _3777 = fma(_2691, _3755, _1841);
    float _3779 = _1845 * _3767;
    float _3781 = fma(_1845, _3763, _1843);
    out.m_88.x = _3697;
    out.m_88.y = _3687;
    out.m_88.z = _3703;
    bool _3783 = _2469 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3785 = isnan(_2469);
    bool _3787 = _3783 || _3785;
    bool _3789 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3791 = _3787 || _3789;
    float _3793 = _3761 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_90.x = _3737;
    out.m_90.y = _3677;
    out.m_90.z = _3667;
    out.m_90.w = _3711;
    out.gl_Position.x = _1774;
    out.gl_Position.y = _1776;
    out.gl_Position.z = _3705;
    out.gl_Position.w = _1738;
    out.m_92.x = _3793;
    float _3795 = _3739;
    float _3797 = _3767;
    float _3799 = _3751;
    float _3801 = _3749;
    float _3803 = _3761;
    float _3805 = _3755;
    if (!_3791)
    {
        _3795 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3807 = _3795;
    out.m_94.x = _3775;
    out.m_94.y = _3777;
    out.m_94.z = _3781;
    out.m_94.w = _3779;
    float _3809 = _3807;
    float _3811 = _3807;
    if (!_3791)
    {
        _3797 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3813 = _3797;
    float _3815 = _3813;
    float _3817 = _3813;
    if (!_3791)
    {
        _3799 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3819 = _3799;
    out.m_96.x = _3769;
    out.m_96.y = _3771;
    out.m_96.z = _3773;
    float _3821 = _3819;
    float _3823 = _3819;
    if (!_3791)
    {
        _3801 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3825 = _3801;
    float _3827 = _3825;
    float _3829 = _3825;
    if (!_3791)
    {
        _3803 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3831 = _3803;
    float _3833 = _3831;
    float _3835 = _3831;
    if (!_3791)
    {
        _3805 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3837 = _3805;
    bool _3839 = !_3791;
    float _3841 = _3837;
    float _3843 = _3837;
    if (!_3839)
    {
        bool _3845 = _2469 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3847 = isnan(_2469);
        bool _3849 = _3845 || _3847;
        bool _3851 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3853 = _3849 || _3851;
        if (!_3853)
        {
            float _3855 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3857 = _2469 + _3855;
            float _3859 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3861 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3859;
            float _3863 = 1.0 / _3861;
            float _3865 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3867 = _3865 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3869 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3871 = _3869 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3873 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3875 = _3873 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3877 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3879 = _3877 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3881 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3883 = _3881 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3885 = _3857 * _3863;
            float _3887 = precise::clamp(_3885, 0.0, 1.0);
            float _3889 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3891 = _3889 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3893 = fma(_3887, _3867, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3895 = fma(_3887, _3891, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3897 = fma(_3887, _3871, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3899 = fma(_3887, _3875, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3901 = fma(_3887, _3879, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3903 = fma(_3887, _3883, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3817 = _3893;
            _3835 = _3901;
            _3811 = _3895;
            _3829 = _3899;
            _3823 = _3897;
            _3843 = _3903;
            _3905 = true;
        }
        else
        {
            bool _3907 = _2469 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3909 = isnan(_2469);
            bool _3911 = _3907 || _3909;
            bool _3913 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3915 = _3911 || _3913;
            if (!_3915)
            {
                _3809 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3917 = _3809;
            _3811 = _3917;
            if (!_3915)
            {
                _3815 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3919 = _3815;
            _3817 = _3919;
            if (!_3915)
            {
                _3821 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3921 = _3821;
            _3823 = _3921;
            if (!_3915)
            {
                _3827 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3923 = _3827;
            _3829 = _3923;
            if (!_3915)
            {
                _3833 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3925 = _3833;
            _3835 = _3925;
            if (!_3915)
            {
                _3841 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3927 = _3841;
            bool _3929 = !_3915;
            _3843 = _3927;
            if (!_3929)
            {
                bool _3931 = _2469 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3933 = isnan(_2469);
                bool _3935 = _3931 || _3933;
                bool _3937 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3939 = _3935 || _3937;
                if (!_3939)
                {
                    float _3941 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3943 = _2469 + _3941;
                    float _3945 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3947 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3945;
                    float _3949 = 1.0 / _3947;
                    float _3951 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3953 = _3951 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3955 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3957 = _3955 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3959 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3961 = _3959 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3963 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3965 = _3963 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3967 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3969 = _3967 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3971 = _3943 * _3949;
                    float _3973 = precise::clamp(_3971, 0.0, 1.0);
                    float _3975 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3977 = _3975 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3979 = fma(_3973, _3953, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3981 = fma(_3973, _3977, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3983 = fma(_3973, _3957, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3985 = fma(_3973, _3961, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3987 = fma(_3973, _3965, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3989 = fma(_3973, _3969, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3817 = _3979;
                    _3835 = _3987;
                    _3811 = _3981;
                    _3829 = _3985;
                    _3823 = _3983;
                    _3843 = _3989;
                    _3905 = true;
                }
                else
                {
                    _3817 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3835 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3811 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3829 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3823 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3843 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3905 = false;
    float _3991 = _3817;
    float _3993 = _3835;
    float _3995 = _3811;
    float _3997 = _3829;
    float _3999 = _3823;
    float _4001 = _3843;
    float _4003 = fma(_3771, -0.5, 0.5);
    float _4005 = precise::clamp(_4003, 0.0, 1.0);
    float _4007 = -_3991;
    float _4009 = _4007 + _3993;
    float _4011 = -_3995;
    float _4013 = _4011 + _3997;
    float _4015 = -_3999;
    float _4017 = _4015 + _4001;
    bool _4019 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4021 = fma(_4005, _4009, _3991);
    float _4023 = fma(_4005, _4013, _3995);
    float _4025 = fma(_4005, _4017, _3999);
    float _4027 = _4021 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _4029 = fma(_4023, 0.298911988735198974609375, _4027);
    float _4031 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4033 = fma(_4025, 0.114477999508380889892578125, _4029);
    out.m_92.w = _4031;
    float _4035 = -_4033;
    float _4037 = _4023 + _4035;
    float _4039 = -_4033;
    float _4041 = _4021 + _4039;
    float _4043 = -_4033;
    float _4045 = _4025 + _4043;
    out.m_98.x = 0.0;
    float _4047 = fma(_4037, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4033);
    float _4049 = fma(_4041, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4033);
    float _4051 = fma(_4045, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4033);
    out.m_100.x = _4047;
    out.m_100.y = _4049;
    out.m_100.z = _4051;
    if (!_4019)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4053 = -_1626;
    float _4055 = _4053 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4057 = -_1628;
    float _4059 = _4057 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4061 = -_1630;
    float _4063 = _4061 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4065 = _4055 * _4055;
    float _4067 = fma(_4059, _4059, _4065);
    float _4069 = fma(_4063, _4063, _4067);
    float _4071 = sqrt(_4069);
    float _4073 = rsqrt(_4069);
    float _4075 = -_4071;
    float _4077 = _4075 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4079 = _4077 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4081 = precise::clamp(_4079, 0.0, 1.0);
    float _4083 = _4059 * _4073;
    float _4085 = _4055 * _4073;
    float _4087 = abs(_4081);
    float _4089 = log2(_4087);
    float _4091 = _4063 * _4073;
    float _4093 = _4083 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4095 = _3771 * _4085;
    float _4097 = -_4085;
    float _4099 = -_4093;
    float _4101 = fma(_4097, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4099);
    float _4103 = fma(_3769, _4083, _4095);
    float _4105 = -_4091;
    float _4107 = fma(_4105, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4101);
    float _4109 = fma(_3773, _4091, _4103);
    float _4111 = precise::clamp(_4109, 0.0, 1.0);
    float _4113 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4115 = _4107 + _4113;
    float _4117 = _4089 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4119 = _4115 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4121 = precise::clamp(_4119, 0.0, 1.0);
    float _4123 = exp2(_4117);
    float _4125 = _4123 * _4121;
    float _4127 = _4111 * _4125;
    float _4129 = _4127 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4131 = _4127 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4133 = _4127 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_98.x = _4129;
    out.m_98.y = _4131;
    out.m_98.z = _4133;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

