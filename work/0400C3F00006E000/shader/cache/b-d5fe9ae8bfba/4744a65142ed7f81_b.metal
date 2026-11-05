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
    float4 m_78 [[user(locn0)]];
    float4 m_80 [[user(locn1)]];
    float4 m_84 [[user(locn2)]];
    float4 m_86 [[user(locn3)]];
    float4 m_98 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_88 [[user(locn6)]];
    float4 m_94 [[user(locn7)]];
    float4 m_82 [[user(locn8)]];
    float4 m_96 [[user(locn9)]];
    float4 m_90 [[user(locn10)]];
    float4 m_92 [[user(locn11)]];
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
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3685 = false;
    bool _213 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_56.w;
    float _114 = trunc(_112);
    int _117 = int(_114);
    bool _121 = _117 >= 1;
    float _123 = 0.0;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    float _127 = _125;
    if (!_121)
    {
        out.m_59.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _125 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3970 = as_type<float>(_133);
        out.gl_Position.z = _3970;
    }
    if (!_121)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = in.m_61.w;
    bool _139 = _137 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_137);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = -_137;
    float _151 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _153 = _151;
    if (_147)
    {
        float _155 = float(_117);
        _127 = _155;
    }
    float _157 = _127;
    bool _159 = _151 >= _157;
    bool _161 = !_147;
    bool _163 = _159 || _161;
    float _165 = _157;
    if (_163)
    {
        _165 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _167 = _165;
    if (_163)
    {
        out.m_59.x = 0.0;
    }
    if (_163)
    {
        float _169 = _167 * 5.0;
        _135 = as_type<int>(_169);
    }
    int _171 = _135;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4040 = as_type<float>(_171);
        out.gl_Position.z = _4040;
    }
    if (_163)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _173 = as_type<float>(int(gl_VertexIndex));
    bool _175 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _177 = as_type<int>(_173) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_173) & 2;
    bool _183 = _181 != 0;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_175;
    float _211;
    if (!_193)
    {
        float _195 = in.m_66.x;
        float _197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _199 = _195 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _201 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[12].x, _151);
        float _203 = _201 * _197;
        float _205 = floor(_203);
        float _207 = -_205;
        float _209 = _203 + _207;
        _211 = _209;
        _213 = true;
    }
    else
    {
        float _215 = float(_117);
        float _217 = 1.0 / _215;
        float _219 = _151 * _217;
        _211 = _219;
    }
    _213 = false;
    float _221 = _211;
    float _223 = in.m_56.x;
    float _225 = in.m_56.y;
    float _227 = in.m_56.z;
    float _229 = in.m_68.x;
    float _231 = in.m_68.y;
    float _233 = in.m_68.z;
    float _235 = in.m_68.w;
    float _237 = in.m_70.x;
    float _239 = in.m_70.y;
    float _241 = in.m_70.z;
    float _243 = in.m_70.w;
    float _245 = _225 * _231;
    float _247 = fma(_223, _229, _245);
    float _249 = _225 * _239;
    float _251 = fma(_227, _233, _247);
    float _253 = fma(_223, _237, _249);
    float _255 = _251 + _235;
    float _257 = fma(_227, _241, _253);
    float _259 = fma(_255, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _261 = _257 + _243;
    float _263 = floor(_259);
    float _265 = fma(_261, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _267 = floor(_265);
    float _269 = -_263;
    float _271 = _259 + _269;
    float _273 = -_267;
    float _275 = _265 + _273;
    float2 _4195 = float2(_271, _275);
    float _277 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4195, float2(0.0), isnan(_4195)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4195, float2(0.0), isnan(_4195)), level(0.0)).x;
    float _279 = in.m_72.x;
    float _281 = in.m_72.y;
    float _283 = in.m_72.z;
    float _285 = in.m_72.w;
    float _287 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _289 = log2(_287);
    float _291 = in.m_66.x;
    float _293 = in.m_66.y;
    float _295 = in.m_66.z;
    float _297 = in.m_66.w;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _299;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _305 = _303 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _307 = 1.0 / _301;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _309;
    int _313 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _315 = _313 != 0;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _319 = 1.0 / _311;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _323 = _221 + _321;
    float _325 = _225 * _281;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _329 = 1.0 / _305;
    float _331 = _323 * _307;
    float _333 = fma(_223, _279, _325);
    float _335 = _291 * 2.0;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _339 = _221 + _337;
    float _341 = _291 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _343 = fma(_227, _283, _333);
    float _345 = _295 * 2.0;
    float _347 = _295 + _291;
    float _349 = _293 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _351 = floor(_335);
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _355 = _221 + _353;
    float _357 = fma(_349, -2.0, _317);
    float _359 = _293 * 2.0;
    float _361 = _347 + (-1.0);
    float _363 = _339 * _319;
    float _365 = -_327;
    float _367 = fma(_341, 2.0, _365);
    float _369 = floor(_345);
    float _371 = _295 + _293;
    float _373 = _355 * _329;
    float _375 = _291 + _293;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _379 = _371 + (-1.0);
    float _381 = float(_117);
    float _383 = _375 + (-1.0);
    float _385 = floor(_359);
    bool _387 = _351 > 0.0;
    bool _389 = _351 >= 0.0;
    bool _391 = isnan(_351);
    bool _393 = _389 || _391;
    bool _395 = isnan(0.0);
    bool _397 = _393 || _395;
    float _399 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _401 = 1.0 / _381;
    float _403 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _405;
    bool _409 = _369 > 0.0;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _411;
    bool _415 = _369 >= 0.0;
    bool _417 = isnan(_369);
    bool _419 = _415 || _417;
    bool _421 = isnan(0.0);
    bool _423 = _419 || _421;
    float _425 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _427 = as_type<int>(_379);
    float _429 = _381;
    if (_315)
    {
        _427 = 0;
    }
    int _431 = _427;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _435 = _433 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _437 = _385 > 0.0;
    float _439 = fma(_413, _331, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _441 = _431;
    if (!_315)
    {
        _441 = 1;
    }
    int _443 = _441;
    float _445 = fma(_435, _373, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _447 = _397 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _449 = fma(_407, _331, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _451 = _385 >= 0.0;
    bool _453 = isnan(_385);
    bool _455 = _451 || _453;
    bool _457 = isnan(0.0);
    bool _459 = _455 || _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _465 = _443 != 1;
    float _467 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _469 = int(_467);
    float _471 = _423 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _473 = fma(_463, _373, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _475 = _459 ? 0 : 1;
    float _477 = _343 + _285;
    int _479 = ~as_type<int>(_471);
    int _481 = _479 + 1;
    int _483 = _481 + 1;
    float _485 = _289 * _151;
    int _487 = ~_475;
    int _489 = _487 + 1;
    int _491 = _489 + 1;
    float _493 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _495 = int(_493);
    int _497 = _483;
    int _499 = _491;
    float _501 = _447;
    float _503 = _471;
    float _505 = _477;
    if (!_409)
    {
        int _507 = ~as_type<int>(_471);
        int _509 = _507 + 1;
        _497 = _509;
    }
    int _511 = _497;
    float _513 = _477 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    if (!_437)
    {
        int _515 = ~_475;
        int _517 = _515 + 1;
        _499 = _517;
    }
    int _519 = _499;
    float _521 = _477 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _525 = _523 != 0;
    int _527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _529 = _527 != 0;
    int _531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _533 = _531 != 0;
    float _535 = fma(_255, (*spvDescriptorSet0.vp_c8)._m0[10].x, _513);
    float _537 = exp2(_485);
    int _539 = ~as_type<int>(_447);
    int _541 = _539 + 1;
    int _543 = _541 + 1;
    float _545 = fma(_255, (*spvDescriptorSet0.vp_c8)._m0[11].x, _521);
    int _547 = _543;
    if (!_387)
    {
        int _549 = ~as_type<int>(_447);
        int _551 = _549 + 1;
        _547 = _551;
    }
    int _553 = _547;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_465)
    {
        _501 = _293;
    }
    float _557 = _501;
    float _559 = fma(_261, (*spvDescriptorSet0.vp_c8)._m0[10].z, _535);
    float _561 = _557;
    if (_465)
    {
        _561 = _291;
    }
    float _563 = _561;
    float _565 = fma(_261, (*spvDescriptorSet0.vp_c8)._m0[11].z, _545);
    bool _567 = !_529;
    int _569 = _567 ? 0 : 1;
    float _571 = _401 * _151;
    bool _573 = !_525;
    int _575 = _573 ? 0 : 1;
    float _577 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[83].z, _555);
    bool _579 = !_533;
    int _581 = _579 ? 0 : 1;
    float _583 = _565 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    if (!_465)
    {
        _503 = _295;
    }
    float _585 = _503;
    float _587 = -_537;
    float _589 = _587 + 1.0;
    int _591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _593 = _591 != 0;
    int _595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _597 = _595 != 0;
    int _599 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _601 = _599 != 0;
    float _603 = _585;
    if (_465)
    {
        _603 = _293;
    }
    float _605 = _603;
    bool _607 = !_593;
    int _609 = _607 ? 0 : 1;
    float _611 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[83].w, _377);
    float _613 = _605;
    if (!_465)
    {
        _613 = _293;
    }
    float _615 = _613;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _619 = _615;
    if (_465)
    {
        _619 = _291;
    }
    float _621 = _619;
    int _623 = abs(_609);
    if (!_465)
    {
        _429 = _295;
    }
    float _625 = _429;
    float _627 = _621 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _629 = float(_469);
    float _631 = -_617;
    float _633 = fma(_627, 2.0, _631);
    float _635 = _625;
    if (_465)
    {
        _635 = _293;
    }
    float _637 = _635;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _641 = float(_623);
    float _643 = 1.0 / _629;
    float _645 = float(_511);
    float _647 = _637 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _649 = _641 * _645;
    float _651 = float(_495);
    float _653 = fma(_647, -2.0, _639);
    float _655 = in.m_74.x;
    float _657 = in.m_74.y;
    float _659 = in.m_74.z;
    bool _661 = !_597;
    int _663 = _661 ? 0 : 1;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _665;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _669;
    float _673 = 1.0 / _651;
    int _675 = abs(_663);
    float _677 = fma(_667, _363, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _679 = fma(_671, _363, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _681 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _683 = isnan(0.0);
    bool _685 = _681 || _683;
    bool _687 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _689 = _685 || _687;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _693 = 1.0 + _691;
    float _695 = float(_553);
    float _697 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[76].y, _357);
    float _699 = float(_675);
    float _701 = 1.0 / _693;
    float _703 = _689 ? _589 : 0.0;
    float _705 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[82].z, _577);
    float _707 = _699 * _695;
    float _709 = _559 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _711 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _713 = isnan(_221);
    bool _715 = _711 || _713;
    bool _717 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _719 = _715 || _717;
    float _721 = float(_719);
    float _723 = _707 * (-2.0);
    bool _725 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _727 = isnan(1.0);
    bool _729 = _725 || _727;
    bool _731 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _733 = _729 || _731;
    float _735 = -_151;
    float _737 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[81].x, _633);
    float _739 = _709 + _583;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _745 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _747 = isnan(_221);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _753 = _749 || _751;
    float _755 = float(_753);
    float _757 = -_721;
    float _759 = _757 + 1.0;
    float _761 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[82].w, _611);
    float _763 = fma(_425, _723, _425);
    float _765 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[78].z, _741);
    float _767 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[78].w, _743);
    float _769 = fma(_723, _657, _657);
    bool _771 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _773 = isnan(_221);
    bool _775 = _771 || _773;
    bool _777 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _779 = _775 || _777;
    float _781 = float(_779);
    float _783 = _755 * _759;
    float _785 = -_755;
    float _787 = _785 + 1.0;
    float _789 = -_151;
    float _791 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[76].x, _367);
    bool _793 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _795 = isnan(_221);
    bool _797 = _793 || _795;
    bool _799 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _801 = _797 || _799;
    float _803 = float(_801);
    float _805 = _643 * _151;
    float _807 = _673 * _151;
    float _809 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[77].z, _765);
    float _811 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[77].w, _767);
    float _813 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[81].y, _653);
    bool _815 = !_601;
    int _817 = _815 ? 0 : 1;
    if (_733)
    {
        float _819 = _703 * _701;
        _153 = _819;
    }
    float _821 = _153;
    float _823 = _781 * _787;
    float _825 = -_781;
    float _827 = _825 + 1.0;
    float _829 = _293 + (-0.5);
    int _831 = abs(_817);
    float _833 = 1.0 / _583;
    float _835 = _803 * _827;
    float _837 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[196].y, _769);
    float _839 = -_803;
    float _841 = _839 + 1.0;
    float _843 = _439 * _835;
    float _845 = float(_519);
    float _847 = _449 * _835;
    float _849 = float(_831);
    float _851 = _649 * (-2.0);
    float _853 = fma(_763, _821, _837);
    float _855 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[143].x, _843);
    float _857 = _849 * _845;
    float _859 = fma(_851, _655, _655);
    float _861 = fma(_399, _851, _399);
    float _863 = in.m_76.x;
    float _865 = in.m_76.y;
    float _867 = _291 + (-0.5);
    float _869 = _739 * _833;
    float _871 = _869 * 0.5;
    float _873 = _857 * (-2.0);
    float _875 = fma(_473, _823, _855);
    float _877 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[196].x, _859);
    float _879 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _881 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[30].w, _879);
    float _883 = fma(_873, _659, _659);
    float _885 = _295 + (-0.5);
    float _887 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[143].y, _847);
    float _889 = fma(_403, _873, _403);
    float _891 = fma(_677, _783, _875);
    float _893 = fma(_885, (*spvDescriptorSet0.vp_c9)._m0[196].z, _883);
    float _895 = 1.0 / _881;
    float _897 = fma(_861, _821, _877);
    float _899 = fma(_445, _823, _887);
    float _901 = fma(_889, _821, _893);
    float _903 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[146].x, _891);
    float _905 = _853 * 0.15915493667125701904296875;
    float _907 = _897 * 0.15915493667125701904296875;
    float _909 = fma(_679, _783, _899);
    float _911 = _901 * 0.15915493667125701904296875;
    float _913 = _905 * 6.283185482025146484375;
    float _915 = sin(_913);
    float _917 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _919 = _903 * _863;
    float _921 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[146].y, _909);
    float _923 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _925 = _477 + _917;
    float _927 = _919 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _929 = _921 * _865;
    float _931 = _905 * 6.283185482025146484375;
    float _933 = cos(_931);
    float _935 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _191);
    float _937 = _927 * _923;
    float _939 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _941 = _895 * _939;
    float _943 = _929 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _945 = _925 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _947 = _925 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _949 = _907 * 6.283185482025146484375;
    float _951 = sin(_949);
    bool _953 = _941 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _955 = _943 * _935;
    bool _957 = _941 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _959 = fma(_255, (*spvDescriptorSet0.vp_c15)._m0[126].x, _945);
    float _961 = fma(_255, (*spvDescriptorSet0.vp_c15)._m0[127].x, _947);
    float _963 = _907 * 6.283185482025146484375;
    float _965 = cos(_963);
    float _967 = fma(_261, (*spvDescriptorSet0.vp_c15)._m0[126].z, _959);
    float _969 = fma(_261, (*spvDescriptorSet0.vp_c15)._m0[127].z, _961);
    float _971 = _967 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    int _973 = 2;
    if (!_953)
    {
        _973 = 1;
    }
    int _975 = _973;
    float _977 = _969 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _979 = _911 * 6.283185482025146484375;
    float _981 = cos(_979);
    float _983 = _951 * _933;
    float _985 = _951 * _915;
    float _987 = _911 * 6.283185482025146484375;
    float _989 = sin(_987);
    float _991 = _965 * _915;
    float _993 = _965 * _933;
    float _995 = _933 * _981;
    float _997 = trunc(_971);
    int _999 = int(_997);
    float _1001 = _965 * _981;
    float _1003 = _951 * _981;
    float _1005 = _915 * _981;
    float _1007 = _1001 * _955;
    float _1009 = -_991;
    float _1011 = fma(_989, _983, _1009);
    float _1013 = -_983;
    float _1015 = fma(_989, _991, _1013);
    bool _1017 = !_953;
    int _1019 = _1017 ? 0 : 1;
    float _1021 = fma(_989, _993, _985);
    float _1023 = fma(_989, _985, _993);
    float _1025 = -_955;
    float _1027 = _989 * _1025;
    int _1029 = _975;
    if (!_957)
    {
        _1029 = _1019;
    }
    int _1031 = _1029;
    float _1033 = trunc(_977);
    int _1035 = int(_1033);
    float _1037 = fma(_1021, _937, _1007);
    float _1039 = fma(_995, _937, _1027);
    int _1041 = _1031 << 6;
    float _1043 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1045 = _1003 * _955;
    int _1047 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1049 = _999 + _1047;
    int _1051 = _1049 + 1;
    int _1053 = _1041 + 96;
    uint _1056 = uint(int(uint(_1053) >> uint(2)));
    uint _1058 = uint(int(uint(int(_1056)) >> uint(2)));
    int _1060 = int(_1056) & 3;
    float _1062 = (*spvDescriptorSet0.vp_c15)._m0[int(_1058)][_1060];
    int _1064 = int(_1056) + 1;
    uint _1066 = uint(int(uint(_1064) >> uint(2)));
    int _1068 = _1064 & 3;
    float _1070 = (*spvDescriptorSet0.vp_c15)._m0[int(_1066)][_1068];
    float _1072 = fma(_1015, _1043, _1037);
    float _1074 = fma(_1011, _937, _1045);
    float _1076 = fma(_1005, _1043, _1039);
    bool _1078 = _1051 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1080 = _1072 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1082 = fma(_1023, _1043, _1074);
    float _1084 = _1072 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1086 = _1041 + 104;
    uint _1088 = uint(int(uint(_1086) >> uint(2)));
    uint _1090 = uint(int(uint(int(_1088)) >> uint(2)));
    int _1092 = int(_1088) & 3;
    float _1094 = (*spvDescriptorSet0.vp_c15)._m0[int(_1090)][_1092];
    int _1096 = int(_1088) + 1;
    uint _1098 = uint(int(uint(_1096) >> uint(2)));
    int _1100 = _1096 & 3;
    float _1102 = (*spvDescriptorSet0.vp_c15)._m0[int(_1098)][_1100];
    int _1104 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1106 = _1035 + _1104;
    int _1108 = _1106 + 1;
    float _1110 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1080);
    int _1112 = _1051 | _1108;
    float _1114 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1110);
    int _1116 = _1041 + 48;
    uint _1118 = uint(int(uint(_1116) >> uint(2)));
    uint _1120 = uint(int(uint(int(_1118)) >> uint(2)));
    int _1122 = int(_1118) & 3;
    float _1124 = (*spvDescriptorSet0.vp_c15)._m0[int(_1120)][_1122];
    int _1126 = int(_1118) + 1;
    uint _1128 = uint(int(uint(_1126) >> uint(2)));
    int _1130 = _1126 & 3;
    float _1132 = (*spvDescriptorSet0.vp_c15)._m0[int(_1128)][_1130];
    bool _1134 = _1112 < 0;
    bool _1136 = _1134 || _1078;
    float _1138 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1084);
    float _1140 = _1114 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _1142 = _1108 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1144 = _1142 || _1136;
    float _1146 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1138);
    float _1148 = _261 + _1140;
    int _1150 = _1041 + 64;
    uint _1152 = uint(int(uint(_1150) >> uint(2)));
    uint _1154 = uint(int(uint(int(_1152)) >> uint(2)));
    int _1156 = int(_1152) & 3;
    float _1158 = (*spvDescriptorSet0.vp_c15)._m0[int(_1154)][_1156];
    int _1160 = int(_1152) + 1;
    uint _1162 = uint(int(uint(_1160) >> uint(2)));
    int _1164 = _1160 & 3;
    float _1166 = (*spvDescriptorSet0.vp_c15)._m0[int(_1162)][_1164];
    float _1168 = _1146 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1170 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1172 = _1148 + _1170;
    float _1174 = _255 + _1168;
    float _1176 = _1172 * _1172;
    int _1178 = _1041 + 56;
    uint _1180 = uint(int(uint(_1178) >> uint(2)));
    uint _1182 = uint(int(uint(int(_1180)) >> uint(2)));
    int _1184 = int(_1180) & 3;
    float _1186 = (*spvDescriptorSet0.vp_c15)._m0[int(_1182)][_1184];
    int _1188 = int(_1180) + 1;
    uint _1190 = uint(int(uint(_1188) >> uint(2)));
    int _1192 = _1188 & 3;
    float _1194 = (*spvDescriptorSet0.vp_c15)._m0[int(_1190)][_1192];
    int _1196 = _1051;
    int _1198 = as_type<int>(_1176);
    float _1200 = as_type<float>(_1031);
    if (!_1144)
    {
        int _1202 = _1108 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1204 = _1202 + _1051;
        _1196 = _1204;
    }
    int _1206 = _1196;
    float _1208 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1210 = _1174 + _1208;
    int _1212 = 0;
    float _1214 = as_type<float>(_1206);
    if (!_1144)
    {
        int _1216 = _1206 << 2;
        _1212 = _1216;
    }
    int _1218 = _1212;
    int _1220 = _1041 + 72;
    uint _1222 = uint(int(uint(_1220) >> uint(2)));
    uint _1224 = uint(int(uint(int(_1222)) >> uint(2)));
    int _1226 = int(_1222) & 3;
    float _1228 = (*spvDescriptorSet0.vp_c15)._m0[int(_1224)][_1226];
    int _1230 = int(_1222) + 1;
    uint _1232 = uint(int(uint(_1230) >> uint(2)));
    int _1234 = _1230 & 3;
    float _1236 = (*spvDescriptorSet0.vp_c15)._m0[int(_1232)][_1234];
    float _1238 = fma(_1210, _1210, _1176);
    int _1240 = _1218;
    if (!_1144)
    {
        uint _1242 = uint(int(uint(_1206) >> uint(2)));
        _1198 = int(_1242);
    }
    int _1244 = _1198;
    int _1246 = _1244;
    if (!_1144)
    {
        int _1248 = 12 & _1218;
        _1240 = _1248;
    }
    int _1250 = _1240;
    float _1252 = sqrt(_1238);
    int _1254 = _1041 + 80;
    uint _1256 = uint(int(uint(_1254) >> uint(2)));
    uint _1258 = uint(int(uint(int(_1256)) >> uint(2)));
    int _1260 = int(_1256) & 3;
    float _1262 = (*spvDescriptorSet0.vp_c15)._m0[int(_1258)][_1260];
    int _1264 = int(_1256) + 1;
    uint _1266 = uint(int(uint(_1264) >> uint(2)));
    int _1268 = _1264 & 3;
    float _1270 = (*spvDescriptorSet0.vp_c15)._m0[int(_1266)][_1268];
    float _1272 = _925 * _1070;
    float _1274 = _1070;
    if (!_1144)
    {
        int _1276 = _1244 << 4;
        int _1278 = _1276 + _1250;
        _1246 = _1278;
    }
    int _1280 = _1246;
    float _1282 = _1072 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1284 = fma(_255, _1062, _1272);
    float _1286 = _1072;
    if (!_1144)
    {
        float _1288 = floor(_971);
        _1286 = _1288;
    }
    float _1290 = _1286;
    float _1292 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1282);
    float _1294 = fma(_261, _1094, _1284);
    float _1296 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1292);
    float _1298 = _1294 + _1102;
    bool _1300 = _1252 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1302 = _1296 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1304 = _925 * _1132;
    float _1306 = 1.0 / _1298;
    int _1308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1310 = _1308 != 0;
    int _1312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1314 = _1312 != 0;
    int _1316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1318 = _1316 != 0;
    int _1320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1322 = _1320 != 0;
    float _1324 = fma(_255, _1124, _1304);
    bool _1326 = !_1314;
    int _1328 = _1326 ? 0 : 1;
    float _1330 = _925 * _1166;
    bool _1332 = !_1310;
    int _1334 = _1332 ? 0 : 1;
    bool _1336 = !_1318;
    int _1338 = _1336 ? 0 : 1;
    float _1340 = fma(_255, _1158, _1330);
    bool _1342 = !_1322;
    int _1344 = _1342 ? 0 : 1;
    float _1346 = fma(_261, _1186, _1324);
    float _1348 = _1346 + _1194;
    float _1350 = fma(_261, _1228, _1340);
    float _1352 = _477 + _1302;
    float _1354 = _1302;
    if (!_1300)
    {
        _505 = _1174;
    }
    float _1356 = _505;
    float _1358 = _1350 + _1236;
    float _1360 = _1356;
    if (!_1300)
    {
        _1354 = _1148;
    }
    float _1362 = _1354;
    float _1364 = _1362;
    if (!_1300)
    {
        _1274 = _1352;
    }
    float _1366 = _1274;
    bool _1368 = !_1300;
    float _1370 = _1366;
    if (!_1368)
    {
        float _1372 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1374 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1376 = _1252 + _1374;
        float _1378 = rsqrt(_1238);
        float _1380 = _1376 * _1372;
        float _1382 = _1352 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1384 = _1380 * 0.15915493667125701904296875;
        float _1386 = _1384 * 6.283185482025146484375;
        float _1388 = cos(_1386);
        float _1390 = _1384 * 6.283185482025146484375;
        float _1392 = sin(_1390);
        float _1394 = _1388 + (-1.0);
        float _1396 = fma(_1392, _1382, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1398 = _1394 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1400 = _1378 * _1396;
        float _1402 = fma(_1352, _1388, _1398);
        float _1404 = fma(_1210, _1400, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1406 = fma(_1172, _1400, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1370 = _1402;
        _1360 = _1404;
        _1364 = _1406;
    }
    float _1408 = _1370;
    float _1410 = _1360;
    float _1412 = _1364;
    int _1414 = _1041 + 88;
    uint _1416 = uint(int(uint(_1414) >> uint(2)));
    uint _1418 = uint(int(uint(int(_1416)) >> uint(2)));
    int _1420 = int(_1416) & 3;
    float _1422 = (*spvDescriptorSet0.vp_c15)._m0[int(_1418)][_1420];
    int _1424 = int(_1416) + 1;
    uint _1426 = uint(int(uint(_1424) >> uint(2)));
    int _1428 = _1424 & 3;
    float _1430 = (*spvDescriptorSet0.vp_c15)._m0[int(_1426)][_1428];
    float _1432 = _1358 * _1306;
    float _1434 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1436 = _1348 * _1306;
    float _1438 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1440 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1442 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1434);
    float _1444 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1446 = _1148;
    float _1448 = _1432;
    if (!_1144)
    {
        int _1450 = _1280 + 400;
        uint _1452 = uint(int(uint(_1450) >> uint(2)));
        uint _1454 = uint(int(uint(int(_1452)) >> uint(2)));
        int _1456 = int(_1452) & 3;
        float _1458 = (*spvDescriptorSet0.vp_c15)._m0[int(_1454)][_1456];
        _1446 = _1458;
    }
    float _1460 = _1446;
    float _1462 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1438);
    float _1464 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1440);
    bool _1466 = _1436 >= 0.0;
    float _1468 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1442);
    float _1470 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1462);
    float _1472 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1464);
    bool _1474 = _1436 <= 1.0;
    bool _1476 = _1474 && _1466;
    float _1478 = _1468 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1480 = _1470 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1482 = _1472 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1484 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1444);
    float _1486 = _1478 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1488 = _1432 >= 0.0;
    bool _1490 = _1488 && _1476;
    float _1492 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1494 = _1480 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1496 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1484);
    float _1498 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1486);
    bool _1500 = _1432 <= 1.0;
    bool _1502 = _1500 && _1490;
    float _1504 = -_1494;
    float _1506 = fma(_1504, _1492, 1.0);
    float _1508 = _1496 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1510 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1498);
    float _1512 = _925 * _1270;
    float _1514 = _1094;
    if (!_1144)
    {
        float _1516 = floor(_977);
        _1514 = _1516;
    }
    float _1518 = _1514;
    float _1520 = _1478 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1522 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1510);
    float _1524 = fma(_255, _1262, _1512);
    float _1526 = _1478 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1528 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1520);
    float _1530 = log2(_1506);
    if (_1502)
    {
        float _1532 = float(_1031);
        _1200 = _1532;
    }
    float _1534 = _1200;
    float _1536 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1526);
    float _1538 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1528);
    float _1540 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1536);
    float _1542 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1538);
    float _1544 = 1.0 / _1522;
    float _1546 = fma(_261, _1422, _1524);
    float _1548 = 0.0;
    float _1550 = _1542;
    if (!_1144)
    {
        float _1552 = -_1518;
        float _1554 = _977 + _1552;
        _1548 = _1554;
    }
    float _1556 = _1548;
    float _1558 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1540);
    float _1560 = _1546 + _1430;
    float _1562 = _1534;
    if (_1502)
    {
        float _1564 = rint(_1534);
        float _1566 = precise::max(_1564, 0.0);
        uint _1568 = uint(_1566);
        uint _1570 = clamp(_1568, 0u, 65535u);
        _1562 = as_type<float>(_1570);
    }
    float _1572 = _1562;
    float _1574 = _1560 * _1306;
    float _1576 = _1530 * 0.693147182464599609375;
    float _1578 = _1576 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1580 = _1560;
    float _1582 = _1460;
    if (!_1144)
    {
        float _1584 = rint(_1460);
        float _1586 = precise::max(_1584, 0.0);
        uint _1588 = uint(_1586);
        uint _1590 = clamp(_1588, 0u, 65535u);
        _1580 = as_type<float>(_1590);
    }
    float _1592 = _1580;
    float _1594 = _1542 * _1544;
    float _1596 = _1558 * _1544;
    float _1598 = fma(_1594, 0.5, 0.5);
    float _1600 = fma(_1596, -0.5, 0.5);
    float _1602 = _1594;
    if (!_1144)
    {
        float _1604 = -_1290;
        float _1606 = _971 + _1604;
        _1602 = _1606;
    }
    float _1608 = _1602;
    float _1610 = _1576;
    if (_1502)
    {
        float3 _6350 = float3(_1436, _1432, float(as_type<int>(_1572)));
        float3 _6354 = select(_6350, float3(0.0), isnan(_6350));
        float _1612 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6354.xy, uint(rint(_6354.z)), _1574, level(0.0));
        _1610 = _1612;
    }
    float _1614 = _1610;
    float3 _6364 = float3(_1598, _1600, _1578);
    float _1616 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6364, float3(0.0), isnan(_6364)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6364, float3(0.0), isnan(_6364)), level(0.0)).x;
    float3 _6373 = float3(_1598, _1600, _1578);
    float4 _1619 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6373, float3(0.0), isnan(_6373)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6373, float3(0.0), isnan(_6373)), level(0.0)).xyzw;
    float _1621 = _1619.x;
    float _1623 = _1619.y;
    float _1625 = _1619.z;
    float _1627 = _1619.w;
    float _1629 = _1556;
    if (!_1144)
    {
        float3 _6396 = float3(_1608, _1556, float(as_type<int>(_1592)));
        float3 _6398 = select(_6396, float3(0.0), isnan(_6396));
        float _1631 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6398.xy, uint(rint(_6398.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6398.xy, uint(rint(_6398.z)), level(0.0)).x;
        _1629 = _1631;
    }
    float _1633 = _1629;
    float _1635 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1637 = int(_1635);
    int _1639 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1641 = _1639 != 0;
    int _1643 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1645 = _1643 != 0;
    int _1647 = abs(_569);
    int _1649 = abs(_575);
    float _1651 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1653 = int(_1651);
    int _1655 = abs(_581);
    int _1657 = abs(_1334);
    int _1659 = abs(_1338);
    if (_1641)
    {
        float _1661 = in.m_66.x;
        _1582 = _1661;
    }
    float _1663 = _1582;
    int _1665 = abs(_1344);
    float _1667 = trunc(_805);
    int _1669 = int(_1667);
    float _1671 = float(uint(_1637));
    float _1673 = _1663;
    if (!_1641)
    {
        float _1675 = in.m_66.y;
        _1673 = _1675;
    }
    float _1677 = _1673;
    float _1679 = 1.0 / _1671;
    float _1681 = float(uint(_1653));
    int _1683 = ~_1637;
    int _1685 = _1683 + 1;
    float _1687 = 1.0 / _1681;
    float _1689 = trunc(_807);
    int _1691 = int(_1689);
    int _1693 = as_type<int>(_1679) + (-2);
    float _1695 = float(uint(_1669));
    float _1697 = _1695;
    if (_1641)
    {
        _1448 = 1.0;
    }
    float _1699 = _1448;
    float _1701 = _1699;
    if (!_1641)
    {
        _1701 = 1.2345600128173828125;
    }
    float _1703 = _1701;
    float _1705 = as_type<float>(_1693) * _1695;
    int _1707 = as_type<int>(_1687) + (-2);
    int _1709 = ~_1653;
    int _1711 = _1709 + 1;
    if (_1641)
    {
        _1697 = 1.0;
    }
    float _1713 = _1697;
    float _1715 = trunc(_1705);
    float _1717 = precise::max(_1715, 0.0);
    uint _1719 = uint(_1717);
    float _1721 = _1713;
    if (!_1641)
    {
        _1721 = 7.345489978790283203125;
    }
    float _1723 = _1721;
    float _1725 = float(uint(_1691));
    float _1727 = float(_1669);
    float _1729 = _1723 * _291;
    float _1731 = as_type<float>(_1707) * _1725;
    float _1733 = floor(_1729);
    int _1735 = _1685 * int(_1719);
    int _1737 = _1735 + _1669;
    float _1739 = trunc(_1731);
    float _1741 = precise::max(_1739, 0.0);
    uint _1743 = uint(_1741);
    float _1745 = _1703 * _1677;
    float _1747 = floor(_1745);
    int _1749 = _1711 * int(_1743);
    int _1751 = _1749 + _1691;
    float _1753 = float(uint(_1737));
    float _1755 = float(uint(_1751));
    float _1757 = as_type<float>(_1693) * _1753;
    float _1759 = float(_1637);
    float _1761 = as_type<float>(_1707) * _1755;
    float _1763 = -_1733;
    float _1765 = _1729 + _1763;
    float _1767 = trunc(_1757);
    float _1769 = precise::max(_1767, 0.0);
    uint _1771 = uint(_1769);
    bool _1773 = _1727 >= _1759;
    bool _1775 = isnan(_1727);
    bool _1777 = _1773 || _1775;
    bool _1779 = isnan(_1759);
    bool _1781 = _1777 || _1779;
    float _1783 = float(_1781);
    float _1785 = -_1747;
    float _1787 = _1745 + _1785;
    int _1789 = ~_1637;
    int _1791 = _1789 + 1;
    float _1793 = float(_1653);
    float _1795 = trunc(_1761);
    float _1797 = precise::max(_1795, 0.0);
    uint _1799 = uint(_1797);
    float _1801 = _1787 * _1793;
    int _1803 = int(_1719) + int(_1771);
    float _1805 = _1765 * _1759;
    float _1807 = float(_1691);
    float _1809 = _1759 * _571;
    float _1811 = _1793 * _571;
    int _1813 = _1791 * _1803;
    int _1815 = _1813 + _1669;
    float _1817 = trunc(_1783);
    int _1819 = int(_1817);
    int _1821 = int(_1743) + int(_1799);
    int _1823 = ~_1653;
    int _1825 = _1823 + 1;
    bool _1827 = _1807 >= _1793;
    bool _1829 = isnan(_1807);
    bool _1831 = _1827 || _1829;
    bool _1833 = isnan(_1793);
    bool _1835 = _1831 || _1833;
    float _1837 = float(_1835);
    bool _1839 = uint(_1815) >= uint(_1637);
    int _1841 = _1825 * _1821;
    int _1843 = _1841 + _1691;
    float _1845 = trunc(_1805);
    int _1847 = int(_1845);
    bool _1849 = !_1839;
    int _1851 = _1849 ? 0 : (-1);
    int _1853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1855 = _1853 != 0;
    int _1857 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1859 = _1857 != 0;
    int _1861 = ~_1803;
    int _1863 = _1861 + _1851;
    int _1865 = _1863 + 1;
    float _1867 = trunc(_1809);
    int _1869 = int(_1867);
    bool _1871 = !_1855;
    int _1873 = _1871 ? 0 : 1;
    bool _1875 = uint(_1843) >= uint(_1653);
    bool _1877 = !_1859;
    int _1879 = _1877 ? 0 : 1;
    int _1881 = abs(_1873);
    float _1883 = trunc(_1837);
    int _1885 = int(_1883);
    bool _1887 = !_1875;
    int _1889 = _1887 ? 0 : (-1);
    int _1891 = _1637 * _1865;
    int _1893 = _1891 + _1669;
    int _1895 = abs(_1879);
    int _1897 = ~_1821;
    int _1899 = _1897 + _1889;
    int _1901 = _1899 + 1;
    float _1903 = trunc(_1801);
    int _1905 = int(_1903);
    bool _1907 = _1637 == 0;
    int _1909 = _1847 * _1881;
    int _1911 = _1909 + _1669;
    int _1913 = ~_1819;
    int _1915 = _1913 + 1;
    int _1917 = _1915 + 1;
    int _1919 = _1653 * _1901;
    int _1921 = _1919 + _1691;
    bool _1923 = !_1907;
    int _1925 = _1923 ? _1893 : (-1);
    bool _1927 = _1653 == 0;
    float _1929 = trunc(_1811);
    int _1931 = int(_1929);
    int _1933 = _1637 + (-1);
    int _1935 = _1925 * _1917;
    int _1937 = ~_1885;
    int _1939 = _1937 + 1;
    int _1941 = _1939 + 1;
    bool _1943 = !_1927;
    int _1945 = _1943 ? _1921 : (-1);
    int _1947 = _1819 * _1933;
    int _1949 = _1947 + _1935;
    int _1951 = _1653 + (-1);
    int _1953 = _1945 * _1941;
    int _1955 = abs(_1328);
    int _1957 = _1885 * _1951;
    int _1959 = _1957 + _1953;
    int _1961 = _1949 * _1647;
    int _1963 = _1959 * _1955;
    bool _1965 = !_1645;
    int _1967 = _1965 ? 0 : 1;
    int _1969 = _1905 * _1895;
    int _1971 = _1969 + _1691;
    int _1973 = _1869 * _1649;
    int _1975 = _1973 + _1961;
    int _1977 = abs(_1967);
    int _1979 = _1911 * _1655;
    int _1981 = _1979 + _1975;
    int _1983 = _1931 * _1657;
    int _1985 = _1983 + _1963;
    int _1987 = ~_1637;
    int _1989 = _1987 + 1;
    int _1991 = _1847 * _1977;
    int _1993 = _1991 + _1981;
    int _1995 = _1971 * _1659;
    int _1997 = _1995 + _1985;
    int _1999 = ~_1637;
    int _2001 = _1999 + 1;
    float _2003 = float(uint(_1993));
    int _2005 = _1905 * _1665;
    int _2007 = _2005 + _1997;
    int _2009 = ~_1653;
    int _2011 = _2009 + 1;
    float _2013 = as_type<float>(_1693) * _2003;
    float _2015 = float(uint(_2007));
    float _2017 = float(uint(_1911));
    float _2019 = trunc(_2013);
    float _2021 = precise::max(_2019, 0.0);
    uint _2023 = uint(_2021);
    float _2025 = as_type<float>(_1707) * _2015;
    float _2027 = as_type<float>(_1693) * _2017;
    float _2029 = trunc(_2025);
    float _2031 = precise::max(_2029, 0.0);
    uint _2033 = uint(_2031);
    int _2035 = _2001 * int(_2023);
    int _2037 = _2035 + _1993;
    float _2039 = trunc(_2027);
    float _2041 = precise::max(_2039, 0.0);
    uint _2043 = uint(_2041);
    float _2045 = float(uint(_2037));
    int _2047 = _2011 * int(_2033);
    int _2049 = _2047 + _2007;
    float _2051 = as_type<float>(_1693) * _2045;
    float _2053 = float(uint(_2049));
    int _2055 = ~_1637;
    int _2057 = _2055 + 1;
    float _2059 = trunc(_2051);
    float _2061 = precise::max(_2059, 0.0);
    uint _2063 = uint(_2061);
    float _2065 = as_type<float>(_1707) * _2053;
    float _2067 = float(uint(_1971));
    int _2069 = _2057 * int(_2043);
    int _2071 = _2069 + _1911;
    float _2073 = trunc(_2065);
    float _2075 = precise::max(_2073, 0.0);
    uint _2077 = uint(_2075);
    float _2079 = as_type<float>(_1707) * _2067;
    float _2081 = float(uint(_2071));
    int _2083 = ~_1653;
    int _2085 = _2083 + 1;
    float _2087 = as_type<float>(_1693) * _2081;
    float _2089 = trunc(_2079);
    float _2091 = precise::max(_2089, 0.0);
    uint _2093 = uint(_2091);
    int _2095 = int(_2023) + int(_2063);
    int _2097 = ~_1653;
    int _2099 = _2097 + 1;
    float _2101 = trunc(_2087);
    float _2103 = precise::max(_2101, 0.0);
    uint _2105 = uint(_2103);
    int _2107 = int(_2033) + int(_2077);
    int _2109 = _1989 * _2095;
    int _2111 = _2109 + _1993;
    float _2113 = as_type<float>(_2085);
    if (_1144)
    {
        _2113 = 1.0;
    }
    float _2115 = _2113;
    int _2117 = _2085 * _2107;
    int _2119 = _2117 + _2007;
    bool _2121 = uint(_2111) >= uint(_1637);
    int _2123 = _2099 * int(_2093);
    int _2125 = _2123 + _1971;
    bool _2127 = !_2121;
    int _2129 = _2127 ? 0 : (-1);
    bool _2131 = uint(_2119) >= uint(_1653);
    float _2133 = float(uint(_2125));
    int _2135 = ~_2095;
    int _2137 = _2135 + _2129;
    int _2139 = _2137 + 1;
    bool _2141 = !_2131;
    int _2143 = _2141 ? 0 : (-1);
    float _2145 = as_type<float>(_1707) * _2133;
    int _2147 = int(_2043) + int(_2105);
    int _2149 = _1637 * _2139;
    int _2151 = _2149 + _1993;
    int _2153 = ~_2107;
    int _2155 = _2153 + _2143;
    int _2157 = _2155 + 1;
    float _2159 = _2115;
    if (!_1144)
    {
        int _2161 = _1206 << 4;
        int _2163 = _2161 + 2048;
        uint _2165 = uint(int(uint(_2163) >> uint(2)));
        uint _2167 = uint(int(uint(int(_2165)) >> uint(2)));
        int _2169 = int(_2165) & 3;
        float _2171 = (*spvDescriptorSet0.vp_c15)._m0[int(_2167)][_2169];
        int _2173 = int(_2165) + 1;
        uint _2175 = uint(int(uint(_2173) >> uint(2)));
        int _2177 = _2173 & 3;
        float _2179 = (*spvDescriptorSet0.vp_c15)._m0[int(_2175)][_2177];
        int _2181 = _2163 + 8;
        uint _2183 = uint(int(uint(_2181) >> uint(2)));
        uint _2185 = uint(int(uint(int(_2183)) >> uint(2)));
        int _2187 = int(_2183) & 3;
        float _2189 = (*spvDescriptorSet0.vp_c15)._m0[int(_2185)][_2187];
        int _2191 = int(_2183) + 1;
        uint _2193 = uint(int(uint(_2191) >> uint(2)));
        int _2195 = _2191 & 3;
        float _2197 = (*spvDescriptorSet0.vp_c15)._m0[int(_2193)][_2195];
        float _2199 = _925 * _2179;
        float _2201 = fma(_255, _2171, _2199);
        float _2203 = fma(_261, _2189, _2201);
        float _2205 = _2203 + _2197;
        float _2207 = precise::clamp(_2205, 0.0, 1.0);
        float _2209 = -_2207;
        float _2211 = _2209 + _1633;
        float _2213 = fma(_2211, 500.0, 1.5);
        float _2215 = exp2(_2213);
        float _2217 = 0.0 + _2215;
        float _2219 = precise::clamp(_2217, 0.0, 1.0);
        _1214 = as_type<float>(_2163);
        _2159 = _2219;
    }
    float _2221 = _1214;
    float _2223 = _2159;
    float _2225 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2227 = _1408 + _2225;
    float _2229 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2231 = _1410 + _2229;
    float _2233 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2235 = _1412 + _2233;
    float _2237 = _2227 * _2227;
    float _2239 = fma(_2231, _2231, _2237);
    float _2241 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2243 = fma(_2235, _2235, _2239);
    float _2245 = rsqrt(_2243);
    float _2247 = sqrt(_2243);
    float _2249 = _2245 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2251 = _2231 * _2249;
    float _2253 = _2235 * _2249;
    float _2255 = _2251 * _2251;
    float _2257 = _2253 * _2253;
    float _2259 = _2255 + _2257;
    float _2261 = sqrt(_2259);
    bool _2263 = _2261 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2265 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2267 = _2261 + _2265;
    float _2269 = as_type<float>(_2077);
    float _2271 = _2259;
    float _2273 = _2267;
    float _2275 = _2221;
    float _2277 = _2241;
    float _2279 = _2251;
    float _2281 = _2253;
    float _2283 = _2255;
    float _2285 = _2257;
    if (_2263)
    {
        float _2287 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2269 = _2287;
    }
    float _2289 = _2269;
    if (_2263)
    {
        float _2291 = rsqrt(_2259);
        _2271 = _2291;
    }
    float _2293 = _2271;
    if (_2263)
    {
        float _2295 = _2267 * _2289;
        _2273 = _2295;
    }
    float _2297 = _2273;
    float _2299 = precise::max(0.0, _2241);
    float _2301 = _2299;
    if (_2263)
    {
        float _2303 = _2297 * 0.15915493667125701904296875;
        _2275 = _2303;
    }
    float _2305 = _2275;
    float _2307 = -_2249;
    float _2309 = -_2299;
    float _2311 = fma(_2227, _2307, _2309);
    float _2313 = _261;
    float _2315 = _2311;
    if (_2263)
    {
        float _2317 = _2305 * 6.283185482025146484375;
        float _2319 = sin(_2317);
        _2313 = _2319;
    }
    float _2321 = _2313;
    if (_2263)
    {
        float _2323 = _2311 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2301 = _2323;
    }
    float _2325 = _2301;
    float _2327 = _2297;
    float _2329 = _2325;
    if (_2263)
    {
        float _2331 = _2305 * 6.283185482025146484375;
        float _2333 = cos(_2331);
        _2327 = _2333;
    }
    float _2335 = _2327;
    float _2337 = _2321;
    if (_2263)
    {
        float _2339 = fma(_2321, _2325, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2329 = _2339;
    }
    float _2341 = _2329;
    float _2343 = _2341;
    if (_2263)
    {
        float _2345 = _2293 * _2341;
        _2337 = _2345;
    }
    float _2347 = _2337;
    if (_2263)
    {
        float _2349 = _2335 + (-1.0);
        _2277 = _2349;
    }
    float _2351 = _2277;
    if (_2263)
    {
        float _2353 = _2251 * _2347;
        _2279 = _2353;
    }
    float _2355 = _2279;
    if (_2263)
    {
        float _2357 = _2253 * _2347;
        _2281 = _2357;
    }
    float _2359 = _2281;
    if (_2263)
    {
        float _2361 = _2351 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2343 = _2361;
    }
    float _2363 = _2343;
    if (_2263)
    {
        float _2365 = _2355 * _2355;
        _2283 = _2365;
    }
    float _2367 = _2283;
    if (_2263)
    {
        float _2369 = _2359 * _2359;
        _2285 = _2369;
    }
    float _2371 = _2285;
    int _2373 = ~_1637;
    int _2375 = _2373 + 1;
    if (_2263)
    {
        float _2377 = fma(_2311, _2335, _2363);
        _2315 = _2377;
    }
    float _2379 = _2315;
    float _2381 = fma(_2379, _2379, _2367);
    float _2383 = _2381 + _2371;
    float _2385 = rsqrt(_2383);
    float _2387 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2389 = fma(_2247, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2387);
    float _2391 = precise::clamp(_2389, 0.0, 1.0);
    float _2393 = -_2391;
    float _2395 = _2393 + 1.0;
    float _2397 = abs(_2395);
    float _2399 = log2(_2397);
    float _2401 = _2385 * _2355;
    float _2403 = _2385 * _2379;
    float _2405 = _2385 * _2359;
    float _2407 = _2401 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2409 = _2403 + 1.0;
    float _2411 = -_2407;
    float _2413 = fma(_2403, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2411);
    float _2415 = _2399 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2417 = -_2405;
    float _2419 = fma(_2417, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2413);
    float _2421 = fma(_2419, -0.5, 0.5);
    float _2423 = exp2(_2415);
    float _2425 = fma(_2419, 0.5, 0.5);
    float _2427 = fma(_2425, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2429 = sqrt(_2421);
    float _2431 = fma(_2425, _2427, -0.212114393711090087890625);
    float _2433 = fma(_2425, _2431, 1.570728778839111328125);
    float _2435 = -_2403;
    float _2437 = fma(_2423, _2409, _2435);
    bool _2439 = !_1907;
    int _2441 = _2439 ? _2151 : (-1);
    float _2443 = fma(_2437, 0.5, 0.5);
    int _2445 = _2441 & 3;
    bool _2447 = _2445 != 0;
    float _2449 = _2429 * 0.636619746685028076171875;
    int _2451 = _2441 & 3;
    bool _2453 = _2451 != 0;
    float _2455 = -_2433;
    float _2457 = fma(_2449, _2455, 1.0);
    int _2459 = _2375 * _2147;
    int _2461 = _2459 + _1911;
    bool _2463 = uint(_2451) > 1u;
    float2 _7563 = float2(_2457, _2443);
    float3 _2467 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7563, float2(0.0), isnan(_7563)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7563, float2(0.0), isnan(_7563)), level(0.0)).xyz;
    float _2469 = _2467.x;
    float _2471 = _2467.y;
    float _2473 = _2467.z;
    int _2475 = _1653 * _2157;
    int _2477 = _2475 + _2007;
    int _2479 = _2441 >> 31;
    float _2481 = trunc(_2145);
    float _2483 = precise::max(_2481, 0.0);
    uint _2485 = uint(_2483);
    bool _2487 = uint(_2461) >= uint(_1637);
    float _2489 = _1478 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2491 = _2447 ? 0 : 1;
    float _2493 = _2399 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2495 = _297 > 0.5;
    float _2497 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2489);
    int _2499 = ~_2491;
    int _2501 = _2499 + 1;
    int _2503 = _2501 + 1;
    float _2505 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2507 = !_1927;
    int _2509 = _2507 ? _2477 : (-1);
    float _2511 = -_277;
    float _2513 = _2511 + 1.0;
    int _2515 = _2503;
    if (!_2463)
    {
        int _2517 = ~_2491;
        int _2519 = _2517 + 1;
        _2515 = _2519;
    }
    int _2521 = _2515;
    float _2523 = -_809;
    float _2525 = _2523 + 1.0;
    int _2527 = _2479 & 3;
    float _2529 = -_705;
    float _2531 = _2529 + 1.0;
    int _2533 = _2509 >> 31;
    float _2535 = exp2(_2493);
    int _2537 = _2441 + _2527;
    float _2539 = -_811;
    float _2541 = _2539 + 1.0;
    int _2543 = _2533 & 3;
    float _2545 = -_761;
    float _2547 = _2545 + 1.0;
    bool _2549 = !_2487;
    int _2551 = _2549 ? 0 : (-1);
    bool _2553 = _2451 != 3;
    int _2555 = _2537 >> 2;
    int _2557 = _2509 + _2543;
    int _2559 = ~_2147;
    int _2561 = _2559 + _2551;
    int _2563 = _2561 + 1;
    bool _2565 = uint(_2451) >= 2u;
    float _2567 = -_2535;
    float _2569 = _2567 + 1.0;
    int _2571 = _2555 << 4;
    int _2573 = _2571 + 368;
    int _2575 = _1637 * _2563;
    int _2577 = _2575 + _1911;
    int _2579 = _2557 >> 2;
    float _2581 = _2569 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2583 = _2565 ? 0 : 1;
    uint _2585 = uint(int(uint(_2573) >> uint(2)));
    uint _2587 = uint(int(uint(int(_2585)) >> uint(2)));
    int _2589 = int(_2585) & 3;
    float _2591 = (*spvDescriptorSet0.vp_c9)._m0[int(_2587)][_2589];
    int _2593 = int(_2585) + 1;
    uint _2595 = uint(int(uint(_2593) >> uint(2)));
    int _2597 = _2593 & 3;
    float _2599 = (*spvDescriptorSet0.vp_c9)._m0[int(_2595)][_2597];
    int _2601 = _2579 << 4;
    int _2603 = _2601 + 512;
    int _2605 = ~_2583;
    int _2607 = _2605 + 1;
    int _2609 = _2607 + 1;
    int _2611 = _2609;
    if (_2553)
    {
        int _2613 = ~_2583;
        int _2615 = _2613 + 1;
        _2611 = _2615;
    }
    int _2617 = _2611;
    int _2619 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2621 = _2619 != 0;
    uint _2623 = uint(int(uint(_2603) >> uint(2)));
    uint _2625 = uint(int(uint(int(_2623)) >> uint(2)));
    int _2627 = int(_2623) & 3;
    float _2629 = (*spvDescriptorSet0.vp_c9)._m0[int(_2625)][_2627];
    int _2631 = int(_2623) + 1;
    uint _2633 = uint(int(uint(_2631) >> uint(2)));
    int _2635 = _2631 & 3;
    float _2637 = (*spvDescriptorSet0.vp_c9)._m0[int(_2633)][_2635];
    bool _2639 = !_2453;
    int _2641 = _2639 ? 0 : 1;
    int _2643 = _2509 & 3;
    bool _2645 = _2643 != 0;
    int _2647 = int(_2093) + int(_2485);
    int _2649 = ~_1653;
    int _2651 = _2649 + 1;
    bool _2653 = !_2621;
    int _2655 = _2653 ? 0 : 1;
    bool _2657 = uint(_2643) > 1u;
    int _2659 = _2651 * _2647;
    int _2661 = _2659 + _1971;
    float _2663 = -_191;
    int _2665 = _2495 ? as_type<int>(_2663) : as_type<int>(_191);
    bool _2667 = _2451 != 3;
    int _2669 = _2509 & 3;
    bool _2671 = _2669 != 0;
    bool _2673 = !_1907;
    int _2675 = _2673 ? _2577 : (-1);
    int _2677 = _2573 + 8;
    uint _2679 = uint(int(uint(_2677) >> uint(2)));
    uint _2681 = uint(int(uint(int(_2679)) >> uint(2)));
    int _2683 = int(_2679) & 3;
    float _2685 = (*spvDescriptorSet0.vp_c9)._m0[int(_2681)][_2683];
    int _2687 = int(_2679) + 1;
    uint _2689 = uint(int(uint(_2687) >> uint(2)));
    int _2691 = _2687 & 3;
    float _2693 = (*spvDescriptorSet0.vp_c9)._m0[int(_2689)][_2691];
    int _2695 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2697 = _2695 != 0;
    int _2699 = _2671 ? 0 : 1;
    bool _2701 = !_2697;
    int _2703 = _2701 ? 0 : 1;
    bool _2705 = uint(_2661) >= uint(_1653);
    int _2707 = _2603 + 8;
    uint _2709 = uint(int(uint(_2707) >> uint(2)));
    uint _2711 = uint(int(uint(int(_2709)) >> uint(2)));
    int _2713 = int(_2709) & 3;
    float _2715 = (*spvDescriptorSet0.vp_c9)._m0[int(_2711)][_2713];
    int _2717 = int(_2709) + 1;
    uint _2719 = uint(int(uint(_2717) >> uint(2)));
    int _2721 = _2717 & 3;
    float _2723 = (*spvDescriptorSet0.vp_c9)._m0[int(_2719)][_2721];
    bool _2725 = _2643 != 3;
    bool _2727 = !_2667;
    int _2729 = _2727 ? 0 : (-1);
    bool _2731 = !_2645;
    int _2733 = _2731 ? 0 : 1;
    bool _2735 = uint(_2643) >= 2u;
    bool _2737 = _2643 != 3;
    int _2739 = ~_2699;
    int _2741 = _2739 + 1;
    int _2743 = _2741 + 1;
    int _2745 = _2743;
    if (!_2657)
    {
        int _2747 = ~_2699;
        int _2749 = _2747 + 1;
        _2745 = _2749;
    }
    int _2751 = _2745;
    int _2753 = _2735 ? 0 : 1;
    bool _2755 = !_2737;
    int _2757 = _2755 ? 0 : (-1);
    int _2759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2761 = _2759 != 0;
    int _2763 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2765 = _2763 != 0;
    int _2767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2769 = _2767 != 0;
    bool _2771 = !_2705;
    int _2773 = _2771 ? 0 : (-1);
    int _2775 = abs(_2521);
    bool _2777 = _291 > 0.5;
    int _2779 = ~_2647;
    int _2781 = _2779 + _2773;
    int _2783 = _2781 + 1;
    int _2785 = ~_2753;
    int _2787 = _2785 + 1;
    int _2789 = _2787 + 1;
    int _2791 = _1653 * _2783;
    int _2793 = _2791 + _1971;
    int _2795 = _2789;
    if (_2725)
    {
        int _2797 = ~_2753;
        int _2799 = _2797 + 1;
        _2795 = _2799;
    }
    int _2801 = _2795;
    int _2803 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2805 = _2803 != 0;
    int _2807 = abs(_2751);
    int _2809 = abs(_2641);
    int _2811 = ~_2775;
    int _2813 = _2811 + 1;
    int _2815 = _2813 + 1;
    int _2817 = abs(_2733);
    int _2819 = _2815 * as_type<int>(_2599);
    int _2821 = ~_2807;
    int _2823 = _2821 + 1;
    int _2825 = _2823 + 1;
    int _2827 = ~_2809;
    int _2829 = _2827 + 1;
    int _2831 = _2829 + 1;
    int _2833 = _2825 * as_type<int>(_2637);
    int _2835 = abs(_2801);
    int _2837 = abs(_2617);
    int _2839 = ~_2817;
    int _2841 = _2839 + 1;
    int _2843 = _2841 + 1;
    int _2845 = _2831 * as_type<int>(_2591);
    int _2847 = _2845 + _2819;
    int _2849 = ~_2837;
    int _2851 = _2849 + 1;
    int _2853 = _2851 + 1;
    float _2855 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2857 = int(_2855);
    bool _2859 = !_1927;
    int _2861 = _2859 ? _2793 : (-1);
    int _2863 = _2843 * as_type<int>(_2629);
    int _2865 = _2863 + _2833;
    bool _2867 = _293 > 0.5;
    int _2869 = _2853 * as_type<int>(_2685);
    int _2871 = _2869 + _2847;
    int _2873 = abs(_2729);
    int _2875 = abs(_2757);
    float _2877 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2879 = int(_2877);
    int _2881 = ~_2835;
    int _2883 = _2881 + 1;
    int _2885 = _2883 + 1;
    int _2887 = _2885 * as_type<int>(_2715);
    int _2889 = _2887 + _2865;
    int _2891 = ~_2875;
    int _2893 = _2891 + 1;
    int _2895 = _2893 + 1;
    float _2897 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2899 = _2895 * as_type<int>(_2723);
    int _2901 = _2899 + _2889;
    float _2903 = float(uint(_2857));
    float _2905 = abs(_941);
    float _2907 = log2(_2905);
    float _2909 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2911 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2913 = ~_2873;
    int _2915 = _2913 + 1;
    int _2917 = _2915 + 1;
    float _2919 = _2897 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2921 = abs(_2655);
    float _2923 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2925 = 1.0 / _2903;
    float _2927 = _2909 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2929 = _2911 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2931 = ~_2921;
    int _2933 = _2931 + 1;
    int _2935 = _2933 + 1;
    int _2937 = _2917 * as_type<int>(_2693);
    int _2939 = _2937 + _2871;
    float _2941 = -_187;
    int _2943 = _2777 ? as_type<int>(_2941) : as_type<int>(_187);
    bool _2945 = _295 > 0.5;
    out.m_78.x = _2919;
    out.m_78.y = _2927;
    out.m_78.z = _2929;
    out.m_78.w = _2923;
    float _2947 = _2907 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2949 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2951 = abs(_2857);
    float _2953 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2955 = float(uint(_2879));
    float _2957 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2959 = _2949 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2961 = _2953 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2963 = as_type<int>(_2925) + (-2);
    int _2965 = _2939 * _2935;
    float _2967 = 1.0 / _2955;
    int _2969 = abs(_2703);
    int _2971 = _2675 * _2921;
    int _2973 = _2971 + _2965;
    float _2975 = float(uint(_2951));
    float _2977 = _2957 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2979 = ~_2969;
    int _2981 = _2979 + 1;
    int _2983 = _2981 + 1;
    float _2985 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2987 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2989 = abs(_2879);
    float _2991 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2993 = float(uint(_2973));
    float _2995 = exp2(_2947);
    out.m_80.x = _2959;
    out.m_80.y = _2961;
    out.m_80.z = _2977;
    int _2997 = _2901 * _2983;
    float _2999 = float(uint(_2989));
    float _3001 = -_989;
    float _3003 = fma(_3001, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2985);
    float _3005 = -_989;
    float _3007 = fma(_3005, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2987);
    int _3009 = _2861 * _2969;
    int _3011 = _3009 + _2997;
    float _3013 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3015 = 1.0 / _2975;
    float _3017 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _3019 = !_2761;
    float _3021 = _3019 ? _191 : as_type<float>(_2665);
    int _3023 = abs(_3011);
    float _3025 = -_989;
    float _3027 = fma(_3025, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2991);
    float _3029 = as_type<float>(_2963) * _2993;
    float _3031 = 1.0 / _2999;
    int _3033 = as_type<int>(_2967) + (-2);
    float _3035 = float(uint(_3011));
    float _3037 = fma(_2995, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3039 = precise::clamp(_3037, 0.0, 1.0);
    int _3041 = abs(_2973);
    int _3043 = ~_2857;
    int _3045 = _3043 + 1;
    float _3047 = trunc(_3029);
    float _3049 = precise::max(_3047, 0.0);
    uint _3051 = uint(_3049);
    float _3053 = as_type<float>(_3033) * _3035;
    int _3055 = as_type<int>(_3015) + (-2);
    float _3057 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3007);
    float _3059 = float(uint(_3041));
    float _3061 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3013);
    float _3063 = float(uint(_3023));
    int _3065 = as_type<int>(_3031) + (-2);
    float _3067 = as_type<float>(_3055) * _3059;
    float _3069 = trunc(_3053);
    float _3071 = precise::max(_3069, 0.0);
    uint _3073 = uint(_3071);
    float _3075 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3003);
    int _3077 = ~_2879;
    int _3079 = _3077 + 1;
    float _3081 = as_type<float>(_3065) * _3063;
    float _3083 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3085 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3027);
    int _3087 = _3045 * int(_3051);
    int _3089 = _3087 + _2973;
    float _3091 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3017);
    float _3093 = trunc(_3067);
    float _3095 = precise::max(_3093, 0.0);
    uint _3097 = uint(_3095);
    float _3099 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _3101 = _941 <= 8000.0;
    bool _3103 = isnan(_941);
    bool _3105 = _3101 || _3103;
    bool _3107 = isnan(8000.0);
    bool _3109 = _3105 || _3107;
    float _3111 = float(_3109);
    float _3113 = float(uint(_3089));
    float _3115 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3083);
    int _3117 = ~_2951;
    int _3119 = _3117 + 1;
    float _3121 = trunc(_3081);
    float _3123 = precise::max(_3121, 0.0);
    uint _3125 = uint(_3123);
    float _3127 = as_type<float>(_2963) * _3113;
    float _3129 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3131 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3133 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3099);
    int _3135 = ~_2989;
    int _3137 = _3135 + 1;
    int _3139 = _3079 * int(_3073);
    int _3141 = _3139 + _3011;
    float _3143 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3129);
    int _3145 = _3119 * int(_3097);
    int _3147 = _3145 + _3041;
    float _3149 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3131);
    bool _3151 = !_2805;
    float _3153 = _3151 ? _187 : as_type<float>(_2943);
    float _3155 = trunc(_3127);
    float _3157 = precise::max(_3155, 0.0);
    uint _3159 = uint(_3157);
    float _3161 = float(uint(_3141));
    float _3163 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3133);
    float _3165 = float(uint(_3147));
    int _3167 = _3137 * int(_3125);
    int _3169 = _3167 + _3023;
    float _3171 = -_191;
    int _3173 = _2867 ? as_type<int>(_3171) : as_type<int>(_191);
    float _3175 = as_type<float>(_3033) * _3161;
    float _3177 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3061);
    float _3179 = as_type<float>(_3055) * _3165;
    float _3181 = -_187;
    int _3183 = _2945 ? as_type<int>(_3181) : as_type<int>(_187);
    float _3185 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3091);
    float _3187 = float(uint(_3169));
    float _3189 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3115);
    bool _3191 = !_2769;
    float _3193 = _3191 ? _187 : as_type<float>(_3183);
    float _3195 = trunc(_3175);
    float _3197 = precise::max(_3195, 0.0);
    uint _3199 = uint(_3197);
    float _3201 = as_type<float>(_3065) * _3187;
    bool _3203 = !_2765;
    float _3205 = _3203 ? _191 : as_type<float>(_3173);
    float _3207 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3209 = _3039 * _3039;
    float _3211 = fma(_3039, -2.0, 3.0);
    float _3213 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3143);
    float _3215 = trunc(_3179);
    float _3217 = precise::max(_3215, 0.0);
    uint _3219 = uint(_3217);
    float _3221 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3223 = _3207 * _3075;
    float _3225 = _3209 * _3211;
    float _3227 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3149);
    int _3229 = ~_2879;
    int _3231 = _3229 + 1;
    float _3233 = fma(_3221, _3177, _3223);
    int _3235 = ~_2857;
    int _3237 = _3235 + 1;
    float _3239 = trunc(_3201);
    float _3241 = precise::max(_3239, 0.0);
    uint _3243 = uint(_3241);
    int _3245 = int(_3073) + int(_3199);
    out.m_82.x = _3177;
    out.m_82.y = _3185;
    out.m_82.z = _3189;
    int _3247 = int(_3051) + int(_3159);
    int _3249 = _3231 * _3245;
    int _3251 = _3249 + _3011;
    int _3253 = ~_2951;
    int _3255 = _3253 + 1;
    int _3257 = ~_2989;
    int _3259 = _3257 + 1;
    int _3261 = _3237 * _3247;
    int _3263 = _3261 + _2973;
    int _3265 = int(_3097) + int(_3219);
    int _3267 = int(_3125) + int(_3243);
    bool _3269 = uint(_3251) >= uint(_2879);
    bool _3271 = uint(_3263) >= uint(_2857);
    int _3273 = _3255 * _3265;
    int _3275 = _3273 + _3041;
    bool _3277 = _2879 == 0;
    int _3279 = _3259 * _3267;
    int _3281 = _3279 + _3023;
    bool _3283 = !_3269;
    int _3285 = _3283 ? 0 : (-1);
    float _3287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3289 = uint(_3275) >= uint(_2951);
    int _3291 = _2973 ^ _2857;
    bool _3293 = !_3271;
    int _3295 = _3293 ? 0 : (-1);
    bool _3297 = uint(_3281) >= uint(_2989);
    bool _3299 = !_3289;
    int _3301 = _3299 ? 0 : (-1);
    uint _3303 = uint(int(uint(_3291) >> uint(31)));
    int _3305 = ~_3247;
    int _3307 = _3305 + _3295;
    int _3309 = _3307 + 1;
    int _3311 = ~_3301;
    int _3313 = _3265 + _3311;
    int _3315 = _3313 + 1;
    float _3317 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3319 = ~int(_3303);
    int _3321 = _3319 + 1;
    float _3323 = _3287 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3325 = _2857 == 0;
    bool _3327 = _2857 == 0;
    int _3329 = _2857 * _3309;
    int _3331 = _3329 + _2973;
    int _3333 = _3315 ^ _3321;
    int _3335 = ~_3245;
    int _3337 = _3335 + _3285;
    int _3339 = _3337 + 1;
    int _3341 = _3011 ^ _2879;
    int _3343 = ~_3321;
    int _3345 = _3343 + _3333;
    int _3347 = _3345 + 1;
    int _3349 = _2879 * _3339;
    int _3351 = _3349 + _3011;
    bool _3353 = !_3297;
    int _3355 = _3353 ? 0 : (-1);
    float _3357 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _3359 = uint(int(uint(_3341) >> uint(31)));
    float _3361 = _2505 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3363 = _2879 == 0;
    float _3365 = fma(_3207, _3207, 1.0);
    int _3367 = ~_3355;
    int _3369 = _3267 + _3367;
    int _3371 = _3369 + 1;
    int _3373 = ~int(_3359);
    int _3375 = _3373 + 1;
    bool _3377 = !_3325;
    int _3379 = _3377 ? _3331 : (-1);
    float _3381 = rsqrt(_3365);
    bool _3383 = !_3277;
    int _3385 = _3383 ? _3351 : (-1);
    int _3387 = _3371 ^ _3375;
    float _3389 = float(_3379);
    float _3391 = float(_3385);
    int _3393 = ~_3375;
    int _3395 = _3393 + _3387;
    int _3397 = _3395 + 1;
    float _3399 = fma(_3323, _3389, _791);
    bool _3401 = !_3327;
    int _3403 = _3401 ? _3347 : (-1);
    float _3405 = fma(_3361, _3391, _737);
    float _3407 = _3153 + 0.5;
    bool _3409 = !_3363;
    int _3411 = _3409 ? _3397 : (-1);
    float _3413 = _3317 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3415 = float(_3403);
    float _3417 = fma(_3323, _3407, _3399);
    float _3419 = float(_3411);
    float _3421 = _3357 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3423 = _3193 + 0.5;
    float _3425 = -_697;
    float _3427 = fma(_3413, _3415, _3425);
    float _3429 = _3021 + (-0.5);
    float _3431 = -_813;
    float _3433 = fma(_3421, _3419, _3431);
    float _3435 = fma(_3361, _3423, _3405);
    float _3437 = _3205 + (-0.5);
    float _3439 = _3207 * _3381;
    float _3441 = -_3421;
    float _3443 = fma(_3441, _3429, _3433);
    float _3445 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2497);
    float _3447 = -_3225;
    float _3449 = _3447 + 1.0;
    float _3451 = -_3413;
    float _3453 = fma(_3451, _3437, _3427);
    float _3455 = -_3163;
    float _3457 = _3439 * _3455;
    float _3459 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3445);
    float _3461 = fma(_3449, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3225);
    float _3463 = -_2525;
    float _3465 = fma(_3153, _3463, _3417);
    float _3467 = -_2531;
    float _3469 = fma(_3193, _3467, _3435);
    float _3471 = fma(_3205, _2541, _3453);
    float _3473 = _3111 * _3461;
    float _3475 = _3111;
    if (!_1502)
    {
        _3475 = 1.0;
    }
    float _3477 = _3475;
    float _3479 = fma(_3021, _2547, _3443);
    float _3481 = _3477;
    if (_1502)
    {
        bool _3483 = _1614 >= _1574;
        bool _3485 = isnan(_1614);
        bool _3487 = _3483 || _3485;
        bool _3489 = isnan(_1574);
        bool _3491 = _3487 || _3489;
        float _3493 = float(_3491);
        _3481 = _3493;
    }
    float _3495 = _3481;
    float _3497 = _3473 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3499 = fma(_3381, _3057, _3457);
    float _3501 = _3459 + _1522;
    float _3503 = _3207 * _3057;
    float _3505 = _2513 * _3497;
    float _3507 = precise::clamp(_3505, 0.0, 1.0);
    float _3509 = _2581 * _1616;
    float _3511 = _3207 * _3085;
    float _3513 = _3495 * _2223;
    float _3515 = -_3507;
    float _3517 = fma(_3515, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_84.x = _3465;
    out.m_84.y = _3471;
    out.m_84.z = _3469;
    out.m_84.w = _3479;
    float _3519 = _3501 * 0.5;
    float _3521 = -_3213;
    float _3523 = _3439 * _3521;
    float _3525 = fma(_3221, _3185, _3503);
    float _3527 = _2473 * _3509;
    float _3529 = -_3227;
    float _3531 = _3439 * _3529;
    float _3533 = fma(_3221, _3189, _3511);
    float _3535 = -_3513;
    float _3537 = fma(_3535, _3517, 1.0);
    float _3539 = precise::clamp(_3537, 0.0, 1.0);
    float _3541 = fma(_3381, _3075, _3523);
    float _3543 = _3163 + _3525;
    out.m_86.z = _3519;
    out.m_86.w = _1522;
    float _3545 = fma(_3381, _3085, _3531);
    float _3547 = _3213 + _3233;
    float _3549 = _1627 * _3509;
    float _3551 = -_2581;
    float _3553 = _3551 + 1.0;
    float _3555 = _3227 + _3533;
    float _3557 = fma(_2469, _3549, _1621);
    float _3559 = fma(_2471, _3549, _1623);
    float _3561 = _1627 * _3553;
    float _3563 = _3539 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3565 = fma(_1627, _3527, _1625);
    out.m_88.x = _3541;
    out.m_88.y = _3499;
    out.m_88.z = _3545;
    bool _3567 = _2247 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3569 = isnan(_2247);
    bool _3571 = _3567 || _3569;
    bool _3573 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3575 = _3571 || _3573;
    out.gl_Position.x = _1542;
    out.gl_Position.y = _1558;
    out.gl_Position.z = _3459;
    out.gl_Position.w = _1522;
    out.m_90.x = _3563;
    out.m_92.x = _3557;
    out.m_92.y = _3559;
    out.m_92.z = _3565;
    out.m_92.w = _3561;
    float _3577 = _3519;
    float _3579 = _3553;
    float _3581 = _3513;
    float _3583 = _3539;
    float _3585 = _3507;
    if (!_3575)
    {
        _3577 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3587 = _3577;
    out.m_94.x = _3547;
    out.m_94.y = _3543;
    out.m_94.z = _3555;
    float _3589 = _3587;
    float _3591 = _3587;
    if (!_3575)
    {
        _1550 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3593 = _1550;
    float _3595 = _3593;
    float _3597 = _3593;
    if (!_3575)
    {
        _3579 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3599 = _3579;
    float _3601 = _3599;
    float _3603 = _3599;
    if (!_3575)
    {
        _3581 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3605 = _3581;
    float _3607 = _3605;
    float _3609 = _3605;
    if (!_3575)
    {
        _3583 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3611 = _3583;
    float _3613 = _3611;
    float _3615 = _3611;
    if (!_3575)
    {
        _3585 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3617 = _3585;
    bool _3619 = !_3575;
    float _3621 = _3617;
    float _3623 = _3617;
    if (!_3619)
    {
        bool _3625 = _2247 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3627 = isnan(_2247);
        bool _3629 = _3625 || _3627;
        bool _3631 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3633 = _3629 || _3631;
        if (!_3633)
        {
            float _3635 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3637 = _2247 + _3635;
            float _3639 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3641 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3639;
            float _3643 = 1.0 / _3641;
            float _3645 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3647 = _3645 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3649 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3651 = _3649 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3653 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3655 = _3653 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3657 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3659 = _3657 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3661 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3663 = _3661 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3665 = _3637 * _3643;
            float _3667 = precise::clamp(_3665, 0.0, 1.0);
            float _3669 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3671 = _3669 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3673 = fma(_3667, _3647, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3675 = fma(_3667, _3671, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3677 = fma(_3667, _3651, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3679 = fma(_3667, _3655, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3681 = fma(_3667, _3659, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3683 = fma(_3667, _3663, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3597 = _3675;
            _3615 = _3681;
            _3591 = _3673;
            _3609 = _3679;
            _3603 = _3677;
            _3623 = _3683;
            _3685 = true;
        }
        else
        {
            bool _3687 = _2247 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3689 = isnan(_2247);
            bool _3691 = _3687 || _3689;
            bool _3693 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3695 = _3691 || _3693;
            if (!_3695)
            {
                _3589 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3697 = _3589;
            _3591 = _3697;
            if (!_3695)
            {
                _3595 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3699 = _3595;
            _3597 = _3699;
            if (!_3695)
            {
                _3601 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3701 = _3601;
            _3603 = _3701;
            if (!_3695)
            {
                _3607 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3703 = _3607;
            _3609 = _3703;
            if (!_3695)
            {
                _3613 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3705 = _3613;
            _3615 = _3705;
            if (!_3695)
            {
                _3621 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3707 = _3621;
            bool _3709 = !_3695;
            _3623 = _3707;
            if (!_3709)
            {
                bool _3711 = _2247 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3713 = isnan(_2247);
                bool _3715 = _3711 || _3713;
                bool _3717 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3719 = _3715 || _3717;
                if (!_3719)
                {
                    float _3721 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3723 = _2247 + _3721;
                    float _3725 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3727 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3725;
                    float _3729 = 1.0 / _3727;
                    float _3731 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3733 = _3731 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3735 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3737 = _3735 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3739 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3741 = _3739 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3743 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3745 = _3743 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3747 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3749 = _3747 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3751 = _3723 * _3729;
                    float _3753 = precise::clamp(_3751, 0.0, 1.0);
                    float _3755 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3757 = _3755 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3759 = fma(_3753, _3733, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3761 = fma(_3753, _3757, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3763 = fma(_3753, _3737, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3765 = fma(_3753, _3741, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3767 = fma(_3753, _3745, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3769 = fma(_3753, _3749, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3597 = _3761;
                    _3615 = _3767;
                    _3591 = _3759;
                    _3609 = _3765;
                    _3603 = _3763;
                    _3623 = _3769;
                    _3685 = true;
                }
                else
                {
                    _3597 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3615 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3591 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3609 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3603 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3623 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3685 = false;
    float _3771 = _3597;
    float _3773 = _3615;
    float _3775 = _3591;
    float _3777 = _3609;
    float _3779 = _3603;
    float _3781 = _3623;
    float _3783 = fma(_3543, -0.5, 0.5);
    float _3785 = precise::clamp(_3783, 0.0, 1.0);
    float _3787 = -_3771;
    float _3789 = _3787 + _3773;
    float _3791 = -_3775;
    float _3793 = _3791 + _3777;
    float _3795 = -_3779;
    float _3797 = _3795 + _3781;
    bool _3799 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3801 = fma(_3785, _3789, _3771);
    float _3803 = fma(_3785, _3793, _3775);
    float _3805 = fma(_3785, _3797, _3779);
    float _3807 = _3801 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _3809 = fma(_3803, 0.298911988735198974609375, _3807);
    float _3811 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3813 = fma(_3805, 0.114477999508380889892578125, _3809);
    out.m_90.w = _3811;
    float _3815 = -_3813;
    float _3817 = _3803 + _3815;
    float _3819 = -_3813;
    float _3821 = _3801 + _3819;
    float _3823 = -_3813;
    float _3825 = _3805 + _3823;
    out.m_96.x = 0.0;
    float _3827 = fma(_3817, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3813);
    float _3829 = fma(_3821, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3813);
    float _3831 = fma(_3825, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3813);
    out.m_98.x = _3827;
    out.m_98.y = _3829;
    out.m_98.z = _3831;
    if (!_3799)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3833 = -_1408;
    float _3835 = _3833 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3837 = -_1410;
    float _3839 = _3837 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3841 = -_1412;
    float _3843 = _3841 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3845 = _3835 * _3835;
    float _3847 = fma(_3839, _3839, _3845);
    float _3849 = fma(_3843, _3843, _3847);
    float _3851 = sqrt(_3849);
    float _3853 = rsqrt(_3849);
    float _3855 = -_3851;
    float _3857 = _3855 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3859 = _3857 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3861 = precise::clamp(_3859, 0.0, 1.0);
    float _3863 = _3839 * _3853;
    float _3865 = _3835 * _3853;
    float _3867 = abs(_3861);
    float _3869 = log2(_3867);
    float _3871 = _3843 * _3853;
    float _3873 = _3863 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3875 = _3543 * _3865;
    float _3877 = -_3865;
    float _3879 = -_3873;
    float _3881 = fma(_3877, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3879);
    float _3883 = fma(_3547, _3863, _3875);
    float _3885 = -_3871;
    float _3887 = fma(_3885, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3881);
    float _3889 = fma(_3555, _3871, _3883);
    float _3891 = precise::clamp(_3889, 0.0, 1.0);
    float _3893 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3895 = _3887 + _3893;
    float _3897 = _3869 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3899 = _3895 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3901 = precise::clamp(_3899, 0.0, 1.0);
    float _3903 = exp2(_3897);
    float _3905 = _3903 * _3901;
    float _3907 = _3891 * _3905;
    float _3909 = _3907 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3911 = _3907 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3913 = _3907 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_96.x = _3909;
    out.m_96.y = _3911;
    out.m_96.z = _3913;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3685 = false;
    bool _213 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_56.w;
    float _114 = trunc(_112);
    int _117 = int(_114);
    bool _121 = _117 >= 1;
    float _123 = 0.0;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    float _127 = _125;
    if (!_121)
    {
        out.m_59.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _125 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3970 = as_type<float>(_133);
        out.gl_Position.z = _3970;
    }
    if (!_121)
    {
        return out;
    }
    float _137 = in.m_61.w;
    bool _139 = _137 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_137);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = -_137;
    float _151 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _153 = _151;
    if (_147)
    {
        float _155 = float(_117);
        _127 = _155;
    }
    float _157 = _127;
    bool _159 = _151 >= _157;
    bool _161 = !_147;
    bool _163 = _159 || _161;
    float _165 = _157;
    if (_163)
    {
        _165 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _167 = _165;
    if (_163)
    {
        out.m_59.x = 0.0;
    }
    if (_163)
    {
        float _169 = _167 * 5.0;
        _135 = as_type<int>(_169);
    }
    int _171 = _135;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4040 = as_type<float>(_171);
        out.gl_Position.z = _4040;
    }
    if (_163)
    {
        return out;
    }
    float _173 = as_type<float>(int(gl_VertexIndex));
    bool _175 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _177 = as_type<int>(_173) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_173) & 2;
    bool _183 = _181 != 0;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_175;
    float _211;
    if (!_193)
    {
        float _195 = in.m_66.x;
        float _197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _199 = _195 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _201 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[12].x, _151);
        float _203 = _201 * _197;
        float _205 = floor(_203);
        float _207 = -_205;
        float _209 = _203 + _207;
        _211 = _209;
        _213 = true;
    }
    else
    {
        float _215 = float(_117);
        float _217 = 1.0 / _215;
        float _219 = _151 * _217;
        _211 = _219;
    }
    _213 = false;
    float _221 = _211;
    float _223 = in.m_56.x;
    float _225 = in.m_56.y;
    float _227 = in.m_56.z;
    float _229 = in.m_68.x;
    float _231 = in.m_68.y;
    float _233 = in.m_68.z;
    float _235 = in.m_68.w;
    float _237 = in.m_70.x;
    float _239 = in.m_70.y;
    float _241 = in.m_70.z;
    float _243 = in.m_70.w;
    float _245 = _225 * _231;
    float _247 = fma(_223, _229, _245);
    float _249 = _225 * _239;
    float _251 = fma(_227, _233, _247);
    float _253 = fma(_223, _237, _249);
    float _255 = _251 + _235;
    float _257 = fma(_227, _241, _253);
    float _259 = fma(_255, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _261 = _257 + _243;
    float _263 = floor(_259);
    float _265 = fma(_261, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _267 = floor(_265);
    float _269 = -_263;
    float _271 = _259 + _269;
    float _273 = -_267;
    float _275 = _265 + _273;
    float2 _4195 = float2(_271, _275);
    float _277 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4195, float2(0.0), isnan(_4195)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4195, float2(0.0), isnan(_4195)), level(0.0)).x;
    float _279 = in.m_72.x;
    float _281 = in.m_72.y;
    float _283 = in.m_72.z;
    float _285 = in.m_72.w;
    float _287 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _289 = log2(_287);
    float _291 = in.m_66.x;
    float _293 = in.m_66.y;
    float _295 = in.m_66.z;
    float _297 = in.m_66.w;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _299;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _305 = _303 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _307 = 1.0 / _301;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _309;
    int _313 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _315 = _313 != 0;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _319 = 1.0 / _311;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _323 = _221 + _321;
    float _325 = _225 * _281;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _329 = 1.0 / _305;
    float _331 = _323 * _307;
    float _333 = fma(_223, _279, _325);
    float _335 = _291 * 2.0;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _339 = _221 + _337;
    float _341 = _291 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _343 = fma(_227, _283, _333);
    float _345 = _295 * 2.0;
    float _347 = _295 + _291;
    float _349 = _293 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _351 = floor(_335);
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _355 = _221 + _353;
    float _357 = fma(_349, -2.0, _317);
    float _359 = _293 * 2.0;
    float _361 = _347 + (-1.0);
    float _363 = _339 * _319;
    float _365 = -_327;
    float _367 = fma(_341, 2.0, _365);
    float _369 = floor(_345);
    float _371 = _295 + _293;
    float _373 = _355 * _329;
    float _375 = _291 + _293;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _379 = _371 + (-1.0);
    float _381 = float(_117);
    float _383 = _375 + (-1.0);
    float _385 = floor(_359);
    bool _387 = _351 > 0.0;
    bool _389 = _351 >= 0.0;
    bool _391 = isnan(_351);
    bool _393 = _389 || _391;
    bool _395 = isnan(0.0);
    bool _397 = _393 || _395;
    float _399 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _401 = 1.0 / _381;
    float _403 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _405;
    bool _409 = _369 > 0.0;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _411;
    bool _415 = _369 >= 0.0;
    bool _417 = isnan(_369);
    bool _419 = _415 || _417;
    bool _421 = isnan(0.0);
    bool _423 = _419 || _421;
    float _425 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _427 = as_type<int>(_379);
    float _429 = _381;
    if (_315)
    {
        _427 = 0;
    }
    int _431 = _427;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _435 = _433 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _437 = _385 > 0.0;
    float _439 = fma(_413, _331, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _441 = _431;
    if (!_315)
    {
        _441 = 1;
    }
    int _443 = _441;
    float _445 = fma(_435, _373, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _447 = _397 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _449 = fma(_407, _331, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _451 = _385 >= 0.0;
    bool _453 = isnan(_385);
    bool _455 = _451 || _453;
    bool _457 = isnan(0.0);
    bool _459 = _455 || _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _465 = _443 != 1;
    float _467 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _469 = int(_467);
    float _471 = _423 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _473 = fma(_463, _373, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _475 = _459 ? 0 : 1;
    float _477 = _343 + _285;
    int _479 = ~as_type<int>(_471);
    int _481 = _479 + 1;
    int _483 = _481 + 1;
    float _485 = _289 * _151;
    int _487 = ~_475;
    int _489 = _487 + 1;
    int _491 = _489 + 1;
    float _493 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _495 = int(_493);
    int _497 = _483;
    int _499 = _491;
    float _501 = _447;
    float _503 = _471;
    float _505 = _477;
    if (!_409)
    {
        int _507 = ~as_type<int>(_471);
        int _509 = _507 + 1;
        _497 = _509;
    }
    int _511 = _497;
    float _513 = _477 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    if (!_437)
    {
        int _515 = ~_475;
        int _517 = _515 + 1;
        _499 = _517;
    }
    int _519 = _499;
    float _521 = _477 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _525 = _523 != 0;
    int _527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _529 = _527 != 0;
    int _531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _533 = _531 != 0;
    float _535 = fma(_255, (*spvDescriptorSet0.vp_c8)._m0[10].x, _513);
    float _537 = exp2(_485);
    int _539 = ~as_type<int>(_447);
    int _541 = _539 + 1;
    int _543 = _541 + 1;
    float _545 = fma(_255, (*spvDescriptorSet0.vp_c8)._m0[11].x, _521);
    int _547 = _543;
    if (!_387)
    {
        int _549 = ~as_type<int>(_447);
        int _551 = _549 + 1;
        _547 = _551;
    }
    int _553 = _547;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_465)
    {
        _501 = _293;
    }
    float _557 = _501;
    float _559 = fma(_261, (*spvDescriptorSet0.vp_c8)._m0[10].z, _535);
    float _561 = _557;
    if (_465)
    {
        _561 = _291;
    }
    float _563 = _561;
    float _565 = fma(_261, (*spvDescriptorSet0.vp_c8)._m0[11].z, _545);
    bool _567 = !_529;
    int _569 = _567 ? 0 : 1;
    float _571 = _401 * _151;
    bool _573 = !_525;
    int _575 = _573 ? 0 : 1;
    float _577 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[83].z, _555);
    bool _579 = !_533;
    int _581 = _579 ? 0 : 1;
    float _583 = _565 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    if (!_465)
    {
        _503 = _295;
    }
    float _585 = _503;
    float _587 = -_537;
    float _589 = _587 + 1.0;
    int _591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _593 = _591 != 0;
    int _595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _597 = _595 != 0;
    int _599 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _601 = _599 != 0;
    float _603 = _585;
    if (_465)
    {
        _603 = _293;
    }
    float _605 = _603;
    bool _607 = !_593;
    int _609 = _607 ? 0 : 1;
    float _611 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[83].w, _377);
    float _613 = _605;
    if (!_465)
    {
        _613 = _293;
    }
    float _615 = _613;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _619 = _615;
    if (_465)
    {
        _619 = _291;
    }
    float _621 = _619;
    int _623 = abs(_609);
    if (!_465)
    {
        _429 = _295;
    }
    float _625 = _429;
    float _627 = _621 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _629 = float(_469);
    float _631 = -_617;
    float _633 = fma(_627, 2.0, _631);
    float _635 = _625;
    if (_465)
    {
        _635 = _293;
    }
    float _637 = _635;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _641 = float(_623);
    float _643 = 1.0 / _629;
    float _645 = float(_511);
    float _647 = _637 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _649 = _641 * _645;
    float _651 = float(_495);
    float _653 = fma(_647, -2.0, _639);
    float _655 = in.m_74.x;
    float _657 = in.m_74.y;
    float _659 = in.m_74.z;
    bool _661 = !_597;
    int _663 = _661 ? 0 : 1;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _665;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _669;
    float _673 = 1.0 / _651;
    int _675 = abs(_663);
    float _677 = fma(_667, _363, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _679 = fma(_671, _363, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _681 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _683 = isnan(0.0);
    bool _685 = _681 || _683;
    bool _687 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _689 = _685 || _687;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _693 = 1.0 + _691;
    float _695 = float(_553);
    float _697 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[76].y, _357);
    float _699 = float(_675);
    float _701 = 1.0 / _693;
    float _703 = _689 ? _589 : 0.0;
    float _705 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[82].z, _577);
    float _707 = _699 * _695;
    float _709 = _559 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _711 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _713 = isnan(_221);
    bool _715 = _711 || _713;
    bool _717 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _719 = _715 || _717;
    float _721 = float(_719);
    float _723 = _707 * (-2.0);
    bool _725 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _727 = isnan(1.0);
    bool _729 = _725 || _727;
    bool _731 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _733 = _729 || _731;
    float _735 = -_151;
    float _737 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[81].x, _633);
    float _739 = _709 + _583;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _745 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _747 = isnan(_221);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _753 = _749 || _751;
    float _755 = float(_753);
    float _757 = -_721;
    float _759 = _757 + 1.0;
    float _761 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[82].w, _611);
    float _763 = fma(_425, _723, _425);
    float _765 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[78].z, _741);
    float _767 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[78].w, _743);
    float _769 = fma(_723, _657, _657);
    bool _771 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _773 = isnan(_221);
    bool _775 = _771 || _773;
    bool _777 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _779 = _775 || _777;
    float _781 = float(_779);
    float _783 = _755 * _759;
    float _785 = -_755;
    float _787 = _785 + 1.0;
    float _789 = -_151;
    float _791 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[76].x, _367);
    bool _793 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _795 = isnan(_221);
    bool _797 = _793 || _795;
    bool _799 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _801 = _797 || _799;
    float _803 = float(_801);
    float _805 = _643 * _151;
    float _807 = _673 * _151;
    float _809 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[77].z, _765);
    float _811 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[77].w, _767);
    float _813 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[81].y, _653);
    bool _815 = !_601;
    int _817 = _815 ? 0 : 1;
    if (_733)
    {
        float _819 = _703 * _701;
        _153 = _819;
    }
    float _821 = _153;
    float _823 = _781 * _787;
    float _825 = -_781;
    float _827 = _825 + 1.0;
    float _829 = _293 + (-0.5);
    int _831 = abs(_817);
    float _833 = 1.0 / _583;
    float _835 = _803 * _827;
    float _837 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[196].y, _769);
    float _839 = -_803;
    float _841 = _839 + 1.0;
    float _843 = _439 * _835;
    float _845 = float(_519);
    float _847 = _449 * _835;
    float _849 = float(_831);
    float _851 = _649 * (-2.0);
    float _853 = fma(_763, _821, _837);
    float _855 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[143].x, _843);
    float _857 = _849 * _845;
    float _859 = fma(_851, _655, _655);
    float _861 = fma(_399, _851, _399);
    float _863 = in.m_76.x;
    float _865 = in.m_76.y;
    float _867 = _291 + (-0.5);
    float _869 = _739 * _833;
    float _871 = _869 * 0.5;
    float _873 = _857 * (-2.0);
    float _875 = fma(_473, _823, _855);
    float _877 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[196].x, _859);
    float _879 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _881 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[30].w, _879);
    float _883 = fma(_873, _659, _659);
    float _885 = _295 + (-0.5);
    float _887 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[143].y, _847);
    float _889 = fma(_403, _873, _403);
    float _891 = fma(_677, _783, _875);
    float _893 = fma(_885, (*spvDescriptorSet0.vp_c9)._m0[196].z, _883);
    float _895 = 1.0 / _881;
    float _897 = fma(_861, _821, _877);
    float _899 = fma(_445, _823, _887);
    float _901 = fma(_889, _821, _893);
    float _903 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[146].x, _891);
    float _905 = _853 * 0.15915493667125701904296875;
    float _907 = _897 * 0.15915493667125701904296875;
    float _909 = fma(_679, _783, _899);
    float _911 = _901 * 0.15915493667125701904296875;
    float _913 = _905 * 6.283185482025146484375;
    float _915 = sin(_913);
    float _917 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _919 = _903 * _863;
    float _921 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[146].y, _909);
    float _923 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _925 = _477 + _917;
    float _927 = _919 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _929 = _921 * _865;
    float _931 = _905 * 6.283185482025146484375;
    float _933 = cos(_931);
    float _935 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _191);
    float _937 = _927 * _923;
    float _939 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _941 = _895 * _939;
    float _943 = _929 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _945 = _925 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _947 = _925 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _949 = _907 * 6.283185482025146484375;
    float _951 = sin(_949);
    bool _953 = _941 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _955 = _943 * _935;
    bool _957 = _941 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _959 = fma(_255, (*spvDescriptorSet0.vp_c15)._m0[126].x, _945);
    float _961 = fma(_255, (*spvDescriptorSet0.vp_c15)._m0[127].x, _947);
    float _963 = _907 * 6.283185482025146484375;
    float _965 = cos(_963);
    float _967 = fma(_261, (*spvDescriptorSet0.vp_c15)._m0[126].z, _959);
    float _969 = fma(_261, (*spvDescriptorSet0.vp_c15)._m0[127].z, _961);
    float _971 = _967 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    int _973 = 2;
    if (!_953)
    {
        _973 = 1;
    }
    int _975 = _973;
    float _977 = _969 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _979 = _911 * 6.283185482025146484375;
    float _981 = cos(_979);
    float _983 = _951 * _933;
    float _985 = _951 * _915;
    float _987 = _911 * 6.283185482025146484375;
    float _989 = sin(_987);
    float _991 = _965 * _915;
    float _993 = _965 * _933;
    float _995 = _933 * _981;
    float _997 = trunc(_971);
    int _999 = int(_997);
    float _1001 = _965 * _981;
    float _1003 = _951 * _981;
    float _1005 = _915 * _981;
    float _1007 = _1001 * _955;
    float _1009 = -_991;
    float _1011 = fma(_989, _983, _1009);
    float _1013 = -_983;
    float _1015 = fma(_989, _991, _1013);
    bool _1017 = !_953;
    int _1019 = _1017 ? 0 : 1;
    float _1021 = fma(_989, _993, _985);
    float _1023 = fma(_989, _985, _993);
    float _1025 = -_955;
    float _1027 = _989 * _1025;
    int _1029 = _975;
    if (!_957)
    {
        _1029 = _1019;
    }
    int _1031 = _1029;
    float _1033 = trunc(_977);
    int _1035 = int(_1033);
    float _1037 = fma(_1021, _937, _1007);
    float _1039 = fma(_995, _937, _1027);
    int _1041 = _1031 << 6;
    float _1043 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1045 = _1003 * _955;
    int _1047 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1049 = _999 + _1047;
    int _1051 = _1049 + 1;
    int _1053 = _1041 + 96;
    uint _1056 = uint(int(uint(_1053) >> uint(2)));
    uint _1058 = uint(int(uint(int(_1056)) >> uint(2)));
    int _1060 = int(_1056) & 3;
    float _1062 = (*spvDescriptorSet0.vp_c15)._m0[int(_1058)][_1060];
    int _1064 = int(_1056) + 1;
    uint _1066 = uint(int(uint(_1064) >> uint(2)));
    int _1068 = _1064 & 3;
    float _1070 = (*spvDescriptorSet0.vp_c15)._m0[int(_1066)][_1068];
    float _1072 = fma(_1015, _1043, _1037);
    float _1074 = fma(_1011, _937, _1045);
    float _1076 = fma(_1005, _1043, _1039);
    bool _1078 = _1051 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1080 = _1072 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1082 = fma(_1023, _1043, _1074);
    float _1084 = _1072 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1086 = _1041 + 104;
    uint _1088 = uint(int(uint(_1086) >> uint(2)));
    uint _1090 = uint(int(uint(int(_1088)) >> uint(2)));
    int _1092 = int(_1088) & 3;
    float _1094 = (*spvDescriptorSet0.vp_c15)._m0[int(_1090)][_1092];
    int _1096 = int(_1088) + 1;
    uint _1098 = uint(int(uint(_1096) >> uint(2)));
    int _1100 = _1096 & 3;
    float _1102 = (*spvDescriptorSet0.vp_c15)._m0[int(_1098)][_1100];
    int _1104 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1106 = _1035 + _1104;
    int _1108 = _1106 + 1;
    float _1110 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1080);
    int _1112 = _1051 | _1108;
    float _1114 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1110);
    int _1116 = _1041 + 48;
    uint _1118 = uint(int(uint(_1116) >> uint(2)));
    uint _1120 = uint(int(uint(int(_1118)) >> uint(2)));
    int _1122 = int(_1118) & 3;
    float _1124 = (*spvDescriptorSet0.vp_c15)._m0[int(_1120)][_1122];
    int _1126 = int(_1118) + 1;
    uint _1128 = uint(int(uint(_1126) >> uint(2)));
    int _1130 = _1126 & 3;
    float _1132 = (*spvDescriptorSet0.vp_c15)._m0[int(_1128)][_1130];
    bool _1134 = _1112 < 0;
    bool _1136 = _1134 || _1078;
    float _1138 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1084);
    float _1140 = _1114 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _1142 = _1108 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1144 = _1142 || _1136;
    float _1146 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1138);
    float _1148 = _261 + _1140;
    int _1150 = _1041 + 64;
    uint _1152 = uint(int(uint(_1150) >> uint(2)));
    uint _1154 = uint(int(uint(int(_1152)) >> uint(2)));
    int _1156 = int(_1152) & 3;
    float _1158 = (*spvDescriptorSet0.vp_c15)._m0[int(_1154)][_1156];
    int _1160 = int(_1152) + 1;
    uint _1162 = uint(int(uint(_1160) >> uint(2)));
    int _1164 = _1160 & 3;
    float _1166 = (*spvDescriptorSet0.vp_c15)._m0[int(_1162)][_1164];
    float _1168 = _1146 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1170 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1172 = _1148 + _1170;
    float _1174 = _255 + _1168;
    float _1176 = _1172 * _1172;
    int _1178 = _1041 + 56;
    uint _1180 = uint(int(uint(_1178) >> uint(2)));
    uint _1182 = uint(int(uint(int(_1180)) >> uint(2)));
    int _1184 = int(_1180) & 3;
    float _1186 = (*spvDescriptorSet0.vp_c15)._m0[int(_1182)][_1184];
    int _1188 = int(_1180) + 1;
    uint _1190 = uint(int(uint(_1188) >> uint(2)));
    int _1192 = _1188 & 3;
    float _1194 = (*spvDescriptorSet0.vp_c15)._m0[int(_1190)][_1192];
    int _1196 = _1051;
    int _1198 = as_type<int>(_1176);
    float _1200 = as_type<float>(_1031);
    if (!_1144)
    {
        int _1202 = _1108 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1204 = _1202 + _1051;
        _1196 = _1204;
    }
    int _1206 = _1196;
    float _1208 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1210 = _1174 + _1208;
    int _1212 = 0;
    float _1214 = as_type<float>(_1206);
    if (!_1144)
    {
        int _1216 = _1206 << 2;
        _1212 = _1216;
    }
    int _1218 = _1212;
    int _1220 = _1041 + 72;
    uint _1222 = uint(int(uint(_1220) >> uint(2)));
    uint _1224 = uint(int(uint(int(_1222)) >> uint(2)));
    int _1226 = int(_1222) & 3;
    float _1228 = (*spvDescriptorSet0.vp_c15)._m0[int(_1224)][_1226];
    int _1230 = int(_1222) + 1;
    uint _1232 = uint(int(uint(_1230) >> uint(2)));
    int _1234 = _1230 & 3;
    float _1236 = (*spvDescriptorSet0.vp_c15)._m0[int(_1232)][_1234];
    float _1238 = fma(_1210, _1210, _1176);
    int _1240 = _1218;
    if (!_1144)
    {
        uint _1242 = uint(int(uint(_1206) >> uint(2)));
        _1198 = int(_1242);
    }
    int _1244 = _1198;
    int _1246 = _1244;
    if (!_1144)
    {
        int _1248 = 12 & _1218;
        _1240 = _1248;
    }
    int _1250 = _1240;
    float _1252 = sqrt(_1238);
    int _1254 = _1041 + 80;
    uint _1256 = uint(int(uint(_1254) >> uint(2)));
    uint _1258 = uint(int(uint(int(_1256)) >> uint(2)));
    int _1260 = int(_1256) & 3;
    float _1262 = (*spvDescriptorSet0.vp_c15)._m0[int(_1258)][_1260];
    int _1264 = int(_1256) + 1;
    uint _1266 = uint(int(uint(_1264) >> uint(2)));
    int _1268 = _1264 & 3;
    float _1270 = (*spvDescriptorSet0.vp_c15)._m0[int(_1266)][_1268];
    float _1272 = _925 * _1070;
    float _1274 = _1070;
    if (!_1144)
    {
        int _1276 = _1244 << 4;
        int _1278 = _1276 + _1250;
        _1246 = _1278;
    }
    int _1280 = _1246;
    float _1282 = _1072 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1284 = fma(_255, _1062, _1272);
    float _1286 = _1072;
    if (!_1144)
    {
        float _1288 = floor(_971);
        _1286 = _1288;
    }
    float _1290 = _1286;
    float _1292 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1282);
    float _1294 = fma(_261, _1094, _1284);
    float _1296 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1292);
    float _1298 = _1294 + _1102;
    bool _1300 = _1252 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1302 = _1296 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1304 = _925 * _1132;
    float _1306 = 1.0 / _1298;
    int _1308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1310 = _1308 != 0;
    int _1312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1314 = _1312 != 0;
    int _1316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1318 = _1316 != 0;
    int _1320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1322 = _1320 != 0;
    float _1324 = fma(_255, _1124, _1304);
    bool _1326 = !_1314;
    int _1328 = _1326 ? 0 : 1;
    float _1330 = _925 * _1166;
    bool _1332 = !_1310;
    int _1334 = _1332 ? 0 : 1;
    bool _1336 = !_1318;
    int _1338 = _1336 ? 0 : 1;
    float _1340 = fma(_255, _1158, _1330);
    bool _1342 = !_1322;
    int _1344 = _1342 ? 0 : 1;
    float _1346 = fma(_261, _1186, _1324);
    float _1348 = _1346 + _1194;
    float _1350 = fma(_261, _1228, _1340);
    float _1352 = _477 + _1302;
    float _1354 = _1302;
    if (!_1300)
    {
        _505 = _1174;
    }
    float _1356 = _505;
    float _1358 = _1350 + _1236;
    float _1360 = _1356;
    if (!_1300)
    {
        _1354 = _1148;
    }
    float _1362 = _1354;
    float _1364 = _1362;
    if (!_1300)
    {
        _1274 = _1352;
    }
    float _1366 = _1274;
    bool _1368 = !_1300;
    float _1370 = _1366;
    if (!_1368)
    {
        float _1372 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1374 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1376 = _1252 + _1374;
        float _1378 = rsqrt(_1238);
        float _1380 = _1376 * _1372;
        float _1382 = _1352 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1384 = _1380 * 0.15915493667125701904296875;
        float _1386 = _1384 * 6.283185482025146484375;
        float _1388 = cos(_1386);
        float _1390 = _1384 * 6.283185482025146484375;
        float _1392 = sin(_1390);
        float _1394 = _1388 + (-1.0);
        float _1396 = fma(_1392, _1382, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1398 = _1394 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1400 = _1378 * _1396;
        float _1402 = fma(_1352, _1388, _1398);
        float _1404 = fma(_1210, _1400, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1406 = fma(_1172, _1400, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1370 = _1402;
        _1360 = _1404;
        _1364 = _1406;
    }
    float _1408 = _1370;
    float _1410 = _1360;
    float _1412 = _1364;
    int _1414 = _1041 + 88;
    uint _1416 = uint(int(uint(_1414) >> uint(2)));
    uint _1418 = uint(int(uint(int(_1416)) >> uint(2)));
    int _1420 = int(_1416) & 3;
    float _1422 = (*spvDescriptorSet0.vp_c15)._m0[int(_1418)][_1420];
    int _1424 = int(_1416) + 1;
    uint _1426 = uint(int(uint(_1424) >> uint(2)));
    int _1428 = _1424 & 3;
    float _1430 = (*spvDescriptorSet0.vp_c15)._m0[int(_1426)][_1428];
    float _1432 = _1358 * _1306;
    float _1434 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1436 = _1348 * _1306;
    float _1438 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1440 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1442 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1434);
    float _1444 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1446 = _1148;
    float _1448 = _1432;
    if (!_1144)
    {
        int _1450 = _1280 + 400;
        uint _1452 = uint(int(uint(_1450) >> uint(2)));
        uint _1454 = uint(int(uint(int(_1452)) >> uint(2)));
        int _1456 = int(_1452) & 3;
        float _1458 = (*spvDescriptorSet0.vp_c15)._m0[int(_1454)][_1456];
        _1446 = _1458;
    }
    float _1460 = _1446;
    float _1462 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1438);
    float _1464 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1440);
    bool _1466 = _1436 >= 0.0;
    float _1468 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1442);
    float _1470 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1462);
    float _1472 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1464);
    bool _1474 = _1436 <= 1.0;
    bool _1476 = _1474 && _1466;
    float _1478 = _1468 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1480 = _1470 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1482 = _1472 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1484 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1444);
    float _1486 = _1478 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1488 = _1432 >= 0.0;
    bool _1490 = _1488 && _1476;
    float _1492 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1494 = _1480 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1496 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1484);
    float _1498 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1486);
    bool _1500 = _1432 <= 1.0;
    bool _1502 = _1500 && _1490;
    float _1504 = -_1494;
    float _1506 = fma(_1504, _1492, 1.0);
    float _1508 = _1496 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1510 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1498);
    float _1512 = _925 * _1270;
    float _1514 = _1094;
    if (!_1144)
    {
        float _1516 = floor(_977);
        _1514 = _1516;
    }
    float _1518 = _1514;
    float _1520 = _1478 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1522 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1510);
    float _1524 = fma(_255, _1262, _1512);
    float _1526 = _1478 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1528 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1520);
    float _1530 = log2(_1506);
    if (_1502)
    {
        float _1532 = float(_1031);
        _1200 = _1532;
    }
    float _1534 = _1200;
    float _1536 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1526);
    float _1538 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1528);
    float _1540 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1536);
    float _1542 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1538);
    float _1544 = 1.0 / _1522;
    float _1546 = fma(_261, _1422, _1524);
    float _1548 = 0.0;
    float _1550 = _1542;
    if (!_1144)
    {
        float _1552 = -_1518;
        float _1554 = _977 + _1552;
        _1548 = _1554;
    }
    float _1556 = _1548;
    float _1558 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1540);
    float _1560 = _1546 + _1430;
    float _1562 = _1534;
    if (_1502)
    {
        float _1564 = rint(_1534);
        float _1566 = precise::max(_1564, 0.0);
        uint _1568 = uint(_1566);
        uint _1570 = clamp(_1568, 0u, 65535u);
        _1562 = as_type<float>(_1570);
    }
    float _1572 = _1562;
    float _1574 = _1560 * _1306;
    float _1576 = _1530 * 0.693147182464599609375;
    float _1578 = _1576 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1580 = _1560;
    float _1582 = _1460;
    if (!_1144)
    {
        float _1584 = rint(_1460);
        float _1586 = precise::max(_1584, 0.0);
        uint _1588 = uint(_1586);
        uint _1590 = clamp(_1588, 0u, 65535u);
        _1580 = as_type<float>(_1590);
    }
    float _1592 = _1580;
    float _1594 = _1542 * _1544;
    float _1596 = _1558 * _1544;
    float _1598 = fma(_1594, 0.5, 0.5);
    float _1600 = fma(_1596, -0.5, 0.5);
    float _1602 = _1594;
    if (!_1144)
    {
        float _1604 = -_1290;
        float _1606 = _971 + _1604;
        _1602 = _1606;
    }
    float _1608 = _1602;
    float _1610 = _1576;
    if (_1502)
    {
        float3 _6350 = float3(_1436, _1432, float(as_type<int>(_1572)));
        float3 _6354 = select(_6350, float3(0.0), isnan(_6350));
        float _1612 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6354.xy, uint(rint(_6354.z)), _1574, level(0.0));
        _1610 = _1612;
    }
    float _1614 = _1610;
    float3 _6364 = float3(_1598, _1600, _1578);
    float _1616 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6364, float3(0.0), isnan(_6364)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6364, float3(0.0), isnan(_6364)), level(0.0)).x;
    float3 _6373 = float3(_1598, _1600, _1578);
    float4 _1619 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6373, float3(0.0), isnan(_6373)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6373, float3(0.0), isnan(_6373)), level(0.0)).xyzw;
    float _1621 = _1619.x;
    float _1623 = _1619.y;
    float _1625 = _1619.z;
    float _1627 = _1619.w;
    float _1629 = _1556;
    if (!_1144)
    {
        float3 _6396 = float3(_1608, _1556, float(as_type<int>(_1592)));
        float3 _6398 = select(_6396, float3(0.0), isnan(_6396));
        float _1631 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6398.xy, uint(rint(_6398.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6398.xy, uint(rint(_6398.z)), level(0.0)).x;
        _1629 = _1631;
    }
    float _1633 = _1629;
    float _1635 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1637 = int(_1635);
    int _1639 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1641 = _1639 != 0;
    int _1643 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1645 = _1643 != 0;
    int _1647 = abs(_569);
    int _1649 = abs(_575);
    float _1651 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1653 = int(_1651);
    int _1655 = abs(_581);
    int _1657 = abs(_1334);
    int _1659 = abs(_1338);
    if (_1641)
    {
        float _1661 = in.m_66.x;
        _1582 = _1661;
    }
    float _1663 = _1582;
    int _1665 = abs(_1344);
    float _1667 = trunc(_805);
    int _1669 = int(_1667);
    float _1671 = float(uint(_1637));
    float _1673 = _1663;
    if (!_1641)
    {
        float _1675 = in.m_66.y;
        _1673 = _1675;
    }
    float _1677 = _1673;
    float _1679 = 1.0 / _1671;
    float _1681 = float(uint(_1653));
    int _1683 = ~_1637;
    int _1685 = _1683 + 1;
    float _1687 = 1.0 / _1681;
    float _1689 = trunc(_807);
    int _1691 = int(_1689);
    int _1693 = as_type<int>(_1679) + (-2);
    float _1695 = float(uint(_1669));
    float _1697 = _1695;
    if (_1641)
    {
        _1448 = 1.0;
    }
    float _1699 = _1448;
    float _1701 = _1699;
    if (!_1641)
    {
        _1701 = 1.2345600128173828125;
    }
    float _1703 = _1701;
    float _1705 = as_type<float>(_1693) * _1695;
    int _1707 = as_type<int>(_1687) + (-2);
    int _1709 = ~_1653;
    int _1711 = _1709 + 1;
    if (_1641)
    {
        _1697 = 1.0;
    }
    float _1713 = _1697;
    float _1715 = trunc(_1705);
    float _1717 = precise::max(_1715, 0.0);
    uint _1719 = uint(_1717);
    float _1721 = _1713;
    if (!_1641)
    {
        _1721 = 7.345489978790283203125;
    }
    float _1723 = _1721;
    float _1725 = float(uint(_1691));
    float _1727 = float(_1669);
    float _1729 = _1723 * _291;
    float _1731 = as_type<float>(_1707) * _1725;
    float _1733 = floor(_1729);
    int _1735 = _1685 * int(_1719);
    int _1737 = _1735 + _1669;
    float _1739 = trunc(_1731);
    float _1741 = precise::max(_1739, 0.0);
    uint _1743 = uint(_1741);
    float _1745 = _1703 * _1677;
    float _1747 = floor(_1745);
    int _1749 = _1711 * int(_1743);
    int _1751 = _1749 + _1691;
    float _1753 = float(uint(_1737));
    float _1755 = float(uint(_1751));
    float _1757 = as_type<float>(_1693) * _1753;
    float _1759 = float(_1637);
    float _1761 = as_type<float>(_1707) * _1755;
    float _1763 = -_1733;
    float _1765 = _1729 + _1763;
    float _1767 = trunc(_1757);
    float _1769 = precise::max(_1767, 0.0);
    uint _1771 = uint(_1769);
    bool _1773 = _1727 >= _1759;
    bool _1775 = isnan(_1727);
    bool _1777 = _1773 || _1775;
    bool _1779 = isnan(_1759);
    bool _1781 = _1777 || _1779;
    float _1783 = float(_1781);
    float _1785 = -_1747;
    float _1787 = _1745 + _1785;
    int _1789 = ~_1637;
    int _1791 = _1789 + 1;
    float _1793 = float(_1653);
    float _1795 = trunc(_1761);
    float _1797 = precise::max(_1795, 0.0);
    uint _1799 = uint(_1797);
    float _1801 = _1787 * _1793;
    int _1803 = int(_1719) + int(_1771);
    float _1805 = _1765 * _1759;
    float _1807 = float(_1691);
    float _1809 = _1759 * _571;
    float _1811 = _1793 * _571;
    int _1813 = _1791 * _1803;
    int _1815 = _1813 + _1669;
    float _1817 = trunc(_1783);
    int _1819 = int(_1817);
    int _1821 = int(_1743) + int(_1799);
    int _1823 = ~_1653;
    int _1825 = _1823 + 1;
    bool _1827 = _1807 >= _1793;
    bool _1829 = isnan(_1807);
    bool _1831 = _1827 || _1829;
    bool _1833 = isnan(_1793);
    bool _1835 = _1831 || _1833;
    float _1837 = float(_1835);
    bool _1839 = uint(_1815) >= uint(_1637);
    int _1841 = _1825 * _1821;
    int _1843 = _1841 + _1691;
    float _1845 = trunc(_1805);
    int _1847 = int(_1845);
    bool _1849 = !_1839;
    int _1851 = _1849 ? 0 : (-1);
    int _1853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1855 = _1853 != 0;
    int _1857 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1859 = _1857 != 0;
    int _1861 = ~_1803;
    int _1863 = _1861 + _1851;
    int _1865 = _1863 + 1;
    float _1867 = trunc(_1809);
    int _1869 = int(_1867);
    bool _1871 = !_1855;
    int _1873 = _1871 ? 0 : 1;
    bool _1875 = uint(_1843) >= uint(_1653);
    bool _1877 = !_1859;
    int _1879 = _1877 ? 0 : 1;
    int _1881 = abs(_1873);
    float _1883 = trunc(_1837);
    int _1885 = int(_1883);
    bool _1887 = !_1875;
    int _1889 = _1887 ? 0 : (-1);
    int _1891 = _1637 * _1865;
    int _1893 = _1891 + _1669;
    int _1895 = abs(_1879);
    int _1897 = ~_1821;
    int _1899 = _1897 + _1889;
    int _1901 = _1899 + 1;
    float _1903 = trunc(_1801);
    int _1905 = int(_1903);
    bool _1907 = _1637 == 0;
    int _1909 = _1847 * _1881;
    int _1911 = _1909 + _1669;
    int _1913 = ~_1819;
    int _1915 = _1913 + 1;
    int _1917 = _1915 + 1;
    int _1919 = _1653 * _1901;
    int _1921 = _1919 + _1691;
    bool _1923 = !_1907;
    int _1925 = _1923 ? _1893 : (-1);
    bool _1927 = _1653 == 0;
    float _1929 = trunc(_1811);
    int _1931 = int(_1929);
    int _1933 = _1637 + (-1);
    int _1935 = _1925 * _1917;
    int _1937 = ~_1885;
    int _1939 = _1937 + 1;
    int _1941 = _1939 + 1;
    bool _1943 = !_1927;
    int _1945 = _1943 ? _1921 : (-1);
    int _1947 = _1819 * _1933;
    int _1949 = _1947 + _1935;
    int _1951 = _1653 + (-1);
    int _1953 = _1945 * _1941;
    int _1955 = abs(_1328);
    int _1957 = _1885 * _1951;
    int _1959 = _1957 + _1953;
    int _1961 = _1949 * _1647;
    int _1963 = _1959 * _1955;
    bool _1965 = !_1645;
    int _1967 = _1965 ? 0 : 1;
    int _1969 = _1905 * _1895;
    int _1971 = _1969 + _1691;
    int _1973 = _1869 * _1649;
    int _1975 = _1973 + _1961;
    int _1977 = abs(_1967);
    int _1979 = _1911 * _1655;
    int _1981 = _1979 + _1975;
    int _1983 = _1931 * _1657;
    int _1985 = _1983 + _1963;
    int _1987 = ~_1637;
    int _1989 = _1987 + 1;
    int _1991 = _1847 * _1977;
    int _1993 = _1991 + _1981;
    int _1995 = _1971 * _1659;
    int _1997 = _1995 + _1985;
    int _1999 = ~_1637;
    int _2001 = _1999 + 1;
    float _2003 = float(uint(_1993));
    int _2005 = _1905 * _1665;
    int _2007 = _2005 + _1997;
    int _2009 = ~_1653;
    int _2011 = _2009 + 1;
    float _2013 = as_type<float>(_1693) * _2003;
    float _2015 = float(uint(_2007));
    float _2017 = float(uint(_1911));
    float _2019 = trunc(_2013);
    float _2021 = precise::max(_2019, 0.0);
    uint _2023 = uint(_2021);
    float _2025 = as_type<float>(_1707) * _2015;
    float _2027 = as_type<float>(_1693) * _2017;
    float _2029 = trunc(_2025);
    float _2031 = precise::max(_2029, 0.0);
    uint _2033 = uint(_2031);
    int _2035 = _2001 * int(_2023);
    int _2037 = _2035 + _1993;
    float _2039 = trunc(_2027);
    float _2041 = precise::max(_2039, 0.0);
    uint _2043 = uint(_2041);
    float _2045 = float(uint(_2037));
    int _2047 = _2011 * int(_2033);
    int _2049 = _2047 + _2007;
    float _2051 = as_type<float>(_1693) * _2045;
    float _2053 = float(uint(_2049));
    int _2055 = ~_1637;
    int _2057 = _2055 + 1;
    float _2059 = trunc(_2051);
    float _2061 = precise::max(_2059, 0.0);
    uint _2063 = uint(_2061);
    float _2065 = as_type<float>(_1707) * _2053;
    float _2067 = float(uint(_1971));
    int _2069 = _2057 * int(_2043);
    int _2071 = _2069 + _1911;
    float _2073 = trunc(_2065);
    float _2075 = precise::max(_2073, 0.0);
    uint _2077 = uint(_2075);
    float _2079 = as_type<float>(_1707) * _2067;
    float _2081 = float(uint(_2071));
    int _2083 = ~_1653;
    int _2085 = _2083 + 1;
    float _2087 = as_type<float>(_1693) * _2081;
    float _2089 = trunc(_2079);
    float _2091 = precise::max(_2089, 0.0);
    uint _2093 = uint(_2091);
    int _2095 = int(_2023) + int(_2063);
    int _2097 = ~_1653;
    int _2099 = _2097 + 1;
    float _2101 = trunc(_2087);
    float _2103 = precise::max(_2101, 0.0);
    uint _2105 = uint(_2103);
    int _2107 = int(_2033) + int(_2077);
    int _2109 = _1989 * _2095;
    int _2111 = _2109 + _1993;
    float _2113 = as_type<float>(_2085);
    if (_1144)
    {
        _2113 = 1.0;
    }
    float _2115 = _2113;
    int _2117 = _2085 * _2107;
    int _2119 = _2117 + _2007;
    bool _2121 = uint(_2111) >= uint(_1637);
    int _2123 = _2099 * int(_2093);
    int _2125 = _2123 + _1971;
    bool _2127 = !_2121;
    int _2129 = _2127 ? 0 : (-1);
    bool _2131 = uint(_2119) >= uint(_1653);
    float _2133 = float(uint(_2125));
    int _2135 = ~_2095;
    int _2137 = _2135 + _2129;
    int _2139 = _2137 + 1;
    bool _2141 = !_2131;
    int _2143 = _2141 ? 0 : (-1);
    float _2145 = as_type<float>(_1707) * _2133;
    int _2147 = int(_2043) + int(_2105);
    int _2149 = _1637 * _2139;
    int _2151 = _2149 + _1993;
    int _2153 = ~_2107;
    int _2155 = _2153 + _2143;
    int _2157 = _2155 + 1;
    float _2159 = _2115;
    if (!_1144)
    {
        int _2161 = _1206 << 4;
        int _2163 = _2161 + 2048;
        uint _2165 = uint(int(uint(_2163) >> uint(2)));
        uint _2167 = uint(int(uint(int(_2165)) >> uint(2)));
        int _2169 = int(_2165) & 3;
        float _2171 = (*spvDescriptorSet0.vp_c15)._m0[int(_2167)][_2169];
        int _2173 = int(_2165) + 1;
        uint _2175 = uint(int(uint(_2173) >> uint(2)));
        int _2177 = _2173 & 3;
        float _2179 = (*spvDescriptorSet0.vp_c15)._m0[int(_2175)][_2177];
        int _2181 = _2163 + 8;
        uint _2183 = uint(int(uint(_2181) >> uint(2)));
        uint _2185 = uint(int(uint(int(_2183)) >> uint(2)));
        int _2187 = int(_2183) & 3;
        float _2189 = (*spvDescriptorSet0.vp_c15)._m0[int(_2185)][_2187];
        int _2191 = int(_2183) + 1;
        uint _2193 = uint(int(uint(_2191) >> uint(2)));
        int _2195 = _2191 & 3;
        float _2197 = (*spvDescriptorSet0.vp_c15)._m0[int(_2193)][_2195];
        float _2199 = _925 * _2179;
        float _2201 = fma(_255, _2171, _2199);
        float _2203 = fma(_261, _2189, _2201);
        float _2205 = _2203 + _2197;
        float _2207 = precise::clamp(_2205, 0.0, 1.0);
        float _2209 = -_2207;
        float _2211 = _2209 + _1633;
        float _2213 = fma(_2211, 500.0, 1.5);
        float _2215 = exp2(_2213);
        float _2217 = 0.0 + _2215;
        float _2219 = precise::clamp(_2217, 0.0, 1.0);
        _1214 = as_type<float>(_2163);
        _2159 = _2219;
    }
    float _2221 = _1214;
    float _2223 = _2159;
    float _2225 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2227 = _1408 + _2225;
    float _2229 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2231 = _1410 + _2229;
    float _2233 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2235 = _1412 + _2233;
    float _2237 = _2227 * _2227;
    float _2239 = fma(_2231, _2231, _2237);
    float _2241 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2243 = fma(_2235, _2235, _2239);
    float _2245 = rsqrt(_2243);
    float _2247 = sqrt(_2243);
    float _2249 = _2245 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2251 = _2231 * _2249;
    float _2253 = _2235 * _2249;
    float _2255 = _2251 * _2251;
    float _2257 = _2253 * _2253;
    float _2259 = _2255 + _2257;
    float _2261 = sqrt(_2259);
    bool _2263 = _2261 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2265 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2267 = _2261 + _2265;
    float _2269 = as_type<float>(_2077);
    float _2271 = _2259;
    float _2273 = _2267;
    float _2275 = _2221;
    float _2277 = _2241;
    float _2279 = _2251;
    float _2281 = _2253;
    float _2283 = _2255;
    float _2285 = _2257;
    if (_2263)
    {
        float _2287 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2269 = _2287;
    }
    float _2289 = _2269;
    if (_2263)
    {
        float _2291 = rsqrt(_2259);
        _2271 = _2291;
    }
    float _2293 = _2271;
    if (_2263)
    {
        float _2295 = _2267 * _2289;
        _2273 = _2295;
    }
    float _2297 = _2273;
    float _2299 = precise::max(0.0, _2241);
    float _2301 = _2299;
    if (_2263)
    {
        float _2303 = _2297 * 0.15915493667125701904296875;
        _2275 = _2303;
    }
    float _2305 = _2275;
    float _2307 = -_2249;
    float _2309 = -_2299;
    float _2311 = fma(_2227, _2307, _2309);
    float _2313 = _261;
    float _2315 = _2311;
    if (_2263)
    {
        float _2317 = _2305 * 6.283185482025146484375;
        float _2319 = sin(_2317);
        _2313 = _2319;
    }
    float _2321 = _2313;
    if (_2263)
    {
        float _2323 = _2311 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2301 = _2323;
    }
    float _2325 = _2301;
    float _2327 = _2297;
    float _2329 = _2325;
    if (_2263)
    {
        float _2331 = _2305 * 6.283185482025146484375;
        float _2333 = cos(_2331);
        _2327 = _2333;
    }
    float _2335 = _2327;
    float _2337 = _2321;
    if (_2263)
    {
        float _2339 = fma(_2321, _2325, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2329 = _2339;
    }
    float _2341 = _2329;
    float _2343 = _2341;
    if (_2263)
    {
        float _2345 = _2293 * _2341;
        _2337 = _2345;
    }
    float _2347 = _2337;
    if (_2263)
    {
        float _2349 = _2335 + (-1.0);
        _2277 = _2349;
    }
    float _2351 = _2277;
    if (_2263)
    {
        float _2353 = _2251 * _2347;
        _2279 = _2353;
    }
    float _2355 = _2279;
    if (_2263)
    {
        float _2357 = _2253 * _2347;
        _2281 = _2357;
    }
    float _2359 = _2281;
    if (_2263)
    {
        float _2361 = _2351 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2343 = _2361;
    }
    float _2363 = _2343;
    if (_2263)
    {
        float _2365 = _2355 * _2355;
        _2283 = _2365;
    }
    float _2367 = _2283;
    if (_2263)
    {
        float _2369 = _2359 * _2359;
        _2285 = _2369;
    }
    float _2371 = _2285;
    int _2373 = ~_1637;
    int _2375 = _2373 + 1;
    if (_2263)
    {
        float _2377 = fma(_2311, _2335, _2363);
        _2315 = _2377;
    }
    float _2379 = _2315;
    float _2381 = fma(_2379, _2379, _2367);
    float _2383 = _2381 + _2371;
    float _2385 = rsqrt(_2383);
    float _2387 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2389 = fma(_2247, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2387);
    float _2391 = precise::clamp(_2389, 0.0, 1.0);
    float _2393 = -_2391;
    float _2395 = _2393 + 1.0;
    float _2397 = abs(_2395);
    float _2399 = log2(_2397);
    float _2401 = _2385 * _2355;
    float _2403 = _2385 * _2379;
    float _2405 = _2385 * _2359;
    float _2407 = _2401 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2409 = _2403 + 1.0;
    float _2411 = -_2407;
    float _2413 = fma(_2403, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2411);
    float _2415 = _2399 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2417 = -_2405;
    float _2419 = fma(_2417, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2413);
    float _2421 = fma(_2419, -0.5, 0.5);
    float _2423 = exp2(_2415);
    float _2425 = fma(_2419, 0.5, 0.5);
    float _2427 = fma(_2425, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2429 = sqrt(_2421);
    float _2431 = fma(_2425, _2427, -0.212114393711090087890625);
    float _2433 = fma(_2425, _2431, 1.570728778839111328125);
    float _2435 = -_2403;
    float _2437 = fma(_2423, _2409, _2435);
    bool _2439 = !_1907;
    int _2441 = _2439 ? _2151 : (-1);
    float _2443 = fma(_2437, 0.5, 0.5);
    int _2445 = _2441 & 3;
    bool _2447 = _2445 != 0;
    float _2449 = _2429 * 0.636619746685028076171875;
    int _2451 = _2441 & 3;
    bool _2453 = _2451 != 0;
    float _2455 = -_2433;
    float _2457 = fma(_2449, _2455, 1.0);
    int _2459 = _2375 * _2147;
    int _2461 = _2459 + _1911;
    bool _2463 = uint(_2451) > 1u;
    float2 _7563 = float2(_2457, _2443);
    float3 _2467 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7563, float2(0.0), isnan(_7563)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7563, float2(0.0), isnan(_7563)), level(0.0)).xyz;
    float _2469 = _2467.x;
    float _2471 = _2467.y;
    float _2473 = _2467.z;
    int _2475 = _1653 * _2157;
    int _2477 = _2475 + _2007;
    int _2479 = _2441 >> 31;
    float _2481 = trunc(_2145);
    float _2483 = precise::max(_2481, 0.0);
    uint _2485 = uint(_2483);
    bool _2487 = uint(_2461) >= uint(_1637);
    float _2489 = _1478 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2491 = _2447 ? 0 : 1;
    float _2493 = _2399 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2495 = _297 > 0.5;
    float _2497 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2489);
    int _2499 = ~_2491;
    int _2501 = _2499 + 1;
    int _2503 = _2501 + 1;
    float _2505 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2507 = !_1927;
    int _2509 = _2507 ? _2477 : (-1);
    float _2511 = -_277;
    float _2513 = _2511 + 1.0;
    int _2515 = _2503;
    if (!_2463)
    {
        int _2517 = ~_2491;
        int _2519 = _2517 + 1;
        _2515 = _2519;
    }
    int _2521 = _2515;
    float _2523 = -_809;
    float _2525 = _2523 + 1.0;
    int _2527 = _2479 & 3;
    float _2529 = -_705;
    float _2531 = _2529 + 1.0;
    int _2533 = _2509 >> 31;
    float _2535 = exp2(_2493);
    int _2537 = _2441 + _2527;
    float _2539 = -_811;
    float _2541 = _2539 + 1.0;
    int _2543 = _2533 & 3;
    float _2545 = -_761;
    float _2547 = _2545 + 1.0;
    bool _2549 = !_2487;
    int _2551 = _2549 ? 0 : (-1);
    bool _2553 = _2451 != 3;
    int _2555 = _2537 >> 2;
    int _2557 = _2509 + _2543;
    int _2559 = ~_2147;
    int _2561 = _2559 + _2551;
    int _2563 = _2561 + 1;
    bool _2565 = uint(_2451) >= 2u;
    float _2567 = -_2535;
    float _2569 = _2567 + 1.0;
    int _2571 = _2555 << 4;
    int _2573 = _2571 + 368;
    int _2575 = _1637 * _2563;
    int _2577 = _2575 + _1911;
    int _2579 = _2557 >> 2;
    float _2581 = _2569 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2583 = _2565 ? 0 : 1;
    uint _2585 = uint(int(uint(_2573) >> uint(2)));
    uint _2587 = uint(int(uint(int(_2585)) >> uint(2)));
    int _2589 = int(_2585) & 3;
    float _2591 = (*spvDescriptorSet0.vp_c9)._m0[int(_2587)][_2589];
    int _2593 = int(_2585) + 1;
    uint _2595 = uint(int(uint(_2593) >> uint(2)));
    int _2597 = _2593 & 3;
    float _2599 = (*spvDescriptorSet0.vp_c9)._m0[int(_2595)][_2597];
    int _2601 = _2579 << 4;
    int _2603 = _2601 + 512;
    int _2605 = ~_2583;
    int _2607 = _2605 + 1;
    int _2609 = _2607 + 1;
    int _2611 = _2609;
    if (_2553)
    {
        int _2613 = ~_2583;
        int _2615 = _2613 + 1;
        _2611 = _2615;
    }
    int _2617 = _2611;
    int _2619 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2621 = _2619 != 0;
    uint _2623 = uint(int(uint(_2603) >> uint(2)));
    uint _2625 = uint(int(uint(int(_2623)) >> uint(2)));
    int _2627 = int(_2623) & 3;
    float _2629 = (*spvDescriptorSet0.vp_c9)._m0[int(_2625)][_2627];
    int _2631 = int(_2623) + 1;
    uint _2633 = uint(int(uint(_2631) >> uint(2)));
    int _2635 = _2631 & 3;
    float _2637 = (*spvDescriptorSet0.vp_c9)._m0[int(_2633)][_2635];
    bool _2639 = !_2453;
    int _2641 = _2639 ? 0 : 1;
    int _2643 = _2509 & 3;
    bool _2645 = _2643 != 0;
    int _2647 = int(_2093) + int(_2485);
    int _2649 = ~_1653;
    int _2651 = _2649 + 1;
    bool _2653 = !_2621;
    int _2655 = _2653 ? 0 : 1;
    bool _2657 = uint(_2643) > 1u;
    int _2659 = _2651 * _2647;
    int _2661 = _2659 + _1971;
    float _2663 = -_191;
    int _2665 = _2495 ? as_type<int>(_2663) : as_type<int>(_191);
    bool _2667 = _2451 != 3;
    int _2669 = _2509 & 3;
    bool _2671 = _2669 != 0;
    bool _2673 = !_1907;
    int _2675 = _2673 ? _2577 : (-1);
    int _2677 = _2573 + 8;
    uint _2679 = uint(int(uint(_2677) >> uint(2)));
    uint _2681 = uint(int(uint(int(_2679)) >> uint(2)));
    int _2683 = int(_2679) & 3;
    float _2685 = (*spvDescriptorSet0.vp_c9)._m0[int(_2681)][_2683];
    int _2687 = int(_2679) + 1;
    uint _2689 = uint(int(uint(_2687) >> uint(2)));
    int _2691 = _2687 & 3;
    float _2693 = (*spvDescriptorSet0.vp_c9)._m0[int(_2689)][_2691];
    int _2695 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2697 = _2695 != 0;
    int _2699 = _2671 ? 0 : 1;
    bool _2701 = !_2697;
    int _2703 = _2701 ? 0 : 1;
    bool _2705 = uint(_2661) >= uint(_1653);
    int _2707 = _2603 + 8;
    uint _2709 = uint(int(uint(_2707) >> uint(2)));
    uint _2711 = uint(int(uint(int(_2709)) >> uint(2)));
    int _2713 = int(_2709) & 3;
    float _2715 = (*spvDescriptorSet0.vp_c9)._m0[int(_2711)][_2713];
    int _2717 = int(_2709) + 1;
    uint _2719 = uint(int(uint(_2717) >> uint(2)));
    int _2721 = _2717 & 3;
    float _2723 = (*spvDescriptorSet0.vp_c9)._m0[int(_2719)][_2721];
    bool _2725 = _2643 != 3;
    bool _2727 = !_2667;
    int _2729 = _2727 ? 0 : (-1);
    bool _2731 = !_2645;
    int _2733 = _2731 ? 0 : 1;
    bool _2735 = uint(_2643) >= 2u;
    bool _2737 = _2643 != 3;
    int _2739 = ~_2699;
    int _2741 = _2739 + 1;
    int _2743 = _2741 + 1;
    int _2745 = _2743;
    if (!_2657)
    {
        int _2747 = ~_2699;
        int _2749 = _2747 + 1;
        _2745 = _2749;
    }
    int _2751 = _2745;
    int _2753 = _2735 ? 0 : 1;
    bool _2755 = !_2737;
    int _2757 = _2755 ? 0 : (-1);
    int _2759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2761 = _2759 != 0;
    int _2763 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2765 = _2763 != 0;
    int _2767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2769 = _2767 != 0;
    bool _2771 = !_2705;
    int _2773 = _2771 ? 0 : (-1);
    int _2775 = abs(_2521);
    bool _2777 = _291 > 0.5;
    int _2779 = ~_2647;
    int _2781 = _2779 + _2773;
    int _2783 = _2781 + 1;
    int _2785 = ~_2753;
    int _2787 = _2785 + 1;
    int _2789 = _2787 + 1;
    int _2791 = _1653 * _2783;
    int _2793 = _2791 + _1971;
    int _2795 = _2789;
    if (_2725)
    {
        int _2797 = ~_2753;
        int _2799 = _2797 + 1;
        _2795 = _2799;
    }
    int _2801 = _2795;
    int _2803 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2805 = _2803 != 0;
    int _2807 = abs(_2751);
    int _2809 = abs(_2641);
    int _2811 = ~_2775;
    int _2813 = _2811 + 1;
    int _2815 = _2813 + 1;
    int _2817 = abs(_2733);
    int _2819 = _2815 * as_type<int>(_2599);
    int _2821 = ~_2807;
    int _2823 = _2821 + 1;
    int _2825 = _2823 + 1;
    int _2827 = ~_2809;
    int _2829 = _2827 + 1;
    int _2831 = _2829 + 1;
    int _2833 = _2825 * as_type<int>(_2637);
    int _2835 = abs(_2801);
    int _2837 = abs(_2617);
    int _2839 = ~_2817;
    int _2841 = _2839 + 1;
    int _2843 = _2841 + 1;
    int _2845 = _2831 * as_type<int>(_2591);
    int _2847 = _2845 + _2819;
    int _2849 = ~_2837;
    int _2851 = _2849 + 1;
    int _2853 = _2851 + 1;
    float _2855 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2857 = int(_2855);
    bool _2859 = !_1927;
    int _2861 = _2859 ? _2793 : (-1);
    int _2863 = _2843 * as_type<int>(_2629);
    int _2865 = _2863 + _2833;
    bool _2867 = _293 > 0.5;
    int _2869 = _2853 * as_type<int>(_2685);
    int _2871 = _2869 + _2847;
    int _2873 = abs(_2729);
    int _2875 = abs(_2757);
    float _2877 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2879 = int(_2877);
    int _2881 = ~_2835;
    int _2883 = _2881 + 1;
    int _2885 = _2883 + 1;
    int _2887 = _2885 * as_type<int>(_2715);
    int _2889 = _2887 + _2865;
    int _2891 = ~_2875;
    int _2893 = _2891 + 1;
    int _2895 = _2893 + 1;
    float _2897 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2899 = _2895 * as_type<int>(_2723);
    int _2901 = _2899 + _2889;
    float _2903 = float(uint(_2857));
    float _2905 = abs(_941);
    float _2907 = log2(_2905);
    float _2909 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2911 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2913 = ~_2873;
    int _2915 = _2913 + 1;
    int _2917 = _2915 + 1;
    float _2919 = _2897 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2921 = abs(_2655);
    float _2923 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2925 = 1.0 / _2903;
    float _2927 = _2909 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2929 = _2911 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2931 = ~_2921;
    int _2933 = _2931 + 1;
    int _2935 = _2933 + 1;
    int _2937 = _2917 * as_type<int>(_2693);
    int _2939 = _2937 + _2871;
    float _2941 = -_187;
    int _2943 = _2777 ? as_type<int>(_2941) : as_type<int>(_187);
    bool _2945 = _295 > 0.5;
    out.m_78.x = _2919;
    out.m_78.y = _2927;
    out.m_78.z = _2929;
    out.m_78.w = _2923;
    float _2947 = _2907 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2949 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2951 = abs(_2857);
    float _2953 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2955 = float(uint(_2879));
    float _2957 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2959 = _2949 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2961 = _2953 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2963 = as_type<int>(_2925) + (-2);
    int _2965 = _2939 * _2935;
    float _2967 = 1.0 / _2955;
    int _2969 = abs(_2703);
    int _2971 = _2675 * _2921;
    int _2973 = _2971 + _2965;
    float _2975 = float(uint(_2951));
    float _2977 = _2957 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2979 = ~_2969;
    int _2981 = _2979 + 1;
    int _2983 = _2981 + 1;
    float _2985 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2987 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2989 = abs(_2879);
    float _2991 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2993 = float(uint(_2973));
    float _2995 = exp2(_2947);
    out.m_80.x = _2959;
    out.m_80.y = _2961;
    out.m_80.z = _2977;
    int _2997 = _2901 * _2983;
    float _2999 = float(uint(_2989));
    float _3001 = -_989;
    float _3003 = fma(_3001, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2985);
    float _3005 = -_989;
    float _3007 = fma(_3005, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2987);
    int _3009 = _2861 * _2969;
    int _3011 = _3009 + _2997;
    float _3013 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3015 = 1.0 / _2975;
    float _3017 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _3019 = !_2761;
    float _3021 = _3019 ? _191 : as_type<float>(_2665);
    int _3023 = abs(_3011);
    float _3025 = -_989;
    float _3027 = fma(_3025, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2991);
    float _3029 = as_type<float>(_2963) * _2993;
    float _3031 = 1.0 / _2999;
    int _3033 = as_type<int>(_2967) + (-2);
    float _3035 = float(uint(_3011));
    float _3037 = fma(_2995, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3039 = precise::clamp(_3037, 0.0, 1.0);
    int _3041 = abs(_2973);
    int _3043 = ~_2857;
    int _3045 = _3043 + 1;
    float _3047 = trunc(_3029);
    float _3049 = precise::max(_3047, 0.0);
    uint _3051 = uint(_3049);
    float _3053 = as_type<float>(_3033) * _3035;
    int _3055 = as_type<int>(_3015) + (-2);
    float _3057 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3007);
    float _3059 = float(uint(_3041));
    float _3061 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3013);
    float _3063 = float(uint(_3023));
    int _3065 = as_type<int>(_3031) + (-2);
    float _3067 = as_type<float>(_3055) * _3059;
    float _3069 = trunc(_3053);
    float _3071 = precise::max(_3069, 0.0);
    uint _3073 = uint(_3071);
    float _3075 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3003);
    int _3077 = ~_2879;
    int _3079 = _3077 + 1;
    float _3081 = as_type<float>(_3065) * _3063;
    float _3083 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3085 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3027);
    int _3087 = _3045 * int(_3051);
    int _3089 = _3087 + _2973;
    float _3091 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3017);
    float _3093 = trunc(_3067);
    float _3095 = precise::max(_3093, 0.0);
    uint _3097 = uint(_3095);
    float _3099 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _3101 = _941 <= 8000.0;
    bool _3103 = isnan(_941);
    bool _3105 = _3101 || _3103;
    bool _3107 = isnan(8000.0);
    bool _3109 = _3105 || _3107;
    float _3111 = float(_3109);
    float _3113 = float(uint(_3089));
    float _3115 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3083);
    int _3117 = ~_2951;
    int _3119 = _3117 + 1;
    float _3121 = trunc(_3081);
    float _3123 = precise::max(_3121, 0.0);
    uint _3125 = uint(_3123);
    float _3127 = as_type<float>(_2963) * _3113;
    float _3129 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3131 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3133 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3099);
    int _3135 = ~_2989;
    int _3137 = _3135 + 1;
    int _3139 = _3079 * int(_3073);
    int _3141 = _3139 + _3011;
    float _3143 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3129);
    int _3145 = _3119 * int(_3097);
    int _3147 = _3145 + _3041;
    float _3149 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3131);
    bool _3151 = !_2805;
    float _3153 = _3151 ? _187 : as_type<float>(_2943);
    float _3155 = trunc(_3127);
    float _3157 = precise::max(_3155, 0.0);
    uint _3159 = uint(_3157);
    float _3161 = float(uint(_3141));
    float _3163 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3133);
    float _3165 = float(uint(_3147));
    int _3167 = _3137 * int(_3125);
    int _3169 = _3167 + _3023;
    float _3171 = -_191;
    int _3173 = _2867 ? as_type<int>(_3171) : as_type<int>(_191);
    float _3175 = as_type<float>(_3033) * _3161;
    float _3177 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3061);
    float _3179 = as_type<float>(_3055) * _3165;
    float _3181 = -_187;
    int _3183 = _2945 ? as_type<int>(_3181) : as_type<int>(_187);
    float _3185 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3091);
    float _3187 = float(uint(_3169));
    float _3189 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3115);
    bool _3191 = !_2769;
    float _3193 = _3191 ? _187 : as_type<float>(_3183);
    float _3195 = trunc(_3175);
    float _3197 = precise::max(_3195, 0.0);
    uint _3199 = uint(_3197);
    float _3201 = as_type<float>(_3065) * _3187;
    bool _3203 = !_2765;
    float _3205 = _3203 ? _191 : as_type<float>(_3173);
    float _3207 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3209 = _3039 * _3039;
    float _3211 = fma(_3039, -2.0, 3.0);
    float _3213 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3143);
    float _3215 = trunc(_3179);
    float _3217 = precise::max(_3215, 0.0);
    uint _3219 = uint(_3217);
    float _3221 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3223 = _3207 * _3075;
    float _3225 = _3209 * _3211;
    float _3227 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3149);
    int _3229 = ~_2879;
    int _3231 = _3229 + 1;
    float _3233 = fma(_3221, _3177, _3223);
    int _3235 = ~_2857;
    int _3237 = _3235 + 1;
    float _3239 = trunc(_3201);
    float _3241 = precise::max(_3239, 0.0);
    uint _3243 = uint(_3241);
    int _3245 = int(_3073) + int(_3199);
    out.m_82.x = _3177;
    out.m_82.y = _3185;
    out.m_82.z = _3189;
    int _3247 = int(_3051) + int(_3159);
    int _3249 = _3231 * _3245;
    int _3251 = _3249 + _3011;
    int _3253 = ~_2951;
    int _3255 = _3253 + 1;
    int _3257 = ~_2989;
    int _3259 = _3257 + 1;
    int _3261 = _3237 * _3247;
    int _3263 = _3261 + _2973;
    int _3265 = int(_3097) + int(_3219);
    int _3267 = int(_3125) + int(_3243);
    bool _3269 = uint(_3251) >= uint(_2879);
    bool _3271 = uint(_3263) >= uint(_2857);
    int _3273 = _3255 * _3265;
    int _3275 = _3273 + _3041;
    bool _3277 = _2879 == 0;
    int _3279 = _3259 * _3267;
    int _3281 = _3279 + _3023;
    bool _3283 = !_3269;
    int _3285 = _3283 ? 0 : (-1);
    float _3287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3289 = uint(_3275) >= uint(_2951);
    int _3291 = _2973 ^ _2857;
    bool _3293 = !_3271;
    int _3295 = _3293 ? 0 : (-1);
    bool _3297 = uint(_3281) >= uint(_2989);
    bool _3299 = !_3289;
    int _3301 = _3299 ? 0 : (-1);
    uint _3303 = uint(int(uint(_3291) >> uint(31)));
    int _3305 = ~_3247;
    int _3307 = _3305 + _3295;
    int _3309 = _3307 + 1;
    int _3311 = ~_3301;
    int _3313 = _3265 + _3311;
    int _3315 = _3313 + 1;
    float _3317 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3319 = ~int(_3303);
    int _3321 = _3319 + 1;
    float _3323 = _3287 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3325 = _2857 == 0;
    bool _3327 = _2857 == 0;
    int _3329 = _2857 * _3309;
    int _3331 = _3329 + _2973;
    int _3333 = _3315 ^ _3321;
    int _3335 = ~_3245;
    int _3337 = _3335 + _3285;
    int _3339 = _3337 + 1;
    int _3341 = _3011 ^ _2879;
    int _3343 = ~_3321;
    int _3345 = _3343 + _3333;
    int _3347 = _3345 + 1;
    int _3349 = _2879 * _3339;
    int _3351 = _3349 + _3011;
    bool _3353 = !_3297;
    int _3355 = _3353 ? 0 : (-1);
    float _3357 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _3359 = uint(int(uint(_3341) >> uint(31)));
    float _3361 = _2505 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3363 = _2879 == 0;
    float _3365 = fma(_3207, _3207, 1.0);
    int _3367 = ~_3355;
    int _3369 = _3267 + _3367;
    int _3371 = _3369 + 1;
    int _3373 = ~int(_3359);
    int _3375 = _3373 + 1;
    bool _3377 = !_3325;
    int _3379 = _3377 ? _3331 : (-1);
    float _3381 = rsqrt(_3365);
    bool _3383 = !_3277;
    int _3385 = _3383 ? _3351 : (-1);
    int _3387 = _3371 ^ _3375;
    float _3389 = float(_3379);
    float _3391 = float(_3385);
    int _3393 = ~_3375;
    int _3395 = _3393 + _3387;
    int _3397 = _3395 + 1;
    float _3399 = fma(_3323, _3389, _791);
    bool _3401 = !_3327;
    int _3403 = _3401 ? _3347 : (-1);
    float _3405 = fma(_3361, _3391, _737);
    float _3407 = _3153 + 0.5;
    bool _3409 = !_3363;
    int _3411 = _3409 ? _3397 : (-1);
    float _3413 = _3317 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3415 = float(_3403);
    float _3417 = fma(_3323, _3407, _3399);
    float _3419 = float(_3411);
    float _3421 = _3357 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3423 = _3193 + 0.5;
    float _3425 = -_697;
    float _3427 = fma(_3413, _3415, _3425);
    float _3429 = _3021 + (-0.5);
    float _3431 = -_813;
    float _3433 = fma(_3421, _3419, _3431);
    float _3435 = fma(_3361, _3423, _3405);
    float _3437 = _3205 + (-0.5);
    float _3439 = _3207 * _3381;
    float _3441 = -_3421;
    float _3443 = fma(_3441, _3429, _3433);
    float _3445 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2497);
    float _3447 = -_3225;
    float _3449 = _3447 + 1.0;
    float _3451 = -_3413;
    float _3453 = fma(_3451, _3437, _3427);
    float _3455 = -_3163;
    float _3457 = _3439 * _3455;
    float _3459 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3445);
    float _3461 = fma(_3449, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3225);
    float _3463 = -_2525;
    float _3465 = fma(_3153, _3463, _3417);
    float _3467 = -_2531;
    float _3469 = fma(_3193, _3467, _3435);
    float _3471 = fma(_3205, _2541, _3453);
    float _3473 = _3111 * _3461;
    float _3475 = _3111;
    if (!_1502)
    {
        _3475 = 1.0;
    }
    float _3477 = _3475;
    float _3479 = fma(_3021, _2547, _3443);
    float _3481 = _3477;
    if (_1502)
    {
        bool _3483 = _1614 >= _1574;
        bool _3485 = isnan(_1614);
        bool _3487 = _3483 || _3485;
        bool _3489 = isnan(_1574);
        bool _3491 = _3487 || _3489;
        float _3493 = float(_3491);
        _3481 = _3493;
    }
    float _3495 = _3481;
    float _3497 = _3473 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3499 = fma(_3381, _3057, _3457);
    float _3501 = _3459 + _1522;
    float _3503 = _3207 * _3057;
    float _3505 = _2513 * _3497;
    float _3507 = precise::clamp(_3505, 0.0, 1.0);
    float _3509 = _2581 * _1616;
    float _3511 = _3207 * _3085;
    float _3513 = _3495 * _2223;
    float _3515 = -_3507;
    float _3517 = fma(_3515, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_84.x = _3465;
    out.m_84.y = _3471;
    out.m_84.z = _3469;
    out.m_84.w = _3479;
    float _3519 = _3501 * 0.5;
    float _3521 = -_3213;
    float _3523 = _3439 * _3521;
    float _3525 = fma(_3221, _3185, _3503);
    float _3527 = _2473 * _3509;
    float _3529 = -_3227;
    float _3531 = _3439 * _3529;
    float _3533 = fma(_3221, _3189, _3511);
    float _3535 = -_3513;
    float _3537 = fma(_3535, _3517, 1.0);
    float _3539 = precise::clamp(_3537, 0.0, 1.0);
    float _3541 = fma(_3381, _3075, _3523);
    float _3543 = _3163 + _3525;
    out.m_86.z = _3519;
    out.m_86.w = _1522;
    float _3545 = fma(_3381, _3085, _3531);
    float _3547 = _3213 + _3233;
    float _3549 = _1627 * _3509;
    float _3551 = -_2581;
    float _3553 = _3551 + 1.0;
    float _3555 = _3227 + _3533;
    float _3557 = fma(_2469, _3549, _1621);
    float _3559 = fma(_2471, _3549, _1623);
    float _3561 = _1627 * _3553;
    float _3563 = _3539 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3565 = fma(_1627, _3527, _1625);
    out.m_88.x = _3541;
    out.m_88.y = _3499;
    out.m_88.z = _3545;
    bool _3567 = _2247 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3569 = isnan(_2247);
    bool _3571 = _3567 || _3569;
    bool _3573 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3575 = _3571 || _3573;
    out.gl_Position.x = _1542;
    out.gl_Position.y = _1558;
    out.gl_Position.z = _3459;
    out.gl_Position.w = _1522;
    out.m_90.x = _3563;
    out.m_92.x = _3557;
    out.m_92.y = _3559;
    out.m_92.z = _3565;
    out.m_92.w = _3561;
    float _3577 = _3519;
    float _3579 = _3553;
    float _3581 = _3513;
    float _3583 = _3539;
    float _3585 = _3507;
    if (!_3575)
    {
        _3577 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3587 = _3577;
    out.m_94.x = _3547;
    out.m_94.y = _3543;
    out.m_94.z = _3555;
    float _3589 = _3587;
    float _3591 = _3587;
    if (!_3575)
    {
        _1550 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3593 = _1550;
    float _3595 = _3593;
    float _3597 = _3593;
    if (!_3575)
    {
        _3579 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3599 = _3579;
    float _3601 = _3599;
    float _3603 = _3599;
    if (!_3575)
    {
        _3581 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3605 = _3581;
    float _3607 = _3605;
    float _3609 = _3605;
    if (!_3575)
    {
        _3583 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3611 = _3583;
    float _3613 = _3611;
    float _3615 = _3611;
    if (!_3575)
    {
        _3585 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3617 = _3585;
    bool _3619 = !_3575;
    float _3621 = _3617;
    float _3623 = _3617;
    if (!_3619)
    {
        bool _3625 = _2247 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3627 = isnan(_2247);
        bool _3629 = _3625 || _3627;
        bool _3631 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3633 = _3629 || _3631;
        if (!_3633)
        {
            float _3635 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3637 = _2247 + _3635;
            float _3639 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3641 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3639;
            float _3643 = 1.0 / _3641;
            float _3645 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3647 = _3645 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3649 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3651 = _3649 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3653 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3655 = _3653 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3657 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3659 = _3657 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3661 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3663 = _3661 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3665 = _3637 * _3643;
            float _3667 = precise::clamp(_3665, 0.0, 1.0);
            float _3669 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3671 = _3669 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3673 = fma(_3667, _3647, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3675 = fma(_3667, _3671, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3677 = fma(_3667, _3651, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3679 = fma(_3667, _3655, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3681 = fma(_3667, _3659, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3683 = fma(_3667, _3663, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3597 = _3675;
            _3615 = _3681;
            _3591 = _3673;
            _3609 = _3679;
            _3603 = _3677;
            _3623 = _3683;
            _3685 = true;
        }
        else
        {
            bool _3687 = _2247 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3689 = isnan(_2247);
            bool _3691 = _3687 || _3689;
            bool _3693 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3695 = _3691 || _3693;
            if (!_3695)
            {
                _3589 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3697 = _3589;
            _3591 = _3697;
            if (!_3695)
            {
                _3595 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3699 = _3595;
            _3597 = _3699;
            if (!_3695)
            {
                _3601 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3701 = _3601;
            _3603 = _3701;
            if (!_3695)
            {
                _3607 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3703 = _3607;
            _3609 = _3703;
            if (!_3695)
            {
                _3613 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3705 = _3613;
            _3615 = _3705;
            if (!_3695)
            {
                _3621 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3707 = _3621;
            bool _3709 = !_3695;
            _3623 = _3707;
            if (!_3709)
            {
                bool _3711 = _2247 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3713 = isnan(_2247);
                bool _3715 = _3711 || _3713;
                bool _3717 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3719 = _3715 || _3717;
                if (!_3719)
                {
                    float _3721 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3723 = _2247 + _3721;
                    float _3725 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3727 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3725;
                    float _3729 = 1.0 / _3727;
                    float _3731 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3733 = _3731 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3735 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3737 = _3735 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3739 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3741 = _3739 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3743 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3745 = _3743 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3747 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3749 = _3747 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3751 = _3723 * _3729;
                    float _3753 = precise::clamp(_3751, 0.0, 1.0);
                    float _3755 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3757 = _3755 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3759 = fma(_3753, _3733, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3761 = fma(_3753, _3757, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3763 = fma(_3753, _3737, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3765 = fma(_3753, _3741, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3767 = fma(_3753, _3745, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3769 = fma(_3753, _3749, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3597 = _3761;
                    _3615 = _3767;
                    _3591 = _3759;
                    _3609 = _3765;
                    _3603 = _3763;
                    _3623 = _3769;
                    _3685 = true;
                }
                else
                {
                    _3597 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3615 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3591 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3609 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3603 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3623 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3685 = false;
    float _3771 = _3597;
    float _3773 = _3615;
    float _3775 = _3591;
    float _3777 = _3609;
    float _3779 = _3603;
    float _3781 = _3623;
    float _3783 = fma(_3543, -0.5, 0.5);
    float _3785 = precise::clamp(_3783, 0.0, 1.0);
    float _3787 = -_3771;
    float _3789 = _3787 + _3773;
    float _3791 = -_3775;
    float _3793 = _3791 + _3777;
    float _3795 = -_3779;
    float _3797 = _3795 + _3781;
    bool _3799 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3801 = fma(_3785, _3789, _3771);
    float _3803 = fma(_3785, _3793, _3775);
    float _3805 = fma(_3785, _3797, _3779);
    float _3807 = _3801 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _3809 = fma(_3803, 0.298911988735198974609375, _3807);
    float _3811 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3813 = fma(_3805, 0.114477999508380889892578125, _3809);
    out.m_90.w = _3811;
    float _3815 = -_3813;
    float _3817 = _3803 + _3815;
    float _3819 = -_3813;
    float _3821 = _3801 + _3819;
    float _3823 = -_3813;
    float _3825 = _3805 + _3823;
    out.m_96.x = 0.0;
    float _3827 = fma(_3817, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3813);
    float _3829 = fma(_3821, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3813);
    float _3831 = fma(_3825, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3813);
    out.m_98.x = _3827;
    out.m_98.y = _3829;
    out.m_98.z = _3831;
    if (!_3799)
    {
        return out;
    }
    float _3833 = -_1408;
    float _3835 = _3833 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3837 = -_1410;
    float _3839 = _3837 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3841 = -_1412;
    float _3843 = _3841 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3845 = _3835 * _3835;
    float _3847 = fma(_3839, _3839, _3845);
    float _3849 = fma(_3843, _3843, _3847);
    float _3851 = sqrt(_3849);
    float _3853 = rsqrt(_3849);
    float _3855 = -_3851;
    float _3857 = _3855 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3859 = _3857 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3861 = precise::clamp(_3859, 0.0, 1.0);
    float _3863 = _3839 * _3853;
    float _3865 = _3835 * _3853;
    float _3867 = abs(_3861);
    float _3869 = log2(_3867);
    float _3871 = _3843 * _3853;
    float _3873 = _3863 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3875 = _3543 * _3865;
    float _3877 = -_3865;
    float _3879 = -_3873;
    float _3881 = fma(_3877, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3879);
    float _3883 = fma(_3547, _3863, _3875);
    float _3885 = -_3871;
    float _3887 = fma(_3885, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3881);
    float _3889 = fma(_3555, _3871, _3883);
    float _3891 = precise::clamp(_3889, 0.0, 1.0);
    float _3893 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3895 = _3887 + _3893;
    float _3897 = _3869 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3899 = _3895 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3901 = precise::clamp(_3899, 0.0, 1.0);
    float _3903 = exp2(_3897);
    float _3905 = _3903 * _3901;
    float _3907 = _3891 * _3905;
    float _3909 = _3907 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3911 = _3907 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3913 = _3907 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_96.x = _3909;
    out.m_96.y = _3911;
    out.m_96.z = _3913;
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
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3685 = false;
    bool _213 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_56.w;
    float _114 = trunc(_112);
    int _117 = int(_114);
    bool _121 = _117 >= 1;
    float _123 = 0.0;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    float _127 = _125;
    if (!_121)
    {
        out.m_59.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _125 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3970 = as_type<float>(_133);
        out.gl_Position.z = _3970;
    }
    if (!_121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = in.m_61.w;
    bool _139 = _137 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_137);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = -_137;
    float _151 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _153 = _151;
    if (_147)
    {
        float _155 = float(_117);
        _127 = _155;
    }
    float _157 = _127;
    bool _159 = _151 >= _157;
    bool _161 = !_147;
    bool _163 = _159 || _161;
    float _165 = _157;
    if (_163)
    {
        _165 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _167 = _165;
    if (_163)
    {
        out.m_59.x = 0.0;
    }
    if (_163)
    {
        float _169 = _167 * 5.0;
        _135 = as_type<int>(_169);
    }
    int _171 = _135;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4040 = as_type<float>(_171);
        out.gl_Position.z = _4040;
    }
    if (_163)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _173 = as_type<float>(int(gl_VertexIndex));
    bool _175 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _177 = as_type<int>(_173) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_173) & 2;
    bool _183 = _181 != 0;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_175;
    float _211;
    if (!_193)
    {
        float _195 = in.m_66.x;
        float _197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _199 = _195 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _201 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[12].x, _151);
        float _203 = _201 * _197;
        float _205 = floor(_203);
        float _207 = -_205;
        float _209 = _203 + _207;
        _211 = _209;
        _213 = true;
    }
    else
    {
        float _215 = float(_117);
        float _217 = 1.0 / _215;
        float _219 = _151 * _217;
        _211 = _219;
    }
    _213 = false;
    float _221 = _211;
    float _223 = in.m_56.x;
    float _225 = in.m_56.y;
    float _227 = in.m_56.z;
    float _229 = in.m_68.x;
    float _231 = in.m_68.y;
    float _233 = in.m_68.z;
    float _235 = in.m_68.w;
    float _237 = in.m_70.x;
    float _239 = in.m_70.y;
    float _241 = in.m_70.z;
    float _243 = in.m_70.w;
    float _245 = _225 * _231;
    float _247 = fma(_223, _229, _245);
    float _249 = _225 * _239;
    float _251 = fma(_227, _233, _247);
    float _253 = fma(_223, _237, _249);
    float _255 = _251 + _235;
    float _257 = fma(_227, _241, _253);
    float _259 = fma(_255, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _261 = _257 + _243;
    float _263 = floor(_259);
    float _265 = fma(_261, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _267 = floor(_265);
    float _269 = -_263;
    float _271 = _259 + _269;
    float _273 = -_267;
    float _275 = _265 + _273;
    float2 _4195 = float2(_271, _275);
    float _277 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4195, float2(0.0), isnan(_4195)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4195, float2(0.0), isnan(_4195)), level(0.0)).x;
    float _279 = in.m_72.x;
    float _281 = in.m_72.y;
    float _283 = in.m_72.z;
    float _285 = in.m_72.w;
    float _287 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _289 = log2(_287);
    float _291 = in.m_66.x;
    float _293 = in.m_66.y;
    float _295 = in.m_66.z;
    float _297 = in.m_66.w;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _299;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _305 = _303 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _307 = 1.0 / _301;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _309;
    int _313 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _315 = _313 != 0;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _319 = 1.0 / _311;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _323 = _221 + _321;
    float _325 = _225 * _281;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _329 = 1.0 / _305;
    float _331 = _323 * _307;
    float _333 = fma(_223, _279, _325);
    float _335 = _291 * 2.0;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _339 = _221 + _337;
    float _341 = _291 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _343 = fma(_227, _283, _333);
    float _345 = _295 * 2.0;
    float _347 = _295 + _291;
    float _349 = _293 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _351 = floor(_335);
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _355 = _221 + _353;
    float _357 = fma(_349, -2.0, _317);
    float _359 = _293 * 2.0;
    float _361 = _347 + (-1.0);
    float _363 = _339 * _319;
    float _365 = -_327;
    float _367 = fma(_341, 2.0, _365);
    float _369 = floor(_345);
    float _371 = _295 + _293;
    float _373 = _355 * _329;
    float _375 = _291 + _293;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _379 = _371 + (-1.0);
    float _381 = float(_117);
    float _383 = _375 + (-1.0);
    float _385 = floor(_359);
    bool _387 = _351 > 0.0;
    bool _389 = _351 >= 0.0;
    bool _391 = isnan(_351);
    bool _393 = _389 || _391;
    bool _395 = isnan(0.0);
    bool _397 = _393 || _395;
    float _399 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _401 = 1.0 / _381;
    float _403 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _405;
    bool _409 = _369 > 0.0;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _411;
    bool _415 = _369 >= 0.0;
    bool _417 = isnan(_369);
    bool _419 = _415 || _417;
    bool _421 = isnan(0.0);
    bool _423 = _419 || _421;
    float _425 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _427 = as_type<int>(_379);
    float _429 = _381;
    if (_315)
    {
        _427 = 0;
    }
    int _431 = _427;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _435 = _433 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _437 = _385 > 0.0;
    float _439 = fma(_413, _331, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _441 = _431;
    if (!_315)
    {
        _441 = 1;
    }
    int _443 = _441;
    float _445 = fma(_435, _373, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _447 = _397 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _449 = fma(_407, _331, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _451 = _385 >= 0.0;
    bool _453 = isnan(_385);
    bool _455 = _451 || _453;
    bool _457 = isnan(0.0);
    bool _459 = _455 || _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _465 = _443 != 1;
    float _467 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _469 = int(_467);
    float _471 = _423 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _473 = fma(_463, _373, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _475 = _459 ? 0 : 1;
    float _477 = _343 + _285;
    int _479 = ~as_type<int>(_471);
    int _481 = _479 + 1;
    int _483 = _481 + 1;
    float _485 = _289 * _151;
    int _487 = ~_475;
    int _489 = _487 + 1;
    int _491 = _489 + 1;
    float _493 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _495 = int(_493);
    int _497 = _483;
    int _499 = _491;
    float _501 = _447;
    float _503 = _471;
    float _505 = _477;
    if (!_409)
    {
        int _507 = ~as_type<int>(_471);
        int _509 = _507 + 1;
        _497 = _509;
    }
    int _511 = _497;
    float _513 = _477 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    if (!_437)
    {
        int _515 = ~_475;
        int _517 = _515 + 1;
        _499 = _517;
    }
    int _519 = _499;
    float _521 = _477 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _525 = _523 != 0;
    int _527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _529 = _527 != 0;
    int _531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _533 = _531 != 0;
    float _535 = fma(_255, (*spvDescriptorSet0.vp_c8)._m0[10].x, _513);
    float _537 = exp2(_485);
    int _539 = ~as_type<int>(_447);
    int _541 = _539 + 1;
    int _543 = _541 + 1;
    float _545 = fma(_255, (*spvDescriptorSet0.vp_c8)._m0[11].x, _521);
    int _547 = _543;
    if (!_387)
    {
        int _549 = ~as_type<int>(_447);
        int _551 = _549 + 1;
        _547 = _551;
    }
    int _553 = _547;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_465)
    {
        _501 = _293;
    }
    float _557 = _501;
    float _559 = fma(_261, (*spvDescriptorSet0.vp_c8)._m0[10].z, _535);
    float _561 = _557;
    if (_465)
    {
        _561 = _291;
    }
    float _563 = _561;
    float _565 = fma(_261, (*spvDescriptorSet0.vp_c8)._m0[11].z, _545);
    bool _567 = !_529;
    int _569 = _567 ? 0 : 1;
    float _571 = _401 * _151;
    bool _573 = !_525;
    int _575 = _573 ? 0 : 1;
    float _577 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[83].z, _555);
    bool _579 = !_533;
    int _581 = _579 ? 0 : 1;
    float _583 = _565 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    if (!_465)
    {
        _503 = _295;
    }
    float _585 = _503;
    float _587 = -_537;
    float _589 = _587 + 1.0;
    int _591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _593 = _591 != 0;
    int _595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _597 = _595 != 0;
    int _599 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _601 = _599 != 0;
    float _603 = _585;
    if (_465)
    {
        _603 = _293;
    }
    float _605 = _603;
    bool _607 = !_593;
    int _609 = _607 ? 0 : 1;
    float _611 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[83].w, _377);
    float _613 = _605;
    if (!_465)
    {
        _613 = _293;
    }
    float _615 = _613;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _619 = _615;
    if (_465)
    {
        _619 = _291;
    }
    float _621 = _619;
    int _623 = abs(_609);
    if (!_465)
    {
        _429 = _295;
    }
    float _625 = _429;
    float _627 = _621 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _629 = float(_469);
    float _631 = -_617;
    float _633 = fma(_627, 2.0, _631);
    float _635 = _625;
    if (_465)
    {
        _635 = _293;
    }
    float _637 = _635;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _641 = float(_623);
    float _643 = 1.0 / _629;
    float _645 = float(_511);
    float _647 = _637 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _649 = _641 * _645;
    float _651 = float(_495);
    float _653 = fma(_647, -2.0, _639);
    float _655 = in.m_74.x;
    float _657 = in.m_74.y;
    float _659 = in.m_74.z;
    bool _661 = !_597;
    int _663 = _661 ? 0 : 1;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _665;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _669;
    float _673 = 1.0 / _651;
    int _675 = abs(_663);
    float _677 = fma(_667, _363, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _679 = fma(_671, _363, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _681 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _683 = isnan(0.0);
    bool _685 = _681 || _683;
    bool _687 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _689 = _685 || _687;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _693 = 1.0 + _691;
    float _695 = float(_553);
    float _697 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[76].y, _357);
    float _699 = float(_675);
    float _701 = 1.0 / _693;
    float _703 = _689 ? _589 : 0.0;
    float _705 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[82].z, _577);
    float _707 = _699 * _695;
    float _709 = _559 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _711 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _713 = isnan(_221);
    bool _715 = _711 || _713;
    bool _717 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _719 = _715 || _717;
    float _721 = float(_719);
    float _723 = _707 * (-2.0);
    bool _725 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _727 = isnan(1.0);
    bool _729 = _725 || _727;
    bool _731 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _733 = _729 || _731;
    float _735 = -_151;
    float _737 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[81].x, _633);
    float _739 = _709 + _583;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _745 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _747 = isnan(_221);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _753 = _749 || _751;
    float _755 = float(_753);
    float _757 = -_721;
    float _759 = _757 + 1.0;
    float _761 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[82].w, _611);
    float _763 = fma(_425, _723, _425);
    float _765 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[78].z, _741);
    float _767 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[78].w, _743);
    float _769 = fma(_723, _657, _657);
    bool _771 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _773 = isnan(_221);
    bool _775 = _771 || _773;
    bool _777 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _779 = _775 || _777;
    float _781 = float(_779);
    float _783 = _755 * _759;
    float _785 = -_755;
    float _787 = _785 + 1.0;
    float _789 = -_151;
    float _791 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[76].x, _367);
    bool _793 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _795 = isnan(_221);
    bool _797 = _793 || _795;
    bool _799 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _801 = _797 || _799;
    float _803 = float(_801);
    float _805 = _643 * _151;
    float _807 = _673 * _151;
    float _809 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[77].z, _765);
    float _811 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[77].w, _767);
    float _813 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[81].y, _653);
    bool _815 = !_601;
    int _817 = _815 ? 0 : 1;
    if (_733)
    {
        float _819 = _703 * _701;
        _153 = _819;
    }
    float _821 = _153;
    float _823 = _781 * _787;
    float _825 = -_781;
    float _827 = _825 + 1.0;
    float _829 = _293 + (-0.5);
    int _831 = abs(_817);
    float _833 = 1.0 / _583;
    float _835 = _803 * _827;
    float _837 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[196].y, _769);
    float _839 = -_803;
    float _841 = _839 + 1.0;
    float _843 = _439 * _835;
    float _845 = float(_519);
    float _847 = _449 * _835;
    float _849 = float(_831);
    float _851 = _649 * (-2.0);
    float _853 = fma(_763, _821, _837);
    float _855 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[143].x, _843);
    float _857 = _849 * _845;
    float _859 = fma(_851, _655, _655);
    float _861 = fma(_399, _851, _399);
    float _863 = in.m_76.x;
    float _865 = in.m_76.y;
    float _867 = _291 + (-0.5);
    float _869 = _739 * _833;
    float _871 = _869 * 0.5;
    float _873 = _857 * (-2.0);
    float _875 = fma(_473, _823, _855);
    float _877 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[196].x, _859);
    float _879 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _881 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[30].w, _879);
    float _883 = fma(_873, _659, _659);
    float _885 = _295 + (-0.5);
    float _887 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[143].y, _847);
    float _889 = fma(_403, _873, _403);
    float _891 = fma(_677, _783, _875);
    float _893 = fma(_885, (*spvDescriptorSet0.vp_c9)._m0[196].z, _883);
    float _895 = 1.0 / _881;
    float _897 = fma(_861, _821, _877);
    float _899 = fma(_445, _823, _887);
    float _901 = fma(_889, _821, _893);
    float _903 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[146].x, _891);
    float _905 = _853 * 0.15915493667125701904296875;
    float _907 = _897 * 0.15915493667125701904296875;
    float _909 = fma(_679, _783, _899);
    float _911 = _901 * 0.15915493667125701904296875;
    float _913 = _905 * 6.283185482025146484375;
    float _915 = sin(_913);
    float _917 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _919 = _903 * _863;
    float _921 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[146].y, _909);
    float _923 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _925 = _477 + _917;
    float _927 = _919 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _929 = _921 * _865;
    float _931 = _905 * 6.283185482025146484375;
    float _933 = cos(_931);
    float _935 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _191);
    float _937 = _927 * _923;
    float _939 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _941 = _895 * _939;
    float _943 = _929 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _945 = _925 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _947 = _925 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _949 = _907 * 6.283185482025146484375;
    float _951 = sin(_949);
    bool _953 = _941 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _955 = _943 * _935;
    bool _957 = _941 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _959 = fma(_255, (*spvDescriptorSet0.vp_c15)._m0[126].x, _945);
    float _961 = fma(_255, (*spvDescriptorSet0.vp_c15)._m0[127].x, _947);
    float _963 = _907 * 6.283185482025146484375;
    float _965 = cos(_963);
    float _967 = fma(_261, (*spvDescriptorSet0.vp_c15)._m0[126].z, _959);
    float _969 = fma(_261, (*spvDescriptorSet0.vp_c15)._m0[127].z, _961);
    float _971 = _967 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    int _973 = 2;
    if (!_953)
    {
        _973 = 1;
    }
    int _975 = _973;
    float _977 = _969 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _979 = _911 * 6.283185482025146484375;
    float _981 = cos(_979);
    float _983 = _951 * _933;
    float _985 = _951 * _915;
    float _987 = _911 * 6.283185482025146484375;
    float _989 = sin(_987);
    float _991 = _965 * _915;
    float _993 = _965 * _933;
    float _995 = _933 * _981;
    float _997 = trunc(_971);
    int _999 = int(_997);
    float _1001 = _965 * _981;
    float _1003 = _951 * _981;
    float _1005 = _915 * _981;
    float _1007 = _1001 * _955;
    float _1009 = -_991;
    float _1011 = fma(_989, _983, _1009);
    float _1013 = -_983;
    float _1015 = fma(_989, _991, _1013);
    bool _1017 = !_953;
    int _1019 = _1017 ? 0 : 1;
    float _1021 = fma(_989, _993, _985);
    float _1023 = fma(_989, _985, _993);
    float _1025 = -_955;
    float _1027 = _989 * _1025;
    int _1029 = _975;
    if (!_957)
    {
        _1029 = _1019;
    }
    int _1031 = _1029;
    float _1033 = trunc(_977);
    int _1035 = int(_1033);
    float _1037 = fma(_1021, _937, _1007);
    float _1039 = fma(_995, _937, _1027);
    int _1041 = _1031 << 6;
    float _1043 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1045 = _1003 * _955;
    int _1047 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1049 = _999 + _1047;
    int _1051 = _1049 + 1;
    int _1053 = _1041 + 96;
    uint _1056 = uint(int(uint(_1053) >> uint(2)));
    uint _1058 = uint(int(uint(int(_1056)) >> uint(2)));
    int _1060 = int(_1056) & 3;
    float _1062 = (*spvDescriptorSet0.vp_c15)._m0[int(_1058)][_1060];
    int _1064 = int(_1056) + 1;
    uint _1066 = uint(int(uint(_1064) >> uint(2)));
    int _1068 = _1064 & 3;
    float _1070 = (*spvDescriptorSet0.vp_c15)._m0[int(_1066)][_1068];
    float _1072 = fma(_1015, _1043, _1037);
    float _1074 = fma(_1011, _937, _1045);
    float _1076 = fma(_1005, _1043, _1039);
    bool _1078 = _1051 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1080 = _1072 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1082 = fma(_1023, _1043, _1074);
    float _1084 = _1072 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1086 = _1041 + 104;
    uint _1088 = uint(int(uint(_1086) >> uint(2)));
    uint _1090 = uint(int(uint(int(_1088)) >> uint(2)));
    int _1092 = int(_1088) & 3;
    float _1094 = (*spvDescriptorSet0.vp_c15)._m0[int(_1090)][_1092];
    int _1096 = int(_1088) + 1;
    uint _1098 = uint(int(uint(_1096) >> uint(2)));
    int _1100 = _1096 & 3;
    float _1102 = (*spvDescriptorSet0.vp_c15)._m0[int(_1098)][_1100];
    int _1104 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1106 = _1035 + _1104;
    int _1108 = _1106 + 1;
    float _1110 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1080);
    int _1112 = _1051 | _1108;
    float _1114 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1110);
    int _1116 = _1041 + 48;
    uint _1118 = uint(int(uint(_1116) >> uint(2)));
    uint _1120 = uint(int(uint(int(_1118)) >> uint(2)));
    int _1122 = int(_1118) & 3;
    float _1124 = (*spvDescriptorSet0.vp_c15)._m0[int(_1120)][_1122];
    int _1126 = int(_1118) + 1;
    uint _1128 = uint(int(uint(_1126) >> uint(2)));
    int _1130 = _1126 & 3;
    float _1132 = (*spvDescriptorSet0.vp_c15)._m0[int(_1128)][_1130];
    bool _1134 = _1112 < 0;
    bool _1136 = _1134 || _1078;
    float _1138 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1084);
    float _1140 = _1114 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _1142 = _1108 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1144 = _1142 || _1136;
    float _1146 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1138);
    float _1148 = _261 + _1140;
    int _1150 = _1041 + 64;
    uint _1152 = uint(int(uint(_1150) >> uint(2)));
    uint _1154 = uint(int(uint(int(_1152)) >> uint(2)));
    int _1156 = int(_1152) & 3;
    float _1158 = (*spvDescriptorSet0.vp_c15)._m0[int(_1154)][_1156];
    int _1160 = int(_1152) + 1;
    uint _1162 = uint(int(uint(_1160) >> uint(2)));
    int _1164 = _1160 & 3;
    float _1166 = (*spvDescriptorSet0.vp_c15)._m0[int(_1162)][_1164];
    float _1168 = _1146 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1170 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1172 = _1148 + _1170;
    float _1174 = _255 + _1168;
    float _1176 = _1172 * _1172;
    int _1178 = _1041 + 56;
    uint _1180 = uint(int(uint(_1178) >> uint(2)));
    uint _1182 = uint(int(uint(int(_1180)) >> uint(2)));
    int _1184 = int(_1180) & 3;
    float _1186 = (*spvDescriptorSet0.vp_c15)._m0[int(_1182)][_1184];
    int _1188 = int(_1180) + 1;
    uint _1190 = uint(int(uint(_1188) >> uint(2)));
    int _1192 = _1188 & 3;
    float _1194 = (*spvDescriptorSet0.vp_c15)._m0[int(_1190)][_1192];
    int _1196 = _1051;
    int _1198 = as_type<int>(_1176);
    float _1200 = as_type<float>(_1031);
    if (!_1144)
    {
        int _1202 = _1108 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1204 = _1202 + _1051;
        _1196 = _1204;
    }
    int _1206 = _1196;
    float _1208 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1210 = _1174 + _1208;
    int _1212 = 0;
    float _1214 = as_type<float>(_1206);
    if (!_1144)
    {
        int _1216 = _1206 << 2;
        _1212 = _1216;
    }
    int _1218 = _1212;
    int _1220 = _1041 + 72;
    uint _1222 = uint(int(uint(_1220) >> uint(2)));
    uint _1224 = uint(int(uint(int(_1222)) >> uint(2)));
    int _1226 = int(_1222) & 3;
    float _1228 = (*spvDescriptorSet0.vp_c15)._m0[int(_1224)][_1226];
    int _1230 = int(_1222) + 1;
    uint _1232 = uint(int(uint(_1230) >> uint(2)));
    int _1234 = _1230 & 3;
    float _1236 = (*spvDescriptorSet0.vp_c15)._m0[int(_1232)][_1234];
    float _1238 = fma(_1210, _1210, _1176);
    int _1240 = _1218;
    if (!_1144)
    {
        uint _1242 = uint(int(uint(_1206) >> uint(2)));
        _1198 = int(_1242);
    }
    int _1244 = _1198;
    int _1246 = _1244;
    if (!_1144)
    {
        int _1248 = 12 & _1218;
        _1240 = _1248;
    }
    int _1250 = _1240;
    float _1252 = sqrt(_1238);
    int _1254 = _1041 + 80;
    uint _1256 = uint(int(uint(_1254) >> uint(2)));
    uint _1258 = uint(int(uint(int(_1256)) >> uint(2)));
    int _1260 = int(_1256) & 3;
    float _1262 = (*spvDescriptorSet0.vp_c15)._m0[int(_1258)][_1260];
    int _1264 = int(_1256) + 1;
    uint _1266 = uint(int(uint(_1264) >> uint(2)));
    int _1268 = _1264 & 3;
    float _1270 = (*spvDescriptorSet0.vp_c15)._m0[int(_1266)][_1268];
    float _1272 = _925 * _1070;
    float _1274 = _1070;
    if (!_1144)
    {
        int _1276 = _1244 << 4;
        int _1278 = _1276 + _1250;
        _1246 = _1278;
    }
    int _1280 = _1246;
    float _1282 = _1072 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1284 = fma(_255, _1062, _1272);
    float _1286 = _1072;
    if (!_1144)
    {
        float _1288 = floor(_971);
        _1286 = _1288;
    }
    float _1290 = _1286;
    float _1292 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1282);
    float _1294 = fma(_261, _1094, _1284);
    float _1296 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1292);
    float _1298 = _1294 + _1102;
    bool _1300 = _1252 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1302 = _1296 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1304 = _925 * _1132;
    float _1306 = 1.0 / _1298;
    int _1308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1310 = _1308 != 0;
    int _1312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1314 = _1312 != 0;
    int _1316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1318 = _1316 != 0;
    int _1320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1322 = _1320 != 0;
    float _1324 = fma(_255, _1124, _1304);
    bool _1326 = !_1314;
    int _1328 = _1326 ? 0 : 1;
    float _1330 = _925 * _1166;
    bool _1332 = !_1310;
    int _1334 = _1332 ? 0 : 1;
    bool _1336 = !_1318;
    int _1338 = _1336 ? 0 : 1;
    float _1340 = fma(_255, _1158, _1330);
    bool _1342 = !_1322;
    int _1344 = _1342 ? 0 : 1;
    float _1346 = fma(_261, _1186, _1324);
    float _1348 = _1346 + _1194;
    float _1350 = fma(_261, _1228, _1340);
    float _1352 = _477 + _1302;
    float _1354 = _1302;
    if (!_1300)
    {
        _505 = _1174;
    }
    float _1356 = _505;
    float _1358 = _1350 + _1236;
    float _1360 = _1356;
    if (!_1300)
    {
        _1354 = _1148;
    }
    float _1362 = _1354;
    float _1364 = _1362;
    if (!_1300)
    {
        _1274 = _1352;
    }
    float _1366 = _1274;
    bool _1368 = !_1300;
    float _1370 = _1366;
    if (!_1368)
    {
        float _1372 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1374 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1376 = _1252 + _1374;
        float _1378 = rsqrt(_1238);
        float _1380 = _1376 * _1372;
        float _1382 = _1352 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1384 = _1380 * 0.15915493667125701904296875;
        float _1386 = _1384 * 6.283185482025146484375;
        float _1388 = cos(_1386);
        float _1390 = _1384 * 6.283185482025146484375;
        float _1392 = sin(_1390);
        float _1394 = _1388 + (-1.0);
        float _1396 = fma(_1392, _1382, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1398 = _1394 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1400 = _1378 * _1396;
        float _1402 = fma(_1352, _1388, _1398);
        float _1404 = fma(_1210, _1400, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1406 = fma(_1172, _1400, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1370 = _1402;
        _1360 = _1404;
        _1364 = _1406;
    }
    float _1408 = _1370;
    float _1410 = _1360;
    float _1412 = _1364;
    int _1414 = _1041 + 88;
    uint _1416 = uint(int(uint(_1414) >> uint(2)));
    uint _1418 = uint(int(uint(int(_1416)) >> uint(2)));
    int _1420 = int(_1416) & 3;
    float _1422 = (*spvDescriptorSet0.vp_c15)._m0[int(_1418)][_1420];
    int _1424 = int(_1416) + 1;
    uint _1426 = uint(int(uint(_1424) >> uint(2)));
    int _1428 = _1424 & 3;
    float _1430 = (*spvDescriptorSet0.vp_c15)._m0[int(_1426)][_1428];
    float _1432 = _1358 * _1306;
    float _1434 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1436 = _1348 * _1306;
    float _1438 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1440 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1442 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1434);
    float _1444 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1446 = _1148;
    float _1448 = _1432;
    if (!_1144)
    {
        int _1450 = _1280 + 400;
        uint _1452 = uint(int(uint(_1450) >> uint(2)));
        uint _1454 = uint(int(uint(int(_1452)) >> uint(2)));
        int _1456 = int(_1452) & 3;
        float _1458 = (*spvDescriptorSet0.vp_c15)._m0[int(_1454)][_1456];
        _1446 = _1458;
    }
    float _1460 = _1446;
    float _1462 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1438);
    float _1464 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1440);
    bool _1466 = _1436 >= 0.0;
    float _1468 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1442);
    float _1470 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1462);
    float _1472 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1464);
    bool _1474 = _1436 <= 1.0;
    bool _1476 = _1474 && _1466;
    float _1478 = _1468 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1480 = _1470 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1482 = _1472 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1484 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1444);
    float _1486 = _1478 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1488 = _1432 >= 0.0;
    bool _1490 = _1488 && _1476;
    float _1492 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1494 = _1480 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1496 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1484);
    float _1498 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1486);
    bool _1500 = _1432 <= 1.0;
    bool _1502 = _1500 && _1490;
    float _1504 = -_1494;
    float _1506 = fma(_1504, _1492, 1.0);
    float _1508 = _1496 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1510 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1498);
    float _1512 = _925 * _1270;
    float _1514 = _1094;
    if (!_1144)
    {
        float _1516 = floor(_977);
        _1514 = _1516;
    }
    float _1518 = _1514;
    float _1520 = _1478 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1522 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1510);
    float _1524 = fma(_255, _1262, _1512);
    float _1526 = _1478 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1528 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1520);
    float _1530 = log2(_1506);
    if (_1502)
    {
        float _1532 = float(_1031);
        _1200 = _1532;
    }
    float _1534 = _1200;
    float _1536 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1526);
    float _1538 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1528);
    float _1540 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1536);
    float _1542 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1538);
    float _1544 = 1.0 / _1522;
    float _1546 = fma(_261, _1422, _1524);
    float _1548 = 0.0;
    float _1550 = _1542;
    if (!_1144)
    {
        float _1552 = -_1518;
        float _1554 = _977 + _1552;
        _1548 = _1554;
    }
    float _1556 = _1548;
    float _1558 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1540);
    float _1560 = _1546 + _1430;
    float _1562 = _1534;
    if (_1502)
    {
        float _1564 = rint(_1534);
        float _1566 = precise::max(_1564, 0.0);
        uint _1568 = uint(_1566);
        uint _1570 = clamp(_1568, 0u, 65535u);
        _1562 = as_type<float>(_1570);
    }
    float _1572 = _1562;
    float _1574 = _1560 * _1306;
    float _1576 = _1530 * 0.693147182464599609375;
    float _1578 = _1576 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1580 = _1560;
    float _1582 = _1460;
    if (!_1144)
    {
        float _1584 = rint(_1460);
        float _1586 = precise::max(_1584, 0.0);
        uint _1588 = uint(_1586);
        uint _1590 = clamp(_1588, 0u, 65535u);
        _1580 = as_type<float>(_1590);
    }
    float _1592 = _1580;
    float _1594 = _1542 * _1544;
    float _1596 = _1558 * _1544;
    float _1598 = fma(_1594, 0.5, 0.5);
    float _1600 = fma(_1596, -0.5, 0.5);
    float _1602 = _1594;
    if (!_1144)
    {
        float _1604 = -_1290;
        float _1606 = _971 + _1604;
        _1602 = _1606;
    }
    float _1608 = _1602;
    float _1610 = _1576;
    if (_1502)
    {
        float3 _6350 = float3(_1436, _1432, float(as_type<int>(_1572)));
        float3 _6354 = select(_6350, float3(0.0), isnan(_6350));
        float _1612 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6354.xy, uint(rint(_6354.z)), _1574, level(0.0));
        _1610 = _1612;
    }
    float _1614 = _1610;
    float3 _6364 = float3(_1598, _1600, _1578);
    float _1616 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6364, float3(0.0), isnan(_6364)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6364, float3(0.0), isnan(_6364)), level(0.0)).x;
    float3 _6373 = float3(_1598, _1600, _1578);
    float4 _1619 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6373, float3(0.0), isnan(_6373)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6373, float3(0.0), isnan(_6373)), level(0.0)).xyzw;
    float _1621 = _1619.x;
    float _1623 = _1619.y;
    float _1625 = _1619.z;
    float _1627 = _1619.w;
    float _1629 = _1556;
    if (!_1144)
    {
        float3 _6396 = float3(_1608, _1556, float(as_type<int>(_1592)));
        float3 _6398 = select(_6396, float3(0.0), isnan(_6396));
        float _1631 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6398.xy, uint(rint(_6398.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6398.xy, uint(rint(_6398.z)), level(0.0)).x;
        _1629 = _1631;
    }
    float _1633 = _1629;
    float _1635 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1637 = int(_1635);
    int _1639 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1641 = _1639 != 0;
    int _1643 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1645 = _1643 != 0;
    int _1647 = abs(_569);
    int _1649 = abs(_575);
    float _1651 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1653 = int(_1651);
    int _1655 = abs(_581);
    int _1657 = abs(_1334);
    int _1659 = abs(_1338);
    if (_1641)
    {
        float _1661 = in.m_66.x;
        _1582 = _1661;
    }
    float _1663 = _1582;
    int _1665 = abs(_1344);
    float _1667 = trunc(_805);
    int _1669 = int(_1667);
    float _1671 = float(uint(_1637));
    float _1673 = _1663;
    if (!_1641)
    {
        float _1675 = in.m_66.y;
        _1673 = _1675;
    }
    float _1677 = _1673;
    float _1679 = 1.0 / _1671;
    float _1681 = float(uint(_1653));
    int _1683 = ~_1637;
    int _1685 = _1683 + 1;
    float _1687 = 1.0 / _1681;
    float _1689 = trunc(_807);
    int _1691 = int(_1689);
    int _1693 = as_type<int>(_1679) + (-2);
    float _1695 = float(uint(_1669));
    float _1697 = _1695;
    if (_1641)
    {
        _1448 = 1.0;
    }
    float _1699 = _1448;
    float _1701 = _1699;
    if (!_1641)
    {
        _1701 = 1.2345600128173828125;
    }
    float _1703 = _1701;
    float _1705 = as_type<float>(_1693) * _1695;
    int _1707 = as_type<int>(_1687) + (-2);
    int _1709 = ~_1653;
    int _1711 = _1709 + 1;
    if (_1641)
    {
        _1697 = 1.0;
    }
    float _1713 = _1697;
    float _1715 = trunc(_1705);
    float _1717 = precise::max(_1715, 0.0);
    uint _1719 = uint(_1717);
    float _1721 = _1713;
    if (!_1641)
    {
        _1721 = 7.345489978790283203125;
    }
    float _1723 = _1721;
    float _1725 = float(uint(_1691));
    float _1727 = float(_1669);
    float _1729 = _1723 * _291;
    float _1731 = as_type<float>(_1707) * _1725;
    float _1733 = floor(_1729);
    int _1735 = _1685 * int(_1719);
    int _1737 = _1735 + _1669;
    float _1739 = trunc(_1731);
    float _1741 = precise::max(_1739, 0.0);
    uint _1743 = uint(_1741);
    float _1745 = _1703 * _1677;
    float _1747 = floor(_1745);
    int _1749 = _1711 * int(_1743);
    int _1751 = _1749 + _1691;
    float _1753 = float(uint(_1737));
    float _1755 = float(uint(_1751));
    float _1757 = as_type<float>(_1693) * _1753;
    float _1759 = float(_1637);
    float _1761 = as_type<float>(_1707) * _1755;
    float _1763 = -_1733;
    float _1765 = _1729 + _1763;
    float _1767 = trunc(_1757);
    float _1769 = precise::max(_1767, 0.0);
    uint _1771 = uint(_1769);
    bool _1773 = _1727 >= _1759;
    bool _1775 = isnan(_1727);
    bool _1777 = _1773 || _1775;
    bool _1779 = isnan(_1759);
    bool _1781 = _1777 || _1779;
    float _1783 = float(_1781);
    float _1785 = -_1747;
    float _1787 = _1745 + _1785;
    int _1789 = ~_1637;
    int _1791 = _1789 + 1;
    float _1793 = float(_1653);
    float _1795 = trunc(_1761);
    float _1797 = precise::max(_1795, 0.0);
    uint _1799 = uint(_1797);
    float _1801 = _1787 * _1793;
    int _1803 = int(_1719) + int(_1771);
    float _1805 = _1765 * _1759;
    float _1807 = float(_1691);
    float _1809 = _1759 * _571;
    float _1811 = _1793 * _571;
    int _1813 = _1791 * _1803;
    int _1815 = _1813 + _1669;
    float _1817 = trunc(_1783);
    int _1819 = int(_1817);
    int _1821 = int(_1743) + int(_1799);
    int _1823 = ~_1653;
    int _1825 = _1823 + 1;
    bool _1827 = _1807 >= _1793;
    bool _1829 = isnan(_1807);
    bool _1831 = _1827 || _1829;
    bool _1833 = isnan(_1793);
    bool _1835 = _1831 || _1833;
    float _1837 = float(_1835);
    bool _1839 = uint(_1815) >= uint(_1637);
    int _1841 = _1825 * _1821;
    int _1843 = _1841 + _1691;
    float _1845 = trunc(_1805);
    int _1847 = int(_1845);
    bool _1849 = !_1839;
    int _1851 = _1849 ? 0 : (-1);
    int _1853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1855 = _1853 != 0;
    int _1857 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1859 = _1857 != 0;
    int _1861 = ~_1803;
    int _1863 = _1861 + _1851;
    int _1865 = _1863 + 1;
    float _1867 = trunc(_1809);
    int _1869 = int(_1867);
    bool _1871 = !_1855;
    int _1873 = _1871 ? 0 : 1;
    bool _1875 = uint(_1843) >= uint(_1653);
    bool _1877 = !_1859;
    int _1879 = _1877 ? 0 : 1;
    int _1881 = abs(_1873);
    float _1883 = trunc(_1837);
    int _1885 = int(_1883);
    bool _1887 = !_1875;
    int _1889 = _1887 ? 0 : (-1);
    int _1891 = _1637 * _1865;
    int _1893 = _1891 + _1669;
    int _1895 = abs(_1879);
    int _1897 = ~_1821;
    int _1899 = _1897 + _1889;
    int _1901 = _1899 + 1;
    float _1903 = trunc(_1801);
    int _1905 = int(_1903);
    bool _1907 = _1637 == 0;
    int _1909 = _1847 * _1881;
    int _1911 = _1909 + _1669;
    int _1913 = ~_1819;
    int _1915 = _1913 + 1;
    int _1917 = _1915 + 1;
    int _1919 = _1653 * _1901;
    int _1921 = _1919 + _1691;
    bool _1923 = !_1907;
    int _1925 = _1923 ? _1893 : (-1);
    bool _1927 = _1653 == 0;
    float _1929 = trunc(_1811);
    int _1931 = int(_1929);
    int _1933 = _1637 + (-1);
    int _1935 = _1925 * _1917;
    int _1937 = ~_1885;
    int _1939 = _1937 + 1;
    int _1941 = _1939 + 1;
    bool _1943 = !_1927;
    int _1945 = _1943 ? _1921 : (-1);
    int _1947 = _1819 * _1933;
    int _1949 = _1947 + _1935;
    int _1951 = _1653 + (-1);
    int _1953 = _1945 * _1941;
    int _1955 = abs(_1328);
    int _1957 = _1885 * _1951;
    int _1959 = _1957 + _1953;
    int _1961 = _1949 * _1647;
    int _1963 = _1959 * _1955;
    bool _1965 = !_1645;
    int _1967 = _1965 ? 0 : 1;
    int _1969 = _1905 * _1895;
    int _1971 = _1969 + _1691;
    int _1973 = _1869 * _1649;
    int _1975 = _1973 + _1961;
    int _1977 = abs(_1967);
    int _1979 = _1911 * _1655;
    int _1981 = _1979 + _1975;
    int _1983 = _1931 * _1657;
    int _1985 = _1983 + _1963;
    int _1987 = ~_1637;
    int _1989 = _1987 + 1;
    int _1991 = _1847 * _1977;
    int _1993 = _1991 + _1981;
    int _1995 = _1971 * _1659;
    int _1997 = _1995 + _1985;
    int _1999 = ~_1637;
    int _2001 = _1999 + 1;
    float _2003 = float(uint(_1993));
    int _2005 = _1905 * _1665;
    int _2007 = _2005 + _1997;
    int _2009 = ~_1653;
    int _2011 = _2009 + 1;
    float _2013 = as_type<float>(_1693) * _2003;
    float _2015 = float(uint(_2007));
    float _2017 = float(uint(_1911));
    float _2019 = trunc(_2013);
    float _2021 = precise::max(_2019, 0.0);
    uint _2023 = uint(_2021);
    float _2025 = as_type<float>(_1707) * _2015;
    float _2027 = as_type<float>(_1693) * _2017;
    float _2029 = trunc(_2025);
    float _2031 = precise::max(_2029, 0.0);
    uint _2033 = uint(_2031);
    int _2035 = _2001 * int(_2023);
    int _2037 = _2035 + _1993;
    float _2039 = trunc(_2027);
    float _2041 = precise::max(_2039, 0.0);
    uint _2043 = uint(_2041);
    float _2045 = float(uint(_2037));
    int _2047 = _2011 * int(_2033);
    int _2049 = _2047 + _2007;
    float _2051 = as_type<float>(_1693) * _2045;
    float _2053 = float(uint(_2049));
    int _2055 = ~_1637;
    int _2057 = _2055 + 1;
    float _2059 = trunc(_2051);
    float _2061 = precise::max(_2059, 0.0);
    uint _2063 = uint(_2061);
    float _2065 = as_type<float>(_1707) * _2053;
    float _2067 = float(uint(_1971));
    int _2069 = _2057 * int(_2043);
    int _2071 = _2069 + _1911;
    float _2073 = trunc(_2065);
    float _2075 = precise::max(_2073, 0.0);
    uint _2077 = uint(_2075);
    float _2079 = as_type<float>(_1707) * _2067;
    float _2081 = float(uint(_2071));
    int _2083 = ~_1653;
    int _2085 = _2083 + 1;
    float _2087 = as_type<float>(_1693) * _2081;
    float _2089 = trunc(_2079);
    float _2091 = precise::max(_2089, 0.0);
    uint _2093 = uint(_2091);
    int _2095 = int(_2023) + int(_2063);
    int _2097 = ~_1653;
    int _2099 = _2097 + 1;
    float _2101 = trunc(_2087);
    float _2103 = precise::max(_2101, 0.0);
    uint _2105 = uint(_2103);
    int _2107 = int(_2033) + int(_2077);
    int _2109 = _1989 * _2095;
    int _2111 = _2109 + _1993;
    float _2113 = as_type<float>(_2085);
    if (_1144)
    {
        _2113 = 1.0;
    }
    float _2115 = _2113;
    int _2117 = _2085 * _2107;
    int _2119 = _2117 + _2007;
    bool _2121 = uint(_2111) >= uint(_1637);
    int _2123 = _2099 * int(_2093);
    int _2125 = _2123 + _1971;
    bool _2127 = !_2121;
    int _2129 = _2127 ? 0 : (-1);
    bool _2131 = uint(_2119) >= uint(_1653);
    float _2133 = float(uint(_2125));
    int _2135 = ~_2095;
    int _2137 = _2135 + _2129;
    int _2139 = _2137 + 1;
    bool _2141 = !_2131;
    int _2143 = _2141 ? 0 : (-1);
    float _2145 = as_type<float>(_1707) * _2133;
    int _2147 = int(_2043) + int(_2105);
    int _2149 = _1637 * _2139;
    int _2151 = _2149 + _1993;
    int _2153 = ~_2107;
    int _2155 = _2153 + _2143;
    int _2157 = _2155 + 1;
    float _2159 = _2115;
    if (!_1144)
    {
        int _2161 = _1206 << 4;
        int _2163 = _2161 + 2048;
        uint _2165 = uint(int(uint(_2163) >> uint(2)));
        uint _2167 = uint(int(uint(int(_2165)) >> uint(2)));
        int _2169 = int(_2165) & 3;
        float _2171 = (*spvDescriptorSet0.vp_c15)._m0[int(_2167)][_2169];
        int _2173 = int(_2165) + 1;
        uint _2175 = uint(int(uint(_2173) >> uint(2)));
        int _2177 = _2173 & 3;
        float _2179 = (*spvDescriptorSet0.vp_c15)._m0[int(_2175)][_2177];
        int _2181 = _2163 + 8;
        uint _2183 = uint(int(uint(_2181) >> uint(2)));
        uint _2185 = uint(int(uint(int(_2183)) >> uint(2)));
        int _2187 = int(_2183) & 3;
        float _2189 = (*spvDescriptorSet0.vp_c15)._m0[int(_2185)][_2187];
        int _2191 = int(_2183) + 1;
        uint _2193 = uint(int(uint(_2191) >> uint(2)));
        int _2195 = _2191 & 3;
        float _2197 = (*spvDescriptorSet0.vp_c15)._m0[int(_2193)][_2195];
        float _2199 = _925 * _2179;
        float _2201 = fma(_255, _2171, _2199);
        float _2203 = fma(_261, _2189, _2201);
        float _2205 = _2203 + _2197;
        float _2207 = precise::clamp(_2205, 0.0, 1.0);
        float _2209 = -_2207;
        float _2211 = _2209 + _1633;
        float _2213 = fma(_2211, 500.0, 1.5);
        float _2215 = exp2(_2213);
        float _2217 = 0.0 + _2215;
        float _2219 = precise::clamp(_2217, 0.0, 1.0);
        _1214 = as_type<float>(_2163);
        _2159 = _2219;
    }
    float _2221 = _1214;
    float _2223 = _2159;
    float _2225 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2227 = _1408 + _2225;
    float _2229 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2231 = _1410 + _2229;
    float _2233 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2235 = _1412 + _2233;
    float _2237 = _2227 * _2227;
    float _2239 = fma(_2231, _2231, _2237);
    float _2241 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2243 = fma(_2235, _2235, _2239);
    float _2245 = rsqrt(_2243);
    float _2247 = sqrt(_2243);
    float _2249 = _2245 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2251 = _2231 * _2249;
    float _2253 = _2235 * _2249;
    float _2255 = _2251 * _2251;
    float _2257 = _2253 * _2253;
    float _2259 = _2255 + _2257;
    float _2261 = sqrt(_2259);
    bool _2263 = _2261 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2265 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2267 = _2261 + _2265;
    float _2269 = as_type<float>(_2077);
    float _2271 = _2259;
    float _2273 = _2267;
    float _2275 = _2221;
    float _2277 = _2241;
    float _2279 = _2251;
    float _2281 = _2253;
    float _2283 = _2255;
    float _2285 = _2257;
    if (_2263)
    {
        float _2287 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2269 = _2287;
    }
    float _2289 = _2269;
    if (_2263)
    {
        float _2291 = rsqrt(_2259);
        _2271 = _2291;
    }
    float _2293 = _2271;
    if (_2263)
    {
        float _2295 = _2267 * _2289;
        _2273 = _2295;
    }
    float _2297 = _2273;
    float _2299 = precise::max(0.0, _2241);
    float _2301 = _2299;
    if (_2263)
    {
        float _2303 = _2297 * 0.15915493667125701904296875;
        _2275 = _2303;
    }
    float _2305 = _2275;
    float _2307 = -_2249;
    float _2309 = -_2299;
    float _2311 = fma(_2227, _2307, _2309);
    float _2313 = _261;
    float _2315 = _2311;
    if (_2263)
    {
        float _2317 = _2305 * 6.283185482025146484375;
        float _2319 = sin(_2317);
        _2313 = _2319;
    }
    float _2321 = _2313;
    if (_2263)
    {
        float _2323 = _2311 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2301 = _2323;
    }
    float _2325 = _2301;
    float _2327 = _2297;
    float _2329 = _2325;
    if (_2263)
    {
        float _2331 = _2305 * 6.283185482025146484375;
        float _2333 = cos(_2331);
        _2327 = _2333;
    }
    float _2335 = _2327;
    float _2337 = _2321;
    if (_2263)
    {
        float _2339 = fma(_2321, _2325, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2329 = _2339;
    }
    float _2341 = _2329;
    float _2343 = _2341;
    if (_2263)
    {
        float _2345 = _2293 * _2341;
        _2337 = _2345;
    }
    float _2347 = _2337;
    if (_2263)
    {
        float _2349 = _2335 + (-1.0);
        _2277 = _2349;
    }
    float _2351 = _2277;
    if (_2263)
    {
        float _2353 = _2251 * _2347;
        _2279 = _2353;
    }
    float _2355 = _2279;
    if (_2263)
    {
        float _2357 = _2253 * _2347;
        _2281 = _2357;
    }
    float _2359 = _2281;
    if (_2263)
    {
        float _2361 = _2351 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2343 = _2361;
    }
    float _2363 = _2343;
    if (_2263)
    {
        float _2365 = _2355 * _2355;
        _2283 = _2365;
    }
    float _2367 = _2283;
    if (_2263)
    {
        float _2369 = _2359 * _2359;
        _2285 = _2369;
    }
    float _2371 = _2285;
    int _2373 = ~_1637;
    int _2375 = _2373 + 1;
    if (_2263)
    {
        float _2377 = fma(_2311, _2335, _2363);
        _2315 = _2377;
    }
    float _2379 = _2315;
    float _2381 = fma(_2379, _2379, _2367);
    float _2383 = _2381 + _2371;
    float _2385 = rsqrt(_2383);
    float _2387 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2389 = fma(_2247, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2387);
    float _2391 = precise::clamp(_2389, 0.0, 1.0);
    float _2393 = -_2391;
    float _2395 = _2393 + 1.0;
    float _2397 = abs(_2395);
    float _2399 = log2(_2397);
    float _2401 = _2385 * _2355;
    float _2403 = _2385 * _2379;
    float _2405 = _2385 * _2359;
    float _2407 = _2401 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2409 = _2403 + 1.0;
    float _2411 = -_2407;
    float _2413 = fma(_2403, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2411);
    float _2415 = _2399 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2417 = -_2405;
    float _2419 = fma(_2417, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2413);
    float _2421 = fma(_2419, -0.5, 0.5);
    float _2423 = exp2(_2415);
    float _2425 = fma(_2419, 0.5, 0.5);
    float _2427 = fma(_2425, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2429 = sqrt(_2421);
    float _2431 = fma(_2425, _2427, -0.212114393711090087890625);
    float _2433 = fma(_2425, _2431, 1.570728778839111328125);
    float _2435 = -_2403;
    float _2437 = fma(_2423, _2409, _2435);
    bool _2439 = !_1907;
    int _2441 = _2439 ? _2151 : (-1);
    float _2443 = fma(_2437, 0.5, 0.5);
    int _2445 = _2441 & 3;
    bool _2447 = _2445 != 0;
    float _2449 = _2429 * 0.636619746685028076171875;
    int _2451 = _2441 & 3;
    bool _2453 = _2451 != 0;
    float _2455 = -_2433;
    float _2457 = fma(_2449, _2455, 1.0);
    int _2459 = _2375 * _2147;
    int _2461 = _2459 + _1911;
    bool _2463 = uint(_2451) > 1u;
    float2 _7563 = float2(_2457, _2443);
    float3 _2467 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7563, float2(0.0), isnan(_7563)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7563, float2(0.0), isnan(_7563)), level(0.0)).xyz;
    float _2469 = _2467.x;
    float _2471 = _2467.y;
    float _2473 = _2467.z;
    int _2475 = _1653 * _2157;
    int _2477 = _2475 + _2007;
    int _2479 = _2441 >> 31;
    float _2481 = trunc(_2145);
    float _2483 = precise::max(_2481, 0.0);
    uint _2485 = uint(_2483);
    bool _2487 = uint(_2461) >= uint(_1637);
    float _2489 = _1478 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2491 = _2447 ? 0 : 1;
    float _2493 = _2399 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2495 = _297 > 0.5;
    float _2497 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2489);
    int _2499 = ~_2491;
    int _2501 = _2499 + 1;
    int _2503 = _2501 + 1;
    float _2505 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2507 = !_1927;
    int _2509 = _2507 ? _2477 : (-1);
    float _2511 = -_277;
    float _2513 = _2511 + 1.0;
    int _2515 = _2503;
    if (!_2463)
    {
        int _2517 = ~_2491;
        int _2519 = _2517 + 1;
        _2515 = _2519;
    }
    int _2521 = _2515;
    float _2523 = -_809;
    float _2525 = _2523 + 1.0;
    int _2527 = _2479 & 3;
    float _2529 = -_705;
    float _2531 = _2529 + 1.0;
    int _2533 = _2509 >> 31;
    float _2535 = exp2(_2493);
    int _2537 = _2441 + _2527;
    float _2539 = -_811;
    float _2541 = _2539 + 1.0;
    int _2543 = _2533 & 3;
    float _2545 = -_761;
    float _2547 = _2545 + 1.0;
    bool _2549 = !_2487;
    int _2551 = _2549 ? 0 : (-1);
    bool _2553 = _2451 != 3;
    int _2555 = _2537 >> 2;
    int _2557 = _2509 + _2543;
    int _2559 = ~_2147;
    int _2561 = _2559 + _2551;
    int _2563 = _2561 + 1;
    bool _2565 = uint(_2451) >= 2u;
    float _2567 = -_2535;
    float _2569 = _2567 + 1.0;
    int _2571 = _2555 << 4;
    int _2573 = _2571 + 368;
    int _2575 = _1637 * _2563;
    int _2577 = _2575 + _1911;
    int _2579 = _2557 >> 2;
    float _2581 = _2569 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2583 = _2565 ? 0 : 1;
    uint _2585 = uint(int(uint(_2573) >> uint(2)));
    uint _2587 = uint(int(uint(int(_2585)) >> uint(2)));
    int _2589 = int(_2585) & 3;
    float _2591 = (*spvDescriptorSet0.vp_c9)._m0[int(_2587)][_2589];
    int _2593 = int(_2585) + 1;
    uint _2595 = uint(int(uint(_2593) >> uint(2)));
    int _2597 = _2593 & 3;
    float _2599 = (*spvDescriptorSet0.vp_c9)._m0[int(_2595)][_2597];
    int _2601 = _2579 << 4;
    int _2603 = _2601 + 512;
    int _2605 = ~_2583;
    int _2607 = _2605 + 1;
    int _2609 = _2607 + 1;
    int _2611 = _2609;
    if (_2553)
    {
        int _2613 = ~_2583;
        int _2615 = _2613 + 1;
        _2611 = _2615;
    }
    int _2617 = _2611;
    int _2619 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2621 = _2619 != 0;
    uint _2623 = uint(int(uint(_2603) >> uint(2)));
    uint _2625 = uint(int(uint(int(_2623)) >> uint(2)));
    int _2627 = int(_2623) & 3;
    float _2629 = (*spvDescriptorSet0.vp_c9)._m0[int(_2625)][_2627];
    int _2631 = int(_2623) + 1;
    uint _2633 = uint(int(uint(_2631) >> uint(2)));
    int _2635 = _2631 & 3;
    float _2637 = (*spvDescriptorSet0.vp_c9)._m0[int(_2633)][_2635];
    bool _2639 = !_2453;
    int _2641 = _2639 ? 0 : 1;
    int _2643 = _2509 & 3;
    bool _2645 = _2643 != 0;
    int _2647 = int(_2093) + int(_2485);
    int _2649 = ~_1653;
    int _2651 = _2649 + 1;
    bool _2653 = !_2621;
    int _2655 = _2653 ? 0 : 1;
    bool _2657 = uint(_2643) > 1u;
    int _2659 = _2651 * _2647;
    int _2661 = _2659 + _1971;
    float _2663 = -_191;
    int _2665 = _2495 ? as_type<int>(_2663) : as_type<int>(_191);
    bool _2667 = _2451 != 3;
    int _2669 = _2509 & 3;
    bool _2671 = _2669 != 0;
    bool _2673 = !_1907;
    int _2675 = _2673 ? _2577 : (-1);
    int _2677 = _2573 + 8;
    uint _2679 = uint(int(uint(_2677) >> uint(2)));
    uint _2681 = uint(int(uint(int(_2679)) >> uint(2)));
    int _2683 = int(_2679) & 3;
    float _2685 = (*spvDescriptorSet0.vp_c9)._m0[int(_2681)][_2683];
    int _2687 = int(_2679) + 1;
    uint _2689 = uint(int(uint(_2687) >> uint(2)));
    int _2691 = _2687 & 3;
    float _2693 = (*spvDescriptorSet0.vp_c9)._m0[int(_2689)][_2691];
    int _2695 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2697 = _2695 != 0;
    int _2699 = _2671 ? 0 : 1;
    bool _2701 = !_2697;
    int _2703 = _2701 ? 0 : 1;
    bool _2705 = uint(_2661) >= uint(_1653);
    int _2707 = _2603 + 8;
    uint _2709 = uint(int(uint(_2707) >> uint(2)));
    uint _2711 = uint(int(uint(int(_2709)) >> uint(2)));
    int _2713 = int(_2709) & 3;
    float _2715 = (*spvDescriptorSet0.vp_c9)._m0[int(_2711)][_2713];
    int _2717 = int(_2709) + 1;
    uint _2719 = uint(int(uint(_2717) >> uint(2)));
    int _2721 = _2717 & 3;
    float _2723 = (*spvDescriptorSet0.vp_c9)._m0[int(_2719)][_2721];
    bool _2725 = _2643 != 3;
    bool _2727 = !_2667;
    int _2729 = _2727 ? 0 : (-1);
    bool _2731 = !_2645;
    int _2733 = _2731 ? 0 : 1;
    bool _2735 = uint(_2643) >= 2u;
    bool _2737 = _2643 != 3;
    int _2739 = ~_2699;
    int _2741 = _2739 + 1;
    int _2743 = _2741 + 1;
    int _2745 = _2743;
    if (!_2657)
    {
        int _2747 = ~_2699;
        int _2749 = _2747 + 1;
        _2745 = _2749;
    }
    int _2751 = _2745;
    int _2753 = _2735 ? 0 : 1;
    bool _2755 = !_2737;
    int _2757 = _2755 ? 0 : (-1);
    int _2759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2761 = _2759 != 0;
    int _2763 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2765 = _2763 != 0;
    int _2767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2769 = _2767 != 0;
    bool _2771 = !_2705;
    int _2773 = _2771 ? 0 : (-1);
    int _2775 = abs(_2521);
    bool _2777 = _291 > 0.5;
    int _2779 = ~_2647;
    int _2781 = _2779 + _2773;
    int _2783 = _2781 + 1;
    int _2785 = ~_2753;
    int _2787 = _2785 + 1;
    int _2789 = _2787 + 1;
    int _2791 = _1653 * _2783;
    int _2793 = _2791 + _1971;
    int _2795 = _2789;
    if (_2725)
    {
        int _2797 = ~_2753;
        int _2799 = _2797 + 1;
        _2795 = _2799;
    }
    int _2801 = _2795;
    int _2803 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2805 = _2803 != 0;
    int _2807 = abs(_2751);
    int _2809 = abs(_2641);
    int _2811 = ~_2775;
    int _2813 = _2811 + 1;
    int _2815 = _2813 + 1;
    int _2817 = abs(_2733);
    int _2819 = _2815 * as_type<int>(_2599);
    int _2821 = ~_2807;
    int _2823 = _2821 + 1;
    int _2825 = _2823 + 1;
    int _2827 = ~_2809;
    int _2829 = _2827 + 1;
    int _2831 = _2829 + 1;
    int _2833 = _2825 * as_type<int>(_2637);
    int _2835 = abs(_2801);
    int _2837 = abs(_2617);
    int _2839 = ~_2817;
    int _2841 = _2839 + 1;
    int _2843 = _2841 + 1;
    int _2845 = _2831 * as_type<int>(_2591);
    int _2847 = _2845 + _2819;
    int _2849 = ~_2837;
    int _2851 = _2849 + 1;
    int _2853 = _2851 + 1;
    float _2855 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2857 = int(_2855);
    bool _2859 = !_1927;
    int _2861 = _2859 ? _2793 : (-1);
    int _2863 = _2843 * as_type<int>(_2629);
    int _2865 = _2863 + _2833;
    bool _2867 = _293 > 0.5;
    int _2869 = _2853 * as_type<int>(_2685);
    int _2871 = _2869 + _2847;
    int _2873 = abs(_2729);
    int _2875 = abs(_2757);
    float _2877 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2879 = int(_2877);
    int _2881 = ~_2835;
    int _2883 = _2881 + 1;
    int _2885 = _2883 + 1;
    int _2887 = _2885 * as_type<int>(_2715);
    int _2889 = _2887 + _2865;
    int _2891 = ~_2875;
    int _2893 = _2891 + 1;
    int _2895 = _2893 + 1;
    float _2897 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2899 = _2895 * as_type<int>(_2723);
    int _2901 = _2899 + _2889;
    float _2903 = float(uint(_2857));
    float _2905 = abs(_941);
    float _2907 = log2(_2905);
    float _2909 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2911 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2913 = ~_2873;
    int _2915 = _2913 + 1;
    int _2917 = _2915 + 1;
    float _2919 = _2897 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2921 = abs(_2655);
    float _2923 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2925 = 1.0 / _2903;
    float _2927 = _2909 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2929 = _2911 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2931 = ~_2921;
    int _2933 = _2931 + 1;
    int _2935 = _2933 + 1;
    int _2937 = _2917 * as_type<int>(_2693);
    int _2939 = _2937 + _2871;
    float _2941 = -_187;
    int _2943 = _2777 ? as_type<int>(_2941) : as_type<int>(_187);
    bool _2945 = _295 > 0.5;
    out.m_78.x = _2919;
    out.m_78.y = _2927;
    out.m_78.z = _2929;
    out.m_78.w = _2923;
    float _2947 = _2907 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2949 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2951 = abs(_2857);
    float _2953 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2955 = float(uint(_2879));
    float _2957 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2959 = _2949 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2961 = _2953 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2963 = as_type<int>(_2925) + (-2);
    int _2965 = _2939 * _2935;
    float _2967 = 1.0 / _2955;
    int _2969 = abs(_2703);
    int _2971 = _2675 * _2921;
    int _2973 = _2971 + _2965;
    float _2975 = float(uint(_2951));
    float _2977 = _2957 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2979 = ~_2969;
    int _2981 = _2979 + 1;
    int _2983 = _2981 + 1;
    float _2985 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2987 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2989 = abs(_2879);
    float _2991 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2993 = float(uint(_2973));
    float _2995 = exp2(_2947);
    out.m_80.x = _2959;
    out.m_80.y = _2961;
    out.m_80.z = _2977;
    int _2997 = _2901 * _2983;
    float _2999 = float(uint(_2989));
    float _3001 = -_989;
    float _3003 = fma(_3001, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2985);
    float _3005 = -_989;
    float _3007 = fma(_3005, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2987);
    int _3009 = _2861 * _2969;
    int _3011 = _3009 + _2997;
    float _3013 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3015 = 1.0 / _2975;
    float _3017 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _3019 = !_2761;
    float _3021 = _3019 ? _191 : as_type<float>(_2665);
    int _3023 = abs(_3011);
    float _3025 = -_989;
    float _3027 = fma(_3025, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2991);
    float _3029 = as_type<float>(_2963) * _2993;
    float _3031 = 1.0 / _2999;
    int _3033 = as_type<int>(_2967) + (-2);
    float _3035 = float(uint(_3011));
    float _3037 = fma(_2995, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3039 = precise::clamp(_3037, 0.0, 1.0);
    int _3041 = abs(_2973);
    int _3043 = ~_2857;
    int _3045 = _3043 + 1;
    float _3047 = trunc(_3029);
    float _3049 = precise::max(_3047, 0.0);
    uint _3051 = uint(_3049);
    float _3053 = as_type<float>(_3033) * _3035;
    int _3055 = as_type<int>(_3015) + (-2);
    float _3057 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3007);
    float _3059 = float(uint(_3041));
    float _3061 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3013);
    float _3063 = float(uint(_3023));
    int _3065 = as_type<int>(_3031) + (-2);
    float _3067 = as_type<float>(_3055) * _3059;
    float _3069 = trunc(_3053);
    float _3071 = precise::max(_3069, 0.0);
    uint _3073 = uint(_3071);
    float _3075 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3003);
    int _3077 = ~_2879;
    int _3079 = _3077 + 1;
    float _3081 = as_type<float>(_3065) * _3063;
    float _3083 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3085 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3027);
    int _3087 = _3045 * int(_3051);
    int _3089 = _3087 + _2973;
    float _3091 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3017);
    float _3093 = trunc(_3067);
    float _3095 = precise::max(_3093, 0.0);
    uint _3097 = uint(_3095);
    float _3099 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _3101 = _941 <= 8000.0;
    bool _3103 = isnan(_941);
    bool _3105 = _3101 || _3103;
    bool _3107 = isnan(8000.0);
    bool _3109 = _3105 || _3107;
    float _3111 = float(_3109);
    float _3113 = float(uint(_3089));
    float _3115 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3083);
    int _3117 = ~_2951;
    int _3119 = _3117 + 1;
    float _3121 = trunc(_3081);
    float _3123 = precise::max(_3121, 0.0);
    uint _3125 = uint(_3123);
    float _3127 = as_type<float>(_2963) * _3113;
    float _3129 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3131 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3133 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3099);
    int _3135 = ~_2989;
    int _3137 = _3135 + 1;
    int _3139 = _3079 * int(_3073);
    int _3141 = _3139 + _3011;
    float _3143 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3129);
    int _3145 = _3119 * int(_3097);
    int _3147 = _3145 + _3041;
    float _3149 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3131);
    bool _3151 = !_2805;
    float _3153 = _3151 ? _187 : as_type<float>(_2943);
    float _3155 = trunc(_3127);
    float _3157 = precise::max(_3155, 0.0);
    uint _3159 = uint(_3157);
    float _3161 = float(uint(_3141));
    float _3163 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3133);
    float _3165 = float(uint(_3147));
    int _3167 = _3137 * int(_3125);
    int _3169 = _3167 + _3023;
    float _3171 = -_191;
    int _3173 = _2867 ? as_type<int>(_3171) : as_type<int>(_191);
    float _3175 = as_type<float>(_3033) * _3161;
    float _3177 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3061);
    float _3179 = as_type<float>(_3055) * _3165;
    float _3181 = -_187;
    int _3183 = _2945 ? as_type<int>(_3181) : as_type<int>(_187);
    float _3185 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3091);
    float _3187 = float(uint(_3169));
    float _3189 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3115);
    bool _3191 = !_2769;
    float _3193 = _3191 ? _187 : as_type<float>(_3183);
    float _3195 = trunc(_3175);
    float _3197 = precise::max(_3195, 0.0);
    uint _3199 = uint(_3197);
    float _3201 = as_type<float>(_3065) * _3187;
    bool _3203 = !_2765;
    float _3205 = _3203 ? _191 : as_type<float>(_3173);
    float _3207 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3209 = _3039 * _3039;
    float _3211 = fma(_3039, -2.0, 3.0);
    float _3213 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3143);
    float _3215 = trunc(_3179);
    float _3217 = precise::max(_3215, 0.0);
    uint _3219 = uint(_3217);
    float _3221 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3223 = _3207 * _3075;
    float _3225 = _3209 * _3211;
    float _3227 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3149);
    int _3229 = ~_2879;
    int _3231 = _3229 + 1;
    float _3233 = fma(_3221, _3177, _3223);
    int _3235 = ~_2857;
    int _3237 = _3235 + 1;
    float _3239 = trunc(_3201);
    float _3241 = precise::max(_3239, 0.0);
    uint _3243 = uint(_3241);
    int _3245 = int(_3073) + int(_3199);
    out.m_82.x = _3177;
    out.m_82.y = _3185;
    out.m_82.z = _3189;
    int _3247 = int(_3051) + int(_3159);
    int _3249 = _3231 * _3245;
    int _3251 = _3249 + _3011;
    int _3253 = ~_2951;
    int _3255 = _3253 + 1;
    int _3257 = ~_2989;
    int _3259 = _3257 + 1;
    int _3261 = _3237 * _3247;
    int _3263 = _3261 + _2973;
    int _3265 = int(_3097) + int(_3219);
    int _3267 = int(_3125) + int(_3243);
    bool _3269 = uint(_3251) >= uint(_2879);
    bool _3271 = uint(_3263) >= uint(_2857);
    int _3273 = _3255 * _3265;
    int _3275 = _3273 + _3041;
    bool _3277 = _2879 == 0;
    int _3279 = _3259 * _3267;
    int _3281 = _3279 + _3023;
    bool _3283 = !_3269;
    int _3285 = _3283 ? 0 : (-1);
    float _3287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3289 = uint(_3275) >= uint(_2951);
    int _3291 = _2973 ^ _2857;
    bool _3293 = !_3271;
    int _3295 = _3293 ? 0 : (-1);
    bool _3297 = uint(_3281) >= uint(_2989);
    bool _3299 = !_3289;
    int _3301 = _3299 ? 0 : (-1);
    uint _3303 = uint(int(uint(_3291) >> uint(31)));
    int _3305 = ~_3247;
    int _3307 = _3305 + _3295;
    int _3309 = _3307 + 1;
    int _3311 = ~_3301;
    int _3313 = _3265 + _3311;
    int _3315 = _3313 + 1;
    float _3317 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3319 = ~int(_3303);
    int _3321 = _3319 + 1;
    float _3323 = _3287 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3325 = _2857 == 0;
    bool _3327 = _2857 == 0;
    int _3329 = _2857 * _3309;
    int _3331 = _3329 + _2973;
    int _3333 = _3315 ^ _3321;
    int _3335 = ~_3245;
    int _3337 = _3335 + _3285;
    int _3339 = _3337 + 1;
    int _3341 = _3011 ^ _2879;
    int _3343 = ~_3321;
    int _3345 = _3343 + _3333;
    int _3347 = _3345 + 1;
    int _3349 = _2879 * _3339;
    int _3351 = _3349 + _3011;
    bool _3353 = !_3297;
    int _3355 = _3353 ? 0 : (-1);
    float _3357 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _3359 = uint(int(uint(_3341) >> uint(31)));
    float _3361 = _2505 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3363 = _2879 == 0;
    float _3365 = fma(_3207, _3207, 1.0);
    int _3367 = ~_3355;
    int _3369 = _3267 + _3367;
    int _3371 = _3369 + 1;
    int _3373 = ~int(_3359);
    int _3375 = _3373 + 1;
    bool _3377 = !_3325;
    int _3379 = _3377 ? _3331 : (-1);
    float _3381 = rsqrt(_3365);
    bool _3383 = !_3277;
    int _3385 = _3383 ? _3351 : (-1);
    int _3387 = _3371 ^ _3375;
    float _3389 = float(_3379);
    float _3391 = float(_3385);
    int _3393 = ~_3375;
    int _3395 = _3393 + _3387;
    int _3397 = _3395 + 1;
    float _3399 = fma(_3323, _3389, _791);
    bool _3401 = !_3327;
    int _3403 = _3401 ? _3347 : (-1);
    float _3405 = fma(_3361, _3391, _737);
    float _3407 = _3153 + 0.5;
    bool _3409 = !_3363;
    int _3411 = _3409 ? _3397 : (-1);
    float _3413 = _3317 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3415 = float(_3403);
    float _3417 = fma(_3323, _3407, _3399);
    float _3419 = float(_3411);
    float _3421 = _3357 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3423 = _3193 + 0.5;
    float _3425 = -_697;
    float _3427 = fma(_3413, _3415, _3425);
    float _3429 = _3021 + (-0.5);
    float _3431 = -_813;
    float _3433 = fma(_3421, _3419, _3431);
    float _3435 = fma(_3361, _3423, _3405);
    float _3437 = _3205 + (-0.5);
    float _3439 = _3207 * _3381;
    float _3441 = -_3421;
    float _3443 = fma(_3441, _3429, _3433);
    float _3445 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2497);
    float _3447 = -_3225;
    float _3449 = _3447 + 1.0;
    float _3451 = -_3413;
    float _3453 = fma(_3451, _3437, _3427);
    float _3455 = -_3163;
    float _3457 = _3439 * _3455;
    float _3459 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3445);
    float _3461 = fma(_3449, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3225);
    float _3463 = -_2525;
    float _3465 = fma(_3153, _3463, _3417);
    float _3467 = -_2531;
    float _3469 = fma(_3193, _3467, _3435);
    float _3471 = fma(_3205, _2541, _3453);
    float _3473 = _3111 * _3461;
    float _3475 = _3111;
    if (!_1502)
    {
        _3475 = 1.0;
    }
    float _3477 = _3475;
    float _3479 = fma(_3021, _2547, _3443);
    float _3481 = _3477;
    if (_1502)
    {
        bool _3483 = _1614 >= _1574;
        bool _3485 = isnan(_1614);
        bool _3487 = _3483 || _3485;
        bool _3489 = isnan(_1574);
        bool _3491 = _3487 || _3489;
        float _3493 = float(_3491);
        _3481 = _3493;
    }
    float _3495 = _3481;
    float _3497 = _3473 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3499 = fma(_3381, _3057, _3457);
    float _3501 = _3459 + _1522;
    float _3503 = _3207 * _3057;
    float _3505 = _2513 * _3497;
    float _3507 = precise::clamp(_3505, 0.0, 1.0);
    float _3509 = _2581 * _1616;
    float _3511 = _3207 * _3085;
    float _3513 = _3495 * _2223;
    float _3515 = -_3507;
    float _3517 = fma(_3515, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_84.x = _3465;
    out.m_84.y = _3471;
    out.m_84.z = _3469;
    out.m_84.w = _3479;
    float _3519 = _3501 * 0.5;
    float _3521 = -_3213;
    float _3523 = _3439 * _3521;
    float _3525 = fma(_3221, _3185, _3503);
    float _3527 = _2473 * _3509;
    float _3529 = -_3227;
    float _3531 = _3439 * _3529;
    float _3533 = fma(_3221, _3189, _3511);
    float _3535 = -_3513;
    float _3537 = fma(_3535, _3517, 1.0);
    float _3539 = precise::clamp(_3537, 0.0, 1.0);
    float _3541 = fma(_3381, _3075, _3523);
    float _3543 = _3163 + _3525;
    out.m_86.z = _3519;
    out.m_86.w = _1522;
    float _3545 = fma(_3381, _3085, _3531);
    float _3547 = _3213 + _3233;
    float _3549 = _1627 * _3509;
    float _3551 = -_2581;
    float _3553 = _3551 + 1.0;
    float _3555 = _3227 + _3533;
    float _3557 = fma(_2469, _3549, _1621);
    float _3559 = fma(_2471, _3549, _1623);
    float _3561 = _1627 * _3553;
    float _3563 = _3539 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3565 = fma(_1627, _3527, _1625);
    out.m_88.x = _3541;
    out.m_88.y = _3499;
    out.m_88.z = _3545;
    bool _3567 = _2247 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3569 = isnan(_2247);
    bool _3571 = _3567 || _3569;
    bool _3573 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3575 = _3571 || _3573;
    out.gl_Position.x = _1542;
    out.gl_Position.y = _1558;
    out.gl_Position.z = _3459;
    out.gl_Position.w = _1522;
    out.m_90.x = _3563;
    out.m_92.x = _3557;
    out.m_92.y = _3559;
    out.m_92.z = _3565;
    out.m_92.w = _3561;
    float _3577 = _3519;
    float _3579 = _3553;
    float _3581 = _3513;
    float _3583 = _3539;
    float _3585 = _3507;
    if (!_3575)
    {
        _3577 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3587 = _3577;
    out.m_94.x = _3547;
    out.m_94.y = _3543;
    out.m_94.z = _3555;
    float _3589 = _3587;
    float _3591 = _3587;
    if (!_3575)
    {
        _1550 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3593 = _1550;
    float _3595 = _3593;
    float _3597 = _3593;
    if (!_3575)
    {
        _3579 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3599 = _3579;
    float _3601 = _3599;
    float _3603 = _3599;
    if (!_3575)
    {
        _3581 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3605 = _3581;
    float _3607 = _3605;
    float _3609 = _3605;
    if (!_3575)
    {
        _3583 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3611 = _3583;
    float _3613 = _3611;
    float _3615 = _3611;
    if (!_3575)
    {
        _3585 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3617 = _3585;
    bool _3619 = !_3575;
    float _3621 = _3617;
    float _3623 = _3617;
    if (!_3619)
    {
        bool _3625 = _2247 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3627 = isnan(_2247);
        bool _3629 = _3625 || _3627;
        bool _3631 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3633 = _3629 || _3631;
        if (!_3633)
        {
            float _3635 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3637 = _2247 + _3635;
            float _3639 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3641 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3639;
            float _3643 = 1.0 / _3641;
            float _3645 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3647 = _3645 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3649 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3651 = _3649 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3653 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3655 = _3653 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3657 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3659 = _3657 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3661 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3663 = _3661 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3665 = _3637 * _3643;
            float _3667 = precise::clamp(_3665, 0.0, 1.0);
            float _3669 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3671 = _3669 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3673 = fma(_3667, _3647, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3675 = fma(_3667, _3671, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3677 = fma(_3667, _3651, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3679 = fma(_3667, _3655, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3681 = fma(_3667, _3659, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3683 = fma(_3667, _3663, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3597 = _3675;
            _3615 = _3681;
            _3591 = _3673;
            _3609 = _3679;
            _3603 = _3677;
            _3623 = _3683;
            _3685 = true;
        }
        else
        {
            bool _3687 = _2247 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3689 = isnan(_2247);
            bool _3691 = _3687 || _3689;
            bool _3693 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3695 = _3691 || _3693;
            if (!_3695)
            {
                _3589 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3697 = _3589;
            _3591 = _3697;
            if (!_3695)
            {
                _3595 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3699 = _3595;
            _3597 = _3699;
            if (!_3695)
            {
                _3601 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3701 = _3601;
            _3603 = _3701;
            if (!_3695)
            {
                _3607 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3703 = _3607;
            _3609 = _3703;
            if (!_3695)
            {
                _3613 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3705 = _3613;
            _3615 = _3705;
            if (!_3695)
            {
                _3621 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3707 = _3621;
            bool _3709 = !_3695;
            _3623 = _3707;
            if (!_3709)
            {
                bool _3711 = _2247 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3713 = isnan(_2247);
                bool _3715 = _3711 || _3713;
                bool _3717 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3719 = _3715 || _3717;
                if (!_3719)
                {
                    float _3721 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3723 = _2247 + _3721;
                    float _3725 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3727 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3725;
                    float _3729 = 1.0 / _3727;
                    float _3731 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3733 = _3731 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3735 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3737 = _3735 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3739 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3741 = _3739 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3743 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3745 = _3743 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3747 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3749 = _3747 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3751 = _3723 * _3729;
                    float _3753 = precise::clamp(_3751, 0.0, 1.0);
                    float _3755 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3757 = _3755 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3759 = fma(_3753, _3733, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3761 = fma(_3753, _3757, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3763 = fma(_3753, _3737, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3765 = fma(_3753, _3741, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3767 = fma(_3753, _3745, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3769 = fma(_3753, _3749, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3597 = _3761;
                    _3615 = _3767;
                    _3591 = _3759;
                    _3609 = _3765;
                    _3603 = _3763;
                    _3623 = _3769;
                    _3685 = true;
                }
                else
                {
                    _3597 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3615 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3591 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3609 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3603 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3623 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3685 = false;
    float _3771 = _3597;
    float _3773 = _3615;
    float _3775 = _3591;
    float _3777 = _3609;
    float _3779 = _3603;
    float _3781 = _3623;
    float _3783 = fma(_3543, -0.5, 0.5);
    float _3785 = precise::clamp(_3783, 0.0, 1.0);
    float _3787 = -_3771;
    float _3789 = _3787 + _3773;
    float _3791 = -_3775;
    float _3793 = _3791 + _3777;
    float _3795 = -_3779;
    float _3797 = _3795 + _3781;
    bool _3799 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3801 = fma(_3785, _3789, _3771);
    float _3803 = fma(_3785, _3793, _3775);
    float _3805 = fma(_3785, _3797, _3779);
    float _3807 = _3801 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _3809 = fma(_3803, 0.298911988735198974609375, _3807);
    float _3811 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3813 = fma(_3805, 0.114477999508380889892578125, _3809);
    out.m_90.w = _3811;
    float _3815 = -_3813;
    float _3817 = _3803 + _3815;
    float _3819 = -_3813;
    float _3821 = _3801 + _3819;
    float _3823 = -_3813;
    float _3825 = _3805 + _3823;
    out.m_96.x = 0.0;
    float _3827 = fma(_3817, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3813);
    float _3829 = fma(_3821, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3813);
    float _3831 = fma(_3825, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3813);
    out.m_98.x = _3827;
    out.m_98.y = _3829;
    out.m_98.z = _3831;
    if (!_3799)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3833 = -_1408;
    float _3835 = _3833 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3837 = -_1410;
    float _3839 = _3837 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3841 = -_1412;
    float _3843 = _3841 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3845 = _3835 * _3835;
    float _3847 = fma(_3839, _3839, _3845);
    float _3849 = fma(_3843, _3843, _3847);
    float _3851 = sqrt(_3849);
    float _3853 = rsqrt(_3849);
    float _3855 = -_3851;
    float _3857 = _3855 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3859 = _3857 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3861 = precise::clamp(_3859, 0.0, 1.0);
    float _3863 = _3839 * _3853;
    float _3865 = _3835 * _3853;
    float _3867 = abs(_3861);
    float _3869 = log2(_3867);
    float _3871 = _3843 * _3853;
    float _3873 = _3863 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3875 = _3543 * _3865;
    float _3877 = -_3865;
    float _3879 = -_3873;
    float _3881 = fma(_3877, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3879);
    float _3883 = fma(_3547, _3863, _3875);
    float _3885 = -_3871;
    float _3887 = fma(_3885, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3881);
    float _3889 = fma(_3555, _3871, _3883);
    float _3891 = precise::clamp(_3889, 0.0, 1.0);
    float _3893 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3895 = _3887 + _3893;
    float _3897 = _3869 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3899 = _3895 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3901 = precise::clamp(_3899, 0.0, 1.0);
    float _3903 = exp2(_3897);
    float _3905 = _3903 * _3901;
    float _3907 = _3891 * _3905;
    float _3909 = _3907 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3911 = _3907 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3913 = _3907 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_96.x = _3909;
    out.m_96.y = _3911;
    out.m_96.z = _3913;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

