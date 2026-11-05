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
    float4 m_90 [[user(locn2)]];
    float4 m_96 [[user(locn3)]];
    float4 m_106 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_88 [[user(locn7)]];
    float4 m_94 [[user(locn8)]];
    float4 m_98 [[user(locn9)]];
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
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3919 = false;
    bool _2796 = false;
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
        float _4204 = as_type<float>(_141);
        out.gl_Position.z = _4204;
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
        float _4274 = as_type<float>(_179);
        out.gl_Position.z = _4274;
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
    float2 _5742 = float2(_1125, _1127);
    float3 _1131 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5742, float2(0.0), isnan(_5742)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5742, float2(0.0), isnan(_5742)), level(0.0)).xyz;
    float _1133 = _1131.x;
    float _1135 = _1131.y;
    float _1137 = _1131.z;
    float _1139 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1141 = int(_1139);
    float _1143 = _1123;
    if (_263)
    {
        float _1145 = in.m_70.x;
        _1069 = _1145;
    }
    float _1147 = _1069;
    float _1149 = -_583;
    float _1151 = _1149 + 1.0;
    float _1153 = -_685;
    float _1155 = _1153 + 1.0;
    float _1157 = _1147;
    if (!_263)
    {
        float _1159 = in.m_70.y;
        _1157 = _1159;
    }
    float _1161 = _1157;
    float _1163 = -_687;
    float _1165 = _1163 + 1.0;
    float _1167 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1169 = trunc(_575);
    int _1171 = int(_1169);
    float _1173 = -_679;
    float _1175 = _1173 + 1.0;
    float _1177 = float(uint(_1141));
    float _1179 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1181 = int(_1179);
    int _1183 = ~_1141;
    int _1185 = _1183 + 1;
    float _1187 = float(_1141);
    bool _1189 = _1141 == 0;
    float _1191 = float(uint(_1171));
    float _1193 = 1.0 / _1177;
    float _1195 = float(uint(_1181));
    float _1197 = trunc(_659);
    int _1199 = int(_1197);
    int _1201 = ~_1181;
    int _1203 = _1201 + 1;
    bool _1205 = _1181 == 0;
    int _1207 = as_type<int>(_1193) + (-2);
    float _1209 = 1.0 / _1195;
    float _1211 = _1193;
    float _1213 = _1175;
    if (_263)
    {
        _1211 = 1.0;
    }
    float _1215 = _1211;
    float _1217 = _1215;
    if (!_263)
    {
        _1217 = 7.345489978790283203125;
    }
    float _1219 = _1217;
    float _1221 = as_type<float>(_1207) * _1191;
    float _1223 = trunc(_1221);
    float _1225 = precise::max(_1223, 0.0);
    uint _1228 = uint(_1225);
    float _1230 = _1219 * _231;
    int _1232 = as_type<int>(_1209) + (-2);
    float _1234 = float(uint(_1199));
    int _1236 = _1185 * int(_1228);
    int _1238 = _1236 + _1171;
    float _1240 = as_type<float>(_1232) * _1234;
    float _1242 = float(_1171);
    float _1244 = float(uint(_1238));
    float _1246 = floor(_1230);
    bool _1248 = _1242 >= _1187;
    bool _1250 = isnan(_1242);
    bool _1252 = _1248 || _1250;
    bool _1254 = isnan(_1187);
    bool _1256 = _1252 || _1254;
    float _1258 = float(_1256);
    float _1260 = as_type<float>(_1207) * _1244;
    float _1262 = trunc(_1240);
    float _1264 = precise::max(_1262, 0.0);
    uint _1266 = uint(_1264);
    float _1268 = trunc(_1260);
    float _1270 = precise::max(_1268, 0.0);
    uint _1272 = uint(_1270);
    float _1274 = -_1246;
    float _1276 = _1230 + _1274;
    int _1278 = ~_1141;
    int _1280 = _1278 + 1;
    float _1282 = _1276 * _1187;
    int _1284 = _1203 * int(_1266);
    int _1286 = _1284 + _1199;
    float _1288 = trunc(_1258);
    int _1290 = int(_1288);
    float _1292 = float(uint(_1286));
    int _1294 = int(_1228) + int(_1272);
    float _1296 = as_type<float>(_1232) * _1292;
    float _1298 = trunc(_1282);
    int _1300 = int(_1298);
    int _1302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1304 = _1302 != 0;
    float _1306 = as_type<float>(_1280);
    if (_263)
    {
        _1306 = 1.0;
    }
    float _1308 = _1306;
    int _1310 = _1280 * _1294;
    int _1312 = _1310 + _1171;
    float _1314 = _1308;
    if (!_263)
    {
        _1314 = 1.2345600128173828125;
    }
    float _1316 = _1314;
    bool _1318 = !_1304;
    int _1320 = _1318 ? 0 : 1;
    bool _1322 = uint(_1312) >= uint(_1141);
    float _1324 = _1316 * _1161;
    float _1326 = trunc(_1296);
    float _1328 = precise::max(_1326, 0.0);
    uint _1330 = uint(_1328);
    int _1332 = abs(_1320);
    bool _1334 = !_1322;
    int _1336 = _1334 ? 0 : (-1);
    int _1338 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1340 = _1338 != 0;
    int _1342 = ~_1294;
    int _1344 = _1342 + _1336;
    int _1346 = _1344 + 1;
    float _1348 = _1187 * _467;
    int _1350 = ~_1181;
    int _1352 = _1350 + 1;
    int _1354 = abs(_505);
    int _1356 = _1141 * _1346;
    int _1358 = _1356 + _1171;
    float _1360 = trunc(_1348);
    int _1362 = int(_1360);
    int _1364 = ~_1290;
    int _1366 = _1364 + 1;
    int _1368 = _1366 + 1;
    bool _1370 = !_1189;
    int _1372 = _1370 ? _1358 : (-1);
    int _1374 = _1300 * _1332;
    int _1376 = _1374 + _1171;
    int _1378 = int(_1266) + int(_1330);
    int _1380 = _1141 + (-1);
    int _1382 = _1372 * _1368;
    int _1384 = abs(_501);
    int _1386 = _1352 * _1378;
    int _1388 = _1386 + _1199;
    float _1390 = floor(_1324);
    int _1392 = _1290 * _1380;
    int _1394 = _1392 + _1382;
    float _1396 = float(_1181);
    float _1398 = float(_1199);
    bool _1400 = uint(_1388) >= uint(_1181);
    int _1402 = _1394 * _1384;
    bool _1404 = _1398 >= _1396;
    bool _1406 = isnan(_1398);
    bool _1408 = _1404 || _1406;
    bool _1410 = isnan(_1396);
    bool _1412 = _1408 || _1410;
    float _1414 = float(_1412);
    int _1416 = abs(_509);
    bool _1418 = !_1400;
    int _1420 = _1418 ? 0 : (-1);
    float _1422 = trunc(_1414);
    int _1424 = int(_1422);
    float _1426 = -_1390;
    float _1428 = _1324 + _1426;
    int _1430 = ~_1378;
    int _1432 = _1430 + _1420;
    int _1434 = _1432 + 1;
    bool _1436 = !_1340;
    int _1438 = _1436 ? 0 : 1;
    int _1440 = _1362 * _1354;
    int _1442 = _1440 + _1402;
    float _1444 = _1428 * _1396;
    int _1446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1448 = _1446 != 0;
    int _1450 = _1181 * _1434;
    int _1452 = _1450 + _1199;
    int _1454 = abs(_1438);
    int _1456 = _1376 * _1416;
    int _1458 = _1456 + _1442;
    bool _1460 = !_1448;
    int _1462 = _1460 ? 0 : 1;
    float _1464 = trunc(_1444);
    int _1466 = int(_1464);
    int _1468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1470 = _1468 != 0;
    int _1472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1474 = _1472 != 0;
    int _1476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1478 = _1476 != 0;
    int _1480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1482 = _1480 != 0;
    float _1484 = _1396 * _467;
    int _1486 = _1300 * _1454;
    int _1488 = _1486 + _1458;
    int _1490 = ~_1424;
    int _1492 = _1490 + 1;
    int _1494 = _1492 + 1;
    bool _1496 = !_1205;
    int _1498 = _1496 ? _1452 : (-1);
    float _1500 = trunc(_1484);
    int _1502 = int(_1500);
    bool _1504 = !_1474;
    int _1506 = _1504 ? 0 : 1;
    float _1508 = float(uint(_1488));
    int _1510 = _1498 * _1494;
    int _1512 = abs(_1462);
    int _1514 = _1181 + (-1);
    float _1516 = as_type<float>(_1207) * _1508;
    bool _1518 = !_1470;
    int _1520 = _1518 ? 0 : 1;
    int _1522 = abs(_1506);
    int _1524 = _1424 * _1514;
    int _1526 = _1524 + _1510;
    int _1528 = abs(_1520);
    float _1530 = trunc(_1516);
    float _1532 = precise::max(_1530, 0.0);
    uint _1534 = uint(_1532);
    int _1536 = _1466 * _1512;
    int _1538 = _1536 + _1199;
    bool _1540 = !_1478;
    int _1542 = _1540 ? 0 : 1;
    int _1544 = _1526 * _1522;
    int _1546 = ~_1141;
    int _1548 = _1546 + 1;
    float _1550 = float(uint(_1376));
    int _1552 = _1502 * _1528;
    int _1554 = _1552 + _1544;
    bool _1556 = !_1482;
    int _1558 = _1556 ? 0 : 1;
    int _1560 = abs(_1542);
    float _1562 = as_type<float>(_1207) * _1550;
    int _1564 = abs(_1558);
    int _1566 = _1538 * _1560;
    int _1568 = _1566 + _1554;
    float _1570 = trunc(_1562);
    float _1572 = precise::max(_1570, 0.0);
    uint _1574 = uint(_1572);
    int _1576 = _1548 * int(_1534);
    int _1578 = _1576 + _1488;
    float _1580 = float(uint(_1538));
    int _1582 = _1466 * _1564;
    int _1584 = _1582 + _1568;
    int _1586 = ~_1181;
    int _1588 = _1586 + 1;
    float _1590 = float(uint(_1578));
    float _1592 = as_type<float>(_1232) * _1580;
    float _1594 = float(uint(_1584));
    int _1596 = ~_1141;
    int _1598 = _1596 + 1;
    float _1600 = trunc(_1592);
    float _1602 = precise::max(_1600, 0.0);
    uint _1604 = uint(_1602);
    float _1606 = as_type<float>(_1207) * _1590;
    float _1608 = as_type<float>(_1232) * _1594;
    int _1610 = _1598 * int(_1574);
    int _1612 = _1610 + _1376;
    float _1614 = trunc(_1606);
    float _1616 = precise::max(_1614, 0.0);
    uint _1618 = uint(_1616);
    int _1620 = ~_1181;
    int _1622 = _1620 + 1;
    float _1624 = float(uint(_1612));
    float _1626 = trunc(_1608);
    float _1628 = precise::max(_1626, 0.0);
    uint _1630 = uint(_1628);
    int _1632 = _1588 * int(_1604);
    int _1634 = _1632 + _1538;
    float _1636 = as_type<float>(_1207) * _1624;
    int _1638 = ~_1141;
    int _1640 = _1638 + 1;
    float _1642 = float(uint(_1634));
    float _1644 = trunc(_1636);
    float _1646 = precise::max(_1644, 0.0);
    uint _1648 = uint(_1646);
    int _1650 = int(_1534) + int(_1618);
    float _1652 = as_type<float>(_1232) * _1642;
    int _1654 = _1622 * int(_1630);
    int _1656 = _1654 + _1584;
    float _1658 = trunc(_1652);
    float _1660 = precise::max(_1658, 0.0);
    uint _1662 = uint(_1660);
    int _1664 = _1640 * _1650;
    int _1666 = _1664 + _1488;
    float _1668 = float(uint(_1656));
    bool _1670 = uint(_1666) >= uint(_1141);
    int _1672 = int(_1574) + int(_1648);
    float _1674 = as_type<float>(_1232) * _1668;
    bool _1676 = !_1670;
    int _1678 = _1676 ? 0 : (-1);
    int _1680 = ~_1181;
    int _1682 = _1680 + 1;
    float _1684 = trunc(_1674);
    float _1686 = precise::max(_1684, 0.0);
    uint _1688 = uint(_1686);
    int _1690 = ~_1650;
    int _1692 = _1690 + _1678;
    int _1694 = _1692 + 1;
    int _1696 = int(_1604) + int(_1662);
    int _1698 = _1141 * _1694;
    int _1700 = _1698 + _1488;
    int _1702 = ~_1141;
    int _1704 = _1702 + 1;
    int _1706 = _1682 * _1696;
    int _1708 = _1706 + _1538;
    int _1710 = ~_1181;
    int _1712 = _1710 + 1;
    bool _1714 = !_1189;
    int _1716 = _1714 ? _1700 : (-1);
    int _1718 = _1704 * _1672;
    int _1720 = _1718 + _1376;
    int _1722 = _1716 & 3;
    bool _1724 = _1722 != 0;
    int _1726 = int(_1630) + int(_1688);
    int _1728 = _1716 & 3;
    bool _1730 = _1728 != 0;
    bool _1732 = uint(_1722) >= 2u;
    int _1734 = _1712 * _1726;
    int _1736 = _1734 + _1584;
    int _1738 = _1730 ? 0 : 1;
    bool _1740 = uint(_1720) >= uint(_1141);
    int _1742 = _1732 ? 0 : 1;
    bool _1744 = uint(_1736) >= uint(_1181);
    bool _1746 = uint(_1722) > 1u;
    bool _1748 = !_1740;
    int _1750 = _1748 ? 0 : (-1);
    bool _1752 = !_1744;
    int _1754 = _1752 ? 0 : (-1);
    int _1756 = ~_1672;
    int _1758 = _1756 + _1750;
    int _1760 = _1758 + 1;
    int _1762 = ~_1726;
    int _1764 = _1762 + _1754;
    int _1766 = _1764 + 1;
    bool _1768 = _237 > 0.5;
    int _1770 = _1141 * _1760;
    int _1772 = _1770 + _1376;
    int _1774 = ~_1738;
    int _1776 = _1774 + 1;
    int _1778 = _1776 + 1;
    int _1780 = _1181 * _1766;
    int _1782 = _1780 + _1584;
    int _1784 = _1778;
    if (!_1746)
    {
        int _1786 = ~_1738;
        int _1788 = _1786 + 1;
        _1784 = _1788;
    }
    int _1790 = _1784;
    float _1792 = -_199;
    int _1794 = _1768 ? as_type<int>(_1792) : as_type<int>(_199);
    int _1796 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1798 = _1796 != 0;
    bool _1800 = !_1205;
    int _1802 = _1800 ? _1782 : (-1);
    bool _1804 = _1722 != 3;
    bool _1806 = !_1189;
    int _1808 = _1806 ? _1772 : (-1);
    int _1810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1812 = _1810 != 0;
    bool _1814 = !_1798;
    int _1816 = _1814 ? 0 : 1;
    int _1818 = _1716 >> 31;
    int _1820 = _1802 & 3;
    bool _1822 = _1820 != 0;
    int _1824 = _1802 >> 31;
    bool _1826 = !_1812;
    int _1828 = _1826 ? 0 : 1;
    int _1830 = _1818 & 3;
    bool _1832 = uint(_1708) >= uint(_1181);
    int _1834 = _1802 & 3;
    bool _1836 = _1834 != 0;
    bool _1838 = !_1822;
    float _1840 = _1838 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _1842 = _1824 & 3;
    bool _1844 = uint(_1820) > 1u;
    int _1846 = _1716 + _1830;
    bool _1848 = !_1832;
    int _1850 = _1848 ? 0 : (-1);
    int _1852 = _1836 ? 0 : 1;
    int _1854 = _1802 + _1842;
    int _1856 = ~_1742;
    int _1858 = _1856 + 1;
    int _1860 = _1858 + 1;
    bool _1862 = _1722 != 3;
    int _1864 = _1860;
    float _1866 = _1840;
    if (_1804)
    {
        int _1868 = ~_1742;
        int _1870 = _1868 + 1;
        _1864 = _1870;
    }
    int _1872 = _1864;
    bool _1874 = !_1724;
    int _1876 = _1874 ? 0 : 1;
    int _1878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1880 = _1878 != 0;
    int _1882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1884 = _1882 != 0;
    int _1886 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1888 = _1886 != 0;
    int _1890 = _1846 >> 2;
    int _1892 = ~_1696;
    int _1894 = _1892 + _1850;
    int _1896 = _1894 + 1;
    int _1898 = _1854 >> 2;
    bool _1900 = !_1862;
    int _1902 = _1900 ? 0 : (-1);
    int _1904 = _1181 * _1896;
    int _1906 = _1904 + _1538;
    bool _1908 = uint(_1820) >= 2u;
    int _1910 = _1890 << 4;
    int _1912 = _1910 + 368;
    int _1914 = _1898 << 4;
    int _1916 = _1914 + 512;
    int _1918 = ~_1852;
    int _1920 = _1918 + 1;
    int _1922 = _1920 + 1;
    uint _1924 = uint(int(uint(_1912) >> uint(2)));
    uint _1926 = uint(int(uint(int(_1924)) >> uint(2)));
    int _1928 = int(_1924) & 3;
    float _1930 = (*spvDescriptorSet0.vp_c9)._m0[int(_1926)][_1928];
    int _1932 = int(_1924) + 1;
    uint _1934 = uint(int(uint(_1932) >> uint(2)));
    int _1936 = _1932 & 3;
    float _1938 = (*spvDescriptorSet0.vp_c9)._m0[int(_1934)][_1936];
    int _1940 = _1922;
    if (!_1844)
    {
        int _1942 = ~_1852;
        int _1944 = _1942 + 1;
        _1940 = _1944;
    }
    int _1946 = _1940;
    int _1948 = _1908 ? 0 : 1;
    bool _1950 = _1820 != 3;
    bool _1952 = _1820 != 3;
    int _1954 = _1912 + 8;
    uint _1956 = uint(int(uint(_1954) >> uint(2)));
    uint _1958 = uint(int(uint(int(_1956)) >> uint(2)));
    int _1960 = int(_1956) & 3;
    float _1962 = (*spvDescriptorSet0.vp_c9)._m0[int(_1958)][_1960];
    int _1964 = int(_1956) + 1;
    uint _1966 = uint(int(uint(_1964) >> uint(2)));
    int _1968 = _1964 & 3;
    float _1970 = (*spvDescriptorSet0.vp_c9)._m0[int(_1966)][_1968];
    int _1972 = ~_1948;
    int _1974 = _1972 + 1;
    int _1976 = _1974 + 1;
    bool _1978 = !_1205;
    int _1980 = _1978 ? _1906 : (-1);
    uint _1982 = uint(int(uint(_1916) >> uint(2)));
    uint _1984 = uint(int(uint(int(_1982)) >> uint(2)));
    int _1986 = int(_1982) & 3;
    float _1988 = (*spvDescriptorSet0.vp_c9)._m0[int(_1984)][_1986];
    int _1990 = int(_1982) + 1;
    uint _1992 = uint(int(uint(_1990) >> uint(2)));
    int _1994 = _1990 & 3;
    float _1996 = (*spvDescriptorSet0.vp_c9)._m0[int(_1992)][_1994];
    int _1998 = _1976;
    if (_1950)
    {
        int _2000 = ~_1948;
        int _2002 = _2000 + 1;
        _1998 = _2002;
    }
    int _2004 = _1998;
    float _2006 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2008 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2010 = _2008 != 0;
    float _2012 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2014 = _1916 + 8;
    uint _2016 = uint(int(uint(_2014) >> uint(2)));
    uint _2018 = uint(int(uint(int(_2016)) >> uint(2)));
    int _2020 = int(_2016) & 3;
    float _2022 = (*spvDescriptorSet0.vp_c9)._m0[int(_2018)][_2020];
    int _2024 = int(_2016) + 1;
    uint _2026 = uint(int(uint(_2024) >> uint(2)));
    int _2028 = _2024 & 3;
    float _2030 = (*spvDescriptorSet0.vp_c9)._m0[int(_2026)][_2028];
    float _2032 = _2006 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2034 = abs(_1946);
    float _2036 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2038 = abs(_1790);
    float _2040 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2042 = abs(_1876);
    float _2044 = _2036 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2046 = !_1952;
    int _2048 = _2046 ? 0 : (-1);
    float _2050 = _2040 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2052 = _231 > 0.5;
    bool _2054 = _233 > 0.5;
    out.m_82.x = _2044;
    out.m_82.y = _2032;
    out.m_82.z = _2050;
    out.m_82.w = _2012;
    int _2056 = ~_2038;
    int _2058 = _2056 + 1;
    int _2060 = _2058 + 1;
    float _2062 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2064 = -_195;
    int _2066 = _2052 ? as_type<int>(_2064) : as_type<int>(_195);
    float _2068 = _1167 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2070 = _235 > 0.5;
    float _2072 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2074 = _2060 * as_type<int>(_1938);
    int _2076 = abs(_1872);
    float _2078 = _2062 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2080 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2082 = int(_2080);
    float _2084 = _2072 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2086 = abs(as_type<int>(_1840));
    if (_1035)
    {
        float _2088 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2090 = _1119 + _2088;
        _1866 = _2090;
    }
    float _2092 = _1866;
    int _2094 = ~_2034;
    int _2096 = _2094 + 1;
    int _2098 = _2096 + 1;
    int _2100 = ~_2042;
    int _2102 = _2100 + 1;
    int _2104 = _2102 + 1;
    out.m_84.x = _2068;
    out.m_84.y = _2078;
    out.m_84.z = _2084;
    int _2106 = ~_2086;
    int _2108 = _2106 + 1;
    int _2110 = _2108 + 1;
    int _2112 = _2098 * as_type<int>(_1996);
    int _2114 = abs(_1902);
    int _2116 = _2104 * as_type<int>(_1930);
    int _2118 = _2116 + _2074;
    int _2120 = abs(_2048);
    int _2122 = _2110 * as_type<int>(_1988);
    int _2124 = _2122 + _2112;
    float _2126 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2128 = int(_2126);
    int _2130 = abs(_2004);
    float _2132 = _937 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2134 = ~_2076;
    int _2136 = _2134 + 1;
    int _2138 = _2136 + 1;
    float _2140 = _949 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2142 = _937 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2144 = float(uint(_2082));
    int _2146 = _2138 * as_type<int>(_1962);
    int _2148 = _2146 + _2118;
    int _2150 = ~_2114;
    int _2152 = _2150 + 1;
    int _2154 = _2152 + 1;
    float _2156 = _949 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2158 = ~_2130;
    int _2160 = _2158 + 1;
    int _2162 = _2160 + 1;
    if (_1035)
    {
        float _2164 = _2092 * _2092;
        _1057 = _2164;
    }
    float _2166 = _1057;
    float _2168 = 1.0 / _2144;
    int _2170 = _2154 * as_type<int>(_1970);
    int _2172 = _2170 + _2148;
    int _2174 = abs(_1816);
    int _2176 = _2162 * as_type<int>(_2022);
    int _2178 = _2176 + _2124;
    int _2180 = abs(_2082);
    int _2182 = ~_2174;
    int _2184 = _2182 + 1;
    int _2186 = _2184 + 1;
    int _2188 = ~_2120;
    int _2190 = _2188 + 1;
    int _2192 = _2190 + 1;
    float _2194 = float(uint(_2128));
    int _2196 = _2172 * _2186;
    int _2198 = _2192 * as_type<int>(_2030);
    int _2200 = _2198 + _2178;
    int _2202 = abs(_1828);
    float _2204 = _937 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2206 = _1808 * _2174;
    int _2208 = _2206 + _2196;
    float _2210 = 1.0 / _2194;
    float _2212 = float(uint(_2180));
    float _2214 = -_931;
    float _2216 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2132);
    int _2218 = abs(_2128);
    float _2220 = -_931;
    float _2222 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2204);
    int _2224 = as_type<int>(_2168) + (-2);
    float _2226 = _957 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2228 = float(uint(_2208));
    float _2230 = 1.0 / _2212;
    float _2232 = -_931;
    float _2234 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2142);
    int _2236 = ~_2202;
    int _2238 = _2236 + 1;
    int _2240 = _2238 + 1;
    float _2242 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2216);
    float _2244 = float(uint(_2218));
    float _2246 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2234);
    float _2248 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2222);
    float _2250 = _949 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2252 = as_type<float>(_2224) * _2228;
    int _2254 = _2200 * _2240;
    float _2256 = 1.0 / _2244;
    float _2258 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2250);
    int _2260 = abs(_2208);
    int _2262 = _1980 * _2202;
    int _2264 = _2262 + _2254;
    float _2266 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2140);
    float _2268 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2156);
    int _2270 = as_type<int>(_2210) + (-2);
    float _2272 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2258);
    float _2274 = trunc(_2252);
    float _2276 = precise::max(_2274, 0.0);
    uint _2278 = uint(_2276);
    float _2280 = float(uint(_2264));
    int _2282 = abs(_2264);
    float _2284 = as_type<float>(_2270) * _2280;
    float _2286 = float(uint(_2260));
    float _2288 = as_type<float>(_2200);
    if (_1035)
    {
        float _2290 = _1079 * 6.283185482025146484375;
        float _2292 = cos(_2290);
        _2288 = _2292;
    }
    float _2294 = _2288;
    int _2296 = ~_2082;
    int _2298 = _2296 + 1;
    float _2300 = _957 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2302 = as_type<int>(_2256) + (-2);
    float _2304 = float(uint(_2282));
    bool _2306 = !_1880;
    float _2308 = _2306 ? _199 : as_type<float>(_1794);
    float _2310 = trunc(_2284);
    float _2312 = precise::max(_2310, 0.0);
    uint _2314 = uint(_2312);
    int _2316 = as_type<int>(_2230) + (-2);
    float _2318 = _957 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2320 = !_2010;
    float _2322 = _2320 ? _195 : as_type<float>(_2066);
    bool _2324 = _2128 == 0;
    float _2326 = as_type<float>(_2316) * _2286;
    float _2328 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2300);
    int _2330 = _2298 * int(_2278);
    int _2332 = _2330 + _2208;
    float _2334 = as_type<float>(_2302) * _2304;
    float _2336 = trunc(_2326);
    float _2338 = precise::max(_2336, 0.0);
    uint _2340 = uint(_2338);
    float _2342 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2318);
    float _2344 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2226);
    float _2346 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2328);
    float _2348 = float(uint(_2332));
    float _2350 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2342);
    float _2352 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2344);
    int _2354 = ~_2180;
    int _2356 = _2354 + 1;
    float _2358 = trunc(_2334);
    float _2360 = precise::max(_2358, 0.0);
    uint _2362 = uint(_2360);
    int _2364 = ~_2128;
    int _2366 = _2364 + 1;
    float _2368 = as_type<float>(_2224) * _2348;
    float _2370 = as_type<float>(_2356);
    if (_1035)
    {
        float _2372 = _2294 + (-1.0);
        _2370 = _2372;
    }
    float _2374 = _2370;
    int _2376 = ~_2218;
    int _2378 = _2376 + 1;
    int _2380 = _2366 * int(_2314);
    int _2382 = _2380 + _2264;
    int _2384 = _2356 * int(_2340);
    int _2386 = _2384 + _2260;
    float _2388 = _2374;
    if (_1035)
    {
        float _2390 = _2374 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2388 = _2390;
    }
    float _2392 = _2388;
    float _2394 = trunc(_2368);
    float _2396 = precise::max(_2394, 0.0);
    uint _2398 = uint(_2396);
    float _2400 = float(uint(_2382));
    float _2402 = float(uint(_2386));
    if (_1035)
    {
        float _2404 = fma(_1097, _2294, _2392);
        _1099 = _2404;
    }
    float _2406 = _1099;
    float _2408 = -_199;
    int _2410 = _2054 ? as_type<int>(_2408) : as_type<int>(_199);
    int _2412 = _2378 * int(_2362);
    int _2414 = _2412 + _2282;
    float _2416 = as_type<float>(_2316) * _2402;
    bool _2418 = !_1884;
    float _2420 = _2418 ? _199 : as_type<float>(_2410);
    float _2422 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2424 = float(uint(_2414));
    float _2426 = as_type<float>(_2270) * _2400;
    float _2428 = -_195;
    int _2430 = _2070 ? as_type<int>(_2428) : as_type<int>(_195);
    float _2432 = trunc(_2416);
    float _2434 = precise::max(_2432, 0.0);
    uint _2436 = uint(_2434);
    float _2438 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2266);
    float _2440 = as_type<float>(_2302) * _2424;
    bool _2442 = !_1888;
    float _2444 = _2442 ? _195 : as_type<float>(_2430);
    float _2446 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2448 = _2422 * _2246;
    float _2450 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2268);
    float _2452 = _2422 * _2248;
    float _2454 = trunc(_2426);
    float _2456 = precise::max(_2454, 0.0);
    uint _2458 = uint(_2456);
    float _2460 = fma(_2446, _2272, _2448);
    float _2462 = _2448;
    float _2464 = as_type<float>(_2436);
    if (_1035)
    {
        float _2466 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2468 = _1123 + _2466;
        _2462 = _2468;
    }
    float _2470 = _2462;
    float _2472 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2474 = _2406 + _2472;
    out.m_86.x = _2272;
    out.m_86.y = _2438;
    out.m_86.z = _2450;
    if (_1035)
    {
        float _2476 = _2470 * _2470;
        _1059 = _2476;
    }
    float _2478 = _1059;
    int _2480 = int(_2278) + int(_2398);
    float _2482 = trunc(_2440);
    float _2484 = precise::max(_2482, 0.0);
    uint _2486 = uint(_2484);
    float _2488 = _2422 * _2242;
    int _2490 = ~_2082;
    int _2492 = _2490 + 1;
    float _2494 = fma(_2474, _2474, _2166);
    bool _2496 = _2128 == 0;
    float _2498 = fma(_2446, _2438, _2488);
    float _2500 = fma(_2446, _2450, _2452);
    int _2502 = ~_2180;
    int _2504 = _2502 + 1;
    int _2506 = int(_2314) + int(_2458);
    int _2508 = ~_2128;
    int _2510 = _2508 + 1;
    int _2512 = int(_2340) + int(_2436);
    int _2514 = int(_2362) + int(_2486);
    int _2516 = _2492 * _2480;
    int _2518 = _2516 + _2208;
    int _2520 = ~_2218;
    int _2522 = _2520 + 1;
    int _2524 = _2504 * _2512;
    int _2526 = _2524 + _2260;
    float _2528 = _2494 + _2478;
    int _2530 = _2510 * _2506;
    int _2532 = _2530 + _2264;
    bool _2534 = uint(_2518) >= uint(_2082);
    int _2536 = _2522 * _2514;
    int _2538 = _2536 + _2282;
    float _2540 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2542 = uint(_2526) >= uint(_2180);
    bool _2544 = uint(_2532) >= uint(_2128);
    bool _2546 = !_2534;
    int _2548 = _2546 ? 0 : (-1);
    bool _2550 = !_2544;
    int _2552 = _2550 ? 0 : (-1);
    float _2554 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2556 = ~_2480;
    int _2558 = _2556 + _2548;
    int _2560 = _2558 + 1;
    bool _2562 = uint(_2538) >= uint(_2218);
    int _2564 = ~_2506;
    int _2566 = _2564 + _2552;
    int _2568 = _2566 + 1;
    int _2570 = _2082 * _2560;
    int _2572 = _2570 + _2208;
    int _2574 = _2208 ^ _2082;
    float _2576 = sqrt(_2528);
    bool _2578 = !_2562;
    int _2580 = _2578 ? 0 : (-1);
    int _2582 = _2128 * _2568;
    int _2584 = _2582 + _2264;
    bool _2586 = !_2542;
    int _2588 = _2586 ? 0 : (-1);
    uint _2590 = uint(int(uint(_2574) >> uint(31)));
    bool _2592 = _2082 == 0;
    float _2594 = _2554 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2596 = _2082 == 0;
    float _2598 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2600 = _2264 ^ _2128;
    int _2602 = ~_2580;
    int _2604 = _2514 + _2602;
    int _2606 = _2604 + 1;
    int _2608 = ~_2588;
    int _2610 = _2512 + _2608;
    int _2612 = _2610 + 1;
    float _2614 = fma(_2422, _2422, 1.0);
    int _2616 = ~int(_2590);
    int _2618 = _2616 + 1;
    float _2620 = _2540 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2622 = !_2592;
    int _2624 = _2622 ? _2572 : (-1);
    float _2626 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _2628 = uint(int(uint(_2600) >> uint(31)));
    int _2630 = _2612 ^ _2618;
    float _2632 = float(_2624);
    int _2634 = ~int(_2628);
    int _2636 = _2634 + 1;
    int _2638 = ~_2618;
    int _2640 = _2638 + _2630;
    int _2642 = _2640 + 1;
    float _2644 = fma(_2620, _2632, _605);
    bool _2646 = !_2324;
    int _2648 = _2646 ? _2584 : (-1);
    float _2650 = rsqrt(_2614);
    int _2652 = _2606 ^ _2636;
    float _2654 = float(_2648);
    float _2656 = _2598 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2658 = ~_2636;
    int _2660 = _2658 + _2652;
    int _2662 = _2660 + 1;
    float _2664 = _2322 + 0.5;
    bool _2666 = !_2596;
    int _2668 = _2666 ? _2642 : (-1);
    float _2670 = fma(_2656, _2654, _691);
    bool _2672 = !_2496;
    int _2674 = _2672 ? _2662 : (-1);
    float _2676 = fma(_2620, _2664, _2644);
    float _2678 = float(_2668);
    float _2680 = _2444 + 0.5;
    float _2682 = float(_2674);
    float _2684 = _2626 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2686 = -_1155;
    float _2688 = fma(_2322, _2686, _2676);
    float _2690 = -_677;
    float _2692 = fma(_2594, _2678, _2690);
    float _2694 = _2420 + (-0.5);
    float _2696 = fma(_2656, _2680, _2670);
    float _2698 = _2422 * _2650;
    float _2700 = -_693;
    float _2702 = fma(_2684, _2682, _2700);
    float _2704 = _2308 + (-0.5);
    float _2706 = -_2594;
    float _2708 = fma(_2706, _2694, _2692);
    float _2710 = -_2346;
    float _2712 = _2698 * _2710;
    float _2714 = -_2350;
    float _2716 = _2698 * _2714;
    float _2718 = -_2352;
    float _2720 = _2698 * _2718;
    float _2722 = -_2684;
    float _2724 = fma(_2722, _2704, _2702);
    float _2726 = fma(_2650, _2242, _2712);
    float _2728 = fma(_2650, _2246, _2716);
    float _2730 = -_1151;
    float _2732 = fma(_2444, _2730, _2696);
    float _2734 = fma(_2650, _2248, _2720);
    float _2736 = _2350 + _2460;
    float _2738 = fma(_2420, _1165, _2708);
    float _2740 = fma(_2308, _1175, _2724);
    float _2742 = _2346 + _2498;
    float _2744 = _2352 + _2500;
    out.m_88.x = _2728;
    out.m_88.y = _2726;
    out.m_88.z = _2734;
    bool _2746 = _2576 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2748 = isnan(_2576);
    bool _2750 = _2746 || _2748;
    bool _2752 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2754 = _2750 || _2752;
    out.m_90.x = _2688;
    out.m_90.y = _2738;
    out.m_90.z = _2732;
    out.m_90.w = _2740;
    out.m_92.x = _1133;
    out.m_92.y = _1135;
    out.m_92.z = _1137;
    out.m_94.x = _2736;
    out.m_94.y = _2742;
    out.m_94.z = _2744;
    float _2756 = as_type<float>(_2522);
    float _2758 = _2614;
    float _2760 = as_type<float>(_2636);
    if (!_2754)
    {
        _1213 = 1.0;
    }
    float _2762 = _1213;
    bool _2764 = !_2754;
    float _2766 = _2762;
    if (!_2764)
    {
        bool _2768 = _2576 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2770 = isnan(_2576);
        bool _2772 = _2768 || _2770;
        bool _2774 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2776 = _2772 || _2774;
        if (!_2776)
        {
            float _2778 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2780 = _2576 + _2778;
            float _2782 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2784 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2782;
            float _2786 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2788 = _2786 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2790 = 1.0 / _2784;
            float _2792 = _2780 * _2790;
            float _2794 = fma(_2792, _2788, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2766 = _2794;
            _2796 = true;
        }
        else
        {
            bool _2798 = _2576 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2800 = isnan(_2576);
            bool _2802 = _2798 || _2800;
            bool _2804 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2806 = _2802 || _2804;
            if (!_2806)
            {
                float _2808 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2810 = _2576 + _2808;
                float _2812 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2814 = _2812 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2816 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2818 = _2816 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2820 = 1.0 / _2814;
                float _2822 = _2810 * _2820;
                float _2824 = fma(_2822, _2818, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2766 = _2824;
                _2796 = true;
            }
            else
            {
                _2766 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2796 = false;
    float _2826 = _2766;
    float _2828 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2830 = _2406 + _2828;
    float _2832 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2834 = _1119 + _2832;
    float _2836 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2838 = _1123 + _2836;
    float _2840 = fma(_2830, _2826, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2842 = fma(_2834, _2826, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2844 = fma(_2838, _2826, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2846 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2848 = _2840 + _2846;
    float _2850 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2852 = _2842 + _2850;
    float _2854 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2856 = _2844 + _2854;
    float _2858 = _2848 * _2848;
    float _2860 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2862 = fma(_2852, _2852, _2858);
    float _2864 = _1083 + _2860;
    float _2866 = fma(_2856, _2856, _2862);
    float _2868 = _1083 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2870 = rsqrt(_2866);
    float _2872 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2868);
    float _2874 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2872);
    float _2876 = sqrt(_2866);
    float _2878 = _2874 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2880 = _2870 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2882 = _1083 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2884 = _2852 * _2880;
    float _2886 = _2856 * _2880;
    float _2888 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2882);
    float _2890 = _2884 * _2884;
    float _2892 = _2886 * _2886;
    float _2894 = 1.0 / _2878;
    float _2896 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2888);
    float _2898 = _2890 + _2892;
    float _2900 = _2896 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2902 = sqrt(_2898);
    float _2904 = _2900 + _2878;
    float _2906 = _2864 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2908 = _2904 * _2894;
    float _2910 = _2908 * 0.5;
    float _2912 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2914 = fma(_2910, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2912);
    float _2916 = fma(_993, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2918 = _2864 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    bool _2920 = _2902 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2922 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2924 = _2902 + _2922;
    float _2926 = 1.0 / _2914;
    float _2928 = fma(_993, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2918);
    float _2930 = fma(_995, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2928);
    float _2932 = floor(_2916);
    float _2934 = _2930 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2936 = _1135;
    int _2938 = 2;
    float _2940 = _2880;
    float _2942 = _2884;
    float _2944 = _2890;
    if (_2920)
    {
        float _2946 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2936 = _2946;
    }
    float _2948 = _2936;
    float _2950 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2952 = _2926 * _2950;
    float _2954 = fma(_993, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2906);
    bool _2956 = _2952 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2958 = fma(_995, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2954);
    bool _2960 = _2952 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2962 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2964 = trunc(_2934);
    int _2966 = int(_2964);
    float _2968 = _2958 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2970 = -_2932;
    float _2972 = _2916 + _2970;
    float _2974 = precise::max(0.0, _2962);
    float _2976 = _2958;
    if (_2920)
    {
        float _2978 = _2924 * _2948;
        _2976 = _2978;
    }
    float _2980 = _2976;
    float _2982 = trunc(_2968);
    int _2984 = int(_2982);
    if (!_2956)
    {
        _2938 = 1;
    }
    int _2986 = _2938;
    int _2988 = _2986;
    if (_2920)
    {
        float _2990 = _2980 * 0.15915493667125701904296875;
        _2756 = _2990;
    }
    float _2992 = _2756;
    bool _2994 = !_2956;
    int _2996 = _2994 ? 0 : 1;
    float _2998 = -_2880;
    float _3000 = -_2974;
    float _3002 = fma(_2848, _2998, _3000);
    if (!_2960)
    {
        _2988 = _2996;
    }
    int _3004 = _2988;
    float _3006 = _2930;
    if (_2920)
    {
        float _3008 = _2992 * 6.283185482025146484375;
        float _3010 = sin(_3008);
        _3006 = _3010;
    }
    float _3012 = _3006;
    if (_2920)
    {
        float _3014 = _3002 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2940 = _3014;
    }
    float _3016 = _2940;
    int _3018 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _3020 = _2966 + _3018;
    int _3022 = _3020 + 1;
    int _3024 = _3004 << 6;
    int _3026 = _3024 + 96;
    uint _3028 = uint(int(uint(_3026) >> uint(2)));
    uint _3030 = uint(int(uint(int(_3028)) >> uint(2)));
    int _3032 = int(_3028) & 3;
    float _3034 = (*spvDescriptorSet0.vp_c15)._m0[int(_3030)][_3032];
    int _3036 = int(_3028) + 1;
    uint _3038 = uint(int(uint(_3036) >> uint(2)));
    int _3040 = _3036 & 3;
    float _3042 = (*spvDescriptorSet0.vp_c15)._m0[int(_3038)][_3040];
    int _3044 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3046 = _2984 + _3044;
    int _3048 = _3046 + 1;
    float _3050 = _2898;
    int _3052 = _3048;
    if (_2920)
    {
        float _3054 = rsqrt(_2898);
        _3050 = _3054;
    }
    float _3056 = _3050;
    bool _3058 = _3022 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _3060 = fma(_995, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    int _3062 = _3022 | _3048;
    int _3064 = _3024 + 48;
    uint _3066 = uint(int(uint(_3064) >> uint(2)));
    uint _3068 = uint(int(uint(int(_3066)) >> uint(2)));
    int _3070 = int(_3066) & 3;
    float _3072 = (*spvDescriptorSet0.vp_c15)._m0[int(_3068)][_3070];
    int _3074 = int(_3066) + 1;
    uint _3076 = uint(int(uint(_3074) >> uint(2)));
    int _3078 = _3074 & 3;
    float _3080 = (*spvDescriptorSet0.vp_c15)._m0[int(_3076)][_3078];
    if (_2920)
    {
        float _3082 = fma(_3012, _3016, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2758 = _3082;
    }
    float _3084 = _2758;
    float _3086 = _2992;
    float _3088 = _3084;
    if (_2920)
    {
        float _3090 = _2992 * 6.283185482025146484375;
        float _3092 = cos(_3090);
        _3086 = _3092;
    }
    float _3094 = _3086;
    bool _3096 = _3062 < 0;
    bool _3098 = _3096 || _3058;
    float _3100 = _2840 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _3102 = _3048 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3104 = _3102 || _3098;
    int _3106 = _3024 + 104;
    uint _3108 = uint(int(uint(_3106) >> uint(2)));
    uint _3110 = uint(int(uint(int(_3108)) >> uint(2)));
    int _3112 = int(_3108) & 3;
    float _3114 = (*spvDescriptorSet0.vp_c15)._m0[int(_3110)][_3112];
    int _3116 = int(_3108) + 1;
    uint _3118 = uint(int(uint(_3116) >> uint(2)));
    int _3120 = _3116 & 3;
    float _3122 = (*spvDescriptorSet0.vp_c15)._m0[int(_3118)][_3120];
    float _3124 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3100);
    float _3126 = floor(_3060);
    float _3128 = _3056;
    if (_2920)
    {
        float _3130 = _3056 * _3084;
        _2464 = _3130;
    }
    float _3132 = _2464;
    if (!_2920)
    {
        _3088 = _3002;
    }
    float _3134 = _3088;
    float _3136 = fma(_2844, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3124);
    float _3138 = _3134;
    if (_2920)
    {
        float _3140 = _2884 * _3132;
        _2942 = _3140;
    }
    float _3142 = _2942;
    int _3144 = _3024 + 64;
    uint _3146 = uint(int(uint(_3144) >> uint(2)));
    uint _3148 = uint(int(uint(int(_3146)) >> uint(2)));
    int _3150 = int(_3146) & 3;
    float _3152 = (*spvDescriptorSet0.vp_c15)._m0[int(_3148)][_3150];
    int _3154 = int(_3146) + 1;
    uint _3156 = uint(int(uint(_3154) >> uint(2)));
    int _3158 = _3154 & 3;
    float _3160 = (*spvDescriptorSet0.vp_c15)._m0[int(_3156)][_3158];
    float _3162 = _3094;
    if (_2920)
    {
        float _3164 = _3094 + (-1.0);
        _3128 = _3164;
    }
    float _3166 = _3128;
    float _3168 = _3166;
    if (_2920)
    {
        float _3170 = _3142 * _3142;
        _2944 = _3170;
    }
    float _3172 = _2944;
    if (!_3104)
    {
        float _3174 = floor(_2968);
        _2760 = _3174;
    }
    float _3176 = _2760;
    if (_2920)
    {
        float _3178 = _3166 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1143 = _3178;
    }
    float _3180 = _1143;
    if (!_2920)
    {
        _3168 = _2886;
    }
    float _3182 = _3168;
    int _3184 = _3024 + 80;
    uint _3186 = uint(int(uint(_3184) >> uint(2)));
    uint _3188 = uint(int(uint(int(_3186)) >> uint(2)));
    int _3190 = int(_3186) & 3;
    float _3192 = (*spvDescriptorSet0.vp_c15)._m0[int(_3188)][_3190];
    int _3194 = int(_3186) + 1;
    uint _3196 = uint(int(uint(_3194) >> uint(2)));
    int _3198 = _3194 & 3;
    float _3200 = (*spvDescriptorSet0.vp_c15)._m0[int(_3196)][_3198];
    float _3202 = _3182;
    if (_2920)
    {
        float _3204 = _2886 * _3132;
        _3202 = _3204;
    }
    float _3206 = _3202;
    float _3208 = _3136 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (_2920)
    {
        float _3210 = fma(_3002, _3094, _3180);
        _3138 = _3210;
    }
    float _3212 = _3138;
    if (!_2920)
    {
        _3162 = _2892;
    }
    float _3214 = _3162;
    float _3216 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3218 = _3208 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3220 = -_3126;
    float _3222 = _3060 + _3220;
    int _3224 = _3024 + 56;
    uint _3226 = uint(int(uint(_3224) >> uint(2)));
    uint _3228 = uint(int(uint(int(_3226)) >> uint(2)));
    int _3230 = int(_3226) & 3;
    float _3232 = (*spvDescriptorSet0.vp_c15)._m0[int(_3228)][_3230];
    int _3234 = int(_3226) + 1;
    uint _3236 = uint(int(uint(_3234) >> uint(2)));
    int _3238 = _3234 & 3;
    float _3240 = (*spvDescriptorSet0.vp_c15)._m0[int(_3236)][_3238];
    float _3242 = _3214;
    int _3244 = as_type<int>(_3218);
    if (_2920)
    {
        float _3246 = _3206 * _3206;
        _3242 = _3246;
    }
    float _3248 = _3242;
    float _3250 = fma(_3212, _3212, _3172);
    float _3252 = -_3218;
    float _3254 = fma(_3252, _3216, 1.0);
    if (!_3104)
    {
        int _3256 = _3048 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3258 = _3256 + _3022;
        _3244 = _3258;
    }
    int _3260 = _3244;
    float _3262 = _3250 + _3248;
    int _3264 = _3024 + 72;
    uint _3266 = uint(int(uint(_3264) >> uint(2)));
    uint _3268 = uint(int(uint(int(_3266)) >> uint(2)));
    int _3270 = int(_3266) & 3;
    float _3272 = (*spvDescriptorSet0.vp_c15)._m0[int(_3268)][_3270];
    int _3274 = int(_3266) + 1;
    uint _3276 = uint(int(uint(_3274) >> uint(2)));
    int _3278 = _3274 & 3;
    float _3280 = (*spvDescriptorSet0.vp_c15)._m0[int(_3276)][_3278];
    float _3282 = _2864 * _3042;
    float _3284 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3286 = fma(_2876, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3284);
    float _3288 = precise::clamp(_3286, 0.0, 1.0);
    int _3290 = as_type<int>(_3034);
    if (!_3104)
    {
        int _3292 = _3260 << 2;
        _3052 = _3292;
    }
    int _3294 = _3052;
    float _3296 = log2(_3254);
    float _3298 = fma(_993, _3034, _3282);
    int _3300 = _3294;
    if (!_3104)
    {
        int _3302 = 12 & _3294;
        _3300 = _3302;
    }
    int _3304 = _3300;
    int _3306 = _3024 + 88;
    uint _3308 = uint(int(uint(_3306) >> uint(2)));
    uint _3310 = uint(int(uint(int(_3308)) >> uint(2)));
    int _3312 = int(_3308) & 3;
    float _3314 = (*spvDescriptorSet0.vp_c15)._m0[int(_3310)][_3312];
    int _3316 = int(_3308) + 1;
    uint _3318 = uint(int(uint(_3316) >> uint(2)));
    int _3320 = _3316 & 3;
    float _3322 = (*spvDescriptorSet0.vp_c15)._m0[int(_3318)][_3320];
    float _3324 = _2864 * _3080;
    float _3326 = fma(_993, _3072, _3324);
    int _3328 = as_type<int>(_3324);
    if (!_3104)
    {
        uint _3330 = uint(int(uint(_3260) >> uint(2)));
        _3328 = int(_3330);
    }
    int _3332 = _3328;
    float _3334 = fma(_995, _3114, _3298);
    if (!_3104)
    {
        int _3336 = _3332 << 4;
        int _3338 = _3336 + _3304;
        _3290 = _3338;
    }
    int _3340 = _3290;
    float _3342 = _3334 + _3122;
    float _3344 = _2840 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3346 = _3296 * 0.693147182464599609375;
    float _3348 = _2864 * _3160;
    float _3350 = _3160;
    if (!_3104)
    {
        float _3352 = -_3176;
        float _3354 = _2968 + _3352;
        _3350 = _3354;
    }
    float _3356 = _3350;
    float _3358 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3344);
    float _3360 = rsqrt(_3262);
    float _3362 = fma(_993, _3152, _3348);
    float _3364 = _2864 * _3200;
    float _3366 = fma(_993, _3192, _3364);
    float _3368 = -_3288;
    float _3370 = _3368 + 1.0;
    float2 _9120 = float2(_2972, _3222);
    float _3372 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9120, float2(0.0), isnan(_9120)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9120, float2(0.0), isnan(_9120)), level(0.0)).x;
    float _3374 = fma(_995, _3232, _3326);
    float _3376 = _3346 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3378 = 1.0 / _3342;
    float _3380 = _3360 * _3142;
    float _3382 = _3374 + _3240;
    float _3384 = _3360 * _3212;
    float _3386 = _3360 * _3206;
    float _3388 = _3380 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3390 = fma(_995, _3272, _3362);
    float _3392 = _2840 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3394 = abs(_3370);
    float _3396 = log2(_3394);
    float _3398 = fma(_2844, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3358);
    float _3400 = _3390 + _3280;
    float _3402 = _2840 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3404 = -_3388;
    float _3406 = fma(_3384, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3404);
    float _3408 = _3398 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3410 = fma(_995, _3314, _3366);
    float _3412 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3402);
    float _3414 = _3382 * _3378;
    float _3416 = _3400 * _3378;
    float _3418 = -_3386;
    float _3420 = fma(_3418, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3406);
    float _3422 = fma(_2844, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3412);
    float _3424 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3392);
    bool _3426 = _3414 >= 0.0;
    float _3428 = _3408 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3430 = _3422 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3432 = _3396 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _3434 = _3414 <= 1.0;
    bool _3436 = _3434 && _3426;
    float _3438 = fma(_3420, 0.5, 0.5);
    float _3440 = fma(_2844, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3424);
    float _3442 = exp2(_3432);
    bool _3444 = _3416 >= 0.0;
    bool _3446 = _3444 && _3436;
    float _3448 = fma(_3430, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3428);
    float _3450 = fma(_3420, -0.5, 0.5);
    float _3452 = _3388;
    if (!_3104)
    {
        int _3454 = _3340 + 400;
        uint _3456 = uint(int(uint(_3454) >> uint(2)));
        uint _3458 = uint(int(uint(int(_3456)) >> uint(2)));
        int _3460 = int(_3456) & 3;
        float _3462 = (*spvDescriptorSet0.vp_c15)._m0[int(_3458)][_3460];
        _3452 = _3462;
    }
    float _3464 = _3452;
    bool _3466 = _3416 <= 1.0;
    bool _3468 = _3466 && _3446;
    float _3470 = _3440 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3472 = fma(_3208, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3448);
    float _3474 = _3384 + 1.0;
    float _3476 = sqrt(_3450);
    float _3478 = _3410 + _3322;
    float _3480 = fma(_3470, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3472);
    float _3482 = fma(_3438, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3484 = _3408 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3486 = _3408 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3488 = fma(_3438, _3482, -0.212114393711090087890625);
    float _3490 = -_3384;
    float _3492 = fma(_3442, _3474, _3490);
    float _3494 = _3386;
    float _3496 = _3472;
    float _3498 = _3474;
    if (!_3104)
    {
        float _3500 = floor(_2934);
        _3494 = _3500;
    }
    float _3502 = _3494;
    if (_3468)
    {
        float _3504 = float(_3004);
        _3496 = _3504;
    }
    float _3506 = _3496;
    float _3508 = fma(_3438, _3488, 1.570728778839111328125);
    float _3510 = fma(_3430, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3484);
    float _3512 = fma(_3430, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3486);
    float _3514 = _3478 * _3378;
    float _3516 = fma(_3208, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3510);
    float _3518 = 1.0 / _3480;
    float _3520 = fma(_3208, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3512);
    float _3522 = _3476 * 0.636619746685028076171875;
    float _3524 = fma(_3470, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3516);
    float _3526 = fma(_3470, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3520);
    float _3528 = -_3508;
    float _3530 = fma(_3522, _3528, 1.0);
    float _3532 = _3510;
    if (_3468)
    {
        float _3534 = rint(_3506);
        float _3536 = precise::max(_3534, 0.0);
        uint _3538 = uint(_3536);
        uint _3540 = clamp(_3538, 0u, 65535u);
        _3532 = as_type<float>(_3540);
    }
    float _3542 = _3532;
    if (!_3104)
    {
        float _3544 = -_3502;
        float _3546 = _2934 + _3544;
        _3498 = _3546;
    }
    float _3548 = _3498;
    float _3550 = _3524 * _3518;
    float _3552 = _3526 * _3518;
    float _3554 = fma(_3492, 0.5, 0.5);
    float _3556 = fma(_3550, 0.5, 0.5);
    float _3558 = fma(_3552, -0.5, 0.5);
    float _3560 = _3542;
    if (_3468)
    {
        float3 _9446 = float3(_3414, _3416, float(as_type<int>(_3542)));
        float3 _9450 = select(_9446, float3(0.0), isnan(_9446));
        float _3562 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9450.xy, uint(rint(_9450.z)), _3514, level(0.0));
        _3560 = _3562;
    }
    float _3564 = _3560;
    float3 _9460 = float3(_3556, _3558, _3376);
    float _3566 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9460, float3(0.0), isnan(_9460)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9460, float3(0.0), isnan(_9460)), level(0.0)).x;
    float3 _9469 = float3(_3556, _3558, _3376);
    float4 _3569 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9469, float3(0.0), isnan(_9469)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9469, float3(0.0), isnan(_9469)), level(0.0)).xyzw;
    float _3571 = _3569.x;
    float _3573 = _3569.y;
    float _3575 = _3569.z;
    float _3577 = _3569.w;
    float2 _9485 = float2(_3530, _3554);
    float3 _3579 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9485, float2(0.0), isnan(_9485)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9485, float2(0.0), isnan(_9485)), level(0.0)).xyz;
    float _3581 = _3579.x;
    float _3583 = _3579.y;
    float _3585 = _3579.z;
    float _3587 = _3378;
    if (!_3104)
    {
        float _3589 = rint(_3464);
        float _3591 = precise::max(_3589, 0.0);
        uint _3593 = uint(_3591);
        uint _3595 = clamp(_3593, 0u, 65535u);
        _3587 = as_type<float>(_3595);
    }
    float _3597 = _3587;
    float _3599 = _3597;
    if (!_3104)
    {
        float3 _9522 = float3(_3548, _3356, float(as_type<int>(_3597)));
        float3 _9524 = select(_9522, float3(0.0), isnan(_9522));
        float _3601 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9524.xy, uint(rint(_9524.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9524.xy, uint(rint(_9524.z)), level(0.0)).x;
        _3599 = _3601;
    }
    float _3603 = _3599;
    float _3605 = abs(_2952);
    float _3607 = log2(_3605);
    float _3609 = _3408 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3611 = fma(_3430, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3609);
    float _3613 = fma(_3208, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3611);
    bool _3615 = _2952 <= 8000.0;
    bool _3617 = isnan(_2952);
    bool _3619 = _3615 || _3617;
    bool _3621 = isnan(8000.0);
    bool _3623 = _3619 || _3621;
    float _3625 = float(_3623);
    float _3627 = fma(_3470, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3613);
    float _3629 = _3396 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3631 = _3607 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3633 = exp2(_3629);
    out.gl_Position.x = _3524;
    out.gl_Position.y = _3526;
    out.gl_Position.z = _3627;
    out.gl_Position.w = _3480;
    float _3635 = exp2(_3631);
    float _3637 = fma(_3635, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3639 = precise::clamp(_3637, 0.0, 1.0);
    float _3641 = fma(_3639, -2.0, 3.0);
    float _3643 = _3639 * _3639;
    float _3645 = _3643 * _3641;
    float _3647 = _3627 + _3480;
    float _3649 = _3647 * 0.5;
    float _3651 = -_3645;
    float _3653 = _3651 + 1.0;
    out.m_96.z = _3649;
    out.m_96.w = _3480;
    float _3655 = fma(_3653, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3645);
    float _3657 = _3625 * _3655;
    float _3659 = _3625;
    float _3661 = _3627;
    float _3663 = _3524;
    if (!_3468)
    {
        _3659 = 1.0;
    }
    float _3665 = _3659;
    float _3667 = _3657 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3669 = -_3633;
    float _3671 = _3669 + 1.0;
    float _3673 = _3671 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3675 = _3671;
    float _3677 = _3665;
    if (_3104)
    {
        _3675 = 1.0;
    }
    float _3679 = _3675;
    float _3681 = -_3372;
    float _3683 = _3681 + 1.0;
    float _3685 = _3683 * _3667;
    float _3687 = precise::clamp(_3685, 0.0, 1.0);
    float _3689 = _3679;
    if (_3468)
    {
        bool _3691 = _3564 >= _3514;
        bool _3693 = isnan(_3564);
        bool _3695 = _3691 || _3693;
        bool _3697 = isnan(_3514);
        bool _3699 = _3695 || _3697;
        float _3701 = float(_3699);
        _3677 = _3701;
    }
    float _3703 = _3677;
    float _3705 = _3703;
    if (!_3104)
    {
        int _3707 = _3260 << 4;
        int _3709 = _3707 + 2048;
        uint _3711 = uint(int(uint(_3709) >> uint(2)));
        uint _3713 = uint(int(uint(int(_3711)) >> uint(2)));
        int _3715 = int(_3711) & 3;
        float _3717 = (*spvDescriptorSet0.vp_c15)._m0[int(_3713)][_3715];
        int _3719 = int(_3711) + 1;
        uint _3721 = uint(int(uint(_3719) >> uint(2)));
        int _3723 = _3719 & 3;
        float _3725 = (*spvDescriptorSet0.vp_c15)._m0[int(_3721)][_3723];
        int _3727 = _3709 + 8;
        uint _3729 = uint(int(uint(_3727) >> uint(2)));
        uint _3731 = uint(int(uint(int(_3729)) >> uint(2)));
        int _3733 = int(_3729) & 3;
        float _3735 = (*spvDescriptorSet0.vp_c15)._m0[int(_3731)][_3733];
        int _3737 = int(_3729) + 1;
        uint _3739 = uint(int(uint(_3737) >> uint(2)));
        int _3741 = _3737 & 3;
        float _3743 = (*spvDescriptorSet0.vp_c15)._m0[int(_3739)][_3741];
        float _3745 = _2864 * _3725;
        float _3747 = fma(_993, _3717, _3745);
        float _3749 = fma(_995, _3735, _3747);
        float _3751 = _3749 + _3743;
        float _3753 = precise::clamp(_3751, 0.0, 1.0);
        float _3755 = -_3753;
        float _3757 = _3755 + _3603;
        float _3759 = fma(_3757, 500.0, 1.5);
        float _3761 = exp2(_3759);
        float _3763 = 0.0 + _3761;
        float _3765 = precise::clamp(_3763, 0.0, 1.0);
        _3689 = _3765;
        _3661 = _3735;
    }
    float _3767 = _3689;
    float _3769 = _3661;
    float _3771 = _3703 * _3767;
    float _3773 = -_3687;
    float _3775 = fma(_3773, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3777 = _3673 * _3566;
    out.m_98.x = _2842;
    out.m_98.y = _2840;
    out.m_98.z = _2844;
    bool _3779 = _2876 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3781 = isnan(_2876);
    bool _3783 = _3779 || _3781;
    bool _3785 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3787 = _3783 || _3785;
    float _3789 = -_3771;
    float _3791 = fma(_3789, _3775, 1.0);
    float _3793 = precise::clamp(_3791, 0.0, 1.0);
    float _3795 = _3577 * _3777;
    float _3797 = -_3673;
    float _3799 = _3797 + 1.0;
    float _3801 = _3585 * _3777;
    float _3803 = _3793 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3805 = fma(_3581, _3795, _3571);
    float _3807 = fma(_3583, _3795, _3573);
    float _3809 = _3577 * _3799;
    float _3811 = fma(_3577, _3801, _3575);
    out.m_100.x = _3803;
    float _3813 = _3769;
    float _3815 = _3795;
    float _3817 = _3799;
    float _3819 = _3793;
    if (!_3787)
    {
        _3813 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3821 = _3813;
    out.m_102.x = _3805;
    out.m_102.y = _3807;
    out.m_102.z = _3811;
    out.m_102.w = _3809;
    float _3823 = _3821;
    float _3825 = _3821;
    if (!_3787)
    {
        _3705 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3827 = _3705;
    float _3829 = _3827;
    float _3831 = _3827;
    if (!_3787)
    {
        _3663 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3833 = _3663;
    float _3835 = _3833;
    float _3837 = _3833;
    if (!_3787)
    {
        _3815 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3839 = _3815;
    float _3841 = _3839;
    float _3843 = _3839;
    if (!_3787)
    {
        _3817 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3845 = _3817;
    float _3847 = _3845;
    float _3849 = _3845;
    if (!_3787)
    {
        _3819 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3851 = _3819;
    bool _3853 = !_3787;
    float _3855 = _3851;
    float _3857 = _3851;
    if (!_3853)
    {
        bool _3859 = _2876 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3861 = isnan(_2876);
        bool _3863 = _3859 || _3861;
        bool _3865 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3867 = _3863 || _3865;
        if (!_3867)
        {
            float _3869 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3871 = _2876 + _3869;
            float _3873 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3875 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3873;
            float _3877 = 1.0 / _3875;
            float _3879 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3881 = _3879 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3883 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3885 = _3883 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3887 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3889 = _3887 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3891 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3893 = _3891 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3895 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3897 = _3895 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3899 = _3871 * _3877;
            float _3901 = precise::clamp(_3899, 0.0, 1.0);
            float _3903 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3905 = _3903 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3907 = fma(_3901, _3881, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3909 = fma(_3901, _3905, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3911 = fma(_3901, _3885, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3913 = fma(_3901, _3889, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3915 = fma(_3901, _3893, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3917 = fma(_3901, _3897, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3831 = _3909;
            _3849 = _3915;
            _3825 = _3907;
            _3843 = _3913;
            _3837 = _3911;
            _3857 = _3917;
            _3919 = true;
        }
        else
        {
            bool _3921 = _2876 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3923 = isnan(_2876);
            bool _3925 = _3921 || _3923;
            bool _3927 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3929 = _3925 || _3927;
            if (!_3929)
            {
                _3823 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3931 = _3823;
            _3825 = _3931;
            if (!_3929)
            {
                _3829 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3933 = _3829;
            _3831 = _3933;
            if (!_3929)
            {
                _3835 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3935 = _3835;
            _3837 = _3935;
            if (!_3929)
            {
                _3841 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3937 = _3841;
            _3843 = _3937;
            if (!_3929)
            {
                _3847 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3939 = _3847;
            _3849 = _3939;
            if (!_3929)
            {
                _3855 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3941 = _3855;
            bool _3943 = !_3929;
            _3857 = _3941;
            if (!_3943)
            {
                bool _3945 = _2876 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3947 = isnan(_2876);
                bool _3949 = _3945 || _3947;
                bool _3951 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3953 = _3949 || _3951;
                if (!_3953)
                {
                    float _3955 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3957 = _2876 + _3955;
                    float _3959 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3961 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3959;
                    float _3963 = 1.0 / _3961;
                    float _3965 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3967 = _3965 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3969 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3971 = _3969 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3973 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3975 = _3973 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3977 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3979 = _3977 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3981 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3983 = _3981 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3985 = _3957 * _3963;
                    float _3987 = precise::clamp(_3985, 0.0, 1.0);
                    float _3989 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3991 = _3989 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3993 = fma(_3987, _3967, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3995 = fma(_3987, _3991, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3997 = fma(_3987, _3971, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3999 = fma(_3987, _3975, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4001 = fma(_3987, _3979, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4003 = fma(_3987, _3983, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3831 = _3995;
                    _3849 = _4001;
                    _3825 = _3993;
                    _3843 = _3999;
                    _3837 = _3997;
                    _3857 = _4003;
                    _3919 = true;
                }
                else
                {
                    _3831 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3849 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3825 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3843 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3837 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3857 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3919 = false;
    float _4005 = _3831;
    float _4007 = _3849;
    float _4009 = _3825;
    float _4011 = _3843;
    float _4013 = _3837;
    float _4015 = _3857;
    float _4017 = fma(_2742, -0.5, 0.5);
    float _4019 = precise::clamp(_4017, 0.0, 1.0);
    float _4021 = -_4005;
    float _4023 = _4021 + _4007;
    float _4025 = -_4009;
    float _4027 = _4025 + _4011;
    float _4029 = -_4013;
    float _4031 = _4029 + _4015;
    bool _4033 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4035 = fma(_4019, _4023, _4005);
    float _4037 = fma(_4019, _4027, _4009);
    float _4039 = fma(_4019, _4031, _4013);
    float _4041 = _4035 * 0.586610972881317138671875;
    out.m_104.x = 0.0;
    float _4043 = fma(_4037, 0.298911988735198974609375, _4041);
    float _4045 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4047 = fma(_4039, 0.114477999508380889892578125, _4043);
    out.m_63.x = _4045;
    float _4049 = -_4047;
    float _4051 = _4037 + _4049;
    float _4053 = -_4047;
    float _4055 = _4035 + _4053;
    float _4057 = -_4047;
    float _4059 = _4039 + _4057;
    float _4061 = fma(_4051, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4047);
    float _4063 = fma(_4055, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4047);
    float _4065 = fma(_4059, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4047);
    out.m_106.x = _4061;
    out.m_106.y = _4063;
    out.m_106.z = _4065;
    if (!_4033)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4067 = -_2840;
    float _4069 = _4067 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4071 = -_2842;
    float _4073 = _4071 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4075 = -_2844;
    float _4077 = _4075 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4079 = _4069 * _4069;
    float _4081 = fma(_4073, _4073, _4079);
    float _4083 = fma(_4077, _4077, _4081);
    float _4085 = sqrt(_4083);
    float _4087 = rsqrt(_4083);
    float _4089 = -_4085;
    float _4091 = _4089 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4093 = _4091 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4095 = precise::clamp(_4093, 0.0, 1.0);
    float _4097 = _4073 * _4087;
    float _4099 = _4069 * _4087;
    float _4101 = abs(_4095);
    float _4103 = log2(_4101);
    float _4105 = _4077 * _4087;
    float _4107 = _4097 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4109 = _2742 * _4099;
    float _4111 = -_4099;
    float _4113 = -_4107;
    float _4115 = fma(_4111, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4113);
    float _4117 = fma(_2736, _4097, _4109);
    float _4119 = -_4105;
    float _4121 = fma(_4119, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4115);
    float _4123 = fma(_2744, _4105, _4117);
    float _4125 = precise::clamp(_4123, 0.0, 1.0);
    float _4127 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4129 = _4121 + _4127;
    float _4131 = _4103 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4133 = _4129 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4135 = precise::clamp(_4133, 0.0, 1.0);
    float _4137 = exp2(_4131);
    float _4139 = _4137 * _4135;
    float _4141 = _4125 * _4139;
    float _4143 = _4141 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4145 = _4141 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4147 = _4141 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_104.x = _4143;
    out.m_104.y = _4145;
    out.m_104.z = _4147;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3919 = false;
    bool _2796 = false;
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
        float _4204 = as_type<float>(_141);
        out.gl_Position.z = _4204;
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
        float _4274 = as_type<float>(_179);
        out.gl_Position.z = _4274;
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
    float2 _5742 = float2(_1125, _1127);
    float3 _1131 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5742, float2(0.0), isnan(_5742)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5742, float2(0.0), isnan(_5742)), level(0.0)).xyz;
    float _1133 = _1131.x;
    float _1135 = _1131.y;
    float _1137 = _1131.z;
    float _1139 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1141 = int(_1139);
    float _1143 = _1123;
    if (_263)
    {
        float _1145 = in.m_70.x;
        _1069 = _1145;
    }
    float _1147 = _1069;
    float _1149 = -_583;
    float _1151 = _1149 + 1.0;
    float _1153 = -_685;
    float _1155 = _1153 + 1.0;
    float _1157 = _1147;
    if (!_263)
    {
        float _1159 = in.m_70.y;
        _1157 = _1159;
    }
    float _1161 = _1157;
    float _1163 = -_687;
    float _1165 = _1163 + 1.0;
    float _1167 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1169 = trunc(_575);
    int _1171 = int(_1169);
    float _1173 = -_679;
    float _1175 = _1173 + 1.0;
    float _1177 = float(uint(_1141));
    float _1179 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1181 = int(_1179);
    int _1183 = ~_1141;
    int _1185 = _1183 + 1;
    float _1187 = float(_1141);
    bool _1189 = _1141 == 0;
    float _1191 = float(uint(_1171));
    float _1193 = 1.0 / _1177;
    float _1195 = float(uint(_1181));
    float _1197 = trunc(_659);
    int _1199 = int(_1197);
    int _1201 = ~_1181;
    int _1203 = _1201 + 1;
    bool _1205 = _1181 == 0;
    int _1207 = as_type<int>(_1193) + (-2);
    float _1209 = 1.0 / _1195;
    float _1211 = _1193;
    float _1213 = _1175;
    if (_263)
    {
        _1211 = 1.0;
    }
    float _1215 = _1211;
    float _1217 = _1215;
    if (!_263)
    {
        _1217 = 7.345489978790283203125;
    }
    float _1219 = _1217;
    float _1221 = as_type<float>(_1207) * _1191;
    float _1223 = trunc(_1221);
    float _1225 = precise::max(_1223, 0.0);
    uint _1228 = uint(_1225);
    float _1230 = _1219 * _231;
    int _1232 = as_type<int>(_1209) + (-2);
    float _1234 = float(uint(_1199));
    int _1236 = _1185 * int(_1228);
    int _1238 = _1236 + _1171;
    float _1240 = as_type<float>(_1232) * _1234;
    float _1242 = float(_1171);
    float _1244 = float(uint(_1238));
    float _1246 = floor(_1230);
    bool _1248 = _1242 >= _1187;
    bool _1250 = isnan(_1242);
    bool _1252 = _1248 || _1250;
    bool _1254 = isnan(_1187);
    bool _1256 = _1252 || _1254;
    float _1258 = float(_1256);
    float _1260 = as_type<float>(_1207) * _1244;
    float _1262 = trunc(_1240);
    float _1264 = precise::max(_1262, 0.0);
    uint _1266 = uint(_1264);
    float _1268 = trunc(_1260);
    float _1270 = precise::max(_1268, 0.0);
    uint _1272 = uint(_1270);
    float _1274 = -_1246;
    float _1276 = _1230 + _1274;
    int _1278 = ~_1141;
    int _1280 = _1278 + 1;
    float _1282 = _1276 * _1187;
    int _1284 = _1203 * int(_1266);
    int _1286 = _1284 + _1199;
    float _1288 = trunc(_1258);
    int _1290 = int(_1288);
    float _1292 = float(uint(_1286));
    int _1294 = int(_1228) + int(_1272);
    float _1296 = as_type<float>(_1232) * _1292;
    float _1298 = trunc(_1282);
    int _1300 = int(_1298);
    int _1302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1304 = _1302 != 0;
    float _1306 = as_type<float>(_1280);
    if (_263)
    {
        _1306 = 1.0;
    }
    float _1308 = _1306;
    int _1310 = _1280 * _1294;
    int _1312 = _1310 + _1171;
    float _1314 = _1308;
    if (!_263)
    {
        _1314 = 1.2345600128173828125;
    }
    float _1316 = _1314;
    bool _1318 = !_1304;
    int _1320 = _1318 ? 0 : 1;
    bool _1322 = uint(_1312) >= uint(_1141);
    float _1324 = _1316 * _1161;
    float _1326 = trunc(_1296);
    float _1328 = precise::max(_1326, 0.0);
    uint _1330 = uint(_1328);
    int _1332 = abs(_1320);
    bool _1334 = !_1322;
    int _1336 = _1334 ? 0 : (-1);
    int _1338 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1340 = _1338 != 0;
    int _1342 = ~_1294;
    int _1344 = _1342 + _1336;
    int _1346 = _1344 + 1;
    float _1348 = _1187 * _467;
    int _1350 = ~_1181;
    int _1352 = _1350 + 1;
    int _1354 = abs(_505);
    int _1356 = _1141 * _1346;
    int _1358 = _1356 + _1171;
    float _1360 = trunc(_1348);
    int _1362 = int(_1360);
    int _1364 = ~_1290;
    int _1366 = _1364 + 1;
    int _1368 = _1366 + 1;
    bool _1370 = !_1189;
    int _1372 = _1370 ? _1358 : (-1);
    int _1374 = _1300 * _1332;
    int _1376 = _1374 + _1171;
    int _1378 = int(_1266) + int(_1330);
    int _1380 = _1141 + (-1);
    int _1382 = _1372 * _1368;
    int _1384 = abs(_501);
    int _1386 = _1352 * _1378;
    int _1388 = _1386 + _1199;
    float _1390 = floor(_1324);
    int _1392 = _1290 * _1380;
    int _1394 = _1392 + _1382;
    float _1396 = float(_1181);
    float _1398 = float(_1199);
    bool _1400 = uint(_1388) >= uint(_1181);
    int _1402 = _1394 * _1384;
    bool _1404 = _1398 >= _1396;
    bool _1406 = isnan(_1398);
    bool _1408 = _1404 || _1406;
    bool _1410 = isnan(_1396);
    bool _1412 = _1408 || _1410;
    float _1414 = float(_1412);
    int _1416 = abs(_509);
    bool _1418 = !_1400;
    int _1420 = _1418 ? 0 : (-1);
    float _1422 = trunc(_1414);
    int _1424 = int(_1422);
    float _1426 = -_1390;
    float _1428 = _1324 + _1426;
    int _1430 = ~_1378;
    int _1432 = _1430 + _1420;
    int _1434 = _1432 + 1;
    bool _1436 = !_1340;
    int _1438 = _1436 ? 0 : 1;
    int _1440 = _1362 * _1354;
    int _1442 = _1440 + _1402;
    float _1444 = _1428 * _1396;
    int _1446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1448 = _1446 != 0;
    int _1450 = _1181 * _1434;
    int _1452 = _1450 + _1199;
    int _1454 = abs(_1438);
    int _1456 = _1376 * _1416;
    int _1458 = _1456 + _1442;
    bool _1460 = !_1448;
    int _1462 = _1460 ? 0 : 1;
    float _1464 = trunc(_1444);
    int _1466 = int(_1464);
    int _1468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1470 = _1468 != 0;
    int _1472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1474 = _1472 != 0;
    int _1476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1478 = _1476 != 0;
    int _1480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1482 = _1480 != 0;
    float _1484 = _1396 * _467;
    int _1486 = _1300 * _1454;
    int _1488 = _1486 + _1458;
    int _1490 = ~_1424;
    int _1492 = _1490 + 1;
    int _1494 = _1492 + 1;
    bool _1496 = !_1205;
    int _1498 = _1496 ? _1452 : (-1);
    float _1500 = trunc(_1484);
    int _1502 = int(_1500);
    bool _1504 = !_1474;
    int _1506 = _1504 ? 0 : 1;
    float _1508 = float(uint(_1488));
    int _1510 = _1498 * _1494;
    int _1512 = abs(_1462);
    int _1514 = _1181 + (-1);
    float _1516 = as_type<float>(_1207) * _1508;
    bool _1518 = !_1470;
    int _1520 = _1518 ? 0 : 1;
    int _1522 = abs(_1506);
    int _1524 = _1424 * _1514;
    int _1526 = _1524 + _1510;
    int _1528 = abs(_1520);
    float _1530 = trunc(_1516);
    float _1532 = precise::max(_1530, 0.0);
    uint _1534 = uint(_1532);
    int _1536 = _1466 * _1512;
    int _1538 = _1536 + _1199;
    bool _1540 = !_1478;
    int _1542 = _1540 ? 0 : 1;
    int _1544 = _1526 * _1522;
    int _1546 = ~_1141;
    int _1548 = _1546 + 1;
    float _1550 = float(uint(_1376));
    int _1552 = _1502 * _1528;
    int _1554 = _1552 + _1544;
    bool _1556 = !_1482;
    int _1558 = _1556 ? 0 : 1;
    int _1560 = abs(_1542);
    float _1562 = as_type<float>(_1207) * _1550;
    int _1564 = abs(_1558);
    int _1566 = _1538 * _1560;
    int _1568 = _1566 + _1554;
    float _1570 = trunc(_1562);
    float _1572 = precise::max(_1570, 0.0);
    uint _1574 = uint(_1572);
    int _1576 = _1548 * int(_1534);
    int _1578 = _1576 + _1488;
    float _1580 = float(uint(_1538));
    int _1582 = _1466 * _1564;
    int _1584 = _1582 + _1568;
    int _1586 = ~_1181;
    int _1588 = _1586 + 1;
    float _1590 = float(uint(_1578));
    float _1592 = as_type<float>(_1232) * _1580;
    float _1594 = float(uint(_1584));
    int _1596 = ~_1141;
    int _1598 = _1596 + 1;
    float _1600 = trunc(_1592);
    float _1602 = precise::max(_1600, 0.0);
    uint _1604 = uint(_1602);
    float _1606 = as_type<float>(_1207) * _1590;
    float _1608 = as_type<float>(_1232) * _1594;
    int _1610 = _1598 * int(_1574);
    int _1612 = _1610 + _1376;
    float _1614 = trunc(_1606);
    float _1616 = precise::max(_1614, 0.0);
    uint _1618 = uint(_1616);
    int _1620 = ~_1181;
    int _1622 = _1620 + 1;
    float _1624 = float(uint(_1612));
    float _1626 = trunc(_1608);
    float _1628 = precise::max(_1626, 0.0);
    uint _1630 = uint(_1628);
    int _1632 = _1588 * int(_1604);
    int _1634 = _1632 + _1538;
    float _1636 = as_type<float>(_1207) * _1624;
    int _1638 = ~_1141;
    int _1640 = _1638 + 1;
    float _1642 = float(uint(_1634));
    float _1644 = trunc(_1636);
    float _1646 = precise::max(_1644, 0.0);
    uint _1648 = uint(_1646);
    int _1650 = int(_1534) + int(_1618);
    float _1652 = as_type<float>(_1232) * _1642;
    int _1654 = _1622 * int(_1630);
    int _1656 = _1654 + _1584;
    float _1658 = trunc(_1652);
    float _1660 = precise::max(_1658, 0.0);
    uint _1662 = uint(_1660);
    int _1664 = _1640 * _1650;
    int _1666 = _1664 + _1488;
    float _1668 = float(uint(_1656));
    bool _1670 = uint(_1666) >= uint(_1141);
    int _1672 = int(_1574) + int(_1648);
    float _1674 = as_type<float>(_1232) * _1668;
    bool _1676 = !_1670;
    int _1678 = _1676 ? 0 : (-1);
    int _1680 = ~_1181;
    int _1682 = _1680 + 1;
    float _1684 = trunc(_1674);
    float _1686 = precise::max(_1684, 0.0);
    uint _1688 = uint(_1686);
    int _1690 = ~_1650;
    int _1692 = _1690 + _1678;
    int _1694 = _1692 + 1;
    int _1696 = int(_1604) + int(_1662);
    int _1698 = _1141 * _1694;
    int _1700 = _1698 + _1488;
    int _1702 = ~_1141;
    int _1704 = _1702 + 1;
    int _1706 = _1682 * _1696;
    int _1708 = _1706 + _1538;
    int _1710 = ~_1181;
    int _1712 = _1710 + 1;
    bool _1714 = !_1189;
    int _1716 = _1714 ? _1700 : (-1);
    int _1718 = _1704 * _1672;
    int _1720 = _1718 + _1376;
    int _1722 = _1716 & 3;
    bool _1724 = _1722 != 0;
    int _1726 = int(_1630) + int(_1688);
    int _1728 = _1716 & 3;
    bool _1730 = _1728 != 0;
    bool _1732 = uint(_1722) >= 2u;
    int _1734 = _1712 * _1726;
    int _1736 = _1734 + _1584;
    int _1738 = _1730 ? 0 : 1;
    bool _1740 = uint(_1720) >= uint(_1141);
    int _1742 = _1732 ? 0 : 1;
    bool _1744 = uint(_1736) >= uint(_1181);
    bool _1746 = uint(_1722) > 1u;
    bool _1748 = !_1740;
    int _1750 = _1748 ? 0 : (-1);
    bool _1752 = !_1744;
    int _1754 = _1752 ? 0 : (-1);
    int _1756 = ~_1672;
    int _1758 = _1756 + _1750;
    int _1760 = _1758 + 1;
    int _1762 = ~_1726;
    int _1764 = _1762 + _1754;
    int _1766 = _1764 + 1;
    bool _1768 = _237 > 0.5;
    int _1770 = _1141 * _1760;
    int _1772 = _1770 + _1376;
    int _1774 = ~_1738;
    int _1776 = _1774 + 1;
    int _1778 = _1776 + 1;
    int _1780 = _1181 * _1766;
    int _1782 = _1780 + _1584;
    int _1784 = _1778;
    if (!_1746)
    {
        int _1786 = ~_1738;
        int _1788 = _1786 + 1;
        _1784 = _1788;
    }
    int _1790 = _1784;
    float _1792 = -_199;
    int _1794 = _1768 ? as_type<int>(_1792) : as_type<int>(_199);
    int _1796 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1798 = _1796 != 0;
    bool _1800 = !_1205;
    int _1802 = _1800 ? _1782 : (-1);
    bool _1804 = _1722 != 3;
    bool _1806 = !_1189;
    int _1808 = _1806 ? _1772 : (-1);
    int _1810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1812 = _1810 != 0;
    bool _1814 = !_1798;
    int _1816 = _1814 ? 0 : 1;
    int _1818 = _1716 >> 31;
    int _1820 = _1802 & 3;
    bool _1822 = _1820 != 0;
    int _1824 = _1802 >> 31;
    bool _1826 = !_1812;
    int _1828 = _1826 ? 0 : 1;
    int _1830 = _1818 & 3;
    bool _1832 = uint(_1708) >= uint(_1181);
    int _1834 = _1802 & 3;
    bool _1836 = _1834 != 0;
    bool _1838 = !_1822;
    float _1840 = _1838 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _1842 = _1824 & 3;
    bool _1844 = uint(_1820) > 1u;
    int _1846 = _1716 + _1830;
    bool _1848 = !_1832;
    int _1850 = _1848 ? 0 : (-1);
    int _1852 = _1836 ? 0 : 1;
    int _1854 = _1802 + _1842;
    int _1856 = ~_1742;
    int _1858 = _1856 + 1;
    int _1860 = _1858 + 1;
    bool _1862 = _1722 != 3;
    int _1864 = _1860;
    float _1866 = _1840;
    if (_1804)
    {
        int _1868 = ~_1742;
        int _1870 = _1868 + 1;
        _1864 = _1870;
    }
    int _1872 = _1864;
    bool _1874 = !_1724;
    int _1876 = _1874 ? 0 : 1;
    int _1878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1880 = _1878 != 0;
    int _1882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1884 = _1882 != 0;
    int _1886 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1888 = _1886 != 0;
    int _1890 = _1846 >> 2;
    int _1892 = ~_1696;
    int _1894 = _1892 + _1850;
    int _1896 = _1894 + 1;
    int _1898 = _1854 >> 2;
    bool _1900 = !_1862;
    int _1902 = _1900 ? 0 : (-1);
    int _1904 = _1181 * _1896;
    int _1906 = _1904 + _1538;
    bool _1908 = uint(_1820) >= 2u;
    int _1910 = _1890 << 4;
    int _1912 = _1910 + 368;
    int _1914 = _1898 << 4;
    int _1916 = _1914 + 512;
    int _1918 = ~_1852;
    int _1920 = _1918 + 1;
    int _1922 = _1920 + 1;
    uint _1924 = uint(int(uint(_1912) >> uint(2)));
    uint _1926 = uint(int(uint(int(_1924)) >> uint(2)));
    int _1928 = int(_1924) & 3;
    float _1930 = (*spvDescriptorSet0.vp_c9)._m0[int(_1926)][_1928];
    int _1932 = int(_1924) + 1;
    uint _1934 = uint(int(uint(_1932) >> uint(2)));
    int _1936 = _1932 & 3;
    float _1938 = (*spvDescriptorSet0.vp_c9)._m0[int(_1934)][_1936];
    int _1940 = _1922;
    if (!_1844)
    {
        int _1942 = ~_1852;
        int _1944 = _1942 + 1;
        _1940 = _1944;
    }
    int _1946 = _1940;
    int _1948 = _1908 ? 0 : 1;
    bool _1950 = _1820 != 3;
    bool _1952 = _1820 != 3;
    int _1954 = _1912 + 8;
    uint _1956 = uint(int(uint(_1954) >> uint(2)));
    uint _1958 = uint(int(uint(int(_1956)) >> uint(2)));
    int _1960 = int(_1956) & 3;
    float _1962 = (*spvDescriptorSet0.vp_c9)._m0[int(_1958)][_1960];
    int _1964 = int(_1956) + 1;
    uint _1966 = uint(int(uint(_1964) >> uint(2)));
    int _1968 = _1964 & 3;
    float _1970 = (*spvDescriptorSet0.vp_c9)._m0[int(_1966)][_1968];
    int _1972 = ~_1948;
    int _1974 = _1972 + 1;
    int _1976 = _1974 + 1;
    bool _1978 = !_1205;
    int _1980 = _1978 ? _1906 : (-1);
    uint _1982 = uint(int(uint(_1916) >> uint(2)));
    uint _1984 = uint(int(uint(int(_1982)) >> uint(2)));
    int _1986 = int(_1982) & 3;
    float _1988 = (*spvDescriptorSet0.vp_c9)._m0[int(_1984)][_1986];
    int _1990 = int(_1982) + 1;
    uint _1992 = uint(int(uint(_1990) >> uint(2)));
    int _1994 = _1990 & 3;
    float _1996 = (*spvDescriptorSet0.vp_c9)._m0[int(_1992)][_1994];
    int _1998 = _1976;
    if (_1950)
    {
        int _2000 = ~_1948;
        int _2002 = _2000 + 1;
        _1998 = _2002;
    }
    int _2004 = _1998;
    float _2006 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2008 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2010 = _2008 != 0;
    float _2012 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2014 = _1916 + 8;
    uint _2016 = uint(int(uint(_2014) >> uint(2)));
    uint _2018 = uint(int(uint(int(_2016)) >> uint(2)));
    int _2020 = int(_2016) & 3;
    float _2022 = (*spvDescriptorSet0.vp_c9)._m0[int(_2018)][_2020];
    int _2024 = int(_2016) + 1;
    uint _2026 = uint(int(uint(_2024) >> uint(2)));
    int _2028 = _2024 & 3;
    float _2030 = (*spvDescriptorSet0.vp_c9)._m0[int(_2026)][_2028];
    float _2032 = _2006 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2034 = abs(_1946);
    float _2036 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2038 = abs(_1790);
    float _2040 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2042 = abs(_1876);
    float _2044 = _2036 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2046 = !_1952;
    int _2048 = _2046 ? 0 : (-1);
    float _2050 = _2040 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2052 = _231 > 0.5;
    bool _2054 = _233 > 0.5;
    out.m_82.x = _2044;
    out.m_82.y = _2032;
    out.m_82.z = _2050;
    out.m_82.w = _2012;
    int _2056 = ~_2038;
    int _2058 = _2056 + 1;
    int _2060 = _2058 + 1;
    float _2062 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2064 = -_195;
    int _2066 = _2052 ? as_type<int>(_2064) : as_type<int>(_195);
    float _2068 = _1167 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2070 = _235 > 0.5;
    float _2072 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2074 = _2060 * as_type<int>(_1938);
    int _2076 = abs(_1872);
    float _2078 = _2062 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2080 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2082 = int(_2080);
    float _2084 = _2072 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2086 = abs(as_type<int>(_1840));
    if (_1035)
    {
        float _2088 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2090 = _1119 + _2088;
        _1866 = _2090;
    }
    float _2092 = _1866;
    int _2094 = ~_2034;
    int _2096 = _2094 + 1;
    int _2098 = _2096 + 1;
    int _2100 = ~_2042;
    int _2102 = _2100 + 1;
    int _2104 = _2102 + 1;
    out.m_84.x = _2068;
    out.m_84.y = _2078;
    out.m_84.z = _2084;
    int _2106 = ~_2086;
    int _2108 = _2106 + 1;
    int _2110 = _2108 + 1;
    int _2112 = _2098 * as_type<int>(_1996);
    int _2114 = abs(_1902);
    int _2116 = _2104 * as_type<int>(_1930);
    int _2118 = _2116 + _2074;
    int _2120 = abs(_2048);
    int _2122 = _2110 * as_type<int>(_1988);
    int _2124 = _2122 + _2112;
    float _2126 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2128 = int(_2126);
    int _2130 = abs(_2004);
    float _2132 = _937 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2134 = ~_2076;
    int _2136 = _2134 + 1;
    int _2138 = _2136 + 1;
    float _2140 = _949 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2142 = _937 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2144 = float(uint(_2082));
    int _2146 = _2138 * as_type<int>(_1962);
    int _2148 = _2146 + _2118;
    int _2150 = ~_2114;
    int _2152 = _2150 + 1;
    int _2154 = _2152 + 1;
    float _2156 = _949 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2158 = ~_2130;
    int _2160 = _2158 + 1;
    int _2162 = _2160 + 1;
    if (_1035)
    {
        float _2164 = _2092 * _2092;
        _1057 = _2164;
    }
    float _2166 = _1057;
    float _2168 = 1.0 / _2144;
    int _2170 = _2154 * as_type<int>(_1970);
    int _2172 = _2170 + _2148;
    int _2174 = abs(_1816);
    int _2176 = _2162 * as_type<int>(_2022);
    int _2178 = _2176 + _2124;
    int _2180 = abs(_2082);
    int _2182 = ~_2174;
    int _2184 = _2182 + 1;
    int _2186 = _2184 + 1;
    int _2188 = ~_2120;
    int _2190 = _2188 + 1;
    int _2192 = _2190 + 1;
    float _2194 = float(uint(_2128));
    int _2196 = _2172 * _2186;
    int _2198 = _2192 * as_type<int>(_2030);
    int _2200 = _2198 + _2178;
    int _2202 = abs(_1828);
    float _2204 = _937 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2206 = _1808 * _2174;
    int _2208 = _2206 + _2196;
    float _2210 = 1.0 / _2194;
    float _2212 = float(uint(_2180));
    float _2214 = -_931;
    float _2216 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2132);
    int _2218 = abs(_2128);
    float _2220 = -_931;
    float _2222 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2204);
    int _2224 = as_type<int>(_2168) + (-2);
    float _2226 = _957 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2228 = float(uint(_2208));
    float _2230 = 1.0 / _2212;
    float _2232 = -_931;
    float _2234 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2142);
    int _2236 = ~_2202;
    int _2238 = _2236 + 1;
    int _2240 = _2238 + 1;
    float _2242 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2216);
    float _2244 = float(uint(_2218));
    float _2246 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2234);
    float _2248 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2222);
    float _2250 = _949 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2252 = as_type<float>(_2224) * _2228;
    int _2254 = _2200 * _2240;
    float _2256 = 1.0 / _2244;
    float _2258 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2250);
    int _2260 = abs(_2208);
    int _2262 = _1980 * _2202;
    int _2264 = _2262 + _2254;
    float _2266 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2140);
    float _2268 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2156);
    int _2270 = as_type<int>(_2210) + (-2);
    float _2272 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2258);
    float _2274 = trunc(_2252);
    float _2276 = precise::max(_2274, 0.0);
    uint _2278 = uint(_2276);
    float _2280 = float(uint(_2264));
    int _2282 = abs(_2264);
    float _2284 = as_type<float>(_2270) * _2280;
    float _2286 = float(uint(_2260));
    float _2288 = as_type<float>(_2200);
    if (_1035)
    {
        float _2290 = _1079 * 6.283185482025146484375;
        float _2292 = cos(_2290);
        _2288 = _2292;
    }
    float _2294 = _2288;
    int _2296 = ~_2082;
    int _2298 = _2296 + 1;
    float _2300 = _957 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2302 = as_type<int>(_2256) + (-2);
    float _2304 = float(uint(_2282));
    bool _2306 = !_1880;
    float _2308 = _2306 ? _199 : as_type<float>(_1794);
    float _2310 = trunc(_2284);
    float _2312 = precise::max(_2310, 0.0);
    uint _2314 = uint(_2312);
    int _2316 = as_type<int>(_2230) + (-2);
    float _2318 = _957 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2320 = !_2010;
    float _2322 = _2320 ? _195 : as_type<float>(_2066);
    bool _2324 = _2128 == 0;
    float _2326 = as_type<float>(_2316) * _2286;
    float _2328 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2300);
    int _2330 = _2298 * int(_2278);
    int _2332 = _2330 + _2208;
    float _2334 = as_type<float>(_2302) * _2304;
    float _2336 = trunc(_2326);
    float _2338 = precise::max(_2336, 0.0);
    uint _2340 = uint(_2338);
    float _2342 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2318);
    float _2344 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2226);
    float _2346 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2328);
    float _2348 = float(uint(_2332));
    float _2350 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2342);
    float _2352 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2344);
    int _2354 = ~_2180;
    int _2356 = _2354 + 1;
    float _2358 = trunc(_2334);
    float _2360 = precise::max(_2358, 0.0);
    uint _2362 = uint(_2360);
    int _2364 = ~_2128;
    int _2366 = _2364 + 1;
    float _2368 = as_type<float>(_2224) * _2348;
    float _2370 = as_type<float>(_2356);
    if (_1035)
    {
        float _2372 = _2294 + (-1.0);
        _2370 = _2372;
    }
    float _2374 = _2370;
    int _2376 = ~_2218;
    int _2378 = _2376 + 1;
    int _2380 = _2366 * int(_2314);
    int _2382 = _2380 + _2264;
    int _2384 = _2356 * int(_2340);
    int _2386 = _2384 + _2260;
    float _2388 = _2374;
    if (_1035)
    {
        float _2390 = _2374 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2388 = _2390;
    }
    float _2392 = _2388;
    float _2394 = trunc(_2368);
    float _2396 = precise::max(_2394, 0.0);
    uint _2398 = uint(_2396);
    float _2400 = float(uint(_2382));
    float _2402 = float(uint(_2386));
    if (_1035)
    {
        float _2404 = fma(_1097, _2294, _2392);
        _1099 = _2404;
    }
    float _2406 = _1099;
    float _2408 = -_199;
    int _2410 = _2054 ? as_type<int>(_2408) : as_type<int>(_199);
    int _2412 = _2378 * int(_2362);
    int _2414 = _2412 + _2282;
    float _2416 = as_type<float>(_2316) * _2402;
    bool _2418 = !_1884;
    float _2420 = _2418 ? _199 : as_type<float>(_2410);
    float _2422 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2424 = float(uint(_2414));
    float _2426 = as_type<float>(_2270) * _2400;
    float _2428 = -_195;
    int _2430 = _2070 ? as_type<int>(_2428) : as_type<int>(_195);
    float _2432 = trunc(_2416);
    float _2434 = precise::max(_2432, 0.0);
    uint _2436 = uint(_2434);
    float _2438 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2266);
    float _2440 = as_type<float>(_2302) * _2424;
    bool _2442 = !_1888;
    float _2444 = _2442 ? _195 : as_type<float>(_2430);
    float _2446 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2448 = _2422 * _2246;
    float _2450 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2268);
    float _2452 = _2422 * _2248;
    float _2454 = trunc(_2426);
    float _2456 = precise::max(_2454, 0.0);
    uint _2458 = uint(_2456);
    float _2460 = fma(_2446, _2272, _2448);
    float _2462 = _2448;
    float _2464 = as_type<float>(_2436);
    if (_1035)
    {
        float _2466 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2468 = _1123 + _2466;
        _2462 = _2468;
    }
    float _2470 = _2462;
    float _2472 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2474 = _2406 + _2472;
    out.m_86.x = _2272;
    out.m_86.y = _2438;
    out.m_86.z = _2450;
    if (_1035)
    {
        float _2476 = _2470 * _2470;
        _1059 = _2476;
    }
    float _2478 = _1059;
    int _2480 = int(_2278) + int(_2398);
    float _2482 = trunc(_2440);
    float _2484 = precise::max(_2482, 0.0);
    uint _2486 = uint(_2484);
    float _2488 = _2422 * _2242;
    int _2490 = ~_2082;
    int _2492 = _2490 + 1;
    float _2494 = fma(_2474, _2474, _2166);
    bool _2496 = _2128 == 0;
    float _2498 = fma(_2446, _2438, _2488);
    float _2500 = fma(_2446, _2450, _2452);
    int _2502 = ~_2180;
    int _2504 = _2502 + 1;
    int _2506 = int(_2314) + int(_2458);
    int _2508 = ~_2128;
    int _2510 = _2508 + 1;
    int _2512 = int(_2340) + int(_2436);
    int _2514 = int(_2362) + int(_2486);
    int _2516 = _2492 * _2480;
    int _2518 = _2516 + _2208;
    int _2520 = ~_2218;
    int _2522 = _2520 + 1;
    int _2524 = _2504 * _2512;
    int _2526 = _2524 + _2260;
    float _2528 = _2494 + _2478;
    int _2530 = _2510 * _2506;
    int _2532 = _2530 + _2264;
    bool _2534 = uint(_2518) >= uint(_2082);
    int _2536 = _2522 * _2514;
    int _2538 = _2536 + _2282;
    float _2540 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2542 = uint(_2526) >= uint(_2180);
    bool _2544 = uint(_2532) >= uint(_2128);
    bool _2546 = !_2534;
    int _2548 = _2546 ? 0 : (-1);
    bool _2550 = !_2544;
    int _2552 = _2550 ? 0 : (-1);
    float _2554 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2556 = ~_2480;
    int _2558 = _2556 + _2548;
    int _2560 = _2558 + 1;
    bool _2562 = uint(_2538) >= uint(_2218);
    int _2564 = ~_2506;
    int _2566 = _2564 + _2552;
    int _2568 = _2566 + 1;
    int _2570 = _2082 * _2560;
    int _2572 = _2570 + _2208;
    int _2574 = _2208 ^ _2082;
    float _2576 = sqrt(_2528);
    bool _2578 = !_2562;
    int _2580 = _2578 ? 0 : (-1);
    int _2582 = _2128 * _2568;
    int _2584 = _2582 + _2264;
    bool _2586 = !_2542;
    int _2588 = _2586 ? 0 : (-1);
    uint _2590 = uint(int(uint(_2574) >> uint(31)));
    bool _2592 = _2082 == 0;
    float _2594 = _2554 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2596 = _2082 == 0;
    float _2598 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2600 = _2264 ^ _2128;
    int _2602 = ~_2580;
    int _2604 = _2514 + _2602;
    int _2606 = _2604 + 1;
    int _2608 = ~_2588;
    int _2610 = _2512 + _2608;
    int _2612 = _2610 + 1;
    float _2614 = fma(_2422, _2422, 1.0);
    int _2616 = ~int(_2590);
    int _2618 = _2616 + 1;
    float _2620 = _2540 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2622 = !_2592;
    int _2624 = _2622 ? _2572 : (-1);
    float _2626 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _2628 = uint(int(uint(_2600) >> uint(31)));
    int _2630 = _2612 ^ _2618;
    float _2632 = float(_2624);
    int _2634 = ~int(_2628);
    int _2636 = _2634 + 1;
    int _2638 = ~_2618;
    int _2640 = _2638 + _2630;
    int _2642 = _2640 + 1;
    float _2644 = fma(_2620, _2632, _605);
    bool _2646 = !_2324;
    int _2648 = _2646 ? _2584 : (-1);
    float _2650 = rsqrt(_2614);
    int _2652 = _2606 ^ _2636;
    float _2654 = float(_2648);
    float _2656 = _2598 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2658 = ~_2636;
    int _2660 = _2658 + _2652;
    int _2662 = _2660 + 1;
    float _2664 = _2322 + 0.5;
    bool _2666 = !_2596;
    int _2668 = _2666 ? _2642 : (-1);
    float _2670 = fma(_2656, _2654, _691);
    bool _2672 = !_2496;
    int _2674 = _2672 ? _2662 : (-1);
    float _2676 = fma(_2620, _2664, _2644);
    float _2678 = float(_2668);
    float _2680 = _2444 + 0.5;
    float _2682 = float(_2674);
    float _2684 = _2626 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2686 = -_1155;
    float _2688 = fma(_2322, _2686, _2676);
    float _2690 = -_677;
    float _2692 = fma(_2594, _2678, _2690);
    float _2694 = _2420 + (-0.5);
    float _2696 = fma(_2656, _2680, _2670);
    float _2698 = _2422 * _2650;
    float _2700 = -_693;
    float _2702 = fma(_2684, _2682, _2700);
    float _2704 = _2308 + (-0.5);
    float _2706 = -_2594;
    float _2708 = fma(_2706, _2694, _2692);
    float _2710 = -_2346;
    float _2712 = _2698 * _2710;
    float _2714 = -_2350;
    float _2716 = _2698 * _2714;
    float _2718 = -_2352;
    float _2720 = _2698 * _2718;
    float _2722 = -_2684;
    float _2724 = fma(_2722, _2704, _2702);
    float _2726 = fma(_2650, _2242, _2712);
    float _2728 = fma(_2650, _2246, _2716);
    float _2730 = -_1151;
    float _2732 = fma(_2444, _2730, _2696);
    float _2734 = fma(_2650, _2248, _2720);
    float _2736 = _2350 + _2460;
    float _2738 = fma(_2420, _1165, _2708);
    float _2740 = fma(_2308, _1175, _2724);
    float _2742 = _2346 + _2498;
    float _2744 = _2352 + _2500;
    out.m_88.x = _2728;
    out.m_88.y = _2726;
    out.m_88.z = _2734;
    bool _2746 = _2576 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2748 = isnan(_2576);
    bool _2750 = _2746 || _2748;
    bool _2752 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2754 = _2750 || _2752;
    out.m_90.x = _2688;
    out.m_90.y = _2738;
    out.m_90.z = _2732;
    out.m_90.w = _2740;
    out.m_92.x = _1133;
    out.m_92.y = _1135;
    out.m_92.z = _1137;
    out.m_94.x = _2736;
    out.m_94.y = _2742;
    out.m_94.z = _2744;
    float _2756 = as_type<float>(_2522);
    float _2758 = _2614;
    float _2760 = as_type<float>(_2636);
    if (!_2754)
    {
        _1213 = 1.0;
    }
    float _2762 = _1213;
    bool _2764 = !_2754;
    float _2766 = _2762;
    if (!_2764)
    {
        bool _2768 = _2576 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2770 = isnan(_2576);
        bool _2772 = _2768 || _2770;
        bool _2774 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2776 = _2772 || _2774;
        if (!_2776)
        {
            float _2778 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2780 = _2576 + _2778;
            float _2782 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2784 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2782;
            float _2786 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2788 = _2786 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2790 = 1.0 / _2784;
            float _2792 = _2780 * _2790;
            float _2794 = fma(_2792, _2788, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2766 = _2794;
            _2796 = true;
        }
        else
        {
            bool _2798 = _2576 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2800 = isnan(_2576);
            bool _2802 = _2798 || _2800;
            bool _2804 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2806 = _2802 || _2804;
            if (!_2806)
            {
                float _2808 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2810 = _2576 + _2808;
                float _2812 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2814 = _2812 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2816 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2818 = _2816 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2820 = 1.0 / _2814;
                float _2822 = _2810 * _2820;
                float _2824 = fma(_2822, _2818, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2766 = _2824;
                _2796 = true;
            }
            else
            {
                _2766 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2796 = false;
    float _2826 = _2766;
    float _2828 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2830 = _2406 + _2828;
    float _2832 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2834 = _1119 + _2832;
    float _2836 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2838 = _1123 + _2836;
    float _2840 = fma(_2830, _2826, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2842 = fma(_2834, _2826, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2844 = fma(_2838, _2826, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2846 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2848 = _2840 + _2846;
    float _2850 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2852 = _2842 + _2850;
    float _2854 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2856 = _2844 + _2854;
    float _2858 = _2848 * _2848;
    float _2860 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2862 = fma(_2852, _2852, _2858);
    float _2864 = _1083 + _2860;
    float _2866 = fma(_2856, _2856, _2862);
    float _2868 = _1083 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2870 = rsqrt(_2866);
    float _2872 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2868);
    float _2874 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2872);
    float _2876 = sqrt(_2866);
    float _2878 = _2874 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2880 = _2870 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2882 = _1083 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2884 = _2852 * _2880;
    float _2886 = _2856 * _2880;
    float _2888 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2882);
    float _2890 = _2884 * _2884;
    float _2892 = _2886 * _2886;
    float _2894 = 1.0 / _2878;
    float _2896 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2888);
    float _2898 = _2890 + _2892;
    float _2900 = _2896 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2902 = sqrt(_2898);
    float _2904 = _2900 + _2878;
    float _2906 = _2864 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2908 = _2904 * _2894;
    float _2910 = _2908 * 0.5;
    float _2912 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2914 = fma(_2910, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2912);
    float _2916 = fma(_993, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2918 = _2864 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    bool _2920 = _2902 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2922 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2924 = _2902 + _2922;
    float _2926 = 1.0 / _2914;
    float _2928 = fma(_993, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2918);
    float _2930 = fma(_995, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2928);
    float _2932 = floor(_2916);
    float _2934 = _2930 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2936 = _1135;
    int _2938 = 2;
    float _2940 = _2880;
    float _2942 = _2884;
    float _2944 = _2890;
    if (_2920)
    {
        float _2946 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2936 = _2946;
    }
    float _2948 = _2936;
    float _2950 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2952 = _2926 * _2950;
    float _2954 = fma(_993, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2906);
    bool _2956 = _2952 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2958 = fma(_995, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2954);
    bool _2960 = _2952 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2962 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2964 = trunc(_2934);
    int _2966 = int(_2964);
    float _2968 = _2958 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2970 = -_2932;
    float _2972 = _2916 + _2970;
    float _2974 = precise::max(0.0, _2962);
    float _2976 = _2958;
    if (_2920)
    {
        float _2978 = _2924 * _2948;
        _2976 = _2978;
    }
    float _2980 = _2976;
    float _2982 = trunc(_2968);
    int _2984 = int(_2982);
    if (!_2956)
    {
        _2938 = 1;
    }
    int _2986 = _2938;
    int _2988 = _2986;
    if (_2920)
    {
        float _2990 = _2980 * 0.15915493667125701904296875;
        _2756 = _2990;
    }
    float _2992 = _2756;
    bool _2994 = !_2956;
    int _2996 = _2994 ? 0 : 1;
    float _2998 = -_2880;
    float _3000 = -_2974;
    float _3002 = fma(_2848, _2998, _3000);
    if (!_2960)
    {
        _2988 = _2996;
    }
    int _3004 = _2988;
    float _3006 = _2930;
    if (_2920)
    {
        float _3008 = _2992 * 6.283185482025146484375;
        float _3010 = sin(_3008);
        _3006 = _3010;
    }
    float _3012 = _3006;
    if (_2920)
    {
        float _3014 = _3002 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2940 = _3014;
    }
    float _3016 = _2940;
    int _3018 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _3020 = _2966 + _3018;
    int _3022 = _3020 + 1;
    int _3024 = _3004 << 6;
    int _3026 = _3024 + 96;
    uint _3028 = uint(int(uint(_3026) >> uint(2)));
    uint _3030 = uint(int(uint(int(_3028)) >> uint(2)));
    int _3032 = int(_3028) & 3;
    float _3034 = (*spvDescriptorSet0.vp_c15)._m0[int(_3030)][_3032];
    int _3036 = int(_3028) + 1;
    uint _3038 = uint(int(uint(_3036) >> uint(2)));
    int _3040 = _3036 & 3;
    float _3042 = (*spvDescriptorSet0.vp_c15)._m0[int(_3038)][_3040];
    int _3044 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3046 = _2984 + _3044;
    int _3048 = _3046 + 1;
    float _3050 = _2898;
    int _3052 = _3048;
    if (_2920)
    {
        float _3054 = rsqrt(_2898);
        _3050 = _3054;
    }
    float _3056 = _3050;
    bool _3058 = _3022 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _3060 = fma(_995, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    int _3062 = _3022 | _3048;
    int _3064 = _3024 + 48;
    uint _3066 = uint(int(uint(_3064) >> uint(2)));
    uint _3068 = uint(int(uint(int(_3066)) >> uint(2)));
    int _3070 = int(_3066) & 3;
    float _3072 = (*spvDescriptorSet0.vp_c15)._m0[int(_3068)][_3070];
    int _3074 = int(_3066) + 1;
    uint _3076 = uint(int(uint(_3074) >> uint(2)));
    int _3078 = _3074 & 3;
    float _3080 = (*spvDescriptorSet0.vp_c15)._m0[int(_3076)][_3078];
    if (_2920)
    {
        float _3082 = fma(_3012, _3016, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2758 = _3082;
    }
    float _3084 = _2758;
    float _3086 = _2992;
    float _3088 = _3084;
    if (_2920)
    {
        float _3090 = _2992 * 6.283185482025146484375;
        float _3092 = cos(_3090);
        _3086 = _3092;
    }
    float _3094 = _3086;
    bool _3096 = _3062 < 0;
    bool _3098 = _3096 || _3058;
    float _3100 = _2840 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _3102 = _3048 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3104 = _3102 || _3098;
    int _3106 = _3024 + 104;
    uint _3108 = uint(int(uint(_3106) >> uint(2)));
    uint _3110 = uint(int(uint(int(_3108)) >> uint(2)));
    int _3112 = int(_3108) & 3;
    float _3114 = (*spvDescriptorSet0.vp_c15)._m0[int(_3110)][_3112];
    int _3116 = int(_3108) + 1;
    uint _3118 = uint(int(uint(_3116) >> uint(2)));
    int _3120 = _3116 & 3;
    float _3122 = (*spvDescriptorSet0.vp_c15)._m0[int(_3118)][_3120];
    float _3124 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3100);
    float _3126 = floor(_3060);
    float _3128 = _3056;
    if (_2920)
    {
        float _3130 = _3056 * _3084;
        _2464 = _3130;
    }
    float _3132 = _2464;
    if (!_2920)
    {
        _3088 = _3002;
    }
    float _3134 = _3088;
    float _3136 = fma(_2844, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3124);
    float _3138 = _3134;
    if (_2920)
    {
        float _3140 = _2884 * _3132;
        _2942 = _3140;
    }
    float _3142 = _2942;
    int _3144 = _3024 + 64;
    uint _3146 = uint(int(uint(_3144) >> uint(2)));
    uint _3148 = uint(int(uint(int(_3146)) >> uint(2)));
    int _3150 = int(_3146) & 3;
    float _3152 = (*spvDescriptorSet0.vp_c15)._m0[int(_3148)][_3150];
    int _3154 = int(_3146) + 1;
    uint _3156 = uint(int(uint(_3154) >> uint(2)));
    int _3158 = _3154 & 3;
    float _3160 = (*spvDescriptorSet0.vp_c15)._m0[int(_3156)][_3158];
    float _3162 = _3094;
    if (_2920)
    {
        float _3164 = _3094 + (-1.0);
        _3128 = _3164;
    }
    float _3166 = _3128;
    float _3168 = _3166;
    if (_2920)
    {
        float _3170 = _3142 * _3142;
        _2944 = _3170;
    }
    float _3172 = _2944;
    if (!_3104)
    {
        float _3174 = floor(_2968);
        _2760 = _3174;
    }
    float _3176 = _2760;
    if (_2920)
    {
        float _3178 = _3166 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1143 = _3178;
    }
    float _3180 = _1143;
    if (!_2920)
    {
        _3168 = _2886;
    }
    float _3182 = _3168;
    int _3184 = _3024 + 80;
    uint _3186 = uint(int(uint(_3184) >> uint(2)));
    uint _3188 = uint(int(uint(int(_3186)) >> uint(2)));
    int _3190 = int(_3186) & 3;
    float _3192 = (*spvDescriptorSet0.vp_c15)._m0[int(_3188)][_3190];
    int _3194 = int(_3186) + 1;
    uint _3196 = uint(int(uint(_3194) >> uint(2)));
    int _3198 = _3194 & 3;
    float _3200 = (*spvDescriptorSet0.vp_c15)._m0[int(_3196)][_3198];
    float _3202 = _3182;
    if (_2920)
    {
        float _3204 = _2886 * _3132;
        _3202 = _3204;
    }
    float _3206 = _3202;
    float _3208 = _3136 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (_2920)
    {
        float _3210 = fma(_3002, _3094, _3180);
        _3138 = _3210;
    }
    float _3212 = _3138;
    if (!_2920)
    {
        _3162 = _2892;
    }
    float _3214 = _3162;
    float _3216 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3218 = _3208 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3220 = -_3126;
    float _3222 = _3060 + _3220;
    int _3224 = _3024 + 56;
    uint _3226 = uint(int(uint(_3224) >> uint(2)));
    uint _3228 = uint(int(uint(int(_3226)) >> uint(2)));
    int _3230 = int(_3226) & 3;
    float _3232 = (*spvDescriptorSet0.vp_c15)._m0[int(_3228)][_3230];
    int _3234 = int(_3226) + 1;
    uint _3236 = uint(int(uint(_3234) >> uint(2)));
    int _3238 = _3234 & 3;
    float _3240 = (*spvDescriptorSet0.vp_c15)._m0[int(_3236)][_3238];
    float _3242 = _3214;
    int _3244 = as_type<int>(_3218);
    if (_2920)
    {
        float _3246 = _3206 * _3206;
        _3242 = _3246;
    }
    float _3248 = _3242;
    float _3250 = fma(_3212, _3212, _3172);
    float _3252 = -_3218;
    float _3254 = fma(_3252, _3216, 1.0);
    if (!_3104)
    {
        int _3256 = _3048 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3258 = _3256 + _3022;
        _3244 = _3258;
    }
    int _3260 = _3244;
    float _3262 = _3250 + _3248;
    int _3264 = _3024 + 72;
    uint _3266 = uint(int(uint(_3264) >> uint(2)));
    uint _3268 = uint(int(uint(int(_3266)) >> uint(2)));
    int _3270 = int(_3266) & 3;
    float _3272 = (*spvDescriptorSet0.vp_c15)._m0[int(_3268)][_3270];
    int _3274 = int(_3266) + 1;
    uint _3276 = uint(int(uint(_3274) >> uint(2)));
    int _3278 = _3274 & 3;
    float _3280 = (*spvDescriptorSet0.vp_c15)._m0[int(_3276)][_3278];
    float _3282 = _2864 * _3042;
    float _3284 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3286 = fma(_2876, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3284);
    float _3288 = precise::clamp(_3286, 0.0, 1.0);
    int _3290 = as_type<int>(_3034);
    if (!_3104)
    {
        int _3292 = _3260 << 2;
        _3052 = _3292;
    }
    int _3294 = _3052;
    float _3296 = log2(_3254);
    float _3298 = fma(_993, _3034, _3282);
    int _3300 = _3294;
    if (!_3104)
    {
        int _3302 = 12 & _3294;
        _3300 = _3302;
    }
    int _3304 = _3300;
    int _3306 = _3024 + 88;
    uint _3308 = uint(int(uint(_3306) >> uint(2)));
    uint _3310 = uint(int(uint(int(_3308)) >> uint(2)));
    int _3312 = int(_3308) & 3;
    float _3314 = (*spvDescriptorSet0.vp_c15)._m0[int(_3310)][_3312];
    int _3316 = int(_3308) + 1;
    uint _3318 = uint(int(uint(_3316) >> uint(2)));
    int _3320 = _3316 & 3;
    float _3322 = (*spvDescriptorSet0.vp_c15)._m0[int(_3318)][_3320];
    float _3324 = _2864 * _3080;
    float _3326 = fma(_993, _3072, _3324);
    int _3328 = as_type<int>(_3324);
    if (!_3104)
    {
        uint _3330 = uint(int(uint(_3260) >> uint(2)));
        _3328 = int(_3330);
    }
    int _3332 = _3328;
    float _3334 = fma(_995, _3114, _3298);
    if (!_3104)
    {
        int _3336 = _3332 << 4;
        int _3338 = _3336 + _3304;
        _3290 = _3338;
    }
    int _3340 = _3290;
    float _3342 = _3334 + _3122;
    float _3344 = _2840 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3346 = _3296 * 0.693147182464599609375;
    float _3348 = _2864 * _3160;
    float _3350 = _3160;
    if (!_3104)
    {
        float _3352 = -_3176;
        float _3354 = _2968 + _3352;
        _3350 = _3354;
    }
    float _3356 = _3350;
    float _3358 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3344);
    float _3360 = rsqrt(_3262);
    float _3362 = fma(_993, _3152, _3348);
    float _3364 = _2864 * _3200;
    float _3366 = fma(_993, _3192, _3364);
    float _3368 = -_3288;
    float _3370 = _3368 + 1.0;
    float2 _9120 = float2(_2972, _3222);
    float _3372 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9120, float2(0.0), isnan(_9120)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9120, float2(0.0), isnan(_9120)), level(0.0)).x;
    float _3374 = fma(_995, _3232, _3326);
    float _3376 = _3346 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3378 = 1.0 / _3342;
    float _3380 = _3360 * _3142;
    float _3382 = _3374 + _3240;
    float _3384 = _3360 * _3212;
    float _3386 = _3360 * _3206;
    float _3388 = _3380 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3390 = fma(_995, _3272, _3362);
    float _3392 = _2840 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3394 = abs(_3370);
    float _3396 = log2(_3394);
    float _3398 = fma(_2844, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3358);
    float _3400 = _3390 + _3280;
    float _3402 = _2840 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3404 = -_3388;
    float _3406 = fma(_3384, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3404);
    float _3408 = _3398 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3410 = fma(_995, _3314, _3366);
    float _3412 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3402);
    float _3414 = _3382 * _3378;
    float _3416 = _3400 * _3378;
    float _3418 = -_3386;
    float _3420 = fma(_3418, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3406);
    float _3422 = fma(_2844, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3412);
    float _3424 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3392);
    bool _3426 = _3414 >= 0.0;
    float _3428 = _3408 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3430 = _3422 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3432 = _3396 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _3434 = _3414 <= 1.0;
    bool _3436 = _3434 && _3426;
    float _3438 = fma(_3420, 0.5, 0.5);
    float _3440 = fma(_2844, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3424);
    float _3442 = exp2(_3432);
    bool _3444 = _3416 >= 0.0;
    bool _3446 = _3444 && _3436;
    float _3448 = fma(_3430, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3428);
    float _3450 = fma(_3420, -0.5, 0.5);
    float _3452 = _3388;
    if (!_3104)
    {
        int _3454 = _3340 + 400;
        uint _3456 = uint(int(uint(_3454) >> uint(2)));
        uint _3458 = uint(int(uint(int(_3456)) >> uint(2)));
        int _3460 = int(_3456) & 3;
        float _3462 = (*spvDescriptorSet0.vp_c15)._m0[int(_3458)][_3460];
        _3452 = _3462;
    }
    float _3464 = _3452;
    bool _3466 = _3416 <= 1.0;
    bool _3468 = _3466 && _3446;
    float _3470 = _3440 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3472 = fma(_3208, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3448);
    float _3474 = _3384 + 1.0;
    float _3476 = sqrt(_3450);
    float _3478 = _3410 + _3322;
    float _3480 = fma(_3470, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3472);
    float _3482 = fma(_3438, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3484 = _3408 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3486 = _3408 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3488 = fma(_3438, _3482, -0.212114393711090087890625);
    float _3490 = -_3384;
    float _3492 = fma(_3442, _3474, _3490);
    float _3494 = _3386;
    float _3496 = _3472;
    float _3498 = _3474;
    if (!_3104)
    {
        float _3500 = floor(_2934);
        _3494 = _3500;
    }
    float _3502 = _3494;
    if (_3468)
    {
        float _3504 = float(_3004);
        _3496 = _3504;
    }
    float _3506 = _3496;
    float _3508 = fma(_3438, _3488, 1.570728778839111328125);
    float _3510 = fma(_3430, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3484);
    float _3512 = fma(_3430, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3486);
    float _3514 = _3478 * _3378;
    float _3516 = fma(_3208, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3510);
    float _3518 = 1.0 / _3480;
    float _3520 = fma(_3208, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3512);
    float _3522 = _3476 * 0.636619746685028076171875;
    float _3524 = fma(_3470, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3516);
    float _3526 = fma(_3470, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3520);
    float _3528 = -_3508;
    float _3530 = fma(_3522, _3528, 1.0);
    float _3532 = _3510;
    if (_3468)
    {
        float _3534 = rint(_3506);
        float _3536 = precise::max(_3534, 0.0);
        uint _3538 = uint(_3536);
        uint _3540 = clamp(_3538, 0u, 65535u);
        _3532 = as_type<float>(_3540);
    }
    float _3542 = _3532;
    if (!_3104)
    {
        float _3544 = -_3502;
        float _3546 = _2934 + _3544;
        _3498 = _3546;
    }
    float _3548 = _3498;
    float _3550 = _3524 * _3518;
    float _3552 = _3526 * _3518;
    float _3554 = fma(_3492, 0.5, 0.5);
    float _3556 = fma(_3550, 0.5, 0.5);
    float _3558 = fma(_3552, -0.5, 0.5);
    float _3560 = _3542;
    if (_3468)
    {
        float3 _9446 = float3(_3414, _3416, float(as_type<int>(_3542)));
        float3 _9450 = select(_9446, float3(0.0), isnan(_9446));
        float _3562 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9450.xy, uint(rint(_9450.z)), _3514, level(0.0));
        _3560 = _3562;
    }
    float _3564 = _3560;
    float3 _9460 = float3(_3556, _3558, _3376);
    float _3566 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9460, float3(0.0), isnan(_9460)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9460, float3(0.0), isnan(_9460)), level(0.0)).x;
    float3 _9469 = float3(_3556, _3558, _3376);
    float4 _3569 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9469, float3(0.0), isnan(_9469)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9469, float3(0.0), isnan(_9469)), level(0.0)).xyzw;
    float _3571 = _3569.x;
    float _3573 = _3569.y;
    float _3575 = _3569.z;
    float _3577 = _3569.w;
    float2 _9485 = float2(_3530, _3554);
    float3 _3579 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9485, float2(0.0), isnan(_9485)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9485, float2(0.0), isnan(_9485)), level(0.0)).xyz;
    float _3581 = _3579.x;
    float _3583 = _3579.y;
    float _3585 = _3579.z;
    float _3587 = _3378;
    if (!_3104)
    {
        float _3589 = rint(_3464);
        float _3591 = precise::max(_3589, 0.0);
        uint _3593 = uint(_3591);
        uint _3595 = clamp(_3593, 0u, 65535u);
        _3587 = as_type<float>(_3595);
    }
    float _3597 = _3587;
    float _3599 = _3597;
    if (!_3104)
    {
        float3 _9522 = float3(_3548, _3356, float(as_type<int>(_3597)));
        float3 _9524 = select(_9522, float3(0.0), isnan(_9522));
        float _3601 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9524.xy, uint(rint(_9524.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9524.xy, uint(rint(_9524.z)), level(0.0)).x;
        _3599 = _3601;
    }
    float _3603 = _3599;
    float _3605 = abs(_2952);
    float _3607 = log2(_3605);
    float _3609 = _3408 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3611 = fma(_3430, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3609);
    float _3613 = fma(_3208, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3611);
    bool _3615 = _2952 <= 8000.0;
    bool _3617 = isnan(_2952);
    bool _3619 = _3615 || _3617;
    bool _3621 = isnan(8000.0);
    bool _3623 = _3619 || _3621;
    float _3625 = float(_3623);
    float _3627 = fma(_3470, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3613);
    float _3629 = _3396 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3631 = _3607 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3633 = exp2(_3629);
    out.gl_Position.x = _3524;
    out.gl_Position.y = _3526;
    out.gl_Position.z = _3627;
    out.gl_Position.w = _3480;
    float _3635 = exp2(_3631);
    float _3637 = fma(_3635, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3639 = precise::clamp(_3637, 0.0, 1.0);
    float _3641 = fma(_3639, -2.0, 3.0);
    float _3643 = _3639 * _3639;
    float _3645 = _3643 * _3641;
    float _3647 = _3627 + _3480;
    float _3649 = _3647 * 0.5;
    float _3651 = -_3645;
    float _3653 = _3651 + 1.0;
    out.m_96.z = _3649;
    out.m_96.w = _3480;
    float _3655 = fma(_3653, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3645);
    float _3657 = _3625 * _3655;
    float _3659 = _3625;
    float _3661 = _3627;
    float _3663 = _3524;
    if (!_3468)
    {
        _3659 = 1.0;
    }
    float _3665 = _3659;
    float _3667 = _3657 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3669 = -_3633;
    float _3671 = _3669 + 1.0;
    float _3673 = _3671 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3675 = _3671;
    float _3677 = _3665;
    if (_3104)
    {
        _3675 = 1.0;
    }
    float _3679 = _3675;
    float _3681 = -_3372;
    float _3683 = _3681 + 1.0;
    float _3685 = _3683 * _3667;
    float _3687 = precise::clamp(_3685, 0.0, 1.0);
    float _3689 = _3679;
    if (_3468)
    {
        bool _3691 = _3564 >= _3514;
        bool _3693 = isnan(_3564);
        bool _3695 = _3691 || _3693;
        bool _3697 = isnan(_3514);
        bool _3699 = _3695 || _3697;
        float _3701 = float(_3699);
        _3677 = _3701;
    }
    float _3703 = _3677;
    float _3705 = _3703;
    if (!_3104)
    {
        int _3707 = _3260 << 4;
        int _3709 = _3707 + 2048;
        uint _3711 = uint(int(uint(_3709) >> uint(2)));
        uint _3713 = uint(int(uint(int(_3711)) >> uint(2)));
        int _3715 = int(_3711) & 3;
        float _3717 = (*spvDescriptorSet0.vp_c15)._m0[int(_3713)][_3715];
        int _3719 = int(_3711) + 1;
        uint _3721 = uint(int(uint(_3719) >> uint(2)));
        int _3723 = _3719 & 3;
        float _3725 = (*spvDescriptorSet0.vp_c15)._m0[int(_3721)][_3723];
        int _3727 = _3709 + 8;
        uint _3729 = uint(int(uint(_3727) >> uint(2)));
        uint _3731 = uint(int(uint(int(_3729)) >> uint(2)));
        int _3733 = int(_3729) & 3;
        float _3735 = (*spvDescriptorSet0.vp_c15)._m0[int(_3731)][_3733];
        int _3737 = int(_3729) + 1;
        uint _3739 = uint(int(uint(_3737) >> uint(2)));
        int _3741 = _3737 & 3;
        float _3743 = (*spvDescriptorSet0.vp_c15)._m0[int(_3739)][_3741];
        float _3745 = _2864 * _3725;
        float _3747 = fma(_993, _3717, _3745);
        float _3749 = fma(_995, _3735, _3747);
        float _3751 = _3749 + _3743;
        float _3753 = precise::clamp(_3751, 0.0, 1.0);
        float _3755 = -_3753;
        float _3757 = _3755 + _3603;
        float _3759 = fma(_3757, 500.0, 1.5);
        float _3761 = exp2(_3759);
        float _3763 = 0.0 + _3761;
        float _3765 = precise::clamp(_3763, 0.0, 1.0);
        _3689 = _3765;
        _3661 = _3735;
    }
    float _3767 = _3689;
    float _3769 = _3661;
    float _3771 = _3703 * _3767;
    float _3773 = -_3687;
    float _3775 = fma(_3773, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3777 = _3673 * _3566;
    out.m_98.x = _2842;
    out.m_98.y = _2840;
    out.m_98.z = _2844;
    bool _3779 = _2876 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3781 = isnan(_2876);
    bool _3783 = _3779 || _3781;
    bool _3785 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3787 = _3783 || _3785;
    float _3789 = -_3771;
    float _3791 = fma(_3789, _3775, 1.0);
    float _3793 = precise::clamp(_3791, 0.0, 1.0);
    float _3795 = _3577 * _3777;
    float _3797 = -_3673;
    float _3799 = _3797 + 1.0;
    float _3801 = _3585 * _3777;
    float _3803 = _3793 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3805 = fma(_3581, _3795, _3571);
    float _3807 = fma(_3583, _3795, _3573);
    float _3809 = _3577 * _3799;
    float _3811 = fma(_3577, _3801, _3575);
    out.m_100.x = _3803;
    float _3813 = _3769;
    float _3815 = _3795;
    float _3817 = _3799;
    float _3819 = _3793;
    if (!_3787)
    {
        _3813 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3821 = _3813;
    out.m_102.x = _3805;
    out.m_102.y = _3807;
    out.m_102.z = _3811;
    out.m_102.w = _3809;
    float _3823 = _3821;
    float _3825 = _3821;
    if (!_3787)
    {
        _3705 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3827 = _3705;
    float _3829 = _3827;
    float _3831 = _3827;
    if (!_3787)
    {
        _3663 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3833 = _3663;
    float _3835 = _3833;
    float _3837 = _3833;
    if (!_3787)
    {
        _3815 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3839 = _3815;
    float _3841 = _3839;
    float _3843 = _3839;
    if (!_3787)
    {
        _3817 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3845 = _3817;
    float _3847 = _3845;
    float _3849 = _3845;
    if (!_3787)
    {
        _3819 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3851 = _3819;
    bool _3853 = !_3787;
    float _3855 = _3851;
    float _3857 = _3851;
    if (!_3853)
    {
        bool _3859 = _2876 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3861 = isnan(_2876);
        bool _3863 = _3859 || _3861;
        bool _3865 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3867 = _3863 || _3865;
        if (!_3867)
        {
            float _3869 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3871 = _2876 + _3869;
            float _3873 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3875 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3873;
            float _3877 = 1.0 / _3875;
            float _3879 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3881 = _3879 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3883 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3885 = _3883 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3887 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3889 = _3887 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3891 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3893 = _3891 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3895 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3897 = _3895 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3899 = _3871 * _3877;
            float _3901 = precise::clamp(_3899, 0.0, 1.0);
            float _3903 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3905 = _3903 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3907 = fma(_3901, _3881, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3909 = fma(_3901, _3905, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3911 = fma(_3901, _3885, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3913 = fma(_3901, _3889, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3915 = fma(_3901, _3893, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3917 = fma(_3901, _3897, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3831 = _3909;
            _3849 = _3915;
            _3825 = _3907;
            _3843 = _3913;
            _3837 = _3911;
            _3857 = _3917;
            _3919 = true;
        }
        else
        {
            bool _3921 = _2876 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3923 = isnan(_2876);
            bool _3925 = _3921 || _3923;
            bool _3927 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3929 = _3925 || _3927;
            if (!_3929)
            {
                _3823 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3931 = _3823;
            _3825 = _3931;
            if (!_3929)
            {
                _3829 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3933 = _3829;
            _3831 = _3933;
            if (!_3929)
            {
                _3835 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3935 = _3835;
            _3837 = _3935;
            if (!_3929)
            {
                _3841 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3937 = _3841;
            _3843 = _3937;
            if (!_3929)
            {
                _3847 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3939 = _3847;
            _3849 = _3939;
            if (!_3929)
            {
                _3855 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3941 = _3855;
            bool _3943 = !_3929;
            _3857 = _3941;
            if (!_3943)
            {
                bool _3945 = _2876 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3947 = isnan(_2876);
                bool _3949 = _3945 || _3947;
                bool _3951 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3953 = _3949 || _3951;
                if (!_3953)
                {
                    float _3955 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3957 = _2876 + _3955;
                    float _3959 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3961 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3959;
                    float _3963 = 1.0 / _3961;
                    float _3965 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3967 = _3965 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3969 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3971 = _3969 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3973 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3975 = _3973 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3977 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3979 = _3977 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3981 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3983 = _3981 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3985 = _3957 * _3963;
                    float _3987 = precise::clamp(_3985, 0.0, 1.0);
                    float _3989 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3991 = _3989 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3993 = fma(_3987, _3967, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3995 = fma(_3987, _3991, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3997 = fma(_3987, _3971, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3999 = fma(_3987, _3975, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4001 = fma(_3987, _3979, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4003 = fma(_3987, _3983, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3831 = _3995;
                    _3849 = _4001;
                    _3825 = _3993;
                    _3843 = _3999;
                    _3837 = _3997;
                    _3857 = _4003;
                    _3919 = true;
                }
                else
                {
                    _3831 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3849 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3825 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3843 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3837 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3857 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3919 = false;
    float _4005 = _3831;
    float _4007 = _3849;
    float _4009 = _3825;
    float _4011 = _3843;
    float _4013 = _3837;
    float _4015 = _3857;
    float _4017 = fma(_2742, -0.5, 0.5);
    float _4019 = precise::clamp(_4017, 0.0, 1.0);
    float _4021 = -_4005;
    float _4023 = _4021 + _4007;
    float _4025 = -_4009;
    float _4027 = _4025 + _4011;
    float _4029 = -_4013;
    float _4031 = _4029 + _4015;
    bool _4033 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4035 = fma(_4019, _4023, _4005);
    float _4037 = fma(_4019, _4027, _4009);
    float _4039 = fma(_4019, _4031, _4013);
    float _4041 = _4035 * 0.586610972881317138671875;
    out.m_104.x = 0.0;
    float _4043 = fma(_4037, 0.298911988735198974609375, _4041);
    float _4045 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4047 = fma(_4039, 0.114477999508380889892578125, _4043);
    out.m_63.x = _4045;
    float _4049 = -_4047;
    float _4051 = _4037 + _4049;
    float _4053 = -_4047;
    float _4055 = _4035 + _4053;
    float _4057 = -_4047;
    float _4059 = _4039 + _4057;
    float _4061 = fma(_4051, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4047);
    float _4063 = fma(_4055, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4047);
    float _4065 = fma(_4059, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4047);
    out.m_106.x = _4061;
    out.m_106.y = _4063;
    out.m_106.z = _4065;
    if (!_4033)
    {
        return out;
    }
    float _4067 = -_2840;
    float _4069 = _4067 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4071 = -_2842;
    float _4073 = _4071 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4075 = -_2844;
    float _4077 = _4075 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4079 = _4069 * _4069;
    float _4081 = fma(_4073, _4073, _4079);
    float _4083 = fma(_4077, _4077, _4081);
    float _4085 = sqrt(_4083);
    float _4087 = rsqrt(_4083);
    float _4089 = -_4085;
    float _4091 = _4089 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4093 = _4091 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4095 = precise::clamp(_4093, 0.0, 1.0);
    float _4097 = _4073 * _4087;
    float _4099 = _4069 * _4087;
    float _4101 = abs(_4095);
    float _4103 = log2(_4101);
    float _4105 = _4077 * _4087;
    float _4107 = _4097 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4109 = _2742 * _4099;
    float _4111 = -_4099;
    float _4113 = -_4107;
    float _4115 = fma(_4111, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4113);
    float _4117 = fma(_2736, _4097, _4109);
    float _4119 = -_4105;
    float _4121 = fma(_4119, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4115);
    float _4123 = fma(_2744, _4105, _4117);
    float _4125 = precise::clamp(_4123, 0.0, 1.0);
    float _4127 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4129 = _4121 + _4127;
    float _4131 = _4103 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4133 = _4129 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4135 = precise::clamp(_4133, 0.0, 1.0);
    float _4137 = exp2(_4131);
    float _4139 = _4137 * _4135;
    float _4141 = _4125 * _4139;
    float _4143 = _4141 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4145 = _4141 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4147 = _4141 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_104.x = _4143;
    out.m_104.y = _4145;
    out.m_104.z = _4147;
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
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3919 = false;
    bool _2796 = false;
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
        float _4204 = as_type<float>(_141);
        out.gl_Position.z = _4204;
    }
    if (!_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _4274 = as_type<float>(_179);
        out.gl_Position.z = _4274;
    }
    if (_171)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float2 _5742 = float2(_1125, _1127);
    float3 _1131 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5742, float2(0.0), isnan(_5742)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5742, float2(0.0), isnan(_5742)), level(0.0)).xyz;
    float _1133 = _1131.x;
    float _1135 = _1131.y;
    float _1137 = _1131.z;
    float _1139 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1141 = int(_1139);
    float _1143 = _1123;
    if (_263)
    {
        float _1145 = in.m_70.x;
        _1069 = _1145;
    }
    float _1147 = _1069;
    float _1149 = -_583;
    float _1151 = _1149 + 1.0;
    float _1153 = -_685;
    float _1155 = _1153 + 1.0;
    float _1157 = _1147;
    if (!_263)
    {
        float _1159 = in.m_70.y;
        _1157 = _1159;
    }
    float _1161 = _1157;
    float _1163 = -_687;
    float _1165 = _1163 + 1.0;
    float _1167 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1169 = trunc(_575);
    int _1171 = int(_1169);
    float _1173 = -_679;
    float _1175 = _1173 + 1.0;
    float _1177 = float(uint(_1141));
    float _1179 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1181 = int(_1179);
    int _1183 = ~_1141;
    int _1185 = _1183 + 1;
    float _1187 = float(_1141);
    bool _1189 = _1141 == 0;
    float _1191 = float(uint(_1171));
    float _1193 = 1.0 / _1177;
    float _1195 = float(uint(_1181));
    float _1197 = trunc(_659);
    int _1199 = int(_1197);
    int _1201 = ~_1181;
    int _1203 = _1201 + 1;
    bool _1205 = _1181 == 0;
    int _1207 = as_type<int>(_1193) + (-2);
    float _1209 = 1.0 / _1195;
    float _1211 = _1193;
    float _1213 = _1175;
    if (_263)
    {
        _1211 = 1.0;
    }
    float _1215 = _1211;
    float _1217 = _1215;
    if (!_263)
    {
        _1217 = 7.345489978790283203125;
    }
    float _1219 = _1217;
    float _1221 = as_type<float>(_1207) * _1191;
    float _1223 = trunc(_1221);
    float _1225 = precise::max(_1223, 0.0);
    uint _1228 = uint(_1225);
    float _1230 = _1219 * _231;
    int _1232 = as_type<int>(_1209) + (-2);
    float _1234 = float(uint(_1199));
    int _1236 = _1185 * int(_1228);
    int _1238 = _1236 + _1171;
    float _1240 = as_type<float>(_1232) * _1234;
    float _1242 = float(_1171);
    float _1244 = float(uint(_1238));
    float _1246 = floor(_1230);
    bool _1248 = _1242 >= _1187;
    bool _1250 = isnan(_1242);
    bool _1252 = _1248 || _1250;
    bool _1254 = isnan(_1187);
    bool _1256 = _1252 || _1254;
    float _1258 = float(_1256);
    float _1260 = as_type<float>(_1207) * _1244;
    float _1262 = trunc(_1240);
    float _1264 = precise::max(_1262, 0.0);
    uint _1266 = uint(_1264);
    float _1268 = trunc(_1260);
    float _1270 = precise::max(_1268, 0.0);
    uint _1272 = uint(_1270);
    float _1274 = -_1246;
    float _1276 = _1230 + _1274;
    int _1278 = ~_1141;
    int _1280 = _1278 + 1;
    float _1282 = _1276 * _1187;
    int _1284 = _1203 * int(_1266);
    int _1286 = _1284 + _1199;
    float _1288 = trunc(_1258);
    int _1290 = int(_1288);
    float _1292 = float(uint(_1286));
    int _1294 = int(_1228) + int(_1272);
    float _1296 = as_type<float>(_1232) * _1292;
    float _1298 = trunc(_1282);
    int _1300 = int(_1298);
    int _1302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1304 = _1302 != 0;
    float _1306 = as_type<float>(_1280);
    if (_263)
    {
        _1306 = 1.0;
    }
    float _1308 = _1306;
    int _1310 = _1280 * _1294;
    int _1312 = _1310 + _1171;
    float _1314 = _1308;
    if (!_263)
    {
        _1314 = 1.2345600128173828125;
    }
    float _1316 = _1314;
    bool _1318 = !_1304;
    int _1320 = _1318 ? 0 : 1;
    bool _1322 = uint(_1312) >= uint(_1141);
    float _1324 = _1316 * _1161;
    float _1326 = trunc(_1296);
    float _1328 = precise::max(_1326, 0.0);
    uint _1330 = uint(_1328);
    int _1332 = abs(_1320);
    bool _1334 = !_1322;
    int _1336 = _1334 ? 0 : (-1);
    int _1338 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1340 = _1338 != 0;
    int _1342 = ~_1294;
    int _1344 = _1342 + _1336;
    int _1346 = _1344 + 1;
    float _1348 = _1187 * _467;
    int _1350 = ~_1181;
    int _1352 = _1350 + 1;
    int _1354 = abs(_505);
    int _1356 = _1141 * _1346;
    int _1358 = _1356 + _1171;
    float _1360 = trunc(_1348);
    int _1362 = int(_1360);
    int _1364 = ~_1290;
    int _1366 = _1364 + 1;
    int _1368 = _1366 + 1;
    bool _1370 = !_1189;
    int _1372 = _1370 ? _1358 : (-1);
    int _1374 = _1300 * _1332;
    int _1376 = _1374 + _1171;
    int _1378 = int(_1266) + int(_1330);
    int _1380 = _1141 + (-1);
    int _1382 = _1372 * _1368;
    int _1384 = abs(_501);
    int _1386 = _1352 * _1378;
    int _1388 = _1386 + _1199;
    float _1390 = floor(_1324);
    int _1392 = _1290 * _1380;
    int _1394 = _1392 + _1382;
    float _1396 = float(_1181);
    float _1398 = float(_1199);
    bool _1400 = uint(_1388) >= uint(_1181);
    int _1402 = _1394 * _1384;
    bool _1404 = _1398 >= _1396;
    bool _1406 = isnan(_1398);
    bool _1408 = _1404 || _1406;
    bool _1410 = isnan(_1396);
    bool _1412 = _1408 || _1410;
    float _1414 = float(_1412);
    int _1416 = abs(_509);
    bool _1418 = !_1400;
    int _1420 = _1418 ? 0 : (-1);
    float _1422 = trunc(_1414);
    int _1424 = int(_1422);
    float _1426 = -_1390;
    float _1428 = _1324 + _1426;
    int _1430 = ~_1378;
    int _1432 = _1430 + _1420;
    int _1434 = _1432 + 1;
    bool _1436 = !_1340;
    int _1438 = _1436 ? 0 : 1;
    int _1440 = _1362 * _1354;
    int _1442 = _1440 + _1402;
    float _1444 = _1428 * _1396;
    int _1446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1448 = _1446 != 0;
    int _1450 = _1181 * _1434;
    int _1452 = _1450 + _1199;
    int _1454 = abs(_1438);
    int _1456 = _1376 * _1416;
    int _1458 = _1456 + _1442;
    bool _1460 = !_1448;
    int _1462 = _1460 ? 0 : 1;
    float _1464 = trunc(_1444);
    int _1466 = int(_1464);
    int _1468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1470 = _1468 != 0;
    int _1472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1474 = _1472 != 0;
    int _1476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1478 = _1476 != 0;
    int _1480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1482 = _1480 != 0;
    float _1484 = _1396 * _467;
    int _1486 = _1300 * _1454;
    int _1488 = _1486 + _1458;
    int _1490 = ~_1424;
    int _1492 = _1490 + 1;
    int _1494 = _1492 + 1;
    bool _1496 = !_1205;
    int _1498 = _1496 ? _1452 : (-1);
    float _1500 = trunc(_1484);
    int _1502 = int(_1500);
    bool _1504 = !_1474;
    int _1506 = _1504 ? 0 : 1;
    float _1508 = float(uint(_1488));
    int _1510 = _1498 * _1494;
    int _1512 = abs(_1462);
    int _1514 = _1181 + (-1);
    float _1516 = as_type<float>(_1207) * _1508;
    bool _1518 = !_1470;
    int _1520 = _1518 ? 0 : 1;
    int _1522 = abs(_1506);
    int _1524 = _1424 * _1514;
    int _1526 = _1524 + _1510;
    int _1528 = abs(_1520);
    float _1530 = trunc(_1516);
    float _1532 = precise::max(_1530, 0.0);
    uint _1534 = uint(_1532);
    int _1536 = _1466 * _1512;
    int _1538 = _1536 + _1199;
    bool _1540 = !_1478;
    int _1542 = _1540 ? 0 : 1;
    int _1544 = _1526 * _1522;
    int _1546 = ~_1141;
    int _1548 = _1546 + 1;
    float _1550 = float(uint(_1376));
    int _1552 = _1502 * _1528;
    int _1554 = _1552 + _1544;
    bool _1556 = !_1482;
    int _1558 = _1556 ? 0 : 1;
    int _1560 = abs(_1542);
    float _1562 = as_type<float>(_1207) * _1550;
    int _1564 = abs(_1558);
    int _1566 = _1538 * _1560;
    int _1568 = _1566 + _1554;
    float _1570 = trunc(_1562);
    float _1572 = precise::max(_1570, 0.0);
    uint _1574 = uint(_1572);
    int _1576 = _1548 * int(_1534);
    int _1578 = _1576 + _1488;
    float _1580 = float(uint(_1538));
    int _1582 = _1466 * _1564;
    int _1584 = _1582 + _1568;
    int _1586 = ~_1181;
    int _1588 = _1586 + 1;
    float _1590 = float(uint(_1578));
    float _1592 = as_type<float>(_1232) * _1580;
    float _1594 = float(uint(_1584));
    int _1596 = ~_1141;
    int _1598 = _1596 + 1;
    float _1600 = trunc(_1592);
    float _1602 = precise::max(_1600, 0.0);
    uint _1604 = uint(_1602);
    float _1606 = as_type<float>(_1207) * _1590;
    float _1608 = as_type<float>(_1232) * _1594;
    int _1610 = _1598 * int(_1574);
    int _1612 = _1610 + _1376;
    float _1614 = trunc(_1606);
    float _1616 = precise::max(_1614, 0.0);
    uint _1618 = uint(_1616);
    int _1620 = ~_1181;
    int _1622 = _1620 + 1;
    float _1624 = float(uint(_1612));
    float _1626 = trunc(_1608);
    float _1628 = precise::max(_1626, 0.0);
    uint _1630 = uint(_1628);
    int _1632 = _1588 * int(_1604);
    int _1634 = _1632 + _1538;
    float _1636 = as_type<float>(_1207) * _1624;
    int _1638 = ~_1141;
    int _1640 = _1638 + 1;
    float _1642 = float(uint(_1634));
    float _1644 = trunc(_1636);
    float _1646 = precise::max(_1644, 0.0);
    uint _1648 = uint(_1646);
    int _1650 = int(_1534) + int(_1618);
    float _1652 = as_type<float>(_1232) * _1642;
    int _1654 = _1622 * int(_1630);
    int _1656 = _1654 + _1584;
    float _1658 = trunc(_1652);
    float _1660 = precise::max(_1658, 0.0);
    uint _1662 = uint(_1660);
    int _1664 = _1640 * _1650;
    int _1666 = _1664 + _1488;
    float _1668 = float(uint(_1656));
    bool _1670 = uint(_1666) >= uint(_1141);
    int _1672 = int(_1574) + int(_1648);
    float _1674 = as_type<float>(_1232) * _1668;
    bool _1676 = !_1670;
    int _1678 = _1676 ? 0 : (-1);
    int _1680 = ~_1181;
    int _1682 = _1680 + 1;
    float _1684 = trunc(_1674);
    float _1686 = precise::max(_1684, 0.0);
    uint _1688 = uint(_1686);
    int _1690 = ~_1650;
    int _1692 = _1690 + _1678;
    int _1694 = _1692 + 1;
    int _1696 = int(_1604) + int(_1662);
    int _1698 = _1141 * _1694;
    int _1700 = _1698 + _1488;
    int _1702 = ~_1141;
    int _1704 = _1702 + 1;
    int _1706 = _1682 * _1696;
    int _1708 = _1706 + _1538;
    int _1710 = ~_1181;
    int _1712 = _1710 + 1;
    bool _1714 = !_1189;
    int _1716 = _1714 ? _1700 : (-1);
    int _1718 = _1704 * _1672;
    int _1720 = _1718 + _1376;
    int _1722 = _1716 & 3;
    bool _1724 = _1722 != 0;
    int _1726 = int(_1630) + int(_1688);
    int _1728 = _1716 & 3;
    bool _1730 = _1728 != 0;
    bool _1732 = uint(_1722) >= 2u;
    int _1734 = _1712 * _1726;
    int _1736 = _1734 + _1584;
    int _1738 = _1730 ? 0 : 1;
    bool _1740 = uint(_1720) >= uint(_1141);
    int _1742 = _1732 ? 0 : 1;
    bool _1744 = uint(_1736) >= uint(_1181);
    bool _1746 = uint(_1722) > 1u;
    bool _1748 = !_1740;
    int _1750 = _1748 ? 0 : (-1);
    bool _1752 = !_1744;
    int _1754 = _1752 ? 0 : (-1);
    int _1756 = ~_1672;
    int _1758 = _1756 + _1750;
    int _1760 = _1758 + 1;
    int _1762 = ~_1726;
    int _1764 = _1762 + _1754;
    int _1766 = _1764 + 1;
    bool _1768 = _237 > 0.5;
    int _1770 = _1141 * _1760;
    int _1772 = _1770 + _1376;
    int _1774 = ~_1738;
    int _1776 = _1774 + 1;
    int _1778 = _1776 + 1;
    int _1780 = _1181 * _1766;
    int _1782 = _1780 + _1584;
    int _1784 = _1778;
    if (!_1746)
    {
        int _1786 = ~_1738;
        int _1788 = _1786 + 1;
        _1784 = _1788;
    }
    int _1790 = _1784;
    float _1792 = -_199;
    int _1794 = _1768 ? as_type<int>(_1792) : as_type<int>(_199);
    int _1796 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1798 = _1796 != 0;
    bool _1800 = !_1205;
    int _1802 = _1800 ? _1782 : (-1);
    bool _1804 = _1722 != 3;
    bool _1806 = !_1189;
    int _1808 = _1806 ? _1772 : (-1);
    int _1810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1812 = _1810 != 0;
    bool _1814 = !_1798;
    int _1816 = _1814 ? 0 : 1;
    int _1818 = _1716 >> 31;
    int _1820 = _1802 & 3;
    bool _1822 = _1820 != 0;
    int _1824 = _1802 >> 31;
    bool _1826 = !_1812;
    int _1828 = _1826 ? 0 : 1;
    int _1830 = _1818 & 3;
    bool _1832 = uint(_1708) >= uint(_1181);
    int _1834 = _1802 & 3;
    bool _1836 = _1834 != 0;
    bool _1838 = !_1822;
    float _1840 = _1838 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _1842 = _1824 & 3;
    bool _1844 = uint(_1820) > 1u;
    int _1846 = _1716 + _1830;
    bool _1848 = !_1832;
    int _1850 = _1848 ? 0 : (-1);
    int _1852 = _1836 ? 0 : 1;
    int _1854 = _1802 + _1842;
    int _1856 = ~_1742;
    int _1858 = _1856 + 1;
    int _1860 = _1858 + 1;
    bool _1862 = _1722 != 3;
    int _1864 = _1860;
    float _1866 = _1840;
    if (_1804)
    {
        int _1868 = ~_1742;
        int _1870 = _1868 + 1;
        _1864 = _1870;
    }
    int _1872 = _1864;
    bool _1874 = !_1724;
    int _1876 = _1874 ? 0 : 1;
    int _1878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1880 = _1878 != 0;
    int _1882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1884 = _1882 != 0;
    int _1886 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1888 = _1886 != 0;
    int _1890 = _1846 >> 2;
    int _1892 = ~_1696;
    int _1894 = _1892 + _1850;
    int _1896 = _1894 + 1;
    int _1898 = _1854 >> 2;
    bool _1900 = !_1862;
    int _1902 = _1900 ? 0 : (-1);
    int _1904 = _1181 * _1896;
    int _1906 = _1904 + _1538;
    bool _1908 = uint(_1820) >= 2u;
    int _1910 = _1890 << 4;
    int _1912 = _1910 + 368;
    int _1914 = _1898 << 4;
    int _1916 = _1914 + 512;
    int _1918 = ~_1852;
    int _1920 = _1918 + 1;
    int _1922 = _1920 + 1;
    uint _1924 = uint(int(uint(_1912) >> uint(2)));
    uint _1926 = uint(int(uint(int(_1924)) >> uint(2)));
    int _1928 = int(_1924) & 3;
    float _1930 = (*spvDescriptorSet0.vp_c9)._m0[int(_1926)][_1928];
    int _1932 = int(_1924) + 1;
    uint _1934 = uint(int(uint(_1932) >> uint(2)));
    int _1936 = _1932 & 3;
    float _1938 = (*spvDescriptorSet0.vp_c9)._m0[int(_1934)][_1936];
    int _1940 = _1922;
    if (!_1844)
    {
        int _1942 = ~_1852;
        int _1944 = _1942 + 1;
        _1940 = _1944;
    }
    int _1946 = _1940;
    int _1948 = _1908 ? 0 : 1;
    bool _1950 = _1820 != 3;
    bool _1952 = _1820 != 3;
    int _1954 = _1912 + 8;
    uint _1956 = uint(int(uint(_1954) >> uint(2)));
    uint _1958 = uint(int(uint(int(_1956)) >> uint(2)));
    int _1960 = int(_1956) & 3;
    float _1962 = (*spvDescriptorSet0.vp_c9)._m0[int(_1958)][_1960];
    int _1964 = int(_1956) + 1;
    uint _1966 = uint(int(uint(_1964) >> uint(2)));
    int _1968 = _1964 & 3;
    float _1970 = (*spvDescriptorSet0.vp_c9)._m0[int(_1966)][_1968];
    int _1972 = ~_1948;
    int _1974 = _1972 + 1;
    int _1976 = _1974 + 1;
    bool _1978 = !_1205;
    int _1980 = _1978 ? _1906 : (-1);
    uint _1982 = uint(int(uint(_1916) >> uint(2)));
    uint _1984 = uint(int(uint(int(_1982)) >> uint(2)));
    int _1986 = int(_1982) & 3;
    float _1988 = (*spvDescriptorSet0.vp_c9)._m0[int(_1984)][_1986];
    int _1990 = int(_1982) + 1;
    uint _1992 = uint(int(uint(_1990) >> uint(2)));
    int _1994 = _1990 & 3;
    float _1996 = (*spvDescriptorSet0.vp_c9)._m0[int(_1992)][_1994];
    int _1998 = _1976;
    if (_1950)
    {
        int _2000 = ~_1948;
        int _2002 = _2000 + 1;
        _1998 = _2002;
    }
    int _2004 = _1998;
    float _2006 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2008 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2010 = _2008 != 0;
    float _2012 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2014 = _1916 + 8;
    uint _2016 = uint(int(uint(_2014) >> uint(2)));
    uint _2018 = uint(int(uint(int(_2016)) >> uint(2)));
    int _2020 = int(_2016) & 3;
    float _2022 = (*spvDescriptorSet0.vp_c9)._m0[int(_2018)][_2020];
    int _2024 = int(_2016) + 1;
    uint _2026 = uint(int(uint(_2024) >> uint(2)));
    int _2028 = _2024 & 3;
    float _2030 = (*spvDescriptorSet0.vp_c9)._m0[int(_2026)][_2028];
    float _2032 = _2006 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2034 = abs(_1946);
    float _2036 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2038 = abs(_1790);
    float _2040 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2042 = abs(_1876);
    float _2044 = _2036 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2046 = !_1952;
    int _2048 = _2046 ? 0 : (-1);
    float _2050 = _2040 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2052 = _231 > 0.5;
    bool _2054 = _233 > 0.5;
    out.m_82.x = _2044;
    out.m_82.y = _2032;
    out.m_82.z = _2050;
    out.m_82.w = _2012;
    int _2056 = ~_2038;
    int _2058 = _2056 + 1;
    int _2060 = _2058 + 1;
    float _2062 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2064 = -_195;
    int _2066 = _2052 ? as_type<int>(_2064) : as_type<int>(_195);
    float _2068 = _1167 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2070 = _235 > 0.5;
    float _2072 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2074 = _2060 * as_type<int>(_1938);
    int _2076 = abs(_1872);
    float _2078 = _2062 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2080 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2082 = int(_2080);
    float _2084 = _2072 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2086 = abs(as_type<int>(_1840));
    if (_1035)
    {
        float _2088 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2090 = _1119 + _2088;
        _1866 = _2090;
    }
    float _2092 = _1866;
    int _2094 = ~_2034;
    int _2096 = _2094 + 1;
    int _2098 = _2096 + 1;
    int _2100 = ~_2042;
    int _2102 = _2100 + 1;
    int _2104 = _2102 + 1;
    out.m_84.x = _2068;
    out.m_84.y = _2078;
    out.m_84.z = _2084;
    int _2106 = ~_2086;
    int _2108 = _2106 + 1;
    int _2110 = _2108 + 1;
    int _2112 = _2098 * as_type<int>(_1996);
    int _2114 = abs(_1902);
    int _2116 = _2104 * as_type<int>(_1930);
    int _2118 = _2116 + _2074;
    int _2120 = abs(_2048);
    int _2122 = _2110 * as_type<int>(_1988);
    int _2124 = _2122 + _2112;
    float _2126 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2128 = int(_2126);
    int _2130 = abs(_2004);
    float _2132 = _937 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2134 = ~_2076;
    int _2136 = _2134 + 1;
    int _2138 = _2136 + 1;
    float _2140 = _949 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2142 = _937 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2144 = float(uint(_2082));
    int _2146 = _2138 * as_type<int>(_1962);
    int _2148 = _2146 + _2118;
    int _2150 = ~_2114;
    int _2152 = _2150 + 1;
    int _2154 = _2152 + 1;
    float _2156 = _949 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2158 = ~_2130;
    int _2160 = _2158 + 1;
    int _2162 = _2160 + 1;
    if (_1035)
    {
        float _2164 = _2092 * _2092;
        _1057 = _2164;
    }
    float _2166 = _1057;
    float _2168 = 1.0 / _2144;
    int _2170 = _2154 * as_type<int>(_1970);
    int _2172 = _2170 + _2148;
    int _2174 = abs(_1816);
    int _2176 = _2162 * as_type<int>(_2022);
    int _2178 = _2176 + _2124;
    int _2180 = abs(_2082);
    int _2182 = ~_2174;
    int _2184 = _2182 + 1;
    int _2186 = _2184 + 1;
    int _2188 = ~_2120;
    int _2190 = _2188 + 1;
    int _2192 = _2190 + 1;
    float _2194 = float(uint(_2128));
    int _2196 = _2172 * _2186;
    int _2198 = _2192 * as_type<int>(_2030);
    int _2200 = _2198 + _2178;
    int _2202 = abs(_1828);
    float _2204 = _937 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2206 = _1808 * _2174;
    int _2208 = _2206 + _2196;
    float _2210 = 1.0 / _2194;
    float _2212 = float(uint(_2180));
    float _2214 = -_931;
    float _2216 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2132);
    int _2218 = abs(_2128);
    float _2220 = -_931;
    float _2222 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2204);
    int _2224 = as_type<int>(_2168) + (-2);
    float _2226 = _957 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2228 = float(uint(_2208));
    float _2230 = 1.0 / _2212;
    float _2232 = -_931;
    float _2234 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2142);
    int _2236 = ~_2202;
    int _2238 = _2236 + 1;
    int _2240 = _2238 + 1;
    float _2242 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2216);
    float _2244 = float(uint(_2218));
    float _2246 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2234);
    float _2248 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2222);
    float _2250 = _949 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2252 = as_type<float>(_2224) * _2228;
    int _2254 = _2200 * _2240;
    float _2256 = 1.0 / _2244;
    float _2258 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2250);
    int _2260 = abs(_2208);
    int _2262 = _1980 * _2202;
    int _2264 = _2262 + _2254;
    float _2266 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2140);
    float _2268 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2156);
    int _2270 = as_type<int>(_2210) + (-2);
    float _2272 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2258);
    float _2274 = trunc(_2252);
    float _2276 = precise::max(_2274, 0.0);
    uint _2278 = uint(_2276);
    float _2280 = float(uint(_2264));
    int _2282 = abs(_2264);
    float _2284 = as_type<float>(_2270) * _2280;
    float _2286 = float(uint(_2260));
    float _2288 = as_type<float>(_2200);
    if (_1035)
    {
        float _2290 = _1079 * 6.283185482025146484375;
        float _2292 = cos(_2290);
        _2288 = _2292;
    }
    float _2294 = _2288;
    int _2296 = ~_2082;
    int _2298 = _2296 + 1;
    float _2300 = _957 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2302 = as_type<int>(_2256) + (-2);
    float _2304 = float(uint(_2282));
    bool _2306 = !_1880;
    float _2308 = _2306 ? _199 : as_type<float>(_1794);
    float _2310 = trunc(_2284);
    float _2312 = precise::max(_2310, 0.0);
    uint _2314 = uint(_2312);
    int _2316 = as_type<int>(_2230) + (-2);
    float _2318 = _957 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2320 = !_2010;
    float _2322 = _2320 ? _195 : as_type<float>(_2066);
    bool _2324 = _2128 == 0;
    float _2326 = as_type<float>(_2316) * _2286;
    float _2328 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2300);
    int _2330 = _2298 * int(_2278);
    int _2332 = _2330 + _2208;
    float _2334 = as_type<float>(_2302) * _2304;
    float _2336 = trunc(_2326);
    float _2338 = precise::max(_2336, 0.0);
    uint _2340 = uint(_2338);
    float _2342 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2318);
    float _2344 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2226);
    float _2346 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2328);
    float _2348 = float(uint(_2332));
    float _2350 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2342);
    float _2352 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2344);
    int _2354 = ~_2180;
    int _2356 = _2354 + 1;
    float _2358 = trunc(_2334);
    float _2360 = precise::max(_2358, 0.0);
    uint _2362 = uint(_2360);
    int _2364 = ~_2128;
    int _2366 = _2364 + 1;
    float _2368 = as_type<float>(_2224) * _2348;
    float _2370 = as_type<float>(_2356);
    if (_1035)
    {
        float _2372 = _2294 + (-1.0);
        _2370 = _2372;
    }
    float _2374 = _2370;
    int _2376 = ~_2218;
    int _2378 = _2376 + 1;
    int _2380 = _2366 * int(_2314);
    int _2382 = _2380 + _2264;
    int _2384 = _2356 * int(_2340);
    int _2386 = _2384 + _2260;
    float _2388 = _2374;
    if (_1035)
    {
        float _2390 = _2374 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2388 = _2390;
    }
    float _2392 = _2388;
    float _2394 = trunc(_2368);
    float _2396 = precise::max(_2394, 0.0);
    uint _2398 = uint(_2396);
    float _2400 = float(uint(_2382));
    float _2402 = float(uint(_2386));
    if (_1035)
    {
        float _2404 = fma(_1097, _2294, _2392);
        _1099 = _2404;
    }
    float _2406 = _1099;
    float _2408 = -_199;
    int _2410 = _2054 ? as_type<int>(_2408) : as_type<int>(_199);
    int _2412 = _2378 * int(_2362);
    int _2414 = _2412 + _2282;
    float _2416 = as_type<float>(_2316) * _2402;
    bool _2418 = !_1884;
    float _2420 = _2418 ? _199 : as_type<float>(_2410);
    float _2422 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2424 = float(uint(_2414));
    float _2426 = as_type<float>(_2270) * _2400;
    float _2428 = -_195;
    int _2430 = _2070 ? as_type<int>(_2428) : as_type<int>(_195);
    float _2432 = trunc(_2416);
    float _2434 = precise::max(_2432, 0.0);
    uint _2436 = uint(_2434);
    float _2438 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2266);
    float _2440 = as_type<float>(_2302) * _2424;
    bool _2442 = !_1888;
    float _2444 = _2442 ? _195 : as_type<float>(_2430);
    float _2446 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2448 = _2422 * _2246;
    float _2450 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2268);
    float _2452 = _2422 * _2248;
    float _2454 = trunc(_2426);
    float _2456 = precise::max(_2454, 0.0);
    uint _2458 = uint(_2456);
    float _2460 = fma(_2446, _2272, _2448);
    float _2462 = _2448;
    float _2464 = as_type<float>(_2436);
    if (_1035)
    {
        float _2466 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2468 = _1123 + _2466;
        _2462 = _2468;
    }
    float _2470 = _2462;
    float _2472 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2474 = _2406 + _2472;
    out.m_86.x = _2272;
    out.m_86.y = _2438;
    out.m_86.z = _2450;
    if (_1035)
    {
        float _2476 = _2470 * _2470;
        _1059 = _2476;
    }
    float _2478 = _1059;
    int _2480 = int(_2278) + int(_2398);
    float _2482 = trunc(_2440);
    float _2484 = precise::max(_2482, 0.0);
    uint _2486 = uint(_2484);
    float _2488 = _2422 * _2242;
    int _2490 = ~_2082;
    int _2492 = _2490 + 1;
    float _2494 = fma(_2474, _2474, _2166);
    bool _2496 = _2128 == 0;
    float _2498 = fma(_2446, _2438, _2488);
    float _2500 = fma(_2446, _2450, _2452);
    int _2502 = ~_2180;
    int _2504 = _2502 + 1;
    int _2506 = int(_2314) + int(_2458);
    int _2508 = ~_2128;
    int _2510 = _2508 + 1;
    int _2512 = int(_2340) + int(_2436);
    int _2514 = int(_2362) + int(_2486);
    int _2516 = _2492 * _2480;
    int _2518 = _2516 + _2208;
    int _2520 = ~_2218;
    int _2522 = _2520 + 1;
    int _2524 = _2504 * _2512;
    int _2526 = _2524 + _2260;
    float _2528 = _2494 + _2478;
    int _2530 = _2510 * _2506;
    int _2532 = _2530 + _2264;
    bool _2534 = uint(_2518) >= uint(_2082);
    int _2536 = _2522 * _2514;
    int _2538 = _2536 + _2282;
    float _2540 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2542 = uint(_2526) >= uint(_2180);
    bool _2544 = uint(_2532) >= uint(_2128);
    bool _2546 = !_2534;
    int _2548 = _2546 ? 0 : (-1);
    bool _2550 = !_2544;
    int _2552 = _2550 ? 0 : (-1);
    float _2554 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2556 = ~_2480;
    int _2558 = _2556 + _2548;
    int _2560 = _2558 + 1;
    bool _2562 = uint(_2538) >= uint(_2218);
    int _2564 = ~_2506;
    int _2566 = _2564 + _2552;
    int _2568 = _2566 + 1;
    int _2570 = _2082 * _2560;
    int _2572 = _2570 + _2208;
    int _2574 = _2208 ^ _2082;
    float _2576 = sqrt(_2528);
    bool _2578 = !_2562;
    int _2580 = _2578 ? 0 : (-1);
    int _2582 = _2128 * _2568;
    int _2584 = _2582 + _2264;
    bool _2586 = !_2542;
    int _2588 = _2586 ? 0 : (-1);
    uint _2590 = uint(int(uint(_2574) >> uint(31)));
    bool _2592 = _2082 == 0;
    float _2594 = _2554 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2596 = _2082 == 0;
    float _2598 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2600 = _2264 ^ _2128;
    int _2602 = ~_2580;
    int _2604 = _2514 + _2602;
    int _2606 = _2604 + 1;
    int _2608 = ~_2588;
    int _2610 = _2512 + _2608;
    int _2612 = _2610 + 1;
    float _2614 = fma(_2422, _2422, 1.0);
    int _2616 = ~int(_2590);
    int _2618 = _2616 + 1;
    float _2620 = _2540 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2622 = !_2592;
    int _2624 = _2622 ? _2572 : (-1);
    float _2626 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _2628 = uint(int(uint(_2600) >> uint(31)));
    int _2630 = _2612 ^ _2618;
    float _2632 = float(_2624);
    int _2634 = ~int(_2628);
    int _2636 = _2634 + 1;
    int _2638 = ~_2618;
    int _2640 = _2638 + _2630;
    int _2642 = _2640 + 1;
    float _2644 = fma(_2620, _2632, _605);
    bool _2646 = !_2324;
    int _2648 = _2646 ? _2584 : (-1);
    float _2650 = rsqrt(_2614);
    int _2652 = _2606 ^ _2636;
    float _2654 = float(_2648);
    float _2656 = _2598 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2658 = ~_2636;
    int _2660 = _2658 + _2652;
    int _2662 = _2660 + 1;
    float _2664 = _2322 + 0.5;
    bool _2666 = !_2596;
    int _2668 = _2666 ? _2642 : (-1);
    float _2670 = fma(_2656, _2654, _691);
    bool _2672 = !_2496;
    int _2674 = _2672 ? _2662 : (-1);
    float _2676 = fma(_2620, _2664, _2644);
    float _2678 = float(_2668);
    float _2680 = _2444 + 0.5;
    float _2682 = float(_2674);
    float _2684 = _2626 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2686 = -_1155;
    float _2688 = fma(_2322, _2686, _2676);
    float _2690 = -_677;
    float _2692 = fma(_2594, _2678, _2690);
    float _2694 = _2420 + (-0.5);
    float _2696 = fma(_2656, _2680, _2670);
    float _2698 = _2422 * _2650;
    float _2700 = -_693;
    float _2702 = fma(_2684, _2682, _2700);
    float _2704 = _2308 + (-0.5);
    float _2706 = -_2594;
    float _2708 = fma(_2706, _2694, _2692);
    float _2710 = -_2346;
    float _2712 = _2698 * _2710;
    float _2714 = -_2350;
    float _2716 = _2698 * _2714;
    float _2718 = -_2352;
    float _2720 = _2698 * _2718;
    float _2722 = -_2684;
    float _2724 = fma(_2722, _2704, _2702);
    float _2726 = fma(_2650, _2242, _2712);
    float _2728 = fma(_2650, _2246, _2716);
    float _2730 = -_1151;
    float _2732 = fma(_2444, _2730, _2696);
    float _2734 = fma(_2650, _2248, _2720);
    float _2736 = _2350 + _2460;
    float _2738 = fma(_2420, _1165, _2708);
    float _2740 = fma(_2308, _1175, _2724);
    float _2742 = _2346 + _2498;
    float _2744 = _2352 + _2500;
    out.m_88.x = _2728;
    out.m_88.y = _2726;
    out.m_88.z = _2734;
    bool _2746 = _2576 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2748 = isnan(_2576);
    bool _2750 = _2746 || _2748;
    bool _2752 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2754 = _2750 || _2752;
    out.m_90.x = _2688;
    out.m_90.y = _2738;
    out.m_90.z = _2732;
    out.m_90.w = _2740;
    out.m_92.x = _1133;
    out.m_92.y = _1135;
    out.m_92.z = _1137;
    out.m_94.x = _2736;
    out.m_94.y = _2742;
    out.m_94.z = _2744;
    float _2756 = as_type<float>(_2522);
    float _2758 = _2614;
    float _2760 = as_type<float>(_2636);
    if (!_2754)
    {
        _1213 = 1.0;
    }
    float _2762 = _1213;
    bool _2764 = !_2754;
    float _2766 = _2762;
    if (!_2764)
    {
        bool _2768 = _2576 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2770 = isnan(_2576);
        bool _2772 = _2768 || _2770;
        bool _2774 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2776 = _2772 || _2774;
        if (!_2776)
        {
            float _2778 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2780 = _2576 + _2778;
            float _2782 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2784 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2782;
            float _2786 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2788 = _2786 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2790 = 1.0 / _2784;
            float _2792 = _2780 * _2790;
            float _2794 = fma(_2792, _2788, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2766 = _2794;
            _2796 = true;
        }
        else
        {
            bool _2798 = _2576 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2800 = isnan(_2576);
            bool _2802 = _2798 || _2800;
            bool _2804 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2806 = _2802 || _2804;
            if (!_2806)
            {
                float _2808 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2810 = _2576 + _2808;
                float _2812 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2814 = _2812 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2816 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2818 = _2816 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2820 = 1.0 / _2814;
                float _2822 = _2810 * _2820;
                float _2824 = fma(_2822, _2818, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2766 = _2824;
                _2796 = true;
            }
            else
            {
                _2766 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2796 = false;
    float _2826 = _2766;
    float _2828 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2830 = _2406 + _2828;
    float _2832 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2834 = _1119 + _2832;
    float _2836 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2838 = _1123 + _2836;
    float _2840 = fma(_2830, _2826, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2842 = fma(_2834, _2826, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2844 = fma(_2838, _2826, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2846 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2848 = _2840 + _2846;
    float _2850 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2852 = _2842 + _2850;
    float _2854 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2856 = _2844 + _2854;
    float _2858 = _2848 * _2848;
    float _2860 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2862 = fma(_2852, _2852, _2858);
    float _2864 = _1083 + _2860;
    float _2866 = fma(_2856, _2856, _2862);
    float _2868 = _1083 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2870 = rsqrt(_2866);
    float _2872 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2868);
    float _2874 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2872);
    float _2876 = sqrt(_2866);
    float _2878 = _2874 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2880 = _2870 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2882 = _1083 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2884 = _2852 * _2880;
    float _2886 = _2856 * _2880;
    float _2888 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2882);
    float _2890 = _2884 * _2884;
    float _2892 = _2886 * _2886;
    float _2894 = 1.0 / _2878;
    float _2896 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2888);
    float _2898 = _2890 + _2892;
    float _2900 = _2896 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2902 = sqrt(_2898);
    float _2904 = _2900 + _2878;
    float _2906 = _2864 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2908 = _2904 * _2894;
    float _2910 = _2908 * 0.5;
    float _2912 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2914 = fma(_2910, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2912);
    float _2916 = fma(_993, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2918 = _2864 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    bool _2920 = _2902 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2922 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2924 = _2902 + _2922;
    float _2926 = 1.0 / _2914;
    float _2928 = fma(_993, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2918);
    float _2930 = fma(_995, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2928);
    float _2932 = floor(_2916);
    float _2934 = _2930 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2936 = _1135;
    int _2938 = 2;
    float _2940 = _2880;
    float _2942 = _2884;
    float _2944 = _2890;
    if (_2920)
    {
        float _2946 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2936 = _2946;
    }
    float _2948 = _2936;
    float _2950 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2952 = _2926 * _2950;
    float _2954 = fma(_993, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2906);
    bool _2956 = _2952 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2958 = fma(_995, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2954);
    bool _2960 = _2952 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2962 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2964 = trunc(_2934);
    int _2966 = int(_2964);
    float _2968 = _2958 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2970 = -_2932;
    float _2972 = _2916 + _2970;
    float _2974 = precise::max(0.0, _2962);
    float _2976 = _2958;
    if (_2920)
    {
        float _2978 = _2924 * _2948;
        _2976 = _2978;
    }
    float _2980 = _2976;
    float _2982 = trunc(_2968);
    int _2984 = int(_2982);
    if (!_2956)
    {
        _2938 = 1;
    }
    int _2986 = _2938;
    int _2988 = _2986;
    if (_2920)
    {
        float _2990 = _2980 * 0.15915493667125701904296875;
        _2756 = _2990;
    }
    float _2992 = _2756;
    bool _2994 = !_2956;
    int _2996 = _2994 ? 0 : 1;
    float _2998 = -_2880;
    float _3000 = -_2974;
    float _3002 = fma(_2848, _2998, _3000);
    if (!_2960)
    {
        _2988 = _2996;
    }
    int _3004 = _2988;
    float _3006 = _2930;
    if (_2920)
    {
        float _3008 = _2992 * 6.283185482025146484375;
        float _3010 = sin(_3008);
        _3006 = _3010;
    }
    float _3012 = _3006;
    if (_2920)
    {
        float _3014 = _3002 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2940 = _3014;
    }
    float _3016 = _2940;
    int _3018 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _3020 = _2966 + _3018;
    int _3022 = _3020 + 1;
    int _3024 = _3004 << 6;
    int _3026 = _3024 + 96;
    uint _3028 = uint(int(uint(_3026) >> uint(2)));
    uint _3030 = uint(int(uint(int(_3028)) >> uint(2)));
    int _3032 = int(_3028) & 3;
    float _3034 = (*spvDescriptorSet0.vp_c15)._m0[int(_3030)][_3032];
    int _3036 = int(_3028) + 1;
    uint _3038 = uint(int(uint(_3036) >> uint(2)));
    int _3040 = _3036 & 3;
    float _3042 = (*spvDescriptorSet0.vp_c15)._m0[int(_3038)][_3040];
    int _3044 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3046 = _2984 + _3044;
    int _3048 = _3046 + 1;
    float _3050 = _2898;
    int _3052 = _3048;
    if (_2920)
    {
        float _3054 = rsqrt(_2898);
        _3050 = _3054;
    }
    float _3056 = _3050;
    bool _3058 = _3022 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _3060 = fma(_995, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    int _3062 = _3022 | _3048;
    int _3064 = _3024 + 48;
    uint _3066 = uint(int(uint(_3064) >> uint(2)));
    uint _3068 = uint(int(uint(int(_3066)) >> uint(2)));
    int _3070 = int(_3066) & 3;
    float _3072 = (*spvDescriptorSet0.vp_c15)._m0[int(_3068)][_3070];
    int _3074 = int(_3066) + 1;
    uint _3076 = uint(int(uint(_3074) >> uint(2)));
    int _3078 = _3074 & 3;
    float _3080 = (*spvDescriptorSet0.vp_c15)._m0[int(_3076)][_3078];
    if (_2920)
    {
        float _3082 = fma(_3012, _3016, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2758 = _3082;
    }
    float _3084 = _2758;
    float _3086 = _2992;
    float _3088 = _3084;
    if (_2920)
    {
        float _3090 = _2992 * 6.283185482025146484375;
        float _3092 = cos(_3090);
        _3086 = _3092;
    }
    float _3094 = _3086;
    bool _3096 = _3062 < 0;
    bool _3098 = _3096 || _3058;
    float _3100 = _2840 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _3102 = _3048 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3104 = _3102 || _3098;
    int _3106 = _3024 + 104;
    uint _3108 = uint(int(uint(_3106) >> uint(2)));
    uint _3110 = uint(int(uint(int(_3108)) >> uint(2)));
    int _3112 = int(_3108) & 3;
    float _3114 = (*spvDescriptorSet0.vp_c15)._m0[int(_3110)][_3112];
    int _3116 = int(_3108) + 1;
    uint _3118 = uint(int(uint(_3116) >> uint(2)));
    int _3120 = _3116 & 3;
    float _3122 = (*spvDescriptorSet0.vp_c15)._m0[int(_3118)][_3120];
    float _3124 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3100);
    float _3126 = floor(_3060);
    float _3128 = _3056;
    if (_2920)
    {
        float _3130 = _3056 * _3084;
        _2464 = _3130;
    }
    float _3132 = _2464;
    if (!_2920)
    {
        _3088 = _3002;
    }
    float _3134 = _3088;
    float _3136 = fma(_2844, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3124);
    float _3138 = _3134;
    if (_2920)
    {
        float _3140 = _2884 * _3132;
        _2942 = _3140;
    }
    float _3142 = _2942;
    int _3144 = _3024 + 64;
    uint _3146 = uint(int(uint(_3144) >> uint(2)));
    uint _3148 = uint(int(uint(int(_3146)) >> uint(2)));
    int _3150 = int(_3146) & 3;
    float _3152 = (*spvDescriptorSet0.vp_c15)._m0[int(_3148)][_3150];
    int _3154 = int(_3146) + 1;
    uint _3156 = uint(int(uint(_3154) >> uint(2)));
    int _3158 = _3154 & 3;
    float _3160 = (*spvDescriptorSet0.vp_c15)._m0[int(_3156)][_3158];
    float _3162 = _3094;
    if (_2920)
    {
        float _3164 = _3094 + (-1.0);
        _3128 = _3164;
    }
    float _3166 = _3128;
    float _3168 = _3166;
    if (_2920)
    {
        float _3170 = _3142 * _3142;
        _2944 = _3170;
    }
    float _3172 = _2944;
    if (!_3104)
    {
        float _3174 = floor(_2968);
        _2760 = _3174;
    }
    float _3176 = _2760;
    if (_2920)
    {
        float _3178 = _3166 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1143 = _3178;
    }
    float _3180 = _1143;
    if (!_2920)
    {
        _3168 = _2886;
    }
    float _3182 = _3168;
    int _3184 = _3024 + 80;
    uint _3186 = uint(int(uint(_3184) >> uint(2)));
    uint _3188 = uint(int(uint(int(_3186)) >> uint(2)));
    int _3190 = int(_3186) & 3;
    float _3192 = (*spvDescriptorSet0.vp_c15)._m0[int(_3188)][_3190];
    int _3194 = int(_3186) + 1;
    uint _3196 = uint(int(uint(_3194) >> uint(2)));
    int _3198 = _3194 & 3;
    float _3200 = (*spvDescriptorSet0.vp_c15)._m0[int(_3196)][_3198];
    float _3202 = _3182;
    if (_2920)
    {
        float _3204 = _2886 * _3132;
        _3202 = _3204;
    }
    float _3206 = _3202;
    float _3208 = _3136 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (_2920)
    {
        float _3210 = fma(_3002, _3094, _3180);
        _3138 = _3210;
    }
    float _3212 = _3138;
    if (!_2920)
    {
        _3162 = _2892;
    }
    float _3214 = _3162;
    float _3216 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3218 = _3208 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3220 = -_3126;
    float _3222 = _3060 + _3220;
    int _3224 = _3024 + 56;
    uint _3226 = uint(int(uint(_3224) >> uint(2)));
    uint _3228 = uint(int(uint(int(_3226)) >> uint(2)));
    int _3230 = int(_3226) & 3;
    float _3232 = (*spvDescriptorSet0.vp_c15)._m0[int(_3228)][_3230];
    int _3234 = int(_3226) + 1;
    uint _3236 = uint(int(uint(_3234) >> uint(2)));
    int _3238 = _3234 & 3;
    float _3240 = (*spvDescriptorSet0.vp_c15)._m0[int(_3236)][_3238];
    float _3242 = _3214;
    int _3244 = as_type<int>(_3218);
    if (_2920)
    {
        float _3246 = _3206 * _3206;
        _3242 = _3246;
    }
    float _3248 = _3242;
    float _3250 = fma(_3212, _3212, _3172);
    float _3252 = -_3218;
    float _3254 = fma(_3252, _3216, 1.0);
    if (!_3104)
    {
        int _3256 = _3048 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3258 = _3256 + _3022;
        _3244 = _3258;
    }
    int _3260 = _3244;
    float _3262 = _3250 + _3248;
    int _3264 = _3024 + 72;
    uint _3266 = uint(int(uint(_3264) >> uint(2)));
    uint _3268 = uint(int(uint(int(_3266)) >> uint(2)));
    int _3270 = int(_3266) & 3;
    float _3272 = (*spvDescriptorSet0.vp_c15)._m0[int(_3268)][_3270];
    int _3274 = int(_3266) + 1;
    uint _3276 = uint(int(uint(_3274) >> uint(2)));
    int _3278 = _3274 & 3;
    float _3280 = (*spvDescriptorSet0.vp_c15)._m0[int(_3276)][_3278];
    float _3282 = _2864 * _3042;
    float _3284 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3286 = fma(_2876, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3284);
    float _3288 = precise::clamp(_3286, 0.0, 1.0);
    int _3290 = as_type<int>(_3034);
    if (!_3104)
    {
        int _3292 = _3260 << 2;
        _3052 = _3292;
    }
    int _3294 = _3052;
    float _3296 = log2(_3254);
    float _3298 = fma(_993, _3034, _3282);
    int _3300 = _3294;
    if (!_3104)
    {
        int _3302 = 12 & _3294;
        _3300 = _3302;
    }
    int _3304 = _3300;
    int _3306 = _3024 + 88;
    uint _3308 = uint(int(uint(_3306) >> uint(2)));
    uint _3310 = uint(int(uint(int(_3308)) >> uint(2)));
    int _3312 = int(_3308) & 3;
    float _3314 = (*spvDescriptorSet0.vp_c15)._m0[int(_3310)][_3312];
    int _3316 = int(_3308) + 1;
    uint _3318 = uint(int(uint(_3316) >> uint(2)));
    int _3320 = _3316 & 3;
    float _3322 = (*spvDescriptorSet0.vp_c15)._m0[int(_3318)][_3320];
    float _3324 = _2864 * _3080;
    float _3326 = fma(_993, _3072, _3324);
    int _3328 = as_type<int>(_3324);
    if (!_3104)
    {
        uint _3330 = uint(int(uint(_3260) >> uint(2)));
        _3328 = int(_3330);
    }
    int _3332 = _3328;
    float _3334 = fma(_995, _3114, _3298);
    if (!_3104)
    {
        int _3336 = _3332 << 4;
        int _3338 = _3336 + _3304;
        _3290 = _3338;
    }
    int _3340 = _3290;
    float _3342 = _3334 + _3122;
    float _3344 = _2840 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3346 = _3296 * 0.693147182464599609375;
    float _3348 = _2864 * _3160;
    float _3350 = _3160;
    if (!_3104)
    {
        float _3352 = -_3176;
        float _3354 = _2968 + _3352;
        _3350 = _3354;
    }
    float _3356 = _3350;
    float _3358 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3344);
    float _3360 = rsqrt(_3262);
    float _3362 = fma(_993, _3152, _3348);
    float _3364 = _2864 * _3200;
    float _3366 = fma(_993, _3192, _3364);
    float _3368 = -_3288;
    float _3370 = _3368 + 1.0;
    float2 _9120 = float2(_2972, _3222);
    float _3372 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9120, float2(0.0), isnan(_9120)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9120, float2(0.0), isnan(_9120)), level(0.0)).x;
    float _3374 = fma(_995, _3232, _3326);
    float _3376 = _3346 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3378 = 1.0 / _3342;
    float _3380 = _3360 * _3142;
    float _3382 = _3374 + _3240;
    float _3384 = _3360 * _3212;
    float _3386 = _3360 * _3206;
    float _3388 = _3380 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3390 = fma(_995, _3272, _3362);
    float _3392 = _2840 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3394 = abs(_3370);
    float _3396 = log2(_3394);
    float _3398 = fma(_2844, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3358);
    float _3400 = _3390 + _3280;
    float _3402 = _2840 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3404 = -_3388;
    float _3406 = fma(_3384, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3404);
    float _3408 = _3398 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3410 = fma(_995, _3314, _3366);
    float _3412 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3402);
    float _3414 = _3382 * _3378;
    float _3416 = _3400 * _3378;
    float _3418 = -_3386;
    float _3420 = fma(_3418, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3406);
    float _3422 = fma(_2844, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3412);
    float _3424 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3392);
    bool _3426 = _3414 >= 0.0;
    float _3428 = _3408 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3430 = _3422 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3432 = _3396 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _3434 = _3414 <= 1.0;
    bool _3436 = _3434 && _3426;
    float _3438 = fma(_3420, 0.5, 0.5);
    float _3440 = fma(_2844, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3424);
    float _3442 = exp2(_3432);
    bool _3444 = _3416 >= 0.0;
    bool _3446 = _3444 && _3436;
    float _3448 = fma(_3430, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3428);
    float _3450 = fma(_3420, -0.5, 0.5);
    float _3452 = _3388;
    if (!_3104)
    {
        int _3454 = _3340 + 400;
        uint _3456 = uint(int(uint(_3454) >> uint(2)));
        uint _3458 = uint(int(uint(int(_3456)) >> uint(2)));
        int _3460 = int(_3456) & 3;
        float _3462 = (*spvDescriptorSet0.vp_c15)._m0[int(_3458)][_3460];
        _3452 = _3462;
    }
    float _3464 = _3452;
    bool _3466 = _3416 <= 1.0;
    bool _3468 = _3466 && _3446;
    float _3470 = _3440 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3472 = fma(_3208, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3448);
    float _3474 = _3384 + 1.0;
    float _3476 = sqrt(_3450);
    float _3478 = _3410 + _3322;
    float _3480 = fma(_3470, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3472);
    float _3482 = fma(_3438, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3484 = _3408 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3486 = _3408 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3488 = fma(_3438, _3482, -0.212114393711090087890625);
    float _3490 = -_3384;
    float _3492 = fma(_3442, _3474, _3490);
    float _3494 = _3386;
    float _3496 = _3472;
    float _3498 = _3474;
    if (!_3104)
    {
        float _3500 = floor(_2934);
        _3494 = _3500;
    }
    float _3502 = _3494;
    if (_3468)
    {
        float _3504 = float(_3004);
        _3496 = _3504;
    }
    float _3506 = _3496;
    float _3508 = fma(_3438, _3488, 1.570728778839111328125);
    float _3510 = fma(_3430, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3484);
    float _3512 = fma(_3430, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3486);
    float _3514 = _3478 * _3378;
    float _3516 = fma(_3208, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3510);
    float _3518 = 1.0 / _3480;
    float _3520 = fma(_3208, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3512);
    float _3522 = _3476 * 0.636619746685028076171875;
    float _3524 = fma(_3470, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3516);
    float _3526 = fma(_3470, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3520);
    float _3528 = -_3508;
    float _3530 = fma(_3522, _3528, 1.0);
    float _3532 = _3510;
    if (_3468)
    {
        float _3534 = rint(_3506);
        float _3536 = precise::max(_3534, 0.0);
        uint _3538 = uint(_3536);
        uint _3540 = clamp(_3538, 0u, 65535u);
        _3532 = as_type<float>(_3540);
    }
    float _3542 = _3532;
    if (!_3104)
    {
        float _3544 = -_3502;
        float _3546 = _2934 + _3544;
        _3498 = _3546;
    }
    float _3548 = _3498;
    float _3550 = _3524 * _3518;
    float _3552 = _3526 * _3518;
    float _3554 = fma(_3492, 0.5, 0.5);
    float _3556 = fma(_3550, 0.5, 0.5);
    float _3558 = fma(_3552, -0.5, 0.5);
    float _3560 = _3542;
    if (_3468)
    {
        float3 _9446 = float3(_3414, _3416, float(as_type<int>(_3542)));
        float3 _9450 = select(_9446, float3(0.0), isnan(_9446));
        float _3562 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9450.xy, uint(rint(_9450.z)), _3514, level(0.0));
        _3560 = _3562;
    }
    float _3564 = _3560;
    float3 _9460 = float3(_3556, _3558, _3376);
    float _3566 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9460, float3(0.0), isnan(_9460)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9460, float3(0.0), isnan(_9460)), level(0.0)).x;
    float3 _9469 = float3(_3556, _3558, _3376);
    float4 _3569 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9469, float3(0.0), isnan(_9469)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9469, float3(0.0), isnan(_9469)), level(0.0)).xyzw;
    float _3571 = _3569.x;
    float _3573 = _3569.y;
    float _3575 = _3569.z;
    float _3577 = _3569.w;
    float2 _9485 = float2(_3530, _3554);
    float3 _3579 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9485, float2(0.0), isnan(_9485)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9485, float2(0.0), isnan(_9485)), level(0.0)).xyz;
    float _3581 = _3579.x;
    float _3583 = _3579.y;
    float _3585 = _3579.z;
    float _3587 = _3378;
    if (!_3104)
    {
        float _3589 = rint(_3464);
        float _3591 = precise::max(_3589, 0.0);
        uint _3593 = uint(_3591);
        uint _3595 = clamp(_3593, 0u, 65535u);
        _3587 = as_type<float>(_3595);
    }
    float _3597 = _3587;
    float _3599 = _3597;
    if (!_3104)
    {
        float3 _9522 = float3(_3548, _3356, float(as_type<int>(_3597)));
        float3 _9524 = select(_9522, float3(0.0), isnan(_9522));
        float _3601 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9524.xy, uint(rint(_9524.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9524.xy, uint(rint(_9524.z)), level(0.0)).x;
        _3599 = _3601;
    }
    float _3603 = _3599;
    float _3605 = abs(_2952);
    float _3607 = log2(_3605);
    float _3609 = _3408 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3611 = fma(_3430, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3609);
    float _3613 = fma(_3208, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3611);
    bool _3615 = _2952 <= 8000.0;
    bool _3617 = isnan(_2952);
    bool _3619 = _3615 || _3617;
    bool _3621 = isnan(8000.0);
    bool _3623 = _3619 || _3621;
    float _3625 = float(_3623);
    float _3627 = fma(_3470, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3613);
    float _3629 = _3396 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3631 = _3607 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3633 = exp2(_3629);
    out.gl_Position.x = _3524;
    out.gl_Position.y = _3526;
    out.gl_Position.z = _3627;
    out.gl_Position.w = _3480;
    float _3635 = exp2(_3631);
    float _3637 = fma(_3635, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3639 = precise::clamp(_3637, 0.0, 1.0);
    float _3641 = fma(_3639, -2.0, 3.0);
    float _3643 = _3639 * _3639;
    float _3645 = _3643 * _3641;
    float _3647 = _3627 + _3480;
    float _3649 = _3647 * 0.5;
    float _3651 = -_3645;
    float _3653 = _3651 + 1.0;
    out.m_96.z = _3649;
    out.m_96.w = _3480;
    float _3655 = fma(_3653, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3645);
    float _3657 = _3625 * _3655;
    float _3659 = _3625;
    float _3661 = _3627;
    float _3663 = _3524;
    if (!_3468)
    {
        _3659 = 1.0;
    }
    float _3665 = _3659;
    float _3667 = _3657 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3669 = -_3633;
    float _3671 = _3669 + 1.0;
    float _3673 = _3671 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3675 = _3671;
    float _3677 = _3665;
    if (_3104)
    {
        _3675 = 1.0;
    }
    float _3679 = _3675;
    float _3681 = -_3372;
    float _3683 = _3681 + 1.0;
    float _3685 = _3683 * _3667;
    float _3687 = precise::clamp(_3685, 0.0, 1.0);
    float _3689 = _3679;
    if (_3468)
    {
        bool _3691 = _3564 >= _3514;
        bool _3693 = isnan(_3564);
        bool _3695 = _3691 || _3693;
        bool _3697 = isnan(_3514);
        bool _3699 = _3695 || _3697;
        float _3701 = float(_3699);
        _3677 = _3701;
    }
    float _3703 = _3677;
    float _3705 = _3703;
    if (!_3104)
    {
        int _3707 = _3260 << 4;
        int _3709 = _3707 + 2048;
        uint _3711 = uint(int(uint(_3709) >> uint(2)));
        uint _3713 = uint(int(uint(int(_3711)) >> uint(2)));
        int _3715 = int(_3711) & 3;
        float _3717 = (*spvDescriptorSet0.vp_c15)._m0[int(_3713)][_3715];
        int _3719 = int(_3711) + 1;
        uint _3721 = uint(int(uint(_3719) >> uint(2)));
        int _3723 = _3719 & 3;
        float _3725 = (*spvDescriptorSet0.vp_c15)._m0[int(_3721)][_3723];
        int _3727 = _3709 + 8;
        uint _3729 = uint(int(uint(_3727) >> uint(2)));
        uint _3731 = uint(int(uint(int(_3729)) >> uint(2)));
        int _3733 = int(_3729) & 3;
        float _3735 = (*spvDescriptorSet0.vp_c15)._m0[int(_3731)][_3733];
        int _3737 = int(_3729) + 1;
        uint _3739 = uint(int(uint(_3737) >> uint(2)));
        int _3741 = _3737 & 3;
        float _3743 = (*spvDescriptorSet0.vp_c15)._m0[int(_3739)][_3741];
        float _3745 = _2864 * _3725;
        float _3747 = fma(_993, _3717, _3745);
        float _3749 = fma(_995, _3735, _3747);
        float _3751 = _3749 + _3743;
        float _3753 = precise::clamp(_3751, 0.0, 1.0);
        float _3755 = -_3753;
        float _3757 = _3755 + _3603;
        float _3759 = fma(_3757, 500.0, 1.5);
        float _3761 = exp2(_3759);
        float _3763 = 0.0 + _3761;
        float _3765 = precise::clamp(_3763, 0.0, 1.0);
        _3689 = _3765;
        _3661 = _3735;
    }
    float _3767 = _3689;
    float _3769 = _3661;
    float _3771 = _3703 * _3767;
    float _3773 = -_3687;
    float _3775 = fma(_3773, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3777 = _3673 * _3566;
    out.m_98.x = _2842;
    out.m_98.y = _2840;
    out.m_98.z = _2844;
    bool _3779 = _2876 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3781 = isnan(_2876);
    bool _3783 = _3779 || _3781;
    bool _3785 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3787 = _3783 || _3785;
    float _3789 = -_3771;
    float _3791 = fma(_3789, _3775, 1.0);
    float _3793 = precise::clamp(_3791, 0.0, 1.0);
    float _3795 = _3577 * _3777;
    float _3797 = -_3673;
    float _3799 = _3797 + 1.0;
    float _3801 = _3585 * _3777;
    float _3803 = _3793 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3805 = fma(_3581, _3795, _3571);
    float _3807 = fma(_3583, _3795, _3573);
    float _3809 = _3577 * _3799;
    float _3811 = fma(_3577, _3801, _3575);
    out.m_100.x = _3803;
    float _3813 = _3769;
    float _3815 = _3795;
    float _3817 = _3799;
    float _3819 = _3793;
    if (!_3787)
    {
        _3813 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3821 = _3813;
    out.m_102.x = _3805;
    out.m_102.y = _3807;
    out.m_102.z = _3811;
    out.m_102.w = _3809;
    float _3823 = _3821;
    float _3825 = _3821;
    if (!_3787)
    {
        _3705 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3827 = _3705;
    float _3829 = _3827;
    float _3831 = _3827;
    if (!_3787)
    {
        _3663 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3833 = _3663;
    float _3835 = _3833;
    float _3837 = _3833;
    if (!_3787)
    {
        _3815 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3839 = _3815;
    float _3841 = _3839;
    float _3843 = _3839;
    if (!_3787)
    {
        _3817 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3845 = _3817;
    float _3847 = _3845;
    float _3849 = _3845;
    if (!_3787)
    {
        _3819 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3851 = _3819;
    bool _3853 = !_3787;
    float _3855 = _3851;
    float _3857 = _3851;
    if (!_3853)
    {
        bool _3859 = _2876 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3861 = isnan(_2876);
        bool _3863 = _3859 || _3861;
        bool _3865 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3867 = _3863 || _3865;
        if (!_3867)
        {
            float _3869 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3871 = _2876 + _3869;
            float _3873 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3875 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3873;
            float _3877 = 1.0 / _3875;
            float _3879 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3881 = _3879 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3883 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3885 = _3883 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3887 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3889 = _3887 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3891 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3893 = _3891 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3895 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3897 = _3895 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3899 = _3871 * _3877;
            float _3901 = precise::clamp(_3899, 0.0, 1.0);
            float _3903 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3905 = _3903 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3907 = fma(_3901, _3881, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3909 = fma(_3901, _3905, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3911 = fma(_3901, _3885, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3913 = fma(_3901, _3889, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3915 = fma(_3901, _3893, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3917 = fma(_3901, _3897, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3831 = _3909;
            _3849 = _3915;
            _3825 = _3907;
            _3843 = _3913;
            _3837 = _3911;
            _3857 = _3917;
            _3919 = true;
        }
        else
        {
            bool _3921 = _2876 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3923 = isnan(_2876);
            bool _3925 = _3921 || _3923;
            bool _3927 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3929 = _3925 || _3927;
            if (!_3929)
            {
                _3823 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3931 = _3823;
            _3825 = _3931;
            if (!_3929)
            {
                _3829 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3933 = _3829;
            _3831 = _3933;
            if (!_3929)
            {
                _3835 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3935 = _3835;
            _3837 = _3935;
            if (!_3929)
            {
                _3841 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3937 = _3841;
            _3843 = _3937;
            if (!_3929)
            {
                _3847 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3939 = _3847;
            _3849 = _3939;
            if (!_3929)
            {
                _3855 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3941 = _3855;
            bool _3943 = !_3929;
            _3857 = _3941;
            if (!_3943)
            {
                bool _3945 = _2876 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3947 = isnan(_2876);
                bool _3949 = _3945 || _3947;
                bool _3951 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3953 = _3949 || _3951;
                if (!_3953)
                {
                    float _3955 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3957 = _2876 + _3955;
                    float _3959 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3961 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3959;
                    float _3963 = 1.0 / _3961;
                    float _3965 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3967 = _3965 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3969 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3971 = _3969 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3973 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3975 = _3973 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3977 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3979 = _3977 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3981 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3983 = _3981 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3985 = _3957 * _3963;
                    float _3987 = precise::clamp(_3985, 0.0, 1.0);
                    float _3989 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3991 = _3989 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3993 = fma(_3987, _3967, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3995 = fma(_3987, _3991, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3997 = fma(_3987, _3971, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3999 = fma(_3987, _3975, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4001 = fma(_3987, _3979, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4003 = fma(_3987, _3983, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3831 = _3995;
                    _3849 = _4001;
                    _3825 = _3993;
                    _3843 = _3999;
                    _3837 = _3997;
                    _3857 = _4003;
                    _3919 = true;
                }
                else
                {
                    _3831 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3849 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3825 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3843 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3837 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3857 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3919 = false;
    float _4005 = _3831;
    float _4007 = _3849;
    float _4009 = _3825;
    float _4011 = _3843;
    float _4013 = _3837;
    float _4015 = _3857;
    float _4017 = fma(_2742, -0.5, 0.5);
    float _4019 = precise::clamp(_4017, 0.0, 1.0);
    float _4021 = -_4005;
    float _4023 = _4021 + _4007;
    float _4025 = -_4009;
    float _4027 = _4025 + _4011;
    float _4029 = -_4013;
    float _4031 = _4029 + _4015;
    bool _4033 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4035 = fma(_4019, _4023, _4005);
    float _4037 = fma(_4019, _4027, _4009);
    float _4039 = fma(_4019, _4031, _4013);
    float _4041 = _4035 * 0.586610972881317138671875;
    out.m_104.x = 0.0;
    float _4043 = fma(_4037, 0.298911988735198974609375, _4041);
    float _4045 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4047 = fma(_4039, 0.114477999508380889892578125, _4043);
    out.m_63.x = _4045;
    float _4049 = -_4047;
    float _4051 = _4037 + _4049;
    float _4053 = -_4047;
    float _4055 = _4035 + _4053;
    float _4057 = -_4047;
    float _4059 = _4039 + _4057;
    float _4061 = fma(_4051, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4047);
    float _4063 = fma(_4055, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4047);
    float _4065 = fma(_4059, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4047);
    out.m_106.x = _4061;
    out.m_106.y = _4063;
    out.m_106.z = _4065;
    if (!_4033)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4067 = -_2840;
    float _4069 = _4067 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4071 = -_2842;
    float _4073 = _4071 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4075 = -_2844;
    float _4077 = _4075 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4079 = _4069 * _4069;
    float _4081 = fma(_4073, _4073, _4079);
    float _4083 = fma(_4077, _4077, _4081);
    float _4085 = sqrt(_4083);
    float _4087 = rsqrt(_4083);
    float _4089 = -_4085;
    float _4091 = _4089 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4093 = _4091 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4095 = precise::clamp(_4093, 0.0, 1.0);
    float _4097 = _4073 * _4087;
    float _4099 = _4069 * _4087;
    float _4101 = abs(_4095);
    float _4103 = log2(_4101);
    float _4105 = _4077 * _4087;
    float _4107 = _4097 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4109 = _2742 * _4099;
    float _4111 = -_4099;
    float _4113 = -_4107;
    float _4115 = fma(_4111, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4113);
    float _4117 = fma(_2736, _4097, _4109);
    float _4119 = -_4105;
    float _4121 = fma(_4119, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4115);
    float _4123 = fma(_2744, _4105, _4117);
    float _4125 = precise::clamp(_4123, 0.0, 1.0);
    float _4127 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4129 = _4121 + _4127;
    float _4131 = _4103 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4133 = _4129 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4135 = precise::clamp(_4133, 0.0, 1.0);
    float _4137 = exp2(_4131);
    float _4139 = _4137 * _4135;
    float _4141 = _4125 * _4139;
    float _4143 = _4141 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4145 = _4141 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4147 = _4141 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_104.x = _4143;
    out.m_104.y = _4145;
    out.m_104.z = _4147;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

