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
};

static inline __attribute__((always_inline))
int _42(thread const int& _1465, thread const int& _1466, constant _10& support_buffer)
{
    int _1469 = 1 + _1466;
    float _1471 = support_buffer._m5[_1469].x;
    float _1473 = abs(_1471);
    bool _1475 = _1473 == 1.0;
    if (_1475)
    {
        return _1465;
    }
    float _1477 = float(_1465);
    float _1479 = _1477 / _1473;
    int _1481 = int(_1479);
    return _1481;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _46 = gl_FragCoord.w;
    float _48 = in.m_33.x;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_33.y;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = 1.0 / _46;
    float _62 = _60 * _52;
    float _64 = _60 * _58;
    float2 _666 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_666, float2(0.0), isnan(_666))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_666, float2(0.0), isnan(_666))).x;
    float2 _677 = float2(_62, _64);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_677, float2(0.0), isnan(_677))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_677, float2(0.0), isnan(_677))).x;
    float _70 = -_66;
    float _72 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _74 = 1.0 / _72;
    float _76 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _78 = precise::clamp(_76, 0.0, 1.0);
    float _80 = precise::max(_68, _78);
    bool _84 = _80 != 0.0;
    bool _86 = isnan(_80);
    bool _88 = _84 || _86;
    bool _90 = isnan(0.0);
    bool _92 = _88 || _90;
    bool _94 = !_92;
    if (!_94)
    {
        float _96 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _98 = fma(_80, _96, 1.0);
        float _100 = log2(_98);
        float _102 = _100 + (-1.0);
        float _104 = trunc(_102);
        int _106 = int(_104);
        float _108 = float(_106);
        float _110 = trunc(_108);
        int _112 = int(_110);
        float _114 = _108 + 1.0;
        float _116 = trunc(_114);
        int _118 = int(_116);
        int _120 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_112), spvDescriptorSet0.fp_t_tcb_A.get_height(_112)).x;
        int _122 = _120;
        int _124 = 2;
        int _126 = _42(_122, _124, (*spvDescriptorSet0.support_buffer));
        int _128 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_112), spvDescriptorSet0.fp_t_tcb_A.get_height(_112)).y;
        int _130 = _128;
        int _132 = 2;
        int _134 = _42(_130, _132, (*spvDescriptorSet0.support_buffer));
        int _136 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_118), spvDescriptorSet0.fp_t_tcb_A.get_height(_118)).x;
        int _138 = _136;
        int _140 = 2;
        int _142 = _42(_138, _140, (*spvDescriptorSet0.support_buffer));
        int _144 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_118), spvDescriptorSet0.fp_t_tcb_A.get_height(_118)).y;
        int _146 = _144;
        int _148 = 2;
        int _150 = _42(_146, _148, (*spvDescriptorSet0.support_buffer));
        float _152 = float(_126);
        float _154 = float(_134);
        float _156 = 1.0 / _152;
        float _158 = fma(_62, _152, -0.5);
        float _160 = fma(_64, _154, -0.5);
        float _162 = floor(_158);
        float _164 = float(_142);
        float _166 = fma(_62, _164, -0.5);
        float _168 = float(_150);
        float _170 = floor(_160);
        float _172 = fma(_64, _168, -0.5);
        float _174 = -_162;
        float _176 = _158 + _174;
        float _178 = floor(_166);
        float _180 = -_176;
        float _182 = _180 + 1.0;
        float _184 = -_176;
        float _186 = _184 + 2.0;
        float _188 = _182 * _182;
        float _190 = -_170;
        float _192 = _160 + _190;
        float _194 = floor(_172);
        float _196 = _182 * _188;
        float _198 = -_192;
        float _200 = _198 + 1.0;
        float _202 = _186 * _186;
        float _204 = -_192;
        float _206 = _204 + 2.0;
        float _208 = _196 * 4.0;
        float _210 = _200 * _200;
        float _212 = 1.0 / _154;
        float _214 = -_208;
        float _216 = fma(_186, _202, _214);
        float _218 = -_196;
        float _220 = _218 + 6.0;
        float _222 = _200 * _210;
        float _224 = _206 * _206;
        float _226 = -_216;
        float _228 = _226 + _220;
        float _230 = _222 * 4.0;
        float _232 = 1.0 / _164;
        float _234 = _228 * 0.16666667163372039794921875;
        float _236 = -_178;
        float _238 = _166 + _236;
        float _240 = -_230;
        float _242 = fma(_206, _224, _240);
        float _244 = -_194;
        float _246 = _172 + _244;
        float _248 = -_222;
        float _250 = _248 + 6.0;
        float _252 = -_238;
        float _254 = _252 + 1.0;
        float _256 = -_238;
        float _258 = _256 + 2.0;
        float _260 = -_246;
        float _262 = _260 + 1.0;
        float _264 = -_242;
        float _266 = _264 + _250;
        float _268 = _254 * _254;
        float _270 = _258 * _258;
        float _272 = -_246;
        float _274 = _272 + 2.0;
        float _276 = _266 * 0.16666667163372039794921875;
        float _278 = _254 * _268;
        float _280 = _262 * _262;
        float _282 = _196 + _216;
        float _284 = 1.0 / _234;
        float _286 = _278 * 4.0;
        float _288 = _262 * _280;
        float _290 = _222 + _242;
        float _292 = -_278;
        float _294 = _292 + 6.0;
        float _296 = -_286;
        float _298 = fma(_258, _270, _296);
        float _300 = _274 * _274;
        float _302 = _288 * 4.0;
        float _304 = _282 * 0.16666667163372039794921875;
        float _306 = -_298;
        float _308 = _306 + _294;
        float _310 = -_288;
        float _312 = _310 + 6.0;
        float _314 = -_302;
        float _316 = fma(_274, _300, _314);
        float _318 = _176 * _176;
        float _320 = 1.0 / _304;
        float _322 = _290 * 0.16666667163372039794921875;
        float _324 = -_316;
        float _326 = _324 + _312;
        float _328 = _176 * _318;
        float _330 = _162 + 1.5;
        float _332 = _288 + _316;
        float _334 = _326 * 0.16666667163372039794921875;
        float _336 = _328 * 0.16666667163372039794921875;
        float _338 = 1.0 / _322;
        float _340 = _278 + _298;
        float _342 = _192 * _192;
        float _344 = fma(_336, _284, _330);
        float _346 = _162 + (-0.5);
        float _348 = _340 * 0.16666667163372039794921875;
        float _350 = _170 + (-0.5);
        float _352 = _170 + 1.5;
        float _354 = 1.0 / _276;
        float _356 = _216 * 0.16666667163372039794921875;
        float _358 = _242 * 0.16666667163372039794921875;
        float _360 = _332 * 0.16666667163372039794921875;
        float _362 = _308 * 0.16666667163372039794921875;
        float _364 = _192 * _342;
        float _366 = fma(_356, _320, _346);
        float _368 = _246 * _246;
        float _370 = 1.0 / _334;
        float _372 = _364 * 0.16666667163372039794921875;
        float _374 = fma(_358, _338, _350);
        float _376 = _366 * _156;
        float _378 = _344 * _156;
        float _380 = _238 * _238;
        float _382 = _246 * _368;
        float _384 = _374 * _212;
        float _386 = 1.0 / _360;
        float _388 = fma(_372, _354, _352);
        float _390 = _238 * _380;
        float _392 = _178 + (-0.5);
        float _394 = _194 + (-0.5);
        float _396 = _388 * _212;
        float _398 = _178 + 1.5;
        float _400 = _194 + 1.5;
        float _402 = 1.0 / _362;
        float _404 = _316 * 0.16666667163372039794921875;
        float _406 = _382 * 0.16666667163372039794921875;
        float _408 = _390 * 0.16666667163372039794921875;
        float _410 = _298 * 0.16666667163372039794921875;
        float _412 = fma(_406, _370, _400);
        float _414 = 1.0 / _168;
        float _416 = fma(_404, _386, _394);
        float _418 = 1.0 / _348;
        float _420 = fma(_408, _402, _398);
        float _422 = _420 * _232;
        float _424 = _416 * _414;
        float _426 = _412 * _414;
        float2 _1131 = float2(_376, _384);
        float3 _430 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1131, float2(0.0), isnan(_1131)), level(_108)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1131, float2(0.0), isnan(_1131)), level(_108)).xyz;
        float _432 = _430.x;
        float _434 = _430.y;
        float _436 = _430.z;
        float _438 = fma(_410, _418, _392);
        float2 _1150 = float2(_378, _384);
        float3 _440 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1150, float2(0.0), isnan(_1150)), level(_108)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1150, float2(0.0), isnan(_1150)), level(_108)).xyz;
        float _442 = _440.x;
        float _444 = _440.y;
        float _446 = _440.z;
        float2 _1165 = float2(_376, _396);
        float3 _448 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1165, float2(0.0), isnan(_1165)), level(_108)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1165, float2(0.0), isnan(_1165)), level(_108)).xyz;
        float _450 = _448.x;
        float _452 = _448.y;
        float _454 = _448.z;
        float2 _1180 = float2(_378, _396);
        float3 _456 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1180, float2(0.0), isnan(_1180)), level(_108)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1180, float2(0.0), isnan(_1180)), level(_108)).xyz;
        float _458 = _456.x;
        float _460 = _456.y;
        float _462 = _456.z;
        float _464 = _438 * _232;
        float2 _1198 = float2(_464, _424);
        float3 _466 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1198, float2(0.0), isnan(_1198)), level(_114)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1198, float2(0.0), isnan(_1198)), level(_114)).xyz;
        float _468 = _466.x;
        float _470 = _466.y;
        float _472 = _466.z;
        float2 _1213 = float2(_422, _424);
        float3 _474 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1213, float2(0.0), isnan(_1213)), level(_114)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1213, float2(0.0), isnan(_1213)), level(_114)).xyz;
        float _476 = _474.x;
        float _478 = _474.y;
        float _480 = _474.z;
        float2 _1228 = float2(_464, _426);
        float3 _482 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1228, float2(0.0), isnan(_1228)), level(_114)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1228, float2(0.0), isnan(_1228)), level(_114)).xyz;
        float _484 = _482.x;
        float _486 = _482.y;
        float _488 = _482.z;
        float2 _1243 = float2(_422, _426);
        float3 _490 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1243, float2(0.0), isnan(_1243)), level(_114)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1243, float2(0.0), isnan(_1243)), level(_114)).xyz;
        float _492 = _490.x;
        float _494 = _490.y;
        float _496 = _490.z;
        float _498 = -_108;
        float _500 = _102 + _498;
        float _502 = precise::clamp(_500, 0.0, 1.0);
        float _504 = 0.0 + _100;
        float _506 = precise::clamp(_504, 0.0, 1.0);
        float _508 = -_442;
        float _510 = _432 + _508;
        float _512 = -_444;
        float _514 = _434 + _512;
        float _516 = -_460;
        float _518 = _452 + _516;
        float _520 = -_458;
        float _522 = _450 + _520;
        float _524 = fma(_304, _510, _442);
        float _526 = fma(_304, _514, _444);
        float _528 = fma(_304, _518, _460);
        float _530 = -_446;
        float _532 = _436 + _530;
        float _534 = -_462;
        float _536 = _454 + _534;
        float _538 = fma(_304, _522, _458);
        float _540 = -_528;
        float _542 = _540 + _526;
        float _544 = fma(_304, _532, _446);
        float _546 = -_478;
        float _548 = _470 + _546;
        float _550 = -_476;
        float _552 = _468 + _550;
        float _554 = fma(_322, _542, _528);
        float _556 = -_480;
        float _558 = _472 + _556;
        float _560 = fma(_348, _548, _478);
        float _562 = -_492;
        float _564 = _484 + _562;
        float _566 = -_494;
        float _568 = _486 + _566;
        float _570 = -_496;
        float _572 = _488 + _570;
        float _574 = fma(_304, _536, _462);
        float _576 = fma(_348, _552, _476);
        float _578 = fma(_348, _564, _492);
        float _580 = fma(_348, _568, _494);
        float _582 = fma(_348, _558, _480);
        float _584 = fma(_348, _572, _496);
        float _586 = -_574;
        float _588 = _586 + _544;
        float _590 = -_538;
        float _592 = _590 + _524;
        float _594 = -_578;
        float _596 = _594 + _576;
        float _598 = -_580;
        float _600 = _598 + _560;
        float _602 = -_584;
        float _604 = _602 + _582;
        float _606 = fma(_322, _588, _574);
        float _608 = fma(_322, _592, _538);
        float _610 = fma(_360, _596, _578);
        float _612 = fma(_360, _600, _580);
        float _614 = fma(_360, _604, _584);
        float _616 = -_608;
        float _618 = _616 + _610;
        float _620 = -_554;
        float _622 = _620 + _612;
        float _624 = -_606;
        float _626 = _624 + _614;
        float _628 = fma(_502, _618, _608);
        float _630 = fma(_502, _622, _554);
        float _632 = fma(_502, _626, _606);
        out.m_36.x = _628;
        out.m_36.y = _630;
        out.m_36.z = _632;
        out.m_36.w = _506;
        return out;
    }
    discard_fragment();
    return out;
}

