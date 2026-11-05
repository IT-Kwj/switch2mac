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
int _42(thread const int& _1571, thread const int& _1572, constant _10& support_buffer)
{
    int _1575 = 1 + _1572;
    float _1577 = support_buffer._m5[_1575].x;
    float _1579 = abs(_1577);
    bool _1581 = _1579 == 1.0;
    if (_1581)
    {
        return _1571;
    }
    float _1583 = float(_1571);
    float _1585 = _1583 / _1579;
    int _1587 = int(_1585);
    return _1587;
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
    float2 _710 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_710, float2(0.0), isnan(_710))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_710, float2(0.0), isnan(_710))).x;
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
    float _92 = -_66;
    float _94 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _96 = 1.0 / _94;
    float _98 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _100 = precise::clamp(_98, 0.0, 1.0);
    float _102 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _104 = precise::clamp(_102, 0.0, 1.0);
    float _106 = precise::max(_100, _104);
    float _108 = precise::max(_106, _90);
    bool _112 = _108 != 0.0;
    bool _114 = isnan(_108);
    bool _116 = _112 || _114;
    bool _118 = isnan(0.0);
    bool _120 = _116 || _118;
    bool _122 = !_120;
    if (!_122)
    {
        float _124 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _126 = fma(_108, _124, 1.0);
        float _128 = log2(_126);
        float _130 = _128 + (-1.0);
        float _132 = trunc(_130);
        int _134 = int(_132);
        float _136 = float(_134);
        float _138 = trunc(_136);
        int _140 = int(_138);
        float _142 = _136 + 1.0;
        float _144 = trunc(_142);
        int _146 = int(_144);
        int _148 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_140), spvDescriptorSet0.fp_t_tcb_A.get_height(_140)).x;
        int _150 = _148;
        int _152 = 1;
        int _154 = _42(_150, _152, (*spvDescriptorSet0.support_buffer));
        int _156 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_140), spvDescriptorSet0.fp_t_tcb_A.get_height(_140)).y;
        int _158 = _156;
        int _160 = 1;
        int _162 = _42(_158, _160, (*spvDescriptorSet0.support_buffer));
        int _164 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_146), spvDescriptorSet0.fp_t_tcb_A.get_height(_146)).x;
        int _166 = _164;
        int _168 = 1;
        int _170 = _42(_166, _168, (*spvDescriptorSet0.support_buffer));
        int _172 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_146), spvDescriptorSet0.fp_t_tcb_A.get_height(_146)).y;
        int _174 = _172;
        int _176 = 1;
        int _178 = _42(_174, _176, (*spvDescriptorSet0.support_buffer));
        float _180 = float(_154);
        float _182 = float(_162);
        float _184 = 1.0 / _180;
        float _186 = fma(_62, _180, -0.5);
        float _188 = fma(_64, _182, -0.5);
        float _190 = floor(_186);
        float _192 = floor(_188);
        float _194 = float(_170);
        float _196 = float(_178);
        float _198 = fma(_62, _194, -0.5);
        float _200 = -_190;
        float _202 = _186 + _200;
        float _204 = fma(_64, _196, -0.5);
        float _206 = floor(_198);
        float _208 = -_202;
        float _210 = _208 + 1.0;
        float _212 = -_202;
        float _214 = _212 + 2.0;
        float _216 = -_192;
        float _218 = _188 + _216;
        float _220 = _210 * _210;
        float _222 = _214 * _214;
        float _224 = 1.0 / _182;
        float _226 = -_218;
        float _228 = _226 + 1.0;
        float _230 = _210 * _220;
        float _232 = -_218;
        float _234 = _232 + 2.0;
        float _236 = _228 * _228;
        float _238 = _230 * 4.0;
        float _240 = floor(_204);
        float _242 = _228 * _236;
        float _244 = -_238;
        float _246 = fma(_214, _222, _244);
        float _248 = -_230;
        float _250 = _248 + 6.0;
        float _252 = _234 * _234;
        float _254 = _242 * 4.0;
        float _256 = -_206;
        float _258 = _198 + _256;
        float _260 = -_246;
        float _262 = _260 + _250;
        float _264 = 1.0 / _196;
        float _266 = -_254;
        float _268 = fma(_234, _252, _266);
        float _270 = -_258;
        float _272 = _270 + 1.0;
        float _274 = -_242;
        float _276 = _274 + 6.0;
        float _278 = _262 * 0.16666667163372039794921875;
        float _280 = -_258;
        float _282 = _280 + 2.0;
        float _284 = _272 * _272;
        float _286 = -_268;
        float _288 = _286 + _276;
        float _290 = -_240;
        float _292 = _204 + _290;
        float _294 = _282 * _282;
        float _296 = _272 * _284;
        float _298 = _288 * 0.16666667163372039794921875;
        float _300 = -_292;
        float _302 = _300 + 1.0;
        float _304 = _230 + _246;
        float _306 = _296 * 4.0;
        float _308 = -_296;
        float _310 = _308 + 6.0;
        float _312 = 1.0 / _278;
        float _314 = _304 * 0.16666667163372039794921875;
        float _316 = -_306;
        float _318 = fma(_282, _294, _316);
        float _320 = _302 * _302;
        float _322 = -_292;
        float _324 = _322 + 2.0;
        float _326 = _202 * _202;
        float _328 = -_318;
        float _330 = _328 + _310;
        float _332 = _302 * _320;
        float _334 = 1.0 / _314;
        float _336 = _324 * _324;
        float _338 = _330 * 0.16666667163372039794921875;
        float _340 = _332 * 4.0;
        float _342 = _202 * _326;
        float _344 = _242 + _268;
        float _346 = -_332;
        float _348 = _346 + 6.0;
        float _350 = -_340;
        float _352 = fma(_324, _336, _350);
        float _354 = _190 + 1.5;
        float _356 = _344 * 0.16666667163372039794921875;
        float _358 = _342 * 0.16666667163372039794921875;
        float _360 = 1.0 / _298;
        float _362 = -_352;
        float _364 = _362 + _348;
        float _366 = _246 * 0.16666667163372039794921875;
        float _368 = fma(_358, _312, _354);
        float _370 = _190 + (-0.5);
        float _372 = _218 * _218;
        float _374 = _364 * 0.16666667163372039794921875;
        float _376 = _192 + (-0.5);
        float _378 = 1.0 / _356;
        float _380 = _218 * _372;
        float _382 = fma(_366, _334, _370);
        float _384 = _332 + _352;
        float _386 = _192 + 1.5;
        float _388 = _296 + _318;
        float _390 = _380 * 0.16666667163372039794921875;
        float _392 = _268 * 0.16666667163372039794921875;
        float _394 = _384 * 0.16666667163372039794921875;
        float _396 = 1.0 / _374;
        float _398 = _388 * 0.16666667163372039794921875;
        float _400 = fma(_390, _360, _386);
        float _402 = _382 * _184;
        float _404 = _258 * _258;
        float _406 = _368 * _184;
        float _408 = _206 + (-0.5);
        float _410 = fma(_392, _378, _376);
        float _412 = 1.0 / _394;
        float _414 = _292 * _292;
        float _416 = _258 * _404;
        float _418 = _410 * _224;
        float _420 = _400 * _224;
        float _422 = _292 * _414;
        float _424 = _240 + 1.5;
        float _426 = _206 + 1.5;
        float _428 = 1.0 / _338;
        float _430 = _422 * 0.16666667163372039794921875;
        float _432 = _240 + (-0.5);
        float _434 = _352 * 0.16666667163372039794921875;
        float _436 = _318 * 0.16666667163372039794921875;
        float _438 = fma(_430, _396, _424);
        float _440 = _416 * 0.16666667163372039794921875;
        float _442 = 1.0 / _398;
        float _444 = fma(_434, _412, _432);
        float _446 = _438 * _264;
        float _448 = _444 * _264;
        float _450 = 1.0 / _194;
        float _452 = fma(_440, _428, _426);
        float2 _1205 = float2(_402, _418);
        float3 _456 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1205, float2(0.0), isnan(_1205)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1205, float2(0.0), isnan(_1205)), level(_136)).xyz;
        float _458 = _456.x;
        float _460 = _456.y;
        float _462 = _456.z;
        float2 _1220 = float2(_406, _418);
        float3 _464 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1220, float2(0.0), isnan(_1220)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1220, float2(0.0), isnan(_1220)), level(_136)).xyz;
        float _466 = _464.x;
        float _468 = _464.y;
        float _470 = _464.z;
        float _472 = fma(_436, _442, _408);
        float _474 = _472 * _450;
        float _476 = _452 * _450;
        float2 _1245 = float2(_402, _420);
        float3 _478 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1245, float2(0.0), isnan(_1245)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1245, float2(0.0), isnan(_1245)), level(_136)).xyz;
        float _480 = _478.x;
        float _482 = _478.y;
        float _484 = _478.z;
        float2 _1260 = float2(_406, _420);
        float3 _486 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1260, float2(0.0), isnan(_1260)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1260, float2(0.0), isnan(_1260)), level(_136)).xyz;
        float _488 = _486.x;
        float _490 = _486.y;
        float _492 = _486.z;
        float2 _1275 = float2(_474, _448);
        float3 _494 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1275, float2(0.0), isnan(_1275)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1275, float2(0.0), isnan(_1275)), level(_142)).xyz;
        float _496 = _494.x;
        float _498 = _494.y;
        float _500 = _494.z;
        float2 _1290 = float2(_476, _448);
        float3 _502 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1290, float2(0.0), isnan(_1290)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1290, float2(0.0), isnan(_1290)), level(_142)).xyz;
        float _504 = _502.x;
        float _506 = _502.y;
        float _508 = _502.z;
        float2 _1305 = float2(_474, _446);
        float3 _510 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1305, float2(0.0), isnan(_1305)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1305, float2(0.0), isnan(_1305)), level(_142)).xyz;
        float _512 = _510.x;
        float _514 = _510.y;
        float _516 = _510.z;
        float2 _1320 = float2(_476, _446);
        float3 _518 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1320, float2(0.0), isnan(_1320)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1320, float2(0.0), isnan(_1320)), level(_142)).xyz;
        float _520 = _518.x;
        float _522 = _518.y;
        float _524 = _518.z;
        float _526 = 0.0 + _128;
        float _528 = precise::clamp(_526, 0.0, 1.0);
        float _530 = fma(_86, _528, _88);
        float _532 = -_136;
        float _534 = _130 + _532;
        float _536 = precise::clamp(_534, 0.0, 1.0);
        float _538 = _528 * _86;
        float _540 = -_468;
        float _542 = _460 + _540;
        float _544 = -_466;
        float _546 = _458 + _544;
        float _548 = -_470;
        float _550 = _462 + _548;
        float _552 = fma(_314, _542, _468);
        float _554 = fma(_314, _546, _466);
        float _556 = fma(_314, _550, _470);
        float _558 = -_488;
        float _560 = _480 + _558;
        float _562 = -_492;
        float _564 = _484 + _562;
        float _566 = fma(_314, _560, _488);
        float _568 = -_490;
        float _570 = _482 + _568;
        float _572 = fma(_314, _564, _492);
        float _574 = -_506;
        float _576 = _498 + _574;
        float _578 = -_508;
        float _580 = _500 + _578;
        float _582 = fma(_314, _570, _490);
        float _584 = -_504;
        float _586 = _496 + _584;
        float _588 = -_524;
        float _590 = _516 + _588;
        float _592 = fma(_398, _576, _506);
        float _594 = -_520;
        float _596 = _512 + _594;
        float _598 = -_522;
        float _600 = _514 + _598;
        float _602 = fma(_398, _580, _508);
        float _604 = fma(_398, _590, _524);
        float _606 = fma(_398, _586, _504);
        float _608 = fma(_398, _596, _520);
        float _610 = -_566;
        float _612 = _610 + _554;
        float _614 = fma(_398, _600, _522);
        float _616 = -_572;
        float _618 = _616 + _556;
        float _620 = 1.0 / _530;
        float _622 = -_604;
        float _624 = _622 + _602;
        float _626 = fma(_356, _612, _566);
        float _628 = -_608;
        float _630 = _628 + _606;
        float _632 = -_582;
        float _634 = _632 + _552;
        float _636 = -_614;
        float _638 = _636 + _592;
        float _640 = fma(_356, _618, _572);
        float _642 = fma(_394, _624, _604);
        float _644 = fma(_394, _630, _608);
        float _646 = fma(_356, _634, _582);
        float _648 = fma(_394, _638, _614);
        float _650 = -_640;
        float _652 = _650 + _642;
        float _654 = -_626;
        float _656 = _654 + _644;
        float _658 = -_646;
        float _660 = _658 + _648;
        float _662 = fma(_536, _652, _640);
        float _664 = fma(_536, _656, _626);
        float _666 = _620 * _538;
        float _668 = fma(_536, _660, _646);
        float _670 = _662 * _538;
        float _672 = _664 * _666;
        float _674 = _668 * _666;
        float _676 = _670 * _620;
        out.m_36.x = _672;
        out.m_36.y = _674;
        out.m_36.z = _676;
        out.m_36.w = _530;
        return out;
    }
    out.m_36.x = 0.0;
    out.m_36.y = 0.0;
    out.m_36.z = 0.0;
    out.m_36.w = _88;
    return out;
}

