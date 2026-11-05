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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d_array<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0), center_no_perspective]];
    float4 m_42 [[user(locn1), center_no_perspective]];
    float4 m_40 [[user(locn2), center_no_perspective]];
    float4 m_36 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _52 = in.m_36.x;
    float _54 = in.m_36.y;
    float2 _756 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_756, float2(0.0), isnan(_756))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_756, float2(0.0), isnan(_756))).x;
    float2 _767 = float2(_52, _54);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_767, float2(0.0), isnan(_767)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float _68 = in.m_38.y;
    float _70 = in.m_38.x;
    float _72 = in.m_40.y;
    float _74 = in.m_42.y;
    float _76 = in.m_40.x;
    float _78 = -_56;
    float _80 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _82 = 1.0 / _80;
    float _84 = -_62;
    float _86 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _88 = -_64;
    float _90 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _92 = in.m_42.x;
    float _94 = -_66;
    float _96 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _98 = 1.0 / _86;
    float _100 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _102 = _82 * _100;
    float _104 = 1.0 / _90;
    float _106 = _102 * _68;
    float _108 = _102 * _70;
    float _110 = -_106;
    float _112 = _110 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _114 = 1.0 / _96;
    float _116 = -_108;
    float _118 = _116 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _120 = -_106;
    float _122 = _120 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _124 = _112 * _112;
    float _126 = -_108;
    float _128 = _126 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _130 = _106 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _132 = _122 * _122;
    float _134 = fma(_118, _118, _124);
    float _136 = -_102;
    float _138 = _136 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _140 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _142 = _98 * _140;
    float _144 = fma(_128, _128, _132);
    float _146 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _148 = _104 * _146;
    float _150 = fma(_138, _138, _134);
    float _152 = _68 * _142;
    float _154 = -_102;
    float _156 = _154 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _158 = _70 * _142;
    float _160 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _162 = _114 * _160;
    float _164 = -_152;
    float _166 = fma(_148, _72, _164);
    float _168 = sqrt(_150);
    float _170 = fma(_156, _156, _144);
    float _172 = -_152;
    float _174 = fma(_162, _74, _172);
    float _176 = -_158;
    float _178 = fma(_148, _76, _176);
    float _180 = _166 * _166;
    float _182 = -_142;
    float _184 = _182 + _148;
    float _186 = -_158;
    float _188 = fma(_162, _92, _186);
    float _190 = _174 * _174;
    float _192 = fma(_178, _178, _180);
    float _194 = -_142;
    float _196 = _194 + _162;
    float _198 = sqrt(_170);
    float _200 = fma(_188, _188, _190);
    float _202 = fma(_184, _184, _192);
    float _204 = _106 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _206 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[27].x, _130);
    float _208 = fma(_196, _196, _200);
    bool _212 = _168 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _214 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[23].x, _204);
    float _216 = rsqrt(_202);
    bool _218 = _168 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _220 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[27].z, _206);
    float _222 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[23].z, _214);
    bool _224 = !_212;
    int _227 = _224 ? 0 : 1;
    float _229 = rsqrt(_208);
    bool _231 = _198 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    int _233 = 2;
    if (!_212)
    {
        _233 = 1;
    }
    int _235 = _233;
    bool _237 = _198 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _239 = !_231;
    int _241 = _239 ? 0 : 1;
    float _243 = _178 * _216;
    float _245 = _166 * _216;
    int _247 = _235;
    if (!_218)
    {
        _247 = _227;
    }
    int _249 = _247;
    float _251 = _184 * _216;
    int _253 = 2;
    if (!_231)
    {
        _253 = 1;
    }
    int _255 = _253;
    float _257 = _196 * _229;
    float _259 = _174 * _229;
    float _261 = _188 * _229;
    float _263 = _106 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _265 = _243 * _257;
    int _267 = _255;
    if (!_237)
    {
        _267 = _241;
    }
    int _269 = _267;
    float _271 = _245 * _261;
    float _273 = _251 * _259;
    float _275 = -_265;
    float _277 = fma(_251, _261, _275);
    float _279 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[19].x, _263);
    float _281 = -_271;
    float _283 = fma(_243, _259, _281);
    float _285 = -_273;
    float _287 = fma(_245, _257, _285);
    float _289 = _277 * _277;
    float _291 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[19].z, _279);
    float _293 = float(_249);
    float _295 = _106 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _297 = fma(_287, _287, _289);
    float _299 = _291 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _301 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[20].x, _295);
    float _303 = fma(_283, _283, _297);
    float _305 = precise::min(_293, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _307 = _106 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _309 = float(_269);
    float _311 = rsqrt(_303);
    float _313 = _106 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    bool _315 = _305 != 1.0;
    bool _317 = isnan(_305);
    bool _319 = _315 || _317;
    bool _321 = isnan(1.0);
    bool _323 = _319 || _321;
    float _325 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[20].z, _301);
    float _327 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[22].x, _307);
    float _329 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[21].x, _313);
    float _331 = precise::min(_309, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _333 = _325 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _335 = _106 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _337 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[21].z, _329);
    float _339 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[22].z, _327);
    bool _341 = _331 != 1.0;
    bool _343 = isnan(_331);
    bool _345 = _341 || _343;
    bool _347 = isnan(1.0);
    bool _349 = _345 || _347;
    float _351 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[24].x, _335);
    float _353 = _337 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _355 = _106 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _357 = _299;
    float _359 = _333;
    float _361 = _353;
    if (_323)
    {
        float _363 = _339 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _357 = _363;
    }
    float _365 = _357;
    float _367 = _277 * _311;
    float _369 = _287 * _311;
    float _371 = _283 * _311;
    float _373 = _365;
    if (_323)
    {
        float _375 = _222 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _359 = _375;
    }
    float _377 = _359;
    float _379 = _367 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _381 = _106 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _383 = _106 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _385 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[24].z, _351);
    float _387 = fma(_369, (*spvDescriptorSet0.fp_c3)._m0[35].x, _379);
    float _389 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[28].x, _381);
    float _391 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[31].x, _383);
    float _393 = _377;
    if (_323)
    {
        float _395 = _385 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _361 = _395;
    }
    float _397 = _361;
    float _399 = fma(_371, (*spvDescriptorSet0.fp_c3)._m0[35].z, _387);
    float _401 = _106 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    bool _403 = _305 != 0.0;
    bool _405 = isnan(_305);
    bool _407 = _403 || _405;
    bool _409 = isnan(0.0);
    bool _411 = _407 || _409;
    float _413 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[28].z, _389);
    float _415 = abs(_399);
    float _417 = -_415;
    float _419 = _417 + 1.0;
    float _421 = precise::clamp(_419, 0.0, 1.0);
    float _423 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[31].z, _391);
    float _425 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[29].x, _401);
    float _427 = _413 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _429 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[16].x, _355);
    float _431 = _427;
    float _433 = _397;
    if (_349)
    {
        float _435 = _423 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _431 = _435;
    }
    float _437 = _431;
    float _439 = abs(_421);
    float _441 = log2(_439);
    float _443 = _106 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _445 = _106 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _447 = _106 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _449 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[29].z, _425);
    float _451 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[16].z, _429);
    float _453 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[30].x, _443);
    float _455 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[32].x, _445);
    float _457 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[33].x, _447);
    float _459 = _449 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _461 = _106 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _463 = _459;
    float _465 = _437;
    if (!_411)
    {
        float _467 = _451 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _373 = _467;
    }
    float _469 = _373;
    float _471 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[30].z, _453);
    float _473 = _106 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _475 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[32].z, _455);
    float _477 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[33].z, _457);
    float _479 = _441 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _481 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[17].x, _461);
    float _483 = _471 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _485 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[18].x, _473);
    float _487 = _483;
    if (_349)
    {
        float _489 = _475 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _463 = _489;
    }
    float _491 = _463;
    float _493 = _491;
    if (_349)
    {
        float _495 = _477 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _487 = _495;
    }
    float _497 = _487;
    float _499 = exp2(_479);
    bool _501 = _331 != 0.0;
    bool _503 = isnan(_331);
    bool _505 = _501 || _503;
    bool _507 = isnan(0.0);
    bool _509 = _505 || _507;
    float _511 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[17].z, _481);
    float _513 = _106 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _515 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[18].z, _485);
    float _517 = _106 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _519 = _497;
    if (!_411)
    {
        float _521 = _511 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _393 = _521;
    }
    float _523 = _393;
    float _525 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[25].x, _513);
    if (!_411)
    {
        float _527 = _515 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _433 = _527;
    }
    float _529 = _433;
    float _531 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[26].x, _517);
    float _533 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[25].z, _525);
    float _535 = rint(_305);
    float _537 = precise::max(_535, 0.0);
    uint _540 = uint(_537);
    uint _542 = clamp(_540, 0u, 65535u);
    float _544 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _546 = 0.0 + _529;
    float _548 = precise::clamp(_546, 0.0, 1.0);
    if (!_509)
    {
        float _550 = _533 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _465 = _550;
    }
    float _552 = _465;
    float _554 = _499 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    if (!_509)
    {
        float _556 = _220 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _519 = _556;
    }
    float _558 = _519;
    float _560 = _548 * _544;
    float _562 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[26].z, _531);
    float _564 = fma(_367, _554, _106);
    float _566 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _568 = fma(_560, 0.5, _469);
    float _570 = fma(_560, -0.5, _469);
    float _572 = fma(_369, _554, _108);
    float _574 = _564 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _576 = fma(_371, _554, _102);
    float _578 = 0.0 + _558;
    float _580 = precise::clamp(_578, 0.0, 1.0);
    if (!_509)
    {
        float _582 = _562 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _493 = _582;
    }
    float _584 = _493;
    float _586 = fma(_572, (*spvDescriptorSet0.fp_c3)._m0[3].x, _574);
    float _588 = _564 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _590 = _548 * _566;
    float _592 = rint(_331);
    float _594 = precise::max(_592, 0.0);
    uint _596 = uint(_594);
    uint _598 = clamp(_596, 0u, 65535u);
    float _600 = fma(_576, (*spvDescriptorSet0.fp_c3)._m0[3].z, _586);
    float _602 = fma(_572, (*spvDescriptorSet0.fp_c3)._m0[2].x, _588);
    float _604 = fma(_590, 0.5, _523);
    float _606 = fma(_590, -0.5, _523);
    float _608 = _600 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _610 = fma(_576, (*spvDescriptorSet0.fp_c3)._m0[2].z, _602);
    float _612 = _564 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _614 = _564 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _616 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _618 = _610 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _620 = 1.0 / _608;
    float _622 = fma(_572, (*spvDescriptorSet0.fp_c3)._m0[0].x, _612);
    float _624 = fma(_572, (*spvDescriptorSet0.fp_c3)._m0[1].x, _614);
    float _626 = _544 * _580;
    float _628 = _566 * _580;
    float _630 = fma(_576, (*spvDescriptorSet0.fp_c3)._m0[0].z, _622);
    float _632 = fma(_576, (*spvDescriptorSet0.fp_c3)._m0[1].z, _624);
    float _634 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _636 = fma(_626, 0.5, _552);
    float _638 = _630 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _640 = _632 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _642 = fma(_626, -0.5, _552);
    float _644 = fma(_628, 0.5, _584);
    float _646 = fma(_628, -0.5, _584);
    float _648 = _618 * _620;
    float _650 = precise::clamp(_648, 0.0, 1.0);
    float _652 = _638 * _620;
    float _654 = _640 * _620;
    float _656 = rint(_650);
    float _658 = precise::max(_656, 0.0);
    uint _660 = uint(_658);
    uint _662 = clamp(_660, 0u, 65535u);
    float _664 = fma(_634, -0.5, _652);
    float _666 = fma(_616, 0.5, _654);
    float _668 = fma(_634, 0.5, _652);
    float _670 = fma(_616, -0.5, _654);
    float3 _1828 = float3(_664, _666, float(int(_662)));
    float3 _1832 = select(_1828, float3(0.0), isnan(_1828));
    float _672 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1832.xy, uint(rint(_1832.z)), 1.0);
    float3 _1840 = float3(_668, _666, float(int(_662)));
    float3 _1842 = select(_1840, float3(0.0), isnan(_1840));
    float _674 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1842.xy, uint(rint(_1842.z)), 1.0);
    float3 _1850 = float3(_668, _670, float(int(_662)));
    float3 _1852 = select(_1850, float3(0.0), isnan(_1850));
    float _676 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1852.xy, uint(rint(_1852.z)), 1.0);
    float3 _1860 = float3(_664, _670, float(int(_662)));
    float3 _1862 = select(_1860, float3(0.0), isnan(_1860));
    float _678 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1862.xy, uint(rint(_1862.z)), 1.0);
    float3 _1870 = float3(_570, _604, float(int(_542)));
    float3 _1872 = select(_1870, float3(0.0), isnan(_1870));
    float _680 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1872.xy, uint(rint(_1872.z)), _548);
    float3 _1881 = float3(_568, _604, float(int(_542)));
    float3 _1883 = select(_1881, float3(0.0), isnan(_1881));
    float _682 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1883.xy, uint(rint(_1883.z)), _548);
    float3 _1892 = float3(_642, _644, float(int(_598)));
    float3 _1894 = select(_1892, float3(0.0), isnan(_1892));
    float _684 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1894.xy, uint(rint(_1894.z)), _580);
    float3 _1903 = float3(_636, _644, float(int(_598)));
    float3 _1905 = select(_1903, float3(0.0), isnan(_1903));
    float _686 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1905.xy, uint(rint(_1905.z)), _580);
    float3 _1914 = float3(_568, _606, float(int(_542)));
    float3 _1916 = select(_1914, float3(0.0), isnan(_1914));
    float _688 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1916.xy, uint(rint(_1916.z)), _548);
    float3 _1925 = float3(_636, _646, float(int(_598)));
    float3 _1927 = select(_1925, float3(0.0), isnan(_1925));
    float _690 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1927.xy, uint(rint(_1927.z)), _580);
    float3 _1936 = float3(_570, _606, float(int(_542)));
    float3 _1938 = select(_1936, float3(0.0), isnan(_1936));
    float _692 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1938.xy, uint(rint(_1938.z)), _548);
    float3 _1947 = float3(_642, _646, float(int(_598)));
    float3 _1949 = select(_1947, float3(0.0), isnan(_1947));
    float _694 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1949.xy, uint(rint(_1949.z)), _580);
    float _696 = -_102;
    float _698 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _700 = _696 + _698;
    float _702 = _700 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _704 = precise::clamp(_702, 0.0, 1.0);
    float _706 = _674 + _672;
    float _708 = -_102;
    float _710 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _712 = _708 + _710;
    float _714 = _682 + _680;
    float _716 = _706 + _676;
    float _718 = _686 + _684;
    float _720 = _712 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _722 = precise::clamp(_720, 0.0, 1.0);
    float _724 = _714 + _688;
    float _726 = _716 + _678;
    float _728 = _718 + _690;
    float _730 = fma(_726, 0.25, _722);
    float _732 = _724 + _692;
    float _734 = _728 + _694;
    float _736 = _732 * 0.25;
    float _738 = _734 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _740 = _738 * 0.25;
    float _742 = fma(_736, (*spvDescriptorSet0.fp_c3)._m0[49].z, _740);
    float _744 = _704 + _742;
    out.m_45.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_45.y = _730;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _744;
    return out;
}

