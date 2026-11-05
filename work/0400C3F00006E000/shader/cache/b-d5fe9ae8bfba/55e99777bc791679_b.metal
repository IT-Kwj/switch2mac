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
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
    float4 m_31 [[user(locn2)]];
};

static inline __attribute__((always_inline))
int _44(thread const int& _1550, thread const int& _1551, constant _10& support_buffer)
{
    int _1554 = 1 + _1551;
    float _1556 = support_buffer._m5[_1554].x;
    float _1558 = abs(_1556);
    bool _1560 = _1558 == 1.0;
    if (_1560)
    {
        return _1550;
    }
    float _1562 = float(_1550);
    float _1564 = _1562 / _1558;
    int _1566 = int(_1564);
    return _1566;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _48 = gl_FragCoord.w;
    float _50 = in.m_31.x;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_31.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = 1.0 / _48;
    float _64 = _62 * _54;
    float _66 = _62 * _60;
    float2 _708 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_708, float2(0.0), isnan(_708))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_708, float2(0.0), isnan(_708))).x;
    float _70 = in.m_33.x;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_35.x;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_33.y;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_35.y;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = _62 * _74;
    float _96 = _62 * _80;
    float _98 = _62 * _86;
    float _100 = _62 * _92;
    float _102 = -_68;
    float _104 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _106 = 1.0 / _104;
    float _108 = fma(_94, _106, _96);
    float _110 = precise::clamp(_108, 0.0, 1.0);
    bool _114 = _106 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _116 = fma(_98, _106, _100);
    float _118 = precise::clamp(_116, 0.0, 1.0);
    bool _120 = !_114;
    float _122 = _120 ? _110 : 0.0;
    float _124 = precise::max(_122, _118);
    bool _126 = _124 != 0.0;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan(0.0);
    bool _134 = _130 || _132;
    bool _136 = !_134;
    if (!_136)
    {
        float _138 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _140 = fma(_124, _138, 1.0);
        float _142 = log2(_140);
        float _144 = _142 + (-1.0);
        float _146 = trunc(_144);
        int _148 = int(_146);
        float _150 = float(_148);
        float _152 = trunc(_150);
        int _154 = int(_152);
        float _156 = _150 + 1.0;
        float _158 = trunc(_156);
        int _160 = int(_158);
        int _162 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_154), spvDescriptorSet0.fp_t_tcb_A.get_height(_154)).x;
        int _164 = _162;
        int _166 = 1;
        int _168 = _44(_164, _166, (*spvDescriptorSet0.support_buffer));
        int _170 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_154), spvDescriptorSet0.fp_t_tcb_A.get_height(_154)).y;
        int _172 = _170;
        int _174 = 1;
        int _176 = _44(_172, _174, (*spvDescriptorSet0.support_buffer));
        int _178 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_160), spvDescriptorSet0.fp_t_tcb_A.get_height(_160)).x;
        int _180 = _178;
        int _182 = 1;
        int _184 = _44(_180, _182, (*spvDescriptorSet0.support_buffer));
        int _186 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_160), spvDescriptorSet0.fp_t_tcb_A.get_height(_160)).y;
        int _188 = _186;
        int _190 = 1;
        int _192 = _44(_188, _190, (*spvDescriptorSet0.support_buffer));
        float _194 = float(_168);
        float _196 = float(_176);
        float _198 = 1.0 / _194;
        float _200 = fma(_64, _194, -0.5);
        float _202 = fma(_66, _196, -0.5);
        float _204 = floor(_200);
        float _206 = float(_184);
        float _208 = fma(_64, _206, -0.5);
        float _210 = float(_192);
        float _212 = floor(_202);
        float _214 = fma(_66, _210, -0.5);
        float _216 = -_204;
        float _218 = _200 + _216;
        float _220 = floor(_208);
        float _222 = -_218;
        float _224 = _222 + 1.0;
        float _226 = -_218;
        float _228 = _226 + 2.0;
        float _230 = _224 * _224;
        float _232 = -_212;
        float _234 = _202 + _232;
        float _236 = floor(_214);
        float _238 = _224 * _230;
        float _240 = -_234;
        float _242 = _240 + 1.0;
        float _244 = _228 * _228;
        float _246 = -_234;
        float _248 = _246 + 2.0;
        float _250 = _238 * 4.0;
        float _252 = _242 * _242;
        float _254 = 1.0 / _196;
        float _256 = -_250;
        float _258 = fma(_228, _244, _256);
        float _260 = -_238;
        float _262 = _260 + 6.0;
        float _264 = _242 * _252;
        float _266 = _248 * _248;
        float _268 = -_258;
        float _270 = _268 + _262;
        float _272 = _264 * 4.0;
        float _274 = 1.0 / _206;
        float _276 = _270 * 0.16666667163372039794921875;
        float _278 = -_220;
        float _280 = _208 + _278;
        float _282 = -_272;
        float _284 = fma(_248, _266, _282);
        float _286 = -_236;
        float _288 = _214 + _286;
        float _290 = -_264;
        float _292 = _290 + 6.0;
        float _294 = -_280;
        float _296 = _294 + 1.0;
        float _298 = -_280;
        float _300 = _298 + 2.0;
        float _302 = -_288;
        float _304 = _302 + 1.0;
        float _306 = -_284;
        float _308 = _306 + _292;
        float _310 = _296 * _296;
        float _312 = _300 * _300;
        float _314 = -_288;
        float _316 = _314 + 2.0;
        float _318 = _308 * 0.16666667163372039794921875;
        float _320 = _296 * _310;
        float _322 = _304 * _304;
        float _324 = _238 + _258;
        float _326 = 1.0 / _276;
        float _328 = _320 * 4.0;
        float _330 = _304 * _322;
        float _332 = _264 + _284;
        float _334 = -_320;
        float _336 = _334 + 6.0;
        float _338 = -_328;
        float _340 = fma(_300, _312, _338);
        float _342 = _316 * _316;
        float _344 = _330 * 4.0;
        float _346 = _324 * 0.16666667163372039794921875;
        float _348 = -_340;
        float _350 = _348 + _336;
        float _352 = -_330;
        float _354 = _352 + 6.0;
        float _356 = -_344;
        float _358 = fma(_316, _342, _356);
        float _360 = _218 * _218;
        float _362 = 1.0 / _346;
        float _364 = _332 * 0.16666667163372039794921875;
        float _366 = -_358;
        float _368 = _366 + _354;
        float _370 = _218 * _360;
        float _372 = _204 + 1.5;
        float _374 = _330 + _358;
        float _376 = _368 * 0.16666667163372039794921875;
        float _378 = _370 * 0.16666667163372039794921875;
        float _380 = 1.0 / _364;
        float _382 = _320 + _340;
        float _384 = _234 * _234;
        float _386 = fma(_378, _326, _372);
        float _388 = _204 + (-0.5);
        float _390 = _382 * 0.16666667163372039794921875;
        float _392 = _212 + (-0.5);
        float _394 = _212 + 1.5;
        float _396 = 1.0 / _318;
        float _398 = _258 * 0.16666667163372039794921875;
        float _400 = _284 * 0.16666667163372039794921875;
        float _402 = _374 * 0.16666667163372039794921875;
        float _404 = _350 * 0.16666667163372039794921875;
        float _406 = _234 * _384;
        float _408 = fma(_398, _362, _388);
        float _410 = _288 * _288;
        float _412 = 1.0 / _376;
        float _414 = _406 * 0.16666667163372039794921875;
        float _416 = fma(_400, _380, _392);
        float _418 = _408 * _198;
        float _420 = _386 * _198;
        float _422 = _280 * _280;
        float _424 = _288 * _410;
        float _426 = _416 * _254;
        float _428 = 1.0 / _402;
        float _430 = fma(_414, _396, _394);
        float _432 = _280 * _422;
        float _434 = _220 + (-0.5);
        float _436 = _236 + (-0.5);
        float _438 = _430 * _254;
        float _440 = _220 + 1.5;
        float _442 = _236 + 1.5;
        float _444 = 1.0 / _404;
        float _446 = _358 * 0.16666667163372039794921875;
        float _448 = _424 * 0.16666667163372039794921875;
        float _450 = _432 * 0.16666667163372039794921875;
        float _452 = _340 * 0.16666667163372039794921875;
        float _454 = fma(_448, _412, _442);
        float _456 = 1.0 / _210;
        float _458 = fma(_446, _428, _436);
        float _460 = 1.0 / _390;
        float _462 = fma(_450, _444, _440);
        float _464 = _462 * _274;
        float _466 = _458 * _456;
        float _468 = _454 * _456;
        float2 _1216 = float2(_418, _426);
        float3 _472 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1216, float2(0.0), isnan(_1216)), level(_150)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1216, float2(0.0), isnan(_1216)), level(_150)).xyz;
        float _474 = _472.x;
        float _476 = _472.y;
        float _478 = _472.z;
        float _480 = fma(_452, _460, _434);
        float2 _1235 = float2(_420, _426);
        float3 _482 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1235, float2(0.0), isnan(_1235)), level(_150)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1235, float2(0.0), isnan(_1235)), level(_150)).xyz;
        float _484 = _482.x;
        float _486 = _482.y;
        float _488 = _482.z;
        float2 _1250 = float2(_418, _438);
        float3 _490 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1250, float2(0.0), isnan(_1250)), level(_150)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1250, float2(0.0), isnan(_1250)), level(_150)).xyz;
        float _492 = _490.x;
        float _494 = _490.y;
        float _496 = _490.z;
        float2 _1265 = float2(_420, _438);
        float3 _498 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1265, float2(0.0), isnan(_1265)), level(_150)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1265, float2(0.0), isnan(_1265)), level(_150)).xyz;
        float _500 = _498.x;
        float _502 = _498.y;
        float _504 = _498.z;
        float _506 = _480 * _274;
        float2 _1283 = float2(_506, _466);
        float3 _508 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1283, float2(0.0), isnan(_1283)), level(_156)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1283, float2(0.0), isnan(_1283)), level(_156)).xyz;
        float _510 = _508.x;
        float _512 = _508.y;
        float _514 = _508.z;
        float2 _1298 = float2(_464, _466);
        float3 _516 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1298, float2(0.0), isnan(_1298)), level(_156)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1298, float2(0.0), isnan(_1298)), level(_156)).xyz;
        float _518 = _516.x;
        float _520 = _516.y;
        float _522 = _516.z;
        float2 _1313 = float2(_506, _468);
        float3 _524 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1313, float2(0.0), isnan(_1313)), level(_156)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1313, float2(0.0), isnan(_1313)), level(_156)).xyz;
        float _526 = _524.x;
        float _528 = _524.y;
        float _530 = _524.z;
        float2 _1328 = float2(_464, _468);
        float3 _532 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1328, float2(0.0), isnan(_1328)), level(_156)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1328, float2(0.0), isnan(_1328)), level(_156)).xyz;
        float _534 = _532.x;
        float _536 = _532.y;
        float _538 = _532.z;
        float _540 = -_150;
        float _542 = _144 + _540;
        float _544 = precise::clamp(_542, 0.0, 1.0);
        float _546 = 0.0 + _142;
        float _548 = precise::clamp(_546, 0.0, 1.0);
        float _550 = -_484;
        float _552 = _474 + _550;
        float _554 = -_486;
        float _556 = _476 + _554;
        float _558 = -_502;
        float _560 = _494 + _558;
        float _562 = -_500;
        float _564 = _492 + _562;
        float _566 = fma(_346, _552, _484);
        float _568 = fma(_346, _556, _486);
        float _570 = fma(_346, _560, _502);
        float _572 = -_488;
        float _574 = _478 + _572;
        float _576 = -_504;
        float _578 = _496 + _576;
        float _580 = fma(_346, _564, _500);
        float _582 = -_570;
        float _584 = _582 + _568;
        float _586 = fma(_346, _574, _488);
        float _588 = -_520;
        float _590 = _512 + _588;
        float _592 = -_518;
        float _594 = _510 + _592;
        float _596 = fma(_364, _584, _570);
        float _598 = -_522;
        float _600 = _514 + _598;
        float _602 = fma(_390, _590, _520);
        float _604 = -_534;
        float _606 = _526 + _604;
        float _608 = -_536;
        float _610 = _528 + _608;
        float _612 = -_538;
        float _614 = _530 + _612;
        float _616 = fma(_346, _578, _504);
        float _618 = fma(_390, _594, _518);
        float _620 = fma(_390, _606, _534);
        float _622 = fma(_390, _610, _536);
        float _624 = fma(_390, _600, _522);
        float _626 = fma(_390, _614, _538);
        float _628 = -_616;
        float _630 = _628 + _586;
        float _632 = -_580;
        float _634 = _632 + _566;
        float _636 = -_620;
        float _638 = _636 + _618;
        float _640 = -_622;
        float _642 = _640 + _602;
        float _644 = -_626;
        float _646 = _644 + _624;
        float _648 = fma(_364, _630, _616);
        float _650 = fma(_364, _634, _580);
        float _652 = fma(_402, _638, _620);
        float _654 = fma(_402, _642, _622);
        float _656 = fma(_402, _646, _626);
        float _658 = -_650;
        float _660 = _658 + _652;
        float _662 = -_596;
        float _664 = _662 + _654;
        float _666 = -_648;
        float _668 = _666 + _656;
        float _670 = fma(_544, _660, _650);
        float _672 = fma(_544, _664, _596);
        float _674 = fma(_544, _668, _648);
        out.m_38.x = _670;
        out.m_38.y = _672;
        out.m_38.z = _674;
        out.m_38.w = _548;
        return out;
    }
    discard_fragment();
    return out;
}

