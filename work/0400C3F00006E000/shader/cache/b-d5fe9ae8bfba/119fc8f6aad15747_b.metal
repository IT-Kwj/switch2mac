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
    texture2d_array<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_E [[id(5)]];
    sampler fp_t_tcb_ESmplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
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
    float2 _672 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_672, float2(0.0), isnan(_672)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _689 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_689, float2(0.0), isnan(_689))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_689, float2(0.0), isnan(_689))).x;
    float _70 = in.m_40.y;
    float _72 = in.m_40.x;
    float _74 = in.m_42.y;
    float _76 = in.m_42.x;
    float _78 = in.m_44.y;
    float _80 = in.m_44.x;
    float _82 = -_62;
    float _84 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _86 = -_64;
    float _88 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _90 = -_66;
    float _92 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _94 = 1.0 / _84;
    float _96 = 1.0 / _88;
    float _98 = 1.0 / _92;
    float _100 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _102 = _94 * _100;
    float _104 = -_68;
    float _106 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _108 = _70 * _102;
    float _110 = _72 * _102;
    float _112 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _114 = _96 * _112;
    float _116 = 1.0 / _106;
    float _118 = -_108;
    float _120 = fma(_114, _74, _118);
    float _122 = -_110;
    float _124 = fma(_114, _76, _122);
    float _126 = -_102;
    float _128 = _126 + _114;
    float _130 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _132 = _98 * _130;
    float _134 = _120 * _120;
    float _136 = -_108;
    float _138 = fma(_132, _78, _136);
    float _140 = -_110;
    float _142 = fma(_132, _80, _140);
    float _144 = fma(_124, _124, _134);
    float _146 = -_102;
    float _148 = _146 + _132;
    float _150 = _138 * _138;
    float _152 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _154 = _116 * _152;
    float _156 = fma(_128, _128, _144);
    float _158 = fma(_142, _142, _150);
    float _160 = _154 * _70;
    float _162 = _154 * _72;
    float _164 = fma(_148, _148, _158);
    float _166 = rsqrt(_156);
    float _168 = -_160;
    float _170 = _168 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _172 = -_162;
    float _174 = _172 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _176 = -_160;
    float _178 = _176 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _180 = _160 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _182 = _170 * _170;
    float _184 = -_162;
    float _186 = _184 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _188 = _178 * _178;
    float _190 = rsqrt(_164);
    float _192 = fma(_174, _174, _182);
    float _194 = -_154;
    float _196 = _194 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _198 = fma(_186, _186, _188);
    float _200 = -_154;
    float _202 = _200 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _204 = _160 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _206 = fma(_196, _196, _192);
    float _208 = _160 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _210 = _124 * _166;
    float _212 = _128 * _166;
    float _214 = _120 * _166;
    float _216 = fma(_202, _202, _198);
    float _218 = sqrt(_206);
    float _220 = _160 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _222 = _160 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _224 = _160 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _226 = _148 * _190;
    float _228 = _138 * _190;
    float _230 = _142 * _190;
    float _232 = _160 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _234 = _210 * _226;
    float _236 = _212 * _228;
    float _238 = sqrt(_216);
    float _240 = _160 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _242 = -_234;
    float _244 = fma(_212, _230, _242);
    float _246 = _214 * _230;
    float _248 = -_236;
    float _250 = fma(_214, _226, _248);
    float _252 = _160 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _254 = _244 * _244;
    float _256 = -_246;
    float _258 = fma(_210, _228, _256);
    bool _262 = _218 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _264 = _160 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _266 = fma(_250, _250, _254);
    bool _268 = _218 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _270 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[19].x, _204);
    float _272 = fma(_258, _258, _266);
    bool _274 = !_262;
    int _277 = _274 ? 0 : 1;
    float _279 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[22].x, _208);
    bool _281 = _238 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _283 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[20].x, _220);
    float _285 = rsqrt(_272);
    int _287 = 2;
    int _289 = 2;
    if (!_262)
    {
        _287 = 1;
    }
    int _291 = _287;
    float _293 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[23].x, _222);
    bool _295 = _238 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _297 = _160 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    int _299 = _291;
    if (!_268)
    {
        _299 = _277;
    }
    int _301 = _299;
    float _303 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[29].x, _252);
    bool _305 = !_281;
    int _307 = _305 ? 0 : 1;
    float _309 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[31].x, _264);
    float _311 = float(_301);
    float _313 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[29].z, _303);
    if (!_281)
    {
        _289 = 1;
    }
    int _315 = _289;
    float _317 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[31].z, _309);
    float _319 = precise::min(_311, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _321 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[19].z, _270);
    float _323 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[20].z, _283);
    float _325 = _244 * _285;
    float _327 = _250 * _285;
    float _329 = _258 * _285;
    int _331 = _315;
    if (!_295)
    {
        _331 = _307;
    }
    int _333 = _331;
    float _335 = _325 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _337 = _160 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    bool _339 = _319 != 1.0;
    bool _341 = isnan(_319);
    bool _343 = _339 || _341;
    bool _345 = isnan(1.0);
    bool _347 = _343 || _345;
    float _349 = _160 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _351 = fma(_327, (*spvDescriptorSet0.fp_c3)._m0[35].x, _335);
    float _353 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[21].x, _337);
    float _355 = float(_333);
    float _357 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[24].x, _349);
    float _359 = fma(_329, (*spvDescriptorSet0.fp_c3)._m0[35].z, _351);
    float _361 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[21].z, _353);
    float _363 = _160 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _365 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[24].z, _357);
    float _367 = abs(_359);
    float _369 = -_367;
    float _371 = _369 + 1.0;
    float _373 = precise::clamp(_371, 0.0, 1.0);
    float _375 = _361 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _377 = precise::min(_355, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _379 = _375;
    if (_347)
    {
        float _381 = _365 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _379 = _381;
    }
    float _383 = _379;
    float _385 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[30].x, _363);
    float _387 = _160 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _389 = abs(_373);
    float _391 = log2(_389);
    bool _393 = _377 != 1.0;
    bool _395 = isnan(_377);
    bool _397 = _393 || _395;
    bool _399 = isnan(1.0);
    bool _401 = _397 || _399;
    float _403 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[30].z, _385);
    float _405 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[33].x, _180);
    bool _407 = _319 != 0.0;
    bool _409 = isnan(_319);
    bool _411 = _407 || _409;
    bool _413 = isnan(0.0);
    bool _415 = _411 || _413;
    float _417 = _160 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    bool _419 = _377 != 0.0;
    bool _421 = isnan(_377);
    bool _423 = _419 || _421;
    bool _425 = isnan(0.0);
    bool _427 = _423 || _425;
    float _429 = _403 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _431 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[18].x, _387);
    float _433 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[33].z, _405);
    float _435 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[27].x, _297);
    float _437 = _160 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _439 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[18].z, _431);
    float _441 = rint(_377);
    float _443 = precise::max(_441, 0.0);
    uint _446 = uint(_443);
    uint _448 = clamp(_446, 0u, 65535u);
    float _450 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[27].z, _435);
    float _452 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[16].x, _437);
    float _454 = _391 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _456 = _429;
    float _458 = _383;
    if (_401)
    {
        float _460 = _433 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _456 = _460;
    }
    float _462 = _456;
    float _464 = _462;
    if (!_415)
    {
        float _466 = _439 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _458 = _466;
    }
    float _468 = _458;
    if (!_427)
    {
        float _470 = _450 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _464 = _470;
    }
    float _472 = _464;
    float _474 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[17].x, _417);
    float _476 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[25].x, _224);
    float _478 = exp2(_454);
    float _480 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[28].x, _240);
    float _482 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[22].z, _279);
    float _484 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[25].z, _476);
    float _486 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[23].z, _293);
    float _488 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[28].z, _480);
    float _490 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[16].z, _452);
    float _492 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[17].z, _474);
    float _494 = rint(_319);
    float _496 = precise::max(_494, 0.0);
    uint _498 = uint(_496);
    uint _500 = clamp(_498, 0u, 65535u);
    float _502 = 0.0 + _472;
    float _504 = precise::clamp(_502, 0.0, 1.0);
    float _506 = 0.0 + _468;
    float _508 = precise::clamp(_506, 0.0, 1.0);
    float _510 = _478 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _512 = fma(_325, _510, _160);
    float _514 = _160 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _516 = fma(_327, _510, _162);
    float _518 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[26].x, _232);
    float _520 = _512 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _522 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[32].x, _514);
    float _524 = fma(_329, _510, _154);
    float _526 = _512 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _528 = fma(_516, (*spvDescriptorSet0.fp_c3)._m0[3].x, _520);
    float _530 = _512 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _532 = _512 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _534 = fma(_516, (*spvDescriptorSet0.fp_c3)._m0[0].x, _526);
    float _536 = fma(_524, (*spvDescriptorSet0.fp_c3)._m0[3].z, _528);
    float _538 = fma(_516, (*spvDescriptorSet0.fp_c3)._m0[1].x, _530);
    float _540 = fma(_516, (*spvDescriptorSet0.fp_c3)._m0[2].x, _532);
    float _542 = fma(_524, (*spvDescriptorSet0.fp_c3)._m0[0].z, _534);
    float _544 = _536 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _546 = fma(_524, (*spvDescriptorSet0.fp_c3)._m0[1].z, _538);
    float _548 = fma(_524, (*spvDescriptorSet0.fp_c3)._m0[2].z, _540);
    float _550 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[32].z, _522);
    float _552 = 1.0 / _544;
    float _554 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[26].z, _518);
    float _556 = _488 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _558 = _313 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _560 = _556;
    float _562 = _558;
    if (_401)
    {
        float _564 = _317 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _560 = _564;
    }
    float _566 = _560;
    float _568 = _566;
    if (_401)
    {
        float _570 = _550 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _562 = _570;
    }
    float _572 = _562;
    float _574 = _572;
    if (!_427)
    {
        float _576 = _484 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _568 = _576;
    }
    float _578 = _568;
    if (!_427)
    {
        float _580 = _554 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _574 = _580;
    }
    float _582 = _574;
    float _584 = _321 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _586 = _323 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _588 = _542 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _590 = _584;
    float _592 = _586;
    if (_347)
    {
        float _594 = _482 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _590 = _594;
    }
    float _596 = _590;
    float _598 = _596;
    if (_347)
    {
        float _600 = _486 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _592 = _600;
    }
    float _602 = _592;
    float _604 = _546 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _606 = _548 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _608 = _602;
    if (!_415)
    {
        float _610 = _490 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _598 = _610;
    }
    float _612 = _598;
    if (!_415)
    {
        float _614 = _492 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _608 = _614;
    }
    float _616 = _608;
    float3 _1653 = float3(_578, _582, float(int(_448)));
    float3 _1657 = select(_1653, float3(0.0), isnan(_1653));
    float _618 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1657.xy, uint(rint(_1657.z)), _504);
    float _620 = _588 * _552;
    float _622 = _604 * _552;
    float _624 = _606 * _552;
    float _626 = precise::clamp(_624, 0.0, 1.0);
    float3 _1677 = float3(_612, _616, float(int(_500)));
    float3 _1679 = select(_1677, float3(0.0), isnan(_1677));
    float _628 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1679.xy, uint(rint(_1679.z)), _508);
    float3 _1686 = float3(_620, _622, float(0));
    float3 _1688 = select(_1686, float3(0.0), isnan(_1686));
    float _630 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1688.xy, uint(rint(_1688.z)), _626);
    float2 _1694 = float2(_54, _56);
    float _632 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1694, float2(0.0), isnan(_1694))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1694, float2(0.0), isnan(_1694))).x;
    float _634 = -_154;
    float _636 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _638 = _634 + _636;
    float _640 = -_154;
    float _642 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _644 = _640 + _642;
    float _646 = _638 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _648 = precise::clamp(_646, 0.0, 1.0);
    float _650 = _644 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _652 = precise::clamp(_650, 0.0, 1.0);
    float _654 = _618 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _656 = fma(_628, (*spvDescriptorSet0.fp_c3)._m0[49].z, _654);
    float _658 = _652 + _630;
    float _660 = _648 + _656;
    out.m_47.x = _632;
    out.m_47.y = _658;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _660;
    return out;
}

