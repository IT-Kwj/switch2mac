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
    float2 _680 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_680, float2(0.0), isnan(_680)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _697 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_697, float2(0.0), isnan(_697))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_697, float2(0.0), isnan(_697))).x;
    float _70 = in.m_40.y;
    float _72 = in.m_42.y;
    float _74 = in.m_40.x;
    float _76 = in.m_44.y;
    float _78 = in.m_42.x;
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
    float _110 = _74 * _102;
    float _112 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _114 = _96 * _112;
    float _116 = 1.0 / _106;
    float _118 = -_108;
    float _120 = fma(_114, _72, _118);
    float _122 = -_110;
    float _124 = fma(_114, _78, _122);
    float _126 = -_102;
    float _128 = _126 + _114;
    float _130 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _132 = _98 * _130;
    float _134 = _120 * _120;
    float _136 = -_108;
    float _138 = fma(_132, _76, _136);
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
    float _162 = _154 * _74;
    float _164 = fma(_148, _148, _158);
    float _166 = rsqrt(_156);
    float _168 = -_160;
    float _170 = _168 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _172 = -_162;
    float _174 = _172 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _176 = -_160;
    float _178 = _176 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _180 = -_162;
    float _182 = _180 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _184 = _170 * _170;
    float _186 = _160 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _188 = _178 * _178;
    float _190 = rsqrt(_164);
    float _192 = fma(_174, _174, _184);
    float _194 = -_154;
    float _196 = _194 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _198 = fma(_182, _182, _188);
    float _200 = -_154;
    float _202 = _200 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _204 = _160 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _206 = fma(_196, _196, _192);
    float _208 = _160 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _210 = _124 * _166;
    float _212 = _128 * _166;
    float _214 = _120 * _166;
    float _216 = fma(_202, _202, _198);
    float _218 = sqrt(_206);
    float _220 = _160 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _222 = _160 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _224 = _160 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _226 = _148 * _190;
    float _228 = _138 * _190;
    float _230 = _142 * _190;
    float _232 = _160 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _234 = _210 * _226;
    float _236 = _212 * _228;
    float _238 = sqrt(_216);
    float _240 = _160 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _242 = -_234;
    float _244 = fma(_212, _230, _242);
    float _246 = _214 * _230;
    float _248 = -_236;
    float _250 = fma(_214, _226, _248);
    float _252 = _244 * _244;
    float _254 = -_246;
    float _256 = fma(_210, _228, _254);
    bool _260 = _218 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _262 = _160 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _264 = fma(_250, _250, _252);
    bool _266 = _218 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _268 = _160 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    bool _270 = !_260;
    int _273 = _270 ? 0 : 1;
    float _275 = fma(_256, _256, _264);
    float _277 = _160 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    bool _279 = _238 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _281 = _160 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _283 = _160 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _285 = rsqrt(_275);
    int _287 = 2;
    int _289 = 2;
    if (!_260)
    {
        _287 = 1;
    }
    int _291 = _287;
    float _293 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[19].x, _186);
    bool _295 = _238 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _297 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[33].x, _222);
    int _299 = _291;
    if (!_266)
    {
        _299 = _273;
    }
    int _301 = _299;
    float _303 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[22].x, _208);
    bool _305 = !_279;
    int _307 = _305 ? 0 : 1;
    float _309 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[33].z, _297);
    float _311 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[20].x, _224);
    if (!_279)
    {
        _289 = 1;
    }
    int _313 = _289;
    float _315 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[23].x, _232);
    float _317 = float(_301);
    float _319 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[29].x, _277);
    float _321 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[31].x, _281);
    float _323 = _244 * _285;
    float _325 = _250 * _285;
    float _327 = _256 * _285;
    float _329 = precise::min(_317, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _331 = _323 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    int _333 = _313;
    if (!_295)
    {
        _333 = _307;
    }
    int _335 = _333;
    float _337 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[24].x, _204);
    bool _339 = _329 != 1.0;
    bool _341 = isnan(_329);
    bool _343 = _339 || _341;
    bool _345 = isnan(1.0);
    bool _347 = _343 || _345;
    float _349 = fma(_325, (*spvDescriptorSet0.fp_c3)._m0[35].x, _331);
    float _351 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[21].x, _220);
    float _353 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[24].z, _337);
    float _355 = _160 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _357 = fma(_327, (*spvDescriptorSet0.fp_c3)._m0[35].z, _349);
    float _359 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[21].z, _351);
    bool _361 = _329 != 0.0;
    bool _363 = isnan(_329);
    bool _365 = _361 || _363;
    bool _367 = isnan(0.0);
    bool _369 = _365 || _367;
    float _371 = _160 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _373 = abs(_357);
    float _375 = -_373;
    float _377 = _375 + 1.0;
    float _379 = precise::clamp(_377, 0.0, 1.0);
    float _381 = _359 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _383 = float(_335);
    float _385 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[27].x, _371);
    float _387 = _381;
    if (_347)
    {
        float _389 = _353 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _387 = _389;
    }
    float _391 = _387;
    float _393 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[30].x, _355);
    float _395 = abs(_379);
    float _397 = log2(_395);
    float _399 = precise::min(_383, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _401 = _160 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _403 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[30].z, _393);
    float _405 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[27].z, _385);
    bool _407 = _399 != 1.0;
    bool _409 = isnan(_399);
    bool _411 = _407 || _409;
    bool _413 = isnan(1.0);
    bool _415 = _411 || _413;
    float _417 = _160 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    bool _419 = _399 != 0.0;
    bool _421 = isnan(_399);
    bool _423 = _419 || _421;
    bool _425 = isnan(0.0);
    bool _427 = _423 || _425;
    float _429 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[32].x, _283);
    float _431 = rint(_399);
    float _433 = precise::max(_431, 0.0);
    uint _436 = uint(_433);
    uint _438 = clamp(_436, 0u, 65535u);
    float _440 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[29].z, _319);
    float _442 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[31].z, _321);
    float _444 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[32].z, _429);
    float _446 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[20].z, _311);
    float _448 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[22].z, _303);
    float _450 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[23].z, _315);
    float _452 = _397 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _454 = _403 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _456 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[18].x, _401);
    float _458 = _454;
    float _460 = _391;
    if (_415)
    {
        float _462 = _309 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _458 = _462;
    }
    float _464 = _458;
    float _466 = _160 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _468 = _464;
    if (!_427)
    {
        float _470 = _405 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _468 = _470;
    }
    float _472 = _468;
    float _474 = exp2(_452);
    float _476 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[18].z, _456);
    float _478 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[17].x, _466);
    float _480 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[25].x, _240);
    float _482 = 0.0 + _472;
    float _484 = precise::clamp(_482, 0.0, 1.0);
    if (!_369)
    {
        float _486 = _476 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _460 = _486;
    }
    float _488 = _460;
    float _490 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[16].x, _417);
    float _492 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[25].z, _480);
    float _494 = rint(_329);
    float _496 = precise::max(_494, 0.0);
    uint _498 = uint(_496);
    uint _500 = clamp(_498, 0u, 65535u);
    float _502 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[17].z, _478);
    float _504 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[16].z, _490);
    float _506 = 0.0 + _488;
    float _508 = precise::clamp(_506, 0.0, 1.0);
    float _510 = _474 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _512 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[28].x, _268);
    float _514 = fma(_323, _510, _160);
    float _516 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[26].x, _262);
    float _518 = fma(_325, _510, _162);
    float _520 = fma(_327, _510, _154);
    float _522 = _514 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _524 = _514 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _526 = _514 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _528 = _514 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _530 = fma(_518, (*spvDescriptorSet0.fp_c3)._m0[3].x, _522);
    float _532 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[19].z, _293);
    float _534 = fma(_518, (*spvDescriptorSet0.fp_c3)._m0[0].x, _524);
    float _536 = fma(_518, (*spvDescriptorSet0.fp_c3)._m0[1].x, _526);
    float _538 = fma(_520, (*spvDescriptorSet0.fp_c3)._m0[3].z, _530);
    float _540 = fma(_518, (*spvDescriptorSet0.fp_c3)._m0[2].x, _528);
    float _542 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[28].z, _512);
    float _544 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[26].z, _516);
    float _546 = _538 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _548 = fma(_520, (*spvDescriptorSet0.fp_c3)._m0[2].z, _540);
    float _550 = fma(_520, (*spvDescriptorSet0.fp_c3)._m0[0].z, _534);
    float _552 = fma(_520, (*spvDescriptorSet0.fp_c3)._m0[1].z, _536);
    float _554 = _440 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _556 = _548 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _558 = 1.0 / _546;
    float _560 = _554;
    if (_415)
    {
        float _562 = _444 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _560 = _562;
    }
    float _564 = _560;
    float _566 = _542 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _568 = _564;
    float _570 = _566;
    if (!_427)
    {
        float _572 = _544 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _568 = _572;
    }
    float _574 = _568;
    if (_415)
    {
        float _576 = _442 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _570 = _576;
    }
    float _578 = _570;
    float _580 = _578;
    if (!_427)
    {
        float _582 = _492 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _580 = _582;
    }
    float _584 = _580;
    float _586 = _532 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _588 = _446 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _590 = _586;
    float _592 = _588;
    if (_347)
    {
        float _594 = _448 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _590 = _594;
    }
    float _596 = _590;
    float _598 = _596;
    if (_347)
    {
        float _600 = _450 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _592 = _600;
    }
    float _602 = _592;
    float _604 = _552 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _606 = _602;
    if (!_369)
    {
        float _608 = _504 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _598 = _608;
    }
    float _610 = _598;
    if (!_369)
    {
        float _612 = _502 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _606 = _612;
    }
    float _614 = _606;
    float _616 = _556 * _558;
    float _618 = precise::clamp(_616, 0.0, 1.0);
    float3 _1662 = float3(_584, _574, float(int(_438)));
    float3 _1666 = select(_1662, float3(0.0), isnan(_1662));
    float _620 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1666.xy, uint(rint(_1666.z)), _484);
    float3 _1675 = float3(_610, _614, float(int(_500)));
    float3 _1677 = select(_1675, float3(0.0), isnan(_1675));
    float _622 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1677.xy, uint(rint(_1677.z)), _508);
    float _624 = _550 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _626 = rint(_618);
    float _628 = precise::max(_626, 0.0);
    uint _630 = uint(_628);
    uint _632 = clamp(_630, 0u, 65535u);
    float _634 = _604 * _558;
    float _636 = _624 * _558;
    float3 _1704 = float3(_636, _634, float(int(_632)));
    float3 _1706 = select(_1704, float3(0.0), isnan(_1704));
    float _638 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1706.xy, uint(rint(_1706.z)), 1.0);
    float2 _1711 = float2(_54, _56);
    float _640 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1711, float2(0.0), isnan(_1711))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1711, float2(0.0), isnan(_1711))).x;
    float _642 = -_154;
    float _644 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _646 = _642 + _644;
    float _648 = -_154;
    float _650 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _652 = _648 + _650;
    float _654 = _646 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _656 = precise::clamp(_654, 0.0, 1.0);
    float _658 = _652 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _660 = precise::clamp(_658, 0.0, 1.0);
    float _662 = _620 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _664 = fma(_622, (*spvDescriptorSet0.fp_c3)._m0[49].z, _662);
    float _666 = _656 + _664;
    float _668 = _660 + _638;
    out.m_47.x = _640;
    out.m_47.y = _668;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _666;
    return out;
}

