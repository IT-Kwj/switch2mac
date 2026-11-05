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
int _42(thread const int& _1791, thread const int& _1792, constant _10& support_buffer)
{
    int _1795 = 1 + _1792;
    float _1797 = support_buffer._m5[_1795].x;
    float _1799 = abs(_1797);
    bool _1801 = _1799 == 1.0;
    if (_1801)
    {
        return _1791;
    }
    float _1803 = float(_1791);
    float _1805 = _1803 / _1799;
    int _1807 = int(_1805);
    return _1807;
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
    float2 _784 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_784, float2(0.0), isnan(_784))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_784, float2(0.0), isnan(_784))).x;
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
    float _100 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _102 = precise::clamp(_100, 0.0, 1.0);
    float _104 = precise::max(_98, _102);
    float _106 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _108 = precise::clamp(_106, 0.0, 1.0);
    float _110 = _60 * _82;
    float _112 = _60 * _94;
    float _114 = precise::max(_104, _110);
    bool _116 = _114 != 0.0;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan(0.0);
    bool _124 = _120 || _122;
    float _126 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _128 = precise::clamp(_126, 0.0, 1.0);
    float _130 = _60 * _88;
    float _132 = precise::min(_128, _108);
    bool _134 = !_124;
    if (!_134)
    {
        float _136 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _138 = fma(_114, _136, 1.0);
        float _140 = log2(_138);
        float _142 = _140 + (-1.0);
        float _144 = trunc(_142);
        int _146 = int(_144);
        float _148 = float(_146);
        float _150 = trunc(_148);
        int _152 = int(_150);
        float _154 = _148 + 1.0;
        float _156 = trunc(_154);
        int _158 = int(_156);
        int _160 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_152), spvDescriptorSet0.fp_t_tcb_A.get_height(_152)).x;
        int _162 = _160;
        int _164 = 1;
        int _166 = _42(_162, _164, (*spvDescriptorSet0.support_buffer));
        int _168 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_152), spvDescriptorSet0.fp_t_tcb_A.get_height(_152)).y;
        int _170 = _168;
        int _172 = 1;
        int _174 = _42(_170, _172, (*spvDescriptorSet0.support_buffer));
        int _176 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_158), spvDescriptorSet0.fp_t_tcb_A.get_height(_158)).x;
        int _178 = _176;
        int _180 = 1;
        int _182 = _42(_178, _180, (*spvDescriptorSet0.support_buffer));
        int _184 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_158), spvDescriptorSet0.fp_t_tcb_A.get_height(_158)).y;
        int _186 = _184;
        int _188 = 1;
        int _190 = _42(_186, _188, (*spvDescriptorSet0.support_buffer));
        float _192 = float(_166);
        float _194 = float(_174);
        float _196 = 1.0 / _192;
        float _198 = fma(_62, _192, -0.5);
        float _200 = fma(_64, _194, -0.5);
        float _202 = floor(_198);
        float _204 = float(_182);
        float _206 = fma(_62, _204, -0.5);
        float _208 = floor(_200);
        float _210 = -_202;
        float _212 = _198 + _210;
        float _214 = floor(_206);
        float _216 = _202 + (-0.5);
        float _218 = -_212;
        float _220 = _218 + 1.0;
        float _222 = -_212;
        float _224 = _222 + 2.0;
        float _226 = _220 * _220;
        float _228 = -_208;
        float _230 = _200 + _228;
        float _232 = 1.0 / _194;
        float _234 = _220 * _226;
        float _236 = float(_190);
        float _238 = _224 * _224;
        float _240 = -_230;
        float _242 = _240 + 1.0;
        float _244 = _234 * 4.0;
        float _246 = -_230;
        float _248 = _246 + 2.0;
        float _250 = fma(_64, _236, -0.5);
        float _252 = -_234;
        float _254 = _252 + 6.0;
        float _256 = -_244;
        float _258 = fma(_224, _238, _256);
        float _260 = _242 * _242;
        float _262 = floor(_250);
        float _264 = _248 * _248;
        float _266 = -_258;
        float _268 = _266 + _254;
        float _270 = _242 * _260;
        float _272 = -_214;
        float _274 = _206 + _272;
        float _276 = _202 + 1.5;
        float _278 = _268 * 0.16666667163372039794921875;
        float _280 = _270 * 4.0;
        float _282 = _212 * _212;
        float _284 = -_274;
        float _286 = _284 + 1.0;
        float _288 = _230 * _230;
        float _290 = -_280;
        float _292 = fma(_248, _264, _290);
        float _294 = 1.0 / _278;
        float _296 = -_270;
        float _298 = _296 + 6.0;
        float _300 = _212 * _282;
        float _302 = _286 * _286;
        float _304 = -_262;
        float _306 = _250 + _304;
        float _308 = -_292;
        float _310 = _308 + _298;
        float _312 = _300 * 0.16666667163372039794921875;
        float _314 = _286 * _302;
        float _316 = -_306;
        float _318 = _316 + 1.0;
        float _320 = _310 * 0.16666667163372039794921875;
        float _322 = -_274;
        float _324 = _322 + 2.0;
        float _326 = 1.0 / _204;
        float _328 = _230 * _288;
        float _330 = fma(_312, _294, _276);
        float _332 = _318 * _318;
        float _334 = _234 + _258;
        float _336 = _324 * _324;
        float _338 = _314 * 4.0;
        float _340 = _318 * _332;
        float _342 = -_306;
        float _344 = _342 + 2.0;
        float _346 = _334 * 0.16666667163372039794921875;
        float _348 = -_338;
        float _350 = fma(_324, _336, _348);
        float _352 = _270 + _292;
        float _354 = _344 * _344;
        float _356 = _340 * 4.0;
        float _358 = 1.0 / _346;
        float _360 = -_314;
        float _362 = _360 + 6.0;
        float _364 = _352 * 0.16666667163372039794921875;
        float _366 = -_356;
        float _368 = fma(_344, _354, _366);
        float _370 = -_340;
        float _372 = _370 + 6.0;
        float _374 = -_350;
        float _376 = _374 + _362;
        float _378 = _314 + _350;
        float _380 = _258 * 0.16666667163372039794921875;
        float _382 = 1.0 / _320;
        float _384 = -_368;
        float _386 = _384 + _372;
        float _388 = _378 * 0.16666667163372039794921875;
        float _390 = _340 + _368;
        float _392 = _328 * 0.16666667163372039794921875;
        float _394 = _386 * 0.16666667163372039794921875;
        float _396 = _208 + (-0.5);
        float _398 = _292 * 0.16666667163372039794921875;
        float _400 = 1.0 / _364;
        float _402 = fma(_380, _358, _216);
        float _404 = _208 + 1.5;
        float _406 = _390 * 0.16666667163372039794921875;
        float _408 = _376 * 0.16666667163372039794921875;
        float _410 = _350 * 0.16666667163372039794921875;
        float _412 = _402 * _196;
        float _414 = _330 * _196;
        float _416 = 1.0 / _388;
        float _418 = fma(_392, _382, _404);
        float _420 = _306 * _306;
        float _422 = _306 * _420;
        float _424 = _214 + (-0.5);
        float _426 = 1.0 / _394;
        float _428 = fma(_398, _400, _396);
        float _430 = _274 * _274;
        float _432 = _262 + 1.5;
        float _434 = _428 * _232;
        float _436 = _274 * _430;
        float _438 = _214 + 1.5;
        float _440 = 1.0 / _236;
        float _442 = _422 * 0.16666667163372039794921875;
        float _444 = fma(_410, _416, _424);
        float _446 = _262 + (-0.5);
        float _448 = _368 * 0.16666667163372039794921875;
        float _450 = _418 * _232;
        float _452 = _436 * 0.16666667163372039794921875;
        float _454 = 1.0 / _406;
        float _456 = fma(_442, _426, _432);
        float _458 = _444 * _326;
        float _460 = 1.0 / _408;
        float _462 = _456 * _440;
        float _464 = fma(_448, _454, _446);
        float _466 = _464 * _440;
        float2 _1316 = float2(_412, _434);
        float3 _470 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1316, float2(0.0), isnan(_1316)), level(_148)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1316, float2(0.0), isnan(_1316)), level(_148)).xyz;
        float _472 = _470.x;
        float _474 = _470.y;
        float _476 = _470.z;
        float2 _1331 = float2(_414, _434);
        float3 _478 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1331, float2(0.0), isnan(_1331)), level(_148)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1331, float2(0.0), isnan(_1331)), level(_148)).xyz;
        float _480 = _478.x;
        float _482 = _478.y;
        float _484 = _478.z;
        float2 _1346 = float2(_412, _450);
        float3 _486 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1346, float2(0.0), isnan(_1346)), level(_148)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1346, float2(0.0), isnan(_1346)), level(_148)).xyz;
        float _488 = _486.x;
        float _490 = _486.y;
        float _492 = _486.z;
        float _494 = fma(_452, _460, _438);
        float2 _1365 = float2(_414, _450);
        float3 _496 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1365, float2(0.0), isnan(_1365)), level(_148)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1365, float2(0.0), isnan(_1365)), level(_148)).xyz;
        float _498 = _496.x;
        float _500 = _496.y;
        float _502 = _496.z;
        float _504 = _494 * _326;
        float2 _1383 = float2(_458, _466);
        float3 _506 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1383, float2(0.0), isnan(_1383)), level(_154)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1383, float2(0.0), isnan(_1383)), level(_154)).xyz;
        float _508 = _506.x;
        float _510 = _506.y;
        float _512 = _506.z;
        float2 _1398 = float2(_504, _466);
        float3 _514 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1398, float2(0.0), isnan(_1398)), level(_154)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1398, float2(0.0), isnan(_1398)), level(_154)).xyz;
        float _516 = _514.x;
        float _518 = _514.y;
        float _520 = _514.z;
        float2 _1413 = float2(_458, _462);
        float3 _522 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1413, float2(0.0), isnan(_1413)), level(_154)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1413, float2(0.0), isnan(_1413)), level(_154)).xyz;
        float _524 = _522.x;
        float _526 = _522.y;
        float _528 = _522.z;
        float2 _1428 = float2(_504, _462);
        float3 _530 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1428, float2(0.0), isnan(_1428)), level(_154)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1428, float2(0.0), isnan(_1428)), level(_154)).xyz;
        float _532 = _530.x;
        float _534 = _530.y;
        float _536 = _530.z;
        float _538 = -_148;
        float _540 = _142 + _538;
        float _542 = precise::clamp(_540, 0.0, 1.0);
        float _544 = -_482;
        float _546 = _474 + _544;
        float _548 = -_480;
        float _550 = _472 + _548;
        float _552 = -_498;
        float _554 = _488 + _552;
        float _556 = fma(_346, _546, _482);
        float _558 = fma(_346, _550, _480);
        float _560 = -_484;
        float _562 = _476 + _560;
        float _564 = fma(_346, _554, _498);
        float _566 = -_500;
        float _568 = _490 + _566;
        float _570 = -_502;
        float _572 = _492 + _570;
        float _574 = fma(_346, _562, _484);
        float _576 = -_564;
        float _578 = _576 + _558;
        float _580 = fma(_346, _568, _500);
        float _582 = -_518;
        float _584 = _510 + _582;
        float _586 = -_516;
        float _588 = _508 + _586;
        float _590 = fma(_364, _578, _564);
        float _592 = -_534;
        float _594 = _526 + _592;
        float _596 = fma(_388, _584, _518);
        float _598 = -_532;
        float _600 = _524 + _598;
        float _602 = -_580;
        float _604 = _602 + _556;
        float _606 = fma(_388, _594, _534);
        float _608 = fma(_388, _588, _516);
        float _610 = -_520;
        float _612 = _512 + _610;
        float _614 = -_536;
        float _616 = _528 + _614;
        float _618 = fma(_388, _600, _532);
        float _620 = -_606;
        float _622 = _620 + _596;
        float _624 = fma(_346, _572, _502);
        float _626 = fma(_364, _604, _580);
        float _628 = fma(_388, _612, _520);
        float _630 = fma(_388, _616, _536);
        float _632 = -_618;
        float _634 = _632 + _608;
        float _636 = fma(_406, _622, _606);
        float _638 = -_624;
        float _640 = _638 + _574;
        float _642 = -_630;
        float _644 = _642 + _628;
        float _646 = fma(_406, _634, _618);
        float _648 = -_626;
        float _650 = _648 + _636;
        float _652 = fma(_364, _640, _624);
        float _654 = fma(_406, _644, _630);
        float _656 = -_590;
        float _658 = _656 + _646;
        float _660 = fma(_542, _650, _626);
        float _662 = _132 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _664 = -_652;
        float _666 = _664 + _654;
        float _668 = fma(_542, _658, _590);
        float _670 = _660 * 0.586600005626678466796875;
        float _672 = fma(_542, _666, _652);
        float _674 = fma(_668, 0.29890000820159912109375, _670);
        float _676 = fma(_672, 0.1143999993801116943359375, _674);
        float _678 = -_668;
        float _680 = _678 + _676;
        float _682 = -_660;
        float _684 = _682 + _676;
        float _686 = -_672;
        float _688 = _686 + _676;
        float _690 = fma(_662, _680, _668);
        float _692 = 0.0 + _140;
        float _694 = precise::clamp(_692, 0.0, 1.0);
        float _696 = fma(_662, _684, _660);
        float _698 = fma(_662, _688, _672);
        float _700 = -_690;
        float _702 = fma(_690, (*spvDescriptorSet0.fp_c3)._m0[13].x, _700);
        float _704 = fma(_112, _694, _130);
        float _706 = -_696;
        float _708 = fma(_696, (*spvDescriptorSet0.fp_c3)._m0[13].y, _706);
        float _710 = -_698;
        float _712 = fma(_698, (*spvDescriptorSet0.fp_c3)._m0[13].z, _710);
        float _714 = fma(_132, _702, _690);
        float _716 = 1.0 / _704;
        float _718 = fma(_132, _708, _696);
        float _720 = fma(_132, _712, _698);
        float _722 = _694 * _714;
        float _724 = _694 * _718;
        float _726 = _694 * _720;
        float _728 = -_722;
        float _730 = _728 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
        float _732 = -_724;
        float _734 = _732 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
        float _736 = -_726;
        float _738 = _736 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
        float _740 = fma(_130, _730, _722);
        float _742 = fma(_130, _734, _724);
        float _744 = fma(_130, _738, _726);
        float _746 = _740 * _716;
        float _748 = _742 * _716;
        float _750 = _744 * _716;
        out.m_34.x = _746;
        out.m_34.y = _748;
        out.m_34.z = _750;
        out.m_34.w = _704;
        return out;
    }
    out.m_34.x = (*spvDescriptorSet0.fp_c3)._m0[12].x;
    out.m_34.y = (*spvDescriptorSet0.fp_c3)._m0[12].y;
    out.m_34.z = (*spvDescriptorSet0.fp_c3)._m0[12].z;
    out.m_34.w = _130;
    return out;
}

