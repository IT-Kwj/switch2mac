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
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture2d_array<float> vp_t_tcb_16 [[id(9)]];
    sampler vp_t_tcb_16Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d_array<float> vp_t_tcb_14 [[id(15)]];
    sampler vp_t_tcb_14Smplr [[id(16)]];
    texture2d<float> vp_t_tcb_1C [[id(17)]];
    sampler vp_t_tcb_1CSmplr [[id(18)]];
    sampler vp_t_tcb_24Smplr_w [[id(19)]];
    sampler vp_t_tcb_32Smplr_w [[id(20)]];
    sampler vp_t_tcb_30Smplr_w [[id(21)]];
    sampler vp_t_tcb_14Smplr_w [[id(22)]];
    sampler vp_t_tcb_1CSmplr_w [[id(23)]];
    constant dm_border_t* dm_border [[id(24)]];
};

struct main0_out
{
    float4 m_77 [[user(locn0)]];
    float4 m_79 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_95 [[user(locn3)]];
    float4 m_81 [[user(locn4)]];
    float4 m_83 [[user(locn5)]];
    float4 m_87 [[user(locn6)]];
    float4 m_85 [[user(locn7)]];
    float4 m_93 [[user(locn8)]];
    float4 m_89 [[user(locn9)]];
    float4 m_91 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_69 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_75 [[attribute(4)]];
    float4 m_71 [[attribute(5)]];
    float4 m_65 [[attribute(6)]];
    float4 m_67 [[attribute(7)]];
    float4 m_73 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3086 = false;
    bool _1863 = false;
    bool _429 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_58.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    float _122 = as_type<float>(_114);
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _120;
    if (!_118)
    {
        out.m_61.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _124 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3372 = as_type<float>(_130);
        out.gl_Position.z = _3372;
    }
    if (!_118)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _134 = in.m_63.w;
    float _136 = float(_114);
    float _138 = -_134;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_134);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    bool _152 = _140 >= _136;
    bool _154 = !_150;
    bool _156 = _152 || _154;
    float _158 = _140;
    if (_156)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _122;
    if (_156)
    {
        out.m_61.x = 0.0;
    }
    if (_156)
    {
        float _162 = _160 * 5.0;
        _132 = as_type<int>(_162);
    }
    int _164 = _132;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3436 = as_type<float>(_164);
        out.gl_Position.z = _3436;
    }
    if (_156)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _166 = in.m_65.x;
    float _168 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _170 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _172 = in.m_63.x;
    float _174 = in.m_63.y;
    float _176 = in.m_63.z;
    float _178 = in.m_58.x;
    float _180 = in.m_58.y;
    float _182 = in.m_58.z;
    bool _184 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _186 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _188 = _184 || _186;
    bool _190 = isnan(1.0);
    bool _192 = _188 || _190;
    float _194 = _168 * _166;
    float _196 = _170 * _166;
    float _198 = trunc(_194);
    int _200 = int(_198);
    float _202 = trunc(_196);
    int _204 = int(_202);
    int _206 = _200 << 4;
    int _208 = _206 + 1712;
    float _210 = in.m_67.x;
    float _212 = in.m_67.y;
    float _214 = in.m_67.z;
    float _216 = in.m_67.w;
    int _218 = _208 + 8;
    uint _221 = uint(int(uint(_218) >> uint(2)));
    uint _223 = uint(int(uint(int(_221)) >> uint(2)));
    int _225 = int(_221) & 3;
    float _227 = (*spvDescriptorSet0.vp_c9)._m0[int(_223)][_225];
    int _229 = _204 << 4;
    int _231 = _229 + 1968;
    float _233 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _235 = _231 + 8;
    uint _237 = uint(int(uint(_235) >> uint(2)));
    uint _239 = uint(int(uint(int(_237)) >> uint(2)));
    int _241 = int(_237) & 3;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[int(_239)][_241];
    float _245 = 0.0;
    float _247 = _233;
    if (!_192)
    {
        float _249 = _233 * _233;
        float _251 = _249 * 0.5;
        _245 = _251;
    }
    float _253 = _245;
    float _255 = _253;
    if (!_192)
    {
        float _257 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _255 = _257;
    }
    float _259 = _255;
    uint _261 = uint(int(uint(_208) >> uint(2)));
    uint _263 = uint(int(uint(int(_261)) >> uint(2)));
    int _265 = int(_261) & 3;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[int(_263)][_265];
    int _269 = int(_261) + 1;
    uint _271 = uint(int(uint(_269) >> uint(2)));
    int _273 = _269 & 3;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[int(_271)][_273];
    uint _277 = uint(int(uint(_231) >> uint(2)));
    uint _279 = uint(int(uint(int(_277)) >> uint(2)));
    int _281 = int(_277) & 3;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[int(_279)][_281];
    int _285 = int(_277) + 1;
    uint _287 = uint(int(uint(_285) >> uint(2)));
    int _289 = _285 & 3;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[int(_287)][_289];
    bool _293 = !_192;
    float _295 = _259;
    if (!_293)
    {
        float _297 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _299 = log2(_297);
        float _301 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _303 = _301 + 1.0;
        float _305 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _307 = _233 * _299;
        float _309 = 1.0 / _303;
        float _311 = _305 * 0.693147182464599609375;
        float _313 = exp2(_307);
        float _315 = 1.0 / _311;
        float _317 = _313 + (-1.0);
        float _319 = -_317;
        float _321 = fma(_319, _315, _233);
        float _323 = _321 * _309;
        float _325 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _295 = _325;
    }
    float _327 = _295;
    bool _329 = !_192;
    if (!_329)
    {
        float _331 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _333 = log2(_331);
        float _335 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _337 = _335 + 1.0;
        float _339 = 1.0 / _337;
        float _341 = _233 * _333;
        float _343 = exp2(_341);
        float _345 = -_343;
        float _347 = _345 + 1.0;
        float _349 = _347 * _339;
        _247 = _349;
    }
    float _351 = _247;
    float _353 = 1.0 / _136;
    float _355 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _357 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _359 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _361 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _363 = fma(_351, _172, _355);
    float _365 = fma(_351, _174, _357);
    float _367 = _210 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _369 = fma(_351, _176, _361);
    float _371 = fma(_363, _216, _178);
    float _373 = fma(_365, _216, _180);
    float _375 = _212 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _377 = fma(_369, _216, _182);
    float _379 = _214 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _381 = _267 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _383 = _275 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _385 = _283 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _387 = _291 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _389 = _227 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _391 = _243 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _393 = _140 * _353;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _397 = _381 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _399 = _383 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _401 = _389 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _403 = _385 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _405 = _387 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _407 = _391 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _409 = !_359;
    float _411 = _377;
    float _427;
    if (!_409)
    {
        float _413 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _415 = _166 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _417 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[14].x, _140);
        float _419 = _417 * _413;
        float _421 = floor(_419);
        float _423 = -_421;
        float _425 = _419 + _423;
        _427 = _425;
        _429 = true;
    }
    else
    {
        _427 = _393;
    }
    _429 = false;
    float _431 = _427;
    float _433 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _435 = log2(_433);
    float _437 = in.m_65.z;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _441 = _439 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _445 = _443 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _447 = 1.0 / _441;
    int _449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _451 = _449 != 0;
    int _453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _455 = _453 != 0;
    int _457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _459 = _457 != 0;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _465 = (*spvDescriptorSet0.vp_c10)._m0[9].y * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _467 = (*spvDescriptorSet0.vp_c10)._m0[9].y * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _469 = 1.0 / _445;
    float _471 = in.m_65.y;
    float _473 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _477 = _475 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _479 = _435 * _140;
    float _481 = 1.0 / _463;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _487 = fma((*spvDescriptorSet0.vp_c10)._m0[8].y, (*spvDescriptorSet0.vp_c8)._m0[0].x, _465);
    float _489 = fma((*spvDescriptorSet0.vp_c10)._m0[8].y, (*spvDescriptorSet0.vp_c8)._m0[1].x, _467);
    float _491 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _473);
    float _493 = _166 * 2.0;
    float _495 = 1.0 / _485;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _503 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _501;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _505;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _511 = _509 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _513 = _503 * _469;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _519 = exp2(_479);
    float _521 = _507 * _481;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _523;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _531 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _533 = isnan(1.0);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _539 = _535 || _537;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _543 = 1.0 + _541;
    float _545 = _511 * _447;
    float _547 = 1.0 / _477;
    float _549 = _166 + _437;
    bool _551 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _553 = isnan(0.0);
    bool _555 = _551 || _553;
    bool _557 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _559 = _555 || _557;
    float _561 = _517 * _495;
    float _563 = _549 + (-1.0);
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _567 = _431 + _565;
    float _569 = 1.0 / _543;
    float _571 = -_519;
    float _573 = _571 + 1.0;
    float _575 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _581 = fma(_561, _567, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _583 = _559 ? _573 : 0.0;
    float _585 = 1.0 / _499;
    float _587 = _471 * 2.0;
    float _589 = _529 * _547;
    float _591 = _471 + _437;
    bool _593 = !_451;
    int _595 = _593 ? 0 : 1;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _599 = _431 + _597;
    bool _601 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _603 = isnan(_431);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = _591 + (-1.0);
    float _615 = floor(_587);
    float _617 = _437 * 2.0;
    if (_539)
    {
        float _619 = _583 * _569;
        _158 = _619;
    }
    float _621 = _158;
    float _623 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _625 = _166 + _471;
    float _627 = -_611;
    float _629 = _627 + 1.0;
    bool _631 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _633 = isnan(_431);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _639 = _635 || _637;
    float _641 = float(_639);
    float _643 = floor(_493);
    float _645 = _625 + (-1.0);
    float _647 = _525 * _585;
    bool _649 = !_459;
    int _651 = _649 ? 0 : 1;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _653;
    float _657 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _659 = !_455;
    int _661 = _659 ? 0 : 1;
    float _663 = fma(_589, _599, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _665 = floor(_617);
    bool _667 = _615 > 0.0;
    bool _669 = _615 >= 0.0;
    bool _671 = isnan(_615);
    bool _673 = _669 || _671;
    bool _675 = isnan(0.0);
    bool _677 = _673 || _675;
    float _679 = 1.0 / _579;
    bool _681 = _643 >= 0.0;
    bool _683 = isnan(_643);
    bool _685 = _681 || _683;
    bool _687 = isnan(0.0);
    bool _689 = _685 || _687;
    bool _691 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _693 = isnan(_431);
    bool _695 = _691 || _693;
    bool _697 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _699 = _695 || _697;
    float _701 = float(_699);
    float _703 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _491);
    int _705 = _689 ? 0 : 1;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _709 = _431 + _707;
    bool _711 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _713 = isnan(_431);
    bool _715 = _711 || _713;
    bool _717 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _719 = _715 || _717;
    float _721 = float(_719);
    float _723 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    bool _725 = _665 >= 0.0;
    bool _727 = isnan(_665);
    bool _729 = _725 || _727;
    bool _731 = isnan(0.0);
    bool _733 = _729 || _731;
    float _735 = fma(_545, _709, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    int _737 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _739 = _737 != 0;
    int _741 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _743 = _741 != 0;
    int _745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _747 = _745 != 0;
    bool _749 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _751 = isnan(_431);
    bool _753 = _749 || _751;
    bool _755 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _757 = _753 || _755;
    float _759 = float(_757);
    float _761 = _655 * _679;
    bool _763 = _643 > 0.0;
    float _765 = fma((*spvDescriptorSet0.vp_c10)._m0[10].y, (*spvDescriptorSet0.vp_c8)._m0[0].z, _487);
    float _767 = fma((*spvDescriptorSet0.vp_c10)._m0[10].y, (*spvDescriptorSet0.vp_c8)._m0[1].z, _489);
    float _769 = -_759;
    float _771 = _769 + 1.0;
    bool _773 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _775 = isnan(_431);
    bool _777 = _773 || _775;
    bool _779 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _781 = _777 || _779;
    float _783 = float(_781);
    float _785 = _621 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    int _787 = _733 ? 0 : 1;
    float _789 = _611 * _771;
    float _791 = _641 * _629;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _795 = _431 + _793;
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _799 = _431 + _797;
    float _801 = -_641;
    float _803 = _801 + 1.0;
    float _805 = -_783;
    float _807 = _805 + 1.0;
    float _809 = fma(_521, _795, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    int _811 = ~_705;
    int _813 = _811 + 1;
    int _815 = _813 + 1;
    float _817 = fma(_513, _799, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _819 = _815;
    float _821 = _765;
    bool _823 = _667;
    if (!_763)
    {
        int _825 = ~_705;
        int _827 = _825 + 1;
        _819 = _827;
    }
    int _829 = _819;
    float _831 = _701 * _803;
    bool _833 = _665 > 0.0;
    float _835 = -_701;
    float _837 = _835 + 1.0;
    bool _839 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _841 = isnan(_431);
    bool _843 = _839 || _841;
    bool _845 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _847 = _843 || _845;
    float _849 = float(_847);
    float _851 = _785 * _723;
    int _853 = ~_787;
    int _855 = _853 + 1;
    int _857 = _855 + 1;
    float _859 = _783 * _837;
    float _861 = rsqrt(_703);
    float _863 = -_849;
    float _865 = _863 + 1.0;
    float _867 = _849 * _807;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _871 = _431 + _869;
    float _873 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[203].x, _851);
    float _875 = _721 * _865;
    int _877 = _857;
    if (!_833)
    {
        int _879 = ~_787;
        int _881 = _879 + 1;
        _877 = _881;
    }
    int _883 = _877;
    float _885 = fma(_647, _871, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _887 = !_743;
    int _889 = _887 ? 0 : 1;
    float _891 = _817 * _875;
    int _893 = _677 ? 0 : 1;
    float _895 = -_721;
    float _897 = _895 + 1.0;
    bool _899 = !_739;
    int _901 = _899 ? 0 : 1;
    int _903 = abs(_889);
    float _905 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[159].x, _891);
    int _907 = ~_893;
    int _909 = _907 + 1;
    int _911 = _909 + 1;
    float _913 = floor(_873);
    int _915 = _911;
    if (!_667)
    {
        int _917 = ~_893;
        int _919 = _917 + 1;
        _915 = _919;
    }
    int _921 = _915;
    float _923 = fma(_735, _867, _905);
    bool _925 = !_747;
    int _927 = _925 ? 0 : 1;
    float _929 = in.m_69.x;
    float _931 = in.m_69.y;
    float _933 = in.m_69.z;
    int _935 = abs(_901);
    float _937 = _873 + 0.25;
    int _939 = abs(_927);
    float _941 = float(_921);
    float _943 = floor(_937);
    float _945 = float(_939);
    float _947 = abs(_767);
    bool _949 = _947 > 0.001000000047497451305389404296875;
    float _951 = _945 * _941;
    float _953 = float(_903);
    float _955 = -_913;
    float _957 = _873 + _955;
    float _959 = _873 * 6.283185482025146484375;
    float _961 = _949 ? 0.0 : 9.9999997473787516355514526367188e-05;
    float _963 = _951 * (-2.0);
    float _965 = float(_883);
    float _967 = _959 * 0.15915493667125701904296875;
    bool _969 = _957 >= 0.5;
    bool _971 = isnan(_957);
    bool _973 = _969 || _971;
    bool _975 = isnan(0.5);
    bool _977 = _973 || _975;
    float _979 = fma(_575, _963, _575);
    int _981 = abs(_661);
    float _983 = -_943;
    float _985 = _937 + _983;
    float _987 = _967 * 6.283185482025146484375;
    float _989 = sin(_987);
    float _991 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[191].x, _166);
    float _993 = fma(_963, _933, _933);
    bool _995 = !_977;
    float _997 = _995 ? 0.5 : (-0.5);
    float _999 = _437 + (-0.5);
    bool _1001 = _985 > 0.5;
    float _1003 = _767 + _961;
    float _1005 = float(_981);
    float _1007 = fma(_999, (*spvDescriptorSet0.vp_c9)._m0[196].z, _993);
    int _1009 = abs(_595);
    float _1011 = _997 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1013 = _1011 * 2.0;
    float _1015 = float(_935);
    float _1017 = _861 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1019 = float(_829);
    float _1021 = _1005 * _1013;
    float _1023 = float(_1009);
    float _1025 = _989 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    int _1027 = abs(_651);
    float _1029 = _985;
    float _1031 = _1003;
    float _1033 = _1021;
    if (_1001)
    {
        float _1035 = -_985;
        float _1037 = _1035 + 1.0;
        _1029 = _1037;
    }
    float _1039 = _1029;
    float _1041 = _1015 * _965;
    float _1043 = _953 * _1019;
    float _1045 = fma(_1023, _1025, _1021);
    float _1047 = fma(_1039, 4.0, -1.0);
    float _1049 = float(_1027);
    float _1051 = _1043 * (-2.0);
    float _1053 = abs(_765);
    float _1055 = abs(_1003);
    float _1057 = precise::max(_1053, _1055);
    float _1059 = _1047 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1061 = _861 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1063 = _861 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1065 = fma(_979, _621, _1007);
    float _1067 = fma(_1049, _1059, _1045);
    float _1069 = fma(_623, _1051, _623);
    bool _1071 = _1057 >= 16.0;
    float _1073 = fma(_1051, _931, _931);
    float _1075 = fma(_1067, 3.1415927410125732421875, _929);
    float _1077 = _1041 * (-2.0);
    float _1079 = _471 + (-0.5);
    float _1081 = _166 + (-0.5);
    float _1083 = _991 * 0.15915493667125701904296875;
    float _1085 = fma(_1075, _1077, _1075);
    float _1087 = fma(_1079, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1073);
    float _1089 = fma(_657, _1077, _657);
    float _1091 = _1065 * 0.15915493667125701904296875;
    float _1093 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1085);
    float _1095 = fma(_1069, _621, _1087);
    if (_1071)
    {
        float _1097 = _765 * 0.0625;
        _821 = _1097;
    }
    float _1099 = _821;
    if (_1071)
    {
        float _1101 = _1003 * 0.0625;
        _1031 = _1101;
    }
    float _1103 = _1031;
    float _1105 = fma(_1089, _621, _1093);
    float _1107 = _1095 * 0.15915493667125701904296875;
    float _1109 = fma(_809, _859, _923);
    float _1111 = in.m_71.x;
    float _1113 = in.m_71.y;
    float _1115 = in.m_71.z;
    float _1117 = abs(_1099);
    bool _1119 = _1117 != 0.0;
    bool _1121 = isnan(_1117);
    bool _1123 = _1119 || _1121;
    bool _1125 = isnan(0.0);
    bool _1127 = _1123 || _1125;
    float _1129 = _1061 * _1061;
    bool _1131 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1133 = isnan(_431);
    bool _1135 = _1131 || _1133;
    bool _1137 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1139 = _1135 || _1137;
    float _1141 = float(_1139);
    float _1143 = fma(_581, _831, _1109);
    float _1145 = abs(_1103);
    bool _1147 = _1145 == 0.0;
    bool _1149 = !_1127;
    bool _1151 = _1147 && _1149;
    float _1153 = _1083 * 6.283185482025146484375;
    float _1155 = sin(_1153);
    float _1157 = fma(_1063, _1063, _1129);
    float _1159 = -_1141;
    float _1161 = _1159 + 1.0;
    float _1163 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1165 = _431 + _1163;
    float _1167 = fma(_885, _791, _1143);
    float _1169 = fma(_1017, _1017, _1157);
    float _1171 = _1105 * 0.15915493667125701904296875;
    float _1173 = abs(_1103);
    bool _1175 = _1173 == 0.0;
    float _1177 = _759 * _1161;
    float _1179 = fma(_761, _1165, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1181 = fma(_663, _789, _1167);
    float _1183 = rsqrt(_1169);
    int _1185 = as_type<int>(_1167);
    if (_1151)
    {
        bool _1187 = as_type<int>(_1103) >= 0;
        _823 = _1187;
    }
    bool _1189 = _823;
    float _1191 = fma(_1179, _1177, _1181);
    int _1193 = _1189 ? (-1) : 0;
    if (_1151)
    {
        int _1195 = _1189 ? 0 : 1078530011;
        _1185 = _1195;
    }
    int _1197 = _1185;
    float _1199 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1191);
    float _1201 = _1091 * 6.283185482025146484375;
    float _1203 = sin(_1201);
    float _1205 = _1155 * _1115;
    float _1207 = _1199 * _1111;
    float _1209 = _1199 * _1113;
    float _1211 = _1199 * _1205;
    int _1213 = as_type<int>(_1111);
    if (_1151)
    {
        int _1215 = int(0x80000000) & as_type<int>(_1099);
        int _1217 = _1197 | _1215;
        _1213 = _1217;
    }
    int _1219 = _1213;
    float _1221 = _1091 * 6.283185482025146484375;
    float _1223 = cos(_1221);
    float _1225 = _1107 * 6.283185482025146484375;
    float _1227 = cos(_1225);
    float _1229 = _1171 * 6.283185482025146484375;
    float _1231 = sin(_1229);
    float _1233 = _1171 * 6.283185482025146484375;
    float _1235 = cos(_1233);
    bool _1237 = !_1127;
    bool _1239 = _1237 && _1175;
    int _1241 = _1219;
    float _1243 = as_type<float>(_1219);
    if (!_1239)
    {
        float _1245 = abs(_1099);
        bool _1247 = _1245 != as_type<float>(0x7f800000u /* inf */);
        bool _1249 = isnan(_1245);
        bool _1251 = _1247 || _1249;
        bool _1253 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1255 = _1251 || _1253;
        float _1257 = abs(_1103);
        bool _1259 = _1257 == as_type<float>(0x7f800000u /* inf */);
        float _1261 = abs(_1103);
        bool _1263 = _1261 == as_type<float>(0x7f800000u /* inf */);
        bool _1265 = !_1255;
        bool _1267 = _1263 && _1265;
        if (_1267)
        {
            bool _1269 = as_type<int>(_1103) >= 0;
            _1193 = _1269 ? (-1) : 0;
        }
        int _1271 = _1193;
        if (_1267)
        {
            _1241 = 1075235812;
        }
        int _1273 = _1241;
        int _1275 = _1273;
        if (_1267)
        {
            int _1277 = ~_1271;
            int _1279 = (_1277 != 0) ? _1273 : 1061752795;
            _1275 = _1279;
        }
        int _1281 = _1275;
        float _1283 = as_type<float>(_1281);
        if (_1267)
        {
            int _1285 = int(0x80000000) & as_type<int>(_1099);
            int _1287 = _1281 | _1285;
            _1283 = as_type<float>(_1287);
        }
        float _1289 = _1283;
        bool _1291 = !_1255;
        bool _1293 = _1291 && _1259;
        _1243 = _1289;
        if (!_1293)
        {
            float _1295 = abs(_1099);
            float _1297 = abs(_1103);
            float _1299 = precise::max(_1295, _1297);
            float _1301 = abs(_1099);
            float _1303 = abs(_1103);
            float _1305 = precise::min(_1301, _1303);
            float _1307 = 1.0 / _1299;
            float _1309 = abs(_1099);
            float _1311 = abs(_1103);
            bool _1313 = _1309 > _1311;
            bool _1315 = as_type<int>(_1103) >= 0;
            float _1317 = _1305 * _1307;
            float _1319 = _1317 * _1317;
            float _1321 = _1319 + 11.33538818359375;
            float _1323 = fma(_1319, _1321, 28.84246826171875);
            float _1325 = fma(_1319, _1323, 19.6966705322265625);
            float _1327 = fma(_1319, -0.82336294651031494140625, -5.674867153167724609375);
            float _1329 = fma(_1319, _1327, -6.565555095672607421875);
            float _1331 = 1.0 / _1325;
            float _1333 = _1319 * _1329;
            float _1335 = abs(_1099);
            float _1337 = abs(_1103);
            float _1339 = _1335 + _1337;
            float _1341 = _1317 * _1333;
            bool _1343 = _1339 > as_type<float>(0x7f800000u /* inf */);
            bool _1345 = isnan(_1339);
            bool _1347 = _1343 || _1345;
            bool _1349 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1351 = _1347 || _1349;
            float _1353 = fma(_1341, _1331, _1317);
            int _1355 = as_type<int>(_1099) & int(0x80000000);
            float _1357 = _1353;
            _1243 = _1339;
            if (_1313)
            {
                float _1359 = -_1353;
                float _1361 = _1359 + 1.57079637050628662109375;
                _1357 = _1361;
            }
            float _1363 = _1357;
            int _1365 = as_type<int>(_1363);
            if (!_1315)
            {
                float _1367 = -_1363;
                float _1369 = _1367 + 3.1415927410125732421875;
                _1365 = as_type<int>(_1369);
            }
            int _1371 = _1365;
            if (!_1351)
            {
                int _1373 = _1355 | _1371;
                _1243 = as_type<float>(_1373);
            }
        }
    }
    float _1375 = _1243;
    float _1377 = _1107 * 6.283185482025146484375;
    float _1379 = sin(_1377);
    float _1381 = _375 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1383 = _379 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1385 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1209);
    float _1387 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1211);
    float _1389 = _367 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1391 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1207);
    float _1393 = _1381 * _1385;
    float _1395 = _1383 * _1387;
    float _1397 = _1227 * _1203;
    float _1399 = _1389 * _1391;
    float _1401 = _1235 * _1203;
    float _1403 = _1231 * _1203;
    float _1405 = _1375 * (-0.15915493667125701904296875);
    float _1407 = _1235 * _1223;
    float _1409 = _1227 * _1223;
    float _1411 = _1231 * _1223;
    float _1413 = _1405 * 6.283185482025146484375;
    float _1415 = cos(_1413);
    float _1417 = fma(_1379, _1403, _1407);
    float _1419 = _1231 * _1227;
    float _1421 = _1235 * _1227;
    float _1423 = -_1401;
    float _1425 = fma(_1379, _1411, _1423);
    float _1427 = _1417 * _1393;
    float _1429 = -_1411;
    float _1431 = fma(_1379, _1401, _1429);
    float _1433 = _1419 * _1393;
    float _1435 = _1405 * 6.283185482025146484375;
    float _1437 = sin(_1435);
    float _1439 = _1425 * _1393;
    float _1441 = fma(_1397, _1399, _1427);
    float _1443 = fma(_1379, _1407, _1403);
    float _1445 = -_1379;
    float _1447 = fma(_1445, _1399, _1433);
    float _1449 = fma(_1409, _1399, _1439);
    float _1451 = fma(_1431, _1395, _1441);
    float _1453 = _1063 * _1183;
    float _1455 = _1061 * _1183;
    float _1457 = _1017 * _1183;
    float _1459 = fma(_1443, _1395, _1449);
    float _1461 = -_1415;
    float _1463 = _1461 + 1.0;
    float _1465 = _1451 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1467 = fma(_1421, _1395, _1447);
    float _1469 = _1451 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1471 = _1451 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1473 = _1457 * _1437;
    float _1475 = _1453 * _1463;
    float _1477 = fma(_1459, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1465);
    float _1479 = fma(_1459, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1469);
    float _1481 = fma(_1459, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1471);
    float _1483 = _1457 * _1457;
    float _1485 = -_1473;
    float _1487 = fma(_1455, _1475, _1485);
    float _1489 = fma(_1467, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1477);
    float _1491 = _1453 * _1437;
    float _1493 = _1455 * _1463;
    float _1495 = fma(_1467, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1479);
    float _1497 = fma(_1453, _1475, _1415);
    float _1499 = _1489 * _1487;
    float _1501 = fma(_1463, _1483, _1415);
    float _1503 = fma(_1467, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1481);
    float _1505 = _1455 * _1437;
    float _1507 = fma(_1457, _1493, _1491);
    float _1509 = _373 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1511 = _373 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1513 = fma(_1495, _1497, _1499);
    float _1515 = -_1505;
    float _1517 = fma(_1457, _1475, _1515);
    float _1519 = _1489 * _1507;
    float _1521 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1509);
    float _1523 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1511);
    float _1525 = fma(_1457, _1475, _1505);
    float _1527 = fma(_1495, _1517, _1519);
    float _1529 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1521);
    float _1531 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1523);
    float _1533 = fma(_1503, _1525, _1513);
    float _1535 = fma(_1503, _1501, _1527);
    float _1537 = _1529 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1539 = _1531 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1541 = in.m_73.y;
    float _1543 = _1537 + _1533;
    float _1545 = _1539 + _1535;
    float _1547 = in.m_75.x;
    float _1549 = in.m_75.y;
    float _1551 = in.m_75.z;
    int _1553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1555 = _1553 != 0;
    float _1557 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1559 = _1543 + _1557;
    float _1561 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1563 = _1545 + _1561;
    int _1565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1567 = _1565 != 0;
    float _1569 = in.m_73.x;
    float _1571 = _1559 * _1559;
    float _1573 = _1563 * _1563;
    bool _1575 = _1209 != 0.0;
    bool _1577 = isnan(_1209);
    bool _1579 = _1575 || _1577;
    bool _1581 = isnan(0.0);
    bool _1583 = _1579 || _1581;
    float _1585 = _373 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1587 = _166 > 0.5;
    bool _1589 = _1587 && _1555;
    float _1591 = _1571 + _1573;
    bool _1593 = _1207 == 0.0;
    bool _1595 = !_1583;
    bool _1597 = _1593 && _1595;
    float _1599 = fma(_1455, _1493, _1415);
    bool _1601 = _471 > 0.5;
    float _1603 = sqrt(_1591);
    bool _1605 = _1211 == 0.0;
    bool _1607 = _1605 && _1597;
    float _1609 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1585);
    float _1611 = fma(_1455, _1475, _1473);
    float _1613 = _1489 * _1599;
    float _1615 = -_1541;
    float _1617 = _1615 + 1.0;
    float _1619 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1609);
    float _1621 = -_1491;
    float _1623 = fma(_1457, _1493, _1621);
    float _1625 = fma(_1495, _1611, _1613);
    float _1627 = _1541;
    float _1629 = _1617;
    float _1631 = _1613;
    float _1633 = _1571;
    float _1635 = _1573;
    if (_1567)
    {
        float _1637 = _1601 ? _1617 : _1541;
        _1627 = _1637;
    }
    float _1639 = _1627;
    float _1641 = _1619 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1643 = fma(_1503, _1623, _1625);
    float _1645 = _1549;
    float _1647 = _1547;
    float _1649 = _1551;
    if (!_1607)
    {
        float _1651 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1549);
        _1645 = _1651;
    }
    float _1653 = _1645;
    if (_1555)
    {
        _1033 = _1569;
    }
    float _1655 = _1033;
    float _1657 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1659 = _1603 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1661 = _1655;
    if (!_1607)
    {
        float _1663 = fma(_1207, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1547);
        _1647 = _1663;
    }
    float _1665 = _1647;
    float _1667 = _1419 * _1653;
    float _1669 = _1667;
    if (_1589)
    {
        float _1671 = -_1655;
        float _1673 = _1671 + 1.0;
        _1661 = _1673;
    }
    float _1675 = _1661;
    float _1677 = _1641 + _1643;
    float _1679 = _1425 * _1653;
    float _1681 = _1677;
    if (!_1555)
    {
        _411 = _1569;
    }
    float _1683 = _411;
    float _1685 = -_1379;
    float _1687 = fma(_1685, _1665, _1667);
    float _1689 = _1683;
    if (_1555)
    {
        _1689 = _1675;
    }
    float _1691 = _1689;
    float _1693 = _1417 * _1653;
    float _1695 = fma(_1409, _1665, _1679);
    if (!_1659)
    {
        _1629 = _1543;
    }
    float _1697 = _1629;
    float _1699 = _1697;
    if (!_1659)
    {
        _1631 = _1545;
    }
    float _1701 = _1631;
    float _1703 = _1701;
    if (!_1659)
    {
        _1669 = _1677;
    }
    float _1705 = _1669;
    bool _1707 = !_1659;
    float _1709 = _1705;
    if (!_1707)
    {
        float _1711 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1713 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1715 = _1603 + _1713;
        float _1717 = rsqrt(_1591);
        float _1719 = _1715 * _1711;
        float _1721 = _1677 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1723 = _1719 * 0.15915493667125701904296875;
        float _1725 = _1723 * 6.283185482025146484375;
        float _1727 = sin(_1725);
        float _1729 = _1723 * 6.283185482025146484375;
        float _1731 = cos(_1729);
        float _1733 = fma(_1727, _1721, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1735 = _1717 * _1733;
        float _1737 = fma(_1559, _1735, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1739 = _1731 + (-1.0);
        float _1741 = fma(_1563, _1735, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1743 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1745 = _1737 + _1743;
        float _1747 = _1739 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1749 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1751 = _1741 + _1749;
        float _1753 = _1745 * _1745;
        float _1755 = fma(_1677, _1731, _1747);
        float _1757 = _1751 * _1751;
        _1709 = _1755;
        _1633 = _1753;
        _1635 = _1757;
        _1699 = _1737;
        _1703 = _1741;
    }
    float _1759 = _1709;
    float _1761 = _1633;
    float _1763 = _1635;
    float _1765 = _1699;
    float _1767 = _1703;
    float _1769 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1771 = _1759 + _1769;
    float _1773 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (!_1607)
    {
        float _1775 = fma(_1211, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1551);
        _1649 = _1775;
    }
    float _1777 = _1649;
    float _1779 = fma(_1397, _1665, _1693);
    float _1781 = fma(_1771, _1771, _1761);
    float _1783 = _1639 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1785 = fma(_1443, _1777, _1695);
    float _1787 = fma(_1431, _1777, _1779);
    float _1789 = _1781 + _1763;
    float _1791 = _1691 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1793 = fma(_1421, _1777, _1687);
    float _1795 = _1787 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1797 = _1787 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1799 = _1787 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1801 = sqrt(_1789);
    float _1803 = fma(_1785, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1795);
    float _1805 = fma(_1785, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1797);
    float _1807 = fma(_1785, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1799);
    float _1809 = _1783 * _1657;
    float _1811 = _1791 * _1773;
    float _1813 = fma(_1793, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1803);
    float _1815 = fma(_1793, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1805);
    float _1817 = fma(_1793, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1807);
    out.m_77.x = _397;
    out.m_77.y = _399;
    out.m_77.z = _401;
    out.m_77.w = _395;
    out.m_79.x = _403;
    out.m_79.y = _405;
    out.m_79.z = _407;
    bool _1819 = _1801 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1821 = isnan(_1801);
    bool _1823 = _1819 || _1821;
    bool _1825 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1827 = _1823 || _1825;
    out.m_81.x = 1.0;
    out.m_81.y = 1.0;
    out.m_81.z = 1.0;
    out.m_83.x = _1811;
    out.m_83.y = _1809;
    out.m_85.x = _1813;
    out.m_85.y = _1815;
    out.m_85.z = _1817;
    if (!_1827)
    {
        _1681 = 1.0;
    }
    float _1829 = _1681;
    bool _1831 = !_1827;
    float _1833 = _1829;
    if (!_1831)
    {
        bool _1835 = _1801 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1837 = isnan(_1801);
        bool _1839 = _1835 || _1837;
        bool _1841 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1843 = _1839 || _1841;
        if (!_1843)
        {
            float _1845 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1847 = _1801 + _1845;
            float _1849 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1851 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1849;
            float _1853 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1855 = _1853 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1857 = 1.0 / _1851;
            float _1859 = _1847 * _1857;
            float _1861 = fma(_1859, _1855, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1833 = _1861;
            _1863 = true;
        }
        else
        {
            bool _1865 = _1801 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1867 = isnan(_1801);
            bool _1869 = _1865 || _1867;
            bool _1871 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1873 = _1869 || _1871;
            if (!_1873)
            {
                float _1875 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1877 = _1801 + _1875;
                float _1879 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1881 = _1879 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1883 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1885 = _1883 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1887 = 1.0 / _1881;
                float _1889 = _1877 * _1887;
                float _1891 = fma(_1889, _1885, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1833 = _1891;
                _1863 = true;
            }
            else
            {
                _1833 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1863 = false;
    float _1893 = _1833;
    float _1895 = fma(_1537, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1897 = fma(_1539, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1899 = floor(_1895);
    float _1901 = floor(_1897);
    float _1903 = -_1899;
    float _1905 = _1895 + _1903;
    float _1907 = -_1901;
    float _1909 = _1897 + _1907;
    float2 _6157 = float2(_1905, _1909);
    float _1911 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6157, float2(0.0), isnan(_6157)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6157, float2(0.0), isnan(_6157)), level(0.0)).x;
    float _1913 = _1641 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1915 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1917 = _1765 + _1915;
    float _1919 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1913);
    float _1921 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1923 = _1767 + _1921;
    float _1925 = fma(_1539, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1919);
    float _1927 = _1641 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1929 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    bool _1931 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1933 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1935 = _1931 || _1933;
    bool _1937 = isnan(0.5);
    bool _1939 = _1935 || _1937;
    float _1941 = _1925 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1943 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1927);
    float _1945 = _1641 + _1929;
    float _1947 = fma(_1917, _1893, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1949 = 1.0 / _1941;
    float _1951 = fma(_1539, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1943);
    float _1953 = _1945 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1955 = _1951 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1957 = fma(_1537, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1953);
    float _1959 = _1955 + _1941;
    float _1961 = fma(_1539, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1957);
    float _1963 = _1961 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1965 = _1959 * _1949;
    float _1967 = _1965 * 0.5;
    float _1969 = trunc(_1963);
    int _1971 = int(_1969);
    float _1973 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1975 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1973);
    float _1977 = 1.0 / _1975;
    int _1979 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1981 = _1971 + _1979;
    int _1983 = _1981 + 1;
    float _1985 = _1945 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1987 = fma(_1537, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1985);
    float _1989 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1991 = _1977 * _1989;
    bool _1993 = _1991 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1995 = _1991 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1997 = !_1993;
    int _1999 = _1997 ? 0 : 1;
    int _2001 = 2;
    float _2003 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _2005 = _1917;
    int _2007 = as_type<int>(_1923);
    if (!_1993)
    {
        _2001 = 1;
    }
    int _2009 = _2001;
    int _2011 = _2009;
    if (!_1995)
    {
        _2011 = _1999;
    }
    int _2013 = _2011;
    float _2015 = fma(_1539, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1987);
    bool _2017 = _1983 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2019 = _2013 << 6;
    float _2021 = _2015 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _2023 = _2019 + 48;
    uint _2025 = uint(int(uint(_2023) >> uint(2)));
    uint _2027 = uint(int(uint(int(_2025)) >> uint(2)));
    int _2029 = int(_2025) & 3;
    float _2031 = (*spvDescriptorSet0.vp_c15)._m0[int(_2027)][_2029];
    int _2033 = int(_2025) + 1;
    uint _2035 = uint(int(uint(_2033) >> uint(2)));
    int _2037 = _2033 & 3;
    float _2039 = (*spvDescriptorSet0.vp_c15)._m0[int(_2035)][_2037];
    float _2041 = trunc(_2021);
    int _2043 = int(_2041);
    int _2045 = _2019 + 56;
    uint _2047 = uint(int(uint(_2045) >> uint(2)));
    uint _2049 = uint(int(uint(int(_2047)) >> uint(2)));
    int _2051 = int(_2047) & 3;
    float _2053 = (*spvDescriptorSet0.vp_c15)._m0[int(_2049)][_2051];
    int _2055 = int(_2047) + 1;
    uint _2057 = uint(int(uint(_2055) >> uint(2)));
    int _2059 = _2055 & 3;
    float _2061 = (*spvDescriptorSet0.vp_c15)._m0[int(_2057)][_2059];
    int _2063 = _2019 + 64;
    uint _2065 = uint(int(uint(_2063) >> uint(2)));
    uint _2067 = uint(int(uint(int(_2065)) >> uint(2)));
    int _2069 = int(_2065) & 3;
    float _2071 = (*spvDescriptorSet0.vp_c15)._m0[int(_2067)][_2069];
    int _2073 = int(_2065) + 1;
    uint _2075 = uint(int(uint(_2073) >> uint(2)));
    int _2077 = _2073 & 3;
    float _2079 = (*spvDescriptorSet0.vp_c15)._m0[int(_2075)][_2077];
    int _2081 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2083 = _2043 + _2081;
    int _2085 = _2083 + 1;
    int _2087 = _1983 | _2085;
    int _2089 = _2019 + 72;
    uint _2091 = uint(int(uint(_2089) >> uint(2)));
    uint _2093 = uint(int(uint(int(_2091)) >> uint(2)));
    int _2095 = int(_2091) & 3;
    float _2097 = (*spvDescriptorSet0.vp_c15)._m0[int(_2093)][_2095];
    int _2099 = int(_2091) + 1;
    uint _2101 = uint(int(uint(_2099) >> uint(2)));
    int _2103 = _2099 & 3;
    float _2105 = (*spvDescriptorSet0.vp_c15)._m0[int(_2101)][_2103];
    bool _2107 = _2087 < 0;
    bool _2109 = _2107 || _2017;
    float _2111 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2113 = _1759 + _2111;
    bool _2115 = _2085 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2117 = _2115 || _2109;
    float _2119 = fma(_2113, _1893, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2121 = fma(_1923, _1893, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    int _2123 = _2019 + 96;
    uint _2125 = uint(int(uint(_2123) >> uint(2)));
    uint _2127 = uint(int(uint(int(_2125)) >> uint(2)));
    int _2129 = int(_2125) & 3;
    float _2131 = (*spvDescriptorSet0.vp_c15)._m0[int(_2127)][_2129];
    int _2133 = int(_2125) + 1;
    uint _2135 = uint(int(uint(_2133) >> uint(2)));
    int _2137 = _2133 & 3;
    float _2139 = (*spvDescriptorSet0.vp_c15)._m0[int(_2135)][_2137];
    float _2141 = _2113;
    if (_1939)
    {
        _2141 = _1947;
    }
    float _2143 = _2141;
    float _2145 = _2143;
    if (_1939)
    {
        _2003 = _2119;
    }
    float _2147 = _2003;
    float _2149 = _2147;
    if (_1939)
    {
        _2005 = _2121;
    }
    float _2151 = _2005;
    int _2153 = _2019 + 104;
    uint _2155 = uint(int(uint(_2153) >> uint(2)));
    uint _2157 = uint(int(uint(int(_2155)) >> uint(2)));
    int _2159 = int(_2155) & 3;
    float _2161 = (*spvDescriptorSet0.vp_c15)._m0[int(_2157)][_2159];
    int _2163 = int(_2155) + 1;
    uint _2165 = uint(int(uint(_2163) >> uint(2)));
    int _2167 = _2163 & 3;
    float _2169 = (*spvDescriptorSet0.vp_c15)._m0[int(_2165)][_2167];
    float _2171 = _2151;
    int _2173 = as_type<int>(_2139);
    if (!_1939)
    {
        float _2175 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2177 = _1641 + _2175;
        float _2179 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2181 = _1537 + _2179;
        float _2183 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2185 = -_1539;
        float _2187 = _2185 + _2121;
        float _2189 = _2177 * _2177;
        float _2191 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2193 = _1539 + _2191;
        float _2195 = fma(_2181, _2181, _2189);
        float _2197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2199 = fma(_2193, _2193, _2195);
        float _2201 = sqrt(_2199);
        float _2203 = _2183 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2205 = precise::min(_2201, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2207 = _2205 * _2197;
        float _2209 = -_1641;
        float _2211 = _2209 + _2119;
        float _2213 = _2203 * _2207;
        float _2215 = -_1537;
        float _2217 = _2215 + _1947;
        float _2219 = fma(_2211, _2213, _1641);
        float _2221 = fma(_2217, _2213, _1537);
        float _2223 = fma(_2187, _2213, _1539);
        _2149 = _2219;
        _2007 = as_type<int>(_2213);
        _2145 = _2221;
        _2171 = _2223;
    }
    float _2225 = _2149;
    int _2227 = _2007;
    float _2229 = _2145;
    float _2231 = _2171;
    float _2233 = _1945 * _2139;
    int _2235 = _2227;
    if (!_2117)
    {
        int _2237 = _2085 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2239 = _2237 + _1983;
        _2235 = _2239;
    }
    int _2241 = _2235;
    float _2243 = _2225 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2245 = _1945 * _2079;
    float _2247 = fma(_1537, _2131, _2233);
    float _2249 = _1945 * _2039;
    int _2251 = as_type<int>(_2249);
    float _2253 = _2247;
    if (!_2117)
    {
        int _2255 = _2241 << 2;
        _2173 = _2255;
    }
    int _2257 = _2173;
    float _2259 = fma(_2229, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2243);
    float _2261 = fma(_1539, _2161, _2247);
    float _2263 = fma(_1537, _2031, _2249);
    int _2265 = _2257;
    if (!_2117)
    {
        uint _2267 = uint(int(uint(_2241) >> uint(2)));
        _2251 = int(_2267);
    }
    int _2269 = _2251;
    float _2271 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2259);
    float _2273 = _2261 + _2169;
    if (!_2117)
    {
        int _2275 = 12 & _2257;
        _2265 = _2275;
    }
    int _2277 = _2265;
    float _2279 = fma(_1537, _2071, _2245);
    float _2281 = _2271 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _2283 = _2019 + 80;
    uint _2285 = uint(int(uint(_2283) >> uint(2)));
    uint _2287 = uint(int(uint(int(_2285)) >> uint(2)));
    int _2289 = int(_2285) & 3;
    float _2291 = (*spvDescriptorSet0.vp_c15)._m0[int(_2287)][_2289];
    int _2293 = int(_2285) + 1;
    uint _2295 = uint(int(uint(_2293) >> uint(2)));
    int _2297 = _2293 & 3;
    float _2299 = (*spvDescriptorSet0.vp_c15)._m0[int(_2295)][_2297];
    if (!_2117)
    {
        int _2301 = _2269 << 4;
        int _2303 = _2301 + _2277;
        _2253 = as_type<float>(_2303);
    }
    float _2305 = _2253;
    float _2307 = 1.0 / _2273;
    float _2309 = fma(_1539, _2053, _2263);
    float _2311 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2313 = _2281 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2315 = fma(_1539, _2097, _2279);
    float _2317 = _2225 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2319 = _2305;
    if (!_2117)
    {
        int _2321 = as_type<int>(_2305) + 400;
        uint _2323 = uint(int(uint(_2321) >> uint(2)));
        uint _2325 = uint(int(uint(int(_2323)) >> uint(2)));
        int _2327 = int(_2323) & 3;
        float _2329 = (*spvDescriptorSet0.vp_c15)._m0[int(_2325)][_2327];
        _2319 = _2329;
    }
    float _2331 = _2319;
    float _2333 = -_2313;
    float _2335 = fma(_2333, _2311, 1.0);
    float _2337 = _2309 + _2061;
    float _2339 = _2225 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2341 = fma(_2229, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2317);
    float _2343 = _2225 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2345 = _2315 + _2105;
    float _2347 = fma(_2229, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2339);
    int _2349 = _2019 + 88;
    uint _2351 = uint(int(uint(_2349) >> uint(2)));
    uint _2353 = uint(int(uint(int(_2351)) >> uint(2)));
    int _2355 = int(_2351) & 3;
    float _2357 = (*spvDescriptorSet0.vp_c15)._m0[int(_2353)][_2355];
    int _2359 = int(_2351) + 1;
    uint _2361 = uint(int(uint(_2359) >> uint(2)));
    int _2363 = _2359 & 3;
    float _2365 = (*spvDescriptorSet0.vp_c15)._m0[int(_2361)][_2363];
    float _2367 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2341);
    float _2369 = _2337 * _2307;
    float _2371 = fma(_2229, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2343);
    float _2373 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2347);
    float _2375 = _2367 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2377 = _2345 * _2307;
    bool _2379 = _2369 >= 0.0;
    float _2381 = _2373 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2383 = _2375 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2385 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2371);
    bool _2387 = _2369 <= 1.0;
    bool _2389 = _2387 && _2379;
    float _2391 = as_type<float>(_2085);
    float _2393 = _2335;
    if (!_2117)
    {
        float _2395 = floor(_2021);
        _2391 = _2395;
    }
    float _2397 = _2391;
    float _2399 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2383);
    float _2401 = _2385 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _2403 = _2377 >= 0.0;
    bool _2405 = _2403 && _2389;
    float _2407 = _2375 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2409 = fma(_2281, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2399);
    float _2411 = _2375 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _2413 = _2377 <= 1.0;
    bool _2415 = _2413 && _2405;
    float _2417 = log2(_2335);
    float _2419 = fma(_2401, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2409);
    float _2421 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2407);
    float _2423 = fma(_2281, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2421);
    float _2425 = 1.0 / _2419;
    float _2427 = _2397;
    float _2429 = _2411;
    float _2431 = _2419;
    if (!_2117)
    {
        float _2433 = -_2397;
        float _2435 = _2021 + _2433;
        _2427 = _2435;
    }
    float _2437 = _2427;
    float _2439 = _1945 * _2299;
    float _2441 = _2437;
    if (_2415)
    {
        float _2443 = float(_2013);
        _2393 = _2443;
    }
    float _2445 = _2393;
    float _2447 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2411);
    float _2449 = _2119;
    float _2451 = _2445;
    if (!_2117)
    {
        float _2453 = floor(_1963);
        _2449 = _2453;
    }
    float _2455 = _2449;
    float _2457 = fma(_1537, _2291, _2439);
    float _2459 = fma(_2281, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2447);
    float _2461 = fma(_2401, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2423);
    float _2463 = fma(_2401, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2459);
    float _2465 = _2421;
    float _2467 = _2463;
    if (_2415)
    {
        float _2469 = rint(_2445);
        float _2471 = precise::max(_2469, 0.0);
        uint _2473 = uint(_2471);
        uint _2475 = clamp(_2473, 0u, 65535u);
        _2465 = as_type<float>(_2475);
    }
    float _2477 = _2465;
    float _2479 = fma(_1539, _2357, _2457);
    float _2481 = _2417 * 0.693147182464599609375;
    float _2483 = _2463 * _2425;
    float _2485 = _2331;
    if (!_2117)
    {
        float _2487 = rint(_2331);
        float _2489 = precise::max(_2487, 0.0);
        uint _2491 = uint(_2489);
        uint _2493 = clamp(_2491, 0u, 65535u);
        _2485 = as_type<float>(_2493);
    }
    float _2495 = _2485;
    float _2497 = _2479 + _2365;
    float _2499 = _2461 * _2425;
    float _2501 = _2481 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2503 = fma(_2483, -0.5, 0.5);
    float _2505 = _2497 * _2307;
    float _2507 = fma(_2499, 0.5, 0.5);
    float _2509 = _2505;
    if (!_2117)
    {
        float _2511 = -_2455;
        float _2513 = _1963 + _2511;
        _2451 = _2513;
    }
    float _2515 = _2451;
    float _2517 = _2477;
    if (_2415)
    {
        float3 _7188 = float3(_2369, _2377, float(as_type<int>(_2477)));
        float3 _7192 = select(_7188, float3(0.0), isnan(_7188));
        float _2519 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7192.xy, uint(rint(_7192.z)), _2505, level(0.0));
        _2517 = _2519;
    }
    float _2521 = _2517;
    float3 _7202 = float3(_2507, _2503, _2501);
    float _2523 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7202, float3(0.0), isnan(_7202)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7202, float3(0.0), isnan(_7202)), level(0.0)).x;
    float3 _7211 = float3(_2507, _2503, _2501);
    float4 _2526 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7211, float3(0.0), isnan(_7211)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7211, float3(0.0), isnan(_7211)), level(0.0)).xyzw;
    float _2528 = _2526.x;
    float _2530 = _2526.y;
    float _2532 = _2526.z;
    float _2534 = _2526.w;
    float _2536 = _2515;
    float _2538 = _2495;
    if (!_2117)
    {
        float3 _7235 = float3(_2515, _2437, float(as_type<int>(_2495)));
        float3 _7237 = select(_7235, float3(0.0), isnan(_7235));
        float _2540 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7237.xy, uint(rint(_7237.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7237.xy, uint(rint(_7237.z)), level(0.0)).x;
        _2536 = _2540;
    }
    float _2542 = _2536;
    if (_2117)
    {
        _2429 = 1.0;
    }
    float _2544 = _2429;
    float _2546 = _2544;
    if (!_2117)
    {
        int _2548 = _2241 << 4;
        int _2550 = _2548 + 2048;
        uint _2552 = uint(int(uint(_2550) >> uint(2)));
        uint _2554 = uint(int(uint(int(_2552)) >> uint(2)));
        int _2556 = int(_2552) & 3;
        float _2558 = (*spvDescriptorSet0.vp_c15)._m0[int(_2554)][_2556];
        int _2560 = int(_2552) + 1;
        uint _2562 = uint(int(uint(_2560) >> uint(2)));
        int _2564 = _2560 & 3;
        float _2566 = (*spvDescriptorSet0.vp_c15)._m0[int(_2562)][_2564];
        int _2568 = _2550 + 8;
        uint _2570 = uint(int(uint(_2568) >> uint(2)));
        uint _2572 = uint(int(uint(int(_2570)) >> uint(2)));
        int _2574 = int(_2570) & 3;
        float _2576 = (*spvDescriptorSet0.vp_c15)._m0[int(_2572)][_2574];
        int _2578 = int(_2570) + 1;
        uint _2580 = uint(int(uint(_2578) >> uint(2)));
        int _2582 = _2578 & 3;
        float _2584 = (*spvDescriptorSet0.vp_c15)._m0[int(_2580)][_2582];
        float _2586 = _1945 * _2566;
        float _2588 = fma(_1537, _2558, _2586);
        float _2590 = fma(_1539, _2576, _2588);
        float _2592 = _2590 + _2584;
        float _2594 = precise::clamp(_2592, 0.0, 1.0);
        float _2596 = -_2594;
        float _2598 = _2596 + _2542;
        float _2600 = fma(_2598, 500.0, 1.5);
        float _2602 = exp2(_2600);
        float _2604 = 0.0 + _2602;
        float _2606 = precise::clamp(_2604, 0.0, 1.0);
        _2546 = _2606;
    }
    float _2608 = _2546;
    float _2610 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2612 = _2225 + _2610;
    float _2614 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2616 = _2229 + _2614;
    float _2618 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2620 = _2231 + _2618;
    float _2622 = _2612 * _2612;
    float _2624 = fma(_2616, _2616, _2622);
    float _2626 = fma(_2620, _2620, _2624);
    float _2628 = rsqrt(_2626);
    float _2630 = _2628 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2632 = _2616 * _2630;
    float _2634 = _2620 * _2630;
    float _2636 = _2632 * _2632;
    float _2638 = _2634 * _2634;
    float _2640 = _2636 + _2638;
    float _2642 = sqrt(_2640);
    bool _2644 = _2642 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2646 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2648 = _2642 + _2646;
    float _2650 = _2620;
    float _2652 = _2628;
    float _2654 = _2648;
    float _2656 = _2630;
    if (_2644)
    {
        float _2658 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2650 = _2658;
    }
    float _2660 = _2650;
    if (_2644)
    {
        float _2662 = rsqrt(_2640);
        _2652 = _2662;
    }
    float _2664 = _2652;
    float _2666 = _2664;
    if (_2644)
    {
        float _2668 = _2648 * _2660;
        _2654 = _2668;
    }
    float _2670 = _2654;
    if (_2644)
    {
        float _2672 = _2670 * 0.15915493667125701904296875;
        _2538 = _2672;
    }
    float _2674 = _2538;
    float _2676 = _2660;
    if (_2644)
    {
        float _2678 = _2674 * 6.283185482025146484375;
        float _2680 = sin(_2678);
        _2676 = _2680;
    }
    float _2682 = _2676;
    float _2684 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2686 = precise::max(0.0, _2684);
    float _2688 = _1963;
    float _2690 = _2686;
    if (_2644)
    {
        float _2692 = _2674 * 6.283185482025146484375;
        float _2694 = cos(_2692);
        _2688 = _2694;
    }
    float _2696 = _2688;
    float _2698 = -_2630;
    float _2700 = -_2686;
    float _2702 = fma(_2612, _2698, _2700);
    float _2704 = _2702;
    if (_2644)
    {
        float _2706 = _2702 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2690 = _2706;
    }
    float _2708 = _2690;
    float _2710 = _2682;
    float _2712 = _2708;
    if (_2644)
    {
        float _2714 = fma(_2682, _2708, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2656 = _2714;
    }
    float _2716 = _2656;
    float _2718 = _2716;
    if (!_2644)
    {
        _2710 = _2634;
    }
    float _2720 = _2710;
    float _2722 = _2720;
    float _2724 = _2696;
    if (_2644)
    {
        float _2726 = _2696 + (-1.0);
        _2712 = _2726;
    }
    float _2728 = _2712;
    float _2730 = _2728;
    if (_2644)
    {
        float _2732 = _2664 * _2716;
        _2441 = _2732;
    }
    float _2734 = _2441;
    if (!_2644)
    {
        _2666 = _2632;
    }
    float _2736 = _2666;
    float _2738 = _2736;
    if (_2644)
    {
        float _2740 = _2728 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2730 = _2740;
    }
    float _2742 = _2730;
    if (_2644)
    {
        float _2744 = _2632 * _2734;
        _2738 = _2744;
    }
    float _2746 = _2738;
    if (!_2644)
    {
        _2718 = _2636;
    }
    float _2748 = _2718;
    float _2750 = _2748;
    if (_2644)
    {
        float _2752 = _2634 * _2734;
        _2722 = _2752;
    }
    float _2754 = _2722;
    if (_2644)
    {
        float _2756 = fma(_2702, _2696, _2742);
        _2704 = _2756;
    }
    float _2758 = _2704;
    if (_2644)
    {
        float _2760 = _2746 * _2746;
        _2750 = _2760;
    }
    float _2762 = _2750;
    if (!_2644)
    {
        _2724 = _2638;
    }
    float _2764 = _2724;
    float _2766 = _2764;
    if (_2644)
    {
        float _2768 = _2754 * _2754;
        _2766 = _2768;
    }
    float _2770 = _2766;
    float _2772 = sqrt(_2626);
    float _2774 = fma(_2758, _2758, _2762);
    float _2776 = _2774 + _2770;
    float _2778 = rsqrt(_2776);
    float _2780 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2782 = fma(_2772, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2780);
    float _2784 = precise::clamp(_2782, 0.0, 1.0);
    float _2786 = -_2784;
    float _2788 = _2786 + 1.0;
    float _2790 = _2778 * _2746;
    float _2792 = _2778 * _2758;
    float _2794 = _2778 * _2754;
    float _2796 = abs(_2788);
    float _2798 = log2(_2796);
    float _2800 = _2790 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2802 = -_2800;
    float _2804 = fma(_2792, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2802);
    float _2806 = -_2794;
    float _2808 = fma(_2806, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2804);
    float _2810 = fma(_2808, -0.5, 0.5);
    float _2812 = fma(_2808, 0.5, 0.5);
    float _2814 = _2792 + 1.0;
    float _2816 = _2798 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2818 = fma(_2812, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2820 = sqrt(_2810);
    float _2822 = fma(_2812, _2818, -0.212114393711090087890625);
    float _2824 = fma(_2812, _2822, 1.570728778839111328125);
    float _2826 = exp2(_2816);
    float _2828 = _2820 * 0.636619746685028076171875;
    float _2830 = -_2792;
    float _2832 = fma(_2826, _2814, _2830);
    float _2834 = -_2824;
    float _2836 = fma(_2828, _2834, 1.0);
    float _2838 = fma(_2832, 0.5, 0.5);
    float2 _7702 = float2(_2836, _2838);
    float3 _2842 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7702, float2(0.0), isnan(_7702)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7702, float2(0.0), isnan(_7702)), level(0.0)).xyz;
    float _2844 = _2842.x;
    float _2846 = _2842.y;
    float _2848 = _2842.z;
    float _2850 = abs(_1991);
    float _2852 = log2(_2850);
    float _2854 = _2798 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2856 = -_1911;
    float _2858 = _2856 + 1.0;
    bool _2860 = _1991 <= 8000.0;
    bool _2862 = isnan(_1991);
    bool _2864 = _2860 || _2862;
    bool _2866 = isnan(8000.0);
    bool _2868 = _2864 || _2866;
    float _2870 = float(_2868);
    float _2872 = exp2(_2854);
    float _2874 = _2852 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2876 = _2375 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2878 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2876);
    float _2880 = exp2(_2874);
    float _2882 = -_2872;
    float _2884 = _2882 + 1.0;
    float _2886 = fma(_2281, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2878);
    float _2888 = _2884 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2890 = fma(_2880, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2892 = precise::clamp(_2890, 0.0, 1.0);
    float _2894 = fma(_2892, -2.0, 3.0);
    float _2896 = _2892 * _2892;
    float _2898 = _2896 * _2894;
    float _2900 = fma(_2401, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2886);
    float _2902 = -_2898;
    float _2904 = _2902 + 1.0;
    float _2906 = _2900 + _2419;
    out.gl_Position.x = _2461;
    out.gl_Position.y = _2463;
    out.gl_Position.z = _2900;
    out.gl_Position.w = _2419;
    float _2908 = fma(_2904, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2898);
    float _2910 = _2906 * 0.5;
    float _2912 = _2870 * _2908;
    float _2914 = _2908;
    float _2916 = _2900;
    if (!_2415)
    {
        _2914 = 1.0;
    }
    float _2918 = _2914;
    out.m_87.z = _2910;
    out.m_87.w = _2419;
    float _2920 = _2918;
    if (_2415)
    {
        bool _2922 = _2521 >= _2505;
        bool _2924 = isnan(_2521);
        bool _2926 = _2922 || _2924;
        bool _2928 = isnan(_2505);
        bool _2930 = _2926 || _2928;
        float _2932 = float(_2930);
        _2920 = _2932;
    }
    float _2934 = _2920;
    float _2936 = _2912 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _2938 = _2772 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2940 = isnan(_2772);
    bool _2942 = _2938 || _2940;
    bool _2944 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2946 = _2942 || _2944;
    float _2948 = _2858 * _2936;
    float _2950 = precise::clamp(_2948, 0.0, 1.0);
    float _2952 = _2934 * _2608;
    float _2954 = _2888 * _2523;
    float _2956 = -_2888;
    float _2958 = _2956 + 1.0;
    float _2960 = -_2950;
    float _2962 = fma(_2960, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2964 = _2534 * _2954;
    float _2966 = _2534 * _2958;
    float _2968 = -_2952;
    float _2970 = fma(_2968, _2962, 1.0);
    float _2972 = precise::clamp(_2970, 0.0, 1.0);
    float _2974 = _2954;
    float _2976 = _2964;
    if (!_2946)
    {
        _2509 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2978 = _2509;
    float _2980 = _2972 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2982 = _2978;
    float _2984 = _2978;
    if (!_2946)
    {
        _2431 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2986 = _2431;
    float _2988 = _2986;
    float _2990 = _2986;
    if (!_2946)
    {
        _2916 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2992 = _2916;
    out.m_89.x = _2980;
    float _2994 = _2992;
    float _2996 = _2992;
    if (!_2946)
    {
        _2467 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2998 = _2467;
    float _3000 = _2848 * _2954;
    float _3002 = fma(_2844, _2964, _2528);
    float _3004 = fma(_2846, _2964, _2530);
    float _3006 = _2998;
    float _3008 = _2998;
    if (!_2946)
    {
        _2974 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3010 = _2974;
    float _3012 = fma(_2534, _3000, _2532);
    float _3014 = _3010;
    float _3016 = _3010;
    if (!_2946)
    {
        _2976 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3018 = _2976;
    out.m_91.x = _3002;
    out.m_91.y = _3004;
    out.m_91.z = _3012;
    out.m_91.w = _2966;
    bool _3020 = !_2946;
    float _3022 = _3018;
    float _3024 = _3018;
    if (!_3020)
    {
        bool _3026 = _2772 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3028 = isnan(_2772);
        bool _3030 = _3026 || _3028;
        bool _3032 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3034 = _3030 || _3032;
        if (!_3034)
        {
            float _3036 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3038 = _2772 + _3036;
            float _3040 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3042 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3040;
            float _3044 = 1.0 / _3042;
            float _3046 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3048 = _3046 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3050 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3052 = _3050 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3054 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3056 = _3054 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3058 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3060 = _3058 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3062 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3064 = _3062 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3066 = _3038 * _3044;
            float _3068 = precise::clamp(_3066, 0.0, 1.0);
            float _3070 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3072 = _3070 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3074 = fma(_3068, _3048, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3076 = fma(_3068, _3072, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3078 = fma(_3068, _3052, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3080 = fma(_3068, _3056, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3082 = fma(_3068, _3060, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3084 = fma(_3068, _3064, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3016 = _3076;
            _3008 = _3082;
            _2984 = _3074;
            _2996 = _3080;
            _2990 = _3078;
            _3024 = _3084;
            _3086 = true;
        }
        else
        {
            bool _3088 = _2772 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3090 = isnan(_2772);
            bool _3092 = _3088 || _3090;
            bool _3094 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3096 = _3092 || _3094;
            if (!_3096)
            {
                _2982 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3098 = _2982;
            _2984 = _3098;
            if (!_3096)
            {
                _3014 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3100 = _3014;
            _3016 = _3100;
            if (!_3096)
            {
                _2988 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3102 = _2988;
            _2990 = _3102;
            if (!_3096)
            {
                _2994 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3104 = _2994;
            _2996 = _3104;
            if (!_3096)
            {
                _3006 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3106 = _3006;
            _3008 = _3106;
            if (!_3096)
            {
                _3022 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3108 = _3022;
            bool _3110 = !_3096;
            _3024 = _3108;
            if (!_3110)
            {
                bool _3112 = _2772 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3114 = isnan(_2772);
                bool _3116 = _3112 || _3114;
                bool _3118 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3120 = _3116 || _3118;
                if (!_3120)
                {
                    float _3122 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3124 = _2772 + _3122;
                    float _3126 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3128 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3126;
                    float _3130 = 1.0 / _3128;
                    float _3132 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3134 = _3132 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3136 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3138 = _3136 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3140 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3142 = _3140 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3144 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3146 = _3144 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3148 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3150 = _3148 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3152 = _3124 * _3130;
                    float _3154 = precise::clamp(_3152, 0.0, 1.0);
                    float _3156 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3158 = _3156 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3160 = fma(_3154, _3134, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3162 = fma(_3154, _3158, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3164 = fma(_3154, _3138, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3166 = fma(_3154, _3142, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3168 = fma(_3154, _3146, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3170 = fma(_3154, _3150, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3016 = _3162;
                    _3008 = _3168;
                    _2984 = _3160;
                    _2996 = _3166;
                    _2990 = _3164;
                    _3024 = _3170;
                    _3086 = true;
                }
                else
                {
                    _3016 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3008 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2984 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2996 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2990 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3024 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3086 = false;
    float _3172 = _3016;
    float _3174 = _3008;
    float _3176 = _2984;
    float _3178 = _2996;
    float _3180 = _2990;
    float _3182 = _3024;
    float _3184 = fma(_1815, -0.5, 0.5);
    float _3186 = precise::clamp(_3184, 0.0, 1.0);
    float _3188 = -_3172;
    float _3190 = _3188 + _3174;
    float _3192 = -_3176;
    float _3194 = _3192 + _3178;
    float _3196 = -_3180;
    float _3198 = _3196 + _3182;
    bool _3200 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3202 = fma(_3186, _3190, _3172);
    float _3204 = fma(_3186, _3194, _3176);
    float _3206 = fma(_3186, _3198, _3180);
    float _3208 = _3202 * 0.586610972881317138671875;
    out.m_93.x = 0.0;
    float _3210 = fma(_3204, 0.298911988735198974609375, _3208);
    float _3212 = fma(_3206, 0.114477999508380889892578125, _3210);
    float _3214 = -_3212;
    float _3216 = _3204 + _3214;
    float _3218 = -_3212;
    float _3220 = _3202 + _3218;
    float _3222 = -_3212;
    float _3224 = _3206 + _3222;
    float _3226 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3228 = fma(_3216, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3212);
    float _3230 = fma(_3220, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3212);
    float _3232 = fma(_3224, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3212);
    out.m_61.x = _3226;
    out.m_95.x = _3228;
    out.m_95.y = _3230;
    out.m_95.z = _3232;
    if (!_3200)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3234 = -_2225;
    float _3236 = _3234 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3238 = -_2229;
    float _3240 = _3238 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3242 = -_2231;
    float _3244 = _3242 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3246 = _3236 * _3236;
    float _3248 = fma(_3240, _3240, _3246);
    float _3250 = fma(_3244, _3244, _3248);
    float _3252 = sqrt(_3250);
    float _3254 = rsqrt(_3250);
    float _3256 = -_3252;
    float _3258 = _3256 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3260 = _3258 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3262 = precise::clamp(_3260, 0.0, 1.0);
    float _3264 = _3240 * _3254;
    float _3266 = _3236 * _3254;
    float _3268 = abs(_3262);
    float _3270 = log2(_3268);
    float _3272 = _3244 * _3254;
    float _3274 = _3264 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3276 = _1815 * _3266;
    float _3278 = -_3266;
    float _3280 = -_3274;
    float _3282 = fma(_3278, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3280);
    float _3284 = fma(_1813, _3264, _3276);
    float _3286 = -_3272;
    float _3288 = fma(_3286, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3282);
    float _3290 = fma(_1817, _3272, _3284);
    float _3292 = precise::clamp(_3290, 0.0, 1.0);
    float _3294 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3296 = _3288 + _3294;
    float _3298 = _3270 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3300 = _3296 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3302 = precise::clamp(_3300, 0.0, 1.0);
    float _3304 = exp2(_3298);
    float _3306 = _3304 * _3302;
    float _3308 = _3292 * _3306;
    float _3310 = _3308 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3312 = _3308 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3314 = _3308 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _3310;
    out.m_93.y = _3312;
    out.m_93.z = _3314;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3086 = false;
    bool _1863 = false;
    bool _429 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_58.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    float _122 = as_type<float>(_114);
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _120;
    if (!_118)
    {
        out.m_61.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _124 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3372 = as_type<float>(_130);
        out.gl_Position.z = _3372;
    }
    if (!_118)
    {
        return out;
    }
    float _134 = in.m_63.w;
    float _136 = float(_114);
    float _138 = -_134;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_134);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    bool _152 = _140 >= _136;
    bool _154 = !_150;
    bool _156 = _152 || _154;
    float _158 = _140;
    if (_156)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _122;
    if (_156)
    {
        out.m_61.x = 0.0;
    }
    if (_156)
    {
        float _162 = _160 * 5.0;
        _132 = as_type<int>(_162);
    }
    int _164 = _132;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3436 = as_type<float>(_164);
        out.gl_Position.z = _3436;
    }
    if (_156)
    {
        return out;
    }
    float _166 = in.m_65.x;
    float _168 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _170 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _172 = in.m_63.x;
    float _174 = in.m_63.y;
    float _176 = in.m_63.z;
    float _178 = in.m_58.x;
    float _180 = in.m_58.y;
    float _182 = in.m_58.z;
    bool _184 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _186 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _188 = _184 || _186;
    bool _190 = isnan(1.0);
    bool _192 = _188 || _190;
    float _194 = _168 * _166;
    float _196 = _170 * _166;
    float _198 = trunc(_194);
    int _200 = int(_198);
    float _202 = trunc(_196);
    int _204 = int(_202);
    int _206 = _200 << 4;
    int _208 = _206 + 1712;
    float _210 = in.m_67.x;
    float _212 = in.m_67.y;
    float _214 = in.m_67.z;
    float _216 = in.m_67.w;
    int _218 = _208 + 8;
    uint _221 = uint(int(uint(_218) >> uint(2)));
    uint _223 = uint(int(uint(int(_221)) >> uint(2)));
    int _225 = int(_221) & 3;
    float _227 = (*spvDescriptorSet0.vp_c9)._m0[int(_223)][_225];
    int _229 = _204 << 4;
    int _231 = _229 + 1968;
    float _233 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _235 = _231 + 8;
    uint _237 = uint(int(uint(_235) >> uint(2)));
    uint _239 = uint(int(uint(int(_237)) >> uint(2)));
    int _241 = int(_237) & 3;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[int(_239)][_241];
    float _245 = 0.0;
    float _247 = _233;
    if (!_192)
    {
        float _249 = _233 * _233;
        float _251 = _249 * 0.5;
        _245 = _251;
    }
    float _253 = _245;
    float _255 = _253;
    if (!_192)
    {
        float _257 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _255 = _257;
    }
    float _259 = _255;
    uint _261 = uint(int(uint(_208) >> uint(2)));
    uint _263 = uint(int(uint(int(_261)) >> uint(2)));
    int _265 = int(_261) & 3;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[int(_263)][_265];
    int _269 = int(_261) + 1;
    uint _271 = uint(int(uint(_269) >> uint(2)));
    int _273 = _269 & 3;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[int(_271)][_273];
    uint _277 = uint(int(uint(_231) >> uint(2)));
    uint _279 = uint(int(uint(int(_277)) >> uint(2)));
    int _281 = int(_277) & 3;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[int(_279)][_281];
    int _285 = int(_277) + 1;
    uint _287 = uint(int(uint(_285) >> uint(2)));
    int _289 = _285 & 3;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[int(_287)][_289];
    bool _293 = !_192;
    float _295 = _259;
    if (!_293)
    {
        float _297 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _299 = log2(_297);
        float _301 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _303 = _301 + 1.0;
        float _305 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _307 = _233 * _299;
        float _309 = 1.0 / _303;
        float _311 = _305 * 0.693147182464599609375;
        float _313 = exp2(_307);
        float _315 = 1.0 / _311;
        float _317 = _313 + (-1.0);
        float _319 = -_317;
        float _321 = fma(_319, _315, _233);
        float _323 = _321 * _309;
        float _325 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _295 = _325;
    }
    float _327 = _295;
    bool _329 = !_192;
    if (!_329)
    {
        float _331 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _333 = log2(_331);
        float _335 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _337 = _335 + 1.0;
        float _339 = 1.0 / _337;
        float _341 = _233 * _333;
        float _343 = exp2(_341);
        float _345 = -_343;
        float _347 = _345 + 1.0;
        float _349 = _347 * _339;
        _247 = _349;
    }
    float _351 = _247;
    float _353 = 1.0 / _136;
    float _355 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _357 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _359 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _361 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _363 = fma(_351, _172, _355);
    float _365 = fma(_351, _174, _357);
    float _367 = _210 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _369 = fma(_351, _176, _361);
    float _371 = fma(_363, _216, _178);
    float _373 = fma(_365, _216, _180);
    float _375 = _212 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _377 = fma(_369, _216, _182);
    float _379 = _214 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _381 = _267 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _383 = _275 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _385 = _283 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _387 = _291 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _389 = _227 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _391 = _243 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _393 = _140 * _353;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _397 = _381 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _399 = _383 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _401 = _389 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _403 = _385 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _405 = _387 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _407 = _391 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _409 = !_359;
    float _411 = _377;
    float _427;
    if (!_409)
    {
        float _413 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _415 = _166 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _417 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[14].x, _140);
        float _419 = _417 * _413;
        float _421 = floor(_419);
        float _423 = -_421;
        float _425 = _419 + _423;
        _427 = _425;
        _429 = true;
    }
    else
    {
        _427 = _393;
    }
    _429 = false;
    float _431 = _427;
    float _433 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _435 = log2(_433);
    float _437 = in.m_65.z;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _441 = _439 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _445 = _443 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _447 = 1.0 / _441;
    int _449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _451 = _449 != 0;
    int _453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _455 = _453 != 0;
    int _457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _459 = _457 != 0;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _465 = (*spvDescriptorSet0.vp_c10)._m0[9].y * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _467 = (*spvDescriptorSet0.vp_c10)._m0[9].y * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _469 = 1.0 / _445;
    float _471 = in.m_65.y;
    float _473 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _477 = _475 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _479 = _435 * _140;
    float _481 = 1.0 / _463;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _487 = fma((*spvDescriptorSet0.vp_c10)._m0[8].y, (*spvDescriptorSet0.vp_c8)._m0[0].x, _465);
    float _489 = fma((*spvDescriptorSet0.vp_c10)._m0[8].y, (*spvDescriptorSet0.vp_c8)._m0[1].x, _467);
    float _491 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _473);
    float _493 = _166 * 2.0;
    float _495 = 1.0 / _485;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _503 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _501;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _505;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _511 = _509 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _513 = _503 * _469;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _519 = exp2(_479);
    float _521 = _507 * _481;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _523;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _531 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _533 = isnan(1.0);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _539 = _535 || _537;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _543 = 1.0 + _541;
    float _545 = _511 * _447;
    float _547 = 1.0 / _477;
    float _549 = _166 + _437;
    bool _551 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _553 = isnan(0.0);
    bool _555 = _551 || _553;
    bool _557 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _559 = _555 || _557;
    float _561 = _517 * _495;
    float _563 = _549 + (-1.0);
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _567 = _431 + _565;
    float _569 = 1.0 / _543;
    float _571 = -_519;
    float _573 = _571 + 1.0;
    float _575 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _581 = fma(_561, _567, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _583 = _559 ? _573 : 0.0;
    float _585 = 1.0 / _499;
    float _587 = _471 * 2.0;
    float _589 = _529 * _547;
    float _591 = _471 + _437;
    bool _593 = !_451;
    int _595 = _593 ? 0 : 1;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _599 = _431 + _597;
    bool _601 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _603 = isnan(_431);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = _591 + (-1.0);
    float _615 = floor(_587);
    float _617 = _437 * 2.0;
    if (_539)
    {
        float _619 = _583 * _569;
        _158 = _619;
    }
    float _621 = _158;
    float _623 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _625 = _166 + _471;
    float _627 = -_611;
    float _629 = _627 + 1.0;
    bool _631 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _633 = isnan(_431);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _639 = _635 || _637;
    float _641 = float(_639);
    float _643 = floor(_493);
    float _645 = _625 + (-1.0);
    float _647 = _525 * _585;
    bool _649 = !_459;
    int _651 = _649 ? 0 : 1;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _653;
    float _657 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _659 = !_455;
    int _661 = _659 ? 0 : 1;
    float _663 = fma(_589, _599, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _665 = floor(_617);
    bool _667 = _615 > 0.0;
    bool _669 = _615 >= 0.0;
    bool _671 = isnan(_615);
    bool _673 = _669 || _671;
    bool _675 = isnan(0.0);
    bool _677 = _673 || _675;
    float _679 = 1.0 / _579;
    bool _681 = _643 >= 0.0;
    bool _683 = isnan(_643);
    bool _685 = _681 || _683;
    bool _687 = isnan(0.0);
    bool _689 = _685 || _687;
    bool _691 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _693 = isnan(_431);
    bool _695 = _691 || _693;
    bool _697 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _699 = _695 || _697;
    float _701 = float(_699);
    float _703 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _491);
    int _705 = _689 ? 0 : 1;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _709 = _431 + _707;
    bool _711 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _713 = isnan(_431);
    bool _715 = _711 || _713;
    bool _717 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _719 = _715 || _717;
    float _721 = float(_719);
    float _723 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    bool _725 = _665 >= 0.0;
    bool _727 = isnan(_665);
    bool _729 = _725 || _727;
    bool _731 = isnan(0.0);
    bool _733 = _729 || _731;
    float _735 = fma(_545, _709, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    int _737 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _739 = _737 != 0;
    int _741 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _743 = _741 != 0;
    int _745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _747 = _745 != 0;
    bool _749 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _751 = isnan(_431);
    bool _753 = _749 || _751;
    bool _755 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _757 = _753 || _755;
    float _759 = float(_757);
    float _761 = _655 * _679;
    bool _763 = _643 > 0.0;
    float _765 = fma((*spvDescriptorSet0.vp_c10)._m0[10].y, (*spvDescriptorSet0.vp_c8)._m0[0].z, _487);
    float _767 = fma((*spvDescriptorSet0.vp_c10)._m0[10].y, (*spvDescriptorSet0.vp_c8)._m0[1].z, _489);
    float _769 = -_759;
    float _771 = _769 + 1.0;
    bool _773 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _775 = isnan(_431);
    bool _777 = _773 || _775;
    bool _779 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _781 = _777 || _779;
    float _783 = float(_781);
    float _785 = _621 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    int _787 = _733 ? 0 : 1;
    float _789 = _611 * _771;
    float _791 = _641 * _629;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _795 = _431 + _793;
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _799 = _431 + _797;
    float _801 = -_641;
    float _803 = _801 + 1.0;
    float _805 = -_783;
    float _807 = _805 + 1.0;
    float _809 = fma(_521, _795, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    int _811 = ~_705;
    int _813 = _811 + 1;
    int _815 = _813 + 1;
    float _817 = fma(_513, _799, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _819 = _815;
    float _821 = _765;
    bool _823 = _667;
    if (!_763)
    {
        int _825 = ~_705;
        int _827 = _825 + 1;
        _819 = _827;
    }
    int _829 = _819;
    float _831 = _701 * _803;
    bool _833 = _665 > 0.0;
    float _835 = -_701;
    float _837 = _835 + 1.0;
    bool _839 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _841 = isnan(_431);
    bool _843 = _839 || _841;
    bool _845 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _847 = _843 || _845;
    float _849 = float(_847);
    float _851 = _785 * _723;
    int _853 = ~_787;
    int _855 = _853 + 1;
    int _857 = _855 + 1;
    float _859 = _783 * _837;
    float _861 = rsqrt(_703);
    float _863 = -_849;
    float _865 = _863 + 1.0;
    float _867 = _849 * _807;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _871 = _431 + _869;
    float _873 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[203].x, _851);
    float _875 = _721 * _865;
    int _877 = _857;
    if (!_833)
    {
        int _879 = ~_787;
        int _881 = _879 + 1;
        _877 = _881;
    }
    int _883 = _877;
    float _885 = fma(_647, _871, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _887 = !_743;
    int _889 = _887 ? 0 : 1;
    float _891 = _817 * _875;
    int _893 = _677 ? 0 : 1;
    float _895 = -_721;
    float _897 = _895 + 1.0;
    bool _899 = !_739;
    int _901 = _899 ? 0 : 1;
    int _903 = abs(_889);
    float _905 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[159].x, _891);
    int _907 = ~_893;
    int _909 = _907 + 1;
    int _911 = _909 + 1;
    float _913 = floor(_873);
    int _915 = _911;
    if (!_667)
    {
        int _917 = ~_893;
        int _919 = _917 + 1;
        _915 = _919;
    }
    int _921 = _915;
    float _923 = fma(_735, _867, _905);
    bool _925 = !_747;
    int _927 = _925 ? 0 : 1;
    float _929 = in.m_69.x;
    float _931 = in.m_69.y;
    float _933 = in.m_69.z;
    int _935 = abs(_901);
    float _937 = _873 + 0.25;
    int _939 = abs(_927);
    float _941 = float(_921);
    float _943 = floor(_937);
    float _945 = float(_939);
    float _947 = abs(_767);
    bool _949 = _947 > 0.001000000047497451305389404296875;
    float _951 = _945 * _941;
    float _953 = float(_903);
    float _955 = -_913;
    float _957 = _873 + _955;
    float _959 = _873 * 6.283185482025146484375;
    float _961 = _949 ? 0.0 : 9.9999997473787516355514526367188e-05;
    float _963 = _951 * (-2.0);
    float _965 = float(_883);
    float _967 = _959 * 0.15915493667125701904296875;
    bool _969 = _957 >= 0.5;
    bool _971 = isnan(_957);
    bool _973 = _969 || _971;
    bool _975 = isnan(0.5);
    bool _977 = _973 || _975;
    float _979 = fma(_575, _963, _575);
    int _981 = abs(_661);
    float _983 = -_943;
    float _985 = _937 + _983;
    float _987 = _967 * 6.283185482025146484375;
    float _989 = sin(_987);
    float _991 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[191].x, _166);
    float _993 = fma(_963, _933, _933);
    bool _995 = !_977;
    float _997 = _995 ? 0.5 : (-0.5);
    float _999 = _437 + (-0.5);
    bool _1001 = _985 > 0.5;
    float _1003 = _767 + _961;
    float _1005 = float(_981);
    float _1007 = fma(_999, (*spvDescriptorSet0.vp_c9)._m0[196].z, _993);
    int _1009 = abs(_595);
    float _1011 = _997 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1013 = _1011 * 2.0;
    float _1015 = float(_935);
    float _1017 = _861 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1019 = float(_829);
    float _1021 = _1005 * _1013;
    float _1023 = float(_1009);
    float _1025 = _989 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    int _1027 = abs(_651);
    float _1029 = _985;
    float _1031 = _1003;
    float _1033 = _1021;
    if (_1001)
    {
        float _1035 = -_985;
        float _1037 = _1035 + 1.0;
        _1029 = _1037;
    }
    float _1039 = _1029;
    float _1041 = _1015 * _965;
    float _1043 = _953 * _1019;
    float _1045 = fma(_1023, _1025, _1021);
    float _1047 = fma(_1039, 4.0, -1.0);
    float _1049 = float(_1027);
    float _1051 = _1043 * (-2.0);
    float _1053 = abs(_765);
    float _1055 = abs(_1003);
    float _1057 = precise::max(_1053, _1055);
    float _1059 = _1047 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1061 = _861 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1063 = _861 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1065 = fma(_979, _621, _1007);
    float _1067 = fma(_1049, _1059, _1045);
    float _1069 = fma(_623, _1051, _623);
    bool _1071 = _1057 >= 16.0;
    float _1073 = fma(_1051, _931, _931);
    float _1075 = fma(_1067, 3.1415927410125732421875, _929);
    float _1077 = _1041 * (-2.0);
    float _1079 = _471 + (-0.5);
    float _1081 = _166 + (-0.5);
    float _1083 = _991 * 0.15915493667125701904296875;
    float _1085 = fma(_1075, _1077, _1075);
    float _1087 = fma(_1079, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1073);
    float _1089 = fma(_657, _1077, _657);
    float _1091 = _1065 * 0.15915493667125701904296875;
    float _1093 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1085);
    float _1095 = fma(_1069, _621, _1087);
    if (_1071)
    {
        float _1097 = _765 * 0.0625;
        _821 = _1097;
    }
    float _1099 = _821;
    if (_1071)
    {
        float _1101 = _1003 * 0.0625;
        _1031 = _1101;
    }
    float _1103 = _1031;
    float _1105 = fma(_1089, _621, _1093);
    float _1107 = _1095 * 0.15915493667125701904296875;
    float _1109 = fma(_809, _859, _923);
    float _1111 = in.m_71.x;
    float _1113 = in.m_71.y;
    float _1115 = in.m_71.z;
    float _1117 = abs(_1099);
    bool _1119 = _1117 != 0.0;
    bool _1121 = isnan(_1117);
    bool _1123 = _1119 || _1121;
    bool _1125 = isnan(0.0);
    bool _1127 = _1123 || _1125;
    float _1129 = _1061 * _1061;
    bool _1131 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1133 = isnan(_431);
    bool _1135 = _1131 || _1133;
    bool _1137 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1139 = _1135 || _1137;
    float _1141 = float(_1139);
    float _1143 = fma(_581, _831, _1109);
    float _1145 = abs(_1103);
    bool _1147 = _1145 == 0.0;
    bool _1149 = !_1127;
    bool _1151 = _1147 && _1149;
    float _1153 = _1083 * 6.283185482025146484375;
    float _1155 = sin(_1153);
    float _1157 = fma(_1063, _1063, _1129);
    float _1159 = -_1141;
    float _1161 = _1159 + 1.0;
    float _1163 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1165 = _431 + _1163;
    float _1167 = fma(_885, _791, _1143);
    float _1169 = fma(_1017, _1017, _1157);
    float _1171 = _1105 * 0.15915493667125701904296875;
    float _1173 = abs(_1103);
    bool _1175 = _1173 == 0.0;
    float _1177 = _759 * _1161;
    float _1179 = fma(_761, _1165, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1181 = fma(_663, _789, _1167);
    float _1183 = rsqrt(_1169);
    int _1185 = as_type<int>(_1167);
    if (_1151)
    {
        bool _1187 = as_type<int>(_1103) >= 0;
        _823 = _1187;
    }
    bool _1189 = _823;
    float _1191 = fma(_1179, _1177, _1181);
    int _1193 = _1189 ? (-1) : 0;
    if (_1151)
    {
        int _1195 = _1189 ? 0 : 1078530011;
        _1185 = _1195;
    }
    int _1197 = _1185;
    float _1199 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1191);
    float _1201 = _1091 * 6.283185482025146484375;
    float _1203 = sin(_1201);
    float _1205 = _1155 * _1115;
    float _1207 = _1199 * _1111;
    float _1209 = _1199 * _1113;
    float _1211 = _1199 * _1205;
    int _1213 = as_type<int>(_1111);
    if (_1151)
    {
        int _1215 = int(0x80000000) & as_type<int>(_1099);
        int _1217 = _1197 | _1215;
        _1213 = _1217;
    }
    int _1219 = _1213;
    float _1221 = _1091 * 6.283185482025146484375;
    float _1223 = cos(_1221);
    float _1225 = _1107 * 6.283185482025146484375;
    float _1227 = cos(_1225);
    float _1229 = _1171 * 6.283185482025146484375;
    float _1231 = sin(_1229);
    float _1233 = _1171 * 6.283185482025146484375;
    float _1235 = cos(_1233);
    bool _1237 = !_1127;
    bool _1239 = _1237 && _1175;
    int _1241 = _1219;
    float _1243 = as_type<float>(_1219);
    if (!_1239)
    {
        float _1245 = abs(_1099);
        bool _1247 = _1245 != as_type<float>(0x7f800000u /* inf */);
        bool _1249 = isnan(_1245);
        bool _1251 = _1247 || _1249;
        bool _1253 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1255 = _1251 || _1253;
        float _1257 = abs(_1103);
        bool _1259 = _1257 == as_type<float>(0x7f800000u /* inf */);
        float _1261 = abs(_1103);
        bool _1263 = _1261 == as_type<float>(0x7f800000u /* inf */);
        bool _1265 = !_1255;
        bool _1267 = _1263 && _1265;
        if (_1267)
        {
            bool _1269 = as_type<int>(_1103) >= 0;
            _1193 = _1269 ? (-1) : 0;
        }
        int _1271 = _1193;
        if (_1267)
        {
            _1241 = 1075235812;
        }
        int _1273 = _1241;
        int _1275 = _1273;
        if (_1267)
        {
            int _1277 = ~_1271;
            int _1279 = (_1277 != 0) ? _1273 : 1061752795;
            _1275 = _1279;
        }
        int _1281 = _1275;
        float _1283 = as_type<float>(_1281);
        if (_1267)
        {
            int _1285 = int(0x80000000) & as_type<int>(_1099);
            int _1287 = _1281 | _1285;
            _1283 = as_type<float>(_1287);
        }
        float _1289 = _1283;
        bool _1291 = !_1255;
        bool _1293 = _1291 && _1259;
        _1243 = _1289;
        if (!_1293)
        {
            float _1295 = abs(_1099);
            float _1297 = abs(_1103);
            float _1299 = precise::max(_1295, _1297);
            float _1301 = abs(_1099);
            float _1303 = abs(_1103);
            float _1305 = precise::min(_1301, _1303);
            float _1307 = 1.0 / _1299;
            float _1309 = abs(_1099);
            float _1311 = abs(_1103);
            bool _1313 = _1309 > _1311;
            bool _1315 = as_type<int>(_1103) >= 0;
            float _1317 = _1305 * _1307;
            float _1319 = _1317 * _1317;
            float _1321 = _1319 + 11.33538818359375;
            float _1323 = fma(_1319, _1321, 28.84246826171875);
            float _1325 = fma(_1319, _1323, 19.6966705322265625);
            float _1327 = fma(_1319, -0.82336294651031494140625, -5.674867153167724609375);
            float _1329 = fma(_1319, _1327, -6.565555095672607421875);
            float _1331 = 1.0 / _1325;
            float _1333 = _1319 * _1329;
            float _1335 = abs(_1099);
            float _1337 = abs(_1103);
            float _1339 = _1335 + _1337;
            float _1341 = _1317 * _1333;
            bool _1343 = _1339 > as_type<float>(0x7f800000u /* inf */);
            bool _1345 = isnan(_1339);
            bool _1347 = _1343 || _1345;
            bool _1349 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1351 = _1347 || _1349;
            float _1353 = fma(_1341, _1331, _1317);
            int _1355 = as_type<int>(_1099) & int(0x80000000);
            float _1357 = _1353;
            _1243 = _1339;
            if (_1313)
            {
                float _1359 = -_1353;
                float _1361 = _1359 + 1.57079637050628662109375;
                _1357 = _1361;
            }
            float _1363 = _1357;
            int _1365 = as_type<int>(_1363);
            if (!_1315)
            {
                float _1367 = -_1363;
                float _1369 = _1367 + 3.1415927410125732421875;
                _1365 = as_type<int>(_1369);
            }
            int _1371 = _1365;
            if (!_1351)
            {
                int _1373 = _1355 | _1371;
                _1243 = as_type<float>(_1373);
            }
        }
    }
    float _1375 = _1243;
    float _1377 = _1107 * 6.283185482025146484375;
    float _1379 = sin(_1377);
    float _1381 = _375 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1383 = _379 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1385 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1209);
    float _1387 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1211);
    float _1389 = _367 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1391 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1207);
    float _1393 = _1381 * _1385;
    float _1395 = _1383 * _1387;
    float _1397 = _1227 * _1203;
    float _1399 = _1389 * _1391;
    float _1401 = _1235 * _1203;
    float _1403 = _1231 * _1203;
    float _1405 = _1375 * (-0.15915493667125701904296875);
    float _1407 = _1235 * _1223;
    float _1409 = _1227 * _1223;
    float _1411 = _1231 * _1223;
    float _1413 = _1405 * 6.283185482025146484375;
    float _1415 = cos(_1413);
    float _1417 = fma(_1379, _1403, _1407);
    float _1419 = _1231 * _1227;
    float _1421 = _1235 * _1227;
    float _1423 = -_1401;
    float _1425 = fma(_1379, _1411, _1423);
    float _1427 = _1417 * _1393;
    float _1429 = -_1411;
    float _1431 = fma(_1379, _1401, _1429);
    float _1433 = _1419 * _1393;
    float _1435 = _1405 * 6.283185482025146484375;
    float _1437 = sin(_1435);
    float _1439 = _1425 * _1393;
    float _1441 = fma(_1397, _1399, _1427);
    float _1443 = fma(_1379, _1407, _1403);
    float _1445 = -_1379;
    float _1447 = fma(_1445, _1399, _1433);
    float _1449 = fma(_1409, _1399, _1439);
    float _1451 = fma(_1431, _1395, _1441);
    float _1453 = _1063 * _1183;
    float _1455 = _1061 * _1183;
    float _1457 = _1017 * _1183;
    float _1459 = fma(_1443, _1395, _1449);
    float _1461 = -_1415;
    float _1463 = _1461 + 1.0;
    float _1465 = _1451 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1467 = fma(_1421, _1395, _1447);
    float _1469 = _1451 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1471 = _1451 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1473 = _1457 * _1437;
    float _1475 = _1453 * _1463;
    float _1477 = fma(_1459, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1465);
    float _1479 = fma(_1459, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1469);
    float _1481 = fma(_1459, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1471);
    float _1483 = _1457 * _1457;
    float _1485 = -_1473;
    float _1487 = fma(_1455, _1475, _1485);
    float _1489 = fma(_1467, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1477);
    float _1491 = _1453 * _1437;
    float _1493 = _1455 * _1463;
    float _1495 = fma(_1467, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1479);
    float _1497 = fma(_1453, _1475, _1415);
    float _1499 = _1489 * _1487;
    float _1501 = fma(_1463, _1483, _1415);
    float _1503 = fma(_1467, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1481);
    float _1505 = _1455 * _1437;
    float _1507 = fma(_1457, _1493, _1491);
    float _1509 = _373 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1511 = _373 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1513 = fma(_1495, _1497, _1499);
    float _1515 = -_1505;
    float _1517 = fma(_1457, _1475, _1515);
    float _1519 = _1489 * _1507;
    float _1521 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1509);
    float _1523 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1511);
    float _1525 = fma(_1457, _1475, _1505);
    float _1527 = fma(_1495, _1517, _1519);
    float _1529 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1521);
    float _1531 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1523);
    float _1533 = fma(_1503, _1525, _1513);
    float _1535 = fma(_1503, _1501, _1527);
    float _1537 = _1529 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1539 = _1531 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1541 = in.m_73.y;
    float _1543 = _1537 + _1533;
    float _1545 = _1539 + _1535;
    float _1547 = in.m_75.x;
    float _1549 = in.m_75.y;
    float _1551 = in.m_75.z;
    int _1553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1555 = _1553 != 0;
    float _1557 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1559 = _1543 + _1557;
    float _1561 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1563 = _1545 + _1561;
    int _1565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1567 = _1565 != 0;
    float _1569 = in.m_73.x;
    float _1571 = _1559 * _1559;
    float _1573 = _1563 * _1563;
    bool _1575 = _1209 != 0.0;
    bool _1577 = isnan(_1209);
    bool _1579 = _1575 || _1577;
    bool _1581 = isnan(0.0);
    bool _1583 = _1579 || _1581;
    float _1585 = _373 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1587 = _166 > 0.5;
    bool _1589 = _1587 && _1555;
    float _1591 = _1571 + _1573;
    bool _1593 = _1207 == 0.0;
    bool _1595 = !_1583;
    bool _1597 = _1593 && _1595;
    float _1599 = fma(_1455, _1493, _1415);
    bool _1601 = _471 > 0.5;
    float _1603 = sqrt(_1591);
    bool _1605 = _1211 == 0.0;
    bool _1607 = _1605 && _1597;
    float _1609 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1585);
    float _1611 = fma(_1455, _1475, _1473);
    float _1613 = _1489 * _1599;
    float _1615 = -_1541;
    float _1617 = _1615 + 1.0;
    float _1619 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1609);
    float _1621 = -_1491;
    float _1623 = fma(_1457, _1493, _1621);
    float _1625 = fma(_1495, _1611, _1613);
    float _1627 = _1541;
    float _1629 = _1617;
    float _1631 = _1613;
    float _1633 = _1571;
    float _1635 = _1573;
    if (_1567)
    {
        float _1637 = _1601 ? _1617 : _1541;
        _1627 = _1637;
    }
    float _1639 = _1627;
    float _1641 = _1619 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1643 = fma(_1503, _1623, _1625);
    float _1645 = _1549;
    float _1647 = _1547;
    float _1649 = _1551;
    if (!_1607)
    {
        float _1651 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1549);
        _1645 = _1651;
    }
    float _1653 = _1645;
    if (_1555)
    {
        _1033 = _1569;
    }
    float _1655 = _1033;
    float _1657 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1659 = _1603 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1661 = _1655;
    if (!_1607)
    {
        float _1663 = fma(_1207, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1547);
        _1647 = _1663;
    }
    float _1665 = _1647;
    float _1667 = _1419 * _1653;
    float _1669 = _1667;
    if (_1589)
    {
        float _1671 = -_1655;
        float _1673 = _1671 + 1.0;
        _1661 = _1673;
    }
    float _1675 = _1661;
    float _1677 = _1641 + _1643;
    float _1679 = _1425 * _1653;
    float _1681 = _1677;
    if (!_1555)
    {
        _411 = _1569;
    }
    float _1683 = _411;
    float _1685 = -_1379;
    float _1687 = fma(_1685, _1665, _1667);
    float _1689 = _1683;
    if (_1555)
    {
        _1689 = _1675;
    }
    float _1691 = _1689;
    float _1693 = _1417 * _1653;
    float _1695 = fma(_1409, _1665, _1679);
    if (!_1659)
    {
        _1629 = _1543;
    }
    float _1697 = _1629;
    float _1699 = _1697;
    if (!_1659)
    {
        _1631 = _1545;
    }
    float _1701 = _1631;
    float _1703 = _1701;
    if (!_1659)
    {
        _1669 = _1677;
    }
    float _1705 = _1669;
    bool _1707 = !_1659;
    float _1709 = _1705;
    if (!_1707)
    {
        float _1711 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1713 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1715 = _1603 + _1713;
        float _1717 = rsqrt(_1591);
        float _1719 = _1715 * _1711;
        float _1721 = _1677 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1723 = _1719 * 0.15915493667125701904296875;
        float _1725 = _1723 * 6.283185482025146484375;
        float _1727 = sin(_1725);
        float _1729 = _1723 * 6.283185482025146484375;
        float _1731 = cos(_1729);
        float _1733 = fma(_1727, _1721, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1735 = _1717 * _1733;
        float _1737 = fma(_1559, _1735, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1739 = _1731 + (-1.0);
        float _1741 = fma(_1563, _1735, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1743 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1745 = _1737 + _1743;
        float _1747 = _1739 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1749 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1751 = _1741 + _1749;
        float _1753 = _1745 * _1745;
        float _1755 = fma(_1677, _1731, _1747);
        float _1757 = _1751 * _1751;
        _1709 = _1755;
        _1633 = _1753;
        _1635 = _1757;
        _1699 = _1737;
        _1703 = _1741;
    }
    float _1759 = _1709;
    float _1761 = _1633;
    float _1763 = _1635;
    float _1765 = _1699;
    float _1767 = _1703;
    float _1769 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1771 = _1759 + _1769;
    float _1773 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (!_1607)
    {
        float _1775 = fma(_1211, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1551);
        _1649 = _1775;
    }
    float _1777 = _1649;
    float _1779 = fma(_1397, _1665, _1693);
    float _1781 = fma(_1771, _1771, _1761);
    float _1783 = _1639 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1785 = fma(_1443, _1777, _1695);
    float _1787 = fma(_1431, _1777, _1779);
    float _1789 = _1781 + _1763;
    float _1791 = _1691 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1793 = fma(_1421, _1777, _1687);
    float _1795 = _1787 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1797 = _1787 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1799 = _1787 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1801 = sqrt(_1789);
    float _1803 = fma(_1785, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1795);
    float _1805 = fma(_1785, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1797);
    float _1807 = fma(_1785, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1799);
    float _1809 = _1783 * _1657;
    float _1811 = _1791 * _1773;
    float _1813 = fma(_1793, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1803);
    float _1815 = fma(_1793, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1805);
    float _1817 = fma(_1793, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1807);
    out.m_77.x = _397;
    out.m_77.y = _399;
    out.m_77.z = _401;
    out.m_77.w = _395;
    out.m_79.x = _403;
    out.m_79.y = _405;
    out.m_79.z = _407;
    bool _1819 = _1801 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1821 = isnan(_1801);
    bool _1823 = _1819 || _1821;
    bool _1825 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1827 = _1823 || _1825;
    out.m_81.x = 1.0;
    out.m_81.y = 1.0;
    out.m_81.z = 1.0;
    out.m_83.x = _1811;
    out.m_83.y = _1809;
    out.m_85.x = _1813;
    out.m_85.y = _1815;
    out.m_85.z = _1817;
    if (!_1827)
    {
        _1681 = 1.0;
    }
    float _1829 = _1681;
    bool _1831 = !_1827;
    float _1833 = _1829;
    if (!_1831)
    {
        bool _1835 = _1801 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1837 = isnan(_1801);
        bool _1839 = _1835 || _1837;
        bool _1841 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1843 = _1839 || _1841;
        if (!_1843)
        {
            float _1845 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1847 = _1801 + _1845;
            float _1849 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1851 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1849;
            float _1853 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1855 = _1853 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1857 = 1.0 / _1851;
            float _1859 = _1847 * _1857;
            float _1861 = fma(_1859, _1855, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1833 = _1861;
            _1863 = true;
        }
        else
        {
            bool _1865 = _1801 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1867 = isnan(_1801);
            bool _1869 = _1865 || _1867;
            bool _1871 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1873 = _1869 || _1871;
            if (!_1873)
            {
                float _1875 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1877 = _1801 + _1875;
                float _1879 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1881 = _1879 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1883 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1885 = _1883 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1887 = 1.0 / _1881;
                float _1889 = _1877 * _1887;
                float _1891 = fma(_1889, _1885, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1833 = _1891;
                _1863 = true;
            }
            else
            {
                _1833 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1863 = false;
    float _1893 = _1833;
    float _1895 = fma(_1537, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1897 = fma(_1539, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1899 = floor(_1895);
    float _1901 = floor(_1897);
    float _1903 = -_1899;
    float _1905 = _1895 + _1903;
    float _1907 = -_1901;
    float _1909 = _1897 + _1907;
    float2 _6157 = float2(_1905, _1909);
    float _1911 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6157, float2(0.0), isnan(_6157)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6157, float2(0.0), isnan(_6157)), level(0.0)).x;
    float _1913 = _1641 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1915 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1917 = _1765 + _1915;
    float _1919 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1913);
    float _1921 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1923 = _1767 + _1921;
    float _1925 = fma(_1539, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1919);
    float _1927 = _1641 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1929 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    bool _1931 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1933 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1935 = _1931 || _1933;
    bool _1937 = isnan(0.5);
    bool _1939 = _1935 || _1937;
    float _1941 = _1925 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1943 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1927);
    float _1945 = _1641 + _1929;
    float _1947 = fma(_1917, _1893, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1949 = 1.0 / _1941;
    float _1951 = fma(_1539, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1943);
    float _1953 = _1945 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1955 = _1951 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1957 = fma(_1537, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1953);
    float _1959 = _1955 + _1941;
    float _1961 = fma(_1539, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1957);
    float _1963 = _1961 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1965 = _1959 * _1949;
    float _1967 = _1965 * 0.5;
    float _1969 = trunc(_1963);
    int _1971 = int(_1969);
    float _1973 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1975 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1973);
    float _1977 = 1.0 / _1975;
    int _1979 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1981 = _1971 + _1979;
    int _1983 = _1981 + 1;
    float _1985 = _1945 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1987 = fma(_1537, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1985);
    float _1989 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1991 = _1977 * _1989;
    bool _1993 = _1991 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1995 = _1991 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1997 = !_1993;
    int _1999 = _1997 ? 0 : 1;
    int _2001 = 2;
    float _2003 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _2005 = _1917;
    int _2007 = as_type<int>(_1923);
    if (!_1993)
    {
        _2001 = 1;
    }
    int _2009 = _2001;
    int _2011 = _2009;
    if (!_1995)
    {
        _2011 = _1999;
    }
    int _2013 = _2011;
    float _2015 = fma(_1539, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1987);
    bool _2017 = _1983 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2019 = _2013 << 6;
    float _2021 = _2015 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _2023 = _2019 + 48;
    uint _2025 = uint(int(uint(_2023) >> uint(2)));
    uint _2027 = uint(int(uint(int(_2025)) >> uint(2)));
    int _2029 = int(_2025) & 3;
    float _2031 = (*spvDescriptorSet0.vp_c15)._m0[int(_2027)][_2029];
    int _2033 = int(_2025) + 1;
    uint _2035 = uint(int(uint(_2033) >> uint(2)));
    int _2037 = _2033 & 3;
    float _2039 = (*spvDescriptorSet0.vp_c15)._m0[int(_2035)][_2037];
    float _2041 = trunc(_2021);
    int _2043 = int(_2041);
    int _2045 = _2019 + 56;
    uint _2047 = uint(int(uint(_2045) >> uint(2)));
    uint _2049 = uint(int(uint(int(_2047)) >> uint(2)));
    int _2051 = int(_2047) & 3;
    float _2053 = (*spvDescriptorSet0.vp_c15)._m0[int(_2049)][_2051];
    int _2055 = int(_2047) + 1;
    uint _2057 = uint(int(uint(_2055) >> uint(2)));
    int _2059 = _2055 & 3;
    float _2061 = (*spvDescriptorSet0.vp_c15)._m0[int(_2057)][_2059];
    int _2063 = _2019 + 64;
    uint _2065 = uint(int(uint(_2063) >> uint(2)));
    uint _2067 = uint(int(uint(int(_2065)) >> uint(2)));
    int _2069 = int(_2065) & 3;
    float _2071 = (*spvDescriptorSet0.vp_c15)._m0[int(_2067)][_2069];
    int _2073 = int(_2065) + 1;
    uint _2075 = uint(int(uint(_2073) >> uint(2)));
    int _2077 = _2073 & 3;
    float _2079 = (*spvDescriptorSet0.vp_c15)._m0[int(_2075)][_2077];
    int _2081 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2083 = _2043 + _2081;
    int _2085 = _2083 + 1;
    int _2087 = _1983 | _2085;
    int _2089 = _2019 + 72;
    uint _2091 = uint(int(uint(_2089) >> uint(2)));
    uint _2093 = uint(int(uint(int(_2091)) >> uint(2)));
    int _2095 = int(_2091) & 3;
    float _2097 = (*spvDescriptorSet0.vp_c15)._m0[int(_2093)][_2095];
    int _2099 = int(_2091) + 1;
    uint _2101 = uint(int(uint(_2099) >> uint(2)));
    int _2103 = _2099 & 3;
    float _2105 = (*spvDescriptorSet0.vp_c15)._m0[int(_2101)][_2103];
    bool _2107 = _2087 < 0;
    bool _2109 = _2107 || _2017;
    float _2111 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2113 = _1759 + _2111;
    bool _2115 = _2085 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2117 = _2115 || _2109;
    float _2119 = fma(_2113, _1893, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2121 = fma(_1923, _1893, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    int _2123 = _2019 + 96;
    uint _2125 = uint(int(uint(_2123) >> uint(2)));
    uint _2127 = uint(int(uint(int(_2125)) >> uint(2)));
    int _2129 = int(_2125) & 3;
    float _2131 = (*spvDescriptorSet0.vp_c15)._m0[int(_2127)][_2129];
    int _2133 = int(_2125) + 1;
    uint _2135 = uint(int(uint(_2133) >> uint(2)));
    int _2137 = _2133 & 3;
    float _2139 = (*spvDescriptorSet0.vp_c15)._m0[int(_2135)][_2137];
    float _2141 = _2113;
    if (_1939)
    {
        _2141 = _1947;
    }
    float _2143 = _2141;
    float _2145 = _2143;
    if (_1939)
    {
        _2003 = _2119;
    }
    float _2147 = _2003;
    float _2149 = _2147;
    if (_1939)
    {
        _2005 = _2121;
    }
    float _2151 = _2005;
    int _2153 = _2019 + 104;
    uint _2155 = uint(int(uint(_2153) >> uint(2)));
    uint _2157 = uint(int(uint(int(_2155)) >> uint(2)));
    int _2159 = int(_2155) & 3;
    float _2161 = (*spvDescriptorSet0.vp_c15)._m0[int(_2157)][_2159];
    int _2163 = int(_2155) + 1;
    uint _2165 = uint(int(uint(_2163) >> uint(2)));
    int _2167 = _2163 & 3;
    float _2169 = (*spvDescriptorSet0.vp_c15)._m0[int(_2165)][_2167];
    float _2171 = _2151;
    int _2173 = as_type<int>(_2139);
    if (!_1939)
    {
        float _2175 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2177 = _1641 + _2175;
        float _2179 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2181 = _1537 + _2179;
        float _2183 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2185 = -_1539;
        float _2187 = _2185 + _2121;
        float _2189 = _2177 * _2177;
        float _2191 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2193 = _1539 + _2191;
        float _2195 = fma(_2181, _2181, _2189);
        float _2197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2199 = fma(_2193, _2193, _2195);
        float _2201 = sqrt(_2199);
        float _2203 = _2183 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2205 = precise::min(_2201, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2207 = _2205 * _2197;
        float _2209 = -_1641;
        float _2211 = _2209 + _2119;
        float _2213 = _2203 * _2207;
        float _2215 = -_1537;
        float _2217 = _2215 + _1947;
        float _2219 = fma(_2211, _2213, _1641);
        float _2221 = fma(_2217, _2213, _1537);
        float _2223 = fma(_2187, _2213, _1539);
        _2149 = _2219;
        _2007 = as_type<int>(_2213);
        _2145 = _2221;
        _2171 = _2223;
    }
    float _2225 = _2149;
    int _2227 = _2007;
    float _2229 = _2145;
    float _2231 = _2171;
    float _2233 = _1945 * _2139;
    int _2235 = _2227;
    if (!_2117)
    {
        int _2237 = _2085 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2239 = _2237 + _1983;
        _2235 = _2239;
    }
    int _2241 = _2235;
    float _2243 = _2225 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2245 = _1945 * _2079;
    float _2247 = fma(_1537, _2131, _2233);
    float _2249 = _1945 * _2039;
    int _2251 = as_type<int>(_2249);
    float _2253 = _2247;
    if (!_2117)
    {
        int _2255 = _2241 << 2;
        _2173 = _2255;
    }
    int _2257 = _2173;
    float _2259 = fma(_2229, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2243);
    float _2261 = fma(_1539, _2161, _2247);
    float _2263 = fma(_1537, _2031, _2249);
    int _2265 = _2257;
    if (!_2117)
    {
        uint _2267 = uint(int(uint(_2241) >> uint(2)));
        _2251 = int(_2267);
    }
    int _2269 = _2251;
    float _2271 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2259);
    float _2273 = _2261 + _2169;
    if (!_2117)
    {
        int _2275 = 12 & _2257;
        _2265 = _2275;
    }
    int _2277 = _2265;
    float _2279 = fma(_1537, _2071, _2245);
    float _2281 = _2271 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _2283 = _2019 + 80;
    uint _2285 = uint(int(uint(_2283) >> uint(2)));
    uint _2287 = uint(int(uint(int(_2285)) >> uint(2)));
    int _2289 = int(_2285) & 3;
    float _2291 = (*spvDescriptorSet0.vp_c15)._m0[int(_2287)][_2289];
    int _2293 = int(_2285) + 1;
    uint _2295 = uint(int(uint(_2293) >> uint(2)));
    int _2297 = _2293 & 3;
    float _2299 = (*spvDescriptorSet0.vp_c15)._m0[int(_2295)][_2297];
    if (!_2117)
    {
        int _2301 = _2269 << 4;
        int _2303 = _2301 + _2277;
        _2253 = as_type<float>(_2303);
    }
    float _2305 = _2253;
    float _2307 = 1.0 / _2273;
    float _2309 = fma(_1539, _2053, _2263);
    float _2311 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2313 = _2281 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2315 = fma(_1539, _2097, _2279);
    float _2317 = _2225 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2319 = _2305;
    if (!_2117)
    {
        int _2321 = as_type<int>(_2305) + 400;
        uint _2323 = uint(int(uint(_2321) >> uint(2)));
        uint _2325 = uint(int(uint(int(_2323)) >> uint(2)));
        int _2327 = int(_2323) & 3;
        float _2329 = (*spvDescriptorSet0.vp_c15)._m0[int(_2325)][_2327];
        _2319 = _2329;
    }
    float _2331 = _2319;
    float _2333 = -_2313;
    float _2335 = fma(_2333, _2311, 1.0);
    float _2337 = _2309 + _2061;
    float _2339 = _2225 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2341 = fma(_2229, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2317);
    float _2343 = _2225 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2345 = _2315 + _2105;
    float _2347 = fma(_2229, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2339);
    int _2349 = _2019 + 88;
    uint _2351 = uint(int(uint(_2349) >> uint(2)));
    uint _2353 = uint(int(uint(int(_2351)) >> uint(2)));
    int _2355 = int(_2351) & 3;
    float _2357 = (*spvDescriptorSet0.vp_c15)._m0[int(_2353)][_2355];
    int _2359 = int(_2351) + 1;
    uint _2361 = uint(int(uint(_2359) >> uint(2)));
    int _2363 = _2359 & 3;
    float _2365 = (*spvDescriptorSet0.vp_c15)._m0[int(_2361)][_2363];
    float _2367 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2341);
    float _2369 = _2337 * _2307;
    float _2371 = fma(_2229, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2343);
    float _2373 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2347);
    float _2375 = _2367 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2377 = _2345 * _2307;
    bool _2379 = _2369 >= 0.0;
    float _2381 = _2373 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2383 = _2375 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2385 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2371);
    bool _2387 = _2369 <= 1.0;
    bool _2389 = _2387 && _2379;
    float _2391 = as_type<float>(_2085);
    float _2393 = _2335;
    if (!_2117)
    {
        float _2395 = floor(_2021);
        _2391 = _2395;
    }
    float _2397 = _2391;
    float _2399 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2383);
    float _2401 = _2385 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _2403 = _2377 >= 0.0;
    bool _2405 = _2403 && _2389;
    float _2407 = _2375 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2409 = fma(_2281, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2399);
    float _2411 = _2375 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _2413 = _2377 <= 1.0;
    bool _2415 = _2413 && _2405;
    float _2417 = log2(_2335);
    float _2419 = fma(_2401, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2409);
    float _2421 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2407);
    float _2423 = fma(_2281, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2421);
    float _2425 = 1.0 / _2419;
    float _2427 = _2397;
    float _2429 = _2411;
    float _2431 = _2419;
    if (!_2117)
    {
        float _2433 = -_2397;
        float _2435 = _2021 + _2433;
        _2427 = _2435;
    }
    float _2437 = _2427;
    float _2439 = _1945 * _2299;
    float _2441 = _2437;
    if (_2415)
    {
        float _2443 = float(_2013);
        _2393 = _2443;
    }
    float _2445 = _2393;
    float _2447 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2411);
    float _2449 = _2119;
    float _2451 = _2445;
    if (!_2117)
    {
        float _2453 = floor(_1963);
        _2449 = _2453;
    }
    float _2455 = _2449;
    float _2457 = fma(_1537, _2291, _2439);
    float _2459 = fma(_2281, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2447);
    float _2461 = fma(_2401, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2423);
    float _2463 = fma(_2401, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2459);
    float _2465 = _2421;
    float _2467 = _2463;
    if (_2415)
    {
        float _2469 = rint(_2445);
        float _2471 = precise::max(_2469, 0.0);
        uint _2473 = uint(_2471);
        uint _2475 = clamp(_2473, 0u, 65535u);
        _2465 = as_type<float>(_2475);
    }
    float _2477 = _2465;
    float _2479 = fma(_1539, _2357, _2457);
    float _2481 = _2417 * 0.693147182464599609375;
    float _2483 = _2463 * _2425;
    float _2485 = _2331;
    if (!_2117)
    {
        float _2487 = rint(_2331);
        float _2489 = precise::max(_2487, 0.0);
        uint _2491 = uint(_2489);
        uint _2493 = clamp(_2491, 0u, 65535u);
        _2485 = as_type<float>(_2493);
    }
    float _2495 = _2485;
    float _2497 = _2479 + _2365;
    float _2499 = _2461 * _2425;
    float _2501 = _2481 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2503 = fma(_2483, -0.5, 0.5);
    float _2505 = _2497 * _2307;
    float _2507 = fma(_2499, 0.5, 0.5);
    float _2509 = _2505;
    if (!_2117)
    {
        float _2511 = -_2455;
        float _2513 = _1963 + _2511;
        _2451 = _2513;
    }
    float _2515 = _2451;
    float _2517 = _2477;
    if (_2415)
    {
        float3 _7188 = float3(_2369, _2377, float(as_type<int>(_2477)));
        float3 _7192 = select(_7188, float3(0.0), isnan(_7188));
        float _2519 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7192.xy, uint(rint(_7192.z)), _2505, level(0.0));
        _2517 = _2519;
    }
    float _2521 = _2517;
    float3 _7202 = float3(_2507, _2503, _2501);
    float _2523 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7202, float3(0.0), isnan(_7202)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7202, float3(0.0), isnan(_7202)), level(0.0)).x;
    float3 _7211 = float3(_2507, _2503, _2501);
    float4 _2526 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7211, float3(0.0), isnan(_7211)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7211, float3(0.0), isnan(_7211)), level(0.0)).xyzw;
    float _2528 = _2526.x;
    float _2530 = _2526.y;
    float _2532 = _2526.z;
    float _2534 = _2526.w;
    float _2536 = _2515;
    float _2538 = _2495;
    if (!_2117)
    {
        float3 _7235 = float3(_2515, _2437, float(as_type<int>(_2495)));
        float3 _7237 = select(_7235, float3(0.0), isnan(_7235));
        float _2540 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7237.xy, uint(rint(_7237.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7237.xy, uint(rint(_7237.z)), level(0.0)).x;
        _2536 = _2540;
    }
    float _2542 = _2536;
    if (_2117)
    {
        _2429 = 1.0;
    }
    float _2544 = _2429;
    float _2546 = _2544;
    if (!_2117)
    {
        int _2548 = _2241 << 4;
        int _2550 = _2548 + 2048;
        uint _2552 = uint(int(uint(_2550) >> uint(2)));
        uint _2554 = uint(int(uint(int(_2552)) >> uint(2)));
        int _2556 = int(_2552) & 3;
        float _2558 = (*spvDescriptorSet0.vp_c15)._m0[int(_2554)][_2556];
        int _2560 = int(_2552) + 1;
        uint _2562 = uint(int(uint(_2560) >> uint(2)));
        int _2564 = _2560 & 3;
        float _2566 = (*spvDescriptorSet0.vp_c15)._m0[int(_2562)][_2564];
        int _2568 = _2550 + 8;
        uint _2570 = uint(int(uint(_2568) >> uint(2)));
        uint _2572 = uint(int(uint(int(_2570)) >> uint(2)));
        int _2574 = int(_2570) & 3;
        float _2576 = (*spvDescriptorSet0.vp_c15)._m0[int(_2572)][_2574];
        int _2578 = int(_2570) + 1;
        uint _2580 = uint(int(uint(_2578) >> uint(2)));
        int _2582 = _2578 & 3;
        float _2584 = (*spvDescriptorSet0.vp_c15)._m0[int(_2580)][_2582];
        float _2586 = _1945 * _2566;
        float _2588 = fma(_1537, _2558, _2586);
        float _2590 = fma(_1539, _2576, _2588);
        float _2592 = _2590 + _2584;
        float _2594 = precise::clamp(_2592, 0.0, 1.0);
        float _2596 = -_2594;
        float _2598 = _2596 + _2542;
        float _2600 = fma(_2598, 500.0, 1.5);
        float _2602 = exp2(_2600);
        float _2604 = 0.0 + _2602;
        float _2606 = precise::clamp(_2604, 0.0, 1.0);
        _2546 = _2606;
    }
    float _2608 = _2546;
    float _2610 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2612 = _2225 + _2610;
    float _2614 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2616 = _2229 + _2614;
    float _2618 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2620 = _2231 + _2618;
    float _2622 = _2612 * _2612;
    float _2624 = fma(_2616, _2616, _2622);
    float _2626 = fma(_2620, _2620, _2624);
    float _2628 = rsqrt(_2626);
    float _2630 = _2628 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2632 = _2616 * _2630;
    float _2634 = _2620 * _2630;
    float _2636 = _2632 * _2632;
    float _2638 = _2634 * _2634;
    float _2640 = _2636 + _2638;
    float _2642 = sqrt(_2640);
    bool _2644 = _2642 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2646 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2648 = _2642 + _2646;
    float _2650 = _2620;
    float _2652 = _2628;
    float _2654 = _2648;
    float _2656 = _2630;
    if (_2644)
    {
        float _2658 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2650 = _2658;
    }
    float _2660 = _2650;
    if (_2644)
    {
        float _2662 = rsqrt(_2640);
        _2652 = _2662;
    }
    float _2664 = _2652;
    float _2666 = _2664;
    if (_2644)
    {
        float _2668 = _2648 * _2660;
        _2654 = _2668;
    }
    float _2670 = _2654;
    if (_2644)
    {
        float _2672 = _2670 * 0.15915493667125701904296875;
        _2538 = _2672;
    }
    float _2674 = _2538;
    float _2676 = _2660;
    if (_2644)
    {
        float _2678 = _2674 * 6.283185482025146484375;
        float _2680 = sin(_2678);
        _2676 = _2680;
    }
    float _2682 = _2676;
    float _2684 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2686 = precise::max(0.0, _2684);
    float _2688 = _1963;
    float _2690 = _2686;
    if (_2644)
    {
        float _2692 = _2674 * 6.283185482025146484375;
        float _2694 = cos(_2692);
        _2688 = _2694;
    }
    float _2696 = _2688;
    float _2698 = -_2630;
    float _2700 = -_2686;
    float _2702 = fma(_2612, _2698, _2700);
    float _2704 = _2702;
    if (_2644)
    {
        float _2706 = _2702 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2690 = _2706;
    }
    float _2708 = _2690;
    float _2710 = _2682;
    float _2712 = _2708;
    if (_2644)
    {
        float _2714 = fma(_2682, _2708, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2656 = _2714;
    }
    float _2716 = _2656;
    float _2718 = _2716;
    if (!_2644)
    {
        _2710 = _2634;
    }
    float _2720 = _2710;
    float _2722 = _2720;
    float _2724 = _2696;
    if (_2644)
    {
        float _2726 = _2696 + (-1.0);
        _2712 = _2726;
    }
    float _2728 = _2712;
    float _2730 = _2728;
    if (_2644)
    {
        float _2732 = _2664 * _2716;
        _2441 = _2732;
    }
    float _2734 = _2441;
    if (!_2644)
    {
        _2666 = _2632;
    }
    float _2736 = _2666;
    float _2738 = _2736;
    if (_2644)
    {
        float _2740 = _2728 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2730 = _2740;
    }
    float _2742 = _2730;
    if (_2644)
    {
        float _2744 = _2632 * _2734;
        _2738 = _2744;
    }
    float _2746 = _2738;
    if (!_2644)
    {
        _2718 = _2636;
    }
    float _2748 = _2718;
    float _2750 = _2748;
    if (_2644)
    {
        float _2752 = _2634 * _2734;
        _2722 = _2752;
    }
    float _2754 = _2722;
    if (_2644)
    {
        float _2756 = fma(_2702, _2696, _2742);
        _2704 = _2756;
    }
    float _2758 = _2704;
    if (_2644)
    {
        float _2760 = _2746 * _2746;
        _2750 = _2760;
    }
    float _2762 = _2750;
    if (!_2644)
    {
        _2724 = _2638;
    }
    float _2764 = _2724;
    float _2766 = _2764;
    if (_2644)
    {
        float _2768 = _2754 * _2754;
        _2766 = _2768;
    }
    float _2770 = _2766;
    float _2772 = sqrt(_2626);
    float _2774 = fma(_2758, _2758, _2762);
    float _2776 = _2774 + _2770;
    float _2778 = rsqrt(_2776);
    float _2780 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2782 = fma(_2772, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2780);
    float _2784 = precise::clamp(_2782, 0.0, 1.0);
    float _2786 = -_2784;
    float _2788 = _2786 + 1.0;
    float _2790 = _2778 * _2746;
    float _2792 = _2778 * _2758;
    float _2794 = _2778 * _2754;
    float _2796 = abs(_2788);
    float _2798 = log2(_2796);
    float _2800 = _2790 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2802 = -_2800;
    float _2804 = fma(_2792, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2802);
    float _2806 = -_2794;
    float _2808 = fma(_2806, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2804);
    float _2810 = fma(_2808, -0.5, 0.5);
    float _2812 = fma(_2808, 0.5, 0.5);
    float _2814 = _2792 + 1.0;
    float _2816 = _2798 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2818 = fma(_2812, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2820 = sqrt(_2810);
    float _2822 = fma(_2812, _2818, -0.212114393711090087890625);
    float _2824 = fma(_2812, _2822, 1.570728778839111328125);
    float _2826 = exp2(_2816);
    float _2828 = _2820 * 0.636619746685028076171875;
    float _2830 = -_2792;
    float _2832 = fma(_2826, _2814, _2830);
    float _2834 = -_2824;
    float _2836 = fma(_2828, _2834, 1.0);
    float _2838 = fma(_2832, 0.5, 0.5);
    float2 _7702 = float2(_2836, _2838);
    float3 _2842 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7702, float2(0.0), isnan(_7702)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7702, float2(0.0), isnan(_7702)), level(0.0)).xyz;
    float _2844 = _2842.x;
    float _2846 = _2842.y;
    float _2848 = _2842.z;
    float _2850 = abs(_1991);
    float _2852 = log2(_2850);
    float _2854 = _2798 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2856 = -_1911;
    float _2858 = _2856 + 1.0;
    bool _2860 = _1991 <= 8000.0;
    bool _2862 = isnan(_1991);
    bool _2864 = _2860 || _2862;
    bool _2866 = isnan(8000.0);
    bool _2868 = _2864 || _2866;
    float _2870 = float(_2868);
    float _2872 = exp2(_2854);
    float _2874 = _2852 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2876 = _2375 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2878 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2876);
    float _2880 = exp2(_2874);
    float _2882 = -_2872;
    float _2884 = _2882 + 1.0;
    float _2886 = fma(_2281, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2878);
    float _2888 = _2884 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2890 = fma(_2880, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2892 = precise::clamp(_2890, 0.0, 1.0);
    float _2894 = fma(_2892, -2.0, 3.0);
    float _2896 = _2892 * _2892;
    float _2898 = _2896 * _2894;
    float _2900 = fma(_2401, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2886);
    float _2902 = -_2898;
    float _2904 = _2902 + 1.0;
    float _2906 = _2900 + _2419;
    out.gl_Position.x = _2461;
    out.gl_Position.y = _2463;
    out.gl_Position.z = _2900;
    out.gl_Position.w = _2419;
    float _2908 = fma(_2904, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2898);
    float _2910 = _2906 * 0.5;
    float _2912 = _2870 * _2908;
    float _2914 = _2908;
    float _2916 = _2900;
    if (!_2415)
    {
        _2914 = 1.0;
    }
    float _2918 = _2914;
    out.m_87.z = _2910;
    out.m_87.w = _2419;
    float _2920 = _2918;
    if (_2415)
    {
        bool _2922 = _2521 >= _2505;
        bool _2924 = isnan(_2521);
        bool _2926 = _2922 || _2924;
        bool _2928 = isnan(_2505);
        bool _2930 = _2926 || _2928;
        float _2932 = float(_2930);
        _2920 = _2932;
    }
    float _2934 = _2920;
    float _2936 = _2912 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _2938 = _2772 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2940 = isnan(_2772);
    bool _2942 = _2938 || _2940;
    bool _2944 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2946 = _2942 || _2944;
    float _2948 = _2858 * _2936;
    float _2950 = precise::clamp(_2948, 0.0, 1.0);
    float _2952 = _2934 * _2608;
    float _2954 = _2888 * _2523;
    float _2956 = -_2888;
    float _2958 = _2956 + 1.0;
    float _2960 = -_2950;
    float _2962 = fma(_2960, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2964 = _2534 * _2954;
    float _2966 = _2534 * _2958;
    float _2968 = -_2952;
    float _2970 = fma(_2968, _2962, 1.0);
    float _2972 = precise::clamp(_2970, 0.0, 1.0);
    float _2974 = _2954;
    float _2976 = _2964;
    if (!_2946)
    {
        _2509 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2978 = _2509;
    float _2980 = _2972 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2982 = _2978;
    float _2984 = _2978;
    if (!_2946)
    {
        _2431 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2986 = _2431;
    float _2988 = _2986;
    float _2990 = _2986;
    if (!_2946)
    {
        _2916 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2992 = _2916;
    out.m_89.x = _2980;
    float _2994 = _2992;
    float _2996 = _2992;
    if (!_2946)
    {
        _2467 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2998 = _2467;
    float _3000 = _2848 * _2954;
    float _3002 = fma(_2844, _2964, _2528);
    float _3004 = fma(_2846, _2964, _2530);
    float _3006 = _2998;
    float _3008 = _2998;
    if (!_2946)
    {
        _2974 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3010 = _2974;
    float _3012 = fma(_2534, _3000, _2532);
    float _3014 = _3010;
    float _3016 = _3010;
    if (!_2946)
    {
        _2976 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3018 = _2976;
    out.m_91.x = _3002;
    out.m_91.y = _3004;
    out.m_91.z = _3012;
    out.m_91.w = _2966;
    bool _3020 = !_2946;
    float _3022 = _3018;
    float _3024 = _3018;
    if (!_3020)
    {
        bool _3026 = _2772 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3028 = isnan(_2772);
        bool _3030 = _3026 || _3028;
        bool _3032 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3034 = _3030 || _3032;
        if (!_3034)
        {
            float _3036 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3038 = _2772 + _3036;
            float _3040 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3042 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3040;
            float _3044 = 1.0 / _3042;
            float _3046 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3048 = _3046 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3050 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3052 = _3050 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3054 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3056 = _3054 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3058 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3060 = _3058 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3062 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3064 = _3062 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3066 = _3038 * _3044;
            float _3068 = precise::clamp(_3066, 0.0, 1.0);
            float _3070 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3072 = _3070 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3074 = fma(_3068, _3048, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3076 = fma(_3068, _3072, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3078 = fma(_3068, _3052, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3080 = fma(_3068, _3056, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3082 = fma(_3068, _3060, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3084 = fma(_3068, _3064, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3016 = _3076;
            _3008 = _3082;
            _2984 = _3074;
            _2996 = _3080;
            _2990 = _3078;
            _3024 = _3084;
            _3086 = true;
        }
        else
        {
            bool _3088 = _2772 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3090 = isnan(_2772);
            bool _3092 = _3088 || _3090;
            bool _3094 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3096 = _3092 || _3094;
            if (!_3096)
            {
                _2982 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3098 = _2982;
            _2984 = _3098;
            if (!_3096)
            {
                _3014 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3100 = _3014;
            _3016 = _3100;
            if (!_3096)
            {
                _2988 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3102 = _2988;
            _2990 = _3102;
            if (!_3096)
            {
                _2994 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3104 = _2994;
            _2996 = _3104;
            if (!_3096)
            {
                _3006 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3106 = _3006;
            _3008 = _3106;
            if (!_3096)
            {
                _3022 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3108 = _3022;
            bool _3110 = !_3096;
            _3024 = _3108;
            if (!_3110)
            {
                bool _3112 = _2772 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3114 = isnan(_2772);
                bool _3116 = _3112 || _3114;
                bool _3118 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3120 = _3116 || _3118;
                if (!_3120)
                {
                    float _3122 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3124 = _2772 + _3122;
                    float _3126 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3128 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3126;
                    float _3130 = 1.0 / _3128;
                    float _3132 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3134 = _3132 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3136 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3138 = _3136 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3140 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3142 = _3140 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3144 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3146 = _3144 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3148 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3150 = _3148 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3152 = _3124 * _3130;
                    float _3154 = precise::clamp(_3152, 0.0, 1.0);
                    float _3156 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3158 = _3156 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3160 = fma(_3154, _3134, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3162 = fma(_3154, _3158, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3164 = fma(_3154, _3138, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3166 = fma(_3154, _3142, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3168 = fma(_3154, _3146, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3170 = fma(_3154, _3150, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3016 = _3162;
                    _3008 = _3168;
                    _2984 = _3160;
                    _2996 = _3166;
                    _2990 = _3164;
                    _3024 = _3170;
                    _3086 = true;
                }
                else
                {
                    _3016 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3008 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2984 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2996 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2990 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3024 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3086 = false;
    float _3172 = _3016;
    float _3174 = _3008;
    float _3176 = _2984;
    float _3178 = _2996;
    float _3180 = _2990;
    float _3182 = _3024;
    float _3184 = fma(_1815, -0.5, 0.5);
    float _3186 = precise::clamp(_3184, 0.0, 1.0);
    float _3188 = -_3172;
    float _3190 = _3188 + _3174;
    float _3192 = -_3176;
    float _3194 = _3192 + _3178;
    float _3196 = -_3180;
    float _3198 = _3196 + _3182;
    bool _3200 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3202 = fma(_3186, _3190, _3172);
    float _3204 = fma(_3186, _3194, _3176);
    float _3206 = fma(_3186, _3198, _3180);
    float _3208 = _3202 * 0.586610972881317138671875;
    out.m_93.x = 0.0;
    float _3210 = fma(_3204, 0.298911988735198974609375, _3208);
    float _3212 = fma(_3206, 0.114477999508380889892578125, _3210);
    float _3214 = -_3212;
    float _3216 = _3204 + _3214;
    float _3218 = -_3212;
    float _3220 = _3202 + _3218;
    float _3222 = -_3212;
    float _3224 = _3206 + _3222;
    float _3226 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3228 = fma(_3216, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3212);
    float _3230 = fma(_3220, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3212);
    float _3232 = fma(_3224, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3212);
    out.m_61.x = _3226;
    out.m_95.x = _3228;
    out.m_95.y = _3230;
    out.m_95.z = _3232;
    if (!_3200)
    {
        return out;
    }
    float _3234 = -_2225;
    float _3236 = _3234 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3238 = -_2229;
    float _3240 = _3238 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3242 = -_2231;
    float _3244 = _3242 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3246 = _3236 * _3236;
    float _3248 = fma(_3240, _3240, _3246);
    float _3250 = fma(_3244, _3244, _3248);
    float _3252 = sqrt(_3250);
    float _3254 = rsqrt(_3250);
    float _3256 = -_3252;
    float _3258 = _3256 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3260 = _3258 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3262 = precise::clamp(_3260, 0.0, 1.0);
    float _3264 = _3240 * _3254;
    float _3266 = _3236 * _3254;
    float _3268 = abs(_3262);
    float _3270 = log2(_3268);
    float _3272 = _3244 * _3254;
    float _3274 = _3264 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3276 = _1815 * _3266;
    float _3278 = -_3266;
    float _3280 = -_3274;
    float _3282 = fma(_3278, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3280);
    float _3284 = fma(_1813, _3264, _3276);
    float _3286 = -_3272;
    float _3288 = fma(_3286, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3282);
    float _3290 = fma(_1817, _3272, _3284);
    float _3292 = precise::clamp(_3290, 0.0, 1.0);
    float _3294 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3296 = _3288 + _3294;
    float _3298 = _3270 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3300 = _3296 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3302 = precise::clamp(_3300, 0.0, 1.0);
    float _3304 = exp2(_3298);
    float _3306 = _3304 * _3302;
    float _3308 = _3292 * _3306;
    float _3310 = _3308 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3312 = _3308 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3314 = _3308 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _3310;
    out.m_93.y = _3312;
    out.m_93.z = _3314;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3086 = false;
    bool _1863 = false;
    bool _429 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_58.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    float _122 = as_type<float>(_114);
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _120;
    if (!_118)
    {
        out.m_61.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _124 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3372 = as_type<float>(_130);
        out.gl_Position.z = _3372;
    }
    if (!_118)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _134 = in.m_63.w;
    float _136 = float(_114);
    float _138 = -_134;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_134);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    bool _152 = _140 >= _136;
    bool _154 = !_150;
    bool _156 = _152 || _154;
    float _158 = _140;
    if (_156)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _122;
    if (_156)
    {
        out.m_61.x = 0.0;
    }
    if (_156)
    {
        float _162 = _160 * 5.0;
        _132 = as_type<int>(_162);
    }
    int _164 = _132;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3436 = as_type<float>(_164);
        out.gl_Position.z = _3436;
    }
    if (_156)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _166 = in.m_65.x;
    float _168 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _170 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _172 = in.m_63.x;
    float _174 = in.m_63.y;
    float _176 = in.m_63.z;
    float _178 = in.m_58.x;
    float _180 = in.m_58.y;
    float _182 = in.m_58.z;
    bool _184 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _186 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _188 = _184 || _186;
    bool _190 = isnan(1.0);
    bool _192 = _188 || _190;
    float _194 = _168 * _166;
    float _196 = _170 * _166;
    float _198 = trunc(_194);
    int _200 = int(_198);
    float _202 = trunc(_196);
    int _204 = int(_202);
    int _206 = _200 << 4;
    int _208 = _206 + 1712;
    float _210 = in.m_67.x;
    float _212 = in.m_67.y;
    float _214 = in.m_67.z;
    float _216 = in.m_67.w;
    int _218 = _208 + 8;
    uint _221 = uint(int(uint(_218) >> uint(2)));
    uint _223 = uint(int(uint(int(_221)) >> uint(2)));
    int _225 = int(_221) & 3;
    float _227 = (*spvDescriptorSet0.vp_c9)._m0[int(_223)][_225];
    int _229 = _204 << 4;
    int _231 = _229 + 1968;
    float _233 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _235 = _231 + 8;
    uint _237 = uint(int(uint(_235) >> uint(2)));
    uint _239 = uint(int(uint(int(_237)) >> uint(2)));
    int _241 = int(_237) & 3;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[int(_239)][_241];
    float _245 = 0.0;
    float _247 = _233;
    if (!_192)
    {
        float _249 = _233 * _233;
        float _251 = _249 * 0.5;
        _245 = _251;
    }
    float _253 = _245;
    float _255 = _253;
    if (!_192)
    {
        float _257 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _255 = _257;
    }
    float _259 = _255;
    uint _261 = uint(int(uint(_208) >> uint(2)));
    uint _263 = uint(int(uint(int(_261)) >> uint(2)));
    int _265 = int(_261) & 3;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[int(_263)][_265];
    int _269 = int(_261) + 1;
    uint _271 = uint(int(uint(_269) >> uint(2)));
    int _273 = _269 & 3;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[int(_271)][_273];
    uint _277 = uint(int(uint(_231) >> uint(2)));
    uint _279 = uint(int(uint(int(_277)) >> uint(2)));
    int _281 = int(_277) & 3;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[int(_279)][_281];
    int _285 = int(_277) + 1;
    uint _287 = uint(int(uint(_285) >> uint(2)));
    int _289 = _285 & 3;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[int(_287)][_289];
    bool _293 = !_192;
    float _295 = _259;
    if (!_293)
    {
        float _297 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _299 = log2(_297);
        float _301 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _303 = _301 + 1.0;
        float _305 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _307 = _233 * _299;
        float _309 = 1.0 / _303;
        float _311 = _305 * 0.693147182464599609375;
        float _313 = exp2(_307);
        float _315 = 1.0 / _311;
        float _317 = _313 + (-1.0);
        float _319 = -_317;
        float _321 = fma(_319, _315, _233);
        float _323 = _321 * _309;
        float _325 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _295 = _325;
    }
    float _327 = _295;
    bool _329 = !_192;
    if (!_329)
    {
        float _331 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _333 = log2(_331);
        float _335 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _337 = _335 + 1.0;
        float _339 = 1.0 / _337;
        float _341 = _233 * _333;
        float _343 = exp2(_341);
        float _345 = -_343;
        float _347 = _345 + 1.0;
        float _349 = _347 * _339;
        _247 = _349;
    }
    float _351 = _247;
    float _353 = 1.0 / _136;
    float _355 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _357 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _359 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _361 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _363 = fma(_351, _172, _355);
    float _365 = fma(_351, _174, _357);
    float _367 = _210 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _369 = fma(_351, _176, _361);
    float _371 = fma(_363, _216, _178);
    float _373 = fma(_365, _216, _180);
    float _375 = _212 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _377 = fma(_369, _216, _182);
    float _379 = _214 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _381 = _267 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _383 = _275 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _385 = _283 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _387 = _291 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _389 = _227 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _391 = _243 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _393 = _140 * _353;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _397 = _381 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _399 = _383 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _401 = _389 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _403 = _385 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _405 = _387 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _407 = _391 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _409 = !_359;
    float _411 = _377;
    float _427;
    if (!_409)
    {
        float _413 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _415 = _166 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _417 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[14].x, _140);
        float _419 = _417 * _413;
        float _421 = floor(_419);
        float _423 = -_421;
        float _425 = _419 + _423;
        _427 = _425;
        _429 = true;
    }
    else
    {
        _427 = _393;
    }
    _429 = false;
    float _431 = _427;
    float _433 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _435 = log2(_433);
    float _437 = in.m_65.z;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _441 = _439 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _445 = _443 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _447 = 1.0 / _441;
    int _449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _451 = _449 != 0;
    int _453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _455 = _453 != 0;
    int _457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _459 = _457 != 0;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _465 = (*spvDescriptorSet0.vp_c10)._m0[9].y * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _467 = (*spvDescriptorSet0.vp_c10)._m0[9].y * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _469 = 1.0 / _445;
    float _471 = in.m_65.y;
    float _473 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _477 = _475 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _479 = _435 * _140;
    float _481 = 1.0 / _463;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _487 = fma((*spvDescriptorSet0.vp_c10)._m0[8].y, (*spvDescriptorSet0.vp_c8)._m0[0].x, _465);
    float _489 = fma((*spvDescriptorSet0.vp_c10)._m0[8].y, (*spvDescriptorSet0.vp_c8)._m0[1].x, _467);
    float _491 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _473);
    float _493 = _166 * 2.0;
    float _495 = 1.0 / _485;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _503 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _501;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _505;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _511 = _509 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _513 = _503 * _469;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _519 = exp2(_479);
    float _521 = _507 * _481;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _523;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _531 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _533 = isnan(1.0);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _539 = _535 || _537;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _543 = 1.0 + _541;
    float _545 = _511 * _447;
    float _547 = 1.0 / _477;
    float _549 = _166 + _437;
    bool _551 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _553 = isnan(0.0);
    bool _555 = _551 || _553;
    bool _557 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _559 = _555 || _557;
    float _561 = _517 * _495;
    float _563 = _549 + (-1.0);
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _567 = _431 + _565;
    float _569 = 1.0 / _543;
    float _571 = -_519;
    float _573 = _571 + 1.0;
    float _575 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _581 = fma(_561, _567, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _583 = _559 ? _573 : 0.0;
    float _585 = 1.0 / _499;
    float _587 = _471 * 2.0;
    float _589 = _529 * _547;
    float _591 = _471 + _437;
    bool _593 = !_451;
    int _595 = _593 ? 0 : 1;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _599 = _431 + _597;
    bool _601 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _603 = isnan(_431);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = _591 + (-1.0);
    float _615 = floor(_587);
    float _617 = _437 * 2.0;
    if (_539)
    {
        float _619 = _583 * _569;
        _158 = _619;
    }
    float _621 = _158;
    float _623 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _625 = _166 + _471;
    float _627 = -_611;
    float _629 = _627 + 1.0;
    bool _631 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _633 = isnan(_431);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _639 = _635 || _637;
    float _641 = float(_639);
    float _643 = floor(_493);
    float _645 = _625 + (-1.0);
    float _647 = _525 * _585;
    bool _649 = !_459;
    int _651 = _649 ? 0 : 1;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _653;
    float _657 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _659 = !_455;
    int _661 = _659 ? 0 : 1;
    float _663 = fma(_589, _599, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _665 = floor(_617);
    bool _667 = _615 > 0.0;
    bool _669 = _615 >= 0.0;
    bool _671 = isnan(_615);
    bool _673 = _669 || _671;
    bool _675 = isnan(0.0);
    bool _677 = _673 || _675;
    float _679 = 1.0 / _579;
    bool _681 = _643 >= 0.0;
    bool _683 = isnan(_643);
    bool _685 = _681 || _683;
    bool _687 = isnan(0.0);
    bool _689 = _685 || _687;
    bool _691 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _693 = isnan(_431);
    bool _695 = _691 || _693;
    bool _697 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _699 = _695 || _697;
    float _701 = float(_699);
    float _703 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _491);
    int _705 = _689 ? 0 : 1;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _709 = _431 + _707;
    bool _711 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _713 = isnan(_431);
    bool _715 = _711 || _713;
    bool _717 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _719 = _715 || _717;
    float _721 = float(_719);
    float _723 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    bool _725 = _665 >= 0.0;
    bool _727 = isnan(_665);
    bool _729 = _725 || _727;
    bool _731 = isnan(0.0);
    bool _733 = _729 || _731;
    float _735 = fma(_545, _709, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    int _737 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _739 = _737 != 0;
    int _741 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _743 = _741 != 0;
    int _745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _747 = _745 != 0;
    bool _749 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _751 = isnan(_431);
    bool _753 = _749 || _751;
    bool _755 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _757 = _753 || _755;
    float _759 = float(_757);
    float _761 = _655 * _679;
    bool _763 = _643 > 0.0;
    float _765 = fma((*spvDescriptorSet0.vp_c10)._m0[10].y, (*spvDescriptorSet0.vp_c8)._m0[0].z, _487);
    float _767 = fma((*spvDescriptorSet0.vp_c10)._m0[10].y, (*spvDescriptorSet0.vp_c8)._m0[1].z, _489);
    float _769 = -_759;
    float _771 = _769 + 1.0;
    bool _773 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _775 = isnan(_431);
    bool _777 = _773 || _775;
    bool _779 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _781 = _777 || _779;
    float _783 = float(_781);
    float _785 = _621 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    int _787 = _733 ? 0 : 1;
    float _789 = _611 * _771;
    float _791 = _641 * _629;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _795 = _431 + _793;
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _799 = _431 + _797;
    float _801 = -_641;
    float _803 = _801 + 1.0;
    float _805 = -_783;
    float _807 = _805 + 1.0;
    float _809 = fma(_521, _795, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    int _811 = ~_705;
    int _813 = _811 + 1;
    int _815 = _813 + 1;
    float _817 = fma(_513, _799, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _819 = _815;
    float _821 = _765;
    bool _823 = _667;
    if (!_763)
    {
        int _825 = ~_705;
        int _827 = _825 + 1;
        _819 = _827;
    }
    int _829 = _819;
    float _831 = _701 * _803;
    bool _833 = _665 > 0.0;
    float _835 = -_701;
    float _837 = _835 + 1.0;
    bool _839 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _841 = isnan(_431);
    bool _843 = _839 || _841;
    bool _845 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _847 = _843 || _845;
    float _849 = float(_847);
    float _851 = _785 * _723;
    int _853 = ~_787;
    int _855 = _853 + 1;
    int _857 = _855 + 1;
    float _859 = _783 * _837;
    float _861 = rsqrt(_703);
    float _863 = -_849;
    float _865 = _863 + 1.0;
    float _867 = _849 * _807;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _871 = _431 + _869;
    float _873 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[203].x, _851);
    float _875 = _721 * _865;
    int _877 = _857;
    if (!_833)
    {
        int _879 = ~_787;
        int _881 = _879 + 1;
        _877 = _881;
    }
    int _883 = _877;
    float _885 = fma(_647, _871, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _887 = !_743;
    int _889 = _887 ? 0 : 1;
    float _891 = _817 * _875;
    int _893 = _677 ? 0 : 1;
    float _895 = -_721;
    float _897 = _895 + 1.0;
    bool _899 = !_739;
    int _901 = _899 ? 0 : 1;
    int _903 = abs(_889);
    float _905 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[159].x, _891);
    int _907 = ~_893;
    int _909 = _907 + 1;
    int _911 = _909 + 1;
    float _913 = floor(_873);
    int _915 = _911;
    if (!_667)
    {
        int _917 = ~_893;
        int _919 = _917 + 1;
        _915 = _919;
    }
    int _921 = _915;
    float _923 = fma(_735, _867, _905);
    bool _925 = !_747;
    int _927 = _925 ? 0 : 1;
    float _929 = in.m_69.x;
    float _931 = in.m_69.y;
    float _933 = in.m_69.z;
    int _935 = abs(_901);
    float _937 = _873 + 0.25;
    int _939 = abs(_927);
    float _941 = float(_921);
    float _943 = floor(_937);
    float _945 = float(_939);
    float _947 = abs(_767);
    bool _949 = _947 > 0.001000000047497451305389404296875;
    float _951 = _945 * _941;
    float _953 = float(_903);
    float _955 = -_913;
    float _957 = _873 + _955;
    float _959 = _873 * 6.283185482025146484375;
    float _961 = _949 ? 0.0 : 9.9999997473787516355514526367188e-05;
    float _963 = _951 * (-2.0);
    float _965 = float(_883);
    float _967 = _959 * 0.15915493667125701904296875;
    bool _969 = _957 >= 0.5;
    bool _971 = isnan(_957);
    bool _973 = _969 || _971;
    bool _975 = isnan(0.5);
    bool _977 = _973 || _975;
    float _979 = fma(_575, _963, _575);
    int _981 = abs(_661);
    float _983 = -_943;
    float _985 = _937 + _983;
    float _987 = _967 * 6.283185482025146484375;
    float _989 = sin(_987);
    float _991 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[191].x, _166);
    float _993 = fma(_963, _933, _933);
    bool _995 = !_977;
    float _997 = _995 ? 0.5 : (-0.5);
    float _999 = _437 + (-0.5);
    bool _1001 = _985 > 0.5;
    float _1003 = _767 + _961;
    float _1005 = float(_981);
    float _1007 = fma(_999, (*spvDescriptorSet0.vp_c9)._m0[196].z, _993);
    int _1009 = abs(_595);
    float _1011 = _997 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1013 = _1011 * 2.0;
    float _1015 = float(_935);
    float _1017 = _861 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1019 = float(_829);
    float _1021 = _1005 * _1013;
    float _1023 = float(_1009);
    float _1025 = _989 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    int _1027 = abs(_651);
    float _1029 = _985;
    float _1031 = _1003;
    float _1033 = _1021;
    if (_1001)
    {
        float _1035 = -_985;
        float _1037 = _1035 + 1.0;
        _1029 = _1037;
    }
    float _1039 = _1029;
    float _1041 = _1015 * _965;
    float _1043 = _953 * _1019;
    float _1045 = fma(_1023, _1025, _1021);
    float _1047 = fma(_1039, 4.0, -1.0);
    float _1049 = float(_1027);
    float _1051 = _1043 * (-2.0);
    float _1053 = abs(_765);
    float _1055 = abs(_1003);
    float _1057 = precise::max(_1053, _1055);
    float _1059 = _1047 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1061 = _861 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1063 = _861 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1065 = fma(_979, _621, _1007);
    float _1067 = fma(_1049, _1059, _1045);
    float _1069 = fma(_623, _1051, _623);
    bool _1071 = _1057 >= 16.0;
    float _1073 = fma(_1051, _931, _931);
    float _1075 = fma(_1067, 3.1415927410125732421875, _929);
    float _1077 = _1041 * (-2.0);
    float _1079 = _471 + (-0.5);
    float _1081 = _166 + (-0.5);
    float _1083 = _991 * 0.15915493667125701904296875;
    float _1085 = fma(_1075, _1077, _1075);
    float _1087 = fma(_1079, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1073);
    float _1089 = fma(_657, _1077, _657);
    float _1091 = _1065 * 0.15915493667125701904296875;
    float _1093 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1085);
    float _1095 = fma(_1069, _621, _1087);
    if (_1071)
    {
        float _1097 = _765 * 0.0625;
        _821 = _1097;
    }
    float _1099 = _821;
    if (_1071)
    {
        float _1101 = _1003 * 0.0625;
        _1031 = _1101;
    }
    float _1103 = _1031;
    float _1105 = fma(_1089, _621, _1093);
    float _1107 = _1095 * 0.15915493667125701904296875;
    float _1109 = fma(_809, _859, _923);
    float _1111 = in.m_71.x;
    float _1113 = in.m_71.y;
    float _1115 = in.m_71.z;
    float _1117 = abs(_1099);
    bool _1119 = _1117 != 0.0;
    bool _1121 = isnan(_1117);
    bool _1123 = _1119 || _1121;
    bool _1125 = isnan(0.0);
    bool _1127 = _1123 || _1125;
    float _1129 = _1061 * _1061;
    bool _1131 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1133 = isnan(_431);
    bool _1135 = _1131 || _1133;
    bool _1137 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1139 = _1135 || _1137;
    float _1141 = float(_1139);
    float _1143 = fma(_581, _831, _1109);
    float _1145 = abs(_1103);
    bool _1147 = _1145 == 0.0;
    bool _1149 = !_1127;
    bool _1151 = _1147 && _1149;
    float _1153 = _1083 * 6.283185482025146484375;
    float _1155 = sin(_1153);
    float _1157 = fma(_1063, _1063, _1129);
    float _1159 = -_1141;
    float _1161 = _1159 + 1.0;
    float _1163 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1165 = _431 + _1163;
    float _1167 = fma(_885, _791, _1143);
    float _1169 = fma(_1017, _1017, _1157);
    float _1171 = _1105 * 0.15915493667125701904296875;
    float _1173 = abs(_1103);
    bool _1175 = _1173 == 0.0;
    float _1177 = _759 * _1161;
    float _1179 = fma(_761, _1165, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1181 = fma(_663, _789, _1167);
    float _1183 = rsqrt(_1169);
    int _1185 = as_type<int>(_1167);
    if (_1151)
    {
        bool _1187 = as_type<int>(_1103) >= 0;
        _823 = _1187;
    }
    bool _1189 = _823;
    float _1191 = fma(_1179, _1177, _1181);
    int _1193 = _1189 ? (-1) : 0;
    if (_1151)
    {
        int _1195 = _1189 ? 0 : 1078530011;
        _1185 = _1195;
    }
    int _1197 = _1185;
    float _1199 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1191);
    float _1201 = _1091 * 6.283185482025146484375;
    float _1203 = sin(_1201);
    float _1205 = _1155 * _1115;
    float _1207 = _1199 * _1111;
    float _1209 = _1199 * _1113;
    float _1211 = _1199 * _1205;
    int _1213 = as_type<int>(_1111);
    if (_1151)
    {
        int _1215 = int(0x80000000) & as_type<int>(_1099);
        int _1217 = _1197 | _1215;
        _1213 = _1217;
    }
    int _1219 = _1213;
    float _1221 = _1091 * 6.283185482025146484375;
    float _1223 = cos(_1221);
    float _1225 = _1107 * 6.283185482025146484375;
    float _1227 = cos(_1225);
    float _1229 = _1171 * 6.283185482025146484375;
    float _1231 = sin(_1229);
    float _1233 = _1171 * 6.283185482025146484375;
    float _1235 = cos(_1233);
    bool _1237 = !_1127;
    bool _1239 = _1237 && _1175;
    int _1241 = _1219;
    float _1243 = as_type<float>(_1219);
    if (!_1239)
    {
        float _1245 = abs(_1099);
        bool _1247 = _1245 != as_type<float>(0x7f800000u /* inf */);
        bool _1249 = isnan(_1245);
        bool _1251 = _1247 || _1249;
        bool _1253 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1255 = _1251 || _1253;
        float _1257 = abs(_1103);
        bool _1259 = _1257 == as_type<float>(0x7f800000u /* inf */);
        float _1261 = abs(_1103);
        bool _1263 = _1261 == as_type<float>(0x7f800000u /* inf */);
        bool _1265 = !_1255;
        bool _1267 = _1263 && _1265;
        if (_1267)
        {
            bool _1269 = as_type<int>(_1103) >= 0;
            _1193 = _1269 ? (-1) : 0;
        }
        int _1271 = _1193;
        if (_1267)
        {
            _1241 = 1075235812;
        }
        int _1273 = _1241;
        int _1275 = _1273;
        if (_1267)
        {
            int _1277 = ~_1271;
            int _1279 = (_1277 != 0) ? _1273 : 1061752795;
            _1275 = _1279;
        }
        int _1281 = _1275;
        float _1283 = as_type<float>(_1281);
        if (_1267)
        {
            int _1285 = int(0x80000000) & as_type<int>(_1099);
            int _1287 = _1281 | _1285;
            _1283 = as_type<float>(_1287);
        }
        float _1289 = _1283;
        bool _1291 = !_1255;
        bool _1293 = _1291 && _1259;
        _1243 = _1289;
        if (!_1293)
        {
            float _1295 = abs(_1099);
            float _1297 = abs(_1103);
            float _1299 = precise::max(_1295, _1297);
            float _1301 = abs(_1099);
            float _1303 = abs(_1103);
            float _1305 = precise::min(_1301, _1303);
            float _1307 = 1.0 / _1299;
            float _1309 = abs(_1099);
            float _1311 = abs(_1103);
            bool _1313 = _1309 > _1311;
            bool _1315 = as_type<int>(_1103) >= 0;
            float _1317 = _1305 * _1307;
            float _1319 = _1317 * _1317;
            float _1321 = _1319 + 11.33538818359375;
            float _1323 = fma(_1319, _1321, 28.84246826171875);
            float _1325 = fma(_1319, _1323, 19.6966705322265625);
            float _1327 = fma(_1319, -0.82336294651031494140625, -5.674867153167724609375);
            float _1329 = fma(_1319, _1327, -6.565555095672607421875);
            float _1331 = 1.0 / _1325;
            float _1333 = _1319 * _1329;
            float _1335 = abs(_1099);
            float _1337 = abs(_1103);
            float _1339 = _1335 + _1337;
            float _1341 = _1317 * _1333;
            bool _1343 = _1339 > as_type<float>(0x7f800000u /* inf */);
            bool _1345 = isnan(_1339);
            bool _1347 = _1343 || _1345;
            bool _1349 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1351 = _1347 || _1349;
            float _1353 = fma(_1341, _1331, _1317);
            int _1355 = as_type<int>(_1099) & int(0x80000000);
            float _1357 = _1353;
            _1243 = _1339;
            if (_1313)
            {
                float _1359 = -_1353;
                float _1361 = _1359 + 1.57079637050628662109375;
                _1357 = _1361;
            }
            float _1363 = _1357;
            int _1365 = as_type<int>(_1363);
            if (!_1315)
            {
                float _1367 = -_1363;
                float _1369 = _1367 + 3.1415927410125732421875;
                _1365 = as_type<int>(_1369);
            }
            int _1371 = _1365;
            if (!_1351)
            {
                int _1373 = _1355 | _1371;
                _1243 = as_type<float>(_1373);
            }
        }
    }
    float _1375 = _1243;
    float _1377 = _1107 * 6.283185482025146484375;
    float _1379 = sin(_1377);
    float _1381 = _375 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1383 = _379 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1385 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1209);
    float _1387 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1211);
    float _1389 = _367 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1391 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1207);
    float _1393 = _1381 * _1385;
    float _1395 = _1383 * _1387;
    float _1397 = _1227 * _1203;
    float _1399 = _1389 * _1391;
    float _1401 = _1235 * _1203;
    float _1403 = _1231 * _1203;
    float _1405 = _1375 * (-0.15915493667125701904296875);
    float _1407 = _1235 * _1223;
    float _1409 = _1227 * _1223;
    float _1411 = _1231 * _1223;
    float _1413 = _1405 * 6.283185482025146484375;
    float _1415 = cos(_1413);
    float _1417 = fma(_1379, _1403, _1407);
    float _1419 = _1231 * _1227;
    float _1421 = _1235 * _1227;
    float _1423 = -_1401;
    float _1425 = fma(_1379, _1411, _1423);
    float _1427 = _1417 * _1393;
    float _1429 = -_1411;
    float _1431 = fma(_1379, _1401, _1429);
    float _1433 = _1419 * _1393;
    float _1435 = _1405 * 6.283185482025146484375;
    float _1437 = sin(_1435);
    float _1439 = _1425 * _1393;
    float _1441 = fma(_1397, _1399, _1427);
    float _1443 = fma(_1379, _1407, _1403);
    float _1445 = -_1379;
    float _1447 = fma(_1445, _1399, _1433);
    float _1449 = fma(_1409, _1399, _1439);
    float _1451 = fma(_1431, _1395, _1441);
    float _1453 = _1063 * _1183;
    float _1455 = _1061 * _1183;
    float _1457 = _1017 * _1183;
    float _1459 = fma(_1443, _1395, _1449);
    float _1461 = -_1415;
    float _1463 = _1461 + 1.0;
    float _1465 = _1451 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1467 = fma(_1421, _1395, _1447);
    float _1469 = _1451 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1471 = _1451 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1473 = _1457 * _1437;
    float _1475 = _1453 * _1463;
    float _1477 = fma(_1459, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1465);
    float _1479 = fma(_1459, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1469);
    float _1481 = fma(_1459, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1471);
    float _1483 = _1457 * _1457;
    float _1485 = -_1473;
    float _1487 = fma(_1455, _1475, _1485);
    float _1489 = fma(_1467, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1477);
    float _1491 = _1453 * _1437;
    float _1493 = _1455 * _1463;
    float _1495 = fma(_1467, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1479);
    float _1497 = fma(_1453, _1475, _1415);
    float _1499 = _1489 * _1487;
    float _1501 = fma(_1463, _1483, _1415);
    float _1503 = fma(_1467, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1481);
    float _1505 = _1455 * _1437;
    float _1507 = fma(_1457, _1493, _1491);
    float _1509 = _373 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1511 = _373 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1513 = fma(_1495, _1497, _1499);
    float _1515 = -_1505;
    float _1517 = fma(_1457, _1475, _1515);
    float _1519 = _1489 * _1507;
    float _1521 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1509);
    float _1523 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1511);
    float _1525 = fma(_1457, _1475, _1505);
    float _1527 = fma(_1495, _1517, _1519);
    float _1529 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1521);
    float _1531 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1523);
    float _1533 = fma(_1503, _1525, _1513);
    float _1535 = fma(_1503, _1501, _1527);
    float _1537 = _1529 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1539 = _1531 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1541 = in.m_73.y;
    float _1543 = _1537 + _1533;
    float _1545 = _1539 + _1535;
    float _1547 = in.m_75.x;
    float _1549 = in.m_75.y;
    float _1551 = in.m_75.z;
    int _1553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1555 = _1553 != 0;
    float _1557 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1559 = _1543 + _1557;
    float _1561 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1563 = _1545 + _1561;
    int _1565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1567 = _1565 != 0;
    float _1569 = in.m_73.x;
    float _1571 = _1559 * _1559;
    float _1573 = _1563 * _1563;
    bool _1575 = _1209 != 0.0;
    bool _1577 = isnan(_1209);
    bool _1579 = _1575 || _1577;
    bool _1581 = isnan(0.0);
    bool _1583 = _1579 || _1581;
    float _1585 = _373 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1587 = _166 > 0.5;
    bool _1589 = _1587 && _1555;
    float _1591 = _1571 + _1573;
    bool _1593 = _1207 == 0.0;
    bool _1595 = !_1583;
    bool _1597 = _1593 && _1595;
    float _1599 = fma(_1455, _1493, _1415);
    bool _1601 = _471 > 0.5;
    float _1603 = sqrt(_1591);
    bool _1605 = _1211 == 0.0;
    bool _1607 = _1605 && _1597;
    float _1609 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1585);
    float _1611 = fma(_1455, _1475, _1473);
    float _1613 = _1489 * _1599;
    float _1615 = -_1541;
    float _1617 = _1615 + 1.0;
    float _1619 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1609);
    float _1621 = -_1491;
    float _1623 = fma(_1457, _1493, _1621);
    float _1625 = fma(_1495, _1611, _1613);
    float _1627 = _1541;
    float _1629 = _1617;
    float _1631 = _1613;
    float _1633 = _1571;
    float _1635 = _1573;
    if (_1567)
    {
        float _1637 = _1601 ? _1617 : _1541;
        _1627 = _1637;
    }
    float _1639 = _1627;
    float _1641 = _1619 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1643 = fma(_1503, _1623, _1625);
    float _1645 = _1549;
    float _1647 = _1547;
    float _1649 = _1551;
    if (!_1607)
    {
        float _1651 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1549);
        _1645 = _1651;
    }
    float _1653 = _1645;
    if (_1555)
    {
        _1033 = _1569;
    }
    float _1655 = _1033;
    float _1657 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1659 = _1603 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1661 = _1655;
    if (!_1607)
    {
        float _1663 = fma(_1207, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1547);
        _1647 = _1663;
    }
    float _1665 = _1647;
    float _1667 = _1419 * _1653;
    float _1669 = _1667;
    if (_1589)
    {
        float _1671 = -_1655;
        float _1673 = _1671 + 1.0;
        _1661 = _1673;
    }
    float _1675 = _1661;
    float _1677 = _1641 + _1643;
    float _1679 = _1425 * _1653;
    float _1681 = _1677;
    if (!_1555)
    {
        _411 = _1569;
    }
    float _1683 = _411;
    float _1685 = -_1379;
    float _1687 = fma(_1685, _1665, _1667);
    float _1689 = _1683;
    if (_1555)
    {
        _1689 = _1675;
    }
    float _1691 = _1689;
    float _1693 = _1417 * _1653;
    float _1695 = fma(_1409, _1665, _1679);
    if (!_1659)
    {
        _1629 = _1543;
    }
    float _1697 = _1629;
    float _1699 = _1697;
    if (!_1659)
    {
        _1631 = _1545;
    }
    float _1701 = _1631;
    float _1703 = _1701;
    if (!_1659)
    {
        _1669 = _1677;
    }
    float _1705 = _1669;
    bool _1707 = !_1659;
    float _1709 = _1705;
    if (!_1707)
    {
        float _1711 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1713 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1715 = _1603 + _1713;
        float _1717 = rsqrt(_1591);
        float _1719 = _1715 * _1711;
        float _1721 = _1677 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1723 = _1719 * 0.15915493667125701904296875;
        float _1725 = _1723 * 6.283185482025146484375;
        float _1727 = sin(_1725);
        float _1729 = _1723 * 6.283185482025146484375;
        float _1731 = cos(_1729);
        float _1733 = fma(_1727, _1721, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1735 = _1717 * _1733;
        float _1737 = fma(_1559, _1735, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1739 = _1731 + (-1.0);
        float _1741 = fma(_1563, _1735, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1743 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1745 = _1737 + _1743;
        float _1747 = _1739 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1749 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1751 = _1741 + _1749;
        float _1753 = _1745 * _1745;
        float _1755 = fma(_1677, _1731, _1747);
        float _1757 = _1751 * _1751;
        _1709 = _1755;
        _1633 = _1753;
        _1635 = _1757;
        _1699 = _1737;
        _1703 = _1741;
    }
    float _1759 = _1709;
    float _1761 = _1633;
    float _1763 = _1635;
    float _1765 = _1699;
    float _1767 = _1703;
    float _1769 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1771 = _1759 + _1769;
    float _1773 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (!_1607)
    {
        float _1775 = fma(_1211, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1551);
        _1649 = _1775;
    }
    float _1777 = _1649;
    float _1779 = fma(_1397, _1665, _1693);
    float _1781 = fma(_1771, _1771, _1761);
    float _1783 = _1639 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1785 = fma(_1443, _1777, _1695);
    float _1787 = fma(_1431, _1777, _1779);
    float _1789 = _1781 + _1763;
    float _1791 = _1691 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1793 = fma(_1421, _1777, _1687);
    float _1795 = _1787 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1797 = _1787 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1799 = _1787 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1801 = sqrt(_1789);
    float _1803 = fma(_1785, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1795);
    float _1805 = fma(_1785, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1797);
    float _1807 = fma(_1785, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1799);
    float _1809 = _1783 * _1657;
    float _1811 = _1791 * _1773;
    float _1813 = fma(_1793, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1803);
    float _1815 = fma(_1793, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1805);
    float _1817 = fma(_1793, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1807);
    out.m_77.x = _397;
    out.m_77.y = _399;
    out.m_77.z = _401;
    out.m_77.w = _395;
    out.m_79.x = _403;
    out.m_79.y = _405;
    out.m_79.z = _407;
    bool _1819 = _1801 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1821 = isnan(_1801);
    bool _1823 = _1819 || _1821;
    bool _1825 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1827 = _1823 || _1825;
    out.m_81.x = 1.0;
    out.m_81.y = 1.0;
    out.m_81.z = 1.0;
    out.m_83.x = _1811;
    out.m_83.y = _1809;
    out.m_85.x = _1813;
    out.m_85.y = _1815;
    out.m_85.z = _1817;
    if (!_1827)
    {
        _1681 = 1.0;
    }
    float _1829 = _1681;
    bool _1831 = !_1827;
    float _1833 = _1829;
    if (!_1831)
    {
        bool _1835 = _1801 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1837 = isnan(_1801);
        bool _1839 = _1835 || _1837;
        bool _1841 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1843 = _1839 || _1841;
        if (!_1843)
        {
            float _1845 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1847 = _1801 + _1845;
            float _1849 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1851 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1849;
            float _1853 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1855 = _1853 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1857 = 1.0 / _1851;
            float _1859 = _1847 * _1857;
            float _1861 = fma(_1859, _1855, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1833 = _1861;
            _1863 = true;
        }
        else
        {
            bool _1865 = _1801 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1867 = isnan(_1801);
            bool _1869 = _1865 || _1867;
            bool _1871 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1873 = _1869 || _1871;
            if (!_1873)
            {
                float _1875 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1877 = _1801 + _1875;
                float _1879 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1881 = _1879 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1883 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1885 = _1883 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1887 = 1.0 / _1881;
                float _1889 = _1877 * _1887;
                float _1891 = fma(_1889, _1885, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1833 = _1891;
                _1863 = true;
            }
            else
            {
                _1833 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1863 = false;
    float _1893 = _1833;
    float _1895 = fma(_1537, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1897 = fma(_1539, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1899 = floor(_1895);
    float _1901 = floor(_1897);
    float _1903 = -_1899;
    float _1905 = _1895 + _1903;
    float _1907 = -_1901;
    float _1909 = _1897 + _1907;
    float2 _6157 = float2(_1905, _1909);
    float _1911 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6157, float2(0.0), isnan(_6157)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6157, float2(0.0), isnan(_6157)), level(0.0)).x;
    float _1913 = _1641 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1915 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1917 = _1765 + _1915;
    float _1919 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1913);
    float _1921 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1923 = _1767 + _1921;
    float _1925 = fma(_1539, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1919);
    float _1927 = _1641 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1929 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    bool _1931 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1933 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1935 = _1931 || _1933;
    bool _1937 = isnan(0.5);
    bool _1939 = _1935 || _1937;
    float _1941 = _1925 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1943 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1927);
    float _1945 = _1641 + _1929;
    float _1947 = fma(_1917, _1893, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1949 = 1.0 / _1941;
    float _1951 = fma(_1539, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1943);
    float _1953 = _1945 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1955 = _1951 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1957 = fma(_1537, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1953);
    float _1959 = _1955 + _1941;
    float _1961 = fma(_1539, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1957);
    float _1963 = _1961 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1965 = _1959 * _1949;
    float _1967 = _1965 * 0.5;
    float _1969 = trunc(_1963);
    int _1971 = int(_1969);
    float _1973 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1975 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1973);
    float _1977 = 1.0 / _1975;
    int _1979 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1981 = _1971 + _1979;
    int _1983 = _1981 + 1;
    float _1985 = _1945 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1987 = fma(_1537, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1985);
    float _1989 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1991 = _1977 * _1989;
    bool _1993 = _1991 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1995 = _1991 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1997 = !_1993;
    int _1999 = _1997 ? 0 : 1;
    int _2001 = 2;
    float _2003 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _2005 = _1917;
    int _2007 = as_type<int>(_1923);
    if (!_1993)
    {
        _2001 = 1;
    }
    int _2009 = _2001;
    int _2011 = _2009;
    if (!_1995)
    {
        _2011 = _1999;
    }
    int _2013 = _2011;
    float _2015 = fma(_1539, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1987);
    bool _2017 = _1983 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2019 = _2013 << 6;
    float _2021 = _2015 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _2023 = _2019 + 48;
    uint _2025 = uint(int(uint(_2023) >> uint(2)));
    uint _2027 = uint(int(uint(int(_2025)) >> uint(2)));
    int _2029 = int(_2025) & 3;
    float _2031 = (*spvDescriptorSet0.vp_c15)._m0[int(_2027)][_2029];
    int _2033 = int(_2025) + 1;
    uint _2035 = uint(int(uint(_2033) >> uint(2)));
    int _2037 = _2033 & 3;
    float _2039 = (*spvDescriptorSet0.vp_c15)._m0[int(_2035)][_2037];
    float _2041 = trunc(_2021);
    int _2043 = int(_2041);
    int _2045 = _2019 + 56;
    uint _2047 = uint(int(uint(_2045) >> uint(2)));
    uint _2049 = uint(int(uint(int(_2047)) >> uint(2)));
    int _2051 = int(_2047) & 3;
    float _2053 = (*spvDescriptorSet0.vp_c15)._m0[int(_2049)][_2051];
    int _2055 = int(_2047) + 1;
    uint _2057 = uint(int(uint(_2055) >> uint(2)));
    int _2059 = _2055 & 3;
    float _2061 = (*spvDescriptorSet0.vp_c15)._m0[int(_2057)][_2059];
    int _2063 = _2019 + 64;
    uint _2065 = uint(int(uint(_2063) >> uint(2)));
    uint _2067 = uint(int(uint(int(_2065)) >> uint(2)));
    int _2069 = int(_2065) & 3;
    float _2071 = (*spvDescriptorSet0.vp_c15)._m0[int(_2067)][_2069];
    int _2073 = int(_2065) + 1;
    uint _2075 = uint(int(uint(_2073) >> uint(2)));
    int _2077 = _2073 & 3;
    float _2079 = (*spvDescriptorSet0.vp_c15)._m0[int(_2075)][_2077];
    int _2081 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2083 = _2043 + _2081;
    int _2085 = _2083 + 1;
    int _2087 = _1983 | _2085;
    int _2089 = _2019 + 72;
    uint _2091 = uint(int(uint(_2089) >> uint(2)));
    uint _2093 = uint(int(uint(int(_2091)) >> uint(2)));
    int _2095 = int(_2091) & 3;
    float _2097 = (*spvDescriptorSet0.vp_c15)._m0[int(_2093)][_2095];
    int _2099 = int(_2091) + 1;
    uint _2101 = uint(int(uint(_2099) >> uint(2)));
    int _2103 = _2099 & 3;
    float _2105 = (*spvDescriptorSet0.vp_c15)._m0[int(_2101)][_2103];
    bool _2107 = _2087 < 0;
    bool _2109 = _2107 || _2017;
    float _2111 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2113 = _1759 + _2111;
    bool _2115 = _2085 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2117 = _2115 || _2109;
    float _2119 = fma(_2113, _1893, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2121 = fma(_1923, _1893, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    int _2123 = _2019 + 96;
    uint _2125 = uint(int(uint(_2123) >> uint(2)));
    uint _2127 = uint(int(uint(int(_2125)) >> uint(2)));
    int _2129 = int(_2125) & 3;
    float _2131 = (*spvDescriptorSet0.vp_c15)._m0[int(_2127)][_2129];
    int _2133 = int(_2125) + 1;
    uint _2135 = uint(int(uint(_2133) >> uint(2)));
    int _2137 = _2133 & 3;
    float _2139 = (*spvDescriptorSet0.vp_c15)._m0[int(_2135)][_2137];
    float _2141 = _2113;
    if (_1939)
    {
        _2141 = _1947;
    }
    float _2143 = _2141;
    float _2145 = _2143;
    if (_1939)
    {
        _2003 = _2119;
    }
    float _2147 = _2003;
    float _2149 = _2147;
    if (_1939)
    {
        _2005 = _2121;
    }
    float _2151 = _2005;
    int _2153 = _2019 + 104;
    uint _2155 = uint(int(uint(_2153) >> uint(2)));
    uint _2157 = uint(int(uint(int(_2155)) >> uint(2)));
    int _2159 = int(_2155) & 3;
    float _2161 = (*spvDescriptorSet0.vp_c15)._m0[int(_2157)][_2159];
    int _2163 = int(_2155) + 1;
    uint _2165 = uint(int(uint(_2163) >> uint(2)));
    int _2167 = _2163 & 3;
    float _2169 = (*spvDescriptorSet0.vp_c15)._m0[int(_2165)][_2167];
    float _2171 = _2151;
    int _2173 = as_type<int>(_2139);
    if (!_1939)
    {
        float _2175 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2177 = _1641 + _2175;
        float _2179 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2181 = _1537 + _2179;
        float _2183 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2185 = -_1539;
        float _2187 = _2185 + _2121;
        float _2189 = _2177 * _2177;
        float _2191 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2193 = _1539 + _2191;
        float _2195 = fma(_2181, _2181, _2189);
        float _2197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2199 = fma(_2193, _2193, _2195);
        float _2201 = sqrt(_2199);
        float _2203 = _2183 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2205 = precise::min(_2201, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2207 = _2205 * _2197;
        float _2209 = -_1641;
        float _2211 = _2209 + _2119;
        float _2213 = _2203 * _2207;
        float _2215 = -_1537;
        float _2217 = _2215 + _1947;
        float _2219 = fma(_2211, _2213, _1641);
        float _2221 = fma(_2217, _2213, _1537);
        float _2223 = fma(_2187, _2213, _1539);
        _2149 = _2219;
        _2007 = as_type<int>(_2213);
        _2145 = _2221;
        _2171 = _2223;
    }
    float _2225 = _2149;
    int _2227 = _2007;
    float _2229 = _2145;
    float _2231 = _2171;
    float _2233 = _1945 * _2139;
    int _2235 = _2227;
    if (!_2117)
    {
        int _2237 = _2085 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2239 = _2237 + _1983;
        _2235 = _2239;
    }
    int _2241 = _2235;
    float _2243 = _2225 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2245 = _1945 * _2079;
    float _2247 = fma(_1537, _2131, _2233);
    float _2249 = _1945 * _2039;
    int _2251 = as_type<int>(_2249);
    float _2253 = _2247;
    if (!_2117)
    {
        int _2255 = _2241 << 2;
        _2173 = _2255;
    }
    int _2257 = _2173;
    float _2259 = fma(_2229, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2243);
    float _2261 = fma(_1539, _2161, _2247);
    float _2263 = fma(_1537, _2031, _2249);
    int _2265 = _2257;
    if (!_2117)
    {
        uint _2267 = uint(int(uint(_2241) >> uint(2)));
        _2251 = int(_2267);
    }
    int _2269 = _2251;
    float _2271 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2259);
    float _2273 = _2261 + _2169;
    if (!_2117)
    {
        int _2275 = 12 & _2257;
        _2265 = _2275;
    }
    int _2277 = _2265;
    float _2279 = fma(_1537, _2071, _2245);
    float _2281 = _2271 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _2283 = _2019 + 80;
    uint _2285 = uint(int(uint(_2283) >> uint(2)));
    uint _2287 = uint(int(uint(int(_2285)) >> uint(2)));
    int _2289 = int(_2285) & 3;
    float _2291 = (*spvDescriptorSet0.vp_c15)._m0[int(_2287)][_2289];
    int _2293 = int(_2285) + 1;
    uint _2295 = uint(int(uint(_2293) >> uint(2)));
    int _2297 = _2293 & 3;
    float _2299 = (*spvDescriptorSet0.vp_c15)._m0[int(_2295)][_2297];
    if (!_2117)
    {
        int _2301 = _2269 << 4;
        int _2303 = _2301 + _2277;
        _2253 = as_type<float>(_2303);
    }
    float _2305 = _2253;
    float _2307 = 1.0 / _2273;
    float _2309 = fma(_1539, _2053, _2263);
    float _2311 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2313 = _2281 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2315 = fma(_1539, _2097, _2279);
    float _2317 = _2225 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2319 = _2305;
    if (!_2117)
    {
        int _2321 = as_type<int>(_2305) + 400;
        uint _2323 = uint(int(uint(_2321) >> uint(2)));
        uint _2325 = uint(int(uint(int(_2323)) >> uint(2)));
        int _2327 = int(_2323) & 3;
        float _2329 = (*spvDescriptorSet0.vp_c15)._m0[int(_2325)][_2327];
        _2319 = _2329;
    }
    float _2331 = _2319;
    float _2333 = -_2313;
    float _2335 = fma(_2333, _2311, 1.0);
    float _2337 = _2309 + _2061;
    float _2339 = _2225 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2341 = fma(_2229, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2317);
    float _2343 = _2225 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2345 = _2315 + _2105;
    float _2347 = fma(_2229, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2339);
    int _2349 = _2019 + 88;
    uint _2351 = uint(int(uint(_2349) >> uint(2)));
    uint _2353 = uint(int(uint(int(_2351)) >> uint(2)));
    int _2355 = int(_2351) & 3;
    float _2357 = (*spvDescriptorSet0.vp_c15)._m0[int(_2353)][_2355];
    int _2359 = int(_2351) + 1;
    uint _2361 = uint(int(uint(_2359) >> uint(2)));
    int _2363 = _2359 & 3;
    float _2365 = (*spvDescriptorSet0.vp_c15)._m0[int(_2361)][_2363];
    float _2367 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2341);
    float _2369 = _2337 * _2307;
    float _2371 = fma(_2229, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2343);
    float _2373 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2347);
    float _2375 = _2367 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2377 = _2345 * _2307;
    bool _2379 = _2369 >= 0.0;
    float _2381 = _2373 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2383 = _2375 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2385 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2371);
    bool _2387 = _2369 <= 1.0;
    bool _2389 = _2387 && _2379;
    float _2391 = as_type<float>(_2085);
    float _2393 = _2335;
    if (!_2117)
    {
        float _2395 = floor(_2021);
        _2391 = _2395;
    }
    float _2397 = _2391;
    float _2399 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2383);
    float _2401 = _2385 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _2403 = _2377 >= 0.0;
    bool _2405 = _2403 && _2389;
    float _2407 = _2375 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2409 = fma(_2281, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2399);
    float _2411 = _2375 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _2413 = _2377 <= 1.0;
    bool _2415 = _2413 && _2405;
    float _2417 = log2(_2335);
    float _2419 = fma(_2401, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2409);
    float _2421 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2407);
    float _2423 = fma(_2281, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2421);
    float _2425 = 1.0 / _2419;
    float _2427 = _2397;
    float _2429 = _2411;
    float _2431 = _2419;
    if (!_2117)
    {
        float _2433 = -_2397;
        float _2435 = _2021 + _2433;
        _2427 = _2435;
    }
    float _2437 = _2427;
    float _2439 = _1945 * _2299;
    float _2441 = _2437;
    if (_2415)
    {
        float _2443 = float(_2013);
        _2393 = _2443;
    }
    float _2445 = _2393;
    float _2447 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2411);
    float _2449 = _2119;
    float _2451 = _2445;
    if (!_2117)
    {
        float _2453 = floor(_1963);
        _2449 = _2453;
    }
    float _2455 = _2449;
    float _2457 = fma(_1537, _2291, _2439);
    float _2459 = fma(_2281, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2447);
    float _2461 = fma(_2401, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2423);
    float _2463 = fma(_2401, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2459);
    float _2465 = _2421;
    float _2467 = _2463;
    if (_2415)
    {
        float _2469 = rint(_2445);
        float _2471 = precise::max(_2469, 0.0);
        uint _2473 = uint(_2471);
        uint _2475 = clamp(_2473, 0u, 65535u);
        _2465 = as_type<float>(_2475);
    }
    float _2477 = _2465;
    float _2479 = fma(_1539, _2357, _2457);
    float _2481 = _2417 * 0.693147182464599609375;
    float _2483 = _2463 * _2425;
    float _2485 = _2331;
    if (!_2117)
    {
        float _2487 = rint(_2331);
        float _2489 = precise::max(_2487, 0.0);
        uint _2491 = uint(_2489);
        uint _2493 = clamp(_2491, 0u, 65535u);
        _2485 = as_type<float>(_2493);
    }
    float _2495 = _2485;
    float _2497 = _2479 + _2365;
    float _2499 = _2461 * _2425;
    float _2501 = _2481 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2503 = fma(_2483, -0.5, 0.5);
    float _2505 = _2497 * _2307;
    float _2507 = fma(_2499, 0.5, 0.5);
    float _2509 = _2505;
    if (!_2117)
    {
        float _2511 = -_2455;
        float _2513 = _1963 + _2511;
        _2451 = _2513;
    }
    float _2515 = _2451;
    float _2517 = _2477;
    if (_2415)
    {
        float3 _7188 = float3(_2369, _2377, float(as_type<int>(_2477)));
        float3 _7192 = select(_7188, float3(0.0), isnan(_7188));
        float _2519 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7192.xy, uint(rint(_7192.z)), _2505, level(0.0));
        _2517 = _2519;
    }
    float _2521 = _2517;
    float3 _7202 = float3(_2507, _2503, _2501);
    float _2523 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7202, float3(0.0), isnan(_7202)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7202, float3(0.0), isnan(_7202)), level(0.0)).x;
    float3 _7211 = float3(_2507, _2503, _2501);
    float4 _2526 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7211, float3(0.0), isnan(_7211)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7211, float3(0.0), isnan(_7211)), level(0.0)).xyzw;
    float _2528 = _2526.x;
    float _2530 = _2526.y;
    float _2532 = _2526.z;
    float _2534 = _2526.w;
    float _2536 = _2515;
    float _2538 = _2495;
    if (!_2117)
    {
        float3 _7235 = float3(_2515, _2437, float(as_type<int>(_2495)));
        float3 _7237 = select(_7235, float3(0.0), isnan(_7235));
        float _2540 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7237.xy, uint(rint(_7237.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7237.xy, uint(rint(_7237.z)), level(0.0)).x;
        _2536 = _2540;
    }
    float _2542 = _2536;
    if (_2117)
    {
        _2429 = 1.0;
    }
    float _2544 = _2429;
    float _2546 = _2544;
    if (!_2117)
    {
        int _2548 = _2241 << 4;
        int _2550 = _2548 + 2048;
        uint _2552 = uint(int(uint(_2550) >> uint(2)));
        uint _2554 = uint(int(uint(int(_2552)) >> uint(2)));
        int _2556 = int(_2552) & 3;
        float _2558 = (*spvDescriptorSet0.vp_c15)._m0[int(_2554)][_2556];
        int _2560 = int(_2552) + 1;
        uint _2562 = uint(int(uint(_2560) >> uint(2)));
        int _2564 = _2560 & 3;
        float _2566 = (*spvDescriptorSet0.vp_c15)._m0[int(_2562)][_2564];
        int _2568 = _2550 + 8;
        uint _2570 = uint(int(uint(_2568) >> uint(2)));
        uint _2572 = uint(int(uint(int(_2570)) >> uint(2)));
        int _2574 = int(_2570) & 3;
        float _2576 = (*spvDescriptorSet0.vp_c15)._m0[int(_2572)][_2574];
        int _2578 = int(_2570) + 1;
        uint _2580 = uint(int(uint(_2578) >> uint(2)));
        int _2582 = _2578 & 3;
        float _2584 = (*spvDescriptorSet0.vp_c15)._m0[int(_2580)][_2582];
        float _2586 = _1945 * _2566;
        float _2588 = fma(_1537, _2558, _2586);
        float _2590 = fma(_1539, _2576, _2588);
        float _2592 = _2590 + _2584;
        float _2594 = precise::clamp(_2592, 0.0, 1.0);
        float _2596 = -_2594;
        float _2598 = _2596 + _2542;
        float _2600 = fma(_2598, 500.0, 1.5);
        float _2602 = exp2(_2600);
        float _2604 = 0.0 + _2602;
        float _2606 = precise::clamp(_2604, 0.0, 1.0);
        _2546 = _2606;
    }
    float _2608 = _2546;
    float _2610 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2612 = _2225 + _2610;
    float _2614 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2616 = _2229 + _2614;
    float _2618 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2620 = _2231 + _2618;
    float _2622 = _2612 * _2612;
    float _2624 = fma(_2616, _2616, _2622);
    float _2626 = fma(_2620, _2620, _2624);
    float _2628 = rsqrt(_2626);
    float _2630 = _2628 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2632 = _2616 * _2630;
    float _2634 = _2620 * _2630;
    float _2636 = _2632 * _2632;
    float _2638 = _2634 * _2634;
    float _2640 = _2636 + _2638;
    float _2642 = sqrt(_2640);
    bool _2644 = _2642 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2646 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2648 = _2642 + _2646;
    float _2650 = _2620;
    float _2652 = _2628;
    float _2654 = _2648;
    float _2656 = _2630;
    if (_2644)
    {
        float _2658 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2650 = _2658;
    }
    float _2660 = _2650;
    if (_2644)
    {
        float _2662 = rsqrt(_2640);
        _2652 = _2662;
    }
    float _2664 = _2652;
    float _2666 = _2664;
    if (_2644)
    {
        float _2668 = _2648 * _2660;
        _2654 = _2668;
    }
    float _2670 = _2654;
    if (_2644)
    {
        float _2672 = _2670 * 0.15915493667125701904296875;
        _2538 = _2672;
    }
    float _2674 = _2538;
    float _2676 = _2660;
    if (_2644)
    {
        float _2678 = _2674 * 6.283185482025146484375;
        float _2680 = sin(_2678);
        _2676 = _2680;
    }
    float _2682 = _2676;
    float _2684 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2686 = precise::max(0.0, _2684);
    float _2688 = _1963;
    float _2690 = _2686;
    if (_2644)
    {
        float _2692 = _2674 * 6.283185482025146484375;
        float _2694 = cos(_2692);
        _2688 = _2694;
    }
    float _2696 = _2688;
    float _2698 = -_2630;
    float _2700 = -_2686;
    float _2702 = fma(_2612, _2698, _2700);
    float _2704 = _2702;
    if (_2644)
    {
        float _2706 = _2702 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2690 = _2706;
    }
    float _2708 = _2690;
    float _2710 = _2682;
    float _2712 = _2708;
    if (_2644)
    {
        float _2714 = fma(_2682, _2708, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2656 = _2714;
    }
    float _2716 = _2656;
    float _2718 = _2716;
    if (!_2644)
    {
        _2710 = _2634;
    }
    float _2720 = _2710;
    float _2722 = _2720;
    float _2724 = _2696;
    if (_2644)
    {
        float _2726 = _2696 + (-1.0);
        _2712 = _2726;
    }
    float _2728 = _2712;
    float _2730 = _2728;
    if (_2644)
    {
        float _2732 = _2664 * _2716;
        _2441 = _2732;
    }
    float _2734 = _2441;
    if (!_2644)
    {
        _2666 = _2632;
    }
    float _2736 = _2666;
    float _2738 = _2736;
    if (_2644)
    {
        float _2740 = _2728 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2730 = _2740;
    }
    float _2742 = _2730;
    if (_2644)
    {
        float _2744 = _2632 * _2734;
        _2738 = _2744;
    }
    float _2746 = _2738;
    if (!_2644)
    {
        _2718 = _2636;
    }
    float _2748 = _2718;
    float _2750 = _2748;
    if (_2644)
    {
        float _2752 = _2634 * _2734;
        _2722 = _2752;
    }
    float _2754 = _2722;
    if (_2644)
    {
        float _2756 = fma(_2702, _2696, _2742);
        _2704 = _2756;
    }
    float _2758 = _2704;
    if (_2644)
    {
        float _2760 = _2746 * _2746;
        _2750 = _2760;
    }
    float _2762 = _2750;
    if (!_2644)
    {
        _2724 = _2638;
    }
    float _2764 = _2724;
    float _2766 = _2764;
    if (_2644)
    {
        float _2768 = _2754 * _2754;
        _2766 = _2768;
    }
    float _2770 = _2766;
    float _2772 = sqrt(_2626);
    float _2774 = fma(_2758, _2758, _2762);
    float _2776 = _2774 + _2770;
    float _2778 = rsqrt(_2776);
    float _2780 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2782 = fma(_2772, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2780);
    float _2784 = precise::clamp(_2782, 0.0, 1.0);
    float _2786 = -_2784;
    float _2788 = _2786 + 1.0;
    float _2790 = _2778 * _2746;
    float _2792 = _2778 * _2758;
    float _2794 = _2778 * _2754;
    float _2796 = abs(_2788);
    float _2798 = log2(_2796);
    float _2800 = _2790 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2802 = -_2800;
    float _2804 = fma(_2792, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2802);
    float _2806 = -_2794;
    float _2808 = fma(_2806, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2804);
    float _2810 = fma(_2808, -0.5, 0.5);
    float _2812 = fma(_2808, 0.5, 0.5);
    float _2814 = _2792 + 1.0;
    float _2816 = _2798 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2818 = fma(_2812, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2820 = sqrt(_2810);
    float _2822 = fma(_2812, _2818, -0.212114393711090087890625);
    float _2824 = fma(_2812, _2822, 1.570728778839111328125);
    float _2826 = exp2(_2816);
    float _2828 = _2820 * 0.636619746685028076171875;
    float _2830 = -_2792;
    float _2832 = fma(_2826, _2814, _2830);
    float _2834 = -_2824;
    float _2836 = fma(_2828, _2834, 1.0);
    float _2838 = fma(_2832, 0.5, 0.5);
    float2 _7702 = float2(_2836, _2838);
    float3 _2842 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7702, float2(0.0), isnan(_7702)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7702, float2(0.0), isnan(_7702)), level(0.0)).xyz;
    float _2844 = _2842.x;
    float _2846 = _2842.y;
    float _2848 = _2842.z;
    float _2850 = abs(_1991);
    float _2852 = log2(_2850);
    float _2854 = _2798 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2856 = -_1911;
    float _2858 = _2856 + 1.0;
    bool _2860 = _1991 <= 8000.0;
    bool _2862 = isnan(_1991);
    bool _2864 = _2860 || _2862;
    bool _2866 = isnan(8000.0);
    bool _2868 = _2864 || _2866;
    float _2870 = float(_2868);
    float _2872 = exp2(_2854);
    float _2874 = _2852 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2876 = _2375 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2878 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2876);
    float _2880 = exp2(_2874);
    float _2882 = -_2872;
    float _2884 = _2882 + 1.0;
    float _2886 = fma(_2281, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2878);
    float _2888 = _2884 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2890 = fma(_2880, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2892 = precise::clamp(_2890, 0.0, 1.0);
    float _2894 = fma(_2892, -2.0, 3.0);
    float _2896 = _2892 * _2892;
    float _2898 = _2896 * _2894;
    float _2900 = fma(_2401, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2886);
    float _2902 = -_2898;
    float _2904 = _2902 + 1.0;
    float _2906 = _2900 + _2419;
    out.gl_Position.x = _2461;
    out.gl_Position.y = _2463;
    out.gl_Position.z = _2900;
    out.gl_Position.w = _2419;
    float _2908 = fma(_2904, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2898);
    float _2910 = _2906 * 0.5;
    float _2912 = _2870 * _2908;
    float _2914 = _2908;
    float _2916 = _2900;
    if (!_2415)
    {
        _2914 = 1.0;
    }
    float _2918 = _2914;
    out.m_87.z = _2910;
    out.m_87.w = _2419;
    float _2920 = _2918;
    if (_2415)
    {
        bool _2922 = _2521 >= _2505;
        bool _2924 = isnan(_2521);
        bool _2926 = _2922 || _2924;
        bool _2928 = isnan(_2505);
        bool _2930 = _2926 || _2928;
        float _2932 = float(_2930);
        _2920 = _2932;
    }
    float _2934 = _2920;
    float _2936 = _2912 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _2938 = _2772 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2940 = isnan(_2772);
    bool _2942 = _2938 || _2940;
    bool _2944 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2946 = _2942 || _2944;
    float _2948 = _2858 * _2936;
    float _2950 = precise::clamp(_2948, 0.0, 1.0);
    float _2952 = _2934 * _2608;
    float _2954 = _2888 * _2523;
    float _2956 = -_2888;
    float _2958 = _2956 + 1.0;
    float _2960 = -_2950;
    float _2962 = fma(_2960, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2964 = _2534 * _2954;
    float _2966 = _2534 * _2958;
    float _2968 = -_2952;
    float _2970 = fma(_2968, _2962, 1.0);
    float _2972 = precise::clamp(_2970, 0.0, 1.0);
    float _2974 = _2954;
    float _2976 = _2964;
    if (!_2946)
    {
        _2509 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2978 = _2509;
    float _2980 = _2972 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2982 = _2978;
    float _2984 = _2978;
    if (!_2946)
    {
        _2431 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2986 = _2431;
    float _2988 = _2986;
    float _2990 = _2986;
    if (!_2946)
    {
        _2916 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2992 = _2916;
    out.m_89.x = _2980;
    float _2994 = _2992;
    float _2996 = _2992;
    if (!_2946)
    {
        _2467 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2998 = _2467;
    float _3000 = _2848 * _2954;
    float _3002 = fma(_2844, _2964, _2528);
    float _3004 = fma(_2846, _2964, _2530);
    float _3006 = _2998;
    float _3008 = _2998;
    if (!_2946)
    {
        _2974 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3010 = _2974;
    float _3012 = fma(_2534, _3000, _2532);
    float _3014 = _3010;
    float _3016 = _3010;
    if (!_2946)
    {
        _2976 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3018 = _2976;
    out.m_91.x = _3002;
    out.m_91.y = _3004;
    out.m_91.z = _3012;
    out.m_91.w = _2966;
    bool _3020 = !_2946;
    float _3022 = _3018;
    float _3024 = _3018;
    if (!_3020)
    {
        bool _3026 = _2772 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3028 = isnan(_2772);
        bool _3030 = _3026 || _3028;
        bool _3032 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3034 = _3030 || _3032;
        if (!_3034)
        {
            float _3036 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3038 = _2772 + _3036;
            float _3040 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3042 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3040;
            float _3044 = 1.0 / _3042;
            float _3046 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3048 = _3046 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3050 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3052 = _3050 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3054 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3056 = _3054 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3058 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3060 = _3058 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3062 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3064 = _3062 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3066 = _3038 * _3044;
            float _3068 = precise::clamp(_3066, 0.0, 1.0);
            float _3070 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3072 = _3070 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3074 = fma(_3068, _3048, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3076 = fma(_3068, _3072, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3078 = fma(_3068, _3052, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3080 = fma(_3068, _3056, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3082 = fma(_3068, _3060, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3084 = fma(_3068, _3064, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3016 = _3076;
            _3008 = _3082;
            _2984 = _3074;
            _2996 = _3080;
            _2990 = _3078;
            _3024 = _3084;
            _3086 = true;
        }
        else
        {
            bool _3088 = _2772 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3090 = isnan(_2772);
            bool _3092 = _3088 || _3090;
            bool _3094 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3096 = _3092 || _3094;
            if (!_3096)
            {
                _2982 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3098 = _2982;
            _2984 = _3098;
            if (!_3096)
            {
                _3014 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3100 = _3014;
            _3016 = _3100;
            if (!_3096)
            {
                _2988 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3102 = _2988;
            _2990 = _3102;
            if (!_3096)
            {
                _2994 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3104 = _2994;
            _2996 = _3104;
            if (!_3096)
            {
                _3006 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3106 = _3006;
            _3008 = _3106;
            if (!_3096)
            {
                _3022 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3108 = _3022;
            bool _3110 = !_3096;
            _3024 = _3108;
            if (!_3110)
            {
                bool _3112 = _2772 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3114 = isnan(_2772);
                bool _3116 = _3112 || _3114;
                bool _3118 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3120 = _3116 || _3118;
                if (!_3120)
                {
                    float _3122 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3124 = _2772 + _3122;
                    float _3126 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3128 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3126;
                    float _3130 = 1.0 / _3128;
                    float _3132 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3134 = _3132 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3136 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3138 = _3136 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3140 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3142 = _3140 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3144 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3146 = _3144 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3148 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3150 = _3148 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3152 = _3124 * _3130;
                    float _3154 = precise::clamp(_3152, 0.0, 1.0);
                    float _3156 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3158 = _3156 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3160 = fma(_3154, _3134, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3162 = fma(_3154, _3158, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3164 = fma(_3154, _3138, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3166 = fma(_3154, _3142, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3168 = fma(_3154, _3146, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3170 = fma(_3154, _3150, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3016 = _3162;
                    _3008 = _3168;
                    _2984 = _3160;
                    _2996 = _3166;
                    _2990 = _3164;
                    _3024 = _3170;
                    _3086 = true;
                }
                else
                {
                    _3016 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3008 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2984 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2996 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2990 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3024 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3086 = false;
    float _3172 = _3016;
    float _3174 = _3008;
    float _3176 = _2984;
    float _3178 = _2996;
    float _3180 = _2990;
    float _3182 = _3024;
    float _3184 = fma(_1815, -0.5, 0.5);
    float _3186 = precise::clamp(_3184, 0.0, 1.0);
    float _3188 = -_3172;
    float _3190 = _3188 + _3174;
    float _3192 = -_3176;
    float _3194 = _3192 + _3178;
    float _3196 = -_3180;
    float _3198 = _3196 + _3182;
    bool _3200 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3202 = fma(_3186, _3190, _3172);
    float _3204 = fma(_3186, _3194, _3176);
    float _3206 = fma(_3186, _3198, _3180);
    float _3208 = _3202 * 0.586610972881317138671875;
    out.m_93.x = 0.0;
    float _3210 = fma(_3204, 0.298911988735198974609375, _3208);
    float _3212 = fma(_3206, 0.114477999508380889892578125, _3210);
    float _3214 = -_3212;
    float _3216 = _3204 + _3214;
    float _3218 = -_3212;
    float _3220 = _3202 + _3218;
    float _3222 = -_3212;
    float _3224 = _3206 + _3222;
    float _3226 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3228 = fma(_3216, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3212);
    float _3230 = fma(_3220, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3212);
    float _3232 = fma(_3224, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3212);
    out.m_61.x = _3226;
    out.m_95.x = _3228;
    out.m_95.y = _3230;
    out.m_95.z = _3232;
    if (!_3200)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3234 = -_2225;
    float _3236 = _3234 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3238 = -_2229;
    float _3240 = _3238 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3242 = -_2231;
    float _3244 = _3242 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3246 = _3236 * _3236;
    float _3248 = fma(_3240, _3240, _3246);
    float _3250 = fma(_3244, _3244, _3248);
    float _3252 = sqrt(_3250);
    float _3254 = rsqrt(_3250);
    float _3256 = -_3252;
    float _3258 = _3256 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3260 = _3258 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3262 = precise::clamp(_3260, 0.0, 1.0);
    float _3264 = _3240 * _3254;
    float _3266 = _3236 * _3254;
    float _3268 = abs(_3262);
    float _3270 = log2(_3268);
    float _3272 = _3244 * _3254;
    float _3274 = _3264 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3276 = _1815 * _3266;
    float _3278 = -_3266;
    float _3280 = -_3274;
    float _3282 = fma(_3278, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3280);
    float _3284 = fma(_1813, _3264, _3276);
    float _3286 = -_3272;
    float _3288 = fma(_3286, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3282);
    float _3290 = fma(_1817, _3272, _3284);
    float _3292 = precise::clamp(_3290, 0.0, 1.0);
    float _3294 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3296 = _3288 + _3294;
    float _3298 = _3270 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3300 = _3296 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3302 = precise::clamp(_3300, 0.0, 1.0);
    float _3304 = exp2(_3298);
    float _3306 = _3304 * _3302;
    float _3308 = _3292 * _3306;
    float _3310 = _3308 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3312 = _3308 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3314 = _3308 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _3310;
    out.m_93.y = _3312;
    out.m_93.z = _3314;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

