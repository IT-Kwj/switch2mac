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
    texture2d<float> vp_t_tcb_20 [[id(18)]];
    sampler vp_t_tcb_20Smplr [[id(19)]];
    sampler vp_t_tcb_24Smplr_w [[id(20)]];
    sampler vp_t_tcb_32Smplr_w [[id(21)]];
    sampler vp_t_tcb_30Smplr_w [[id(22)]];
    sampler vp_t_tcb_14Smplr_w [[id(23)]];
    sampler vp_t_tcb_1CSmplr_w [[id(24)]];
    sampler vp_t_tcb_20Smplr_w [[id(25)]];
    constant dm_border_t* dm_border [[id(26)]];
};

struct main0_out
{
    float4 m_76 [[user(locn0)]];
    float4 m_78 [[user(locn1)]];
    float4 m_84 [[user(locn2)]];
    float4 m_86 [[user(locn3)]];
    float4 m_98 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_82 [[user(locn6)]];
    float4 m_94 [[user(locn7)]];
    float4 m_74 [[user(locn8)]];
    float4 m_80 [[user(locn9)]];
    float4 m_96 [[user(locn10)]];
    float4 m_88 [[user(locn11)]];
    float4 m_90 [[user(locn12)]];
    float4 m_92 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_70 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_68 [[attribute(4)]];
    float4 m_72 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3787 = false;
    bool _213 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_58.w;
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
        out.m_61.x = 0.0;
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
        float _4072 = as_type<float>(_133);
        out.gl_Position.z = _4072;
    }
    if (!_121)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = in.m_63.w;
    bool _139 = _137 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_137);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = -_137;
    float _151 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _153 = 0.0;
    float _155 = _151;
    if (_147)
    {
        float _157 = float(_117);
        _153 = _157;
    }
    float _159 = _153;
    bool _161 = _151 >= _159;
    bool _163 = !_147;
    bool _165 = _161 || _163;
    if (_165)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _167 = _127;
    if (_165)
    {
        out.m_61.x = 0.0;
    }
    if (_165)
    {
        float _169 = _167 * 5.0;
        _135 = as_type<int>(_169);
    }
    int _171 = _135;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4141 = as_type<float>(_171);
        out.gl_Position.z = _4141;
    }
    if (_165)
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
        float _195 = in.m_68.x;
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
    float _223 = in.m_58.x;
    float _225 = in.m_58.y;
    float _227 = in.m_58.z;
    float _229 = _225 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _231 = _225 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _233 = fma(_223, (*spvDescriptorSet0.vp_c10)._m0[6].x, _229);
    float _235 = fma(_223, (*spvDescriptorSet0.vp_c10)._m0[4].x, _231);
    float _237 = fma(_227, (*spvDescriptorSet0.vp_c10)._m0[6].z, _233);
    float _239 = fma(_227, (*spvDescriptorSet0.vp_c10)._m0[4].z, _235);
    float _241 = _237 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _243 = _239 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _245 = fma(_241, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _247 = fma(_243, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _249 = floor(_245);
    float _251 = floor(_247);
    float _253 = -_249;
    float _255 = _245 + _253;
    float _257 = -_251;
    float _259 = _247 + _257;
    float2 _4290 = float2(_259, _255);
    float _261 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4290, float2(0.0), isnan(_4290)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4290, float2(0.0), isnan(_4290)), level(0.0)).x;
    float _263 = in.m_68.x;
    float _265 = in.m_68.y;
    float _267 = in.m_68.z;
    float _269 = in.m_68.w;
    float _271 = _225 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _273 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _275 = log2(_273);
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _283 = _281 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _285 = fma(_223, (*spvDescriptorSet0.vp_c10)._m0[5].x, _271);
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _289 = _221 + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _291;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _297 = _221 + _295;
    float _299 = 1.0 / _283;
    float _301 = fma(_227, (*spvDescriptorSet0.vp_c10)._m0[5].z, _285);
    int _303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _305 = _303 != 0;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _309 = 1.0 / _279;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _313 = float(_117);
    float _315 = _263 * 2.0;
    float _317 = _265 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _319;
    float _323 = _289 * _299;
    float _325 = _267 * 2.0;
    float _327 = 1.0 / _293;
    float _329 = _263 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _331 = fma(_317, -2.0, _311);
    float _333 = _267 + _263;
    float _335 = _297 * _309;
    float _337 = _263 + _265;
    float _339 = floor(_325);
    float _341 = _265 * 2.0;
    float _343 = -_307;
    float _345 = fma(_329, 2.0, _343);
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _349 = _221 + _347;
    float _351 = _333 + (-1.0);
    float _353 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[76].y, _331);
    float _355 = -_151;
    float _357 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[76].x, _345);
    float _359 = floor(_315);
    float _361 = _349 * _327;
    float _363 = fma(_321, _361, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _365 = floor(_341);
    float _367 = _337 + (-1.0);
    float _369 = _267 + _265;
    bool _371 = _339 > 0.0;
    float _373 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _375 = _369 + (-1.0);
    float _377 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _379 = _359 >= 0.0;
    bool _381 = isnan(_359);
    bool _383 = _379 || _381;
    bool _385 = isnan(0.0);
    bool _387 = _383 || _385;
    float _389 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _391 = int(_389);
    float _393 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _395 = as_type<int>(_375);
    float _397 = _313;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_305)
    {
        _395 = 0;
    }
    int _401 = _395;
    int _403 = _401;
    if (!_305)
    {
        _403 = 1;
    }
    int _405 = _403;
    bool _407 = _339 >= 0.0;
    bool _409 = isnan(_339);
    bool _411 = _407 || _409;
    bool _413 = isnan(0.0);
    bool _415 = _411 || _413;
    bool _417 = _359 > 0.0;
    float _419 = 1.0 / _313;
    bool _421 = _365 > 0.0;
    bool _423 = _365 >= 0.0;
    bool _425 = isnan(_365);
    bool _427 = _423 || _425;
    bool _429 = isnan(0.0);
    bool _431 = _427 || _429;
    float _433 = _387 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _435 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _437 = int(_435);
    bool _439 = _405 != 1;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _441;
    int _445 = _415 ? 0 : 1;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _447;
    float _451 = _431 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _457 = ~_445;
    int _459 = _457 + 1;
    int _461 = _459 + 1;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _465 = _463 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _467 = _461;
    float _469 = _451;
    float _471 = _433;
    if (!_371)
    {
        int _473 = ~_445;
        int _475 = _473 + 1;
        _467 = _475;
    }
    int _477 = _467;
    float _479 = fma(_443, _335, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _483 = _481 != 0;
    int _485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _487 = _485 != 0;
    int _489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _491 = _489 != 0;
    float _493 = fma(_449, _335, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _495 = fma(_455, _323, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _497 = fma(_465, _323, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _499 = ~as_type<int>(_451);
    int _501 = _499 + 1;
    int _503 = _501 + 1;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _505;
    int _509 = _503;
    if (!_421)
    {
        int _511 = ~as_type<int>(_451);
        int _513 = _511 + 1;
        _509 = _513;
    }
    int _515 = _509;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _519 = fma(_507, _361, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    if (!_439)
    {
        _469 = _267;
    }
    float _521 = _469;
    bool _523 = !_487;
    int _525 = _523 ? 0 : 1;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _529 = !_483;
    int _531 = _529 ? 0 : 1;
    bool _533 = !_491;
    int _535 = _533 ? 0 : 1;
    int _537 = ~as_type<int>(_433);
    int _539 = _537 + 1;
    int _541 = _539 + 1;
    float _543 = _521;
    int _545 = _541;
    if (_439)
    {
        _543 = _265;
    }
    float _547 = _543;
    int _549 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _551 = _549 != 0;
    int _553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _555 = _553 != 0;
    int _557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _559 = _557 != 0;
    float _561 = _547;
    if (!_417)
    {
        int _563 = ~as_type<int>(_433);
        int _565 = _563 + 1;
        _545 = _565;
    }
    int _567 = _545;
    float _569 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[83].w, _517);
    if (!_439)
    {
        _471 = _265;
    }
    float _571 = _471;
    float _573 = _571;
    if (_439)
    {
        _573 = _263;
    }
    float _575 = _573;
    bool _577 = !_555;
    int _579 = _577 ? 0 : 1;
    bool _581 = !_551;
    int _583 = _581 ? 0 : 1;
    float _585 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[83].z, _527);
    if (!_439)
    {
        _397 = _267;
    }
    float _587 = _397;
    float _589 = _587;
    if (!_439)
    {
        _561 = _265;
    }
    float _591 = _561;
    float _593 = _591;
    if (_439)
    {
        _589 = _265;
    }
    float _595 = _589;
    float _597 = float(_391);
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _601 = abs(_579);
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (_439)
    {
        _593 = _263;
    }
    float _605 = _593;
    float _607 = 1.0 / _597;
    int _609 = abs(_583);
    float _611 = _595 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _613 = float(_567);
    float _615 = _605 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _617 = float(_609);
    float _619 = _275 * _151;
    float _621 = float(_477);
    float _623 = -_599;
    float _625 = fma(_615, 2.0, _623);
    float _627 = float(_601);
    float _629 = fma(_611, -2.0, _603);
    float _631 = float(_437);
    float _633 = exp2(_619);
    float _635 = _617 * _621;
    float _637 = _627 * _613;
    float _639 = in.m_70.x;
    float _641 = in.m_70.y;
    float _643 = in.m_70.z;
    float _645 = _419 * _151;
    float _647 = _635 * (-2.0);
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _651 = 1.0 + _649;
    float _653 = 1.0 / _631;
    bool _655 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _657 = isnan(0.0);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _663 = _659 || _661;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _667 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _669 = isnan(1.0);
    bool _671 = _667 || _669;
    bool _673 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _675 = _671 || _673;
    float _677 = _607 * _151;
    float _679 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[78].w, _665);
    float _681 = -_633;
    float _683 = _681 + 1.0;
    float _685 = 1.0 / _651;
    float _687 = _663 ? _683 : 0.0;
    float _689 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[82].z, _585);
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _693 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[82].w, _569);
    float _695 = fma(_373, _647, _373);
    float _697 = _301 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _699 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[78].z, _691);
    float _701 = fma(_647, _639, _639);
    float _703 = _263 + (-0.5);
    float _705 = _653 * _151;
    float _707 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[77].z, _699);
    float _709 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[77].w, _679);
    float _711 = -_151;
    float _713 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[81].x, _625);
    float _715 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[81].y, _629);
    float _717 = _705;
    if (_675)
    {
        float _719 = _687 * _685;
        _155 = _719;
    }
    float _721 = _155;
    float _723 = _637 * (-2.0);
    bool _725 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _727 = isnan(_221);
    bool _729 = _725 || _727;
    bool _731 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _733 = _729 || _731;
    float _735 = float(_733);
    float _737 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[196].x, _701);
    bool _739 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _741 = isnan(_221);
    bool _743 = _739 || _741;
    bool _745 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _747 = _743 || _745;
    float _749 = float(_747);
    float _751 = _697 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _753 = fma(_723, _641, _641);
    float _755 = fma(_695, _721, _737);
    float _757 = fma(_393, _723, _393);
    float _759 = -_735;
    float _761 = _759 + 1.0;
    bool _763 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _765 = isnan(_221);
    bool _767 = _763 || _765;
    bool _769 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _771 = _767 || _769;
    float _773 = float(_771);
    float _775 = fma(_243, (*spvDescriptorSet0.vp_c8)._m0[11].x, _751);
    bool _777 = !_559;
    int _779 = _777 ? 0 : 1;
    float _781 = -_749;
    float _783 = _781 + 1.0;
    float _785 = _749 * _761;
    float _787 = fma(_241, (*spvDescriptorSet0.vp_c8)._m0[11].z, _775);
    int _789 = abs(_779);
    float _791 = _773 * _783;
    bool _793 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _795 = isnan(_221);
    bool _797 = _793 || _795;
    bool _799 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _801 = _797 || _799;
    float _803 = float(_801);
    float _805 = -_773;
    float _807 = _805 + 1.0;
    float _809 = _755 * 0.15915493667125701904296875;
    float _811 = float(_515);
    float _813 = _265 + (-0.5);
    float _815 = float(_789);
    float _817 = _803 * _807;
    float _819 = _787 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _821 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[196].y, _753);
    float _823 = _697 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _825 = _815 * _811;
    float _827 = _479 * _817;
    float _829 = -_803;
    float _831 = _829 + 1.0;
    float _833 = _493 * _817;
    float _835 = _825 * (-2.0);
    float _837 = in.m_72.x;
    float _839 = in.m_72.y;
    float _841 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[143].x, _827);
    float _843 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[143].y, _833);
    float _845 = fma(_835, _643, _643);
    float _847 = _267 + (-0.5);
    float _849 = fma(_377, _835, _377);
    float _851 = fma(_757, _721, _821);
    float _853 = fma(_497, _791, _843);
    float _855 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[196].z, _845);
    float _857 = fma(_243, (*spvDescriptorSet0.vp_c8)._m0[10].x, _823);
    float _859 = _851 * 0.15915493667125701904296875;
    float _861 = 1.0 / _819;
    float _863 = fma(_849, _721, _855);
    float _865 = fma(_495, _791, _841);
    float _867 = fma(_363, _785, _853);
    float _869 = fma(_241, (*spvDescriptorSet0.vp_c8)._m0[10].z, _857);
    float _871 = _863 * 0.15915493667125701904296875;
    float _873 = fma(_519, _785, _865);
    float _875 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[146].y, _867);
    float _877 = _809 * 6.283185482025146484375;
    float _879 = cos(_877);
    float _881 = _869 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _883 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[146].x, _873);
    float _885 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _887 = _875 * _839;
    float _889 = _881 + _819;
    float _891 = _883 * _837;
    float _893 = _859 * 6.283185482025146484375;
    float _895 = sin(_893);
    float _897 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _191);
    float _899 = _887 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _901 = _889 * _861;
    float _903 = _901 * 0.5;
    float _905 = _891 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _907 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _909 = _899 * _897;
    float _911 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _913 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[30].w, _911);
    float _915 = _859 * 6.283185482025146484375;
    float _917 = cos(_915);
    float _919 = _905 * _885;
    float _921 = _697 + _907;
    float _923 = _921 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _925 = _809 * 6.283185482025146484375;
    float _927 = sin(_925);
    float _929 = _879 * _895;
    float _931 = fma(_243, (*spvDescriptorSet0.vp_c15)._m0[126].x, _923);
    float _933 = fma(_241, (*spvDescriptorSet0.vp_c15)._m0[126].z, _931);
    float _935 = _871 * 6.283185482025146484375;
    float _937 = cos(_935);
    float _939 = _879 * _917;
    float _941 = _933 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _943 = _871 * 6.283185482025146484375;
    float _945 = sin(_943);
    float _947 = _927 * _895;
    float _949 = _927 * _917;
    float _951 = _879 * _937;
    float _953 = _927 * _937;
    float _955 = _917 * _937;
    float _957 = _895 * _937;
    float _959 = _951 * _909;
    float _961 = 1.0 / _913;
    float _963 = fma(_945, _939, _947);
    float _965 = -_929;
    float _967 = fma(_945, _949, _965);
    float _969 = fma(_945, _947, _939);
    float _971 = -_949;
    float _973 = fma(_945, _929, _971);
    float _975 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _977 = -_909;
    float _979 = _945 * _977;
    float _981 = fma(_963, _919, _959);
    float _983 = _953 * _909;
    float _985 = trunc(_941);
    int _987 = int(_985);
    float _989 = fma(_955, _919, _979);
    float _991 = fma(_973, _975, _981);
    float _993 = fma(_967, _919, _983);
    float _995 = fma(_957, _975, _989);
    float _997 = _991 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _999 = fma(_969, _975, _993);
    float _1001 = _921 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1003 = _991 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1005 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[26].x, _997);
    float _1007 = _991 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1009 = fma(_243, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1001);
    float _1011 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1003);
    float _1013 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1005);
    float _1015 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1017 = _961 * _1015;
    float _1019 = fma(_241, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1009);
    float _1021 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1011);
    float _1023 = _1013 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _1025 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1027 = _987 + _1025;
    int _1029 = _1027 + 1;
    float _1031 = _1019 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _1033 = _1017 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1035 = _1021 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    bool _1037 = _1017 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1039 = _241 + _1023;
    float _1041 = trunc(_1031);
    int _1043 = int(_1041);
    float _1045 = _243 + _1035;
    bool _1047 = !_1033;
    int _1049 = _1047 ? 0 : 1;
    float _1051 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1053 = _1039 + _1051;
    float _1055 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1057 = _1045 + _1055;
    float _1059 = _1053 * _1053;
    int _1061 = 2;
    int _1063 = _1029;
    int _1065 = as_type<int>(_999);
    float _1067 = _1045;
    float _1069 = _1039;
    float _1071 = _1057;
    if (!_1033)
    {
        _1061 = 1;
    }
    int _1073 = _1061;
    int _1075 = _1073;
    if (!_1037)
    {
        _1075 = _1049;
    }
    int _1077 = _1075;
    float _1079 = fma(_1057, _1057, _1059);
    bool _1081 = _1029 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1083 = _1077 << 6;
    float _1085 = sqrt(_1079);
    int _1087 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1089 = _1043 + _1087;
    int _1091 = _1089 + 1;
    int _1093 = _1083 + 48;
    uint _1096 = uint(int(uint(_1093) >> uint(2)));
    uint _1098 = uint(int(uint(int(_1096)) >> uint(2)));
    int _1100 = int(_1096) & 3;
    float _1102 = (*spvDescriptorSet0.vp_c15)._m0[int(_1098)][_1100];
    int _1104 = int(_1096) + 1;
    uint _1106 = uint(int(uint(_1104) >> uint(2)));
    int _1108 = _1104 & 3;
    float _1110 = (*spvDescriptorSet0.vp_c15)._m0[int(_1106)][_1108];
    int _1112 = _1029 | _1091;
    bool _1114 = _1112 < 0;
    bool _1116 = _1114 || _1081;
    int _1118 = _1083 + 96;
    uint _1120 = uint(int(uint(_1118) >> uint(2)));
    uint _1122 = uint(int(uint(int(_1120)) >> uint(2)));
    int _1124 = int(_1120) & 3;
    float _1126 = (*spvDescriptorSet0.vp_c15)._m0[int(_1122)][_1124];
    int _1128 = int(_1120) + 1;
    uint _1130 = uint(int(uint(_1128) >> uint(2)));
    int _1132 = _1128 & 3;
    float _1134 = (*spvDescriptorSet0.vp_c15)._m0[int(_1130)][_1132];
    bool _1136 = _1091 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1138 = _1136 || _1116;
    bool _1140 = _1085 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1142 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1144 = _1085 + _1142;
    int _1146 = _1083 + 64;
    uint _1148 = uint(int(uint(_1146) >> uint(2)));
    uint _1150 = uint(int(uint(int(_1148)) >> uint(2)));
    int _1152 = int(_1148) & 3;
    float _1154 = (*spvDescriptorSet0.vp_c15)._m0[int(_1150)][_1152];
    int _1156 = int(_1148) + 1;
    uint _1158 = uint(int(uint(_1156) >> uint(2)));
    int _1160 = _1156 & 3;
    float _1162 = (*spvDescriptorSet0.vp_c15)._m0[int(_1158)][_1160];
    int _1164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1166 = _1164 != 0;
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1170 = _1168 != 0;
    int _1172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1174 = _1172 != 0;
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1178 = _1176 != 0;
    bool _1180 = !_1166;
    int _1182 = _1180 ? 0 : 1;
    float _1184 = _1144;
    if (!_1138)
    {
        int _1186 = _1091 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1188 = _1186 + _1029;
        _1063 = _1188;
    }
    int _1190 = _1063;
    int _1192 = _1083 + 56;
    uint _1194 = uint(int(uint(_1192) >> uint(2)));
    uint _1196 = uint(int(uint(int(_1194)) >> uint(2)));
    int _1198 = int(_1194) & 3;
    float _1200 = (*spvDescriptorSet0.vp_c15)._m0[int(_1196)][_1198];
    int _1202 = int(_1194) + 1;
    uint _1204 = uint(int(uint(_1202) >> uint(2)));
    int _1206 = _1202 & 3;
    float _1208 = (*spvDescriptorSet0.vp_c15)._m0[int(_1204)][_1206];
    float _1210 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1007);
    float _1212 = as_type<float>(_1112);
    float _1214 = as_type<float>(_1190);
    if (_1140)
    {
        float _1216 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1212 = _1216;
    }
    float _1218 = _1212;
    int _1220 = 0;
    if (!_1138)
    {
        int _1222 = _1190 << 2;
        _1220 = _1222;
    }
    int _1224 = _1220;
    float _1226 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1210);
    int _1228 = 0;
    int _1230 = _1224;
    if (!_1138)
    {
        uint _1232 = uint(int(uint(_1190) >> uint(2)));
        _1228 = int(_1232);
    }
    int _1234 = _1228;
    int _1236 = _1083 + 104;
    uint _1238 = uint(int(uint(_1236) >> uint(2)));
    uint _1240 = uint(int(uint(int(_1238)) >> uint(2)));
    int _1242 = int(_1238) & 3;
    float _1244 = (*spvDescriptorSet0.vp_c15)._m0[int(_1240)][_1242];
    int _1246 = int(_1238) + 1;
    uint _1248 = uint(int(uint(_1246) >> uint(2)));
    int _1250 = _1246 & 3;
    float _1252 = (*spvDescriptorSet0.vp_c15)._m0[int(_1248)][_1250];
    if (!_1138)
    {
        int _1254 = 12 & _1224;
        _1230 = _1254;
    }
    int _1256 = _1230;
    if (!_1138)
    {
        int _1258 = _1234 << 4;
        int _1260 = _1258 + _1256;
        _1065 = _1260;
    }
    int _1262 = _1065;
    float _1264 = _1226 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1266 = _1083 + 72;
    uint _1268 = uint(int(uint(_1266) >> uint(2)));
    uint _1270 = uint(int(uint(int(_1268)) >> uint(2)));
    int _1272 = int(_1268) & 3;
    float _1274 = (*spvDescriptorSet0.vp_c15)._m0[int(_1270)][_1272];
    int _1276 = int(_1268) + 1;
    uint _1278 = uint(int(uint(_1276) >> uint(2)));
    int _1280 = _1276 & 3;
    float _1282 = (*spvDescriptorSet0.vp_c15)._m0[int(_1278)][_1280];
    float _1284 = _1218;
    if (_1140)
    {
        float _1286 = _1144 * _1218;
        _1284 = _1286;
    }
    float _1288 = _1284;
    float _1290 = _697 + _1264;
    if (_1140)
    {
        float _1292 = rsqrt(_1079);
        _1184 = _1292;
    }
    float _1294 = _1184;
    float _1296 = 0.0;
    if (_1140)
    {
        float _1298 = _1288 * 0.15915493667125701904296875;
        _1296 = _1298;
    }
    float _1300 = _1296;
    int _1302 = _1083 + 80;
    uint _1304 = uint(int(uint(_1302) >> uint(2)));
    uint _1306 = uint(int(uint(int(_1304)) >> uint(2)));
    int _1308 = int(_1304) & 3;
    float _1310 = (*spvDescriptorSet0.vp_c15)._m0[int(_1306)][_1308];
    int _1312 = int(_1304) + 1;
    uint _1314 = uint(int(uint(_1312) >> uint(2)));
    int _1316 = _1312 & 3;
    float _1318 = (*spvDescriptorSet0.vp_c15)._m0[int(_1314)][_1316];
    float _1320 = _921 * _1110;
    float _1322 = _1288;
    float _1324 = _1102;
    if (_1140)
    {
        float _1326 = _1300 * 6.283185482025146484375;
        float _1328 = sin(_1326);
        _1322 = _1328;
    }
    float _1330 = _1322;
    float _1332 = fma(_243, _1102, _1320);
    if (_1140)
    {
        float _1334 = _1290 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1324 = _1334;
    }
    float _1336 = _1324;
    bool _1338 = !_1174;
    int _1340 = _1338 ? 0 : 1;
    float _1342 = _921 * _1134;
    float _1344 = fma(_243, _1126, _1342);
    float _1346 = _1110;
    float _1348 = _1336;
    float _1350 = _1344;
    float _1352 = _1126;
    if (_1140)
    {
        float _1354 = _1300 * 6.283185482025146484375;
        float _1356 = cos(_1354);
        _1346 = _1356;
    }
    float _1358 = _1346;
    float _1360 = _921 * _1162;
    float _1362 = fma(_243, _1154, _1360);
    float _1364 = _1330;
    if (_1140)
    {
        float _1366 = fma(_1330, _1336, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1364 = _1366;
    }
    float _1368 = _1364;
    bool _1370 = !_1178;
    int _1372 = _1370 ? 0 : 1;
    float _1374 = fma(_241, _1200, _1332);
    bool _1376 = !_1170;
    int _1378 = _1376 ? 0 : 1;
    float _1380 = _1368;
    float _1382 = _1208;
    if (_1140)
    {
        float _1384 = _1294 * _1368;
        _1380 = _1384;
    }
    float _1386 = _1380;
    bool _1388 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1390 = isnan(0.5);
    bool _1392 = _1388 || _1390;
    bool _1394 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1396 = _1392 || _1394;
    if (_1140)
    {
        float _1398 = _1358 + (-1.0);
        _1348 = _1398;
    }
    float _1400 = _1348;
    if (_1140)
    {
        float _1402 = fma(_1057, _1386, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1067 = _1402;
    }
    float _1404 = _1067;
    if (_1140)
    {
        float _1406 = fma(_1053, _1386, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1069 = _1406;
    }
    float _1408 = _1069;
    float _1410 = fma(_241, _1244, _1344);
    if (!_1140)
    {
        _1350 = _1290;
    }
    float _1412 = _1350;
    float _1414 = fma(_241, _1274, _1362);
    float _1416 = _1374 + _1208;
    float _1418 = _1410 + _1252;
    float _1420 = _1412;
    if (_1140)
    {
        float _1422 = _1400 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1382 = _1422;
    }
    float _1424 = _1382;
    float _1426 = _1252;
    if (!_1138)
    {
        float _1428 = floor(_941);
        _1426 = _1428;
    }
    float _1430 = _1426;
    float _1432 = _1414 + _1282;
    if (_1396)
    {
        _1352 = _1404;
    }
    float _1434 = _1352;
    float _1436 = _1434;
    if (_1140)
    {
        float _1438 = fma(_1290, _1358, _1424);
        _1420 = _1438;
    }
    float _1440 = _1420;
    float _1442 = _1440;
    if (_1396)
    {
        _1071 = _1408;
    }
    float _1444 = _1071;
    float _1446 = 1.0 / _1418;
    float _1448 = _1444;
    if (!_1396)
    {
        float _1450 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1452 = _697 + _1450;
        float _1454 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1456 = _243 + _1454;
        float _1458 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1460 = -_697;
        float _1462 = _1460 + _1440;
        float _1464 = _1452 * _1452;
        float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1468 = _241 + _1466;
        float _1470 = -_243;
        float _1472 = _1470 + _1404;
        float _1474 = -_241;
        float _1476 = _1474 + _1408;
        float _1478 = fma(_1456, _1456, _1464);
        float _1480 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1482 = fma(_1468, _1468, _1478);
        float _1484 = sqrt(_1482);
        float _1486 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1488 = precise::min(_1484, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1490 = _1488 * _1480;
        float _1492 = _1486 * _1490;
        float _1494 = fma(_1462, _1492, _697);
        float _1496 = fma(_1472, _1492, _243);
        float _1498 = fma(_1476, _1492, _241);
        _1442 = _1494;
        _1436 = _1496;
        _1448 = _1498;
    }
    float _1500 = _1442;
    float _1502 = _1436;
    float _1504 = _1448;
    int _1506 = _1083 + 88;
    uint _1508 = uint(int(uint(_1506) >> uint(2)));
    uint _1510 = uint(int(uint(int(_1508)) >> uint(2)));
    int _1512 = int(_1508) & 3;
    float _1514 = (*spvDescriptorSet0.vp_c15)._m0[int(_1510)][_1512];
    int _1516 = int(_1508) + 1;
    uint _1518 = uint(int(uint(_1516) >> uint(2)));
    int _1520 = _1516 & 3;
    float _1522 = (*spvDescriptorSet0.vp_c15)._m0[int(_1518)][_1520];
    float _1524 = _1432 * _1446;
    float _1526 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1528 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1530 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1532 = _1416 * _1446;
    float _1534 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1526);
    float _1536 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1528);
    float _1538 = _1264;
    if (!_1138)
    {
        int _1540 = _1262 + 400;
        uint _1542 = uint(int(uint(_1540) >> uint(2)));
        uint _1544 = uint(int(uint(int(_1542)) >> uint(2)));
        int _1546 = int(_1542) & 3;
        float _1548 = (*spvDescriptorSet0.vp_c15)._m0[int(_1544)][_1546];
        _1538 = _1548;
    }
    float _1550 = _1538;
    float _1552 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1530);
    float _1554 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1534);
    float _1556 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1536);
    float _1558 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1560 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1552);
    float _1562 = _1554 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1564 = _1556 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1566 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1558);
    float _1568 = _1560 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1570 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _1572 = _1532 >= 0.0;
    float _1574 = _1562 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1576 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1578 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1566);
    bool _1580 = _1532 <= 1.0;
    bool _1582 = _1580 && _1572;
    float _1584 = -_1574;
    float _1586 = fma(_1584, _1570, 1.0);
    float _1588 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1576);
    float _1590 = _921 * _1318;
    bool _1592 = _1524 >= 0.0;
    bool _1594 = _1592 && _1582;
    float _1596 = _1578 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1598 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1588);
    float _1600 = log2(_1586);
    bool _1602 = _1524 <= 1.0;
    bool _1604 = _1602 && _1594;
    float _1606 = fma(_243, _1310, _1590);
    float _1608 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1598);
    float _1610 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1612 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1614 = _1414;
    if (!_1138)
    {
        float _1616 = floor(_1031);
        _1614 = _1616;
    }
    float _1618 = _1614;
    float _1620 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1610);
    float _1622 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1620);
    float _1624 = 0.0;
    if (_1604)
    {
        float _1626 = float(_1077);
        _1624 = _1626;
    }
    float _1628 = _1624;
    float _1630 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1612);
    float _1632 = 1.0 / _1608;
    float _1634 = fma(_241, _1514, _1606);
    float _1636 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1630);
    float _1638 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1622);
    float _1640 = _1634 + _1522;
    float _1642 = _1600 * 0.693147182464599609375;
    float _1644 = _1610;
    float _1646 = _1638;
    if (_1604)
    {
        float _1648 = rint(_1628);
        float _1650 = precise::max(_1648, 0.0);
        uint _1652 = uint(_1650);
        uint _1654 = clamp(_1652, 0u, 65535u);
        _1644 = as_type<float>(_1654);
    }
    float _1656 = _1644;
    float _1658 = 0.0;
    if (!_1138)
    {
        float _1660 = -_1618;
        float _1662 = _1031 + _1660;
        _1658 = _1662;
    }
    float _1664 = _1658;
    float _1666 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1636);
    float _1668 = _1642 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1670 = _1640 * _1446;
    float _1672 = _1642;
    if (!_1138)
    {
        float _1674 = rint(_1550);
        float _1676 = precise::max(_1674, 0.0);
        uint _1678 = uint(_1676);
        uint _1680 = clamp(_1678, 0u, 65535u);
        _1672 = as_type<float>(_1680);
    }
    float _1682 = _1672;
    float _1684 = _1638 * _1632;
    float _1686 = _1666 * _1632;
    float _1688 = fma(_1684, 0.5, 0.5);
    float _1690 = fma(_1686, -0.5, 0.5);
    float _1692 = _1684;
    if (!_1138)
    {
        float _1694 = -_1430;
        float _1696 = _941 + _1694;
        _1692 = _1696;
    }
    float _1698 = _1692;
    float _1700 = _1656;
    if (_1604)
    {
        float3 _6611 = float3(_1532, _1524, float(as_type<int>(_1656)));
        float3 _6615 = select(_6611, float3(0.0), isnan(_6611));
        float _1702 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6615.xy, uint(rint(_6615.z)), _1670, level(0.0));
        _1700 = _1702;
    }
    float _1704 = _1700;
    float3 _6625 = float3(_1688, _1690, _1668);
    float _1706 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6625, float3(0.0), isnan(_6625)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6625, float3(0.0), isnan(_6625)), level(0.0)).x;
    float3 _6634 = float3(_1688, _1690, _1668);
    float4 _1709 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6634, float3(0.0), isnan(_6634)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6634, float3(0.0), isnan(_6634)), level(0.0)).xyzw;
    float _1711 = _1709.x;
    float _1713 = _1709.y;
    float _1715 = _1709.z;
    float _1717 = _1709.w;
    float _1719 = _1664;
    if (!_1138)
    {
        float3 _6657 = float3(_1698, _1664, float(as_type<int>(_1682)));
        float3 _6659 = select(_6657, float3(0.0), isnan(_6657));
        float _1721 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6659.xy, uint(rint(_6659.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6659.xy, uint(rint(_6659.z)), level(0.0)).x;
        _1719 = _1721;
    }
    float _1723 = _1719;
    float _1725 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1727 = int(_1725);
    int _1729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1731 = _1729 != 0;
    int _1733 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1735 = _1733 != 0;
    int _1737 = abs(_1378);
    int _1739 = abs(_525);
    float _1741 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1743 = int(_1741);
    int _1745 = abs(_1182);
    int _1747 = abs(_535);
    int _1749 = abs(_1372);
    if (_1731)
    {
        float _1751 = in.m_68.x;
        _399 = _1751;
    }
    float _1753 = _399;
    float _1755 = float(uint(_1727));
    float _1757 = trunc(_677);
    int _1759 = int(_1757);
    float _1761 = _1753;
    if (!_1731)
    {
        float _1763 = in.m_68.y;
        _1761 = _1763;
    }
    float _1765 = _1761;
    int _1767 = ~_1727;
    int _1769 = _1767 + 1;
    float _1771 = float(uint(_1743));
    float _1773 = 1.0 / _1755;
    float _1775 = 1.0 / _1771;
    float _1777 = trunc(_705);
    int _1779 = int(_1777);
    int _1781 = as_type<int>(_1773) + (-2);
    float _1783 = float(uint(_1759));
    int _1785 = ~_1743;
    int _1787 = _1785 + 1;
    int _1789 = as_type<int>(_1775) + (-2);
    float _1791 = as_type<float>(_1781) * _1783;
    float _1793 = _1775;
    if (_1731)
    {
        _717 = 1.0;
    }
    float _1795 = _717;
    float _1797 = _1795;
    if (!_1731)
    {
        _1797 = 1.2345600128173828125;
    }
    float _1799 = _1797;
    if (_1731)
    {
        _1793 = 1.0;
    }
    float _1801 = _1793;
    float _1803 = trunc(_1791);
    float _1805 = precise::max(_1803, 0.0);
    uint _1807 = uint(_1805);
    float _1809 = float(uint(_1779));
    float _1811 = _1765 * _1799;
    float _1813 = _1801;
    if (!_1731)
    {
        _1813 = 7.345489978790283203125;
    }
    float _1815 = _1813;
    float _1817 = as_type<float>(_1789) * _1809;
    int _1819 = ~_1727;
    int _1821 = _1819 + 1;
    float _1823 = _1815 * _263;
    float _1825 = floor(_1811);
    int _1827 = _1821 * int(_1807);
    int _1829 = _1827 + _1759;
    float _1831 = trunc(_1817);
    float _1833 = precise::max(_1831, 0.0);
    uint _1835 = uint(_1833);
    float _1837 = float(uint(_1829));
    float _1839 = floor(_1823);
    float _1841 = as_type<float>(_1781) * _1837;
    float _1843 = float(_1759);
    float _1845 = -_1825;
    float _1847 = _1811 + _1845;
    int _1849 = _1787 * int(_1835);
    int _1851 = _1849 + _1779;
    float _1853 = trunc(_1841);
    float _1855 = precise::max(_1853, 0.0);
    uint _1857 = uint(_1855);
    float _1859 = float(uint(_1851));
    float _1861 = -_1839;
    float _1863 = _1823 + _1861;
    float _1865 = float(_1743);
    float _1867 = as_type<float>(_1789) * _1859;
    float _1869 = float(_1727);
    float _1871 = _1847 * _1865;
    bool _1873 = _1843 >= _1869;
    bool _1875 = isnan(_1843);
    bool _1877 = _1873 || _1875;
    bool _1879 = isnan(_1869);
    bool _1881 = _1877 || _1879;
    float _1883 = float(_1881);
    float _1885 = trunc(_1867);
    float _1887 = precise::max(_1885, 0.0);
    uint _1889 = uint(_1887);
    int _1891 = int(_1807) + int(_1857);
    int _1893 = _1769 * _1891;
    int _1895 = _1893 + _1759;
    float _1897 = trunc(_1883);
    int _1899 = int(_1897);
    bool _1901 = uint(_1895) >= uint(_1727);
    int _1903 = int(_1835) + int(_1889);
    float _1905 = _1863 * _1869;
    int _1907 = ~_1743;
    int _1909 = _1907 + 1;
    float _1911 = _1869 * _645;
    float _1913 = float(_1779);
    float _1915 = _1865 * _645;
    float _1917 = trunc(_1871);
    int _1919 = int(_1917);
    int _1921 = _1909 * _1903;
    int _1923 = _1921 + _1779;
    bool _1925 = _1913 >= _1865;
    bool _1927 = isnan(_1913);
    bool _1929 = _1925 || _1927;
    bool _1931 = isnan(_1865);
    bool _1933 = _1929 || _1931;
    float _1935 = float(_1933);
    bool _1937 = !_1901;
    int _1939 = _1937 ? 0 : (-1);
    bool _1941 = uint(_1923) >= uint(_1743);
    float _1943 = trunc(_1935);
    int _1945 = int(_1943);
    bool _1947 = !_1941;
    int _1949 = _1947 ? 0 : (-1);
    int _1951 = ~_1891;
    int _1953 = _1951 + _1939;
    int _1955 = _1953 + 1;
    int _1957 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1959 = _1957 != 0;
    float _1961 = trunc(_1905);
    int _1963 = int(_1961);
    int _1965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1967 = _1965 != 0;
    int _1969 = _1727 * _1955;
    int _1971 = _1969 + _1759;
    int _1973 = ~_1903;
    int _1975 = _1973 + _1949;
    int _1977 = _1975 + 1;
    bool _1979 = !_1959;
    int _1981 = _1979 ? 0 : 1;
    bool _1983 = !_1967;
    int _1985 = _1983 ? 0 : 1;
    int _1987 = _1743 * _1977;
    int _1989 = _1987 + _1779;
    bool _1991 = _1727 == 0;
    float _1993 = trunc(_1911);
    int _1995 = int(_1993);
    bool _1997 = _1743 == 0;
    int _1999 = abs(_1981);
    int _2001 = ~_1899;
    int _2003 = _2001 + 1;
    int _2005 = _2003 + 1;
    bool _2007 = !_1991;
    int _2009 = _2007 ? _1971 : (-1);
    int _2011 = _1963 * _1999;
    int _2013 = _2011 + _1759;
    int _2015 = ~_1945;
    int _2017 = _2015 + 1;
    int _2019 = _2017 + 1;
    float _2021 = trunc(_1915);
    int _2023 = int(_2021);
    bool _2025 = !_1997;
    int _2027 = _2025 ? _1989 : (-1);
    int _2029 = _2009 * _2005;
    int _2031 = _1727 + (-1);
    int _2033 = _1743 + (-1);
    int _2035 = _2027 * _2019;
    int _2037 = abs(_1985);
    int _2039 = _1899 * _2031;
    int _2041 = _2039 + _2029;
    int _2043 = _1945 * _2033;
    int _2045 = _2043 + _2035;
    int _2047 = _2041 * _1739;
    int _2049 = abs(_531);
    int _2051 = _1919 * _2037;
    int _2053 = _2051 + _1779;
    int _2055 = abs(_1340);
    int _2057 = _2045 * _1737;
    bool _2059 = !_1735;
    int _2061 = _2059 ? 0 : 1;
    int _2063 = _1995 * _2049;
    int _2065 = _2063 + _2047;
    int _2067 = abs(_2061);
    int _2069 = _2013 * _1747;
    int _2071 = _2069 + _2065;
    int _2073 = ~_1727;
    int _2075 = _2073 + 1;
    int _2077 = _2023 * _1745;
    int _2079 = _2077 + _2057;
    int _2081 = ~_1743;
    int _2083 = _2081 + 1;
    int _2085 = _1963 * _2067;
    int _2087 = _2085 + _2071;
    int _2089 = _2053 * _2055;
    int _2091 = _2089 + _2079;
    float _2093 = float(uint(_2013));
    float _2095 = float(uint(_2087));
    int _2097 = _1919 * _1749;
    int _2099 = _2097 + _2091;
    int _2101 = ~_1743;
    int _2103 = _2101 + 1;
    float _2105 = as_type<float>(_1781) * _2093;
    float _2107 = as_type<float>(_1781) * _2095;
    float _2109 = float(uint(_2099));
    float _2111 = trunc(_2105);
    float _2113 = precise::max(_2111, 0.0);
    uint _2115 = uint(_2113);
    float _2117 = as_type<float>(_1789) * _2109;
    int _2119 = ~_1727;
    int _2121 = _2119 + 1;
    float _2123 = trunc(_2107);
    float _2125 = precise::max(_2123, 0.0);
    uint _2127 = uint(_2125);
    float _2129 = trunc(_2117);
    float _2131 = precise::max(_2129, 0.0);
    uint _2133 = uint(_2131);
    int _2135 = _2121 * int(_2127);
    int _2137 = _2135 + _2087;
    float _2139 = float(uint(_2137));
    int _2141 = _2083 * int(_2133);
    int _2143 = _2141 + _2099;
    float _2145 = as_type<float>(_1781) * _2139;
    float _2147 = float(uint(_2143));
    float _2149 = trunc(_2145);
    float _2151 = precise::max(_2149, 0.0);
    uint _2153 = uint(_2151);
    float _2155 = as_type<float>(_1789) * _2147;
    float _2157 = float(uint(_2053));
    float _2159 = trunc(_2155);
    float _2161 = precise::max(_2159, 0.0);
    uint _2163 = uint(_2161);
    float _2165 = as_type<float>(_1789) * _2157;
    int _2167 = _2075 * int(_2115);
    int _2169 = _2167 + _2013;
    int _2171 = ~_1727;
    int _2173 = _2171 + 1;
    float _2175 = float(uint(_2169));
    float _2177 = trunc(_2165);
    float _2179 = precise::max(_2177, 0.0);
    uint _2181 = uint(_2179);
    int _2183 = int(_2127) + int(_2153);
    int _2185 = ~_1743;
    int _2187 = _2185 + 1;
    float _2189 = as_type<float>(_1781) * _2175;
    int _2191 = _2173 * _2183;
    int _2193 = _2191 + _2087;
    int _2195 = int(_2133) + int(_2163);
    float _2197 = trunc(_2189);
    float _2199 = precise::max(_2197, 0.0);
    uint _2201 = uint(_2199);
    bool _2203 = uint(_2193) >= uint(_1727);
    int _2205 = _2187 * _2195;
    int _2207 = _2205 + _2099;
    int _2209 = _2103 * int(_2181);
    int _2211 = _2209 + _2053;
    bool _2213 = !_2203;
    int _2215 = _2213 ? 0 : (-1);
    bool _2217 = uint(_2207) >= uint(_1743);
    int _2219 = ~_2183;
    int _2221 = _2219 + _2215;
    int _2223 = _2221 + 1;
    float _2225 = float(uint(_2211));
    bool _2227 = !_2217;
    int _2229 = _2227 ? 0 : (-1);
    int _2231 = _1727 * _2223;
    int _2233 = _2231 + _2087;
    int _2235 = int(_2115) + int(_2201);
    float _2237 = as_type<float>(_1789) * _2225;
    int _2239 = ~_2195;
    int _2241 = _2239 + _2229;
    int _2243 = _2241 + 1;
    float _2245 = as_type<float>(_2223);
    float _2247 = _2225;
    if (_1138)
    {
        _2245 = 1.0;
    }
    float _2249 = _2245;
    float _2251 = _2249;
    float _2253 = _1706;
    if (!_1138)
    {
        int _2255 = _1190 << 4;
        int _2257 = _2255 + 2048;
        uint _2259 = uint(int(uint(_2257) >> uint(2)));
        uint _2261 = uint(int(uint(int(_2259)) >> uint(2)));
        int _2263 = int(_2259) & 3;
        float _2265 = (*spvDescriptorSet0.vp_c15)._m0[int(_2261)][_2263];
        int _2267 = int(_2259) + 1;
        uint _2269 = uint(int(uint(_2267) >> uint(2)));
        int _2271 = _2267 & 3;
        float _2273 = (*spvDescriptorSet0.vp_c15)._m0[int(_2269)][_2271];
        int _2275 = _2257 + 8;
        uint _2277 = uint(int(uint(_2275) >> uint(2)));
        uint _2279 = uint(int(uint(int(_2277)) >> uint(2)));
        int _2281 = int(_2277) & 3;
        float _2283 = (*spvDescriptorSet0.vp_c15)._m0[int(_2279)][_2281];
        int _2285 = int(_2277) + 1;
        uint _2287 = uint(int(uint(_2285) >> uint(2)));
        int _2289 = _2285 & 3;
        float _2291 = (*spvDescriptorSet0.vp_c15)._m0[int(_2287)][_2289];
        float _2293 = _921 * _2273;
        float _2295 = fma(_243, _2265, _2293);
        float _2297 = fma(_241, _2283, _2295);
        float _2299 = _2297 + _2291;
        float _2301 = precise::clamp(_2299, 0.0, 1.0);
        float _2303 = -_2301;
        float _2305 = _2303 + _1723;
        float _2307 = fma(_2305, 500.0, 1.5);
        float _2309 = exp2(_2307);
        float _2311 = 0.0 + _2309;
        float _2313 = precise::clamp(_2311, 0.0, 1.0);
        _1214 = as_type<float>(_2257);
        _2251 = _2313;
    }
    float _2315 = _1214;
    float _2317 = _2251;
    float _2319 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2321 = _1500 + _2319;
    float _2323 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2325 = _1502 + _2323;
    float _2327 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2329 = _1504 + _2327;
    float _2331 = _2321 * _2321;
    float _2333 = fma(_2325, _2325, _2331);
    float _2335 = fma(_2329, _2329, _2333);
    float _2337 = rsqrt(_2335);
    float _2339 = sqrt(_2335);
    float _2341 = _2337 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2343 = _2325 * _2341;
    float _2345 = _2329 * _2341;
    float _2347 = _2343 * _2343;
    float _2349 = _2345 * _2345;
    float _2351 = _2347 + _2349;
    float _2353 = sqrt(_2351);
    bool _2355 = _2353 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2357 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2359 = _2353 + _2357;
    float _2361 = as_type<float>(_2229);
    float _2363 = _2351;
    float _2365 = _2359;
    float _2367 = _2341;
    float _2369 = _2343;
    float _2371 = _2345;
    float _2373 = _2347;
    float _2375 = _2349;
    if (_2355)
    {
        float _2377 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2361 = _2377;
    }
    float _2379 = _2361;
    if (_2355)
    {
        float _2381 = rsqrt(_2351);
        _2363 = _2381;
    }
    float _2383 = _2363;
    if (_2355)
    {
        float _2385 = _2359 * _2379;
        _2365 = _2385;
    }
    float _2387 = _2365;
    if (_2355)
    {
        float _2389 = _2387 * 0.15915493667125701904296875;
        _2247 = _2389;
    }
    float _2391 = _2247;
    float _2393 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2395 = _2315;
    float _2397 = _2393;
    if (_2355)
    {
        float _2399 = _2391 * 6.283185482025146484375;
        float _2401 = sin(_2399);
        _2395 = _2401;
    }
    float _2403 = _2395;
    float _2405 = precise::max(0.0, _2393);
    float _2407 = _2387;
    if (_2355)
    {
        float _2409 = _2391 * 6.283185482025146484375;
        float _2411 = cos(_2409);
        _2407 = _2411;
    }
    float _2413 = _2407;
    float _2415 = -_2341;
    float _2417 = -_2405;
    float _2419 = fma(_2321, _2415, _2417);
    float _2421 = _2419;
    if (_2355)
    {
        float _2423 = _2419 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2367 = _2423;
    }
    float _2425 = _2367;
    float _2427 = _2403;
    float _2429 = _2425;
    if (_2355)
    {
        float _2431 = fma(_2403, _2425, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2427 = _2431;
    }
    float _2433 = _2427;
    int _2435 = ~_1727;
    int _2437 = _2435 + 1;
    if (_2355)
    {
        float _2439 = _2383 * _2433;
        _2429 = _2439;
    }
    float _2441 = _2429;
    int _2443 = _2437 * _2235;
    int _2445 = _2443 + _2013;
    if (_2355)
    {
        float _2447 = _2413 + (-1.0);
        _2397 = _2447;
    }
    float _2449 = _2397;
    float _2451 = _2449;
    if (_2355)
    {
        float _2453 = _2343 * _2441;
        _2369 = _2453;
    }
    float _2455 = _2369;
    if (_2355)
    {
        float _2457 = _2345 * _2441;
        _2371 = _2457;
    }
    float _2459 = _2371;
    if (_2355)
    {
        float _2461 = _2449 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2451 = _2461;
    }
    float _2463 = _2451;
    if (_2355)
    {
        float _2465 = _2455 * _2455;
        _2373 = _2465;
    }
    float _2467 = _2373;
    if (_2355)
    {
        float _2469 = _2459 * _2459;
        _2375 = _2469;
    }
    float _2471 = _2375;
    if (_2355)
    {
        float _2473 = fma(_2419, _2413, _2463);
        _2421 = _2473;
    }
    float _2475 = _2421;
    float _2477 = fma(_2475, _2475, _2467);
    float _2479 = _2477 + _2471;
    float _2481 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2483 = fma(_2339, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2481);
    float _2485 = precise::clamp(_2483, 0.0, 1.0);
    float _2487 = rsqrt(_2479);
    float _2489 = -_2485;
    float _2491 = _2489 + 1.0;
    float _2493 = _2487 * _2455;
    float _2495 = _2487 * _2475;
    float _2497 = _2487 * _2459;
    float _2499 = _2493 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2501 = abs(_2491);
    float _2503 = log2(_2501);
    float _2505 = -_2499;
    float _2507 = fma(_2495, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2505);
    bool _2509 = !_1991;
    int _2511 = _2509 ? _2233 : (-1);
    float _2513 = -_2497;
    float _2515 = fma(_2513, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2507);
    int _2517 = _2511 & 3;
    bool _2519 = _2517 != 0;
    int _2521 = _2511 & 3;
    bool _2523 = _2521 != 0;
    float _2525 = fma(_2515, -0.5, 0.5);
    float _2527 = fma(_2515, 0.5, 0.5);
    bool _2529 = uint(_2517) > 1u;
    float _2531 = fma(_2527, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2533 = _2503 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2535 = sqrt(_2525);
    float _2537 = fma(_2527, _2531, -0.212114393711090087890625);
    float _2539 = fma(_2527, _2537, 1.570728778839111328125);
    float _2541 = _2495 + 1.0;
    float _2543 = exp2(_2533);
    float _2545 = _2535 * 0.636619746685028076171875;
    float _2547 = -_2539;
    float _2549 = fma(_2545, _2547, 1.0);
    float _2551 = -_2495;
    float _2553 = fma(_2543, _2541, _2551);
    float _2555 = fma(_1404, 6.2500002968590706586837768554688e-05, 0.5);
    float _2557 = fma(_1408, 6.2500002968590706586837768554688e-05, 0.5);
    float _2559 = fma(_2553, 0.5, 0.5);
    float2 _7829 = float2(_2549, _2559);
    float3 _2563 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7829, float2(0.0), isnan(_7829)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7829, float2(0.0), isnan(_7829)), level(0.0)).xyz;
    float _2565 = _2563.x;
    float _2567 = _2563.y;
    float _2569 = _2563.z;
    float2 _7843 = float2(_2555, _2557);
    float3 _2571 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_7843, float2(0.0), isnan(_7843)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_7843, float2(0.0), isnan(_7843)), level(0.0)).xyz;
    float _2573 = _2571.x;
    float _2575 = _2571.y;
    float _2577 = _2571.z;
    bool _2579 = uint(_2445) >= uint(_1727);
    int _2581 = _1743 * _2243;
    int _2583 = _2581 + _2099;
    int _2585 = _2511 >> 31;
    float _2587 = trunc(_2237);
    float _2589 = precise::max(_2587, 0.0);
    uint _2591 = uint(_2589);
    bool _2593 = !_2579;
    int _2595 = _2593 ? 0 : (-1);
    float _2597 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2599 = !_1997;
    int _2601 = _2599 ? _2583 : (-1);
    float _2603 = -_689;
    float _2605 = _2603 + 1.0;
    int _2607 = ~_2235;
    int _2609 = _2607 + _2595;
    int _2611 = _2609 + 1;
    float _2613 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2597);
    int _2615 = _2585 & 3;
    float _2617 = -_707;
    float _2619 = _2617 + 1.0;
    int _2621 = _2601 >> 31;
    int _2623 = _1727 * _2611;
    int _2625 = _2623 + _2013;
    int _2627 = _2511 + _2615;
    float _2629 = -_693;
    float _2631 = _2629 + 1.0;
    int _2633 = _2621 & 3;
    float _2635 = -_261;
    float _2637 = _2635 + 1.0;
    int _2639 = _2627 >> 2;
    float _2641 = -_709;
    float _2643 = _2641 + 1.0;
    int _2645 = _2601 + _2633;
    float _2647 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2613);
    int _2649 = _2523 ? 0 : 1;
    out.m_74.x = _1502;
    out.m_74.y = _1500;
    out.m_74.z = _1504;
    int _2651 = _2639 << 4;
    int _2653 = _2651 + 368;
    int _2655 = _2645 >> 2;
    bool _2657 = _269 > 0.5;
    uint _2659 = uint(int(uint(_2653) >> uint(2)));
    uint _2661 = uint(int(uint(int(_2659)) >> uint(2)));
    int _2663 = int(_2659) & 3;
    float _2665 = (*spvDescriptorSet0.vp_c9)._m0[int(_2661)][_2663];
    int _2667 = int(_2659) + 1;
    uint _2669 = uint(int(uint(_2667) >> uint(2)));
    int _2671 = _2667 & 3;
    float _2673 = (*spvDescriptorSet0.vp_c9)._m0[int(_2669)][_2671];
    int _2675 = ~_2649;
    int _2677 = _2675 + 1;
    int _2679 = _2677 + 1;
    int _2681 = _2679;
    if (!_2529)
    {
        int _2683 = ~_2649;
        int _2685 = _2683 + 1;
        _2681 = _2685;
    }
    int _2687 = _2681;
    int _2689 = _2655 << 4;
    int _2691 = _2689 + 512;
    bool _2693 = _2517 != 3;
    uint _2695 = uint(int(uint(_2691) >> uint(2)));
    uint _2697 = uint(int(uint(int(_2695)) >> uint(2)));
    int _2699 = int(_2695) & 3;
    float _2701 = (*spvDescriptorSet0.vp_c9)._m0[int(_2697)][_2699];
    int _2703 = int(_2695) + 1;
    uint _2705 = uint(int(uint(_2703) >> uint(2)));
    int _2707 = _2703 & 3;
    float _2709 = (*spvDescriptorSet0.vp_c9)._m0[int(_2705)][_2707];
    bool _2711 = uint(_2517) >= 2u;
    float _2713 = -_191;
    int _2715 = _2657 ? as_type<int>(_2713) : as_type<int>(_191);
    int _2717 = _2711 ? 0 : 1;
    bool _2719 = !_2519;
    int _2721 = _2719 ? 0 : 1;
    int _2723 = ~_2717;
    int _2725 = _2723 + 1;
    int _2727 = _2725 + 1;
    bool _2729 = _2517 != 3;
    int _2731 = _2727;
    if (_2693)
    {
        int _2733 = ~_2717;
        int _2735 = _2733 + 1;
        _2731 = _2735;
    }
    int _2737 = _2731;
    int _2739 = _2691 + 8;
    uint _2741 = uint(int(uint(_2739) >> uint(2)));
    uint _2743 = uint(int(uint(int(_2741)) >> uint(2)));
    int _2745 = int(_2741) & 3;
    float _2747 = (*spvDescriptorSet0.vp_c9)._m0[int(_2743)][_2745];
    int _2749 = int(_2741) + 1;
    uint _2751 = uint(int(uint(_2749) >> uint(2)));
    int _2753 = _2749 & 3;
    float _2755 = (*spvDescriptorSet0.vp_c9)._m0[int(_2751)][_2753];
    int _2757 = _2601 & 3;
    bool _2759 = _2757 != 0;
    int _2761 = _2601 & 3;
    bool _2763 = _2761 != 0;
    int _2765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2767 = _2765 != 0;
    int _2769 = int(_2181) + int(_2591);
    int _2771 = _2653 + 8;
    uint _2773 = uint(int(uint(_2771) >> uint(2)));
    uint _2775 = uint(int(uint(int(_2773)) >> uint(2)));
    int _2777 = int(_2773) & 3;
    float _2779 = (*spvDescriptorSet0.vp_c9)._m0[int(_2775)][_2777];
    int _2781 = int(_2773) + 1;
    uint _2783 = uint(int(uint(_2781) >> uint(2)));
    int _2785 = _2781 & 3;
    float _2787 = (*spvDescriptorSet0.vp_c9)._m0[int(_2783)][_2785];
    int _2789 = ~_1743;
    int _2791 = _2789 + 1;
    bool _2793 = !_2767;
    int _2795 = _2793 ? 0 : 1;
    bool _2797 = uint(_2761) > 1u;
    int _2799 = _2791 * _2769;
    int _2801 = _2799 + _2053;
    bool _2803 = !_1991;
    int _2805 = _2803 ? _2625 : (-1);
    int _2807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2809 = _2807 != 0;
    int _2811 = _2759 ? 0 : 1;
    bool _2813 = !_2809;
    int _2815 = _2813 ? 0 : 1;
    bool _2817 = uint(_2801) >= uint(_1743);
    bool _2819 = !_2729;
    int _2821 = _2819 ? 0 : (-1);
    bool _2823 = !_2763;
    int _2825 = _2823 ? 0 : 1;
    bool _2827 = uint(_2761) >= 2u;
    bool _2829 = _2761 != 3;
    int _2831 = ~_2811;
    int _2833 = _2831 + 1;
    int _2835 = _2833 + 1;
    bool _2837 = _2761 != 3;
    bool _2839 = !_2817;
    int _2841 = _2839 ? 0 : (-1);
    int _2843 = _2835;
    if (!_2797)
    {
        int _2845 = ~_2811;
        int _2847 = _2845 + 1;
        _2843 = _2847;
    }
    int _2849 = _2843;
    int _2851 = _2827 ? 0 : 1;
    bool _2853 = !_2829;
    int _2855 = _2853 ? 0 : (-1);
    int _2857 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2859 = _2857 != 0;
    int _2861 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2863 = _2861 != 0;
    int _2865 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2867 = _2865 != 0;
    int _2869 = abs(_2687);
    int _2871 = ~_2769;
    int _2873 = _2871 + _2841;
    int _2875 = _2873 + 1;
    int _2877 = abs(_2849);
    int _2879 = ~_2869;
    int _2881 = _2879 + 1;
    int _2883 = _2881 + 1;
    int _2885 = _1743 * _2875;
    int _2887 = _2885 + _2053;
    int _2889 = _2883 * as_type<int>(_2673);
    bool _2891 = _263 > 0.5;
    int _2893 = ~_2851;
    int _2895 = _2893 + 1;
    int _2897 = _2895 + 1;
    int _2899 = abs(_2825);
    int _2901 = _2897;
    if (_2837)
    {
        int _2903 = ~_2851;
        int _2905 = _2903 + 1;
        _2901 = _2905;
    }
    int _2907 = _2901;
    int _2909 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2911 = _2909 != 0;
    int _2913 = ~_2877;
    int _2915 = _2913 + 1;
    int _2917 = _2915 + 1;
    int _2919 = abs(_2721);
    int _2921 = _2917 * as_type<int>(_2709);
    int _2923 = abs(_2737);
    int _2925 = ~_2919;
    int _2927 = _2925 + 1;
    int _2929 = _2927 + 1;
    int _2931 = ~_2899;
    int _2933 = _2931 + 1;
    int _2935 = _2933 + 1;
    int _2937 = abs(_2907);
    int _2939 = _2929 * as_type<int>(_2665);
    int _2941 = _2939 + _2889;
    int _2943 = ~_2923;
    int _2945 = _2943 + 1;
    int _2947 = _2945 + 1;
    float _2949 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2951 = int(_2949);
    int _2953 = ~_2937;
    int _2955 = _2953 + 1;
    int _2957 = _2955 + 1;
    int _2959 = _2935 * as_type<int>(_2701);
    int _2961 = _2959 + _2921;
    int _2963 = _2947 * as_type<int>(_2779);
    int _2965 = _2963 + _2941;
    int _2967 = _2957 * as_type<int>(_2747);
    int _2969 = _2967 + _2961;
    float _2971 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2973 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2975 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2977 = int(_2975);
    float _2979 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2981 = _2971 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2983 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2985 = _2973 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2987 = _2979 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2989 = float(uint(_2951));
    int _2991 = abs(_2821);
    float _2993 = -_187;
    int _2995 = _2891 ? as_type<int>(_2993) : as_type<int>(_187);
    out.m_76.x = _2981;
    out.m_76.y = _2985;
    out.m_76.z = _2987;
    out.m_76.w = _2983;
    int _2997 = ~_2991;
    int _2999 = _2997 + 1;
    int _3001 = _2999 + 1;
    float _3003 = 1.0 / _2989;
    bool _3005 = _267 > 0.5;
    int _3007 = abs(_2855);
    int _3009 = _3001 * as_type<int>(_2787);
    int _3011 = _3009 + _2965;
    int _3013 = ~_3007;
    int _3015 = _3013 + 1;
    int _3017 = _3015 + 1;
    float _3019 = abs(_1017);
    float _3021 = log2(_3019);
    int _3023 = abs(_2951);
    float _3025 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _3027 = !_1997;
    int _3029 = _3027 ? _2887 : (-1);
    int _3031 = _3017 * as_type<int>(_2755);
    int _3033 = _3031 + _2969;
    int _3035 = abs(_2795);
    float _3037 = _951 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3039 = float(uint(_2977));
    int _3041 = ~_3035;
    int _3043 = _3041 + 1;
    int _3045 = _3043 + 1;
    float _3047 = -_945;
    float _3049 = fma(_3047, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3037);
    int _3051 = abs(_2977);
    float _3053 = _963 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3055 = _3011 * _3045;
    int _3057 = abs(_2815);
    float _3059 = _3021 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3061 = float(uint(_3051));
    int _3063 = _2805 * _3035;
    int _3065 = _3063 + _3055;
    bool _3067 = _265 > 0.5;
    float _3069 = 1.0 / _3039;
    int _3071 = as_type<int>(_3003) + (-2);
    float _3073 = _3025 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3075 = float(uint(_3065));
    float _3077 = _951 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3079 = _951 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3081 = exp2(_3059);
    float _3083 = float(uint(_3023));
    float _3085 = as_type<float>(_3071) * _3075;
    int _3087 = ~_3057;
    int _3089 = _3087 + 1;
    int _3091 = _3089 + 1;
    float _3093 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3095 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3097 = -_945;
    float _3099 = fma(_3097, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3079);
    int _3101 = ~_3051;
    int _3103 = _3101 + 1;
    float _3105 = 1.0 / _3061;
    int _3107 = _3033 * _3091;
    float _3109 = _3093 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3111 = _3095 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3113 = -_945;
    float _3115 = fma(_3113, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3077);
    int _3117 = _3029 * _3057;
    int _3119 = _3117 + _3107;
    int _3121 = abs(_3065);
    float _3123 = _963 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3125 = 1.0 / _3083;
    out.m_78.x = _3109;
    out.m_78.y = _3111;
    out.m_78.z = _3073;
    int _3127 = abs(_3119);
    float _3129 = float(uint(_3121));
    float _3131 = float(uint(_3127));
    float _3133 = trunc(_3085);
    float _3135 = precise::max(_3133, 0.0);
    uint _3137 = uint(_3135);
    int _3139 = as_type<int>(_3105) + (-2);
    float _3141 = as_type<float>(_3139) * _3131;
    int _3143 = as_type<int>(_3069) + (-2);
    float _3145 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3115);
    float _3147 = float(uint(_3119));
    float _3149 = fma(_3081, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3151 = precise::clamp(_3149, 0.0, 1.0);
    int _3153 = ~_2951;
    int _3155 = _3153 + 1;
    float _3157 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3053);
    float _3159 = _973 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3161 = as_type<float>(_3143) * _3147;
    int _3163 = as_type<int>(_3125) + (-2);
    int _3165 = _3155 * int(_3137);
    int _3167 = _3165 + _3065;
    float _3169 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3049);
    float _3171 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3099);
    float _3173 = _963 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3175 = trunc(_3161);
    float _3177 = precise::max(_3175, 0.0);
    uint _3179 = uint(_3177);
    float _3181 = as_type<float>(_3163) * _3129;
    float _3183 = float(uint(_3167));
    float _3185 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3123);
    int _3187 = ~_2977;
    int _3189 = _3187 + 1;
    float _3191 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3173);
    int _3193 = ~_3023;
    int _3195 = _3193 + 1;
    float _3197 = as_type<float>(_3071) * _3183;
    float _3199 = trunc(_3181);
    float _3201 = precise::max(_3199, 0.0);
    uint _3203 = uint(_3201);
    float _3205 = _973 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3207 = _973 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3209 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3159);
    float _3211 = fma(_3151, -2.0, 3.0);
    float _3213 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3205);
    float _3215 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3207);
    float _3217 = trunc(_3141);
    float _3219 = precise::max(_3217, 0.0);
    uint _3221 = uint(_3219);
    int _3223 = _3189 * int(_3179);
    int _3225 = _3223 + _3119;
    bool _3227 = !_2859;
    float _3229 = _3227 ? _191 : as_type<float>(_2715);
    float _3231 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3215);
    bool _3233 = _1017 <= 8000.0;
    bool _3235 = isnan(_1017);
    bool _3237 = _3233 || _3235;
    bool _3239 = isnan(8000.0);
    bool _3241 = _3237 || _3239;
    float _3243 = float(_3241);
    float _3245 = float(uint(_3225));
    int _3247 = _3195 * int(_3203);
    int _3249 = _3247 + _3121;
    float _3251 = trunc(_3197);
    float _3253 = precise::max(_3251, 0.0);
    uint _3255 = uint(_3253);
    float _3257 = as_type<float>(_3143) * _3245;
    float _3259 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3185);
    float _3261 = float(uint(_3249));
    float _3263 = _3151 * _3151;
    float _3265 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3213);
    int _3267 = _3103 * int(_3221);
    int _3269 = _3267 + _3127;
    float _3271 = trunc(_3257);
    float _3273 = precise::max(_3271, 0.0);
    uint _3275 = uint(_3273);
    float _3277 = as_type<float>(_3163) * _3261;
    float _3279 = -_191;
    int _3281 = _3067 ? as_type<int>(_3279) : as_type<int>(_191);
    float _3283 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3157);
    float _3285 = float(uint(_3269));
    float _3287 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3191);
    bool _3289 = !_2911;
    float _3291 = _3289 ? _187 : as_type<float>(_2995);
    float _3293 = _3263 * _3211;
    float _3295 = trunc(_3277);
    float _3297 = precise::max(_3295, 0.0);
    uint _3299 = uint(_3297);
    float _3301 = as_type<float>(_3139) * _3285;
    float _3303 = -_187;
    int _3305 = _3005 ? as_type<int>(_3303) : as_type<int>(_187);
    out.m_80.x = _3259;
    out.m_80.y = _3283;
    out.m_80.z = _3287;
    bool _3307 = !_2863;
    float _3309 = _3307 ? _191 : as_type<float>(_3281);
    float _3311 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _3313 = !_2867;
    float _3315 = _3313 ? _187 : as_type<float>(_3305);
    float _3317 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3209);
    float _3319 = trunc(_3301);
    float _3321 = precise::max(_3319, 0.0);
    uint _3323 = uint(_3321);
    int _3325 = ~_2951;
    int _3327 = _3325 + 1;
    float _3329 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3331 = ~_2977;
    int _3333 = _3331 + 1;
    float _3335 = _3311 * _3145;
    int _3337 = int(_3137) + int(_3255);
    float _3339 = fma(_3329, _3259, _3335);
    int _3341 = int(_3179) + int(_3275);
    int _3343 = _3327 * _3337;
    int _3345 = _3343 + _3065;
    int _3347 = ~_3023;
    int _3349 = _3347 + 1;
    float _3351 = _3317 + _3339;
    int _3353 = ~_3051;
    int _3355 = _3353 + 1;
    int _3357 = _3333 * _3341;
    int _3359 = _3357 + _3119;
    int _3361 = int(_3203) + int(_3299);
    int _3363 = int(_3221) + int(_3323);
    int _3365 = _3349 * _3361;
    int _3367 = _3365 + _3121;
    bool _3369 = uint(_3345) >= uint(_2951);
    bool _3371 = uint(_3359) >= uint(_2977);
    int _3373 = _3355 * _3363;
    int _3375 = _3373 + _3127;
    bool _3377 = !_3369;
    int _3379 = _3377 ? 0 : (-1);
    float _3381 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3383 = !_3371;
    int _3385 = _3383 ? 0 : (-1);
    bool _3387 = uint(_3367) >= uint(_3023);
    int _3389 = ~_3337;
    int _3391 = _3389 + _3379;
    int _3393 = _3391 + 1;
    int _3395 = _3065 ^ _2951;
    float _3397 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3399 = uint(_3375) >= uint(_3051);
    int _3401 = _2951 * _3393;
    int _3403 = _3401 + _3065;
    bool _3405 = !_3387;
    int _3407 = _3405 ? 0 : (-1);
    uint _3409 = uint(int(uint(_3395) >> uint(31)));
    bool _3411 = _2951 == 0;
    float _3413 = _3381 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3415 = _2951 == 0;
    int _3417 = ~_3341;
    int _3419 = _3417 + _3385;
    int _3421 = _3419 + 1;
    float _3423 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3425 = ~_3407;
    int _3427 = _3361 + _3425;
    int _3429 = _3427 + 1;
    int _3431 = ~int(_3409);
    int _3433 = _3431 + 1;
    int _3435 = _3119 ^ _2977;
    bool _3437 = _2977 == 0;
    bool _3439 = _2977 == 0;
    int _3441 = _2977 * _3421;
    int _3443 = _3441 + _3119;
    bool _3445 = !_3399;
    int _3447 = _3445 ? 0 : (-1);
    int _3449 = _3429 ^ _3433;
    uint _3451 = uint(int(uint(_3435) >> uint(31)));
    float _3453 = fma(_3311, _3311, 1.0);
    bool _3455 = !_3411;
    int _3457 = _3455 ? _3403 : (-1);
    int _3459 = ~_3447;
    int _3461 = _3363 + _3459;
    int _3463 = _3461 + 1;
    float _3465 = _3423 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3467 = ~_3433;
    int _3469 = _3467 + _3449;
    int _3471 = _3469 + 1;
    float _3473 = _3291 + 0.5;
    int _3475 = ~int(_3451);
    int _3477 = _3475 + 1;
    float _3479 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _3481 = !_3437;
    int _3483 = _3481 ? _3443 : (-1);
    float _3485 = float(_3457);
    int _3487 = _3463 ^ _3477;
    float _3489 = float(_3483);
    float _3491 = fma(_3413, _3485, _357);
    int _3493 = ~_3477;
    int _3495 = _3493 + _3487;
    int _3497 = _3495 + 1;
    float _3499 = _3397 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3501 = rsqrt(_3453);
    float _3503 = fma(_3413, _3473, _3491);
    bool _3505 = !_3439;
    int _3507 = _3505 ? _3497 : (-1);
    float _3509 = fma(_3465, _3489, _713);
    float _3511 = _3315 + 0.5;
    bool _3513 = !_3415;
    int _3515 = _3513 ? _3471 : (-1);
    float _3517 = float(_3507);
    float _3519 = _3479 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3521 = fma(_3465, _3511, _3509);
    float _3523 = float(_3515);
    float _3525 = -_715;
    float _3527 = fma(_3519, _3517, _3525);
    float _3529 = _3229 + (-0.5);
    float _3531 = -_353;
    float _3533 = fma(_3499, _3523, _3531);
    float _3535 = _3309 + (-0.5);
    float _3537 = -_3519;
    float _3539 = fma(_3537, _3529, _3527);
    float _3541 = -_2605;
    float _3543 = fma(_3315, _3541, _3521);
    float _3545 = _2503 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3547 = -_3293;
    float _3549 = _3547 + 1.0;
    float _3551 = _3311 * _3501;
    float _3553 = _3311 * _3169;
    float _3555 = -_3499;
    float _3557 = fma(_3555, _3535, _3533);
    float _3559 = fma(_3549, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3293);
    float _3561 = exp2(_3545);
    float _3563 = -_3265;
    float _3565 = _3551 * _3563;
    float _3567 = fma(_3329, _3283, _3553);
    float _3569 = _3243 * _3559;
    float _3571 = fma(_3229, _2631, _3539);
    float _3573 = fma(_3501, _3169, _3565);
    float _3575 = -_2619;
    float _3577 = fma(_3291, _3575, _3503);
    float _3579 = _3265 + _3567;
    float _3581 = _3569 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3583 = -_3317;
    float _3585 = _3551 * _3583;
    float _3587 = _3569;
    if (!_1604)
    {
        _1646 = 1.0;
    }
    float _3589 = _1646;
    float _3591 = _2637 * _3581;
    float _3593 = precise::clamp(_3591, 0.0, 1.0);
    float _3595 = _3589;
    if (_1604)
    {
        bool _3597 = _1704 >= _1670;
        bool _3599 = isnan(_1704);
        bool _3601 = _3597 || _3599;
        bool _3603 = isnan(_1670);
        bool _3605 = _3601 || _3603;
        float _3607 = float(_3605);
        _3595 = _3607;
    }
    float _3609 = _3595;
    float _3611 = fma(_3309, _2643, _3557);
    float _3613 = _3311 * _3171;
    float _3615 = -_3561;
    float _3617 = _3615 + 1.0;
    float _3619 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2647);
    float _3621 = _3609 * _2317;
    float _3623 = -_3593;
    float _3625 = fma(_3623, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3627 = _3617 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3629 = fma(_3501, _3145, _3585);
    float _3631 = -_3231;
    float _3633 = _3551 * _3631;
    float _3635 = fma(_3329, _3287, _3613);
    float _3637 = _3627 * _1706;
    float _3639 = _3619 + _1608;
    float _3641 = -_3621;
    float _3643 = fma(_3641, _3625, 1.0);
    float _3645 = precise::clamp(_3643, 0.0, 1.0);
    float _3647 = -_3627;
    float _3649 = _3647 + 1.0;
    float _3651 = _1717 * _3637;
    float _3653 = _2569 * _3637;
    float _3655 = fma(_3501, _3171, _3633);
    float _3657 = _3231 + _3635;
    float _3659 = _3639 * 0.5;
    float _3661 = fma(_2565, _3651, _1711);
    float _3663 = fma(_2567, _3651, _1713);
    float _3665 = _3645 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3667 = _1717 * _3649;
    float _3669 = fma(_1717, _3653, _1715);
    out.m_82.x = _3629;
    out.m_82.y = _3573;
    out.m_82.z = _3655;
    bool _3671 = _2339 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3673 = isnan(_2339);
    bool _3675 = _3671 || _3673;
    bool _3677 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3679 = _3675 || _3677;
    out.m_84.x = _3577;
    out.m_84.y = _3611;
    out.m_84.z = _3543;
    out.m_84.w = _3571;
    out.gl_Position.x = _1638;
    out.gl_Position.y = _1666;
    out.gl_Position.z = _3619;
    out.gl_Position.w = _1608;
    out.m_86.z = _3659;
    out.m_86.w = _1608;
    float _3681 = _3649;
    float _3683 = _3621;
    float _3685 = _3645;
    float _3687 = _3651;
    if (!_3679)
    {
        _3681 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3689 = _3681;
    out.m_88.x = _2573;
    out.m_88.y = _2575;
    out.m_88.z = _2577;
    float _3691 = _3689;
    float _3693 = _3689;
    if (!_3679)
    {
        _3683 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3695 = _3683;
    float _3697 = _3695;
    float _3699 = _3695;
    if (!_3679)
    {
        _2253 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3701 = _2253;
    out.m_90.x = _3665;
    float _3703 = _3701;
    float _3705 = _3701;
    if (!_3679)
    {
        _3587 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3707 = _3587;
    float _3709 = _3707;
    float _3711 = _3707;
    if (!_3679)
    {
        _3685 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3713 = _3685;
    out.m_92.x = _3661;
    out.m_92.y = _3663;
    out.m_92.z = _3669;
    out.m_92.w = _3667;
    float _3715 = _3713;
    float _3717 = _3713;
    if (!_3679)
    {
        _3687 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3719 = _3687;
    out.m_94.x = _3351;
    out.m_94.y = _3579;
    out.m_94.z = _3657;
    bool _3721 = !_3679;
    float _3723 = _3719;
    float _3725 = _3719;
    if (!_3721)
    {
        bool _3727 = _2339 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3729 = isnan(_2339);
        bool _3731 = _3727 || _3729;
        bool _3733 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3735 = _3731 || _3733;
        if (!_3735)
        {
            float _3737 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3739 = _2339 + _3737;
            float _3741 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3743 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3741;
            float _3745 = 1.0 / _3743;
            float _3747 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3749 = _3747 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3751 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3753 = _3751 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3755 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3757 = _3755 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3759 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3761 = _3759 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3763 = _3739 * _3745;
            float _3765 = precise::clamp(_3763, 0.0, 1.0);
            float _3767 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3769 = _3767 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3771 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3773 = _3771 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3775 = fma(_3765, _3749, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3777 = fma(_3765, _3769, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3779 = fma(_3765, _3773, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3781 = fma(_3765, _3753, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3783 = fma(_3765, _3757, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3785 = fma(_3765, _3761, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3699 = _3779;
            _3717 = _3783;
            _3693 = _3777;
            _3711 = _3781;
            _3705 = _3775;
            _3725 = _3785;
            _3787 = true;
        }
        else
        {
            bool _3789 = _2339 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3791 = isnan(_2339);
            bool _3793 = _3789 || _3791;
            bool _3795 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3797 = _3793 || _3795;
            if (!_3797)
            {
                _3691 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3799 = _3691;
            _3693 = _3799;
            if (!_3797)
            {
                _3697 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3801 = _3697;
            _3699 = _3801;
            if (!_3797)
            {
                _3703 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3803 = _3703;
            _3705 = _3803;
            if (!_3797)
            {
                _3709 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3805 = _3709;
            _3711 = _3805;
            if (!_3797)
            {
                _3715 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3807 = _3715;
            _3717 = _3807;
            if (!_3797)
            {
                _3723 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3809 = _3723;
            bool _3811 = !_3797;
            _3725 = _3809;
            if (!_3811)
            {
                bool _3813 = _2339 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3815 = isnan(_2339);
                bool _3817 = _3813 || _3815;
                bool _3819 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3821 = _3817 || _3819;
                if (!_3821)
                {
                    float _3823 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3825 = _2339 + _3823;
                    float _3827 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3829 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3827;
                    float _3831 = 1.0 / _3829;
                    float _3833 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3835 = _3833 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3837 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3839 = _3837 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3841 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3843 = _3841 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3845 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3847 = _3845 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3849 = _3825 * _3831;
                    float _3851 = precise::clamp(_3849, 0.0, 1.0);
                    float _3853 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3855 = _3853 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3857 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3859 = _3857 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3861 = fma(_3851, _3835, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3863 = fma(_3851, _3855, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3865 = fma(_3851, _3859, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3867 = fma(_3851, _3839, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3869 = fma(_3851, _3843, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3871 = fma(_3851, _3847, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3699 = _3865;
                    _3717 = _3869;
                    _3693 = _3863;
                    _3711 = _3867;
                    _3705 = _3861;
                    _3725 = _3871;
                    _3787 = true;
                }
                else
                {
                    _3699 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3717 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3693 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3711 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3705 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3725 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3787 = false;
    float _3873 = _3699;
    float _3875 = _3717;
    float _3877 = _3693;
    float _3879 = _3711;
    float _3881 = _3705;
    float _3883 = _3725;
    float _3885 = fma(_3579, -0.5, 0.5);
    float _3887 = precise::clamp(_3885, 0.0, 1.0);
    float _3889 = -_3873;
    float _3891 = _3889 + _3875;
    float _3893 = -_3877;
    float _3895 = _3893 + _3879;
    float _3897 = -_3881;
    float _3899 = _3897 + _3883;
    bool _3901 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3903 = fma(_3887, _3891, _3873);
    float _3905 = fma(_3887, _3895, _3877);
    float _3907 = fma(_3887, _3899, _3881);
    float _3909 = _3903 * 0.586610972881317138671875;
    out.m_96.x = 0.0;
    float _3911 = fma(_3905, 0.298911988735198974609375, _3909);
    float _3913 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3915 = fma(_3907, 0.114477999508380889892578125, _3911);
    out.m_61.x = _3913;
    float _3917 = -_3915;
    float _3919 = _3905 + _3917;
    float _3921 = -_3915;
    float _3923 = _3903 + _3921;
    float _3925 = -_3915;
    float _3927 = _3907 + _3925;
    float _3929 = fma(_3919, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3915);
    float _3931 = fma(_3923, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3915);
    float _3933 = fma(_3927, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3915);
    out.m_98.x = _3929;
    out.m_98.y = _3931;
    out.m_98.z = _3933;
    if (!_3901)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3935 = -_1500;
    float _3937 = _3935 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3939 = -_1502;
    float _3941 = _3939 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3943 = -_1504;
    float _3945 = _3943 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3947 = _3937 * _3937;
    float _3949 = fma(_3941, _3941, _3947);
    float _3951 = fma(_3945, _3945, _3949);
    float _3953 = sqrt(_3951);
    float _3955 = rsqrt(_3951);
    float _3957 = -_3953;
    float _3959 = _3957 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3961 = _3959 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3963 = precise::clamp(_3961, 0.0, 1.0);
    float _3965 = _3941 * _3955;
    float _3967 = _3937 * _3955;
    float _3969 = abs(_3963);
    float _3971 = log2(_3969);
    float _3973 = _3945 * _3955;
    float _3975 = _3965 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3977 = _3579 * _3967;
    float _3979 = -_3967;
    float _3981 = -_3975;
    float _3983 = fma(_3979, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3981);
    float _3985 = fma(_3351, _3965, _3977);
    float _3987 = -_3973;
    float _3989 = fma(_3987, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3983);
    float _3991 = fma(_3657, _3973, _3985);
    float _3993 = precise::clamp(_3991, 0.0, 1.0);
    float _3995 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3997 = _3989 + _3995;
    float _3999 = _3971 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4001 = _3997 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4003 = precise::clamp(_4001, 0.0, 1.0);
    float _4005 = exp2(_3999);
    float _4007 = _4005 * _4003;
    float _4009 = _3993 * _4007;
    float _4011 = _4009 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4013 = _4009 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4015 = _4009 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_96.x = _4011;
    out.m_96.y = _4013;
    out.m_96.z = _4015;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3787 = false;
    bool _213 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_58.w;
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
        out.m_61.x = 0.0;
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
        float _4072 = as_type<float>(_133);
        out.gl_Position.z = _4072;
    }
    if (!_121)
    {
        return out;
    }
    float _137 = in.m_63.w;
    bool _139 = _137 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_137);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = -_137;
    float _151 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _153 = 0.0;
    float _155 = _151;
    if (_147)
    {
        float _157 = float(_117);
        _153 = _157;
    }
    float _159 = _153;
    bool _161 = _151 >= _159;
    bool _163 = !_147;
    bool _165 = _161 || _163;
    if (_165)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _167 = _127;
    if (_165)
    {
        out.m_61.x = 0.0;
    }
    if (_165)
    {
        float _169 = _167 * 5.0;
        _135 = as_type<int>(_169);
    }
    int _171 = _135;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4141 = as_type<float>(_171);
        out.gl_Position.z = _4141;
    }
    if (_165)
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
        float _195 = in.m_68.x;
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
    float _223 = in.m_58.x;
    float _225 = in.m_58.y;
    float _227 = in.m_58.z;
    float _229 = _225 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _231 = _225 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _233 = fma(_223, (*spvDescriptorSet0.vp_c10)._m0[6].x, _229);
    float _235 = fma(_223, (*spvDescriptorSet0.vp_c10)._m0[4].x, _231);
    float _237 = fma(_227, (*spvDescriptorSet0.vp_c10)._m0[6].z, _233);
    float _239 = fma(_227, (*spvDescriptorSet0.vp_c10)._m0[4].z, _235);
    float _241 = _237 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _243 = _239 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _245 = fma(_241, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _247 = fma(_243, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _249 = floor(_245);
    float _251 = floor(_247);
    float _253 = -_249;
    float _255 = _245 + _253;
    float _257 = -_251;
    float _259 = _247 + _257;
    float2 _4290 = float2(_259, _255);
    float _261 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4290, float2(0.0), isnan(_4290)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4290, float2(0.0), isnan(_4290)), level(0.0)).x;
    float _263 = in.m_68.x;
    float _265 = in.m_68.y;
    float _267 = in.m_68.z;
    float _269 = in.m_68.w;
    float _271 = _225 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _273 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _275 = log2(_273);
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _283 = _281 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _285 = fma(_223, (*spvDescriptorSet0.vp_c10)._m0[5].x, _271);
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _289 = _221 + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _291;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _297 = _221 + _295;
    float _299 = 1.0 / _283;
    float _301 = fma(_227, (*spvDescriptorSet0.vp_c10)._m0[5].z, _285);
    int _303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _305 = _303 != 0;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _309 = 1.0 / _279;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _313 = float(_117);
    float _315 = _263 * 2.0;
    float _317 = _265 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _319;
    float _323 = _289 * _299;
    float _325 = _267 * 2.0;
    float _327 = 1.0 / _293;
    float _329 = _263 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _331 = fma(_317, -2.0, _311);
    float _333 = _267 + _263;
    float _335 = _297 * _309;
    float _337 = _263 + _265;
    float _339 = floor(_325);
    float _341 = _265 * 2.0;
    float _343 = -_307;
    float _345 = fma(_329, 2.0, _343);
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _349 = _221 + _347;
    float _351 = _333 + (-1.0);
    float _353 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[76].y, _331);
    float _355 = -_151;
    float _357 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[76].x, _345);
    float _359 = floor(_315);
    float _361 = _349 * _327;
    float _363 = fma(_321, _361, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _365 = floor(_341);
    float _367 = _337 + (-1.0);
    float _369 = _267 + _265;
    bool _371 = _339 > 0.0;
    float _373 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _375 = _369 + (-1.0);
    float _377 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _379 = _359 >= 0.0;
    bool _381 = isnan(_359);
    bool _383 = _379 || _381;
    bool _385 = isnan(0.0);
    bool _387 = _383 || _385;
    float _389 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _391 = int(_389);
    float _393 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _395 = as_type<int>(_375);
    float _397 = _313;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_305)
    {
        _395 = 0;
    }
    int _401 = _395;
    int _403 = _401;
    if (!_305)
    {
        _403 = 1;
    }
    int _405 = _403;
    bool _407 = _339 >= 0.0;
    bool _409 = isnan(_339);
    bool _411 = _407 || _409;
    bool _413 = isnan(0.0);
    bool _415 = _411 || _413;
    bool _417 = _359 > 0.0;
    float _419 = 1.0 / _313;
    bool _421 = _365 > 0.0;
    bool _423 = _365 >= 0.0;
    bool _425 = isnan(_365);
    bool _427 = _423 || _425;
    bool _429 = isnan(0.0);
    bool _431 = _427 || _429;
    float _433 = _387 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _435 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _437 = int(_435);
    bool _439 = _405 != 1;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _441;
    int _445 = _415 ? 0 : 1;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _447;
    float _451 = _431 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _457 = ~_445;
    int _459 = _457 + 1;
    int _461 = _459 + 1;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _465 = _463 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _467 = _461;
    float _469 = _451;
    float _471 = _433;
    if (!_371)
    {
        int _473 = ~_445;
        int _475 = _473 + 1;
        _467 = _475;
    }
    int _477 = _467;
    float _479 = fma(_443, _335, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _483 = _481 != 0;
    int _485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _487 = _485 != 0;
    int _489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _491 = _489 != 0;
    float _493 = fma(_449, _335, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _495 = fma(_455, _323, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _497 = fma(_465, _323, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _499 = ~as_type<int>(_451);
    int _501 = _499 + 1;
    int _503 = _501 + 1;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _505;
    int _509 = _503;
    if (!_421)
    {
        int _511 = ~as_type<int>(_451);
        int _513 = _511 + 1;
        _509 = _513;
    }
    int _515 = _509;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _519 = fma(_507, _361, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    if (!_439)
    {
        _469 = _267;
    }
    float _521 = _469;
    bool _523 = !_487;
    int _525 = _523 ? 0 : 1;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _529 = !_483;
    int _531 = _529 ? 0 : 1;
    bool _533 = !_491;
    int _535 = _533 ? 0 : 1;
    int _537 = ~as_type<int>(_433);
    int _539 = _537 + 1;
    int _541 = _539 + 1;
    float _543 = _521;
    int _545 = _541;
    if (_439)
    {
        _543 = _265;
    }
    float _547 = _543;
    int _549 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _551 = _549 != 0;
    int _553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _555 = _553 != 0;
    int _557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _559 = _557 != 0;
    float _561 = _547;
    if (!_417)
    {
        int _563 = ~as_type<int>(_433);
        int _565 = _563 + 1;
        _545 = _565;
    }
    int _567 = _545;
    float _569 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[83].w, _517);
    if (!_439)
    {
        _471 = _265;
    }
    float _571 = _471;
    float _573 = _571;
    if (_439)
    {
        _573 = _263;
    }
    float _575 = _573;
    bool _577 = !_555;
    int _579 = _577 ? 0 : 1;
    bool _581 = !_551;
    int _583 = _581 ? 0 : 1;
    float _585 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[83].z, _527);
    if (!_439)
    {
        _397 = _267;
    }
    float _587 = _397;
    float _589 = _587;
    if (!_439)
    {
        _561 = _265;
    }
    float _591 = _561;
    float _593 = _591;
    if (_439)
    {
        _589 = _265;
    }
    float _595 = _589;
    float _597 = float(_391);
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _601 = abs(_579);
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (_439)
    {
        _593 = _263;
    }
    float _605 = _593;
    float _607 = 1.0 / _597;
    int _609 = abs(_583);
    float _611 = _595 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _613 = float(_567);
    float _615 = _605 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _617 = float(_609);
    float _619 = _275 * _151;
    float _621 = float(_477);
    float _623 = -_599;
    float _625 = fma(_615, 2.0, _623);
    float _627 = float(_601);
    float _629 = fma(_611, -2.0, _603);
    float _631 = float(_437);
    float _633 = exp2(_619);
    float _635 = _617 * _621;
    float _637 = _627 * _613;
    float _639 = in.m_70.x;
    float _641 = in.m_70.y;
    float _643 = in.m_70.z;
    float _645 = _419 * _151;
    float _647 = _635 * (-2.0);
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _651 = 1.0 + _649;
    float _653 = 1.0 / _631;
    bool _655 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _657 = isnan(0.0);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _663 = _659 || _661;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _667 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _669 = isnan(1.0);
    bool _671 = _667 || _669;
    bool _673 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _675 = _671 || _673;
    float _677 = _607 * _151;
    float _679 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[78].w, _665);
    float _681 = -_633;
    float _683 = _681 + 1.0;
    float _685 = 1.0 / _651;
    float _687 = _663 ? _683 : 0.0;
    float _689 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[82].z, _585);
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _693 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[82].w, _569);
    float _695 = fma(_373, _647, _373);
    float _697 = _301 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _699 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[78].z, _691);
    float _701 = fma(_647, _639, _639);
    float _703 = _263 + (-0.5);
    float _705 = _653 * _151;
    float _707 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[77].z, _699);
    float _709 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[77].w, _679);
    float _711 = -_151;
    float _713 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[81].x, _625);
    float _715 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[81].y, _629);
    float _717 = _705;
    if (_675)
    {
        float _719 = _687 * _685;
        _155 = _719;
    }
    float _721 = _155;
    float _723 = _637 * (-2.0);
    bool _725 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _727 = isnan(_221);
    bool _729 = _725 || _727;
    bool _731 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _733 = _729 || _731;
    float _735 = float(_733);
    float _737 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[196].x, _701);
    bool _739 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _741 = isnan(_221);
    bool _743 = _739 || _741;
    bool _745 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _747 = _743 || _745;
    float _749 = float(_747);
    float _751 = _697 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _753 = fma(_723, _641, _641);
    float _755 = fma(_695, _721, _737);
    float _757 = fma(_393, _723, _393);
    float _759 = -_735;
    float _761 = _759 + 1.0;
    bool _763 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _765 = isnan(_221);
    bool _767 = _763 || _765;
    bool _769 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _771 = _767 || _769;
    float _773 = float(_771);
    float _775 = fma(_243, (*spvDescriptorSet0.vp_c8)._m0[11].x, _751);
    bool _777 = !_559;
    int _779 = _777 ? 0 : 1;
    float _781 = -_749;
    float _783 = _781 + 1.0;
    float _785 = _749 * _761;
    float _787 = fma(_241, (*spvDescriptorSet0.vp_c8)._m0[11].z, _775);
    int _789 = abs(_779);
    float _791 = _773 * _783;
    bool _793 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _795 = isnan(_221);
    bool _797 = _793 || _795;
    bool _799 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _801 = _797 || _799;
    float _803 = float(_801);
    float _805 = -_773;
    float _807 = _805 + 1.0;
    float _809 = _755 * 0.15915493667125701904296875;
    float _811 = float(_515);
    float _813 = _265 + (-0.5);
    float _815 = float(_789);
    float _817 = _803 * _807;
    float _819 = _787 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _821 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[196].y, _753);
    float _823 = _697 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _825 = _815 * _811;
    float _827 = _479 * _817;
    float _829 = -_803;
    float _831 = _829 + 1.0;
    float _833 = _493 * _817;
    float _835 = _825 * (-2.0);
    float _837 = in.m_72.x;
    float _839 = in.m_72.y;
    float _841 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[143].x, _827);
    float _843 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[143].y, _833);
    float _845 = fma(_835, _643, _643);
    float _847 = _267 + (-0.5);
    float _849 = fma(_377, _835, _377);
    float _851 = fma(_757, _721, _821);
    float _853 = fma(_497, _791, _843);
    float _855 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[196].z, _845);
    float _857 = fma(_243, (*spvDescriptorSet0.vp_c8)._m0[10].x, _823);
    float _859 = _851 * 0.15915493667125701904296875;
    float _861 = 1.0 / _819;
    float _863 = fma(_849, _721, _855);
    float _865 = fma(_495, _791, _841);
    float _867 = fma(_363, _785, _853);
    float _869 = fma(_241, (*spvDescriptorSet0.vp_c8)._m0[10].z, _857);
    float _871 = _863 * 0.15915493667125701904296875;
    float _873 = fma(_519, _785, _865);
    float _875 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[146].y, _867);
    float _877 = _809 * 6.283185482025146484375;
    float _879 = cos(_877);
    float _881 = _869 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _883 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[146].x, _873);
    float _885 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _887 = _875 * _839;
    float _889 = _881 + _819;
    float _891 = _883 * _837;
    float _893 = _859 * 6.283185482025146484375;
    float _895 = sin(_893);
    float _897 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _191);
    float _899 = _887 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _901 = _889 * _861;
    float _903 = _901 * 0.5;
    float _905 = _891 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _907 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _909 = _899 * _897;
    float _911 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _913 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[30].w, _911);
    float _915 = _859 * 6.283185482025146484375;
    float _917 = cos(_915);
    float _919 = _905 * _885;
    float _921 = _697 + _907;
    float _923 = _921 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _925 = _809 * 6.283185482025146484375;
    float _927 = sin(_925);
    float _929 = _879 * _895;
    float _931 = fma(_243, (*spvDescriptorSet0.vp_c15)._m0[126].x, _923);
    float _933 = fma(_241, (*spvDescriptorSet0.vp_c15)._m0[126].z, _931);
    float _935 = _871 * 6.283185482025146484375;
    float _937 = cos(_935);
    float _939 = _879 * _917;
    float _941 = _933 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _943 = _871 * 6.283185482025146484375;
    float _945 = sin(_943);
    float _947 = _927 * _895;
    float _949 = _927 * _917;
    float _951 = _879 * _937;
    float _953 = _927 * _937;
    float _955 = _917 * _937;
    float _957 = _895 * _937;
    float _959 = _951 * _909;
    float _961 = 1.0 / _913;
    float _963 = fma(_945, _939, _947);
    float _965 = -_929;
    float _967 = fma(_945, _949, _965);
    float _969 = fma(_945, _947, _939);
    float _971 = -_949;
    float _973 = fma(_945, _929, _971);
    float _975 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _977 = -_909;
    float _979 = _945 * _977;
    float _981 = fma(_963, _919, _959);
    float _983 = _953 * _909;
    float _985 = trunc(_941);
    int _987 = int(_985);
    float _989 = fma(_955, _919, _979);
    float _991 = fma(_973, _975, _981);
    float _993 = fma(_967, _919, _983);
    float _995 = fma(_957, _975, _989);
    float _997 = _991 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _999 = fma(_969, _975, _993);
    float _1001 = _921 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1003 = _991 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1005 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[26].x, _997);
    float _1007 = _991 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1009 = fma(_243, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1001);
    float _1011 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1003);
    float _1013 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1005);
    float _1015 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1017 = _961 * _1015;
    float _1019 = fma(_241, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1009);
    float _1021 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1011);
    float _1023 = _1013 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _1025 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1027 = _987 + _1025;
    int _1029 = _1027 + 1;
    float _1031 = _1019 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _1033 = _1017 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1035 = _1021 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    bool _1037 = _1017 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1039 = _241 + _1023;
    float _1041 = trunc(_1031);
    int _1043 = int(_1041);
    float _1045 = _243 + _1035;
    bool _1047 = !_1033;
    int _1049 = _1047 ? 0 : 1;
    float _1051 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1053 = _1039 + _1051;
    float _1055 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1057 = _1045 + _1055;
    float _1059 = _1053 * _1053;
    int _1061 = 2;
    int _1063 = _1029;
    int _1065 = as_type<int>(_999);
    float _1067 = _1045;
    float _1069 = _1039;
    float _1071 = _1057;
    if (!_1033)
    {
        _1061 = 1;
    }
    int _1073 = _1061;
    int _1075 = _1073;
    if (!_1037)
    {
        _1075 = _1049;
    }
    int _1077 = _1075;
    float _1079 = fma(_1057, _1057, _1059);
    bool _1081 = _1029 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1083 = _1077 << 6;
    float _1085 = sqrt(_1079);
    int _1087 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1089 = _1043 + _1087;
    int _1091 = _1089 + 1;
    int _1093 = _1083 + 48;
    uint _1096 = uint(int(uint(_1093) >> uint(2)));
    uint _1098 = uint(int(uint(int(_1096)) >> uint(2)));
    int _1100 = int(_1096) & 3;
    float _1102 = (*spvDescriptorSet0.vp_c15)._m0[int(_1098)][_1100];
    int _1104 = int(_1096) + 1;
    uint _1106 = uint(int(uint(_1104) >> uint(2)));
    int _1108 = _1104 & 3;
    float _1110 = (*spvDescriptorSet0.vp_c15)._m0[int(_1106)][_1108];
    int _1112 = _1029 | _1091;
    bool _1114 = _1112 < 0;
    bool _1116 = _1114 || _1081;
    int _1118 = _1083 + 96;
    uint _1120 = uint(int(uint(_1118) >> uint(2)));
    uint _1122 = uint(int(uint(int(_1120)) >> uint(2)));
    int _1124 = int(_1120) & 3;
    float _1126 = (*spvDescriptorSet0.vp_c15)._m0[int(_1122)][_1124];
    int _1128 = int(_1120) + 1;
    uint _1130 = uint(int(uint(_1128) >> uint(2)));
    int _1132 = _1128 & 3;
    float _1134 = (*spvDescriptorSet0.vp_c15)._m0[int(_1130)][_1132];
    bool _1136 = _1091 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1138 = _1136 || _1116;
    bool _1140 = _1085 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1142 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1144 = _1085 + _1142;
    int _1146 = _1083 + 64;
    uint _1148 = uint(int(uint(_1146) >> uint(2)));
    uint _1150 = uint(int(uint(int(_1148)) >> uint(2)));
    int _1152 = int(_1148) & 3;
    float _1154 = (*spvDescriptorSet0.vp_c15)._m0[int(_1150)][_1152];
    int _1156 = int(_1148) + 1;
    uint _1158 = uint(int(uint(_1156) >> uint(2)));
    int _1160 = _1156 & 3;
    float _1162 = (*spvDescriptorSet0.vp_c15)._m0[int(_1158)][_1160];
    int _1164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1166 = _1164 != 0;
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1170 = _1168 != 0;
    int _1172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1174 = _1172 != 0;
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1178 = _1176 != 0;
    bool _1180 = !_1166;
    int _1182 = _1180 ? 0 : 1;
    float _1184 = _1144;
    if (!_1138)
    {
        int _1186 = _1091 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1188 = _1186 + _1029;
        _1063 = _1188;
    }
    int _1190 = _1063;
    int _1192 = _1083 + 56;
    uint _1194 = uint(int(uint(_1192) >> uint(2)));
    uint _1196 = uint(int(uint(int(_1194)) >> uint(2)));
    int _1198 = int(_1194) & 3;
    float _1200 = (*spvDescriptorSet0.vp_c15)._m0[int(_1196)][_1198];
    int _1202 = int(_1194) + 1;
    uint _1204 = uint(int(uint(_1202) >> uint(2)));
    int _1206 = _1202 & 3;
    float _1208 = (*spvDescriptorSet0.vp_c15)._m0[int(_1204)][_1206];
    float _1210 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1007);
    float _1212 = as_type<float>(_1112);
    float _1214 = as_type<float>(_1190);
    if (_1140)
    {
        float _1216 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1212 = _1216;
    }
    float _1218 = _1212;
    int _1220 = 0;
    if (!_1138)
    {
        int _1222 = _1190 << 2;
        _1220 = _1222;
    }
    int _1224 = _1220;
    float _1226 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1210);
    int _1228 = 0;
    int _1230 = _1224;
    if (!_1138)
    {
        uint _1232 = uint(int(uint(_1190) >> uint(2)));
        _1228 = int(_1232);
    }
    int _1234 = _1228;
    int _1236 = _1083 + 104;
    uint _1238 = uint(int(uint(_1236) >> uint(2)));
    uint _1240 = uint(int(uint(int(_1238)) >> uint(2)));
    int _1242 = int(_1238) & 3;
    float _1244 = (*spvDescriptorSet0.vp_c15)._m0[int(_1240)][_1242];
    int _1246 = int(_1238) + 1;
    uint _1248 = uint(int(uint(_1246) >> uint(2)));
    int _1250 = _1246 & 3;
    float _1252 = (*spvDescriptorSet0.vp_c15)._m0[int(_1248)][_1250];
    if (!_1138)
    {
        int _1254 = 12 & _1224;
        _1230 = _1254;
    }
    int _1256 = _1230;
    if (!_1138)
    {
        int _1258 = _1234 << 4;
        int _1260 = _1258 + _1256;
        _1065 = _1260;
    }
    int _1262 = _1065;
    float _1264 = _1226 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1266 = _1083 + 72;
    uint _1268 = uint(int(uint(_1266) >> uint(2)));
    uint _1270 = uint(int(uint(int(_1268)) >> uint(2)));
    int _1272 = int(_1268) & 3;
    float _1274 = (*spvDescriptorSet0.vp_c15)._m0[int(_1270)][_1272];
    int _1276 = int(_1268) + 1;
    uint _1278 = uint(int(uint(_1276) >> uint(2)));
    int _1280 = _1276 & 3;
    float _1282 = (*spvDescriptorSet0.vp_c15)._m0[int(_1278)][_1280];
    float _1284 = _1218;
    if (_1140)
    {
        float _1286 = _1144 * _1218;
        _1284 = _1286;
    }
    float _1288 = _1284;
    float _1290 = _697 + _1264;
    if (_1140)
    {
        float _1292 = rsqrt(_1079);
        _1184 = _1292;
    }
    float _1294 = _1184;
    float _1296 = 0.0;
    if (_1140)
    {
        float _1298 = _1288 * 0.15915493667125701904296875;
        _1296 = _1298;
    }
    float _1300 = _1296;
    int _1302 = _1083 + 80;
    uint _1304 = uint(int(uint(_1302) >> uint(2)));
    uint _1306 = uint(int(uint(int(_1304)) >> uint(2)));
    int _1308 = int(_1304) & 3;
    float _1310 = (*spvDescriptorSet0.vp_c15)._m0[int(_1306)][_1308];
    int _1312 = int(_1304) + 1;
    uint _1314 = uint(int(uint(_1312) >> uint(2)));
    int _1316 = _1312 & 3;
    float _1318 = (*spvDescriptorSet0.vp_c15)._m0[int(_1314)][_1316];
    float _1320 = _921 * _1110;
    float _1322 = _1288;
    float _1324 = _1102;
    if (_1140)
    {
        float _1326 = _1300 * 6.283185482025146484375;
        float _1328 = sin(_1326);
        _1322 = _1328;
    }
    float _1330 = _1322;
    float _1332 = fma(_243, _1102, _1320);
    if (_1140)
    {
        float _1334 = _1290 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1324 = _1334;
    }
    float _1336 = _1324;
    bool _1338 = !_1174;
    int _1340 = _1338 ? 0 : 1;
    float _1342 = _921 * _1134;
    float _1344 = fma(_243, _1126, _1342);
    float _1346 = _1110;
    float _1348 = _1336;
    float _1350 = _1344;
    float _1352 = _1126;
    if (_1140)
    {
        float _1354 = _1300 * 6.283185482025146484375;
        float _1356 = cos(_1354);
        _1346 = _1356;
    }
    float _1358 = _1346;
    float _1360 = _921 * _1162;
    float _1362 = fma(_243, _1154, _1360);
    float _1364 = _1330;
    if (_1140)
    {
        float _1366 = fma(_1330, _1336, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1364 = _1366;
    }
    float _1368 = _1364;
    bool _1370 = !_1178;
    int _1372 = _1370 ? 0 : 1;
    float _1374 = fma(_241, _1200, _1332);
    bool _1376 = !_1170;
    int _1378 = _1376 ? 0 : 1;
    float _1380 = _1368;
    float _1382 = _1208;
    if (_1140)
    {
        float _1384 = _1294 * _1368;
        _1380 = _1384;
    }
    float _1386 = _1380;
    bool _1388 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1390 = isnan(0.5);
    bool _1392 = _1388 || _1390;
    bool _1394 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1396 = _1392 || _1394;
    if (_1140)
    {
        float _1398 = _1358 + (-1.0);
        _1348 = _1398;
    }
    float _1400 = _1348;
    if (_1140)
    {
        float _1402 = fma(_1057, _1386, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1067 = _1402;
    }
    float _1404 = _1067;
    if (_1140)
    {
        float _1406 = fma(_1053, _1386, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1069 = _1406;
    }
    float _1408 = _1069;
    float _1410 = fma(_241, _1244, _1344);
    if (!_1140)
    {
        _1350 = _1290;
    }
    float _1412 = _1350;
    float _1414 = fma(_241, _1274, _1362);
    float _1416 = _1374 + _1208;
    float _1418 = _1410 + _1252;
    float _1420 = _1412;
    if (_1140)
    {
        float _1422 = _1400 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1382 = _1422;
    }
    float _1424 = _1382;
    float _1426 = _1252;
    if (!_1138)
    {
        float _1428 = floor(_941);
        _1426 = _1428;
    }
    float _1430 = _1426;
    float _1432 = _1414 + _1282;
    if (_1396)
    {
        _1352 = _1404;
    }
    float _1434 = _1352;
    float _1436 = _1434;
    if (_1140)
    {
        float _1438 = fma(_1290, _1358, _1424);
        _1420 = _1438;
    }
    float _1440 = _1420;
    float _1442 = _1440;
    if (_1396)
    {
        _1071 = _1408;
    }
    float _1444 = _1071;
    float _1446 = 1.0 / _1418;
    float _1448 = _1444;
    if (!_1396)
    {
        float _1450 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1452 = _697 + _1450;
        float _1454 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1456 = _243 + _1454;
        float _1458 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1460 = -_697;
        float _1462 = _1460 + _1440;
        float _1464 = _1452 * _1452;
        float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1468 = _241 + _1466;
        float _1470 = -_243;
        float _1472 = _1470 + _1404;
        float _1474 = -_241;
        float _1476 = _1474 + _1408;
        float _1478 = fma(_1456, _1456, _1464);
        float _1480 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1482 = fma(_1468, _1468, _1478);
        float _1484 = sqrt(_1482);
        float _1486 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1488 = precise::min(_1484, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1490 = _1488 * _1480;
        float _1492 = _1486 * _1490;
        float _1494 = fma(_1462, _1492, _697);
        float _1496 = fma(_1472, _1492, _243);
        float _1498 = fma(_1476, _1492, _241);
        _1442 = _1494;
        _1436 = _1496;
        _1448 = _1498;
    }
    float _1500 = _1442;
    float _1502 = _1436;
    float _1504 = _1448;
    int _1506 = _1083 + 88;
    uint _1508 = uint(int(uint(_1506) >> uint(2)));
    uint _1510 = uint(int(uint(int(_1508)) >> uint(2)));
    int _1512 = int(_1508) & 3;
    float _1514 = (*spvDescriptorSet0.vp_c15)._m0[int(_1510)][_1512];
    int _1516 = int(_1508) + 1;
    uint _1518 = uint(int(uint(_1516) >> uint(2)));
    int _1520 = _1516 & 3;
    float _1522 = (*spvDescriptorSet0.vp_c15)._m0[int(_1518)][_1520];
    float _1524 = _1432 * _1446;
    float _1526 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1528 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1530 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1532 = _1416 * _1446;
    float _1534 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1526);
    float _1536 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1528);
    float _1538 = _1264;
    if (!_1138)
    {
        int _1540 = _1262 + 400;
        uint _1542 = uint(int(uint(_1540) >> uint(2)));
        uint _1544 = uint(int(uint(int(_1542)) >> uint(2)));
        int _1546 = int(_1542) & 3;
        float _1548 = (*spvDescriptorSet0.vp_c15)._m0[int(_1544)][_1546];
        _1538 = _1548;
    }
    float _1550 = _1538;
    float _1552 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1530);
    float _1554 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1534);
    float _1556 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1536);
    float _1558 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1560 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1552);
    float _1562 = _1554 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1564 = _1556 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1566 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1558);
    float _1568 = _1560 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1570 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _1572 = _1532 >= 0.0;
    float _1574 = _1562 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1576 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1578 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1566);
    bool _1580 = _1532 <= 1.0;
    bool _1582 = _1580 && _1572;
    float _1584 = -_1574;
    float _1586 = fma(_1584, _1570, 1.0);
    float _1588 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1576);
    float _1590 = _921 * _1318;
    bool _1592 = _1524 >= 0.0;
    bool _1594 = _1592 && _1582;
    float _1596 = _1578 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1598 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1588);
    float _1600 = log2(_1586);
    bool _1602 = _1524 <= 1.0;
    bool _1604 = _1602 && _1594;
    float _1606 = fma(_243, _1310, _1590);
    float _1608 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1598);
    float _1610 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1612 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1614 = _1414;
    if (!_1138)
    {
        float _1616 = floor(_1031);
        _1614 = _1616;
    }
    float _1618 = _1614;
    float _1620 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1610);
    float _1622 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1620);
    float _1624 = 0.0;
    if (_1604)
    {
        float _1626 = float(_1077);
        _1624 = _1626;
    }
    float _1628 = _1624;
    float _1630 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1612);
    float _1632 = 1.0 / _1608;
    float _1634 = fma(_241, _1514, _1606);
    float _1636 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1630);
    float _1638 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1622);
    float _1640 = _1634 + _1522;
    float _1642 = _1600 * 0.693147182464599609375;
    float _1644 = _1610;
    float _1646 = _1638;
    if (_1604)
    {
        float _1648 = rint(_1628);
        float _1650 = precise::max(_1648, 0.0);
        uint _1652 = uint(_1650);
        uint _1654 = clamp(_1652, 0u, 65535u);
        _1644 = as_type<float>(_1654);
    }
    float _1656 = _1644;
    float _1658 = 0.0;
    if (!_1138)
    {
        float _1660 = -_1618;
        float _1662 = _1031 + _1660;
        _1658 = _1662;
    }
    float _1664 = _1658;
    float _1666 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1636);
    float _1668 = _1642 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1670 = _1640 * _1446;
    float _1672 = _1642;
    if (!_1138)
    {
        float _1674 = rint(_1550);
        float _1676 = precise::max(_1674, 0.0);
        uint _1678 = uint(_1676);
        uint _1680 = clamp(_1678, 0u, 65535u);
        _1672 = as_type<float>(_1680);
    }
    float _1682 = _1672;
    float _1684 = _1638 * _1632;
    float _1686 = _1666 * _1632;
    float _1688 = fma(_1684, 0.5, 0.5);
    float _1690 = fma(_1686, -0.5, 0.5);
    float _1692 = _1684;
    if (!_1138)
    {
        float _1694 = -_1430;
        float _1696 = _941 + _1694;
        _1692 = _1696;
    }
    float _1698 = _1692;
    float _1700 = _1656;
    if (_1604)
    {
        float3 _6611 = float3(_1532, _1524, float(as_type<int>(_1656)));
        float3 _6615 = select(_6611, float3(0.0), isnan(_6611));
        float _1702 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6615.xy, uint(rint(_6615.z)), _1670, level(0.0));
        _1700 = _1702;
    }
    float _1704 = _1700;
    float3 _6625 = float3(_1688, _1690, _1668);
    float _1706 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6625, float3(0.0), isnan(_6625)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6625, float3(0.0), isnan(_6625)), level(0.0)).x;
    float3 _6634 = float3(_1688, _1690, _1668);
    float4 _1709 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6634, float3(0.0), isnan(_6634)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6634, float3(0.0), isnan(_6634)), level(0.0)).xyzw;
    float _1711 = _1709.x;
    float _1713 = _1709.y;
    float _1715 = _1709.z;
    float _1717 = _1709.w;
    float _1719 = _1664;
    if (!_1138)
    {
        float3 _6657 = float3(_1698, _1664, float(as_type<int>(_1682)));
        float3 _6659 = select(_6657, float3(0.0), isnan(_6657));
        float _1721 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6659.xy, uint(rint(_6659.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6659.xy, uint(rint(_6659.z)), level(0.0)).x;
        _1719 = _1721;
    }
    float _1723 = _1719;
    float _1725 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1727 = int(_1725);
    int _1729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1731 = _1729 != 0;
    int _1733 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1735 = _1733 != 0;
    int _1737 = abs(_1378);
    int _1739 = abs(_525);
    float _1741 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1743 = int(_1741);
    int _1745 = abs(_1182);
    int _1747 = abs(_535);
    int _1749 = abs(_1372);
    if (_1731)
    {
        float _1751 = in.m_68.x;
        _399 = _1751;
    }
    float _1753 = _399;
    float _1755 = float(uint(_1727));
    float _1757 = trunc(_677);
    int _1759 = int(_1757);
    float _1761 = _1753;
    if (!_1731)
    {
        float _1763 = in.m_68.y;
        _1761 = _1763;
    }
    float _1765 = _1761;
    int _1767 = ~_1727;
    int _1769 = _1767 + 1;
    float _1771 = float(uint(_1743));
    float _1773 = 1.0 / _1755;
    float _1775 = 1.0 / _1771;
    float _1777 = trunc(_705);
    int _1779 = int(_1777);
    int _1781 = as_type<int>(_1773) + (-2);
    float _1783 = float(uint(_1759));
    int _1785 = ~_1743;
    int _1787 = _1785 + 1;
    int _1789 = as_type<int>(_1775) + (-2);
    float _1791 = as_type<float>(_1781) * _1783;
    float _1793 = _1775;
    if (_1731)
    {
        _717 = 1.0;
    }
    float _1795 = _717;
    float _1797 = _1795;
    if (!_1731)
    {
        _1797 = 1.2345600128173828125;
    }
    float _1799 = _1797;
    if (_1731)
    {
        _1793 = 1.0;
    }
    float _1801 = _1793;
    float _1803 = trunc(_1791);
    float _1805 = precise::max(_1803, 0.0);
    uint _1807 = uint(_1805);
    float _1809 = float(uint(_1779));
    float _1811 = _1765 * _1799;
    float _1813 = _1801;
    if (!_1731)
    {
        _1813 = 7.345489978790283203125;
    }
    float _1815 = _1813;
    float _1817 = as_type<float>(_1789) * _1809;
    int _1819 = ~_1727;
    int _1821 = _1819 + 1;
    float _1823 = _1815 * _263;
    float _1825 = floor(_1811);
    int _1827 = _1821 * int(_1807);
    int _1829 = _1827 + _1759;
    float _1831 = trunc(_1817);
    float _1833 = precise::max(_1831, 0.0);
    uint _1835 = uint(_1833);
    float _1837 = float(uint(_1829));
    float _1839 = floor(_1823);
    float _1841 = as_type<float>(_1781) * _1837;
    float _1843 = float(_1759);
    float _1845 = -_1825;
    float _1847 = _1811 + _1845;
    int _1849 = _1787 * int(_1835);
    int _1851 = _1849 + _1779;
    float _1853 = trunc(_1841);
    float _1855 = precise::max(_1853, 0.0);
    uint _1857 = uint(_1855);
    float _1859 = float(uint(_1851));
    float _1861 = -_1839;
    float _1863 = _1823 + _1861;
    float _1865 = float(_1743);
    float _1867 = as_type<float>(_1789) * _1859;
    float _1869 = float(_1727);
    float _1871 = _1847 * _1865;
    bool _1873 = _1843 >= _1869;
    bool _1875 = isnan(_1843);
    bool _1877 = _1873 || _1875;
    bool _1879 = isnan(_1869);
    bool _1881 = _1877 || _1879;
    float _1883 = float(_1881);
    float _1885 = trunc(_1867);
    float _1887 = precise::max(_1885, 0.0);
    uint _1889 = uint(_1887);
    int _1891 = int(_1807) + int(_1857);
    int _1893 = _1769 * _1891;
    int _1895 = _1893 + _1759;
    float _1897 = trunc(_1883);
    int _1899 = int(_1897);
    bool _1901 = uint(_1895) >= uint(_1727);
    int _1903 = int(_1835) + int(_1889);
    float _1905 = _1863 * _1869;
    int _1907 = ~_1743;
    int _1909 = _1907 + 1;
    float _1911 = _1869 * _645;
    float _1913 = float(_1779);
    float _1915 = _1865 * _645;
    float _1917 = trunc(_1871);
    int _1919 = int(_1917);
    int _1921 = _1909 * _1903;
    int _1923 = _1921 + _1779;
    bool _1925 = _1913 >= _1865;
    bool _1927 = isnan(_1913);
    bool _1929 = _1925 || _1927;
    bool _1931 = isnan(_1865);
    bool _1933 = _1929 || _1931;
    float _1935 = float(_1933);
    bool _1937 = !_1901;
    int _1939 = _1937 ? 0 : (-1);
    bool _1941 = uint(_1923) >= uint(_1743);
    float _1943 = trunc(_1935);
    int _1945 = int(_1943);
    bool _1947 = !_1941;
    int _1949 = _1947 ? 0 : (-1);
    int _1951 = ~_1891;
    int _1953 = _1951 + _1939;
    int _1955 = _1953 + 1;
    int _1957 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1959 = _1957 != 0;
    float _1961 = trunc(_1905);
    int _1963 = int(_1961);
    int _1965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1967 = _1965 != 0;
    int _1969 = _1727 * _1955;
    int _1971 = _1969 + _1759;
    int _1973 = ~_1903;
    int _1975 = _1973 + _1949;
    int _1977 = _1975 + 1;
    bool _1979 = !_1959;
    int _1981 = _1979 ? 0 : 1;
    bool _1983 = !_1967;
    int _1985 = _1983 ? 0 : 1;
    int _1987 = _1743 * _1977;
    int _1989 = _1987 + _1779;
    bool _1991 = _1727 == 0;
    float _1993 = trunc(_1911);
    int _1995 = int(_1993);
    bool _1997 = _1743 == 0;
    int _1999 = abs(_1981);
    int _2001 = ~_1899;
    int _2003 = _2001 + 1;
    int _2005 = _2003 + 1;
    bool _2007 = !_1991;
    int _2009 = _2007 ? _1971 : (-1);
    int _2011 = _1963 * _1999;
    int _2013 = _2011 + _1759;
    int _2015 = ~_1945;
    int _2017 = _2015 + 1;
    int _2019 = _2017 + 1;
    float _2021 = trunc(_1915);
    int _2023 = int(_2021);
    bool _2025 = !_1997;
    int _2027 = _2025 ? _1989 : (-1);
    int _2029 = _2009 * _2005;
    int _2031 = _1727 + (-1);
    int _2033 = _1743 + (-1);
    int _2035 = _2027 * _2019;
    int _2037 = abs(_1985);
    int _2039 = _1899 * _2031;
    int _2041 = _2039 + _2029;
    int _2043 = _1945 * _2033;
    int _2045 = _2043 + _2035;
    int _2047 = _2041 * _1739;
    int _2049 = abs(_531);
    int _2051 = _1919 * _2037;
    int _2053 = _2051 + _1779;
    int _2055 = abs(_1340);
    int _2057 = _2045 * _1737;
    bool _2059 = !_1735;
    int _2061 = _2059 ? 0 : 1;
    int _2063 = _1995 * _2049;
    int _2065 = _2063 + _2047;
    int _2067 = abs(_2061);
    int _2069 = _2013 * _1747;
    int _2071 = _2069 + _2065;
    int _2073 = ~_1727;
    int _2075 = _2073 + 1;
    int _2077 = _2023 * _1745;
    int _2079 = _2077 + _2057;
    int _2081 = ~_1743;
    int _2083 = _2081 + 1;
    int _2085 = _1963 * _2067;
    int _2087 = _2085 + _2071;
    int _2089 = _2053 * _2055;
    int _2091 = _2089 + _2079;
    float _2093 = float(uint(_2013));
    float _2095 = float(uint(_2087));
    int _2097 = _1919 * _1749;
    int _2099 = _2097 + _2091;
    int _2101 = ~_1743;
    int _2103 = _2101 + 1;
    float _2105 = as_type<float>(_1781) * _2093;
    float _2107 = as_type<float>(_1781) * _2095;
    float _2109 = float(uint(_2099));
    float _2111 = trunc(_2105);
    float _2113 = precise::max(_2111, 0.0);
    uint _2115 = uint(_2113);
    float _2117 = as_type<float>(_1789) * _2109;
    int _2119 = ~_1727;
    int _2121 = _2119 + 1;
    float _2123 = trunc(_2107);
    float _2125 = precise::max(_2123, 0.0);
    uint _2127 = uint(_2125);
    float _2129 = trunc(_2117);
    float _2131 = precise::max(_2129, 0.0);
    uint _2133 = uint(_2131);
    int _2135 = _2121 * int(_2127);
    int _2137 = _2135 + _2087;
    float _2139 = float(uint(_2137));
    int _2141 = _2083 * int(_2133);
    int _2143 = _2141 + _2099;
    float _2145 = as_type<float>(_1781) * _2139;
    float _2147 = float(uint(_2143));
    float _2149 = trunc(_2145);
    float _2151 = precise::max(_2149, 0.0);
    uint _2153 = uint(_2151);
    float _2155 = as_type<float>(_1789) * _2147;
    float _2157 = float(uint(_2053));
    float _2159 = trunc(_2155);
    float _2161 = precise::max(_2159, 0.0);
    uint _2163 = uint(_2161);
    float _2165 = as_type<float>(_1789) * _2157;
    int _2167 = _2075 * int(_2115);
    int _2169 = _2167 + _2013;
    int _2171 = ~_1727;
    int _2173 = _2171 + 1;
    float _2175 = float(uint(_2169));
    float _2177 = trunc(_2165);
    float _2179 = precise::max(_2177, 0.0);
    uint _2181 = uint(_2179);
    int _2183 = int(_2127) + int(_2153);
    int _2185 = ~_1743;
    int _2187 = _2185 + 1;
    float _2189 = as_type<float>(_1781) * _2175;
    int _2191 = _2173 * _2183;
    int _2193 = _2191 + _2087;
    int _2195 = int(_2133) + int(_2163);
    float _2197 = trunc(_2189);
    float _2199 = precise::max(_2197, 0.0);
    uint _2201 = uint(_2199);
    bool _2203 = uint(_2193) >= uint(_1727);
    int _2205 = _2187 * _2195;
    int _2207 = _2205 + _2099;
    int _2209 = _2103 * int(_2181);
    int _2211 = _2209 + _2053;
    bool _2213 = !_2203;
    int _2215 = _2213 ? 0 : (-1);
    bool _2217 = uint(_2207) >= uint(_1743);
    int _2219 = ~_2183;
    int _2221 = _2219 + _2215;
    int _2223 = _2221 + 1;
    float _2225 = float(uint(_2211));
    bool _2227 = !_2217;
    int _2229 = _2227 ? 0 : (-1);
    int _2231 = _1727 * _2223;
    int _2233 = _2231 + _2087;
    int _2235 = int(_2115) + int(_2201);
    float _2237 = as_type<float>(_1789) * _2225;
    int _2239 = ~_2195;
    int _2241 = _2239 + _2229;
    int _2243 = _2241 + 1;
    float _2245 = as_type<float>(_2223);
    float _2247 = _2225;
    if (_1138)
    {
        _2245 = 1.0;
    }
    float _2249 = _2245;
    float _2251 = _2249;
    float _2253 = _1706;
    if (!_1138)
    {
        int _2255 = _1190 << 4;
        int _2257 = _2255 + 2048;
        uint _2259 = uint(int(uint(_2257) >> uint(2)));
        uint _2261 = uint(int(uint(int(_2259)) >> uint(2)));
        int _2263 = int(_2259) & 3;
        float _2265 = (*spvDescriptorSet0.vp_c15)._m0[int(_2261)][_2263];
        int _2267 = int(_2259) + 1;
        uint _2269 = uint(int(uint(_2267) >> uint(2)));
        int _2271 = _2267 & 3;
        float _2273 = (*spvDescriptorSet0.vp_c15)._m0[int(_2269)][_2271];
        int _2275 = _2257 + 8;
        uint _2277 = uint(int(uint(_2275) >> uint(2)));
        uint _2279 = uint(int(uint(int(_2277)) >> uint(2)));
        int _2281 = int(_2277) & 3;
        float _2283 = (*spvDescriptorSet0.vp_c15)._m0[int(_2279)][_2281];
        int _2285 = int(_2277) + 1;
        uint _2287 = uint(int(uint(_2285) >> uint(2)));
        int _2289 = _2285 & 3;
        float _2291 = (*spvDescriptorSet0.vp_c15)._m0[int(_2287)][_2289];
        float _2293 = _921 * _2273;
        float _2295 = fma(_243, _2265, _2293);
        float _2297 = fma(_241, _2283, _2295);
        float _2299 = _2297 + _2291;
        float _2301 = precise::clamp(_2299, 0.0, 1.0);
        float _2303 = -_2301;
        float _2305 = _2303 + _1723;
        float _2307 = fma(_2305, 500.0, 1.5);
        float _2309 = exp2(_2307);
        float _2311 = 0.0 + _2309;
        float _2313 = precise::clamp(_2311, 0.0, 1.0);
        _1214 = as_type<float>(_2257);
        _2251 = _2313;
    }
    float _2315 = _1214;
    float _2317 = _2251;
    float _2319 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2321 = _1500 + _2319;
    float _2323 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2325 = _1502 + _2323;
    float _2327 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2329 = _1504 + _2327;
    float _2331 = _2321 * _2321;
    float _2333 = fma(_2325, _2325, _2331);
    float _2335 = fma(_2329, _2329, _2333);
    float _2337 = rsqrt(_2335);
    float _2339 = sqrt(_2335);
    float _2341 = _2337 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2343 = _2325 * _2341;
    float _2345 = _2329 * _2341;
    float _2347 = _2343 * _2343;
    float _2349 = _2345 * _2345;
    float _2351 = _2347 + _2349;
    float _2353 = sqrt(_2351);
    bool _2355 = _2353 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2357 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2359 = _2353 + _2357;
    float _2361 = as_type<float>(_2229);
    float _2363 = _2351;
    float _2365 = _2359;
    float _2367 = _2341;
    float _2369 = _2343;
    float _2371 = _2345;
    float _2373 = _2347;
    float _2375 = _2349;
    if (_2355)
    {
        float _2377 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2361 = _2377;
    }
    float _2379 = _2361;
    if (_2355)
    {
        float _2381 = rsqrt(_2351);
        _2363 = _2381;
    }
    float _2383 = _2363;
    if (_2355)
    {
        float _2385 = _2359 * _2379;
        _2365 = _2385;
    }
    float _2387 = _2365;
    if (_2355)
    {
        float _2389 = _2387 * 0.15915493667125701904296875;
        _2247 = _2389;
    }
    float _2391 = _2247;
    float _2393 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2395 = _2315;
    float _2397 = _2393;
    if (_2355)
    {
        float _2399 = _2391 * 6.283185482025146484375;
        float _2401 = sin(_2399);
        _2395 = _2401;
    }
    float _2403 = _2395;
    float _2405 = precise::max(0.0, _2393);
    float _2407 = _2387;
    if (_2355)
    {
        float _2409 = _2391 * 6.283185482025146484375;
        float _2411 = cos(_2409);
        _2407 = _2411;
    }
    float _2413 = _2407;
    float _2415 = -_2341;
    float _2417 = -_2405;
    float _2419 = fma(_2321, _2415, _2417);
    float _2421 = _2419;
    if (_2355)
    {
        float _2423 = _2419 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2367 = _2423;
    }
    float _2425 = _2367;
    float _2427 = _2403;
    float _2429 = _2425;
    if (_2355)
    {
        float _2431 = fma(_2403, _2425, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2427 = _2431;
    }
    float _2433 = _2427;
    int _2435 = ~_1727;
    int _2437 = _2435 + 1;
    if (_2355)
    {
        float _2439 = _2383 * _2433;
        _2429 = _2439;
    }
    float _2441 = _2429;
    int _2443 = _2437 * _2235;
    int _2445 = _2443 + _2013;
    if (_2355)
    {
        float _2447 = _2413 + (-1.0);
        _2397 = _2447;
    }
    float _2449 = _2397;
    float _2451 = _2449;
    if (_2355)
    {
        float _2453 = _2343 * _2441;
        _2369 = _2453;
    }
    float _2455 = _2369;
    if (_2355)
    {
        float _2457 = _2345 * _2441;
        _2371 = _2457;
    }
    float _2459 = _2371;
    if (_2355)
    {
        float _2461 = _2449 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2451 = _2461;
    }
    float _2463 = _2451;
    if (_2355)
    {
        float _2465 = _2455 * _2455;
        _2373 = _2465;
    }
    float _2467 = _2373;
    if (_2355)
    {
        float _2469 = _2459 * _2459;
        _2375 = _2469;
    }
    float _2471 = _2375;
    if (_2355)
    {
        float _2473 = fma(_2419, _2413, _2463);
        _2421 = _2473;
    }
    float _2475 = _2421;
    float _2477 = fma(_2475, _2475, _2467);
    float _2479 = _2477 + _2471;
    float _2481 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2483 = fma(_2339, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2481);
    float _2485 = precise::clamp(_2483, 0.0, 1.0);
    float _2487 = rsqrt(_2479);
    float _2489 = -_2485;
    float _2491 = _2489 + 1.0;
    float _2493 = _2487 * _2455;
    float _2495 = _2487 * _2475;
    float _2497 = _2487 * _2459;
    float _2499 = _2493 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2501 = abs(_2491);
    float _2503 = log2(_2501);
    float _2505 = -_2499;
    float _2507 = fma(_2495, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2505);
    bool _2509 = !_1991;
    int _2511 = _2509 ? _2233 : (-1);
    float _2513 = -_2497;
    float _2515 = fma(_2513, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2507);
    int _2517 = _2511 & 3;
    bool _2519 = _2517 != 0;
    int _2521 = _2511 & 3;
    bool _2523 = _2521 != 0;
    float _2525 = fma(_2515, -0.5, 0.5);
    float _2527 = fma(_2515, 0.5, 0.5);
    bool _2529 = uint(_2517) > 1u;
    float _2531 = fma(_2527, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2533 = _2503 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2535 = sqrt(_2525);
    float _2537 = fma(_2527, _2531, -0.212114393711090087890625);
    float _2539 = fma(_2527, _2537, 1.570728778839111328125);
    float _2541 = _2495 + 1.0;
    float _2543 = exp2(_2533);
    float _2545 = _2535 * 0.636619746685028076171875;
    float _2547 = -_2539;
    float _2549 = fma(_2545, _2547, 1.0);
    float _2551 = -_2495;
    float _2553 = fma(_2543, _2541, _2551);
    float _2555 = fma(_1404, 6.2500002968590706586837768554688e-05, 0.5);
    float _2557 = fma(_1408, 6.2500002968590706586837768554688e-05, 0.5);
    float _2559 = fma(_2553, 0.5, 0.5);
    float2 _7829 = float2(_2549, _2559);
    float3 _2563 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7829, float2(0.0), isnan(_7829)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7829, float2(0.0), isnan(_7829)), level(0.0)).xyz;
    float _2565 = _2563.x;
    float _2567 = _2563.y;
    float _2569 = _2563.z;
    float2 _7843 = float2(_2555, _2557);
    float3 _2571 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_7843, float2(0.0), isnan(_7843)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_7843, float2(0.0), isnan(_7843)), level(0.0)).xyz;
    float _2573 = _2571.x;
    float _2575 = _2571.y;
    float _2577 = _2571.z;
    bool _2579 = uint(_2445) >= uint(_1727);
    int _2581 = _1743 * _2243;
    int _2583 = _2581 + _2099;
    int _2585 = _2511 >> 31;
    float _2587 = trunc(_2237);
    float _2589 = precise::max(_2587, 0.0);
    uint _2591 = uint(_2589);
    bool _2593 = !_2579;
    int _2595 = _2593 ? 0 : (-1);
    float _2597 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2599 = !_1997;
    int _2601 = _2599 ? _2583 : (-1);
    float _2603 = -_689;
    float _2605 = _2603 + 1.0;
    int _2607 = ~_2235;
    int _2609 = _2607 + _2595;
    int _2611 = _2609 + 1;
    float _2613 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2597);
    int _2615 = _2585 & 3;
    float _2617 = -_707;
    float _2619 = _2617 + 1.0;
    int _2621 = _2601 >> 31;
    int _2623 = _1727 * _2611;
    int _2625 = _2623 + _2013;
    int _2627 = _2511 + _2615;
    float _2629 = -_693;
    float _2631 = _2629 + 1.0;
    int _2633 = _2621 & 3;
    float _2635 = -_261;
    float _2637 = _2635 + 1.0;
    int _2639 = _2627 >> 2;
    float _2641 = -_709;
    float _2643 = _2641 + 1.0;
    int _2645 = _2601 + _2633;
    float _2647 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2613);
    int _2649 = _2523 ? 0 : 1;
    out.m_74.x = _1502;
    out.m_74.y = _1500;
    out.m_74.z = _1504;
    int _2651 = _2639 << 4;
    int _2653 = _2651 + 368;
    int _2655 = _2645 >> 2;
    bool _2657 = _269 > 0.5;
    uint _2659 = uint(int(uint(_2653) >> uint(2)));
    uint _2661 = uint(int(uint(int(_2659)) >> uint(2)));
    int _2663 = int(_2659) & 3;
    float _2665 = (*spvDescriptorSet0.vp_c9)._m0[int(_2661)][_2663];
    int _2667 = int(_2659) + 1;
    uint _2669 = uint(int(uint(_2667) >> uint(2)));
    int _2671 = _2667 & 3;
    float _2673 = (*spvDescriptorSet0.vp_c9)._m0[int(_2669)][_2671];
    int _2675 = ~_2649;
    int _2677 = _2675 + 1;
    int _2679 = _2677 + 1;
    int _2681 = _2679;
    if (!_2529)
    {
        int _2683 = ~_2649;
        int _2685 = _2683 + 1;
        _2681 = _2685;
    }
    int _2687 = _2681;
    int _2689 = _2655 << 4;
    int _2691 = _2689 + 512;
    bool _2693 = _2517 != 3;
    uint _2695 = uint(int(uint(_2691) >> uint(2)));
    uint _2697 = uint(int(uint(int(_2695)) >> uint(2)));
    int _2699 = int(_2695) & 3;
    float _2701 = (*spvDescriptorSet0.vp_c9)._m0[int(_2697)][_2699];
    int _2703 = int(_2695) + 1;
    uint _2705 = uint(int(uint(_2703) >> uint(2)));
    int _2707 = _2703 & 3;
    float _2709 = (*spvDescriptorSet0.vp_c9)._m0[int(_2705)][_2707];
    bool _2711 = uint(_2517) >= 2u;
    float _2713 = -_191;
    int _2715 = _2657 ? as_type<int>(_2713) : as_type<int>(_191);
    int _2717 = _2711 ? 0 : 1;
    bool _2719 = !_2519;
    int _2721 = _2719 ? 0 : 1;
    int _2723 = ~_2717;
    int _2725 = _2723 + 1;
    int _2727 = _2725 + 1;
    bool _2729 = _2517 != 3;
    int _2731 = _2727;
    if (_2693)
    {
        int _2733 = ~_2717;
        int _2735 = _2733 + 1;
        _2731 = _2735;
    }
    int _2737 = _2731;
    int _2739 = _2691 + 8;
    uint _2741 = uint(int(uint(_2739) >> uint(2)));
    uint _2743 = uint(int(uint(int(_2741)) >> uint(2)));
    int _2745 = int(_2741) & 3;
    float _2747 = (*spvDescriptorSet0.vp_c9)._m0[int(_2743)][_2745];
    int _2749 = int(_2741) + 1;
    uint _2751 = uint(int(uint(_2749) >> uint(2)));
    int _2753 = _2749 & 3;
    float _2755 = (*spvDescriptorSet0.vp_c9)._m0[int(_2751)][_2753];
    int _2757 = _2601 & 3;
    bool _2759 = _2757 != 0;
    int _2761 = _2601 & 3;
    bool _2763 = _2761 != 0;
    int _2765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2767 = _2765 != 0;
    int _2769 = int(_2181) + int(_2591);
    int _2771 = _2653 + 8;
    uint _2773 = uint(int(uint(_2771) >> uint(2)));
    uint _2775 = uint(int(uint(int(_2773)) >> uint(2)));
    int _2777 = int(_2773) & 3;
    float _2779 = (*spvDescriptorSet0.vp_c9)._m0[int(_2775)][_2777];
    int _2781 = int(_2773) + 1;
    uint _2783 = uint(int(uint(_2781) >> uint(2)));
    int _2785 = _2781 & 3;
    float _2787 = (*spvDescriptorSet0.vp_c9)._m0[int(_2783)][_2785];
    int _2789 = ~_1743;
    int _2791 = _2789 + 1;
    bool _2793 = !_2767;
    int _2795 = _2793 ? 0 : 1;
    bool _2797 = uint(_2761) > 1u;
    int _2799 = _2791 * _2769;
    int _2801 = _2799 + _2053;
    bool _2803 = !_1991;
    int _2805 = _2803 ? _2625 : (-1);
    int _2807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2809 = _2807 != 0;
    int _2811 = _2759 ? 0 : 1;
    bool _2813 = !_2809;
    int _2815 = _2813 ? 0 : 1;
    bool _2817 = uint(_2801) >= uint(_1743);
    bool _2819 = !_2729;
    int _2821 = _2819 ? 0 : (-1);
    bool _2823 = !_2763;
    int _2825 = _2823 ? 0 : 1;
    bool _2827 = uint(_2761) >= 2u;
    bool _2829 = _2761 != 3;
    int _2831 = ~_2811;
    int _2833 = _2831 + 1;
    int _2835 = _2833 + 1;
    bool _2837 = _2761 != 3;
    bool _2839 = !_2817;
    int _2841 = _2839 ? 0 : (-1);
    int _2843 = _2835;
    if (!_2797)
    {
        int _2845 = ~_2811;
        int _2847 = _2845 + 1;
        _2843 = _2847;
    }
    int _2849 = _2843;
    int _2851 = _2827 ? 0 : 1;
    bool _2853 = !_2829;
    int _2855 = _2853 ? 0 : (-1);
    int _2857 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2859 = _2857 != 0;
    int _2861 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2863 = _2861 != 0;
    int _2865 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2867 = _2865 != 0;
    int _2869 = abs(_2687);
    int _2871 = ~_2769;
    int _2873 = _2871 + _2841;
    int _2875 = _2873 + 1;
    int _2877 = abs(_2849);
    int _2879 = ~_2869;
    int _2881 = _2879 + 1;
    int _2883 = _2881 + 1;
    int _2885 = _1743 * _2875;
    int _2887 = _2885 + _2053;
    int _2889 = _2883 * as_type<int>(_2673);
    bool _2891 = _263 > 0.5;
    int _2893 = ~_2851;
    int _2895 = _2893 + 1;
    int _2897 = _2895 + 1;
    int _2899 = abs(_2825);
    int _2901 = _2897;
    if (_2837)
    {
        int _2903 = ~_2851;
        int _2905 = _2903 + 1;
        _2901 = _2905;
    }
    int _2907 = _2901;
    int _2909 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2911 = _2909 != 0;
    int _2913 = ~_2877;
    int _2915 = _2913 + 1;
    int _2917 = _2915 + 1;
    int _2919 = abs(_2721);
    int _2921 = _2917 * as_type<int>(_2709);
    int _2923 = abs(_2737);
    int _2925 = ~_2919;
    int _2927 = _2925 + 1;
    int _2929 = _2927 + 1;
    int _2931 = ~_2899;
    int _2933 = _2931 + 1;
    int _2935 = _2933 + 1;
    int _2937 = abs(_2907);
    int _2939 = _2929 * as_type<int>(_2665);
    int _2941 = _2939 + _2889;
    int _2943 = ~_2923;
    int _2945 = _2943 + 1;
    int _2947 = _2945 + 1;
    float _2949 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2951 = int(_2949);
    int _2953 = ~_2937;
    int _2955 = _2953 + 1;
    int _2957 = _2955 + 1;
    int _2959 = _2935 * as_type<int>(_2701);
    int _2961 = _2959 + _2921;
    int _2963 = _2947 * as_type<int>(_2779);
    int _2965 = _2963 + _2941;
    int _2967 = _2957 * as_type<int>(_2747);
    int _2969 = _2967 + _2961;
    float _2971 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2973 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2975 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2977 = int(_2975);
    float _2979 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2981 = _2971 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2983 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2985 = _2973 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2987 = _2979 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2989 = float(uint(_2951));
    int _2991 = abs(_2821);
    float _2993 = -_187;
    int _2995 = _2891 ? as_type<int>(_2993) : as_type<int>(_187);
    out.m_76.x = _2981;
    out.m_76.y = _2985;
    out.m_76.z = _2987;
    out.m_76.w = _2983;
    int _2997 = ~_2991;
    int _2999 = _2997 + 1;
    int _3001 = _2999 + 1;
    float _3003 = 1.0 / _2989;
    bool _3005 = _267 > 0.5;
    int _3007 = abs(_2855);
    int _3009 = _3001 * as_type<int>(_2787);
    int _3011 = _3009 + _2965;
    int _3013 = ~_3007;
    int _3015 = _3013 + 1;
    int _3017 = _3015 + 1;
    float _3019 = abs(_1017);
    float _3021 = log2(_3019);
    int _3023 = abs(_2951);
    float _3025 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _3027 = !_1997;
    int _3029 = _3027 ? _2887 : (-1);
    int _3031 = _3017 * as_type<int>(_2755);
    int _3033 = _3031 + _2969;
    int _3035 = abs(_2795);
    float _3037 = _951 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3039 = float(uint(_2977));
    int _3041 = ~_3035;
    int _3043 = _3041 + 1;
    int _3045 = _3043 + 1;
    float _3047 = -_945;
    float _3049 = fma(_3047, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3037);
    int _3051 = abs(_2977);
    float _3053 = _963 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3055 = _3011 * _3045;
    int _3057 = abs(_2815);
    float _3059 = _3021 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3061 = float(uint(_3051));
    int _3063 = _2805 * _3035;
    int _3065 = _3063 + _3055;
    bool _3067 = _265 > 0.5;
    float _3069 = 1.0 / _3039;
    int _3071 = as_type<int>(_3003) + (-2);
    float _3073 = _3025 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3075 = float(uint(_3065));
    float _3077 = _951 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3079 = _951 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3081 = exp2(_3059);
    float _3083 = float(uint(_3023));
    float _3085 = as_type<float>(_3071) * _3075;
    int _3087 = ~_3057;
    int _3089 = _3087 + 1;
    int _3091 = _3089 + 1;
    float _3093 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3095 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3097 = -_945;
    float _3099 = fma(_3097, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3079);
    int _3101 = ~_3051;
    int _3103 = _3101 + 1;
    float _3105 = 1.0 / _3061;
    int _3107 = _3033 * _3091;
    float _3109 = _3093 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3111 = _3095 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3113 = -_945;
    float _3115 = fma(_3113, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3077);
    int _3117 = _3029 * _3057;
    int _3119 = _3117 + _3107;
    int _3121 = abs(_3065);
    float _3123 = _963 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3125 = 1.0 / _3083;
    out.m_78.x = _3109;
    out.m_78.y = _3111;
    out.m_78.z = _3073;
    int _3127 = abs(_3119);
    float _3129 = float(uint(_3121));
    float _3131 = float(uint(_3127));
    float _3133 = trunc(_3085);
    float _3135 = precise::max(_3133, 0.0);
    uint _3137 = uint(_3135);
    int _3139 = as_type<int>(_3105) + (-2);
    float _3141 = as_type<float>(_3139) * _3131;
    int _3143 = as_type<int>(_3069) + (-2);
    float _3145 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3115);
    float _3147 = float(uint(_3119));
    float _3149 = fma(_3081, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3151 = precise::clamp(_3149, 0.0, 1.0);
    int _3153 = ~_2951;
    int _3155 = _3153 + 1;
    float _3157 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3053);
    float _3159 = _973 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3161 = as_type<float>(_3143) * _3147;
    int _3163 = as_type<int>(_3125) + (-2);
    int _3165 = _3155 * int(_3137);
    int _3167 = _3165 + _3065;
    float _3169 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3049);
    float _3171 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3099);
    float _3173 = _963 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3175 = trunc(_3161);
    float _3177 = precise::max(_3175, 0.0);
    uint _3179 = uint(_3177);
    float _3181 = as_type<float>(_3163) * _3129;
    float _3183 = float(uint(_3167));
    float _3185 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3123);
    int _3187 = ~_2977;
    int _3189 = _3187 + 1;
    float _3191 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3173);
    int _3193 = ~_3023;
    int _3195 = _3193 + 1;
    float _3197 = as_type<float>(_3071) * _3183;
    float _3199 = trunc(_3181);
    float _3201 = precise::max(_3199, 0.0);
    uint _3203 = uint(_3201);
    float _3205 = _973 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3207 = _973 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3209 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3159);
    float _3211 = fma(_3151, -2.0, 3.0);
    float _3213 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3205);
    float _3215 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3207);
    float _3217 = trunc(_3141);
    float _3219 = precise::max(_3217, 0.0);
    uint _3221 = uint(_3219);
    int _3223 = _3189 * int(_3179);
    int _3225 = _3223 + _3119;
    bool _3227 = !_2859;
    float _3229 = _3227 ? _191 : as_type<float>(_2715);
    float _3231 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3215);
    bool _3233 = _1017 <= 8000.0;
    bool _3235 = isnan(_1017);
    bool _3237 = _3233 || _3235;
    bool _3239 = isnan(8000.0);
    bool _3241 = _3237 || _3239;
    float _3243 = float(_3241);
    float _3245 = float(uint(_3225));
    int _3247 = _3195 * int(_3203);
    int _3249 = _3247 + _3121;
    float _3251 = trunc(_3197);
    float _3253 = precise::max(_3251, 0.0);
    uint _3255 = uint(_3253);
    float _3257 = as_type<float>(_3143) * _3245;
    float _3259 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3185);
    float _3261 = float(uint(_3249));
    float _3263 = _3151 * _3151;
    float _3265 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3213);
    int _3267 = _3103 * int(_3221);
    int _3269 = _3267 + _3127;
    float _3271 = trunc(_3257);
    float _3273 = precise::max(_3271, 0.0);
    uint _3275 = uint(_3273);
    float _3277 = as_type<float>(_3163) * _3261;
    float _3279 = -_191;
    int _3281 = _3067 ? as_type<int>(_3279) : as_type<int>(_191);
    float _3283 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3157);
    float _3285 = float(uint(_3269));
    float _3287 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3191);
    bool _3289 = !_2911;
    float _3291 = _3289 ? _187 : as_type<float>(_2995);
    float _3293 = _3263 * _3211;
    float _3295 = trunc(_3277);
    float _3297 = precise::max(_3295, 0.0);
    uint _3299 = uint(_3297);
    float _3301 = as_type<float>(_3139) * _3285;
    float _3303 = -_187;
    int _3305 = _3005 ? as_type<int>(_3303) : as_type<int>(_187);
    out.m_80.x = _3259;
    out.m_80.y = _3283;
    out.m_80.z = _3287;
    bool _3307 = !_2863;
    float _3309 = _3307 ? _191 : as_type<float>(_3281);
    float _3311 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _3313 = !_2867;
    float _3315 = _3313 ? _187 : as_type<float>(_3305);
    float _3317 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3209);
    float _3319 = trunc(_3301);
    float _3321 = precise::max(_3319, 0.0);
    uint _3323 = uint(_3321);
    int _3325 = ~_2951;
    int _3327 = _3325 + 1;
    float _3329 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3331 = ~_2977;
    int _3333 = _3331 + 1;
    float _3335 = _3311 * _3145;
    int _3337 = int(_3137) + int(_3255);
    float _3339 = fma(_3329, _3259, _3335);
    int _3341 = int(_3179) + int(_3275);
    int _3343 = _3327 * _3337;
    int _3345 = _3343 + _3065;
    int _3347 = ~_3023;
    int _3349 = _3347 + 1;
    float _3351 = _3317 + _3339;
    int _3353 = ~_3051;
    int _3355 = _3353 + 1;
    int _3357 = _3333 * _3341;
    int _3359 = _3357 + _3119;
    int _3361 = int(_3203) + int(_3299);
    int _3363 = int(_3221) + int(_3323);
    int _3365 = _3349 * _3361;
    int _3367 = _3365 + _3121;
    bool _3369 = uint(_3345) >= uint(_2951);
    bool _3371 = uint(_3359) >= uint(_2977);
    int _3373 = _3355 * _3363;
    int _3375 = _3373 + _3127;
    bool _3377 = !_3369;
    int _3379 = _3377 ? 0 : (-1);
    float _3381 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3383 = !_3371;
    int _3385 = _3383 ? 0 : (-1);
    bool _3387 = uint(_3367) >= uint(_3023);
    int _3389 = ~_3337;
    int _3391 = _3389 + _3379;
    int _3393 = _3391 + 1;
    int _3395 = _3065 ^ _2951;
    float _3397 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3399 = uint(_3375) >= uint(_3051);
    int _3401 = _2951 * _3393;
    int _3403 = _3401 + _3065;
    bool _3405 = !_3387;
    int _3407 = _3405 ? 0 : (-1);
    uint _3409 = uint(int(uint(_3395) >> uint(31)));
    bool _3411 = _2951 == 0;
    float _3413 = _3381 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3415 = _2951 == 0;
    int _3417 = ~_3341;
    int _3419 = _3417 + _3385;
    int _3421 = _3419 + 1;
    float _3423 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3425 = ~_3407;
    int _3427 = _3361 + _3425;
    int _3429 = _3427 + 1;
    int _3431 = ~int(_3409);
    int _3433 = _3431 + 1;
    int _3435 = _3119 ^ _2977;
    bool _3437 = _2977 == 0;
    bool _3439 = _2977 == 0;
    int _3441 = _2977 * _3421;
    int _3443 = _3441 + _3119;
    bool _3445 = !_3399;
    int _3447 = _3445 ? 0 : (-1);
    int _3449 = _3429 ^ _3433;
    uint _3451 = uint(int(uint(_3435) >> uint(31)));
    float _3453 = fma(_3311, _3311, 1.0);
    bool _3455 = !_3411;
    int _3457 = _3455 ? _3403 : (-1);
    int _3459 = ~_3447;
    int _3461 = _3363 + _3459;
    int _3463 = _3461 + 1;
    float _3465 = _3423 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3467 = ~_3433;
    int _3469 = _3467 + _3449;
    int _3471 = _3469 + 1;
    float _3473 = _3291 + 0.5;
    int _3475 = ~int(_3451);
    int _3477 = _3475 + 1;
    float _3479 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _3481 = !_3437;
    int _3483 = _3481 ? _3443 : (-1);
    float _3485 = float(_3457);
    int _3487 = _3463 ^ _3477;
    float _3489 = float(_3483);
    float _3491 = fma(_3413, _3485, _357);
    int _3493 = ~_3477;
    int _3495 = _3493 + _3487;
    int _3497 = _3495 + 1;
    float _3499 = _3397 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3501 = rsqrt(_3453);
    float _3503 = fma(_3413, _3473, _3491);
    bool _3505 = !_3439;
    int _3507 = _3505 ? _3497 : (-1);
    float _3509 = fma(_3465, _3489, _713);
    float _3511 = _3315 + 0.5;
    bool _3513 = !_3415;
    int _3515 = _3513 ? _3471 : (-1);
    float _3517 = float(_3507);
    float _3519 = _3479 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3521 = fma(_3465, _3511, _3509);
    float _3523 = float(_3515);
    float _3525 = -_715;
    float _3527 = fma(_3519, _3517, _3525);
    float _3529 = _3229 + (-0.5);
    float _3531 = -_353;
    float _3533 = fma(_3499, _3523, _3531);
    float _3535 = _3309 + (-0.5);
    float _3537 = -_3519;
    float _3539 = fma(_3537, _3529, _3527);
    float _3541 = -_2605;
    float _3543 = fma(_3315, _3541, _3521);
    float _3545 = _2503 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3547 = -_3293;
    float _3549 = _3547 + 1.0;
    float _3551 = _3311 * _3501;
    float _3553 = _3311 * _3169;
    float _3555 = -_3499;
    float _3557 = fma(_3555, _3535, _3533);
    float _3559 = fma(_3549, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3293);
    float _3561 = exp2(_3545);
    float _3563 = -_3265;
    float _3565 = _3551 * _3563;
    float _3567 = fma(_3329, _3283, _3553);
    float _3569 = _3243 * _3559;
    float _3571 = fma(_3229, _2631, _3539);
    float _3573 = fma(_3501, _3169, _3565);
    float _3575 = -_2619;
    float _3577 = fma(_3291, _3575, _3503);
    float _3579 = _3265 + _3567;
    float _3581 = _3569 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3583 = -_3317;
    float _3585 = _3551 * _3583;
    float _3587 = _3569;
    if (!_1604)
    {
        _1646 = 1.0;
    }
    float _3589 = _1646;
    float _3591 = _2637 * _3581;
    float _3593 = precise::clamp(_3591, 0.0, 1.0);
    float _3595 = _3589;
    if (_1604)
    {
        bool _3597 = _1704 >= _1670;
        bool _3599 = isnan(_1704);
        bool _3601 = _3597 || _3599;
        bool _3603 = isnan(_1670);
        bool _3605 = _3601 || _3603;
        float _3607 = float(_3605);
        _3595 = _3607;
    }
    float _3609 = _3595;
    float _3611 = fma(_3309, _2643, _3557);
    float _3613 = _3311 * _3171;
    float _3615 = -_3561;
    float _3617 = _3615 + 1.0;
    float _3619 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2647);
    float _3621 = _3609 * _2317;
    float _3623 = -_3593;
    float _3625 = fma(_3623, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3627 = _3617 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3629 = fma(_3501, _3145, _3585);
    float _3631 = -_3231;
    float _3633 = _3551 * _3631;
    float _3635 = fma(_3329, _3287, _3613);
    float _3637 = _3627 * _1706;
    float _3639 = _3619 + _1608;
    float _3641 = -_3621;
    float _3643 = fma(_3641, _3625, 1.0);
    float _3645 = precise::clamp(_3643, 0.0, 1.0);
    float _3647 = -_3627;
    float _3649 = _3647 + 1.0;
    float _3651 = _1717 * _3637;
    float _3653 = _2569 * _3637;
    float _3655 = fma(_3501, _3171, _3633);
    float _3657 = _3231 + _3635;
    float _3659 = _3639 * 0.5;
    float _3661 = fma(_2565, _3651, _1711);
    float _3663 = fma(_2567, _3651, _1713);
    float _3665 = _3645 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3667 = _1717 * _3649;
    float _3669 = fma(_1717, _3653, _1715);
    out.m_82.x = _3629;
    out.m_82.y = _3573;
    out.m_82.z = _3655;
    bool _3671 = _2339 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3673 = isnan(_2339);
    bool _3675 = _3671 || _3673;
    bool _3677 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3679 = _3675 || _3677;
    out.m_84.x = _3577;
    out.m_84.y = _3611;
    out.m_84.z = _3543;
    out.m_84.w = _3571;
    out.gl_Position.x = _1638;
    out.gl_Position.y = _1666;
    out.gl_Position.z = _3619;
    out.gl_Position.w = _1608;
    out.m_86.z = _3659;
    out.m_86.w = _1608;
    float _3681 = _3649;
    float _3683 = _3621;
    float _3685 = _3645;
    float _3687 = _3651;
    if (!_3679)
    {
        _3681 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3689 = _3681;
    out.m_88.x = _2573;
    out.m_88.y = _2575;
    out.m_88.z = _2577;
    float _3691 = _3689;
    float _3693 = _3689;
    if (!_3679)
    {
        _3683 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3695 = _3683;
    float _3697 = _3695;
    float _3699 = _3695;
    if (!_3679)
    {
        _2253 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3701 = _2253;
    out.m_90.x = _3665;
    float _3703 = _3701;
    float _3705 = _3701;
    if (!_3679)
    {
        _3587 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3707 = _3587;
    float _3709 = _3707;
    float _3711 = _3707;
    if (!_3679)
    {
        _3685 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3713 = _3685;
    out.m_92.x = _3661;
    out.m_92.y = _3663;
    out.m_92.z = _3669;
    out.m_92.w = _3667;
    float _3715 = _3713;
    float _3717 = _3713;
    if (!_3679)
    {
        _3687 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3719 = _3687;
    out.m_94.x = _3351;
    out.m_94.y = _3579;
    out.m_94.z = _3657;
    bool _3721 = !_3679;
    float _3723 = _3719;
    float _3725 = _3719;
    if (!_3721)
    {
        bool _3727 = _2339 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3729 = isnan(_2339);
        bool _3731 = _3727 || _3729;
        bool _3733 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3735 = _3731 || _3733;
        if (!_3735)
        {
            float _3737 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3739 = _2339 + _3737;
            float _3741 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3743 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3741;
            float _3745 = 1.0 / _3743;
            float _3747 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3749 = _3747 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3751 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3753 = _3751 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3755 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3757 = _3755 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3759 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3761 = _3759 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3763 = _3739 * _3745;
            float _3765 = precise::clamp(_3763, 0.0, 1.0);
            float _3767 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3769 = _3767 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3771 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3773 = _3771 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3775 = fma(_3765, _3749, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3777 = fma(_3765, _3769, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3779 = fma(_3765, _3773, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3781 = fma(_3765, _3753, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3783 = fma(_3765, _3757, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3785 = fma(_3765, _3761, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3699 = _3779;
            _3717 = _3783;
            _3693 = _3777;
            _3711 = _3781;
            _3705 = _3775;
            _3725 = _3785;
            _3787 = true;
        }
        else
        {
            bool _3789 = _2339 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3791 = isnan(_2339);
            bool _3793 = _3789 || _3791;
            bool _3795 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3797 = _3793 || _3795;
            if (!_3797)
            {
                _3691 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3799 = _3691;
            _3693 = _3799;
            if (!_3797)
            {
                _3697 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3801 = _3697;
            _3699 = _3801;
            if (!_3797)
            {
                _3703 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3803 = _3703;
            _3705 = _3803;
            if (!_3797)
            {
                _3709 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3805 = _3709;
            _3711 = _3805;
            if (!_3797)
            {
                _3715 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3807 = _3715;
            _3717 = _3807;
            if (!_3797)
            {
                _3723 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3809 = _3723;
            bool _3811 = !_3797;
            _3725 = _3809;
            if (!_3811)
            {
                bool _3813 = _2339 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3815 = isnan(_2339);
                bool _3817 = _3813 || _3815;
                bool _3819 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3821 = _3817 || _3819;
                if (!_3821)
                {
                    float _3823 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3825 = _2339 + _3823;
                    float _3827 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3829 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3827;
                    float _3831 = 1.0 / _3829;
                    float _3833 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3835 = _3833 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3837 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3839 = _3837 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3841 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3843 = _3841 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3845 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3847 = _3845 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3849 = _3825 * _3831;
                    float _3851 = precise::clamp(_3849, 0.0, 1.0);
                    float _3853 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3855 = _3853 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3857 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3859 = _3857 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3861 = fma(_3851, _3835, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3863 = fma(_3851, _3855, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3865 = fma(_3851, _3859, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3867 = fma(_3851, _3839, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3869 = fma(_3851, _3843, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3871 = fma(_3851, _3847, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3699 = _3865;
                    _3717 = _3869;
                    _3693 = _3863;
                    _3711 = _3867;
                    _3705 = _3861;
                    _3725 = _3871;
                    _3787 = true;
                }
                else
                {
                    _3699 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3717 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3693 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3711 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3705 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3725 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3787 = false;
    float _3873 = _3699;
    float _3875 = _3717;
    float _3877 = _3693;
    float _3879 = _3711;
    float _3881 = _3705;
    float _3883 = _3725;
    float _3885 = fma(_3579, -0.5, 0.5);
    float _3887 = precise::clamp(_3885, 0.0, 1.0);
    float _3889 = -_3873;
    float _3891 = _3889 + _3875;
    float _3893 = -_3877;
    float _3895 = _3893 + _3879;
    float _3897 = -_3881;
    float _3899 = _3897 + _3883;
    bool _3901 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3903 = fma(_3887, _3891, _3873);
    float _3905 = fma(_3887, _3895, _3877);
    float _3907 = fma(_3887, _3899, _3881);
    float _3909 = _3903 * 0.586610972881317138671875;
    out.m_96.x = 0.0;
    float _3911 = fma(_3905, 0.298911988735198974609375, _3909);
    float _3913 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3915 = fma(_3907, 0.114477999508380889892578125, _3911);
    out.m_61.x = _3913;
    float _3917 = -_3915;
    float _3919 = _3905 + _3917;
    float _3921 = -_3915;
    float _3923 = _3903 + _3921;
    float _3925 = -_3915;
    float _3927 = _3907 + _3925;
    float _3929 = fma(_3919, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3915);
    float _3931 = fma(_3923, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3915);
    float _3933 = fma(_3927, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3915);
    out.m_98.x = _3929;
    out.m_98.y = _3931;
    out.m_98.z = _3933;
    if (!_3901)
    {
        return out;
    }
    float _3935 = -_1500;
    float _3937 = _3935 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3939 = -_1502;
    float _3941 = _3939 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3943 = -_1504;
    float _3945 = _3943 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3947 = _3937 * _3937;
    float _3949 = fma(_3941, _3941, _3947);
    float _3951 = fma(_3945, _3945, _3949);
    float _3953 = sqrt(_3951);
    float _3955 = rsqrt(_3951);
    float _3957 = -_3953;
    float _3959 = _3957 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3961 = _3959 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3963 = precise::clamp(_3961, 0.0, 1.0);
    float _3965 = _3941 * _3955;
    float _3967 = _3937 * _3955;
    float _3969 = abs(_3963);
    float _3971 = log2(_3969);
    float _3973 = _3945 * _3955;
    float _3975 = _3965 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3977 = _3579 * _3967;
    float _3979 = -_3967;
    float _3981 = -_3975;
    float _3983 = fma(_3979, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3981);
    float _3985 = fma(_3351, _3965, _3977);
    float _3987 = -_3973;
    float _3989 = fma(_3987, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3983);
    float _3991 = fma(_3657, _3973, _3985);
    float _3993 = precise::clamp(_3991, 0.0, 1.0);
    float _3995 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3997 = _3989 + _3995;
    float _3999 = _3971 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4001 = _3997 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4003 = precise::clamp(_4001, 0.0, 1.0);
    float _4005 = exp2(_3999);
    float _4007 = _4005 * _4003;
    float _4009 = _3993 * _4007;
    float _4011 = _4009 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4013 = _4009 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4015 = _4009 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_96.x = _4011;
    out.m_96.y = _4013;
    out.m_96.z = _4015;
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
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3787 = false;
    bool _213 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_58.w;
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
        out.m_61.x = 0.0;
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
        float _4072 = as_type<float>(_133);
        out.gl_Position.z = _4072;
    }
    if (!_121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = in.m_63.w;
    bool _139 = _137 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_137);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = -_137;
    float _151 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _153 = 0.0;
    float _155 = _151;
    if (_147)
    {
        float _157 = float(_117);
        _153 = _157;
    }
    float _159 = _153;
    bool _161 = _151 >= _159;
    bool _163 = !_147;
    bool _165 = _161 || _163;
    if (_165)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _167 = _127;
    if (_165)
    {
        out.m_61.x = 0.0;
    }
    if (_165)
    {
        float _169 = _167 * 5.0;
        _135 = as_type<int>(_169);
    }
    int _171 = _135;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4141 = as_type<float>(_171);
        out.gl_Position.z = _4141;
    }
    if (_165)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _195 = in.m_68.x;
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
    float _223 = in.m_58.x;
    float _225 = in.m_58.y;
    float _227 = in.m_58.z;
    float _229 = _225 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _231 = _225 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _233 = fma(_223, (*spvDescriptorSet0.vp_c10)._m0[6].x, _229);
    float _235 = fma(_223, (*spvDescriptorSet0.vp_c10)._m0[4].x, _231);
    float _237 = fma(_227, (*spvDescriptorSet0.vp_c10)._m0[6].z, _233);
    float _239 = fma(_227, (*spvDescriptorSet0.vp_c10)._m0[4].z, _235);
    float _241 = _237 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _243 = _239 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _245 = fma(_241, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _247 = fma(_243, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _249 = floor(_245);
    float _251 = floor(_247);
    float _253 = -_249;
    float _255 = _245 + _253;
    float _257 = -_251;
    float _259 = _247 + _257;
    float2 _4290 = float2(_259, _255);
    float _261 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4290, float2(0.0), isnan(_4290)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4290, float2(0.0), isnan(_4290)), level(0.0)).x;
    float _263 = in.m_68.x;
    float _265 = in.m_68.y;
    float _267 = in.m_68.z;
    float _269 = in.m_68.w;
    float _271 = _225 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _273 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _275 = log2(_273);
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _283 = _281 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _285 = fma(_223, (*spvDescriptorSet0.vp_c10)._m0[5].x, _271);
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _289 = _221 + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _291;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _297 = _221 + _295;
    float _299 = 1.0 / _283;
    float _301 = fma(_227, (*spvDescriptorSet0.vp_c10)._m0[5].z, _285);
    int _303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _305 = _303 != 0;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _309 = 1.0 / _279;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _313 = float(_117);
    float _315 = _263 * 2.0;
    float _317 = _265 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _319;
    float _323 = _289 * _299;
    float _325 = _267 * 2.0;
    float _327 = 1.0 / _293;
    float _329 = _263 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _331 = fma(_317, -2.0, _311);
    float _333 = _267 + _263;
    float _335 = _297 * _309;
    float _337 = _263 + _265;
    float _339 = floor(_325);
    float _341 = _265 * 2.0;
    float _343 = -_307;
    float _345 = fma(_329, 2.0, _343);
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _349 = _221 + _347;
    float _351 = _333 + (-1.0);
    float _353 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[76].y, _331);
    float _355 = -_151;
    float _357 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[76].x, _345);
    float _359 = floor(_315);
    float _361 = _349 * _327;
    float _363 = fma(_321, _361, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _365 = floor(_341);
    float _367 = _337 + (-1.0);
    float _369 = _267 + _265;
    bool _371 = _339 > 0.0;
    float _373 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _375 = _369 + (-1.0);
    float _377 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _379 = _359 >= 0.0;
    bool _381 = isnan(_359);
    bool _383 = _379 || _381;
    bool _385 = isnan(0.0);
    bool _387 = _383 || _385;
    float _389 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _391 = int(_389);
    float _393 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _395 = as_type<int>(_375);
    float _397 = _313;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_305)
    {
        _395 = 0;
    }
    int _401 = _395;
    int _403 = _401;
    if (!_305)
    {
        _403 = 1;
    }
    int _405 = _403;
    bool _407 = _339 >= 0.0;
    bool _409 = isnan(_339);
    bool _411 = _407 || _409;
    bool _413 = isnan(0.0);
    bool _415 = _411 || _413;
    bool _417 = _359 > 0.0;
    float _419 = 1.0 / _313;
    bool _421 = _365 > 0.0;
    bool _423 = _365 >= 0.0;
    bool _425 = isnan(_365);
    bool _427 = _423 || _425;
    bool _429 = isnan(0.0);
    bool _431 = _427 || _429;
    float _433 = _387 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _435 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _437 = int(_435);
    bool _439 = _405 != 1;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _441;
    int _445 = _415 ? 0 : 1;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _447;
    float _451 = _431 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _457 = ~_445;
    int _459 = _457 + 1;
    int _461 = _459 + 1;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _465 = _463 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _467 = _461;
    float _469 = _451;
    float _471 = _433;
    if (!_371)
    {
        int _473 = ~_445;
        int _475 = _473 + 1;
        _467 = _475;
    }
    int _477 = _467;
    float _479 = fma(_443, _335, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _483 = _481 != 0;
    int _485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _487 = _485 != 0;
    int _489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _491 = _489 != 0;
    float _493 = fma(_449, _335, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _495 = fma(_455, _323, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _497 = fma(_465, _323, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _499 = ~as_type<int>(_451);
    int _501 = _499 + 1;
    int _503 = _501 + 1;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _505;
    int _509 = _503;
    if (!_421)
    {
        int _511 = ~as_type<int>(_451);
        int _513 = _511 + 1;
        _509 = _513;
    }
    int _515 = _509;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _519 = fma(_507, _361, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    if (!_439)
    {
        _469 = _267;
    }
    float _521 = _469;
    bool _523 = !_487;
    int _525 = _523 ? 0 : 1;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _529 = !_483;
    int _531 = _529 ? 0 : 1;
    bool _533 = !_491;
    int _535 = _533 ? 0 : 1;
    int _537 = ~as_type<int>(_433);
    int _539 = _537 + 1;
    int _541 = _539 + 1;
    float _543 = _521;
    int _545 = _541;
    if (_439)
    {
        _543 = _265;
    }
    float _547 = _543;
    int _549 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _551 = _549 != 0;
    int _553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _555 = _553 != 0;
    int _557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _559 = _557 != 0;
    float _561 = _547;
    if (!_417)
    {
        int _563 = ~as_type<int>(_433);
        int _565 = _563 + 1;
        _545 = _565;
    }
    int _567 = _545;
    float _569 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[83].w, _517);
    if (!_439)
    {
        _471 = _265;
    }
    float _571 = _471;
    float _573 = _571;
    if (_439)
    {
        _573 = _263;
    }
    float _575 = _573;
    bool _577 = !_555;
    int _579 = _577 ? 0 : 1;
    bool _581 = !_551;
    int _583 = _581 ? 0 : 1;
    float _585 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[83].z, _527);
    if (!_439)
    {
        _397 = _267;
    }
    float _587 = _397;
    float _589 = _587;
    if (!_439)
    {
        _561 = _265;
    }
    float _591 = _561;
    float _593 = _591;
    if (_439)
    {
        _589 = _265;
    }
    float _595 = _589;
    float _597 = float(_391);
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _601 = abs(_579);
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (_439)
    {
        _593 = _263;
    }
    float _605 = _593;
    float _607 = 1.0 / _597;
    int _609 = abs(_583);
    float _611 = _595 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _613 = float(_567);
    float _615 = _605 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _617 = float(_609);
    float _619 = _275 * _151;
    float _621 = float(_477);
    float _623 = -_599;
    float _625 = fma(_615, 2.0, _623);
    float _627 = float(_601);
    float _629 = fma(_611, -2.0, _603);
    float _631 = float(_437);
    float _633 = exp2(_619);
    float _635 = _617 * _621;
    float _637 = _627 * _613;
    float _639 = in.m_70.x;
    float _641 = in.m_70.y;
    float _643 = in.m_70.z;
    float _645 = _419 * _151;
    float _647 = _635 * (-2.0);
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _651 = 1.0 + _649;
    float _653 = 1.0 / _631;
    bool _655 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _657 = isnan(0.0);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _663 = _659 || _661;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _667 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _669 = isnan(1.0);
    bool _671 = _667 || _669;
    bool _673 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _675 = _671 || _673;
    float _677 = _607 * _151;
    float _679 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[78].w, _665);
    float _681 = -_633;
    float _683 = _681 + 1.0;
    float _685 = 1.0 / _651;
    float _687 = _663 ? _683 : 0.0;
    float _689 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[82].z, _585);
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _693 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[82].w, _569);
    float _695 = fma(_373, _647, _373);
    float _697 = _301 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _699 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[78].z, _691);
    float _701 = fma(_647, _639, _639);
    float _703 = _263 + (-0.5);
    float _705 = _653 * _151;
    float _707 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[77].z, _699);
    float _709 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[77].w, _679);
    float _711 = -_151;
    float _713 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[81].x, _625);
    float _715 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[81].y, _629);
    float _717 = _705;
    if (_675)
    {
        float _719 = _687 * _685;
        _155 = _719;
    }
    float _721 = _155;
    float _723 = _637 * (-2.0);
    bool _725 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _727 = isnan(_221);
    bool _729 = _725 || _727;
    bool _731 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _733 = _729 || _731;
    float _735 = float(_733);
    float _737 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[196].x, _701);
    bool _739 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _741 = isnan(_221);
    bool _743 = _739 || _741;
    bool _745 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _747 = _743 || _745;
    float _749 = float(_747);
    float _751 = _697 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _753 = fma(_723, _641, _641);
    float _755 = fma(_695, _721, _737);
    float _757 = fma(_393, _723, _393);
    float _759 = -_735;
    float _761 = _759 + 1.0;
    bool _763 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _765 = isnan(_221);
    bool _767 = _763 || _765;
    bool _769 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _771 = _767 || _769;
    float _773 = float(_771);
    float _775 = fma(_243, (*spvDescriptorSet0.vp_c8)._m0[11].x, _751);
    bool _777 = !_559;
    int _779 = _777 ? 0 : 1;
    float _781 = -_749;
    float _783 = _781 + 1.0;
    float _785 = _749 * _761;
    float _787 = fma(_241, (*spvDescriptorSet0.vp_c8)._m0[11].z, _775);
    int _789 = abs(_779);
    float _791 = _773 * _783;
    bool _793 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _795 = isnan(_221);
    bool _797 = _793 || _795;
    bool _799 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _801 = _797 || _799;
    float _803 = float(_801);
    float _805 = -_773;
    float _807 = _805 + 1.0;
    float _809 = _755 * 0.15915493667125701904296875;
    float _811 = float(_515);
    float _813 = _265 + (-0.5);
    float _815 = float(_789);
    float _817 = _803 * _807;
    float _819 = _787 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _821 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[196].y, _753);
    float _823 = _697 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _825 = _815 * _811;
    float _827 = _479 * _817;
    float _829 = -_803;
    float _831 = _829 + 1.0;
    float _833 = _493 * _817;
    float _835 = _825 * (-2.0);
    float _837 = in.m_72.x;
    float _839 = in.m_72.y;
    float _841 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[143].x, _827);
    float _843 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[143].y, _833);
    float _845 = fma(_835, _643, _643);
    float _847 = _267 + (-0.5);
    float _849 = fma(_377, _835, _377);
    float _851 = fma(_757, _721, _821);
    float _853 = fma(_497, _791, _843);
    float _855 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[196].z, _845);
    float _857 = fma(_243, (*spvDescriptorSet0.vp_c8)._m0[10].x, _823);
    float _859 = _851 * 0.15915493667125701904296875;
    float _861 = 1.0 / _819;
    float _863 = fma(_849, _721, _855);
    float _865 = fma(_495, _791, _841);
    float _867 = fma(_363, _785, _853);
    float _869 = fma(_241, (*spvDescriptorSet0.vp_c8)._m0[10].z, _857);
    float _871 = _863 * 0.15915493667125701904296875;
    float _873 = fma(_519, _785, _865);
    float _875 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[146].y, _867);
    float _877 = _809 * 6.283185482025146484375;
    float _879 = cos(_877);
    float _881 = _869 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _883 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[146].x, _873);
    float _885 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _887 = _875 * _839;
    float _889 = _881 + _819;
    float _891 = _883 * _837;
    float _893 = _859 * 6.283185482025146484375;
    float _895 = sin(_893);
    float _897 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _191);
    float _899 = _887 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _901 = _889 * _861;
    float _903 = _901 * 0.5;
    float _905 = _891 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _907 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _909 = _899 * _897;
    float _911 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _913 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[30].w, _911);
    float _915 = _859 * 6.283185482025146484375;
    float _917 = cos(_915);
    float _919 = _905 * _885;
    float _921 = _697 + _907;
    float _923 = _921 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _925 = _809 * 6.283185482025146484375;
    float _927 = sin(_925);
    float _929 = _879 * _895;
    float _931 = fma(_243, (*spvDescriptorSet0.vp_c15)._m0[126].x, _923);
    float _933 = fma(_241, (*spvDescriptorSet0.vp_c15)._m0[126].z, _931);
    float _935 = _871 * 6.283185482025146484375;
    float _937 = cos(_935);
    float _939 = _879 * _917;
    float _941 = _933 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _943 = _871 * 6.283185482025146484375;
    float _945 = sin(_943);
    float _947 = _927 * _895;
    float _949 = _927 * _917;
    float _951 = _879 * _937;
    float _953 = _927 * _937;
    float _955 = _917 * _937;
    float _957 = _895 * _937;
    float _959 = _951 * _909;
    float _961 = 1.0 / _913;
    float _963 = fma(_945, _939, _947);
    float _965 = -_929;
    float _967 = fma(_945, _949, _965);
    float _969 = fma(_945, _947, _939);
    float _971 = -_949;
    float _973 = fma(_945, _929, _971);
    float _975 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _977 = -_909;
    float _979 = _945 * _977;
    float _981 = fma(_963, _919, _959);
    float _983 = _953 * _909;
    float _985 = trunc(_941);
    int _987 = int(_985);
    float _989 = fma(_955, _919, _979);
    float _991 = fma(_973, _975, _981);
    float _993 = fma(_967, _919, _983);
    float _995 = fma(_957, _975, _989);
    float _997 = _991 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _999 = fma(_969, _975, _993);
    float _1001 = _921 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1003 = _991 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1005 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[26].x, _997);
    float _1007 = _991 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1009 = fma(_243, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1001);
    float _1011 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1003);
    float _1013 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1005);
    float _1015 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1017 = _961 * _1015;
    float _1019 = fma(_241, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1009);
    float _1021 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1011);
    float _1023 = _1013 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _1025 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1027 = _987 + _1025;
    int _1029 = _1027 + 1;
    float _1031 = _1019 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _1033 = _1017 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1035 = _1021 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    bool _1037 = _1017 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1039 = _241 + _1023;
    float _1041 = trunc(_1031);
    int _1043 = int(_1041);
    float _1045 = _243 + _1035;
    bool _1047 = !_1033;
    int _1049 = _1047 ? 0 : 1;
    float _1051 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1053 = _1039 + _1051;
    float _1055 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1057 = _1045 + _1055;
    float _1059 = _1053 * _1053;
    int _1061 = 2;
    int _1063 = _1029;
    int _1065 = as_type<int>(_999);
    float _1067 = _1045;
    float _1069 = _1039;
    float _1071 = _1057;
    if (!_1033)
    {
        _1061 = 1;
    }
    int _1073 = _1061;
    int _1075 = _1073;
    if (!_1037)
    {
        _1075 = _1049;
    }
    int _1077 = _1075;
    float _1079 = fma(_1057, _1057, _1059);
    bool _1081 = _1029 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1083 = _1077 << 6;
    float _1085 = sqrt(_1079);
    int _1087 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1089 = _1043 + _1087;
    int _1091 = _1089 + 1;
    int _1093 = _1083 + 48;
    uint _1096 = uint(int(uint(_1093) >> uint(2)));
    uint _1098 = uint(int(uint(int(_1096)) >> uint(2)));
    int _1100 = int(_1096) & 3;
    float _1102 = (*spvDescriptorSet0.vp_c15)._m0[int(_1098)][_1100];
    int _1104 = int(_1096) + 1;
    uint _1106 = uint(int(uint(_1104) >> uint(2)));
    int _1108 = _1104 & 3;
    float _1110 = (*spvDescriptorSet0.vp_c15)._m0[int(_1106)][_1108];
    int _1112 = _1029 | _1091;
    bool _1114 = _1112 < 0;
    bool _1116 = _1114 || _1081;
    int _1118 = _1083 + 96;
    uint _1120 = uint(int(uint(_1118) >> uint(2)));
    uint _1122 = uint(int(uint(int(_1120)) >> uint(2)));
    int _1124 = int(_1120) & 3;
    float _1126 = (*spvDescriptorSet0.vp_c15)._m0[int(_1122)][_1124];
    int _1128 = int(_1120) + 1;
    uint _1130 = uint(int(uint(_1128) >> uint(2)));
    int _1132 = _1128 & 3;
    float _1134 = (*spvDescriptorSet0.vp_c15)._m0[int(_1130)][_1132];
    bool _1136 = _1091 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1138 = _1136 || _1116;
    bool _1140 = _1085 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1142 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1144 = _1085 + _1142;
    int _1146 = _1083 + 64;
    uint _1148 = uint(int(uint(_1146) >> uint(2)));
    uint _1150 = uint(int(uint(int(_1148)) >> uint(2)));
    int _1152 = int(_1148) & 3;
    float _1154 = (*spvDescriptorSet0.vp_c15)._m0[int(_1150)][_1152];
    int _1156 = int(_1148) + 1;
    uint _1158 = uint(int(uint(_1156) >> uint(2)));
    int _1160 = _1156 & 3;
    float _1162 = (*spvDescriptorSet0.vp_c15)._m0[int(_1158)][_1160];
    int _1164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1166 = _1164 != 0;
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1170 = _1168 != 0;
    int _1172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1174 = _1172 != 0;
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1178 = _1176 != 0;
    bool _1180 = !_1166;
    int _1182 = _1180 ? 0 : 1;
    float _1184 = _1144;
    if (!_1138)
    {
        int _1186 = _1091 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1188 = _1186 + _1029;
        _1063 = _1188;
    }
    int _1190 = _1063;
    int _1192 = _1083 + 56;
    uint _1194 = uint(int(uint(_1192) >> uint(2)));
    uint _1196 = uint(int(uint(int(_1194)) >> uint(2)));
    int _1198 = int(_1194) & 3;
    float _1200 = (*spvDescriptorSet0.vp_c15)._m0[int(_1196)][_1198];
    int _1202 = int(_1194) + 1;
    uint _1204 = uint(int(uint(_1202) >> uint(2)));
    int _1206 = _1202 & 3;
    float _1208 = (*spvDescriptorSet0.vp_c15)._m0[int(_1204)][_1206];
    float _1210 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1007);
    float _1212 = as_type<float>(_1112);
    float _1214 = as_type<float>(_1190);
    if (_1140)
    {
        float _1216 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1212 = _1216;
    }
    float _1218 = _1212;
    int _1220 = 0;
    if (!_1138)
    {
        int _1222 = _1190 << 2;
        _1220 = _1222;
    }
    int _1224 = _1220;
    float _1226 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1210);
    int _1228 = 0;
    int _1230 = _1224;
    if (!_1138)
    {
        uint _1232 = uint(int(uint(_1190) >> uint(2)));
        _1228 = int(_1232);
    }
    int _1234 = _1228;
    int _1236 = _1083 + 104;
    uint _1238 = uint(int(uint(_1236) >> uint(2)));
    uint _1240 = uint(int(uint(int(_1238)) >> uint(2)));
    int _1242 = int(_1238) & 3;
    float _1244 = (*spvDescriptorSet0.vp_c15)._m0[int(_1240)][_1242];
    int _1246 = int(_1238) + 1;
    uint _1248 = uint(int(uint(_1246) >> uint(2)));
    int _1250 = _1246 & 3;
    float _1252 = (*spvDescriptorSet0.vp_c15)._m0[int(_1248)][_1250];
    if (!_1138)
    {
        int _1254 = 12 & _1224;
        _1230 = _1254;
    }
    int _1256 = _1230;
    if (!_1138)
    {
        int _1258 = _1234 << 4;
        int _1260 = _1258 + _1256;
        _1065 = _1260;
    }
    int _1262 = _1065;
    float _1264 = _1226 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1266 = _1083 + 72;
    uint _1268 = uint(int(uint(_1266) >> uint(2)));
    uint _1270 = uint(int(uint(int(_1268)) >> uint(2)));
    int _1272 = int(_1268) & 3;
    float _1274 = (*spvDescriptorSet0.vp_c15)._m0[int(_1270)][_1272];
    int _1276 = int(_1268) + 1;
    uint _1278 = uint(int(uint(_1276) >> uint(2)));
    int _1280 = _1276 & 3;
    float _1282 = (*spvDescriptorSet0.vp_c15)._m0[int(_1278)][_1280];
    float _1284 = _1218;
    if (_1140)
    {
        float _1286 = _1144 * _1218;
        _1284 = _1286;
    }
    float _1288 = _1284;
    float _1290 = _697 + _1264;
    if (_1140)
    {
        float _1292 = rsqrt(_1079);
        _1184 = _1292;
    }
    float _1294 = _1184;
    float _1296 = 0.0;
    if (_1140)
    {
        float _1298 = _1288 * 0.15915493667125701904296875;
        _1296 = _1298;
    }
    float _1300 = _1296;
    int _1302 = _1083 + 80;
    uint _1304 = uint(int(uint(_1302) >> uint(2)));
    uint _1306 = uint(int(uint(int(_1304)) >> uint(2)));
    int _1308 = int(_1304) & 3;
    float _1310 = (*spvDescriptorSet0.vp_c15)._m0[int(_1306)][_1308];
    int _1312 = int(_1304) + 1;
    uint _1314 = uint(int(uint(_1312) >> uint(2)));
    int _1316 = _1312 & 3;
    float _1318 = (*spvDescriptorSet0.vp_c15)._m0[int(_1314)][_1316];
    float _1320 = _921 * _1110;
    float _1322 = _1288;
    float _1324 = _1102;
    if (_1140)
    {
        float _1326 = _1300 * 6.283185482025146484375;
        float _1328 = sin(_1326);
        _1322 = _1328;
    }
    float _1330 = _1322;
    float _1332 = fma(_243, _1102, _1320);
    if (_1140)
    {
        float _1334 = _1290 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1324 = _1334;
    }
    float _1336 = _1324;
    bool _1338 = !_1174;
    int _1340 = _1338 ? 0 : 1;
    float _1342 = _921 * _1134;
    float _1344 = fma(_243, _1126, _1342);
    float _1346 = _1110;
    float _1348 = _1336;
    float _1350 = _1344;
    float _1352 = _1126;
    if (_1140)
    {
        float _1354 = _1300 * 6.283185482025146484375;
        float _1356 = cos(_1354);
        _1346 = _1356;
    }
    float _1358 = _1346;
    float _1360 = _921 * _1162;
    float _1362 = fma(_243, _1154, _1360);
    float _1364 = _1330;
    if (_1140)
    {
        float _1366 = fma(_1330, _1336, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1364 = _1366;
    }
    float _1368 = _1364;
    bool _1370 = !_1178;
    int _1372 = _1370 ? 0 : 1;
    float _1374 = fma(_241, _1200, _1332);
    bool _1376 = !_1170;
    int _1378 = _1376 ? 0 : 1;
    float _1380 = _1368;
    float _1382 = _1208;
    if (_1140)
    {
        float _1384 = _1294 * _1368;
        _1380 = _1384;
    }
    float _1386 = _1380;
    bool _1388 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1390 = isnan(0.5);
    bool _1392 = _1388 || _1390;
    bool _1394 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1396 = _1392 || _1394;
    if (_1140)
    {
        float _1398 = _1358 + (-1.0);
        _1348 = _1398;
    }
    float _1400 = _1348;
    if (_1140)
    {
        float _1402 = fma(_1057, _1386, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1067 = _1402;
    }
    float _1404 = _1067;
    if (_1140)
    {
        float _1406 = fma(_1053, _1386, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1069 = _1406;
    }
    float _1408 = _1069;
    float _1410 = fma(_241, _1244, _1344);
    if (!_1140)
    {
        _1350 = _1290;
    }
    float _1412 = _1350;
    float _1414 = fma(_241, _1274, _1362);
    float _1416 = _1374 + _1208;
    float _1418 = _1410 + _1252;
    float _1420 = _1412;
    if (_1140)
    {
        float _1422 = _1400 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1382 = _1422;
    }
    float _1424 = _1382;
    float _1426 = _1252;
    if (!_1138)
    {
        float _1428 = floor(_941);
        _1426 = _1428;
    }
    float _1430 = _1426;
    float _1432 = _1414 + _1282;
    if (_1396)
    {
        _1352 = _1404;
    }
    float _1434 = _1352;
    float _1436 = _1434;
    if (_1140)
    {
        float _1438 = fma(_1290, _1358, _1424);
        _1420 = _1438;
    }
    float _1440 = _1420;
    float _1442 = _1440;
    if (_1396)
    {
        _1071 = _1408;
    }
    float _1444 = _1071;
    float _1446 = 1.0 / _1418;
    float _1448 = _1444;
    if (!_1396)
    {
        float _1450 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1452 = _697 + _1450;
        float _1454 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1456 = _243 + _1454;
        float _1458 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1460 = -_697;
        float _1462 = _1460 + _1440;
        float _1464 = _1452 * _1452;
        float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1468 = _241 + _1466;
        float _1470 = -_243;
        float _1472 = _1470 + _1404;
        float _1474 = -_241;
        float _1476 = _1474 + _1408;
        float _1478 = fma(_1456, _1456, _1464);
        float _1480 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1482 = fma(_1468, _1468, _1478);
        float _1484 = sqrt(_1482);
        float _1486 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1488 = precise::min(_1484, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1490 = _1488 * _1480;
        float _1492 = _1486 * _1490;
        float _1494 = fma(_1462, _1492, _697);
        float _1496 = fma(_1472, _1492, _243);
        float _1498 = fma(_1476, _1492, _241);
        _1442 = _1494;
        _1436 = _1496;
        _1448 = _1498;
    }
    float _1500 = _1442;
    float _1502 = _1436;
    float _1504 = _1448;
    int _1506 = _1083 + 88;
    uint _1508 = uint(int(uint(_1506) >> uint(2)));
    uint _1510 = uint(int(uint(int(_1508)) >> uint(2)));
    int _1512 = int(_1508) & 3;
    float _1514 = (*spvDescriptorSet0.vp_c15)._m0[int(_1510)][_1512];
    int _1516 = int(_1508) + 1;
    uint _1518 = uint(int(uint(_1516) >> uint(2)));
    int _1520 = _1516 & 3;
    float _1522 = (*spvDescriptorSet0.vp_c15)._m0[int(_1518)][_1520];
    float _1524 = _1432 * _1446;
    float _1526 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1528 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1530 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1532 = _1416 * _1446;
    float _1534 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1526);
    float _1536 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1528);
    float _1538 = _1264;
    if (!_1138)
    {
        int _1540 = _1262 + 400;
        uint _1542 = uint(int(uint(_1540) >> uint(2)));
        uint _1544 = uint(int(uint(int(_1542)) >> uint(2)));
        int _1546 = int(_1542) & 3;
        float _1548 = (*spvDescriptorSet0.vp_c15)._m0[int(_1544)][_1546];
        _1538 = _1548;
    }
    float _1550 = _1538;
    float _1552 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1530);
    float _1554 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1534);
    float _1556 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1536);
    float _1558 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1560 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1552);
    float _1562 = _1554 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1564 = _1556 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1566 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1558);
    float _1568 = _1560 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1570 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _1572 = _1532 >= 0.0;
    float _1574 = _1562 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1576 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1578 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1566);
    bool _1580 = _1532 <= 1.0;
    bool _1582 = _1580 && _1572;
    float _1584 = -_1574;
    float _1586 = fma(_1584, _1570, 1.0);
    float _1588 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1576);
    float _1590 = _921 * _1318;
    bool _1592 = _1524 >= 0.0;
    bool _1594 = _1592 && _1582;
    float _1596 = _1578 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1598 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1588);
    float _1600 = log2(_1586);
    bool _1602 = _1524 <= 1.0;
    bool _1604 = _1602 && _1594;
    float _1606 = fma(_243, _1310, _1590);
    float _1608 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1598);
    float _1610 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1612 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1614 = _1414;
    if (!_1138)
    {
        float _1616 = floor(_1031);
        _1614 = _1616;
    }
    float _1618 = _1614;
    float _1620 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1610);
    float _1622 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1620);
    float _1624 = 0.0;
    if (_1604)
    {
        float _1626 = float(_1077);
        _1624 = _1626;
    }
    float _1628 = _1624;
    float _1630 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1612);
    float _1632 = 1.0 / _1608;
    float _1634 = fma(_241, _1514, _1606);
    float _1636 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1630);
    float _1638 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1622);
    float _1640 = _1634 + _1522;
    float _1642 = _1600 * 0.693147182464599609375;
    float _1644 = _1610;
    float _1646 = _1638;
    if (_1604)
    {
        float _1648 = rint(_1628);
        float _1650 = precise::max(_1648, 0.0);
        uint _1652 = uint(_1650);
        uint _1654 = clamp(_1652, 0u, 65535u);
        _1644 = as_type<float>(_1654);
    }
    float _1656 = _1644;
    float _1658 = 0.0;
    if (!_1138)
    {
        float _1660 = -_1618;
        float _1662 = _1031 + _1660;
        _1658 = _1662;
    }
    float _1664 = _1658;
    float _1666 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1636);
    float _1668 = _1642 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1670 = _1640 * _1446;
    float _1672 = _1642;
    if (!_1138)
    {
        float _1674 = rint(_1550);
        float _1676 = precise::max(_1674, 0.0);
        uint _1678 = uint(_1676);
        uint _1680 = clamp(_1678, 0u, 65535u);
        _1672 = as_type<float>(_1680);
    }
    float _1682 = _1672;
    float _1684 = _1638 * _1632;
    float _1686 = _1666 * _1632;
    float _1688 = fma(_1684, 0.5, 0.5);
    float _1690 = fma(_1686, -0.5, 0.5);
    float _1692 = _1684;
    if (!_1138)
    {
        float _1694 = -_1430;
        float _1696 = _941 + _1694;
        _1692 = _1696;
    }
    float _1698 = _1692;
    float _1700 = _1656;
    if (_1604)
    {
        float3 _6611 = float3(_1532, _1524, float(as_type<int>(_1656)));
        float3 _6615 = select(_6611, float3(0.0), isnan(_6611));
        float _1702 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6615.xy, uint(rint(_6615.z)), _1670, level(0.0));
        _1700 = _1702;
    }
    float _1704 = _1700;
    float3 _6625 = float3(_1688, _1690, _1668);
    float _1706 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6625, float3(0.0), isnan(_6625)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6625, float3(0.0), isnan(_6625)), level(0.0)).x;
    float3 _6634 = float3(_1688, _1690, _1668);
    float4 _1709 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6634, float3(0.0), isnan(_6634)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6634, float3(0.0), isnan(_6634)), level(0.0)).xyzw;
    float _1711 = _1709.x;
    float _1713 = _1709.y;
    float _1715 = _1709.z;
    float _1717 = _1709.w;
    float _1719 = _1664;
    if (!_1138)
    {
        float3 _6657 = float3(_1698, _1664, float(as_type<int>(_1682)));
        float3 _6659 = select(_6657, float3(0.0), isnan(_6657));
        float _1721 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6659.xy, uint(rint(_6659.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6659.xy, uint(rint(_6659.z)), level(0.0)).x;
        _1719 = _1721;
    }
    float _1723 = _1719;
    float _1725 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1727 = int(_1725);
    int _1729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1731 = _1729 != 0;
    int _1733 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1735 = _1733 != 0;
    int _1737 = abs(_1378);
    int _1739 = abs(_525);
    float _1741 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1743 = int(_1741);
    int _1745 = abs(_1182);
    int _1747 = abs(_535);
    int _1749 = abs(_1372);
    if (_1731)
    {
        float _1751 = in.m_68.x;
        _399 = _1751;
    }
    float _1753 = _399;
    float _1755 = float(uint(_1727));
    float _1757 = trunc(_677);
    int _1759 = int(_1757);
    float _1761 = _1753;
    if (!_1731)
    {
        float _1763 = in.m_68.y;
        _1761 = _1763;
    }
    float _1765 = _1761;
    int _1767 = ~_1727;
    int _1769 = _1767 + 1;
    float _1771 = float(uint(_1743));
    float _1773 = 1.0 / _1755;
    float _1775 = 1.0 / _1771;
    float _1777 = trunc(_705);
    int _1779 = int(_1777);
    int _1781 = as_type<int>(_1773) + (-2);
    float _1783 = float(uint(_1759));
    int _1785 = ~_1743;
    int _1787 = _1785 + 1;
    int _1789 = as_type<int>(_1775) + (-2);
    float _1791 = as_type<float>(_1781) * _1783;
    float _1793 = _1775;
    if (_1731)
    {
        _717 = 1.0;
    }
    float _1795 = _717;
    float _1797 = _1795;
    if (!_1731)
    {
        _1797 = 1.2345600128173828125;
    }
    float _1799 = _1797;
    if (_1731)
    {
        _1793 = 1.0;
    }
    float _1801 = _1793;
    float _1803 = trunc(_1791);
    float _1805 = precise::max(_1803, 0.0);
    uint _1807 = uint(_1805);
    float _1809 = float(uint(_1779));
    float _1811 = _1765 * _1799;
    float _1813 = _1801;
    if (!_1731)
    {
        _1813 = 7.345489978790283203125;
    }
    float _1815 = _1813;
    float _1817 = as_type<float>(_1789) * _1809;
    int _1819 = ~_1727;
    int _1821 = _1819 + 1;
    float _1823 = _1815 * _263;
    float _1825 = floor(_1811);
    int _1827 = _1821 * int(_1807);
    int _1829 = _1827 + _1759;
    float _1831 = trunc(_1817);
    float _1833 = precise::max(_1831, 0.0);
    uint _1835 = uint(_1833);
    float _1837 = float(uint(_1829));
    float _1839 = floor(_1823);
    float _1841 = as_type<float>(_1781) * _1837;
    float _1843 = float(_1759);
    float _1845 = -_1825;
    float _1847 = _1811 + _1845;
    int _1849 = _1787 * int(_1835);
    int _1851 = _1849 + _1779;
    float _1853 = trunc(_1841);
    float _1855 = precise::max(_1853, 0.0);
    uint _1857 = uint(_1855);
    float _1859 = float(uint(_1851));
    float _1861 = -_1839;
    float _1863 = _1823 + _1861;
    float _1865 = float(_1743);
    float _1867 = as_type<float>(_1789) * _1859;
    float _1869 = float(_1727);
    float _1871 = _1847 * _1865;
    bool _1873 = _1843 >= _1869;
    bool _1875 = isnan(_1843);
    bool _1877 = _1873 || _1875;
    bool _1879 = isnan(_1869);
    bool _1881 = _1877 || _1879;
    float _1883 = float(_1881);
    float _1885 = trunc(_1867);
    float _1887 = precise::max(_1885, 0.0);
    uint _1889 = uint(_1887);
    int _1891 = int(_1807) + int(_1857);
    int _1893 = _1769 * _1891;
    int _1895 = _1893 + _1759;
    float _1897 = trunc(_1883);
    int _1899 = int(_1897);
    bool _1901 = uint(_1895) >= uint(_1727);
    int _1903 = int(_1835) + int(_1889);
    float _1905 = _1863 * _1869;
    int _1907 = ~_1743;
    int _1909 = _1907 + 1;
    float _1911 = _1869 * _645;
    float _1913 = float(_1779);
    float _1915 = _1865 * _645;
    float _1917 = trunc(_1871);
    int _1919 = int(_1917);
    int _1921 = _1909 * _1903;
    int _1923 = _1921 + _1779;
    bool _1925 = _1913 >= _1865;
    bool _1927 = isnan(_1913);
    bool _1929 = _1925 || _1927;
    bool _1931 = isnan(_1865);
    bool _1933 = _1929 || _1931;
    float _1935 = float(_1933);
    bool _1937 = !_1901;
    int _1939 = _1937 ? 0 : (-1);
    bool _1941 = uint(_1923) >= uint(_1743);
    float _1943 = trunc(_1935);
    int _1945 = int(_1943);
    bool _1947 = !_1941;
    int _1949 = _1947 ? 0 : (-1);
    int _1951 = ~_1891;
    int _1953 = _1951 + _1939;
    int _1955 = _1953 + 1;
    int _1957 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1959 = _1957 != 0;
    float _1961 = trunc(_1905);
    int _1963 = int(_1961);
    int _1965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1967 = _1965 != 0;
    int _1969 = _1727 * _1955;
    int _1971 = _1969 + _1759;
    int _1973 = ~_1903;
    int _1975 = _1973 + _1949;
    int _1977 = _1975 + 1;
    bool _1979 = !_1959;
    int _1981 = _1979 ? 0 : 1;
    bool _1983 = !_1967;
    int _1985 = _1983 ? 0 : 1;
    int _1987 = _1743 * _1977;
    int _1989 = _1987 + _1779;
    bool _1991 = _1727 == 0;
    float _1993 = trunc(_1911);
    int _1995 = int(_1993);
    bool _1997 = _1743 == 0;
    int _1999 = abs(_1981);
    int _2001 = ~_1899;
    int _2003 = _2001 + 1;
    int _2005 = _2003 + 1;
    bool _2007 = !_1991;
    int _2009 = _2007 ? _1971 : (-1);
    int _2011 = _1963 * _1999;
    int _2013 = _2011 + _1759;
    int _2015 = ~_1945;
    int _2017 = _2015 + 1;
    int _2019 = _2017 + 1;
    float _2021 = trunc(_1915);
    int _2023 = int(_2021);
    bool _2025 = !_1997;
    int _2027 = _2025 ? _1989 : (-1);
    int _2029 = _2009 * _2005;
    int _2031 = _1727 + (-1);
    int _2033 = _1743 + (-1);
    int _2035 = _2027 * _2019;
    int _2037 = abs(_1985);
    int _2039 = _1899 * _2031;
    int _2041 = _2039 + _2029;
    int _2043 = _1945 * _2033;
    int _2045 = _2043 + _2035;
    int _2047 = _2041 * _1739;
    int _2049 = abs(_531);
    int _2051 = _1919 * _2037;
    int _2053 = _2051 + _1779;
    int _2055 = abs(_1340);
    int _2057 = _2045 * _1737;
    bool _2059 = !_1735;
    int _2061 = _2059 ? 0 : 1;
    int _2063 = _1995 * _2049;
    int _2065 = _2063 + _2047;
    int _2067 = abs(_2061);
    int _2069 = _2013 * _1747;
    int _2071 = _2069 + _2065;
    int _2073 = ~_1727;
    int _2075 = _2073 + 1;
    int _2077 = _2023 * _1745;
    int _2079 = _2077 + _2057;
    int _2081 = ~_1743;
    int _2083 = _2081 + 1;
    int _2085 = _1963 * _2067;
    int _2087 = _2085 + _2071;
    int _2089 = _2053 * _2055;
    int _2091 = _2089 + _2079;
    float _2093 = float(uint(_2013));
    float _2095 = float(uint(_2087));
    int _2097 = _1919 * _1749;
    int _2099 = _2097 + _2091;
    int _2101 = ~_1743;
    int _2103 = _2101 + 1;
    float _2105 = as_type<float>(_1781) * _2093;
    float _2107 = as_type<float>(_1781) * _2095;
    float _2109 = float(uint(_2099));
    float _2111 = trunc(_2105);
    float _2113 = precise::max(_2111, 0.0);
    uint _2115 = uint(_2113);
    float _2117 = as_type<float>(_1789) * _2109;
    int _2119 = ~_1727;
    int _2121 = _2119 + 1;
    float _2123 = trunc(_2107);
    float _2125 = precise::max(_2123, 0.0);
    uint _2127 = uint(_2125);
    float _2129 = trunc(_2117);
    float _2131 = precise::max(_2129, 0.0);
    uint _2133 = uint(_2131);
    int _2135 = _2121 * int(_2127);
    int _2137 = _2135 + _2087;
    float _2139 = float(uint(_2137));
    int _2141 = _2083 * int(_2133);
    int _2143 = _2141 + _2099;
    float _2145 = as_type<float>(_1781) * _2139;
    float _2147 = float(uint(_2143));
    float _2149 = trunc(_2145);
    float _2151 = precise::max(_2149, 0.0);
    uint _2153 = uint(_2151);
    float _2155 = as_type<float>(_1789) * _2147;
    float _2157 = float(uint(_2053));
    float _2159 = trunc(_2155);
    float _2161 = precise::max(_2159, 0.0);
    uint _2163 = uint(_2161);
    float _2165 = as_type<float>(_1789) * _2157;
    int _2167 = _2075 * int(_2115);
    int _2169 = _2167 + _2013;
    int _2171 = ~_1727;
    int _2173 = _2171 + 1;
    float _2175 = float(uint(_2169));
    float _2177 = trunc(_2165);
    float _2179 = precise::max(_2177, 0.0);
    uint _2181 = uint(_2179);
    int _2183 = int(_2127) + int(_2153);
    int _2185 = ~_1743;
    int _2187 = _2185 + 1;
    float _2189 = as_type<float>(_1781) * _2175;
    int _2191 = _2173 * _2183;
    int _2193 = _2191 + _2087;
    int _2195 = int(_2133) + int(_2163);
    float _2197 = trunc(_2189);
    float _2199 = precise::max(_2197, 0.0);
    uint _2201 = uint(_2199);
    bool _2203 = uint(_2193) >= uint(_1727);
    int _2205 = _2187 * _2195;
    int _2207 = _2205 + _2099;
    int _2209 = _2103 * int(_2181);
    int _2211 = _2209 + _2053;
    bool _2213 = !_2203;
    int _2215 = _2213 ? 0 : (-1);
    bool _2217 = uint(_2207) >= uint(_1743);
    int _2219 = ~_2183;
    int _2221 = _2219 + _2215;
    int _2223 = _2221 + 1;
    float _2225 = float(uint(_2211));
    bool _2227 = !_2217;
    int _2229 = _2227 ? 0 : (-1);
    int _2231 = _1727 * _2223;
    int _2233 = _2231 + _2087;
    int _2235 = int(_2115) + int(_2201);
    float _2237 = as_type<float>(_1789) * _2225;
    int _2239 = ~_2195;
    int _2241 = _2239 + _2229;
    int _2243 = _2241 + 1;
    float _2245 = as_type<float>(_2223);
    float _2247 = _2225;
    if (_1138)
    {
        _2245 = 1.0;
    }
    float _2249 = _2245;
    float _2251 = _2249;
    float _2253 = _1706;
    if (!_1138)
    {
        int _2255 = _1190 << 4;
        int _2257 = _2255 + 2048;
        uint _2259 = uint(int(uint(_2257) >> uint(2)));
        uint _2261 = uint(int(uint(int(_2259)) >> uint(2)));
        int _2263 = int(_2259) & 3;
        float _2265 = (*spvDescriptorSet0.vp_c15)._m0[int(_2261)][_2263];
        int _2267 = int(_2259) + 1;
        uint _2269 = uint(int(uint(_2267) >> uint(2)));
        int _2271 = _2267 & 3;
        float _2273 = (*spvDescriptorSet0.vp_c15)._m0[int(_2269)][_2271];
        int _2275 = _2257 + 8;
        uint _2277 = uint(int(uint(_2275) >> uint(2)));
        uint _2279 = uint(int(uint(int(_2277)) >> uint(2)));
        int _2281 = int(_2277) & 3;
        float _2283 = (*spvDescriptorSet0.vp_c15)._m0[int(_2279)][_2281];
        int _2285 = int(_2277) + 1;
        uint _2287 = uint(int(uint(_2285) >> uint(2)));
        int _2289 = _2285 & 3;
        float _2291 = (*spvDescriptorSet0.vp_c15)._m0[int(_2287)][_2289];
        float _2293 = _921 * _2273;
        float _2295 = fma(_243, _2265, _2293);
        float _2297 = fma(_241, _2283, _2295);
        float _2299 = _2297 + _2291;
        float _2301 = precise::clamp(_2299, 0.0, 1.0);
        float _2303 = -_2301;
        float _2305 = _2303 + _1723;
        float _2307 = fma(_2305, 500.0, 1.5);
        float _2309 = exp2(_2307);
        float _2311 = 0.0 + _2309;
        float _2313 = precise::clamp(_2311, 0.0, 1.0);
        _1214 = as_type<float>(_2257);
        _2251 = _2313;
    }
    float _2315 = _1214;
    float _2317 = _2251;
    float _2319 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2321 = _1500 + _2319;
    float _2323 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2325 = _1502 + _2323;
    float _2327 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2329 = _1504 + _2327;
    float _2331 = _2321 * _2321;
    float _2333 = fma(_2325, _2325, _2331);
    float _2335 = fma(_2329, _2329, _2333);
    float _2337 = rsqrt(_2335);
    float _2339 = sqrt(_2335);
    float _2341 = _2337 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2343 = _2325 * _2341;
    float _2345 = _2329 * _2341;
    float _2347 = _2343 * _2343;
    float _2349 = _2345 * _2345;
    float _2351 = _2347 + _2349;
    float _2353 = sqrt(_2351);
    bool _2355 = _2353 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2357 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2359 = _2353 + _2357;
    float _2361 = as_type<float>(_2229);
    float _2363 = _2351;
    float _2365 = _2359;
    float _2367 = _2341;
    float _2369 = _2343;
    float _2371 = _2345;
    float _2373 = _2347;
    float _2375 = _2349;
    if (_2355)
    {
        float _2377 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2361 = _2377;
    }
    float _2379 = _2361;
    if (_2355)
    {
        float _2381 = rsqrt(_2351);
        _2363 = _2381;
    }
    float _2383 = _2363;
    if (_2355)
    {
        float _2385 = _2359 * _2379;
        _2365 = _2385;
    }
    float _2387 = _2365;
    if (_2355)
    {
        float _2389 = _2387 * 0.15915493667125701904296875;
        _2247 = _2389;
    }
    float _2391 = _2247;
    float _2393 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2395 = _2315;
    float _2397 = _2393;
    if (_2355)
    {
        float _2399 = _2391 * 6.283185482025146484375;
        float _2401 = sin(_2399);
        _2395 = _2401;
    }
    float _2403 = _2395;
    float _2405 = precise::max(0.0, _2393);
    float _2407 = _2387;
    if (_2355)
    {
        float _2409 = _2391 * 6.283185482025146484375;
        float _2411 = cos(_2409);
        _2407 = _2411;
    }
    float _2413 = _2407;
    float _2415 = -_2341;
    float _2417 = -_2405;
    float _2419 = fma(_2321, _2415, _2417);
    float _2421 = _2419;
    if (_2355)
    {
        float _2423 = _2419 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2367 = _2423;
    }
    float _2425 = _2367;
    float _2427 = _2403;
    float _2429 = _2425;
    if (_2355)
    {
        float _2431 = fma(_2403, _2425, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2427 = _2431;
    }
    float _2433 = _2427;
    int _2435 = ~_1727;
    int _2437 = _2435 + 1;
    if (_2355)
    {
        float _2439 = _2383 * _2433;
        _2429 = _2439;
    }
    float _2441 = _2429;
    int _2443 = _2437 * _2235;
    int _2445 = _2443 + _2013;
    if (_2355)
    {
        float _2447 = _2413 + (-1.0);
        _2397 = _2447;
    }
    float _2449 = _2397;
    float _2451 = _2449;
    if (_2355)
    {
        float _2453 = _2343 * _2441;
        _2369 = _2453;
    }
    float _2455 = _2369;
    if (_2355)
    {
        float _2457 = _2345 * _2441;
        _2371 = _2457;
    }
    float _2459 = _2371;
    if (_2355)
    {
        float _2461 = _2449 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2451 = _2461;
    }
    float _2463 = _2451;
    if (_2355)
    {
        float _2465 = _2455 * _2455;
        _2373 = _2465;
    }
    float _2467 = _2373;
    if (_2355)
    {
        float _2469 = _2459 * _2459;
        _2375 = _2469;
    }
    float _2471 = _2375;
    if (_2355)
    {
        float _2473 = fma(_2419, _2413, _2463);
        _2421 = _2473;
    }
    float _2475 = _2421;
    float _2477 = fma(_2475, _2475, _2467);
    float _2479 = _2477 + _2471;
    float _2481 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2483 = fma(_2339, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2481);
    float _2485 = precise::clamp(_2483, 0.0, 1.0);
    float _2487 = rsqrt(_2479);
    float _2489 = -_2485;
    float _2491 = _2489 + 1.0;
    float _2493 = _2487 * _2455;
    float _2495 = _2487 * _2475;
    float _2497 = _2487 * _2459;
    float _2499 = _2493 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2501 = abs(_2491);
    float _2503 = log2(_2501);
    float _2505 = -_2499;
    float _2507 = fma(_2495, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2505);
    bool _2509 = !_1991;
    int _2511 = _2509 ? _2233 : (-1);
    float _2513 = -_2497;
    float _2515 = fma(_2513, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2507);
    int _2517 = _2511 & 3;
    bool _2519 = _2517 != 0;
    int _2521 = _2511 & 3;
    bool _2523 = _2521 != 0;
    float _2525 = fma(_2515, -0.5, 0.5);
    float _2527 = fma(_2515, 0.5, 0.5);
    bool _2529 = uint(_2517) > 1u;
    float _2531 = fma(_2527, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2533 = _2503 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2535 = sqrt(_2525);
    float _2537 = fma(_2527, _2531, -0.212114393711090087890625);
    float _2539 = fma(_2527, _2537, 1.570728778839111328125);
    float _2541 = _2495 + 1.0;
    float _2543 = exp2(_2533);
    float _2545 = _2535 * 0.636619746685028076171875;
    float _2547 = -_2539;
    float _2549 = fma(_2545, _2547, 1.0);
    float _2551 = -_2495;
    float _2553 = fma(_2543, _2541, _2551);
    float _2555 = fma(_1404, 6.2500002968590706586837768554688e-05, 0.5);
    float _2557 = fma(_1408, 6.2500002968590706586837768554688e-05, 0.5);
    float _2559 = fma(_2553, 0.5, 0.5);
    float2 _7829 = float2(_2549, _2559);
    float3 _2563 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7829, float2(0.0), isnan(_7829)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7829, float2(0.0), isnan(_7829)), level(0.0)).xyz;
    float _2565 = _2563.x;
    float _2567 = _2563.y;
    float _2569 = _2563.z;
    float2 _7843 = float2(_2555, _2557);
    float3 _2571 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_7843, float2(0.0), isnan(_7843)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_7843, float2(0.0), isnan(_7843)), level(0.0)).xyz;
    float _2573 = _2571.x;
    float _2575 = _2571.y;
    float _2577 = _2571.z;
    bool _2579 = uint(_2445) >= uint(_1727);
    int _2581 = _1743 * _2243;
    int _2583 = _2581 + _2099;
    int _2585 = _2511 >> 31;
    float _2587 = trunc(_2237);
    float _2589 = precise::max(_2587, 0.0);
    uint _2591 = uint(_2589);
    bool _2593 = !_2579;
    int _2595 = _2593 ? 0 : (-1);
    float _2597 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2599 = !_1997;
    int _2601 = _2599 ? _2583 : (-1);
    float _2603 = -_689;
    float _2605 = _2603 + 1.0;
    int _2607 = ~_2235;
    int _2609 = _2607 + _2595;
    int _2611 = _2609 + 1;
    float _2613 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2597);
    int _2615 = _2585 & 3;
    float _2617 = -_707;
    float _2619 = _2617 + 1.0;
    int _2621 = _2601 >> 31;
    int _2623 = _1727 * _2611;
    int _2625 = _2623 + _2013;
    int _2627 = _2511 + _2615;
    float _2629 = -_693;
    float _2631 = _2629 + 1.0;
    int _2633 = _2621 & 3;
    float _2635 = -_261;
    float _2637 = _2635 + 1.0;
    int _2639 = _2627 >> 2;
    float _2641 = -_709;
    float _2643 = _2641 + 1.0;
    int _2645 = _2601 + _2633;
    float _2647 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2613);
    int _2649 = _2523 ? 0 : 1;
    out.m_74.x = _1502;
    out.m_74.y = _1500;
    out.m_74.z = _1504;
    int _2651 = _2639 << 4;
    int _2653 = _2651 + 368;
    int _2655 = _2645 >> 2;
    bool _2657 = _269 > 0.5;
    uint _2659 = uint(int(uint(_2653) >> uint(2)));
    uint _2661 = uint(int(uint(int(_2659)) >> uint(2)));
    int _2663 = int(_2659) & 3;
    float _2665 = (*spvDescriptorSet0.vp_c9)._m0[int(_2661)][_2663];
    int _2667 = int(_2659) + 1;
    uint _2669 = uint(int(uint(_2667) >> uint(2)));
    int _2671 = _2667 & 3;
    float _2673 = (*spvDescriptorSet0.vp_c9)._m0[int(_2669)][_2671];
    int _2675 = ~_2649;
    int _2677 = _2675 + 1;
    int _2679 = _2677 + 1;
    int _2681 = _2679;
    if (!_2529)
    {
        int _2683 = ~_2649;
        int _2685 = _2683 + 1;
        _2681 = _2685;
    }
    int _2687 = _2681;
    int _2689 = _2655 << 4;
    int _2691 = _2689 + 512;
    bool _2693 = _2517 != 3;
    uint _2695 = uint(int(uint(_2691) >> uint(2)));
    uint _2697 = uint(int(uint(int(_2695)) >> uint(2)));
    int _2699 = int(_2695) & 3;
    float _2701 = (*spvDescriptorSet0.vp_c9)._m0[int(_2697)][_2699];
    int _2703 = int(_2695) + 1;
    uint _2705 = uint(int(uint(_2703) >> uint(2)));
    int _2707 = _2703 & 3;
    float _2709 = (*spvDescriptorSet0.vp_c9)._m0[int(_2705)][_2707];
    bool _2711 = uint(_2517) >= 2u;
    float _2713 = -_191;
    int _2715 = _2657 ? as_type<int>(_2713) : as_type<int>(_191);
    int _2717 = _2711 ? 0 : 1;
    bool _2719 = !_2519;
    int _2721 = _2719 ? 0 : 1;
    int _2723 = ~_2717;
    int _2725 = _2723 + 1;
    int _2727 = _2725 + 1;
    bool _2729 = _2517 != 3;
    int _2731 = _2727;
    if (_2693)
    {
        int _2733 = ~_2717;
        int _2735 = _2733 + 1;
        _2731 = _2735;
    }
    int _2737 = _2731;
    int _2739 = _2691 + 8;
    uint _2741 = uint(int(uint(_2739) >> uint(2)));
    uint _2743 = uint(int(uint(int(_2741)) >> uint(2)));
    int _2745 = int(_2741) & 3;
    float _2747 = (*spvDescriptorSet0.vp_c9)._m0[int(_2743)][_2745];
    int _2749 = int(_2741) + 1;
    uint _2751 = uint(int(uint(_2749) >> uint(2)));
    int _2753 = _2749 & 3;
    float _2755 = (*spvDescriptorSet0.vp_c9)._m0[int(_2751)][_2753];
    int _2757 = _2601 & 3;
    bool _2759 = _2757 != 0;
    int _2761 = _2601 & 3;
    bool _2763 = _2761 != 0;
    int _2765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2767 = _2765 != 0;
    int _2769 = int(_2181) + int(_2591);
    int _2771 = _2653 + 8;
    uint _2773 = uint(int(uint(_2771) >> uint(2)));
    uint _2775 = uint(int(uint(int(_2773)) >> uint(2)));
    int _2777 = int(_2773) & 3;
    float _2779 = (*spvDescriptorSet0.vp_c9)._m0[int(_2775)][_2777];
    int _2781 = int(_2773) + 1;
    uint _2783 = uint(int(uint(_2781) >> uint(2)));
    int _2785 = _2781 & 3;
    float _2787 = (*spvDescriptorSet0.vp_c9)._m0[int(_2783)][_2785];
    int _2789 = ~_1743;
    int _2791 = _2789 + 1;
    bool _2793 = !_2767;
    int _2795 = _2793 ? 0 : 1;
    bool _2797 = uint(_2761) > 1u;
    int _2799 = _2791 * _2769;
    int _2801 = _2799 + _2053;
    bool _2803 = !_1991;
    int _2805 = _2803 ? _2625 : (-1);
    int _2807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2809 = _2807 != 0;
    int _2811 = _2759 ? 0 : 1;
    bool _2813 = !_2809;
    int _2815 = _2813 ? 0 : 1;
    bool _2817 = uint(_2801) >= uint(_1743);
    bool _2819 = !_2729;
    int _2821 = _2819 ? 0 : (-1);
    bool _2823 = !_2763;
    int _2825 = _2823 ? 0 : 1;
    bool _2827 = uint(_2761) >= 2u;
    bool _2829 = _2761 != 3;
    int _2831 = ~_2811;
    int _2833 = _2831 + 1;
    int _2835 = _2833 + 1;
    bool _2837 = _2761 != 3;
    bool _2839 = !_2817;
    int _2841 = _2839 ? 0 : (-1);
    int _2843 = _2835;
    if (!_2797)
    {
        int _2845 = ~_2811;
        int _2847 = _2845 + 1;
        _2843 = _2847;
    }
    int _2849 = _2843;
    int _2851 = _2827 ? 0 : 1;
    bool _2853 = !_2829;
    int _2855 = _2853 ? 0 : (-1);
    int _2857 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2859 = _2857 != 0;
    int _2861 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2863 = _2861 != 0;
    int _2865 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2867 = _2865 != 0;
    int _2869 = abs(_2687);
    int _2871 = ~_2769;
    int _2873 = _2871 + _2841;
    int _2875 = _2873 + 1;
    int _2877 = abs(_2849);
    int _2879 = ~_2869;
    int _2881 = _2879 + 1;
    int _2883 = _2881 + 1;
    int _2885 = _1743 * _2875;
    int _2887 = _2885 + _2053;
    int _2889 = _2883 * as_type<int>(_2673);
    bool _2891 = _263 > 0.5;
    int _2893 = ~_2851;
    int _2895 = _2893 + 1;
    int _2897 = _2895 + 1;
    int _2899 = abs(_2825);
    int _2901 = _2897;
    if (_2837)
    {
        int _2903 = ~_2851;
        int _2905 = _2903 + 1;
        _2901 = _2905;
    }
    int _2907 = _2901;
    int _2909 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2911 = _2909 != 0;
    int _2913 = ~_2877;
    int _2915 = _2913 + 1;
    int _2917 = _2915 + 1;
    int _2919 = abs(_2721);
    int _2921 = _2917 * as_type<int>(_2709);
    int _2923 = abs(_2737);
    int _2925 = ~_2919;
    int _2927 = _2925 + 1;
    int _2929 = _2927 + 1;
    int _2931 = ~_2899;
    int _2933 = _2931 + 1;
    int _2935 = _2933 + 1;
    int _2937 = abs(_2907);
    int _2939 = _2929 * as_type<int>(_2665);
    int _2941 = _2939 + _2889;
    int _2943 = ~_2923;
    int _2945 = _2943 + 1;
    int _2947 = _2945 + 1;
    float _2949 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2951 = int(_2949);
    int _2953 = ~_2937;
    int _2955 = _2953 + 1;
    int _2957 = _2955 + 1;
    int _2959 = _2935 * as_type<int>(_2701);
    int _2961 = _2959 + _2921;
    int _2963 = _2947 * as_type<int>(_2779);
    int _2965 = _2963 + _2941;
    int _2967 = _2957 * as_type<int>(_2747);
    int _2969 = _2967 + _2961;
    float _2971 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2973 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2975 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2977 = int(_2975);
    float _2979 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2981 = _2971 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2983 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2985 = _2973 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2987 = _2979 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2989 = float(uint(_2951));
    int _2991 = abs(_2821);
    float _2993 = -_187;
    int _2995 = _2891 ? as_type<int>(_2993) : as_type<int>(_187);
    out.m_76.x = _2981;
    out.m_76.y = _2985;
    out.m_76.z = _2987;
    out.m_76.w = _2983;
    int _2997 = ~_2991;
    int _2999 = _2997 + 1;
    int _3001 = _2999 + 1;
    float _3003 = 1.0 / _2989;
    bool _3005 = _267 > 0.5;
    int _3007 = abs(_2855);
    int _3009 = _3001 * as_type<int>(_2787);
    int _3011 = _3009 + _2965;
    int _3013 = ~_3007;
    int _3015 = _3013 + 1;
    int _3017 = _3015 + 1;
    float _3019 = abs(_1017);
    float _3021 = log2(_3019);
    int _3023 = abs(_2951);
    float _3025 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _3027 = !_1997;
    int _3029 = _3027 ? _2887 : (-1);
    int _3031 = _3017 * as_type<int>(_2755);
    int _3033 = _3031 + _2969;
    int _3035 = abs(_2795);
    float _3037 = _951 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3039 = float(uint(_2977));
    int _3041 = ~_3035;
    int _3043 = _3041 + 1;
    int _3045 = _3043 + 1;
    float _3047 = -_945;
    float _3049 = fma(_3047, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3037);
    int _3051 = abs(_2977);
    float _3053 = _963 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3055 = _3011 * _3045;
    int _3057 = abs(_2815);
    float _3059 = _3021 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3061 = float(uint(_3051));
    int _3063 = _2805 * _3035;
    int _3065 = _3063 + _3055;
    bool _3067 = _265 > 0.5;
    float _3069 = 1.0 / _3039;
    int _3071 = as_type<int>(_3003) + (-2);
    float _3073 = _3025 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3075 = float(uint(_3065));
    float _3077 = _951 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3079 = _951 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3081 = exp2(_3059);
    float _3083 = float(uint(_3023));
    float _3085 = as_type<float>(_3071) * _3075;
    int _3087 = ~_3057;
    int _3089 = _3087 + 1;
    int _3091 = _3089 + 1;
    float _3093 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3095 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3097 = -_945;
    float _3099 = fma(_3097, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3079);
    int _3101 = ~_3051;
    int _3103 = _3101 + 1;
    float _3105 = 1.0 / _3061;
    int _3107 = _3033 * _3091;
    float _3109 = _3093 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3111 = _3095 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3113 = -_945;
    float _3115 = fma(_3113, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3077);
    int _3117 = _3029 * _3057;
    int _3119 = _3117 + _3107;
    int _3121 = abs(_3065);
    float _3123 = _963 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3125 = 1.0 / _3083;
    out.m_78.x = _3109;
    out.m_78.y = _3111;
    out.m_78.z = _3073;
    int _3127 = abs(_3119);
    float _3129 = float(uint(_3121));
    float _3131 = float(uint(_3127));
    float _3133 = trunc(_3085);
    float _3135 = precise::max(_3133, 0.0);
    uint _3137 = uint(_3135);
    int _3139 = as_type<int>(_3105) + (-2);
    float _3141 = as_type<float>(_3139) * _3131;
    int _3143 = as_type<int>(_3069) + (-2);
    float _3145 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3115);
    float _3147 = float(uint(_3119));
    float _3149 = fma(_3081, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3151 = precise::clamp(_3149, 0.0, 1.0);
    int _3153 = ~_2951;
    int _3155 = _3153 + 1;
    float _3157 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3053);
    float _3159 = _973 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3161 = as_type<float>(_3143) * _3147;
    int _3163 = as_type<int>(_3125) + (-2);
    int _3165 = _3155 * int(_3137);
    int _3167 = _3165 + _3065;
    float _3169 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3049);
    float _3171 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3099);
    float _3173 = _963 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3175 = trunc(_3161);
    float _3177 = precise::max(_3175, 0.0);
    uint _3179 = uint(_3177);
    float _3181 = as_type<float>(_3163) * _3129;
    float _3183 = float(uint(_3167));
    float _3185 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3123);
    int _3187 = ~_2977;
    int _3189 = _3187 + 1;
    float _3191 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3173);
    int _3193 = ~_3023;
    int _3195 = _3193 + 1;
    float _3197 = as_type<float>(_3071) * _3183;
    float _3199 = trunc(_3181);
    float _3201 = precise::max(_3199, 0.0);
    uint _3203 = uint(_3201);
    float _3205 = _973 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3207 = _973 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3209 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3159);
    float _3211 = fma(_3151, -2.0, 3.0);
    float _3213 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3205);
    float _3215 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3207);
    float _3217 = trunc(_3141);
    float _3219 = precise::max(_3217, 0.0);
    uint _3221 = uint(_3219);
    int _3223 = _3189 * int(_3179);
    int _3225 = _3223 + _3119;
    bool _3227 = !_2859;
    float _3229 = _3227 ? _191 : as_type<float>(_2715);
    float _3231 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3215);
    bool _3233 = _1017 <= 8000.0;
    bool _3235 = isnan(_1017);
    bool _3237 = _3233 || _3235;
    bool _3239 = isnan(8000.0);
    bool _3241 = _3237 || _3239;
    float _3243 = float(_3241);
    float _3245 = float(uint(_3225));
    int _3247 = _3195 * int(_3203);
    int _3249 = _3247 + _3121;
    float _3251 = trunc(_3197);
    float _3253 = precise::max(_3251, 0.0);
    uint _3255 = uint(_3253);
    float _3257 = as_type<float>(_3143) * _3245;
    float _3259 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3185);
    float _3261 = float(uint(_3249));
    float _3263 = _3151 * _3151;
    float _3265 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3213);
    int _3267 = _3103 * int(_3221);
    int _3269 = _3267 + _3127;
    float _3271 = trunc(_3257);
    float _3273 = precise::max(_3271, 0.0);
    uint _3275 = uint(_3273);
    float _3277 = as_type<float>(_3163) * _3261;
    float _3279 = -_191;
    int _3281 = _3067 ? as_type<int>(_3279) : as_type<int>(_191);
    float _3283 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3157);
    float _3285 = float(uint(_3269));
    float _3287 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3191);
    bool _3289 = !_2911;
    float _3291 = _3289 ? _187 : as_type<float>(_2995);
    float _3293 = _3263 * _3211;
    float _3295 = trunc(_3277);
    float _3297 = precise::max(_3295, 0.0);
    uint _3299 = uint(_3297);
    float _3301 = as_type<float>(_3139) * _3285;
    float _3303 = -_187;
    int _3305 = _3005 ? as_type<int>(_3303) : as_type<int>(_187);
    out.m_80.x = _3259;
    out.m_80.y = _3283;
    out.m_80.z = _3287;
    bool _3307 = !_2863;
    float _3309 = _3307 ? _191 : as_type<float>(_3281);
    float _3311 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _3313 = !_2867;
    float _3315 = _3313 ? _187 : as_type<float>(_3305);
    float _3317 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3209);
    float _3319 = trunc(_3301);
    float _3321 = precise::max(_3319, 0.0);
    uint _3323 = uint(_3321);
    int _3325 = ~_2951;
    int _3327 = _3325 + 1;
    float _3329 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3331 = ~_2977;
    int _3333 = _3331 + 1;
    float _3335 = _3311 * _3145;
    int _3337 = int(_3137) + int(_3255);
    float _3339 = fma(_3329, _3259, _3335);
    int _3341 = int(_3179) + int(_3275);
    int _3343 = _3327 * _3337;
    int _3345 = _3343 + _3065;
    int _3347 = ~_3023;
    int _3349 = _3347 + 1;
    float _3351 = _3317 + _3339;
    int _3353 = ~_3051;
    int _3355 = _3353 + 1;
    int _3357 = _3333 * _3341;
    int _3359 = _3357 + _3119;
    int _3361 = int(_3203) + int(_3299);
    int _3363 = int(_3221) + int(_3323);
    int _3365 = _3349 * _3361;
    int _3367 = _3365 + _3121;
    bool _3369 = uint(_3345) >= uint(_2951);
    bool _3371 = uint(_3359) >= uint(_2977);
    int _3373 = _3355 * _3363;
    int _3375 = _3373 + _3127;
    bool _3377 = !_3369;
    int _3379 = _3377 ? 0 : (-1);
    float _3381 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3383 = !_3371;
    int _3385 = _3383 ? 0 : (-1);
    bool _3387 = uint(_3367) >= uint(_3023);
    int _3389 = ~_3337;
    int _3391 = _3389 + _3379;
    int _3393 = _3391 + 1;
    int _3395 = _3065 ^ _2951;
    float _3397 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3399 = uint(_3375) >= uint(_3051);
    int _3401 = _2951 * _3393;
    int _3403 = _3401 + _3065;
    bool _3405 = !_3387;
    int _3407 = _3405 ? 0 : (-1);
    uint _3409 = uint(int(uint(_3395) >> uint(31)));
    bool _3411 = _2951 == 0;
    float _3413 = _3381 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3415 = _2951 == 0;
    int _3417 = ~_3341;
    int _3419 = _3417 + _3385;
    int _3421 = _3419 + 1;
    float _3423 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3425 = ~_3407;
    int _3427 = _3361 + _3425;
    int _3429 = _3427 + 1;
    int _3431 = ~int(_3409);
    int _3433 = _3431 + 1;
    int _3435 = _3119 ^ _2977;
    bool _3437 = _2977 == 0;
    bool _3439 = _2977 == 0;
    int _3441 = _2977 * _3421;
    int _3443 = _3441 + _3119;
    bool _3445 = !_3399;
    int _3447 = _3445 ? 0 : (-1);
    int _3449 = _3429 ^ _3433;
    uint _3451 = uint(int(uint(_3435) >> uint(31)));
    float _3453 = fma(_3311, _3311, 1.0);
    bool _3455 = !_3411;
    int _3457 = _3455 ? _3403 : (-1);
    int _3459 = ~_3447;
    int _3461 = _3363 + _3459;
    int _3463 = _3461 + 1;
    float _3465 = _3423 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3467 = ~_3433;
    int _3469 = _3467 + _3449;
    int _3471 = _3469 + 1;
    float _3473 = _3291 + 0.5;
    int _3475 = ~int(_3451);
    int _3477 = _3475 + 1;
    float _3479 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _3481 = !_3437;
    int _3483 = _3481 ? _3443 : (-1);
    float _3485 = float(_3457);
    int _3487 = _3463 ^ _3477;
    float _3489 = float(_3483);
    float _3491 = fma(_3413, _3485, _357);
    int _3493 = ~_3477;
    int _3495 = _3493 + _3487;
    int _3497 = _3495 + 1;
    float _3499 = _3397 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3501 = rsqrt(_3453);
    float _3503 = fma(_3413, _3473, _3491);
    bool _3505 = !_3439;
    int _3507 = _3505 ? _3497 : (-1);
    float _3509 = fma(_3465, _3489, _713);
    float _3511 = _3315 + 0.5;
    bool _3513 = !_3415;
    int _3515 = _3513 ? _3471 : (-1);
    float _3517 = float(_3507);
    float _3519 = _3479 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3521 = fma(_3465, _3511, _3509);
    float _3523 = float(_3515);
    float _3525 = -_715;
    float _3527 = fma(_3519, _3517, _3525);
    float _3529 = _3229 + (-0.5);
    float _3531 = -_353;
    float _3533 = fma(_3499, _3523, _3531);
    float _3535 = _3309 + (-0.5);
    float _3537 = -_3519;
    float _3539 = fma(_3537, _3529, _3527);
    float _3541 = -_2605;
    float _3543 = fma(_3315, _3541, _3521);
    float _3545 = _2503 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3547 = -_3293;
    float _3549 = _3547 + 1.0;
    float _3551 = _3311 * _3501;
    float _3553 = _3311 * _3169;
    float _3555 = -_3499;
    float _3557 = fma(_3555, _3535, _3533);
    float _3559 = fma(_3549, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3293);
    float _3561 = exp2(_3545);
    float _3563 = -_3265;
    float _3565 = _3551 * _3563;
    float _3567 = fma(_3329, _3283, _3553);
    float _3569 = _3243 * _3559;
    float _3571 = fma(_3229, _2631, _3539);
    float _3573 = fma(_3501, _3169, _3565);
    float _3575 = -_2619;
    float _3577 = fma(_3291, _3575, _3503);
    float _3579 = _3265 + _3567;
    float _3581 = _3569 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3583 = -_3317;
    float _3585 = _3551 * _3583;
    float _3587 = _3569;
    if (!_1604)
    {
        _1646 = 1.0;
    }
    float _3589 = _1646;
    float _3591 = _2637 * _3581;
    float _3593 = precise::clamp(_3591, 0.0, 1.0);
    float _3595 = _3589;
    if (_1604)
    {
        bool _3597 = _1704 >= _1670;
        bool _3599 = isnan(_1704);
        bool _3601 = _3597 || _3599;
        bool _3603 = isnan(_1670);
        bool _3605 = _3601 || _3603;
        float _3607 = float(_3605);
        _3595 = _3607;
    }
    float _3609 = _3595;
    float _3611 = fma(_3309, _2643, _3557);
    float _3613 = _3311 * _3171;
    float _3615 = -_3561;
    float _3617 = _3615 + 1.0;
    float _3619 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2647);
    float _3621 = _3609 * _2317;
    float _3623 = -_3593;
    float _3625 = fma(_3623, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3627 = _3617 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3629 = fma(_3501, _3145, _3585);
    float _3631 = -_3231;
    float _3633 = _3551 * _3631;
    float _3635 = fma(_3329, _3287, _3613);
    float _3637 = _3627 * _1706;
    float _3639 = _3619 + _1608;
    float _3641 = -_3621;
    float _3643 = fma(_3641, _3625, 1.0);
    float _3645 = precise::clamp(_3643, 0.0, 1.0);
    float _3647 = -_3627;
    float _3649 = _3647 + 1.0;
    float _3651 = _1717 * _3637;
    float _3653 = _2569 * _3637;
    float _3655 = fma(_3501, _3171, _3633);
    float _3657 = _3231 + _3635;
    float _3659 = _3639 * 0.5;
    float _3661 = fma(_2565, _3651, _1711);
    float _3663 = fma(_2567, _3651, _1713);
    float _3665 = _3645 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3667 = _1717 * _3649;
    float _3669 = fma(_1717, _3653, _1715);
    out.m_82.x = _3629;
    out.m_82.y = _3573;
    out.m_82.z = _3655;
    bool _3671 = _2339 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3673 = isnan(_2339);
    bool _3675 = _3671 || _3673;
    bool _3677 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3679 = _3675 || _3677;
    out.m_84.x = _3577;
    out.m_84.y = _3611;
    out.m_84.z = _3543;
    out.m_84.w = _3571;
    out.gl_Position.x = _1638;
    out.gl_Position.y = _1666;
    out.gl_Position.z = _3619;
    out.gl_Position.w = _1608;
    out.m_86.z = _3659;
    out.m_86.w = _1608;
    float _3681 = _3649;
    float _3683 = _3621;
    float _3685 = _3645;
    float _3687 = _3651;
    if (!_3679)
    {
        _3681 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3689 = _3681;
    out.m_88.x = _2573;
    out.m_88.y = _2575;
    out.m_88.z = _2577;
    float _3691 = _3689;
    float _3693 = _3689;
    if (!_3679)
    {
        _3683 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3695 = _3683;
    float _3697 = _3695;
    float _3699 = _3695;
    if (!_3679)
    {
        _2253 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3701 = _2253;
    out.m_90.x = _3665;
    float _3703 = _3701;
    float _3705 = _3701;
    if (!_3679)
    {
        _3587 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3707 = _3587;
    float _3709 = _3707;
    float _3711 = _3707;
    if (!_3679)
    {
        _3685 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3713 = _3685;
    out.m_92.x = _3661;
    out.m_92.y = _3663;
    out.m_92.z = _3669;
    out.m_92.w = _3667;
    float _3715 = _3713;
    float _3717 = _3713;
    if (!_3679)
    {
        _3687 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3719 = _3687;
    out.m_94.x = _3351;
    out.m_94.y = _3579;
    out.m_94.z = _3657;
    bool _3721 = !_3679;
    float _3723 = _3719;
    float _3725 = _3719;
    if (!_3721)
    {
        bool _3727 = _2339 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3729 = isnan(_2339);
        bool _3731 = _3727 || _3729;
        bool _3733 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3735 = _3731 || _3733;
        if (!_3735)
        {
            float _3737 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3739 = _2339 + _3737;
            float _3741 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3743 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3741;
            float _3745 = 1.0 / _3743;
            float _3747 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3749 = _3747 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3751 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3753 = _3751 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3755 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3757 = _3755 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3759 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3761 = _3759 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3763 = _3739 * _3745;
            float _3765 = precise::clamp(_3763, 0.0, 1.0);
            float _3767 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3769 = _3767 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3771 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3773 = _3771 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3775 = fma(_3765, _3749, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3777 = fma(_3765, _3769, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3779 = fma(_3765, _3773, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3781 = fma(_3765, _3753, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3783 = fma(_3765, _3757, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3785 = fma(_3765, _3761, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3699 = _3779;
            _3717 = _3783;
            _3693 = _3777;
            _3711 = _3781;
            _3705 = _3775;
            _3725 = _3785;
            _3787 = true;
        }
        else
        {
            bool _3789 = _2339 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3791 = isnan(_2339);
            bool _3793 = _3789 || _3791;
            bool _3795 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3797 = _3793 || _3795;
            if (!_3797)
            {
                _3691 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3799 = _3691;
            _3693 = _3799;
            if (!_3797)
            {
                _3697 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3801 = _3697;
            _3699 = _3801;
            if (!_3797)
            {
                _3703 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3803 = _3703;
            _3705 = _3803;
            if (!_3797)
            {
                _3709 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3805 = _3709;
            _3711 = _3805;
            if (!_3797)
            {
                _3715 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3807 = _3715;
            _3717 = _3807;
            if (!_3797)
            {
                _3723 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3809 = _3723;
            bool _3811 = !_3797;
            _3725 = _3809;
            if (!_3811)
            {
                bool _3813 = _2339 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3815 = isnan(_2339);
                bool _3817 = _3813 || _3815;
                bool _3819 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3821 = _3817 || _3819;
                if (!_3821)
                {
                    float _3823 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3825 = _2339 + _3823;
                    float _3827 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3829 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3827;
                    float _3831 = 1.0 / _3829;
                    float _3833 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3835 = _3833 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3837 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3839 = _3837 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3841 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3843 = _3841 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3845 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3847 = _3845 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3849 = _3825 * _3831;
                    float _3851 = precise::clamp(_3849, 0.0, 1.0);
                    float _3853 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3855 = _3853 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3857 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3859 = _3857 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3861 = fma(_3851, _3835, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3863 = fma(_3851, _3855, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3865 = fma(_3851, _3859, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3867 = fma(_3851, _3839, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3869 = fma(_3851, _3843, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3871 = fma(_3851, _3847, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3699 = _3865;
                    _3717 = _3869;
                    _3693 = _3863;
                    _3711 = _3867;
                    _3705 = _3861;
                    _3725 = _3871;
                    _3787 = true;
                }
                else
                {
                    _3699 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3717 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3693 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3711 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3705 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3725 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3787 = false;
    float _3873 = _3699;
    float _3875 = _3717;
    float _3877 = _3693;
    float _3879 = _3711;
    float _3881 = _3705;
    float _3883 = _3725;
    float _3885 = fma(_3579, -0.5, 0.5);
    float _3887 = precise::clamp(_3885, 0.0, 1.0);
    float _3889 = -_3873;
    float _3891 = _3889 + _3875;
    float _3893 = -_3877;
    float _3895 = _3893 + _3879;
    float _3897 = -_3881;
    float _3899 = _3897 + _3883;
    bool _3901 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3903 = fma(_3887, _3891, _3873);
    float _3905 = fma(_3887, _3895, _3877);
    float _3907 = fma(_3887, _3899, _3881);
    float _3909 = _3903 * 0.586610972881317138671875;
    out.m_96.x = 0.0;
    float _3911 = fma(_3905, 0.298911988735198974609375, _3909);
    float _3913 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3915 = fma(_3907, 0.114477999508380889892578125, _3911);
    out.m_61.x = _3913;
    float _3917 = -_3915;
    float _3919 = _3905 + _3917;
    float _3921 = -_3915;
    float _3923 = _3903 + _3921;
    float _3925 = -_3915;
    float _3927 = _3907 + _3925;
    float _3929 = fma(_3919, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3915);
    float _3931 = fma(_3923, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3915);
    float _3933 = fma(_3927, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3915);
    out.m_98.x = _3929;
    out.m_98.y = _3931;
    out.m_98.z = _3933;
    if (!_3901)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3935 = -_1500;
    float _3937 = _3935 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3939 = -_1502;
    float _3941 = _3939 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3943 = -_1504;
    float _3945 = _3943 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3947 = _3937 * _3937;
    float _3949 = fma(_3941, _3941, _3947);
    float _3951 = fma(_3945, _3945, _3949);
    float _3953 = sqrt(_3951);
    float _3955 = rsqrt(_3951);
    float _3957 = -_3953;
    float _3959 = _3957 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3961 = _3959 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3963 = precise::clamp(_3961, 0.0, 1.0);
    float _3965 = _3941 * _3955;
    float _3967 = _3937 * _3955;
    float _3969 = abs(_3963);
    float _3971 = log2(_3969);
    float _3973 = _3945 * _3955;
    float _3975 = _3965 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3977 = _3579 * _3967;
    float _3979 = -_3967;
    float _3981 = -_3975;
    float _3983 = fma(_3979, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3981);
    float _3985 = fma(_3351, _3965, _3977);
    float _3987 = -_3973;
    float _3989 = fma(_3987, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3983);
    float _3991 = fma(_3657, _3973, _3985);
    float _3993 = precise::clamp(_3991, 0.0, 1.0);
    float _3995 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3997 = _3989 + _3995;
    float _3999 = _3971 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4001 = _3997 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4003 = precise::clamp(_4001, 0.0, 1.0);
    float _4005 = exp2(_3999);
    float _4007 = _4005 * _4003;
    float _4009 = _3993 * _4007;
    float _4011 = _4009 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4013 = _4009 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4015 = _4009 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_96.x = _4011;
    out.m_96.y = _4013;
    out.m_96.z = _4015;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

