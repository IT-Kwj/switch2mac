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
int _42(thread const int& _1515, thread const int& _1516, constant _10& support_buffer)
{
    int _1519 = 1 + _1516;
    float _1521 = support_buffer._m5[_1519].x;
    float _1523 = abs(_1521);
    bool _1525 = _1523 == 1.0;
    if (_1525)
    {
        return _1515;
    }
    float _1527 = float(_1515);
    float _1529 = _1527 / _1523;
    int _1531 = int(_1529);
    return _1531;
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
    float2 _690 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_690, float2(0.0), isnan(_690))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_690, float2(0.0), isnan(_690))).x;
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
    bool _106 = _102 != 0.0;
    bool _108 = isnan(_102);
    bool _110 = _106 || _108;
    bool _112 = isnan(0.0);
    bool _114 = _110 || _112;
    bool _116 = !_114;
    if (!_116)
    {
        float _118 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _120 = fma(_102, _118, 1.0);
        float _122 = log2(_120);
        float _124 = _122 + (-1.0);
        float _126 = trunc(_124);
        int _128 = int(_126);
        float _130 = float(_128);
        float _132 = trunc(_130);
        int _134 = int(_132);
        float _136 = _130 + 1.0;
        float _138 = trunc(_136);
        int _140 = int(_138);
        int _142 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_134), spvDescriptorSet0.fp_t_tcb_A.get_height(_134)).x;
        int _144 = _142;
        int _146 = 1;
        int _148 = _42(_144, _146, (*spvDescriptorSet0.support_buffer));
        int _150 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_134), spvDescriptorSet0.fp_t_tcb_A.get_height(_134)).y;
        int _152 = _150;
        int _154 = 1;
        int _156 = _42(_152, _154, (*spvDescriptorSet0.support_buffer));
        int _158 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_140), spvDescriptorSet0.fp_t_tcb_A.get_height(_140)).x;
        int _160 = _158;
        int _162 = 1;
        int _164 = _42(_160, _162, (*spvDescriptorSet0.support_buffer));
        int _166 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_140), spvDescriptorSet0.fp_t_tcb_A.get_height(_140)).y;
        int _168 = _166;
        int _170 = 1;
        int _172 = _42(_168, _170, (*spvDescriptorSet0.support_buffer));
        float _174 = float(_148);
        float _176 = float(_156);
        float _178 = 1.0 / _174;
        float _180 = fma(_62, _174, -0.5);
        float _182 = fma(_64, _176, -0.5);
        float _184 = floor(_180);
        float _186 = floor(_182);
        float _188 = float(_164);
        float _190 = float(_172);
        float _192 = fma(_62, _188, -0.5);
        float _194 = -_184;
        float _196 = _180 + _194;
        float _198 = fma(_64, _190, -0.5);
        float _200 = floor(_192);
        float _202 = -_196;
        float _204 = _202 + 1.0;
        float _206 = -_196;
        float _208 = _206 + 2.0;
        float _210 = -_186;
        float _212 = _182 + _210;
        float _214 = _204 * _204;
        float _216 = floor(_198);
        float _218 = -_212;
        float _220 = _218 + 1.0;
        float _222 = _204 * _214;
        float _224 = _208 * _208;
        float _226 = -_212;
        float _228 = _226 + 2.0;
        float _230 = _220 * _220;
        float _232 = _222 * 4.0;
        float _234 = 1.0 / _176;
        float _236 = _220 * _230;
        float _238 = -_232;
        float _240 = fma(_208, _224, _238);
        float _242 = -_222;
        float _244 = _242 + 6.0;
        float _246 = _228 * _228;
        float _248 = _236 * 4.0;
        float _250 = -_200;
        float _252 = _192 + _250;
        float _254 = -_240;
        float _256 = _254 + _244;
        float _258 = 1.0 / _188;
        float _260 = -_248;
        float _262 = fma(_228, _246, _260);
        float _264 = -_252;
        float _266 = _264 + 1.0;
        float _268 = _256 * 0.16666667163372039794921875;
        float _270 = -_252;
        float _272 = _270 + 2.0;
        float _274 = -_236;
        float _276 = _274 + 6.0;
        float _278 = _266 * _266;
        float _280 = _222 + _240;
        float _282 = _272 * _272;
        float _284 = -_262;
        float _286 = _284 + _276;
        float _288 = _266 * _278;
        float _290 = -_216;
        float _292 = _198 + _290;
        float _294 = 1.0 / _268;
        float _296 = _286 * 0.16666667163372039794921875;
        float _298 = _288 * 4.0;
        float _300 = -_292;
        float _302 = _300 + 1.0;
        float _304 = -_288;
        float _306 = _304 + 6.0;
        float _308 = _280 * 0.16666667163372039794921875;
        float _310 = -_298;
        float _312 = fma(_272, _282, _310);
        float _314 = _302 * _302;
        float _316 = -_292;
        float _318 = _316 + 2.0;
        float _320 = 1.0 / _308;
        float _322 = -_312;
        float _324 = _322 + _306;
        float _326 = _302 * _314;
        float _328 = _196 * _196;
        float _330 = _318 * _318;
        float _332 = _324 * 0.16666667163372039794921875;
        float _334 = _326 * 4.0;
        float _336 = _236 + _262;
        float _338 = _196 * _328;
        float _340 = 1.0 / _296;
        float _342 = -_334;
        float _344 = fma(_318, _330, _342);
        float _346 = _336 * 0.16666667163372039794921875;
        float _348 = _184 + 1.5;
        float _350 = _338 * 0.16666667163372039794921875;
        float _352 = -_326;
        float _354 = _352 + 6.0;
        float _356 = _184 + (-0.5);
        float _358 = _212 * _212;
        float _360 = 1.0 / _346;
        float _362 = fma(_350, _294, _348);
        float _364 = _240 * 0.16666667163372039794921875;
        float _366 = -_344;
        float _368 = _366 + _354;
        float _370 = _212 * _358;
        float _372 = _288 + _312;
        float _374 = fma(_364, _320, _356);
        float _376 = _326 + _344;
        float _378 = 1.0 / _332;
        float _380 = _368 * 0.16666667163372039794921875;
        float _382 = _186 + (-0.5);
        float _384 = _372 * 0.16666667163372039794921875;
        float _386 = _376 * 0.16666667163372039794921875;
        float _388 = _262 * 0.16666667163372039794921875;
        float _390 = _200 + 1.5;
        float _392 = _344 * 0.16666667163372039794921875;
        float _394 = 1.0 / _380;
        float _396 = _186 + 1.5;
        float _398 = _370 * 0.16666667163372039794921875;
        float _400 = fma(_388, _360, _382);
        float _402 = _292 * _292;
        float _404 = _252 * _252;
        float _406 = fma(_398, _340, _396);
        float _408 = _374 * _178;
        float _410 = 1.0 / _384;
        float _412 = _292 * _402;
        float _414 = _252 * _404;
        float _416 = _200 + (-0.5);
        float _418 = _362 * _178;
        float _420 = _400 * _234;
        float _422 = _216 + 1.5;
        float _424 = _312 * 0.16666667163372039794921875;
        float _426 = 1.0 / _386;
        float _428 = _412 * 0.16666667163372039794921875;
        float _430 = _216 + (-0.5);
        float _432 = _414 * 0.16666667163372039794921875;
        float _434 = _406 * _234;
        float _436 = fma(_428, _394, _422);
        float _438 = fma(_432, _378, _390);
        float _440 = 1.0 / _190;
        float _442 = fma(_424, _410, _416);
        float _444 = _442 * _258;
        float _446 = _438 * _258;
        float _448 = fma(_392, _426, _430);
        float2 _1178 = float2(_408, _420);
        float3 _452 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1178, float2(0.0), isnan(_1178)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1178, float2(0.0), isnan(_1178)), level(_130)).xyz;
        float _454 = _452.x;
        float _456 = _452.y;
        float _458 = _452.z;
        float _460 = _448 * _440;
        float _462 = _436 * _440;
        float2 _1199 = float2(_418, _420);
        float3 _464 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1199, float2(0.0), isnan(_1199)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1199, float2(0.0), isnan(_1199)), level(_130)).xyz;
        float _466 = _464.x;
        float _468 = _464.y;
        float _470 = _464.z;
        float2 _1214 = float2(_408, _434);
        float3 _472 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1214, float2(0.0), isnan(_1214)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1214, float2(0.0), isnan(_1214)), level(_130)).xyz;
        float _474 = _472.x;
        float _476 = _472.y;
        float _478 = _472.z;
        float2 _1229 = float2(_418, _434);
        float3 _480 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1229, float2(0.0), isnan(_1229)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1229, float2(0.0), isnan(_1229)), level(_130)).xyz;
        float _482 = _480.x;
        float _484 = _480.y;
        float _486 = _480.z;
        float2 _1244 = float2(_444, _460);
        float3 _488 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1244, float2(0.0), isnan(_1244)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1244, float2(0.0), isnan(_1244)), level(_136)).xyz;
        float _490 = _488.x;
        float _492 = _488.y;
        float _494 = _488.z;
        float2 _1259 = float2(_446, _460);
        float3 _496 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1259, float2(0.0), isnan(_1259)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1259, float2(0.0), isnan(_1259)), level(_136)).xyz;
        float _498 = _496.x;
        float _500 = _496.y;
        float _502 = _496.z;
        float2 _1274 = float2(_444, _462);
        float3 _504 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1274, float2(0.0), isnan(_1274)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1274, float2(0.0), isnan(_1274)), level(_136)).xyz;
        float _506 = _504.x;
        float _508 = _504.y;
        float _510 = _504.z;
        float2 _1289 = float2(_446, _462);
        float3 _512 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1289, float2(0.0), isnan(_1289)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1289, float2(0.0), isnan(_1289)), level(_136)).xyz;
        float _514 = _512.x;
        float _516 = _512.y;
        float _518 = _512.z;
        float _520 = 0.0 + _122;
        float _522 = precise::clamp(_520, 0.0, 1.0);
        float _524 = fma(_88, _522, _86);
        float _526 = -_130;
        float _528 = _124 + _526;
        float _530 = precise::clamp(_528, 0.0, 1.0);
        float _532 = -_466;
        float _534 = _454 + _532;
        float _536 = -_468;
        float _538 = _456 + _536;
        float _540 = -_470;
        float _542 = _458 + _540;
        float _544 = fma(_308, _534, _466);
        float _546 = -_484;
        float _548 = _476 + _546;
        float _550 = -_482;
        float _552 = _474 + _550;
        float _554 = -_486;
        float _556 = _478 + _554;
        float _558 = fma(_308, _538, _468);
        float _560 = fma(_308, _548, _484);
        float _562 = -_498;
        float _564 = _490 + _562;
        float _566 = -_500;
        float _568 = _492 + _566;
        float _570 = -_502;
        float _572 = _494 + _570;
        float _574 = fma(_308, _542, _470);
        float _576 = fma(_384, _564, _498);
        float _578 = fma(_384, _568, _500);
        float _580 = -_514;
        float _582 = _506 + _580;
        float _584 = -_516;
        float _586 = _508 + _584;
        float _588 = -_518;
        float _590 = _510 + _588;
        float _592 = fma(_308, _552, _482);
        float _594 = fma(_384, _582, _514);
        float _596 = fma(_384, _586, _516);
        float _598 = fma(_308, _556, _486);
        float _600 = fma(_384, _572, _502);
        float _602 = fma(_384, _590, _518);
        float _604 = -_592;
        float _606 = _604 + _544;
        float _608 = -_560;
        float _610 = _608 + _558;
        float _612 = -_594;
        float _614 = _612 + _576;
        float _616 = -_596;
        float _618 = _616 + _578;
        float _620 = -_598;
        float _622 = _620 + _574;
        float _624 = -_602;
        float _626 = _624 + _600;
        float _628 = fma(_346, _606, _592);
        float _630 = fma(_346, _610, _560);
        float _632 = fma(_386, _614, _594);
        float _634 = fma(_386, _618, _596);
        float _636 = fma(_346, _622, _598);
        float _638 = fma(_386, _626, _602);
        float _640 = -_628;
        float _642 = _640 + _632;
        float _644 = -_630;
        float _646 = _644 + _634;
        float _648 = -_636;
        float _650 = _648 + _638;
        float _652 = fma(_530, _642, _628);
        float _654 = fma(_530, _646, _630);
        float _656 = fma(_530, _650, _636);
        out.m_36.x = _652;
        out.m_36.y = _654;
        out.m_36.z = _656;
        out.m_36.w = _524;
        return out;
    }
    discard_fragment();
    return out;
}

