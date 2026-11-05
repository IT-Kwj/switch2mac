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
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_E [[id(5)]];
    sampler fp_t_tcb_ESmplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    texture2d_array<float> fp_t_tcb_12 [[id(9)]];
    sampler fp_t_tcb_12Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_A [[id(11)]];
    sampler fp_t_tcb_ASmplr [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_CSmplr_w [[id(14)]];
    sampler fp_t_tcb_ASmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_49 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0), center_no_perspective]];
    float4 m_46 [[user(locn1), center_no_perspective]];
    float4 m_44 [[user(locn2), center_no_perspective]];
    float4 m_40 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _56 = in.m_40.x;
    float _58 = in.m_40.y;
    float2 _759 = float2(_56, _58);
    float3 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_759, float2(0.0), isnan(_759)), int2(0), component::x).xyw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float2 _776 = float2(_56, _58);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_776, float2(0.0), isnan(_776))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_776, float2(0.0), isnan(_776))).x;
    float2 _784 = float2(_56, _58);
    float2 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_784, float2(0.0), isnan(_784))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_784, float2(0.0), isnan(_784))).xy;
    float _76 = _74.x;
    float _78 = _74.y;
    float _80 = in.m_42.x;
    float _82 = in.m_42.y;
    float _84 = in.m_44.x;
    float _86 = in.m_46.x;
    float _88 = in.m_44.y;
    float _90 = in.m_46.y;
    float _92 = -_64;
    float _94 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _96 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[46].z, _94);
    float _98 = -_66;
    float _100 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _102 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[46].z, _100);
    float _104 = -_68;
    float _106 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _108 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[46].z, _106);
    float _110 = _80 * _96;
    float _112 = _82 * _96;
    float _114 = -_70;
    float _116 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _118 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[46].z, _116);
    float _120 = -_110;
    float _122 = fma(_102, _84, _120);
    float _124 = -_110;
    float _126 = fma(_108, _86, _124);
    float _128 = -_112;
    float _130 = fma(_102, _88, _128);
    float _132 = -_96;
    float _134 = _132 + _102;
    float _136 = -_96;
    float _138 = _136 + _108;
    float _140 = _118 * _82;
    float _142 = _130 * _130;
    float _144 = -_112;
    float _146 = fma(_108, _90, _144);
    float _148 = _118 * _80;
    float _150 = -_140;
    float _152 = _150 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _154 = fma(_122, _122, _142);
    float _156 = _146 * _146;
    float _158 = -_148;
    float _160 = _158 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _162 = _152 * _152;
    float _164 = fma(_134, _134, _154);
    float _166 = fma(_126, _126, _156);
    float _168 = _140 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _170 = fma(_160, _160, _162);
    float _172 = -_118;
    float _174 = _172 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _176 = fma(_138, _138, _166);
    float _178 = rsqrt(_164);
    float _180 = _140 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _182 = fma(_174, _174, _170);
    float _184 = -_140;
    float _186 = _184 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _188 = _140 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _190 = _186 * _186;
    float _192 = rsqrt(_176);
    float _194 = -_148;
    float _196 = _194 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _198 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[31].x, _188);
    float _200 = fma(_196, _196, _190);
    float _202 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[31].z, _198);
    float _204 = sqrt(_182);
    float _206 = _122 * _178;
    float _208 = _134 * _178;
    float _210 = _130 * _178;
    float _212 = _138 * _192;
    float _214 = _146 * _192;
    float _216 = _126 * _192;
    float _218 = -_118;
    float _220 = _218 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _222 = _206 * _212;
    float _224 = _208 * _214;
    float _226 = fma(_220, _220, _200);
    bool _230 = _204 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _232 = -_222;
    float _234 = fma(_208, _216, _232);
    bool _236 = _204 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _238 = -_224;
    float _240 = fma(_210, _212, _238);
    float _242 = _210 * _216;
    bool _244 = !_230;
    int _247 = _244 ? 0 : 1;
    float _249 = _234 * _234;
    float _251 = sqrt(_226);
    float _253 = -_242;
    float _255 = fma(_206, _214, _253);
    float _257 = _140 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _259 = _140 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _261 = _140 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    int _263 = 2;
    int _265 = 2;
    if (!_230)
    {
        _263 = 1;
    }
    int _267 = _263;
    float _269 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[19].x, _257);
    int _271 = _267;
    if (!_236)
    {
        _271 = _247;
    }
    int _273 = _271;
    float _275 = fma(_240, _240, _249);
    float _277 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[22].x, _259);
    float _279 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[19].z, _269);
    float _281 = float(_273);
    float _283 = fma(_255, _255, _275);
    float _285 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[22].z, _277);
    float _287 = _279 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _289 = precise::min(_281, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _291 = _140 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    bool _293 = _251 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _295 = rsqrt(_283);
    bool _297 = _289 != 1.0;
    bool _299 = isnan(_289);
    bool _301 = _297 || _299;
    bool _303 = isnan(1.0);
    bool _305 = _301 || _303;
    float _307 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[23].x, _291);
    bool _309 = _251 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _311 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[24].x, _261);
    bool _313 = !_293;
    int _315 = _313 ? 0 : 1;
    float _317 = _140 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _319 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[23].z, _307);
    float _321 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[24].z, _311);
    float _323 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[28].x, _317);
    float _325 = _140 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _327 = _287;
    if (!_293)
    {
        _265 = 1;
    }
    int _329 = _265;
    int _331 = _329;
    if (_305)
    {
        float _333 = _285 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _327 = _333;
    }
    float _335 = _327;
    float _337 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[28].z, _323);
    float _339 = _234 * _295;
    float _341 = _240 * _295;
    float _343 = _255 * _295;
    float _345 = _140 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _347 = _339 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _349 = _335;
    if (!_309)
    {
        _331 = _315;
    }
    int _351 = _331;
    float _353 = _140 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _355 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[20].x, _345);
    float _357 = fma(_341, (*spvDescriptorSet0.fp_c3)._m0[35].x, _347);
    float _359 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[32].x, _180);
    float _361 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[21].x, _353);
    float _363 = fma(_343, (*spvDescriptorSet0.fp_c3)._m0[35].z, _357);
    float _365 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[20].z, _355);
    float _367 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[29].x, _168);
    float _369 = float(_351);
    float _371 = abs(_363);
    float _373 = -_371;
    float _375 = _373 + 1.0;
    float _377 = precise::clamp(_375, 0.0, 1.0);
    float _379 = _365 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _381 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[21].z, _361);
    float _383 = precise::min(_369, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _385 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[29].z, _367);
    float _387 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[32].z, _359);
    float _389 = abs(_377);
    float _391 = log2(_389);
    bool _393 = _383 != 1.0;
    bool _395 = isnan(_383);
    bool _397 = _393 || _395;
    bool _399 = isnan(1.0);
    bool _401 = _397 || _399;
    float _403 = _381 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _405 = _140 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _407 = _379;
    float _409 = _403;
    if (_305)
    {
        float _411 = _319 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _407 = _411;
    }
    float _413 = _407;
    float _415 = _413;
    if (_305)
    {
        float _417 = _321 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _409 = _417;
    }
    float _419 = _409;
    bool _421 = _289 != 0.0;
    bool _423 = isnan(_289);
    bool _425 = _421 || _423;
    bool _427 = isnan(0.0);
    bool _429 = _425 || _427;
    float _431 = _385 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _433 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[30].x, _405);
    float _435 = _140 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _437 = _337 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _439 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[18].x, _325);
    float _441 = _140 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _443 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[16].x, _435);
    float _445 = _431;
    float _447 = _419;
    float _449 = _437;
    if (_401)
    {
        float _451 = _387 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _445 = _451;
    }
    float _453 = _445;
    float _455 = _140 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _457 = _391 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _459 = _140 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _461 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[18].z, _439);
    float _463 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[16].z, _443);
    float _465 = _140 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _467 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[33].x, _459);
    float _469 = exp2(_457);
    float _471 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[30].z, _433);
    float _473 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[17].x, _455);
    float _475 = _453;
    if (!_429)
    {
        float _477 = _461 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _447 = _477;
    }
    float _479 = _447;
    if (!_429)
    {
        float _481 = _463 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _349 = _481;
    }
    float _483 = _349;
    float _485 = _140 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _487 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[17].z, _473);
    if (_401)
    {
        float _489 = _202 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _449 = _489;
    }
    float _491 = _449;
    float _493 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[33].z, _467);
    float _495 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[26].x, _485);
    float _497 = _491;
    if (!_429)
    {
        float _499 = _487 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _415 = _499;
    }
    float _501 = _415;
    bool _503 = _383 != 0.0;
    bool _505 = isnan(_383);
    bool _507 = _503 || _505;
    bool _509 = isnan(0.0);
    bool _511 = _507 || _509;
    float _513 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[27].x, _441);
    float _515 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[26].z, _495);
    float _517 = _471 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _519 = _517;
    if (_401)
    {
        float _521 = _493 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _519 = _521;
    }
    float _523 = _519;
    float _525 = _469 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _527 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[27].z, _513);
    float _529 = rint(_289);
    float _531 = precise::max(_529, 0.0);
    uint _534 = uint(_531);
    uint _536 = clamp(_534, 0u, 65535u);
    float _538 = fma(_339, _525, _140);
    float _540 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[25].x, _465);
    float _542 = fma(_341, _525, _148);
    float _544 = fma(_343, _525, _118);
    float _546 = _538 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _548 = _523;
    if (!_511)
    {
        float _550 = _515 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _475 = _550;
    }
    float _552 = _475;
    float _554 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[25].z, _540);
    float _556 = fma(_542, (*spvDescriptorSet0.fp_c3)._m0[3].x, _546);
    float _558 = _538 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _560 = _538 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _562 = _538 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _564 = fma(_544, (*spvDescriptorSet0.fp_c3)._m0[3].z, _556);
    if (!_511)
    {
        float _566 = _554 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _497 = _566;
    }
    float _568 = _497;
    float _570 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _572 = 0.0 + _479;
    float _574 = precise::clamp(_572, 0.0, 1.0);
    float _576 = _564 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _578 = fma(_542, (*spvDescriptorSet0.fp_c3)._m0[0].x, _558);
    float _580 = fma(_542, (*spvDescriptorSet0.fp_c3)._m0[1].x, _560);
    float _582 = fma(_542, (*spvDescriptorSet0.fp_c3)._m0[2].x, _562);
    float _584 = _574 * _570;
    float _586 = fma(_544, (*spvDescriptorSet0.fp_c3)._m0[0].z, _578);
    float _588 = 1.0 / _576;
    float _590 = fma(_544, (*spvDescriptorSet0.fp_c3)._m0[1].z, _580);
    float _592 = fma(_544, (*spvDescriptorSet0.fp_c3)._m0[2].z, _582);
    if (!_511)
    {
        float _594 = _527 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _548 = _594;
    }
    float _596 = _548;
    float _598 = fma(_584, 0.5, _483);
    float _600 = fma(_584, -0.5, _483);
    float _602 = _586 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _604 = _590 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _606 = _592 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _608 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _610 = 0.0 + _596;
    float _612 = precise::clamp(_610, 0.0, 1.0);
    float _614 = rint(_383);
    float _616 = precise::max(_614, 0.0);
    uint _618 = uint(_616);
    uint _620 = clamp(_618, 0u, 65535u);
    float _622 = _574 * _608;
    float _624 = _570 * _612;
    float _626 = _602 * _588;
    float _628 = _604 * _588;
    float _630 = _606 * _588;
    float _632 = precise::clamp(_630, 0.0, 1.0);
    float _634 = _608 * _612;
    float _636 = fma(_622, 0.5, _501);
    float _638 = fma(_622, -0.5, _501);
    float _640 = (*spvDescriptorSet0.fp_c3)._m0[47].x * _632;
    float _642 = fma(_634, 0.5, _552);
    float _644 = fma(_634, -0.5, _552);
    float _646 = fma(_624, 0.5, _568);
    float _648 = fma(_624, -0.5, _568);
    float _650 = _640 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _652 = _640 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _654 = fma(_78, 2.0, -1.0);
    float _656 = fma(_76, 2.0, -1.0);
    float _658 = fma(_650, 0.5, _626);
    float _660 = fma(_650, -0.5, _626);
    float _662 = fma(_652, 0.5, _628);
    float _664 = _654 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _666 = _656 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _668 = fma(_652, -0.5, _628);
    float3 _1834 = float3(_658, _662, float(0));
    float3 _1838 = select(_1834, float3(0.0), isnan(_1834));
    float _670 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1838.xy, uint(rint(_1838.z)), _632);
    float3 _1845 = float3(_660, _662, float(0));
    float3 _1847 = select(_1845, float3(0.0), isnan(_1845));
    float _672 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1847.xy, uint(rint(_1847.z)), _632);
    float _674 = fma(_664, 2.0, _58);
    float _676 = fma(_666, 2.0, _56);
    float3 _1860 = float3(_658, _668, float(0));
    float3 _1862 = select(_1860, float3(0.0), isnan(_1860));
    float _678 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1862.xy, uint(rint(_1862.z)), _632);
    float3 _1869 = float3(_660, _668, float(0));
    float3 _1871 = select(_1869, float3(0.0), isnan(_1869));
    float _680 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1871.xy, uint(rint(_1871.z)), _632);
    float3 _1880 = float3(_600, _636, float(int(_536)));
    float3 _1882 = select(_1880, float3(0.0), isnan(_1880));
    float _682 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1882.xy, uint(rint(_1882.z)), _574);
    float3 _1891 = float3(_598, _636, float(int(_536)));
    float3 _1893 = select(_1891, float3(0.0), isnan(_1891));
    float _684 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1893.xy, uint(rint(_1893.z)), _574);
    float3 _1902 = float3(_598, _638, float(int(_536)));
    float3 _1904 = select(_1902, float3(0.0), isnan(_1902));
    float _686 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1904.xy, uint(rint(_1904.z)), _574);
    float3 _1913 = float3(_648, _642, float(int(_620)));
    float3 _1915 = select(_1913, float3(0.0), isnan(_1913));
    float _688 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1915.xy, uint(rint(_1915.z)), _612);
    float3 _1924 = float3(_646, _642, float(int(_620)));
    float3 _1926 = select(_1924, float3(0.0), isnan(_1924));
    float _690 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1926.xy, uint(rint(_1926.z)), _612);
    float3 _1935 = float3(_646, _644, float(int(_620)));
    float3 _1937 = select(_1935, float3(0.0), isnan(_1935));
    float _692 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1937.xy, uint(rint(_1937.z)), _612);
    float3 _1946 = float3(_600, _638, float(int(_536)));
    float3 _1948 = select(_1946, float3(0.0), isnan(_1946));
    float _694 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1948.xy, uint(rint(_1948.z)), _574);
    float3 _1957 = float3(_648, _644, float(int(_620)));
    float3 _1959 = select(_1957, float3(0.0), isnan(_1957));
    float _696 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1959.xy, uint(rint(_1959.z)), _612);
    float2 _1965 = float2(_676, _674);
    float _698 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1965, float2(0.0), isnan(_1965))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1965, float2(0.0), isnan(_1965))).x;
    float _700 = -_118;
    float _702 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _704 = _700 + _702;
    float _706 = _704 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _708 = precise::clamp(_706, 0.0, 1.0);
    float _710 = _670 + _672;
    float _712 = -_118;
    float _714 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _716 = _712 + _714;
    float _718 = _716 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _720 = precise::clamp(_718, 0.0, 1.0);
    float _722 = _710 + _678;
    float _724 = _722 + _680;
    float _726 = _684 + _682;
    float _728 = fma(_724, 0.25, _720);
    float _730 = _726 + _686;
    float _732 = _690 + _688;
    float _734 = _732 + _692;
    float _736 = _730 + _694;
    float _738 = _734 + _696;
    float _740 = _736 * 0.25;
    float _742 = _738 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _744 = _742 * 0.25;
    float _746 = fma(_740, (*spvDescriptorSet0.fp_c3)._m0[49].z, _744);
    float _748 = _708 + _746;
    out.m_49.x = _698;
    out.m_49.y = _728;
    out.m_49.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_49.w = _748;
    return out;
}

