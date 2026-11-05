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
int _42(thread const int& _1609, thread const int& _1610, constant _10& support_buffer)
{
    int _1613 = 1 + _1610;
    float _1615 = support_buffer._m5[_1613].x;
    float _1617 = abs(_1615);
    bool _1619 = _1617 == 1.0;
    if (_1619)
    {
        return _1609;
    }
    float _1621 = float(_1609);
    float _1623 = _1621 / _1617;
    int _1625 = int(_1623);
    return _1625;
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
    float2 _722 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_722, float2(0.0), isnan(_722))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_722, float2(0.0), isnan(_722))).x;
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
        float _210 = -_192;
        float _212 = _182 + _210;
        float _214 = _204 * _204;
        float _216 = _208 * _208;
        float _218 = floor(_194);
        float _220 = -_212;
        float _222 = _220 + 1.0;
        float _224 = _204 * _214;
        float _226 = -_212;
        float _228 = _226 + 2.0;
        float _230 = _222 * _222;
        float _232 = _224 * 4.0;
        float _234 = _228 * _228;
        float _236 = 1.0 / _176;
        float _238 = _222 * _230;
        float _240 = -_232;
        float _242 = fma(_208, _216, _240);
        float _244 = -_224;
        float _246 = _244 + 6.0;
        float _248 = -_200;
        float _250 = _190 + _248;
        float _252 = _238 * 4.0;
        float _254 = -_242;
        float _256 = _254 + _246;
        float _258 = -_250;
        float _260 = _258 + 1.0;
        float _262 = -_252;
        float _264 = fma(_228, _234, _262);
        float _266 = -_250;
        float _268 = _266 + 2.0;
        float _270 = _256 * 0.16666667163372039794921875;
        float _272 = _260 * _260;
        float _274 = -_218;
        float _276 = _194 + _274;
        float _278 = -_238;
        float _280 = _278 + 6.0;
        float _282 = _268 * _268;
        float _284 = _260 * _272;
        float _286 = -_276;
        float _288 = _286 + 1.0;
        float _290 = -_264;
        float _292 = _290 + _280;
        float _294 = 1.0 / _270;
        float _296 = _284 * 4.0;
        float _298 = _292 * 0.16666667163372039794921875;
        float _300 = _224 + _242;
        float _302 = -_296;
        float _304 = fma(_268, _282, _302);
        float _306 = _288 * _288;
        float _308 = -_284;
        float _310 = _308 + 6.0;
        float _312 = -_276;
        float _314 = _312 + 2.0;
        float _316 = _300 * 0.16666667163372039794921875;
        float _318 = _288 * _306;
        float _320 = _198 * _198;
        float _322 = -_304;
        float _324 = _322 + _310;
        float _326 = _314 * _314;
        float _328 = _318 * 4.0;
        float _330 = 1.0 / _316;
        float _332 = _198 * _320;
        float _334 = _324 * 0.16666667163372039794921875;
        float _336 = -_328;
        float _338 = fma(_314, _326, _336);
        float _340 = _238 + _264;
        float _342 = -_318;
        float _344 = _342 + 6.0;
        float _346 = _184 + 1.5;
        float _348 = _332 * 0.16666667163372039794921875;
        float _350 = 1.0 / _298;
        float _352 = _340 * 0.16666667163372039794921875;
        float _354 = -_338;
        float _356 = _354 + _344;
        float _358 = fma(_348, _294, _346);
        float _360 = _212 * _212;
        float _362 = _284 + _304;
        float _364 = _356 * 0.16666667163372039794921875;
        float _366 = _184 + (-0.5);
        float _368 = 1.0 / _352;
        float _370 = _242 * 0.16666667163372039794921875;
        float _372 = _212 * _360;
        float _374 = _318 + _338;
        float _376 = _362 * 0.16666667163372039794921875;
        float _378 = fma(_370, _330, _366);
        float _380 = _192 + (-0.5);
        float _382 = _192 + 1.5;
        float _384 = 1.0 / _334;
        float _386 = _374 * 0.16666667163372039794921875;
        float _388 = _264 * 0.16666667163372039794921875;
        float _390 = _250 * _250;
        float _392 = _304 * 0.16666667163372039794921875;
        float _394 = _338 * 0.16666667163372039794921875;
        float _396 = _250 * _390;
        float _398 = 1.0 / _376;
        float _400 = _372 * 0.16666667163372039794921875;
        float _402 = fma(_388, _368, _380);
        float _404 = _200 + (-0.5);
        float _406 = _396 * 0.16666667163372039794921875;
        float _408 = fma(_400, _350, _382);
        float _410 = _378 * _178;
        float _412 = _358 * _178;
        float _414 = 1.0 / _364;
        float _416 = _276 * _276;
        float _418 = _402 * _236;
        float _420 = _408 * _236;
        float _422 = _218 + (-0.5);
        float _424 = _276 * _416;
        float _426 = _200 + 1.5;
        float _428 = _218 + 1.5;
        float _430 = 1.0 / _386;
        float _432 = _424 * 0.16666667163372039794921875;
        float _434 = fma(_392, _398, _404);
        float _436 = fma(_406, _384, _426);
        float _438 = 1.0 / _186;
        float _440 = fma(_432, _414, _428);
        float _442 = 1.0 / _188;
        float _444 = fma(_394, _430, _422);
        float2 _1204 = float2(_410, _418);
        float3 _448 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1204, float2(0.0), isnan(_1204)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1204, float2(0.0), isnan(_1204)), level(_130)).xyz;
        float _450 = _448.x;
        float _452 = _448.y;
        float _454 = _448.z;
        float _456 = _434 * _438;
        float _458 = _436 * _438;
        float _460 = _444 * _442;
        float _462 = _440 * _442;
        float2 _1231 = float2(_412, _418);
        float3 _464 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1231, float2(0.0), isnan(_1231)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1231, float2(0.0), isnan(_1231)), level(_130)).xyz;
        float _466 = _464.x;
        float _468 = _464.y;
        float _470 = _464.z;
        float2 _1246 = float2(_410, _420);
        float3 _472 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1246, float2(0.0), isnan(_1246)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1246, float2(0.0), isnan(_1246)), level(_130)).xyz;
        float _474 = _472.x;
        float _476 = _472.y;
        float _478 = _472.z;
        float2 _1261 = float2(_412, _420);
        float3 _480 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1261, float2(0.0), isnan(_1261)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1261, float2(0.0), isnan(_1261)), level(_130)).xyz;
        float _482 = _480.x;
        float _484 = _480.y;
        float _486 = _480.z;
        float2 _1276 = float2(_456, _460);
        float3 _488 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1276, float2(0.0), isnan(_1276)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1276, float2(0.0), isnan(_1276)), level(_136)).xyz;
        float _490 = _488.x;
        float _492 = _488.y;
        float _494 = _488.z;
        float2 _1291 = float2(_458, _460);
        float3 _496 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1291, float2(0.0), isnan(_1291)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1291, float2(0.0), isnan(_1291)), level(_136)).xyz;
        float _498 = _496.x;
        float _500 = _496.y;
        float _502 = _496.z;
        float2 _1306 = float2(_456, _462);
        float3 _504 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1306, float2(0.0), isnan(_1306)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1306, float2(0.0), isnan(_1306)), level(_136)).xyz;
        float _506 = _504.x;
        float _508 = _504.y;
        float _510 = _504.z;
        float2 _1321 = float2(_458, _462);
        float3 _512 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1321, float2(0.0), isnan(_1321)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1321, float2(0.0), isnan(_1321)), level(_136)).xyz;
        float _514 = _512.x;
        float _516 = _512.y;
        float _518 = _512.z;
        float _520 = -_130;
        float _522 = _124 + _520;
        float _524 = precise::clamp(_522, 0.0, 1.0);
        float _526 = -_466;
        float _528 = _450 + _526;
        float _530 = -_468;
        float _532 = _452 + _530;
        float _534 = -_482;
        float _536 = _474 + _534;
        float _538 = -_470;
        float _540 = _454 + _538;
        float _542 = fma(_316, _528, _466);
        float _544 = -_484;
        float _546 = _476 + _544;
        float _548 = fma(_316, _536, _482);
        float _550 = -_486;
        float _552 = _478 + _550;
        float _554 = fma(_316, _532, _468);
        float _556 = fma(_316, _546, _484);
        float _558 = -_498;
        float _560 = _490 + _558;
        float _562 = fma(_316, _552, _486);
        float _564 = -_502;
        float _566 = _494 + _564;
        float _568 = -_556;
        float _570 = _568 + _554;
        float _572 = -_500;
        float _574 = _492 + _572;
        float _576 = -_514;
        float _578 = _506 + _576;
        float _580 = -_518;
        float _582 = _510 + _580;
        float _584 = fma(_352, _570, _556);
        float _586 = fma(_376, _574, _500);
        float _588 = -_516;
        float _590 = _508 + _588;
        float _592 = fma(_376, _560, _498);
        float _594 = fma(_376, _566, _502);
        float _596 = fma(_376, _578, _514);
        float _598 = fma(_376, _590, _516);
        float _600 = fma(_316, _540, _470);
        float _602 = fma(_376, _582, _518);
        float _604 = -_548;
        float _606 = _604 + _542;
        float _608 = -_596;
        float _610 = _608 + _592;
        float _612 = -_562;
        float _614 = _612 + _600;
        float _616 = -_598;
        float _618 = _616 + _586;
        float _620 = -_602;
        float _622 = _620 + _594;
        float _624 = fma(_352, _606, _548);
        float _626 = fma(_386, _610, _596);
        float _628 = 0.0 + _122;
        float _630 = precise::clamp(_628, 0.0, 1.0);
        float _632 = fma(_352, _614, _562);
        float _634 = fma(_386, _618, _598);
        float _636 = fma(_386, _622, _602);
        float _638 = -_624;
        float _640 = _638 + _626;
        float _642 = fma(_88, _630, _86);
        float _644 = -_584;
        float _646 = _644 + _634;
        float _648 = -_632;
        float _650 = _648 + _636;
        float _652 = fma(_524, _640, _624);
        float _654 = 1.0 / _642;
        float _656 = fma(_524, _646, _584);
        float _658 = fma(_524, _650, _632);
        float _660 = _630 * _652;
        float _662 = _630 * _656;
        float _664 = _630 * _658;
        float _666 = -_660;
        float _668 = _666 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
        float _670 = -_662;
        float _672 = _670 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
        float _674 = -_664;
        float _676 = _674 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
        float _678 = fma(_86, _668, _660);
        float _680 = fma(_86, _672, _662);
        float _682 = fma(_86, _676, _664);
        float _684 = _678 * _654;
        float _686 = _680 * _654;
        float _688 = _682 * _654;
        out.m_36.x = _684;
        out.m_36.y = _686;
        out.m_36.z = _688;
        out.m_36.w = _642;
        return out;
    }
    out.m_36.x = (*spvDescriptorSet0.fp_c3)._m0[12].x;
    out.m_36.y = (*spvDescriptorSet0.fp_c3)._m0[12].y;
    out.m_36.z = (*spvDescriptorSet0.fp_c3)._m0[12].z;
    out.m_36.w = _86;
    return out;
}

