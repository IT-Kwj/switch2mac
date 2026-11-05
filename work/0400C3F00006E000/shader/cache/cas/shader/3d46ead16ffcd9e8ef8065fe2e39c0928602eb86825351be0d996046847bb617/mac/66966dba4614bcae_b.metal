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
int _40(thread const int& _1597, thread const int& _1598, constant _10& support_buffer)
{
    int _1601 = 1 + _1598;
    float _1603 = support_buffer._m5[_1601].x;
    float _1605 = abs(_1603);
    bool _1607 = _1605 == 1.0;
    if (_1607)
    {
        return _1597;
    }
    float _1609 = float(_1597);
    float _1611 = _1609 / _1605;
    int _1613 = int(_1611);
    return _1613;
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
    float2 _714 = float2(_60, _62);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_714, float2(0.0), isnan(_714))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_714, float2(0.0), isnan(_714))).x;
    float _66 = -_64;
    float _68 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _70 = 1.0 / _68;
    float _72 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _74 = precise::clamp(_72, 0.0, 1.0);
    float _76 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _78 = precise::clamp(_76, 0.0, 1.0);
    float _80 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _82 = precise::clamp(_80, 0.0, 1.0);
    bool _86 = _74 != 0.0;
    bool _88 = isnan(_74);
    bool _90 = _86 || _88;
    bool _92 = isnan(0.0);
    bool _94 = _90 || _92;
    bool _96 = !_94;
    if (!_96)
    {
        float _98 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _100 = fma(_74, _98, 1.0);
        float _102 = log2(_100);
        float _104 = _102 + (-1.0);
        float _106 = trunc(_104);
        int _108 = int(_106);
        float _110 = float(_108);
        float _112 = trunc(_110);
        int _114 = int(_112);
        float _116 = _110 + 1.0;
        float _118 = trunc(_116);
        int _120 = int(_118);
        int _122 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_114), spvDescriptorSet0.fp_t_tcb_A.get_height(_114)).x;
        int _124 = _122;
        int _126 = 1;
        int _128 = _40(_124, _126, (*spvDescriptorSet0.support_buffer));
        int _130 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_114), spvDescriptorSet0.fp_t_tcb_A.get_height(_114)).y;
        int _132 = _130;
        int _134 = 1;
        int _136 = _40(_132, _134, (*spvDescriptorSet0.support_buffer));
        int _138 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_120), spvDescriptorSet0.fp_t_tcb_A.get_height(_120)).x;
        int _140 = _138;
        int _142 = 1;
        int _144 = _40(_140, _142, (*spvDescriptorSet0.support_buffer));
        int _146 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_120), spvDescriptorSet0.fp_t_tcb_A.get_height(_120)).y;
        int _148 = _146;
        int _150 = 1;
        int _152 = _40(_148, _150, (*spvDescriptorSet0.support_buffer));
        float _154 = float(_128);
        float _156 = float(_136);
        float _158 = 1.0 / _154;
        float _160 = fma(_60, _154, -0.5);
        float _162 = fma(_62, _156, -0.5);
        float _164 = floor(_160);
        float _166 = floor(_162);
        float _168 = float(_144);
        float _170 = float(_152);
        float _172 = fma(_60, _168, -0.5);
        float _174 = -_164;
        float _176 = _160 + _174;
        float _178 = 1.0 / _156;
        float _180 = fma(_62, _170, -0.5);
        float _182 = -_176;
        float _184 = _182 + 1.0;
        float _186 = -_176;
        float _188 = _186 + 2.0;
        float _190 = -_166;
        float _192 = _162 + _190;
        float _194 = floor(_172);
        float _196 = _184 * _184;
        float _198 = -_192;
        float _200 = _198 + 1.0;
        float _202 = -_192;
        float _204 = _202 + 2.0;
        float _206 = _184 * _196;
        float _208 = _188 * _188;
        float _210 = _200 * _200;
        float _212 = floor(_180);
        float _214 = _206 * 4.0;
        float _216 = _200 * _210;
        float _218 = _204 * _204;
        float _220 = -_214;
        float _222 = fma(_188, _208, _220);
        float _224 = -_206;
        float _226 = _224 + 6.0;
        float _228 = _216 * 4.0;
        float _230 = -_194;
        float _232 = _172 + _230;
        float _234 = _206 + _222;
        float _236 = -_222;
        float _238 = _236 + _226;
        float _240 = -_228;
        float _242 = fma(_204, _218, _240);
        float _244 = -_232;
        float _246 = _244 + 1.0;
        float _248 = -_216;
        float _250 = _248 + 6.0;
        float _252 = _238 * 0.16666667163372039794921875;
        float _254 = -_232;
        float _256 = _254 + 2.0;
        float _258 = _246 * _246;
        float _260 = -_242;
        float _262 = _260 + _250;
        float _264 = -_212;
        float _266 = _180 + _264;
        float _268 = _256 * _256;
        float _270 = _246 * _258;
        float _272 = _262 * 0.16666667163372039794921875;
        float _274 = -_266;
        float _276 = _274 + 1.0;
        float _278 = 1.0 / _252;
        float _280 = _270 * 4.0;
        float _282 = -_270;
        float _284 = _282 + 6.0;
        float _286 = _234 * 0.16666667163372039794921875;
        float _288 = _176 * _176;
        float _290 = -_280;
        float _292 = fma(_256, _268, _290);
        float _294 = _276 * _276;
        float _296 = -_266;
        float _298 = _296 + 2.0;
        float _300 = 1.0 / _286;
        float _302 = -_292;
        float _304 = _302 + _284;
        float _306 = _276 * _294;
        float _308 = _298 * _298;
        float _310 = _176 * _288;
        float _312 = _304 * 0.16666667163372039794921875;
        float _314 = _216 + _242;
        float _316 = _306 * 4.0;
        float _318 = 1.0 / _272;
        float _320 = -_306;
        float _322 = _320 + 6.0;
        float _324 = _314 * 0.16666667163372039794921875;
        float _326 = -_316;
        float _328 = fma(_298, _308, _326);
        float _330 = _164 + 1.5;
        float _332 = _310 * 0.16666667163372039794921875;
        float _334 = _270 + _292;
        float _336 = _222 * 0.16666667163372039794921875;
        float _338 = 1.0 / _324;
        float _340 = fma(_332, _278, _330);
        float _342 = _164 + (-0.5);
        float _344 = _192 * _192;
        float _346 = _334 * 0.16666667163372039794921875;
        float _348 = -_328;
        float _350 = _348 + _322;
        float _352 = _166 + 1.5;
        float _354 = _192 * _344;
        float _356 = fma(_336, _300, _342);
        float _358 = _306 + _328;
        float _360 = _166 + (-0.5);
        float _362 = 1.0 / _346;
        float _364 = _242 * 0.16666667163372039794921875;
        float _366 = _350 * 0.16666667163372039794921875;
        float _368 = _354 * 0.16666667163372039794921875;
        float _370 = _358 * 0.16666667163372039794921875;
        float _372 = fma(_364, _338, _360);
        float _374 = _232 * _232;
        float _376 = fma(_368, _318, _352);
        float _378 = 1.0 / _312;
        float _380 = _266 * _266;
        float _382 = _232 * _374;
        float _384 = _356 * _158;
        float _386 = _372 * _178;
        float _388 = _266 * _380;
        float _390 = _376 * _178;
        float _392 = _194 + (-0.5);
        float _394 = 1.0 / _168;
        float _396 = _292 * 0.16666667163372039794921875;
        float _398 = _194 + 1.5;
        float _400 = _382 * 0.16666667163372039794921875;
        float _402 = _212 + (-0.5);
        float _404 = fma(_396, _362, _392);
        float _406 = _328 * 0.16666667163372039794921875;
        float _408 = _340 * _158;
        float _410 = 1.0 / _370;
        float _412 = fma(_400, _378, _398);
        float _414 = _212 + 1.5;
        float _416 = _388 * 0.16666667163372039794921875;
        float _418 = 1.0 / _366;
        float _420 = _404 * _394;
        float _422 = _412 * _394;
        float _424 = 1.0 / _170;
        float _426 = fma(_406, _410, _402);
        float2 _1181 = float2(_384, _386);
        float3 _430 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1181, float2(0.0), isnan(_1181)), level(_110)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1181, float2(0.0), isnan(_1181)), level(_110)).xyz;
        float _432 = _430.x;
        float _434 = _430.y;
        float _436 = _430.z;
        float _438 = fma(_416, _418, _414);
        float _440 = _426 * _424;
        float _442 = _438 * _424;
        float2 _1206 = float2(_408, _386);
        float3 _444 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1206, float2(0.0), isnan(_1206)), level(_110)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1206, float2(0.0), isnan(_1206)), level(_110)).xyz;
        float _446 = _444.x;
        float _448 = _444.y;
        float _450 = _444.z;
        float2 _1221 = float2(_384, _390);
        float3 _452 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1221, float2(0.0), isnan(_1221)), level(_110)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1221, float2(0.0), isnan(_1221)), level(_110)).xyz;
        float _454 = _452.x;
        float _456 = _452.y;
        float _458 = _452.z;
        float2 _1236 = float2(_408, _390);
        float3 _460 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1236, float2(0.0), isnan(_1236)), level(_110)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1236, float2(0.0), isnan(_1236)), level(_110)).xyz;
        float _462 = _460.x;
        float _464 = _460.y;
        float _466 = _460.z;
        float2 _1251 = float2(_420, _440);
        float3 _468 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1251, float2(0.0), isnan(_1251)), level(_116)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1251, float2(0.0), isnan(_1251)), level(_116)).xyz;
        float _470 = _468.x;
        float _472 = _468.y;
        float _474 = _468.z;
        float2 _1266 = float2(_422, _440);
        float3 _476 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1266, float2(0.0), isnan(_1266)), level(_116)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1266, float2(0.0), isnan(_1266)), level(_116)).xyz;
        float _478 = _476.x;
        float _480 = _476.y;
        float _482 = _476.z;
        float2 _1281 = float2(_420, _442);
        float3 _484 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1281, float2(0.0), isnan(_1281)), level(_116)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1281, float2(0.0), isnan(_1281)), level(_116)).xyz;
        float _486 = _484.x;
        float _488 = _484.y;
        float _490 = _484.z;
        float2 _1296 = float2(_422, _442);
        float3 _492 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1296, float2(0.0), isnan(_1296)), level(_116)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1296, float2(0.0), isnan(_1296)), level(_116)).xyz;
        float _494 = _492.x;
        float _496 = _492.y;
        float _498 = _492.z;
        float _500 = precise::min(_78, _82);
        float _502 = -_110;
        float _504 = _104 + _502;
        float _506 = precise::clamp(_504, 0.0, 1.0);
        float _508 = 0.0 + _102;
        float _510 = precise::clamp(_508, 0.0, 1.0);
        float _512 = -_446;
        float _514 = _432 + _512;
        float _516 = -_448;
        float _518 = _434 + _516;
        float _520 = -_462;
        float _522 = _454 + _520;
        float _524 = -_450;
        float _526 = _436 + _524;
        float _528 = fma(_286, _514, _446);
        float _530 = -_464;
        float _532 = _456 + _530;
        float _534 = fma(_286, _522, _462);
        float _536 = fma(_286, _518, _448);
        float _538 = -_466;
        float _540 = _458 + _538;
        float _542 = fma(_286, _532, _464);
        float _544 = -_534;
        float _546 = _544 + _528;
        float _548 = -_478;
        float _550 = _470 + _548;
        float _552 = -_482;
        float _554 = _474 + _552;
        float _556 = -_496;
        float _558 = _488 + _556;
        float _560 = fma(_324, _546, _534);
        float _562 = -_480;
        float _564 = _472 + _562;
        float _566 = -_494;
        float _568 = _486 + _566;
        float _570 = fma(_346, _558, _496);
        float _572 = -_542;
        float _574 = _572 + _536;
        float _576 = fma(_346, _564, _480);
        float _578 = fma(_346, _550, _478);
        float _580 = fma(_346, _568, _494);
        float _582 = -_498;
        float _584 = _490 + _582;
        float _586 = -_570;
        float _588 = _586 + _576;
        float _590 = fma(_286, _526, _450);
        float _592 = fma(_286, _540, _466);
        float _594 = fma(_324, _574, _542);
        float _596 = fma(_346, _554, _482);
        float _598 = -_580;
        float _600 = _598 + _578;
        float _602 = fma(_346, _584, _498);
        float _604 = fma(_370, _588, _570);
        float _606 = -_592;
        float _608 = _606 + _590;
        float _610 = fma(_370, _600, _580);
        float _612 = -_602;
        float _614 = _612 + _596;
        float _616 = -_594;
        float _618 = _616 + _604;
        float _620 = fma(_324, _608, _592);
        float _622 = -_560;
        float _624 = _622 + _610;
        float _626 = fma(_370, _614, _602);
        float _628 = fma(_506, _618, _594);
        float _630 = fma(_506, _624, _560);
        float _632 = -_620;
        float _634 = _632 + _626;
        float _636 = _628 * 0.586600005626678466796875;
        float _638 = _500 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _640 = fma(_506, _634, _620);
        float _642 = fma(_630, 0.29890000820159912109375, _636);
        float _644 = fma(_640, 0.1143999993801116943359375, _642);
        float _646 = -_630;
        float _648 = _646 + _644;
        float _650 = -_628;
        float _652 = _650 + _644;
        float _654 = -_640;
        float _656 = _654 + _644;
        float _658 = fma(_638, _648, _630);
        float _660 = fma(_638, _652, _628);
        float _662 = fma(_638, _656, _640);
        float _664 = -_658;
        float _666 = fma(_658, (*spvDescriptorSet0.fp_c3)._m0[13].x, _664);
        float _668 = -_660;
        float _670 = fma(_660, (*spvDescriptorSet0.fp_c3)._m0[13].y, _668);
        float _672 = -_662;
        float _674 = fma(_662, (*spvDescriptorSet0.fp_c3)._m0[13].z, _672);
        float _676 = fma(_500, _666, _658);
        float _678 = fma(_500, _670, _660);
        float _680 = fma(_500, _674, _662);
        out.m_34.x = _676;
        out.m_34.y = _678;
        out.m_34.z = _680;
        out.m_34.w = _510;
        return out;
    }
    discard_fragment();
    return out;
}

