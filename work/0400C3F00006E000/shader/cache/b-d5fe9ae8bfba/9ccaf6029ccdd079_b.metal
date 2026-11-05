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
int _42(thread const int& _1647, thread const int& _1648, constant _10& support_buffer)
{
    int _1651 = 1 + _1648;
    float _1653 = support_buffer._m5[_1651].x;
    float _1655 = abs(_1653);
    bool _1657 = _1655 == 1.0;
    if (_1657)
    {
        return _1647;
    }
    float _1659 = float(_1647);
    float _1661 = _1659 / _1655;
    int _1663 = int(_1661);
    return _1663;
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
    float2 _738 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_738, float2(0.0), isnan(_738))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_738, float2(0.0), isnan(_738))).x;
    float _68 = in.m_33.y;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_33.x;
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
        float _190 = floor(_186);
        float _192 = -_188;
        float _194 = _184 + _192;
        float _196 = float(_168);
        float _198 = 1.0 / _180;
        float _200 = _188 + 1.5;
        float _202 = -_194;
        float _204 = _202 + 1.0;
        float _206 = -_194;
        float _208 = _206 + 2.0;
        float _210 = fma(_62, _196, -0.5);
        float _212 = _188 + (-0.5);
        float _214 = _204 * _204;
        float _216 = -_190;
        float _218 = _186 + _216;
        float _220 = floor(_210);
        float _222 = _204 * _214;
        float _224 = float(_176);
        float _226 = _208 * _208;
        float _228 = -_218;
        float _230 = _228 + 2.0;
        float _232 = _222 * 4.0;
        float _234 = _218 * _218;
        float _236 = fma(_64, _224, -0.5);
        float _238 = -_222;
        float _240 = _238 + 6.0;
        float _242 = -_232;
        float _244 = fma(_208, _226, _242);
        float _246 = -_218;
        float _248 = _246 + 1.0;
        float _250 = floor(_236);
        float _252 = _230 * _230;
        float _254 = -_244;
        float _256 = _254 + _240;
        float _258 = _248 * _248;
        float _260 = _218 * _234;
        float _262 = _256 * 0.16666667163372039794921875;
        float _264 = _248 * _258;
        float _266 = _194 * _194;
        float _268 = _260 * 0.16666667163372039794921875;
        float _270 = 1.0 / _262;
        float _272 = _264 * 4.0;
        float _274 = _194 * _266;
        float _276 = -_220;
        float _278 = _210 + _276;
        float _280 = -_272;
        float _282 = fma(_230, _252, _280);
        float _284 = -_264;
        float _286 = _284 + 6.0;
        float _288 = -_278;
        float _290 = _288 + 1.0;
        float _292 = _274 * 0.16666667163372039794921875;
        float _294 = -_250;
        float _296 = _236 + _294;
        float _298 = -_282;
        float _300 = _298 + _286;
        float _302 = _290 * _290;
        float _304 = 1.0 / _196;
        float _306 = _300 * 0.16666667163372039794921875;
        float _308 = _290 * _302;
        float _310 = fma(_292, _270, _200);
        float _312 = -_296;
        float _314 = _312 + 1.0;
        float _316 = _222 + _244;
        float _318 = _308 * 4.0;
        float _320 = -_296;
        float _322 = _320 + 2.0;
        float _324 = -_278;
        float _326 = _324 + 2.0;
        float _328 = _314 * _314;
        float _330 = _316 * 0.16666667163372039794921875;
        float _332 = _264 + _282;
        float _334 = _326 * _326;
        float _336 = _314 * _328;
        float _338 = 1.0 / _330;
        float _340 = _332 * 0.16666667163372039794921875;
        float _342 = -_318;
        float _344 = fma(_326, _334, _342);
        float _346 = _322 * _322;
        float _348 = _336 * 4.0;
        float _350 = -_308;
        float _352 = _350 + 6.0;
        float _354 = _308 + _344;
        float _356 = _244 * 0.16666667163372039794921875;
        float _358 = 1.0 / _306;
        float _360 = -_344;
        float _362 = _360 + _352;
        float _364 = _354 * 0.16666667163372039794921875;
        float _366 = _190 + (-0.5);
        float _368 = _344 * 0.16666667163372039794921875;
        float _370 = _362 * 0.16666667163372039794921875;
        float _372 = 1.0 / _340;
        float _374 = -_348;
        float _376 = fma(_322, _346, _374);
        float _378 = -_336;
        float _380 = _378 + 6.0;
        float _382 = fma(_356, _338, _212);
        float _384 = _190 + 1.5;
        float _386 = _336 + _376;
        float _388 = -_376;
        float _390 = _388 + _380;
        float _392 = _282 * 0.16666667163372039794921875;
        float _394 = 1.0 / _364;
        float _396 = _386 * 0.16666667163372039794921875;
        float _398 = _390 * 0.16666667163372039794921875;
        float _400 = fma(_268, _358, _384);
        float _402 = _296 * _296;
        float _404 = _382 * _182;
        float _406 = _310 * _182;
        float _408 = 1.0 / _398;
        float _410 = fma(_392, _372, _366);
        float _412 = _278 * _278;
        float _414 = _296 * _402;
        float _416 = _220 + (-0.5);
        float _418 = _250 + 1.5;
        float _420 = _278 * _412;
        float _422 = _220 + 1.5;
        float _424 = 1.0 / _224;
        float _426 = _414 * 0.16666667163372039794921875;
        float _428 = _410 * _198;
        float _430 = fma(_368, _394, _416);
        float _432 = _250 + (-0.5);
        float _434 = _376 * 0.16666667163372039794921875;
        float _436 = _400 * _198;
        float _438 = 1.0 / _396;
        float _440 = fma(_426, _408, _418);
        float _442 = _430 * _304;
        float _444 = _420 * 0.16666667163372039794921875;
        float _446 = 1.0 / _370;
        float _448 = _440 * _424;
        float _450 = fma(_434, _438, _432);
        float _452 = _450 * _424;
        float2 _1233 = float2(_404, _428);
        float3 _456 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1233, float2(0.0), isnan(_1233)), level(_134)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1233, float2(0.0), isnan(_1233)), level(_134)).xyz;
        float _458 = _456.x;
        float _460 = _456.y;
        float _462 = _456.z;
        float2 _1248 = float2(_406, _428);
        float3 _464 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1248, float2(0.0), isnan(_1248)), level(_134)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1248, float2(0.0), isnan(_1248)), level(_134)).xyz;
        float _466 = _464.x;
        float _468 = _464.y;
        float _470 = _464.z;
        float2 _1263 = float2(_404, _436);
        float3 _472 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1263, float2(0.0), isnan(_1263)), level(_134)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1263, float2(0.0), isnan(_1263)), level(_134)).xyz;
        float _474 = _472.x;
        float _476 = _472.y;
        float _478 = _472.z;
        float _480 = fma(_444, _446, _422);
        float2 _1282 = float2(_406, _436);
        float3 _482 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1282, float2(0.0), isnan(_1282)), level(_134)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1282, float2(0.0), isnan(_1282)), level(_134)).xyz;
        float _484 = _482.x;
        float _486 = _482.y;
        float _488 = _482.z;
        float _490 = _480 * _304;
        float2 _1300 = float2(_442, _452);
        float3 _492 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1300, float2(0.0), isnan(_1300)), level(_140)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1300, float2(0.0), isnan(_1300)), level(_140)).xyz;
        float _494 = _492.x;
        float _496 = _492.y;
        float _498 = _492.z;
        float2 _1315 = float2(_490, _452);
        float3 _500 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1315, float2(0.0), isnan(_1315)), level(_140)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1315, float2(0.0), isnan(_1315)), level(_140)).xyz;
        float _502 = _500.x;
        float _504 = _500.y;
        float _506 = _500.z;
        float2 _1330 = float2(_442, _448);
        float3 _508 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1330, float2(0.0), isnan(_1330)), level(_140)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1330, float2(0.0), isnan(_1330)), level(_140)).xyz;
        float _510 = _508.x;
        float _512 = _508.y;
        float _514 = _508.z;
        float2 _1345 = float2(_490, _448);
        float3 _516 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1345, float2(0.0), isnan(_1345)), level(_140)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1345, float2(0.0), isnan(_1345)), level(_140)).xyz;
        float _518 = _516.x;
        float _520 = _516.y;
        float _522 = _516.z;
        float _524 = -_134;
        float _526 = _128 + _524;
        float _528 = precise::clamp(_526, 0.0, 1.0);
        float _530 = -_468;
        float _532 = _460 + _530;
        float _534 = -_466;
        float _536 = _458 + _534;
        float _538 = fma(_330, _532, _468);
        float _540 = -_470;
        float _542 = _462 + _540;
        float _544 = -_486;
        float _546 = _476 + _544;
        float _548 = -_484;
        float _550 = _474 + _548;
        float _552 = fma(_330, _536, _466);
        float _554 = -_488;
        float _556 = _478 + _554;
        float _558 = fma(_330, _546, _486);
        float _560 = fma(_330, _550, _484);
        float _562 = fma(_330, _542, _470);
        float _564 = -_504;
        float _566 = _496 + _564;
        float _568 = -_558;
        float _570 = _568 + _538;
        float _572 = -_502;
        float _574 = _494 + _572;
        float _576 = -_506;
        float _578 = _498 + _576;
        float _580 = fma(_364, _566, _504);
        float _582 = fma(_340, _570, _558);
        float _584 = -_520;
        float _586 = _512 + _584;
        float _588 = -_518;
        float _590 = _510 + _588;
        float _592 = fma(_364, _574, _502);
        float _594 = -_522;
        float _596 = _514 + _594;
        float _598 = fma(_364, _586, _520);
        float _600 = fma(_364, _590, _518);
        float _602 = -_560;
        float _604 = _602 + _552;
        float _606 = fma(_330, _556, _488);
        float _608 = -_598;
        float _610 = _608 + _580;
        float _612 = fma(_364, _578, _506);
        float _614 = fma(_364, _596, _522);
        float _616 = -_600;
        float _618 = _616 + _592;
        float _620 = fma(_396, _610, _598);
        float _622 = fma(_340, _604, _560);
        float _624 = -_606;
        float _626 = _624 + _562;
        float _628 = -_614;
        float _630 = _628 + _612;
        float _632 = fma(_396, _618, _600);
        float _634 = -_582;
        float _636 = _634 + _620;
        float _638 = fma(_340, _626, _606);
        float _640 = fma(_396, _630, _614);
        float _642 = -_622;
        float _644 = _642 + _632;
        float _646 = fma(_528, _636, _582);
        float _648 = _118 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _650 = -_638;
        float _652 = _650 + _640;
        float _654 = fma(_528, _644, _622);
        float _656 = _646 * 0.586600005626678466796875;
        float _658 = fma(_528, _652, _638);
        float _660 = fma(_654, 0.29890000820159912109375, _656);
        float _662 = fma(_658, 0.1143999993801116943359375, _660);
        float _664 = -_654;
        float _666 = _664 + _662;
        float _668 = -_646;
        float _670 = _668 + _662;
        float _672 = -_658;
        float _674 = _672 + _662;
        float _676 = fma(_648, _666, _654);
        float _678 = fma(_648, _670, _646);
        float _680 = fma(_648, _674, _658);
        float _682 = 0.0 + _126;
        float _684 = precise::clamp(_682, 0.0, 1.0);
        float _686 = -_676;
        float _688 = fma(_676, (*spvDescriptorSet0.fp_c3)._m0[13].x, _686);
        float _690 = -_678;
        float _692 = fma(_678, (*spvDescriptorSet0.fp_c3)._m0[13].y, _690);
        float _694 = -_680;
        float _696 = fma(_680, (*spvDescriptorSet0.fp_c3)._m0[13].z, _694);
        float _698 = fma(_86, _684, _88);
        float _700 = fma(_118, _688, _676);
        float _702 = fma(_118, _692, _678);
        float _704 = fma(_118, _696, _680);
        out.m_36.x = _700;
        out.m_36.y = _702;
        out.m_36.z = _704;
        out.m_36.w = _698;
        return out;
    }
    discard_fragment();
    return out;
}

