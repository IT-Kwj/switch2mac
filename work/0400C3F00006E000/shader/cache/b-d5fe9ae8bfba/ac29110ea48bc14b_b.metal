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
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
};

static inline __attribute__((always_inline))
int _44(thread const int& _1532, thread const int& _1533, constant _10& support_buffer)
{
    int _1536 = 1 + _1533;
    float _1538 = support_buffer._m5[_1536].x;
    float _1540 = abs(_1538);
    bool _1542 = _1540 == 1.0;
    if (_1542)
    {
        return _1532;
    }
    float _1544 = float(_1532);
    float _1546 = _1544 / _1540;
    int _1548 = int(_1546);
    return _1548;
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
    float2 _696 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_696, float2(0.0), isnan(_696))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_696, float2(0.0), isnan(_696))).x;
    float2 _707 = float2(_64, _66);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_707, float2(0.0), isnan(_707))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_707, float2(0.0), isnan(_707))).x;
    float _72 = in.m_35.z;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_35.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_35.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = _62 * _76;
    float _92 = -_68;
    float _94 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _96 = 1.0 / _94;
    float _98 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _100 = precise::clamp(_98, 0.0, 1.0);
    float _102 = precise::max(_70, _100);
    float _104 = _62 * _88;
    float _106 = precise::max(_102, _90);
    float _108 = _62 * _82;
    bool _112 = _106 != 0.0;
    bool _114 = isnan(_106);
    bool _116 = _112 || _114;
    bool _118 = isnan(0.0);
    bool _120 = _116 || _118;
    bool _122 = !_120;
    if (!_122)
    {
        float _124 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _126 = fma(_106, _124, 1.0);
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
        int _152 = 2;
        int _154 = _44(_150, _152, (*spvDescriptorSet0.support_buffer));
        int _156 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_140), spvDescriptorSet0.fp_t_tcb_A.get_height(_140)).y;
        int _158 = _156;
        int _160 = 2;
        int _162 = _44(_158, _160, (*spvDescriptorSet0.support_buffer));
        int _164 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_146), spvDescriptorSet0.fp_t_tcb_A.get_height(_146)).x;
        int _166 = _164;
        int _168 = 2;
        int _170 = _44(_166, _168, (*spvDescriptorSet0.support_buffer));
        int _172 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_146), spvDescriptorSet0.fp_t_tcb_A.get_height(_146)).y;
        int _174 = _172;
        int _176 = 2;
        int _178 = _44(_174, _176, (*spvDescriptorSet0.support_buffer));
        float _180 = float(_154);
        float _182 = float(_162);
        float _184 = 1.0 / _180;
        float _186 = fma(_64, _180, -0.5);
        float _188 = fma(_66, _182, -0.5);
        float _190 = floor(_186);
        float _192 = floor(_188);
        float _194 = float(_170);
        float _196 = float(_178);
        float _198 = fma(_64, _194, -0.5);
        float _200 = -_190;
        float _202 = _186 + _200;
        float _204 = fma(_66, _196, -0.5);
        float _206 = floor(_198);
        float _208 = -_202;
        float _210 = _208 + 1.0;
        float _212 = -_202;
        float _214 = _212 + 2.0;
        float _216 = -_192;
        float _218 = _188 + _216;
        float _220 = _210 * _210;
        float _222 = floor(_204);
        float _224 = -_218;
        float _226 = _224 + 1.0;
        float _228 = _210 * _220;
        float _230 = _214 * _214;
        float _232 = -_218;
        float _234 = _232 + 2.0;
        float _236 = _226 * _226;
        float _238 = _228 * 4.0;
        float _240 = 1.0 / _182;
        float _242 = _226 * _236;
        float _244 = -_238;
        float _246 = fma(_214, _230, _244);
        float _248 = -_228;
        float _250 = _248 + 6.0;
        float _252 = _234 * _234;
        float _254 = _242 * 4.0;
        float _256 = -_206;
        float _258 = _198 + _256;
        float _260 = -_246;
        float _262 = _260 + _250;
        float _264 = 1.0 / _194;
        float _266 = -_254;
        float _268 = fma(_234, _252, _266);
        float _270 = -_258;
        float _272 = _270 + 1.0;
        float _274 = _262 * 0.16666667163372039794921875;
        float _276 = -_258;
        float _278 = _276 + 2.0;
        float _280 = -_242;
        float _282 = _280 + 6.0;
        float _284 = _272 * _272;
        float _286 = _228 + _246;
        float _288 = _278 * _278;
        float _290 = -_268;
        float _292 = _290 + _282;
        float _294 = _272 * _284;
        float _296 = -_222;
        float _298 = _204 + _296;
        float _300 = 1.0 / _274;
        float _302 = _292 * 0.16666667163372039794921875;
        float _304 = _294 * 4.0;
        float _306 = -_298;
        float _308 = _306 + 1.0;
        float _310 = -_294;
        float _312 = _310 + 6.0;
        float _314 = _286 * 0.16666667163372039794921875;
        float _316 = -_304;
        float _318 = fma(_278, _288, _316);
        float _320 = _308 * _308;
        float _322 = -_298;
        float _324 = _322 + 2.0;
        float _326 = 1.0 / _314;
        float _328 = -_318;
        float _330 = _328 + _312;
        float _332 = _308 * _320;
        float _334 = _202 * _202;
        float _336 = _324 * _324;
        float _338 = _330 * 0.16666667163372039794921875;
        float _340 = _332 * 4.0;
        float _342 = _242 + _268;
        float _344 = _202 * _334;
        float _346 = 1.0 / _302;
        float _348 = -_340;
        float _350 = fma(_324, _336, _348);
        float _352 = _342 * 0.16666667163372039794921875;
        float _354 = _190 + 1.5;
        float _356 = _344 * 0.16666667163372039794921875;
        float _358 = -_332;
        float _360 = _358 + 6.0;
        float _362 = _190 + (-0.5);
        float _364 = _218 * _218;
        float _366 = 1.0 / _352;
        float _368 = fma(_356, _300, _354);
        float _370 = _246 * 0.16666667163372039794921875;
        float _372 = -_350;
        float _374 = _372 + _360;
        float _376 = _218 * _364;
        float _378 = _294 + _318;
        float _380 = fma(_370, _326, _362);
        float _382 = _332 + _350;
        float _384 = 1.0 / _338;
        float _386 = _374 * 0.16666667163372039794921875;
        float _388 = _192 + (-0.5);
        float _390 = _378 * 0.16666667163372039794921875;
        float _392 = _382 * 0.16666667163372039794921875;
        float _394 = _268 * 0.16666667163372039794921875;
        float _396 = _206 + 1.5;
        float _398 = _350 * 0.16666667163372039794921875;
        float _400 = 1.0 / _386;
        float _402 = _192 + 1.5;
        float _404 = _376 * 0.16666667163372039794921875;
        float _406 = fma(_394, _366, _388);
        float _408 = _298 * _298;
        float _410 = _258 * _258;
        float _412 = fma(_404, _346, _402);
        float _414 = _380 * _184;
        float _416 = 1.0 / _390;
        float _418 = _298 * _408;
        float _420 = _258 * _410;
        float _422 = _206 + (-0.5);
        float _424 = _368 * _184;
        float _426 = _406 * _240;
        float _428 = _222 + 1.5;
        float _430 = _318 * 0.16666667163372039794921875;
        float _432 = 1.0 / _392;
        float _434 = _418 * 0.16666667163372039794921875;
        float _436 = _222 + (-0.5);
        float _438 = _420 * 0.16666667163372039794921875;
        float _440 = _412 * _240;
        float _442 = fma(_434, _400, _428);
        float _444 = fma(_438, _384, _396);
        float _446 = 1.0 / _196;
        float _448 = fma(_430, _416, _422);
        float _450 = _448 * _264;
        float _452 = _444 * _264;
        float _454 = fma(_398, _432, _436);
        float2 _1195 = float2(_414, _426);
        float3 _458 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1195, float2(0.0), isnan(_1195)), level(_136)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1195, float2(0.0), isnan(_1195)), level(_136)).xyz;
        float _460 = _458.x;
        float _462 = _458.y;
        float _464 = _458.z;
        float _466 = _454 * _446;
        float _468 = _442 * _446;
        float2 _1216 = float2(_424, _426);
        float3 _470 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1216, float2(0.0), isnan(_1216)), level(_136)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1216, float2(0.0), isnan(_1216)), level(_136)).xyz;
        float _472 = _470.x;
        float _474 = _470.y;
        float _476 = _470.z;
        float2 _1231 = float2(_414, _440);
        float3 _478 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1231, float2(0.0), isnan(_1231)), level(_136)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1231, float2(0.0), isnan(_1231)), level(_136)).xyz;
        float _480 = _478.x;
        float _482 = _478.y;
        float _484 = _478.z;
        float2 _1246 = float2(_424, _440);
        float3 _486 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1246, float2(0.0), isnan(_1246)), level(_136)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1246, float2(0.0), isnan(_1246)), level(_136)).xyz;
        float _488 = _486.x;
        float _490 = _486.y;
        float _492 = _486.z;
        float2 _1261 = float2(_450, _466);
        float3 _494 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1261, float2(0.0), isnan(_1261)), level(_142)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1261, float2(0.0), isnan(_1261)), level(_142)).xyz;
        float _496 = _494.x;
        float _498 = _494.y;
        float _500 = _494.z;
        float2 _1276 = float2(_452, _466);
        float3 _502 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1276, float2(0.0), isnan(_1276)), level(_142)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1276, float2(0.0), isnan(_1276)), level(_142)).xyz;
        float _504 = _502.x;
        float _506 = _502.y;
        float _508 = _502.z;
        float2 _1291 = float2(_450, _468);
        float3 _510 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1291, float2(0.0), isnan(_1291)), level(_142)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1291, float2(0.0), isnan(_1291)), level(_142)).xyz;
        float _512 = _510.x;
        float _514 = _510.y;
        float _516 = _510.z;
        float2 _1306 = float2(_452, _468);
        float3 _518 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1306, float2(0.0), isnan(_1306)), level(_142)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1306, float2(0.0), isnan(_1306)), level(_142)).xyz;
        float _520 = _518.x;
        float _522 = _518.y;
        float _524 = _518.z;
        float _526 = 0.0 + _128;
        float _528 = precise::clamp(_526, 0.0, 1.0);
        float _530 = fma(_104, _528, _108);
        float _532 = -_136;
        float _534 = _130 + _532;
        float _536 = precise::clamp(_534, 0.0, 1.0);
        float _538 = -_472;
        float _540 = _460 + _538;
        float _542 = -_474;
        float _544 = _462 + _542;
        float _546 = -_476;
        float _548 = _464 + _546;
        float _550 = fma(_314, _540, _472);
        float _552 = -_490;
        float _554 = _482 + _552;
        float _556 = -_488;
        float _558 = _480 + _556;
        float _560 = -_492;
        float _562 = _484 + _560;
        float _564 = fma(_314, _544, _474);
        float _566 = fma(_314, _554, _490);
        float _568 = -_504;
        float _570 = _496 + _568;
        float _572 = -_506;
        float _574 = _498 + _572;
        float _576 = -_508;
        float _578 = _500 + _576;
        float _580 = fma(_314, _548, _476);
        float _582 = fma(_390, _570, _504);
        float _584 = fma(_390, _574, _506);
        float _586 = -_520;
        float _588 = _512 + _586;
        float _590 = -_522;
        float _592 = _514 + _590;
        float _594 = -_524;
        float _596 = _516 + _594;
        float _598 = fma(_314, _558, _488);
        float _600 = fma(_390, _588, _520);
        float _602 = fma(_390, _592, _522);
        float _604 = fma(_314, _562, _492);
        float _606 = fma(_390, _578, _508);
        float _608 = fma(_390, _596, _524);
        float _610 = -_598;
        float _612 = _610 + _550;
        float _614 = -_566;
        float _616 = _614 + _564;
        float _618 = -_600;
        float _620 = _618 + _582;
        float _622 = -_602;
        float _624 = _622 + _584;
        float _626 = -_604;
        float _628 = _626 + _580;
        float _630 = -_608;
        float _632 = _630 + _606;
        float _634 = fma(_352, _612, _598);
        float _636 = fma(_352, _616, _566);
        float _638 = fma(_392, _620, _600);
        float _640 = fma(_392, _624, _602);
        float _642 = fma(_352, _628, _604);
        float _644 = fma(_392, _632, _608);
        float _646 = -_634;
        float _648 = _646 + _638;
        float _650 = -_636;
        float _652 = _650 + _640;
        float _654 = -_642;
        float _656 = _654 + _644;
        float _658 = fma(_536, _648, _634);
        float _660 = fma(_536, _652, _636);
        float _662 = fma(_536, _656, _642);
        out.m_38.x = _658;
        out.m_38.y = _660;
        out.m_38.z = _662;
        out.m_38.w = _530;
        return out;
    }
    discard_fragment();
    return out;
}

