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
int _42(thread const int& _1642, thread const int& _1643, constant _10& support_buffer)
{
    int _1646 = 1 + _1643;
    float _1648 = support_buffer._m5[_1646].x;
    float _1650 = abs(_1648);
    bool _1652 = _1650 == 1.0;
    if (_1652)
    {
        return _1642;
    }
    float _1654 = float(_1642);
    float _1656 = _1654 / _1650;
    int _1658 = int(_1656);
    return _1658;
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
    float2 _730 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_730, float2(0.0), isnan(_730))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_730, float2(0.0), isnan(_730))).x;
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
    float _106 = _60 * _82;
    float _108 = precise::max(_104, _106);
    float _110 = _60 * _88;
    float _112 = _60 * _94;
    bool _114 = _108 != 0.0;
    bool _116 = isnan(_108);
    bool _118 = _114 || _116;
    bool _120 = isnan(0.0);
    bool _122 = _118 || _120;
    bool _124 = !_122;
    if (!_124)
    {
        float _126 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _128 = fma(_108, _126, 1.0);
        float _130 = log2(_128);
        float _132 = _130 + (-1.0);
        float _134 = trunc(_132);
        int _136 = int(_134);
        float _138 = float(_136);
        float _140 = trunc(_138);
        int _142 = int(_140);
        float _144 = _138 + 1.0;
        float _146 = trunc(_144);
        int _148 = int(_146);
        int _150 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_142), spvDescriptorSet0.fp_t_tcb_A.get_height(_142)).x;
        int _152 = _150;
        int _154 = 1;
        int _156 = _42(_152, _154, (*spvDescriptorSet0.support_buffer));
        int _158 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_142), spvDescriptorSet0.fp_t_tcb_A.get_height(_142)).y;
        int _160 = _158;
        int _162 = 1;
        int _164 = _42(_160, _162, (*spvDescriptorSet0.support_buffer));
        int _166 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_148), spvDescriptorSet0.fp_t_tcb_A.get_height(_148)).x;
        int _168 = _166;
        int _170 = 1;
        int _172 = _42(_168, _170, (*spvDescriptorSet0.support_buffer));
        int _174 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_148), spvDescriptorSet0.fp_t_tcb_A.get_height(_148)).y;
        int _176 = _174;
        int _178 = 1;
        int _180 = _42(_176, _178, (*spvDescriptorSet0.support_buffer));
        float _182 = float(_156);
        float _184 = float(_164);
        float _186 = 1.0 / _182;
        float _188 = fma(_62, _182, -0.5);
        float _190 = fma(_64, _184, -0.5);
        float _192 = floor(_188);
        float _194 = float(_172);
        float _196 = float(_180);
        float _198 = fma(_62, _194, -0.5);
        float _200 = floor(_190);
        float _202 = fma(_64, _196, -0.5);
        float _204 = -_192;
        float _206 = _188 + _204;
        float _208 = floor(_198);
        float _210 = -_206;
        float _212 = _210 + 1.0;
        float _214 = -_206;
        float _216 = _214 + 2.0;
        float _218 = -_200;
        float _220 = _190 + _218;
        float _222 = _212 * _212;
        float _224 = floor(_202);
        float _226 = _216 * _216;
        float _228 = -_220;
        float _230 = _228 + 1.0;
        float _232 = _212 * _222;
        float _234 = -_220;
        float _236 = _234 + 2.0;
        float _238 = _200 + (-0.5);
        float _240 = _230 * _230;
        float _242 = _232 * 4.0;
        float _244 = _200 + 1.5;
        float _246 = 1.0 / _184;
        float _248 = _230 * _240;
        float _250 = -_208;
        float _252 = _198 + _250;
        float _254 = -_242;
        float _256 = fma(_216, _226, _254);
        float _258 = _236 * _236;
        float _260 = _248 * 4.0;
        float _262 = -_252;
        float _264 = _262 + 1.0;
        float _266 = -_232;
        float _268 = _266 + 6.0;
        float _270 = -_252;
        float _272 = _270 + 2.0;
        float _274 = -_260;
        float _276 = fma(_236, _258, _274);
        float _278 = -_248;
        float _280 = _278 + 6.0;
        float _282 = _264 * _264;
        float _284 = -_224;
        float _286 = _202 + _284;
        float _288 = -_256;
        float _290 = _288 + _268;
        float _292 = -_276;
        float _294 = _292 + _280;
        float _296 = _264 * _282;
        float _298 = -_286;
        float _300 = _298 + 1.0;
        float _302 = _232 + _256;
        float _304 = _294 * 0.16666667163372039794921875;
        float _306 = _272 * _272;
        float _308 = _296 * 4.0;
        float _310 = _290 * 0.16666667163372039794921875;
        float _312 = _302 * 0.16666667163372039794921875;
        float _314 = 1.0 / _194;
        float _316 = -_308;
        float _318 = fma(_272, _306, _316);
        float _320 = _300 * _300;
        float _322 = -_296;
        float _324 = _322 + 6.0;
        float _326 = _300 * _320;
        float _328 = -_318;
        float _330 = _328 + _324;
        float _332 = 1.0 / _310;
        float _334 = _206 * _206;
        float _336 = _326 * 4.0;
        float _338 = _248 + _276;
        float _340 = _330 * 0.16666667163372039794921875;
        float _342 = _206 * _334;
        float _344 = _192 + 1.5;
        float _346 = _276 * 0.16666667163372039794921875;
        float _348 = 1.0 / _312;
        float _350 = -_286;
        float _352 = _350 + 2.0;
        float _354 = _352 * _352;
        float _356 = 1.0 / _304;
        float _358 = -_336;
        float _360 = fma(_352, _354, _358);
        float _362 = _338 * 0.16666667163372039794921875;
        float _364 = -_326;
        float _366 = _364 + 6.0;
        float _368 = _342 * 0.16666667163372039794921875;
        float _370 = _296 + _318;
        float _372 = -_360;
        float _374 = _372 + _366;
        float _376 = 1.0 / _362;
        float _378 = fma(_368, _332, _344);
        float _380 = _220 * _220;
        float _382 = _374 * 0.16666667163372039794921875;
        float _384 = _192 + (-0.5);
        float _386 = _256 * 0.16666667163372039794921875;
        float _388 = _220 * _380;
        float _390 = _326 + _360;
        float _392 = 1.0 / _340;
        float _394 = _370 * 0.16666667163372039794921875;
        float _396 = fma(_386, _348, _384);
        float _398 = _390 * 0.16666667163372039794921875;
        float _400 = _360 * 0.16666667163372039794921875;
        float _402 = 1.0 / _394;
        float _404 = _388 * 0.16666667163372039794921875;
        float _406 = fma(_404, _356, _244);
        float _408 = fma(_346, _376, _238);
        float _410 = _396 * _186;
        float _412 = 1.0 / _398;
        float _414 = _378 * _186;
        float _416 = _252 * _252;
        float _418 = _286 * _286;
        float _420 = _208 + (-0.5);
        float _422 = _408 * _246;
        float _424 = _252 * _416;
        float _426 = _286 * _418;
        float _428 = 1.0 / _382;
        float _430 = _208 + 1.5;
        float _432 = _318 * 0.16666667163372039794921875;
        float _434 = _424 * 0.16666667163372039794921875;
        float _436 = _224 + (-0.5);
        float _438 = _406 * _246;
        float _440 = fma(_432, _402, _420);
        float _442 = fma(_434, _392, _430);
        float _444 = 1.0 / _196;
        float _446 = _224 + 1.5;
        float _448 = _426 * 0.16666667163372039794921875;
        float _450 = fma(_400, _412, _436);
        float _452 = _440 * _314;
        float _454 = _442 * _314;
        float _456 = fma(_448, _428, _446);
        float2 _1244 = float2(_410, _422);
        float3 _460 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1244, float2(0.0), isnan(_1244)), level(_138)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1244, float2(0.0), isnan(_1244)), level(_138)).xyz;
        float _462 = _460.x;
        float _464 = _460.y;
        float _466 = _460.z;
        float _468 = _450 * _444;
        float _470 = _456 * _444;
        float2 _1265 = float2(_414, _422);
        float3 _472 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1265, float2(0.0), isnan(_1265)), level(_138)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1265, float2(0.0), isnan(_1265)), level(_138)).xyz;
        float _474 = _472.x;
        float _476 = _472.y;
        float _478 = _472.z;
        float2 _1280 = float2(_410, _438);
        float3 _480 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1280, float2(0.0), isnan(_1280)), level(_138)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1280, float2(0.0), isnan(_1280)), level(_138)).xyz;
        float _482 = _480.x;
        float _484 = _480.y;
        float _486 = _480.z;
        float2 _1295 = float2(_414, _438);
        float3 _488 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1295, float2(0.0), isnan(_1295)), level(_138)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1295, float2(0.0), isnan(_1295)), level(_138)).xyz;
        float _490 = _488.x;
        float _492 = _488.y;
        float _494 = _488.z;
        float2 _1310 = float2(_452, _468);
        float3 _496 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1310, float2(0.0), isnan(_1310)), level(_144)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1310, float2(0.0), isnan(_1310)), level(_144)).xyz;
        float _498 = _496.x;
        float _500 = _496.y;
        float _502 = _496.z;
        float2 _1325 = float2(_454, _468);
        float3 _504 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1325, float2(0.0), isnan(_1325)), level(_144)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1325, float2(0.0), isnan(_1325)), level(_144)).xyz;
        float _506 = _504.x;
        float _508 = _504.y;
        float _510 = _504.z;
        float2 _1340 = float2(_452, _470);
        float3 _512 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1340, float2(0.0), isnan(_1340)), level(_144)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1340, float2(0.0), isnan(_1340)), level(_144)).xyz;
        float _514 = _512.x;
        float _516 = _512.y;
        float _518 = _512.z;
        float2 _1355 = float2(_454, _470);
        float3 _520 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1355, float2(0.0), isnan(_1355)), level(_144)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1355, float2(0.0), isnan(_1355)), level(_144)).xyz;
        float _522 = _520.x;
        float _524 = _520.y;
        float _526 = _520.z;
        float _528 = -_138;
        float _530 = _132 + _528;
        float _532 = precise::clamp(_530, 0.0, 1.0);
        float _534 = -_474;
        float _536 = _462 + _534;
        float _538 = -_476;
        float _540 = _464 + _538;
        float _542 = -_490;
        float _544 = _482 + _542;
        float _546 = -_478;
        float _548 = _466 + _546;
        float _550 = fma(_312, _536, _474);
        float _552 = -_492;
        float _554 = _484 + _552;
        float _556 = fma(_312, _544, _490);
        float _558 = -_494;
        float _560 = _486 + _558;
        float _562 = fma(_312, _540, _476);
        float _564 = fma(_312, _554, _492);
        float _566 = -_506;
        float _568 = _498 + _566;
        float _570 = fma(_312, _560, _494);
        float _572 = -_510;
        float _574 = _502 + _572;
        float _576 = -_564;
        float _578 = _576 + _562;
        float _580 = -_508;
        float _582 = _500 + _580;
        float _584 = -_522;
        float _586 = _514 + _584;
        float _588 = -_526;
        float _590 = _518 + _588;
        float _592 = fma(_362, _578, _564);
        float _594 = fma(_394, _582, _508);
        float _596 = -_524;
        float _598 = _516 + _596;
        float _600 = fma(_394, _568, _506);
        float _602 = fma(_394, _574, _510);
        float _604 = fma(_394, _586, _522);
        float _606 = fma(_394, _598, _524);
        float _608 = fma(_312, _548, _478);
        float _610 = fma(_394, _590, _526);
        float _612 = -_556;
        float _614 = _612 + _550;
        float _616 = -_604;
        float _618 = _616 + _600;
        float _620 = -_570;
        float _622 = _620 + _608;
        float _624 = -_606;
        float _626 = _624 + _594;
        float _628 = -_610;
        float _630 = _628 + _602;
        float _632 = fma(_362, _614, _556);
        float _634 = fma(_398, _618, _604);
        float _636 = 0.0 + _130;
        float _638 = precise::clamp(_636, 0.0, 1.0);
        float _640 = fma(_362, _622, _570);
        float _642 = fma(_398, _626, _606);
        float _644 = fma(_398, _630, _610);
        float _646 = -_632;
        float _648 = _646 + _634;
        float _650 = fma(_112, _638, _110);
        float _652 = -_592;
        float _654 = _652 + _642;
        float _656 = -_640;
        float _658 = _656 + _644;
        float _660 = fma(_532, _648, _632);
        float _662 = 1.0 / _650;
        float _664 = fma(_532, _654, _592);
        float _666 = fma(_532, _658, _640);
        float _668 = _638 * _660;
        float _670 = _638 * _664;
        float _672 = _638 * _666;
        float _674 = -_668;
        float _676 = _674 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
        float _678 = -_670;
        float _680 = _678 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
        float _682 = -_672;
        float _684 = _682 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
        float _686 = fma(_110, _676, _668);
        float _688 = fma(_110, _680, _670);
        float _690 = fma(_110, _684, _672);
        float _692 = _686 * _662;
        float _694 = _688 * _662;
        float _696 = _690 * _662;
        out.m_34.x = _692;
        out.m_34.y = _694;
        out.m_34.z = _696;
        out.m_34.w = _650;
        return out;
    }
    out.m_34.x = (*spvDescriptorSet0.fp_c3)._m0[12].x;
    out.m_34.y = (*spvDescriptorSet0.fp_c3)._m0[12].y;
    out.m_34.z = (*spvDescriptorSet0.fp_c3)._m0[12].z;
    out.m_34.w = _110;
    return out;
}

