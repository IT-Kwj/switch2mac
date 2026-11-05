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
    float4 m_36 [[user(locn1)]];
};

static inline __attribute__((always_inline))
int _42(thread const int& _1634, thread const int& _1635, constant _10& support_buffer)
{
    int _1638 = 1 + _1635;
    float _1640 = support_buffer._m5[_1638].x;
    float _1642 = abs(_1640);
    bool _1644 = _1642 == 1.0;
    if (_1644)
    {
        return _1634;
    }
    float _1646 = float(_1634);
    float _1648 = _1646 / _1642;
    int _1650 = int(_1648);
    return _1650;
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
    float2 _728 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_728, float2(0.0), isnan(_728))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_728, float2(0.0), isnan(_728))).x;
    bool _70 = _66 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_70)
    {
        discard_fragment();
    }
    if (_70)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return out;
    }
    float _72 = in.m_36.z;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_36.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_36.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _92 = precise::clamp(_90, 0.0, 1.0);
    float _94 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _96 = precise::clamp(_94, 0.0, 1.0);
    float _98 = _60 * _76;
    float _100 = _60 * _82;
    float _102 = _60 * _88;
    float _104 = precise::max(_92, _98);
    bool _106 = _104 != 0.0;
    bool _108 = isnan(_104);
    bool _110 = _106 || _108;
    bool _112 = isnan(0.0);
    bool _114 = _110 || _112;
    float _116 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _118 = precise::clamp(_116, 0.0, 1.0);
    float _120 = precise::min(_96, _118);
    bool _122 = !_114;
    if (!_122)
    {
        float _124 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _126 = fma(_104, _124, 1.0);
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
        float _192 = float(_170);
        float _194 = float(_178);
        float _196 = fma(_62, _192, -0.5);
        float _198 = floor(_188);
        float _200 = -_190;
        float _202 = _186 + _200;
        float _204 = floor(_196);
        float _206 = _190 + (-0.5);
        float _208 = -_202;
        float _210 = _208 + 1.0;
        float _212 = -_202;
        float _214 = _212 + 2.0;
        float _216 = _210 * _210;
        float _218 = _214 * _214;
        float _220 = -_198;
        float _222 = _188 + _220;
        float _224 = 1.0 / _182;
        float _226 = _210 * _216;
        float _228 = _226 * 4.0;
        float _230 = -_228;
        float _232 = fma(_214, _218, _230);
        float _234 = fma(_64, _194, -0.5);
        float _236 = -_226;
        float _238 = _236 + 6.0;
        float _240 = -_222;
        float _242 = _240 + 1.0;
        float _244 = -_222;
        float _246 = _244 + 2.0;
        float _248 = floor(_234);
        float _250 = -_232;
        float _252 = _250 + _238;
        float _254 = _242 * _242;
        float _256 = _246 * _246;
        float _258 = _252 * 0.16666667163372039794921875;
        float _260 = _202 * _202;
        float _262 = _242 * _254;
        float _264 = 1.0 / _194;
        float _266 = _202 * _260;
        float _268 = -_204;
        float _270 = _196 + _268;
        float _272 = _262 * 4.0;
        float _274 = _190 + 1.5;
        float _276 = -_270;
        float _278 = _276 + 1.0;
        float _280 = 1.0 / _258;
        float _282 = -_272;
        float _284 = fma(_246, _256, _282);
        float _286 = -_262;
        float _288 = _286 + 6.0;
        float _290 = _278 * _278;
        float _292 = _266 * 0.16666667163372039794921875;
        float _294 = -_248;
        float _296 = _234 + _294;
        float _298 = -_284;
        float _300 = _298 + _288;
        float _302 = _278 * _290;
        float _304 = 1.0 / _192;
        float _306 = -_296;
        float _308 = _306 + 1.0;
        float _310 = _302 * 4.0;
        float _312 = fma(_292, _280, _274);
        float _314 = -_270;
        float _316 = _314 + 2.0;
        float _318 = _226 + _232;
        float _320 = _300 * 0.16666667163372039794921875;
        float _322 = _308 * _308;
        float _324 = _316 * _316;
        float _326 = _318 * 0.16666667163372039794921875;
        float _328 = _232 * 0.16666667163372039794921875;
        float _330 = _308 * _322;
        float _332 = -_310;
        float _334 = fma(_316, _324, _332);
        float _336 = _262 + _284;
        float _338 = -_302;
        float _340 = _338 + 6.0;
        float _342 = -_296;
        float _344 = _342 + 2.0;
        float _346 = 1.0 / _326;
        float _348 = _336 * 0.16666667163372039794921875;
        float _350 = _330 * 4.0;
        float _352 = _344 * _344;
        float _354 = -_334;
        float _356 = _354 + _340;
        float _358 = _302 + _334;
        float _360 = _334 * 0.16666667163372039794921875;
        float _362 = -_350;
        float _364 = fma(_344, _352, _362);
        float _366 = 1.0 / _348;
        float _368 = _222 * _222;
        float _370 = -_330;
        float _372 = _370 + 6.0;
        float _374 = _330 + _364;
        float _376 = _198 + 1.5;
        float _378 = _222 * _368;
        float _380 = _358 * 0.16666667163372039794921875;
        float _382 = _198 + (-0.5);
        float _384 = 1.0 / _320;
        float _386 = fma(_328, _346, _206);
        float _388 = _284 * 0.16666667163372039794921875;
        float _390 = _378 * 0.16666667163372039794921875;
        float _392 = -_364;
        float _394 = _392 + _372;
        float _396 = _374 * 0.16666667163372039794921875;
        float _398 = _356 * 0.16666667163372039794921875;
        float _400 = _386 * _184;
        float _402 = 1.0 / _380;
        float _404 = fma(_388, _366, _382);
        float _406 = _394 * 0.16666667163372039794921875;
        float _408 = _296 * _296;
        float _410 = _312 * _184;
        float _412 = _404 * _224;
        float _414 = _296 * _408;
        float _416 = 1.0 / _396;
        float _418 = fma(_390, _384, _376);
        float _420 = _270 * _270;
        float _422 = _204 + (-0.5);
        float _424 = _204 + 1.5;
        float _426 = _418 * _224;
        float _428 = _270 * _420;
        float _430 = _248 + (-0.5);
        float _432 = 1.0 / _398;
        float _434 = _248 + 1.5;
        float _436 = _364 * 0.16666667163372039794921875;
        float _438 = fma(_360, _402, _422);
        float _440 = _428 * 0.16666667163372039794921875;
        float _442 = _414 * 0.16666667163372039794921875;
        float _444 = _438 * _304;
        float _446 = 1.0 / _406;
        float _448 = fma(_436, _416, _430);
        float _450 = _448 * _264;
        float _452 = fma(_440, _432, _424);
        float _454 = _452 * _304;
        float _456 = fma(_442, _446, _434);
        float2 _1242 = float2(_400, _412);
        float3 _460 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1242, float2(0.0), isnan(_1242)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1242, float2(0.0), isnan(_1242)), level(_136)).xyz;
        float _462 = _460.x;
        float _464 = _460.y;
        float _466 = _460.z;
        float2 _1257 = float2(_410, _412);
        float3 _468 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1257, float2(0.0), isnan(_1257)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1257, float2(0.0), isnan(_1257)), level(_136)).xyz;
        float _470 = _468.x;
        float _472 = _468.y;
        float _474 = _468.z;
        float _476 = _456 * _264;
        float2 _1275 = float2(_400, _426);
        float3 _478 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1275, float2(0.0), isnan(_1275)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1275, float2(0.0), isnan(_1275)), level(_136)).xyz;
        float _480 = _478.x;
        float _482 = _478.y;
        float _484 = _478.z;
        float2 _1290 = float2(_410, _426);
        float3 _486 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1290, float2(0.0), isnan(_1290)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1290, float2(0.0), isnan(_1290)), level(_136)).xyz;
        float _488 = _486.x;
        float _490 = _486.y;
        float _492 = _486.z;
        float2 _1305 = float2(_444, _450);
        float3 _494 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1305, float2(0.0), isnan(_1305)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1305, float2(0.0), isnan(_1305)), level(_142)).xyz;
        float _496 = _494.x;
        float _498 = _494.y;
        float _500 = _494.z;
        float2 _1320 = float2(_454, _450);
        float3 _502 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1320, float2(0.0), isnan(_1320)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1320, float2(0.0), isnan(_1320)), level(_142)).xyz;
        float _504 = _502.x;
        float _506 = _502.y;
        float _508 = _502.z;
        float2 _1335 = float2(_444, _476);
        float3 _510 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1335, float2(0.0), isnan(_1335)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1335, float2(0.0), isnan(_1335)), level(_142)).xyz;
        float _512 = _510.x;
        float _514 = _510.y;
        float _516 = _510.z;
        float2 _1350 = float2(_454, _476);
        float3 _518 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1350, float2(0.0), isnan(_1350)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1350, float2(0.0), isnan(_1350)), level(_142)).xyz;
        float _520 = _518.x;
        float _522 = _518.y;
        float _524 = _518.z;
        float _526 = -_136;
        float _528 = _130 + _526;
        float _530 = precise::clamp(_528, 0.0, 1.0);
        float _532 = 0.0 + _128;
        float _534 = precise::clamp(_532, 0.0, 1.0);
        float _536 = fma(_102, _534, _100);
        float _538 = _534 * _102;
        float _540 = -_470;
        float _542 = _462 + _540;
        float _544 = -_472;
        float _546 = _464 + _544;
        float _548 = -_474;
        float _550 = _466 + _548;
        float _552 = fma(_326, _542, _470);
        float _554 = -_504;
        float _556 = _496 + _554;
        float _558 = -_506;
        float _560 = _498 + _558;
        float _562 = -_488;
        float _564 = _480 + _562;
        float _566 = -_490;
        float _568 = _482 + _566;
        float _570 = -_492;
        float _572 = _484 + _570;
        float _574 = fma(_380, _556, _504);
        float _576 = -_508;
        float _578 = _500 + _576;
        float _580 = -_524;
        float _582 = _516 + _580;
        float _584 = fma(_380, _560, _506);
        float _586 = -_520;
        float _588 = _512 + _586;
        float _590 = fma(_326, _546, _472);
        float _592 = fma(_326, _550, _474);
        float _594 = fma(_326, _564, _488);
        float _596 = fma(_326, _568, _490);
        float _598 = -_522;
        float _600 = _514 + _598;
        float _602 = fma(_326, _572, _492);
        float _604 = fma(_380, _578, _508);
        float _606 = fma(_380, _582, _524);
        float _608 = fma(_380, _588, _520);
        float _610 = fma(_380, _600, _522);
        float _612 = -_602;
        float _614 = _612 + _592;
        float _616 = -_606;
        float _618 = _616 + _604;
        float _620 = -_594;
        float _622 = _620 + _552;
        float _624 = -_608;
        float _626 = _624 + _574;
        float _628 = -_610;
        float _630 = _628 + _584;
        float _632 = -_596;
        float _634 = _632 + _590;
        float _636 = fma(_348, _614, _602);
        float _638 = fma(_396, _618, _606);
        float _640 = fma(_348, _622, _594);
        float _642 = fma(_396, _626, _608);
        float _644 = fma(_396, _630, _610);
        float _646 = 1.0 / _536;
        float _648 = fma(_348, _634, _596);
        float _650 = -_636;
        float _652 = _650 + _638;
        float _654 = -_640;
        float _656 = _654 + _642;
        float _658 = -_648;
        float _660 = _658 + _644;
        float _662 = fma(_530, _652, _636);
        float _664 = fma(_530, _656, _640);
        float _666 = fma(_530, _660, _648);
        float _668 = -_662;
        float _670 = fma(_662, (*spvDescriptorSet0.fp_c3)._m0[13].z, _668);
        float _672 = -_664;
        float _674 = fma(_664, (*spvDescriptorSet0.fp_c3)._m0[13].x, _672);
        float _676 = -_666;
        float _678 = fma(_666, (*spvDescriptorSet0.fp_c3)._m0[13].y, _676);
        float _680 = fma(_120, _670, _662);
        float _682 = fma(_120, _674, _664);
        float _684 = _646 * _538;
        float _686 = fma(_120, _678, _666);
        float _688 = _680 * _538;
        float _690 = _682 * _684;
        float _692 = _686 * _684;
        float _694 = _688 * _646;
        out.m_34.x = _690;
        out.m_34.y = _692;
        out.m_34.z = _694;
        out.m_34.w = _536;
        return out;
    }
    out.m_34.x = 0.0;
    out.m_34.y = 0.0;
    out.m_34.z = 0.0;
    out.m_34.w = _100;
    return out;
}

