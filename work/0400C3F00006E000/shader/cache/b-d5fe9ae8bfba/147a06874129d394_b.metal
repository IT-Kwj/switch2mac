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
int _42(thread const int& _1579, thread const int& _1580, constant _10& support_buffer)
{
    int _1583 = 1 + _1580;
    float _1585 = support_buffer._m5[_1583].x;
    float _1587 = abs(_1585);
    bool _1589 = _1587 == 1.0;
    if (_1589)
    {
        return _1579;
    }
    float _1591 = float(_1579);
    float _1593 = _1591 / _1587;
    int _1595 = int(_1593);
    return _1595;
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
    float2 _712 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_712, float2(0.0), isnan(_712))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_712, float2(0.0), isnan(_712))).x;
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
    float _96 = precise::max(_94, _90);
    bool _100 = _96 != 0.0;
    bool _102 = isnan(_96);
    bool _104 = _100 || _102;
    bool _106 = isnan(0.0);
    bool _108 = _104 || _106;
    float _110 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _112 = precise::clamp(_110, 0.0, 1.0);
    float _114 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _116 = precise::clamp(_114, 0.0, 1.0);
    float _118 = precise::min(_112, _116);
    bool _120 = !_108;
    if (!_120)
    {
        float _122 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _124 = fma(_96, _122, 1.0);
        float _126 = log2(_124);
        float _128 = _126 + (-1.0);
        float _130 = trunc(_128);
        int _132 = int(_130);
        float _134 = float(_132);
        float _136 = trunc(_134);
        int _138 = int(_136);
        float _140 = _134 + 1.0;
        float _142 = trunc(_140);
        int _144 = int(_142);
        int _146 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_138), spvDescriptorSet0.fp_t_tcb_A.get_height(_138)).x;
        int _148 = _146;
        int _150 = 1;
        int _152 = _42(_148, _150, (*spvDescriptorSet0.support_buffer));
        int _154 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_138), spvDescriptorSet0.fp_t_tcb_A.get_height(_138)).y;
        int _156 = _154;
        int _158 = 1;
        int _160 = _42(_156, _158, (*spvDescriptorSet0.support_buffer));
        int _162 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_144), spvDescriptorSet0.fp_t_tcb_A.get_height(_144)).x;
        int _164 = _162;
        int _166 = 1;
        int _168 = _42(_164, _166, (*spvDescriptorSet0.support_buffer));
        int _170 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_144), spvDescriptorSet0.fp_t_tcb_A.get_height(_144)).y;
        int _172 = _170;
        int _174 = 1;
        int _176 = _42(_172, _174, (*spvDescriptorSet0.support_buffer));
        float _178 = float(_152);
        float _180 = float(_160);
        float _182 = 1.0 / _178;
        float _184 = fma(_62, _178, -0.5);
        float _186 = fma(_64, _180, -0.5);
        float _188 = floor(_184);
        float _190 = float(_168);
        float _192 = float(_176);
        float _194 = fma(_62, _190, -0.5);
        float _196 = floor(_186);
        float _198 = -_188;
        float _200 = _184 + _198;
        float _202 = 1.0 / _180;
        float _204 = _188 + (-0.5);
        float _206 = -_200;
        float _208 = _206 + 1.0;
        float _210 = -_200;
        float _212 = _210 + 2.0;
        float _214 = _208 * _208;
        float _216 = _212 * _212;
        float _218 = -_196;
        float _220 = _186 + _218;
        float _222 = floor(_194);
        float _224 = _208 * _214;
        float _226 = fma(_64, _192, -0.5);
        float _228 = -_220;
        float _230 = _228 + 1.0;
        float _232 = _200 * _200;
        float _234 = _224 * 4.0;
        float _236 = -_224;
        float _238 = _236 + 6.0;
        float _240 = _230 * _230;
        float _242 = 1.0 / _192;
        float _244 = -_234;
        float _246 = fma(_212, _216, _244);
        float _248 = -_220;
        float _250 = _248 + 2.0;
        float _252 = _230 * _240;
        float _254 = -_246;
        float _256 = _254 + _238;
        float _258 = _250 * _250;
        float _260 = _252 * 4.0;
        float _262 = floor(_226);
        float _264 = _256 * 0.16666667163372039794921875;
        float _266 = _200 * _232;
        float _268 = -_222;
        float _270 = _194 + _268;
        float _272 = -_260;
        float _274 = fma(_250, _258, _272);
        float _276 = -_252;
        float _278 = _276 + 6.0;
        float _280 = _188 + 1.5;
        float _282 = -_270;
        float _284 = _282 + 1.0;
        float _286 = 1.0 / _264;
        float _288 = _266 * 0.16666667163372039794921875;
        float _290 = -_274;
        float _292 = _290 + _278;
        float _294 = -_262;
        float _296 = _226 + _294;
        float _298 = _284 * _284;
        float _300 = 1.0 / _190;
        float _302 = -_296;
        float _304 = _302 + 2.0;
        float _306 = _284 * _298;
        float _308 = _292 * 0.16666667163372039794921875;
        float _310 = fma(_288, _286, _280);
        float _312 = -_296;
        float _314 = _312 + 1.0;
        float _316 = -_270;
        float _318 = _316 + 2.0;
        float _320 = _306 * 4.0;
        float _322 = _224 + _246;
        float _324 = _314 * _314;
        float _326 = _318 * _318;
        float _328 = 1.0 / _308;
        float _330 = _322 * 0.16666667163372039794921875;
        float _332 = _314 * _324;
        float _334 = -_320;
        float _336 = fma(_318, _326, _334);
        float _338 = _252 + _274;
        float _340 = _304 * _304;
        float _342 = _332 * 4.0;
        float _344 = -_306;
        float _346 = _344 + 6.0;
        float _348 = 1.0 / _330;
        float _350 = _338 * 0.16666667163372039794921875;
        float _352 = -_342;
        float _354 = fma(_304, _340, _352);
        float _356 = -_332;
        float _358 = _356 + 6.0;
        float _360 = _306 + _336;
        float _362 = _246 * 0.16666667163372039794921875;
        float _364 = -_336;
        float _366 = _364 + _346;
        float _368 = -_354;
        float _370 = _368 + _358;
        float _372 = 1.0 / _350;
        float _374 = _332 + _354;
        float _376 = _366 * 0.16666667163372039794921875;
        float _378 = _370 * 0.16666667163372039794921875;
        float _380 = _220 * _220;
        float _382 = _274 * 0.16666667163372039794921875;
        float _384 = _336 * 0.16666667163372039794921875;
        float _386 = _220 * _380;
        float _388 = _360 * 0.16666667163372039794921875;
        float _390 = fma(_362, _348, _204);
        float _392 = _196 + (-0.5);
        float _394 = _196 + 1.5;
        float _396 = 1.0 / _388;
        float _398 = _374 * 0.16666667163372039794921875;
        float _400 = _386 * 0.16666667163372039794921875;
        float _402 = fma(_382, _372, _392);
        float _404 = _270 * _270;
        float _406 = _390 * _182;
        float _408 = fma(_400, _328, _394);
        float _410 = _296 * _296;
        float _412 = 1.0 / _398;
        float _414 = _310 * _182;
        float _416 = _270 * _404;
        float _418 = _402 * _202;
        float _420 = _222 + (-0.5);
        float _422 = _296 * _410;
        float _424 = _408 * _202;
        float _426 = _222 + 1.5;
        float _428 = 1.0 / _376;
        float _430 = _262 + (-0.5);
        float _432 = _354 * 0.16666667163372039794921875;
        float _434 = fma(_384, _396, _420);
        float _436 = _262 + 1.5;
        float _438 = _416 * 0.16666667163372039794921875;
        float _440 = _422 * 0.16666667163372039794921875;
        float _442 = 1.0 / _378;
        float _444 = fma(_432, _412, _430);
        float _446 = _434 * _300;
        float2 _1197 = float2(_406, _418);
        float3 _450 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1197, float2(0.0), isnan(_1197)), level(_134)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1197, float2(0.0), isnan(_1197)), level(_134)).xyz;
        float _452 = _450.x;
        float _454 = _450.y;
        float _456 = _450.z;
        float2 _1212 = float2(_414, _418);
        float3 _458 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1212, float2(0.0), isnan(_1212)), level(_134)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1212, float2(0.0), isnan(_1212)), level(_134)).xyz;
        float _460 = _458.x;
        float _462 = _458.y;
        float _464 = _458.z;
        float _466 = fma(_438, _428, _426);
        float _468 = _466 * _300;
        float _470 = fma(_440, _442, _436);
        float _472 = _444 * _242;
        float _474 = _470 * _242;
        float2 _1244 = float2(_406, _424);
        float3 _476 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1244, float2(0.0), isnan(_1244)), level(_134)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1244, float2(0.0), isnan(_1244)), level(_134)).xyz;
        float _478 = _476.x;
        float _480 = _476.y;
        float _482 = _476.z;
        float2 _1259 = float2(_414, _424);
        float3 _484 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1259, float2(0.0), isnan(_1259)), level(_134)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1259, float2(0.0), isnan(_1259)), level(_134)).xyz;
        float _486 = _484.x;
        float _488 = _484.y;
        float _490 = _484.z;
        float2 _1274 = float2(_446, _472);
        float3 _492 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1274, float2(0.0), isnan(_1274)), level(_140)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1274, float2(0.0), isnan(_1274)), level(_140)).xyz;
        float _494 = _492.x;
        float _496 = _492.y;
        float _498 = _492.z;
        float2 _1289 = float2(_468, _472);
        float3 _500 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1289, float2(0.0), isnan(_1289)), level(_140)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1289, float2(0.0), isnan(_1289)), level(_140)).xyz;
        float _502 = _500.x;
        float _504 = _500.y;
        float _506 = _500.z;
        float2 _1304 = float2(_446, _474);
        float3 _508 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1304, float2(0.0), isnan(_1304)), level(_140)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1304, float2(0.0), isnan(_1304)), level(_140)).xyz;
        float _510 = _508.x;
        float _512 = _508.y;
        float _514 = _508.z;
        float2 _1319 = float2(_468, _474);
        float3 _516 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1319, float2(0.0), isnan(_1319)), level(_140)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1319, float2(0.0), isnan(_1319)), level(_140)).xyz;
        float _518 = _516.x;
        float _520 = _516.y;
        float _522 = _516.z;
        float _524 = 0.0 + _126;
        float _526 = precise::clamp(_524, 0.0, 1.0);
        float _528 = fma(_88, _526, _86);
        float _530 = -_460;
        float _532 = _452 + _530;
        float _534 = -_462;
        float _536 = _454 + _534;
        float _538 = -_464;
        float _540 = _456 + _538;
        float _542 = fma(_330, _532, _460);
        float _544 = fma(_330, _536, _462);
        float _546 = fma(_330, _540, _464);
        float _548 = -_488;
        float _550 = _480 + _548;
        float _552 = -_486;
        float _554 = _478 + _552;
        float _556 = -_490;
        float _558 = _482 + _556;
        float _560 = fma(_330, _550, _488);
        float _562 = fma(_330, _554, _486);
        float _564 = -_134;
        float _566 = _128 + _564;
        float _568 = precise::clamp(_566, 0.0, 1.0);
        float _570 = -_504;
        float _572 = _496 + _570;
        float _574 = -_560;
        float _576 = _574 + _544;
        float _578 = -_502;
        float _580 = _494 + _578;
        float _582 = -_506;
        float _584 = _498 + _582;
        float _586 = fma(_388, _572, _504);
        float _588 = fma(_350, _576, _560);
        float _590 = -_518;
        float _592 = _510 + _590;
        float _594 = -_520;
        float _596 = _512 + _594;
        float _598 = -_522;
        float _600 = _514 + _598;
        float _602 = fma(_388, _580, _502);
        float _604 = fma(_388, _592, _518);
        float _606 = fma(_388, _596, _520);
        float _608 = fma(_330, _558, _490);
        float _610 = fma(_388, _584, _506);
        float _612 = fma(_388, _600, _522);
        float _614 = -_562;
        float _616 = _614 + _542;
        float _618 = -_604;
        float _620 = _618 + _602;
        float _622 = -_606;
        float _624 = _622 + _586;
        float _626 = -_608;
        float _628 = _626 + _546;
        float _630 = -_612;
        float _632 = _630 + _610;
        float _634 = fma(_350, _616, _562);
        float _636 = fma(_398, _620, _604);
        float _638 = fma(_398, _624, _606);
        float _640 = fma(_350, _628, _608);
        float _642 = fma(_398, _632, _612);
        float _644 = -_634;
        float _646 = _644 + _636;
        float _648 = -_588;
        float _650 = _648 + _638;
        float _652 = -_640;
        float _654 = _652 + _642;
        float _656 = fma(_568, _646, _634);
        float _658 = fma(_568, _650, _588);
        float _660 = fma(_568, _654, _640);
        float _662 = -_656;
        float _664 = fma(_656, (*spvDescriptorSet0.fp_c3)._m0[13].x, _662);
        float _666 = -_658;
        float _668 = fma(_658, (*spvDescriptorSet0.fp_c3)._m0[13].y, _666);
        float _670 = -_660;
        float _672 = fma(_660, (*spvDescriptorSet0.fp_c3)._m0[13].z, _670);
        float _674 = fma(_118, _664, _656);
        float _676 = fma(_118, _668, _658);
        float _678 = fma(_118, _672, _660);
        out.m_36.x = _674;
        out.m_36.y = _676;
        out.m_36.z = _678;
        out.m_36.w = _528;
        return out;
    }
    discard_fragment();
    return out;
}

