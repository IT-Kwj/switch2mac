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
    float2 _781 = float2(_56, _58);
    float3 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_781, float2(0.0), isnan(_781)), int2(0), component::x).xyw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float2 _798 = float2(_56, _58);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_798, float2(0.0), isnan(_798))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_798, float2(0.0), isnan(_798))).x;
    float2 _806 = float2(_56, _58);
    float2 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_806, float2(0.0), isnan(_806))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_806, float2(0.0), isnan(_806))).xy;
    float _76 = _74.x;
    float _78 = _74.y;
    float _80 = in.m_42.y;
    float _82 = in.m_44.y;
    float _84 = in.m_42.x;
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
    float _110 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _112 = _104 * _110;
    float _114 = -_70;
    float _116 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _118 = _80 * _112;
    float _120 = _84 * _112;
    float _122 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _124 = _106 * _122;
    float _126 = 1.0 / _116;
    float _128 = -_118;
    float _130 = fma(_124, _82, _128);
    float _132 = -_120;
    float _134 = fma(_124, _88, _132);
    float _136 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _138 = _108 * _136;
    float _140 = _130 * _130;
    float _142 = -_118;
    float _144 = fma(_138, _86, _142);
    float _146 = -_120;
    float _148 = fma(_138, _90, _146);
    float _150 = -_112;
    float _152 = _150 + _124;
    float _154 = fma(_134, _134, _140);
    float _156 = _144 * _144;
    float _158 = -_112;
    float _160 = _158 + _138;
    float _162 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _164 = _126 * _162;
    float _166 = fma(_152, _152, _154);
    float _168 = fma(_148, _148, _156);
    float _170 = _164 * _80;
    float _172 = _164 * _84;
    float _174 = fma(_160, _160, _168);
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
    float _196 = _170 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _198 = _188 * _188;
    float _200 = rsqrt(_174);
    float _202 = fma(_184, _184, _194);
    float _204 = -_164;
    float _206 = _204 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _208 = fma(_192, _192, _198);
    float _210 = _170 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _212 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[23].x, _196);
    float _214 = fma(_206, _206, _202);
    float _216 = -_164;
    float _218 = _216 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _220 = _134 * _176;
    float _222 = _152 * _176;
    float _224 = _130 * _176;
    float _226 = fma(_218, _218, _208);
    float _228 = sqrt(_214);
    float _230 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[24].x, _210);
    float _232 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[23].z, _212);
    float _234 = _170 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _236 = _160 * _200;
    float _238 = _144 * _200;
    float _240 = _148 * _200;
    float _242 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[24].z, _230);
    float _244 = _220 * _236;
    float _246 = _222 * _238;
    float _248 = sqrt(_226);
    float _250 = _170 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _252 = -_244;
    float _254 = fma(_222, _240, _252);
    float _256 = _224 * _240;
    float _258 = -_246;
    float _260 = fma(_224, _236, _258);
    float _262 = _254 * _254;
    float _264 = -_256;
    float _266 = fma(_220, _238, _264);
    bool _270 = _228 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _272 = _170 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _274 = fma(_260, _260, _262);
    bool _276 = _228 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _278 = _170 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    bool _280 = !_270;
    int _283 = _280 ? 0 : 1;
    float _285 = fma(_266, _266, _274);
    float _287 = _170 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    bool _289 = _248 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _291 = rsqrt(_285);
    bool _293 = _248 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _295 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[32].x, _278);
    int _297 = 2;
    int _299 = 2;
    if (!_270)
    {
        _297 = 1;
    }
    int _301 = _297;
    float _303 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[33].x, _287);
    bool _305 = !_289;
    int _307 = _305 ? 0 : 1;
    float _309 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[32].z, _295);
    int _311 = _301;
    if (!_276)
    {
        _311 = _283;
    }
    int _313 = _311;
    float _315 = _170 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _317 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[33].z, _303);
    if (!_289)
    {
        _299 = 1;
    }
    int _319 = _299;
    int _321 = _319;
    if (!_293)
    {
        _321 = _307;
    }
    int _323 = _321;
    float _325 = _170 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _327 = _266 * _291;
    float _329 = _170 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _331 = _254 * _291;
    float _333 = _260 * _291;
    float _335 = float(_313);
    float _337 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[19].x, _329);
    float _339 = _170 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _341 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[22].x, _325);
    float _343 = precise::min(_335, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _345 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[19].z, _337);
    float _347 = _331 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _349 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[20].x, _339);
    bool _351 = _343 != 1.0;
    bool _353 = isnan(_343);
    bool _355 = _351 || _353;
    bool _357 = isnan(1.0);
    bool _359 = _355 || _357;
    float _361 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[21].x, _315);
    float _363 = fma(_333, (*spvDescriptorSet0.fp_c3)._m0[35].x, _347);
    float _365 = float(_323);
    float _367 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[20].z, _349);
    float _369 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[21].z, _361);
    float _371 = fma(_327, (*spvDescriptorSet0.fp_c3)._m0[35].z, _363);
    float _373 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[22].z, _341);
    float _375 = precise::min(_365, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _377 = _345 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _379 = abs(_371);
    float _381 = -_379;
    float _383 = _381 + 1.0;
    float _385 = precise::clamp(_383, 0.0, 1.0);
    float _387 = _367 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _389 = _369 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _391 = _377;
    float _393 = _387;
    float _395 = _389;
    if (_359)
    {
        float _397 = _373 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _391 = _397;
    }
    float _399 = _391;
    float _401 = _399;
    if (_359)
    {
        float _403 = _232 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _393 = _403;
    }
    float _405 = _393;
    float _407 = _405;
    if (_359)
    {
        float _409 = _242 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _395 = _409;
    }
    float _411 = _395;
    float _413 = abs(_385);
    float _415 = log2(_413);
    float _417 = _170 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    bool _419 = _375 != 1.0;
    bool _421 = isnan(_375);
    bool _423 = _419 || _421;
    bool _425 = isnan(1.0);
    bool _427 = _423 || _425;
    float _429 = _170 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    bool _431 = _343 != 0.0;
    bool _433 = isnan(_343);
    bool _435 = _431 || _433;
    bool _437 = isnan(0.0);
    bool _439 = _435 || _437;
    float _441 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[28].x, _417);
    float _443 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[29].x, _234);
    float _445 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[30].x, _250);
    float _447 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[31].x, _272);
    float _449 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[16].x, _429);
    float _451 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[28].z, _441);
    float _453 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[29].z, _443);
    float _455 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[30].z, _445);
    float _457 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[31].z, _447);
    float _459 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[16].z, _449);
    float _461 = _170 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _463 = _415 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _465 = _170 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _467 = _170 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _469 = _451 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _471 = _453 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _473 = _455 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _475 = exp2(_463);
    float _477 = _469;
    float _479 = _471;
    float _481 = _473;
    float _483 = _411;
    if (_427)
    {
        float _485 = _457 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _477 = _485;
    }
    float _487 = _477;
    float _489 = _487;
    if (_427)
    {
        float _491 = _309 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _479 = _491;
    }
    float _493 = _479;
    float _495 = _493;
    if (_427)
    {
        float _497 = _317 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _481 = _497;
    }
    float _499 = _481;
    float _501 = _499;
    if (!_439)
    {
        float _503 = _459 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _401 = _503;
    }
    float _505 = _401;
    float _507 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[17].x, _461);
    float _509 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[25].x, _465);
    float _511 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[26].x, _467);
    bool _513 = _375 != 0.0;
    bool _515 = isnan(_375);
    bool _517 = _513 || _515;
    bool _519 = isnan(0.0);
    bool _521 = _517 || _519;
    float _523 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[17].z, _507);
    float _525 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[25].z, _509);
    float _527 = rint(_343);
    float _529 = precise::max(_527, 0.0);
    uint _532 = uint(_529);
    uint _534 = clamp(_532, 0u, 65535u);
    float _536 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[26].z, _511);
    if (!_439)
    {
        float _538 = _523 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _407 = _538;
    }
    float _540 = _407;
    float _542 = _475 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _544 = _170 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _546 = rint(_375);
    float _548 = precise::max(_546, 0.0);
    uint _550 = uint(_548);
    uint _552 = clamp(_550, 0u, 65535u);
    float _554 = fma(_331, _542, _170);
    float _556 = _170 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _558 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[18].x, _544);
    float _560 = fma(_327, _542, _164);
    float _562 = _554 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _564 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[27].x, _556);
    float _566 = fma(_333, _542, _172);
    float _568 = _554 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _570 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[18].z, _558);
    float _572 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[27].z, _564);
    float _574 = fma(_566, (*spvDescriptorSet0.fp_c3)._m0[2].x, _562);
    float _576 = fma(_566, (*spvDescriptorSet0.fp_c3)._m0[3].x, _568);
    float _578 = _554 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    if (!_439)
    {
        float _580 = _570 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _483 = _580;
    }
    float _582 = _483;
    float _584 = fma(_560, (*spvDescriptorSet0.fp_c3)._m0[3].z, _576);
    if (!_521)
    {
        float _586 = _572 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _501 = _586;
    }
    float _588 = _501;
    float _590 = fma(_566, (*spvDescriptorSet0.fp_c3)._m0[1].x, _578);
    float _592 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _594 = _584 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _596 = _554 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _598 = fma(_560, (*spvDescriptorSet0.fp_c3)._m0[2].z, _574);
    float _600 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _602 = 0.0 + _588;
    float _604 = precise::clamp(_602, 0.0, 1.0);
    float _606 = fma(_566, (*spvDescriptorSet0.fp_c3)._m0[0].x, _596);
    float _608 = 1.0 / _594;
    float _610 = 0.0 + _582;
    float _612 = precise::clamp(_610, 0.0, 1.0);
    float _614 = fma(_560, (*spvDescriptorSet0.fp_c3)._m0[1].z, _590);
    float _616 = fma(_560, (*spvDescriptorSet0.fp_c3)._m0[0].z, _606);
    if (!_521)
    {
        float _618 = _525 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _489 = _618;
    }
    float _620 = _489;
    float _622 = _612 * _592;
    float _624 = _598 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _626 = _616 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _628 = _612 * _600;
    float _630 = _600 * _604;
    float _632 = _614 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    if (!_521)
    {
        float _634 = _536 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _495 = _634;
    }
    float _636 = _495;
    float _638 = _592 * _604;
    float _640 = fma(_628, 0.5, _505);
    float _642 = fma(_628, -0.5, _505);
    float _644 = _626 * _608;
    float _646 = fma(_622, 0.5, _540);
    float _648 = _624 * _608;
    float _650 = precise::clamp(_648, 0.0, 1.0);
    float _652 = fma(_622, -0.5, _540);
    float _654 = fma(_630, 0.5, _620);
    float _656 = _632 * _608;
    float _658 = fma(_630, -0.5, _620);
    float _660 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _662 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _664 = fma(_76, 2.0, -1.0);
    float _666 = rint(_650);
    float _668 = precise::max(_666, 0.0);
    uint _670 = uint(_668);
    uint _672 = clamp(_670, 0u, 65535u);
    float _674 = fma(_638, 0.5, _636);
    float _676 = fma(_662, 0.5, _656);
    float _678 = fma(_638, -0.5, _636);
    float _680 = fma(_662, -0.5, _656);
    float _682 = fma(_660, 0.5, _644);
    float _684 = _664 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _686 = fma(_660, -0.5, _644);
    float _688 = fma(_78, 2.0, -1.0);
    float _690 = fma(_684, 2.0, _56);
    float _692 = _688 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _694 = fma(_692, 2.0, _58);
    float3 _1886 = float3(_686, _676, float(int(_672)));
    float3 _1890 = select(_1886, float3(0.0), isnan(_1886));
    float _696 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1890.xy, uint(rint(_1890.z)), 1.0);
    float3 _1898 = float3(_682, _676, float(int(_672)));
    float3 _1900 = select(_1898, float3(0.0), isnan(_1898));
    float _698 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1900.xy, uint(rint(_1900.z)), 1.0);
    float3 _1908 = float3(_682, _680, float(int(_672)));
    float3 _1910 = select(_1908, float3(0.0), isnan(_1908));
    float _700 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1910.xy, uint(rint(_1910.z)), 1.0);
    float3 _1918 = float3(_686, _680, float(int(_672)));
    float3 _1920 = select(_1918, float3(0.0), isnan(_1918));
    float _702 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1920.xy, uint(rint(_1920.z)), 1.0);
    float3 _1928 = float3(_642, _646, float(int(_534)));
    float3 _1930 = select(_1928, float3(0.0), isnan(_1928));
    float _704 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1930.xy, uint(rint(_1930.z)), _612);
    float3 _1939 = float3(_640, _646, float(int(_534)));
    float3 _1941 = select(_1939, float3(0.0), isnan(_1939));
    float _706 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1941.xy, uint(rint(_1941.z)), _612);
    float3 _1950 = float3(_640, _652, float(int(_534)));
    float3 _1952 = select(_1950, float3(0.0), isnan(_1950));
    float _708 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1952.xy, uint(rint(_1952.z)), _612);
    float3 _1961 = float3(_658, _674, float(int(_552)));
    float3 _1963 = select(_1961, float3(0.0), isnan(_1961));
    float _710 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1963.xy, uint(rint(_1963.z)), _604);
    float3 _1972 = float3(_654, _674, float(int(_552)));
    float3 _1974 = select(_1972, float3(0.0), isnan(_1972));
    float _712 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1974.xy, uint(rint(_1974.z)), _604);
    float3 _1983 = float3(_654, _678, float(int(_552)));
    float3 _1985 = select(_1983, float3(0.0), isnan(_1983));
    float _714 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1985.xy, uint(rint(_1985.z)), _604);
    float3 _1994 = float3(_642, _652, float(int(_534)));
    float3 _1996 = select(_1994, float3(0.0), isnan(_1994));
    float _716 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1996.xy, uint(rint(_1996.z)), _612);
    float3 _2005 = float3(_658, _678, float(int(_552)));
    float3 _2007 = select(_2005, float3(0.0), isnan(_2005));
    float _718 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2007.xy, uint(rint(_2007.z)), _604);
    float2 _2013 = float2(_690, _694);
    float _720 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2013, float2(0.0), isnan(_2013))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2013, float2(0.0), isnan(_2013))).x;
    float _722 = _698 + _696;
    float _724 = -_164;
    float _726 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _728 = _724 + _726;
    float _730 = _722 + _700;
    float _732 = _728 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _734 = precise::clamp(_732, 0.0, 1.0);
    float _736 = _706 + _704;
    float _738 = _730 + _702;
    float _740 = -_164;
    float _742 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _744 = _740 + _742;
    float _746 = _736 + _708;
    float _748 = fma(_738, 0.25, _734);
    float _750 = _744 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _752 = precise::clamp(_750, 0.0, 1.0);
    float _754 = _712 + _710;
    float _756 = _754 + _714;
    float _758 = _746 + _716;
    float _760 = _756 + _718;
    float _762 = _758 * 0.25;
    float _764 = _760 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _766 = _764 * 0.25;
    float _768 = fma(_762, (*spvDescriptorSet0.fp_c3)._m0[49].z, _766);
    float _770 = _752 + _768;
    out.m_49.x = _720;
    out.m_49.y = _748;
    out.m_49.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_49.w = _770;
    return out;
}

