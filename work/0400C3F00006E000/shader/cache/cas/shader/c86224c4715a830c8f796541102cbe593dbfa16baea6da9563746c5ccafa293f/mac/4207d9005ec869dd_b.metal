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
int _42(thread const int& _1652, thread const int& _1653, constant _10& support_buffer)
{
    int _1656 = 1 + _1653;
    float _1658 = support_buffer._m5[_1656].x;
    float _1660 = abs(_1658);
    bool _1662 = _1660 == 1.0;
    if (_1662)
    {
        return _1652;
    }
    float _1664 = float(_1652);
    float _1666 = _1664 / _1660;
    int _1668 = int(_1666);
    return _1668;
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
    float2 _738 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_738, float2(0.0), isnan(_738))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_738, float2(0.0), isnan(_738))).x;
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
    float _98 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _100 = precise::clamp(_98, 0.0, 1.0);
    float _102 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _104 = precise::clamp(_102, 0.0, 1.0);
    float _106 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _108 = precise::clamp(_106, 0.0, 1.0);
    float _110 = precise::max(_100, _104);
    float _112 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _114 = precise::clamp(_112, 0.0, 1.0);
    float _116 = precise::max(_110, _90);
    float _118 = precise::min(_108, _114);
    bool _122 = _116 != 0.0;
    bool _124 = isnan(_116);
    bool _126 = _122 || _124;
    bool _128 = isnan(0.0);
    bool _130 = _126 || _128;
    bool _132 = !_130;
    if (!_132)
    {
        float _134 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _136 = fma(_116, _134, 1.0);
        float _138 = log2(_136);
        float _140 = _138 + (-1.0);
        float _142 = trunc(_140);
        int _144 = int(_142);
        float _146 = float(_144);
        float _148 = trunc(_146);
        int _150 = int(_148);
        float _152 = _146 + 1.0;
        float _154 = trunc(_152);
        int _156 = int(_154);
        int _158 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_150), spvDescriptorSet0.fp_t_tcb_A.get_height(_150)).x;
        int _160 = _158;
        int _162 = 1;
        int _164 = _42(_160, _162, (*spvDescriptorSet0.support_buffer));
        int _166 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_150), spvDescriptorSet0.fp_t_tcb_A.get_height(_150)).y;
        int _168 = _166;
        int _170 = 1;
        int _172 = _42(_168, _170, (*spvDescriptorSet0.support_buffer));
        int _174 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_156), spvDescriptorSet0.fp_t_tcb_A.get_height(_156)).x;
        int _176 = _174;
        int _178 = 1;
        int _180 = _42(_176, _178, (*spvDescriptorSet0.support_buffer));
        int _182 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_156), spvDescriptorSet0.fp_t_tcb_A.get_height(_156)).y;
        int _184 = _182;
        int _186 = 1;
        int _188 = _42(_184, _186, (*spvDescriptorSet0.support_buffer));
        float _190 = float(_164);
        float _192 = float(_172);
        float _194 = 1.0 / _190;
        float _196 = fma(_62, _190, -0.5);
        float _198 = fma(_64, _192, -0.5);
        float _200 = floor(_196);
        float _202 = float(_180);
        float _204 = float(_188);
        float _206 = fma(_62, _202, -0.5);
        float _208 = floor(_198);
        float _210 = -_200;
        float _212 = _196 + _210;
        float _214 = floor(_206);
        float _216 = _200 + (-0.5);
        float _218 = -_212;
        float _220 = _218 + 1.0;
        float _222 = -_212;
        float _224 = _222 + 2.0;
        float _226 = _220 * _220;
        float _228 = _224 * _224;
        float _230 = -_208;
        float _232 = _198 + _230;
        float _234 = 1.0 / _192;
        float _236 = _220 * _226;
        float _238 = _236 * 4.0;
        float _240 = -_238;
        float _242 = fma(_224, _228, _240);
        float _244 = fma(_64, _204, -0.5);
        float _246 = -_236;
        float _248 = _246 + 6.0;
        float _250 = -_232;
        float _252 = _250 + 1.0;
        float _254 = -_232;
        float _256 = _254 + 2.0;
        float _258 = floor(_244);
        float _260 = -_242;
        float _262 = _260 + _248;
        float _264 = _252 * _252;
        float _266 = _256 * _256;
        float _268 = _262 * 0.16666667163372039794921875;
        float _270 = _212 * _212;
        float _272 = _252 * _264;
        float _274 = 1.0 / _204;
        float _276 = _212 * _270;
        float _278 = -_214;
        float _280 = _206 + _278;
        float _282 = _272 * 4.0;
        float _284 = _200 + 1.5;
        float _286 = -_280;
        float _288 = _286 + 1.0;
        float _290 = 1.0 / _268;
        float _292 = -_282;
        float _294 = fma(_256, _266, _292);
        float _296 = -_272;
        float _298 = _296 + 6.0;
        float _300 = _288 * _288;
        float _302 = _276 * 0.16666667163372039794921875;
        float _304 = -_258;
        float _306 = _244 + _304;
        float _308 = -_294;
        float _310 = _308 + _298;
        float _312 = _288 * _300;
        float _314 = 1.0 / _202;
        float _316 = -_306;
        float _318 = _316 + 1.0;
        float _320 = _312 * 4.0;
        float _322 = fma(_302, _290, _284);
        float _324 = -_280;
        float _326 = _324 + 2.0;
        float _328 = _236 + _242;
        float _330 = _310 * 0.16666667163372039794921875;
        float _332 = _318 * _318;
        float _334 = _326 * _326;
        float _336 = _328 * 0.16666667163372039794921875;
        float _338 = _242 * 0.16666667163372039794921875;
        float _340 = _318 * _332;
        float _342 = -_320;
        float _344 = fma(_326, _334, _342);
        float _346 = _272 + _294;
        float _348 = -_312;
        float _350 = _348 + 6.0;
        float _352 = -_306;
        float _354 = _352 + 2.0;
        float _356 = 1.0 / _336;
        float _358 = _346 * 0.16666667163372039794921875;
        float _360 = _340 * 4.0;
        float _362 = _354 * _354;
        float _364 = -_344;
        float _366 = _364 + _350;
        float _368 = _312 + _344;
        float _370 = _344 * 0.16666667163372039794921875;
        float _372 = -_360;
        float _374 = fma(_354, _362, _372);
        float _376 = 1.0 / _358;
        float _378 = _232 * _232;
        float _380 = -_340;
        float _382 = _380 + 6.0;
        float _384 = _340 + _374;
        float _386 = _208 + 1.5;
        float _388 = _232 * _378;
        float _390 = _368 * 0.16666667163372039794921875;
        float _392 = _208 + (-0.5);
        float _394 = 1.0 / _330;
        float _396 = fma(_338, _356, _216);
        float _398 = _294 * 0.16666667163372039794921875;
        float _400 = _388 * 0.16666667163372039794921875;
        float _402 = -_374;
        float _404 = _402 + _382;
        float _406 = _384 * 0.16666667163372039794921875;
        float _408 = _366 * 0.16666667163372039794921875;
        float _410 = _396 * _194;
        float _412 = 1.0 / _390;
        float _414 = fma(_398, _376, _392);
        float _416 = _404 * 0.16666667163372039794921875;
        float _418 = _306 * _306;
        float _420 = _322 * _194;
        float _422 = _414 * _234;
        float _424 = _306 * _418;
        float _426 = 1.0 / _406;
        float _428 = fma(_400, _394, _386);
        float _430 = _280 * _280;
        float _432 = _214 + (-0.5);
        float _434 = _214 + 1.5;
        float _436 = _428 * _234;
        float _438 = _280 * _430;
        float _440 = _258 + (-0.5);
        float _442 = 1.0 / _408;
        float _444 = _258 + 1.5;
        float _446 = _374 * 0.16666667163372039794921875;
        float _448 = fma(_370, _412, _432);
        float _450 = _438 * 0.16666667163372039794921875;
        float _452 = _424 * 0.16666667163372039794921875;
        float _454 = _448 * _314;
        float _456 = 1.0 / _416;
        float _458 = fma(_446, _426, _440);
        float _460 = _458 * _274;
        float _462 = fma(_450, _442, _434);
        float _464 = _462 * _314;
        float _466 = fma(_452, _456, _444);
        float2 _1259 = float2(_410, _422);
        float3 _470 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1259, float2(0.0), isnan(_1259)), level(_146)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1259, float2(0.0), isnan(_1259)), level(_146)).xyz;
        float _472 = _470.x;
        float _474 = _470.y;
        float _476 = _470.z;
        float2 _1274 = float2(_420, _422);
        float3 _478 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1274, float2(0.0), isnan(_1274)), level(_146)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1274, float2(0.0), isnan(_1274)), level(_146)).xyz;
        float _480 = _478.x;
        float _482 = _478.y;
        float _484 = _478.z;
        float _486 = _466 * _274;
        float2 _1292 = float2(_410, _436);
        float3 _488 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1292, float2(0.0), isnan(_1292)), level(_146)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1292, float2(0.0), isnan(_1292)), level(_146)).xyz;
        float _490 = _488.x;
        float _492 = _488.y;
        float _494 = _488.z;
        float2 _1307 = float2(_420, _436);
        float3 _496 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1307, float2(0.0), isnan(_1307)), level(_146)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1307, float2(0.0), isnan(_1307)), level(_146)).xyz;
        float _498 = _496.x;
        float _500 = _496.y;
        float _502 = _496.z;
        float2 _1322 = float2(_454, _460);
        float3 _504 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1322, float2(0.0), isnan(_1322)), level(_152)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1322, float2(0.0), isnan(_1322)), level(_152)).xyz;
        float _506 = _504.x;
        float _508 = _504.y;
        float _510 = _504.z;
        float2 _1337 = float2(_464, _460);
        float3 _512 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1337, float2(0.0), isnan(_1337)), level(_152)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1337, float2(0.0), isnan(_1337)), level(_152)).xyz;
        float _514 = _512.x;
        float _516 = _512.y;
        float _518 = _512.z;
        float2 _1352 = float2(_454, _486);
        float3 _520 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1352, float2(0.0), isnan(_1352)), level(_152)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1352, float2(0.0), isnan(_1352)), level(_152)).xyz;
        float _522 = _520.x;
        float _524 = _520.y;
        float _526 = _520.z;
        float2 _1367 = float2(_464, _486);
        float3 _528 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1367, float2(0.0), isnan(_1367)), level(_152)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1367, float2(0.0), isnan(_1367)), level(_152)).xyz;
        float _530 = _528.x;
        float _532 = _528.y;
        float _534 = _528.z;
        float _536 = -_146;
        float _538 = _140 + _536;
        float _540 = precise::clamp(_538, 0.0, 1.0);
        float _542 = 0.0 + _138;
        float _544 = precise::clamp(_542, 0.0, 1.0);
        float _546 = fma(_88, _544, _86);
        float _548 = _544 * _88;
        float _550 = -_480;
        float _552 = _472 + _550;
        float _554 = -_482;
        float _556 = _474 + _554;
        float _558 = -_484;
        float _560 = _476 + _558;
        float _562 = fma(_336, _552, _480);
        float _564 = -_514;
        float _566 = _506 + _564;
        float _568 = -_516;
        float _570 = _508 + _568;
        float _572 = -_498;
        float _574 = _490 + _572;
        float _576 = -_500;
        float _578 = _492 + _576;
        float _580 = -_502;
        float _582 = _494 + _580;
        float _584 = fma(_390, _566, _514);
        float _586 = -_518;
        float _588 = _510 + _586;
        float _590 = -_534;
        float _592 = _526 + _590;
        float _594 = fma(_390, _570, _516);
        float _596 = -_530;
        float _598 = _522 + _596;
        float _600 = fma(_336, _556, _482);
        float _602 = fma(_336, _560, _484);
        float _604 = fma(_336, _574, _498);
        float _606 = fma(_336, _578, _500);
        float _608 = -_532;
        float _610 = _524 + _608;
        float _612 = fma(_336, _582, _502);
        float _614 = fma(_390, _588, _518);
        float _616 = fma(_390, _592, _534);
        float _618 = fma(_390, _598, _530);
        float _620 = fma(_390, _610, _532);
        float _622 = -_612;
        float _624 = _622 + _602;
        float _626 = -_616;
        float _628 = _626 + _614;
        float _630 = -_604;
        float _632 = _630 + _562;
        float _634 = -_618;
        float _636 = _634 + _584;
        float _638 = -_620;
        float _640 = _638 + _594;
        float _642 = -_606;
        float _644 = _642 + _600;
        float _646 = fma(_358, _624, _612);
        float _648 = fma(_406, _628, _616);
        float _650 = fma(_358, _632, _604);
        float _652 = fma(_406, _636, _618);
        float _654 = fma(_406, _640, _620);
        float _656 = 1.0 / _546;
        float _658 = fma(_358, _644, _606);
        float _660 = -_646;
        float _662 = _660 + _648;
        float _664 = -_650;
        float _666 = _664 + _652;
        float _668 = -_658;
        float _670 = _668 + _654;
        float _672 = fma(_540, _662, _646);
        float _674 = fma(_540, _666, _650);
        float _676 = fma(_540, _670, _658);
        float _678 = -_672;
        float _680 = fma(_672, (*spvDescriptorSet0.fp_c3)._m0[13].z, _678);
        float _682 = -_674;
        float _684 = fma(_674, (*spvDescriptorSet0.fp_c3)._m0[13].x, _682);
        float _686 = -_676;
        float _688 = fma(_676, (*spvDescriptorSet0.fp_c3)._m0[13].y, _686);
        float _690 = fma(_118, _680, _672);
        float _692 = fma(_118, _684, _674);
        float _694 = _656 * _548;
        float _696 = fma(_118, _688, _676);
        float _698 = _690 * _548;
        float _700 = _692 * _694;
        float _702 = _696 * _694;
        float _704 = _698 * _656;
        out.m_36.x = _700;
        out.m_36.y = _702;
        out.m_36.z = _704;
        out.m_36.w = _546;
        return out;
    }
    out.m_36.x = 0.0;
    out.m_36.y = 0.0;
    out.m_36.z = 0.0;
    out.m_36.w = _86;
    return out;
}

