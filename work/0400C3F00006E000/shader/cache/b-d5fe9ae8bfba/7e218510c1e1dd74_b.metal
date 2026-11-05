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
int _42(thread const int& _1757, thread const int& _1758, constant _10& support_buffer)
{
    int _1761 = 1 + _1758;
    float _1763 = support_buffer._m5[_1761].x;
    float _1765 = abs(_1763);
    bool _1767 = _1765 == 1.0;
    if (_1767)
    {
        return _1757;
    }
    float _1769 = float(_1757);
    float _1771 = _1769 / _1765;
    int _1773 = int(_1771);
    return _1773;
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
    float2 _772 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_772, float2(0.0), isnan(_772))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_772, float2(0.0), isnan(_772))).x;
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
    float _94 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _96 = precise::clamp(_94, 0.0, 1.0);
    float _98 = _60 * _76;
    float _100 = _60 * _88;
    float _102 = precise::max(_92, _98);
    bool _104 = _102 != 0.0;
    bool _106 = isnan(_102);
    bool _108 = _104 || _106;
    bool _110 = isnan(0.0);
    bool _112 = _108 || _110;
    float _114 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _116 = precise::clamp(_114, 0.0, 1.0);
    float _118 = _60 * _82;
    float _120 = precise::min(_116, _96);
    bool _122 = !_112;
    if (!_122)
    {
        float _124 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _126 = fma(_102, _124, 1.0);
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
        float _204 = _190 + (-0.5);
        float _206 = -_200;
        float _208 = _206 + 1.0;
        float _210 = -_200;
        float _212 = _210 + 2.0;
        float _214 = _208 * _208;
        float _216 = -_196;
        float _218 = _188 + _216;
        float _220 = 1.0 / _182;
        float _222 = _208 * _214;
        float _224 = float(_178);
        float _226 = _212 * _212;
        float _228 = -_218;
        float _230 = _228 + 1.0;
        float _232 = _222 * 4.0;
        float _234 = -_218;
        float _236 = _234 + 2.0;
        float _238 = fma(_64, _224, -0.5);
        float _240 = -_222;
        float _242 = _240 + 6.0;
        float _244 = -_232;
        float _246 = fma(_212, _226, _244);
        float _248 = _230 * _230;
        float _250 = floor(_238);
        float _252 = _236 * _236;
        float _254 = -_246;
        float _256 = _254 + _242;
        float _258 = _230 * _248;
        float _260 = -_202;
        float _262 = _194 + _260;
        float _264 = _190 + 1.5;
        float _266 = _256 * 0.16666667163372039794921875;
        float _268 = _258 * 4.0;
        float _270 = _200 * _200;
        float _272 = -_262;
        float _274 = _272 + 1.0;
        float _276 = _218 * _218;
        float _278 = -_268;
        float _280 = fma(_236, _252, _278);
        float _282 = 1.0 / _266;
        float _284 = -_258;
        float _286 = _284 + 6.0;
        float _288 = _200 * _270;
        float _290 = _274 * _274;
        float _292 = -_250;
        float _294 = _238 + _292;
        float _296 = -_280;
        float _298 = _296 + _286;
        float _300 = _288 * 0.16666667163372039794921875;
        float _302 = _274 * _290;
        float _304 = -_294;
        float _306 = _304 + 1.0;
        float _308 = _298 * 0.16666667163372039794921875;
        float _310 = -_262;
        float _312 = _310 + 2.0;
        float _314 = 1.0 / _192;
        float _316 = _218 * _276;
        float _318 = fma(_300, _282, _264);
        float _320 = _306 * _306;
        float _322 = _222 + _246;
        float _324 = _312 * _312;
        float _326 = _302 * 4.0;
        float _328 = _306 * _320;
        float _330 = -_294;
        float _332 = _330 + 2.0;
        float _334 = _322 * 0.16666667163372039794921875;
        float _336 = -_326;
        float _338 = fma(_312, _324, _336);
        float _340 = _258 + _280;
        float _342 = _332 * _332;
        float _344 = _328 * 4.0;
        float _346 = 1.0 / _334;
        float _348 = -_302;
        float _350 = _348 + 6.0;
        float _352 = _340 * 0.16666667163372039794921875;
        float _354 = -_344;
        float _356 = fma(_332, _342, _354);
        float _358 = -_328;
        float _360 = _358 + 6.0;
        float _362 = -_338;
        float _364 = _362 + _350;
        float _366 = _302 + _338;
        float _368 = _246 * 0.16666667163372039794921875;
        float _370 = 1.0 / _308;
        float _372 = -_356;
        float _374 = _372 + _360;
        float _376 = _366 * 0.16666667163372039794921875;
        float _378 = _328 + _356;
        float _380 = _316 * 0.16666667163372039794921875;
        float _382 = _374 * 0.16666667163372039794921875;
        float _384 = _196 + (-0.5);
        float _386 = _280 * 0.16666667163372039794921875;
        float _388 = 1.0 / _352;
        float _390 = fma(_368, _346, _204);
        float _392 = _196 + 1.5;
        float _394 = _378 * 0.16666667163372039794921875;
        float _396 = _364 * 0.16666667163372039794921875;
        float _398 = _338 * 0.16666667163372039794921875;
        float _400 = _390 * _184;
        float _402 = _318 * _184;
        float _404 = 1.0 / _376;
        float _406 = fma(_380, _370, _392);
        float _408 = _294 * _294;
        float _410 = _294 * _408;
        float _412 = _202 + (-0.5);
        float _414 = 1.0 / _382;
        float _416 = fma(_386, _388, _384);
        float _418 = _262 * _262;
        float _420 = _250 + 1.5;
        float _422 = _416 * _220;
        float _424 = _262 * _418;
        float _426 = _202 + 1.5;
        float _428 = 1.0 / _224;
        float _430 = _410 * 0.16666667163372039794921875;
        float _432 = fma(_398, _404, _412);
        float _434 = _250 + (-0.5);
        float _436 = _356 * 0.16666667163372039794921875;
        float _438 = _406 * _220;
        float _440 = _424 * 0.16666667163372039794921875;
        float _442 = 1.0 / _394;
        float _444 = fma(_430, _414, _420);
        float _446 = _432 * _314;
        float _448 = 1.0 / _396;
        float _450 = _444 * _428;
        float _452 = fma(_436, _442, _434);
        float _454 = _452 * _428;
        float2 _1282 = float2(_400, _422);
        float3 _458 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1282, float2(0.0), isnan(_1282)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1282, float2(0.0), isnan(_1282)), level(_136)).xyz;
        float _460 = _458.x;
        float _462 = _458.y;
        float _464 = _458.z;
        float2 _1297 = float2(_402, _422);
        float3 _466 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1297, float2(0.0), isnan(_1297)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1297, float2(0.0), isnan(_1297)), level(_136)).xyz;
        float _468 = _466.x;
        float _470 = _466.y;
        float _472 = _466.z;
        float2 _1312 = float2(_400, _438);
        float3 _474 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1312, float2(0.0), isnan(_1312)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1312, float2(0.0), isnan(_1312)), level(_136)).xyz;
        float _476 = _474.x;
        float _478 = _474.y;
        float _480 = _474.z;
        float _482 = fma(_440, _448, _426);
        float2 _1331 = float2(_402, _438);
        float3 _484 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1331, float2(0.0), isnan(_1331)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1331, float2(0.0), isnan(_1331)), level(_136)).xyz;
        float _486 = _484.x;
        float _488 = _484.y;
        float _490 = _484.z;
        float _492 = _482 * _314;
        float2 _1349 = float2(_446, _454);
        float3 _494 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1349, float2(0.0), isnan(_1349)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1349, float2(0.0), isnan(_1349)), level(_142)).xyz;
        float _496 = _494.x;
        float _498 = _494.y;
        float _500 = _494.z;
        float2 _1364 = float2(_492, _454);
        float3 _502 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1364, float2(0.0), isnan(_1364)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1364, float2(0.0), isnan(_1364)), level(_142)).xyz;
        float _504 = _502.x;
        float _506 = _502.y;
        float _508 = _502.z;
        float2 _1379 = float2(_446, _450);
        float3 _510 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1379, float2(0.0), isnan(_1379)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1379, float2(0.0), isnan(_1379)), level(_142)).xyz;
        float _512 = _510.x;
        float _514 = _510.y;
        float _516 = _510.z;
        float2 _1394 = float2(_492, _450);
        float3 _518 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1394, float2(0.0), isnan(_1394)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1394, float2(0.0), isnan(_1394)), level(_142)).xyz;
        float _520 = _518.x;
        float _522 = _518.y;
        float _524 = _518.z;
        float _526 = -_136;
        float _528 = _130 + _526;
        float _530 = precise::clamp(_528, 0.0, 1.0);
        float _532 = -_470;
        float _534 = _462 + _532;
        float _536 = -_468;
        float _538 = _460 + _536;
        float _540 = -_486;
        float _542 = _476 + _540;
        float _544 = fma(_334, _534, _470);
        float _546 = fma(_334, _538, _468);
        float _548 = -_472;
        float _550 = _464 + _548;
        float _552 = fma(_334, _542, _486);
        float _554 = -_488;
        float _556 = _478 + _554;
        float _558 = -_490;
        float _560 = _480 + _558;
        float _562 = fma(_334, _550, _472);
        float _564 = -_552;
        float _566 = _564 + _546;
        float _568 = fma(_334, _556, _488);
        float _570 = -_506;
        float _572 = _498 + _570;
        float _574 = -_504;
        float _576 = _496 + _574;
        float _578 = fma(_352, _566, _552);
        float _580 = -_522;
        float _582 = _514 + _580;
        float _584 = fma(_376, _572, _506);
        float _586 = -_520;
        float _588 = _512 + _586;
        float _590 = -_568;
        float _592 = _590 + _544;
        float _594 = fma(_376, _582, _522);
        float _596 = fma(_376, _576, _504);
        float _598 = -_508;
        float _600 = _500 + _598;
        float _602 = -_524;
        float _604 = _516 + _602;
        float _606 = fma(_376, _588, _520);
        float _608 = -_594;
        float _610 = _608 + _584;
        float _612 = fma(_334, _560, _490);
        float _614 = fma(_352, _592, _568);
        float _616 = fma(_376, _600, _508);
        float _618 = fma(_376, _604, _524);
        float _620 = -_606;
        float _622 = _620 + _596;
        float _624 = fma(_394, _610, _594);
        float _626 = -_612;
        float _628 = _626 + _562;
        float _630 = -_618;
        float _632 = _630 + _616;
        float _634 = fma(_394, _622, _606);
        float _636 = -_614;
        float _638 = _636 + _624;
        float _640 = fma(_352, _628, _612);
        float _642 = fma(_394, _632, _618);
        float _644 = -_578;
        float _646 = _644 + _634;
        float _648 = fma(_530, _638, _614);
        float _650 = _120 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _652 = -_640;
        float _654 = _652 + _642;
        float _656 = fma(_530, _646, _578);
        float _658 = _648 * 0.586600005626678466796875;
        float _660 = fma(_530, _654, _640);
        float _662 = fma(_656, 0.29890000820159912109375, _658);
        float _664 = fma(_660, 0.1143999993801116943359375, _662);
        float _666 = -_656;
        float _668 = _666 + _664;
        float _670 = -_648;
        float _672 = _670 + _664;
        float _674 = -_660;
        float _676 = _674 + _664;
        float _678 = fma(_650, _668, _656);
        float _680 = 0.0 + _128;
        float _682 = precise::clamp(_680, 0.0, 1.0);
        float _684 = fma(_650, _672, _648);
        float _686 = fma(_650, _676, _660);
        float _688 = -_678;
        float _690 = fma(_678, (*spvDescriptorSet0.fp_c3)._m0[13].x, _688);
        float _692 = fma(_100, _682, _118);
        float _694 = -_684;
        float _696 = fma(_684, (*spvDescriptorSet0.fp_c3)._m0[13].y, _694);
        float _698 = -_686;
        float _700 = fma(_686, (*spvDescriptorSet0.fp_c3)._m0[13].z, _698);
        float _702 = fma(_120, _690, _678);
        float _704 = 1.0 / _692;
        float _706 = fma(_120, _696, _684);
        float _708 = fma(_120, _700, _686);
        float _710 = _682 * _702;
        float _712 = _682 * _706;
        float _714 = _682 * _708;
        float _716 = -_710;
        float _718 = _716 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
        float _720 = -_712;
        float _722 = _720 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
        float _724 = -_714;
        float _726 = _724 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
        float _728 = fma(_118, _718, _710);
        float _730 = fma(_118, _722, _712);
        float _732 = fma(_118, _726, _714);
        float _734 = _728 * _704;
        float _736 = _730 * _704;
        float _738 = _732 * _704;
        out.m_34.x = _734;
        out.m_34.y = _736;
        out.m_34.z = _738;
        out.m_34.w = _692;
        return out;
    }
    out.m_34.x = (*spvDescriptorSet0.fp_c3)._m0[12].x;
    out.m_34.y = (*spvDescriptorSet0.fp_c3)._m0[12].y;
    out.m_34.z = (*spvDescriptorSet0.fp_c3)._m0[12].z;
    out.m_34.w = _118;
    return out;
}

