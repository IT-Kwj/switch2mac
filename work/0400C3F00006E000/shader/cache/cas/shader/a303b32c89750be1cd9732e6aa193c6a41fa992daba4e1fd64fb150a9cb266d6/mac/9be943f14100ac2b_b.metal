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
    float2 _765 = float2(_56, _58);
    float3 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_765, float2(0.0), isnan(_765)), int2(0), component::x).xyw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float2 _782 = float2(_56, _58);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_782, float2(0.0), isnan(_782))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_782, float2(0.0), isnan(_782))).x;
    float2 _790 = float2(_56, _58);
    float2 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_790, float2(0.0), isnan(_790))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_790, float2(0.0), isnan(_790))).xy;
    float _76 = _74.x;
    float _78 = _74.y;
    float _80 = in.m_42.y;
    float _82 = in.m_42.x;
    float _84 = in.m_44.y;
    float _86 = in.m_46.y;
    float _88 = in.m_44.x;
    float _90 = in.m_46.x;
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
    float _114 = -_96;
    float _116 = _114 + _102;
    float _118 = -_110;
    float _120 = fma(_102, _84, _118);
    float _122 = -_110;
    float _124 = fma(_108, _86, _122);
    float _126 = -_112;
    float _128 = fma(_102, _88, _126);
    float _130 = -_112;
    float _132 = fma(_108, _90, _130);
    float _134 = _120 * _120;
    float _136 = _124 * _124;
    float _138 = -_96;
    float _140 = _138 + _108;
    float _142 = fma(_128, _128, _134);
    float _144 = fma(_132, _132, _136);
    float _146 = -_70;
    float _148 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _150 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[46].z, _148);
    float _152 = fma(_116, _116, _142);
    float _154 = fma(_140, _140, _144);
    float _156 = _150 * _82;
    float _158 = _150 * _80;
    float _160 = rsqrt(_154);
    float _162 = -_156;
    float _164 = _162 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _166 = -_158;
    float _168 = _166 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _170 = -_158;
    float _172 = _170 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _174 = _158 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _176 = _158 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _178 = _168 * _168;
    float _180 = -_156;
    float _182 = _180 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _184 = rsqrt(_152);
    float _186 = _172 * _172;
    float _188 = fma(_164, _164, _178);
    float _190 = -_150;
    float _192 = _190 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _194 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[24].x, _174);
    float _196 = fma(_182, _182, _186);
    float _198 = _158 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _200 = fma(_192, _192, _188);
    float _202 = _140 * _160;
    float _204 = _124 * _160;
    float _206 = _132 * _160;
    float _208 = -_150;
    float _210 = _208 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _212 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[24].z, _194);
    float _214 = sqrt(_200);
    float _216 = _158 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _218 = fma(_210, _210, _196);
    float _220 = _128 * _184;
    float _222 = _116 * _184;
    float _224 = _120 * _184;
    float _226 = _158 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _228 = _220 * _202;
    float _230 = _222 * _204;
    float _232 = sqrt(_218);
    float _234 = _158 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _236 = -_228;
    float _238 = fma(_222, _206, _236);
    float _240 = _224 * _206;
    float _242 = -_230;
    float _244 = fma(_224, _202, _242);
    float _246 = _238 * _238;
    float _248 = -_240;
    float _250 = fma(_220, _204, _248);
    bool _254 = _214 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _256 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[32].x, _226);
    float _258 = fma(_244, _244, _246);
    bool _260 = _214 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _262 = _158 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    bool _264 = !_254;
    int _267 = _264 ? 0 : 1;
    float _269 = fma(_250, _250, _258);
    float _271 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[22].x, _262);
    bool _273 = _232 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _275 = rsqrt(_269);
    bool _277 = _232 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _279 = _158 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    bool _281 = !_273;
    int _283 = _281 ? 0 : 1;
    float _285 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[22].z, _271);
    int _287 = 2;
    int _289 = 2;
    if (!_254)
    {
        _287 = 1;
    }
    int _291 = _287;
    float _293 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[23].x, _279);
    int _295 = _291;
    if (!_260)
    {
        _295 = _267;
    }
    int _297 = _295;
    float _299 = _158 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _301 = _158 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _303 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[23].z, _293);
    float _305 = float(_297);
    float _307 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[33].x, _234);
    if (!_273)
    {
        _289 = 1;
    }
    int _309 = _289;
    float _311 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[32].z, _256);
    int _313 = _309;
    if (!_277)
    {
        _313 = _283;
    }
    int _315 = _313;
    float _317 = _244 * _275;
    float _319 = _238 * _275;
    float _321 = _250 * _275;
    float _323 = _158 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _325 = _158 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _327 = float(_315);
    float _329 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[33].z, _307);
    float _331 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[19].x, _323);
    float _333 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[20].x, _325);
    float _335 = precise::min(_305, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _337 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[21].x, _299);
    float _339 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[19].z, _331);
    float _341 = _319 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    bool _343 = _335 != 1.0;
    bool _345 = isnan(_335);
    bool _347 = _343 || _345;
    bool _349 = isnan(1.0);
    bool _351 = _347 || _349;
    float _353 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[20].z, _333);
    float _355 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[21].z, _337);
    float _357 = fma(_317, (*spvDescriptorSet0.fp_c3)._m0[35].x, _341);
    float _359 = precise::min(_327, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _361 = _339 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _363 = _353 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _365 = fma(_321, (*spvDescriptorSet0.fp_c3)._m0[35].z, _357);
    float _367 = _355 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    bool _369 = _359 != 1.0;
    bool _371 = isnan(_359);
    bool _373 = _369 || _371;
    bool _375 = isnan(1.0);
    bool _377 = _373 || _375;
    float _379 = _158 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _381 = abs(_365);
    float _383 = -_381;
    float _385 = _383 + 1.0;
    float _387 = precise::clamp(_385, 0.0, 1.0);
    float _389 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[28].x, _301);
    float _391 = _361;
    float _393 = _363;
    float _395 = _367;
    if (_351)
    {
        float _397 = _285 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _391 = _397;
    }
    float _399 = _391;
    float _401 = _399;
    if (_351)
    {
        float _403 = _303 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _393 = _403;
    }
    float _405 = _393;
    float _407 = _405;
    if (_351)
    {
        float _409 = _212 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _395 = _409;
    }
    float _411 = _395;
    bool _413 = _335 != 0.0;
    bool _415 = isnan(_335);
    bool _417 = _413 || _415;
    bool _419 = isnan(0.0);
    bool _421 = _417 || _419;
    float _423 = abs(_387);
    float _425 = log2(_423);
    float _427 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[29].x, _198);
    float _429 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[30].x, _176);
    float _431 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[31].x, _216);
    float _433 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[16].x, _379);
    float _435 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[28].z, _389);
    float _437 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[29].z, _427);
    float _439 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[30].z, _429);
    float _441 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[31].z, _431);
    float _443 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[16].z, _433);
    float _445 = _158 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _447 = _158 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _449 = _158 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _451 = _435 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _453 = _437 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _455 = _439 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _457 = _425 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _459 = _451;
    float _461 = _453;
    float _463 = _455;
    float _465 = _411;
    if (_377)
    {
        float _467 = _441 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _459 = _467;
    }
    float _469 = _459;
    float _471 = _469;
    if (_377)
    {
        float _473 = _311 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _461 = _473;
    }
    float _475 = _461;
    float _477 = _475;
    if (_377)
    {
        float _479 = _329 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _463 = _479;
    }
    float _481 = _463;
    float _483 = _481;
    if (!_421)
    {
        float _485 = _443 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _401 = _485;
    }
    float _487 = _401;
    float _489 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[17].x, _445);
    float _491 = exp2(_457);
    float _493 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[25].x, _447);
    float _495 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[26].x, _449);
    float _497 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[17].z, _489);
    bool _499 = _359 != 0.0;
    bool _501 = isnan(_359);
    bool _503 = _499 || _501;
    bool _505 = isnan(0.0);
    bool _507 = _503 || _505;
    float _509 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[25].z, _493);
    float _511 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[26].z, _495);
    if (!_421)
    {
        float _513 = _497 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _407 = _513;
    }
    float _515 = _407;
    float _517 = rint(_335);
    float _519 = precise::max(_517, 0.0);
    uint _522 = uint(_519);
    uint _524 = clamp(_522, 0u, 65535u);
    float _526 = _491 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _528 = _158 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    if (!_507)
    {
        float _530 = _509 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _471 = _530;
    }
    float _532 = _471;
    if (!_507)
    {
        float _534 = _511 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _477 = _534;
    }
    float _536 = _477;
    float _538 = fma(_319, _526, _158);
    float _540 = _158 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _542 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[18].x, _528);
    float _544 = fma(_321, _526, _150);
    float _546 = _538 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _548 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[27].x, _540);
    float _550 = fma(_317, _526, _156);
    float _552 = _538 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _554 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[18].z, _542);
    float _556 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[27].z, _548);
    float _558 = fma(_550, (*spvDescriptorSet0.fp_c3)._m0[2].x, _546);
    float _560 = fma(_550, (*spvDescriptorSet0.fp_c3)._m0[3].x, _552);
    float _562 = _538 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    if (!_421)
    {
        float _564 = _554 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _465 = _564;
    }
    float _566 = _465;
    float _568 = fma(_544, (*spvDescriptorSet0.fp_c3)._m0[3].z, _560);
    if (!_507)
    {
        float _570 = _556 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _483 = _570;
    }
    float _572 = _483;
    float _574 = fma(_550, (*spvDescriptorSet0.fp_c3)._m0[1].x, _562);
    float _576 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _578 = _568 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _580 = _538 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _582 = fma(_544, (*spvDescriptorSet0.fp_c3)._m0[2].z, _558);
    float _584 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _586 = 0.0 + _572;
    float _588 = precise::clamp(_586, 0.0, 1.0);
    float _590 = fma(_550, (*spvDescriptorSet0.fp_c3)._m0[0].x, _580);
    float _592 = 1.0 / _578;
    float _594 = 0.0 + _566;
    float _596 = precise::clamp(_594, 0.0, 1.0);
    float _598 = fma(_544, (*spvDescriptorSet0.fp_c3)._m0[1].z, _574);
    float _600 = fma(_544, (*spvDescriptorSet0.fp_c3)._m0[0].z, _590);
    float _602 = _582 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _604 = _596 * _576;
    float _606 = _596 * _584;
    float _608 = _600 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _610 = _584 * _588;
    float _612 = _598 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _614 = _576 * _588;
    float _616 = rint(_359);
    float _618 = precise::max(_616, 0.0);
    uint _620 = uint(_618);
    uint _622 = clamp(_620, 0u, 65535u);
    float _624 = fma(_606, 0.5, _487);
    float _626 = fma(_606, -0.5, _487);
    float _628 = _608 * _592;
    float _630 = fma(_604, 0.5, _515);
    float _632 = _602 * _592;
    float _634 = precise::clamp(_632, 0.0, 1.0);
    float _636 = fma(_604, -0.5, _515);
    float _638 = fma(_610, 0.5, _532);
    float _640 = _612 * _592;
    float _642 = fma(_610, -0.5, _532);
    float _644 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _646 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _648 = fma(_76, 2.0, -1.0);
    float _650 = rint(_634);
    float _652 = precise::max(_650, 0.0);
    uint _654 = uint(_652);
    uint _656 = clamp(_654, 0u, 65535u);
    float _658 = fma(_614, 0.5, _536);
    float _660 = fma(_646, 0.5, _640);
    float _662 = fma(_614, -0.5, _536);
    float _664 = fma(_646, -0.5, _640);
    float _666 = fma(_644, 0.5, _628);
    float _668 = _648 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _670 = fma(_644, -0.5, _628);
    float _672 = fma(_78, 2.0, -1.0);
    float _674 = fma(_668, 2.0, _56);
    float _676 = _672 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _678 = fma(_676, 2.0, _58);
    float3 _1854 = float3(_670, _660, float(int(_656)));
    float3 _1858 = select(_1854, float3(0.0), isnan(_1854));
    float _680 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1858.xy, uint(rint(_1858.z)), 1.0);
    float3 _1866 = float3(_666, _660, float(int(_656)));
    float3 _1868 = select(_1866, float3(0.0), isnan(_1866));
    float _682 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1868.xy, uint(rint(_1868.z)), 1.0);
    float3 _1876 = float3(_666, _664, float(int(_656)));
    float3 _1878 = select(_1876, float3(0.0), isnan(_1876));
    float _684 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1878.xy, uint(rint(_1878.z)), 1.0);
    float3 _1886 = float3(_670, _664, float(int(_656)));
    float3 _1888 = select(_1886, float3(0.0), isnan(_1886));
    float _686 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1888.xy, uint(rint(_1888.z)), 1.0);
    float3 _1896 = float3(_626, _630, float(int(_524)));
    float3 _1898 = select(_1896, float3(0.0), isnan(_1896));
    float _688 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1898.xy, uint(rint(_1898.z)), _596);
    float3 _1907 = float3(_624, _630, float(int(_524)));
    float3 _1909 = select(_1907, float3(0.0), isnan(_1907));
    float _690 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1909.xy, uint(rint(_1909.z)), _596);
    float3 _1918 = float3(_624, _636, float(int(_524)));
    float3 _1920 = select(_1918, float3(0.0), isnan(_1918));
    float _692 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1920.xy, uint(rint(_1920.z)), _596);
    float3 _1929 = float3(_642, _658, float(int(_622)));
    float3 _1931 = select(_1929, float3(0.0), isnan(_1929));
    float _694 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1931.xy, uint(rint(_1931.z)), _588);
    float3 _1940 = float3(_638, _658, float(int(_622)));
    float3 _1942 = select(_1940, float3(0.0), isnan(_1940));
    float _696 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1942.xy, uint(rint(_1942.z)), _588);
    float3 _1951 = float3(_638, _662, float(int(_622)));
    float3 _1953 = select(_1951, float3(0.0), isnan(_1951));
    float _698 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1953.xy, uint(rint(_1953.z)), _588);
    float3 _1962 = float3(_626, _636, float(int(_524)));
    float3 _1964 = select(_1962, float3(0.0), isnan(_1962));
    float _700 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1964.xy, uint(rint(_1964.z)), _596);
    float3 _1973 = float3(_642, _662, float(int(_622)));
    float3 _1975 = select(_1973, float3(0.0), isnan(_1973));
    float _702 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1975.xy, uint(rint(_1975.z)), _588);
    float2 _1981 = float2(_674, _678);
    float _704 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1981, float2(0.0), isnan(_1981))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1981, float2(0.0), isnan(_1981))).x;
    float _706 = _682 + _680;
    float _708 = -_150;
    float _710 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _712 = _708 + _710;
    float _714 = _706 + _684;
    float _716 = _690 + _688;
    float _718 = _712 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _720 = precise::clamp(_718, 0.0, 1.0);
    float _722 = -_150;
    float _724 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _726 = _722 + _724;
    float _728 = _714 + _686;
    float _730 = _716 + _692;
    float _732 = _726 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _734 = precise::clamp(_732, 0.0, 1.0);
    float _736 = _696 + _694;
    float _738 = fma(_728, 0.25, _720);
    float _740 = _736 + _698;
    float _742 = _730 + _700;
    float _744 = _740 + _702;
    float _746 = _742 * 0.25;
    float _748 = _744 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _750 = _748 * 0.25;
    float _752 = fma(_746, (*spvDescriptorSet0.fp_c3)._m0[49].z, _750);
    float _754 = _734 + _752;
    out.m_49.x = _704;
    out.m_49.y = _738;
    out.m_49.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_49.w = _754;
    return out;
}

