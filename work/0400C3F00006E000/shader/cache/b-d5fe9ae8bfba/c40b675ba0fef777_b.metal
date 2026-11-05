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
    float2 _750 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_750, float2(0.0), isnan(_750)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _767 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_767, float2(0.0), isnan(_767))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_767, float2(0.0), isnan(_767))).x;
    float _68 = in.m_38.y;
    float _70 = in.m_38.x;
    float _72 = in.m_40.y;
    float _74 = in.m_42.y;
    float _76 = in.m_40.x;
    float _78 = in.m_42.x;
    float _80 = -_60;
    float _82 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _84 = -_64;
    float _86 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _88 = -_62;
    float _90 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _92 = 1.0 / _82;
    float _94 = 1.0 / _90;
    float _96 = -_66;
    float _98 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _100 = 1.0 / _86;
    float _102 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _104 = _92 * _102;
    float _106 = _68 * _104;
    float _108 = _70 * _104;
    float _110 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _112 = _94 * _110;
    float _114 = 1.0 / _98;
    float _116 = -_106;
    float _118 = fma(_112, _72, _116);
    float _120 = -_108;
    float _122 = fma(_112, _76, _120);
    float _124 = -_104;
    float _126 = _124 + _112;
    float _128 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _130 = _100 * _128;
    float _132 = _118 * _118;
    float _134 = -_106;
    float _136 = fma(_130, _74, _134);
    float _138 = -_108;
    float _140 = fma(_130, _78, _138);
    float _142 = fma(_122, _122, _132);
    float _144 = -_104;
    float _146 = _144 + _130;
    float _148 = _136 * _136;
    float _150 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _152 = _114 * _150;
    float _154 = fma(_126, _126, _142);
    float _156 = fma(_140, _140, _148);
    float _158 = _152 * _68;
    float _160 = fma(_146, _146, _156);
    float _162 = rsqrt(_154);
    float _164 = rsqrt(_160);
    float _166 = _122 * _162;
    float _168 = _126 * _162;
    float _170 = _118 * _162;
    float _172 = _146 * _164;
    float _174 = _136 * _164;
    float _176 = _140 * _164;
    float _178 = _166 * _172;
    float _180 = _168 * _174;
    float _182 = -_178;
    float _184 = fma(_168, _176, _182);
    float _186 = -_180;
    float _188 = fma(_170, _172, _186);
    float _190 = _170 * _176;
    float _192 = _184 * _184;
    float _194 = -_190;
    float _196 = fma(_166, _174, _194);
    float _198 = fma(_188, _188, _192);
    float _200 = fma(_196, _196, _198);
    float _202 = rsqrt(_200);
    float _204 = -_158;
    float _206 = _204 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _208 = _184 * _202;
    float _210 = _188 * _202;
    float _212 = _196 * _202;
    float _214 = _152 * _70;
    float _216 = _208 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _218 = -_158;
    float _220 = _218 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _222 = -_214;
    float _224 = _222 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _226 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[35].x, _216);
    float _228 = _220 * _220;
    float _230 = -_214;
    float _232 = _230 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _234 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[35].z, _226);
    float _236 = fma(_224, _224, _228);
    float _238 = -_152;
    float _240 = _238 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _242 = abs(_234);
    float _244 = -_242;
    float _246 = _244 + 1.0;
    float _248 = precise::clamp(_246, 0.0, 1.0);
    float _250 = fma(_240, _240, _236);
    float _252 = -_152;
    float _254 = _252 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _256 = abs(_248);
    float _258 = log2(_256);
    float _260 = sqrt(_250);
    float _262 = _258 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _264 = _206 * _206;
    float _266 = fma(_232, _232, _264);
    float _268 = exp2(_262);
    bool _272 = _260 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _274 = fma(_254, _254, _266);
    bool _276 = _260 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _278 = sqrt(_274);
    float _280 = _268 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    int _283 = 2;
    if (!_276)
    {
        _283 = 1;
    }
    int _285 = _283;
    float _287 = fma(_208, _280, _158);
    float _289 = fma(_210, _280, _214);
    float _291 = fma(_212, _280, _152);
    float _293 = _287 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _295 = _287 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    bool _297 = _278 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _299 = fma(_289, (*spvDescriptorSet0.fp_c3)._m0[3].x, _293);
    float _301 = fma(_289, (*spvDescriptorSet0.fp_c3)._m0[2].x, _295);
    bool _303 = _278 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _305 = fma(_291, (*spvDescriptorSet0.fp_c3)._m0[3].z, _299);
    float _307 = fma(_291, (*spvDescriptorSet0.fp_c3)._m0[2].z, _301);
    float _309 = _305 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _311 = _287 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _313 = _287 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _315 = _307 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _317 = fma(_289, (*spvDescriptorSet0.fp_c3)._m0[0].x, _311);
    float _319 = 1.0 / _309;
    float _321 = fma(_289, (*spvDescriptorSet0.fp_c3)._m0[1].x, _313);
    float _323 = fma(_291, (*spvDescriptorSet0.fp_c3)._m0[0].z, _317);
    float _325 = fma(_291, (*spvDescriptorSet0.fp_c3)._m0[1].z, _321);
    bool _327 = !_297;
    int _329 = _327 ? 0 : 1;
    float _331 = _323 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _333 = _325 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _335 = _315 * _319;
    float _337 = precise::clamp(_335, 0.0, 1.0);
    float _339 = _331 * _319;
    float _341 = _333 * _319;
    bool _343 = !_276;
    int _345 = _343 ? 0 : 1;
    float _347 = (*spvDescriptorSet0.fp_c3)._m0[47].x * _337;
    int _349 = 2;
    int _351 = _285;
    if (!_297)
    {
        _349 = 1;
    }
    int _353 = _349;
    float _355 = _347 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _357 = _347 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _359 = fma(_355, 0.5, _339);
    float _361 = fma(_357, 0.5, _341);
    float3 _1246 = float3(_359, _361, float(0));
    float3 _1250 = select(_1246, float3(0.0), isnan(_1246));
    float _363 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1250.xy, uint(rint(_1250.z)), _337);
    int _365 = _353;
    if (!_272)
    {
        _351 = _345;
    }
    int _367 = _351;
    float _369 = _158 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    if (!_303)
    {
        _365 = _329;
    }
    int _371 = _365;
    float _373 = _158 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _375 = _158 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _377 = _158 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _379 = _158 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _381 = _158 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _383 = _158 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _385 = _158 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _387 = _158 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _389 = _158 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _391 = _158 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _393 = _158 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _395 = _158 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _397 = _158 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _399 = _158 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _401 = _158 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _403 = _158 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _405 = _158 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _407 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[24].x, _381);
    float _409 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[20].x, _375);
    float _411 = float(_367);
    float _413 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[26].x, _391);
    float _415 = float(_371);
    float _417 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[23].x, _377);
    float _419 = precise::min(_411, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _421 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[28].x, _395);
    float _423 = precise::min(_415, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _425 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[31].x, _401);
    bool _427 = _419 != 1.0;
    bool _429 = isnan(_419);
    bool _431 = _427 || _429;
    bool _433 = isnan(1.0);
    bool _435 = _431 || _433;
    float _437 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[20].z, _409);
    bool _439 = _423 != 1.0;
    bool _441 = isnan(_423);
    bool _443 = _439 || _441;
    bool _445 = isnan(1.0);
    bool _447 = _443 || _445;
    float _449 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[23].z, _417);
    bool _451 = _423 != 0.0;
    bool _453 = isnan(_423);
    bool _455 = _451 || _453;
    bool _457 = isnan(0.0);
    bool _459 = _455 || _457;
    float _461 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[30].x, _399);
    bool _463 = _419 != 0.0;
    bool _465 = isnan(_419);
    bool _467 = _463 || _465;
    bool _469 = isnan(0.0);
    bool _471 = _467 || _469;
    float _473 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[19].x, _369);
    float _475 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[22].x, _373);
    float _477 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[21].x, _379);
    float _479 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[16].x, _383);
    float _481 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[17].x, _385);
    float _483 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[18].x, _387);
    float _485 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[25].x, _389);
    float _487 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[27].x, _393);
    float _489 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[29].x, _397);
    float _491 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[32].x, _403);
    float _493 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[33].x, _405);
    float _495 = _437 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _497 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[28].z, _421);
    float _499 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[31].z, _425);
    float _501 = _495;
    if (_435)
    {
        float _503 = _449 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _501 = _503;
    }
    float _505 = _501;
    float _507 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[30].z, _461);
    float _509 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[33].z, _493);
    float _511 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[21].z, _477);
    float _513 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[29].z, _489);
    float _515 = _497 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _517 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[27].z, _487);
    float _519 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[24].z, _407);
    float _521 = _515;
    float _523 = _505;
    if (_447)
    {
        float _525 = _499 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _521 = _525;
    }
    float _527 = _521;
    float _529 = _507 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _531 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[18].z, _483);
    float _533 = rint(_419);
    float _535 = precise::max(_533, 0.0);
    uint _538 = uint(_535);
    uint _540 = clamp(_538, 0u, 65535u);
    float _542 = _529;
    float _544 = _527;
    if (_447)
    {
        float _546 = _509 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _542 = _546;
    }
    float _548 = _542;
    float _550 = _511 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _552 = _513 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _554 = _548;
    float _556 = _550;
    float _558 = _552;
    if (!_459)
    {
        float _560 = _517 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _554 = _560;
    }
    float _562 = _554;
    if (_435)
    {
        float _564 = _519 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _556 = _564;
    }
    float _566 = _556;
    float _568 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _570 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _572 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[17].z, _481);
    float _574 = _566;
    if (!_471)
    {
        float _576 = _531 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _574 = _576;
    }
    float _578 = _574;
    float _580 = rint(_423);
    float _582 = precise::max(_580, 0.0);
    uint _584 = uint(_582);
    uint _586 = clamp(_584, 0u, 65535u);
    float _588 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[19].z, _473);
    float _590 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[22].z, _475);
    if (!_471)
    {
        float _592 = _572 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _523 = _592;
    }
    float _594 = _523;
    float _596 = 0.0 + _578;
    float _598 = precise::clamp(_596, 0.0, 1.0);
    float _600 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[16].z, _479);
    float _602 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[25].z, _485);
    float _604 = 0.0 + _562;
    float _606 = precise::clamp(_604, 0.0, 1.0);
    float _608 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[32].z, _491);
    float _610 = _588 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _612 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[26].z, _413);
    float _614 = _610;
    if (_435)
    {
        float _616 = _590 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _614 = _616;
    }
    float _618 = _614;
    float _620 = _598 * _568;
    float _622 = fma(_355, -0.5, _339);
    float _624 = fma(_357, -0.5, _341);
    float _626 = _618;
    if (!_471)
    {
        float _628 = _600 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _626 = _628;
    }
    float _630 = _626;
    if (!_459)
    {
        float _632 = _602 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _544 = _632;
    }
    float _634 = _544;
    float _636 = _568 * _606;
    if (_447)
    {
        float _638 = _608 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _558 = _638;
    }
    float _640 = _558;
    float _642 = _598 * _570;
    float _644 = _640;
    if (!_459)
    {
        float _646 = _612 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _644 = _646;
    }
    float _648 = _644;
    float _650 = _570 * _606;
    float _652 = fma(_620, 0.5, _630);
    float _654 = fma(_636, 0.5, _634);
    float _656 = fma(_620, -0.5, _630);
    float _658 = fma(_642, 0.5, _594);
    float _660 = fma(_636, -0.5, _634);
    float _662 = fma(_650, 0.5, _648);
    float3 _1819 = float3(_622, _361, float(0));
    float3 _1821 = select(_1819, float3(0.0), isnan(_1819));
    float _664 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1821.xy, uint(rint(_1821.z)), _337);
    float3 _1828 = float3(_359, _624, float(0));
    float3 _1830 = select(_1828, float3(0.0), isnan(_1828));
    float _666 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1830.xy, uint(rint(_1830.z)), _337);
    float3 _1837 = float3(_622, _624, float(0));
    float3 _1839 = select(_1837, float3(0.0), isnan(_1837));
    float _668 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1839.xy, uint(rint(_1839.z)), _337);
    float3 _1848 = float3(_656, _658, float(int(_540)));
    float3 _1850 = select(_1848, float3(0.0), isnan(_1848));
    float _670 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1850.xy, uint(rint(_1850.z)), _598);
    float _672 = fma(_642, -0.5, _594);
    float _674 = fma(_650, -0.5, _648);
    float3 _1865 = float3(_652, _658, float(int(_540)));
    float3 _1867 = select(_1865, float3(0.0), isnan(_1865));
    float _676 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1867.xy, uint(rint(_1867.z)), _598);
    float3 _1876 = float3(_660, _662, float(int(_586)));
    float3 _1878 = select(_1876, float3(0.0), isnan(_1876));
    float _678 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1878.xy, uint(rint(_1878.z)), _606);
    float3 _1887 = float3(_654, _662, float(int(_586)));
    float3 _1889 = select(_1887, float3(0.0), isnan(_1887));
    float _680 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1889.xy, uint(rint(_1889.z)), _606);
    float3 _1898 = float3(_652, _672, float(int(_540)));
    float3 _1900 = select(_1898, float3(0.0), isnan(_1898));
    float _682 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1900.xy, uint(rint(_1900.z)), _598);
    float3 _1909 = float3(_654, _674, float(int(_586)));
    float3 _1911 = select(_1909, float3(0.0), isnan(_1909));
    float _684 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1911.xy, uint(rint(_1911.z)), _606);
    float3 _1920 = float3(_656, _672, float(int(_540)));
    float3 _1922 = select(_1920, float3(0.0), isnan(_1920));
    float _686 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1922.xy, uint(rint(_1922.z)), _598);
    float3 _1931 = float3(_660, _674, float(int(_586)));
    float3 _1933 = select(_1931, float3(0.0), isnan(_1931));
    float _688 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1933.xy, uint(rint(_1933.z)), _606);
    float _690 = -_152;
    float _692 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _694 = _690 + _692;
    float _696 = _694 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _698 = precise::clamp(_696, 0.0, 1.0);
    float _700 = -_152;
    float _702 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _704 = _700 + _702;
    float _706 = _704 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _708 = precise::clamp(_706, 0.0, 1.0);
    float _710 = _363 + _664;
    float _712 = _710 + _666;
    float _714 = _712 + _668;
    float _716 = _676 + _670;
    float _718 = fma(_714, 0.25, _698);
    float _720 = _680 + _678;
    float _722 = _716 + _682;
    float _724 = _720 + _684;
    float _726 = _722 + _686;
    float _728 = _724 + _688;
    float _730 = _726 * 0.25;
    float _732 = _728 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _734 = _732 * 0.25;
    float _736 = fma(_730, (*spvDescriptorSet0.fp_c3)._m0[49].z, _734);
    float _738 = _708 + _736;
    out.m_45.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_45.y = _718;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _738;
    return out;
}

