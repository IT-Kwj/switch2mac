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
    float4 m_88 [[user(locn6)]];
    float4 m_94 [[user(locn7)]];
    float4 m_98 [[user(locn8)]];
    float4 m_86 [[user(locn9)]];
    float4 m_104 [[user(locn10)]];
    float4 m_92 [[user(locn11)]];
    float4 m_100 [[user(locn12)]];
    float4 m_102 [[user(locn13)]];
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
    bool _3975 = false;
    bool _2850 = false;
    bool _223 = false;
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
    float _133 = as_type<float>(_125);
    if (!_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _131;
    float _137 = _135;
    if (!_129)
    {
        out.m_63.x = 0.0;
    }
    int _139 = 0;
    if (!_129)
    {
        float _141 = _135 * 5.0;
        _139 = as_type<int>(_141);
    }
    int _143 = _139;
    int _145 = _143;
    if (!_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4262 = as_type<float>(_143);
        out.gl_Position.z = _4262;
    }
    if (!_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _147 = in.m_65.w;
    bool _149 = _147 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _151 = isnan(_147);
    bool _153 = _149 || _151;
    bool _155 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _157 = _153 || _155;
    float _159 = -_147;
    float _161 = _159 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _163 = 0.0;
    float _165 = _161;
    if (_157)
    {
        float _167 = float(_125);
        _163 = _167;
    }
    float _169 = _163;
    bool _171 = _161 >= _169;
    bool _173 = !_157;
    bool _175 = _171 || _173;
    if (_175)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _177 = _137;
    if (_175)
    {
        out.m_63.x = 0.0;
    }
    if (_175)
    {
        float _179 = _177 * 5.0;
        _145 = as_type<int>(_179);
    }
    int _181 = _145;
    if (_175)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4331 = as_type<float>(_181);
        out.gl_Position.z = _4331;
    }
    if (_175)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _183 = as_type<float>(int(gl_VertexIndex));
    bool _185 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _187 = as_type<int>(_183) & 1;
    bool _189 = _187 != 0;
    int _191 = as_type<int>(_183) & 2;
    bool _193 = _191 != 0;
    bool _195 = !_189;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_193;
    float _201 = _199 ? (-0.5) : 0.5;
    bool _203 = !_185;
    float _221;
    if (!_203)
    {
        float _205 = in.m_70.x;
        float _207 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _209 = _205 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _211 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[12].x, _161);
        float _213 = _211 * _207;
        float _215 = floor(_213);
        float _217 = -_215;
        float _219 = _213 + _217;
        _221 = _219;
        _223 = true;
    }
    else
    {
        float _225 = float(_125);
        float _227 = 1.0 / _225;
        float _229 = _161 * _227;
        _221 = _229;
    }
    _223 = false;
    float _231 = _221;
    float _233 = in.m_70.x;
    float _235 = in.m_70.y;
    float _237 = in.m_70.z;
    float _239 = in.m_70.w;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _243 = _231 + _241;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _247 = _231 + _245;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _249;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _255 = _253 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _257;
    float _261 = 1.0 / _251;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _265 = _263 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _267;
    int _271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _273 = _271 != 0;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _277 = _231 + _275;
    float _279 = 1.0 / _255;
    float _281 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _283 = _231 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _285 = isnan(_231);
    bool _287 = _283 || _285;
    bool _289 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _291 = _287 || _289;
    float _293 = float(_291);
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _299 = _231 + _297;
    float _301 = 1.0 / _265;
    float _303 = _233 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _305 = _299 * _261;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _309 = _231 + _307;
    float _311 = -_281;
    float _313 = fma(_303, 2.0, _311);
    float _315 = _233 * 2.0;
    float _317 = 1.0 / _269;
    float _319 = _237 * 2.0;
    float _321 = _309 * _279;
    float _323 = _233 + _235;
    float _325 = _233 + (-0.5);
    float _327 = _323 + (-1.0);
    float _329 = 1.0 / _259;
    float _331 = _235 * 2.0;
    float _333 = _237 + _235;
    float _335 = _243 * _301;
    float _337 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _339 = _333 + (-1.0);
    bool _341 = _231 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _343 = isnan(_231);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = floor(_331);
    float _355 = _235 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _357 = _247 * _317;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _361 = fma(_355, -2.0, _295);
    float _363 = -_161;
    float _365 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[76].x, _313);
    float _367 = floor(_319);
    float _369 = _277 * _329;
    float _371 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _383 = float(_125);
    float _385 = fma(_375, _305, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _387 = floor(_315);
    bool _389 = _353 > 0.0;
    float _391 = fma(_379, _321, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _393 = _353 >= 0.0;
    bool _395 = isnan(_353);
    bool _397 = _393 || _395;
    bool _399 = isnan(0.0);
    bool _401 = _397 || _399;
    float _403 = fma(_161, (*spvDescriptorSet0.vp_c9)._m0[76].y, _361);
    bool _405 = _231 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _407 = isnan(_231);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = 1.0 / _383;
    float _419 = _237 + _233;
    bool _421 = _367 > 0.0;
    float _423 = -_415;
    float _425 = _423 + 1.0;
    bool _427 = _367 >= 0.0;
    bool _429 = isnan(_367);
    bool _431 = _427 || _429;
    bool _433 = isnan(0.0);
    bool _435 = _431 || _433;
    float _437 = _419 + (-1.0);
    bool _439 = _231 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _441 = isnan(_231);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _453 = _387 > 0.0;
    float _455 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _465 = _387 >= 0.0;
    bool _467 = isnan(_387);
    bool _469 = _465 || _467;
    bool _471 = isnan(0.0);
    bool _473 = _469 || _471;
    float _475 = -_293;
    float _477 = _475 + 1.0;
    float _479 = _449 * _425;
    float _481 = fma(_463, _321, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _483 = -_449;
    float _485 = _483 + 1.0;
    float _487 = _415 * _477;
    bool _489 = _231 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _491 = isnan(_231);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _503 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _501;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _505;
    bool _509 = _231 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _511 = isnan(_231);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    float _521 = fma(_459, _305, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _523 = -_499;
    float _525 = _523 + 1.0;
    float _527 = fma(_507, _369, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    int _529 = as_type<int>(_507);
    if (_273)
    {
        _529 = 0;
    }
    int _531 = _529;
    float _533 = -_351;
    float _535 = _533 + 1.0;
    int _537 = _531;
    if (!_273)
    {
        _537 = 1;
    }
    int _539 = _537;
    float _541 = fma(_503, _369, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    int _543 = _473 ? 0 : 1;
    float _545 = _519 * _525;
    bool _547 = _539 != 1;
    float _549 = _499 * _535;
    float _551 = _351 * _485;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _561 = _385 * _545;
    float _563 = _521 * _545;
    float _565 = fma(_555, _335, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    int _567 = _401 ? 0 : 1;
    float _569 = fma(_559, _335, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    int _571 = _435 ? 0 : 1;
    float _573 = -_519;
    float _575 = _573 + 1.0;
    int _577 = ~_567;
    int _579 = _577 + 1;
    int _581 = _579 + 1;
    float _583 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _585 = int(_583);
    int _587 = _581;
    float _589 = as_type<float>(_539);
    float _591 = _561;
    if (!_389)
    {
        int _593 = ~_567;
        int _595 = _593 + 1;
        _587 = _595;
    }
    int _597 = _587;
    float _599 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[143].x, _561);
    int _601 = ~_571;
    int _603 = _601 + 1;
    int _605 = _603 + 1;
    float _607 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[143].y, _563);
    int _609 = _605;
    if (!_547)
    {
        _589 = _235;
    }
    float _611 = _589;
    float _613 = _417 * _161;
    float _615 = _611;
    if (!_421)
    {
        int _617 = ~_571;
        int _619 = _617 + 1;
        _609 = _619;
    }
    int _621 = _609;
    float _623 = fma(_391, _549, _599);
    if (_547)
    {
        _615 = _233;
    }
    float _625 = _615;
    float _627 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _629 = log2(_627);
    int _631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _633 = _631 != 0;
    int _635 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _637 = _635 != 0;
    int _639 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _641 = _639 != 0;
    float _643 = fma(_481, _549, _607);
    int _645 = ~_543;
    int _647 = _645 + 1;
    int _649 = _647 + 1;
    float _651 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[83].z, _359);
    float _653 = fma(_527, _551, _623);
    int _655 = _649;
    float _657 = _625;
    if (!_453)
    {
        int _659 = ~_543;
        int _661 = _659 + 1;
        _655 = _661;
    }
    int _663 = _655;
    if (!_547)
    {
        _657 = _235;
    }
    float _665 = _657;
    float _667 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _669 = int(_667);
    float _671 = _665;
    if (_547)
    {
        _671 = _233;
    }
    float _673 = _671;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_547)
    {
        _591 = _237;
    }
    float _677 = _591;
    float _679 = fma(_565, _479, _653);
    bool _681 = !_637;
    int _683 = _681 ? 0 : 1;
    float _685 = _673 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _687 = !_633;
    int _689 = _687 ? 0 : 1;
    bool _691 = !_641;
    int _693 = _691 ? 0 : 1;
    float _695 = -_381;
    float _697 = fma(_685, 2.0, _695);
    float _699 = _677;
    if (_547)
    {
        _699 = _235;
    }
    float _701 = _699;
    float _703 = _629 * _161;
    int _705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _707 = _705 != 0;
    int _709 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _711 = _709 != 0;
    int _713 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _715 = _713 != 0;
    if (!_547)
    {
        _133 = _237;
    }
    float _717 = _133;
    float _719 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[83].w, _675);
    float _721 = _717;
    if (_547)
    {
        _721 = _235;
    }
    float _723 = _721;
    float _725 = exp2(_703);
    bool _727 = !_711;
    int _729 = _727 ? 0 : 1;
    float _731 = fma(_161, (*spvDescriptorSet0.vp_c9)._m0[82].w, _719);
    bool _733 = !_707;
    int _735 = _733 ? 0 : 1;
    int _737 = abs(_729);
    int _739 = abs(_735);
    float _741 = _723 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _743 = float(_669);
    float _745 = float(_739);
    float _747 = fma(_741, -2.0, _451);
    float _749 = 1.0 / _743;
    float _751 = in.m_72.x;
    float _753 = in.m_72.y;
    float _755 = in.m_72.z;
    float _757 = float(_621);
    float _759 = -_725;
    float _761 = _759 + 1.0;
    float _763 = float(_585);
    float _765 = float(_663);
    float _767 = _745 * _757;
    float _769 = float(_737);
    float _771 = 1.0 / _763;
    bool _773 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _775 = isnan(0.0);
    bool _777 = _773 || _775;
    bool _779 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _781 = _777 || _779;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _785 = 1.0 + _783;
    bool _787 = !_715;
    int _789 = _787 ? 0 : 1;
    float _791 = _769 * _765;
    float _793 = _749 * _161;
    float _795 = _781 ? _761 : 0.0;
    float _797 = fma(_161, (*spvDescriptorSet0.vp_c9)._m0[82].z, _651);
    float _799 = 1.0 / _785;
    float _801 = _767 * (-2.0);
    float _803 = fma(_161, (*spvDescriptorSet0.vp_c9)._m0[81].y, _747);
    bool _805 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _807 = isnan(1.0);
    bool _809 = _805 || _807;
    bool _811 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _813 = _809 || _811;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _817 = abs(_789);
    float _819 = -_161;
    float _821 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[81].x, _697);
    float _823 = fma(_801, _751, _751);
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _827 = fma(_337, _801, _337);
    float _829 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[78].z, _815);
    float _831 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[78].w, _825);
    float _833 = float(_597);
    float _835 = _771 * _161;
    float _837 = float(_817);
    float _839 = fma(_161, (*spvDescriptorSet0.vp_c9)._m0[77].z, _829);
    float _841 = fma(_161, (*spvDescriptorSet0.vp_c9)._m0[77].w, _831);
    if (_813)
    {
        float _843 = _795 * _799;
        _165 = _843;
    }
    float _845 = _165;
    float _847 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[196].x, _823);
    float _849 = _837 * _833;
    float _851 = _791 * (-2.0);
    float _853 = _235 + (-0.5);
    float _855 = fma(_827, _845, _847);
    float _857 = _849 * (-2.0);
    float _859 = fma(_851, _753, _753);
    float _861 = _855 * 0.15915493667125701904296875;
    float _863 = fma(_541, _551, _643);
    float _865 = fma(_455, _857, _455);
    float _867 = fma(_857, _755, _755);
    float _869 = in.m_74.x;
    float _871 = in.m_74.y;
    float _873 = fma(_371, _851, _371);
    float _875 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[196].y, _859);
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _877;
    float _881 = _237 + (-0.5);
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _883;
    float _887 = fma(_873, _845, _875);
    float _889 = fma(_879, _357, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _891 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[196].z, _867);
    float _893 = fma(_885, _357, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _895 = fma(_569, _479, _863);
    float _897 = _887 * 0.15915493667125701904296875;
    float _899 = in.m_60.x;
    float _901 = in.m_60.y;
    float _903 = in.m_60.z;
    float _905 = fma(_865, _845, _891);
    float _907 = fma(_893, _487, _895);
    float _909 = fma(_889, _487, _679);
    float _911 = in.m_76.x;
    float _913 = in.m_76.y;
    float _915 = in.m_76.z;
    float _917 = in.m_76.w;
    float _919 = _905 * 0.15915493667125701904296875;
    float _921 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[148].y, _907);
    float _923 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[148].x, _909);
    float _925 = _861 * 6.283185482025146484375;
    float _927 = sin(_925);
    float _929 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    float _931 = _921 * _871;
    float _933 = _923 * _869;
    float _935 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _197);
    float _937 = _861 * 6.283185482025146484375;
    float _939 = cos(_937);
    float _941 = _933 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _943 = _931 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _945 = in.m_78.x;
    float _947 = in.m_78.y;
    float _949 = in.m_78.z;
    float _951 = in.m_78.w;
    float _953 = _941 * _935;
    float _955 = _943 * _929;
    float _957 = _897 * 6.283185482025146484375;
    float _959 = sin(_957);
    float _961 = _901 * _913;
    float _963 = _897 * 6.283185482025146484375;
    float _965 = cos(_963);
    float _967 = fma(_899, _911, _961);
    float _969 = fma(_903, _915, _967);
    float _971 = _919 * 6.283185482025146484375;
    float _973 = cos(_971);
    float _975 = _927 * _959;
    float _977 = _919 * 6.283185482025146484375;
    float _979 = sin(_977);
    float _981 = _939 * _965;
    float _983 = _927 * _965;
    float _985 = _939 * _973;
    float _987 = _939 * _959;
    float _989 = _927 * _973;
    float _991 = _965 * _973;
    float _993 = _985 * _955;
    float _995 = _959 * _973;
    float _997 = _989 * _955;
    float _999 = fma(_979, _981, _975);
    float _1001 = -_987;
    float _1003 = fma(_979, _983, _1001);
    float _1005 = -_983;
    float _1007 = fma(_979, _987, _1005);
    float _1009 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1011 = -_955;
    float _1013 = _979 * _1011;
    float _1015 = fma(_999, _953, _993);
    float _1017 = fma(_979, _975, _981);
    float _1019 = _901 * _947;
    float _1021 = fma(_991, _953, _1013);
    float _1023 = fma(_1007, _1009, _1015);
    float _1025 = fma(_1003, _953, _997);
    float _1027 = fma(_899, _945, _1019);
    float _1029 = fma(_995, _1009, _1021);
    float _1031 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1033 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1035 = fma(_1017, _1009, _1025);
    float _1037 = fma(_903, _949, _1027);
    float _1039 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1031);
    float _1041 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1033);
    float _1043 = _969 + _917;
    float _1045 = _1037 + _951;
    float _1047 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1039);
    float _1049 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1041);
    float _1051 = _1047 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1053 = _1049 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1055 = _1043 + _1051;
    float _1057 = _1045 + _1053;
    float _1059 = in.m_80.x;
    float _1061 = in.m_80.y;
    float _1063 = in.m_80.z;
    float _1065 = in.m_80.w;
    float _1067 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1069 = _1055 + _1067;
    float _1071 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1073 = _1057 + _1071;
    float _1075 = _1069 * _1069;
    float _1077 = _1073 * _1073;
    float _1079 = _1075 + _1077;
    float _1081 = sqrt(_1079);
    float _1083 = _901 * _1061;
    float _1085 = fma(_899, _1059, _1083);
    bool _1087 = _1081 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1089 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1091 = _1081 + _1089;
    float _1093 = fma(_903, _1063, _1085);
    float _1095 = _891;
    float _1097 = _1079;
    float _1099 = _1091;
    float _1101 = _1023;
    float _1103 = _901;
    float _1105 = _1055;
    float _1107 = _1057;
    float _1109 = _1075;
    if (_1087)
    {
        float _1111 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1095 = _1111;
    }
    float _1113 = _1095;
    if (_1087)
    {
        float _1115 = rsqrt(_1079);
        _1097 = _1115;
    }
    float _1117 = _1097;
    float _1119 = _1117;
    if (_1087)
    {
        float _1121 = _1091 * _1113;
        _1099 = _1121;
    }
    float _1123 = _1099;
    float _1125 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (_1087)
    {
        float _1127 = _1123 * 0.15915493667125701904296875;
        _1101 = _1127;
    }
    float _1129 = _1101;
    float _1131 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1125);
    float _1133 = _1093 + _1065;
    float _1135 = _899;
    if (_1087)
    {
        float _1137 = _1129 * 6.283185482025146484375;
        float _1139 = sin(_1137);
        _1135 = _1139;
    }
    float _1141 = _1135;
    float _1143 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1131);
    float _1145 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1147 = _1133 + _1145;
    float _1149 = _1147;
    if (_1087)
    {
        float _1151 = _1147 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1103 = _1151;
    }
    float _1153 = _1103;
    float _1155 = _1153;
    if (_1087)
    {
        float _1157 = fma(_1141, _1153, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1155 = _1157;
    }
    float _1159 = _1155;
    float _1161 = _1159;
    if (_1087)
    {
        float _1163 = _1117 * _1159;
        _1161 = _1163;
    }
    float _1165 = _1161;
    if (_1087)
    {
        float _1167 = fma(_1069, _1165, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1105 = _1167;
    }
    float _1169 = _1105;
    float _1171 = _1169;
    if (_1087)
    {
        float _1173 = fma(_1073, _1165, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1107 = _1173;
    }
    float _1175 = _1107;
    float _1177 = fma(_1169, 6.2500002968590706586837768554688e-05, 0.5);
    float _1179 = fma(_1175, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5870 = float2(_1177, _1179);
    float3 _1183 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5870, float2(0.0), isnan(_5870)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5870, float2(0.0), isnan(_5870)), level(0.0)).xyz;
    float _1185 = _1183.x;
    float _1187 = _1183.y;
    float _1189 = _1183.z;
    float _1191 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1193 = int(_1191);
    float _1195 = _1175;
    if (_273)
    {
        float _1197 = in.m_70.x;
        _1119 = _1197;
    }
    float _1199 = _1119;
    float _1201 = -_841;
    float _1203 = _1201 + 1.0;
    float _1205 = -_797;
    float _1207 = _1205 + 1.0;
    float _1209 = _1199;
    if (!_273)
    {
        float _1211 = in.m_70.y;
        _1209 = _1211;
    }
    float _1213 = _1209;
    float _1215 = -_839;
    float _1217 = _1215 + 1.0;
    float _1219 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1221 = trunc(_835);
    int _1223 = int(_1221);
    float _1225 = -_731;
    float _1227 = _1225 + 1.0;
    float _1229 = float(uint(_1193));
    float _1231 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1233 = int(_1231);
    int _1235 = ~_1193;
    int _1237 = _1235 + 1;
    bool _1239 = _1193 == 0;
    float _1241 = float(uint(_1223));
    float _1243 = 1.0 / _1229;
    float _1245 = float(uint(_1233));
    float _1247 = trunc(_793);
    int _1249 = int(_1247);
    int _1251 = ~_1233;
    int _1253 = _1251 + 1;
    bool _1255 = _1233 == 0;
    int _1257 = as_type<int>(_1243) + (-2);
    float _1259 = 1.0 / _1245;
    float _1261 = _1243;
    float _1263 = _1227;
    if (_273)
    {
        _1261 = 1.0;
    }
    float _1265 = _1261;
    float _1267 = _1265;
    if (!_273)
    {
        _1267 = 7.345489978790283203125;
    }
    float _1269 = _1267;
    float _1271 = as_type<float>(_1257) * _1241;
    float _1273 = trunc(_1271);
    float _1275 = precise::max(_1273, 0.0);
    uint _1278 = uint(_1275);
    float _1280 = float(uint(_1249));
    float _1282 = _1269 * _233;
    int _1284 = as_type<int>(_1259) + (-2);
    float _1286 = as_type<float>(_1284) * _1280;
    float _1288 = float(_1223);
    int _1290 = _1237 * int(_1278);
    int _1292 = _1290 + _1223;
    float _1294 = trunc(_1286);
    float _1296 = precise::max(_1294, 0.0);
    uint _1298 = uint(_1296);
    float _1300 = float(uint(_1292));
    float _1302 = as_type<float>(_1257) * _1300;
    float _1304 = float(_1193);
    float _1306 = floor(_1282);
    bool _1308 = _1288 >= _1304;
    bool _1310 = isnan(_1288);
    bool _1312 = _1308 || _1310;
    bool _1314 = isnan(_1304);
    bool _1316 = _1312 || _1314;
    float _1318 = float(_1316);
    int _1320 = ~_1193;
    int _1322 = _1320 + 1;
    float _1324 = trunc(_1302);
    float _1326 = precise::max(_1324, 0.0);
    uint _1328 = uint(_1326);
    float _1330 = -_1306;
    float _1332 = _1282 + _1330;
    float _1334 = trunc(_1318);
    int _1336 = int(_1334);
    int _1338 = int(_1278) + int(_1328);
    float _1340 = _1332 * _1304;
    int _1342 = _1253 * int(_1298);
    int _1344 = _1342 + _1249;
    float _1346 = _1304 * _613;
    float _1348 = as_type<float>(_1322);
    if (_273)
    {
        _1348 = 1.0;
    }
    float _1350 = _1348;
    float _1352 = float(uint(_1344));
    int _1354 = _1322 * _1338;
    int _1356 = _1354 + _1223;
    float _1358 = trunc(_1346);
    int _1360 = int(_1358);
    float _1362 = _1350;
    if (!_273)
    {
        _1362 = 1.2345600128173828125;
    }
    float _1364 = _1362;
    float _1366 = as_type<float>(_1284) * _1352;
    bool _1368 = uint(_1356) >= uint(_1193);
    int _1370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1372 = _1370 != 0;
    float _1374 = _1364 * _1213;
    bool _1376 = !_1368;
    int _1378 = _1376 ? 0 : (-1);
    float _1380 = trunc(_1366);
    float _1382 = precise::max(_1380, 0.0);
    uint _1384 = uint(_1382);
    bool _1386 = !_1372;
    int _1388 = _1386 ? 0 : 1;
    int _1390 = ~_1338;
    int _1392 = _1390 + _1378;
    int _1394 = _1392 + 1;
    int _1396 = abs(_1388);
    int _1398 = ~_1336;
    int _1400 = _1398 + 1;
    int _1402 = _1400 + 1;
    int _1404 = _1193 * _1394;
    int _1406 = _1404 + _1223;
    float _1408 = trunc(_1340);
    int _1410 = int(_1408);
    int _1412 = ~_1233;
    int _1414 = _1412 + 1;
    bool _1416 = !_1239;
    int _1418 = _1416 ? _1406 : (-1);
    int _1420 = int(_1298) + int(_1384);
    int _1422 = _1418 * _1402;
    int _1424 = _1193 + (-1);
    int _1426 = abs(_683);
    int _1428 = _1414 * _1420;
    int _1430 = _1428 + _1249;
    float _1432 = floor(_1374);
    int _1434 = _1336 * _1424;
    int _1436 = _1434 + _1422;
    int _1438 = _1410 * _1396;
    int _1440 = _1438 + _1223;
    float _1442 = float(_1233);
    float _1444 = float(_1249);
    int _1446 = _1436 * _1426;
    bool _1448 = uint(_1430) >= uint(_1233);
    int _1450 = abs(_689);
    bool _1452 = _1444 >= _1442;
    bool _1454 = isnan(_1444);
    bool _1456 = _1452 || _1454;
    bool _1458 = isnan(_1442);
    bool _1460 = _1456 || _1458;
    float _1462 = float(_1460);
    int _1464 = abs(_693);
    bool _1466 = !_1448;
    int _1468 = _1466 ? 0 : (-1);
    int _1470 = _1360 * _1450;
    int _1472 = _1470 + _1446;
    int _1474 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1476 = _1474 != 0;
    float _1478 = trunc(_1462);
    int _1480 = int(_1478);
    float _1482 = -_1432;
    float _1484 = _1374 + _1482;
    int _1486 = ~_1420;
    int _1488 = _1486 + _1468;
    int _1490 = _1488 + 1;
    int _1492 = _1440 * _1464;
    int _1494 = _1492 + _1472;
    bool _1496 = !_1476;
    int _1498 = _1496 ? 0 : 1;
    float _1500 = _1484 * _1442;
    int _1502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1504 = _1502 != 0;
    int _1506 = _1233 * _1490;
    int _1508 = _1506 + _1249;
    int _1510 = abs(_1498);
    float _1512 = _1442 * _613;
    bool _1514 = !_1504;
    int _1516 = _1514 ? 0 : 1;
    float _1518 = trunc(_1500);
    int _1520 = int(_1518);
    int _1522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1524 = _1522 != 0;
    int _1526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1528 = _1526 != 0;
    int _1530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1532 = _1530 != 0;
    int _1534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1536 = _1534 != 0;
    int _1538 = _1410 * _1510;
    int _1540 = _1538 + _1494;
    int _1542 = abs(_1516);
    int _1544 = ~_1480;
    int _1546 = _1544 + 1;
    int _1548 = _1546 + 1;
    bool _1550 = !_1255;
    int _1552 = _1550 ? _1508 : (-1);
    float _1554 = trunc(_1512);
    int _1556 = int(_1554);
    float _1558 = float(uint(_1540));
    bool _1560 = !_1528;
    int _1562 = _1560 ? 0 : 1;
    int _1564 = _1552 * _1548;
    bool _1566 = !_1524;
    int _1568 = _1566 ? 0 : 1;
    float _1570 = as_type<float>(_1257) * _1558;
    int _1572 = _1233 + (-1);
    int _1574 = abs(_1562);
    int _1576 = _1480 * _1572;
    int _1578 = _1576 + _1564;
    int _1580 = abs(_1568);
    float _1582 = trunc(_1570);
    float _1584 = precise::max(_1582, 0.0);
    uint _1586 = uint(_1584);
    int _1588 = _1578 * _1574;
    int _1590 = _1520 * _1542;
    int _1592 = _1590 + _1249;
    bool _1594 = !_1532;
    int _1596 = _1594 ? 0 : 1;
    int _1598 = ~_1193;
    int _1600 = _1598 + 1;
    int _1602 = _1556 * _1580;
    int _1604 = _1602 + _1588;
    bool _1606 = !_1536;
    int _1608 = _1606 ? 0 : 1;
    float _1610 = float(uint(_1592));
    int _1612 = abs(_1608);
    int _1614 = abs(_1596);
    float _1616 = float(uint(_1440));
    int _1618 = _1600 * int(_1586);
    int _1620 = _1618 + _1540;
    float _1622 = as_type<float>(_1284) * _1610;
    int _1624 = _1592 * _1614;
    int _1626 = _1624 + _1604;
    float _1628 = as_type<float>(_1257) * _1616;
    float _1630 = float(uint(_1620));
    int _1632 = _1520 * _1612;
    int _1634 = _1632 + _1626;
    float _1636 = trunc(_1622);
    float _1638 = precise::max(_1636, 0.0);
    uint _1640 = uint(_1638);
    int _1642 = ~_1233;
    int _1644 = _1642 + 1;
    float _1646 = as_type<float>(_1257) * _1630;
    int _1648 = ~_1193;
    int _1650 = _1648 + 1;
    float _1652 = float(uint(_1634));
    float _1654 = trunc(_1628);
    float _1656 = precise::max(_1654, 0.0);
    uint _1658 = uint(_1656);
    int _1660 = ~_1233;
    int _1662 = _1660 + 1;
    float _1664 = as_type<float>(_1284) * _1652;
    float _1666 = trunc(_1646);
    float _1668 = precise::max(_1666, 0.0);
    uint _1670 = uint(_1668);
    float _1672 = trunc(_1664);
    float _1674 = precise::max(_1672, 0.0);
    uint _1676 = uint(_1674);
    int _1678 = _1650 * int(_1658);
    int _1680 = _1678 + _1440;
    float _1682 = float(uint(_1680));
    int _1684 = _1644 * int(_1640);
    int _1686 = _1684 + _1592;
    int _1688 = int(_1586) + int(_1670);
    int _1690 = ~_1193;
    int _1692 = _1690 + 1;
    float _1694 = as_type<float>(_1257) * _1682;
    float _1696 = float(uint(_1686));
    int _1698 = _1662 * int(_1676);
    int _1700 = _1698 + _1634;
    float _1702 = as_type<float>(_1284) * _1696;
    float _1704 = trunc(_1694);
    float _1706 = precise::max(_1704, 0.0);
    uint _1708 = uint(_1706);
    float _1710 = float(uint(_1700));
    int _1712 = _1692 * _1688;
    int _1714 = _1712 + _1540;
    float _1716 = as_type<float>(_1284) * _1710;
    bool _1718 = uint(_1714) >= uint(_1193);
    float _1720 = trunc(_1702);
    float _1722 = precise::max(_1720, 0.0);
    uint _1724 = uint(_1722);
    int _1726 = ~_1233;
    int _1728 = _1726 + 1;
    bool _1730 = !_1718;
    int _1732 = _1730 ? 0 : (-1);
    int _1734 = int(_1658) + int(_1708);
    float _1736 = trunc(_1716);
    float _1738 = precise::max(_1736, 0.0);
    uint _1740 = uint(_1738);
    int _1742 = ~_1688;
    int _1744 = _1742 + _1732;
    int _1746 = _1744 + 1;
    int _1748 = _1193 * _1746;
    int _1750 = _1748 + _1540;
    int _1752 = ~_1193;
    int _1754 = _1752 + 1;
    int _1756 = int(_1640) + int(_1724);
    bool _1758 = !_1239;
    int _1760 = _1758 ? _1750 : (-1);
    int _1762 = _1754 * _1734;
    int _1764 = _1762 + _1440;
    int _1766 = _1760 & 3;
    bool _1768 = _1766 != 0;
    int _1770 = int(_1676) + int(_1740);
    int _1772 = _1760 & 3;
    bool _1774 = _1772 != 0;
    bool _1776 = uint(_1766) >= 2u;
    int _1778 = _1728 * _1770;
    int _1780 = _1778 + _1634;
    int _1782 = _1774 ? 0 : 1;
    bool _1784 = uint(_1764) >= uint(_1193);
    int _1786 = _1776 ? 0 : 1;
    bool _1788 = uint(_1780) >= uint(_1233);
    bool _1790 = !_1784;
    int _1792 = _1790 ? 0 : (-1);
    bool _1794 = !_1788;
    int _1796 = _1794 ? 0 : (-1);
    bool _1798 = uint(_1766) > 1u;
    int _1800 = ~_1734;
    int _1802 = _1800 + _1792;
    int _1804 = _1802 + 1;
    int _1806 = ~_1770;
    int _1808 = _1806 + _1796;
    int _1810 = _1808 + 1;
    int _1812 = ~_1233;
    int _1814 = _1812 + 1;
    int _1816 = _1193 * _1804;
    int _1818 = _1816 + _1440;
    int _1820 = ~_1782;
    int _1822 = _1820 + 1;
    int _1824 = _1822 + 1;
    int _1826 = _1233 * _1810;
    int _1828 = _1826 + _1634;
    bool _1830 = _239 > 0.5;
    int _1832 = _1814 * _1756;
    int _1834 = _1832 + _1592;
    bool _1836 = !_1239;
    int _1838 = _1836 ? _1818 : (-1);
    bool _1840 = !_1255;
    int _1842 = _1840 ? _1828 : (-1);
    int _1844 = _1824;
    if (!_1798)
    {
        int _1846 = ~_1782;
        int _1848 = _1846 + 1;
        _1844 = _1848;
    }
    int _1850 = _1844;
    int _1852 = _1760 >> 31;
    int _1854 = _1842 >> 31;
    bool _1856 = uint(_1834) >= uint(_1233);
    int _1858 = _1852 & 3;
    float _1860 = -_201;
    int _1862 = _1830 ? as_type<int>(_1860) : as_type<int>(_201);
    int _1864 = _1854 & 3;
    int _1866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1868 = _1866 != 0;
    int _1870 = _1760 + _1858;
    int _1872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1874 = _1872 != 0;
    int _1876 = _1842 + _1864;
    bool _1878 = !_1868;
    int _1880 = _1878 ? 0 : 1;
    int _1882 = _1842 & 3;
    bool _1884 = _1882 != 0;
    bool _1886 = !_1856;
    int _1888 = _1886 ? 0 : (-1);
    int _1890 = _1870 >> 2;
    bool _1892 = !_1874;
    float _1894 = _1892 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _1896 = _1876 >> 2;
    int _1898 = _1842 & 3;
    bool _1900 = _1898 != 0;
    bool _1902 = !_1884;
    int _1904 = _1902 ? 0 : 1;
    int _1906 = ~_1756;
    int _1908 = _1906 + _1888;
    int _1910 = _1908 + 1;
    bool _1912 = uint(_1882) > 1u;
    int _1914 = _1890 << 4;
    int _1916 = _1914 + 368;
    int _1918 = _1233 * _1910;
    int _1920 = _1918 + _1592;
    int _1922 = _1896 << 4;
    int _1924 = _1922 + 512;
    int _1926 = _1900 ? 0 : 1;
    bool _1928 = _1766 != 3;
    uint _1930 = uint(int(uint(_1924) >> uint(2)));
    uint _1932 = uint(int(uint(int(_1930)) >> uint(2)));
    int _1934 = int(_1930) & 3;
    float _1936 = (*spvDescriptorSet0.vp_c9)._m0[int(_1932)][_1934];
    int _1938 = int(_1930) + 1;
    uint _1940 = uint(int(uint(_1938) >> uint(2)));
    int _1942 = _1938 & 3;
    float _1944 = (*spvDescriptorSet0.vp_c9)._m0[int(_1940)][_1942];
    bool _1946 = _1766 != 3;
    int _1948 = ~_1926;
    int _1950 = _1948 + 1;
    int _1952 = _1950 + 1;
    int _1954 = _1952;
    float _1956 = _1894;
    if (!_1912)
    {
        int _1958 = ~_1926;
        int _1960 = _1958 + 1;
        _1954 = _1960;
    }
    int _1962 = _1954;
    bool _1964 = _1882 != 3;
    uint _1966 = uint(int(uint(_1916) >> uint(2)));
    uint _1968 = uint(int(uint(int(_1966)) >> uint(2)));
    int _1970 = int(_1966) & 3;
    float _1972 = (*spvDescriptorSet0.vp_c9)._m0[int(_1968)][_1970];
    int _1974 = int(_1966) + 1;
    uint _1976 = uint(int(uint(_1974) >> uint(2)));
    int _1978 = _1974 & 3;
    float _1980 = (*spvDescriptorSet0.vp_c9)._m0[int(_1976)][_1978];
    bool _1982 = !_1946;
    int _1984 = _1982 ? 0 : (-1);
    bool _1986 = uint(_1882) >= 2u;
    int _1988 = ~_1786;
    int _1990 = _1988 + 1;
    int _1992 = _1990 + 1;
    int _1994 = _1992;
    if (_1928)
    {
        int _1996 = ~_1786;
        int _1998 = _1996 + 1;
        _1994 = _1998;
    }
    int _2000 = _1994;
    bool _2002 = !_1768;
    int _2004 = _2002 ? 0 : 1;
    int _2006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2008 = _2006 != 0;
    int _2010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2012 = _2010 != 0;
    int _2014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2016 = _2014 != 0;
    int _2018 = _1986 ? 0 : 1;
    bool _2020 = !_1255;
    int _2022 = _2020 ? _1920 : (-1);
    bool _2024 = _1882 != 3;
    int _2026 = _1924 + 8;
    uint _2028 = uint(int(uint(_2026) >> uint(2)));
    uint _2030 = uint(int(uint(int(_2028)) >> uint(2)));
    int _2032 = int(_2028) & 3;
    float _2034 = (*spvDescriptorSet0.vp_c9)._m0[int(_2030)][_2032];
    int _2036 = int(_2028) + 1;
    uint _2038 = uint(int(uint(_2036) >> uint(2)));
    int _2040 = _2036 & 3;
    float _2042 = (*spvDescriptorSet0.vp_c9)._m0[int(_2038)][_2040];
    int _2044 = ~_2018;
    int _2046 = _2044 + 1;
    int _2048 = _2046 + 1;
    int _2050 = _2048;
    if (_1964)
    {
        int _2052 = ~_2018;
        int _2054 = _2052 + 1;
        _2050 = _2054;
    }
    int _2056 = _2050;
    int _2058 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2060 = _2058 != 0;
    int _2062 = _1916 + 8;
    uint _2064 = uint(int(uint(_2062) >> uint(2)));
    uint _2066 = uint(int(uint(int(_2064)) >> uint(2)));
    int _2068 = int(_2064) & 3;
    float _2070 = (*spvDescriptorSet0.vp_c9)._m0[int(_2066)][_2068];
    int _2072 = int(_2064) + 1;
    uint _2074 = uint(int(uint(_2072) >> uint(2)));
    int _2076 = _2072 & 3;
    float _2078 = (*spvDescriptorSet0.vp_c9)._m0[int(_2074)][_2076];
    float _2080 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2082 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2084 = abs(_1962);
    float _2086 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2088 = _2080 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2090 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2092 = _2082 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2094 = _2086 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2096 = abs(_1850);
    int _2098 = abs(_2004);
    out.m_82.x = _2088;
    out.m_82.y = _2092;
    out.m_82.z = _2094;
    out.m_82.w = _2090;
    int _2100 = ~_2096;
    int _2102 = _2100 + 1;
    int _2104 = _2102 + 1;
    bool _2106 = !_2024;
    int _2108 = _2106 ? 0 : (-1);
    bool _2110 = _233 > 0.5;
    int _2112 = _2104 * as_type<int>(_1980);
    bool _2114 = _235 > 0.5;
    float _2116 = -_197;
    int _2118 = _2110 ? as_type<int>(_2116) : as_type<int>(_197);
    float _2120 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2122 = int(_2120);
    float _2124 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2126 = _1219 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2128 = abs(_1904);
    float _2130 = _1007 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2132 = ~_2084;
    int _2134 = _2132 + 1;
    int _2136 = _2134 + 1;
    int _2138 = ~_2098;
    int _2140 = _2138 + 1;
    int _2142 = _2140 + 1;
    int _2144 = ~_2128;
    int _2146 = _2144 + 1;
    int _2148 = _2146 + 1;
    int _2150 = _2136 * as_type<int>(_1944);
    bool _2152 = _237 > 0.5;
    int _2154 = _2142 * as_type<int>(_1972);
    int _2156 = _2154 + _2112;
    float _2158 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2160 = _2148 * as_type<int>(_1936);
    int _2162 = _2160 + _2150;
    int _2164 = abs(_2000);
    float _2166 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2168 = int(_2166);
    float _2170 = _2124 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2172 = _2158 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2174 = abs(_2056);
    float _2176 = _985 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_84.x = _2126;
    out.m_84.y = _2170;
    out.m_84.z = _2172;
    int _2178 = abs(_2108);
    float _2180 = as_type<float>(_2164);
    float _2182 = _2130;
    if (_1087)
    {
        float _2184 = _1129 * 6.283185482025146484375;
        float _2186 = cos(_2184);
        _2180 = _2186;
    }
    float _2188 = _2180;
    int _2190 = ~_2164;
    int _2192 = _2190 + 1;
    int _2194 = _2192 + 1;
    int _2196 = abs(_1984);
    bool _2198 = !_2008;
    float _2200 = _2198 ? _201 : as_type<float>(_1862);
    int _2202 = _2194 * as_type<int>(_2070);
    int _2204 = _2202 + _2156;
    float _2206 = float(uint(_2168));
    int _2208 = abs(_1880);
    int _2210 = ~_2174;
    int _2212 = _2210 + 1;
    int _2214 = _2212 + 1;
    float _2216 = float(uint(_2122));
    int _2218 = ~_2178;
    int _2220 = _2218 + 1;
    int _2222 = _2220 + 1;
    int _2224 = _2214 * as_type<int>(_2034);
    int _2226 = _2224 + _2162;
    float _2228 = 1.0 / _2216;
    int _2230 = _2222 * as_type<int>(_2042);
    int _2232 = _2230 + _2226;
    int _2234 = ~_2196;
    int _2236 = _2234 + 1;
    int _2238 = _2236 + 1;
    int _2240 = abs(_2122);
    int _2242 = abs(as_type<int>(_1894));
    int _2244 = _2238 * as_type<int>(_2078);
    int _2246 = _2244 + _2204;
    float _2248 = 1.0 / _2206;
    int _2250 = ~_2208;
    int _2252 = _2250 + 1;
    int _2254 = _2252 + 1;
    if (_1087)
    {
        float _2256 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2258 = _1175 + _2256;
        _1956 = _2258;
    }
    float _2260 = _1956;
    float _2262 = _985 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2264 = abs(_2168);
    int _2266 = _2246 * _2254;
    float _2268 = float(uint(_2240));
    float _2270 = -_979;
    float _2272 = fma(_2270, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2262);
    float _2274 = _985 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2276 = ~_2242;
    int _2278 = _2276 + 1;
    int _2280 = _2278 + 1;
    int _2282 = _1838 * _2208;
    int _2284 = _2282 + _2266;
    float _2286 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2272);
    float _2288 = -_979;
    float _2290 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2274);
    float _2292 = float(uint(_2264));
    int _2294 = _2232 * _2280;
    int _2296 = as_type<int>(_2228) + (-2);
    float _2298 = 1.0 / _2268;
    int _2300 = as_type<int>(_2248) + (-2);
    int _2302 = _2022 * _2242;
    int _2304 = _2302 + _2294;
    float _2306 = _999 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2308 = float(uint(_2284));
    float _2310 = -_979;
    float _2312 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2176);
    float _2314 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2290);
    float _2316 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2306);
    float _2318 = 1.0 / _2292;
    float _2320 = as_type<float>(_2296) * _2308;
    float _2322 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2312);
    int _2324 = abs(_2284);
    float _2326 = _999 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2328 = _999 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2330 = float(uint(_2304));
    float _2332 = trunc(_2320);
    float _2334 = precise::max(_2332, 0.0);
    uint _2336 = uint(_2334);
    int _2338 = as_type<int>(_2298) + (-2);
    float _2340 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2326);
    float _2342 = float(uint(_2324));
    float _2344 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2328);
    int _2346 = abs(_2304);
    float _2348 = as_type<float>(_2300) * _2330;
    int _2350 = ~_2122;
    int _2352 = _2350 + 1;
    float _2354 = as_type<float>(_2338) * _2342;
    int _2356 = as_type<int>(_2318) + (-2);
    float _2358 = _1007 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2360 = _1007 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2362 = float(uint(_2346));
    float _2364 = trunc(_2348);
    float _2366 = precise::max(_2364, 0.0);
    uint _2368 = uint(_2366);
    float _2370 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2358);
    float _2372 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2360);
    int _2374 = _2352 * int(_2336);
    int _2376 = _2374 + _2284;
    float _2378 = as_type<float>(_2356) * _2362;
    float _2380 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2370);
    float _2382 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2372);
    int _2384 = ~_2168;
    int _2386 = _2384 + 1;
    float _2388 = trunc(_2378);
    float _2390 = precise::max(_2388, 0.0);
    uint _2392 = uint(_2390);
    float _2394 = float(uint(_2376));
    float _2396 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2130);
    float _2398 = _2344;
    if (_1087)
    {
        float _2400 = _2188 + (-1.0);
        _2182 = _2400;
    }
    float _2402 = _2182;
    bool _2404 = !_2060;
    float _2406 = _2404 ? _197 : as_type<float>(_2118);
    float _2408 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2340);
    float _2410 = as_type<float>(_2296) * _2394;
    float _2412 = trunc(_2354);
    float _2414 = precise::max(_2412, 0.0);
    uint _2416 = uint(_2414);
    float _2418 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2396);
    int _2420 = ~_2240;
    int _2422 = _2420 + 1;
    float _2424 = _2402;
    if (_1087)
    {
        float _2426 = _2402 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2424 = _2426;
    }
    float _2428 = _2424;
    int _2430 = _2386 * int(_2368);
    int _2432 = _2430 + _2304;
    bool _2434 = _2168 == 0;
    if (_1087)
    {
        float _2436 = fma(_1147, _2188, _2428);
        _1149 = _2436;
    }
    float _2438 = _1149;
    float _2440 = trunc(_2410);
    float _2442 = precise::max(_2440, 0.0);
    uint _2444 = uint(_2442);
    int _2446 = ~_2264;
    int _2448 = _2446 + 1;
    float _2450 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2452 = float(uint(_2432));
    float _2454 = _197 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2456 = as_type<float>(_2448);
    if (_1087)
    {
        float _2458 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2460 = _1169 + _2458;
        _2456 = _2460;
    }
    float _2462 = _2456;
    float _2464 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2466 = _2438 + _2464;
    int _2468 = _2422 * int(_2416);
    int _2470 = _2468 + _2324;
    float _2472 = as_type<float>(_2300) * _2452;
    int _2474 = _2448 * int(_2392);
    int _2476 = _2474 + _2346;
    float _2478 = -_197;
    int _2480 = _2152 ? as_type<int>(_2478) : as_type<int>(_197);
    if (_1087)
    {
        float _2482 = _2462 * _2462;
        _1109 = _2482;
    }
    float _2484 = _1109;
    float _2486 = float(uint(_2470));
    float _2488 = float(uint(_2476));
    float _2490 = trunc(_2472);
    float _2492 = precise::max(_2490, 0.0);
    uint _2494 = uint(_2492);
    float _2496 = -_201;
    int _2498 = _2114 ? as_type<int>(_2496) : as_type<int>(_201);
    float _2500 = as_type<float>(_2338) * _2486;
    int _2502 = int(_2336) + int(_2444);
    float _2504 = as_type<float>(_2356) * _2488;
    bool _2506 = !_2012;
    float _2508 = _2506 ? _201 : as_type<float>(_2498);
    float _2510 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2344);
    bool _2512 = !_2016;
    float _2514 = _2512 ? _197 : as_type<float>(_2480);
    float _2516 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2316);
    float _2518 = trunc(_2500);
    float _2520 = precise::max(_2518, 0.0);
    uint _2522 = uint(_2520);
    int _2524 = ~_2122;
    int _2526 = _2524 + 1;
    float _2528 = _2450 * _2314;
    if (!_1087)
    {
        _2398 = _1077;
    }
    float _2530 = _2398;
    float _2532 = _2530;
    if (_1087)
    {
        float _2534 = _2260 * _2260;
        _2532 = _2534;
    }
    float _2536 = _2532;
    bool _2538 = _2168 == 0;
    int _2540 = _2526 * _2502;
    int _2542 = _2540 + _2284;
    int _2544 = int(_2368) + int(_2494);
    float _2546 = trunc(_2504);
    float _2548 = precise::max(_2546, 0.0);
    uint _2550 = uint(_2548);
    int _2552 = ~_2168;
    int _2554 = _2552 + 1;
    float _2556 = fma(_2466, _2466, _2484);
    int _2558 = ~_2240;
    int _2560 = _2558 + 1;
    float _2562 = _2450 * _2286;
    bool _2564 = uint(_2542) >= uint(_2122);
    int _2566 = _2554 * _2544;
    int _2568 = _2566 + _2304;
    float _2570 = _2450 * _2322;
    int _2572 = int(_2416) + int(_2522);
    float _2574 = _2556 + _2536;
    int _2576 = ~_2264;
    int _2578 = _2576 + 1;
    float _2580 = fma(_2454, _2408, _2528);
    bool _2582 = uint(_2568) >= uint(_2168);
    int _2584 = _2560 * _2572;
    int _2586 = _2584 + _2324;
    float _2588 = fma(_2454, _2516, _2562);
    float _2590 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2592 = int(_2392) + int(_2550);
    float _2594 = fma(_2454, _2510, _2570);
    bool _2596 = uint(_2586) >= uint(_2240);
    out.m_86.x = _2516;
    out.m_86.y = _2408;
    out.m_86.z = _2510;
    bool _2598 = !_2582;
    int _2600 = _2598 ? 0 : (-1);
    int _2602 = _2578 * _2592;
    int _2604 = _2602 + _2346;
    bool _2606 = !_2564;
    int _2608 = _2606 ? 0 : (-1);
    float _2610 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2612 = ~_2544;
    int _2614 = _2612 + _2600;
    int _2616 = _2614 + 1;
    int _2618 = ~_2502;
    int _2620 = _2618 + _2608;
    int _2622 = _2620 + 1;
    int _2624 = _2284 ^ _2122;
    int _2626 = _2168 * _2616;
    int _2628 = _2626 + _2304;
    bool _2630 = uint(_2604) >= uint(_2264);
    int _2632 = _2122 * _2622;
    int _2634 = _2632 + _2284;
    bool _2636 = !_2596;
    int _2638 = _2636 ? 0 : (-1);
    float _2640 = sqrt(_2574);
    uint _2642 = uint(int(uint(_2624) >> uint(31)));
    bool _2644 = _2122 == 0;
    bool _2646 = _2122 == 0;
    float _2648 = _2610 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2650 = _2304 ^ _2168;
    float _2652 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2654 = ~_2638;
    int _2656 = _2572 + _2654;
    int _2658 = _2656 + 1;
    float _2660 = _2590 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2662 = ~int(_2642);
    int _2664 = _2662 + 1;
    bool _2666 = !_2644;
    int _2668 = _2666 ? _2634 : (-1);
    uint _2670 = uint(int(uint(_2650) >> uint(31)));
    float _2672 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2674 = !_2630;
    int _2676 = _2674 ? 0 : (-1);
    int _2678 = _2658 ^ _2664;
    float _2680 = float(_2668);
    int _2682 = ~int(_2670);
    int _2684 = _2682 + 1;
    float _2686 = fma(_2450, _2450, 1.0);
    int _2688 = ~_2676;
    int _2690 = _2592 + _2688;
    int _2692 = _2690 + 1;
    float _2694 = fma(_2660, _2680, _365);
    int _2696 = ~_2664;
    int _2698 = _2696 + _2678;
    int _2700 = _2698 + 1;
    float _2702 = rsqrt(_2686);
    bool _2704 = !_2434;
    int _2706 = _2704 ? _2628 : (-1);
    int _2708 = _2692 ^ _2684;
    float _2710 = _2672 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _2712 = !_2646;
    int _2714 = _2712 ? _2700 : (-1);
    float _2716 = _2652 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2718 = float(_2706);
    float _2720 = _2406 + 0.5;
    int _2722 = ~_2684;
    int _2724 = _2722 + _2708;
    int _2726 = _2724 + 1;
    float _2728 = float(_2714);
    float _2730 = fma(_2716, _2718, _821);
    bool _2732 = !_2538;
    int _2734 = _2732 ? _2726 : (-1);
    float _2736 = fma(_2660, _2720, _2694);
    float _2738 = _2514 + 0.5;
    float _2740 = -_403;
    float _2742 = fma(_2648, _2728, _2740);
    float _2744 = float(_2734);
    float _2746 = _2508 + (-0.5);
    float _2748 = fma(_2716, _2738, _2730);
    float _2750 = _2450 * _2702;
    float _2752 = -_1217;
    float _2754 = fma(_2406, _2752, _2736);
    float _2756 = -_803;
    float _2758 = fma(_2710, _2744, _2756);
    float _2760 = _2200 + (-0.5);
    float _2762 = -_2648;
    float _2764 = fma(_2762, _2746, _2742);
    float _2766 = -_2380;
    float _2768 = _2750 * _2766;
    float _2770 = -_2382;
    float _2772 = _2750 * _2770;
    float _2774 = -_2418;
    float _2776 = _2750 * _2774;
    float _2778 = -_2710;
    float _2780 = fma(_2778, _2760, _2758);
    float _2782 = fma(_2702, _2286, _2768);
    float _2784 = fma(_2702, _2314, _2772);
    float _2786 = -_1207;
    float _2788 = fma(_2514, _2786, _2748);
    float _2790 = fma(_2508, _1203, _2764);
    float _2792 = fma(_2702, _2322, _2776);
    float _2794 = _2380 + _2588;
    float _2796 = fma(_2200, _1227, _2780);
    float _2798 = _2382 + _2580;
    float _2800 = _2418 + _2594;
    out.m_88.x = _2782;
    out.m_88.y = _2784;
    out.m_88.z = _2792;
    bool _2802 = _2640 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2804 = isnan(_2640);
    bool _2806 = _2802 || _2804;
    bool _2808 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2810 = _2806 || _2808;
    out.m_90.x = _2754;
    out.m_90.y = _2790;
    out.m_90.z = _2788;
    out.m_90.w = _2796;
    out.m_92.x = _1185;
    out.m_92.y = _1187;
    out.m_92.z = _1189;
    out.m_94.x = _2794;
    out.m_94.y = _2798;
    out.m_94.z = _2800;
    float _2812 = as_type<float>(_2550);
    float _2814 = _2580;
    if (!_2810)
    {
        _1263 = 1.0;
    }
    float _2816 = _1263;
    bool _2818 = !_2810;
    float _2820 = _2816;
    if (!_2818)
    {
        bool _2822 = _2640 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2824 = isnan(_2640);
        bool _2826 = _2822 || _2824;
        bool _2828 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2830 = _2826 || _2828;
        if (!_2830)
        {
            float _2832 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2834 = _2640 + _2832;
            float _2836 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2838 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2836;
            float _2840 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2842 = _2840 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2844 = 1.0 / _2838;
            float _2846 = _2834 * _2844;
            float _2848 = fma(_2846, _2842, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2820 = _2848;
            _2850 = true;
        }
        else
        {
            bool _2852 = _2640 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2854 = isnan(_2640);
            bool _2856 = _2852 || _2854;
            bool _2858 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2860 = _2856 || _2858;
            if (!_2860)
            {
                float _2862 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2864 = _2640 + _2862;
                float _2866 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2868 = _2866 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2870 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2872 = _2870 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2874 = 1.0 / _2868;
                float _2876 = _2864 * _2874;
                float _2878 = fma(_2876, _2872, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2820 = _2878;
                _2850 = true;
            }
            else
            {
                _2820 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2850 = false;
    float _2880 = _2820;
    float _2882 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2884 = _2438 + _2882;
    float _2886 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2888 = _1169 + _2886;
    float _2890 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2892 = _1175 + _2890;
    float _2894 = fma(_2884, _2880, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2896 = fma(_2888, _2880, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2898 = fma(_2892, _2880, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2900 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2902 = _2894 + _2900;
    float _2904 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2906 = _2896 + _2904;
    float _2908 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2910 = _2898 + _2908;
    float _2912 = _2902 * _2902;
    float _2914 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2916 = fma(_2906, _2906, _2912);
    float _2918 = _1133 + _2914;
    float _2920 = fma(_1043, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2922 = fma(_2910, _2910, _2916);
    float _2924 = _1133 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2926 = floor(_2920);
    float _2928 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2924);
    float _2930 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2928);
    float _2932 = rsqrt(_2922);
    float _2934 = _2930 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2936 = -_2926;
    float _2938 = _2920 + _2936;
    float _2940 = sqrt(_2922);
    float _2942 = _2932 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2944 = _1133 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2946 = _2906 * _2942;
    float _2948 = _2910 * _2942;
    float _2950 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2944);
    float _2952 = 1.0 / _2934;
    float _2954 = _2946 * _2946;
    float _2956 = _2948 * _2948;
    float _2958 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2950);
    float _2960 = _2954 + _2956;
    float _2962 = _2958 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2964 = sqrt(_2960);
    float _2966 = _2962 + _2934;
    float _2968 = _2918 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2970 = _2966 * _2952;
    float _2972 = _2970 * 0.5;
    float _2974 = _2918 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2976 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2978 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2976);
    float _2980 = fma(_1043, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2974);
    float _2982 = fma(_1045, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2980);
    float _2984 = 1.0 / _2978;
    bool _2986 = _2964 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2988 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2990 = _2964 + _2988;
    float _2992 = _2982 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2994 = trunc(_2992);
    int _2996 = int(_2994);
    float _2998 = _1189;
    float _3000 = _2960;
    float _3002 = _2942;
    int _3004 = 2;
    float _3006 = _2946;
    float _3008 = _2954;
    if (_2986)
    {
        float _3010 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2998 = _3010;
    }
    float _3012 = _2998;
    float _3014 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3016 = _2984 * _3014;
    float _3018 = fma(_1043, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2968);
    float _3020 = fma(_1045, (*spvDescriptorSet0.vp_c15)._m0[127].z, _3018);
    bool _3022 = _3016 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _3024 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    bool _3026 = _3016 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _3028 = _3020 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _3030 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _3032 = _2996 + _3030;
    int _3034 = _3032 + 1;
    float _3036 = _3020;
    int _3038 = as_type<int>(_3028);
    if (_2986)
    {
        float _3040 = rsqrt(_2960);
        _3000 = _3040;
    }
    float _3042 = _3000;
    float _3044 = precise::max(0.0, _3024);
    float _3046 = _3042;
    if (_2986)
    {
        float _3048 = _2990 * _3012;
        _3036 = _3048;
    }
    float _3050 = _3036;
    float _3052 = -_2942;
    float _3054 = -_3044;
    float _3056 = fma(_2902, _3052, _3054);
    float _3058 = trunc(_3028);
    int _3060 = int(_3058);
    float _3062 = _3056;
    if (_2986)
    {
        float _3064 = _3050 * 0.15915493667125701904296875;
        _1171 = _3064;
    }
    float _3066 = _1171;
    bool _3068 = !_3022;
    int _3070 = _3068 ? 0 : 1;
    if (_2986)
    {
        float _3072 = _3056 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3002 = _3072;
    }
    float _3074 = _3002;
    if (!_3022)
    {
        _3004 = 1;
    }
    int _3076 = _3004;
    int _3078 = _3076;
    if (!_3026)
    {
        _3078 = _3070;
    }
    int _3080 = _3078;
    float _3082 = _2982;
    if (_2986)
    {
        float _3084 = _3066 * 6.283185482025146484375;
        float _3086 = sin(_3084);
        _3082 = _3086;
    }
    float _3088 = _3082;
    bool _3090 = _3034 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _3092 = _3080 << 6;
    int _3094 = _3092 + 96;
    uint _3096 = uint(int(uint(_3094) >> uint(2)));
    uint _3098 = uint(int(uint(int(_3096)) >> uint(2)));
    int _3100 = int(_3096) & 3;
    float _3102 = (*spvDescriptorSet0.vp_c15)._m0[int(_3098)][_3100];
    int _3104 = int(_3096) + 1;
    uint _3106 = uint(int(uint(_3104) >> uint(2)));
    int _3108 = _3104 & 3;
    float _3110 = (*spvDescriptorSet0.vp_c15)._m0[int(_3106)][_3108];
    int _3112 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3114 = _3060 + _3112;
    int _3116 = _3114 + 1;
    float _3118 = _3066;
    if (_2986)
    {
        float _3120 = _3066 * 6.283185482025146484375;
        float _3122 = cos(_3120);
        _3118 = _3122;
    }
    float _3124 = _3118;
    float _3126 = fma(_1045, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    int _3128 = _3034 | _3116;
    int _3130 = _3092 + 48;
    uint _3132 = uint(int(uint(_3130) >> uint(2)));
    uint _3134 = uint(int(uint(int(_3132)) >> uint(2)));
    int _3136 = int(_3132) & 3;
    float _3138 = (*spvDescriptorSet0.vp_c15)._m0[int(_3134)][_3136];
    int _3140 = int(_3132) + 1;
    uint _3142 = uint(int(uint(_3140) >> uint(2)));
    int _3144 = _3140 & 3;
    float _3146 = (*spvDescriptorSet0.vp_c15)._m0[int(_3142)][_3144];
    bool _3148 = _3128 < 0;
    bool _3150 = _3148 || _3090;
    float _3152 = as_type<float>(_3128);
    if (_2986)
    {
        float _3154 = fma(_3088, _3074, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3152 = _3154;
    }
    float _3156 = _3152;
    float _3158 = _2894 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3160 = floor(_3126);
    bool _3162 = _3116 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3164 = _3162 || _3150;
    if (_2986)
    {
        float _3166 = _3042 * _3156;
        _2812 = _3166;
    }
    float _3168 = _2812;
    float _3170 = fma(_2896, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3158);
    int _3172 = _3092 + 104;
    uint _3174 = uint(int(uint(_3172) >> uint(2)));
    uint _3176 = uint(int(uint(int(_3174)) >> uint(2)));
    int _3178 = int(_3174) & 3;
    float _3180 = (*spvDescriptorSet0.vp_c15)._m0[int(_3176)][_3178];
    int _3182 = int(_3174) + 1;
    uint _3184 = uint(int(uint(_3182) >> uint(2)));
    int _3186 = _3182 & 3;
    float _3188 = (*spvDescriptorSet0.vp_c15)._m0[int(_3184)][_3186];
    if (_2986)
    {
        float _3190 = _3124 + (-1.0);
        _3046 = _3190;
    }
    float _3192 = _3046;
    float _3194 = _3192;
    if (_2986)
    {
        float _3196 = _2946 * _3168;
        _3006 = _3196;
    }
    float _3198 = _3006;
    float _3200 = fma(_2898, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3170);
    float _3202 = _3200;
    if (_2986)
    {
        float _3204 = _3192 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1195 = _3204;
    }
    float _3206 = _1195;
    if (!_2986)
    {
        _3194 = _2948;
    }
    float _3208 = _3194;
    int _3210 = _3092 + 64;
    uint _3212 = uint(int(uint(_3210) >> uint(2)));
    uint _3214 = uint(int(uint(int(_3212)) >> uint(2)));
    int _3216 = int(_3212) & 3;
    float _3218 = (*spvDescriptorSet0.vp_c15)._m0[int(_3214)][_3216];
    int _3220 = int(_3212) + 1;
    uint _3222 = uint(int(uint(_3220) >> uint(2)));
    int _3224 = _3220 & 3;
    float _3226 = (*spvDescriptorSet0.vp_c15)._m0[int(_3222)][_3224];
    float _3228 = _3208;
    if (_2986)
    {
        float _3230 = _2948 * _3168;
        _3228 = _3230;
    }
    float _3232 = _3228;
    if (_2986)
    {
        float _3234 = fma(_3056, _3124, _3206);
        _3062 = _3234;
    }
    float _3236 = _3062;
    if (_2986)
    {
        float _3238 = _3198 * _3198;
        _3008 = _3238;
    }
    float _3240 = _3008;
    float _3242 = _3200 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (!_2986)
    {
        _3202 = _2956;
    }
    float _3244 = _3202;
    float _3246 = _3244;
    if (_2986)
    {
        float _3248 = _3232 * _3232;
        _3246 = _3248;
    }
    float _3250 = _3246;
    float _3252 = fma(_3236, _3236, _3240);
    int _3254 = _3092 + 80;
    uint _3256 = uint(int(uint(_3254) >> uint(2)));
    uint _3258 = uint(int(uint(int(_3256)) >> uint(2)));
    int _3260 = int(_3256) & 3;
    float _3262 = (*spvDescriptorSet0.vp_c15)._m0[int(_3258)][_3260];
    int _3264 = int(_3256) + 1;
    uint _3266 = uint(int(uint(_3264) >> uint(2)));
    int _3268 = _3264 & 3;
    float _3270 = (*spvDescriptorSet0.vp_c15)._m0[int(_3266)][_3268];
    float _3272 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3274 = _3242 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3276 = -_3160;
    float _3278 = _3126 + _3276;
    float _3280 = _3252 + _3250;
    int _3282 = as_type<int>(_3274);
    if (!_3164)
    {
        float _3284 = floor(_3028);
        _2814 = _3284;
    }
    float _3286 = _2814;
    float _3288 = -_3274;
    float _3290 = fma(_3288, _3272, 1.0);
    if (!_3164)
    {
        int _3292 = _3116 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3294 = _3292 + _3034;
        _3282 = _3294;
    }
    int _3296 = _3282;
    int _3298 = _3092 + 56;
    uint _3300 = uint(int(uint(_3298) >> uint(2)));
    uint _3302 = uint(int(uint(int(_3300)) >> uint(2)));
    int _3304 = int(_3300) & 3;
    float _3306 = (*spvDescriptorSet0.vp_c15)._m0[int(_3302)][_3304];
    int _3308 = int(_3300) + 1;
    uint _3310 = uint(int(uint(_3308) >> uint(2)));
    int _3312 = _3308 & 3;
    float _3314 = (*spvDescriptorSet0.vp_c15)._m0[int(_3310)][_3312];
    float _3316 = log2(_3290);
    int _3318 = _3092 + 88;
    uint _3320 = uint(int(uint(_3318) >> uint(2)));
    uint _3322 = uint(int(uint(int(_3320)) >> uint(2)));
    int _3324 = int(_3320) & 3;
    float _3326 = (*spvDescriptorSet0.vp_c15)._m0[int(_3322)][_3324];
    int _3328 = int(_3320) + 1;
    uint _3330 = uint(int(uint(_3328) >> uint(2)));
    int _3332 = _3328 & 3;
    float _3334 = (*spvDescriptorSet0.vp_c15)._m0[int(_3330)][_3332];
    float _3336 = _2918 * _3110;
    float _3338 = fma(_1043, _3102, _3336);
    int _3340 = _3092 + 72;
    uint _3342 = uint(int(uint(_3340) >> uint(2)));
    uint _3344 = uint(int(uint(int(_3342)) >> uint(2)));
    int _3346 = int(_3342) & 3;
    float _3348 = (*spvDescriptorSet0.vp_c15)._m0[int(_3344)][_3346];
    int _3350 = int(_3342) + 1;
    uint _3352 = uint(int(uint(_3350) >> uint(2)));
    int _3354 = _3350 & 3;
    float _3356 = (*spvDescriptorSet0.vp_c15)._m0[int(_3352)][_3354];
    float _3358 = _2918 * _3146;
    float _3360 = rsqrt(_3280);
    float _3362 = fma(_1043, _3138, _3358);
    float _3364 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3366 = fma(_2940, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3364);
    float _3368 = precise::clamp(_3366, 0.0, 1.0);
    int _3370 = as_type<int>((*spvDescriptorSet0.vp_c15)._m0[23].w);
    int _3372 = as_type<int>(_3102);
    if (!_3164)
    {
        int _3374 = _3296 << 2;
        _3370 = _3374;
    }
    int _3376 = _3370;
    float _3378 = fma(_1045, _3180, _3338);
    float _3380 = _3316 * 0.693147182464599609375;
    int _3382 = _3376;
    if (!_3164)
    {
        int _3384 = 12 & _3376;
        _3382 = _3384;
    }
    int _3386 = _3382;
    float _3388 = _3378 + _3188;
    float _3390 = _2918 * _3270;
    float _3392 = _2918 * _3226;
    float _3394 = _3360 * _3198;
    float _3396 = _3360 * _3236;
    float _3398 = _3360 * _3232;
    float _3400 = fma(_1043, _3218, _3392);
    float _3402 = fma(_1043, _3262, _3390);
    float _3404 = -_3368;
    float _3406 = _3404 + 1.0;
    float _3408 = fma(_1045, _3306, _3362);
    float _3410 = _3394 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3412 = 1.0 / _3388;
    float _3414 = _3226;
    if (!_3164)
    {
        float _3416 = -_3286;
        float _3418 = _3028 + _3416;
        _3414 = _3418;
    }
    float _3420 = _3414;
    float _3422 = _3408 + _3314;
    float _3424 = _2894 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (!_3164)
    {
        uint _3426 = uint(int(uint(_3296) >> uint(2)));
        _3038 = int(_3426);
    }
    int _3428 = _3038;
    float2 _9259 = float2(_2938, _3278);
    float _3430 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9259, float2(0.0), isnan(_9259)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9259, float2(0.0), isnan(_9259)), level(0.0)).x;
    float _3432 = fma(_1045, _3326, _3402);
    float _3434 = -_3410;
    float _3436 = fma(_3396, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3434);
    float _3438 = abs(_3406);
    float _3440 = log2(_3438);
    float _3442 = _2894 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3444 = fma(_2896, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3424);
    float _3446 = -_3398;
    float _3448 = fma(_3446, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3436);
    if (!_3164)
    {
        int _3450 = _3428 << 4;
        int _3452 = _3450 + _3386;
        _3372 = _3452;
    }
    int _3454 = _3372;
    float _3456 = fma(_2896, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3442);
    float _3458 = fma(_1045, _3348, _3400);
    float _3460 = fma(_2898, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3444);
    float _3462 = _3422 * _3412;
    float _3464 = fma(_2898, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3456);
    float _3466 = _3458 + _3356;
    float _3468 = _2894 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3470 = fma(_3448, -0.5, 0.5);
    bool _3472 = _3462 >= 0.0;
    float _3474 = _3466 * _3412;
    float _3476 = fma(_2896, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3468);
    float _3478 = _3440 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _3480 = _3462 <= 1.0;
    bool _3482 = _3480 && _3472;
    float _3484 = _3464 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3486 = fma(_2898, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3476);
    float _3488 = exp2(_3478);
    bool _3490 = _3474 >= 0.0;
    bool _3492 = _3490 && _3482;
    float _3494 = _3484 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3496 = _3486 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3498 = fma(_3448, 0.5, 0.5);
    bool _3500 = _3474 <= 1.0;
    bool _3502 = _3500 && _3492;
    float _3504 = as_type<float>(_3428);
    if (!_3164)
    {
        int _3506 = _3454 + 400;
        uint _3508 = uint(int(uint(_3506) >> uint(2)));
        uint _3510 = uint(int(uint(int(_3508)) >> uint(2)));
        int _3512 = int(_3508) & 3;
        float _3514 = (*spvDescriptorSet0.vp_c15)._m0[int(_3510)][_3512];
        _3504 = _3514;
    }
    float _3516 = _3504;
    float _3518 = fma(_3496, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3494);
    float _3520 = _3460 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3522 = sqrt(_3470);
    float _3524 = fma(_3242, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3518);
    float _3526 = _3432 + _3334;
    float _3528 = _3484 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3530 = _3396 + 1.0;
    float _3532 = fma(_3498, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3534 = fma(_3520, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3524);
    float _3536 = fma(_3496, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3528);
    float _3538 = -_3396;
    float _3540 = fma(_3488, _3530, _3538);
    float _3542 = _3530;
    if (_3502)
    {
        float _3544 = float(_3080);
        _3542 = _3544;
    }
    float _3546 = _3542;
    float _3548 = fma(_3498, _3532, -0.212114393711090087890625);
    float _3550 = 1.0 / _3534;
    float _3552 = _3484 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3554 = _3380 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3556 = fma(_3498, _3548, 1.570728778839111328125);
    float _3558 = fma(_3242, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3536);
    float _3560 = fma(_3496, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3552);
    float _3562 = _3522 * 0.636619746685028076171875;
    float _3564 = _3526 * _3412;
    float _3566 = _3546;
    float _3568 = _3564;
    if (_3502)
    {
        float _3570 = rint(_3546);
        float _3572 = precise::max(_3570, 0.0);
        uint _3574 = uint(_3572);
        uint _3576 = clamp(_3574, 0u, 65535u);
        _3566 = as_type<float>(_3576);
    }
    float _3578 = _3566;
    float _3580 = fma(_3242, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3560);
    float _3582 = fma(_3520, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3558);
    float _3584 = -_3556;
    float _3586 = fma(_3562, _3584, 1.0);
    float _3588 = fma(_3540, 0.5, 0.5);
    float _3590 = fma(_3520, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3580);
    float _3592 = _3460;
    if (!_3164)
    {
        float _3594 = floor(_2992);
        _3592 = _3594;
    }
    float _3596 = _3592;
    float _3598 = _3582 * _3550;
    float _3600 = _3590 * _3550;
    float _3602 = fma(_3598, 0.5, 0.5);
    float _3604 = fma(_3600, -0.5, 0.5);
    float _3606 = _3578;
    if (_3502)
    {
        float3 _9569 = float3(_3462, _3474, float(as_type<int>(_3578)));
        float3 _9573 = select(_9569, float3(0.0), isnan(_9569));
        float _3608 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9573.xy, uint(rint(_9573.z)), _3564, level(0.0));
        _3606 = _3608;
    }
    float _3610 = _3606;
    float3 _9583 = float3(_3602, _3604, _3554);
    float _3612 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9583, float3(0.0), isnan(_9583)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9583, float3(0.0), isnan(_9583)), level(0.0)).x;
    float _3614 = _3596;
    if (!_3164)
    {
        float _3616 = -_3596;
        float _3618 = _2992 + _3616;
        _3614 = _3618;
    }
    float _3620 = _3614;
    float _3622 = _3412;
    if (!_3164)
    {
        float _3624 = rint(_3516);
        float _3626 = precise::max(_3624, 0.0);
        uint _3628 = uint(_3626);
        uint _3630 = clamp(_3628, 0u, 65535u);
        _3622 = as_type<float>(_3630);
    }
    float _3632 = _3622;
    float3 _9620 = float3(_3602, _3604, _3554);
    float4 _3635 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9620, float3(0.0), isnan(_9620)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9620, float3(0.0), isnan(_9620)), level(0.0)).xyzw;
    float _3637 = _3635.x;
    float _3639 = _3635.y;
    float _3641 = _3635.z;
    float _3643 = _3635.w;
    float2 _9636 = float2(_3586, _3588);
    float3 _3645 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9636, float2(0.0), isnan(_9636)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9636, float2(0.0), isnan(_9636)), level(0.0)).xyz;
    float _3647 = _3645.x;
    float _3649 = _3645.y;
    float _3651 = _3645.z;
    float _3653 = _3632;
    if (!_3164)
    {
        float3 _9657 = float3(_3620, _3420, float(as_type<int>(_3632)));
        float3 _9659 = select(_9657, float3(0.0), isnan(_9657));
        float _3655 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9659.xy, uint(rint(_9659.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9659.xy, uint(rint(_9659.z)), level(0.0)).x;
        _3653 = _3655;
    }
    float _3657 = _3653;
    float _3659 = abs(_3016);
    float _3661 = log2(_3659);
    float _3663 = _3484 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3665 = fma(_3496, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3663);
    float _3667 = fma(_3242, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3665);
    bool _3669 = _3016 <= 8000.0;
    bool _3671 = isnan(_3016);
    bool _3673 = _3669 || _3671;
    bool _3675 = isnan(8000.0);
    bool _3677 = _3673 || _3675;
    float _3679 = float(_3677);
    float _3681 = fma(_3520, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3667);
    float _3683 = _3440 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3685 = _3661 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.gl_Position.x = _3582;
    out.gl_Position.y = _3590;
    out.gl_Position.z = _3681;
    out.gl_Position.w = _3534;
    float _3687 = exp2(_3683);
    float _3689 = exp2(_3685);
    float _3691 = fma(_3689, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3693 = precise::clamp(_3691, 0.0, 1.0);
    float _3695 = fma(_3693, -2.0, 3.0);
    float _3697 = _3693 * _3693;
    float _3699 = _3697 * _3695;
    float _3701 = _3681 + _3534;
    float _3703 = _3701 * 0.5;
    float _3705 = -_3699;
    float _3707 = _3705 + 1.0;
    out.m_96.z = _3703;
    out.m_96.w = _3534;
    float _3709 = fma(_3707, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3699);
    float _3711 = -_3687;
    float _3713 = _3711 + 1.0;
    float _3715 = _3679 * _3709;
    float _3717 = _3679;
    float _3719 = _3582;
    float _3721 = _3681;
    if (!_3502)
    {
        _3717 = 1.0;
    }
    float _3723 = _3717;
    float _3725 = _3713 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3727 = _3715 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3729 = -_3430;
    float _3731 = _3729 + 1.0;
    float _3733 = _3723;
    float _3735 = _3727;
    if (_3502)
    {
        bool _3737 = _3610 >= _3564;
        bool _3739 = isnan(_3610);
        bool _3741 = _3737 || _3739;
        bool _3743 = isnan(_3564);
        bool _3745 = _3741 || _3743;
        float _3747 = float(_3745);
        _3733 = _3747;
    }
    float _3749 = _3733;
    float _3751 = _3731 * _3727;
    float _3753 = precise::clamp(_3751, 0.0, 1.0);
    float _3755 = _3749;
    if (_3164)
    {
        _3735 = 1.0;
    }
    float _3757 = _3735;
    float _3759 = _3757;
    if (!_3164)
    {
        int _3761 = _3296 << 4;
        int _3763 = _3761 + 2048;
        uint _3765 = uint(int(uint(_3763) >> uint(2)));
        uint _3767 = uint(int(uint(int(_3765)) >> uint(2)));
        int _3769 = int(_3765) & 3;
        float _3771 = (*spvDescriptorSet0.vp_c15)._m0[int(_3767)][_3769];
        int _3773 = int(_3765) + 1;
        uint _3775 = uint(int(uint(_3773) >> uint(2)));
        int _3777 = _3773 & 3;
        float _3779 = (*spvDescriptorSet0.vp_c15)._m0[int(_3775)][_3777];
        int _3781 = _3763 + 8;
        uint _3783 = uint(int(uint(_3781) >> uint(2)));
        uint _3785 = uint(int(uint(int(_3783)) >> uint(2)));
        int _3787 = int(_3783) & 3;
        float _3789 = (*spvDescriptorSet0.vp_c15)._m0[int(_3785)][_3787];
        int _3791 = int(_3783) + 1;
        uint _3793 = uint(int(uint(_3791) >> uint(2)));
        int _3795 = _3791 & 3;
        float _3797 = (*spvDescriptorSet0.vp_c15)._m0[int(_3793)][_3795];
        float _3799 = _2918 * _3779;
        float _3801 = fma(_1043, _3771, _3799);
        float _3803 = fma(_1045, _3789, _3801);
        float _3805 = _3803 + _3797;
        float _3807 = precise::clamp(_3805, 0.0, 1.0);
        float _3809 = -_3807;
        float _3811 = _3809 + _3657;
        float _3813 = fma(_3811, 500.0, 1.5);
        float _3815 = exp2(_3813);
        float _3817 = 0.0 + _3815;
        float _3819 = precise::clamp(_3817, 0.0, 1.0);
        _3759 = _3819;
        _3568 = _3815;
        _3719 = _3789;
    }
    float _3821 = _3759;
    float _3823 = _3568;
    float _3825 = _3719;
    float _3827 = _3749 * _3821;
    float _3829 = _3725 * _3612;
    float _3831 = -_3753;
    float _3833 = fma(_3831, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_98.x = _2896;
    out.m_98.y = _2894;
    out.m_98.z = _2898;
    bool _3835 = _2940 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3837 = isnan(_2940);
    bool _3839 = _3835 || _3837;
    bool _3841 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3843 = _3839 || _3841;
    float _3845 = _3643 * _3829;
    float _3847 = -_3827;
    float _3849 = fma(_3847, _3833, 1.0);
    float _3851 = precise::clamp(_3849, 0.0, 1.0);
    float _3853 = -_3725;
    float _3855 = _3853 + 1.0;
    float _3857 = _3651 * _3829;
    float _3859 = fma(_3647, _3845, _3637);
    float _3861 = fma(_3649, _3845, _3639);
    float _3863 = _3643 * _3855;
    float _3865 = _3851 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3867 = fma(_3643, _3857, _3641);
    out.m_100.x = _3865;
    float _3869 = _3825;
    float _3871 = _3823;
    float _3873 = _3855;
    float _3875 = _3851;
    if (!_3843)
    {
        _3721 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3877 = _3721;
    float _3879 = _3877;
    float _3881 = _3877;
    if (!_3843)
    {
        _3755 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3883 = _3755;
    out.m_102.x = _3859;
    out.m_102.y = _3861;
    out.m_102.z = _3867;
    out.m_102.w = _3863;
    float _3885 = _3883;
    float _3887 = _3883;
    if (!_3843)
    {
        _3869 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3889 = _3869;
    float _3891 = _3889;
    float _3893 = _3889;
    if (!_3843)
    {
        _3871 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3895 = _3871;
    float _3897 = _3895;
    float _3899 = _3895;
    if (!_3843)
    {
        _3873 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3901 = _3873;
    float _3903 = _3901;
    float _3905 = _3901;
    if (!_3843)
    {
        _3875 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3907 = _3875;
    bool _3909 = !_3843;
    float _3911 = _3907;
    float _3913 = _3907;
    if (!_3909)
    {
        bool _3915 = _2940 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3917 = isnan(_2940);
        bool _3919 = _3915 || _3917;
        bool _3921 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3923 = _3919 || _3921;
        if (!_3923)
        {
            float _3925 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3927 = _2940 + _3925;
            float _3929 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3931 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3929;
            float _3933 = 1.0 / _3931;
            float _3935 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3937 = _3935 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3939 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3941 = _3939 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3943 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3945 = _3943 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3947 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3949 = _3947 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3951 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3953 = _3951 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3955 = _3927 * _3933;
            float _3957 = precise::clamp(_3955, 0.0, 1.0);
            float _3959 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3961 = _3959 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3963 = fma(_3957, _3937, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3965 = fma(_3957, _3961, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3967 = fma(_3957, _3941, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3969 = fma(_3957, _3945, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3971 = fma(_3957, _3949, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3973 = fma(_3957, _3953, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3887 = _3965;
            _3905 = _3971;
            _3881 = _3963;
            _3899 = _3969;
            _3893 = _3967;
            _3913 = _3973;
            _3975 = true;
        }
        else
        {
            bool _3977 = _2940 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3979 = isnan(_2940);
            bool _3981 = _3977 || _3979;
            bool _3983 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3985 = _3981 || _3983;
            if (!_3985)
            {
                _3879 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3987 = _3879;
            _3881 = _3987;
            if (!_3985)
            {
                _3885 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3989 = _3885;
            _3887 = _3989;
            if (!_3985)
            {
                _3891 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3991 = _3891;
            _3893 = _3991;
            if (!_3985)
            {
                _3897 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3993 = _3897;
            _3899 = _3993;
            if (!_3985)
            {
                _3903 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3995 = _3903;
            _3905 = _3995;
            if (!_3985)
            {
                _3911 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3997 = _3911;
            bool _3999 = !_3985;
            _3913 = _3997;
            if (!_3999)
            {
                bool _4001 = _2940 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4003 = isnan(_2940);
                bool _4005 = _4001 || _4003;
                bool _4007 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4009 = _4005 || _4007;
                if (!_4009)
                {
                    float _4011 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4013 = _2940 + _4011;
                    float _4015 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4017 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4015;
                    float _4019 = 1.0 / _4017;
                    float _4021 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4023 = _4021 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4025 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4027 = _4025 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4029 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4031 = _4029 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4033 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4035 = _4033 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4037 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4039 = _4037 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4041 = _4013 * _4019;
                    float _4043 = precise::clamp(_4041, 0.0, 1.0);
                    float _4045 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4047 = _4045 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4049 = fma(_4043, _4023, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4051 = fma(_4043, _4047, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4053 = fma(_4043, _4027, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4055 = fma(_4043, _4031, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4057 = fma(_4043, _4035, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4059 = fma(_4043, _4039, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3887 = _4051;
                    _3905 = _4057;
                    _3881 = _4049;
                    _3899 = _4055;
                    _3893 = _4053;
                    _3913 = _4059;
                    _3975 = true;
                }
                else
                {
                    _3887 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3905 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3881 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3899 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3893 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3913 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3975 = false;
    float _4061 = _3887;
    float _4063 = _3905;
    float _4065 = _3881;
    float _4067 = _3899;
    float _4069 = _3893;
    float _4071 = _3913;
    float _4073 = fma(_2798, -0.5, 0.5);
    float _4075 = precise::clamp(_4073, 0.0, 1.0);
    float _4077 = -_4061;
    float _4079 = _4077 + _4063;
    float _4081 = -_4065;
    float _4083 = _4081 + _4067;
    float _4085 = -_4069;
    float _4087 = _4085 + _4071;
    bool _4089 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4091 = fma(_4075, _4079, _4061);
    float _4093 = fma(_4075, _4083, _4065);
    float _4095 = fma(_4075, _4087, _4069);
    float _4097 = _4091 * 0.586610972881317138671875;
    out.m_104.x = 0.0;
    float _4099 = fma(_4093, 0.298911988735198974609375, _4097);
    float _4101 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4103 = fma(_4095, 0.114477999508380889892578125, _4099);
    out.m_63.x = _4101;
    float _4105 = -_4103;
    float _4107 = _4093 + _4105;
    float _4109 = -_4103;
    float _4111 = _4091 + _4109;
    float _4113 = -_4103;
    float _4115 = _4095 + _4113;
    float _4117 = fma(_4107, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4103);
    float _4119 = fma(_4111, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4103);
    float _4121 = fma(_4115, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4103);
    out.m_106.x = _4117;
    out.m_106.y = _4119;
    out.m_106.z = _4121;
    if (!_4089)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4123 = -_2894;
    float _4125 = _4123 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4127 = -_2896;
    float _4129 = _4127 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4131 = -_2898;
    float _4133 = _4131 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4135 = _4125 * _4125;
    float _4137 = fma(_4129, _4129, _4135);
    float _4139 = fma(_4133, _4133, _4137);
    float _4141 = sqrt(_4139);
    float _4143 = rsqrt(_4139);
    float _4145 = -_4141;
    float _4147 = _4145 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4149 = _4147 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4151 = precise::clamp(_4149, 0.0, 1.0);
    float _4153 = _4129 * _4143;
    float _4155 = _4125 * _4143;
    float _4157 = abs(_4151);
    float _4159 = log2(_4157);
    float _4161 = _4133 * _4143;
    float _4163 = _4153 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4165 = _2798 * _4155;
    float _4167 = -_4155;
    float _4169 = -_4163;
    float _4171 = fma(_4167, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4169);
    float _4173 = fma(_2794, _4153, _4165);
    float _4175 = -_4161;
    float _4177 = fma(_4175, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4171);
    float _4179 = fma(_2800, _4161, _4173);
    float _4181 = precise::clamp(_4179, 0.0, 1.0);
    float _4183 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4185 = _4177 + _4183;
    float _4187 = _4159 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4189 = _4185 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4191 = precise::clamp(_4189, 0.0, 1.0);
    float _4193 = exp2(_4187);
    float _4195 = _4193 * _4191;
    float _4197 = _4181 * _4195;
    float _4199 = _4197 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4201 = _4197 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4203 = _4197 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_104.x = _4199;
    out.m_104.y = _4201;
    out.m_104.z = _4203;
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
    bool _3975 = false;
    bool _2850 = false;
    bool _223 = false;
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
    float _133 = as_type<float>(_125);
    if (!_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _131;
    float _137 = _135;
    if (!_129)
    {
        out.m_63.x = 0.0;
    }
    int _139 = 0;
    if (!_129)
    {
        float _141 = _135 * 5.0;
        _139 = as_type<int>(_141);
    }
    int _143 = _139;
    int _145 = _143;
    if (!_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4262 = as_type<float>(_143);
        out.gl_Position.z = _4262;
    }
    if (!_129)
    {
        return out;
    }
    float _147 = in.m_65.w;
    bool _149 = _147 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _151 = isnan(_147);
    bool _153 = _149 || _151;
    bool _155 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _157 = _153 || _155;
    float _159 = -_147;
    float _161 = _159 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _163 = 0.0;
    float _165 = _161;
    if (_157)
    {
        float _167 = float(_125);
        _163 = _167;
    }
    float _169 = _163;
    bool _171 = _161 >= _169;
    bool _173 = !_157;
    bool _175 = _171 || _173;
    if (_175)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _177 = _137;
    if (_175)
    {
        out.m_63.x = 0.0;
    }
    if (_175)
    {
        float _179 = _177 * 5.0;
        _145 = as_type<int>(_179);
    }
    int _181 = _145;
    if (_175)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4331 = as_type<float>(_181);
        out.gl_Position.z = _4331;
    }
    if (_175)
    {
        return out;
    }
    float _183 = as_type<float>(int(gl_VertexIndex));
    bool _185 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _187 = as_type<int>(_183) & 1;
    bool _189 = _187 != 0;
    int _191 = as_type<int>(_183) & 2;
    bool _193 = _191 != 0;
    bool _195 = !_189;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_193;
    float _201 = _199 ? (-0.5) : 0.5;
    bool _203 = !_185;
    float _221;
    if (!_203)
    {
        float _205 = in.m_70.x;
        float _207 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _209 = _205 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _211 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[12].x, _161);
        float _213 = _211 * _207;
        float _215 = floor(_213);
        float _217 = -_215;
        float _219 = _213 + _217;
        _221 = _219;
        _223 = true;
    }
    else
    {
        float _225 = float(_125);
        float _227 = 1.0 / _225;
        float _229 = _161 * _227;
        _221 = _229;
    }
    _223 = false;
    float _231 = _221;
    float _233 = in.m_70.x;
    float _235 = in.m_70.y;
    float _237 = in.m_70.z;
    float _239 = in.m_70.w;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _243 = _231 + _241;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _247 = _231 + _245;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _249;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _255 = _253 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _257;
    float _261 = 1.0 / _251;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _265 = _263 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _267;
    int _271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _273 = _271 != 0;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _277 = _231 + _275;
    float _279 = 1.0 / _255;
    float _281 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _283 = _231 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _285 = isnan(_231);
    bool _287 = _283 || _285;
    bool _289 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _291 = _287 || _289;
    float _293 = float(_291);
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _299 = _231 + _297;
    float _301 = 1.0 / _265;
    float _303 = _233 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _305 = _299 * _261;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _309 = _231 + _307;
    float _311 = -_281;
    float _313 = fma(_303, 2.0, _311);
    float _315 = _233 * 2.0;
    float _317 = 1.0 / _269;
    float _319 = _237 * 2.0;
    float _321 = _309 * _279;
    float _323 = _233 + _235;
    float _325 = _233 + (-0.5);
    float _327 = _323 + (-1.0);
    float _329 = 1.0 / _259;
    float _331 = _235 * 2.0;
    float _333 = _237 + _235;
    float _335 = _243 * _301;
    float _337 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _339 = _333 + (-1.0);
    bool _341 = _231 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _343 = isnan(_231);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = floor(_331);
    float _355 = _235 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _357 = _247 * _317;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _361 = fma(_355, -2.0, _295);
    float _363 = -_161;
    float _365 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[76].x, _313);
    float _367 = floor(_319);
    float _369 = _277 * _329;
    float _371 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _383 = float(_125);
    float _385 = fma(_375, _305, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _387 = floor(_315);
    bool _389 = _353 > 0.0;
    float _391 = fma(_379, _321, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _393 = _353 >= 0.0;
    bool _395 = isnan(_353);
    bool _397 = _393 || _395;
    bool _399 = isnan(0.0);
    bool _401 = _397 || _399;
    float _403 = fma(_161, (*spvDescriptorSet0.vp_c9)._m0[76].y, _361);
    bool _405 = _231 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _407 = isnan(_231);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = 1.0 / _383;
    float _419 = _237 + _233;
    bool _421 = _367 > 0.0;
    float _423 = -_415;
    float _425 = _423 + 1.0;
    bool _427 = _367 >= 0.0;
    bool _429 = isnan(_367);
    bool _431 = _427 || _429;
    bool _433 = isnan(0.0);
    bool _435 = _431 || _433;
    float _437 = _419 + (-1.0);
    bool _439 = _231 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _441 = isnan(_231);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _453 = _387 > 0.0;
    float _455 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _465 = _387 >= 0.0;
    bool _467 = isnan(_387);
    bool _469 = _465 || _467;
    bool _471 = isnan(0.0);
    bool _473 = _469 || _471;
    float _475 = -_293;
    float _477 = _475 + 1.0;
    float _479 = _449 * _425;
    float _481 = fma(_463, _321, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _483 = -_449;
    float _485 = _483 + 1.0;
    float _487 = _415 * _477;
    bool _489 = _231 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _491 = isnan(_231);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _503 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _501;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _505;
    bool _509 = _231 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _511 = isnan(_231);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    float _521 = fma(_459, _305, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _523 = -_499;
    float _525 = _523 + 1.0;
    float _527 = fma(_507, _369, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    int _529 = as_type<int>(_507);
    if (_273)
    {
        _529 = 0;
    }
    int _531 = _529;
    float _533 = -_351;
    float _535 = _533 + 1.0;
    int _537 = _531;
    if (!_273)
    {
        _537 = 1;
    }
    int _539 = _537;
    float _541 = fma(_503, _369, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    int _543 = _473 ? 0 : 1;
    float _545 = _519 * _525;
    bool _547 = _539 != 1;
    float _549 = _499 * _535;
    float _551 = _351 * _485;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _561 = _385 * _545;
    float _563 = _521 * _545;
    float _565 = fma(_555, _335, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    int _567 = _401 ? 0 : 1;
    float _569 = fma(_559, _335, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    int _571 = _435 ? 0 : 1;
    float _573 = -_519;
    float _575 = _573 + 1.0;
    int _577 = ~_567;
    int _579 = _577 + 1;
    int _581 = _579 + 1;
    float _583 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _585 = int(_583);
    int _587 = _581;
    float _589 = as_type<float>(_539);
    float _591 = _561;
    if (!_389)
    {
        int _593 = ~_567;
        int _595 = _593 + 1;
        _587 = _595;
    }
    int _597 = _587;
    float _599 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[143].x, _561);
    int _601 = ~_571;
    int _603 = _601 + 1;
    int _605 = _603 + 1;
    float _607 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[143].y, _563);
    int _609 = _605;
    if (!_547)
    {
        _589 = _235;
    }
    float _611 = _589;
    float _613 = _417 * _161;
    float _615 = _611;
    if (!_421)
    {
        int _617 = ~_571;
        int _619 = _617 + 1;
        _609 = _619;
    }
    int _621 = _609;
    float _623 = fma(_391, _549, _599);
    if (_547)
    {
        _615 = _233;
    }
    float _625 = _615;
    float _627 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _629 = log2(_627);
    int _631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _633 = _631 != 0;
    int _635 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _637 = _635 != 0;
    int _639 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _641 = _639 != 0;
    float _643 = fma(_481, _549, _607);
    int _645 = ~_543;
    int _647 = _645 + 1;
    int _649 = _647 + 1;
    float _651 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[83].z, _359);
    float _653 = fma(_527, _551, _623);
    int _655 = _649;
    float _657 = _625;
    if (!_453)
    {
        int _659 = ~_543;
        int _661 = _659 + 1;
        _655 = _661;
    }
    int _663 = _655;
    if (!_547)
    {
        _657 = _235;
    }
    float _665 = _657;
    float _667 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _669 = int(_667);
    float _671 = _665;
    if (_547)
    {
        _671 = _233;
    }
    float _673 = _671;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_547)
    {
        _591 = _237;
    }
    float _677 = _591;
    float _679 = fma(_565, _479, _653);
    bool _681 = !_637;
    int _683 = _681 ? 0 : 1;
    float _685 = _673 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _687 = !_633;
    int _689 = _687 ? 0 : 1;
    bool _691 = !_641;
    int _693 = _691 ? 0 : 1;
    float _695 = -_381;
    float _697 = fma(_685, 2.0, _695);
    float _699 = _677;
    if (_547)
    {
        _699 = _235;
    }
    float _701 = _699;
    float _703 = _629 * _161;
    int _705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _707 = _705 != 0;
    int _709 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _711 = _709 != 0;
    int _713 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _715 = _713 != 0;
    if (!_547)
    {
        _133 = _237;
    }
    float _717 = _133;
    float _719 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[83].w, _675);
    float _721 = _717;
    if (_547)
    {
        _721 = _235;
    }
    float _723 = _721;
    float _725 = exp2(_703);
    bool _727 = !_711;
    int _729 = _727 ? 0 : 1;
    float _731 = fma(_161, (*spvDescriptorSet0.vp_c9)._m0[82].w, _719);
    bool _733 = !_707;
    int _735 = _733 ? 0 : 1;
    int _737 = abs(_729);
    int _739 = abs(_735);
    float _741 = _723 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _743 = float(_669);
    float _745 = float(_739);
    float _747 = fma(_741, -2.0, _451);
    float _749 = 1.0 / _743;
    float _751 = in.m_72.x;
    float _753 = in.m_72.y;
    float _755 = in.m_72.z;
    float _757 = float(_621);
    float _759 = -_725;
    float _761 = _759 + 1.0;
    float _763 = float(_585);
    float _765 = float(_663);
    float _767 = _745 * _757;
    float _769 = float(_737);
    float _771 = 1.0 / _763;
    bool _773 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _775 = isnan(0.0);
    bool _777 = _773 || _775;
    bool _779 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _781 = _777 || _779;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _785 = 1.0 + _783;
    bool _787 = !_715;
    int _789 = _787 ? 0 : 1;
    float _791 = _769 * _765;
    float _793 = _749 * _161;
    float _795 = _781 ? _761 : 0.0;
    float _797 = fma(_161, (*spvDescriptorSet0.vp_c9)._m0[82].z, _651);
    float _799 = 1.0 / _785;
    float _801 = _767 * (-2.0);
    float _803 = fma(_161, (*spvDescriptorSet0.vp_c9)._m0[81].y, _747);
    bool _805 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _807 = isnan(1.0);
    bool _809 = _805 || _807;
    bool _811 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _813 = _809 || _811;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _817 = abs(_789);
    float _819 = -_161;
    float _821 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[81].x, _697);
    float _823 = fma(_801, _751, _751);
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _827 = fma(_337, _801, _337);
    float _829 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[78].z, _815);
    float _831 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[78].w, _825);
    float _833 = float(_597);
    float _835 = _771 * _161;
    float _837 = float(_817);
    float _839 = fma(_161, (*spvDescriptorSet0.vp_c9)._m0[77].z, _829);
    float _841 = fma(_161, (*spvDescriptorSet0.vp_c9)._m0[77].w, _831);
    if (_813)
    {
        float _843 = _795 * _799;
        _165 = _843;
    }
    float _845 = _165;
    float _847 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[196].x, _823);
    float _849 = _837 * _833;
    float _851 = _791 * (-2.0);
    float _853 = _235 + (-0.5);
    float _855 = fma(_827, _845, _847);
    float _857 = _849 * (-2.0);
    float _859 = fma(_851, _753, _753);
    float _861 = _855 * 0.15915493667125701904296875;
    float _863 = fma(_541, _551, _643);
    float _865 = fma(_455, _857, _455);
    float _867 = fma(_857, _755, _755);
    float _869 = in.m_74.x;
    float _871 = in.m_74.y;
    float _873 = fma(_371, _851, _371);
    float _875 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[196].y, _859);
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _877;
    float _881 = _237 + (-0.5);
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _883;
    float _887 = fma(_873, _845, _875);
    float _889 = fma(_879, _357, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _891 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[196].z, _867);
    float _893 = fma(_885, _357, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _895 = fma(_569, _479, _863);
    float _897 = _887 * 0.15915493667125701904296875;
    float _899 = in.m_60.x;
    float _901 = in.m_60.y;
    float _903 = in.m_60.z;
    float _905 = fma(_865, _845, _891);
    float _907 = fma(_893, _487, _895);
    float _909 = fma(_889, _487, _679);
    float _911 = in.m_76.x;
    float _913 = in.m_76.y;
    float _915 = in.m_76.z;
    float _917 = in.m_76.w;
    float _919 = _905 * 0.15915493667125701904296875;
    float _921 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[148].y, _907);
    float _923 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[148].x, _909);
    float _925 = _861 * 6.283185482025146484375;
    float _927 = sin(_925);
    float _929 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    float _931 = _921 * _871;
    float _933 = _923 * _869;
    float _935 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _197);
    float _937 = _861 * 6.283185482025146484375;
    float _939 = cos(_937);
    float _941 = _933 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _943 = _931 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _945 = in.m_78.x;
    float _947 = in.m_78.y;
    float _949 = in.m_78.z;
    float _951 = in.m_78.w;
    float _953 = _941 * _935;
    float _955 = _943 * _929;
    float _957 = _897 * 6.283185482025146484375;
    float _959 = sin(_957);
    float _961 = _901 * _913;
    float _963 = _897 * 6.283185482025146484375;
    float _965 = cos(_963);
    float _967 = fma(_899, _911, _961);
    float _969 = fma(_903, _915, _967);
    float _971 = _919 * 6.283185482025146484375;
    float _973 = cos(_971);
    float _975 = _927 * _959;
    float _977 = _919 * 6.283185482025146484375;
    float _979 = sin(_977);
    float _981 = _939 * _965;
    float _983 = _927 * _965;
    float _985 = _939 * _973;
    float _987 = _939 * _959;
    float _989 = _927 * _973;
    float _991 = _965 * _973;
    float _993 = _985 * _955;
    float _995 = _959 * _973;
    float _997 = _989 * _955;
    float _999 = fma(_979, _981, _975);
    float _1001 = -_987;
    float _1003 = fma(_979, _983, _1001);
    float _1005 = -_983;
    float _1007 = fma(_979, _987, _1005);
    float _1009 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1011 = -_955;
    float _1013 = _979 * _1011;
    float _1015 = fma(_999, _953, _993);
    float _1017 = fma(_979, _975, _981);
    float _1019 = _901 * _947;
    float _1021 = fma(_991, _953, _1013);
    float _1023 = fma(_1007, _1009, _1015);
    float _1025 = fma(_1003, _953, _997);
    float _1027 = fma(_899, _945, _1019);
    float _1029 = fma(_995, _1009, _1021);
    float _1031 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1033 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1035 = fma(_1017, _1009, _1025);
    float _1037 = fma(_903, _949, _1027);
    float _1039 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1031);
    float _1041 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1033);
    float _1043 = _969 + _917;
    float _1045 = _1037 + _951;
    float _1047 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1039);
    float _1049 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1041);
    float _1051 = _1047 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1053 = _1049 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1055 = _1043 + _1051;
    float _1057 = _1045 + _1053;
    float _1059 = in.m_80.x;
    float _1061 = in.m_80.y;
    float _1063 = in.m_80.z;
    float _1065 = in.m_80.w;
    float _1067 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1069 = _1055 + _1067;
    float _1071 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1073 = _1057 + _1071;
    float _1075 = _1069 * _1069;
    float _1077 = _1073 * _1073;
    float _1079 = _1075 + _1077;
    float _1081 = sqrt(_1079);
    float _1083 = _901 * _1061;
    float _1085 = fma(_899, _1059, _1083);
    bool _1087 = _1081 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1089 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1091 = _1081 + _1089;
    float _1093 = fma(_903, _1063, _1085);
    float _1095 = _891;
    float _1097 = _1079;
    float _1099 = _1091;
    float _1101 = _1023;
    float _1103 = _901;
    float _1105 = _1055;
    float _1107 = _1057;
    float _1109 = _1075;
    if (_1087)
    {
        float _1111 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1095 = _1111;
    }
    float _1113 = _1095;
    if (_1087)
    {
        float _1115 = rsqrt(_1079);
        _1097 = _1115;
    }
    float _1117 = _1097;
    float _1119 = _1117;
    if (_1087)
    {
        float _1121 = _1091 * _1113;
        _1099 = _1121;
    }
    float _1123 = _1099;
    float _1125 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (_1087)
    {
        float _1127 = _1123 * 0.15915493667125701904296875;
        _1101 = _1127;
    }
    float _1129 = _1101;
    float _1131 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1125);
    float _1133 = _1093 + _1065;
    float _1135 = _899;
    if (_1087)
    {
        float _1137 = _1129 * 6.283185482025146484375;
        float _1139 = sin(_1137);
        _1135 = _1139;
    }
    float _1141 = _1135;
    float _1143 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1131);
    float _1145 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1147 = _1133 + _1145;
    float _1149 = _1147;
    if (_1087)
    {
        float _1151 = _1147 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1103 = _1151;
    }
    float _1153 = _1103;
    float _1155 = _1153;
    if (_1087)
    {
        float _1157 = fma(_1141, _1153, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1155 = _1157;
    }
    float _1159 = _1155;
    float _1161 = _1159;
    if (_1087)
    {
        float _1163 = _1117 * _1159;
        _1161 = _1163;
    }
    float _1165 = _1161;
    if (_1087)
    {
        float _1167 = fma(_1069, _1165, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1105 = _1167;
    }
    float _1169 = _1105;
    float _1171 = _1169;
    if (_1087)
    {
        float _1173 = fma(_1073, _1165, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1107 = _1173;
    }
    float _1175 = _1107;
    float _1177 = fma(_1169, 6.2500002968590706586837768554688e-05, 0.5);
    float _1179 = fma(_1175, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5870 = float2(_1177, _1179);
    float3 _1183 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5870, float2(0.0), isnan(_5870)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5870, float2(0.0), isnan(_5870)), level(0.0)).xyz;
    float _1185 = _1183.x;
    float _1187 = _1183.y;
    float _1189 = _1183.z;
    float _1191 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1193 = int(_1191);
    float _1195 = _1175;
    if (_273)
    {
        float _1197 = in.m_70.x;
        _1119 = _1197;
    }
    float _1199 = _1119;
    float _1201 = -_841;
    float _1203 = _1201 + 1.0;
    float _1205 = -_797;
    float _1207 = _1205 + 1.0;
    float _1209 = _1199;
    if (!_273)
    {
        float _1211 = in.m_70.y;
        _1209 = _1211;
    }
    float _1213 = _1209;
    float _1215 = -_839;
    float _1217 = _1215 + 1.0;
    float _1219 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1221 = trunc(_835);
    int _1223 = int(_1221);
    float _1225 = -_731;
    float _1227 = _1225 + 1.0;
    float _1229 = float(uint(_1193));
    float _1231 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1233 = int(_1231);
    int _1235 = ~_1193;
    int _1237 = _1235 + 1;
    bool _1239 = _1193 == 0;
    float _1241 = float(uint(_1223));
    float _1243 = 1.0 / _1229;
    float _1245 = float(uint(_1233));
    float _1247 = trunc(_793);
    int _1249 = int(_1247);
    int _1251 = ~_1233;
    int _1253 = _1251 + 1;
    bool _1255 = _1233 == 0;
    int _1257 = as_type<int>(_1243) + (-2);
    float _1259 = 1.0 / _1245;
    float _1261 = _1243;
    float _1263 = _1227;
    if (_273)
    {
        _1261 = 1.0;
    }
    float _1265 = _1261;
    float _1267 = _1265;
    if (!_273)
    {
        _1267 = 7.345489978790283203125;
    }
    float _1269 = _1267;
    float _1271 = as_type<float>(_1257) * _1241;
    float _1273 = trunc(_1271);
    float _1275 = precise::max(_1273, 0.0);
    uint _1278 = uint(_1275);
    float _1280 = float(uint(_1249));
    float _1282 = _1269 * _233;
    int _1284 = as_type<int>(_1259) + (-2);
    float _1286 = as_type<float>(_1284) * _1280;
    float _1288 = float(_1223);
    int _1290 = _1237 * int(_1278);
    int _1292 = _1290 + _1223;
    float _1294 = trunc(_1286);
    float _1296 = precise::max(_1294, 0.0);
    uint _1298 = uint(_1296);
    float _1300 = float(uint(_1292));
    float _1302 = as_type<float>(_1257) * _1300;
    float _1304 = float(_1193);
    float _1306 = floor(_1282);
    bool _1308 = _1288 >= _1304;
    bool _1310 = isnan(_1288);
    bool _1312 = _1308 || _1310;
    bool _1314 = isnan(_1304);
    bool _1316 = _1312 || _1314;
    float _1318 = float(_1316);
    int _1320 = ~_1193;
    int _1322 = _1320 + 1;
    float _1324 = trunc(_1302);
    float _1326 = precise::max(_1324, 0.0);
    uint _1328 = uint(_1326);
    float _1330 = -_1306;
    float _1332 = _1282 + _1330;
    float _1334 = trunc(_1318);
    int _1336 = int(_1334);
    int _1338 = int(_1278) + int(_1328);
    float _1340 = _1332 * _1304;
    int _1342 = _1253 * int(_1298);
    int _1344 = _1342 + _1249;
    float _1346 = _1304 * _613;
    float _1348 = as_type<float>(_1322);
    if (_273)
    {
        _1348 = 1.0;
    }
    float _1350 = _1348;
    float _1352 = float(uint(_1344));
    int _1354 = _1322 * _1338;
    int _1356 = _1354 + _1223;
    float _1358 = trunc(_1346);
    int _1360 = int(_1358);
    float _1362 = _1350;
    if (!_273)
    {
        _1362 = 1.2345600128173828125;
    }
    float _1364 = _1362;
    float _1366 = as_type<float>(_1284) * _1352;
    bool _1368 = uint(_1356) >= uint(_1193);
    int _1370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1372 = _1370 != 0;
    float _1374 = _1364 * _1213;
    bool _1376 = !_1368;
    int _1378 = _1376 ? 0 : (-1);
    float _1380 = trunc(_1366);
    float _1382 = precise::max(_1380, 0.0);
    uint _1384 = uint(_1382);
    bool _1386 = !_1372;
    int _1388 = _1386 ? 0 : 1;
    int _1390 = ~_1338;
    int _1392 = _1390 + _1378;
    int _1394 = _1392 + 1;
    int _1396 = abs(_1388);
    int _1398 = ~_1336;
    int _1400 = _1398 + 1;
    int _1402 = _1400 + 1;
    int _1404 = _1193 * _1394;
    int _1406 = _1404 + _1223;
    float _1408 = trunc(_1340);
    int _1410 = int(_1408);
    int _1412 = ~_1233;
    int _1414 = _1412 + 1;
    bool _1416 = !_1239;
    int _1418 = _1416 ? _1406 : (-1);
    int _1420 = int(_1298) + int(_1384);
    int _1422 = _1418 * _1402;
    int _1424 = _1193 + (-1);
    int _1426 = abs(_683);
    int _1428 = _1414 * _1420;
    int _1430 = _1428 + _1249;
    float _1432 = floor(_1374);
    int _1434 = _1336 * _1424;
    int _1436 = _1434 + _1422;
    int _1438 = _1410 * _1396;
    int _1440 = _1438 + _1223;
    float _1442 = float(_1233);
    float _1444 = float(_1249);
    int _1446 = _1436 * _1426;
    bool _1448 = uint(_1430) >= uint(_1233);
    int _1450 = abs(_689);
    bool _1452 = _1444 >= _1442;
    bool _1454 = isnan(_1444);
    bool _1456 = _1452 || _1454;
    bool _1458 = isnan(_1442);
    bool _1460 = _1456 || _1458;
    float _1462 = float(_1460);
    int _1464 = abs(_693);
    bool _1466 = !_1448;
    int _1468 = _1466 ? 0 : (-1);
    int _1470 = _1360 * _1450;
    int _1472 = _1470 + _1446;
    int _1474 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1476 = _1474 != 0;
    float _1478 = trunc(_1462);
    int _1480 = int(_1478);
    float _1482 = -_1432;
    float _1484 = _1374 + _1482;
    int _1486 = ~_1420;
    int _1488 = _1486 + _1468;
    int _1490 = _1488 + 1;
    int _1492 = _1440 * _1464;
    int _1494 = _1492 + _1472;
    bool _1496 = !_1476;
    int _1498 = _1496 ? 0 : 1;
    float _1500 = _1484 * _1442;
    int _1502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1504 = _1502 != 0;
    int _1506 = _1233 * _1490;
    int _1508 = _1506 + _1249;
    int _1510 = abs(_1498);
    float _1512 = _1442 * _613;
    bool _1514 = !_1504;
    int _1516 = _1514 ? 0 : 1;
    float _1518 = trunc(_1500);
    int _1520 = int(_1518);
    int _1522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1524 = _1522 != 0;
    int _1526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1528 = _1526 != 0;
    int _1530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1532 = _1530 != 0;
    int _1534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1536 = _1534 != 0;
    int _1538 = _1410 * _1510;
    int _1540 = _1538 + _1494;
    int _1542 = abs(_1516);
    int _1544 = ~_1480;
    int _1546 = _1544 + 1;
    int _1548 = _1546 + 1;
    bool _1550 = !_1255;
    int _1552 = _1550 ? _1508 : (-1);
    float _1554 = trunc(_1512);
    int _1556 = int(_1554);
    float _1558 = float(uint(_1540));
    bool _1560 = !_1528;
    int _1562 = _1560 ? 0 : 1;
    int _1564 = _1552 * _1548;
    bool _1566 = !_1524;
    int _1568 = _1566 ? 0 : 1;
    float _1570 = as_type<float>(_1257) * _1558;
    int _1572 = _1233 + (-1);
    int _1574 = abs(_1562);
    int _1576 = _1480 * _1572;
    int _1578 = _1576 + _1564;
    int _1580 = abs(_1568);
    float _1582 = trunc(_1570);
    float _1584 = precise::max(_1582, 0.0);
    uint _1586 = uint(_1584);
    int _1588 = _1578 * _1574;
    int _1590 = _1520 * _1542;
    int _1592 = _1590 + _1249;
    bool _1594 = !_1532;
    int _1596 = _1594 ? 0 : 1;
    int _1598 = ~_1193;
    int _1600 = _1598 + 1;
    int _1602 = _1556 * _1580;
    int _1604 = _1602 + _1588;
    bool _1606 = !_1536;
    int _1608 = _1606 ? 0 : 1;
    float _1610 = float(uint(_1592));
    int _1612 = abs(_1608);
    int _1614 = abs(_1596);
    float _1616 = float(uint(_1440));
    int _1618 = _1600 * int(_1586);
    int _1620 = _1618 + _1540;
    float _1622 = as_type<float>(_1284) * _1610;
    int _1624 = _1592 * _1614;
    int _1626 = _1624 + _1604;
    float _1628 = as_type<float>(_1257) * _1616;
    float _1630 = float(uint(_1620));
    int _1632 = _1520 * _1612;
    int _1634 = _1632 + _1626;
    float _1636 = trunc(_1622);
    float _1638 = precise::max(_1636, 0.0);
    uint _1640 = uint(_1638);
    int _1642 = ~_1233;
    int _1644 = _1642 + 1;
    float _1646 = as_type<float>(_1257) * _1630;
    int _1648 = ~_1193;
    int _1650 = _1648 + 1;
    float _1652 = float(uint(_1634));
    float _1654 = trunc(_1628);
    float _1656 = precise::max(_1654, 0.0);
    uint _1658 = uint(_1656);
    int _1660 = ~_1233;
    int _1662 = _1660 + 1;
    float _1664 = as_type<float>(_1284) * _1652;
    float _1666 = trunc(_1646);
    float _1668 = precise::max(_1666, 0.0);
    uint _1670 = uint(_1668);
    float _1672 = trunc(_1664);
    float _1674 = precise::max(_1672, 0.0);
    uint _1676 = uint(_1674);
    int _1678 = _1650 * int(_1658);
    int _1680 = _1678 + _1440;
    float _1682 = float(uint(_1680));
    int _1684 = _1644 * int(_1640);
    int _1686 = _1684 + _1592;
    int _1688 = int(_1586) + int(_1670);
    int _1690 = ~_1193;
    int _1692 = _1690 + 1;
    float _1694 = as_type<float>(_1257) * _1682;
    float _1696 = float(uint(_1686));
    int _1698 = _1662 * int(_1676);
    int _1700 = _1698 + _1634;
    float _1702 = as_type<float>(_1284) * _1696;
    float _1704 = trunc(_1694);
    float _1706 = precise::max(_1704, 0.0);
    uint _1708 = uint(_1706);
    float _1710 = float(uint(_1700));
    int _1712 = _1692 * _1688;
    int _1714 = _1712 + _1540;
    float _1716 = as_type<float>(_1284) * _1710;
    bool _1718 = uint(_1714) >= uint(_1193);
    float _1720 = trunc(_1702);
    float _1722 = precise::max(_1720, 0.0);
    uint _1724 = uint(_1722);
    int _1726 = ~_1233;
    int _1728 = _1726 + 1;
    bool _1730 = !_1718;
    int _1732 = _1730 ? 0 : (-1);
    int _1734 = int(_1658) + int(_1708);
    float _1736 = trunc(_1716);
    float _1738 = precise::max(_1736, 0.0);
    uint _1740 = uint(_1738);
    int _1742 = ~_1688;
    int _1744 = _1742 + _1732;
    int _1746 = _1744 + 1;
    int _1748 = _1193 * _1746;
    int _1750 = _1748 + _1540;
    int _1752 = ~_1193;
    int _1754 = _1752 + 1;
    int _1756 = int(_1640) + int(_1724);
    bool _1758 = !_1239;
    int _1760 = _1758 ? _1750 : (-1);
    int _1762 = _1754 * _1734;
    int _1764 = _1762 + _1440;
    int _1766 = _1760 & 3;
    bool _1768 = _1766 != 0;
    int _1770 = int(_1676) + int(_1740);
    int _1772 = _1760 & 3;
    bool _1774 = _1772 != 0;
    bool _1776 = uint(_1766) >= 2u;
    int _1778 = _1728 * _1770;
    int _1780 = _1778 + _1634;
    int _1782 = _1774 ? 0 : 1;
    bool _1784 = uint(_1764) >= uint(_1193);
    int _1786 = _1776 ? 0 : 1;
    bool _1788 = uint(_1780) >= uint(_1233);
    bool _1790 = !_1784;
    int _1792 = _1790 ? 0 : (-1);
    bool _1794 = !_1788;
    int _1796 = _1794 ? 0 : (-1);
    bool _1798 = uint(_1766) > 1u;
    int _1800 = ~_1734;
    int _1802 = _1800 + _1792;
    int _1804 = _1802 + 1;
    int _1806 = ~_1770;
    int _1808 = _1806 + _1796;
    int _1810 = _1808 + 1;
    int _1812 = ~_1233;
    int _1814 = _1812 + 1;
    int _1816 = _1193 * _1804;
    int _1818 = _1816 + _1440;
    int _1820 = ~_1782;
    int _1822 = _1820 + 1;
    int _1824 = _1822 + 1;
    int _1826 = _1233 * _1810;
    int _1828 = _1826 + _1634;
    bool _1830 = _239 > 0.5;
    int _1832 = _1814 * _1756;
    int _1834 = _1832 + _1592;
    bool _1836 = !_1239;
    int _1838 = _1836 ? _1818 : (-1);
    bool _1840 = !_1255;
    int _1842 = _1840 ? _1828 : (-1);
    int _1844 = _1824;
    if (!_1798)
    {
        int _1846 = ~_1782;
        int _1848 = _1846 + 1;
        _1844 = _1848;
    }
    int _1850 = _1844;
    int _1852 = _1760 >> 31;
    int _1854 = _1842 >> 31;
    bool _1856 = uint(_1834) >= uint(_1233);
    int _1858 = _1852 & 3;
    float _1860 = -_201;
    int _1862 = _1830 ? as_type<int>(_1860) : as_type<int>(_201);
    int _1864 = _1854 & 3;
    int _1866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1868 = _1866 != 0;
    int _1870 = _1760 + _1858;
    int _1872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1874 = _1872 != 0;
    int _1876 = _1842 + _1864;
    bool _1878 = !_1868;
    int _1880 = _1878 ? 0 : 1;
    int _1882 = _1842 & 3;
    bool _1884 = _1882 != 0;
    bool _1886 = !_1856;
    int _1888 = _1886 ? 0 : (-1);
    int _1890 = _1870 >> 2;
    bool _1892 = !_1874;
    float _1894 = _1892 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _1896 = _1876 >> 2;
    int _1898 = _1842 & 3;
    bool _1900 = _1898 != 0;
    bool _1902 = !_1884;
    int _1904 = _1902 ? 0 : 1;
    int _1906 = ~_1756;
    int _1908 = _1906 + _1888;
    int _1910 = _1908 + 1;
    bool _1912 = uint(_1882) > 1u;
    int _1914 = _1890 << 4;
    int _1916 = _1914 + 368;
    int _1918 = _1233 * _1910;
    int _1920 = _1918 + _1592;
    int _1922 = _1896 << 4;
    int _1924 = _1922 + 512;
    int _1926 = _1900 ? 0 : 1;
    bool _1928 = _1766 != 3;
    uint _1930 = uint(int(uint(_1924) >> uint(2)));
    uint _1932 = uint(int(uint(int(_1930)) >> uint(2)));
    int _1934 = int(_1930) & 3;
    float _1936 = (*spvDescriptorSet0.vp_c9)._m0[int(_1932)][_1934];
    int _1938 = int(_1930) + 1;
    uint _1940 = uint(int(uint(_1938) >> uint(2)));
    int _1942 = _1938 & 3;
    float _1944 = (*spvDescriptorSet0.vp_c9)._m0[int(_1940)][_1942];
    bool _1946 = _1766 != 3;
    int _1948 = ~_1926;
    int _1950 = _1948 + 1;
    int _1952 = _1950 + 1;
    int _1954 = _1952;
    float _1956 = _1894;
    if (!_1912)
    {
        int _1958 = ~_1926;
        int _1960 = _1958 + 1;
        _1954 = _1960;
    }
    int _1962 = _1954;
    bool _1964 = _1882 != 3;
    uint _1966 = uint(int(uint(_1916) >> uint(2)));
    uint _1968 = uint(int(uint(int(_1966)) >> uint(2)));
    int _1970 = int(_1966) & 3;
    float _1972 = (*spvDescriptorSet0.vp_c9)._m0[int(_1968)][_1970];
    int _1974 = int(_1966) + 1;
    uint _1976 = uint(int(uint(_1974) >> uint(2)));
    int _1978 = _1974 & 3;
    float _1980 = (*spvDescriptorSet0.vp_c9)._m0[int(_1976)][_1978];
    bool _1982 = !_1946;
    int _1984 = _1982 ? 0 : (-1);
    bool _1986 = uint(_1882) >= 2u;
    int _1988 = ~_1786;
    int _1990 = _1988 + 1;
    int _1992 = _1990 + 1;
    int _1994 = _1992;
    if (_1928)
    {
        int _1996 = ~_1786;
        int _1998 = _1996 + 1;
        _1994 = _1998;
    }
    int _2000 = _1994;
    bool _2002 = !_1768;
    int _2004 = _2002 ? 0 : 1;
    int _2006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2008 = _2006 != 0;
    int _2010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2012 = _2010 != 0;
    int _2014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2016 = _2014 != 0;
    int _2018 = _1986 ? 0 : 1;
    bool _2020 = !_1255;
    int _2022 = _2020 ? _1920 : (-1);
    bool _2024 = _1882 != 3;
    int _2026 = _1924 + 8;
    uint _2028 = uint(int(uint(_2026) >> uint(2)));
    uint _2030 = uint(int(uint(int(_2028)) >> uint(2)));
    int _2032 = int(_2028) & 3;
    float _2034 = (*spvDescriptorSet0.vp_c9)._m0[int(_2030)][_2032];
    int _2036 = int(_2028) + 1;
    uint _2038 = uint(int(uint(_2036) >> uint(2)));
    int _2040 = _2036 & 3;
    float _2042 = (*spvDescriptorSet0.vp_c9)._m0[int(_2038)][_2040];
    int _2044 = ~_2018;
    int _2046 = _2044 + 1;
    int _2048 = _2046 + 1;
    int _2050 = _2048;
    if (_1964)
    {
        int _2052 = ~_2018;
        int _2054 = _2052 + 1;
        _2050 = _2054;
    }
    int _2056 = _2050;
    int _2058 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2060 = _2058 != 0;
    int _2062 = _1916 + 8;
    uint _2064 = uint(int(uint(_2062) >> uint(2)));
    uint _2066 = uint(int(uint(int(_2064)) >> uint(2)));
    int _2068 = int(_2064) & 3;
    float _2070 = (*spvDescriptorSet0.vp_c9)._m0[int(_2066)][_2068];
    int _2072 = int(_2064) + 1;
    uint _2074 = uint(int(uint(_2072) >> uint(2)));
    int _2076 = _2072 & 3;
    float _2078 = (*spvDescriptorSet0.vp_c9)._m0[int(_2074)][_2076];
    float _2080 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2082 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2084 = abs(_1962);
    float _2086 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2088 = _2080 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2090 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2092 = _2082 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2094 = _2086 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2096 = abs(_1850);
    int _2098 = abs(_2004);
    out.m_82.x = _2088;
    out.m_82.y = _2092;
    out.m_82.z = _2094;
    out.m_82.w = _2090;
    int _2100 = ~_2096;
    int _2102 = _2100 + 1;
    int _2104 = _2102 + 1;
    bool _2106 = !_2024;
    int _2108 = _2106 ? 0 : (-1);
    bool _2110 = _233 > 0.5;
    int _2112 = _2104 * as_type<int>(_1980);
    bool _2114 = _235 > 0.5;
    float _2116 = -_197;
    int _2118 = _2110 ? as_type<int>(_2116) : as_type<int>(_197);
    float _2120 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2122 = int(_2120);
    float _2124 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2126 = _1219 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2128 = abs(_1904);
    float _2130 = _1007 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2132 = ~_2084;
    int _2134 = _2132 + 1;
    int _2136 = _2134 + 1;
    int _2138 = ~_2098;
    int _2140 = _2138 + 1;
    int _2142 = _2140 + 1;
    int _2144 = ~_2128;
    int _2146 = _2144 + 1;
    int _2148 = _2146 + 1;
    int _2150 = _2136 * as_type<int>(_1944);
    bool _2152 = _237 > 0.5;
    int _2154 = _2142 * as_type<int>(_1972);
    int _2156 = _2154 + _2112;
    float _2158 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2160 = _2148 * as_type<int>(_1936);
    int _2162 = _2160 + _2150;
    int _2164 = abs(_2000);
    float _2166 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2168 = int(_2166);
    float _2170 = _2124 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2172 = _2158 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2174 = abs(_2056);
    float _2176 = _985 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_84.x = _2126;
    out.m_84.y = _2170;
    out.m_84.z = _2172;
    int _2178 = abs(_2108);
    float _2180 = as_type<float>(_2164);
    float _2182 = _2130;
    if (_1087)
    {
        float _2184 = _1129 * 6.283185482025146484375;
        float _2186 = cos(_2184);
        _2180 = _2186;
    }
    float _2188 = _2180;
    int _2190 = ~_2164;
    int _2192 = _2190 + 1;
    int _2194 = _2192 + 1;
    int _2196 = abs(_1984);
    bool _2198 = !_2008;
    float _2200 = _2198 ? _201 : as_type<float>(_1862);
    int _2202 = _2194 * as_type<int>(_2070);
    int _2204 = _2202 + _2156;
    float _2206 = float(uint(_2168));
    int _2208 = abs(_1880);
    int _2210 = ~_2174;
    int _2212 = _2210 + 1;
    int _2214 = _2212 + 1;
    float _2216 = float(uint(_2122));
    int _2218 = ~_2178;
    int _2220 = _2218 + 1;
    int _2222 = _2220 + 1;
    int _2224 = _2214 * as_type<int>(_2034);
    int _2226 = _2224 + _2162;
    float _2228 = 1.0 / _2216;
    int _2230 = _2222 * as_type<int>(_2042);
    int _2232 = _2230 + _2226;
    int _2234 = ~_2196;
    int _2236 = _2234 + 1;
    int _2238 = _2236 + 1;
    int _2240 = abs(_2122);
    int _2242 = abs(as_type<int>(_1894));
    int _2244 = _2238 * as_type<int>(_2078);
    int _2246 = _2244 + _2204;
    float _2248 = 1.0 / _2206;
    int _2250 = ~_2208;
    int _2252 = _2250 + 1;
    int _2254 = _2252 + 1;
    if (_1087)
    {
        float _2256 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2258 = _1175 + _2256;
        _1956 = _2258;
    }
    float _2260 = _1956;
    float _2262 = _985 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2264 = abs(_2168);
    int _2266 = _2246 * _2254;
    float _2268 = float(uint(_2240));
    float _2270 = -_979;
    float _2272 = fma(_2270, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2262);
    float _2274 = _985 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2276 = ~_2242;
    int _2278 = _2276 + 1;
    int _2280 = _2278 + 1;
    int _2282 = _1838 * _2208;
    int _2284 = _2282 + _2266;
    float _2286 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2272);
    float _2288 = -_979;
    float _2290 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2274);
    float _2292 = float(uint(_2264));
    int _2294 = _2232 * _2280;
    int _2296 = as_type<int>(_2228) + (-2);
    float _2298 = 1.0 / _2268;
    int _2300 = as_type<int>(_2248) + (-2);
    int _2302 = _2022 * _2242;
    int _2304 = _2302 + _2294;
    float _2306 = _999 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2308 = float(uint(_2284));
    float _2310 = -_979;
    float _2312 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2176);
    float _2314 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2290);
    float _2316 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2306);
    float _2318 = 1.0 / _2292;
    float _2320 = as_type<float>(_2296) * _2308;
    float _2322 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2312);
    int _2324 = abs(_2284);
    float _2326 = _999 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2328 = _999 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2330 = float(uint(_2304));
    float _2332 = trunc(_2320);
    float _2334 = precise::max(_2332, 0.0);
    uint _2336 = uint(_2334);
    int _2338 = as_type<int>(_2298) + (-2);
    float _2340 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2326);
    float _2342 = float(uint(_2324));
    float _2344 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2328);
    int _2346 = abs(_2304);
    float _2348 = as_type<float>(_2300) * _2330;
    int _2350 = ~_2122;
    int _2352 = _2350 + 1;
    float _2354 = as_type<float>(_2338) * _2342;
    int _2356 = as_type<int>(_2318) + (-2);
    float _2358 = _1007 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2360 = _1007 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2362 = float(uint(_2346));
    float _2364 = trunc(_2348);
    float _2366 = precise::max(_2364, 0.0);
    uint _2368 = uint(_2366);
    float _2370 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2358);
    float _2372 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2360);
    int _2374 = _2352 * int(_2336);
    int _2376 = _2374 + _2284;
    float _2378 = as_type<float>(_2356) * _2362;
    float _2380 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2370);
    float _2382 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2372);
    int _2384 = ~_2168;
    int _2386 = _2384 + 1;
    float _2388 = trunc(_2378);
    float _2390 = precise::max(_2388, 0.0);
    uint _2392 = uint(_2390);
    float _2394 = float(uint(_2376));
    float _2396 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2130);
    float _2398 = _2344;
    if (_1087)
    {
        float _2400 = _2188 + (-1.0);
        _2182 = _2400;
    }
    float _2402 = _2182;
    bool _2404 = !_2060;
    float _2406 = _2404 ? _197 : as_type<float>(_2118);
    float _2408 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2340);
    float _2410 = as_type<float>(_2296) * _2394;
    float _2412 = trunc(_2354);
    float _2414 = precise::max(_2412, 0.0);
    uint _2416 = uint(_2414);
    float _2418 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2396);
    int _2420 = ~_2240;
    int _2422 = _2420 + 1;
    float _2424 = _2402;
    if (_1087)
    {
        float _2426 = _2402 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2424 = _2426;
    }
    float _2428 = _2424;
    int _2430 = _2386 * int(_2368);
    int _2432 = _2430 + _2304;
    bool _2434 = _2168 == 0;
    if (_1087)
    {
        float _2436 = fma(_1147, _2188, _2428);
        _1149 = _2436;
    }
    float _2438 = _1149;
    float _2440 = trunc(_2410);
    float _2442 = precise::max(_2440, 0.0);
    uint _2444 = uint(_2442);
    int _2446 = ~_2264;
    int _2448 = _2446 + 1;
    float _2450 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2452 = float(uint(_2432));
    float _2454 = _197 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2456 = as_type<float>(_2448);
    if (_1087)
    {
        float _2458 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2460 = _1169 + _2458;
        _2456 = _2460;
    }
    float _2462 = _2456;
    float _2464 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2466 = _2438 + _2464;
    int _2468 = _2422 * int(_2416);
    int _2470 = _2468 + _2324;
    float _2472 = as_type<float>(_2300) * _2452;
    int _2474 = _2448 * int(_2392);
    int _2476 = _2474 + _2346;
    float _2478 = -_197;
    int _2480 = _2152 ? as_type<int>(_2478) : as_type<int>(_197);
    if (_1087)
    {
        float _2482 = _2462 * _2462;
        _1109 = _2482;
    }
    float _2484 = _1109;
    float _2486 = float(uint(_2470));
    float _2488 = float(uint(_2476));
    float _2490 = trunc(_2472);
    float _2492 = precise::max(_2490, 0.0);
    uint _2494 = uint(_2492);
    float _2496 = -_201;
    int _2498 = _2114 ? as_type<int>(_2496) : as_type<int>(_201);
    float _2500 = as_type<float>(_2338) * _2486;
    int _2502 = int(_2336) + int(_2444);
    float _2504 = as_type<float>(_2356) * _2488;
    bool _2506 = !_2012;
    float _2508 = _2506 ? _201 : as_type<float>(_2498);
    float _2510 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2344);
    bool _2512 = !_2016;
    float _2514 = _2512 ? _197 : as_type<float>(_2480);
    float _2516 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2316);
    float _2518 = trunc(_2500);
    float _2520 = precise::max(_2518, 0.0);
    uint _2522 = uint(_2520);
    int _2524 = ~_2122;
    int _2526 = _2524 + 1;
    float _2528 = _2450 * _2314;
    if (!_1087)
    {
        _2398 = _1077;
    }
    float _2530 = _2398;
    float _2532 = _2530;
    if (_1087)
    {
        float _2534 = _2260 * _2260;
        _2532 = _2534;
    }
    float _2536 = _2532;
    bool _2538 = _2168 == 0;
    int _2540 = _2526 * _2502;
    int _2542 = _2540 + _2284;
    int _2544 = int(_2368) + int(_2494);
    float _2546 = trunc(_2504);
    float _2548 = precise::max(_2546, 0.0);
    uint _2550 = uint(_2548);
    int _2552 = ~_2168;
    int _2554 = _2552 + 1;
    float _2556 = fma(_2466, _2466, _2484);
    int _2558 = ~_2240;
    int _2560 = _2558 + 1;
    float _2562 = _2450 * _2286;
    bool _2564 = uint(_2542) >= uint(_2122);
    int _2566 = _2554 * _2544;
    int _2568 = _2566 + _2304;
    float _2570 = _2450 * _2322;
    int _2572 = int(_2416) + int(_2522);
    float _2574 = _2556 + _2536;
    int _2576 = ~_2264;
    int _2578 = _2576 + 1;
    float _2580 = fma(_2454, _2408, _2528);
    bool _2582 = uint(_2568) >= uint(_2168);
    int _2584 = _2560 * _2572;
    int _2586 = _2584 + _2324;
    float _2588 = fma(_2454, _2516, _2562);
    float _2590 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2592 = int(_2392) + int(_2550);
    float _2594 = fma(_2454, _2510, _2570);
    bool _2596 = uint(_2586) >= uint(_2240);
    out.m_86.x = _2516;
    out.m_86.y = _2408;
    out.m_86.z = _2510;
    bool _2598 = !_2582;
    int _2600 = _2598 ? 0 : (-1);
    int _2602 = _2578 * _2592;
    int _2604 = _2602 + _2346;
    bool _2606 = !_2564;
    int _2608 = _2606 ? 0 : (-1);
    float _2610 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2612 = ~_2544;
    int _2614 = _2612 + _2600;
    int _2616 = _2614 + 1;
    int _2618 = ~_2502;
    int _2620 = _2618 + _2608;
    int _2622 = _2620 + 1;
    int _2624 = _2284 ^ _2122;
    int _2626 = _2168 * _2616;
    int _2628 = _2626 + _2304;
    bool _2630 = uint(_2604) >= uint(_2264);
    int _2632 = _2122 * _2622;
    int _2634 = _2632 + _2284;
    bool _2636 = !_2596;
    int _2638 = _2636 ? 0 : (-1);
    float _2640 = sqrt(_2574);
    uint _2642 = uint(int(uint(_2624) >> uint(31)));
    bool _2644 = _2122 == 0;
    bool _2646 = _2122 == 0;
    float _2648 = _2610 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2650 = _2304 ^ _2168;
    float _2652 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2654 = ~_2638;
    int _2656 = _2572 + _2654;
    int _2658 = _2656 + 1;
    float _2660 = _2590 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2662 = ~int(_2642);
    int _2664 = _2662 + 1;
    bool _2666 = !_2644;
    int _2668 = _2666 ? _2634 : (-1);
    uint _2670 = uint(int(uint(_2650) >> uint(31)));
    float _2672 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2674 = !_2630;
    int _2676 = _2674 ? 0 : (-1);
    int _2678 = _2658 ^ _2664;
    float _2680 = float(_2668);
    int _2682 = ~int(_2670);
    int _2684 = _2682 + 1;
    float _2686 = fma(_2450, _2450, 1.0);
    int _2688 = ~_2676;
    int _2690 = _2592 + _2688;
    int _2692 = _2690 + 1;
    float _2694 = fma(_2660, _2680, _365);
    int _2696 = ~_2664;
    int _2698 = _2696 + _2678;
    int _2700 = _2698 + 1;
    float _2702 = rsqrt(_2686);
    bool _2704 = !_2434;
    int _2706 = _2704 ? _2628 : (-1);
    int _2708 = _2692 ^ _2684;
    float _2710 = _2672 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _2712 = !_2646;
    int _2714 = _2712 ? _2700 : (-1);
    float _2716 = _2652 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2718 = float(_2706);
    float _2720 = _2406 + 0.5;
    int _2722 = ~_2684;
    int _2724 = _2722 + _2708;
    int _2726 = _2724 + 1;
    float _2728 = float(_2714);
    float _2730 = fma(_2716, _2718, _821);
    bool _2732 = !_2538;
    int _2734 = _2732 ? _2726 : (-1);
    float _2736 = fma(_2660, _2720, _2694);
    float _2738 = _2514 + 0.5;
    float _2740 = -_403;
    float _2742 = fma(_2648, _2728, _2740);
    float _2744 = float(_2734);
    float _2746 = _2508 + (-0.5);
    float _2748 = fma(_2716, _2738, _2730);
    float _2750 = _2450 * _2702;
    float _2752 = -_1217;
    float _2754 = fma(_2406, _2752, _2736);
    float _2756 = -_803;
    float _2758 = fma(_2710, _2744, _2756);
    float _2760 = _2200 + (-0.5);
    float _2762 = -_2648;
    float _2764 = fma(_2762, _2746, _2742);
    float _2766 = -_2380;
    float _2768 = _2750 * _2766;
    float _2770 = -_2382;
    float _2772 = _2750 * _2770;
    float _2774 = -_2418;
    float _2776 = _2750 * _2774;
    float _2778 = -_2710;
    float _2780 = fma(_2778, _2760, _2758);
    float _2782 = fma(_2702, _2286, _2768);
    float _2784 = fma(_2702, _2314, _2772);
    float _2786 = -_1207;
    float _2788 = fma(_2514, _2786, _2748);
    float _2790 = fma(_2508, _1203, _2764);
    float _2792 = fma(_2702, _2322, _2776);
    float _2794 = _2380 + _2588;
    float _2796 = fma(_2200, _1227, _2780);
    float _2798 = _2382 + _2580;
    float _2800 = _2418 + _2594;
    out.m_88.x = _2782;
    out.m_88.y = _2784;
    out.m_88.z = _2792;
    bool _2802 = _2640 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2804 = isnan(_2640);
    bool _2806 = _2802 || _2804;
    bool _2808 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2810 = _2806 || _2808;
    out.m_90.x = _2754;
    out.m_90.y = _2790;
    out.m_90.z = _2788;
    out.m_90.w = _2796;
    out.m_92.x = _1185;
    out.m_92.y = _1187;
    out.m_92.z = _1189;
    out.m_94.x = _2794;
    out.m_94.y = _2798;
    out.m_94.z = _2800;
    float _2812 = as_type<float>(_2550);
    float _2814 = _2580;
    if (!_2810)
    {
        _1263 = 1.0;
    }
    float _2816 = _1263;
    bool _2818 = !_2810;
    float _2820 = _2816;
    if (!_2818)
    {
        bool _2822 = _2640 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2824 = isnan(_2640);
        bool _2826 = _2822 || _2824;
        bool _2828 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2830 = _2826 || _2828;
        if (!_2830)
        {
            float _2832 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2834 = _2640 + _2832;
            float _2836 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2838 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2836;
            float _2840 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2842 = _2840 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2844 = 1.0 / _2838;
            float _2846 = _2834 * _2844;
            float _2848 = fma(_2846, _2842, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2820 = _2848;
            _2850 = true;
        }
        else
        {
            bool _2852 = _2640 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2854 = isnan(_2640);
            bool _2856 = _2852 || _2854;
            bool _2858 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2860 = _2856 || _2858;
            if (!_2860)
            {
                float _2862 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2864 = _2640 + _2862;
                float _2866 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2868 = _2866 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2870 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2872 = _2870 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2874 = 1.0 / _2868;
                float _2876 = _2864 * _2874;
                float _2878 = fma(_2876, _2872, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2820 = _2878;
                _2850 = true;
            }
            else
            {
                _2820 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2850 = false;
    float _2880 = _2820;
    float _2882 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2884 = _2438 + _2882;
    float _2886 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2888 = _1169 + _2886;
    float _2890 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2892 = _1175 + _2890;
    float _2894 = fma(_2884, _2880, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2896 = fma(_2888, _2880, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2898 = fma(_2892, _2880, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2900 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2902 = _2894 + _2900;
    float _2904 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2906 = _2896 + _2904;
    float _2908 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2910 = _2898 + _2908;
    float _2912 = _2902 * _2902;
    float _2914 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2916 = fma(_2906, _2906, _2912);
    float _2918 = _1133 + _2914;
    float _2920 = fma(_1043, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2922 = fma(_2910, _2910, _2916);
    float _2924 = _1133 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2926 = floor(_2920);
    float _2928 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2924);
    float _2930 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2928);
    float _2932 = rsqrt(_2922);
    float _2934 = _2930 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2936 = -_2926;
    float _2938 = _2920 + _2936;
    float _2940 = sqrt(_2922);
    float _2942 = _2932 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2944 = _1133 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2946 = _2906 * _2942;
    float _2948 = _2910 * _2942;
    float _2950 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2944);
    float _2952 = 1.0 / _2934;
    float _2954 = _2946 * _2946;
    float _2956 = _2948 * _2948;
    float _2958 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2950);
    float _2960 = _2954 + _2956;
    float _2962 = _2958 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2964 = sqrt(_2960);
    float _2966 = _2962 + _2934;
    float _2968 = _2918 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2970 = _2966 * _2952;
    float _2972 = _2970 * 0.5;
    float _2974 = _2918 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2976 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2978 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2976);
    float _2980 = fma(_1043, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2974);
    float _2982 = fma(_1045, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2980);
    float _2984 = 1.0 / _2978;
    bool _2986 = _2964 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2988 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2990 = _2964 + _2988;
    float _2992 = _2982 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2994 = trunc(_2992);
    int _2996 = int(_2994);
    float _2998 = _1189;
    float _3000 = _2960;
    float _3002 = _2942;
    int _3004 = 2;
    float _3006 = _2946;
    float _3008 = _2954;
    if (_2986)
    {
        float _3010 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2998 = _3010;
    }
    float _3012 = _2998;
    float _3014 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3016 = _2984 * _3014;
    float _3018 = fma(_1043, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2968);
    float _3020 = fma(_1045, (*spvDescriptorSet0.vp_c15)._m0[127].z, _3018);
    bool _3022 = _3016 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _3024 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    bool _3026 = _3016 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _3028 = _3020 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _3030 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _3032 = _2996 + _3030;
    int _3034 = _3032 + 1;
    float _3036 = _3020;
    int _3038 = as_type<int>(_3028);
    if (_2986)
    {
        float _3040 = rsqrt(_2960);
        _3000 = _3040;
    }
    float _3042 = _3000;
    float _3044 = precise::max(0.0, _3024);
    float _3046 = _3042;
    if (_2986)
    {
        float _3048 = _2990 * _3012;
        _3036 = _3048;
    }
    float _3050 = _3036;
    float _3052 = -_2942;
    float _3054 = -_3044;
    float _3056 = fma(_2902, _3052, _3054);
    float _3058 = trunc(_3028);
    int _3060 = int(_3058);
    float _3062 = _3056;
    if (_2986)
    {
        float _3064 = _3050 * 0.15915493667125701904296875;
        _1171 = _3064;
    }
    float _3066 = _1171;
    bool _3068 = !_3022;
    int _3070 = _3068 ? 0 : 1;
    if (_2986)
    {
        float _3072 = _3056 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3002 = _3072;
    }
    float _3074 = _3002;
    if (!_3022)
    {
        _3004 = 1;
    }
    int _3076 = _3004;
    int _3078 = _3076;
    if (!_3026)
    {
        _3078 = _3070;
    }
    int _3080 = _3078;
    float _3082 = _2982;
    if (_2986)
    {
        float _3084 = _3066 * 6.283185482025146484375;
        float _3086 = sin(_3084);
        _3082 = _3086;
    }
    float _3088 = _3082;
    bool _3090 = _3034 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _3092 = _3080 << 6;
    int _3094 = _3092 + 96;
    uint _3096 = uint(int(uint(_3094) >> uint(2)));
    uint _3098 = uint(int(uint(int(_3096)) >> uint(2)));
    int _3100 = int(_3096) & 3;
    float _3102 = (*spvDescriptorSet0.vp_c15)._m0[int(_3098)][_3100];
    int _3104 = int(_3096) + 1;
    uint _3106 = uint(int(uint(_3104) >> uint(2)));
    int _3108 = _3104 & 3;
    float _3110 = (*spvDescriptorSet0.vp_c15)._m0[int(_3106)][_3108];
    int _3112 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3114 = _3060 + _3112;
    int _3116 = _3114 + 1;
    float _3118 = _3066;
    if (_2986)
    {
        float _3120 = _3066 * 6.283185482025146484375;
        float _3122 = cos(_3120);
        _3118 = _3122;
    }
    float _3124 = _3118;
    float _3126 = fma(_1045, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    int _3128 = _3034 | _3116;
    int _3130 = _3092 + 48;
    uint _3132 = uint(int(uint(_3130) >> uint(2)));
    uint _3134 = uint(int(uint(int(_3132)) >> uint(2)));
    int _3136 = int(_3132) & 3;
    float _3138 = (*spvDescriptorSet0.vp_c15)._m0[int(_3134)][_3136];
    int _3140 = int(_3132) + 1;
    uint _3142 = uint(int(uint(_3140) >> uint(2)));
    int _3144 = _3140 & 3;
    float _3146 = (*spvDescriptorSet0.vp_c15)._m0[int(_3142)][_3144];
    bool _3148 = _3128 < 0;
    bool _3150 = _3148 || _3090;
    float _3152 = as_type<float>(_3128);
    if (_2986)
    {
        float _3154 = fma(_3088, _3074, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3152 = _3154;
    }
    float _3156 = _3152;
    float _3158 = _2894 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3160 = floor(_3126);
    bool _3162 = _3116 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3164 = _3162 || _3150;
    if (_2986)
    {
        float _3166 = _3042 * _3156;
        _2812 = _3166;
    }
    float _3168 = _2812;
    float _3170 = fma(_2896, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3158);
    int _3172 = _3092 + 104;
    uint _3174 = uint(int(uint(_3172) >> uint(2)));
    uint _3176 = uint(int(uint(int(_3174)) >> uint(2)));
    int _3178 = int(_3174) & 3;
    float _3180 = (*spvDescriptorSet0.vp_c15)._m0[int(_3176)][_3178];
    int _3182 = int(_3174) + 1;
    uint _3184 = uint(int(uint(_3182) >> uint(2)));
    int _3186 = _3182 & 3;
    float _3188 = (*spvDescriptorSet0.vp_c15)._m0[int(_3184)][_3186];
    if (_2986)
    {
        float _3190 = _3124 + (-1.0);
        _3046 = _3190;
    }
    float _3192 = _3046;
    float _3194 = _3192;
    if (_2986)
    {
        float _3196 = _2946 * _3168;
        _3006 = _3196;
    }
    float _3198 = _3006;
    float _3200 = fma(_2898, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3170);
    float _3202 = _3200;
    if (_2986)
    {
        float _3204 = _3192 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1195 = _3204;
    }
    float _3206 = _1195;
    if (!_2986)
    {
        _3194 = _2948;
    }
    float _3208 = _3194;
    int _3210 = _3092 + 64;
    uint _3212 = uint(int(uint(_3210) >> uint(2)));
    uint _3214 = uint(int(uint(int(_3212)) >> uint(2)));
    int _3216 = int(_3212) & 3;
    float _3218 = (*spvDescriptorSet0.vp_c15)._m0[int(_3214)][_3216];
    int _3220 = int(_3212) + 1;
    uint _3222 = uint(int(uint(_3220) >> uint(2)));
    int _3224 = _3220 & 3;
    float _3226 = (*spvDescriptorSet0.vp_c15)._m0[int(_3222)][_3224];
    float _3228 = _3208;
    if (_2986)
    {
        float _3230 = _2948 * _3168;
        _3228 = _3230;
    }
    float _3232 = _3228;
    if (_2986)
    {
        float _3234 = fma(_3056, _3124, _3206);
        _3062 = _3234;
    }
    float _3236 = _3062;
    if (_2986)
    {
        float _3238 = _3198 * _3198;
        _3008 = _3238;
    }
    float _3240 = _3008;
    float _3242 = _3200 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (!_2986)
    {
        _3202 = _2956;
    }
    float _3244 = _3202;
    float _3246 = _3244;
    if (_2986)
    {
        float _3248 = _3232 * _3232;
        _3246 = _3248;
    }
    float _3250 = _3246;
    float _3252 = fma(_3236, _3236, _3240);
    int _3254 = _3092 + 80;
    uint _3256 = uint(int(uint(_3254) >> uint(2)));
    uint _3258 = uint(int(uint(int(_3256)) >> uint(2)));
    int _3260 = int(_3256) & 3;
    float _3262 = (*spvDescriptorSet0.vp_c15)._m0[int(_3258)][_3260];
    int _3264 = int(_3256) + 1;
    uint _3266 = uint(int(uint(_3264) >> uint(2)));
    int _3268 = _3264 & 3;
    float _3270 = (*spvDescriptorSet0.vp_c15)._m0[int(_3266)][_3268];
    float _3272 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3274 = _3242 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3276 = -_3160;
    float _3278 = _3126 + _3276;
    float _3280 = _3252 + _3250;
    int _3282 = as_type<int>(_3274);
    if (!_3164)
    {
        float _3284 = floor(_3028);
        _2814 = _3284;
    }
    float _3286 = _2814;
    float _3288 = -_3274;
    float _3290 = fma(_3288, _3272, 1.0);
    if (!_3164)
    {
        int _3292 = _3116 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3294 = _3292 + _3034;
        _3282 = _3294;
    }
    int _3296 = _3282;
    int _3298 = _3092 + 56;
    uint _3300 = uint(int(uint(_3298) >> uint(2)));
    uint _3302 = uint(int(uint(int(_3300)) >> uint(2)));
    int _3304 = int(_3300) & 3;
    float _3306 = (*spvDescriptorSet0.vp_c15)._m0[int(_3302)][_3304];
    int _3308 = int(_3300) + 1;
    uint _3310 = uint(int(uint(_3308) >> uint(2)));
    int _3312 = _3308 & 3;
    float _3314 = (*spvDescriptorSet0.vp_c15)._m0[int(_3310)][_3312];
    float _3316 = log2(_3290);
    int _3318 = _3092 + 88;
    uint _3320 = uint(int(uint(_3318) >> uint(2)));
    uint _3322 = uint(int(uint(int(_3320)) >> uint(2)));
    int _3324 = int(_3320) & 3;
    float _3326 = (*spvDescriptorSet0.vp_c15)._m0[int(_3322)][_3324];
    int _3328 = int(_3320) + 1;
    uint _3330 = uint(int(uint(_3328) >> uint(2)));
    int _3332 = _3328 & 3;
    float _3334 = (*spvDescriptorSet0.vp_c15)._m0[int(_3330)][_3332];
    float _3336 = _2918 * _3110;
    float _3338 = fma(_1043, _3102, _3336);
    int _3340 = _3092 + 72;
    uint _3342 = uint(int(uint(_3340) >> uint(2)));
    uint _3344 = uint(int(uint(int(_3342)) >> uint(2)));
    int _3346 = int(_3342) & 3;
    float _3348 = (*spvDescriptorSet0.vp_c15)._m0[int(_3344)][_3346];
    int _3350 = int(_3342) + 1;
    uint _3352 = uint(int(uint(_3350) >> uint(2)));
    int _3354 = _3350 & 3;
    float _3356 = (*spvDescriptorSet0.vp_c15)._m0[int(_3352)][_3354];
    float _3358 = _2918 * _3146;
    float _3360 = rsqrt(_3280);
    float _3362 = fma(_1043, _3138, _3358);
    float _3364 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3366 = fma(_2940, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3364);
    float _3368 = precise::clamp(_3366, 0.0, 1.0);
    int _3370 = as_type<int>((*spvDescriptorSet0.vp_c15)._m0[23].w);
    int _3372 = as_type<int>(_3102);
    if (!_3164)
    {
        int _3374 = _3296 << 2;
        _3370 = _3374;
    }
    int _3376 = _3370;
    float _3378 = fma(_1045, _3180, _3338);
    float _3380 = _3316 * 0.693147182464599609375;
    int _3382 = _3376;
    if (!_3164)
    {
        int _3384 = 12 & _3376;
        _3382 = _3384;
    }
    int _3386 = _3382;
    float _3388 = _3378 + _3188;
    float _3390 = _2918 * _3270;
    float _3392 = _2918 * _3226;
    float _3394 = _3360 * _3198;
    float _3396 = _3360 * _3236;
    float _3398 = _3360 * _3232;
    float _3400 = fma(_1043, _3218, _3392);
    float _3402 = fma(_1043, _3262, _3390);
    float _3404 = -_3368;
    float _3406 = _3404 + 1.0;
    float _3408 = fma(_1045, _3306, _3362);
    float _3410 = _3394 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3412 = 1.0 / _3388;
    float _3414 = _3226;
    if (!_3164)
    {
        float _3416 = -_3286;
        float _3418 = _3028 + _3416;
        _3414 = _3418;
    }
    float _3420 = _3414;
    float _3422 = _3408 + _3314;
    float _3424 = _2894 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (!_3164)
    {
        uint _3426 = uint(int(uint(_3296) >> uint(2)));
        _3038 = int(_3426);
    }
    int _3428 = _3038;
    float2 _9259 = float2(_2938, _3278);
    float _3430 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9259, float2(0.0), isnan(_9259)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9259, float2(0.0), isnan(_9259)), level(0.0)).x;
    float _3432 = fma(_1045, _3326, _3402);
    float _3434 = -_3410;
    float _3436 = fma(_3396, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3434);
    float _3438 = abs(_3406);
    float _3440 = log2(_3438);
    float _3442 = _2894 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3444 = fma(_2896, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3424);
    float _3446 = -_3398;
    float _3448 = fma(_3446, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3436);
    if (!_3164)
    {
        int _3450 = _3428 << 4;
        int _3452 = _3450 + _3386;
        _3372 = _3452;
    }
    int _3454 = _3372;
    float _3456 = fma(_2896, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3442);
    float _3458 = fma(_1045, _3348, _3400);
    float _3460 = fma(_2898, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3444);
    float _3462 = _3422 * _3412;
    float _3464 = fma(_2898, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3456);
    float _3466 = _3458 + _3356;
    float _3468 = _2894 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3470 = fma(_3448, -0.5, 0.5);
    bool _3472 = _3462 >= 0.0;
    float _3474 = _3466 * _3412;
    float _3476 = fma(_2896, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3468);
    float _3478 = _3440 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _3480 = _3462 <= 1.0;
    bool _3482 = _3480 && _3472;
    float _3484 = _3464 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3486 = fma(_2898, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3476);
    float _3488 = exp2(_3478);
    bool _3490 = _3474 >= 0.0;
    bool _3492 = _3490 && _3482;
    float _3494 = _3484 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3496 = _3486 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3498 = fma(_3448, 0.5, 0.5);
    bool _3500 = _3474 <= 1.0;
    bool _3502 = _3500 && _3492;
    float _3504 = as_type<float>(_3428);
    if (!_3164)
    {
        int _3506 = _3454 + 400;
        uint _3508 = uint(int(uint(_3506) >> uint(2)));
        uint _3510 = uint(int(uint(int(_3508)) >> uint(2)));
        int _3512 = int(_3508) & 3;
        float _3514 = (*spvDescriptorSet0.vp_c15)._m0[int(_3510)][_3512];
        _3504 = _3514;
    }
    float _3516 = _3504;
    float _3518 = fma(_3496, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3494);
    float _3520 = _3460 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3522 = sqrt(_3470);
    float _3524 = fma(_3242, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3518);
    float _3526 = _3432 + _3334;
    float _3528 = _3484 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3530 = _3396 + 1.0;
    float _3532 = fma(_3498, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3534 = fma(_3520, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3524);
    float _3536 = fma(_3496, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3528);
    float _3538 = -_3396;
    float _3540 = fma(_3488, _3530, _3538);
    float _3542 = _3530;
    if (_3502)
    {
        float _3544 = float(_3080);
        _3542 = _3544;
    }
    float _3546 = _3542;
    float _3548 = fma(_3498, _3532, -0.212114393711090087890625);
    float _3550 = 1.0 / _3534;
    float _3552 = _3484 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3554 = _3380 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3556 = fma(_3498, _3548, 1.570728778839111328125);
    float _3558 = fma(_3242, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3536);
    float _3560 = fma(_3496, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3552);
    float _3562 = _3522 * 0.636619746685028076171875;
    float _3564 = _3526 * _3412;
    float _3566 = _3546;
    float _3568 = _3564;
    if (_3502)
    {
        float _3570 = rint(_3546);
        float _3572 = precise::max(_3570, 0.0);
        uint _3574 = uint(_3572);
        uint _3576 = clamp(_3574, 0u, 65535u);
        _3566 = as_type<float>(_3576);
    }
    float _3578 = _3566;
    float _3580 = fma(_3242, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3560);
    float _3582 = fma(_3520, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3558);
    float _3584 = -_3556;
    float _3586 = fma(_3562, _3584, 1.0);
    float _3588 = fma(_3540, 0.5, 0.5);
    float _3590 = fma(_3520, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3580);
    float _3592 = _3460;
    if (!_3164)
    {
        float _3594 = floor(_2992);
        _3592 = _3594;
    }
    float _3596 = _3592;
    float _3598 = _3582 * _3550;
    float _3600 = _3590 * _3550;
    float _3602 = fma(_3598, 0.5, 0.5);
    float _3604 = fma(_3600, -0.5, 0.5);
    float _3606 = _3578;
    if (_3502)
    {
        float3 _9569 = float3(_3462, _3474, float(as_type<int>(_3578)));
        float3 _9573 = select(_9569, float3(0.0), isnan(_9569));
        float _3608 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9573.xy, uint(rint(_9573.z)), _3564, level(0.0));
        _3606 = _3608;
    }
    float _3610 = _3606;
    float3 _9583 = float3(_3602, _3604, _3554);
    float _3612 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9583, float3(0.0), isnan(_9583)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9583, float3(0.0), isnan(_9583)), level(0.0)).x;
    float _3614 = _3596;
    if (!_3164)
    {
        float _3616 = -_3596;
        float _3618 = _2992 + _3616;
        _3614 = _3618;
    }
    float _3620 = _3614;
    float _3622 = _3412;
    if (!_3164)
    {
        float _3624 = rint(_3516);
        float _3626 = precise::max(_3624, 0.0);
        uint _3628 = uint(_3626);
        uint _3630 = clamp(_3628, 0u, 65535u);
        _3622 = as_type<float>(_3630);
    }
    float _3632 = _3622;
    float3 _9620 = float3(_3602, _3604, _3554);
    float4 _3635 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9620, float3(0.0), isnan(_9620)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9620, float3(0.0), isnan(_9620)), level(0.0)).xyzw;
    float _3637 = _3635.x;
    float _3639 = _3635.y;
    float _3641 = _3635.z;
    float _3643 = _3635.w;
    float2 _9636 = float2(_3586, _3588);
    float3 _3645 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9636, float2(0.0), isnan(_9636)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9636, float2(0.0), isnan(_9636)), level(0.0)).xyz;
    float _3647 = _3645.x;
    float _3649 = _3645.y;
    float _3651 = _3645.z;
    float _3653 = _3632;
    if (!_3164)
    {
        float3 _9657 = float3(_3620, _3420, float(as_type<int>(_3632)));
        float3 _9659 = select(_9657, float3(0.0), isnan(_9657));
        float _3655 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9659.xy, uint(rint(_9659.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9659.xy, uint(rint(_9659.z)), level(0.0)).x;
        _3653 = _3655;
    }
    float _3657 = _3653;
    float _3659 = abs(_3016);
    float _3661 = log2(_3659);
    float _3663 = _3484 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3665 = fma(_3496, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3663);
    float _3667 = fma(_3242, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3665);
    bool _3669 = _3016 <= 8000.0;
    bool _3671 = isnan(_3016);
    bool _3673 = _3669 || _3671;
    bool _3675 = isnan(8000.0);
    bool _3677 = _3673 || _3675;
    float _3679 = float(_3677);
    float _3681 = fma(_3520, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3667);
    float _3683 = _3440 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3685 = _3661 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.gl_Position.x = _3582;
    out.gl_Position.y = _3590;
    out.gl_Position.z = _3681;
    out.gl_Position.w = _3534;
    float _3687 = exp2(_3683);
    float _3689 = exp2(_3685);
    float _3691 = fma(_3689, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3693 = precise::clamp(_3691, 0.0, 1.0);
    float _3695 = fma(_3693, -2.0, 3.0);
    float _3697 = _3693 * _3693;
    float _3699 = _3697 * _3695;
    float _3701 = _3681 + _3534;
    float _3703 = _3701 * 0.5;
    float _3705 = -_3699;
    float _3707 = _3705 + 1.0;
    out.m_96.z = _3703;
    out.m_96.w = _3534;
    float _3709 = fma(_3707, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3699);
    float _3711 = -_3687;
    float _3713 = _3711 + 1.0;
    float _3715 = _3679 * _3709;
    float _3717 = _3679;
    float _3719 = _3582;
    float _3721 = _3681;
    if (!_3502)
    {
        _3717 = 1.0;
    }
    float _3723 = _3717;
    float _3725 = _3713 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3727 = _3715 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3729 = -_3430;
    float _3731 = _3729 + 1.0;
    float _3733 = _3723;
    float _3735 = _3727;
    if (_3502)
    {
        bool _3737 = _3610 >= _3564;
        bool _3739 = isnan(_3610);
        bool _3741 = _3737 || _3739;
        bool _3743 = isnan(_3564);
        bool _3745 = _3741 || _3743;
        float _3747 = float(_3745);
        _3733 = _3747;
    }
    float _3749 = _3733;
    float _3751 = _3731 * _3727;
    float _3753 = precise::clamp(_3751, 0.0, 1.0);
    float _3755 = _3749;
    if (_3164)
    {
        _3735 = 1.0;
    }
    float _3757 = _3735;
    float _3759 = _3757;
    if (!_3164)
    {
        int _3761 = _3296 << 4;
        int _3763 = _3761 + 2048;
        uint _3765 = uint(int(uint(_3763) >> uint(2)));
        uint _3767 = uint(int(uint(int(_3765)) >> uint(2)));
        int _3769 = int(_3765) & 3;
        float _3771 = (*spvDescriptorSet0.vp_c15)._m0[int(_3767)][_3769];
        int _3773 = int(_3765) + 1;
        uint _3775 = uint(int(uint(_3773) >> uint(2)));
        int _3777 = _3773 & 3;
        float _3779 = (*spvDescriptorSet0.vp_c15)._m0[int(_3775)][_3777];
        int _3781 = _3763 + 8;
        uint _3783 = uint(int(uint(_3781) >> uint(2)));
        uint _3785 = uint(int(uint(int(_3783)) >> uint(2)));
        int _3787 = int(_3783) & 3;
        float _3789 = (*spvDescriptorSet0.vp_c15)._m0[int(_3785)][_3787];
        int _3791 = int(_3783) + 1;
        uint _3793 = uint(int(uint(_3791) >> uint(2)));
        int _3795 = _3791 & 3;
        float _3797 = (*spvDescriptorSet0.vp_c15)._m0[int(_3793)][_3795];
        float _3799 = _2918 * _3779;
        float _3801 = fma(_1043, _3771, _3799);
        float _3803 = fma(_1045, _3789, _3801);
        float _3805 = _3803 + _3797;
        float _3807 = precise::clamp(_3805, 0.0, 1.0);
        float _3809 = -_3807;
        float _3811 = _3809 + _3657;
        float _3813 = fma(_3811, 500.0, 1.5);
        float _3815 = exp2(_3813);
        float _3817 = 0.0 + _3815;
        float _3819 = precise::clamp(_3817, 0.0, 1.0);
        _3759 = _3819;
        _3568 = _3815;
        _3719 = _3789;
    }
    float _3821 = _3759;
    float _3823 = _3568;
    float _3825 = _3719;
    float _3827 = _3749 * _3821;
    float _3829 = _3725 * _3612;
    float _3831 = -_3753;
    float _3833 = fma(_3831, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_98.x = _2896;
    out.m_98.y = _2894;
    out.m_98.z = _2898;
    bool _3835 = _2940 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3837 = isnan(_2940);
    bool _3839 = _3835 || _3837;
    bool _3841 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3843 = _3839 || _3841;
    float _3845 = _3643 * _3829;
    float _3847 = -_3827;
    float _3849 = fma(_3847, _3833, 1.0);
    float _3851 = precise::clamp(_3849, 0.0, 1.0);
    float _3853 = -_3725;
    float _3855 = _3853 + 1.0;
    float _3857 = _3651 * _3829;
    float _3859 = fma(_3647, _3845, _3637);
    float _3861 = fma(_3649, _3845, _3639);
    float _3863 = _3643 * _3855;
    float _3865 = _3851 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3867 = fma(_3643, _3857, _3641);
    out.m_100.x = _3865;
    float _3869 = _3825;
    float _3871 = _3823;
    float _3873 = _3855;
    float _3875 = _3851;
    if (!_3843)
    {
        _3721 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3877 = _3721;
    float _3879 = _3877;
    float _3881 = _3877;
    if (!_3843)
    {
        _3755 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3883 = _3755;
    out.m_102.x = _3859;
    out.m_102.y = _3861;
    out.m_102.z = _3867;
    out.m_102.w = _3863;
    float _3885 = _3883;
    float _3887 = _3883;
    if (!_3843)
    {
        _3869 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3889 = _3869;
    float _3891 = _3889;
    float _3893 = _3889;
    if (!_3843)
    {
        _3871 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3895 = _3871;
    float _3897 = _3895;
    float _3899 = _3895;
    if (!_3843)
    {
        _3873 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3901 = _3873;
    float _3903 = _3901;
    float _3905 = _3901;
    if (!_3843)
    {
        _3875 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3907 = _3875;
    bool _3909 = !_3843;
    float _3911 = _3907;
    float _3913 = _3907;
    if (!_3909)
    {
        bool _3915 = _2940 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3917 = isnan(_2940);
        bool _3919 = _3915 || _3917;
        bool _3921 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3923 = _3919 || _3921;
        if (!_3923)
        {
            float _3925 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3927 = _2940 + _3925;
            float _3929 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3931 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3929;
            float _3933 = 1.0 / _3931;
            float _3935 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3937 = _3935 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3939 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3941 = _3939 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3943 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3945 = _3943 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3947 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3949 = _3947 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3951 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3953 = _3951 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3955 = _3927 * _3933;
            float _3957 = precise::clamp(_3955, 0.0, 1.0);
            float _3959 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3961 = _3959 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3963 = fma(_3957, _3937, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3965 = fma(_3957, _3961, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3967 = fma(_3957, _3941, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3969 = fma(_3957, _3945, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3971 = fma(_3957, _3949, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3973 = fma(_3957, _3953, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3887 = _3965;
            _3905 = _3971;
            _3881 = _3963;
            _3899 = _3969;
            _3893 = _3967;
            _3913 = _3973;
            _3975 = true;
        }
        else
        {
            bool _3977 = _2940 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3979 = isnan(_2940);
            bool _3981 = _3977 || _3979;
            bool _3983 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3985 = _3981 || _3983;
            if (!_3985)
            {
                _3879 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3987 = _3879;
            _3881 = _3987;
            if (!_3985)
            {
                _3885 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3989 = _3885;
            _3887 = _3989;
            if (!_3985)
            {
                _3891 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3991 = _3891;
            _3893 = _3991;
            if (!_3985)
            {
                _3897 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3993 = _3897;
            _3899 = _3993;
            if (!_3985)
            {
                _3903 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3995 = _3903;
            _3905 = _3995;
            if (!_3985)
            {
                _3911 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3997 = _3911;
            bool _3999 = !_3985;
            _3913 = _3997;
            if (!_3999)
            {
                bool _4001 = _2940 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4003 = isnan(_2940);
                bool _4005 = _4001 || _4003;
                bool _4007 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4009 = _4005 || _4007;
                if (!_4009)
                {
                    float _4011 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4013 = _2940 + _4011;
                    float _4015 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4017 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4015;
                    float _4019 = 1.0 / _4017;
                    float _4021 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4023 = _4021 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4025 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4027 = _4025 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4029 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4031 = _4029 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4033 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4035 = _4033 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4037 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4039 = _4037 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4041 = _4013 * _4019;
                    float _4043 = precise::clamp(_4041, 0.0, 1.0);
                    float _4045 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4047 = _4045 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4049 = fma(_4043, _4023, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4051 = fma(_4043, _4047, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4053 = fma(_4043, _4027, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4055 = fma(_4043, _4031, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4057 = fma(_4043, _4035, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4059 = fma(_4043, _4039, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3887 = _4051;
                    _3905 = _4057;
                    _3881 = _4049;
                    _3899 = _4055;
                    _3893 = _4053;
                    _3913 = _4059;
                    _3975 = true;
                }
                else
                {
                    _3887 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3905 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3881 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3899 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3893 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3913 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3975 = false;
    float _4061 = _3887;
    float _4063 = _3905;
    float _4065 = _3881;
    float _4067 = _3899;
    float _4069 = _3893;
    float _4071 = _3913;
    float _4073 = fma(_2798, -0.5, 0.5);
    float _4075 = precise::clamp(_4073, 0.0, 1.0);
    float _4077 = -_4061;
    float _4079 = _4077 + _4063;
    float _4081 = -_4065;
    float _4083 = _4081 + _4067;
    float _4085 = -_4069;
    float _4087 = _4085 + _4071;
    bool _4089 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4091 = fma(_4075, _4079, _4061);
    float _4093 = fma(_4075, _4083, _4065);
    float _4095 = fma(_4075, _4087, _4069);
    float _4097 = _4091 * 0.586610972881317138671875;
    out.m_104.x = 0.0;
    float _4099 = fma(_4093, 0.298911988735198974609375, _4097);
    float _4101 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4103 = fma(_4095, 0.114477999508380889892578125, _4099);
    out.m_63.x = _4101;
    float _4105 = -_4103;
    float _4107 = _4093 + _4105;
    float _4109 = -_4103;
    float _4111 = _4091 + _4109;
    float _4113 = -_4103;
    float _4115 = _4095 + _4113;
    float _4117 = fma(_4107, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4103);
    float _4119 = fma(_4111, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4103);
    float _4121 = fma(_4115, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4103);
    out.m_106.x = _4117;
    out.m_106.y = _4119;
    out.m_106.z = _4121;
    if (!_4089)
    {
        return out;
    }
    float _4123 = -_2894;
    float _4125 = _4123 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4127 = -_2896;
    float _4129 = _4127 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4131 = -_2898;
    float _4133 = _4131 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4135 = _4125 * _4125;
    float _4137 = fma(_4129, _4129, _4135);
    float _4139 = fma(_4133, _4133, _4137);
    float _4141 = sqrt(_4139);
    float _4143 = rsqrt(_4139);
    float _4145 = -_4141;
    float _4147 = _4145 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4149 = _4147 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4151 = precise::clamp(_4149, 0.0, 1.0);
    float _4153 = _4129 * _4143;
    float _4155 = _4125 * _4143;
    float _4157 = abs(_4151);
    float _4159 = log2(_4157);
    float _4161 = _4133 * _4143;
    float _4163 = _4153 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4165 = _2798 * _4155;
    float _4167 = -_4155;
    float _4169 = -_4163;
    float _4171 = fma(_4167, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4169);
    float _4173 = fma(_2794, _4153, _4165);
    float _4175 = -_4161;
    float _4177 = fma(_4175, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4171);
    float _4179 = fma(_2800, _4161, _4173);
    float _4181 = precise::clamp(_4179, 0.0, 1.0);
    float _4183 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4185 = _4177 + _4183;
    float _4187 = _4159 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4189 = _4185 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4191 = precise::clamp(_4189, 0.0, 1.0);
    float _4193 = exp2(_4187);
    float _4195 = _4193 * _4191;
    float _4197 = _4181 * _4195;
    float _4199 = _4197 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4201 = _4197 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4203 = _4197 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_104.x = _4199;
    out.m_104.y = _4201;
    out.m_104.z = _4203;
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
    bool _3975 = false;
    bool _2850 = false;
    bool _223 = false;
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
    float _133 = as_type<float>(_125);
    if (!_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _131;
    float _137 = _135;
    if (!_129)
    {
        out.m_63.x = 0.0;
    }
    int _139 = 0;
    if (!_129)
    {
        float _141 = _135 * 5.0;
        _139 = as_type<int>(_141);
    }
    int _143 = _139;
    int _145 = _143;
    if (!_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4262 = as_type<float>(_143);
        out.gl_Position.z = _4262;
    }
    if (!_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _147 = in.m_65.w;
    bool _149 = _147 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _151 = isnan(_147);
    bool _153 = _149 || _151;
    bool _155 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _157 = _153 || _155;
    float _159 = -_147;
    float _161 = _159 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _163 = 0.0;
    float _165 = _161;
    if (_157)
    {
        float _167 = float(_125);
        _163 = _167;
    }
    float _169 = _163;
    bool _171 = _161 >= _169;
    bool _173 = !_157;
    bool _175 = _171 || _173;
    if (_175)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _177 = _137;
    if (_175)
    {
        out.m_63.x = 0.0;
    }
    if (_175)
    {
        float _179 = _177 * 5.0;
        _145 = as_type<int>(_179);
    }
    int _181 = _145;
    if (_175)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4331 = as_type<float>(_181);
        out.gl_Position.z = _4331;
    }
    if (_175)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _183 = as_type<float>(int(gl_VertexIndex));
    bool _185 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _187 = as_type<int>(_183) & 1;
    bool _189 = _187 != 0;
    int _191 = as_type<int>(_183) & 2;
    bool _193 = _191 != 0;
    bool _195 = !_189;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_193;
    float _201 = _199 ? (-0.5) : 0.5;
    bool _203 = !_185;
    float _221;
    if (!_203)
    {
        float _205 = in.m_70.x;
        float _207 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _209 = _205 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _211 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[12].x, _161);
        float _213 = _211 * _207;
        float _215 = floor(_213);
        float _217 = -_215;
        float _219 = _213 + _217;
        _221 = _219;
        _223 = true;
    }
    else
    {
        float _225 = float(_125);
        float _227 = 1.0 / _225;
        float _229 = _161 * _227;
        _221 = _229;
    }
    _223 = false;
    float _231 = _221;
    float _233 = in.m_70.x;
    float _235 = in.m_70.y;
    float _237 = in.m_70.z;
    float _239 = in.m_70.w;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _243 = _231 + _241;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _247 = _231 + _245;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _249;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _255 = _253 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _257;
    float _261 = 1.0 / _251;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _265 = _263 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _267;
    int _271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _273 = _271 != 0;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _277 = _231 + _275;
    float _279 = 1.0 / _255;
    float _281 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _283 = _231 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _285 = isnan(_231);
    bool _287 = _283 || _285;
    bool _289 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _291 = _287 || _289;
    float _293 = float(_291);
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _299 = _231 + _297;
    float _301 = 1.0 / _265;
    float _303 = _233 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _305 = _299 * _261;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _309 = _231 + _307;
    float _311 = -_281;
    float _313 = fma(_303, 2.0, _311);
    float _315 = _233 * 2.0;
    float _317 = 1.0 / _269;
    float _319 = _237 * 2.0;
    float _321 = _309 * _279;
    float _323 = _233 + _235;
    float _325 = _233 + (-0.5);
    float _327 = _323 + (-1.0);
    float _329 = 1.0 / _259;
    float _331 = _235 * 2.0;
    float _333 = _237 + _235;
    float _335 = _243 * _301;
    float _337 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _339 = _333 + (-1.0);
    bool _341 = _231 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _343 = isnan(_231);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = floor(_331);
    float _355 = _235 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _357 = _247 * _317;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _361 = fma(_355, -2.0, _295);
    float _363 = -_161;
    float _365 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[76].x, _313);
    float _367 = floor(_319);
    float _369 = _277 * _329;
    float _371 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _383 = float(_125);
    float _385 = fma(_375, _305, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _387 = floor(_315);
    bool _389 = _353 > 0.0;
    float _391 = fma(_379, _321, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _393 = _353 >= 0.0;
    bool _395 = isnan(_353);
    bool _397 = _393 || _395;
    bool _399 = isnan(0.0);
    bool _401 = _397 || _399;
    float _403 = fma(_161, (*spvDescriptorSet0.vp_c9)._m0[76].y, _361);
    bool _405 = _231 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _407 = isnan(_231);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = 1.0 / _383;
    float _419 = _237 + _233;
    bool _421 = _367 > 0.0;
    float _423 = -_415;
    float _425 = _423 + 1.0;
    bool _427 = _367 >= 0.0;
    bool _429 = isnan(_367);
    bool _431 = _427 || _429;
    bool _433 = isnan(0.0);
    bool _435 = _431 || _433;
    float _437 = _419 + (-1.0);
    bool _439 = _231 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _441 = isnan(_231);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _453 = _387 > 0.0;
    float _455 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _465 = _387 >= 0.0;
    bool _467 = isnan(_387);
    bool _469 = _465 || _467;
    bool _471 = isnan(0.0);
    bool _473 = _469 || _471;
    float _475 = -_293;
    float _477 = _475 + 1.0;
    float _479 = _449 * _425;
    float _481 = fma(_463, _321, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _483 = -_449;
    float _485 = _483 + 1.0;
    float _487 = _415 * _477;
    bool _489 = _231 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _491 = isnan(_231);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _503 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _501;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _505;
    bool _509 = _231 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _511 = isnan(_231);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    float _521 = fma(_459, _305, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _523 = -_499;
    float _525 = _523 + 1.0;
    float _527 = fma(_507, _369, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    int _529 = as_type<int>(_507);
    if (_273)
    {
        _529 = 0;
    }
    int _531 = _529;
    float _533 = -_351;
    float _535 = _533 + 1.0;
    int _537 = _531;
    if (!_273)
    {
        _537 = 1;
    }
    int _539 = _537;
    float _541 = fma(_503, _369, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    int _543 = _473 ? 0 : 1;
    float _545 = _519 * _525;
    bool _547 = _539 != 1;
    float _549 = _499 * _535;
    float _551 = _351 * _485;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _561 = _385 * _545;
    float _563 = _521 * _545;
    float _565 = fma(_555, _335, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    int _567 = _401 ? 0 : 1;
    float _569 = fma(_559, _335, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    int _571 = _435 ? 0 : 1;
    float _573 = -_519;
    float _575 = _573 + 1.0;
    int _577 = ~_567;
    int _579 = _577 + 1;
    int _581 = _579 + 1;
    float _583 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _585 = int(_583);
    int _587 = _581;
    float _589 = as_type<float>(_539);
    float _591 = _561;
    if (!_389)
    {
        int _593 = ~_567;
        int _595 = _593 + 1;
        _587 = _595;
    }
    int _597 = _587;
    float _599 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[143].x, _561);
    int _601 = ~_571;
    int _603 = _601 + 1;
    int _605 = _603 + 1;
    float _607 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[143].y, _563);
    int _609 = _605;
    if (!_547)
    {
        _589 = _235;
    }
    float _611 = _589;
    float _613 = _417 * _161;
    float _615 = _611;
    if (!_421)
    {
        int _617 = ~_571;
        int _619 = _617 + 1;
        _609 = _619;
    }
    int _621 = _609;
    float _623 = fma(_391, _549, _599);
    if (_547)
    {
        _615 = _233;
    }
    float _625 = _615;
    float _627 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _629 = log2(_627);
    int _631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _633 = _631 != 0;
    int _635 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _637 = _635 != 0;
    int _639 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _641 = _639 != 0;
    float _643 = fma(_481, _549, _607);
    int _645 = ~_543;
    int _647 = _645 + 1;
    int _649 = _647 + 1;
    float _651 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[83].z, _359);
    float _653 = fma(_527, _551, _623);
    int _655 = _649;
    float _657 = _625;
    if (!_453)
    {
        int _659 = ~_543;
        int _661 = _659 + 1;
        _655 = _661;
    }
    int _663 = _655;
    if (!_547)
    {
        _657 = _235;
    }
    float _665 = _657;
    float _667 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _669 = int(_667);
    float _671 = _665;
    if (_547)
    {
        _671 = _233;
    }
    float _673 = _671;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_547)
    {
        _591 = _237;
    }
    float _677 = _591;
    float _679 = fma(_565, _479, _653);
    bool _681 = !_637;
    int _683 = _681 ? 0 : 1;
    float _685 = _673 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _687 = !_633;
    int _689 = _687 ? 0 : 1;
    bool _691 = !_641;
    int _693 = _691 ? 0 : 1;
    float _695 = -_381;
    float _697 = fma(_685, 2.0, _695);
    float _699 = _677;
    if (_547)
    {
        _699 = _235;
    }
    float _701 = _699;
    float _703 = _629 * _161;
    int _705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _707 = _705 != 0;
    int _709 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _711 = _709 != 0;
    int _713 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _715 = _713 != 0;
    if (!_547)
    {
        _133 = _237;
    }
    float _717 = _133;
    float _719 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[83].w, _675);
    float _721 = _717;
    if (_547)
    {
        _721 = _235;
    }
    float _723 = _721;
    float _725 = exp2(_703);
    bool _727 = !_711;
    int _729 = _727 ? 0 : 1;
    float _731 = fma(_161, (*spvDescriptorSet0.vp_c9)._m0[82].w, _719);
    bool _733 = !_707;
    int _735 = _733 ? 0 : 1;
    int _737 = abs(_729);
    int _739 = abs(_735);
    float _741 = _723 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _743 = float(_669);
    float _745 = float(_739);
    float _747 = fma(_741, -2.0, _451);
    float _749 = 1.0 / _743;
    float _751 = in.m_72.x;
    float _753 = in.m_72.y;
    float _755 = in.m_72.z;
    float _757 = float(_621);
    float _759 = -_725;
    float _761 = _759 + 1.0;
    float _763 = float(_585);
    float _765 = float(_663);
    float _767 = _745 * _757;
    float _769 = float(_737);
    float _771 = 1.0 / _763;
    bool _773 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _775 = isnan(0.0);
    bool _777 = _773 || _775;
    bool _779 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _781 = _777 || _779;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _785 = 1.0 + _783;
    bool _787 = !_715;
    int _789 = _787 ? 0 : 1;
    float _791 = _769 * _765;
    float _793 = _749 * _161;
    float _795 = _781 ? _761 : 0.0;
    float _797 = fma(_161, (*spvDescriptorSet0.vp_c9)._m0[82].z, _651);
    float _799 = 1.0 / _785;
    float _801 = _767 * (-2.0);
    float _803 = fma(_161, (*spvDescriptorSet0.vp_c9)._m0[81].y, _747);
    bool _805 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _807 = isnan(1.0);
    bool _809 = _805 || _807;
    bool _811 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _813 = _809 || _811;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _817 = abs(_789);
    float _819 = -_161;
    float _821 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[81].x, _697);
    float _823 = fma(_801, _751, _751);
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _827 = fma(_337, _801, _337);
    float _829 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[78].z, _815);
    float _831 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[78].w, _825);
    float _833 = float(_597);
    float _835 = _771 * _161;
    float _837 = float(_817);
    float _839 = fma(_161, (*spvDescriptorSet0.vp_c9)._m0[77].z, _829);
    float _841 = fma(_161, (*spvDescriptorSet0.vp_c9)._m0[77].w, _831);
    if (_813)
    {
        float _843 = _795 * _799;
        _165 = _843;
    }
    float _845 = _165;
    float _847 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[196].x, _823);
    float _849 = _837 * _833;
    float _851 = _791 * (-2.0);
    float _853 = _235 + (-0.5);
    float _855 = fma(_827, _845, _847);
    float _857 = _849 * (-2.0);
    float _859 = fma(_851, _753, _753);
    float _861 = _855 * 0.15915493667125701904296875;
    float _863 = fma(_541, _551, _643);
    float _865 = fma(_455, _857, _455);
    float _867 = fma(_857, _755, _755);
    float _869 = in.m_74.x;
    float _871 = in.m_74.y;
    float _873 = fma(_371, _851, _371);
    float _875 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[196].y, _859);
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _877;
    float _881 = _237 + (-0.5);
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _883;
    float _887 = fma(_873, _845, _875);
    float _889 = fma(_879, _357, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _891 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[196].z, _867);
    float _893 = fma(_885, _357, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _895 = fma(_569, _479, _863);
    float _897 = _887 * 0.15915493667125701904296875;
    float _899 = in.m_60.x;
    float _901 = in.m_60.y;
    float _903 = in.m_60.z;
    float _905 = fma(_865, _845, _891);
    float _907 = fma(_893, _487, _895);
    float _909 = fma(_889, _487, _679);
    float _911 = in.m_76.x;
    float _913 = in.m_76.y;
    float _915 = in.m_76.z;
    float _917 = in.m_76.w;
    float _919 = _905 * 0.15915493667125701904296875;
    float _921 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[148].y, _907);
    float _923 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[148].x, _909);
    float _925 = _861 * 6.283185482025146484375;
    float _927 = sin(_925);
    float _929 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    float _931 = _921 * _871;
    float _933 = _923 * _869;
    float _935 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _197);
    float _937 = _861 * 6.283185482025146484375;
    float _939 = cos(_937);
    float _941 = _933 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _943 = _931 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _945 = in.m_78.x;
    float _947 = in.m_78.y;
    float _949 = in.m_78.z;
    float _951 = in.m_78.w;
    float _953 = _941 * _935;
    float _955 = _943 * _929;
    float _957 = _897 * 6.283185482025146484375;
    float _959 = sin(_957);
    float _961 = _901 * _913;
    float _963 = _897 * 6.283185482025146484375;
    float _965 = cos(_963);
    float _967 = fma(_899, _911, _961);
    float _969 = fma(_903, _915, _967);
    float _971 = _919 * 6.283185482025146484375;
    float _973 = cos(_971);
    float _975 = _927 * _959;
    float _977 = _919 * 6.283185482025146484375;
    float _979 = sin(_977);
    float _981 = _939 * _965;
    float _983 = _927 * _965;
    float _985 = _939 * _973;
    float _987 = _939 * _959;
    float _989 = _927 * _973;
    float _991 = _965 * _973;
    float _993 = _985 * _955;
    float _995 = _959 * _973;
    float _997 = _989 * _955;
    float _999 = fma(_979, _981, _975);
    float _1001 = -_987;
    float _1003 = fma(_979, _983, _1001);
    float _1005 = -_983;
    float _1007 = fma(_979, _987, _1005);
    float _1009 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1011 = -_955;
    float _1013 = _979 * _1011;
    float _1015 = fma(_999, _953, _993);
    float _1017 = fma(_979, _975, _981);
    float _1019 = _901 * _947;
    float _1021 = fma(_991, _953, _1013);
    float _1023 = fma(_1007, _1009, _1015);
    float _1025 = fma(_1003, _953, _997);
    float _1027 = fma(_899, _945, _1019);
    float _1029 = fma(_995, _1009, _1021);
    float _1031 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1033 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1035 = fma(_1017, _1009, _1025);
    float _1037 = fma(_903, _949, _1027);
    float _1039 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1031);
    float _1041 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1033);
    float _1043 = _969 + _917;
    float _1045 = _1037 + _951;
    float _1047 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1039);
    float _1049 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1041);
    float _1051 = _1047 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1053 = _1049 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1055 = _1043 + _1051;
    float _1057 = _1045 + _1053;
    float _1059 = in.m_80.x;
    float _1061 = in.m_80.y;
    float _1063 = in.m_80.z;
    float _1065 = in.m_80.w;
    float _1067 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1069 = _1055 + _1067;
    float _1071 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1073 = _1057 + _1071;
    float _1075 = _1069 * _1069;
    float _1077 = _1073 * _1073;
    float _1079 = _1075 + _1077;
    float _1081 = sqrt(_1079);
    float _1083 = _901 * _1061;
    float _1085 = fma(_899, _1059, _1083);
    bool _1087 = _1081 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1089 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1091 = _1081 + _1089;
    float _1093 = fma(_903, _1063, _1085);
    float _1095 = _891;
    float _1097 = _1079;
    float _1099 = _1091;
    float _1101 = _1023;
    float _1103 = _901;
    float _1105 = _1055;
    float _1107 = _1057;
    float _1109 = _1075;
    if (_1087)
    {
        float _1111 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1095 = _1111;
    }
    float _1113 = _1095;
    if (_1087)
    {
        float _1115 = rsqrt(_1079);
        _1097 = _1115;
    }
    float _1117 = _1097;
    float _1119 = _1117;
    if (_1087)
    {
        float _1121 = _1091 * _1113;
        _1099 = _1121;
    }
    float _1123 = _1099;
    float _1125 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (_1087)
    {
        float _1127 = _1123 * 0.15915493667125701904296875;
        _1101 = _1127;
    }
    float _1129 = _1101;
    float _1131 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1125);
    float _1133 = _1093 + _1065;
    float _1135 = _899;
    if (_1087)
    {
        float _1137 = _1129 * 6.283185482025146484375;
        float _1139 = sin(_1137);
        _1135 = _1139;
    }
    float _1141 = _1135;
    float _1143 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1131);
    float _1145 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1147 = _1133 + _1145;
    float _1149 = _1147;
    if (_1087)
    {
        float _1151 = _1147 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1103 = _1151;
    }
    float _1153 = _1103;
    float _1155 = _1153;
    if (_1087)
    {
        float _1157 = fma(_1141, _1153, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1155 = _1157;
    }
    float _1159 = _1155;
    float _1161 = _1159;
    if (_1087)
    {
        float _1163 = _1117 * _1159;
        _1161 = _1163;
    }
    float _1165 = _1161;
    if (_1087)
    {
        float _1167 = fma(_1069, _1165, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1105 = _1167;
    }
    float _1169 = _1105;
    float _1171 = _1169;
    if (_1087)
    {
        float _1173 = fma(_1073, _1165, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1107 = _1173;
    }
    float _1175 = _1107;
    float _1177 = fma(_1169, 6.2500002968590706586837768554688e-05, 0.5);
    float _1179 = fma(_1175, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5870 = float2(_1177, _1179);
    float3 _1183 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5870, float2(0.0), isnan(_5870)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5870, float2(0.0), isnan(_5870)), level(0.0)).xyz;
    float _1185 = _1183.x;
    float _1187 = _1183.y;
    float _1189 = _1183.z;
    float _1191 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1193 = int(_1191);
    float _1195 = _1175;
    if (_273)
    {
        float _1197 = in.m_70.x;
        _1119 = _1197;
    }
    float _1199 = _1119;
    float _1201 = -_841;
    float _1203 = _1201 + 1.0;
    float _1205 = -_797;
    float _1207 = _1205 + 1.0;
    float _1209 = _1199;
    if (!_273)
    {
        float _1211 = in.m_70.y;
        _1209 = _1211;
    }
    float _1213 = _1209;
    float _1215 = -_839;
    float _1217 = _1215 + 1.0;
    float _1219 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1221 = trunc(_835);
    int _1223 = int(_1221);
    float _1225 = -_731;
    float _1227 = _1225 + 1.0;
    float _1229 = float(uint(_1193));
    float _1231 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1233 = int(_1231);
    int _1235 = ~_1193;
    int _1237 = _1235 + 1;
    bool _1239 = _1193 == 0;
    float _1241 = float(uint(_1223));
    float _1243 = 1.0 / _1229;
    float _1245 = float(uint(_1233));
    float _1247 = trunc(_793);
    int _1249 = int(_1247);
    int _1251 = ~_1233;
    int _1253 = _1251 + 1;
    bool _1255 = _1233 == 0;
    int _1257 = as_type<int>(_1243) + (-2);
    float _1259 = 1.0 / _1245;
    float _1261 = _1243;
    float _1263 = _1227;
    if (_273)
    {
        _1261 = 1.0;
    }
    float _1265 = _1261;
    float _1267 = _1265;
    if (!_273)
    {
        _1267 = 7.345489978790283203125;
    }
    float _1269 = _1267;
    float _1271 = as_type<float>(_1257) * _1241;
    float _1273 = trunc(_1271);
    float _1275 = precise::max(_1273, 0.0);
    uint _1278 = uint(_1275);
    float _1280 = float(uint(_1249));
    float _1282 = _1269 * _233;
    int _1284 = as_type<int>(_1259) + (-2);
    float _1286 = as_type<float>(_1284) * _1280;
    float _1288 = float(_1223);
    int _1290 = _1237 * int(_1278);
    int _1292 = _1290 + _1223;
    float _1294 = trunc(_1286);
    float _1296 = precise::max(_1294, 0.0);
    uint _1298 = uint(_1296);
    float _1300 = float(uint(_1292));
    float _1302 = as_type<float>(_1257) * _1300;
    float _1304 = float(_1193);
    float _1306 = floor(_1282);
    bool _1308 = _1288 >= _1304;
    bool _1310 = isnan(_1288);
    bool _1312 = _1308 || _1310;
    bool _1314 = isnan(_1304);
    bool _1316 = _1312 || _1314;
    float _1318 = float(_1316);
    int _1320 = ~_1193;
    int _1322 = _1320 + 1;
    float _1324 = trunc(_1302);
    float _1326 = precise::max(_1324, 0.0);
    uint _1328 = uint(_1326);
    float _1330 = -_1306;
    float _1332 = _1282 + _1330;
    float _1334 = trunc(_1318);
    int _1336 = int(_1334);
    int _1338 = int(_1278) + int(_1328);
    float _1340 = _1332 * _1304;
    int _1342 = _1253 * int(_1298);
    int _1344 = _1342 + _1249;
    float _1346 = _1304 * _613;
    float _1348 = as_type<float>(_1322);
    if (_273)
    {
        _1348 = 1.0;
    }
    float _1350 = _1348;
    float _1352 = float(uint(_1344));
    int _1354 = _1322 * _1338;
    int _1356 = _1354 + _1223;
    float _1358 = trunc(_1346);
    int _1360 = int(_1358);
    float _1362 = _1350;
    if (!_273)
    {
        _1362 = 1.2345600128173828125;
    }
    float _1364 = _1362;
    float _1366 = as_type<float>(_1284) * _1352;
    bool _1368 = uint(_1356) >= uint(_1193);
    int _1370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1372 = _1370 != 0;
    float _1374 = _1364 * _1213;
    bool _1376 = !_1368;
    int _1378 = _1376 ? 0 : (-1);
    float _1380 = trunc(_1366);
    float _1382 = precise::max(_1380, 0.0);
    uint _1384 = uint(_1382);
    bool _1386 = !_1372;
    int _1388 = _1386 ? 0 : 1;
    int _1390 = ~_1338;
    int _1392 = _1390 + _1378;
    int _1394 = _1392 + 1;
    int _1396 = abs(_1388);
    int _1398 = ~_1336;
    int _1400 = _1398 + 1;
    int _1402 = _1400 + 1;
    int _1404 = _1193 * _1394;
    int _1406 = _1404 + _1223;
    float _1408 = trunc(_1340);
    int _1410 = int(_1408);
    int _1412 = ~_1233;
    int _1414 = _1412 + 1;
    bool _1416 = !_1239;
    int _1418 = _1416 ? _1406 : (-1);
    int _1420 = int(_1298) + int(_1384);
    int _1422 = _1418 * _1402;
    int _1424 = _1193 + (-1);
    int _1426 = abs(_683);
    int _1428 = _1414 * _1420;
    int _1430 = _1428 + _1249;
    float _1432 = floor(_1374);
    int _1434 = _1336 * _1424;
    int _1436 = _1434 + _1422;
    int _1438 = _1410 * _1396;
    int _1440 = _1438 + _1223;
    float _1442 = float(_1233);
    float _1444 = float(_1249);
    int _1446 = _1436 * _1426;
    bool _1448 = uint(_1430) >= uint(_1233);
    int _1450 = abs(_689);
    bool _1452 = _1444 >= _1442;
    bool _1454 = isnan(_1444);
    bool _1456 = _1452 || _1454;
    bool _1458 = isnan(_1442);
    bool _1460 = _1456 || _1458;
    float _1462 = float(_1460);
    int _1464 = abs(_693);
    bool _1466 = !_1448;
    int _1468 = _1466 ? 0 : (-1);
    int _1470 = _1360 * _1450;
    int _1472 = _1470 + _1446;
    int _1474 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1476 = _1474 != 0;
    float _1478 = trunc(_1462);
    int _1480 = int(_1478);
    float _1482 = -_1432;
    float _1484 = _1374 + _1482;
    int _1486 = ~_1420;
    int _1488 = _1486 + _1468;
    int _1490 = _1488 + 1;
    int _1492 = _1440 * _1464;
    int _1494 = _1492 + _1472;
    bool _1496 = !_1476;
    int _1498 = _1496 ? 0 : 1;
    float _1500 = _1484 * _1442;
    int _1502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1504 = _1502 != 0;
    int _1506 = _1233 * _1490;
    int _1508 = _1506 + _1249;
    int _1510 = abs(_1498);
    float _1512 = _1442 * _613;
    bool _1514 = !_1504;
    int _1516 = _1514 ? 0 : 1;
    float _1518 = trunc(_1500);
    int _1520 = int(_1518);
    int _1522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1524 = _1522 != 0;
    int _1526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1528 = _1526 != 0;
    int _1530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1532 = _1530 != 0;
    int _1534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1536 = _1534 != 0;
    int _1538 = _1410 * _1510;
    int _1540 = _1538 + _1494;
    int _1542 = abs(_1516);
    int _1544 = ~_1480;
    int _1546 = _1544 + 1;
    int _1548 = _1546 + 1;
    bool _1550 = !_1255;
    int _1552 = _1550 ? _1508 : (-1);
    float _1554 = trunc(_1512);
    int _1556 = int(_1554);
    float _1558 = float(uint(_1540));
    bool _1560 = !_1528;
    int _1562 = _1560 ? 0 : 1;
    int _1564 = _1552 * _1548;
    bool _1566 = !_1524;
    int _1568 = _1566 ? 0 : 1;
    float _1570 = as_type<float>(_1257) * _1558;
    int _1572 = _1233 + (-1);
    int _1574 = abs(_1562);
    int _1576 = _1480 * _1572;
    int _1578 = _1576 + _1564;
    int _1580 = abs(_1568);
    float _1582 = trunc(_1570);
    float _1584 = precise::max(_1582, 0.0);
    uint _1586 = uint(_1584);
    int _1588 = _1578 * _1574;
    int _1590 = _1520 * _1542;
    int _1592 = _1590 + _1249;
    bool _1594 = !_1532;
    int _1596 = _1594 ? 0 : 1;
    int _1598 = ~_1193;
    int _1600 = _1598 + 1;
    int _1602 = _1556 * _1580;
    int _1604 = _1602 + _1588;
    bool _1606 = !_1536;
    int _1608 = _1606 ? 0 : 1;
    float _1610 = float(uint(_1592));
    int _1612 = abs(_1608);
    int _1614 = abs(_1596);
    float _1616 = float(uint(_1440));
    int _1618 = _1600 * int(_1586);
    int _1620 = _1618 + _1540;
    float _1622 = as_type<float>(_1284) * _1610;
    int _1624 = _1592 * _1614;
    int _1626 = _1624 + _1604;
    float _1628 = as_type<float>(_1257) * _1616;
    float _1630 = float(uint(_1620));
    int _1632 = _1520 * _1612;
    int _1634 = _1632 + _1626;
    float _1636 = trunc(_1622);
    float _1638 = precise::max(_1636, 0.0);
    uint _1640 = uint(_1638);
    int _1642 = ~_1233;
    int _1644 = _1642 + 1;
    float _1646 = as_type<float>(_1257) * _1630;
    int _1648 = ~_1193;
    int _1650 = _1648 + 1;
    float _1652 = float(uint(_1634));
    float _1654 = trunc(_1628);
    float _1656 = precise::max(_1654, 0.0);
    uint _1658 = uint(_1656);
    int _1660 = ~_1233;
    int _1662 = _1660 + 1;
    float _1664 = as_type<float>(_1284) * _1652;
    float _1666 = trunc(_1646);
    float _1668 = precise::max(_1666, 0.0);
    uint _1670 = uint(_1668);
    float _1672 = trunc(_1664);
    float _1674 = precise::max(_1672, 0.0);
    uint _1676 = uint(_1674);
    int _1678 = _1650 * int(_1658);
    int _1680 = _1678 + _1440;
    float _1682 = float(uint(_1680));
    int _1684 = _1644 * int(_1640);
    int _1686 = _1684 + _1592;
    int _1688 = int(_1586) + int(_1670);
    int _1690 = ~_1193;
    int _1692 = _1690 + 1;
    float _1694 = as_type<float>(_1257) * _1682;
    float _1696 = float(uint(_1686));
    int _1698 = _1662 * int(_1676);
    int _1700 = _1698 + _1634;
    float _1702 = as_type<float>(_1284) * _1696;
    float _1704 = trunc(_1694);
    float _1706 = precise::max(_1704, 0.0);
    uint _1708 = uint(_1706);
    float _1710 = float(uint(_1700));
    int _1712 = _1692 * _1688;
    int _1714 = _1712 + _1540;
    float _1716 = as_type<float>(_1284) * _1710;
    bool _1718 = uint(_1714) >= uint(_1193);
    float _1720 = trunc(_1702);
    float _1722 = precise::max(_1720, 0.0);
    uint _1724 = uint(_1722);
    int _1726 = ~_1233;
    int _1728 = _1726 + 1;
    bool _1730 = !_1718;
    int _1732 = _1730 ? 0 : (-1);
    int _1734 = int(_1658) + int(_1708);
    float _1736 = trunc(_1716);
    float _1738 = precise::max(_1736, 0.0);
    uint _1740 = uint(_1738);
    int _1742 = ~_1688;
    int _1744 = _1742 + _1732;
    int _1746 = _1744 + 1;
    int _1748 = _1193 * _1746;
    int _1750 = _1748 + _1540;
    int _1752 = ~_1193;
    int _1754 = _1752 + 1;
    int _1756 = int(_1640) + int(_1724);
    bool _1758 = !_1239;
    int _1760 = _1758 ? _1750 : (-1);
    int _1762 = _1754 * _1734;
    int _1764 = _1762 + _1440;
    int _1766 = _1760 & 3;
    bool _1768 = _1766 != 0;
    int _1770 = int(_1676) + int(_1740);
    int _1772 = _1760 & 3;
    bool _1774 = _1772 != 0;
    bool _1776 = uint(_1766) >= 2u;
    int _1778 = _1728 * _1770;
    int _1780 = _1778 + _1634;
    int _1782 = _1774 ? 0 : 1;
    bool _1784 = uint(_1764) >= uint(_1193);
    int _1786 = _1776 ? 0 : 1;
    bool _1788 = uint(_1780) >= uint(_1233);
    bool _1790 = !_1784;
    int _1792 = _1790 ? 0 : (-1);
    bool _1794 = !_1788;
    int _1796 = _1794 ? 0 : (-1);
    bool _1798 = uint(_1766) > 1u;
    int _1800 = ~_1734;
    int _1802 = _1800 + _1792;
    int _1804 = _1802 + 1;
    int _1806 = ~_1770;
    int _1808 = _1806 + _1796;
    int _1810 = _1808 + 1;
    int _1812 = ~_1233;
    int _1814 = _1812 + 1;
    int _1816 = _1193 * _1804;
    int _1818 = _1816 + _1440;
    int _1820 = ~_1782;
    int _1822 = _1820 + 1;
    int _1824 = _1822 + 1;
    int _1826 = _1233 * _1810;
    int _1828 = _1826 + _1634;
    bool _1830 = _239 > 0.5;
    int _1832 = _1814 * _1756;
    int _1834 = _1832 + _1592;
    bool _1836 = !_1239;
    int _1838 = _1836 ? _1818 : (-1);
    bool _1840 = !_1255;
    int _1842 = _1840 ? _1828 : (-1);
    int _1844 = _1824;
    if (!_1798)
    {
        int _1846 = ~_1782;
        int _1848 = _1846 + 1;
        _1844 = _1848;
    }
    int _1850 = _1844;
    int _1852 = _1760 >> 31;
    int _1854 = _1842 >> 31;
    bool _1856 = uint(_1834) >= uint(_1233);
    int _1858 = _1852 & 3;
    float _1860 = -_201;
    int _1862 = _1830 ? as_type<int>(_1860) : as_type<int>(_201);
    int _1864 = _1854 & 3;
    int _1866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1868 = _1866 != 0;
    int _1870 = _1760 + _1858;
    int _1872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1874 = _1872 != 0;
    int _1876 = _1842 + _1864;
    bool _1878 = !_1868;
    int _1880 = _1878 ? 0 : 1;
    int _1882 = _1842 & 3;
    bool _1884 = _1882 != 0;
    bool _1886 = !_1856;
    int _1888 = _1886 ? 0 : (-1);
    int _1890 = _1870 >> 2;
    bool _1892 = !_1874;
    float _1894 = _1892 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _1896 = _1876 >> 2;
    int _1898 = _1842 & 3;
    bool _1900 = _1898 != 0;
    bool _1902 = !_1884;
    int _1904 = _1902 ? 0 : 1;
    int _1906 = ~_1756;
    int _1908 = _1906 + _1888;
    int _1910 = _1908 + 1;
    bool _1912 = uint(_1882) > 1u;
    int _1914 = _1890 << 4;
    int _1916 = _1914 + 368;
    int _1918 = _1233 * _1910;
    int _1920 = _1918 + _1592;
    int _1922 = _1896 << 4;
    int _1924 = _1922 + 512;
    int _1926 = _1900 ? 0 : 1;
    bool _1928 = _1766 != 3;
    uint _1930 = uint(int(uint(_1924) >> uint(2)));
    uint _1932 = uint(int(uint(int(_1930)) >> uint(2)));
    int _1934 = int(_1930) & 3;
    float _1936 = (*spvDescriptorSet0.vp_c9)._m0[int(_1932)][_1934];
    int _1938 = int(_1930) + 1;
    uint _1940 = uint(int(uint(_1938) >> uint(2)));
    int _1942 = _1938 & 3;
    float _1944 = (*spvDescriptorSet0.vp_c9)._m0[int(_1940)][_1942];
    bool _1946 = _1766 != 3;
    int _1948 = ~_1926;
    int _1950 = _1948 + 1;
    int _1952 = _1950 + 1;
    int _1954 = _1952;
    float _1956 = _1894;
    if (!_1912)
    {
        int _1958 = ~_1926;
        int _1960 = _1958 + 1;
        _1954 = _1960;
    }
    int _1962 = _1954;
    bool _1964 = _1882 != 3;
    uint _1966 = uint(int(uint(_1916) >> uint(2)));
    uint _1968 = uint(int(uint(int(_1966)) >> uint(2)));
    int _1970 = int(_1966) & 3;
    float _1972 = (*spvDescriptorSet0.vp_c9)._m0[int(_1968)][_1970];
    int _1974 = int(_1966) + 1;
    uint _1976 = uint(int(uint(_1974) >> uint(2)));
    int _1978 = _1974 & 3;
    float _1980 = (*spvDescriptorSet0.vp_c9)._m0[int(_1976)][_1978];
    bool _1982 = !_1946;
    int _1984 = _1982 ? 0 : (-1);
    bool _1986 = uint(_1882) >= 2u;
    int _1988 = ~_1786;
    int _1990 = _1988 + 1;
    int _1992 = _1990 + 1;
    int _1994 = _1992;
    if (_1928)
    {
        int _1996 = ~_1786;
        int _1998 = _1996 + 1;
        _1994 = _1998;
    }
    int _2000 = _1994;
    bool _2002 = !_1768;
    int _2004 = _2002 ? 0 : 1;
    int _2006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2008 = _2006 != 0;
    int _2010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2012 = _2010 != 0;
    int _2014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2016 = _2014 != 0;
    int _2018 = _1986 ? 0 : 1;
    bool _2020 = !_1255;
    int _2022 = _2020 ? _1920 : (-1);
    bool _2024 = _1882 != 3;
    int _2026 = _1924 + 8;
    uint _2028 = uint(int(uint(_2026) >> uint(2)));
    uint _2030 = uint(int(uint(int(_2028)) >> uint(2)));
    int _2032 = int(_2028) & 3;
    float _2034 = (*spvDescriptorSet0.vp_c9)._m0[int(_2030)][_2032];
    int _2036 = int(_2028) + 1;
    uint _2038 = uint(int(uint(_2036) >> uint(2)));
    int _2040 = _2036 & 3;
    float _2042 = (*spvDescriptorSet0.vp_c9)._m0[int(_2038)][_2040];
    int _2044 = ~_2018;
    int _2046 = _2044 + 1;
    int _2048 = _2046 + 1;
    int _2050 = _2048;
    if (_1964)
    {
        int _2052 = ~_2018;
        int _2054 = _2052 + 1;
        _2050 = _2054;
    }
    int _2056 = _2050;
    int _2058 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2060 = _2058 != 0;
    int _2062 = _1916 + 8;
    uint _2064 = uint(int(uint(_2062) >> uint(2)));
    uint _2066 = uint(int(uint(int(_2064)) >> uint(2)));
    int _2068 = int(_2064) & 3;
    float _2070 = (*spvDescriptorSet0.vp_c9)._m0[int(_2066)][_2068];
    int _2072 = int(_2064) + 1;
    uint _2074 = uint(int(uint(_2072) >> uint(2)));
    int _2076 = _2072 & 3;
    float _2078 = (*spvDescriptorSet0.vp_c9)._m0[int(_2074)][_2076];
    float _2080 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2082 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2084 = abs(_1962);
    float _2086 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2088 = _2080 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2090 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2092 = _2082 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2094 = _2086 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2096 = abs(_1850);
    int _2098 = abs(_2004);
    out.m_82.x = _2088;
    out.m_82.y = _2092;
    out.m_82.z = _2094;
    out.m_82.w = _2090;
    int _2100 = ~_2096;
    int _2102 = _2100 + 1;
    int _2104 = _2102 + 1;
    bool _2106 = !_2024;
    int _2108 = _2106 ? 0 : (-1);
    bool _2110 = _233 > 0.5;
    int _2112 = _2104 * as_type<int>(_1980);
    bool _2114 = _235 > 0.5;
    float _2116 = -_197;
    int _2118 = _2110 ? as_type<int>(_2116) : as_type<int>(_197);
    float _2120 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2122 = int(_2120);
    float _2124 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2126 = _1219 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2128 = abs(_1904);
    float _2130 = _1007 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2132 = ~_2084;
    int _2134 = _2132 + 1;
    int _2136 = _2134 + 1;
    int _2138 = ~_2098;
    int _2140 = _2138 + 1;
    int _2142 = _2140 + 1;
    int _2144 = ~_2128;
    int _2146 = _2144 + 1;
    int _2148 = _2146 + 1;
    int _2150 = _2136 * as_type<int>(_1944);
    bool _2152 = _237 > 0.5;
    int _2154 = _2142 * as_type<int>(_1972);
    int _2156 = _2154 + _2112;
    float _2158 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2160 = _2148 * as_type<int>(_1936);
    int _2162 = _2160 + _2150;
    int _2164 = abs(_2000);
    float _2166 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2168 = int(_2166);
    float _2170 = _2124 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2172 = _2158 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2174 = abs(_2056);
    float _2176 = _985 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_84.x = _2126;
    out.m_84.y = _2170;
    out.m_84.z = _2172;
    int _2178 = abs(_2108);
    float _2180 = as_type<float>(_2164);
    float _2182 = _2130;
    if (_1087)
    {
        float _2184 = _1129 * 6.283185482025146484375;
        float _2186 = cos(_2184);
        _2180 = _2186;
    }
    float _2188 = _2180;
    int _2190 = ~_2164;
    int _2192 = _2190 + 1;
    int _2194 = _2192 + 1;
    int _2196 = abs(_1984);
    bool _2198 = !_2008;
    float _2200 = _2198 ? _201 : as_type<float>(_1862);
    int _2202 = _2194 * as_type<int>(_2070);
    int _2204 = _2202 + _2156;
    float _2206 = float(uint(_2168));
    int _2208 = abs(_1880);
    int _2210 = ~_2174;
    int _2212 = _2210 + 1;
    int _2214 = _2212 + 1;
    float _2216 = float(uint(_2122));
    int _2218 = ~_2178;
    int _2220 = _2218 + 1;
    int _2222 = _2220 + 1;
    int _2224 = _2214 * as_type<int>(_2034);
    int _2226 = _2224 + _2162;
    float _2228 = 1.0 / _2216;
    int _2230 = _2222 * as_type<int>(_2042);
    int _2232 = _2230 + _2226;
    int _2234 = ~_2196;
    int _2236 = _2234 + 1;
    int _2238 = _2236 + 1;
    int _2240 = abs(_2122);
    int _2242 = abs(as_type<int>(_1894));
    int _2244 = _2238 * as_type<int>(_2078);
    int _2246 = _2244 + _2204;
    float _2248 = 1.0 / _2206;
    int _2250 = ~_2208;
    int _2252 = _2250 + 1;
    int _2254 = _2252 + 1;
    if (_1087)
    {
        float _2256 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2258 = _1175 + _2256;
        _1956 = _2258;
    }
    float _2260 = _1956;
    float _2262 = _985 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2264 = abs(_2168);
    int _2266 = _2246 * _2254;
    float _2268 = float(uint(_2240));
    float _2270 = -_979;
    float _2272 = fma(_2270, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2262);
    float _2274 = _985 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2276 = ~_2242;
    int _2278 = _2276 + 1;
    int _2280 = _2278 + 1;
    int _2282 = _1838 * _2208;
    int _2284 = _2282 + _2266;
    float _2286 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2272);
    float _2288 = -_979;
    float _2290 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2274);
    float _2292 = float(uint(_2264));
    int _2294 = _2232 * _2280;
    int _2296 = as_type<int>(_2228) + (-2);
    float _2298 = 1.0 / _2268;
    int _2300 = as_type<int>(_2248) + (-2);
    int _2302 = _2022 * _2242;
    int _2304 = _2302 + _2294;
    float _2306 = _999 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2308 = float(uint(_2284));
    float _2310 = -_979;
    float _2312 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2176);
    float _2314 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2290);
    float _2316 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2306);
    float _2318 = 1.0 / _2292;
    float _2320 = as_type<float>(_2296) * _2308;
    float _2322 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2312);
    int _2324 = abs(_2284);
    float _2326 = _999 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2328 = _999 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2330 = float(uint(_2304));
    float _2332 = trunc(_2320);
    float _2334 = precise::max(_2332, 0.0);
    uint _2336 = uint(_2334);
    int _2338 = as_type<int>(_2298) + (-2);
    float _2340 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2326);
    float _2342 = float(uint(_2324));
    float _2344 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2328);
    int _2346 = abs(_2304);
    float _2348 = as_type<float>(_2300) * _2330;
    int _2350 = ~_2122;
    int _2352 = _2350 + 1;
    float _2354 = as_type<float>(_2338) * _2342;
    int _2356 = as_type<int>(_2318) + (-2);
    float _2358 = _1007 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2360 = _1007 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2362 = float(uint(_2346));
    float _2364 = trunc(_2348);
    float _2366 = precise::max(_2364, 0.0);
    uint _2368 = uint(_2366);
    float _2370 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2358);
    float _2372 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2360);
    int _2374 = _2352 * int(_2336);
    int _2376 = _2374 + _2284;
    float _2378 = as_type<float>(_2356) * _2362;
    float _2380 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2370);
    float _2382 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2372);
    int _2384 = ~_2168;
    int _2386 = _2384 + 1;
    float _2388 = trunc(_2378);
    float _2390 = precise::max(_2388, 0.0);
    uint _2392 = uint(_2390);
    float _2394 = float(uint(_2376));
    float _2396 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2130);
    float _2398 = _2344;
    if (_1087)
    {
        float _2400 = _2188 + (-1.0);
        _2182 = _2400;
    }
    float _2402 = _2182;
    bool _2404 = !_2060;
    float _2406 = _2404 ? _197 : as_type<float>(_2118);
    float _2408 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2340);
    float _2410 = as_type<float>(_2296) * _2394;
    float _2412 = trunc(_2354);
    float _2414 = precise::max(_2412, 0.0);
    uint _2416 = uint(_2414);
    float _2418 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2396);
    int _2420 = ~_2240;
    int _2422 = _2420 + 1;
    float _2424 = _2402;
    if (_1087)
    {
        float _2426 = _2402 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2424 = _2426;
    }
    float _2428 = _2424;
    int _2430 = _2386 * int(_2368);
    int _2432 = _2430 + _2304;
    bool _2434 = _2168 == 0;
    if (_1087)
    {
        float _2436 = fma(_1147, _2188, _2428);
        _1149 = _2436;
    }
    float _2438 = _1149;
    float _2440 = trunc(_2410);
    float _2442 = precise::max(_2440, 0.0);
    uint _2444 = uint(_2442);
    int _2446 = ~_2264;
    int _2448 = _2446 + 1;
    float _2450 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2452 = float(uint(_2432));
    float _2454 = _197 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2456 = as_type<float>(_2448);
    if (_1087)
    {
        float _2458 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2460 = _1169 + _2458;
        _2456 = _2460;
    }
    float _2462 = _2456;
    float _2464 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2466 = _2438 + _2464;
    int _2468 = _2422 * int(_2416);
    int _2470 = _2468 + _2324;
    float _2472 = as_type<float>(_2300) * _2452;
    int _2474 = _2448 * int(_2392);
    int _2476 = _2474 + _2346;
    float _2478 = -_197;
    int _2480 = _2152 ? as_type<int>(_2478) : as_type<int>(_197);
    if (_1087)
    {
        float _2482 = _2462 * _2462;
        _1109 = _2482;
    }
    float _2484 = _1109;
    float _2486 = float(uint(_2470));
    float _2488 = float(uint(_2476));
    float _2490 = trunc(_2472);
    float _2492 = precise::max(_2490, 0.0);
    uint _2494 = uint(_2492);
    float _2496 = -_201;
    int _2498 = _2114 ? as_type<int>(_2496) : as_type<int>(_201);
    float _2500 = as_type<float>(_2338) * _2486;
    int _2502 = int(_2336) + int(_2444);
    float _2504 = as_type<float>(_2356) * _2488;
    bool _2506 = !_2012;
    float _2508 = _2506 ? _201 : as_type<float>(_2498);
    float _2510 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2344);
    bool _2512 = !_2016;
    float _2514 = _2512 ? _197 : as_type<float>(_2480);
    float _2516 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2316);
    float _2518 = trunc(_2500);
    float _2520 = precise::max(_2518, 0.0);
    uint _2522 = uint(_2520);
    int _2524 = ~_2122;
    int _2526 = _2524 + 1;
    float _2528 = _2450 * _2314;
    if (!_1087)
    {
        _2398 = _1077;
    }
    float _2530 = _2398;
    float _2532 = _2530;
    if (_1087)
    {
        float _2534 = _2260 * _2260;
        _2532 = _2534;
    }
    float _2536 = _2532;
    bool _2538 = _2168 == 0;
    int _2540 = _2526 * _2502;
    int _2542 = _2540 + _2284;
    int _2544 = int(_2368) + int(_2494);
    float _2546 = trunc(_2504);
    float _2548 = precise::max(_2546, 0.0);
    uint _2550 = uint(_2548);
    int _2552 = ~_2168;
    int _2554 = _2552 + 1;
    float _2556 = fma(_2466, _2466, _2484);
    int _2558 = ~_2240;
    int _2560 = _2558 + 1;
    float _2562 = _2450 * _2286;
    bool _2564 = uint(_2542) >= uint(_2122);
    int _2566 = _2554 * _2544;
    int _2568 = _2566 + _2304;
    float _2570 = _2450 * _2322;
    int _2572 = int(_2416) + int(_2522);
    float _2574 = _2556 + _2536;
    int _2576 = ~_2264;
    int _2578 = _2576 + 1;
    float _2580 = fma(_2454, _2408, _2528);
    bool _2582 = uint(_2568) >= uint(_2168);
    int _2584 = _2560 * _2572;
    int _2586 = _2584 + _2324;
    float _2588 = fma(_2454, _2516, _2562);
    float _2590 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2592 = int(_2392) + int(_2550);
    float _2594 = fma(_2454, _2510, _2570);
    bool _2596 = uint(_2586) >= uint(_2240);
    out.m_86.x = _2516;
    out.m_86.y = _2408;
    out.m_86.z = _2510;
    bool _2598 = !_2582;
    int _2600 = _2598 ? 0 : (-1);
    int _2602 = _2578 * _2592;
    int _2604 = _2602 + _2346;
    bool _2606 = !_2564;
    int _2608 = _2606 ? 0 : (-1);
    float _2610 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2612 = ~_2544;
    int _2614 = _2612 + _2600;
    int _2616 = _2614 + 1;
    int _2618 = ~_2502;
    int _2620 = _2618 + _2608;
    int _2622 = _2620 + 1;
    int _2624 = _2284 ^ _2122;
    int _2626 = _2168 * _2616;
    int _2628 = _2626 + _2304;
    bool _2630 = uint(_2604) >= uint(_2264);
    int _2632 = _2122 * _2622;
    int _2634 = _2632 + _2284;
    bool _2636 = !_2596;
    int _2638 = _2636 ? 0 : (-1);
    float _2640 = sqrt(_2574);
    uint _2642 = uint(int(uint(_2624) >> uint(31)));
    bool _2644 = _2122 == 0;
    bool _2646 = _2122 == 0;
    float _2648 = _2610 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2650 = _2304 ^ _2168;
    float _2652 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2654 = ~_2638;
    int _2656 = _2572 + _2654;
    int _2658 = _2656 + 1;
    float _2660 = _2590 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2662 = ~int(_2642);
    int _2664 = _2662 + 1;
    bool _2666 = !_2644;
    int _2668 = _2666 ? _2634 : (-1);
    uint _2670 = uint(int(uint(_2650) >> uint(31)));
    float _2672 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2674 = !_2630;
    int _2676 = _2674 ? 0 : (-1);
    int _2678 = _2658 ^ _2664;
    float _2680 = float(_2668);
    int _2682 = ~int(_2670);
    int _2684 = _2682 + 1;
    float _2686 = fma(_2450, _2450, 1.0);
    int _2688 = ~_2676;
    int _2690 = _2592 + _2688;
    int _2692 = _2690 + 1;
    float _2694 = fma(_2660, _2680, _365);
    int _2696 = ~_2664;
    int _2698 = _2696 + _2678;
    int _2700 = _2698 + 1;
    float _2702 = rsqrt(_2686);
    bool _2704 = !_2434;
    int _2706 = _2704 ? _2628 : (-1);
    int _2708 = _2692 ^ _2684;
    float _2710 = _2672 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _2712 = !_2646;
    int _2714 = _2712 ? _2700 : (-1);
    float _2716 = _2652 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2718 = float(_2706);
    float _2720 = _2406 + 0.5;
    int _2722 = ~_2684;
    int _2724 = _2722 + _2708;
    int _2726 = _2724 + 1;
    float _2728 = float(_2714);
    float _2730 = fma(_2716, _2718, _821);
    bool _2732 = !_2538;
    int _2734 = _2732 ? _2726 : (-1);
    float _2736 = fma(_2660, _2720, _2694);
    float _2738 = _2514 + 0.5;
    float _2740 = -_403;
    float _2742 = fma(_2648, _2728, _2740);
    float _2744 = float(_2734);
    float _2746 = _2508 + (-0.5);
    float _2748 = fma(_2716, _2738, _2730);
    float _2750 = _2450 * _2702;
    float _2752 = -_1217;
    float _2754 = fma(_2406, _2752, _2736);
    float _2756 = -_803;
    float _2758 = fma(_2710, _2744, _2756);
    float _2760 = _2200 + (-0.5);
    float _2762 = -_2648;
    float _2764 = fma(_2762, _2746, _2742);
    float _2766 = -_2380;
    float _2768 = _2750 * _2766;
    float _2770 = -_2382;
    float _2772 = _2750 * _2770;
    float _2774 = -_2418;
    float _2776 = _2750 * _2774;
    float _2778 = -_2710;
    float _2780 = fma(_2778, _2760, _2758);
    float _2782 = fma(_2702, _2286, _2768);
    float _2784 = fma(_2702, _2314, _2772);
    float _2786 = -_1207;
    float _2788 = fma(_2514, _2786, _2748);
    float _2790 = fma(_2508, _1203, _2764);
    float _2792 = fma(_2702, _2322, _2776);
    float _2794 = _2380 + _2588;
    float _2796 = fma(_2200, _1227, _2780);
    float _2798 = _2382 + _2580;
    float _2800 = _2418 + _2594;
    out.m_88.x = _2782;
    out.m_88.y = _2784;
    out.m_88.z = _2792;
    bool _2802 = _2640 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2804 = isnan(_2640);
    bool _2806 = _2802 || _2804;
    bool _2808 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2810 = _2806 || _2808;
    out.m_90.x = _2754;
    out.m_90.y = _2790;
    out.m_90.z = _2788;
    out.m_90.w = _2796;
    out.m_92.x = _1185;
    out.m_92.y = _1187;
    out.m_92.z = _1189;
    out.m_94.x = _2794;
    out.m_94.y = _2798;
    out.m_94.z = _2800;
    float _2812 = as_type<float>(_2550);
    float _2814 = _2580;
    if (!_2810)
    {
        _1263 = 1.0;
    }
    float _2816 = _1263;
    bool _2818 = !_2810;
    float _2820 = _2816;
    if (!_2818)
    {
        bool _2822 = _2640 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2824 = isnan(_2640);
        bool _2826 = _2822 || _2824;
        bool _2828 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2830 = _2826 || _2828;
        if (!_2830)
        {
            float _2832 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2834 = _2640 + _2832;
            float _2836 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2838 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2836;
            float _2840 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2842 = _2840 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2844 = 1.0 / _2838;
            float _2846 = _2834 * _2844;
            float _2848 = fma(_2846, _2842, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2820 = _2848;
            _2850 = true;
        }
        else
        {
            bool _2852 = _2640 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2854 = isnan(_2640);
            bool _2856 = _2852 || _2854;
            bool _2858 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2860 = _2856 || _2858;
            if (!_2860)
            {
                float _2862 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2864 = _2640 + _2862;
                float _2866 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2868 = _2866 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2870 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2872 = _2870 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2874 = 1.0 / _2868;
                float _2876 = _2864 * _2874;
                float _2878 = fma(_2876, _2872, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2820 = _2878;
                _2850 = true;
            }
            else
            {
                _2820 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2850 = false;
    float _2880 = _2820;
    float _2882 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2884 = _2438 + _2882;
    float _2886 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2888 = _1169 + _2886;
    float _2890 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2892 = _1175 + _2890;
    float _2894 = fma(_2884, _2880, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2896 = fma(_2888, _2880, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2898 = fma(_2892, _2880, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2900 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2902 = _2894 + _2900;
    float _2904 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2906 = _2896 + _2904;
    float _2908 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2910 = _2898 + _2908;
    float _2912 = _2902 * _2902;
    float _2914 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2916 = fma(_2906, _2906, _2912);
    float _2918 = _1133 + _2914;
    float _2920 = fma(_1043, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2922 = fma(_2910, _2910, _2916);
    float _2924 = _1133 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2926 = floor(_2920);
    float _2928 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2924);
    float _2930 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2928);
    float _2932 = rsqrt(_2922);
    float _2934 = _2930 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2936 = -_2926;
    float _2938 = _2920 + _2936;
    float _2940 = sqrt(_2922);
    float _2942 = _2932 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2944 = _1133 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2946 = _2906 * _2942;
    float _2948 = _2910 * _2942;
    float _2950 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2944);
    float _2952 = 1.0 / _2934;
    float _2954 = _2946 * _2946;
    float _2956 = _2948 * _2948;
    float _2958 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2950);
    float _2960 = _2954 + _2956;
    float _2962 = _2958 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2964 = sqrt(_2960);
    float _2966 = _2962 + _2934;
    float _2968 = _2918 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2970 = _2966 * _2952;
    float _2972 = _2970 * 0.5;
    float _2974 = _2918 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2976 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2978 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2976);
    float _2980 = fma(_1043, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2974);
    float _2982 = fma(_1045, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2980);
    float _2984 = 1.0 / _2978;
    bool _2986 = _2964 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2988 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2990 = _2964 + _2988;
    float _2992 = _2982 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2994 = trunc(_2992);
    int _2996 = int(_2994);
    float _2998 = _1189;
    float _3000 = _2960;
    float _3002 = _2942;
    int _3004 = 2;
    float _3006 = _2946;
    float _3008 = _2954;
    if (_2986)
    {
        float _3010 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2998 = _3010;
    }
    float _3012 = _2998;
    float _3014 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3016 = _2984 * _3014;
    float _3018 = fma(_1043, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2968);
    float _3020 = fma(_1045, (*spvDescriptorSet0.vp_c15)._m0[127].z, _3018);
    bool _3022 = _3016 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _3024 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    bool _3026 = _3016 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _3028 = _3020 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _3030 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _3032 = _2996 + _3030;
    int _3034 = _3032 + 1;
    float _3036 = _3020;
    int _3038 = as_type<int>(_3028);
    if (_2986)
    {
        float _3040 = rsqrt(_2960);
        _3000 = _3040;
    }
    float _3042 = _3000;
    float _3044 = precise::max(0.0, _3024);
    float _3046 = _3042;
    if (_2986)
    {
        float _3048 = _2990 * _3012;
        _3036 = _3048;
    }
    float _3050 = _3036;
    float _3052 = -_2942;
    float _3054 = -_3044;
    float _3056 = fma(_2902, _3052, _3054);
    float _3058 = trunc(_3028);
    int _3060 = int(_3058);
    float _3062 = _3056;
    if (_2986)
    {
        float _3064 = _3050 * 0.15915493667125701904296875;
        _1171 = _3064;
    }
    float _3066 = _1171;
    bool _3068 = !_3022;
    int _3070 = _3068 ? 0 : 1;
    if (_2986)
    {
        float _3072 = _3056 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3002 = _3072;
    }
    float _3074 = _3002;
    if (!_3022)
    {
        _3004 = 1;
    }
    int _3076 = _3004;
    int _3078 = _3076;
    if (!_3026)
    {
        _3078 = _3070;
    }
    int _3080 = _3078;
    float _3082 = _2982;
    if (_2986)
    {
        float _3084 = _3066 * 6.283185482025146484375;
        float _3086 = sin(_3084);
        _3082 = _3086;
    }
    float _3088 = _3082;
    bool _3090 = _3034 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _3092 = _3080 << 6;
    int _3094 = _3092 + 96;
    uint _3096 = uint(int(uint(_3094) >> uint(2)));
    uint _3098 = uint(int(uint(int(_3096)) >> uint(2)));
    int _3100 = int(_3096) & 3;
    float _3102 = (*spvDescriptorSet0.vp_c15)._m0[int(_3098)][_3100];
    int _3104 = int(_3096) + 1;
    uint _3106 = uint(int(uint(_3104) >> uint(2)));
    int _3108 = _3104 & 3;
    float _3110 = (*spvDescriptorSet0.vp_c15)._m0[int(_3106)][_3108];
    int _3112 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3114 = _3060 + _3112;
    int _3116 = _3114 + 1;
    float _3118 = _3066;
    if (_2986)
    {
        float _3120 = _3066 * 6.283185482025146484375;
        float _3122 = cos(_3120);
        _3118 = _3122;
    }
    float _3124 = _3118;
    float _3126 = fma(_1045, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    int _3128 = _3034 | _3116;
    int _3130 = _3092 + 48;
    uint _3132 = uint(int(uint(_3130) >> uint(2)));
    uint _3134 = uint(int(uint(int(_3132)) >> uint(2)));
    int _3136 = int(_3132) & 3;
    float _3138 = (*spvDescriptorSet0.vp_c15)._m0[int(_3134)][_3136];
    int _3140 = int(_3132) + 1;
    uint _3142 = uint(int(uint(_3140) >> uint(2)));
    int _3144 = _3140 & 3;
    float _3146 = (*spvDescriptorSet0.vp_c15)._m0[int(_3142)][_3144];
    bool _3148 = _3128 < 0;
    bool _3150 = _3148 || _3090;
    float _3152 = as_type<float>(_3128);
    if (_2986)
    {
        float _3154 = fma(_3088, _3074, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3152 = _3154;
    }
    float _3156 = _3152;
    float _3158 = _2894 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3160 = floor(_3126);
    bool _3162 = _3116 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3164 = _3162 || _3150;
    if (_2986)
    {
        float _3166 = _3042 * _3156;
        _2812 = _3166;
    }
    float _3168 = _2812;
    float _3170 = fma(_2896, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3158);
    int _3172 = _3092 + 104;
    uint _3174 = uint(int(uint(_3172) >> uint(2)));
    uint _3176 = uint(int(uint(int(_3174)) >> uint(2)));
    int _3178 = int(_3174) & 3;
    float _3180 = (*spvDescriptorSet0.vp_c15)._m0[int(_3176)][_3178];
    int _3182 = int(_3174) + 1;
    uint _3184 = uint(int(uint(_3182) >> uint(2)));
    int _3186 = _3182 & 3;
    float _3188 = (*spvDescriptorSet0.vp_c15)._m0[int(_3184)][_3186];
    if (_2986)
    {
        float _3190 = _3124 + (-1.0);
        _3046 = _3190;
    }
    float _3192 = _3046;
    float _3194 = _3192;
    if (_2986)
    {
        float _3196 = _2946 * _3168;
        _3006 = _3196;
    }
    float _3198 = _3006;
    float _3200 = fma(_2898, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3170);
    float _3202 = _3200;
    if (_2986)
    {
        float _3204 = _3192 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1195 = _3204;
    }
    float _3206 = _1195;
    if (!_2986)
    {
        _3194 = _2948;
    }
    float _3208 = _3194;
    int _3210 = _3092 + 64;
    uint _3212 = uint(int(uint(_3210) >> uint(2)));
    uint _3214 = uint(int(uint(int(_3212)) >> uint(2)));
    int _3216 = int(_3212) & 3;
    float _3218 = (*spvDescriptorSet0.vp_c15)._m0[int(_3214)][_3216];
    int _3220 = int(_3212) + 1;
    uint _3222 = uint(int(uint(_3220) >> uint(2)));
    int _3224 = _3220 & 3;
    float _3226 = (*spvDescriptorSet0.vp_c15)._m0[int(_3222)][_3224];
    float _3228 = _3208;
    if (_2986)
    {
        float _3230 = _2948 * _3168;
        _3228 = _3230;
    }
    float _3232 = _3228;
    if (_2986)
    {
        float _3234 = fma(_3056, _3124, _3206);
        _3062 = _3234;
    }
    float _3236 = _3062;
    if (_2986)
    {
        float _3238 = _3198 * _3198;
        _3008 = _3238;
    }
    float _3240 = _3008;
    float _3242 = _3200 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (!_2986)
    {
        _3202 = _2956;
    }
    float _3244 = _3202;
    float _3246 = _3244;
    if (_2986)
    {
        float _3248 = _3232 * _3232;
        _3246 = _3248;
    }
    float _3250 = _3246;
    float _3252 = fma(_3236, _3236, _3240);
    int _3254 = _3092 + 80;
    uint _3256 = uint(int(uint(_3254) >> uint(2)));
    uint _3258 = uint(int(uint(int(_3256)) >> uint(2)));
    int _3260 = int(_3256) & 3;
    float _3262 = (*spvDescriptorSet0.vp_c15)._m0[int(_3258)][_3260];
    int _3264 = int(_3256) + 1;
    uint _3266 = uint(int(uint(_3264) >> uint(2)));
    int _3268 = _3264 & 3;
    float _3270 = (*spvDescriptorSet0.vp_c15)._m0[int(_3266)][_3268];
    float _3272 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3274 = _3242 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3276 = -_3160;
    float _3278 = _3126 + _3276;
    float _3280 = _3252 + _3250;
    int _3282 = as_type<int>(_3274);
    if (!_3164)
    {
        float _3284 = floor(_3028);
        _2814 = _3284;
    }
    float _3286 = _2814;
    float _3288 = -_3274;
    float _3290 = fma(_3288, _3272, 1.0);
    if (!_3164)
    {
        int _3292 = _3116 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3294 = _3292 + _3034;
        _3282 = _3294;
    }
    int _3296 = _3282;
    int _3298 = _3092 + 56;
    uint _3300 = uint(int(uint(_3298) >> uint(2)));
    uint _3302 = uint(int(uint(int(_3300)) >> uint(2)));
    int _3304 = int(_3300) & 3;
    float _3306 = (*spvDescriptorSet0.vp_c15)._m0[int(_3302)][_3304];
    int _3308 = int(_3300) + 1;
    uint _3310 = uint(int(uint(_3308) >> uint(2)));
    int _3312 = _3308 & 3;
    float _3314 = (*spvDescriptorSet0.vp_c15)._m0[int(_3310)][_3312];
    float _3316 = log2(_3290);
    int _3318 = _3092 + 88;
    uint _3320 = uint(int(uint(_3318) >> uint(2)));
    uint _3322 = uint(int(uint(int(_3320)) >> uint(2)));
    int _3324 = int(_3320) & 3;
    float _3326 = (*spvDescriptorSet0.vp_c15)._m0[int(_3322)][_3324];
    int _3328 = int(_3320) + 1;
    uint _3330 = uint(int(uint(_3328) >> uint(2)));
    int _3332 = _3328 & 3;
    float _3334 = (*spvDescriptorSet0.vp_c15)._m0[int(_3330)][_3332];
    float _3336 = _2918 * _3110;
    float _3338 = fma(_1043, _3102, _3336);
    int _3340 = _3092 + 72;
    uint _3342 = uint(int(uint(_3340) >> uint(2)));
    uint _3344 = uint(int(uint(int(_3342)) >> uint(2)));
    int _3346 = int(_3342) & 3;
    float _3348 = (*spvDescriptorSet0.vp_c15)._m0[int(_3344)][_3346];
    int _3350 = int(_3342) + 1;
    uint _3352 = uint(int(uint(_3350) >> uint(2)));
    int _3354 = _3350 & 3;
    float _3356 = (*spvDescriptorSet0.vp_c15)._m0[int(_3352)][_3354];
    float _3358 = _2918 * _3146;
    float _3360 = rsqrt(_3280);
    float _3362 = fma(_1043, _3138, _3358);
    float _3364 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3366 = fma(_2940, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3364);
    float _3368 = precise::clamp(_3366, 0.0, 1.0);
    int _3370 = as_type<int>((*spvDescriptorSet0.vp_c15)._m0[23].w);
    int _3372 = as_type<int>(_3102);
    if (!_3164)
    {
        int _3374 = _3296 << 2;
        _3370 = _3374;
    }
    int _3376 = _3370;
    float _3378 = fma(_1045, _3180, _3338);
    float _3380 = _3316 * 0.693147182464599609375;
    int _3382 = _3376;
    if (!_3164)
    {
        int _3384 = 12 & _3376;
        _3382 = _3384;
    }
    int _3386 = _3382;
    float _3388 = _3378 + _3188;
    float _3390 = _2918 * _3270;
    float _3392 = _2918 * _3226;
    float _3394 = _3360 * _3198;
    float _3396 = _3360 * _3236;
    float _3398 = _3360 * _3232;
    float _3400 = fma(_1043, _3218, _3392);
    float _3402 = fma(_1043, _3262, _3390);
    float _3404 = -_3368;
    float _3406 = _3404 + 1.0;
    float _3408 = fma(_1045, _3306, _3362);
    float _3410 = _3394 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3412 = 1.0 / _3388;
    float _3414 = _3226;
    if (!_3164)
    {
        float _3416 = -_3286;
        float _3418 = _3028 + _3416;
        _3414 = _3418;
    }
    float _3420 = _3414;
    float _3422 = _3408 + _3314;
    float _3424 = _2894 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (!_3164)
    {
        uint _3426 = uint(int(uint(_3296) >> uint(2)));
        _3038 = int(_3426);
    }
    int _3428 = _3038;
    float2 _9259 = float2(_2938, _3278);
    float _3430 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9259, float2(0.0), isnan(_9259)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9259, float2(0.0), isnan(_9259)), level(0.0)).x;
    float _3432 = fma(_1045, _3326, _3402);
    float _3434 = -_3410;
    float _3436 = fma(_3396, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3434);
    float _3438 = abs(_3406);
    float _3440 = log2(_3438);
    float _3442 = _2894 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3444 = fma(_2896, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3424);
    float _3446 = -_3398;
    float _3448 = fma(_3446, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3436);
    if (!_3164)
    {
        int _3450 = _3428 << 4;
        int _3452 = _3450 + _3386;
        _3372 = _3452;
    }
    int _3454 = _3372;
    float _3456 = fma(_2896, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3442);
    float _3458 = fma(_1045, _3348, _3400);
    float _3460 = fma(_2898, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3444);
    float _3462 = _3422 * _3412;
    float _3464 = fma(_2898, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3456);
    float _3466 = _3458 + _3356;
    float _3468 = _2894 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3470 = fma(_3448, -0.5, 0.5);
    bool _3472 = _3462 >= 0.0;
    float _3474 = _3466 * _3412;
    float _3476 = fma(_2896, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3468);
    float _3478 = _3440 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _3480 = _3462 <= 1.0;
    bool _3482 = _3480 && _3472;
    float _3484 = _3464 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3486 = fma(_2898, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3476);
    float _3488 = exp2(_3478);
    bool _3490 = _3474 >= 0.0;
    bool _3492 = _3490 && _3482;
    float _3494 = _3484 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3496 = _3486 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3498 = fma(_3448, 0.5, 0.5);
    bool _3500 = _3474 <= 1.0;
    bool _3502 = _3500 && _3492;
    float _3504 = as_type<float>(_3428);
    if (!_3164)
    {
        int _3506 = _3454 + 400;
        uint _3508 = uint(int(uint(_3506) >> uint(2)));
        uint _3510 = uint(int(uint(int(_3508)) >> uint(2)));
        int _3512 = int(_3508) & 3;
        float _3514 = (*spvDescriptorSet0.vp_c15)._m0[int(_3510)][_3512];
        _3504 = _3514;
    }
    float _3516 = _3504;
    float _3518 = fma(_3496, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3494);
    float _3520 = _3460 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3522 = sqrt(_3470);
    float _3524 = fma(_3242, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3518);
    float _3526 = _3432 + _3334;
    float _3528 = _3484 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3530 = _3396 + 1.0;
    float _3532 = fma(_3498, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3534 = fma(_3520, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3524);
    float _3536 = fma(_3496, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3528);
    float _3538 = -_3396;
    float _3540 = fma(_3488, _3530, _3538);
    float _3542 = _3530;
    if (_3502)
    {
        float _3544 = float(_3080);
        _3542 = _3544;
    }
    float _3546 = _3542;
    float _3548 = fma(_3498, _3532, -0.212114393711090087890625);
    float _3550 = 1.0 / _3534;
    float _3552 = _3484 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3554 = _3380 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3556 = fma(_3498, _3548, 1.570728778839111328125);
    float _3558 = fma(_3242, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3536);
    float _3560 = fma(_3496, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3552);
    float _3562 = _3522 * 0.636619746685028076171875;
    float _3564 = _3526 * _3412;
    float _3566 = _3546;
    float _3568 = _3564;
    if (_3502)
    {
        float _3570 = rint(_3546);
        float _3572 = precise::max(_3570, 0.0);
        uint _3574 = uint(_3572);
        uint _3576 = clamp(_3574, 0u, 65535u);
        _3566 = as_type<float>(_3576);
    }
    float _3578 = _3566;
    float _3580 = fma(_3242, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3560);
    float _3582 = fma(_3520, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3558);
    float _3584 = -_3556;
    float _3586 = fma(_3562, _3584, 1.0);
    float _3588 = fma(_3540, 0.5, 0.5);
    float _3590 = fma(_3520, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3580);
    float _3592 = _3460;
    if (!_3164)
    {
        float _3594 = floor(_2992);
        _3592 = _3594;
    }
    float _3596 = _3592;
    float _3598 = _3582 * _3550;
    float _3600 = _3590 * _3550;
    float _3602 = fma(_3598, 0.5, 0.5);
    float _3604 = fma(_3600, -0.5, 0.5);
    float _3606 = _3578;
    if (_3502)
    {
        float3 _9569 = float3(_3462, _3474, float(as_type<int>(_3578)));
        float3 _9573 = select(_9569, float3(0.0), isnan(_9569));
        float _3608 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9573.xy, uint(rint(_9573.z)), _3564, level(0.0));
        _3606 = _3608;
    }
    float _3610 = _3606;
    float3 _9583 = float3(_3602, _3604, _3554);
    float _3612 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9583, float3(0.0), isnan(_9583)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9583, float3(0.0), isnan(_9583)), level(0.0)).x;
    float _3614 = _3596;
    if (!_3164)
    {
        float _3616 = -_3596;
        float _3618 = _2992 + _3616;
        _3614 = _3618;
    }
    float _3620 = _3614;
    float _3622 = _3412;
    if (!_3164)
    {
        float _3624 = rint(_3516);
        float _3626 = precise::max(_3624, 0.0);
        uint _3628 = uint(_3626);
        uint _3630 = clamp(_3628, 0u, 65535u);
        _3622 = as_type<float>(_3630);
    }
    float _3632 = _3622;
    float3 _9620 = float3(_3602, _3604, _3554);
    float4 _3635 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9620, float3(0.0), isnan(_9620)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9620, float3(0.0), isnan(_9620)), level(0.0)).xyzw;
    float _3637 = _3635.x;
    float _3639 = _3635.y;
    float _3641 = _3635.z;
    float _3643 = _3635.w;
    float2 _9636 = float2(_3586, _3588);
    float3 _3645 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9636, float2(0.0), isnan(_9636)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9636, float2(0.0), isnan(_9636)), level(0.0)).xyz;
    float _3647 = _3645.x;
    float _3649 = _3645.y;
    float _3651 = _3645.z;
    float _3653 = _3632;
    if (!_3164)
    {
        float3 _9657 = float3(_3620, _3420, float(as_type<int>(_3632)));
        float3 _9659 = select(_9657, float3(0.0), isnan(_9657));
        float _3655 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9659.xy, uint(rint(_9659.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9659.xy, uint(rint(_9659.z)), level(0.0)).x;
        _3653 = _3655;
    }
    float _3657 = _3653;
    float _3659 = abs(_3016);
    float _3661 = log2(_3659);
    float _3663 = _3484 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3665 = fma(_3496, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3663);
    float _3667 = fma(_3242, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3665);
    bool _3669 = _3016 <= 8000.0;
    bool _3671 = isnan(_3016);
    bool _3673 = _3669 || _3671;
    bool _3675 = isnan(8000.0);
    bool _3677 = _3673 || _3675;
    float _3679 = float(_3677);
    float _3681 = fma(_3520, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3667);
    float _3683 = _3440 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3685 = _3661 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.gl_Position.x = _3582;
    out.gl_Position.y = _3590;
    out.gl_Position.z = _3681;
    out.gl_Position.w = _3534;
    float _3687 = exp2(_3683);
    float _3689 = exp2(_3685);
    float _3691 = fma(_3689, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3693 = precise::clamp(_3691, 0.0, 1.0);
    float _3695 = fma(_3693, -2.0, 3.0);
    float _3697 = _3693 * _3693;
    float _3699 = _3697 * _3695;
    float _3701 = _3681 + _3534;
    float _3703 = _3701 * 0.5;
    float _3705 = -_3699;
    float _3707 = _3705 + 1.0;
    out.m_96.z = _3703;
    out.m_96.w = _3534;
    float _3709 = fma(_3707, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3699);
    float _3711 = -_3687;
    float _3713 = _3711 + 1.0;
    float _3715 = _3679 * _3709;
    float _3717 = _3679;
    float _3719 = _3582;
    float _3721 = _3681;
    if (!_3502)
    {
        _3717 = 1.0;
    }
    float _3723 = _3717;
    float _3725 = _3713 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3727 = _3715 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3729 = -_3430;
    float _3731 = _3729 + 1.0;
    float _3733 = _3723;
    float _3735 = _3727;
    if (_3502)
    {
        bool _3737 = _3610 >= _3564;
        bool _3739 = isnan(_3610);
        bool _3741 = _3737 || _3739;
        bool _3743 = isnan(_3564);
        bool _3745 = _3741 || _3743;
        float _3747 = float(_3745);
        _3733 = _3747;
    }
    float _3749 = _3733;
    float _3751 = _3731 * _3727;
    float _3753 = precise::clamp(_3751, 0.0, 1.0);
    float _3755 = _3749;
    if (_3164)
    {
        _3735 = 1.0;
    }
    float _3757 = _3735;
    float _3759 = _3757;
    if (!_3164)
    {
        int _3761 = _3296 << 4;
        int _3763 = _3761 + 2048;
        uint _3765 = uint(int(uint(_3763) >> uint(2)));
        uint _3767 = uint(int(uint(int(_3765)) >> uint(2)));
        int _3769 = int(_3765) & 3;
        float _3771 = (*spvDescriptorSet0.vp_c15)._m0[int(_3767)][_3769];
        int _3773 = int(_3765) + 1;
        uint _3775 = uint(int(uint(_3773) >> uint(2)));
        int _3777 = _3773 & 3;
        float _3779 = (*spvDescriptorSet0.vp_c15)._m0[int(_3775)][_3777];
        int _3781 = _3763 + 8;
        uint _3783 = uint(int(uint(_3781) >> uint(2)));
        uint _3785 = uint(int(uint(int(_3783)) >> uint(2)));
        int _3787 = int(_3783) & 3;
        float _3789 = (*spvDescriptorSet0.vp_c15)._m0[int(_3785)][_3787];
        int _3791 = int(_3783) + 1;
        uint _3793 = uint(int(uint(_3791) >> uint(2)));
        int _3795 = _3791 & 3;
        float _3797 = (*spvDescriptorSet0.vp_c15)._m0[int(_3793)][_3795];
        float _3799 = _2918 * _3779;
        float _3801 = fma(_1043, _3771, _3799);
        float _3803 = fma(_1045, _3789, _3801);
        float _3805 = _3803 + _3797;
        float _3807 = precise::clamp(_3805, 0.0, 1.0);
        float _3809 = -_3807;
        float _3811 = _3809 + _3657;
        float _3813 = fma(_3811, 500.0, 1.5);
        float _3815 = exp2(_3813);
        float _3817 = 0.0 + _3815;
        float _3819 = precise::clamp(_3817, 0.0, 1.0);
        _3759 = _3819;
        _3568 = _3815;
        _3719 = _3789;
    }
    float _3821 = _3759;
    float _3823 = _3568;
    float _3825 = _3719;
    float _3827 = _3749 * _3821;
    float _3829 = _3725 * _3612;
    float _3831 = -_3753;
    float _3833 = fma(_3831, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_98.x = _2896;
    out.m_98.y = _2894;
    out.m_98.z = _2898;
    bool _3835 = _2940 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3837 = isnan(_2940);
    bool _3839 = _3835 || _3837;
    bool _3841 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3843 = _3839 || _3841;
    float _3845 = _3643 * _3829;
    float _3847 = -_3827;
    float _3849 = fma(_3847, _3833, 1.0);
    float _3851 = precise::clamp(_3849, 0.0, 1.0);
    float _3853 = -_3725;
    float _3855 = _3853 + 1.0;
    float _3857 = _3651 * _3829;
    float _3859 = fma(_3647, _3845, _3637);
    float _3861 = fma(_3649, _3845, _3639);
    float _3863 = _3643 * _3855;
    float _3865 = _3851 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3867 = fma(_3643, _3857, _3641);
    out.m_100.x = _3865;
    float _3869 = _3825;
    float _3871 = _3823;
    float _3873 = _3855;
    float _3875 = _3851;
    if (!_3843)
    {
        _3721 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3877 = _3721;
    float _3879 = _3877;
    float _3881 = _3877;
    if (!_3843)
    {
        _3755 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3883 = _3755;
    out.m_102.x = _3859;
    out.m_102.y = _3861;
    out.m_102.z = _3867;
    out.m_102.w = _3863;
    float _3885 = _3883;
    float _3887 = _3883;
    if (!_3843)
    {
        _3869 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3889 = _3869;
    float _3891 = _3889;
    float _3893 = _3889;
    if (!_3843)
    {
        _3871 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3895 = _3871;
    float _3897 = _3895;
    float _3899 = _3895;
    if (!_3843)
    {
        _3873 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3901 = _3873;
    float _3903 = _3901;
    float _3905 = _3901;
    if (!_3843)
    {
        _3875 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3907 = _3875;
    bool _3909 = !_3843;
    float _3911 = _3907;
    float _3913 = _3907;
    if (!_3909)
    {
        bool _3915 = _2940 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3917 = isnan(_2940);
        bool _3919 = _3915 || _3917;
        bool _3921 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3923 = _3919 || _3921;
        if (!_3923)
        {
            float _3925 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3927 = _2940 + _3925;
            float _3929 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3931 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3929;
            float _3933 = 1.0 / _3931;
            float _3935 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3937 = _3935 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3939 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3941 = _3939 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3943 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3945 = _3943 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3947 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3949 = _3947 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3951 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3953 = _3951 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3955 = _3927 * _3933;
            float _3957 = precise::clamp(_3955, 0.0, 1.0);
            float _3959 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3961 = _3959 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3963 = fma(_3957, _3937, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3965 = fma(_3957, _3961, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3967 = fma(_3957, _3941, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3969 = fma(_3957, _3945, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3971 = fma(_3957, _3949, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3973 = fma(_3957, _3953, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3887 = _3965;
            _3905 = _3971;
            _3881 = _3963;
            _3899 = _3969;
            _3893 = _3967;
            _3913 = _3973;
            _3975 = true;
        }
        else
        {
            bool _3977 = _2940 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3979 = isnan(_2940);
            bool _3981 = _3977 || _3979;
            bool _3983 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3985 = _3981 || _3983;
            if (!_3985)
            {
                _3879 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3987 = _3879;
            _3881 = _3987;
            if (!_3985)
            {
                _3885 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3989 = _3885;
            _3887 = _3989;
            if (!_3985)
            {
                _3891 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3991 = _3891;
            _3893 = _3991;
            if (!_3985)
            {
                _3897 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3993 = _3897;
            _3899 = _3993;
            if (!_3985)
            {
                _3903 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3995 = _3903;
            _3905 = _3995;
            if (!_3985)
            {
                _3911 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3997 = _3911;
            bool _3999 = !_3985;
            _3913 = _3997;
            if (!_3999)
            {
                bool _4001 = _2940 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4003 = isnan(_2940);
                bool _4005 = _4001 || _4003;
                bool _4007 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4009 = _4005 || _4007;
                if (!_4009)
                {
                    float _4011 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4013 = _2940 + _4011;
                    float _4015 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4017 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4015;
                    float _4019 = 1.0 / _4017;
                    float _4021 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4023 = _4021 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4025 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4027 = _4025 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4029 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4031 = _4029 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4033 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4035 = _4033 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4037 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4039 = _4037 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4041 = _4013 * _4019;
                    float _4043 = precise::clamp(_4041, 0.0, 1.0);
                    float _4045 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4047 = _4045 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4049 = fma(_4043, _4023, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4051 = fma(_4043, _4047, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4053 = fma(_4043, _4027, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4055 = fma(_4043, _4031, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4057 = fma(_4043, _4035, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4059 = fma(_4043, _4039, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3887 = _4051;
                    _3905 = _4057;
                    _3881 = _4049;
                    _3899 = _4055;
                    _3893 = _4053;
                    _3913 = _4059;
                    _3975 = true;
                }
                else
                {
                    _3887 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3905 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3881 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3899 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3893 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3913 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3975 = false;
    float _4061 = _3887;
    float _4063 = _3905;
    float _4065 = _3881;
    float _4067 = _3899;
    float _4069 = _3893;
    float _4071 = _3913;
    float _4073 = fma(_2798, -0.5, 0.5);
    float _4075 = precise::clamp(_4073, 0.0, 1.0);
    float _4077 = -_4061;
    float _4079 = _4077 + _4063;
    float _4081 = -_4065;
    float _4083 = _4081 + _4067;
    float _4085 = -_4069;
    float _4087 = _4085 + _4071;
    bool _4089 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4091 = fma(_4075, _4079, _4061);
    float _4093 = fma(_4075, _4083, _4065);
    float _4095 = fma(_4075, _4087, _4069);
    float _4097 = _4091 * 0.586610972881317138671875;
    out.m_104.x = 0.0;
    float _4099 = fma(_4093, 0.298911988735198974609375, _4097);
    float _4101 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4103 = fma(_4095, 0.114477999508380889892578125, _4099);
    out.m_63.x = _4101;
    float _4105 = -_4103;
    float _4107 = _4093 + _4105;
    float _4109 = -_4103;
    float _4111 = _4091 + _4109;
    float _4113 = -_4103;
    float _4115 = _4095 + _4113;
    float _4117 = fma(_4107, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4103);
    float _4119 = fma(_4111, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4103);
    float _4121 = fma(_4115, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4103);
    out.m_106.x = _4117;
    out.m_106.y = _4119;
    out.m_106.z = _4121;
    if (!_4089)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4123 = -_2894;
    float _4125 = _4123 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4127 = -_2896;
    float _4129 = _4127 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4131 = -_2898;
    float _4133 = _4131 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4135 = _4125 * _4125;
    float _4137 = fma(_4129, _4129, _4135);
    float _4139 = fma(_4133, _4133, _4137);
    float _4141 = sqrt(_4139);
    float _4143 = rsqrt(_4139);
    float _4145 = -_4141;
    float _4147 = _4145 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4149 = _4147 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4151 = precise::clamp(_4149, 0.0, 1.0);
    float _4153 = _4129 * _4143;
    float _4155 = _4125 * _4143;
    float _4157 = abs(_4151);
    float _4159 = log2(_4157);
    float _4161 = _4133 * _4143;
    float _4163 = _4153 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4165 = _2798 * _4155;
    float _4167 = -_4155;
    float _4169 = -_4163;
    float _4171 = fma(_4167, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4169);
    float _4173 = fma(_2794, _4153, _4165);
    float _4175 = -_4161;
    float _4177 = fma(_4175, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4171);
    float _4179 = fma(_2800, _4161, _4173);
    float _4181 = precise::clamp(_4179, 0.0, 1.0);
    float _4183 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4185 = _4177 + _4183;
    float _4187 = _4159 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4189 = _4185 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4191 = precise::clamp(_4189, 0.0, 1.0);
    float _4193 = exp2(_4187);
    float _4195 = _4193 * _4191;
    float _4197 = _4181 * _4195;
    float _4199 = _4197 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4201 = _4197 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4203 = _4197 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_104.x = _4199;
    out.m_104.y = _4201;
    out.m_104.z = _4203;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

