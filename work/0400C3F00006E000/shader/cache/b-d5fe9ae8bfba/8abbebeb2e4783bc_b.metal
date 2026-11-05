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
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
};

static inline __attribute__((always_inline))
int _46(thread const int& _1499, thread const int& _1500, constant _10& support_buffer)
{
    int _1503 = 1 + _1500;
    float _1505 = support_buffer._m5[_1503].x;
    float _1507 = abs(_1505);
    bool _1509 = _1507 == 1.0;
    if (_1509)
    {
        return _1499;
    }
    float _1511 = float(_1499);
    float _1513 = _1511 / _1507;
    int _1515 = int(_1513);
    return _1515;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _50 = gl_FragCoord.w;
    float _52 = in.m_33.x;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = in.m_33.y;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = 1.0 / _50;
    float _66 = _64 * _56;
    float _68 = _64 * _62;
    float2 _686 = float2(_66, _68);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_686, float2(0.0), isnan(_686))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_686, float2(0.0), isnan(_686))).x;
    float2 _697 = float2(_66, _68);
    float _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_697, float2(0.0), isnan(_697))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_697, float2(0.0), isnan(_697))).x;
    float _74 = in.m_35.x;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_37.x;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = _64 * _78;
    float _88 = _64 * _84;
    float _90 = fma(_70, _86, _88);
    float _92 = precise::clamp(_90, 0.0, 1.0);
    bool _96 = _70 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    bool _98 = !_96;
    float _100 = _98 ? _92 : 0.0;
    float _102 = precise::max(_72, _100);
    bool _104 = _102 != 0.0;
    bool _106 = isnan(_102);
    bool _108 = _104 || _106;
    bool _110 = isnan(0.0);
    bool _112 = _108 || _110;
    bool _114 = !_112;
    if (!_114)
    {
        float _116 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _118 = fma(_102, _116, 1.0);
        float _120 = log2(_118);
        float _122 = _120 + (-1.0);
        float _124 = trunc(_122);
        int _126 = int(_124);
        float _128 = float(_126);
        float _130 = trunc(_128);
        int _132 = int(_130);
        float _134 = _128 + 1.0;
        float _136 = trunc(_134);
        int _138 = int(_136);
        int _140 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_132), spvDescriptorSet0.fp_t_tcb_A.get_height(_132)).x;
        int _142 = _140;
        int _144 = 2;
        int _146 = _46(_142, _144, (*spvDescriptorSet0.support_buffer));
        int _148 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_132), spvDescriptorSet0.fp_t_tcb_A.get_height(_132)).y;
        int _150 = _148;
        int _152 = 2;
        int _154 = _46(_150, _152, (*spvDescriptorSet0.support_buffer));
        int _156 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_138), spvDescriptorSet0.fp_t_tcb_A.get_height(_138)).x;
        int _158 = _156;
        int _160 = 2;
        int _162 = _46(_158, _160, (*spvDescriptorSet0.support_buffer));
        int _164 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_138), spvDescriptorSet0.fp_t_tcb_A.get_height(_138)).y;
        int _166 = _164;
        int _168 = 2;
        int _170 = _46(_166, _168, (*spvDescriptorSet0.support_buffer));
        float _172 = float(_146);
        float _174 = float(_154);
        float _176 = 1.0 / _172;
        float _178 = fma(_66, _172, -0.5);
        float _180 = fma(_68, _174, -0.5);
        float _182 = floor(_178);
        float _184 = float(_162);
        float _186 = fma(_66, _184, -0.5);
        float _188 = float(_170);
        float _190 = floor(_180);
        float _192 = fma(_68, _188, -0.5);
        float _194 = -_182;
        float _196 = _178 + _194;
        float _198 = floor(_186);
        float _200 = -_196;
        float _202 = _200 + 1.0;
        float _204 = -_196;
        float _206 = _204 + 2.0;
        float _208 = _202 * _202;
        float _210 = -_190;
        float _212 = _180 + _210;
        float _214 = floor(_192);
        float _216 = _202 * _208;
        float _218 = -_212;
        float _220 = _218 + 1.0;
        float _222 = _206 * _206;
        float _224 = -_212;
        float _226 = _224 + 2.0;
        float _228 = _216 * 4.0;
        float _230 = _220 * _220;
        float _232 = 1.0 / _174;
        float _234 = -_228;
        float _236 = fma(_206, _222, _234);
        float _238 = -_216;
        float _240 = _238 + 6.0;
        float _242 = _220 * _230;
        float _244 = _226 * _226;
        float _246 = -_236;
        float _248 = _246 + _240;
        float _250 = _242 * 4.0;
        float _252 = 1.0 / _184;
        float _254 = _248 * 0.16666667163372039794921875;
        float _256 = -_198;
        float _258 = _186 + _256;
        float _260 = -_250;
        float _262 = fma(_226, _244, _260);
        float _264 = -_214;
        float _266 = _192 + _264;
        float _268 = -_242;
        float _270 = _268 + 6.0;
        float _272 = -_258;
        float _274 = _272 + 1.0;
        float _276 = -_258;
        float _278 = _276 + 2.0;
        float _280 = -_266;
        float _282 = _280 + 1.0;
        float _284 = -_262;
        float _286 = _284 + _270;
        float _288 = _274 * _274;
        float _290 = _278 * _278;
        float _292 = -_266;
        float _294 = _292 + 2.0;
        float _296 = _286 * 0.16666667163372039794921875;
        float _298 = _274 * _288;
        float _300 = _282 * _282;
        float _302 = _216 + _236;
        float _304 = 1.0 / _254;
        float _306 = _298 * 4.0;
        float _308 = _282 * _300;
        float _310 = _242 + _262;
        float _312 = -_298;
        float _314 = _312 + 6.0;
        float _316 = -_306;
        float _318 = fma(_278, _290, _316);
        float _320 = _294 * _294;
        float _322 = _308 * 4.0;
        float _324 = _302 * 0.16666667163372039794921875;
        float _326 = -_318;
        float _328 = _326 + _314;
        float _330 = -_308;
        float _332 = _330 + 6.0;
        float _334 = -_322;
        float _336 = fma(_294, _320, _334);
        float _338 = _196 * _196;
        float _340 = 1.0 / _324;
        float _342 = _310 * 0.16666667163372039794921875;
        float _344 = -_336;
        float _346 = _344 + _332;
        float _348 = _196 * _338;
        float _350 = _182 + 1.5;
        float _352 = _308 + _336;
        float _354 = _346 * 0.16666667163372039794921875;
        float _356 = _348 * 0.16666667163372039794921875;
        float _358 = 1.0 / _342;
        float _360 = _298 + _318;
        float _362 = _212 * _212;
        float _364 = fma(_356, _304, _350);
        float _366 = _182 + (-0.5);
        float _368 = _360 * 0.16666667163372039794921875;
        float _370 = _190 + (-0.5);
        float _372 = _190 + 1.5;
        float _374 = 1.0 / _296;
        float _376 = _236 * 0.16666667163372039794921875;
        float _378 = _262 * 0.16666667163372039794921875;
        float _380 = _352 * 0.16666667163372039794921875;
        float _382 = _328 * 0.16666667163372039794921875;
        float _384 = _212 * _362;
        float _386 = fma(_376, _340, _366);
        float _388 = _266 * _266;
        float _390 = 1.0 / _354;
        float _392 = _384 * 0.16666667163372039794921875;
        float _394 = fma(_378, _358, _370);
        float _396 = _386 * _176;
        float _398 = _364 * _176;
        float _400 = _258 * _258;
        float _402 = _266 * _388;
        float _404 = _394 * _232;
        float _406 = 1.0 / _380;
        float _408 = fma(_392, _374, _372);
        float _410 = _258 * _400;
        float _412 = _198 + (-0.5);
        float _414 = _214 + (-0.5);
        float _416 = _408 * _232;
        float _418 = _198 + 1.5;
        float _420 = _214 + 1.5;
        float _422 = 1.0 / _382;
        float _424 = _336 * 0.16666667163372039794921875;
        float _426 = _402 * 0.16666667163372039794921875;
        float _428 = _410 * 0.16666667163372039794921875;
        float _430 = _318 * 0.16666667163372039794921875;
        float _432 = fma(_426, _390, _420);
        float _434 = 1.0 / _188;
        float _436 = fma(_424, _406, _414);
        float _438 = 1.0 / _368;
        float _440 = fma(_428, _422, _418);
        float _442 = _440 * _252;
        float _444 = _436 * _434;
        float _446 = _432 * _434;
        float2 _1165 = float2(_396, _404);
        float3 _450 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1165, float2(0.0), isnan(_1165)), level(_128)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1165, float2(0.0), isnan(_1165)), level(_128)).xyz;
        float _452 = _450.x;
        float _454 = _450.y;
        float _456 = _450.z;
        float _458 = fma(_430, _438, _412);
        float2 _1184 = float2(_398, _404);
        float3 _460 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1184, float2(0.0), isnan(_1184)), level(_128)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1184, float2(0.0), isnan(_1184)), level(_128)).xyz;
        float _462 = _460.x;
        float _464 = _460.y;
        float _466 = _460.z;
        float2 _1199 = float2(_396, _416);
        float3 _468 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1199, float2(0.0), isnan(_1199)), level(_128)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1199, float2(0.0), isnan(_1199)), level(_128)).xyz;
        float _470 = _468.x;
        float _472 = _468.y;
        float _474 = _468.z;
        float2 _1214 = float2(_398, _416);
        float3 _476 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1214, float2(0.0), isnan(_1214)), level(_128)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1214, float2(0.0), isnan(_1214)), level(_128)).xyz;
        float _478 = _476.x;
        float _480 = _476.y;
        float _482 = _476.z;
        float _484 = _458 * _252;
        float2 _1232 = float2(_484, _444);
        float3 _486 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1232, float2(0.0), isnan(_1232)), level(_134)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1232, float2(0.0), isnan(_1232)), level(_134)).xyz;
        float _488 = _486.x;
        float _490 = _486.y;
        float _492 = _486.z;
        float2 _1247 = float2(_442, _444);
        float3 _494 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1247, float2(0.0), isnan(_1247)), level(_134)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1247, float2(0.0), isnan(_1247)), level(_134)).xyz;
        float _496 = _494.x;
        float _498 = _494.y;
        float _500 = _494.z;
        float2 _1262 = float2(_484, _446);
        float3 _502 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1262, float2(0.0), isnan(_1262)), level(_134)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1262, float2(0.0), isnan(_1262)), level(_134)).xyz;
        float _504 = _502.x;
        float _506 = _502.y;
        float _508 = _502.z;
        float2 _1277 = float2(_442, _446);
        float3 _510 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1277, float2(0.0), isnan(_1277)), level(_134)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1277, float2(0.0), isnan(_1277)), level(_134)).xyz;
        float _512 = _510.x;
        float _514 = _510.y;
        float _516 = _510.z;
        float _518 = -_128;
        float _520 = _122 + _518;
        float _522 = precise::clamp(_520, 0.0, 1.0);
        float _524 = 0.0 + _120;
        float _526 = precise::clamp(_524, 0.0, 1.0);
        float _528 = -_462;
        float _530 = _452 + _528;
        float _532 = -_464;
        float _534 = _454 + _532;
        float _536 = -_480;
        float _538 = _472 + _536;
        float _540 = -_478;
        float _542 = _470 + _540;
        float _544 = fma(_324, _530, _462);
        float _546 = fma(_324, _534, _464);
        float _548 = fma(_324, _538, _480);
        float _550 = -_466;
        float _552 = _456 + _550;
        float _554 = -_482;
        float _556 = _474 + _554;
        float _558 = fma(_324, _542, _478);
        float _560 = -_548;
        float _562 = _560 + _546;
        float _564 = fma(_324, _552, _466);
        float _566 = -_498;
        float _568 = _490 + _566;
        float _570 = -_496;
        float _572 = _488 + _570;
        float _574 = fma(_342, _562, _548);
        float _576 = -_500;
        float _578 = _492 + _576;
        float _580 = fma(_368, _568, _498);
        float _582 = -_512;
        float _584 = _504 + _582;
        float _586 = -_514;
        float _588 = _506 + _586;
        float _590 = -_516;
        float _592 = _508 + _590;
        float _594 = fma(_324, _556, _482);
        float _596 = fma(_368, _572, _496);
        float _598 = fma(_368, _584, _512);
        float _600 = fma(_368, _588, _514);
        float _602 = fma(_368, _578, _500);
        float _604 = fma(_368, _592, _516);
        float _606 = -_594;
        float _608 = _606 + _564;
        float _610 = -_558;
        float _612 = _610 + _544;
        float _614 = -_598;
        float _616 = _614 + _596;
        float _618 = -_600;
        float _620 = _618 + _580;
        float _622 = -_604;
        float _624 = _622 + _602;
        float _626 = fma(_342, _608, _594);
        float _628 = fma(_342, _612, _558);
        float _630 = fma(_380, _616, _598);
        float _632 = fma(_380, _620, _600);
        float _634 = fma(_380, _624, _604);
        float _636 = -_628;
        float _638 = _636 + _630;
        float _640 = -_574;
        float _642 = _640 + _632;
        float _644 = -_626;
        float _646 = _644 + _634;
        float _648 = fma(_522, _638, _628);
        float _650 = fma(_522, _642, _574);
        float _652 = fma(_522, _646, _626);
        out.m_40.x = _648;
        out.m_40.y = _650;
        out.m_40.z = _652;
        out.m_40.w = _526;
        return out;
    }
    discard_fragment();
    return out;
}

