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
    texture2d_array<float> vp_t_tcb_14 [[id(8)]];
    sampler vp_t_tcb_14Smplr [[id(9)]];
    texture2d_array<float> vp_t_tcb_16 [[id(10)]];
    sampler vp_t_tcb_16Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_32 [[id(12)]];
    sampler vp_t_tcb_32Smplr [[id(13)]];
    texture3d<float> vp_t_tcb_30 [[id(14)]];
    sampler vp_t_tcb_30Smplr [[id(15)]];
    texture2d<float> vp_t_tcb_1C [[id(16)]];
    sampler vp_t_tcb_1CSmplr [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_14Smplr_w [[id(19)]];
    sampler vp_t_tcb_32Smplr_w [[id(20)]];
    sampler vp_t_tcb_30Smplr_w [[id(21)]];
    sampler vp_t_tcb_1CSmplr_w [[id(22)]];
    constant dm_border_t* dm_border [[id(23)]];
};

struct main0_out
{
    float4 m_74 [[user(locn0)]];
    float4 m_72 [[user(locn1)]];
    float4 m_76 [[user(locn2)]];
    float4 m_78 [[user(locn3)]];
    float4 m_88 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_84 [[user(locn6)]];
    float4 m_86 [[user(locn7)]];
    float4 m_82 [[user(locn8)]];
    float4 m_80 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_65 [[attribute(2)]];
    float4 m_56 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_63 [[attribute(5)]];
    float4 m_70 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2767 = false;
    bool _299 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_56.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    float _117 = _115;
    if (!_111)
    {
        out.m_59.x = 0.0;
    }
    int _119 = 0;
    if (!_111)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3072 = as_type<float>(_123);
        out.gl_Position.z = _3072;
    }
    if (!_111)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _127 = in.m_61.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = 0.0;
    if (_137)
    {
        float _145 = float(_107);
        _143 = _145;
    }
    float _147 = _143;
    bool _149 = _141 >= _147;
    bool _151 = !_137;
    bool _153 = _149 || _151;
    if (_153)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _117;
    if (_153)
    {
        out.m_59.x = 0.0;
    }
    if (_153)
    {
        float _157 = _155 * 5.0;
        _125 = as_type<int>(_157);
    }
    int _159 = _125;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3140 = as_type<float>(_159);
        out.gl_Position.z = _3140;
    }
    if (_153)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _161 = in.m_63.x;
    float _163 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _165 = _141 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _167 = in.m_65.x;
    float _169 = in.m_65.y;
    float _171 = in.m_65.z;
    float _173 = _165 * _163;
    int _175 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _177 = _175 != 0;
    float _179 = fma(_161, (*spvDescriptorSet0.vp_c9)._m0[20].x, _173);
    int _181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _183 = _181 != 0;
    int _185 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _187 = _185 != 0;
    float _189 = floor(_179);
    float _191 = _179 * 6.283185482025146484375;
    float _193 = _169 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _195 = _169 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _197 = _169 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _199 = _191 * 0.15915493667125701904296875;
    bool _201 = !_183;
    int _203 = _201 ? 0 : 1;
    float _205 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].x, _193);
    float _207 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].x, _195);
    float _209 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].x, _197);
    bool _211 = !_187;
    int _213 = _211 ? 0 : 1;
    float _215 = _199 * 6.283185482025146484375;
    float _217 = cos(_215);
    float _219 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].z, _205);
    float _221 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].z, _207);
    int _223 = abs(_213);
    float _225 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].z, _209);
    float _227 = -_189;
    float _229 = _179 + _227;
    int _231 = abs(_203);
    bool _233 = !_177;
    int _235 = _233 ? 0 : 1;
    bool _237 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _239 = abs(_235);
    float _241 = float(_231);
    float _243 = -_229;
    float _245 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _247 = fma(_217, 0.5, 0.5);
    bool _249 = _229 < 0.5;
    float _251 = float(_249);
    float _253 = abs(_245);
    float _255 = _241 * _253;
    float _257 = -_247;
    float _259 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _261 = float(_239);
    float _263 = -_251;
    float _265 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _267 = float(_223);
    float _269 = fma(_261, _259, _255);
    float _271 = abs(_265);
    float _273 = fma(_267, _271, _269);
    bool _275 = !_237;
    float _277 = _219;
    float _295;
    float _297;
    if (!_275)
    {
        float _279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _281 = _161 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _283 = float(_107);
        float _285 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _287 = _285 * _279;
        float _289 = floor(_287);
        float _291 = -_289;
        float _293 = _287 + _291;
        _295 = _293;
        _297 = _283;
        _299 = true;
    }
    else
    {
        float _301 = float(_107);
        float _303 = 1.0 / _301;
        float _305 = _141 * _303;
        _295 = _305;
        _297 = _301;
    }
    _299 = false;
    float _307 = _295;
    float _309 = _297;
    float _311 = in.m_56.x;
    float _313 = in.m_56.y;
    float _315 = in.m_56.z;
    float _317 = _313 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _319 = _313 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _321 = fma(_311, (*spvDescriptorSet0.vp_c10)._m0[4].x, _317);
    float _323 = fma(_311, (*spvDescriptorSet0.vp_c10)._m0[6].x, _319);
    float _325 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[4].z, _321);
    float _327 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[6].z, _323);
    float _329 = _325 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _331 = _327 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _333 = fma(_329, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _335 = fma(_331, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _337 = floor(_333);
    float _339 = floor(_335);
    float _341 = -_337;
    float _343 = _333 + _341;
    float _345 = -_339;
    float _347 = _335 + _345;
    float2 _3439 = float2(_343, _347);
    float _349 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3439, float2(0.0), isnan(_3439)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3439, float2(0.0), isnan(_3439)), level(0.0)).x;
    float _351 = _313 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _353 = as_type<float>(int(gl_VertexIndex));
    bool _355 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _357 = isnan(_307);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _363 = _359 || _361;
    float _365 = float(_363);
    float _367 = fma(_311, (*spvDescriptorSet0.vp_c10)._m0[5].x, _351);
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _375 = _307 + _373;
    float _377 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[5].z, _367);
    float _379 = 1.0 / _371;
    float _381 = _377 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _383 = _381 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _385 = fma(_329, (*spvDescriptorSet0.vp_c8)._m0[11].x, _383);
    float _387 = fma(_331, (*spvDescriptorSet0.vp_c8)._m0[11].z, _385);
    bool _389 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _391 = isnan(_307);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    float _401 = _375 * _379;
    float _403 = _381 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _405 = _387 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _407 = in.m_70.x;
    float _409 = in.m_70.y;
    float _411 = fma(_329, (*spvDescriptorSet0.vp_c8)._m0[10].x, _403);
    float _413 = 1.0 / _405;
    int _415 = as_type<int>(_353) & 1;
    bool _417 = _415 != 0;
    int _419 = as_type<int>(_353) & 2;
    bool _421 = _419 != 0;
    float _423 = fma(_331, (*spvDescriptorSet0.vp_c8)._m0[10].z, _411);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _425;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _429;
    bool _433 = !_421;
    float _435 = _433 ? (-0.5) : 0.5;
    float _437 = _423 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _439 = -_365;
    float _441 = _439 + 1.0;
    float _443 = fma(_427, _401, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _445 = fma(_431, _401, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _447 = _437 + _405;
    float _449 = _399 * _441;
    float _451 = -_399;
    float _453 = _451 + 1.0;
    bool _455 = !_417;
    float _457 = _455 ? (-0.5) : 0.5;
    float _459 = _447 * _413;
    float _461 = _459 * 0.5;
    float _463 = _443 * _449;
    float _465 = _445 * _449;
    float _467 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _469 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _471 = fma(_461, (*spvDescriptorSet0.vp_c8)._m0[30].w, _469);
    float _473 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[143].x, _463);
    float _475 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[143].y, _465);
    float _477 = _381 + _467;
    float _479 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _481 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[144].x, _473);
    float _483 = 1.0 / _471;
    float _485 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[144].y, _475);
    float _487 = _477 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _489 = _477 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _491 = _481 * _407;
    float _493 = _485 * _409;
    float _495 = fma(_329, (*spvDescriptorSet0.vp_c15)._m0[126].x, _487);
    float _497 = fma(_329, (*spvDescriptorSet0.vp_c15)._m0[127].x, _489);
    float _499 = _273 * _491;
    float _501 = _273 * _493;
    float _503 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _435);
    float _505 = fma(_331, (*spvDescriptorSet0.vp_c15)._m0[126].z, _495);
    float _507 = fma(_331, (*spvDescriptorSet0.vp_c15)._m0[127].z, _497);
    float _509 = _501 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _511 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _457);
    float _513 = _499 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _515 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _517 = _483 * _515;
    float _519 = _509 * _503;
    float _521 = _505 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _523 = _507 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _525 = _513 * _511;
    bool _527 = _517 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _529 = _519 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _531 = _517 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _533 = trunc(_521);
    int _535 = int(_533);
    float _537 = _519 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _539 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[26].x, _529);
    bool _541 = !_527;
    int _543 = _541 ? 0 : 1;
    float _545 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[24].x, _537);
    float _547 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[26].z, _539);
    float _549 = trunc(_523);
    int _551 = int(_549);
    float _553 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[24].z, _545);
    int _555 = 2;
    int _557 = as_type<int>(_519);
    int _559 = as_type<int>(_525);
    float _561 = _477;
    float _563 = _331;
    if (!_527)
    {
        _555 = 1;
    }
    int _565 = _555;
    float _567 = _547 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _569 = _565;
    if (!_531)
    {
        _569 = _543;
    }
    int _571 = _569;
    float _573 = _553 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _575 = _331 + _567;
    int _577 = _571 << 6;
    float _579 = _329 + _573;
    int _581 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _583 = _535 + _581;
    int _585 = _583 + 1;
    float _587 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _589 = _575 + _587;
    int _591 = _577 + 56;
    uint _594 = uint(int(uint(_591) >> uint(2)));
    uint _596 = uint(int(uint(int(_594)) >> uint(2)));
    int _598 = int(_594) & 3;
    float _600 = (*spvDescriptorSet0.vp_c15)._m0[int(_596)][_598];
    int _602 = int(_594) + 1;
    uint _604 = uint(int(uint(_602) >> uint(2)));
    int _606 = _602 & 3;
    float _608 = (*spvDescriptorSet0.vp_c15)._m0[int(_604)][_606];
    float _610 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _612 = _579 + _610;
    bool _614 = _585 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _616 = _589 * _589;
    int _618 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _620 = _551 + _618;
    int _622 = _620 + 1;
    float _624 = fma(_612, _612, _616);
    int _626 = _577 + 48;
    uint _628 = uint(int(uint(_626) >> uint(2)));
    uint _630 = uint(int(uint(int(_628)) >> uint(2)));
    int _632 = int(_628) & 3;
    float _634 = (*spvDescriptorSet0.vp_c15)._m0[int(_630)][_632];
    int _636 = int(_628) + 1;
    uint _638 = uint(int(uint(_636) >> uint(2)));
    int _640 = _636 & 3;
    float _642 = (*spvDescriptorSet0.vp_c15)._m0[int(_638)][_640];
    int _644 = _585 | _622;
    float _646 = sqrt(_624);
    bool _648 = _644 < 0;
    bool _650 = _648 || _614;
    float _652 = _519 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _654 = _577 + 64;
    uint _656 = uint(int(uint(_654) >> uint(2)));
    uint _658 = uint(int(uint(int(_656)) >> uint(2)));
    int _660 = int(_656) & 3;
    float _662 = (*spvDescriptorSet0.vp_c15)._m0[int(_658)][_660];
    int _664 = int(_656) + 1;
    uint _666 = uint(int(uint(_664) >> uint(2)));
    int _668 = _664 & 3;
    float _670 = (*spvDescriptorSet0.vp_c15)._m0[int(_666)][_668];
    bool _672 = _622 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _674 = _672 || _650;
    float _676 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[25].x, _652);
    float _678 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[25].z, _676);
    int _680 = _577 + 72;
    uint _682 = uint(int(uint(_680) >> uint(2)));
    uint _684 = uint(int(uint(int(_682)) >> uint(2)));
    int _686 = int(_682) & 3;
    float _688 = (*spvDescriptorSet0.vp_c15)._m0[int(_684)][_686];
    int _690 = int(_682) + 1;
    uint _692 = uint(int(uint(_690) >> uint(2)));
    int _694 = _690 & 3;
    float _696 = (*spvDescriptorSet0.vp_c15)._m0[int(_692)][_694];
    float _698 = _678 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _700 = _646 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _702 = _622;
    float _704 = _579;
    float _706 = _575;
    float _708 = as_type<float>(_571);
    if (!_674)
    {
        int _710 = _622 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _712 = _710 + _585;
        _557 = _712;
    }
    int _714 = _557;
    int _716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _718 = _716 != 0;
    int _720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _722 = _720 != 0;
    int _724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _726 = _724 != 0;
    int _728 = _577 + 96;
    uint _730 = uint(int(uint(_728) >> uint(2)));
    uint _732 = uint(int(uint(int(_730)) >> uint(2)));
    int _734 = int(_730) & 3;
    float _736 = (*spvDescriptorSet0.vp_c15)._m0[int(_732)][_734];
    int _738 = int(_730) + 1;
    uint _740 = uint(int(uint(_738) >> uint(2)));
    int _742 = _738 & 3;
    float _744 = (*spvDescriptorSet0.vp_c15)._m0[int(_740)][_742];
    float _746 = _381 + _698;
    if (!_674)
    {
        int _748 = _714 << 2;
        _702 = _748;
    }
    int _750 = _702;
    int _752 = _750;
    if (!_674)
    {
        uint _754 = uint(int(uint(_714) >> uint(2)));
        _559 = int(_754);
    }
    int _756 = _559;
    float _758 = as_type<float>(_756);
    if (!_674)
    {
        int _760 = 12 & _750;
        _752 = _760;
    }
    int _762 = _752;
    int _764 = _577 + 104;
    uint _766 = uint(int(uint(_764) >> uint(2)));
    uint _768 = uint(int(uint(int(_766)) >> uint(2)));
    int _770 = int(_766) & 3;
    float _772 = (*spvDescriptorSet0.vp_c15)._m0[int(_768)][_770];
    int _774 = int(_766) + 1;
    uint _776 = uint(int(uint(_774) >> uint(2)));
    int _778 = _774 & 3;
    float _780 = (*spvDescriptorSet0.vp_c15)._m0[int(_776)][_778];
    bool _782 = !_722;
    int _784 = _782 ? 0 : 1;
    if (!_674)
    {
        int _786 = _756 << 4;
        int _788 = _786 + _762;
        _758 = as_type<float>(_788);
    }
    float _790 = _758;
    bool _792 = !_718;
    int _794 = _792 ? 0 : 1;
    bool _796 = !_726;
    int _798 = _796 ? 0 : 1;
    float _800 = 0.0;
    if (!_700)
    {
        _800 = _746;
    }
    float _802 = _800;
    bool _804 = !_700;
    float _806 = _802;
    float _808 = _744;
    float _810 = _600;
    float _812 = _780;
    if (!_804)
    {
        float _814 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _816 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _818 = _646 + _816;
        float _820 = rsqrt(_624);
        float _822 = _818 * _814;
        float _824 = _746 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _826 = _822 * 0.15915493667125701904296875;
        float _828 = _826 * 6.283185482025146484375;
        float _830 = cos(_828);
        float _832 = _826 * 6.283185482025146484375;
        float _834 = sin(_832);
        float _836 = _830 + (-1.0);
        float _838 = _836 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _840 = fma(_834, _824, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _842 = fma(_746, _830, _838);
        float _844 = _820 * _840;
        float _846 = fma(_612, _844, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _848 = fma(_589, _844, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _806 = _842;
        _704 = _846;
        _706 = _848;
    }
    float _850 = _806;
    float _852 = _704;
    float _854 = _706;
    float _856 = -_381;
    float _858 = _856 + _850;
    int _860 = _577 + 80;
    uint _862 = uint(int(uint(_860) >> uint(2)));
    uint _864 = uint(int(uint(int(_862)) >> uint(2)));
    int _866 = int(_862) & 3;
    float _868 = (*spvDescriptorSet0.vp_c15)._m0[int(_864)][_866];
    int _870 = int(_862) + 1;
    uint _872 = uint(int(uint(_870) >> uint(2)));
    int _874 = _870 & 3;
    float _876 = (*spvDescriptorSet0.vp_c15)._m0[int(_872)][_874];
    float _878 = -_329;
    float _880 = _878 + _852;
    float _882 = -_331;
    float _884 = _882 + _854;
    float _886 = _858 * _858;
    float _888 = _477 * _744;
    float _890 = _477 * _670;
    float _892 = _852;
    float _894 = _850;
    float _896 = _854;
    float _898 = _858;
    if (!_674)
    {
        float _900 = floor(_523);
        _808 = _900;
    }
    float _902 = _808;
    float _904 = fma(_880, _880, _886);
    int _906 = _577 + 88;
    uint _908 = uint(int(uint(_906) >> uint(2)));
    uint _910 = uint(int(uint(int(_908)) >> uint(2)));
    int _912 = int(_908) & 3;
    float _914 = (*spvDescriptorSet0.vp_c15)._m0[int(_910)][_912];
    int _916 = int(_908) + 1;
    uint _918 = uint(int(uint(_916) >> uint(2)));
    int _920 = _916 & 3;
    float _922 = (*spvDescriptorSet0.vp_c15)._m0[int(_918)][_920];
    float _924 = fma(_329, _736, _888);
    float _926 = fma(_884, _884, _904);
    bool _928 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _930 = isnan(0.5);
    bool _932 = _928 || _930;
    bool _934 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _936 = _932 || _934;
    float _938 = fma(_331, _772, _924);
    float _940 = _477 * _642;
    float _942 = sqrt(_926);
    float _944 = _790;
    if (!_674)
    {
        int _946 = as_type<int>(_790) + 400;
        uint _948 = uint(int(uint(_946) >> uint(2)));
        uint _950 = uint(int(uint(int(_948)) >> uint(2)));
        int _952 = int(_948) & 3;
        float _954 = (*spvDescriptorSet0.vp_c15)._m0[int(_950)][_952];
        _944 = _954;
    }
    float _956 = _944;
    float _958 = _938 + _780;
    float _960 = fma(_329, _662, _890);
    float _962 = fma(_329, _634, _940);
    float _964 = fma(_331, _688, _960);
    float _966 = _904;
    float _968 = _958;
    if (!_674)
    {
        float _970 = floor(_521);
        _966 = _970;
    }
    float _972 = _966;
    float _974 = fma(_331, _600, _962);
    float _976 = _964 + _696;
    float _978 = _974 + _608;
    bool _980 = _942 > 0.0;
    float _982 = 1.0 / _958;
    bool _984 = !_980;
    if (!_984)
    {
        float _986 = _221 * _221;
        float _988 = fma(_219, _219, _986);
        float _990 = fma(_225, _225, _988);
        float _992 = rsqrt(_926);
        float _994 = sqrt(_990);
        float _996 = _880 * _992;
        float _998 = _858 * _992;
        float _1000 = _884 * _992;
        bool _1002 = _994 > 0.0;
        bool _1004 = !_1002;
        _898 = _998;
        _810 = _992;
        if (!_1004)
        {
            float _1006 = rsqrt(_990);
            float _1008 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1010 = _221 * _1006;
            float _1012 = _219 * _1006;
            float _1014 = _225 * _1006;
            float _1016 = _998 * _1010;
            float _1018 = fma(_996, _1012, _1016);
            float _1020 = _1008 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1022 = fma(_1000, _1014, _1018);
            float _1024 = _1022 * _1020;
            float _1026 = fma(_219, _1024, _852);
            float _1028 = fma(_221, _1024, _850);
            float _1030 = fma(_225, _1024, _854);
            _892 = _1026;
            _894 = _1028;
            _896 = _1030;
            _810 = _1024;
        }
    }
    float _1032 = _892;
    float _1034 = _894;
    float _1036 = _896;
    float _1038 = _898;
    float _1040 = _810;
    float _1042 = _1040;
    float _1044 = _1038;
    float _1046 = _1034;
    if (_936)
    {
        _277 = _1032;
    }
    float _1048 = _277;
    float _1050 = _1048;
    if (_936)
    {
        _968 = _1034;
    }
    float _1052 = _968;
    float _1054 = _1052;
    if (_936)
    {
        _812 = _1036;
    }
    float _1056 = _812;
    float _1058 = _1056;
    if (!_936)
    {
        float _1060 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1062 = _381 + _1060;
        float _1064 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1066 = _329 + _1064;
        float _1068 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1070 = -_329;
        float _1072 = _1070 + _1032;
        float _1074 = _1062 * _1062;
        float _1076 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1078 = _331 + _1076;
        float _1080 = -_331;
        float _1082 = _1080 + _1036;
        float _1084 = fma(_1066, _1066, _1074);
        float _1086 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1088 = fma(_1078, _1078, _1084);
        float _1090 = sqrt(_1088);
        float _1092 = _1068 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1094 = precise::min(_1090, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1096 = _1094 * _1086;
        float _1098 = -_381;
        float _1100 = _1098 + _1034;
        float _1102 = _1092 * _1096;
        float _1104 = fma(_1100, _1102, _381);
        float _1106 = fma(_1072, _1102, _329);
        float _1108 = fma(_1082, _1102, _331);
        _1054 = _1104;
        _1050 = _1106;
        _1058 = _1108;
        _1042 = _1090;
    }
    float _1110 = _1054;
    float _1112 = _1050;
    float _1114 = _1058;
    float _1116 = _1042;
    float _1118 = _1110 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1120 = _978 * _982;
    float _1122 = _1110 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1124 = _1110 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1126 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1118);
    float _1128 = _1116;
    if (!_674)
    {
        float _1130 = rint(_956);
        float _1132 = precise::max(_1130, 0.0);
        uint _1134 = uint(_1132);
        uint _1136 = clamp(_1134, 0u, 65535u);
        _1128 = as_type<float>(_1136);
    }
    float _1138 = _1128;
    float _1140 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1122);
    bool _1142 = _1120 >= 0.0;
    float _1144 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1126);
    float _1146 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1124);
    float _1148 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1140);
    float _1150 = _1110 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1152 = _976 * _982;
    bool _1154 = _1120 <= 1.0;
    bool _1156 = _1154 && _1142;
    float _1158 = _1144 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1160 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1146);
    float _1162 = _1148 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1164 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1150);
    float _1166 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1168 = _1160 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1170 = _1152 >= 0.0;
    bool _1172 = _1170 && _1156;
    float _1174 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1164);
    float _1176 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1166);
    float _1178 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1180 = _1168 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1182 = _1152 <= 1.0;
    bool _1184 = _1182 && _1172;
    float _1186 = _1174 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1188 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1176);
    float _1190 = -_1180;
    float _1192 = fma(_1190, _1178, 1.0);
    float _1194 = _477 * _876;
    float _1196 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1198 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1188);
    float _1200 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1202 = fma(_329, _868, _1194);
    float _1204 = log2(_1192);
    float _1206 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1196);
    float _1208 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1200);
    float _1210 = fma(_331, _914, _1202);
    if (_1184)
    {
        float _1212 = float(_571);
        _708 = _1212;
    }
    float _1214 = _708;
    float _1216 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1206);
    float _1218 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1208);
    float _1220 = _1210 + _922;
    float _1222 = 1.0 / _1198;
    float _1224 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1216);
    float _1226 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1218);
    float _1228 = _1218;
    float _1230 = _1226;
    if (!_674)
    {
        float _1232 = -_902;
        float _1234 = _523 + _1232;
        _1044 = _1234;
    }
    float _1236 = _1044;
    if (!_674)
    {
        float _1238 = -_972;
        float _1240 = _521 + _1238;
        _1228 = _1240;
    }
    float _1242 = _1228;
    float _1244 = _1220 * _982;
    float _1246 = _1196;
    float _1248 = _1244;
    if (_1184)
    {
        float _1250 = rint(_1214);
        float _1252 = precise::max(_1250, 0.0);
        uint _1254 = uint(_1252);
        uint _1256 = clamp(_1254, 0u, 65535u);
        _1246 = as_type<float>(_1256);
    }
    float _1258 = _1246;
    float _1260 = _1204 * 0.693147182464599609375;
    float _1262 = _1224 * _1222;
    float _1264 = _1226 * _1222;
    float _1266 = _1260 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1268 = fma(_1262, 0.5, 0.5);
    float _1270 = fma(_1264, -0.5, 0.5);
    float _1272 = _1236;
    if (!_674)
    {
        float3 _4962 = float3(_1242, _1236, float(as_type<int>(_1138)));
        float3 _4966 = select(_4962, float3(0.0), isnan(_4962));
        float _1274 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4966.xy, uint(rint(_4966.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4966.xy, uint(rint(_4966.z)), level(0.0)).x;
        _1272 = _1274;
    }
    float _1276 = _1272;
    float _1278 = _523;
    if (_1184)
    {
        float3 _4981 = float3(_1120, _1152, float(as_type<int>(_1258)));
        float3 _4983 = select(_4981, float3(0.0), isnan(_4981));
        float _1280 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4983.xy, uint(rint(_4983.z)), _1244, level(0.0));
        _1278 = _1280;
    }
    float _1282 = _1278;
    float3 _4993 = float3(_1268, _1270, _1266);
    float _1284 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4993, float3(0.0), isnan(_4993)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4993, float3(0.0), isnan(_4993)), level(0.0)).x;
    float3 _5002 = float3(_1268, _1270, _1266);
    float4 _1287 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5002, float3(0.0), isnan(_5002)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5002, float3(0.0), isnan(_5002)), level(0.0)).xyzw;
    float _1289 = _1287.x;
    float _1291 = _1287.y;
    float _1293 = _1287.z;
    float _1295 = _1287.w;
    float _1297 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1299 = int(_1297);
    int _1301 = abs(_784);
    int _1303 = abs(_798);
    float _1305 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1307 = int(_1305);
    float _1309 = float(_1299);
    float _1311 = 1.0 / _1309;
    float _1313 = float(uint(_1307));
    float _1315 = 1.0 / _309;
    int _1317 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1319 = _1317 != 0;
    float _1321 = _141 * _1311;
    float _1323 = 1.0 / _1313;
    float _1325 = trunc(_1321);
    int _1327 = int(_1325);
    int _1329 = as_type<int>(_1323) + (-2);
    int _1331 = ~_1307;
    int _1333 = _1331 + 1;
    float _1335 = float(uint(_1327));
    float _1337 = float(_1327);
    float _1339 = as_type<float>(_1329) * _1335;
    int _1341 = ~_1307;
    int _1343 = _1341 + 1;
    float _1345 = trunc(_1339);
    float _1347 = precise::max(_1345, 0.0);
    uint _1349 = uint(_1347);
    int _1351 = _1343 * int(_1349);
    int _1353 = _1351 + _1327;
    float _1355 = float(uint(_1353));
    float _1357 = as_type<float>(_1329) * _1355;
    bool _1359 = !_1319;
    float _1361 = _1359 ? 7.345489978790283203125 : 1.0;
    float _1363 = trunc(_1357);
    float _1365 = precise::max(_1363, 0.0);
    uint _1367 = uint(_1365);
    float _1369 = _1361 * _161;
    float _1371 = floor(_1369);
    int _1373 = int(_1349) + int(_1367);
    float _1375 = float(_1307);
    int _1377 = _1333 * _1373;
    int _1379 = _1377 + _1327;
    bool _1381 = _1337 >= _1375;
    bool _1383 = isnan(_1337);
    bool _1385 = _1381 || _1383;
    bool _1387 = isnan(_1375);
    bool _1389 = _1385 || _1387;
    float _1391 = float(_1389);
    float _1393 = -_1371;
    float _1395 = _1369 + _1393;
    bool _1397 = uint(_1379) >= uint(_1307);
    float _1399 = trunc(_1391);
    int _1401 = int(_1399);
    float _1403 = _1395 * _1375;
    bool _1405 = !_1397;
    int _1407 = _1405 ? 0 : (-1);
    float _1409 = _141 * _1375;
    bool _1411 = _1307 == 0;
    int _1413 = ~_1373;
    int _1415 = _1413 + _1407;
    int _1417 = _1415 + 1;
    float _1419 = _1409 * _1315;
    float _1421 = trunc(_1403);
    int _1423 = int(_1421);
    int _1425 = _1307 * _1417;
    int _1427 = _1425 + _1327;
    int _1429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1431 = _1429 != 0;
    int _1433 = _1307 + (-1);
    int _1435 = ~_1401;
    int _1437 = _1435 + 1;
    int _1439 = _1437 + 1;
    float _1441 = trunc(_1419);
    int _1443 = int(_1441);
    bool _1445 = !_1411;
    int _1447 = _1445 ? _1427 : (-1);
    bool _1449 = !_1431;
    int _1451 = _1449 ? 0 : 1;
    int _1453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1455 = _1453 != 0;
    int _1457 = _1447 * _1439;
    int _1459 = abs(_1451);
    int _1461 = abs(_794);
    int _1463 = _1401 * _1433;
    int _1465 = _1463 + _1457;
    int _1467 = _1423 * _1459;
    int _1469 = _1467 + _1327;
    bool _1471 = !_1455;
    int _1473 = _1471 ? 0 : 1;
    int _1475 = ~_1307;
    int _1477 = _1475 + 1;
    int _1479 = _1465 * _1301;
    int _1481 = abs(_1473);
    int _1483 = _1443 * _1461;
    int _1485 = _1483 + _1479;
    bool _1487 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1489 = isnan(0.5);
    bool _1491 = _1487 || _1489;
    bool _1493 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1495 = _1491 || _1493;
    int _1497 = _1469 * _1303;
    int _1499 = _1497 + _1485;
    float _1501 = as_type<float>(_1301);
    float _1503 = as_type<float>(_1461);
    float _1505 = as_type<float>(_1477);
    float _1507 = as_type<float>(_1303);
    if (_674)
    {
        _1501 = 1.0;
    }
    float _1509 = _1501;
    int _1511 = _1423 * _1481;
    int _1513 = _1511 + _1499;
    int _1515 = ~_1307;
    int _1517 = _1515 + 1;
    float _1519 = float(uint(_1513));
    float _1521 = _1509;
    if (_1495)
    {
        _1503 = 1.0;
    }
    float _1523 = _1503;
    float _1525 = as_type<float>(_1329) * _1519;
    float _1527 = trunc(_1525);
    float _1529 = precise::max(_1527, 0.0);
    uint _1531 = uint(_1529);
    int _1533 = _1517 * int(_1531);
    int _1535 = _1533 + _1513;
    float _1537 = float(uint(_1535));
    float _1539 = as_type<float>(_1329) * _1537;
    float _1541 = trunc(_1539);
    float _1543 = precise::max(_1541, 0.0);
    uint _1545 = uint(_1543);
    int _1547 = int(_1531) + int(_1545);
    float _1549 = _1523;
    if (_1495)
    {
        _1505 = 1.0;
    }
    float _1551 = _1505;
    int _1553 = _1477 * _1547;
    int _1555 = _1553 + _1513;
    bool _1557 = uint(_1555) >= uint(_1307);
    bool _1559 = !_1557;
    int _1561 = _1559 ? 0 : (-1);
    int _1563 = ~_1547;
    int _1565 = _1563 + _1561;
    int _1567 = _1565 + 1;
    int _1569 = _1307 * _1567;
    int _1571 = _1569 + _1513;
    float _1573 = _1551;
    float _1575 = _1289;
    if (!_1495)
    {
        float _1577 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1579 = _1577 * 0.15915493667125701904296875;
        float _1581 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1583 = _1579 * 6.283185482025146484375;
        float _1585 = cos(_1583);
        float _1587 = _1581 * 0.15915493667125701904296875;
        float _1589 = _1579 * 6.283185482025146484375;
        float _1591 = sin(_1589);
        float _1593 = 1.0 / _1585;
        float _1595 = _1587 * 6.283185482025146484375;
        float _1597 = cos(_1595);
        float _1599 = _1591 * _1593;
        float _1601 = _1587 * 6.283185482025146484375;
        float _1603 = sin(_1601);
        float _1605 = _1597 * _1599;
        float _1607 = 1.0 / _1605;
        float _1609 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1611 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1609;
        float _1613 = 1.0 / _1611;
        float _1615 = _1603 * _1607;
        float _1617 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1619 = fma(_517, _1615, _1617);
        float _1621 = _1619 * _1613;
        float _1623 = precise::clamp(_1621, 0.0, 1.0);
        _1549 = _1623;
    }
    float _1625 = _1549;
    if (!_1495)
    {
        float _1627 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1629 = _1627 * 0.15915493667125701904296875;
        float _1631 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1633 = _1629 * 6.283185482025146484375;
        float _1635 = cos(_1633);
        float _1637 = _1631 * 0.15915493667125701904296875;
        float _1639 = _1629 * 6.283185482025146484375;
        float _1641 = sin(_1639);
        float _1643 = 1.0 / _1635;
        float _1645 = _1637 * 6.283185482025146484375;
        float _1647 = cos(_1645);
        float _1649 = _1641 * _1643;
        float _1651 = _1637 * 6.283185482025146484375;
        float _1653 = sin(_1651);
        float _1655 = _1647 * _1649;
        float _1657 = 1.0 / _1655;
        float _1659 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1661 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1659;
        float _1663 = 1.0 / _1661;
        float _1665 = _1653 * _1657;
        float _1667 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1669 = fma(_517, _1665, _1667);
        float _1671 = _1669 * _1663;
        float _1673 = precise::clamp(_1671, 0.0, 1.0);
        float _1675 = -_1673;
        float _1677 = _1675 + 1.0;
        _1507 = _1655;
        _1573 = _1677;
    }
    float _1679 = _1507;
    float _1681 = _1573;
    float _1683 = _1679;
    if (!_674)
    {
        int _1685 = _714 << 4;
        int _1687 = _1685 + 2048;
        uint _1689 = uint(int(uint(_1687) >> uint(2)));
        uint _1691 = uint(int(uint(int(_1689)) >> uint(2)));
        int _1693 = int(_1689) & 3;
        float _1695 = (*spvDescriptorSet0.vp_c15)._m0[int(_1691)][_1693];
        int _1697 = int(_1689) + 1;
        uint _1699 = uint(int(uint(_1697) >> uint(2)));
        int _1701 = _1697 & 3;
        float _1703 = (*spvDescriptorSet0.vp_c15)._m0[int(_1699)][_1701];
        int _1705 = _1687 + 8;
        uint _1707 = uint(int(uint(_1705) >> uint(2)));
        uint _1709 = uint(int(uint(int(_1707)) >> uint(2)));
        int _1711 = int(_1707) & 3;
        float _1713 = (*spvDescriptorSet0.vp_c15)._m0[int(_1709)][_1711];
        int _1715 = int(_1707) + 1;
        uint _1717 = uint(int(uint(_1715) >> uint(2)));
        int _1719 = _1715 & 3;
        float _1721 = (*spvDescriptorSet0.vp_c15)._m0[int(_1717)][_1719];
        float _1723 = _477 * _1703;
        float _1725 = fma(_329, _1695, _1723);
        float _1727 = fma(_331, _1713, _1725);
        float _1729 = _1727 + _1721;
        float _1731 = precise::clamp(_1729, 0.0, 1.0);
        float _1733 = -_1731;
        float _1735 = _1733 + _1276;
        float _1737 = fma(_1735, 500.0, 1.5);
        float _1739 = exp2(_1737);
        float _1741 = 0.0 + _1739;
        float _1743 = precise::clamp(_1741, 0.0, 1.0);
        _561 = _1723;
        _1521 = _1743;
    }
    float _1745 = _561;
    float _1747 = _1521;
    float _1749 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1751 = _1110 + _1749;
    float _1753 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1755 = _1112 + _1753;
    float _1757 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1759 = _1114 + _1757;
    float _1761 = _1751 * _1751;
    float _1763 = fma(_1755, _1755, _1761);
    float _1765 = fma(_1759, _1759, _1763);
    float _1767 = rsqrt(_1765);
    float _1769 = sqrt(_1765);
    float _1771 = _1767 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1773 = _1755 * _1771;
    float _1775 = _1759 * _1771;
    float _1777 = _1773 * _1773;
    float _1779 = _1775 * _1775;
    float _1781 = _1777 + _1779;
    float _1783 = sqrt(_1781);
    bool _1785 = _1783 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1787 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1789 = _1783 + _1787;
    float _1791 = _1767;
    float _1793 = _1745;
    float _1795 = _1789;
    float _1797 = _1751;
    if (_1785)
    {
        float _1799 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1791 = _1799;
    }
    float _1801 = _1791;
    if (_1785)
    {
        float _1803 = rsqrt(_1781);
        _1793 = _1803;
    }
    float _1805 = _1793;
    float _1807 = _1805;
    if (_1785)
    {
        float _1809 = _1789 * _1801;
        _1795 = _1809;
    }
    float _1811 = _1795;
    if (_1785)
    {
        float _1813 = _1811 * 0.15915493667125701904296875;
        _563 = _1813;
    }
    float _1815 = _563;
    float _1817 = _1759;
    if (_1785)
    {
        float _1819 = _1815 * 6.283185482025146484375;
        float _1821 = sin(_1819);
        _1817 = _1821;
    }
    float _1823 = _1817;
    float _1825 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1827 = precise::max(0.0, _1825);
    float _1829 = _1801;
    float _1831 = _1827;
    if (_1785)
    {
        float _1833 = _1815 * 6.283185482025146484375;
        float _1835 = cos(_1833);
        _1829 = _1835;
    }
    float _1837 = _1829;
    float _1839 = -_1771;
    float _1841 = -_1827;
    float _1843 = fma(_1751, _1839, _1841);
    if (_1785)
    {
        float _1845 = _1843 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1797 = _1845;
    }
    float _1847 = _1797;
    float _1849 = _1847;
    float _1851 = _1823;
    if (_1785)
    {
        float _1853 = fma(_1823, _1847, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1849 = _1853;
    }
    float _1855 = _1849;
    float _1857 = _1855;
    if (!_1785)
    {
        _1851 = _1773;
    }
    float _1859 = _1851;
    float _1861 = _1859;
    float _1863 = _1837;
    if (_1785)
    {
        float _1865 = _1837 + (-1.0);
        _1831 = _1865;
    }
    float _1867 = _1831;
    float _1869 = _1867;
    if (_1785)
    {
        float _1871 = _1805 * _1855;
        _1046 = _1871;
    }
    float _1873 = _1046;
    if (!_1785)
    {
        _1857 = _1843;
    }
    float _1875 = _1857;
    float _1877 = _1875;
    if (_1785)
    {
        float _1879 = _1867 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1683 = _1879;
    }
    float _1881 = _1683;
    if (_1785)
    {
        float _1883 = _1773 * _1873;
        _1861 = _1883;
    }
    float _1885 = _1861;
    if (!_1785)
    {
        _1869 = _1775;
    }
    float _1887 = _1869;
    float _1889 = _1887;
    if (_1785)
    {
        float _1891 = _1775 * _1873;
        _1889 = _1891;
    }
    float _1893 = _1889;
    if (!_1785)
    {
        _1807 = _1777;
    }
    float _1895 = _1807;
    float _1897 = _1895;
    if (_1785)
    {
        float _1899 = fma(_1843, _1837, _1881);
        _1877 = _1899;
    }
    float _1901 = _1877;
    if (_1785)
    {
        float _1903 = _1885 * _1885;
        _1897 = _1903;
    }
    float _1905 = _1897;
    if (!_1785)
    {
        _1863 = _1779;
    }
    float _1907 = _1863;
    float _1909 = _1907;
    if (_1785)
    {
        float _1911 = _1893 * _1893;
        _1909 = _1911;
    }
    float _1913 = _1909;
    float _1915 = float(uint(_1469));
    float _1917 = fma(_1901, _1901, _1905);
    float _1919 = _1917 + _1913;
    float _1921 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1923 = fma(_1769, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1921);
    float _1925 = precise::clamp(_1923, 0.0, 1.0);
    float _1927 = as_type<float>(_1329) * _1915;
    float _1929 = -_1925;
    float _1931 = _1929 + 1.0;
    float _1933 = rsqrt(_1919);
    float _1935 = abs(_1931);
    float _1937 = log2(_1935);
    float _1939 = _1933 * _1885;
    float _1941 = _1933 * _1901;
    float _1943 = _1933 * _1893;
    float _1945 = trunc(_1927);
    float _1947 = precise::max(_1945, 0.0);
    uint _1949 = uint(_1947);
    float _1951 = _1939 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1953 = -_1951;
    float _1955 = fma(_1941, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1953);
    float _1957 = -_1943;
    float _1959 = fma(_1957, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1955);
    float _1961 = _1937 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1963 = fma(_1959, -0.5, 0.5);
    float _1965 = fma(_1959, 0.5, 0.5);
    float _1967 = exp2(_1961);
    float _1969 = fma(_1965, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1971 = fma(_1965, _1969, -0.212114393711090087890625);
    float _1973 = _1941 + 1.0;
    float _1975 = sqrt(_1963);
    float _1977 = fma(_1965, _1971, 1.570728778839111328125);
    float _1979 = -_1941;
    float _1981 = fma(_1967, _1973, _1979);
    bool _1983 = !_1411;
    int _1985 = _1983 ? _1571 : (-1);
    int _1987 = ~_1307;
    int _1989 = _1987 + 1;
    int _1991 = _1985 >> 31;
    float _1993 = _1975 * 0.636619746685028076171875;
    float _1995 = -_1977;
    float _1997 = fma(_1993, _1995, 1.0);
    float _1999 = fma(_1981, 0.5, 0.5);
    float2 _6005 = float2(_1997, _1999);
    float3 _2003 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6005, float2(0.0), isnan(_6005)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6005, float2(0.0), isnan(_6005)), level(0.0)).xyz;
    float _2005 = _2003.x;
    float _2007 = _2003.y;
    float _2009 = _2003.z;
    int _2011 = _1991 & 3;
    float _2013 = _1937 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2015 = _1985 & 3;
    bool _2017 = _2015 != 0;
    float _2019 = -_349;
    float _2021 = _2019 + 1.0;
    int _2023 = _1985 + _2011;
    int _2025 = _1989 * int(_1949);
    int _2027 = _2025 + _1469;
    int _2029 = ~_1307;
    int _2031 = _2029 + 1;
    float _2033 = exp2(_2013);
    int _2035 = _2023 >> 2;
    float _2037 = float(uint(_2027));
    int _2039 = _2035 << 4;
    int _2041 = _2039 + 368;
    float _2043 = as_type<float>(_1329) * _2037;
    uint _2045 = uint(int(uint(_2041) >> uint(2)));
    uint _2047 = uint(int(uint(int(_2045)) >> uint(2)));
    int _2049 = int(_2045) & 3;
    float _2051 = (*spvDescriptorSet0.vp_c9)._m0[int(_2047)][_2049];
    int _2053 = int(_2045) + 1;
    uint _2055 = uint(int(uint(_2053) >> uint(2)));
    int _2057 = _2053 & 3;
    float _2059 = (*spvDescriptorSet0.vp_c9)._m0[int(_2055)][_2057];
    int _2061 = _1985 & 3;
    bool _2063 = _2061 != 0;
    float _2065 = trunc(_2043);
    float _2067 = precise::max(_2065, 0.0);
    uint _2069 = uint(_2067);
    float _2071 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _2073 = uint(_2061) > 1u;
    int _2075 = _2041 + 8;
    uint _2077 = uint(int(uint(_2075) >> uint(2)));
    uint _2079 = uint(int(uint(int(_2077)) >> uint(2)));
    int _2081 = int(_2077) & 3;
    float _2083 = (*spvDescriptorSet0.vp_c9)._m0[int(_2079)][_2081];
    int _2085 = int(_2077) + 1;
    uint _2087 = uint(int(uint(_2085) >> uint(2)));
    int _2089 = _2085 & 3;
    float _2091 = (*spvDescriptorSet0.vp_c9)._m0[int(_2087)][_2089];
    int _2093 = int(_1949) + int(_2069);
    int _2095 = _2017 ? 0 : 1;
    int _2097 = _2031 * _2093;
    int _2099 = _2097 + _1469;
    int _2101 = ~_2095;
    int _2103 = _2101 + 1;
    int _2105 = _2103 + 1;
    int _2107 = _2105;
    if (!_2073)
    {
        int _2109 = ~_2095;
        int _2111 = _2109 + 1;
        _2107 = _2111;
    }
    int _2113 = _2107;
    bool _2115 = !_2063;
    int _2117 = _2115 ? 0 : 1;
    int _2119 = abs(_2113);
    bool _2121 = _2061 != 3;
    int _2123 = abs(_2117);
    bool _2125 = uint(_2061) >= 2u;
    float _2127 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2129 = int(_2127);
    int _2131 = ~_2119;
    int _2133 = _2131 + 1;
    int _2135 = _2133 + 1;
    int _2137 = _2125 ? 0 : 1;
    int _2139 = ~_2123;
    int _2141 = _2139 + 1;
    int _2143 = _2141 + 1;
    bool _2145 = uint(_2099) >= uint(_1307);
    int _2147 = _2135 * as_type<int>(_2059);
    int _2149 = ~_2137;
    int _2151 = _2149 + 1;
    int _2153 = _2151 + 1;
    bool _2155 = _2061 != 3;
    int _2157 = _2143 * as_type<int>(_2051);
    int _2159 = _2157 + _2147;
    int _2161 = _2153;
    if (_2121)
    {
        int _2163 = ~_2137;
        int _2165 = _2163 + 1;
        _2161 = _2165;
    }
    int _2167 = _2161;
    bool _2169 = !_2155;
    int _2171 = _2169 ? 0 : (-1);
    int _2173 = abs(_2167);
    int _2175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2177 = _2175 != 0;
    int _2179 = abs(_2171);
    bool _2181 = !_2145;
    int _2183 = _2181 ? 0 : (-1);
    bool _2185 = !_2177;
    int _2187 = _2185 ? 0 : 1;
    int _2189 = abs(_2129);
    int _2191 = ~_2093;
    int _2193 = _2191 + _2183;
    int _2195 = _2193 + 1;
    float _2197 = float(uint(_2129));
    float _2199 = in.m_63.y;
    int _2201 = ~_2173;
    int _2203 = _2201 + 1;
    int _2205 = _2203 + 1;
    int _2207 = _1307 * _2195;
    int _2209 = _2207 + _1469;
    int _2211 = abs(_2187);
    int _2213 = _2205 * as_type<int>(_2083);
    int _2215 = _2213 + _2159;
    int _2217 = ~_2179;
    int _2219 = _2217 + 1;
    int _2221 = _2219 + 1;
    float _2223 = 1.0 / _2197;
    float _2225 = float(uint(_2189));
    int _2227 = ~_2211;
    int _2229 = _2227 + 1;
    int _2231 = _2229 + 1;
    int _2233 = _2221 * as_type<int>(_2091);
    int _2235 = _2233 + _2215;
    bool _2237 = !_1411;
    int _2239 = _2237 ? _2209 : (-1);
    int _2241 = ~_2129;
    int _2243 = _2241 + 1;
    float _2245 = 1.0 / _2225;
    int _2247 = _2235 * _2231;
    int _2249 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2251 = _2249 != 0;
    int _2253 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2255 = _2253 != 0;
    int _2257 = _2239 * _2211;
    int _2259 = _2257 + _2247;
    int _2261 = ~_2189;
    int _2263 = _2261 + 1;
    int _2265 = as_type<int>(_2223) + (-2);
    float _2267 = float(uint(_2259));
    int _2269 = abs(_2259);
    float _2271 = as_type<float>(_2265) * _2267;
    int _2273 = as_type<int>(_2245) + (-2);
    float _2275 = float(uint(_2269));
    float _2277 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _2279 = _161 > 0.5;
    float _2281 = trunc(_2271);
    float _2283 = precise::max(_2281, 0.0);
    uint _2285 = uint(_2283);
    float _2287 = as_type<float>(_2273) * _2275;
    bool _2289 = _2199 > 0.5;
    int _2291 = _2259 ^ _2129;
    float _2293 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2295 = trunc(_2287);
    float _2297 = precise::max(_2295, 0.0);
    uint _2299 = uint(_2297);
    uint _2301 = uint(int(uint(_2291) >> uint(31)));
    int _2303 = ~int(_2301);
    int _2305 = _2303 + 1;
    int _2307 = _2243 * int(_2285);
    int _2309 = _2307 + _2259;
    float _2311 = float(uint(_2309));
    int _2313 = _2263 * int(_2299);
    int _2315 = _2313 + _2269;
    float _2317 = as_type<float>(_2265) * _2311;
    float _2319 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2321 = float(uint(_2315));
    float _2323 = as_type<float>(_2273) * _2321;
    float _2325 = trunc(_2317);
    float _2327 = precise::max(_2325, 0.0);
    uint _2329 = uint(_2327);
    float _2331 = _161 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2333 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2335 = -_2277;
    float _2337 = fma(_2331, 2.0, _2335);
    float _2339 = trunc(_2323);
    float _2341 = precise::max(_2339, 0.0);
    uint _2343 = uint(_2341);
    float _2345 = fma(_161, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2333);
    float _2347 = -_141;
    float _2349 = fma(_2347, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2337);
    float _2351 = _2319 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2353 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2355 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2345);
    int _2357 = int(_2285) + int(_2329);
    int _2359 = ~_2129;
    int _2361 = _2359 + 1;
    float _2363 = _2353 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2365 = ~_2189;
    int _2367 = _2365 + 1;
    float _2369 = -_2355;
    float _2371 = _2369 + 1.0;
    int _2373 = int(_2299) + int(_2343);
    float _2375 = _2199 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2377 = fma(_2199, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2293);
    int _2379 = _2367 * _2373;
    int _2381 = _2379 + _2269;
    int _2383 = _2361 * _2357;
    int _2385 = _2383 + _2259;
    float _2387 = fma(_2375, -2.0, _2071);
    bool _2389 = uint(_2381) >= uint(_2189);
    float _2391 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _2393 = uint(_2385) >= uint(_2129);
    float _2395 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2397 = _2391 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2399 = _2395 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2401 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _2403 = !_2393;
    int _2405 = _2403 ? 0 : (-1);
    float _2407 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2409 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _2411 = !_2389;
    int _2413 = _2411 ? 0 : (-1);
    out.m_72.x = _2397;
    out.m_72.y = _2399;
    out.m_72.z = _2363;
    int _2415 = ~_2357;
    int _2417 = _2415 + _2405;
    int _2419 = _2417 + 1;
    float _2421 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2423 = _2401 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2425 = _2407 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2427 = _2409 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2429 = ~_2413;
    int _2431 = _2373 + _2429;
    int _2433 = _2431 + 1;
    int _2435 = _2129 * _2419;
    int _2437 = _2435 + _2259;
    bool _2439 = _2129 == 0;
    float _2441 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2387);
    out.m_74.x = _2423;
    out.m_74.y = _2425;
    out.m_74.z = _2427;
    out.m_74.w = _2421;
    int _2443 = _2433 ^ _2305;
    float _2445 = abs(_517);
    float _2447 = log2(_2445);
    bool _2449 = _2129 == 0;
    float _2451 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2377);
    int _2453 = ~_2305;
    int _2455 = _2453 + _2443;
    int _2457 = _2455 + 1;
    float _2459 = _457 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2461 = -_2451;
    float _2463 = _2461 + 1.0;
    bool _2465 = !_2449;
    int _2467 = _2465 ? _2457 : (-1);
    float _2469 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2471 = _517 <= 8000.0;
    bool _2473 = isnan(_517);
    bool _2475 = _2471 || _2473;
    bool _2477 = isnan(8000.0);
    bool _2479 = _2475 || _2477;
    float _2481 = float(_2479);
    float _2483 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2485 = -_457;
    int _2487 = _2279 ? as_type<int>(_2485) : as_type<int>(_457);
    bool _2489 = !_2439;
    int _2491 = _2489 ? _2437 : (-1);
    float _2493 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2483);
    bool _2495 = !_2251;
    float _2497 = _2495 ? _457 : as_type<float>(_2487);
    float _2499 = float(_2491);
    float _2501 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2493);
    float _2503 = _2447 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2505 = _2497 + 0.5;
    float _2507 = float(_2467);
    float _2509 = fma(_2351, _2499, _2349);
    float _2511 = -_435;
    int _2513 = _2289 ? as_type<int>(_2511) : as_type<int>(_435);
    float _2515 = _2469 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2517 = exp2(_2503);
    float _2519 = fma(_2351, _2505, _2509);
    bool _2521 = !_2255;
    float _2523 = _2521 ? _435 : as_type<float>(_2513);
    float _2525 = _435 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2527 = -_2441;
    float _2529 = fma(_2515, _2507, _2527);
    float _2531 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2501);
    float _2533 = -_2371;
    float _2535 = fma(_2497, _2533, _2519);
    float _2537 = _2525 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2539 = _2525 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2541 = _2525 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2543 = _2523 + (-0.5);
    float _2545 = fma(_2459, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2537);
    float _2547 = fma(_2459, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2539);
    float _2549 = fma(_2459, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2541);
    float _2551 = -_2515;
    float _2553 = fma(_2551, _2543, _2529);
    float _2555 = fma(_2517, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2557 = precise::clamp(_2555, 0.0, 1.0);
    float _2559 = _2531 + _1198;
    out.gl_Position.x = _1224;
    out.gl_Position.y = _1226;
    out.gl_Position.z = _2531;
    out.gl_Position.w = _1198;
    float _2561 = fma(_2523, _2463, _2553);
    float _2563 = fma(_2557, -2.0, 3.0);
    float _2565 = _2557 * _2557;
    float _2567 = _2559 * 0.5;
    out.m_76.x = _2535;
    out.m_76.y = _2561;
    float _2569 = _2565 * _2563;
    bool _2571 = _1769 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2573 = isnan(_1769);
    bool _2575 = _2571 || _2573;
    bool _2577 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2579 = _2575 || _2577;
    out.m_78.z = _2567;
    out.m_78.w = _1198;
    float _2581 = -_2569;
    float _2583 = _2581 + 1.0;
    float _2585 = -_2033;
    float _2587 = _2585 + 1.0;
    float _2589 = fma(_2583, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2569);
    float _2591 = _2549;
    float _2593 = _2547;
    float _2595 = _2545;
    if (!_1184)
    {
        _1230 = 1.0;
    }
    float _2597 = _1230;
    float _2599 = _2549 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2601 = _2587 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2603 = _2481 * _2589;
    float _2605 = _2597;
    if (_1184)
    {
        bool _2607 = _1282 >= _1244;
        bool _2609 = isnan(_1282);
        bool _2611 = _2607 || _2609;
        bool _2613 = isnan(_1244);
        bool _2615 = _2611 || _2613;
        float _2617 = float(_2615);
        _2605 = _2617;
    }
    float _2619 = _2605;
    float _2621 = _2601 * _1284;
    float _2623 = _2603 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2625 = -_2601;
    float _2627 = _2625 + 1.0;
    float _2629 = _2619 * _1747;
    float _2631 = _1295 * _2621;
    float _2633 = _2021 * _2623;
    float _2635 = precise::clamp(_2633, 0.0, 1.0);
    float _2637 = _1295 * _2627;
    float _2639 = _2547 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2641 = _2009 * _2621;
    float _2643 = -_2635;
    float _2645 = fma(_2643, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2647 = fma(_2005, _2631, _1289);
    float _2649 = fma(_2007, _2631, _1291);
    float _2651 = fma(_1295, _2641, _1293);
    float _2653 = -_2629;
    float _2655 = fma(_2653, _2645, 1.0);
    float _2657 = precise::clamp(_2655, 0.0, 1.0);
    float _2659 = _1625 * _1681;
    float _2661 = _2659;
    if (!_2579)
    {
        _1575 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2663 = _1575;
    float _2665 = _2657 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2667 = _2545 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    out.m_80.x = _2647;
    out.m_80.y = _2649;
    out.m_80.z = _2651;
    out.m_80.w = _2637;
    float _2669 = _2659 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2671 = _2663;
    float _2673 = _2663;
    if (!_2579)
    {
        _1248 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2675 = _1248;
    out.m_82.x = _2665;
    float _2677 = _2675;
    float _2679 = _2675;
    if (!_2579)
    {
        _2591 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2681 = _2591;
    float _2683 = _2681;
    float _2685 = _2681;
    if (!_2579)
    {
        _2593 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2687 = _2593;
    out.m_84.x = _2639;
    out.m_84.y = _2667;
    out.m_84.z = _2599;
    float _2689 = _2687;
    float _2691 = _2687;
    if (!_2579)
    {
        _2595 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2693 = _2595;
    float _2695 = _2693;
    float _2697 = _2693;
    if (!_2579)
    {
        _2661 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2699 = _2661;
    bool _2701 = !_2579;
    float _2703 = _2699;
    float _2705 = _2699;
    if (!_2701)
    {
        bool _2707 = _1769 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2709 = isnan(_1769);
        bool _2711 = _2707 || _2709;
        bool _2713 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2715 = _2711 || _2713;
        if (!_2715)
        {
            float _2717 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2719 = _1769 + _2717;
            float _2721 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2723 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2721;
            float _2725 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2727 = _2725 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2729 = 1.0 / _2723;
            float _2731 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2733 = _2731 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2735 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2737 = _2735 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2739 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2741 = _2739 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2743 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2745 = _2743 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2747 = _2719 * _2729;
            float _2749 = precise::clamp(_2747, 0.0, 1.0);
            float _2751 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2753 = _2751 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2755 = fma(_2749, _2727, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2757 = fma(_2749, _2753, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2759 = fma(_2749, _2733, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2761 = fma(_2749, _2737, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2763 = fma(_2749, _2741, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2765 = fma(_2749, _2745, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2679 = _2759;
            _2697 = _2763;
            _2673 = _2755;
            _2691 = _2761;
            _2685 = _2757;
            _2705 = _2765;
            _2767 = true;
        }
        else
        {
            bool _2769 = _1769 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2771 = isnan(_1769);
            bool _2773 = _2769 || _2771;
            bool _2775 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2777 = _2773 || _2775;
            if (!_2777)
            {
                _2671 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2779 = _2671;
            _2673 = _2779;
            if (!_2777)
            {
                _2677 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2781 = _2677;
            _2679 = _2781;
            if (!_2777)
            {
                _2683 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2783 = _2683;
            _2685 = _2783;
            if (!_2777)
            {
                _2689 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2785 = _2689;
            _2691 = _2785;
            if (!_2777)
            {
                _2695 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2787 = _2695;
            _2697 = _2787;
            if (!_2777)
            {
                _2703 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2789 = _2703;
            bool _2791 = !_2777;
            _2705 = _2789;
            if (!_2791)
            {
                bool _2793 = _1769 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2795 = isnan(_1769);
                bool _2797 = _2793 || _2795;
                bool _2799 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2801 = _2797 || _2799;
                if (!_2801)
                {
                    float _2803 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2805 = _1769 + _2803;
                    float _2807 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2809 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2807;
                    float _2811 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2813 = _2811 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2815 = 1.0 / _2809;
                    float _2817 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2819 = _2817 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2821 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2823 = _2821 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2825 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2827 = _2825 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2829 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2831 = _2829 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2833 = _2805 * _2815;
                    float _2835 = precise::clamp(_2833, 0.0, 1.0);
                    float _2837 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2839 = _2837 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2841 = fma(_2835, _2813, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2843 = fma(_2835, _2839, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2845 = fma(_2835, _2819, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2847 = fma(_2835, _2823, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2849 = fma(_2835, _2827, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2851 = fma(_2835, _2831, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2679 = _2845;
                    _2697 = _2849;
                    _2673 = _2841;
                    _2691 = _2847;
                    _2685 = _2843;
                    _2705 = _2851;
                    _2767 = true;
                }
                else
                {
                    _2679 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2697 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2673 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2691 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2685 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2705 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2767 = false;
    float _2853 = _2679;
    float _2855 = _2697;
    float _2857 = _2673;
    float _2859 = _2691;
    float _2861 = _2685;
    float _2863 = _2705;
    float _2865 = fma(_2667, -0.5, 0.5);
    float _2867 = precise::clamp(_2865, 0.0, 1.0);
    float _2869 = -_2853;
    float _2871 = _2869 + _2855;
    float _2873 = _2669 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2875 = -_2857;
    float _2877 = _2875 + _2859;
    out.m_86.x = 0.0;
    float _2879 = fma(_2867, _2871, _2853);
    float _2881 = fma(_2867, _2877, _2857);
    out.m_59.x = _2873;
    float _2883 = -_2861;
    float _2885 = _2883 + _2863;
    float _2887 = _2879 * 0.586610972881317138671875;
    bool _2889 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2891 = fma(_2867, _2885, _2861);
    float _2893 = fma(_2881, 0.298911988735198974609375, _2887);
    bool _2895 = _1625 > 0.0;
    bool _2897 = isnan(_1625);
    bool _2899 = _2895 || _2897;
    bool _2901 = isnan(0.0);
    bool _2903 = _2899 || _2901;
    float _2905 = fma(_2891, 0.114477999508380889892578125, _2893);
    bool _2907 = _1681 <= 0.0;
    bool _2909 = !_2903;
    bool _2911 = _2907 || _2909;
    float _2913 = -_2905;
    float _2915 = _2881 + _2913;
    float _2917 = -_2905;
    float _2919 = _2879 + _2917;
    float _2921 = -_2905;
    float _2923 = _2891 + _2921;
    float _2925 = fma(_2915, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2905);
    float _2927 = fma(_2919, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2905);
    float _2929 = fma(_2923, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2905);
    bool _2931 = !_2889;
    if (!_2931)
    {
        float _2933 = -_1110;
        float _2935 = _2933 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2937 = -_1112;
        float _2939 = _2937 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2941 = -_1114;
        float _2943 = _2941 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2945 = _2935 * _2935;
        float _2947 = fma(_2939, _2939, _2945);
        float _2949 = fma(_2943, _2943, _2947);
        float _2951 = sqrt(_2949);
        float _2953 = rsqrt(_2949);
        float _2955 = -_2951;
        float _2957 = _2955 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2959 = _2957 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2961 = precise::clamp(_2959, 0.0, 1.0);
        float _2963 = _2939 * _2953;
        float _2965 = _2935 * _2953;
        float _2967 = abs(_2961);
        float _2969 = log2(_2967);
        float _2971 = _2943 * _2953;
        float _2973 = _2963 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2975 = _2667 * _2965;
        float _2977 = -_2965;
        float _2979 = -_2973;
        float _2981 = fma(_2977, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2979);
        float _2983 = fma(_2639, _2963, _2975);
        float _2985 = -_2971;
        float _2987 = fma(_2985, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2981);
        float _2989 = fma(_2599, _2971, _2983);
        float _2991 = precise::clamp(_2989, 0.0, 1.0);
        float _2993 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2995 = _2987 + _2993;
        float _2997 = _2969 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2999 = _2995 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3001 = precise::clamp(_2999, 0.0, 1.0);
        float _3003 = exp2(_2997);
        float _3005 = _3003 * _3001;
        float _3007 = _2991 * _3005;
        float _3009 = _3007 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3011 = _3007 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3013 = _3007 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _3009;
        out.m_86.y = _3011;
        out.m_86.z = _3013;
    }
    out.m_88.x = _2925;
    out.m_88.y = _2927;
    out.m_88.z = _2929;
    if (!_2911)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_59.x = 0.0;
    float _3015 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3015;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2767 = false;
    bool _299 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_56.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    float _117 = _115;
    if (!_111)
    {
        out.m_59.x = 0.0;
    }
    int _119 = 0;
    if (!_111)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3072 = as_type<float>(_123);
        out.gl_Position.z = _3072;
    }
    if (!_111)
    {
        return out;
    }
    float _127 = in.m_61.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = 0.0;
    if (_137)
    {
        float _145 = float(_107);
        _143 = _145;
    }
    float _147 = _143;
    bool _149 = _141 >= _147;
    bool _151 = !_137;
    bool _153 = _149 || _151;
    if (_153)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _117;
    if (_153)
    {
        out.m_59.x = 0.0;
    }
    if (_153)
    {
        float _157 = _155 * 5.0;
        _125 = as_type<int>(_157);
    }
    int _159 = _125;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3140 = as_type<float>(_159);
        out.gl_Position.z = _3140;
    }
    if (_153)
    {
        return out;
    }
    float _161 = in.m_63.x;
    float _163 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _165 = _141 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _167 = in.m_65.x;
    float _169 = in.m_65.y;
    float _171 = in.m_65.z;
    float _173 = _165 * _163;
    int _175 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _177 = _175 != 0;
    float _179 = fma(_161, (*spvDescriptorSet0.vp_c9)._m0[20].x, _173);
    int _181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _183 = _181 != 0;
    int _185 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _187 = _185 != 0;
    float _189 = floor(_179);
    float _191 = _179 * 6.283185482025146484375;
    float _193 = _169 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _195 = _169 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _197 = _169 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _199 = _191 * 0.15915493667125701904296875;
    bool _201 = !_183;
    int _203 = _201 ? 0 : 1;
    float _205 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].x, _193);
    float _207 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].x, _195);
    float _209 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].x, _197);
    bool _211 = !_187;
    int _213 = _211 ? 0 : 1;
    float _215 = _199 * 6.283185482025146484375;
    float _217 = cos(_215);
    float _219 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].z, _205);
    float _221 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].z, _207);
    int _223 = abs(_213);
    float _225 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].z, _209);
    float _227 = -_189;
    float _229 = _179 + _227;
    int _231 = abs(_203);
    bool _233 = !_177;
    int _235 = _233 ? 0 : 1;
    bool _237 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _239 = abs(_235);
    float _241 = float(_231);
    float _243 = -_229;
    float _245 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _247 = fma(_217, 0.5, 0.5);
    bool _249 = _229 < 0.5;
    float _251 = float(_249);
    float _253 = abs(_245);
    float _255 = _241 * _253;
    float _257 = -_247;
    float _259 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _261 = float(_239);
    float _263 = -_251;
    float _265 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _267 = float(_223);
    float _269 = fma(_261, _259, _255);
    float _271 = abs(_265);
    float _273 = fma(_267, _271, _269);
    bool _275 = !_237;
    float _277 = _219;
    float _295;
    float _297;
    if (!_275)
    {
        float _279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _281 = _161 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _283 = float(_107);
        float _285 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _287 = _285 * _279;
        float _289 = floor(_287);
        float _291 = -_289;
        float _293 = _287 + _291;
        _295 = _293;
        _297 = _283;
        _299 = true;
    }
    else
    {
        float _301 = float(_107);
        float _303 = 1.0 / _301;
        float _305 = _141 * _303;
        _295 = _305;
        _297 = _301;
    }
    _299 = false;
    float _307 = _295;
    float _309 = _297;
    float _311 = in.m_56.x;
    float _313 = in.m_56.y;
    float _315 = in.m_56.z;
    float _317 = _313 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _319 = _313 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _321 = fma(_311, (*spvDescriptorSet0.vp_c10)._m0[4].x, _317);
    float _323 = fma(_311, (*spvDescriptorSet0.vp_c10)._m0[6].x, _319);
    float _325 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[4].z, _321);
    float _327 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[6].z, _323);
    float _329 = _325 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _331 = _327 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _333 = fma(_329, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _335 = fma(_331, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _337 = floor(_333);
    float _339 = floor(_335);
    float _341 = -_337;
    float _343 = _333 + _341;
    float _345 = -_339;
    float _347 = _335 + _345;
    float2 _3439 = float2(_343, _347);
    float _349 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3439, float2(0.0), isnan(_3439)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3439, float2(0.0), isnan(_3439)), level(0.0)).x;
    float _351 = _313 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _353 = as_type<float>(int(gl_VertexIndex));
    bool _355 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _357 = isnan(_307);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _363 = _359 || _361;
    float _365 = float(_363);
    float _367 = fma(_311, (*spvDescriptorSet0.vp_c10)._m0[5].x, _351);
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _375 = _307 + _373;
    float _377 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[5].z, _367);
    float _379 = 1.0 / _371;
    float _381 = _377 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _383 = _381 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _385 = fma(_329, (*spvDescriptorSet0.vp_c8)._m0[11].x, _383);
    float _387 = fma(_331, (*spvDescriptorSet0.vp_c8)._m0[11].z, _385);
    bool _389 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _391 = isnan(_307);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    float _401 = _375 * _379;
    float _403 = _381 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _405 = _387 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _407 = in.m_70.x;
    float _409 = in.m_70.y;
    float _411 = fma(_329, (*spvDescriptorSet0.vp_c8)._m0[10].x, _403);
    float _413 = 1.0 / _405;
    int _415 = as_type<int>(_353) & 1;
    bool _417 = _415 != 0;
    int _419 = as_type<int>(_353) & 2;
    bool _421 = _419 != 0;
    float _423 = fma(_331, (*spvDescriptorSet0.vp_c8)._m0[10].z, _411);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _425;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _429;
    bool _433 = !_421;
    float _435 = _433 ? (-0.5) : 0.5;
    float _437 = _423 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _439 = -_365;
    float _441 = _439 + 1.0;
    float _443 = fma(_427, _401, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _445 = fma(_431, _401, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _447 = _437 + _405;
    float _449 = _399 * _441;
    float _451 = -_399;
    float _453 = _451 + 1.0;
    bool _455 = !_417;
    float _457 = _455 ? (-0.5) : 0.5;
    float _459 = _447 * _413;
    float _461 = _459 * 0.5;
    float _463 = _443 * _449;
    float _465 = _445 * _449;
    float _467 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _469 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _471 = fma(_461, (*spvDescriptorSet0.vp_c8)._m0[30].w, _469);
    float _473 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[143].x, _463);
    float _475 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[143].y, _465);
    float _477 = _381 + _467;
    float _479 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _481 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[144].x, _473);
    float _483 = 1.0 / _471;
    float _485 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[144].y, _475);
    float _487 = _477 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _489 = _477 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _491 = _481 * _407;
    float _493 = _485 * _409;
    float _495 = fma(_329, (*spvDescriptorSet0.vp_c15)._m0[126].x, _487);
    float _497 = fma(_329, (*spvDescriptorSet0.vp_c15)._m0[127].x, _489);
    float _499 = _273 * _491;
    float _501 = _273 * _493;
    float _503 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _435);
    float _505 = fma(_331, (*spvDescriptorSet0.vp_c15)._m0[126].z, _495);
    float _507 = fma(_331, (*spvDescriptorSet0.vp_c15)._m0[127].z, _497);
    float _509 = _501 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _511 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _457);
    float _513 = _499 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _515 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _517 = _483 * _515;
    float _519 = _509 * _503;
    float _521 = _505 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _523 = _507 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _525 = _513 * _511;
    bool _527 = _517 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _529 = _519 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _531 = _517 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _533 = trunc(_521);
    int _535 = int(_533);
    float _537 = _519 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _539 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[26].x, _529);
    bool _541 = !_527;
    int _543 = _541 ? 0 : 1;
    float _545 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[24].x, _537);
    float _547 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[26].z, _539);
    float _549 = trunc(_523);
    int _551 = int(_549);
    float _553 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[24].z, _545);
    int _555 = 2;
    int _557 = as_type<int>(_519);
    int _559 = as_type<int>(_525);
    float _561 = _477;
    float _563 = _331;
    if (!_527)
    {
        _555 = 1;
    }
    int _565 = _555;
    float _567 = _547 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _569 = _565;
    if (!_531)
    {
        _569 = _543;
    }
    int _571 = _569;
    float _573 = _553 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _575 = _331 + _567;
    int _577 = _571 << 6;
    float _579 = _329 + _573;
    int _581 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _583 = _535 + _581;
    int _585 = _583 + 1;
    float _587 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _589 = _575 + _587;
    int _591 = _577 + 56;
    uint _594 = uint(int(uint(_591) >> uint(2)));
    uint _596 = uint(int(uint(int(_594)) >> uint(2)));
    int _598 = int(_594) & 3;
    float _600 = (*spvDescriptorSet0.vp_c15)._m0[int(_596)][_598];
    int _602 = int(_594) + 1;
    uint _604 = uint(int(uint(_602) >> uint(2)));
    int _606 = _602 & 3;
    float _608 = (*spvDescriptorSet0.vp_c15)._m0[int(_604)][_606];
    float _610 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _612 = _579 + _610;
    bool _614 = _585 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _616 = _589 * _589;
    int _618 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _620 = _551 + _618;
    int _622 = _620 + 1;
    float _624 = fma(_612, _612, _616);
    int _626 = _577 + 48;
    uint _628 = uint(int(uint(_626) >> uint(2)));
    uint _630 = uint(int(uint(int(_628)) >> uint(2)));
    int _632 = int(_628) & 3;
    float _634 = (*spvDescriptorSet0.vp_c15)._m0[int(_630)][_632];
    int _636 = int(_628) + 1;
    uint _638 = uint(int(uint(_636) >> uint(2)));
    int _640 = _636 & 3;
    float _642 = (*spvDescriptorSet0.vp_c15)._m0[int(_638)][_640];
    int _644 = _585 | _622;
    float _646 = sqrt(_624);
    bool _648 = _644 < 0;
    bool _650 = _648 || _614;
    float _652 = _519 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _654 = _577 + 64;
    uint _656 = uint(int(uint(_654) >> uint(2)));
    uint _658 = uint(int(uint(int(_656)) >> uint(2)));
    int _660 = int(_656) & 3;
    float _662 = (*spvDescriptorSet0.vp_c15)._m0[int(_658)][_660];
    int _664 = int(_656) + 1;
    uint _666 = uint(int(uint(_664) >> uint(2)));
    int _668 = _664 & 3;
    float _670 = (*spvDescriptorSet0.vp_c15)._m0[int(_666)][_668];
    bool _672 = _622 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _674 = _672 || _650;
    float _676 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[25].x, _652);
    float _678 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[25].z, _676);
    int _680 = _577 + 72;
    uint _682 = uint(int(uint(_680) >> uint(2)));
    uint _684 = uint(int(uint(int(_682)) >> uint(2)));
    int _686 = int(_682) & 3;
    float _688 = (*spvDescriptorSet0.vp_c15)._m0[int(_684)][_686];
    int _690 = int(_682) + 1;
    uint _692 = uint(int(uint(_690) >> uint(2)));
    int _694 = _690 & 3;
    float _696 = (*spvDescriptorSet0.vp_c15)._m0[int(_692)][_694];
    float _698 = _678 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _700 = _646 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _702 = _622;
    float _704 = _579;
    float _706 = _575;
    float _708 = as_type<float>(_571);
    if (!_674)
    {
        int _710 = _622 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _712 = _710 + _585;
        _557 = _712;
    }
    int _714 = _557;
    int _716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _718 = _716 != 0;
    int _720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _722 = _720 != 0;
    int _724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _726 = _724 != 0;
    int _728 = _577 + 96;
    uint _730 = uint(int(uint(_728) >> uint(2)));
    uint _732 = uint(int(uint(int(_730)) >> uint(2)));
    int _734 = int(_730) & 3;
    float _736 = (*spvDescriptorSet0.vp_c15)._m0[int(_732)][_734];
    int _738 = int(_730) + 1;
    uint _740 = uint(int(uint(_738) >> uint(2)));
    int _742 = _738 & 3;
    float _744 = (*spvDescriptorSet0.vp_c15)._m0[int(_740)][_742];
    float _746 = _381 + _698;
    if (!_674)
    {
        int _748 = _714 << 2;
        _702 = _748;
    }
    int _750 = _702;
    int _752 = _750;
    if (!_674)
    {
        uint _754 = uint(int(uint(_714) >> uint(2)));
        _559 = int(_754);
    }
    int _756 = _559;
    float _758 = as_type<float>(_756);
    if (!_674)
    {
        int _760 = 12 & _750;
        _752 = _760;
    }
    int _762 = _752;
    int _764 = _577 + 104;
    uint _766 = uint(int(uint(_764) >> uint(2)));
    uint _768 = uint(int(uint(int(_766)) >> uint(2)));
    int _770 = int(_766) & 3;
    float _772 = (*spvDescriptorSet0.vp_c15)._m0[int(_768)][_770];
    int _774 = int(_766) + 1;
    uint _776 = uint(int(uint(_774) >> uint(2)));
    int _778 = _774 & 3;
    float _780 = (*spvDescriptorSet0.vp_c15)._m0[int(_776)][_778];
    bool _782 = !_722;
    int _784 = _782 ? 0 : 1;
    if (!_674)
    {
        int _786 = _756 << 4;
        int _788 = _786 + _762;
        _758 = as_type<float>(_788);
    }
    float _790 = _758;
    bool _792 = !_718;
    int _794 = _792 ? 0 : 1;
    bool _796 = !_726;
    int _798 = _796 ? 0 : 1;
    float _800 = 0.0;
    if (!_700)
    {
        _800 = _746;
    }
    float _802 = _800;
    bool _804 = !_700;
    float _806 = _802;
    float _808 = _744;
    float _810 = _600;
    float _812 = _780;
    if (!_804)
    {
        float _814 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _816 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _818 = _646 + _816;
        float _820 = rsqrt(_624);
        float _822 = _818 * _814;
        float _824 = _746 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _826 = _822 * 0.15915493667125701904296875;
        float _828 = _826 * 6.283185482025146484375;
        float _830 = cos(_828);
        float _832 = _826 * 6.283185482025146484375;
        float _834 = sin(_832);
        float _836 = _830 + (-1.0);
        float _838 = _836 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _840 = fma(_834, _824, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _842 = fma(_746, _830, _838);
        float _844 = _820 * _840;
        float _846 = fma(_612, _844, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _848 = fma(_589, _844, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _806 = _842;
        _704 = _846;
        _706 = _848;
    }
    float _850 = _806;
    float _852 = _704;
    float _854 = _706;
    float _856 = -_381;
    float _858 = _856 + _850;
    int _860 = _577 + 80;
    uint _862 = uint(int(uint(_860) >> uint(2)));
    uint _864 = uint(int(uint(int(_862)) >> uint(2)));
    int _866 = int(_862) & 3;
    float _868 = (*spvDescriptorSet0.vp_c15)._m0[int(_864)][_866];
    int _870 = int(_862) + 1;
    uint _872 = uint(int(uint(_870) >> uint(2)));
    int _874 = _870 & 3;
    float _876 = (*spvDescriptorSet0.vp_c15)._m0[int(_872)][_874];
    float _878 = -_329;
    float _880 = _878 + _852;
    float _882 = -_331;
    float _884 = _882 + _854;
    float _886 = _858 * _858;
    float _888 = _477 * _744;
    float _890 = _477 * _670;
    float _892 = _852;
    float _894 = _850;
    float _896 = _854;
    float _898 = _858;
    if (!_674)
    {
        float _900 = floor(_523);
        _808 = _900;
    }
    float _902 = _808;
    float _904 = fma(_880, _880, _886);
    int _906 = _577 + 88;
    uint _908 = uint(int(uint(_906) >> uint(2)));
    uint _910 = uint(int(uint(int(_908)) >> uint(2)));
    int _912 = int(_908) & 3;
    float _914 = (*spvDescriptorSet0.vp_c15)._m0[int(_910)][_912];
    int _916 = int(_908) + 1;
    uint _918 = uint(int(uint(_916) >> uint(2)));
    int _920 = _916 & 3;
    float _922 = (*spvDescriptorSet0.vp_c15)._m0[int(_918)][_920];
    float _924 = fma(_329, _736, _888);
    float _926 = fma(_884, _884, _904);
    bool _928 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _930 = isnan(0.5);
    bool _932 = _928 || _930;
    bool _934 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _936 = _932 || _934;
    float _938 = fma(_331, _772, _924);
    float _940 = _477 * _642;
    float _942 = sqrt(_926);
    float _944 = _790;
    if (!_674)
    {
        int _946 = as_type<int>(_790) + 400;
        uint _948 = uint(int(uint(_946) >> uint(2)));
        uint _950 = uint(int(uint(int(_948)) >> uint(2)));
        int _952 = int(_948) & 3;
        float _954 = (*spvDescriptorSet0.vp_c15)._m0[int(_950)][_952];
        _944 = _954;
    }
    float _956 = _944;
    float _958 = _938 + _780;
    float _960 = fma(_329, _662, _890);
    float _962 = fma(_329, _634, _940);
    float _964 = fma(_331, _688, _960);
    float _966 = _904;
    float _968 = _958;
    if (!_674)
    {
        float _970 = floor(_521);
        _966 = _970;
    }
    float _972 = _966;
    float _974 = fma(_331, _600, _962);
    float _976 = _964 + _696;
    float _978 = _974 + _608;
    bool _980 = _942 > 0.0;
    float _982 = 1.0 / _958;
    bool _984 = !_980;
    if (!_984)
    {
        float _986 = _221 * _221;
        float _988 = fma(_219, _219, _986);
        float _990 = fma(_225, _225, _988);
        float _992 = rsqrt(_926);
        float _994 = sqrt(_990);
        float _996 = _880 * _992;
        float _998 = _858 * _992;
        float _1000 = _884 * _992;
        bool _1002 = _994 > 0.0;
        bool _1004 = !_1002;
        _898 = _998;
        _810 = _992;
        if (!_1004)
        {
            float _1006 = rsqrt(_990);
            float _1008 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1010 = _221 * _1006;
            float _1012 = _219 * _1006;
            float _1014 = _225 * _1006;
            float _1016 = _998 * _1010;
            float _1018 = fma(_996, _1012, _1016);
            float _1020 = _1008 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1022 = fma(_1000, _1014, _1018);
            float _1024 = _1022 * _1020;
            float _1026 = fma(_219, _1024, _852);
            float _1028 = fma(_221, _1024, _850);
            float _1030 = fma(_225, _1024, _854);
            _892 = _1026;
            _894 = _1028;
            _896 = _1030;
            _810 = _1024;
        }
    }
    float _1032 = _892;
    float _1034 = _894;
    float _1036 = _896;
    float _1038 = _898;
    float _1040 = _810;
    float _1042 = _1040;
    float _1044 = _1038;
    float _1046 = _1034;
    if (_936)
    {
        _277 = _1032;
    }
    float _1048 = _277;
    float _1050 = _1048;
    if (_936)
    {
        _968 = _1034;
    }
    float _1052 = _968;
    float _1054 = _1052;
    if (_936)
    {
        _812 = _1036;
    }
    float _1056 = _812;
    float _1058 = _1056;
    if (!_936)
    {
        float _1060 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1062 = _381 + _1060;
        float _1064 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1066 = _329 + _1064;
        float _1068 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1070 = -_329;
        float _1072 = _1070 + _1032;
        float _1074 = _1062 * _1062;
        float _1076 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1078 = _331 + _1076;
        float _1080 = -_331;
        float _1082 = _1080 + _1036;
        float _1084 = fma(_1066, _1066, _1074);
        float _1086 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1088 = fma(_1078, _1078, _1084);
        float _1090 = sqrt(_1088);
        float _1092 = _1068 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1094 = precise::min(_1090, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1096 = _1094 * _1086;
        float _1098 = -_381;
        float _1100 = _1098 + _1034;
        float _1102 = _1092 * _1096;
        float _1104 = fma(_1100, _1102, _381);
        float _1106 = fma(_1072, _1102, _329);
        float _1108 = fma(_1082, _1102, _331);
        _1054 = _1104;
        _1050 = _1106;
        _1058 = _1108;
        _1042 = _1090;
    }
    float _1110 = _1054;
    float _1112 = _1050;
    float _1114 = _1058;
    float _1116 = _1042;
    float _1118 = _1110 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1120 = _978 * _982;
    float _1122 = _1110 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1124 = _1110 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1126 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1118);
    float _1128 = _1116;
    if (!_674)
    {
        float _1130 = rint(_956);
        float _1132 = precise::max(_1130, 0.0);
        uint _1134 = uint(_1132);
        uint _1136 = clamp(_1134, 0u, 65535u);
        _1128 = as_type<float>(_1136);
    }
    float _1138 = _1128;
    float _1140 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1122);
    bool _1142 = _1120 >= 0.0;
    float _1144 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1126);
    float _1146 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1124);
    float _1148 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1140);
    float _1150 = _1110 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1152 = _976 * _982;
    bool _1154 = _1120 <= 1.0;
    bool _1156 = _1154 && _1142;
    float _1158 = _1144 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1160 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1146);
    float _1162 = _1148 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1164 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1150);
    float _1166 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1168 = _1160 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1170 = _1152 >= 0.0;
    bool _1172 = _1170 && _1156;
    float _1174 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1164);
    float _1176 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1166);
    float _1178 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1180 = _1168 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1182 = _1152 <= 1.0;
    bool _1184 = _1182 && _1172;
    float _1186 = _1174 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1188 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1176);
    float _1190 = -_1180;
    float _1192 = fma(_1190, _1178, 1.0);
    float _1194 = _477 * _876;
    float _1196 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1198 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1188);
    float _1200 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1202 = fma(_329, _868, _1194);
    float _1204 = log2(_1192);
    float _1206 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1196);
    float _1208 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1200);
    float _1210 = fma(_331, _914, _1202);
    if (_1184)
    {
        float _1212 = float(_571);
        _708 = _1212;
    }
    float _1214 = _708;
    float _1216 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1206);
    float _1218 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1208);
    float _1220 = _1210 + _922;
    float _1222 = 1.0 / _1198;
    float _1224 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1216);
    float _1226 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1218);
    float _1228 = _1218;
    float _1230 = _1226;
    if (!_674)
    {
        float _1232 = -_902;
        float _1234 = _523 + _1232;
        _1044 = _1234;
    }
    float _1236 = _1044;
    if (!_674)
    {
        float _1238 = -_972;
        float _1240 = _521 + _1238;
        _1228 = _1240;
    }
    float _1242 = _1228;
    float _1244 = _1220 * _982;
    float _1246 = _1196;
    float _1248 = _1244;
    if (_1184)
    {
        float _1250 = rint(_1214);
        float _1252 = precise::max(_1250, 0.0);
        uint _1254 = uint(_1252);
        uint _1256 = clamp(_1254, 0u, 65535u);
        _1246 = as_type<float>(_1256);
    }
    float _1258 = _1246;
    float _1260 = _1204 * 0.693147182464599609375;
    float _1262 = _1224 * _1222;
    float _1264 = _1226 * _1222;
    float _1266 = _1260 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1268 = fma(_1262, 0.5, 0.5);
    float _1270 = fma(_1264, -0.5, 0.5);
    float _1272 = _1236;
    if (!_674)
    {
        float3 _4962 = float3(_1242, _1236, float(as_type<int>(_1138)));
        float3 _4966 = select(_4962, float3(0.0), isnan(_4962));
        float _1274 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4966.xy, uint(rint(_4966.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4966.xy, uint(rint(_4966.z)), level(0.0)).x;
        _1272 = _1274;
    }
    float _1276 = _1272;
    float _1278 = _523;
    if (_1184)
    {
        float3 _4981 = float3(_1120, _1152, float(as_type<int>(_1258)));
        float3 _4983 = select(_4981, float3(0.0), isnan(_4981));
        float _1280 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4983.xy, uint(rint(_4983.z)), _1244, level(0.0));
        _1278 = _1280;
    }
    float _1282 = _1278;
    float3 _4993 = float3(_1268, _1270, _1266);
    float _1284 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4993, float3(0.0), isnan(_4993)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4993, float3(0.0), isnan(_4993)), level(0.0)).x;
    float3 _5002 = float3(_1268, _1270, _1266);
    float4 _1287 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5002, float3(0.0), isnan(_5002)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5002, float3(0.0), isnan(_5002)), level(0.0)).xyzw;
    float _1289 = _1287.x;
    float _1291 = _1287.y;
    float _1293 = _1287.z;
    float _1295 = _1287.w;
    float _1297 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1299 = int(_1297);
    int _1301 = abs(_784);
    int _1303 = abs(_798);
    float _1305 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1307 = int(_1305);
    float _1309 = float(_1299);
    float _1311 = 1.0 / _1309;
    float _1313 = float(uint(_1307));
    float _1315 = 1.0 / _309;
    int _1317 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1319 = _1317 != 0;
    float _1321 = _141 * _1311;
    float _1323 = 1.0 / _1313;
    float _1325 = trunc(_1321);
    int _1327 = int(_1325);
    int _1329 = as_type<int>(_1323) + (-2);
    int _1331 = ~_1307;
    int _1333 = _1331 + 1;
    float _1335 = float(uint(_1327));
    float _1337 = float(_1327);
    float _1339 = as_type<float>(_1329) * _1335;
    int _1341 = ~_1307;
    int _1343 = _1341 + 1;
    float _1345 = trunc(_1339);
    float _1347 = precise::max(_1345, 0.0);
    uint _1349 = uint(_1347);
    int _1351 = _1343 * int(_1349);
    int _1353 = _1351 + _1327;
    float _1355 = float(uint(_1353));
    float _1357 = as_type<float>(_1329) * _1355;
    bool _1359 = !_1319;
    float _1361 = _1359 ? 7.345489978790283203125 : 1.0;
    float _1363 = trunc(_1357);
    float _1365 = precise::max(_1363, 0.0);
    uint _1367 = uint(_1365);
    float _1369 = _1361 * _161;
    float _1371 = floor(_1369);
    int _1373 = int(_1349) + int(_1367);
    float _1375 = float(_1307);
    int _1377 = _1333 * _1373;
    int _1379 = _1377 + _1327;
    bool _1381 = _1337 >= _1375;
    bool _1383 = isnan(_1337);
    bool _1385 = _1381 || _1383;
    bool _1387 = isnan(_1375);
    bool _1389 = _1385 || _1387;
    float _1391 = float(_1389);
    float _1393 = -_1371;
    float _1395 = _1369 + _1393;
    bool _1397 = uint(_1379) >= uint(_1307);
    float _1399 = trunc(_1391);
    int _1401 = int(_1399);
    float _1403 = _1395 * _1375;
    bool _1405 = !_1397;
    int _1407 = _1405 ? 0 : (-1);
    float _1409 = _141 * _1375;
    bool _1411 = _1307 == 0;
    int _1413 = ~_1373;
    int _1415 = _1413 + _1407;
    int _1417 = _1415 + 1;
    float _1419 = _1409 * _1315;
    float _1421 = trunc(_1403);
    int _1423 = int(_1421);
    int _1425 = _1307 * _1417;
    int _1427 = _1425 + _1327;
    int _1429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1431 = _1429 != 0;
    int _1433 = _1307 + (-1);
    int _1435 = ~_1401;
    int _1437 = _1435 + 1;
    int _1439 = _1437 + 1;
    float _1441 = trunc(_1419);
    int _1443 = int(_1441);
    bool _1445 = !_1411;
    int _1447 = _1445 ? _1427 : (-1);
    bool _1449 = !_1431;
    int _1451 = _1449 ? 0 : 1;
    int _1453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1455 = _1453 != 0;
    int _1457 = _1447 * _1439;
    int _1459 = abs(_1451);
    int _1461 = abs(_794);
    int _1463 = _1401 * _1433;
    int _1465 = _1463 + _1457;
    int _1467 = _1423 * _1459;
    int _1469 = _1467 + _1327;
    bool _1471 = !_1455;
    int _1473 = _1471 ? 0 : 1;
    int _1475 = ~_1307;
    int _1477 = _1475 + 1;
    int _1479 = _1465 * _1301;
    int _1481 = abs(_1473);
    int _1483 = _1443 * _1461;
    int _1485 = _1483 + _1479;
    bool _1487 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1489 = isnan(0.5);
    bool _1491 = _1487 || _1489;
    bool _1493 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1495 = _1491 || _1493;
    int _1497 = _1469 * _1303;
    int _1499 = _1497 + _1485;
    float _1501 = as_type<float>(_1301);
    float _1503 = as_type<float>(_1461);
    float _1505 = as_type<float>(_1477);
    float _1507 = as_type<float>(_1303);
    if (_674)
    {
        _1501 = 1.0;
    }
    float _1509 = _1501;
    int _1511 = _1423 * _1481;
    int _1513 = _1511 + _1499;
    int _1515 = ~_1307;
    int _1517 = _1515 + 1;
    float _1519 = float(uint(_1513));
    float _1521 = _1509;
    if (_1495)
    {
        _1503 = 1.0;
    }
    float _1523 = _1503;
    float _1525 = as_type<float>(_1329) * _1519;
    float _1527 = trunc(_1525);
    float _1529 = precise::max(_1527, 0.0);
    uint _1531 = uint(_1529);
    int _1533 = _1517 * int(_1531);
    int _1535 = _1533 + _1513;
    float _1537 = float(uint(_1535));
    float _1539 = as_type<float>(_1329) * _1537;
    float _1541 = trunc(_1539);
    float _1543 = precise::max(_1541, 0.0);
    uint _1545 = uint(_1543);
    int _1547 = int(_1531) + int(_1545);
    float _1549 = _1523;
    if (_1495)
    {
        _1505 = 1.0;
    }
    float _1551 = _1505;
    int _1553 = _1477 * _1547;
    int _1555 = _1553 + _1513;
    bool _1557 = uint(_1555) >= uint(_1307);
    bool _1559 = !_1557;
    int _1561 = _1559 ? 0 : (-1);
    int _1563 = ~_1547;
    int _1565 = _1563 + _1561;
    int _1567 = _1565 + 1;
    int _1569 = _1307 * _1567;
    int _1571 = _1569 + _1513;
    float _1573 = _1551;
    float _1575 = _1289;
    if (!_1495)
    {
        float _1577 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1579 = _1577 * 0.15915493667125701904296875;
        float _1581 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1583 = _1579 * 6.283185482025146484375;
        float _1585 = cos(_1583);
        float _1587 = _1581 * 0.15915493667125701904296875;
        float _1589 = _1579 * 6.283185482025146484375;
        float _1591 = sin(_1589);
        float _1593 = 1.0 / _1585;
        float _1595 = _1587 * 6.283185482025146484375;
        float _1597 = cos(_1595);
        float _1599 = _1591 * _1593;
        float _1601 = _1587 * 6.283185482025146484375;
        float _1603 = sin(_1601);
        float _1605 = _1597 * _1599;
        float _1607 = 1.0 / _1605;
        float _1609 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1611 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1609;
        float _1613 = 1.0 / _1611;
        float _1615 = _1603 * _1607;
        float _1617 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1619 = fma(_517, _1615, _1617);
        float _1621 = _1619 * _1613;
        float _1623 = precise::clamp(_1621, 0.0, 1.0);
        _1549 = _1623;
    }
    float _1625 = _1549;
    if (!_1495)
    {
        float _1627 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1629 = _1627 * 0.15915493667125701904296875;
        float _1631 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1633 = _1629 * 6.283185482025146484375;
        float _1635 = cos(_1633);
        float _1637 = _1631 * 0.15915493667125701904296875;
        float _1639 = _1629 * 6.283185482025146484375;
        float _1641 = sin(_1639);
        float _1643 = 1.0 / _1635;
        float _1645 = _1637 * 6.283185482025146484375;
        float _1647 = cos(_1645);
        float _1649 = _1641 * _1643;
        float _1651 = _1637 * 6.283185482025146484375;
        float _1653 = sin(_1651);
        float _1655 = _1647 * _1649;
        float _1657 = 1.0 / _1655;
        float _1659 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1661 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1659;
        float _1663 = 1.0 / _1661;
        float _1665 = _1653 * _1657;
        float _1667 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1669 = fma(_517, _1665, _1667);
        float _1671 = _1669 * _1663;
        float _1673 = precise::clamp(_1671, 0.0, 1.0);
        float _1675 = -_1673;
        float _1677 = _1675 + 1.0;
        _1507 = _1655;
        _1573 = _1677;
    }
    float _1679 = _1507;
    float _1681 = _1573;
    float _1683 = _1679;
    if (!_674)
    {
        int _1685 = _714 << 4;
        int _1687 = _1685 + 2048;
        uint _1689 = uint(int(uint(_1687) >> uint(2)));
        uint _1691 = uint(int(uint(int(_1689)) >> uint(2)));
        int _1693 = int(_1689) & 3;
        float _1695 = (*spvDescriptorSet0.vp_c15)._m0[int(_1691)][_1693];
        int _1697 = int(_1689) + 1;
        uint _1699 = uint(int(uint(_1697) >> uint(2)));
        int _1701 = _1697 & 3;
        float _1703 = (*spvDescriptorSet0.vp_c15)._m0[int(_1699)][_1701];
        int _1705 = _1687 + 8;
        uint _1707 = uint(int(uint(_1705) >> uint(2)));
        uint _1709 = uint(int(uint(int(_1707)) >> uint(2)));
        int _1711 = int(_1707) & 3;
        float _1713 = (*spvDescriptorSet0.vp_c15)._m0[int(_1709)][_1711];
        int _1715 = int(_1707) + 1;
        uint _1717 = uint(int(uint(_1715) >> uint(2)));
        int _1719 = _1715 & 3;
        float _1721 = (*spvDescriptorSet0.vp_c15)._m0[int(_1717)][_1719];
        float _1723 = _477 * _1703;
        float _1725 = fma(_329, _1695, _1723);
        float _1727 = fma(_331, _1713, _1725);
        float _1729 = _1727 + _1721;
        float _1731 = precise::clamp(_1729, 0.0, 1.0);
        float _1733 = -_1731;
        float _1735 = _1733 + _1276;
        float _1737 = fma(_1735, 500.0, 1.5);
        float _1739 = exp2(_1737);
        float _1741 = 0.0 + _1739;
        float _1743 = precise::clamp(_1741, 0.0, 1.0);
        _561 = _1723;
        _1521 = _1743;
    }
    float _1745 = _561;
    float _1747 = _1521;
    float _1749 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1751 = _1110 + _1749;
    float _1753 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1755 = _1112 + _1753;
    float _1757 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1759 = _1114 + _1757;
    float _1761 = _1751 * _1751;
    float _1763 = fma(_1755, _1755, _1761);
    float _1765 = fma(_1759, _1759, _1763);
    float _1767 = rsqrt(_1765);
    float _1769 = sqrt(_1765);
    float _1771 = _1767 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1773 = _1755 * _1771;
    float _1775 = _1759 * _1771;
    float _1777 = _1773 * _1773;
    float _1779 = _1775 * _1775;
    float _1781 = _1777 + _1779;
    float _1783 = sqrt(_1781);
    bool _1785 = _1783 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1787 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1789 = _1783 + _1787;
    float _1791 = _1767;
    float _1793 = _1745;
    float _1795 = _1789;
    float _1797 = _1751;
    if (_1785)
    {
        float _1799 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1791 = _1799;
    }
    float _1801 = _1791;
    if (_1785)
    {
        float _1803 = rsqrt(_1781);
        _1793 = _1803;
    }
    float _1805 = _1793;
    float _1807 = _1805;
    if (_1785)
    {
        float _1809 = _1789 * _1801;
        _1795 = _1809;
    }
    float _1811 = _1795;
    if (_1785)
    {
        float _1813 = _1811 * 0.15915493667125701904296875;
        _563 = _1813;
    }
    float _1815 = _563;
    float _1817 = _1759;
    if (_1785)
    {
        float _1819 = _1815 * 6.283185482025146484375;
        float _1821 = sin(_1819);
        _1817 = _1821;
    }
    float _1823 = _1817;
    float _1825 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1827 = precise::max(0.0, _1825);
    float _1829 = _1801;
    float _1831 = _1827;
    if (_1785)
    {
        float _1833 = _1815 * 6.283185482025146484375;
        float _1835 = cos(_1833);
        _1829 = _1835;
    }
    float _1837 = _1829;
    float _1839 = -_1771;
    float _1841 = -_1827;
    float _1843 = fma(_1751, _1839, _1841);
    if (_1785)
    {
        float _1845 = _1843 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1797 = _1845;
    }
    float _1847 = _1797;
    float _1849 = _1847;
    float _1851 = _1823;
    if (_1785)
    {
        float _1853 = fma(_1823, _1847, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1849 = _1853;
    }
    float _1855 = _1849;
    float _1857 = _1855;
    if (!_1785)
    {
        _1851 = _1773;
    }
    float _1859 = _1851;
    float _1861 = _1859;
    float _1863 = _1837;
    if (_1785)
    {
        float _1865 = _1837 + (-1.0);
        _1831 = _1865;
    }
    float _1867 = _1831;
    float _1869 = _1867;
    if (_1785)
    {
        float _1871 = _1805 * _1855;
        _1046 = _1871;
    }
    float _1873 = _1046;
    if (!_1785)
    {
        _1857 = _1843;
    }
    float _1875 = _1857;
    float _1877 = _1875;
    if (_1785)
    {
        float _1879 = _1867 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1683 = _1879;
    }
    float _1881 = _1683;
    if (_1785)
    {
        float _1883 = _1773 * _1873;
        _1861 = _1883;
    }
    float _1885 = _1861;
    if (!_1785)
    {
        _1869 = _1775;
    }
    float _1887 = _1869;
    float _1889 = _1887;
    if (_1785)
    {
        float _1891 = _1775 * _1873;
        _1889 = _1891;
    }
    float _1893 = _1889;
    if (!_1785)
    {
        _1807 = _1777;
    }
    float _1895 = _1807;
    float _1897 = _1895;
    if (_1785)
    {
        float _1899 = fma(_1843, _1837, _1881);
        _1877 = _1899;
    }
    float _1901 = _1877;
    if (_1785)
    {
        float _1903 = _1885 * _1885;
        _1897 = _1903;
    }
    float _1905 = _1897;
    if (!_1785)
    {
        _1863 = _1779;
    }
    float _1907 = _1863;
    float _1909 = _1907;
    if (_1785)
    {
        float _1911 = _1893 * _1893;
        _1909 = _1911;
    }
    float _1913 = _1909;
    float _1915 = float(uint(_1469));
    float _1917 = fma(_1901, _1901, _1905);
    float _1919 = _1917 + _1913;
    float _1921 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1923 = fma(_1769, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1921);
    float _1925 = precise::clamp(_1923, 0.0, 1.0);
    float _1927 = as_type<float>(_1329) * _1915;
    float _1929 = -_1925;
    float _1931 = _1929 + 1.0;
    float _1933 = rsqrt(_1919);
    float _1935 = abs(_1931);
    float _1937 = log2(_1935);
    float _1939 = _1933 * _1885;
    float _1941 = _1933 * _1901;
    float _1943 = _1933 * _1893;
    float _1945 = trunc(_1927);
    float _1947 = precise::max(_1945, 0.0);
    uint _1949 = uint(_1947);
    float _1951 = _1939 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1953 = -_1951;
    float _1955 = fma(_1941, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1953);
    float _1957 = -_1943;
    float _1959 = fma(_1957, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1955);
    float _1961 = _1937 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1963 = fma(_1959, -0.5, 0.5);
    float _1965 = fma(_1959, 0.5, 0.5);
    float _1967 = exp2(_1961);
    float _1969 = fma(_1965, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1971 = fma(_1965, _1969, -0.212114393711090087890625);
    float _1973 = _1941 + 1.0;
    float _1975 = sqrt(_1963);
    float _1977 = fma(_1965, _1971, 1.570728778839111328125);
    float _1979 = -_1941;
    float _1981 = fma(_1967, _1973, _1979);
    bool _1983 = !_1411;
    int _1985 = _1983 ? _1571 : (-1);
    int _1987 = ~_1307;
    int _1989 = _1987 + 1;
    int _1991 = _1985 >> 31;
    float _1993 = _1975 * 0.636619746685028076171875;
    float _1995 = -_1977;
    float _1997 = fma(_1993, _1995, 1.0);
    float _1999 = fma(_1981, 0.5, 0.5);
    float2 _6005 = float2(_1997, _1999);
    float3 _2003 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6005, float2(0.0), isnan(_6005)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6005, float2(0.0), isnan(_6005)), level(0.0)).xyz;
    float _2005 = _2003.x;
    float _2007 = _2003.y;
    float _2009 = _2003.z;
    int _2011 = _1991 & 3;
    float _2013 = _1937 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2015 = _1985 & 3;
    bool _2017 = _2015 != 0;
    float _2019 = -_349;
    float _2021 = _2019 + 1.0;
    int _2023 = _1985 + _2011;
    int _2025 = _1989 * int(_1949);
    int _2027 = _2025 + _1469;
    int _2029 = ~_1307;
    int _2031 = _2029 + 1;
    float _2033 = exp2(_2013);
    int _2035 = _2023 >> 2;
    float _2037 = float(uint(_2027));
    int _2039 = _2035 << 4;
    int _2041 = _2039 + 368;
    float _2043 = as_type<float>(_1329) * _2037;
    uint _2045 = uint(int(uint(_2041) >> uint(2)));
    uint _2047 = uint(int(uint(int(_2045)) >> uint(2)));
    int _2049 = int(_2045) & 3;
    float _2051 = (*spvDescriptorSet0.vp_c9)._m0[int(_2047)][_2049];
    int _2053 = int(_2045) + 1;
    uint _2055 = uint(int(uint(_2053) >> uint(2)));
    int _2057 = _2053 & 3;
    float _2059 = (*spvDescriptorSet0.vp_c9)._m0[int(_2055)][_2057];
    int _2061 = _1985 & 3;
    bool _2063 = _2061 != 0;
    float _2065 = trunc(_2043);
    float _2067 = precise::max(_2065, 0.0);
    uint _2069 = uint(_2067);
    float _2071 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _2073 = uint(_2061) > 1u;
    int _2075 = _2041 + 8;
    uint _2077 = uint(int(uint(_2075) >> uint(2)));
    uint _2079 = uint(int(uint(int(_2077)) >> uint(2)));
    int _2081 = int(_2077) & 3;
    float _2083 = (*spvDescriptorSet0.vp_c9)._m0[int(_2079)][_2081];
    int _2085 = int(_2077) + 1;
    uint _2087 = uint(int(uint(_2085) >> uint(2)));
    int _2089 = _2085 & 3;
    float _2091 = (*spvDescriptorSet0.vp_c9)._m0[int(_2087)][_2089];
    int _2093 = int(_1949) + int(_2069);
    int _2095 = _2017 ? 0 : 1;
    int _2097 = _2031 * _2093;
    int _2099 = _2097 + _1469;
    int _2101 = ~_2095;
    int _2103 = _2101 + 1;
    int _2105 = _2103 + 1;
    int _2107 = _2105;
    if (!_2073)
    {
        int _2109 = ~_2095;
        int _2111 = _2109 + 1;
        _2107 = _2111;
    }
    int _2113 = _2107;
    bool _2115 = !_2063;
    int _2117 = _2115 ? 0 : 1;
    int _2119 = abs(_2113);
    bool _2121 = _2061 != 3;
    int _2123 = abs(_2117);
    bool _2125 = uint(_2061) >= 2u;
    float _2127 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2129 = int(_2127);
    int _2131 = ~_2119;
    int _2133 = _2131 + 1;
    int _2135 = _2133 + 1;
    int _2137 = _2125 ? 0 : 1;
    int _2139 = ~_2123;
    int _2141 = _2139 + 1;
    int _2143 = _2141 + 1;
    bool _2145 = uint(_2099) >= uint(_1307);
    int _2147 = _2135 * as_type<int>(_2059);
    int _2149 = ~_2137;
    int _2151 = _2149 + 1;
    int _2153 = _2151 + 1;
    bool _2155 = _2061 != 3;
    int _2157 = _2143 * as_type<int>(_2051);
    int _2159 = _2157 + _2147;
    int _2161 = _2153;
    if (_2121)
    {
        int _2163 = ~_2137;
        int _2165 = _2163 + 1;
        _2161 = _2165;
    }
    int _2167 = _2161;
    bool _2169 = !_2155;
    int _2171 = _2169 ? 0 : (-1);
    int _2173 = abs(_2167);
    int _2175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2177 = _2175 != 0;
    int _2179 = abs(_2171);
    bool _2181 = !_2145;
    int _2183 = _2181 ? 0 : (-1);
    bool _2185 = !_2177;
    int _2187 = _2185 ? 0 : 1;
    int _2189 = abs(_2129);
    int _2191 = ~_2093;
    int _2193 = _2191 + _2183;
    int _2195 = _2193 + 1;
    float _2197 = float(uint(_2129));
    float _2199 = in.m_63.y;
    int _2201 = ~_2173;
    int _2203 = _2201 + 1;
    int _2205 = _2203 + 1;
    int _2207 = _1307 * _2195;
    int _2209 = _2207 + _1469;
    int _2211 = abs(_2187);
    int _2213 = _2205 * as_type<int>(_2083);
    int _2215 = _2213 + _2159;
    int _2217 = ~_2179;
    int _2219 = _2217 + 1;
    int _2221 = _2219 + 1;
    float _2223 = 1.0 / _2197;
    float _2225 = float(uint(_2189));
    int _2227 = ~_2211;
    int _2229 = _2227 + 1;
    int _2231 = _2229 + 1;
    int _2233 = _2221 * as_type<int>(_2091);
    int _2235 = _2233 + _2215;
    bool _2237 = !_1411;
    int _2239 = _2237 ? _2209 : (-1);
    int _2241 = ~_2129;
    int _2243 = _2241 + 1;
    float _2245 = 1.0 / _2225;
    int _2247 = _2235 * _2231;
    int _2249 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2251 = _2249 != 0;
    int _2253 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2255 = _2253 != 0;
    int _2257 = _2239 * _2211;
    int _2259 = _2257 + _2247;
    int _2261 = ~_2189;
    int _2263 = _2261 + 1;
    int _2265 = as_type<int>(_2223) + (-2);
    float _2267 = float(uint(_2259));
    int _2269 = abs(_2259);
    float _2271 = as_type<float>(_2265) * _2267;
    int _2273 = as_type<int>(_2245) + (-2);
    float _2275 = float(uint(_2269));
    float _2277 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _2279 = _161 > 0.5;
    float _2281 = trunc(_2271);
    float _2283 = precise::max(_2281, 0.0);
    uint _2285 = uint(_2283);
    float _2287 = as_type<float>(_2273) * _2275;
    bool _2289 = _2199 > 0.5;
    int _2291 = _2259 ^ _2129;
    float _2293 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2295 = trunc(_2287);
    float _2297 = precise::max(_2295, 0.0);
    uint _2299 = uint(_2297);
    uint _2301 = uint(int(uint(_2291) >> uint(31)));
    int _2303 = ~int(_2301);
    int _2305 = _2303 + 1;
    int _2307 = _2243 * int(_2285);
    int _2309 = _2307 + _2259;
    float _2311 = float(uint(_2309));
    int _2313 = _2263 * int(_2299);
    int _2315 = _2313 + _2269;
    float _2317 = as_type<float>(_2265) * _2311;
    float _2319 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2321 = float(uint(_2315));
    float _2323 = as_type<float>(_2273) * _2321;
    float _2325 = trunc(_2317);
    float _2327 = precise::max(_2325, 0.0);
    uint _2329 = uint(_2327);
    float _2331 = _161 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2333 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2335 = -_2277;
    float _2337 = fma(_2331, 2.0, _2335);
    float _2339 = trunc(_2323);
    float _2341 = precise::max(_2339, 0.0);
    uint _2343 = uint(_2341);
    float _2345 = fma(_161, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2333);
    float _2347 = -_141;
    float _2349 = fma(_2347, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2337);
    float _2351 = _2319 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2353 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2355 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2345);
    int _2357 = int(_2285) + int(_2329);
    int _2359 = ~_2129;
    int _2361 = _2359 + 1;
    float _2363 = _2353 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2365 = ~_2189;
    int _2367 = _2365 + 1;
    float _2369 = -_2355;
    float _2371 = _2369 + 1.0;
    int _2373 = int(_2299) + int(_2343);
    float _2375 = _2199 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2377 = fma(_2199, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2293);
    int _2379 = _2367 * _2373;
    int _2381 = _2379 + _2269;
    int _2383 = _2361 * _2357;
    int _2385 = _2383 + _2259;
    float _2387 = fma(_2375, -2.0, _2071);
    bool _2389 = uint(_2381) >= uint(_2189);
    float _2391 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _2393 = uint(_2385) >= uint(_2129);
    float _2395 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2397 = _2391 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2399 = _2395 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2401 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _2403 = !_2393;
    int _2405 = _2403 ? 0 : (-1);
    float _2407 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2409 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _2411 = !_2389;
    int _2413 = _2411 ? 0 : (-1);
    out.m_72.x = _2397;
    out.m_72.y = _2399;
    out.m_72.z = _2363;
    int _2415 = ~_2357;
    int _2417 = _2415 + _2405;
    int _2419 = _2417 + 1;
    float _2421 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2423 = _2401 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2425 = _2407 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2427 = _2409 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2429 = ~_2413;
    int _2431 = _2373 + _2429;
    int _2433 = _2431 + 1;
    int _2435 = _2129 * _2419;
    int _2437 = _2435 + _2259;
    bool _2439 = _2129 == 0;
    float _2441 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2387);
    out.m_74.x = _2423;
    out.m_74.y = _2425;
    out.m_74.z = _2427;
    out.m_74.w = _2421;
    int _2443 = _2433 ^ _2305;
    float _2445 = abs(_517);
    float _2447 = log2(_2445);
    bool _2449 = _2129 == 0;
    float _2451 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2377);
    int _2453 = ~_2305;
    int _2455 = _2453 + _2443;
    int _2457 = _2455 + 1;
    float _2459 = _457 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2461 = -_2451;
    float _2463 = _2461 + 1.0;
    bool _2465 = !_2449;
    int _2467 = _2465 ? _2457 : (-1);
    float _2469 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2471 = _517 <= 8000.0;
    bool _2473 = isnan(_517);
    bool _2475 = _2471 || _2473;
    bool _2477 = isnan(8000.0);
    bool _2479 = _2475 || _2477;
    float _2481 = float(_2479);
    float _2483 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2485 = -_457;
    int _2487 = _2279 ? as_type<int>(_2485) : as_type<int>(_457);
    bool _2489 = !_2439;
    int _2491 = _2489 ? _2437 : (-1);
    float _2493 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2483);
    bool _2495 = !_2251;
    float _2497 = _2495 ? _457 : as_type<float>(_2487);
    float _2499 = float(_2491);
    float _2501 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2493);
    float _2503 = _2447 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2505 = _2497 + 0.5;
    float _2507 = float(_2467);
    float _2509 = fma(_2351, _2499, _2349);
    float _2511 = -_435;
    int _2513 = _2289 ? as_type<int>(_2511) : as_type<int>(_435);
    float _2515 = _2469 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2517 = exp2(_2503);
    float _2519 = fma(_2351, _2505, _2509);
    bool _2521 = !_2255;
    float _2523 = _2521 ? _435 : as_type<float>(_2513);
    float _2525 = _435 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2527 = -_2441;
    float _2529 = fma(_2515, _2507, _2527);
    float _2531 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2501);
    float _2533 = -_2371;
    float _2535 = fma(_2497, _2533, _2519);
    float _2537 = _2525 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2539 = _2525 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2541 = _2525 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2543 = _2523 + (-0.5);
    float _2545 = fma(_2459, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2537);
    float _2547 = fma(_2459, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2539);
    float _2549 = fma(_2459, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2541);
    float _2551 = -_2515;
    float _2553 = fma(_2551, _2543, _2529);
    float _2555 = fma(_2517, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2557 = precise::clamp(_2555, 0.0, 1.0);
    float _2559 = _2531 + _1198;
    out.gl_Position.x = _1224;
    out.gl_Position.y = _1226;
    out.gl_Position.z = _2531;
    out.gl_Position.w = _1198;
    float _2561 = fma(_2523, _2463, _2553);
    float _2563 = fma(_2557, -2.0, 3.0);
    float _2565 = _2557 * _2557;
    float _2567 = _2559 * 0.5;
    out.m_76.x = _2535;
    out.m_76.y = _2561;
    float _2569 = _2565 * _2563;
    bool _2571 = _1769 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2573 = isnan(_1769);
    bool _2575 = _2571 || _2573;
    bool _2577 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2579 = _2575 || _2577;
    out.m_78.z = _2567;
    out.m_78.w = _1198;
    float _2581 = -_2569;
    float _2583 = _2581 + 1.0;
    float _2585 = -_2033;
    float _2587 = _2585 + 1.0;
    float _2589 = fma(_2583, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2569);
    float _2591 = _2549;
    float _2593 = _2547;
    float _2595 = _2545;
    if (!_1184)
    {
        _1230 = 1.0;
    }
    float _2597 = _1230;
    float _2599 = _2549 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2601 = _2587 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2603 = _2481 * _2589;
    float _2605 = _2597;
    if (_1184)
    {
        bool _2607 = _1282 >= _1244;
        bool _2609 = isnan(_1282);
        bool _2611 = _2607 || _2609;
        bool _2613 = isnan(_1244);
        bool _2615 = _2611 || _2613;
        float _2617 = float(_2615);
        _2605 = _2617;
    }
    float _2619 = _2605;
    float _2621 = _2601 * _1284;
    float _2623 = _2603 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2625 = -_2601;
    float _2627 = _2625 + 1.0;
    float _2629 = _2619 * _1747;
    float _2631 = _1295 * _2621;
    float _2633 = _2021 * _2623;
    float _2635 = precise::clamp(_2633, 0.0, 1.0);
    float _2637 = _1295 * _2627;
    float _2639 = _2547 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2641 = _2009 * _2621;
    float _2643 = -_2635;
    float _2645 = fma(_2643, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2647 = fma(_2005, _2631, _1289);
    float _2649 = fma(_2007, _2631, _1291);
    float _2651 = fma(_1295, _2641, _1293);
    float _2653 = -_2629;
    float _2655 = fma(_2653, _2645, 1.0);
    float _2657 = precise::clamp(_2655, 0.0, 1.0);
    float _2659 = _1625 * _1681;
    float _2661 = _2659;
    if (!_2579)
    {
        _1575 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2663 = _1575;
    float _2665 = _2657 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2667 = _2545 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    out.m_80.x = _2647;
    out.m_80.y = _2649;
    out.m_80.z = _2651;
    out.m_80.w = _2637;
    float _2669 = _2659 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2671 = _2663;
    float _2673 = _2663;
    if (!_2579)
    {
        _1248 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2675 = _1248;
    out.m_82.x = _2665;
    float _2677 = _2675;
    float _2679 = _2675;
    if (!_2579)
    {
        _2591 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2681 = _2591;
    float _2683 = _2681;
    float _2685 = _2681;
    if (!_2579)
    {
        _2593 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2687 = _2593;
    out.m_84.x = _2639;
    out.m_84.y = _2667;
    out.m_84.z = _2599;
    float _2689 = _2687;
    float _2691 = _2687;
    if (!_2579)
    {
        _2595 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2693 = _2595;
    float _2695 = _2693;
    float _2697 = _2693;
    if (!_2579)
    {
        _2661 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2699 = _2661;
    bool _2701 = !_2579;
    float _2703 = _2699;
    float _2705 = _2699;
    if (!_2701)
    {
        bool _2707 = _1769 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2709 = isnan(_1769);
        bool _2711 = _2707 || _2709;
        bool _2713 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2715 = _2711 || _2713;
        if (!_2715)
        {
            float _2717 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2719 = _1769 + _2717;
            float _2721 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2723 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2721;
            float _2725 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2727 = _2725 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2729 = 1.0 / _2723;
            float _2731 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2733 = _2731 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2735 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2737 = _2735 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2739 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2741 = _2739 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2743 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2745 = _2743 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2747 = _2719 * _2729;
            float _2749 = precise::clamp(_2747, 0.0, 1.0);
            float _2751 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2753 = _2751 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2755 = fma(_2749, _2727, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2757 = fma(_2749, _2753, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2759 = fma(_2749, _2733, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2761 = fma(_2749, _2737, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2763 = fma(_2749, _2741, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2765 = fma(_2749, _2745, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2679 = _2759;
            _2697 = _2763;
            _2673 = _2755;
            _2691 = _2761;
            _2685 = _2757;
            _2705 = _2765;
            _2767 = true;
        }
        else
        {
            bool _2769 = _1769 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2771 = isnan(_1769);
            bool _2773 = _2769 || _2771;
            bool _2775 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2777 = _2773 || _2775;
            if (!_2777)
            {
                _2671 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2779 = _2671;
            _2673 = _2779;
            if (!_2777)
            {
                _2677 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2781 = _2677;
            _2679 = _2781;
            if (!_2777)
            {
                _2683 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2783 = _2683;
            _2685 = _2783;
            if (!_2777)
            {
                _2689 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2785 = _2689;
            _2691 = _2785;
            if (!_2777)
            {
                _2695 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2787 = _2695;
            _2697 = _2787;
            if (!_2777)
            {
                _2703 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2789 = _2703;
            bool _2791 = !_2777;
            _2705 = _2789;
            if (!_2791)
            {
                bool _2793 = _1769 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2795 = isnan(_1769);
                bool _2797 = _2793 || _2795;
                bool _2799 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2801 = _2797 || _2799;
                if (!_2801)
                {
                    float _2803 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2805 = _1769 + _2803;
                    float _2807 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2809 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2807;
                    float _2811 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2813 = _2811 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2815 = 1.0 / _2809;
                    float _2817 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2819 = _2817 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2821 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2823 = _2821 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2825 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2827 = _2825 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2829 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2831 = _2829 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2833 = _2805 * _2815;
                    float _2835 = precise::clamp(_2833, 0.0, 1.0);
                    float _2837 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2839 = _2837 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2841 = fma(_2835, _2813, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2843 = fma(_2835, _2839, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2845 = fma(_2835, _2819, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2847 = fma(_2835, _2823, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2849 = fma(_2835, _2827, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2851 = fma(_2835, _2831, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2679 = _2845;
                    _2697 = _2849;
                    _2673 = _2841;
                    _2691 = _2847;
                    _2685 = _2843;
                    _2705 = _2851;
                    _2767 = true;
                }
                else
                {
                    _2679 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2697 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2673 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2691 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2685 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2705 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2767 = false;
    float _2853 = _2679;
    float _2855 = _2697;
    float _2857 = _2673;
    float _2859 = _2691;
    float _2861 = _2685;
    float _2863 = _2705;
    float _2865 = fma(_2667, -0.5, 0.5);
    float _2867 = precise::clamp(_2865, 0.0, 1.0);
    float _2869 = -_2853;
    float _2871 = _2869 + _2855;
    float _2873 = _2669 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2875 = -_2857;
    float _2877 = _2875 + _2859;
    out.m_86.x = 0.0;
    float _2879 = fma(_2867, _2871, _2853);
    float _2881 = fma(_2867, _2877, _2857);
    out.m_59.x = _2873;
    float _2883 = -_2861;
    float _2885 = _2883 + _2863;
    float _2887 = _2879 * 0.586610972881317138671875;
    bool _2889 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2891 = fma(_2867, _2885, _2861);
    float _2893 = fma(_2881, 0.298911988735198974609375, _2887);
    bool _2895 = _1625 > 0.0;
    bool _2897 = isnan(_1625);
    bool _2899 = _2895 || _2897;
    bool _2901 = isnan(0.0);
    bool _2903 = _2899 || _2901;
    float _2905 = fma(_2891, 0.114477999508380889892578125, _2893);
    bool _2907 = _1681 <= 0.0;
    bool _2909 = !_2903;
    bool _2911 = _2907 || _2909;
    float _2913 = -_2905;
    float _2915 = _2881 + _2913;
    float _2917 = -_2905;
    float _2919 = _2879 + _2917;
    float _2921 = -_2905;
    float _2923 = _2891 + _2921;
    float _2925 = fma(_2915, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2905);
    float _2927 = fma(_2919, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2905);
    float _2929 = fma(_2923, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2905);
    bool _2931 = !_2889;
    if (!_2931)
    {
        float _2933 = -_1110;
        float _2935 = _2933 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2937 = -_1112;
        float _2939 = _2937 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2941 = -_1114;
        float _2943 = _2941 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2945 = _2935 * _2935;
        float _2947 = fma(_2939, _2939, _2945);
        float _2949 = fma(_2943, _2943, _2947);
        float _2951 = sqrt(_2949);
        float _2953 = rsqrt(_2949);
        float _2955 = -_2951;
        float _2957 = _2955 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2959 = _2957 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2961 = precise::clamp(_2959, 0.0, 1.0);
        float _2963 = _2939 * _2953;
        float _2965 = _2935 * _2953;
        float _2967 = abs(_2961);
        float _2969 = log2(_2967);
        float _2971 = _2943 * _2953;
        float _2973 = _2963 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2975 = _2667 * _2965;
        float _2977 = -_2965;
        float _2979 = -_2973;
        float _2981 = fma(_2977, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2979);
        float _2983 = fma(_2639, _2963, _2975);
        float _2985 = -_2971;
        float _2987 = fma(_2985, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2981);
        float _2989 = fma(_2599, _2971, _2983);
        float _2991 = precise::clamp(_2989, 0.0, 1.0);
        float _2993 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2995 = _2987 + _2993;
        float _2997 = _2969 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2999 = _2995 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3001 = precise::clamp(_2999, 0.0, 1.0);
        float _3003 = exp2(_2997);
        float _3005 = _3003 * _3001;
        float _3007 = _2991 * _3005;
        float _3009 = _3007 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3011 = _3007 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3013 = _3007 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _3009;
        out.m_86.y = _3011;
        out.m_86.z = _3013;
    }
    out.m_88.x = _2925;
    out.m_88.y = _2927;
    out.m_88.z = _2929;
    if (!_2911)
    {
        return out;
    }
    out.m_59.x = 0.0;
    float _3015 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3015;
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
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2767 = false;
    bool _299 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_56.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    float _117 = _115;
    if (!_111)
    {
        out.m_59.x = 0.0;
    }
    int _119 = 0;
    if (!_111)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3072 = as_type<float>(_123);
        out.gl_Position.z = _3072;
    }
    if (!_111)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _127 = in.m_61.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = 0.0;
    if (_137)
    {
        float _145 = float(_107);
        _143 = _145;
    }
    float _147 = _143;
    bool _149 = _141 >= _147;
    bool _151 = !_137;
    bool _153 = _149 || _151;
    if (_153)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _117;
    if (_153)
    {
        out.m_59.x = 0.0;
    }
    if (_153)
    {
        float _157 = _155 * 5.0;
        _125 = as_type<int>(_157);
    }
    int _159 = _125;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3140 = as_type<float>(_159);
        out.gl_Position.z = _3140;
    }
    if (_153)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _161 = in.m_63.x;
    float _163 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _165 = _141 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _167 = in.m_65.x;
    float _169 = in.m_65.y;
    float _171 = in.m_65.z;
    float _173 = _165 * _163;
    int _175 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _177 = _175 != 0;
    float _179 = fma(_161, (*spvDescriptorSet0.vp_c9)._m0[20].x, _173);
    int _181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _183 = _181 != 0;
    int _185 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _187 = _185 != 0;
    float _189 = floor(_179);
    float _191 = _179 * 6.283185482025146484375;
    float _193 = _169 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _195 = _169 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _197 = _169 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _199 = _191 * 0.15915493667125701904296875;
    bool _201 = !_183;
    int _203 = _201 ? 0 : 1;
    float _205 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].x, _193);
    float _207 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].x, _195);
    float _209 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].x, _197);
    bool _211 = !_187;
    int _213 = _211 ? 0 : 1;
    float _215 = _199 * 6.283185482025146484375;
    float _217 = cos(_215);
    float _219 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].z, _205);
    float _221 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].z, _207);
    int _223 = abs(_213);
    float _225 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].z, _209);
    float _227 = -_189;
    float _229 = _179 + _227;
    int _231 = abs(_203);
    bool _233 = !_177;
    int _235 = _233 ? 0 : 1;
    bool _237 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _239 = abs(_235);
    float _241 = float(_231);
    float _243 = -_229;
    float _245 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _247 = fma(_217, 0.5, 0.5);
    bool _249 = _229 < 0.5;
    float _251 = float(_249);
    float _253 = abs(_245);
    float _255 = _241 * _253;
    float _257 = -_247;
    float _259 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _261 = float(_239);
    float _263 = -_251;
    float _265 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _267 = float(_223);
    float _269 = fma(_261, _259, _255);
    float _271 = abs(_265);
    float _273 = fma(_267, _271, _269);
    bool _275 = !_237;
    float _277 = _219;
    float _295;
    float _297;
    if (!_275)
    {
        float _279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _281 = _161 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _283 = float(_107);
        float _285 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _287 = _285 * _279;
        float _289 = floor(_287);
        float _291 = -_289;
        float _293 = _287 + _291;
        _295 = _293;
        _297 = _283;
        _299 = true;
    }
    else
    {
        float _301 = float(_107);
        float _303 = 1.0 / _301;
        float _305 = _141 * _303;
        _295 = _305;
        _297 = _301;
    }
    _299 = false;
    float _307 = _295;
    float _309 = _297;
    float _311 = in.m_56.x;
    float _313 = in.m_56.y;
    float _315 = in.m_56.z;
    float _317 = _313 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _319 = _313 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _321 = fma(_311, (*spvDescriptorSet0.vp_c10)._m0[4].x, _317);
    float _323 = fma(_311, (*spvDescriptorSet0.vp_c10)._m0[6].x, _319);
    float _325 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[4].z, _321);
    float _327 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[6].z, _323);
    float _329 = _325 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _331 = _327 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _333 = fma(_329, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _335 = fma(_331, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _337 = floor(_333);
    float _339 = floor(_335);
    float _341 = -_337;
    float _343 = _333 + _341;
    float _345 = -_339;
    float _347 = _335 + _345;
    float2 _3439 = float2(_343, _347);
    float _349 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3439, float2(0.0), isnan(_3439)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3439, float2(0.0), isnan(_3439)), level(0.0)).x;
    float _351 = _313 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _353 = as_type<float>(int(gl_VertexIndex));
    bool _355 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _357 = isnan(_307);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _363 = _359 || _361;
    float _365 = float(_363);
    float _367 = fma(_311, (*spvDescriptorSet0.vp_c10)._m0[5].x, _351);
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _375 = _307 + _373;
    float _377 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[5].z, _367);
    float _379 = 1.0 / _371;
    float _381 = _377 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _383 = _381 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _385 = fma(_329, (*spvDescriptorSet0.vp_c8)._m0[11].x, _383);
    float _387 = fma(_331, (*spvDescriptorSet0.vp_c8)._m0[11].z, _385);
    bool _389 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _391 = isnan(_307);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    float _401 = _375 * _379;
    float _403 = _381 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _405 = _387 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _407 = in.m_70.x;
    float _409 = in.m_70.y;
    float _411 = fma(_329, (*spvDescriptorSet0.vp_c8)._m0[10].x, _403);
    float _413 = 1.0 / _405;
    int _415 = as_type<int>(_353) & 1;
    bool _417 = _415 != 0;
    int _419 = as_type<int>(_353) & 2;
    bool _421 = _419 != 0;
    float _423 = fma(_331, (*spvDescriptorSet0.vp_c8)._m0[10].z, _411);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _425;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _429;
    bool _433 = !_421;
    float _435 = _433 ? (-0.5) : 0.5;
    float _437 = _423 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _439 = -_365;
    float _441 = _439 + 1.0;
    float _443 = fma(_427, _401, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _445 = fma(_431, _401, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _447 = _437 + _405;
    float _449 = _399 * _441;
    float _451 = -_399;
    float _453 = _451 + 1.0;
    bool _455 = !_417;
    float _457 = _455 ? (-0.5) : 0.5;
    float _459 = _447 * _413;
    float _461 = _459 * 0.5;
    float _463 = _443 * _449;
    float _465 = _445 * _449;
    float _467 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _469 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _471 = fma(_461, (*spvDescriptorSet0.vp_c8)._m0[30].w, _469);
    float _473 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[143].x, _463);
    float _475 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[143].y, _465);
    float _477 = _381 + _467;
    float _479 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _481 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[144].x, _473);
    float _483 = 1.0 / _471;
    float _485 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[144].y, _475);
    float _487 = _477 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _489 = _477 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _491 = _481 * _407;
    float _493 = _485 * _409;
    float _495 = fma(_329, (*spvDescriptorSet0.vp_c15)._m0[126].x, _487);
    float _497 = fma(_329, (*spvDescriptorSet0.vp_c15)._m0[127].x, _489);
    float _499 = _273 * _491;
    float _501 = _273 * _493;
    float _503 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _435);
    float _505 = fma(_331, (*spvDescriptorSet0.vp_c15)._m0[126].z, _495);
    float _507 = fma(_331, (*spvDescriptorSet0.vp_c15)._m0[127].z, _497);
    float _509 = _501 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _511 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _457);
    float _513 = _499 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _515 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _517 = _483 * _515;
    float _519 = _509 * _503;
    float _521 = _505 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _523 = _507 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _525 = _513 * _511;
    bool _527 = _517 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _529 = _519 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _531 = _517 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _533 = trunc(_521);
    int _535 = int(_533);
    float _537 = _519 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _539 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[26].x, _529);
    bool _541 = !_527;
    int _543 = _541 ? 0 : 1;
    float _545 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[24].x, _537);
    float _547 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[26].z, _539);
    float _549 = trunc(_523);
    int _551 = int(_549);
    float _553 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[24].z, _545);
    int _555 = 2;
    int _557 = as_type<int>(_519);
    int _559 = as_type<int>(_525);
    float _561 = _477;
    float _563 = _331;
    if (!_527)
    {
        _555 = 1;
    }
    int _565 = _555;
    float _567 = _547 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _569 = _565;
    if (!_531)
    {
        _569 = _543;
    }
    int _571 = _569;
    float _573 = _553 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _575 = _331 + _567;
    int _577 = _571 << 6;
    float _579 = _329 + _573;
    int _581 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _583 = _535 + _581;
    int _585 = _583 + 1;
    float _587 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _589 = _575 + _587;
    int _591 = _577 + 56;
    uint _594 = uint(int(uint(_591) >> uint(2)));
    uint _596 = uint(int(uint(int(_594)) >> uint(2)));
    int _598 = int(_594) & 3;
    float _600 = (*spvDescriptorSet0.vp_c15)._m0[int(_596)][_598];
    int _602 = int(_594) + 1;
    uint _604 = uint(int(uint(_602) >> uint(2)));
    int _606 = _602 & 3;
    float _608 = (*spvDescriptorSet0.vp_c15)._m0[int(_604)][_606];
    float _610 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _612 = _579 + _610;
    bool _614 = _585 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _616 = _589 * _589;
    int _618 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _620 = _551 + _618;
    int _622 = _620 + 1;
    float _624 = fma(_612, _612, _616);
    int _626 = _577 + 48;
    uint _628 = uint(int(uint(_626) >> uint(2)));
    uint _630 = uint(int(uint(int(_628)) >> uint(2)));
    int _632 = int(_628) & 3;
    float _634 = (*spvDescriptorSet0.vp_c15)._m0[int(_630)][_632];
    int _636 = int(_628) + 1;
    uint _638 = uint(int(uint(_636) >> uint(2)));
    int _640 = _636 & 3;
    float _642 = (*spvDescriptorSet0.vp_c15)._m0[int(_638)][_640];
    int _644 = _585 | _622;
    float _646 = sqrt(_624);
    bool _648 = _644 < 0;
    bool _650 = _648 || _614;
    float _652 = _519 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _654 = _577 + 64;
    uint _656 = uint(int(uint(_654) >> uint(2)));
    uint _658 = uint(int(uint(int(_656)) >> uint(2)));
    int _660 = int(_656) & 3;
    float _662 = (*spvDescriptorSet0.vp_c15)._m0[int(_658)][_660];
    int _664 = int(_656) + 1;
    uint _666 = uint(int(uint(_664) >> uint(2)));
    int _668 = _664 & 3;
    float _670 = (*spvDescriptorSet0.vp_c15)._m0[int(_666)][_668];
    bool _672 = _622 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _674 = _672 || _650;
    float _676 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[25].x, _652);
    float _678 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[25].z, _676);
    int _680 = _577 + 72;
    uint _682 = uint(int(uint(_680) >> uint(2)));
    uint _684 = uint(int(uint(int(_682)) >> uint(2)));
    int _686 = int(_682) & 3;
    float _688 = (*spvDescriptorSet0.vp_c15)._m0[int(_684)][_686];
    int _690 = int(_682) + 1;
    uint _692 = uint(int(uint(_690) >> uint(2)));
    int _694 = _690 & 3;
    float _696 = (*spvDescriptorSet0.vp_c15)._m0[int(_692)][_694];
    float _698 = _678 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _700 = _646 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _702 = _622;
    float _704 = _579;
    float _706 = _575;
    float _708 = as_type<float>(_571);
    if (!_674)
    {
        int _710 = _622 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _712 = _710 + _585;
        _557 = _712;
    }
    int _714 = _557;
    int _716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _718 = _716 != 0;
    int _720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _722 = _720 != 0;
    int _724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _726 = _724 != 0;
    int _728 = _577 + 96;
    uint _730 = uint(int(uint(_728) >> uint(2)));
    uint _732 = uint(int(uint(int(_730)) >> uint(2)));
    int _734 = int(_730) & 3;
    float _736 = (*spvDescriptorSet0.vp_c15)._m0[int(_732)][_734];
    int _738 = int(_730) + 1;
    uint _740 = uint(int(uint(_738) >> uint(2)));
    int _742 = _738 & 3;
    float _744 = (*spvDescriptorSet0.vp_c15)._m0[int(_740)][_742];
    float _746 = _381 + _698;
    if (!_674)
    {
        int _748 = _714 << 2;
        _702 = _748;
    }
    int _750 = _702;
    int _752 = _750;
    if (!_674)
    {
        uint _754 = uint(int(uint(_714) >> uint(2)));
        _559 = int(_754);
    }
    int _756 = _559;
    float _758 = as_type<float>(_756);
    if (!_674)
    {
        int _760 = 12 & _750;
        _752 = _760;
    }
    int _762 = _752;
    int _764 = _577 + 104;
    uint _766 = uint(int(uint(_764) >> uint(2)));
    uint _768 = uint(int(uint(int(_766)) >> uint(2)));
    int _770 = int(_766) & 3;
    float _772 = (*spvDescriptorSet0.vp_c15)._m0[int(_768)][_770];
    int _774 = int(_766) + 1;
    uint _776 = uint(int(uint(_774) >> uint(2)));
    int _778 = _774 & 3;
    float _780 = (*spvDescriptorSet0.vp_c15)._m0[int(_776)][_778];
    bool _782 = !_722;
    int _784 = _782 ? 0 : 1;
    if (!_674)
    {
        int _786 = _756 << 4;
        int _788 = _786 + _762;
        _758 = as_type<float>(_788);
    }
    float _790 = _758;
    bool _792 = !_718;
    int _794 = _792 ? 0 : 1;
    bool _796 = !_726;
    int _798 = _796 ? 0 : 1;
    float _800 = 0.0;
    if (!_700)
    {
        _800 = _746;
    }
    float _802 = _800;
    bool _804 = !_700;
    float _806 = _802;
    float _808 = _744;
    float _810 = _600;
    float _812 = _780;
    if (!_804)
    {
        float _814 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _816 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _818 = _646 + _816;
        float _820 = rsqrt(_624);
        float _822 = _818 * _814;
        float _824 = _746 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _826 = _822 * 0.15915493667125701904296875;
        float _828 = _826 * 6.283185482025146484375;
        float _830 = cos(_828);
        float _832 = _826 * 6.283185482025146484375;
        float _834 = sin(_832);
        float _836 = _830 + (-1.0);
        float _838 = _836 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _840 = fma(_834, _824, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _842 = fma(_746, _830, _838);
        float _844 = _820 * _840;
        float _846 = fma(_612, _844, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _848 = fma(_589, _844, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _806 = _842;
        _704 = _846;
        _706 = _848;
    }
    float _850 = _806;
    float _852 = _704;
    float _854 = _706;
    float _856 = -_381;
    float _858 = _856 + _850;
    int _860 = _577 + 80;
    uint _862 = uint(int(uint(_860) >> uint(2)));
    uint _864 = uint(int(uint(int(_862)) >> uint(2)));
    int _866 = int(_862) & 3;
    float _868 = (*spvDescriptorSet0.vp_c15)._m0[int(_864)][_866];
    int _870 = int(_862) + 1;
    uint _872 = uint(int(uint(_870) >> uint(2)));
    int _874 = _870 & 3;
    float _876 = (*spvDescriptorSet0.vp_c15)._m0[int(_872)][_874];
    float _878 = -_329;
    float _880 = _878 + _852;
    float _882 = -_331;
    float _884 = _882 + _854;
    float _886 = _858 * _858;
    float _888 = _477 * _744;
    float _890 = _477 * _670;
    float _892 = _852;
    float _894 = _850;
    float _896 = _854;
    float _898 = _858;
    if (!_674)
    {
        float _900 = floor(_523);
        _808 = _900;
    }
    float _902 = _808;
    float _904 = fma(_880, _880, _886);
    int _906 = _577 + 88;
    uint _908 = uint(int(uint(_906) >> uint(2)));
    uint _910 = uint(int(uint(int(_908)) >> uint(2)));
    int _912 = int(_908) & 3;
    float _914 = (*spvDescriptorSet0.vp_c15)._m0[int(_910)][_912];
    int _916 = int(_908) + 1;
    uint _918 = uint(int(uint(_916) >> uint(2)));
    int _920 = _916 & 3;
    float _922 = (*spvDescriptorSet0.vp_c15)._m0[int(_918)][_920];
    float _924 = fma(_329, _736, _888);
    float _926 = fma(_884, _884, _904);
    bool _928 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _930 = isnan(0.5);
    bool _932 = _928 || _930;
    bool _934 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _936 = _932 || _934;
    float _938 = fma(_331, _772, _924);
    float _940 = _477 * _642;
    float _942 = sqrt(_926);
    float _944 = _790;
    if (!_674)
    {
        int _946 = as_type<int>(_790) + 400;
        uint _948 = uint(int(uint(_946) >> uint(2)));
        uint _950 = uint(int(uint(int(_948)) >> uint(2)));
        int _952 = int(_948) & 3;
        float _954 = (*spvDescriptorSet0.vp_c15)._m0[int(_950)][_952];
        _944 = _954;
    }
    float _956 = _944;
    float _958 = _938 + _780;
    float _960 = fma(_329, _662, _890);
    float _962 = fma(_329, _634, _940);
    float _964 = fma(_331, _688, _960);
    float _966 = _904;
    float _968 = _958;
    if (!_674)
    {
        float _970 = floor(_521);
        _966 = _970;
    }
    float _972 = _966;
    float _974 = fma(_331, _600, _962);
    float _976 = _964 + _696;
    float _978 = _974 + _608;
    bool _980 = _942 > 0.0;
    float _982 = 1.0 / _958;
    bool _984 = !_980;
    if (!_984)
    {
        float _986 = _221 * _221;
        float _988 = fma(_219, _219, _986);
        float _990 = fma(_225, _225, _988);
        float _992 = rsqrt(_926);
        float _994 = sqrt(_990);
        float _996 = _880 * _992;
        float _998 = _858 * _992;
        float _1000 = _884 * _992;
        bool _1002 = _994 > 0.0;
        bool _1004 = !_1002;
        _898 = _998;
        _810 = _992;
        if (!_1004)
        {
            float _1006 = rsqrt(_990);
            float _1008 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1010 = _221 * _1006;
            float _1012 = _219 * _1006;
            float _1014 = _225 * _1006;
            float _1016 = _998 * _1010;
            float _1018 = fma(_996, _1012, _1016);
            float _1020 = _1008 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1022 = fma(_1000, _1014, _1018);
            float _1024 = _1022 * _1020;
            float _1026 = fma(_219, _1024, _852);
            float _1028 = fma(_221, _1024, _850);
            float _1030 = fma(_225, _1024, _854);
            _892 = _1026;
            _894 = _1028;
            _896 = _1030;
            _810 = _1024;
        }
    }
    float _1032 = _892;
    float _1034 = _894;
    float _1036 = _896;
    float _1038 = _898;
    float _1040 = _810;
    float _1042 = _1040;
    float _1044 = _1038;
    float _1046 = _1034;
    if (_936)
    {
        _277 = _1032;
    }
    float _1048 = _277;
    float _1050 = _1048;
    if (_936)
    {
        _968 = _1034;
    }
    float _1052 = _968;
    float _1054 = _1052;
    if (_936)
    {
        _812 = _1036;
    }
    float _1056 = _812;
    float _1058 = _1056;
    if (!_936)
    {
        float _1060 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1062 = _381 + _1060;
        float _1064 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1066 = _329 + _1064;
        float _1068 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1070 = -_329;
        float _1072 = _1070 + _1032;
        float _1074 = _1062 * _1062;
        float _1076 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1078 = _331 + _1076;
        float _1080 = -_331;
        float _1082 = _1080 + _1036;
        float _1084 = fma(_1066, _1066, _1074);
        float _1086 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1088 = fma(_1078, _1078, _1084);
        float _1090 = sqrt(_1088);
        float _1092 = _1068 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1094 = precise::min(_1090, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1096 = _1094 * _1086;
        float _1098 = -_381;
        float _1100 = _1098 + _1034;
        float _1102 = _1092 * _1096;
        float _1104 = fma(_1100, _1102, _381);
        float _1106 = fma(_1072, _1102, _329);
        float _1108 = fma(_1082, _1102, _331);
        _1054 = _1104;
        _1050 = _1106;
        _1058 = _1108;
        _1042 = _1090;
    }
    float _1110 = _1054;
    float _1112 = _1050;
    float _1114 = _1058;
    float _1116 = _1042;
    float _1118 = _1110 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1120 = _978 * _982;
    float _1122 = _1110 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1124 = _1110 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1126 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1118);
    float _1128 = _1116;
    if (!_674)
    {
        float _1130 = rint(_956);
        float _1132 = precise::max(_1130, 0.0);
        uint _1134 = uint(_1132);
        uint _1136 = clamp(_1134, 0u, 65535u);
        _1128 = as_type<float>(_1136);
    }
    float _1138 = _1128;
    float _1140 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1122);
    bool _1142 = _1120 >= 0.0;
    float _1144 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1126);
    float _1146 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1124);
    float _1148 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1140);
    float _1150 = _1110 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1152 = _976 * _982;
    bool _1154 = _1120 <= 1.0;
    bool _1156 = _1154 && _1142;
    float _1158 = _1144 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1160 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1146);
    float _1162 = _1148 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1164 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1150);
    float _1166 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1168 = _1160 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1170 = _1152 >= 0.0;
    bool _1172 = _1170 && _1156;
    float _1174 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1164);
    float _1176 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1166);
    float _1178 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1180 = _1168 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1182 = _1152 <= 1.0;
    bool _1184 = _1182 && _1172;
    float _1186 = _1174 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1188 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1176);
    float _1190 = -_1180;
    float _1192 = fma(_1190, _1178, 1.0);
    float _1194 = _477 * _876;
    float _1196 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1198 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1188);
    float _1200 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1202 = fma(_329, _868, _1194);
    float _1204 = log2(_1192);
    float _1206 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1196);
    float _1208 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1200);
    float _1210 = fma(_331, _914, _1202);
    if (_1184)
    {
        float _1212 = float(_571);
        _708 = _1212;
    }
    float _1214 = _708;
    float _1216 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1206);
    float _1218 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1208);
    float _1220 = _1210 + _922;
    float _1222 = 1.0 / _1198;
    float _1224 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1216);
    float _1226 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1218);
    float _1228 = _1218;
    float _1230 = _1226;
    if (!_674)
    {
        float _1232 = -_902;
        float _1234 = _523 + _1232;
        _1044 = _1234;
    }
    float _1236 = _1044;
    if (!_674)
    {
        float _1238 = -_972;
        float _1240 = _521 + _1238;
        _1228 = _1240;
    }
    float _1242 = _1228;
    float _1244 = _1220 * _982;
    float _1246 = _1196;
    float _1248 = _1244;
    if (_1184)
    {
        float _1250 = rint(_1214);
        float _1252 = precise::max(_1250, 0.0);
        uint _1254 = uint(_1252);
        uint _1256 = clamp(_1254, 0u, 65535u);
        _1246 = as_type<float>(_1256);
    }
    float _1258 = _1246;
    float _1260 = _1204 * 0.693147182464599609375;
    float _1262 = _1224 * _1222;
    float _1264 = _1226 * _1222;
    float _1266 = _1260 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1268 = fma(_1262, 0.5, 0.5);
    float _1270 = fma(_1264, -0.5, 0.5);
    float _1272 = _1236;
    if (!_674)
    {
        float3 _4962 = float3(_1242, _1236, float(as_type<int>(_1138)));
        float3 _4966 = select(_4962, float3(0.0), isnan(_4962));
        float _1274 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4966.xy, uint(rint(_4966.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4966.xy, uint(rint(_4966.z)), level(0.0)).x;
        _1272 = _1274;
    }
    float _1276 = _1272;
    float _1278 = _523;
    if (_1184)
    {
        float3 _4981 = float3(_1120, _1152, float(as_type<int>(_1258)));
        float3 _4983 = select(_4981, float3(0.0), isnan(_4981));
        float _1280 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4983.xy, uint(rint(_4983.z)), _1244, level(0.0));
        _1278 = _1280;
    }
    float _1282 = _1278;
    float3 _4993 = float3(_1268, _1270, _1266);
    float _1284 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4993, float3(0.0), isnan(_4993)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4993, float3(0.0), isnan(_4993)), level(0.0)).x;
    float3 _5002 = float3(_1268, _1270, _1266);
    float4 _1287 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5002, float3(0.0), isnan(_5002)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5002, float3(0.0), isnan(_5002)), level(0.0)).xyzw;
    float _1289 = _1287.x;
    float _1291 = _1287.y;
    float _1293 = _1287.z;
    float _1295 = _1287.w;
    float _1297 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1299 = int(_1297);
    int _1301 = abs(_784);
    int _1303 = abs(_798);
    float _1305 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1307 = int(_1305);
    float _1309 = float(_1299);
    float _1311 = 1.0 / _1309;
    float _1313 = float(uint(_1307));
    float _1315 = 1.0 / _309;
    int _1317 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1319 = _1317 != 0;
    float _1321 = _141 * _1311;
    float _1323 = 1.0 / _1313;
    float _1325 = trunc(_1321);
    int _1327 = int(_1325);
    int _1329 = as_type<int>(_1323) + (-2);
    int _1331 = ~_1307;
    int _1333 = _1331 + 1;
    float _1335 = float(uint(_1327));
    float _1337 = float(_1327);
    float _1339 = as_type<float>(_1329) * _1335;
    int _1341 = ~_1307;
    int _1343 = _1341 + 1;
    float _1345 = trunc(_1339);
    float _1347 = precise::max(_1345, 0.0);
    uint _1349 = uint(_1347);
    int _1351 = _1343 * int(_1349);
    int _1353 = _1351 + _1327;
    float _1355 = float(uint(_1353));
    float _1357 = as_type<float>(_1329) * _1355;
    bool _1359 = !_1319;
    float _1361 = _1359 ? 7.345489978790283203125 : 1.0;
    float _1363 = trunc(_1357);
    float _1365 = precise::max(_1363, 0.0);
    uint _1367 = uint(_1365);
    float _1369 = _1361 * _161;
    float _1371 = floor(_1369);
    int _1373 = int(_1349) + int(_1367);
    float _1375 = float(_1307);
    int _1377 = _1333 * _1373;
    int _1379 = _1377 + _1327;
    bool _1381 = _1337 >= _1375;
    bool _1383 = isnan(_1337);
    bool _1385 = _1381 || _1383;
    bool _1387 = isnan(_1375);
    bool _1389 = _1385 || _1387;
    float _1391 = float(_1389);
    float _1393 = -_1371;
    float _1395 = _1369 + _1393;
    bool _1397 = uint(_1379) >= uint(_1307);
    float _1399 = trunc(_1391);
    int _1401 = int(_1399);
    float _1403 = _1395 * _1375;
    bool _1405 = !_1397;
    int _1407 = _1405 ? 0 : (-1);
    float _1409 = _141 * _1375;
    bool _1411 = _1307 == 0;
    int _1413 = ~_1373;
    int _1415 = _1413 + _1407;
    int _1417 = _1415 + 1;
    float _1419 = _1409 * _1315;
    float _1421 = trunc(_1403);
    int _1423 = int(_1421);
    int _1425 = _1307 * _1417;
    int _1427 = _1425 + _1327;
    int _1429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1431 = _1429 != 0;
    int _1433 = _1307 + (-1);
    int _1435 = ~_1401;
    int _1437 = _1435 + 1;
    int _1439 = _1437 + 1;
    float _1441 = trunc(_1419);
    int _1443 = int(_1441);
    bool _1445 = !_1411;
    int _1447 = _1445 ? _1427 : (-1);
    bool _1449 = !_1431;
    int _1451 = _1449 ? 0 : 1;
    int _1453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1455 = _1453 != 0;
    int _1457 = _1447 * _1439;
    int _1459 = abs(_1451);
    int _1461 = abs(_794);
    int _1463 = _1401 * _1433;
    int _1465 = _1463 + _1457;
    int _1467 = _1423 * _1459;
    int _1469 = _1467 + _1327;
    bool _1471 = !_1455;
    int _1473 = _1471 ? 0 : 1;
    int _1475 = ~_1307;
    int _1477 = _1475 + 1;
    int _1479 = _1465 * _1301;
    int _1481 = abs(_1473);
    int _1483 = _1443 * _1461;
    int _1485 = _1483 + _1479;
    bool _1487 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1489 = isnan(0.5);
    bool _1491 = _1487 || _1489;
    bool _1493 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1495 = _1491 || _1493;
    int _1497 = _1469 * _1303;
    int _1499 = _1497 + _1485;
    float _1501 = as_type<float>(_1301);
    float _1503 = as_type<float>(_1461);
    float _1505 = as_type<float>(_1477);
    float _1507 = as_type<float>(_1303);
    if (_674)
    {
        _1501 = 1.0;
    }
    float _1509 = _1501;
    int _1511 = _1423 * _1481;
    int _1513 = _1511 + _1499;
    int _1515 = ~_1307;
    int _1517 = _1515 + 1;
    float _1519 = float(uint(_1513));
    float _1521 = _1509;
    if (_1495)
    {
        _1503 = 1.0;
    }
    float _1523 = _1503;
    float _1525 = as_type<float>(_1329) * _1519;
    float _1527 = trunc(_1525);
    float _1529 = precise::max(_1527, 0.0);
    uint _1531 = uint(_1529);
    int _1533 = _1517 * int(_1531);
    int _1535 = _1533 + _1513;
    float _1537 = float(uint(_1535));
    float _1539 = as_type<float>(_1329) * _1537;
    float _1541 = trunc(_1539);
    float _1543 = precise::max(_1541, 0.0);
    uint _1545 = uint(_1543);
    int _1547 = int(_1531) + int(_1545);
    float _1549 = _1523;
    if (_1495)
    {
        _1505 = 1.0;
    }
    float _1551 = _1505;
    int _1553 = _1477 * _1547;
    int _1555 = _1553 + _1513;
    bool _1557 = uint(_1555) >= uint(_1307);
    bool _1559 = !_1557;
    int _1561 = _1559 ? 0 : (-1);
    int _1563 = ~_1547;
    int _1565 = _1563 + _1561;
    int _1567 = _1565 + 1;
    int _1569 = _1307 * _1567;
    int _1571 = _1569 + _1513;
    float _1573 = _1551;
    float _1575 = _1289;
    if (!_1495)
    {
        float _1577 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1579 = _1577 * 0.15915493667125701904296875;
        float _1581 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1583 = _1579 * 6.283185482025146484375;
        float _1585 = cos(_1583);
        float _1587 = _1581 * 0.15915493667125701904296875;
        float _1589 = _1579 * 6.283185482025146484375;
        float _1591 = sin(_1589);
        float _1593 = 1.0 / _1585;
        float _1595 = _1587 * 6.283185482025146484375;
        float _1597 = cos(_1595);
        float _1599 = _1591 * _1593;
        float _1601 = _1587 * 6.283185482025146484375;
        float _1603 = sin(_1601);
        float _1605 = _1597 * _1599;
        float _1607 = 1.0 / _1605;
        float _1609 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1611 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1609;
        float _1613 = 1.0 / _1611;
        float _1615 = _1603 * _1607;
        float _1617 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1619 = fma(_517, _1615, _1617);
        float _1621 = _1619 * _1613;
        float _1623 = precise::clamp(_1621, 0.0, 1.0);
        _1549 = _1623;
    }
    float _1625 = _1549;
    if (!_1495)
    {
        float _1627 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1629 = _1627 * 0.15915493667125701904296875;
        float _1631 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1633 = _1629 * 6.283185482025146484375;
        float _1635 = cos(_1633);
        float _1637 = _1631 * 0.15915493667125701904296875;
        float _1639 = _1629 * 6.283185482025146484375;
        float _1641 = sin(_1639);
        float _1643 = 1.0 / _1635;
        float _1645 = _1637 * 6.283185482025146484375;
        float _1647 = cos(_1645);
        float _1649 = _1641 * _1643;
        float _1651 = _1637 * 6.283185482025146484375;
        float _1653 = sin(_1651);
        float _1655 = _1647 * _1649;
        float _1657 = 1.0 / _1655;
        float _1659 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1661 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1659;
        float _1663 = 1.0 / _1661;
        float _1665 = _1653 * _1657;
        float _1667 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1669 = fma(_517, _1665, _1667);
        float _1671 = _1669 * _1663;
        float _1673 = precise::clamp(_1671, 0.0, 1.0);
        float _1675 = -_1673;
        float _1677 = _1675 + 1.0;
        _1507 = _1655;
        _1573 = _1677;
    }
    float _1679 = _1507;
    float _1681 = _1573;
    float _1683 = _1679;
    if (!_674)
    {
        int _1685 = _714 << 4;
        int _1687 = _1685 + 2048;
        uint _1689 = uint(int(uint(_1687) >> uint(2)));
        uint _1691 = uint(int(uint(int(_1689)) >> uint(2)));
        int _1693 = int(_1689) & 3;
        float _1695 = (*spvDescriptorSet0.vp_c15)._m0[int(_1691)][_1693];
        int _1697 = int(_1689) + 1;
        uint _1699 = uint(int(uint(_1697) >> uint(2)));
        int _1701 = _1697 & 3;
        float _1703 = (*spvDescriptorSet0.vp_c15)._m0[int(_1699)][_1701];
        int _1705 = _1687 + 8;
        uint _1707 = uint(int(uint(_1705) >> uint(2)));
        uint _1709 = uint(int(uint(int(_1707)) >> uint(2)));
        int _1711 = int(_1707) & 3;
        float _1713 = (*spvDescriptorSet0.vp_c15)._m0[int(_1709)][_1711];
        int _1715 = int(_1707) + 1;
        uint _1717 = uint(int(uint(_1715) >> uint(2)));
        int _1719 = _1715 & 3;
        float _1721 = (*spvDescriptorSet0.vp_c15)._m0[int(_1717)][_1719];
        float _1723 = _477 * _1703;
        float _1725 = fma(_329, _1695, _1723);
        float _1727 = fma(_331, _1713, _1725);
        float _1729 = _1727 + _1721;
        float _1731 = precise::clamp(_1729, 0.0, 1.0);
        float _1733 = -_1731;
        float _1735 = _1733 + _1276;
        float _1737 = fma(_1735, 500.0, 1.5);
        float _1739 = exp2(_1737);
        float _1741 = 0.0 + _1739;
        float _1743 = precise::clamp(_1741, 0.0, 1.0);
        _561 = _1723;
        _1521 = _1743;
    }
    float _1745 = _561;
    float _1747 = _1521;
    float _1749 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1751 = _1110 + _1749;
    float _1753 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1755 = _1112 + _1753;
    float _1757 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1759 = _1114 + _1757;
    float _1761 = _1751 * _1751;
    float _1763 = fma(_1755, _1755, _1761);
    float _1765 = fma(_1759, _1759, _1763);
    float _1767 = rsqrt(_1765);
    float _1769 = sqrt(_1765);
    float _1771 = _1767 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1773 = _1755 * _1771;
    float _1775 = _1759 * _1771;
    float _1777 = _1773 * _1773;
    float _1779 = _1775 * _1775;
    float _1781 = _1777 + _1779;
    float _1783 = sqrt(_1781);
    bool _1785 = _1783 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1787 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1789 = _1783 + _1787;
    float _1791 = _1767;
    float _1793 = _1745;
    float _1795 = _1789;
    float _1797 = _1751;
    if (_1785)
    {
        float _1799 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1791 = _1799;
    }
    float _1801 = _1791;
    if (_1785)
    {
        float _1803 = rsqrt(_1781);
        _1793 = _1803;
    }
    float _1805 = _1793;
    float _1807 = _1805;
    if (_1785)
    {
        float _1809 = _1789 * _1801;
        _1795 = _1809;
    }
    float _1811 = _1795;
    if (_1785)
    {
        float _1813 = _1811 * 0.15915493667125701904296875;
        _563 = _1813;
    }
    float _1815 = _563;
    float _1817 = _1759;
    if (_1785)
    {
        float _1819 = _1815 * 6.283185482025146484375;
        float _1821 = sin(_1819);
        _1817 = _1821;
    }
    float _1823 = _1817;
    float _1825 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1827 = precise::max(0.0, _1825);
    float _1829 = _1801;
    float _1831 = _1827;
    if (_1785)
    {
        float _1833 = _1815 * 6.283185482025146484375;
        float _1835 = cos(_1833);
        _1829 = _1835;
    }
    float _1837 = _1829;
    float _1839 = -_1771;
    float _1841 = -_1827;
    float _1843 = fma(_1751, _1839, _1841);
    if (_1785)
    {
        float _1845 = _1843 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1797 = _1845;
    }
    float _1847 = _1797;
    float _1849 = _1847;
    float _1851 = _1823;
    if (_1785)
    {
        float _1853 = fma(_1823, _1847, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1849 = _1853;
    }
    float _1855 = _1849;
    float _1857 = _1855;
    if (!_1785)
    {
        _1851 = _1773;
    }
    float _1859 = _1851;
    float _1861 = _1859;
    float _1863 = _1837;
    if (_1785)
    {
        float _1865 = _1837 + (-1.0);
        _1831 = _1865;
    }
    float _1867 = _1831;
    float _1869 = _1867;
    if (_1785)
    {
        float _1871 = _1805 * _1855;
        _1046 = _1871;
    }
    float _1873 = _1046;
    if (!_1785)
    {
        _1857 = _1843;
    }
    float _1875 = _1857;
    float _1877 = _1875;
    if (_1785)
    {
        float _1879 = _1867 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1683 = _1879;
    }
    float _1881 = _1683;
    if (_1785)
    {
        float _1883 = _1773 * _1873;
        _1861 = _1883;
    }
    float _1885 = _1861;
    if (!_1785)
    {
        _1869 = _1775;
    }
    float _1887 = _1869;
    float _1889 = _1887;
    if (_1785)
    {
        float _1891 = _1775 * _1873;
        _1889 = _1891;
    }
    float _1893 = _1889;
    if (!_1785)
    {
        _1807 = _1777;
    }
    float _1895 = _1807;
    float _1897 = _1895;
    if (_1785)
    {
        float _1899 = fma(_1843, _1837, _1881);
        _1877 = _1899;
    }
    float _1901 = _1877;
    if (_1785)
    {
        float _1903 = _1885 * _1885;
        _1897 = _1903;
    }
    float _1905 = _1897;
    if (!_1785)
    {
        _1863 = _1779;
    }
    float _1907 = _1863;
    float _1909 = _1907;
    if (_1785)
    {
        float _1911 = _1893 * _1893;
        _1909 = _1911;
    }
    float _1913 = _1909;
    float _1915 = float(uint(_1469));
    float _1917 = fma(_1901, _1901, _1905);
    float _1919 = _1917 + _1913;
    float _1921 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1923 = fma(_1769, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1921);
    float _1925 = precise::clamp(_1923, 0.0, 1.0);
    float _1927 = as_type<float>(_1329) * _1915;
    float _1929 = -_1925;
    float _1931 = _1929 + 1.0;
    float _1933 = rsqrt(_1919);
    float _1935 = abs(_1931);
    float _1937 = log2(_1935);
    float _1939 = _1933 * _1885;
    float _1941 = _1933 * _1901;
    float _1943 = _1933 * _1893;
    float _1945 = trunc(_1927);
    float _1947 = precise::max(_1945, 0.0);
    uint _1949 = uint(_1947);
    float _1951 = _1939 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1953 = -_1951;
    float _1955 = fma(_1941, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1953);
    float _1957 = -_1943;
    float _1959 = fma(_1957, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1955);
    float _1961 = _1937 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1963 = fma(_1959, -0.5, 0.5);
    float _1965 = fma(_1959, 0.5, 0.5);
    float _1967 = exp2(_1961);
    float _1969 = fma(_1965, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1971 = fma(_1965, _1969, -0.212114393711090087890625);
    float _1973 = _1941 + 1.0;
    float _1975 = sqrt(_1963);
    float _1977 = fma(_1965, _1971, 1.570728778839111328125);
    float _1979 = -_1941;
    float _1981 = fma(_1967, _1973, _1979);
    bool _1983 = !_1411;
    int _1985 = _1983 ? _1571 : (-1);
    int _1987 = ~_1307;
    int _1989 = _1987 + 1;
    int _1991 = _1985 >> 31;
    float _1993 = _1975 * 0.636619746685028076171875;
    float _1995 = -_1977;
    float _1997 = fma(_1993, _1995, 1.0);
    float _1999 = fma(_1981, 0.5, 0.5);
    float2 _6005 = float2(_1997, _1999);
    float3 _2003 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6005, float2(0.0), isnan(_6005)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6005, float2(0.0), isnan(_6005)), level(0.0)).xyz;
    float _2005 = _2003.x;
    float _2007 = _2003.y;
    float _2009 = _2003.z;
    int _2011 = _1991 & 3;
    float _2013 = _1937 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2015 = _1985 & 3;
    bool _2017 = _2015 != 0;
    float _2019 = -_349;
    float _2021 = _2019 + 1.0;
    int _2023 = _1985 + _2011;
    int _2025 = _1989 * int(_1949);
    int _2027 = _2025 + _1469;
    int _2029 = ~_1307;
    int _2031 = _2029 + 1;
    float _2033 = exp2(_2013);
    int _2035 = _2023 >> 2;
    float _2037 = float(uint(_2027));
    int _2039 = _2035 << 4;
    int _2041 = _2039 + 368;
    float _2043 = as_type<float>(_1329) * _2037;
    uint _2045 = uint(int(uint(_2041) >> uint(2)));
    uint _2047 = uint(int(uint(int(_2045)) >> uint(2)));
    int _2049 = int(_2045) & 3;
    float _2051 = (*spvDescriptorSet0.vp_c9)._m0[int(_2047)][_2049];
    int _2053 = int(_2045) + 1;
    uint _2055 = uint(int(uint(_2053) >> uint(2)));
    int _2057 = _2053 & 3;
    float _2059 = (*spvDescriptorSet0.vp_c9)._m0[int(_2055)][_2057];
    int _2061 = _1985 & 3;
    bool _2063 = _2061 != 0;
    float _2065 = trunc(_2043);
    float _2067 = precise::max(_2065, 0.0);
    uint _2069 = uint(_2067);
    float _2071 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _2073 = uint(_2061) > 1u;
    int _2075 = _2041 + 8;
    uint _2077 = uint(int(uint(_2075) >> uint(2)));
    uint _2079 = uint(int(uint(int(_2077)) >> uint(2)));
    int _2081 = int(_2077) & 3;
    float _2083 = (*spvDescriptorSet0.vp_c9)._m0[int(_2079)][_2081];
    int _2085 = int(_2077) + 1;
    uint _2087 = uint(int(uint(_2085) >> uint(2)));
    int _2089 = _2085 & 3;
    float _2091 = (*spvDescriptorSet0.vp_c9)._m0[int(_2087)][_2089];
    int _2093 = int(_1949) + int(_2069);
    int _2095 = _2017 ? 0 : 1;
    int _2097 = _2031 * _2093;
    int _2099 = _2097 + _1469;
    int _2101 = ~_2095;
    int _2103 = _2101 + 1;
    int _2105 = _2103 + 1;
    int _2107 = _2105;
    if (!_2073)
    {
        int _2109 = ~_2095;
        int _2111 = _2109 + 1;
        _2107 = _2111;
    }
    int _2113 = _2107;
    bool _2115 = !_2063;
    int _2117 = _2115 ? 0 : 1;
    int _2119 = abs(_2113);
    bool _2121 = _2061 != 3;
    int _2123 = abs(_2117);
    bool _2125 = uint(_2061) >= 2u;
    float _2127 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2129 = int(_2127);
    int _2131 = ~_2119;
    int _2133 = _2131 + 1;
    int _2135 = _2133 + 1;
    int _2137 = _2125 ? 0 : 1;
    int _2139 = ~_2123;
    int _2141 = _2139 + 1;
    int _2143 = _2141 + 1;
    bool _2145 = uint(_2099) >= uint(_1307);
    int _2147 = _2135 * as_type<int>(_2059);
    int _2149 = ~_2137;
    int _2151 = _2149 + 1;
    int _2153 = _2151 + 1;
    bool _2155 = _2061 != 3;
    int _2157 = _2143 * as_type<int>(_2051);
    int _2159 = _2157 + _2147;
    int _2161 = _2153;
    if (_2121)
    {
        int _2163 = ~_2137;
        int _2165 = _2163 + 1;
        _2161 = _2165;
    }
    int _2167 = _2161;
    bool _2169 = !_2155;
    int _2171 = _2169 ? 0 : (-1);
    int _2173 = abs(_2167);
    int _2175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2177 = _2175 != 0;
    int _2179 = abs(_2171);
    bool _2181 = !_2145;
    int _2183 = _2181 ? 0 : (-1);
    bool _2185 = !_2177;
    int _2187 = _2185 ? 0 : 1;
    int _2189 = abs(_2129);
    int _2191 = ~_2093;
    int _2193 = _2191 + _2183;
    int _2195 = _2193 + 1;
    float _2197 = float(uint(_2129));
    float _2199 = in.m_63.y;
    int _2201 = ~_2173;
    int _2203 = _2201 + 1;
    int _2205 = _2203 + 1;
    int _2207 = _1307 * _2195;
    int _2209 = _2207 + _1469;
    int _2211 = abs(_2187);
    int _2213 = _2205 * as_type<int>(_2083);
    int _2215 = _2213 + _2159;
    int _2217 = ~_2179;
    int _2219 = _2217 + 1;
    int _2221 = _2219 + 1;
    float _2223 = 1.0 / _2197;
    float _2225 = float(uint(_2189));
    int _2227 = ~_2211;
    int _2229 = _2227 + 1;
    int _2231 = _2229 + 1;
    int _2233 = _2221 * as_type<int>(_2091);
    int _2235 = _2233 + _2215;
    bool _2237 = !_1411;
    int _2239 = _2237 ? _2209 : (-1);
    int _2241 = ~_2129;
    int _2243 = _2241 + 1;
    float _2245 = 1.0 / _2225;
    int _2247 = _2235 * _2231;
    int _2249 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2251 = _2249 != 0;
    int _2253 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2255 = _2253 != 0;
    int _2257 = _2239 * _2211;
    int _2259 = _2257 + _2247;
    int _2261 = ~_2189;
    int _2263 = _2261 + 1;
    int _2265 = as_type<int>(_2223) + (-2);
    float _2267 = float(uint(_2259));
    int _2269 = abs(_2259);
    float _2271 = as_type<float>(_2265) * _2267;
    int _2273 = as_type<int>(_2245) + (-2);
    float _2275 = float(uint(_2269));
    float _2277 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _2279 = _161 > 0.5;
    float _2281 = trunc(_2271);
    float _2283 = precise::max(_2281, 0.0);
    uint _2285 = uint(_2283);
    float _2287 = as_type<float>(_2273) * _2275;
    bool _2289 = _2199 > 0.5;
    int _2291 = _2259 ^ _2129;
    float _2293 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2295 = trunc(_2287);
    float _2297 = precise::max(_2295, 0.0);
    uint _2299 = uint(_2297);
    uint _2301 = uint(int(uint(_2291) >> uint(31)));
    int _2303 = ~int(_2301);
    int _2305 = _2303 + 1;
    int _2307 = _2243 * int(_2285);
    int _2309 = _2307 + _2259;
    float _2311 = float(uint(_2309));
    int _2313 = _2263 * int(_2299);
    int _2315 = _2313 + _2269;
    float _2317 = as_type<float>(_2265) * _2311;
    float _2319 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2321 = float(uint(_2315));
    float _2323 = as_type<float>(_2273) * _2321;
    float _2325 = trunc(_2317);
    float _2327 = precise::max(_2325, 0.0);
    uint _2329 = uint(_2327);
    float _2331 = _161 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2333 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2335 = -_2277;
    float _2337 = fma(_2331, 2.0, _2335);
    float _2339 = trunc(_2323);
    float _2341 = precise::max(_2339, 0.0);
    uint _2343 = uint(_2341);
    float _2345 = fma(_161, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2333);
    float _2347 = -_141;
    float _2349 = fma(_2347, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2337);
    float _2351 = _2319 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2353 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2355 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2345);
    int _2357 = int(_2285) + int(_2329);
    int _2359 = ~_2129;
    int _2361 = _2359 + 1;
    float _2363 = _2353 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2365 = ~_2189;
    int _2367 = _2365 + 1;
    float _2369 = -_2355;
    float _2371 = _2369 + 1.0;
    int _2373 = int(_2299) + int(_2343);
    float _2375 = _2199 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2377 = fma(_2199, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2293);
    int _2379 = _2367 * _2373;
    int _2381 = _2379 + _2269;
    int _2383 = _2361 * _2357;
    int _2385 = _2383 + _2259;
    float _2387 = fma(_2375, -2.0, _2071);
    bool _2389 = uint(_2381) >= uint(_2189);
    float _2391 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _2393 = uint(_2385) >= uint(_2129);
    float _2395 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2397 = _2391 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2399 = _2395 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2401 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _2403 = !_2393;
    int _2405 = _2403 ? 0 : (-1);
    float _2407 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2409 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _2411 = !_2389;
    int _2413 = _2411 ? 0 : (-1);
    out.m_72.x = _2397;
    out.m_72.y = _2399;
    out.m_72.z = _2363;
    int _2415 = ~_2357;
    int _2417 = _2415 + _2405;
    int _2419 = _2417 + 1;
    float _2421 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2423 = _2401 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2425 = _2407 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2427 = _2409 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2429 = ~_2413;
    int _2431 = _2373 + _2429;
    int _2433 = _2431 + 1;
    int _2435 = _2129 * _2419;
    int _2437 = _2435 + _2259;
    bool _2439 = _2129 == 0;
    float _2441 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2387);
    out.m_74.x = _2423;
    out.m_74.y = _2425;
    out.m_74.z = _2427;
    out.m_74.w = _2421;
    int _2443 = _2433 ^ _2305;
    float _2445 = abs(_517);
    float _2447 = log2(_2445);
    bool _2449 = _2129 == 0;
    float _2451 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2377);
    int _2453 = ~_2305;
    int _2455 = _2453 + _2443;
    int _2457 = _2455 + 1;
    float _2459 = _457 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2461 = -_2451;
    float _2463 = _2461 + 1.0;
    bool _2465 = !_2449;
    int _2467 = _2465 ? _2457 : (-1);
    float _2469 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2471 = _517 <= 8000.0;
    bool _2473 = isnan(_517);
    bool _2475 = _2471 || _2473;
    bool _2477 = isnan(8000.0);
    bool _2479 = _2475 || _2477;
    float _2481 = float(_2479);
    float _2483 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2485 = -_457;
    int _2487 = _2279 ? as_type<int>(_2485) : as_type<int>(_457);
    bool _2489 = !_2439;
    int _2491 = _2489 ? _2437 : (-1);
    float _2493 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2483);
    bool _2495 = !_2251;
    float _2497 = _2495 ? _457 : as_type<float>(_2487);
    float _2499 = float(_2491);
    float _2501 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2493);
    float _2503 = _2447 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2505 = _2497 + 0.5;
    float _2507 = float(_2467);
    float _2509 = fma(_2351, _2499, _2349);
    float _2511 = -_435;
    int _2513 = _2289 ? as_type<int>(_2511) : as_type<int>(_435);
    float _2515 = _2469 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2517 = exp2(_2503);
    float _2519 = fma(_2351, _2505, _2509);
    bool _2521 = !_2255;
    float _2523 = _2521 ? _435 : as_type<float>(_2513);
    float _2525 = _435 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2527 = -_2441;
    float _2529 = fma(_2515, _2507, _2527);
    float _2531 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2501);
    float _2533 = -_2371;
    float _2535 = fma(_2497, _2533, _2519);
    float _2537 = _2525 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2539 = _2525 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2541 = _2525 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2543 = _2523 + (-0.5);
    float _2545 = fma(_2459, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2537);
    float _2547 = fma(_2459, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2539);
    float _2549 = fma(_2459, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2541);
    float _2551 = -_2515;
    float _2553 = fma(_2551, _2543, _2529);
    float _2555 = fma(_2517, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2557 = precise::clamp(_2555, 0.0, 1.0);
    float _2559 = _2531 + _1198;
    out.gl_Position.x = _1224;
    out.gl_Position.y = _1226;
    out.gl_Position.z = _2531;
    out.gl_Position.w = _1198;
    float _2561 = fma(_2523, _2463, _2553);
    float _2563 = fma(_2557, -2.0, 3.0);
    float _2565 = _2557 * _2557;
    float _2567 = _2559 * 0.5;
    out.m_76.x = _2535;
    out.m_76.y = _2561;
    float _2569 = _2565 * _2563;
    bool _2571 = _1769 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2573 = isnan(_1769);
    bool _2575 = _2571 || _2573;
    bool _2577 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2579 = _2575 || _2577;
    out.m_78.z = _2567;
    out.m_78.w = _1198;
    float _2581 = -_2569;
    float _2583 = _2581 + 1.0;
    float _2585 = -_2033;
    float _2587 = _2585 + 1.0;
    float _2589 = fma(_2583, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2569);
    float _2591 = _2549;
    float _2593 = _2547;
    float _2595 = _2545;
    if (!_1184)
    {
        _1230 = 1.0;
    }
    float _2597 = _1230;
    float _2599 = _2549 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2601 = _2587 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2603 = _2481 * _2589;
    float _2605 = _2597;
    if (_1184)
    {
        bool _2607 = _1282 >= _1244;
        bool _2609 = isnan(_1282);
        bool _2611 = _2607 || _2609;
        bool _2613 = isnan(_1244);
        bool _2615 = _2611 || _2613;
        float _2617 = float(_2615);
        _2605 = _2617;
    }
    float _2619 = _2605;
    float _2621 = _2601 * _1284;
    float _2623 = _2603 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2625 = -_2601;
    float _2627 = _2625 + 1.0;
    float _2629 = _2619 * _1747;
    float _2631 = _1295 * _2621;
    float _2633 = _2021 * _2623;
    float _2635 = precise::clamp(_2633, 0.0, 1.0);
    float _2637 = _1295 * _2627;
    float _2639 = _2547 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2641 = _2009 * _2621;
    float _2643 = -_2635;
    float _2645 = fma(_2643, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2647 = fma(_2005, _2631, _1289);
    float _2649 = fma(_2007, _2631, _1291);
    float _2651 = fma(_1295, _2641, _1293);
    float _2653 = -_2629;
    float _2655 = fma(_2653, _2645, 1.0);
    float _2657 = precise::clamp(_2655, 0.0, 1.0);
    float _2659 = _1625 * _1681;
    float _2661 = _2659;
    if (!_2579)
    {
        _1575 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2663 = _1575;
    float _2665 = _2657 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2667 = _2545 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    out.m_80.x = _2647;
    out.m_80.y = _2649;
    out.m_80.z = _2651;
    out.m_80.w = _2637;
    float _2669 = _2659 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2671 = _2663;
    float _2673 = _2663;
    if (!_2579)
    {
        _1248 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2675 = _1248;
    out.m_82.x = _2665;
    float _2677 = _2675;
    float _2679 = _2675;
    if (!_2579)
    {
        _2591 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2681 = _2591;
    float _2683 = _2681;
    float _2685 = _2681;
    if (!_2579)
    {
        _2593 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2687 = _2593;
    out.m_84.x = _2639;
    out.m_84.y = _2667;
    out.m_84.z = _2599;
    float _2689 = _2687;
    float _2691 = _2687;
    if (!_2579)
    {
        _2595 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2693 = _2595;
    float _2695 = _2693;
    float _2697 = _2693;
    if (!_2579)
    {
        _2661 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2699 = _2661;
    bool _2701 = !_2579;
    float _2703 = _2699;
    float _2705 = _2699;
    if (!_2701)
    {
        bool _2707 = _1769 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2709 = isnan(_1769);
        bool _2711 = _2707 || _2709;
        bool _2713 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2715 = _2711 || _2713;
        if (!_2715)
        {
            float _2717 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2719 = _1769 + _2717;
            float _2721 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2723 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2721;
            float _2725 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2727 = _2725 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2729 = 1.0 / _2723;
            float _2731 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2733 = _2731 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2735 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2737 = _2735 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2739 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2741 = _2739 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2743 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2745 = _2743 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2747 = _2719 * _2729;
            float _2749 = precise::clamp(_2747, 0.0, 1.0);
            float _2751 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2753 = _2751 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2755 = fma(_2749, _2727, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2757 = fma(_2749, _2753, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2759 = fma(_2749, _2733, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2761 = fma(_2749, _2737, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2763 = fma(_2749, _2741, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2765 = fma(_2749, _2745, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2679 = _2759;
            _2697 = _2763;
            _2673 = _2755;
            _2691 = _2761;
            _2685 = _2757;
            _2705 = _2765;
            _2767 = true;
        }
        else
        {
            bool _2769 = _1769 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2771 = isnan(_1769);
            bool _2773 = _2769 || _2771;
            bool _2775 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2777 = _2773 || _2775;
            if (!_2777)
            {
                _2671 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2779 = _2671;
            _2673 = _2779;
            if (!_2777)
            {
                _2677 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2781 = _2677;
            _2679 = _2781;
            if (!_2777)
            {
                _2683 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2783 = _2683;
            _2685 = _2783;
            if (!_2777)
            {
                _2689 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2785 = _2689;
            _2691 = _2785;
            if (!_2777)
            {
                _2695 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2787 = _2695;
            _2697 = _2787;
            if (!_2777)
            {
                _2703 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2789 = _2703;
            bool _2791 = !_2777;
            _2705 = _2789;
            if (!_2791)
            {
                bool _2793 = _1769 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2795 = isnan(_1769);
                bool _2797 = _2793 || _2795;
                bool _2799 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2801 = _2797 || _2799;
                if (!_2801)
                {
                    float _2803 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2805 = _1769 + _2803;
                    float _2807 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2809 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2807;
                    float _2811 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2813 = _2811 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2815 = 1.0 / _2809;
                    float _2817 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2819 = _2817 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2821 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2823 = _2821 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2825 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2827 = _2825 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2829 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2831 = _2829 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2833 = _2805 * _2815;
                    float _2835 = precise::clamp(_2833, 0.0, 1.0);
                    float _2837 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2839 = _2837 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2841 = fma(_2835, _2813, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2843 = fma(_2835, _2839, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2845 = fma(_2835, _2819, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2847 = fma(_2835, _2823, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2849 = fma(_2835, _2827, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2851 = fma(_2835, _2831, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2679 = _2845;
                    _2697 = _2849;
                    _2673 = _2841;
                    _2691 = _2847;
                    _2685 = _2843;
                    _2705 = _2851;
                    _2767 = true;
                }
                else
                {
                    _2679 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2697 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2673 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2691 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2685 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2705 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2767 = false;
    float _2853 = _2679;
    float _2855 = _2697;
    float _2857 = _2673;
    float _2859 = _2691;
    float _2861 = _2685;
    float _2863 = _2705;
    float _2865 = fma(_2667, -0.5, 0.5);
    float _2867 = precise::clamp(_2865, 0.0, 1.0);
    float _2869 = -_2853;
    float _2871 = _2869 + _2855;
    float _2873 = _2669 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2875 = -_2857;
    float _2877 = _2875 + _2859;
    out.m_86.x = 0.0;
    float _2879 = fma(_2867, _2871, _2853);
    float _2881 = fma(_2867, _2877, _2857);
    out.m_59.x = _2873;
    float _2883 = -_2861;
    float _2885 = _2883 + _2863;
    float _2887 = _2879 * 0.586610972881317138671875;
    bool _2889 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2891 = fma(_2867, _2885, _2861);
    float _2893 = fma(_2881, 0.298911988735198974609375, _2887);
    bool _2895 = _1625 > 0.0;
    bool _2897 = isnan(_1625);
    bool _2899 = _2895 || _2897;
    bool _2901 = isnan(0.0);
    bool _2903 = _2899 || _2901;
    float _2905 = fma(_2891, 0.114477999508380889892578125, _2893);
    bool _2907 = _1681 <= 0.0;
    bool _2909 = !_2903;
    bool _2911 = _2907 || _2909;
    float _2913 = -_2905;
    float _2915 = _2881 + _2913;
    float _2917 = -_2905;
    float _2919 = _2879 + _2917;
    float _2921 = -_2905;
    float _2923 = _2891 + _2921;
    float _2925 = fma(_2915, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2905);
    float _2927 = fma(_2919, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2905);
    float _2929 = fma(_2923, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2905);
    bool _2931 = !_2889;
    if (!_2931)
    {
        float _2933 = -_1110;
        float _2935 = _2933 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2937 = -_1112;
        float _2939 = _2937 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2941 = -_1114;
        float _2943 = _2941 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2945 = _2935 * _2935;
        float _2947 = fma(_2939, _2939, _2945);
        float _2949 = fma(_2943, _2943, _2947);
        float _2951 = sqrt(_2949);
        float _2953 = rsqrt(_2949);
        float _2955 = -_2951;
        float _2957 = _2955 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2959 = _2957 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2961 = precise::clamp(_2959, 0.0, 1.0);
        float _2963 = _2939 * _2953;
        float _2965 = _2935 * _2953;
        float _2967 = abs(_2961);
        float _2969 = log2(_2967);
        float _2971 = _2943 * _2953;
        float _2973 = _2963 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2975 = _2667 * _2965;
        float _2977 = -_2965;
        float _2979 = -_2973;
        float _2981 = fma(_2977, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2979);
        float _2983 = fma(_2639, _2963, _2975);
        float _2985 = -_2971;
        float _2987 = fma(_2985, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2981);
        float _2989 = fma(_2599, _2971, _2983);
        float _2991 = precise::clamp(_2989, 0.0, 1.0);
        float _2993 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2995 = _2987 + _2993;
        float _2997 = _2969 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2999 = _2995 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3001 = precise::clamp(_2999, 0.0, 1.0);
        float _3003 = exp2(_2997);
        float _3005 = _3003 * _3001;
        float _3007 = _2991 * _3005;
        float _3009 = _3007 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3011 = _3007 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3013 = _3007 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _3009;
        out.m_86.y = _3011;
        out.m_86.z = _3013;
    }
    out.m_88.x = _2925;
    out.m_88.y = _2927;
    out.m_88.z = _2929;
    if (!_2911)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_59.x = 0.0;
    float _3015 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3015;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

