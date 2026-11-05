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
    texture2d_array<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_E [[id(5)]];
    sampler fp_t_tcb_ESmplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_47 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_44 [[user(locn1), center_no_perspective]];
    float4 m_42 [[user(locn2), center_no_perspective]];
    float4 m_38 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float2 _744 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_744, float2(0.0), isnan(_744)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _761 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_761, float2(0.0), isnan(_761))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_761, float2(0.0), isnan(_761))).x;
    float _70 = in.m_40.y;
    float _72 = in.m_40.x;
    float _74 = in.m_42.y;
    float _76 = in.m_44.y;
    float _78 = in.m_42.x;
    float _80 = in.m_44.x;
    float _82 = -_62;
    float _84 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _86 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[46].z, _84);
    float _88 = -_64;
    float _90 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _92 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].z, _90);
    float _94 = -_66;
    float _96 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _98 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[46].z, _96);
    float _100 = _70 * _86;
    float _102 = _72 * _86;
    float _104 = -_100;
    float _106 = fma(_92, _74, _104);
    float _108 = -_100;
    float _110 = fma(_98, _76, _108);
    float _112 = -_102;
    float _114 = fma(_92, _78, _112);
    float _116 = -_102;
    float _118 = fma(_98, _80, _116);
    float _120 = _106 * _106;
    float _122 = _110 * _110;
    float _124 = -_86;
    float _126 = _124 + _92;
    float _128 = -_86;
    float _130 = _128 + _98;
    float _132 = fma(_114, _114, _120);
    float _134 = fma(_118, _118, _122);
    float _136 = fma(_126, _126, _132);
    float _138 = fma(_130, _130, _134);
    float _140 = -_68;
    float _142 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _144 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[46].z, _142);
    float _146 = rsqrt(_138);
    float _148 = _144 * _70;
    float _150 = _144 * _72;
    float _152 = -_148;
    float _154 = _152 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _156 = -_150;
    float _158 = _156 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _160 = _148 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _162 = rsqrt(_136);
    float _164 = _154 * _154;
    float _166 = -_150;
    float _168 = _166 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _170 = _148 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _172 = _148 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _174 = fma(_158, _158, _164);
    float _176 = -_144;
    float _178 = _176 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _180 = _148 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _182 = _130 * _146;
    float _184 = _118 * _146;
    float _186 = _110 * _146;
    float _188 = fma(_178, _178, _174);
    float _190 = _148 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _192 = _148 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _194 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[28].x, _160);
    float _196 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[29].x, _170);
    float _198 = _114 * _162;
    float _200 = _126 * _162;
    float _202 = _106 * _162;
    float _204 = sqrt(_188);
    float _206 = _198 * _182;
    float _208 = _200 * _186;
    float _210 = -_148;
    float _212 = _210 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _214 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[23].x, _190);
    float _216 = -_206;
    float _218 = fma(_200, _184, _216);
    float _220 = _202 * _184;
    float _222 = -_208;
    float _224 = fma(_202, _182, _222);
    float _226 = _212 * _212;
    float _228 = _218 * _218;
    float _230 = -_220;
    float _232 = fma(_198, _186, _230);
    float _234 = fma(_168, _168, _226);
    float _236 = fma(_224, _224, _228);
    float _238 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[23].z, _214);
    float _240 = _148 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    bool _244 = _204 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _246 = fma(_232, _232, _236);
    float _248 = -_144;
    float _250 = _248 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    bool _252 = _204 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _254 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[20].x, _240);
    float _256 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[22].x, _192);
    float _258 = fma(_250, _250, _234);
    float _260 = rsqrt(_246);
    bool _262 = !_244;
    int _265 = _262 ? 0 : 1;
    float _267 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[20].z, _254);
    float _269 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[22].z, _256);
    float _271 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[30].x, _172);
    float _273 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[31].x, _180);
    int _275 = 2;
    if (!_244)
    {
        _275 = 1;
    }
    int _277 = _275;
    float _279 = _267 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _281 = sqrt(_258);
    int _283 = _277;
    float _285 = _279;
    if (!_252)
    {
        _283 = _265;
    }
    int _287 = _283;
    float _289 = _148 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _291 = _148 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _293 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[28].z, _194);
    float _295 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[29].z, _196);
    float _297 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[21].x, _289);
    float _299 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[30].z, _271);
    float _301 = _224 * _260;
    float _303 = _218 * _260;
    float _305 = _148 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _307 = _232 * _260;
    float _309 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[21].z, _297);
    float _311 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[19].x, _305);
    bool _313 = _281 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _315 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[31].z, _273);
    bool _317 = _281 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _319 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[19].z, _311);
    float _321 = float(_287);
    float _323 = _303 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    bool _325 = !_317;
    int _327 = _325 ? 0 : 1;
    float _329 = _319 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _331 = precise::min(_321, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _333 = fma(_301, (*spvDescriptorSet0.fp_c3)._m0[35].x, _323);
    float _335 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[32].x, _291);
    float _337 = _293 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    bool _339 = _331 != 1.0;
    bool _341 = isnan(_331);
    bool _343 = _339 || _341;
    bool _345 = isnan(1.0);
    bool _347 = _343 || _345;
    float _349 = fma(_307, (*spvDescriptorSet0.fp_c3)._m0[35].z, _333);
    float _351 = _295 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    int _353 = 2;
    float _355 = _329;
    float _357 = _337;
    float _359 = _351;
    if (!_317)
    {
        _353 = 1;
    }
    int _361 = _353;
    float _363 = _148 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _365 = abs(_349);
    float _367 = -_365;
    float _369 = _367 + 1.0;
    float _371 = precise::clamp(_369, 0.0, 1.0);
    int _373 = _361;
    if (!_313)
    {
        _373 = _327;
    }
    int _375 = _373;
    float _377 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[32].z, _335);
    float _379 = _148 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _381 = abs(_371);
    float _383 = log2(_381);
    float _385 = float(_375);
    float _387 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[33].x, _363);
    float _389 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[18].x, _379);
    if (_347)
    {
        float _391 = _238 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _285 = _391;
    }
    float _393 = _285;
    float _395 = _393;
    if (_347)
    {
        float _397 = _269 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _355 = _397;
    }
    float _399 = _355;
    float _401 = _148 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _403 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[33].z, _387);
    float _405 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[18].z, _389);
    float _407 = precise::min(_385, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _409 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[24].x, _401);
    float _411 = _309 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _413 = _148 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    bool _415 = _407 != 1.0;
    bool _417 = isnan(_407);
    bool _419 = _415 || _417;
    bool _421 = isnan(1.0);
    bool _423 = _419 || _421;
    float _425 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[24].z, _409);
    float _427 = _383 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _429 = _299 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _431 = _411;
    float _433 = _429;
    float _435 = _399;
    if (_347)
    {
        float _437 = _425 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _431 = _437;
    }
    float _439 = _431;
    float _441 = _148 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _443 = _148 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _445 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[16].x, _413);
    float _447 = exp2(_427);
    float _449 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[17].x, _441);
    float _451 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[25].x, _443);
    bool _453 = _331 != 0.0;
    bool _455 = isnan(_331);
    bool _457 = _453 || _455;
    bool _459 = isnan(0.0);
    bool _461 = _457 || _459;
    float _463 = _439;
    if (_423)
    {
        float _465 = _315 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _357 = _465;
    }
    float _467 = _357;
    float _469 = _148 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _471 = _467;
    if (_423)
    {
        float _473 = _377 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _359 = _473;
    }
    float _475 = _359;
    float _477 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[17].z, _449);
    float _479 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[16].z, _445);
    float _481 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[26].x, _469);
    float _483 = _475;
    if (_423)
    {
        float _485 = _403 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _433 = _485;
    }
    float _487 = _433;
    bool _489 = _407 != 0.0;
    bool _491 = isnan(_407);
    bool _493 = _489 || _491;
    bool _495 = isnan(0.0);
    bool _497 = _493 || _495;
    float _499 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[25].z, _451);
    float _501 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[26].z, _481);
    float _503 = rint(_407);
    float _505 = precise::max(_503, 0.0);
    uint _508 = uint(_505);
    uint _510 = clamp(_508, 0u, 65535u);
    float _512 = _447 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _514 = _487;
    if (!_461)
    {
        float _516 = _477 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _395 = _516;
    }
    float _518 = _395;
    if (!_461)
    {
        float _520 = _479 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _435 = _520;
    }
    float _522 = _435;
    if (!_461)
    {
        float _524 = _405 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _463 = _524;
    }
    float _526 = _463;
    float _528 = fma(_303, _512, _148);
    float _530 = _148 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _532 = fma(_307, _512, _144);
    float _534 = 0.0 + _526;
    float _536 = precise::clamp(_534, 0.0, 1.0);
    float _538 = _528 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _540 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[27].x, _530);
    float _542 = fma(_301, _512, _150);
    float _544 = _528 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _546 = _528 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _548 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[27].z, _540);
    if (!_497)
    {
        float _550 = _499 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _471 = _550;
    }
    float _552 = _471;
    float _554 = fma(_542, (*spvDescriptorSet0.fp_c3)._m0[3].x, _544);
    float _556 = _528 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    if (!_497)
    {
        float _558 = _548 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _514 = _558;
    }
    float _560 = _514;
    if (!_497)
    {
        float _562 = _501 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _483 = _562;
    }
    float _564 = _483;
    float _566 = fma(_532, (*spvDescriptorSet0.fp_c3)._m0[3].z, _554);
    float _568 = fma(_542, (*spvDescriptorSet0.fp_c3)._m0[0].x, _556);
    float _570 = 0.0 + _560;
    float _572 = precise::clamp(_570, 0.0, 1.0);
    float _574 = _566 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _576 = fma(_542, (*spvDescriptorSet0.fp_c3)._m0[1].x, _546);
    float _578 = fma(_542, (*spvDescriptorSet0.fp_c3)._m0[2].x, _538);
    float _580 = fma(_532, (*spvDescriptorSet0.fp_c3)._m0[0].z, _568);
    float _582 = 1.0 / _574;
    float _584 = fma(_532, (*spvDescriptorSet0.fp_c3)._m0[1].z, _576);
    float _586 = fma(_532, (*spvDescriptorSet0.fp_c3)._m0[2].z, _578);
    float _588 = _580 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _590 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _592 = _584 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _594 = _586 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _596 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _598 = _536 * _596;
    float _600 = _596 * _572;
    float _602 = _592 * _582;
    float _604 = _594 * _582;
    float _606 = precise::clamp(_604, 0.0, 1.0);
    float _608 = _588 * _582;
    float _610 = _536 * _590;
    float _612 = rint(_331);
    float _614 = precise::max(_612, 0.0);
    uint _616 = uint(_614);
    uint _618 = clamp(_616, 0u, 65535u);
    float _620 = _590 * _572;
    float _622 = fma(_610, 0.5, _522);
    float _624 = fma(_610, -0.5, _522);
    float _626 = fma(_598, 0.5, _518);
    float _628 = fma(_598, -0.5, _518);
    float _630 = fma(_620, 0.5, _552);
    float _632 = rint(_606);
    float _634 = precise::max(_632, 0.0);
    uint _636 = uint(_634);
    uint _638 = clamp(_636, 0u, 65535u);
    float _640 = fma(_620, -0.5, _552);
    float _642 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _644 = fma(_600, 0.5, _564);
    float _646 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _648 = fma(_600, -0.5, _564);
    float _650 = fma(_642, 0.5, _608);
    float _652 = fma(_642, -0.5, _608);
    float _654 = fma(_646, 0.5, _602);
    float _656 = fma(_646, -0.5, _602);
    float3 _1800 = float3(_652, _654, float(int(_638)));
    float3 _1804 = select(_1800, float3(0.0), isnan(_1800));
    float _658 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1804.xy, uint(rint(_1804.z)), 1.0);
    float3 _1812 = float3(_650, _654, float(int(_638)));
    float3 _1814 = select(_1812, float3(0.0), isnan(_1812));
    float _660 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1814.xy, uint(rint(_1814.z)), 1.0);
    float3 _1822 = float3(_650, _656, float(int(_638)));
    float3 _1824 = select(_1822, float3(0.0), isnan(_1822));
    float _662 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1824.xy, uint(rint(_1824.z)), 1.0);
    float3 _1832 = float3(_652, _656, float(int(_638)));
    float3 _1834 = select(_1832, float3(0.0), isnan(_1832));
    float _664 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1834.xy, uint(rint(_1834.z)), 1.0);
    float3 _1842 = float3(_624, _626, float(int(_618)));
    float3 _1844 = select(_1842, float3(0.0), isnan(_1842));
    float _666 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1844.xy, uint(rint(_1844.z)), _536);
    float3 _1853 = float3(_622, _626, float(int(_618)));
    float3 _1855 = select(_1853, float3(0.0), isnan(_1853));
    float _668 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1855.xy, uint(rint(_1855.z)), _536);
    float3 _1864 = float3(_622, _628, float(int(_618)));
    float3 _1866 = select(_1864, float3(0.0), isnan(_1864));
    float _670 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1866.xy, uint(rint(_1866.z)), _536);
    float3 _1875 = float3(_640, _644, float(int(_510)));
    float3 _1877 = select(_1875, float3(0.0), isnan(_1875));
    float _672 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1877.xy, uint(rint(_1877.z)), _572);
    float3 _1886 = float3(_630, _644, float(int(_510)));
    float3 _1888 = select(_1886, float3(0.0), isnan(_1886));
    float _674 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1888.xy, uint(rint(_1888.z)), _572);
    float3 _1897 = float3(_630, _648, float(int(_510)));
    float3 _1899 = select(_1897, float3(0.0), isnan(_1897));
    float _676 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1899.xy, uint(rint(_1899.z)), _572);
    float3 _1908 = float3(_624, _628, float(int(_618)));
    float3 _1910 = select(_1908, float3(0.0), isnan(_1908));
    float _678 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1910.xy, uint(rint(_1910.z)), _536);
    float3 _1919 = float3(_640, _648, float(int(_510)));
    float3 _1921 = select(_1919, float3(0.0), isnan(_1919));
    float _680 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1921.xy, uint(rint(_1921.z)), _572);
    float2 _1927 = float2(_54, _56);
    float _682 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1927, float2(0.0), isnan(_1927))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1927, float2(0.0), isnan(_1927))).x;
    float _684 = -_144;
    float _686 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _688 = _684 + _686;
    float _690 = _688 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _692 = precise::clamp(_690, 0.0, 1.0);
    float _694 = _660 + _658;
    float _696 = -_144;
    float _698 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _700 = _696 + _698;
    float _702 = _694 + _662;
    float _704 = _668 + _666;
    float _706 = _700 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _708 = precise::clamp(_706, 0.0, 1.0);
    float _710 = _674 + _672;
    float _712 = _704 + _670;
    float _714 = _702 + _664;
    float _716 = _710 + _676;
    float _718 = fma(_714, 0.25, _708);
    float _720 = _712 + _678;
    float _722 = _716 + _680;
    float _724 = _720 * 0.25;
    float _726 = _722 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _728 = _726 * 0.25;
    float _730 = fma(_724, (*spvDescriptorSet0.fp_c3)._m0[49].z, _728);
    float _732 = _692 + _730;
    out.m_47.x = _682;
    out.m_47.y = _718;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _732;
    return out;
}

