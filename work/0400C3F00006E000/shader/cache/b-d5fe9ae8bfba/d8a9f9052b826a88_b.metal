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

struct _10
{
    uint _m0;
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_36 [[user(locn1)]];
};

static inline __attribute__((always_inline))
int _42(thread const int& _1680, thread const int& _1681, constant _10& support_buffer)
{
    int _1684 = 1 + _1681;
    float _1686 = support_buffer._m5[_1684].x;
    float _1688 = abs(_1686);
    bool _1690 = _1688 == 1.0;
    if (_1690)
    {
        return _1680;
    }
    float _1692 = float(_1680);
    float _1694 = _1692 / _1688;
    int _1696 = int(_1694);
    return _1696;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _46 = gl_FragCoord.w;
    float _48 = in.m_31.x;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_31.y;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = 1.0 / _46;
    float _62 = _60 * _52;
    float _64 = _60 * _58;
    float2 _746 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_746, float2(0.0), isnan(_746))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_746, float2(0.0), isnan(_746))).x;
    float _68 = -_66;
    float _70 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _72 = 1.0 / _70;
    bool _76 = _72 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_76)
    {
        discard_fragment();
    }
    if (_76)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return out;
    }
    float _78 = in.m_36.z;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_36.x;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_36.y;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _98 = precise::clamp(_96, 0.0, 1.0);
    float _100 = _60 * _82;
    float _102 = precise::max(_98, _100);
    float _104 = _60 * _88;
    float _106 = _60 * _94;
    bool _108 = _102 != 0.0;
    bool _110 = isnan(_102);
    bool _112 = _108 || _110;
    bool _114 = isnan(0.0);
    bool _116 = _112 || _114;
    float _118 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _120 = precise::clamp(_118, 0.0, 1.0);
    float _122 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _124 = precise::clamp(_122, 0.0, 1.0);
    float _126 = precise::min(_120, _124);
    bool _128 = !_116;
    if (!_128)
    {
        float _130 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _132 = fma(_102, _130, 1.0);
        float _134 = log2(_132);
        float _136 = _134 + (-1.0);
        float _138 = trunc(_136);
        int _140 = int(_138);
        float _142 = float(_140);
        float _144 = trunc(_142);
        int _146 = int(_144);
        float _148 = _142 + 1.0;
        float _150 = trunc(_148);
        int _152 = int(_150);
        int _154 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_146), spvDescriptorSet0.fp_t_tcb_A.get_height(_146)).x;
        int _156 = _154;
        int _158 = 1;
        int _160 = _42(_156, _158, (*spvDescriptorSet0.support_buffer));
        int _162 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_146), spvDescriptorSet0.fp_t_tcb_A.get_height(_146)).y;
        int _164 = _162;
        int _166 = 1;
        int _168 = _42(_164, _166, (*spvDescriptorSet0.support_buffer));
        int _170 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_152), spvDescriptorSet0.fp_t_tcb_A.get_height(_152)).x;
        int _172 = _170;
        int _174 = 1;
        int _176 = _42(_172, _174, (*spvDescriptorSet0.support_buffer));
        int _178 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_152), spvDescriptorSet0.fp_t_tcb_A.get_height(_152)).y;
        int _180 = _178;
        int _182 = 1;
        int _184 = _42(_180, _182, (*spvDescriptorSet0.support_buffer));
        float _186 = float(_160);
        float _188 = float(_168);
        float _190 = 1.0 / _186;
        float _192 = fma(_62, _186, -0.5);
        float _194 = fma(_64, _188, -0.5);
        float _196 = floor(_192);
        float _198 = floor(_194);
        float _200 = -_196;
        float _202 = _192 + _200;
        float _204 = float(_176);
        float _206 = 1.0 / _188;
        float _208 = _196 + 1.5;
        float _210 = -_202;
        float _212 = _210 + 1.0;
        float _214 = -_202;
        float _216 = _214 + 2.0;
        float _218 = fma(_62, _204, -0.5);
        float _220 = _196 + (-0.5);
        float _222 = _212 * _212;
        float _224 = -_198;
        float _226 = _194 + _224;
        float _228 = floor(_218);
        float _230 = _212 * _222;
        float _232 = float(_184);
        float _234 = _216 * _216;
        float _236 = -_226;
        float _238 = _236 + 2.0;
        float _240 = _230 * 4.0;
        float _242 = _226 * _226;
        float _244 = fma(_64, _232, -0.5);
        float _246 = -_230;
        float _248 = _246 + 6.0;
        float _250 = -_240;
        float _252 = fma(_216, _234, _250);
        float _254 = -_226;
        float _256 = _254 + 1.0;
        float _258 = floor(_244);
        float _260 = _238 * _238;
        float _262 = -_252;
        float _264 = _262 + _248;
        float _266 = _256 * _256;
        float _268 = _226 * _242;
        float _270 = _264 * 0.16666667163372039794921875;
        float _272 = _256 * _266;
        float _274 = _202 * _202;
        float _276 = _268 * 0.16666667163372039794921875;
        float _278 = 1.0 / _270;
        float _280 = _272 * 4.0;
        float _282 = _202 * _274;
        float _284 = -_228;
        float _286 = _218 + _284;
        float _288 = -_280;
        float _290 = fma(_238, _260, _288);
        float _292 = -_272;
        float _294 = _292 + 6.0;
        float _296 = -_286;
        float _298 = _296 + 1.0;
        float _300 = _282 * 0.16666667163372039794921875;
        float _302 = -_258;
        float _304 = _244 + _302;
        float _306 = -_290;
        float _308 = _306 + _294;
        float _310 = _298 * _298;
        float _312 = 1.0 / _204;
        float _314 = _308 * 0.16666667163372039794921875;
        float _316 = _298 * _310;
        float _318 = fma(_300, _278, _208);
        float _320 = -_304;
        float _322 = _320 + 1.0;
        float _324 = _230 + _252;
        float _326 = _316 * 4.0;
        float _328 = -_304;
        float _330 = _328 + 2.0;
        float _332 = -_286;
        float _334 = _332 + 2.0;
        float _336 = _322 * _322;
        float _338 = _324 * 0.16666667163372039794921875;
        float _340 = _272 + _290;
        float _342 = _334 * _334;
        float _344 = _322 * _336;
        float _346 = 1.0 / _338;
        float _348 = _340 * 0.16666667163372039794921875;
        float _350 = -_326;
        float _352 = fma(_334, _342, _350);
        float _354 = _330 * _330;
        float _356 = _344 * 4.0;
        float _358 = -_316;
        float _360 = _358 + 6.0;
        float _362 = _316 + _352;
        float _364 = _252 * 0.16666667163372039794921875;
        float _366 = 1.0 / _314;
        float _368 = -_352;
        float _370 = _368 + _360;
        float _372 = _362 * 0.16666667163372039794921875;
        float _374 = _198 + (-0.5);
        float _376 = _352 * 0.16666667163372039794921875;
        float _378 = _370 * 0.16666667163372039794921875;
        float _380 = 1.0 / _348;
        float _382 = -_356;
        float _384 = fma(_330, _354, _382);
        float _386 = -_344;
        float _388 = _386 + 6.0;
        float _390 = fma(_364, _346, _220);
        float _392 = _198 + 1.5;
        float _394 = _344 + _384;
        float _396 = -_384;
        float _398 = _396 + _388;
        float _400 = _290 * 0.16666667163372039794921875;
        float _402 = 1.0 / _372;
        float _404 = _394 * 0.16666667163372039794921875;
        float _406 = _398 * 0.16666667163372039794921875;
        float _408 = fma(_276, _366, _392);
        float _410 = _304 * _304;
        float _412 = _390 * _190;
        float _414 = _318 * _190;
        float _416 = 1.0 / _406;
        float _418 = fma(_400, _380, _374);
        float _420 = _286 * _286;
        float _422 = _304 * _410;
        float _424 = _228 + (-0.5);
        float _426 = _258 + 1.5;
        float _428 = _286 * _420;
        float _430 = _228 + 1.5;
        float _432 = 1.0 / _232;
        float _434 = _422 * 0.16666667163372039794921875;
        float _436 = _418 * _206;
        float _438 = fma(_376, _402, _424);
        float _440 = _258 + (-0.5);
        float _442 = _384 * 0.16666667163372039794921875;
        float _444 = _408 * _206;
        float _446 = 1.0 / _404;
        float _448 = fma(_434, _416, _426);
        float _450 = _438 * _312;
        float _452 = _428 * 0.16666667163372039794921875;
        float _454 = 1.0 / _378;
        float _456 = _448 * _432;
        float _458 = fma(_442, _446, _440);
        float _460 = _458 * _432;
        float2 _1267 = float2(_412, _436);
        float3 _464 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1267, float2(0.0), isnan(_1267)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1267, float2(0.0), isnan(_1267)), level(_142)).xyz;
        float _466 = _464.x;
        float _468 = _464.y;
        float _470 = _464.z;
        float2 _1282 = float2(_414, _436);
        float3 _472 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1282, float2(0.0), isnan(_1282)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1282, float2(0.0), isnan(_1282)), level(_142)).xyz;
        float _474 = _472.x;
        float _476 = _472.y;
        float _478 = _472.z;
        float2 _1297 = float2(_412, _444);
        float3 _480 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1297, float2(0.0), isnan(_1297)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1297, float2(0.0), isnan(_1297)), level(_142)).xyz;
        float _482 = _480.x;
        float _484 = _480.y;
        float _486 = _480.z;
        float _488 = fma(_452, _454, _430);
        float2 _1316 = float2(_414, _444);
        float3 _490 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1316, float2(0.0), isnan(_1316)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1316, float2(0.0), isnan(_1316)), level(_142)).xyz;
        float _492 = _490.x;
        float _494 = _490.y;
        float _496 = _490.z;
        float _498 = _488 * _312;
        float2 _1334 = float2(_450, _460);
        float3 _500 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1334, float2(0.0), isnan(_1334)), level(_148)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1334, float2(0.0), isnan(_1334)), level(_148)).xyz;
        float _502 = _500.x;
        float _504 = _500.y;
        float _506 = _500.z;
        float2 _1349 = float2(_498, _460);
        float3 _508 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1349, float2(0.0), isnan(_1349)), level(_148)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1349, float2(0.0), isnan(_1349)), level(_148)).xyz;
        float _510 = _508.x;
        float _512 = _508.y;
        float _514 = _508.z;
        float2 _1364 = float2(_450, _456);
        float3 _516 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1364, float2(0.0), isnan(_1364)), level(_148)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1364, float2(0.0), isnan(_1364)), level(_148)).xyz;
        float _518 = _516.x;
        float _520 = _516.y;
        float _522 = _516.z;
        float2 _1379 = float2(_498, _456);
        float3 _524 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1379, float2(0.0), isnan(_1379)), level(_148)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1379, float2(0.0), isnan(_1379)), level(_148)).xyz;
        float _526 = _524.x;
        float _528 = _524.y;
        float _530 = _524.z;
        float _532 = -_142;
        float _534 = _136 + _532;
        float _536 = precise::clamp(_534, 0.0, 1.0);
        float _538 = -_476;
        float _540 = _468 + _538;
        float _542 = -_474;
        float _544 = _466 + _542;
        float _546 = fma(_338, _540, _476);
        float _548 = -_478;
        float _550 = _470 + _548;
        float _552 = -_494;
        float _554 = _484 + _552;
        float _556 = -_492;
        float _558 = _482 + _556;
        float _560 = fma(_338, _544, _474);
        float _562 = -_496;
        float _564 = _486 + _562;
        float _566 = fma(_338, _554, _494);
        float _568 = fma(_338, _558, _492);
        float _570 = fma(_338, _550, _478);
        float _572 = -_512;
        float _574 = _504 + _572;
        float _576 = -_566;
        float _578 = _576 + _546;
        float _580 = -_510;
        float _582 = _502 + _580;
        float _584 = -_514;
        float _586 = _506 + _584;
        float _588 = fma(_372, _574, _512);
        float _590 = fma(_348, _578, _566);
        float _592 = -_528;
        float _594 = _520 + _592;
        float _596 = -_526;
        float _598 = _518 + _596;
        float _600 = fma(_372, _582, _510);
        float _602 = -_530;
        float _604 = _522 + _602;
        float _606 = fma(_372, _594, _528);
        float _608 = fma(_372, _598, _526);
        float _610 = -_568;
        float _612 = _610 + _560;
        float _614 = fma(_338, _564, _496);
        float _616 = -_606;
        float _618 = _616 + _588;
        float _620 = fma(_372, _586, _514);
        float _622 = fma(_372, _604, _530);
        float _624 = -_608;
        float _626 = _624 + _600;
        float _628 = fma(_404, _618, _606);
        float _630 = fma(_348, _612, _568);
        float _632 = -_614;
        float _634 = _632 + _570;
        float _636 = -_622;
        float _638 = _636 + _620;
        float _640 = fma(_404, _626, _608);
        float _642 = -_590;
        float _644 = _642 + _628;
        float _646 = fma(_348, _634, _614);
        float _648 = fma(_404, _638, _622);
        float _650 = -_630;
        float _652 = _650 + _640;
        float _654 = fma(_536, _644, _590);
        float _656 = _126 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _658 = -_646;
        float _660 = _658 + _648;
        float _662 = fma(_536, _652, _630);
        float _664 = _654 * 0.586600005626678466796875;
        float _666 = fma(_536, _660, _646);
        float _668 = fma(_662, 0.29890000820159912109375, _664);
        float _670 = fma(_666, 0.1143999993801116943359375, _668);
        float _672 = -_662;
        float _674 = _672 + _670;
        float _676 = -_654;
        float _678 = _676 + _670;
        float _680 = -_666;
        float _682 = _680 + _670;
        float _684 = fma(_656, _674, _662);
        float _686 = fma(_656, _678, _654);
        float _688 = fma(_656, _682, _666);
        float _690 = 0.0 + _134;
        float _692 = precise::clamp(_690, 0.0, 1.0);
        float _694 = -_684;
        float _696 = fma(_684, (*spvDescriptorSet0.fp_c3)._m0[13].x, _694);
        float _698 = -_686;
        float _700 = fma(_686, (*spvDescriptorSet0.fp_c3)._m0[13].y, _698);
        float _702 = -_688;
        float _704 = fma(_688, (*spvDescriptorSet0.fp_c3)._m0[13].z, _702);
        float _706 = fma(_106, _692, _104);
        float _708 = fma(_126, _696, _684);
        float _710 = fma(_126, _700, _686);
        float _712 = fma(_126, _704, _688);
        out.m_34.x = _708;
        out.m_34.y = _710;
        out.m_34.z = _712;
        out.m_34.w = _706;
        return out;
    }
    discard_fragment();
    return out;
}

