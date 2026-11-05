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
    float4 m_84 [[user(locn1)]];
    float4 m_90 [[user(locn2)]];
    float4 m_98 [[user(locn3)]];
    float4 m_106 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_88 [[user(locn7)]];
    float4 m_94 [[user(locn8)]];
    float4 m_96 [[user(locn9)]];
    float4 m_86 [[user(locn10)]];
    float4 m_104 [[user(locn11)]];
    float4 m_92 [[user(locn12)]];
    float4 m_100 [[user(locn13)]];
    float4 m_102 [[user(locn14)]];
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
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4019 = false;
    bool _2788 = false;
    bool _221 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _120 = in.m_60.w;
    float _122 = trunc(_120);
    int _125 = int(_122);
    bool _129 = _125 >= 1;
    float _131 = 0.0;
    if (!_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    float _135 = _133;
    if (!_129)
    {
        out.m_63.x = 0.0;
    }
    int _137 = 0;
    if (!_129)
    {
        float _139 = _133 * 5.0;
        _137 = as_type<int>(_139);
    }
    int _141 = _137;
    int _143 = _141;
    if (!_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4304 = as_type<float>(_141);
        out.gl_Position.z = _4304;
    }
    if (!_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = in.m_65.w;
    bool _147 = _145 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _149 = isnan(_145);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _155 = _151 || _153;
    float _157 = -_145;
    float _159 = _157 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _161 = _159;
    if (_155)
    {
        float _163 = float(_125);
        _135 = _163;
    }
    float _165 = _135;
    bool _167 = _159 >= _165;
    bool _169 = !_155;
    bool _171 = _167 || _169;
    float _173 = _165;
    if (_171)
    {
        _173 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _175 = _173;
    if (_171)
    {
        out.m_63.x = 0.0;
    }
    if (_171)
    {
        float _177 = _175 * 5.0;
        _143 = as_type<int>(_177);
    }
    int _179 = _143;
    if (_171)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4374 = as_type<float>(_179);
        out.gl_Position.z = _4374;
    }
    if (_171)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _181 = as_type<float>(int(gl_VertexIndex));
    bool _183 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _185 = as_type<int>(_181) & 1;
    bool _187 = _185 != 0;
    int _189 = as_type<int>(_181) & 2;
    bool _191 = _189 != 0;
    bool _193 = !_187;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_191;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_183;
    float _219;
    if (!_201)
    {
        float _203 = in.m_70.x;
        float _205 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _207 = _203 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _209 = fma(_207, (*spvDescriptorSet0.vp_c9)._m0[12].x, _159);
        float _211 = _209 * _205;
        float _213 = floor(_211);
        float _215 = -_213;
        float _217 = _211 + _215;
        _219 = _217;
        _221 = true;
    }
    else
    {
        float _223 = float(_125);
        float _225 = 1.0 / _223;
        float _227 = _159 * _225;
        _219 = _227;
    }
    _221 = false;
    float _229 = _219;
    float _231 = in.m_70.x;
    float _233 = in.m_70.y;
    float _235 = in.m_70.z;
    float _237 = in.m_70.w;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _241 = _229 + _239;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _245 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _243;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _249 = _247 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _251;
    float _255 = 1.0 / _245;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _259 = _257 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    int _261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _263 = _261 != 0;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _267 = 1.0 / _249;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _271;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _277 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _275;
    float _279 = _233 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _281 = _231 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _283 = 1.0 / _253;
    float _285 = _231 * 2.0;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _289 = _229 + _287;
    float _291 = -_269;
    float _293 = fma(_281, 2.0, _291);
    float _295 = _233 * 2.0;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _299 = _297 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _301 = floor(_285);
    float _303 = fma(_279, -2.0, _265);
    float _305 = _235 * 2.0;
    float _307 = _289 * _255;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _311 = _229 + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _313;
    float _317 = fma(_273, _307, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _319 = floor(_305);
    float _321 = _311 * _267;
    float _323 = _231 + _233;
    float _325 = fma(_277, _307, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _331 = _323 + (-1.0);
    float _333 = _235 + _233;
    float _335 = floor(_295);
    bool _337 = _301 > 0.0;
    float _339 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _341 = _333 + (-1.0);
    bool _343 = _301 >= 0.0;
    bool _345 = isnan(_301);
    bool _347 = _343 || _345;
    bool _349 = isnan(0.0);
    bool _351 = _347 || _349;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _355 = float(_125);
    float _357 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _359 = 1.0 / _259;
    bool _361 = _319 > 0.0;
    float _363 = fma(_299, _321, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _365 = as_type<int>(_341);
    if (_263)
    {
        _365 = 0;
    }
    int _367 = _365;
    float _369 = fma(_329, _321, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _371 = _319 >= 0.0;
    bool _373 = isnan(_319);
    bool _375 = _371 || _373;
    bool _377 = isnan(0.0);
    bool _379 = _375 || _377;
    int _381 = _367;
    if (!_263)
    {
        _381 = 1;
    }
    int _383 = _381;
    float _385 = 1.0 / _355;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _389 = _229 + _387;
    bool _391 = _335 > 0.0;
    bool _393 = _335 >= 0.0;
    bool _395 = isnan(_335);
    bool _397 = _393 || _395;
    bool _399 = isnan(0.0);
    bool _401 = _397 || _399;
    float _403 = _389 * _283;
    float _405 = _235 + _231;
    int _407 = _351 ? 0 : 1;
    float _409 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _411 = int(_409);
    bool _413 = _383 != 1;
    float _415 = _405 + (-1.0);
    int _417 = _379 ? 0 : 1;
    float _419 = fma(_315, _403, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _421 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _423 = _401 ? 0 : 1;
    float _425 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _427 = int(_425);
    int _429 = ~_407;
    int _431 = _429 + 1;
    int _433 = _431 + 1;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _435;
    int _439 = _433;
    float _441 = as_type<float>(_383);
    if (!_337)
    {
        int _443 = ~_407;
        int _445 = _443 + 1;
        _439 = _445;
    }
    int _447 = _439;
    float _449 = _241 * _359;
    int _451 = ~_417;
    int _453 = _451 + 1;
    int _455 = _453 + 1;
    float _457 = fma(_437, _403, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    int _459 = _455;
    if (!_361)
    {
        int _461 = ~_417;
        int _463 = _461 + 1;
        _459 = _463;
    }
    int _465 = _459;
    float _467 = _385 * _159;
    int _469 = ~_423;
    int _471 = _469 + 1;
    int _473 = _471 + 1;
    int _475 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _477 = _475 != 0;
    int _479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _481 = _479 != 0;
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _485 = _483 != 0;
    int _487 = _473;
    if (!_391)
    {
        int _489 = ~_423;
        int _491 = _489 + 1;
        _487 = _491;
    }
    int _493 = _487;
    float _495 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _497 = log2(_495);
    bool _499 = !_481;
    int _501 = _499 ? 0 : 1;
    bool _503 = !_477;
    int _505 = _503 ? 0 : 1;
    bool _507 = !_485;
    int _509 = _507 ? 0 : 1;
    int _511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _513 = _511 != 0;
    int _515 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _517 = _515 != 0;
    int _519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _521 = _519 != 0;
    float _523 = float(_427);
    float _525 = as_type<float>(_427);
    if (!_413)
    {
        _525 = _233;
    }
    float _527 = _525;
    float _529 = _527;
    if (_413)
    {
        _529 = _231;
    }
    float _531 = _529;
    float _533 = 1.0 / _523;
    bool _535 = !_513;
    float _537 = _535 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _539 = _531 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _541 = _537;
    if (!_413)
    {
        _441 = _233;
    }
    float _543 = _441;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _547 = _543;
    if (_413)
    {
        _547 = _231;
    }
    float _549 = _547;
    float _551 = -_353;
    float _553 = fma(_539, 2.0, _551);
    float _555 = _497 * _159;
    int _557 = abs(as_type<int>(_537));
    float _559 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[83].z, _545);
    float _561 = _549;
    if (!_413)
    {
        _541 = _235;
    }
    float _563 = _541;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _567 = _563;
    if (_413)
    {
        _567 = _233;
    }
    float _569 = _567;
    float _571 = exp2(_555);
    if (!_413)
    {
        _561 = _235;
    }
    float _573 = _561;
    float _575 = _533 * _159;
    float _577 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[83].w, _565);
    float _579 = _573;
    if (_413)
    {
        _579 = _233;
    }
    float _581 = _579;
    float _583 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[82].z, _559);
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _587 = float(_411);
    float _589 = _581 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _591 = float(_557);
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _595 = 1.0 + _593;
    float _597 = 1.0 / _587;
    float _599 = fma(_589, -2.0, _585);
    float _601 = float(_465);
    float _603 = -_159;
    float _605 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[76].x, _293);
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _609 = 1.0 / _595;
    float _611 = _591 * _601;
    bool _613 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _615 = isnan(1.0);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _621 = _617 || _619;
    float _623 = in.m_72.x;
    float _625 = in.m_72.y;
    float _627 = in.m_72.z;
    float _629 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[78].z, _607);
    float _631 = -_571;
    float _633 = _631 + 1.0;
    bool _635 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _637 = isnan(0.0);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _643 = _639 || _641;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _647 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _649 = isnan(_229);
    bool _651 = _647 || _649;
    bool _653 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _655 = _651 || _653;
    float _657 = float(_655);
    float _659 = _597 * _159;
    float _661 = _643 ? _633 : 0.0;
    float _663 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[78].w, _645);
    bool _665 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _667 = isnan(_229);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[76].y, _303);
    float _679 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[82].w, _577);
    float _681 = -_657;
    float _683 = _681 + 1.0;
    float _685 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[77].z, _629);
    float _687 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[77].w, _663);
    float _689 = -_159;
    float _691 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[81].x, _553);
    float _693 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[81].y, _599);
    if (_621)
    {
        float _695 = _661 * _609;
        _161 = _695;
    }
    float _697 = _161;
    float _699 = _611 * (-2.0);
    bool _701 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _703 = isnan(_229);
    bool _705 = _701 || _703;
    bool _707 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _709 = _705 || _707;
    float _711 = float(_709);
    float _713 = -_675;
    float _715 = _713 + 1.0;
    float _717 = _675 * _683;
    float _719 = fma(_339, _699, _339);
    bool _721 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _723 = isnan(_229);
    bool _725 = _721 || _723;
    bool _727 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _729 = _725 || _727;
    float _731 = float(_729);
    float _733 = _711 * _715;
    bool _735 = !_517;
    int _737 = _735 ? 0 : 1;
    float _739 = -_711;
    float _741 = _739 + 1.0;
    bool _743 = !_521;
    int _745 = _743 ? 0 : 1;
    float _747 = fma(_699, _623, _623);
    int _749 = abs(_737);
    bool _751 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _753 = isnan(_229);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _759 = _755 || _757;
    float _761 = float(_759);
    float _763 = _731 * _741;
    int _765 = abs(_745);
    float _767 = _231 + (-0.5);
    float _769 = float(_447);
    float _771 = -_731;
    float _773 = _771 + 1.0;
    float _775 = float(_749);
    float _777 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[196].x, _747);
    float _779 = float(_493);
    float _781 = _761 * _773;
    float _783 = -_761;
    float _785 = _783 + 1.0;
    float _787 = _775 * _769;
    float _789 = fma(_719, _697, _777);
    float _791 = _325 * _781;
    float _793 = _317 * _781;
    float _795 = _787 * (-2.0);
    float _797 = float(_765);
    float _799 = _233 + (-0.5);
    float _801 = fma(_785, (*spvDescriptorSet0.vp_c9)._m0[143].y, _791);
    float _803 = fma(_795, _625, _625);
    float _805 = fma(_357, _795, _357);
    float _807 = _797 * _779;
    float _809 = fma(_369, _763, _801);
    float _811 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[196].y, _803);
    float _813 = fma(_785, (*spvDescriptorSet0.vp_c9)._m0[143].x, _793);
    float _815 = _807 * (-2.0);
    float _817 = in.m_74.x;
    float _819 = in.m_74.y;
    float _821 = fma(_805, _697, _811);
    float _823 = _789 * 0.15915493667125701904296875;
    float _825 = fma(_815, _627, _627);
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _829 = _827 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _831 = _821 * 0.15915493667125701904296875;
    float _833 = _235 + (-0.5);
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _837 = _835 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _839 = fma(_363, _763, _813);
    float _841 = fma(_421, _815, _421);
    float _843 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[196].z, _825);
    float _845 = in.m_60.x;
    float _847 = in.m_60.y;
    float _849 = in.m_60.z;
    float _851 = fma(_829, _449, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _853 = fma(_837, _449, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _855 = fma(_457, _733, _809);
    float _857 = in.m_76.x;
    float _859 = in.m_76.y;
    float _861 = in.m_76.z;
    float _863 = fma(_419, _733, _839);
    float _865 = fma(_841, _697, _843);
    float _867 = fma(_853, _717, _855);
    float _869 = _823 * 6.283185482025146484375;
    float _871 = cos(_869);
    float _873 = fma(_851, _717, _863);
    float _875 = _865 * 0.15915493667125701904296875;
    float _877 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[147].y, _867);
    float _879 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[147].x, _873);
    float _881 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _883 = _877 * _819;
    float _885 = _831 * 6.283185482025146484375;
    float _887 = sin(_885);
    float _889 = _879 * _817;
    float _891 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _893 = _883 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _895 = _889 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _897 = in.m_78.x;
    float _899 = in.m_78.y;
    float _901 = in.m_78.z;
    float _903 = _831 * 6.283185482025146484375;
    float _905 = cos(_903);
    float _907 = _895 * _881;
    float _909 = _893 * _891;
    float _911 = _847 * _859;
    float _913 = _823 * 6.283185482025146484375;
    float _915 = sin(_913);
    float _917 = fma(_845, _857, _911);
    float _919 = _871 * _887;
    float _921 = fma(_849, _861, _917);
    float _923 = _875 * 6.283185482025146484375;
    float _925 = cos(_923);
    float _927 = _871 * _905;
    float _929 = _875 * 6.283185482025146484375;
    float _931 = sin(_929);
    float _933 = _915 * _887;
    float _935 = _915 * _905;
    float _937 = _871 * _925;
    float _939 = _915 * _925;
    float _941 = _905 * _925;
    float _943 = _887 * _925;
    float _945 = _937 * _909;
    float _947 = _939 * _909;
    float _949 = fma(_931, _927, _933);
    float _951 = -_919;
    float _953 = fma(_931, _935, _951);
    float _955 = -_935;
    float _957 = fma(_931, _919, _955);
    float _959 = -_909;
    float _961 = _931 * _959;
    float _963 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _965 = fma(_949, _907, _945);
    float _967 = fma(_931, _933, _927);
    float _969 = fma(_941, _907, _961);
    float _971 = _847 * _899;
    float _973 = fma(_957, _963, _965);
    float _975 = fma(_953, _907, _947);
    float _977 = fma(_943, _963, _969);
    float _979 = fma(_845, _897, _971);
    float _981 = _973 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _983 = _973 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _985 = fma(_967, _963, _975);
    float _987 = fma(_849, _901, _979);
    float _989 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[24].x, _981);
    float _991 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[26].x, _983);
    float _993 = _921 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _995 = _987 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _997 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[24].z, _989);
    float _999 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[26].z, _991);
    float _1001 = _997 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1003 = _999 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1005 = _993 + _1001;
    float _1007 = _995 + _1003;
    float _1009 = in.m_80.x;
    float _1011 = in.m_80.y;
    float _1013 = in.m_80.z;
    float _1015 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1017 = _1005 + _1015;
    float _1019 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1021 = _1007 + _1019;
    float _1023 = _1017 * _1017;
    float _1025 = _1021 * _1021;
    float _1027 = _1023 + _1025;
    float _1029 = sqrt(_1027);
    float _1031 = _847 * _1011;
    float _1033 = fma(_845, _1009, _1031);
    bool _1035 = _1029 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1037 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1039 = _1029 + _1037;
    float _1041 = fma(_849, _1013, _1033);
    float _1043 = _947;
    float _1045 = _1027;
    float _1047 = _1039;
    float _1049 = _973;
    float _1051 = _847;
    float _1053 = _1005;
    float _1055 = _1007;
    float _1057 = _1023;
    float _1059 = _1025;
    if (_1035)
    {
        float _1061 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1043 = _1061;
    }
    float _1063 = _1043;
    if (_1035)
    {
        float _1065 = rsqrt(_1027);
        _1045 = _1065;
    }
    float _1067 = _1045;
    float _1069 = _1067;
    if (_1035)
    {
        float _1071 = _1039 * _1063;
        _1047 = _1071;
    }
    float _1073 = _1047;
    float _1075 = _973 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (_1035)
    {
        float _1077 = _1073 * 0.15915493667125701904296875;
        _1049 = _1077;
    }
    float _1079 = _1049;
    float _1081 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1075);
    float _1083 = _1041 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1085 = _845;
    if (_1035)
    {
        float _1087 = _1079 * 6.283185482025146484375;
        float _1089 = sin(_1087);
        _1085 = _1089;
    }
    float _1091 = _1085;
    float _1093 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1081);
    float _1095 = _1093 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1097 = _1083 + _1095;
    float _1099 = _1097;
    if (_1035)
    {
        float _1101 = _1097 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1051 = _1101;
    }
    float _1103 = _1051;
    float _1105 = _1091;
    if (_1035)
    {
        float _1107 = fma(_1091, _1103, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1105 = _1107;
    }
    float _1109 = _1105;
    float _1111 = _1109;
    if (_1035)
    {
        float _1113 = _1067 * _1109;
        _1111 = _1113;
    }
    float _1115 = _1111;
    if (_1035)
    {
        float _1117 = fma(_1017, _1115, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1053 = _1117;
    }
    float _1119 = _1053;
    if (_1035)
    {
        float _1121 = fma(_1021, _1115, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1055 = _1121;
    }
    float _1123 = _1055;
    float _1125 = fma(_1119, 6.2500002968590706586837768554688e-05, 0.5);
    float _1127 = fma(_1123, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5842 = float2(_1125, _1127);
    float3 _1131 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5842, float2(0.0), isnan(_5842)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5842, float2(0.0), isnan(_5842)), level(0.0)).xyz;
    float _1133 = _1131.x;
    float _1135 = _1131.y;
    float _1137 = _1131.z;
    float _1139 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1141 = int(_1139);
    if (_263)
    {
        float _1143 = in.m_70.x;
        _1069 = _1143;
    }
    float _1145 = _1069;
    float _1147 = -_583;
    float _1149 = _1147 + 1.0;
    float _1151 = -_685;
    float _1153 = _1151 + 1.0;
    float _1155 = _1145;
    if (!_263)
    {
        float _1157 = in.m_70.y;
        _1155 = _1157;
    }
    float _1159 = _1155;
    float _1161 = -_687;
    float _1163 = _1161 + 1.0;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1167 = trunc(_575);
    int _1169 = int(_1167);
    float _1171 = -_679;
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
    float _1195 = trunc(_659);
    int _1197 = int(_1195);
    int _1199 = ~_1179;
    int _1201 = _1199 + 1;
    bool _1203 = _1179 == 0;
    int _1205 = as_type<int>(_1191) + (-2);
    float _1207 = 1.0 / _1193;
    float _1209 = _1191;
    if (_263)
    {
        _1209 = 1.0;
    }
    float _1211 = _1209;
    float _1213 = _1211;
    if (!_263)
    {
        _1213 = 7.345489978790283203125;
    }
    float _1215 = _1213;
    float _1217 = as_type<float>(_1205) * _1189;
    float _1219 = trunc(_1217);
    float _1221 = precise::max(_1219, 0.0);
    uint _1224 = uint(_1221);
    float _1226 = _1215 * _231;
    int _1228 = as_type<int>(_1207) + (-2);
    float _1230 = float(uint(_1197));
    int _1232 = _1183 * int(_1224);
    int _1234 = _1232 + _1169;
    float _1236 = as_type<float>(_1228) * _1230;
    float _1238 = float(_1169);
    float _1240 = float(uint(_1234));
    float _1242 = floor(_1226);
    bool _1244 = _1238 >= _1185;
    bool _1246 = isnan(_1238);
    bool _1248 = _1244 || _1246;
    bool _1250 = isnan(_1185);
    bool _1252 = _1248 || _1250;
    float _1254 = float(_1252);
    float _1256 = as_type<float>(_1205) * _1240;
    float _1258 = trunc(_1236);
    float _1260 = precise::max(_1258, 0.0);
    uint _1262 = uint(_1260);
    float _1264 = trunc(_1256);
    float _1266 = precise::max(_1264, 0.0);
    uint _1268 = uint(_1266);
    float _1270 = -_1242;
    float _1272 = _1226 + _1270;
    int _1274 = ~_1141;
    int _1276 = _1274 + 1;
    float _1278 = _1272 * _1185;
    int _1280 = _1201 * int(_1262);
    int _1282 = _1280 + _1197;
    float _1284 = trunc(_1254);
    int _1286 = int(_1284);
    float _1288 = float(uint(_1282));
    int _1290 = int(_1224) + int(_1268);
    float _1292 = as_type<float>(_1228) * _1288;
    float _1294 = trunc(_1278);
    int _1296 = int(_1294);
    int _1298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1300 = _1298 != 0;
    float _1302 = as_type<float>(_1276);
    if (_263)
    {
        _1302 = 1.0;
    }
    float _1304 = _1302;
    int _1306 = _1276 * _1290;
    int _1308 = _1306 + _1169;
    float _1310 = _1304;
    if (!_263)
    {
        _1310 = 1.2345600128173828125;
    }
    float _1312 = _1310;
    bool _1314 = !_1300;
    int _1316 = _1314 ? 0 : 1;
    bool _1318 = uint(_1308) >= uint(_1141);
    float _1320 = _1312 * _1159;
    float _1322 = trunc(_1292);
    float _1324 = precise::max(_1322, 0.0);
    uint _1326 = uint(_1324);
    int _1328 = abs(_1316);
    bool _1330 = !_1318;
    int _1332 = _1330 ? 0 : (-1);
    int _1334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1336 = _1334 != 0;
    int _1338 = ~_1290;
    int _1340 = _1338 + _1332;
    int _1342 = _1340 + 1;
    float _1344 = _1185 * _467;
    int _1346 = ~_1179;
    int _1348 = _1346 + 1;
    int _1350 = abs(_505);
    int _1352 = _1141 * _1342;
    int _1354 = _1352 + _1169;
    float _1356 = trunc(_1344);
    int _1358 = int(_1356);
    int _1360 = ~_1286;
    int _1362 = _1360 + 1;
    int _1364 = _1362 + 1;
    bool _1366 = !_1187;
    int _1368 = _1366 ? _1354 : (-1);
    int _1370 = _1296 * _1328;
    int _1372 = _1370 + _1169;
    int _1374 = int(_1262) + int(_1326);
    int _1376 = _1141 + (-1);
    int _1378 = _1368 * _1364;
    int _1380 = abs(_501);
    int _1382 = _1348 * _1374;
    int _1384 = _1382 + _1197;
    float _1386 = floor(_1320);
    int _1388 = _1286 * _1376;
    int _1390 = _1388 + _1378;
    float _1392 = float(_1179);
    float _1394 = float(_1197);
    bool _1396 = uint(_1384) >= uint(_1179);
    int _1398 = _1390 * _1380;
    bool _1400 = _1394 >= _1392;
    bool _1402 = isnan(_1394);
    bool _1404 = _1400 || _1402;
    bool _1406 = isnan(_1392);
    bool _1408 = _1404 || _1406;
    float _1410 = float(_1408);
    int _1412 = abs(_509);
    bool _1414 = !_1396;
    int _1416 = _1414 ? 0 : (-1);
    float _1418 = trunc(_1410);
    int _1420 = int(_1418);
    float _1422 = -_1386;
    float _1424 = _1320 + _1422;
    int _1426 = ~_1374;
    int _1428 = _1426 + _1416;
    int _1430 = _1428 + 1;
    bool _1432 = !_1336;
    int _1434 = _1432 ? 0 : 1;
    int _1436 = _1358 * _1350;
    int _1438 = _1436 + _1398;
    float _1440 = _1424 * _1392;
    int _1442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1444 = _1442 != 0;
    int _1446 = _1179 * _1430;
    int _1448 = _1446 + _1197;
    int _1450 = abs(_1434);
    int _1452 = _1372 * _1412;
    int _1454 = _1452 + _1438;
    bool _1456 = !_1444;
    int _1458 = _1456 ? 0 : 1;
    float _1460 = trunc(_1440);
    int _1462 = int(_1460);
    int _1464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1466 = _1464 != 0;
    int _1468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1470 = _1468 != 0;
    int _1472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1474 = _1472 != 0;
    int _1476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1478 = _1476 != 0;
    float _1480 = _1392 * _467;
    int _1482 = _1296 * _1450;
    int _1484 = _1482 + _1454;
    int _1486 = ~_1420;
    int _1488 = _1486 + 1;
    int _1490 = _1488 + 1;
    bool _1492 = !_1203;
    int _1494 = _1492 ? _1448 : (-1);
    float _1496 = trunc(_1480);
    int _1498 = int(_1496);
    bool _1500 = !_1470;
    int _1502 = _1500 ? 0 : 1;
    float _1504 = float(uint(_1484));
    int _1506 = _1494 * _1490;
    int _1508 = abs(_1458);
    int _1510 = _1179 + (-1);
    float _1512 = as_type<float>(_1205) * _1504;
    bool _1514 = !_1466;
    int _1516 = _1514 ? 0 : 1;
    int _1518 = abs(_1502);
    int _1520 = _1420 * _1510;
    int _1522 = _1520 + _1506;
    int _1524 = abs(_1516);
    float _1526 = trunc(_1512);
    float _1528 = precise::max(_1526, 0.0);
    uint _1530 = uint(_1528);
    int _1532 = _1462 * _1508;
    int _1534 = _1532 + _1197;
    bool _1536 = !_1474;
    int _1538 = _1536 ? 0 : 1;
    int _1540 = _1522 * _1518;
    int _1542 = ~_1141;
    int _1544 = _1542 + 1;
    float _1546 = float(uint(_1372));
    int _1548 = _1498 * _1524;
    int _1550 = _1548 + _1540;
    bool _1552 = !_1478;
    int _1554 = _1552 ? 0 : 1;
    int _1556 = abs(_1538);
    float _1558 = as_type<float>(_1205) * _1546;
    int _1560 = abs(_1554);
    int _1562 = _1534 * _1556;
    int _1564 = _1562 + _1550;
    float _1566 = trunc(_1558);
    float _1568 = precise::max(_1566, 0.0);
    uint _1570 = uint(_1568);
    int _1572 = _1544 * int(_1530);
    int _1574 = _1572 + _1484;
    float _1576 = float(uint(_1534));
    int _1578 = _1462 * _1560;
    int _1580 = _1578 + _1564;
    int _1582 = ~_1179;
    int _1584 = _1582 + 1;
    float _1586 = float(uint(_1574));
    float _1588 = as_type<float>(_1228) * _1576;
    float _1590 = float(uint(_1580));
    int _1592 = ~_1141;
    int _1594 = _1592 + 1;
    float _1596 = trunc(_1588);
    float _1598 = precise::max(_1596, 0.0);
    uint _1600 = uint(_1598);
    float _1602 = as_type<float>(_1205) * _1586;
    float _1604 = as_type<float>(_1228) * _1590;
    int _1606 = _1594 * int(_1570);
    int _1608 = _1606 + _1372;
    float _1610 = trunc(_1602);
    float _1612 = precise::max(_1610, 0.0);
    uint _1614 = uint(_1612);
    int _1616 = ~_1179;
    int _1618 = _1616 + 1;
    float _1620 = float(uint(_1608));
    float _1622 = trunc(_1604);
    float _1624 = precise::max(_1622, 0.0);
    uint _1626 = uint(_1624);
    int _1628 = _1584 * int(_1600);
    int _1630 = _1628 + _1534;
    float _1632 = as_type<float>(_1205) * _1620;
    int _1634 = ~_1141;
    int _1636 = _1634 + 1;
    float _1638 = float(uint(_1630));
    float _1640 = trunc(_1632);
    float _1642 = precise::max(_1640, 0.0);
    uint _1644 = uint(_1642);
    int _1646 = int(_1530) + int(_1614);
    float _1648 = as_type<float>(_1228) * _1638;
    int _1650 = _1618 * int(_1626);
    int _1652 = _1650 + _1580;
    float _1654 = trunc(_1648);
    float _1656 = precise::max(_1654, 0.0);
    uint _1658 = uint(_1656);
    int _1660 = _1636 * _1646;
    int _1662 = _1660 + _1484;
    float _1664 = float(uint(_1652));
    bool _1666 = uint(_1662) >= uint(_1141);
    int _1668 = int(_1570) + int(_1644);
    float _1670 = as_type<float>(_1228) * _1664;
    bool _1672 = !_1666;
    int _1674 = _1672 ? 0 : (-1);
    int _1676 = ~_1179;
    int _1678 = _1676 + 1;
    float _1680 = trunc(_1670);
    float _1682 = precise::max(_1680, 0.0);
    uint _1684 = uint(_1682);
    int _1686 = ~_1646;
    int _1688 = _1686 + _1674;
    int _1690 = _1688 + 1;
    int _1692 = int(_1600) + int(_1658);
    int _1694 = _1141 * _1690;
    int _1696 = _1694 + _1484;
    int _1698 = ~_1141;
    int _1700 = _1698 + 1;
    int _1702 = _1678 * _1692;
    int _1704 = _1702 + _1534;
    int _1706 = ~_1179;
    int _1708 = _1706 + 1;
    bool _1710 = !_1187;
    int _1712 = _1710 ? _1696 : (-1);
    int _1714 = _1700 * _1668;
    int _1716 = _1714 + _1372;
    int _1718 = _1712 & 3;
    bool _1720 = _1718 != 0;
    int _1722 = int(_1626) + int(_1684);
    int _1724 = _1712 & 3;
    bool _1726 = _1724 != 0;
    bool _1728 = uint(_1718) >= 2u;
    int _1730 = _1708 * _1722;
    int _1732 = _1730 + _1580;
    int _1734 = _1726 ? 0 : 1;
    bool _1736 = uint(_1716) >= uint(_1141);
    int _1738 = _1728 ? 0 : 1;
    bool _1740 = uint(_1732) >= uint(_1179);
    bool _1742 = uint(_1718) > 1u;
    bool _1744 = !_1736;
    int _1746 = _1744 ? 0 : (-1);
    bool _1748 = !_1740;
    int _1750 = _1748 ? 0 : (-1);
    int _1752 = ~_1668;
    int _1754 = _1752 + _1746;
    int _1756 = _1754 + 1;
    int _1758 = ~_1722;
    int _1760 = _1758 + _1750;
    int _1762 = _1760 + 1;
    bool _1764 = _237 > 0.5;
    int _1766 = _1141 * _1756;
    int _1768 = _1766 + _1372;
    int _1770 = ~_1734;
    int _1772 = _1770 + 1;
    int _1774 = _1772 + 1;
    int _1776 = _1179 * _1762;
    int _1778 = _1776 + _1580;
    int _1780 = _1774;
    if (!_1742)
    {
        int _1782 = ~_1734;
        int _1784 = _1782 + 1;
        _1780 = _1784;
    }
    int _1786 = _1780;
    float _1788 = -_199;
    int _1790 = _1764 ? as_type<int>(_1788) : as_type<int>(_199);
    int _1792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1794 = _1792 != 0;
    bool _1796 = !_1203;
    int _1798 = _1796 ? _1778 : (-1);
    bool _1800 = _1718 != 3;
    bool _1802 = !_1187;
    int _1804 = _1802 ? _1768 : (-1);
    int _1806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1808 = _1806 != 0;
    bool _1810 = !_1794;
    int _1812 = _1810 ? 0 : 1;
    int _1814 = _1712 >> 31;
    int _1816 = _1798 & 3;
    bool _1818 = _1816 != 0;
    int _1820 = _1798 >> 31;
    bool _1822 = !_1808;
    int _1824 = _1822 ? 0 : 1;
    int _1826 = _1814 & 3;
    bool _1828 = uint(_1704) >= uint(_1179);
    int _1830 = _1798 & 3;
    bool _1832 = _1830 != 0;
    bool _1834 = !_1818;
    float _1836 = _1834 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _1838 = _1820 & 3;
    bool _1840 = uint(_1816) > 1u;
    int _1842 = _1712 + _1826;
    bool _1844 = !_1828;
    int _1846 = _1844 ? 0 : (-1);
    int _1848 = _1832 ? 0 : 1;
    int _1850 = _1798 + _1838;
    int _1852 = ~_1738;
    int _1854 = _1852 + 1;
    int _1856 = _1854 + 1;
    bool _1858 = _1718 != 3;
    int _1860 = _1856;
    float _1862 = _1836;
    if (_1800)
    {
        int _1864 = ~_1738;
        int _1866 = _1864 + 1;
        _1860 = _1866;
    }
    int _1868 = _1860;
    bool _1870 = !_1720;
    int _1872 = _1870 ? 0 : 1;
    int _1874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1876 = _1874 != 0;
    int _1878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1880 = _1878 != 0;
    int _1882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1884 = _1882 != 0;
    int _1886 = _1842 >> 2;
    int _1888 = ~_1692;
    int _1890 = _1888 + _1846;
    int _1892 = _1890 + 1;
    int _1894 = _1850 >> 2;
    bool _1896 = !_1858;
    int _1898 = _1896 ? 0 : (-1);
    int _1900 = _1179 * _1892;
    int _1902 = _1900 + _1534;
    bool _1904 = uint(_1816) >= 2u;
    int _1906 = _1886 << 4;
    int _1908 = _1906 + 368;
    int _1910 = _1894 << 4;
    int _1912 = _1910 + 512;
    int _1914 = ~_1848;
    int _1916 = _1914 + 1;
    int _1918 = _1916 + 1;
    uint _1920 = uint(int(uint(_1908) >> uint(2)));
    uint _1922 = uint(int(uint(int(_1920)) >> uint(2)));
    int _1924 = int(_1920) & 3;
    float _1926 = (*spvDescriptorSet0.vp_c9)._m0[int(_1922)][_1924];
    int _1928 = int(_1920) + 1;
    uint _1930 = uint(int(uint(_1928) >> uint(2)));
    int _1932 = _1928 & 3;
    float _1934 = (*spvDescriptorSet0.vp_c9)._m0[int(_1930)][_1932];
    int _1936 = _1918;
    if (!_1840)
    {
        int _1938 = ~_1848;
        int _1940 = _1938 + 1;
        _1936 = _1940;
    }
    int _1942 = _1936;
    int _1944 = _1904 ? 0 : 1;
    bool _1946 = _1816 != 3;
    bool _1948 = _1816 != 3;
    int _1950 = _1908 + 8;
    uint _1952 = uint(int(uint(_1950) >> uint(2)));
    uint _1954 = uint(int(uint(int(_1952)) >> uint(2)));
    int _1956 = int(_1952) & 3;
    float _1958 = (*spvDescriptorSet0.vp_c9)._m0[int(_1954)][_1956];
    int _1960 = int(_1952) + 1;
    uint _1962 = uint(int(uint(_1960) >> uint(2)));
    int _1964 = _1960 & 3;
    float _1966 = (*spvDescriptorSet0.vp_c9)._m0[int(_1962)][_1964];
    int _1968 = ~_1944;
    int _1970 = _1968 + 1;
    int _1972 = _1970 + 1;
    bool _1974 = !_1203;
    int _1976 = _1974 ? _1902 : (-1);
    uint _1978 = uint(int(uint(_1912) >> uint(2)));
    uint _1980 = uint(int(uint(int(_1978)) >> uint(2)));
    int _1982 = int(_1978) & 3;
    float _1984 = (*spvDescriptorSet0.vp_c9)._m0[int(_1980)][_1982];
    int _1986 = int(_1978) + 1;
    uint _1988 = uint(int(uint(_1986) >> uint(2)));
    int _1990 = _1986 & 3;
    float _1992 = (*spvDescriptorSet0.vp_c9)._m0[int(_1988)][_1990];
    int _1994 = _1972;
    if (_1946)
    {
        int _1996 = ~_1944;
        int _1998 = _1996 + 1;
        _1994 = _1998;
    }
    int _2000 = _1994;
    float _2002 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2004 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2006 = _2004 != 0;
    float _2008 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2010 = _1912 + 8;
    uint _2012 = uint(int(uint(_2010) >> uint(2)));
    uint _2014 = uint(int(uint(int(_2012)) >> uint(2)));
    int _2016 = int(_2012) & 3;
    float _2018 = (*spvDescriptorSet0.vp_c9)._m0[int(_2014)][_2016];
    int _2020 = int(_2012) + 1;
    uint _2022 = uint(int(uint(_2020) >> uint(2)));
    int _2024 = _2020 & 3;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[int(_2022)][_2024];
    float _2028 = _2002 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2030 = abs(_1942);
    float _2032 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2034 = abs(_1786);
    float _2036 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2038 = abs(_1872);
    float _2040 = _2032 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2042 = !_1948;
    int _2044 = _2042 ? 0 : (-1);
    float _2046 = _2036 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2048 = _231 > 0.5;
    bool _2050 = _233 > 0.5;
    out.m_82.x = _2040;
    out.m_82.y = _2028;
    out.m_82.z = _2046;
    out.m_82.w = _2008;
    int _2052 = ~_2034;
    int _2054 = _2052 + 1;
    int _2056 = _2054 + 1;
    float _2058 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2060 = -_195;
    int _2062 = _2048 ? as_type<int>(_2060) : as_type<int>(_195);
    float _2064 = _1165 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2066 = _235 > 0.5;
    float _2068 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2070 = _2056 * as_type<int>(_1934);
    int _2072 = abs(_1868);
    float _2074 = _2058 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2076 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2078 = int(_2076);
    float _2080 = _2068 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2082 = abs(as_type<int>(_1836));
    if (_1035)
    {
        float _2084 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2086 = _1119 + _2084;
        _1862 = _2086;
    }
    float _2088 = _1862;
    int _2090 = ~_2030;
    int _2092 = _2090 + 1;
    int _2094 = _2092 + 1;
    int _2096 = ~_2038;
    int _2098 = _2096 + 1;
    int _2100 = _2098 + 1;
    out.m_84.x = _2064;
    out.m_84.y = _2074;
    out.m_84.z = _2080;
    int _2102 = ~_2082;
    int _2104 = _2102 + 1;
    int _2106 = _2104 + 1;
    int _2108 = _2094 * as_type<int>(_1992);
    int _2110 = abs(_1898);
    int _2112 = _2100 * as_type<int>(_1926);
    int _2114 = _2112 + _2070;
    int _2116 = abs(_2044);
    int _2118 = _2106 * as_type<int>(_1984);
    int _2120 = _2118 + _2108;
    float _2122 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2124 = int(_2122);
    int _2126 = abs(_2000);
    float _2128 = _937 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2130 = ~_2072;
    int _2132 = _2130 + 1;
    int _2134 = _2132 + 1;
    float _2136 = _949 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2138 = _937 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2140 = float(uint(_2078));
    int _2142 = _2134 * as_type<int>(_1958);
    int _2144 = _2142 + _2114;
    int _2146 = ~_2110;
    int _2148 = _2146 + 1;
    int _2150 = _2148 + 1;
    float _2152 = _949 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2154 = ~_2126;
    int _2156 = _2154 + 1;
    int _2158 = _2156 + 1;
    if (_1035)
    {
        float _2160 = _2088 * _2088;
        _1057 = _2160;
    }
    float _2162 = _1057;
    float _2164 = 1.0 / _2140;
    int _2166 = _2150 * as_type<int>(_1966);
    int _2168 = _2166 + _2144;
    int _2170 = abs(_1812);
    int _2172 = _2158 * as_type<int>(_2018);
    int _2174 = _2172 + _2120;
    int _2176 = abs(_2078);
    int _2178 = ~_2170;
    int _2180 = _2178 + 1;
    int _2182 = _2180 + 1;
    int _2184 = ~_2116;
    int _2186 = _2184 + 1;
    int _2188 = _2186 + 1;
    float _2190 = float(uint(_2124));
    int _2192 = _2168 * _2182;
    int _2194 = _2188 * as_type<int>(_2026);
    int _2196 = _2194 + _2174;
    int _2198 = abs(_1824);
    float _2200 = _937 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2202 = _1804 * _2170;
    int _2204 = _2202 + _2192;
    float _2206 = 1.0 / _2190;
    float _2208 = float(uint(_2176));
    float _2210 = -_931;
    float _2212 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2128);
    int _2214 = abs(_2124);
    float _2216 = -_931;
    float _2218 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2200);
    int _2220 = as_type<int>(_2164) + (-2);
    float _2222 = _957 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2224 = float(uint(_2204));
    float _2226 = 1.0 / _2208;
    float _2228 = -_931;
    float _2230 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2138);
    int _2232 = ~_2198;
    int _2234 = _2232 + 1;
    int _2236 = _2234 + 1;
    float _2238 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2212);
    float _2240 = float(uint(_2214));
    float _2242 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2230);
    float _2244 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2218);
    float _2246 = _949 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2248 = as_type<float>(_2220) * _2224;
    int _2250 = _2196 * _2236;
    float _2252 = 1.0 / _2240;
    float _2254 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2246);
    int _2256 = abs(_2204);
    int _2258 = _1976 * _2198;
    int _2260 = _2258 + _2250;
    float _2262 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2136);
    float _2264 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2152);
    int _2266 = as_type<int>(_2206) + (-2);
    float _2268 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2254);
    float _2270 = trunc(_2248);
    float _2272 = precise::max(_2270, 0.0);
    uint _2274 = uint(_2272);
    float _2276 = float(uint(_2260));
    int _2278 = abs(_2260);
    float _2280 = as_type<float>(_2266) * _2276;
    float _2282 = float(uint(_2256));
    float _2284 = as_type<float>(_2196);
    if (_1035)
    {
        float _2286 = _1079 * 6.283185482025146484375;
        float _2288 = cos(_2286);
        _2284 = _2288;
    }
    float _2290 = _2284;
    int _2292 = ~_2078;
    int _2294 = _2292 + 1;
    float _2296 = _957 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2298 = as_type<int>(_2252) + (-2);
    float _2300 = float(uint(_2278));
    bool _2302 = !_1876;
    float _2304 = _2302 ? _199 : as_type<float>(_1790);
    float _2306 = trunc(_2280);
    float _2308 = precise::max(_2306, 0.0);
    uint _2310 = uint(_2308);
    int _2312 = as_type<int>(_2226) + (-2);
    float _2314 = _957 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2316 = !_2006;
    float _2318 = _2316 ? _195 : as_type<float>(_2062);
    bool _2320 = _2124 == 0;
    float _2322 = as_type<float>(_2312) * _2282;
    float _2324 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2296);
    int _2326 = _2294 * int(_2274);
    int _2328 = _2326 + _2204;
    float _2330 = as_type<float>(_2298) * _2300;
    float _2332 = trunc(_2322);
    float _2334 = precise::max(_2332, 0.0);
    uint _2336 = uint(_2334);
    float _2338 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2314);
    float _2340 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2222);
    float _2342 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2324);
    float _2344 = float(uint(_2328));
    float _2346 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2338);
    float _2348 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2340);
    int _2350 = ~_2176;
    int _2352 = _2350 + 1;
    float _2354 = trunc(_2330);
    float _2356 = precise::max(_2354, 0.0);
    uint _2358 = uint(_2356);
    int _2360 = ~_2124;
    int _2362 = _2360 + 1;
    float _2364 = as_type<float>(_2220) * _2344;
    float _2366 = as_type<float>(_2352);
    if (_1035)
    {
        float _2368 = _2290 + (-1.0);
        _2366 = _2368;
    }
    float _2370 = _2366;
    int _2372 = ~_2214;
    int _2374 = _2372 + 1;
    int _2376 = _2362 * int(_2310);
    int _2378 = _2376 + _2260;
    int _2380 = _2352 * int(_2336);
    int _2382 = _2380 + _2256;
    float _2384 = _2370;
    if (_1035)
    {
        float _2386 = _2370 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2384 = _2386;
    }
    float _2388 = _2384;
    float _2390 = trunc(_2364);
    float _2392 = precise::max(_2390, 0.0);
    uint _2394 = uint(_2392);
    float _2396 = float(uint(_2378));
    float _2398 = float(uint(_2382));
    if (_1035)
    {
        float _2400 = fma(_1097, _2290, _2388);
        _1099 = _2400;
    }
    float _2402 = _1099;
    float _2404 = -_199;
    int _2406 = _2050 ? as_type<int>(_2404) : as_type<int>(_199);
    int _2408 = _2374 * int(_2358);
    int _2410 = _2408 + _2278;
    float _2412 = as_type<float>(_2312) * _2398;
    bool _2414 = !_1880;
    float _2416 = _2414 ? _199 : as_type<float>(_2406);
    float _2418 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2420 = float(uint(_2410));
    float _2422 = as_type<float>(_2266) * _2396;
    float _2424 = -_195;
    int _2426 = _2066 ? as_type<int>(_2424) : as_type<int>(_195);
    float _2428 = trunc(_2412);
    float _2430 = precise::max(_2428, 0.0);
    uint _2432 = uint(_2430);
    float _2434 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2262);
    float _2436 = as_type<float>(_2298) * _2420;
    bool _2438 = !_1884;
    float _2440 = _2438 ? _195 : as_type<float>(_2426);
    float _2442 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2444 = _2418 * _2242;
    float _2446 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2264);
    float _2448 = _2418 * _2244;
    float _2450 = trunc(_2422);
    float _2452 = precise::max(_2450, 0.0);
    uint _2454 = uint(_2452);
    float _2456 = fma(_2442, _2268, _2444);
    float _2458 = _2444;
    float _2460 = _2440;
    if (_1035)
    {
        float _2462 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2464 = _1123 + _2462;
        _2458 = _2464;
    }
    float _2466 = _2458;
    float _2468 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2470 = _2402 + _2468;
    out.m_86.x = _2268;
    out.m_86.y = _2434;
    out.m_86.z = _2446;
    if (_1035)
    {
        float _2472 = _2466 * _2466;
        _1059 = _2472;
    }
    float _2474 = _1059;
    int _2476 = int(_2274) + int(_2394);
    float _2478 = trunc(_2436);
    float _2480 = precise::max(_2478, 0.0);
    uint _2482 = uint(_2480);
    float _2484 = _2418 * _2238;
    int _2486 = ~_2078;
    int _2488 = _2486 + 1;
    float _2490 = fma(_2470, _2470, _2162);
    bool _2492 = _2124 == 0;
    float _2494 = fma(_2442, _2434, _2484);
    float _2496 = fma(_2442, _2446, _2448);
    int _2498 = ~_2176;
    int _2500 = _2498 + 1;
    int _2502 = int(_2310) + int(_2454);
    int _2504 = ~_2124;
    int _2506 = _2504 + 1;
    int _2508 = int(_2336) + int(_2432);
    int _2510 = int(_2358) + int(_2482);
    int _2512 = _2488 * _2476;
    int _2514 = _2512 + _2204;
    int _2516 = ~_2214;
    int _2518 = _2516 + 1;
    int _2520 = _2500 * _2508;
    int _2522 = _2520 + _2256;
    float _2524 = _2490 + _2474;
    int _2526 = _2506 * _2502;
    int _2528 = _2526 + _2260;
    bool _2530 = uint(_2514) >= uint(_2078);
    int _2532 = _2518 * _2510;
    int _2534 = _2532 + _2278;
    float _2536 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2538 = uint(_2522) >= uint(_2176);
    bool _2540 = uint(_2528) >= uint(_2124);
    bool _2542 = !_2530;
    int _2544 = _2542 ? 0 : (-1);
    bool _2546 = !_2540;
    int _2548 = _2546 ? 0 : (-1);
    float _2550 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2552 = ~_2476;
    int _2554 = _2552 + _2544;
    int _2556 = _2554 + 1;
    bool _2558 = uint(_2534) >= uint(_2214);
    int _2560 = ~_2502;
    int _2562 = _2560 + _2548;
    int _2564 = _2562 + 1;
    int _2566 = _2078 * _2556;
    int _2568 = _2566 + _2204;
    int _2570 = _2204 ^ _2078;
    bool _2572 = !_2558;
    int _2574 = _2572 ? 0 : (-1);
    int _2576 = _2124 * _2564;
    int _2578 = _2576 + _2260;
    bool _2580 = _2078 == 0;
    bool _2582 = !_2538;
    int _2584 = _2582 ? 0 : (-1);
    uint _2586 = uint(int(uint(_2570) >> uint(31)));
    float _2588 = _2550 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2590 = _2078 == 0;
    float _2592 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2594 = _2260 ^ _2124;
    int _2596 = ~_2574;
    int _2598 = _2510 + _2596;
    int _2600 = _2598 + 1;
    int _2602 = ~_2584;
    int _2604 = _2508 + _2602;
    int _2606 = _2604 + 1;
    float _2608 = fma(_2418, _2418, 1.0);
    int _2610 = ~int(_2586);
    int _2612 = _2610 + 1;
    float _2614 = _2536 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2616 = !_2580;
    int _2618 = _2616 ? _2568 : (-1);
    float _2620 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _2622 = uint(int(uint(_2594) >> uint(31)));
    int _2624 = _2606 ^ _2612;
    float _2626 = float(_2618);
    int _2628 = ~int(_2622);
    int _2630 = _2628 + 1;
    int _2632 = ~_2612;
    int _2634 = _2632 + _2624;
    int _2636 = _2634 + 1;
    float _2638 = fma(_2614, _2626, _605);
    bool _2640 = !_2320;
    int _2642 = _2640 ? _2578 : (-1);
    float _2644 = rsqrt(_2608);
    int _2646 = _2600 ^ _2630;
    float _2648 = float(_2642);
    float _2650 = _2592 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2652 = ~_2630;
    int _2654 = _2652 + _2646;
    int _2656 = _2654 + 1;
    float _2658 = _2318 + 0.5;
    bool _2660 = !_2590;
    int _2662 = _2660 ? _2636 : (-1);
    float _2664 = fma(_2650, _2648, _691);
    bool _2666 = !_2492;
    int _2668 = _2666 ? _2656 : (-1);
    float _2670 = fma(_2614, _2658, _2638);
    float _2672 = float(_2662);
    float _2674 = _2440 + 0.5;
    float _2676 = float(_2668);
    float _2678 = _2620 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2680 = -_1153;
    float _2682 = fma(_2318, _2680, _2670);
    float _2684 = -_677;
    float _2686 = fma(_2588, _2672, _2684);
    float _2688 = _2416 + (-0.5);
    float _2690 = fma(_2650, _2674, _2664);
    float _2692 = _2418 * _2644;
    float _2694 = -_693;
    float _2696 = fma(_2678, _2676, _2694);
    float _2698 = -_2588;
    float _2700 = fma(_2698, _2688, _2686);
    float _2702 = _2304 + (-0.5);
    float _2704 = -_2346;
    float _2706 = _2692 * _2704;
    float _2708 = -_2342;
    float _2710 = _2692 * _2708;
    float _2712 = -_2348;
    float _2714 = _2692 * _2712;
    float _2716 = -_2678;
    float _2718 = fma(_2716, _2702, _2696);
    float _2720 = fma(_2644, _2242, _2706);
    float _2722 = fma(_2644, _2238, _2710);
    float _2724 = fma(_2644, _2244, _2714);
    float _2726 = -_1149;
    float _2728 = fma(_2440, _2726, _2690);
    float _2730 = sqrt(_2524);
    float _2732 = _2346 + _2456;
    float _2734 = fma(_2416, _1163, _2700);
    float _2736 = fma(_2304, _1173, _2718);
    float _2738 = _2342 + _2494;
    float _2740 = _2348 + _2496;
    out.m_88.x = _2720;
    out.m_88.y = _2722;
    out.m_88.z = _2724;
    out.m_90.x = _2682;
    out.m_90.y = _2734;
    out.m_90.z = _2728;
    out.m_90.w = _2736;
    out.m_92.x = _1133;
    out.m_92.y = _1135;
    out.m_92.z = _1137;
    bool _2742 = _2730 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2744 = isnan(_2730);
    bool _2746 = _2742 || _2744;
    bool _2748 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2750 = _2746 || _2748;
    out.m_94.x = _2732;
    out.m_94.y = _2738;
    out.m_94.z = _2740;
    float _2752 = _2524;
    if (!_2750)
    {
        _2752 = 1.0;
    }
    float _2754 = _2752;
    bool _2756 = !_2750;
    float _2758 = _2754;
    if (!_2756)
    {
        bool _2760 = _2730 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2762 = isnan(_2730);
        bool _2764 = _2760 || _2762;
        bool _2766 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2768 = _2764 || _2766;
        if (!_2768)
        {
            float _2770 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2772 = _2730 + _2770;
            float _2774 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2776 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2774;
            float _2778 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2780 = _2778 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2782 = 1.0 / _2776;
            float _2784 = _2772 * _2782;
            float _2786 = fma(_2784, _2780, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2758 = _2786;
            _2788 = true;
        }
        else
        {
            bool _2790 = _2730 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2792 = isnan(_2730);
            bool _2794 = _2790 || _2792;
            bool _2796 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2798 = _2794 || _2796;
            if (!_2798)
            {
                float _2800 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2802 = _2730 + _2800;
                float _2804 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2806 = _2804 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2808 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2810 = _2808 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2812 = 1.0 / _2806;
                float _2814 = _2802 * _2812;
                float _2816 = fma(_2814, _2810, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2758 = _2816;
                _2788 = true;
            }
            else
            {
                _2758 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2788 = false;
    float _2818 = _2758;
    float _2820 = fma(_993, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2822 = fma(_995, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2824 = floor(_2820);
    float _2826 = floor(_2822);
    float _2828 = -_2824;
    float _2830 = _2820 + _2828;
    float _2832 = -_2826;
    float _2834 = _2822 + _2832;
    float2 _8323 = float2(_2830, _2834);
    float _2836 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8323, float2(0.0), isnan(_8323)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8323, float2(0.0), isnan(_8323)), level(0.0)).x;
    float _2838 = _1083 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2840 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2842 = _2402 + _2840;
    float _2844 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2838);
    float _2846 = _1083 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2848 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2850 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2852 = _1123 + _2850;
    float _2854 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2844);
    float _2856 = fma(_2842, _2818, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2858 = _1083 + _2848;
    float _2860 = _2854 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2862 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2846);
    float _2864 = fma(_2852, _2818, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2866 = 1.0 / _2860;
    float _2868 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2862);
    float _2870 = _2868 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2872 = _2870 + _2860;
    bool _2874 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2876 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2878 = _2874 || _2876;
    bool _2880 = isnan(0.5);
    bool _2882 = _2878 || _2880;
    float _2884 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2886 = _1119 + _2884;
    float _2888 = _2872 * _2866;
    float _2890 = _2888 * 0.5;
    float _2892 = _2858 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2894 = fma(_2886, _2818, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2896 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2898 = fma(_2890, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2896);
    float _2900 = fma(_993, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2892);
    float _2902 = _2858 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2904 = fma(_995, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2900);
    float _2906 = 1.0 / _2898;
    float _2908 = _2886;
    float _2910 = _2822;
    int _2912 = 2;
    int _2914 = as_type<int>(_2818);
    int _2916 = as_type<int>(_2856);
    if (_2882)
    {
        _2908 = _2856;
    }
    float _2918 = _2908;
    float _2920 = _2904 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2922 = _2918;
    if (_2882)
    {
        _2910 = _2864;
    }
    float _2924 = _2910;
    float _2926 = trunc(_2920);
    int _2928 = int(_2926);
    float _2930 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2932 = _2906 * _2930;
    bool _2934 = _2932 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _2936 = _2932 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _2938 = !_2934;
    int _2940 = _2938 ? 0 : 1;
    int _2942 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2944 = _2928 + _2942;
    int _2946 = _2944 + 1;
    float _2948 = _2924;
    if (!_2934)
    {
        _2912 = 1;
    }
    int _2950 = _2912;
    int _2952 = _2950;
    if (!_2936)
    {
        _2952 = _2940;
    }
    int _2954 = _2952;
    float _2956 = fma(_993, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2902);
    bool _2958 = _2946 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2960 = _2954 << 6;
    float _2962 = fma(_995, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2956);
    int _2964 = _2960 + 48;
    uint _2966 = uint(int(uint(_2964) >> uint(2)));
    uint _2968 = uint(int(uint(int(_2966)) >> uint(2)));
    int _2970 = int(_2966) & 3;
    float _2972 = (*spvDescriptorSet0.vp_c15)._m0[int(_2968)][_2970];
    int _2974 = int(_2966) + 1;
    uint _2976 = uint(int(uint(_2974) >> uint(2)));
    int _2978 = _2974 & 3;
    float _2980 = (*spvDescriptorSet0.vp_c15)._m0[int(_2976)][_2978];
    float _2982 = _2962 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2984 = trunc(_2982);
    int _2986 = int(_2984);
    int _2988 = _2960 + 56;
    uint _2990 = uint(int(uint(_2988) >> uint(2)));
    uint _2992 = uint(int(uint(int(_2990)) >> uint(2)));
    int _2994 = int(_2990) & 3;
    float _2996 = (*spvDescriptorSet0.vp_c15)._m0[int(_2992)][_2994];
    int _2998 = int(_2990) + 1;
    uint _3000 = uint(int(uint(_2998) >> uint(2)));
    int _3002 = _2998 & 3;
    float _3004 = (*spvDescriptorSet0.vp_c15)._m0[int(_3000)][_3002];
    int _3006 = _2960 + 64;
    uint _3008 = uint(int(uint(_3006) >> uint(2)));
    uint _3010 = uint(int(uint(int(_3008)) >> uint(2)));
    int _3012 = int(_3008) & 3;
    float _3014 = (*spvDescriptorSet0.vp_c15)._m0[int(_3010)][_3012];
    int _3016 = int(_3008) + 1;
    uint _3018 = uint(int(uint(_3016) >> uint(2)));
    int _3020 = _3016 & 3;
    float _3022 = (*spvDescriptorSet0.vp_c15)._m0[int(_3018)][_3020];
    int _3024 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3026 = _2986 + _3024;
    int _3028 = _3026 + 1;
    int _3030 = _2960 + 72;
    uint _3032 = uint(int(uint(_3030) >> uint(2)));
    uint _3034 = uint(int(uint(int(_3032)) >> uint(2)));
    int _3036 = int(_3032) & 3;
    float _3038 = (*spvDescriptorSet0.vp_c15)._m0[int(_3034)][_3036];
    int _3040 = int(_3032) + 1;
    uint _3042 = uint(int(uint(_3040) >> uint(2)));
    int _3044 = _3040 & 3;
    float _3046 = (*spvDescriptorSet0.vp_c15)._m0[int(_3042)][_3044];
    int _3048 = _2946 | _3028;
    bool _3050 = _3048 < 0;
    bool _3052 = _3050 || _2958;
    float _3054 = as_type<float>(_3048);
    float _3056 = as_type<float>(_2954);
    if (_2882)
    {
        _3054 = _2894;
    }
    float _3058 = _3054;
    int _3060 = _2960 + 96;
    uint _3062 = uint(int(uint(_3060) >> uint(2)));
    uint _3064 = uint(int(uint(int(_3062)) >> uint(2)));
    int _3066 = int(_3062) & 3;
    float _3068 = (*spvDescriptorSet0.vp_c15)._m0[int(_3064)][_3066];
    int _3070 = int(_3062) + 1;
    uint _3072 = uint(int(uint(_3070) >> uint(2)));
    int _3074 = _3070 & 3;
    float _3076 = (*spvDescriptorSet0.vp_c15)._m0[int(_3072)][_3074];
    bool _3078 = _3028 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3080 = _3078 || _3052;
    int _3082 = _2960 + 104;
    uint _3084 = uint(int(uint(_3082) >> uint(2)));
    uint _3086 = uint(int(uint(int(_3084)) >> uint(2)));
    int _3088 = int(_3084) & 3;
    float _3090 = (*spvDescriptorSet0.vp_c15)._m0[int(_3086)][_3088];
    int _3092 = int(_3084) + 1;
    uint _3094 = uint(int(uint(_3092) >> uint(2)));
    int _3096 = _3092 & 3;
    float _3098 = (*spvDescriptorSet0.vp_c15)._m0[int(_3094)][_3096];
    float _3100 = _3058;
    if (!_2882)
    {
        float _3102 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3104 = _1083 + _3102;
        float _3106 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3108 = _993 + _3106;
        float _3110 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3112 = _3104 * _3104;
        float _3114 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3116 = _995 + _3114;
        float _3118 = fma(_3108, _3108, _3112);
        float _3120 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3122 = fma(_3116, _3116, _3118);
        float _3124 = sqrt(_3122);
        float _3126 = _3110 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3128 = precise::min(_3124, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3130 = _3128 * _3120;
        float _3132 = -_1083;
        float _3134 = _3132 + _2856;
        float _3136 = -_993;
        float _3138 = _3136 + _2894;
        float _3140 = _3126 * _3130;
        float _3142 = -_995;
        float _3144 = _3142 + _2864;
        float _3146 = fma(_3134, _3140, _1083);
        float _3148 = fma(_3138, _3140, _993);
        float _3150 = fma(_3144, _3140, _995);
        _2922 = _3146;
        _3100 = _3148;
        _2914 = as_type<int>(_3144);
        _2948 = _3150;
        _2916 = as_type<int>(_3140);
    }
    float _3152 = _2922;
    float _3154 = _3100;
    int _3156 = _2914;
    float _3158 = _2948;
    int _3160 = _2916;
    float _3162 = _2858 * _3076;
    float _3164 = _3152 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _3166 = _3156;
    int _3168 = _3160;
    if (!_3080)
    {
        int _3170 = _3028 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3172 = _3170 + _2946;
        _3166 = _3172;
    }
    int _3174 = _3166;
    float _3176 = _2858 * _2980;
    float _3178 = fma(_993, _3068, _3162);
    float _3180 = fma(_3154, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3164);
    float _3182 = _2858 * _3022;
    if (!_3080)
    {
        int _3184 = _3174 << 2;
        _3168 = _3184;
    }
    int _3186 = _3168;
    float _3188 = fma(_995, _3090, _3178);
    float _3190 = fma(_3158, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3180);
    float _3192 = fma(_993, _2972, _3176);
    float _3194 = fma(_993, _3014, _3182);
    float _3196 = _3188 + _3098;
    float _3198 = _3190 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _3200 = as_type<int>(_3190);
    int _3202 = _3186;
    if (!_3080)
    {
        uint _3204 = uint(int(uint(_3174) >> uint(2)));
        _3200 = int(_3204);
    }
    int _3206 = _3200;
    float _3208 = fma(_995, _2996, _3192);
    float _3210 = 1.0 / _3196;
    if (!_3080)
    {
        int _3212 = 12 & _3186;
        _3202 = _3212;
    }
    int _3214 = _3202;
    int _3216 = _2960 + 80;
    uint _3218 = uint(int(uint(_3216) >> uint(2)));
    uint _3220 = uint(int(uint(int(_3218)) >> uint(2)));
    int _3222 = int(_3218) & 3;
    float _3224 = (*spvDescriptorSet0.vp_c15)._m0[int(_3220)][_3222];
    int _3226 = int(_3218) + 1;
    uint _3228 = uint(int(uint(_3226) >> uint(2)));
    int _3230 = _3226 & 3;
    float _3232 = (*spvDescriptorSet0.vp_c15)._m0[int(_3228)][_3230];
    float _3234 = fma(_995, _3038, _3194);
    float _3236 = _3208 + _3004;
    int _3238 = _3214;
    if (!_3080)
    {
        int _3240 = _3206 << 4;
        int _3242 = _3240 + _3214;
        _3238 = _3242;
    }
    int _3244 = _3238;
    float _3246 = _3152 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3248 = _3234 + _3046;
    float _3250 = _3152 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3252 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3254 = fma(_3154, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3246);
    int _3256 = _2960 + 88;
    uint _3258 = uint(int(uint(_3256) >> uint(2)));
    uint _3260 = uint(int(uint(int(_3258)) >> uint(2)));
    int _3262 = int(_3258) & 3;
    float _3264 = (*spvDescriptorSet0.vp_c15)._m0[int(_3260)][_3262];
    int _3266 = int(_3258) + 1;
    uint _3268 = uint(int(uint(_3266) >> uint(2)));
    int _3270 = _3266 & 3;
    float _3272 = (*spvDescriptorSet0.vp_c15)._m0[int(_3268)][_3270];
    float _3274 = fma(_3154, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3250);
    float _3276 = _3198 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3278 = fma(_3158, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3254);
    float _3280 = _3152 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3282 = _3236 * _3210;
    float _3284 = fma(_3158, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3274);
    float _3286 = _3278 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3288 = _3236;
    if (!_3080)
    {
        int _3290 = _3244 + 400;
        uint _3292 = uint(int(uint(_3290) >> uint(2)));
        uint _3294 = uint(int(uint(int(_3292)) >> uint(2)));
        int _3296 = int(_3292) & 3;
        float _3298 = (*spvDescriptorSet0.vp_c15)._m0[int(_3294)][_3296];
        _3288 = _3298;
    }
    float _3300 = _3288;
    float _3302 = _3248 * _3210;
    bool _3304 = _3282 >= 0.0;
    float _3306 = -_3276;
    float _3308 = fma(_3306, _3252, 1.0);
    float _3310 = fma(_3154, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3280);
    float _3312 = _3284 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _3314 = _3282 <= 1.0;
    bool _3316 = _3314 && _3304;
    float _3318 = _3286 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3320 = fma(_3158, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3310);
    float _3322 = _2718;
    if (!_3080)
    {
        float _3324 = floor(_2982);
        _3322 = _3324;
    }
    float _3326 = _3322;
    bool _3328 = _3302 >= 0.0;
    bool _3330 = _3328 && _3316;
    float _3332 = fma(_3312, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3318);
    float _3334 = _3320 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3336 = _3286 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _3338 = _3302 <= 1.0;
    bool _3340 = _3338 && _3330;
    float _3342 = fma(_3198, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3332);
    float _3344 = log2(_3308);
    float _3346 = fma(_3312, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3336);
    float _3348 = fma(_3334, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3342);
    float _3350 = _3286 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3352 = fma(_3198, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3346);
    float _3354 = fma(_3312, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3350);
    float _3356 = 1.0 / _3348;
    float _3358 = fma(_3334, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3352);
    float _3360 = _3350;
    if (_3340)
    {
        float _3362 = float(_2954);
        _3360 = _3362;
    }
    float _3364 = _3360;
    float _3366 = _3326;
    if (!_3080)
    {
        float _3368 = -_3326;
        float _3370 = _2982 + _3368;
        _3366 = _3370;
    }
    float _3372 = _3366;
    float _3374 = _2858 * _3232;
    float _3376 = _3248;
    if (!_3080)
    {
        float _3378 = floor(_2920);
        _3376 = _3378;
    }
    float _3380 = _3376;
    float _3382 = _3344 * 0.693147182464599609375;
    float _3384 = fma(_993, _3224, _3374);
    float _3386 = fma(_3198, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3354);
    float _3388 = fma(_995, _3264, _3384);
    float _3390 = _3364;
    if (_3340)
    {
        float _3392 = rint(_3364);
        float _3394 = precise::max(_3392, 0.0);
        uint _3396 = uint(_3394);
        uint _3398 = clamp(_3396, 0u, 65535u);
        _3390 = as_type<float>(_3398);
    }
    float _3400 = _3390;
    float _3402 = fma(_3334, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3386);
    float _3404 = _3358 * _3356;
    float _3406 = _3388 + _3272;
    float _3408 = _3402 * _3356;
    float _3410 = _3406 * _3210;
    float _3412 = _3352;
    if (!_3080)
    {
        float _3414 = rint(_3300);
        float _3416 = precise::max(_3414, 0.0);
        uint _3418 = uint(_3416);
        uint _3420 = clamp(_3418, 0u, 65535u);
        _3412 = as_type<float>(_3420);
    }
    float _3422 = _3412;
    float _3424 = _3382 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3426 = fma(_3408, 0.5, 0.5);
    float _3428 = fma(_3404, -0.5, 0.5);
    float _3430 = _3380;
    float _3432 = _3424;
    if (!_3080)
    {
        float _3434 = -_3380;
        float _3436 = _2920 + _3434;
        _3430 = _3436;
    }
    float _3438 = _3430;
    float _3440 = _3302;
    if (_3340)
    {
        float3 _9351 = float3(_3282, _3302, float(as_type<int>(_3400)));
        float3 _9355 = select(_9351, float3(0.0), isnan(_9351));
        float _3442 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9355.xy, uint(rint(_9355.z)), _3410, level(0.0));
        _3440 = _3442;
    }
    float _3444 = _3440;
    float3 _9365 = float3(_3426, _3428, _3424);
    float _3446 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9365, float3(0.0), isnan(_9365)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9365, float3(0.0), isnan(_9365)), level(0.0)).x;
    float3 _9374 = float3(_3426, _3428, _3424);
    float4 _3449 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9374, float3(0.0), isnan(_9374)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9374, float3(0.0), isnan(_9374)), level(0.0)).xyzw;
    float _3451 = _3449.x;
    float _3453 = _3449.y;
    float _3455 = _3449.z;
    float _3457 = _3449.w;
    float _3459 = _3438;
    if (!_3080)
    {
        float3 _9397 = float3(_3438, _3372, float(as_type<int>(_3422)));
        float3 _9399 = select(_9397, float3(0.0), isnan(_9397));
        float _3461 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9399.xy, uint(rint(_9399.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9399.xy, uint(rint(_9399.z)), level(0.0)).x;
        _3459 = _3461;
    }
    float _3463 = _3459;
    if (_3080)
    {
        _3056 = 1.0;
    }
    float _3465 = _3056;
    float _3467 = _3465;
    float _3469 = _3463;
    if (!_3080)
    {
        int _3471 = _3174 << 4;
        int _3473 = _3471 + 2048;
        uint _3475 = uint(int(uint(_3473) >> uint(2)));
        uint _3477 = uint(int(uint(int(_3475)) >> uint(2)));
        int _3479 = int(_3475) & 3;
        float _3481 = (*spvDescriptorSet0.vp_c15)._m0[int(_3477)][_3479];
        int _3483 = int(_3475) + 1;
        uint _3485 = uint(int(uint(_3483) >> uint(2)));
        int _3487 = _3483 & 3;
        float _3489 = (*spvDescriptorSet0.vp_c15)._m0[int(_3485)][_3487];
        int _3491 = _3473 + 8;
        uint _3493 = uint(int(uint(_3491) >> uint(2)));
        uint _3495 = uint(int(uint(int(_3493)) >> uint(2)));
        int _3497 = int(_3493) & 3;
        float _3499 = (*spvDescriptorSet0.vp_c15)._m0[int(_3495)][_3497];
        int _3501 = int(_3493) + 1;
        uint _3503 = uint(int(uint(_3501) >> uint(2)));
        int _3505 = _3501 & 3;
        float _3507 = (*spvDescriptorSet0.vp_c15)._m0[int(_3503)][_3505];
        float _3509 = _2858 * _3489;
        float _3511 = fma(_993, _3481, _3509);
        float _3513 = fma(_995, _3499, _3511);
        float _3515 = _3513 + _3507;
        float _3517 = precise::clamp(_3515, 0.0, 1.0);
        float _3519 = -_3517;
        float _3521 = _3519 + _3463;
        float _3523 = fma(_3521, 500.0, 1.5);
        float _3525 = exp2(_3523);
        float _3527 = 0.0 + _3525;
        float _3529 = precise::clamp(_3527, 0.0, 1.0);
        _3432 = _3499;
        _3467 = _3529;
    }
    float _3531 = _3432;
    float _3533 = _3467;
    float _3535 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3537 = _3152 + _3535;
    float _3539 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3541 = _3154 + _3539;
    float _3543 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3545 = _3158 + _3543;
    float _3547 = _3537 * _3537;
    float _3549 = fma(_3541, _3541, _3547);
    float _3551 = fma(_3545, _3545, _3549);
    float _3553 = rsqrt(_3551);
    float _3555 = sqrt(_3551);
    float _3557 = _3553 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3559 = _3541 * _3557;
    float _3561 = _3545 * _3557;
    float _3563 = _3559 * _3559;
    float _3565 = _3561 * _3561;
    float _3567 = _3563 + _3565;
    float _3569 = sqrt(_3567);
    bool _3571 = _3569 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3573 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3575 = _3569 + _3573;
    float _3577 = _3545;
    float _3579 = _3575;
    float _3581 = _3547;
    float _3583 = _3537;
    if (_3571)
    {
        float _3585 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3577 = _3585;
    }
    float _3587 = _3577;
    if (_3571)
    {
        float _3589 = _3575 * _3587;
        _3579 = _3589;
    }
    float _3591 = _3579;
    if (_3571)
    {
        float _3593 = _3591 * 0.15915493667125701904296875;
        _3581 = _3593;
    }
    float _3595 = _3581;
    float _3597 = _3531;
    float _3599 = _3595;
    if (_3571)
    {
        float _3601 = _3595 * 6.283185482025146484375;
        float _3603 = sin(_3601);
        _3597 = _3603;
    }
    float _3605 = _3597;
    float _3607 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3609 = precise::max(0.0, _3607);
    float _3611 = _3553;
    float _3613 = _3609;
    if (_3571)
    {
        float _3615 = _3595 * 6.283185482025146484375;
        float _3617 = cos(_3615);
        _3611 = _3617;
    }
    float _3619 = _3611;
    float _3621 = -_3557;
    float _3623 = -_3609;
    float _3625 = fma(_3537, _3621, _3623);
    float _3627 = _3607;
    if (_3571)
    {
        float _3629 = rsqrt(_3567);
        _3627 = _3629;
    }
    float _3631 = _3627;
    if (_3571)
    {
        float _3633 = _3625 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3613 = _3633;
    }
    float _3635 = _3613;
    float _3637 = _3635;
    if (!_3571)
    {
        _3599 = _3563;
    }
    float _3639 = _3599;
    float _3641 = _3639;
    if (_3571)
    {
        float _3643 = fma(_3605, _3635, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3637 = _3643;
    }
    float _3645 = _3637;
    float _3647 = _3645;
    float _3649 = _3619;
    if (_3571)
    {
        float _3651 = _3619 + (-1.0);
        _3583 = _3651;
    }
    float _3653 = _3583;
    float _3655 = _3653;
    if (_3571)
    {
        float _3657 = _3653 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3469 = _3657;
    }
    float _3659 = _3469;
    if (!_3571)
    {
        _3655 = _3561;
    }
    float _3661 = _3655;
    float _3663 = _3631;
    float _3665 = _3661;
    if (_3571)
    {
        float _3667 = _3631 * _3645;
        _2460 = _3667;
    }
    float _3669 = _2460;
    if (!_3571)
    {
        _3647 = _3559;
    }
    float _3671 = _3647;
    float _3673 = _3671;
    if (!_3571)
    {
        _3663 = _3625;
    }
    float _3675 = _3663;
    float _3677 = _3675;
    if (_3571)
    {
        float _3679 = _3559 * _3669;
        _3673 = _3679;
    }
    float _3681 = _3673;
    if (_3571)
    {
        float _3683 = fma(_3625, _3619, _3659);
        _3677 = _3683;
    }
    float _3685 = _3677;
    if (_3571)
    {
        float _3687 = _3561 * _3669;
        _3665 = _3687;
    }
    float _3689 = _3665;
    if (!_3571)
    {
        _3649 = _3565;
    }
    float _3691 = _3649;
    float _3693 = _3691;
    if (_3571)
    {
        float _3695 = _3681 * _3681;
        _3641 = _3695;
    }
    float _3697 = _3641;
    if (_3571)
    {
        float _3699 = _3689 * _3689;
        _3693 = _3699;
    }
    float _3701 = _3693;
    float _3703 = fma(_3685, _3685, _3697);
    float _3705 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3707 = fma(_3555, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3705);
    float _3709 = precise::clamp(_3707, 0.0, 1.0);
    float _3711 = _3703 + _3701;
    float _3713 = -_3709;
    float _3715 = _3713 + 1.0;
    float _3717 = rsqrt(_3711);
    float _3719 = _3717 * _3681;
    float _3721 = _3717 * _3685;
    float _3723 = _3717 * _3689;
    float _3725 = abs(_3715);
    float _3727 = log2(_3725);
    float _3729 = _3719 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3731 = -_3729;
    float _3733 = fma(_3721, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3731);
    float _3735 = -_3723;
    float _3737 = fma(_3735, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3733);
    float _3739 = fma(_3737, -0.5, 0.5);
    float _3741 = fma(_3737, 0.5, 0.5);
    float _3743 = _3727 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3745 = fma(_3741, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3747 = sqrt(_3739);
    float _3749 = fma(_3741, _3745, -0.212114393711090087890625);
    float _3751 = _3721 + 1.0;
    float _3753 = fma(_3741, _3749, 1.570728778839111328125);
    float _3755 = exp2(_3743);
    float _3757 = _3747 * 0.636619746685028076171875;
    float _3759 = -_3753;
    float _3761 = fma(_3757, _3759, 1.0);
    float _3763 = -_3721;
    float _3765 = fma(_3755, _3751, _3763);
    float _3767 = fma(_3765, 0.5, 0.5);
    float2 _9872 = float2(_3761, _3767);
    float3 _3769 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9872, float2(0.0), isnan(_9872)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9872, float2(0.0), isnan(_9872)), level(0.0)).xyz;
    float _3771 = _3769.x;
    float _3773 = _3769.y;
    float _3775 = _3769.z;
    float _3777 = abs(_2932);
    float _3779 = log2(_3777);
    float _3781 = _3286 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3783 = _3727 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3785 = -_2836;
    float _3787 = _3785 + 1.0;
    float _3789 = fma(_3312, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3781);
    out.m_96.x = _3154;
    out.m_96.y = _3152;
    out.m_96.z = _3158;
    bool _3791 = _2932 <= 8000.0;
    bool _3793 = isnan(_2932);
    bool _3795 = _3791 || _3793;
    bool _3797 = isnan(8000.0);
    bool _3799 = _3795 || _3797;
    float _3801 = float(_3799);
    float _3803 = exp2(_3783);
    float _3805 = fma(_3198, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3789);
    float _3807 = fma(_3334, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3805);
    float _3809 = _3779 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3811 = _3807 + _3348;
    float _3813 = exp2(_3809);
    float _3815 = -_3803;
    float _3817 = _3815 + 1.0;
    float _3819 = _3817 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3821 = _3819 * _3446;
    float _3823 = fma(_3813, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3825 = precise::clamp(_3823, 0.0, 1.0);
    float _3827 = _3811 * 0.5;
    float _3829 = _3811;
    float _3831 = _3787;
    float _3833 = _3807;
    if (!_3340)
    {
        _3829 = 1.0;
    }
    float _3835 = _3829;
    float _3837 = fma(_3825, -2.0, 3.0);
    float _3839 = _3825 * _3825;
    float _3841 = _3835;
    if (_3340)
    {
        bool _3843 = _3444 >= _3410;
        bool _3845 = isnan(_3444);
        bool _3847 = _3843 || _3845;
        bool _3849 = isnan(_3410);
        bool _3851 = _3847 || _3849;
        float _3853 = float(_3851);
        _3841 = _3853;
    }
    float _3855 = _3841;
    float _3857 = _3457 * _3821;
    float _3859 = -_3819;
    float _3861 = _3859 + 1.0;
    float _3863 = _3839 * _3837;
    float _3865 = _3855 * _3533;
    bool _3867 = _3555 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3869 = isnan(_3555);
    bool _3871 = _3867 || _3869;
    bool _3873 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3875 = _3871 || _3873;
    float _3877 = -_3863;
    float _3879 = _3877 + 1.0;
    out.m_98.z = _3827;
    out.m_98.w = _3348;
    float _3881 = fma(_3879, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3863);
    float _3883 = _3457 * _3861;
    float _3885 = _3801 * _3881;
    out.gl_Position.x = _3402;
    out.gl_Position.y = _3358;
    out.gl_Position.z = _3807;
    out.gl_Position.w = _3348;
    float _3887 = _3885 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3889 = _3861;
    float _3891 = _3402;
    float _3893 = _3857;
    if (!_3875)
    {
        _3889 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3895 = _3889;
    float _3897 = _3787 * _3887;
    float _3899 = precise::clamp(_3897, 0.0, 1.0);
    float _3901 = _3895;
    float _3903 = _3895;
    if (!_3875)
    {
        _3831 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3905 = _3831;
    float _3907 = -_3899;
    float _3909 = fma(_3907, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3911 = -_3865;
    float _3913 = fma(_3911, _3909, 1.0);
    float _3915 = precise::clamp(_3913, 0.0, 1.0);
    float _3917 = _3915;
    float _3919 = _3905;
    float _3921 = _3905;
    if (!_3875)
    {
        _3833 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3923 = _3833;
    float _3925 = _3923;
    float _3927 = _3923;
    if (!_3875)
    {
        _3891 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3929 = _3891;
    float _3931 = _3915 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3933 = _3929;
    float _3935 = _3929;
    if (!_3875)
    {
        _3917 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3937 = _3917;
    out.m_100.x = _3931;
    float _3939 = _3775 * _3821;
    float _3941 = fma(_3771, _3857, _3451);
    float _3943 = fma(_3773, _3857, _3453);
    float _3945 = _3937;
    float _3947 = _3937;
    if (!_3875)
    {
        _3893 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3949 = _3893;
    float _3951 = fma(_3457, _3939, _3455);
    out.m_102.x = _3941;
    out.m_102.y = _3943;
    out.m_102.z = _3951;
    out.m_102.w = _3883;
    bool _3953 = !_3875;
    float _3955 = _3949;
    float _3957 = _3949;
    if (!_3953)
    {
        bool _3959 = _3555 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3961 = isnan(_3555);
        bool _3963 = _3959 || _3961;
        bool _3965 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3967 = _3963 || _3965;
        if (!_3967)
        {
            float _3969 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3971 = _3555 + _3969;
            float _3973 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3975 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3973;
            float _3977 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3979 = _3977 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3981 = 1.0 / _3975;
            float _3983 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3985 = _3983 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3987 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3989 = _3987 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3991 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3993 = _3991 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3995 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3997 = _3995 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3999 = _3971 * _3981;
            float _4001 = precise::clamp(_3999, 0.0, 1.0);
            float _4003 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4005 = _4003 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4007 = fma(_4001, _3979, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4009 = fma(_4001, _4005, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4011 = fma(_4001, _3985, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4013 = fma(_4001, _3989, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4015 = fma(_4001, _3993, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4017 = fma(_4001, _3997, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3921 = _4011;
            _3903 = _4015;
            _3927 = _4007;
            _3957 = _4013;
            _3935 = _4009;
            _3947 = _4017;
            _4019 = true;
        }
        else
        {
            bool _4021 = _3555 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4023 = isnan(_3555);
            bool _4025 = _4021 || _4023;
            bool _4027 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4029 = _4025 || _4027;
            if (!_4029)
            {
                _3925 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4031 = _3925;
            _3927 = _4031;
            if (!_4029)
            {
                _3919 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4033 = _3919;
            _3921 = _4033;
            if (!_4029)
            {
                _3933 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4035 = _3933;
            _3935 = _4035;
            if (!_4029)
            {
                _3955 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4037 = _3955;
            _3957 = _4037;
            if (!_4029)
            {
                _3901 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4039 = _3901;
            _3903 = _4039;
            if (!_4029)
            {
                _3945 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4041 = _3945;
            bool _4043 = !_4029;
            _3947 = _4041;
            if (!_4043)
            {
                bool _4045 = _3555 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4047 = isnan(_3555);
                bool _4049 = _4045 || _4047;
                bool _4051 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4053 = _4049 || _4051;
                if (!_4053)
                {
                    float _4055 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4057 = _3555 + _4055;
                    float _4059 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4061 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4059;
                    float _4063 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4065 = _4063 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4067 = 1.0 / _4061;
                    float _4069 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4071 = _4069 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4073 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4075 = _4073 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4077 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4079 = _4077 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4081 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4083 = _4081 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4085 = _4057 * _4067;
                    float _4087 = precise::clamp(_4085, 0.0, 1.0);
                    float _4089 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4091 = _4089 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4093 = fma(_4087, _4065, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4095 = fma(_4087, _4091, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4097 = fma(_4087, _4071, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4099 = fma(_4087, _4075, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4101 = fma(_4087, _4079, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4103 = fma(_4087, _4083, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3921 = _4097;
                    _3903 = _4101;
                    _3927 = _4093;
                    _3957 = _4099;
                    _3935 = _4095;
                    _3947 = _4103;
                    _4019 = true;
                }
                else
                {
                    _3921 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3903 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3927 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3957 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3935 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3947 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4019 = false;
    float _4105 = _3921;
    float _4107 = _3903;
    float _4109 = _3927;
    float _4111 = _3957;
    float _4113 = _3935;
    float _4115 = _3947;
    float _4117 = fma(_2738, -0.5, 0.5);
    float _4119 = precise::clamp(_4117, 0.0, 1.0);
    float _4121 = -_4105;
    float _4123 = _4121 + _4107;
    float _4125 = -_4109;
    float _4127 = _4125 + _4111;
    float _4129 = -_4113;
    float _4131 = _4129 + _4115;
    bool _4133 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4135 = fma(_4119, _4123, _4105);
    float _4137 = fma(_4119, _4127, _4109);
    float _4139 = fma(_4119, _4131, _4113);
    float _4141 = _4135 * 0.586610972881317138671875;
    out.m_104.x = 0.0;
    float _4143 = fma(_4137, 0.298911988735198974609375, _4141);
    float _4145 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4147 = fma(_4139, 0.114477999508380889892578125, _4143);
    out.m_63.x = _4145;
    float _4149 = -_4147;
    float _4151 = _4137 + _4149;
    float _4153 = -_4147;
    float _4155 = _4135 + _4153;
    float _4157 = -_4147;
    float _4159 = _4139 + _4157;
    float _4161 = fma(_4151, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4147);
    float _4163 = fma(_4155, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4147);
    float _4165 = fma(_4159, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4147);
    out.m_106.x = _4161;
    out.m_106.y = _4163;
    out.m_106.z = _4165;
    if (!_4133)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4167 = -_3152;
    float _4169 = _4167 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4171 = -_3154;
    float _4173 = _4171 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4175 = -_3158;
    float _4177 = _4175 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4179 = _4169 * _4169;
    float _4181 = fma(_4173, _4173, _4179);
    float _4183 = fma(_4177, _4177, _4181);
    float _4185 = sqrt(_4183);
    float _4187 = rsqrt(_4183);
    float _4189 = -_4185;
    float _4191 = _4189 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4193 = _4191 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4195 = precise::clamp(_4193, 0.0, 1.0);
    float _4197 = _4173 * _4187;
    float _4199 = _4169 * _4187;
    float _4201 = abs(_4195);
    float _4203 = log2(_4201);
    float _4205 = _4177 * _4187;
    float _4207 = _4197 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4209 = _2738 * _4199;
    float _4211 = -_4199;
    float _4213 = -_4207;
    float _4215 = fma(_4211, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4213);
    float _4217 = fma(_2732, _4197, _4209);
    float _4219 = -_4205;
    float _4221 = fma(_4219, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4215);
    float _4223 = fma(_2740, _4205, _4217);
    float _4225 = precise::clamp(_4223, 0.0, 1.0);
    float _4227 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4229 = _4221 + _4227;
    float _4231 = _4203 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4233 = _4229 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4235 = precise::clamp(_4233, 0.0, 1.0);
    float _4237 = exp2(_4231);
    float _4239 = _4237 * _4235;
    float _4241 = _4225 * _4239;
    float _4243 = _4241 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4245 = _4241 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4247 = _4241 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_104.x = _4243;
    out.m_104.y = _4245;
    out.m_104.z = _4247;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4019 = false;
    bool _2788 = false;
    bool _221 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _120 = in.m_60.w;
    float _122 = trunc(_120);
    int _125 = int(_122);
    bool _129 = _125 >= 1;
    float _131 = 0.0;
    if (!_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    float _135 = _133;
    if (!_129)
    {
        out.m_63.x = 0.0;
    }
    int _137 = 0;
    if (!_129)
    {
        float _139 = _133 * 5.0;
        _137 = as_type<int>(_139);
    }
    int _141 = _137;
    int _143 = _141;
    if (!_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4304 = as_type<float>(_141);
        out.gl_Position.z = _4304;
    }
    if (!_129)
    {
        return out;
    }
    float _145 = in.m_65.w;
    bool _147 = _145 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _149 = isnan(_145);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _155 = _151 || _153;
    float _157 = -_145;
    float _159 = _157 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _161 = _159;
    if (_155)
    {
        float _163 = float(_125);
        _135 = _163;
    }
    float _165 = _135;
    bool _167 = _159 >= _165;
    bool _169 = !_155;
    bool _171 = _167 || _169;
    float _173 = _165;
    if (_171)
    {
        _173 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _175 = _173;
    if (_171)
    {
        out.m_63.x = 0.0;
    }
    if (_171)
    {
        float _177 = _175 * 5.0;
        _143 = as_type<int>(_177);
    }
    int _179 = _143;
    if (_171)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4374 = as_type<float>(_179);
        out.gl_Position.z = _4374;
    }
    if (_171)
    {
        return out;
    }
    float _181 = as_type<float>(int(gl_VertexIndex));
    bool _183 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _185 = as_type<int>(_181) & 1;
    bool _187 = _185 != 0;
    int _189 = as_type<int>(_181) & 2;
    bool _191 = _189 != 0;
    bool _193 = !_187;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_191;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_183;
    float _219;
    if (!_201)
    {
        float _203 = in.m_70.x;
        float _205 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _207 = _203 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _209 = fma(_207, (*spvDescriptorSet0.vp_c9)._m0[12].x, _159);
        float _211 = _209 * _205;
        float _213 = floor(_211);
        float _215 = -_213;
        float _217 = _211 + _215;
        _219 = _217;
        _221 = true;
    }
    else
    {
        float _223 = float(_125);
        float _225 = 1.0 / _223;
        float _227 = _159 * _225;
        _219 = _227;
    }
    _221 = false;
    float _229 = _219;
    float _231 = in.m_70.x;
    float _233 = in.m_70.y;
    float _235 = in.m_70.z;
    float _237 = in.m_70.w;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _241 = _229 + _239;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _245 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _243;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _249 = _247 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _251;
    float _255 = 1.0 / _245;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _259 = _257 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    int _261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _263 = _261 != 0;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _267 = 1.0 / _249;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _271;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _277 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _275;
    float _279 = _233 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _281 = _231 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _283 = 1.0 / _253;
    float _285 = _231 * 2.0;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _289 = _229 + _287;
    float _291 = -_269;
    float _293 = fma(_281, 2.0, _291);
    float _295 = _233 * 2.0;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _299 = _297 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _301 = floor(_285);
    float _303 = fma(_279, -2.0, _265);
    float _305 = _235 * 2.0;
    float _307 = _289 * _255;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _311 = _229 + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _313;
    float _317 = fma(_273, _307, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _319 = floor(_305);
    float _321 = _311 * _267;
    float _323 = _231 + _233;
    float _325 = fma(_277, _307, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _331 = _323 + (-1.0);
    float _333 = _235 + _233;
    float _335 = floor(_295);
    bool _337 = _301 > 0.0;
    float _339 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _341 = _333 + (-1.0);
    bool _343 = _301 >= 0.0;
    bool _345 = isnan(_301);
    bool _347 = _343 || _345;
    bool _349 = isnan(0.0);
    bool _351 = _347 || _349;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _355 = float(_125);
    float _357 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _359 = 1.0 / _259;
    bool _361 = _319 > 0.0;
    float _363 = fma(_299, _321, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _365 = as_type<int>(_341);
    if (_263)
    {
        _365 = 0;
    }
    int _367 = _365;
    float _369 = fma(_329, _321, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _371 = _319 >= 0.0;
    bool _373 = isnan(_319);
    bool _375 = _371 || _373;
    bool _377 = isnan(0.0);
    bool _379 = _375 || _377;
    int _381 = _367;
    if (!_263)
    {
        _381 = 1;
    }
    int _383 = _381;
    float _385 = 1.0 / _355;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _389 = _229 + _387;
    bool _391 = _335 > 0.0;
    bool _393 = _335 >= 0.0;
    bool _395 = isnan(_335);
    bool _397 = _393 || _395;
    bool _399 = isnan(0.0);
    bool _401 = _397 || _399;
    float _403 = _389 * _283;
    float _405 = _235 + _231;
    int _407 = _351 ? 0 : 1;
    float _409 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _411 = int(_409);
    bool _413 = _383 != 1;
    float _415 = _405 + (-1.0);
    int _417 = _379 ? 0 : 1;
    float _419 = fma(_315, _403, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _421 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _423 = _401 ? 0 : 1;
    float _425 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _427 = int(_425);
    int _429 = ~_407;
    int _431 = _429 + 1;
    int _433 = _431 + 1;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _435;
    int _439 = _433;
    float _441 = as_type<float>(_383);
    if (!_337)
    {
        int _443 = ~_407;
        int _445 = _443 + 1;
        _439 = _445;
    }
    int _447 = _439;
    float _449 = _241 * _359;
    int _451 = ~_417;
    int _453 = _451 + 1;
    int _455 = _453 + 1;
    float _457 = fma(_437, _403, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    int _459 = _455;
    if (!_361)
    {
        int _461 = ~_417;
        int _463 = _461 + 1;
        _459 = _463;
    }
    int _465 = _459;
    float _467 = _385 * _159;
    int _469 = ~_423;
    int _471 = _469 + 1;
    int _473 = _471 + 1;
    int _475 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _477 = _475 != 0;
    int _479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _481 = _479 != 0;
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _485 = _483 != 0;
    int _487 = _473;
    if (!_391)
    {
        int _489 = ~_423;
        int _491 = _489 + 1;
        _487 = _491;
    }
    int _493 = _487;
    float _495 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _497 = log2(_495);
    bool _499 = !_481;
    int _501 = _499 ? 0 : 1;
    bool _503 = !_477;
    int _505 = _503 ? 0 : 1;
    bool _507 = !_485;
    int _509 = _507 ? 0 : 1;
    int _511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _513 = _511 != 0;
    int _515 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _517 = _515 != 0;
    int _519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _521 = _519 != 0;
    float _523 = float(_427);
    float _525 = as_type<float>(_427);
    if (!_413)
    {
        _525 = _233;
    }
    float _527 = _525;
    float _529 = _527;
    if (_413)
    {
        _529 = _231;
    }
    float _531 = _529;
    float _533 = 1.0 / _523;
    bool _535 = !_513;
    float _537 = _535 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _539 = _531 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _541 = _537;
    if (!_413)
    {
        _441 = _233;
    }
    float _543 = _441;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _547 = _543;
    if (_413)
    {
        _547 = _231;
    }
    float _549 = _547;
    float _551 = -_353;
    float _553 = fma(_539, 2.0, _551);
    float _555 = _497 * _159;
    int _557 = abs(as_type<int>(_537));
    float _559 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[83].z, _545);
    float _561 = _549;
    if (!_413)
    {
        _541 = _235;
    }
    float _563 = _541;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _567 = _563;
    if (_413)
    {
        _567 = _233;
    }
    float _569 = _567;
    float _571 = exp2(_555);
    if (!_413)
    {
        _561 = _235;
    }
    float _573 = _561;
    float _575 = _533 * _159;
    float _577 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[83].w, _565);
    float _579 = _573;
    if (_413)
    {
        _579 = _233;
    }
    float _581 = _579;
    float _583 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[82].z, _559);
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _587 = float(_411);
    float _589 = _581 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _591 = float(_557);
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _595 = 1.0 + _593;
    float _597 = 1.0 / _587;
    float _599 = fma(_589, -2.0, _585);
    float _601 = float(_465);
    float _603 = -_159;
    float _605 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[76].x, _293);
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _609 = 1.0 / _595;
    float _611 = _591 * _601;
    bool _613 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _615 = isnan(1.0);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _621 = _617 || _619;
    float _623 = in.m_72.x;
    float _625 = in.m_72.y;
    float _627 = in.m_72.z;
    float _629 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[78].z, _607);
    float _631 = -_571;
    float _633 = _631 + 1.0;
    bool _635 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _637 = isnan(0.0);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _643 = _639 || _641;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _647 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _649 = isnan(_229);
    bool _651 = _647 || _649;
    bool _653 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _655 = _651 || _653;
    float _657 = float(_655);
    float _659 = _597 * _159;
    float _661 = _643 ? _633 : 0.0;
    float _663 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[78].w, _645);
    bool _665 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _667 = isnan(_229);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[76].y, _303);
    float _679 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[82].w, _577);
    float _681 = -_657;
    float _683 = _681 + 1.0;
    float _685 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[77].z, _629);
    float _687 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[77].w, _663);
    float _689 = -_159;
    float _691 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[81].x, _553);
    float _693 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[81].y, _599);
    if (_621)
    {
        float _695 = _661 * _609;
        _161 = _695;
    }
    float _697 = _161;
    float _699 = _611 * (-2.0);
    bool _701 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _703 = isnan(_229);
    bool _705 = _701 || _703;
    bool _707 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _709 = _705 || _707;
    float _711 = float(_709);
    float _713 = -_675;
    float _715 = _713 + 1.0;
    float _717 = _675 * _683;
    float _719 = fma(_339, _699, _339);
    bool _721 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _723 = isnan(_229);
    bool _725 = _721 || _723;
    bool _727 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _729 = _725 || _727;
    float _731 = float(_729);
    float _733 = _711 * _715;
    bool _735 = !_517;
    int _737 = _735 ? 0 : 1;
    float _739 = -_711;
    float _741 = _739 + 1.0;
    bool _743 = !_521;
    int _745 = _743 ? 0 : 1;
    float _747 = fma(_699, _623, _623);
    int _749 = abs(_737);
    bool _751 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _753 = isnan(_229);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _759 = _755 || _757;
    float _761 = float(_759);
    float _763 = _731 * _741;
    int _765 = abs(_745);
    float _767 = _231 + (-0.5);
    float _769 = float(_447);
    float _771 = -_731;
    float _773 = _771 + 1.0;
    float _775 = float(_749);
    float _777 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[196].x, _747);
    float _779 = float(_493);
    float _781 = _761 * _773;
    float _783 = -_761;
    float _785 = _783 + 1.0;
    float _787 = _775 * _769;
    float _789 = fma(_719, _697, _777);
    float _791 = _325 * _781;
    float _793 = _317 * _781;
    float _795 = _787 * (-2.0);
    float _797 = float(_765);
    float _799 = _233 + (-0.5);
    float _801 = fma(_785, (*spvDescriptorSet0.vp_c9)._m0[143].y, _791);
    float _803 = fma(_795, _625, _625);
    float _805 = fma(_357, _795, _357);
    float _807 = _797 * _779;
    float _809 = fma(_369, _763, _801);
    float _811 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[196].y, _803);
    float _813 = fma(_785, (*spvDescriptorSet0.vp_c9)._m0[143].x, _793);
    float _815 = _807 * (-2.0);
    float _817 = in.m_74.x;
    float _819 = in.m_74.y;
    float _821 = fma(_805, _697, _811);
    float _823 = _789 * 0.15915493667125701904296875;
    float _825 = fma(_815, _627, _627);
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _829 = _827 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _831 = _821 * 0.15915493667125701904296875;
    float _833 = _235 + (-0.5);
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _837 = _835 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _839 = fma(_363, _763, _813);
    float _841 = fma(_421, _815, _421);
    float _843 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[196].z, _825);
    float _845 = in.m_60.x;
    float _847 = in.m_60.y;
    float _849 = in.m_60.z;
    float _851 = fma(_829, _449, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _853 = fma(_837, _449, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _855 = fma(_457, _733, _809);
    float _857 = in.m_76.x;
    float _859 = in.m_76.y;
    float _861 = in.m_76.z;
    float _863 = fma(_419, _733, _839);
    float _865 = fma(_841, _697, _843);
    float _867 = fma(_853, _717, _855);
    float _869 = _823 * 6.283185482025146484375;
    float _871 = cos(_869);
    float _873 = fma(_851, _717, _863);
    float _875 = _865 * 0.15915493667125701904296875;
    float _877 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[147].y, _867);
    float _879 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[147].x, _873);
    float _881 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _883 = _877 * _819;
    float _885 = _831 * 6.283185482025146484375;
    float _887 = sin(_885);
    float _889 = _879 * _817;
    float _891 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _893 = _883 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _895 = _889 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _897 = in.m_78.x;
    float _899 = in.m_78.y;
    float _901 = in.m_78.z;
    float _903 = _831 * 6.283185482025146484375;
    float _905 = cos(_903);
    float _907 = _895 * _881;
    float _909 = _893 * _891;
    float _911 = _847 * _859;
    float _913 = _823 * 6.283185482025146484375;
    float _915 = sin(_913);
    float _917 = fma(_845, _857, _911);
    float _919 = _871 * _887;
    float _921 = fma(_849, _861, _917);
    float _923 = _875 * 6.283185482025146484375;
    float _925 = cos(_923);
    float _927 = _871 * _905;
    float _929 = _875 * 6.283185482025146484375;
    float _931 = sin(_929);
    float _933 = _915 * _887;
    float _935 = _915 * _905;
    float _937 = _871 * _925;
    float _939 = _915 * _925;
    float _941 = _905 * _925;
    float _943 = _887 * _925;
    float _945 = _937 * _909;
    float _947 = _939 * _909;
    float _949 = fma(_931, _927, _933);
    float _951 = -_919;
    float _953 = fma(_931, _935, _951);
    float _955 = -_935;
    float _957 = fma(_931, _919, _955);
    float _959 = -_909;
    float _961 = _931 * _959;
    float _963 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _965 = fma(_949, _907, _945);
    float _967 = fma(_931, _933, _927);
    float _969 = fma(_941, _907, _961);
    float _971 = _847 * _899;
    float _973 = fma(_957, _963, _965);
    float _975 = fma(_953, _907, _947);
    float _977 = fma(_943, _963, _969);
    float _979 = fma(_845, _897, _971);
    float _981 = _973 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _983 = _973 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _985 = fma(_967, _963, _975);
    float _987 = fma(_849, _901, _979);
    float _989 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[24].x, _981);
    float _991 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[26].x, _983);
    float _993 = _921 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _995 = _987 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _997 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[24].z, _989);
    float _999 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[26].z, _991);
    float _1001 = _997 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1003 = _999 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1005 = _993 + _1001;
    float _1007 = _995 + _1003;
    float _1009 = in.m_80.x;
    float _1011 = in.m_80.y;
    float _1013 = in.m_80.z;
    float _1015 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1017 = _1005 + _1015;
    float _1019 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1021 = _1007 + _1019;
    float _1023 = _1017 * _1017;
    float _1025 = _1021 * _1021;
    float _1027 = _1023 + _1025;
    float _1029 = sqrt(_1027);
    float _1031 = _847 * _1011;
    float _1033 = fma(_845, _1009, _1031);
    bool _1035 = _1029 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1037 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1039 = _1029 + _1037;
    float _1041 = fma(_849, _1013, _1033);
    float _1043 = _947;
    float _1045 = _1027;
    float _1047 = _1039;
    float _1049 = _973;
    float _1051 = _847;
    float _1053 = _1005;
    float _1055 = _1007;
    float _1057 = _1023;
    float _1059 = _1025;
    if (_1035)
    {
        float _1061 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1043 = _1061;
    }
    float _1063 = _1043;
    if (_1035)
    {
        float _1065 = rsqrt(_1027);
        _1045 = _1065;
    }
    float _1067 = _1045;
    float _1069 = _1067;
    if (_1035)
    {
        float _1071 = _1039 * _1063;
        _1047 = _1071;
    }
    float _1073 = _1047;
    float _1075 = _973 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (_1035)
    {
        float _1077 = _1073 * 0.15915493667125701904296875;
        _1049 = _1077;
    }
    float _1079 = _1049;
    float _1081 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1075);
    float _1083 = _1041 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1085 = _845;
    if (_1035)
    {
        float _1087 = _1079 * 6.283185482025146484375;
        float _1089 = sin(_1087);
        _1085 = _1089;
    }
    float _1091 = _1085;
    float _1093 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1081);
    float _1095 = _1093 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1097 = _1083 + _1095;
    float _1099 = _1097;
    if (_1035)
    {
        float _1101 = _1097 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1051 = _1101;
    }
    float _1103 = _1051;
    float _1105 = _1091;
    if (_1035)
    {
        float _1107 = fma(_1091, _1103, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1105 = _1107;
    }
    float _1109 = _1105;
    float _1111 = _1109;
    if (_1035)
    {
        float _1113 = _1067 * _1109;
        _1111 = _1113;
    }
    float _1115 = _1111;
    if (_1035)
    {
        float _1117 = fma(_1017, _1115, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1053 = _1117;
    }
    float _1119 = _1053;
    if (_1035)
    {
        float _1121 = fma(_1021, _1115, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1055 = _1121;
    }
    float _1123 = _1055;
    float _1125 = fma(_1119, 6.2500002968590706586837768554688e-05, 0.5);
    float _1127 = fma(_1123, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5842 = float2(_1125, _1127);
    float3 _1131 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5842, float2(0.0), isnan(_5842)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5842, float2(0.0), isnan(_5842)), level(0.0)).xyz;
    float _1133 = _1131.x;
    float _1135 = _1131.y;
    float _1137 = _1131.z;
    float _1139 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1141 = int(_1139);
    if (_263)
    {
        float _1143 = in.m_70.x;
        _1069 = _1143;
    }
    float _1145 = _1069;
    float _1147 = -_583;
    float _1149 = _1147 + 1.0;
    float _1151 = -_685;
    float _1153 = _1151 + 1.0;
    float _1155 = _1145;
    if (!_263)
    {
        float _1157 = in.m_70.y;
        _1155 = _1157;
    }
    float _1159 = _1155;
    float _1161 = -_687;
    float _1163 = _1161 + 1.0;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1167 = trunc(_575);
    int _1169 = int(_1167);
    float _1171 = -_679;
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
    float _1195 = trunc(_659);
    int _1197 = int(_1195);
    int _1199 = ~_1179;
    int _1201 = _1199 + 1;
    bool _1203 = _1179 == 0;
    int _1205 = as_type<int>(_1191) + (-2);
    float _1207 = 1.0 / _1193;
    float _1209 = _1191;
    if (_263)
    {
        _1209 = 1.0;
    }
    float _1211 = _1209;
    float _1213 = _1211;
    if (!_263)
    {
        _1213 = 7.345489978790283203125;
    }
    float _1215 = _1213;
    float _1217 = as_type<float>(_1205) * _1189;
    float _1219 = trunc(_1217);
    float _1221 = precise::max(_1219, 0.0);
    uint _1224 = uint(_1221);
    float _1226 = _1215 * _231;
    int _1228 = as_type<int>(_1207) + (-2);
    float _1230 = float(uint(_1197));
    int _1232 = _1183 * int(_1224);
    int _1234 = _1232 + _1169;
    float _1236 = as_type<float>(_1228) * _1230;
    float _1238 = float(_1169);
    float _1240 = float(uint(_1234));
    float _1242 = floor(_1226);
    bool _1244 = _1238 >= _1185;
    bool _1246 = isnan(_1238);
    bool _1248 = _1244 || _1246;
    bool _1250 = isnan(_1185);
    bool _1252 = _1248 || _1250;
    float _1254 = float(_1252);
    float _1256 = as_type<float>(_1205) * _1240;
    float _1258 = trunc(_1236);
    float _1260 = precise::max(_1258, 0.0);
    uint _1262 = uint(_1260);
    float _1264 = trunc(_1256);
    float _1266 = precise::max(_1264, 0.0);
    uint _1268 = uint(_1266);
    float _1270 = -_1242;
    float _1272 = _1226 + _1270;
    int _1274 = ~_1141;
    int _1276 = _1274 + 1;
    float _1278 = _1272 * _1185;
    int _1280 = _1201 * int(_1262);
    int _1282 = _1280 + _1197;
    float _1284 = trunc(_1254);
    int _1286 = int(_1284);
    float _1288 = float(uint(_1282));
    int _1290 = int(_1224) + int(_1268);
    float _1292 = as_type<float>(_1228) * _1288;
    float _1294 = trunc(_1278);
    int _1296 = int(_1294);
    int _1298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1300 = _1298 != 0;
    float _1302 = as_type<float>(_1276);
    if (_263)
    {
        _1302 = 1.0;
    }
    float _1304 = _1302;
    int _1306 = _1276 * _1290;
    int _1308 = _1306 + _1169;
    float _1310 = _1304;
    if (!_263)
    {
        _1310 = 1.2345600128173828125;
    }
    float _1312 = _1310;
    bool _1314 = !_1300;
    int _1316 = _1314 ? 0 : 1;
    bool _1318 = uint(_1308) >= uint(_1141);
    float _1320 = _1312 * _1159;
    float _1322 = trunc(_1292);
    float _1324 = precise::max(_1322, 0.0);
    uint _1326 = uint(_1324);
    int _1328 = abs(_1316);
    bool _1330 = !_1318;
    int _1332 = _1330 ? 0 : (-1);
    int _1334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1336 = _1334 != 0;
    int _1338 = ~_1290;
    int _1340 = _1338 + _1332;
    int _1342 = _1340 + 1;
    float _1344 = _1185 * _467;
    int _1346 = ~_1179;
    int _1348 = _1346 + 1;
    int _1350 = abs(_505);
    int _1352 = _1141 * _1342;
    int _1354 = _1352 + _1169;
    float _1356 = trunc(_1344);
    int _1358 = int(_1356);
    int _1360 = ~_1286;
    int _1362 = _1360 + 1;
    int _1364 = _1362 + 1;
    bool _1366 = !_1187;
    int _1368 = _1366 ? _1354 : (-1);
    int _1370 = _1296 * _1328;
    int _1372 = _1370 + _1169;
    int _1374 = int(_1262) + int(_1326);
    int _1376 = _1141 + (-1);
    int _1378 = _1368 * _1364;
    int _1380 = abs(_501);
    int _1382 = _1348 * _1374;
    int _1384 = _1382 + _1197;
    float _1386 = floor(_1320);
    int _1388 = _1286 * _1376;
    int _1390 = _1388 + _1378;
    float _1392 = float(_1179);
    float _1394 = float(_1197);
    bool _1396 = uint(_1384) >= uint(_1179);
    int _1398 = _1390 * _1380;
    bool _1400 = _1394 >= _1392;
    bool _1402 = isnan(_1394);
    bool _1404 = _1400 || _1402;
    bool _1406 = isnan(_1392);
    bool _1408 = _1404 || _1406;
    float _1410 = float(_1408);
    int _1412 = abs(_509);
    bool _1414 = !_1396;
    int _1416 = _1414 ? 0 : (-1);
    float _1418 = trunc(_1410);
    int _1420 = int(_1418);
    float _1422 = -_1386;
    float _1424 = _1320 + _1422;
    int _1426 = ~_1374;
    int _1428 = _1426 + _1416;
    int _1430 = _1428 + 1;
    bool _1432 = !_1336;
    int _1434 = _1432 ? 0 : 1;
    int _1436 = _1358 * _1350;
    int _1438 = _1436 + _1398;
    float _1440 = _1424 * _1392;
    int _1442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1444 = _1442 != 0;
    int _1446 = _1179 * _1430;
    int _1448 = _1446 + _1197;
    int _1450 = abs(_1434);
    int _1452 = _1372 * _1412;
    int _1454 = _1452 + _1438;
    bool _1456 = !_1444;
    int _1458 = _1456 ? 0 : 1;
    float _1460 = trunc(_1440);
    int _1462 = int(_1460);
    int _1464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1466 = _1464 != 0;
    int _1468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1470 = _1468 != 0;
    int _1472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1474 = _1472 != 0;
    int _1476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1478 = _1476 != 0;
    float _1480 = _1392 * _467;
    int _1482 = _1296 * _1450;
    int _1484 = _1482 + _1454;
    int _1486 = ~_1420;
    int _1488 = _1486 + 1;
    int _1490 = _1488 + 1;
    bool _1492 = !_1203;
    int _1494 = _1492 ? _1448 : (-1);
    float _1496 = trunc(_1480);
    int _1498 = int(_1496);
    bool _1500 = !_1470;
    int _1502 = _1500 ? 0 : 1;
    float _1504 = float(uint(_1484));
    int _1506 = _1494 * _1490;
    int _1508 = abs(_1458);
    int _1510 = _1179 + (-1);
    float _1512 = as_type<float>(_1205) * _1504;
    bool _1514 = !_1466;
    int _1516 = _1514 ? 0 : 1;
    int _1518 = abs(_1502);
    int _1520 = _1420 * _1510;
    int _1522 = _1520 + _1506;
    int _1524 = abs(_1516);
    float _1526 = trunc(_1512);
    float _1528 = precise::max(_1526, 0.0);
    uint _1530 = uint(_1528);
    int _1532 = _1462 * _1508;
    int _1534 = _1532 + _1197;
    bool _1536 = !_1474;
    int _1538 = _1536 ? 0 : 1;
    int _1540 = _1522 * _1518;
    int _1542 = ~_1141;
    int _1544 = _1542 + 1;
    float _1546 = float(uint(_1372));
    int _1548 = _1498 * _1524;
    int _1550 = _1548 + _1540;
    bool _1552 = !_1478;
    int _1554 = _1552 ? 0 : 1;
    int _1556 = abs(_1538);
    float _1558 = as_type<float>(_1205) * _1546;
    int _1560 = abs(_1554);
    int _1562 = _1534 * _1556;
    int _1564 = _1562 + _1550;
    float _1566 = trunc(_1558);
    float _1568 = precise::max(_1566, 0.0);
    uint _1570 = uint(_1568);
    int _1572 = _1544 * int(_1530);
    int _1574 = _1572 + _1484;
    float _1576 = float(uint(_1534));
    int _1578 = _1462 * _1560;
    int _1580 = _1578 + _1564;
    int _1582 = ~_1179;
    int _1584 = _1582 + 1;
    float _1586 = float(uint(_1574));
    float _1588 = as_type<float>(_1228) * _1576;
    float _1590 = float(uint(_1580));
    int _1592 = ~_1141;
    int _1594 = _1592 + 1;
    float _1596 = trunc(_1588);
    float _1598 = precise::max(_1596, 0.0);
    uint _1600 = uint(_1598);
    float _1602 = as_type<float>(_1205) * _1586;
    float _1604 = as_type<float>(_1228) * _1590;
    int _1606 = _1594 * int(_1570);
    int _1608 = _1606 + _1372;
    float _1610 = trunc(_1602);
    float _1612 = precise::max(_1610, 0.0);
    uint _1614 = uint(_1612);
    int _1616 = ~_1179;
    int _1618 = _1616 + 1;
    float _1620 = float(uint(_1608));
    float _1622 = trunc(_1604);
    float _1624 = precise::max(_1622, 0.0);
    uint _1626 = uint(_1624);
    int _1628 = _1584 * int(_1600);
    int _1630 = _1628 + _1534;
    float _1632 = as_type<float>(_1205) * _1620;
    int _1634 = ~_1141;
    int _1636 = _1634 + 1;
    float _1638 = float(uint(_1630));
    float _1640 = trunc(_1632);
    float _1642 = precise::max(_1640, 0.0);
    uint _1644 = uint(_1642);
    int _1646 = int(_1530) + int(_1614);
    float _1648 = as_type<float>(_1228) * _1638;
    int _1650 = _1618 * int(_1626);
    int _1652 = _1650 + _1580;
    float _1654 = trunc(_1648);
    float _1656 = precise::max(_1654, 0.0);
    uint _1658 = uint(_1656);
    int _1660 = _1636 * _1646;
    int _1662 = _1660 + _1484;
    float _1664 = float(uint(_1652));
    bool _1666 = uint(_1662) >= uint(_1141);
    int _1668 = int(_1570) + int(_1644);
    float _1670 = as_type<float>(_1228) * _1664;
    bool _1672 = !_1666;
    int _1674 = _1672 ? 0 : (-1);
    int _1676 = ~_1179;
    int _1678 = _1676 + 1;
    float _1680 = trunc(_1670);
    float _1682 = precise::max(_1680, 0.0);
    uint _1684 = uint(_1682);
    int _1686 = ~_1646;
    int _1688 = _1686 + _1674;
    int _1690 = _1688 + 1;
    int _1692 = int(_1600) + int(_1658);
    int _1694 = _1141 * _1690;
    int _1696 = _1694 + _1484;
    int _1698 = ~_1141;
    int _1700 = _1698 + 1;
    int _1702 = _1678 * _1692;
    int _1704 = _1702 + _1534;
    int _1706 = ~_1179;
    int _1708 = _1706 + 1;
    bool _1710 = !_1187;
    int _1712 = _1710 ? _1696 : (-1);
    int _1714 = _1700 * _1668;
    int _1716 = _1714 + _1372;
    int _1718 = _1712 & 3;
    bool _1720 = _1718 != 0;
    int _1722 = int(_1626) + int(_1684);
    int _1724 = _1712 & 3;
    bool _1726 = _1724 != 0;
    bool _1728 = uint(_1718) >= 2u;
    int _1730 = _1708 * _1722;
    int _1732 = _1730 + _1580;
    int _1734 = _1726 ? 0 : 1;
    bool _1736 = uint(_1716) >= uint(_1141);
    int _1738 = _1728 ? 0 : 1;
    bool _1740 = uint(_1732) >= uint(_1179);
    bool _1742 = uint(_1718) > 1u;
    bool _1744 = !_1736;
    int _1746 = _1744 ? 0 : (-1);
    bool _1748 = !_1740;
    int _1750 = _1748 ? 0 : (-1);
    int _1752 = ~_1668;
    int _1754 = _1752 + _1746;
    int _1756 = _1754 + 1;
    int _1758 = ~_1722;
    int _1760 = _1758 + _1750;
    int _1762 = _1760 + 1;
    bool _1764 = _237 > 0.5;
    int _1766 = _1141 * _1756;
    int _1768 = _1766 + _1372;
    int _1770 = ~_1734;
    int _1772 = _1770 + 1;
    int _1774 = _1772 + 1;
    int _1776 = _1179 * _1762;
    int _1778 = _1776 + _1580;
    int _1780 = _1774;
    if (!_1742)
    {
        int _1782 = ~_1734;
        int _1784 = _1782 + 1;
        _1780 = _1784;
    }
    int _1786 = _1780;
    float _1788 = -_199;
    int _1790 = _1764 ? as_type<int>(_1788) : as_type<int>(_199);
    int _1792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1794 = _1792 != 0;
    bool _1796 = !_1203;
    int _1798 = _1796 ? _1778 : (-1);
    bool _1800 = _1718 != 3;
    bool _1802 = !_1187;
    int _1804 = _1802 ? _1768 : (-1);
    int _1806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1808 = _1806 != 0;
    bool _1810 = !_1794;
    int _1812 = _1810 ? 0 : 1;
    int _1814 = _1712 >> 31;
    int _1816 = _1798 & 3;
    bool _1818 = _1816 != 0;
    int _1820 = _1798 >> 31;
    bool _1822 = !_1808;
    int _1824 = _1822 ? 0 : 1;
    int _1826 = _1814 & 3;
    bool _1828 = uint(_1704) >= uint(_1179);
    int _1830 = _1798 & 3;
    bool _1832 = _1830 != 0;
    bool _1834 = !_1818;
    float _1836 = _1834 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _1838 = _1820 & 3;
    bool _1840 = uint(_1816) > 1u;
    int _1842 = _1712 + _1826;
    bool _1844 = !_1828;
    int _1846 = _1844 ? 0 : (-1);
    int _1848 = _1832 ? 0 : 1;
    int _1850 = _1798 + _1838;
    int _1852 = ~_1738;
    int _1854 = _1852 + 1;
    int _1856 = _1854 + 1;
    bool _1858 = _1718 != 3;
    int _1860 = _1856;
    float _1862 = _1836;
    if (_1800)
    {
        int _1864 = ~_1738;
        int _1866 = _1864 + 1;
        _1860 = _1866;
    }
    int _1868 = _1860;
    bool _1870 = !_1720;
    int _1872 = _1870 ? 0 : 1;
    int _1874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1876 = _1874 != 0;
    int _1878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1880 = _1878 != 0;
    int _1882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1884 = _1882 != 0;
    int _1886 = _1842 >> 2;
    int _1888 = ~_1692;
    int _1890 = _1888 + _1846;
    int _1892 = _1890 + 1;
    int _1894 = _1850 >> 2;
    bool _1896 = !_1858;
    int _1898 = _1896 ? 0 : (-1);
    int _1900 = _1179 * _1892;
    int _1902 = _1900 + _1534;
    bool _1904 = uint(_1816) >= 2u;
    int _1906 = _1886 << 4;
    int _1908 = _1906 + 368;
    int _1910 = _1894 << 4;
    int _1912 = _1910 + 512;
    int _1914 = ~_1848;
    int _1916 = _1914 + 1;
    int _1918 = _1916 + 1;
    uint _1920 = uint(int(uint(_1908) >> uint(2)));
    uint _1922 = uint(int(uint(int(_1920)) >> uint(2)));
    int _1924 = int(_1920) & 3;
    float _1926 = (*spvDescriptorSet0.vp_c9)._m0[int(_1922)][_1924];
    int _1928 = int(_1920) + 1;
    uint _1930 = uint(int(uint(_1928) >> uint(2)));
    int _1932 = _1928 & 3;
    float _1934 = (*spvDescriptorSet0.vp_c9)._m0[int(_1930)][_1932];
    int _1936 = _1918;
    if (!_1840)
    {
        int _1938 = ~_1848;
        int _1940 = _1938 + 1;
        _1936 = _1940;
    }
    int _1942 = _1936;
    int _1944 = _1904 ? 0 : 1;
    bool _1946 = _1816 != 3;
    bool _1948 = _1816 != 3;
    int _1950 = _1908 + 8;
    uint _1952 = uint(int(uint(_1950) >> uint(2)));
    uint _1954 = uint(int(uint(int(_1952)) >> uint(2)));
    int _1956 = int(_1952) & 3;
    float _1958 = (*spvDescriptorSet0.vp_c9)._m0[int(_1954)][_1956];
    int _1960 = int(_1952) + 1;
    uint _1962 = uint(int(uint(_1960) >> uint(2)));
    int _1964 = _1960 & 3;
    float _1966 = (*spvDescriptorSet0.vp_c9)._m0[int(_1962)][_1964];
    int _1968 = ~_1944;
    int _1970 = _1968 + 1;
    int _1972 = _1970 + 1;
    bool _1974 = !_1203;
    int _1976 = _1974 ? _1902 : (-1);
    uint _1978 = uint(int(uint(_1912) >> uint(2)));
    uint _1980 = uint(int(uint(int(_1978)) >> uint(2)));
    int _1982 = int(_1978) & 3;
    float _1984 = (*spvDescriptorSet0.vp_c9)._m0[int(_1980)][_1982];
    int _1986 = int(_1978) + 1;
    uint _1988 = uint(int(uint(_1986) >> uint(2)));
    int _1990 = _1986 & 3;
    float _1992 = (*spvDescriptorSet0.vp_c9)._m0[int(_1988)][_1990];
    int _1994 = _1972;
    if (_1946)
    {
        int _1996 = ~_1944;
        int _1998 = _1996 + 1;
        _1994 = _1998;
    }
    int _2000 = _1994;
    float _2002 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2004 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2006 = _2004 != 0;
    float _2008 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2010 = _1912 + 8;
    uint _2012 = uint(int(uint(_2010) >> uint(2)));
    uint _2014 = uint(int(uint(int(_2012)) >> uint(2)));
    int _2016 = int(_2012) & 3;
    float _2018 = (*spvDescriptorSet0.vp_c9)._m0[int(_2014)][_2016];
    int _2020 = int(_2012) + 1;
    uint _2022 = uint(int(uint(_2020) >> uint(2)));
    int _2024 = _2020 & 3;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[int(_2022)][_2024];
    float _2028 = _2002 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2030 = abs(_1942);
    float _2032 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2034 = abs(_1786);
    float _2036 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2038 = abs(_1872);
    float _2040 = _2032 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2042 = !_1948;
    int _2044 = _2042 ? 0 : (-1);
    float _2046 = _2036 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2048 = _231 > 0.5;
    bool _2050 = _233 > 0.5;
    out.m_82.x = _2040;
    out.m_82.y = _2028;
    out.m_82.z = _2046;
    out.m_82.w = _2008;
    int _2052 = ~_2034;
    int _2054 = _2052 + 1;
    int _2056 = _2054 + 1;
    float _2058 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2060 = -_195;
    int _2062 = _2048 ? as_type<int>(_2060) : as_type<int>(_195);
    float _2064 = _1165 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2066 = _235 > 0.5;
    float _2068 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2070 = _2056 * as_type<int>(_1934);
    int _2072 = abs(_1868);
    float _2074 = _2058 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2076 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2078 = int(_2076);
    float _2080 = _2068 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2082 = abs(as_type<int>(_1836));
    if (_1035)
    {
        float _2084 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2086 = _1119 + _2084;
        _1862 = _2086;
    }
    float _2088 = _1862;
    int _2090 = ~_2030;
    int _2092 = _2090 + 1;
    int _2094 = _2092 + 1;
    int _2096 = ~_2038;
    int _2098 = _2096 + 1;
    int _2100 = _2098 + 1;
    out.m_84.x = _2064;
    out.m_84.y = _2074;
    out.m_84.z = _2080;
    int _2102 = ~_2082;
    int _2104 = _2102 + 1;
    int _2106 = _2104 + 1;
    int _2108 = _2094 * as_type<int>(_1992);
    int _2110 = abs(_1898);
    int _2112 = _2100 * as_type<int>(_1926);
    int _2114 = _2112 + _2070;
    int _2116 = abs(_2044);
    int _2118 = _2106 * as_type<int>(_1984);
    int _2120 = _2118 + _2108;
    float _2122 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2124 = int(_2122);
    int _2126 = abs(_2000);
    float _2128 = _937 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2130 = ~_2072;
    int _2132 = _2130 + 1;
    int _2134 = _2132 + 1;
    float _2136 = _949 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2138 = _937 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2140 = float(uint(_2078));
    int _2142 = _2134 * as_type<int>(_1958);
    int _2144 = _2142 + _2114;
    int _2146 = ~_2110;
    int _2148 = _2146 + 1;
    int _2150 = _2148 + 1;
    float _2152 = _949 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2154 = ~_2126;
    int _2156 = _2154 + 1;
    int _2158 = _2156 + 1;
    if (_1035)
    {
        float _2160 = _2088 * _2088;
        _1057 = _2160;
    }
    float _2162 = _1057;
    float _2164 = 1.0 / _2140;
    int _2166 = _2150 * as_type<int>(_1966);
    int _2168 = _2166 + _2144;
    int _2170 = abs(_1812);
    int _2172 = _2158 * as_type<int>(_2018);
    int _2174 = _2172 + _2120;
    int _2176 = abs(_2078);
    int _2178 = ~_2170;
    int _2180 = _2178 + 1;
    int _2182 = _2180 + 1;
    int _2184 = ~_2116;
    int _2186 = _2184 + 1;
    int _2188 = _2186 + 1;
    float _2190 = float(uint(_2124));
    int _2192 = _2168 * _2182;
    int _2194 = _2188 * as_type<int>(_2026);
    int _2196 = _2194 + _2174;
    int _2198 = abs(_1824);
    float _2200 = _937 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2202 = _1804 * _2170;
    int _2204 = _2202 + _2192;
    float _2206 = 1.0 / _2190;
    float _2208 = float(uint(_2176));
    float _2210 = -_931;
    float _2212 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2128);
    int _2214 = abs(_2124);
    float _2216 = -_931;
    float _2218 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2200);
    int _2220 = as_type<int>(_2164) + (-2);
    float _2222 = _957 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2224 = float(uint(_2204));
    float _2226 = 1.0 / _2208;
    float _2228 = -_931;
    float _2230 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2138);
    int _2232 = ~_2198;
    int _2234 = _2232 + 1;
    int _2236 = _2234 + 1;
    float _2238 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2212);
    float _2240 = float(uint(_2214));
    float _2242 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2230);
    float _2244 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2218);
    float _2246 = _949 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2248 = as_type<float>(_2220) * _2224;
    int _2250 = _2196 * _2236;
    float _2252 = 1.0 / _2240;
    float _2254 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2246);
    int _2256 = abs(_2204);
    int _2258 = _1976 * _2198;
    int _2260 = _2258 + _2250;
    float _2262 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2136);
    float _2264 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2152);
    int _2266 = as_type<int>(_2206) + (-2);
    float _2268 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2254);
    float _2270 = trunc(_2248);
    float _2272 = precise::max(_2270, 0.0);
    uint _2274 = uint(_2272);
    float _2276 = float(uint(_2260));
    int _2278 = abs(_2260);
    float _2280 = as_type<float>(_2266) * _2276;
    float _2282 = float(uint(_2256));
    float _2284 = as_type<float>(_2196);
    if (_1035)
    {
        float _2286 = _1079 * 6.283185482025146484375;
        float _2288 = cos(_2286);
        _2284 = _2288;
    }
    float _2290 = _2284;
    int _2292 = ~_2078;
    int _2294 = _2292 + 1;
    float _2296 = _957 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2298 = as_type<int>(_2252) + (-2);
    float _2300 = float(uint(_2278));
    bool _2302 = !_1876;
    float _2304 = _2302 ? _199 : as_type<float>(_1790);
    float _2306 = trunc(_2280);
    float _2308 = precise::max(_2306, 0.0);
    uint _2310 = uint(_2308);
    int _2312 = as_type<int>(_2226) + (-2);
    float _2314 = _957 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2316 = !_2006;
    float _2318 = _2316 ? _195 : as_type<float>(_2062);
    bool _2320 = _2124 == 0;
    float _2322 = as_type<float>(_2312) * _2282;
    float _2324 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2296);
    int _2326 = _2294 * int(_2274);
    int _2328 = _2326 + _2204;
    float _2330 = as_type<float>(_2298) * _2300;
    float _2332 = trunc(_2322);
    float _2334 = precise::max(_2332, 0.0);
    uint _2336 = uint(_2334);
    float _2338 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2314);
    float _2340 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2222);
    float _2342 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2324);
    float _2344 = float(uint(_2328));
    float _2346 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2338);
    float _2348 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2340);
    int _2350 = ~_2176;
    int _2352 = _2350 + 1;
    float _2354 = trunc(_2330);
    float _2356 = precise::max(_2354, 0.0);
    uint _2358 = uint(_2356);
    int _2360 = ~_2124;
    int _2362 = _2360 + 1;
    float _2364 = as_type<float>(_2220) * _2344;
    float _2366 = as_type<float>(_2352);
    if (_1035)
    {
        float _2368 = _2290 + (-1.0);
        _2366 = _2368;
    }
    float _2370 = _2366;
    int _2372 = ~_2214;
    int _2374 = _2372 + 1;
    int _2376 = _2362 * int(_2310);
    int _2378 = _2376 + _2260;
    int _2380 = _2352 * int(_2336);
    int _2382 = _2380 + _2256;
    float _2384 = _2370;
    if (_1035)
    {
        float _2386 = _2370 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2384 = _2386;
    }
    float _2388 = _2384;
    float _2390 = trunc(_2364);
    float _2392 = precise::max(_2390, 0.0);
    uint _2394 = uint(_2392);
    float _2396 = float(uint(_2378));
    float _2398 = float(uint(_2382));
    if (_1035)
    {
        float _2400 = fma(_1097, _2290, _2388);
        _1099 = _2400;
    }
    float _2402 = _1099;
    float _2404 = -_199;
    int _2406 = _2050 ? as_type<int>(_2404) : as_type<int>(_199);
    int _2408 = _2374 * int(_2358);
    int _2410 = _2408 + _2278;
    float _2412 = as_type<float>(_2312) * _2398;
    bool _2414 = !_1880;
    float _2416 = _2414 ? _199 : as_type<float>(_2406);
    float _2418 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2420 = float(uint(_2410));
    float _2422 = as_type<float>(_2266) * _2396;
    float _2424 = -_195;
    int _2426 = _2066 ? as_type<int>(_2424) : as_type<int>(_195);
    float _2428 = trunc(_2412);
    float _2430 = precise::max(_2428, 0.0);
    uint _2432 = uint(_2430);
    float _2434 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2262);
    float _2436 = as_type<float>(_2298) * _2420;
    bool _2438 = !_1884;
    float _2440 = _2438 ? _195 : as_type<float>(_2426);
    float _2442 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2444 = _2418 * _2242;
    float _2446 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2264);
    float _2448 = _2418 * _2244;
    float _2450 = trunc(_2422);
    float _2452 = precise::max(_2450, 0.0);
    uint _2454 = uint(_2452);
    float _2456 = fma(_2442, _2268, _2444);
    float _2458 = _2444;
    float _2460 = _2440;
    if (_1035)
    {
        float _2462 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2464 = _1123 + _2462;
        _2458 = _2464;
    }
    float _2466 = _2458;
    float _2468 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2470 = _2402 + _2468;
    out.m_86.x = _2268;
    out.m_86.y = _2434;
    out.m_86.z = _2446;
    if (_1035)
    {
        float _2472 = _2466 * _2466;
        _1059 = _2472;
    }
    float _2474 = _1059;
    int _2476 = int(_2274) + int(_2394);
    float _2478 = trunc(_2436);
    float _2480 = precise::max(_2478, 0.0);
    uint _2482 = uint(_2480);
    float _2484 = _2418 * _2238;
    int _2486 = ~_2078;
    int _2488 = _2486 + 1;
    float _2490 = fma(_2470, _2470, _2162);
    bool _2492 = _2124 == 0;
    float _2494 = fma(_2442, _2434, _2484);
    float _2496 = fma(_2442, _2446, _2448);
    int _2498 = ~_2176;
    int _2500 = _2498 + 1;
    int _2502 = int(_2310) + int(_2454);
    int _2504 = ~_2124;
    int _2506 = _2504 + 1;
    int _2508 = int(_2336) + int(_2432);
    int _2510 = int(_2358) + int(_2482);
    int _2512 = _2488 * _2476;
    int _2514 = _2512 + _2204;
    int _2516 = ~_2214;
    int _2518 = _2516 + 1;
    int _2520 = _2500 * _2508;
    int _2522 = _2520 + _2256;
    float _2524 = _2490 + _2474;
    int _2526 = _2506 * _2502;
    int _2528 = _2526 + _2260;
    bool _2530 = uint(_2514) >= uint(_2078);
    int _2532 = _2518 * _2510;
    int _2534 = _2532 + _2278;
    float _2536 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2538 = uint(_2522) >= uint(_2176);
    bool _2540 = uint(_2528) >= uint(_2124);
    bool _2542 = !_2530;
    int _2544 = _2542 ? 0 : (-1);
    bool _2546 = !_2540;
    int _2548 = _2546 ? 0 : (-1);
    float _2550 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2552 = ~_2476;
    int _2554 = _2552 + _2544;
    int _2556 = _2554 + 1;
    bool _2558 = uint(_2534) >= uint(_2214);
    int _2560 = ~_2502;
    int _2562 = _2560 + _2548;
    int _2564 = _2562 + 1;
    int _2566 = _2078 * _2556;
    int _2568 = _2566 + _2204;
    int _2570 = _2204 ^ _2078;
    bool _2572 = !_2558;
    int _2574 = _2572 ? 0 : (-1);
    int _2576 = _2124 * _2564;
    int _2578 = _2576 + _2260;
    bool _2580 = _2078 == 0;
    bool _2582 = !_2538;
    int _2584 = _2582 ? 0 : (-1);
    uint _2586 = uint(int(uint(_2570) >> uint(31)));
    float _2588 = _2550 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2590 = _2078 == 0;
    float _2592 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2594 = _2260 ^ _2124;
    int _2596 = ~_2574;
    int _2598 = _2510 + _2596;
    int _2600 = _2598 + 1;
    int _2602 = ~_2584;
    int _2604 = _2508 + _2602;
    int _2606 = _2604 + 1;
    float _2608 = fma(_2418, _2418, 1.0);
    int _2610 = ~int(_2586);
    int _2612 = _2610 + 1;
    float _2614 = _2536 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2616 = !_2580;
    int _2618 = _2616 ? _2568 : (-1);
    float _2620 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _2622 = uint(int(uint(_2594) >> uint(31)));
    int _2624 = _2606 ^ _2612;
    float _2626 = float(_2618);
    int _2628 = ~int(_2622);
    int _2630 = _2628 + 1;
    int _2632 = ~_2612;
    int _2634 = _2632 + _2624;
    int _2636 = _2634 + 1;
    float _2638 = fma(_2614, _2626, _605);
    bool _2640 = !_2320;
    int _2642 = _2640 ? _2578 : (-1);
    float _2644 = rsqrt(_2608);
    int _2646 = _2600 ^ _2630;
    float _2648 = float(_2642);
    float _2650 = _2592 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2652 = ~_2630;
    int _2654 = _2652 + _2646;
    int _2656 = _2654 + 1;
    float _2658 = _2318 + 0.5;
    bool _2660 = !_2590;
    int _2662 = _2660 ? _2636 : (-1);
    float _2664 = fma(_2650, _2648, _691);
    bool _2666 = !_2492;
    int _2668 = _2666 ? _2656 : (-1);
    float _2670 = fma(_2614, _2658, _2638);
    float _2672 = float(_2662);
    float _2674 = _2440 + 0.5;
    float _2676 = float(_2668);
    float _2678 = _2620 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2680 = -_1153;
    float _2682 = fma(_2318, _2680, _2670);
    float _2684 = -_677;
    float _2686 = fma(_2588, _2672, _2684);
    float _2688 = _2416 + (-0.5);
    float _2690 = fma(_2650, _2674, _2664);
    float _2692 = _2418 * _2644;
    float _2694 = -_693;
    float _2696 = fma(_2678, _2676, _2694);
    float _2698 = -_2588;
    float _2700 = fma(_2698, _2688, _2686);
    float _2702 = _2304 + (-0.5);
    float _2704 = -_2346;
    float _2706 = _2692 * _2704;
    float _2708 = -_2342;
    float _2710 = _2692 * _2708;
    float _2712 = -_2348;
    float _2714 = _2692 * _2712;
    float _2716 = -_2678;
    float _2718 = fma(_2716, _2702, _2696);
    float _2720 = fma(_2644, _2242, _2706);
    float _2722 = fma(_2644, _2238, _2710);
    float _2724 = fma(_2644, _2244, _2714);
    float _2726 = -_1149;
    float _2728 = fma(_2440, _2726, _2690);
    float _2730 = sqrt(_2524);
    float _2732 = _2346 + _2456;
    float _2734 = fma(_2416, _1163, _2700);
    float _2736 = fma(_2304, _1173, _2718);
    float _2738 = _2342 + _2494;
    float _2740 = _2348 + _2496;
    out.m_88.x = _2720;
    out.m_88.y = _2722;
    out.m_88.z = _2724;
    out.m_90.x = _2682;
    out.m_90.y = _2734;
    out.m_90.z = _2728;
    out.m_90.w = _2736;
    out.m_92.x = _1133;
    out.m_92.y = _1135;
    out.m_92.z = _1137;
    bool _2742 = _2730 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2744 = isnan(_2730);
    bool _2746 = _2742 || _2744;
    bool _2748 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2750 = _2746 || _2748;
    out.m_94.x = _2732;
    out.m_94.y = _2738;
    out.m_94.z = _2740;
    float _2752 = _2524;
    if (!_2750)
    {
        _2752 = 1.0;
    }
    float _2754 = _2752;
    bool _2756 = !_2750;
    float _2758 = _2754;
    if (!_2756)
    {
        bool _2760 = _2730 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2762 = isnan(_2730);
        bool _2764 = _2760 || _2762;
        bool _2766 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2768 = _2764 || _2766;
        if (!_2768)
        {
            float _2770 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2772 = _2730 + _2770;
            float _2774 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2776 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2774;
            float _2778 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2780 = _2778 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2782 = 1.0 / _2776;
            float _2784 = _2772 * _2782;
            float _2786 = fma(_2784, _2780, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2758 = _2786;
            _2788 = true;
        }
        else
        {
            bool _2790 = _2730 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2792 = isnan(_2730);
            bool _2794 = _2790 || _2792;
            bool _2796 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2798 = _2794 || _2796;
            if (!_2798)
            {
                float _2800 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2802 = _2730 + _2800;
                float _2804 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2806 = _2804 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2808 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2810 = _2808 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2812 = 1.0 / _2806;
                float _2814 = _2802 * _2812;
                float _2816 = fma(_2814, _2810, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2758 = _2816;
                _2788 = true;
            }
            else
            {
                _2758 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2788 = false;
    float _2818 = _2758;
    float _2820 = fma(_993, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2822 = fma(_995, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2824 = floor(_2820);
    float _2826 = floor(_2822);
    float _2828 = -_2824;
    float _2830 = _2820 + _2828;
    float _2832 = -_2826;
    float _2834 = _2822 + _2832;
    float2 _8323 = float2(_2830, _2834);
    float _2836 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8323, float2(0.0), isnan(_8323)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8323, float2(0.0), isnan(_8323)), level(0.0)).x;
    float _2838 = _1083 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2840 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2842 = _2402 + _2840;
    float _2844 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2838);
    float _2846 = _1083 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2848 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2850 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2852 = _1123 + _2850;
    float _2854 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2844);
    float _2856 = fma(_2842, _2818, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2858 = _1083 + _2848;
    float _2860 = _2854 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2862 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2846);
    float _2864 = fma(_2852, _2818, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2866 = 1.0 / _2860;
    float _2868 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2862);
    float _2870 = _2868 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2872 = _2870 + _2860;
    bool _2874 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2876 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2878 = _2874 || _2876;
    bool _2880 = isnan(0.5);
    bool _2882 = _2878 || _2880;
    float _2884 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2886 = _1119 + _2884;
    float _2888 = _2872 * _2866;
    float _2890 = _2888 * 0.5;
    float _2892 = _2858 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2894 = fma(_2886, _2818, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2896 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2898 = fma(_2890, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2896);
    float _2900 = fma(_993, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2892);
    float _2902 = _2858 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2904 = fma(_995, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2900);
    float _2906 = 1.0 / _2898;
    float _2908 = _2886;
    float _2910 = _2822;
    int _2912 = 2;
    int _2914 = as_type<int>(_2818);
    int _2916 = as_type<int>(_2856);
    if (_2882)
    {
        _2908 = _2856;
    }
    float _2918 = _2908;
    float _2920 = _2904 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2922 = _2918;
    if (_2882)
    {
        _2910 = _2864;
    }
    float _2924 = _2910;
    float _2926 = trunc(_2920);
    int _2928 = int(_2926);
    float _2930 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2932 = _2906 * _2930;
    bool _2934 = _2932 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _2936 = _2932 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _2938 = !_2934;
    int _2940 = _2938 ? 0 : 1;
    int _2942 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2944 = _2928 + _2942;
    int _2946 = _2944 + 1;
    float _2948 = _2924;
    if (!_2934)
    {
        _2912 = 1;
    }
    int _2950 = _2912;
    int _2952 = _2950;
    if (!_2936)
    {
        _2952 = _2940;
    }
    int _2954 = _2952;
    float _2956 = fma(_993, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2902);
    bool _2958 = _2946 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2960 = _2954 << 6;
    float _2962 = fma(_995, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2956);
    int _2964 = _2960 + 48;
    uint _2966 = uint(int(uint(_2964) >> uint(2)));
    uint _2968 = uint(int(uint(int(_2966)) >> uint(2)));
    int _2970 = int(_2966) & 3;
    float _2972 = (*spvDescriptorSet0.vp_c15)._m0[int(_2968)][_2970];
    int _2974 = int(_2966) + 1;
    uint _2976 = uint(int(uint(_2974) >> uint(2)));
    int _2978 = _2974 & 3;
    float _2980 = (*spvDescriptorSet0.vp_c15)._m0[int(_2976)][_2978];
    float _2982 = _2962 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2984 = trunc(_2982);
    int _2986 = int(_2984);
    int _2988 = _2960 + 56;
    uint _2990 = uint(int(uint(_2988) >> uint(2)));
    uint _2992 = uint(int(uint(int(_2990)) >> uint(2)));
    int _2994 = int(_2990) & 3;
    float _2996 = (*spvDescriptorSet0.vp_c15)._m0[int(_2992)][_2994];
    int _2998 = int(_2990) + 1;
    uint _3000 = uint(int(uint(_2998) >> uint(2)));
    int _3002 = _2998 & 3;
    float _3004 = (*spvDescriptorSet0.vp_c15)._m0[int(_3000)][_3002];
    int _3006 = _2960 + 64;
    uint _3008 = uint(int(uint(_3006) >> uint(2)));
    uint _3010 = uint(int(uint(int(_3008)) >> uint(2)));
    int _3012 = int(_3008) & 3;
    float _3014 = (*spvDescriptorSet0.vp_c15)._m0[int(_3010)][_3012];
    int _3016 = int(_3008) + 1;
    uint _3018 = uint(int(uint(_3016) >> uint(2)));
    int _3020 = _3016 & 3;
    float _3022 = (*spvDescriptorSet0.vp_c15)._m0[int(_3018)][_3020];
    int _3024 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3026 = _2986 + _3024;
    int _3028 = _3026 + 1;
    int _3030 = _2960 + 72;
    uint _3032 = uint(int(uint(_3030) >> uint(2)));
    uint _3034 = uint(int(uint(int(_3032)) >> uint(2)));
    int _3036 = int(_3032) & 3;
    float _3038 = (*spvDescriptorSet0.vp_c15)._m0[int(_3034)][_3036];
    int _3040 = int(_3032) + 1;
    uint _3042 = uint(int(uint(_3040) >> uint(2)));
    int _3044 = _3040 & 3;
    float _3046 = (*spvDescriptorSet0.vp_c15)._m0[int(_3042)][_3044];
    int _3048 = _2946 | _3028;
    bool _3050 = _3048 < 0;
    bool _3052 = _3050 || _2958;
    float _3054 = as_type<float>(_3048);
    float _3056 = as_type<float>(_2954);
    if (_2882)
    {
        _3054 = _2894;
    }
    float _3058 = _3054;
    int _3060 = _2960 + 96;
    uint _3062 = uint(int(uint(_3060) >> uint(2)));
    uint _3064 = uint(int(uint(int(_3062)) >> uint(2)));
    int _3066 = int(_3062) & 3;
    float _3068 = (*spvDescriptorSet0.vp_c15)._m0[int(_3064)][_3066];
    int _3070 = int(_3062) + 1;
    uint _3072 = uint(int(uint(_3070) >> uint(2)));
    int _3074 = _3070 & 3;
    float _3076 = (*spvDescriptorSet0.vp_c15)._m0[int(_3072)][_3074];
    bool _3078 = _3028 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3080 = _3078 || _3052;
    int _3082 = _2960 + 104;
    uint _3084 = uint(int(uint(_3082) >> uint(2)));
    uint _3086 = uint(int(uint(int(_3084)) >> uint(2)));
    int _3088 = int(_3084) & 3;
    float _3090 = (*spvDescriptorSet0.vp_c15)._m0[int(_3086)][_3088];
    int _3092 = int(_3084) + 1;
    uint _3094 = uint(int(uint(_3092) >> uint(2)));
    int _3096 = _3092 & 3;
    float _3098 = (*spvDescriptorSet0.vp_c15)._m0[int(_3094)][_3096];
    float _3100 = _3058;
    if (!_2882)
    {
        float _3102 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3104 = _1083 + _3102;
        float _3106 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3108 = _993 + _3106;
        float _3110 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3112 = _3104 * _3104;
        float _3114 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3116 = _995 + _3114;
        float _3118 = fma(_3108, _3108, _3112);
        float _3120 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3122 = fma(_3116, _3116, _3118);
        float _3124 = sqrt(_3122);
        float _3126 = _3110 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3128 = precise::min(_3124, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3130 = _3128 * _3120;
        float _3132 = -_1083;
        float _3134 = _3132 + _2856;
        float _3136 = -_993;
        float _3138 = _3136 + _2894;
        float _3140 = _3126 * _3130;
        float _3142 = -_995;
        float _3144 = _3142 + _2864;
        float _3146 = fma(_3134, _3140, _1083);
        float _3148 = fma(_3138, _3140, _993);
        float _3150 = fma(_3144, _3140, _995);
        _2922 = _3146;
        _3100 = _3148;
        _2914 = as_type<int>(_3144);
        _2948 = _3150;
        _2916 = as_type<int>(_3140);
    }
    float _3152 = _2922;
    float _3154 = _3100;
    int _3156 = _2914;
    float _3158 = _2948;
    int _3160 = _2916;
    float _3162 = _2858 * _3076;
    float _3164 = _3152 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _3166 = _3156;
    int _3168 = _3160;
    if (!_3080)
    {
        int _3170 = _3028 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3172 = _3170 + _2946;
        _3166 = _3172;
    }
    int _3174 = _3166;
    float _3176 = _2858 * _2980;
    float _3178 = fma(_993, _3068, _3162);
    float _3180 = fma(_3154, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3164);
    float _3182 = _2858 * _3022;
    if (!_3080)
    {
        int _3184 = _3174 << 2;
        _3168 = _3184;
    }
    int _3186 = _3168;
    float _3188 = fma(_995, _3090, _3178);
    float _3190 = fma(_3158, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3180);
    float _3192 = fma(_993, _2972, _3176);
    float _3194 = fma(_993, _3014, _3182);
    float _3196 = _3188 + _3098;
    float _3198 = _3190 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _3200 = as_type<int>(_3190);
    int _3202 = _3186;
    if (!_3080)
    {
        uint _3204 = uint(int(uint(_3174) >> uint(2)));
        _3200 = int(_3204);
    }
    int _3206 = _3200;
    float _3208 = fma(_995, _2996, _3192);
    float _3210 = 1.0 / _3196;
    if (!_3080)
    {
        int _3212 = 12 & _3186;
        _3202 = _3212;
    }
    int _3214 = _3202;
    int _3216 = _2960 + 80;
    uint _3218 = uint(int(uint(_3216) >> uint(2)));
    uint _3220 = uint(int(uint(int(_3218)) >> uint(2)));
    int _3222 = int(_3218) & 3;
    float _3224 = (*spvDescriptorSet0.vp_c15)._m0[int(_3220)][_3222];
    int _3226 = int(_3218) + 1;
    uint _3228 = uint(int(uint(_3226) >> uint(2)));
    int _3230 = _3226 & 3;
    float _3232 = (*spvDescriptorSet0.vp_c15)._m0[int(_3228)][_3230];
    float _3234 = fma(_995, _3038, _3194);
    float _3236 = _3208 + _3004;
    int _3238 = _3214;
    if (!_3080)
    {
        int _3240 = _3206 << 4;
        int _3242 = _3240 + _3214;
        _3238 = _3242;
    }
    int _3244 = _3238;
    float _3246 = _3152 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3248 = _3234 + _3046;
    float _3250 = _3152 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3252 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3254 = fma(_3154, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3246);
    int _3256 = _2960 + 88;
    uint _3258 = uint(int(uint(_3256) >> uint(2)));
    uint _3260 = uint(int(uint(int(_3258)) >> uint(2)));
    int _3262 = int(_3258) & 3;
    float _3264 = (*spvDescriptorSet0.vp_c15)._m0[int(_3260)][_3262];
    int _3266 = int(_3258) + 1;
    uint _3268 = uint(int(uint(_3266) >> uint(2)));
    int _3270 = _3266 & 3;
    float _3272 = (*spvDescriptorSet0.vp_c15)._m0[int(_3268)][_3270];
    float _3274 = fma(_3154, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3250);
    float _3276 = _3198 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3278 = fma(_3158, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3254);
    float _3280 = _3152 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3282 = _3236 * _3210;
    float _3284 = fma(_3158, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3274);
    float _3286 = _3278 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3288 = _3236;
    if (!_3080)
    {
        int _3290 = _3244 + 400;
        uint _3292 = uint(int(uint(_3290) >> uint(2)));
        uint _3294 = uint(int(uint(int(_3292)) >> uint(2)));
        int _3296 = int(_3292) & 3;
        float _3298 = (*spvDescriptorSet0.vp_c15)._m0[int(_3294)][_3296];
        _3288 = _3298;
    }
    float _3300 = _3288;
    float _3302 = _3248 * _3210;
    bool _3304 = _3282 >= 0.0;
    float _3306 = -_3276;
    float _3308 = fma(_3306, _3252, 1.0);
    float _3310 = fma(_3154, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3280);
    float _3312 = _3284 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _3314 = _3282 <= 1.0;
    bool _3316 = _3314 && _3304;
    float _3318 = _3286 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3320 = fma(_3158, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3310);
    float _3322 = _2718;
    if (!_3080)
    {
        float _3324 = floor(_2982);
        _3322 = _3324;
    }
    float _3326 = _3322;
    bool _3328 = _3302 >= 0.0;
    bool _3330 = _3328 && _3316;
    float _3332 = fma(_3312, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3318);
    float _3334 = _3320 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3336 = _3286 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _3338 = _3302 <= 1.0;
    bool _3340 = _3338 && _3330;
    float _3342 = fma(_3198, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3332);
    float _3344 = log2(_3308);
    float _3346 = fma(_3312, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3336);
    float _3348 = fma(_3334, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3342);
    float _3350 = _3286 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3352 = fma(_3198, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3346);
    float _3354 = fma(_3312, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3350);
    float _3356 = 1.0 / _3348;
    float _3358 = fma(_3334, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3352);
    float _3360 = _3350;
    if (_3340)
    {
        float _3362 = float(_2954);
        _3360 = _3362;
    }
    float _3364 = _3360;
    float _3366 = _3326;
    if (!_3080)
    {
        float _3368 = -_3326;
        float _3370 = _2982 + _3368;
        _3366 = _3370;
    }
    float _3372 = _3366;
    float _3374 = _2858 * _3232;
    float _3376 = _3248;
    if (!_3080)
    {
        float _3378 = floor(_2920);
        _3376 = _3378;
    }
    float _3380 = _3376;
    float _3382 = _3344 * 0.693147182464599609375;
    float _3384 = fma(_993, _3224, _3374);
    float _3386 = fma(_3198, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3354);
    float _3388 = fma(_995, _3264, _3384);
    float _3390 = _3364;
    if (_3340)
    {
        float _3392 = rint(_3364);
        float _3394 = precise::max(_3392, 0.0);
        uint _3396 = uint(_3394);
        uint _3398 = clamp(_3396, 0u, 65535u);
        _3390 = as_type<float>(_3398);
    }
    float _3400 = _3390;
    float _3402 = fma(_3334, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3386);
    float _3404 = _3358 * _3356;
    float _3406 = _3388 + _3272;
    float _3408 = _3402 * _3356;
    float _3410 = _3406 * _3210;
    float _3412 = _3352;
    if (!_3080)
    {
        float _3414 = rint(_3300);
        float _3416 = precise::max(_3414, 0.0);
        uint _3418 = uint(_3416);
        uint _3420 = clamp(_3418, 0u, 65535u);
        _3412 = as_type<float>(_3420);
    }
    float _3422 = _3412;
    float _3424 = _3382 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3426 = fma(_3408, 0.5, 0.5);
    float _3428 = fma(_3404, -0.5, 0.5);
    float _3430 = _3380;
    float _3432 = _3424;
    if (!_3080)
    {
        float _3434 = -_3380;
        float _3436 = _2920 + _3434;
        _3430 = _3436;
    }
    float _3438 = _3430;
    float _3440 = _3302;
    if (_3340)
    {
        float3 _9351 = float3(_3282, _3302, float(as_type<int>(_3400)));
        float3 _9355 = select(_9351, float3(0.0), isnan(_9351));
        float _3442 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9355.xy, uint(rint(_9355.z)), _3410, level(0.0));
        _3440 = _3442;
    }
    float _3444 = _3440;
    float3 _9365 = float3(_3426, _3428, _3424);
    float _3446 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9365, float3(0.0), isnan(_9365)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9365, float3(0.0), isnan(_9365)), level(0.0)).x;
    float3 _9374 = float3(_3426, _3428, _3424);
    float4 _3449 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9374, float3(0.0), isnan(_9374)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9374, float3(0.0), isnan(_9374)), level(0.0)).xyzw;
    float _3451 = _3449.x;
    float _3453 = _3449.y;
    float _3455 = _3449.z;
    float _3457 = _3449.w;
    float _3459 = _3438;
    if (!_3080)
    {
        float3 _9397 = float3(_3438, _3372, float(as_type<int>(_3422)));
        float3 _9399 = select(_9397, float3(0.0), isnan(_9397));
        float _3461 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9399.xy, uint(rint(_9399.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9399.xy, uint(rint(_9399.z)), level(0.0)).x;
        _3459 = _3461;
    }
    float _3463 = _3459;
    if (_3080)
    {
        _3056 = 1.0;
    }
    float _3465 = _3056;
    float _3467 = _3465;
    float _3469 = _3463;
    if (!_3080)
    {
        int _3471 = _3174 << 4;
        int _3473 = _3471 + 2048;
        uint _3475 = uint(int(uint(_3473) >> uint(2)));
        uint _3477 = uint(int(uint(int(_3475)) >> uint(2)));
        int _3479 = int(_3475) & 3;
        float _3481 = (*spvDescriptorSet0.vp_c15)._m0[int(_3477)][_3479];
        int _3483 = int(_3475) + 1;
        uint _3485 = uint(int(uint(_3483) >> uint(2)));
        int _3487 = _3483 & 3;
        float _3489 = (*spvDescriptorSet0.vp_c15)._m0[int(_3485)][_3487];
        int _3491 = _3473 + 8;
        uint _3493 = uint(int(uint(_3491) >> uint(2)));
        uint _3495 = uint(int(uint(int(_3493)) >> uint(2)));
        int _3497 = int(_3493) & 3;
        float _3499 = (*spvDescriptorSet0.vp_c15)._m0[int(_3495)][_3497];
        int _3501 = int(_3493) + 1;
        uint _3503 = uint(int(uint(_3501) >> uint(2)));
        int _3505 = _3501 & 3;
        float _3507 = (*spvDescriptorSet0.vp_c15)._m0[int(_3503)][_3505];
        float _3509 = _2858 * _3489;
        float _3511 = fma(_993, _3481, _3509);
        float _3513 = fma(_995, _3499, _3511);
        float _3515 = _3513 + _3507;
        float _3517 = precise::clamp(_3515, 0.0, 1.0);
        float _3519 = -_3517;
        float _3521 = _3519 + _3463;
        float _3523 = fma(_3521, 500.0, 1.5);
        float _3525 = exp2(_3523);
        float _3527 = 0.0 + _3525;
        float _3529 = precise::clamp(_3527, 0.0, 1.0);
        _3432 = _3499;
        _3467 = _3529;
    }
    float _3531 = _3432;
    float _3533 = _3467;
    float _3535 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3537 = _3152 + _3535;
    float _3539 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3541 = _3154 + _3539;
    float _3543 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3545 = _3158 + _3543;
    float _3547 = _3537 * _3537;
    float _3549 = fma(_3541, _3541, _3547);
    float _3551 = fma(_3545, _3545, _3549);
    float _3553 = rsqrt(_3551);
    float _3555 = sqrt(_3551);
    float _3557 = _3553 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3559 = _3541 * _3557;
    float _3561 = _3545 * _3557;
    float _3563 = _3559 * _3559;
    float _3565 = _3561 * _3561;
    float _3567 = _3563 + _3565;
    float _3569 = sqrt(_3567);
    bool _3571 = _3569 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3573 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3575 = _3569 + _3573;
    float _3577 = _3545;
    float _3579 = _3575;
    float _3581 = _3547;
    float _3583 = _3537;
    if (_3571)
    {
        float _3585 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3577 = _3585;
    }
    float _3587 = _3577;
    if (_3571)
    {
        float _3589 = _3575 * _3587;
        _3579 = _3589;
    }
    float _3591 = _3579;
    if (_3571)
    {
        float _3593 = _3591 * 0.15915493667125701904296875;
        _3581 = _3593;
    }
    float _3595 = _3581;
    float _3597 = _3531;
    float _3599 = _3595;
    if (_3571)
    {
        float _3601 = _3595 * 6.283185482025146484375;
        float _3603 = sin(_3601);
        _3597 = _3603;
    }
    float _3605 = _3597;
    float _3607 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3609 = precise::max(0.0, _3607);
    float _3611 = _3553;
    float _3613 = _3609;
    if (_3571)
    {
        float _3615 = _3595 * 6.283185482025146484375;
        float _3617 = cos(_3615);
        _3611 = _3617;
    }
    float _3619 = _3611;
    float _3621 = -_3557;
    float _3623 = -_3609;
    float _3625 = fma(_3537, _3621, _3623);
    float _3627 = _3607;
    if (_3571)
    {
        float _3629 = rsqrt(_3567);
        _3627 = _3629;
    }
    float _3631 = _3627;
    if (_3571)
    {
        float _3633 = _3625 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3613 = _3633;
    }
    float _3635 = _3613;
    float _3637 = _3635;
    if (!_3571)
    {
        _3599 = _3563;
    }
    float _3639 = _3599;
    float _3641 = _3639;
    if (_3571)
    {
        float _3643 = fma(_3605, _3635, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3637 = _3643;
    }
    float _3645 = _3637;
    float _3647 = _3645;
    float _3649 = _3619;
    if (_3571)
    {
        float _3651 = _3619 + (-1.0);
        _3583 = _3651;
    }
    float _3653 = _3583;
    float _3655 = _3653;
    if (_3571)
    {
        float _3657 = _3653 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3469 = _3657;
    }
    float _3659 = _3469;
    if (!_3571)
    {
        _3655 = _3561;
    }
    float _3661 = _3655;
    float _3663 = _3631;
    float _3665 = _3661;
    if (_3571)
    {
        float _3667 = _3631 * _3645;
        _2460 = _3667;
    }
    float _3669 = _2460;
    if (!_3571)
    {
        _3647 = _3559;
    }
    float _3671 = _3647;
    float _3673 = _3671;
    if (!_3571)
    {
        _3663 = _3625;
    }
    float _3675 = _3663;
    float _3677 = _3675;
    if (_3571)
    {
        float _3679 = _3559 * _3669;
        _3673 = _3679;
    }
    float _3681 = _3673;
    if (_3571)
    {
        float _3683 = fma(_3625, _3619, _3659);
        _3677 = _3683;
    }
    float _3685 = _3677;
    if (_3571)
    {
        float _3687 = _3561 * _3669;
        _3665 = _3687;
    }
    float _3689 = _3665;
    if (!_3571)
    {
        _3649 = _3565;
    }
    float _3691 = _3649;
    float _3693 = _3691;
    if (_3571)
    {
        float _3695 = _3681 * _3681;
        _3641 = _3695;
    }
    float _3697 = _3641;
    if (_3571)
    {
        float _3699 = _3689 * _3689;
        _3693 = _3699;
    }
    float _3701 = _3693;
    float _3703 = fma(_3685, _3685, _3697);
    float _3705 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3707 = fma(_3555, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3705);
    float _3709 = precise::clamp(_3707, 0.0, 1.0);
    float _3711 = _3703 + _3701;
    float _3713 = -_3709;
    float _3715 = _3713 + 1.0;
    float _3717 = rsqrt(_3711);
    float _3719 = _3717 * _3681;
    float _3721 = _3717 * _3685;
    float _3723 = _3717 * _3689;
    float _3725 = abs(_3715);
    float _3727 = log2(_3725);
    float _3729 = _3719 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3731 = -_3729;
    float _3733 = fma(_3721, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3731);
    float _3735 = -_3723;
    float _3737 = fma(_3735, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3733);
    float _3739 = fma(_3737, -0.5, 0.5);
    float _3741 = fma(_3737, 0.5, 0.5);
    float _3743 = _3727 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3745 = fma(_3741, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3747 = sqrt(_3739);
    float _3749 = fma(_3741, _3745, -0.212114393711090087890625);
    float _3751 = _3721 + 1.0;
    float _3753 = fma(_3741, _3749, 1.570728778839111328125);
    float _3755 = exp2(_3743);
    float _3757 = _3747 * 0.636619746685028076171875;
    float _3759 = -_3753;
    float _3761 = fma(_3757, _3759, 1.0);
    float _3763 = -_3721;
    float _3765 = fma(_3755, _3751, _3763);
    float _3767 = fma(_3765, 0.5, 0.5);
    float2 _9872 = float2(_3761, _3767);
    float3 _3769 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9872, float2(0.0), isnan(_9872)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9872, float2(0.0), isnan(_9872)), level(0.0)).xyz;
    float _3771 = _3769.x;
    float _3773 = _3769.y;
    float _3775 = _3769.z;
    float _3777 = abs(_2932);
    float _3779 = log2(_3777);
    float _3781 = _3286 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3783 = _3727 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3785 = -_2836;
    float _3787 = _3785 + 1.0;
    float _3789 = fma(_3312, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3781);
    out.m_96.x = _3154;
    out.m_96.y = _3152;
    out.m_96.z = _3158;
    bool _3791 = _2932 <= 8000.0;
    bool _3793 = isnan(_2932);
    bool _3795 = _3791 || _3793;
    bool _3797 = isnan(8000.0);
    bool _3799 = _3795 || _3797;
    float _3801 = float(_3799);
    float _3803 = exp2(_3783);
    float _3805 = fma(_3198, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3789);
    float _3807 = fma(_3334, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3805);
    float _3809 = _3779 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3811 = _3807 + _3348;
    float _3813 = exp2(_3809);
    float _3815 = -_3803;
    float _3817 = _3815 + 1.0;
    float _3819 = _3817 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3821 = _3819 * _3446;
    float _3823 = fma(_3813, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3825 = precise::clamp(_3823, 0.0, 1.0);
    float _3827 = _3811 * 0.5;
    float _3829 = _3811;
    float _3831 = _3787;
    float _3833 = _3807;
    if (!_3340)
    {
        _3829 = 1.0;
    }
    float _3835 = _3829;
    float _3837 = fma(_3825, -2.0, 3.0);
    float _3839 = _3825 * _3825;
    float _3841 = _3835;
    if (_3340)
    {
        bool _3843 = _3444 >= _3410;
        bool _3845 = isnan(_3444);
        bool _3847 = _3843 || _3845;
        bool _3849 = isnan(_3410);
        bool _3851 = _3847 || _3849;
        float _3853 = float(_3851);
        _3841 = _3853;
    }
    float _3855 = _3841;
    float _3857 = _3457 * _3821;
    float _3859 = -_3819;
    float _3861 = _3859 + 1.0;
    float _3863 = _3839 * _3837;
    float _3865 = _3855 * _3533;
    bool _3867 = _3555 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3869 = isnan(_3555);
    bool _3871 = _3867 || _3869;
    bool _3873 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3875 = _3871 || _3873;
    float _3877 = -_3863;
    float _3879 = _3877 + 1.0;
    out.m_98.z = _3827;
    out.m_98.w = _3348;
    float _3881 = fma(_3879, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3863);
    float _3883 = _3457 * _3861;
    float _3885 = _3801 * _3881;
    out.gl_Position.x = _3402;
    out.gl_Position.y = _3358;
    out.gl_Position.z = _3807;
    out.gl_Position.w = _3348;
    float _3887 = _3885 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3889 = _3861;
    float _3891 = _3402;
    float _3893 = _3857;
    if (!_3875)
    {
        _3889 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3895 = _3889;
    float _3897 = _3787 * _3887;
    float _3899 = precise::clamp(_3897, 0.0, 1.0);
    float _3901 = _3895;
    float _3903 = _3895;
    if (!_3875)
    {
        _3831 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3905 = _3831;
    float _3907 = -_3899;
    float _3909 = fma(_3907, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3911 = -_3865;
    float _3913 = fma(_3911, _3909, 1.0);
    float _3915 = precise::clamp(_3913, 0.0, 1.0);
    float _3917 = _3915;
    float _3919 = _3905;
    float _3921 = _3905;
    if (!_3875)
    {
        _3833 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3923 = _3833;
    float _3925 = _3923;
    float _3927 = _3923;
    if (!_3875)
    {
        _3891 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3929 = _3891;
    float _3931 = _3915 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3933 = _3929;
    float _3935 = _3929;
    if (!_3875)
    {
        _3917 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3937 = _3917;
    out.m_100.x = _3931;
    float _3939 = _3775 * _3821;
    float _3941 = fma(_3771, _3857, _3451);
    float _3943 = fma(_3773, _3857, _3453);
    float _3945 = _3937;
    float _3947 = _3937;
    if (!_3875)
    {
        _3893 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3949 = _3893;
    float _3951 = fma(_3457, _3939, _3455);
    out.m_102.x = _3941;
    out.m_102.y = _3943;
    out.m_102.z = _3951;
    out.m_102.w = _3883;
    bool _3953 = !_3875;
    float _3955 = _3949;
    float _3957 = _3949;
    if (!_3953)
    {
        bool _3959 = _3555 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3961 = isnan(_3555);
        bool _3963 = _3959 || _3961;
        bool _3965 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3967 = _3963 || _3965;
        if (!_3967)
        {
            float _3969 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3971 = _3555 + _3969;
            float _3973 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3975 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3973;
            float _3977 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3979 = _3977 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3981 = 1.0 / _3975;
            float _3983 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3985 = _3983 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3987 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3989 = _3987 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3991 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3993 = _3991 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3995 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3997 = _3995 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3999 = _3971 * _3981;
            float _4001 = precise::clamp(_3999, 0.0, 1.0);
            float _4003 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4005 = _4003 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4007 = fma(_4001, _3979, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4009 = fma(_4001, _4005, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4011 = fma(_4001, _3985, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4013 = fma(_4001, _3989, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4015 = fma(_4001, _3993, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4017 = fma(_4001, _3997, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3921 = _4011;
            _3903 = _4015;
            _3927 = _4007;
            _3957 = _4013;
            _3935 = _4009;
            _3947 = _4017;
            _4019 = true;
        }
        else
        {
            bool _4021 = _3555 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4023 = isnan(_3555);
            bool _4025 = _4021 || _4023;
            bool _4027 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4029 = _4025 || _4027;
            if (!_4029)
            {
                _3925 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4031 = _3925;
            _3927 = _4031;
            if (!_4029)
            {
                _3919 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4033 = _3919;
            _3921 = _4033;
            if (!_4029)
            {
                _3933 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4035 = _3933;
            _3935 = _4035;
            if (!_4029)
            {
                _3955 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4037 = _3955;
            _3957 = _4037;
            if (!_4029)
            {
                _3901 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4039 = _3901;
            _3903 = _4039;
            if (!_4029)
            {
                _3945 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4041 = _3945;
            bool _4043 = !_4029;
            _3947 = _4041;
            if (!_4043)
            {
                bool _4045 = _3555 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4047 = isnan(_3555);
                bool _4049 = _4045 || _4047;
                bool _4051 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4053 = _4049 || _4051;
                if (!_4053)
                {
                    float _4055 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4057 = _3555 + _4055;
                    float _4059 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4061 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4059;
                    float _4063 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4065 = _4063 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4067 = 1.0 / _4061;
                    float _4069 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4071 = _4069 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4073 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4075 = _4073 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4077 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4079 = _4077 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4081 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4083 = _4081 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4085 = _4057 * _4067;
                    float _4087 = precise::clamp(_4085, 0.0, 1.0);
                    float _4089 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4091 = _4089 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4093 = fma(_4087, _4065, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4095 = fma(_4087, _4091, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4097 = fma(_4087, _4071, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4099 = fma(_4087, _4075, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4101 = fma(_4087, _4079, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4103 = fma(_4087, _4083, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3921 = _4097;
                    _3903 = _4101;
                    _3927 = _4093;
                    _3957 = _4099;
                    _3935 = _4095;
                    _3947 = _4103;
                    _4019 = true;
                }
                else
                {
                    _3921 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3903 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3927 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3957 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3935 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3947 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4019 = false;
    float _4105 = _3921;
    float _4107 = _3903;
    float _4109 = _3927;
    float _4111 = _3957;
    float _4113 = _3935;
    float _4115 = _3947;
    float _4117 = fma(_2738, -0.5, 0.5);
    float _4119 = precise::clamp(_4117, 0.0, 1.0);
    float _4121 = -_4105;
    float _4123 = _4121 + _4107;
    float _4125 = -_4109;
    float _4127 = _4125 + _4111;
    float _4129 = -_4113;
    float _4131 = _4129 + _4115;
    bool _4133 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4135 = fma(_4119, _4123, _4105);
    float _4137 = fma(_4119, _4127, _4109);
    float _4139 = fma(_4119, _4131, _4113);
    float _4141 = _4135 * 0.586610972881317138671875;
    out.m_104.x = 0.0;
    float _4143 = fma(_4137, 0.298911988735198974609375, _4141);
    float _4145 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4147 = fma(_4139, 0.114477999508380889892578125, _4143);
    out.m_63.x = _4145;
    float _4149 = -_4147;
    float _4151 = _4137 + _4149;
    float _4153 = -_4147;
    float _4155 = _4135 + _4153;
    float _4157 = -_4147;
    float _4159 = _4139 + _4157;
    float _4161 = fma(_4151, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4147);
    float _4163 = fma(_4155, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4147);
    float _4165 = fma(_4159, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4147);
    out.m_106.x = _4161;
    out.m_106.y = _4163;
    out.m_106.z = _4165;
    if (!_4133)
    {
        return out;
    }
    float _4167 = -_3152;
    float _4169 = _4167 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4171 = -_3154;
    float _4173 = _4171 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4175 = -_3158;
    float _4177 = _4175 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4179 = _4169 * _4169;
    float _4181 = fma(_4173, _4173, _4179);
    float _4183 = fma(_4177, _4177, _4181);
    float _4185 = sqrt(_4183);
    float _4187 = rsqrt(_4183);
    float _4189 = -_4185;
    float _4191 = _4189 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4193 = _4191 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4195 = precise::clamp(_4193, 0.0, 1.0);
    float _4197 = _4173 * _4187;
    float _4199 = _4169 * _4187;
    float _4201 = abs(_4195);
    float _4203 = log2(_4201);
    float _4205 = _4177 * _4187;
    float _4207 = _4197 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4209 = _2738 * _4199;
    float _4211 = -_4199;
    float _4213 = -_4207;
    float _4215 = fma(_4211, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4213);
    float _4217 = fma(_2732, _4197, _4209);
    float _4219 = -_4205;
    float _4221 = fma(_4219, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4215);
    float _4223 = fma(_2740, _4205, _4217);
    float _4225 = precise::clamp(_4223, 0.0, 1.0);
    float _4227 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4229 = _4221 + _4227;
    float _4231 = _4203 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4233 = _4229 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4235 = precise::clamp(_4233, 0.0, 1.0);
    float _4237 = exp2(_4231);
    float _4239 = _4237 * _4235;
    float _4241 = _4225 * _4239;
    float _4243 = _4241 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4245 = _4241 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4247 = _4241 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_104.x = _4243;
    out.m_104.y = _4245;
    out.m_104.z = _4247;
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
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4019 = false;
    bool _2788 = false;
    bool _221 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _120 = in.m_60.w;
    float _122 = trunc(_120);
    int _125 = int(_122);
    bool _129 = _125 >= 1;
    float _131 = 0.0;
    if (!_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    float _135 = _133;
    if (!_129)
    {
        out.m_63.x = 0.0;
    }
    int _137 = 0;
    if (!_129)
    {
        float _139 = _133 * 5.0;
        _137 = as_type<int>(_139);
    }
    int _141 = _137;
    int _143 = _141;
    if (!_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4304 = as_type<float>(_141);
        out.gl_Position.z = _4304;
    }
    if (!_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = in.m_65.w;
    bool _147 = _145 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _149 = isnan(_145);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _155 = _151 || _153;
    float _157 = -_145;
    float _159 = _157 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _161 = _159;
    if (_155)
    {
        float _163 = float(_125);
        _135 = _163;
    }
    float _165 = _135;
    bool _167 = _159 >= _165;
    bool _169 = !_155;
    bool _171 = _167 || _169;
    float _173 = _165;
    if (_171)
    {
        _173 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _175 = _173;
    if (_171)
    {
        out.m_63.x = 0.0;
    }
    if (_171)
    {
        float _177 = _175 * 5.0;
        _143 = as_type<int>(_177);
    }
    int _179 = _143;
    if (_171)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4374 = as_type<float>(_179);
        out.gl_Position.z = _4374;
    }
    if (_171)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _181 = as_type<float>(int(gl_VertexIndex));
    bool _183 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _185 = as_type<int>(_181) & 1;
    bool _187 = _185 != 0;
    int _189 = as_type<int>(_181) & 2;
    bool _191 = _189 != 0;
    bool _193 = !_187;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_191;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_183;
    float _219;
    if (!_201)
    {
        float _203 = in.m_70.x;
        float _205 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _207 = _203 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _209 = fma(_207, (*spvDescriptorSet0.vp_c9)._m0[12].x, _159);
        float _211 = _209 * _205;
        float _213 = floor(_211);
        float _215 = -_213;
        float _217 = _211 + _215;
        _219 = _217;
        _221 = true;
    }
    else
    {
        float _223 = float(_125);
        float _225 = 1.0 / _223;
        float _227 = _159 * _225;
        _219 = _227;
    }
    _221 = false;
    float _229 = _219;
    float _231 = in.m_70.x;
    float _233 = in.m_70.y;
    float _235 = in.m_70.z;
    float _237 = in.m_70.w;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _241 = _229 + _239;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _245 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _243;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _249 = _247 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _251;
    float _255 = 1.0 / _245;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _259 = _257 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    int _261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _263 = _261 != 0;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _267 = 1.0 / _249;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _271;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _277 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _275;
    float _279 = _233 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _281 = _231 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _283 = 1.0 / _253;
    float _285 = _231 * 2.0;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _289 = _229 + _287;
    float _291 = -_269;
    float _293 = fma(_281, 2.0, _291);
    float _295 = _233 * 2.0;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _299 = _297 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _301 = floor(_285);
    float _303 = fma(_279, -2.0, _265);
    float _305 = _235 * 2.0;
    float _307 = _289 * _255;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _311 = _229 + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _313;
    float _317 = fma(_273, _307, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _319 = floor(_305);
    float _321 = _311 * _267;
    float _323 = _231 + _233;
    float _325 = fma(_277, _307, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _331 = _323 + (-1.0);
    float _333 = _235 + _233;
    float _335 = floor(_295);
    bool _337 = _301 > 0.0;
    float _339 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _341 = _333 + (-1.0);
    bool _343 = _301 >= 0.0;
    bool _345 = isnan(_301);
    bool _347 = _343 || _345;
    bool _349 = isnan(0.0);
    bool _351 = _347 || _349;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _355 = float(_125);
    float _357 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _359 = 1.0 / _259;
    bool _361 = _319 > 0.0;
    float _363 = fma(_299, _321, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _365 = as_type<int>(_341);
    if (_263)
    {
        _365 = 0;
    }
    int _367 = _365;
    float _369 = fma(_329, _321, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _371 = _319 >= 0.0;
    bool _373 = isnan(_319);
    bool _375 = _371 || _373;
    bool _377 = isnan(0.0);
    bool _379 = _375 || _377;
    int _381 = _367;
    if (!_263)
    {
        _381 = 1;
    }
    int _383 = _381;
    float _385 = 1.0 / _355;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _389 = _229 + _387;
    bool _391 = _335 > 0.0;
    bool _393 = _335 >= 0.0;
    bool _395 = isnan(_335);
    bool _397 = _393 || _395;
    bool _399 = isnan(0.0);
    bool _401 = _397 || _399;
    float _403 = _389 * _283;
    float _405 = _235 + _231;
    int _407 = _351 ? 0 : 1;
    float _409 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _411 = int(_409);
    bool _413 = _383 != 1;
    float _415 = _405 + (-1.0);
    int _417 = _379 ? 0 : 1;
    float _419 = fma(_315, _403, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _421 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _423 = _401 ? 0 : 1;
    float _425 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _427 = int(_425);
    int _429 = ~_407;
    int _431 = _429 + 1;
    int _433 = _431 + 1;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _435;
    int _439 = _433;
    float _441 = as_type<float>(_383);
    if (!_337)
    {
        int _443 = ~_407;
        int _445 = _443 + 1;
        _439 = _445;
    }
    int _447 = _439;
    float _449 = _241 * _359;
    int _451 = ~_417;
    int _453 = _451 + 1;
    int _455 = _453 + 1;
    float _457 = fma(_437, _403, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    int _459 = _455;
    if (!_361)
    {
        int _461 = ~_417;
        int _463 = _461 + 1;
        _459 = _463;
    }
    int _465 = _459;
    float _467 = _385 * _159;
    int _469 = ~_423;
    int _471 = _469 + 1;
    int _473 = _471 + 1;
    int _475 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _477 = _475 != 0;
    int _479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _481 = _479 != 0;
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _485 = _483 != 0;
    int _487 = _473;
    if (!_391)
    {
        int _489 = ~_423;
        int _491 = _489 + 1;
        _487 = _491;
    }
    int _493 = _487;
    float _495 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _497 = log2(_495);
    bool _499 = !_481;
    int _501 = _499 ? 0 : 1;
    bool _503 = !_477;
    int _505 = _503 ? 0 : 1;
    bool _507 = !_485;
    int _509 = _507 ? 0 : 1;
    int _511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _513 = _511 != 0;
    int _515 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _517 = _515 != 0;
    int _519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _521 = _519 != 0;
    float _523 = float(_427);
    float _525 = as_type<float>(_427);
    if (!_413)
    {
        _525 = _233;
    }
    float _527 = _525;
    float _529 = _527;
    if (_413)
    {
        _529 = _231;
    }
    float _531 = _529;
    float _533 = 1.0 / _523;
    bool _535 = !_513;
    float _537 = _535 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _539 = _531 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _541 = _537;
    if (!_413)
    {
        _441 = _233;
    }
    float _543 = _441;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _547 = _543;
    if (_413)
    {
        _547 = _231;
    }
    float _549 = _547;
    float _551 = -_353;
    float _553 = fma(_539, 2.0, _551);
    float _555 = _497 * _159;
    int _557 = abs(as_type<int>(_537));
    float _559 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[83].z, _545);
    float _561 = _549;
    if (!_413)
    {
        _541 = _235;
    }
    float _563 = _541;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _567 = _563;
    if (_413)
    {
        _567 = _233;
    }
    float _569 = _567;
    float _571 = exp2(_555);
    if (!_413)
    {
        _561 = _235;
    }
    float _573 = _561;
    float _575 = _533 * _159;
    float _577 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[83].w, _565);
    float _579 = _573;
    if (_413)
    {
        _579 = _233;
    }
    float _581 = _579;
    float _583 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[82].z, _559);
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _587 = float(_411);
    float _589 = _581 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _591 = float(_557);
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _595 = 1.0 + _593;
    float _597 = 1.0 / _587;
    float _599 = fma(_589, -2.0, _585);
    float _601 = float(_465);
    float _603 = -_159;
    float _605 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[76].x, _293);
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _609 = 1.0 / _595;
    float _611 = _591 * _601;
    bool _613 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _615 = isnan(1.0);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _621 = _617 || _619;
    float _623 = in.m_72.x;
    float _625 = in.m_72.y;
    float _627 = in.m_72.z;
    float _629 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[78].z, _607);
    float _631 = -_571;
    float _633 = _631 + 1.0;
    bool _635 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _637 = isnan(0.0);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _643 = _639 || _641;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _647 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _649 = isnan(_229);
    bool _651 = _647 || _649;
    bool _653 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _655 = _651 || _653;
    float _657 = float(_655);
    float _659 = _597 * _159;
    float _661 = _643 ? _633 : 0.0;
    float _663 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[78].w, _645);
    bool _665 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _667 = isnan(_229);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[76].y, _303);
    float _679 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[82].w, _577);
    float _681 = -_657;
    float _683 = _681 + 1.0;
    float _685 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[77].z, _629);
    float _687 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[77].w, _663);
    float _689 = -_159;
    float _691 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[81].x, _553);
    float _693 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[81].y, _599);
    if (_621)
    {
        float _695 = _661 * _609;
        _161 = _695;
    }
    float _697 = _161;
    float _699 = _611 * (-2.0);
    bool _701 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _703 = isnan(_229);
    bool _705 = _701 || _703;
    bool _707 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _709 = _705 || _707;
    float _711 = float(_709);
    float _713 = -_675;
    float _715 = _713 + 1.0;
    float _717 = _675 * _683;
    float _719 = fma(_339, _699, _339);
    bool _721 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _723 = isnan(_229);
    bool _725 = _721 || _723;
    bool _727 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _729 = _725 || _727;
    float _731 = float(_729);
    float _733 = _711 * _715;
    bool _735 = !_517;
    int _737 = _735 ? 0 : 1;
    float _739 = -_711;
    float _741 = _739 + 1.0;
    bool _743 = !_521;
    int _745 = _743 ? 0 : 1;
    float _747 = fma(_699, _623, _623);
    int _749 = abs(_737);
    bool _751 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _753 = isnan(_229);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _759 = _755 || _757;
    float _761 = float(_759);
    float _763 = _731 * _741;
    int _765 = abs(_745);
    float _767 = _231 + (-0.5);
    float _769 = float(_447);
    float _771 = -_731;
    float _773 = _771 + 1.0;
    float _775 = float(_749);
    float _777 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[196].x, _747);
    float _779 = float(_493);
    float _781 = _761 * _773;
    float _783 = -_761;
    float _785 = _783 + 1.0;
    float _787 = _775 * _769;
    float _789 = fma(_719, _697, _777);
    float _791 = _325 * _781;
    float _793 = _317 * _781;
    float _795 = _787 * (-2.0);
    float _797 = float(_765);
    float _799 = _233 + (-0.5);
    float _801 = fma(_785, (*spvDescriptorSet0.vp_c9)._m0[143].y, _791);
    float _803 = fma(_795, _625, _625);
    float _805 = fma(_357, _795, _357);
    float _807 = _797 * _779;
    float _809 = fma(_369, _763, _801);
    float _811 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[196].y, _803);
    float _813 = fma(_785, (*spvDescriptorSet0.vp_c9)._m0[143].x, _793);
    float _815 = _807 * (-2.0);
    float _817 = in.m_74.x;
    float _819 = in.m_74.y;
    float _821 = fma(_805, _697, _811);
    float _823 = _789 * 0.15915493667125701904296875;
    float _825 = fma(_815, _627, _627);
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _829 = _827 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _831 = _821 * 0.15915493667125701904296875;
    float _833 = _235 + (-0.5);
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _837 = _835 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _839 = fma(_363, _763, _813);
    float _841 = fma(_421, _815, _421);
    float _843 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[196].z, _825);
    float _845 = in.m_60.x;
    float _847 = in.m_60.y;
    float _849 = in.m_60.z;
    float _851 = fma(_829, _449, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _853 = fma(_837, _449, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _855 = fma(_457, _733, _809);
    float _857 = in.m_76.x;
    float _859 = in.m_76.y;
    float _861 = in.m_76.z;
    float _863 = fma(_419, _733, _839);
    float _865 = fma(_841, _697, _843);
    float _867 = fma(_853, _717, _855);
    float _869 = _823 * 6.283185482025146484375;
    float _871 = cos(_869);
    float _873 = fma(_851, _717, _863);
    float _875 = _865 * 0.15915493667125701904296875;
    float _877 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[147].y, _867);
    float _879 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[147].x, _873);
    float _881 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _883 = _877 * _819;
    float _885 = _831 * 6.283185482025146484375;
    float _887 = sin(_885);
    float _889 = _879 * _817;
    float _891 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _893 = _883 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _895 = _889 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _897 = in.m_78.x;
    float _899 = in.m_78.y;
    float _901 = in.m_78.z;
    float _903 = _831 * 6.283185482025146484375;
    float _905 = cos(_903);
    float _907 = _895 * _881;
    float _909 = _893 * _891;
    float _911 = _847 * _859;
    float _913 = _823 * 6.283185482025146484375;
    float _915 = sin(_913);
    float _917 = fma(_845, _857, _911);
    float _919 = _871 * _887;
    float _921 = fma(_849, _861, _917);
    float _923 = _875 * 6.283185482025146484375;
    float _925 = cos(_923);
    float _927 = _871 * _905;
    float _929 = _875 * 6.283185482025146484375;
    float _931 = sin(_929);
    float _933 = _915 * _887;
    float _935 = _915 * _905;
    float _937 = _871 * _925;
    float _939 = _915 * _925;
    float _941 = _905 * _925;
    float _943 = _887 * _925;
    float _945 = _937 * _909;
    float _947 = _939 * _909;
    float _949 = fma(_931, _927, _933);
    float _951 = -_919;
    float _953 = fma(_931, _935, _951);
    float _955 = -_935;
    float _957 = fma(_931, _919, _955);
    float _959 = -_909;
    float _961 = _931 * _959;
    float _963 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _965 = fma(_949, _907, _945);
    float _967 = fma(_931, _933, _927);
    float _969 = fma(_941, _907, _961);
    float _971 = _847 * _899;
    float _973 = fma(_957, _963, _965);
    float _975 = fma(_953, _907, _947);
    float _977 = fma(_943, _963, _969);
    float _979 = fma(_845, _897, _971);
    float _981 = _973 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _983 = _973 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _985 = fma(_967, _963, _975);
    float _987 = fma(_849, _901, _979);
    float _989 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[24].x, _981);
    float _991 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[26].x, _983);
    float _993 = _921 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _995 = _987 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _997 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[24].z, _989);
    float _999 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[26].z, _991);
    float _1001 = _997 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1003 = _999 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1005 = _993 + _1001;
    float _1007 = _995 + _1003;
    float _1009 = in.m_80.x;
    float _1011 = in.m_80.y;
    float _1013 = in.m_80.z;
    float _1015 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1017 = _1005 + _1015;
    float _1019 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1021 = _1007 + _1019;
    float _1023 = _1017 * _1017;
    float _1025 = _1021 * _1021;
    float _1027 = _1023 + _1025;
    float _1029 = sqrt(_1027);
    float _1031 = _847 * _1011;
    float _1033 = fma(_845, _1009, _1031);
    bool _1035 = _1029 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1037 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1039 = _1029 + _1037;
    float _1041 = fma(_849, _1013, _1033);
    float _1043 = _947;
    float _1045 = _1027;
    float _1047 = _1039;
    float _1049 = _973;
    float _1051 = _847;
    float _1053 = _1005;
    float _1055 = _1007;
    float _1057 = _1023;
    float _1059 = _1025;
    if (_1035)
    {
        float _1061 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1043 = _1061;
    }
    float _1063 = _1043;
    if (_1035)
    {
        float _1065 = rsqrt(_1027);
        _1045 = _1065;
    }
    float _1067 = _1045;
    float _1069 = _1067;
    if (_1035)
    {
        float _1071 = _1039 * _1063;
        _1047 = _1071;
    }
    float _1073 = _1047;
    float _1075 = _973 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (_1035)
    {
        float _1077 = _1073 * 0.15915493667125701904296875;
        _1049 = _1077;
    }
    float _1079 = _1049;
    float _1081 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1075);
    float _1083 = _1041 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1085 = _845;
    if (_1035)
    {
        float _1087 = _1079 * 6.283185482025146484375;
        float _1089 = sin(_1087);
        _1085 = _1089;
    }
    float _1091 = _1085;
    float _1093 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1081);
    float _1095 = _1093 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1097 = _1083 + _1095;
    float _1099 = _1097;
    if (_1035)
    {
        float _1101 = _1097 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1051 = _1101;
    }
    float _1103 = _1051;
    float _1105 = _1091;
    if (_1035)
    {
        float _1107 = fma(_1091, _1103, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1105 = _1107;
    }
    float _1109 = _1105;
    float _1111 = _1109;
    if (_1035)
    {
        float _1113 = _1067 * _1109;
        _1111 = _1113;
    }
    float _1115 = _1111;
    if (_1035)
    {
        float _1117 = fma(_1017, _1115, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1053 = _1117;
    }
    float _1119 = _1053;
    if (_1035)
    {
        float _1121 = fma(_1021, _1115, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1055 = _1121;
    }
    float _1123 = _1055;
    float _1125 = fma(_1119, 6.2500002968590706586837768554688e-05, 0.5);
    float _1127 = fma(_1123, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5842 = float2(_1125, _1127);
    float3 _1131 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5842, float2(0.0), isnan(_5842)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5842, float2(0.0), isnan(_5842)), level(0.0)).xyz;
    float _1133 = _1131.x;
    float _1135 = _1131.y;
    float _1137 = _1131.z;
    float _1139 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1141 = int(_1139);
    if (_263)
    {
        float _1143 = in.m_70.x;
        _1069 = _1143;
    }
    float _1145 = _1069;
    float _1147 = -_583;
    float _1149 = _1147 + 1.0;
    float _1151 = -_685;
    float _1153 = _1151 + 1.0;
    float _1155 = _1145;
    if (!_263)
    {
        float _1157 = in.m_70.y;
        _1155 = _1157;
    }
    float _1159 = _1155;
    float _1161 = -_687;
    float _1163 = _1161 + 1.0;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1167 = trunc(_575);
    int _1169 = int(_1167);
    float _1171 = -_679;
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
    float _1195 = trunc(_659);
    int _1197 = int(_1195);
    int _1199 = ~_1179;
    int _1201 = _1199 + 1;
    bool _1203 = _1179 == 0;
    int _1205 = as_type<int>(_1191) + (-2);
    float _1207 = 1.0 / _1193;
    float _1209 = _1191;
    if (_263)
    {
        _1209 = 1.0;
    }
    float _1211 = _1209;
    float _1213 = _1211;
    if (!_263)
    {
        _1213 = 7.345489978790283203125;
    }
    float _1215 = _1213;
    float _1217 = as_type<float>(_1205) * _1189;
    float _1219 = trunc(_1217);
    float _1221 = precise::max(_1219, 0.0);
    uint _1224 = uint(_1221);
    float _1226 = _1215 * _231;
    int _1228 = as_type<int>(_1207) + (-2);
    float _1230 = float(uint(_1197));
    int _1232 = _1183 * int(_1224);
    int _1234 = _1232 + _1169;
    float _1236 = as_type<float>(_1228) * _1230;
    float _1238 = float(_1169);
    float _1240 = float(uint(_1234));
    float _1242 = floor(_1226);
    bool _1244 = _1238 >= _1185;
    bool _1246 = isnan(_1238);
    bool _1248 = _1244 || _1246;
    bool _1250 = isnan(_1185);
    bool _1252 = _1248 || _1250;
    float _1254 = float(_1252);
    float _1256 = as_type<float>(_1205) * _1240;
    float _1258 = trunc(_1236);
    float _1260 = precise::max(_1258, 0.0);
    uint _1262 = uint(_1260);
    float _1264 = trunc(_1256);
    float _1266 = precise::max(_1264, 0.0);
    uint _1268 = uint(_1266);
    float _1270 = -_1242;
    float _1272 = _1226 + _1270;
    int _1274 = ~_1141;
    int _1276 = _1274 + 1;
    float _1278 = _1272 * _1185;
    int _1280 = _1201 * int(_1262);
    int _1282 = _1280 + _1197;
    float _1284 = trunc(_1254);
    int _1286 = int(_1284);
    float _1288 = float(uint(_1282));
    int _1290 = int(_1224) + int(_1268);
    float _1292 = as_type<float>(_1228) * _1288;
    float _1294 = trunc(_1278);
    int _1296 = int(_1294);
    int _1298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1300 = _1298 != 0;
    float _1302 = as_type<float>(_1276);
    if (_263)
    {
        _1302 = 1.0;
    }
    float _1304 = _1302;
    int _1306 = _1276 * _1290;
    int _1308 = _1306 + _1169;
    float _1310 = _1304;
    if (!_263)
    {
        _1310 = 1.2345600128173828125;
    }
    float _1312 = _1310;
    bool _1314 = !_1300;
    int _1316 = _1314 ? 0 : 1;
    bool _1318 = uint(_1308) >= uint(_1141);
    float _1320 = _1312 * _1159;
    float _1322 = trunc(_1292);
    float _1324 = precise::max(_1322, 0.0);
    uint _1326 = uint(_1324);
    int _1328 = abs(_1316);
    bool _1330 = !_1318;
    int _1332 = _1330 ? 0 : (-1);
    int _1334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1336 = _1334 != 0;
    int _1338 = ~_1290;
    int _1340 = _1338 + _1332;
    int _1342 = _1340 + 1;
    float _1344 = _1185 * _467;
    int _1346 = ~_1179;
    int _1348 = _1346 + 1;
    int _1350 = abs(_505);
    int _1352 = _1141 * _1342;
    int _1354 = _1352 + _1169;
    float _1356 = trunc(_1344);
    int _1358 = int(_1356);
    int _1360 = ~_1286;
    int _1362 = _1360 + 1;
    int _1364 = _1362 + 1;
    bool _1366 = !_1187;
    int _1368 = _1366 ? _1354 : (-1);
    int _1370 = _1296 * _1328;
    int _1372 = _1370 + _1169;
    int _1374 = int(_1262) + int(_1326);
    int _1376 = _1141 + (-1);
    int _1378 = _1368 * _1364;
    int _1380 = abs(_501);
    int _1382 = _1348 * _1374;
    int _1384 = _1382 + _1197;
    float _1386 = floor(_1320);
    int _1388 = _1286 * _1376;
    int _1390 = _1388 + _1378;
    float _1392 = float(_1179);
    float _1394 = float(_1197);
    bool _1396 = uint(_1384) >= uint(_1179);
    int _1398 = _1390 * _1380;
    bool _1400 = _1394 >= _1392;
    bool _1402 = isnan(_1394);
    bool _1404 = _1400 || _1402;
    bool _1406 = isnan(_1392);
    bool _1408 = _1404 || _1406;
    float _1410 = float(_1408);
    int _1412 = abs(_509);
    bool _1414 = !_1396;
    int _1416 = _1414 ? 0 : (-1);
    float _1418 = trunc(_1410);
    int _1420 = int(_1418);
    float _1422 = -_1386;
    float _1424 = _1320 + _1422;
    int _1426 = ~_1374;
    int _1428 = _1426 + _1416;
    int _1430 = _1428 + 1;
    bool _1432 = !_1336;
    int _1434 = _1432 ? 0 : 1;
    int _1436 = _1358 * _1350;
    int _1438 = _1436 + _1398;
    float _1440 = _1424 * _1392;
    int _1442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1444 = _1442 != 0;
    int _1446 = _1179 * _1430;
    int _1448 = _1446 + _1197;
    int _1450 = abs(_1434);
    int _1452 = _1372 * _1412;
    int _1454 = _1452 + _1438;
    bool _1456 = !_1444;
    int _1458 = _1456 ? 0 : 1;
    float _1460 = trunc(_1440);
    int _1462 = int(_1460);
    int _1464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1466 = _1464 != 0;
    int _1468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1470 = _1468 != 0;
    int _1472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1474 = _1472 != 0;
    int _1476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1478 = _1476 != 0;
    float _1480 = _1392 * _467;
    int _1482 = _1296 * _1450;
    int _1484 = _1482 + _1454;
    int _1486 = ~_1420;
    int _1488 = _1486 + 1;
    int _1490 = _1488 + 1;
    bool _1492 = !_1203;
    int _1494 = _1492 ? _1448 : (-1);
    float _1496 = trunc(_1480);
    int _1498 = int(_1496);
    bool _1500 = !_1470;
    int _1502 = _1500 ? 0 : 1;
    float _1504 = float(uint(_1484));
    int _1506 = _1494 * _1490;
    int _1508 = abs(_1458);
    int _1510 = _1179 + (-1);
    float _1512 = as_type<float>(_1205) * _1504;
    bool _1514 = !_1466;
    int _1516 = _1514 ? 0 : 1;
    int _1518 = abs(_1502);
    int _1520 = _1420 * _1510;
    int _1522 = _1520 + _1506;
    int _1524 = abs(_1516);
    float _1526 = trunc(_1512);
    float _1528 = precise::max(_1526, 0.0);
    uint _1530 = uint(_1528);
    int _1532 = _1462 * _1508;
    int _1534 = _1532 + _1197;
    bool _1536 = !_1474;
    int _1538 = _1536 ? 0 : 1;
    int _1540 = _1522 * _1518;
    int _1542 = ~_1141;
    int _1544 = _1542 + 1;
    float _1546 = float(uint(_1372));
    int _1548 = _1498 * _1524;
    int _1550 = _1548 + _1540;
    bool _1552 = !_1478;
    int _1554 = _1552 ? 0 : 1;
    int _1556 = abs(_1538);
    float _1558 = as_type<float>(_1205) * _1546;
    int _1560 = abs(_1554);
    int _1562 = _1534 * _1556;
    int _1564 = _1562 + _1550;
    float _1566 = trunc(_1558);
    float _1568 = precise::max(_1566, 0.0);
    uint _1570 = uint(_1568);
    int _1572 = _1544 * int(_1530);
    int _1574 = _1572 + _1484;
    float _1576 = float(uint(_1534));
    int _1578 = _1462 * _1560;
    int _1580 = _1578 + _1564;
    int _1582 = ~_1179;
    int _1584 = _1582 + 1;
    float _1586 = float(uint(_1574));
    float _1588 = as_type<float>(_1228) * _1576;
    float _1590 = float(uint(_1580));
    int _1592 = ~_1141;
    int _1594 = _1592 + 1;
    float _1596 = trunc(_1588);
    float _1598 = precise::max(_1596, 0.0);
    uint _1600 = uint(_1598);
    float _1602 = as_type<float>(_1205) * _1586;
    float _1604 = as_type<float>(_1228) * _1590;
    int _1606 = _1594 * int(_1570);
    int _1608 = _1606 + _1372;
    float _1610 = trunc(_1602);
    float _1612 = precise::max(_1610, 0.0);
    uint _1614 = uint(_1612);
    int _1616 = ~_1179;
    int _1618 = _1616 + 1;
    float _1620 = float(uint(_1608));
    float _1622 = trunc(_1604);
    float _1624 = precise::max(_1622, 0.0);
    uint _1626 = uint(_1624);
    int _1628 = _1584 * int(_1600);
    int _1630 = _1628 + _1534;
    float _1632 = as_type<float>(_1205) * _1620;
    int _1634 = ~_1141;
    int _1636 = _1634 + 1;
    float _1638 = float(uint(_1630));
    float _1640 = trunc(_1632);
    float _1642 = precise::max(_1640, 0.0);
    uint _1644 = uint(_1642);
    int _1646 = int(_1530) + int(_1614);
    float _1648 = as_type<float>(_1228) * _1638;
    int _1650 = _1618 * int(_1626);
    int _1652 = _1650 + _1580;
    float _1654 = trunc(_1648);
    float _1656 = precise::max(_1654, 0.0);
    uint _1658 = uint(_1656);
    int _1660 = _1636 * _1646;
    int _1662 = _1660 + _1484;
    float _1664 = float(uint(_1652));
    bool _1666 = uint(_1662) >= uint(_1141);
    int _1668 = int(_1570) + int(_1644);
    float _1670 = as_type<float>(_1228) * _1664;
    bool _1672 = !_1666;
    int _1674 = _1672 ? 0 : (-1);
    int _1676 = ~_1179;
    int _1678 = _1676 + 1;
    float _1680 = trunc(_1670);
    float _1682 = precise::max(_1680, 0.0);
    uint _1684 = uint(_1682);
    int _1686 = ~_1646;
    int _1688 = _1686 + _1674;
    int _1690 = _1688 + 1;
    int _1692 = int(_1600) + int(_1658);
    int _1694 = _1141 * _1690;
    int _1696 = _1694 + _1484;
    int _1698 = ~_1141;
    int _1700 = _1698 + 1;
    int _1702 = _1678 * _1692;
    int _1704 = _1702 + _1534;
    int _1706 = ~_1179;
    int _1708 = _1706 + 1;
    bool _1710 = !_1187;
    int _1712 = _1710 ? _1696 : (-1);
    int _1714 = _1700 * _1668;
    int _1716 = _1714 + _1372;
    int _1718 = _1712 & 3;
    bool _1720 = _1718 != 0;
    int _1722 = int(_1626) + int(_1684);
    int _1724 = _1712 & 3;
    bool _1726 = _1724 != 0;
    bool _1728 = uint(_1718) >= 2u;
    int _1730 = _1708 * _1722;
    int _1732 = _1730 + _1580;
    int _1734 = _1726 ? 0 : 1;
    bool _1736 = uint(_1716) >= uint(_1141);
    int _1738 = _1728 ? 0 : 1;
    bool _1740 = uint(_1732) >= uint(_1179);
    bool _1742 = uint(_1718) > 1u;
    bool _1744 = !_1736;
    int _1746 = _1744 ? 0 : (-1);
    bool _1748 = !_1740;
    int _1750 = _1748 ? 0 : (-1);
    int _1752 = ~_1668;
    int _1754 = _1752 + _1746;
    int _1756 = _1754 + 1;
    int _1758 = ~_1722;
    int _1760 = _1758 + _1750;
    int _1762 = _1760 + 1;
    bool _1764 = _237 > 0.5;
    int _1766 = _1141 * _1756;
    int _1768 = _1766 + _1372;
    int _1770 = ~_1734;
    int _1772 = _1770 + 1;
    int _1774 = _1772 + 1;
    int _1776 = _1179 * _1762;
    int _1778 = _1776 + _1580;
    int _1780 = _1774;
    if (!_1742)
    {
        int _1782 = ~_1734;
        int _1784 = _1782 + 1;
        _1780 = _1784;
    }
    int _1786 = _1780;
    float _1788 = -_199;
    int _1790 = _1764 ? as_type<int>(_1788) : as_type<int>(_199);
    int _1792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1794 = _1792 != 0;
    bool _1796 = !_1203;
    int _1798 = _1796 ? _1778 : (-1);
    bool _1800 = _1718 != 3;
    bool _1802 = !_1187;
    int _1804 = _1802 ? _1768 : (-1);
    int _1806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1808 = _1806 != 0;
    bool _1810 = !_1794;
    int _1812 = _1810 ? 0 : 1;
    int _1814 = _1712 >> 31;
    int _1816 = _1798 & 3;
    bool _1818 = _1816 != 0;
    int _1820 = _1798 >> 31;
    bool _1822 = !_1808;
    int _1824 = _1822 ? 0 : 1;
    int _1826 = _1814 & 3;
    bool _1828 = uint(_1704) >= uint(_1179);
    int _1830 = _1798 & 3;
    bool _1832 = _1830 != 0;
    bool _1834 = !_1818;
    float _1836 = _1834 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _1838 = _1820 & 3;
    bool _1840 = uint(_1816) > 1u;
    int _1842 = _1712 + _1826;
    bool _1844 = !_1828;
    int _1846 = _1844 ? 0 : (-1);
    int _1848 = _1832 ? 0 : 1;
    int _1850 = _1798 + _1838;
    int _1852 = ~_1738;
    int _1854 = _1852 + 1;
    int _1856 = _1854 + 1;
    bool _1858 = _1718 != 3;
    int _1860 = _1856;
    float _1862 = _1836;
    if (_1800)
    {
        int _1864 = ~_1738;
        int _1866 = _1864 + 1;
        _1860 = _1866;
    }
    int _1868 = _1860;
    bool _1870 = !_1720;
    int _1872 = _1870 ? 0 : 1;
    int _1874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1876 = _1874 != 0;
    int _1878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1880 = _1878 != 0;
    int _1882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1884 = _1882 != 0;
    int _1886 = _1842 >> 2;
    int _1888 = ~_1692;
    int _1890 = _1888 + _1846;
    int _1892 = _1890 + 1;
    int _1894 = _1850 >> 2;
    bool _1896 = !_1858;
    int _1898 = _1896 ? 0 : (-1);
    int _1900 = _1179 * _1892;
    int _1902 = _1900 + _1534;
    bool _1904 = uint(_1816) >= 2u;
    int _1906 = _1886 << 4;
    int _1908 = _1906 + 368;
    int _1910 = _1894 << 4;
    int _1912 = _1910 + 512;
    int _1914 = ~_1848;
    int _1916 = _1914 + 1;
    int _1918 = _1916 + 1;
    uint _1920 = uint(int(uint(_1908) >> uint(2)));
    uint _1922 = uint(int(uint(int(_1920)) >> uint(2)));
    int _1924 = int(_1920) & 3;
    float _1926 = (*spvDescriptorSet0.vp_c9)._m0[int(_1922)][_1924];
    int _1928 = int(_1920) + 1;
    uint _1930 = uint(int(uint(_1928) >> uint(2)));
    int _1932 = _1928 & 3;
    float _1934 = (*spvDescriptorSet0.vp_c9)._m0[int(_1930)][_1932];
    int _1936 = _1918;
    if (!_1840)
    {
        int _1938 = ~_1848;
        int _1940 = _1938 + 1;
        _1936 = _1940;
    }
    int _1942 = _1936;
    int _1944 = _1904 ? 0 : 1;
    bool _1946 = _1816 != 3;
    bool _1948 = _1816 != 3;
    int _1950 = _1908 + 8;
    uint _1952 = uint(int(uint(_1950) >> uint(2)));
    uint _1954 = uint(int(uint(int(_1952)) >> uint(2)));
    int _1956 = int(_1952) & 3;
    float _1958 = (*spvDescriptorSet0.vp_c9)._m0[int(_1954)][_1956];
    int _1960 = int(_1952) + 1;
    uint _1962 = uint(int(uint(_1960) >> uint(2)));
    int _1964 = _1960 & 3;
    float _1966 = (*spvDescriptorSet0.vp_c9)._m0[int(_1962)][_1964];
    int _1968 = ~_1944;
    int _1970 = _1968 + 1;
    int _1972 = _1970 + 1;
    bool _1974 = !_1203;
    int _1976 = _1974 ? _1902 : (-1);
    uint _1978 = uint(int(uint(_1912) >> uint(2)));
    uint _1980 = uint(int(uint(int(_1978)) >> uint(2)));
    int _1982 = int(_1978) & 3;
    float _1984 = (*spvDescriptorSet0.vp_c9)._m0[int(_1980)][_1982];
    int _1986 = int(_1978) + 1;
    uint _1988 = uint(int(uint(_1986) >> uint(2)));
    int _1990 = _1986 & 3;
    float _1992 = (*spvDescriptorSet0.vp_c9)._m0[int(_1988)][_1990];
    int _1994 = _1972;
    if (_1946)
    {
        int _1996 = ~_1944;
        int _1998 = _1996 + 1;
        _1994 = _1998;
    }
    int _2000 = _1994;
    float _2002 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2004 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2006 = _2004 != 0;
    float _2008 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2010 = _1912 + 8;
    uint _2012 = uint(int(uint(_2010) >> uint(2)));
    uint _2014 = uint(int(uint(int(_2012)) >> uint(2)));
    int _2016 = int(_2012) & 3;
    float _2018 = (*spvDescriptorSet0.vp_c9)._m0[int(_2014)][_2016];
    int _2020 = int(_2012) + 1;
    uint _2022 = uint(int(uint(_2020) >> uint(2)));
    int _2024 = _2020 & 3;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[int(_2022)][_2024];
    float _2028 = _2002 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2030 = abs(_1942);
    float _2032 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2034 = abs(_1786);
    float _2036 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2038 = abs(_1872);
    float _2040 = _2032 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2042 = !_1948;
    int _2044 = _2042 ? 0 : (-1);
    float _2046 = _2036 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2048 = _231 > 0.5;
    bool _2050 = _233 > 0.5;
    out.m_82.x = _2040;
    out.m_82.y = _2028;
    out.m_82.z = _2046;
    out.m_82.w = _2008;
    int _2052 = ~_2034;
    int _2054 = _2052 + 1;
    int _2056 = _2054 + 1;
    float _2058 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2060 = -_195;
    int _2062 = _2048 ? as_type<int>(_2060) : as_type<int>(_195);
    float _2064 = _1165 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2066 = _235 > 0.5;
    float _2068 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2070 = _2056 * as_type<int>(_1934);
    int _2072 = abs(_1868);
    float _2074 = _2058 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2076 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2078 = int(_2076);
    float _2080 = _2068 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2082 = abs(as_type<int>(_1836));
    if (_1035)
    {
        float _2084 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2086 = _1119 + _2084;
        _1862 = _2086;
    }
    float _2088 = _1862;
    int _2090 = ~_2030;
    int _2092 = _2090 + 1;
    int _2094 = _2092 + 1;
    int _2096 = ~_2038;
    int _2098 = _2096 + 1;
    int _2100 = _2098 + 1;
    out.m_84.x = _2064;
    out.m_84.y = _2074;
    out.m_84.z = _2080;
    int _2102 = ~_2082;
    int _2104 = _2102 + 1;
    int _2106 = _2104 + 1;
    int _2108 = _2094 * as_type<int>(_1992);
    int _2110 = abs(_1898);
    int _2112 = _2100 * as_type<int>(_1926);
    int _2114 = _2112 + _2070;
    int _2116 = abs(_2044);
    int _2118 = _2106 * as_type<int>(_1984);
    int _2120 = _2118 + _2108;
    float _2122 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2124 = int(_2122);
    int _2126 = abs(_2000);
    float _2128 = _937 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2130 = ~_2072;
    int _2132 = _2130 + 1;
    int _2134 = _2132 + 1;
    float _2136 = _949 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2138 = _937 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2140 = float(uint(_2078));
    int _2142 = _2134 * as_type<int>(_1958);
    int _2144 = _2142 + _2114;
    int _2146 = ~_2110;
    int _2148 = _2146 + 1;
    int _2150 = _2148 + 1;
    float _2152 = _949 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2154 = ~_2126;
    int _2156 = _2154 + 1;
    int _2158 = _2156 + 1;
    if (_1035)
    {
        float _2160 = _2088 * _2088;
        _1057 = _2160;
    }
    float _2162 = _1057;
    float _2164 = 1.0 / _2140;
    int _2166 = _2150 * as_type<int>(_1966);
    int _2168 = _2166 + _2144;
    int _2170 = abs(_1812);
    int _2172 = _2158 * as_type<int>(_2018);
    int _2174 = _2172 + _2120;
    int _2176 = abs(_2078);
    int _2178 = ~_2170;
    int _2180 = _2178 + 1;
    int _2182 = _2180 + 1;
    int _2184 = ~_2116;
    int _2186 = _2184 + 1;
    int _2188 = _2186 + 1;
    float _2190 = float(uint(_2124));
    int _2192 = _2168 * _2182;
    int _2194 = _2188 * as_type<int>(_2026);
    int _2196 = _2194 + _2174;
    int _2198 = abs(_1824);
    float _2200 = _937 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2202 = _1804 * _2170;
    int _2204 = _2202 + _2192;
    float _2206 = 1.0 / _2190;
    float _2208 = float(uint(_2176));
    float _2210 = -_931;
    float _2212 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2128);
    int _2214 = abs(_2124);
    float _2216 = -_931;
    float _2218 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2200);
    int _2220 = as_type<int>(_2164) + (-2);
    float _2222 = _957 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2224 = float(uint(_2204));
    float _2226 = 1.0 / _2208;
    float _2228 = -_931;
    float _2230 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2138);
    int _2232 = ~_2198;
    int _2234 = _2232 + 1;
    int _2236 = _2234 + 1;
    float _2238 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2212);
    float _2240 = float(uint(_2214));
    float _2242 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2230);
    float _2244 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2218);
    float _2246 = _949 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2248 = as_type<float>(_2220) * _2224;
    int _2250 = _2196 * _2236;
    float _2252 = 1.0 / _2240;
    float _2254 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2246);
    int _2256 = abs(_2204);
    int _2258 = _1976 * _2198;
    int _2260 = _2258 + _2250;
    float _2262 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2136);
    float _2264 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2152);
    int _2266 = as_type<int>(_2206) + (-2);
    float _2268 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2254);
    float _2270 = trunc(_2248);
    float _2272 = precise::max(_2270, 0.0);
    uint _2274 = uint(_2272);
    float _2276 = float(uint(_2260));
    int _2278 = abs(_2260);
    float _2280 = as_type<float>(_2266) * _2276;
    float _2282 = float(uint(_2256));
    float _2284 = as_type<float>(_2196);
    if (_1035)
    {
        float _2286 = _1079 * 6.283185482025146484375;
        float _2288 = cos(_2286);
        _2284 = _2288;
    }
    float _2290 = _2284;
    int _2292 = ~_2078;
    int _2294 = _2292 + 1;
    float _2296 = _957 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2298 = as_type<int>(_2252) + (-2);
    float _2300 = float(uint(_2278));
    bool _2302 = !_1876;
    float _2304 = _2302 ? _199 : as_type<float>(_1790);
    float _2306 = trunc(_2280);
    float _2308 = precise::max(_2306, 0.0);
    uint _2310 = uint(_2308);
    int _2312 = as_type<int>(_2226) + (-2);
    float _2314 = _957 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2316 = !_2006;
    float _2318 = _2316 ? _195 : as_type<float>(_2062);
    bool _2320 = _2124 == 0;
    float _2322 = as_type<float>(_2312) * _2282;
    float _2324 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2296);
    int _2326 = _2294 * int(_2274);
    int _2328 = _2326 + _2204;
    float _2330 = as_type<float>(_2298) * _2300;
    float _2332 = trunc(_2322);
    float _2334 = precise::max(_2332, 0.0);
    uint _2336 = uint(_2334);
    float _2338 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2314);
    float _2340 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2222);
    float _2342 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2324);
    float _2344 = float(uint(_2328));
    float _2346 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2338);
    float _2348 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2340);
    int _2350 = ~_2176;
    int _2352 = _2350 + 1;
    float _2354 = trunc(_2330);
    float _2356 = precise::max(_2354, 0.0);
    uint _2358 = uint(_2356);
    int _2360 = ~_2124;
    int _2362 = _2360 + 1;
    float _2364 = as_type<float>(_2220) * _2344;
    float _2366 = as_type<float>(_2352);
    if (_1035)
    {
        float _2368 = _2290 + (-1.0);
        _2366 = _2368;
    }
    float _2370 = _2366;
    int _2372 = ~_2214;
    int _2374 = _2372 + 1;
    int _2376 = _2362 * int(_2310);
    int _2378 = _2376 + _2260;
    int _2380 = _2352 * int(_2336);
    int _2382 = _2380 + _2256;
    float _2384 = _2370;
    if (_1035)
    {
        float _2386 = _2370 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2384 = _2386;
    }
    float _2388 = _2384;
    float _2390 = trunc(_2364);
    float _2392 = precise::max(_2390, 0.0);
    uint _2394 = uint(_2392);
    float _2396 = float(uint(_2378));
    float _2398 = float(uint(_2382));
    if (_1035)
    {
        float _2400 = fma(_1097, _2290, _2388);
        _1099 = _2400;
    }
    float _2402 = _1099;
    float _2404 = -_199;
    int _2406 = _2050 ? as_type<int>(_2404) : as_type<int>(_199);
    int _2408 = _2374 * int(_2358);
    int _2410 = _2408 + _2278;
    float _2412 = as_type<float>(_2312) * _2398;
    bool _2414 = !_1880;
    float _2416 = _2414 ? _199 : as_type<float>(_2406);
    float _2418 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2420 = float(uint(_2410));
    float _2422 = as_type<float>(_2266) * _2396;
    float _2424 = -_195;
    int _2426 = _2066 ? as_type<int>(_2424) : as_type<int>(_195);
    float _2428 = trunc(_2412);
    float _2430 = precise::max(_2428, 0.0);
    uint _2432 = uint(_2430);
    float _2434 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2262);
    float _2436 = as_type<float>(_2298) * _2420;
    bool _2438 = !_1884;
    float _2440 = _2438 ? _195 : as_type<float>(_2426);
    float _2442 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2444 = _2418 * _2242;
    float _2446 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2264);
    float _2448 = _2418 * _2244;
    float _2450 = trunc(_2422);
    float _2452 = precise::max(_2450, 0.0);
    uint _2454 = uint(_2452);
    float _2456 = fma(_2442, _2268, _2444);
    float _2458 = _2444;
    float _2460 = _2440;
    if (_1035)
    {
        float _2462 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2464 = _1123 + _2462;
        _2458 = _2464;
    }
    float _2466 = _2458;
    float _2468 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2470 = _2402 + _2468;
    out.m_86.x = _2268;
    out.m_86.y = _2434;
    out.m_86.z = _2446;
    if (_1035)
    {
        float _2472 = _2466 * _2466;
        _1059 = _2472;
    }
    float _2474 = _1059;
    int _2476 = int(_2274) + int(_2394);
    float _2478 = trunc(_2436);
    float _2480 = precise::max(_2478, 0.0);
    uint _2482 = uint(_2480);
    float _2484 = _2418 * _2238;
    int _2486 = ~_2078;
    int _2488 = _2486 + 1;
    float _2490 = fma(_2470, _2470, _2162);
    bool _2492 = _2124 == 0;
    float _2494 = fma(_2442, _2434, _2484);
    float _2496 = fma(_2442, _2446, _2448);
    int _2498 = ~_2176;
    int _2500 = _2498 + 1;
    int _2502 = int(_2310) + int(_2454);
    int _2504 = ~_2124;
    int _2506 = _2504 + 1;
    int _2508 = int(_2336) + int(_2432);
    int _2510 = int(_2358) + int(_2482);
    int _2512 = _2488 * _2476;
    int _2514 = _2512 + _2204;
    int _2516 = ~_2214;
    int _2518 = _2516 + 1;
    int _2520 = _2500 * _2508;
    int _2522 = _2520 + _2256;
    float _2524 = _2490 + _2474;
    int _2526 = _2506 * _2502;
    int _2528 = _2526 + _2260;
    bool _2530 = uint(_2514) >= uint(_2078);
    int _2532 = _2518 * _2510;
    int _2534 = _2532 + _2278;
    float _2536 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2538 = uint(_2522) >= uint(_2176);
    bool _2540 = uint(_2528) >= uint(_2124);
    bool _2542 = !_2530;
    int _2544 = _2542 ? 0 : (-1);
    bool _2546 = !_2540;
    int _2548 = _2546 ? 0 : (-1);
    float _2550 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2552 = ~_2476;
    int _2554 = _2552 + _2544;
    int _2556 = _2554 + 1;
    bool _2558 = uint(_2534) >= uint(_2214);
    int _2560 = ~_2502;
    int _2562 = _2560 + _2548;
    int _2564 = _2562 + 1;
    int _2566 = _2078 * _2556;
    int _2568 = _2566 + _2204;
    int _2570 = _2204 ^ _2078;
    bool _2572 = !_2558;
    int _2574 = _2572 ? 0 : (-1);
    int _2576 = _2124 * _2564;
    int _2578 = _2576 + _2260;
    bool _2580 = _2078 == 0;
    bool _2582 = !_2538;
    int _2584 = _2582 ? 0 : (-1);
    uint _2586 = uint(int(uint(_2570) >> uint(31)));
    float _2588 = _2550 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2590 = _2078 == 0;
    float _2592 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2594 = _2260 ^ _2124;
    int _2596 = ~_2574;
    int _2598 = _2510 + _2596;
    int _2600 = _2598 + 1;
    int _2602 = ~_2584;
    int _2604 = _2508 + _2602;
    int _2606 = _2604 + 1;
    float _2608 = fma(_2418, _2418, 1.0);
    int _2610 = ~int(_2586);
    int _2612 = _2610 + 1;
    float _2614 = _2536 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2616 = !_2580;
    int _2618 = _2616 ? _2568 : (-1);
    float _2620 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _2622 = uint(int(uint(_2594) >> uint(31)));
    int _2624 = _2606 ^ _2612;
    float _2626 = float(_2618);
    int _2628 = ~int(_2622);
    int _2630 = _2628 + 1;
    int _2632 = ~_2612;
    int _2634 = _2632 + _2624;
    int _2636 = _2634 + 1;
    float _2638 = fma(_2614, _2626, _605);
    bool _2640 = !_2320;
    int _2642 = _2640 ? _2578 : (-1);
    float _2644 = rsqrt(_2608);
    int _2646 = _2600 ^ _2630;
    float _2648 = float(_2642);
    float _2650 = _2592 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2652 = ~_2630;
    int _2654 = _2652 + _2646;
    int _2656 = _2654 + 1;
    float _2658 = _2318 + 0.5;
    bool _2660 = !_2590;
    int _2662 = _2660 ? _2636 : (-1);
    float _2664 = fma(_2650, _2648, _691);
    bool _2666 = !_2492;
    int _2668 = _2666 ? _2656 : (-1);
    float _2670 = fma(_2614, _2658, _2638);
    float _2672 = float(_2662);
    float _2674 = _2440 + 0.5;
    float _2676 = float(_2668);
    float _2678 = _2620 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2680 = -_1153;
    float _2682 = fma(_2318, _2680, _2670);
    float _2684 = -_677;
    float _2686 = fma(_2588, _2672, _2684);
    float _2688 = _2416 + (-0.5);
    float _2690 = fma(_2650, _2674, _2664);
    float _2692 = _2418 * _2644;
    float _2694 = -_693;
    float _2696 = fma(_2678, _2676, _2694);
    float _2698 = -_2588;
    float _2700 = fma(_2698, _2688, _2686);
    float _2702 = _2304 + (-0.5);
    float _2704 = -_2346;
    float _2706 = _2692 * _2704;
    float _2708 = -_2342;
    float _2710 = _2692 * _2708;
    float _2712 = -_2348;
    float _2714 = _2692 * _2712;
    float _2716 = -_2678;
    float _2718 = fma(_2716, _2702, _2696);
    float _2720 = fma(_2644, _2242, _2706);
    float _2722 = fma(_2644, _2238, _2710);
    float _2724 = fma(_2644, _2244, _2714);
    float _2726 = -_1149;
    float _2728 = fma(_2440, _2726, _2690);
    float _2730 = sqrt(_2524);
    float _2732 = _2346 + _2456;
    float _2734 = fma(_2416, _1163, _2700);
    float _2736 = fma(_2304, _1173, _2718);
    float _2738 = _2342 + _2494;
    float _2740 = _2348 + _2496;
    out.m_88.x = _2720;
    out.m_88.y = _2722;
    out.m_88.z = _2724;
    out.m_90.x = _2682;
    out.m_90.y = _2734;
    out.m_90.z = _2728;
    out.m_90.w = _2736;
    out.m_92.x = _1133;
    out.m_92.y = _1135;
    out.m_92.z = _1137;
    bool _2742 = _2730 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2744 = isnan(_2730);
    bool _2746 = _2742 || _2744;
    bool _2748 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2750 = _2746 || _2748;
    out.m_94.x = _2732;
    out.m_94.y = _2738;
    out.m_94.z = _2740;
    float _2752 = _2524;
    if (!_2750)
    {
        _2752 = 1.0;
    }
    float _2754 = _2752;
    bool _2756 = !_2750;
    float _2758 = _2754;
    if (!_2756)
    {
        bool _2760 = _2730 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2762 = isnan(_2730);
        bool _2764 = _2760 || _2762;
        bool _2766 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2768 = _2764 || _2766;
        if (!_2768)
        {
            float _2770 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2772 = _2730 + _2770;
            float _2774 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2776 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2774;
            float _2778 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2780 = _2778 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2782 = 1.0 / _2776;
            float _2784 = _2772 * _2782;
            float _2786 = fma(_2784, _2780, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2758 = _2786;
            _2788 = true;
        }
        else
        {
            bool _2790 = _2730 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2792 = isnan(_2730);
            bool _2794 = _2790 || _2792;
            bool _2796 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2798 = _2794 || _2796;
            if (!_2798)
            {
                float _2800 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2802 = _2730 + _2800;
                float _2804 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2806 = _2804 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2808 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2810 = _2808 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2812 = 1.0 / _2806;
                float _2814 = _2802 * _2812;
                float _2816 = fma(_2814, _2810, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2758 = _2816;
                _2788 = true;
            }
            else
            {
                _2758 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2788 = false;
    float _2818 = _2758;
    float _2820 = fma(_993, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2822 = fma(_995, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2824 = floor(_2820);
    float _2826 = floor(_2822);
    float _2828 = -_2824;
    float _2830 = _2820 + _2828;
    float _2832 = -_2826;
    float _2834 = _2822 + _2832;
    float2 _8323 = float2(_2830, _2834);
    float _2836 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8323, float2(0.0), isnan(_8323)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8323, float2(0.0), isnan(_8323)), level(0.0)).x;
    float _2838 = _1083 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2840 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2842 = _2402 + _2840;
    float _2844 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2838);
    float _2846 = _1083 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2848 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2850 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2852 = _1123 + _2850;
    float _2854 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2844);
    float _2856 = fma(_2842, _2818, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2858 = _1083 + _2848;
    float _2860 = _2854 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2862 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2846);
    float _2864 = fma(_2852, _2818, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2866 = 1.0 / _2860;
    float _2868 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2862);
    float _2870 = _2868 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2872 = _2870 + _2860;
    bool _2874 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2876 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2878 = _2874 || _2876;
    bool _2880 = isnan(0.5);
    bool _2882 = _2878 || _2880;
    float _2884 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2886 = _1119 + _2884;
    float _2888 = _2872 * _2866;
    float _2890 = _2888 * 0.5;
    float _2892 = _2858 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2894 = fma(_2886, _2818, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2896 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2898 = fma(_2890, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2896);
    float _2900 = fma(_993, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2892);
    float _2902 = _2858 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2904 = fma(_995, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2900);
    float _2906 = 1.0 / _2898;
    float _2908 = _2886;
    float _2910 = _2822;
    int _2912 = 2;
    int _2914 = as_type<int>(_2818);
    int _2916 = as_type<int>(_2856);
    if (_2882)
    {
        _2908 = _2856;
    }
    float _2918 = _2908;
    float _2920 = _2904 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2922 = _2918;
    if (_2882)
    {
        _2910 = _2864;
    }
    float _2924 = _2910;
    float _2926 = trunc(_2920);
    int _2928 = int(_2926);
    float _2930 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2932 = _2906 * _2930;
    bool _2934 = _2932 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _2936 = _2932 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _2938 = !_2934;
    int _2940 = _2938 ? 0 : 1;
    int _2942 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2944 = _2928 + _2942;
    int _2946 = _2944 + 1;
    float _2948 = _2924;
    if (!_2934)
    {
        _2912 = 1;
    }
    int _2950 = _2912;
    int _2952 = _2950;
    if (!_2936)
    {
        _2952 = _2940;
    }
    int _2954 = _2952;
    float _2956 = fma(_993, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2902);
    bool _2958 = _2946 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2960 = _2954 << 6;
    float _2962 = fma(_995, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2956);
    int _2964 = _2960 + 48;
    uint _2966 = uint(int(uint(_2964) >> uint(2)));
    uint _2968 = uint(int(uint(int(_2966)) >> uint(2)));
    int _2970 = int(_2966) & 3;
    float _2972 = (*spvDescriptorSet0.vp_c15)._m0[int(_2968)][_2970];
    int _2974 = int(_2966) + 1;
    uint _2976 = uint(int(uint(_2974) >> uint(2)));
    int _2978 = _2974 & 3;
    float _2980 = (*spvDescriptorSet0.vp_c15)._m0[int(_2976)][_2978];
    float _2982 = _2962 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2984 = trunc(_2982);
    int _2986 = int(_2984);
    int _2988 = _2960 + 56;
    uint _2990 = uint(int(uint(_2988) >> uint(2)));
    uint _2992 = uint(int(uint(int(_2990)) >> uint(2)));
    int _2994 = int(_2990) & 3;
    float _2996 = (*spvDescriptorSet0.vp_c15)._m0[int(_2992)][_2994];
    int _2998 = int(_2990) + 1;
    uint _3000 = uint(int(uint(_2998) >> uint(2)));
    int _3002 = _2998 & 3;
    float _3004 = (*spvDescriptorSet0.vp_c15)._m0[int(_3000)][_3002];
    int _3006 = _2960 + 64;
    uint _3008 = uint(int(uint(_3006) >> uint(2)));
    uint _3010 = uint(int(uint(int(_3008)) >> uint(2)));
    int _3012 = int(_3008) & 3;
    float _3014 = (*spvDescriptorSet0.vp_c15)._m0[int(_3010)][_3012];
    int _3016 = int(_3008) + 1;
    uint _3018 = uint(int(uint(_3016) >> uint(2)));
    int _3020 = _3016 & 3;
    float _3022 = (*spvDescriptorSet0.vp_c15)._m0[int(_3018)][_3020];
    int _3024 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3026 = _2986 + _3024;
    int _3028 = _3026 + 1;
    int _3030 = _2960 + 72;
    uint _3032 = uint(int(uint(_3030) >> uint(2)));
    uint _3034 = uint(int(uint(int(_3032)) >> uint(2)));
    int _3036 = int(_3032) & 3;
    float _3038 = (*spvDescriptorSet0.vp_c15)._m0[int(_3034)][_3036];
    int _3040 = int(_3032) + 1;
    uint _3042 = uint(int(uint(_3040) >> uint(2)));
    int _3044 = _3040 & 3;
    float _3046 = (*spvDescriptorSet0.vp_c15)._m0[int(_3042)][_3044];
    int _3048 = _2946 | _3028;
    bool _3050 = _3048 < 0;
    bool _3052 = _3050 || _2958;
    float _3054 = as_type<float>(_3048);
    float _3056 = as_type<float>(_2954);
    if (_2882)
    {
        _3054 = _2894;
    }
    float _3058 = _3054;
    int _3060 = _2960 + 96;
    uint _3062 = uint(int(uint(_3060) >> uint(2)));
    uint _3064 = uint(int(uint(int(_3062)) >> uint(2)));
    int _3066 = int(_3062) & 3;
    float _3068 = (*spvDescriptorSet0.vp_c15)._m0[int(_3064)][_3066];
    int _3070 = int(_3062) + 1;
    uint _3072 = uint(int(uint(_3070) >> uint(2)));
    int _3074 = _3070 & 3;
    float _3076 = (*spvDescriptorSet0.vp_c15)._m0[int(_3072)][_3074];
    bool _3078 = _3028 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3080 = _3078 || _3052;
    int _3082 = _2960 + 104;
    uint _3084 = uint(int(uint(_3082) >> uint(2)));
    uint _3086 = uint(int(uint(int(_3084)) >> uint(2)));
    int _3088 = int(_3084) & 3;
    float _3090 = (*spvDescriptorSet0.vp_c15)._m0[int(_3086)][_3088];
    int _3092 = int(_3084) + 1;
    uint _3094 = uint(int(uint(_3092) >> uint(2)));
    int _3096 = _3092 & 3;
    float _3098 = (*spvDescriptorSet0.vp_c15)._m0[int(_3094)][_3096];
    float _3100 = _3058;
    if (!_2882)
    {
        float _3102 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3104 = _1083 + _3102;
        float _3106 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3108 = _993 + _3106;
        float _3110 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3112 = _3104 * _3104;
        float _3114 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3116 = _995 + _3114;
        float _3118 = fma(_3108, _3108, _3112);
        float _3120 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3122 = fma(_3116, _3116, _3118);
        float _3124 = sqrt(_3122);
        float _3126 = _3110 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3128 = precise::min(_3124, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3130 = _3128 * _3120;
        float _3132 = -_1083;
        float _3134 = _3132 + _2856;
        float _3136 = -_993;
        float _3138 = _3136 + _2894;
        float _3140 = _3126 * _3130;
        float _3142 = -_995;
        float _3144 = _3142 + _2864;
        float _3146 = fma(_3134, _3140, _1083);
        float _3148 = fma(_3138, _3140, _993);
        float _3150 = fma(_3144, _3140, _995);
        _2922 = _3146;
        _3100 = _3148;
        _2914 = as_type<int>(_3144);
        _2948 = _3150;
        _2916 = as_type<int>(_3140);
    }
    float _3152 = _2922;
    float _3154 = _3100;
    int _3156 = _2914;
    float _3158 = _2948;
    int _3160 = _2916;
    float _3162 = _2858 * _3076;
    float _3164 = _3152 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _3166 = _3156;
    int _3168 = _3160;
    if (!_3080)
    {
        int _3170 = _3028 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3172 = _3170 + _2946;
        _3166 = _3172;
    }
    int _3174 = _3166;
    float _3176 = _2858 * _2980;
    float _3178 = fma(_993, _3068, _3162);
    float _3180 = fma(_3154, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3164);
    float _3182 = _2858 * _3022;
    if (!_3080)
    {
        int _3184 = _3174 << 2;
        _3168 = _3184;
    }
    int _3186 = _3168;
    float _3188 = fma(_995, _3090, _3178);
    float _3190 = fma(_3158, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3180);
    float _3192 = fma(_993, _2972, _3176);
    float _3194 = fma(_993, _3014, _3182);
    float _3196 = _3188 + _3098;
    float _3198 = _3190 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _3200 = as_type<int>(_3190);
    int _3202 = _3186;
    if (!_3080)
    {
        uint _3204 = uint(int(uint(_3174) >> uint(2)));
        _3200 = int(_3204);
    }
    int _3206 = _3200;
    float _3208 = fma(_995, _2996, _3192);
    float _3210 = 1.0 / _3196;
    if (!_3080)
    {
        int _3212 = 12 & _3186;
        _3202 = _3212;
    }
    int _3214 = _3202;
    int _3216 = _2960 + 80;
    uint _3218 = uint(int(uint(_3216) >> uint(2)));
    uint _3220 = uint(int(uint(int(_3218)) >> uint(2)));
    int _3222 = int(_3218) & 3;
    float _3224 = (*spvDescriptorSet0.vp_c15)._m0[int(_3220)][_3222];
    int _3226 = int(_3218) + 1;
    uint _3228 = uint(int(uint(_3226) >> uint(2)));
    int _3230 = _3226 & 3;
    float _3232 = (*spvDescriptorSet0.vp_c15)._m0[int(_3228)][_3230];
    float _3234 = fma(_995, _3038, _3194);
    float _3236 = _3208 + _3004;
    int _3238 = _3214;
    if (!_3080)
    {
        int _3240 = _3206 << 4;
        int _3242 = _3240 + _3214;
        _3238 = _3242;
    }
    int _3244 = _3238;
    float _3246 = _3152 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3248 = _3234 + _3046;
    float _3250 = _3152 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3252 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3254 = fma(_3154, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3246);
    int _3256 = _2960 + 88;
    uint _3258 = uint(int(uint(_3256) >> uint(2)));
    uint _3260 = uint(int(uint(int(_3258)) >> uint(2)));
    int _3262 = int(_3258) & 3;
    float _3264 = (*spvDescriptorSet0.vp_c15)._m0[int(_3260)][_3262];
    int _3266 = int(_3258) + 1;
    uint _3268 = uint(int(uint(_3266) >> uint(2)));
    int _3270 = _3266 & 3;
    float _3272 = (*spvDescriptorSet0.vp_c15)._m0[int(_3268)][_3270];
    float _3274 = fma(_3154, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3250);
    float _3276 = _3198 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3278 = fma(_3158, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3254);
    float _3280 = _3152 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3282 = _3236 * _3210;
    float _3284 = fma(_3158, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3274);
    float _3286 = _3278 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3288 = _3236;
    if (!_3080)
    {
        int _3290 = _3244 + 400;
        uint _3292 = uint(int(uint(_3290) >> uint(2)));
        uint _3294 = uint(int(uint(int(_3292)) >> uint(2)));
        int _3296 = int(_3292) & 3;
        float _3298 = (*spvDescriptorSet0.vp_c15)._m0[int(_3294)][_3296];
        _3288 = _3298;
    }
    float _3300 = _3288;
    float _3302 = _3248 * _3210;
    bool _3304 = _3282 >= 0.0;
    float _3306 = -_3276;
    float _3308 = fma(_3306, _3252, 1.0);
    float _3310 = fma(_3154, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3280);
    float _3312 = _3284 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _3314 = _3282 <= 1.0;
    bool _3316 = _3314 && _3304;
    float _3318 = _3286 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3320 = fma(_3158, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3310);
    float _3322 = _2718;
    if (!_3080)
    {
        float _3324 = floor(_2982);
        _3322 = _3324;
    }
    float _3326 = _3322;
    bool _3328 = _3302 >= 0.0;
    bool _3330 = _3328 && _3316;
    float _3332 = fma(_3312, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3318);
    float _3334 = _3320 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3336 = _3286 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _3338 = _3302 <= 1.0;
    bool _3340 = _3338 && _3330;
    float _3342 = fma(_3198, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3332);
    float _3344 = log2(_3308);
    float _3346 = fma(_3312, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3336);
    float _3348 = fma(_3334, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3342);
    float _3350 = _3286 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3352 = fma(_3198, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3346);
    float _3354 = fma(_3312, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3350);
    float _3356 = 1.0 / _3348;
    float _3358 = fma(_3334, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3352);
    float _3360 = _3350;
    if (_3340)
    {
        float _3362 = float(_2954);
        _3360 = _3362;
    }
    float _3364 = _3360;
    float _3366 = _3326;
    if (!_3080)
    {
        float _3368 = -_3326;
        float _3370 = _2982 + _3368;
        _3366 = _3370;
    }
    float _3372 = _3366;
    float _3374 = _2858 * _3232;
    float _3376 = _3248;
    if (!_3080)
    {
        float _3378 = floor(_2920);
        _3376 = _3378;
    }
    float _3380 = _3376;
    float _3382 = _3344 * 0.693147182464599609375;
    float _3384 = fma(_993, _3224, _3374);
    float _3386 = fma(_3198, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3354);
    float _3388 = fma(_995, _3264, _3384);
    float _3390 = _3364;
    if (_3340)
    {
        float _3392 = rint(_3364);
        float _3394 = precise::max(_3392, 0.0);
        uint _3396 = uint(_3394);
        uint _3398 = clamp(_3396, 0u, 65535u);
        _3390 = as_type<float>(_3398);
    }
    float _3400 = _3390;
    float _3402 = fma(_3334, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3386);
    float _3404 = _3358 * _3356;
    float _3406 = _3388 + _3272;
    float _3408 = _3402 * _3356;
    float _3410 = _3406 * _3210;
    float _3412 = _3352;
    if (!_3080)
    {
        float _3414 = rint(_3300);
        float _3416 = precise::max(_3414, 0.0);
        uint _3418 = uint(_3416);
        uint _3420 = clamp(_3418, 0u, 65535u);
        _3412 = as_type<float>(_3420);
    }
    float _3422 = _3412;
    float _3424 = _3382 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3426 = fma(_3408, 0.5, 0.5);
    float _3428 = fma(_3404, -0.5, 0.5);
    float _3430 = _3380;
    float _3432 = _3424;
    if (!_3080)
    {
        float _3434 = -_3380;
        float _3436 = _2920 + _3434;
        _3430 = _3436;
    }
    float _3438 = _3430;
    float _3440 = _3302;
    if (_3340)
    {
        float3 _9351 = float3(_3282, _3302, float(as_type<int>(_3400)));
        float3 _9355 = select(_9351, float3(0.0), isnan(_9351));
        float _3442 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9355.xy, uint(rint(_9355.z)), _3410, level(0.0));
        _3440 = _3442;
    }
    float _3444 = _3440;
    float3 _9365 = float3(_3426, _3428, _3424);
    float _3446 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9365, float3(0.0), isnan(_9365)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9365, float3(0.0), isnan(_9365)), level(0.0)).x;
    float3 _9374 = float3(_3426, _3428, _3424);
    float4 _3449 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9374, float3(0.0), isnan(_9374)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9374, float3(0.0), isnan(_9374)), level(0.0)).xyzw;
    float _3451 = _3449.x;
    float _3453 = _3449.y;
    float _3455 = _3449.z;
    float _3457 = _3449.w;
    float _3459 = _3438;
    if (!_3080)
    {
        float3 _9397 = float3(_3438, _3372, float(as_type<int>(_3422)));
        float3 _9399 = select(_9397, float3(0.0), isnan(_9397));
        float _3461 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9399.xy, uint(rint(_9399.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9399.xy, uint(rint(_9399.z)), level(0.0)).x;
        _3459 = _3461;
    }
    float _3463 = _3459;
    if (_3080)
    {
        _3056 = 1.0;
    }
    float _3465 = _3056;
    float _3467 = _3465;
    float _3469 = _3463;
    if (!_3080)
    {
        int _3471 = _3174 << 4;
        int _3473 = _3471 + 2048;
        uint _3475 = uint(int(uint(_3473) >> uint(2)));
        uint _3477 = uint(int(uint(int(_3475)) >> uint(2)));
        int _3479 = int(_3475) & 3;
        float _3481 = (*spvDescriptorSet0.vp_c15)._m0[int(_3477)][_3479];
        int _3483 = int(_3475) + 1;
        uint _3485 = uint(int(uint(_3483) >> uint(2)));
        int _3487 = _3483 & 3;
        float _3489 = (*spvDescriptorSet0.vp_c15)._m0[int(_3485)][_3487];
        int _3491 = _3473 + 8;
        uint _3493 = uint(int(uint(_3491) >> uint(2)));
        uint _3495 = uint(int(uint(int(_3493)) >> uint(2)));
        int _3497 = int(_3493) & 3;
        float _3499 = (*spvDescriptorSet0.vp_c15)._m0[int(_3495)][_3497];
        int _3501 = int(_3493) + 1;
        uint _3503 = uint(int(uint(_3501) >> uint(2)));
        int _3505 = _3501 & 3;
        float _3507 = (*spvDescriptorSet0.vp_c15)._m0[int(_3503)][_3505];
        float _3509 = _2858 * _3489;
        float _3511 = fma(_993, _3481, _3509);
        float _3513 = fma(_995, _3499, _3511);
        float _3515 = _3513 + _3507;
        float _3517 = precise::clamp(_3515, 0.0, 1.0);
        float _3519 = -_3517;
        float _3521 = _3519 + _3463;
        float _3523 = fma(_3521, 500.0, 1.5);
        float _3525 = exp2(_3523);
        float _3527 = 0.0 + _3525;
        float _3529 = precise::clamp(_3527, 0.0, 1.0);
        _3432 = _3499;
        _3467 = _3529;
    }
    float _3531 = _3432;
    float _3533 = _3467;
    float _3535 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3537 = _3152 + _3535;
    float _3539 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3541 = _3154 + _3539;
    float _3543 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3545 = _3158 + _3543;
    float _3547 = _3537 * _3537;
    float _3549 = fma(_3541, _3541, _3547);
    float _3551 = fma(_3545, _3545, _3549);
    float _3553 = rsqrt(_3551);
    float _3555 = sqrt(_3551);
    float _3557 = _3553 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3559 = _3541 * _3557;
    float _3561 = _3545 * _3557;
    float _3563 = _3559 * _3559;
    float _3565 = _3561 * _3561;
    float _3567 = _3563 + _3565;
    float _3569 = sqrt(_3567);
    bool _3571 = _3569 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3573 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3575 = _3569 + _3573;
    float _3577 = _3545;
    float _3579 = _3575;
    float _3581 = _3547;
    float _3583 = _3537;
    if (_3571)
    {
        float _3585 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3577 = _3585;
    }
    float _3587 = _3577;
    if (_3571)
    {
        float _3589 = _3575 * _3587;
        _3579 = _3589;
    }
    float _3591 = _3579;
    if (_3571)
    {
        float _3593 = _3591 * 0.15915493667125701904296875;
        _3581 = _3593;
    }
    float _3595 = _3581;
    float _3597 = _3531;
    float _3599 = _3595;
    if (_3571)
    {
        float _3601 = _3595 * 6.283185482025146484375;
        float _3603 = sin(_3601);
        _3597 = _3603;
    }
    float _3605 = _3597;
    float _3607 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3609 = precise::max(0.0, _3607);
    float _3611 = _3553;
    float _3613 = _3609;
    if (_3571)
    {
        float _3615 = _3595 * 6.283185482025146484375;
        float _3617 = cos(_3615);
        _3611 = _3617;
    }
    float _3619 = _3611;
    float _3621 = -_3557;
    float _3623 = -_3609;
    float _3625 = fma(_3537, _3621, _3623);
    float _3627 = _3607;
    if (_3571)
    {
        float _3629 = rsqrt(_3567);
        _3627 = _3629;
    }
    float _3631 = _3627;
    if (_3571)
    {
        float _3633 = _3625 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3613 = _3633;
    }
    float _3635 = _3613;
    float _3637 = _3635;
    if (!_3571)
    {
        _3599 = _3563;
    }
    float _3639 = _3599;
    float _3641 = _3639;
    if (_3571)
    {
        float _3643 = fma(_3605, _3635, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3637 = _3643;
    }
    float _3645 = _3637;
    float _3647 = _3645;
    float _3649 = _3619;
    if (_3571)
    {
        float _3651 = _3619 + (-1.0);
        _3583 = _3651;
    }
    float _3653 = _3583;
    float _3655 = _3653;
    if (_3571)
    {
        float _3657 = _3653 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3469 = _3657;
    }
    float _3659 = _3469;
    if (!_3571)
    {
        _3655 = _3561;
    }
    float _3661 = _3655;
    float _3663 = _3631;
    float _3665 = _3661;
    if (_3571)
    {
        float _3667 = _3631 * _3645;
        _2460 = _3667;
    }
    float _3669 = _2460;
    if (!_3571)
    {
        _3647 = _3559;
    }
    float _3671 = _3647;
    float _3673 = _3671;
    if (!_3571)
    {
        _3663 = _3625;
    }
    float _3675 = _3663;
    float _3677 = _3675;
    if (_3571)
    {
        float _3679 = _3559 * _3669;
        _3673 = _3679;
    }
    float _3681 = _3673;
    if (_3571)
    {
        float _3683 = fma(_3625, _3619, _3659);
        _3677 = _3683;
    }
    float _3685 = _3677;
    if (_3571)
    {
        float _3687 = _3561 * _3669;
        _3665 = _3687;
    }
    float _3689 = _3665;
    if (!_3571)
    {
        _3649 = _3565;
    }
    float _3691 = _3649;
    float _3693 = _3691;
    if (_3571)
    {
        float _3695 = _3681 * _3681;
        _3641 = _3695;
    }
    float _3697 = _3641;
    if (_3571)
    {
        float _3699 = _3689 * _3689;
        _3693 = _3699;
    }
    float _3701 = _3693;
    float _3703 = fma(_3685, _3685, _3697);
    float _3705 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3707 = fma(_3555, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3705);
    float _3709 = precise::clamp(_3707, 0.0, 1.0);
    float _3711 = _3703 + _3701;
    float _3713 = -_3709;
    float _3715 = _3713 + 1.0;
    float _3717 = rsqrt(_3711);
    float _3719 = _3717 * _3681;
    float _3721 = _3717 * _3685;
    float _3723 = _3717 * _3689;
    float _3725 = abs(_3715);
    float _3727 = log2(_3725);
    float _3729 = _3719 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3731 = -_3729;
    float _3733 = fma(_3721, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3731);
    float _3735 = -_3723;
    float _3737 = fma(_3735, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3733);
    float _3739 = fma(_3737, -0.5, 0.5);
    float _3741 = fma(_3737, 0.5, 0.5);
    float _3743 = _3727 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3745 = fma(_3741, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3747 = sqrt(_3739);
    float _3749 = fma(_3741, _3745, -0.212114393711090087890625);
    float _3751 = _3721 + 1.0;
    float _3753 = fma(_3741, _3749, 1.570728778839111328125);
    float _3755 = exp2(_3743);
    float _3757 = _3747 * 0.636619746685028076171875;
    float _3759 = -_3753;
    float _3761 = fma(_3757, _3759, 1.0);
    float _3763 = -_3721;
    float _3765 = fma(_3755, _3751, _3763);
    float _3767 = fma(_3765, 0.5, 0.5);
    float2 _9872 = float2(_3761, _3767);
    float3 _3769 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9872, float2(0.0), isnan(_9872)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9872, float2(0.0), isnan(_9872)), level(0.0)).xyz;
    float _3771 = _3769.x;
    float _3773 = _3769.y;
    float _3775 = _3769.z;
    float _3777 = abs(_2932);
    float _3779 = log2(_3777);
    float _3781 = _3286 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3783 = _3727 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3785 = -_2836;
    float _3787 = _3785 + 1.0;
    float _3789 = fma(_3312, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3781);
    out.m_96.x = _3154;
    out.m_96.y = _3152;
    out.m_96.z = _3158;
    bool _3791 = _2932 <= 8000.0;
    bool _3793 = isnan(_2932);
    bool _3795 = _3791 || _3793;
    bool _3797 = isnan(8000.0);
    bool _3799 = _3795 || _3797;
    float _3801 = float(_3799);
    float _3803 = exp2(_3783);
    float _3805 = fma(_3198, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3789);
    float _3807 = fma(_3334, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3805);
    float _3809 = _3779 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3811 = _3807 + _3348;
    float _3813 = exp2(_3809);
    float _3815 = -_3803;
    float _3817 = _3815 + 1.0;
    float _3819 = _3817 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3821 = _3819 * _3446;
    float _3823 = fma(_3813, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3825 = precise::clamp(_3823, 0.0, 1.0);
    float _3827 = _3811 * 0.5;
    float _3829 = _3811;
    float _3831 = _3787;
    float _3833 = _3807;
    if (!_3340)
    {
        _3829 = 1.0;
    }
    float _3835 = _3829;
    float _3837 = fma(_3825, -2.0, 3.0);
    float _3839 = _3825 * _3825;
    float _3841 = _3835;
    if (_3340)
    {
        bool _3843 = _3444 >= _3410;
        bool _3845 = isnan(_3444);
        bool _3847 = _3843 || _3845;
        bool _3849 = isnan(_3410);
        bool _3851 = _3847 || _3849;
        float _3853 = float(_3851);
        _3841 = _3853;
    }
    float _3855 = _3841;
    float _3857 = _3457 * _3821;
    float _3859 = -_3819;
    float _3861 = _3859 + 1.0;
    float _3863 = _3839 * _3837;
    float _3865 = _3855 * _3533;
    bool _3867 = _3555 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3869 = isnan(_3555);
    bool _3871 = _3867 || _3869;
    bool _3873 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3875 = _3871 || _3873;
    float _3877 = -_3863;
    float _3879 = _3877 + 1.0;
    out.m_98.z = _3827;
    out.m_98.w = _3348;
    float _3881 = fma(_3879, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3863);
    float _3883 = _3457 * _3861;
    float _3885 = _3801 * _3881;
    out.gl_Position.x = _3402;
    out.gl_Position.y = _3358;
    out.gl_Position.z = _3807;
    out.gl_Position.w = _3348;
    float _3887 = _3885 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3889 = _3861;
    float _3891 = _3402;
    float _3893 = _3857;
    if (!_3875)
    {
        _3889 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3895 = _3889;
    float _3897 = _3787 * _3887;
    float _3899 = precise::clamp(_3897, 0.0, 1.0);
    float _3901 = _3895;
    float _3903 = _3895;
    if (!_3875)
    {
        _3831 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3905 = _3831;
    float _3907 = -_3899;
    float _3909 = fma(_3907, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3911 = -_3865;
    float _3913 = fma(_3911, _3909, 1.0);
    float _3915 = precise::clamp(_3913, 0.0, 1.0);
    float _3917 = _3915;
    float _3919 = _3905;
    float _3921 = _3905;
    if (!_3875)
    {
        _3833 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3923 = _3833;
    float _3925 = _3923;
    float _3927 = _3923;
    if (!_3875)
    {
        _3891 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3929 = _3891;
    float _3931 = _3915 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3933 = _3929;
    float _3935 = _3929;
    if (!_3875)
    {
        _3917 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3937 = _3917;
    out.m_100.x = _3931;
    float _3939 = _3775 * _3821;
    float _3941 = fma(_3771, _3857, _3451);
    float _3943 = fma(_3773, _3857, _3453);
    float _3945 = _3937;
    float _3947 = _3937;
    if (!_3875)
    {
        _3893 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3949 = _3893;
    float _3951 = fma(_3457, _3939, _3455);
    out.m_102.x = _3941;
    out.m_102.y = _3943;
    out.m_102.z = _3951;
    out.m_102.w = _3883;
    bool _3953 = !_3875;
    float _3955 = _3949;
    float _3957 = _3949;
    if (!_3953)
    {
        bool _3959 = _3555 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3961 = isnan(_3555);
        bool _3963 = _3959 || _3961;
        bool _3965 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3967 = _3963 || _3965;
        if (!_3967)
        {
            float _3969 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3971 = _3555 + _3969;
            float _3973 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3975 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3973;
            float _3977 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3979 = _3977 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3981 = 1.0 / _3975;
            float _3983 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3985 = _3983 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3987 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3989 = _3987 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3991 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3993 = _3991 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3995 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3997 = _3995 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3999 = _3971 * _3981;
            float _4001 = precise::clamp(_3999, 0.0, 1.0);
            float _4003 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4005 = _4003 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4007 = fma(_4001, _3979, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4009 = fma(_4001, _4005, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4011 = fma(_4001, _3985, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4013 = fma(_4001, _3989, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4015 = fma(_4001, _3993, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4017 = fma(_4001, _3997, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3921 = _4011;
            _3903 = _4015;
            _3927 = _4007;
            _3957 = _4013;
            _3935 = _4009;
            _3947 = _4017;
            _4019 = true;
        }
        else
        {
            bool _4021 = _3555 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4023 = isnan(_3555);
            bool _4025 = _4021 || _4023;
            bool _4027 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4029 = _4025 || _4027;
            if (!_4029)
            {
                _3925 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4031 = _3925;
            _3927 = _4031;
            if (!_4029)
            {
                _3919 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4033 = _3919;
            _3921 = _4033;
            if (!_4029)
            {
                _3933 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4035 = _3933;
            _3935 = _4035;
            if (!_4029)
            {
                _3955 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4037 = _3955;
            _3957 = _4037;
            if (!_4029)
            {
                _3901 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4039 = _3901;
            _3903 = _4039;
            if (!_4029)
            {
                _3945 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4041 = _3945;
            bool _4043 = !_4029;
            _3947 = _4041;
            if (!_4043)
            {
                bool _4045 = _3555 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4047 = isnan(_3555);
                bool _4049 = _4045 || _4047;
                bool _4051 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4053 = _4049 || _4051;
                if (!_4053)
                {
                    float _4055 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4057 = _3555 + _4055;
                    float _4059 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4061 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4059;
                    float _4063 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4065 = _4063 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4067 = 1.0 / _4061;
                    float _4069 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4071 = _4069 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4073 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4075 = _4073 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4077 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4079 = _4077 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4081 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4083 = _4081 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4085 = _4057 * _4067;
                    float _4087 = precise::clamp(_4085, 0.0, 1.0);
                    float _4089 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4091 = _4089 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4093 = fma(_4087, _4065, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4095 = fma(_4087, _4091, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4097 = fma(_4087, _4071, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4099 = fma(_4087, _4075, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4101 = fma(_4087, _4079, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4103 = fma(_4087, _4083, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3921 = _4097;
                    _3903 = _4101;
                    _3927 = _4093;
                    _3957 = _4099;
                    _3935 = _4095;
                    _3947 = _4103;
                    _4019 = true;
                }
                else
                {
                    _3921 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3903 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3927 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3957 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3935 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3947 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4019 = false;
    float _4105 = _3921;
    float _4107 = _3903;
    float _4109 = _3927;
    float _4111 = _3957;
    float _4113 = _3935;
    float _4115 = _3947;
    float _4117 = fma(_2738, -0.5, 0.5);
    float _4119 = precise::clamp(_4117, 0.0, 1.0);
    float _4121 = -_4105;
    float _4123 = _4121 + _4107;
    float _4125 = -_4109;
    float _4127 = _4125 + _4111;
    float _4129 = -_4113;
    float _4131 = _4129 + _4115;
    bool _4133 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4135 = fma(_4119, _4123, _4105);
    float _4137 = fma(_4119, _4127, _4109);
    float _4139 = fma(_4119, _4131, _4113);
    float _4141 = _4135 * 0.586610972881317138671875;
    out.m_104.x = 0.0;
    float _4143 = fma(_4137, 0.298911988735198974609375, _4141);
    float _4145 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4147 = fma(_4139, 0.114477999508380889892578125, _4143);
    out.m_63.x = _4145;
    float _4149 = -_4147;
    float _4151 = _4137 + _4149;
    float _4153 = -_4147;
    float _4155 = _4135 + _4153;
    float _4157 = -_4147;
    float _4159 = _4139 + _4157;
    float _4161 = fma(_4151, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4147);
    float _4163 = fma(_4155, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4147);
    float _4165 = fma(_4159, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4147);
    out.m_106.x = _4161;
    out.m_106.y = _4163;
    out.m_106.z = _4165;
    if (!_4133)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4167 = -_3152;
    float _4169 = _4167 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4171 = -_3154;
    float _4173 = _4171 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4175 = -_3158;
    float _4177 = _4175 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4179 = _4169 * _4169;
    float _4181 = fma(_4173, _4173, _4179);
    float _4183 = fma(_4177, _4177, _4181);
    float _4185 = sqrt(_4183);
    float _4187 = rsqrt(_4183);
    float _4189 = -_4185;
    float _4191 = _4189 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4193 = _4191 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4195 = precise::clamp(_4193, 0.0, 1.0);
    float _4197 = _4173 * _4187;
    float _4199 = _4169 * _4187;
    float _4201 = abs(_4195);
    float _4203 = log2(_4201);
    float _4205 = _4177 * _4187;
    float _4207 = _4197 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4209 = _2738 * _4199;
    float _4211 = -_4199;
    float _4213 = -_4207;
    float _4215 = fma(_4211, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4213);
    float _4217 = fma(_2732, _4197, _4209);
    float _4219 = -_4205;
    float _4221 = fma(_4219, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4215);
    float _4223 = fma(_2740, _4205, _4217);
    float _4225 = precise::clamp(_4223, 0.0, 1.0);
    float _4227 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4229 = _4221 + _4227;
    float _4231 = _4203 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4233 = _4229 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4235 = precise::clamp(_4233, 0.0, 1.0);
    float _4237 = exp2(_4231);
    float _4239 = _4237 * _4235;
    float _4241 = _4225 * _4239;
    float _4243 = _4241 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4245 = _4241 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4247 = _4241 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_104.x = _4243;
    out.m_104.y = _4245;
    out.m_104.z = _4247;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

