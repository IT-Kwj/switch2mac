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
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_38 [[user(locn1)]];
};

static inline __attribute__((always_inline))
int _44(thread const int& _1548, thread const int& _1549, constant _10& support_buffer)
{
    int _1552 = 1 + _1549;
    float _1554 = support_buffer._m5[_1552].x;
    float _1556 = abs(_1554);
    bool _1558 = _1556 == 1.0;
    if (_1558)
    {
        return _1548;
    }
    float _1560 = float(_1548);
    float _1562 = _1560 / _1556;
    int _1564 = int(_1562);
    return _1564;
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
    float2 _698 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_698, float2(0.0), isnan(_698))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_698, float2(0.0), isnan(_698))).x;
    float _70 = -_68;
    float _72 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _74 = 1.0 / _72;
    bool _78 = _74 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_78)
    {
        discard_fragment();
    }
    float2 _730 = float2(_64, _66);
    float _80 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_730, float2(0.0), isnan(_730))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_730, float2(0.0), isnan(_730))).x;
    float _82 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _84 = precise::clamp(_82, 0.0, 1.0);
    if (_78)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return out;
    }
    float _86 = in.m_38.z;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_38.x;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_38.y;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = precise::max(_80, _84);
    float _106 = _62 * _90;
    float _108 = precise::max(_104, _106);
    float _110 = _62 * _96;
    float _112 = _62 * _102;
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
        int _154 = 2;
        int _156 = _44(_152, _154, (*spvDescriptorSet0.support_buffer));
        int _158 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_142), spvDescriptorSet0.fp_t_tcb_A.get_height(_142)).y;
        int _160 = _158;
        int _162 = 2;
        int _164 = _44(_160, _162, (*spvDescriptorSet0.support_buffer));
        int _166 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_148), spvDescriptorSet0.fp_t_tcb_A.get_height(_148)).x;
        int _168 = _166;
        int _170 = 2;
        int _172 = _44(_168, _170, (*spvDescriptorSet0.support_buffer));
        int _174 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_148), spvDescriptorSet0.fp_t_tcb_A.get_height(_148)).y;
        int _176 = _174;
        int _178 = 2;
        int _180 = _44(_176, _178, (*spvDescriptorSet0.support_buffer));
        float _182 = float(_156);
        float _184 = float(_164);
        float _186 = 1.0 / _182;
        float _188 = fma(_64, _182, -0.5);
        float _190 = fma(_66, _184, -0.5);
        float _192 = floor(_188);
        float _194 = floor(_190);
        float _196 = float(_172);
        float _198 = float(_180);
        float _200 = fma(_64, _196, -0.5);
        float _202 = -_192;
        float _204 = _188 + _202;
        float _206 = fma(_66, _198, -0.5);
        float _208 = floor(_200);
        float _210 = -_204;
        float _212 = _210 + 1.0;
        float _214 = -_204;
        float _216 = _214 + 2.0;
        float _218 = -_194;
        float _220 = _190 + _218;
        float _222 = _212 * _212;
        float _224 = floor(_206);
        float _226 = -_220;
        float _228 = _226 + 1.0;
        float _230 = _212 * _222;
        float _232 = _216 * _216;
        float _234 = -_220;
        float _236 = _234 + 2.0;
        float _238 = _228 * _228;
        float _240 = _230 * 4.0;
        float _242 = 1.0 / _184;
        float _244 = _228 * _238;
        float _246 = -_240;
        float _248 = fma(_216, _232, _246);
        float _250 = -_230;
        float _252 = _250 + 6.0;
        float _254 = _236 * _236;
        float _256 = _244 * 4.0;
        float _258 = -_208;
        float _260 = _200 + _258;
        float _262 = -_248;
        float _264 = _262 + _252;
        float _266 = 1.0 / _196;
        float _268 = -_256;
        float _270 = fma(_236, _254, _268);
        float _272 = -_260;
        float _274 = _272 + 1.0;
        float _276 = _264 * 0.16666667163372039794921875;
        float _278 = -_260;
        float _280 = _278 + 2.0;
        float _282 = -_244;
        float _284 = _282 + 6.0;
        float _286 = _274 * _274;
        float _288 = _230 + _248;
        float _290 = _280 * _280;
        float _292 = -_270;
        float _294 = _292 + _284;
        float _296 = _274 * _286;
        float _298 = -_224;
        float _300 = _206 + _298;
        float _302 = 1.0 / _276;
        float _304 = _294 * 0.16666667163372039794921875;
        float _306 = _296 * 4.0;
        float _308 = -_300;
        float _310 = _308 + 1.0;
        float _312 = -_296;
        float _314 = _312 + 6.0;
        float _316 = _288 * 0.16666667163372039794921875;
        float _318 = -_306;
        float _320 = fma(_280, _290, _318);
        float _322 = _310 * _310;
        float _324 = -_300;
        float _326 = _324 + 2.0;
        float _328 = 1.0 / _316;
        float _330 = -_320;
        float _332 = _330 + _314;
        float _334 = _310 * _322;
        float _336 = _204 * _204;
        float _338 = _326 * _326;
        float _340 = _332 * 0.16666667163372039794921875;
        float _342 = _334 * 4.0;
        float _344 = _244 + _270;
        float _346 = _204 * _336;
        float _348 = 1.0 / _304;
        float _350 = -_342;
        float _352 = fma(_326, _338, _350);
        float _354 = _344 * 0.16666667163372039794921875;
        float _356 = _192 + 1.5;
        float _358 = _346 * 0.16666667163372039794921875;
        float _360 = -_334;
        float _362 = _360 + 6.0;
        float _364 = _192 + (-0.5);
        float _366 = _220 * _220;
        float _368 = 1.0 / _354;
        float _370 = fma(_358, _302, _356);
        float _372 = _248 * 0.16666667163372039794921875;
        float _374 = -_352;
        float _376 = _374 + _362;
        float _378 = _220 * _366;
        float _380 = _296 + _320;
        float _382 = fma(_372, _328, _364);
        float _384 = _334 + _352;
        float _386 = 1.0 / _340;
        float _388 = _376 * 0.16666667163372039794921875;
        float _390 = _194 + (-0.5);
        float _392 = _380 * 0.16666667163372039794921875;
        float _394 = _384 * 0.16666667163372039794921875;
        float _396 = _270 * 0.16666667163372039794921875;
        float _398 = _208 + 1.5;
        float _400 = _352 * 0.16666667163372039794921875;
        float _402 = 1.0 / _388;
        float _404 = _194 + 1.5;
        float _406 = _378 * 0.16666667163372039794921875;
        float _408 = fma(_396, _368, _390);
        float _410 = _300 * _300;
        float _412 = _260 * _260;
        float _414 = fma(_406, _348, _404);
        float _416 = _382 * _186;
        float _418 = 1.0 / _392;
        float _420 = _300 * _410;
        float _422 = _260 * _412;
        float _424 = _208 + (-0.5);
        float _426 = _370 * _186;
        float _428 = _408 * _242;
        float _430 = _224 + 1.5;
        float _432 = _320 * 0.16666667163372039794921875;
        float _434 = 1.0 / _394;
        float _436 = _420 * 0.16666667163372039794921875;
        float _438 = _224 + (-0.5);
        float _440 = _422 * 0.16666667163372039794921875;
        float _442 = _414 * _242;
        float _444 = fma(_436, _402, _430);
        float _446 = fma(_440, _386, _398);
        float _448 = 1.0 / _198;
        float _450 = fma(_432, _418, _424);
        float _452 = _450 * _266;
        float _454 = _446 * _266;
        float _456 = fma(_400, _434, _438);
        float2 _1212 = float2(_416, _428);
        float3 _460 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1212, float2(0.0), isnan(_1212)), level(_138)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1212, float2(0.0), isnan(_1212)), level(_138)).xyz;
        float _462 = _460.x;
        float _464 = _460.y;
        float _466 = _460.z;
        float _468 = _456 * _448;
        float _470 = _444 * _448;
        float2 _1233 = float2(_426, _428);
        float3 _472 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1233, float2(0.0), isnan(_1233)), level(_138)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1233, float2(0.0), isnan(_1233)), level(_138)).xyz;
        float _474 = _472.x;
        float _476 = _472.y;
        float _478 = _472.z;
        float2 _1248 = float2(_416, _442);
        float3 _480 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1248, float2(0.0), isnan(_1248)), level(_138)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1248, float2(0.0), isnan(_1248)), level(_138)).xyz;
        float _482 = _480.x;
        float _484 = _480.y;
        float _486 = _480.z;
        float2 _1263 = float2(_426, _442);
        float3 _488 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1263, float2(0.0), isnan(_1263)), level(_138)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1263, float2(0.0), isnan(_1263)), level(_138)).xyz;
        float _490 = _488.x;
        float _492 = _488.y;
        float _494 = _488.z;
        float2 _1278 = float2(_452, _468);
        float3 _496 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1278, float2(0.0), isnan(_1278)), level(_144)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1278, float2(0.0), isnan(_1278)), level(_144)).xyz;
        float _498 = _496.x;
        float _500 = _496.y;
        float _502 = _496.z;
        float2 _1293 = float2(_454, _468);
        float3 _504 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1293, float2(0.0), isnan(_1293)), level(_144)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1293, float2(0.0), isnan(_1293)), level(_144)).xyz;
        float _506 = _504.x;
        float _508 = _504.y;
        float _510 = _504.z;
        float2 _1308 = float2(_452, _470);
        float3 _512 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1308, float2(0.0), isnan(_1308)), level(_144)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1308, float2(0.0), isnan(_1308)), level(_144)).xyz;
        float _514 = _512.x;
        float _516 = _512.y;
        float _518 = _512.z;
        float2 _1323 = float2(_454, _470);
        float3 _520 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1323, float2(0.0), isnan(_1323)), level(_144)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1323, float2(0.0), isnan(_1323)), level(_144)).xyz;
        float _522 = _520.x;
        float _524 = _520.y;
        float _526 = _520.z;
        float _528 = 0.0 + _130;
        float _530 = precise::clamp(_528, 0.0, 1.0);
        float _532 = fma(_112, _530, _110);
        float _534 = -_138;
        float _536 = _132 + _534;
        float _538 = precise::clamp(_536, 0.0, 1.0);
        float _540 = -_474;
        float _542 = _462 + _540;
        float _544 = -_476;
        float _546 = _464 + _544;
        float _548 = -_478;
        float _550 = _466 + _548;
        float _552 = fma(_316, _542, _474);
        float _554 = -_492;
        float _556 = _484 + _554;
        float _558 = -_490;
        float _560 = _482 + _558;
        float _562 = -_494;
        float _564 = _486 + _562;
        float _566 = fma(_316, _546, _476);
        float _568 = fma(_316, _556, _492);
        float _570 = -_506;
        float _572 = _498 + _570;
        float _574 = -_508;
        float _576 = _500 + _574;
        float _578 = -_510;
        float _580 = _502 + _578;
        float _582 = fma(_316, _550, _478);
        float _584 = fma(_392, _572, _506);
        float _586 = fma(_392, _576, _508);
        float _588 = -_522;
        float _590 = _514 + _588;
        float _592 = -_524;
        float _594 = _516 + _592;
        float _596 = -_526;
        float _598 = _518 + _596;
        float _600 = fma(_316, _560, _490);
        float _602 = fma(_392, _590, _522);
        float _604 = fma(_392, _594, _524);
        float _606 = fma(_316, _564, _494);
        float _608 = fma(_392, _580, _510);
        float _610 = fma(_392, _598, _526);
        float _612 = -_600;
        float _614 = _612 + _552;
        float _616 = -_568;
        float _618 = _616 + _566;
        float _620 = -_602;
        float _622 = _620 + _584;
        float _624 = -_604;
        float _626 = _624 + _586;
        float _628 = -_606;
        float _630 = _628 + _582;
        float _632 = -_610;
        float _634 = _632 + _608;
        float _636 = fma(_354, _614, _600);
        float _638 = fma(_354, _618, _568);
        float _640 = fma(_394, _622, _602);
        float _642 = fma(_394, _626, _604);
        float _644 = fma(_354, _630, _606);
        float _646 = fma(_394, _634, _610);
        float _648 = -_636;
        float _650 = _648 + _640;
        float _652 = -_638;
        float _654 = _652 + _642;
        float _656 = -_644;
        float _658 = _656 + _646;
        float _660 = fma(_538, _650, _636);
        float _662 = fma(_538, _654, _638);
        float _664 = fma(_538, _658, _644);
        out.m_36.x = _660;
        out.m_36.y = _662;
        out.m_36.z = _664;
        out.m_36.w = _532;
        return out;
    }
    discard_fragment();
    return out;
}

