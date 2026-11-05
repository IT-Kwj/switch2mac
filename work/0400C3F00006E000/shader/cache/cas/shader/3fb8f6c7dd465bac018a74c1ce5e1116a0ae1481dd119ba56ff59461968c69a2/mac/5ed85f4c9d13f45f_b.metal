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
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
};

static inline __attribute__((always_inline))
int _42(thread const int& _1664, thread const int& _1665, constant _10& support_buffer)
{
    int _1668 = 1 + _1665;
    float _1670 = support_buffer._m5[_1668].x;
    float _1672 = abs(_1670);
    bool _1674 = _1672 == 1.0;
    if (_1674)
    {
        return _1664;
    }
    float _1676 = float(_1664);
    float _1678 = _1676 / _1672;
    int _1680 = int(_1678);
    return _1680;
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
    float2 _744 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_744, float2(0.0), isnan(_744))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_744, float2(0.0), isnan(_744))).x;
    float _68 = in.m_33.x;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_33.y;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_33.z;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = _60 * _72;
    float _88 = _60 * _78;
    float _90 = _60 * _84;
    float _92 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _94 = precise::clamp(_92, 0.0, 1.0);
    float _96 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _98 = precise::clamp(_96, 0.0, 1.0);
    float _100 = precise::max(_94, _98);
    float _102 = precise::max(_100, _90);
    float _104 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _106 = precise::clamp(_104, 0.0, 1.0);
    bool _110 = _102 != 0.0;
    bool _112 = isnan(_102);
    bool _114 = _110 || _112;
    bool _116 = isnan(0.0);
    bool _118 = _114 || _116;
    float _120 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _122 = precise::clamp(_120, 0.0, 1.0);
    float _124 = precise::min(_106, _122);
    bool _126 = !_118;
    if (!_126)
    {
        float _128 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _130 = fma(_102, _128, 1.0);
        float _132 = log2(_130);
        float _134 = _132 + (-1.0);
        float _136 = trunc(_134);
        int _138 = int(_136);
        float _140 = float(_138);
        float _142 = trunc(_140);
        int _144 = int(_142);
        float _146 = _140 + 1.0;
        float _148 = trunc(_146);
        int _150 = int(_148);
        int _152 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_144), spvDescriptorSet0.fp_t_tcb_A.get_height(_144)).x;
        int _154 = _152;
        int _156 = 1;
        int _158 = _42(_154, _156, (*spvDescriptorSet0.support_buffer));
        int _160 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_144), spvDescriptorSet0.fp_t_tcb_A.get_height(_144)).y;
        int _162 = _160;
        int _164 = 1;
        int _166 = _42(_162, _164, (*spvDescriptorSet0.support_buffer));
        int _168 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_150), spvDescriptorSet0.fp_t_tcb_A.get_height(_150)).x;
        int _170 = _168;
        int _172 = 1;
        int _174 = _42(_170, _172, (*spvDescriptorSet0.support_buffer));
        int _176 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_150), spvDescriptorSet0.fp_t_tcb_A.get_height(_150)).y;
        int _178 = _176;
        int _180 = 1;
        int _182 = _42(_178, _180, (*spvDescriptorSet0.support_buffer));
        float _184 = float(_158);
        float _186 = float(_166);
        float _188 = 1.0 / _184;
        float _190 = fma(_62, _184, -0.5);
        float _192 = fma(_64, _186, -0.5);
        float _194 = floor(_190);
        float _196 = float(_174);
        float _198 = fma(_62, _196, -0.5);
        float _200 = floor(_192);
        float _202 = -_194;
        float _204 = _190 + _202;
        float _206 = float(_182);
        float _208 = floor(_198);
        float _210 = _194 + 1.5;
        float _212 = -_204;
        float _214 = _212 + 1.0;
        float _216 = -_204;
        float _218 = _216 + 2.0;
        float _220 = _194 + (-0.5);
        float _222 = _214 * _214;
        float _224 = _218 * _218;
        float _226 = -_200;
        float _228 = _192 + _226;
        float _230 = 1.0 / _186;
        float _232 = _214 * _222;
        float _234 = fma(_64, _206, -0.5);
        float _236 = -_228;
        float _238 = _236 + 1.0;
        float _240 = _228 * _228;
        float _242 = _232 * 4.0;
        float _244 = -_232;
        float _246 = _244 + 6.0;
        float _248 = _238 * _238;
        float _250 = 1.0 / _206;
        float _252 = -_242;
        float _254 = fma(_218, _224, _252);
        float _256 = -_228;
        float _258 = _256 + 2.0;
        float _260 = _238 * _248;
        float _262 = -_208;
        float _264 = _198 + _262;
        float _266 = -_254;
        float _268 = _266 + _246;
        float _270 = _258 * _258;
        float _272 = _260 * 4.0;
        float _274 = floor(_234);
        float _276 = _268 * 0.16666667163372039794921875;
        float _278 = _204 * _204;
        float _280 = -_264;
        float _282 = _280 + 1.0;
        float _284 = -_272;
        float _286 = fma(_258, _270, _284);
        float _288 = -_260;
        float _290 = _288 + 6.0;
        float _292 = _204 * _278;
        float _294 = _282 * _282;
        float _296 = 1.0 / _276;
        float _298 = _228 * _240;
        float _300 = _292 * 0.16666667163372039794921875;
        float _302 = _282 * _294;
        float _304 = _298 * 0.16666667163372039794921875;
        float _306 = _302 * 4.0;
        float _308 = -_274;
        float _310 = _234 + _308;
        float _312 = 1.0 / _196;
        float _314 = -_286;
        float _316 = _314 + _290;
        float _318 = -_310;
        float _320 = _318 + 1.0;
        float _322 = -_310;
        float _324 = _322 + 2.0;
        float _326 = _316 * 0.16666667163372039794921875;
        float _328 = fma(_300, _296, _210);
        float _330 = _320 * _320;
        float _332 = -_264;
        float _334 = _332 + 2.0;
        float _336 = _232 + _254;
        float _338 = _260 + _286;
        float _340 = _320 * _330;
        float _342 = _334 * _334;
        float _344 = _336 * 0.16666667163372039794921875;
        float _346 = 1.0 / _326;
        float _348 = _340 * 4.0;
        float _350 = -_306;
        float _352 = fma(_334, _342, _350);
        float _354 = _324 * _324;
        float _356 = -_302;
        float _358 = _356 + 6.0;
        float _360 = _338 * 0.16666667163372039794921875;
        float _362 = _302 + _352;
        float _364 = _254 * 0.16666667163372039794921875;
        float _366 = 1.0 / _344;
        float _368 = -_348;
        float _370 = fma(_324, _354, _368);
        float _372 = -_340;
        float _374 = _372 + 6.0;
        float _376 = -_352;
        float _378 = _376 + _358;
        float _380 = _362 * 0.16666667163372039794921875;
        float _382 = _340 + _370;
        float _384 = -_370;
        float _386 = _384 + _374;
        float _388 = _200 + (-0.5);
        float _390 = 1.0 / _360;
        float _392 = _286 * 0.16666667163372039794921875;
        float _394 = _386 * 0.16666667163372039794921875;
        float _396 = _378 * 0.16666667163372039794921875;
        float _398 = _352 * 0.16666667163372039794921875;
        float _400 = fma(_364, _366, _220);
        float _402 = _200 + 1.5;
        float _404 = 1.0 / _380;
        float _406 = _382 * 0.16666667163372039794921875;
        float _408 = _400 * _188;
        float _410 = fma(_304, _346, _402);
        float _412 = _310 * _310;
        float _414 = _328 * _188;
        float _416 = fma(_392, _390, _388);
        float _418 = _264 * _264;
        float _420 = 1.0 / _394;
        float _422 = _310 * _412;
        float _424 = _208 + (-0.5);
        float _426 = _264 * _418;
        float _428 = _208 + 1.5;
        float _430 = _274 + 1.5;
        float _432 = _422 * 0.16666667163372039794921875;
        float _434 = _416 * _230;
        float _436 = 1.0 / _406;
        float _438 = fma(_398, _404, _424);
        float _440 = _274 + (-0.5);
        float _442 = _370 * 0.16666667163372039794921875;
        float _444 = _410 * _230;
        float _446 = _426 * 0.16666667163372039794921875;
        float _448 = 1.0 / _396;
        float _450 = fma(_432, _420, _430);
        float _452 = _438 * _312;
        float _454 = _450 * _250;
        float _456 = fma(_442, _436, _440);
        float _458 = _456 * _250;
        float2 _1250 = float2(_408, _434);
        float3 _462 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1250, float2(0.0), isnan(_1250)), level(_140)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1250, float2(0.0), isnan(_1250)), level(_140)).xyz;
        float _464 = _462.x;
        float _466 = _462.y;
        float _468 = _462.z;
        float2 _1265 = float2(_414, _434);
        float3 _470 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1265, float2(0.0), isnan(_1265)), level(_140)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1265, float2(0.0), isnan(_1265)), level(_140)).xyz;
        float _472 = _470.x;
        float _474 = _470.y;
        float _476 = _470.z;
        float2 _1280 = float2(_408, _444);
        float3 _478 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1280, float2(0.0), isnan(_1280)), level(_140)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1280, float2(0.0), isnan(_1280)), level(_140)).xyz;
        float _480 = _478.x;
        float _482 = _478.y;
        float _484 = _478.z;
        float _486 = fma(_446, _448, _428);
        float2 _1299 = float2(_414, _444);
        float3 _488 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1299, float2(0.0), isnan(_1299)), level(_140)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1299, float2(0.0), isnan(_1299)), level(_140)).xyz;
        float _490 = _488.x;
        float _492 = _488.y;
        float _494 = _488.z;
        float _496 = _486 * _312;
        float2 _1317 = float2(_452, _458);
        float3 _498 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1317, float2(0.0), isnan(_1317)), level(_146)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1317, float2(0.0), isnan(_1317)), level(_146)).xyz;
        float _500 = _498.x;
        float _502 = _498.y;
        float _504 = _498.z;
        float2 _1332 = float2(_496, _458);
        float3 _506 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1332, float2(0.0), isnan(_1332)), level(_146)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1332, float2(0.0), isnan(_1332)), level(_146)).xyz;
        float _508 = _506.x;
        float _510 = _506.y;
        float _512 = _506.z;
        float2 _1347 = float2(_452, _454);
        float3 _514 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1347, float2(0.0), isnan(_1347)), level(_146)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1347, float2(0.0), isnan(_1347)), level(_146)).xyz;
        float _516 = _514.x;
        float _518 = _514.y;
        float _520 = _514.z;
        float2 _1362 = float2(_496, _454);
        float3 _522 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1362, float2(0.0), isnan(_1362)), level(_146)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1362, float2(0.0), isnan(_1362)), level(_146)).xyz;
        float _524 = _522.x;
        float _526 = _522.y;
        float _528 = _522.z;
        float _530 = -_140;
        float _532 = _134 + _530;
        float _534 = precise::clamp(_532, 0.0, 1.0);
        float _536 = -_474;
        float _538 = _466 + _536;
        float _540 = -_472;
        float _542 = _464 + _540;
        float _544 = fma(_344, _538, _474);
        float _546 = -_476;
        float _548 = _468 + _546;
        float _550 = -_492;
        float _552 = _482 + _550;
        float _554 = -_490;
        float _556 = _480 + _554;
        float _558 = fma(_344, _542, _472);
        float _560 = -_494;
        float _562 = _484 + _560;
        float _564 = fma(_344, _552, _492);
        float _566 = fma(_344, _556, _490);
        float _568 = fma(_344, _548, _476);
        float _570 = -_510;
        float _572 = _502 + _570;
        float _574 = -_564;
        float _576 = _574 + _544;
        float _578 = -_508;
        float _580 = _500 + _578;
        float _582 = -_512;
        float _584 = _504 + _582;
        float _586 = fma(_380, _572, _510);
        float _588 = fma(_360, _576, _564);
        float _590 = -_526;
        float _592 = _518 + _590;
        float _594 = -_524;
        float _596 = _516 + _594;
        float _598 = fma(_380, _580, _508);
        float _600 = -_528;
        float _602 = _520 + _600;
        float _604 = fma(_380, _592, _526);
        float _606 = fma(_380, _596, _524);
        float _608 = -_566;
        float _610 = _608 + _558;
        float _612 = fma(_344, _562, _494);
        float _614 = -_604;
        float _616 = _614 + _586;
        float _618 = fma(_380, _584, _512);
        float _620 = fma(_380, _602, _528);
        float _622 = -_606;
        float _624 = _622 + _598;
        float _626 = fma(_406, _616, _604);
        float _628 = fma(_360, _610, _566);
        float _630 = -_612;
        float _632 = _630 + _568;
        float _634 = -_620;
        float _636 = _634 + _618;
        float _638 = fma(_406, _624, _606);
        float _640 = -_588;
        float _642 = _640 + _626;
        float _644 = fma(_360, _632, _612);
        float _646 = fma(_406, _636, _620);
        float _648 = -_628;
        float _650 = _648 + _638;
        float _652 = fma(_534, _642, _588);
        float _654 = _124 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _656 = -_644;
        float _658 = _656 + _646;
        float _660 = fma(_534, _650, _628);
        float _662 = _652 * 0.586600005626678466796875;
        float _664 = fma(_534, _658, _644);
        float _666 = fma(_660, 0.29890000820159912109375, _662);
        float _668 = fma(_664, 0.1143999993801116943359375, _666);
        float _670 = -_660;
        float _672 = _670 + _668;
        float _674 = -_652;
        float _676 = _674 + _668;
        float _678 = -_664;
        float _680 = _678 + _668;
        float _682 = fma(_654, _672, _660);
        float _684 = fma(_654, _676, _652);
        float _686 = fma(_654, _680, _664);
        float _688 = 0.0 + _132;
        float _690 = precise::clamp(_688, 0.0, 1.0);
        float _692 = -_682;
        float _694 = fma(_682, (*spvDescriptorSet0.fp_c3)._m0[13].x, _692);
        float _696 = -_684;
        float _698 = fma(_684, (*spvDescriptorSet0.fp_c3)._m0[13].y, _696);
        float _700 = -_686;
        float _702 = fma(_686, (*spvDescriptorSet0.fp_c3)._m0[13].z, _700);
        float _704 = fma(_88, _690, _86);
        float _706 = fma(_124, _694, _682);
        float _708 = fma(_124, _698, _684);
        float _710 = fma(_124, _702, _686);
        out.m_36.x = _706;
        out.m_36.y = _708;
        out.m_36.z = _710;
        out.m_36.w = _704;
        return out;
    }
    discard_fragment();
    return out;
}

