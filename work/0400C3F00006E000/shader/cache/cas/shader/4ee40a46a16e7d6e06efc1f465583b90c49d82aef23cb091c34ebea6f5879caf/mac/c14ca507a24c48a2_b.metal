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
    texture2d_array<float> fp_t_tcb_12 [[id(5)]];
    sampler fp_t_tcb_12Smplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    texture2d_array<float> fp_t_tcb_E [[id(9)]];
    sampler fp_t_tcb_ESmplr [[id(10)]];
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
    float2 _685 = float2(_56, _58);
    float3 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_685, float2(0.0), isnan(_685)), int2(0), component::x).xyw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float2 _702 = float2(_56, _58);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_702, float2(0.0), isnan(_702))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_702, float2(0.0), isnan(_702))).x;
    float2 _710 = float2(_56, _58);
    float2 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_710, float2(0.0), isnan(_710))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_710, float2(0.0), isnan(_710))).xy;
    float _76 = _74.x;
    float _78 = _74.y;
    float _80 = in.m_42.y;
    float _82 = in.m_42.x;
    float _84 = in.m_44.y;
    float _86 = in.m_44.x;
    float _88 = in.m_46.y;
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
    float _118 = -_96;
    float _120 = _118 + _108;
    float _122 = -_110;
    float _124 = fma(_102, _84, _122);
    float _126 = -_112;
    float _128 = fma(_102, _86, _126);
    float _130 = -_110;
    float _132 = fma(_108, _88, _130);
    float _134 = -_112;
    float _136 = fma(_108, _90, _134);
    float _138 = _124 * _124;
    float _140 = _132 * _132;
    float _142 = fma(_128, _128, _138);
    float _144 = -_70;
    float _146 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _148 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[46].z, _146);
    float _150 = fma(_136, _136, _140);
    float _152 = fma(_116, _116, _142);
    float _154 = _148 * _80;
    float _156 = fma(_120, _120, _150);
    float _158 = _148 * _82;
    float _160 = rsqrt(_152);
    float _162 = -_154;
    float _164 = _162 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _166 = _154 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _168 = -_158;
    float _170 = _168 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _172 = _154 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _174 = _164 * _164;
    float _176 = -_154;
    float _178 = _176 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _180 = _154 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _182 = rsqrt(_156);
    float _184 = fma(_170, _170, _174);
    float _186 = -_148;
    float _188 = _186 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _190 = -_158;
    float _192 = _190 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _194 = _178 * _178;
    float _196 = _154 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _198 = fma(_188, _188, _184);
    float _200 = _154 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _202 = _128 * _160;
    float _204 = fma(_192, _192, _194);
    float _206 = -_148;
    float _208 = _206 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _210 = _116 * _160;
    float _212 = sqrt(_198);
    float _214 = _124 * _160;
    float _216 = fma(_208, _208, _204);
    float _218 = _154 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _220 = _120 * _182;
    float _222 = _136 * _182;
    float _224 = _132 * _182;
    float _226 = _154 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _228 = _202 * _220;
    float _230 = sqrt(_216);
    float _232 = _210 * _224;
    float _234 = _154 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _236 = -_228;
    float _238 = fma(_210, _222, _236);
    float _240 = _214 * _222;
    float _242 = -_232;
    float _244 = fma(_214, _220, _242);
    float _246 = _238 * _238;
    float _248 = -_240;
    float _250 = fma(_202, _224, _248);
    bool _254 = _212 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _256 = _154 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _258 = fma(_244, _244, _246);
    bool _260 = _212 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _262 = _154 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    bool _264 = !_254;
    int _267 = _264 ? 0 : 1;
    float _269 = fma(_250, _250, _258);
    float _271 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[27].x, _262);
    bool _273 = _230 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _275 = rsqrt(_269);
    float _277 = _154 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _279 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[27].z, _271);
    int _281 = 2;
    int _283 = 2;
    if (!_254)
    {
        _281 = 1;
    }
    int _285 = _281;
    float _287 = _154 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    bool _289 = _230 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _291 = _154 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    int _293 = _285;
    if (!_260)
    {
        _293 = _267;
    }
    int _295 = _293;
    float _297 = _154 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    bool _299 = !_273;
    int _301 = _299 ? 0 : 1;
    float _303 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[19].x, _172);
    float _305 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[22].x, _180);
    if (!_273)
    {
        _283 = 1;
    }
    int _307 = _283;
    float _309 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[20].x, _196);
    float _311 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[25].x, _218);
    float _313 = _238 * _275;
    float _315 = float(_295);
    float _317 = _244 * _275;
    int _319 = _307;
    if (!_289)
    {
        _319 = _301;
    }
    int _321 = _319;
    float _323 = _313 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _325 = _250 * _275;
    float _327 = precise::min(_315, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _329 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[24].x, _226);
    float _331 = fma(_317, (*spvDescriptorSet0.fp_c3)._m0[35].x, _323);
    float _333 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[21].x, _291);
    bool _335 = _327 != 1.0;
    bool _337 = isnan(_327);
    bool _339 = _335 || _337;
    bool _341 = isnan(1.0);
    bool _343 = _339 || _341;
    float _345 = _154 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _347 = fma(_325, (*spvDescriptorSet0.fp_c3)._m0[35].z, _331);
    float _349 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[21].z, _333);
    float _351 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[24].z, _329);
    float _353 = abs(_347);
    float _355 = -_353;
    float _357 = _355 + 1.0;
    float _359 = precise::clamp(_357, 0.0, 1.0);
    float _361 = float(_321);
    float _363 = _349 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _365 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[30].x, _345);
    float _367 = _154 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _369 = precise::min(_361, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _371 = abs(_359);
    float _373 = log2(_371);
    float _375 = _363;
    if (_343)
    {
        float _377 = _351 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _375 = _377;
    }
    float _379 = _375;
    float _381 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[33].x, _166);
    bool _383 = _369 != 1.0;
    bool _385 = isnan(_369);
    bool _387 = _383 || _385;
    bool _389 = isnan(1.0);
    bool _391 = _387 || _389;
    float _393 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[30].z, _365);
    bool _395 = _327 != 0.0;
    bool _397 = isnan(_327);
    bool _399 = _395 || _397;
    bool _401 = isnan(0.0);
    bool _403 = _399 || _401;
    float _405 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[33].z, _381);
    bool _407 = _369 != 0.0;
    bool _409 = isnan(_369);
    bool _411 = _407 || _409;
    bool _413 = isnan(0.0);
    bool _415 = _411 || _413;
    float _417 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[18].x, _367);
    float _419 = _154 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _421 = _393 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _423 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[28].x, _256);
    float _425 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[18].z, _417);
    float _427 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[29].x, _287);
    float _429 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[31].x, _297);
    float _431 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[22].z, _305);
    float _433 = _373 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _435 = _421;
    float _437 = _379;
    if (_391)
    {
        float _439 = _405 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _435 = _439;
    }
    float _441 = _435;
    float _443 = _441;
    if (!_403)
    {
        float _445 = _425 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _437 = _445;
    }
    float _447 = _437;
    float _449 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[17].x, _419);
    if (!_415)
    {
        float _451 = _279 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _443 = _451;
    }
    float _453 = _443;
    float _455 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[16].x, _277);
    float _457 = exp2(_433);
    float _459 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[26].x, _234);
    float _461 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[16].z, _455);
    float _463 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[20].z, _309);
    float _465 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[29].z, _427);
    float _467 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[28].z, _423);
    float _469 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[26].z, _459);
    float _471 = rint(_327);
    float _473 = precise::max(_471, 0.0);
    uint _476 = uint(_473);
    uint _478 = clamp(_476, 0u, 65535u);
    float _480 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[31].z, _429);
    float _482 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[25].z, _311);
    float _484 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[17].z, _449);
    float _486 = 0.0 + _453;
    float _488 = precise::clamp(_486, 0.0, 1.0);
    float _490 = 0.0 + _447;
    float _492 = precise::clamp(_490, 0.0, 1.0);
    float _494 = _457 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _496 = fma(_313, _494, _154);
    float _498 = _154 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _500 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[23].x, _200);
    float _502 = _496 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _504 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[32].x, _498);
    float _506 = fma(_317, _494, _158);
    float _508 = fma(_325, _494, _148);
    float _510 = _496 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _512 = _496 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _514 = _496 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _516 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[19].z, _303);
    float _518 = fma(_506, (*spvDescriptorSet0.fp_c3)._m0[2].x, _502);
    float _520 = fma(_506, (*spvDescriptorSet0.fp_c3)._m0[0].x, _510);
    float _522 = fma(_506, (*spvDescriptorSet0.fp_c3)._m0[3].x, _514);
    float _524 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[23].z, _500);
    float _526 = _516 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _528 = fma(_508, (*spvDescriptorSet0.fp_c3)._m0[2].z, _518);
    float _530 = fma(_508, (*spvDescriptorSet0.fp_c3)._m0[3].z, _522);
    float _532 = _526;
    if (_343)
    {
        float _534 = _431 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _532 = _534;
    }
    float _536 = _532;
    float _538 = _536;
    if (!_403)
    {
        float _540 = _461 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _538 = _540;
    }
    float _542 = _538;
    float _544 = fma(_506, (*spvDescriptorSet0.fp_c3)._m0[1].x, _512);
    float _546 = _530 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _548 = _463 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _550 = fma(_78, 2.0, -1.0);
    float _552 = _548;
    if (_343)
    {
        float _554 = _524 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _552 = _554;
    }
    float _556 = _552;
    float _558 = _528 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _560 = rint(_369);
    float _562 = precise::max(_560, 0.0);
    uint _564 = uint(_562);
    uint _566 = clamp(_564, 0u, 65535u);
    float _568 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[32].z, _504);
    float _570 = fma(_508, (*spvDescriptorSet0.fp_c3)._m0[0].z, _520);
    float _572 = fma(_508, (*spvDescriptorSet0.fp_c3)._m0[1].z, _544);
    float _574 = _465 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _576 = _574;
    float _578 = _556;
    if (_391)
    {
        float _580 = _568 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _576 = _580;
    }
    float _582 = _576;
    float _584 = _467 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _586 = _582;
    float _588 = _584;
    if (!_415)
    {
        float _590 = _469 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _586 = _590;
    }
    float _592 = _586;
    float _594 = 1.0 / _546;
    if (_391)
    {
        float _596 = _480 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _588 = _596;
    }
    float _598 = _588;
    float _600 = _598;
    if (!_415)
    {
        float _602 = _482 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _600 = _602;
    }
    float _604 = _600;
    if (!_403)
    {
        float _606 = _484 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _578 = _606;
    }
    float _608 = _578;
    float _610 = fma(_76, 2.0, -1.0);
    float _612 = _572 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _614 = _570 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _616 = _550 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _618 = _558 * _594;
    float _620 = precise::clamp(_618, 0.0, 1.0);
    float3 _1678 = float3(_604, _592, float(int(_566)));
    float3 _1682 = select(_1678, float3(0.0), isnan(_1678));
    float _622 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1682.xy, uint(rint(_1682.z)), _488);
    float3 _1691 = float3(_542, _608, float(int(_478)));
    float3 _1693 = select(_1691, float3(0.0), isnan(_1691));
    float _624 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1693.xy, uint(rint(_1693.z)), _492);
    float _626 = _610 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _628 = _612 * _594;
    float _630 = _614 * _594;
    float _632 = rint(_620);
    float _634 = precise::max(_632, 0.0);
    uint _636 = uint(_634);
    uint _638 = clamp(_636, 0u, 65535u);
    float _640 = fma(_626, 2.0, _56);
    float _642 = fma(_616, 2.0, _58);
    float3 _1726 = float3(_630, _628, float(int(_638)));
    float3 _1728 = select(_1726, float3(0.0), isnan(_1726));
    float _644 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1728.xy, uint(rint(_1728.z)), 1.0);
    float2 _1733 = float2(_640, _642);
    float _646 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1733, float2(0.0), isnan(_1733))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1733, float2(0.0), isnan(_1733))).x;
    float _648 = -_148;
    float _650 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _652 = _648 + _650;
    float _654 = -_148;
    float _656 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _658 = _654 + _656;
    float _660 = _652 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _662 = precise::clamp(_660, 0.0, 1.0);
    float _664 = _658 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _666 = precise::clamp(_664, 0.0, 1.0);
    float _668 = _622 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _670 = fma(_624, (*spvDescriptorSet0.fp_c3)._m0[49].z, _668);
    float _672 = _662 + _670;
    float _674 = _666 + _644;
    out.m_49.x = _646;
    out.m_49.y = _674;
    out.m_49.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_49.w = _672;
    return out;
}

