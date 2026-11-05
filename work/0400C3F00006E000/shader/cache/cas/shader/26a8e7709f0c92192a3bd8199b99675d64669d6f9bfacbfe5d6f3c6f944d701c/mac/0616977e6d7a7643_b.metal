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
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _40(thread const int& _1545, thread const int& _1546, constant _10& support_buffer)
{
    int _1549 = 1 + _1546;
    float _1551 = support_buffer._m5[_1549].x;
    float _1553 = abs(_1551);
    bool _1555 = _1553 == 1.0;
    if (_1555)
    {
        return _1545;
    }
    float _1557 = float(_1545);
    float _1559 = _1557 / _1553;
    int _1561 = int(_1559);
    return _1561;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _44 = gl_FragCoord.w;
    float _46 = in.m_31.x;
    float _48 = gl_FragCoord.w;
    float _50 = _46 * _48;
    float _52 = in.m_31.y;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = 1.0 / _44;
    float _60 = _58 * _50;
    float _62 = _58 * _56;
    float2 _690 = float2(_60, _62);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_690, float2(0.0), isnan(_690))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_690, float2(0.0), isnan(_690))).x;
    float _66 = -_64;
    float _68 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _70 = 1.0 / _68;
    bool _74 = _70 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_74)
    {
        discard_fragment();
    }
    if (_74)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return out;
    }
    float _76 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _78 = precise::clamp(_76, 0.0, 1.0);
    float _80 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _82 = precise::clamp(_80, 0.0, 1.0);
    float _84 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _86 = precise::clamp(_84, 0.0, 1.0);
    bool _88 = _78 != 0.0;
    bool _90 = isnan(_78);
    bool _92 = _88 || _90;
    bool _94 = isnan(0.0);
    bool _96 = _92 || _94;
    bool _98 = !_96;
    if (!_98)
    {
        float _100 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _102 = fma(_78, _100, 1.0);
        float _104 = log2(_102);
        float _106 = _104 + (-1.0);
        float _108 = trunc(_106);
        int _110 = int(_108);
        float _112 = float(_110);
        float _114 = trunc(_112);
        int _116 = int(_114);
        float _118 = _112 + 1.0;
        float _120 = trunc(_118);
        int _122 = int(_120);
        int _124 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_116), spvDescriptorSet0.fp_t_tcb_A.get_height(_116)).x;
        int _126 = _124;
        int _128 = 1;
        int _130 = _40(_126, _128, (*spvDescriptorSet0.support_buffer));
        int _132 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_116), spvDescriptorSet0.fp_t_tcb_A.get_height(_116)).y;
        int _134 = _132;
        int _136 = 1;
        int _138 = _40(_134, _136, (*spvDescriptorSet0.support_buffer));
        int _140 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_122), spvDescriptorSet0.fp_t_tcb_A.get_height(_122)).x;
        int _142 = _140;
        int _144 = 1;
        int _146 = _40(_142, _144, (*spvDescriptorSet0.support_buffer));
        int _148 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_122), spvDescriptorSet0.fp_t_tcb_A.get_height(_122)).y;
        int _150 = _148;
        int _152 = 1;
        int _154 = _40(_150, _152, (*spvDescriptorSet0.support_buffer));
        float _156 = float(_130);
        float _158 = float(_138);
        float _160 = 1.0 / _156;
        float _162 = fma(_60, _156, -0.5);
        float _164 = fma(_62, _158, -0.5);
        float _166 = floor(_162);
        float _168 = floor(_164);
        float _170 = float(_146);
        float _172 = float(_154);
        float _174 = fma(_60, _170, -0.5);
        float _176 = -_166;
        float _178 = _162 + _176;
        float _180 = 1.0 / _158;
        float _182 = fma(_62, _172, -0.5);
        float _184 = -_178;
        float _186 = _184 + 1.0;
        float _188 = -_178;
        float _190 = _188 + 2.0;
        float _192 = _178 * _178;
        float _194 = -_168;
        float _196 = _164 + _194;
        float _198 = floor(_174);
        float _200 = _186 * _186;
        float _202 = _190 * _190;
        float _204 = -_196;
        float _206 = _204 + 1.0;
        float _208 = -_196;
        float _210 = _208 + 2.0;
        float _212 = _186 * _200;
        float _214 = _178 * _192;
        float _216 = _206 * _206;
        float _218 = floor(_182);
        float _220 = _212 * 4.0;
        float _222 = _206 * _216;
        float _224 = _210 * _210;
        float _226 = -_220;
        float _228 = fma(_190, _202, _226);
        float _230 = -_212;
        float _232 = _230 + 6.0;
        float _234 = _222 * 4.0;
        float _236 = -_198;
        float _238 = _174 + _236;
        float _240 = _212 + _228;
        float _242 = -_228;
        float _244 = _242 + _232;
        float _246 = -_234;
        float _248 = fma(_210, _224, _246);
        float _250 = -_238;
        float _252 = _250 + 1.0;
        float _254 = -_222;
        float _256 = _254 + 6.0;
        float _258 = _244 * 0.16666667163372039794921875;
        float _260 = -_238;
        float _262 = _260 + 2.0;
        float _264 = _252 * _252;
        float _266 = -_218;
        float _268 = _182 + _266;
        float _270 = -_248;
        float _272 = _270 + _256;
        float _274 = _262 * _262;
        float _276 = _252 * _264;
        float _278 = -_268;
        float _280 = _278 + 1.0;
        float _282 = 1.0 / _258;
        float _284 = _272 * 0.16666667163372039794921875;
        float _286 = _276 * 4.0;
        float _288 = -_268;
        float _290 = _288 + 2.0;
        float _292 = _240 * 0.16666667163372039794921875;
        float _294 = -_286;
        float _296 = fma(_262, _274, _294);
        float _298 = -_276;
        float _300 = _298 + 6.0;
        float _302 = _280 * _280;
        float _304 = 1.0 / _284;
        float _306 = _276 + _296;
        float _308 = -_296;
        float _310 = _308 + _300;
        float _312 = _280 * _302;
        float _314 = _290 * _290;
        float _316 = _306 * 0.16666667163372039794921875;
        float _318 = _310 * 0.16666667163372039794921875;
        float _320 = _312 * 4.0;
        float _322 = 1.0 / _292;
        float _324 = _222 + _248;
        float _326 = -_312;
        float _328 = _326 + 6.0;
        float _330 = -_320;
        float _332 = fma(_290, _314, _330);
        float _334 = _166 + 1.5;
        float _336 = _324 * 0.16666667163372039794921875;
        float _338 = _214 * 0.16666667163372039794921875;
        float _340 = -_332;
        float _342 = _340 + _328;
        float _344 = _312 + _332;
        float _346 = 1.0 / _336;
        float _348 = fma(_338, _282, _334);
        float _350 = _342 * 0.16666667163372039794921875;
        float _352 = _166 + (-0.5);
        float _354 = _196 * _196;
        float _356 = _228 * 0.16666667163372039794921875;
        float _358 = _248 * 0.16666667163372039794921875;
        float _360 = _196 * _354;
        float _362 = fma(_356, _322, _352);
        float _364 = _168 + (-0.5);
        float _366 = 1.0 / _316;
        float _368 = _168 + 1.5;
        float _370 = _360 * 0.16666667163372039794921875;
        float _372 = _344 * 0.16666667163372039794921875;
        float _374 = fma(_358, _346, _364);
        float _376 = _238 * _238;
        float _378 = fma(_370, _304, _368);
        float _380 = 1.0 / _318;
        float _382 = _268 * _268;
        float _384 = _362 * _160;
        float _386 = _238 * _376;
        float _388 = _374 * _180;
        float _390 = _348 * _160;
        float _392 = _378 * _180;
        float _394 = _268 * _382;
        float _396 = 1.0 / _350;
        float _398 = _198 + (-0.5);
        float _400 = _218 + (-0.5);
        float _402 = _218 + 1.5;
        float _404 = _296 * 0.16666667163372039794921875;
        float _406 = _198 + 1.5;
        float _408 = _386 * 0.16666667163372039794921875;
        float _410 = _394 * 0.16666667163372039794921875;
        float _412 = 1.0 / _170;
        float _414 = fma(_404, _366, _398);
        float _416 = fma(_408, _380, _406);
        float _418 = _332 * 0.16666667163372039794921875;
        float _420 = 1.0 / _372;
        float _422 = fma(_410, _396, _402);
        float _424 = 1.0 / _172;
        float _426 = _414 * _412;
        float _428 = _416 * _412;
        float _430 = fma(_418, _420, _400);
        float2 _1176 = float2(_384, _388);
        float3 _434 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1176, float2(0.0), isnan(_1176)), level(_112)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1176, float2(0.0), isnan(_1176)), level(_112)).xyz;
        float _436 = _434.x;
        float _438 = _434.y;
        float _440 = _434.z;
        float _442 = _430 * _424;
        float _444 = _422 * _424;
        float2 _1197 = float2(_390, _388);
        float3 _446 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1197, float2(0.0), isnan(_1197)), level(_112)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1197, float2(0.0), isnan(_1197)), level(_112)).xyz;
        float _448 = _446.x;
        float _450 = _446.y;
        float _452 = _446.z;
        float2 _1212 = float2(_384, _392);
        float3 _454 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1212, float2(0.0), isnan(_1212)), level(_112)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1212, float2(0.0), isnan(_1212)), level(_112)).xyz;
        float _456 = _454.x;
        float _458 = _454.y;
        float _460 = _454.z;
        float2 _1227 = float2(_390, _392);
        float3 _462 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1227, float2(0.0), isnan(_1227)), level(_112)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1227, float2(0.0), isnan(_1227)), level(_112)).xyz;
        float _464 = _462.x;
        float _466 = _462.y;
        float _468 = _462.z;
        float2 _1242 = float2(_426, _442);
        float3 _470 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1242, float2(0.0), isnan(_1242)), level(_118)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1242, float2(0.0), isnan(_1242)), level(_118)).xyz;
        float _472 = _470.x;
        float _474 = _470.y;
        float _476 = _470.z;
        float2 _1257 = float2(_428, _442);
        float3 _478 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1257, float2(0.0), isnan(_1257)), level(_118)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1257, float2(0.0), isnan(_1257)), level(_118)).xyz;
        float _480 = _478.x;
        float _482 = _478.y;
        float _484 = _478.z;
        float2 _1272 = float2(_426, _444);
        float3 _486 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1272, float2(0.0), isnan(_1272)), level(_118)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1272, float2(0.0), isnan(_1272)), level(_118)).xyz;
        float _488 = _486.x;
        float _490 = _486.y;
        float _492 = _486.z;
        float2 _1287 = float2(_428, _444);
        float3 _494 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1287, float2(0.0), isnan(_1287)), level(_118)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1287, float2(0.0), isnan(_1287)), level(_118)).xyz;
        float _496 = _494.x;
        float _498 = _494.y;
        float _500 = _494.z;
        float _502 = precise::min(_82, _86);
        float _504 = -_112;
        float _506 = _106 + _504;
        float _508 = precise::clamp(_506, 0.0, 1.0);
        float _510 = 0.0 + _104;
        float _512 = precise::clamp(_510, 0.0, 1.0);
        float _514 = -_448;
        float _516 = _436 + _514;
        float _518 = -_450;
        float _520 = _438 + _518;
        float _522 = -_464;
        float _524 = _456 + _522;
        float _526 = -_468;
        float _528 = _460 + _526;
        float _530 = fma(_292, _516, _448);
        float _532 = -_466;
        float _534 = _458 + _532;
        float _536 = fma(_292, _520, _450);
        float _538 = fma(_292, _524, _464);
        float _540 = -_452;
        float _542 = _440 + _540;
        float _544 = fma(_292, _534, _466);
        float _546 = -_538;
        float _548 = _546 + _530;
        float _550 = -_482;
        float _552 = _474 + _550;
        float _554 = -_544;
        float _556 = _554 + _536;
        float _558 = -_480;
        float _560 = _472 + _558;
        float _562 = -_496;
        float _564 = _488 + _562;
        float _566 = -_484;
        float _568 = _476 + _566;
        float _570 = fma(_336, _556, _544);
        float _572 = fma(_316, _552, _482);
        float _574 = -_498;
        float _576 = _490 + _574;
        float _578 = -_500;
        float _580 = _492 + _578;
        float _582 = fma(_316, _560, _480);
        float _584 = fma(_316, _564, _496);
        float _586 = fma(_316, _576, _498);
        float _588 = fma(_292, _542, _452);
        float _590 = fma(_292, _528, _468);
        float _592 = fma(_316, _568, _484);
        float _594 = fma(_316, _580, _500);
        float _596 = -_584;
        float _598 = _596 + _582;
        float _600 = -_586;
        float _602 = _600 + _572;
        float _604 = -_590;
        float _606 = _604 + _588;
        float _608 = -_594;
        float _610 = _608 + _592;
        float _612 = fma(_336, _548, _538);
        float _614 = fma(_372, _598, _584);
        float _616 = fma(_372, _602, _586);
        float _618 = fma(_336, _606, _590);
        float _620 = fma(_372, _610, _594);
        float _622 = -_612;
        float _624 = _622 + _614;
        float _626 = -_570;
        float _628 = _626 + _616;
        float _630 = -_618;
        float _632 = _630 + _620;
        float _634 = fma(_508, _624, _612);
        float _636 = fma(_508, _628, _570);
        float _638 = fma(_508, _632, _618);
        float _640 = -_634;
        float _642 = fma(_634, (*spvDescriptorSet0.fp_c3)._m0[13].x, _640);
        float _644 = -_636;
        float _646 = fma(_636, (*spvDescriptorSet0.fp_c3)._m0[13].y, _644);
        float _648 = -_638;
        float _650 = fma(_638, (*spvDescriptorSet0.fp_c3)._m0[13].z, _648);
        float _652 = fma(_502, _642, _634);
        float _654 = fma(_502, _646, _636);
        float _656 = fma(_502, _650, _638);
        out.m_34.x = _652;
        out.m_34.y = _654;
        out.m_34.z = _656;
        out.m_34.w = _512;
        return out;
    }
    discard_fragment();
    return out;
}

