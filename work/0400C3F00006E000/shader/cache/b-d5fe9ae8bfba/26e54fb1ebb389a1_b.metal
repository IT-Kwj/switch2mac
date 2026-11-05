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
int _42(thread const int& _1554, thread const int& _1555, constant _10& support_buffer)
{
    int _1558 = 1 + _1555;
    float _1560 = support_buffer._m5[_1558].x;
    float _1562 = abs(_1560);
    bool _1564 = _1562 == 1.0;
    if (_1564)
    {
        return _1554;
    }
    float _1566 = float(_1554);
    float _1568 = _1566 / _1562;
    int _1570 = int(_1568);
    return _1570;
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
    float2 _704 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_704, float2(0.0), isnan(_704))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_704, float2(0.0), isnan(_704))).x;
    float _68 = in.m_33.y;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_33.z;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_33.x;
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
    float _102 = precise::max(_100, _88);
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
        float _186 = float(_164);
        float _188 = float(_172);
        float _190 = fma(_62, _186, -0.5);
        float _192 = floor(_182);
        float _194 = fma(_64, _188, -0.5);
        float _196 = -_184;
        float _198 = _180 + _196;
        float _200 = floor(_190);
        float _202 = -_198;
        float _204 = _202 + 1.0;
        float _206 = -_198;
        float _208 = _206 + 2.0;
        float _210 = _198 * _198;
        float _212 = _204 * _204;
        float _214 = -_192;
        float _216 = _182 + _214;
        float _218 = _208 * _208;
        float _220 = _198 * _210;
        float _222 = _204 * _212;
        float _224 = -_216;
        float _226 = _224 + 1.0;
        float _228 = floor(_194);
        float _230 = -_216;
        float _232 = _230 + 2.0;
        float _234 = _222 * 4.0;
        float _236 = _226 * _226;
        float _238 = -_234;
        float _240 = fma(_208, _218, _238);
        float _242 = _226 * _236;
        float _244 = -_222;
        float _246 = _244 + 6.0;
        float _248 = -_200;
        float _250 = _190 + _248;
        float _252 = _232 * _232;
        float _254 = _242 * 4.0;
        float _256 = -_240;
        float _258 = _256 + _246;
        float _260 = -_250;
        float _262 = _260 + 1.0;
        float _264 = 1.0 / _176;
        float _266 = -_254;
        float _268 = fma(_232, _252, _266);
        float _270 = _258 * 0.16666667163372039794921875;
        float _272 = _262 * _262;
        float _274 = -_250;
        float _276 = _274 + 2.0;
        float _278 = -_242;
        float _280 = _278 + 6.0;
        float _282 = _262 * _272;
        float _284 = -_228;
        float _286 = _194 + _284;
        float _288 = _276 * _276;
        float _290 = _222 + _240;
        float _292 = _282 * 4.0;
        float _294 = -_286;
        float _296 = _294 + 1.0;
        float _298 = 1.0 / _270;
        float _300 = _290 * 0.16666667163372039794921875;
        float _302 = -_292;
        float _304 = fma(_276, _288, _302);
        float _306 = -_282;
        float _308 = _306 + 6.0;
        float _310 = _296 * _296;
        float _312 = -_286;
        float _314 = _312 + 2.0;
        float _316 = -_268;
        float _318 = _316 + _280;
        float _320 = -_304;
        float _322 = _320 + _308;
        float _324 = _296 * _310;
        float _326 = _314 * _314;
        float _328 = 1.0 / _300;
        float _330 = _322 * 0.16666667163372039794921875;
        float _332 = _324 * 4.0;
        float _334 = _242 + _268;
        float _336 = _318 * 0.16666667163372039794921875;
        float _338 = -_324;
        float _340 = _338 + 6.0;
        float _342 = -_332;
        float _344 = fma(_314, _326, _342);
        float _346 = _334 * 0.16666667163372039794921875;
        float _348 = _184 + 1.5;
        float _350 = _220 * 0.16666667163372039794921875;
        float _352 = 1.0 / _336;
        float _354 = -_344;
        float _356 = _354 + _340;
        float _358 = _184 + (-0.5);
        float _360 = fma(_350, _298, _348);
        float _362 = _216 * _216;
        float _364 = _282 + _304;
        float _366 = _240 * 0.16666667163372039794921875;
        float _368 = _356 * 0.16666667163372039794921875;
        float _370 = 1.0 / _346;
        float _372 = _216 * _362;
        float _374 = _324 + _344;
        float _376 = _364 * 0.16666667163372039794921875;
        float _378 = fma(_366, _328, _358);
        float _380 = _192 + (-0.5);
        float _382 = _374 * 0.16666667163372039794921875;
        float _384 = _268 * 0.16666667163372039794921875;
        float _386 = _192 + 1.5;
        float _388 = 1.0 / _368;
        float _390 = _372 * 0.16666667163372039794921875;
        float _392 = fma(_390, _352, _386);
        float _394 = _250 * _250;
        float _396 = fma(_384, _370, _380);
        float _398 = 1.0 / _382;
        float _400 = _378 * _178;
        float _402 = _286 * _286;
        float _404 = _250 * _394;
        float _406 = _360 * _178;
        float _408 = _396 * _264;
        float _410 = _286 * _402;
        float _412 = _392 * _264;
        float _414 = 1.0 / _330;
        float _416 = _228 + (-0.5);
        float _418 = _228 + 1.5;
        float _420 = _304 * 0.16666667163372039794921875;
        float _422 = _200 + (-0.5);
        float _424 = _200 + 1.5;
        float _426 = _344 * 0.16666667163372039794921875;
        float _428 = _410 * 0.16666667163372039794921875;
        float _430 = 1.0 / _376;
        float _432 = _404 * 0.16666667163372039794921875;
        float _434 = fma(_426, _398, _416);
        float _436 = fma(_428, _388, _418);
        float _438 = 1.0 / _188;
        float _440 = fma(_432, _414, _424);
        float _442 = 1.0 / _186;
        float _444 = fma(_420, _430, _422);
        float2 _1186 = float2(_400, _408);
        float3 _448 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1186, float2(0.0), isnan(_1186)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1186, float2(0.0), isnan(_1186)), level(_130)).xyz;
        float _450 = _448.x;
        float _452 = _448.y;
        float _454 = _448.z;
        float2 _1201 = float2(_406, _408);
        float3 _456 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1201, float2(0.0), isnan(_1201)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1201, float2(0.0), isnan(_1201)), level(_130)).xyz;
        float _458 = _456.x;
        float _460 = _456.y;
        float _462 = _456.z;
        float2 _1216 = float2(_400, _412);
        float3 _464 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1216, float2(0.0), isnan(_1216)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1216, float2(0.0), isnan(_1216)), level(_130)).xyz;
        float _466 = _464.x;
        float _468 = _464.y;
        float _470 = _464.z;
        float2 _1231 = float2(_406, _412);
        float3 _472 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1231, float2(0.0), isnan(_1231)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1231, float2(0.0), isnan(_1231)), level(_130)).xyz;
        float _474 = _472.x;
        float _476 = _472.y;
        float _478 = _472.z;
        float _480 = _434 * _438;
        float _482 = _444 * _442;
        float _484 = _440 * _442;
        float _486 = _436 * _438;
        float2 _1258 = float2(_482, _480);
        float3 _488 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1258, float2(0.0), isnan(_1258)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1258, float2(0.0), isnan(_1258)), level(_136)).xyz;
        float _490 = _488.x;
        float _492 = _488.y;
        float _494 = _488.z;
        float2 _1273 = float2(_484, _480);
        float3 _496 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1273, float2(0.0), isnan(_1273)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1273, float2(0.0), isnan(_1273)), level(_136)).xyz;
        float _498 = _496.x;
        float _500 = _496.y;
        float _502 = _496.z;
        float2 _1288 = float2(_482, _486);
        float3 _504 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1288, float2(0.0), isnan(_1288)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1288, float2(0.0), isnan(_1288)), level(_136)).xyz;
        float _506 = _504.x;
        float _508 = _504.y;
        float _510 = _504.z;
        float2 _1303 = float2(_484, _486);
        float3 _512 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1303, float2(0.0), isnan(_1303)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1303, float2(0.0), isnan(_1303)), level(_136)).xyz;
        float _514 = _512.x;
        float _516 = _512.y;
        float _518 = _512.z;
        float _520 = 0.0 + _122;
        float _522 = precise::clamp(_520, 0.0, 1.0);
        float _524 = fma(_86, _522, _90);
        float _526 = -_130;
        float _528 = _124 + _526;
        float _530 = precise::clamp(_528, 0.0, 1.0);
        float _532 = _522 * _86;
        float _534 = -_460;
        float _536 = _452 + _534;
        float _538 = -_458;
        float _540 = _450 + _538;
        float _542 = -_474;
        float _544 = _466 + _542;
        float _546 = -_462;
        float _548 = _454 + _546;
        float _550 = -_478;
        float _552 = _470 + _550;
        float _554 = fma(_300, _540, _458);
        float _556 = fma(_300, _544, _474);
        float _558 = -_476;
        float _560 = _468 + _558;
        float _562 = fma(_300, _548, _462);
        float _564 = fma(_300, _552, _478);
        float _566 = fma(_300, _536, _460);
        float _568 = fma(_300, _560, _476);
        float _570 = -_556;
        float _572 = _570 + _554;
        float _574 = -_564;
        float _576 = _574 + _562;
        float _578 = -_500;
        float _580 = _492 + _578;
        float _582 = -_502;
        float _584 = _494 + _582;
        float _586 = -_498;
        float _588 = _490 + _586;
        float _590 = 1.0 / _524;
        float _592 = -_518;
        float _594 = _510 + _592;
        float _596 = fma(_376, _580, _500);
        float _598 = -_514;
        float _600 = _506 + _598;
        float _602 = -_516;
        float _604 = _508 + _602;
        float _606 = fma(_376, _584, _502);
        float _608 = fma(_376, _594, _518);
        float _610 = fma(_376, _588, _498);
        float _612 = fma(_376, _600, _514);
        float _614 = fma(_376, _604, _516);
        float _616 = -_608;
        float _618 = _616 + _606;
        float _620 = fma(_346, _572, _556);
        float _622 = -_612;
        float _624 = _622 + _610;
        float _626 = -_568;
        float _628 = _626 + _566;
        float _630 = -_614;
        float _632 = _630 + _596;
        float _634 = fma(_346, _576, _564);
        float _636 = fma(_382, _618, _608);
        float _638 = fma(_382, _624, _612);
        float _640 = fma(_346, _628, _568);
        float _642 = fma(_382, _632, _614);
        float _644 = -_634;
        float _646 = _644 + _636;
        float _648 = -_620;
        float _650 = _648 + _638;
        float _652 = _590 * _532;
        float _654 = -_640;
        float _656 = _654 + _642;
        float _658 = fma(_530, _646, _634);
        float _660 = fma(_530, _650, _620);
        float _662 = fma(_530, _656, _640);
        float _664 = _658 * _532;
        float _666 = _660 * _652;
        float _668 = _662 * _652;
        float _670 = _664 * _590;
        out.m_36.x = _666;
        out.m_36.y = _668;
        out.m_36.z = _670;
        out.m_36.w = _524;
        return out;
    }
    out.m_36.x = 0.0;
    out.m_36.y = 0.0;
    out.m_36.z = 0.0;
    out.m_36.w = _90;
    return out;
}

