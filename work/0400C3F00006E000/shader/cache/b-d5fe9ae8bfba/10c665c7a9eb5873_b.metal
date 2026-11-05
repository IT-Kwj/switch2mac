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
    texture2d<float> vp_t_tcb_1C [[id(14)]];
    sampler vp_t_tcb_1CSmplr [[id(15)]];
    texture2d_array<float> vp_t_tcb_14 [[id(16)]];
    sampler vp_t_tcb_14Smplr [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_32Smplr_w [[id(19)]];
    sampler vp_t_tcb_30Smplr_w [[id(20)]];
    sampler vp_t_tcb_1CSmplr_w [[id(21)]];
    sampler vp_t_tcb_14Smplr_w [[id(22)]];
    constant dm_border_t* dm_border [[id(23)]];
};

struct main0_out
{
    float4 m_70 [[user(locn0)]];
    float4 m_72 [[user(locn1)]];
    float4 m_80 [[user(locn2)]];
    float4 m_86 [[user(locn3)]];
    float4 m_90 [[user(locn4)]];
    float4 m_82 [[user(locn5)]];
    float4 m_78 [[user(locn6)]];
    float4 m_96 [[user(locn7)]];
    float4 m_88 [[user(locn8)]];
    float4 m_94 [[user(locn9)]];
    float4 m_92 [[user(locn10)]];
    float4 m_98 [[user(locn11)]];
    float4 m_59 [[user(locn12)]];
    float4 m_100 [[user(locn13)]];
    float4 m_84 [[user(locn14)]];
    float4 m_106 [[user(locn15)]];
    float4 m_102 [[user(locn16)]];
    float4 m_104 [[user(locn17)]];
    float4 m_74 [[user(locn18)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_76 [[attribute(1)]];
    float4 m_56 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_68 [[attribute(4)]];
    float4 m_66 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _7385 = false;
    bool _1341 = false;
    bool _1183 = false;
    bool _1041 = false;
    bool _763 = false;
    bool _515 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _120 = in.m_56.w;
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
        out.m_59.x = 0.0;
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
        float _7684 = as_type<float>(_141);
        out.gl_Position.z = _7684;
    }
    if (!_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = in.m_61.w;
    bool _147 = _145 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _149 = isnan(_145);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _155 = _151 || _153;
    float _157 = -_145;
    float _159 = _157 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _161 = 0.0;
    if (_155)
    {
        float _163 = float(_125);
        _161 = _163;
    }
    float _165 = _161;
    bool _167 = _159 >= _165;
    bool _169 = !_155;
    bool _171 = _167 || _169;
    if (_171)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _173 = _135;
    if (_171)
    {
        out.m_59.x = 0.0;
    }
    if (_171)
    {
        float _175 = _173 * 5.0;
        _143 = as_type<int>(_175);
    }
    int _177 = _143;
    if (_171)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7752 = as_type<float>(_177);
        out.gl_Position.z = _7752;
    }
    if (_171)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _179 = as_type<float>(int(gl_VertexIndex));
    float _181 = _159 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _183 = in.m_66.w;
    bool _185 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _187 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _189 = _185 || _187;
    bool _191 = isnan(1.0);
    bool _193 = _189 || _191;
    float _195 = in.m_61.x;
    float _197 = in.m_61.y;
    float _199 = in.m_61.z;
    float _201 = in.m_56.x;
    float _203 = in.m_56.y;
    float _205 = in.m_56.z;
    float _207 = 0.0;
    float _209 = _181;
    if (!_193)
    {
        float _211 = _181 * _181;
        float _213 = _211 * 0.5;
        _207 = _213;
    }
    float _215 = _207;
    float _217 = _215;
    if (!_193)
    {
        float _219 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _217 = _219;
    }
    float _221 = _217;
    int _223 = as_type<int>(_179) & 1;
    bool _225 = _223 != 0;
    int _227 = as_type<int>(_179) & 2;
    bool _229 = _227 != 0;
    int _231 = int(_225);
    int _233 = _229 ? 2 : 0;
    int _235 = _231 | _233;
    int _237 = _193 ? 4 : 0;
    int _239 = _235 | _237;
    int _241 = false ? 8 : 0;
    int _243 = _239 | _241;
    int _245 = false ? 16 : 0;
    int _247 = _243 | _245;
    int _249 = false ? 32 : 0;
    int _251 = _247 | _249;
    int _253 = false ? 64 : 0;
    int _255 = _251 | _253;
    int _257 = _255 & 4;
    bool _259 = !_225;
    float _261 = _259 ? (-0.5) : 0.5;
    bool _263 = !_229;
    float _265 = _263 ? (-0.5) : 0.5;
    bool _267 = !_193;
    float _269 = 0.0;
    float _271 = _221;
    float _273 = as_type<float>(_257);
    bool _275 = _193;
    if (!_267)
    {
        float _277 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _279 = log2(_277);
        float _281 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _283 = _281 + 1.0;
        float _285 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _287 = _181 * _279;
        float _289 = 1.0 / _283;
        float _291 = _285 * 0.693147182464599609375;
        float _293 = exp2(_287);
        float _295 = 1.0 / _291;
        float _297 = _293 + (-1.0);
        float _299 = -_297;
        float _301 = fma(_299, _295, _181);
        float _303 = _301 * _289;
        float _305 = _303 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _269 = _293;
        _271 = _305;
        _273 = _295;
    }
    float _307 = _269;
    float _309 = _271;
    float _311 = _273;
    bool _313 = !_193;
    float _315 = _307;
    float _317 = _311;
    if (!_313)
    {
        float _319 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _321 = log2(_319);
        float _323 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _325 = _323 + 1.0;
        float _327 = 1.0 / _325;
        float _329 = _181 * _321;
        float _331 = exp2(_329);
        float _333 = -_331;
        float _335 = _333 + 1.0;
        float _337 = _335 * _327;
        _315 = _331;
        _317 = _325;
        _209 = _337;
    }
    float _339 = _315;
    float _341 = _317;
    float _343 = _209;
    float _345 = _339;
    float _347 = _341;
    if (!_193)
    {
        float _349 = _159 * _159;
        float _351 = _349 * 0.5;
        _345 = _351;
    }
    float _353 = _345;
    float _355 = _353;
    if (!_193)
    {
        _347 = _159;
    }
    float _357 = _347;
    float _359 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _361 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _363 = _357;
    if (!_193)
    {
        float _365 = _353 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _355 = _365;
    }
    float _367 = _355;
    bool _369 = !_193;
    float _371 = _367;
    if (!_369)
    {
        float _373 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _375 = log2(_373);
        float _377 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _379 = _377 + 1.0;
        float _381 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _383 = _159 * _375;
        float _385 = 1.0 / _379;
        float _387 = _381 * 0.693147182464599609375;
        float _389 = exp2(_383);
        float _391 = 1.0 / _387;
        float _393 = _389 + (-1.0);
        float _395 = -_393;
        float _397 = fma(_395, _391, _159);
        float _399 = _397 * _385;
        float _401 = _399 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _371 = _401;
    }
    float _403 = _371;
    bool _405 = !_193;
    if (!_405)
    {
        float _407 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _409 = log2(_407);
        float _411 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _413 = _411 + 1.0;
        float _415 = 1.0 / _413;
        float _417 = _159 * _409;
        float _419 = exp2(_417);
        float _421 = -_419;
        float _423 = _421 + 1.0;
        float _425 = _423 * _415;
        _363 = _425;
    }
    float _427 = _363;
    float _429 = fma(_343, _195, _359);
    float _431 = _403 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _433 = _403 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _435 = _403 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _437 = fma(_343, _197, _361);
    float _439 = fma(_427, _197, _431);
    float _441 = fma(_427, _195, _433);
    float _443 = fma(_427, _199, _435);
    bool _445 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _447 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _449 = fma(_437, _183, _203);
    float _451 = -_439;
    float _453 = _437 + _451;
    float _455 = fma(_429, _183, _201);
    float _457 = fma(_343, _199, _447);
    float _459 = -_441;
    float _461 = _429 + _459;
    float _463 = _453 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _465 = _453 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _467 = _453 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _469 = -_443;
    float _471 = _457 + _469;
    float _473 = fma(_461, (*spvDescriptorSet0.vp_c10)._m0[4].x, _463);
    float _475 = fma(_461, (*spvDescriptorSet0.vp_c10)._m0[5].x, _465);
    float _477 = fma(_461, (*spvDescriptorSet0.vp_c10)._m0[6].x, _467);
    float _479 = fma(_457, _183, _205);
    float _481 = fma(_471, (*spvDescriptorSet0.vp_c10)._m0[4].z, _473);
    float _483 = fma(_471, (*spvDescriptorSet0.vp_c10)._m0[5].z, _475);
    float _485 = fma(_471, (*spvDescriptorSet0.vp_c10)._m0[6].z, _477);
    bool _487 = !_445;
    float _489 = _483;
    float _491 = _481;
    float _493 = _485;
    float _495 = _485;
    float _513;
    if (!_487)
    {
        float _497 = in.m_68.x;
        float _499 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _501 = _497 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _503 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[12].x, _159);
        float _505 = _503 * _499;
        float _507 = floor(_505);
        float _509 = -_507;
        float _511 = _505 + _509;
        _513 = _511;
        _515 = true;
    }
    else
    {
        float _517 = float(_125);
        float _519 = 1.0 / _517;
        float _521 = _159 * _519;
        _513 = _521;
    }
    _515 = false;
    float _523 = _513;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _527 = _523 + _525;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _531 = _523 + _529;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _533;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _539 = _537 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _541;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _549 = in.m_66.x;
    float _551 = in.m_66.y;
    float _553 = 1.0 / _535;
    bool _555 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _557 = isnan(_523);
    bool _559 = _555 || _557;
    bool _561 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _563 = _559 || _561;
    float _565 = float(_563);
    bool _567 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _569 = 1.0 / _539;
    float _571 = 1.0 / _543;
    float _573 = _527 * _553;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _577 = _523 + _575;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _581 = _523 + _579;
    float _583 = 1.0 / _547;
    float _585 = _531 * _569;
    bool _587 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _589 = isnan(_523);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _595 = _591 || _593;
    float _597 = float(_595);
    float _599 = -_565;
    float _601 = _599 + 1.0;
    float _603 = _597 * _601;
    float _605 = _577 * _571;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _607;
    bool _611 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _613 = isnan(_523);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _619 = _615 || _617;
    float _621 = float(_619);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _625 = _623 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _627 = fma(_609, _573, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _629 = fma(_625, _585, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _631 = _581 * _583;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _633;
    bool _637 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _639 = isnan(_523);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _645 = _641 || _643;
    float _647 = float(_645);
    bool _649 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _651 = isnan(_523);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = fma(_635, _573, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _663 = -_597;
    float _665 = _663 + 1.0;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _669 = _667 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _671 = _647 * _665;
    float _673 = -_647;
    float _675 = _673 + 1.0;
    float _677 = fma(_669, _585, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _679 = _621 * _675;
    float _681 = -_621;
    float _683 = _681 + 1.0;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _685;
    float _689 = _659 * _683;
    float _691 = -_659;
    float _693 = _691 + 1.0;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _695;
    float _699 = fma(_687, _605, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _701 = _627 * _689;
    float _703 = _661 * _689;
    float _705 = fma(_697, _605, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _711 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[143].x, _701);
    float _713 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[143].y, _703);
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _717 = _715 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _719 = fma(_709, _631, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _721 = fma(_677, _679, _711);
    float _723 = fma(_629, _679, _713);
    float _725 = fma(_717, _631, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _727 = fma(_705, _671, _721);
    float _729 = fma(_699, _671, _723);
    float _731 = fma(_719, _603, _727);
    float _733 = fma(_725, _603, _729);
    float _735 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[147].x, _731);
    float _737 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[147].y, _733);
    float _739 = _735 * _549;
    float _741 = _737 * _551;
    bool _743 = !_567;
    float _761;
    if (!_743)
    {
        float _745 = in.m_68.x;
        float _747 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _749 = _745 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _751 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[11].x, _159);
        float _753 = _751 * _747;
        float _755 = floor(_753);
        float _757 = -_755;
        float _759 = _753 + _757;
        _761 = _759;
        _763 = true;
    }
    else
    {
        float _765 = float(_125);
        float _767 = 1.0 / _765;
        float _769 = _159 * _767;
        _761 = _769;
    }
    _763 = false;
    float _771 = _761;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _775 = _771 + _773;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _779 = _771 + _777;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _783 = _771 + _781;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _785;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _793;
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _799 = _797 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _801 = 1.0 / _787;
    bool _803 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _805 = 1.0 / _791;
    bool _807 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _809 = isnan(_771);
    bool _811 = _807 || _809;
    bool _813 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _815 = _811 || _813;
    float _817 = float(_815);
    float _819 = 1.0 / _795;
    float _821 = _779 * _801;
    bool _823 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _825 = isnan(_771);
    bool _827 = _823 || _825;
    bool _829 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _831 = _827 || _829;
    float _833 = float(_831);
    float _835 = 1.0 / _799;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _839 = _771 + _837;
    float _841 = _839 * _805;
    bool _843 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _845 = isnan(_771);
    bool _847 = _843 || _845;
    bool _849 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _851 = _847 || _849;
    float _853 = float(_851);
    float _855 = _775 * _819;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _857;
    float _861 = -_853;
    float _863 = _861 + 1.0;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _865;
    float _869 = _817 * _863;
    float _871 = _783 * _835;
    bool _873 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _875 = isnan(_771);
    bool _877 = _873 || _875;
    bool _879 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _881 = _877 || _879;
    float _883 = float(_881);
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _885;
    float _889 = -_817;
    float _891 = _889 + 1.0;
    bool _893 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _895 = isnan(_771);
    bool _897 = _893 || _895;
    bool _899 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _901 = _897 || _899;
    float _903 = float(_901);
    float _905 = fma(_867, _855, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _907 = -_883;
    float _909 = _907 + 1.0;
    float _911 = fma(_859, _855, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _913 = fma(_887, _855, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _915 = _883 * _891;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _919 = _917 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _921 = _903 * _909;
    float _923 = -_903;
    float _925 = _923 + 1.0;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _929 = _927 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _933 = _931 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _935 = fma(_919, _871, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _937 = _833 * _925;
    float _939 = fma(_929, _871, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _941 = fma(_933, _871, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _943 = -_833;
    float _945 = _943 + 1.0;
    float _947 = _905 * _937;
    float _949 = _911 * _937;
    float _951 = _913 * _937;
    float _953 = fma(_945, (*spvDescriptorSet0.vp_c9)._m0[107].x, _947);
    float _955 = fma(_945, (*spvDescriptorSet0.vp_c9)._m0[107].y, _949);
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _957;
    float _961 = fma(_945, (*spvDescriptorSet0.vp_c9)._m0[107].z, _951);
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _963;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _967;
    float _971 = fma(_939, _921, _953);
    float _973 = fma(_941, _921, _955);
    float _975 = fma(_935, _921, _961);
    float _977 = fma(_965, _821, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _979 = fma(_959, _821, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _981 = fma(_969, _821, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _985 = _983 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _987 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _989 = _987 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _993 = _991 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _995 = fma(_977, _915, _971);
    float _997 = fma(_985, _841, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _999 = fma(_989, _841, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _1001 = fma(_993, _841, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _1003 = fma(_979, _915, _973);
    float _1005 = fma(_981, _915, _975);
    float _1007 = fma(_997, _869, _995);
    float _1009 = fma(_999, _869, _1003);
    float _1011 = fma(_1001, _869, _1005);
    float _1013 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[111].x, _1007);
    float _1015 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[111].y, _1009);
    float _1017 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[111].z, _1011);
    bool _1019 = !_803;
    int _1021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _1039;
    if (!_1019)
    {
        float _1023 = in.m_68.x;
        float _1025 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1027 = _1023 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1029 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[11].y, _159);
        float _1031 = _1029 * _1025;
        float _1033 = floor(_1031);
        float _1035 = -_1033;
        float _1037 = _1031 + _1035;
        _1039 = _1037;
        _1041 = true;
    }
    else
    {
        float _1043 = float(_125);
        float _1045 = 1.0 / _1043;
        float _1047 = _159 * _1045;
        _1039 = _1047;
    }
    _1041 = false;
    float _1049 = _1039;
    float _1051 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1053 = _1049 + _1051;
    float _1055 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1057 = _1055 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1059 = _1049 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1061 = isnan(_1049);
    bool _1063 = _1059 || _1061;
    bool _1065 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1067 = _1063 || _1065;
    float _1069 = float(_1067);
    float _1071 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1073 = _1071 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1075 = _1049 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1077 = isnan(_1049);
    bool _1079 = _1075 || _1077;
    bool _1081 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1083 = _1079 || _1081;
    float _1085 = float(_1083);
    float _1087 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1089 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1087;
    bool _1091 = _1049 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1093 = isnan(_1049);
    bool _1095 = _1091 || _1093;
    bool _1097 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1099 = _1095 || _1097;
    float _1101 = float(_1099);
    float _1103 = 1.0 / _1057;
    float _1105 = -_1069;
    float _1107 = _1105 + 1.0;
    bool _1109 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1111 = 1.0 / _1073;
    float _1113 = _1089 * _1103;
    float _1115 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1117 = _1115 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1119 = fma(_1113, _1053, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1121 = _1085 * _1107;
    float _1123 = -_1101;
    float _1125 = _1123 + 1.0;
    float _1127 = -_1085;
    float _1129 = _1127 + 1.0;
    float _1131 = _1117 * _1111;
    float _1133 = _1119 * _1121;
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1137 = _1049 + _1135;
    float _1139 = _1069 * _1125;
    float _1141 = _1013 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1143 = fma(_1129, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1133);
    float _1145 = fma(_1131, _1137, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1147 = _1017 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1149 = _1141 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1151 = fma(_1145, _1139, _1143);
    float _1153 = _1015 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1155 = _1147 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1157 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1151);
    float _1159 = _1153 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1161 = _1157 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_70.x = _1149;
    out.m_70.y = _1159;
    out.m_70.z = _1155;
    out.m_70.w = _1161;
    bool _1163 = !_1109;
    float _1181;
    if (!_1163)
    {
        float _1165 = in.m_68.x;
        float _1167 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1169 = _1165 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1171 = fma(_1169, (*spvDescriptorSet0.vp_c9)._m0[11].w, _159);
        float _1173 = _1171 * _1167;
        float _1175 = floor(_1173);
        float _1177 = -_1175;
        float _1179 = _1173 + _1177;
        _1181 = _1179;
        _1183 = true;
    }
    else
    {
        float _1185 = float(_125);
        float _1187 = 1.0 / _1185;
        float _1189 = _159 * _1187;
        _1181 = _1189;
    }
    _1183 = false;
    float _1191 = _1181;
    float _1193 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1195 = _1191 + _1193;
    float _1197 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1199 = _1197 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1201 = _1191 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1203 = isnan(_1191);
    bool _1205 = _1201 || _1203;
    bool _1207 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1209 = _1205 || _1207;
    float _1211 = float(_1209);
    float _1213 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1215 = _1213 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1217 = _1191 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1219 = isnan(_1191);
    bool _1221 = _1217 || _1219;
    bool _1223 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1225 = _1221 || _1223;
    float _1227 = float(_1225);
    float _1229 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1231 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1229;
    bool _1233 = _1191 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1235 = isnan(_1191);
    bool _1237 = _1233 || _1235;
    bool _1239 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1241 = _1237 || _1239;
    float _1243 = float(_1241);
    float _1245 = 1.0 / _1199;
    float _1247 = -_1211;
    float _1249 = _1247 + 1.0;
    bool _1251 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1253 = 1.0 / _1215;
    float _1255 = _1231 * _1245;
    float _1257 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1259 = _1257 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1261 = fma(_1255, _1195, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1263 = _1227 * _1249;
    float _1265 = -_1243;
    float _1267 = _1265 + 1.0;
    float _1269 = -_1227;
    float _1271 = _1269 + 1.0;
    float _1273 = _1259 * _1253;
    float _1275 = _1261 * _1263;
    float _1277 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1279 = _1191 + _1277;
    float _1281 = _1211 * _1267;
    float _1283 = fma(_1271, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1275);
    float _1285 = fma(_1273, _1279, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1287 = fma(_1285, _1281, _1283);
    float _1289 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1291 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1295 = fma(_1243, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1287);
    float _1297 = _1289 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1299 = _1291 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1301 = _1293 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1303 = _1295 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_72.x = _1297;
    out.m_72.y = _1299;
    out.m_72.z = _1301;
    out.m_72.w = _1303;
    bool _1305 = !_1251;
    float _1307 = _1303;
    float _1309 = _1301;
    float _1311 = (*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1313 = _1295;
    float _1315 = _1275;
    bool _1317 = _1251;
    float _1335;
    float _1337;
    float _1339;
    if (!_1305)
    {
        float _1319 = in.m_68.x;
        float _1321 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1323 = _1319 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1325 = fma(_1323, (*spvDescriptorSet0.vp_c9)._m0[14].x, _159);
        float _1327 = _1325 * _1321;
        float _1329 = floor(_1327);
        float _1331 = -_1329;
        float _1333 = _1327 + _1331;
        _1335 = _1321;
        _1337 = _1327;
        _1339 = _1333;
        _1341 = true;
    }
    else
    {
        float _1343 = float(_125);
        float _1345 = 1.0 / _1343;
        float _1347 = _159 * _1345;
        _1335 = _1343;
        _1337 = _1345;
        _1339 = _1347;
    }
    _1341 = false;
    float _1349 = _1335;
    float _1351 = _1337;
    float _1353 = _1339;
    float _1355 = in.m_68.w;
    int _1357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1359 = _1357 != 0;
    int _1361 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1363 = _1361 != 0;
    int _1365 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _1367 = _1365 != 0;
    int _1369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1371 = _1369 != 0;
    int _1373 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1375 = _1373 != 0;
    float _1377 = _1349;
    int _1379 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_1359)
    {
        float _1381 = in.m_68.x;
        _1377 = _1381;
    }
    float _1383 = _1377;
    float _1385 = 0.0;
    if (!_1359)
    {
        _1385 = _265;
    }
    float _1387 = _1385;
    float _1389 = _1351;
    float _1391 = _1387;
    if (_1363)
    {
        float _1393 = in.m_68.z;
        _1389 = _1393;
    }
    float _1395 = _1389;
    if (!_1363)
    {
        _1307 = _261;
    }
    float _1397 = _1307;
    float _1399 = 0.0;
    float _1401 = _1397;
    if (_1375)
    {
        _1399 = 1.0;
    }
    float _1403 = _1399;
    float _1405 = _1403;
    if (!_1367)
    {
        _1309 = _265;
    }
    float _1407 = _1309;
    float _1409 = _1293;
    float _1411 = _1407;
    if (_1367)
    {
        float _1413 = in.m_68.w;
        _1409 = _1413;
    }
    float _1415 = _1409;
    float _1417 = 0.0;
    if (_1375)
    {
        _1417 = 1.0;
    }
    float _1419 = _1417;
    float _1421 = 0.0;
    float _1423 = _1419;
    if (_1375)
    {
        _1421 = 1.0;
    }
    float _1425 = _1421;
    int _1427 = 0;
    float _1429 = _1425;
    if (_1375)
    {
        _1427 = 0;
    }
    int _1431 = _1427;
    int _1433 = _1431;
    if (_1375)
    {
        _1379 = 0;
    }
    int _1435 = _1379;
    float _1437 = _1383;
    int _1439 = _1435;
    if (_1359)
    {
        float _1441 = _1383 * 3.1415927410125732421875;
        _1437 = _1441;
    }
    float _1443 = _1437;
    float _1445 = _1443;
    if (_1359)
    {
        float _1447 = _1443 * 0.15915493667125701904296875;
        _1311 = _1447;
    }
    float _1449 = _1311;
    if (_1363)
    {
        float _1451 = _1395 * 3.1415927410125732421875;
        _1445 = _1451;
    }
    float _1453 = _1445;
    if (_1367)
    {
        float _1455 = _1415 * 3.1415927410125732421875;
        _1313 = _1455;
    }
    float _1457 = _1313;
    float _1459 = _1457;
    if (_1363)
    {
        float _1461 = _1453 * 0.15915493667125701904296875;
        _1315 = _1461;
    }
    float _1463 = _1315;
    float _1465 = _1449;
    if (_1359)
    {
        float _1467 = _1449 * 6.283185482025146484375;
        float _1469 = sin(_1467);
        _1465 = _1469;
    }
    float _1471 = _1465;
    float _1473 = _1453;
    float _1475 = _1395;
    float _1477 = _1415;
    if (_1375)
    {
        float _1479 = in.m_68.x;
        float _1481 = in.m_68.y;
        float _1483 = in.m_68.z;
        _1473 = _1479;
        _1475 = _1481;
        _1477 = _1483;
    }
    float _1485 = _1473;
    float _1487 = _1475;
    float _1489 = _1477;
    if (_1367)
    {
        float _1491 = _1457 * 0.15915493667125701904296875;
        _1459 = _1491;
    }
    float _1493 = _1459;
    float _1495 = _1493;
    if (_1367)
    {
        float _1497 = _1493 * 6.283185482025146484375;
        float _1499 = sin(_1497);
        _1495 = _1499;
    }
    float _1501 = _1495;
    float _1503 = _1463;
    if (_1363)
    {
        float _1505 = _1463 * 6.283185482025146484375;
        float _1507 = sin(_1505);
        _1503 = _1507;
    }
    float _1509 = _1503;
    float _1511 = _1471;
    if (_1359)
    {
        bool _1513 = _1471 > 0.5;
        _1317 = _1513;
    }
    bool _1515 = _1317;
    bool _1517 = _1515;
    if (_1359)
    {
        float _1519 = -_265;
        float _1521 = _1515 ? _1519 : _265;
        _1391 = _1521;
    }
    float _1523 = _1391;
    float _1525 = _1487;
    float _1527 = _1489;
    float _1529 = _1485;
    if (_1375)
    {
        _1511 = _1485;
    }
    float _1531 = _1511;
    float _1533 = _1501;
    float _1535 = _1531;
    if (_1367)
    {
        bool _1537 = _1501 > 0.5;
        _1517 = _1537;
    }
    bool _1539 = _1517;
    int _1541 = int(_1539);
    int _1543 = _1367 ? 2 : 0;
    int _1545 = _1541 | _1543;
    int _1547 = _193 ? 4 : 0;
    int _1549 = _1545 | _1547;
    int _1551 = _1363 ? 8 : 0;
    int _1553 = _1549 | _1551;
    int _1555 = _1375 ? 16 : 0;
    int _1557 = _1553 | _1555;
    int _1559 = _1371 ? 32 : 0;
    int _1561 = _1557 | _1559;
    int _1563 = false ? 64 : 0;
    int _1565 = _1561 | _1563;
    int _1567 = _1565 & 32;
    if (_1375)
    {
        _1533 = _1531;
    }
    float _1569 = _1533;
    float _1571 = _1569;
    if (_1363)
    {
        bool _1573 = _1509 > 0.5;
        _275 = _1573;
    }
    bool _1575 = _275;
    int _1577 = 0;
    if (_1375)
    {
        _1577 = as_type<int>(_1531);
    }
    int _1579 = _1577;
    int _1581 = _1579;
    if (_1375)
    {
        _1021 = as_type<int>(_1487);
    }
    int _1583 = _1021;
    int _1585 = 0;
    int _1587 = _1583;
    if (_1375)
    {
        _1585 = as_type<int>(_1489);
    }
    int _1589 = _1585;
    int _1591 = _1589;
    if (!_1375)
    {
        float _1593 = in.m_68.x;
        float _1595 = in.m_68.y;
        float _1597 = in.m_68.z;
        float _1599 = _1593 * 3.1415927410125732421875;
        float _1601 = _1599 * 0.15915493667125701904296875;
        float _1603 = _1595 * 3.1415927410125732421875;
        float _1605 = _1603 * 0.15915493667125701904296875;
        float _1607 = _1597 * 3.1415927410125732421875;
        float _1609 = _1601 * 6.283185482025146484375;
        float _1611 = sin(_1609);
        float _1613 = _1607 * 0.15915493667125701904296875;
        float _1615 = _1605 * 6.283185482025146484375;
        float _1617 = sin(_1615);
        float _1619 = _1613 * 6.283185482025146484375;
        float _1621 = sin(_1619);
        _1525 = _1595;
        _1571 = _1597;
        _1429 = 5.839270114898681640625;
        _1527 = _1597;
        _1529 = _1593;
        _1405 = 7.345489978790283203125;
        _1535 = _1595;
        _1423 = 1.2345600128173828125;
        _1439 = 2;
        _1433 = 1;
        _1587 = as_type<int>(_1617);
        _1581 = as_type<int>(_1611);
        _1591 = as_type<int>(_1621);
    }
    float _1623 = _1525;
    float _1625 = _1571;
    float _1627 = _1429;
    float _1629 = _1527;
    float _1631 = _1529;
    float _1633 = _1405;
    float _1635 = _1535;
    float _1637 = _1423;
    int _1639 = _1439;
    int _1641 = _1433;
    int _1643 = _1587;
    int _1645 = _1581;
    int _1647 = _1591;
    float _1649 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1651 = int(_1649);
    int _1653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1655 = _1653 != 0;
    bool _1657 = _1623 > 0.5;
    float _1659 = _1625 * _1627;
    float _1661 = _1623 + _1629;
    if (_1363)
    {
        float _1663 = -_261;
        float _1665 = _1575 ? _1663 : _261;
        _1401 = _1665;
    }
    float _1667 = _1401;
    float _1669 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1671 = int(_1669);
    if (_1367)
    {
        float _1673 = -_265;
        float _1675 = _1539 ? _1673 : _265;
        _1411 = _1675;
    }
    float _1677 = _1411;
    float _1679 = _1623 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1681 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1683 = _1681 != 0;
    int _1685 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1687 = _1685 != 0;
    int _1689 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1691 = _1689 != 0;
    float _1693 = _1661 + (-1.0);
    int _1695 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1697 = _1695 != 0;
    int _1699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1701 = _1699 != 0;
    bool _1703 = _1629 > 0.5;
    float _1705 = float(_1651);
    float _1707 = -_261;
    int _1709 = _1657 ? as_type<int>(_1707) : as_type<int>(_261);
    bool _1711 = !_1697;
    int _1713 = _1711 ? 0 : 1;
    float _1715 = 1.0 / _1705;
    float _1717 = float(uint(_1671));
    int _1719 = ~_1671;
    int _1721 = _1719 + 1;
    float _1723 = -_265;
    int _1725 = _1703 ? as_type<int>(_1723) : as_type<int>(_265);
    bool _1727 = _1355 > 0.5;
    float _1729 = 1.0 / _1717;
    int _1731 = int(_1727);
    int _1733 = _1703 ? 2 : 0;
    int _1735 = _1731 | _1733;
    int _1737 = _1575 ? 4 : 0;
    int _1739 = _1735 | _1737;
    int _1741 = _1683 ? 8 : 0;
    int _1743 = _1739 | _1741;
    int _1745 = _1687 ? 16 : 0;
    int _1747 = _1743 | _1745;
    int _1749 = _1691 ? 32 : 0;
    int _1751 = _1747 | _1749;
    int _1753 = _1657 ? 64 : 0;
    int _1755 = _1751 | _1753;
    int _1757 = _1755 & 64;
    bool _1759 = !_1687;
    float _1761 = _1759 ? _261 : as_type<float>(_1709);
    bool _1763 = !_1691;
    float _1765 = _1763 ? _265 : as_type<float>(_1725);
    float _1767 = -_265;
    int _1769 = _1727 ? as_type<int>(_1767) : as_type<int>(_265);
    float _1771 = _159 * _1715;
    int _1773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1775 = _1773 != 0;
    int _1777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1779 = _1777 != 0;
    int _1781 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1783 = _1781 != 0;
    int _1785 = int(_1727);
    int _1787 = _1703 ? 2 : 0;
    int _1789 = _1785 | _1787;
    int _1791 = _1575 ? 4 : 0;
    int _1793 = _1789 | _1791;
    int _1795 = _1683 ? 8 : 0;
    int _1797 = _1793 | _1795;
    int _1799 = _1775 ? 16 : 0;
    int _1801 = _1797 | _1799;
    int _1803 = _1779 ? 32 : 0;
    int _1805 = _1801 | _1803;
    int _1807 = _1783 ? 64 : 0;
    int _1809 = _1805 | _1807;
    int _1811 = _1809 & 2;
    float _1813 = trunc(_1771);
    int _1815 = int(_1813);
    bool _1817 = !_1683;
    float _1819 = _1817 ? _265 : as_type<float>(_1769);
    int _1821 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1823 = _1821 != 0;
    int _1825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1827 = _1825 != 0;
    int _1829 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1831 = _1829 != 0;
    int _1833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1835 = _1833 != 0;
    int _1837 = as_type<int>(_1729) + (-2);
    float _1839 = float(_125);
    int _1841 = ~_1671;
    int _1843 = _1841 + 1;
    bool _1845 = !_1827;
    int _1847 = _1845 ? 0 : 1;
    float _1849 = 1.0 / _1839;
    float _1851 = float(_1671);
    bool _1853 = !_1775;
    int _1855 = _1853 ? 0 : 1;
    float _1857 = float(uint(_1815));
    bool _1859 = _1671 == 0;
    bool _1861 = !_1779;
    int _1863 = _1861 ? 0 : 1;
    float _1865 = as_type<float>(_1837) * _1857;
    int _1867 = abs(_1847);
    int _1869 = abs(_1863);
    bool _1871 = !_1783;
    int _1873 = _1871 ? 0 : 1;
    float _1875 = trunc(_1865);
    float _1877 = precise::max(_1875, 0.0);
    uint _1880 = uint(_1877);
    bool _1882 = _1353 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1884 = isnan(_1353);
    bool _1886 = _1882 || _1884;
    bool _1888 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1890 = _1886 || _1888;
    float _1892 = float(_1890);
    float _1894 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1896 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1894;
    float _1898 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1900 = _1898 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1902 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1904 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1902;
    float _1906 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _1908 = _1721 * int(_1880);
    int _1910 = _1908 + _1815;
    float _1912 = float(uint(_1910));
    float _1914 = as_type<float>(_1837) * _1912;
    float _1916 = trunc(_1914);
    float _1918 = precise::max(_1916, 0.0);
    uint _1920 = uint(_1918);
    int _1922 = int(_1880) + int(_1920);
    float _1924 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1926 = int(_1924);
    int _1928 = _1843 * _1922;
    int _1930 = _1928 + _1815;
    bool _1932 = uint(_1930) >= uint(_1671);
    float _1934 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1936 = int(_1934);
    bool _1938 = !_1932;
    int _1940 = _1938 ? 0 : (-1);
    float _1942 = float(uint(_1926));
    int _1944 = ~_1926;
    int _1946 = _1944 + 1;
    float _1948 = 1.0 / _1942;
    int _1950 = ~_1922;
    int _1952 = _1950 + _1940;
    int _1954 = _1952 + 1;
    bool _1956 = _1926 == 0;
    float _1958 = float(_1936);
    int _1960 = ~_1926;
    int _1962 = _1960 + 1;
    float _1964 = 1.0 / _1958;
    int _1966 = as_type<int>(_1948) + (-2);
    float _1968 = _159 * _1964;
    float _1970 = trunc(_1968);
    int _1972 = int(_1970);
    float _1974 = float(uint(_1972));
    float _1976 = as_type<float>(_1966) * _1974;
    float _1978 = trunc(_1976);
    float _1980 = precise::max(_1978, 0.0);
    uint _1982 = uint(_1980);
    int _1984 = _1946 * int(_1982);
    int _1986 = _1984 + _1972;
    float _1988 = float(uint(_1986));
    float _1990 = _1631 * _1633;
    float _1992 = as_type<float>(_1966) * _1988;
    float _1994 = trunc(_1992);
    float _1996 = precise::max(_1994, 0.0);
    uint _1998 = uint(_1996);
    int _2000 = int(_1982) + int(_1998);
    float _2002 = _1635 * _1637;
    float _2004 = float(_1926);
    bool _2006 = !_1655;
    int _2008 = _2006 ? 0 : 1;
    float _2010 = _1635 * _1633;
    int _2012 = _1962 * _2000;
    int _2014 = _2012 + _1972;
    float _2016 = floor(_2002);
    int _2018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2020 = _2018 != 0;
    int _2022 = abs(_2008);
    bool _2024 = uint(_2014) >= uint(_1926);
    bool _2026 = !_2020;
    int _2028 = _2026 ? 0 : 1;
    float _2030 = floor(_1990);
    bool _2032 = !_2024;
    int _2034 = _2032 ? 0 : (-1);
    int _2036 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2038 = _2036 != 0;
    int _2040 = ~_2000;
    int _2042 = _2040 + _2034;
    int _2044 = _2042 + 1;
    bool _2046 = !_2038;
    int _2048 = _2046 ? 0 : 1;
    float _2050 = -_2016;
    float _2052 = _2002 + _2050;
    int _2054 = _1671 * _1954;
    int _2056 = _2054 + _1815;
    bool _2058 = !_1823;
    int _2060 = _2058 ? 0 : 1;
    int _2062 = _1926 * _2044;
    int _2064 = _2062 + _1972;
    int _2066 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2068 = _2066 != 0;
    bool _2070 = !_1859;
    int _2072 = _2070 ? _2056 : (-1);
    float _2074 = -_2030;
    float _2076 = _1990 + _2074;
    float _2078 = float(_1972);
    bool _2080 = !_1956;
    int _2082 = _2080 ? _2064 : (-1);
    float _2084 = _2076 * _1851;
    float _2086 = float(_1815);
    bool _2088 = _2078 >= _2004;
    bool _2090 = isnan(_2078);
    bool _2092 = _2088 || _2090;
    bool _2094 = isnan(_2004);
    bool _2096 = _2092 || _2094;
    float _2098 = float(_2096);
    float _2100 = trunc(_2084);
    int _2102 = int(_2100);
    bool _2104 = _2086 >= _1851;
    bool _2106 = isnan(_2086);
    bool _2108 = _2104 || _2106;
    bool _2110 = isnan(_1851);
    bool _2112 = _2108 || _2110;
    float _2114 = float(_2112);
    float _2116 = _159 * _1849;
    float _2118 = _2052 * _2004;
    int _2120 = abs(_2060);
    float _2122 = _2116 * _1851;
    float _2124 = _2116 * _2004;
    float _2126 = trunc(_2114);
    int _2128 = int(_2126);
    float _2130 = trunc(_2098);
    int _2132 = int(_2130);
    int _2134 = _2102 * _2022;
    int _2136 = _2134 + _1815;
    int _2138 = _1671 + (-1);
    bool _2140 = !_1831;
    int _2142 = _2140 ? 0 : 1;
    int _2144 = ~_2128;
    int _2146 = _2144 + 1;
    int _2148 = _2146 + 1;
    float _2150 = trunc(_2122);
    int _2152 = int(_2150);
    int _2154 = abs(_2142);
    int _2156 = _2072 * _2148;
    int _2158 = _1926 + (-1);
    int _2160 = ~_2132;
    int _2162 = _2160 + 1;
    int _2164 = _2162 + 1;
    float _2166 = trunc(_2118);
    int _2168 = int(_2166);
    int _2170 = _2128 * _2138;
    int _2172 = _2170 + _2156;
    int _2174 = abs(_2028);
    int _2176 = _2082 * _2164;
    int _2178 = abs(_1855);
    float _2180 = trunc(_2124);
    int _2182 = int(_2180);
    int _2184 = _2132 * _2158;
    int _2186 = _2184 + _2176;
    int _2188 = _2172 * _1869;
    int _2190 = abs(_1713);
    int _2192 = _2168 * _2174;
    int _2194 = _2192 + _1972;
    int _2196 = _2152 * _2178;
    int _2198 = _2196 + _2188;
    int _2200 = abs(_1873);
    int _2202 = _2186 * _1867;
    bool _2204 = !_1835;
    int _2206 = _2204 ? 0 : 1;
    int _2208 = _2182 * _2120;
    int _2210 = _2208 + _2202;
    int _2212 = abs(_2206);
    int _2214 = _2136 * _2200;
    int _2216 = _2214 + _2198;
    int _2218 = _2194 * _2154;
    int _2220 = _2218 + _2210;
    int _2222 = _2102 * _2190;
    int _2224 = _2222 + _2216;
    int _2226 = ~_1926;
    int _2228 = _2226 + 1;
    float _2230 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _2232 = int(_2230);
    int _2234 = _2168 * _2212;
    int _2236 = _2234 + _2220;
    float _2238 = float(uint(_2224));
    int _2240 = ~_1671;
    int _2242 = _2240 + 1;
    float _2244 = float(uint(_2236));
    float _2246 = as_type<float>(_1837) * _2238;
    float _2248 = as_type<float>(_1966) * _2244;
    float _2250 = trunc(_2246);
    float _2252 = precise::max(_2250, 0.0);
    uint _2254 = uint(_2252);
    float _2256 = float(_2232);
    float _2258 = trunc(_2248);
    float _2260 = precise::max(_2258, 0.0);
    uint _2262 = uint(_2260);
    int _2264 = _2242 * int(_2254);
    int _2266 = _2264 + _2224;
    float _2268 = 1.0 / _2256;
    float _2270 = float(uint(_2266));
    int _2272 = _2228 * int(_2262);
    int _2274 = _2272 + _2236;
    float _2276 = as_type<float>(_1837) * _2270;
    float _2278 = float(uint(_2274));
    float _2280 = trunc(_2276);
    float _2282 = precise::max(_2280, 0.0);
    uint _2284 = uint(_2282);
    int _2286 = ~_1671;
    int _2288 = _2286 + 1;
    float _2290 = _159 * _2268;
    float _2292 = as_type<float>(_1966) * _2278;
    float _2294 = trunc(_2290);
    int _2296 = int(_2294);
    int _2298 = int(_2254) + int(_2284);
    float _2300 = trunc(_2292);
    float _2302 = precise::max(_2300, 0.0);
    uint _2304 = uint(_2302);
    int _2306 = ~_1926;
    int _2308 = _2306 + 1;
    int _2310 = _2288 * _2298;
    int _2312 = _2310 + _2224;
    float _2314 = float(uint(_2296));
    bool _2316 = uint(_2312) >= uint(_1671);
    bool _2318 = !_2316;
    int _2320 = _2318 ? 0 : (-1);
    int _2322 = int(_2262) + int(_2304);
    int _2324 = ~_2298;
    int _2326 = _2324 + _2320;
    int _2328 = _2326 + 1;
    int _2330 = _2308 * _2322;
    int _2332 = _2330 + _2236;
    int _2334 = _1671 * _2328;
    int _2336 = _2334 + _2224;
    float _2338 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _2340 = int(_2338);
    bool _2342 = uint(_2332) >= uint(_1926);
    bool _2344 = !_1859;
    int _2346 = _2344 ? _2336 : (-1);
    bool _2348 = !_2342;
    int _2350 = _2348 ? 0 : (-1);
    int _2352 = _2346 & 3;
    bool _2354 = _2352 != 0;
    int _2356 = ~_2322;
    int _2358 = _2356 + _2350;
    int _2360 = _2358 + 1;
    int _2362 = _2346 & 3;
    bool _2364 = _2362 != 0;
    int _2366 = _1926 * _2360;
    int _2368 = _2366 + _2236;
    int _2370 = _2354 ? 0 : 1;
    float _2372 = float(uint(_2340));
    bool _2374 = !_1956;
    int _2376 = _2374 ? _2368 : (-1);
    float _2378 = 1.0 / _2372;
    int _2380 = int(_2354);
    int _2382 = _2364 ? 2 : 0;
    int _2384 = _2380 | _2382;
    int _2386 = _1831 ? 4 : 0;
    int _2388 = _2384 | _2386;
    int _2390 = _1835 ? 8 : 0;
    int _2392 = _2388 | _2390;
    int _2394 = _1859 ? 16 : 0;
    int _2396 = _2392 | _2394;
    int _2398 = _1956 ? 32 : 0;
    int _2400 = _2396 | _2398;
    int _2402 = _1783 ? 64 : 0;
    int _2404 = _2400 | _2402;
    int _2406 = _2404 & 2;
    int _2408 = _2376 & 3;
    bool _2410 = _2408 != 0;
    int _2412 = _2376 & 3;
    bool _2414 = _2412 != 0;
    int _2416 = _2410 ? 0 : 1;
    bool _2418 = uint(_2362) > 1u;
    int _2420 = ~_2370;
    int _2422 = _2420 + 1;
    int _2424 = _2422 + 1;
    int _2426 = ~_2340;
    int _2428 = _2426 + 1;
    int _2430 = int(_2418);
    int _2432 = _2414 ? 2 : 0;
    int _2434 = _2430 | _2432;
    int _2436 = _1831 ? 4 : 0;
    int _2438 = _2434 | _2436;
    int _2440 = _1835 ? 8 : 0;
    int _2442 = _2438 | _2440;
    int _2444 = _1859 ? 16 : 0;
    int _2446 = _2442 | _2444;
    int _2448 = _1956 ? 32 : 0;
    int _2450 = _2446 | _2448;
    int _2452 = _1783 ? 64 : 0;
    int _2454 = _2450 | _2452;
    int _2456 = _2454 & 2;
    int _2458 = as_type<int>(_2378) + (-2);
    int _2460 = _2424;
    float _2462 = as_type<float>(_2340);
    if (!_2418)
    {
        int _2464 = ~_2370;
        int _2466 = _2464 + 1;
        _2460 = _2466;
    }
    int _2468 = _2460;
    float _2470 = as_type<float>(_2458) * _2314;
    bool _2472 = uint(_2412) > 1u;
    int _2474 = ~_2416;
    int _2476 = _2474 + 1;
    int _2478 = _2476 + 1;
    float _2480 = trunc(_2470);
    float _2482 = precise::max(_2480, 0.0);
    uint _2484 = uint(_2482);
    int _2486 = _2478;
    if (!_2472)
    {
        int _2488 = ~_2416;
        int _2490 = _2488 + 1;
        _2486 = _2490;
    }
    int _2492 = _2486;
    int _2494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2496 = _2494 != 0;
    int _2498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2500 = _2498 != 0;
    int _2502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2504 = _2502 != 0;
    int _2506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2508 = _2506 != 0;
    bool _2510 = !_2496;
    int _2512 = _2510 ? 0 : 1;
    bool _2514 = !_2504;
    int _2516 = _2514 ? 0 : 1;
    bool _2518 = _1757 != 0;
    int _2520 = ~_2340;
    int _2522 = _2520 + 1;
    int _2524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2526 = _2524 != 0;
    int _2528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2530 = _2528 != 0;
    int _2532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2534 = _2532 != 0;
    int _2536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2538 = _2536 != 0;
    bool _2540 = !_2500;
    int _2542 = _2540 ? 0 : 1;
    int _2544 = _2522 * int(_2484);
    int _2546 = _2544 + _2296;
    bool _2548 = _2340 == 0;
    bool _2550 = !_2526;
    int _2552 = _2550 ? 0 : 1;
    float _2554 = float(uint(_2546));
    float _2556 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _2558 = int(_2556);
    bool _2560 = !_2508;
    int _2562 = _2560 ? 0 : 1;
    float _2564 = as_type<float>(_2458) * _2554;
    int _2566 = abs(_2512);
    bool _2568 = !_2538;
    int _2570 = _2568 ? 0 : 1;
    bool _2572 = !_2530;
    int _2574 = _2572 ? 0 : 1;
    float _2576 = trunc(_2564);
    float _2578 = precise::max(_2576, 0.0);
    uint _2580 = uint(_2578);
    bool _2582 = !_2534;
    int _2584 = _2582 ? 0 : 1;
    bool _2586 = _1926 == 0;
    int _2588 = ~_2558;
    int _2590 = _2588 + 1;
    bool _2592 = _2558 == 0;
    int _2594 = int(_2484) + int(_2580);
    float _2596 = float(uint(_2558));
    int _2598 = _2428 * _2594;
    int _2600 = _2598 + _2296;
    bool _2602 = uint(_2600) >= uint(_2340);
    float _2604 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _2606 = int(_2604);
    bool _2608 = !_2602;
    int _2610 = _2608 ? 0 : (-1);
    int _2612 = ~_2594;
    int _2614 = _2612 + _2610;
    int _2616 = _2614 + 1;
    float _2618 = float(_2606);
    float _2620 = 1.0 / _2596;
    float _2622 = 1.0 / _2618;
    int _2624 = ~_2558;
    int _2626 = _2624 + 1;
    int _2628 = as_type<int>(_2620) + (-2);
    float _2630 = _159 * _2622;
    float _2632 = trunc(_2630);
    int _2634 = int(_2632);
    float _2636 = float(uint(_2634));
    float _2638 = as_type<float>(_2628) * _2636;
    float _2640 = trunc(_2638);
    float _2642 = precise::max(_2640, 0.0);
    uint _2644 = uint(_2642);
    int _2646 = _2590 * int(_2644);
    int _2648 = _2646 + _2634;
    float _2650 = float(_2296);
    float _2652 = float(uint(_2648));
    float _2654 = as_type<float>(_2628) * _2652;
    float _2656 = trunc(_2654);
    float _2658 = precise::max(_2656, 0.0);
    uint _2660 = uint(_2658);
    int _2662 = int(_2644) + int(_2660);
    float _2664 = floor(_1659);
    int _2666 = _2626 * _2662;
    int _2668 = _2666 + _2634;
    bool _2670 = uint(_2668) >= uint(_2558);
    float _2672 = float(_2340);
    bool _2674 = !_2670;
    int _2676 = _2674 ? 0 : (-1);
    bool _2678 = _2650 >= _2672;
    bool _2680 = isnan(_2650);
    bool _2682 = _2678 || _2680;
    bool _2684 = isnan(_2672);
    bool _2686 = _2682 || _2684;
    float _2688 = float(_2686);
    float _2690 = -_2664;
    float _2692 = _1659 + _2690;
    int _2694 = _2340 + (-1);
    int _2696 = ~_2662;
    int _2698 = _2696 + _2676;
    int _2700 = _2698 + 1;
    float _2702 = trunc(_2688);
    int _2704 = int(_2702);
    float _2706 = _2692 * _2672;
    int _2708 = _2340 * _2616;
    int _2710 = _2708 + _2296;
    float _2712 = _2116 * _2672;
    bool _2714 = !_2548;
    int _2716 = _2714 ? _2710 : (-1);
    float _2718 = trunc(_2706);
    int _2720 = int(_2718);
    int _2722 = ~_2704;
    int _2724 = _2722 + 1;
    int _2726 = _2724 + 1;
    float _2728 = trunc(_2712);
    int _2730 = int(_2728);
    int _2732 = _2716 * _2726;
    int _2734 = abs(_2516);
    int _2736 = abs(_2048);
    int _2738 = _2704 * _2694;
    int _2740 = _2738 + _2732;
    int _2742 = abs(_2542);
    bool _2744 = !_2068;
    int _2746 = _2744 ? 0 : 1;
    bool _2748 = _1639 != 2;
    int _2750 = abs(_2562);
    int _2752 = _2720 * _2736;
    int _2754 = _2752 + _2296;
    int _2756 = _2740 * _2734;
    int _2758 = _2730 * _2742;
    int _2760 = _2758 + _2756;
    int _2762 = ~_2340;
    int _2764 = _2762 + 1;
    int _2766 = _2754 * _2750;
    int _2768 = _2766 + _2760;
    int _2770 = ~_2340;
    int _2772 = _2770 + 1;
    int _2774 = _2720 * _2566;
    int _2776 = _2774 + _2768;
    float _2778 = float(uint(_2776));
    float _2780 = as_type<float>(_2458) * _2778;
    float _2782 = trunc(_2780);
    float _2784 = precise::max(_2782, 0.0);
    uint _2786 = uint(_2784);
    float _2788 = float(_2558);
    float _2790 = _2116 * _2788;
    int _2792 = _2772 * int(_2786);
    int _2794 = _2792 + _2776;
    float _2796 = trunc(_2790);
    int _2798 = int(_2796);
    float _2800 = float(uint(_2794));
    float _2802 = float(_2634);
    float _2804 = as_type<float>(_2458) * _2800;
    bool _2806 = _2802 >= _2788;
    bool _2808 = isnan(_2802);
    bool _2810 = _2806 || _2808;
    bool _2812 = isnan(_2788);
    bool _2814 = _2810 || _2812;
    float _2816 = float(_2814);
    float _2818 = trunc(_2804);
    float _2820 = precise::max(_2818, 0.0);
    uint _2822 = uint(_2820);
    float _2824 = trunc(_2816);
    int _2826 = int(_2824);
    int _2828 = int(_2786) + int(_2822);
    float _2830 = floor(_2010);
    int _2832 = _2764 * _2828;
    int _2834 = _2832 + _2776;
    bool _2836 = uint(_2834) >= uint(_2340);
    bool _2838 = !_2836;
    int _2840 = _2838 ? 0 : (-1);
    float _2842 = -_2830;
    float _2844 = _2010 + _2842;
    int _2846 = _2558 + (-1);
    int _2848 = ~_2828;
    int _2850 = _2848 + _2840;
    int _2852 = _2850 + 1;
    float _2854 = _2844 * _2788;
    int _2856 = _2558 * _2700;
    int _2858 = _2856 + _2634;
    int _2860 = ~_2826;
    int _2862 = _2860 + 1;
    int _2864 = _2862 + 1;
    int _2866 = _2340 * _2852;
    int _2868 = _2866 + _2776;
    int _2870 = ~_1926;
    int _2872 = _2870 + 1;
    float _2874 = trunc(_2854);
    int _2876 = int(_2874);
    bool _2878 = !_2592;
    int _2880 = _2878 ? _2858 : (-1);
    bool _2882 = !_2548;
    int _2884 = _2882 ? _2868 : (-1);
    int _2886 = _2880 * _2864;
    int _2888 = abs(_2574);
    int _2890 = abs(_2746);
    int _2892 = _2826 * _2846;
    int _2894 = _2892 + _2886;
    int _2896 = abs(_2552);
    int _2898 = abs(_2584);
    int _2900 = _2894 * _2888;
    int _2902 = _2876 * _2890;
    int _2904 = _2902 + _2634;
    int _2906 = abs(_2570);
    int _2908 = _2798 * _2896;
    int _2910 = _2908 + _2900;
    int _2912 = _2884 & 3;
    bool _2914 = _2912 != 0;
    float _2916 = float(uint(_2136));
    int _2918 = _2904 * _2898;
    int _2920 = _2918 + _2910;
    int _2922 = ~_2558;
    int _2924 = _2922 + 1;
    int _2926 = _2876 * _2906;
    int _2928 = _2926 + _2920;
    int _2930 = ~_2558;
    int _2932 = _2930 + 1;
    float _2934 = as_type<float>(_1837) * _2916;
    float _2936 = float(uint(_2928));
    float _2938 = trunc(_2934);
    float _2940 = precise::max(_2938, 0.0);
    uint _2942 = uint(_2940);
    float _2944 = as_type<float>(_2628) * _2936;
    float _2946 = trunc(_2944);
    float _2948 = precise::max(_2946, 0.0);
    uint _2950 = uint(_2948);
    int _2952 = _2924 * int(_2950);
    int _2954 = _2952 + _2928;
    float _2956 = float(uint(_2954));
    float _2958 = as_type<float>(_2628) * _2956;
    float _2960 = trunc(_2958);
    float _2962 = precise::max(_2960, 0.0);
    uint _2964 = uint(_2962);
    int _2966 = int(_2950) + int(_2964);
    int _2968 = _2932 * _2966;
    int _2970 = _2968 + _2928;
    bool _2972 = uint(_2970) >= uint(_2558);
    bool _2974 = !_2972;
    int _2976 = _2974 ? 0 : (-1);
    int _2978 = _2884 & 3;
    bool _2980 = _2978 != 0;
    int _2982 = ~_2966;
    int _2984 = _2982 + _2976;
    int _2986 = _2984 + 1;
    int _2988 = _2980 ? 0 : 1;
    int _2990 = ~_1926;
    int _2992 = _2990 + 1;
    int _2994 = _2558 * _2986;
    int _2996 = _2994 + _2928;
    int _2998 = ~_2988;
    int _3000 = _2998 + 1;
    int _3002 = _3000 + 1;
    bool _3004 = !_2592;
    int _3006 = _3004 ? _2996 : (-1);
    int _3008 = _3006 & 3;
    bool _3010 = _3008 != 0;
    int _3012 = _3010 ? 0 : 1;
    bool _3014 = uint(_2912) > 1u;
    int _3016 = ~_3012;
    int _3018 = _3016 + 1;
    int _3020 = _3018 + 1;
    int _3022 = _3002;
    int _3024 = _3020;
    float _3026 = as_type<float>(_2558);
    if (!_3014)
    {
        int _3028 = ~_2988;
        int _3030 = _3028 + 1;
        _3022 = _3030;
    }
    int _3032 = _3022;
    int _3034 = _3006 & 3;
    bool _3036 = _3034 != 0;
    bool _3038 = uint(_3034) > 1u;
    if (!_3038)
    {
        int _3040 = ~_3012;
        int _3042 = _3040 + 1;
        _3024 = _3042;
    }
    int _3044 = _3024;
    bool _3046 = uint(_2362) >= 2u;
    int _3048 = _3046 ? 0 : 1;
    bool _3050 = uint(_2412) >= 2u;
    int _3052 = ~_3048;
    int _3054 = _3052 + 1;
    int _3056 = _3054 + 1;
    int _3058 = _3050 ? 0 : 1;
    bool _3060 = _2362 != 3;
    int _3062 = ~_3058;
    int _3064 = _3062 + 1;
    int _3066 = _3064 + 1;
    int _3068 = _3056;
    int _3070 = _3066;
    if (_3060)
    {
        int _3072 = ~_3048;
        int _3074 = _3072 + 1;
        _3068 = _3074;
    }
    int _3076 = _3068;
    bool _3078 = _2412 != 3;
    if (_3078)
    {
        int _3080 = ~_3058;
        int _3082 = _3080 + 1;
        _3070 = _3082;
    }
    int _3084 = _3070;
    bool _3086 = uint(_2912) >= 2u;
    int _3088 = abs(_3084);
    int _3090 = _3086 ? 0 : 1;
    bool _3092 = uint(_3034) >= 2u;
    int _3094 = ~_3090;
    int _3096 = _3094 + 1;
    int _3098 = _3096 + 1;
    int _3100 = _3092 ? 0 : 1;
    bool _3102 = _2912 != 3;
    int _3104 = ~_3100;
    int _3106 = _3104 + 1;
    int _3108 = _3106 + 1;
    int _3110 = _3098;
    int _3112 = _3108;
    if (_3102)
    {
        int _3114 = ~_3090;
        int _3116 = _3114 + 1;
        _3110 = _3116;
    }
    int _3118 = _3110;
    bool _3120 = _3034 != 3;
    float _3122 = -_265;
    int _3124 = _2518 ? as_type<int>(_3122) : as_type<int>(_265);
    bool _3126 = _2406 != 0;
    int _3128 = ~_2340;
    int _3130 = _3128 + 1;
    if (_3120)
    {
        int _3132 = ~_3100;
        int _3134 = _3132 + 1;
        _3112 = _3134;
    }
    int _3136 = _3112;
    int _3138 = ~_1671;
    int _3140 = _3138 + 1;
    int _3142 = _3140 * int(_2942);
    int _3144 = _3142 + _2136;
    float _3146 = float(uint(_3144));
    int _3148 = ~_1671;
    int _3150 = _3148 + 1;
    float _3152 = as_type<float>(_1837) * _3146;
    float _3154 = trunc(_3152);
    float _3156 = precise::max(_3154, 0.0);
    uint _3158 = uint(_3156);
    int _3160 = int(_2942) + int(_3158);
    float _3162 = float(uint(_2194));
    float _3164 = as_type<float>(_1966) * _3162;
    int _3166 = _3150 * _3160;
    int _3168 = _3166 + _2136;
    float _3170 = trunc(_3164);
    float _3172 = precise::max(_3170, 0.0);
    uint _3174 = uint(_3172);
    bool _3176 = uint(_3168) >= uint(_1671);
    bool _3178 = !_3176;
    int _3180 = _3178 ? 0 : (-1);
    int _3182 = ~_3160;
    int _3184 = _3182 + _3180;
    int _3186 = _3184 + 1;
    int _3188 = _2992 * int(_3174);
    int _3190 = _3188 + _2194;
    int _3192 = _1671 * _3186;
    int _3194 = _3192 + _2136;
    float _3196 = _1623 * 2.0;
    float _3198 = float(uint(_3190));
    int _3200 = ~_2340;
    int _3202 = _3200 + 1;
    float _3204 = floor(_3196);
    float _3206 = as_type<float>(_1966) * _3198;
    float _3208 = trunc(_3206);
    float _3210 = precise::max(_3208, 0.0);
    uint _3212 = uint(_3210);
    int _3214 = int(_3174) + int(_3212);
    int _3216 = _2872 * _3214;
    int _3218 = _3216 + _2194;
    bool _3220 = uint(_3218) >= uint(_1926);
    float _3222 = float(uint(_2754));
    bool _3224 = !_3220;
    int _3226 = _3224 ? 0 : (-1);
    float _3228 = as_type<float>(_2458) * _3222;
    int _3230 = ~_3214;
    int _3232 = _3230 + _3226;
    int _3234 = _3232 + 1;
    float _3236 = trunc(_3228);
    float _3238 = precise::max(_3236, 0.0);
    uint _3240 = uint(_3238);
    int _3242 = _1926 * _3234;
    int _3244 = _3242 + _2194;
    float _3246 = _1631 * 2.0;
    bool _3248 = !_2586;
    int _3250 = _3248 ? _3244 : (-1);
    float _3252 = floor(_3246);
    int _3254 = _3202 * int(_3240);
    int _3256 = _3254 + _2754;
    float _3258 = float(uint(_3256));
    int _3260 = ~_2558;
    int _3262 = _3260 + 1;
    float _3264 = as_type<float>(_2458) * _3258;
    float _3266 = float(uint(_2904));
    float _3268 = as_type<float>(_2628) * _3266;
    float _3270 = trunc(_3264);
    float _3272 = precise::max(_3270, 0.0);
    uint _3274 = uint(_3272);
    float _3276 = trunc(_3268);
    float _3278 = precise::max(_3276, 0.0);
    uint _3280 = uint(_3278);
    int _3282 = int(_3240) + int(_3274);
    int _3284 = ~_2558;
    int _3286 = _3284 + 1;
    int _3288 = _3130 * _3282;
    int _3290 = _3288 + _2754;
    int _3292 = _3262 * int(_3280);
    int _3294 = _3292 + _2904;
    bool _3296 = uint(_3290) >= uint(_2340);
    float _3298 = float(uint(_3294));
    bool _3300 = !_3296;
    int _3302 = _3300 ? 0 : (-1);
    float _3304 = as_type<float>(_2628) * _3298;
    int _3306 = ~_3282;
    int _3308 = _3306 + _3302;
    int _3310 = _3308 + 1;
    float _3312 = trunc(_3304);
    float _3314 = precise::max(_3312, 0.0);
    uint _3316 = uint(_3314);
    int _3318 = _2340 * _3310;
    int _3320 = _3318 + _2754;
    bool _3322 = !_2548;
    int _3324 = _3322 ? _3320 : (-1);
    int _3326 = int(_3280) + int(_3316);
    int _3328 = _3286 * _3326;
    int _3330 = _3328 + _2904;
    bool _3332 = uint(_3330) >= uint(_2558);
    bool _3334 = !_3332;
    int _3336 = _3334 ? 0 : (-1);
    bool _3338 = _1671 == 0;
    int _3340 = ~_3326;
    int _3342 = _3340 + _3336;
    int _3344 = _3342 + 1;
    bool _3346 = !_3338;
    int _3348 = _3346 ? _3194 : (-1);
    bool _3350 = _1641 != 1;
    int _3352 = _2558 * _3344;
    int _3354 = _3352 + _2904;
    bool _3356 = !_3126;
    int _3358 = _3356 ? 0 : 1;
    bool _3360 = !_1701;
    int _3362 = _3360 ? 0 : 1;
    bool _3364 = _2456 != 0;
    bool _3366 = !_2592;
    int _3368 = _3366 ? _3354 : (-1);
    float _3370 = 0.0;
    float _3372 = as_type<float>(_3290);
    float _3374 = _3304;
    float _3376 = as_type<float>(_3326);
    if (_2748)
    {
        _3370 = _1631;
    }
    float _3378 = _3370;
    float _3380 = _3378;
    if (_2748)
    {
        _3372 = _1623;
    }
    float _3382 = _3372;
    float _3384 = _3382;
    if (!_2748)
    {
        _3380 = _1629;
    }
    float _3386 = _3380;
    if (!_2748)
    {
        _3384 = _1631;
    }
    float _3388 = _3384;
    int _3390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3392 = _3390 != 0;
    float _3394 = _3388 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _3396 = !_3350;
    float _3398 = _3396 ? as_type<float>(_1643) : as_type<float>(_1645);
    bool _3400 = !_3392;
    int _3402 = _3400 ? 0 : 1;
    bool _3404 = !_3350;
    float _3406 = _3404 ? as_type<float>(_1647) : as_type<float>(_1643);
    int _3408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3410 = _3408 != 0;
    if (!_3350)
    {
        _3374 = _1629;
    }
    float _3412 = _3374;
    float _3414 = _3412;
    if (!_3350)
    {
        _2462 = _1629;
    }
    float _3416 = _2462;
    float _3418 = _3416;
    if (!_3350)
    {
        _3376 = _1623;
    }
    float _3420 = _3376;
    float _3422 = _3420;
    if (!_3350)
    {
        _3026 = _1623;
    }
    float _3424 = _3026;
    float _3426 = _3424;
    if (_3350)
    {
        _3414 = _1623;
    }
    float _3428 = _3414;
    if (_3350)
    {
        _3418 = _1623;
    }
    float _3430 = _3418;
    if (_3350)
    {
        _3422 = _1631;
    }
    float _3432 = _3422;
    float _3434 = _3428 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_3350)
    {
        _3426 = _1631;
    }
    float _3436 = _3426;
    bool _3438 = _3252 >= 0.0;
    bool _3440 = isnan(_3252);
    bool _3442 = _3438 || _3440;
    bool _3444 = isnan(0.0);
    bool _3446 = _3442 || _3444;
    float _3448 = _3432 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _3450 = _3446 ? 0 : 1;
    bool _3452 = _3252 > 0.0;
    int _3454 = ~_3450;
    int _3456 = _3454 + 1;
    int _3458 = _3456 + 1;
    int _3460 = _3458;
    if (!_3452)
    {
        int _3462 = ~_3450;
        int _3464 = _3462 + 1;
        _3460 = _3464;
    }
    int _3466 = _3460;
    bool _3468 = _3204 >= 0.0;
    bool _3470 = isnan(_3204);
    bool _3472 = _3468 || _3470;
    bool _3474 = isnan(0.0);
    bool _3476 = _3472 || _3474;
    int _3478 = _3476 ? 0 : 1;
    bool _3480 = _3204 > 0.0;
    float _3482 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3484 = _3482 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _3486 = ~_3478;
    int _3488 = _3486 + 1;
    int _3490 = _3488 + 1;
    float _3492 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3494 = _3492 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3496 = 1.0 / _3484;
    int _3498 = _3490;
    if (!_3480)
    {
        int _3500 = ~_3478;
        int _3502 = _3500 + 1;
        _3498 = _3502;
    }
    int _3504 = _3498;
    float _3506 = 1.0 / _3494;
    bool _3508 = _2362 != 3;
    bool _3510 = !_2914;
    int _3512 = _3510 ? 0 : 1;
    bool _3514 = _2412 != 3;
    bool _3516 = !_3036;
    int _3518 = _3516 ? 0 : 1;
    bool _3520 = !_3508;
    int _3522 = _3520 ? 0 : (-1);
    float _3524 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3526 = _3524 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _3528 = _2912 != 3;
    bool _3530 = _3034 != 3;
    float _3532 = 1.0 / _3526;
    bool _3534 = !_3364;
    int _3536 = _3534 ? 0 : 1;
    float _3538 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3540 = _3538 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3542 = !_3528;
    int _3544 = _3542 ? 0 : (-1);
    int _3546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3548 = _3546 != 0;
    int _3550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3552 = _3550 != 0;
    int _3554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3556 = _3554 != 0;
    float _3558 = 1.0 / _3540;
    int _3560 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3562 = _3560 != 0;
    float _3564 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3566 = _3564 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3568 = _449 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _3570 = !_3552;
    int _3572 = _3570 ? 0 : 1;
    float _3574 = fma(_455, (*spvDescriptorSet0.vp_c10)._m0[5].x, _3568);
    float _3576 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3578 = _3576 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _3580 = !_3514;
    int _3582 = _3580 ? 0 : (-1);
    float _3584 = 1.0 / _3566;
    bool _3586 = _1567 != 0;
    int _3588 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3590 = _3588 != 0;
    float _3592 = _449 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _3594 = _449 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _3596 = 1.0 / _3578;
    float _3598 = fma(_455, (*spvDescriptorSet0.vp_c10)._m0[4].x, _3592);
    float _3600 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3602 = _3600 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _3604 = fma(_455, (*spvDescriptorSet0.vp_c10)._m0[6].x, _3594);
    float _3606 = fma(_479, (*spvDescriptorSet0.vp_c10)._m0[4].z, _3598);
    float _3608 = fma(_479, (*spvDescriptorSet0.vp_c10)._m0[5].z, _3574);
    float _3610 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _3612 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _3610;
    float _3614 = 1.0 / _3602;
    float _3616 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _3618 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _3616;
    float _3620 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _3622 = _3620 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _3624 = fma(_479, (*spvDescriptorSet0.vp_c10)._m0[6].z, _3604);
    float _3626 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _3628 = _3626 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _3630 = _3618 * _3532;
    float _3632 = _3622 * _3558;
    float _3634 = -_1892;
    float _3636 = _3634 + 1.0;
    float _3638 = _1900 * _3596;
    bool _3640 = _1353 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _3642 = isnan(_1353);
    bool _3644 = _3640 || _3642;
    bool _3646 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _3648 = _3644 || _3646;
    float _3650 = float(_3648);
    float _3652 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3654 = log2(_3652);
    float _3656 = _3628 * _3496;
    float _3658 = _3612 * _3506;
    bool _3660 = _1353 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _3662 = isnan(_1353);
    bool _3664 = _3660 || _3662;
    bool _3666 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _3668 = _3664 || _3666;
    float _3670 = float(_3668);
    float _3672 = _3650 * _3636;
    float _3674 = -_3650;
    float _3676 = _3674 + 1.0;
    float _3678 = _1904 * _3614;
    float _3680 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3682 = _1353 + _3680;
    bool _3684 = _1353 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3686 = isnan(_1353);
    bool _3688 = _3684 || _3686;
    bool _3690 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _3692 = _3688 || _3690;
    float _3694 = float(_3692);
    float _3696 = 0.0;
    bool _3698 = _2592;
    if (_3586)
    {
        float _3700 = in.m_68.w;
        _3696 = _3700;
    }
    float _3702 = _3696;
    float _3704 = _1629 * 2.0;
    float _3706 = fma(_3658, _3682, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _3708 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3710 = _1353 + _3708;
    float _3712 = _3670 * _3676;
    bool _3714 = _1353 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _3716 = isnan(_1353);
    bool _3718 = _3714 || _3716;
    bool _3720 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _3722 = _3718 || _3720;
    float _3724 = float(_3722);
    float _3726 = -_3694;
    float _3728 = _3726 + 1.0;
    float _3730 = _159 * _3654;
    float _3732 = floor(_3704);
    float _3734 = -_3670;
    float _3736 = _3734 + 1.0;
    float _3738 = fma(_3656, _3710, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _3740 = _3724 * _3728;
    float _3742 = -_3724;
    float _3744 = _3742 + 1.0;
    float _3746 = _3694 * _3736;
    bool _3748 = _1353 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _3750 = isnan(_1353);
    bool _3752 = _3748 || _3750;
    bool _3754 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _3756 = _3752 || _3754;
    float _3758 = float(_3756);
    float _3760 = exp2(_3730);
    float _3762 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3764 = _1353 + _3762;
    float _3766 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3768 = 1.0 + _3766;
    bool _3770 = _1353 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _3772 = isnan(_1353);
    bool _3774 = _3770 || _3772;
    bool _3776 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _3778 = _3774 || _3776;
    float _3780 = float(_3778);
    float _3782 = _3758 * _3744;
    float _3784 = fma(_3630, _3764, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _3786 = -_3758;
    float _3788 = _3786 + 1.0;
    bool _3790 = !_3530;
    int _3792 = _3790 ? 0 : (-1);
    float _3794 = 1.0 / _3768;
    bool _3796 = _3732 >= 0.0;
    bool _3798 = isnan(_3732);
    bool _3800 = _3796 || _3798;
    bool _3802 = isnan(0.0);
    bool _3804 = _3800 || _3802;
    float _3806 = _3780 * _3788;
    float _3808 = -_3780;
    float _3810 = _3808 + 1.0;
    bool _3812 = _1353 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _3814 = isnan(_1353);
    bool _3816 = _3812 || _3814;
    bool _3818 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _3820 = _3816 || _3818;
    float _3822 = float(_3820);
    float _3824 = _3780;
    if (_3586)
    {
        float _3826 = _3702 * 3.1415927410125732421875;
        _3824 = _3826;
    }
    float _3828 = _3824;
    int _3830 = _3804 ? 0 : 1;
    float _3832 = _1896 * _3584;
    float _3834 = -_3760;
    float _3836 = _3834 + 1.0;
    bool _3838 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3840 = isnan(0.0);
    bool _3842 = _3838 || _3840;
    bool _3844 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3846 = _3842 || _3844;
    float _3848 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3850 = _1353 + _3848;
    bool _3852 = !_3556;
    int _3854 = _3852 ? 0 : 1;
    float _3856 = _3828;
    if (_3586)
    {
        float _3858 = _3828 * 0.15915493667125701904296875;
        _3856 = _3858;
    }
    float _3860 = _3856;
    bool _3862 = _1811 != 0;
    float _3864 = _3822 * _3810;
    float _3866 = _3846 ? _3836 : 0.0;
    float _3868 = -_3822;
    float _3870 = _3868 + 1.0;
    float _3872 = fma(_3632, _3850, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _3874 = _3706 * _3864;
    bool _3876 = _3732 > 0.0;
    float _3878 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3880 = _1353 + _3878;
    float _3882 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3884 = _1353 + _3882;
    float _3886 = _3866 * _3794;
    float _3888 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3890 = _1353 + _3888;
    float _3892 = fma(_3870, (*spvDescriptorSet0.vp_c9)._m0[159].x, _3874);
    float _3894 = fma(_3638, _3884, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _3896 = fma(_3678, _3890, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _3898 = _1631 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _3900 = fma(_3738, _3806, _3892);
    float _3902 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _3904 = _3860;
    if (_3586)
    {
        float _3906 = _3860 * 6.283185482025146484375;
        float _3908 = sin(_3906);
        _3904 = _3908;
    }
    float _3910 = _3904;
    float _3912 = fma(_3784, _3782, _3900);
    float _3914 = -_3902;
    float _3916 = fma(_3898, 2.0, _3914);
    int _3918 = ~_3830;
    int _3920 = _3918 + 1;
    int _3922 = _3920 + 1;
    float _3924 = _3608 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _3926 = _3922;
    if (!_3876)
    {
        int _3928 = ~_3830;
        int _3930 = _3928 + 1;
        _3926 = _3930;
    }
    int _3932 = _3926;
    float _3934 = fma(_1623, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1906);
    float _3936 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _3938 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3940 = isnan(1.0);
    bool _3942 = _3938 || _3940;
    bool _3944 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3946 = _3942 || _3944;
    float _3948 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3950 = fma(_3872, _3740, _3912);
    float _3952 = _3606 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _3954 = -_3924;
    float _3956 = _3954 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3958 = fma(_3832, _3880, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _3960 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _3962 = !_3946;
    float _3964 = _3962 ? _159 : _3886;
    float _3966 = fma(_1631, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3936);
    bool _3968 = _1631 > 0.5;
    float _3970 = fma(_1631, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3948);
    float _3972 = _1623 + _1631;
    float _3974 = _1631 + _1629;
    float _3976 = _1631 + (-0.5);
    float _3978 = _3624 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _3980 = -_3952;
    float _3982 = _3980 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3984 = _3956 * _3956;
    float _3986 = fma(_1623, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3960);
    float _3988 = _1629 + (-0.5);
    float _3990 = -_3978;
    float _3992 = _3990 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3994 = fma(_3982, _3982, _3984);
    float _3996 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3998 = _3924 + _3996;
    float _4000 = _1623 + (-0.5);
    float _4002 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4004 = _3952 + _4002;
    float _4006 = fma(_3992, _3992, _3994);
    float _4008 = _3998 * _3998;
    if (_3586)
    {
        bool _4010 = _3910 > 0.5;
        _3698 = _4010;
    }
    bool _4012 = _3698;
    float _4014 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4016 = _3978 + _4014;
    float _4018 = fma(_4004, _4004, _4008);
    float _4020 = rsqrt(_4006);
    float _4022 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _4024 = fma(_4016, _4016, _4018);
    float _4026 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _4028 = fma(_1679, -2.0, _4022);
    float _4030 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _4032 = sqrt(_4024);
    float _4034 = fma(as_type<float>(_1643), (*spvDescriptorSet0.vp_c9)._m0[93].w, _4026);
    float _4036 = as_type<float>(_1643) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _4038 = fma(_3958, _3746, _3950);
    float _4040 = _739 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _4042 = fma(as_type<float>(_1645), (*spvDescriptorSet0.vp_c9)._m0[93].z, _4030);
    float _4044 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _4046 = as_type<float>(_1645) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _4048 = _3972 + (-1.0);
    float _4050 = fma(_3894, _3712, _4038);
    float _4052 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _4054 = -_4044;
    float _4056 = fma(_4046, 2.0, _4054);
    float _4058 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _4060 = _3956 * _4020;
    float _4062 = fma(_4048, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _4064 = fma(_3896, _3672, _4050);
    float _4066 = _4040 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _4068 = _4032 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _4070 = fma(_3436, (*spvDescriptorSet0.vp_c9)._m0[83].z, _4052);
    float _4072 = rsqrt(_4024);
    float _4074 = fma(_4036, -2.0, _4058);
    float _4076 = _3992 * _4020;
    float _4078 = fma(_1693, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _4080 = precise::min(_4066, _4068);
    float _4082 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _4084 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _4086 = _3982 * _4020;
    float _4088 = fma(_3398, (*spvDescriptorSet0.vp_c9)._m0[98].z, _4082);
    float _4090 = fma(_3430, (*spvDescriptorSet0.vp_c9)._m0[83].w, _4084);
    float _4092 = _3974 + (-1.0);
    float _4094 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _4096 = _3398 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _4098 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _4100 = fma(_4092, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _4102 = -_4094;
    float _4104 = fma(_4096, 2.0, _4102);
    float _4106 = fma(_3406, (*spvDescriptorSet0.vp_c9)._m0[98].w, _4098);
    float _4108 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _4110 = _3406 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _4112 = _4072 * _4080;
    out.m_74.w = _4080;
    float _4114 = fma(_4110, -2.0, _4108);
    float _4116 = _3998 * _4112;
    float _4118 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _4120 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _4122 = _4004 * _4112;
    float _4124 = -_4116;
    float _4126 = _3998 + _4124;
    bool _4128 = !_3548;
    int _4130 = _4128 ? 0 : 1;
    float _4132 = -_4118;
    float _4134 = fma(_3448, 2.0, _4132);
    float _4136 = -_4122;
    float _4138 = _4004 + _4136;
    float _4140 = _4126 * _4126;
    float _4142 = fma(_3434, -2.0, _4120);
    int _4144 = abs(_3572);
    float _4146 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _4148 = _4086 * _4146;
    float _4150 = fma(_4138, _4138, _4140);
    int _4152 = abs(_4130);
    float _4154 = in.m_76.x;
    float _4156 = in.m_76.y;
    float _4158 = in.m_76.z;
    float _4160 = float(_3466);
    float _4162 = fma(_1892, (*spvDescriptorSet0.vp_c9)._m0[166].x, _4064);
    float _4164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _4166 = float(_4144);
    float _4168 = -_159;
    float _4170 = fma(_4168, (*spvDescriptorSet0.vp_c9)._m0[96].x, _4104);
    float _4172 = float(_3932);
    float _4174 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4176 = _4076 * _4174;
    float _4178 = float(_4152);
    float _4180 = _4166 * _4160;
    float _4182 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _4184 = -_4148;
    float _4186 = fma(_4076, _4182, _4184);
    float _4188 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _4190 = _4060 * _4188;
    int _4192 = abs(_3854);
    float _4194 = _4178 * _4172;
    float _4196 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _4198 = -_4176;
    float _4200 = fma(_4060, _4196, _4198);
    float _4202 = _4186 * _4186;
    float _4204 = _4016 * _4112;
    float _4206 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4208 = -_4190;
    float _4210 = fma(_4086, _4206, _4208);
    float _4212 = _4194 * (-2.0);
    float _4214 = fma(_4200, _4200, _4202);
    float _4216 = -_4204;
    float _4218 = _4016 + _4216;
    float _4220 = _4180 * (-2.0);
    float _4222 = fma(_4212, _4154, _4154);
    float _4224 = float(_3504);
    float _4226 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    float _4228 = float(_4192);
    float _4230 = fma(_4078, _4220, _4078);
    float _4232 = fma(_4220, _4156, _4156);
    float _4234 = fma(_4062, _4212, _4062);
    float _4236 = fma(_3976, (*spvDescriptorSet0.vp_c9)._m0[196].x, _4222);
    float _4238 = _4228 * _4224;
    float _4240 = fma(_4000, (*spvDescriptorSet0.vp_c9)._m0[196].y, _4232);
    float _4242 = _4164 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _4244 = fma(_3964, _4234, _4236);
    float _4246 = _4238 * (-2.0);
    float _4248 = _1667 + 0.5;
    float _4250 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[97].w, _4106);
    float _4252 = _1677 + (-0.5);
    float _4254 = fma(_4246, _4158, _4158);
    float _4256 = fma(_4100, _4246, _4100);
    float _4258 = _4226 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _4260 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[96].y, _4114);
    float _4262 = fma(_3988, (*spvDescriptorSet0.vp_c9)._m0[196].z, _4254);
    float _4264 = fma(_3964, _4230, _4240);
    float _4266 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[97].z, _4088);
    float _4268 = fma(_4210, _4210, _4214);
    float _4270 = fma(_3964, _4256, _4262);
    float _4272 = fma(_4218, _4218, _4150);
    float _4274 = _4244 * 0.15915493667125701904296875;
    float _4276 = fma(_4242, _4248, _4170);
    float _4278 = -_4250;
    float _4280 = _4278 + 1.0;
    float _4282 = -_4258;
    float _4284 = -_4260;
    float _4286 = fma(_4282, _4252, _4284);
    float _4288 = _4264 * 0.15915493667125701904296875;
    float _4290 = -_4266;
    float _4292 = _4290 + 1.0;
    float _4294 = _4270 * 0.15915493667125701904296875;
    float _4296 = rsqrt(_4268);
    float _4298 = fma(_4280, _1677, _4286);
    float _4300 = -_4292;
    float _4302 = fma(_4300, _1667, _4276);
    float _4304 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _4306 = _3386 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _4308 = _741 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    out.m_78.x = _4302;
    out.m_78.y = _4298;
    float _4310 = sqrt(_4272);
    float _4312 = -_4304;
    float _4314 = fma(_4306, 2.0, _4312);
    float _4316 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    out.m_80.x = _4162;
    float _4318 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _261);
    int _4320 = abs(_2468);
    float _4322 = fma(_3394, -2.0, _4316);
    bool _4324 = !_3562;
    float _4326 = _4324 ? _265 : as_type<float>(_3124);
    float _4328 = _4274 * 6.283185482025146484375;
    float _4330 = sin(_4328);
    int _4332 = _2346 >> 31;
    float _4334 = _4200 * _4296;
    float _4336 = _4186 * _4296;
    float _4338 = _4210 * _4296;
    float _4340 = _4274 * 6.283185482025146484375;
    float _4342 = cos(_4340);
    float _4344 = _4072 * _4310;
    float _4346 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _265);
    float _4348 = _4308 * _4344;
    float _4350 = _4040 * _4344;
    float _4352 = _4288 * 6.283185482025146484375;
    float _4354 = sin(_4352);
    float _4356 = _4348 * _4346;
    float _4358 = _4350 * _4318;
    out.m_82.x = _4350;
    float _4360 = _4288 * 6.283185482025146484375;
    float _4362 = cos(_4360);
    float _4364 = _4294 * 6.283185482025146484375;
    float _4366 = cos(_4364);
    float _4368 = _4330 * _4354;
    float _4370 = _4342 * _4354;
    float _4372 = _4294 * 6.283185482025146484375;
    float _4374 = sin(_4372);
    float _4376 = _4330 * _4362;
    float _4378 = _4330 * _4366;
    float _4380 = _4342 * _4362;
    float _4382 = _4342 * _4366;
    int _4384 = _4332 & 3;
    float _4386 = _4076 * _4336;
    float _4388 = _4354 * _4366;
    float _4390 = _4362 * _4366;
    int _4392 = _2346 + _4384;
    float _4394 = _4086 * _4338;
    float _4396 = -_4370;
    float _4398 = fma(_4374, _4376, _4396);
    float _4400 = -_4376;
    float _4402 = fma(_4374, _4370, _4400);
    int _4404 = _2884 >> 31;
    float _4406 = -_4394;
    float _4408 = fma(_4076, _4334, _4406);
    int _4410 = _2376 >> 31;
    float _4412 = -_4386;
    float _4414 = fma(_4060, _4338, _4412);
    int _4416 = _4404 & 3;
    float _4418 = _4382 * _4408;
    int _4420 = _4392 >> 2;
    float _4422 = _4382 * _4414;
    int _4424 = _2884 + _4416;
    float _4426 = -_4374;
    float _4428 = fma(_4426, _4336, _4418);
    int _4430 = _4410 & 3;
    float _4432 = fma(_4374, _4380, _4368);
    int _4434 = _3006 >> 31;
    float _4436 = _4382 * _4356;
    int _4438 = _4420 << 4;
    int _4440 = _4438 + 368;
    float _4442 = fma(_4374, _4368, _4380);
    int _4444 = _2376 + _4430;
    float _4446 = -_4374;
    float _4448 = fma(_4446, _4334, _4422);
    int _4450 = _4434 & 3;
    float _4452 = _4060 * _4334;
    uint _4454 = uint(int(uint(_4440) >> uint(2)));
    uint _4456 = uint(int(uint(int(_4454)) >> uint(2)));
    int _4458 = int(_4454) & 3;
    float _4460 = (*spvDescriptorSet0.vp_c9)._m0[int(_4456)][_4458];
    int _4462 = int(_4454) + 1;
    uint _4464 = uint(int(uint(_4462) >> uint(2)));
    int _4466 = _4462 & 3;
    float _4468 = (*spvDescriptorSet0.vp_c9)._m0[int(_4464)][_4466];
    int _4470 = _4424 >> 2;
    float _4472 = fma(_4432, _4358, _4436);
    float _4474 = -_4452;
    float _4476 = fma(_4086, _4336, _4474);
    float _4478 = -_4356;
    float _4480 = _4374 * _4478;
    int _4482 = _3006 + _4450;
    float _4484 = _4432 * _4408;
    int _4486 = _4444 >> 2;
    float _4488 = fma(_4390, _4358, _4480);
    int _4490 = _4482 >> 2;
    float _4492 = _4432 * _4414;
    int _4494 = _4470 << 4;
    int _4496 = _4494 + 656;
    float _4498 = _4382 * _4476;
    int _4500 = _4490 << 4;
    int _4502 = _4500 + 800;
    float _4504 = _4432 * _4476;
    int _4506 = _4486 << 4;
    int _4508 = _4506 + 512;
    float _4510 = fma(_4390, _4334, _4492);
    float _4512 = fma(_4390, _4336, _4484);
    uint _4514 = uint(int(uint(_4502) >> uint(2)));
    uint _4516 = uint(int(uint(int(_4514)) >> uint(2)));
    int _4518 = int(_4514) & 3;
    float _4520 = (*spvDescriptorSet0.vp_c9)._m0[int(_4516)][_4518];
    int _4522 = int(_4514) + 1;
    uint _4524 = uint(int(uint(_4522) >> uint(2)));
    int _4526 = _4522 & 3;
    float _4528 = (*spvDescriptorSet0.vp_c9)._m0[int(_4524)][_4526];
    float _4530 = -_4374;
    float _4532 = fma(_4530, _4338, _4498);
    float _4534 = fma(_4390, _4338, _4504);
    float _4536 = _4378 * _4356;
    float _4538 = fma(_4378, _4060, _4428);
    float _4540 = _4344 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _4542 = _4540 * 0.5;
    float _4544 = _4402 * _4414;
    float _4546 = _4402 * _4408;
    uint _4548 = uint(int(uint(_4496) >> uint(2)));
    uint _4550 = uint(int(uint(int(_4548)) >> uint(2)));
    int _4552 = int(_4548) & 3;
    float _4554 = (*spvDescriptorSet0.vp_c9)._m0[int(_4550)][_4552];
    int _4556 = int(_4548) + 1;
    uint _4558 = uint(int(uint(_4556) >> uint(2)));
    int _4560 = _4556 & 3;
    float _4562 = (*spvDescriptorSet0.vp_c9)._m0[int(_4558)][_4560];
    float _4564 = _4402 * _4476;
    float _4566 = fma(_4398, _4358, _4536);
    float _4568 = fma(_4378, _4076, _4532);
    float _4570 = fma(_4388, _4542, _4488);
    float _4572 = fma(_4402, _4542, _4472);
    float _4574 = fma(_4388, _4334, _4544);
    float _4576 = fma(_4388, _4336, _4546);
    uint _4578 = uint(int(uint(_4508) >> uint(2)));
    uint _4580 = uint(int(uint(int(_4578)) >> uint(2)));
    int _4582 = int(_4578) & 3;
    float _4584 = (*spvDescriptorSet0.vp_c9)._m0[int(_4580)][_4582];
    int _4586 = int(_4578) + 1;
    uint _4588 = uint(int(uint(_4586) >> uint(2)));
    int _4590 = _4586 & 3;
    float _4592 = (*spvDescriptorSet0.vp_c9)._m0[int(_4588)][_4590];
    float _4594 = fma(_4388, _4338, _4564);
    float _4596 = _4476 * _4572;
    float _4598 = _4414 * _4572;
    int _4600 = ~_4320;
    int _4602 = _4600 + 1;
    int _4604 = _4602 + 1;
    float _4606 = fma(_4442, _4542, _4566);
    int _4608 = abs(_2492);
    float _4610 = fma(_4334, _4570, _4598);
    int _4612 = _4508 + 8;
    uint _4614 = uint(int(uint(_4612) >> uint(2)));
    uint _4616 = uint(int(uint(int(_4614)) >> uint(2)));
    int _4618 = int(_4614) & 3;
    float _4620 = (*spvDescriptorSet0.vp_c9)._m0[int(_4616)][_4618];
    int _4622 = int(_4614) + 1;
    uint _4624 = uint(int(uint(_4622) >> uint(2)));
    int _4626 = _4622 & 3;
    float _4628 = (*spvDescriptorSet0.vp_c9)._m0[int(_4624)][_4626];
    int _4630 = abs(_3536);
    float _4632 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _4634 = int(_4632);
    int _4636 = abs(_3044);
    float _4638 = fma(_4378, _4086, _4448);
    int _4640 = ~_4608;
    int _4642 = _4640 + 1;
    int _4644 = _4642 + 1;
    int _4646 = _4604 * as_type<int>(_4468);
    int _4648 = abs(_3358);
    int _4650 = _4440 + 8;
    uint _4652 = uint(int(uint(_4650) >> uint(2)));
    uint _4654 = uint(int(uint(int(_4652)) >> uint(2)));
    int _4656 = int(_4652) & 3;
    float _4658 = (*spvDescriptorSet0.vp_c9)._m0[int(_4654)][_4656];
    int _4660 = int(_4652) + 1;
    uint _4662 = uint(int(uint(_4660) >> uint(2)));
    int _4664 = _4660 & 3;
    float _4666 = (*spvDescriptorSet0.vp_c9)._m0[int(_4662)][_4664];
    int _4668 = abs(_3032);
    float _4670 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _4672 = int(_4670);
    int _4674 = ~_4636;
    int _4676 = _4674 + 1;
    int _4678 = _4676 + 1;
    float _4680 = fma(_4338, _4570, _4596);
    int _4682 = ~_4648;
    int _4684 = _4682 + 1;
    int _4686 = _4684 + 1;
    float _4688 = fma(_4442, _4086, _4574);
    int _4690 = ~_4630;
    int _4692 = _4690 + 1;
    int _4694 = _4692 + 1;
    int _4696 = _4496 + 8;
    uint _4698 = uint(int(uint(_4696) >> uint(2)));
    uint _4700 = uint(int(uint(int(_4698)) >> uint(2)));
    int _4702 = int(_4698) & 3;
    float _4704 = (*spvDescriptorSet0.vp_c9)._m0[int(_4700)][_4702];
    int _4706 = int(_4698) + 1;
    uint _4708 = uint(int(uint(_4706) >> uint(2)));
    int _4710 = _4706 & 3;
    float _4712 = (*spvDescriptorSet0.vp_c9)._m0[int(_4708)][_4710];
    int _4714 = ~_4668;
    int _4716 = _4714 + 1;
    int _4718 = _4716 + 1;
    int _4720 = _4686 * as_type<int>(_4460);
    int _4722 = _4720 + _4646;
    int _4724 = abs(_3076);
    float _4726 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _4728 = int(_4726);
    float _4730 = fma(_4442, _4060, _4576);
    float _4732 = fma(_4442, _4076, _4594);
    int _4734 = ~_4724;
    int _4736 = _4734 + 1;
    int _4738 = _4736 + 1;
    int _4740 = _4502 + 8;
    uint _4742 = uint(int(uint(_4740) >> uint(2)));
    uint _4744 = uint(int(uint(int(_4742)) >> uint(2)));
    int _4746 = int(_4742) & 3;
    float _4748 = (*spvDescriptorSet0.vp_c9)._m0[int(_4744)][_4746];
    int _4750 = int(_4742) + 1;
    uint _4752 = uint(int(uint(_4750) >> uint(2)));
    int _4754 = _4750 & 3;
    float _4756 = (*spvDescriptorSet0.vp_c9)._m0[int(_4752)][_4754];
    int _4758 = _4678 * as_type<int>(_4528);
    int _4760 = abs(_3512);
    int _4762 = abs(_3518);
    int _4764 = ~_4760;
    int _4766 = _4764 + 1;
    int _4768 = _4766 + 1;
    int _4770 = _4718 * as_type<int>(_4562);
    float _4772 = float(uint(_4634));
    int _4774 = ~_4762;
    int _4776 = _4774 + 1;
    int _4778 = _4776 + 1;
    int _4780 = _4768 * as_type<int>(_4554);
    int _4782 = _4780 + _4770;
    float _4784 = 1.0 / _4772;
    float _4786 = float(uint(_4672));
    int _4788 = _4644 * as_type<int>(_4592);
    int _4790 = ~_4728;
    int _4792 = _4790 + 1;
    int _4794 = _4778 * as_type<int>(_4520);
    int _4796 = _4794 + _4758;
    int _4798 = abs(_3522);
    int _4800 = _4694 * as_type<int>(_4584);
    int _4802 = _4800 + _4788;
    float _4804 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _4806 = int(_4804);
    int _4808 = ~_3088;
    int _4810 = _4808 + 1;
    int _4812 = _4810 + 1;
    int _4814 = ~_4798;
    int _4816 = _4814 + 1;
    int _4818 = _4816 + 1;
    int _4820 = abs(_4634);
    int _4822 = _4812 * as_type<int>(_4620);
    int _4824 = _4822 + _4802;
    int _4826 = abs(_3118);
    int _4828 = abs(_3136);
    int _4830 = ~_4826;
    int _4832 = _4830 + 1;
    int _4834 = _4832 + 1;
    int _4836 = _4738 * as_type<int>(_4658);
    int _4838 = _4836 + _4722;
    int _4840 = ~_4828;
    int _4842 = _4840 + 1;
    int _4844 = _4842 + 1;
    float _4846 = 1.0 / _4786;
    int _4848 = abs(_3362);
    int _4850 = _4818 * as_type<int>(_4666);
    int _4852 = _4850 + _4838;
    int _4854 = abs(_3582);
    int _4856 = _4834 * as_type<int>(_4704);
    int _4858 = _4856 + _4782;
    int _4860 = abs(_3544);
    int _4862 = ~_4854;
    int _4864 = _4862 + 1;
    int _4866 = _4864 + 1;
    int _4868 = ~_4860;
    int _4870 = _4868 + 1;
    int _4872 = _4870 + 1;
    int _4874 = abs(_4806);
    int _4876 = _4844 * as_type<int>(_4748);
    int _4878 = _4876 + _4796;
    int _4880 = abs(_3402);
    bool _4882 = !_3410;
    int _4884 = _4882 ? 0 : 1;
    int _4886 = abs(_3792);
    int _4888 = _4872 * as_type<int>(_4712);
    int _4890 = _4888 + _4858;
    float _4892 = fma(_4076, _4606, _4680);
    int _4894 = _4866 * as_type<int>(_4628);
    int _4896 = _4894 + _4824;
    int _4898 = ~_4886;
    int _4900 = _4898 + 1;
    int _4902 = _4900 + 1;
    int _4904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _4906 = _4904 != 0;
    int _4908 = abs(_4884);
    float _4910 = _3978 + _4892;
    int _4912 = _4902 * as_type<int>(_4756);
    int _4914 = _4912 + _4878;
    float _4916 = fma(_4086, _4606, _4610);
    int _4918 = ~_4880;
    int _4920 = _4918 + 1;
    int _4922 = _4920 + 1;
    bool _4924 = !_4906;
    int _4926 = _4924 ? 0 : 1;
    int _4928 = ~_4908;
    int _4930 = _4928 + 1;
    int _4932 = _4930 + 1;
    float _4934 = _3952 + _4916;
    float _4936 = float(uint(_4806));
    int _4938 = _4852 * _4922;
    float _4940 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _4942 = _4910 + _4940;
    int _4944 = _4896 * _4932;
    int _4946 = ~_4848;
    int _4948 = _4946 + 1;
    int _4950 = _4948 + 1;
    float _4952 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _4954 = _4934 + _4952;
    float _4956 = _4942 * _4942;
    int _4958 = _3250 * _4908;
    int _4960 = _4958 + _4944;
    float _4962 = float(uint(_4728));
    int _4964 = _3348 * _4880;
    int _4966 = _4964 + _4938;
    float _4968 = fma(_4954, _4954, _4956);
    int _4970 = _4890 * _4950;
    int _4972 = as_type<int>(_4846) + (-2);
    float _4974 = 1.0 / _4936;
    float _4976 = float(uint(_4960));
    int _4978 = _3324 * _4848;
    int _4980 = _4978 + _4970;
    int _4982 = abs(_4926);
    float _4984 = _4408 * _4572;
    int _4986 = as_type<int>(_4784) + (-2);
    float _4988 = as_type<float>(_4972) * _4976;
    float _4990 = float(uint(_4966));
    float _4992 = 1.0 / _4962;
    float _4994 = float(uint(_4820));
    int _4996 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _4998 = _4996 != 0;
    float _5000 = as_type<float>(_4986) * _4990;
    int _5002 = abs(_4672);
    float _5004 = _261 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _5006 = ~_4982;
    int _5008 = _5006 + 1;
    int _5010 = _5008 + 1;
    float _5012 = 1.0 / _4994;
    float _5014 = float(uint(_5002));
    float _5016 = fma(_4336, _4570, _4984);
    float _5018 = float(uint(_4874));
    int _5020 = _4914 * _5010;
    int _5022 = as_type<int>(_4974) + (-2);
    float _5024 = fma(_4060, _4606, _5016);
    float _5026 = float(uint(_4980));
    float _5028 = trunc(_4988);
    float _5030 = precise::max(_5028, 0.0);
    uint _5032 = uint(_5030);
    int _5034 = _3368 * _4982;
    int _5036 = _5034 + _5020;
    int _5038 = ~_4672;
    int _5040 = _5038 + 1;
    int _5042 = abs(_4728);
    float _5044 = as_type<float>(_5022) * _5026;
    int _5046 = as_type<int>(_4992) + (-2);
    float _5048 = trunc(_5000);
    float _5050 = precise::max(_5048, 0.0);
    uint _5052 = uint(_5050);
    float _5054 = float(uint(_5042));
    float _5056 = float(uint(_5036));
    int _5058 = ~_4634;
    int _5060 = _5058 + 1;
    float _5062 = 1.0 / _5014;
    int _5064 = abs(_4966);
    float _5066 = as_type<float>(_5046) * _5056;
    int _5068 = as_type<int>(_5012) + (-2);
    int _5070 = _5040 * int(_5032);
    int _5072 = _5070 + _4960;
    int _5074 = abs(_4960);
    float _5076 = float(uint(_5064));
    float _5078 = 1.0 / _5018;
    int _5080 = _5060 * int(_5052);
    int _5082 = _5080 + _4966;
    float _5084 = float(uint(_5072));
    float _5086 = as_type<float>(_5068) * _5076;
    float _5088 = float(uint(_5082));
    float _5090 = as_type<float>(_4972) * _5084;
    float _5092 = 1.0 / _5054;
    int _5094 = as_type<int>(_5062) + (-2);
    float _5096 = fma(_4398, _4076, _4534);
    int _5098 = abs(_4980);
    float _5100 = as_type<float>(_4986) * _5088;
    int _5102 = abs(_5036);
    float _5104 = fma(_4398, _4086, _4510);
    float _5106 = float(uint(_5098));
    float _5108 = trunc(_5044);
    float _5110 = precise::max(_5108, 0.0);
    uint _5112 = uint(_5110);
    int _5114 = as_type<int>(_5078) + (-2);
    float _5116 = _265 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5118 = as_type<float>(_5114) * _5106;
    float _5120 = fma(_4398, _4060, _4512);
    float _5122 = trunc(_5066);
    float _5124 = precise::max(_5122, 0.0);
    uint _5126 = uint(_5124);
    int _5128 = as_type<int>(_5092) + (-2);
    float _5130 = _5116 * _4568;
    float _5132 = float(uint(_5102));
    out.m_84.x = _5104;
    out.m_84.y = _5120;
    out.m_84.z = _5096;
    float _5134 = -_261;
    int _5136 = _3968 ? as_type<int>(_5134) : as_type<int>(_261);
    float _5138 = as_type<float>(_5102);
    float _5140 = _4060;
    float _5142 = _4934;
    float _5144 = _4910;
    if (!_3586)
    {
        _5138 = _261;
    }
    float _5146 = _5138;
    float _5148 = trunc(_5118);
    float _5150 = precise::max(_5148, 0.0);
    uint _5152 = uint(_5150);
    float _5154 = as_type<float>(_5128) * _5132;
    float _5156 = -_261;
    int _5158 = _3862 ? as_type<int>(_5156) : as_type<int>(_261);
    float _5160 = _5146;
    if (_3586)
    {
        float _5162 = -_261;
        float _5164 = _4012 ? _5162 : _261;
        _5160 = _5164;
    }
    float _5166 = _5160;
    bool _5168 = !_4998;
    float _5170 = _5168 ? _261 : as_type<float>(_5158);
    float _5172 = _5116 * _4638;
    float _5174 = sqrt(_4968);
    int _5176 = ~_4806;
    int _5178 = _5176 + 1;
    int _5180 = _4792 * int(_5126);
    int _5182 = _5180 + _5036;
    bool _5184 = !_3590;
    float _5186 = _5184 ? _261 : as_type<float>(_5136);
    float _5188 = float(uint(_5074));
    int _5190 = _5178 * int(_5112);
    int _5192 = _5190 + _4980;
    float _5194 = _5116 * _4538;
    float _5196 = trunc(_5086);
    float _5198 = precise::max(_5196, 0.0);
    uint _5200 = uint(_5198);
    int _5202 = ~_4820;
    int _5204 = _5202 + 1;
    float _5206 = as_type<float>(_5094) * _5188;
    float _5208 = float(uint(_5192));
    float _5210 = fma(_5004, _5104, _5172);
    float _5212 = fma(_5004, _5120, _5194);
    float _5214 = fma(_5004, _5096, _5130);
    float _5216 = float(uint(_5182));
    float _5218 = as_type<float>(_5022) * _5208;
    float _5220 = trunc(_5206);
    float _5222 = precise::max(_5220, 0.0);
    uint _5224 = uint(_5222);
    bool _5226 = _5174 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5228 = _3924 + _5024;
    float _5230 = as_type<float>(_5046) * _5216;
    int _5232 = ~_5002;
    int _5234 = _5232 + 1;
    float _5236 = trunc(_5154);
    float _5238 = precise::max(_5236, 0.0);
    uint _5240 = uint(_5238);
    int _5242 = _5204 * int(_5200);
    int _5244 = _5242 + _5064;
    int _5246 = ~_4874;
    int _5248 = _5246 + 1;
    if (!_5226)
    {
        _5140 = _4934;
    }
    float _5250 = _5140;
    float _5252 = trunc(_5100);
    float _5254 = precise::max(_5252, 0.0);
    uint _5256 = uint(_5254);
    float _5258 = _5250;
    if (!_5226)
    {
        _5142 = _4910;
    }
    float _5260 = _5142;
    int _5262 = _5234 * int(_5224);
    int _5264 = _5262 + _5074;
    float _5266 = float(uint(_5244));
    float _5268 = _5260;
    if (!_5226)
    {
        _5144 = _5228;
    }
    float _5270 = _5144;
    float _5272 = trunc(_5090);
    float _5274 = precise::max(_5272, 0.0);
    uint _5276 = uint(_5274);
    float _5278 = trunc(_5218);
    float _5280 = precise::max(_5278, 0.0);
    uint _5282 = uint(_5280);
    float _5284 = trunc(_5230);
    float _5286 = precise::max(_5284, 0.0);
    uint _5288 = uint(_5286);
    bool _5290 = !_5226;
    float _5292 = _5270;
    if (!_5290)
    {
        float _5294 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5296 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _5298 = _5174 + _5296;
        float _5300 = _5228 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5302 = rsqrt(_4968);
        float _5304 = _5298 * _5294;
        float _5306 = _5304 * 0.15915493667125701904296875;
        float _5308 = _5306 * 6.283185482025146484375;
        float _5310 = cos(_5308);
        float _5312 = _5306 * 6.283185482025146484375;
        float _5314 = sin(_5312);
        float _5316 = _5310 + (-1.0);
        float _5318 = _5316 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5320 = fma(_5314, _5300, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _5322 = fma(_5228, _5310, _5318);
        float _5324 = _5302 * _5320;
        float _5326 = fma(_4954, _5324, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _5328 = fma(_4942, _5324, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _5258 = _5326;
        _5292 = _5322;
        _5268 = _5328;
    }
    float _5330 = _5258;
    float _5332 = _5292;
    float _5334 = _5268;
    int _5336 = _5248 * int(_5152);
    int _5338 = _5336 + _5098;
    int _5340 = ~_5042;
    int _5342 = _5340 + 1;
    float _5344 = as_type<float>(_5068) * _5266;
    float _5346 = float(uint(_5264));
    float _5348 = -_159;
    float _5350 = fma(_5348, (*spvDescriptorSet0.vp_c9)._m0[86].x, _4314);
    float _5352 = float(uint(_5338));
    float _5354 = trunc(_5344);
    float _5356 = precise::max(_5354, 0.0);
    uint _5358 = uint(_5356);
    float _5360 = as_type<float>(_5094) * _5346;
    int _5362 = int(_5126) + int(_5288);
    float _5364 = as_type<float>(_5114) * _5352;
    int _5366 = int(_5052) + int(_5256);
    int _5368 = _5342 * int(_5240);
    int _5370 = _5368 + _5102;
    int _5372 = ~_4634;
    int _5374 = _5372 + 1;
    float _5376 = trunc(_5364);
    float _5378 = precise::max(_5376, 0.0);
    uint _5380 = uint(_5378);
    int _5382 = int(_5032) + int(_5276);
    float _5384 = -_159;
    float _5386 = fma(_5384, (*spvDescriptorSet0.vp_c9)._m0[81].x, _4134);
    float _5388 = float(uint(_5370));
    int _5390 = _5374 * _5366;
    int _5392 = _5390 + _4966;
    int _5394 = ~_4672;
    int _5396 = _5394 + 1;
    float _5398 = -_159;
    float _5400 = fma(_5398, (*spvDescriptorSet0.vp_c9)._m0[91].x, _4056);
    int _5402 = int(_5112) + int(_5282);
    float _5404 = as_type<float>(_5128) * _5388;
    float _5406 = trunc(_5360);
    float _5408 = precise::max(_5406, 0.0);
    uint _5410 = uint(_5408);
    int _5412 = ~_4728;
    int _5414 = _5412 + 1;
    int _5416 = _5396 * _5382;
    int _5418 = _5416 + _4960;
    bool _5420 = uint(_5392) >= uint(_4634);
    float _5422 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[86].y, _4322);
    int _5424 = int(_5200) + int(_5358);
    int _5426 = _5414 * _5362;
    int _5428 = _5426 + _5036;
    bool _5430 = uint(_5418) >= uint(_4672);
    float _5432 = trunc(_5404);
    float _5434 = precise::max(_5432, 0.0);
    uint _5436 = uint(_5434);
    int _5438 = ~_4806;
    int _5440 = _5438 + 1;
    float _5442 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[92].w, _4034);
    bool _5444 = uint(_5428) >= uint(_4728);
    float _5446 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3970);
    int _5448 = ~_5042;
    int _5450 = _5448 + 1;
    int _5452 = _5440 * _5402;
    int _5454 = _5452 + _4980;
    int _5456 = ~_4820;
    int _5458 = _5456 + 1;
    float _5460 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3934);
    int _5462 = int(_5152) + int(_5380);
    float _5464 = -_5446;
    float _5466 = _5464 + 1.0;
    int _5468 = ~_4874;
    int _5470 = _5468 + 1;
    int _5472 = _5458 * _5424;
    int _5474 = _5472 + _5064;
    bool _5476 = !_5420;
    int _5478 = _5476 ? 0 : (-1);
    float _5480 = -_5460;
    float _5482 = _5480 + 1.0;
    int _5484 = int(_5224) + int(_5410);
    int _5486 = _5470 * _5462;
    int _5488 = _5486 + _5098;
    int _5490 = int(_5240) + int(_5436);
    float _5492 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _5494 = uint(_5474) >= uint(_4820);
    float _5496 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[92].z, _4042);
    int _5498 = ~_5366;
    int _5500 = _5498 + _5478;
    int _5502 = _5500 + 1;
    int _5504 = _5450 * _5490;
    int _5506 = _5504 + _5102;
    int _5508 = ~_5002;
    int _5510 = _5508 + 1;
    float _5512 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3966);
    bool _5514 = !_5430;
    int _5516 = _5514 ? 0 : (-1);
    float _5518 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _5520 = uint(_5454) >= uint(_4806);
    int _5522 = _4634 * _5502;
    int _5524 = _5522 + _4966;
    int _5526 = ~_5382;
    int _5528 = _5526 + _5516;
    int _5530 = _5528 + 1;
    int _5532 = _5510 * _5484;
    int _5534 = _5532 + _5074;
    bool _5536 = _4634 == 0;
    float _5538 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3986);
    bool _5540 = uint(_5488) >= uint(_4874);
    int _5542 = _4672 * _5530;
    int _5544 = _5542 + _4960;
    bool _5546 = !_5520;
    int _5548 = _5546 ? 0 : (-1);
    float _5550 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _5552 = _4966 ^ _4634;
    float _5554 = _5492 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _5556 = !_5536;
    int _5558 = _5556 ? _5524 : (-1);
    float _5560 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[82].z, _4070);
    bool _5562 = uint(_5534) >= uint(_5002);
    float _5564 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[82].w, _4090);
    int _5566 = ~_5402;
    int _5568 = _5566 + _5548;
    int _5570 = _5568 + 1;
    float _5572 = -_5560;
    float _5574 = _5572 + 1.0;
    bool _5576 = _4672 == 0;
    float _5578 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _5580 = !_5494;
    int _5582 = _5580 ? 0 : (-1);
    int _5584 = _4806 * _5570;
    int _5586 = _5584 + _4980;
    uint _5588 = uint(int(uint(_5552) >> uint(31)));
    float _5590 = -_5538;
    float _5592 = _5590 + 1.0;
    bool _5594 = !_5562;
    int _5596 = _5594 ? 0 : (-1);
    float _5598 = -_5564;
    float _5600 = _5598 + 1.0;
    bool _5602 = !_5576;
    int _5604 = _5602 ? _5544 : (-1);
    bool _5606 = _4806 == 0;
    bool _5608 = _4806 == 0;
    int _5610 = _4980 ^ _4806;
    float _5612 = _5518 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _5614 = ~_5582;
    int _5616 = _5424 + _5614;
    int _5618 = _5616 + 1;
    float _5620 = -_159;
    float _5622 = fma(_5620, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3916);
    int _5624 = ~int(_5588);
    int _5626 = _5624 + 1;
    float _5628 = _5578 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _5630 = float(_5558);
    bool _5632 = uint(_5506) >= uint(_5042);
    bool _5634 = !_5444;
    int _5636 = _5634 ? 0 : (-1);
    float _5638 = fma(_5612, _5630, _5622);
    int _5640 = _4960 ^ _4672;
    int _5642 = _5618 ^ _5626;
    int _5644 = ~_5362;
    int _5646 = _5644 + _5636;
    int _5648 = _5646 + 1;
    bool _5650 = !_5606;
    int _5652 = _5650 ? _5586 : (-1);
    uint _5654 = uint(int(uint(_5640) >> uint(31)));
    int _5656 = ~_5626;
    int _5658 = _5656 + _5642;
    int _5660 = _5658 + 1;
    int _5662 = _5036 ^ _4728;
    float _5664 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _5666 = float(_5652);
    int _5668 = _4728 * _5648;
    int _5670 = _5668 + _5036;
    bool _5672 = !_5540;
    int _5674 = _5672 ? 0 : (-1);
    int _5676 = ~_5596;
    int _5678 = _5484 + _5676;
    int _5680 = _5678 + 1;
    float _5682 = fma(_5554, _5666, _5350);
    int _5684 = ~int(_5654);
    int _5686 = _5684 + 1;
    float _5688 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _5690 = _4728 == 0;
    int _5692 = _5680 ^ _5686;
    bool _5694 = !_5690;
    int _5696 = _5694 ? _5670 : (-1);
    uint _5698 = uint(int(uint(_5610) >> uint(31)));
    float _5700 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    int _5702 = ~_5674;
    int _5704 = _5462 + _5702;
    int _5706 = _5704 + 1;
    float _5708 = _5664 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    int _5710 = ~_5686;
    int _5712 = _5710 + _5692;
    int _5714 = _5712 + 1;
    float _5716 = float(_5604);
    float _5718 = float(_5696);
    float _5720 = _5186 + 0.5;
    int _5722 = ~int(_5698);
    int _5724 = _5722 + 1;
    float _5726 = fma(_5628, _5716, _5386);
    bool _5728 = _4634 == 0;
    float _5730 = fma(_5612, _5720, _5638);
    bool _5732 = !_5632;
    int _5734 = _5732 ? 0 : (-1);
    float _5736 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    uint _5738 = uint(int(uint(_5662) >> uint(31)));
    float _5740 = _5170 + 0.5;
    int _5742 = _5706 ^ _5724;
    float _5744 = _5550 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _5746 = _4672 == 0;
    float _5748 = fma(_5708, _5718, _5400);
    int _5750 = ~_5734;
    int _5752 = _5490 + _5750;
    int _5754 = _5752 + 1;
    float _5756 = fma(_5628, _5740, _5726);
    int _5758 = ~int(_5738);
    int _5760 = _5758 + 1;
    float _5762 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[76].y, _4028);
    bool _5764 = !_5728;
    int _5766 = _5764 ? _5660 : (-1);
    float _5768 = _5688 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _5770 = ~_5724;
    int _5772 = _5770 + _5742;
    int _5774 = _5772 + 1;
    float _5776 = _5166 + 0.5;
    int _5778 = _5754 ^ _5760;
    float _5780 = _1761 + 0.5;
    bool _5782 = !_5746;
    int _5784 = _5782 ? _5714 : (-1);
    float _5786 = fma(_5708, _5776, _5748);
    float _5788 = float(_5766);
    float _5790 = _5700 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    bool _5792 = _4728 == 0;
    float _5794 = fma(_5116, _5116, 1.0);
    int _5796 = ~_5760;
    int _5798 = _5796 + _5778;
    int _5800 = _5798 + 1;
    float _5802 = -_5762;
    float _5804 = fma(_5744, _5788, _5802);
    float _5806 = float(_5784);
    float _5808 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[81].y, _4142);
    bool _5810 = !_5608;
    int _5812 = _5810 ? _5774 : (-1);
    float _5814 = rsqrt(_5794);
    bool _5816 = !_5792;
    int _5818 = _5816 ? _5800 : (-1);
    float _5820 = -_5808;
    float _5822 = fma(_5768, _5806, _5820);
    float _5824 = fma(_5554, _5780, _5682);
    float _5826 = float(_5812);
    float _5828 = _5736 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _5830 = float(_5818);
    float _5832 = _4326 + (-0.5);
    float _5834 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[91].y, _4074);
    float _5836 = -_5422;
    float _5838 = fma(_5828, _5826, _5836);
    float _5840 = -_5466;
    float _5842 = fma(_1761, _5840, _5824);
    float _5844 = -_5744;
    float _5846 = fma(_5844, _5832, _5804);
    float _5848 = -_5834;
    float _5850 = fma(_5790, _5830, _5848);
    float _5852 = _1523 + (-0.5);
    float _5854 = _1819 + (-0.5);
    float _5856 = _1765 + (-0.5);
    float _5858 = -_3952;
    float _5860 = _5858 + _5330;
    float _5862 = -_5790;
    float _5864 = fma(_5862, _5852, _5850);
    float _5866 = -_5442;
    float _5868 = _5866 + 1.0;
    float _5870 = -_5768;
    float _5872 = fma(_5870, _5854, _5822);
    float _5874 = _5116 * _5814;
    float _5876 = -_5828;
    float _5878 = fma(_5876, _5856, _5838);
    float _5880 = fma(_5868, _1523, _5864);
    float _5882 = -_3924;
    float _5884 = _5882 + _5332;
    float _5886 = -_4730;
    float _5888 = _5874 * _5886;
    float _5890 = -_4688;
    float _5892 = _5874 * _5890;
    float _5894 = -_4732;
    float _5896 = _5874 * _5894;
    float _5898 = _5884 * _5884;
    float _5900 = fma(_1765, _5482, _5878);
    float _5902 = fma(_5814, _4538, _5888);
    float _5904 = fma(_5814, _4568, _5896);
    float _5906 = -_3978;
    float _5908 = _5906 + _5334;
    float _5910 = fma(_5860, _5860, _5898);
    float _5912 = -_5496;
    float _5914 = _5912 + 1.0;
    float _5916 = -_5512;
    float _5918 = _5916 + 1.0;
    float _5920 = -_5574;
    float _5922 = fma(_5170, _5920, _5756);
    float _5924 = fma(_5908, _5908, _5910);
    float _5926 = -_5914;
    float _5928 = fma(_5926, _5166, _5786);
    float _5930 = fma(_5814, _4638, _5892);
    float _5932 = -_5918;
    float _5934 = fma(_5186, _5932, _5730);
    float _5936 = sqrt(_5924);
    float _5938 = fma(_4326, _5592, _5846);
    float _5940 = fma(_1819, _5600, _5872);
    float _5942 = _4688 + _5210;
    float _5944 = _4730 + _5212;
    float _5946 = _4732 + _5214;
    out.m_86.x = _5842;
    out.m_86.y = _5900;
    float _5948 = -_4122;
    float _5950 = _5948 + _5330;
    float _5952 = -_4204;
    float _5954 = _5952 + _5334;
    float _5956 = -_4204;
    float _5958 = _3978 + _5956;
    out.m_88.x = _5934;
    out.m_88.y = _5938;
    out.m_88.z = _5922;
    out.m_88.w = _5940;
    out.m_90.x = _5928;
    out.m_90.y = _5880;
    bool _5960 = _5936 > 0.0;
    float _5962 = -_4122;
    float _5964 = _3952 + _5962;
    out.m_92.x = _5942;
    out.m_92.y = _5944;
    out.m_92.z = _5946;
    float _5966 = -_4116;
    float _5968 = _5966 + _5332;
    float _5970 = -_4116;
    float _5972 = _3924 + _5970;
    out.m_94.x = _5930;
    out.m_94.y = _5902;
    out.m_94.z = _5904;
    float _5974 = _5930;
    float _5976 = _5902;
    float _5978 = _5904;
    float _5980 = _5938;
    float _5982 = _5934;
    float _5984 = _5730;
    float _5986 = _5954;
    float _5988 = _5968;
    if (!_5960)
    {
        _5974 = _5950;
    }
    float _5990 = _5974;
    float _5992 = _5990;
    if (!_5960)
    {
        _5976 = _5968;
    }
    float _5994 = _5976;
    float _5996 = _5994;
    float _5998 = _5994;
    if (!_5960)
    {
        _5978 = _5954;
    }
    float _6000 = _5978;
    bool _6002 = !_5960;
    float _6004 = _6000;
    float _6006 = _6000;
    if (!_6002)
    {
        bool _6008 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _6010 = _5990;
        if (_6008)
        {
            float _6012 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _6010 = _6012;
        }
        float _6014 = _6010;
        float _6016 = _6014;
        float _6018 = _6014;
        if (_6008)
        {
            float _6020 = _481 * _6014;
            _5980 = _6020;
        }
        float _6022 = _5980;
        float _6024 = _6022;
        if (_6008)
        {
            float _6026 = _483 * _6014;
            _5982 = _6026;
        }
        float _6028 = _5982;
        float _6030 = _6028;
        if (_6008)
        {
            float _6032 = _485 * _6014;
            _5984 = _6032;
        }
        float _6034 = _5984;
        float _6036 = _6034;
        if (!_6008)
        {
            bool _6038 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _6040 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _6042 = _6038 || _6040;
            bool _6044 = isnan(1.0);
            bool _6046 = _6042 || _6044;
            float _6048 = _159 + 1.0;
            float _6050 = _6048;
            if (!_6046)
            {
                float _6052 = _6048 * _6048;
                float _6054 = _6052 * 0.5;
                _6016 = _6054;
            }
            float _6056 = _6016;
            float _6058 = _6056;
            if (!_6046)
            {
                float _6060 = _6056 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _6058 = _6060;
            }
            float _6062 = _6058;
            bool _6064 = !_6046;
            float _6066 = _6062;
            if (!_6064)
            {
                float _6068 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _6070 = log2(_6068);
                float _6072 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _6074 = 1.0 + _6072;
                float _6076 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _6078 = _6070 * _6048;
                float _6080 = 1.0 / _6074;
                float _6082 = _6076 * 0.693147182464599609375;
                float _6084 = exp2(_6078);
                float _6086 = 1.0 / _6082;
                float _6088 = _6084 + (-1.0);
                float _6090 = -_6088;
                float _6092 = fma(_6090, _6086, _6048);
                float _6094 = _6092 * _6080;
                float _6096 = _6094 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _6066 = _6096;
            }
            float _6098 = _6066;
            float _6100 = _6098 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _6102 = _6098 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _6104 = !_6046;
            _6018 = _6098;
            if (!_6104)
            {
                float _6106 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _6108 = log2(_6106);
                float _6110 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _6112 = 1.0 + _6110;
                float _6114 = 1.0 / _6112;
                float _6116 = _6108 * _6048;
                float _6118 = exp2(_6116);
                float _6120 = -_6118;
                float _6122 = _6120 + 1.0;
                float _6124 = _6122 * _6114;
                _6050 = _6124;
            }
            float _6126 = _6050;
            float _6128 = fma(_6126, _197, _6102);
            float _6130 = _6098 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _6132 = fma(_6126, _195, _6100);
            float _6134 = -_439;
            float _6136 = _6134 + _6128;
            float _6138 = fma(_6126, _199, _6130);
            float _6140 = -_441;
            float _6142 = _6140 + _6132;
            float _6144 = _6136 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _6146 = _6136 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _6148 = _6136 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _6150 = -_443;
            float _6152 = _6150 + _6138;
            float _6154 = fma(_6142, (*spvDescriptorSet0.vp_c10)._m0[4].x, _6144);
            float _6156 = fma(_6142, (*spvDescriptorSet0.vp_c10)._m0[5].x, _6146);
            float _6158 = fma(_6142, (*spvDescriptorSet0.vp_c10)._m0[6].x, _6148);
            float _6160 = fma(_6152, (*spvDescriptorSet0.vp_c10)._m0[4].z, _6154);
            float _6162 = fma(_6152, (*spvDescriptorSet0.vp_c10)._m0[5].z, _6156);
            float _6164 = fma(_6152, (*spvDescriptorSet0.vp_c10)._m0[6].z, _6158);
            _489 = _6162;
            _491 = _6160;
            _493 = _6164;
            _6024 = _6160;
            _6030 = _6162;
            _6036 = _6164;
            _5996 = _6152;
            _6004 = _6136;
        }
        float _6166 = _489;
        float _6168 = _491;
        float _6170 = _493;
        float _6172 = _6024;
        float _6174 = _6030;
        float _6176 = _6036;
        float _6178 = _5996;
        float _6180 = _6018;
        float _6182 = _6004;
        float _6184 = _6166 * _6166;
        float _6186 = fma(_6168, _6168, _6184);
        float _6188 = fma(_6170, _6170, _6186);
        float _6190 = rsqrt(_5924);
        float _6192 = sqrt(_6188);
        float _6194 = _5860 * _6190;
        float _6196 = _5884 * _6190;
        float _6198 = _5908 * _6190;
        bool _6200 = _6192 > 0.0;
        float _6202 = _6180;
        float _6204 = _6178;
        float _6206 = _6182;
        _495 = _6170;
        if (!_6200)
        {
            _6202 = _5950;
        }
        float _6208 = _6202;
        _5992 = _6208;
        if (!_6200)
        {
            _6204 = _5968;
        }
        float _6210 = _6204;
        _5998 = _6210;
        if (!_6200)
        {
            _6206 = _5954;
        }
        float _6212 = _6206;
        bool _6214 = !_6200;
        _6006 = _6212;
        if (!_6214)
        {
            float _6216 = rsqrt(_6188);
            float _6218 = _6216 * _6166;
            float _6220 = _6216 * _6168;
            float _6222 = _6216 * _6170;
            float _6224 = _6196 * _6218;
            float _6226 = fma(_6194, _6220, _6224);
            float _6228 = fma(_6198, _6222, _6226);
            float _6230 = _6228 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _6232 = fma(_6172, _6230, _5950);
            float _6234 = fma(_6174, _6230, _5968);
            float _6236 = fma(_6176, _6230, _5954);
            _5998 = _6234;
            _5992 = _6232;
            _6006 = _6236;
        }
    }
    float _6238 = _5998;
    float _6240 = _5992;
    float _6242 = _6006;
    float _6244 = _495;
    float _6246 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _6248 = _6238 + _6246;
    float _6250 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _6252 = _6240 + _6250;
    float _6254 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _6256 = _6242 + _6254;
    float _6258 = _6248 * _6248;
    float _6260 = fma(_6252, _6252, _6258);
    float _6262 = _5972 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _6264 = fma(_6256, _6256, _6260);
    float _6266 = fma(_5964, (*spvDescriptorSet0.vp_c8)._m0[11].x, _6262);
    float _6268 = fma(_5964, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _6270 = rsqrt(_6264);
    float _6272 = fma(_5958, (*spvDescriptorSet0.vp_c8)._m0[11].z, _6266);
    float _6274 = _5972 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _6276 = _6272 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _6278 = fma(_5964, (*spvDescriptorSet0.vp_c8)._m0[10].x, _6274);
    float _6280 = 1.0 / _6276;
    float _6282 = fma(_5958, (*spvDescriptorSet0.vp_c8)._m0[10].z, _6278);
    float _6284 = _6282 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _6286 = _6270 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _6288 = _6284 + _6276;
    float _6290 = _6252 * _6286;
    float _6292 = _6256 * _6286;
    float _6294 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _6296 = _6290 * _6290;
    float _6298 = _6292 * _6292;
    float _6300 = _5972 + _6294;
    float _6302 = _6288 * _6280;
    float _6304 = _6302 * 0.5;
    float _6306 = _6296 + _6298;
    float _6308 = _6300 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _6310 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _6312 = fma(_6304, (*spvDescriptorSet0.vp_c8)._m0[30].w, _6310);
    float _6314 = sqrt(_6306);
    float _6316 = fma(_5964, (*spvDescriptorSet0.vp_c15)._m0[126].x, _6308);
    float _6318 = fma(_5958, (*spvDescriptorSet0.vp_c15)._m0[126].z, _6316);
    float _6320 = 1.0 / _6312;
    float _6322 = _6318 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _6324 = _6300 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _6326 = fma(_5964, (*spvDescriptorSet0.vp_c15)._m0[127].x, _6324);
    bool _6328 = _6314 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6330 = trunc(_6322);
    int _6332 = int(_6330);
    float _6334 = fma(_5958, (*spvDescriptorSet0.vp_c15)._m0[127].z, _6326);
    float _6336 = _6334 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _6338 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _6340 = _6320 * _6338;
    float _6342 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6344 = _6314 + _6342;
    float _6346 = trunc(_6336);
    int _6348 = int(_6346);
    bool _6350 = _6340 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _6352 = _6340 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    int _6354 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _6356 = _6332 + _6354;
    int _6358 = _6356 + 1;
    float _6360 = _6280;
    int _6362 = 2;
    float _6364 = _6344;
    float _6366 = _6306;
    int _6368 = _6358;
    float _6370 = _6290;
    float _6372 = _6340;
    if (_6328)
    {
        float _6374 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6360 = _6374;
    }
    float _6376 = _6360;
    bool _6378 = !_6350;
    int _6380 = _6378 ? 0 : 1;
    int _6382 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _6384 = _6348 + _6382;
    int _6386 = _6384 + 1;
    float _6388 = floor(_6268);
    if (!_6350)
    {
        _6362 = 1;
    }
    int _6390 = _6362;
    bool _6392 = _6358 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _6394 = _6390;
    if (!_6352)
    {
        _6394 = _6380;
    }
    int _6396 = _6394;
    float _6398 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _6400 = _6376;
    if (_6328)
    {
        float _6402 = _6344 * _6376;
        _6364 = _6402;
    }
    float _6404 = _6364;
    if (_6328)
    {
        float _6406 = rsqrt(_6306);
        _6366 = _6406;
    }
    float _6408 = _6366;
    int _6410 = _6396 << 6;
    float _6412 = _6408;
    if (_6328)
    {
        float _6414 = _6404 * 0.15915493667125701904296875;
        _6400 = _6414;
    }
    float _6416 = _6400;
    int _6418 = _6358 | _6386;
    int _6420 = _6410 + 96;
    uint _6422 = uint(int(uint(_6420) >> uint(2)));
    uint _6424 = uint(int(uint(int(_6422)) >> uint(2)));
    int _6426 = int(_6422) & 3;
    float _6428 = (*spvDescriptorSet0.vp_c15)._m0[int(_6424)][_6426];
    int _6430 = int(_6422) + 1;
    uint _6432 = uint(int(uint(_6430) >> uint(2)));
    int _6434 = _6430 & 3;
    float _6436 = (*spvDescriptorSet0.vp_c15)._m0[int(_6432)][_6434];
    float _6438 = precise::max(0.0, _6398);
    bool _6440 = _6418 < 0;
    bool _6442 = _6440 || _6392;
    float _6444 = _6244;
    float _6446 = _6438;
    if (_6328)
    {
        float _6448 = _6416 * 6.283185482025146484375;
        float _6450 = cos(_6448);
        _6444 = _6450;
    }
    float _6452 = _6444;
    float _6454 = -_6388;
    float _6456 = _6268 + _6454;
    float _6458 = -_6286;
    float _6460 = -_6438;
    float _6462 = fma(_6248, _6458, _6460);
    bool _6464 = _6386 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _6466 = _6464 || _6442;
    int _6468 = _6410 + 80;
    uint _6470 = uint(int(uint(_6468) >> uint(2)));
    uint _6472 = uint(int(uint(int(_6470)) >> uint(2)));
    int _6474 = int(_6470) & 3;
    float _6476 = (*spvDescriptorSet0.vp_c15)._m0[int(_6472)][_6474];
    int _6478 = int(_6470) + 1;
    uint _6480 = uint(int(uint(_6478) >> uint(2)));
    int _6482 = _6478 & 3;
    float _6484 = (*spvDescriptorSet0.vp_c15)._m0[int(_6480)][_6482];
    float _6486 = _6462;
    if (_6328)
    {
        float _6488 = _6462 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6446 = _6488;
    }
    float _6490 = _6446;
    float _6492 = as_type<float>(_6418);
    if (_6328)
    {
        float _6494 = _6416 * 6.283185482025146484375;
        float _6496 = sin(_6494);
        _6492 = _6496;
    }
    float _6498 = _6492;
    float _6500 = fma(_5958, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _6502 = _6238 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _6504 = _6410 + 48;
    uint _6506 = uint(int(uint(_6504) >> uint(2)));
    uint _6508 = uint(int(uint(int(_6506)) >> uint(2)));
    int _6510 = int(_6506) & 3;
    float _6512 = (*spvDescriptorSet0.vp_c15)._m0[int(_6508)][_6510];
    int _6514 = int(_6506) + 1;
    uint _6516 = uint(int(uint(_6514) >> uint(2)));
    int _6518 = _6514 & 3;
    float _6520 = (*spvDescriptorSet0.vp_c15)._m0[int(_6516)][_6518];
    float _6522 = fma(_6240, (*spvDescriptorSet0.vp_c8)._m0[2].x, _6502);
    if (!_6466)
    {
        int _6524 = _6386 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _6526 = _6524 + _6358;
        _6368 = _6526;
    }
    int _6528 = _6368;
    float _6530 = _6452;
    if (_6328)
    {
        float _6532 = _6452 + (-1.0);
        _5986 = _6532;
    }
    float _6534 = _5986;
    float _6536 = floor(_6500);
    float _6538 = fma(_6242, (*spvDescriptorSet0.vp_c8)._m0[2].z, _6522);
    int _6540 = _6410 + 104;
    uint _6542 = uint(int(uint(_6540) >> uint(2)));
    uint _6544 = uint(int(uint(int(_6542)) >> uint(2)));
    int _6546 = int(_6542) & 3;
    float _6548 = (*spvDescriptorSet0.vp_c15)._m0[int(_6544)][_6546];
    int _6550 = int(_6542) + 1;
    uint _6552 = uint(int(uint(_6550) >> uint(2)));
    int _6554 = _6550 & 3;
    float _6556 = (*spvDescriptorSet0.vp_c15)._m0[int(_6552)][_6554];
    float _6558 = _6534;
    if (_6328)
    {
        float _6560 = _6534 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6558 = _6560;
    }
    float _6562 = _6558;
    if (_6328)
    {
        float _6564 = fma(_6498, _6490, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _5988 = _6564;
    }
    float _6566 = _5988;
    float _6568 = _6566;
    if (_6328)
    {
        float _6570 = fma(_6462, _6452, _6562);
        _6486 = _6570;
    }
    float _6572 = _6486;
    float _6574 = _5466;
    if (!_6466)
    {
        float _6576 = floor(_6336);
        _6574 = _6576;
    }
    float _6578 = _6574;
    float _6580 = _6538 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _6582 = _6410 + 64;
    uint _6584 = uint(int(uint(_6582) >> uint(2)));
    uint _6586 = uint(int(uint(int(_6584)) >> uint(2)));
    int _6588 = int(_6584) & 3;
    float _6590 = (*spvDescriptorSet0.vp_c15)._m0[int(_6586)][_6588];
    int _6592 = int(_6584) + 1;
    uint _6594 = uint(int(uint(_6592) >> uint(2)));
    int _6596 = _6592 & 3;
    float _6598 = (*spvDescriptorSet0.vp_c15)._m0[int(_6594)][_6596];
    if (_6328)
    {
        float _6600 = _6408 * _6566;
        _6568 = _6600;
    }
    float _6602 = _6568;
    float _6604 = _6602;
    if (!_6328)
    {
        _6530 = _6292;
    }
    float _6606 = _6530;
    float _6608 = _6606;
    if (!_6328)
    {
        _6412 = _6296;
    }
    float _6610 = _6412;
    float _6612 = _6610;
    if (_6328)
    {
        float _6614 = _6290 * _6602;
        _6370 = _6614;
    }
    float _6616 = _6370;
    float _6618 = sqrt(_6264);
    if (_6328)
    {
        float _6620 = _6292 * _6602;
        _6608 = _6620;
    }
    float _6622 = _6608;
    int _6624 = _6410 + 56;
    uint _6626 = uint(int(uint(_6624) >> uint(2)));
    uint _6628 = uint(int(uint(int(_6626)) >> uint(2)));
    int _6630 = int(_6626) & 3;
    float _6632 = (*spvDescriptorSet0.vp_c15)._m0[int(_6628)][_6630];
    int _6634 = int(_6626) + 1;
    uint _6636 = uint(int(uint(_6634) >> uint(2)));
    int _6638 = _6634 & 3;
    float _6640 = (*spvDescriptorSet0.vp_c15)._m0[int(_6636)][_6638];
    if (_6328)
    {
        float _6642 = _6616 * _6616;
        _6612 = _6642;
    }
    float _6644 = _6612;
    if (!_6328)
    {
        _6604 = _6298;
    }
    float _6646 = _6604;
    float _6648 = _6646;
    if (_6328)
    {
        float _6650 = _6622 * _6622;
        _6648 = _6650;
    }
    float _6652 = _6648;
    float _6654 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _6656 = fma(_6572, _6572, _6644);
    float _6658 = _6580 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _6660 = -_6536;
    float _6662 = _6500 + _6660;
    int _6664 = _6410 + 72;
    uint _6666 = uint(int(uint(_6664) >> uint(2)));
    uint _6668 = uint(int(uint(int(_6666)) >> uint(2)));
    int _6670 = int(_6666) & 3;
    float _6672 = (*spvDescriptorSet0.vp_c15)._m0[int(_6668)][_6670];
    int _6674 = int(_6666) + 1;
    uint _6676 = uint(int(uint(_6674) >> uint(2)));
    int _6678 = _6674 & 3;
    float _6680 = (*spvDescriptorSet0.vp_c15)._m0[int(_6676)][_6678];
    float _6682 = _6300 * _6436;
    int _6684 = as_type<int>(_6536);
    int _6686 = as_type<int>(_6658);
    float _6688 = _6656;
    int _6690 = as_type<int>(_6652);
    if (!_6466)
    {
        int _6692 = _6528 << 2;
        _6684 = _6692;
    }
    int _6694 = _6684;
    float _6696 = -_6658;
    float _6698 = fma(_6696, _6654, 1.0);
    float _6700 = fma(_5964, _6428, _6682);
    if (!_6466)
    {
        int _6702 = 12 & _6694;
        _6686 = _6702;
    }
    int _6704 = _6686;
    int _6706 = _6410 + 88;
    uint _6708 = uint(int(uint(_6706) >> uint(2)));
    uint _6710 = uint(int(uint(int(_6708)) >> uint(2)));
    int _6712 = int(_6708) & 3;
    float _6714 = (*spvDescriptorSet0.vp_c15)._m0[int(_6710)][_6712];
    int _6716 = int(_6708) + 1;
    uint _6718 = uint(int(uint(_6716) >> uint(2)));
    int _6720 = _6716 & 3;
    float _6722 = (*spvDescriptorSet0.vp_c15)._m0[int(_6718)][_6720];
    float _6724 = _6300 * _6484;
    float _6726 = log2(_6698);
    float _6728 = fma(_5964, _6476, _6724);
    float _6730 = _6656 + _6652;
    int _6732 = _6704;
    float _6734 = _6730;
    if (!_6466)
    {
        float _6736 = -_6578;
        float _6738 = _6336 + _6736;
        _6688 = _6738;
    }
    float _6740 = _6688;
    if (!_6466)
    {
        uint _6742 = uint(int(uint(_6528) >> uint(2)));
        _6690 = int(_6742);
    }
    int _6744 = _6690;
    float _6746 = _6300 * _6520;
    float _6748 = rsqrt(_6730);
    if (!_6466)
    {
        int _6750 = _6744 << 4;
        int _6752 = _6750 + _6704;
        _6732 = _6752;
    }
    int _6754 = _6732;
    float _6756 = fma(_5964, _6512, _6746);
    float _6758 = fma(_5958, _6548, _6700);
    float _6760 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _6762 = fma(_6618, (*spvDescriptorSet0.vp_c15)._m0[23].w, _6760);
    float _6764 = precise::clamp(_6762, 0.0, 1.0);
    float _6766 = _6726 * 0.693147182464599609375;
    float _6768 = _6758 + _6556;
    float _6770 = -_6764;
    float _6772 = _6770 + 1.0;
    float _6774 = 1.0 / _6768;
    float _6776 = _6300 * _6598;
    float _6778 = fma(_5964, _6590, _6776);
    float _6780 = _6748 * _6616;
    float _6782 = _6748 * _6572;
    float _6784 = fma(_5958, _6632, _6756);
    float _6786 = abs(_6772);
    float _6788 = log2(_6786);
    float _6790 = _6780 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _6792 = _6748 * _6622;
    float _6794 = _6784 + _6640;
    float _6796 = _6238 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _6798 = -_6790;
    float _6800 = fma(_6782, (*spvDescriptorSet0.vp_c15)._m0[21].y, _6798);
    float _6802 = _6238 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _6804 = fma(_5958, _6672, _6778);
    float _6806 = _6794 * _6774;
    float _6808 = fma(_6240, (*spvDescriptorSet0.vp_c8)._m0[1].x, _6796);
    float _6810 = fma(_6240, (*spvDescriptorSet0.vp_c8)._m0[3].x, _6802);
    float _6812 = -_6792;
    float _6814 = fma(_6812, (*spvDescriptorSet0.vp_c15)._m0[21].z, _6800);
    float _6816 = _6768;
    float _6818 = _6782;
    if (!_6466)
    {
        float _6820 = floor(_6322);
        _6816 = _6820;
    }
    float _6822 = _6816;
    bool _6824 = _6806 >= 0.0;
    float _6826 = fma(_6242, (*spvDescriptorSet0.vp_c8)._m0[1].z, _6808);
    float _6828 = fma(_5958, _6714, _6728);
    float _6830 = _6804 + _6680;
    float _6832 = _6238 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _6834 = _6788 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _6836 = _6806 <= 1.0;
    bool _6838 = _6836 && _6824;
    float _6840 = _6830 * _6774;
    float _6842 = fma(_6240, (*spvDescriptorSet0.vp_c8)._m0[0].x, _6832);
    float _6844 = _6826 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _6846 = exp2(_6834);
    float _6848 = fma(_6242, (*spvDescriptorSet0.vp_c8)._m0[3].z, _6810);
    float _6850 = fma(_6242, (*spvDescriptorSet0.vp_c8)._m0[0].z, _6842);
    bool _6852 = _6840 >= 0.0;
    bool _6854 = _6852 && _6838;
    float _6856 = fma(_6814, -0.5, 0.5);
    float _6858 = _6848 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _6860 = _6850 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _6862 = _6844 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _6864 = _6840 <= 1.0;
    bool _6866 = _6864 && _6854;
    float _6868 = sqrt(_6856);
    float _6870 = _6782 + 1.0;
    float _6872 = fma(_6860, (*spvDescriptorSet0.vp_c8)._m0[7].x, _6862);
    float _6874 = _6828 + _6722;
    float _6876 = fma(_6814, 0.5, 0.5);
    float _6878 = _6844 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _6880 = fma(_6580, (*spvDescriptorSet0.vp_c8)._m0[7].z, _6872);
    float _6882 = -_6782;
    float _6884 = fma(_6846, _6870, _6882);
    float _6886 = fma(_6876, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _6888 = fma(_6860, (*spvDescriptorSet0.vp_c8)._m0[4].x, _6878);
    float _6890 = fma(_6858, (*spvDescriptorSet0.vp_c8)._m0[7].w, _6880);
    float _6892 = _6844 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _6894 = _6860;
    if (_6866)
    {
        float _6896 = float(_6396);
        _6818 = _6896;
    }
    float _6898 = _6818;
    float _6900 = fma(_6876, _6886, -0.212114393711090087890625);
    float _6902 = 1.0 / _6890;
    float _6904 = fma(_6860, (*spvDescriptorSet0.vp_c8)._m0[5].x, _6892);
    float _6906 = fma(_6580, (*spvDescriptorSet0.vp_c8)._m0[4].z, _6888);
    float _6908 = _6868 * 0.636619746685028076171875;
    float _6910 = fma(_6876, _6900, 1.570728778839111328125);
    float _6912 = fma(_6580, (*spvDescriptorSet0.vp_c8)._m0[5].z, _6904);
    float _6914 = fma(_6858, (*spvDescriptorSet0.vp_c8)._m0[4].w, _6906);
    if (!_6466)
    {
        float _6916 = -_6822;
        float _6918 = _6322 + _6916;
        _6734 = _6918;
    }
    float _6920 = _6734;
    float _6922 = _6898;
    if (_6866)
    {
        float _6924 = rint(_6898);
        float _6926 = precise::max(_6924, 0.0);
        uint _6928 = uint(_6926);
        uint _6930 = clamp(_6928, 0u, 65535u);
        _6922 = as_type<float>(_6930);
    }
    float _6932 = _6922;
    float _6934 = fma(_6858, (*spvDescriptorSet0.vp_c8)._m0[5].w, _6912);
    float _6936 = -_6910;
    float _6938 = fma(_6908, _6936, 1.0);
    float _6940 = _6874 * _6774;
    float2 _17657 = float2(_6456, _6662);
    float _6942 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_17657, float2(0.0), isnan(_17657)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_17657, float2(0.0), isnan(_17657)), level(0.0)).x;
    float _6944 = _6766 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _6946 = fma(_6884, 0.5, 0.5);
    float _6948 = _6748;
    float _6950 = _6940;
    float _6952 = _6934;
    if (!_6466)
    {
        int _6954 = _6754 + 400;
        uint _6956 = uint(int(uint(_6954) >> uint(2)));
        uint _6958 = uint(int(uint(int(_6956)) >> uint(2)));
        int _6960 = int(_6956) & 3;
        float _6962 = (*spvDescriptorSet0.vp_c15)._m0[int(_6958)][_6960];
        _6948 = _6962;
    }
    float _6964 = _6948;
    float _6966 = _6914 * _6902;
    float _6968 = _6934 * _6902;
    float _6970 = fma(_6966, 0.5, 0.5);
    float _6972 = fma(_6968, -0.5, 0.5);
    float _6974 = _6910;
    if (_6866)
    {
        float3 _17716 = float3(_6806, _6840, float(as_type<int>(_6932)));
        float3 _17720 = select(_17716, float3(0.0), isnan(_17716));
        float _6976 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _17720.xy, uint(rint(_17720.z)), _6940, level(0.0));
        _6974 = _6976;
    }
    float _6978 = _6974;
    float3 _17730 = float3(_6970, _6972, _6944);
    float _6980 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_17730, float3(0.0), isnan(_17730)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_17730, float3(0.0), isnan(_17730)), level(0.0)).x;
    float3 _17739 = float3(_6970, _6972, _6944);
    float4 _6983 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_17739, float3(0.0), isnan(_17739)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_17739, float3(0.0), isnan(_17739)), level(0.0)).xyzw;
    float _6985 = _6983.x;
    float _6987 = _6983.y;
    float _6989 = _6983.z;
    float _6991 = _6983.w;
    float2 _17755 = float2(_6938, _6946);
    float3 _6995 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_17755, float2(0.0), isnan(_17755)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_17755, float2(0.0), isnan(_17755)), level(0.0)).xyz;
    float _6997 = _6995.x;
    float _6999 = _6995.y;
    float _7001 = _6995.z;
    float _7003 = _6902;
    if (!_6466)
    {
        float _7005 = rint(_6964);
        float _7007 = precise::max(_7005, 0.0);
        uint _7009 = uint(_7007);
        uint _7011 = clamp(_7009, 0u, 65535u);
        _7003 = as_type<float>(_7011);
    }
    float _7013 = _7003;
    float _7015 = _6920;
    if (!_6466)
    {
        float3 _17792 = float3(_6920, _6740, float(as_type<int>(_7013)));
        float3 _17794 = select(_17792, float3(0.0), isnan(_17792));
        float _7017 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _17794.xy, uint(rint(_17794.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _17794.xy, uint(rint(_17794.z)), level(0.0)).x;
        _7015 = _7017;
    }
    float _7019 = _7015;
    float _7021 = abs(_6340);
    float _7023 = log2(_7021);
    bool _7025 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _7027 = isnan(0.5);
    bool _7029 = _7025 || _7027;
    bool _7031 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _7033 = _7029 || _7031;
    float _7035 = _6844 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_96.x = _5964;
    out.m_96.y = _5972;
    out.m_96.z = _5958;
    float _7037 = fma(_6860, (*spvDescriptorSet0.vp_c8)._m0[6].x, _7035);
    float _7039 = fma(_6580, (*spvDescriptorSet0.vp_c8)._m0[6].z, _7037);
    if (!_7033)
    {
        _6894 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _7041 = _6894;
    float _7043 = _7023 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _7045 = exp2(_7043);
    float _7047 = _6890 * 0.5;
    float _7049 = fma(_7045, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _7051 = precise::clamp(_7049, 0.0, 1.0);
    float _7053 = _7045;
    if (!_7033)
    {
        float _7055 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _7057 = _7041 + _7055;
        _7053 = _7057;
    }
    float _7059 = _7053;
    float _7061 = fma(_6858, (*spvDescriptorSet0.vp_c8)._m0[6].w, _7039);
    float _7063 = _6788 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _7065 = fma(_7051, -2.0, 3.0);
    float _7067 = _7051 * _7051;
    float _7069 = _7061 + _6890;
    float _7071 = _6858;
    if (!_7033)
    {
        float _7073 = 1.0 / _7059;
        _7071 = _7073;
    }
    float _7075 = _7071;
    out.gl_Position.x = _6914;
    out.gl_Position.y = _6934;
    out.gl_Position.z = _7061;
    out.gl_Position.w = _6890;
    float _7077 = _7067 * _7065;
    float _7079 = _6914 + _6890;
    float _7081 = _7069 * 0.5;
    float _7083 = fma(_6934, -0.5, _7047);
    float _7085 = _7079 * 0.5;
    float _7087 = exp2(_7063);
    float _7089 = -_7077;
    float _7091 = _7089 + 1.0;
    bool _7093 = _6340 <= 8000.0;
    bool _7095 = isnan(_6340);
    bool _7097 = _7093 || _7095;
    bool _7099 = isnan(8000.0);
    bool _7101 = _7097 || _7099;
    float _7103 = float(_7101);
    float _7105 = _7091;
    if (!_7033)
    {
        float _7107 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _7109 = _6340 + _7107;
        _6372 = _7109;
    }
    float _7111 = _6372;
    out.m_98.x = _7085;
    out.m_98.y = _7083;
    out.m_98.z = _7081;
    out.m_98.w = _6890;
    float _7113 = fma(_7091, (*spvDescriptorSet0.vp_c15)._m0[654].w, _7077);
    float _7115 = _7111;
    if (_7033)
    {
        _7105 = 1.0;
    }
    float _7117 = _7105;
    float _7119 = _7117;
    if (!_7033)
    {
        float _7121 = _7111 * _7075;
        float _7123 = precise::clamp(_7121, 0.0, 1.0);
        _7119 = _7123;
    }
    float _7125 = _7119;
    float _7127 = _7103 * _7113;
    if (!_6866)
    {
        _7115 = 1.0;
    }
    float _7129 = _7115;
    float _7131 = _7127 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _7133 = -_7087;
    float _7135 = _7133 + 1.0;
    float _7137 = _7135 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _7139 = -_6942;
    float _7141 = _7139 + 1.0;
    float _7143 = _7141 * _7131;
    float _7145 = precise::clamp(_7143, 0.0, 1.0);
    float _7147 = _7131;
    float _7149 = _7129;
    float _7151 = _7145;
    if (_6466)
    {
        _7147 = 1.0;
    }
    float _7153 = _7147;
    float _7155 = _7153;
    if (_6866)
    {
        bool _7157 = _6978 >= _6940;
        bool _7159 = isnan(_6978);
        bool _7161 = _7157 || _7159;
        bool _7163 = isnan(_6940);
        bool _7165 = _7161 || _7163;
        float _7167 = float(_7165);
        _7149 = _7167;
    }
    float _7169 = _7149;
    if (!_6466)
    {
        int _7171 = _6528 << 4;
        int _7173 = _7171 + 2048;
        uint _7175 = uint(int(uint(_7173) >> uint(2)));
        uint _7177 = uint(int(uint(int(_7175)) >> uint(2)));
        int _7179 = int(_7175) & 3;
        float _7181 = (*spvDescriptorSet0.vp_c15)._m0[int(_7177)][_7179];
        int _7183 = int(_7175) + 1;
        uint _7185 = uint(int(uint(_7183) >> uint(2)));
        int _7187 = _7183 & 3;
        float _7189 = (*spvDescriptorSet0.vp_c15)._m0[int(_7185)][_7187];
        int _7191 = _7173 + 8;
        uint _7193 = uint(int(uint(_7191) >> uint(2)));
        uint _7195 = uint(int(uint(int(_7193)) >> uint(2)));
        int _7197 = int(_7193) & 3;
        float _7199 = (*spvDescriptorSet0.vp_c15)._m0[int(_7195)][_7197];
        int _7201 = int(_7193) + 1;
        uint _7203 = uint(int(uint(_7201) >> uint(2)));
        int _7205 = _7201 & 3;
        float _7207 = (*spvDescriptorSet0.vp_c15)._m0[int(_7203)][_7205];
        float _7209 = _6300 * _7189;
        float _7211 = fma(_5964, _7181, _7209);
        float _7213 = fma(_5958, _7199, _7211);
        float _7215 = _7213 + _7207;
        float _7217 = precise::clamp(_7215, 0.0, 1.0);
        float _7219 = -_7217;
        float _7221 = _7219 + _7019;
        float _7223 = fma(_7221, 500.0, 1.5);
        float _7225 = exp2(_7223);
        float _7227 = 0.0 + _7225;
        float _7229 = precise::clamp(_7227, 0.0, 1.0);
        _7155 = _7229;
        _6950 = 500.0;
    }
    float _7231 = _7155;
    float _7233 = _6950;
    float _7235 = _7137 * _6980;
    float _7237 = _7169 * _7231;
    float _7239 = -_7145;
    float _7241 = fma(_7239, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _7243 = -_7137;
    float _7245 = _7243 + 1.0;
    float _7247 = _6991 * _7235;
    float _7249 = _7001 * _7235;
    float _7251 = -_7237;
    float _7253 = fma(_7251, _7241, 1.0);
    float _7255 = precise::clamp(_7253, 0.0, 1.0);
    float _7257 = _6991 * _7245;
    float _7259 = fma(_6997, _7247, _6985);
    float _7261 = fma(_6999, _7247, _6987);
    float _7263 = _7255 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _7265 = fma(_6991, _7249, _6989);
    out.m_100.x = _6240;
    out.m_100.y = _6238;
    out.m_100.z = _6242;
    bool _7267 = _6618 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _7269 = isnan(_6618);
    bool _7271 = _7267 || _7269;
    bool _7273 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _7275 = _7271 || _7273;
    float _7277 = _7125 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_102.x = _7263;
    out.m_104.x = _7259;
    out.m_104.y = _7261;
    out.m_104.z = _7265;
    out.m_104.w = _7257;
    float _7279 = _7241;
    float _7281 = _7245;
    float _7283 = _7233;
    float _7285 = _7255;
    if (!_7275)
    {
        _6952 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _7287 = _6952;
    float _7289 = _7287;
    float _7291 = _7287;
    if (!_7275)
    {
        _7151 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _7293 = _7151;
    float _7295 = _7293;
    float _7297 = _7293;
    if (!_7275)
    {
        _7279 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _7299 = _7279;
    float _7301 = _7299;
    float _7303 = _7299;
    if (!_7275)
    {
        _7281 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _7305 = _7281;
    float _7307 = _7305;
    float _7309 = _7305;
    if (!_7275)
    {
        _7283 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _7311 = _7283;
    float _7313 = _7311;
    float _7315 = _7311;
    if (!_7275)
    {
        _7285 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _7317 = _7285;
    bool _7319 = !_7275;
    float _7321 = _7317;
    float _7323 = _7317;
    if (!_7319)
    {
        bool _7325 = _6618 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _7327 = isnan(_6618);
        bool _7329 = _7325 || _7327;
        bool _7331 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _7333 = _7329 || _7331;
        if (!_7333)
        {
            float _7335 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _7337 = _6618 + _7335;
            float _7339 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _7341 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _7339;
            float _7343 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _7345 = _7343 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _7347 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _7349 = _7347 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _7351 = 1.0 / _7341;
            float _7353 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _7355 = _7353 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _7357 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _7359 = _7357 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _7361 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _7363 = _7361 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _7365 = _7337 * _7351;
            float _7367 = precise::clamp(_7365, 0.0, 1.0);
            float _7369 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _7371 = _7369 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _7373 = fma(_7367, _7345, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _7375 = fma(_7367, _7349, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _7377 = fma(_7367, _7371, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _7379 = fma(_7367, _7355, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _7381 = fma(_7367, _7359, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _7383 = fma(_7367, _7363, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _7315 = _7373;
            _7297 = _7381;
            _7309 = _7375;
            _7291 = _7379;
            _7323 = _7377;
            _7303 = _7383;
            _7385 = true;
        }
        else
        {
            bool _7387 = _6618 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _7389 = isnan(_6618);
            bool _7391 = _7387 || _7389;
            bool _7393 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _7395 = _7391 || _7393;
            if (!_7395)
            {
                _7289 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _7397 = _7289;
            _7291 = _7397;
            if (!_7395)
            {
                _7295 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _7399 = _7295;
            _7297 = _7399;
            if (!_7395)
            {
                _7301 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _7401 = _7301;
            _7303 = _7401;
            if (!_7395)
            {
                _7307 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _7403 = _7307;
            _7309 = _7403;
            if (!_7395)
            {
                _7313 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _7405 = _7313;
            _7315 = _7405;
            if (!_7395)
            {
                _7321 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _7407 = _7321;
            bool _7409 = !_7395;
            _7323 = _7407;
            if (!_7409)
            {
                bool _7411 = _6618 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _7413 = isnan(_6618);
                bool _7415 = _7411 || _7413;
                bool _7417 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _7419 = _7415 || _7417;
                if (!_7419)
                {
                    float _7421 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _7423 = _6618 + _7421;
                    float _7425 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _7427 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _7425;
                    float _7429 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _7431 = _7429 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _7433 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _7435 = _7433 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _7437 = 1.0 / _7427;
                    float _7439 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _7441 = _7439 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _7443 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _7445 = _7443 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _7447 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _7449 = _7447 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _7451 = _7423 * _7437;
                    float _7453 = precise::clamp(_7451, 0.0, 1.0);
                    float _7455 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _7457 = _7455 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _7459 = fma(_7453, _7431, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _7461 = fma(_7453, _7435, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _7463 = fma(_7453, _7457, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _7465 = fma(_7453, _7441, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _7467 = fma(_7453, _7445, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _7469 = fma(_7453, _7449, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _7315 = _7459;
                    _7297 = _7467;
                    _7309 = _7461;
                    _7291 = _7465;
                    _7323 = _7463;
                    _7303 = _7469;
                    _7385 = true;
                }
                else
                {
                    _7315 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _7297 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _7309 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _7291 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _7323 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _7303 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _7385 = false;
    float _7471 = _7315;
    float _7473 = _7297;
    float _7475 = _7309;
    float _7477 = _7291;
    float _7479 = _7323;
    float _7481 = _7303;
    float _7483 = _7277 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _7485 = fma(_5944, -0.5, 0.5);
    float _7487 = precise::clamp(_7485, 0.0, 1.0);
    float _7489 = -_7471;
    float _7491 = _7473 + _7489;
    float _7493 = -_7475;
    float _7495 = _7477 + _7493;
    out.m_59.x = _7483;
    float _7497 = fma(_7487, _7491, _7471);
    float _7499 = -_7479;
    float _7501 = _7481 + _7499;
    float _7503 = fma(_7487, _7495, _7475);
    float _7505 = _7497 * 0.586610972881317138671875;
    bool _7507 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _7509 = fma(_7487, _7501, _7479);
    out.m_106.x = 0.0;
    float _7511 = fma(_7503, 0.298911988735198974609375, _7505);
    bool _7513 = _7125 > 0.0;
    bool _7515 = isnan(_7125);
    bool _7517 = _7513 || _7515;
    bool _7519 = isnan(0.0);
    bool _7521 = _7517 || _7519;
    float _7523 = fma(_7509, 0.114477999508380889892578125, _7511);
    float _7525 = -_7523;
    float _7527 = _7503 + _7525;
    float _7529 = -_7523;
    float _7531 = _7497 + _7529;
    float _7533 = -_7523;
    float _7535 = _7509 + _7533;
    float _7537 = fma(_7527, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7523);
    float _7539 = fma(_7531, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7523);
    float _7541 = fma(_7535, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7523);
    bool _7543 = !_7507;
    if (!_7543)
    {
        float _7545 = -_6238;
        float _7547 = _7545 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _7549 = -_6240;
        float _7551 = _7549 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _7553 = -_6242;
        float _7555 = _7553 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _7557 = _7547 * _7547;
        float _7559 = fma(_7551, _7551, _7557);
        float _7561 = fma(_7555, _7555, _7559);
        float _7563 = sqrt(_7561);
        float _7565 = rsqrt(_7561);
        float _7567 = -_7563;
        float _7569 = _7567 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _7571 = _7569 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _7573 = precise::clamp(_7571, 0.0, 1.0);
        float _7575 = _7551 * _7565;
        float _7577 = _7547 * _7565;
        float _7579 = abs(_7573);
        float _7581 = log2(_7579);
        float _7583 = _7555 * _7565;
        float _7585 = _7575 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _7587 = _5944 * _7577;
        float _7589 = -_7577;
        float _7591 = -_7585;
        float _7593 = fma(_7589, (*spvDescriptorSet0.vp_c15)._m0[656].y, _7591);
        float _7595 = fma(_5942, _7575, _7587);
        float _7597 = -_7583;
        float _7599 = fma(_7597, (*spvDescriptorSet0.vp_c15)._m0[656].z, _7593);
        float _7601 = fma(_5946, _7583, _7595);
        float _7603 = precise::clamp(_7601, 0.0, 1.0);
        float _7605 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _7607 = _7599 + _7605;
        float _7609 = _7581 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _7611 = _7607 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _7613 = precise::clamp(_7611, 0.0, 1.0);
        float _7615 = exp2(_7609);
        float _7617 = _7615 * _7613;
        float _7619 = _7603 * _7617;
        float _7621 = _7619 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _7623 = _7619 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _7625 = _7619 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_106.x = _7621;
        out.m_106.y = _7623;
        out.m_106.z = _7625;
    }
    out.m_74.x = _7537;
    out.m_74.y = _7539;
    out.m_74.z = _7541;
    if (_7521)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_59.x = 0.0;
    float _7627 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _7627;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _7385 = false;
    bool _1341 = false;
    bool _1183 = false;
    bool _1041 = false;
    bool _763 = false;
    bool _515 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _120 = in.m_56.w;
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
        out.m_59.x = 0.0;
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
        float _7684 = as_type<float>(_141);
        out.gl_Position.z = _7684;
    }
    if (!_129)
    {
        return out;
    }
    float _145 = in.m_61.w;
    bool _147 = _145 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _149 = isnan(_145);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _155 = _151 || _153;
    float _157 = -_145;
    float _159 = _157 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _161 = 0.0;
    if (_155)
    {
        float _163 = float(_125);
        _161 = _163;
    }
    float _165 = _161;
    bool _167 = _159 >= _165;
    bool _169 = !_155;
    bool _171 = _167 || _169;
    if (_171)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _173 = _135;
    if (_171)
    {
        out.m_59.x = 0.0;
    }
    if (_171)
    {
        float _175 = _173 * 5.0;
        _143 = as_type<int>(_175);
    }
    int _177 = _143;
    if (_171)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7752 = as_type<float>(_177);
        out.gl_Position.z = _7752;
    }
    if (_171)
    {
        return out;
    }
    float _179 = as_type<float>(int(gl_VertexIndex));
    float _181 = _159 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _183 = in.m_66.w;
    bool _185 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _187 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _189 = _185 || _187;
    bool _191 = isnan(1.0);
    bool _193 = _189 || _191;
    float _195 = in.m_61.x;
    float _197 = in.m_61.y;
    float _199 = in.m_61.z;
    float _201 = in.m_56.x;
    float _203 = in.m_56.y;
    float _205 = in.m_56.z;
    float _207 = 0.0;
    float _209 = _181;
    if (!_193)
    {
        float _211 = _181 * _181;
        float _213 = _211 * 0.5;
        _207 = _213;
    }
    float _215 = _207;
    float _217 = _215;
    if (!_193)
    {
        float _219 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _217 = _219;
    }
    float _221 = _217;
    int _223 = as_type<int>(_179) & 1;
    bool _225 = _223 != 0;
    int _227 = as_type<int>(_179) & 2;
    bool _229 = _227 != 0;
    int _231 = int(_225);
    int _233 = _229 ? 2 : 0;
    int _235 = _231 | _233;
    int _237 = _193 ? 4 : 0;
    int _239 = _235 | _237;
    int _241 = false ? 8 : 0;
    int _243 = _239 | _241;
    int _245 = false ? 16 : 0;
    int _247 = _243 | _245;
    int _249 = false ? 32 : 0;
    int _251 = _247 | _249;
    int _253 = false ? 64 : 0;
    int _255 = _251 | _253;
    int _257 = _255 & 4;
    bool _259 = !_225;
    float _261 = _259 ? (-0.5) : 0.5;
    bool _263 = !_229;
    float _265 = _263 ? (-0.5) : 0.5;
    bool _267 = !_193;
    float _269 = 0.0;
    float _271 = _221;
    float _273 = as_type<float>(_257);
    bool _275 = _193;
    if (!_267)
    {
        float _277 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _279 = log2(_277);
        float _281 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _283 = _281 + 1.0;
        float _285 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _287 = _181 * _279;
        float _289 = 1.0 / _283;
        float _291 = _285 * 0.693147182464599609375;
        float _293 = exp2(_287);
        float _295 = 1.0 / _291;
        float _297 = _293 + (-1.0);
        float _299 = -_297;
        float _301 = fma(_299, _295, _181);
        float _303 = _301 * _289;
        float _305 = _303 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _269 = _293;
        _271 = _305;
        _273 = _295;
    }
    float _307 = _269;
    float _309 = _271;
    float _311 = _273;
    bool _313 = !_193;
    float _315 = _307;
    float _317 = _311;
    if (!_313)
    {
        float _319 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _321 = log2(_319);
        float _323 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _325 = _323 + 1.0;
        float _327 = 1.0 / _325;
        float _329 = _181 * _321;
        float _331 = exp2(_329);
        float _333 = -_331;
        float _335 = _333 + 1.0;
        float _337 = _335 * _327;
        _315 = _331;
        _317 = _325;
        _209 = _337;
    }
    float _339 = _315;
    float _341 = _317;
    float _343 = _209;
    float _345 = _339;
    float _347 = _341;
    if (!_193)
    {
        float _349 = _159 * _159;
        float _351 = _349 * 0.5;
        _345 = _351;
    }
    float _353 = _345;
    float _355 = _353;
    if (!_193)
    {
        _347 = _159;
    }
    float _357 = _347;
    float _359 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _361 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _363 = _357;
    if (!_193)
    {
        float _365 = _353 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _355 = _365;
    }
    float _367 = _355;
    bool _369 = !_193;
    float _371 = _367;
    if (!_369)
    {
        float _373 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _375 = log2(_373);
        float _377 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _379 = _377 + 1.0;
        float _381 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _383 = _159 * _375;
        float _385 = 1.0 / _379;
        float _387 = _381 * 0.693147182464599609375;
        float _389 = exp2(_383);
        float _391 = 1.0 / _387;
        float _393 = _389 + (-1.0);
        float _395 = -_393;
        float _397 = fma(_395, _391, _159);
        float _399 = _397 * _385;
        float _401 = _399 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _371 = _401;
    }
    float _403 = _371;
    bool _405 = !_193;
    if (!_405)
    {
        float _407 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _409 = log2(_407);
        float _411 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _413 = _411 + 1.0;
        float _415 = 1.0 / _413;
        float _417 = _159 * _409;
        float _419 = exp2(_417);
        float _421 = -_419;
        float _423 = _421 + 1.0;
        float _425 = _423 * _415;
        _363 = _425;
    }
    float _427 = _363;
    float _429 = fma(_343, _195, _359);
    float _431 = _403 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _433 = _403 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _435 = _403 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _437 = fma(_343, _197, _361);
    float _439 = fma(_427, _197, _431);
    float _441 = fma(_427, _195, _433);
    float _443 = fma(_427, _199, _435);
    bool _445 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _447 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _449 = fma(_437, _183, _203);
    float _451 = -_439;
    float _453 = _437 + _451;
    float _455 = fma(_429, _183, _201);
    float _457 = fma(_343, _199, _447);
    float _459 = -_441;
    float _461 = _429 + _459;
    float _463 = _453 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _465 = _453 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _467 = _453 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _469 = -_443;
    float _471 = _457 + _469;
    float _473 = fma(_461, (*spvDescriptorSet0.vp_c10)._m0[4].x, _463);
    float _475 = fma(_461, (*spvDescriptorSet0.vp_c10)._m0[5].x, _465);
    float _477 = fma(_461, (*spvDescriptorSet0.vp_c10)._m0[6].x, _467);
    float _479 = fma(_457, _183, _205);
    float _481 = fma(_471, (*spvDescriptorSet0.vp_c10)._m0[4].z, _473);
    float _483 = fma(_471, (*spvDescriptorSet0.vp_c10)._m0[5].z, _475);
    float _485 = fma(_471, (*spvDescriptorSet0.vp_c10)._m0[6].z, _477);
    bool _487 = !_445;
    float _489 = _483;
    float _491 = _481;
    float _493 = _485;
    float _495 = _485;
    float _513;
    if (!_487)
    {
        float _497 = in.m_68.x;
        float _499 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _501 = _497 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _503 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[12].x, _159);
        float _505 = _503 * _499;
        float _507 = floor(_505);
        float _509 = -_507;
        float _511 = _505 + _509;
        _513 = _511;
        _515 = true;
    }
    else
    {
        float _517 = float(_125);
        float _519 = 1.0 / _517;
        float _521 = _159 * _519;
        _513 = _521;
    }
    _515 = false;
    float _523 = _513;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _527 = _523 + _525;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _531 = _523 + _529;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _533;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _539 = _537 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _541;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _549 = in.m_66.x;
    float _551 = in.m_66.y;
    float _553 = 1.0 / _535;
    bool _555 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _557 = isnan(_523);
    bool _559 = _555 || _557;
    bool _561 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _563 = _559 || _561;
    float _565 = float(_563);
    bool _567 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _569 = 1.0 / _539;
    float _571 = 1.0 / _543;
    float _573 = _527 * _553;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _577 = _523 + _575;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _581 = _523 + _579;
    float _583 = 1.0 / _547;
    float _585 = _531 * _569;
    bool _587 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _589 = isnan(_523);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _595 = _591 || _593;
    float _597 = float(_595);
    float _599 = -_565;
    float _601 = _599 + 1.0;
    float _603 = _597 * _601;
    float _605 = _577 * _571;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _607;
    bool _611 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _613 = isnan(_523);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _619 = _615 || _617;
    float _621 = float(_619);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _625 = _623 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _627 = fma(_609, _573, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _629 = fma(_625, _585, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _631 = _581 * _583;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _633;
    bool _637 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _639 = isnan(_523);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _645 = _641 || _643;
    float _647 = float(_645);
    bool _649 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _651 = isnan(_523);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = fma(_635, _573, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _663 = -_597;
    float _665 = _663 + 1.0;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _669 = _667 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _671 = _647 * _665;
    float _673 = -_647;
    float _675 = _673 + 1.0;
    float _677 = fma(_669, _585, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _679 = _621 * _675;
    float _681 = -_621;
    float _683 = _681 + 1.0;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _685;
    float _689 = _659 * _683;
    float _691 = -_659;
    float _693 = _691 + 1.0;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _695;
    float _699 = fma(_687, _605, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _701 = _627 * _689;
    float _703 = _661 * _689;
    float _705 = fma(_697, _605, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _711 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[143].x, _701);
    float _713 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[143].y, _703);
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _717 = _715 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _719 = fma(_709, _631, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _721 = fma(_677, _679, _711);
    float _723 = fma(_629, _679, _713);
    float _725 = fma(_717, _631, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _727 = fma(_705, _671, _721);
    float _729 = fma(_699, _671, _723);
    float _731 = fma(_719, _603, _727);
    float _733 = fma(_725, _603, _729);
    float _735 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[147].x, _731);
    float _737 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[147].y, _733);
    float _739 = _735 * _549;
    float _741 = _737 * _551;
    bool _743 = !_567;
    float _761;
    if (!_743)
    {
        float _745 = in.m_68.x;
        float _747 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _749 = _745 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _751 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[11].x, _159);
        float _753 = _751 * _747;
        float _755 = floor(_753);
        float _757 = -_755;
        float _759 = _753 + _757;
        _761 = _759;
        _763 = true;
    }
    else
    {
        float _765 = float(_125);
        float _767 = 1.0 / _765;
        float _769 = _159 * _767;
        _761 = _769;
    }
    _763 = false;
    float _771 = _761;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _775 = _771 + _773;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _779 = _771 + _777;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _783 = _771 + _781;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _785;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _793;
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _799 = _797 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _801 = 1.0 / _787;
    bool _803 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _805 = 1.0 / _791;
    bool _807 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _809 = isnan(_771);
    bool _811 = _807 || _809;
    bool _813 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _815 = _811 || _813;
    float _817 = float(_815);
    float _819 = 1.0 / _795;
    float _821 = _779 * _801;
    bool _823 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _825 = isnan(_771);
    bool _827 = _823 || _825;
    bool _829 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _831 = _827 || _829;
    float _833 = float(_831);
    float _835 = 1.0 / _799;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _839 = _771 + _837;
    float _841 = _839 * _805;
    bool _843 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _845 = isnan(_771);
    bool _847 = _843 || _845;
    bool _849 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _851 = _847 || _849;
    float _853 = float(_851);
    float _855 = _775 * _819;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _857;
    float _861 = -_853;
    float _863 = _861 + 1.0;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _865;
    float _869 = _817 * _863;
    float _871 = _783 * _835;
    bool _873 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _875 = isnan(_771);
    bool _877 = _873 || _875;
    bool _879 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _881 = _877 || _879;
    float _883 = float(_881);
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _885;
    float _889 = -_817;
    float _891 = _889 + 1.0;
    bool _893 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _895 = isnan(_771);
    bool _897 = _893 || _895;
    bool _899 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _901 = _897 || _899;
    float _903 = float(_901);
    float _905 = fma(_867, _855, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _907 = -_883;
    float _909 = _907 + 1.0;
    float _911 = fma(_859, _855, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _913 = fma(_887, _855, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _915 = _883 * _891;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _919 = _917 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _921 = _903 * _909;
    float _923 = -_903;
    float _925 = _923 + 1.0;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _929 = _927 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _933 = _931 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _935 = fma(_919, _871, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _937 = _833 * _925;
    float _939 = fma(_929, _871, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _941 = fma(_933, _871, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _943 = -_833;
    float _945 = _943 + 1.0;
    float _947 = _905 * _937;
    float _949 = _911 * _937;
    float _951 = _913 * _937;
    float _953 = fma(_945, (*spvDescriptorSet0.vp_c9)._m0[107].x, _947);
    float _955 = fma(_945, (*spvDescriptorSet0.vp_c9)._m0[107].y, _949);
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _957;
    float _961 = fma(_945, (*spvDescriptorSet0.vp_c9)._m0[107].z, _951);
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _963;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _967;
    float _971 = fma(_939, _921, _953);
    float _973 = fma(_941, _921, _955);
    float _975 = fma(_935, _921, _961);
    float _977 = fma(_965, _821, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _979 = fma(_959, _821, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _981 = fma(_969, _821, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _985 = _983 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _987 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _989 = _987 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _993 = _991 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _995 = fma(_977, _915, _971);
    float _997 = fma(_985, _841, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _999 = fma(_989, _841, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _1001 = fma(_993, _841, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _1003 = fma(_979, _915, _973);
    float _1005 = fma(_981, _915, _975);
    float _1007 = fma(_997, _869, _995);
    float _1009 = fma(_999, _869, _1003);
    float _1011 = fma(_1001, _869, _1005);
    float _1013 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[111].x, _1007);
    float _1015 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[111].y, _1009);
    float _1017 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[111].z, _1011);
    bool _1019 = !_803;
    int _1021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _1039;
    if (!_1019)
    {
        float _1023 = in.m_68.x;
        float _1025 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1027 = _1023 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1029 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[11].y, _159);
        float _1031 = _1029 * _1025;
        float _1033 = floor(_1031);
        float _1035 = -_1033;
        float _1037 = _1031 + _1035;
        _1039 = _1037;
        _1041 = true;
    }
    else
    {
        float _1043 = float(_125);
        float _1045 = 1.0 / _1043;
        float _1047 = _159 * _1045;
        _1039 = _1047;
    }
    _1041 = false;
    float _1049 = _1039;
    float _1051 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1053 = _1049 + _1051;
    float _1055 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1057 = _1055 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1059 = _1049 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1061 = isnan(_1049);
    bool _1063 = _1059 || _1061;
    bool _1065 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1067 = _1063 || _1065;
    float _1069 = float(_1067);
    float _1071 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1073 = _1071 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1075 = _1049 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1077 = isnan(_1049);
    bool _1079 = _1075 || _1077;
    bool _1081 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1083 = _1079 || _1081;
    float _1085 = float(_1083);
    float _1087 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1089 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1087;
    bool _1091 = _1049 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1093 = isnan(_1049);
    bool _1095 = _1091 || _1093;
    bool _1097 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1099 = _1095 || _1097;
    float _1101 = float(_1099);
    float _1103 = 1.0 / _1057;
    float _1105 = -_1069;
    float _1107 = _1105 + 1.0;
    bool _1109 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1111 = 1.0 / _1073;
    float _1113 = _1089 * _1103;
    float _1115 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1117 = _1115 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1119 = fma(_1113, _1053, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1121 = _1085 * _1107;
    float _1123 = -_1101;
    float _1125 = _1123 + 1.0;
    float _1127 = -_1085;
    float _1129 = _1127 + 1.0;
    float _1131 = _1117 * _1111;
    float _1133 = _1119 * _1121;
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1137 = _1049 + _1135;
    float _1139 = _1069 * _1125;
    float _1141 = _1013 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1143 = fma(_1129, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1133);
    float _1145 = fma(_1131, _1137, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1147 = _1017 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1149 = _1141 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1151 = fma(_1145, _1139, _1143);
    float _1153 = _1015 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1155 = _1147 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1157 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1151);
    float _1159 = _1153 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1161 = _1157 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_70.x = _1149;
    out.m_70.y = _1159;
    out.m_70.z = _1155;
    out.m_70.w = _1161;
    bool _1163 = !_1109;
    float _1181;
    if (!_1163)
    {
        float _1165 = in.m_68.x;
        float _1167 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1169 = _1165 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1171 = fma(_1169, (*spvDescriptorSet0.vp_c9)._m0[11].w, _159);
        float _1173 = _1171 * _1167;
        float _1175 = floor(_1173);
        float _1177 = -_1175;
        float _1179 = _1173 + _1177;
        _1181 = _1179;
        _1183 = true;
    }
    else
    {
        float _1185 = float(_125);
        float _1187 = 1.0 / _1185;
        float _1189 = _159 * _1187;
        _1181 = _1189;
    }
    _1183 = false;
    float _1191 = _1181;
    float _1193 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1195 = _1191 + _1193;
    float _1197 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1199 = _1197 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1201 = _1191 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1203 = isnan(_1191);
    bool _1205 = _1201 || _1203;
    bool _1207 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1209 = _1205 || _1207;
    float _1211 = float(_1209);
    float _1213 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1215 = _1213 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1217 = _1191 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1219 = isnan(_1191);
    bool _1221 = _1217 || _1219;
    bool _1223 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1225 = _1221 || _1223;
    float _1227 = float(_1225);
    float _1229 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1231 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1229;
    bool _1233 = _1191 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1235 = isnan(_1191);
    bool _1237 = _1233 || _1235;
    bool _1239 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1241 = _1237 || _1239;
    float _1243 = float(_1241);
    float _1245 = 1.0 / _1199;
    float _1247 = -_1211;
    float _1249 = _1247 + 1.0;
    bool _1251 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1253 = 1.0 / _1215;
    float _1255 = _1231 * _1245;
    float _1257 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1259 = _1257 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1261 = fma(_1255, _1195, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1263 = _1227 * _1249;
    float _1265 = -_1243;
    float _1267 = _1265 + 1.0;
    float _1269 = -_1227;
    float _1271 = _1269 + 1.0;
    float _1273 = _1259 * _1253;
    float _1275 = _1261 * _1263;
    float _1277 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1279 = _1191 + _1277;
    float _1281 = _1211 * _1267;
    float _1283 = fma(_1271, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1275);
    float _1285 = fma(_1273, _1279, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1287 = fma(_1285, _1281, _1283);
    float _1289 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1291 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1295 = fma(_1243, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1287);
    float _1297 = _1289 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1299 = _1291 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1301 = _1293 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1303 = _1295 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_72.x = _1297;
    out.m_72.y = _1299;
    out.m_72.z = _1301;
    out.m_72.w = _1303;
    bool _1305 = !_1251;
    float _1307 = _1303;
    float _1309 = _1301;
    float _1311 = (*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1313 = _1295;
    float _1315 = _1275;
    bool _1317 = _1251;
    float _1335;
    float _1337;
    float _1339;
    if (!_1305)
    {
        float _1319 = in.m_68.x;
        float _1321 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1323 = _1319 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1325 = fma(_1323, (*spvDescriptorSet0.vp_c9)._m0[14].x, _159);
        float _1327 = _1325 * _1321;
        float _1329 = floor(_1327);
        float _1331 = -_1329;
        float _1333 = _1327 + _1331;
        _1335 = _1321;
        _1337 = _1327;
        _1339 = _1333;
        _1341 = true;
    }
    else
    {
        float _1343 = float(_125);
        float _1345 = 1.0 / _1343;
        float _1347 = _159 * _1345;
        _1335 = _1343;
        _1337 = _1345;
        _1339 = _1347;
    }
    _1341 = false;
    float _1349 = _1335;
    float _1351 = _1337;
    float _1353 = _1339;
    float _1355 = in.m_68.w;
    int _1357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1359 = _1357 != 0;
    int _1361 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1363 = _1361 != 0;
    int _1365 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _1367 = _1365 != 0;
    int _1369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1371 = _1369 != 0;
    int _1373 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1375 = _1373 != 0;
    float _1377 = _1349;
    int _1379 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_1359)
    {
        float _1381 = in.m_68.x;
        _1377 = _1381;
    }
    float _1383 = _1377;
    float _1385 = 0.0;
    if (!_1359)
    {
        _1385 = _265;
    }
    float _1387 = _1385;
    float _1389 = _1351;
    float _1391 = _1387;
    if (_1363)
    {
        float _1393 = in.m_68.z;
        _1389 = _1393;
    }
    float _1395 = _1389;
    if (!_1363)
    {
        _1307 = _261;
    }
    float _1397 = _1307;
    float _1399 = 0.0;
    float _1401 = _1397;
    if (_1375)
    {
        _1399 = 1.0;
    }
    float _1403 = _1399;
    float _1405 = _1403;
    if (!_1367)
    {
        _1309 = _265;
    }
    float _1407 = _1309;
    float _1409 = _1293;
    float _1411 = _1407;
    if (_1367)
    {
        float _1413 = in.m_68.w;
        _1409 = _1413;
    }
    float _1415 = _1409;
    float _1417 = 0.0;
    if (_1375)
    {
        _1417 = 1.0;
    }
    float _1419 = _1417;
    float _1421 = 0.0;
    float _1423 = _1419;
    if (_1375)
    {
        _1421 = 1.0;
    }
    float _1425 = _1421;
    int _1427 = 0;
    float _1429 = _1425;
    if (_1375)
    {
        _1427 = 0;
    }
    int _1431 = _1427;
    int _1433 = _1431;
    if (_1375)
    {
        _1379 = 0;
    }
    int _1435 = _1379;
    float _1437 = _1383;
    int _1439 = _1435;
    if (_1359)
    {
        float _1441 = _1383 * 3.1415927410125732421875;
        _1437 = _1441;
    }
    float _1443 = _1437;
    float _1445 = _1443;
    if (_1359)
    {
        float _1447 = _1443 * 0.15915493667125701904296875;
        _1311 = _1447;
    }
    float _1449 = _1311;
    if (_1363)
    {
        float _1451 = _1395 * 3.1415927410125732421875;
        _1445 = _1451;
    }
    float _1453 = _1445;
    if (_1367)
    {
        float _1455 = _1415 * 3.1415927410125732421875;
        _1313 = _1455;
    }
    float _1457 = _1313;
    float _1459 = _1457;
    if (_1363)
    {
        float _1461 = _1453 * 0.15915493667125701904296875;
        _1315 = _1461;
    }
    float _1463 = _1315;
    float _1465 = _1449;
    if (_1359)
    {
        float _1467 = _1449 * 6.283185482025146484375;
        float _1469 = sin(_1467);
        _1465 = _1469;
    }
    float _1471 = _1465;
    float _1473 = _1453;
    float _1475 = _1395;
    float _1477 = _1415;
    if (_1375)
    {
        float _1479 = in.m_68.x;
        float _1481 = in.m_68.y;
        float _1483 = in.m_68.z;
        _1473 = _1479;
        _1475 = _1481;
        _1477 = _1483;
    }
    float _1485 = _1473;
    float _1487 = _1475;
    float _1489 = _1477;
    if (_1367)
    {
        float _1491 = _1457 * 0.15915493667125701904296875;
        _1459 = _1491;
    }
    float _1493 = _1459;
    float _1495 = _1493;
    if (_1367)
    {
        float _1497 = _1493 * 6.283185482025146484375;
        float _1499 = sin(_1497);
        _1495 = _1499;
    }
    float _1501 = _1495;
    float _1503 = _1463;
    if (_1363)
    {
        float _1505 = _1463 * 6.283185482025146484375;
        float _1507 = sin(_1505);
        _1503 = _1507;
    }
    float _1509 = _1503;
    float _1511 = _1471;
    if (_1359)
    {
        bool _1513 = _1471 > 0.5;
        _1317 = _1513;
    }
    bool _1515 = _1317;
    bool _1517 = _1515;
    if (_1359)
    {
        float _1519 = -_265;
        float _1521 = _1515 ? _1519 : _265;
        _1391 = _1521;
    }
    float _1523 = _1391;
    float _1525 = _1487;
    float _1527 = _1489;
    float _1529 = _1485;
    if (_1375)
    {
        _1511 = _1485;
    }
    float _1531 = _1511;
    float _1533 = _1501;
    float _1535 = _1531;
    if (_1367)
    {
        bool _1537 = _1501 > 0.5;
        _1517 = _1537;
    }
    bool _1539 = _1517;
    int _1541 = int(_1539);
    int _1543 = _1367 ? 2 : 0;
    int _1545 = _1541 | _1543;
    int _1547 = _193 ? 4 : 0;
    int _1549 = _1545 | _1547;
    int _1551 = _1363 ? 8 : 0;
    int _1553 = _1549 | _1551;
    int _1555 = _1375 ? 16 : 0;
    int _1557 = _1553 | _1555;
    int _1559 = _1371 ? 32 : 0;
    int _1561 = _1557 | _1559;
    int _1563 = false ? 64 : 0;
    int _1565 = _1561 | _1563;
    int _1567 = _1565 & 32;
    if (_1375)
    {
        _1533 = _1531;
    }
    float _1569 = _1533;
    float _1571 = _1569;
    if (_1363)
    {
        bool _1573 = _1509 > 0.5;
        _275 = _1573;
    }
    bool _1575 = _275;
    int _1577 = 0;
    if (_1375)
    {
        _1577 = as_type<int>(_1531);
    }
    int _1579 = _1577;
    int _1581 = _1579;
    if (_1375)
    {
        _1021 = as_type<int>(_1487);
    }
    int _1583 = _1021;
    int _1585 = 0;
    int _1587 = _1583;
    if (_1375)
    {
        _1585 = as_type<int>(_1489);
    }
    int _1589 = _1585;
    int _1591 = _1589;
    if (!_1375)
    {
        float _1593 = in.m_68.x;
        float _1595 = in.m_68.y;
        float _1597 = in.m_68.z;
        float _1599 = _1593 * 3.1415927410125732421875;
        float _1601 = _1599 * 0.15915493667125701904296875;
        float _1603 = _1595 * 3.1415927410125732421875;
        float _1605 = _1603 * 0.15915493667125701904296875;
        float _1607 = _1597 * 3.1415927410125732421875;
        float _1609 = _1601 * 6.283185482025146484375;
        float _1611 = sin(_1609);
        float _1613 = _1607 * 0.15915493667125701904296875;
        float _1615 = _1605 * 6.283185482025146484375;
        float _1617 = sin(_1615);
        float _1619 = _1613 * 6.283185482025146484375;
        float _1621 = sin(_1619);
        _1525 = _1595;
        _1571 = _1597;
        _1429 = 5.839270114898681640625;
        _1527 = _1597;
        _1529 = _1593;
        _1405 = 7.345489978790283203125;
        _1535 = _1595;
        _1423 = 1.2345600128173828125;
        _1439 = 2;
        _1433 = 1;
        _1587 = as_type<int>(_1617);
        _1581 = as_type<int>(_1611);
        _1591 = as_type<int>(_1621);
    }
    float _1623 = _1525;
    float _1625 = _1571;
    float _1627 = _1429;
    float _1629 = _1527;
    float _1631 = _1529;
    float _1633 = _1405;
    float _1635 = _1535;
    float _1637 = _1423;
    int _1639 = _1439;
    int _1641 = _1433;
    int _1643 = _1587;
    int _1645 = _1581;
    int _1647 = _1591;
    float _1649 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1651 = int(_1649);
    int _1653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1655 = _1653 != 0;
    bool _1657 = _1623 > 0.5;
    float _1659 = _1625 * _1627;
    float _1661 = _1623 + _1629;
    if (_1363)
    {
        float _1663 = -_261;
        float _1665 = _1575 ? _1663 : _261;
        _1401 = _1665;
    }
    float _1667 = _1401;
    float _1669 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1671 = int(_1669);
    if (_1367)
    {
        float _1673 = -_265;
        float _1675 = _1539 ? _1673 : _265;
        _1411 = _1675;
    }
    float _1677 = _1411;
    float _1679 = _1623 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1681 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1683 = _1681 != 0;
    int _1685 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1687 = _1685 != 0;
    int _1689 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1691 = _1689 != 0;
    float _1693 = _1661 + (-1.0);
    int _1695 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1697 = _1695 != 0;
    int _1699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1701 = _1699 != 0;
    bool _1703 = _1629 > 0.5;
    float _1705 = float(_1651);
    float _1707 = -_261;
    int _1709 = _1657 ? as_type<int>(_1707) : as_type<int>(_261);
    bool _1711 = !_1697;
    int _1713 = _1711 ? 0 : 1;
    float _1715 = 1.0 / _1705;
    float _1717 = float(uint(_1671));
    int _1719 = ~_1671;
    int _1721 = _1719 + 1;
    float _1723 = -_265;
    int _1725 = _1703 ? as_type<int>(_1723) : as_type<int>(_265);
    bool _1727 = _1355 > 0.5;
    float _1729 = 1.0 / _1717;
    int _1731 = int(_1727);
    int _1733 = _1703 ? 2 : 0;
    int _1735 = _1731 | _1733;
    int _1737 = _1575 ? 4 : 0;
    int _1739 = _1735 | _1737;
    int _1741 = _1683 ? 8 : 0;
    int _1743 = _1739 | _1741;
    int _1745 = _1687 ? 16 : 0;
    int _1747 = _1743 | _1745;
    int _1749 = _1691 ? 32 : 0;
    int _1751 = _1747 | _1749;
    int _1753 = _1657 ? 64 : 0;
    int _1755 = _1751 | _1753;
    int _1757 = _1755 & 64;
    bool _1759 = !_1687;
    float _1761 = _1759 ? _261 : as_type<float>(_1709);
    bool _1763 = !_1691;
    float _1765 = _1763 ? _265 : as_type<float>(_1725);
    float _1767 = -_265;
    int _1769 = _1727 ? as_type<int>(_1767) : as_type<int>(_265);
    float _1771 = _159 * _1715;
    int _1773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1775 = _1773 != 0;
    int _1777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1779 = _1777 != 0;
    int _1781 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1783 = _1781 != 0;
    int _1785 = int(_1727);
    int _1787 = _1703 ? 2 : 0;
    int _1789 = _1785 | _1787;
    int _1791 = _1575 ? 4 : 0;
    int _1793 = _1789 | _1791;
    int _1795 = _1683 ? 8 : 0;
    int _1797 = _1793 | _1795;
    int _1799 = _1775 ? 16 : 0;
    int _1801 = _1797 | _1799;
    int _1803 = _1779 ? 32 : 0;
    int _1805 = _1801 | _1803;
    int _1807 = _1783 ? 64 : 0;
    int _1809 = _1805 | _1807;
    int _1811 = _1809 & 2;
    float _1813 = trunc(_1771);
    int _1815 = int(_1813);
    bool _1817 = !_1683;
    float _1819 = _1817 ? _265 : as_type<float>(_1769);
    int _1821 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1823 = _1821 != 0;
    int _1825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1827 = _1825 != 0;
    int _1829 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1831 = _1829 != 0;
    int _1833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1835 = _1833 != 0;
    int _1837 = as_type<int>(_1729) + (-2);
    float _1839 = float(_125);
    int _1841 = ~_1671;
    int _1843 = _1841 + 1;
    bool _1845 = !_1827;
    int _1847 = _1845 ? 0 : 1;
    float _1849 = 1.0 / _1839;
    float _1851 = float(_1671);
    bool _1853 = !_1775;
    int _1855 = _1853 ? 0 : 1;
    float _1857 = float(uint(_1815));
    bool _1859 = _1671 == 0;
    bool _1861 = !_1779;
    int _1863 = _1861 ? 0 : 1;
    float _1865 = as_type<float>(_1837) * _1857;
    int _1867 = abs(_1847);
    int _1869 = abs(_1863);
    bool _1871 = !_1783;
    int _1873 = _1871 ? 0 : 1;
    float _1875 = trunc(_1865);
    float _1877 = precise::max(_1875, 0.0);
    uint _1880 = uint(_1877);
    bool _1882 = _1353 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1884 = isnan(_1353);
    bool _1886 = _1882 || _1884;
    bool _1888 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1890 = _1886 || _1888;
    float _1892 = float(_1890);
    float _1894 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1896 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1894;
    float _1898 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1900 = _1898 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1902 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1904 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1902;
    float _1906 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _1908 = _1721 * int(_1880);
    int _1910 = _1908 + _1815;
    float _1912 = float(uint(_1910));
    float _1914 = as_type<float>(_1837) * _1912;
    float _1916 = trunc(_1914);
    float _1918 = precise::max(_1916, 0.0);
    uint _1920 = uint(_1918);
    int _1922 = int(_1880) + int(_1920);
    float _1924 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1926 = int(_1924);
    int _1928 = _1843 * _1922;
    int _1930 = _1928 + _1815;
    bool _1932 = uint(_1930) >= uint(_1671);
    float _1934 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1936 = int(_1934);
    bool _1938 = !_1932;
    int _1940 = _1938 ? 0 : (-1);
    float _1942 = float(uint(_1926));
    int _1944 = ~_1926;
    int _1946 = _1944 + 1;
    float _1948 = 1.0 / _1942;
    int _1950 = ~_1922;
    int _1952 = _1950 + _1940;
    int _1954 = _1952 + 1;
    bool _1956 = _1926 == 0;
    float _1958 = float(_1936);
    int _1960 = ~_1926;
    int _1962 = _1960 + 1;
    float _1964 = 1.0 / _1958;
    int _1966 = as_type<int>(_1948) + (-2);
    float _1968 = _159 * _1964;
    float _1970 = trunc(_1968);
    int _1972 = int(_1970);
    float _1974 = float(uint(_1972));
    float _1976 = as_type<float>(_1966) * _1974;
    float _1978 = trunc(_1976);
    float _1980 = precise::max(_1978, 0.0);
    uint _1982 = uint(_1980);
    int _1984 = _1946 * int(_1982);
    int _1986 = _1984 + _1972;
    float _1988 = float(uint(_1986));
    float _1990 = _1631 * _1633;
    float _1992 = as_type<float>(_1966) * _1988;
    float _1994 = trunc(_1992);
    float _1996 = precise::max(_1994, 0.0);
    uint _1998 = uint(_1996);
    int _2000 = int(_1982) + int(_1998);
    float _2002 = _1635 * _1637;
    float _2004 = float(_1926);
    bool _2006 = !_1655;
    int _2008 = _2006 ? 0 : 1;
    float _2010 = _1635 * _1633;
    int _2012 = _1962 * _2000;
    int _2014 = _2012 + _1972;
    float _2016 = floor(_2002);
    int _2018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2020 = _2018 != 0;
    int _2022 = abs(_2008);
    bool _2024 = uint(_2014) >= uint(_1926);
    bool _2026 = !_2020;
    int _2028 = _2026 ? 0 : 1;
    float _2030 = floor(_1990);
    bool _2032 = !_2024;
    int _2034 = _2032 ? 0 : (-1);
    int _2036 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2038 = _2036 != 0;
    int _2040 = ~_2000;
    int _2042 = _2040 + _2034;
    int _2044 = _2042 + 1;
    bool _2046 = !_2038;
    int _2048 = _2046 ? 0 : 1;
    float _2050 = -_2016;
    float _2052 = _2002 + _2050;
    int _2054 = _1671 * _1954;
    int _2056 = _2054 + _1815;
    bool _2058 = !_1823;
    int _2060 = _2058 ? 0 : 1;
    int _2062 = _1926 * _2044;
    int _2064 = _2062 + _1972;
    int _2066 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2068 = _2066 != 0;
    bool _2070 = !_1859;
    int _2072 = _2070 ? _2056 : (-1);
    float _2074 = -_2030;
    float _2076 = _1990 + _2074;
    float _2078 = float(_1972);
    bool _2080 = !_1956;
    int _2082 = _2080 ? _2064 : (-1);
    float _2084 = _2076 * _1851;
    float _2086 = float(_1815);
    bool _2088 = _2078 >= _2004;
    bool _2090 = isnan(_2078);
    bool _2092 = _2088 || _2090;
    bool _2094 = isnan(_2004);
    bool _2096 = _2092 || _2094;
    float _2098 = float(_2096);
    float _2100 = trunc(_2084);
    int _2102 = int(_2100);
    bool _2104 = _2086 >= _1851;
    bool _2106 = isnan(_2086);
    bool _2108 = _2104 || _2106;
    bool _2110 = isnan(_1851);
    bool _2112 = _2108 || _2110;
    float _2114 = float(_2112);
    float _2116 = _159 * _1849;
    float _2118 = _2052 * _2004;
    int _2120 = abs(_2060);
    float _2122 = _2116 * _1851;
    float _2124 = _2116 * _2004;
    float _2126 = trunc(_2114);
    int _2128 = int(_2126);
    float _2130 = trunc(_2098);
    int _2132 = int(_2130);
    int _2134 = _2102 * _2022;
    int _2136 = _2134 + _1815;
    int _2138 = _1671 + (-1);
    bool _2140 = !_1831;
    int _2142 = _2140 ? 0 : 1;
    int _2144 = ~_2128;
    int _2146 = _2144 + 1;
    int _2148 = _2146 + 1;
    float _2150 = trunc(_2122);
    int _2152 = int(_2150);
    int _2154 = abs(_2142);
    int _2156 = _2072 * _2148;
    int _2158 = _1926 + (-1);
    int _2160 = ~_2132;
    int _2162 = _2160 + 1;
    int _2164 = _2162 + 1;
    float _2166 = trunc(_2118);
    int _2168 = int(_2166);
    int _2170 = _2128 * _2138;
    int _2172 = _2170 + _2156;
    int _2174 = abs(_2028);
    int _2176 = _2082 * _2164;
    int _2178 = abs(_1855);
    float _2180 = trunc(_2124);
    int _2182 = int(_2180);
    int _2184 = _2132 * _2158;
    int _2186 = _2184 + _2176;
    int _2188 = _2172 * _1869;
    int _2190 = abs(_1713);
    int _2192 = _2168 * _2174;
    int _2194 = _2192 + _1972;
    int _2196 = _2152 * _2178;
    int _2198 = _2196 + _2188;
    int _2200 = abs(_1873);
    int _2202 = _2186 * _1867;
    bool _2204 = !_1835;
    int _2206 = _2204 ? 0 : 1;
    int _2208 = _2182 * _2120;
    int _2210 = _2208 + _2202;
    int _2212 = abs(_2206);
    int _2214 = _2136 * _2200;
    int _2216 = _2214 + _2198;
    int _2218 = _2194 * _2154;
    int _2220 = _2218 + _2210;
    int _2222 = _2102 * _2190;
    int _2224 = _2222 + _2216;
    int _2226 = ~_1926;
    int _2228 = _2226 + 1;
    float _2230 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _2232 = int(_2230);
    int _2234 = _2168 * _2212;
    int _2236 = _2234 + _2220;
    float _2238 = float(uint(_2224));
    int _2240 = ~_1671;
    int _2242 = _2240 + 1;
    float _2244 = float(uint(_2236));
    float _2246 = as_type<float>(_1837) * _2238;
    float _2248 = as_type<float>(_1966) * _2244;
    float _2250 = trunc(_2246);
    float _2252 = precise::max(_2250, 0.0);
    uint _2254 = uint(_2252);
    float _2256 = float(_2232);
    float _2258 = trunc(_2248);
    float _2260 = precise::max(_2258, 0.0);
    uint _2262 = uint(_2260);
    int _2264 = _2242 * int(_2254);
    int _2266 = _2264 + _2224;
    float _2268 = 1.0 / _2256;
    float _2270 = float(uint(_2266));
    int _2272 = _2228 * int(_2262);
    int _2274 = _2272 + _2236;
    float _2276 = as_type<float>(_1837) * _2270;
    float _2278 = float(uint(_2274));
    float _2280 = trunc(_2276);
    float _2282 = precise::max(_2280, 0.0);
    uint _2284 = uint(_2282);
    int _2286 = ~_1671;
    int _2288 = _2286 + 1;
    float _2290 = _159 * _2268;
    float _2292 = as_type<float>(_1966) * _2278;
    float _2294 = trunc(_2290);
    int _2296 = int(_2294);
    int _2298 = int(_2254) + int(_2284);
    float _2300 = trunc(_2292);
    float _2302 = precise::max(_2300, 0.0);
    uint _2304 = uint(_2302);
    int _2306 = ~_1926;
    int _2308 = _2306 + 1;
    int _2310 = _2288 * _2298;
    int _2312 = _2310 + _2224;
    float _2314 = float(uint(_2296));
    bool _2316 = uint(_2312) >= uint(_1671);
    bool _2318 = !_2316;
    int _2320 = _2318 ? 0 : (-1);
    int _2322 = int(_2262) + int(_2304);
    int _2324 = ~_2298;
    int _2326 = _2324 + _2320;
    int _2328 = _2326 + 1;
    int _2330 = _2308 * _2322;
    int _2332 = _2330 + _2236;
    int _2334 = _1671 * _2328;
    int _2336 = _2334 + _2224;
    float _2338 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _2340 = int(_2338);
    bool _2342 = uint(_2332) >= uint(_1926);
    bool _2344 = !_1859;
    int _2346 = _2344 ? _2336 : (-1);
    bool _2348 = !_2342;
    int _2350 = _2348 ? 0 : (-1);
    int _2352 = _2346 & 3;
    bool _2354 = _2352 != 0;
    int _2356 = ~_2322;
    int _2358 = _2356 + _2350;
    int _2360 = _2358 + 1;
    int _2362 = _2346 & 3;
    bool _2364 = _2362 != 0;
    int _2366 = _1926 * _2360;
    int _2368 = _2366 + _2236;
    int _2370 = _2354 ? 0 : 1;
    float _2372 = float(uint(_2340));
    bool _2374 = !_1956;
    int _2376 = _2374 ? _2368 : (-1);
    float _2378 = 1.0 / _2372;
    int _2380 = int(_2354);
    int _2382 = _2364 ? 2 : 0;
    int _2384 = _2380 | _2382;
    int _2386 = _1831 ? 4 : 0;
    int _2388 = _2384 | _2386;
    int _2390 = _1835 ? 8 : 0;
    int _2392 = _2388 | _2390;
    int _2394 = _1859 ? 16 : 0;
    int _2396 = _2392 | _2394;
    int _2398 = _1956 ? 32 : 0;
    int _2400 = _2396 | _2398;
    int _2402 = _1783 ? 64 : 0;
    int _2404 = _2400 | _2402;
    int _2406 = _2404 & 2;
    int _2408 = _2376 & 3;
    bool _2410 = _2408 != 0;
    int _2412 = _2376 & 3;
    bool _2414 = _2412 != 0;
    int _2416 = _2410 ? 0 : 1;
    bool _2418 = uint(_2362) > 1u;
    int _2420 = ~_2370;
    int _2422 = _2420 + 1;
    int _2424 = _2422 + 1;
    int _2426 = ~_2340;
    int _2428 = _2426 + 1;
    int _2430 = int(_2418);
    int _2432 = _2414 ? 2 : 0;
    int _2434 = _2430 | _2432;
    int _2436 = _1831 ? 4 : 0;
    int _2438 = _2434 | _2436;
    int _2440 = _1835 ? 8 : 0;
    int _2442 = _2438 | _2440;
    int _2444 = _1859 ? 16 : 0;
    int _2446 = _2442 | _2444;
    int _2448 = _1956 ? 32 : 0;
    int _2450 = _2446 | _2448;
    int _2452 = _1783 ? 64 : 0;
    int _2454 = _2450 | _2452;
    int _2456 = _2454 & 2;
    int _2458 = as_type<int>(_2378) + (-2);
    int _2460 = _2424;
    float _2462 = as_type<float>(_2340);
    if (!_2418)
    {
        int _2464 = ~_2370;
        int _2466 = _2464 + 1;
        _2460 = _2466;
    }
    int _2468 = _2460;
    float _2470 = as_type<float>(_2458) * _2314;
    bool _2472 = uint(_2412) > 1u;
    int _2474 = ~_2416;
    int _2476 = _2474 + 1;
    int _2478 = _2476 + 1;
    float _2480 = trunc(_2470);
    float _2482 = precise::max(_2480, 0.0);
    uint _2484 = uint(_2482);
    int _2486 = _2478;
    if (!_2472)
    {
        int _2488 = ~_2416;
        int _2490 = _2488 + 1;
        _2486 = _2490;
    }
    int _2492 = _2486;
    int _2494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2496 = _2494 != 0;
    int _2498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2500 = _2498 != 0;
    int _2502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2504 = _2502 != 0;
    int _2506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2508 = _2506 != 0;
    bool _2510 = !_2496;
    int _2512 = _2510 ? 0 : 1;
    bool _2514 = !_2504;
    int _2516 = _2514 ? 0 : 1;
    bool _2518 = _1757 != 0;
    int _2520 = ~_2340;
    int _2522 = _2520 + 1;
    int _2524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2526 = _2524 != 0;
    int _2528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2530 = _2528 != 0;
    int _2532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2534 = _2532 != 0;
    int _2536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2538 = _2536 != 0;
    bool _2540 = !_2500;
    int _2542 = _2540 ? 0 : 1;
    int _2544 = _2522 * int(_2484);
    int _2546 = _2544 + _2296;
    bool _2548 = _2340 == 0;
    bool _2550 = !_2526;
    int _2552 = _2550 ? 0 : 1;
    float _2554 = float(uint(_2546));
    float _2556 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _2558 = int(_2556);
    bool _2560 = !_2508;
    int _2562 = _2560 ? 0 : 1;
    float _2564 = as_type<float>(_2458) * _2554;
    int _2566 = abs(_2512);
    bool _2568 = !_2538;
    int _2570 = _2568 ? 0 : 1;
    bool _2572 = !_2530;
    int _2574 = _2572 ? 0 : 1;
    float _2576 = trunc(_2564);
    float _2578 = precise::max(_2576, 0.0);
    uint _2580 = uint(_2578);
    bool _2582 = !_2534;
    int _2584 = _2582 ? 0 : 1;
    bool _2586 = _1926 == 0;
    int _2588 = ~_2558;
    int _2590 = _2588 + 1;
    bool _2592 = _2558 == 0;
    int _2594 = int(_2484) + int(_2580);
    float _2596 = float(uint(_2558));
    int _2598 = _2428 * _2594;
    int _2600 = _2598 + _2296;
    bool _2602 = uint(_2600) >= uint(_2340);
    float _2604 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _2606 = int(_2604);
    bool _2608 = !_2602;
    int _2610 = _2608 ? 0 : (-1);
    int _2612 = ~_2594;
    int _2614 = _2612 + _2610;
    int _2616 = _2614 + 1;
    float _2618 = float(_2606);
    float _2620 = 1.0 / _2596;
    float _2622 = 1.0 / _2618;
    int _2624 = ~_2558;
    int _2626 = _2624 + 1;
    int _2628 = as_type<int>(_2620) + (-2);
    float _2630 = _159 * _2622;
    float _2632 = trunc(_2630);
    int _2634 = int(_2632);
    float _2636 = float(uint(_2634));
    float _2638 = as_type<float>(_2628) * _2636;
    float _2640 = trunc(_2638);
    float _2642 = precise::max(_2640, 0.0);
    uint _2644 = uint(_2642);
    int _2646 = _2590 * int(_2644);
    int _2648 = _2646 + _2634;
    float _2650 = float(_2296);
    float _2652 = float(uint(_2648));
    float _2654 = as_type<float>(_2628) * _2652;
    float _2656 = trunc(_2654);
    float _2658 = precise::max(_2656, 0.0);
    uint _2660 = uint(_2658);
    int _2662 = int(_2644) + int(_2660);
    float _2664 = floor(_1659);
    int _2666 = _2626 * _2662;
    int _2668 = _2666 + _2634;
    bool _2670 = uint(_2668) >= uint(_2558);
    float _2672 = float(_2340);
    bool _2674 = !_2670;
    int _2676 = _2674 ? 0 : (-1);
    bool _2678 = _2650 >= _2672;
    bool _2680 = isnan(_2650);
    bool _2682 = _2678 || _2680;
    bool _2684 = isnan(_2672);
    bool _2686 = _2682 || _2684;
    float _2688 = float(_2686);
    float _2690 = -_2664;
    float _2692 = _1659 + _2690;
    int _2694 = _2340 + (-1);
    int _2696 = ~_2662;
    int _2698 = _2696 + _2676;
    int _2700 = _2698 + 1;
    float _2702 = trunc(_2688);
    int _2704 = int(_2702);
    float _2706 = _2692 * _2672;
    int _2708 = _2340 * _2616;
    int _2710 = _2708 + _2296;
    float _2712 = _2116 * _2672;
    bool _2714 = !_2548;
    int _2716 = _2714 ? _2710 : (-1);
    float _2718 = trunc(_2706);
    int _2720 = int(_2718);
    int _2722 = ~_2704;
    int _2724 = _2722 + 1;
    int _2726 = _2724 + 1;
    float _2728 = trunc(_2712);
    int _2730 = int(_2728);
    int _2732 = _2716 * _2726;
    int _2734 = abs(_2516);
    int _2736 = abs(_2048);
    int _2738 = _2704 * _2694;
    int _2740 = _2738 + _2732;
    int _2742 = abs(_2542);
    bool _2744 = !_2068;
    int _2746 = _2744 ? 0 : 1;
    bool _2748 = _1639 != 2;
    int _2750 = abs(_2562);
    int _2752 = _2720 * _2736;
    int _2754 = _2752 + _2296;
    int _2756 = _2740 * _2734;
    int _2758 = _2730 * _2742;
    int _2760 = _2758 + _2756;
    int _2762 = ~_2340;
    int _2764 = _2762 + 1;
    int _2766 = _2754 * _2750;
    int _2768 = _2766 + _2760;
    int _2770 = ~_2340;
    int _2772 = _2770 + 1;
    int _2774 = _2720 * _2566;
    int _2776 = _2774 + _2768;
    float _2778 = float(uint(_2776));
    float _2780 = as_type<float>(_2458) * _2778;
    float _2782 = trunc(_2780);
    float _2784 = precise::max(_2782, 0.0);
    uint _2786 = uint(_2784);
    float _2788 = float(_2558);
    float _2790 = _2116 * _2788;
    int _2792 = _2772 * int(_2786);
    int _2794 = _2792 + _2776;
    float _2796 = trunc(_2790);
    int _2798 = int(_2796);
    float _2800 = float(uint(_2794));
    float _2802 = float(_2634);
    float _2804 = as_type<float>(_2458) * _2800;
    bool _2806 = _2802 >= _2788;
    bool _2808 = isnan(_2802);
    bool _2810 = _2806 || _2808;
    bool _2812 = isnan(_2788);
    bool _2814 = _2810 || _2812;
    float _2816 = float(_2814);
    float _2818 = trunc(_2804);
    float _2820 = precise::max(_2818, 0.0);
    uint _2822 = uint(_2820);
    float _2824 = trunc(_2816);
    int _2826 = int(_2824);
    int _2828 = int(_2786) + int(_2822);
    float _2830 = floor(_2010);
    int _2832 = _2764 * _2828;
    int _2834 = _2832 + _2776;
    bool _2836 = uint(_2834) >= uint(_2340);
    bool _2838 = !_2836;
    int _2840 = _2838 ? 0 : (-1);
    float _2842 = -_2830;
    float _2844 = _2010 + _2842;
    int _2846 = _2558 + (-1);
    int _2848 = ~_2828;
    int _2850 = _2848 + _2840;
    int _2852 = _2850 + 1;
    float _2854 = _2844 * _2788;
    int _2856 = _2558 * _2700;
    int _2858 = _2856 + _2634;
    int _2860 = ~_2826;
    int _2862 = _2860 + 1;
    int _2864 = _2862 + 1;
    int _2866 = _2340 * _2852;
    int _2868 = _2866 + _2776;
    int _2870 = ~_1926;
    int _2872 = _2870 + 1;
    float _2874 = trunc(_2854);
    int _2876 = int(_2874);
    bool _2878 = !_2592;
    int _2880 = _2878 ? _2858 : (-1);
    bool _2882 = !_2548;
    int _2884 = _2882 ? _2868 : (-1);
    int _2886 = _2880 * _2864;
    int _2888 = abs(_2574);
    int _2890 = abs(_2746);
    int _2892 = _2826 * _2846;
    int _2894 = _2892 + _2886;
    int _2896 = abs(_2552);
    int _2898 = abs(_2584);
    int _2900 = _2894 * _2888;
    int _2902 = _2876 * _2890;
    int _2904 = _2902 + _2634;
    int _2906 = abs(_2570);
    int _2908 = _2798 * _2896;
    int _2910 = _2908 + _2900;
    int _2912 = _2884 & 3;
    bool _2914 = _2912 != 0;
    float _2916 = float(uint(_2136));
    int _2918 = _2904 * _2898;
    int _2920 = _2918 + _2910;
    int _2922 = ~_2558;
    int _2924 = _2922 + 1;
    int _2926 = _2876 * _2906;
    int _2928 = _2926 + _2920;
    int _2930 = ~_2558;
    int _2932 = _2930 + 1;
    float _2934 = as_type<float>(_1837) * _2916;
    float _2936 = float(uint(_2928));
    float _2938 = trunc(_2934);
    float _2940 = precise::max(_2938, 0.0);
    uint _2942 = uint(_2940);
    float _2944 = as_type<float>(_2628) * _2936;
    float _2946 = trunc(_2944);
    float _2948 = precise::max(_2946, 0.0);
    uint _2950 = uint(_2948);
    int _2952 = _2924 * int(_2950);
    int _2954 = _2952 + _2928;
    float _2956 = float(uint(_2954));
    float _2958 = as_type<float>(_2628) * _2956;
    float _2960 = trunc(_2958);
    float _2962 = precise::max(_2960, 0.0);
    uint _2964 = uint(_2962);
    int _2966 = int(_2950) + int(_2964);
    int _2968 = _2932 * _2966;
    int _2970 = _2968 + _2928;
    bool _2972 = uint(_2970) >= uint(_2558);
    bool _2974 = !_2972;
    int _2976 = _2974 ? 0 : (-1);
    int _2978 = _2884 & 3;
    bool _2980 = _2978 != 0;
    int _2982 = ~_2966;
    int _2984 = _2982 + _2976;
    int _2986 = _2984 + 1;
    int _2988 = _2980 ? 0 : 1;
    int _2990 = ~_1926;
    int _2992 = _2990 + 1;
    int _2994 = _2558 * _2986;
    int _2996 = _2994 + _2928;
    int _2998 = ~_2988;
    int _3000 = _2998 + 1;
    int _3002 = _3000 + 1;
    bool _3004 = !_2592;
    int _3006 = _3004 ? _2996 : (-1);
    int _3008 = _3006 & 3;
    bool _3010 = _3008 != 0;
    int _3012 = _3010 ? 0 : 1;
    bool _3014 = uint(_2912) > 1u;
    int _3016 = ~_3012;
    int _3018 = _3016 + 1;
    int _3020 = _3018 + 1;
    int _3022 = _3002;
    int _3024 = _3020;
    float _3026 = as_type<float>(_2558);
    if (!_3014)
    {
        int _3028 = ~_2988;
        int _3030 = _3028 + 1;
        _3022 = _3030;
    }
    int _3032 = _3022;
    int _3034 = _3006 & 3;
    bool _3036 = _3034 != 0;
    bool _3038 = uint(_3034) > 1u;
    if (!_3038)
    {
        int _3040 = ~_3012;
        int _3042 = _3040 + 1;
        _3024 = _3042;
    }
    int _3044 = _3024;
    bool _3046 = uint(_2362) >= 2u;
    int _3048 = _3046 ? 0 : 1;
    bool _3050 = uint(_2412) >= 2u;
    int _3052 = ~_3048;
    int _3054 = _3052 + 1;
    int _3056 = _3054 + 1;
    int _3058 = _3050 ? 0 : 1;
    bool _3060 = _2362 != 3;
    int _3062 = ~_3058;
    int _3064 = _3062 + 1;
    int _3066 = _3064 + 1;
    int _3068 = _3056;
    int _3070 = _3066;
    if (_3060)
    {
        int _3072 = ~_3048;
        int _3074 = _3072 + 1;
        _3068 = _3074;
    }
    int _3076 = _3068;
    bool _3078 = _2412 != 3;
    if (_3078)
    {
        int _3080 = ~_3058;
        int _3082 = _3080 + 1;
        _3070 = _3082;
    }
    int _3084 = _3070;
    bool _3086 = uint(_2912) >= 2u;
    int _3088 = abs(_3084);
    int _3090 = _3086 ? 0 : 1;
    bool _3092 = uint(_3034) >= 2u;
    int _3094 = ~_3090;
    int _3096 = _3094 + 1;
    int _3098 = _3096 + 1;
    int _3100 = _3092 ? 0 : 1;
    bool _3102 = _2912 != 3;
    int _3104 = ~_3100;
    int _3106 = _3104 + 1;
    int _3108 = _3106 + 1;
    int _3110 = _3098;
    int _3112 = _3108;
    if (_3102)
    {
        int _3114 = ~_3090;
        int _3116 = _3114 + 1;
        _3110 = _3116;
    }
    int _3118 = _3110;
    bool _3120 = _3034 != 3;
    float _3122 = -_265;
    int _3124 = _2518 ? as_type<int>(_3122) : as_type<int>(_265);
    bool _3126 = _2406 != 0;
    int _3128 = ~_2340;
    int _3130 = _3128 + 1;
    if (_3120)
    {
        int _3132 = ~_3100;
        int _3134 = _3132 + 1;
        _3112 = _3134;
    }
    int _3136 = _3112;
    int _3138 = ~_1671;
    int _3140 = _3138 + 1;
    int _3142 = _3140 * int(_2942);
    int _3144 = _3142 + _2136;
    float _3146 = float(uint(_3144));
    int _3148 = ~_1671;
    int _3150 = _3148 + 1;
    float _3152 = as_type<float>(_1837) * _3146;
    float _3154 = trunc(_3152);
    float _3156 = precise::max(_3154, 0.0);
    uint _3158 = uint(_3156);
    int _3160 = int(_2942) + int(_3158);
    float _3162 = float(uint(_2194));
    float _3164 = as_type<float>(_1966) * _3162;
    int _3166 = _3150 * _3160;
    int _3168 = _3166 + _2136;
    float _3170 = trunc(_3164);
    float _3172 = precise::max(_3170, 0.0);
    uint _3174 = uint(_3172);
    bool _3176 = uint(_3168) >= uint(_1671);
    bool _3178 = !_3176;
    int _3180 = _3178 ? 0 : (-1);
    int _3182 = ~_3160;
    int _3184 = _3182 + _3180;
    int _3186 = _3184 + 1;
    int _3188 = _2992 * int(_3174);
    int _3190 = _3188 + _2194;
    int _3192 = _1671 * _3186;
    int _3194 = _3192 + _2136;
    float _3196 = _1623 * 2.0;
    float _3198 = float(uint(_3190));
    int _3200 = ~_2340;
    int _3202 = _3200 + 1;
    float _3204 = floor(_3196);
    float _3206 = as_type<float>(_1966) * _3198;
    float _3208 = trunc(_3206);
    float _3210 = precise::max(_3208, 0.0);
    uint _3212 = uint(_3210);
    int _3214 = int(_3174) + int(_3212);
    int _3216 = _2872 * _3214;
    int _3218 = _3216 + _2194;
    bool _3220 = uint(_3218) >= uint(_1926);
    float _3222 = float(uint(_2754));
    bool _3224 = !_3220;
    int _3226 = _3224 ? 0 : (-1);
    float _3228 = as_type<float>(_2458) * _3222;
    int _3230 = ~_3214;
    int _3232 = _3230 + _3226;
    int _3234 = _3232 + 1;
    float _3236 = trunc(_3228);
    float _3238 = precise::max(_3236, 0.0);
    uint _3240 = uint(_3238);
    int _3242 = _1926 * _3234;
    int _3244 = _3242 + _2194;
    float _3246 = _1631 * 2.0;
    bool _3248 = !_2586;
    int _3250 = _3248 ? _3244 : (-1);
    float _3252 = floor(_3246);
    int _3254 = _3202 * int(_3240);
    int _3256 = _3254 + _2754;
    float _3258 = float(uint(_3256));
    int _3260 = ~_2558;
    int _3262 = _3260 + 1;
    float _3264 = as_type<float>(_2458) * _3258;
    float _3266 = float(uint(_2904));
    float _3268 = as_type<float>(_2628) * _3266;
    float _3270 = trunc(_3264);
    float _3272 = precise::max(_3270, 0.0);
    uint _3274 = uint(_3272);
    float _3276 = trunc(_3268);
    float _3278 = precise::max(_3276, 0.0);
    uint _3280 = uint(_3278);
    int _3282 = int(_3240) + int(_3274);
    int _3284 = ~_2558;
    int _3286 = _3284 + 1;
    int _3288 = _3130 * _3282;
    int _3290 = _3288 + _2754;
    int _3292 = _3262 * int(_3280);
    int _3294 = _3292 + _2904;
    bool _3296 = uint(_3290) >= uint(_2340);
    float _3298 = float(uint(_3294));
    bool _3300 = !_3296;
    int _3302 = _3300 ? 0 : (-1);
    float _3304 = as_type<float>(_2628) * _3298;
    int _3306 = ~_3282;
    int _3308 = _3306 + _3302;
    int _3310 = _3308 + 1;
    float _3312 = trunc(_3304);
    float _3314 = precise::max(_3312, 0.0);
    uint _3316 = uint(_3314);
    int _3318 = _2340 * _3310;
    int _3320 = _3318 + _2754;
    bool _3322 = !_2548;
    int _3324 = _3322 ? _3320 : (-1);
    int _3326 = int(_3280) + int(_3316);
    int _3328 = _3286 * _3326;
    int _3330 = _3328 + _2904;
    bool _3332 = uint(_3330) >= uint(_2558);
    bool _3334 = !_3332;
    int _3336 = _3334 ? 0 : (-1);
    bool _3338 = _1671 == 0;
    int _3340 = ~_3326;
    int _3342 = _3340 + _3336;
    int _3344 = _3342 + 1;
    bool _3346 = !_3338;
    int _3348 = _3346 ? _3194 : (-1);
    bool _3350 = _1641 != 1;
    int _3352 = _2558 * _3344;
    int _3354 = _3352 + _2904;
    bool _3356 = !_3126;
    int _3358 = _3356 ? 0 : 1;
    bool _3360 = !_1701;
    int _3362 = _3360 ? 0 : 1;
    bool _3364 = _2456 != 0;
    bool _3366 = !_2592;
    int _3368 = _3366 ? _3354 : (-1);
    float _3370 = 0.0;
    float _3372 = as_type<float>(_3290);
    float _3374 = _3304;
    float _3376 = as_type<float>(_3326);
    if (_2748)
    {
        _3370 = _1631;
    }
    float _3378 = _3370;
    float _3380 = _3378;
    if (_2748)
    {
        _3372 = _1623;
    }
    float _3382 = _3372;
    float _3384 = _3382;
    if (!_2748)
    {
        _3380 = _1629;
    }
    float _3386 = _3380;
    if (!_2748)
    {
        _3384 = _1631;
    }
    float _3388 = _3384;
    int _3390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3392 = _3390 != 0;
    float _3394 = _3388 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _3396 = !_3350;
    float _3398 = _3396 ? as_type<float>(_1643) : as_type<float>(_1645);
    bool _3400 = !_3392;
    int _3402 = _3400 ? 0 : 1;
    bool _3404 = !_3350;
    float _3406 = _3404 ? as_type<float>(_1647) : as_type<float>(_1643);
    int _3408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3410 = _3408 != 0;
    if (!_3350)
    {
        _3374 = _1629;
    }
    float _3412 = _3374;
    float _3414 = _3412;
    if (!_3350)
    {
        _2462 = _1629;
    }
    float _3416 = _2462;
    float _3418 = _3416;
    if (!_3350)
    {
        _3376 = _1623;
    }
    float _3420 = _3376;
    float _3422 = _3420;
    if (!_3350)
    {
        _3026 = _1623;
    }
    float _3424 = _3026;
    float _3426 = _3424;
    if (_3350)
    {
        _3414 = _1623;
    }
    float _3428 = _3414;
    if (_3350)
    {
        _3418 = _1623;
    }
    float _3430 = _3418;
    if (_3350)
    {
        _3422 = _1631;
    }
    float _3432 = _3422;
    float _3434 = _3428 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_3350)
    {
        _3426 = _1631;
    }
    float _3436 = _3426;
    bool _3438 = _3252 >= 0.0;
    bool _3440 = isnan(_3252);
    bool _3442 = _3438 || _3440;
    bool _3444 = isnan(0.0);
    bool _3446 = _3442 || _3444;
    float _3448 = _3432 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _3450 = _3446 ? 0 : 1;
    bool _3452 = _3252 > 0.0;
    int _3454 = ~_3450;
    int _3456 = _3454 + 1;
    int _3458 = _3456 + 1;
    int _3460 = _3458;
    if (!_3452)
    {
        int _3462 = ~_3450;
        int _3464 = _3462 + 1;
        _3460 = _3464;
    }
    int _3466 = _3460;
    bool _3468 = _3204 >= 0.0;
    bool _3470 = isnan(_3204);
    bool _3472 = _3468 || _3470;
    bool _3474 = isnan(0.0);
    bool _3476 = _3472 || _3474;
    int _3478 = _3476 ? 0 : 1;
    bool _3480 = _3204 > 0.0;
    float _3482 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3484 = _3482 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _3486 = ~_3478;
    int _3488 = _3486 + 1;
    int _3490 = _3488 + 1;
    float _3492 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3494 = _3492 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3496 = 1.0 / _3484;
    int _3498 = _3490;
    if (!_3480)
    {
        int _3500 = ~_3478;
        int _3502 = _3500 + 1;
        _3498 = _3502;
    }
    int _3504 = _3498;
    float _3506 = 1.0 / _3494;
    bool _3508 = _2362 != 3;
    bool _3510 = !_2914;
    int _3512 = _3510 ? 0 : 1;
    bool _3514 = _2412 != 3;
    bool _3516 = !_3036;
    int _3518 = _3516 ? 0 : 1;
    bool _3520 = !_3508;
    int _3522 = _3520 ? 0 : (-1);
    float _3524 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3526 = _3524 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _3528 = _2912 != 3;
    bool _3530 = _3034 != 3;
    float _3532 = 1.0 / _3526;
    bool _3534 = !_3364;
    int _3536 = _3534 ? 0 : 1;
    float _3538 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3540 = _3538 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3542 = !_3528;
    int _3544 = _3542 ? 0 : (-1);
    int _3546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3548 = _3546 != 0;
    int _3550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3552 = _3550 != 0;
    int _3554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3556 = _3554 != 0;
    float _3558 = 1.0 / _3540;
    int _3560 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3562 = _3560 != 0;
    float _3564 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3566 = _3564 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3568 = _449 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _3570 = !_3552;
    int _3572 = _3570 ? 0 : 1;
    float _3574 = fma(_455, (*spvDescriptorSet0.vp_c10)._m0[5].x, _3568);
    float _3576 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3578 = _3576 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _3580 = !_3514;
    int _3582 = _3580 ? 0 : (-1);
    float _3584 = 1.0 / _3566;
    bool _3586 = _1567 != 0;
    int _3588 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3590 = _3588 != 0;
    float _3592 = _449 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _3594 = _449 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _3596 = 1.0 / _3578;
    float _3598 = fma(_455, (*spvDescriptorSet0.vp_c10)._m0[4].x, _3592);
    float _3600 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3602 = _3600 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _3604 = fma(_455, (*spvDescriptorSet0.vp_c10)._m0[6].x, _3594);
    float _3606 = fma(_479, (*spvDescriptorSet0.vp_c10)._m0[4].z, _3598);
    float _3608 = fma(_479, (*spvDescriptorSet0.vp_c10)._m0[5].z, _3574);
    float _3610 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _3612 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _3610;
    float _3614 = 1.0 / _3602;
    float _3616 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _3618 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _3616;
    float _3620 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _3622 = _3620 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _3624 = fma(_479, (*spvDescriptorSet0.vp_c10)._m0[6].z, _3604);
    float _3626 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _3628 = _3626 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _3630 = _3618 * _3532;
    float _3632 = _3622 * _3558;
    float _3634 = -_1892;
    float _3636 = _3634 + 1.0;
    float _3638 = _1900 * _3596;
    bool _3640 = _1353 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _3642 = isnan(_1353);
    bool _3644 = _3640 || _3642;
    bool _3646 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _3648 = _3644 || _3646;
    float _3650 = float(_3648);
    float _3652 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3654 = log2(_3652);
    float _3656 = _3628 * _3496;
    float _3658 = _3612 * _3506;
    bool _3660 = _1353 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _3662 = isnan(_1353);
    bool _3664 = _3660 || _3662;
    bool _3666 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _3668 = _3664 || _3666;
    float _3670 = float(_3668);
    float _3672 = _3650 * _3636;
    float _3674 = -_3650;
    float _3676 = _3674 + 1.0;
    float _3678 = _1904 * _3614;
    float _3680 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3682 = _1353 + _3680;
    bool _3684 = _1353 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3686 = isnan(_1353);
    bool _3688 = _3684 || _3686;
    bool _3690 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _3692 = _3688 || _3690;
    float _3694 = float(_3692);
    float _3696 = 0.0;
    bool _3698 = _2592;
    if (_3586)
    {
        float _3700 = in.m_68.w;
        _3696 = _3700;
    }
    float _3702 = _3696;
    float _3704 = _1629 * 2.0;
    float _3706 = fma(_3658, _3682, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _3708 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3710 = _1353 + _3708;
    float _3712 = _3670 * _3676;
    bool _3714 = _1353 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _3716 = isnan(_1353);
    bool _3718 = _3714 || _3716;
    bool _3720 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _3722 = _3718 || _3720;
    float _3724 = float(_3722);
    float _3726 = -_3694;
    float _3728 = _3726 + 1.0;
    float _3730 = _159 * _3654;
    float _3732 = floor(_3704);
    float _3734 = -_3670;
    float _3736 = _3734 + 1.0;
    float _3738 = fma(_3656, _3710, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _3740 = _3724 * _3728;
    float _3742 = -_3724;
    float _3744 = _3742 + 1.0;
    float _3746 = _3694 * _3736;
    bool _3748 = _1353 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _3750 = isnan(_1353);
    bool _3752 = _3748 || _3750;
    bool _3754 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _3756 = _3752 || _3754;
    float _3758 = float(_3756);
    float _3760 = exp2(_3730);
    float _3762 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3764 = _1353 + _3762;
    float _3766 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3768 = 1.0 + _3766;
    bool _3770 = _1353 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _3772 = isnan(_1353);
    bool _3774 = _3770 || _3772;
    bool _3776 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _3778 = _3774 || _3776;
    float _3780 = float(_3778);
    float _3782 = _3758 * _3744;
    float _3784 = fma(_3630, _3764, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _3786 = -_3758;
    float _3788 = _3786 + 1.0;
    bool _3790 = !_3530;
    int _3792 = _3790 ? 0 : (-1);
    float _3794 = 1.0 / _3768;
    bool _3796 = _3732 >= 0.0;
    bool _3798 = isnan(_3732);
    bool _3800 = _3796 || _3798;
    bool _3802 = isnan(0.0);
    bool _3804 = _3800 || _3802;
    float _3806 = _3780 * _3788;
    float _3808 = -_3780;
    float _3810 = _3808 + 1.0;
    bool _3812 = _1353 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _3814 = isnan(_1353);
    bool _3816 = _3812 || _3814;
    bool _3818 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _3820 = _3816 || _3818;
    float _3822 = float(_3820);
    float _3824 = _3780;
    if (_3586)
    {
        float _3826 = _3702 * 3.1415927410125732421875;
        _3824 = _3826;
    }
    float _3828 = _3824;
    int _3830 = _3804 ? 0 : 1;
    float _3832 = _1896 * _3584;
    float _3834 = -_3760;
    float _3836 = _3834 + 1.0;
    bool _3838 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3840 = isnan(0.0);
    bool _3842 = _3838 || _3840;
    bool _3844 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3846 = _3842 || _3844;
    float _3848 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3850 = _1353 + _3848;
    bool _3852 = !_3556;
    int _3854 = _3852 ? 0 : 1;
    float _3856 = _3828;
    if (_3586)
    {
        float _3858 = _3828 * 0.15915493667125701904296875;
        _3856 = _3858;
    }
    float _3860 = _3856;
    bool _3862 = _1811 != 0;
    float _3864 = _3822 * _3810;
    float _3866 = _3846 ? _3836 : 0.0;
    float _3868 = -_3822;
    float _3870 = _3868 + 1.0;
    float _3872 = fma(_3632, _3850, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _3874 = _3706 * _3864;
    bool _3876 = _3732 > 0.0;
    float _3878 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3880 = _1353 + _3878;
    float _3882 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3884 = _1353 + _3882;
    float _3886 = _3866 * _3794;
    float _3888 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3890 = _1353 + _3888;
    float _3892 = fma(_3870, (*spvDescriptorSet0.vp_c9)._m0[159].x, _3874);
    float _3894 = fma(_3638, _3884, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _3896 = fma(_3678, _3890, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _3898 = _1631 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _3900 = fma(_3738, _3806, _3892);
    float _3902 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _3904 = _3860;
    if (_3586)
    {
        float _3906 = _3860 * 6.283185482025146484375;
        float _3908 = sin(_3906);
        _3904 = _3908;
    }
    float _3910 = _3904;
    float _3912 = fma(_3784, _3782, _3900);
    float _3914 = -_3902;
    float _3916 = fma(_3898, 2.0, _3914);
    int _3918 = ~_3830;
    int _3920 = _3918 + 1;
    int _3922 = _3920 + 1;
    float _3924 = _3608 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _3926 = _3922;
    if (!_3876)
    {
        int _3928 = ~_3830;
        int _3930 = _3928 + 1;
        _3926 = _3930;
    }
    int _3932 = _3926;
    float _3934 = fma(_1623, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1906);
    float _3936 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _3938 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3940 = isnan(1.0);
    bool _3942 = _3938 || _3940;
    bool _3944 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3946 = _3942 || _3944;
    float _3948 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3950 = fma(_3872, _3740, _3912);
    float _3952 = _3606 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _3954 = -_3924;
    float _3956 = _3954 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3958 = fma(_3832, _3880, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _3960 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _3962 = !_3946;
    float _3964 = _3962 ? _159 : _3886;
    float _3966 = fma(_1631, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3936);
    bool _3968 = _1631 > 0.5;
    float _3970 = fma(_1631, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3948);
    float _3972 = _1623 + _1631;
    float _3974 = _1631 + _1629;
    float _3976 = _1631 + (-0.5);
    float _3978 = _3624 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _3980 = -_3952;
    float _3982 = _3980 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3984 = _3956 * _3956;
    float _3986 = fma(_1623, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3960);
    float _3988 = _1629 + (-0.5);
    float _3990 = -_3978;
    float _3992 = _3990 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3994 = fma(_3982, _3982, _3984);
    float _3996 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3998 = _3924 + _3996;
    float _4000 = _1623 + (-0.5);
    float _4002 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4004 = _3952 + _4002;
    float _4006 = fma(_3992, _3992, _3994);
    float _4008 = _3998 * _3998;
    if (_3586)
    {
        bool _4010 = _3910 > 0.5;
        _3698 = _4010;
    }
    bool _4012 = _3698;
    float _4014 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4016 = _3978 + _4014;
    float _4018 = fma(_4004, _4004, _4008);
    float _4020 = rsqrt(_4006);
    float _4022 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _4024 = fma(_4016, _4016, _4018);
    float _4026 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _4028 = fma(_1679, -2.0, _4022);
    float _4030 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _4032 = sqrt(_4024);
    float _4034 = fma(as_type<float>(_1643), (*spvDescriptorSet0.vp_c9)._m0[93].w, _4026);
    float _4036 = as_type<float>(_1643) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _4038 = fma(_3958, _3746, _3950);
    float _4040 = _739 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _4042 = fma(as_type<float>(_1645), (*spvDescriptorSet0.vp_c9)._m0[93].z, _4030);
    float _4044 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _4046 = as_type<float>(_1645) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _4048 = _3972 + (-1.0);
    float _4050 = fma(_3894, _3712, _4038);
    float _4052 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _4054 = -_4044;
    float _4056 = fma(_4046, 2.0, _4054);
    float _4058 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _4060 = _3956 * _4020;
    float _4062 = fma(_4048, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _4064 = fma(_3896, _3672, _4050);
    float _4066 = _4040 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _4068 = _4032 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _4070 = fma(_3436, (*spvDescriptorSet0.vp_c9)._m0[83].z, _4052);
    float _4072 = rsqrt(_4024);
    float _4074 = fma(_4036, -2.0, _4058);
    float _4076 = _3992 * _4020;
    float _4078 = fma(_1693, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _4080 = precise::min(_4066, _4068);
    float _4082 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _4084 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _4086 = _3982 * _4020;
    float _4088 = fma(_3398, (*spvDescriptorSet0.vp_c9)._m0[98].z, _4082);
    float _4090 = fma(_3430, (*spvDescriptorSet0.vp_c9)._m0[83].w, _4084);
    float _4092 = _3974 + (-1.0);
    float _4094 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _4096 = _3398 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _4098 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _4100 = fma(_4092, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _4102 = -_4094;
    float _4104 = fma(_4096, 2.0, _4102);
    float _4106 = fma(_3406, (*spvDescriptorSet0.vp_c9)._m0[98].w, _4098);
    float _4108 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _4110 = _3406 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _4112 = _4072 * _4080;
    out.m_74.w = _4080;
    float _4114 = fma(_4110, -2.0, _4108);
    float _4116 = _3998 * _4112;
    float _4118 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _4120 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _4122 = _4004 * _4112;
    float _4124 = -_4116;
    float _4126 = _3998 + _4124;
    bool _4128 = !_3548;
    int _4130 = _4128 ? 0 : 1;
    float _4132 = -_4118;
    float _4134 = fma(_3448, 2.0, _4132);
    float _4136 = -_4122;
    float _4138 = _4004 + _4136;
    float _4140 = _4126 * _4126;
    float _4142 = fma(_3434, -2.0, _4120);
    int _4144 = abs(_3572);
    float _4146 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _4148 = _4086 * _4146;
    float _4150 = fma(_4138, _4138, _4140);
    int _4152 = abs(_4130);
    float _4154 = in.m_76.x;
    float _4156 = in.m_76.y;
    float _4158 = in.m_76.z;
    float _4160 = float(_3466);
    float _4162 = fma(_1892, (*spvDescriptorSet0.vp_c9)._m0[166].x, _4064);
    float _4164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _4166 = float(_4144);
    float _4168 = -_159;
    float _4170 = fma(_4168, (*spvDescriptorSet0.vp_c9)._m0[96].x, _4104);
    float _4172 = float(_3932);
    float _4174 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4176 = _4076 * _4174;
    float _4178 = float(_4152);
    float _4180 = _4166 * _4160;
    float _4182 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _4184 = -_4148;
    float _4186 = fma(_4076, _4182, _4184);
    float _4188 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _4190 = _4060 * _4188;
    int _4192 = abs(_3854);
    float _4194 = _4178 * _4172;
    float _4196 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _4198 = -_4176;
    float _4200 = fma(_4060, _4196, _4198);
    float _4202 = _4186 * _4186;
    float _4204 = _4016 * _4112;
    float _4206 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4208 = -_4190;
    float _4210 = fma(_4086, _4206, _4208);
    float _4212 = _4194 * (-2.0);
    float _4214 = fma(_4200, _4200, _4202);
    float _4216 = -_4204;
    float _4218 = _4016 + _4216;
    float _4220 = _4180 * (-2.0);
    float _4222 = fma(_4212, _4154, _4154);
    float _4224 = float(_3504);
    float _4226 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    float _4228 = float(_4192);
    float _4230 = fma(_4078, _4220, _4078);
    float _4232 = fma(_4220, _4156, _4156);
    float _4234 = fma(_4062, _4212, _4062);
    float _4236 = fma(_3976, (*spvDescriptorSet0.vp_c9)._m0[196].x, _4222);
    float _4238 = _4228 * _4224;
    float _4240 = fma(_4000, (*spvDescriptorSet0.vp_c9)._m0[196].y, _4232);
    float _4242 = _4164 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _4244 = fma(_3964, _4234, _4236);
    float _4246 = _4238 * (-2.0);
    float _4248 = _1667 + 0.5;
    float _4250 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[97].w, _4106);
    float _4252 = _1677 + (-0.5);
    float _4254 = fma(_4246, _4158, _4158);
    float _4256 = fma(_4100, _4246, _4100);
    float _4258 = _4226 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _4260 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[96].y, _4114);
    float _4262 = fma(_3988, (*spvDescriptorSet0.vp_c9)._m0[196].z, _4254);
    float _4264 = fma(_3964, _4230, _4240);
    float _4266 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[97].z, _4088);
    float _4268 = fma(_4210, _4210, _4214);
    float _4270 = fma(_3964, _4256, _4262);
    float _4272 = fma(_4218, _4218, _4150);
    float _4274 = _4244 * 0.15915493667125701904296875;
    float _4276 = fma(_4242, _4248, _4170);
    float _4278 = -_4250;
    float _4280 = _4278 + 1.0;
    float _4282 = -_4258;
    float _4284 = -_4260;
    float _4286 = fma(_4282, _4252, _4284);
    float _4288 = _4264 * 0.15915493667125701904296875;
    float _4290 = -_4266;
    float _4292 = _4290 + 1.0;
    float _4294 = _4270 * 0.15915493667125701904296875;
    float _4296 = rsqrt(_4268);
    float _4298 = fma(_4280, _1677, _4286);
    float _4300 = -_4292;
    float _4302 = fma(_4300, _1667, _4276);
    float _4304 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _4306 = _3386 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _4308 = _741 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    out.m_78.x = _4302;
    out.m_78.y = _4298;
    float _4310 = sqrt(_4272);
    float _4312 = -_4304;
    float _4314 = fma(_4306, 2.0, _4312);
    float _4316 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    out.m_80.x = _4162;
    float _4318 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _261);
    int _4320 = abs(_2468);
    float _4322 = fma(_3394, -2.0, _4316);
    bool _4324 = !_3562;
    float _4326 = _4324 ? _265 : as_type<float>(_3124);
    float _4328 = _4274 * 6.283185482025146484375;
    float _4330 = sin(_4328);
    int _4332 = _2346 >> 31;
    float _4334 = _4200 * _4296;
    float _4336 = _4186 * _4296;
    float _4338 = _4210 * _4296;
    float _4340 = _4274 * 6.283185482025146484375;
    float _4342 = cos(_4340);
    float _4344 = _4072 * _4310;
    float _4346 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _265);
    float _4348 = _4308 * _4344;
    float _4350 = _4040 * _4344;
    float _4352 = _4288 * 6.283185482025146484375;
    float _4354 = sin(_4352);
    float _4356 = _4348 * _4346;
    float _4358 = _4350 * _4318;
    out.m_82.x = _4350;
    float _4360 = _4288 * 6.283185482025146484375;
    float _4362 = cos(_4360);
    float _4364 = _4294 * 6.283185482025146484375;
    float _4366 = cos(_4364);
    float _4368 = _4330 * _4354;
    float _4370 = _4342 * _4354;
    float _4372 = _4294 * 6.283185482025146484375;
    float _4374 = sin(_4372);
    float _4376 = _4330 * _4362;
    float _4378 = _4330 * _4366;
    float _4380 = _4342 * _4362;
    float _4382 = _4342 * _4366;
    int _4384 = _4332 & 3;
    float _4386 = _4076 * _4336;
    float _4388 = _4354 * _4366;
    float _4390 = _4362 * _4366;
    int _4392 = _2346 + _4384;
    float _4394 = _4086 * _4338;
    float _4396 = -_4370;
    float _4398 = fma(_4374, _4376, _4396);
    float _4400 = -_4376;
    float _4402 = fma(_4374, _4370, _4400);
    int _4404 = _2884 >> 31;
    float _4406 = -_4394;
    float _4408 = fma(_4076, _4334, _4406);
    int _4410 = _2376 >> 31;
    float _4412 = -_4386;
    float _4414 = fma(_4060, _4338, _4412);
    int _4416 = _4404 & 3;
    float _4418 = _4382 * _4408;
    int _4420 = _4392 >> 2;
    float _4422 = _4382 * _4414;
    int _4424 = _2884 + _4416;
    float _4426 = -_4374;
    float _4428 = fma(_4426, _4336, _4418);
    int _4430 = _4410 & 3;
    float _4432 = fma(_4374, _4380, _4368);
    int _4434 = _3006 >> 31;
    float _4436 = _4382 * _4356;
    int _4438 = _4420 << 4;
    int _4440 = _4438 + 368;
    float _4442 = fma(_4374, _4368, _4380);
    int _4444 = _2376 + _4430;
    float _4446 = -_4374;
    float _4448 = fma(_4446, _4334, _4422);
    int _4450 = _4434 & 3;
    float _4452 = _4060 * _4334;
    uint _4454 = uint(int(uint(_4440) >> uint(2)));
    uint _4456 = uint(int(uint(int(_4454)) >> uint(2)));
    int _4458 = int(_4454) & 3;
    float _4460 = (*spvDescriptorSet0.vp_c9)._m0[int(_4456)][_4458];
    int _4462 = int(_4454) + 1;
    uint _4464 = uint(int(uint(_4462) >> uint(2)));
    int _4466 = _4462 & 3;
    float _4468 = (*spvDescriptorSet0.vp_c9)._m0[int(_4464)][_4466];
    int _4470 = _4424 >> 2;
    float _4472 = fma(_4432, _4358, _4436);
    float _4474 = -_4452;
    float _4476 = fma(_4086, _4336, _4474);
    float _4478 = -_4356;
    float _4480 = _4374 * _4478;
    int _4482 = _3006 + _4450;
    float _4484 = _4432 * _4408;
    int _4486 = _4444 >> 2;
    float _4488 = fma(_4390, _4358, _4480);
    int _4490 = _4482 >> 2;
    float _4492 = _4432 * _4414;
    int _4494 = _4470 << 4;
    int _4496 = _4494 + 656;
    float _4498 = _4382 * _4476;
    int _4500 = _4490 << 4;
    int _4502 = _4500 + 800;
    float _4504 = _4432 * _4476;
    int _4506 = _4486 << 4;
    int _4508 = _4506 + 512;
    float _4510 = fma(_4390, _4334, _4492);
    float _4512 = fma(_4390, _4336, _4484);
    uint _4514 = uint(int(uint(_4502) >> uint(2)));
    uint _4516 = uint(int(uint(int(_4514)) >> uint(2)));
    int _4518 = int(_4514) & 3;
    float _4520 = (*spvDescriptorSet0.vp_c9)._m0[int(_4516)][_4518];
    int _4522 = int(_4514) + 1;
    uint _4524 = uint(int(uint(_4522) >> uint(2)));
    int _4526 = _4522 & 3;
    float _4528 = (*spvDescriptorSet0.vp_c9)._m0[int(_4524)][_4526];
    float _4530 = -_4374;
    float _4532 = fma(_4530, _4338, _4498);
    float _4534 = fma(_4390, _4338, _4504);
    float _4536 = _4378 * _4356;
    float _4538 = fma(_4378, _4060, _4428);
    float _4540 = _4344 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _4542 = _4540 * 0.5;
    float _4544 = _4402 * _4414;
    float _4546 = _4402 * _4408;
    uint _4548 = uint(int(uint(_4496) >> uint(2)));
    uint _4550 = uint(int(uint(int(_4548)) >> uint(2)));
    int _4552 = int(_4548) & 3;
    float _4554 = (*spvDescriptorSet0.vp_c9)._m0[int(_4550)][_4552];
    int _4556 = int(_4548) + 1;
    uint _4558 = uint(int(uint(_4556) >> uint(2)));
    int _4560 = _4556 & 3;
    float _4562 = (*spvDescriptorSet0.vp_c9)._m0[int(_4558)][_4560];
    float _4564 = _4402 * _4476;
    float _4566 = fma(_4398, _4358, _4536);
    float _4568 = fma(_4378, _4076, _4532);
    float _4570 = fma(_4388, _4542, _4488);
    float _4572 = fma(_4402, _4542, _4472);
    float _4574 = fma(_4388, _4334, _4544);
    float _4576 = fma(_4388, _4336, _4546);
    uint _4578 = uint(int(uint(_4508) >> uint(2)));
    uint _4580 = uint(int(uint(int(_4578)) >> uint(2)));
    int _4582 = int(_4578) & 3;
    float _4584 = (*spvDescriptorSet0.vp_c9)._m0[int(_4580)][_4582];
    int _4586 = int(_4578) + 1;
    uint _4588 = uint(int(uint(_4586) >> uint(2)));
    int _4590 = _4586 & 3;
    float _4592 = (*spvDescriptorSet0.vp_c9)._m0[int(_4588)][_4590];
    float _4594 = fma(_4388, _4338, _4564);
    float _4596 = _4476 * _4572;
    float _4598 = _4414 * _4572;
    int _4600 = ~_4320;
    int _4602 = _4600 + 1;
    int _4604 = _4602 + 1;
    float _4606 = fma(_4442, _4542, _4566);
    int _4608 = abs(_2492);
    float _4610 = fma(_4334, _4570, _4598);
    int _4612 = _4508 + 8;
    uint _4614 = uint(int(uint(_4612) >> uint(2)));
    uint _4616 = uint(int(uint(int(_4614)) >> uint(2)));
    int _4618 = int(_4614) & 3;
    float _4620 = (*spvDescriptorSet0.vp_c9)._m0[int(_4616)][_4618];
    int _4622 = int(_4614) + 1;
    uint _4624 = uint(int(uint(_4622) >> uint(2)));
    int _4626 = _4622 & 3;
    float _4628 = (*spvDescriptorSet0.vp_c9)._m0[int(_4624)][_4626];
    int _4630 = abs(_3536);
    float _4632 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _4634 = int(_4632);
    int _4636 = abs(_3044);
    float _4638 = fma(_4378, _4086, _4448);
    int _4640 = ~_4608;
    int _4642 = _4640 + 1;
    int _4644 = _4642 + 1;
    int _4646 = _4604 * as_type<int>(_4468);
    int _4648 = abs(_3358);
    int _4650 = _4440 + 8;
    uint _4652 = uint(int(uint(_4650) >> uint(2)));
    uint _4654 = uint(int(uint(int(_4652)) >> uint(2)));
    int _4656 = int(_4652) & 3;
    float _4658 = (*spvDescriptorSet0.vp_c9)._m0[int(_4654)][_4656];
    int _4660 = int(_4652) + 1;
    uint _4662 = uint(int(uint(_4660) >> uint(2)));
    int _4664 = _4660 & 3;
    float _4666 = (*spvDescriptorSet0.vp_c9)._m0[int(_4662)][_4664];
    int _4668 = abs(_3032);
    float _4670 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _4672 = int(_4670);
    int _4674 = ~_4636;
    int _4676 = _4674 + 1;
    int _4678 = _4676 + 1;
    float _4680 = fma(_4338, _4570, _4596);
    int _4682 = ~_4648;
    int _4684 = _4682 + 1;
    int _4686 = _4684 + 1;
    float _4688 = fma(_4442, _4086, _4574);
    int _4690 = ~_4630;
    int _4692 = _4690 + 1;
    int _4694 = _4692 + 1;
    int _4696 = _4496 + 8;
    uint _4698 = uint(int(uint(_4696) >> uint(2)));
    uint _4700 = uint(int(uint(int(_4698)) >> uint(2)));
    int _4702 = int(_4698) & 3;
    float _4704 = (*spvDescriptorSet0.vp_c9)._m0[int(_4700)][_4702];
    int _4706 = int(_4698) + 1;
    uint _4708 = uint(int(uint(_4706) >> uint(2)));
    int _4710 = _4706 & 3;
    float _4712 = (*spvDescriptorSet0.vp_c9)._m0[int(_4708)][_4710];
    int _4714 = ~_4668;
    int _4716 = _4714 + 1;
    int _4718 = _4716 + 1;
    int _4720 = _4686 * as_type<int>(_4460);
    int _4722 = _4720 + _4646;
    int _4724 = abs(_3076);
    float _4726 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _4728 = int(_4726);
    float _4730 = fma(_4442, _4060, _4576);
    float _4732 = fma(_4442, _4076, _4594);
    int _4734 = ~_4724;
    int _4736 = _4734 + 1;
    int _4738 = _4736 + 1;
    int _4740 = _4502 + 8;
    uint _4742 = uint(int(uint(_4740) >> uint(2)));
    uint _4744 = uint(int(uint(int(_4742)) >> uint(2)));
    int _4746 = int(_4742) & 3;
    float _4748 = (*spvDescriptorSet0.vp_c9)._m0[int(_4744)][_4746];
    int _4750 = int(_4742) + 1;
    uint _4752 = uint(int(uint(_4750) >> uint(2)));
    int _4754 = _4750 & 3;
    float _4756 = (*spvDescriptorSet0.vp_c9)._m0[int(_4752)][_4754];
    int _4758 = _4678 * as_type<int>(_4528);
    int _4760 = abs(_3512);
    int _4762 = abs(_3518);
    int _4764 = ~_4760;
    int _4766 = _4764 + 1;
    int _4768 = _4766 + 1;
    int _4770 = _4718 * as_type<int>(_4562);
    float _4772 = float(uint(_4634));
    int _4774 = ~_4762;
    int _4776 = _4774 + 1;
    int _4778 = _4776 + 1;
    int _4780 = _4768 * as_type<int>(_4554);
    int _4782 = _4780 + _4770;
    float _4784 = 1.0 / _4772;
    float _4786 = float(uint(_4672));
    int _4788 = _4644 * as_type<int>(_4592);
    int _4790 = ~_4728;
    int _4792 = _4790 + 1;
    int _4794 = _4778 * as_type<int>(_4520);
    int _4796 = _4794 + _4758;
    int _4798 = abs(_3522);
    int _4800 = _4694 * as_type<int>(_4584);
    int _4802 = _4800 + _4788;
    float _4804 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _4806 = int(_4804);
    int _4808 = ~_3088;
    int _4810 = _4808 + 1;
    int _4812 = _4810 + 1;
    int _4814 = ~_4798;
    int _4816 = _4814 + 1;
    int _4818 = _4816 + 1;
    int _4820 = abs(_4634);
    int _4822 = _4812 * as_type<int>(_4620);
    int _4824 = _4822 + _4802;
    int _4826 = abs(_3118);
    int _4828 = abs(_3136);
    int _4830 = ~_4826;
    int _4832 = _4830 + 1;
    int _4834 = _4832 + 1;
    int _4836 = _4738 * as_type<int>(_4658);
    int _4838 = _4836 + _4722;
    int _4840 = ~_4828;
    int _4842 = _4840 + 1;
    int _4844 = _4842 + 1;
    float _4846 = 1.0 / _4786;
    int _4848 = abs(_3362);
    int _4850 = _4818 * as_type<int>(_4666);
    int _4852 = _4850 + _4838;
    int _4854 = abs(_3582);
    int _4856 = _4834 * as_type<int>(_4704);
    int _4858 = _4856 + _4782;
    int _4860 = abs(_3544);
    int _4862 = ~_4854;
    int _4864 = _4862 + 1;
    int _4866 = _4864 + 1;
    int _4868 = ~_4860;
    int _4870 = _4868 + 1;
    int _4872 = _4870 + 1;
    int _4874 = abs(_4806);
    int _4876 = _4844 * as_type<int>(_4748);
    int _4878 = _4876 + _4796;
    int _4880 = abs(_3402);
    bool _4882 = !_3410;
    int _4884 = _4882 ? 0 : 1;
    int _4886 = abs(_3792);
    int _4888 = _4872 * as_type<int>(_4712);
    int _4890 = _4888 + _4858;
    float _4892 = fma(_4076, _4606, _4680);
    int _4894 = _4866 * as_type<int>(_4628);
    int _4896 = _4894 + _4824;
    int _4898 = ~_4886;
    int _4900 = _4898 + 1;
    int _4902 = _4900 + 1;
    int _4904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _4906 = _4904 != 0;
    int _4908 = abs(_4884);
    float _4910 = _3978 + _4892;
    int _4912 = _4902 * as_type<int>(_4756);
    int _4914 = _4912 + _4878;
    float _4916 = fma(_4086, _4606, _4610);
    int _4918 = ~_4880;
    int _4920 = _4918 + 1;
    int _4922 = _4920 + 1;
    bool _4924 = !_4906;
    int _4926 = _4924 ? 0 : 1;
    int _4928 = ~_4908;
    int _4930 = _4928 + 1;
    int _4932 = _4930 + 1;
    float _4934 = _3952 + _4916;
    float _4936 = float(uint(_4806));
    int _4938 = _4852 * _4922;
    float _4940 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _4942 = _4910 + _4940;
    int _4944 = _4896 * _4932;
    int _4946 = ~_4848;
    int _4948 = _4946 + 1;
    int _4950 = _4948 + 1;
    float _4952 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _4954 = _4934 + _4952;
    float _4956 = _4942 * _4942;
    int _4958 = _3250 * _4908;
    int _4960 = _4958 + _4944;
    float _4962 = float(uint(_4728));
    int _4964 = _3348 * _4880;
    int _4966 = _4964 + _4938;
    float _4968 = fma(_4954, _4954, _4956);
    int _4970 = _4890 * _4950;
    int _4972 = as_type<int>(_4846) + (-2);
    float _4974 = 1.0 / _4936;
    float _4976 = float(uint(_4960));
    int _4978 = _3324 * _4848;
    int _4980 = _4978 + _4970;
    int _4982 = abs(_4926);
    float _4984 = _4408 * _4572;
    int _4986 = as_type<int>(_4784) + (-2);
    float _4988 = as_type<float>(_4972) * _4976;
    float _4990 = float(uint(_4966));
    float _4992 = 1.0 / _4962;
    float _4994 = float(uint(_4820));
    int _4996 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _4998 = _4996 != 0;
    float _5000 = as_type<float>(_4986) * _4990;
    int _5002 = abs(_4672);
    float _5004 = _261 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _5006 = ~_4982;
    int _5008 = _5006 + 1;
    int _5010 = _5008 + 1;
    float _5012 = 1.0 / _4994;
    float _5014 = float(uint(_5002));
    float _5016 = fma(_4336, _4570, _4984);
    float _5018 = float(uint(_4874));
    int _5020 = _4914 * _5010;
    int _5022 = as_type<int>(_4974) + (-2);
    float _5024 = fma(_4060, _4606, _5016);
    float _5026 = float(uint(_4980));
    float _5028 = trunc(_4988);
    float _5030 = precise::max(_5028, 0.0);
    uint _5032 = uint(_5030);
    int _5034 = _3368 * _4982;
    int _5036 = _5034 + _5020;
    int _5038 = ~_4672;
    int _5040 = _5038 + 1;
    int _5042 = abs(_4728);
    float _5044 = as_type<float>(_5022) * _5026;
    int _5046 = as_type<int>(_4992) + (-2);
    float _5048 = trunc(_5000);
    float _5050 = precise::max(_5048, 0.0);
    uint _5052 = uint(_5050);
    float _5054 = float(uint(_5042));
    float _5056 = float(uint(_5036));
    int _5058 = ~_4634;
    int _5060 = _5058 + 1;
    float _5062 = 1.0 / _5014;
    int _5064 = abs(_4966);
    float _5066 = as_type<float>(_5046) * _5056;
    int _5068 = as_type<int>(_5012) + (-2);
    int _5070 = _5040 * int(_5032);
    int _5072 = _5070 + _4960;
    int _5074 = abs(_4960);
    float _5076 = float(uint(_5064));
    float _5078 = 1.0 / _5018;
    int _5080 = _5060 * int(_5052);
    int _5082 = _5080 + _4966;
    float _5084 = float(uint(_5072));
    float _5086 = as_type<float>(_5068) * _5076;
    float _5088 = float(uint(_5082));
    float _5090 = as_type<float>(_4972) * _5084;
    float _5092 = 1.0 / _5054;
    int _5094 = as_type<int>(_5062) + (-2);
    float _5096 = fma(_4398, _4076, _4534);
    int _5098 = abs(_4980);
    float _5100 = as_type<float>(_4986) * _5088;
    int _5102 = abs(_5036);
    float _5104 = fma(_4398, _4086, _4510);
    float _5106 = float(uint(_5098));
    float _5108 = trunc(_5044);
    float _5110 = precise::max(_5108, 0.0);
    uint _5112 = uint(_5110);
    int _5114 = as_type<int>(_5078) + (-2);
    float _5116 = _265 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5118 = as_type<float>(_5114) * _5106;
    float _5120 = fma(_4398, _4060, _4512);
    float _5122 = trunc(_5066);
    float _5124 = precise::max(_5122, 0.0);
    uint _5126 = uint(_5124);
    int _5128 = as_type<int>(_5092) + (-2);
    float _5130 = _5116 * _4568;
    float _5132 = float(uint(_5102));
    out.m_84.x = _5104;
    out.m_84.y = _5120;
    out.m_84.z = _5096;
    float _5134 = -_261;
    int _5136 = _3968 ? as_type<int>(_5134) : as_type<int>(_261);
    float _5138 = as_type<float>(_5102);
    float _5140 = _4060;
    float _5142 = _4934;
    float _5144 = _4910;
    if (!_3586)
    {
        _5138 = _261;
    }
    float _5146 = _5138;
    float _5148 = trunc(_5118);
    float _5150 = precise::max(_5148, 0.0);
    uint _5152 = uint(_5150);
    float _5154 = as_type<float>(_5128) * _5132;
    float _5156 = -_261;
    int _5158 = _3862 ? as_type<int>(_5156) : as_type<int>(_261);
    float _5160 = _5146;
    if (_3586)
    {
        float _5162 = -_261;
        float _5164 = _4012 ? _5162 : _261;
        _5160 = _5164;
    }
    float _5166 = _5160;
    bool _5168 = !_4998;
    float _5170 = _5168 ? _261 : as_type<float>(_5158);
    float _5172 = _5116 * _4638;
    float _5174 = sqrt(_4968);
    int _5176 = ~_4806;
    int _5178 = _5176 + 1;
    int _5180 = _4792 * int(_5126);
    int _5182 = _5180 + _5036;
    bool _5184 = !_3590;
    float _5186 = _5184 ? _261 : as_type<float>(_5136);
    float _5188 = float(uint(_5074));
    int _5190 = _5178 * int(_5112);
    int _5192 = _5190 + _4980;
    float _5194 = _5116 * _4538;
    float _5196 = trunc(_5086);
    float _5198 = precise::max(_5196, 0.0);
    uint _5200 = uint(_5198);
    int _5202 = ~_4820;
    int _5204 = _5202 + 1;
    float _5206 = as_type<float>(_5094) * _5188;
    float _5208 = float(uint(_5192));
    float _5210 = fma(_5004, _5104, _5172);
    float _5212 = fma(_5004, _5120, _5194);
    float _5214 = fma(_5004, _5096, _5130);
    float _5216 = float(uint(_5182));
    float _5218 = as_type<float>(_5022) * _5208;
    float _5220 = trunc(_5206);
    float _5222 = precise::max(_5220, 0.0);
    uint _5224 = uint(_5222);
    bool _5226 = _5174 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5228 = _3924 + _5024;
    float _5230 = as_type<float>(_5046) * _5216;
    int _5232 = ~_5002;
    int _5234 = _5232 + 1;
    float _5236 = trunc(_5154);
    float _5238 = precise::max(_5236, 0.0);
    uint _5240 = uint(_5238);
    int _5242 = _5204 * int(_5200);
    int _5244 = _5242 + _5064;
    int _5246 = ~_4874;
    int _5248 = _5246 + 1;
    if (!_5226)
    {
        _5140 = _4934;
    }
    float _5250 = _5140;
    float _5252 = trunc(_5100);
    float _5254 = precise::max(_5252, 0.0);
    uint _5256 = uint(_5254);
    float _5258 = _5250;
    if (!_5226)
    {
        _5142 = _4910;
    }
    float _5260 = _5142;
    int _5262 = _5234 * int(_5224);
    int _5264 = _5262 + _5074;
    float _5266 = float(uint(_5244));
    float _5268 = _5260;
    if (!_5226)
    {
        _5144 = _5228;
    }
    float _5270 = _5144;
    float _5272 = trunc(_5090);
    float _5274 = precise::max(_5272, 0.0);
    uint _5276 = uint(_5274);
    float _5278 = trunc(_5218);
    float _5280 = precise::max(_5278, 0.0);
    uint _5282 = uint(_5280);
    float _5284 = trunc(_5230);
    float _5286 = precise::max(_5284, 0.0);
    uint _5288 = uint(_5286);
    bool _5290 = !_5226;
    float _5292 = _5270;
    if (!_5290)
    {
        float _5294 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5296 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _5298 = _5174 + _5296;
        float _5300 = _5228 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5302 = rsqrt(_4968);
        float _5304 = _5298 * _5294;
        float _5306 = _5304 * 0.15915493667125701904296875;
        float _5308 = _5306 * 6.283185482025146484375;
        float _5310 = cos(_5308);
        float _5312 = _5306 * 6.283185482025146484375;
        float _5314 = sin(_5312);
        float _5316 = _5310 + (-1.0);
        float _5318 = _5316 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5320 = fma(_5314, _5300, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _5322 = fma(_5228, _5310, _5318);
        float _5324 = _5302 * _5320;
        float _5326 = fma(_4954, _5324, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _5328 = fma(_4942, _5324, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _5258 = _5326;
        _5292 = _5322;
        _5268 = _5328;
    }
    float _5330 = _5258;
    float _5332 = _5292;
    float _5334 = _5268;
    int _5336 = _5248 * int(_5152);
    int _5338 = _5336 + _5098;
    int _5340 = ~_5042;
    int _5342 = _5340 + 1;
    float _5344 = as_type<float>(_5068) * _5266;
    float _5346 = float(uint(_5264));
    float _5348 = -_159;
    float _5350 = fma(_5348, (*spvDescriptorSet0.vp_c9)._m0[86].x, _4314);
    float _5352 = float(uint(_5338));
    float _5354 = trunc(_5344);
    float _5356 = precise::max(_5354, 0.0);
    uint _5358 = uint(_5356);
    float _5360 = as_type<float>(_5094) * _5346;
    int _5362 = int(_5126) + int(_5288);
    float _5364 = as_type<float>(_5114) * _5352;
    int _5366 = int(_5052) + int(_5256);
    int _5368 = _5342 * int(_5240);
    int _5370 = _5368 + _5102;
    int _5372 = ~_4634;
    int _5374 = _5372 + 1;
    float _5376 = trunc(_5364);
    float _5378 = precise::max(_5376, 0.0);
    uint _5380 = uint(_5378);
    int _5382 = int(_5032) + int(_5276);
    float _5384 = -_159;
    float _5386 = fma(_5384, (*spvDescriptorSet0.vp_c9)._m0[81].x, _4134);
    float _5388 = float(uint(_5370));
    int _5390 = _5374 * _5366;
    int _5392 = _5390 + _4966;
    int _5394 = ~_4672;
    int _5396 = _5394 + 1;
    float _5398 = -_159;
    float _5400 = fma(_5398, (*spvDescriptorSet0.vp_c9)._m0[91].x, _4056);
    int _5402 = int(_5112) + int(_5282);
    float _5404 = as_type<float>(_5128) * _5388;
    float _5406 = trunc(_5360);
    float _5408 = precise::max(_5406, 0.0);
    uint _5410 = uint(_5408);
    int _5412 = ~_4728;
    int _5414 = _5412 + 1;
    int _5416 = _5396 * _5382;
    int _5418 = _5416 + _4960;
    bool _5420 = uint(_5392) >= uint(_4634);
    float _5422 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[86].y, _4322);
    int _5424 = int(_5200) + int(_5358);
    int _5426 = _5414 * _5362;
    int _5428 = _5426 + _5036;
    bool _5430 = uint(_5418) >= uint(_4672);
    float _5432 = trunc(_5404);
    float _5434 = precise::max(_5432, 0.0);
    uint _5436 = uint(_5434);
    int _5438 = ~_4806;
    int _5440 = _5438 + 1;
    float _5442 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[92].w, _4034);
    bool _5444 = uint(_5428) >= uint(_4728);
    float _5446 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3970);
    int _5448 = ~_5042;
    int _5450 = _5448 + 1;
    int _5452 = _5440 * _5402;
    int _5454 = _5452 + _4980;
    int _5456 = ~_4820;
    int _5458 = _5456 + 1;
    float _5460 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3934);
    int _5462 = int(_5152) + int(_5380);
    float _5464 = -_5446;
    float _5466 = _5464 + 1.0;
    int _5468 = ~_4874;
    int _5470 = _5468 + 1;
    int _5472 = _5458 * _5424;
    int _5474 = _5472 + _5064;
    bool _5476 = !_5420;
    int _5478 = _5476 ? 0 : (-1);
    float _5480 = -_5460;
    float _5482 = _5480 + 1.0;
    int _5484 = int(_5224) + int(_5410);
    int _5486 = _5470 * _5462;
    int _5488 = _5486 + _5098;
    int _5490 = int(_5240) + int(_5436);
    float _5492 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _5494 = uint(_5474) >= uint(_4820);
    float _5496 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[92].z, _4042);
    int _5498 = ~_5366;
    int _5500 = _5498 + _5478;
    int _5502 = _5500 + 1;
    int _5504 = _5450 * _5490;
    int _5506 = _5504 + _5102;
    int _5508 = ~_5002;
    int _5510 = _5508 + 1;
    float _5512 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3966);
    bool _5514 = !_5430;
    int _5516 = _5514 ? 0 : (-1);
    float _5518 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _5520 = uint(_5454) >= uint(_4806);
    int _5522 = _4634 * _5502;
    int _5524 = _5522 + _4966;
    int _5526 = ~_5382;
    int _5528 = _5526 + _5516;
    int _5530 = _5528 + 1;
    int _5532 = _5510 * _5484;
    int _5534 = _5532 + _5074;
    bool _5536 = _4634 == 0;
    float _5538 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3986);
    bool _5540 = uint(_5488) >= uint(_4874);
    int _5542 = _4672 * _5530;
    int _5544 = _5542 + _4960;
    bool _5546 = !_5520;
    int _5548 = _5546 ? 0 : (-1);
    float _5550 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _5552 = _4966 ^ _4634;
    float _5554 = _5492 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _5556 = !_5536;
    int _5558 = _5556 ? _5524 : (-1);
    float _5560 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[82].z, _4070);
    bool _5562 = uint(_5534) >= uint(_5002);
    float _5564 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[82].w, _4090);
    int _5566 = ~_5402;
    int _5568 = _5566 + _5548;
    int _5570 = _5568 + 1;
    float _5572 = -_5560;
    float _5574 = _5572 + 1.0;
    bool _5576 = _4672 == 0;
    float _5578 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _5580 = !_5494;
    int _5582 = _5580 ? 0 : (-1);
    int _5584 = _4806 * _5570;
    int _5586 = _5584 + _4980;
    uint _5588 = uint(int(uint(_5552) >> uint(31)));
    float _5590 = -_5538;
    float _5592 = _5590 + 1.0;
    bool _5594 = !_5562;
    int _5596 = _5594 ? 0 : (-1);
    float _5598 = -_5564;
    float _5600 = _5598 + 1.0;
    bool _5602 = !_5576;
    int _5604 = _5602 ? _5544 : (-1);
    bool _5606 = _4806 == 0;
    bool _5608 = _4806 == 0;
    int _5610 = _4980 ^ _4806;
    float _5612 = _5518 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _5614 = ~_5582;
    int _5616 = _5424 + _5614;
    int _5618 = _5616 + 1;
    float _5620 = -_159;
    float _5622 = fma(_5620, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3916);
    int _5624 = ~int(_5588);
    int _5626 = _5624 + 1;
    float _5628 = _5578 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _5630 = float(_5558);
    bool _5632 = uint(_5506) >= uint(_5042);
    bool _5634 = !_5444;
    int _5636 = _5634 ? 0 : (-1);
    float _5638 = fma(_5612, _5630, _5622);
    int _5640 = _4960 ^ _4672;
    int _5642 = _5618 ^ _5626;
    int _5644 = ~_5362;
    int _5646 = _5644 + _5636;
    int _5648 = _5646 + 1;
    bool _5650 = !_5606;
    int _5652 = _5650 ? _5586 : (-1);
    uint _5654 = uint(int(uint(_5640) >> uint(31)));
    int _5656 = ~_5626;
    int _5658 = _5656 + _5642;
    int _5660 = _5658 + 1;
    int _5662 = _5036 ^ _4728;
    float _5664 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _5666 = float(_5652);
    int _5668 = _4728 * _5648;
    int _5670 = _5668 + _5036;
    bool _5672 = !_5540;
    int _5674 = _5672 ? 0 : (-1);
    int _5676 = ~_5596;
    int _5678 = _5484 + _5676;
    int _5680 = _5678 + 1;
    float _5682 = fma(_5554, _5666, _5350);
    int _5684 = ~int(_5654);
    int _5686 = _5684 + 1;
    float _5688 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _5690 = _4728 == 0;
    int _5692 = _5680 ^ _5686;
    bool _5694 = !_5690;
    int _5696 = _5694 ? _5670 : (-1);
    uint _5698 = uint(int(uint(_5610) >> uint(31)));
    float _5700 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    int _5702 = ~_5674;
    int _5704 = _5462 + _5702;
    int _5706 = _5704 + 1;
    float _5708 = _5664 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    int _5710 = ~_5686;
    int _5712 = _5710 + _5692;
    int _5714 = _5712 + 1;
    float _5716 = float(_5604);
    float _5718 = float(_5696);
    float _5720 = _5186 + 0.5;
    int _5722 = ~int(_5698);
    int _5724 = _5722 + 1;
    float _5726 = fma(_5628, _5716, _5386);
    bool _5728 = _4634 == 0;
    float _5730 = fma(_5612, _5720, _5638);
    bool _5732 = !_5632;
    int _5734 = _5732 ? 0 : (-1);
    float _5736 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    uint _5738 = uint(int(uint(_5662) >> uint(31)));
    float _5740 = _5170 + 0.5;
    int _5742 = _5706 ^ _5724;
    float _5744 = _5550 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _5746 = _4672 == 0;
    float _5748 = fma(_5708, _5718, _5400);
    int _5750 = ~_5734;
    int _5752 = _5490 + _5750;
    int _5754 = _5752 + 1;
    float _5756 = fma(_5628, _5740, _5726);
    int _5758 = ~int(_5738);
    int _5760 = _5758 + 1;
    float _5762 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[76].y, _4028);
    bool _5764 = !_5728;
    int _5766 = _5764 ? _5660 : (-1);
    float _5768 = _5688 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _5770 = ~_5724;
    int _5772 = _5770 + _5742;
    int _5774 = _5772 + 1;
    float _5776 = _5166 + 0.5;
    int _5778 = _5754 ^ _5760;
    float _5780 = _1761 + 0.5;
    bool _5782 = !_5746;
    int _5784 = _5782 ? _5714 : (-1);
    float _5786 = fma(_5708, _5776, _5748);
    float _5788 = float(_5766);
    float _5790 = _5700 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    bool _5792 = _4728 == 0;
    float _5794 = fma(_5116, _5116, 1.0);
    int _5796 = ~_5760;
    int _5798 = _5796 + _5778;
    int _5800 = _5798 + 1;
    float _5802 = -_5762;
    float _5804 = fma(_5744, _5788, _5802);
    float _5806 = float(_5784);
    float _5808 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[81].y, _4142);
    bool _5810 = !_5608;
    int _5812 = _5810 ? _5774 : (-1);
    float _5814 = rsqrt(_5794);
    bool _5816 = !_5792;
    int _5818 = _5816 ? _5800 : (-1);
    float _5820 = -_5808;
    float _5822 = fma(_5768, _5806, _5820);
    float _5824 = fma(_5554, _5780, _5682);
    float _5826 = float(_5812);
    float _5828 = _5736 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _5830 = float(_5818);
    float _5832 = _4326 + (-0.5);
    float _5834 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[91].y, _4074);
    float _5836 = -_5422;
    float _5838 = fma(_5828, _5826, _5836);
    float _5840 = -_5466;
    float _5842 = fma(_1761, _5840, _5824);
    float _5844 = -_5744;
    float _5846 = fma(_5844, _5832, _5804);
    float _5848 = -_5834;
    float _5850 = fma(_5790, _5830, _5848);
    float _5852 = _1523 + (-0.5);
    float _5854 = _1819 + (-0.5);
    float _5856 = _1765 + (-0.5);
    float _5858 = -_3952;
    float _5860 = _5858 + _5330;
    float _5862 = -_5790;
    float _5864 = fma(_5862, _5852, _5850);
    float _5866 = -_5442;
    float _5868 = _5866 + 1.0;
    float _5870 = -_5768;
    float _5872 = fma(_5870, _5854, _5822);
    float _5874 = _5116 * _5814;
    float _5876 = -_5828;
    float _5878 = fma(_5876, _5856, _5838);
    float _5880 = fma(_5868, _1523, _5864);
    float _5882 = -_3924;
    float _5884 = _5882 + _5332;
    float _5886 = -_4730;
    float _5888 = _5874 * _5886;
    float _5890 = -_4688;
    float _5892 = _5874 * _5890;
    float _5894 = -_4732;
    float _5896 = _5874 * _5894;
    float _5898 = _5884 * _5884;
    float _5900 = fma(_1765, _5482, _5878);
    float _5902 = fma(_5814, _4538, _5888);
    float _5904 = fma(_5814, _4568, _5896);
    float _5906 = -_3978;
    float _5908 = _5906 + _5334;
    float _5910 = fma(_5860, _5860, _5898);
    float _5912 = -_5496;
    float _5914 = _5912 + 1.0;
    float _5916 = -_5512;
    float _5918 = _5916 + 1.0;
    float _5920 = -_5574;
    float _5922 = fma(_5170, _5920, _5756);
    float _5924 = fma(_5908, _5908, _5910);
    float _5926 = -_5914;
    float _5928 = fma(_5926, _5166, _5786);
    float _5930 = fma(_5814, _4638, _5892);
    float _5932 = -_5918;
    float _5934 = fma(_5186, _5932, _5730);
    float _5936 = sqrt(_5924);
    float _5938 = fma(_4326, _5592, _5846);
    float _5940 = fma(_1819, _5600, _5872);
    float _5942 = _4688 + _5210;
    float _5944 = _4730 + _5212;
    float _5946 = _4732 + _5214;
    out.m_86.x = _5842;
    out.m_86.y = _5900;
    float _5948 = -_4122;
    float _5950 = _5948 + _5330;
    float _5952 = -_4204;
    float _5954 = _5952 + _5334;
    float _5956 = -_4204;
    float _5958 = _3978 + _5956;
    out.m_88.x = _5934;
    out.m_88.y = _5938;
    out.m_88.z = _5922;
    out.m_88.w = _5940;
    out.m_90.x = _5928;
    out.m_90.y = _5880;
    bool _5960 = _5936 > 0.0;
    float _5962 = -_4122;
    float _5964 = _3952 + _5962;
    out.m_92.x = _5942;
    out.m_92.y = _5944;
    out.m_92.z = _5946;
    float _5966 = -_4116;
    float _5968 = _5966 + _5332;
    float _5970 = -_4116;
    float _5972 = _3924 + _5970;
    out.m_94.x = _5930;
    out.m_94.y = _5902;
    out.m_94.z = _5904;
    float _5974 = _5930;
    float _5976 = _5902;
    float _5978 = _5904;
    float _5980 = _5938;
    float _5982 = _5934;
    float _5984 = _5730;
    float _5986 = _5954;
    float _5988 = _5968;
    if (!_5960)
    {
        _5974 = _5950;
    }
    float _5990 = _5974;
    float _5992 = _5990;
    if (!_5960)
    {
        _5976 = _5968;
    }
    float _5994 = _5976;
    float _5996 = _5994;
    float _5998 = _5994;
    if (!_5960)
    {
        _5978 = _5954;
    }
    float _6000 = _5978;
    bool _6002 = !_5960;
    float _6004 = _6000;
    float _6006 = _6000;
    if (!_6002)
    {
        bool _6008 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _6010 = _5990;
        if (_6008)
        {
            float _6012 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _6010 = _6012;
        }
        float _6014 = _6010;
        float _6016 = _6014;
        float _6018 = _6014;
        if (_6008)
        {
            float _6020 = _481 * _6014;
            _5980 = _6020;
        }
        float _6022 = _5980;
        float _6024 = _6022;
        if (_6008)
        {
            float _6026 = _483 * _6014;
            _5982 = _6026;
        }
        float _6028 = _5982;
        float _6030 = _6028;
        if (_6008)
        {
            float _6032 = _485 * _6014;
            _5984 = _6032;
        }
        float _6034 = _5984;
        float _6036 = _6034;
        if (!_6008)
        {
            bool _6038 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _6040 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _6042 = _6038 || _6040;
            bool _6044 = isnan(1.0);
            bool _6046 = _6042 || _6044;
            float _6048 = _159 + 1.0;
            float _6050 = _6048;
            if (!_6046)
            {
                float _6052 = _6048 * _6048;
                float _6054 = _6052 * 0.5;
                _6016 = _6054;
            }
            float _6056 = _6016;
            float _6058 = _6056;
            if (!_6046)
            {
                float _6060 = _6056 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _6058 = _6060;
            }
            float _6062 = _6058;
            bool _6064 = !_6046;
            float _6066 = _6062;
            if (!_6064)
            {
                float _6068 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _6070 = log2(_6068);
                float _6072 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _6074 = 1.0 + _6072;
                float _6076 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _6078 = _6070 * _6048;
                float _6080 = 1.0 / _6074;
                float _6082 = _6076 * 0.693147182464599609375;
                float _6084 = exp2(_6078);
                float _6086 = 1.0 / _6082;
                float _6088 = _6084 + (-1.0);
                float _6090 = -_6088;
                float _6092 = fma(_6090, _6086, _6048);
                float _6094 = _6092 * _6080;
                float _6096 = _6094 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _6066 = _6096;
            }
            float _6098 = _6066;
            float _6100 = _6098 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _6102 = _6098 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _6104 = !_6046;
            _6018 = _6098;
            if (!_6104)
            {
                float _6106 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _6108 = log2(_6106);
                float _6110 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _6112 = 1.0 + _6110;
                float _6114 = 1.0 / _6112;
                float _6116 = _6108 * _6048;
                float _6118 = exp2(_6116);
                float _6120 = -_6118;
                float _6122 = _6120 + 1.0;
                float _6124 = _6122 * _6114;
                _6050 = _6124;
            }
            float _6126 = _6050;
            float _6128 = fma(_6126, _197, _6102);
            float _6130 = _6098 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _6132 = fma(_6126, _195, _6100);
            float _6134 = -_439;
            float _6136 = _6134 + _6128;
            float _6138 = fma(_6126, _199, _6130);
            float _6140 = -_441;
            float _6142 = _6140 + _6132;
            float _6144 = _6136 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _6146 = _6136 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _6148 = _6136 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _6150 = -_443;
            float _6152 = _6150 + _6138;
            float _6154 = fma(_6142, (*spvDescriptorSet0.vp_c10)._m0[4].x, _6144);
            float _6156 = fma(_6142, (*spvDescriptorSet0.vp_c10)._m0[5].x, _6146);
            float _6158 = fma(_6142, (*spvDescriptorSet0.vp_c10)._m0[6].x, _6148);
            float _6160 = fma(_6152, (*spvDescriptorSet0.vp_c10)._m0[4].z, _6154);
            float _6162 = fma(_6152, (*spvDescriptorSet0.vp_c10)._m0[5].z, _6156);
            float _6164 = fma(_6152, (*spvDescriptorSet0.vp_c10)._m0[6].z, _6158);
            _489 = _6162;
            _491 = _6160;
            _493 = _6164;
            _6024 = _6160;
            _6030 = _6162;
            _6036 = _6164;
            _5996 = _6152;
            _6004 = _6136;
        }
        float _6166 = _489;
        float _6168 = _491;
        float _6170 = _493;
        float _6172 = _6024;
        float _6174 = _6030;
        float _6176 = _6036;
        float _6178 = _5996;
        float _6180 = _6018;
        float _6182 = _6004;
        float _6184 = _6166 * _6166;
        float _6186 = fma(_6168, _6168, _6184);
        float _6188 = fma(_6170, _6170, _6186);
        float _6190 = rsqrt(_5924);
        float _6192 = sqrt(_6188);
        float _6194 = _5860 * _6190;
        float _6196 = _5884 * _6190;
        float _6198 = _5908 * _6190;
        bool _6200 = _6192 > 0.0;
        float _6202 = _6180;
        float _6204 = _6178;
        float _6206 = _6182;
        _495 = _6170;
        if (!_6200)
        {
            _6202 = _5950;
        }
        float _6208 = _6202;
        _5992 = _6208;
        if (!_6200)
        {
            _6204 = _5968;
        }
        float _6210 = _6204;
        _5998 = _6210;
        if (!_6200)
        {
            _6206 = _5954;
        }
        float _6212 = _6206;
        bool _6214 = !_6200;
        _6006 = _6212;
        if (!_6214)
        {
            float _6216 = rsqrt(_6188);
            float _6218 = _6216 * _6166;
            float _6220 = _6216 * _6168;
            float _6222 = _6216 * _6170;
            float _6224 = _6196 * _6218;
            float _6226 = fma(_6194, _6220, _6224);
            float _6228 = fma(_6198, _6222, _6226);
            float _6230 = _6228 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _6232 = fma(_6172, _6230, _5950);
            float _6234 = fma(_6174, _6230, _5968);
            float _6236 = fma(_6176, _6230, _5954);
            _5998 = _6234;
            _5992 = _6232;
            _6006 = _6236;
        }
    }
    float _6238 = _5998;
    float _6240 = _5992;
    float _6242 = _6006;
    float _6244 = _495;
    float _6246 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _6248 = _6238 + _6246;
    float _6250 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _6252 = _6240 + _6250;
    float _6254 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _6256 = _6242 + _6254;
    float _6258 = _6248 * _6248;
    float _6260 = fma(_6252, _6252, _6258);
    float _6262 = _5972 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _6264 = fma(_6256, _6256, _6260);
    float _6266 = fma(_5964, (*spvDescriptorSet0.vp_c8)._m0[11].x, _6262);
    float _6268 = fma(_5964, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _6270 = rsqrt(_6264);
    float _6272 = fma(_5958, (*spvDescriptorSet0.vp_c8)._m0[11].z, _6266);
    float _6274 = _5972 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _6276 = _6272 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _6278 = fma(_5964, (*spvDescriptorSet0.vp_c8)._m0[10].x, _6274);
    float _6280 = 1.0 / _6276;
    float _6282 = fma(_5958, (*spvDescriptorSet0.vp_c8)._m0[10].z, _6278);
    float _6284 = _6282 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _6286 = _6270 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _6288 = _6284 + _6276;
    float _6290 = _6252 * _6286;
    float _6292 = _6256 * _6286;
    float _6294 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _6296 = _6290 * _6290;
    float _6298 = _6292 * _6292;
    float _6300 = _5972 + _6294;
    float _6302 = _6288 * _6280;
    float _6304 = _6302 * 0.5;
    float _6306 = _6296 + _6298;
    float _6308 = _6300 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _6310 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _6312 = fma(_6304, (*spvDescriptorSet0.vp_c8)._m0[30].w, _6310);
    float _6314 = sqrt(_6306);
    float _6316 = fma(_5964, (*spvDescriptorSet0.vp_c15)._m0[126].x, _6308);
    float _6318 = fma(_5958, (*spvDescriptorSet0.vp_c15)._m0[126].z, _6316);
    float _6320 = 1.0 / _6312;
    float _6322 = _6318 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _6324 = _6300 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _6326 = fma(_5964, (*spvDescriptorSet0.vp_c15)._m0[127].x, _6324);
    bool _6328 = _6314 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6330 = trunc(_6322);
    int _6332 = int(_6330);
    float _6334 = fma(_5958, (*spvDescriptorSet0.vp_c15)._m0[127].z, _6326);
    float _6336 = _6334 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _6338 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _6340 = _6320 * _6338;
    float _6342 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6344 = _6314 + _6342;
    float _6346 = trunc(_6336);
    int _6348 = int(_6346);
    bool _6350 = _6340 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _6352 = _6340 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    int _6354 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _6356 = _6332 + _6354;
    int _6358 = _6356 + 1;
    float _6360 = _6280;
    int _6362 = 2;
    float _6364 = _6344;
    float _6366 = _6306;
    int _6368 = _6358;
    float _6370 = _6290;
    float _6372 = _6340;
    if (_6328)
    {
        float _6374 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6360 = _6374;
    }
    float _6376 = _6360;
    bool _6378 = !_6350;
    int _6380 = _6378 ? 0 : 1;
    int _6382 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _6384 = _6348 + _6382;
    int _6386 = _6384 + 1;
    float _6388 = floor(_6268);
    if (!_6350)
    {
        _6362 = 1;
    }
    int _6390 = _6362;
    bool _6392 = _6358 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _6394 = _6390;
    if (!_6352)
    {
        _6394 = _6380;
    }
    int _6396 = _6394;
    float _6398 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _6400 = _6376;
    if (_6328)
    {
        float _6402 = _6344 * _6376;
        _6364 = _6402;
    }
    float _6404 = _6364;
    if (_6328)
    {
        float _6406 = rsqrt(_6306);
        _6366 = _6406;
    }
    float _6408 = _6366;
    int _6410 = _6396 << 6;
    float _6412 = _6408;
    if (_6328)
    {
        float _6414 = _6404 * 0.15915493667125701904296875;
        _6400 = _6414;
    }
    float _6416 = _6400;
    int _6418 = _6358 | _6386;
    int _6420 = _6410 + 96;
    uint _6422 = uint(int(uint(_6420) >> uint(2)));
    uint _6424 = uint(int(uint(int(_6422)) >> uint(2)));
    int _6426 = int(_6422) & 3;
    float _6428 = (*spvDescriptorSet0.vp_c15)._m0[int(_6424)][_6426];
    int _6430 = int(_6422) + 1;
    uint _6432 = uint(int(uint(_6430) >> uint(2)));
    int _6434 = _6430 & 3;
    float _6436 = (*spvDescriptorSet0.vp_c15)._m0[int(_6432)][_6434];
    float _6438 = precise::max(0.0, _6398);
    bool _6440 = _6418 < 0;
    bool _6442 = _6440 || _6392;
    float _6444 = _6244;
    float _6446 = _6438;
    if (_6328)
    {
        float _6448 = _6416 * 6.283185482025146484375;
        float _6450 = cos(_6448);
        _6444 = _6450;
    }
    float _6452 = _6444;
    float _6454 = -_6388;
    float _6456 = _6268 + _6454;
    float _6458 = -_6286;
    float _6460 = -_6438;
    float _6462 = fma(_6248, _6458, _6460);
    bool _6464 = _6386 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _6466 = _6464 || _6442;
    int _6468 = _6410 + 80;
    uint _6470 = uint(int(uint(_6468) >> uint(2)));
    uint _6472 = uint(int(uint(int(_6470)) >> uint(2)));
    int _6474 = int(_6470) & 3;
    float _6476 = (*spvDescriptorSet0.vp_c15)._m0[int(_6472)][_6474];
    int _6478 = int(_6470) + 1;
    uint _6480 = uint(int(uint(_6478) >> uint(2)));
    int _6482 = _6478 & 3;
    float _6484 = (*spvDescriptorSet0.vp_c15)._m0[int(_6480)][_6482];
    float _6486 = _6462;
    if (_6328)
    {
        float _6488 = _6462 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6446 = _6488;
    }
    float _6490 = _6446;
    float _6492 = as_type<float>(_6418);
    if (_6328)
    {
        float _6494 = _6416 * 6.283185482025146484375;
        float _6496 = sin(_6494);
        _6492 = _6496;
    }
    float _6498 = _6492;
    float _6500 = fma(_5958, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _6502 = _6238 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _6504 = _6410 + 48;
    uint _6506 = uint(int(uint(_6504) >> uint(2)));
    uint _6508 = uint(int(uint(int(_6506)) >> uint(2)));
    int _6510 = int(_6506) & 3;
    float _6512 = (*spvDescriptorSet0.vp_c15)._m0[int(_6508)][_6510];
    int _6514 = int(_6506) + 1;
    uint _6516 = uint(int(uint(_6514) >> uint(2)));
    int _6518 = _6514 & 3;
    float _6520 = (*spvDescriptorSet0.vp_c15)._m0[int(_6516)][_6518];
    float _6522 = fma(_6240, (*spvDescriptorSet0.vp_c8)._m0[2].x, _6502);
    if (!_6466)
    {
        int _6524 = _6386 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _6526 = _6524 + _6358;
        _6368 = _6526;
    }
    int _6528 = _6368;
    float _6530 = _6452;
    if (_6328)
    {
        float _6532 = _6452 + (-1.0);
        _5986 = _6532;
    }
    float _6534 = _5986;
    float _6536 = floor(_6500);
    float _6538 = fma(_6242, (*spvDescriptorSet0.vp_c8)._m0[2].z, _6522);
    int _6540 = _6410 + 104;
    uint _6542 = uint(int(uint(_6540) >> uint(2)));
    uint _6544 = uint(int(uint(int(_6542)) >> uint(2)));
    int _6546 = int(_6542) & 3;
    float _6548 = (*spvDescriptorSet0.vp_c15)._m0[int(_6544)][_6546];
    int _6550 = int(_6542) + 1;
    uint _6552 = uint(int(uint(_6550) >> uint(2)));
    int _6554 = _6550 & 3;
    float _6556 = (*spvDescriptorSet0.vp_c15)._m0[int(_6552)][_6554];
    float _6558 = _6534;
    if (_6328)
    {
        float _6560 = _6534 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6558 = _6560;
    }
    float _6562 = _6558;
    if (_6328)
    {
        float _6564 = fma(_6498, _6490, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _5988 = _6564;
    }
    float _6566 = _5988;
    float _6568 = _6566;
    if (_6328)
    {
        float _6570 = fma(_6462, _6452, _6562);
        _6486 = _6570;
    }
    float _6572 = _6486;
    float _6574 = _5466;
    if (!_6466)
    {
        float _6576 = floor(_6336);
        _6574 = _6576;
    }
    float _6578 = _6574;
    float _6580 = _6538 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _6582 = _6410 + 64;
    uint _6584 = uint(int(uint(_6582) >> uint(2)));
    uint _6586 = uint(int(uint(int(_6584)) >> uint(2)));
    int _6588 = int(_6584) & 3;
    float _6590 = (*spvDescriptorSet0.vp_c15)._m0[int(_6586)][_6588];
    int _6592 = int(_6584) + 1;
    uint _6594 = uint(int(uint(_6592) >> uint(2)));
    int _6596 = _6592 & 3;
    float _6598 = (*spvDescriptorSet0.vp_c15)._m0[int(_6594)][_6596];
    if (_6328)
    {
        float _6600 = _6408 * _6566;
        _6568 = _6600;
    }
    float _6602 = _6568;
    float _6604 = _6602;
    if (!_6328)
    {
        _6530 = _6292;
    }
    float _6606 = _6530;
    float _6608 = _6606;
    if (!_6328)
    {
        _6412 = _6296;
    }
    float _6610 = _6412;
    float _6612 = _6610;
    if (_6328)
    {
        float _6614 = _6290 * _6602;
        _6370 = _6614;
    }
    float _6616 = _6370;
    float _6618 = sqrt(_6264);
    if (_6328)
    {
        float _6620 = _6292 * _6602;
        _6608 = _6620;
    }
    float _6622 = _6608;
    int _6624 = _6410 + 56;
    uint _6626 = uint(int(uint(_6624) >> uint(2)));
    uint _6628 = uint(int(uint(int(_6626)) >> uint(2)));
    int _6630 = int(_6626) & 3;
    float _6632 = (*spvDescriptorSet0.vp_c15)._m0[int(_6628)][_6630];
    int _6634 = int(_6626) + 1;
    uint _6636 = uint(int(uint(_6634) >> uint(2)));
    int _6638 = _6634 & 3;
    float _6640 = (*spvDescriptorSet0.vp_c15)._m0[int(_6636)][_6638];
    if (_6328)
    {
        float _6642 = _6616 * _6616;
        _6612 = _6642;
    }
    float _6644 = _6612;
    if (!_6328)
    {
        _6604 = _6298;
    }
    float _6646 = _6604;
    float _6648 = _6646;
    if (_6328)
    {
        float _6650 = _6622 * _6622;
        _6648 = _6650;
    }
    float _6652 = _6648;
    float _6654 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _6656 = fma(_6572, _6572, _6644);
    float _6658 = _6580 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _6660 = -_6536;
    float _6662 = _6500 + _6660;
    int _6664 = _6410 + 72;
    uint _6666 = uint(int(uint(_6664) >> uint(2)));
    uint _6668 = uint(int(uint(int(_6666)) >> uint(2)));
    int _6670 = int(_6666) & 3;
    float _6672 = (*spvDescriptorSet0.vp_c15)._m0[int(_6668)][_6670];
    int _6674 = int(_6666) + 1;
    uint _6676 = uint(int(uint(_6674) >> uint(2)));
    int _6678 = _6674 & 3;
    float _6680 = (*spvDescriptorSet0.vp_c15)._m0[int(_6676)][_6678];
    float _6682 = _6300 * _6436;
    int _6684 = as_type<int>(_6536);
    int _6686 = as_type<int>(_6658);
    float _6688 = _6656;
    int _6690 = as_type<int>(_6652);
    if (!_6466)
    {
        int _6692 = _6528 << 2;
        _6684 = _6692;
    }
    int _6694 = _6684;
    float _6696 = -_6658;
    float _6698 = fma(_6696, _6654, 1.0);
    float _6700 = fma(_5964, _6428, _6682);
    if (!_6466)
    {
        int _6702 = 12 & _6694;
        _6686 = _6702;
    }
    int _6704 = _6686;
    int _6706 = _6410 + 88;
    uint _6708 = uint(int(uint(_6706) >> uint(2)));
    uint _6710 = uint(int(uint(int(_6708)) >> uint(2)));
    int _6712 = int(_6708) & 3;
    float _6714 = (*spvDescriptorSet0.vp_c15)._m0[int(_6710)][_6712];
    int _6716 = int(_6708) + 1;
    uint _6718 = uint(int(uint(_6716) >> uint(2)));
    int _6720 = _6716 & 3;
    float _6722 = (*spvDescriptorSet0.vp_c15)._m0[int(_6718)][_6720];
    float _6724 = _6300 * _6484;
    float _6726 = log2(_6698);
    float _6728 = fma(_5964, _6476, _6724);
    float _6730 = _6656 + _6652;
    int _6732 = _6704;
    float _6734 = _6730;
    if (!_6466)
    {
        float _6736 = -_6578;
        float _6738 = _6336 + _6736;
        _6688 = _6738;
    }
    float _6740 = _6688;
    if (!_6466)
    {
        uint _6742 = uint(int(uint(_6528) >> uint(2)));
        _6690 = int(_6742);
    }
    int _6744 = _6690;
    float _6746 = _6300 * _6520;
    float _6748 = rsqrt(_6730);
    if (!_6466)
    {
        int _6750 = _6744 << 4;
        int _6752 = _6750 + _6704;
        _6732 = _6752;
    }
    int _6754 = _6732;
    float _6756 = fma(_5964, _6512, _6746);
    float _6758 = fma(_5958, _6548, _6700);
    float _6760 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _6762 = fma(_6618, (*spvDescriptorSet0.vp_c15)._m0[23].w, _6760);
    float _6764 = precise::clamp(_6762, 0.0, 1.0);
    float _6766 = _6726 * 0.693147182464599609375;
    float _6768 = _6758 + _6556;
    float _6770 = -_6764;
    float _6772 = _6770 + 1.0;
    float _6774 = 1.0 / _6768;
    float _6776 = _6300 * _6598;
    float _6778 = fma(_5964, _6590, _6776);
    float _6780 = _6748 * _6616;
    float _6782 = _6748 * _6572;
    float _6784 = fma(_5958, _6632, _6756);
    float _6786 = abs(_6772);
    float _6788 = log2(_6786);
    float _6790 = _6780 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _6792 = _6748 * _6622;
    float _6794 = _6784 + _6640;
    float _6796 = _6238 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _6798 = -_6790;
    float _6800 = fma(_6782, (*spvDescriptorSet0.vp_c15)._m0[21].y, _6798);
    float _6802 = _6238 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _6804 = fma(_5958, _6672, _6778);
    float _6806 = _6794 * _6774;
    float _6808 = fma(_6240, (*spvDescriptorSet0.vp_c8)._m0[1].x, _6796);
    float _6810 = fma(_6240, (*spvDescriptorSet0.vp_c8)._m0[3].x, _6802);
    float _6812 = -_6792;
    float _6814 = fma(_6812, (*spvDescriptorSet0.vp_c15)._m0[21].z, _6800);
    float _6816 = _6768;
    float _6818 = _6782;
    if (!_6466)
    {
        float _6820 = floor(_6322);
        _6816 = _6820;
    }
    float _6822 = _6816;
    bool _6824 = _6806 >= 0.0;
    float _6826 = fma(_6242, (*spvDescriptorSet0.vp_c8)._m0[1].z, _6808);
    float _6828 = fma(_5958, _6714, _6728);
    float _6830 = _6804 + _6680;
    float _6832 = _6238 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _6834 = _6788 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _6836 = _6806 <= 1.0;
    bool _6838 = _6836 && _6824;
    float _6840 = _6830 * _6774;
    float _6842 = fma(_6240, (*spvDescriptorSet0.vp_c8)._m0[0].x, _6832);
    float _6844 = _6826 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _6846 = exp2(_6834);
    float _6848 = fma(_6242, (*spvDescriptorSet0.vp_c8)._m0[3].z, _6810);
    float _6850 = fma(_6242, (*spvDescriptorSet0.vp_c8)._m0[0].z, _6842);
    bool _6852 = _6840 >= 0.0;
    bool _6854 = _6852 && _6838;
    float _6856 = fma(_6814, -0.5, 0.5);
    float _6858 = _6848 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _6860 = _6850 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _6862 = _6844 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _6864 = _6840 <= 1.0;
    bool _6866 = _6864 && _6854;
    float _6868 = sqrt(_6856);
    float _6870 = _6782 + 1.0;
    float _6872 = fma(_6860, (*spvDescriptorSet0.vp_c8)._m0[7].x, _6862);
    float _6874 = _6828 + _6722;
    float _6876 = fma(_6814, 0.5, 0.5);
    float _6878 = _6844 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _6880 = fma(_6580, (*spvDescriptorSet0.vp_c8)._m0[7].z, _6872);
    float _6882 = -_6782;
    float _6884 = fma(_6846, _6870, _6882);
    float _6886 = fma(_6876, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _6888 = fma(_6860, (*spvDescriptorSet0.vp_c8)._m0[4].x, _6878);
    float _6890 = fma(_6858, (*spvDescriptorSet0.vp_c8)._m0[7].w, _6880);
    float _6892 = _6844 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _6894 = _6860;
    if (_6866)
    {
        float _6896 = float(_6396);
        _6818 = _6896;
    }
    float _6898 = _6818;
    float _6900 = fma(_6876, _6886, -0.212114393711090087890625);
    float _6902 = 1.0 / _6890;
    float _6904 = fma(_6860, (*spvDescriptorSet0.vp_c8)._m0[5].x, _6892);
    float _6906 = fma(_6580, (*spvDescriptorSet0.vp_c8)._m0[4].z, _6888);
    float _6908 = _6868 * 0.636619746685028076171875;
    float _6910 = fma(_6876, _6900, 1.570728778839111328125);
    float _6912 = fma(_6580, (*spvDescriptorSet0.vp_c8)._m0[5].z, _6904);
    float _6914 = fma(_6858, (*spvDescriptorSet0.vp_c8)._m0[4].w, _6906);
    if (!_6466)
    {
        float _6916 = -_6822;
        float _6918 = _6322 + _6916;
        _6734 = _6918;
    }
    float _6920 = _6734;
    float _6922 = _6898;
    if (_6866)
    {
        float _6924 = rint(_6898);
        float _6926 = precise::max(_6924, 0.0);
        uint _6928 = uint(_6926);
        uint _6930 = clamp(_6928, 0u, 65535u);
        _6922 = as_type<float>(_6930);
    }
    float _6932 = _6922;
    float _6934 = fma(_6858, (*spvDescriptorSet0.vp_c8)._m0[5].w, _6912);
    float _6936 = -_6910;
    float _6938 = fma(_6908, _6936, 1.0);
    float _6940 = _6874 * _6774;
    float2 _17657 = float2(_6456, _6662);
    float _6942 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_17657, float2(0.0), isnan(_17657)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_17657, float2(0.0), isnan(_17657)), level(0.0)).x;
    float _6944 = _6766 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _6946 = fma(_6884, 0.5, 0.5);
    float _6948 = _6748;
    float _6950 = _6940;
    float _6952 = _6934;
    if (!_6466)
    {
        int _6954 = _6754 + 400;
        uint _6956 = uint(int(uint(_6954) >> uint(2)));
        uint _6958 = uint(int(uint(int(_6956)) >> uint(2)));
        int _6960 = int(_6956) & 3;
        float _6962 = (*spvDescriptorSet0.vp_c15)._m0[int(_6958)][_6960];
        _6948 = _6962;
    }
    float _6964 = _6948;
    float _6966 = _6914 * _6902;
    float _6968 = _6934 * _6902;
    float _6970 = fma(_6966, 0.5, 0.5);
    float _6972 = fma(_6968, -0.5, 0.5);
    float _6974 = _6910;
    if (_6866)
    {
        float3 _17716 = float3(_6806, _6840, float(as_type<int>(_6932)));
        float3 _17720 = select(_17716, float3(0.0), isnan(_17716));
        float _6976 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _17720.xy, uint(rint(_17720.z)), _6940, level(0.0));
        _6974 = _6976;
    }
    float _6978 = _6974;
    float3 _17730 = float3(_6970, _6972, _6944);
    float _6980 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_17730, float3(0.0), isnan(_17730)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_17730, float3(0.0), isnan(_17730)), level(0.0)).x;
    float3 _17739 = float3(_6970, _6972, _6944);
    float4 _6983 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_17739, float3(0.0), isnan(_17739)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_17739, float3(0.0), isnan(_17739)), level(0.0)).xyzw;
    float _6985 = _6983.x;
    float _6987 = _6983.y;
    float _6989 = _6983.z;
    float _6991 = _6983.w;
    float2 _17755 = float2(_6938, _6946);
    float3 _6995 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_17755, float2(0.0), isnan(_17755)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_17755, float2(0.0), isnan(_17755)), level(0.0)).xyz;
    float _6997 = _6995.x;
    float _6999 = _6995.y;
    float _7001 = _6995.z;
    float _7003 = _6902;
    if (!_6466)
    {
        float _7005 = rint(_6964);
        float _7007 = precise::max(_7005, 0.0);
        uint _7009 = uint(_7007);
        uint _7011 = clamp(_7009, 0u, 65535u);
        _7003 = as_type<float>(_7011);
    }
    float _7013 = _7003;
    float _7015 = _6920;
    if (!_6466)
    {
        float3 _17792 = float3(_6920, _6740, float(as_type<int>(_7013)));
        float3 _17794 = select(_17792, float3(0.0), isnan(_17792));
        float _7017 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _17794.xy, uint(rint(_17794.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _17794.xy, uint(rint(_17794.z)), level(0.0)).x;
        _7015 = _7017;
    }
    float _7019 = _7015;
    float _7021 = abs(_6340);
    float _7023 = log2(_7021);
    bool _7025 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _7027 = isnan(0.5);
    bool _7029 = _7025 || _7027;
    bool _7031 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _7033 = _7029 || _7031;
    float _7035 = _6844 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_96.x = _5964;
    out.m_96.y = _5972;
    out.m_96.z = _5958;
    float _7037 = fma(_6860, (*spvDescriptorSet0.vp_c8)._m0[6].x, _7035);
    float _7039 = fma(_6580, (*spvDescriptorSet0.vp_c8)._m0[6].z, _7037);
    if (!_7033)
    {
        _6894 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _7041 = _6894;
    float _7043 = _7023 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _7045 = exp2(_7043);
    float _7047 = _6890 * 0.5;
    float _7049 = fma(_7045, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _7051 = precise::clamp(_7049, 0.0, 1.0);
    float _7053 = _7045;
    if (!_7033)
    {
        float _7055 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _7057 = _7041 + _7055;
        _7053 = _7057;
    }
    float _7059 = _7053;
    float _7061 = fma(_6858, (*spvDescriptorSet0.vp_c8)._m0[6].w, _7039);
    float _7063 = _6788 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _7065 = fma(_7051, -2.0, 3.0);
    float _7067 = _7051 * _7051;
    float _7069 = _7061 + _6890;
    float _7071 = _6858;
    if (!_7033)
    {
        float _7073 = 1.0 / _7059;
        _7071 = _7073;
    }
    float _7075 = _7071;
    out.gl_Position.x = _6914;
    out.gl_Position.y = _6934;
    out.gl_Position.z = _7061;
    out.gl_Position.w = _6890;
    float _7077 = _7067 * _7065;
    float _7079 = _6914 + _6890;
    float _7081 = _7069 * 0.5;
    float _7083 = fma(_6934, -0.5, _7047);
    float _7085 = _7079 * 0.5;
    float _7087 = exp2(_7063);
    float _7089 = -_7077;
    float _7091 = _7089 + 1.0;
    bool _7093 = _6340 <= 8000.0;
    bool _7095 = isnan(_6340);
    bool _7097 = _7093 || _7095;
    bool _7099 = isnan(8000.0);
    bool _7101 = _7097 || _7099;
    float _7103 = float(_7101);
    float _7105 = _7091;
    if (!_7033)
    {
        float _7107 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _7109 = _6340 + _7107;
        _6372 = _7109;
    }
    float _7111 = _6372;
    out.m_98.x = _7085;
    out.m_98.y = _7083;
    out.m_98.z = _7081;
    out.m_98.w = _6890;
    float _7113 = fma(_7091, (*spvDescriptorSet0.vp_c15)._m0[654].w, _7077);
    float _7115 = _7111;
    if (_7033)
    {
        _7105 = 1.0;
    }
    float _7117 = _7105;
    float _7119 = _7117;
    if (!_7033)
    {
        float _7121 = _7111 * _7075;
        float _7123 = precise::clamp(_7121, 0.0, 1.0);
        _7119 = _7123;
    }
    float _7125 = _7119;
    float _7127 = _7103 * _7113;
    if (!_6866)
    {
        _7115 = 1.0;
    }
    float _7129 = _7115;
    float _7131 = _7127 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _7133 = -_7087;
    float _7135 = _7133 + 1.0;
    float _7137 = _7135 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _7139 = -_6942;
    float _7141 = _7139 + 1.0;
    float _7143 = _7141 * _7131;
    float _7145 = precise::clamp(_7143, 0.0, 1.0);
    float _7147 = _7131;
    float _7149 = _7129;
    float _7151 = _7145;
    if (_6466)
    {
        _7147 = 1.0;
    }
    float _7153 = _7147;
    float _7155 = _7153;
    if (_6866)
    {
        bool _7157 = _6978 >= _6940;
        bool _7159 = isnan(_6978);
        bool _7161 = _7157 || _7159;
        bool _7163 = isnan(_6940);
        bool _7165 = _7161 || _7163;
        float _7167 = float(_7165);
        _7149 = _7167;
    }
    float _7169 = _7149;
    if (!_6466)
    {
        int _7171 = _6528 << 4;
        int _7173 = _7171 + 2048;
        uint _7175 = uint(int(uint(_7173) >> uint(2)));
        uint _7177 = uint(int(uint(int(_7175)) >> uint(2)));
        int _7179 = int(_7175) & 3;
        float _7181 = (*spvDescriptorSet0.vp_c15)._m0[int(_7177)][_7179];
        int _7183 = int(_7175) + 1;
        uint _7185 = uint(int(uint(_7183) >> uint(2)));
        int _7187 = _7183 & 3;
        float _7189 = (*spvDescriptorSet0.vp_c15)._m0[int(_7185)][_7187];
        int _7191 = _7173 + 8;
        uint _7193 = uint(int(uint(_7191) >> uint(2)));
        uint _7195 = uint(int(uint(int(_7193)) >> uint(2)));
        int _7197 = int(_7193) & 3;
        float _7199 = (*spvDescriptorSet0.vp_c15)._m0[int(_7195)][_7197];
        int _7201 = int(_7193) + 1;
        uint _7203 = uint(int(uint(_7201) >> uint(2)));
        int _7205 = _7201 & 3;
        float _7207 = (*spvDescriptorSet0.vp_c15)._m0[int(_7203)][_7205];
        float _7209 = _6300 * _7189;
        float _7211 = fma(_5964, _7181, _7209);
        float _7213 = fma(_5958, _7199, _7211);
        float _7215 = _7213 + _7207;
        float _7217 = precise::clamp(_7215, 0.0, 1.0);
        float _7219 = -_7217;
        float _7221 = _7219 + _7019;
        float _7223 = fma(_7221, 500.0, 1.5);
        float _7225 = exp2(_7223);
        float _7227 = 0.0 + _7225;
        float _7229 = precise::clamp(_7227, 0.0, 1.0);
        _7155 = _7229;
        _6950 = 500.0;
    }
    float _7231 = _7155;
    float _7233 = _6950;
    float _7235 = _7137 * _6980;
    float _7237 = _7169 * _7231;
    float _7239 = -_7145;
    float _7241 = fma(_7239, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _7243 = -_7137;
    float _7245 = _7243 + 1.0;
    float _7247 = _6991 * _7235;
    float _7249 = _7001 * _7235;
    float _7251 = -_7237;
    float _7253 = fma(_7251, _7241, 1.0);
    float _7255 = precise::clamp(_7253, 0.0, 1.0);
    float _7257 = _6991 * _7245;
    float _7259 = fma(_6997, _7247, _6985);
    float _7261 = fma(_6999, _7247, _6987);
    float _7263 = _7255 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _7265 = fma(_6991, _7249, _6989);
    out.m_100.x = _6240;
    out.m_100.y = _6238;
    out.m_100.z = _6242;
    bool _7267 = _6618 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _7269 = isnan(_6618);
    bool _7271 = _7267 || _7269;
    bool _7273 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _7275 = _7271 || _7273;
    float _7277 = _7125 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_102.x = _7263;
    out.m_104.x = _7259;
    out.m_104.y = _7261;
    out.m_104.z = _7265;
    out.m_104.w = _7257;
    float _7279 = _7241;
    float _7281 = _7245;
    float _7283 = _7233;
    float _7285 = _7255;
    if (!_7275)
    {
        _6952 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _7287 = _6952;
    float _7289 = _7287;
    float _7291 = _7287;
    if (!_7275)
    {
        _7151 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _7293 = _7151;
    float _7295 = _7293;
    float _7297 = _7293;
    if (!_7275)
    {
        _7279 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _7299 = _7279;
    float _7301 = _7299;
    float _7303 = _7299;
    if (!_7275)
    {
        _7281 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _7305 = _7281;
    float _7307 = _7305;
    float _7309 = _7305;
    if (!_7275)
    {
        _7283 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _7311 = _7283;
    float _7313 = _7311;
    float _7315 = _7311;
    if (!_7275)
    {
        _7285 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _7317 = _7285;
    bool _7319 = !_7275;
    float _7321 = _7317;
    float _7323 = _7317;
    if (!_7319)
    {
        bool _7325 = _6618 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _7327 = isnan(_6618);
        bool _7329 = _7325 || _7327;
        bool _7331 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _7333 = _7329 || _7331;
        if (!_7333)
        {
            float _7335 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _7337 = _6618 + _7335;
            float _7339 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _7341 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _7339;
            float _7343 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _7345 = _7343 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _7347 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _7349 = _7347 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _7351 = 1.0 / _7341;
            float _7353 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _7355 = _7353 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _7357 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _7359 = _7357 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _7361 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _7363 = _7361 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _7365 = _7337 * _7351;
            float _7367 = precise::clamp(_7365, 0.0, 1.0);
            float _7369 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _7371 = _7369 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _7373 = fma(_7367, _7345, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _7375 = fma(_7367, _7349, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _7377 = fma(_7367, _7371, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _7379 = fma(_7367, _7355, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _7381 = fma(_7367, _7359, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _7383 = fma(_7367, _7363, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _7315 = _7373;
            _7297 = _7381;
            _7309 = _7375;
            _7291 = _7379;
            _7323 = _7377;
            _7303 = _7383;
            _7385 = true;
        }
        else
        {
            bool _7387 = _6618 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _7389 = isnan(_6618);
            bool _7391 = _7387 || _7389;
            bool _7393 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _7395 = _7391 || _7393;
            if (!_7395)
            {
                _7289 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _7397 = _7289;
            _7291 = _7397;
            if (!_7395)
            {
                _7295 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _7399 = _7295;
            _7297 = _7399;
            if (!_7395)
            {
                _7301 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _7401 = _7301;
            _7303 = _7401;
            if (!_7395)
            {
                _7307 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _7403 = _7307;
            _7309 = _7403;
            if (!_7395)
            {
                _7313 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _7405 = _7313;
            _7315 = _7405;
            if (!_7395)
            {
                _7321 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _7407 = _7321;
            bool _7409 = !_7395;
            _7323 = _7407;
            if (!_7409)
            {
                bool _7411 = _6618 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _7413 = isnan(_6618);
                bool _7415 = _7411 || _7413;
                bool _7417 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _7419 = _7415 || _7417;
                if (!_7419)
                {
                    float _7421 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _7423 = _6618 + _7421;
                    float _7425 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _7427 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _7425;
                    float _7429 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _7431 = _7429 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _7433 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _7435 = _7433 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _7437 = 1.0 / _7427;
                    float _7439 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _7441 = _7439 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _7443 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _7445 = _7443 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _7447 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _7449 = _7447 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _7451 = _7423 * _7437;
                    float _7453 = precise::clamp(_7451, 0.0, 1.0);
                    float _7455 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _7457 = _7455 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _7459 = fma(_7453, _7431, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _7461 = fma(_7453, _7435, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _7463 = fma(_7453, _7457, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _7465 = fma(_7453, _7441, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _7467 = fma(_7453, _7445, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _7469 = fma(_7453, _7449, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _7315 = _7459;
                    _7297 = _7467;
                    _7309 = _7461;
                    _7291 = _7465;
                    _7323 = _7463;
                    _7303 = _7469;
                    _7385 = true;
                }
                else
                {
                    _7315 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _7297 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _7309 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _7291 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _7323 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _7303 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _7385 = false;
    float _7471 = _7315;
    float _7473 = _7297;
    float _7475 = _7309;
    float _7477 = _7291;
    float _7479 = _7323;
    float _7481 = _7303;
    float _7483 = _7277 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _7485 = fma(_5944, -0.5, 0.5);
    float _7487 = precise::clamp(_7485, 0.0, 1.0);
    float _7489 = -_7471;
    float _7491 = _7473 + _7489;
    float _7493 = -_7475;
    float _7495 = _7477 + _7493;
    out.m_59.x = _7483;
    float _7497 = fma(_7487, _7491, _7471);
    float _7499 = -_7479;
    float _7501 = _7481 + _7499;
    float _7503 = fma(_7487, _7495, _7475);
    float _7505 = _7497 * 0.586610972881317138671875;
    bool _7507 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _7509 = fma(_7487, _7501, _7479);
    out.m_106.x = 0.0;
    float _7511 = fma(_7503, 0.298911988735198974609375, _7505);
    bool _7513 = _7125 > 0.0;
    bool _7515 = isnan(_7125);
    bool _7517 = _7513 || _7515;
    bool _7519 = isnan(0.0);
    bool _7521 = _7517 || _7519;
    float _7523 = fma(_7509, 0.114477999508380889892578125, _7511);
    float _7525 = -_7523;
    float _7527 = _7503 + _7525;
    float _7529 = -_7523;
    float _7531 = _7497 + _7529;
    float _7533 = -_7523;
    float _7535 = _7509 + _7533;
    float _7537 = fma(_7527, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7523);
    float _7539 = fma(_7531, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7523);
    float _7541 = fma(_7535, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7523);
    bool _7543 = !_7507;
    if (!_7543)
    {
        float _7545 = -_6238;
        float _7547 = _7545 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _7549 = -_6240;
        float _7551 = _7549 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _7553 = -_6242;
        float _7555 = _7553 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _7557 = _7547 * _7547;
        float _7559 = fma(_7551, _7551, _7557);
        float _7561 = fma(_7555, _7555, _7559);
        float _7563 = sqrt(_7561);
        float _7565 = rsqrt(_7561);
        float _7567 = -_7563;
        float _7569 = _7567 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _7571 = _7569 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _7573 = precise::clamp(_7571, 0.0, 1.0);
        float _7575 = _7551 * _7565;
        float _7577 = _7547 * _7565;
        float _7579 = abs(_7573);
        float _7581 = log2(_7579);
        float _7583 = _7555 * _7565;
        float _7585 = _7575 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _7587 = _5944 * _7577;
        float _7589 = -_7577;
        float _7591 = -_7585;
        float _7593 = fma(_7589, (*spvDescriptorSet0.vp_c15)._m0[656].y, _7591);
        float _7595 = fma(_5942, _7575, _7587);
        float _7597 = -_7583;
        float _7599 = fma(_7597, (*spvDescriptorSet0.vp_c15)._m0[656].z, _7593);
        float _7601 = fma(_5946, _7583, _7595);
        float _7603 = precise::clamp(_7601, 0.0, 1.0);
        float _7605 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _7607 = _7599 + _7605;
        float _7609 = _7581 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _7611 = _7607 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _7613 = precise::clamp(_7611, 0.0, 1.0);
        float _7615 = exp2(_7609);
        float _7617 = _7615 * _7613;
        float _7619 = _7603 * _7617;
        float _7621 = _7619 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _7623 = _7619 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _7625 = _7619 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_106.x = _7621;
        out.m_106.y = _7623;
        out.m_106.z = _7625;
    }
    out.m_74.x = _7537;
    out.m_74.y = _7539;
    out.m_74.z = _7541;
    if (_7521)
    {
        return out;
    }
    out.m_59.x = 0.0;
    float _7627 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _7627;
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
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _7385 = false;
    bool _1341 = false;
    bool _1183 = false;
    bool _1041 = false;
    bool _763 = false;
    bool _515 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _120 = in.m_56.w;
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
        out.m_59.x = 0.0;
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
        float _7684 = as_type<float>(_141);
        out.gl_Position.z = _7684;
    }
    if (!_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = in.m_61.w;
    bool _147 = _145 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _149 = isnan(_145);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _155 = _151 || _153;
    float _157 = -_145;
    float _159 = _157 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _161 = 0.0;
    if (_155)
    {
        float _163 = float(_125);
        _161 = _163;
    }
    float _165 = _161;
    bool _167 = _159 >= _165;
    bool _169 = !_155;
    bool _171 = _167 || _169;
    if (_171)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _173 = _135;
    if (_171)
    {
        out.m_59.x = 0.0;
    }
    if (_171)
    {
        float _175 = _173 * 5.0;
        _143 = as_type<int>(_175);
    }
    int _177 = _143;
    if (_171)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7752 = as_type<float>(_177);
        out.gl_Position.z = _7752;
    }
    if (_171)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _179 = as_type<float>(int(gl_VertexIndex));
    float _181 = _159 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _183 = in.m_66.w;
    bool _185 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _187 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _189 = _185 || _187;
    bool _191 = isnan(1.0);
    bool _193 = _189 || _191;
    float _195 = in.m_61.x;
    float _197 = in.m_61.y;
    float _199 = in.m_61.z;
    float _201 = in.m_56.x;
    float _203 = in.m_56.y;
    float _205 = in.m_56.z;
    float _207 = 0.0;
    float _209 = _181;
    if (!_193)
    {
        float _211 = _181 * _181;
        float _213 = _211 * 0.5;
        _207 = _213;
    }
    float _215 = _207;
    float _217 = _215;
    if (!_193)
    {
        float _219 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _217 = _219;
    }
    float _221 = _217;
    int _223 = as_type<int>(_179) & 1;
    bool _225 = _223 != 0;
    int _227 = as_type<int>(_179) & 2;
    bool _229 = _227 != 0;
    int _231 = int(_225);
    int _233 = _229 ? 2 : 0;
    int _235 = _231 | _233;
    int _237 = _193 ? 4 : 0;
    int _239 = _235 | _237;
    int _241 = false ? 8 : 0;
    int _243 = _239 | _241;
    int _245 = false ? 16 : 0;
    int _247 = _243 | _245;
    int _249 = false ? 32 : 0;
    int _251 = _247 | _249;
    int _253 = false ? 64 : 0;
    int _255 = _251 | _253;
    int _257 = _255 & 4;
    bool _259 = !_225;
    float _261 = _259 ? (-0.5) : 0.5;
    bool _263 = !_229;
    float _265 = _263 ? (-0.5) : 0.5;
    bool _267 = !_193;
    float _269 = 0.0;
    float _271 = _221;
    float _273 = as_type<float>(_257);
    bool _275 = _193;
    if (!_267)
    {
        float _277 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _279 = log2(_277);
        float _281 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _283 = _281 + 1.0;
        float _285 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _287 = _181 * _279;
        float _289 = 1.0 / _283;
        float _291 = _285 * 0.693147182464599609375;
        float _293 = exp2(_287);
        float _295 = 1.0 / _291;
        float _297 = _293 + (-1.0);
        float _299 = -_297;
        float _301 = fma(_299, _295, _181);
        float _303 = _301 * _289;
        float _305 = _303 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _269 = _293;
        _271 = _305;
        _273 = _295;
    }
    float _307 = _269;
    float _309 = _271;
    float _311 = _273;
    bool _313 = !_193;
    float _315 = _307;
    float _317 = _311;
    if (!_313)
    {
        float _319 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _321 = log2(_319);
        float _323 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _325 = _323 + 1.0;
        float _327 = 1.0 / _325;
        float _329 = _181 * _321;
        float _331 = exp2(_329);
        float _333 = -_331;
        float _335 = _333 + 1.0;
        float _337 = _335 * _327;
        _315 = _331;
        _317 = _325;
        _209 = _337;
    }
    float _339 = _315;
    float _341 = _317;
    float _343 = _209;
    float _345 = _339;
    float _347 = _341;
    if (!_193)
    {
        float _349 = _159 * _159;
        float _351 = _349 * 0.5;
        _345 = _351;
    }
    float _353 = _345;
    float _355 = _353;
    if (!_193)
    {
        _347 = _159;
    }
    float _357 = _347;
    float _359 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _361 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _363 = _357;
    if (!_193)
    {
        float _365 = _353 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _355 = _365;
    }
    float _367 = _355;
    bool _369 = !_193;
    float _371 = _367;
    if (!_369)
    {
        float _373 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _375 = log2(_373);
        float _377 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _379 = _377 + 1.0;
        float _381 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _383 = _159 * _375;
        float _385 = 1.0 / _379;
        float _387 = _381 * 0.693147182464599609375;
        float _389 = exp2(_383);
        float _391 = 1.0 / _387;
        float _393 = _389 + (-1.0);
        float _395 = -_393;
        float _397 = fma(_395, _391, _159);
        float _399 = _397 * _385;
        float _401 = _399 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _371 = _401;
    }
    float _403 = _371;
    bool _405 = !_193;
    if (!_405)
    {
        float _407 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _409 = log2(_407);
        float _411 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _413 = _411 + 1.0;
        float _415 = 1.0 / _413;
        float _417 = _159 * _409;
        float _419 = exp2(_417);
        float _421 = -_419;
        float _423 = _421 + 1.0;
        float _425 = _423 * _415;
        _363 = _425;
    }
    float _427 = _363;
    float _429 = fma(_343, _195, _359);
    float _431 = _403 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _433 = _403 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _435 = _403 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _437 = fma(_343, _197, _361);
    float _439 = fma(_427, _197, _431);
    float _441 = fma(_427, _195, _433);
    float _443 = fma(_427, _199, _435);
    bool _445 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _447 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _449 = fma(_437, _183, _203);
    float _451 = -_439;
    float _453 = _437 + _451;
    float _455 = fma(_429, _183, _201);
    float _457 = fma(_343, _199, _447);
    float _459 = -_441;
    float _461 = _429 + _459;
    float _463 = _453 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _465 = _453 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _467 = _453 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _469 = -_443;
    float _471 = _457 + _469;
    float _473 = fma(_461, (*spvDescriptorSet0.vp_c10)._m0[4].x, _463);
    float _475 = fma(_461, (*spvDescriptorSet0.vp_c10)._m0[5].x, _465);
    float _477 = fma(_461, (*spvDescriptorSet0.vp_c10)._m0[6].x, _467);
    float _479 = fma(_457, _183, _205);
    float _481 = fma(_471, (*spvDescriptorSet0.vp_c10)._m0[4].z, _473);
    float _483 = fma(_471, (*spvDescriptorSet0.vp_c10)._m0[5].z, _475);
    float _485 = fma(_471, (*spvDescriptorSet0.vp_c10)._m0[6].z, _477);
    bool _487 = !_445;
    float _489 = _483;
    float _491 = _481;
    float _493 = _485;
    float _495 = _485;
    float _513;
    if (!_487)
    {
        float _497 = in.m_68.x;
        float _499 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _501 = _497 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _503 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[12].x, _159);
        float _505 = _503 * _499;
        float _507 = floor(_505);
        float _509 = -_507;
        float _511 = _505 + _509;
        _513 = _511;
        _515 = true;
    }
    else
    {
        float _517 = float(_125);
        float _519 = 1.0 / _517;
        float _521 = _159 * _519;
        _513 = _521;
    }
    _515 = false;
    float _523 = _513;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _527 = _523 + _525;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _531 = _523 + _529;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _533;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _539 = _537 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _541;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _549 = in.m_66.x;
    float _551 = in.m_66.y;
    float _553 = 1.0 / _535;
    bool _555 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _557 = isnan(_523);
    bool _559 = _555 || _557;
    bool _561 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _563 = _559 || _561;
    float _565 = float(_563);
    bool _567 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _569 = 1.0 / _539;
    float _571 = 1.0 / _543;
    float _573 = _527 * _553;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _577 = _523 + _575;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _581 = _523 + _579;
    float _583 = 1.0 / _547;
    float _585 = _531 * _569;
    bool _587 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _589 = isnan(_523);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _595 = _591 || _593;
    float _597 = float(_595);
    float _599 = -_565;
    float _601 = _599 + 1.0;
    float _603 = _597 * _601;
    float _605 = _577 * _571;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _607;
    bool _611 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _613 = isnan(_523);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _619 = _615 || _617;
    float _621 = float(_619);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _625 = _623 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _627 = fma(_609, _573, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _629 = fma(_625, _585, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _631 = _581 * _583;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _633;
    bool _637 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _639 = isnan(_523);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _645 = _641 || _643;
    float _647 = float(_645);
    bool _649 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _651 = isnan(_523);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = fma(_635, _573, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _663 = -_597;
    float _665 = _663 + 1.0;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _669 = _667 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _671 = _647 * _665;
    float _673 = -_647;
    float _675 = _673 + 1.0;
    float _677 = fma(_669, _585, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _679 = _621 * _675;
    float _681 = -_621;
    float _683 = _681 + 1.0;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _685;
    float _689 = _659 * _683;
    float _691 = -_659;
    float _693 = _691 + 1.0;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _695;
    float _699 = fma(_687, _605, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _701 = _627 * _689;
    float _703 = _661 * _689;
    float _705 = fma(_697, _605, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _711 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[143].x, _701);
    float _713 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[143].y, _703);
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _717 = _715 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _719 = fma(_709, _631, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _721 = fma(_677, _679, _711);
    float _723 = fma(_629, _679, _713);
    float _725 = fma(_717, _631, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _727 = fma(_705, _671, _721);
    float _729 = fma(_699, _671, _723);
    float _731 = fma(_719, _603, _727);
    float _733 = fma(_725, _603, _729);
    float _735 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[147].x, _731);
    float _737 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[147].y, _733);
    float _739 = _735 * _549;
    float _741 = _737 * _551;
    bool _743 = !_567;
    float _761;
    if (!_743)
    {
        float _745 = in.m_68.x;
        float _747 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _749 = _745 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _751 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[11].x, _159);
        float _753 = _751 * _747;
        float _755 = floor(_753);
        float _757 = -_755;
        float _759 = _753 + _757;
        _761 = _759;
        _763 = true;
    }
    else
    {
        float _765 = float(_125);
        float _767 = 1.0 / _765;
        float _769 = _159 * _767;
        _761 = _769;
    }
    _763 = false;
    float _771 = _761;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _775 = _771 + _773;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _779 = _771 + _777;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _783 = _771 + _781;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _785;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _793;
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _799 = _797 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _801 = 1.0 / _787;
    bool _803 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _805 = 1.0 / _791;
    bool _807 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _809 = isnan(_771);
    bool _811 = _807 || _809;
    bool _813 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _815 = _811 || _813;
    float _817 = float(_815);
    float _819 = 1.0 / _795;
    float _821 = _779 * _801;
    bool _823 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _825 = isnan(_771);
    bool _827 = _823 || _825;
    bool _829 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _831 = _827 || _829;
    float _833 = float(_831);
    float _835 = 1.0 / _799;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _839 = _771 + _837;
    float _841 = _839 * _805;
    bool _843 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _845 = isnan(_771);
    bool _847 = _843 || _845;
    bool _849 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _851 = _847 || _849;
    float _853 = float(_851);
    float _855 = _775 * _819;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _857;
    float _861 = -_853;
    float _863 = _861 + 1.0;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _865;
    float _869 = _817 * _863;
    float _871 = _783 * _835;
    bool _873 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _875 = isnan(_771);
    bool _877 = _873 || _875;
    bool _879 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _881 = _877 || _879;
    float _883 = float(_881);
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _885;
    float _889 = -_817;
    float _891 = _889 + 1.0;
    bool _893 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _895 = isnan(_771);
    bool _897 = _893 || _895;
    bool _899 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _901 = _897 || _899;
    float _903 = float(_901);
    float _905 = fma(_867, _855, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _907 = -_883;
    float _909 = _907 + 1.0;
    float _911 = fma(_859, _855, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _913 = fma(_887, _855, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _915 = _883 * _891;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _919 = _917 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _921 = _903 * _909;
    float _923 = -_903;
    float _925 = _923 + 1.0;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _929 = _927 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _933 = _931 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _935 = fma(_919, _871, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _937 = _833 * _925;
    float _939 = fma(_929, _871, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _941 = fma(_933, _871, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _943 = -_833;
    float _945 = _943 + 1.0;
    float _947 = _905 * _937;
    float _949 = _911 * _937;
    float _951 = _913 * _937;
    float _953 = fma(_945, (*spvDescriptorSet0.vp_c9)._m0[107].x, _947);
    float _955 = fma(_945, (*spvDescriptorSet0.vp_c9)._m0[107].y, _949);
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _957;
    float _961 = fma(_945, (*spvDescriptorSet0.vp_c9)._m0[107].z, _951);
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _963;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _967;
    float _971 = fma(_939, _921, _953);
    float _973 = fma(_941, _921, _955);
    float _975 = fma(_935, _921, _961);
    float _977 = fma(_965, _821, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _979 = fma(_959, _821, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _981 = fma(_969, _821, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _985 = _983 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _987 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _989 = _987 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _993 = _991 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _995 = fma(_977, _915, _971);
    float _997 = fma(_985, _841, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _999 = fma(_989, _841, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _1001 = fma(_993, _841, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _1003 = fma(_979, _915, _973);
    float _1005 = fma(_981, _915, _975);
    float _1007 = fma(_997, _869, _995);
    float _1009 = fma(_999, _869, _1003);
    float _1011 = fma(_1001, _869, _1005);
    float _1013 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[111].x, _1007);
    float _1015 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[111].y, _1009);
    float _1017 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[111].z, _1011);
    bool _1019 = !_803;
    int _1021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _1039;
    if (!_1019)
    {
        float _1023 = in.m_68.x;
        float _1025 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1027 = _1023 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1029 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[11].y, _159);
        float _1031 = _1029 * _1025;
        float _1033 = floor(_1031);
        float _1035 = -_1033;
        float _1037 = _1031 + _1035;
        _1039 = _1037;
        _1041 = true;
    }
    else
    {
        float _1043 = float(_125);
        float _1045 = 1.0 / _1043;
        float _1047 = _159 * _1045;
        _1039 = _1047;
    }
    _1041 = false;
    float _1049 = _1039;
    float _1051 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1053 = _1049 + _1051;
    float _1055 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1057 = _1055 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1059 = _1049 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1061 = isnan(_1049);
    bool _1063 = _1059 || _1061;
    bool _1065 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1067 = _1063 || _1065;
    float _1069 = float(_1067);
    float _1071 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1073 = _1071 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1075 = _1049 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1077 = isnan(_1049);
    bool _1079 = _1075 || _1077;
    bool _1081 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1083 = _1079 || _1081;
    float _1085 = float(_1083);
    float _1087 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1089 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1087;
    bool _1091 = _1049 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1093 = isnan(_1049);
    bool _1095 = _1091 || _1093;
    bool _1097 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1099 = _1095 || _1097;
    float _1101 = float(_1099);
    float _1103 = 1.0 / _1057;
    float _1105 = -_1069;
    float _1107 = _1105 + 1.0;
    bool _1109 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1111 = 1.0 / _1073;
    float _1113 = _1089 * _1103;
    float _1115 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1117 = _1115 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1119 = fma(_1113, _1053, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1121 = _1085 * _1107;
    float _1123 = -_1101;
    float _1125 = _1123 + 1.0;
    float _1127 = -_1085;
    float _1129 = _1127 + 1.0;
    float _1131 = _1117 * _1111;
    float _1133 = _1119 * _1121;
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1137 = _1049 + _1135;
    float _1139 = _1069 * _1125;
    float _1141 = _1013 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1143 = fma(_1129, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1133);
    float _1145 = fma(_1131, _1137, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1147 = _1017 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1149 = _1141 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1151 = fma(_1145, _1139, _1143);
    float _1153 = _1015 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1155 = _1147 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1157 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1151);
    float _1159 = _1153 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1161 = _1157 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_70.x = _1149;
    out.m_70.y = _1159;
    out.m_70.z = _1155;
    out.m_70.w = _1161;
    bool _1163 = !_1109;
    float _1181;
    if (!_1163)
    {
        float _1165 = in.m_68.x;
        float _1167 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1169 = _1165 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1171 = fma(_1169, (*spvDescriptorSet0.vp_c9)._m0[11].w, _159);
        float _1173 = _1171 * _1167;
        float _1175 = floor(_1173);
        float _1177 = -_1175;
        float _1179 = _1173 + _1177;
        _1181 = _1179;
        _1183 = true;
    }
    else
    {
        float _1185 = float(_125);
        float _1187 = 1.0 / _1185;
        float _1189 = _159 * _1187;
        _1181 = _1189;
    }
    _1183 = false;
    float _1191 = _1181;
    float _1193 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1195 = _1191 + _1193;
    float _1197 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1199 = _1197 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1201 = _1191 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1203 = isnan(_1191);
    bool _1205 = _1201 || _1203;
    bool _1207 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1209 = _1205 || _1207;
    float _1211 = float(_1209);
    float _1213 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1215 = _1213 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1217 = _1191 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1219 = isnan(_1191);
    bool _1221 = _1217 || _1219;
    bool _1223 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1225 = _1221 || _1223;
    float _1227 = float(_1225);
    float _1229 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1231 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1229;
    bool _1233 = _1191 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1235 = isnan(_1191);
    bool _1237 = _1233 || _1235;
    bool _1239 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1241 = _1237 || _1239;
    float _1243 = float(_1241);
    float _1245 = 1.0 / _1199;
    float _1247 = -_1211;
    float _1249 = _1247 + 1.0;
    bool _1251 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1253 = 1.0 / _1215;
    float _1255 = _1231 * _1245;
    float _1257 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1259 = _1257 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1261 = fma(_1255, _1195, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1263 = _1227 * _1249;
    float _1265 = -_1243;
    float _1267 = _1265 + 1.0;
    float _1269 = -_1227;
    float _1271 = _1269 + 1.0;
    float _1273 = _1259 * _1253;
    float _1275 = _1261 * _1263;
    float _1277 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1279 = _1191 + _1277;
    float _1281 = _1211 * _1267;
    float _1283 = fma(_1271, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1275);
    float _1285 = fma(_1273, _1279, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1287 = fma(_1285, _1281, _1283);
    float _1289 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1291 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1295 = fma(_1243, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1287);
    float _1297 = _1289 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1299 = _1291 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1301 = _1293 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1303 = _1295 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_72.x = _1297;
    out.m_72.y = _1299;
    out.m_72.z = _1301;
    out.m_72.w = _1303;
    bool _1305 = !_1251;
    float _1307 = _1303;
    float _1309 = _1301;
    float _1311 = (*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1313 = _1295;
    float _1315 = _1275;
    bool _1317 = _1251;
    float _1335;
    float _1337;
    float _1339;
    if (!_1305)
    {
        float _1319 = in.m_68.x;
        float _1321 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1323 = _1319 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1325 = fma(_1323, (*spvDescriptorSet0.vp_c9)._m0[14].x, _159);
        float _1327 = _1325 * _1321;
        float _1329 = floor(_1327);
        float _1331 = -_1329;
        float _1333 = _1327 + _1331;
        _1335 = _1321;
        _1337 = _1327;
        _1339 = _1333;
        _1341 = true;
    }
    else
    {
        float _1343 = float(_125);
        float _1345 = 1.0 / _1343;
        float _1347 = _159 * _1345;
        _1335 = _1343;
        _1337 = _1345;
        _1339 = _1347;
    }
    _1341 = false;
    float _1349 = _1335;
    float _1351 = _1337;
    float _1353 = _1339;
    float _1355 = in.m_68.w;
    int _1357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1359 = _1357 != 0;
    int _1361 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1363 = _1361 != 0;
    int _1365 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _1367 = _1365 != 0;
    int _1369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1371 = _1369 != 0;
    int _1373 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1375 = _1373 != 0;
    float _1377 = _1349;
    int _1379 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_1359)
    {
        float _1381 = in.m_68.x;
        _1377 = _1381;
    }
    float _1383 = _1377;
    float _1385 = 0.0;
    if (!_1359)
    {
        _1385 = _265;
    }
    float _1387 = _1385;
    float _1389 = _1351;
    float _1391 = _1387;
    if (_1363)
    {
        float _1393 = in.m_68.z;
        _1389 = _1393;
    }
    float _1395 = _1389;
    if (!_1363)
    {
        _1307 = _261;
    }
    float _1397 = _1307;
    float _1399 = 0.0;
    float _1401 = _1397;
    if (_1375)
    {
        _1399 = 1.0;
    }
    float _1403 = _1399;
    float _1405 = _1403;
    if (!_1367)
    {
        _1309 = _265;
    }
    float _1407 = _1309;
    float _1409 = _1293;
    float _1411 = _1407;
    if (_1367)
    {
        float _1413 = in.m_68.w;
        _1409 = _1413;
    }
    float _1415 = _1409;
    float _1417 = 0.0;
    if (_1375)
    {
        _1417 = 1.0;
    }
    float _1419 = _1417;
    float _1421 = 0.0;
    float _1423 = _1419;
    if (_1375)
    {
        _1421 = 1.0;
    }
    float _1425 = _1421;
    int _1427 = 0;
    float _1429 = _1425;
    if (_1375)
    {
        _1427 = 0;
    }
    int _1431 = _1427;
    int _1433 = _1431;
    if (_1375)
    {
        _1379 = 0;
    }
    int _1435 = _1379;
    float _1437 = _1383;
    int _1439 = _1435;
    if (_1359)
    {
        float _1441 = _1383 * 3.1415927410125732421875;
        _1437 = _1441;
    }
    float _1443 = _1437;
    float _1445 = _1443;
    if (_1359)
    {
        float _1447 = _1443 * 0.15915493667125701904296875;
        _1311 = _1447;
    }
    float _1449 = _1311;
    if (_1363)
    {
        float _1451 = _1395 * 3.1415927410125732421875;
        _1445 = _1451;
    }
    float _1453 = _1445;
    if (_1367)
    {
        float _1455 = _1415 * 3.1415927410125732421875;
        _1313 = _1455;
    }
    float _1457 = _1313;
    float _1459 = _1457;
    if (_1363)
    {
        float _1461 = _1453 * 0.15915493667125701904296875;
        _1315 = _1461;
    }
    float _1463 = _1315;
    float _1465 = _1449;
    if (_1359)
    {
        float _1467 = _1449 * 6.283185482025146484375;
        float _1469 = sin(_1467);
        _1465 = _1469;
    }
    float _1471 = _1465;
    float _1473 = _1453;
    float _1475 = _1395;
    float _1477 = _1415;
    if (_1375)
    {
        float _1479 = in.m_68.x;
        float _1481 = in.m_68.y;
        float _1483 = in.m_68.z;
        _1473 = _1479;
        _1475 = _1481;
        _1477 = _1483;
    }
    float _1485 = _1473;
    float _1487 = _1475;
    float _1489 = _1477;
    if (_1367)
    {
        float _1491 = _1457 * 0.15915493667125701904296875;
        _1459 = _1491;
    }
    float _1493 = _1459;
    float _1495 = _1493;
    if (_1367)
    {
        float _1497 = _1493 * 6.283185482025146484375;
        float _1499 = sin(_1497);
        _1495 = _1499;
    }
    float _1501 = _1495;
    float _1503 = _1463;
    if (_1363)
    {
        float _1505 = _1463 * 6.283185482025146484375;
        float _1507 = sin(_1505);
        _1503 = _1507;
    }
    float _1509 = _1503;
    float _1511 = _1471;
    if (_1359)
    {
        bool _1513 = _1471 > 0.5;
        _1317 = _1513;
    }
    bool _1515 = _1317;
    bool _1517 = _1515;
    if (_1359)
    {
        float _1519 = -_265;
        float _1521 = _1515 ? _1519 : _265;
        _1391 = _1521;
    }
    float _1523 = _1391;
    float _1525 = _1487;
    float _1527 = _1489;
    float _1529 = _1485;
    if (_1375)
    {
        _1511 = _1485;
    }
    float _1531 = _1511;
    float _1533 = _1501;
    float _1535 = _1531;
    if (_1367)
    {
        bool _1537 = _1501 > 0.5;
        _1517 = _1537;
    }
    bool _1539 = _1517;
    int _1541 = int(_1539);
    int _1543 = _1367 ? 2 : 0;
    int _1545 = _1541 | _1543;
    int _1547 = _193 ? 4 : 0;
    int _1549 = _1545 | _1547;
    int _1551 = _1363 ? 8 : 0;
    int _1553 = _1549 | _1551;
    int _1555 = _1375 ? 16 : 0;
    int _1557 = _1553 | _1555;
    int _1559 = _1371 ? 32 : 0;
    int _1561 = _1557 | _1559;
    int _1563 = false ? 64 : 0;
    int _1565 = _1561 | _1563;
    int _1567 = _1565 & 32;
    if (_1375)
    {
        _1533 = _1531;
    }
    float _1569 = _1533;
    float _1571 = _1569;
    if (_1363)
    {
        bool _1573 = _1509 > 0.5;
        _275 = _1573;
    }
    bool _1575 = _275;
    int _1577 = 0;
    if (_1375)
    {
        _1577 = as_type<int>(_1531);
    }
    int _1579 = _1577;
    int _1581 = _1579;
    if (_1375)
    {
        _1021 = as_type<int>(_1487);
    }
    int _1583 = _1021;
    int _1585 = 0;
    int _1587 = _1583;
    if (_1375)
    {
        _1585 = as_type<int>(_1489);
    }
    int _1589 = _1585;
    int _1591 = _1589;
    if (!_1375)
    {
        float _1593 = in.m_68.x;
        float _1595 = in.m_68.y;
        float _1597 = in.m_68.z;
        float _1599 = _1593 * 3.1415927410125732421875;
        float _1601 = _1599 * 0.15915493667125701904296875;
        float _1603 = _1595 * 3.1415927410125732421875;
        float _1605 = _1603 * 0.15915493667125701904296875;
        float _1607 = _1597 * 3.1415927410125732421875;
        float _1609 = _1601 * 6.283185482025146484375;
        float _1611 = sin(_1609);
        float _1613 = _1607 * 0.15915493667125701904296875;
        float _1615 = _1605 * 6.283185482025146484375;
        float _1617 = sin(_1615);
        float _1619 = _1613 * 6.283185482025146484375;
        float _1621 = sin(_1619);
        _1525 = _1595;
        _1571 = _1597;
        _1429 = 5.839270114898681640625;
        _1527 = _1597;
        _1529 = _1593;
        _1405 = 7.345489978790283203125;
        _1535 = _1595;
        _1423 = 1.2345600128173828125;
        _1439 = 2;
        _1433 = 1;
        _1587 = as_type<int>(_1617);
        _1581 = as_type<int>(_1611);
        _1591 = as_type<int>(_1621);
    }
    float _1623 = _1525;
    float _1625 = _1571;
    float _1627 = _1429;
    float _1629 = _1527;
    float _1631 = _1529;
    float _1633 = _1405;
    float _1635 = _1535;
    float _1637 = _1423;
    int _1639 = _1439;
    int _1641 = _1433;
    int _1643 = _1587;
    int _1645 = _1581;
    int _1647 = _1591;
    float _1649 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1651 = int(_1649);
    int _1653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1655 = _1653 != 0;
    bool _1657 = _1623 > 0.5;
    float _1659 = _1625 * _1627;
    float _1661 = _1623 + _1629;
    if (_1363)
    {
        float _1663 = -_261;
        float _1665 = _1575 ? _1663 : _261;
        _1401 = _1665;
    }
    float _1667 = _1401;
    float _1669 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1671 = int(_1669);
    if (_1367)
    {
        float _1673 = -_265;
        float _1675 = _1539 ? _1673 : _265;
        _1411 = _1675;
    }
    float _1677 = _1411;
    float _1679 = _1623 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1681 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1683 = _1681 != 0;
    int _1685 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1687 = _1685 != 0;
    int _1689 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1691 = _1689 != 0;
    float _1693 = _1661 + (-1.0);
    int _1695 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1697 = _1695 != 0;
    int _1699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1701 = _1699 != 0;
    bool _1703 = _1629 > 0.5;
    float _1705 = float(_1651);
    float _1707 = -_261;
    int _1709 = _1657 ? as_type<int>(_1707) : as_type<int>(_261);
    bool _1711 = !_1697;
    int _1713 = _1711 ? 0 : 1;
    float _1715 = 1.0 / _1705;
    float _1717 = float(uint(_1671));
    int _1719 = ~_1671;
    int _1721 = _1719 + 1;
    float _1723 = -_265;
    int _1725 = _1703 ? as_type<int>(_1723) : as_type<int>(_265);
    bool _1727 = _1355 > 0.5;
    float _1729 = 1.0 / _1717;
    int _1731 = int(_1727);
    int _1733 = _1703 ? 2 : 0;
    int _1735 = _1731 | _1733;
    int _1737 = _1575 ? 4 : 0;
    int _1739 = _1735 | _1737;
    int _1741 = _1683 ? 8 : 0;
    int _1743 = _1739 | _1741;
    int _1745 = _1687 ? 16 : 0;
    int _1747 = _1743 | _1745;
    int _1749 = _1691 ? 32 : 0;
    int _1751 = _1747 | _1749;
    int _1753 = _1657 ? 64 : 0;
    int _1755 = _1751 | _1753;
    int _1757 = _1755 & 64;
    bool _1759 = !_1687;
    float _1761 = _1759 ? _261 : as_type<float>(_1709);
    bool _1763 = !_1691;
    float _1765 = _1763 ? _265 : as_type<float>(_1725);
    float _1767 = -_265;
    int _1769 = _1727 ? as_type<int>(_1767) : as_type<int>(_265);
    float _1771 = _159 * _1715;
    int _1773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1775 = _1773 != 0;
    int _1777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1779 = _1777 != 0;
    int _1781 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1783 = _1781 != 0;
    int _1785 = int(_1727);
    int _1787 = _1703 ? 2 : 0;
    int _1789 = _1785 | _1787;
    int _1791 = _1575 ? 4 : 0;
    int _1793 = _1789 | _1791;
    int _1795 = _1683 ? 8 : 0;
    int _1797 = _1793 | _1795;
    int _1799 = _1775 ? 16 : 0;
    int _1801 = _1797 | _1799;
    int _1803 = _1779 ? 32 : 0;
    int _1805 = _1801 | _1803;
    int _1807 = _1783 ? 64 : 0;
    int _1809 = _1805 | _1807;
    int _1811 = _1809 & 2;
    float _1813 = trunc(_1771);
    int _1815 = int(_1813);
    bool _1817 = !_1683;
    float _1819 = _1817 ? _265 : as_type<float>(_1769);
    int _1821 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1823 = _1821 != 0;
    int _1825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1827 = _1825 != 0;
    int _1829 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1831 = _1829 != 0;
    int _1833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1835 = _1833 != 0;
    int _1837 = as_type<int>(_1729) + (-2);
    float _1839 = float(_125);
    int _1841 = ~_1671;
    int _1843 = _1841 + 1;
    bool _1845 = !_1827;
    int _1847 = _1845 ? 0 : 1;
    float _1849 = 1.0 / _1839;
    float _1851 = float(_1671);
    bool _1853 = !_1775;
    int _1855 = _1853 ? 0 : 1;
    float _1857 = float(uint(_1815));
    bool _1859 = _1671 == 0;
    bool _1861 = !_1779;
    int _1863 = _1861 ? 0 : 1;
    float _1865 = as_type<float>(_1837) * _1857;
    int _1867 = abs(_1847);
    int _1869 = abs(_1863);
    bool _1871 = !_1783;
    int _1873 = _1871 ? 0 : 1;
    float _1875 = trunc(_1865);
    float _1877 = precise::max(_1875, 0.0);
    uint _1880 = uint(_1877);
    bool _1882 = _1353 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1884 = isnan(_1353);
    bool _1886 = _1882 || _1884;
    bool _1888 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1890 = _1886 || _1888;
    float _1892 = float(_1890);
    float _1894 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1896 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1894;
    float _1898 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1900 = _1898 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1902 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1904 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1902;
    float _1906 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _1908 = _1721 * int(_1880);
    int _1910 = _1908 + _1815;
    float _1912 = float(uint(_1910));
    float _1914 = as_type<float>(_1837) * _1912;
    float _1916 = trunc(_1914);
    float _1918 = precise::max(_1916, 0.0);
    uint _1920 = uint(_1918);
    int _1922 = int(_1880) + int(_1920);
    float _1924 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1926 = int(_1924);
    int _1928 = _1843 * _1922;
    int _1930 = _1928 + _1815;
    bool _1932 = uint(_1930) >= uint(_1671);
    float _1934 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1936 = int(_1934);
    bool _1938 = !_1932;
    int _1940 = _1938 ? 0 : (-1);
    float _1942 = float(uint(_1926));
    int _1944 = ~_1926;
    int _1946 = _1944 + 1;
    float _1948 = 1.0 / _1942;
    int _1950 = ~_1922;
    int _1952 = _1950 + _1940;
    int _1954 = _1952 + 1;
    bool _1956 = _1926 == 0;
    float _1958 = float(_1936);
    int _1960 = ~_1926;
    int _1962 = _1960 + 1;
    float _1964 = 1.0 / _1958;
    int _1966 = as_type<int>(_1948) + (-2);
    float _1968 = _159 * _1964;
    float _1970 = trunc(_1968);
    int _1972 = int(_1970);
    float _1974 = float(uint(_1972));
    float _1976 = as_type<float>(_1966) * _1974;
    float _1978 = trunc(_1976);
    float _1980 = precise::max(_1978, 0.0);
    uint _1982 = uint(_1980);
    int _1984 = _1946 * int(_1982);
    int _1986 = _1984 + _1972;
    float _1988 = float(uint(_1986));
    float _1990 = _1631 * _1633;
    float _1992 = as_type<float>(_1966) * _1988;
    float _1994 = trunc(_1992);
    float _1996 = precise::max(_1994, 0.0);
    uint _1998 = uint(_1996);
    int _2000 = int(_1982) + int(_1998);
    float _2002 = _1635 * _1637;
    float _2004 = float(_1926);
    bool _2006 = !_1655;
    int _2008 = _2006 ? 0 : 1;
    float _2010 = _1635 * _1633;
    int _2012 = _1962 * _2000;
    int _2014 = _2012 + _1972;
    float _2016 = floor(_2002);
    int _2018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2020 = _2018 != 0;
    int _2022 = abs(_2008);
    bool _2024 = uint(_2014) >= uint(_1926);
    bool _2026 = !_2020;
    int _2028 = _2026 ? 0 : 1;
    float _2030 = floor(_1990);
    bool _2032 = !_2024;
    int _2034 = _2032 ? 0 : (-1);
    int _2036 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2038 = _2036 != 0;
    int _2040 = ~_2000;
    int _2042 = _2040 + _2034;
    int _2044 = _2042 + 1;
    bool _2046 = !_2038;
    int _2048 = _2046 ? 0 : 1;
    float _2050 = -_2016;
    float _2052 = _2002 + _2050;
    int _2054 = _1671 * _1954;
    int _2056 = _2054 + _1815;
    bool _2058 = !_1823;
    int _2060 = _2058 ? 0 : 1;
    int _2062 = _1926 * _2044;
    int _2064 = _2062 + _1972;
    int _2066 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2068 = _2066 != 0;
    bool _2070 = !_1859;
    int _2072 = _2070 ? _2056 : (-1);
    float _2074 = -_2030;
    float _2076 = _1990 + _2074;
    float _2078 = float(_1972);
    bool _2080 = !_1956;
    int _2082 = _2080 ? _2064 : (-1);
    float _2084 = _2076 * _1851;
    float _2086 = float(_1815);
    bool _2088 = _2078 >= _2004;
    bool _2090 = isnan(_2078);
    bool _2092 = _2088 || _2090;
    bool _2094 = isnan(_2004);
    bool _2096 = _2092 || _2094;
    float _2098 = float(_2096);
    float _2100 = trunc(_2084);
    int _2102 = int(_2100);
    bool _2104 = _2086 >= _1851;
    bool _2106 = isnan(_2086);
    bool _2108 = _2104 || _2106;
    bool _2110 = isnan(_1851);
    bool _2112 = _2108 || _2110;
    float _2114 = float(_2112);
    float _2116 = _159 * _1849;
    float _2118 = _2052 * _2004;
    int _2120 = abs(_2060);
    float _2122 = _2116 * _1851;
    float _2124 = _2116 * _2004;
    float _2126 = trunc(_2114);
    int _2128 = int(_2126);
    float _2130 = trunc(_2098);
    int _2132 = int(_2130);
    int _2134 = _2102 * _2022;
    int _2136 = _2134 + _1815;
    int _2138 = _1671 + (-1);
    bool _2140 = !_1831;
    int _2142 = _2140 ? 0 : 1;
    int _2144 = ~_2128;
    int _2146 = _2144 + 1;
    int _2148 = _2146 + 1;
    float _2150 = trunc(_2122);
    int _2152 = int(_2150);
    int _2154 = abs(_2142);
    int _2156 = _2072 * _2148;
    int _2158 = _1926 + (-1);
    int _2160 = ~_2132;
    int _2162 = _2160 + 1;
    int _2164 = _2162 + 1;
    float _2166 = trunc(_2118);
    int _2168 = int(_2166);
    int _2170 = _2128 * _2138;
    int _2172 = _2170 + _2156;
    int _2174 = abs(_2028);
    int _2176 = _2082 * _2164;
    int _2178 = abs(_1855);
    float _2180 = trunc(_2124);
    int _2182 = int(_2180);
    int _2184 = _2132 * _2158;
    int _2186 = _2184 + _2176;
    int _2188 = _2172 * _1869;
    int _2190 = abs(_1713);
    int _2192 = _2168 * _2174;
    int _2194 = _2192 + _1972;
    int _2196 = _2152 * _2178;
    int _2198 = _2196 + _2188;
    int _2200 = abs(_1873);
    int _2202 = _2186 * _1867;
    bool _2204 = !_1835;
    int _2206 = _2204 ? 0 : 1;
    int _2208 = _2182 * _2120;
    int _2210 = _2208 + _2202;
    int _2212 = abs(_2206);
    int _2214 = _2136 * _2200;
    int _2216 = _2214 + _2198;
    int _2218 = _2194 * _2154;
    int _2220 = _2218 + _2210;
    int _2222 = _2102 * _2190;
    int _2224 = _2222 + _2216;
    int _2226 = ~_1926;
    int _2228 = _2226 + 1;
    float _2230 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _2232 = int(_2230);
    int _2234 = _2168 * _2212;
    int _2236 = _2234 + _2220;
    float _2238 = float(uint(_2224));
    int _2240 = ~_1671;
    int _2242 = _2240 + 1;
    float _2244 = float(uint(_2236));
    float _2246 = as_type<float>(_1837) * _2238;
    float _2248 = as_type<float>(_1966) * _2244;
    float _2250 = trunc(_2246);
    float _2252 = precise::max(_2250, 0.0);
    uint _2254 = uint(_2252);
    float _2256 = float(_2232);
    float _2258 = trunc(_2248);
    float _2260 = precise::max(_2258, 0.0);
    uint _2262 = uint(_2260);
    int _2264 = _2242 * int(_2254);
    int _2266 = _2264 + _2224;
    float _2268 = 1.0 / _2256;
    float _2270 = float(uint(_2266));
    int _2272 = _2228 * int(_2262);
    int _2274 = _2272 + _2236;
    float _2276 = as_type<float>(_1837) * _2270;
    float _2278 = float(uint(_2274));
    float _2280 = trunc(_2276);
    float _2282 = precise::max(_2280, 0.0);
    uint _2284 = uint(_2282);
    int _2286 = ~_1671;
    int _2288 = _2286 + 1;
    float _2290 = _159 * _2268;
    float _2292 = as_type<float>(_1966) * _2278;
    float _2294 = trunc(_2290);
    int _2296 = int(_2294);
    int _2298 = int(_2254) + int(_2284);
    float _2300 = trunc(_2292);
    float _2302 = precise::max(_2300, 0.0);
    uint _2304 = uint(_2302);
    int _2306 = ~_1926;
    int _2308 = _2306 + 1;
    int _2310 = _2288 * _2298;
    int _2312 = _2310 + _2224;
    float _2314 = float(uint(_2296));
    bool _2316 = uint(_2312) >= uint(_1671);
    bool _2318 = !_2316;
    int _2320 = _2318 ? 0 : (-1);
    int _2322 = int(_2262) + int(_2304);
    int _2324 = ~_2298;
    int _2326 = _2324 + _2320;
    int _2328 = _2326 + 1;
    int _2330 = _2308 * _2322;
    int _2332 = _2330 + _2236;
    int _2334 = _1671 * _2328;
    int _2336 = _2334 + _2224;
    float _2338 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _2340 = int(_2338);
    bool _2342 = uint(_2332) >= uint(_1926);
    bool _2344 = !_1859;
    int _2346 = _2344 ? _2336 : (-1);
    bool _2348 = !_2342;
    int _2350 = _2348 ? 0 : (-1);
    int _2352 = _2346 & 3;
    bool _2354 = _2352 != 0;
    int _2356 = ~_2322;
    int _2358 = _2356 + _2350;
    int _2360 = _2358 + 1;
    int _2362 = _2346 & 3;
    bool _2364 = _2362 != 0;
    int _2366 = _1926 * _2360;
    int _2368 = _2366 + _2236;
    int _2370 = _2354 ? 0 : 1;
    float _2372 = float(uint(_2340));
    bool _2374 = !_1956;
    int _2376 = _2374 ? _2368 : (-1);
    float _2378 = 1.0 / _2372;
    int _2380 = int(_2354);
    int _2382 = _2364 ? 2 : 0;
    int _2384 = _2380 | _2382;
    int _2386 = _1831 ? 4 : 0;
    int _2388 = _2384 | _2386;
    int _2390 = _1835 ? 8 : 0;
    int _2392 = _2388 | _2390;
    int _2394 = _1859 ? 16 : 0;
    int _2396 = _2392 | _2394;
    int _2398 = _1956 ? 32 : 0;
    int _2400 = _2396 | _2398;
    int _2402 = _1783 ? 64 : 0;
    int _2404 = _2400 | _2402;
    int _2406 = _2404 & 2;
    int _2408 = _2376 & 3;
    bool _2410 = _2408 != 0;
    int _2412 = _2376 & 3;
    bool _2414 = _2412 != 0;
    int _2416 = _2410 ? 0 : 1;
    bool _2418 = uint(_2362) > 1u;
    int _2420 = ~_2370;
    int _2422 = _2420 + 1;
    int _2424 = _2422 + 1;
    int _2426 = ~_2340;
    int _2428 = _2426 + 1;
    int _2430 = int(_2418);
    int _2432 = _2414 ? 2 : 0;
    int _2434 = _2430 | _2432;
    int _2436 = _1831 ? 4 : 0;
    int _2438 = _2434 | _2436;
    int _2440 = _1835 ? 8 : 0;
    int _2442 = _2438 | _2440;
    int _2444 = _1859 ? 16 : 0;
    int _2446 = _2442 | _2444;
    int _2448 = _1956 ? 32 : 0;
    int _2450 = _2446 | _2448;
    int _2452 = _1783 ? 64 : 0;
    int _2454 = _2450 | _2452;
    int _2456 = _2454 & 2;
    int _2458 = as_type<int>(_2378) + (-2);
    int _2460 = _2424;
    float _2462 = as_type<float>(_2340);
    if (!_2418)
    {
        int _2464 = ~_2370;
        int _2466 = _2464 + 1;
        _2460 = _2466;
    }
    int _2468 = _2460;
    float _2470 = as_type<float>(_2458) * _2314;
    bool _2472 = uint(_2412) > 1u;
    int _2474 = ~_2416;
    int _2476 = _2474 + 1;
    int _2478 = _2476 + 1;
    float _2480 = trunc(_2470);
    float _2482 = precise::max(_2480, 0.0);
    uint _2484 = uint(_2482);
    int _2486 = _2478;
    if (!_2472)
    {
        int _2488 = ~_2416;
        int _2490 = _2488 + 1;
        _2486 = _2490;
    }
    int _2492 = _2486;
    int _2494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2496 = _2494 != 0;
    int _2498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2500 = _2498 != 0;
    int _2502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2504 = _2502 != 0;
    int _2506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2508 = _2506 != 0;
    bool _2510 = !_2496;
    int _2512 = _2510 ? 0 : 1;
    bool _2514 = !_2504;
    int _2516 = _2514 ? 0 : 1;
    bool _2518 = _1757 != 0;
    int _2520 = ~_2340;
    int _2522 = _2520 + 1;
    int _2524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2526 = _2524 != 0;
    int _2528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2530 = _2528 != 0;
    int _2532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2534 = _2532 != 0;
    int _2536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2538 = _2536 != 0;
    bool _2540 = !_2500;
    int _2542 = _2540 ? 0 : 1;
    int _2544 = _2522 * int(_2484);
    int _2546 = _2544 + _2296;
    bool _2548 = _2340 == 0;
    bool _2550 = !_2526;
    int _2552 = _2550 ? 0 : 1;
    float _2554 = float(uint(_2546));
    float _2556 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _2558 = int(_2556);
    bool _2560 = !_2508;
    int _2562 = _2560 ? 0 : 1;
    float _2564 = as_type<float>(_2458) * _2554;
    int _2566 = abs(_2512);
    bool _2568 = !_2538;
    int _2570 = _2568 ? 0 : 1;
    bool _2572 = !_2530;
    int _2574 = _2572 ? 0 : 1;
    float _2576 = trunc(_2564);
    float _2578 = precise::max(_2576, 0.0);
    uint _2580 = uint(_2578);
    bool _2582 = !_2534;
    int _2584 = _2582 ? 0 : 1;
    bool _2586 = _1926 == 0;
    int _2588 = ~_2558;
    int _2590 = _2588 + 1;
    bool _2592 = _2558 == 0;
    int _2594 = int(_2484) + int(_2580);
    float _2596 = float(uint(_2558));
    int _2598 = _2428 * _2594;
    int _2600 = _2598 + _2296;
    bool _2602 = uint(_2600) >= uint(_2340);
    float _2604 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _2606 = int(_2604);
    bool _2608 = !_2602;
    int _2610 = _2608 ? 0 : (-1);
    int _2612 = ~_2594;
    int _2614 = _2612 + _2610;
    int _2616 = _2614 + 1;
    float _2618 = float(_2606);
    float _2620 = 1.0 / _2596;
    float _2622 = 1.0 / _2618;
    int _2624 = ~_2558;
    int _2626 = _2624 + 1;
    int _2628 = as_type<int>(_2620) + (-2);
    float _2630 = _159 * _2622;
    float _2632 = trunc(_2630);
    int _2634 = int(_2632);
    float _2636 = float(uint(_2634));
    float _2638 = as_type<float>(_2628) * _2636;
    float _2640 = trunc(_2638);
    float _2642 = precise::max(_2640, 0.0);
    uint _2644 = uint(_2642);
    int _2646 = _2590 * int(_2644);
    int _2648 = _2646 + _2634;
    float _2650 = float(_2296);
    float _2652 = float(uint(_2648));
    float _2654 = as_type<float>(_2628) * _2652;
    float _2656 = trunc(_2654);
    float _2658 = precise::max(_2656, 0.0);
    uint _2660 = uint(_2658);
    int _2662 = int(_2644) + int(_2660);
    float _2664 = floor(_1659);
    int _2666 = _2626 * _2662;
    int _2668 = _2666 + _2634;
    bool _2670 = uint(_2668) >= uint(_2558);
    float _2672 = float(_2340);
    bool _2674 = !_2670;
    int _2676 = _2674 ? 0 : (-1);
    bool _2678 = _2650 >= _2672;
    bool _2680 = isnan(_2650);
    bool _2682 = _2678 || _2680;
    bool _2684 = isnan(_2672);
    bool _2686 = _2682 || _2684;
    float _2688 = float(_2686);
    float _2690 = -_2664;
    float _2692 = _1659 + _2690;
    int _2694 = _2340 + (-1);
    int _2696 = ~_2662;
    int _2698 = _2696 + _2676;
    int _2700 = _2698 + 1;
    float _2702 = trunc(_2688);
    int _2704 = int(_2702);
    float _2706 = _2692 * _2672;
    int _2708 = _2340 * _2616;
    int _2710 = _2708 + _2296;
    float _2712 = _2116 * _2672;
    bool _2714 = !_2548;
    int _2716 = _2714 ? _2710 : (-1);
    float _2718 = trunc(_2706);
    int _2720 = int(_2718);
    int _2722 = ~_2704;
    int _2724 = _2722 + 1;
    int _2726 = _2724 + 1;
    float _2728 = trunc(_2712);
    int _2730 = int(_2728);
    int _2732 = _2716 * _2726;
    int _2734 = abs(_2516);
    int _2736 = abs(_2048);
    int _2738 = _2704 * _2694;
    int _2740 = _2738 + _2732;
    int _2742 = abs(_2542);
    bool _2744 = !_2068;
    int _2746 = _2744 ? 0 : 1;
    bool _2748 = _1639 != 2;
    int _2750 = abs(_2562);
    int _2752 = _2720 * _2736;
    int _2754 = _2752 + _2296;
    int _2756 = _2740 * _2734;
    int _2758 = _2730 * _2742;
    int _2760 = _2758 + _2756;
    int _2762 = ~_2340;
    int _2764 = _2762 + 1;
    int _2766 = _2754 * _2750;
    int _2768 = _2766 + _2760;
    int _2770 = ~_2340;
    int _2772 = _2770 + 1;
    int _2774 = _2720 * _2566;
    int _2776 = _2774 + _2768;
    float _2778 = float(uint(_2776));
    float _2780 = as_type<float>(_2458) * _2778;
    float _2782 = trunc(_2780);
    float _2784 = precise::max(_2782, 0.0);
    uint _2786 = uint(_2784);
    float _2788 = float(_2558);
    float _2790 = _2116 * _2788;
    int _2792 = _2772 * int(_2786);
    int _2794 = _2792 + _2776;
    float _2796 = trunc(_2790);
    int _2798 = int(_2796);
    float _2800 = float(uint(_2794));
    float _2802 = float(_2634);
    float _2804 = as_type<float>(_2458) * _2800;
    bool _2806 = _2802 >= _2788;
    bool _2808 = isnan(_2802);
    bool _2810 = _2806 || _2808;
    bool _2812 = isnan(_2788);
    bool _2814 = _2810 || _2812;
    float _2816 = float(_2814);
    float _2818 = trunc(_2804);
    float _2820 = precise::max(_2818, 0.0);
    uint _2822 = uint(_2820);
    float _2824 = trunc(_2816);
    int _2826 = int(_2824);
    int _2828 = int(_2786) + int(_2822);
    float _2830 = floor(_2010);
    int _2832 = _2764 * _2828;
    int _2834 = _2832 + _2776;
    bool _2836 = uint(_2834) >= uint(_2340);
    bool _2838 = !_2836;
    int _2840 = _2838 ? 0 : (-1);
    float _2842 = -_2830;
    float _2844 = _2010 + _2842;
    int _2846 = _2558 + (-1);
    int _2848 = ~_2828;
    int _2850 = _2848 + _2840;
    int _2852 = _2850 + 1;
    float _2854 = _2844 * _2788;
    int _2856 = _2558 * _2700;
    int _2858 = _2856 + _2634;
    int _2860 = ~_2826;
    int _2862 = _2860 + 1;
    int _2864 = _2862 + 1;
    int _2866 = _2340 * _2852;
    int _2868 = _2866 + _2776;
    int _2870 = ~_1926;
    int _2872 = _2870 + 1;
    float _2874 = trunc(_2854);
    int _2876 = int(_2874);
    bool _2878 = !_2592;
    int _2880 = _2878 ? _2858 : (-1);
    bool _2882 = !_2548;
    int _2884 = _2882 ? _2868 : (-1);
    int _2886 = _2880 * _2864;
    int _2888 = abs(_2574);
    int _2890 = abs(_2746);
    int _2892 = _2826 * _2846;
    int _2894 = _2892 + _2886;
    int _2896 = abs(_2552);
    int _2898 = abs(_2584);
    int _2900 = _2894 * _2888;
    int _2902 = _2876 * _2890;
    int _2904 = _2902 + _2634;
    int _2906 = abs(_2570);
    int _2908 = _2798 * _2896;
    int _2910 = _2908 + _2900;
    int _2912 = _2884 & 3;
    bool _2914 = _2912 != 0;
    float _2916 = float(uint(_2136));
    int _2918 = _2904 * _2898;
    int _2920 = _2918 + _2910;
    int _2922 = ~_2558;
    int _2924 = _2922 + 1;
    int _2926 = _2876 * _2906;
    int _2928 = _2926 + _2920;
    int _2930 = ~_2558;
    int _2932 = _2930 + 1;
    float _2934 = as_type<float>(_1837) * _2916;
    float _2936 = float(uint(_2928));
    float _2938 = trunc(_2934);
    float _2940 = precise::max(_2938, 0.0);
    uint _2942 = uint(_2940);
    float _2944 = as_type<float>(_2628) * _2936;
    float _2946 = trunc(_2944);
    float _2948 = precise::max(_2946, 0.0);
    uint _2950 = uint(_2948);
    int _2952 = _2924 * int(_2950);
    int _2954 = _2952 + _2928;
    float _2956 = float(uint(_2954));
    float _2958 = as_type<float>(_2628) * _2956;
    float _2960 = trunc(_2958);
    float _2962 = precise::max(_2960, 0.0);
    uint _2964 = uint(_2962);
    int _2966 = int(_2950) + int(_2964);
    int _2968 = _2932 * _2966;
    int _2970 = _2968 + _2928;
    bool _2972 = uint(_2970) >= uint(_2558);
    bool _2974 = !_2972;
    int _2976 = _2974 ? 0 : (-1);
    int _2978 = _2884 & 3;
    bool _2980 = _2978 != 0;
    int _2982 = ~_2966;
    int _2984 = _2982 + _2976;
    int _2986 = _2984 + 1;
    int _2988 = _2980 ? 0 : 1;
    int _2990 = ~_1926;
    int _2992 = _2990 + 1;
    int _2994 = _2558 * _2986;
    int _2996 = _2994 + _2928;
    int _2998 = ~_2988;
    int _3000 = _2998 + 1;
    int _3002 = _3000 + 1;
    bool _3004 = !_2592;
    int _3006 = _3004 ? _2996 : (-1);
    int _3008 = _3006 & 3;
    bool _3010 = _3008 != 0;
    int _3012 = _3010 ? 0 : 1;
    bool _3014 = uint(_2912) > 1u;
    int _3016 = ~_3012;
    int _3018 = _3016 + 1;
    int _3020 = _3018 + 1;
    int _3022 = _3002;
    int _3024 = _3020;
    float _3026 = as_type<float>(_2558);
    if (!_3014)
    {
        int _3028 = ~_2988;
        int _3030 = _3028 + 1;
        _3022 = _3030;
    }
    int _3032 = _3022;
    int _3034 = _3006 & 3;
    bool _3036 = _3034 != 0;
    bool _3038 = uint(_3034) > 1u;
    if (!_3038)
    {
        int _3040 = ~_3012;
        int _3042 = _3040 + 1;
        _3024 = _3042;
    }
    int _3044 = _3024;
    bool _3046 = uint(_2362) >= 2u;
    int _3048 = _3046 ? 0 : 1;
    bool _3050 = uint(_2412) >= 2u;
    int _3052 = ~_3048;
    int _3054 = _3052 + 1;
    int _3056 = _3054 + 1;
    int _3058 = _3050 ? 0 : 1;
    bool _3060 = _2362 != 3;
    int _3062 = ~_3058;
    int _3064 = _3062 + 1;
    int _3066 = _3064 + 1;
    int _3068 = _3056;
    int _3070 = _3066;
    if (_3060)
    {
        int _3072 = ~_3048;
        int _3074 = _3072 + 1;
        _3068 = _3074;
    }
    int _3076 = _3068;
    bool _3078 = _2412 != 3;
    if (_3078)
    {
        int _3080 = ~_3058;
        int _3082 = _3080 + 1;
        _3070 = _3082;
    }
    int _3084 = _3070;
    bool _3086 = uint(_2912) >= 2u;
    int _3088 = abs(_3084);
    int _3090 = _3086 ? 0 : 1;
    bool _3092 = uint(_3034) >= 2u;
    int _3094 = ~_3090;
    int _3096 = _3094 + 1;
    int _3098 = _3096 + 1;
    int _3100 = _3092 ? 0 : 1;
    bool _3102 = _2912 != 3;
    int _3104 = ~_3100;
    int _3106 = _3104 + 1;
    int _3108 = _3106 + 1;
    int _3110 = _3098;
    int _3112 = _3108;
    if (_3102)
    {
        int _3114 = ~_3090;
        int _3116 = _3114 + 1;
        _3110 = _3116;
    }
    int _3118 = _3110;
    bool _3120 = _3034 != 3;
    float _3122 = -_265;
    int _3124 = _2518 ? as_type<int>(_3122) : as_type<int>(_265);
    bool _3126 = _2406 != 0;
    int _3128 = ~_2340;
    int _3130 = _3128 + 1;
    if (_3120)
    {
        int _3132 = ~_3100;
        int _3134 = _3132 + 1;
        _3112 = _3134;
    }
    int _3136 = _3112;
    int _3138 = ~_1671;
    int _3140 = _3138 + 1;
    int _3142 = _3140 * int(_2942);
    int _3144 = _3142 + _2136;
    float _3146 = float(uint(_3144));
    int _3148 = ~_1671;
    int _3150 = _3148 + 1;
    float _3152 = as_type<float>(_1837) * _3146;
    float _3154 = trunc(_3152);
    float _3156 = precise::max(_3154, 0.0);
    uint _3158 = uint(_3156);
    int _3160 = int(_2942) + int(_3158);
    float _3162 = float(uint(_2194));
    float _3164 = as_type<float>(_1966) * _3162;
    int _3166 = _3150 * _3160;
    int _3168 = _3166 + _2136;
    float _3170 = trunc(_3164);
    float _3172 = precise::max(_3170, 0.0);
    uint _3174 = uint(_3172);
    bool _3176 = uint(_3168) >= uint(_1671);
    bool _3178 = !_3176;
    int _3180 = _3178 ? 0 : (-1);
    int _3182 = ~_3160;
    int _3184 = _3182 + _3180;
    int _3186 = _3184 + 1;
    int _3188 = _2992 * int(_3174);
    int _3190 = _3188 + _2194;
    int _3192 = _1671 * _3186;
    int _3194 = _3192 + _2136;
    float _3196 = _1623 * 2.0;
    float _3198 = float(uint(_3190));
    int _3200 = ~_2340;
    int _3202 = _3200 + 1;
    float _3204 = floor(_3196);
    float _3206 = as_type<float>(_1966) * _3198;
    float _3208 = trunc(_3206);
    float _3210 = precise::max(_3208, 0.0);
    uint _3212 = uint(_3210);
    int _3214 = int(_3174) + int(_3212);
    int _3216 = _2872 * _3214;
    int _3218 = _3216 + _2194;
    bool _3220 = uint(_3218) >= uint(_1926);
    float _3222 = float(uint(_2754));
    bool _3224 = !_3220;
    int _3226 = _3224 ? 0 : (-1);
    float _3228 = as_type<float>(_2458) * _3222;
    int _3230 = ~_3214;
    int _3232 = _3230 + _3226;
    int _3234 = _3232 + 1;
    float _3236 = trunc(_3228);
    float _3238 = precise::max(_3236, 0.0);
    uint _3240 = uint(_3238);
    int _3242 = _1926 * _3234;
    int _3244 = _3242 + _2194;
    float _3246 = _1631 * 2.0;
    bool _3248 = !_2586;
    int _3250 = _3248 ? _3244 : (-1);
    float _3252 = floor(_3246);
    int _3254 = _3202 * int(_3240);
    int _3256 = _3254 + _2754;
    float _3258 = float(uint(_3256));
    int _3260 = ~_2558;
    int _3262 = _3260 + 1;
    float _3264 = as_type<float>(_2458) * _3258;
    float _3266 = float(uint(_2904));
    float _3268 = as_type<float>(_2628) * _3266;
    float _3270 = trunc(_3264);
    float _3272 = precise::max(_3270, 0.0);
    uint _3274 = uint(_3272);
    float _3276 = trunc(_3268);
    float _3278 = precise::max(_3276, 0.0);
    uint _3280 = uint(_3278);
    int _3282 = int(_3240) + int(_3274);
    int _3284 = ~_2558;
    int _3286 = _3284 + 1;
    int _3288 = _3130 * _3282;
    int _3290 = _3288 + _2754;
    int _3292 = _3262 * int(_3280);
    int _3294 = _3292 + _2904;
    bool _3296 = uint(_3290) >= uint(_2340);
    float _3298 = float(uint(_3294));
    bool _3300 = !_3296;
    int _3302 = _3300 ? 0 : (-1);
    float _3304 = as_type<float>(_2628) * _3298;
    int _3306 = ~_3282;
    int _3308 = _3306 + _3302;
    int _3310 = _3308 + 1;
    float _3312 = trunc(_3304);
    float _3314 = precise::max(_3312, 0.0);
    uint _3316 = uint(_3314);
    int _3318 = _2340 * _3310;
    int _3320 = _3318 + _2754;
    bool _3322 = !_2548;
    int _3324 = _3322 ? _3320 : (-1);
    int _3326 = int(_3280) + int(_3316);
    int _3328 = _3286 * _3326;
    int _3330 = _3328 + _2904;
    bool _3332 = uint(_3330) >= uint(_2558);
    bool _3334 = !_3332;
    int _3336 = _3334 ? 0 : (-1);
    bool _3338 = _1671 == 0;
    int _3340 = ~_3326;
    int _3342 = _3340 + _3336;
    int _3344 = _3342 + 1;
    bool _3346 = !_3338;
    int _3348 = _3346 ? _3194 : (-1);
    bool _3350 = _1641 != 1;
    int _3352 = _2558 * _3344;
    int _3354 = _3352 + _2904;
    bool _3356 = !_3126;
    int _3358 = _3356 ? 0 : 1;
    bool _3360 = !_1701;
    int _3362 = _3360 ? 0 : 1;
    bool _3364 = _2456 != 0;
    bool _3366 = !_2592;
    int _3368 = _3366 ? _3354 : (-1);
    float _3370 = 0.0;
    float _3372 = as_type<float>(_3290);
    float _3374 = _3304;
    float _3376 = as_type<float>(_3326);
    if (_2748)
    {
        _3370 = _1631;
    }
    float _3378 = _3370;
    float _3380 = _3378;
    if (_2748)
    {
        _3372 = _1623;
    }
    float _3382 = _3372;
    float _3384 = _3382;
    if (!_2748)
    {
        _3380 = _1629;
    }
    float _3386 = _3380;
    if (!_2748)
    {
        _3384 = _1631;
    }
    float _3388 = _3384;
    int _3390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3392 = _3390 != 0;
    float _3394 = _3388 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _3396 = !_3350;
    float _3398 = _3396 ? as_type<float>(_1643) : as_type<float>(_1645);
    bool _3400 = !_3392;
    int _3402 = _3400 ? 0 : 1;
    bool _3404 = !_3350;
    float _3406 = _3404 ? as_type<float>(_1647) : as_type<float>(_1643);
    int _3408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3410 = _3408 != 0;
    if (!_3350)
    {
        _3374 = _1629;
    }
    float _3412 = _3374;
    float _3414 = _3412;
    if (!_3350)
    {
        _2462 = _1629;
    }
    float _3416 = _2462;
    float _3418 = _3416;
    if (!_3350)
    {
        _3376 = _1623;
    }
    float _3420 = _3376;
    float _3422 = _3420;
    if (!_3350)
    {
        _3026 = _1623;
    }
    float _3424 = _3026;
    float _3426 = _3424;
    if (_3350)
    {
        _3414 = _1623;
    }
    float _3428 = _3414;
    if (_3350)
    {
        _3418 = _1623;
    }
    float _3430 = _3418;
    if (_3350)
    {
        _3422 = _1631;
    }
    float _3432 = _3422;
    float _3434 = _3428 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_3350)
    {
        _3426 = _1631;
    }
    float _3436 = _3426;
    bool _3438 = _3252 >= 0.0;
    bool _3440 = isnan(_3252);
    bool _3442 = _3438 || _3440;
    bool _3444 = isnan(0.0);
    bool _3446 = _3442 || _3444;
    float _3448 = _3432 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _3450 = _3446 ? 0 : 1;
    bool _3452 = _3252 > 0.0;
    int _3454 = ~_3450;
    int _3456 = _3454 + 1;
    int _3458 = _3456 + 1;
    int _3460 = _3458;
    if (!_3452)
    {
        int _3462 = ~_3450;
        int _3464 = _3462 + 1;
        _3460 = _3464;
    }
    int _3466 = _3460;
    bool _3468 = _3204 >= 0.0;
    bool _3470 = isnan(_3204);
    bool _3472 = _3468 || _3470;
    bool _3474 = isnan(0.0);
    bool _3476 = _3472 || _3474;
    int _3478 = _3476 ? 0 : 1;
    bool _3480 = _3204 > 0.0;
    float _3482 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3484 = _3482 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _3486 = ~_3478;
    int _3488 = _3486 + 1;
    int _3490 = _3488 + 1;
    float _3492 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3494 = _3492 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3496 = 1.0 / _3484;
    int _3498 = _3490;
    if (!_3480)
    {
        int _3500 = ~_3478;
        int _3502 = _3500 + 1;
        _3498 = _3502;
    }
    int _3504 = _3498;
    float _3506 = 1.0 / _3494;
    bool _3508 = _2362 != 3;
    bool _3510 = !_2914;
    int _3512 = _3510 ? 0 : 1;
    bool _3514 = _2412 != 3;
    bool _3516 = !_3036;
    int _3518 = _3516 ? 0 : 1;
    bool _3520 = !_3508;
    int _3522 = _3520 ? 0 : (-1);
    float _3524 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3526 = _3524 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _3528 = _2912 != 3;
    bool _3530 = _3034 != 3;
    float _3532 = 1.0 / _3526;
    bool _3534 = !_3364;
    int _3536 = _3534 ? 0 : 1;
    float _3538 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3540 = _3538 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3542 = !_3528;
    int _3544 = _3542 ? 0 : (-1);
    int _3546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3548 = _3546 != 0;
    int _3550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3552 = _3550 != 0;
    int _3554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3556 = _3554 != 0;
    float _3558 = 1.0 / _3540;
    int _3560 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3562 = _3560 != 0;
    float _3564 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3566 = _3564 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3568 = _449 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _3570 = !_3552;
    int _3572 = _3570 ? 0 : 1;
    float _3574 = fma(_455, (*spvDescriptorSet0.vp_c10)._m0[5].x, _3568);
    float _3576 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3578 = _3576 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _3580 = !_3514;
    int _3582 = _3580 ? 0 : (-1);
    float _3584 = 1.0 / _3566;
    bool _3586 = _1567 != 0;
    int _3588 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3590 = _3588 != 0;
    float _3592 = _449 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _3594 = _449 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _3596 = 1.0 / _3578;
    float _3598 = fma(_455, (*spvDescriptorSet0.vp_c10)._m0[4].x, _3592);
    float _3600 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3602 = _3600 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _3604 = fma(_455, (*spvDescriptorSet0.vp_c10)._m0[6].x, _3594);
    float _3606 = fma(_479, (*spvDescriptorSet0.vp_c10)._m0[4].z, _3598);
    float _3608 = fma(_479, (*spvDescriptorSet0.vp_c10)._m0[5].z, _3574);
    float _3610 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _3612 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _3610;
    float _3614 = 1.0 / _3602;
    float _3616 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _3618 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _3616;
    float _3620 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _3622 = _3620 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _3624 = fma(_479, (*spvDescriptorSet0.vp_c10)._m0[6].z, _3604);
    float _3626 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _3628 = _3626 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _3630 = _3618 * _3532;
    float _3632 = _3622 * _3558;
    float _3634 = -_1892;
    float _3636 = _3634 + 1.0;
    float _3638 = _1900 * _3596;
    bool _3640 = _1353 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _3642 = isnan(_1353);
    bool _3644 = _3640 || _3642;
    bool _3646 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _3648 = _3644 || _3646;
    float _3650 = float(_3648);
    float _3652 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3654 = log2(_3652);
    float _3656 = _3628 * _3496;
    float _3658 = _3612 * _3506;
    bool _3660 = _1353 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _3662 = isnan(_1353);
    bool _3664 = _3660 || _3662;
    bool _3666 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _3668 = _3664 || _3666;
    float _3670 = float(_3668);
    float _3672 = _3650 * _3636;
    float _3674 = -_3650;
    float _3676 = _3674 + 1.0;
    float _3678 = _1904 * _3614;
    float _3680 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3682 = _1353 + _3680;
    bool _3684 = _1353 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3686 = isnan(_1353);
    bool _3688 = _3684 || _3686;
    bool _3690 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _3692 = _3688 || _3690;
    float _3694 = float(_3692);
    float _3696 = 0.0;
    bool _3698 = _2592;
    if (_3586)
    {
        float _3700 = in.m_68.w;
        _3696 = _3700;
    }
    float _3702 = _3696;
    float _3704 = _1629 * 2.0;
    float _3706 = fma(_3658, _3682, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _3708 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3710 = _1353 + _3708;
    float _3712 = _3670 * _3676;
    bool _3714 = _1353 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _3716 = isnan(_1353);
    bool _3718 = _3714 || _3716;
    bool _3720 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _3722 = _3718 || _3720;
    float _3724 = float(_3722);
    float _3726 = -_3694;
    float _3728 = _3726 + 1.0;
    float _3730 = _159 * _3654;
    float _3732 = floor(_3704);
    float _3734 = -_3670;
    float _3736 = _3734 + 1.0;
    float _3738 = fma(_3656, _3710, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _3740 = _3724 * _3728;
    float _3742 = -_3724;
    float _3744 = _3742 + 1.0;
    float _3746 = _3694 * _3736;
    bool _3748 = _1353 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _3750 = isnan(_1353);
    bool _3752 = _3748 || _3750;
    bool _3754 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _3756 = _3752 || _3754;
    float _3758 = float(_3756);
    float _3760 = exp2(_3730);
    float _3762 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3764 = _1353 + _3762;
    float _3766 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3768 = 1.0 + _3766;
    bool _3770 = _1353 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _3772 = isnan(_1353);
    bool _3774 = _3770 || _3772;
    bool _3776 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _3778 = _3774 || _3776;
    float _3780 = float(_3778);
    float _3782 = _3758 * _3744;
    float _3784 = fma(_3630, _3764, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _3786 = -_3758;
    float _3788 = _3786 + 1.0;
    bool _3790 = !_3530;
    int _3792 = _3790 ? 0 : (-1);
    float _3794 = 1.0 / _3768;
    bool _3796 = _3732 >= 0.0;
    bool _3798 = isnan(_3732);
    bool _3800 = _3796 || _3798;
    bool _3802 = isnan(0.0);
    bool _3804 = _3800 || _3802;
    float _3806 = _3780 * _3788;
    float _3808 = -_3780;
    float _3810 = _3808 + 1.0;
    bool _3812 = _1353 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _3814 = isnan(_1353);
    bool _3816 = _3812 || _3814;
    bool _3818 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _3820 = _3816 || _3818;
    float _3822 = float(_3820);
    float _3824 = _3780;
    if (_3586)
    {
        float _3826 = _3702 * 3.1415927410125732421875;
        _3824 = _3826;
    }
    float _3828 = _3824;
    int _3830 = _3804 ? 0 : 1;
    float _3832 = _1896 * _3584;
    float _3834 = -_3760;
    float _3836 = _3834 + 1.0;
    bool _3838 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3840 = isnan(0.0);
    bool _3842 = _3838 || _3840;
    bool _3844 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3846 = _3842 || _3844;
    float _3848 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3850 = _1353 + _3848;
    bool _3852 = !_3556;
    int _3854 = _3852 ? 0 : 1;
    float _3856 = _3828;
    if (_3586)
    {
        float _3858 = _3828 * 0.15915493667125701904296875;
        _3856 = _3858;
    }
    float _3860 = _3856;
    bool _3862 = _1811 != 0;
    float _3864 = _3822 * _3810;
    float _3866 = _3846 ? _3836 : 0.0;
    float _3868 = -_3822;
    float _3870 = _3868 + 1.0;
    float _3872 = fma(_3632, _3850, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _3874 = _3706 * _3864;
    bool _3876 = _3732 > 0.0;
    float _3878 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3880 = _1353 + _3878;
    float _3882 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3884 = _1353 + _3882;
    float _3886 = _3866 * _3794;
    float _3888 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3890 = _1353 + _3888;
    float _3892 = fma(_3870, (*spvDescriptorSet0.vp_c9)._m0[159].x, _3874);
    float _3894 = fma(_3638, _3884, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _3896 = fma(_3678, _3890, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _3898 = _1631 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _3900 = fma(_3738, _3806, _3892);
    float _3902 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _3904 = _3860;
    if (_3586)
    {
        float _3906 = _3860 * 6.283185482025146484375;
        float _3908 = sin(_3906);
        _3904 = _3908;
    }
    float _3910 = _3904;
    float _3912 = fma(_3784, _3782, _3900);
    float _3914 = -_3902;
    float _3916 = fma(_3898, 2.0, _3914);
    int _3918 = ~_3830;
    int _3920 = _3918 + 1;
    int _3922 = _3920 + 1;
    float _3924 = _3608 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _3926 = _3922;
    if (!_3876)
    {
        int _3928 = ~_3830;
        int _3930 = _3928 + 1;
        _3926 = _3930;
    }
    int _3932 = _3926;
    float _3934 = fma(_1623, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1906);
    float _3936 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _3938 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3940 = isnan(1.0);
    bool _3942 = _3938 || _3940;
    bool _3944 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3946 = _3942 || _3944;
    float _3948 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3950 = fma(_3872, _3740, _3912);
    float _3952 = _3606 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _3954 = -_3924;
    float _3956 = _3954 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3958 = fma(_3832, _3880, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _3960 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _3962 = !_3946;
    float _3964 = _3962 ? _159 : _3886;
    float _3966 = fma(_1631, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3936);
    bool _3968 = _1631 > 0.5;
    float _3970 = fma(_1631, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3948);
    float _3972 = _1623 + _1631;
    float _3974 = _1631 + _1629;
    float _3976 = _1631 + (-0.5);
    float _3978 = _3624 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _3980 = -_3952;
    float _3982 = _3980 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3984 = _3956 * _3956;
    float _3986 = fma(_1623, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3960);
    float _3988 = _1629 + (-0.5);
    float _3990 = -_3978;
    float _3992 = _3990 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3994 = fma(_3982, _3982, _3984);
    float _3996 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3998 = _3924 + _3996;
    float _4000 = _1623 + (-0.5);
    float _4002 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4004 = _3952 + _4002;
    float _4006 = fma(_3992, _3992, _3994);
    float _4008 = _3998 * _3998;
    if (_3586)
    {
        bool _4010 = _3910 > 0.5;
        _3698 = _4010;
    }
    bool _4012 = _3698;
    float _4014 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4016 = _3978 + _4014;
    float _4018 = fma(_4004, _4004, _4008);
    float _4020 = rsqrt(_4006);
    float _4022 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _4024 = fma(_4016, _4016, _4018);
    float _4026 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _4028 = fma(_1679, -2.0, _4022);
    float _4030 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _4032 = sqrt(_4024);
    float _4034 = fma(as_type<float>(_1643), (*spvDescriptorSet0.vp_c9)._m0[93].w, _4026);
    float _4036 = as_type<float>(_1643) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _4038 = fma(_3958, _3746, _3950);
    float _4040 = _739 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _4042 = fma(as_type<float>(_1645), (*spvDescriptorSet0.vp_c9)._m0[93].z, _4030);
    float _4044 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _4046 = as_type<float>(_1645) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _4048 = _3972 + (-1.0);
    float _4050 = fma(_3894, _3712, _4038);
    float _4052 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _4054 = -_4044;
    float _4056 = fma(_4046, 2.0, _4054);
    float _4058 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _4060 = _3956 * _4020;
    float _4062 = fma(_4048, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _4064 = fma(_3896, _3672, _4050);
    float _4066 = _4040 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _4068 = _4032 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _4070 = fma(_3436, (*spvDescriptorSet0.vp_c9)._m0[83].z, _4052);
    float _4072 = rsqrt(_4024);
    float _4074 = fma(_4036, -2.0, _4058);
    float _4076 = _3992 * _4020;
    float _4078 = fma(_1693, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _4080 = precise::min(_4066, _4068);
    float _4082 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _4084 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _4086 = _3982 * _4020;
    float _4088 = fma(_3398, (*spvDescriptorSet0.vp_c9)._m0[98].z, _4082);
    float _4090 = fma(_3430, (*spvDescriptorSet0.vp_c9)._m0[83].w, _4084);
    float _4092 = _3974 + (-1.0);
    float _4094 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _4096 = _3398 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _4098 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _4100 = fma(_4092, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _4102 = -_4094;
    float _4104 = fma(_4096, 2.0, _4102);
    float _4106 = fma(_3406, (*spvDescriptorSet0.vp_c9)._m0[98].w, _4098);
    float _4108 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _4110 = _3406 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _4112 = _4072 * _4080;
    out.m_74.w = _4080;
    float _4114 = fma(_4110, -2.0, _4108);
    float _4116 = _3998 * _4112;
    float _4118 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _4120 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _4122 = _4004 * _4112;
    float _4124 = -_4116;
    float _4126 = _3998 + _4124;
    bool _4128 = !_3548;
    int _4130 = _4128 ? 0 : 1;
    float _4132 = -_4118;
    float _4134 = fma(_3448, 2.0, _4132);
    float _4136 = -_4122;
    float _4138 = _4004 + _4136;
    float _4140 = _4126 * _4126;
    float _4142 = fma(_3434, -2.0, _4120);
    int _4144 = abs(_3572);
    float _4146 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _4148 = _4086 * _4146;
    float _4150 = fma(_4138, _4138, _4140);
    int _4152 = abs(_4130);
    float _4154 = in.m_76.x;
    float _4156 = in.m_76.y;
    float _4158 = in.m_76.z;
    float _4160 = float(_3466);
    float _4162 = fma(_1892, (*spvDescriptorSet0.vp_c9)._m0[166].x, _4064);
    float _4164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _4166 = float(_4144);
    float _4168 = -_159;
    float _4170 = fma(_4168, (*spvDescriptorSet0.vp_c9)._m0[96].x, _4104);
    float _4172 = float(_3932);
    float _4174 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4176 = _4076 * _4174;
    float _4178 = float(_4152);
    float _4180 = _4166 * _4160;
    float _4182 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _4184 = -_4148;
    float _4186 = fma(_4076, _4182, _4184);
    float _4188 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _4190 = _4060 * _4188;
    int _4192 = abs(_3854);
    float _4194 = _4178 * _4172;
    float _4196 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _4198 = -_4176;
    float _4200 = fma(_4060, _4196, _4198);
    float _4202 = _4186 * _4186;
    float _4204 = _4016 * _4112;
    float _4206 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4208 = -_4190;
    float _4210 = fma(_4086, _4206, _4208);
    float _4212 = _4194 * (-2.0);
    float _4214 = fma(_4200, _4200, _4202);
    float _4216 = -_4204;
    float _4218 = _4016 + _4216;
    float _4220 = _4180 * (-2.0);
    float _4222 = fma(_4212, _4154, _4154);
    float _4224 = float(_3504);
    float _4226 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    float _4228 = float(_4192);
    float _4230 = fma(_4078, _4220, _4078);
    float _4232 = fma(_4220, _4156, _4156);
    float _4234 = fma(_4062, _4212, _4062);
    float _4236 = fma(_3976, (*spvDescriptorSet0.vp_c9)._m0[196].x, _4222);
    float _4238 = _4228 * _4224;
    float _4240 = fma(_4000, (*spvDescriptorSet0.vp_c9)._m0[196].y, _4232);
    float _4242 = _4164 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _4244 = fma(_3964, _4234, _4236);
    float _4246 = _4238 * (-2.0);
    float _4248 = _1667 + 0.5;
    float _4250 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[97].w, _4106);
    float _4252 = _1677 + (-0.5);
    float _4254 = fma(_4246, _4158, _4158);
    float _4256 = fma(_4100, _4246, _4100);
    float _4258 = _4226 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _4260 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[96].y, _4114);
    float _4262 = fma(_3988, (*spvDescriptorSet0.vp_c9)._m0[196].z, _4254);
    float _4264 = fma(_3964, _4230, _4240);
    float _4266 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[97].z, _4088);
    float _4268 = fma(_4210, _4210, _4214);
    float _4270 = fma(_3964, _4256, _4262);
    float _4272 = fma(_4218, _4218, _4150);
    float _4274 = _4244 * 0.15915493667125701904296875;
    float _4276 = fma(_4242, _4248, _4170);
    float _4278 = -_4250;
    float _4280 = _4278 + 1.0;
    float _4282 = -_4258;
    float _4284 = -_4260;
    float _4286 = fma(_4282, _4252, _4284);
    float _4288 = _4264 * 0.15915493667125701904296875;
    float _4290 = -_4266;
    float _4292 = _4290 + 1.0;
    float _4294 = _4270 * 0.15915493667125701904296875;
    float _4296 = rsqrt(_4268);
    float _4298 = fma(_4280, _1677, _4286);
    float _4300 = -_4292;
    float _4302 = fma(_4300, _1667, _4276);
    float _4304 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _4306 = _3386 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _4308 = _741 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    out.m_78.x = _4302;
    out.m_78.y = _4298;
    float _4310 = sqrt(_4272);
    float _4312 = -_4304;
    float _4314 = fma(_4306, 2.0, _4312);
    float _4316 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    out.m_80.x = _4162;
    float _4318 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _261);
    int _4320 = abs(_2468);
    float _4322 = fma(_3394, -2.0, _4316);
    bool _4324 = !_3562;
    float _4326 = _4324 ? _265 : as_type<float>(_3124);
    float _4328 = _4274 * 6.283185482025146484375;
    float _4330 = sin(_4328);
    int _4332 = _2346 >> 31;
    float _4334 = _4200 * _4296;
    float _4336 = _4186 * _4296;
    float _4338 = _4210 * _4296;
    float _4340 = _4274 * 6.283185482025146484375;
    float _4342 = cos(_4340);
    float _4344 = _4072 * _4310;
    float _4346 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _265);
    float _4348 = _4308 * _4344;
    float _4350 = _4040 * _4344;
    float _4352 = _4288 * 6.283185482025146484375;
    float _4354 = sin(_4352);
    float _4356 = _4348 * _4346;
    float _4358 = _4350 * _4318;
    out.m_82.x = _4350;
    float _4360 = _4288 * 6.283185482025146484375;
    float _4362 = cos(_4360);
    float _4364 = _4294 * 6.283185482025146484375;
    float _4366 = cos(_4364);
    float _4368 = _4330 * _4354;
    float _4370 = _4342 * _4354;
    float _4372 = _4294 * 6.283185482025146484375;
    float _4374 = sin(_4372);
    float _4376 = _4330 * _4362;
    float _4378 = _4330 * _4366;
    float _4380 = _4342 * _4362;
    float _4382 = _4342 * _4366;
    int _4384 = _4332 & 3;
    float _4386 = _4076 * _4336;
    float _4388 = _4354 * _4366;
    float _4390 = _4362 * _4366;
    int _4392 = _2346 + _4384;
    float _4394 = _4086 * _4338;
    float _4396 = -_4370;
    float _4398 = fma(_4374, _4376, _4396);
    float _4400 = -_4376;
    float _4402 = fma(_4374, _4370, _4400);
    int _4404 = _2884 >> 31;
    float _4406 = -_4394;
    float _4408 = fma(_4076, _4334, _4406);
    int _4410 = _2376 >> 31;
    float _4412 = -_4386;
    float _4414 = fma(_4060, _4338, _4412);
    int _4416 = _4404 & 3;
    float _4418 = _4382 * _4408;
    int _4420 = _4392 >> 2;
    float _4422 = _4382 * _4414;
    int _4424 = _2884 + _4416;
    float _4426 = -_4374;
    float _4428 = fma(_4426, _4336, _4418);
    int _4430 = _4410 & 3;
    float _4432 = fma(_4374, _4380, _4368);
    int _4434 = _3006 >> 31;
    float _4436 = _4382 * _4356;
    int _4438 = _4420 << 4;
    int _4440 = _4438 + 368;
    float _4442 = fma(_4374, _4368, _4380);
    int _4444 = _2376 + _4430;
    float _4446 = -_4374;
    float _4448 = fma(_4446, _4334, _4422);
    int _4450 = _4434 & 3;
    float _4452 = _4060 * _4334;
    uint _4454 = uint(int(uint(_4440) >> uint(2)));
    uint _4456 = uint(int(uint(int(_4454)) >> uint(2)));
    int _4458 = int(_4454) & 3;
    float _4460 = (*spvDescriptorSet0.vp_c9)._m0[int(_4456)][_4458];
    int _4462 = int(_4454) + 1;
    uint _4464 = uint(int(uint(_4462) >> uint(2)));
    int _4466 = _4462 & 3;
    float _4468 = (*spvDescriptorSet0.vp_c9)._m0[int(_4464)][_4466];
    int _4470 = _4424 >> 2;
    float _4472 = fma(_4432, _4358, _4436);
    float _4474 = -_4452;
    float _4476 = fma(_4086, _4336, _4474);
    float _4478 = -_4356;
    float _4480 = _4374 * _4478;
    int _4482 = _3006 + _4450;
    float _4484 = _4432 * _4408;
    int _4486 = _4444 >> 2;
    float _4488 = fma(_4390, _4358, _4480);
    int _4490 = _4482 >> 2;
    float _4492 = _4432 * _4414;
    int _4494 = _4470 << 4;
    int _4496 = _4494 + 656;
    float _4498 = _4382 * _4476;
    int _4500 = _4490 << 4;
    int _4502 = _4500 + 800;
    float _4504 = _4432 * _4476;
    int _4506 = _4486 << 4;
    int _4508 = _4506 + 512;
    float _4510 = fma(_4390, _4334, _4492);
    float _4512 = fma(_4390, _4336, _4484);
    uint _4514 = uint(int(uint(_4502) >> uint(2)));
    uint _4516 = uint(int(uint(int(_4514)) >> uint(2)));
    int _4518 = int(_4514) & 3;
    float _4520 = (*spvDescriptorSet0.vp_c9)._m0[int(_4516)][_4518];
    int _4522 = int(_4514) + 1;
    uint _4524 = uint(int(uint(_4522) >> uint(2)));
    int _4526 = _4522 & 3;
    float _4528 = (*spvDescriptorSet0.vp_c9)._m0[int(_4524)][_4526];
    float _4530 = -_4374;
    float _4532 = fma(_4530, _4338, _4498);
    float _4534 = fma(_4390, _4338, _4504);
    float _4536 = _4378 * _4356;
    float _4538 = fma(_4378, _4060, _4428);
    float _4540 = _4344 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _4542 = _4540 * 0.5;
    float _4544 = _4402 * _4414;
    float _4546 = _4402 * _4408;
    uint _4548 = uint(int(uint(_4496) >> uint(2)));
    uint _4550 = uint(int(uint(int(_4548)) >> uint(2)));
    int _4552 = int(_4548) & 3;
    float _4554 = (*spvDescriptorSet0.vp_c9)._m0[int(_4550)][_4552];
    int _4556 = int(_4548) + 1;
    uint _4558 = uint(int(uint(_4556) >> uint(2)));
    int _4560 = _4556 & 3;
    float _4562 = (*spvDescriptorSet0.vp_c9)._m0[int(_4558)][_4560];
    float _4564 = _4402 * _4476;
    float _4566 = fma(_4398, _4358, _4536);
    float _4568 = fma(_4378, _4076, _4532);
    float _4570 = fma(_4388, _4542, _4488);
    float _4572 = fma(_4402, _4542, _4472);
    float _4574 = fma(_4388, _4334, _4544);
    float _4576 = fma(_4388, _4336, _4546);
    uint _4578 = uint(int(uint(_4508) >> uint(2)));
    uint _4580 = uint(int(uint(int(_4578)) >> uint(2)));
    int _4582 = int(_4578) & 3;
    float _4584 = (*spvDescriptorSet0.vp_c9)._m0[int(_4580)][_4582];
    int _4586 = int(_4578) + 1;
    uint _4588 = uint(int(uint(_4586) >> uint(2)));
    int _4590 = _4586 & 3;
    float _4592 = (*spvDescriptorSet0.vp_c9)._m0[int(_4588)][_4590];
    float _4594 = fma(_4388, _4338, _4564);
    float _4596 = _4476 * _4572;
    float _4598 = _4414 * _4572;
    int _4600 = ~_4320;
    int _4602 = _4600 + 1;
    int _4604 = _4602 + 1;
    float _4606 = fma(_4442, _4542, _4566);
    int _4608 = abs(_2492);
    float _4610 = fma(_4334, _4570, _4598);
    int _4612 = _4508 + 8;
    uint _4614 = uint(int(uint(_4612) >> uint(2)));
    uint _4616 = uint(int(uint(int(_4614)) >> uint(2)));
    int _4618 = int(_4614) & 3;
    float _4620 = (*spvDescriptorSet0.vp_c9)._m0[int(_4616)][_4618];
    int _4622 = int(_4614) + 1;
    uint _4624 = uint(int(uint(_4622) >> uint(2)));
    int _4626 = _4622 & 3;
    float _4628 = (*spvDescriptorSet0.vp_c9)._m0[int(_4624)][_4626];
    int _4630 = abs(_3536);
    float _4632 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _4634 = int(_4632);
    int _4636 = abs(_3044);
    float _4638 = fma(_4378, _4086, _4448);
    int _4640 = ~_4608;
    int _4642 = _4640 + 1;
    int _4644 = _4642 + 1;
    int _4646 = _4604 * as_type<int>(_4468);
    int _4648 = abs(_3358);
    int _4650 = _4440 + 8;
    uint _4652 = uint(int(uint(_4650) >> uint(2)));
    uint _4654 = uint(int(uint(int(_4652)) >> uint(2)));
    int _4656 = int(_4652) & 3;
    float _4658 = (*spvDescriptorSet0.vp_c9)._m0[int(_4654)][_4656];
    int _4660 = int(_4652) + 1;
    uint _4662 = uint(int(uint(_4660) >> uint(2)));
    int _4664 = _4660 & 3;
    float _4666 = (*spvDescriptorSet0.vp_c9)._m0[int(_4662)][_4664];
    int _4668 = abs(_3032);
    float _4670 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _4672 = int(_4670);
    int _4674 = ~_4636;
    int _4676 = _4674 + 1;
    int _4678 = _4676 + 1;
    float _4680 = fma(_4338, _4570, _4596);
    int _4682 = ~_4648;
    int _4684 = _4682 + 1;
    int _4686 = _4684 + 1;
    float _4688 = fma(_4442, _4086, _4574);
    int _4690 = ~_4630;
    int _4692 = _4690 + 1;
    int _4694 = _4692 + 1;
    int _4696 = _4496 + 8;
    uint _4698 = uint(int(uint(_4696) >> uint(2)));
    uint _4700 = uint(int(uint(int(_4698)) >> uint(2)));
    int _4702 = int(_4698) & 3;
    float _4704 = (*spvDescriptorSet0.vp_c9)._m0[int(_4700)][_4702];
    int _4706 = int(_4698) + 1;
    uint _4708 = uint(int(uint(_4706) >> uint(2)));
    int _4710 = _4706 & 3;
    float _4712 = (*spvDescriptorSet0.vp_c9)._m0[int(_4708)][_4710];
    int _4714 = ~_4668;
    int _4716 = _4714 + 1;
    int _4718 = _4716 + 1;
    int _4720 = _4686 * as_type<int>(_4460);
    int _4722 = _4720 + _4646;
    int _4724 = abs(_3076);
    float _4726 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _4728 = int(_4726);
    float _4730 = fma(_4442, _4060, _4576);
    float _4732 = fma(_4442, _4076, _4594);
    int _4734 = ~_4724;
    int _4736 = _4734 + 1;
    int _4738 = _4736 + 1;
    int _4740 = _4502 + 8;
    uint _4742 = uint(int(uint(_4740) >> uint(2)));
    uint _4744 = uint(int(uint(int(_4742)) >> uint(2)));
    int _4746 = int(_4742) & 3;
    float _4748 = (*spvDescriptorSet0.vp_c9)._m0[int(_4744)][_4746];
    int _4750 = int(_4742) + 1;
    uint _4752 = uint(int(uint(_4750) >> uint(2)));
    int _4754 = _4750 & 3;
    float _4756 = (*spvDescriptorSet0.vp_c9)._m0[int(_4752)][_4754];
    int _4758 = _4678 * as_type<int>(_4528);
    int _4760 = abs(_3512);
    int _4762 = abs(_3518);
    int _4764 = ~_4760;
    int _4766 = _4764 + 1;
    int _4768 = _4766 + 1;
    int _4770 = _4718 * as_type<int>(_4562);
    float _4772 = float(uint(_4634));
    int _4774 = ~_4762;
    int _4776 = _4774 + 1;
    int _4778 = _4776 + 1;
    int _4780 = _4768 * as_type<int>(_4554);
    int _4782 = _4780 + _4770;
    float _4784 = 1.0 / _4772;
    float _4786 = float(uint(_4672));
    int _4788 = _4644 * as_type<int>(_4592);
    int _4790 = ~_4728;
    int _4792 = _4790 + 1;
    int _4794 = _4778 * as_type<int>(_4520);
    int _4796 = _4794 + _4758;
    int _4798 = abs(_3522);
    int _4800 = _4694 * as_type<int>(_4584);
    int _4802 = _4800 + _4788;
    float _4804 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _4806 = int(_4804);
    int _4808 = ~_3088;
    int _4810 = _4808 + 1;
    int _4812 = _4810 + 1;
    int _4814 = ~_4798;
    int _4816 = _4814 + 1;
    int _4818 = _4816 + 1;
    int _4820 = abs(_4634);
    int _4822 = _4812 * as_type<int>(_4620);
    int _4824 = _4822 + _4802;
    int _4826 = abs(_3118);
    int _4828 = abs(_3136);
    int _4830 = ~_4826;
    int _4832 = _4830 + 1;
    int _4834 = _4832 + 1;
    int _4836 = _4738 * as_type<int>(_4658);
    int _4838 = _4836 + _4722;
    int _4840 = ~_4828;
    int _4842 = _4840 + 1;
    int _4844 = _4842 + 1;
    float _4846 = 1.0 / _4786;
    int _4848 = abs(_3362);
    int _4850 = _4818 * as_type<int>(_4666);
    int _4852 = _4850 + _4838;
    int _4854 = abs(_3582);
    int _4856 = _4834 * as_type<int>(_4704);
    int _4858 = _4856 + _4782;
    int _4860 = abs(_3544);
    int _4862 = ~_4854;
    int _4864 = _4862 + 1;
    int _4866 = _4864 + 1;
    int _4868 = ~_4860;
    int _4870 = _4868 + 1;
    int _4872 = _4870 + 1;
    int _4874 = abs(_4806);
    int _4876 = _4844 * as_type<int>(_4748);
    int _4878 = _4876 + _4796;
    int _4880 = abs(_3402);
    bool _4882 = !_3410;
    int _4884 = _4882 ? 0 : 1;
    int _4886 = abs(_3792);
    int _4888 = _4872 * as_type<int>(_4712);
    int _4890 = _4888 + _4858;
    float _4892 = fma(_4076, _4606, _4680);
    int _4894 = _4866 * as_type<int>(_4628);
    int _4896 = _4894 + _4824;
    int _4898 = ~_4886;
    int _4900 = _4898 + 1;
    int _4902 = _4900 + 1;
    int _4904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _4906 = _4904 != 0;
    int _4908 = abs(_4884);
    float _4910 = _3978 + _4892;
    int _4912 = _4902 * as_type<int>(_4756);
    int _4914 = _4912 + _4878;
    float _4916 = fma(_4086, _4606, _4610);
    int _4918 = ~_4880;
    int _4920 = _4918 + 1;
    int _4922 = _4920 + 1;
    bool _4924 = !_4906;
    int _4926 = _4924 ? 0 : 1;
    int _4928 = ~_4908;
    int _4930 = _4928 + 1;
    int _4932 = _4930 + 1;
    float _4934 = _3952 + _4916;
    float _4936 = float(uint(_4806));
    int _4938 = _4852 * _4922;
    float _4940 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _4942 = _4910 + _4940;
    int _4944 = _4896 * _4932;
    int _4946 = ~_4848;
    int _4948 = _4946 + 1;
    int _4950 = _4948 + 1;
    float _4952 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _4954 = _4934 + _4952;
    float _4956 = _4942 * _4942;
    int _4958 = _3250 * _4908;
    int _4960 = _4958 + _4944;
    float _4962 = float(uint(_4728));
    int _4964 = _3348 * _4880;
    int _4966 = _4964 + _4938;
    float _4968 = fma(_4954, _4954, _4956);
    int _4970 = _4890 * _4950;
    int _4972 = as_type<int>(_4846) + (-2);
    float _4974 = 1.0 / _4936;
    float _4976 = float(uint(_4960));
    int _4978 = _3324 * _4848;
    int _4980 = _4978 + _4970;
    int _4982 = abs(_4926);
    float _4984 = _4408 * _4572;
    int _4986 = as_type<int>(_4784) + (-2);
    float _4988 = as_type<float>(_4972) * _4976;
    float _4990 = float(uint(_4966));
    float _4992 = 1.0 / _4962;
    float _4994 = float(uint(_4820));
    int _4996 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _4998 = _4996 != 0;
    float _5000 = as_type<float>(_4986) * _4990;
    int _5002 = abs(_4672);
    float _5004 = _261 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _5006 = ~_4982;
    int _5008 = _5006 + 1;
    int _5010 = _5008 + 1;
    float _5012 = 1.0 / _4994;
    float _5014 = float(uint(_5002));
    float _5016 = fma(_4336, _4570, _4984);
    float _5018 = float(uint(_4874));
    int _5020 = _4914 * _5010;
    int _5022 = as_type<int>(_4974) + (-2);
    float _5024 = fma(_4060, _4606, _5016);
    float _5026 = float(uint(_4980));
    float _5028 = trunc(_4988);
    float _5030 = precise::max(_5028, 0.0);
    uint _5032 = uint(_5030);
    int _5034 = _3368 * _4982;
    int _5036 = _5034 + _5020;
    int _5038 = ~_4672;
    int _5040 = _5038 + 1;
    int _5042 = abs(_4728);
    float _5044 = as_type<float>(_5022) * _5026;
    int _5046 = as_type<int>(_4992) + (-2);
    float _5048 = trunc(_5000);
    float _5050 = precise::max(_5048, 0.0);
    uint _5052 = uint(_5050);
    float _5054 = float(uint(_5042));
    float _5056 = float(uint(_5036));
    int _5058 = ~_4634;
    int _5060 = _5058 + 1;
    float _5062 = 1.0 / _5014;
    int _5064 = abs(_4966);
    float _5066 = as_type<float>(_5046) * _5056;
    int _5068 = as_type<int>(_5012) + (-2);
    int _5070 = _5040 * int(_5032);
    int _5072 = _5070 + _4960;
    int _5074 = abs(_4960);
    float _5076 = float(uint(_5064));
    float _5078 = 1.0 / _5018;
    int _5080 = _5060 * int(_5052);
    int _5082 = _5080 + _4966;
    float _5084 = float(uint(_5072));
    float _5086 = as_type<float>(_5068) * _5076;
    float _5088 = float(uint(_5082));
    float _5090 = as_type<float>(_4972) * _5084;
    float _5092 = 1.0 / _5054;
    int _5094 = as_type<int>(_5062) + (-2);
    float _5096 = fma(_4398, _4076, _4534);
    int _5098 = abs(_4980);
    float _5100 = as_type<float>(_4986) * _5088;
    int _5102 = abs(_5036);
    float _5104 = fma(_4398, _4086, _4510);
    float _5106 = float(uint(_5098));
    float _5108 = trunc(_5044);
    float _5110 = precise::max(_5108, 0.0);
    uint _5112 = uint(_5110);
    int _5114 = as_type<int>(_5078) + (-2);
    float _5116 = _265 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5118 = as_type<float>(_5114) * _5106;
    float _5120 = fma(_4398, _4060, _4512);
    float _5122 = trunc(_5066);
    float _5124 = precise::max(_5122, 0.0);
    uint _5126 = uint(_5124);
    int _5128 = as_type<int>(_5092) + (-2);
    float _5130 = _5116 * _4568;
    float _5132 = float(uint(_5102));
    out.m_84.x = _5104;
    out.m_84.y = _5120;
    out.m_84.z = _5096;
    float _5134 = -_261;
    int _5136 = _3968 ? as_type<int>(_5134) : as_type<int>(_261);
    float _5138 = as_type<float>(_5102);
    float _5140 = _4060;
    float _5142 = _4934;
    float _5144 = _4910;
    if (!_3586)
    {
        _5138 = _261;
    }
    float _5146 = _5138;
    float _5148 = trunc(_5118);
    float _5150 = precise::max(_5148, 0.0);
    uint _5152 = uint(_5150);
    float _5154 = as_type<float>(_5128) * _5132;
    float _5156 = -_261;
    int _5158 = _3862 ? as_type<int>(_5156) : as_type<int>(_261);
    float _5160 = _5146;
    if (_3586)
    {
        float _5162 = -_261;
        float _5164 = _4012 ? _5162 : _261;
        _5160 = _5164;
    }
    float _5166 = _5160;
    bool _5168 = !_4998;
    float _5170 = _5168 ? _261 : as_type<float>(_5158);
    float _5172 = _5116 * _4638;
    float _5174 = sqrt(_4968);
    int _5176 = ~_4806;
    int _5178 = _5176 + 1;
    int _5180 = _4792 * int(_5126);
    int _5182 = _5180 + _5036;
    bool _5184 = !_3590;
    float _5186 = _5184 ? _261 : as_type<float>(_5136);
    float _5188 = float(uint(_5074));
    int _5190 = _5178 * int(_5112);
    int _5192 = _5190 + _4980;
    float _5194 = _5116 * _4538;
    float _5196 = trunc(_5086);
    float _5198 = precise::max(_5196, 0.0);
    uint _5200 = uint(_5198);
    int _5202 = ~_4820;
    int _5204 = _5202 + 1;
    float _5206 = as_type<float>(_5094) * _5188;
    float _5208 = float(uint(_5192));
    float _5210 = fma(_5004, _5104, _5172);
    float _5212 = fma(_5004, _5120, _5194);
    float _5214 = fma(_5004, _5096, _5130);
    float _5216 = float(uint(_5182));
    float _5218 = as_type<float>(_5022) * _5208;
    float _5220 = trunc(_5206);
    float _5222 = precise::max(_5220, 0.0);
    uint _5224 = uint(_5222);
    bool _5226 = _5174 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5228 = _3924 + _5024;
    float _5230 = as_type<float>(_5046) * _5216;
    int _5232 = ~_5002;
    int _5234 = _5232 + 1;
    float _5236 = trunc(_5154);
    float _5238 = precise::max(_5236, 0.0);
    uint _5240 = uint(_5238);
    int _5242 = _5204 * int(_5200);
    int _5244 = _5242 + _5064;
    int _5246 = ~_4874;
    int _5248 = _5246 + 1;
    if (!_5226)
    {
        _5140 = _4934;
    }
    float _5250 = _5140;
    float _5252 = trunc(_5100);
    float _5254 = precise::max(_5252, 0.0);
    uint _5256 = uint(_5254);
    float _5258 = _5250;
    if (!_5226)
    {
        _5142 = _4910;
    }
    float _5260 = _5142;
    int _5262 = _5234 * int(_5224);
    int _5264 = _5262 + _5074;
    float _5266 = float(uint(_5244));
    float _5268 = _5260;
    if (!_5226)
    {
        _5144 = _5228;
    }
    float _5270 = _5144;
    float _5272 = trunc(_5090);
    float _5274 = precise::max(_5272, 0.0);
    uint _5276 = uint(_5274);
    float _5278 = trunc(_5218);
    float _5280 = precise::max(_5278, 0.0);
    uint _5282 = uint(_5280);
    float _5284 = trunc(_5230);
    float _5286 = precise::max(_5284, 0.0);
    uint _5288 = uint(_5286);
    bool _5290 = !_5226;
    float _5292 = _5270;
    if (!_5290)
    {
        float _5294 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5296 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _5298 = _5174 + _5296;
        float _5300 = _5228 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5302 = rsqrt(_4968);
        float _5304 = _5298 * _5294;
        float _5306 = _5304 * 0.15915493667125701904296875;
        float _5308 = _5306 * 6.283185482025146484375;
        float _5310 = cos(_5308);
        float _5312 = _5306 * 6.283185482025146484375;
        float _5314 = sin(_5312);
        float _5316 = _5310 + (-1.0);
        float _5318 = _5316 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5320 = fma(_5314, _5300, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _5322 = fma(_5228, _5310, _5318);
        float _5324 = _5302 * _5320;
        float _5326 = fma(_4954, _5324, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _5328 = fma(_4942, _5324, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _5258 = _5326;
        _5292 = _5322;
        _5268 = _5328;
    }
    float _5330 = _5258;
    float _5332 = _5292;
    float _5334 = _5268;
    int _5336 = _5248 * int(_5152);
    int _5338 = _5336 + _5098;
    int _5340 = ~_5042;
    int _5342 = _5340 + 1;
    float _5344 = as_type<float>(_5068) * _5266;
    float _5346 = float(uint(_5264));
    float _5348 = -_159;
    float _5350 = fma(_5348, (*spvDescriptorSet0.vp_c9)._m0[86].x, _4314);
    float _5352 = float(uint(_5338));
    float _5354 = trunc(_5344);
    float _5356 = precise::max(_5354, 0.0);
    uint _5358 = uint(_5356);
    float _5360 = as_type<float>(_5094) * _5346;
    int _5362 = int(_5126) + int(_5288);
    float _5364 = as_type<float>(_5114) * _5352;
    int _5366 = int(_5052) + int(_5256);
    int _5368 = _5342 * int(_5240);
    int _5370 = _5368 + _5102;
    int _5372 = ~_4634;
    int _5374 = _5372 + 1;
    float _5376 = trunc(_5364);
    float _5378 = precise::max(_5376, 0.0);
    uint _5380 = uint(_5378);
    int _5382 = int(_5032) + int(_5276);
    float _5384 = -_159;
    float _5386 = fma(_5384, (*spvDescriptorSet0.vp_c9)._m0[81].x, _4134);
    float _5388 = float(uint(_5370));
    int _5390 = _5374 * _5366;
    int _5392 = _5390 + _4966;
    int _5394 = ~_4672;
    int _5396 = _5394 + 1;
    float _5398 = -_159;
    float _5400 = fma(_5398, (*spvDescriptorSet0.vp_c9)._m0[91].x, _4056);
    int _5402 = int(_5112) + int(_5282);
    float _5404 = as_type<float>(_5128) * _5388;
    float _5406 = trunc(_5360);
    float _5408 = precise::max(_5406, 0.0);
    uint _5410 = uint(_5408);
    int _5412 = ~_4728;
    int _5414 = _5412 + 1;
    int _5416 = _5396 * _5382;
    int _5418 = _5416 + _4960;
    bool _5420 = uint(_5392) >= uint(_4634);
    float _5422 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[86].y, _4322);
    int _5424 = int(_5200) + int(_5358);
    int _5426 = _5414 * _5362;
    int _5428 = _5426 + _5036;
    bool _5430 = uint(_5418) >= uint(_4672);
    float _5432 = trunc(_5404);
    float _5434 = precise::max(_5432, 0.0);
    uint _5436 = uint(_5434);
    int _5438 = ~_4806;
    int _5440 = _5438 + 1;
    float _5442 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[92].w, _4034);
    bool _5444 = uint(_5428) >= uint(_4728);
    float _5446 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3970);
    int _5448 = ~_5042;
    int _5450 = _5448 + 1;
    int _5452 = _5440 * _5402;
    int _5454 = _5452 + _4980;
    int _5456 = ~_4820;
    int _5458 = _5456 + 1;
    float _5460 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3934);
    int _5462 = int(_5152) + int(_5380);
    float _5464 = -_5446;
    float _5466 = _5464 + 1.0;
    int _5468 = ~_4874;
    int _5470 = _5468 + 1;
    int _5472 = _5458 * _5424;
    int _5474 = _5472 + _5064;
    bool _5476 = !_5420;
    int _5478 = _5476 ? 0 : (-1);
    float _5480 = -_5460;
    float _5482 = _5480 + 1.0;
    int _5484 = int(_5224) + int(_5410);
    int _5486 = _5470 * _5462;
    int _5488 = _5486 + _5098;
    int _5490 = int(_5240) + int(_5436);
    float _5492 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _5494 = uint(_5474) >= uint(_4820);
    float _5496 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[92].z, _4042);
    int _5498 = ~_5366;
    int _5500 = _5498 + _5478;
    int _5502 = _5500 + 1;
    int _5504 = _5450 * _5490;
    int _5506 = _5504 + _5102;
    int _5508 = ~_5002;
    int _5510 = _5508 + 1;
    float _5512 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3966);
    bool _5514 = !_5430;
    int _5516 = _5514 ? 0 : (-1);
    float _5518 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _5520 = uint(_5454) >= uint(_4806);
    int _5522 = _4634 * _5502;
    int _5524 = _5522 + _4966;
    int _5526 = ~_5382;
    int _5528 = _5526 + _5516;
    int _5530 = _5528 + 1;
    int _5532 = _5510 * _5484;
    int _5534 = _5532 + _5074;
    bool _5536 = _4634 == 0;
    float _5538 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3986);
    bool _5540 = uint(_5488) >= uint(_4874);
    int _5542 = _4672 * _5530;
    int _5544 = _5542 + _4960;
    bool _5546 = !_5520;
    int _5548 = _5546 ? 0 : (-1);
    float _5550 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _5552 = _4966 ^ _4634;
    float _5554 = _5492 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _5556 = !_5536;
    int _5558 = _5556 ? _5524 : (-1);
    float _5560 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[82].z, _4070);
    bool _5562 = uint(_5534) >= uint(_5002);
    float _5564 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[82].w, _4090);
    int _5566 = ~_5402;
    int _5568 = _5566 + _5548;
    int _5570 = _5568 + 1;
    float _5572 = -_5560;
    float _5574 = _5572 + 1.0;
    bool _5576 = _4672 == 0;
    float _5578 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _5580 = !_5494;
    int _5582 = _5580 ? 0 : (-1);
    int _5584 = _4806 * _5570;
    int _5586 = _5584 + _4980;
    uint _5588 = uint(int(uint(_5552) >> uint(31)));
    float _5590 = -_5538;
    float _5592 = _5590 + 1.0;
    bool _5594 = !_5562;
    int _5596 = _5594 ? 0 : (-1);
    float _5598 = -_5564;
    float _5600 = _5598 + 1.0;
    bool _5602 = !_5576;
    int _5604 = _5602 ? _5544 : (-1);
    bool _5606 = _4806 == 0;
    bool _5608 = _4806 == 0;
    int _5610 = _4980 ^ _4806;
    float _5612 = _5518 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _5614 = ~_5582;
    int _5616 = _5424 + _5614;
    int _5618 = _5616 + 1;
    float _5620 = -_159;
    float _5622 = fma(_5620, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3916);
    int _5624 = ~int(_5588);
    int _5626 = _5624 + 1;
    float _5628 = _5578 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _5630 = float(_5558);
    bool _5632 = uint(_5506) >= uint(_5042);
    bool _5634 = !_5444;
    int _5636 = _5634 ? 0 : (-1);
    float _5638 = fma(_5612, _5630, _5622);
    int _5640 = _4960 ^ _4672;
    int _5642 = _5618 ^ _5626;
    int _5644 = ~_5362;
    int _5646 = _5644 + _5636;
    int _5648 = _5646 + 1;
    bool _5650 = !_5606;
    int _5652 = _5650 ? _5586 : (-1);
    uint _5654 = uint(int(uint(_5640) >> uint(31)));
    int _5656 = ~_5626;
    int _5658 = _5656 + _5642;
    int _5660 = _5658 + 1;
    int _5662 = _5036 ^ _4728;
    float _5664 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _5666 = float(_5652);
    int _5668 = _4728 * _5648;
    int _5670 = _5668 + _5036;
    bool _5672 = !_5540;
    int _5674 = _5672 ? 0 : (-1);
    int _5676 = ~_5596;
    int _5678 = _5484 + _5676;
    int _5680 = _5678 + 1;
    float _5682 = fma(_5554, _5666, _5350);
    int _5684 = ~int(_5654);
    int _5686 = _5684 + 1;
    float _5688 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _5690 = _4728 == 0;
    int _5692 = _5680 ^ _5686;
    bool _5694 = !_5690;
    int _5696 = _5694 ? _5670 : (-1);
    uint _5698 = uint(int(uint(_5610) >> uint(31)));
    float _5700 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    int _5702 = ~_5674;
    int _5704 = _5462 + _5702;
    int _5706 = _5704 + 1;
    float _5708 = _5664 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    int _5710 = ~_5686;
    int _5712 = _5710 + _5692;
    int _5714 = _5712 + 1;
    float _5716 = float(_5604);
    float _5718 = float(_5696);
    float _5720 = _5186 + 0.5;
    int _5722 = ~int(_5698);
    int _5724 = _5722 + 1;
    float _5726 = fma(_5628, _5716, _5386);
    bool _5728 = _4634 == 0;
    float _5730 = fma(_5612, _5720, _5638);
    bool _5732 = !_5632;
    int _5734 = _5732 ? 0 : (-1);
    float _5736 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    uint _5738 = uint(int(uint(_5662) >> uint(31)));
    float _5740 = _5170 + 0.5;
    int _5742 = _5706 ^ _5724;
    float _5744 = _5550 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _5746 = _4672 == 0;
    float _5748 = fma(_5708, _5718, _5400);
    int _5750 = ~_5734;
    int _5752 = _5490 + _5750;
    int _5754 = _5752 + 1;
    float _5756 = fma(_5628, _5740, _5726);
    int _5758 = ~int(_5738);
    int _5760 = _5758 + 1;
    float _5762 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[76].y, _4028);
    bool _5764 = !_5728;
    int _5766 = _5764 ? _5660 : (-1);
    float _5768 = _5688 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _5770 = ~_5724;
    int _5772 = _5770 + _5742;
    int _5774 = _5772 + 1;
    float _5776 = _5166 + 0.5;
    int _5778 = _5754 ^ _5760;
    float _5780 = _1761 + 0.5;
    bool _5782 = !_5746;
    int _5784 = _5782 ? _5714 : (-1);
    float _5786 = fma(_5708, _5776, _5748);
    float _5788 = float(_5766);
    float _5790 = _5700 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    bool _5792 = _4728 == 0;
    float _5794 = fma(_5116, _5116, 1.0);
    int _5796 = ~_5760;
    int _5798 = _5796 + _5778;
    int _5800 = _5798 + 1;
    float _5802 = -_5762;
    float _5804 = fma(_5744, _5788, _5802);
    float _5806 = float(_5784);
    float _5808 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[81].y, _4142);
    bool _5810 = !_5608;
    int _5812 = _5810 ? _5774 : (-1);
    float _5814 = rsqrt(_5794);
    bool _5816 = !_5792;
    int _5818 = _5816 ? _5800 : (-1);
    float _5820 = -_5808;
    float _5822 = fma(_5768, _5806, _5820);
    float _5824 = fma(_5554, _5780, _5682);
    float _5826 = float(_5812);
    float _5828 = _5736 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _5830 = float(_5818);
    float _5832 = _4326 + (-0.5);
    float _5834 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[91].y, _4074);
    float _5836 = -_5422;
    float _5838 = fma(_5828, _5826, _5836);
    float _5840 = -_5466;
    float _5842 = fma(_1761, _5840, _5824);
    float _5844 = -_5744;
    float _5846 = fma(_5844, _5832, _5804);
    float _5848 = -_5834;
    float _5850 = fma(_5790, _5830, _5848);
    float _5852 = _1523 + (-0.5);
    float _5854 = _1819 + (-0.5);
    float _5856 = _1765 + (-0.5);
    float _5858 = -_3952;
    float _5860 = _5858 + _5330;
    float _5862 = -_5790;
    float _5864 = fma(_5862, _5852, _5850);
    float _5866 = -_5442;
    float _5868 = _5866 + 1.0;
    float _5870 = -_5768;
    float _5872 = fma(_5870, _5854, _5822);
    float _5874 = _5116 * _5814;
    float _5876 = -_5828;
    float _5878 = fma(_5876, _5856, _5838);
    float _5880 = fma(_5868, _1523, _5864);
    float _5882 = -_3924;
    float _5884 = _5882 + _5332;
    float _5886 = -_4730;
    float _5888 = _5874 * _5886;
    float _5890 = -_4688;
    float _5892 = _5874 * _5890;
    float _5894 = -_4732;
    float _5896 = _5874 * _5894;
    float _5898 = _5884 * _5884;
    float _5900 = fma(_1765, _5482, _5878);
    float _5902 = fma(_5814, _4538, _5888);
    float _5904 = fma(_5814, _4568, _5896);
    float _5906 = -_3978;
    float _5908 = _5906 + _5334;
    float _5910 = fma(_5860, _5860, _5898);
    float _5912 = -_5496;
    float _5914 = _5912 + 1.0;
    float _5916 = -_5512;
    float _5918 = _5916 + 1.0;
    float _5920 = -_5574;
    float _5922 = fma(_5170, _5920, _5756);
    float _5924 = fma(_5908, _5908, _5910);
    float _5926 = -_5914;
    float _5928 = fma(_5926, _5166, _5786);
    float _5930 = fma(_5814, _4638, _5892);
    float _5932 = -_5918;
    float _5934 = fma(_5186, _5932, _5730);
    float _5936 = sqrt(_5924);
    float _5938 = fma(_4326, _5592, _5846);
    float _5940 = fma(_1819, _5600, _5872);
    float _5942 = _4688 + _5210;
    float _5944 = _4730 + _5212;
    float _5946 = _4732 + _5214;
    out.m_86.x = _5842;
    out.m_86.y = _5900;
    float _5948 = -_4122;
    float _5950 = _5948 + _5330;
    float _5952 = -_4204;
    float _5954 = _5952 + _5334;
    float _5956 = -_4204;
    float _5958 = _3978 + _5956;
    out.m_88.x = _5934;
    out.m_88.y = _5938;
    out.m_88.z = _5922;
    out.m_88.w = _5940;
    out.m_90.x = _5928;
    out.m_90.y = _5880;
    bool _5960 = _5936 > 0.0;
    float _5962 = -_4122;
    float _5964 = _3952 + _5962;
    out.m_92.x = _5942;
    out.m_92.y = _5944;
    out.m_92.z = _5946;
    float _5966 = -_4116;
    float _5968 = _5966 + _5332;
    float _5970 = -_4116;
    float _5972 = _3924 + _5970;
    out.m_94.x = _5930;
    out.m_94.y = _5902;
    out.m_94.z = _5904;
    float _5974 = _5930;
    float _5976 = _5902;
    float _5978 = _5904;
    float _5980 = _5938;
    float _5982 = _5934;
    float _5984 = _5730;
    float _5986 = _5954;
    float _5988 = _5968;
    if (!_5960)
    {
        _5974 = _5950;
    }
    float _5990 = _5974;
    float _5992 = _5990;
    if (!_5960)
    {
        _5976 = _5968;
    }
    float _5994 = _5976;
    float _5996 = _5994;
    float _5998 = _5994;
    if (!_5960)
    {
        _5978 = _5954;
    }
    float _6000 = _5978;
    bool _6002 = !_5960;
    float _6004 = _6000;
    float _6006 = _6000;
    if (!_6002)
    {
        bool _6008 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _6010 = _5990;
        if (_6008)
        {
            float _6012 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _6010 = _6012;
        }
        float _6014 = _6010;
        float _6016 = _6014;
        float _6018 = _6014;
        if (_6008)
        {
            float _6020 = _481 * _6014;
            _5980 = _6020;
        }
        float _6022 = _5980;
        float _6024 = _6022;
        if (_6008)
        {
            float _6026 = _483 * _6014;
            _5982 = _6026;
        }
        float _6028 = _5982;
        float _6030 = _6028;
        if (_6008)
        {
            float _6032 = _485 * _6014;
            _5984 = _6032;
        }
        float _6034 = _5984;
        float _6036 = _6034;
        if (!_6008)
        {
            bool _6038 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _6040 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _6042 = _6038 || _6040;
            bool _6044 = isnan(1.0);
            bool _6046 = _6042 || _6044;
            float _6048 = _159 + 1.0;
            float _6050 = _6048;
            if (!_6046)
            {
                float _6052 = _6048 * _6048;
                float _6054 = _6052 * 0.5;
                _6016 = _6054;
            }
            float _6056 = _6016;
            float _6058 = _6056;
            if (!_6046)
            {
                float _6060 = _6056 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _6058 = _6060;
            }
            float _6062 = _6058;
            bool _6064 = !_6046;
            float _6066 = _6062;
            if (!_6064)
            {
                float _6068 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _6070 = log2(_6068);
                float _6072 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _6074 = 1.0 + _6072;
                float _6076 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _6078 = _6070 * _6048;
                float _6080 = 1.0 / _6074;
                float _6082 = _6076 * 0.693147182464599609375;
                float _6084 = exp2(_6078);
                float _6086 = 1.0 / _6082;
                float _6088 = _6084 + (-1.0);
                float _6090 = -_6088;
                float _6092 = fma(_6090, _6086, _6048);
                float _6094 = _6092 * _6080;
                float _6096 = _6094 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _6066 = _6096;
            }
            float _6098 = _6066;
            float _6100 = _6098 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _6102 = _6098 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _6104 = !_6046;
            _6018 = _6098;
            if (!_6104)
            {
                float _6106 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _6108 = log2(_6106);
                float _6110 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _6112 = 1.0 + _6110;
                float _6114 = 1.0 / _6112;
                float _6116 = _6108 * _6048;
                float _6118 = exp2(_6116);
                float _6120 = -_6118;
                float _6122 = _6120 + 1.0;
                float _6124 = _6122 * _6114;
                _6050 = _6124;
            }
            float _6126 = _6050;
            float _6128 = fma(_6126, _197, _6102);
            float _6130 = _6098 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _6132 = fma(_6126, _195, _6100);
            float _6134 = -_439;
            float _6136 = _6134 + _6128;
            float _6138 = fma(_6126, _199, _6130);
            float _6140 = -_441;
            float _6142 = _6140 + _6132;
            float _6144 = _6136 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _6146 = _6136 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _6148 = _6136 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _6150 = -_443;
            float _6152 = _6150 + _6138;
            float _6154 = fma(_6142, (*spvDescriptorSet0.vp_c10)._m0[4].x, _6144);
            float _6156 = fma(_6142, (*spvDescriptorSet0.vp_c10)._m0[5].x, _6146);
            float _6158 = fma(_6142, (*spvDescriptorSet0.vp_c10)._m0[6].x, _6148);
            float _6160 = fma(_6152, (*spvDescriptorSet0.vp_c10)._m0[4].z, _6154);
            float _6162 = fma(_6152, (*spvDescriptorSet0.vp_c10)._m0[5].z, _6156);
            float _6164 = fma(_6152, (*spvDescriptorSet0.vp_c10)._m0[6].z, _6158);
            _489 = _6162;
            _491 = _6160;
            _493 = _6164;
            _6024 = _6160;
            _6030 = _6162;
            _6036 = _6164;
            _5996 = _6152;
            _6004 = _6136;
        }
        float _6166 = _489;
        float _6168 = _491;
        float _6170 = _493;
        float _6172 = _6024;
        float _6174 = _6030;
        float _6176 = _6036;
        float _6178 = _5996;
        float _6180 = _6018;
        float _6182 = _6004;
        float _6184 = _6166 * _6166;
        float _6186 = fma(_6168, _6168, _6184);
        float _6188 = fma(_6170, _6170, _6186);
        float _6190 = rsqrt(_5924);
        float _6192 = sqrt(_6188);
        float _6194 = _5860 * _6190;
        float _6196 = _5884 * _6190;
        float _6198 = _5908 * _6190;
        bool _6200 = _6192 > 0.0;
        float _6202 = _6180;
        float _6204 = _6178;
        float _6206 = _6182;
        _495 = _6170;
        if (!_6200)
        {
            _6202 = _5950;
        }
        float _6208 = _6202;
        _5992 = _6208;
        if (!_6200)
        {
            _6204 = _5968;
        }
        float _6210 = _6204;
        _5998 = _6210;
        if (!_6200)
        {
            _6206 = _5954;
        }
        float _6212 = _6206;
        bool _6214 = !_6200;
        _6006 = _6212;
        if (!_6214)
        {
            float _6216 = rsqrt(_6188);
            float _6218 = _6216 * _6166;
            float _6220 = _6216 * _6168;
            float _6222 = _6216 * _6170;
            float _6224 = _6196 * _6218;
            float _6226 = fma(_6194, _6220, _6224);
            float _6228 = fma(_6198, _6222, _6226);
            float _6230 = _6228 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _6232 = fma(_6172, _6230, _5950);
            float _6234 = fma(_6174, _6230, _5968);
            float _6236 = fma(_6176, _6230, _5954);
            _5998 = _6234;
            _5992 = _6232;
            _6006 = _6236;
        }
    }
    float _6238 = _5998;
    float _6240 = _5992;
    float _6242 = _6006;
    float _6244 = _495;
    float _6246 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _6248 = _6238 + _6246;
    float _6250 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _6252 = _6240 + _6250;
    float _6254 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _6256 = _6242 + _6254;
    float _6258 = _6248 * _6248;
    float _6260 = fma(_6252, _6252, _6258);
    float _6262 = _5972 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _6264 = fma(_6256, _6256, _6260);
    float _6266 = fma(_5964, (*spvDescriptorSet0.vp_c8)._m0[11].x, _6262);
    float _6268 = fma(_5964, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _6270 = rsqrt(_6264);
    float _6272 = fma(_5958, (*spvDescriptorSet0.vp_c8)._m0[11].z, _6266);
    float _6274 = _5972 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _6276 = _6272 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _6278 = fma(_5964, (*spvDescriptorSet0.vp_c8)._m0[10].x, _6274);
    float _6280 = 1.0 / _6276;
    float _6282 = fma(_5958, (*spvDescriptorSet0.vp_c8)._m0[10].z, _6278);
    float _6284 = _6282 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _6286 = _6270 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _6288 = _6284 + _6276;
    float _6290 = _6252 * _6286;
    float _6292 = _6256 * _6286;
    float _6294 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _6296 = _6290 * _6290;
    float _6298 = _6292 * _6292;
    float _6300 = _5972 + _6294;
    float _6302 = _6288 * _6280;
    float _6304 = _6302 * 0.5;
    float _6306 = _6296 + _6298;
    float _6308 = _6300 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _6310 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _6312 = fma(_6304, (*spvDescriptorSet0.vp_c8)._m0[30].w, _6310);
    float _6314 = sqrt(_6306);
    float _6316 = fma(_5964, (*spvDescriptorSet0.vp_c15)._m0[126].x, _6308);
    float _6318 = fma(_5958, (*spvDescriptorSet0.vp_c15)._m0[126].z, _6316);
    float _6320 = 1.0 / _6312;
    float _6322 = _6318 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _6324 = _6300 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _6326 = fma(_5964, (*spvDescriptorSet0.vp_c15)._m0[127].x, _6324);
    bool _6328 = _6314 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6330 = trunc(_6322);
    int _6332 = int(_6330);
    float _6334 = fma(_5958, (*spvDescriptorSet0.vp_c15)._m0[127].z, _6326);
    float _6336 = _6334 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _6338 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _6340 = _6320 * _6338;
    float _6342 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6344 = _6314 + _6342;
    float _6346 = trunc(_6336);
    int _6348 = int(_6346);
    bool _6350 = _6340 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _6352 = _6340 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    int _6354 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _6356 = _6332 + _6354;
    int _6358 = _6356 + 1;
    float _6360 = _6280;
    int _6362 = 2;
    float _6364 = _6344;
    float _6366 = _6306;
    int _6368 = _6358;
    float _6370 = _6290;
    float _6372 = _6340;
    if (_6328)
    {
        float _6374 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6360 = _6374;
    }
    float _6376 = _6360;
    bool _6378 = !_6350;
    int _6380 = _6378 ? 0 : 1;
    int _6382 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _6384 = _6348 + _6382;
    int _6386 = _6384 + 1;
    float _6388 = floor(_6268);
    if (!_6350)
    {
        _6362 = 1;
    }
    int _6390 = _6362;
    bool _6392 = _6358 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _6394 = _6390;
    if (!_6352)
    {
        _6394 = _6380;
    }
    int _6396 = _6394;
    float _6398 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _6400 = _6376;
    if (_6328)
    {
        float _6402 = _6344 * _6376;
        _6364 = _6402;
    }
    float _6404 = _6364;
    if (_6328)
    {
        float _6406 = rsqrt(_6306);
        _6366 = _6406;
    }
    float _6408 = _6366;
    int _6410 = _6396 << 6;
    float _6412 = _6408;
    if (_6328)
    {
        float _6414 = _6404 * 0.15915493667125701904296875;
        _6400 = _6414;
    }
    float _6416 = _6400;
    int _6418 = _6358 | _6386;
    int _6420 = _6410 + 96;
    uint _6422 = uint(int(uint(_6420) >> uint(2)));
    uint _6424 = uint(int(uint(int(_6422)) >> uint(2)));
    int _6426 = int(_6422) & 3;
    float _6428 = (*spvDescriptorSet0.vp_c15)._m0[int(_6424)][_6426];
    int _6430 = int(_6422) + 1;
    uint _6432 = uint(int(uint(_6430) >> uint(2)));
    int _6434 = _6430 & 3;
    float _6436 = (*spvDescriptorSet0.vp_c15)._m0[int(_6432)][_6434];
    float _6438 = precise::max(0.0, _6398);
    bool _6440 = _6418 < 0;
    bool _6442 = _6440 || _6392;
    float _6444 = _6244;
    float _6446 = _6438;
    if (_6328)
    {
        float _6448 = _6416 * 6.283185482025146484375;
        float _6450 = cos(_6448);
        _6444 = _6450;
    }
    float _6452 = _6444;
    float _6454 = -_6388;
    float _6456 = _6268 + _6454;
    float _6458 = -_6286;
    float _6460 = -_6438;
    float _6462 = fma(_6248, _6458, _6460);
    bool _6464 = _6386 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _6466 = _6464 || _6442;
    int _6468 = _6410 + 80;
    uint _6470 = uint(int(uint(_6468) >> uint(2)));
    uint _6472 = uint(int(uint(int(_6470)) >> uint(2)));
    int _6474 = int(_6470) & 3;
    float _6476 = (*spvDescriptorSet0.vp_c15)._m0[int(_6472)][_6474];
    int _6478 = int(_6470) + 1;
    uint _6480 = uint(int(uint(_6478) >> uint(2)));
    int _6482 = _6478 & 3;
    float _6484 = (*spvDescriptorSet0.vp_c15)._m0[int(_6480)][_6482];
    float _6486 = _6462;
    if (_6328)
    {
        float _6488 = _6462 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6446 = _6488;
    }
    float _6490 = _6446;
    float _6492 = as_type<float>(_6418);
    if (_6328)
    {
        float _6494 = _6416 * 6.283185482025146484375;
        float _6496 = sin(_6494);
        _6492 = _6496;
    }
    float _6498 = _6492;
    float _6500 = fma(_5958, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _6502 = _6238 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _6504 = _6410 + 48;
    uint _6506 = uint(int(uint(_6504) >> uint(2)));
    uint _6508 = uint(int(uint(int(_6506)) >> uint(2)));
    int _6510 = int(_6506) & 3;
    float _6512 = (*spvDescriptorSet0.vp_c15)._m0[int(_6508)][_6510];
    int _6514 = int(_6506) + 1;
    uint _6516 = uint(int(uint(_6514) >> uint(2)));
    int _6518 = _6514 & 3;
    float _6520 = (*spvDescriptorSet0.vp_c15)._m0[int(_6516)][_6518];
    float _6522 = fma(_6240, (*spvDescriptorSet0.vp_c8)._m0[2].x, _6502);
    if (!_6466)
    {
        int _6524 = _6386 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _6526 = _6524 + _6358;
        _6368 = _6526;
    }
    int _6528 = _6368;
    float _6530 = _6452;
    if (_6328)
    {
        float _6532 = _6452 + (-1.0);
        _5986 = _6532;
    }
    float _6534 = _5986;
    float _6536 = floor(_6500);
    float _6538 = fma(_6242, (*spvDescriptorSet0.vp_c8)._m0[2].z, _6522);
    int _6540 = _6410 + 104;
    uint _6542 = uint(int(uint(_6540) >> uint(2)));
    uint _6544 = uint(int(uint(int(_6542)) >> uint(2)));
    int _6546 = int(_6542) & 3;
    float _6548 = (*spvDescriptorSet0.vp_c15)._m0[int(_6544)][_6546];
    int _6550 = int(_6542) + 1;
    uint _6552 = uint(int(uint(_6550) >> uint(2)));
    int _6554 = _6550 & 3;
    float _6556 = (*spvDescriptorSet0.vp_c15)._m0[int(_6552)][_6554];
    float _6558 = _6534;
    if (_6328)
    {
        float _6560 = _6534 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6558 = _6560;
    }
    float _6562 = _6558;
    if (_6328)
    {
        float _6564 = fma(_6498, _6490, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _5988 = _6564;
    }
    float _6566 = _5988;
    float _6568 = _6566;
    if (_6328)
    {
        float _6570 = fma(_6462, _6452, _6562);
        _6486 = _6570;
    }
    float _6572 = _6486;
    float _6574 = _5466;
    if (!_6466)
    {
        float _6576 = floor(_6336);
        _6574 = _6576;
    }
    float _6578 = _6574;
    float _6580 = _6538 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _6582 = _6410 + 64;
    uint _6584 = uint(int(uint(_6582) >> uint(2)));
    uint _6586 = uint(int(uint(int(_6584)) >> uint(2)));
    int _6588 = int(_6584) & 3;
    float _6590 = (*spvDescriptorSet0.vp_c15)._m0[int(_6586)][_6588];
    int _6592 = int(_6584) + 1;
    uint _6594 = uint(int(uint(_6592) >> uint(2)));
    int _6596 = _6592 & 3;
    float _6598 = (*spvDescriptorSet0.vp_c15)._m0[int(_6594)][_6596];
    if (_6328)
    {
        float _6600 = _6408 * _6566;
        _6568 = _6600;
    }
    float _6602 = _6568;
    float _6604 = _6602;
    if (!_6328)
    {
        _6530 = _6292;
    }
    float _6606 = _6530;
    float _6608 = _6606;
    if (!_6328)
    {
        _6412 = _6296;
    }
    float _6610 = _6412;
    float _6612 = _6610;
    if (_6328)
    {
        float _6614 = _6290 * _6602;
        _6370 = _6614;
    }
    float _6616 = _6370;
    float _6618 = sqrt(_6264);
    if (_6328)
    {
        float _6620 = _6292 * _6602;
        _6608 = _6620;
    }
    float _6622 = _6608;
    int _6624 = _6410 + 56;
    uint _6626 = uint(int(uint(_6624) >> uint(2)));
    uint _6628 = uint(int(uint(int(_6626)) >> uint(2)));
    int _6630 = int(_6626) & 3;
    float _6632 = (*spvDescriptorSet0.vp_c15)._m0[int(_6628)][_6630];
    int _6634 = int(_6626) + 1;
    uint _6636 = uint(int(uint(_6634) >> uint(2)));
    int _6638 = _6634 & 3;
    float _6640 = (*spvDescriptorSet0.vp_c15)._m0[int(_6636)][_6638];
    if (_6328)
    {
        float _6642 = _6616 * _6616;
        _6612 = _6642;
    }
    float _6644 = _6612;
    if (!_6328)
    {
        _6604 = _6298;
    }
    float _6646 = _6604;
    float _6648 = _6646;
    if (_6328)
    {
        float _6650 = _6622 * _6622;
        _6648 = _6650;
    }
    float _6652 = _6648;
    float _6654 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _6656 = fma(_6572, _6572, _6644);
    float _6658 = _6580 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _6660 = -_6536;
    float _6662 = _6500 + _6660;
    int _6664 = _6410 + 72;
    uint _6666 = uint(int(uint(_6664) >> uint(2)));
    uint _6668 = uint(int(uint(int(_6666)) >> uint(2)));
    int _6670 = int(_6666) & 3;
    float _6672 = (*spvDescriptorSet0.vp_c15)._m0[int(_6668)][_6670];
    int _6674 = int(_6666) + 1;
    uint _6676 = uint(int(uint(_6674) >> uint(2)));
    int _6678 = _6674 & 3;
    float _6680 = (*spvDescriptorSet0.vp_c15)._m0[int(_6676)][_6678];
    float _6682 = _6300 * _6436;
    int _6684 = as_type<int>(_6536);
    int _6686 = as_type<int>(_6658);
    float _6688 = _6656;
    int _6690 = as_type<int>(_6652);
    if (!_6466)
    {
        int _6692 = _6528 << 2;
        _6684 = _6692;
    }
    int _6694 = _6684;
    float _6696 = -_6658;
    float _6698 = fma(_6696, _6654, 1.0);
    float _6700 = fma(_5964, _6428, _6682);
    if (!_6466)
    {
        int _6702 = 12 & _6694;
        _6686 = _6702;
    }
    int _6704 = _6686;
    int _6706 = _6410 + 88;
    uint _6708 = uint(int(uint(_6706) >> uint(2)));
    uint _6710 = uint(int(uint(int(_6708)) >> uint(2)));
    int _6712 = int(_6708) & 3;
    float _6714 = (*spvDescriptorSet0.vp_c15)._m0[int(_6710)][_6712];
    int _6716 = int(_6708) + 1;
    uint _6718 = uint(int(uint(_6716) >> uint(2)));
    int _6720 = _6716 & 3;
    float _6722 = (*spvDescriptorSet0.vp_c15)._m0[int(_6718)][_6720];
    float _6724 = _6300 * _6484;
    float _6726 = log2(_6698);
    float _6728 = fma(_5964, _6476, _6724);
    float _6730 = _6656 + _6652;
    int _6732 = _6704;
    float _6734 = _6730;
    if (!_6466)
    {
        float _6736 = -_6578;
        float _6738 = _6336 + _6736;
        _6688 = _6738;
    }
    float _6740 = _6688;
    if (!_6466)
    {
        uint _6742 = uint(int(uint(_6528) >> uint(2)));
        _6690 = int(_6742);
    }
    int _6744 = _6690;
    float _6746 = _6300 * _6520;
    float _6748 = rsqrt(_6730);
    if (!_6466)
    {
        int _6750 = _6744 << 4;
        int _6752 = _6750 + _6704;
        _6732 = _6752;
    }
    int _6754 = _6732;
    float _6756 = fma(_5964, _6512, _6746);
    float _6758 = fma(_5958, _6548, _6700);
    float _6760 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _6762 = fma(_6618, (*spvDescriptorSet0.vp_c15)._m0[23].w, _6760);
    float _6764 = precise::clamp(_6762, 0.0, 1.0);
    float _6766 = _6726 * 0.693147182464599609375;
    float _6768 = _6758 + _6556;
    float _6770 = -_6764;
    float _6772 = _6770 + 1.0;
    float _6774 = 1.0 / _6768;
    float _6776 = _6300 * _6598;
    float _6778 = fma(_5964, _6590, _6776);
    float _6780 = _6748 * _6616;
    float _6782 = _6748 * _6572;
    float _6784 = fma(_5958, _6632, _6756);
    float _6786 = abs(_6772);
    float _6788 = log2(_6786);
    float _6790 = _6780 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _6792 = _6748 * _6622;
    float _6794 = _6784 + _6640;
    float _6796 = _6238 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _6798 = -_6790;
    float _6800 = fma(_6782, (*spvDescriptorSet0.vp_c15)._m0[21].y, _6798);
    float _6802 = _6238 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _6804 = fma(_5958, _6672, _6778);
    float _6806 = _6794 * _6774;
    float _6808 = fma(_6240, (*spvDescriptorSet0.vp_c8)._m0[1].x, _6796);
    float _6810 = fma(_6240, (*spvDescriptorSet0.vp_c8)._m0[3].x, _6802);
    float _6812 = -_6792;
    float _6814 = fma(_6812, (*spvDescriptorSet0.vp_c15)._m0[21].z, _6800);
    float _6816 = _6768;
    float _6818 = _6782;
    if (!_6466)
    {
        float _6820 = floor(_6322);
        _6816 = _6820;
    }
    float _6822 = _6816;
    bool _6824 = _6806 >= 0.0;
    float _6826 = fma(_6242, (*spvDescriptorSet0.vp_c8)._m0[1].z, _6808);
    float _6828 = fma(_5958, _6714, _6728);
    float _6830 = _6804 + _6680;
    float _6832 = _6238 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _6834 = _6788 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _6836 = _6806 <= 1.0;
    bool _6838 = _6836 && _6824;
    float _6840 = _6830 * _6774;
    float _6842 = fma(_6240, (*spvDescriptorSet0.vp_c8)._m0[0].x, _6832);
    float _6844 = _6826 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _6846 = exp2(_6834);
    float _6848 = fma(_6242, (*spvDescriptorSet0.vp_c8)._m0[3].z, _6810);
    float _6850 = fma(_6242, (*spvDescriptorSet0.vp_c8)._m0[0].z, _6842);
    bool _6852 = _6840 >= 0.0;
    bool _6854 = _6852 && _6838;
    float _6856 = fma(_6814, -0.5, 0.5);
    float _6858 = _6848 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _6860 = _6850 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _6862 = _6844 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _6864 = _6840 <= 1.0;
    bool _6866 = _6864 && _6854;
    float _6868 = sqrt(_6856);
    float _6870 = _6782 + 1.0;
    float _6872 = fma(_6860, (*spvDescriptorSet0.vp_c8)._m0[7].x, _6862);
    float _6874 = _6828 + _6722;
    float _6876 = fma(_6814, 0.5, 0.5);
    float _6878 = _6844 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _6880 = fma(_6580, (*spvDescriptorSet0.vp_c8)._m0[7].z, _6872);
    float _6882 = -_6782;
    float _6884 = fma(_6846, _6870, _6882);
    float _6886 = fma(_6876, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _6888 = fma(_6860, (*spvDescriptorSet0.vp_c8)._m0[4].x, _6878);
    float _6890 = fma(_6858, (*spvDescriptorSet0.vp_c8)._m0[7].w, _6880);
    float _6892 = _6844 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _6894 = _6860;
    if (_6866)
    {
        float _6896 = float(_6396);
        _6818 = _6896;
    }
    float _6898 = _6818;
    float _6900 = fma(_6876, _6886, -0.212114393711090087890625);
    float _6902 = 1.0 / _6890;
    float _6904 = fma(_6860, (*spvDescriptorSet0.vp_c8)._m0[5].x, _6892);
    float _6906 = fma(_6580, (*spvDescriptorSet0.vp_c8)._m0[4].z, _6888);
    float _6908 = _6868 * 0.636619746685028076171875;
    float _6910 = fma(_6876, _6900, 1.570728778839111328125);
    float _6912 = fma(_6580, (*spvDescriptorSet0.vp_c8)._m0[5].z, _6904);
    float _6914 = fma(_6858, (*spvDescriptorSet0.vp_c8)._m0[4].w, _6906);
    if (!_6466)
    {
        float _6916 = -_6822;
        float _6918 = _6322 + _6916;
        _6734 = _6918;
    }
    float _6920 = _6734;
    float _6922 = _6898;
    if (_6866)
    {
        float _6924 = rint(_6898);
        float _6926 = precise::max(_6924, 0.0);
        uint _6928 = uint(_6926);
        uint _6930 = clamp(_6928, 0u, 65535u);
        _6922 = as_type<float>(_6930);
    }
    float _6932 = _6922;
    float _6934 = fma(_6858, (*spvDescriptorSet0.vp_c8)._m0[5].w, _6912);
    float _6936 = -_6910;
    float _6938 = fma(_6908, _6936, 1.0);
    float _6940 = _6874 * _6774;
    float2 _17657 = float2(_6456, _6662);
    float _6942 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_17657, float2(0.0), isnan(_17657)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_17657, float2(0.0), isnan(_17657)), level(0.0)).x;
    float _6944 = _6766 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _6946 = fma(_6884, 0.5, 0.5);
    float _6948 = _6748;
    float _6950 = _6940;
    float _6952 = _6934;
    if (!_6466)
    {
        int _6954 = _6754 + 400;
        uint _6956 = uint(int(uint(_6954) >> uint(2)));
        uint _6958 = uint(int(uint(int(_6956)) >> uint(2)));
        int _6960 = int(_6956) & 3;
        float _6962 = (*spvDescriptorSet0.vp_c15)._m0[int(_6958)][_6960];
        _6948 = _6962;
    }
    float _6964 = _6948;
    float _6966 = _6914 * _6902;
    float _6968 = _6934 * _6902;
    float _6970 = fma(_6966, 0.5, 0.5);
    float _6972 = fma(_6968, -0.5, 0.5);
    float _6974 = _6910;
    if (_6866)
    {
        float3 _17716 = float3(_6806, _6840, float(as_type<int>(_6932)));
        float3 _17720 = select(_17716, float3(0.0), isnan(_17716));
        float _6976 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _17720.xy, uint(rint(_17720.z)), _6940, level(0.0));
        _6974 = _6976;
    }
    float _6978 = _6974;
    float3 _17730 = float3(_6970, _6972, _6944);
    float _6980 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_17730, float3(0.0), isnan(_17730)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_17730, float3(0.0), isnan(_17730)), level(0.0)).x;
    float3 _17739 = float3(_6970, _6972, _6944);
    float4 _6983 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_17739, float3(0.0), isnan(_17739)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_17739, float3(0.0), isnan(_17739)), level(0.0)).xyzw;
    float _6985 = _6983.x;
    float _6987 = _6983.y;
    float _6989 = _6983.z;
    float _6991 = _6983.w;
    float2 _17755 = float2(_6938, _6946);
    float3 _6995 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_17755, float2(0.0), isnan(_17755)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_17755, float2(0.0), isnan(_17755)), level(0.0)).xyz;
    float _6997 = _6995.x;
    float _6999 = _6995.y;
    float _7001 = _6995.z;
    float _7003 = _6902;
    if (!_6466)
    {
        float _7005 = rint(_6964);
        float _7007 = precise::max(_7005, 0.0);
        uint _7009 = uint(_7007);
        uint _7011 = clamp(_7009, 0u, 65535u);
        _7003 = as_type<float>(_7011);
    }
    float _7013 = _7003;
    float _7015 = _6920;
    if (!_6466)
    {
        float3 _17792 = float3(_6920, _6740, float(as_type<int>(_7013)));
        float3 _17794 = select(_17792, float3(0.0), isnan(_17792));
        float _7017 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _17794.xy, uint(rint(_17794.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _17794.xy, uint(rint(_17794.z)), level(0.0)).x;
        _7015 = _7017;
    }
    float _7019 = _7015;
    float _7021 = abs(_6340);
    float _7023 = log2(_7021);
    bool _7025 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _7027 = isnan(0.5);
    bool _7029 = _7025 || _7027;
    bool _7031 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _7033 = _7029 || _7031;
    float _7035 = _6844 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_96.x = _5964;
    out.m_96.y = _5972;
    out.m_96.z = _5958;
    float _7037 = fma(_6860, (*spvDescriptorSet0.vp_c8)._m0[6].x, _7035);
    float _7039 = fma(_6580, (*spvDescriptorSet0.vp_c8)._m0[6].z, _7037);
    if (!_7033)
    {
        _6894 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _7041 = _6894;
    float _7043 = _7023 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _7045 = exp2(_7043);
    float _7047 = _6890 * 0.5;
    float _7049 = fma(_7045, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _7051 = precise::clamp(_7049, 0.0, 1.0);
    float _7053 = _7045;
    if (!_7033)
    {
        float _7055 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _7057 = _7041 + _7055;
        _7053 = _7057;
    }
    float _7059 = _7053;
    float _7061 = fma(_6858, (*spvDescriptorSet0.vp_c8)._m0[6].w, _7039);
    float _7063 = _6788 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _7065 = fma(_7051, -2.0, 3.0);
    float _7067 = _7051 * _7051;
    float _7069 = _7061 + _6890;
    float _7071 = _6858;
    if (!_7033)
    {
        float _7073 = 1.0 / _7059;
        _7071 = _7073;
    }
    float _7075 = _7071;
    out.gl_Position.x = _6914;
    out.gl_Position.y = _6934;
    out.gl_Position.z = _7061;
    out.gl_Position.w = _6890;
    float _7077 = _7067 * _7065;
    float _7079 = _6914 + _6890;
    float _7081 = _7069 * 0.5;
    float _7083 = fma(_6934, -0.5, _7047);
    float _7085 = _7079 * 0.5;
    float _7087 = exp2(_7063);
    float _7089 = -_7077;
    float _7091 = _7089 + 1.0;
    bool _7093 = _6340 <= 8000.0;
    bool _7095 = isnan(_6340);
    bool _7097 = _7093 || _7095;
    bool _7099 = isnan(8000.0);
    bool _7101 = _7097 || _7099;
    float _7103 = float(_7101);
    float _7105 = _7091;
    if (!_7033)
    {
        float _7107 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _7109 = _6340 + _7107;
        _6372 = _7109;
    }
    float _7111 = _6372;
    out.m_98.x = _7085;
    out.m_98.y = _7083;
    out.m_98.z = _7081;
    out.m_98.w = _6890;
    float _7113 = fma(_7091, (*spvDescriptorSet0.vp_c15)._m0[654].w, _7077);
    float _7115 = _7111;
    if (_7033)
    {
        _7105 = 1.0;
    }
    float _7117 = _7105;
    float _7119 = _7117;
    if (!_7033)
    {
        float _7121 = _7111 * _7075;
        float _7123 = precise::clamp(_7121, 0.0, 1.0);
        _7119 = _7123;
    }
    float _7125 = _7119;
    float _7127 = _7103 * _7113;
    if (!_6866)
    {
        _7115 = 1.0;
    }
    float _7129 = _7115;
    float _7131 = _7127 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _7133 = -_7087;
    float _7135 = _7133 + 1.0;
    float _7137 = _7135 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _7139 = -_6942;
    float _7141 = _7139 + 1.0;
    float _7143 = _7141 * _7131;
    float _7145 = precise::clamp(_7143, 0.0, 1.0);
    float _7147 = _7131;
    float _7149 = _7129;
    float _7151 = _7145;
    if (_6466)
    {
        _7147 = 1.0;
    }
    float _7153 = _7147;
    float _7155 = _7153;
    if (_6866)
    {
        bool _7157 = _6978 >= _6940;
        bool _7159 = isnan(_6978);
        bool _7161 = _7157 || _7159;
        bool _7163 = isnan(_6940);
        bool _7165 = _7161 || _7163;
        float _7167 = float(_7165);
        _7149 = _7167;
    }
    float _7169 = _7149;
    if (!_6466)
    {
        int _7171 = _6528 << 4;
        int _7173 = _7171 + 2048;
        uint _7175 = uint(int(uint(_7173) >> uint(2)));
        uint _7177 = uint(int(uint(int(_7175)) >> uint(2)));
        int _7179 = int(_7175) & 3;
        float _7181 = (*spvDescriptorSet0.vp_c15)._m0[int(_7177)][_7179];
        int _7183 = int(_7175) + 1;
        uint _7185 = uint(int(uint(_7183) >> uint(2)));
        int _7187 = _7183 & 3;
        float _7189 = (*spvDescriptorSet0.vp_c15)._m0[int(_7185)][_7187];
        int _7191 = _7173 + 8;
        uint _7193 = uint(int(uint(_7191) >> uint(2)));
        uint _7195 = uint(int(uint(int(_7193)) >> uint(2)));
        int _7197 = int(_7193) & 3;
        float _7199 = (*spvDescriptorSet0.vp_c15)._m0[int(_7195)][_7197];
        int _7201 = int(_7193) + 1;
        uint _7203 = uint(int(uint(_7201) >> uint(2)));
        int _7205 = _7201 & 3;
        float _7207 = (*spvDescriptorSet0.vp_c15)._m0[int(_7203)][_7205];
        float _7209 = _6300 * _7189;
        float _7211 = fma(_5964, _7181, _7209);
        float _7213 = fma(_5958, _7199, _7211);
        float _7215 = _7213 + _7207;
        float _7217 = precise::clamp(_7215, 0.0, 1.0);
        float _7219 = -_7217;
        float _7221 = _7219 + _7019;
        float _7223 = fma(_7221, 500.0, 1.5);
        float _7225 = exp2(_7223);
        float _7227 = 0.0 + _7225;
        float _7229 = precise::clamp(_7227, 0.0, 1.0);
        _7155 = _7229;
        _6950 = 500.0;
    }
    float _7231 = _7155;
    float _7233 = _6950;
    float _7235 = _7137 * _6980;
    float _7237 = _7169 * _7231;
    float _7239 = -_7145;
    float _7241 = fma(_7239, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _7243 = -_7137;
    float _7245 = _7243 + 1.0;
    float _7247 = _6991 * _7235;
    float _7249 = _7001 * _7235;
    float _7251 = -_7237;
    float _7253 = fma(_7251, _7241, 1.0);
    float _7255 = precise::clamp(_7253, 0.0, 1.0);
    float _7257 = _6991 * _7245;
    float _7259 = fma(_6997, _7247, _6985);
    float _7261 = fma(_6999, _7247, _6987);
    float _7263 = _7255 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _7265 = fma(_6991, _7249, _6989);
    out.m_100.x = _6240;
    out.m_100.y = _6238;
    out.m_100.z = _6242;
    bool _7267 = _6618 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _7269 = isnan(_6618);
    bool _7271 = _7267 || _7269;
    bool _7273 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _7275 = _7271 || _7273;
    float _7277 = _7125 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_102.x = _7263;
    out.m_104.x = _7259;
    out.m_104.y = _7261;
    out.m_104.z = _7265;
    out.m_104.w = _7257;
    float _7279 = _7241;
    float _7281 = _7245;
    float _7283 = _7233;
    float _7285 = _7255;
    if (!_7275)
    {
        _6952 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _7287 = _6952;
    float _7289 = _7287;
    float _7291 = _7287;
    if (!_7275)
    {
        _7151 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _7293 = _7151;
    float _7295 = _7293;
    float _7297 = _7293;
    if (!_7275)
    {
        _7279 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _7299 = _7279;
    float _7301 = _7299;
    float _7303 = _7299;
    if (!_7275)
    {
        _7281 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _7305 = _7281;
    float _7307 = _7305;
    float _7309 = _7305;
    if (!_7275)
    {
        _7283 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _7311 = _7283;
    float _7313 = _7311;
    float _7315 = _7311;
    if (!_7275)
    {
        _7285 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _7317 = _7285;
    bool _7319 = !_7275;
    float _7321 = _7317;
    float _7323 = _7317;
    if (!_7319)
    {
        bool _7325 = _6618 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _7327 = isnan(_6618);
        bool _7329 = _7325 || _7327;
        bool _7331 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _7333 = _7329 || _7331;
        if (!_7333)
        {
            float _7335 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _7337 = _6618 + _7335;
            float _7339 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _7341 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _7339;
            float _7343 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _7345 = _7343 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _7347 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _7349 = _7347 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _7351 = 1.0 / _7341;
            float _7353 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _7355 = _7353 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _7357 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _7359 = _7357 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _7361 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _7363 = _7361 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _7365 = _7337 * _7351;
            float _7367 = precise::clamp(_7365, 0.0, 1.0);
            float _7369 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _7371 = _7369 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _7373 = fma(_7367, _7345, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _7375 = fma(_7367, _7349, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _7377 = fma(_7367, _7371, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _7379 = fma(_7367, _7355, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _7381 = fma(_7367, _7359, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _7383 = fma(_7367, _7363, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _7315 = _7373;
            _7297 = _7381;
            _7309 = _7375;
            _7291 = _7379;
            _7323 = _7377;
            _7303 = _7383;
            _7385 = true;
        }
        else
        {
            bool _7387 = _6618 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _7389 = isnan(_6618);
            bool _7391 = _7387 || _7389;
            bool _7393 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _7395 = _7391 || _7393;
            if (!_7395)
            {
                _7289 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _7397 = _7289;
            _7291 = _7397;
            if (!_7395)
            {
                _7295 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _7399 = _7295;
            _7297 = _7399;
            if (!_7395)
            {
                _7301 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _7401 = _7301;
            _7303 = _7401;
            if (!_7395)
            {
                _7307 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _7403 = _7307;
            _7309 = _7403;
            if (!_7395)
            {
                _7313 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _7405 = _7313;
            _7315 = _7405;
            if (!_7395)
            {
                _7321 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _7407 = _7321;
            bool _7409 = !_7395;
            _7323 = _7407;
            if (!_7409)
            {
                bool _7411 = _6618 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _7413 = isnan(_6618);
                bool _7415 = _7411 || _7413;
                bool _7417 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _7419 = _7415 || _7417;
                if (!_7419)
                {
                    float _7421 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _7423 = _6618 + _7421;
                    float _7425 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _7427 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _7425;
                    float _7429 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _7431 = _7429 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _7433 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _7435 = _7433 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _7437 = 1.0 / _7427;
                    float _7439 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _7441 = _7439 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _7443 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _7445 = _7443 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _7447 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _7449 = _7447 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _7451 = _7423 * _7437;
                    float _7453 = precise::clamp(_7451, 0.0, 1.0);
                    float _7455 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _7457 = _7455 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _7459 = fma(_7453, _7431, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _7461 = fma(_7453, _7435, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _7463 = fma(_7453, _7457, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _7465 = fma(_7453, _7441, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _7467 = fma(_7453, _7445, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _7469 = fma(_7453, _7449, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _7315 = _7459;
                    _7297 = _7467;
                    _7309 = _7461;
                    _7291 = _7465;
                    _7323 = _7463;
                    _7303 = _7469;
                    _7385 = true;
                }
                else
                {
                    _7315 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _7297 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _7309 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _7291 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _7323 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _7303 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _7385 = false;
    float _7471 = _7315;
    float _7473 = _7297;
    float _7475 = _7309;
    float _7477 = _7291;
    float _7479 = _7323;
    float _7481 = _7303;
    float _7483 = _7277 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _7485 = fma(_5944, -0.5, 0.5);
    float _7487 = precise::clamp(_7485, 0.0, 1.0);
    float _7489 = -_7471;
    float _7491 = _7473 + _7489;
    float _7493 = -_7475;
    float _7495 = _7477 + _7493;
    out.m_59.x = _7483;
    float _7497 = fma(_7487, _7491, _7471);
    float _7499 = -_7479;
    float _7501 = _7481 + _7499;
    float _7503 = fma(_7487, _7495, _7475);
    float _7505 = _7497 * 0.586610972881317138671875;
    bool _7507 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _7509 = fma(_7487, _7501, _7479);
    out.m_106.x = 0.0;
    float _7511 = fma(_7503, 0.298911988735198974609375, _7505);
    bool _7513 = _7125 > 0.0;
    bool _7515 = isnan(_7125);
    bool _7517 = _7513 || _7515;
    bool _7519 = isnan(0.0);
    bool _7521 = _7517 || _7519;
    float _7523 = fma(_7509, 0.114477999508380889892578125, _7511);
    float _7525 = -_7523;
    float _7527 = _7503 + _7525;
    float _7529 = -_7523;
    float _7531 = _7497 + _7529;
    float _7533 = -_7523;
    float _7535 = _7509 + _7533;
    float _7537 = fma(_7527, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7523);
    float _7539 = fma(_7531, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7523);
    float _7541 = fma(_7535, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7523);
    bool _7543 = !_7507;
    if (!_7543)
    {
        float _7545 = -_6238;
        float _7547 = _7545 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _7549 = -_6240;
        float _7551 = _7549 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _7553 = -_6242;
        float _7555 = _7553 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _7557 = _7547 * _7547;
        float _7559 = fma(_7551, _7551, _7557);
        float _7561 = fma(_7555, _7555, _7559);
        float _7563 = sqrt(_7561);
        float _7565 = rsqrt(_7561);
        float _7567 = -_7563;
        float _7569 = _7567 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _7571 = _7569 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _7573 = precise::clamp(_7571, 0.0, 1.0);
        float _7575 = _7551 * _7565;
        float _7577 = _7547 * _7565;
        float _7579 = abs(_7573);
        float _7581 = log2(_7579);
        float _7583 = _7555 * _7565;
        float _7585 = _7575 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _7587 = _5944 * _7577;
        float _7589 = -_7577;
        float _7591 = -_7585;
        float _7593 = fma(_7589, (*spvDescriptorSet0.vp_c15)._m0[656].y, _7591);
        float _7595 = fma(_5942, _7575, _7587);
        float _7597 = -_7583;
        float _7599 = fma(_7597, (*spvDescriptorSet0.vp_c15)._m0[656].z, _7593);
        float _7601 = fma(_5946, _7583, _7595);
        float _7603 = precise::clamp(_7601, 0.0, 1.0);
        float _7605 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _7607 = _7599 + _7605;
        float _7609 = _7581 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _7611 = _7607 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _7613 = precise::clamp(_7611, 0.0, 1.0);
        float _7615 = exp2(_7609);
        float _7617 = _7615 * _7613;
        float _7619 = _7603 * _7617;
        float _7621 = _7619 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _7623 = _7619 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _7625 = _7619 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_106.x = _7621;
        out.m_106.y = _7623;
        out.m_106.z = _7625;
    }
    out.m_74.x = _7537;
    out.m_74.y = _7539;
    out.m_74.z = _7541;
    if (_7521)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_59.x = 0.0;
    float _7627 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _7627;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

