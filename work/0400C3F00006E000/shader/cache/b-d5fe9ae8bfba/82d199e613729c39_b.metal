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
    float _92 = -_66;
    float _94 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _96 = 1.0 / _94;
    float _98 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _100 = precise::clamp(_98, 0.0, 1.0);
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
        float _186 = floor(_182);
        float _188 = float(_164);
        float _190 = float(_172);
        float _192 = fma(_62, _188, -0.5);
        float _194 = -_184;
        float _196 = _180 + _194;
        float _198 = fma(_64, _190, -0.5);
        float _200 = floor(_192);
        float _202 = -_196;
        float _204 = _202 + 1.0;
        float _206 = -_196;
        float _208 = _206 + 2.0;
        float _210 = _196 * _196;
        float _212 = -_186;
        float _214 = _182 + _212;
        float _216 = _204 * _204;
        float _218 = _208 * _208;
        float _220 = floor(_198);
        float _222 = -_214;
        float _224 = _222 + 1.0;
        float _226 = _204 * _216;
        float _228 = -_214;
        float _230 = _228 + 2.0;
        float _232 = _196 * _210;
        float _234 = _224 * _224;
        float _236 = _226 * 4.0;
        float _238 = 1.0 / _176;
        float _240 = _224 * _234;
        float _242 = -_236;
        float _244 = fma(_208, _218, _242);
        float _246 = -_226;
        float _248 = _246 + 6.0;
        float _250 = _230 * _230;
        float _252 = _240 * 4.0;
        float _254 = -_200;
        float _256 = _192 + _254;
        float _258 = -_244;
        float _260 = _258 + _248;
        float _262 = -_220;
        float _264 = _198 + _262;
        float _266 = -_252;
        float _268 = fma(_230, _250, _266);
        float _270 = -_256;
        float _272 = _270 + 1.0;
        float _274 = _260 * 0.16666667163372039794921875;
        float _276 = -_256;
        float _278 = _276 + 2.0;
        float _280 = -_240;
        float _282 = _280 + 6.0;
        float _284 = _272 * _272;
        float _286 = _226 + _244;
        float _288 = _278 * _278;
        float _290 = -_268;
        float _292 = _290 + _282;
        float _294 = _272 * _284;
        float _296 = -_264;
        float _298 = _296 + 1.0;
        float _300 = 1.0 / _274;
        float _302 = _292 * 0.16666667163372039794921875;
        float _304 = _294 * 4.0;
        float _306 = -_264;
        float _308 = _306 + 2.0;
        float _310 = _286 * 0.16666667163372039794921875;
        float _312 = -_304;
        float _314 = fma(_278, _288, _312);
        float _316 = -_294;
        float _318 = _316 + 6.0;
        float _320 = _298 * _298;
        float _322 = 1.0 / _302;
        float _324 = _294 + _314;
        float _326 = -_314;
        float _328 = _326 + _318;
        float _330 = _298 * _320;
        float _332 = _308 * _308;
        float _334 = _324 * 0.16666667163372039794921875;
        float _336 = _328 * 0.16666667163372039794921875;
        float _338 = _330 * 4.0;
        float _340 = 1.0 / _310;
        float _342 = _240 + _268;
        float _344 = -_330;
        float _346 = _344 + 6.0;
        float _348 = -_338;
        float _350 = fma(_308, _332, _348);
        float _352 = _232 * 0.16666667163372039794921875;
        float _354 = _342 * 0.16666667163372039794921875;
        float _356 = _184 + 1.5;
        float _358 = -_350;
        float _360 = _358 + _346;
        float _362 = _268 * 0.16666667163372039794921875;
        float _364 = 1.0 / _354;
        float _366 = fma(_352, _300, _356);
        float _368 = _360 * 0.16666667163372039794921875;
        float _370 = _184 + (-0.5);
        float _372 = _214 * _214;
        float _374 = _244 * 0.16666667163372039794921875;
        float _376 = _186 + 1.5;
        float _378 = _214 * _372;
        float _380 = fma(_374, _340, _370);
        float _382 = _186 + (-0.5);
        float _384 = _330 + _350;
        float _386 = 1.0 / _334;
        float _388 = _378 * 0.16666667163372039794921875;
        float _390 = _384 * 0.16666667163372039794921875;
        float _392 = fma(_362, _364, _382);
        float _394 = _256 * _256;
        float _396 = fma(_388, _322, _376);
        float _398 = _264 * _264;
        float _400 = 1.0 / _336;
        float _402 = _380 * _178;
        float _404 = _256 * _394;
        float _406 = _392 * _238;
        float _408 = _366 * _178;
        float _410 = _396 * _238;
        float _412 = _264 * _398;
        float _414 = _200 + (-0.5);
        float _416 = 1.0 / _368;
        float _418 = _220 + (-0.5);
        float _420 = _220 + 1.5;
        float _422 = _314 * 0.16666667163372039794921875;
        float _424 = _200 + 1.5;
        float _426 = _404 * 0.16666667163372039794921875;
        float _428 = _412 * 0.16666667163372039794921875;
        float _430 = fma(_422, _386, _414);
        float _432 = 1.0 / _188;
        float _434 = fma(_426, _400, _424);
        float _436 = _350 * 0.16666667163372039794921875;
        float _438 = 1.0 / _390;
        float _440 = fma(_428, _416, _420);
        float _442 = 1.0 / _190;
        float _444 = _430 * _432;
        float _446 = _434 * _432;
        float _448 = fma(_436, _438, _418);
        float2 _1210 = float2(_402, _406);
        float3 _452 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1210, float2(0.0), isnan(_1210)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1210, float2(0.0), isnan(_1210)), level(_130)).xyz;
        float _454 = _452.x;
        float _456 = _452.y;
        float _458 = _452.z;
        float2 _1225 = float2(_408, _406);
        float3 _460 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1225, float2(0.0), isnan(_1225)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1225, float2(0.0), isnan(_1225)), level(_130)).xyz;
        float _462 = _460.x;
        float _464 = _460.y;
        float _466 = _460.z;
        float _468 = _448 * _442;
        float _470 = _440 * _442;
        float2 _1246 = float2(_402, _410);
        float3 _472 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1246, float2(0.0), isnan(_1246)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1246, float2(0.0), isnan(_1246)), level(_130)).xyz;
        float _474 = _472.x;
        float _476 = _472.y;
        float _478 = _472.z;
        float2 _1261 = float2(_408, _410);
        float3 _480 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1261, float2(0.0), isnan(_1261)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1261, float2(0.0), isnan(_1261)), level(_130)).xyz;
        float _482 = _480.x;
        float _484 = _480.y;
        float _486 = _480.z;
        float2 _1276 = float2(_444, _468);
        float3 _488 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1276, float2(0.0), isnan(_1276)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1276, float2(0.0), isnan(_1276)), level(_136)).xyz;
        float _490 = _488.x;
        float _492 = _488.y;
        float _494 = _488.z;
        float2 _1291 = float2(_446, _468);
        float3 _496 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1291, float2(0.0), isnan(_1291)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1291, float2(0.0), isnan(_1291)), level(_136)).xyz;
        float _498 = _496.x;
        float _500 = _496.y;
        float _502 = _496.z;
        float2 _1306 = float2(_444, _470);
        float3 _504 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1306, float2(0.0), isnan(_1306)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1306, float2(0.0), isnan(_1306)), level(_136)).xyz;
        float _506 = _504.x;
        float _508 = _504.y;
        float _510 = _504.z;
        float2 _1321 = float2(_446, _470);
        float3 _512 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1321, float2(0.0), isnan(_1321)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1321, float2(0.0), isnan(_1321)), level(_136)).xyz;
        float _514 = _512.x;
        float _516 = _512.y;
        float _518 = _512.z;
        float _520 = -_130;
        float _522 = _124 + _520;
        float _524 = precise::clamp(_522, 0.0, 1.0);
        float _526 = -_462;
        float _528 = _454 + _526;
        float _530 = -_464;
        float _532 = _456 + _530;
        float _534 = -_466;
        float _536 = _458 + _534;
        float _538 = fma(_310, _528, _462);
        float _540 = fma(_310, _532, _464);
        float _542 = fma(_310, _536, _466);
        float _544 = -_482;
        float _546 = _474 + _544;
        float _548 = -_484;
        float _550 = _476 + _548;
        float _552 = fma(_310, _546, _482);
        float _554 = -_486;
        float _556 = _478 + _554;
        float _558 = fma(_310, _550, _484);
        float _560 = fma(_310, _556, _486);
        float _562 = -_558;
        float _564 = _562 + _540;
        float _566 = -_500;
        float _568 = _492 + _566;
        float _570 = -_498;
        float _572 = _490 + _570;
        float _574 = -_502;
        float _576 = _494 + _574;
        float _578 = fma(_354, _564, _558);
        float _580 = fma(_334, _568, _500);
        float _582 = -_514;
        float _584 = _506 + _582;
        float _586 = -_516;
        float _588 = _508 + _586;
        float _590 = -_518;
        float _592 = _510 + _590;
        float _594 = fma(_334, _572, _498);
        float _596 = fma(_334, _576, _502);
        float _598 = fma(_334, _584, _514);
        float _600 = fma(_334, _588, _516);
        float _602 = fma(_334, _592, _518);
        float _604 = -_552;
        float _606 = _604 + _538;
        float _608 = -_598;
        float _610 = _608 + _594;
        float _612 = -_560;
        float _614 = _612 + _542;
        float _616 = -_600;
        float _618 = _616 + _580;
        float _620 = -_602;
        float _622 = _620 + _596;
        float _624 = fma(_354, _606, _552);
        float _626 = fma(_390, _610, _598);
        float _628 = 0.0 + _122;
        float _630 = precise::clamp(_628, 0.0, 1.0);
        float _632 = fma(_354, _614, _560);
        float _634 = fma(_390, _618, _600);
        float _636 = fma(_390, _622, _602);
        float _638 = -_624;
        float _640 = _638 + _626;
        float _642 = fma(_88, _630, _86);
        float _644 = -_578;
        float _646 = _644 + _634;
        float _648 = -_632;
        float _650 = _648 + _636;
        float _652 = fma(_524, _640, _624);
        float _654 = 1.0 / _642;
        float _656 = fma(_524, _646, _578);
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

