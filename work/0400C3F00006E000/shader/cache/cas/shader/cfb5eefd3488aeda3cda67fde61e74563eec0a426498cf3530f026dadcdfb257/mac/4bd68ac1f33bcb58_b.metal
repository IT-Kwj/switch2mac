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
    float2 _677 = float2(_56, _58);
    float3 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_677, float2(0.0), isnan(_677)), int2(0), component::x).xyw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float2 _694 = float2(_56, _58);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_694, float2(0.0), isnan(_694))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_694, float2(0.0), isnan(_694))).x;
    float2 _702 = float2(_56, _58);
    float2 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_702, float2(0.0), isnan(_702))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_702, float2(0.0), isnan(_702))).xy;
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
    float _114 = -_110;
    float _116 = fma(_102, _84, _114);
    float _118 = -_112;
    float _120 = fma(_102, _86, _118);
    float _122 = -_110;
    float _124 = fma(_108, _88, _122);
    float _126 = -_112;
    float _128 = fma(_108, _90, _126);
    float _130 = _116 * _116;
    float _132 = -_96;
    float _134 = _132 + _102;
    float _136 = _124 * _124;
    float _138 = -_96;
    float _140 = _138 + _108;
    float _142 = fma(_120, _120, _130);
    float _144 = fma(_128, _128, _136);
    float _146 = -_70;
    float _148 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _150 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[46].z, _148);
    float _152 = fma(_134, _134, _142);
    float _154 = fma(_140, _140, _144);
    float _156 = _150 * _80;
    float _158 = _150 * _82;
    float _160 = rsqrt(_152);
    float _162 = -_156;
    float _164 = _162 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _166 = -_158;
    float _168 = _166 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _170 = -_156;
    float _172 = _170 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _174 = _156 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _176 = _164 * _164;
    float _178 = -_158;
    float _180 = _178 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _182 = _172 * _172;
    float _184 = rsqrt(_154);
    float _186 = fma(_168, _168, _176);
    float _188 = -_150;
    float _190 = _188 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _192 = fma(_180, _180, _182);
    float _194 = -_150;
    float _196 = _194 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _198 = _156 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _200 = fma(_190, _190, _186);
    float _202 = _156 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _204 = _120 * _160;
    float _206 = _134 * _160;
    float _208 = fma(_196, _196, _192);
    float _210 = _116 * _160;
    float _212 = sqrt(_200);
    float _214 = _156 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _216 = _156 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _218 = _156 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _220 = _140 * _184;
    float _222 = _124 * _184;
    float _224 = _128 * _184;
    float _226 = _156 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _228 = _204 * _220;
    float _230 = _206 * _222;
    float _232 = sqrt(_208);
    float _234 = _156 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _236 = -_228;
    float _238 = fma(_206, _224, _236);
    float _240 = _210 * _224;
    float _242 = -_230;
    float _244 = fma(_210, _220, _242);
    float _246 = _156 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _248 = _238 * _238;
    float _250 = -_240;
    float _252 = fma(_204, _222, _250);
    bool _256 = _212 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _258 = _156 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _260 = fma(_244, _244, _248);
    bool _262 = _212 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _264 = _156 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    bool _266 = !_256;
    int _269 = _266 ? 0 : 1;
    float _271 = fma(_252, _252, _260);
    float _273 = _156 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    bool _275 = _232 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _277 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[19].x, _174);
    float _279 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[20].x, _202);
    float _281 = rsqrt(_271);
    int _283 = 2;
    if (!_256)
    {
        _283 = 1;
    }
    int _285 = _283;
    float _287 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[25].x, _216);
    bool _289 = _232 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _291 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[28].x, _234);
    int _293 = _285;
    if (!_262)
    {
        _293 = _269;
    }
    int _295 = _293;
    float _297 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[29].x, _246);
    bool _299 = !_275;
    int _301 = _299 ? 0 : 1;
    float _303 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[31].x, _258);
    float _305 = float(_295);
    float _307 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[32].x, _273);
    float _309 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[19].z, _277);
    int _311 = 2;
    if (!_275)
    {
        _311 = 1;
    }
    int _313 = _311;
    float _315 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[20].z, _279);
    float _317 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[29].z, _297);
    float _319 = _238 * _281;
    float _321 = _244 * _281;
    float _323 = _252 * _281;
    float _325 = precise::min(_305, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _327 = _319 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    int _329 = _313;
    if (!_289)
    {
        _329 = _301;
    }
    int _331 = _329;
    float _333 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[21].x, _226);
    bool _335 = _325 != 1.0;
    bool _337 = isnan(_325);
    bool _339 = _335 || _337;
    bool _341 = isnan(1.0);
    bool _343 = _339 || _341;
    float _345 = fma(_321, (*spvDescriptorSet0.fp_c3)._m0[35].x, _327);
    float _347 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[24].x, _264);
    float _349 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[21].z, _333);
    float _351 = _156 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _353 = fma(_323, (*spvDescriptorSet0.fp_c3)._m0[35].z, _345);
    float _355 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[24].z, _347);
    float _357 = _349 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    bool _359 = _325 != 0.0;
    bool _361 = isnan(_325);
    bool _363 = _359 || _361;
    bool _365 = isnan(0.0);
    bool _367 = _363 || _365;
    float _369 = abs(_353);
    float _371 = -_369;
    float _373 = _371 + 1.0;
    float _375 = precise::clamp(_373, 0.0, 1.0);
    float _377 = float(_331);
    float _379 = _156 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _381 = _156 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _383 = _357;
    if (_343)
    {
        float _385 = _355 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _383 = _385;
    }
    float _387 = _383;
    float _389 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[30].x, _351);
    float _391 = abs(_375);
    float _393 = log2(_391);
    float _395 = precise::min(_377, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _397 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[33].x, _379);
    float _399 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[30].z, _389);
    float _401 = _156 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    bool _403 = _395 != 1.0;
    bool _405 = isnan(_395);
    bool _407 = _403 || _405;
    bool _409 = isnan(1.0);
    bool _411 = _407 || _409;
    float _413 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[33].z, _397);
    bool _415 = _395 != 0.0;
    bool _417 = isnan(_395);
    bool _419 = _415 || _417;
    bool _421 = isnan(0.0);
    bool _423 = _419 || _421;
    float _425 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[27].x, _381);
    float _427 = _156 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _429 = rint(_395);
    float _431 = precise::max(_429, 0.0);
    uint _434 = uint(_431);
    uint _436 = clamp(_434, 0u, 65535u);
    float _438 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[32].z, _307);
    float _440 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[27].z, _425);
    float _442 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[16].x, _427);
    float _444 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[28].z, _291);
    float _446 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[31].z, _303);
    float _448 = _393 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _450 = _399 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _452 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[18].x, _401);
    float _454 = _450;
    float _456 = _387;
    if (_411)
    {
        float _458 = _413 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _454 = _458;
    }
    float _460 = _454;
    float _462 = _156 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _464 = _460;
    if (!_423)
    {
        float _466 = _440 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _464 = _466;
    }
    float _468 = _464;
    float _470 = exp2(_448);
    float _472 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[18].z, _452);
    float _474 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[17].x, _462);
    float _476 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[25].z, _287);
    float _478 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[16].z, _442);
    if (!_367)
    {
        float _480 = _472 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _456 = _480;
    }
    float _482 = _456;
    float _484 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[26].x, _218);
    float _486 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[17].z, _474);
    float _488 = rint(_325);
    float _490 = precise::max(_488, 0.0);
    uint _492 = uint(_490);
    uint _494 = clamp(_492, 0u, 65535u);
    float _496 = 0.0 + _468;
    float _498 = precise::clamp(_496, 0.0, 1.0);
    float _500 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[26].z, _484);
    float _502 = 0.0 + _482;
    float _504 = precise::clamp(_502, 0.0, 1.0);
    float _506 = _470 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _508 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[23].x, _214);
    float _510 = fma(_319, _506, _156);
    float _512 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[22].x, _198);
    float _514 = fma(_321, _506, _158);
    float _516 = fma(_323, _506, _150);
    float _518 = _510 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _520 = _510 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _522 = _510 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _524 = _510 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _526 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[22].z, _512);
    float _528 = _309 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _530 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[23].z, _508);
    float _532 = fma(_514, (*spvDescriptorSet0.fp_c3)._m0[3].x, _524);
    float _534 = _528;
    if (_343)
    {
        float _536 = _526 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _534 = _536;
    }
    float _538 = _534;
    float _540 = fma(_514, (*spvDescriptorSet0.fp_c3)._m0[0].x, _518);
    float _542 = fma(_514, (*spvDescriptorSet0.fp_c3)._m0[1].x, _520);
    float _544 = fma(_516, (*spvDescriptorSet0.fp_c3)._m0[3].z, _532);
    float _546 = fma(_514, (*spvDescriptorSet0.fp_c3)._m0[2].x, _522);
    float _548 = fma(_516, (*spvDescriptorSet0.fp_c3)._m0[0].z, _540);
    float _550 = _317 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _552 = _544 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _554 = _315 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _556 = _554;
    float _558 = _550;
    float _560 = _538;
    if (_343)
    {
        float _562 = _530 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _556 = _562;
    }
    float _564 = _556;
    float _566 = _564;
    if (_411)
    {
        float _568 = _438 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _558 = _568;
    }
    float _570 = _558;
    float _572 = _444 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _574 = 1.0 / _552;
    float _576 = _570;
    float _578 = _572;
    if (!_423)
    {
        float _580 = _500 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _576 = _580;
    }
    float _582 = _576;
    float _584 = fma(_76, 2.0, -1.0);
    if (_411)
    {
        float _586 = _446 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _578 = _586;
    }
    float _588 = _578;
    float _590 = _588;
    if (!_423)
    {
        float _592 = _476 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _590 = _592;
    }
    float _594 = _590;
    float _596 = fma(_516, (*spvDescriptorSet0.fp_c3)._m0[1].z, _542);
    float _598 = fma(_516, (*spvDescriptorSet0.fp_c3)._m0[2].z, _546);
    float _600 = _584 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    if (!_367)
    {
        float _602 = _478 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _560 = _602;
    }
    float _604 = _560;
    if (!_367)
    {
        float _606 = _486 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _566 = _606;
    }
    float _608 = _566;
    float _610 = fma(_78, 2.0, -1.0);
    float3 _1653 = float3(_594, _582, float(int(_436)));
    float3 _1657 = select(_1653, float3(0.0), isnan(_1653));
    float _612 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1657.xy, uint(rint(_1657.z)), _498);
    float _614 = _548 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _616 = _596 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _618 = _598 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _620 = fma(_600, 2.0, _56);
    float _622 = _610 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float3 _1685 = float3(_604, _608, float(int(_494)));
    float3 _1687 = select(_1685, float3(0.0), isnan(_1685));
    float _624 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1687.xy, uint(rint(_1687.z)), _504);
    float _626 = _614 * _574;
    float _628 = _616 * _574;
    float _630 = _618 * _574;
    float _632 = precise::clamp(_630, 0.0, 1.0);
    float _634 = fma(_622, 2.0, _58);
    float3 _1708 = float3(_626, _628, float(0));
    float3 _1710 = select(_1708, float3(0.0), isnan(_1708));
    float _636 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1710.xy, uint(rint(_1710.z)), _632);
    float2 _1716 = float2(_620, _634);
    float _638 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1716, float2(0.0), isnan(_1716))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1716, float2(0.0), isnan(_1716))).x;
    float _640 = -_150;
    float _642 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _644 = _640 + _642;
    float _646 = -_150;
    float _648 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _650 = _646 + _648;
    float _652 = _644 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _654 = precise::clamp(_652, 0.0, 1.0);
    float _656 = _650 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _658 = precise::clamp(_656, 0.0, 1.0);
    float _660 = _612 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _662 = fma(_624, (*spvDescriptorSet0.fp_c3)._m0[49].z, _660);
    float _664 = _654 + _662;
    float _666 = _658 + _636;
    out.m_49.x = _638;
    out.m_49.y = _666;
    out.m_49.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_49.w = _664;
    return out;
}

