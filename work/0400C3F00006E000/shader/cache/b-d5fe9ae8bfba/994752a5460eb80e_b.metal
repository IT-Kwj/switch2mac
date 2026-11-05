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
    texture2d_array<float> fp_t_tcb_E [[id(3)]];
    sampler fp_t_tcb_ESmplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
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
    float2 _676 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_676, float2(0.0), isnan(_676)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _693 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_693, float2(0.0), isnan(_693))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_693, float2(0.0), isnan(_693))).x;
    float _68 = in.m_38.y;
    float _70 = in.m_40.y;
    float _72 = in.m_38.x;
    float _74 = in.m_42.y;
    float _76 = in.m_40.x;
    float _78 = in.m_42.x;
    float _80 = -_60;
    float _82 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _84 = -_62;
    float _86 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _88 = -_64;
    float _90 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _92 = 1.0 / _82;
    float _94 = -_66;
    float _96 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _98 = 1.0 / _86;
    float _100 = 1.0 / _90;
    float _102 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _104 = _92 * _102;
    float _106 = _68 * _104;
    float _108 = _72 * _104;
    float _110 = 1.0 / _96;
    float _112 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _114 = _98 * _112;
    float _116 = -_106;
    float _118 = fma(_114, _70, _116);
    float _120 = -_108;
    float _122 = fma(_114, _76, _120);
    float _124 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _126 = _100 * _124;
    float _128 = _118 * _118;
    float _130 = -_104;
    float _132 = _130 + _114;
    float _134 = -_106;
    float _136 = fma(_126, _74, _134);
    float _138 = -_108;
    float _140 = fma(_126, _78, _138);
    float _142 = fma(_122, _122, _128);
    float _144 = -_104;
    float _146 = _144 + _126;
    float _148 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _150 = _110 * _148;
    float _152 = _136 * _136;
    float _154 = fma(_132, _132, _142);
    float _156 = _150 * _68;
    float _158 = fma(_140, _140, _152);
    float _160 = _150 * _72;
    float _162 = -_156;
    float _164 = _162 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _166 = fma(_146, _146, _158);
    float _168 = rsqrt(_154);
    float _170 = -_160;
    float _172 = _170 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _174 = _164 * _164;
    float _176 = -_156;
    float _178 = _176 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _180 = -_160;
    float _182 = _180 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _184 = _156 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _186 = fma(_172, _172, _174);
    float _188 = -_150;
    float _190 = _188 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _192 = rsqrt(_166);
    float _194 = _178 * _178;
    float _196 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[33].x, _184);
    float _198 = fma(_190, _190, _186);
    float _200 = -_150;
    float _202 = _200 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _204 = fma(_182, _182, _194);
    float _206 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[33].z, _196);
    float _208 = _156 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _210 = _122 * _168;
    float _212 = fma(_202, _202, _204);
    float _214 = _132 * _168;
    float _216 = _118 * _168;
    float _218 = sqrt(_198);
    float _220 = _156 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _222 = _156 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _224 = _156 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _226 = _146 * _192;
    float _228 = _136 * _192;
    float _230 = _140 * _192;
    float _232 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[24].x, _220);
    float _234 = _210 * _226;
    float _236 = _214 * _228;
    float _238 = sqrt(_212);
    float _240 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[27].x, _222);
    float _242 = -_234;
    float _244 = fma(_214, _230, _242);
    float _246 = _216 * _230;
    float _248 = -_236;
    float _250 = fma(_216, _226, _248);
    float _252 = _244 * _244;
    float _254 = -_246;
    float _256 = fma(_210, _228, _254);
    bool _260 = _218 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _262 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[27].z, _240);
    float _264 = fma(_250, _250, _252);
    bool _266 = _218 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _268 = _156 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    bool _270 = !_260;
    int _273 = _270 ? 0 : 1;
    float _275 = fma(_256, _256, _264);
    float _277 = _156 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    bool _279 = _238 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _281 = rsqrt(_275);
    bool _283 = _238 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _285 = _156 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    int _287 = 2;
    int _289 = 2;
    if (!_260)
    {
        _287 = 1;
    }
    int _291 = _287;
    float _293 = _156 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    bool _295 = !_279;
    int _297 = _295 ? 0 : 1;
    float _299 = _156 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    int _301 = _291;
    if (!_266)
    {
        _301 = _273;
    }
    int _303 = _301;
    float _305 = _156 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _307 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[22].x, _224);
    float _309 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[23].x, _268);
    float _311 = float(_303);
    float _313 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[18].x, _305);
    if (!_279)
    {
        _289 = 1;
    }
    int _315 = _289;
    float _317 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[28].x, _285);
    int _319 = _315;
    if (!_283)
    {
        _319 = _297;
    }
    int _321 = _319;
    float _323 = _244 * _281;
    float _325 = _250 * _281;
    float _327 = _256 * _281;
    float _329 = float(_321);
    float _331 = _323 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _333 = precise::min(_311, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _335 = _156 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _337 = precise::min(_329, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _339 = fma(_325, (*spvDescriptorSet0.fp_c3)._m0[35].x, _331);
    bool _341 = _333 != 1.0;
    bool _343 = isnan(_333);
    bool _345 = _341 || _343;
    bool _347 = isnan(1.0);
    bool _349 = _345 || _347;
    float _351 = _156 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    bool _353 = _333 != 0.0;
    bool _355 = isnan(_333);
    bool _357 = _353 || _355;
    bool _359 = isnan(0.0);
    bool _361 = _357 || _359;
    float _363 = fma(_327, (*spvDescriptorSet0.fp_c3)._m0[35].z, _339);
    bool _365 = _337 != 1.0;
    bool _367 = isnan(_337);
    bool _369 = _365 || _367;
    bool _371 = isnan(1.0);
    bool _373 = _369 || _371;
    float _375 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[21].x, _335);
    bool _377 = _337 != 0.0;
    bool _379 = isnan(_337);
    bool _381 = _377 || _379;
    bool _383 = isnan(0.0);
    bool _385 = _381 || _383;
    float _387 = abs(_363);
    float _389 = -_387;
    float _391 = _389 + 1.0;
    float _393 = precise::clamp(_391, 0.0, 1.0);
    float _395 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[30].x, _351);
    float _397 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[21].z, _375);
    float _399 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[24].z, _232);
    float _401 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[18].z, _313);
    float _403 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[30].z, _395);
    float _405 = abs(_393);
    float _407 = log2(_405);
    float _409 = _397 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _411 = _409;
    if (_349)
    {
        float _413 = _399 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _411 = _413;
    }
    float _415 = _411;
    float _417 = _403 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _419 = _415;
    float _421 = _417;
    if (!_361)
    {
        float _423 = _401 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _419 = _423;
    }
    float _425 = _419;
    if (_373)
    {
        float _427 = _206 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _421 = _427;
    }
    float _429 = _421;
    float _431 = _156 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _433 = _429;
    if (!_385)
    {
        float _435 = _262 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _433 = _435;
    }
    float _437 = _433;
    float _439 = _156 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _441 = _156 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _443 = _156 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _445 = _156 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _447 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[19].x, _431);
    float _449 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[26].x, _208);
    float _451 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[20].x, _439);
    float _453 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[31].x, _441);
    float _455 = _407 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _457 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[25].x, _277);
    float _459 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[16].x, _443);
    float _461 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[17].x, _445);
    float _463 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[29].x, _293);
    float _465 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[32].x, _299);
    float _467 = exp2(_455);
    float _469 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[20].z, _451);
    float _471 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[23].z, _309);
    float _473 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[17].z, _461);
    float _475 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[22].z, _307);
    float _477 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[16].z, _459);
    float _479 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[29].z, _463);
    float _481 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[32].z, _465);
    float _483 = rint(_337);
    float _485 = precise::max(_483, 0.0);
    uint _488 = uint(_485);
    uint _490 = clamp(_488, 0u, 65535u);
    float _492 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[28].z, _317);
    float _494 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[31].z, _453);
    float _496 = 0.0 + _437;
    float _498 = precise::clamp(_496, 0.0, 1.0);
    float _500 = 0.0 + _425;
    float _502 = precise::clamp(_500, 0.0, 1.0);
    float _504 = _467 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _506 = rint(_333);
    float _508 = precise::max(_506, 0.0);
    uint _510 = uint(_508);
    uint _512 = clamp(_510, 0u, 65535u);
    float _514 = fma(_323, _504, _156);
    float _516 = fma(_325, _504, _160);
    float _518 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[19].z, _447);
    float _520 = fma(_327, _504, _150);
    float _522 = _514 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _524 = _469 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _526 = _524;
    if (_349)
    {
        float _528 = _471 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _526 = _528;
    }
    float _530 = _526;
    float _532 = _530;
    if (!_361)
    {
        float _534 = _473 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _532 = _534;
    }
    float _536 = _532;
    float _538 = fma(_516, (*spvDescriptorSet0.fp_c3)._m0[3].x, _522);
    float _540 = _514 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _542 = _518 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _544 = _542;
    if (_349)
    {
        float _546 = _475 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _544 = _546;
    }
    float _548 = _544;
    float _550 = fma(_520, (*spvDescriptorSet0.fp_c3)._m0[3].z, _538);
    float _552 = _548;
    if (!_361)
    {
        float _554 = _477 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _552 = _554;
    }
    float _556 = _552;
    float _558 = fma(_516, (*spvDescriptorSet0.fp_c3)._m0[2].x, _540);
    float _560 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[25].z, _457);
    float _562 = _550 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _564 = _514 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _566 = fma(_520, (*spvDescriptorSet0.fp_c3)._m0[2].z, _558);
    float _568 = _514 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _570 = _479 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _572 = fma(_516, (*spvDescriptorSet0.fp_c3)._m0[0].x, _564);
    float _574 = 1.0 / _562;
    float _576 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[26].z, _449);
    float _578 = _566 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _580 = fma(_516, (*spvDescriptorSet0.fp_c3)._m0[1].x, _568);
    float _582 = _570;
    if (_373)
    {
        float _584 = _481 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _582 = _584;
    }
    float _586 = _582;
    float _588 = _492 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _590 = _586;
    float _592 = _588;
    if (!_385)
    {
        float _594 = _576 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _590 = _594;
    }
    float _596 = _590;
    if (_373)
    {
        float _598 = _494 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _592 = _598;
    }
    float _600 = _592;
    float _602 = fma(_520, (*spvDescriptorSet0.fp_c3)._m0[1].z, _580);
    float _604 = _600;
    if (!_385)
    {
        float _606 = _560 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _604 = _606;
    }
    float _608 = _604;
    float _610 = fma(_520, (*spvDescriptorSet0.fp_c3)._m0[0].z, _572);
    float _612 = _602 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _614 = _578 * _574;
    float _616 = precise::clamp(_614, 0.0, 1.0);
    float3 _1658 = float3(_608, _596, float(int(_490)));
    float3 _1662 = select(_1658, float3(0.0), isnan(_1658));
    float _618 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1662.xy, uint(rint(_1662.z)), _498);
    float3 _1671 = float3(_556, _536, float(int(_512)));
    float3 _1673 = select(_1671, float3(0.0), isnan(_1671));
    float _620 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1673.xy, uint(rint(_1673.z)), _502);
    float _622 = _610 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _624 = _612 * _574;
    float _626 = rint(_616);
    float _628 = precise::max(_626, 0.0);
    uint _630 = uint(_628);
    uint _632 = clamp(_630, 0u, 65535u);
    float _634 = _622 * _574;
    float3 _1700 = float3(_634, _624, float(int(_632)));
    float3 _1702 = select(_1700, float3(0.0), isnan(_1700));
    float _636 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1702.xy, uint(rint(_1702.z)), 1.0);
    float _638 = -_150;
    float _640 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _642 = _638 + _640;
    float _644 = -_150;
    float _646 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _648 = _644 + _646;
    float _650 = _642 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _652 = precise::clamp(_650, 0.0, 1.0);
    float _654 = _648 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _656 = precise::clamp(_654, 0.0, 1.0);
    float _658 = _618 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _660 = fma(_620, (*spvDescriptorSet0.fp_c3)._m0[49].z, _658);
    float _662 = _652 + _660;
    float _664 = _656 + _636;
    out.m_45.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_45.y = _664;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _662;
    return out;
}

