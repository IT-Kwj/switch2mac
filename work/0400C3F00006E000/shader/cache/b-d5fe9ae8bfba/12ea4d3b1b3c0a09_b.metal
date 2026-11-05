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
    float2 _701 = float2(_56, _58);
    float3 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_701, float2(0.0), isnan(_701)), int2(0), component::x).xyw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float2 _718 = float2(_56, _58);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_718, float2(0.0), isnan(_718))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_718, float2(0.0), isnan(_718))).x;
    float2 _726 = float2(_56, _58);
    float2 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_726, float2(0.0), isnan(_726))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_726, float2(0.0), isnan(_726))).xy;
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
    float _186 = -_170;
    float _188 = _186 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _190 = -_172;
    float _192 = _190 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _194 = _180 * _180;
    float _196 = _170 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _198 = _188 * _188;
    float _200 = rsqrt(_174);
    float _202 = fma(_184, _184, _194);
    float _204 = -_164;
    float _206 = _204 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _208 = fma(_192, _192, _198);
    float _210 = -_164;
    float _212 = _210 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _214 = _170 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _216 = fma(_206, _206, _202);
    float _218 = _170 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _220 = _134 * _176;
    float _222 = _138 * _176;
    float _224 = _130 * _176;
    float _226 = fma(_212, _212, _208);
    float _228 = sqrt(_216);
    float _230 = _170 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _232 = _170 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _234 = _170 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _236 = _158 * _200;
    float _238 = _148 * _200;
    float _240 = _152 * _200;
    float _242 = _170 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _244 = _220 * _236;
    float _246 = _222 * _238;
    float _248 = sqrt(_226);
    float _250 = _170 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _252 = -_244;
    float _254 = fma(_222, _240, _252);
    float _256 = _224 * _240;
    float _258 = -_246;
    float _260 = fma(_224, _236, _258);
    float _262 = _170 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _264 = _254 * _254;
    float _266 = -_256;
    float _268 = fma(_220, _238, _266);
    bool _272 = _228 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _274 = _170 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _276 = fma(_260, _260, _264);
    bool _278 = _228 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _280 = _170 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    bool _282 = !_272;
    int _285 = _282 ? 0 : 1;
    float _287 = fma(_268, _268, _276);
    float _289 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[19].x, _214);
    bool _291 = _248 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _293 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[22].x, _218);
    float _295 = rsqrt(_287);
    int _297 = 2;
    int _299 = 2;
    if (!_272)
    {
        _297 = 1;
    }
    int _301 = _297;
    float _303 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[20].x, _232);
    bool _305 = _248 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _307 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[25].x, _242);
    int _309 = _301;
    if (!_278)
    {
        _309 = _285;
    }
    int _311 = _309;
    float _313 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[28].x, _262);
    bool _315 = !_291;
    int _317 = _315 ? 0 : 1;
    float _319 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[29].x, _274);
    float _321 = float(_311);
    float _323 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[31].x, _280);
    if (!_291)
    {
        _299 = 1;
    }
    int _325 = _299;
    float _327 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[20].z, _303);
    float _329 = precise::min(_321, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _331 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[22].z, _293);
    float _333 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[29].z, _319);
    float _335 = _254 * _295;
    float _337 = _260 * _295;
    float _339 = _268 * _295;
    int _341 = _325;
    if (!_305)
    {
        _341 = _317;
    }
    int _343 = _341;
    float _345 = _335 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _347 = _170 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    bool _349 = _329 != 1.0;
    bool _351 = isnan(_329);
    bool _353 = _349 || _351;
    bool _355 = isnan(1.0);
    bool _357 = _353 || _355;
    float _359 = _170 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _361 = fma(_337, (*spvDescriptorSet0.fp_c3)._m0[35].x, _345);
    float _363 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[21].x, _347);
    float _365 = _170 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _367 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[24].x, _359);
    float _369 = fma(_339, (*spvDescriptorSet0.fp_c3)._m0[35].z, _361);
    float _371 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[21].z, _363);
    float _373 = _170 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _375 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[24].z, _367);
    float _377 = abs(_369);
    float _379 = -_377;
    float _381 = _379 + 1.0;
    float _383 = precise::clamp(_381, 0.0, 1.0);
    float _385 = _371 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _387 = float(_343);
    float _389 = _385;
    if (_357)
    {
        float _391 = _375 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _389 = _391;
    }
    float _393 = _389;
    float _395 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[30].x, _365);
    float _397 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[33].x, _196);
    float _399 = abs(_383);
    float _401 = log2(_399);
    float _403 = precise::min(_387, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _405 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[30].z, _395);
    bool _407 = _329 != 0.0;
    bool _409 = isnan(_329);
    bool _411 = _407 || _409;
    bool _413 = isnan(0.0);
    bool _415 = _411 || _413;
    float _417 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[33].z, _397);
    bool _419 = _403 != 1.0;
    bool _421 = isnan(_403);
    bool _423 = _419 || _421;
    bool _425 = isnan(1.0);
    bool _427 = _423 || _425;
    float _429 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[27].x, _230);
    bool _431 = _403 != 0.0;
    bool _433 = isnan(_403);
    bool _435 = _431 || _433;
    bool _437 = isnan(0.0);
    bool _439 = _435 || _437;
    float _441 = _170 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _443 = _170 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _445 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[27].z, _429);
    float _447 = rint(_403);
    float _449 = precise::max(_447, 0.0);
    uint _452 = uint(_449);
    uint _454 = clamp(_452, 0u, 65535u);
    float _456 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[28].z, _313);
    float _458 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[31].z, _323);
    float _460 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[25].z, _307);
    float _462 = _401 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _464 = _405 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _466 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[18].x, _373);
    float _468 = _464;
    float _470 = _393;
    if (_427)
    {
        float _472 = _417 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _468 = _472;
    }
    float _474 = _468;
    float _476 = _474;
    if (!_439)
    {
        float _478 = _445 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _476 = _478;
    }
    float _480 = _476;
    float _482 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[16].x, _441);
    float _484 = exp2(_462);
    float _486 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[18].z, _466);
    float _488 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[17].x, _443);
    float _490 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[16].z, _482);
    float _492 = 0.0 + _480;
    float _494 = precise::clamp(_492, 0.0, 1.0);
    if (!_415)
    {
        float _496 = _486 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _470 = _496;
    }
    float _498 = _470;
    float _500 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[26].x, _250);
    float _502 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[17].z, _488);
    float _504 = rint(_329);
    float _506 = precise::max(_504, 0.0);
    uint _508 = uint(_506);
    uint _510 = clamp(_508, 0u, 65535u);
    float _512 = 0.0 + _498;
    float _514 = precise::clamp(_512, 0.0, 1.0);
    float _516 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[26].z, _500);
    float _518 = _484 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _520 = fma(_335, _518, _170);
    float _522 = _170 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _524 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[23].x, _234);
    float _526 = _520 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _528 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[32].x, _522);
    float _530 = fma(_337, _518, _172);
    float _532 = fma(_339, _518, _164);
    float _534 = _520 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _536 = _520 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _538 = _520 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _540 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[19].z, _289);
    float _542 = fma(_530, (*spvDescriptorSet0.fp_c3)._m0[0].x, _534);
    float _544 = fma(_530, (*spvDescriptorSet0.fp_c3)._m0[1].x, _536);
    float _546 = fma(_530, (*spvDescriptorSet0.fp_c3)._m0[3].x, _538);
    float _548 = fma(_530, (*spvDescriptorSet0.fp_c3)._m0[2].x, _526);
    float _550 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[23].z, _524);
    float _552 = _540 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _554 = fma(_532, (*spvDescriptorSet0.fp_c3)._m0[3].z, _546);
    float _556 = fma(_532, (*spvDescriptorSet0.fp_c3)._m0[2].z, _548);
    float _558 = _552;
    if (_357)
    {
        float _560 = _331 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _558 = _560;
    }
    float _562 = _558;
    float _564 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[32].z, _528);
    float _566 = _554 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _568 = _327 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _570 = _568;
    float _572 = _562;
    if (_357)
    {
        float _574 = _550 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _570 = _574;
    }
    float _576 = _570;
    float _578 = _576;
    if (!_415)
    {
        float _580 = _490 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _572 = _580;
    }
    float _582 = _572;
    float _584 = fma(_532, (*spvDescriptorSet0.fp_c3)._m0[0].z, _542);
    float _586 = 1.0 / _566;
    float _588 = fma(_532, (*spvDescriptorSet0.fp_c3)._m0[1].z, _544);
    float _590 = fma(_78, 2.0, -1.0);
    float _592 = _333 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _594 = _556 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _596 = _592;
    if (_427)
    {
        float _598 = _564 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _596 = _598;
    }
    float _600 = _596;
    float _602 = _600;
    if (!_439)
    {
        float _604 = _516 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _602 = _604;
    }
    float _606 = _602;
    float _608 = _584 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _610 = _456 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _612 = _610;
    if (_427)
    {
        float _614 = _458 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _612 = _614;
    }
    float _616 = _612;
    float _618 = _616;
    if (!_439)
    {
        float _620 = _460 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _618 = _620;
    }
    float _622 = _618;
    if (!_415)
    {
        float _624 = _502 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _578 = _624;
    }
    float _626 = _578;
    float _628 = fma(_76, 2.0, -1.0);
    float _630 = _588 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _632 = _594 * _586;
    float _634 = precise::clamp(_632, 0.0, 1.0);
    float3 _1705 = float3(_622, _606, float(int(_454)));
    float3 _1709 = select(_1705, float3(0.0), isnan(_1705));
    float _636 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1709.xy, uint(rint(_1709.z)), _494);
    float3 _1718 = float3(_582, _626, float(int(_510)));
    float3 _1720 = select(_1718, float3(0.0), isnan(_1718));
    float _638 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1720.xy, uint(rint(_1720.z)), _514);
    float _640 = _628 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _642 = _608 * _586;
    float _644 = _630 * _586;
    float _646 = rint(_634);
    float _648 = precise::max(_646, 0.0);
    uint _650 = uint(_648);
    uint _652 = clamp(_650, 0u, 65535u);
    float _654 = _590 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _656 = fma(_640, 2.0, _56);
    float _658 = fma(_654, 2.0, _58);
    float3 _1758 = float3(_642, _644, float(int(_652)));
    float3 _1760 = select(_1758, float3(0.0), isnan(_1758));
    float _660 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1760.xy, uint(rint(_1760.z)), 1.0);
    float2 _1765 = float2(_656, _658);
    float _662 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1765, float2(0.0), isnan(_1765))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1765, float2(0.0), isnan(_1765))).x;
    float _664 = -_164;
    float _666 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _668 = _664 + _666;
    float _670 = -_164;
    float _672 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _674 = _670 + _672;
    float _676 = _668 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _678 = precise::clamp(_676, 0.0, 1.0);
    float _680 = _674 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _682 = precise::clamp(_680, 0.0, 1.0);
    float _684 = _636 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _686 = fma(_638, (*spvDescriptorSet0.fp_c3)._m0[49].z, _684);
    float _688 = _678 + _686;
    float _690 = _682 + _660;
    out.m_49.x = _662;
    out.m_49.y = _690;
    out.m_49.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_49.w = _688;
    return out;
}

