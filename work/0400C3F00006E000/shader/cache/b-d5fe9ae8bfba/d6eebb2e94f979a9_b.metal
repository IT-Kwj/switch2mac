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
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
};

static inline __attribute__((always_inline))
int _44(thread const int& _1635, thread const int& _1636, constant _10& support_buffer)
{
    int _1639 = 1 + _1636;
    float _1641 = support_buffer._m5[_1639].x;
    float _1643 = abs(_1641);
    bool _1645 = _1643 == 1.0;
    if (_1645)
    {
        return _1635;
    }
    float _1647 = float(_1635);
    float _1649 = _1647 / _1643;
    int _1651 = int(_1649);
    return _1651;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _48 = gl_FragCoord.w;
    float _50 = in.m_33.x;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_33.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = 1.0 / _48;
    float _64 = _62 * _54;
    float _66 = _62 * _60;
    float2 _732 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_732, float2(0.0), isnan(_732))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_732, float2(0.0), isnan(_732))).x;
    float2 _743 = float2(_64, _66);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_743, float2(0.0), isnan(_743))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_743, float2(0.0), isnan(_743))).x;
    float _72 = in.m_35.z;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_35.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_35.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = _62 * _76;
    float _92 = _62 * _88;
    float _94 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _96 = precise::clamp(_94, 0.0, 1.0);
    float _98 = precise::max(_70, _96);
    float _100 = _62 * _82;
    float _102 = precise::max(_98, _90);
    bool _106 = _102 != 0.0;
    bool _108 = isnan(_102);
    bool _110 = _106 || _108;
    bool _112 = isnan(0.0);
    bool _114 = _110 || _112;
    float _116 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _118 = precise::clamp(_116, 0.0, 1.0);
    float _120 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _122 = precise::clamp(_120, 0.0, 1.0);
    float _124 = precise::min(_118, _122);
    bool _126 = !_114;
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
        int _156 = 2;
        int _158 = _44(_154, _156, (*spvDescriptorSet0.support_buffer));
        int _160 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_144), spvDescriptorSet0.fp_t_tcb_A.get_height(_144)).y;
        int _162 = _160;
        int _164 = 2;
        int _166 = _44(_162, _164, (*spvDescriptorSet0.support_buffer));
        int _168 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_150), spvDescriptorSet0.fp_t_tcb_A.get_height(_150)).x;
        int _170 = _168;
        int _172 = 2;
        int _174 = _44(_170, _172, (*spvDescriptorSet0.support_buffer));
        int _176 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_150), spvDescriptorSet0.fp_t_tcb_A.get_height(_150)).y;
        int _178 = _176;
        int _180 = 2;
        int _182 = _44(_178, _180, (*spvDescriptorSet0.support_buffer));
        float _184 = float(_158);
        float _186 = float(_166);
        float _188 = 1.0 / _184;
        float _190 = fma(_64, _184, -0.5);
        float _192 = fma(_66, _186, -0.5);
        float _194 = floor(_190);
        float _196 = float(_174);
        float _198 = float(_182);
        float _200 = fma(_64, _196, -0.5);
        float _202 = floor(_192);
        float _204 = -_194;
        float _206 = _190 + _204;
        float _208 = floor(_200);
        float _210 = _194 + (-0.5);
        float _212 = -_206;
        float _214 = _212 + 1.0;
        float _216 = -_206;
        float _218 = _216 + 2.0;
        float _220 = _214 * _214;
        float _222 = _218 * _218;
        float _224 = -_202;
        float _226 = _192 + _224;
        float _228 = 1.0 / _186;
        float _230 = _214 * _220;
        float _232 = _230 * 4.0;
        float _234 = -_232;
        float _236 = fma(_218, _222, _234);
        float _238 = fma(_66, _198, -0.5);
        float _240 = -_230;
        float _242 = _240 + 6.0;
        float _244 = -_226;
        float _246 = _244 + 1.0;
        float _248 = -_226;
        float _250 = _248 + 2.0;
        float _252 = floor(_238);
        float _254 = -_236;
        float _256 = _254 + _242;
        float _258 = _246 * _246;
        float _260 = _250 * _250;
        float _262 = _256 * 0.16666667163372039794921875;
        float _264 = _206 * _206;
        float _266 = _246 * _258;
        float _268 = 1.0 / _198;
        float _270 = _206 * _264;
        float _272 = -_208;
        float _274 = _200 + _272;
        float _276 = _266 * 4.0;
        float _278 = _194 + 1.5;
        float _280 = -_274;
        float _282 = _280 + 1.0;
        float _284 = 1.0 / _262;
        float _286 = -_276;
        float _288 = fma(_250, _260, _286);
        float _290 = -_266;
        float _292 = _290 + 6.0;
        float _294 = _282 * _282;
        float _296 = _270 * 0.16666667163372039794921875;
        float _298 = -_252;
        float _300 = _238 + _298;
        float _302 = -_288;
        float _304 = _302 + _292;
        float _306 = _282 * _294;
        float _308 = 1.0 / _196;
        float _310 = -_300;
        float _312 = _310 + 1.0;
        float _314 = _306 * 4.0;
        float _316 = fma(_296, _284, _278);
        float _318 = -_274;
        float _320 = _318 + 2.0;
        float _322 = _230 + _236;
        float _324 = _304 * 0.16666667163372039794921875;
        float _326 = _312 * _312;
        float _328 = _320 * _320;
        float _330 = _322 * 0.16666667163372039794921875;
        float _332 = _236 * 0.16666667163372039794921875;
        float _334 = _312 * _326;
        float _336 = -_314;
        float _338 = fma(_320, _328, _336);
        float _340 = _266 + _288;
        float _342 = -_306;
        float _344 = _342 + 6.0;
        float _346 = -_300;
        float _348 = _346 + 2.0;
        float _350 = 1.0 / _330;
        float _352 = _340 * 0.16666667163372039794921875;
        float _354 = _334 * 4.0;
        float _356 = _348 * _348;
        float _358 = -_338;
        float _360 = _358 + _344;
        float _362 = _306 + _338;
        float _364 = _338 * 0.16666667163372039794921875;
        float _366 = -_354;
        float _368 = fma(_348, _356, _366);
        float _370 = 1.0 / _352;
        float _372 = _226 * _226;
        float _374 = -_334;
        float _376 = _374 + 6.0;
        float _378 = _334 + _368;
        float _380 = _202 + 1.5;
        float _382 = _226 * _372;
        float _384 = _362 * 0.16666667163372039794921875;
        float _386 = _202 + (-0.5);
        float _388 = 1.0 / _324;
        float _390 = fma(_332, _350, _210);
        float _392 = _288 * 0.16666667163372039794921875;
        float _394 = _382 * 0.16666667163372039794921875;
        float _396 = -_368;
        float _398 = _396 + _376;
        float _400 = _378 * 0.16666667163372039794921875;
        float _402 = _360 * 0.16666667163372039794921875;
        float _404 = _390 * _188;
        float _406 = 1.0 / _384;
        float _408 = fma(_392, _370, _386);
        float _410 = _398 * 0.16666667163372039794921875;
        float _412 = _300 * _300;
        float _414 = _316 * _188;
        float _416 = _408 * _228;
        float _418 = _300 * _412;
        float _420 = 1.0 / _400;
        float _422 = fma(_394, _388, _380);
        float _424 = _274 * _274;
        float _426 = _208 + (-0.5);
        float _428 = _208 + 1.5;
        float _430 = _422 * _228;
        float _432 = _274 * _424;
        float _434 = _252 + (-0.5);
        float _436 = 1.0 / _402;
        float _438 = _252 + 1.5;
        float _440 = _368 * 0.16666667163372039794921875;
        float _442 = fma(_364, _406, _426);
        float _444 = _432 * 0.16666667163372039794921875;
        float _446 = _418 * 0.16666667163372039794921875;
        float _448 = _442 * _308;
        float _450 = 1.0 / _410;
        float _452 = fma(_440, _420, _434);
        float _454 = _452 * _268;
        float _456 = fma(_444, _436, _428);
        float _458 = _456 * _308;
        float _460 = fma(_446, _450, _438);
        float2 _1242 = float2(_404, _416);
        float3 _464 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1242, float2(0.0), isnan(_1242)), level(_140)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1242, float2(0.0), isnan(_1242)), level(_140)).xyz;
        float _466 = _464.x;
        float _468 = _464.y;
        float _470 = _464.z;
        float2 _1257 = float2(_414, _416);
        float3 _472 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1257, float2(0.0), isnan(_1257)), level(_140)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1257, float2(0.0), isnan(_1257)), level(_140)).xyz;
        float _474 = _472.x;
        float _476 = _472.y;
        float _478 = _472.z;
        float _480 = _460 * _268;
        float2 _1275 = float2(_404, _430);
        float3 _482 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1275, float2(0.0), isnan(_1275)), level(_140)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1275, float2(0.0), isnan(_1275)), level(_140)).xyz;
        float _484 = _482.x;
        float _486 = _482.y;
        float _488 = _482.z;
        float2 _1290 = float2(_414, _430);
        float3 _490 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1290, float2(0.0), isnan(_1290)), level(_140)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1290, float2(0.0), isnan(_1290)), level(_140)).xyz;
        float _492 = _490.x;
        float _494 = _490.y;
        float _496 = _490.z;
        float2 _1305 = float2(_448, _454);
        float3 _498 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1305, float2(0.0), isnan(_1305)), level(_146)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1305, float2(0.0), isnan(_1305)), level(_146)).xyz;
        float _500 = _498.x;
        float _502 = _498.y;
        float _504 = _498.z;
        float2 _1320 = float2(_458, _454);
        float3 _506 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1320, float2(0.0), isnan(_1320)), level(_146)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1320, float2(0.0), isnan(_1320)), level(_146)).xyz;
        float _508 = _506.x;
        float _510 = _506.y;
        float _512 = _506.z;
        float2 _1335 = float2(_448, _480);
        float3 _514 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1335, float2(0.0), isnan(_1335)), level(_146)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1335, float2(0.0), isnan(_1335)), level(_146)).xyz;
        float _516 = _514.x;
        float _518 = _514.y;
        float _520 = _514.z;
        float2 _1350 = float2(_458, _480);
        float3 _522 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1350, float2(0.0), isnan(_1350)), level(_146)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1350, float2(0.0), isnan(_1350)), level(_146)).xyz;
        float _524 = _522.x;
        float _526 = _522.y;
        float _528 = _522.z;
        float _530 = -_140;
        float _532 = _134 + _530;
        float _534 = precise::clamp(_532, 0.0, 1.0);
        float _536 = 0.0 + _132;
        float _538 = precise::clamp(_536, 0.0, 1.0);
        float _540 = fma(_92, _538, _100);
        float _542 = _538 * _92;
        float _544 = -_474;
        float _546 = _466 + _544;
        float _548 = -_476;
        float _550 = _468 + _548;
        float _552 = -_478;
        float _554 = _470 + _552;
        float _556 = fma(_330, _546, _474);
        float _558 = -_508;
        float _560 = _500 + _558;
        float _562 = -_510;
        float _564 = _502 + _562;
        float _566 = -_492;
        float _568 = _484 + _566;
        float _570 = -_494;
        float _572 = _486 + _570;
        float _574 = -_496;
        float _576 = _488 + _574;
        float _578 = fma(_384, _560, _508);
        float _580 = -_512;
        float _582 = _504 + _580;
        float _584 = -_528;
        float _586 = _520 + _584;
        float _588 = fma(_384, _564, _510);
        float _590 = -_524;
        float _592 = _516 + _590;
        float _594 = fma(_330, _550, _476);
        float _596 = fma(_330, _554, _478);
        float _598 = fma(_330, _568, _492);
        float _600 = fma(_330, _572, _494);
        float _602 = -_526;
        float _604 = _518 + _602;
        float _606 = fma(_330, _576, _496);
        float _608 = fma(_384, _582, _512);
        float _610 = fma(_384, _586, _528);
        float _612 = fma(_384, _592, _524);
        float _614 = fma(_384, _604, _526);
        float _616 = -_606;
        float _618 = _616 + _596;
        float _620 = -_610;
        float _622 = _620 + _608;
        float _624 = -_598;
        float _626 = _624 + _556;
        float _628 = -_612;
        float _630 = _628 + _578;
        float _632 = -_614;
        float _634 = _632 + _588;
        float _636 = -_600;
        float _638 = _636 + _594;
        float _640 = fma(_352, _618, _606);
        float _642 = fma(_400, _622, _610);
        float _644 = fma(_352, _626, _598);
        float _646 = fma(_400, _630, _612);
        float _648 = fma(_400, _634, _614);
        float _650 = 1.0 / _540;
        float _652 = fma(_352, _638, _600);
        float _654 = -_640;
        float _656 = _654 + _642;
        float _658 = -_644;
        float _660 = _658 + _646;
        float _662 = -_652;
        float _664 = _662 + _648;
        float _666 = fma(_534, _656, _640);
        float _668 = fma(_534, _660, _644);
        float _670 = fma(_534, _664, _652);
        float _672 = -_666;
        float _674 = fma(_666, (*spvDescriptorSet0.fp_c3)._m0[13].z, _672);
        float _676 = -_668;
        float _678 = fma(_668, (*spvDescriptorSet0.fp_c3)._m0[13].x, _676);
        float _680 = -_670;
        float _682 = fma(_670, (*spvDescriptorSet0.fp_c3)._m0[13].y, _680);
        float _684 = fma(_124, _674, _666);
        float _686 = fma(_124, _678, _668);
        float _688 = _650 * _542;
        float _690 = fma(_124, _682, _670);
        float _692 = _684 * _542;
        float _694 = _686 * _688;
        float _696 = _690 * _688;
        float _698 = _692 * _650;
        out.m_38.x = _694;
        out.m_38.y = _696;
        out.m_38.z = _698;
        out.m_38.w = _540;
        return out;
    }
    out.m_38.x = 0.0;
    out.m_38.y = 0.0;
    out.m_38.z = 0.0;
    out.m_38.w = _100;
    return out;
}

