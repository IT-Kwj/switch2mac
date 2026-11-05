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
    float2 _693 = float2(_56, _58);
    float3 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_693, float2(0.0), isnan(_693)), int2(0), component::x).xyw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float2 _710 = float2(_56, _58);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_710, float2(0.0), isnan(_710))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_710, float2(0.0), isnan(_710))).x;
    float2 _718 = float2(_56, _58);
    float2 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_718, float2(0.0), isnan(_718))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_718, float2(0.0), isnan(_718))).xy;
    float _76 = _74.x;
    float _78 = _74.y;
    float _80 = in.m_42.y;
    float _82 = in.m_42.x;
    float _84 = in.m_44.y;
    float _86 = in.m_46.y;
    float _88 = in.m_44.x;
    float _90 = in.m_46.x;
    float _92 = -_64;
    float _94 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _96 = -_66;
    float _98 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _100 = -_68;
    float _102 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _104 = 1.0 / _94;
    float _106 = 1.0 / _98;
    float _108 = 1.0 / _102;
    float _110 = -_70;
    float _112 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _114 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _116 = _104 * _114;
    float _118 = _80 * _116;
    float _120 = _82 * _116;
    float _122 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _124 = _106 * _122;
    float _126 = 1.0 / _112;
    float _128 = -_118;
    float _130 = fma(_124, _84, _128);
    float _132 = -_120;
    float _134 = fma(_124, _88, _132);
    float _136 = -_116;
    float _138 = _136 + _124;
    float _140 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _142 = _108 * _140;
    float _144 = _130 * _130;
    float _146 = -_118;
    float _148 = fma(_142, _86, _146);
    float _150 = -_120;
    float _152 = fma(_142, _90, _150);
    float _154 = fma(_134, _134, _144);
    float _156 = -_116;
    float _158 = _156 + _142;
    float _160 = _148 * _148;
    float _162 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _164 = _126 * _162;
    float _166 = fma(_138, _138, _154);
    float _168 = fma(_152, _152, _160);
    float _170 = _164 * _80;
    float _172 = _164 * _82;
    float _174 = fma(_158, _158, _168);
    float _176 = rsqrt(_166);
    float _178 = -_170;
    float _180 = _178 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _182 = -_172;
    float _184 = _182 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _186 = -_172;
    float _188 = _186 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _190 = _170 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _192 = _180 * _180;
    float _194 = -_170;
    float _196 = _194 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _198 = _170 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _200 = rsqrt(_174);
    float _202 = fma(_184, _184, _192);
    float _204 = -_164;
    float _206 = _204 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _208 = _196 * _196;
    float _210 = _170 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _212 = _170 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _214 = fma(_206, _206, _202);
    float _216 = fma(_188, _188, _208);
    float _218 = _134 * _176;
    float _220 = _138 * _176;
    float _222 = _130 * _176;
    float _224 = -_164;
    float _226 = _224 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _228 = sqrt(_214);
    float _230 = _170 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _232 = _170 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _234 = fma(_226, _226, _216);
    float _236 = _158 * _200;
    float _238 = _148 * _200;
    float _240 = _152 * _200;
    float _242 = _218 * _236;
    float _244 = _220 * _238;
    float _246 = sqrt(_234);
    float _248 = -_242;
    float _250 = fma(_220, _240, _248);
    float _252 = _222 * _240;
    float _254 = -_244;
    float _256 = fma(_222, _236, _254);
    float _258 = _170 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _260 = _250 * _250;
    float _262 = -_252;
    float _264 = fma(_218, _238, _262);
    bool _268 = _228 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _270 = _170 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _272 = fma(_256, _256, _260);
    bool _274 = _228 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _276 = _170 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    bool _278 = !_268;
    int _281 = _278 ? 0 : 1;
    float _283 = fma(_264, _264, _272);
    float _285 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[27].x, _270);
    bool _287 = _246 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _289 = _170 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _291 = rsqrt(_283);
    float _293 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[27].z, _285);
    float _295 = _170 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    int _297 = 2;
    int _299 = 2;
    if (!_268)
    {
        _297 = 1;
    }
    int _301 = _297;
    float _303 = _170 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    bool _305 = _246 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _307 = _170 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    int _309 = _301;
    if (!_274)
    {
        _309 = _281;
    }
    int _311 = _309;
    float _313 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[19].x, _198);
    bool _315 = !_287;
    int _317 = _315 ? 0 : 1;
    float _319 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[22].x, _210);
    if (!_287)
    {
        _299 = 1;
    }
    int _321 = _299;
    float _323 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[20].x, _212);
    float _325 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[16].x, _289);
    float _327 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[28].x, _295);
    float _329 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[29].x, _303);
    float _331 = _250 * _291;
    float _333 = float(_311);
    float _335 = _256 * _291;
    int _337 = _321;
    if (!_305)
    {
        _337 = _317;
    }
    int _339 = _337;
    float _341 = _331 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _343 = _264 * _291;
    float _345 = precise::min(_333, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _347 = _170 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _349 = fma(_335, (*spvDescriptorSet0.fp_c3)._m0[35].x, _341);
    float _351 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[21].x, _258);
    bool _353 = _345 != 1.0;
    bool _355 = isnan(_345);
    bool _357 = _353 || _355;
    bool _359 = isnan(1.0);
    bool _361 = _357 || _359;
    float _363 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[24].x, _347);
    float _365 = fma(_343, (*spvDescriptorSet0.fp_c3)._m0[35].z, _349);
    float _367 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[21].z, _351);
    float _369 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[24].z, _363);
    float _371 = abs(_365);
    float _373 = -_371;
    float _375 = _373 + 1.0;
    float _377 = precise::clamp(_375, 0.0, 1.0);
    float _379 = float(_339);
    float _381 = _170 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _383 = _367 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    bool _385 = _345 != 0.0;
    bool _387 = isnan(_345);
    bool _389 = _385 || _387;
    bool _391 = isnan(0.0);
    bool _393 = _389 || _391;
    float _395 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[31].x, _307);
    float _397 = abs(_377);
    float _399 = log2(_397);
    float _401 = precise::min(_379, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _403 = _383;
    if (_361)
    {
        float _405 = _369 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _403 = _405;
    }
    float _407 = _403;
    float _409 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[30].x, _381);
    float _411 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[33].x, _190);
    bool _413 = _401 != 1.0;
    bool _415 = isnan(_401);
    bool _417 = _413 || _415;
    bool _419 = isnan(1.0);
    bool _421 = _417 || _419;
    float _423 = _170 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    bool _425 = _401 != 0.0;
    bool _427 = isnan(_401);
    bool _429 = _425 || _427;
    bool _431 = isnan(0.0);
    bool _433 = _429 || _431;
    float _435 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[33].z, _411);
    float _437 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[30].z, _409);
    float _439 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[18].x, _423);
    float _441 = _170 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _443 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[20].z, _323);
    float _445 = _437 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _447 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[18].z, _439);
    float _449 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[29].z, _329);
    float _451 = _399 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _453 = rint(_401);
    float _455 = precise::max(_453, 0.0);
    uint _458 = uint(_455);
    uint _460 = clamp(_458, 0u, 65535u);
    float _462 = _445;
    float _464 = _407;
    if (_421)
    {
        float _466 = _435 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _462 = _466;
    }
    float _468 = _462;
    float _470 = _468;
    if (!_393)
    {
        float _472 = _447 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _464 = _472;
    }
    float _474 = _464;
    if (!_433)
    {
        float _476 = _293 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _470 = _476;
    }
    float _478 = _470;
    float _480 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[17].x, _441);
    float _482 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[25].x, _232);
    float _484 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[26].x, _276);
    float _486 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[28].z, _327);
    float _488 = exp2(_451);
    float _490 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[31].z, _395);
    float _492 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[26].z, _484);
    float _494 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[25].z, _482);
    float _496 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[22].z, _319);
    float _498 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[16].z, _325);
    float _500 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[17].z, _480);
    float _502 = 0.0 + _478;
    float _504 = precise::clamp(_502, 0.0, 1.0);
    float _506 = 0.0 + _474;
    float _508 = precise::clamp(_506, 0.0, 1.0);
    float _510 = _488 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _512 = fma(_331, _510, _170);
    float _514 = _170 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _516 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[23].x, _230);
    float _518 = _512 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _520 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[32].x, _514);
    float _522 = fma(_335, _510, _172);
    float _524 = fma(_343, _510, _164);
    float _526 = _512 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _528 = _512 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _530 = _512 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _532 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[19].z, _313);
    float _534 = fma(_522, (*spvDescriptorSet0.fp_c3)._m0[0].x, _526);
    float _536 = fma(_522, (*spvDescriptorSet0.fp_c3)._m0[1].x, _528);
    float _538 = fma(_522, (*spvDescriptorSet0.fp_c3)._m0[3].x, _530);
    float _540 = fma(_522, (*spvDescriptorSet0.fp_c3)._m0[2].x, _518);
    float _542 = fma(_524, (*spvDescriptorSet0.fp_c3)._m0[0].z, _534);
    float _544 = fma(_524, (*spvDescriptorSet0.fp_c3)._m0[1].z, _536);
    float _546 = fma(_524, (*spvDescriptorSet0.fp_c3)._m0[3].z, _538);
    float _548 = fma(_524, (*spvDescriptorSet0.fp_c3)._m0[2].z, _540);
    float _550 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[23].z, _516);
    float _552 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[32].z, _520);
    float _554 = _546 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _556 = _443 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _558 = _556;
    if (_361)
    {
        float _560 = _550 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _558 = _560;
    }
    float _562 = _558;
    float _564 = _449 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _566 = _564;
    float _568 = _562;
    if (_421)
    {
        float _570 = _552 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _566 = _570;
    }
    float _572 = _566;
    float _574 = _572;
    if (!_433)
    {
        float _576 = _492 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _574 = _576;
    }
    float _578 = _574;
    float _580 = 1.0 / _554;
    float _582 = fma(_76, 2.0, -1.0);
    float _584 = fma(_78, 2.0, -1.0);
    float _586 = _486 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _588 = _586;
    if (_421)
    {
        float _590 = _490 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _588 = _590;
    }
    float _592 = _588;
    float _594 = _592;
    if (!_433)
    {
        float _596 = _494 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _594 = _596;
    }
    float _598 = _594;
    float _600 = _532 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _602 = _582 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _604 = rint(_345);
    float _606 = precise::max(_604, 0.0);
    uint _608 = uint(_606);
    uint _610 = clamp(_608, 0u, 65535u);
    float _612 = _600;
    if (_361)
    {
        float _614 = _496 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _612 = _614;
    }
    float _616 = _612;
    float _618 = _616;
    if (!_393)
    {
        float _620 = _498 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _618 = _620;
    }
    float _622 = _618;
    if (!_393)
    {
        float _624 = _500 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _568 = _624;
    }
    float _626 = _568;
    float3 _1685 = float3(_598, _578, float(int(_460)));
    float3 _1689 = select(_1685, float3(0.0), isnan(_1685));
    float _628 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1689.xy, uint(rint(_1689.z)), _504);
    float _630 = _542 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _632 = _544 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _634 = _548 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _636 = fma(_602, 2.0, _56);
    float _638 = _584 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _640 = _630 * _580;
    float _642 = _632 * _580;
    float _644 = _634 * _580;
    float _646 = precise::clamp(_644, 0.0, 1.0);
    float _648 = fma(_638, 2.0, _58);
    float3 _1731 = float3(_622, _626, float(int(_610)));
    float3 _1733 = select(_1731, float3(0.0), isnan(_1731));
    float _650 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1733.xy, uint(rint(_1733.z)), _508);
    float3 _1740 = float3(_640, _642, float(0));
    float3 _1742 = select(_1740, float3(0.0), isnan(_1740));
    float _652 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1742.xy, uint(rint(_1742.z)), _646);
    float2 _1748 = float2(_636, _648);
    float _654 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1748, float2(0.0), isnan(_1748))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1748, float2(0.0), isnan(_1748))).x;
    float _656 = -_164;
    float _658 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _660 = _656 + _658;
    float _662 = -_164;
    float _664 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _666 = _662 + _664;
    float _668 = _660 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _670 = precise::clamp(_668, 0.0, 1.0);
    float _672 = _666 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _674 = precise::clamp(_672, 0.0, 1.0);
    float _676 = _628 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _678 = fma(_650, (*spvDescriptorSet0.fp_c3)._m0[49].z, _676);
    float _680 = _674 + _652;
    float _682 = _670 + _678;
    out.m_49.x = _654;
    out.m_49.y = _680;
    out.m_49.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_49.w = _682;
    return out;
}

