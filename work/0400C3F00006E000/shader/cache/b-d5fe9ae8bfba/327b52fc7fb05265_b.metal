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
    texture2d_array<float> fp_t_tcb_E [[id(3)]];
    sampler fp_t_tcb_ESmplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
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
    float2 _652 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_652, float2(0.0), isnan(_652))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_652, float2(0.0), isnan(_652))).x;
    float2 _663 = float2(_52, _54);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_663, float2(0.0), isnan(_663)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float _68 = in.m_38.y;
    float _70 = in.m_38.x;
    float _72 = in.m_40.y;
    float _74 = in.m_42.y;
    float _76 = in.m_40.x;
    float _78 = in.m_42.x;
    float _80 = -_56;
    float _82 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _84 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[46].z, _82);
    float _86 = _84 * _68;
    float _88 = _84 * _70;
    float _90 = -_62;
    float _92 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _94 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[46].z, _92);
    float _96 = -_64;
    float _98 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _100 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[46].z, _98);
    float _102 = -_86;
    float _104 = _102 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _106 = -_88;
    float _108 = _106 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _110 = _68 * _94;
    float _112 = -_66;
    float _114 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _116 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[46].z, _114);
    float _118 = _104 * _104;
    float _120 = _86 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _122 = -_110;
    float _124 = fma(_116, _74, _122);
    float _126 = fma(_108, _108, _118);
    float _128 = _70 * _94;
    float _130 = -_110;
    float _132 = fma(_100, _72, _130);
    float _134 = -_84;
    float _136 = _134 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _138 = -_86;
    float _140 = _138 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _142 = -_128;
    float _144 = fma(_100, _76, _142);
    float _146 = _132 * _132;
    float _148 = fma(_136, _136, _126);
    float _150 = -_128;
    float _152 = fma(_116, _78, _150);
    float _154 = _124 * _124;
    float _156 = -_94;
    float _158 = _156 + _100;
    float _160 = fma(_144, _144, _146);
    float _162 = -_94;
    float _164 = _162 + _116;
    float _166 = sqrt(_148);
    float _168 = fma(_152, _152, _154);
    float _170 = fma(_158, _158, _160);
    float _172 = -_88;
    float _174 = _172 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _176 = _140 * _140;
    float _178 = fma(_164, _164, _168);
    float _180 = _86 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _182 = _86 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _184 = rsqrt(_170);
    float _186 = fma(_174, _174, _176);
    float _188 = -_84;
    float _190 = _188 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _192 = _86 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _194 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[28].x, _120);
    float _196 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[23].x, _180);
    float _198 = fma(_190, _190, _186);
    float _200 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[27].x, _182);
    float _202 = rsqrt(_178);
    bool _206 = _166 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _208 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[31].x, _192);
    bool _210 = _166 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _212 = _86 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _214 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[28].z, _194);
    float _216 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[23].z, _196);
    float _218 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[27].z, _200);
    float _220 = _144 * _184;
    bool _222 = !_206;
    int _225 = _222 ? 0 : 1;
    float _227 = _158 * _184;
    float _229 = sqrt(_198);
    float _231 = _132 * _184;
    float _233 = _86 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    int _235 = 2;
    if (!_206)
    {
        _235 = 1;
    }
    int _237 = _235;
    float _239 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[31].z, _208);
    float _241 = _164 * _202;
    float _243 = _124 * _202;
    float _245 = _152 * _202;
    int _247 = _237;
    if (!_210)
    {
        _247 = _225;
    }
    int _249 = _247;
    float _251 = _220 * _241;
    float _253 = _227 * _243;
    float _255 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[24].x, _233);
    float _257 = _86 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _259 = -_251;
    float _261 = fma(_227, _245, _259);
    float _263 = _231 * _245;
    float _265 = -_253;
    float _267 = fma(_231, _241, _265);
    bool _269 = _229 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _271 = _261 * _261;
    float _273 = -_263;
    float _275 = fma(_220, _243, _273);
    bool _277 = _229 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _279 = _86 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _281 = fma(_267, _267, _271);
    float _283 = float(_249);
    float _285 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[24].z, _255);
    float _287 = fma(_275, _275, _281);
    float _289 = precise::min(_283, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _291 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[21].x, _279);
    bool _293 = !_269;
    int _295 = _293 ? 0 : 1;
    float _297 = _86 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    int _299 = 2;
    if (!_269)
    {
        _299 = 1;
    }
    int _301 = _299;
    float _303 = rsqrt(_287);
    bool _305 = _289 != 1.0;
    bool _307 = isnan(_289);
    bool _309 = _305 || _307;
    bool _311 = isnan(1.0);
    bool _313 = _309 || _311;
    float _315 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[21].z, _291);
    int _317 = _301;
    if (!_277)
    {
        _317 = _295;
    }
    int _319 = _317;
    float _321 = _86 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    bool _323 = _289 != 0.0;
    bool _325 = isnan(_289);
    bool _327 = _323 || _325;
    bool _329 = isnan(0.0);
    bool _331 = _327 || _329;
    float _333 = _315 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _335 = float(_319);
    float _337 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[22].x, _212);
    float _339 = _86 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _341 = _86 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _343 = rint(_289);
    float _345 = precise::max(_343, 0.0);
    uint _348 = uint(_345);
    uint _350 = clamp(_348, 0u, 65535u);
    float _352 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[22].z, _337);
    float _354 = _333;
    if (_313)
    {
        float _356 = _285 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _354 = _356;
    }
    float _358 = _354;
    float _360 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[30].x, _297);
    float _362 = _261 * _303;
    float _364 = _267 * _303;
    float _366 = _275 * _303;
    float _368 = precise::min(_335, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _370 = _362 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _372 = _86 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _374 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[33].x, _321);
    bool _376 = _368 != 1.0;
    bool _378 = isnan(_368);
    bool _380 = _376 || _378;
    bool _382 = isnan(1.0);
    bool _384 = _380 || _382;
    float _386 = fma(_364, (*spvDescriptorSet0.fp_c3)._m0[35].x, _370);
    float _388 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[30].z, _360);
    float _390 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[18].x, _372);
    float _392 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[33].z, _374);
    float _394 = fma(_366, (*spvDescriptorSet0.fp_c3)._m0[35].z, _386);
    float _396 = _388 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _398 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[18].z, _390);
    float _400 = _86 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _402 = abs(_394);
    float _404 = -_402;
    float _406 = _404 + 1.0;
    float _408 = precise::clamp(_406, 0.0, 1.0);
    bool _410 = _368 != 0.0;
    bool _412 = isnan(_368);
    bool _414 = _410 || _412;
    bool _416 = isnan(0.0);
    bool _418 = _414 || _416;
    float _420 = _358;
    float _422 = _396;
    if (!_331)
    {
        float _424 = _398 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _420 = _424;
    }
    float _426 = _420;
    float _428 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[20].x, _400);
    if (_384)
    {
        float _430 = _392 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _422 = _430;
    }
    float _432 = _422;
    float _434 = _86 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _436 = abs(_408);
    float _438 = log2(_436);
    float _440 = _86 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _442 = 0.0 + _426;
    float _444 = precise::clamp(_442, 0.0, 1.0);
    float _446 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[19].x, _434);
    float _448 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[19].z, _446);
    float _450 = _432;
    if (!_418)
    {
        float _452 = _218 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _450 = _452;
    }
    float _454 = _450;
    float _456 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[17].x, _339);
    float _458 = rint(_368);
    float _460 = precise::max(_458, 0.0);
    uint _462 = uint(_460);
    uint _464 = clamp(_462, 0u, 65535u);
    float _466 = 0.0 + _454;
    float _468 = precise::clamp(_466, 0.0, 1.0);
    float _470 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[17].z, _456);
    float _472 = _438 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _474 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[20].z, _428);
    float _476 = _448 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _478 = _214 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _480 = _476;
    float _482 = _478;
    if (_313)
    {
        float _484 = _352 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _480 = _484;
    }
    float _486 = _480;
    float _488 = _474 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _490 = exp2(_472);
    float _492 = _488;
    float _494 = _486;
    if (_313)
    {
        float _496 = _216 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _492 = _496;
    }
    float _498 = _492;
    float _500 = _498;
    if (_384)
    {
        float _502 = _239 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _482 = _502;
    }
    float _504 = _482;
    float _506 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[16].x, _440);
    float _508 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[26].x, _257);
    float _510 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[29].x, _341);
    float _512 = _504;
    if (!_331)
    {
        float _514 = _470 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _500 = _514;
    }
    float _516 = _500;
    float _518 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[16].z, _506);
    float _520 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[26].z, _508);
    float _522 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[29].z, _510);
    if (!_331)
    {
        float _524 = _518 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _494 = _524;
    }
    float _526 = _494;
    float _528 = _490 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _530 = _86 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _532 = fma(_362, _528, _86);
    float _534 = _86 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _536 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[25].x, _530);
    float _538 = fma(_366, _528, _84);
    float _540 = _532 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _542 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[32].x, _534);
    float _544 = fma(_364, _528, _88);
    float _546 = _532 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _548 = _532 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _550 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[32].z, _542);
    float _552 = fma(_544, (*spvDescriptorSet0.fp_c3)._m0[1].x, _540);
    float _554 = fma(_544, (*spvDescriptorSet0.fp_c3)._m0[3].x, _546);
    float _556 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[25].z, _536);
    float _558 = fma(_544, (*spvDescriptorSet0.fp_c3)._m0[2].x, _548);
    float _560 = _522 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _562 = fma(_538, (*spvDescriptorSet0.fp_c3)._m0[3].z, _554);
    float _564 = _560;
    if (_384)
    {
        float _566 = _550 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _564 = _566;
    }
    float _568 = _564;
    float _570 = fma(_538, (*spvDescriptorSet0.fp_c3)._m0[1].z, _552);
    float _572 = _568;
    if (!_418)
    {
        float _574 = _556 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _512 = _574;
    }
    float _576 = _512;
    float _578 = _562 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _580 = _532 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    if (!_418)
    {
        float _582 = _520 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _572 = _582;
    }
    float _584 = _572;
    float _586 = fma(_538, (*spvDescriptorSet0.fp_c3)._m0[2].z, _558);
    float _588 = 1.0 / _578;
    float _590 = fma(_544, (*spvDescriptorSet0.fp_c3)._m0[0].x, _580);
    float _592 = _570 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float3 _1604 = float3(_576, _584, float(int(_464)));
    float3 _1608 = select(_1604, float3(0.0), isnan(_1604));
    float _594 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1608.xy, uint(rint(_1608.z)), _468);
    float3 _1617 = float3(_526, _516, float(int(_350)));
    float3 _1619 = select(_1617, float3(0.0), isnan(_1617));
    float _596 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1619.xy, uint(rint(_1619.z)), _444);
    float _598 = fma(_538, (*spvDescriptorSet0.fp_c3)._m0[0].z, _590);
    float _600 = _586 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _602 = _598 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _604 = _592 * _588;
    float _606 = _602 * _588;
    float _608 = _600 * _588;
    float _610 = precise::clamp(_608, 0.0, 1.0);
    float3 _1650 = float3(_606, _604, float(0));
    float3 _1652 = select(_1650, float3(0.0), isnan(_1650));
    float _612 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1652.xy, uint(rint(_1652.z)), _610);
    float _614 = -_84;
    float _616 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _618 = _614 + _616;
    float _620 = -_84;
    float _622 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _624 = _620 + _622;
    float _626 = _618 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _628 = precise::clamp(_626, 0.0, 1.0);
    float _630 = _624 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _632 = precise::clamp(_630, 0.0, 1.0);
    float _634 = _594 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _636 = fma(_596, (*spvDescriptorSet0.fp_c3)._m0[49].z, _634);
    float _638 = _628 + _636;
    float _640 = _632 + _612;
    out.m_45.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_45.y = _640;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _638;
    return out;
}

