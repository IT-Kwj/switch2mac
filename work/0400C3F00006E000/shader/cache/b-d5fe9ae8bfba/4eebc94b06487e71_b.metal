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
int _44(thread const int& _1483, thread const int& _1484, constant _10& support_buffer)
{
    int _1487 = 1 + _1484;
    float _1489 = support_buffer._m5[_1487].x;
    float _1491 = abs(_1489);
    bool _1493 = _1491 == 1.0;
    if (_1493)
    {
        return _1483;
    }
    float _1495 = float(_1483);
    float _1497 = _1495 / _1491;
    int _1499 = int(_1497);
    return _1499;
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
    float2 _676 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_676, float2(0.0), isnan(_676))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_676, float2(0.0), isnan(_676))).x;
    float _70 = in.m_33.x;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_35.x;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = _62 * _74;
    float _84 = _62 * _80;
    bool _88 = _68 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_88)
    {
        discard_fragment();
    }
    float _90 = fma(_68, _82, _84);
    float _92 = precise::clamp(_90, 0.0, 1.0);
    if (_88)
    {
        out.m_38.x = 0.0;
        out.m_38.y = 0.0;
        out.m_38.z = 0.0;
        out.m_38.w = 0.0;
        return out;
    }
    bool _94 = _92 != 0.0;
    bool _96 = isnan(_92);
    bool _98 = _94 || _96;
    bool _100 = isnan(0.0);
    bool _102 = _98 || _100;
    bool _104 = !_102;
    if (!_104)
    {
        float _106 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _108 = fma(_92, _106, 1.0);
        float _110 = log2(_108);
        float _112 = _110 + (-1.0);
        float _114 = trunc(_112);
        int _116 = int(_114);
        float _118 = float(_116);
        float _120 = trunc(_118);
        int _122 = int(_120);
        float _124 = _118 + 1.0;
        float _126 = trunc(_124);
        int _128 = int(_126);
        int _130 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_122), spvDescriptorSet0.fp_t_tcb_A.get_height(_122)).x;
        int _132 = _130;
        int _134 = 1;
        int _136 = _44(_132, _134, (*spvDescriptorSet0.support_buffer));
        int _138 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_122), spvDescriptorSet0.fp_t_tcb_A.get_height(_122)).y;
        int _140 = _138;
        int _142 = 1;
        int _144 = _44(_140, _142, (*spvDescriptorSet0.support_buffer));
        int _146 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_128), spvDescriptorSet0.fp_t_tcb_A.get_height(_128)).x;
        int _148 = _146;
        int _150 = 1;
        int _152 = _44(_148, _150, (*spvDescriptorSet0.support_buffer));
        int _154 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_128), spvDescriptorSet0.fp_t_tcb_A.get_height(_128)).y;
        int _156 = _154;
        int _158 = 1;
        int _160 = _44(_156, _158, (*spvDescriptorSet0.support_buffer));
        float _162 = float(_136);
        float _164 = float(_144);
        float _166 = 1.0 / _162;
        float _168 = fma(_64, _162, -0.5);
        float _170 = fma(_66, _164, -0.5);
        float _172 = floor(_168);
        float _174 = float(_152);
        float _176 = fma(_64, _174, -0.5);
        float _178 = float(_160);
        float _180 = floor(_170);
        float _182 = fma(_66, _178, -0.5);
        float _184 = -_172;
        float _186 = _168 + _184;
        float _188 = floor(_176);
        float _190 = -_186;
        float _192 = _190 + 1.0;
        float _194 = -_186;
        float _196 = _194 + 2.0;
        float _198 = _192 * _192;
        float _200 = -_180;
        float _202 = _170 + _200;
        float _204 = _196 * _196;
        float _206 = floor(_182);
        float _208 = _192 * _198;
        float _210 = -_202;
        float _212 = _210 + 1.0;
        float _214 = -_202;
        float _216 = _214 + 2.0;
        float _218 = _208 * 4.0;
        float _220 = _212 * _212;
        float _222 = 1.0 / _164;
        float _224 = -_218;
        float _226 = fma(_196, _204, _224);
        float _228 = -_208;
        float _230 = _228 + 6.0;
        float _232 = _212 * _220;
        float _234 = _216 * _216;
        float _236 = -_226;
        float _238 = _236 + _230;
        float _240 = _232 * 4.0;
        float _242 = 1.0 / _174;
        float _244 = _238 * 0.16666667163372039794921875;
        float _246 = -_188;
        float _248 = _176 + _246;
        float _250 = -_240;
        float _252 = fma(_216, _234, _250);
        float _254 = -_232;
        float _256 = _254 + 6.0;
        float _258 = -_206;
        float _260 = _182 + _258;
        float _262 = -_248;
        float _264 = _262 + 1.0;
        float _266 = -_248;
        float _268 = _266 + 2.0;
        float _270 = -_252;
        float _272 = _270 + _256;
        float _274 = -_260;
        float _276 = _274 + 1.0;
        float _278 = _264 * _264;
        float _280 = _268 * _268;
        float _282 = _272 * 0.16666667163372039794921875;
        float _284 = _276 * _276;
        float _286 = _264 * _278;
        float _288 = -_260;
        float _290 = _288 + 2.0;
        float _292 = _208 + _226;
        float _294 = _276 * _284;
        float _296 = _286 * 4.0;
        float _298 = _232 + _252;
        float _300 = -_286;
        float _302 = _300 + 6.0;
        float _304 = 1.0 / _244;
        float _306 = -_296;
        float _308 = fma(_268, _280, _306);
        float _310 = _290 * _290;
        float _312 = _294 * 4.0;
        float _314 = _292 * 0.16666667163372039794921875;
        float _316 = -_308;
        float _318 = _316 + _302;
        float _320 = -_294;
        float _322 = _320 + 6.0;
        float _324 = -_312;
        float _326 = fma(_290, _310, _324);
        float _328 = _186 * _186;
        float _330 = 1.0 / _314;
        float _332 = _298 * 0.16666667163372039794921875;
        float _334 = -_326;
        float _336 = _334 + _322;
        float _338 = _186 * _328;
        float _340 = _172 + 1.5;
        float _342 = _294 + _326;
        float _344 = _336 * 0.16666667163372039794921875;
        float _346 = _338 * 0.16666667163372039794921875;
        float _348 = _286 + _308;
        float _350 = 1.0 / _332;
        float _352 = _226 * 0.16666667163372039794921875;
        float _354 = fma(_346, _304, _340);
        float _356 = _172 + (-0.5);
        float _358 = _348 * 0.16666667163372039794921875;
        float _360 = _180 + (-0.5);
        float _362 = _180 + 1.5;
        float _364 = _252 * 0.16666667163372039794921875;
        float _366 = 1.0 / _282;
        float _368 = _342 * 0.16666667163372039794921875;
        float _370 = _202 * _202;
        float _372 = fma(_352, _330, _356);
        float _374 = _318 * 0.16666667163372039794921875;
        float _376 = _260 * _260;
        float _378 = _202 * _370;
        float _380 = 1.0 / _344;
        float _382 = fma(_364, _350, _360);
        float _384 = _378 * 0.16666667163372039794921875;
        float _386 = _260 * _376;
        float _388 = _372 * _166;
        float _390 = _354 * _166;
        float _392 = _248 * _248;
        float _394 = _206 + (-0.5);
        float _396 = 1.0 / _368;
        float _398 = fma(_384, _366, _362);
        float _400 = _206 + 1.5;
        float _402 = _326 * 0.16666667163372039794921875;
        float _404 = _386 * 0.16666667163372039794921875;
        float _406 = _248 * _392;
        float _408 = _382 * _222;
        float _410 = _398 * _222;
        float _412 = 1.0 / _178;
        float _414 = fma(_404, _380, _400);
        float _416 = _188 + (-0.5);
        float _418 = _188 + 1.5;
        float _420 = _308 * 0.16666667163372039794921875;
        float _422 = _406 * 0.16666667163372039794921875;
        float _424 = 1.0 / _374;
        float _426 = fma(_402, _396, _394);
        float _428 = 1.0 / _358;
        float _430 = _426 * _412;
        float _432 = _414 * _412;
        float _434 = fma(_422, _424, _418);
        float2 _1147 = float2(_388, _408);
        float3 _438 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1147, float2(0.0), isnan(_1147)), level(_118)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1147, float2(0.0), isnan(_1147)), level(_118)).xyz;
        float _440 = _438.x;
        float _442 = _438.y;
        float _444 = _438.z;
        float2 _1162 = float2(_390, _408);
        float3 _446 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1162, float2(0.0), isnan(_1162)), level(_118)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1162, float2(0.0), isnan(_1162)), level(_118)).xyz;
        float _448 = _446.x;
        float _450 = _446.y;
        float _452 = _446.z;
        float2 _1177 = float2(_388, _410);
        float3 _454 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1177, float2(0.0), isnan(_1177)), level(_118)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1177, float2(0.0), isnan(_1177)), level(_118)).xyz;
        float _456 = _454.x;
        float _458 = _454.y;
        float _460 = _454.z;
        float _462 = fma(_420, _428, _416);
        float _464 = _462 * _242;
        float _466 = _434 * _242;
        float2 _1202 = float2(_390, _410);
        float3 _468 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1202, float2(0.0), isnan(_1202)), level(_118)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1202, float2(0.0), isnan(_1202)), level(_118)).xyz;
        float _470 = _468.x;
        float _472 = _468.y;
        float _474 = _468.z;
        float2 _1217 = float2(_464, _430);
        float3 _476 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1217, float2(0.0), isnan(_1217)), level(_124)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1217, float2(0.0), isnan(_1217)), level(_124)).xyz;
        float _478 = _476.x;
        float _480 = _476.y;
        float _482 = _476.z;
        float2 _1232 = float2(_466, _430);
        float3 _484 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1232, float2(0.0), isnan(_1232)), level(_124)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1232, float2(0.0), isnan(_1232)), level(_124)).xyz;
        float _486 = _484.x;
        float _488 = _484.y;
        float _490 = _484.z;
        float2 _1247 = float2(_464, _432);
        float3 _492 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1247, float2(0.0), isnan(_1247)), level(_124)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1247, float2(0.0), isnan(_1247)), level(_124)).xyz;
        float _494 = _492.x;
        float _496 = _492.y;
        float _498 = _492.z;
        float2 _1262 = float2(_466, _432);
        float3 _500 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1262, float2(0.0), isnan(_1262)), level(_124)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1262, float2(0.0), isnan(_1262)), level(_124)).xyz;
        float _502 = _500.x;
        float _504 = _500.y;
        float _506 = _500.z;
        float _508 = 0.0 + _110;
        float _510 = precise::clamp(_508, 0.0, 1.0);
        float _512 = -_118;
        float _514 = _112 + _512;
        float _516 = precise::clamp(_514, 0.0, 1.0);
        float _518 = -_448;
        float _520 = _440 + _518;
        float _522 = -_450;
        float _524 = _442 + _522;
        float _526 = -_452;
        float _528 = _444 + _526;
        float _530 = fma(_314, _520, _448);
        float _532 = fma(_314, _524, _450);
        float _534 = fma(_314, _528, _452);
        float _536 = -_472;
        float _538 = _458 + _536;
        float _540 = -_470;
        float _542 = _456 + _540;
        float _544 = -_474;
        float _546 = _460 + _544;
        float _548 = fma(_314, _538, _472);
        float _550 = fma(_314, _542, _470);
        float _552 = -_488;
        float _554 = _480 + _552;
        float _556 = -_486;
        float _558 = _478 + _556;
        float _560 = -_548;
        float _562 = _560 + _532;
        float _564 = -_490;
        float _566 = _482 + _564;
        float _568 = fma(_358, _554, _488);
        float _570 = -_502;
        float _572 = _494 + _570;
        float _574 = fma(_332, _562, _548);
        float _576 = -_504;
        float _578 = _496 + _576;
        float _580 = -_506;
        float _582 = _498 + _580;
        float _584 = fma(_314, _546, _474);
        float _586 = fma(_358, _558, _486);
        float _588 = fma(_358, _572, _502);
        float _590 = fma(_358, _578, _504);
        float _592 = fma(_358, _566, _490);
        float _594 = fma(_358, _582, _506);
        float _596 = -_584;
        float _598 = _596 + _534;
        float _600 = -_550;
        float _602 = _600 + _530;
        float _604 = -_588;
        float _606 = _604 + _586;
        float _608 = -_590;
        float _610 = _608 + _568;
        float _612 = -_594;
        float _614 = _612 + _592;
        float _616 = fma(_332, _598, _584);
        float _618 = fma(_332, _602, _550);
        float _620 = fma(_368, _606, _588);
        float _622 = fma(_368, _610, _590);
        float _624 = fma(_368, _614, _594);
        float _626 = -_618;
        float _628 = _626 + _620;
        float _630 = -_574;
        float _632 = _630 + _622;
        float _634 = -_616;
        float _636 = _634 + _624;
        float _638 = fma(_516, _628, _618);
        float _640 = fma(_516, _632, _574);
        float _642 = fma(_516, _636, _616);
        out.m_38.x = _638;
        out.m_38.y = _640;
        out.m_38.z = _642;
        out.m_38.w = _510;
        return out;
    }
    discard_fragment();
    return out;
}

