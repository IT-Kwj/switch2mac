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
int _42(thread const int& _1592, thread const int& _1593, constant _10& support_buffer)
{
    int _1596 = 1 + _1593;
    float _1598 = support_buffer._m5[_1596].x;
    float _1600 = abs(_1598);
    bool _1602 = _1600 == 1.0;
    if (_1602)
    {
        return _1592;
    }
    float _1604 = float(_1592);
    float _1606 = _1604 / _1600;
    int _1608 = int(_1606);
    return _1608;
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
    float2 _716 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_716, float2(0.0), isnan(_716))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_716, float2(0.0), isnan(_716))).x;
    float _68 = in.m_33.z;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_33.x;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_33.y;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = _60 * _72;
    float _88 = _60 * _78;
    float _90 = _60 * _84;
    float _92 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _94 = precise::clamp(_92, 0.0, 1.0);
    float _96 = precise::max(_94, _86);
    bool _100 = _96 != 0.0;
    bool _102 = isnan(_96);
    bool _104 = _100 || _102;
    bool _106 = isnan(0.0);
    bool _108 = _104 || _106;
    bool _110 = !_108;
    if (!_110)
    {
        float _112 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _114 = fma(_96, _112, 1.0);
        float _116 = log2(_114);
        float _118 = _116 + (-1.0);
        float _120 = trunc(_118);
        int _122 = int(_120);
        float _124 = float(_122);
        float _126 = trunc(_124);
        int _128 = int(_126);
        float _130 = _124 + 1.0;
        float _132 = trunc(_130);
        int _134 = int(_132);
        int _136 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_128), spvDescriptorSet0.fp_t_tcb_A.get_height(_128)).x;
        int _138 = _136;
        int _140 = 1;
        int _142 = _42(_138, _140, (*spvDescriptorSet0.support_buffer));
        int _144 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_128), spvDescriptorSet0.fp_t_tcb_A.get_height(_128)).y;
        int _146 = _144;
        int _148 = 1;
        int _150 = _42(_146, _148, (*spvDescriptorSet0.support_buffer));
        int _152 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_134), spvDescriptorSet0.fp_t_tcb_A.get_height(_134)).x;
        int _154 = _152;
        int _156 = 1;
        int _158 = _42(_154, _156, (*spvDescriptorSet0.support_buffer));
        int _160 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_134), spvDescriptorSet0.fp_t_tcb_A.get_height(_134)).y;
        int _162 = _160;
        int _164 = 1;
        int _166 = _42(_162, _164, (*spvDescriptorSet0.support_buffer));
        float _168 = float(_142);
        float _170 = float(_150);
        float _172 = 1.0 / _168;
        float _174 = fma(_62, _168, -0.5);
        float _176 = fma(_64, _170, -0.5);
        float _178 = floor(_174);
        float _180 = floor(_176);
        float _182 = float(_158);
        float _184 = float(_166);
        float _186 = fma(_62, _182, -0.5);
        float _188 = -_178;
        float _190 = _174 + _188;
        float _192 = fma(_64, _184, -0.5);
        float _194 = floor(_186);
        float _196 = -_190;
        float _198 = _196 + 1.0;
        float _200 = -_190;
        float _202 = _200 + 2.0;
        float _204 = _190 * _190;
        float _206 = -_180;
        float _208 = _176 + _206;
        float _210 = _198 * _198;
        float _212 = _202 * _202;
        float _214 = floor(_192);
        float _216 = -_208;
        float _218 = _216 + 1.0;
        float _220 = _198 * _210;
        float _222 = -_208;
        float _224 = _222 + 2.0;
        float _226 = _190 * _204;
        float _228 = _218 * _218;
        float _230 = _220 * 4.0;
        float _232 = 1.0 / _170;
        float _234 = _218 * _228;
        float _236 = -_230;
        float _238 = fma(_202, _212, _236);
        float _240 = -_220;
        float _242 = _240 + 6.0;
        float _244 = _224 * _224;
        float _246 = _234 * 4.0;
        float _248 = -_194;
        float _250 = _186 + _248;
        float _252 = -_238;
        float _254 = _252 + _242;
        float _256 = -_214;
        float _258 = _192 + _256;
        float _260 = -_246;
        float _262 = fma(_224, _244, _260);
        float _264 = -_250;
        float _266 = _264 + 1.0;
        float _268 = _254 * 0.16666667163372039794921875;
        float _270 = -_250;
        float _272 = _270 + 2.0;
        float _274 = -_234;
        float _276 = _274 + 6.0;
        float _278 = _266 * _266;
        float _280 = _220 + _238;
        float _282 = _272 * _272;
        float _284 = -_262;
        float _286 = _284 + _276;
        float _288 = _266 * _278;
        float _290 = -_258;
        float _292 = _290 + 1.0;
        float _294 = 1.0 / _268;
        float _296 = _286 * 0.16666667163372039794921875;
        float _298 = _288 * 4.0;
        float _300 = -_258;
        float _302 = _300 + 2.0;
        float _304 = _280 * 0.16666667163372039794921875;
        float _306 = -_298;
        float _308 = fma(_272, _282, _306);
        float _310 = -_288;
        float _312 = _310 + 6.0;
        float _314 = _292 * _292;
        float _316 = 1.0 / _296;
        float _318 = _288 + _308;
        float _320 = -_308;
        float _322 = _320 + _312;
        float _324 = _292 * _314;
        float _326 = _302 * _302;
        float _328 = _318 * 0.16666667163372039794921875;
        float _330 = _322 * 0.16666667163372039794921875;
        float _332 = _324 * 4.0;
        float _334 = 1.0 / _304;
        float _336 = _234 + _262;
        float _338 = -_324;
        float _340 = _338 + 6.0;
        float _342 = -_332;
        float _344 = fma(_302, _326, _342);
        float _346 = _226 * 0.16666667163372039794921875;
        float _348 = _336 * 0.16666667163372039794921875;
        float _350 = _178 + 1.5;
        float _352 = -_344;
        float _354 = _352 + _340;
        float _356 = _262 * 0.16666667163372039794921875;
        float _358 = 1.0 / _348;
        float _360 = fma(_346, _294, _350);
        float _362 = _354 * 0.16666667163372039794921875;
        float _364 = _178 + (-0.5);
        float _366 = _208 * _208;
        float _368 = _238 * 0.16666667163372039794921875;
        float _370 = _180 + 1.5;
        float _372 = _208 * _366;
        float _374 = fma(_368, _334, _364);
        float _376 = _180 + (-0.5);
        float _378 = _324 + _344;
        float _380 = 1.0 / _328;
        float _382 = _372 * 0.16666667163372039794921875;
        float _384 = _378 * 0.16666667163372039794921875;
        float _386 = fma(_356, _358, _376);
        float _388 = _250 * _250;
        float _390 = fma(_382, _316, _370);
        float _392 = _258 * _258;
        float _394 = 1.0 / _330;
        float _396 = _374 * _172;
        float _398 = _250 * _388;
        float _400 = _386 * _232;
        float _402 = _360 * _172;
        float _404 = _390 * _232;
        float _406 = _258 * _392;
        float _408 = _194 + (-0.5);
        float _410 = 1.0 / _362;
        float _412 = _214 + (-0.5);
        float _414 = _214 + 1.5;
        float _416 = _308 * 0.16666667163372039794921875;
        float _418 = _194 + 1.5;
        float _420 = _398 * 0.16666667163372039794921875;
        float _422 = _406 * 0.16666667163372039794921875;
        float _424 = fma(_416, _380, _408);
        float _426 = 1.0 / _182;
        float _428 = fma(_420, _394, _418);
        float _430 = _344 * 0.16666667163372039794921875;
        float _432 = 1.0 / _384;
        float _434 = fma(_422, _410, _414);
        float _436 = 1.0 / _184;
        float _438 = _424 * _426;
        float _440 = _428 * _426;
        float _442 = fma(_430, _432, _412);
        float2 _1193 = float2(_396, _400);
        float3 _446 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1193, float2(0.0), isnan(_1193)), level(_124)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1193, float2(0.0), isnan(_1193)), level(_124)).xyz;
        float _448 = _446.x;
        float _450 = _446.y;
        float _452 = _446.z;
        float2 _1208 = float2(_402, _400);
        float3 _454 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1208, float2(0.0), isnan(_1208)), level(_124)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1208, float2(0.0), isnan(_1208)), level(_124)).xyz;
        float _456 = _454.x;
        float _458 = _454.y;
        float _460 = _454.z;
        float _462 = _442 * _436;
        float _464 = _434 * _436;
        float2 _1229 = float2(_396, _404);
        float3 _466 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1229, float2(0.0), isnan(_1229)), level(_124)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1229, float2(0.0), isnan(_1229)), level(_124)).xyz;
        float _468 = _466.x;
        float _470 = _466.y;
        float _472 = _466.z;
        float2 _1244 = float2(_402, _404);
        float3 _474 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1244, float2(0.0), isnan(_1244)), level(_124)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1244, float2(0.0), isnan(_1244)), level(_124)).xyz;
        float _476 = _474.x;
        float _478 = _474.y;
        float _480 = _474.z;
        float2 _1259 = float2(_438, _462);
        float3 _482 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1259, float2(0.0), isnan(_1259)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1259, float2(0.0), isnan(_1259)), level(_130)).xyz;
        float _484 = _482.x;
        float _486 = _482.y;
        float _488 = _482.z;
        float2 _1274 = float2(_440, _462);
        float3 _490 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1274, float2(0.0), isnan(_1274)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1274, float2(0.0), isnan(_1274)), level(_130)).xyz;
        float _492 = _490.x;
        float _494 = _490.y;
        float _496 = _490.z;
        float2 _1289 = float2(_438, _464);
        float3 _498 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1289, float2(0.0), isnan(_1289)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1289, float2(0.0), isnan(_1289)), level(_130)).xyz;
        float _500 = _498.x;
        float _502 = _498.y;
        float _504 = _498.z;
        float2 _1304 = float2(_440, _464);
        float3 _506 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1304, float2(0.0), isnan(_1304)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1304, float2(0.0), isnan(_1304)), level(_130)).xyz;
        float _508 = _506.x;
        float _510 = _506.y;
        float _512 = _506.z;
        float _514 = -_124;
        float _516 = _118 + _514;
        float _518 = precise::clamp(_516, 0.0, 1.0);
        float _520 = -_456;
        float _522 = _448 + _520;
        float _524 = -_458;
        float _526 = _450 + _524;
        float _528 = -_460;
        float _530 = _452 + _528;
        float _532 = fma(_304, _522, _456);
        float _534 = fma(_304, _526, _458);
        float _536 = fma(_304, _530, _460);
        float _538 = -_476;
        float _540 = _468 + _538;
        float _542 = -_478;
        float _544 = _470 + _542;
        float _546 = fma(_304, _540, _476);
        float _548 = -_480;
        float _550 = _472 + _548;
        float _552 = fma(_304, _544, _478);
        float _554 = fma(_304, _550, _480);
        float _556 = -_552;
        float _558 = _556 + _534;
        float _560 = -_494;
        float _562 = _486 + _560;
        float _564 = -_492;
        float _566 = _484 + _564;
        float _568 = -_496;
        float _570 = _488 + _568;
        float _572 = fma(_348, _558, _552);
        float _574 = fma(_328, _562, _494);
        float _576 = -_508;
        float _578 = _500 + _576;
        float _580 = -_510;
        float _582 = _502 + _580;
        float _584 = -_512;
        float _586 = _504 + _584;
        float _588 = fma(_328, _566, _492);
        float _590 = fma(_328, _570, _496);
        float _592 = fma(_328, _578, _508);
        float _594 = fma(_328, _582, _510);
        float _596 = fma(_328, _586, _512);
        float _598 = -_546;
        float _600 = _598 + _532;
        float _602 = -_592;
        float _604 = _602 + _588;
        float _606 = -_554;
        float _608 = _606 + _536;
        float _610 = -_594;
        float _612 = _610 + _574;
        float _614 = -_596;
        float _616 = _614 + _590;
        float _618 = fma(_348, _600, _546);
        float _620 = fma(_384, _604, _592);
        float _622 = 0.0 + _116;
        float _624 = precise::clamp(_622, 0.0, 1.0);
        float _626 = fma(_348, _608, _554);
        float _628 = fma(_384, _612, _594);
        float _630 = fma(_384, _616, _596);
        float _632 = -_618;
        float _634 = _632 + _620;
        float _636 = fma(_90, _624, _88);
        float _638 = -_572;
        float _640 = _638 + _628;
        float _642 = -_626;
        float _644 = _642 + _630;
        float _646 = fma(_518, _634, _618);
        float _648 = 1.0 / _636;
        float _650 = fma(_518, _640, _572);
        float _652 = fma(_518, _644, _626);
        float _654 = _624 * _646;
        float _656 = _624 * _650;
        float _658 = _624 * _652;
        float _660 = -_654;
        float _662 = _660 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
        float _664 = -_656;
        float _666 = _664 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
        float _668 = -_658;
        float _670 = _668 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
        float _672 = fma(_88, _662, _654);
        float _674 = fma(_88, _666, _656);
        float _676 = fma(_88, _670, _658);
        float _678 = _672 * _648;
        float _680 = _674 * _648;
        float _682 = _676 * _648;
        out.m_36.x = _678;
        out.m_36.y = _680;
        out.m_36.z = _682;
        out.m_36.w = _636;
        return out;
    }
    out.m_36.x = (*spvDescriptorSet0.fp_c3)._m0[12].x;
    out.m_36.y = (*spvDescriptorSet0.fp_c3)._m0[12].y;
    out.m_36.z = (*spvDescriptorSet0.fp_c3)._m0[12].z;
    out.m_36.w = _88;
    return out;
}

