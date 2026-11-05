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
int _42(thread const int& _1689, thread const int& _1690, constant _10& support_buffer)
{
    int _1693 = 1 + _1690;
    float _1695 = support_buffer._m5[_1693].x;
    float _1697 = abs(_1695);
    bool _1699 = _1697 == 1.0;
    if (_1699)
    {
        return _1689;
    }
    float _1701 = float(_1689);
    float _1703 = _1701 / _1697;
    int _1705 = int(_1703);
    return _1705;
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
    bool _70 = _66 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_70)
    {
        discard_fragment();
    }
    if (_70)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return out;
    }
    float _72 = in.m_36.z;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_36.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_36.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _92 = precise::clamp(_90, 0.0, 1.0);
    float _94 = _60 * _76;
    float _96 = _60 * _88;
    float _98 = precise::max(_92, _94);
    float _100 = _60 * _82;
    bool _102 = _98 != 0.0;
    bool _104 = isnan(_98);
    bool _106 = _102 || _104;
    bool _108 = isnan(0.0);
    bool _110 = _106 || _108;
    float _112 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _114 = precise::clamp(_112, 0.0, 1.0);
    float _116 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _118 = precise::clamp(_116, 0.0, 1.0);
    float _120 = precise::min(_114, _118);
    bool _122 = !_110;
    if (!_122)
    {
        float _124 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _126 = fma(_98, _124, 1.0);
        float _128 = log2(_126);
        float _130 = _128 + (-1.0);
        float _132 = trunc(_130);
        int _134 = int(_132);
        float _136 = float(_134);
        float _138 = trunc(_136);
        int _140 = int(_138);
        float _142 = _136 + 1.0;
        float _144 = trunc(_142);
        int _146 = int(_144);
        int _148 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_140), spvDescriptorSet0.fp_t_tcb_A.get_height(_140)).x;
        int _150 = _148;
        int _152 = 1;
        int _154 = _42(_150, _152, (*spvDescriptorSet0.support_buffer));
        int _156 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_140), spvDescriptorSet0.fp_t_tcb_A.get_height(_140)).y;
        int _158 = _156;
        int _160 = 1;
        int _162 = _42(_158, _160, (*spvDescriptorSet0.support_buffer));
        int _164 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_146), spvDescriptorSet0.fp_t_tcb_A.get_height(_146)).x;
        int _166 = _164;
        int _168 = 1;
        int _170 = _42(_166, _168, (*spvDescriptorSet0.support_buffer));
        int _172 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_146), spvDescriptorSet0.fp_t_tcb_A.get_height(_146)).y;
        int _174 = _172;
        int _176 = 1;
        int _178 = _42(_174, _176, (*spvDescriptorSet0.support_buffer));
        float _180 = float(_154);
        float _182 = float(_162);
        float _184 = 1.0 / _180;
        float _186 = fma(_62, _180, -0.5);
        float _188 = fma(_64, _182, -0.5);
        float _190 = floor(_186);
        float _192 = float(_170);
        float _194 = fma(_62, _192, -0.5);
        float _196 = floor(_188);
        float _198 = -_190;
        float _200 = _186 + _198;
        float _202 = floor(_194);
        float _204 = _190 + 1.5;
        float _206 = _190 + (-0.5);
        float _208 = -_200;
        float _210 = _208 + 1.0;
        float _212 = -_200;
        float _214 = _212 + 2.0;
        float _216 = _210 * _210;
        float _218 = -_196;
        float _220 = _188 + _218;
        float _222 = 1.0 / _182;
        float _224 = _210 * _216;
        float _226 = float(_178);
        float _228 = _214 * _214;
        float _230 = -_220;
        float _232 = _230 + 1.0;
        float _234 = _224 * 4.0;
        float _236 = _220 * _220;
        float _238 = fma(_64, _226, -0.5);
        float _240 = -_224;
        float _242 = _240 + 6.0;
        float _244 = -_234;
        float _246 = fma(_214, _228, _244);
        float _248 = _232 * _232;
        float _250 = floor(_238);
        float _252 = -_220;
        float _254 = _252 + 2.0;
        float _256 = -_246;
        float _258 = _256 + _242;
        float _260 = _224 + _246;
        float _262 = _246 * 0.16666667163372039794921875;
        float _264 = _254 * _254;
        float _266 = _258 * 0.16666667163372039794921875;
        float _268 = _232 * _248;
        float _270 = _200 * _200;
        float _272 = -_202;
        float _274 = _194 + _272;
        float _276 = 1.0 / _266;
        float _278 = _268 * 4.0;
        float _280 = _200 * _270;
        float _282 = -_274;
        float _284 = _282 + 1.0;
        float _286 = _260 * 0.16666667163372039794921875;
        float _288 = -_278;
        float _290 = fma(_254, _264, _288);
        float _292 = _280 * 0.16666667163372039794921875;
        float _294 = -_250;
        float _296 = _238 + _294;
        float _298 = -_268;
        float _300 = _298 + 6.0;
        float _302 = _284 * _284;
        float _304 = 1.0 / _286;
        float _306 = _268 + _290;
        float _308 = -_290;
        float _310 = _308 + _300;
        float _312 = _284 * _302;
        float _314 = -_296;
        float _316 = _314 + 2.0;
        float _318 = _306 * 0.16666667163372039794921875;
        float _320 = fma(_292, _276, _204);
        float _322 = -_296;
        float _324 = _322 + 1.0;
        float _326 = -_274;
        float _328 = _326 + 2.0;
        float _330 = _312 * 4.0;
        float _332 = _310 * 0.16666667163372039794921875;
        float _334 = _324 * _324;
        float _336 = _328 * _328;
        float _338 = _220 * _236;
        float _340 = 1.0 / _332;
        float _342 = _324 * _334;
        float _344 = -_330;
        float _346 = fma(_328, _336, _344);
        float _348 = -_312;
        float _350 = _348 + 6.0;
        float _352 = _316 * _316;
        float _354 = _342 * 4.0;
        float _356 = _312 + _346;
        float _358 = fma(_262, _304, _206);
        float _360 = _338 * 0.16666667163372039794921875;
        float _362 = -_354;
        float _364 = fma(_316, _352, _362);
        float _366 = -_346;
        float _368 = _366 + _350;
        float _370 = -_342;
        float _372 = _370 + 6.0;
        float _374 = 1.0 / _318;
        float _376 = _342 + _364;
        float _378 = _368 * 0.16666667163372039794921875;
        float _380 = -_364;
        float _382 = _380 + _372;
        float _384 = _356 * 0.16666667163372039794921875;
        float _386 = _196 + (-0.5);
        float _388 = _196 + 1.5;
        float _390 = _382 * 0.16666667163372039794921875;
        float _392 = _376 * 0.16666667163372039794921875;
        float _394 = 1.0 / _378;
        float _396 = fma(_360, _340, _388);
        float _398 = _290 * 0.16666667163372039794921875;
        float _400 = _274 * _274;
        float _402 = _358 * _184;
        float _404 = _320 * _184;
        float _406 = _202 + 1.5;
        float _408 = fma(_398, _374, _386);
        float _410 = 1.0 / _384;
        float _412 = _296 * _296;
        float _414 = _274 * _400;
        float _416 = _408 * _222;
        float _418 = _250 + (-0.5);
        float _420 = _296 * _412;
        float _422 = _202 + (-0.5);
        float _424 = _250 + 1.5;
        float _426 = 1.0 / _392;
        float _428 = _346 * 0.16666667163372039794921875;
        float _430 = _414 * 0.16666667163372039794921875;
        float _432 = _364 * 0.16666667163372039794921875;
        float _434 = _420 * 0.16666667163372039794921875;
        float _436 = _396 * _222;
        float _438 = fma(_430, _394, _406);
        float _440 = 1.0 / _390;
        float _442 = fma(_428, _410, _422);
        float _444 = 1.0 / _192;
        float _446 = fma(_432, _426, _418);
        float _448 = 1.0 / _226;
        float _450 = fma(_434, _440, _424);
        float _452 = _442 * _444;
        float _454 = _438 * _444;
        float _456 = _446 * _448;
        float _458 = _450 * _448;
        float2 _1263 = float2(_402, _416);
        float3 _462 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1263, float2(0.0), isnan(_1263)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1263, float2(0.0), isnan(_1263)), level(_136)).xyz;
        float _464 = _462.x;
        float _466 = _462.y;
        float _468 = _462.z;
        float2 _1278 = float2(_404, _416);
        float3 _470 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1278, float2(0.0), isnan(_1278)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1278, float2(0.0), isnan(_1278)), level(_136)).xyz;
        float _472 = _470.x;
        float _474 = _470.y;
        float _476 = _470.z;
        float2 _1293 = float2(_402, _436);
        float3 _478 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1293, float2(0.0), isnan(_1293)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1293, float2(0.0), isnan(_1293)), level(_136)).xyz;
        float _480 = _478.x;
        float _482 = _478.y;
        float _484 = _478.z;
        float2 _1308 = float2(_404, _436);
        float3 _486 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1308, float2(0.0), isnan(_1308)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1308, float2(0.0), isnan(_1308)), level(_136)).xyz;
        float _488 = _486.x;
        float _490 = _486.y;
        float _492 = _486.z;
        float2 _1323 = float2(_452, _456);
        float3 _494 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1323, float2(0.0), isnan(_1323)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1323, float2(0.0), isnan(_1323)), level(_142)).xyz;
        float _496 = _494.x;
        float _498 = _494.y;
        float _500 = _494.z;
        float2 _1338 = float2(_454, _456);
        float3 _502 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1338, float2(0.0), isnan(_1338)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1338, float2(0.0), isnan(_1338)), level(_142)).xyz;
        float _504 = _502.x;
        float _506 = _502.y;
        float _508 = _502.z;
        float2 _1353 = float2(_452, _458);
        float3 _510 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1353, float2(0.0), isnan(_1353)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1353, float2(0.0), isnan(_1353)), level(_142)).xyz;
        float _512 = _510.x;
        float _514 = _510.y;
        float _516 = _510.z;
        float2 _1368 = float2(_454, _458);
        float3 _518 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1368, float2(0.0), isnan(_1368)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1368, float2(0.0), isnan(_1368)), level(_142)).xyz;
        float _520 = _518.x;
        float _522 = _518.y;
        float _524 = _518.z;
        float _526 = -_136;
        float _528 = _130 + _526;
        float _530 = precise::clamp(_528, 0.0, 1.0);
        float _532 = -_472;
        float _534 = _464 + _532;
        float _536 = -_474;
        float _538 = _466 + _536;
        float _540 = -_488;
        float _542 = _480 + _540;
        float _544 = -_492;
        float _546 = _484 + _544;
        float _548 = fma(_286, _534, _472);
        float _550 = -_476;
        float _552 = _468 + _550;
        float _554 = -_490;
        float _556 = _482 + _554;
        float _558 = fma(_286, _538, _474);
        float _560 = fma(_286, _542, _488);
        float _562 = -_504;
        float _564 = _496 + _562;
        float _566 = -_506;
        float _568 = _498 + _566;
        float _570 = -_508;
        float _572 = _500 + _570;
        float _574 = -_520;
        float _576 = _512 + _574;
        float _578 = fma(_384, _564, _504);
        float _580 = fma(_384, _568, _506);
        float _582 = -_522;
        float _584 = _514 + _582;
        float _586 = -_524;
        float _588 = _516 + _586;
        float _590 = fma(_286, _552, _476);
        float _592 = fma(_286, _556, _490);
        float _594 = fma(_286, _546, _492);
        float _596 = fma(_384, _576, _520);
        float _598 = fma(_384, _584, _522);
        float _600 = fma(_384, _572, _508);
        float _602 = fma(_384, _588, _524);
        float _604 = -_560;
        float _606 = _604 + _548;
        float _608 = -_592;
        float _610 = _608 + _558;
        float _612 = -_596;
        float _614 = _612 + _578;
        float _616 = -_598;
        float _618 = _616 + _580;
        float _620 = -_594;
        float _622 = _620 + _590;
        float _624 = -_602;
        float _626 = _624 + _600;
        float _628 = fma(_318, _606, _560);
        float _630 = fma(_318, _610, _592);
        float _632 = fma(_392, _614, _596);
        float _634 = fma(_392, _618, _598);
        float _636 = fma(_318, _622, _594);
        float _638 = fma(_392, _626, _602);
        float _640 = -_628;
        float _642 = _640 + _632;
        float _644 = -_630;
        float _646 = _644 + _634;
        float _648 = 0.0 + _128;
        float _650 = precise::clamp(_648, 0.0, 1.0);
        float _652 = -_636;
        float _654 = _652 + _638;
        float _656 = fma(_530, _642, _628);
        float _658 = fma(_530, _646, _630);
        float _660 = fma(_530, _654, _636);
        float _662 = -_656;
        float _664 = fma(_656, (*spvDescriptorSet0.fp_c3)._m0[13].x, _662);
        float _666 = fma(_96, _650, _100);
        float _668 = -_658;
        float _670 = fma(_658, (*spvDescriptorSet0.fp_c3)._m0[13].y, _668);
        float _672 = -_660;
        float _674 = fma(_660, (*spvDescriptorSet0.fp_c3)._m0[13].z, _672);
        float _676 = fma(_120, _664, _656);
        float _678 = 1.0 / _666;
        float _680 = fma(_120, _670, _658);
        float _682 = fma(_120, _674, _660);
        float _684 = _650 * _676;
        float _686 = _650 * _680;
        float _688 = _650 * _682;
        float _690 = -_684;
        float _692 = _690 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
        float _694 = -_686;
        float _696 = _694 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
        float _698 = -_688;
        float _700 = _698 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
        float _702 = fma(_100, _692, _684);
        float _704 = fma(_100, _696, _686);
        float _706 = fma(_100, _700, _688);
        float _708 = _702 * _678;
        float _710 = _704 * _678;
        float _712 = _706 * _678;
        out.m_34.x = _708;
        out.m_34.y = _710;
        out.m_34.z = _712;
        out.m_34.w = _666;
        return out;
    }
    out.m_34.x = (*spvDescriptorSet0.fp_c3)._m0[12].x;
    out.m_34.y = (*spvDescriptorSet0.fp_c3)._m0[12].y;
    out.m_34.z = (*spvDescriptorSet0.fp_c3)._m0[12].z;
    out.m_34.w = _100;
    return out;
}

