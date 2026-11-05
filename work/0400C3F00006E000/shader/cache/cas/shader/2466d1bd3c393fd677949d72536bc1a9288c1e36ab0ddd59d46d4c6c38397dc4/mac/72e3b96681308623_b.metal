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
int _46(thread const int& _1516, thread const int& _1517, constant _10& support_buffer)
{
    int _1520 = 1 + _1517;
    float _1522 = support_buffer._m5[_1520].x;
    float _1524 = abs(_1522);
    bool _1526 = _1524 == 1.0;
    if (_1526)
    {
        return _1516;
    }
    float _1528 = float(_1516);
    float _1530 = _1528 / _1524;
    int _1532 = int(_1530);
    return _1532;
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
    float2 _692 = float2(_66, _68);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_692, float2(0.0), isnan(_692))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_692, float2(0.0), isnan(_692))).x;
    float2 _703 = float2(_66, _68);
    float _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_703, float2(0.0), isnan(_703))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_703, float2(0.0), isnan(_703))).x;
    float _74 = in.m_35.x;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_37.x;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = _64 * _78;
    float _88 = _64 * _84;
    float _90 = -_70;
    float _92 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _94 = 1.0 / _92;
    float _96 = fma(_86, _94, _88);
    float _98 = precise::clamp(_96, 0.0, 1.0);
    bool _102 = _94 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    bool _104 = !_102;
    float _106 = _104 ? _98 : 0.0;
    float _108 = precise::max(_72, _106);
    bool _110 = _108 != 0.0;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan(0.0);
    bool _118 = _114 || _116;
    bool _120 = !_118;
    if (!_120)
    {
        float _122 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _124 = fma(_108, _122, 1.0);
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
        int _150 = 2;
        int _152 = _46(_148, _150, (*spvDescriptorSet0.support_buffer));
        int _154 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_138), spvDescriptorSet0.fp_t_tcb_A.get_height(_138)).y;
        int _156 = _154;
        int _158 = 2;
        int _160 = _46(_156, _158, (*spvDescriptorSet0.support_buffer));
        int _162 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_144), spvDescriptorSet0.fp_t_tcb_A.get_height(_144)).x;
        int _164 = _162;
        int _166 = 2;
        int _168 = _46(_164, _166, (*spvDescriptorSet0.support_buffer));
        int _170 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_144), spvDescriptorSet0.fp_t_tcb_A.get_height(_144)).y;
        int _172 = _170;
        int _174 = 2;
        int _176 = _46(_172, _174, (*spvDescriptorSet0.support_buffer));
        float _178 = float(_152);
        float _180 = float(_160);
        float _182 = 1.0 / _178;
        float _184 = fma(_66, _178, -0.5);
        float _186 = fma(_68, _180, -0.5);
        float _188 = floor(_184);
        float _190 = float(_168);
        float _192 = fma(_66, _190, -0.5);
        float _194 = float(_176);
        float _196 = floor(_186);
        float _198 = fma(_68, _194, -0.5);
        float _200 = -_188;
        float _202 = _184 + _200;
        float _204 = floor(_192);
        float _206 = -_202;
        float _208 = _206 + 1.0;
        float _210 = -_202;
        float _212 = _210 + 2.0;
        float _214 = _208 * _208;
        float _216 = -_196;
        float _218 = _186 + _216;
        float _220 = floor(_198);
        float _222 = _208 * _214;
        float _224 = -_218;
        float _226 = _224 + 1.0;
        float _228 = _212 * _212;
        float _230 = -_218;
        float _232 = _230 + 2.0;
        float _234 = _222 * 4.0;
        float _236 = _226 * _226;
        float _238 = 1.0 / _180;
        float _240 = -_234;
        float _242 = fma(_212, _228, _240);
        float _244 = -_222;
        float _246 = _244 + 6.0;
        float _248 = _226 * _236;
        float _250 = _232 * _232;
        float _252 = -_242;
        float _254 = _252 + _246;
        float _256 = _248 * 4.0;
        float _258 = 1.0 / _190;
        float _260 = _254 * 0.16666667163372039794921875;
        float _262 = -_204;
        float _264 = _192 + _262;
        float _266 = -_256;
        float _268 = fma(_232, _250, _266);
        float _270 = -_220;
        float _272 = _198 + _270;
        float _274 = -_248;
        float _276 = _274 + 6.0;
        float _278 = -_264;
        float _280 = _278 + 1.0;
        float _282 = -_264;
        float _284 = _282 + 2.0;
        float _286 = -_272;
        float _288 = _286 + 1.0;
        float _290 = -_268;
        float _292 = _290 + _276;
        float _294 = _280 * _280;
        float _296 = _284 * _284;
        float _298 = -_272;
        float _300 = _298 + 2.0;
        float _302 = _292 * 0.16666667163372039794921875;
        float _304 = _280 * _294;
        float _306 = _288 * _288;
        float _308 = _222 + _242;
        float _310 = 1.0 / _260;
        float _312 = _304 * 4.0;
        float _314 = _288 * _306;
        float _316 = _248 + _268;
        float _318 = -_304;
        float _320 = _318 + 6.0;
        float _322 = -_312;
        float _324 = fma(_284, _296, _322);
        float _326 = _300 * _300;
        float _328 = _314 * 4.0;
        float _330 = _308 * 0.16666667163372039794921875;
        float _332 = -_324;
        float _334 = _332 + _320;
        float _336 = -_314;
        float _338 = _336 + 6.0;
        float _340 = -_328;
        float _342 = fma(_300, _326, _340);
        float _344 = _202 * _202;
        float _346 = 1.0 / _330;
        float _348 = _316 * 0.16666667163372039794921875;
        float _350 = -_342;
        float _352 = _350 + _338;
        float _354 = _202 * _344;
        float _356 = _188 + 1.5;
        float _358 = _314 + _342;
        float _360 = _352 * 0.16666667163372039794921875;
        float _362 = _354 * 0.16666667163372039794921875;
        float _364 = 1.0 / _348;
        float _366 = _304 + _324;
        float _368 = _218 * _218;
        float _370 = fma(_362, _310, _356);
        float _372 = _188 + (-0.5);
        float _374 = _366 * 0.16666667163372039794921875;
        float _376 = _196 + (-0.5);
        float _378 = _196 + 1.5;
        float _380 = 1.0 / _302;
        float _382 = _242 * 0.16666667163372039794921875;
        float _384 = _268 * 0.16666667163372039794921875;
        float _386 = _358 * 0.16666667163372039794921875;
        float _388 = _334 * 0.16666667163372039794921875;
        float _390 = _218 * _368;
        float _392 = fma(_382, _346, _372);
        float _394 = _272 * _272;
        float _396 = 1.0 / _360;
        float _398 = _390 * 0.16666667163372039794921875;
        float _400 = fma(_384, _364, _376);
        float _402 = _392 * _182;
        float _404 = _370 * _182;
        float _406 = _264 * _264;
        float _408 = _272 * _394;
        float _410 = _400 * _238;
        float _412 = 1.0 / _386;
        float _414 = fma(_398, _380, _378);
        float _416 = _264 * _406;
        float _418 = _204 + (-0.5);
        float _420 = _220 + (-0.5);
        float _422 = _414 * _238;
        float _424 = _204 + 1.5;
        float _426 = _220 + 1.5;
        float _428 = 1.0 / _388;
        float _430 = _342 * 0.16666667163372039794921875;
        float _432 = _408 * 0.16666667163372039794921875;
        float _434 = _416 * 0.16666667163372039794921875;
        float _436 = _324 * 0.16666667163372039794921875;
        float _438 = fma(_432, _396, _426);
        float _440 = 1.0 / _194;
        float _442 = fma(_430, _412, _420);
        float _444 = 1.0 / _374;
        float _446 = fma(_434, _428, _424);
        float _448 = _446 * _258;
        float _450 = _442 * _440;
        float _452 = _438 * _440;
        float2 _1182 = float2(_402, _410);
        float3 _456 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1182, float2(0.0), isnan(_1182)), level(_134)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1182, float2(0.0), isnan(_1182)), level(_134)).xyz;
        float _458 = _456.x;
        float _460 = _456.y;
        float _462 = _456.z;
        float _464 = fma(_436, _444, _418);
        float2 _1201 = float2(_404, _410);
        float3 _466 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1201, float2(0.0), isnan(_1201)), level(_134)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1201, float2(0.0), isnan(_1201)), level(_134)).xyz;
        float _468 = _466.x;
        float _470 = _466.y;
        float _472 = _466.z;
        float2 _1216 = float2(_402, _422);
        float3 _474 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1216, float2(0.0), isnan(_1216)), level(_134)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1216, float2(0.0), isnan(_1216)), level(_134)).xyz;
        float _476 = _474.x;
        float _478 = _474.y;
        float _480 = _474.z;
        float2 _1231 = float2(_404, _422);
        float3 _482 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1231, float2(0.0), isnan(_1231)), level(_134)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1231, float2(0.0), isnan(_1231)), level(_134)).xyz;
        float _484 = _482.x;
        float _486 = _482.y;
        float _488 = _482.z;
        float _490 = _464 * _258;
        float2 _1249 = float2(_490, _450);
        float3 _492 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1249, float2(0.0), isnan(_1249)), level(_140)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1249, float2(0.0), isnan(_1249)), level(_140)).xyz;
        float _494 = _492.x;
        float _496 = _492.y;
        float _498 = _492.z;
        float2 _1264 = float2(_448, _450);
        float3 _500 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1264, float2(0.0), isnan(_1264)), level(_140)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1264, float2(0.0), isnan(_1264)), level(_140)).xyz;
        float _502 = _500.x;
        float _504 = _500.y;
        float _506 = _500.z;
        float2 _1279 = float2(_490, _452);
        float3 _508 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1279, float2(0.0), isnan(_1279)), level(_140)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1279, float2(0.0), isnan(_1279)), level(_140)).xyz;
        float _510 = _508.x;
        float _512 = _508.y;
        float _514 = _508.z;
        float2 _1294 = float2(_448, _452);
        float3 _516 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1294, float2(0.0), isnan(_1294)), level(_140)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1294, float2(0.0), isnan(_1294)), level(_140)).xyz;
        float _518 = _516.x;
        float _520 = _516.y;
        float _522 = _516.z;
        float _524 = -_134;
        float _526 = _128 + _524;
        float _528 = precise::clamp(_526, 0.0, 1.0);
        float _530 = 0.0 + _126;
        float _532 = precise::clamp(_530, 0.0, 1.0);
        float _534 = -_468;
        float _536 = _458 + _534;
        float _538 = -_470;
        float _540 = _460 + _538;
        float _542 = -_486;
        float _544 = _478 + _542;
        float _546 = -_484;
        float _548 = _476 + _546;
        float _550 = fma(_330, _536, _468);
        float _552 = fma(_330, _540, _470);
        float _554 = fma(_330, _544, _486);
        float _556 = -_472;
        float _558 = _462 + _556;
        float _560 = -_488;
        float _562 = _480 + _560;
        float _564 = fma(_330, _548, _484);
        float _566 = -_554;
        float _568 = _566 + _552;
        float _570 = fma(_330, _558, _472);
        float _572 = -_504;
        float _574 = _496 + _572;
        float _576 = -_502;
        float _578 = _494 + _576;
        float _580 = fma(_348, _568, _554);
        float _582 = -_506;
        float _584 = _498 + _582;
        float _586 = fma(_374, _574, _504);
        float _588 = -_518;
        float _590 = _510 + _588;
        float _592 = -_520;
        float _594 = _512 + _592;
        float _596 = -_522;
        float _598 = _514 + _596;
        float _600 = fma(_330, _562, _488);
        float _602 = fma(_374, _578, _502);
        float _604 = fma(_374, _590, _518);
        float _606 = fma(_374, _594, _520);
        float _608 = fma(_374, _584, _506);
        float _610 = fma(_374, _598, _522);
        float _612 = -_600;
        float _614 = _612 + _570;
        float _616 = -_564;
        float _618 = _616 + _550;
        float _620 = -_604;
        float _622 = _620 + _602;
        float _624 = -_606;
        float _626 = _624 + _586;
        float _628 = -_610;
        float _630 = _628 + _608;
        float _632 = fma(_348, _614, _600);
        float _634 = fma(_348, _618, _564);
        float _636 = fma(_386, _622, _604);
        float _638 = fma(_386, _626, _606);
        float _640 = fma(_386, _630, _610);
        float _642 = -_634;
        float _644 = _642 + _636;
        float _646 = -_580;
        float _648 = _646 + _638;
        float _650 = -_632;
        float _652 = _650 + _640;
        float _654 = fma(_528, _644, _634);
        float _656 = fma(_528, _648, _580);
        float _658 = fma(_528, _652, _632);
        out.m_40.x = _654;
        out.m_40.y = _656;
        out.m_40.z = _658;
        out.m_40.w = _532;
        return out;
    }
    discard_fragment();
    return out;
}

